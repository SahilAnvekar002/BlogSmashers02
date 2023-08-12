-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2023 at 10:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogsmashers`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `userid` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`userid`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'sahil', 'sanvekar108@gmail.com', '8459723961', 'Hello Nice work', '2023-08-10 18:26:55'),
(2, 'sa', 'sa@gmail.com', '8459723961', 'Hello bro', '2023-08-11 13:01:48'),
(3, 'sa', 'sahilanvekar0@gmail.com', '8459723961', 'Hello bro', '2023-08-11 13:03:06'),
(4, 'sa', 'sanvekar108@gmail.com', '8459723961', 'Hello bro', '2023-08-11 13:06:22'),
(5, 'sa', 'sanvekar108@gmail.com', '8459723961', 'Hello bro', '2023-08-11 13:12:55'),
(6, 'mahesh', 'mahesh@gmail.com', '8459723961', 'Hello', '2023-08-11 13:14:32'),
(7, 'mahesh', 'mahesh@gmail.com', '8459723961', 'Hello', '2023-08-11 13:23:07'),
(8, 'SNEHA', 'sneha@gmail.com', '8459723961', 'Nice work', '2023-08-11 13:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `subcontent` text NOT NULL,
  `img_uri` varchar(255) NOT NULL,
  `bg_img_uri` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `subtitle`, `slug`, `content`, `subcontent`, `img_uri`, `bg_img_uri`, `date`) VALUES
(1, 'Redmi Note 12 Pro 5G Introduces 12GB+256GB Variant in India', 'Chinese smartphone maker Xiaomi is known for offering a wide range of smartphones in India', 'Redmi-Note-12-Pro-5G-Introduces-12GB+256GB-Variant-in-India', 'Chinese smartphone maker Xiaomi is known for offering a wide range of smartphones in India, and it seems the company is not ready to stop anytime soon. Starting today the brand has launched a new variant of Redmi Note 12 Pro 5G smartphone in the country. Back in January, the handset was launched in three different configurations, and now a new 12GB RAM and 256GB storage model goes official in India. Check out price, specifications, features, and availability here.\r\n<br><br>\r\nThe newly launched Redmi Note 12 Pro with 5G 12GB+256GB storage model is available for sale in India at Rs 28,999. The recently introduced highest-capacity storage version of the phone is now accessible through the company\'s official website, brick-and-mortar retail outlets, as well as the prominent e-commerce platform Flipkart.', 'It\'s important to mention that the 6GB+128GB storage variant was released at a price of Rs 24,999, while the 8GB+128GB configuration is available for Rs 26,999, and the 8GB+256GB model can be obtained for Rs 27,999.\r\n<br><br>\r\nExcept for the RAM and storage configuration, the smartphone didn\'t witness any other change in terms of specifications. It still arrives with a 6.7-inch AMOLED display with a 120Hz refresh rate. There is a punch-hole cutout design to make some room for the 16-megapixel selfie camera sensor.\r\n<br><br>\r\nTalking about the camera setup, the Redmi Note 12 Pro offers a trio of lenses at the back that consists of a 50-megapixel main camera, an 8-megapixel lens, and a 2-megapixel sensor along with an LED flash.\r\n<br><br>\r\nUnder the hood, the Redmi Note 12 Pro 5G houses a MediaTek Dimensity 1080 chipset and packs a gigantic 5,000mAh battery with 67W Turbo Charge technology.', 'post-sample-image.jpg', 'post-bg.jpg', '2023-08-11 13:35:38'),
(2, 'Hackers Rig Casino Card-Shuffling Machines', 'Security researchers accessed an internal camera inside the Deckmate 2 shuffler to learn the exact deck order—and the hand of every player at a poker table.', 'Hackers-Rig-Casino-Card-Shuffling-Machines', 'IN SEPTEMBER LAST year, a scandal blew up the world of high-stakes, livestreamed poker: In a hand at Los Angeles\' Hustler Live Casino, which broadcast its games on YouTube, a relative novice holding nothing but a jack of clubs and a four of hearts successfully called the bluff of a veteran player. No one could possibly think that poor hand might be good enough to call a bluff, thousands of outraged poker players argued, unless the person holding it had some extra knowledge that her opponent\'s hand was even worse—in other words, she must have been cheating.', 'Three months later, Hustler Live Casino published a postmortem of its investigation into the incident, finding “no credible evidence” of foul play. It also noted that if there were cheating, it was most likely some sort of secret communication between the player and a staff member in the production booth who could see the players\' hands in real time. But when Joseph Tartaro, a researcher and consultant with security firm IOActive, read that report, he zeroed in on one claim in particular—a statement ruling out any possibility that the automated card-shuffling machine used at the table, a device known as the Deckmate, could have been hacked. “The Deckmate shuffling machine is secure and cannot be compromised,” the report read.\r\n<br><br>\r\nTo Tartaro, regardless of what happened in the Hustler Live hand, that assertion of the shuffler\'s perfect security was an irresistible invitation to prove otherwise. “At that point, it\'s a challenge,” Tartaro says. “Let\'s look at one of these things and see how realistic it really is to cheat.”', '1.webp', '2.webp', '2023-08-11 17:41:34'),
(3, 'Grimes on Living Forever, Dying on Mars', 'Grimes on Living Forever, Dying on Mars and competing with Elon Musk.', 'Grimes-on-Living-Forever-Dying-on-Mars', 'I THOUGHT MY interview with Grimes—the mysterious techno artist, fan of all nerddom, and the deepest of insiders in Elon Musk’s world—would be one-on-one. Instead it wound up as a roundtable discussion. Turns out there are multiple personas embedded in the surprisingly haimish human who sat under a tree with me and spent the waning hours of an afternoon in conversation.\r\n<br><br>\r\nThere was Claire Boucher, the given name of a Vancouver kid obsessed with video games and devoted to provoking adults with misbehavior and the embrace of taboo subjects. There was Grimes, the self-invented, scrappy DIY musician and provocateur who weaves sci-fi into her work and released what Pitchfork judged to be the second-best song of the 2010s. And there was her preferred nomenclature, “c,” invoking the speed of light.', 'C is the artist who’s planning to go beyond music into ventures involving education, AI, and a book called Transhumanism for Babies. C is the sometime paramour of Elon Musk (exact terms of that relationship tend to oscillate) and co-parent of two kids. C has tattoos on her fingers underneath multiple metal rings, and what looks like a spiderweb tattoo on her right ear.\r\n<br><br>\r\nC wants to die on Mars, or maybe an exoplanet—unless her kids, X and Y, want her to help out with the grandchildren. C is frank, funny, and a little worried that she’s not getting her points across. C doesn’t have to worry about that—communication, after all, is what she (and Grimes) are very, very good at.', '4.webp', '3.webp', '2023-08-11 18:03:10'),
(4, 'The future of cities, according to the experts', 'Cities aren’t going anywhere, but they do need to change.', 'The-future-of-cities-according-to-the-experts', 'Since the pandemic upended the world, we’ve been getting plenty of mixed signals about cities. We’ve heard both that cities like New York are over and that they’re immensely popular. Are they bastions of disease that people will forever avoid? Then why is the rent so damn high? Remote work means that people can work from anywhere — and they are, with the percentage of working days from home settling in at 30 percent — and yet companies keep calling people back to the office. At the same time, economists are predicting the demise of a lot of office buildings and the tax windfall they bring for urban governments, meaning cities could run out of money to fund some of the things we love about them.\r\n<br><br>\r\nIt’s a confusing situation, to say the least. So we asked some of the best and brightest people who think about cities — economists, urban planners, academics — to weigh in on their future. Though they certainly didn’t all agree, a few themes emerged.\r\n<br><br>\r\nBig cities — think New York City, Los Angeles, Chicago — will ultimately be okay, since a lot of what made them attractive in the first place is still there and impossible to find elsewhere. But that doesn’t mean they will — or can — stay the same.', 'If you were to travel 10 years into the future, chances are your favorite big city will look “remarkably similar” to the way it does now, according to Richard Florida, an urbanist and professor at the University of Toronto’s Rotman School of Management. The pandemic — and remote work — sped up a departure from cities. But the populations of big cities are always churning, as people — often families — in search of more space or cheaper housing depart, and new people move in. The pandemic simply accelerated the norm.\r\n<br><br>\r\n“What happened was all those people hit family formation age almost all at once and a pandemic struck and they were married or partnered or had a kid, and they just left cities,” Florida said. “That’s a typical American pattern.”', '5.webp', '5.webp', '2023-08-11 18:07:10'),
(5, 'The AI rules that US policymakers are considering, explained', 'ChatGPT, Midjourney, and other tools are forcing Biden and Congress to take AI seriously.', 'The-AI-rules-that-US-policymakers-are-considering-explained', 'AI is getting seriously good. And the federal government is finally getting serious about AI.\r\n<br><br>\r\nThe White House announced a suite of artificial intelligence policies in May. More recently, they brokered a number of voluntary safety commitments from leading AI companies in July. That included commitments to both internal and third-party testing of AI products to ensure they’re secure against cyberattack and guard against misuse by bad actors.\r\n<br><br>\r\nSenate Majority Leader Chuck Schumer outlined his preferred approach to regulation in a June speech and promised prompt legislation, telling his audience, “many of you have spent months calling on us to act. I hear you loud and clear.” Independent regulators like the Federal Trade Commission have been going public to outline how they plan to approach the technology. A bipartisan group wants to ban the use of AI to make nuclear launch decisions, at the very minimum.\r\n<br><br>\r\nBut “knowing you’re going to do something” and “knowing what that something is” are two different things. AI policy is still pretty virgin terrain in DC, and proposals from government leaders tend to be articulated with lots of jargon, usually involving invocations of broad ideas or requests for public input and additional study, rather than specific plans for action. Principles, rather than programming. Indeed, the US government’s record to date on AI has mostly involved vague calls for “continued United States leadership in artificial intelligence research and development” or “adoption of artificial intelligence technologies in the Federal Government,” which is fine, but not exactly concrete policy.', 'Making new rules for AI developers — whether in the form of voluntary standards, binding regulations from existing agencies, new laws passed by Congress, or international agreements binding several countries — is by far the most crowded space here, the most consequential, and the most contested.\r\n<br><br>\r\nOn one end of the spectrum are techno libertarians who look warily on attempts by the government to mandate rules for AI, fearing that this could slow down progress or, worse, lead to regulatory capture where rules are written to benefit a small handful of currently dominant companies like OpenAI. The Electronic Frontier Foundation and the R Street Institute are probably the leading representatives of this perspective in DC.\r\n<br><br>\r\nOther stakeholders, though, want extensive new rulemaking and legislating on a variety of AI topics. Some, like Sens. Josh Hawley (R-MO) and Richard Blumenthal (D-CT), want sweeping changes to rules around liability, enabling citizens to sue AI companies or prosecutors to indict them if their products cause certain harms.', '6.webp', '7.webp', '2023-08-11 18:19:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
