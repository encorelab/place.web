-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 09, 2011 at 01:33 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `activities`
--


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
(1, 1, 1, '2011-09-09 13:32:58', NULL, 'voted on comment'),
(2, 1, 1, '2011-09-09 13:32:58', NULL, 'voted on answer'),
(3, 1, 1, '2011-09-09 13:32:58', NULL, 'voted on answer concept'),
(4, 1, 1, '2011-09-09 13:32:58', NULL, 'voted on example concept'),
(5, 1, 1, '2011-09-09 13:32:58', NULL, 'commented on comment'),
(6, 1, 1, '2011-09-09 13:32:58', NULL, 'commented on answer'),
(7, 1, 1, '2011-09-09 13:32:58', NULL, 'commented on example'),
(8, 1, 1, '2011-09-09 13:32:58', NULL, 'assessed comment'),
(9, 1, 1, '2011-09-09 13:32:58', NULL, 'assessed example'),
(10, 1, 1, '2011-09-09 13:32:58', NULL, 'assessed answer'),
(11, 1, 1, '2011-09-09 13:32:58', NULL, 'example created'),
(12, 1, 1, '2011-09-09 13:32:58', NULL, 'question created');

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
(1, 1, 1, '2011-09-09 13:32:58', NULL, 'comments'),
(2, 1, 1, '2011-09-09 13:32:58', NULL, 'answers'),
(3, 1, 1, '2011-09-09 13:32:58', NULL, 'examples');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `commentable`
--

INSERT INTO `commentable` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `table_name`) VALUES
(1, 1, 1, '2011-09-09 13:32:58', NULL, 'comments'),
(2, 1, 1, '2011-09-09 13:32:58', NULL, 'answers'),
(3, 1, 1, '2011-09-09 13:32:58', NULL, 'examples');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comments`
--


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
(1, 1, 1, '2011-09-09 13:32:58', NULL, 'Vectors'),
(2, 1, 1, '2011-09-09 13:32:58', NULL, 'Newton 1st Law'),
(3, 1, 1, '2011-09-09 13:32:58', NULL, 'Newton 2nd Law'),
(4, 1, 1, '2011-09-09 13:32:58', NULL, 'Newton 3rd Law'),
(5, 1, 1, '2011-09-09 13:32:58', NULL, 'Acceleration'),
(6, 1, 1, '2011-09-09 13:32:58', NULL, 'Uniform Motion'),
(7, 1, 1, '2011-09-09 13:32:58', NULL, 'Kinetic Friction'),
(8, 1, 1, '2011-09-09 13:32:58', NULL, 'Static Friction'),
(9, 1, 1, '2011-09-09 13:32:58', NULL, 'Fnet = 0'),
(10, 1, 1, '2011-09-09 13:32:58', NULL, 'Fnet = constant (non-zero)'),
(11, 1, 1, '2011-09-09 13:32:58', NULL, 'Fnet = non-constant'),
(12, 1, 1, '2011-09-09 13:32:58', NULL, 'Kinetic Energy'),
(13, 1, 1, '2011-09-09 13:32:58', NULL, 'Potential Energy'),
(14, 1, 1, '2011-09-09 13:32:58', NULL, 'Conservation of Energy');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `examples`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `example_concept`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `questions`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `runs`
--

INSERT INTO `runs` (`id`, `name`) VALUES
(1, 'first run');

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
(1, 1, NULL, '2011-09-09 13:32:58', NULL, 'admin', NULL, 'ADMIN'),
(2, 1, NULL, '2011-09-09 13:32:58', NULL, 'teacher', NULL, 'TEACHER'),
(3, 1, NULL, '2011-09-09 13:32:58', NULL, 'student1', NULL, 'STUDENT'),
(4, 1, NULL, '2011-09-09 13:32:58', NULL, 'student2', NULL, 'STUDENT');

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
(1, 1, 1, '2011-09-09 13:32:58', NULL, 'comments'),
(2, 1, 1, '2011-09-09 13:32:58', NULL, 'answers'),
(3, 1, 1, '2011-09-09 13:32:58', NULL, 'answer_concept'),
(4, 1, 1, '2011-09-09 13:32:58', NULL, 'example_concept');

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
