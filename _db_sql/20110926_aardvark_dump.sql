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
INSERT INTO `comment` VALUES (1,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',1,3,'<p>This is an example of static friction when he turn the laptop on the table</p>',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolved_user_alert`
--

LOCK TABLES `resolved_user_alert` WRITE;
/*!40000 ALTER TABLE `resolved_user_alert` DISABLE KEYS */;
INSERT INTO `resolved_user_alert` VALUES (1,1,6,'2011-09-22 02:49:16','2011-09-22 02:49:16',5,'ok'),(2,2,26,'2011-09-22 19:48:49','2011-09-22 19:48:49',7,'ok'),(3,2,26,'2011-09-22 19:48:50','2011-09-22 19:48:50',8,'ok'),(4,2,26,'2011-09-22 19:48:51','2011-09-22 19:48:51',9,'ok'),(5,2,26,'2011-09-22 19:48:52','2011-09-22 19:48:52',10,'ok'),(6,2,26,'2011-09-22 19:48:53','2011-09-22 19:48:53',11,'ok'),(7,2,20,'2011-09-22 19:55:06','2011-09-22 19:55:06',12,'ok'),(8,2,19,'2011-09-22 20:14:45','2011-09-22 20:14:45',13,'ok'),(9,1,43,'2011-09-23 21:11:10','2011-09-23 21:11:10',53,'ok'),(10,2,13,'2011-09-24 13:13:42','2011-09-24 13:13:42',76,'ok'),(12,1,7,'2011-09-24 23:16:33','2011-09-24 23:16:33',155,'ok'),(13,2,29,'2011-09-26 17:15:01','2011-09-26 17:15:01',260,'ok'),(14,2,29,'2011-09-26 17:15:02','2011-09-26 17:15:02',259,'ok'),(15,2,29,'2011-09-26 17:15:03','2011-09-26 17:15:03',258,'ok'),(16,2,29,'2011-09-26 17:15:04','2011-09-26 17:15:04',257,'ok'),(17,2,29,'2011-09-26 17:15:07','2011-09-26 17:15:07',261,'ok'),(18,2,29,'2011-09-26 17:15:09','2011-09-26 17:15:09',262,'ok'),(19,2,29,'2011-09-26 17:15:09','2011-09-26 17:15:09',263,'ok'),(20,2,29,'2011-09-26 17:15:11','2011-09-26 17:15:11',264,'ok'),(21,2,29,'2011-09-26 17:15:12','2011-09-26 17:15:12',265,'ok'),(22,2,29,'2011-09-26 17:15:13','2011-09-26 17:15:13',266,'ok'),(23,2,29,'2011-09-26 17:15:14','2011-09-26 17:15:14',267,'ok'),(24,2,29,'2011-09-26 17:15:15','2011-09-26 17:15:15',268,'ok'),(25,2,29,'2011-09-26 17:15:16','2011-09-26 17:15:16',269,'ok'),(26,2,29,'2011-09-26 17:15:17','2011-09-26 17:15:17',270,'ok'),(27,2,29,'2011-09-26 17:15:18','2011-09-26 17:15:18',271,'ok'),(28,2,29,'2011-09-26 17:15:20','2011-09-26 17:15:20',272,'ok'),(29,2,29,'2011-09-26 17:15:21','2011-09-26 17:15:21',273,'ok'),(30,2,29,'2011-09-26 17:15:22','2011-09-26 17:15:22',274,'ok');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,NULL,'2011-09-21 19:55:47',NULL,'admin',NULL,'ADMIN','Admin',NULL),(2,1,NULL,'2011-09-21 19:55:47',NULL,'teacher',NULL,'TEACHER','Admin',NULL),(3,1,NULL,'2011-09-21 19:55:47',NULL,'student1',NULL,'STUDENT','Student',NULL),(4,1,NULL,'2011-09-21 19:55:47',NULL,'student2',NULL,'STUDENT','Student',NULL),(5,1,0,'2011-09-21 19:56:04','2011-09-21 19:56:04','drusu',NULL,'STUDENT','coolcat','SPH3UE-03'),(6,1,0,'2011-09-21 20:30:33','2011-09-21 20:30:33','shawnbrooks',NULL,'TEACHER','Shawn Brooks','SPH3UE-03'),(7,1,0,'2011-09-21 23:55:11','2011-09-21 23:55:11','snguyen',NULL,'STUDENT','Stacky','SPH3UE-03'),(8,1,0,'2011-09-21 23:55:29','2011-09-21 23:55:29','slim',NULL,'STUDENT','Panda','SPH3UE-03'),(9,2,0,'2011-09-22 02:54:02','2011-09-22 02:54:02','shawnbrooks2',NULL,'TEACHER','Shawn Brooks','SPH3UE-04'),(10,1,0,'2011-09-22 17:04:23','2011-09-22 17:04:23','hfung',NULL,'STUDENT','Cressestes','SPH3UE-03'),(11,1,0,'2011-09-22 17:59:02','2011-09-22 17:59:01','sliu',NULL,'STUDENT','DOLPHIN','SPH3UE-03'),(12,1,0,'2011-09-22 18:00:18','2011-09-22 18:00:18','schan',NULL,'STUDENT','Mcchan','SPH3UE-03'),(13,2,0,'2011-09-22 18:43:44','2011-09-22 18:43:44','mhsueh',NULL,'STUDENT','Wacka Flocka Flame','SPH3UE-04'),(14,2,0,'2011-09-22 19:44:43','2011-09-22 19:44:43','sly',NULL,'STUDENT','owl','SPH3UE-04'),(15,2,0,'2011-09-22 19:44:49','2011-09-22 19:44:49','cchen',NULL,'STUDENT','Fluttershy','SPH3UE-04'),(16,2,0,'2011-09-22 19:45:59','2011-09-22 19:45:59','aluk',NULL,'STUDENT','allanluk','SPH3UE-04'),(17,2,0,'2011-09-22 19:46:01','2011-09-22 19:46:01','cykim',NULL,'STUDENT','tigger','SPH3UE-04'),(18,2,0,'2011-09-22 19:46:37','2011-09-22 19:46:37','dbekah',NULL,'STUDENT','wijj','SPH3UE-04'),(19,2,0,'2011-09-22 19:46:41','2011-09-22 19:46:41','pyung',NULL,'STUDENT','JesusofNazareth','SPH3UE-04'),(20,2,0,'2011-09-22 19:46:42','2011-09-22 19:46:42','Jpark',NULL,'STUDENT','prophet','SPH3UE-04'),(21,2,0,'2011-09-22 19:47:10','2011-09-22 19:47:10','small',NULL,'STUDENT','Nicky Minaj','SPH3UE-04'),(22,2,0,'2011-09-22 19:47:31','2011-09-22 19:47:31','mvirji',NULL,'STUDENT','malika.virji','SPH3UE-04'),(23,2,0,'2011-09-22 19:47:43','2011-09-22 19:47:43','pwang',NULL,'STUDENT','chuck','SPH3UE-04'),(24,2,0,'2011-09-22 19:47:54','2011-09-22 19:47:54','JCheung',NULL,'STUDENT','jason','SPH3UE-04'),(25,2,0,'2011-09-22 19:48:12','2011-09-22 19:48:12','chkim',NULL,'STUDENT','eeyore','SPH3UE-04'),(26,2,0,'2011-09-22 19:48:41','2011-09-22 19:48:41','aho',NULL,'STUDENT','heffalump','SPH3UE-04'),(27,2,0,'2011-09-22 19:51:21','2011-09-22 19:51:21','eclarke',NULL,'STUDENT','piglet','SPH3UE-04'),(28,2,0,'2011-09-22 19:51:52','2011-09-22 19:51:52','spira',NULL,'STUDENT','Gucci Mayne','SPH3UE-04'),(29,2,0,'2011-09-22 19:54:25','2011-09-22 19:54:25','dlim',NULL,'STUDENT','davidlim','SPH3UE-04'),(30,2,0,'2011-09-23 13:45:39','2011-09-23 13:45:39','studentadmin2',NULL,'STUDENT','Not a Student','SPH3UE-04'),(31,1,0,'2011-09-23 13:54:37','2011-09-23 13:54:37','teacheradmin',NULL,'TEACHER','Not a Teacher','SPH3UE-03'),(32,2,0,'2011-09-23 13:55:03','2011-09-23 13:55:03','teacheradmin2',NULL,'TEACHER','Not a Teacher','SPH3UE-04'),(33,1,0,'2011-09-23 14:40:26','2011-09-23 14:40:26','wzhao',NULL,'STUDENT','Fuzzy Hunny Pot','SPH3UE-03'),(34,1,0,'2011-09-23 15:01:25','2011-09-23 15:01:25','studentadmin',NULL,'STUDENT','Not a Student','SPH3UE-03'),(35,1,0,'2011-09-23 15:04:12','2011-09-23 15:04:12','jinkaran',NULL,'STUDENT','jeymaestro','SPH3UE-03'),(36,1,0,'2011-09-23 15:04:28','2011-09-23 15:04:28','Axia',NULL,'STUDENT','Prepod','SPH3UE-03'),(37,1,0,'2011-09-23 15:05:28','2011-09-23 15:05:28','tclokie',NULL,'STUDENT','trevc','SPH3UE-03'),(38,1,0,'2011-09-23 15:06:13','2011-09-23 15:06:13','npirani',NULL,'STUDENT','Nadz','SPH3UE-03'),(39,1,0,'2011-09-23 15:06:33','2011-09-23 15:06:33','jyan',NULL,'STUDENT','Jenbun','SPH3UE-03'),(40,1,0,'2011-09-23 15:08:09','2011-09-23 15:08:09','ookarmus',NULL,'STUDENT','the knight who says ni','SPH3UE-03'),(41,1,0,'2011-09-23 15:10:00','2011-09-23 15:10:00','byuen',NULL,'STUDENT','Evil Genius','SPH3UE-03'),(42,1,0,'2011-09-23 15:10:38','2011-09-23 15:10:38','cwang',NULL,'STUDENT','Beluga Buddy','SPH3UE-03'),(43,1,0,'2011-09-23 15:10:53','2011-09-23 15:10:53','ssirca',NULL,'STUDENT','Sherbunny','SPH3UE-03'),(44,1,0,'2011-09-23 15:11:06','2011-09-23 15:11:06','vpang',NULL,'STUDENT','gentle cougar','SPH3UE-03'),(45,1,0,'2011-09-23 15:11:18','2011-09-23 15:11:18','ama',NULL,'STUDENT','Angema','SPH3UE-03'),(46,1,0,'2011-09-23 15:13:30','2011-09-23 15:13:30','ptiengou',NULL,'STUDENT','PiTi','SPH3UE-03'),(49,1,0,'2011-09-23 15:20:14','2011-09-23 15:20:14','jgungabeesoon',NULL,'STUDENT','jgungabeesoon','SPH3UE-03'),(50,2,0,'2011-09-24 18:22:09','2011-09-24 18:22:09','EShang',NULL,'STUDENT','Anonymous','SPH3UE-04'),(51,2,0,'2011-09-26 03:32:54','2011-09-26 03:32:54','segrangier',NULL,'STUDENT','yayou','SPH3UE-04'),(52,2,0,'2011-09-26 21:01:12','2011-09-26 21:01:12','hchen',NULL,'STUDENT','Harry','SPH3UE-04');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,2,14,'2011-09-22 23:23:54','2011-09-22 23:23:54',2,5,1),(2,2,20,'2011-09-23 00:32:54','2011-09-23 00:32:54',4,5,1),(3,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',5,5,1),(4,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',6,5,1),(5,2,22,'2011-09-23 00:46:01','2011-09-23 00:46:01',6,5,1),(6,2,20,'2011-09-23 00:52:30','2011-09-23 00:52:30',2,5,1),(7,2,20,'2011-09-23 00:52:39','2011-09-23 00:52:39',1,5,1),(8,2,20,'2011-09-23 00:56:28','2011-09-23 00:56:28',3,5,1),(9,1,12,'2011-09-23 15:05:06','2011-09-23 15:05:06',7,5,1),(10,1,33,'2011-09-23 15:06:32','2011-09-23 15:06:32',7,5,-1),(11,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',1,4,1),(12,1,33,'2011-09-23 15:09:27','2011-09-23 15:09:27',2,4,1),(13,1,33,'2011-09-23 15:09:28','2011-09-23 15:09:28',3,4,1),(14,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',1,4,-1),(15,1,38,'2011-09-23 15:09:48','2011-09-23 15:09:48',2,4,-1),(16,1,38,'2011-09-23 15:09:49','2011-09-23 15:09:49',3,4,-1),(17,1,44,'2011-09-23 15:11:27','2011-09-23 15:11:27',7,5,1),(18,1,42,'2011-09-23 15:14:30','2011-09-23 15:14:30',1,1,1),(19,1,38,'2011-09-23 15:16:59','2011-09-23 15:16:59',8,5,1),(20,1,38,'2011-09-23 15:17:00','2011-09-23 15:17:00',9,5,1),(21,2,16,'2011-09-23 18:44:38','2011-09-23 18:44:38',4,4,-1),(22,2,16,'2011-09-23 18:44:39','2011-09-23 18:44:39',5,4,1),(23,2,16,'2011-09-23 18:44:40','2011-09-23 18:44:40',6,4,1),(24,2,16,'2011-09-23 18:44:46','2011-09-23 18:44:46',7,4,1),(25,2,16,'2011-09-23 18:44:49','2011-09-23 18:44:49',2,1,1),(26,1,43,'2011-09-23 21:26:11','2011-09-23 21:26:11',8,5,1),(27,1,43,'2011-09-23 21:26:12','2011-09-23 21:26:12',9,5,1),(28,1,45,'2011-09-23 23:53:22','2011-09-23 23:53:22',9,5,1),(29,1,44,'2011-09-24 15:03:09','2011-09-24 15:03:09',8,5,1),(30,1,44,'2011-09-24 15:03:11','2011-09-24 15:03:11',9,5,1),(31,2,17,'2011-09-24 19:20:53','2011-09-24 19:20:53',6,5,1),(32,2,17,'2011-09-24 19:22:09','2011-09-24 19:22:09',4,5,1),(33,2,17,'2011-09-24 19:37:31','2011-09-24 19:37:31',2,5,1),(34,2,24,'2011-09-24 21:23:18','2011-09-24 21:23:18',4,5,1),(35,2,24,'2011-09-24 21:23:30','2011-09-24 21:23:30',6,5,1),(36,2,24,'2011-09-24 21:28:19','2011-09-24 21:28:19',3,5,1),(37,2,24,'2011-09-24 21:35:02','2011-09-24 21:35:02',1,5,1),(38,2,24,'2011-09-24 21:35:03','2011-09-24 21:35:03',2,5,1),(39,1,7,'2011-09-24 23:03:21','2011-09-24 23:03:21',8,5,1),(40,1,7,'2011-09-24 23:16:08','2011-09-24 23:16:08',11,5,1),(41,1,7,'2011-09-24 23:34:22','2011-09-24 23:34:22',10,5,1),(42,2,18,'2011-09-25 01:11:52','2011-09-25 01:11:52',4,5,1),(43,2,18,'2011-09-25 01:11:58','2011-09-25 01:11:58',6,5,1),(44,2,18,'2011-09-25 01:14:01','2011-09-25 01:14:01',5,5,1),(45,1,35,'2011-09-25 02:06:36','2011-09-25 02:06:36',8,5,1),(46,2,18,'2011-09-25 15:36:50','2011-09-25 15:36:50',12,5,1),(47,2,18,'2011-09-25 15:53:16','2011-09-25 15:53:16',3,5,1),(48,2,18,'2011-09-25 15:57:05','2011-09-25 15:57:05',13,5,1),(49,1,41,'2011-09-25 17:51:10','2011-09-25 17:51:10',8,5,1),(50,2,18,'2011-09-25 17:55:02','2011-09-25 17:55:02',2,5,1),(51,2,18,'2011-09-25 17:55:07','2011-09-25 17:55:07',1,5,1),(52,1,42,'2011-09-25 18:54:13','2011-09-25 18:54:13',8,5,1),(53,1,42,'2011-09-25 18:54:14','2011-09-25 18:54:14',9,5,1),(54,2,15,'2011-09-25 19:13:09','2011-09-25 19:13:09',5,5,1),(55,2,15,'2011-09-25 19:13:11','2011-09-25 19:13:11',4,5,1),(56,2,15,'2011-09-25 19:21:13','2011-09-25 19:21:13',3,5,1),(57,2,18,'2011-09-25 19:38:29','2011-09-25 19:38:29',14,5,1),(58,2,18,'2011-09-25 19:38:35','2011-09-25 19:38:35',15,5,1),(59,1,38,'2011-09-25 22:29:53','2011-09-25 22:29:53',16,5,1),(60,1,38,'2011-09-25 22:35:30','2011-09-25 22:35:30',10,5,1),(61,1,38,'2011-09-25 23:38:46','2011-09-25 23:38:46',11,5,1),(62,2,26,'2011-09-26 00:48:30','2011-09-26 00:48:30',4,5,1),(63,2,26,'2011-09-26 00:48:57','2011-09-26 00:48:57',5,5,1),(64,2,26,'2011-09-26 00:53:49','2011-09-26 00:53:49',3,5,1),(65,2,26,'2011-09-26 01:00:14','2011-09-26 01:00:14',1,5,1),(66,2,26,'2011-09-26 01:00:15','2011-09-26 01:00:15',2,5,1),(67,2,19,'2011-09-26 02:53:51','2011-09-26 02:53:51',3,5,1),(68,2,19,'2011-09-26 02:53:55','2011-09-26 02:53:55',13,5,1),(69,2,19,'2011-09-26 02:54:09','2011-09-26 02:54:09',4,5,1),(70,2,19,'2011-09-26 02:54:10','2011-09-26 02:54:10',5,5,1),(71,2,19,'2011-09-26 02:54:28','2011-09-26 02:54:28',17,5,1),(72,2,19,'2011-09-26 02:59:02','2011-09-26 02:59:02',14,5,1),(73,2,19,'2011-09-26 02:59:02','2011-09-26 02:59:02',15,5,1),(74,2,19,'2011-09-26 02:59:05','2011-09-26 02:59:05',18,5,1),(75,2,19,'2011-09-26 03:06:39','2011-09-26 03:06:39',2,5,1),(76,2,19,'2011-09-26 03:06:40','2011-09-26 03:06:40',1,5,1),(77,2,29,'2011-09-26 17:05:59','2011-09-26 17:05:59',4,5,-1),(78,2,29,'2011-09-26 17:06:15','2011-09-26 17:06:15',5,5,-1),(79,2,29,'2011-09-26 17:06:25','2011-09-26 17:06:25',6,5,-1),(80,2,29,'2011-09-26 17:06:31','2011-09-26 17:06:31',17,5,-1),(81,2,29,'2011-09-26 17:14:18','2011-09-26 17:14:18',2,5,1),(82,2,30,'2011-09-26 17:33:21','2011-09-26 17:33:21',8,4,1),(83,2,30,'2011-09-26 17:33:23','2011-09-26 17:33:23',9,4,1),(84,1,49,'2011-09-26 21:16:23','2011-09-26 21:16:23',9,5,1),(85,1,49,'2011-09-26 21:16:31','2011-09-26 21:16:31',8,5,-1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_reviews`
--

LOCK TABLES `assessment_reviews` WRITE;
/*!40000 ALTER TABLE `assessment_reviews` DISABLE KEYS */;
INSERT INTO `assessment_reviews` VALUES (1,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43','<p>May need to encourage better explanation/rationale</p>',7,NULL,'question',NULL),(2,2,9,'2011-09-23 18:47:08','2011-09-23 18:47:08','<p>ghjhfuyf</p>',10,NULL,'question',NULL),(3,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16','<p>How do these kids know about conservation of energy already, I haven\'t taught them yet!</p>',7,NULL,'question',NULL),(4,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05','<p>very good concise answers from the students so far with this question</p>',8,NULL,'question',NULL),(5,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52','',9,NULL,'question',NULL),(6,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28','<p>At some point I will explain to students that to get a \"4\" they need to offer explanation, not just an answer.</p>',11,NULL,'question',NULL),(7,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35','<p>Well done question</p>',8,NULL,'question',NULL),(8,1,6,'2011-09-26 18:23:26','2011-09-26 18:23:26','',1,NULL,'question',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_concept`
--

LOCK TABLES `question_concept` WRITE;
/*!40000 ALTER TABLE `question_concept` DISABLE KEYS */;
INSERT INTO `question_concept` VALUES (1,2,14,'2011-09-22 23:23:43','2011-09-22 23:23:43',11,15),(2,2,14,'2011-09-22 23:23:48','2011-09-22 23:23:48',11,19),(3,2,14,'2011-09-22 23:56:20','2011-09-22 23:56:20',9,15),(4,2,14,'2011-09-23 00:07:10','2011-09-23 00:07:10',7,26),(5,2,14,'2011-09-23 00:07:14','2011-09-23 00:07:14',7,27),(6,2,20,'2011-09-23 00:32:32','2011-09-23 00:32:32',7,28),(7,1,12,'2011-09-23 15:05:04','2011-09-23 15:05:04',6,3),(8,1,10,'2011-09-23 15:14:46','2011-09-23 15:14:46',1,5),(9,1,10,'2011-09-23 15:14:56','2011-09-23 15:14:56',1,6),(10,1,43,'2011-09-23 21:46:37','2011-09-23 21:46:37',4,6),(11,1,7,'2011-09-24 23:15:53','2011-09-24 23:15:53',5,5),(12,2,18,'2011-09-25 15:36:44','2011-09-25 15:36:44',8,26),(13,2,18,'2011-09-25 15:56:15','2011-09-25 15:56:15',9,26),(14,2,18,'2011-09-25 19:38:26','2011-09-25 19:38:26',10,20),(15,2,18,'2011-09-25 19:38:34','2011-09-25 19:38:34',10,26),(16,1,38,'2011-09-25 22:28:41','2011-09-25 22:28:41',2,1),(17,2,19,'2011-09-26 02:54:20','2011-09-26 02:54:20',7,19),(18,2,19,'2011-09-26 02:59:04','2011-09-26 02:59:04',10,15),(19,2,19,'2011-09-26 02:59:12','2011-09-26 02:59:12',10,19),(20,2,29,'2011-09-26 17:06:37','2011-09-26 17:06:37',7,15),(21,2,29,'2011-09-26 17:06:39','2011-09-26 17:06:39',7,16),(22,2,29,'2011-09-26 17:06:40','2011-09-26 17:06:40',7,17),(23,2,29,'2011-09-26 17:06:40','2011-09-26 17:06:40',7,18),(24,2,29,'2011-09-26 17:06:41','2011-09-26 17:06:41',7,20),(25,2,29,'2011-09-26 17:06:42','2011-09-26 17:06:42',7,21),(26,2,29,'2011-09-26 17:06:42','2011-09-26 17:06:42',7,22),(27,2,29,'2011-09-26 17:06:43','2011-09-26 17:06:43',7,23),(28,2,29,'2011-09-26 17:06:44','2011-09-26 17:06:44',7,24),(29,2,29,'2011-09-26 17:06:44','2011-09-26 17:06:44',7,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `example_concept`
--

LOCK TABLES `example_concept` WRITE;
/*!40000 ALTER TABLE `example_concept` DISABLE KEYS */;
INSERT INTO `example_concept` VALUES (8,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',1,22),(9,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',1,27),(10,2,30,'2011-09-26 17:33:29','2011-09-26 17:33:29',1,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,6,'2011-09-22 02:17:08','2011-09-22 02:17:08','Kin 01','LONG','<p><span style=\"font-size: small;\">A boy runs as fast as he can to a video game store two blocks from his home. After making a purchase he runs home, again running as fast as he can. </span></p>\r\n<p><span style=\"font-size: small;\">Use the position-time graph above to answer these questions:</span></p>\r\n<p><span style=\"font-size: small;\">a) When did the boy run faster, on the way to the store or on the way home? Explain your answer.</span></p>\r\n<p><span style=\"font-size: small;\">b) Assume the reason for the difference in speeds was that in one case the boy was running uphill and in the other downhill. Which is at the higher elevation, his home, or the video game store? Explain your answer.</span></p>','http://place.aardvark.encorelab.org/content/graph.jpg','graph.jpg','image/jpeg',0,0,1,0),(2,1,6,'2011-09-22 02:20:58','2011-09-22 02:20:58','Kin 02','LONG','<p><span style=\"font-size: small;\">Under what conditions will the magnitude of the displacement for a moving object be the same as the distance it travels?</span></p>','','','',0,0,1,0),(3,1,6,'2011-09-22 02:30:14','2011-09-22 02:30:14','Kin 03','LONG','<p><span style=\"font-size: medium;\">These could not be the position-time graph for a moving object.</span></p>\r\n<p><span style=\"font-size: medium;\">Explain why in each case.</span></p>','http://place.aardvark.encorelab.org/content/2graphs.jpg','2graphs.jpg','image/jpeg',0,0,1,0),(4,1,6,'2011-09-22 02:37:27','2011-09-22 02:37:27','Kin 04','LONG','<p><span style=\"font-size: medium;\">Two trains, each 1.0 km long, are heading towards each other at 50 km/h. At a certain moment, their locomotives are right beside one another (they are on parallel tracks).</span></p>\r\n<p><span style=\"font-size: medium;\">How much time passes before their cabooses are beside on another? (give answer in minutes)</span></p>','http://place.aardvark.encorelab.org/content/train.JPG','train.JPG','image/jpeg',0,0,1,0),(5,1,6,'2011-09-22 02:48:15','2011-09-22 02:48:15','Kin 05','MC','<p><span style=\"font-size: medium;\">Of the following situations, which one is impossible?</span></p>\r\n<p><span style=\"font-size: medium;\">a) </span><span style=\"font-size: medium;\">A body having velocity east and acceleration east</span></p>\r\n<p><span style=\"font-size: medium;\">b) A body having velocity east and acceleration west</span></p>\r\n<p><span style=\"font-size: medium;\">c) A body having zero velocity and non-zero acceleration</span></p>\r\n<p><span style=\"font-size: medium;\">d</span><span style=\"font-size: medium;\">) A body having constant acceleration and variable velocity</span></p>\r\n<p><span style=\"font-size: medium;\">e) </span><span style=\"font-size: medium;\">A body having constant velocity and variable acceleration</span></p>\r\n<p>&nbsp;</p>','http://place.aardvark.encorelab.org/content/mc.JPG','mc.JPG','image/jpeg',5,0,1,0),(6,1,6,'2011-09-22 02:50:22','2011-09-22 02:50:22','[ ... ]','MC','','http://place.aardvark.encorelab.org/content/Capture.JPG','Capture.JPG','image/jpeg',5,0,1,0),(7,2,9,'2011-09-22 02:58:47','2011-09-22 02:58:47','Kin 01','LONG','<p><span style=\"font-size: medium;\">A boy runs as fast as he can to a video game store two blocks from his home. After making a purchase he runs home, again running as fast as he can.</span></p>\r\n<p>&nbsp;<span style=\"font-size: medium;\">Use the position-time graph above to answer these questions:</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">a) When did the boy run faster, on the way to the store or on the way home? Explain your answer.</span></p>\r\n<p>&nbsp;<span style=\"font-size: medium;\">b) Assume the reason for the difference in speeds was that in one case the boy was running uphill and in the other downhill. Which is at the higher elevation, his home, or the video game store? Explain your answer.</span></p>','http://place.aardvark.encorelab.org/content/graph.jpg','graph.jpg','image/jpeg',0,0,1,0),(8,2,9,'2011-09-22 03:00:20','2011-09-22 03:00:20','Kin 02','LONG','<p><span style=\"font-size: medium;\">These could not be the position-time graph for a moving object.</span></p>\r\n<p><span style=\"font-size: medium;\">Explain why in each case.</span></p>','http://place.aardvark.encorelab.org/content/2graphs.jpg','2graphs.jpg','image/jpeg',0,0,1,0),(9,2,9,'2011-09-22 03:01:16','2011-09-22 03:01:16','Kin 03','LONG','<p><span style=\"font-size: medium;\">Under what conditions will the magnitude of the displacement for a moving object be the same as the distance it travels?</span></p>','http://place.aardvark.encorelab.org/content/UTS_logo.jpg','UTS_logo.jpg','image/jpeg',0,0,1,0),(10,2,9,'2011-09-22 03:02:28','2011-09-22 03:02:28','Kin 04','LONG','<p><span style=\"font-size: medium;\">Two trains, each 1.0 km long, are heading towards each other at 50 km/h. At a certain moment, their locomotives are right beside one another (they are on parallel tracks).</span></p>\r\n<p><span style=\"font-size: medium;\">How much time passes before their cabooses are beside on another? (give answer in minutes)</span></p>','http://place.aardvark.encorelab.org/content/train.JPG','train.JPG','image/jpeg',0,0,1,0),(11,2,9,'2011-09-22 03:03:29','2011-09-22 03:03:29','Kin 05','MC','<p><span style=\"font-size: medium;\">Of the following situations, which one is impossible?</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-size: medium;\">a) A body having velocity east and acceleration east</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;b) A body having velocity east and acceleration west</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;c) A body having zero velocity and non-zero acceleration</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;d) A body having constant acceleration and variable velocity</span></p>\r\n<p><span style=\"font-size: medium;\">&nbsp;e) A body having constant velocity and variable acceleration</span></p>','http://place.aardvark.encorelab.org/content/mc.JPG','mc.JPG','image/jpeg',5,0,1,0),(12,2,9,'2011-09-26 18:11:45','2011-09-26 18:11:45','Kin 06','LONG','<p><span style=\"font-size: medium;\">Based on the video above&nbsp;of a toy car travelling up a ramp:</span></p>\r\n<p><span style=\"font-size: medium;\">Do you think it is possible for this toy&nbsp;car to be travelling up the ramp with a constant velocity? </span></p>\r\n<p><span style=\"font-size: medium;\">Explain why or why not.&nbsp; </span></p>\r\n<p><span style=\"font-size: medium;\">What measurements could you make to find out for sure?</span></p>','http://place.aardvark.encorelab.org/content/car_on_ramp_encoded.mp4','car_on_ramp_encoded.mp4','video/quicktime',0,0,1,0),(13,1,6,'2011-09-26 18:14:02','2011-09-26 18:14:02','Kin 06','LONG','<p><span style=\"font-size: medium;\">Based on the video above of a toy car travelling up a ramp:</span></p>\r\n<p><span style=\"font-size: medium;\">Do you think it is possible for this toy car to be travelling up the ramp with a constant velocity? </span></p>\r\n<p><span style=\"font-size: medium;\">Explain why or why not.&nbsp; </span></p>\r\n<p><span style=\"font-size: medium;\">What measurements could you make to find out for sure?</span></p>','http://place.aardvark.encorelab.org/content/car_on_ramp_encoded.mp4','car_on_ramp_encoded.mp4','video/quicktime',0,0,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,1,6,'2011-09-25 17:47:36','2011-09-22 02:17:08',12,NULL,1,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(2,1,6,'2011-09-25 17:47:36','2011-09-22 02:20:58',12,NULL,2,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(3,1,6,'2011-09-25 17:47:36','2011-09-22 02:30:14',12,NULL,3,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(4,1,6,'2011-09-25 17:47:36','2011-09-22 02:37:27',12,NULL,4,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(5,1,6,'2011-09-25 17:47:36','2011-09-22 02:48:16',12,NULL,5,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(6,1,6,'2011-09-25 17:47:36','2011-09-22 02:50:22',12,NULL,6,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(7,2,9,'2011-09-25 17:47:36','2011-09-22 02:58:47',12,NULL,7,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(8,2,9,'2011-09-25 17:47:36','2011-09-22 03:00:20',12,NULL,8,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(9,2,9,'2011-09-25 17:47:36','2011-09-22 03:01:16',12,NULL,9,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(10,2,9,'2011-09-25 17:47:36','2011-09-22 03:02:28',12,NULL,10,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(11,2,9,'2011-09-25 17:47:36','2011-09-22 03:03:29',12,NULL,11,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(12,2,19,'2011-09-22 19:53:23','2011-09-22 19:53:23',13,NULL,7,1,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(13,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43',10,19,7,1,1,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(14,2,14,'2011-09-25 17:47:50','2011-09-22 23:23:43',16,NULL,11,15,1,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(15,2,14,'2011-09-25 17:47:50','2011-09-22 23:23:48',16,NULL,11,19,2,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(16,2,14,'2011-09-22 23:23:54','2011-09-22 23:23:54',14,14,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(17,2,14,'2011-09-22 23:24:17','2011-09-22 23:24:17',13,NULL,11,2,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(18,2,14,'2011-09-22 23:51:30','2011-09-22 23:51:30',13,NULL,10,3,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(19,2,14,'2011-09-25 17:47:50','2011-09-22 23:56:20',16,NULL,9,15,3,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(20,2,14,'2011-09-22 23:56:48','2011-09-22 23:56:48',13,NULL,9,4,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(21,2,14,'2011-09-23 00:01:29','2011-09-23 00:01:29',13,NULL,8,5,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(22,2,14,'2011-09-25 17:47:50','2011-09-23 00:07:10',16,NULL,7,26,4,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(23,2,14,'2011-09-25 17:47:50','2011-09-23 00:07:14',16,NULL,7,27,5,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(24,2,14,'2011-09-23 00:12:23','2011-09-23 00:12:23',13,NULL,7,6,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(25,2,20,'2011-09-25 17:47:50','2011-09-23 00:32:32',16,NULL,7,28,6,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(26,2,20,'2011-09-23 00:32:54','2011-09-23 00:32:54',14,20,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(27,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',14,20,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(28,2,20,'2011-09-23 00:32:56','2011-09-23 00:32:56',14,20,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(29,2,20,'2011-09-23 00:37:28','2011-09-23 00:37:28',13,NULL,7,7,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(30,2,20,'2011-09-23 00:39:31','2011-09-23 00:39:31',13,NULL,8,8,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(31,2,22,'2011-09-23 00:46:01','2011-09-23 00:46:01',14,22,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(32,2,22,'2011-09-23 00:46:08','2011-09-23 00:46:08',13,NULL,7,9,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(33,2,22,'2011-09-23 00:47:37','2011-09-23 00:47:37',13,NULL,8,10,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(34,2,22,'2011-09-23 00:50:10','2011-09-23 00:50:10',13,NULL,9,11,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(35,2,20,'2011-09-23 00:52:23','2011-09-23 00:52:23',13,NULL,11,12,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(36,2,20,'2011-09-23 00:52:30','2011-09-23 00:52:30',14,20,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(37,2,20,'2011-09-23 00:52:39','2011-09-23 00:52:39',14,20,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(38,2,22,'2011-09-23 00:55:16','2011-09-23 00:55:16',13,NULL,11,13,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(39,2,20,'2011-09-23 00:56:22','2011-09-23 00:56:22',13,NULL,9,14,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(40,2,20,'2011-09-23 00:56:28','2011-09-23 00:56:28',14,20,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(41,1,12,'2011-09-25 17:47:50','2011-09-23 15:05:04',16,NULL,6,3,7,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(42,1,12,'2011-09-23 15:05:06','2011-09-23 15:05:06',14,12,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(43,1,12,'2011-09-23 15:05:53','2011-09-23 15:05:53',13,NULL,6,15,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(44,1,33,'2011-09-23 15:06:32','2011-09-23 15:06:32',14,33,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(52,1,44,'2011-09-23 15:11:27','2011-09-23 15:11:27',14,44,6,7,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(53,1,11,'2011-09-23 15:11:49','2011-09-23 15:11:49',13,NULL,1,16,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(54,1,39,'2011-09-23 15:13:08','2011-09-23 15:13:08',13,NULL,1,17,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(56,1,10,'2011-09-25 17:47:50','2011-09-23 15:14:46',16,NULL,1,5,8,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(57,1,10,'2011-09-25 17:47:50','2011-09-23 15:14:56',16,NULL,1,6,9,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(58,1,11,'2011-09-23 15:15:23','2011-09-23 15:15:23',13,NULL,2,18,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(59,1,39,'2011-09-23 15:15:47','2011-09-23 15:15:47',13,NULL,2,19,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(60,1,38,'2011-09-23 15:16:59','2011-09-23 15:16:59',14,38,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(61,1,38,'2011-09-23 15:17:00','2011-09-23 15:17:00',14,38,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(62,1,11,'2011-09-23 15:17:01','2011-09-23 15:17:01',13,NULL,3,20,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(63,1,38,'2011-09-23 15:17:34','2011-09-23 15:17:34',13,NULL,1,21,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(64,1,37,'2011-09-23 15:17:54','2011-09-23 15:17:54',13,NULL,1,22,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(65,1,46,'2011-09-23 17:38:43','2011-09-23 17:38:43',13,NULL,1,23,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(66,1,46,'2011-09-23 17:40:34','2011-09-23 17:40:34',13,NULL,3,24,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(67,1,46,'2011-09-23 17:41:35','2011-09-23 17:41:35',13,NULL,2,25,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(68,1,46,'2011-09-23 17:44:03','2011-09-23 17:44:03',13,NULL,5,26,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(76,2,16,'2011-09-23 18:45:02','2011-09-23 18:45:02',5,13,2,2,3,NULL,NULL,'Example','Comment','Comment','Comment on Comment',NULL),(77,2,13,'2011-09-23 18:46:07','2011-09-23 18:46:07',13,NULL,10,27,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(78,2,9,'2011-09-23 18:47:08','2011-09-23 18:47:08',10,13,10,27,2,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(79,2,9,'2011-09-23 18:47:08','2011-09-23 18:47:08',10,14,10,3,3,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(80,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',10,22,7,9,4,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(81,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',10,20,7,7,5,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(82,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',10,14,7,6,6,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(83,1,43,'2011-09-23 21:25:40','2011-09-23 21:25:40',13,NULL,1,28,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(84,1,43,'2011-09-23 21:26:11','2011-09-23 21:26:11',14,43,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(85,1,43,'2011-09-23 21:26:12','2011-09-23 21:26:12',14,43,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(86,1,43,'2011-09-23 21:31:39','2011-09-23 21:31:39',13,NULL,6,29,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(87,1,43,'2011-09-23 21:36:25','2011-09-23 21:36:25',13,NULL,3,30,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(88,1,43,'2011-09-23 21:38:41','2011-09-23 21:38:41',13,NULL,5,31,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(89,1,43,'2011-09-23 21:46:10','2011-09-23 21:46:10',13,NULL,4,32,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(90,1,43,'2011-09-25 17:47:50','2011-09-23 21:46:37',16,NULL,4,6,10,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(91,1,43,'2011-09-23 21:59:36','2011-09-23 21:59:36',13,NULL,2,33,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(92,1,40,'2011-09-23 22:23:34','2011-09-23 22:23:34',13,NULL,1,34,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(93,1,40,'2011-09-23 22:26:21','2011-09-23 22:26:21',13,NULL,2,35,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(94,1,40,'2011-09-23 22:30:00','2011-09-23 22:30:00',13,NULL,3,36,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(95,1,45,'2011-09-23 23:53:10','2011-09-23 23:53:10',13,NULL,1,37,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(96,1,45,'2011-09-23 23:53:22','2011-09-23 23:53:22',14,45,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(97,1,45,'2011-09-23 23:55:04','2011-09-23 23:55:04',13,NULL,2,38,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(98,1,45,'2011-09-23 23:57:03','2011-09-23 23:57:03',13,NULL,3,39,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(99,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',10,22,8,10,7,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(100,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',10,20,8,8,8,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(101,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',10,14,8,5,9,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(102,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',10,20,9,14,10,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(103,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',10,22,9,11,11,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(104,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',10,14,9,4,12,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(105,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',10,22,11,13,13,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(106,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',10,20,11,12,14,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(107,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',10,14,11,2,15,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(108,2,25,'2011-09-24 02:17:14','2011-09-24 02:17:14',13,NULL,7,40,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(109,2,25,'2011-09-24 02:18:41','2011-09-24 02:18:41',13,NULL,8,41,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(110,2,25,'2011-09-24 02:19:43','2011-09-24 02:19:43',13,NULL,9,42,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(111,2,25,'2011-09-24 02:27:43','2011-09-24 02:27:43',13,NULL,10,43,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(112,2,25,'2011-09-24 02:29:18','2011-09-24 02:29:18',13,NULL,11,44,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(113,1,10,'2011-09-24 02:40:49','2011-09-24 02:40:49',13,NULL,1,45,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(114,1,10,'2011-09-24 02:45:33','2011-09-24 02:45:33',13,NULL,2,46,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(115,1,10,'2011-09-24 02:46:21','2011-09-24 02:46:21',13,NULL,3,47,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(116,1,10,'2011-09-24 02:50:48','2011-09-24 02:50:48',13,NULL,4,48,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(117,1,10,'2011-09-24 02:54:58','2011-09-24 02:54:58',13,NULL,5,49,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(118,1,39,'2011-09-24 04:26:46','2011-09-24 04:26:46',13,NULL,3,50,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(119,1,39,'2011-09-24 05:29:00','2011-09-24 05:29:00',13,NULL,4,52,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(120,1,39,'2011-09-24 05:35:51','2011-09-24 05:35:51',13,NULL,5,53,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(121,1,44,'2011-09-24 15:03:09','2011-09-24 15:03:09',14,44,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(122,1,44,'2011-09-24 15:03:11','2011-09-24 15:03:11',14,44,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(123,1,44,'2011-09-24 15:03:15','2011-09-24 15:03:15',13,NULL,1,54,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(124,1,44,'2011-09-24 15:06:42','2011-09-24 15:06:42',13,NULL,2,55,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(125,1,40,'2011-09-24 16:35:25','2011-09-24 16:35:25',13,NULL,4,56,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(126,1,40,'2011-09-24 16:36:19','2011-09-24 16:36:19',13,NULL,5,57,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(127,1,12,'2011-09-24 17:49:34','2011-09-24 17:49:34',13,NULL,1,58,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(128,1,12,'2011-09-24 17:55:30','2011-09-24 17:55:30',13,NULL,2,59,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(129,1,12,'2011-09-24 18:01:58','2011-09-24 18:01:58',13,NULL,3,60,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(130,2,17,'2011-09-24 19:20:32','2011-09-24 19:20:32',13,NULL,7,61,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(131,2,17,'2011-09-24 19:20:53','2011-09-24 19:20:53',14,17,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(132,2,17,'2011-09-24 19:22:09','2011-09-24 19:22:09',14,17,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(133,2,17,'2011-09-24 19:25:04','2011-09-24 19:25:04',13,NULL,8,62,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(134,2,17,'2011-09-24 19:34:02','2011-09-24 19:34:02',13,NULL,9,63,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(135,2,17,'2011-09-24 19:37:31','2011-09-24 19:37:31',14,17,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(136,2,17,'2011-09-24 19:38:33','2011-09-24 19:38:33',13,NULL,11,64,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(137,2,17,'2011-09-24 19:46:50','2011-09-24 19:46:50',13,NULL,10,65,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(138,1,12,'2011-09-24 20:39:25','2011-09-24 20:39:25',13,NULL,5,66,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(139,1,12,'2011-09-24 20:59:55','2011-09-24 20:59:55',13,NULL,4,67,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(140,2,24,'2011-09-24 21:23:07','2011-09-24 21:23:07',13,NULL,7,68,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(141,2,24,'2011-09-24 21:23:18','2011-09-24 21:23:18',14,24,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(142,2,24,'2011-09-24 21:23:30','2011-09-24 21:23:30',14,24,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(143,2,24,'2011-09-24 21:25:15','2011-09-24 21:25:15',13,NULL,8,69,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(144,2,24,'2011-09-24 21:28:04','2011-09-24 21:28:04',13,NULL,9,70,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(145,2,24,'2011-09-24 21:28:19','2011-09-24 21:28:19',14,24,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(146,2,24,'2011-09-24 21:31:43','2011-09-24 21:31:43',13,NULL,10,71,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(147,2,24,'2011-09-24 21:34:57','2011-09-24 21:34:57',13,NULL,11,72,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(148,2,24,'2011-09-24 21:35:02','2011-09-24 21:35:02',14,24,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(149,2,24,'2011-09-24 21:35:03','2011-09-24 21:35:03',14,24,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(150,1,7,'2011-09-24 23:03:21','2011-09-24 23:03:21',14,7,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(151,1,7,'2011-09-24 23:03:36','2011-09-24 23:03:36',13,NULL,1,73,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(152,1,7,'2011-09-24 23:07:48','2011-09-24 23:07:48',13,NULL,3,74,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(153,1,7,'2011-09-24 23:12:41','2011-09-24 23:12:41',13,NULL,5,75,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(154,1,7,'2011-09-24 23:15:09','2011-09-24 23:15:09',13,NULL,2,76,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(155,1,7,'2011-09-25 17:47:50','2011-09-24 23:15:53',16,NULL,5,5,11,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(156,1,7,'2011-09-24 23:16:08','2011-09-24 23:16:08',14,7,5,11,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(157,1,7,'2011-09-24 23:34:08','2011-09-24 23:34:08',13,NULL,4,77,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(158,1,7,'2011-09-24 23:34:22','2011-09-24 23:34:22',14,7,4,10,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(159,2,18,'2011-09-25 01:11:52','2011-09-25 01:11:52',14,18,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(160,2,18,'2011-09-25 01:11:58','2011-09-25 01:11:58',14,18,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(161,2,18,'2011-09-25 01:14:01','2011-09-25 01:14:01',14,18,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(162,2,18,'2011-09-25 01:14:45','2011-09-25 01:14:45',13,NULL,7,78,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(163,1,35,'2011-09-25 01:58:10','2011-09-25 01:58:10',13,NULL,5,79,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(164,1,35,'2011-09-25 02:01:06','2011-09-25 02:01:06',13,NULL,3,80,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(165,1,35,'2011-09-25 02:05:58','2011-09-25 02:05:58',13,NULL,1,81,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(166,1,35,'2011-09-25 02:06:36','2011-09-25 02:06:36',14,35,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(167,1,35,'2011-09-25 02:14:22','2011-09-25 02:14:22',13,NULL,4,82,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(168,1,35,'2011-09-25 02:15:53','2011-09-25 02:15:53',13,NULL,2,83,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(169,1,45,'2011-09-25 05:07:50','2011-09-25 05:07:50',13,NULL,4,84,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(170,1,45,'2011-09-25 05:12:20','2011-09-25 05:12:20',13,NULL,5,85,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(171,2,18,'2011-09-25 17:47:50','2011-09-25 15:36:44',16,NULL,8,26,12,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(172,2,18,'2011-09-25 15:36:50','2011-09-25 15:36:50',14,18,8,12,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(173,2,18,'2011-09-25 15:40:24','2011-09-25 15:40:24',13,NULL,8,86,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(174,2,18,'2011-09-25 15:53:05','2011-09-25 15:53:05',13,NULL,9,87,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(175,2,18,'2011-09-25 15:53:16','2011-09-25 15:53:16',14,18,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(176,2,18,'2011-09-25 17:47:50','2011-09-25 15:56:15',16,NULL,9,26,13,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(177,2,18,'2011-09-25 15:57:05','2011-09-25 15:57:05',14,18,9,13,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(178,2,20,'2011-09-25 17:07:26','2011-09-25 17:07:26',13,NULL,10,88,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(179,1,41,'2011-09-25 17:51:01','2011-09-25 17:51:01',13,NULL,1,89,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(180,1,41,'2011-09-25 17:51:10','2011-09-25 17:51:10',14,41,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(181,1,41,'2011-09-25 17:51:17','2011-09-25 17:51:17',13,NULL,2,90,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(182,1,41,'2011-09-25 17:51:24','2011-09-25 17:51:24',13,NULL,3,91,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(183,1,41,'2011-09-25 17:51:29','2011-09-25 17:51:29',13,NULL,4,92,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(184,1,41,'2011-09-25 17:51:36','2011-09-25 17:51:36',13,NULL,5,93,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(185,2,18,'2011-09-25 17:54:59','2011-09-25 17:54:59',13,NULL,11,94,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(186,2,18,'2011-09-25 17:55:02','2011-09-25 17:55:02',14,18,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(187,2,18,'2011-09-25 17:55:07','2011-09-25 17:55:07',14,18,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(188,2,15,'2011-09-25 18:50:09','2011-09-25 18:50:09',13,NULL,7,95,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(189,1,42,'2011-09-25 18:53:40','2011-09-25 18:53:40',13,NULL,1,96,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(190,1,42,'2011-09-25 18:54:13','2011-09-25 18:54:13',14,42,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(191,1,42,'2011-09-25 18:54:14','2011-09-25 18:54:14',14,42,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(192,1,42,'2011-09-25 18:59:23','2011-09-25 18:59:23',13,NULL,3,97,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(193,1,42,'2011-09-25 19:02:52','2011-09-25 19:02:52',13,NULL,4,98,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(194,1,42,'2011-09-25 19:04:44','2011-09-25 19:04:44',13,NULL,5,99,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(195,1,42,'2011-09-25 19:07:25','2011-09-25 19:07:25',13,NULL,6,100,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(196,2,15,'2011-09-25 19:13:09','2011-09-25 19:13:09',14,15,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(197,2,15,'2011-09-25 19:13:11','2011-09-25 19:13:11',14,15,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(198,2,15,'2011-09-25 19:17:41','2011-09-25 19:17:41',13,NULL,8,101,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(199,2,15,'2011-09-25 19:21:07','2011-09-25 19:21:07',13,NULL,9,102,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(200,2,15,'2011-09-25 19:21:13','2011-09-25 19:21:13',14,15,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(201,2,15,'2011-09-25 19:26:56','2011-09-25 19:26:56',13,NULL,10,103,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(202,2,18,'2011-09-25 19:38:09','2011-09-25 19:38:09',13,NULL,10,104,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(203,2,18,'2011-09-25 19:38:26','2011-09-25 19:38:26',16,NULL,10,20,14,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(204,2,18,'2011-09-25 19:38:29','2011-09-25 19:38:29',14,18,10,14,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(205,2,18,'2011-09-25 19:38:34','2011-09-25 19:38:34',16,NULL,10,26,15,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(206,2,18,'2011-09-25 19:38:35','2011-09-25 19:38:35',14,18,10,15,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(207,1,42,'2011-09-25 20:49:53','2011-09-25 20:49:53',13,NULL,2,105,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(208,1,38,'2011-09-25 22:28:41','2011-09-25 22:28:41',16,NULL,2,1,16,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(209,1,38,'2011-09-25 22:29:47','2011-09-25 22:29:47',13,NULL,2,106,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(210,1,38,'2011-09-25 22:29:53','2011-09-25 22:29:53',14,38,2,16,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(211,1,38,'2011-09-25 22:34:48','2011-09-25 22:34:48',13,NULL,3,107,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(212,1,38,'2011-09-25 22:35:30','2011-09-25 22:35:30',14,38,4,10,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(213,1,38,'2011-09-25 23:11:41','2011-09-25 23:11:41',13,NULL,4,108,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(214,1,38,'2011-09-25 23:34:34','2011-09-25 23:34:34',13,NULL,5,109,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(215,1,38,'2011-09-25 23:38:46','2011-09-25 23:38:46',14,38,5,11,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(216,2,16,'2011-09-26 00:09:37','2011-09-26 00:09:37',13,NULL,7,110,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(217,2,16,'2011-09-26 00:11:35','2011-09-26 00:11:35',13,NULL,8,111,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(218,2,16,'2011-09-26 00:19:53','2011-09-26 00:19:53',13,NULL,10,112,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(219,2,26,'2011-09-26 00:48:30','2011-09-26 00:48:30',14,26,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(220,2,26,'2011-09-26 00:48:57','2011-09-26 00:48:57',14,26,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(221,2,26,'2011-09-26 00:49:16','2011-09-26 00:49:16',13,NULL,7,113,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(222,2,26,'2011-09-26 00:51:50','2011-09-26 00:51:50',13,NULL,8,114,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(223,2,26,'2011-09-26 00:53:49','2011-09-26 00:53:49',14,26,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(224,2,26,'2011-09-26 00:53:54','2011-09-26 00:53:54',13,NULL,9,115,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(225,2,26,'2011-09-26 00:58:58','2011-09-26 00:58:58',13,NULL,10,116,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(226,2,26,'2011-09-26 01:00:14','2011-09-26 01:00:14',14,26,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(227,2,26,'2011-09-26 01:00:15','2011-09-26 01:00:15',14,26,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(228,2,26,'2011-09-26 01:02:17','2011-09-26 01:02:17',13,NULL,11,117,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(229,2,19,'2011-09-26 02:49:01','2011-09-26 02:49:01',13,NULL,8,118,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(230,2,19,'2011-09-26 02:53:36','2011-09-26 02:53:36',13,NULL,9,119,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(231,2,19,'2011-09-26 02:53:51','2011-09-26 02:53:51',14,19,9,3,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(232,2,19,'2011-09-26 02:53:55','2011-09-26 02:53:55',14,19,9,13,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(233,2,19,'2011-09-26 02:54:09','2011-09-26 02:54:09',14,19,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(234,2,19,'2011-09-26 02:54:10','2011-09-26 02:54:10',14,19,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(235,2,19,'2011-09-26 02:54:20','2011-09-26 02:54:20',16,NULL,7,19,17,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(236,2,19,'2011-09-26 02:54:28','2011-09-26 02:54:28',14,19,7,17,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(237,2,19,'2011-09-26 02:59:02','2011-09-26 02:59:02',14,19,10,14,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(238,2,19,'2011-09-26 02:59:02','2011-09-26 02:59:02',14,19,10,15,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(239,2,19,'2011-09-26 02:59:04','2011-09-26 02:59:04',16,NULL,10,15,18,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(240,2,19,'2011-09-26 02:59:05','2011-09-26 02:59:05',14,19,10,18,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(241,2,19,'2011-09-26 02:59:12','2011-09-26 02:59:12',16,NULL,10,19,19,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(242,2,19,'2011-09-26 03:01:41','2011-09-26 03:01:41',13,NULL,10,120,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(243,2,19,'2011-09-26 03:06:39','2011-09-26 03:06:39',14,19,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(244,2,19,'2011-09-26 03:06:40','2011-09-26 03:06:40',14,19,11,1,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(245,2,19,'2011-09-26 03:07:01','2011-09-26 03:07:01',13,NULL,11,121,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(246,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,19,8,118,16,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(247,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,26,8,114,17,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(248,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,16,8,111,18,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(249,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,15,8,101,19,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(250,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,18,8,86,20,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(251,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,24,8,69,21,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(252,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,17,8,62,22,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(253,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',10,25,8,41,23,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(254,2,16,'2011-09-26 13:13:47','2011-09-26 13:13:47',13,NULL,9,122,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(255,2,16,'2011-09-26 13:26:03','2011-09-26 13:26:03',13,NULL,11,123,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(256,2,29,'2011-09-26 17:05:08','2011-09-26 17:05:08',13,NULL,7,124,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(257,2,29,'2011-09-26 17:05:59','2011-09-26 17:05:59',14,29,7,4,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(258,2,29,'2011-09-26 17:06:15','2011-09-26 17:06:15',14,29,7,5,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(259,2,29,'2011-09-26 17:06:25','2011-09-26 17:06:25',14,29,7,6,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(260,2,29,'2011-09-26 17:06:31','2011-09-26 17:06:31',14,29,7,17,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(261,2,29,'2011-09-26 17:06:37','2011-09-26 17:06:37',16,NULL,7,15,20,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(262,2,29,'2011-09-26 17:06:39','2011-09-26 17:06:39',16,NULL,7,16,21,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(263,2,29,'2011-09-26 17:06:40','2011-09-26 17:06:40',16,NULL,7,17,22,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(264,2,29,'2011-09-26 17:06:40','2011-09-26 17:06:40',16,NULL,7,18,23,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(265,2,29,'2011-09-26 17:06:41','2011-09-26 17:06:41',16,NULL,7,20,24,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(266,2,29,'2011-09-26 17:06:42','2011-09-26 17:06:42',16,NULL,7,21,25,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(267,2,29,'2011-09-26 17:06:42','2011-09-26 17:06:42',16,NULL,7,22,26,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(268,2,29,'2011-09-26 17:06:43','2011-09-26 17:06:43',16,NULL,7,23,27,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(269,2,29,'2011-09-26 17:06:44','2011-09-26 17:06:44',16,NULL,7,24,28,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(270,2,29,'2011-09-26 17:06:44','2011-09-26 17:06:44',16,NULL,7,25,29,0,0,'Question','Concept','QuestionConcept','Tagg Question with a Concept',NULL),(271,2,29,'2011-09-26 17:08:39','2011-09-26 17:08:39',13,NULL,8,125,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(272,2,29,'2011-09-26 17:09:38','2011-09-26 17:09:38',13,NULL,9,126,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(273,2,29,'2011-09-26 17:11:37','2011-09-26 17:11:37',13,NULL,10,127,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(274,2,29,'2011-09-26 17:13:55','2011-09-26 17:13:55',13,NULL,11,128,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(275,2,29,'2011-09-26 17:14:18','2011-09-26 17:14:18',14,29,11,2,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(276,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',11,NULL,1,NULL,NULL,0,0,'Example',NULL,NULL,'Example Added',NULL),(277,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',17,NULL,1,22,8,0,0,'Example','Concept','ExampleConcept','Tagged Example with a Concept',NULL),(278,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25',17,NULL,1,27,9,0,0,'Example','Concept','ExampleConcept','Tagged Example with a Concept',NULL),(279,2,30,'2011-09-26 17:33:21','2011-09-26 17:33:21',4,30,1,8,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(280,2,30,'2011-09-26 17:33:23','2011-09-26 17:33:23',4,30,1,9,0,0,0,'Example','ExampleConcept','','Voted on ExampleConcept',NULL),(281,2,30,'2011-09-26 17:33:29','2011-09-26 17:33:29',17,NULL,1,18,10,0,0,'Example','Concept','ExampleConcept','Tagged Example with a Concept',NULL),(282,2,9,'2011-09-26 18:11:45','2011-09-26 18:11:45',12,NULL,12,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(283,1,6,'2011-09-26 18:14:02','2011-09-26 18:14:02',12,NULL,13,NULL,NULL,NULL,NULL,'Question',NULL,NULL,'Question Added',NULL),(284,1,6,'2011-09-26 18:23:26','2011-09-26 18:23:26',10,42,1,96,24,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(285,1,6,'2011-09-26 18:23:26','2011-09-26 18:23:26',10,41,1,89,25,0,0,'Question','Answer','Assessment','Assessment on Answer',NULL),(286,1,49,'2011-09-26 21:16:23','2011-09-26 21:16:23',14,49,1,9,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(287,1,49,'2011-09-26 21:16:31','2011-09-26 21:16:31',14,49,1,8,0,0,0,'Question','QuestionConcept','','Voted on QuestionConcept',NULL),(288,1,49,'2011-09-26 21:22:52','2011-09-26 21:22:52',13,NULL,1,129,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(289,1,49,'2011-09-26 21:30:33','2011-09-26 21:30:33',13,NULL,2,130,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL),(290,1,49,'2011-09-26 21:43:04','2011-09-26 21:43:04',13,NULL,3,131,NULL,NULL,NULL,'Question','Answer',NULL,'Answered a Question',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,2,19,'2011-09-22 19:53:23','2011-09-22 19:53:23','[ ... ]','<p>On the way home, the slope is steeper. The video game store, as he was faster going downhill and that was retourning from the video game store to his home.</p>\r\n<p>&nbsp;</p>',7,''),(2,2,14,'2011-09-22 23:24:17','2011-09-22 23:24:16','[ ... ]','[ ... ]',11,'E'),(3,2,14,'2011-09-22 23:51:30','2011-09-22 23:51:30','[ ... ]','<p>Since they are 1.0 km and travel at the same speed (but in opposite directions), they will each travel 0.5 km (half the length of the train) from the time that they are beside each other to the time that their carbooses are beside each other. Knowing the speed and the distance, we can calculate for time:</p>\r\n<p style=\"margin-left: 30px;\">t = d&nbsp;&divide; s</p>\r\n<p style=\"margin-left: 30px;\">t = 0.5 km&nbsp;&divide; 50 km/h</p>\r\n<p style=\"margin-left: 30px;\">t = 0.01 h</p>\r\n<p style=\"margin-left: 30px;\">&nbsp; = 0.6 min</p>\r\n<p>Therefore, 0.6 min pass before their cabooses are beside each other.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',10,''),(4,2,14,'2011-09-22 23:56:48','2011-09-22 23:56:48','[ ... ]','<p>Displacement is a vector quantity with a direction and a magnitude (distance). Magnitude and distance are interchangeable terms in the context of displacement. Therefore, the magnitude of a moving object\'s displacement will always be equal to the distance that it travels.&nbsp;</p>',9,''),(5,2,14,'2011-09-23 00:01:29','2011-09-23 00:01:29','[ ... ]','<p>The explanation is the same in both cases. These graphs fail the vertical-line test. At a given time, it is impossible to have 2 values for distance: an object cannot be at two different places at once.&nbsp;</p>',8,''),(6,2,14,'2011-09-23 00:12:23','2011-09-23 00:12:23','[ ... ]','<div>\r\n<p>a) He runs faster on his way home: less time is needed for him to cover the distance between the store and his house.</p>\r\n<p>b) The video store is at the higher elevation. It takes him longer to reach the store, since he has to run upwards against the Earth\'s gravitational pull. The boy\'s gravitational potential energy at the store is greater relative to that at his house. This allows him to run home faster, going downhill.&nbsp;</p>\r\n</div>',7,''),(7,2,20,'2011-09-23 00:37:28','2011-09-23 00:37:28','[ ... ]','<p>a) On the way home. On a position time graph (d-t), the slope of a line is equivalent to the velocity. We see that on his way back, the slope of the line is steeper than the slope of the line when he is on his way to the store. Therefore, he is going faster on his way back.</p>\r\n<p>b) The video game store is at a higher elevation. When something is at a higher location, the potential energy is higher. According to the law of the conservation of energy, energy cannot be made or destroyed. So when something at a lower elevation (lower potential energy) tries to go to something of a higher location (higher potential energy), more kinetic energy must be added in order to maintain the equilibrum. In other words, going up is harder than going down, so going up will be slower than going down. From the last question we see that he runs faster on the way down, so that must mean the video game store is at a higher elevation.</p>',7,''),(8,2,20,'2011-09-23 00:39:31','2011-09-23 00:39:31','[ ... ]','<p>In either case, there are times on the graph when there are two points assigned to each x intercept value (time). This would mean that an object is at two different locations at the same time. This is impossible, so as a result this can not be the position time graph for a moving object.</p>',8,''),(9,2,22,'2011-09-23 00:46:08','2011-09-23 00:46:08','[ ... ]','<p>a) he ran faster on his way home because he ran the same distance in less time. based on the graph it took him less time to go home then it did to get there.</p>\r\n<p>&nbsp;</p>\r\n<p>b) since his run home was faster than his run to the video game store, one would think that his home was at the bottom of the hill because it is easier for him to run downhill and move with the force of gravity than it is for him to run uphill and go against it</p>',7,''),(10,2,22,'2011-09-23 00:47:37','2011-09-23 00:47:37','[ ... ]','<p>there cannot be 2 positions for one point in time. in math we would say that these graphs fail a vertical line test. a test to ensure that every x value only has 1 y value. in this case, every second only has 1 position as one object cannot be in two places at once&nbsp;</p>',8,''),(11,2,22,'2011-09-23 00:50:10','2011-09-23 00:50:10','[ ... ]','<p>I think only if it moves in a straight line because distance is the length along the path and displacement is the distance from the origin of the movement. these two things will be equal under the conditions of a straight line.</p>',9,''),(12,2,20,'2011-09-23 00:52:23','2011-09-23 00:52:23','[ ... ]','<p>a) is possible. Having a velocity east&nbsp;means that something is moving east. having an acceleration east means that the something is increasing its speed as it goes east.</p>\r\n<p>b) is possible. having a velocity east means that an object is moving east. having an acceleration west means that it has an acceleration of xm/s<sup>2</sup> [w] = -xm/s<sup>2</sup> [E]. that means that its speed would be slowing down, as it is speeding up in the opposite direction.</p>\r\n<p>c) is possible. when something is thrown into the air, it will have velocity until one moment in time when it stops moving for an instant. However, due to gravity, it has acceleration (negative to going up). this acceleration is about 9.8m/s<sup>2 </sup></p>\r\n<p>d) is possible. &nbsp;velocity is a vector, so it has direction and magnitude. if acceleration is constant, it will be speeding up at the same rate, but it might be changing directions, resulting in a variable velocity.</p>\r\n<p>e) is not possible. if you are moving at the constant velocity, your speed (magnitude wise) and directional wise is not changing. that means, the slope of this on a (v-t) graph would be zero. acceleration can not be anything apart from zero.</p>',11,'E'),(13,2,22,'2011-09-23 00:55:16','2011-09-23 00:55:16','[ ... ]','[ ... ]',11,'C'),(14,2,20,'2011-09-23 00:56:22','2011-09-23 00:56:22','[ ... ]','<p>If it is moving in a straight line in only one direction.</p>\r\n<p>When something moves apart from a straight line, its path is&nbsp;curved, and the displacement, being a straight line, would not be equivalent to one another. And if it moves in more than one direction, then the displacement of it will be the shortest path of the movement, so not necessarily the distance it travelled.</p>',9,''),(15,1,12,'2011-09-23 15:05:53','2011-09-23 15:05:53','[ ... ]','<p>This site is awesome!</p>',6,'C'),(16,1,11,'2011-09-23 15:11:49','2011-09-23 15:11:49','[ ... ]','<p>a) The boy ran faster&nbsp;on&nbsp;his way home because the slope was steeper.</p>\r\n<p>b) The video game store is at a higher elevation because that would explain why he runs faster on the way home</p>',1,''),(17,1,39,'2011-09-23 15:13:08','2011-09-23 15:13:08','[ ... ]','<p>a) He ran faster on the way home, because the slope of the line going back to the origin is steeper.</p>\r\n<p>b) The store is at the higher elevation, because it took him more time to get up to the store than it took to get down to his home.</p>',1,''),(18,1,11,'2011-09-23 15:15:23','2011-09-23 15:15:23','[ ... ]','<p>When the object is moving in a straight line.</p>',2,''),(19,1,39,'2011-09-23 15:15:47','2011-09-23 15:15:47','[ ... ]','<p>When the object is moving in a straight line.</p>',2,''),(20,1,11,'2011-09-23 15:17:01','2011-09-23 15:17:01','[ ... ]','<p>These graphs do not pass the \"vertical line test\", meaning that the object at some point at least is in two places at the same time which is impossible</p>',3,''),(21,1,38,'2011-09-23 15:17:34','2011-09-23 15:17:34','[ ... ]','<p>a) The boy ran faster when he was on his way home and this is shown in that the line after the time in which he stopped is much steeper than his first slope to get to the store.</p>\r\n<p>b) The video game store is at the higher elevation because his acceleration is slower on the way to the videogame store and higher on the way home.</p>',1,''),(22,1,37,'2011-09-23 15:17:54','2011-09-23 15:17:54','[ ... ]','<p>The boy ran faster home (which is kind of strange), this is apparent because the third line segment, which represents his going home, is steeper/more vertical/further from y=(constant) than the first line segment.</p>',1,''),(23,1,46,'2011-09-23 17:38:43','2011-09-23 17:38:43','[ ... ]','<p>a)He ran faster on the way home because the third line is more close to vertical than the first line</p>\r\n<p>b)The store is higher because you are slower going uphill than downhill and he was slower way to the store</p>',1,''),(24,1,46,'2011-09-23 17:40:34','2011-09-23 17:40:34','[ ... ]','<p>for a) and b) it is wrong because you can\'t go \"backward\" in the time</p>',3,''),(25,1,46,'2011-09-23 17:41:35','2011-09-23 17:41:35','[ ... ]','<p>If there is only one vector</p>',2,''),(26,1,46,'2011-09-23 17:44:03','2011-09-23 17:44:03','[ ... ]','<p>because if you have an acceleration, that mean you move so you have a velocity</p>',5,'C'),(27,2,13,'2011-09-23 18:46:07','2011-09-23 18:46:07','[ ... ]','<p>My answer</p>',10,''),(28,1,43,'2011-09-23 21:25:40','2011-09-23 21:25:40','[ ... ]','<p>a) The boy ran faster on the way back home (I know this because the slope of the graph is much \'steeper\' after the plateau than before).</p>\r\n<p>b) Assuming the difference in speed is due to elevation, we know that more energy is needed to raise your elevation. We can also assume that the boy\'s energy output is constant. Therefore, the videogame store is at a higher elevation than his house.</p>',1,''),(29,1,43,'2011-09-23 21:31:39','2011-09-23 21:31:39','[ ... ]','<p>For example, a car cannot be slowing (acceleration) down AND still be going in the same direction and moving at the same speed (velocity).</p>',6,'E'),(30,1,43,'2011-09-23 21:36:25','2011-09-23 21:36:25','[ ... ]','<p>A position-time graph must fulfill the requirements of a <em>graph</em> (only one y-value for each x-value, the vertical-line test, etc). Both of the above graphs are not really graphs, they are relations.</p>\r\n<p>For example, if the first graph goes from t(0 seconds) to t(10 seconds), the object would be at two different distances from the reference point at t(5 seconds) - which is impossible.</p>',3,''),(31,1,43,'2011-09-23 21:38:41','2011-09-23 21:38:41','[ ... ]','<p>For example, a car cannot be slowing (acceleration) down AND still be going in the same direction and moving at the same speed (velocity).</p>',5,'E'),(32,1,43,'2011-09-23 21:46:10','2011-09-23 21:46:10','[ ... ]','<p>From the moment the tips of the locomotives pass each other, each train must travel 1km to reach the caboose of the other (0.5km until the tip is by the others caboose, and another 0.5 until the cabooses line up). The trains are travelling 50km/h, therefore:</p>\r\n<p><img class=\"Wirisformula\" title=\"Double click to edit\" src=\"../tinymce/jscripts/tiny_mce/plugins/tiny_mce_wiris/integration/showimage.php?formula=fe2cca8378e64b396caa05cab000b024.png\" alt=\"&laquo;math xmlns=&uml;http://www.w3.org/1998/Math/MathML&uml;&raquo;&laquo;mtable columnalign=&uml;left&uml; rowspacing=&uml;0&uml;&raquo;&laquo;mtr&raquo;&laquo;mtd&raquo;&laquo;mn&raquo;50&laquo;/mn&raquo;&laquo;mi&raquo;k&laquo;/mi&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mn&raquo;60&laquo;/mn&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mi&raquo;i&laquo;/mi&raquo;&laquo;mi&raquo;n&laquo;/mi&raquo;&laquo;mi&raquo;u&laquo;/mi&raquo;&laquo;mi&raquo;t&laquo;/mi&raquo;&laquo;mi&raquo;e&laquo;/mi&raquo;&laquo;mi&raquo;s&laquo;/mi&raquo;&laquo;/mtd&raquo;&laquo;/mtr&raquo;&laquo;mtr&raquo;&laquo;mtd&raquo;&laquo;mn&raquo;1&laquo;/mn&raquo;&laquo;mi&raquo;k&laquo;/mi&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mi&raquo;x&laquo;/mi&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mi&raquo;i&laquo;/mi&raquo;&laquo;mi&raquo;n&laquo;/mi&raquo;&laquo;mi&raquo;u&laquo;/mi&raquo;&laquo;mi&raquo;t&laquo;/mi&raquo;&laquo;mi&raquo;e&laquo;/mi&raquo;&laquo;mi&raquo;s&laquo;/mi&raquo;&laquo;/mtd&raquo;&laquo;/mtr&raquo;&laquo;mtr&raquo;&laquo;mtd/&raquo;&laquo;/mtr&raquo;&laquo;mtr&raquo;&laquo;mtd&raquo;&laquo;mi&raquo;x&laquo;/mi&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mo&raquo;=&laquo;/mo&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mo&raquo;(&laquo;/mo&raquo;&laquo;mn&raquo;1&laquo;/mn&raquo;&laquo;mi&raquo;k&laquo;/mi&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mo&raquo;&sect;#215;&laquo;/mo&raquo;&laquo;mn&raquo;60&laquo;/mn&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mi&raquo;i&laquo;/mi&raquo;&laquo;mi&raquo;n&laquo;/mi&raquo;&laquo;mi&raquo;u&laquo;/mi&raquo;&laquo;mi&raquo;t&laquo;/mi&raquo;&laquo;mi&raquo;e&laquo;/mi&raquo;&laquo;mi&raquo;s&laquo;/mi&raquo;&laquo;mo&raquo;)&laquo;/mo&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mo&raquo;&sect;#247;&laquo;/mo&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mn&raquo;50&laquo;/mn&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mi&raquo;k&laquo;/mi&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;/mtd&raquo;&laquo;/mtr&raquo;&laquo;mtr&raquo;&laquo;mtd&raquo;&laquo;mi&raquo;x&laquo;/mi&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mo&raquo;=&laquo;/mo&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mn&raquo;60&laquo;/mn&raquo;&laquo;mo&raquo;&sect;#247;&laquo;/mo&raquo;&laquo;mn&raquo;50&laquo;/mn&raquo;&laquo;/mtd&raquo;&laquo;/mtr&raquo;&laquo;mtr&raquo;&laquo;mtd&raquo;&laquo;mi&raquo;x&laquo;/mi&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mo&raquo;=&laquo;/mo&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mn&raquo;1&laquo;/mn&raquo;&laquo;mo&raquo;.&laquo;/mo&raquo;&laquo;mn&raquo;2&laquo;/mn&raquo;&laquo;mo&raquo;&sect;nbsp;&laquo;/mo&raquo;&laquo;mi&raquo;m&laquo;/mi&raquo;&laquo;mi&raquo;i&laquo;/mi&raquo;&laquo;mi&raquo;n&laquo;/mi&raquo;&laquo;mi&raquo;u&laquo;/mi&raquo;&laquo;mi&raquo;t&laquo;/mi&raquo;&laquo;mi&raquo;e&laquo;/mi&raquo;&laquo;mi&raquo;s&laquo;/mi&raquo;&laquo;/mtd&raquo;&laquo;/mtr&raquo;&laquo;/mtable&raquo;&laquo;/math&raquo;\" align=\"middle\" /></p>\r\n<p>The cabooses are right besides each other 1.2 minutes after the locomotives are right beside each other.</p>',4,''),(33,1,43,'2011-09-23 21:59:36','2011-09-23 21:59:36','[ ... ]','<p>We know that: the distance travelled will always be positive, BUT the displacement can be negative (the object is moving south instead of north on a d-t graph). Therefore, the magnitude of displacement&nbsp; will be the same as the distance travelled only if the object is travelling in a positive direction.</p>\r\n<p>A good example of this is a racecar on a track: if it travels 300m forward it will have progressed 300m (closer to the finish line). However if it goes backwards 300m, it will still have travelled 300m but in relation to the finish line its movement will be -300m.</p>',2,''),(34,1,40,'2011-09-23 22:23:34','2011-09-23 22:23:34','[ ... ]','<p>a) The boy ran faster on the way home.&nbsp; This can be determined as the downwards line after the period where&nbsp;he was at rest (ie-in the store) is much steeper than the line before the period where he was at rest.</p>\r\n<p>b)The video game store is at a higher elevation.&nbsp; This is because he went faster returning home, leading us to assume that he was going downhill rather than uphill.</p>',1,''),(35,1,40,'2011-09-23 22:26:21','2011-09-23 22:26:21','[ ... ]','<p>The magnitude of the displacement will be equal to the distance the object travelled, assuming the object was travelling in a straight line.</p>',2,''),(36,1,40,'2011-09-23 22:30:00','2011-09-23 22:30:00','[ ... ]','<p>a) In this first case, it could not be a d-t graph because the loop would imply that the object was travelling backwards through time, which in the current day and age is not an option.</p>\r\n<p>b) This could not be a d-t graph because, again it moves backwards in time, as the second portion of the zig zag is to the left of the first.</p>',3,''),(37,1,45,'2011-09-23 23:53:10','2011-09-23 23:53:10','[ ... ]','<p>a) the boy ran faster on his way home, because the slope of the part of the graph where he is returning home is greater than the part where he is going to the video game store. (he moved the same distance in a shorter amount of time)</p>\r\n<p>b) the video game store is higher in elevation, because it would take him more time to go to the place higher in elevation. according to the graph, that place is the video game store.</p>',1,''),(38,1,45,'2011-09-23 23:55:04','2011-09-23 23:55:04','[ ... ]','<p>If the object travels along the shortest possible path.</p>',2,''),(39,1,45,'2011-09-23 23:57:03','2011-09-23 23:57:03','[ ... ]','<p>a) the object is in two places at once at the same time.</p>\r\n<p>b) the object is also in two places at once at one time. also, the sharp turns imply the object changed direction and speed instantly (without slowing down/speeding up).</p>',3,''),(40,2,25,'2011-09-24 02:17:14','2011-09-24 02:17:14','[ ... ]','<p>a) He ran faster on the way home. This can be determined by observing the slopes, as slope of p.t graph describes velocity; the absolute value of velocity (as the velocity for returning home&nbsp;appears negative on this graph) is greater on the way home than on the way to the store.</p>\r\n<p>b) The video game store is uphill, because defying the force of gravity by travelling up would slow him down.</p>',7,''),(41,2,25,'2011-09-24 02:18:41','2011-09-24 02:18:41','[ ... ]','<p>These graphs don\'t qualify as functions because they do not pass the so-called \"vertical line test.\"&nbsp;These graphs&nbsp;basically mean that one was present at two places at the same time.</p>',8,''),(42,2,25,'2011-09-24 02:19:43','2011-09-24 02:19:43','[ ... ]','<p>Under uniform motion, which means constant speed in one direction.</p>',9,''),(43,2,25,'2011-09-24 02:27:43','2011-09-24 02:27:43','[ ... ]','<p>When each train moves 500m (0.5km), their cabooses would be adjacent.</p>\r\n<p>5000m/60min = (250/3)/min = 500m/6min</p>\r\n<p>Thus, 6 minutes would pass before their cabooses are beside each other.</p>',10,''),(44,2,25,'2011-09-24 02:29:18','2011-09-24 02:29:18','[ ... ]','[ ... ]',11,'C'),(45,1,10,'2011-09-24 02:40:49','2011-09-24 02:40:49','[ ... ]','<p>1. a) The boy ran faster on the way home - the slope is steeper.</p>\r\n<p>&nbsp;</p>\r\n<p>b) From the above question, we know that the boy ran faster on the way home. From this, we can conclude that he was running downhill. Thus, the video game store was at the higher elevation.</p>',1,''),(46,1,10,'2011-09-24 02:45:33','2011-09-24 02:45:33','[ ... ]','<p>The magnitude of the displacement for a moving object will be the same as its distance when the object is moving:</p>\r\n<p>- in a straight line</p>\r\n<p>- in the positive direction</p>',2,''),(47,1,10,'2011-09-24 02:46:21','2011-09-24 02:46:21','[ ... ]','<p>Both graphs feature x-values with more than one possible y-values. An object cannot be in multiple positions at one time.</p>',3,''),(48,1,10,'2011-09-24 02:50:48','2011-09-24 02:50:48','[ ... ]','<p>It takes 1/50 h to travel 1 km at a speed of 50 km/h.</p>\r\n<p>1/50 h = 60/50 min = 1.2 min</p>\r\n<p>Therefore, 1.2 minutes pass before the trains\' cabooses are beside one another.</p>',4,''),(49,1,10,'2011-09-24 02:54:58','2011-09-24 02:54:58','[ ... ]','<p>E) An object with a constant velocity does not accelerate - thus, it cannot have a variable acceleration.</p>',5,'E'),(50,1,39,'2011-09-24 04:26:45','2011-09-24 04:26:45','[ ... ]','<p>a) Graph A could not be a position-time graph for a moving object, as it appears to move backwards in time.</p>\r\n<p>b) Graph B could not be a position-time graph for the same reason.</p>',3,''),(52,1,39,'2011-09-24 05:29:00','2011-09-24 05:29:00','[ ... ]','<p>3/5 minute, which is 0.6 minutes.</p>\r\n<p>(This was done under the assumption that caboose means end and locomotive means head.)</p>',4,''),(53,1,39,'2011-09-24 05:35:51','2011-09-24 05:35:51','[ ... ]','<p>a) This is possible because the object is simply moving and accelerating east.</p>\r\n<p>b) This is possible in the case of a deceleration.</p>\r\n<p>c) This may not entirely be possible, but seems to hold greater potential for being correct than E because I can actually find&nbsp;a reason why E is probably impossible.</p>\r\n<p>d) This is possible because with acceleration, the velocity has to be variable.</p>\r\n<p>e) This is probably impossible, as the velocity of a body is never constant if there is acceleration; even more so when the acceleration is variable.</p>',5,'E'),(54,1,44,'2011-09-24 15:03:15','2011-09-24 15:03:15','[ ... ]','<p>a) The boy ran faster on the way back home. This is apparent in the steeper slope going in the negative direction (returning home) than the positive direction (on his way to the store).</p>\r\n<p>b) If that is the case, the video game store is at a higher elevation, because the boy\'s speed was slower running to the store, meaning that he was running uphill, while his speed was faster on his way home, running downhill. </p>',1,''),(55,1,44,'2011-09-24 15:06:42','2011-09-24 15:06:42','[ ... ]','<p>The maginitude of the displacement for a moving object is the same as the distance it travels when the motion of the object is in a straight line.</p>',2,''),(56,1,40,'2011-09-24 16:35:25','2011-09-24 16:35:25','[ ... ]','<p>For the cabooses to be beside each other, each train must travel 1km forward.</p>\r\n<p>50km per h = 5/6 km per min, or 1/6 of a km every 12 sec.</p>\r\n<p>It takes 72 seconds, or 1min 12 sec for each train to travel 1km.&nbsp; Therefore, the cabooses will be beside each other in 1min and 12 sec (1.2min).</p>',4,''),(57,1,40,'2011-09-24 16:36:19','2011-09-24 16:36:19','[ ... ]','[ ... ]',5,'B'),(58,1,12,'2011-09-24 17:49:34','2011-09-24 17:49:34','[ ... ]','<p>a) The boy ran faster on the way home because the slope is steeper, he covered the same distance in a shorter amount of time.</p>\r\n<p>b) The video game store is at higher elevation than his home. &nbsp;It takes more energy and usually longer to run uphill than it does downhill. &nbsp;If we look at the graph, the time going to the video game store is longer than the time going home, so we can conclude that the video game store is at higher elevation than his home.</p>',1,''),(59,1,12,'2011-09-24 17:55:30','2011-09-24 17:55:30','[ ... ]','<p>The magnitude of the displacement of a moving object will be the same as the distance it travels if the object travels in a strait line, in the same direction.</p>',2,''),(60,1,12,'2011-09-24 18:01:58','2011-09-24 18:01:58','[ ... ]','<p>a) This could not be a position time graph because this graph implies that an object is going back in time since it is shaped like a loop.</p>\r\n<p>b) This could not be a position time graph either because in the middle of the graph, the object goes back in time. &nbsp;This could not be true for a p-t graph.</p>',3,''),(61,2,17,'2011-09-24 19:20:32','2011-09-24 19:20:32','[ ... ]','<p>a) The boy ran faster on the way back. While the distance to the plateau (time at store) and the distance back down to the reference point ( 0m) is the same, the time taken to travel back home was significantly less than the time taken to travel to the store.</p>\r\n<p>b) Since the boy was able to cover the same distance in less time on his way back, this means that the store is located at a higher elevation than his home. Since he needed to run uphill to reach the store, he was not able to get there as fast since she was working against gravity whereas on the way home, he was running downhill and aided by gravity. </p>',7,''),(62,2,17,'2011-09-24 19:25:04','2011-09-24 19:25:04','[ ... ]','<p>A) In the first graph, the object exists in more than one place at the same time. A single moving object would not be able to accomplish this feat.</p>\r\n<p>B) As in the first graph, the objects exists in more than one place at the same time. </p>',8,''),(63,2,17,'2011-09-24 19:34:02','2011-09-24 19:34:02','[ ... ]','<p>A)The object must be moving in one direction and be travelling in a straight line. Since displacement measures the shortest distance from the final and initial position, one direction and in a straight line will ensure that the distance/path travelled is the only path between the initial and final.</p>',9,''),(64,2,17,'2011-09-24 19:38:33','2011-09-24 19:38:33','[ ... ]','[ ... ]',11,'E'),(65,2,17,'2011-09-24 19:46:50','2011-09-24 19:46:50','[ ... ]','<p>(Assuming locomotives are their heads and cabooses thier behinds)</p>\r\n<p>Let the time taken for the trains to pass be t.</p>\r\n<p>50t =distance covered by 1st train in t hours</p>\r\n<p>50t=distance covered by the 2nd train in t hours</p>\r\n<p>50t +50t= 2 (length of both trains)</p>\r\n<p>100t=2</p>\r\n<p>t=0.02 hours=1.2 min</p>\r\n<p>&nbsp;</p>\r\n<p>Therefore it would take 1.2 minutes for the two trains to pass each other</p>',10,''),(66,1,12,'2011-09-24 20:39:25','2011-09-24 20:39:25','[ ... ]','[ ... ]',5,'B'),(67,1,12,'2011-09-24 20:59:55','2011-09-24 20:59:55','[ ... ]','<p>1.2 minutes pass before their cabooses are beside one another.</p>\r\n<p>60/50=1.2</p>',4,''),(68,2,24,'2011-09-24 21:23:07','2011-09-24 21:23:07','[ ... ]','<p>a) The boy ran faster on the way home because he wanted to play his new video game. This is known because it is statistically proven that children are excited to play with new toys, and because the slope on the graph is steeper on the way back.</p>\r\n<p>b) The video game store is uphill because it takes less kinetic energy to run uphill than it takes to go downhill, and because it took the boy longer to run to the video game store, it can be said that the store is uphill.</p>',7,''),(69,2,24,'2011-09-24 21:25:15','2011-09-24 21:25:15','[ ... ]','<p>Both of these cannot be position time graphs because neither of them are functions. Using the veritcal line test, one can see that both of these fail the test meaning that there is more than one y value for a single x value, and this is not possible because it is saying that an object has to be at more that one place at a certain point in time.</p>',8,''),(70,2,24,'2011-09-24 21:28:04','2011-09-24 21:28:04','[ ... ]','<p>Only when the moving object is moving in a straight line.</p>',9,''),(71,2,24,'2011-09-24 21:31:43','2011-09-24 21:31:43','[ ... ]','<p>6 minutes</p>',10,''),(72,2,24,'2011-09-24 21:34:57','2011-09-24 21:34:57','[ ... ]','[ ... ]',11,'E'),(73,1,7,'2011-09-24 23:03:36','2011-09-24 23:03:36','[ ... ]','<p>According to the graph, the boy ran faster on the way home as the slope is greater on his return. He ran the same distance from the store to&nbsp;his home but in a shorter time.</p>\r\n<p>From my above answer we can conclude that the video game store is at a higher elevation than the store. We know this because running downhill takes less time than running uphill. Since he ran faster on the way home, we can conclude that he ran downhill from the store to his house.</p>',1,''),(74,1,7,'2011-09-24 23:07:48','2011-09-24 23:07:48','[ ... ]','<p>These are impossible p-t graphs for the following reasons:</p>\r\n<p>a) This is impossible as you cannot go backwards in time and return to zero seconds when traveling distances. In addition, an object&nbsp;cannot be in two places at one time, however the graph indicates that this is exactly what is happening.</p>\r\n<p>b) Again, the object is in two places at one time which is impossible and once again, the object is being displaced but its time is decreasing which is also impossible.</p>',3,''),(75,1,7,'2011-09-24 23:12:41','2011-09-24 23:12:41','[ ... ]','<p>It is impossibe for a body to have constant velocity and variable acceleration as acceleration is the rate of change of velocity. If a body has constant velocity it should have no acceleration.</p>',5,'E'),(76,1,7,'2011-09-24 23:15:09','2011-09-24 23:15:09','[ ... ]','<p>These two values will always be the same. When a object is displaced, this means that the object has moved a certain distance AND in a specified direction. The magnitude of displacement therefore, is distance. The term displacement will always encompass the distance of an object\'s movement as well.</p>',2,''),(77,1,7,'2011-09-24 23:34:08','2011-09-24 23:34:08','[ ... ]','<p>Since the length of the train is 1 km, and both trains are moving at the same speed, each train must travel half that distance until they are directly beside one another. Therefore, it will take however long it takes for the trains to move 0.5km.</p>\r\n<p>50/60 = 0.5/x</p>\r\n<p>50x = 60 x 0.5</p>\r\n<p>x = (60 x 0.5) / 50</p>\r\n<p>x = 0.6</p>\r\n<p>Therfore, it will take 0.6 min for the trains\' cabooses to be beside one another.</p>',4,''),(78,2,18,'2011-09-25 01:14:45','2011-09-25 01:14:45','[ ... ]','<div>\r\n<p>a) He ran faster on the way home as the slope is steeper ther, meaning he covered the same disctance in a shorter time period.&nbsp;</p>\r\n<p>b) The video game store is at the higher elevation as he was slower running towards the video game store than towards his home, meaning it was more difficult to run towards the video game store as it is uphill.</p>\r\n</div>',7,''),(79,1,35,'2011-09-25 01:58:10','2011-09-25 01:58:10','[ ... ]','<p>A body cannot be moving in a constant direction at a constant speed while varying its acceleration (slowing down, stopping, or speeding up)</p>',5,'E'),(80,1,35,'2011-09-25 02:01:06','2011-09-25 02:01:06','[ ... ]','<p>In both questions, it appears that the objects are moving back in time when they are heading southbound (opposite of their original direction). This is impossible for a moving object because a moving object cannot go back in time.</p>',3,''),(81,1,35,'2011-09-25 02:05:58','2011-09-25 02:05:58','[ ... ]','<p>a) The boy ran faster on his way home because the position time raph shows him acheiving the same distance (as from his house to the store) within a shorter period of time.</p>\r\n<p>b) This means that the video game store is at a higher elevation, resulting in a slower speed getting there and a faster speed returning home.</p>',1,''),(82,1,35,'2011-09-25 02:14:22','2011-09-25 02:14:22','[ ... ]','<p>Distance = 1km @ 50 km/h --&gt; (60km/h)/(50km/h) -- 1.2 minutes for 1 km.</p>\r\n<p>Therefore, the trains\' cabooses are beside one another 1.2 (1 minute 12 seconds) minutes after the locomotives are right beside each other</p>',4,''),(83,1,35,'2011-09-25 02:15:53','2011-09-25 02:15:53','[ ... ]','<p>the magnitude of the displacement for a moving object will be the same as the distance it travels under the condition that the object moves in the exact same direction and doesn\'t stray off. This way, the displacement will be equal to the distance it travelled.</p>',2,''),(84,1,45,'2011-09-25 05:07:50','2011-09-25 05:07:50','[ ... ]','<p>Since the trains are moving at the same speed at the same time, they need to move 0.5 km for their ends to meet.</p>\r\n<p>&nbsp;</p>\r\n<p>t = 0.5/50 = 0.01 hours = 0.6 minutes</p>\r\n<p>&nbsp;</p>\r\n<p>It will take 0.6 minutes,</p>',4,''),(85,1,45,'2011-09-25 05:12:20','2011-09-25 05:12:20','[ ... ]','<p>a) a is possible because the body will be moving east</p>\r\n<p>b) b is possible because it will be slowing down but moving east</p>\r\n<p>c) c is possible at the instant just before the car starts moving</p>\r\n<p>d) d is possible because velocity will change as the body accelerates</p>\r\n<p>e) e is impossible because velocity must change if the acceleration is nonzero</p>',5,'E'),(86,2,18,'2011-09-25 15:40:24','2011-09-25 15:40:24','[ ... ]','<p>a) It can\'t be because the object starts to go back in the direction of its origin but it is going back in time which it cannot do. An object is always moving, not matter what direction, forwards in time as it cannot cannot go back in time.&nbsp;</p>\r\n<p>b) Similarly, to the previous case, the object starts to move back in time, which it cannot do.&nbsp;</p>',8,''),(87,2,18,'2011-09-25 15:53:05','2011-09-25 15:53:05','[ ... ]','<p>The magnitude of displacement will be equal to the distance travelled when the object has moved in only a straight line. Since the displacement is the shortest distance between the start and end point, if the object moves in a straight line, that will be the total distance travelled, but it will also equal the displacement as it is the shortest distance between the start and end point (straight line).</p>',9,''),(88,2,20,'2011-09-25 17:07:26','2011-09-25 17:07:26','[ ... ]','<p>let us represent the time it takes for the two cabooses to be beside one another as t.</p>\r\n<p>The total&nbsp;distance they travel (displacement)&nbsp;is 50km/h X t [E] - (50km/h X t [W])</p>\r\n<p>=100km/h x t</p>\r\n<p>=100t</p>\r\n<p>If they are each 1 km long, the total distance they must travel is 2km (1+1)</p>\r\n<p>100t=2</p>\r\n<p>t=0.02 hours</p>\r\n<p>=1.2 minutes</p>\r\n<p>1.2 minutes pass before their cabooses are beside one another.</p>',10,''),(89,1,41,'2011-09-25 17:51:01','2011-09-25 17:51:01','[ ... ]','<p>A) The boy ran faster on the way home. At the further point in time, the slope of the line to the beginning (distance 0) is much steeper than that of the one at the beginning. This means that he covered more ground in a shorter period of time, meaning that his journey home was faster than his journey to the store.</p>\r\n<p>B) I think the video game store is at the higher elevation, because it takes more time to run uphill than it does downhill (and it takes the boy more time to go there than to go back).</p>',1,''),(90,1,41,'2011-09-25 17:51:17','2011-09-25 17:51:17','[ ... ]','<p>The magnitude of the displacement for a moving object is the same as the distance it travels when the distance is the shortest possible route. For example, if an object were to head in East in a completely straight line (without wandering around, etc.), the magnitude of its displacement would equal its distance.</p>',2,''),(91,1,41,'2011-09-25 17:51:24','2011-09-25 17:51:24','[ ... ]','<p>A) This cannot be a position-time graph because at several points in time, there is more than one position shown. According to this graph, an object is at more than one place at the same time, which is impossible.</p>\r\n<p>B) This cannot be a position-time graph because, like A, it shows more than one position at several points in time. As well, this graph shows an object changing direction abruptly without slowing down, which, again, is impossible.</p>',3,''),(92,1,41,'2011-09-25 17:51:29','2011-09-25 17:51:29','[ ... ]','<p>d / t = 50KM / 60MINS&nbsp;= 1KM / xMINS</p>\r\n<p>x = 60 / 50 = 1.2MINS</p>\r\n<p>Therefore, 1.2 minutes pass before their cabooses are beside one another.</p>',4,''),(93,1,41,'2011-09-25 17:51:36','2011-09-25 17:51:36','[ ... ]','<p>Acceleration is the rate at which an object changes velocity, so if something has constant velocity, that means that it must have zero acceleration.</p>',5,'E'),(94,2,18,'2011-09-25 17:54:59','2011-09-25 17:54:59','[ ... ]','[ ... ]',11,'E'),(95,2,15,'2011-09-25 18:50:09','2011-09-25 18:50:09','[ ... ]','<p>a) He ran faster on the way home. The backwards sloped section is his d-t for his trip back home and it has a steeper slope than when he ran to the store.</p>\r\n<p>b) The video game store has a higher elevation than his house. The boy ran faster when he was going back home since he could run faster downhill; he could not run as fast uphill when he went to the store.</p>',7,''),(96,1,42,'2011-09-25 18:53:40','2011-09-25 18:53:40','[ ... ]','<p>a) The boy ran faster on the way home. The slope is steeper, which means he used less time for the same amount of distance as when he was running to the store.&nbsp;</p>\r\n<p>b) The video game store is at the higher elevation because running uphill will take more time than running downhill. The boy used more time running to the store, therefore the store must be at the higher elevation.&nbsp;</p>',1,''),(97,1,42,'2011-09-25 18:59:23','2011-09-25 18:59:23','[ ... ]','<p>In both graphs (a) and (b) there are points in time where the object is at two positions at one time, which is impossible. Therefore these could not be the position-time graphs for a movign object.&nbsp;</p>',3,''),(98,1,42,'2011-09-25 19:02:52','2011-09-25 19:02:52','[ ... ]','<p>0.6 of a minute.</p>',4,''),(99,1,42,'2011-09-25 19:04:44','2011-09-25 19:04:44','[ ... ]','<p>E</p>',5,''),(100,1,42,'2011-09-25 19:07:25','2011-09-25 19:07:25','[ ... ]','[ ... ]',6,'E'),(101,2,15,'2011-09-25 19:17:41','2011-09-25 19:17:41','[ ... ]','<p>a) An object can\'t be in two positions at once. It can\'t have two different velocities at one time.</p>\r\n<div>\r\n<p>b) An object can\'t be in two positions at once.</p>\r\n</div>',8,''),(102,2,15,'2011-09-25 19:21:07','2011-09-25 19:21:07','[ ... ]','<p>The magnitude of the displacement for a moving object will be the same as the distance it travels when the object only traveled in a straight line ( in one direction).</p>',9,''),(103,2,15,'2011-09-25 19:26:56','2011-09-25 19:26:56','[ ... ]','<p>1km/50km*60min=1.2min</p>\r\n<p>The cabooses will be beside each other in 1.2 minutes.</p>',10,''),(104,2,18,'2011-09-25 19:38:09','2011-09-25 19:38:09','[ ... ]','<p>Lets suppose the track is 100 km long. After an hour, both trains\' fronts will be at the 50 km mark (halfway). Now if we want to figure out how much time passes so that their cabooses are beside each other, we need to know how much time it takes for both trains to travel 1 km since each train is 1 km long, and after that time, both cabooses will be beside each other. If 50 km is 1 hour, then 1 km is 1/50 hour which is 1.2 mins. Therefore 1.2 mins passes before their cabooses are beside one another.&nbsp;</p>',10,''),(105,1,42,'2011-09-25 20:49:53','2011-09-25 20:49:53','[ ... ]','<p>When the object moves in a straight line in one direction.&nbsp;</p>',2,''),(106,1,38,'2011-09-25 22:29:47','2011-09-25 22:29:47','[ ... ]','<p>The magnitude of the displacement of a moving object is the same as the distance it travels when there is no change in the direction of movement.</p>',2,''),(107,1,38,'2011-09-25 22:34:48','2011-09-25 22:34:48','[ ... ]','<p>In both cases there is a moving object that is at some point, in two positions at the same time. Obviously this is not possible therefore neither of these graphs could be the position time graph for a moving object.</p>',3,''),(108,1,38,'2011-09-25 23:11:41','2011-09-25 23:11:41','[ ... ]','<p>50km/h Divided by 60 mins = 5/6 km/min</p>\r\n<p>1 km divided by 5/6 km/min = 1.2 mins</p>\r\n<p>1.2 mins/2 =0.6 mins</p>\r\n<p>answer = 0.6 minutes</p>',4,''),(109,1,38,'2011-09-25 23:34:34','2011-09-25 23:34:34','[ ... ]','<p>It is impossible to have a constant velocity and have a force acting upon that body. Having a variable acceleration means that at some point there will be a non - zero acceleration causing the body to either slow down or speed up, meaning it is not constant velocity.&nbsp;</p>\r\n<p>I also wondered about answer c) and if it could be true. I wasn\'t sure so I decided to google it and found the answer.</p>\r\n<p>In the immortal words of oldprof, a top contributor to Yahoo Answers, \"</p>\r\n<div id=\"yui_3_3_0_1_1316993029620376\" class=\"content\">Yes it can. For example, if you are rolling backward in your car, your velocity is v &lt; 0, you are going in a negative direction. So now you put the car in gear and gun the engine; so your backward, negative velocity changes to a foward, positive velocity.&nbsp;<br /><br />To change from negative to positive velocity, you must go through v = 0, for an instant you\'d be standing still. But, even so, you are accelerating because, by definition, a change in velocity is acceleration.\"</div>\r\n<h3 id=\"yui_3_3_0_1_1316993029620383\" class=\"reference\">Source(s):</h3>\r\n<div id=\"yui_3_3_0_1_1316993029620386\" class=\"reference\">Physics and engineering degrees.</div>',5,'E'),(110,2,16,'2011-09-26 00:09:37','2011-09-26 00:09:37','[ ... ]','<p>a) The boy ran faster on the way home, because the slope of the line for when the boy is coming home is sharper than the incline of the line that represents him running to the video game store.</p>\r\n<p>b) The video game store, because, in the question, it mentions the boy running as fast as he can to the video game store and back home, so since there is not an implied variance of speed in the question itself, it has to do with the elevation, and objects move faster going on a decline and move slower on an incline.&nbsp;</p>',7,''),(111,2,16,'2011-09-26 00:11:35','2011-09-26 00:11:35','[ ... ]','<p>It is because in the first graph, the graph has two y values per x value, which would not make sense, because that would infer that, at a given time, the object is in two different places at the same time (except at 0). In the second graph, it is not possible, because for a moment in between, there are two y values per x value and is not possible for the reasons above.</p>',8,''),(112,2,16,'2011-09-26 00:19:53','2011-09-26 00:19:53','[ ... ]','<p>Each train is one kilometre long. If their locomotives are right beside each other, then they both have to travel 1km each. If each train is heading towards each other at 50 km/h:</p>\r\n<p>50/60 = 5/6km/min.</p>\r\n<p>1km / 5/6km/min = 1.2 min.</p>\r\n<p>Therefore, it will take 1.2mins for the cabooses to be beside one another.&nbsp;</p>',10,''),(113,2,26,'2011-09-26 00:49:16','2011-09-26 00:49:16','[ ... ]','<p>a) The boy ran faster on the way home. You can tell that he had a greater velocity because the slope of the second part of graph is greater.</p>\r\n<p>&nbsp;</p>\r\n<p>b) The video game store would be at a higher elevation than his home. Running uphill requires you to work against the pull of gravity and would therefore require more energy - the boy was slower running uphill (to the store). Running downhill (on the way back home) would require less energy and the boy would be faster.</p>',7,''),(114,2,26,'2011-09-26 00:51:50','2011-09-26 00:51:50','[ ... ]','<p>a) There is more than one position value for each time value. An object cannot be in two places at once.</p>\r\n<p>b) It is the same situation as graph a): an object cannot have more than one position at a certain time.</p>',8,''),(115,2,26,'2011-09-26 00:53:54','2011-09-26 00:53:54','[ ... ]','<p>The magnitude of the displacement for a moving object will be the same as the distance it travels if it has only travelled in a straight line (no change of direction).</p>',9,''),(116,2,26,'2011-09-26 00:58:58','2011-09-26 00:58:58','[ ... ]','<p>1.2 minutes pass before their cabooses are beside one another (although it depends on the length of the locomotives and cabooses).</p>',10,''),(117,2,26,'2011-09-26 01:02:17','2011-09-26 01:02:17','[ ... ]','[ ... ]',11,'E'),(118,2,19,'2011-09-26 02:49:01','2011-09-26 02:49:01','[ ... ]','<p>It is not a function. There is more than one distance for each time. There is distance at two points in time which is not possible (the object has to move in two places simultaneously).</p>',8,''),(119,2,19,'2011-09-26 02:53:36','2011-09-26 02:53:36','[ ... ]','<p>When the object moves in a straight line in the same direction&nbsp;as distance must = displacement from starting point.</p>',9,''),(120,2,19,'2011-09-26 03:01:41','2011-09-26 03:01:41','[ ... ]','<p>1.2 minutes. The trains need to travel 1 km only to have their ends side by side, as the are travellling in opposite directions. 1/50 x 60 = 1.2</p>',10,''),(121,2,19,'2011-09-26 03:07:01','2011-09-26 03:07:01','[ ... ]','<p>If the velocity is constant the acceleration must also be constant -&gt; slope of velocity = acceleration.</p>',11,'E'),(122,2,16,'2011-09-26 13:13:47','2011-09-26 13:13:47','[ ... ]','<p>If the object moves in a straight line.</p>',9,''),(123,2,16,'2011-09-26 13:26:03','2011-09-26 13:26:03','[ ... ]','<p>If you look at the velocity/time graph, the&nbsp;slope is 0 (constant), and thus, in the acceleration/time graph, the slope of the line would be 0 (constant). However, if the acceleration was variable, it would not be zero and would result in velocity being variable.</p>',11,'E'),(124,2,29,'2011-09-26 17:05:08','2011-09-26 17:05:08','[ ... ]','<p>a) The boy run faster on the way back because his velocity(represented by slope) was higher in magnitude.</p>\r\n<p>b) The video game was in higher elvevation because&nbsp;he was slow getting there(uphill) and fast getting back(downhill).</p>',7,''),(125,2,29,'2011-09-26 17:08:39','2011-09-26 17:08:39','[ ... ]','<p>something can\'t be at two places at once</p>\r\n<p>or can it?</p>',8,''),(126,2,29,'2011-09-26 17:09:38','2011-09-26 17:09:38','[ ... ]','<p>if the object travels in a straight line</p>',9,''),(127,2,29,'2011-09-26 17:11:37','2011-09-26 17:11:37','[ ... ]','<p>1.2mins</p>',10,''),(128,2,29,'2011-09-26 17:13:55','2011-09-26 17:13:55','[ ... ]','<p>the slope of a constant can\'t be a variable</p>',11,'E'),(129,1,49,'2011-09-26 21:22:52','2011-09-26 21:22:52','[ ... ]','<p>a) The boy ran faster on the way home. The 3rd segment of the graph has a greater absolute value for slope than that of the 2nd segment, meaning that his trip back has a greater measured uniform velocity.&nbsp;</p>\r\n<p>b) The video game store would be at a higher elevation because of the graph shows a smaller slope (velocity) on the way to the store.</p>',1,''),(130,1,49,'2011-09-26 21:30:33','2011-09-26 21:30:33','[ ... ]','<p>The magnitude (scalar quantity) of displacement will be the same as distance, when the motion is in a straight line.&nbsp;</p>',2,''),(131,1,49,'2011-09-26 21:43:04','2011-09-26 21:43:04','[ ... ]','<p>In both cases, these cannot be position-time graphs because the direction of time is negative.&nbsp;</p>',3,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,2,9,'2011-09-22 20:12:43','2011-09-22 20:12:43',1,2,2,1),(2,2,9,'2011-09-23 18:47:08','2011-09-23 18:47:08',27,2,3,2),(3,2,9,'2011-09-23 18:47:08','2011-09-23 18:47:08',3,2,4,2),(4,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',9,2,4,3),(5,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',7,2,3,3),(6,2,9,'2011-09-23 19:30:16','2011-09-23 19:30:16',6,2,3,3),(7,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',10,2,4,4),(8,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',8,2,4,4),(9,2,9,'2011-09-24 00:12:05','2011-09-24 00:12:05',5,2,4,4),(10,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',14,2,4,5),(11,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',11,2,3,5),(12,2,9,'2011-09-24 00:13:52','2011-09-24 00:13:52',4,2,2,5),(13,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',13,2,1,6),(14,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',12,2,4,6),(15,2,9,'2011-09-24 00:18:28','2011-09-24 00:18:28',2,2,3,6),(16,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',118,2,4,7),(17,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',114,2,4,7),(18,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',111,2,4,7),(19,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',101,2,3,7),(20,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',86,2,4,7),(21,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',69,2,4,7),(22,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',62,2,4,7),(23,2,9,'2011-09-26 03:38:35','2011-09-26 03:38:35',41,2,4,7),(24,1,6,'2011-09-26 18:23:26','2011-09-26 18:23:26',96,2,3,8),(25,1,6,'2011-09-26 18:23:26','2011-09-26 18:23:26',89,2,3,8);
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
INSERT INTO `example` VALUES (1,2,30,'2011-09-26 17:32:25','2011-09-26 17:32:25','Do not use','<p>This is an example of static friction when he turn the laptop on the table</p>','http://place.aardvark.encorelab.org/content/258ff78d-98db-43bc-93d7-6ff361366e49_encoded.mp4','258ff78d-98db-43bc-93d7-6ff361366e49_encoded.mp4','video/x-ms-wmv',3);
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

-- Dump completed on 2011-09-26 21:53:18
