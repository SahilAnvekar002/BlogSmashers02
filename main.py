from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from flask_mail import Mail
import os
from werkzeug.utils import secure_filename
import math

with open('./config.json') as f:
    params = json.load(f)['params']

local_server = True
app = Flask(__name__)

app.secret_key = params['secret_key']
app.config['UPLOAD_FOLDER'] = params['upload_path']

app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_username'],
    MAIL_PASSWORD = params['gmail_password'],
)

mail = Mail(app)

if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']

db = SQLAlchemy()
db.init_app(app)

class Contacts(db.Model):
    userid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False, unique=True )
    phone_no = db.Column(db.String, nullable=False, unique=True)
    message = db.Column(db.String, nullable=False)
    date = db.Column(db.Date, nullable=True)

class Posts(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String)
    subtitle = db.Column(db.String)
    slug = db.Column(db.String)
    content = db.Column(db.String)
    subcontent = db.Column(db.String)
    img_uri = db.Column(db.String)
    bg_img_uri = db.Column(db.String)
    date = db.Column(db.Date)

@app.route('/')
def home():
    posts = Posts.query.all()
    total_pages = math.floor(len(posts)/2)

    page = request.args.get('page')

    if (not str(page).isnumeric()):
        page = 0
    else:
        page = int(page)

    posts = posts[page*2: (page*2)+2]
    
    if page == 0:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page == total_pages:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)

    return render_template('index.html', params = params, posts=posts, prev=prev, next=next)

@app.route('/about')
def about():
    return render_template('about.html', params = params)

@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, email=email, phone_no=phone, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('BlogSmashers Message from '+ name, sender = email, recipients=[params['gmail_username']], body= message + '\n'+ phone+ '\n'+ email)
        return render_template('contact.html', params = params)

    return render_template('contact.html', params = params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def post(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params = params, post=post)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] ==  params['admin_username']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if username == params['admin_username'] and password == params['admin_password']:
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            return render_template('signup.html', params=params)

    return render_template('signup.html', params=params)

@app.route('/edit/<string:post_id>', methods=['POST', 'GET'])
def edit(post_id):
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            title = request.form.get('title')
            subtitle = request.form.get('subtitle')
            slug = request.form.get('slug')
            content = request.form.get('content')
            subcontent = request.form.get('subcontent')
            img_uri = request.form.get('imguri')
            bg_img_uri = request.form.get('bgimguri')

            if post_id == '0':
                new_post = Posts(title=title, subtitle=subtitle, slug=slug, content=content, subcontent=subcontent, img_uri=img_uri, bg_img_uri=bg_img_uri, date= datetime.now())
                db.session.add(new_post)
                db.session.commit()
            else:
                update_post = Posts.query.filter_by(id=post_id).first()
                update_post.title = title
                update_post.subtitle = subtitle
                update_post.slug = slug
                update_post.content = content
                update_post.subcontent = subcontent
                update_post.img_uri = img_uri
                update_post.bg_img_uri = bg_img_uri
                db.session.commit()
                return redirect('/edit/'+post_id)  
        
        post = Posts.query.filter_by(id=post_id).first()
        return render_template('edit.html', params=params, post= post)    

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            file = request.files['file']
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file.filename)))
            return "Uploaded Succesfully"

@app.route('/logout', methods=['GET'])
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/delete/<string:post_id>', methods=['GET'])
def delete(post_id):
    if 'user' in session and session['user'] == params['admin_username']:
        post = Posts.query.filter_by(id=post_id).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')

app.run(debug=True)