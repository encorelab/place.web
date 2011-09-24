CREATE DATABASE  IF NOT EXISTS `placeweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `placeweb`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: localhost    Database: placeweb
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
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
  KEY `fk_comments_comments1` (`parent_id`),
  CONSTRAINT `fk_comments_comments1` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs151` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users51` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable10` FOREIGN KEY (`obj_type`) REFERENCES `commentable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49',1,3,'<p>This shows vectors because of...<img class=\"Wirisformula\" title=\"Double click to edit\" src=\"Error: no mathml has been sended.\" alt=\"\" align=\"middle\" /></p>',NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs120` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users20` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concept`
--

LOCK TABLES `concept` WRITE;
/*!40000 ALTER TABLE `concept` DISABLE KEYS */;
INSERT INTO `concept` VALUES (1,1,1,'2011-09-21 19:55:47',NULL,'Vectors'),(2,1,1,'2011-09-21 19:55:47',NULL,'Newton 1st Law'),(3,1,1,'2011-09-21 19:55:47',NULL,'Newton 2nd Law'),(4,1,1,'2011-09-21 19:55:47',NULL,'Newton 3rd Law'),(5,1,1,'2011-09-21 19:55:47',NULL,'Acceleration'),(6,1,1,'2011-09-21 19:55:47',NULL,'Uniform Motion'),(7,1,1,'2011-09-21 19:55:47',NULL,'Kinetic Friction'),(8,1,1,'2011-09-21 19:55:47',NULL,'Static Friction'),(9,1,1,'2011-09-21 19:55:47',NULL,'Fnet = 0'),(10,1,1,'2011-09-21 19:55:47',NULL,'Fnet = constant (non-zero)'),(11,1,1,'2011-09-21 19:55:47',NULL,'Fnet = non-constant'),(12,1,1,'2011-09-21 19:55:47',NULL,'Kinetic Energy'),(13,1,1,'2011-09-21 19:55:47',NULL,'Potential Energy'),(14,1,1,'2011-09-21 19:55:47',NULL,'Conservation of Energy'),(15,2,1,'2011-09-21 19:55:47',NULL,'Vectors'),(16,2,1,'2011-09-21 19:55:47',NULL,'Newton 1st Law'),(17,2,1,'2011-09-21 19:55:47',NULL,'Newton 2nd Law'),(18,2,1,'2011-09-21 19:55:47',NULL,'Newton 3rd Law'),(19,2,1,'2011-09-21 19:55:47',NULL,'Acceleration'),(20,2,1,'2011-09-21 19:55:47',NULL,'Uniform Motion'),(21,2,1,'2011-09-21 19:55:47',NULL,'Kinetic Friction'),(22,2,1,'2011-09-21 19:55:47',NULL,'Static Friction'),(23,2,1,'2011-09-21 19:55:47',NULL,'Fnet = 0'),(24,2,1,'2011-09-21 19:55:47',NULL,'Fnet = constant (non-zero)'),(25,2,1,'2011-09-21 19:55:47',NULL,'Fnet = non-constant'),(26,2,1,'2011-09-21 19:55:47',NULL,'Kinetic Energy'),(27,2,1,'2011-09-21 19:55:47',NULL,'Potential Energy'),(28,2,1,'2011-09-21 19:55:47',NULL,'Conservation of Energy');
/*!40000 ALTER TABLE `concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (1,'SPH3UE-03'),(2,'SPH3UE-04');
/*!40000 ALTER TABLE `run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessable`
--

DROP TABLE IF EXISTS `assessable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `object` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs15000` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users5000` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessable`
--

LOCK TABLES `assessable` WRITE;
/*!40000 ALTER TABLE `assessable` DISABLE KEYS */;
INSERT INTO `assessable` VALUES (1,1,1,'2011-09-21 19:55:47',NULL,'comments'),(2,1,1,'2011-09-21 19:55:47',NULL,'answers'),(3,1,1,'2011-09-21 19:55:47',NULL,'examples');
/*!40000 ALTER TABLE `assessable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentable`
--

DROP TABLE IF EXISTS `commentable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `object` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs1500` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users500` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentable`
--

LOCK TABLES `commentable` WRITE;
/*!40000 ALTER TABLE `commentable` DISABLE KEYS */;
INSERT INTO `commentable` VALUES (1,1,1,'2011-09-21 19:55:47',NULL,'comments'),(2,1,1,'2011-09-21 19:55:47',NULL,'answers'),(3,1,1,'2011-09-21 19:55:47',NULL,'examples');
/*!40000 ALTER TABLE `commentable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resolved_user_alert`
--

DROP TABLE IF EXISTS `resolved_user_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolved_user_alert` (
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
  KEY `fk_user_alert_confirmed_activities1` (`activity_id`),
  CONSTRAINT `fk_template_runs16` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users6` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_alert_confirmed_activities1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolved_user_alert`
--

LOCK TABLES `resolved_user_alert` WRITE;
/*!40000 ALTER TABLE `resolved_user_alert` DISABLE KEYS */;
INSERT INTO `resolved_user_alert` VALUES (1,1,6,'2011-09-22 02:49:16','2011-09-22 02:49:16',5,'ok'),(2,2,26,'2011-09-22 19:48:49','2011-09-22 19:48:49',7,'ok'),(3,2,26,'2011-09-22 19:48:50','2011-09-22 19:48:50',8,'ok'),(4,2,26,'2011-09-22 19:48:51','2011-09-22 19:48:51',9,'ok'),(5,2,26,'2011-09-22 19:48:52','2011-09-22 19:48:52',10,'ok'),(6,2,26,'2011-09-22 19:48:53','2011-09-22 19:48:53',11,'ok'),(7,2,20,'2011-09-22 19:55:06','2011-09-22 19:55:06',12,'ok'),(8,2,19,'2011-09-22 20:14:45','2011-09-22 20:14:45',13,'ok');
/*!40000 ALTER TABLE `resolved_user_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votable`
--

DROP TABLE IF EXISTS `votable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `object` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs150` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users50` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votable`
--

LOCK TABLES `votable` WRITE;
/*!40000 ALTER TABLE `votable` DISABLE KEYS */;
INSERT INTO `votable` VALUES (1,1,1,'2011-09-21 19:55:47',NULL,'comments'),(2,1,1,'2011-09-21 19:55:47',NULL,'answers'),(3,1,1,'2011-09-21 19:55:47',NULL,'answer_concept'),(4,1,1,'2011-09-21 19:55:47',NULL,'example_concept'),(5,1,1,'2011-09-21 19:55:47',NULL,'question_concept');
/*!40000 ALTER TABLE `votable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` enum('STUDENT','TEACHER','ADMIN') NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_runs` (`run_id`),
  CONSTRAINT `fk_users_runs` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,NULL,'2011-09-21 19:55:47',NULL,'admin',NULL,'ADMIN','Admin',NULL),(2,1,NULL,'2011-09-21 19:55:47',NULL,'teacher',NULL,'TEACHER','Admin',NULL),(3,1,NULL,'2011-09-21 19:55:47',NULL,'student1',NULL,'STUDENT','Student',NULL),(4,1,NULL,'2011-09-21 19:55:47',NULL,'student2',NULL,'STUDENT','Student',NULL),(5,1,0,'2011-09-21 19:56:04','2011-09-21 19:56:04','drusu',NULL,'STUDENT','coolcat','SPH3UE-03'),(6,1,0,'2011-09-21 20:30:33','2011-09-21 20:30:33','shawnbrooks',NULL,'TEACHER','Shawn Brooks','SPH3UE-03'),(7,1,0,'2011-09-21 23:55:11','2011-09-21 23:55:11','snguyen',NULL,'STUDENT','Stacky','SPH3UE-03'),(8,1,0,'2011-09-21 23:55:29','2011-09-21 23:55:29','slim',NULL,'STUDENT','Panda','SPH3UE-03'),(9,2,0,'2011-09-22 02:54:02','2011-09-22 02:54:02','shawnbrooks2',NULL,'TEACHER','Shawn Brooks','SPH3UE-04'),(10,1,0,'2011-09-22 17:04:23','2011-09-22 17:04:23','hfung',NULL,'STUDENT','Cressestes','SPH3UE-03'),(11,1,0,'2011-09-22 17:59:02','2011-09-22 17:59:01','sliu',NULL,'STUDENT','DOLPHIN','SPH3UE-03'),(12,1,0,'2011-09-22 18:00:18','2011-09-22 18:00:18','schan',NULL,'STUDENT','Mcchan','SPH3UE-03'),(13,2,0,'2011-09-22 18:43:44','2011-09-22 18:43:44','mhsueh',NULL,'STUDENT','Wacka Flocka Flame','SPH3UE-04'),(14,2,0,'2011-09-22 19:44:43','2011-09-22 19:44:43','sly',NULL,'STUDENT','owl','SPH3UE-04'),(15,2,0,'2011-09-22 19:44:49','2011-09-22 19:44:49','cchen',NULL,'STUDENT','Fluttershy','SPH3UE-04'),(16,2,0,'2011-09-22 19:45:59','2011-09-22 19:45:59','aluk',NULL,'STUDENT','allanluk','SPH3UE-04'),(17,2,0,'2011-09-22 19:46:01','2011-09-22 19:46:01','cykim',NULL,'STUDENT','tigger','SPH3UE-04'),(18,2,0,'2011-09-22 19:46:37','2011-09-22 19:46:37','dbekah',NULL,'STUDENT','wijj','SPH3UE-04'),(19,2,0,'2011-09-22 19:46:41','2011-09-22 19:46:41','pyung',NULL,'STUDENT','JesusofNazareth','SPH3UE-04'),(20,2,0,'2011-09-22 19:46:42','2011-09-22 19:46:42','Jpark',NULL,'STUDENT','prophet','SPH3UE-04'),(21,2,0,'2011-09-22 19:47:10','2011-09-22 19:47:10','small',NULL,'STUDENT','Nicky Minaj','SPH3UE-04'),(22,2,0,'2011-09-22 19:47:31','2011-09-22 19:47:31','mvirji',NULL,'STUDENT','malika.virji','SPH3UE-04'),(23,2,0,'2011-09-22 19:47:43','2011-09-22 19:47:43','pwang',NULL,'STUDENT','chuck','SPH3UE-04'),(24,2,0,'2011-09-22 19:47:54','2011-09-22 19:47:54','JCheung',NULL,'STUDENT','jason','SPH3UE-04'),(25,2,0,'2011-09-22 19:48:12','2011-09-22 19:48:12','chkim',NULL,'STUDENT','eeyore','SPH3UE-04'),(26,2,0,'2011-09-22 19:48:41','2011-09-22 19:48:41','aho',NULL,'STUDENT','heffalump','SPH3UE-04'),(27,2,0,'2011-09-22 19:51:21','2011-09-22 19:51:21','eclarke',NULL,'STUDENT','piglet','SPH3UE-04'),(28,2,0,'2011-09-22 19:51:52','2011-09-22 19:51:52','spira',NULL,'STUDENT','Gucci Mayne','SPH3UE-04'),(29,2,0,'2011-09-22 19:54:25','2011-09-22 19:54:25','dlim',NULL,'STUDENT','davidlim','SPH3UE-04'),(30,2,0,'2011-09-23 13:45:39','2011-09-23 13:45:39','studentadmin2',NULL,'STUDENT','Not a Student','SPH3UE-04'),(31,1,0,'2011-09-23 13:54:37','2011-09-23 13:54:37','teacheradmin',NULL,'TEACHER','Not a Teacher','SPH3UE-03'),(32,2,0,'2011-09-23 13:55:03','2011-09-23 13:55:03','teacheradmin2',NULL,'TEACHER','Not a Teacher','SPH3UE-04'),(33,1,0,'2011-09-23 14:40:26','2011-09-23 14:40:26','wzhao',NULL,'STUDENT','Fuzzy Hunny Pot','SPH3UE-03'),(34,1,0,'2011-09-23 15:01:25','2011-09-23 15:01:25','studentadmin',NULL,'STUDENT','Not a Student','SPH3UE-03'),(35,1,0,'2011-09-23 15:04:12','2011-09-23 15:04:12','jinkaran',NULL,'STUDENT','jeymaestro','SPH3UE-03'),(36,1,0,'2011-09-23 15:04:28','2011-09-23 15:04:28','Axia',NULL,'STUDENT','Prepod','SPH3UE-03'),(37,1,0,'2011-09-23 15:05:28','2011-09-23 15:05:28','tclokie',NULL,'STUDENT','trevc','SPH3UE-03'),(38,1,0,'2011-09-23 15:06:13','2011-09-23 15:06:13','npirani',NULL,'STUDENT','Nadz','SPH3UE-03'),(39,1,0,'2011-09-23 15:06:33','2011-09-23 15:06:33','jyan',NULL,'STUDENT','Jenbun','SPH3UE-03'),(40,1,0,'2011-09-23 15:08:09','2011-09-23 15:08:09','ookarmus',NULL,'STUDENT','the knight who says ni','SPH3UE-03'),(41,1,0,'2011-09-23 15:10:00','2011-09-23 15:10:00','byuen',NULL,'STUDENT','Evil Genius','SPH3UE-03'),(42,1,0,'2011-09-23 15:10:38','2011-09-23 15:10:38','cwang',NULL,'STUDENT','Beluga Buddy','SPH3UE-03'),(43,1,0,'2011-09-23 15:10:53','2011-09-23 15:10:53','ssirca',NULL,'STUDENT','Sherbunny','SPH3UE-03'),(44,1,0,'2011-09-23 15:11:06','2011-09-23 15:11:06','vpang',NULL,'STUDENT','gentle cougar','SPH3UE-03'),(45,1,0,'2011-09-23 15:11:18','2011-09-23 15:11:18','ama',NULL,'STUDENT','Angema','SPH3UE-03'),(46,1,0,'2011-09-23 15:13:30','2011-09-23 15:13:30','ptiengou',NULL,'STUDENT','PiTi','SPH3UE-03'),(49,1,0,'2011-09-23 15:20:14','2011-09-23 15:20:14','jgungabeesoon',NULL,'STUDENT','jgungabeesoon','SPH3UE-03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
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
  KEY `fk_votes_votable1` (`obj_type`),
  CONSTRAINT `fk_template_runs15` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users5` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable1` FOREIGN KEY (`obj_type`) REFERENCES `votable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,2,14,'2011-09-22 23:23:54','2011-09-22 23:23:54',2,5,1),(2,2,20,'2011-09-23 00:32:54','2011-09-23 00:32:54',4,5,1),(3,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',5,5,1),(4,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',6,5,1),(5,2,22,'2011-09-23 00:46:01','2011-09-23 00:46:01',6,5,1),(6,2,20,'2011-09-23 00:52:30','2011-09-23 00:52:30',2,5,1),(7,2,20,'2011-09-23 00:52:39','2011-09-23 00:52:39',1,5,1),(8,2,20,'2011-09-23 00:56:28','2011-09-23 00:56:28',3,5,1),(9,1,12,'2011-09-23 15:05:06','2011-09-23 15:05:06',7,5,1),(10,1,33,'2011-09-23 15:06:32','2011-09-23 15:06:32',7,5,-1),(11,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',1,4,1),(12,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',2,4,1),(13,1,33,'2011-09-23 15:09:28','2011-09-23 15:09:28',3,4,1),(14,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',1,4,-1),(15,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',2,4,-1),(16,1,38,'2011-09-23 15:09:49','2011-09-23 15:09:49',3,4,-1),(17,1,44,'2011-09-23 15:11:27','2011-09-23 15:11:27',7,5,1),(18,1,42,'2011-09-23 15:14:30','2011-09-23 15:14:30',1,1,1),(19,1,38,'2011-09-23 15:16:59','2011-09-23 15:16:59',8,5,1),(20,1,38,'2011-09-23 15:17:00','2011-09-23 15:17:00',9,5,1);
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_reviews`
--

DROP TABLE IF EXISTS `assessment_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `log` text,
  `i1` int(11) DEFAULT NULL,
  `i2` int(11) DEFAULT NULL,
  `t1` varchar(255) DEFAULT NULL,
  `t2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs15100` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users5100` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_reviews`
--

LOCK TABLES `assessment_reviews` WRITE;
/*!40000 ALTER TABLE `assessment_reviews` DISABLE KEYS */;
INSERT INTO `assessment_reviews` VALUES (1,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43','<p>May need to encourage better explanation/rationale</p>',7,NULL,'question',NULL);
/*!40000 ALTER TABLE `assessment_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_concept`
--

DROP TABLE IF EXISTS `question_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_concept` (
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
  KEY `fk_question_concept_concepts1` (`concept_id`),
  CONSTRAINT `fk_answer_concept_answers100` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts100` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs120000` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users20000` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_concept`
--

LOCK TABLES `question_concept` WRITE;
/*!40000 ALTER TABLE `question_concept` DISABLE KEYS */;
INSERT INTO `question_concept` VALUES (1,2,14,'2011-09-22 23:23:43','2011-09-22 23:23:43',11,15),(2,2,14,'2011-09-22 23:23:48','2011-09-22 23:23:48',11,19),(3,2,14,'2011-09-22 23:56:20','2011-09-22 23:56:20',9,15),(4,2,14,'2011-09-23 00:07:10','2011-09-23 00:07:10',7,26),(5,2,14,'2011-09-23 00:07:14','2011-09-23 00:07:14',7,27),(6,2,20,'2011-09-23 00:32:32','2011-09-23 00:32:32',7,28),(7,1,12,'2011-09-23 15:05:04','2011-09-23 15:05:04',6,3),(8,1,10,'2011-09-23 15:14:46','2011-09-23 15:14:46',1,5),(9,1,10,'2011-09-23 15:14:56','2011-09-23 15:14:56',1,6);
/*!40000 ALTER TABLE `question_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `example_concept`
--

DROP TABLE IF EXISTS `example_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `example_concept` (
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
  KEY `fk_answer_concept_concepts1` (`concept_id`),
  CONSTRAINT `fk_answer_concept_answers10` FOREIGN KEY (`example_id`) REFERENCES `example` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts10` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs12000` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users2000` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `example_concept`
--

LOCK TABLES `example_concept` WRITE;
/*!40000 ALTER TABLE `example_concept` DISABLE KEYS */;
INSERT INTO `example_concept` VALUES (1,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49',1,1),(2,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49',1,2),(3,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49',1,3);
/*!40000 ALTER TABLE `example_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elo_template`
--

DROP TABLE IF EXISTS `elo_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elo_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs1` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elo_template`
--

LOCK TABLES `elo_template` WRITE;
/*!40000 ALTER TABLE `elo_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `elo_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
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
  `status` int(11) DEFAULT '0',
  `is_published` int(11) NOT NULL DEFAULT '0',
  `is_public` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs10` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users0` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,6,'2011-09-22 02:17:08','2011-09-22 02:17:08','Kin 01','LONG','<p><span style=\"font-size: small;\">A boy runs as fast as he can to a video game store two blocks from his home. After making a purchase he runs home, again running as fast as he can. </span></p>\r\n<p><span style=\"font-size: small;\">Use the position-time graph above to answer these questions:</span></p>\r\n<p><span style=\"font-size: small;\">a) When did the boy run faster, on the way to the store or on the way home? Explain your answer.</span></p>\r\n<p><span style=\"font-size: small;\">b) Assume the reason for the difference in speeds was that in one case the boy was running uphill and in the other downhill. Which is at the higher elevation, his home, or the video game store? Explain your answer.</span></p>','http://place.aardvark.encorelab.org/content/graph.jpg','graph.jpg','image/jpeg',0,0,1,0),(2,1,6,'2011-09-22 02:20:58','2011-09-22 02:20:58','Kin 02','LONG','<p><span style=\"font-size: small;\">Under what conditions will the magnitude of the displacement for a moving object be the same as the distance it travels?</span></p>','','','',0,0,1,0),(3,1,6,'2011-09-22 02:30:14','2011-09-22 02:30:14','Kin 03','LONG','<p><span style=\"font-size: medium;\">These could not be the position-time graph for a moving object.</span></p>\r\n<p><span style=\"font-size: medium;\">Explain why in each case.</span></p>','http://place.aardvark.encorelab.org/content/2graphs.jpg','2graphs.jpg','image/jpeg',0,0,1,0),(4,1,6,'2011-09-22 02:37:27','2011-09-22 02:37:27','Kin 04','LONG','<p><span style=\"font-size: medium;\">Two trains, each 1.0 km long, are heading towards each other at 50 km/h. At a certain moment, their locomotives are right beside one another (they are on parallel tracks).</span></p>\r\n<p><span style=\"font-size: medium;\">How much time passes before their cabooses are beside on another? (give answer in minutes)</span></p>','http://place.aardvark.encorelab.org/content/train.JPG','train.JPG','image/jpeg',0,0,1,0),(5,1,6,'2011-09-22 02:48:15','2011-09-22 02:48:15','Kin 05','MC','<p><span style=\"font-size: medium;\">Of the following situations, which one is impossible?</span></p>\r\n<p><span style=\"font-size: medium;\">a) </span><span style=\"font-size: medium;\">A body having velocity east and acceleration east</span></p>\r\n<p><span style=\"font-size: medium;\">b) A body having velocity east and acceleration west</span></p>\r\n<p><span style=\"font-size: medium;\">c) A body having zero velocity and non-zero acceleration</span></p>\r\n<p><span style=\"font-size: medium;\">d</span><span style=\"font-size: medium;\">) A body having constant acceleration and variable velocity</span></p>\r\n<p><span style=\"font-size: medium;\">e) </span><span style=\"font-size: medium;\">A body having constant velocity and variable acceleration</span></p>\r\n<p>&nbsp;</p>','http://place.aardvark.encorelab.org/content/mc.JPG','mc.JPG','image/jpeg',5,0,1,0),(6,1,6,'2011-09-22 02:50:22','2011-09-22 02:50:22','[ ... ]','MC','','http://place.aardvark.encorelab.org/content/Capture.JPG','Capture.JPG','image/jpeg',5,0,1,0),(7,2,9,'2011-09-22 02:58:47','2011-09-22 02:58:47','Kin 01','LONG','<p><span style=\"font-size: medium;\">A boy runs as fast as he can to a video game store two blocks from his home. After making a purchase he runs home, again running as fast as he can.</span></p>\r\n<p>&nbsp;<span style=\"font-size: medium;\">Use the position-time graph above to answer these questions:</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">a) When did the boy run faster, on the way to the store or on the way home? Explain your answer.</span></p>\r\n<p>&nbsp;<span style=\"font-size: medium;\">b) Assume the reason for the difference in speeds was that in one case the boy was running uphill and in the other downhill. Which is at the higher elevation, his home, or the video game store? Explain your answer.</span></p>','http://place.aardvark.encorelab.org/content/graph.jpg','graph.jpg','image/jpeg',0,0,1,0),(8,2,9,'2011-09-22 03:00:20','2011-09-22 03:00:20','Kin 02','LONG','<p><span style=\"font-size: medium;\">These could not be the position-time graph for a moving object.</span></p>\r\n<p><span style=\"font-size: medium;\">Explain why in each case.</span></p>','http://place.aardvark.encorelab.org/content/2graphs.jpg','2graphs.jpg','image/jpeg',0,0,1,0),(9,2,9,'2011-09-22 03:01:16','2011-09-22 03:01:16','Kin 03','LONG','<p><span style=\"font-size: medium;\">Under what conditions will the magnitude of the displacement for a moving object be the same as the distance it travels?</span></p>','http://place.aardvark.encorelab.org/content/UTS_logo.jpg','UTS_logo.jpg','image/jpeg',0,0,1,0),(10,2,9,'2011-09-22 03:02:28','2011-09-22 03:02:28','Kin 04','LONG','<p><span style=\"font-size: medium;\">Two trains, each 1.0 km long, are heading towards each other at 50 km/h. At a certain moment, their locomotives are right beside one another (they are on parallel tracks).</span></p>\r\n<p><span style=\"font-size: medium;\">How much time passes before their cabooses are beside on another? (give answer in minutes)</span></p>','http://place.aardvark.encorelab.org/content/train.JPG','train.JPG','image/jpeg',0,0,1,0),(11,2,9,'2011-09-22 03:03:29','2011-09-22 03:03:29','Kin 05','MC','<p><span style=\"font-size: medium;\">Of the following situations, which one is impossible?</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">a) A body having velocity east and acceleration east</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;b) A body having velocity east and acceleration west</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;c) A body having zero velocity and non-zero acceleration</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;d) A body having constant acceleration and variable velocity</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;e) A body having constant velocity and variable acceleration</span></p>','http://place.aardvark.encorelab.org/content/mc.JPG','mc.JPG','image/jpeg',5,0,1,0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_concept`
--

DROP TABLE IF EXISTS `answer_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_concept` (
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
  KEY `fk_answer_concept_concepts1` (`concept_id`),
  CONSTRAINT `fk_answer_concept_answers1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_concept_concepts1` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs1200` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users200` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_concept`
--

LOCK TABLES `answer_concept` WRITE;
/*!40000 ALTER TABLE `answer_concept` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
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
  KEY `fk_activities_users1` (`activity_on_user`),
  CONSTRAINT `fk_activities_users1` FOREIGN KEY (`activity_on_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_type1` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs14` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users4` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,1,6,'2011-09-22 02:17:08','2011-09-22 02:17:08',12,NULL,1,0,0,0,0,'','','','Questions',''),(2,1,6,'2011-09-22 02:20:58','2011-09-22 02:20:58',12,NULL,2,0,0,0,0,'','','','Questions',''),(3,1,6,'2011-09-22 02:30:14','2011-09-22 02:30:14',12,NULL,3,0,0,0,0,'','','','Questions',''),(4,1,6,'2011-09-22 02:37:27','2011-09-22 02:37:27',12,NULL,4,0,0,0,0,'','','','Questions',''),(5,1,6,'2011-09-22 02:48:16','2011-09-22 02:48:16',12,NULL,5,0,0,0,0,'','','','Questions',''),(6,1,6,'2011-09-22 02:50:22','2011-09-22 02:50:22',12,NULL,6,0,0,0,0,'','','','Questions',''),(7,2,9,'2011-09-22 02:58:47','2011-09-22 02:58:47',12,NULL,7,0,0,0,0,'','','','Questions',''),(8,2,9,'2011-09-22 03:00:20','2011-09-22 03:00:20',12,NULL,8,0,0,0,0,'','','','Questions',''),(9,2,9,'2011-09-22 03:01:16','2011-09-22 03:01:16',12,NULL,9,0,0,0,0,'','','','Questions',''),(10,2,9,'2011-09-22 03:02:28','2011-09-22 03:02:28',12,NULL,10,0,0,0,0,'','','','Questions',''),(11,2,9,'2011-09-22 03:03:29','2011-09-22 03:03:29',12,NULL,11,0,0,0,0,'','','','Questions',''),(12,2,19,'2011-09-22 19:53:23','2011-09-22 19:53:23',13,NULL,7,1,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(13,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43',10,19,7,1,1,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(14,2,14,'2011-09-22 23:23:43','2011-09-22 23:23:43',16,NULL,11,15,1,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(15,2,14,'2011-09-22 23:23:48','2011-09-22 23:23:48',16,NULL,11,19,2,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(16,2,14,'2011-09-22 23:23:54','2011-09-22 23:23:54',14,14,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(17,2,14,'2011-09-22 23:24:17','2011-09-22 23:24:17',13,NULL,11,2,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(18,2,14,'2011-09-22 23:51:30','2011-09-22 23:51:30',13,NULL,10,3,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(19,2,14,'2011-09-22 23:56:20','2011-09-22 23:56:20',16,NULL,9,15,3,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(20,2,14,'2011-09-22 23:56:48','2011-09-22 23:56:48',13,NULL,9,4,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(21,2,14,'2011-09-23 00:01:29','2011-09-23 00:01:29',13,NULL,8,5,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(22,2,14,'2011-09-23 00:07:10','2011-09-23 00:07:10',16,NULL,7,26,4,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(23,2,14,'2011-09-23 00:07:14','2011-09-23 00:07:14',16,NULL,7,27,5,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(24,2,14,'2011-09-23 00:12:23','2011-09-23 00:12:23',13,NULL,7,6,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(25,2,20,'2011-09-23 00:32:32','2011-09-23 00:32:32',16,NULL,7,28,6,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(26,2,20,'2011-09-23 00:32:54','2011-09-23 00:32:54',14,20,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(27,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',14,20,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(28,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',14,20,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(29,2,20,'2011-09-23 00:37:28','2011-09-23 00:37:28',13,NULL,7,7,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(30,2,20,'2011-09-23 00:39:31','2011-09-23 00:39:31',13,NULL,8,8,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(31,2,22,'2011-09-23 00:46:01','2011-09-23 00:46:01',14,22,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(32,2,22,'2011-09-23 00:46:08','2011-09-23 00:46:08',13,NULL,7,9,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(33,2,22,'2011-09-23 00:47:37','2011-09-23 00:47:37',13,NULL,8,10,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(34,2,22,'2011-09-23 00:50:10','2011-09-23 00:50:10',13,NULL,9,11,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(35,2,20,'2011-09-23 00:52:23','2011-09-23 00:52:23',13,NULL,11,12,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(36,2,20,'2011-09-23 00:52:30','2011-09-23 00:52:30',14,20,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(37,2,20,'2011-09-23 00:52:39','2011-09-23 00:52:39',14,20,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(38,2,22,'2011-09-23 00:55:16','2011-09-23 00:55:16',13,NULL,11,13,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(39,2,20,'2011-09-23 00:56:22','2011-09-23 00:56:22',13,NULL,9,14,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(40,2,20,'2011-09-23 00:56:28','2011-09-23 00:56:28',14,20,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(41,1,12,'2011-09-23 15:05:04','2011-09-23 15:05:04',16,NULL,6,3,7,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(42,1,12,'2011-09-23 15:05:06','2011-09-23 15:05:06',14,12,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(43,1,12,'2011-09-23 15:05:53','2011-09-23 15:05:53',13,NULL,6,15,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(44,1,33,'2011-09-23 15:06:32','2011-09-23 15:06:32',14,33,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(45,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49',11,NULL,1,0,0,0,0,'Example','','','Example',NULL),(46,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',4,33,1,1,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(47,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',4,33,1,2,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(48,1,33,'2011-09-23 15:09:28','2011-09-23 15:09:28',4,33,1,3,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(49,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',4,38,1,1,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(50,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',4,38,1,2,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(51,1,38,'2011-09-23 15:09:49','2011-09-23 15:09:49',4,38,1,3,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(52,1,44,'2011-09-23 15:11:27','2011-09-23 15:11:27',14,44,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(53,1,11,'2011-09-23 15:11:49','2011-09-23 15:11:49',13,NULL,1,16,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(54,1,39,'2011-09-23 15:13:08','2011-09-23 15:13:08',13,NULL,1,17,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(55,1,42,'2011-09-23 15:14:30','2011-09-23 15:14:30',1,42,1,1,0,0,0,'Example','Comment','','voted on commePr',NULL),(56,1,10,'2011-09-23 15:14:46','2011-09-23 15:14:46',16,NULL,1,5,8,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(57,1,10,'2011-09-23 15:14:56','2011-09-23 15:14:56',16,NULL,1,6,9,0,0,'Question','Question','Question','Tagg Example with a Concept',NULL),(58,1,11,'2011-09-23 15:15:23','2011-09-23 15:15:23',13,NULL,2,18,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(59,1,39,'2011-09-23 15:15:47','2011-09-23 15:15:47',13,NULL,2,19,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(60,1,38,'2011-09-23 15:16:59','2011-09-23 15:16:59',14,38,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(61,1,38,'2011-09-23 15:17:00','2011-09-23 15:17:00',14,38,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(62,1,11,'2011-09-23 15:17:01','2011-09-23 15:17:01',13,NULL,3,20,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(63,1,38,'2011-09-23 15:17:34','2011-09-23 15:17:34',13,NULL,1,21,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(64,1,37,'2011-09-23 15:17:54','2011-09-23 15:17:54',13,NULL,1,22,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
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
  KEY `fk_answers_questions1` (`question_id`),
  CONSTRAINT `fk_answers_questions1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_runs11` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,2,19,'2011-09-22 19:53:23','2011-09-22 19:53:23','[ ... ]','<p>On the way home, the slope is steeper. The video game store, as he was faster going downhill and that was retourning from the video game store to his home.</p>\r\n<p>&nbsp;</p>',7,''),(2,2,14,'2011-09-22 23:24:17','2011-09-22 23:24:16','[ ... ]','[ ... ]',11,'E'),(3,2,14,'2011-09-22 23:51:30','2011-09-22 23:51:30','[ ... ]','<p>Since they are 1.0 km and travel at the same speed (but in opposite directions), they will each travel 0.5 km (half the length of the train) from the time that they are beside each other to the time that their carbooses are beside each other. Knowing the speed and the distance, we can calculate for time:</p>\r\n<p style=\"margin-left: 30px;\">t = d&nbsp;&divide; s</p>\r\n<p style=\"margin-left: 30px;\">t = 0.5 km&nbsp;&divide; 50 km/h</p>\r\n<p style=\"margin-left: 30px;\">t = 0.01 h</p>\r\n<p style=\"margin-left: 30px;\">&nbsp; = 0.6 min</p>\r\n<p>Therefore, 0.6 min pass before their cabooses are beside each other.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',10,''),(4,2,14,'2011-09-22 23:56:48','2011-09-22 23:56:48','[ ... ]','<p>Displacement is a vector quantity with a direction and a magnitude (distance). Magnitude and distance are interchangeable terms in the context of displacement. Therefore, the magnitude of a moving object\'s displacement will always be equal to the distance that it travels.&nbsp;</p>',9,''),(5,2,14,'2011-09-23 00:01:29','2011-09-23 00:01:29','[ ... ]','<p>The explanation is the same in both cases. These graphs fail the vertical-line test. At a given time, it is impossible to have 2 values for distance: an object cannot be at two different places at once.&nbsp;</p>',8,''),(6,2,14,'2011-09-23 00:12:23','2011-09-23 00:12:23','[ ... ]','<div>\r\n<p>a) He runs faster on his way home: less time is needed for him to cover the distance between the store and his house.</p>\r\n<p>b) The video store is at the higher elevation. It takes him longer to reach the store, since he has to run upwards against the Earth\'s gravitational pull. The boy\'s gravitational potential energy at the store is greater relative to that at his house. This allows him to run home faster, going downhill.&nbsp;</p>\r\n</div>',7,''),(7,2,20,'2011-09-23 00:37:28','2011-09-23 00:37:28','[ ... ]','<p>a) On the way home. On a position time graph (d-t), the slope of a line is equivalent to the velocity. We see that on his way back, the slope of the line is steeper than the slope of the line when he is on his way to the store. Therefore, he is going faster on his way back.</p>\r\n<p>b) The video game store is at a higher elevation. When something is at a higher location, the potential energy is higher. According to the law of the conservation of energy, energy cannot be made or destroyed. So when something at a lower elevation (lower potential energy) tries to go to something of a higher location (higher potential energy), more kinetic energy must be added in order to maintain the equilibrum. In other words, going up is harder than going down, so going up will be slower than going down. From the last question we see that he runs faster on the way down, so that must mean the video game store is at a higher elevation.</p>',7,''),(8,2,20,'2011-09-23 00:39:31','2011-09-23 00:39:31','[ ... ]','<p>In either case, there are times on the graph when there are two points assigned to each x intercept value (time). This would mean that an object is at two different locations at the same time. This is impossible, so as a result this can not be the position time graph for a moving object.</p>',8,''),(9,2,22,'2011-09-23 00:46:08','2011-09-23 00:46:08','[ ... ]','<p>a) he ran faster on his way home because he ran the same distance in less time. based on the graph it took him less time to go home then it did to get there.</p>\r\n<p>&nbsp;</p>\r\n<p>b) since his run home was faster than his run to the video game store, one would think that his home was at the bottom of the hill because it is easier for him to run downhill and move with the force of gravity than it is for him to run uphill and go against it</p>',7,''),(10,2,22,'2011-09-23 00:47:37','2011-09-23 00:47:37','[ ... ]','<p>there cannot be 2 positions for one point in time. in math we would say that these graphs fail a vertical line test. a test to ensure that every x value only has 1 y value. in this case, every second only has 1 position as one object cannot be in two places at once&nbsp;</p>',8,''),(11,2,22,'2011-09-23 00:50:10','2011-09-23 00:50:10','[ ... ]','<p>I think only if it moves in a straight line because distance is the length along the path and displacement is the distance from the origin of the movement. these two things will be equal under the conditions of a straight line.</p>',9,''),(12,2,20,'2011-09-23 00:52:23','2011-09-23 00:52:23','[ ... ]','<p>a) is possible. Having a velocity east&nbsp;means that something is moving east. having an acceleration east means that the something is increasing its speed as it goes east.</p>\r\n<p>b) is possible. having a velocity east means that an object is moving east. having an acceleration west means that it has an acceleration of xm/s<sup>2</sup> [w] = -xm/s<sup>2</sup> [E]. that means that its speed would be slowing down, as it is speeding up in the opposite direction.</p>\r\n<p>c) is possible. when something is thrown into the air, it will have velocity until one moment in time when it stops moving for an instant. However, due to gravity, it has acceleration (negative to going up). this acceleration is about 9.8m/s<sup>2 </sup></p>\r\n<p>d) is possible. &nbsp;velocity is a vector, so it has direction and magnitude. if acceleration is constant, it will be speeding up at the same rate, but it might be changing directions, resulting in a variable velocity.</p>\r\n<p>e) is not possible. if you are moving at the constant velocity, your speed (magnitude wise) and directional wise is not changing. that means, the slope of this on a (v-t) graph would be zero. acceleration can not be anything apart from zero.</p>',11,'E'),(13,2,22,'2011-09-23 00:55:16','2011-09-23 00:55:16','[ ... ]','[ ... ]',11,'C'),(14,2,20,'2011-09-23 00:56:22','2011-09-23 00:56:22','[ ... ]','<p>If it is moving in a straight line in only one direction.</p>\r\n<p>When something moves apart from a straight line, its path is&nbsp;curved, and the displacement, being a straight line, would not be equivalent to one another. And if it moves in more than one direction, then the displacement of it will be the shortest path of the movement, so not necessarily the distance it travelled.</p>',9,''),(15,1,12,'2011-09-23 15:05:53','2011-09-23 15:05:53','[ ... ]','<p>This site is awesome!</p>',6,'C'),(16,1,11,'2011-09-23 15:11:49','2011-09-23 15:11:49','[ ... ]','<p>a) The boy ran faster&nbsp;on&nbsp;his way home because the slope was steeper.</p>\r\n<p>b) The video game store is at a higher elevation because that would explain why he runs faster on the way home</p>',1,''),(17,1,39,'2011-09-23 15:13:08','2011-09-23 15:13:08','[ ... ]','<p>a) He ran faster on the way home, because the slope of the line going back to the origin is steeper.</p>\r\n<p>b) The store is at the higher elevation, because it took him more time to get up to the store than it took to get down to his home.</p>',1,''),(18,1,11,'2011-09-23 15:15:23','2011-09-23 15:15:23','[ ... ]','<p>When the object is moving in a straight line.</p>',2,''),(19,1,39,'2011-09-23 15:15:47','2011-09-23 15:15:47','[ ... ]','<p>When the object is moving in a straight line.</p>',2,''),(20,1,11,'2011-09-23 15:17:01','2011-09-23 15:17:01','[ ... ]','<p>These graphs do not pass the \"vertical line test\", meaning that the object at some point at least is in two places at the same time which is impossible</p>',3,''),(21,1,38,'2011-09-23 15:17:34','2011-09-23 15:17:34','[ ... ]','<p>a) The boy ran faster when he was on his way home and this is shown in that the line after the time in which he stopped is much steeper than his first slope to get to the store.</p>\r\n<p>b) The video game store is at the higher elevation because his acceleration is slower on the way to the videogame store and higher on the way home.</p>',1,''),(22,1,37,'2011-09-23 15:17:54','2011-09-23 15:17:54','[ ... ]','<p>The boy ran faster home (which is kind of strange), this is apparent because the third line segment, which represents his going home, is steeper/more vertical/further from y=(constant) than the first line segment.</p>',1,'');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `obj_id` int(11) NOT NULL,
  `obj_type` int(11) NOT NULL,
  `mark` double DEFAULT NULL,
  `assessment_review_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  KEY `fk_votes_votable1` (`obj_type`),
  CONSTRAINT `fk_template_runs1510` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users510` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_votable100` FOREIGN KEY (`obj_type`) REFERENCES `assessable` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43',1,2,2,1);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `example`
--

DROP TABLE IF EXISTS `example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `example` (
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
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs12` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users2` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `example`
--

LOCK TABLES `example` WRITE;
/*!40000 ALTER TABLE `example` DISABLE KEYS */;
INSERT INTO `example` VALUES (1,1,12,'2011-09-23 15:08:49','2011-09-23 15:08:49','Example Example','<p>This shows vectors because of...<img class=\"Wirisformula\" title=\"Double click to edit\" src=\"Error: no mathml has been sended.\" alt=\"\" align=\"middle\" /></p>','http://place.aardvark.encorelab.org/content/258ff78d-98db-43bc-93d7-6ff361366e49_encoded.mp4','258ff78d-98db-43bc-93d7-6ff361366e49_encoded.mp4','video/x-ms-wmv',3);
/*!40000 ALTER TABLE `example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_type`
--

DROP TABLE IF EXISTS `activity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_created` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_users` (`author_id`),
  KEY `fk_template_runs` (`run_id`),
  CONSTRAINT `fk_template_runs13` FOREIGN KEY (`run_id`) REFERENCES `run` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_users3` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_type`
--

LOCK TABLES `activity_type` WRITE;
/*!40000 ALTER TABLE `activity_type` DISABLE KEYS */;
INSERT INTO `activity_type` VALUES (1,1,1,'2011-09-21 19:55:47',NULL,'voted on comment'),(2,1,1,'2011-09-21 19:55:47',NULL,'voted on answer'),(3,1,1,'2011-09-21 19:55:47',NULL,'voted on answer concept'),(4,1,1,'2011-09-21 19:55:47',NULL,'voted on example concept'),(5,1,1,'2011-09-21 19:55:47',NULL,'commented on comment'),(6,1,1,'2011-09-21 19:55:47',NULL,'commented on answer'),(7,1,1,'2011-09-21 19:55:47',NULL,'commented on example'),(8,1,1,'2011-09-21 19:55:47',NULL,'assessed comment'),(9,1,1,'2011-09-21 19:55:47',NULL,'assessed example'),(10,1,1,'2011-09-21 19:55:47',NULL,'assessed answer'),(11,1,1,'2011-09-21 19:55:47',NULL,'example created'),(12,1,1,'2011-09-21 19:55:47',NULL,'question created'),(13,1,1,'2011-09-21 19:55:47',NULL,'answered question'),(14,1,1,'0000-00-00 00:00:00',NULL,'voted on question_concept'),(15,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','voted on example question'),(16,1,1,'2011-09-21 19:55:47',NULL,'tagged a concept with a question'),(17,1,1,'2011-09-21 19:55:47',NULL,'tagged a concept with an example');
/*!40000 ALTER TABLE `activity_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-09-23 16:15:33