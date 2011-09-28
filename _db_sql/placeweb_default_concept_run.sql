-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 28, 2011 at 06:04 PM
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
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
CREATE TABLE IF NOT EXISTS `concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `concept`
--

INSERT INTO `concept` (`id`, `run_id`, `author_id`, `date_modified`, `date_created`, `name`) VALUES
(1, 1, 1, '2011-09-27 21:24:46', NULL, 'Vectors'),
(2, 1, 1, '2011-09-27 21:24:46', NULL, 'Newton 1st Law'),
(3, 1, 1, '2011-09-27 21:24:46', NULL, 'Newton 2nd Law'),
(4, 1, 1, '2011-09-27 21:24:46', NULL, 'Newton 3rd Law'),
(5, 1, 1, '2011-09-27 21:24:46', NULL, 'Acceleration'),
(6, 1, 1, '2011-09-27 21:24:46', NULL, 'Uniform Motion'),
(7, 1, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Friction'),
(8, 1, 1, '2011-09-27 21:24:46', NULL, 'Static Friction'),
(9, 1, 1, '2011-09-27 21:24:46', NULL, 'Fnet = 0'),
(10, 1, 1, '2011-09-27 21:24:46', NULL, 'Fnet = constant (non-zero)'),
(11, 1, 1, '2011-09-27 21:24:46', NULL, 'Fnet = non-constant'),
(12, 1, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Energy'),
(13, 1, 1, '2011-09-27 21:24:46', NULL, 'Potential Energy'),
(14, 1, 1, '2011-09-27 21:24:46', NULL, 'Conservation of Energy'),
(15, 2, 1, '2011-09-27 21:24:46', NULL, 'Vectors'),
(16, 2, 1, '2011-09-27 21:24:46', NULL, 'Newton 1st Law'),
(17, 2, 1, '2011-09-27 21:24:46', NULL, 'Newton 2nd Law'),
(18, 2, 1, '2011-09-27 21:24:46', NULL, 'Newton 3rd Law'),
(19, 2, 1, '2011-09-27 21:24:46', NULL, 'Acceleration'),
(20, 2, 1, '2011-09-27 21:24:46', NULL, 'Uniform Motion'),
(21, 2, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Friction'),
(22, 2, 1, '2011-09-27 21:24:46', NULL, 'Static Friction'),
(23, 2, 1, '2011-09-27 21:24:46', NULL, 'Fnet = 0'),
(24, 2, 1, '2011-09-27 21:24:46', NULL, 'Fnet = constant (non-zero)'),
(25, 2, 1, '2011-09-27 21:24:46', NULL, 'Fnet = non-constant'),
(26, 2, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Energy'),
(27, 2, 1, '2011-09-27 21:24:46', NULL, 'Potential Energy'),
(28, 2, 1, '2011-09-27 21:24:46', NULL, 'Conservation of Energy'),
(30, 3, 1, '2011-09-27 21:24:46', NULL, 'Vectors'),
(31, 3, 1, '2011-09-27 21:24:46', NULL, 'Newton 1st Law'),
(32, 3, 1, '2011-09-27 21:24:46', NULL, 'Newton 2nd Law'),
(33, 3, 1, '2011-09-27 21:24:46', NULL, 'Newton 3rd Law'),
(34, 3, 1, '2011-09-27 21:24:46', NULL, 'Acceleration'),
(35, 3, 1, '2011-09-27 21:24:46', NULL, 'Uniform Motion'),
(36, 3, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Friction'),
(37, 3, 1, '2011-09-27 21:24:46', NULL, 'Static Friction'),
(38, 3, 1, '2011-09-27 21:24:46', NULL, 'Fnet = 0'),
(39, 3, 1, '2011-09-27 21:24:46', NULL, 'Fnet = constant (non-zero)'),
(40, 3, 1, '2011-09-27 21:24:46', NULL, 'Fnet = non-constant'),
(41, 3, 1, '2011-09-27 21:24:46', NULL, 'Kinetic Energy'),
(42, 3, 1, '2011-09-27 21:24:46', NULL, 'Potential Energy'),
(43, 3, 1, '2011-09-27 21:24:46', NULL, 'Conservation of Energy');

-- --------------------------------------------------------

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
CREATE TABLE IF NOT EXISTS `run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `run`
--

INSERT INTO `run` (`id`, `name`) VALUES
(1, 'SPH3UE-03'),
(2, 'SPH3UE-04'),
(3, 'SPH3UE-test');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `concept`
--
ALTER TABLE `concept`
  ADD CONSTRAINT `fk_template_runs120` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_template_users20` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
