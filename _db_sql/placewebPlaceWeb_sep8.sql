-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 08, 2011 at 08:31 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-1ubuntu9.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `placeweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `activity_type_id` int(11) NOT NULL,
  `activity_on_user` int(11) DEFAULT NULL,
  `i1` int(11) DEFAULT NULL,
  `i2` int(11) DEFAULT NULL,
  `i3` int(11) DEFAULT NULL,
  `i4` int(11) DEFAULT NULL,
  `i5` int(11) DEFAULT NULL,
  `s1` varchar(255) DEFAULT NULL,
  `s2` varchar(255) DEFAULT NULL,
  `s3` varchar(255) DEFAULT NULL,
  `t1` text,
  `t2` text,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_activity_activity_type1` (`activity_type_id`),
  KEY `fk_activities_users1` (`activity_on_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `activity_type_id`, `activity_on_user`, `i1`, `i2`, `i3`, `i4`, `i5`, `s1`, `s2`, `s3`, `t1`, `t2`) VALUES
(1, 1, 4, '2011-09-08 15:45:37', '2011-09-08 15:45:37', 11, NULL, 48, 0, 0, 0, 0, '', '', '', 'Examples', ''),
(2, 1, 4, '2011-09-08 15:45:57', '2011-09-08 15:45:57', 12, NULL, 1, 0, 0, 0, 0, '', '', '', 'Questions', ''),
(3, 1, 4, '2011-09-08 17:17:16', '2011-09-08 17:17:16', 12, NULL, 2, 0, 0, 0, 0, '', '', '', 'Questions', ''),
(4, 1, 4, '2011-09-08 17:34:47', '2011-09-08 17:34:47', 12, NULL, 3, 0, 0, 0, 0, '', '', '', 'Questions', ''),
(5, 1, 4, '2011-09-08 18:20:12', '2011-09-08 18:20:12', 11, NULL, 49, 0, 0, 0, 0, '', '', '', 'Examples', ''),
(6, 1, 4, '2011-09-08 19:12:37', '2011-09-08 19:12:37', 7, NULL, 3, 49, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(7, 1, 4, '2011-09-08 19:12:42', '2011-09-08 19:12:42', 7, NULL, 4, 49, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(8, 1, 4, '2011-09-08 19:14:00', '2011-09-08 19:14:00', 7, NULL, 5, 49, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(9, 1, 4, '2011-09-08 19:26:09', '2011-09-08 19:26:09', 11, NULL, 50, 0, 0, 0, 0, '', '', '', 'Examples', ''),
(10, 1, 4, '2011-09-08 19:30:39', '2011-09-08 19:30:39', 11, NULL, 51, 0, 0, 0, 0, '', '', '', 'Examples', ''),
(11, 1, 4, '2011-09-08 19:40:02', '2011-09-08 19:40:02', 7, NULL, 6, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(12, 1, 4, '2011-09-08 19:41:28', '2011-09-08 19:41:28', 7, NULL, 7, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(13, 1, 4, '2011-09-08 19:43:18', '2011-09-08 19:43:18', 7, NULL, 8, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(14, 1, 4, '2011-09-08 19:43:28', '2011-09-08 19:43:28', 7, NULL, 9, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(15, 1, 4, '2011-09-08 19:59:19', '2011-09-08 19:59:19', 7, NULL, 10, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples'),
(16, 1, 4, '2011-09-08 19:59:39', '2011-09-08 19:59:39', 7, NULL, 11, 51, 0, 0, 0, '', '', '', 'Comments', 'Examples');

-- --------------------------------------------------------

--
-- Table structure for table `activity_types`
--

CREATE TABLE IF NOT EXISTS `activity_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `activity_types`
--

INSERT INTO `activity_types` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES
(1, 1, 1, '2011-09-08 11:50:06', NULL, 'voted on comment'),
(2, 1, 1, '2011-09-08 11:50:06', NULL, 'voted on answer'),
(3, 1, 1, '2011-09-08 11:50:06', NULL, 'voted on answer concept'),
(4, 1, 1, '2011-09-08 11:50:06', NULL, 'voted on example concept'),
(5, 1, 1, '2011-09-08 11:50:06', NULL, 'commented on comment'),
(6, 1, 1, '2011-09-08 11:50:06', NULL, 'commented on answer'),
(7, 1, 1, '2011-09-08 11:50:06', NULL, 'commented on example'),
(8, 1, 1, '2011-09-08 11:50:06', NULL, 'assessed comment'),
(9, 1, 1, '2011-09-08 11:50:06', NULL, 'assessed example'),
(10, 1, 1, '2011-09-08 11:50:06', NULL, 'assessed answer'),
(11, 1, 1, '2011-09-08 14:37:30', '2011-09-08 14:37:30', 'example added'),
(12, 1, 1, '2011-09-08 15:07:44', '2011-09-08 15:07:44', 'question created');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `mc_chocie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_answers_questions1` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `answer_concept`
--

CREATE TABLE IF NOT EXISTS `answer_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_answer_concept_answers1` (`answer_id`),
  KEY `fk_answer_concept_concepts1` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `answer_concept`
--


-- --------------------------------------------------------

--
-- Table structure for table `assessable`
--

CREATE TABLE IF NOT EXISTS `assessable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_UNIQUE` (`table_name`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `assessable`
--

INSERT INTO `assessable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `table_name`) VALUES
(1, 1, 1, '2011-09-08 11:50:07', NULL, 'comments'),
(2, 1, 1, '2011-09-08 11:50:07', NULL, 'answers'),
(3, 1, 1, '2011-09-08 11:50:07', NULL, 'examples');

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE IF NOT EXISTS `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_type` int(11) NOT NULL,
  `mark` double DEFAULT NULL,
  `assessment_review_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_votes_votable1` (`obj_type`),
  KEY `fk_assessments_assessment_reviews1` (`assessment_review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assessments`
--


-- --------------------------------------------------------

--
-- Table structure for table `assessment_reviews`
--

CREATE TABLE IF NOT EXISTS `assessment_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assessment_reviews`
--


-- --------------------------------------------------------

--
-- Table structure for table `commentable`
--

CREATE TABLE IF NOT EXISTS `commentable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_UNIQUE` (`table_name`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `commentable`
--

INSERT INTO `commentable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `table_name`) VALUES
(1, 1, 1, '2011-09-08 11:50:06', NULL, 'comments'),
(2, 1, 1, '2011-09-08 11:50:06', NULL, 'answers'),
(3, 1, 1, '2011-09-08 11:50:06', NULL, 'examples'),
(4, 1, 1, '2011-09-08 16:30:47', '2011-09-08 16:30:47', 'questions');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_type` int(11) NOT NULL,
  `content` text,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_votes_votable1` (`obj_type`),
  KEY `fk_comments_comments1` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `obj_id`, `obj_type`, `content`, `parent_id`) VALUES
(1, 1, 1, '2011-09-08 16:56:27', '2011-09-08 16:56:27', 1, 3, 'some text', NULL),
(2, 1, 4, '2011-09-08 19:11:58', '2011-09-08 19:11:58', 49, 3, NULL, NULL),
(3, 1, 4, '2011-09-08 19:12:37', '2011-09-08 19:12:37', 49, 3, NULL, NULL),
(4, 1, 4, '2011-09-08 19:12:42', '2011-09-08 19:12:42', 49, 3, NULL, NULL),
(5, 1, 4, '2011-09-08 19:14:00', '2011-09-08 19:14:00', 49, 3, '<p>hola anto</p>', NULL),
(6, 1, 4, '2011-09-08 19:40:02', '2011-09-08 19:40:02', 51, 3, '', NULL),
(7, 1, 4, '2011-09-08 19:41:28', '2011-09-08 19:41:28', 51, 3, '', NULL),
(8, 1, 4, '2011-09-08 19:43:18', '2011-09-08 19:43:18', 51, 3, '<p>asdf</p>', NULL),
(9, 1, 4, '2011-09-08 19:43:28', '2011-09-08 19:43:28', 51, 3, '<p>one more</p>', NULL),
(10, 1, 4, '2011-09-08 19:59:19', '2011-09-08 19:59:19', 51, 3, '<p>sdf</p>', NULL),
(11, 1, 4, '2011-09-08 19:59:39', '2011-09-08 19:59:39', 51, 3, '<p><span style="background-color: #ffff99;">ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c ccc ccc c ccc c cccc c</span></p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `concepts`
--

CREATE TABLE IF NOT EXISTS `concepts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `concepts`
--

INSERT INTO `concepts` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES
(1, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Vectors'),
(2, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Newton 1st Law'),
(3, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Newton 2nd Law'),
(4, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Newton 3rd Law'),
(5, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Acceleration'),
(6, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Uniform Motion'),
(7, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Kinetic Friction'),
(8, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Static Friction'),
(9, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Fnet = 0'),
(10, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Fnet = constant (non-zero)'),
(11, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Fnet = non-constant'),
(12, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Kinetic Energy'),
(13, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Potential Energy'),
(14, 1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', 'Conservation of Energy');

-- --------------------------------------------------------

--
-- Table structure for table `elo_template`
--

CREATE TABLE IF NOT EXISTS `elo_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `elo_template`
--


-- --------------------------------------------------------

--
-- Table structure for table `examples`
--

CREATE TABLE IF NOT EXISTS `examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `media_content` text,
  `media_path` varchar(255) DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `examples`
--

INSERT INTO `examples` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`, `content`, `media_content`, `media_path`, `media_type`, `type`) VALUES
(1, 1, 3, '2011-09-08 13:37:19', NULL, NULL, 'My example content', NULL, NULL, NULL, NULL),
(3, 1, 3, '2011-09-08 13:53:20', NULL, NULL, 'My example content', NULL, NULL, NULL, NULL),
(4, 1, 3, '2011-09-08 13:53:33', NULL, 'My example', 'My example content', NULL, NULL, NULL, NULL),
(5, 1, 3, '2011-09-08 13:54:00', NULL, 'My example', 'My example content', NULL, NULL, NULL, NULL),
(7, 1, 1, '2011-09-08 13:55:30', NULL, 'My example', '<p>my example</p>', NULL, NULL, NULL, NULL),
(8, 1, 1, '2011-09-08 13:56:05', NULL, 'My example', '<p>my example</p>', NULL, NULL, NULL, NULL),
(12, 1, 1, '2011-09-08 13:57:37', NULL, 'My example', '<p>my example</p>', NULL, NULL, NULL, NULL),
(13, 1, 1, '2011-09-08 13:58:51', NULL, 'My example', '<p>my example</p>', NULL, NULL, NULL, NULL),
(14, 1, 1, '2011-09-08 13:58:54', NULL, 'My example', '<p>my example</p>', NULL, NULL, NULL, NULL),
(16, 1, 1, '2011-09-08 14:05:06', '2011-09-08 14:05:06', 'Hola anto', '<p>Un text here</p>', NULL, NULL, NULL, NULL),
(17, 1, 1, '2011-09-08 14:09:37', '2011-09-08 14:09:37', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', NULL, NULL, NULL),
(18, 1, 1, '2011-09-08 14:10:02', '2011-09-08 14:10:02', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(19, 1, 4, '2011-09-08 14:10:12', '2011-09-08 14:10:12', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(20, 1, 4, '2011-09-08 14:14:33', '2011-09-08 14:14:33', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(21, 1, 4, '2011-09-08 14:15:37', '2011-09-08 14:15:37', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(22, 1, 4, '2011-09-08 14:16:19', '2011-09-08 14:16:19', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(23, 1, 4, '2011-09-08 14:16:25', '2011-09-08 14:16:25', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(24, 1, 4, '2011-09-08 14:16:59', '2011-09-08 14:16:59', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(25, 1, 4, '2011-09-08 14:28:27', '2011-09-08 14:28:27', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(26, 1, 4, '2011-09-08 14:28:54', '2011-09-08 14:28:54', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(27, 1, 4, '2011-09-08 14:29:17', '2011-09-08 14:29:17', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(28, 1, 4, '2011-09-08 14:30:02', '2011-09-08 14:30:02', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(29, 1, 4, '2011-09-08 14:30:32', '2011-09-08 14:30:32', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(30, 1, 4, '2011-09-08 14:30:43', '2011-09-08 14:30:43', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(31, 1, 4, '2011-09-08 14:31:22', '2011-09-08 14:31:22', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(32, 1, 4, '2011-09-08 14:32:20', '2011-09-08 14:32:20', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(33, 1, 4, '2011-09-08 14:34:49', '2011-09-08 14:34:49', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(34, 1, 4, '2011-09-08 14:35:14', '2011-09-08 14:35:14', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(35, 1, 4, '2011-09-08 14:35:44', '2011-09-08 14:35:44', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(36, 1, 4, '2011-09-08 14:42:23', '2011-09-08 14:42:23', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(37, 1, 4, '2011-09-08 14:42:26', '2011-09-08 14:42:26', 'Hola anto', '<p>Un text here</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(38, 1, 4, '2011-09-08 15:20:51', '2011-09-08 15:20:51', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(39, 1, 4, '2011-09-08 15:21:37', '2011-09-08 15:21:37', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(40, 1, 4, '2011-09-08 15:22:10', '2011-09-08 15:22:10', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(41, 1, 4, '2011-09-08 15:28:38', '2011-09-08 15:28:38', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(42, 1, 4, '2011-09-08 15:30:59', '2011-09-08 15:30:59', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(43, 1, 4, '2011-09-08 15:33:16', '2011-09-08 15:33:16', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(44, 1, 4, '2011-09-08 15:34:10', '2011-09-08 15:34:10', 'my Garden', '<p>This is my Garden</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(45, 1, 4, '2011-09-08 15:40:27', '2011-09-08 15:40:27', 'My question', '<p>my first question</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', NULL),
(46, 1, 4, '2011-09-08 15:40:56', '2011-09-08 15:40:56', 'My question', '<p>my first question</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', NULL),
(47, 1, 4, '2011-09-08 15:43:44', '2011-09-08 15:43:44', 'another question', '<p>my question</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', 0),
(48, 1, 4, '2011-09-08 15:45:37', '2011-09-08 15:45:37', 'My example', '<p>my example</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', 3),
(49, 1, 4, '2011-09-08 18:20:12', '2011-09-08 18:20:12', 'hola anto', '<p>This is my Example</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', 5),
(50, 1, 4, '2011-09-08 19:26:08', '2011-09-08 19:26:08', 'MY Gardern', '<p>text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc</p>\r\n<p>text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc text c ccc cc</p>', '<img src="/content/myGarden.png" width="320px">', 'myGarden.png', '', 3),
(51, 1, 4, '2011-09-08 19:30:39', '2011-09-08 19:30:39', 'hhhhhh', '', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `example_concept`
--

CREATE TABLE IF NOT EXISTS `example_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `example_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_answer_concept_answers1` (`example_id`),
  KEY `fk_answer_concept_concepts1` (`concept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `example_concept`
--

INSERT INTO `example_concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `example_id`, `concept_id`) VALUES
(1, 1, 4, '2011-09-08 19:30:39', '2011-09-08 19:30:39', 51, 9);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('MC','LONG') NOT NULL DEFAULT 'MC',
  `content` text,
  `media_content` text,
  `media_path` varchar(255) DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `choices` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`, `type`, `content`, `media_content`, `media_path`, `media_type`, `choices`) VALUES
(1, 1, 4, '2011-09-08 15:45:57', '2011-09-08 15:45:57', 'my question', 'MC', '<p>this is the question</p>', '', '', '', NULL),
(2, 1, 4, '2011-09-08 17:17:16', '2011-09-08 17:17:16', 'question 2', 'MC', '<p>THis is the question</p>', '<img src="/content/Screenshot555.png" width="320px">', 'Screenshot555.png', '', NULL),
(3, 1, 4, '2011-09-08 17:34:47', '2011-09-08 17:34:47', 'question 3', 'MC', '<p><span style="font-size: large;">the text of the question</span> </p>', '', '', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `question_concept`
--

CREATE TABLE IF NOT EXISTS `question_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_question_concept_question1` (`question_id`),
  KEY `fk_question_concept_concepts1` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `question_concept`
--


-- --------------------------------------------------------

--
-- Table structure for table `resolved_user_alerts`
--

CREATE TABLE IF NOT EXISTS `resolved_user_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_user_alert_confirmed_activities1` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `resolved_user_alerts`
--


-- --------------------------------------------------------

--
-- Table structure for table `runs`
--

CREATE TABLE IF NOT EXISTS `runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `runs`
--

INSERT INTO `runs` (`id`, `name`) VALUES
(1, 'first run'),
(100, 'Anto Run Test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` enum('STUDENT','TEACHER','ADMIN') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `username`, `password`, `user_type`) VALUES
(1, 1, 1, '2011-09-08 14:24:31', NULL, 'admin', NULL, 'ADMIN'),
(2, 1, NULL, '2011-09-08 11:50:06', NULL, 'teacher', NULL, 'TEACHER'),
(3, 1, NULL, '2011-09-08 11:50:06', NULL, 'student1', NULL, 'STUDENT'),
(4, 1, NULL, '2011-09-08 11:50:06', NULL, 'student2', NULL, 'STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `votable`
--

CREATE TABLE IF NOT EXISTS `votable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name_UNIQUE` (`table_name`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `votable`
--

INSERT INTO `votable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `table_name`) VALUES
(1, 1, 1, '2011-09-08 11:50:06', NULL, 'comments'),
(2, 1, 1, '2011-09-08 11:50:06', NULL, 'answers'),
(3, 1, 1, '2011-09-08 11:50:06', NULL, 'answer_concept'),
(4, 1, 1, '2011-09-08 11:50:06', NULL, 'example_concept');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_type` int(11) NOT NULL,
  `vote_value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_votes_votable1` (`obj_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `votes`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_activities_users1` FOREIGN KEY (`activity_on_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activity_activity_type1` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs14` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users4` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `activity_types`
--
ALTER TABLE `activity_types`
  ADD CONSTRAINT `fk_template_runs13` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users3` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs11` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `answer_concept`
--
ALTER TABLE `answer_concept`
  ADD CONSTRAINT `fk_answer_concept_answers1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answer_concept_concepts1` FOREIGN KEY (`concept_id`) REFERENCES `concepts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs1200` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users200` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assessable`
--
ALTER TABLE `assessable`
  ADD CONSTRAINT `fk_template_runs15000` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users5000` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `fk_assessments_assessment_reviews1` FOREIGN KEY (`assessment_review_id`) REFERENCES `assessment_reviews` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs1510` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users510` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_votes_votable100` FOREIGN KEY (`obj_type`) REFERENCES `assessable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assessment_reviews`
--
ALTER TABLE `assessment_reviews`
  ADD CONSTRAINT `fk_template_runs121` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users21` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `commentable`
--
ALTER TABLE `commentable`
  ADD CONSTRAINT `fk_template_runs1500` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users500` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_comments1` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs151` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users51` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_votes_votable10` FOREIGN KEY (`obj_type`) REFERENCES `commentable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `concepts`
--
ALTER TABLE `concepts`
  ADD CONSTRAINT `fk_template_runs120` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users20` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `elo_template`
--
ALTER TABLE `elo_template`
  ADD CONSTRAINT `fk_template_runs1` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `examples`
--
ALTER TABLE `examples`
  ADD CONSTRAINT `fk_template_runs12` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `example_concept`
--
ALTER TABLE `example_concept`
  ADD CONSTRAINT `fk_answer_concept_answers10` FOREIGN KEY (`example_id`) REFERENCES `examples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answer_concept_concepts10` FOREIGN KEY (`concept_id`) REFERENCES `concepts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs12000` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users2000` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_template_runs10` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users0` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `question_concept`
--
ALTER TABLE `question_concept`
  ADD CONSTRAINT `fk_answer_concept_answers100` FOREIGN KEY (`question_id`) REFERENCES `examples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answer_concept_concepts100` FOREIGN KEY (`concept_id`) REFERENCES `concepts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_runs120000` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users20000` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `resolved_user_alerts`
--
ALTER TABLE `resolved_user_alerts`
  ADD CONSTRAINT `fk_template_runs16` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users6` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_alert_confirmed_activities1` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_runs` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `votable`
--
ALTER TABLE `votable`
  ADD CONSTRAINT `fk_template_runs150` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users50` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `fk_template_runs15` FOREIGN KEY (`run_id`) REFERENCES `runs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users5` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_votes_votable1` FOREIGN KEY (`obj_type`) REFERENCES `votable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
