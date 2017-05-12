-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `about_bosses`
--

DROP TABLE IF EXISTS `about_bosses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_bosses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_bosses`
--

LOCK TABLES `about_bosses` WRITE;
/*!40000 ALTER TABLE `about_bosses` DISABLE KEYS */;
/*!40000 ALTER TABLE `about_bosses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about_companies`
--

DROP TABLE IF EXISTS `about_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_companies`
--

LOCK TABLES `about_companies` WRITE;
/*!40000 ALTER TABLE `about_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `about_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_issue_requests`
--

DROP TABLE IF EXISTS `access_issue_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_issue_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_tracker_access_id` int(11) DEFAULT NULL,
  `issue_request_id` int(11) DEFAULT NULL,
  `issue_tracker_member_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `current_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_access_issue_requests_on_issue_tracker_access_id` (`issue_tracker_access_id`),
  KEY `index_access_issue_requests_on_issue_request_id` (`issue_request_id`),
  KEY `index_access_issue_requests_on_issue_tracker_member_id` (`issue_tracker_member_id`),
  CONSTRAINT `fk_rails_0a048064d0` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
  CONSTRAINT `fk_rails_228cf4b553` FOREIGN KEY (`issue_tracker_access_id`) REFERENCES `issue_tracker_accesses` (`id`),
  CONSTRAINT `fk_rails_7334290db2` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_issue_requests`
--

LOCK TABLES `access_issue_requests` WRITE;
/*!40000 ALTER TABLE `access_issue_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_issue_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accident_images`
--

DROP TABLE IF EXISTS `accident_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accident_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accident_record_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_accident_images_on_accident_record_id` (`accident_record_id`),
  CONSTRAINT `fk_rails_6f1efcdf33` FOREIGN KEY (`accident_record_id`) REFERENCES `accident_records` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accident_images`
--

LOCK TABLES `accident_images` WRITE;
/*!40000 ALTER TABLE `accident_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `accident_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accident_masters`
--

DROP TABLE IF EXISTS `accident_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accident_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accident_masters`
--

LOCK TABLES `accident_masters` WRITE;
/*!40000 ALTER TABLE `accident_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `accident_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accident_records`
--

DROP TABLE IF EXISTS `accident_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accident_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `accident_date` date DEFAULT NULL,
  `esic_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `case_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_of_injury` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_date_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `root_cause_master_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_accident_records_on_employee_id` (`employee_id`),
  KEY `index_accident_records_on_root_cause_master_id` (`root_cause_master_id`),
  KEY `index_accident_records_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_78c1fde7b1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9285e2637a` FOREIGN KEY (`root_cause_master_id`) REFERENCES `root_cause_masters` (`id`),
  CONSTRAINT `fk_rails_d35c310423` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accident_records`
--

LOCK TABLES `accident_records` WRITE;
/*!40000 ALTER TABLE `accident_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `accident_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_salaries`
--

DROP TABLE IF EXISTS `advance_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `advance_amount` decimal(15,2) DEFAULT NULL,
  `no_of_instalment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instalment_amount` decimal(15,2) DEFAULT NULL,
  `advance_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `advance_type_id` int(11) DEFAULT NULL,
  `interest` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_advance_salaries_on_advance_type_id` (`advance_type_id`),
  KEY `index_advance_salaries_on_employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
INSERT INTO `advance_salaries` VALUES (263,4962,7500.00,'5',1500.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(264,4677,5000.00,'1',5000.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(265,4616,9000.00,'6',1500.00,'2016-01-01','2016-04-06 08:40:21','2016-06-07 06:20:24',NULL,NULL),(266,4915,2000.00,'1',2000.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(267,4715,4000.00,'4',1000.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(268,4776,9000.00,'9',1000.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(269,4651,1500.00,'1',1500.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(270,4798,2500.00,'2',1250.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(271,4684,10000.00,'5',2000.00,'2016-01-01','2016-04-06 08:40:21','2016-04-06 08:40:21',NULL,NULL),(272,4700,2500.00,'2',1500.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(273,4650,4000.00,'4',1000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(274,4927,1000.00,'1',1000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(275,4691,18500.00,'13',1500.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(277,4671,4000.00,'4',1000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(278,4874,1000.00,'1',1000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(279,4758,8000.00,'8',1000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(280,4926,13500.00,'9',1500.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(281,4658,1000.00,'1',2000.00,'2016-01-01','2016-04-06 08:40:22','2016-04-06 08:40:22',NULL,NULL),(282,5072,1000.00,'1',1000.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(283,4619,10500.00,'7',1500.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(284,4732,7000.00,'7',1000.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(285,4840,7500.00,'5',1500.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(286,4692,2500.00,'2',1500.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(287,4718,20000.00,'14',1500.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(288,4628,2500.00,'2',1500.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(289,4614,20000.00,'10',2000.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(290,4764,18000.00,'9',2000.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(291,4731,4000.00,'4',1000.00,'2016-01-01','2016-04-06 08:40:23','2016-04-06 08:40:23',NULL,NULL),(292,4740,20000.00,'10',2000.00,'2016-01-01','2016-04-06 08:40:39','2016-04-06 08:40:39',NULL,NULL),(293,4615,30000.00,'10',3000.00,'2016-01-01','2016-04-06 08:40:39','2016-04-06 08:40:39',NULL,NULL),(294,4653,139.00,'1',139.00,'2016-01-01','2016-04-06 08:40:39','2016-04-06 08:40:39',NULL,NULL),(295,4677,10000.00,'2',5000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(296,4683,5000.00,'1',5000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(297,4927,5000.00,'5',1000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(298,4688,30000.00,'6',5000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(299,4742,10000.00,'10',1000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(300,4763,10000.00,'10',1000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(301,4642,20000.00,'8',2500.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(302,4864,10000.00,'5',2000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(303,4865,20000.00,'10',2000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(304,5022,10000.00,'10',1000.00,'2016-02-01','2016-04-06 08:41:07','2016-04-06 08:41:07',NULL,NULL),(305,4835,2000.00,'1',2000.00,'2016-02-01','2016-04-06 08:41:08','2016-04-06 08:41:08',NULL,NULL),(306,5104,2000.00,'1',2000.00,'2016-02-01','2016-04-06 08:41:08','2016-04-06 08:41:08',NULL,NULL),(307,4612,100000.00,'20',5000.00,'2016-02-01','2016-04-06 08:41:08','2016-04-06 08:41:08',NULL,NULL),(308,4653,1145.00,'1',1145.00,'2016-02-01','2016-04-06 08:41:08','2016-04-06 08:41:08',NULL,NULL),(309,4968,10000.00,'10',1000.00,'2016-03-01','2016-04-06 08:41:21','2016-04-06 08:41:21',NULL,NULL),(310,4894,1500.00,'1',1500.00,'2016-03-01','2016-04-06 08:41:21','2016-04-06 08:41:21',NULL,NULL),(311,4710,15000.00,'10',1500.00,'2016-03-01','2016-04-06 08:41:21','2016-04-06 08:41:21',NULL,NULL),(312,4718,2000.00,'2',1000.00,'2016-03-01','2016-04-06 08:41:21','2016-04-06 08:41:21',NULL,NULL),(313,4830,5000.00,'5',1000.00,'2016-03-01','2016-04-06 08:41:21','2016-05-05 12:48:13',1,NULL),(324,4680,2500.00,'1',2500.00,'2016-04-06','2016-05-05 08:59:32','2016-05-05 08:59:32',1,NULL),(325,4684,16000.00,'8',2000.00,'2016-04-13','2016-05-05 09:05:53','2016-05-05 09:05:53',2,NULL),(326,4825,10000.00,'10',1000.00,'2016-04-11','2016-05-05 09:07:44','2016-05-05 09:07:44',2,NULL),(327,5124,1500.00,'1',1500.00,'2016-04-05','2016-05-05 09:09:25','2016-05-05 09:09:25',1,NULL),(328,4731,10000.00,'10',1000.00,'2016-04-23','2016-05-05 09:16:05','2016-05-05 09:16:05',2,NULL),(329,4741,2338.00,'1',2338.00,'2016-04-16','2016-05-05 10:02:26','2016-05-05 10:02:26',1,NULL),(330,4738,10000.00,'10',1000.00,'2016-01-01','2016-05-05 12:51:36','2016-05-05 12:51:36',1,NULL),(331,4798,5000.00,'4',1250.00,'2016-05-25','2016-06-07 05:18:38','2016-06-07 05:18:38',2,NULL),(332,4700,15000.00,'10',1500.00,'2016-05-25','2016-06-07 05:19:59','2016-06-07 05:19:59',2,NULL),(333,4927,1000.00,'1',1000.00,'2016-05-13','2016-06-07 05:22:55','2016-06-07 05:22:55',1,NULL),(334,5033,5000.00,'5',1000.00,'2016-05-28','2016-06-07 05:33:02','2016-06-07 05:33:02',2,NULL),(335,4701,3000.00,'1',3000.00,'2016-05-02','2016-06-07 05:34:36','2016-06-07 05:34:36',1,NULL),(336,4894,10000.00,'10',1000.00,'2016-05-28','2016-06-07 05:36:52','2016-06-07 05:36:52',2,NULL),(337,4705,5000.00,'5',1000.00,'2016-05-06','2016-06-07 05:37:44','2016-06-07 05:37:44',2,NULL),(338,4714,10000.00,'10',1000.00,'2016-05-11','2016-06-07 05:39:40','2016-06-07 05:39:40',2,NULL),(339,5124,3000.00,'1',3000.00,'2016-05-25','2016-06-07 05:40:58','2016-06-07 05:40:58',1,NULL),(340,4653,2851.00,'1',2851.00,'2016-05-27','2016-06-07 05:41:57','2016-06-07 05:41:57',1,NULL),(347,4667,4000.00,'2',2000.00,'2016-01-01','2016-06-07 11:33:09','2016-06-07 11:45:47',1,NULL),(348,4818,1000.00,'1',1000.00,'2016-01-01','2016-06-07 11:33:40','2016-06-07 11:46:47',1,NULL),(349,4834,8000.00,'8',1000.00,'2016-01-01','2016-06-07 11:34:41','2016-06-07 11:34:41',1,NULL),(350,4851,20000.00,'10',2000.00,'2016-01-01','2016-06-07 11:35:14','2016-06-07 11:35:14',1,NULL),(351,4859,3000.00,'1',3000.00,'2016-01-01','2016-06-07 11:35:58','2016-06-07 11:35:58',1,NULL),(352,4875,8000.00,'8',1000.00,'2016-01-01','2016-06-07 11:36:42','2016-06-07 11:36:42',1,NULL),(353,4919,2500.00,'2',1250.00,'2016-01-01','2016-06-07 11:37:30','2016-06-07 11:37:30',1,NULL),(354,4930,1000.00,'1',1000.00,'2016-01-01','2016-06-07 11:38:42','2016-06-07 11:38:42',1,NULL),(355,4933,8000.00,'8',1000.00,'2016-01-01','2016-06-07 11:40:13','2016-06-07 11:40:13',1,NULL),(356,5062,5000.00,'2',2500.00,'2016-01-01','2016-06-07 11:40:50','2016-06-07 11:40:50',1,NULL),(357,4931,15000.00,'10',1500.00,'2016-05-01','2016-06-07 11:41:45','2016-06-07 11:41:45',1,NULL),(358,5049,2250.00,'1',2250.00,'2016-05-01','2016-06-07 11:42:33','2016-06-07 11:42:33',1,NULL),(359,4729,13500.00,'9',1500.00,'2016-08-10','2016-08-10 04:03:47','2016-08-10 04:03:47',2,NULL),(360,4650,4000.00,'4',1000.00,'2016-08-10','2016-08-10 04:05:05','2016-08-10 04:05:05',2,NULL),(361,4688,10000.00,'1',10000.00,'2016-08-10','2016-08-10 04:08:13','2016-08-10 04:08:13',1,NULL),(362,4874,9000.00,'9',1000.00,'2016-08-10','2016-08-10 04:09:56','2016-08-10 04:09:56',2,NULL),(363,5072,12000.00,'4',3000.00,'2016-08-10','2016-08-10 04:21:16','2016-08-10 04:21:16',2,NULL),(364,4840,8000.00,'4',2000.00,'2016-08-10','2016-08-10 04:22:36','2016-08-10 04:22:36',2,NULL),(365,4692,18000.00,'9',2000.00,'2016-08-10','2016-08-10 04:23:43','2016-08-10 04:23:43',2,NULL),(366,4921,4000.00,'4',1000.00,'2016-08-10','2016-08-10 04:24:34','2016-08-10 04:24:34',2,NULL),(367,4804,20000.00,'4',5000.00,'2016-08-10','2016-08-10 04:26:07','2016-08-10 04:26:07',2,NULL),(368,4689,8000.00,'4',2000.00,'2016-08-10','2016-08-10 04:27:21','2016-08-10 04:27:21',2,NULL),(369,4667,20000.00,'10',2000.00,'2016-06-01','2016-09-02 05:54:14','2016-09-02 05:54:14',1,NULL),(370,4636,20000.00,'10',2000.00,'2016-08-09','2016-09-06 08:27:08','2016-09-06 08:27:08',2,NULL),(371,4895,3000.00,'2',1500.00,'2016-08-17','2016-09-06 08:37:30','2016-09-06 08:37:30',2,NULL),(372,5124,2500.00,'1',2500.00,'2016-08-22','2016-09-06 08:40:31','2016-09-06 08:40:31',1,NULL),(373,4653,1435.00,'1',1435.00,'2016-08-09','2016-09-06 08:41:42','2016-09-06 08:41:42',1,NULL),(374,5062,323.00,'1',323.00,'2016-09-01','2016-09-13 08:03:54','2016-09-13 08:03:54',1,NULL),(375,5063,1020.00,'1',1020.00,'2016-09-01','2016-09-13 08:51:04','2016-09-13 08:51:04',1,NULL),(376,5077,180.00,'1',180.00,'2016-09-01','2016-09-13 08:56:05','2016-09-13 08:56:05',1,NULL),(377,5106,108.00,'1',108.00,'2016-09-01','2016-09-13 09:13:12','2016-09-13 09:13:12',1,NULL),(378,5107,4000.00,'1',4000.00,'2016-09-23','2016-09-24 05:00:25','2016-09-24 05:00:25',1,NULL),(379,5062,20000.00,'10',2000.00,'2016-09-10','2016-10-03 11:23:12','2016-10-03 11:23:12',2,NULL),(380,4994,10000.00,'5',2000.00,'2016-09-10','2016-10-03 11:24:46','2016-10-03 11:24:46',2,NULL),(381,4653,3654.00,'1',3654.00,'2016-09-03','2016-10-03 11:29:07','2016-10-03 11:29:07',1,NULL),(382,4829,10000.00,'10',1000.00,'2016-09-01','2016-10-03 11:37:03','2016-10-03 11:37:03',2,NULL),(383,4926,12000.00,'12',1000.00,'2016-10-21','2016-11-03 10:36:46','2016-11-03 10:36:46',2,NULL),(384,4718,3000.00,'3',1000.00,'2016-10-29','2016-11-03 10:37:50','2016-11-03 10:37:50',2,NULL),(385,4653,285.00,'1',285.00,'2016-10-01','2016-11-03 10:39:06','2016-11-03 10:39:06',1,NULL),(386,5018,5000.00,'1',5000.00,'2016-07-01','2016-12-24 04:48:05','2016-12-24 04:48:05',1,NULL),(387,4930,5000.00,'2',2500.00,'2016-12-07','2017-01-04 08:43:19','2017-01-04 08:50:13',1,NULL),(388,4818,2630.00,'1',2630.00,'2016-12-15','2017-01-04 08:48:36','2017-01-04 09:13:07',1,NULL),(389,4994,20000.00,'4',5000.00,'2016-12-26','2017-01-04 08:56:33','2017-01-04 08:56:33',2,NULL),(390,4830,6000.00,'6',1000.00,'2016-12-19','2017-01-04 08:57:27','2017-01-04 08:57:27',2,NULL),(391,4653,9188.00,'1',9188.00,'2016-12-30','2017-01-04 09:03:04','2017-01-04 09:05:32',1,NULL),(392,5072,10000.00,'10',1000.00,'2016-12-01','2017-01-04 09:09:35','2017-01-04 09:09:35',2,NULL),(393,4616,977.00,'1',977.00,'2017-01-30','2017-01-30 12:05:35','2017-01-30 12:05:35',1,NULL),(394,4618,1766.00,'1',1766.00,'2017-01-30','2017-01-30 12:06:18','2017-01-30 12:06:18',1,NULL),(395,4624,1132.00,'1',1132.00,'2017-01-30','2017-01-30 12:07:15','2017-01-30 12:07:15',1,NULL),(396,4630,1766.00,'1',1766.00,'2017-01-30','2017-01-30 12:08:13','2017-01-30 12:08:13',1,NULL),(397,4631,1201.00,'1',1201.00,'2017-01-30','2017-01-30 12:08:53','2017-01-30 12:08:53',1,NULL),(398,4639,1412.00,'1',1412.00,'2017-01-30','2017-01-30 12:09:36','2017-01-30 12:09:36',1,NULL),(399,4640,1190.00,'1',1190.00,'2017-01-30','2017-01-30 12:15:51','2017-01-30 12:15:51',1,NULL),(400,4641,1132.00,'1',1132.00,'2017-01-30','2017-01-30 12:17:16','2017-01-30 12:17:16',1,NULL),(401,4646,1133.00,'1',1133.00,'2017-01-30','2017-01-30 12:18:01','2017-01-30 12:18:01',1,NULL),(402,4647,2119.00,'1',2119.00,'2017-01-30','2017-01-30 12:18:40','2017-01-30 12:18:40',1,NULL),(403,4648,1984.00,'1',1984.00,'2017-01-30','2017-01-30 12:19:22','2017-01-30 12:19:22',1,NULL),(404,4651,1132.00,'1',1132.00,'2017-01-30','2017-01-30 12:20:03','2017-01-30 12:20:03',1,NULL),(405,4652,353.00,'1',353.00,'2017-01-30','2017-01-30 12:20:50','2017-01-30 12:20:50',1,NULL),(406,4655,1766.00,'1',1766.00,'2017-01-30','2017-01-30 12:27:21','2017-01-30 12:27:21',1,NULL),(407,4657,1413.00,'1',1413.00,'2017-01-30','2017-01-30 12:28:08','2017-01-30 12:28:08',1,NULL),(408,4840,1413.00,'1',1413.00,'2017-01-30','2017-01-30 12:28:42','2017-01-30 12:28:42',1,NULL),(409,4616,15000.00,'10',1500.00,'2017-01-16','2017-01-30 12:31:40','2017-01-30 12:31:40',2,NULL),(410,4650,5000.00,'5',1000.00,'2017-01-03','2017-01-30 12:33:08','2017-01-30 12:33:08',2,NULL),(411,4742,5000.00,'5',1000.00,'2017-01-16','2017-01-30 12:34:06','2017-01-30 12:34:06',2,NULL),(412,4606,9000.00,'3',3000.00,'2017-01-16','2017-01-30 12:36:02','2017-01-30 12:36:02',2,NULL),(414,4718,11000.00,'10',1100.00,'2017-01-30','2017-02-02 10:18:25','2017-02-02 10:18:25',1,NULL),(415,4950,20000.00,'10',2000.00,'2017-01-06','2017-02-04 06:48:34','2017-02-04 06:48:34',2,NULL),(416,4930,5000.00,'2',2500.00,'2017-01-01','2017-02-04 07:18:15','2017-02-04 07:18:15',2,NULL),(417,4607,10000.00,'10',1000.00,'2017-05-01','2017-05-02 05:26:18','2017-05-02 05:26:18',1,NULL);
/*!40000 ALTER TABLE `advance_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_types`
--

DROP TABLE IF EXISTS `advance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_types`
--

LOCK TABLES `advance_types` WRITE;
/*!40000 ALTER TABLE `advance_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisees`
--

DROP TABLE IF EXISTS `appraisees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisees`
--

LOCK TABLES `appraisees` WRITE;
/*!40000 ALTER TABLE `appraisees` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraiser_ratings`
--

DROP TABLE IF EXISTS `appraiser_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraiser_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraiser_ratings`
--

LOCK TABLES `appraiser_ratings` WRITE;
/*!40000 ALTER TABLE `appraiser_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraiser_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisers`
--

DROP TABLE IF EXISTS `appraisers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisers`
--

LOCK TABLES `appraisers` WRITE;
/*!40000 ALTER TABLE `appraisers` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_types`
--

DROP TABLE IF EXISTS `asset_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_types`
--

LOCK TABLES `asset_types` WRITE;
/*!40000 ALTER TABLE `asset_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_assets`
--

DROP TABLE IF EXISTS `assigned_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `assets_detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assets_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assets_value` decimal(10,0) DEFAULT NULL,
  `assest_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `returned_on` date DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assigned_assets_on_employee_id` (`employee_id`),
  KEY `index_assigned_assets_on_asset_type_id` (`asset_type_id`),
  CONSTRAINT `fk_rails_4dbaeb356d` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`),
  CONSTRAINT `fk_rails_b22ee48f7e` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_assets`
--

LOCK TABLES `assigned_assets` WRITE;
/*!40000 ALTER TABLE `assigned_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_shift_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `shift_rotation_id` int(11) DEFAULT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `company_hrs` decimal(10,0) DEFAULT NULL,
  `over_time_hrs` decimal(10,0) DEFAULT NULL,
  `total_hrs` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attendances_on_employee_shift_id` (`employee_shift_id`),
  KEY `index_attendances_on_employee_id` (`employee_id`),
  KEY `index_attendances_on_shift_rotation_id` (`shift_rotation_id`),
  CONSTRAINT `fk_rails_3640bd6960` FOREIGN KEY (`shift_rotation_id`) REFERENCES `shift_rotations` (`id`),
  CONSTRAINT `fk_rails_3efe4fd262` FOREIGN KEY (`employee_shift_id`) REFERENCES `employee_shifts` (`id`),
  CONSTRAINT `fk_rails_ce4baedec1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_masters`
--

DROP TABLE IF EXISTS `attribute_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definition` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attribute_weightage` tinyint(1) DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_masters`
--

LOCK TABLES `attribute_masters` WRITE;
/*!40000 ALTER TABLE `attribute_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_rating_sheets`
--

DROP TABLE IF EXISTS `attribute_rating_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_rating_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `employee_attribute_id` int(11) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm_appraiser` tinyint(1) DEFAULT NULL,
  `is_confirm_appraisee` tinyint(1) DEFAULT NULL,
  `appraiser2_comment` text COLLATE utf8_unicode_ci,
  `final_comment` text COLLATE utf8_unicode_ci,
  `final_id_id` int(11) DEFAULT NULL,
  `appraiser_2_id` int(11) DEFAULT NULL,
  `is_confirm_final` tinyint(1) DEFAULT NULL,
  `is_confirm_appraiser2` tinyint(1) DEFAULT NULL,
  `appraisee_rating_id` int(11) DEFAULT NULL,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `appraiser2_rating_id` int(11) DEFAULT NULL,
  `final_rating_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attribute_rating_sheets_on_appraisee_id` (`appraisee_id`),
  KEY `index_attribute_rating_sheets_on_appraisee_rating_id` (`appraisee_rating_id`),
  KEY `index_attribute_rating_sheets_on_appraiser2_rating_id` (`appraiser2_rating_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_2_id` (`appraiser_2_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_id` (`appraiser_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_rating_id` (`appraiser_rating_id`),
  KEY `index_attribute_rating_sheets_on_employee_attribute_id` (`employee_attribute_id`),
  KEY `index_attribute_rating_sheets_on_final_id_id` (`final_id_id`),
  KEY `index_attribute_rating_sheets_on_final_rating_id` (`final_rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_rating_sheets`
--

LOCK TABLES `attribute_rating_sheets` WRITE;
/*!40000 ALTER TABLE `attribute_rating_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_rating_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `award_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `award_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `year_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_awards_on_employee_id` (`employee_id`),
  KEY `index_awards_on_year_id` (`year_id`),
  CONSTRAINT `fk_rails_313ad83d78` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_b52222e73a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_groups`
--

DROP TABLE IF EXISTS `blood_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(2,'AB+',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(3,'B+',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(4,'O+',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(5,'A-',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(6,'AB-',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(7,'B-',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(8,'O-',NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50');
/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bonus_amount` decimal(15,2) DEFAULT '0.00',
  `bouns_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bonus_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_employees`
--

DROP TABLE IF EXISTS `bonus_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bonus_date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actual_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bonus_employees_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_4758ee67f8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_employees`
--

LOCK TABLES `bonus_employees` WRITE;
/*!40000 ALTER TABLE `bonus_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_employers`
--

DROP TABLE IF EXISTS `bonus_employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_employers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limit_amount` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_employers`
--

LOCK TABLES `bonus_employers` WRITE;
/*!40000 ALTER TABLE `bonus_employers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_masters`
--

DROP TABLE IF EXISTS `bonus_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_bouns` tinyint(1) DEFAULT NULL,
  `limit_amount` decimal(15,2) DEFAULT '0.00',
  `bonus_persentage` decimal(15,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_masters`
--

LOCK TABLES `bonus_masters` WRITE;
/*!40000 ALTER TABLE `bonus_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capture_resumes`
--

DROP TABLE IF EXISTS `capture_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capture_resumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_candidate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_applied` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode_of_application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_application` date DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_employeer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill_set` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_salary` decimal(10,0) DEFAULT NULL,
  `expected_salary` decimal(10,0) DEFAULT NULL,
  `current_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_call_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_capture_resumes_on_country_id` (`country_id`),
  KEY `index_capture_resumes_on_state_id` (`state_id`),
  KEY `index_capture_resumes_on_district_id` (`district_id`),
  KEY `index_capture_resumes_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_capture_resumes_on_degree_id` (`degree_id`),
  KEY `index_capture_resumes_on_employee_designation_id` (`employee_designation_id`),
  CONSTRAINT `fk_rails_0f4b539aa3` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2302e8687b` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_31b92a49fb` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_c9f81d99cc` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_e4dafd334a` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`),
  CONSTRAINT `fk_rails_f53cb791d0` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capture_resumes`
--

LOCK TABLES `capture_resumes` WRITE;
/*!40000 ALTER TABLE `capture_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `capture_resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_masters`
--

DROP TABLE IF EXISTS `certificate_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_masters`
--

LOCK TABLES `certificate_masters` WRITE;
/*!40000 ALTER TABLE `certificate_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_master_id` int(11) DEFAULT NULL,
  `h1_start` text COLLATE utf8_unicode_ci,
  `h1_end` text COLLATE utf8_unicode_ci,
  `h2_start` text COLLATE utf8_unicode_ci,
  `h2_end` text COLLATE utf8_unicode_ci,
  `b1_start` text COLLATE utf8_unicode_ci,
  `b1_end` text COLLATE utf8_unicode_ci,
  `b2_start` text COLLATE utf8_unicode_ci,
  `b2_end` text COLLATE utf8_unicode_ci,
  `b3_start` text COLLATE utf8_unicode_ci,
  `b3_end` text COLLATE utf8_unicode_ci,
  `b4_start` text COLLATE utf8_unicode_ci,
  `b4_end` text COLLATE utf8_unicode_ci,
  `b5_start` text COLLATE utf8_unicode_ci,
  `b5_end` text COLLATE utf8_unicode_ci,
  `f1_start` text COLLATE utf8_unicode_ci,
  `f1_end` text COLLATE utf8_unicode_ci,
  `f2_start` text COLLATE utf8_unicode_ci,
  `f2_end` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_certificates_on_certificate_master_id` (`certificate_master_id`),
  CONSTRAINT `fk_rails_68266a2ad4` FOREIGN KEY (`certificate_master_id`) REFERENCES `certificate_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_certifications_on_employee_id` (`employee_id`),
  KEY `index_certifications_on_year_id` (`year_id`),
  CONSTRAINT `fk_rails_4d62fa2844` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_6311d49c43` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_status_employees`
--

DROP TABLE IF EXISTS `change_status_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_status_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_status_employees`
--

LOCK TABLES `change_status_employees` WRITE;
/*!40000 ALTER TABLE `change_status_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_status_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circulars`
--

DROP TABLE IF EXISTS `circulars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circulars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circulars`
--

LOCK TABLES `circulars` WRITE;
/*!40000 ALTER TABLE `circulars` DISABLE KEYS */;
/*!40000 ALTER TABLE `circulars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `manual_company_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `registration_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan_card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `professional_tax_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_logo_file_size` int(11) DEFAULT NULL,
  `company_logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_companies_on_group_id` (`group_id`),
  KEY `index_companies_on_company_type_id` (`company_type_id`),
  KEY `index_companies_on_country_id` (`country_id`),
  KEY `index_companies_on_state_id` (`state_id`),
  KEY `index_companies_on_district_id` (`district_id`),
  CONSTRAINT `fk_rails_45f67c57ab` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_75b15a5c36` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_7ab6bbff41` FOREIGN KEY (`company_type_id`) REFERENCES `company_types` (`id`),
  CONSTRAINT `fk_rails_cc96da5b02` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `fk_rails_daaa2a7e61` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,NULL,'01','COM001','SG Analytics Pvt Limited',' SG Analytics',1,'AAAAAAAAAAAAA','','','','Pune',1,20,504,'Pune',125463,'','9874563201','www.sg.com',NULL,'2017-05-11 14:31:31','2017-05-11 14:31:31',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_events`
--

DROP TABLE IF EXISTS `company_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` text COLLATE utf8_unicode_ci,
  `event_date` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_events`
--

LOCK TABLES `company_events` WRITE;
/*!40000 ALTER TABLE `company_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_leavs`
--

DROP TABLE IF EXISTS `company_leavs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_leavs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_grade_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_leavs_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_company_leavs_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_0a365495de` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_6a024a8a15` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_leavs`
--

LOCK TABLES `company_leavs` WRITE;
/*!40000 ALTER TABLE `company_leavs` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_leavs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_locations`
--

DROP TABLE IF EXISTS `company_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `manual_company_location_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_locations_on_company_id` (`company_id`),
  KEY `index_company_locations_on_country_id` (`country_id`),
  KEY `index_company_locations_on_state_id` (`state_id`),
  KEY `index_company_locations_on_district_id` (`district_id`),
  CONSTRAINT `fk_rails_0e2b16b238` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_a6715d2385` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_ddc410b1b7` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_f501eb057f` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'01','COMLOC001','Pune','','','Pune',1,20,504,698547,'','2017-05-11 14:32:11','2017-05-11 14:32:11'),(2,1,'02','COMLOC002','Hyderabad','','','Hyderabad',1,31,737,963258,'','2017-05-11 14:33:40','2017-05-11 14:33:40');
/*!40000 ALTER TABLE `company_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_policies`
--

DROP TABLE IF EXISTS `company_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_policies`
--

LOCK TABLES `company_policies` WRITE;
/*!40000 ALTER TABLE `company_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_shifts`
--

DROP TABLE IF EXISTS `company_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_shifts`
--

LOCK TABLES `company_shifts` WRITE;
/*!40000 ALTER TABLE `company_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_time_masters`
--

DROP TABLE IF EXISTS `company_time_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_time_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `in_min_time` datetime DEFAULT NULL,
  `in_max_time` datetime DEFAULT NULL,
  `out_min_time` datetime DEFAULT NULL,
  `out_max_time` datetime DEFAULT NULL,
  `working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `shift_master_id` int(11) DEFAULT NULL,
  `rest_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_adjust` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_time_masters_on_shift_master_id` (`shift_master_id`),
  CONSTRAINT `fk_rails_dd2217bb7b` FOREIGN KEY (`shift_master_id`) REFERENCES `shift_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_time_masters`
--

LOCK TABLES `company_time_masters` WRITE;
/*!40000 ALTER TABLE `company_time_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_time_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_types`
--

DROP TABLE IF EXISTS `company_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'1.0','Private Limited ',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(2,'2.0','Limited Liability Partnership',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(3,'3.0','Public Limited',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47');
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_centers`
--

DROP TABLE IF EXISTS `cost_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_centers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'IN','India','2017-05-11 13:50:58','2017-05-11 13:50:58');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_masters`
--

DROP TABLE IF EXISTS `currency_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_masters`
--

LOCK TABLES `currency_masters` WRITE;
/*!40000 ALTER TABLE `currency_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_auto_increments`
--

DROP TABLE IF EXISTS `custom_auto_increments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_auto_increments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `counter_model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_auto_increments_on_counter_model_name` (`counter_model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_auto_increments`
--

LOCK TABLES `custom_auto_increments` WRITE;
/*!40000 ALTER TABLE `custom_auto_increments` DISABLE KEYS */;
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-05-11 14:31:31','2017-05-11 14:31:31'),(2,'company_location',2,'2017-05-11 14:32:11','2017-05-11 14:33:40'),(3,'department',14,'2017-05-11 14:34:33','2017-05-11 14:39:18'),(4,'employee',423,'2017-05-12 09:39:48','2017-05-12 09:40:27');
/*!40000 ALTER TABLE `custom_auto_increments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `da_masters`
--

DROP TABLE IF EXISTS `da_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `da_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_da` tinyint(1) DEFAULT NULL,
  `minimum_wages` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `da_masters`
--

LOCK TABLES `da_masters` WRITE;
/*!40000 ALTER TABLE `da_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `da_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_bill_detail_histories`
--

DROP TABLE IF EXISTS `daily_bill_detail_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_bill_detail_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_bill_detail_id` int(11) DEFAULT NULL,
  `travel_expence_type_id` int(11) DEFAULT NULL,
  `expence_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `e_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_expence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boolean` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_daily_bill_detail_histories_on_daily_bill_detail_id` (`daily_bill_detail_id`),
  KEY `index_daily_bill_detail_histories_on_travel_expence_type_id` (`travel_expence_type_id`),
  CONSTRAINT `fk_rails_141a0d76cd` FOREIGN KEY (`daily_bill_detail_id`) REFERENCES `daily_bill_details` (`id`),
  CONSTRAINT `fk_rails_44e43dda14` FOREIGN KEY (`travel_expence_type_id`) REFERENCES `travel_expence_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_bill_detail_histories`
--

LOCK TABLES `daily_bill_detail_histories` WRITE;
/*!40000 ALTER TABLE `daily_bill_detail_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_bill_detail_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_bill_details`
--

DROP TABLE IF EXISTS `daily_bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_bill_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_request_id` int(11) DEFAULT NULL,
  `expence_date` date DEFAULT NULL,
  `e_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_expence` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `travel_expence_type_id` int(11) DEFAULT NULL,
  `request_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `avatar_file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_file_size` int(11) DEFAULT NULL,
  `avatar_file_updated_at` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `currency_master_id` int(11) DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_daily_bill_details_on_travel_request_id` (`travel_request_id`),
  KEY `index_daily_bill_details_on_travel_expence_type_id` (`travel_expence_type_id`),
  KEY `index_daily_bill_details_on_currency_master_id` (`currency_master_id`),
  CONSTRAINT `fk_rails_bfd526f25a` FOREIGN KEY (`travel_expence_type_id`) REFERENCES `travel_expence_types` (`id`),
  CONSTRAINT `fk_rails_dca2001299` FOREIGN KEY (`currency_master_id`) REFERENCES `currency_masters` (`id`),
  CONSTRAINT `fk_rails_eb389e826f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_bill_details`
--

LOCK TABLES `daily_bill_details` WRITE;
/*!40000 ALTER TABLE `daily_bill_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dearness_allowances`
--

DROP TABLE IF EXISTS `dearness_allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dearness_allowances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimum_wages` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dearness_allowances`
--

LOCK TABLES `dearness_allowances` WRITE;
/*!40000 ALTER TABLE `dearness_allowances` DISABLE KEYS */;
/*!40000 ALTER TABLE `dearness_allowances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `definitions`
--

DROP TABLE IF EXISTS `definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `definitions`
--

LOCK TABLES `definitions` WRITE;
/*!40000 ALTER TABLE `definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_1s`
--

DROP TABLE IF EXISTS `degree_1s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_1s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_1s`
--

LOCK TABLES `degree_1s` WRITE;
/*!40000 ALTER TABLE `degree_1s` DISABLE KEYS */;
/*!40000 ALTER TABLE `degree_1s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_2s`
--

DROP TABLE IF EXISTS `degree_2s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_2s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_2s`
--

LOCK TABLES `degree_2s` WRITE;
/*!40000 ALTER TABLE `degree_2s` DISABLE KEYS */;
/*!40000 ALTER TABLE `degree_2s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_streams`
--

DROP TABLE IF EXISTS `degree_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_streams`
--

LOCK TABLES `degree_streams` WRITE;
/*!40000 ALTER TABLE `degree_streams` DISABLE KEYS */;
INSERT INTO `degree_streams` VALUES (1,'1.0','Aerospace',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(2,'2.0','Archaeology',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(3,'3.0','Asian language and culture',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(4,'4.0','Automotive',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(5,'5.0','Chemical',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(6,'6.0','Civil',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(7,'7.0','Commerce',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(8,'8.0','Computer Application',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(9,'9.0','Computer Architecture',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(10,'10.0','Computer Sicence ',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(11,'11.0','Creative Writing',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(12,'12.0','Electrical',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(13,'13.0','Electrical & Electronics',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(14,'14.0','Human Resource',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(15,'15.0','Informaton Technology',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(16,'16.0','Marine',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(17,'17.0','Mathematics',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(18,'18.0','Mechanical',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(19,'19.0','Philosophy',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(20,'20.0','Psychology',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(21,'21.0','Robotics',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54'),(22,'22.0','Saftey',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(23,'23.0','Science',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(24,'24.0','Textile',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(25,'25.0','Theater:Design & Production',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55');
/*!40000 ALTER TABLE `degree_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_types`
--

DROP TABLE IF EXISTS `degree_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_types`
--

LOCK TABLES `degree_types` WRITE;
/*!40000 ALTER TABLE `degree_types` DISABLE KEYS */;
INSERT INTO `degree_types` VALUES (1,'1.0','Primary School',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(2,'2.0','Middle School',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(3,'3.0','High School',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(4,'4.0','Senior Secondary',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(5,'5.0','Diploma',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(6,'6.0','Under Graduate',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(7,'7.0','Graduate',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(8,'8.0','Under Post Graduate',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(9,'9.0','Post Graduation',NULL,NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(10,'10.0','Professional',NULL,NULL,'2017-05-11 13:50:54','2017-05-11 13:50:54');
/*!40000 ALTER TABLE `degree_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degrees`
--

DROP TABLE IF EXISTS `degrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` VALUES (1,'1.0','BCA','Bachelor of Computer Application',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(2,'2.0','BBA','Bachelor of Business Administration',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(3,'3.0','B.Com','Bachelor of Commerce',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(4,'4.0','B.Sc','Bachelor of Science',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(5,'5.0','BA','Bachelor  of Arts',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(6,'6.0','BE','Bachelor of Engineering',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(7,'7.0','B.Tech','Bachelor of Technology',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(8,'8.0','DCA','Diploma in Computer Application',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(9,'9.0','ITI','Industial Training Institute',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(10,'10.0','BSW','Bachelor  of Sociel Work',NULL,'2017-05-11 13:50:51','2017-05-11 13:50:51'),(11,'11.0','Polytechnic','Polytechnic',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(12,'12.0','LL.B','Bachelor of Laws',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(13,'13.0','BCM','Bachelor of computer management',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(14,'14.0','BFA','Bachelor  of Fine Arts',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(15,'15.0','BMS','Bachelor  of Management Studies',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(16,'16.0','BCS','Bachelor  of Computer Science',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(17,'17.0','BBM','Bachelor  of Business Management',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(18,'18.0','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(19,'19.0','BHM','Bachelor  of Hotel Managemnet',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(20,'20.0','B.Pharma','Bachachelor of Pharmacy',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(21,'21.0','BS','Bachachelor of Science',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(22,'22.0','CS','Compnay Secrectary',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(23,'23.0','CA','Chartered Accountant',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(24,'24.0','MBBS','Bachelor of Medicine and Bachelor of surgery',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(25,'25.0','MCA','Master of Computer Application',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(26,'26.0','MBA','Master of Business Administration',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(27,'27.0','M.Com','Master of Commerce',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(28,'28.0','M.Sc','Master of Science',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(29,'29.0','MA','Master of Arts',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(30,'30.0','ME','Master of Engineering',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(31,'31.0','M.Tech','Master of Technology',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(32,'32.0','PGDCA','Post Grduate Diploma in computer Application',NULL,'2017-05-11 13:50:52','2017-05-11 13:50:52'),(33,'33.0','MSW','Master of SocielWork',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(34,'34.0','LL.M','Master ofLaws',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(35,'35.0','MCM','Master of computer management',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(36,'36.0','MFA','Master of Fine Arts',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(37,'37.0','MMS','Master of Management Studies',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(38,'38.0','MCS','Matser of Computer Science',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(39,'39.0','MBM','Master in Business Management',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(40,'40.0','MJMC','Master of Journalism and Mass Communication',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(41,'41.0','MHM','Master in Hotel Management',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(42,'42.0','M.Pharma','Master of Pharmacy',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(43,'43.0','MS','Master of Science',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53'),(44,'44.0','MD','Medicinae Doctor',NULL,'2017-05-11 13:50:53','2017-05-11 13:50:53');
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_types`
--

DROP TABLE IF EXISTS `department_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_types`
--

LOCK TABLES `department_types` WRITE;
/*!40000 ALTER TABLE `department_types` DISABLE KEYS */;
INSERT INTO `department_types` VALUES (1,'1.0','Executive','Executive',NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(2,'2.0','Operation','Operation',NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(3,'3.0','Support','Support',NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47');
/*!40000 ALTER TABLE `department_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_location_id` int(11) DEFAULT NULL,
  `manual_department_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_type_id` int(11) DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_company_location_id` (`company_location_id`),
  KEY `index_departments_on_department_type_id` (`department_type_id`),
  CONSTRAINT `fk_rails_076d214b06` FOREIGN KEY (`department_type_id`) REFERENCES `department_types` (`id`),
  CONSTRAINT `fk_rails_561a2a353c` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'01','DEPT001','','Admin',3,'','2017-05-11 14:34:33','2017-05-11 14:34:33',NULL),(2,1,'02','DEPT002','','Analytics',2,'','2017-05-11 14:34:58','2017-05-11 14:34:58',NULL),(3,1,'03','DEPT003','','Business Development',2,'','2017-05-11 14:35:23','2017-05-11 14:35:23',NULL),(4,1,'04','DEPT004','','CEO\'s Office',1,'','2017-05-11 14:35:54','2017-05-11 14:35:54',NULL),(5,1,'05','DEPT005','','COE',1,'','2017-05-11 14:36:12','2017-05-11 14:36:12',NULL),(6,1,'06','DEPT006','','Designing & Editorial',1,'','2017-05-11 14:36:34','2017-05-11 14:36:34',NULL),(7,1,'07','DEPT007','','Finance',2,'','2017-05-11 14:36:55','2017-05-11 14:36:55',NULL),(8,1,'08','DEPT008','','Human Resources',1,'','2017-05-11 14:37:17','2017-05-11 14:37:17',NULL),(9,1,'09','DEPT009','','IT',1,'','2017-05-11 14:37:35','2017-05-11 14:37:35',NULL),(10,1,'10','DEPT010','','Management',1,'','2017-05-11 14:37:54','2017-05-11 14:37:54',NULL),(11,1,'11','DEPT011','','PLS',2,'','2017-05-11 14:38:24','2017-05-11 14:38:24',NULL),(12,1,'12','DEPT012','','Primary Research',1,'','2017-05-11 14:38:47','2017-05-11 14:38:47',NULL),(13,1,'13','DEPT013','','Research',1,'','2017-05-11 14:39:06','2017-05-11 14:39:06',NULL),(14,2,'14','DEPT014','','Research',1,'','2017-05-11 14:39:18','2017-05-11 14:39:18',NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_districts_on_state_id` (`state_id`),
  CONSTRAINT `fk_rails_61da3337c8` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,'Maru','Maru','2017-05-11 13:51:00','2017-05-11 13:51:00'),(2,1,'Port Blair','Port Blair','2017-05-11 13:51:00','2017-05-11 13:51:00'),(3,1,'Sawi','Sawi','2017-05-11 13:51:00','2017-05-11 13:51:00'),(4,2,'Akividu','Akividu','2017-05-11 13:51:00','2017-05-11 13:51:00'),(5,2,'Amalapuram','Amalapuram','2017-05-11 13:51:00','2017-05-11 13:51:00'),(6,2,'Anantapur','Anantapur','2017-05-11 13:51:00','2017-05-11 13:51:00'),(7,2,'Andra','Andra','2017-05-11 13:51:00','2017-05-11 13:51:00'),(8,2,'Avanigadda','Avanigadda','2017-05-11 13:51:00','2017-05-11 13:51:00'),(9,2,'Bapatla','Bapatla','2017-05-11 13:51:00','2017-05-11 13:51:00'),(10,2,'Bhimavaram','Bhimavaram','2017-05-11 13:51:00','2017-05-11 13:51:00'),(11,2,'Bobbili','Bobbili','2017-05-11 13:51:00','2017-05-11 13:51:00'),(12,2,'Chirala','Chirala','2017-05-11 13:51:00','2017-05-11 13:51:00'),(13,2,'Chittoor','Chittoor','2017-05-11 13:51:00','2017-05-11 13:51:00'),(14,2,'Cumbum','Cumbum','2017-05-11 13:51:00','2017-05-11 13:51:00'),(15,2,'Darsi','Darsi','2017-05-11 13:51:00','2017-05-11 13:51:00'),(16,2,'Dhone','Dhone','2017-05-11 13:51:00','2017-05-11 13:51:00'),(17,2,'Eluru','Eluru','2017-05-11 13:51:01','2017-05-11 13:51:01'),(18,2,'Gampalagudem','Gampalagudem','2017-05-11 13:51:01','2017-05-11 13:51:01'),(19,2,'Gannavaram','Gannavaram','2017-05-11 13:51:01','2017-05-11 13:51:01'),(20,2,'Gorantla','Gorantla','2017-05-11 13:51:01','2017-05-11 13:51:01'),(21,2,'Gudivada','Gudivada','2017-05-11 13:51:01','2017-05-11 13:51:01'),(22,2,'Guntur','Guntur','2017-05-11 13:51:01','2017-05-11 13:51:01'),(23,2,'Kadapa','Kadapa','2017-05-11 13:51:01','2017-05-11 13:51:01'),(24,2,'Kakinada','Kakinada','2017-05-11 13:51:01','2017-05-11 13:51:01'),(25,2,'Kanigiri','Kanigiri','2017-05-11 13:51:01','2017-05-11 13:51:01'),(26,2,'Kavali','Kavali','2017-05-11 13:51:01','2017-05-11 13:51:01'),(27,2,'Kovvur','Kovvur','2017-05-11 13:51:01','2017-05-11 13:51:01'),(28,2,'Kuppam','Kuppam','2017-05-11 13:51:01','2017-05-11 13:51:01'),(29,2,'Kurnool','Kurnool','2017-05-11 13:51:01','2017-05-11 13:51:01'),(30,2,'Machilipatnam','Machilipatnam','2017-05-11 13:51:01','2017-05-11 13:51:01'),(31,2,'Madanapalle','Madanapalle','2017-05-11 13:51:01','2017-05-11 13:51:01'),(32,2,'Mahal','Mahal','2017-05-11 13:51:01','2017-05-11 13:51:01'),(33,2,'Mandapeta','Mandapeta','2017-05-11 13:51:01','2017-05-11 13:51:01'),(34,2,'Mangalagiri','Mangalagiri','2017-05-11 13:51:01','2017-05-11 13:51:01'),(35,2,'Markapur','Markapur','2017-05-11 13:51:01','2017-05-11 13:51:01'),(36,2,'Medarametla','Medarametla','2017-05-11 13:51:01','2017-05-11 13:51:01'),(37,2,'Muddanuru','Muddanuru','2017-05-11 13:51:01','2017-05-11 13:51:01'),(38,2,'Nagari','Nagari','2017-05-11 13:51:02','2017-05-11 13:51:02'),(39,2,'Nandigama','Nandigama','2017-05-11 13:51:02','2017-05-11 13:51:02'),(40,2,'Nandyal','Nandyal','2017-05-11 13:51:02','2017-05-11 13:51:02'),(41,2,'Narasaraopet','Narasaraopet','2017-05-11 13:51:02','2017-05-11 13:51:02'),(42,2,'Nellore','Nellore','2017-05-11 13:51:02','2017-05-11 13:51:02'),(43,2,'Nuzvid','Nuzvid','2017-05-11 13:51:02','2017-05-11 13:51:02'),(44,2,'Ongole','Ongole','2017-05-11 13:51:02','2017-05-11 13:51:02'),(45,2,'Pakala','Pakala','2017-05-11 13:51:02','2017-05-11 13:51:02'),(46,2,'Peddapuram','Peddapuram','2017-05-11 13:51:02','2017-05-11 13:51:02'),(47,2,'Piduguralla','Piduguralla','2017-05-11 13:51:02','2017-05-11 13:51:02'),(48,2,'Pileru','Pileru','2017-05-11 13:51:02','2017-05-11 13:51:02'),(49,2,'Pithapuram','Pithapuram','2017-05-11 13:51:02','2017-05-11 13:51:02'),(50,2,'Proddatur','Proddatur','2017-05-11 13:51:02','2017-05-11 13:51:02'),(51,2,'Puttur','Puttur','2017-05-11 13:51:02','2017-05-11 13:51:02'),(52,2,'Rajahmundry','Rajahmundry','2017-05-11 13:51:02','2017-05-11 13:51:02'),(53,2,'Ramapuram','Ramapuram','2017-05-11 13:51:02','2017-05-11 13:51:02'),(54,2,'Ramavaram','Ramavaram','2017-05-11 13:51:02','2017-05-11 13:51:02'),(55,2,'Singarayakonda','Singarayakonda','2017-05-11 13:51:02','2017-05-11 13:51:02'),(56,2,'Srikakulam','Srikakulam','2017-05-11 13:51:02','2017-05-11 13:51:02'),(57,2,'Tadepallegudem','Tadepallegudem','2017-05-11 13:51:02','2017-05-11 13:51:02'),(58,2,'Tanuku','Tanuku','2017-05-11 13:51:02','2017-05-11 13:51:02'),(59,2,'Thenali','Thenali','2017-05-11 13:51:02','2017-05-11 13:51:02'),(60,2,'Tirumala','Tirumala','2017-05-11 13:51:02','2017-05-11 13:51:02'),(61,2,'Tirumala - Tirupati','Tirumala - Tirupati','2017-05-11 13:51:02','2017-05-11 13:51:02'),(62,2,'Vijayawada','Vijayawada','2017-05-11 13:51:02','2017-05-11 13:51:02'),(63,2,'Vinukonda','Vinukonda','2017-05-11 13:51:02','2017-05-11 13:51:02'),(64,2,'Visakhapatnam','Visakhapatnam','2017-05-11 13:51:02','2017-05-11 13:51:02'),(65,2,'Vizianagaram','Vizianagaram','2017-05-11 13:51:02','2017-05-11 13:51:02'),(66,2,'Yanam','Yanam','2017-05-11 13:51:03','2017-05-11 13:51:03'),(67,3,'Hong','Hong','2017-05-11 13:51:03','2017-05-11 13:51:03'),(68,3,'Itanagar','Itanagar','2017-05-11 13:51:03','2017-05-11 13:51:03'),(69,4,'Arunachal','Arunachal','2017-05-11 13:51:03','2017-05-11 13:51:03'),(70,4,'Barpeta','Barpeta','2017-05-11 13:51:03','2017-05-11 13:51:03'),(71,4,'Bhandari','Bhandari','2017-05-11 13:51:03','2017-05-11 13:51:03'),(72,4,'Dhubri','Dhubri','2017-05-11 13:51:03','2017-05-11 13:51:03'),(73,4,'Dibrugarh','Dibrugarh','2017-05-11 13:51:03','2017-05-11 13:51:03'),(74,4,'Golaghat','Golaghat','2017-05-11 13:51:03','2017-05-11 13:51:03'),(75,4,'Goshaingaon','Goshaingaon','2017-05-11 13:51:03','2017-05-11 13:51:03'),(76,4,'Guwahati','Guwahati','2017-05-11 13:51:03','2017-05-11 13:51:03'),(77,4,'Jorhat','Jorhat','2017-05-11 13:51:03','2017-05-11 13:51:03'),(78,4,'Karimganj','Karimganj','2017-05-11 13:51:03','2017-05-11 13:51:03'),(79,4,'Kokrajhar','Kokrajhar','2017-05-11 13:51:03','2017-05-11 13:51:03'),(80,4,'Lala','Lala','2017-05-11 13:51:03','2017-05-11 13:51:03'),(81,4,'Nalbari','Nalbari','2017-05-11 13:51:03','2017-05-11 13:51:03'),(82,4,'Namrup','Namrup','2017-05-11 13:51:03','2017-05-11 13:51:03'),(83,4,'Nazira','Nazira','2017-05-11 13:51:03','2017-05-11 13:51:03'),(84,4,'North Lakhimpur','North Lakhimpur','2017-05-11 13:51:03','2017-05-11 13:51:03'),(85,4,'Powai','Powai','2017-05-11 13:51:03','2017-05-11 13:51:03'),(86,4,'Sibsagar','Sibsagar','2017-05-11 13:51:03','2017-05-11 13:51:03'),(87,4,'Silchar','Silchar','2017-05-11 13:51:04','2017-05-11 13:51:04'),(88,4,'Tezpur','Tezpur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(89,4,'Tinsukia','Tinsukia','2017-05-11 13:51:04','2017-05-11 13:51:04'),(90,4,'Ulubari','Ulubari','2017-05-11 13:51:04','2017-05-11 13:51:04'),(91,5,'Banka','Banka','2017-05-11 13:51:04','2017-05-11 13:51:04'),(92,5,'Begusarai','Begusarai','2017-05-11 13:51:04','2017-05-11 13:51:04'),(93,5,'Bhagalpur','Bhagalpur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(94,5,'Bhawanipur','Bhawanipur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(95,5,'Bihar Sharif','Bihar Sharif','2017-05-11 13:51:04','2017-05-11 13:51:04'),(96,5,'Chandan','Chandan','2017-05-11 13:51:04','2017-05-11 13:51:04'),(97,5,'Darbhanga','Darbhanga','2017-05-11 13:51:04','2017-05-11 13:51:04'),(98,5,'Dhaka','Dhaka','2017-05-11 13:51:04','2017-05-11 13:51:04'),(99,5,'Gaya','Gaya','2017-05-11 13:51:04','2017-05-11 13:51:04'),(100,5,'Jaynagar','Jaynagar','2017-05-11 13:51:04','2017-05-11 13:51:04'),(101,5,'Jha Jha','Jha Jha','2017-05-11 13:51:04','2017-05-11 13:51:04'),(102,5,'Kamat','Kamat','2017-05-11 13:51:04','2017-05-11 13:51:04'),(103,5,'Motihari','Motihari','2017-05-11 13:51:04','2017-05-11 13:51:04'),(104,5,'Munger','Munger','2017-05-11 13:51:04','2017-05-11 13:51:04'),(105,5,'Muzaffarpur','Muzaffarpur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(106,5,'Patna','Patna','2017-05-11 13:51:04','2017-05-11 13:51:04'),(107,5,'Purnea','Purnea','2017-05-11 13:51:04','2017-05-11 13:51:04'),(108,5,'Pusa','Pusa','2017-05-11 13:51:04','2017-05-11 13:51:04'),(109,5,'Raxaul','Raxaul','2017-05-11 13:51:04','2017-05-11 13:51:04'),(110,5,'Sakri','Sakri','2017-05-11 13:51:04','2017-05-11 13:51:04'),(111,5,'Samastipur','Samastipur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(112,6,'Chandigarh','Chandigarh','2017-05-11 13:51:04','2017-05-11 13:51:04'),(113,7,'Ambikapur','Ambikapur','2017-05-11 13:51:04','2017-05-11 13:51:04'),(114,7,'Bemetara','Bemetara','2017-05-11 13:51:05','2017-05-11 13:51:05'),(115,7,'Bhatapara','Bhatapara','2017-05-11 13:51:05','2017-05-11 13:51:05'),(116,7,'Bhilai','Bhilai','2017-05-11 13:51:05','2017-05-11 13:51:05'),(117,7,'Bilaspur','Bilaspur','2017-05-11 13:51:05','2017-05-11 13:51:05'),(118,7,'Champa','Champa','2017-05-11 13:51:05','2017-05-11 13:51:05'),(119,7,'Dhamtari','Dhamtari','2017-05-11 13:51:05','2017-05-11 13:51:05'),(120,7,'Durg','Durg','2017-05-11 13:51:05','2017-05-11 13:51:05'),(121,7,'Jagdalpur','Jagdalpur','2017-05-11 13:51:05','2017-05-11 13:51:05'),(122,7,'Janjgir','Janjgir','2017-05-11 13:51:05','2017-05-11 13:51:05'),(123,7,'Koni','Koni','2017-05-11 13:51:05','2017-05-11 13:51:05'),(124,7,'Korba','Korba','2017-05-11 13:51:05','2017-05-11 13:51:05'),(125,7,'Kumhari','Kumhari','2017-05-11 13:51:05','2017-05-11 13:51:05'),(126,7,'Lanka','Lanka','2017-05-11 13:51:05','2017-05-11 13:51:05'),(127,7,'Mohala','Mohala','2017-05-11 13:51:05','2017-05-11 13:51:05'),(128,7,'Raigarh','Raigarh','2017-05-11 13:51:05','2017-05-11 13:51:05'),(129,7,'Raipur','Raipur','2017-05-11 13:51:05','2017-05-11 13:51:05'),(130,7,'Sukma','Sukma','2017-05-11 13:51:05','2017-05-11 13:51:05'),(131,8,'Daman','Daman','2017-05-11 13:51:05','2017-05-11 13:51:05'),(132,9,'Alipur','Alipur','2017-05-11 13:51:05','2017-05-11 13:51:05'),(133,9,'Bawana','Bawana','2017-05-11 13:51:05','2017-05-11 13:51:05'),(134,9,'Connaught Place','Connaught Place','2017-05-11 13:51:05','2017-05-11 13:51:05'),(135,9,'Delhi','Delhi','2017-05-11 13:51:05','2017-05-11 13:51:05'),(136,9,'Kalkaji Devi','Kalkaji Devi','2017-05-11 13:51:05','2017-05-11 13:51:05'),(137,9,'Narela','Narela','2017-05-11 13:51:05','2017-05-11 13:51:05'),(138,9,'New Delhi','New Delhi','2017-05-11 13:51:06','2017-05-11 13:51:06'),(139,9,'Shahdara','Shahdara','2017-05-11 13:51:06','2017-05-11 13:51:06'),(140,10,'Amal','Amal','2017-05-11 13:51:06','2017-05-11 13:51:06'),(141,10,'Silvassa','Silvassa','2017-05-11 13:51:06','2017-05-11 13:51:06'),(142,11,'Aldona','Aldona','2017-05-11 13:51:06','2017-05-11 13:51:06'),(143,11,'Arpora','Arpora','2017-05-11 13:51:06','2017-05-11 13:51:06'),(144,11,'Assagao','Assagao','2017-05-11 13:51:06','2017-05-11 13:51:06'),(145,11,'Bambolim','Bambolim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(146,11,'Betalbatim','Betalbatim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(147,11,'Betim','Betim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(148,11,'Calangute','Calangute','2017-05-11 13:51:06','2017-05-11 13:51:06'),(149,11,'Candolim','Candolim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(150,11,'Caranzalem','Caranzalem','2017-05-11 13:51:06','2017-05-11 13:51:06'),(151,11,'Chicalim','Chicalim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(152,11,'Cuncolim','Cuncolim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(153,11,'Curchorem','Curchorem','2017-05-11 13:51:06','2017-05-11 13:51:06'),(154,11,'Dicholi','Dicholi','2017-05-11 13:51:06','2017-05-11 13:51:06'),(155,11,'Dona Paula','Dona Paula','2017-05-11 13:51:06','2017-05-11 13:51:06'),(156,11,'Goa','Goa','2017-05-11 13:51:06','2017-05-11 13:51:06'),(157,11,'Madgaon','Madgaon','2017-05-11 13:51:06','2017-05-11 13:51:06'),(158,11,'Marmagao','Marmagao','2017-05-11 13:51:06','2017-05-11 13:51:06'),(159,11,'Navelim','Navelim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(160,11,'Panjim','Panjim','2017-05-11 13:51:06','2017-05-11 13:51:06'),(161,11,'Parra','Parra','2017-05-11 13:51:06','2017-05-11 13:51:06'),(162,11,'Ponda','Ponda','2017-05-11 13:51:06','2017-05-11 13:51:06'),(163,11,'Quepem','Quepem','2017-05-11 13:51:06','2017-05-11 13:51:06'),(164,11,'Saligao','Saligao','2017-05-11 13:51:07','2017-05-11 13:51:07'),(165,11,'Sanquelim','Sanquelim','2017-05-11 13:51:07','2017-05-11 13:51:07'),(166,11,'Solim','Solim','2017-05-11 13:51:07','2017-05-11 13:51:07'),(167,11,'Vainguinim','Vainguinim','2017-05-11 13:51:07','2017-05-11 13:51:07'),(168,11,'Vasco','Vasco','2017-05-11 13:51:07','2017-05-11 13:51:07'),(169,11,'Verna','Verna','2017-05-11 13:51:07','2017-05-11 13:51:07'),(170,12,'Ahmedabad','Ahmedabad','2017-05-11 13:51:07','2017-05-11 13:51:07'),(171,12,'Amreli','Amreli','2017-05-11 13:51:07','2017-05-11 13:51:07'),(172,12,'Amroli','Amroli','2017-05-11 13:51:07','2017-05-11 13:51:07'),(173,12,'Anand','Anand','2017-05-11 13:51:07','2017-05-11 13:51:07'),(174,12,'Ankleshwar','Ankleshwar','2017-05-11 13:51:07','2017-05-11 13:51:07'),(175,12,'Antapur','Antapur','2017-05-11 13:51:07','2017-05-11 13:51:07'),(176,12,'Bardoli','Bardoli','2017-05-11 13:51:07','2017-05-11 13:51:07'),(177,12,'Basu','Basu','2017-05-11 13:51:07','2017-05-11 13:51:07'),(178,12,'Bhadath','Bhadath','2017-05-11 13:51:07','2017-05-11 13:51:07'),(179,12,'Bharuch','Bharuch','2017-05-11 13:51:07','2017-05-11 13:51:07'),(180,12,'Bhavnagar','Bhavnagar','2017-05-11 13:51:07','2017-05-11 13:51:07'),(181,12,'Bhuj','Bhuj','2017-05-11 13:51:07','2017-05-11 13:51:07'),(182,12,'Bilimora','Bilimora','2017-05-11 13:51:07','2017-05-11 13:51:07'),(183,12,'Chhota Udepur','Chhota Udepur','2017-05-11 13:51:07','2017-05-11 13:51:07'),(184,12,'Dahod','Dahod','2017-05-11 13:51:07','2017-05-11 13:51:07'),(185,12,'Dewan','Dewan','2017-05-11 13:51:07','2017-05-11 13:51:07'),(186,12,'Dhansura','Dhansura','2017-05-11 13:51:07','2017-05-11 13:51:07'),(187,12,'Dhrol','Dhrol','2017-05-11 13:51:07','2017-05-11 13:51:07'),(188,12,'Dwarka','Dwarka','2017-05-11 13:51:07','2017-05-11 13:51:07'),(189,12,'Gandhidham','Gandhidham','2017-05-11 13:51:08','2017-05-11 13:51:08'),(190,12,'Gandhinagar','Gandhinagar','2017-05-11 13:51:08','2017-05-11 13:51:08'),(191,12,'Ghana','Ghana','2017-05-11 13:51:08','2017-05-11 13:51:08'),(192,12,'Godhra','Godhra','2017-05-11 13:51:08','2017-05-11 13:51:08'),(193,12,'Himatnagar','Himatnagar','2017-05-11 13:51:08','2017-05-11 13:51:08'),(194,12,'Jalalpur','Jalalpur','2017-05-11 13:51:08','2017-05-11 13:51:08'),(195,12,'Jamnagar','Jamnagar','2017-05-11 13:51:08','2017-05-11 13:51:08'),(196,12,'Junagadh','Junagadh','2017-05-11 13:51:08','2017-05-11 13:51:08'),(197,12,'Kalol','Kalol','2017-05-11 13:51:08','2017-05-11 13:51:08'),(198,12,'Karamsad','Karamsad','2017-05-11 13:51:09','2017-05-11 13:51:09'),(199,12,'Keshod','Keshod','2017-05-11 13:51:09','2017-05-11 13:51:09'),(200,12,'Khambhat','Khambhat','2017-05-11 13:51:09','2017-05-11 13:51:09'),(201,12,'Kheda','Kheda','2017-05-11 13:51:09','2017-05-11 13:51:09'),(202,12,'Khergam','Khergam','2017-05-11 13:51:09','2017-05-11 13:51:09'),(203,12,'Kosamba','Kosamba','2017-05-11 13:51:09','2017-05-11 13:51:09'),(204,12,'Mahesana','Mahesana','2017-05-11 13:51:09','2017-05-11 13:51:09'),(205,12,'Malpur','Malpur','2017-05-11 13:51:09','2017-05-11 13:51:09'),(206,12,'Mandvi','Mandvi','2017-05-11 13:51:09','2017-05-11 13:51:09'),(207,12,'Matar','Matar','2017-05-11 13:51:09','2017-05-11 13:51:09'),(208,12,'Mithapur','Mithapur','2017-05-11 13:51:09','2017-05-11 13:51:09'),(209,12,'Modasa','Modasa','2017-05-11 13:51:09','2017-05-11 13:51:09'),(210,12,'Morvi','Morvi','2017-05-11 13:51:09','2017-05-11 13:51:09'),(211,12,'Mundra','Mundra','2017-05-11 13:51:09','2017-05-11 13:51:09'),(212,12,'Nadiad','Nadiad','2017-05-11 13:51:09','2017-05-11 13:51:09'),(213,12,'Nagwa','Nagwa','2017-05-11 13:51:09','2017-05-11 13:51:09'),(214,12,'Navsari','Navsari','2017-05-11 13:51:09','2017-05-11 13:51:09'),(215,12,'Patan','Patan','2017-05-11 13:51:09','2017-05-11 13:51:09'),(216,12,'Petlad','Petlad','2017-05-11 13:51:09','2017-05-11 13:51:09'),(217,12,'Porbandar','Porbandar','2017-05-11 13:51:09','2017-05-11 13:51:09'),(218,12,'Rajkot','Rajkot','2017-05-11 13:51:09','2017-05-11 13:51:09'),(219,12,'Rander','Rander','2017-05-11 13:51:09','2017-05-11 13:51:09'),(220,12,'Rawal','Rawal','2017-05-11 13:51:09','2017-05-11 13:51:09'),(221,12,'Sachin','Sachin','2017-05-11 13:51:09','2017-05-11 13:51:09'),(222,12,'Sami','Sami','2017-05-11 13:51:10','2017-05-11 13:51:10'),(223,12,'Sanand','Sanand','2017-05-11 13:51:10','2017-05-11 13:51:10'),(224,12,'Somnath','Somnath','2017-05-11 13:51:10','2017-05-11 13:51:10'),(225,12,'Surendranagar','Surendranagar','2017-05-11 13:51:10','2017-05-11 13:51:10'),(226,12,'Thasra','Thasra','2017-05-11 13:51:10','2017-05-11 13:51:10'),(227,12,'Vadodara','Vadodara','2017-05-11 13:51:10','2017-05-11 13:51:10'),(228,12,'Vadodra','Vadodra','2017-05-11 13:51:10','2017-05-11 13:51:10'),(229,12,'Valsad','Valsad','2017-05-11 13:51:10','2017-05-11 13:51:10'),(230,12,'Vapi','Vapi','2017-05-11 13:51:10','2017-05-11 13:51:10'),(231,12,'Vijapur','Vijapur','2017-05-11 13:51:10','2017-05-11 13:51:10'),(232,12,'Visnagar','Visnagar','2017-05-11 13:51:10','2017-05-11 13:51:10'),(233,13,'Bhawan','Bhawan','2017-05-11 13:51:10','2017-05-11 13:51:10'),(234,13,'Bilaspur','Bilaspur','2017-05-11 13:51:10','2017-05-11 13:51:10'),(235,13,'Chamba','Chamba','2017-05-11 13:51:10','2017-05-11 13:51:10'),(236,13,'Dharamsala','Dharamsala','2017-05-11 13:51:10','2017-05-11 13:51:10'),(237,13,'Dharmpur','Dharmpur','2017-05-11 13:51:10','2017-05-11 13:51:10'),(238,13,'Hamirpur','Hamirpur','2017-05-11 13:51:10','2017-05-11 13:51:10'),(239,13,'Hari','Hari','2017-05-11 13:51:10','2017-05-11 13:51:10'),(240,13,'Kalka','Kalka','2017-05-11 13:51:10','2017-05-11 13:51:10'),(241,13,'Kangra','Kangra','2017-05-11 13:51:10','2017-05-11 13:51:10'),(242,13,'Kumar','Kumar','2017-05-11 13:51:10','2017-05-11 13:51:10'),(243,13,'Manali','Manali','2017-05-11 13:51:10','2017-05-11 13:51:10'),(244,13,'Mandi','Mandi','2017-05-11 13:51:11','2017-05-11 13:51:11'),(245,13,'Mani','Mani','2017-05-11 13:51:11','2017-05-11 13:51:11'),(246,13,'Mashobra','Mashobra','2017-05-11 13:51:11','2017-05-11 13:51:11'),(247,13,'Nalagarh','Nalagarh','2017-05-11 13:51:11','2017-05-11 13:51:11'),(248,13,'Nehra','Nehra','2017-05-11 13:51:11','2017-05-11 13:51:11'),(249,13,'Nurpur','Nurpur','2017-05-11 13:51:11','2017-05-11 13:51:11'),(250,13,'Palampur','Palampur','2017-05-11 13:51:11','2017-05-11 13:51:11'),(251,13,'Paonta Sahib','Paonta Sahib','2017-05-11 13:51:11','2017-05-11 13:51:11'),(252,13,'Shimla','Shimla','2017-05-11 13:51:11','2017-05-11 13:51:11'),(253,13,'Solan','Solan','2017-05-11 13:51:11','2017-05-11 13:51:11'),(254,14,'Ambala','Ambala','2017-05-11 13:51:11','2017-05-11 13:51:11'),(255,14,'Aurangabad','Aurangabad','2017-05-11 13:51:11','2017-05-11 13:51:11'),(256,14,'Bahadurgarh','Bahadurgarh','2017-05-11 13:51:11','2017-05-11 13:51:11'),(257,14,'Ballabgarh','Ballabgarh','2017-05-11 13:51:11','2017-05-11 13:51:11'),(258,14,'Bhiwani','Bhiwani','2017-05-11 13:51:11','2017-05-11 13:51:11'),(259,14,'Budha','Budha','2017-05-11 13:51:11','2017-05-11 13:51:11'),(260,14,'Chhachhrauli','Chhachhrauli','2017-05-11 13:51:11','2017-05-11 13:51:11'),(261,14,'Faridabad','Faridabad','2017-05-11 13:51:11','2017-05-11 13:51:11'),(262,14,'Fatehabad','Fatehabad','2017-05-11 13:51:11','2017-05-11 13:51:11'),(263,14,'Ganga','Ganga','2017-05-11 13:51:11','2017-05-11 13:51:11'),(264,14,'Gohana','Gohana','2017-05-11 13:51:11','2017-05-11 13:51:11'),(265,14,'Gurgaon','Gurgaon','2017-05-11 13:51:11','2017-05-11 13:51:11'),(266,14,'Hansi','Hansi','2017-05-11 13:51:11','2017-05-11 13:51:11'),(267,14,'Haryana','Haryana','2017-05-11 13:51:11','2017-05-11 13:51:11'),(268,14,'Hisar','Hisar','2017-05-11 13:51:12','2017-05-11 13:51:12'),(269,14,'Indraprast','Indraprast','2017-05-11 13:51:12','2017-05-11 13:51:12'),(270,14,'Jhajjar','Jhajjar','2017-05-11 13:51:12','2017-05-11 13:51:12'),(271,14,'Jind','Jind','2017-05-11 13:51:12','2017-05-11 13:51:12'),(272,14,'Kaithal','Kaithal','2017-05-11 13:51:12','2017-05-11 13:51:12'),(273,14,'Kalra','Kalra','2017-05-11 13:51:12','2017-05-11 13:51:12'),(274,14,'Karnal','Karnal','2017-05-11 13:51:12','2017-05-11 13:51:12'),(275,14,'Kaul','Kaul','2017-05-11 13:51:12','2017-05-11 13:51:12'),(276,14,'Kotian','Kotian','2017-05-11 13:51:12','2017-05-11 13:51:12'),(277,14,'Ladwa','Ladwa','2017-05-11 13:51:12','2017-05-11 13:51:12'),(278,14,'Narnaul','Narnaul','2017-05-11 13:51:12','2017-05-11 13:51:12'),(279,14,'Nilokheri','Nilokheri','2017-05-11 13:51:12','2017-05-11 13:51:12'),(280,14,'Odhan','Odhan','2017-05-11 13:51:12','2017-05-11 13:51:12'),(281,14,'Palwal','Palwal','2017-05-11 13:51:12','2017-05-11 13:51:12'),(282,14,'Panipat','Panipat','2017-05-11 13:51:12','2017-05-11 13:51:12'),(283,14,'Pehowa','Pehowa','2017-05-11 13:51:12','2017-05-11 13:51:12'),(284,14,'Rewari','Rewari','2017-05-11 13:51:12','2017-05-11 13:51:12'),(285,14,'Rohtak','Rohtak','2017-05-11 13:51:12','2017-05-11 13:51:12'),(286,14,'Saha','Saha','2017-05-11 13:51:12','2017-05-11 13:51:12'),(287,14,'Shahabad','Shahabad','2017-05-11 13:51:12','2017-05-11 13:51:12'),(288,14,'Sirsa','Sirsa','2017-05-11 13:51:12','2017-05-11 13:51:12'),(289,14,'Sodhi','Sodhi','2017-05-11 13:51:12','2017-05-11 13:51:12'),(290,14,'Sonipat','Sonipat','2017-05-11 13:51:13','2017-05-11 13:51:13'),(291,14,'Tohana','Tohana','2017-05-11 13:51:13','2017-05-11 13:51:13'),(292,14,'Yamunanagar','Yamunanagar','2017-05-11 13:51:13','2017-05-11 13:51:13'),(293,15,'Bokaro','Bokaro','2017-05-11 13:51:13','2017-05-11 13:51:13'),(294,15,'Dhanbad','Dhanbad','2017-05-11 13:51:13','2017-05-11 13:51:13'),(295,15,'Dumka','Dumka','2017-05-11 13:51:13','2017-05-11 13:51:13'),(296,15,'Hazaribagh','Hazaribagh','2017-05-11 13:51:13','2017-05-11 13:51:13'),(297,15,'Jamshedpur','Jamshedpur','2017-05-11 13:51:13','2017-05-11 13:51:13'),(298,15,'Mahulia','Mahulia','2017-05-11 13:51:13','2017-05-11 13:51:13'),(299,15,'Ramgarh','Ramgarh','2017-05-11 13:51:13','2017-05-11 13:51:13'),(300,15,'Ranchi','Ranchi','2017-05-11 13:51:13','2017-05-11 13:51:13'),(301,16,'Anantnag','Anantnag','2017-05-11 13:51:13','2017-05-11 13:51:13'),(302,16,'Arch','Arch','2017-05-11 13:51:13','2017-05-11 13:51:13'),(303,16,'Bala','Bala','2017-05-11 13:51:13','2017-05-11 13:51:13'),(304,16,'Bawan','Bawan','2017-05-11 13:51:13','2017-05-11 13:51:13'),(305,16,'Gold','Gold','2017-05-11 13:51:13','2017-05-11 13:51:13'),(306,16,'Jammu','Jammu','2017-05-11 13:51:13','2017-05-11 13:51:13'),(307,16,'Kargil','Kargil','2017-05-11 13:51:13','2017-05-11 13:51:13'),(308,16,'Kathua','Kathua','2017-05-11 13:51:13','2017-05-11 13:51:13'),(309,16,'Katra','Katra','2017-05-11 13:51:13','2017-05-11 13:51:13'),(310,16,'Kundan','Kundan','2017-05-11 13:51:13','2017-05-11 13:51:13'),(311,16,'Markal','Markal','2017-05-11 13:51:14','2017-05-11 13:51:14'),(312,16,'Nila','Nila','2017-05-11 13:51:14','2017-05-11 13:51:14'),(313,16,'Pahalgam','Pahalgam','2017-05-11 13:51:14','2017-05-11 13:51:14'),(314,16,'Patel','Patel','2017-05-11 13:51:14','2017-05-11 13:51:14'),(315,16,'Raju','Raju','2017-05-11 13:51:14','2017-05-11 13:51:14'),(316,16,'Ranjan','Ranjan','2017-05-11 13:51:14','2017-05-11 13:51:14'),(317,16,'Ring','Ring','2017-05-11 13:51:14','2017-05-11 13:51:14'),(318,16,'Srinagar','Srinagar','2017-05-11 13:51:14','2017-05-11 13:51:14'),(319,16,'Suman','Suman','2017-05-11 13:51:14','2017-05-11 13:51:14'),(320,17,'Bagalkot','Bagalkot','2017-05-11 13:51:14','2017-05-11 13:51:14'),(321,17,'Bangalore','Bangalore','2017-05-11 13:51:14','2017-05-11 13:51:14'),(322,17,'Belgaum','Belgaum','2017-05-11 13:51:14','2017-05-11 13:51:14'),(323,17,'Bellare','Bellare','2017-05-11 13:51:14','2017-05-11 13:51:14'),(324,17,'Bellary','Bellary','2017-05-11 13:51:14','2017-05-11 13:51:14'),(325,17,'Bhadravati','Bhadravati','2017-05-11 13:51:14','2017-05-11 13:51:14'),(326,17,'Bhatkal','Bhatkal','2017-05-11 13:51:14','2017-05-11 13:51:14'),(327,17,'Bidar','Bidar','2017-05-11 13:51:14','2017-05-11 13:51:14'),(328,17,'Bijapur','Bijapur','2017-05-11 13:51:14','2017-05-11 13:51:14'),(329,17,'Channapatna','Channapatna','2017-05-11 13:51:14','2017-05-11 13:51:14'),(330,17,'Chikmagalūr','Chikmagalūr','2017-05-11 13:51:14','2017-05-11 13:51:14'),(331,17,'Chikodi','Chikodi','2017-05-11 13:51:14','2017-05-11 13:51:14'),(332,17,'Chintamani','Chintamani','2017-05-11 13:51:14','2017-05-11 13:51:14'),(333,17,'Chitradurga','Chitradurga','2017-05-11 13:51:14','2017-05-11 13:51:14'),(334,17,'Davangere','Davangere','2017-05-11 13:51:14','2017-05-11 13:51:14'),(335,17,'Dharwad','Dharwad','2017-05-11 13:51:14','2017-05-11 13:51:14'),(336,17,'Gadag','Gadag','2017-05-11 13:51:15','2017-05-11 13:51:15'),(337,17,'Gulbarga','Gulbarga','2017-05-11 13:51:15','2017-05-11 13:51:15'),(338,17,'Hadadi','Hadadi','2017-05-11 13:51:15','2017-05-11 13:51:15'),(339,17,'Hassan','Hassan','2017-05-11 13:51:15','2017-05-11 13:51:15'),(340,17,'Haveri','Haveri','2017-05-11 13:51:15','2017-05-11 13:51:15'),(341,17,'Hira','Hira','2017-05-11 13:51:15','2017-05-11 13:51:15'),(342,17,'Hiriyur','Hiriyur','2017-05-11 13:51:15','2017-05-11 13:51:15'),(343,17,'Honavar','Honavar','2017-05-11 13:51:15','2017-05-11 13:51:15'),(344,17,'Hospet','Hospet','2017-05-11 13:51:15','2017-05-11 13:51:15'),(345,17,'Hubli','Hubli','2017-05-11 13:51:15','2017-05-11 13:51:15'),(346,17,'Karwar','Karwar','2017-05-11 13:51:15','2017-05-11 13:51:15'),(347,17,'Kolar','Kolar','2017-05-11 13:51:15','2017-05-11 13:51:15'),(348,17,'Kollegal','Kollegal','2017-05-11 13:51:15','2017-05-11 13:51:15'),(349,17,'Koppal','Koppal','2017-05-11 13:51:15','2017-05-11 13:51:15'),(350,17,'Kushalnagar','Kushalnagar','2017-05-11 13:51:15','2017-05-11 13:51:15'),(351,17,'Madikeri','Madikeri','2017-05-11 13:51:15','2017-05-11 13:51:15'),(352,17,'Mandya','Mandya','2017-05-11 13:51:15','2017-05-11 13:51:15'),(353,17,'Mangalore','Mangalore','2017-05-11 13:51:15','2017-05-11 13:51:15'),(354,17,'Manipala','Manipala','2017-05-11 13:51:15','2017-05-11 13:51:15'),(355,17,'Mundgod','Mundgod','2017-05-11 13:51:15','2017-05-11 13:51:15'),(356,17,'Mysore','Mysore','2017-05-11 13:51:15','2017-05-11 13:51:15'),(357,17,'Nandi','Nandi','2017-05-11 13:51:15','2017-05-11 13:51:15'),(358,17,'Puttur','Puttur','2017-05-11 13:51:15','2017-05-11 13:51:15'),(359,17,'Raichur','Raichur','2017-05-11 13:51:16','2017-05-11 13:51:16'),(360,17,'Ramanagaram','Ramanagaram','2017-05-11 13:51:16','2017-05-11 13:51:16'),(361,17,'Sagar','Sagar','2017-05-11 13:51:16','2017-05-11 13:51:16'),(362,17,'Sandur','Sandur','2017-05-11 13:51:16','2017-05-11 13:51:16'),(363,17,'Sangam','Sangam','2017-05-11 13:51:16','2017-05-11 13:51:16'),(364,17,'Shanti Grama','Shanti Grama','2017-05-11 13:51:16','2017-05-11 13:51:16'),(365,17,'Shimoga','Shimoga','2017-05-11 13:51:16','2017-05-11 13:51:16'),(366,17,'Sirsi','Sirsi','2017-05-11 13:51:16','2017-05-11 13:51:16'),(367,17,'Siruguppa','Siruguppa','2017-05-11 13:51:16','2017-05-11 13:51:16'),(368,17,'Someshwar','Someshwar','2017-05-11 13:51:16','2017-05-11 13:51:16'),(369,17,'Tiptur','Tiptur','2017-05-11 13:51:16','2017-05-11 13:51:16'),(370,17,'Tumkūr','Tumkūr','2017-05-11 13:51:16','2017-05-11 13:51:16'),(371,17,'Udupi','Udupi','2017-05-11 13:51:16','2017-05-11 13:51:16'),(372,17,'Yadgir','Yadgir','2017-05-11 13:51:16','2017-05-11 13:51:16'),(373,18,'Alanallur','Alanallur','2017-05-11 13:51:17','2017-05-11 13:51:17'),(374,18,'Alappuzha','Alappuzha','2017-05-11 13:51:17','2017-05-11 13:51:17'),(375,18,'Aluva','Aluva','2017-05-11 13:51:17','2017-05-11 13:51:17'),(376,18,'Anchal','Anchal','2017-05-11 13:51:17','2017-05-11 13:51:17'),(377,18,'Angadipuram','Angadipuram','2017-05-11 13:51:17','2017-05-11 13:51:17'),(378,18,'Aranmula','Aranmula','2017-05-11 13:51:17','2017-05-11 13:51:17'),(379,18,'Attingal','Attingal','2017-05-11 13:51:17','2017-05-11 13:51:17'),(380,18,'Changanacheri','Changanacheri','2017-05-11 13:51:17','2017-05-11 13:51:17'),(381,18,'Chengannur','Chengannur','2017-05-11 13:51:17','2017-05-11 13:51:17'),(382,18,'Chittur','Chittur','2017-05-11 13:51:17','2017-05-11 13:51:17'),(383,18,'Edavanna','Edavanna','2017-05-11 13:51:18','2017-05-11 13:51:18'),(384,18,'Ernakulam','Ernakulam','2017-05-11 13:51:18','2017-05-11 13:51:18'),(385,18,'Guruvayur','Guruvayur','2017-05-11 13:51:18','2017-05-11 13:51:18'),(386,18,'Idukki','Idukki','2017-05-11 13:51:18','2017-05-11 13:51:18'),(387,18,'Irinjalakuda','Irinjalakuda','2017-05-11 13:51:18','2017-05-11 13:51:18'),(388,18,'Kaladi','Kaladi','2017-05-11 13:51:18','2017-05-11 13:51:18'),(389,18,'Kalpetta','Kalpetta','2017-05-11 13:51:18','2017-05-11 13:51:18'),(390,18,'Kanhangad','Kanhangad','2017-05-11 13:51:18','2017-05-11 13:51:18'),(391,18,'Kannur','Kannur','2017-05-11 13:51:18','2017-05-11 13:51:18'),(392,18,'Kasaragod','Kasaragod','2017-05-11 13:51:18','2017-05-11 13:51:18'),(393,18,'Kayamkulam','Kayamkulam','2017-05-11 13:51:18','2017-05-11 13:51:18'),(394,18,'Kochi','Kochi','2017-05-11 13:51:18','2017-05-11 13:51:18'),(395,18,'Kodungallur','Kodungallur','2017-05-11 13:51:18','2017-05-11 13:51:18'),(396,18,'Kollam','Kollam','2017-05-11 13:51:18','2017-05-11 13:51:18'),(397,18,'Koni','Koni','2017-05-11 13:51:18','2017-05-11 13:51:18'),(398,18,'Kottakkal','Kottakkal','2017-05-11 13:51:19','2017-05-11 13:51:19'),(399,18,'Kottarakara','Kottarakara','2017-05-11 13:51:19','2017-05-11 13:51:19'),(400,18,'Kottayam','Kottayam','2017-05-11 13:51:19','2017-05-11 13:51:19'),(401,18,'Kozhikode','Kozhikode','2017-05-11 13:51:19','2017-05-11 13:51:19'),(402,18,'Malappuram','Malappuram','2017-05-11 13:51:20','2017-05-11 13:51:20'),(403,18,'Manjeri','Manjeri','2017-05-11 13:51:20','2017-05-11 13:51:20'),(404,18,'Mattanur','Mattanur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(405,18,'Mavelikara','Mavelikara','2017-05-11 13:51:20','2017-05-11 13:51:20'),(406,18,'Nilambur','Nilambur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(407,18,'Ottappalam','Ottappalam','2017-05-11 13:51:20','2017-05-11 13:51:20'),(408,18,'Palakkad','Palakkad','2017-05-11 13:51:20','2017-05-11 13:51:20'),(409,18,'Palayam','Palayam','2017-05-11 13:51:20','2017-05-11 13:51:20'),(410,18,'Parappanangadi','Parappanangadi','2017-05-11 13:51:20','2017-05-11 13:51:20'),(411,18,'Paravur','Paravur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(412,18,'Pathanamthitta','Pathanamthitta','2017-05-11 13:51:20','2017-05-11 13:51:20'),(413,18,'Pattambi','Pattambi','2017-05-11 13:51:20','2017-05-11 13:51:20'),(414,18,'Payyanur','Payyanur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(415,18,'Ponnani','Ponnani','2017-05-11 13:51:20','2017-05-11 13:51:20'),(416,18,'Punalur','Punalur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(417,18,'Shoranur','Shoranur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(418,18,'Sultans Battery','Sultans Battery','2017-05-11 13:51:20','2017-05-11 13:51:20'),(419,18,'Thalassery','Thalassery','2017-05-11 13:51:20','2017-05-11 13:51:20'),(420,18,'Thiruvananthapuram','Thiruvananthapuram','2017-05-11 13:51:20','2017-05-11 13:51:20'),(421,18,'Thrissur','Thrissur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(422,18,'Tirur','Tirur','2017-05-11 13:51:20','2017-05-11 13:51:20'),(423,18,'Tiruvalla','Tiruvalla','2017-05-11 13:51:20','2017-05-11 13:51:20'),(424,18,'Vaikam','Vaikam','2017-05-11 13:51:20','2017-05-11 13:51:20'),(425,18,'Vazhakulam','Vazhakulam','2017-05-11 13:51:20','2017-05-11 13:51:20'),(426,19,'Kavaratti','Kavaratti','2017-05-11 13:51:20','2017-05-11 13:51:20'),(427,20,'Abdul','Abdul','2017-05-11 13:51:20','2017-05-11 13:51:20'),(428,20,'Ahmednagar','Ahmednagar','2017-05-11 13:51:20','2017-05-11 13:51:20'),(429,20,'Akola','Akola','2017-05-11 13:51:20','2017-05-11 13:51:20'),(430,20,'Alibag','Alibag','2017-05-11 13:51:20','2017-05-11 13:51:20'),(431,20,'Ambad','Ambad','2017-05-11 13:51:21','2017-05-11 13:51:21'),(432,20,'Ambarnath','Ambarnath','2017-05-11 13:51:21','2017-05-11 13:51:21'),(433,20,'Amravati','Amravati','2017-05-11 13:51:21','2017-05-11 13:51:21'),(434,20,'Andheri','Andheri','2017-05-11 13:51:21','2017-05-11 13:51:21'),(435,20,'Arvi','Arvi','2017-05-11 13:51:21','2017-05-11 13:51:21'),(436,20,'Aundh','Aundh','2017-05-11 13:51:21','2017-05-11 13:51:21'),(437,20,'Aurangabad','Aurangabad','2017-05-11 13:51:21','2017-05-11 13:51:21'),(438,20,'Badlapur','Badlapur','2017-05-11 13:51:21','2017-05-11 13:51:21'),(439,20,'Bandra','Bandra','2017-05-11 13:51:21','2017-05-11 13:51:21'),(440,20,'Baramati','Baramati','2017-05-11 13:51:21','2017-05-11 13:51:21'),(441,20,'Belapur','Belapur','2017-05-11 13:51:21','2017-05-11 13:51:21'),(442,20,'Bhandup','Bhandup','2017-05-11 13:51:21','2017-05-11 13:51:21'),(443,20,'Bhiwandi','Bhiwandi','2017-05-11 13:51:21','2017-05-11 13:51:21'),(444,20,'Bhusawal','Bhusawal','2017-05-11 13:51:21','2017-05-11 13:51:21'),(445,20,'Boisar','Boisar','2017-05-11 13:51:21','2017-05-11 13:51:21'),(446,20,'Chakan','Chakan','2017-05-11 13:51:21','2017-05-11 13:51:21'),(447,20,'Chalisgaon','Chalisgaon','2017-05-11 13:51:21','2017-05-11 13:51:21'),(448,20,'Chandrapur','Chandrapur','2017-05-11 13:51:21','2017-05-11 13:51:21'),(449,20,'Charan','Charan','2017-05-11 13:51:21','2017-05-11 13:51:21'),(450,20,'Chinchvad','Chinchvad','2017-05-11 13:51:21','2017-05-11 13:51:21'),(451,20,'Chiplun','Chiplun','2017-05-11 13:51:21','2017-05-11 13:51:21'),(452,20,'Chopda','Chopda','2017-05-11 13:51:21','2017-05-11 13:51:21'),(453,20,'Colaba','Colaba','2017-05-11 13:51:22','2017-05-11 13:51:22'),(454,20,'Dahanu','Dahanu','2017-05-11 13:51:22','2017-05-11 13:51:22'),(455,20,'Deolali','Deolali','2017-05-11 13:51:22','2017-05-11 13:51:22'),(456,20,'Devgarh','Devgarh','2017-05-11 13:51:22','2017-05-11 13:51:22'),(457,20,'Dharavi','Dharavi','2017-05-11 13:51:22','2017-05-11 13:51:22'),(458,20,'Dhule','Dhule','2017-05-11 13:51:22','2017-05-11 13:51:22'),(459,20,'Ellora Caves','Ellora Caves','2017-05-11 13:51:22','2017-05-11 13:51:22'),(460,20,'Gargoti','Gargoti','2017-05-11 13:51:22','2017-05-11 13:51:22'),(461,20,'Ghatkopar','Ghatkopar','2017-05-11 13:51:22','2017-05-11 13:51:22'),(462,20,'Goregaon','Goregaon','2017-05-11 13:51:22','2017-05-11 13:51:22'),(463,20,'Hinganghat','Hinganghat','2017-05-11 13:51:22','2017-05-11 13:51:22'),(464,20,'Hingoli','Hingoli','2017-05-11 13:51:22','2017-05-11 13:51:22'),(465,20,'Ichalkaranji','Ichalkaranji','2017-05-11 13:51:22','2017-05-11 13:51:22'),(466,20,'Igatpuri','Igatpuri','2017-05-11 13:51:22','2017-05-11 13:51:22'),(467,20,'Jalgaon Jamod','Jalgaon Jamod','2017-05-11 13:51:22','2017-05-11 13:51:22'),(468,20,'Jalna','Jalna','2017-05-11 13:51:22','2017-05-11 13:51:22'),(469,20,'Kagal','Kagal','2017-05-11 13:51:22','2017-05-11 13:51:22'),(470,20,'Kalam','Kalam','2017-05-11 13:51:22','2017-05-11 13:51:22'),(471,20,'Kalamboli','Kalamboli','2017-05-11 13:51:22','2017-05-11 13:51:22'),(472,20,'Kalyan','Kalyan','2017-05-11 13:51:22','2017-05-11 13:51:22'),(473,20,'Kankauli','Kankauli','2017-05-11 13:51:22','2017-05-11 13:51:22'),(474,20,'Karad','Karad','2017-05-11 13:51:22','2017-05-11 13:51:22'),(475,20,'Karanja','Karanja','2017-05-11 13:51:22','2017-05-11 13:51:22'),(476,20,'Karjat','Karjat','2017-05-11 13:51:23','2017-05-11 13:51:23'),(477,20,'Khalapur','Khalapur','2017-05-11 13:51:23','2017-05-11 13:51:23'),(478,20,'Khopoli','Khopoli','2017-05-11 13:51:23','2017-05-11 13:51:23'),(479,20,'Kolhapur','Kolhapur','2017-05-11 13:51:23','2017-05-11 13:51:23'),(480,20,'Latur','Latur','2017-05-11 13:51:23','2017-05-11 13:51:23'),(481,20,'Mahad','Mahad','2017-05-11 13:51:23','2017-05-11 13:51:23'),(482,20,'Mahim','Mahim','2017-05-11 13:51:23','2017-05-11 13:51:23'),(483,20,'Mangaon','Mangaon','2017-05-11 13:51:23','2017-05-11 13:51:23'),(484,20,'Manor','Manor','2017-05-11 13:51:23','2017-05-11 13:51:23'),(485,20,'Miraj','Miraj','2017-05-11 13:51:23','2017-05-11 13:51:23'),(486,20,'Mumbai','Mumbai','2017-05-11 13:51:23','2017-05-11 13:51:23'),(487,20,'Nadgaon','Nadgaon','2017-05-11 13:51:23','2017-05-11 13:51:23'),(488,20,'Nagpur','Nagpur','2017-05-11 13:51:23','2017-05-11 13:51:23'),(489,20,'Nanded','Nanded','2017-05-11 13:51:23','2017-05-11 13:51:23'),(490,20,'Nandurbar','Nandurbar','2017-05-11 13:51:23','2017-05-11 13:51:23'),(491,20,'Narayangaon','Narayangaon','2017-05-11 13:51:23','2017-05-11 13:51:23'),(492,20,'Nashik','Nashik','2017-05-11 13:51:23','2017-05-11 13:51:23'),(493,20,'Neral','Neral','2017-05-11 13:51:23','2017-05-11 13:51:23'),(494,20,'Neri','Neri','2017-05-11 13:51:23','2017-05-11 13:51:23'),(495,20,'Osmanabad','Osmanabad','2017-05-11 13:51:23','2017-05-11 13:51:23'),(496,20,'Palghar','Palghar','2017-05-11 13:51:23','2017-05-11 13:51:23'),(497,20,'Palus','Palus','2017-05-11 13:51:23','2017-05-11 13:51:23'),(498,20,'Panchgani','Panchgani','2017-05-11 13:51:23','2017-05-11 13:51:23'),(499,20,'Pandharpur','Pandharpur','2017-05-11 13:51:24','2017-05-11 13:51:24'),(500,20,'Panvel','Panvel','2017-05-11 13:51:24','2017-05-11 13:51:24'),(501,20,'Parbhani','Parbhani','2017-05-11 13:51:24','2017-05-11 13:51:24'),(502,20,'Parel','Parel','2017-05-11 13:51:24','2017-05-11 13:51:24'),(503,20,'Pimpri','Pimpri','2017-05-11 13:51:24','2017-05-11 13:51:24'),(504,20,'Pune','Pune','2017-05-11 13:51:24','2017-05-11 13:51:24'),(505,20,'Puras','Puras','2017-05-11 13:51:24','2017-05-11 13:51:24'),(506,20,'Ratnagiri','Ratnagiri','2017-05-11 13:51:24','2017-05-11 13:51:24'),(507,20,'Sakri','Sakri','2017-05-11 13:51:24','2017-05-11 13:51:24'),(508,20,'Sangamner','Sangamner','2017-05-11 13:51:24','2017-05-11 13:51:24'),(509,20,'Sangli','Sangli','2017-05-11 13:51:24','2017-05-11 13:51:24'),(510,20,'Sangola','Sangola','2017-05-11 13:51:24','2017-05-11 13:51:24'),(511,20,'Satara','Satara','2017-05-11 13:51:24','2017-05-11 13:51:24'),(512,20,'Shahapur','Shahapur','2017-05-11 13:51:24','2017-05-11 13:51:24'),(513,20,'Shirgaon','Shirgaon','2017-05-11 13:51:24','2017-05-11 13:51:24'),(514,20,'Shrigonda','Shrigonda','2017-05-11 13:51:24','2017-05-11 13:51:24'),(515,20,'Sinnar','Sinnar','2017-05-11 13:51:24','2017-05-11 13:51:24'),(516,20,'Sion','Sion','2017-05-11 13:51:24','2017-05-11 13:51:24'),(517,20,'Solapur','Solapur','2017-05-11 13:51:24','2017-05-11 13:51:24'),(518,20,'Sopara','Sopara','2017-05-11 13:51:24','2017-05-11 13:51:24'),(519,20,'Talegaon Dabhade','Talegaon Dabhade','2017-05-11 13:51:24','2017-05-11 13:51:24'),(520,20,'Thane','Thane','2017-05-11 13:51:24','2017-05-11 13:51:24'),(521,20,'Trimbak','Trimbak','2017-05-11 13:51:24','2017-05-11 13:51:24'),(522,20,'Tuljapur','Tuljapur','2017-05-11 13:51:24','2017-05-11 13:51:24'),(523,20,'Ulhasnagar','Ulhasnagar','2017-05-11 13:51:24','2017-05-11 13:51:24'),(524,20,'Umred','Umred','2017-05-11 13:51:24','2017-05-11 13:51:24'),(525,20,'Vadner','Vadner','2017-05-11 13:51:25','2017-05-11 13:51:25'),(526,20,'Vasai','Vasai','2017-05-11 13:51:25','2017-05-11 13:51:25'),(527,20,'Vashi','Vashi','2017-05-11 13:51:25','2017-05-11 13:51:25'),(528,20,'Virar','Virar','2017-05-11 13:51:25','2017-05-11 13:51:25'),(529,20,'Wai','Wai','2017-05-11 13:51:25','2017-05-11 13:51:25'),(530,20,'Wardha','Wardha','2017-05-11 13:51:25','2017-05-11 13:51:25'),(531,20,'Yavatmal','Yavatmal','2017-05-11 13:51:25','2017-05-11 13:51:25'),(532,20,'Yeola','Yeola','2017-05-11 13:51:25','2017-05-11 13:51:25'),(533,21,'Nongpoh','Nongpoh','2017-05-11 13:51:25','2017-05-11 13:51:25'),(534,21,'Nongstoin','Nongstoin','2017-05-11 13:51:25','2017-05-11 13:51:25'),(535,21,'Pala','Pala','2017-05-11 13:51:25','2017-05-11 13:51:25'),(536,21,'Shillong','Shillong','2017-05-11 13:51:25','2017-05-11 13:51:25'),(537,21,'Tura','Tura','2017-05-11 13:51:25','2017-05-11 13:51:25'),(538,22,'Churachandpur','Churachandpur','2017-05-11 13:51:25','2017-05-11 13:51:25'),(539,22,'Imphal','Imphal','2017-05-11 13:51:25','2017-05-11 13:51:25'),(540,23,'Amarkantak','Amarkantak','2017-05-11 13:51:25','2017-05-11 13:51:25'),(541,23,'Ambah','Ambah','2017-05-11 13:51:25','2017-05-11 13:51:25'),(542,23,'Anantpur','Anantpur','2017-05-11 13:51:25','2017-05-11 13:51:25'),(543,23,'Bagh','Bagh','2017-05-11 13:51:25','2017-05-11 13:51:25'),(544,23,'Balaghat','Balaghat','2017-05-11 13:51:25','2017-05-11 13:51:25'),(545,23,'Baroda','Baroda','2017-05-11 13:51:25','2017-05-11 13:51:25'),(546,23,'Berasia','Berasia','2017-05-11 13:51:26','2017-05-11 13:51:26'),(547,23,'Betul','Betul','2017-05-11 13:51:26','2017-05-11 13:51:26'),(548,23,'Bhagwan','Bhagwan','2017-05-11 13:51:26','2017-05-11 13:51:26'),(549,23,'Bhartiya','Bhartiya','2017-05-11 13:51:26','2017-05-11 13:51:26'),(550,23,'Bhopal','Bhopal','2017-05-11 13:51:26','2017-05-11 13:51:26'),(551,23,'Chakra','Chakra','2017-05-11 13:51:26','2017-05-11 13:51:26'),(552,23,'Chand','Chand','2017-05-11 13:51:26','2017-05-11 13:51:26'),(553,23,'Chhindwara','Chhindwara','2017-05-11 13:51:26','2017-05-11 13:51:26'),(554,23,'Chopra','Chopra','2017-05-11 13:51:26','2017-05-11 13:51:26'),(555,23,'Damoh','Damoh','2017-05-11 13:51:26','2017-05-11 13:51:26'),(556,23,'Dewas','Dewas','2017-05-11 13:51:26','2017-05-11 13:51:26'),(557,23,'Dhar','Dhar','2017-05-11 13:51:26','2017-05-11 13:51:26'),(558,23,'Dindori','Dindori','2017-05-11 13:51:26','2017-05-11 13:51:26'),(559,23,'Gandhigram','Gandhigram','2017-05-11 13:51:26','2017-05-11 13:51:26'),(560,23,'Ganpat','Ganpat','2017-05-11 13:51:26','2017-05-11 13:51:26'),(561,23,'Guna','Guna','2017-05-11 13:51:26','2017-05-11 13:51:26'),(562,23,'Gwalior','Gwalior','2017-05-11 13:51:26','2017-05-11 13:51:26'),(563,23,'Hoshangabad','Hoshangabad','2017-05-11 13:51:26','2017-05-11 13:51:26'),(564,23,'Indore','Indore','2017-05-11 13:51:26','2017-05-11 13:51:26'),(565,23,'Jabalpur','Jabalpur','2017-05-11 13:51:26','2017-05-11 13:51:26'),(566,23,'Kailaras','Kailaras','2017-05-11 13:51:26','2017-05-11 13:51:26'),(567,23,'Kamalpura','Kamalpura','2017-05-11 13:51:26','2017-05-11 13:51:26'),(568,23,'Kataria','Kataria','2017-05-11 13:51:26','2017-05-11 13:51:26'),(569,23,'Katni','Katni','2017-05-11 13:51:26','2017-05-11 13:51:26'),(570,23,'Khajuraho Group of Monuments','Khajuraho Group of Monuments','2017-05-11 13:51:27','2017-05-11 13:51:27'),(571,23,'Khargone','Khargone','2017-05-11 13:51:27','2017-05-11 13:51:27'),(572,23,'Mandla','Mandla','2017-05-11 13:51:27','2017-05-11 13:51:27'),(573,23,'Mandsaur','Mandsaur','2017-05-11 13:51:27','2017-05-11 13:51:27'),(574,23,'Mhow','Mhow','2017-05-11 13:51:27','2017-05-11 13:51:27'),(575,23,'Morena','Morena','2017-05-11 13:51:27','2017-05-11 13:51:27'),(576,23,'Nadia','Nadia','2017-05-11 13:51:27','2017-05-11 13:51:27'),(577,23,'Nagara','Nagara','2017-05-11 13:51:27','2017-05-11 13:51:27'),(578,23,'Pachmarhi','Pachmarhi','2017-05-11 13:51:27','2017-05-11 13:51:27'),(579,23,'Raipur','Raipur','2017-05-11 13:51:27','2017-05-11 13:51:27'),(580,23,'Rajapur','Rajapur','2017-05-11 13:51:27','2017-05-11 13:51:27'),(581,23,'Rama','Rama','2017-05-11 13:51:27','2017-05-11 13:51:27'),(582,23,'Ratlam','Ratlam','2017-05-11 13:51:27','2017-05-11 13:51:27'),(583,23,'Rewa','Rewa','2017-05-11 13:51:27','2017-05-11 13:51:27'),(584,23,'Sagar','Sagar','2017-05-11 13:51:27','2017-05-11 13:51:27'),(585,23,'Sarangi','Sarangi','2017-05-11 13:51:27','2017-05-11 13:51:27'),(586,23,'Satna','Satna','2017-05-11 13:51:27','2017-05-11 13:51:27'),(587,23,'Sehore','Sehore','2017-05-11 13:51:27','2017-05-11 13:51:27'),(588,23,'Sendhwa','Sendhwa','2017-05-11 13:51:27','2017-05-11 13:51:27'),(589,23,'Shahdol','Shahdol','2017-05-11 13:51:27','2017-05-11 13:51:27'),(590,23,'Sidhi','Sidhi','2017-05-11 13:51:27','2017-05-11 13:51:27'),(591,23,'Soni','Soni','2017-05-11 13:51:27','2017-05-11 13:51:27'),(592,23,'Tala','Tala','2017-05-11 13:51:28','2017-05-11 13:51:28'),(593,23,'Ujjain','Ujjain','2017-05-11 13:51:28','2017-05-11 13:51:28'),(594,23,'Vidisha','Vidisha','2017-05-11 13:51:28','2017-05-11 13:51:28'),(595,24,'Aizawl','Aizawl','2017-05-11 13:51:28','2017-05-11 13:51:28'),(596,25,'Chen','Chen','2017-05-11 13:51:28','2017-05-11 13:51:28'),(597,25,'Dimapur','Dimapur','2017-05-11 13:51:28','2017-05-11 13:51:28'),(598,25,'Kohima','Kohima','2017-05-11 13:51:28','2017-05-11 13:51:28'),(599,26,'Angul','Angul','2017-05-11 13:51:28','2017-05-11 13:51:28'),(600,26,'Balangir','Balangir','2017-05-11 13:51:28','2017-05-11 13:51:28'),(601,26,'Balasore','Balasore','2017-05-11 13:51:28','2017-05-11 13:51:28'),(602,26,'Bargarh','Bargarh','2017-05-11 13:51:28','2017-05-11 13:51:28'),(603,26,'Barpali','Barpali','2017-05-11 13:51:28','2017-05-11 13:51:28'),(604,26,'Bhubaneswar','Bhubaneswar','2017-05-11 13:51:28','2017-05-11 13:51:28'),(605,26,'Brahmapur','Brahmapur','2017-05-11 13:51:28','2017-05-11 13:51:28'),(606,26,'Cuttack','Cuttack','2017-05-11 13:51:28','2017-05-11 13:51:28'),(607,26,'Dhenkanal','Dhenkanal','2017-05-11 13:51:28','2017-05-11 13:51:28'),(608,26,'Jajpur','Jajpur','2017-05-11 13:51:28','2017-05-11 13:51:28'),(609,26,'Jatani','Jatani','2017-05-11 13:51:28','2017-05-11 13:51:28'),(610,26,'Jaypur','Jaypur','2017-05-11 13:51:28','2017-05-11 13:51:28'),(611,26,'Jharsuguda','Jharsuguda','2017-05-11 13:51:28','2017-05-11 13:51:28'),(612,26,'Kalinga','Kalinga','2017-05-11 13:51:28','2017-05-11 13:51:28'),(613,26,'Khurda','Khurda','2017-05-11 13:51:28','2017-05-11 13:51:28'),(614,26,'Koraput','Koraput','2017-05-11 13:51:28','2017-05-11 13:51:28'),(615,26,'Nayagarh','Nayagarh','2017-05-11 13:51:28','2017-05-11 13:51:28'),(616,26,'Puri','Puri','2017-05-11 13:51:29','2017-05-11 13:51:29'),(617,26,'Raurkela','Raurkela','2017-05-11 13:51:29','2017-05-11 13:51:29'),(618,26,'Rayagada','Rayagada','2017-05-11 13:51:29','2017-05-11 13:51:29'),(619,26,'Sambalpur','Sambalpur','2017-05-11 13:51:29','2017-05-11 13:51:29'),(620,26,'Sundargarh','Sundargarh','2017-05-11 13:51:29','2017-05-11 13:51:29'),(621,26,'Talcher','Talcher','2017-05-11 13:51:29','2017-05-11 13:51:29'),(622,26,'Udaigiri','Udaigiri','2017-05-11 13:51:29','2017-05-11 13:51:29'),(623,27,'Amritsar','Amritsar','2017-05-11 13:51:29','2017-05-11 13:51:29'),(624,27,'Banga','Banga','2017-05-11 13:51:29','2017-05-11 13:51:29'),(625,27,'Barnala','Barnala','2017-05-11 13:51:29','2017-05-11 13:51:29'),(626,27,'Batala','Batala','2017-05-11 13:51:29','2017-05-11 13:51:29'),(627,27,'Bhatinda','Bhatinda','2017-05-11 13:51:29','2017-05-11 13:51:29'),(628,27,'Dasua','Dasua','2017-05-11 13:51:29','2017-05-11 13:51:29'),(629,27,'Dhariwal','Dhariwal','2017-05-11 13:51:29','2017-05-11 13:51:29'),(630,27,'Dhuri','Dhuri','2017-05-11 13:51:29','2017-05-11 13:51:29'),(631,27,'Dinanagar','Dinanagar','2017-05-11 13:51:29','2017-05-11 13:51:29'),(632,27,'Faridkot','Faridkot','2017-05-11 13:51:29','2017-05-11 13:51:29'),(633,27,'Firozpur','Firozpur','2017-05-11 13:51:29','2017-05-11 13:51:29'),(634,27,'Garhshankar','Garhshankar','2017-05-11 13:51:29','2017-05-11 13:51:29'),(635,27,'Gurdaspur','Gurdaspur','2017-05-11 13:51:29','2017-05-11 13:51:29'),(636,27,'Hoshiarpur','Hoshiarpur','2017-05-11 13:51:29','2017-05-11 13:51:29'),(637,27,'Jagraon','Jagraon','2017-05-11 13:51:29','2017-05-11 13:51:29'),(638,27,'Jalalabad','Jalalabad','2017-05-11 13:51:29','2017-05-11 13:51:29'),(639,27,'Jalandhar','Jalandhar','2017-05-11 13:51:29','2017-05-11 13:51:29'),(640,27,'Kapurthala Town','Kapurthala Town','2017-05-11 13:51:29','2017-05-11 13:51:29'),(641,27,'Khanna','Khanna','2017-05-11 13:51:29','2017-05-11 13:51:29'),(642,27,'Kharar','Kharar','2017-05-11 13:51:30','2017-05-11 13:51:30'),(643,27,'Kot Isa Khan','Kot Isa Khan','2017-05-11 13:51:30','2017-05-11 13:51:30'),(644,27,'Kurali','Kurali','2017-05-11 13:51:30','2017-05-11 13:51:30'),(645,27,'Ludhiana','Ludhiana','2017-05-11 13:51:30','2017-05-11 13:51:30'),(646,27,'Machhiwara','Machhiwara','2017-05-11 13:51:30','2017-05-11 13:51:30'),(647,27,'Maharaj','Maharaj','2017-05-11 13:51:30','2017-05-11 13:51:30'),(648,27,'Mansa','Mansa','2017-05-11 13:51:30','2017-05-11 13:51:30'),(649,27,'Moga','Moga','2017-05-11 13:51:30','2017-05-11 13:51:30'),(650,27,'Mohali','Mohali','2017-05-11 13:51:30','2017-05-11 13:51:30'),(651,27,'Morinda','Morinda','2017-05-11 13:51:30','2017-05-11 13:51:30'),(652,27,'Mukerian','Mukerian','2017-05-11 13:51:31','2017-05-11 13:51:31'),(653,27,'Muktsar','Muktsar','2017-05-11 13:51:31','2017-05-11 13:51:31'),(654,27,'Nabha','Nabha','2017-05-11 13:51:31','2017-05-11 13:51:31'),(655,27,'Pathankot','Pathankot','2017-05-11 13:51:31','2017-05-11 13:51:31'),(656,27,'Patiala','Patiala','2017-05-11 13:51:31','2017-05-11 13:51:31'),(657,27,'Phagwara','Phagwara','2017-05-11 13:51:31','2017-05-11 13:51:31'),(658,27,'Rajpura','Rajpura','2017-05-11 13:51:31','2017-05-11 13:51:31'),(659,27,'Rupnagar','Rupnagar','2017-05-11 13:51:31','2017-05-11 13:51:31'),(660,27,'Sangrur','Sangrur','2017-05-11 13:51:31','2017-05-11 13:51:31'),(661,27,'Shahkot','Shahkot','2017-05-11 13:51:31','2017-05-11 13:51:31'),(662,27,'Sirhind','Sirhind','2017-05-11 13:51:31','2017-05-11 13:51:31'),(663,27,'Sunam','Sunam','2017-05-11 13:51:31','2017-05-11 13:51:31'),(664,27,'Talwandi Sabo','Talwandi Sabo','2017-05-11 13:51:31','2017-05-11 13:51:31'),(665,27,'Tarn Taran','Tarn Taran','2017-05-11 13:51:31','2017-05-11 13:51:31'),(666,28,'Karaikal','Karaikal','2017-05-11 13:51:32','2017-05-11 13:51:32'),(667,28,'Puducherry','Puducherry','2017-05-11 13:51:32','2017-05-11 13:51:32'),(668,29,'Ajmer','Ajmer','2017-05-11 13:51:32','2017-05-11 13:51:32'),(669,29,'Alwar','Alwar','2017-05-11 13:51:32','2017-05-11 13:51:32'),(670,29,'Amer','Amer','2017-05-11 13:51:32','2017-05-11 13:51:32'),(671,29,'Amet','Amet','2017-05-11 13:51:32','2017-05-11 13:51:32'),(672,29,'Balana','Balana','2017-05-11 13:51:32','2017-05-11 13:51:32'),(673,29,'Bali','Bali','2017-05-11 13:51:32','2017-05-11 13:51:32'),(674,29,'Banswara','Banswara','2017-05-11 13:51:32','2017-05-11 13:51:32'),(675,29,'Barmer','Barmer','2017-05-11 13:51:32','2017-05-11 13:51:32'),(676,29,'Beawar','Beawar','2017-05-11 13:51:32','2017-05-11 13:51:32'),(677,29,'Bharatpur','Bharatpur','2017-05-11 13:51:32','2017-05-11 13:51:32'),(678,29,'Bhilwara','Bhilwara','2017-05-11 13:51:32','2017-05-11 13:51:32'),(679,29,'Bikaner','Bikaner','2017-05-11 13:51:32','2017-05-11 13:51:32'),(680,29,'Binavas','Binavas','2017-05-11 13:51:32','2017-05-11 13:51:32'),(681,29,'Bundi','Bundi','2017-05-11 13:51:32','2017-05-11 13:51:32'),(682,29,'Charu','Charu','2017-05-11 13:51:32','2017-05-11 13:51:32'),(683,29,'Chetan','Chetan','2017-05-11 13:51:32','2017-05-11 13:51:32'),(684,29,'Chhabra','Chhabra','2017-05-11 13:51:32','2017-05-11 13:51:32'),(685,29,'Dipas','Dipas','2017-05-11 13:51:33','2017-05-11 13:51:33'),(686,29,'Ganganagar','Ganganagar','2017-05-11 13:51:33','2017-05-11 13:51:33'),(687,29,'Gangapur','Gangapur','2017-05-11 13:51:33','2017-05-11 13:51:33'),(688,29,'Gangrar','Gangrar','2017-05-11 13:51:33','2017-05-11 13:51:33'),(689,29,'Jaipur','Jaipur','2017-05-11 13:51:33','2017-05-11 13:51:33'),(690,29,'Jaisalmer','Jaisalmer','2017-05-11 13:51:33','2017-05-11 13:51:33'),(691,29,'Jhalawar','Jhalawar','2017-05-11 13:51:33','2017-05-11 13:51:33'),(692,29,'Jhunjhunun','Jhunjhunun','2017-05-11 13:51:33','2017-05-11 13:51:33'),(693,29,'Jodhpur','Jodhpur','2017-05-11 13:51:33','2017-05-11 13:51:33'),(694,29,'Kalan','Kalan','2017-05-11 13:51:33','2017-05-11 13:51:33'),(695,29,'Kanakpura','Kanakpura','2017-05-11 13:51:33','2017-05-11 13:51:33'),(696,29,'Khan','Khan','2017-05-11 13:51:33','2017-05-11 13:51:33'),(697,29,'Khinwara','Khinwara','2017-05-11 13:51:33','2017-05-11 13:51:33'),(698,29,'Kishangarh','Kishangarh','2017-05-11 13:51:33','2017-05-11 13:51:33'),(699,29,'Kolayat','Kolayat','2017-05-11 13:51:33','2017-05-11 13:51:33'),(700,29,'Kota','Kota','2017-05-11 13:51:33','2017-05-11 13:51:33'),(701,29,'Lamba Harisingh','Lamba Harisingh','2017-05-11 13:51:33','2017-05-11 13:51:33'),(702,29,'Mahajan','Mahajan','2017-05-11 13:51:33','2017-05-11 13:51:33'),(703,29,'Mahatma','Mahatma','2017-05-11 13:51:33','2017-05-11 13:51:33'),(704,29,'Mandal','Mandal','2017-05-11 13:51:33','2017-05-11 13:51:33'),(705,29,'Manna','Manna','2017-05-11 13:51:33','2017-05-11 13:51:33'),(706,29,'Mount Abu','Mount Abu','2017-05-11 13:51:33','2017-05-11 13:51:33'),(707,29,'Nagar','Nagar','2017-05-11 13:51:34','2017-05-11 13:51:34'),(708,29,'Nagaur','Nagaur','2017-05-11 13:51:34','2017-05-11 13:51:34'),(709,29,'Nanda','Nanda','2017-05-11 13:51:34','2017-05-11 13:51:34'),(710,29,'Naraina','Naraina','2017-05-11 13:51:34','2017-05-11 13:51:34'),(711,29,'Nathdwara','Nathdwara','2017-05-11 13:51:34','2017-05-11 13:51:34'),(712,29,'Pali','Pali','2017-05-11 13:51:34','2017-05-11 13:51:34'),(713,29,'Pilani','Pilani','2017-05-11 13:51:34','2017-05-11 13:51:34'),(714,29,'Pitampura','Pitampura','2017-05-11 13:51:34','2017-05-11 13:51:34'),(715,29,'Pushkar','Pushkar','2017-05-11 13:51:34','2017-05-11 13:51:34'),(716,29,'Rana','Rana','2017-05-11 13:51:34','2017-05-11 13:51:34'),(717,29,'Roshan','Roshan','2017-05-11 13:51:34','2017-05-11 13:51:34'),(718,29,'Shiv','Shiv','2017-05-11 13:51:34','2017-05-11 13:51:34'),(719,29,'Sikar','Sikar','2017-05-11 13:51:34','2017-05-11 13:51:34'),(720,29,'Sirohi','Sirohi','2017-05-11 13:51:34','2017-05-11 13:51:34'),(721,29,'Sojat','Sojat','2017-05-11 13:51:34','2017-05-11 13:51:34'),(722,29,'Sultan','Sultan','2017-05-11 13:51:34','2017-05-11 13:51:34'),(723,29,'Surana','Surana','2017-05-11 13:51:34','2017-05-11 13:51:34'),(724,29,'Suratgarh','Suratgarh','2017-05-11 13:51:34','2017-05-11 13:51:34'),(725,29,'Thali','Thali','2017-05-11 13:51:34','2017-05-11 13:51:34'),(726,29,'Tonk','Tonk','2017-05-11 13:51:34','2017-05-11 13:51:34'),(727,29,'Udaipur','Udaipur','2017-05-11 13:51:34','2017-05-11 13:51:34'),(728,30,'Gangtok','Gangtok','2017-05-11 13:51:34','2017-05-11 13:51:34'),(729,30,'Manu','Manu','2017-05-11 13:51:34','2017-05-11 13:51:34'),(730,30,'Singtam','Singtam','2017-05-11 13:51:34','2017-05-11 13:51:34'),(731,30,'Sirwani','Sirwani','2017-05-11 13:51:34','2017-05-11 13:51:34'),(732,31,'Adilabad','Adilabad','2017-05-11 13:51:34','2017-05-11 13:51:34'),(733,31,'Balanagar','Balanagar','2017-05-11 13:51:35','2017-05-11 13:51:35'),(734,31,'Bhongir','Bhongir','2017-05-11 13:51:35','2017-05-11 13:51:35'),(735,31,'Bodhan','Bodhan','2017-05-11 13:51:35','2017-05-11 13:51:35'),(736,31,'Gudur','Gudur','2017-05-11 13:51:35','2017-05-11 13:51:35'),(737,31,'Hyderabad','Hyderabad','2017-05-11 13:51:35','2017-05-11 13:51:35'),(738,31,'Karimnagar','Karimnagar','2017-05-11 13:51:35','2017-05-11 13:51:35'),(739,31,'Khammam','Khammam','2017-05-11 13:51:35','2017-05-11 13:51:35'),(740,31,'Kottagudem','Kottagudem','2017-05-11 13:51:35','2017-05-11 13:51:35'),(741,31,'Mancherial','Mancherial','2017-05-11 13:51:35','2017-05-11 13:51:35'),(742,31,'Medak','Medak','2017-05-11 13:51:35','2017-05-11 13:51:35'),(743,31,'Medchal','Medchal','2017-05-11 13:51:35','2017-05-11 13:51:35'),(744,31,'Nalgonda','Nalgonda','2017-05-11 13:51:35','2017-05-11 13:51:35'),(745,31,'Narsapur','Narsapur','2017-05-11 13:51:35','2017-05-11 13:51:35'),(746,31,'Nizamabad','Nizamabad','2017-05-11 13:51:35','2017-05-11 13:51:35'),(747,31,'Paloncha','Paloncha','2017-05-11 13:51:35','2017-05-11 13:51:35'),(748,31,'Patancheru','Patancheru','2017-05-11 13:51:35','2017-05-11 13:51:35'),(749,31,'Patelguda','Patelguda','2017-05-11 13:51:35','2017-05-11 13:51:35'),(750,31,'Pochampalli','Pochampalli','2017-05-11 13:51:35','2017-05-11 13:51:35'),(751,31,'Secunderabad','Secunderabad','2017-05-11 13:51:35','2017-05-11 13:51:35'),(752,31,'Shadnagar','Shadnagar','2017-05-11 13:51:35','2017-05-11 13:51:35'),(753,31,'Suriapet','Suriapet','2017-05-11 13:51:35','2017-05-11 13:51:35'),(754,31,'Uppal','Uppal','2017-05-11 13:51:35','2017-05-11 13:51:35'),(755,31,'Vikarabad','Vikarabad','2017-05-11 13:51:36','2017-05-11 13:51:36'),(756,31,'Warangal','Warangal','2017-05-11 13:51:36','2017-05-11 13:51:36'),(757,32,'Alangulam','Alangulam','2017-05-11 13:51:36','2017-05-11 13:51:36'),(758,32,'Ambur','Ambur','2017-05-11 13:51:36','2017-05-11 13:51:36'),(759,32,'Annamalainagar','Annamalainagar','2017-05-11 13:51:36','2017-05-11 13:51:36'),(760,32,'Arakkonam','Arakkonam','2017-05-11 13:51:36','2017-05-11 13:51:36'),(761,32,'Arani','Arani','2017-05-11 13:51:36','2017-05-11 13:51:36'),(762,32,'Ariyalur','Ariyalur','2017-05-11 13:51:36','2017-05-11 13:51:36'),(763,32,'Attur','Attur','2017-05-11 13:51:36','2017-05-11 13:51:36'),(764,32,'Bodinayakkanur','Bodinayakkanur','2017-05-11 13:51:36','2017-05-11 13:51:36'),(765,32,'Chennai','Chennai','2017-05-11 13:51:36','2017-05-11 13:51:36'),(766,32,'Cheyyar','Cheyyar','2017-05-11 13:51:36','2017-05-11 13:51:36'),(767,32,'Chidambaram','Chidambaram','2017-05-11 13:51:36','2017-05-11 13:51:36'),(768,32,'Choolai','Choolai','2017-05-11 13:51:36','2017-05-11 13:51:36'),(769,32,'Coimbatore','Coimbatore','2017-05-11 13:51:36','2017-05-11 13:51:36'),(770,32,'Coonoor','Coonoor','2017-05-11 13:51:36','2017-05-11 13:51:36'),(771,32,'Cuddalore','Cuddalore','2017-05-11 13:51:37','2017-05-11 13:51:37'),(772,32,'Devipattinam','Devipattinam','2017-05-11 13:51:37','2017-05-11 13:51:37'),(773,32,'Dharapuram','Dharapuram','2017-05-11 13:51:37','2017-05-11 13:51:37'),(774,32,'Dharmapuri','Dharmapuri','2017-05-11 13:51:37','2017-05-11 13:51:37'),(775,32,'Dindigul','Dindigul','2017-05-11 13:51:37','2017-05-11 13:51:37'),(776,32,'Ekkattuthangal','Ekkattuthangal','2017-05-11 13:51:37','2017-05-11 13:51:37'),(777,32,'Eral','Eral','2017-05-11 13:51:37','2017-05-11 13:51:37'),(778,32,'Erode','Erode','2017-05-11 13:51:37','2017-05-11 13:51:37'),(779,32,'Fort','Fort','2017-05-11 13:51:37','2017-05-11 13:51:37'),(780,32,'Gobichettipalayam','Gobichettipalayam','2017-05-11 13:51:37','2017-05-11 13:51:37'),(781,32,'Guindy','Guindy','2017-05-11 13:51:37','2017-05-11 13:51:37'),(782,32,'Hosur','Hosur','2017-05-11 13:51:37','2017-05-11 13:51:37'),(783,32,'Kalpakkam','Kalpakkam','2017-05-11 13:51:37','2017-05-11 13:51:37'),(784,32,'Kanchipuram','Kanchipuram','2017-05-11 13:51:37','2017-05-11 13:51:37'),(785,32,'Kangayam','Kangayam','2017-05-11 13:51:37','2017-05-11 13:51:37'),(786,32,'Kaniyambadi','Kaniyambadi','2017-05-11 13:51:37','2017-05-11 13:51:37'),(787,32,'Kanniyakumari','Kanniyakumari','2017-05-11 13:51:37','2017-05-11 13:51:37'),(788,32,'Karaikudi','Karaikudi','2017-05-11 13:51:37','2017-05-11 13:51:37'),(789,32,'Karamadai','Karamadai','2017-05-11 13:51:37','2017-05-11 13:51:37'),(790,32,'Karur','Karur','2017-05-11 13:51:37','2017-05-11 13:51:37'),(791,32,'Kodaikanal','Kodaikanal','2017-05-11 13:51:37','2017-05-11 13:51:37'),(792,32,'Koothanallur','Koothanallur','2017-05-11 13:51:37','2017-05-11 13:51:37'),(793,32,'Kovilpatti','Kovilpatti','2017-05-11 13:51:38','2017-05-11 13:51:38'),(794,32,'Krishnagiri','Krishnagiri','2017-05-11 13:51:38','2017-05-11 13:51:38'),(795,32,'Kumbakonam','Kumbakonam','2017-05-11 13:51:38','2017-05-11 13:51:38'),(796,32,'Kuzhithurai','Kuzhithurai','2017-05-11 13:51:38','2017-05-11 13:51:38'),(797,32,'Lalgudi','Lalgudi','2017-05-11 13:51:38','2017-05-11 13:51:38'),(798,32,'Madurai','Madurai','2017-05-11 13:51:38','2017-05-11 13:51:38'),(799,32,'Madurantakam','Madurantakam','2017-05-11 13:51:38','2017-05-11 13:51:38'),(800,32,'Mahabalipuram','Mahabalipuram','2017-05-11 13:51:38','2017-05-11 13:51:38'),(801,32,'Mannargudi','Mannargudi','2017-05-11 13:51:38','2017-05-11 13:51:38'),(802,32,'Mettur','Mettur','2017-05-11 13:51:38','2017-05-11 13:51:38'),(803,32,'Mylapore','Mylapore','2017-05-11 13:51:38','2017-05-11 13:51:38'),(804,32,'Nagapattinam','Nagapattinam','2017-05-11 13:51:38','2017-05-11 13:51:38'),(805,32,'Nagercoil','Nagercoil','2017-05-11 13:51:38','2017-05-11 13:51:38'),(806,32,'Namakkal','Namakkal','2017-05-11 13:51:38','2017-05-11 13:51:38'),(807,32,'Neyveli','Neyveli','2017-05-11 13:51:38','2017-05-11 13:51:38'),(808,32,'Omalur','Omalur','2017-05-11 13:51:38','2017-05-11 13:51:38'),(809,32,'Ooty','Ooty','2017-05-11 13:51:38','2017-05-11 13:51:38'),(810,32,'Palani','Palani','2017-05-11 13:51:38','2017-05-11 13:51:38'),(811,32,'Palladam','Palladam','2017-05-11 13:51:38','2017-05-11 13:51:38'),(812,32,'Panruti','Panruti','2017-05-11 13:51:38','2017-05-11 13:51:38'),(813,32,'Pattukkottai','Pattukkottai','2017-05-11 13:51:38','2017-05-11 13:51:38'),(814,32,'Perambalur','Perambalur','2017-05-11 13:51:38','2017-05-11 13:51:38'),(815,32,'Peranampattu','Peranampattu','2017-05-11 13:51:38','2017-05-11 13:51:38'),(816,32,'Perundurai','Perundurai','2017-05-11 13:51:38','2017-05-11 13:51:38'),(817,32,'Pollachi','Pollachi','2017-05-11 13:51:38','2017-05-11 13:51:38'),(818,32,'Ponneri','Ponneri','2017-05-11 13:51:39','2017-05-11 13:51:39'),(819,32,'Pudukkottai','Pudukkottai','2017-05-11 13:51:39','2017-05-11 13:51:39'),(820,32,'Puliyur','Puliyur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(821,32,'Rajapalaiyam','Rajapalaiyam','2017-05-11 13:51:39','2017-05-11 13:51:39'),(822,32,'Ramanathapuram','Ramanathapuram','2017-05-11 13:51:39','2017-05-11 13:51:39'),(823,32,'Ranippettai','Ranippettai','2017-05-11 13:51:39','2017-05-11 13:51:39'),(824,32,'Salem','Salem','2017-05-11 13:51:39','2017-05-11 13:51:39'),(825,32,'Sattur','Sattur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(826,32,'Sholavandan','Sholavandan','2017-05-11 13:51:39','2017-05-11 13:51:39'),(827,32,'Sirkazhi','Sirkazhi','2017-05-11 13:51:39','2017-05-11 13:51:39'),(828,32,'Siruseri','Siruseri','2017-05-11 13:51:39','2017-05-11 13:51:39'),(829,32,'Sivaganga','Sivaganga','2017-05-11 13:51:39','2017-05-11 13:51:39'),(830,32,'Sivakasi','Sivakasi','2017-05-11 13:51:39','2017-05-11 13:51:39'),(831,32,'Sriperumbudur','Sriperumbudur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(832,32,'Srirangam','Srirangam','2017-05-11 13:51:39','2017-05-11 13:51:39'),(833,32,'Srivilliputhur','Srivilliputhur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(834,32,'Tambaram','Tambaram','2017-05-11 13:51:39','2017-05-11 13:51:39'),(835,32,'Thanjavur','Thanjavur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(836,32,'Thenkasi','Thenkasi','2017-05-11 13:51:39','2017-05-11 13:51:39'),(837,32,'Thirumangalam','Thirumangalam','2017-05-11 13:51:39','2017-05-11 13:51:39'),(838,32,'Thiruthani','Thiruthani','2017-05-11 13:51:39','2017-05-11 13:51:39'),(839,32,'Thiruvarur','Thiruvarur','2017-05-11 13:51:39','2017-05-11 13:51:39'),(840,32,'Thoothukudi','Thoothukudi','2017-05-11 13:51:39','2017-05-11 13:51:39'),(841,32,'Tindivanam','Tindivanam','2017-05-11 13:51:39','2017-05-11 13:51:39'),(842,32,'Tiruchchendur','Tiruchchendur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(843,32,'Tiruchi','Tiruchi','2017-05-11 13:51:40','2017-05-11 13:51:40'),(844,32,'Tirunelveli','Tirunelveli','2017-05-11 13:51:40','2017-05-11 13:51:40'),(845,32,'Tiruppur','Tiruppur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(846,32,'Tiruvallur','Tiruvallur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(847,32,'Tiruvannamalai','Tiruvannamalai','2017-05-11 13:51:40','2017-05-11 13:51:40'),(848,32,'Turaiyur','Turaiyur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(849,32,'Vadamadurai','Vadamadurai','2017-05-11 13:51:40','2017-05-11 13:51:40'),(850,32,'Vandalur','Vandalur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(851,32,'Vandavasi','Vandavasi','2017-05-11 13:51:40','2017-05-11 13:51:40'),(852,32,'Vaniyambadi','Vaniyambadi','2017-05-11 13:51:40','2017-05-11 13:51:40'),(853,32,'Vellore','Vellore','2017-05-11 13:51:40','2017-05-11 13:51:40'),(854,32,'Villupuram','Villupuram','2017-05-11 13:51:40','2017-05-11 13:51:40'),(855,32,'Wellington','Wellington','2017-05-11 13:51:40','2017-05-11 13:51:40'),(856,32,'Yercaud','Yercaud','2017-05-11 13:51:40','2017-05-11 13:51:40'),(857,33,'Agartala','Agartala','2017-05-11 13:51:40','2017-05-11 13:51:40'),(858,33,'Kamalpur','Kamalpur','2017-05-11 13:51:40','2017-05-11 13:51:40'),(859,34,'Adwani','Adwani','2017-05-11 13:51:41','2017-05-11 13:51:41'),(860,34,'Almora','Almora','2017-05-11 13:51:41','2017-05-11 13:51:41'),(861,34,'Dang','Dang','2017-05-11 13:51:41','2017-05-11 13:51:41'),(862,34,'Dangi','Dangi','2017-05-11 13:51:41','2017-05-11 13:51:41'),(863,34,'Dehradun','Dehradun','2017-05-11 13:51:41','2017-05-11 13:51:41'),(864,34,'Dhanaulti','Dhanaulti','2017-05-11 13:51:41','2017-05-11 13:51:41'),(865,34,'Dogadda','Dogadda','2017-05-11 13:51:41','2017-05-11 13:51:41'),(866,34,'Dwarahat','Dwarahat','2017-05-11 13:51:41','2017-05-11 13:51:41'),(867,34,'Haldwani','Haldwani','2017-05-11 13:51:41','2017-05-11 13:51:41'),(868,34,'Haridwar','Haridwar','2017-05-11 13:51:41','2017-05-11 13:51:41'),(869,34,'Jamal','Jamal','2017-05-11 13:51:41','2017-05-11 13:51:41'),(870,34,'Jaspur','Jaspur','2017-05-11 13:51:41','2017-05-11 13:51:41'),(871,34,'Kashipur','Kashipur','2017-05-11 13:51:41','2017-05-11 13:51:41'),(872,34,'Lohaghat','Lohaghat','2017-05-11 13:51:41','2017-05-11 13:51:41'),(873,34,'Mill','Mill','2017-05-11 13:51:41','2017-05-11 13:51:41'),(874,34,'Mussoorie','Mussoorie','2017-05-11 13:51:41','2017-05-11 13:51:41'),(875,34,'Nagal','Nagal','2017-05-11 13:51:42','2017-05-11 13:51:42'),(876,34,'Naini','Naini','2017-05-11 13:51:42','2017-05-11 13:51:42'),(877,34,'Pantnagar','Pantnagar','2017-05-11 13:51:42','2017-05-11 13:51:42'),(878,34,'Pauri','Pauri','2017-05-11 13:51:42','2017-05-11 13:51:42'),(879,34,'Pithoragarh','Pithoragarh','2017-05-11 13:51:42','2017-05-11 13:51:42'),(880,34,'Ramnagar','Ramnagar','2017-05-11 13:51:42','2017-05-11 13:51:42'),(881,34,'Rishikesh','Rishikesh','2017-05-11 13:51:42','2017-05-11 13:51:42'),(882,34,'Roorkee','Roorkee','2017-05-11 13:51:42','2017-05-11 13:51:42'),(883,34,'Sidhpur','Sidhpur','2017-05-11 13:51:42','2017-05-11 13:51:42'),(884,34,'Uttarkashi','Uttarkashi','2017-05-11 13:51:42','2017-05-11 13:51:42'),(885,34,'Vikasnagar','Vikasnagar','2017-05-11 13:51:42','2017-05-11 13:51:42'),(886,35,'Agra','Agra','2017-05-11 13:51:42','2017-05-11 13:51:42'),(887,35,'Ajabpur','Ajabpur','2017-05-11 13:51:42','2017-05-11 13:51:42'),(888,35,'Aligarh','Aligarh','2017-05-11 13:51:42','2017-05-11 13:51:42'),(889,35,'Allahabad','Allahabad','2017-05-11 13:51:42','2017-05-11 13:51:42'),(890,35,'Anandnagar','Anandnagar','2017-05-11 13:51:42','2017-05-11 13:51:42'),(891,35,'Arora','Arora','2017-05-11 13:51:42','2017-05-11 13:51:42'),(892,35,'Azamgarh','Azamgarh','2017-05-11 13:51:42','2017-05-11 13:51:42'),(893,35,'Bagpat','Bagpat','2017-05-11 13:51:42','2017-05-11 13:51:42'),(894,35,'Balu','Balu','2017-05-11 13:51:42','2017-05-11 13:51:42'),(895,35,'Banda','Banda','2017-05-11 13:51:42','2017-05-11 13:51:42'),(896,35,'Bank','Bank','2017-05-11 13:51:42','2017-05-11 13:51:42'),(897,35,'Bareilly','Bareilly','2017-05-11 13:51:42','2017-05-11 13:51:42'),(898,35,'Basti','Basti','2017-05-11 13:51:42','2017-05-11 13:51:42'),(899,35,'Bela','Bela','2017-05-11 13:51:42','2017-05-11 13:51:42'),(900,35,'Bhadohi','Bhadohi','2017-05-11 13:51:43','2017-05-11 13:51:43'),(901,35,'Bichpuri','Bichpuri','2017-05-11 13:51:43','2017-05-11 13:51:43'),(902,35,'Budaun','Budaun','2017-05-11 13:51:43','2017-05-11 13:51:43'),(903,35,'Bulandshahr','Bulandshahr','2017-05-11 13:51:43','2017-05-11 13:51:43'),(904,35,'Chandauli','Chandauli','2017-05-11 13:51:43','2017-05-11 13:51:43'),(905,35,'Chandausi','Chandausi','2017-05-11 13:51:43','2017-05-11 13:51:43'),(906,35,'Chitra','Chitra','2017-05-11 13:51:43','2017-05-11 13:51:43'),(907,35,'Dadri','Dadri','2017-05-11 13:51:43','2017-05-11 13:51:43'),(908,35,'Dasna','Dasna','2017-05-11 13:51:43','2017-05-11 13:51:43'),(909,35,'Deoria','Deoria','2017-05-11 13:51:43','2017-05-11 13:51:43'),(910,35,'Etawah','Etawah','2017-05-11 13:51:43','2017-05-11 13:51:43'),(911,35,'Faizabad','Faizabad','2017-05-11 13:51:43','2017-05-11 13:51:43'),(912,35,'Fatehgarh','Fatehgarh','2017-05-11 13:51:43','2017-05-11 13:51:43'),(913,35,'Fatehpur','Fatehpur','2017-05-11 13:51:43','2017-05-11 13:51:43'),(914,35,'Firozabad','Firozabad','2017-05-11 13:51:43','2017-05-11 13:51:43'),(915,35,'Ghaziabad','Ghaziabad','2017-05-11 13:51:43','2017-05-11 13:51:43'),(916,35,'Gonda','Gonda','2017-05-11 13:51:43','2017-05-11 13:51:43'),(917,35,'Gorakhpur','Gorakhpur','2017-05-11 13:51:43','2017-05-11 13:51:43'),(918,35,'Hamirpur','Hamirpur','2017-05-11 13:51:43','2017-05-11 13:51:43'),(919,35,'Hapur','Hapur','2017-05-11 13:51:43','2017-05-11 13:51:43'),(920,35,'Iglas','Iglas','2017-05-11 13:51:43','2017-05-11 13:51:43'),(921,35,'Jalesar','Jalesar','2017-05-11 13:51:43','2017-05-11 13:51:43'),(922,35,'Jaunpur','Jaunpur','2017-05-11 13:51:43','2017-05-11 13:51:43'),(923,35,'Jhansi','Jhansi','2017-05-11 13:51:43','2017-05-11 13:51:43'),(924,35,'Kaimganj','Kaimganj','2017-05-11 13:51:44','2017-05-11 13:51:44'),(925,35,'Kanpur','Kanpur','2017-05-11 13:51:44','2017-05-11 13:51:44'),(926,35,'Karari','Karari','2017-05-11 13:51:44','2017-05-11 13:51:44'),(927,35,'Kasganj','Kasganj','2017-05-11 13:51:44','2017-05-11 13:51:44'),(928,35,'Kasia','Kasia','2017-05-11 13:51:44','2017-05-11 13:51:44'),(929,35,'Khandar','Khandar','2017-05-11 13:51:44','2017-05-11 13:51:44'),(930,35,'Khatauli','Khatauli','2017-05-11 13:51:44','2017-05-11 13:51:44'),(931,35,'Kheri','Kheri','2017-05-11 13:51:44','2017-05-11 13:51:44'),(932,35,'Khurja','Khurja','2017-05-11 13:51:44','2017-05-11 13:51:44'),(933,35,'Kunwar','Kunwar','2017-05-11 13:51:44','2017-05-11 13:51:44'),(934,35,'Lakhimpur','Lakhimpur','2017-05-11 13:51:44','2017-05-11 13:51:44'),(935,35,'Lucknow','Lucknow','2017-05-11 13:51:44','2017-05-11 13:51:44'),(936,35,'Madhoganj','Madhoganj','2017-05-11 13:51:44','2017-05-11 13:51:44'),(937,35,'Mathan','Mathan','2017-05-11 13:51:44','2017-05-11 13:51:44'),(938,35,'Mathura','Mathura','2017-05-11 13:51:44','2017-05-11 13:51:44'),(939,35,'Mawana','Mawana','2017-05-11 13:51:44','2017-05-11 13:51:44'),(940,35,'Meerut','Meerut','2017-05-11 13:51:44','2017-05-11 13:51:44'),(941,35,'Mehra','Mehra','2017-05-11 13:51:44','2017-05-11 13:51:44'),(942,35,'Mirza Murad','Mirza Murad','2017-05-11 13:51:44','2017-05-11 13:51:44'),(943,35,'Mirzapur','Mirzapur','2017-05-11 13:51:44','2017-05-11 13:51:44'),(944,35,'Mohan','Mohan','2017-05-11 13:51:44','2017-05-11 13:51:44'),(945,35,'Moradabad','Moradabad','2017-05-11 13:51:44','2017-05-11 13:51:44'),(946,35,'Muzaffarnagar','Muzaffarnagar','2017-05-11 13:51:44','2017-05-11 13:51:44'),(947,35,'Noida','Noida','2017-05-11 13:51:44','2017-05-11 13:51:44'),(948,35,'Orai','Orai','2017-05-11 13:51:44','2017-05-11 13:51:44'),(949,35,'Padrauna','Padrauna','2017-05-11 13:51:44','2017-05-11 13:51:44'),(950,35,'Phaphamau','Phaphamau','2017-05-11 13:51:45','2017-05-11 13:51:45'),(951,35,'Pilkhuwa','Pilkhuwa','2017-05-11 13:51:45','2017-05-11 13:51:45'),(952,35,'Potti','Potti','2017-05-11 13:51:45','2017-05-11 13:51:45'),(953,35,'Rampur','Rampur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(954,35,'Saharanpur','Saharanpur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(955,35,'Sahibabad','Sahibabad','2017-05-11 13:51:45','2017-05-11 13:51:45'),(956,35,'Shahjahanpur','Shahjahanpur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(957,35,'Shamsabad','Shamsabad','2017-05-11 13:51:45','2017-05-11 13:51:45'),(958,35,'Sikka','Sikka','2017-05-11 13:51:45','2017-05-11 13:51:45'),(959,35,'Sitapur','Sitapur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(960,35,'Sultanpur','Sultanpur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(961,35,'Tanda','Tanda','2017-05-11 13:51:45','2017-05-11 13:51:45'),(962,35,'Teri','Teri','2017-05-11 13:51:45','2017-05-11 13:51:45'),(963,35,'Tikamgarh','Tikamgarh','2017-05-11 13:51:45','2017-05-11 13:51:45'),(964,35,'Unnao','Unnao','2017-05-11 13:51:45','2017-05-11 13:51:45'),(965,35,'Varanasi','Varanasi','2017-05-11 13:51:45','2017-05-11 13:51:45'),(966,36,'Alipur','Alipur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(967,36,'Asansol','Asansol','2017-05-11 13:51:45','2017-05-11 13:51:45'),(968,36,'Baharampur','Baharampur','2017-05-11 13:51:45','2017-05-11 13:51:45'),(969,36,'Baidyabati','Baidyabati','2017-05-11 13:51:45','2017-05-11 13:51:45'),(970,36,'Bali','Bali','2017-05-11 13:51:45','2017-05-11 13:51:45'),(971,36,'Balurghat','Balurghat','2017-05-11 13:51:45','2017-05-11 13:51:45'),(972,36,'Bangaon','Bangaon','2017-05-11 13:51:45','2017-05-11 13:51:45'),(973,36,'Bankura','Bankura','2017-05-11 13:51:45','2017-05-11 13:51:45'),(974,36,'Barakpur','Barakpur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(975,36,'Barddhaman','Barddhaman','2017-05-11 13:51:46','2017-05-11 13:51:46'),(976,36,'Basirhat','Basirhat','2017-05-11 13:51:46','2017-05-11 13:51:46'),(977,36,'Behala','Behala','2017-05-11 13:51:46','2017-05-11 13:51:46'),(978,36,'Belgharia','Belgharia','2017-05-11 13:51:46','2017-05-11 13:51:46'),(979,36,'Binnaguri','Binnaguri','2017-05-11 13:51:46','2017-05-11 13:51:46'),(980,36,'Bishnupur','Bishnupur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(981,36,'Bolpur','Bolpur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(982,36,'Budbud','Budbud','2017-05-11 13:51:46','2017-05-11 13:51:46'),(983,36,'Canning','Canning','2017-05-11 13:51:46','2017-05-11 13:51:46'),(984,36,'Chandannagar','Chandannagar','2017-05-11 13:51:46','2017-05-11 13:51:46'),(985,36,'Dam Dam','Dam Dam','2017-05-11 13:51:46','2017-05-11 13:51:46'),(986,36,'Darjeeling','Darjeeling','2017-05-11 13:51:46','2017-05-11 13:51:46'),(987,36,'Durgapur','Durgapur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(988,36,'Farakka','Farakka','2017-05-11 13:51:46','2017-05-11 13:51:46'),(989,36,'Ghatal','Ghatal','2017-05-11 13:51:46','2017-05-11 13:51:46'),(990,36,'Gujrat','Gujrat','2017-05-11 13:51:46','2017-05-11 13:51:46'),(991,36,'Habra','Habra','2017-05-11 13:51:46','2017-05-11 13:51:46'),(992,36,'Haldia','Haldia','2017-05-11 13:51:46','2017-05-11 13:51:46'),(993,36,'Haripur','Haripur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(994,36,'Howrah','Howrah','2017-05-11 13:51:46','2017-05-11 13:51:46'),(995,36,'Hugli','Hugli','2017-05-11 13:51:46','2017-05-11 13:51:46'),(996,36,'Jadabpur','Jadabpur','2017-05-11 13:51:46','2017-05-11 13:51:46'),(997,36,'Jalpaiguri','Jalpaiguri','2017-05-11 13:51:46','2017-05-11 13:51:46'),(998,36,'Jayanti','Jayanti','2017-05-11 13:51:46','2017-05-11 13:51:46'),(999,36,'Jhargram','Jhargram','2017-05-11 13:51:46','2017-05-11 13:51:46'),(1000,36,'Kakdwip','Kakdwip','2017-05-11 13:51:46','2017-05-11 13:51:46'),(1001,36,'Kalyani','Kalyani','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1002,36,'Kanchrapara','Kanchrapara','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1003,36,'Kandi','Kandi','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1004,36,'Karsiyang','Karsiyang','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1005,36,'Katoya','Katoya','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1006,36,'Kharagpur','Kharagpur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1007,36,'Koch Bihar','Koch Bihar','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1008,36,'Kolkata','Kolkata','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1009,36,'Konnagar','Konnagar','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1010,36,'Kulti','Kulti','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1011,36,'Liluah','Liluah','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1012,36,'Maldah','Maldah','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1013,36,'Manipur','Manipur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1014,36,'Mayapur','Mayapur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1015,36,'Medinipur','Medinipur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1016,36,'Multi','Multi','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1017,36,'Murshidabad','Murshidabad','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1018,36,'Nabadwip','Nabadwip','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1019,36,'Panchal','Panchal','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1020,36,'Puruliya','Puruliya','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1021,36,'Rajpur','Rajpur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1022,36,'Ranaghat','Ranaghat','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1023,36,'Raniganj','Raniganj','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1024,36,'Rudrapur','Rudrapur','2017-05-11 13:51:47','2017-05-11 13:51:47'),(1025,36,'Rupnarayanpur','Rupnarayanpur','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1026,36,'Salt Lake City','Salt Lake City','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1027,36,'Saranga','Saranga','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1028,36,'Serampore','Serampore','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1029,36,'Shyamnagar','Shyamnagar','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1030,36,'Siliguri','Siliguri','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1031,36,'Siuri','Siuri','2017-05-11 13:51:48','2017-05-11 13:51:48'),(1032,23,'Shajapur','Shajapur','2017-05-11 13:51:48','2017-05-11 13:51:48');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_actions`
--

DROP TABLE IF EXISTS `due_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `due_detail_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due_employee_detail_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_due_actions_on_due_detail_id` (`due_detail_id`),
  KEY `index_due_actions_on_due_employee_detail_id` (`due_employee_detail_id`),
  CONSTRAINT `fk_rails_b450245948` FOREIGN KEY (`due_employee_detail_id`) REFERENCES `due_employee_details` (`id`),
  CONSTRAINT `fk_rails_df9a4c1238` FOREIGN KEY (`due_detail_id`) REFERENCES `due_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_actions`
--

LOCK TABLES `due_actions` WRITE;
/*!40000 ALTER TABLE `due_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `due_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_details`
--

DROP TABLE IF EXISTS `due_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `due_employee_template_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due_template_id` int(11) DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_due_details_on_due_employee_template_id` (`due_employee_template_id`),
  KEY `index_due_details_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_due_details_on_due_template_id` (`due_template_id`),
  CONSTRAINT `fk_rails_beeb90dcd2` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
  CONSTRAINT `fk_rails_c52bde175a` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_e4cbdb3410` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_details`
--

LOCK TABLES `due_details` WRITE;
/*!40000 ALTER TABLE `due_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `due_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_employee_details`
--

DROP TABLE IF EXISTS `due_employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_employee_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `due_template_id` int(11) DEFAULT NULL,
  `due_employee_template_id` int(11) DEFAULT NULL,
  `due_detail_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_due_employee_details_on_employee_id` (`employee_id`),
  KEY `index_due_employee_details_on_due_template_id` (`due_template_id`),
  KEY `index_due_employee_details_on_due_employee_template_id` (`due_employee_template_id`),
  KEY `index_due_employee_details_on_due_detail_id` (`due_detail_id`),
  KEY `index_due_employee_details_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_7abe24328a` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
  CONSTRAINT `fk_rails_83dea4b3e1` FOREIGN KEY (`due_detail_id`) REFERENCES `due_details` (`id`),
  CONSTRAINT `fk_rails_d537a3e83d` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_d9f062ed32` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_f045b8a147` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_employee_details`
--

LOCK TABLES `due_employee_details` WRITE;
/*!40000 ALTER TABLE `due_employee_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `due_employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_employee_templates`
--

DROP TABLE IF EXISTS `due_employee_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_employee_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `due_template_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_due_employee_templates_on_employee_id` (`employee_id`),
  KEY `index_due_employee_templates_on_due_template_id` (`due_template_id`),
  CONSTRAINT `fk_rails_1d213449b8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_446fb0cf6d` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_employee_templates`
--

LOCK TABLES `due_employee_templates` WRITE;
/*!40000 ALTER TABLE `due_employee_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `due_employee_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_templates`
--

DROP TABLE IF EXISTS `due_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_templates`
--

LOCK TABLES `due_templates` WRITE;
/*!40000 ALTER TABLE `due_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `due_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_configs`
--

DROP TABLE IF EXISTS `email_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_port` int(11) DEFAULT NULL,
  `delivery_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_configs`
--

LOCK TABLES `email_configs` WRITE;
/*!40000 ALTER TABLE `email_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_annual_salaries`
--

DROP TABLE IF EXISTS `employee_annual_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_annual_salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `parent_salary_component_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `to_be_paid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_amount` decimal(15,2) DEFAULT NULL,
  `monthly_amount` decimal(15,2) DEFAULT NULL,
  `annual_amount` decimal(15,2) DEFAULT NULL,
  `is_taxable` tinyint(1) DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `base` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_annual_salaries_on_employee_id` (`employee_id`),
  KEY `index_employee_annual_salaries_on_salary_component_id` (`salary_component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_annual_salaries`
--

LOCK TABLES `employee_annual_salaries` WRITE;
/*!40000 ALTER TABLE `employee_annual_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_annual_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_arrear_items`
--

DROP TABLE IF EXISTS `employee_arrear_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_arrear_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_arrear_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `actual_amount` decimal(15,2) DEFAULT '0.00',
  `calculated_amount` decimal(15,2) DEFAULT '0.00',
  `is_deducted` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_arrear_items_on_employee_arrear_id` (`employee_arrear_id`),
  KEY `index_employee_arrear_items_on_salary_component_id` (`salary_component_id`),
  CONSTRAINT `fk_rails_2066b5e194` FOREIGN KEY (`employee_arrear_id`) REFERENCES `employee_arrears` (`id`),
  CONSTRAINT `fk_rails_71c4e35e55` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_arrear_items`
--

LOCK TABLES `employee_arrear_items` WRITE;
/*!40000 ALTER TABLE `employee_arrear_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_arrear_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_arrears`
--

DROP TABLE IF EXISTS `employee_arrears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_arrears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `actual_amount` decimal(15,2) DEFAULT '0.00',
  `calculated_amount` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_arrears_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_da3accc257` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_arrears`
--

LOCK TABLES `employee_arrears` WRITE;
/*!40000 ALTER TABLE `employee_arrears` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_arrears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attendances`
--

DROP TABLE IF EXISTS `employee_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `present` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count` decimal(5,2) DEFAULT NULL,
  `company_time_master_id` int(11) DEFAULT NULL,
  `working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rest_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `difference_hrs` decimal(10,0) DEFAULT NULL,
  `overtime_hrs` decimal(10,0) DEFAULT NULL,
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `late_mark` decimal(10,0) DEFAULT NULL,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `on_duty_request_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `machine_attendance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attributes`
--

DROP TABLE IF EXISTS `employee_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_master_id` int(11) DEFAULT NULL,
  `weightage` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_period_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `emp_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attributes_on_attribute_master_id` (`attribute_master_id`),
  KEY `index_employee_attributes_on_employee_id` (`employee_id`),
  KEY `index_employee_attributes_on_performance_period_id` (`performance_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attributes`
--

LOCK TABLES `employee_attributes` WRITE;
/*!40000 ALTER TABLE `employee_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_bank_details`
--

DROP TABLE IF EXISTS `employee_bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_bank_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `micr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bank_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_bank_details_on_employee_id` (`employee_id`),
  KEY `index_employee_bank_details_on_bank_id` (`bank_id`),
  CONSTRAINT `fk_rails_057a480c74` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  CONSTRAINT `fk_rails_fad6a5bc7d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_categories`
--

DROP TABLE IF EXISTS `employee_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'1.0','Director',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48',NULL),(2,'2.0','Staff',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48',NULL),(3,'3.0','Worker',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48',NULL);
/*!40000 ALTER TABLE `employee_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_code_masters`
--

DROP TABLE IF EXISTS `employee_code_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_code_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_code_masters`
--

LOCK TABLES `employee_code_masters` WRITE;
/*!40000 ALTER TABLE `employee_code_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_code_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_daily_activities`
--

DROP TABLE IF EXISTS `employee_daily_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_daily_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `project_master_id` int(11) DEFAULT NULL,
  `today_activity` text COLLATE utf8_unicode_ci,
  `tomorrow_plan` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `day` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_daily_activities_on_employee_id` (`employee_id`),
  KEY `index_employee_daily_activities_on_project_master_id` (`project_master_id`),
  CONSTRAINT `fk_rails_3247428dc6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_acada942e0` FOREIGN KEY (`project_master_id`) REFERENCES `project_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_daily_activities`
--

LOCK TABLES `employee_daily_activities` WRITE;
/*!40000 ALTER TABLE `employee_daily_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_daily_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_designations`
--

DROP TABLE IF EXISTS `employee_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,'1.0','Accounts Executive',NULL,NULL,'2017-05-11 14:19:11','2017-05-11 14:19:11'),(2,'2.0','Analyst',NULL,NULL,'2017-05-11 14:19:11','2017-05-11 14:19:11'),(3,'3.0','Analyst - Salesforce',NULL,NULL,'2017-05-11 14:19:11','2017-05-11 14:19:11'),(4,'4.0','Analyst - Social Media',NULL,NULL,'2017-05-11 14:19:11','2017-05-11 14:19:11'),(5,'5.0','Analyst – Data Analytics',NULL,NULL,'2017-05-11 14:19:11','2017-05-11 14:19:11'),(6,'6.0','Assistant Manager',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(7,'7.0','Assistant Manager - Administration',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(8,'8.0','Assistant Manager - Finance',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(9,'9.0','Assistant Manager - HR Operations',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(10,'10.0','Assistant Manager – Human Resources',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(11,'11.0','Assistant Manager – Quality',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(12,'12.0','Assistant Project Manager',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(13,'13.0','Assistant Vice President - COE',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(14,'14.0','Assistant Vice President – Market Research',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(15,'15.0','Associate Analyst',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(16,'16.0','Associate Content Specialist',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(17,'17.0','Associate Director - Global Sales',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(18,'18.0','Associate Project Manager',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(19,'19.0','Associate Vice President – Automation and Solutions',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(20,'20.0','AVP',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(21,'21.0','AVP - Automation',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(22,'22.0','AVP - Research',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(23,'23.0','AVP - Sales',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(24,'24.0','AVP - Special Projects',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(25,'25.0','AVP- Research',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(26,'26.0','BI Engineer',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(27,'27.0','Big Data Engineer',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(28,'28.0','Business Development Executive',NULL,NULL,'2017-05-11 14:19:12','2017-05-11 14:19:12'),(29,'29.0','Business Development Manager',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(30,'30.0','CEO',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(31,'31.0','Client Relationship Manager',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(32,'32.0','COO',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(33,'33.0','Data Analyst',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(34,'34.0','Data Scientist',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(35,'35.0','Database Architect',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(36,'36.0','Delivery Lead – Data Analytics',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(37,'37.0','Deputy Manager - Finance',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(38,'38.0','Digital Marketing Head',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(39,'39.0','Director',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(40,'40.0','Director - ICT',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(41,'41.0','Executive - Data Processing',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(42,'42.0','Executive - HR & Talent Acquisition',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(43,'43.0','Executive – Human Resources',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(44,'44.0','Front Office Executive',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(45,'45.0','Graphic Designer',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(46,'46.0','Head - Human Resources & Administration',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(47,'47.0','Head Finance',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(48,'48.0','Inside Sales Consultant: Pharma and Life Science',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(49,'49.0','IT Analyst',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(50,'50.0','Junior Analyst',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(51,'51.0','Junior Data Scientist',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(52,'52.0','Junior Graphic Designer',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(53,'53.0','Lead Analyst',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(54,'54.0','Lead Developer',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(55,'55.0','Lead Sales Analyst',NULL,NULL,'2017-05-11 14:19:13','2017-05-11 14:19:13'),(56,'56.0','Manager - Accounts',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(57,'57.0','Manager - Finance',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(58,'58.0','Manager - Human Resources',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(59,'59.0','Manager - IT',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(60,'60.0','Manager - Market Research',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(61,'61.0','Manager - Quality  & Engagement',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(62,'62.0','Manager - Strategic Marketing',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(63,'63.0','Manager - Transitions',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(64,'64.0','Manager – HR & Talent Acquisition',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(65,'65.0','Manager – HR Operations',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(66,'66.0','Manager – Human Resources',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(67,'67.0','Office Assistant',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(68,'68.0','Office Driver',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(69,'69.0','Practice Leader',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(70,'70.0','Primary Research Analyst',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(71,'71.0','Primary Research Analyst - German',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(72,'72.0','Primary Research Analyst – Spanish and German',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(73,'73.0','Project Lead',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(74,'74.0','Project Manager',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(75,'75.0','Quality Analyst',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(76,'76.0','Reporting Specialist',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(77,'77.0','Research Analyst',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(78,'78.0','Senior Analyst',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(79,'79.0','Senior Analyst - Social Media',NULL,NULL,'2017-05-11 14:19:14','2017-05-11 14:19:14'),(80,'80.0','Senior Business Development Executive',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(81,'81.0','Senior Content Editor',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(82,'82.0','Senior Data Scientist',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(83,'83.0','Senior Developer',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(84,'84.0','Senior Editor',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(85,'85.0','Senior Executive - Human Resources',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(86,'86.0','Senior Financial Analyst',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(87,'87.0','Senior Graphic Designer',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(88,'88.0','Senior Manager',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(89,'89.0','Senior Manager - Finance',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(90,'90.0','Senior Manager - Market Research',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(91,'91.0','Senior Manager - Recruitments',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(92,'92.0','Senior Manager – Application Development',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(93,'93.0','Senior Primary Research Analyst',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(94,'94.0','Senior Primary Research Analyst - Japanese',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(95,'95.0','Senior Primary Research Analyst - Spanish',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(96,'96.0','Senior Quality Analyst',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(97,'97.0','Senior System Administrator',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(98,'98.0','Senior Vice President - Analytics',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(99,'99.0','Senior Vice President - Investment Research',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(100,'100.0','Software Developer',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(101,'101.0','SQL Developer',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(102,'102.0','System Administrator',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(103,'103.0','Team Lead',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(104,'104.0','Team lead - Data Processing',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(105,'105.0','Team Leader',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(106,'106.0','VBA developer',NULL,NULL,'2017-05-11 14:19:15','2017-05-11 14:19:15'),(107,'107.0','Vice President - BR',NULL,NULL,'2017-05-11 14:19:16','2017-05-11 14:19:16'),(108,'108.0','Vice President - Business Development',NULL,NULL,'2017-05-11 14:19:16','2017-05-11 14:19:16'),(109,'109.0','Vice President - Product Development & Marketing',NULL,NULL,'2017-05-11 14:19:16','2017-05-11 14:19:16'),(110,'110.0','Web Developer',NULL,NULL,'2017-05-11 14:19:16','2017-05-11 14:19:16');
/*!40000 ALTER TABLE `employee_designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_documents`
--

DROP TABLE IF EXISTS `employee_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_documents_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_b48cbff66c` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_documents`
--

LOCK TABLES `employee_documents` WRITE;
/*!40000 ALTER TABLE `employee_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_goals`
--

DROP TABLE IF EXISTS `employee_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_perspective_id` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_weightage` int(11) DEFAULT NULL,
  `difficulty_level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `goal_measure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `allign_to_supervisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `emp_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_goals_on_employee_id` (`employee_id`),
  KEY `index_employee_goals_on_goal_perspective_id` (`goal_perspective_id`),
  KEY `index_employee_goals_on_period_id` (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_goals`
--

LOCK TABLES `employee_goals` WRITE;
/*!40000 ALTER TABLE `employee_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_gps`
--

DROP TABLE IF EXISTS `employee_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_gps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_gps`
--

LOCK TABLES `employee_gps` WRITE;
/*!40000 ALTER TABLE `employee_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_gps_histories`
--

DROP TABLE IF EXISTS `employee_gps_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_gps_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_gp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_gps_histories`
--

LOCK TABLES `employee_gps_histories` WRITE;
/*!40000 ALTER TABLE `employee_gps_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_gps_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_grades`
--

DROP TABLE IF EXISTS `employee_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'1.0','A',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(2,'2.0','B',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(3,'3.0','C',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(4,'4.0','D',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(5,'5.0','E',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(6,'6.0','F',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(7,'7.0','G',NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48');
/*!40000 ALTER TABLE `employee_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leav_balances`
--

DROP TABLE IF EXISTS `employee_leav_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_leav_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `company_leav_id` int(11) DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `total_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_balances_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_balances_on_leav_category_id` (`leav_category_id`),
  KEY `index_employee_leav_balances_on_company_leav_id` (`company_leav_id`),
  CONSTRAINT `fk_rails_258306096f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_42e9a9a920` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_4a35bc0115` FOREIGN KEY (`company_leav_id`) REFERENCES `company_leavs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_leav_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leav_requests`
--

DROP TABLE IF EXISTS `employee_leav_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_leav_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `date_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_day` int(11) DEFAULT NULL,
  `leave_count` decimal(5,1) DEFAULT NULL,
  `first_half` tinyint(1) DEFAULT NULL,
  `last_half` tinyint(1) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_first_approved` tinyint(1) DEFAULT NULL,
  `is_second_approved` tinyint(1) DEFAULT NULL,
  `is_first_rejected` tinyint(1) DEFAULT NULL,
  `is_second_rejected` tinyint(1) DEFAULT NULL,
  `current_status` int(11) DEFAULT NULL,
  `current_status1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `present_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_requests_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_requests_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_36b7682875` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_76a71d5b78` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_requests`
--

LOCK TABLES `employee_leav_requests` WRITE;
/*!40000 ALTER TABLE `employee_leav_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_leav_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_monthly_days`
--

DROP TABLE IF EXISTS `employee_monthly_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_monthly_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `overtime` decimal(4,1) DEFAULT NULL,
  `no_of_working_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_monthly_days_on_employee_id` (`employee_id`),
  KEY `index_employee_monthly_days_on_year_id` (`year_id`),
  CONSTRAINT `fk_rails_0f9fb3fb16` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_5b1b078bf8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_monthly_days`
--

LOCK TABLES `employee_monthly_days` WRITE;
/*!40000 ALTER TABLE `employee_monthly_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_monthly_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_nominations`
--

DROP TABLE IF EXISTS `employee_nominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_nominations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomination_master_id` int(11) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  `nomination` decimal(10,0) DEFAULT NULL,
  `mental_illness` tinyint(1) DEFAULT NULL,
  `minor` tinyint(1) DEFAULT NULL,
  `guardian_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `same_address` tinyint(1) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `relation_master_id` int(11) DEFAULT NULL,
  `illness_type_id` int(11) DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_nominations_on_nomination_master_id` (`nomination_master_id`),
  KEY `index_employee_nominations_on_family_id` (`family_id`),
  KEY `index_employee_nominations_on_district_id` (`district_id`),
  KEY `index_employee_nominations_on_state_id` (`state_id`),
  KEY `index_employee_nominations_on_country_id` (`country_id`),
  KEY `index_employee_nominations_on_employee_id` (`employee_id`),
  KEY `index_employee_nominations_on_relation_master_id` (`relation_master_id`),
  KEY `index_employee_nominations_on_illness_type_id` (`illness_type_id`),
  CONSTRAINT `fk_rails_274288ef05` FOREIGN KEY (`relation_master_id`) REFERENCES `relation_masters` (`id`),
  CONSTRAINT `fk_rails_306f672001` FOREIGN KEY (`nomination_master_id`) REFERENCES `nomination_masters` (`id`),
  CONSTRAINT `fk_rails_534510336c` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_57674930be` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_5f640c6edc` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`),
  CONSTRAINT `fk_rails_60bbfeb69b` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_b6a79415fd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_e303215b65` FOREIGN KEY (`illness_type_id`) REFERENCES `illness_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_nominations`
--

LOCK TABLES `employee_nominations` WRITE;
/*!40000 ALTER TABLE `employee_nominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_nominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_physicals`
--

DROP TABLE IF EXISTS `employee_physicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_physicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trouser_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_physicals_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_afc1e2eb73` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_physicals`
--

LOCK TABLES `employee_physicals` WRITE;
/*!40000 ALTER TABLE `employee_physicals` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_physicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_promotions`
--

DROP TABLE IF EXISTS `employee_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `employee_category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_ctc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_promotions_on_employee_id` (`employee_id`),
  KEY `index_employee_promotions_on_department_id` (`department_id`),
  KEY `index_employee_promotions_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_employee_promotions_on_employee_grade_id` (`employee_grade_id`),
  CONSTRAINT `fk_rails_093db97005` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_19e6edf49d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_44a698c5ef` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_7727124d94` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_promotions`
--

LOCK TABLES `employee_promotions` WRITE;
/*!40000 ALTER TABLE `employee_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_resignations`
--

DROP TABLE IF EXISTS `employee_resignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_resignations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_notice_period` tinyint(1) DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tentative_leaving_date` date DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `exit_interview_date` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `leaving_date` date DEFAULT NULL,
  `settled_on` date DEFAULT NULL,
  `has_left` tinyint(1) DEFAULT NULL,
  `notice_served` tinyint(1) DEFAULT NULL,
  `rehired` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `leaving_reason_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `resign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_stop_pay_request` tinyint(1) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_first_approved` tinyint(1) DEFAULT NULL,
  `is_second_approved` tinyint(1) DEFAULT NULL,
  `is_final_approved` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_first_rejected` tinyint(1) DEFAULT NULL,
  `is_second_rejected` tinyint(1) DEFAULT NULL,
  `is_final_rejected` tinyint(1) DEFAULT NULL,
  `application_date` datetime DEFAULT NULL,
  `final_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  `change_status_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_resignations_on_employee_id` (`employee_id`),
  KEY `index_employee_resignations_on_leaving_reason_id` (`leaving_reason_id`),
  KEY `index_employee_resignations_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_934242d84f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b49e6901c2` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
  CONSTRAINT `fk_rails_f852fce031` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_resignations`
--

LOCK TABLES `employee_resignations` WRITE;
/*!40000 ALTER TABLE `employee_resignations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_resignations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_salary_templates`
--

DROP TABLE IF EXISTS `employee_salary_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_salary_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salary_template_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `percentage` decimal(15,2) DEFAULT NULL,
  `is_taxable` tinyint(1) DEFAULT NULL,
  `tax` decimal(4,2) DEFAULT NULL,
  `base` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_be_paid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_amount` decimal(15,2) DEFAULT NULL,
  `monthly_amount` decimal(15,2) DEFAULT '0.00',
  `annual_amount` decimal(15,2) DEFAULT '0.00',
  `employee_template_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `parent_salary_component_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_salary_templates_on_employee_id` (`employee_id`),
  KEY `index_employee_salary_templates_on_salary_template_id` (`salary_template_id`),
  KEY `index_employee_salary_templates_on_salary_component_id` (`salary_component_id`),
  KEY `index_employee_salary_templates_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_0a4494cbdd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7f73b6d393` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_98548e5d4d` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_9cd9c2068b` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_templates`
--

LOCK TABLES `employee_salary_templates` WRITE;
/*!40000 ALTER TABLE `employee_salary_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_salary_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_shifts`
--

DROP TABLE IF EXISTS `employee_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_shifts_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_95ddeaeee5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_shifts`
--

LOCK TABLES `employee_shifts` WRITE;
/*!40000 ALTER TABLE `employee_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_shifts_shift_rotations`
--

DROP TABLE IF EXISTS `employee_shifts_shift_rotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_shifts_shift_rotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_rotation_id` int(11) DEFAULT NULL,
  `employee_shift_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_shifts_shift_rotations_on_shift_rotation_id` (`shift_rotation_id`),
  KEY `index_employee_shifts_shift_rotations_on_employee_shift_id` (`employee_shift_id`),
  CONSTRAINT `fk_rails_a5d9cf9efc` FOREIGN KEY (`employee_shift_id`) REFERENCES `employee_shifts` (`id`),
  CONSTRAINT `fk_rails_e23dbd4177` FOREIGN KEY (`shift_rotation_id`) REFERENCES `shift_rotations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_shifts_shift_rotations`
--

LOCK TABLES `employee_shifts_shift_rotations` WRITE;
/*!40000 ALTER TABLE `employee_shifts_shift_rotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_shifts_shift_rotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_task_to_dos`
--

DROP TABLE IF EXISTS `employee_task_to_dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_task_to_dos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `task_name` text COLLATE utf8_unicode_ci,
  `task_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `task_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `task_time1` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_task_to_dos_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9618f9aae8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_task_to_dos`
--

LOCK TABLES `employee_task_to_dos` WRITE;
/*!40000 ALTER TABLE `employee_task_to_dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_task_to_dos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_templates`
--

DROP TABLE IF EXISTS `employee_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salary_template_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `gross_salary` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_templates_on_employee_id` (`employee_id`),
  KEY `index_employee_templates_on_salary_template_id` (`salary_template_id`),
  CONSTRAINT `fk_rails_345d7764cd` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`),
  CONSTRAINT `fk_rails_a270a364c5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_templates`
--

LOCK TABLES `employee_templates` WRITE;
/*!40000 ALTER TABLE `employee_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_transfers`
--

DROP TABLE IF EXISTS `employee_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_transfers_on_employee_id` (`employee_id`),
  KEY `index_employee_transfers_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_employee_transfers_on_employee_category_id` (`employee_category_id`),
  KEY `index_employee_transfers_on_company_id` (`company_id`),
  KEY `index_employee_transfers_on_company_location_id` (`company_location_id`),
  KEY `index_employee_transfers_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_1859764c73` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_24f06056d0` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_29dbc3205b` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_3688aa89b6` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_75445f8c10` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_b36922fdd3` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_transfers`
--

LOCK TABLES `employee_transfers` WRITE;
/*!40000 ALTER TABLE `employee_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_types`
--

DROP TABLE IF EXISTS `employee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (1,'1.0','Trainee',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(2,'2.0','Permanent',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(3,'3.0','Probation ',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(4,'4.0','Confirmed',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48'),(5,'5.0','Resigned',NULL,NULL,'2017-05-11 13:50:48','2017-05-11 13:50:48');
/*!40000 ALTER TABLE `employee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_week_offs`
--

DROP TABLE IF EXISTS `employee_week_offs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_week_offs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_off_master_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_week_offs_on_week_off_master_id` (`week_off_master_id`),
  KEY `index_employee_week_offs_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_4e2c1bbc27` FOREIGN KEY (`week_off_master_id`) REFERENCES `week_off_masters` (`id`),
  CONSTRAINT `fk_rails_f68e39d463` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_week_offs`
--

LOCK TABLES `employee_week_offs` WRITE;
/*!40000 ALTER TABLE `employee_week_offs` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_week_offs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeer_esics`
--

DROP TABLE IF EXISTS `employeer_esics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeer_esics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esic_date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `actual_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employeer_esics_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeer_esics`
--

LOCK TABLES `employeer_esics` WRITE;
/*!40000 ALTER TABLE `employeer_esics` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeer_esics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeer_pfs`
--

DROP TABLE IF EXISTS `employeer_pfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeer_pfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `pf_date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actual_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employeer_pfs_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeer_pfs`
--

LOCK TABLES `employeer_pfs` WRITE;
/*!40000 ALTER TABLE `employeer_pfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeer_pfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manual_employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employees` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optinal_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin_code` int(11) DEFAULT NULL,
  `current_address` text COLLATE utf8_unicode_ci,
  `adhar_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licence_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `handicap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handicap_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `punch_card_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_code_master_id` int(11) DEFAULT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `manager_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employees_on_employee_code` (`employee_code`),
  KEY `index_employees_on_country_id` (`country_id`),
  KEY `index_employees_on_state_id` (`state_id`),
  KEY `index_employees_on_district_id` (`district_id`),
  KEY `index_employees_on_blood_group_id` (`blood_group_id`),
  KEY `index_employees_on_employee_type_id` (`employee_type_id`),
  KEY `index_employees_on_nationality_id` (`nationality_id`),
  KEY `index_employees_on_religion_id` (`religion_id`),
  KEY `index_employees_on_manager_id` (`manager_id`),
  KEY `index_employees_on_company_id` (`company_id`),
  KEY `index_employees_on_company_location_id` (`company_location_id`),
  KEY `index_employees_on_department_id` (`department_id`),
  KEY `index_employees_on_punch_card_id` (`punch_card_id`),
  KEY `index_employees_on_employee_code_master_id` (`employee_code_master_id`),
  CONSTRAINT `fk_rails_0025f65a97` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_0e6f1ceeeb` FOREIGN KEY (`employee_code_master_id`) REFERENCES `employee_code_masters` (`id`),
  CONSTRAINT `fk_rails_0f20a81443` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_44cfcfba34` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_6242475258` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_7c42420282` FOREIGN KEY (`punch_card_id`) REFERENCES `punch_cards` (`id`),
  CONSTRAINT `fk_rails_7fb9aac7a3` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `fk_rails_8587c7b912` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_aff313c1b7` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_c3ceaae2da` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  CONSTRAINT `fk_rails_eb26439f43` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','EMP0000001',NULL,NULL,'Sushant',NULL,'Gupta','1967-09-24','Male','9890016447',NULL,'sushant@sganalytics.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AHRPG0717C',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,10,NULL,'2017-05-12 09:39:48','2017-05-12 09:39:48',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2','EMP0000002',NULL,NULL,'Simran',NULL,'Wadhwa','1983-11-20','Female','9850248555',NULL,'simran@sganalytics.com','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','AAYPW3067B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:39:48','2017-05-12 09:39:48',NULL,NULL,NULL,NULL,NULL,NULL),(3,'4','EMP0000003',NULL,NULL,'Rahul',NULL,'Sowani','1982-02-18','Male','9850069823',NULL,'rahul@sganalytics.com','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','BHRPS9517B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(4,'5','EMP0000004',NULL,NULL,'Shrikrishna',NULL,'Bawachkar','1981-12-19','Male','9765830856',NULL,'shrikrishna@sganalytics.com','Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth',1,20,504,'Pune',411030,'Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth, Pune 30','0','AMTPB5555G',NULL,'Married',7,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(5,'33','EMP0000005',NULL,NULL,'Ashok',NULL,'Kumar','1988-03-05','Male','9579647553',NULL,'ashok@sganalytics.com','Vill. Kakkar PO. Chandruhi Teh.',1,NULL,NULL,'Hamirpur',177024,'Willam Nagar Omkar Colony S.No. 9/1 Amrut Apartment Pimple Gurave Pune - 411027','0','AYXPK8982E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(6,'34','EMP0000006',NULL,NULL,'Suryakant',NULL,'Sutar','1983-05-23','Male','9011582323',NULL,'surya@sganalytics.com','S/n 74, New Sangavi, Samarth Nagar, Near TATA Indicom Tower',1,20,504,'Pune',411027,'S/n 74, New Sangavi, Samarth Nagar, Near TATA indicom tower, Pune 27','0','BDGPS7033F',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(7,'37','EMP0000007',NULL,NULL,'Anil',NULL,'Bhote','1984-03-19','Male','9604609338',NULL,'anil@sganalytics.com','Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale',1,20,504,'Talegaon Dabhade',410507,'Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale, Talegaon Dabhade - 410507','0','ANHPB3506E',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(8,'40','EMP0000008',NULL,NULL,'Santosh',NULL,'Dhande','1984-08-31','Male','9028892681',NULL,'santosh@sganalytics.com','Radha Krishna Niwas, Shiv Colony, Warale Road, Tal. Mawal',1,20,504,'Talegaon Dhabhade',410507,'Radha Krishna Niwas, Plt. No. 369,  Shiv colony, Warale road, Near Kohinoor Begonia Estate,Talegaon Dabhade, Tal. Maval, Dist. Pune,Pin. 410507.','0','AKDPD6744R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:49','2017-05-12 09:39:49',NULL,NULL,NULL,NULL,NULL,NULL),(9,'44','EMP0000009',NULL,NULL,'Umesh',NULL,'Shelar','1985-12-24','Male','9960258387',NULL,'umesh@sganalytics.com','At – Sherpe (Patilwadi),  Post – Kurangavane',1,20,NULL,'Kankavli',416703,'C/o – Anurath Kisan Sherkhane , Sr. No. 59/2 B 1, Near Raigad Colony,Gulmohar Colony, Rahatani, Pune 411 017','0','BHOPS9509L',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(10,'51','EMP0000010',NULL,NULL,'Umed',NULL,'Padghan (Patil)','1980-12-27','Male','9960641806',NULL,'umedpatil@sganalytics.com','At Post Mera B.K.',1,20,NULL,'Chikhali',443201,'Flat No- 4, Krushnavel Apt, Plot No 15, Girija Society, Kothrud, Pune-38','0','ARZPP3982E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(11,'61','EMP0000011',NULL,NULL,'Ravi',NULL,'Vitkar','1989-06-15','Male','9923647439',NULL,'NA','101, Lalchal, Kusalkar Putala, Gokhale Nagar',1,20,NULL,'Pune',411016,'101, Lalchal, Kusalkar Putala, Gokhale Nagar, Pune 411 016.','0','AHYPV4125G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,1,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(12,'139','EMP0000012',NULL,NULL,'Ahmed',NULL,'Hakki','1962-05-27','Male','41795761586',NULL,'ahakki@sganalytics.com','Burain 12, 8803 Rüschlikon',NULL,NULL,NULL,NULL,0,'Burain 12, 8803 Rüschlikon, Switzerland       ','0','NA',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(13,'50','EMP0000013',NULL,NULL,'Pradip',NULL,'Chowdhary','1982-01-08','Male','9860484814',NULL,'pradip@sganalytics.com','At Khedi Tal',1,20,NULL,NULL,0,'B-12,Wagheshwar Nagar,Near Wagheshwar Temple Wagholi, Tal-Haveli, Dist-Pune','0','AHWPC3011G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(14,'185','EMP0000014',NULL,NULL,'Abhishek',NULL,'Bagrodia','1987-06-13','Male','9823011026',NULL,'abhishek.bagrodia@sganalytics.com','E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilakh',1,20,504,'Pune',411007,'E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilkah, Pune-411007\n','0','AJJPB7169D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:50','2017-05-12 09:39:50',NULL,NULL,NULL,NULL,NULL,NULL),(15,'191','EMP0000015',NULL,NULL,'Ashvarya',NULL,'Verma','1985-01-03','Male','9987549821',NULL,'ashvarya.verma@sganalytics.com','F-1/44 Manas Apartment, Old Ashoka Garden, Behind Prabhat Petrol Pump',1,23,550,'Bhopal',462023,'B-4, Deokar Residency, Near Green Thing Restaurant, Wadgaon Sheri, Pune - 411014','0','AJJPV0966A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(16,'221','EMP0000016',NULL,NULL,'Ashish',NULL,'Tendulkar','1979-08-06','Male','9820953312',NULL,'ashish.tendulkar@sganalytics.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,486,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','ADKPT0104D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(17,'222','EMP0000017',NULL,NULL,'Sameer',NULL,'Tendulkar','1979-08-06','Male','9820953329',NULL,'sameer.tendulkar@sganalytics.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,486,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','AEVPT9801R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(18,'265','EMP0000018',NULL,NULL,'Divya',NULL,'Prasad','1982-09-08','Female','9049870545',NULL,'divya.prasad@sganalytics.com','48/2,Dhanlaxmi Society,Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri',1,20,504,'Pune',411014,'48/2,Dhanlaxmi Society,Ganesh Nagar,Near Anand Park bus stop,Vadgaonsheri, Pune -411014','0','AASPU9653K',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(19,'277','EMP0000019',NULL,NULL,'Roohul',NULL,'Kapadiya','1989-05-28','Male','7798842427',NULL,'roohul.kapadia@sganalytics.com','2/3076/78, Hidayat Manzil, Sagrampura, Sindhiwaad',1,12,NULL,'Surat',395003,'Jagdamba Society, Nr. Bora Classes, Somnath Nagar, Vadgaon Sheri, Pune-411006, Maharashtra.','0','AUZPK4035C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(20,'281','EMP0000020',NULL,NULL,'Ninad',NULL,'Kadake','1980-11-04','Male','9763775428',NULL,'ninad.kadake@sganalytics.com','12 D, Shankar Chhaya Apartment, Near Mhatre Bridge, Erandwane',1,20,504,'Pune',411004,'12 D Shankar Chhaya Apartment Near Mhatre Bridge Erandwane Pune. 411 004.','0','AYBPK7303F',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(21,'282','EMP0000021',NULL,NULL,'Gunjan',NULL,'Bhatt','1980-11-15','Male','9561826233',NULL,'gunjan.bhatt@sganalytics.com','78/465 Vijaynagar, Naranpura',1,12,NULL,'Ahmedabad',380013,'G-304, Daffodils, Magarpatta City – 411013','0','AFXPB0304A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(22,'290','EMP0000022',NULL,NULL,'Krashna',NULL,'Patharakar','1987-05-04','Male','9823385435',NULL,'krushna.patharakar@sganalytics.com','Priti Niwas, Kranti chowk, Main road',1,20,NULL,'Kille Dharur',0,'Flat no.6, bldg 2, Salokha hsg soc. Near BSNL office, off Satara road, pune 411009','0','BRMPP5843C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(23,'295','EMP0000023',NULL,NULL,'Sonal',NULL,'Mamtora','1981-08-17','Female','9158887753',NULL,'sonal.mamtora@sganalytics.com','Flat no. 604, B Wing, Dhavel Windscapess Cooperative Housing Society, Hingle Mala Road, Sasane Nagar, Hadapsar',1,20,504,NULL,411028,'Flat no. 604, B wing, Dhavel WindscapessCooperative housing society, Hingle Mala Road(Behind New English High School), Sasane Nagar, Hadapsar Pune 411028','0','AKAPM5674N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:39:51','2017-05-12 09:39:51',NULL,NULL,NULL,NULL,NULL,NULL),(24,'296','EMP0000024',NULL,NULL,'Nayanjyoti',NULL,'Das','1981-01-30','Male','9833979018',NULL,'nayanjyoti.das@sganalytics.com','House No.33, Sandhyachal Nagar, Lalmati, Beltola',1,4,NULL,'Guwahati',781028,'B2/302, Lunkad Gold Coast, Viman Nagar, Pune - 411014, Maharashtra','0','AIFPD0419H',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(25,'298','EMP0000025',NULL,NULL,'Suhrid',NULL,'Barua','1975-11-21','Male','9970186748',NULL,'suhrid.barua@sganalytics.com','KKB Road Chenikuthi \'Rupan\'',1,4,NULL,'Guwahati',781003,'Ganga Kunj Society H Block 201 Kalas Vishrantwadi Alandi Road Pune 411015','0','AIKPB6845Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(26,'304','EMP0000026',NULL,NULL,'Jyoti',NULL,'Huria','1985-02-18','Female','9764571611',NULL,'jyoti.huria@sganalytics.com','13/450, BTI Road',1,23,NULL,'Panna',488001,'H.No-307,48/2,Raj Palace,Dhanalaxmi Society ganesg nagar wadgaon sheri Pune','0','CIXPS6425E',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(27,'305','EMP0000027',NULL,NULL,'Mayuresh',NULL,'Wagh','1982-05-21','Male','9823294888',NULL,'mayuresh.wagh@sganalytics.com','53, Mukund Nagar, Shree Ahireshwar Wadi',1,20,504,'Pune',411037,'53, Mukund Nagar, Shree Ahireshwar Wadi, Pune 411037','0','AAPPW7193R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(28,'310','EMP0000028',NULL,NULL,'Varun',NULL,'Goela','1984-08-20','Male','7709378001',NULL,'varun.goela@sganalytics.com','5,B-3, Bhamashah Marg',1,NULL,NULL,'Delhi',110009,'Flat 302, 4th Floor, Bhakti Apartments, Viman Nagar, Pune','0','AGWPG5937E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(29,'335','EMP0000029',NULL,NULL,'Somnath',NULL,'Raut','1984-12-03','Male','9226389306',NULL,'somnath.raut@sganalytics.com','A/P: Rautwadi',1,20,504,'Shirur',412208,'B-12 2nd Floor, Anand Shri Hos. Soc., Near to Anand Park bus stop, Ganesh Nagar, Vadgoansheri, Pune 411014.','0','AKCPR7284F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(30,'351','EMP0000030',NULL,NULL,'Sneha',NULL,'Shinde','1989-01-29','Female','9096867031',NULL,'sneha.shinde@sganalytics.com','Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada',1,20,504,'Pune',411006,'Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada Pune 411006','0','CHIPS5059Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:52','2017-05-12 09:39:52',NULL,NULL,NULL,NULL,NULL,NULL),(31,'371','EMP0000031',NULL,NULL,'Parth',NULL,'Arora','1983-04-25','Male','8390395821',NULL,'parth.arora@sganalytics.com','C/103 Gala Swing, South Bopal',1,12,170,'Ahmedabad',0,'E 5 / 605 Rohan Mithila ,Near Symbiosis college ,Viman Nagar, Pune - 411014','0','AFAPA4280P',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:53','2017-05-12 09:39:53',NULL,NULL,NULL,NULL,NULL,NULL),(32,'372','EMP0000032',NULL,NULL,'Renuka','Vikram','Vaishnav','1982-08-03','Female','9011086816',NULL,'renuka.vaishnav@sganalytics.com','Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar, Village Mundhwa',1,20,504,'Pune',411036,'Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar,Village Mundhwa, Pune- 411036','0','AOZPM2520A',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:53','2017-05-12 09:39:53',NULL,NULL,NULL,NULL,NULL,NULL),(33,'379','EMP0000033',NULL,NULL,'Bharat',NULL,'Pethe','1981-01-25','Male','9823163549',NULL,'bharat.pethe@sganalytics.com ','432 B Narayan Peth, Amit Prerana Appt, Flat no 302',1,20,504,'Pune',411030,'432 B Narayan Peth, Amit Prerana Appt, Flat no 302, Pune\n-30\n','0','ATBPP9676P',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:53','2017-05-12 09:39:53',NULL,NULL,NULL,NULL,NULL,NULL),(34,'383','EMP0000034',NULL,NULL,'Shrikant',NULL,'Sawant','1981-12-05','Male','9970766699',NULL,'shrikant.sawant@sganalytics.com','C/3 , Pimple Apartments , Kasarwadi ',1,20,504,NULL,411034,'C/3 , Pimple Apartments , Kasarwadi , Pune - 411034','0','BYJPS8885D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:53','2017-05-12 09:39:53',NULL,NULL,NULL,NULL,NULL,NULL),(35,'405','EMP0000035',NULL,NULL,'Prosenjit',NULL,'Ganguly','1981-09-06','Male','9833364060',NULL,'prosenjit.ganguly@sganalytics.com','930/A , Near P & T Gate no 4 , west Niwarganj, Wright Town',1,23,565,'Jabalpur',482002,'Flat 101, Madhusudan society, Off Lane 5, South Main Road, Near Tertulia’s, Koregaon Park, Pune.','0','AJAPG3716A',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:39:53','2017-05-12 09:39:53',NULL,NULL,NULL,NULL,NULL,NULL),(36,'411','EMP0000036',NULL,NULL,'Chaitanya',NULL,'Kanade','1985-01-27','Male','7385219155',NULL,'chaitanya.kanade@sganalytics.com','S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai Gas Agency, Wadgaon Sheri',1,20,504,'Pune',411014,'S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai gas agency, Wadgaonsheri, Pune- 411014.','0','ASTPK1180A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:54','2017-05-12 09:39:54',NULL,NULL,NULL,NULL,NULL,NULL),(37,'413','EMP0000037',NULL,NULL,'Mohammed',NULL,'Khan','1986-09-16','Male','9823616946',NULL,'mohammed.khan@sganalytics.com','38 A ,52, Ashutosh Apartments , Napean Sea Raod',1,20,486,'Mumbai',400006,'Flat 1402, 14th Floor,Tower 12A, Amanora Park Town, Pune - 411028','0','BGXPK5662A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:54','2017-05-12 09:39:54',NULL,NULL,NULL,NULL,NULL,NULL),(38,'439','EMP0000038',NULL,NULL,'Khushboo',NULL,'Gupta','1986-01-15','Female','8380078776',NULL,'khushboo.gupta@sganalytics.com','Flat no 404, Shree Radhey Apartment, opp to MSEB Office, Wardhaman Nagar',1,20,488,'Nagpur',440008,'Wing A3, Flat no. 802, Acolade Society, Opposite Hyundari Showroom, Tukaram Nagar, Kharadi, Pune, Maharashtra 411014','0','AKKPG0871B',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:54','2017-05-12 09:39:54',NULL,NULL,NULL,NULL,NULL,NULL),(39,'444','EMP0000039',NULL,NULL,'Sanjay',NULL,'Ujalambkar','1967-11-20','Male','9922918554',NULL,'sanjay.ujalambkar@sganalytics.com','Flat no - A - 15, Sukhwani Discover, 3rd Floor, Near Sant Nirankari Satsang Bhavan, Vijaynagar, Kalewadi',1,20,504,'Pune',411017,'Flat no - A - 15, Sukhwani Discover,3rd Floor , Near Sant Nirankari Satsang Bhavan, Vijaynagar,Kalewadi,Pune - 411017','0','AAOPU6003F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:39:54','2017-05-12 09:39:54',NULL,NULL,NULL,NULL,NULL,NULL),(40,'448','EMP0000040',NULL,NULL,'Balaji',NULL,'Khandade','1977-03-01','Male','9175000220',NULL,'balaji.khandade@sganalytics.com','Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi',1,20,504,'Pune',411017,'Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi , Pune - 411017','0','AWNPK5452B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:39:54','2017-05-12 09:39:54',NULL,NULL,NULL,NULL,NULL,NULL),(41,'464','EMP0000041',NULL,NULL,'Chandra','Bhanu','Gembali','1986-08-12','Male','8007127868',NULL,'chandra.gembali@sganalytics.com','Pendrani Rise Mills, Jagat Jagani Street',1,26,NULL,'Umerkote',764073,'Pendrani Rise Mills, Jagat Jagani Street, Umerkote 764073, Nabarangapur Dist Odisha','0','AQJPB4244N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(42,'495','EMP0000042',NULL,NULL,'Yogita',NULL,'Wahalkar','1990-01-23','Female','9096809391',NULL,'yogita.wahalkar@sganalytics.com','P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad',1,20,504,'Pune',411033,'P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad, Pune-33','0','ABEPW1646D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(43,'499','EMP0000043',NULL,NULL,'Saket',NULL,'Kumar','1981-04-07','Male','9049988426',NULL,'saket.kumar@sganalytics.com','Flat No. 62, Tulip Appt, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'Flat No. 62, Tulip Appt, Neco garden, Viman Nagar, Pune - 411014','0','AYMPK6852E',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(44,'522','EMP0000044',NULL,NULL,'Vartika',NULL,'Deshma','1992-10-16','Female','8087964076',NULL,'vartika.deshma@sganalytics.com','H.No.2675, Bairagpura',1,35,938,'Mathura',281001,'Tai niwas, Flat no.204, Opp Zensar, Kharadi, Pune','0','BHFPD4443P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(45,'530','EMP0000045',NULL,NULL,'Shashank',NULL,'Kulkarni','1986-09-10','Male','9823883424',NULL,'shashank.kulkarni@sganalytics.com','Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari',1,20,504,'Pune',411041,'Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari 411041','0','BMFPK8112B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(46,'540','EMP0000046',NULL,NULL,'Shrikant',NULL,'Sankpal','1987-04-23','Male','9822513894',NULL,'shrikant.sankpal@sganalytics.com','138, Mangalwar Peth, Opp Raj Auto',1,20,504,'Pune',411011,'138, Mangalwar Peth, Opp Raj Auto, Pune - 411011','0','CNNPS4165E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(47,'542','EMP0000047',NULL,NULL,'Rahil',NULL,'Khan','1981-12-08','Male','9822041473',NULL,'rahil.khan@sganalytics.com','Victoria Mansions,7, Castellino Road',1,20,504,'Pune',411001,'Victoria Mansions, 7, Castellino Road, Pune - 411001','0','APKPK5346N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(48,'546','EMP0000048',NULL,NULL,'Aditya',NULL,'Thard','1988-09-21','Male','9503232902',NULL,'aditya.thard@sganalytics.com','700 / C, Block P, New Alipore',1,36,1008,'Kolkata',700053,'Kumar Padmalaya, Flat no A3/2, Aundh, Near Medipoint Hospital, Pune - 411006','0','AGWPT5140Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(49,'555','EMP0000049',NULL,NULL,'Chandraprakash',NULL,'Sharma','1988-08-30','Male','9673727597',NULL,'chandraprakash.sharma@sganalytics.com','S.No 79/1 CTS 038, 10 Near Marathi School, Kalewadi',1,20,504,'Pune',411017,'S.No 79/1 CTS 038,10 Near Marathi School,Kalewadi,Pune','0','CIFPS1598N',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:55','2017-05-12 09:39:55',NULL,NULL,NULL,NULL,NULL,NULL),(50,'556','EMP0000050',NULL,NULL,'Amit',NULL,'Fartode','1988-11-16','Male','9975708420',NULL,'amit.fartode@sganalytics.com','26 Forest Colony, Yashoda Nagar',1,20,433,'Amravati',444602,'201 - B,Seetai Corner, Opposite DSK Toyota Showroom,Mumbai - Bangalore High way, Bavdhan, Pune - 411021','0','ABBPF8738L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:56','2017-05-12 09:39:56',NULL,NULL,NULL,NULL,NULL,NULL),(51,'557','EMP0000051',NULL,NULL,'Suchit',NULL,'Nasre','1986-08-21','Male','8600634098',NULL,'suchit.nasre@sganalytics.com','Raghunandan, 24/25Arya Nagar, Koradi Road, Behind Octroi Naka',1,20,488,'Nagpur',440030,'Flat no 105, Wing A, Goodwill Galaxy, Munjaba Wasti, Opposite RK Puram, Tingre Nagar, Pune','0','AHHPN1971D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:56','2017-05-12 09:39:56',NULL,NULL,NULL,NULL,NULL,NULL),(52,'558','EMP0000052',NULL,NULL,'Karuna',NULL,'Ovhal','1985-05-03','Female','8007346267',NULL,'karuna.ovhal@sganalytics.com','43020, Pratik Nagar, Vishrantwadi, Yerwada',1,20,504,'Pune',411006,'10/12,Pratik Nagar,Vishrantwadi ,Yerwada,Pune-411006.','0','AAQPO6244G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:56','2017-05-12 09:39:56',NULL,NULL,NULL,NULL,NULL,NULL),(53,'563','EMP0000053',NULL,NULL,'Sneha',NULL,'Govindalwar','1989-02-28','Female','8055639054',NULL,'sneha.govindalwar@sganalytics.com','Chintamani Nagar-3, A-11/29, Bibwewadi',1,20,504,'Pune',411037,'Chintamani Nagar-3,A-11/29,Bibwewadi,Pune - 411037','0','ARMPG3954C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:56','2017-05-12 09:39:56',NULL,NULL,NULL,NULL,NULL,NULL),(54,'566','EMP0000054',NULL,NULL,'Petra',NULL,'Brncalova','1987-03-08','Female','7030523632',NULL,'petra.brncalova@sganalytics.com','Hemmelrather Weg 269, 51377 Leverkusen',NULL,NULL,NULL,NULL,0,'A / F 11, Ganga Park Society, Pingle Vasti, Mundhwa Road, Pune','0','BYJPB4829C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:39:57','2017-05-12 09:39:57',NULL,NULL,NULL,NULL,NULL,NULL),(55,'570','EMP0000055',NULL,NULL,'Pavanprit',NULL,'Singh','1991-05-15','Male','9975207413',NULL,'pavanprit.singh@sganalytics.com','Gulzar Singh, House no 11, Village Malmohri, Naurangabad, Tatn Taran',1,NULL,623,'Amritsar',143401,'Harman House,Ranjeet Nagar,Yerwada, Pune - 411006','0','DSDPS7994K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:57','2017-05-12 09:39:57',NULL,NULL,NULL,NULL,NULL,NULL),(56,'572','EMP0000056',NULL,NULL,'Priya',NULL,'Dikhale','1990-01-02','Female','9975112721',NULL,'priya.dikhale@sganalytics.com','Shriram Nagar, Bldg - B4, Flat no 9, Aundh',1,20,504,'Pune',411007,'Shriram Nagar, Bldg - B4, Flat no 9, Aundh, Pune - 411007','0','BZEPD4523M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:58','2017-05-12 09:39:58',NULL,NULL,NULL,NULL,NULL,NULL),(57,'574','EMP0000057',NULL,NULL,'Gaurav',NULL,'Sharma','1992-04-08','Male','9731139271',NULL,'gaurav.sharma@sganalytics.com','1st Floor, Sampat Building, Airport Road, Vijaynagar, Totu',1,NULL,252,'Shimla',171011,'701, B-3, Oxygen Valley, Near Ravi Garden, Pune-Solapur highway, Manjri BK, PUNE','0','CVWPS3620K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:58','2017-05-12 09:39:58',NULL,NULL,NULL,NULL,NULL,NULL),(58,'575','EMP0000058',NULL,NULL,'Srinivasan',NULL,'Venkatesan','1990-06-16','Male','9920349342',NULL,'srinivasan.venkatesan@sganalytics.com','RDP 1 / 35, Jaiganga CHS, Flat No. 16, Sector 2, Charkop, Kandivali West',1,20,486,'Mumbai',400067,'RDP 1 / 35, Jaiganga CHS, Flat no 16, Sector 2, Charkop, Kandivali West, Mumbai - 400067','0','CEKPS8900K',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(59,'579','EMP0000059',NULL,NULL,'Moses',NULL,'Gaikwad','1986-07-19','Male','8806064076',NULL,'moses.gaikwad@sganalytics.com','Phayer Road, Opp Hutchings School, Bungalow No 10',1,20,504,'Pune',411040,'Phayer Road, Opp Hutchings School, Bungalow no 10, Pune - 411040','0','BKZPG9139E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(60,'580','EMP0000060',NULL,NULL,'Abid',NULL,'Khan','1990-01-15','Male','9657223506',NULL,'abid.khan@sganalytics.com','Village Manjhauli, PO + PS - Dumariya',1,5,99,'Gaya',0,'Village Bhekrai, Nagar Mohalla, Dhamal Vadi, Behind Little Flower School, Sunjnda Complex, Hadapsar, Pune - 411028','0','CCHPK2098B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(61,'582','EMP0000061',NULL,NULL,'Savita',NULL,'Kaintura','1982-12-03','Female','9689865298',NULL,'savita.kaintura@sganalytics.com','B - 252, Prodyogiki Apartment, Plot No 11, Sector 03, Dwarka',1,NULL,NULL,'New Delhi',110078,'C - 28, Isher Apartment, Near Montvertvirt Prestine, Aundh Road, Khadki Station, Pune - 411020','0','ARRPK1789L',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(62,'593','EMP0000062',NULL,NULL,'Swarangi',NULL,'Pandey','1986-09-01','Female','8237103048',NULL,'swarangi.pandey@sganalytics.com','C2 - 301, Brahma Suncity, Wadgaonsheri',1,20,504,'Pune',411014,'C2 - 301, Brahma Suncity, Wadgaonsheri, Pune - 411014','0','BLSPP1053L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(63,'594','EMP0000063',NULL,NULL,'Satish',NULL,'Shinde','1983-11-24','Male','9594321689',NULL,'satish.shinde@sganalytics.com','Harshada Samartha Society, D/9, Pimple Saudagar',1,20,504,'Pune',411027,'Harshada Samartha Society, D/9, Pimple Saudagar, Pune - 411027','0','BMQPS7340A',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(64,'596','EMP0000064',NULL,NULL,'Pankaj',NULL,'Kumar','1988-11-07','Male','8087600279',NULL,'pankaj.kumar@sganalytics.com','H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate',1,NULL,653,'Giddarbaha',152101,'H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate, Giddarbaha, Punjab - 152101','0','AUEPK1376P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(65,'597','EMP0000065',NULL,NULL,'Avinash',NULL,'Kumar','1988-10-17','Male','9013034003',NULL,'avinash.kumar@sganalytics.com','S1, Navy Nagar, Naval Station Karanja',1,20,NULL,'Uran',400704,'S1, Navy Nagar, Naval Station Karanja, Uran, Raigadh, Maharashtra - 400704','0','BKPPK9950D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:39:59','2017-05-12 09:39:59',NULL,NULL,NULL,NULL,NULL,NULL),(66,'598','EMP0000066',NULL,NULL,'Pradnya',NULL,'Bathe','1985-02-02','Female','9421669922',NULL,'pradnya.bathe@sganalytics.com','RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar',1,20,504,'Pune',411028,'RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar, Pune - 411028','0','BBNPB4806L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:00','2017-05-12 09:40:00',NULL,NULL,NULL,NULL,NULL,NULL),(67,'605','EMP0000067',NULL,NULL,'Narendra','Singh','Sidar','1986-02-05','Male','7276403856',NULL,'narendra.singh@sganalytics.com','Q. No.175/S/A, Balco Township',1,NULL,124,'Korba',495634,'Survey no 78/1, Sadguru Niwas, Samarth Nagar, Sai Chowk, navi Sanghvi, Pune - 27','0','FPRPS4688F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:40:00','2017-05-12 09:40:00',NULL,NULL,NULL,NULL,NULL,NULL),(68,'607','EMP0000068',NULL,NULL,'Arvind',NULL,'Kumar','1989-01-03','Male','9175116342',NULL,'arvind.kumar@sganalytics.com','H.no - 25',1,NULL,NULL,'Bagharayadih',833216,'Flat no 103, Mahalaxmi Complex, Vishal nagar, Pimple - Nilakh, Pune - 411025','0','CSOPK1998K',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:00','2017-05-12 09:40:00',NULL,NULL,NULL,NULL,NULL,NULL),(69,'608','EMP0000069',NULL,NULL,'Kamran',NULL,'Ahmad','1980-02-07','Male','9762579155',NULL,'kamran.ahmad@sganalytics.com','H. No. 285/332/3, Sector - 3, Chakia',1,35,889,'Allahabad',211016,'Flat 31, B- II, Kamaldeep Gardens, Kondhwa Khurd, Pune - 411048','0','AKTPA5425E',NULL,'Married',7,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:00','2017-05-12 09:40:00',NULL,NULL,NULL,NULL,NULL,NULL),(70,'609','EMP0000070',NULL,NULL,'Anil',NULL,'Jadhav','1971-01-05','Male','9420861630',NULL,'anil.jadhav@sganalytics.com','Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi',1,20,504,'Pune',411037,'Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi, Pune - 411037','0','ANLPJ8471G',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:00','2017-05-12 09:40:00',NULL,NULL,NULL,NULL,NULL,NULL),(71,'617','EMP0000071',NULL,NULL,'Harshit',NULL,'Tiwari','1985-04-11','Male','9415258837',NULL,'harshit.tiwari@sganalytics.com','D-109,Divya Nagar Colony, Near MMM Engg College',1,35,917,'Gorakhpur',273001,'C - 402, La Goriosa, Wadgaon Sheri, Pune - 411014','0','AJCPT7399G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(72,'620','EMP0000072',NULL,NULL,'Amit',NULL,'Bansal','1987-04-17','Male','9168246460',NULL,'amit.bansal@sganalytics.com','53,Krishna Kunj, Mittal Colony, Khoda Ganeshji Road, Madanganj-kishangarh',1,29,668,'Ajmer',305801,'E-3, 504, Ganga Constella,Near Eon IT Park, Kharadi,Pune - 411014','0','AWGPB8561K',NULL,'Married ',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(73,'626','EMP0000073',NULL,NULL,'Jayesh',NULL,'Awaghade','1988-10-09','Male','9096332262',NULL,'jayesh.awaghade@sganalytics.com','Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road',1,20,504,'Daund',413801,'Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road,Daund, Pune - 413801','0','APSPA6177P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(74,'631','EMP0000074',NULL,NULL,'Priya',NULL,'Khemani','1989-01-16','Female','9764004350',NULL,'priya.khemani@sganalytics.com','B-129, Shivalik Colony, Near Malviya Nagar',1,NULL,NULL,'New Delhi',0,'E-7, 201 Ivy Apartments, Ivy Estate, Wagholi, Pune - 412207','0','AUCPK0151C',NULL,'Married ',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(75,'638','EMP0000075',NULL,NULL,'Omkar',NULL,'Dhavale','1990-10-07','Male','9860200960',NULL,'omkar.dhavale@sganalytics.com','9, Mangesh-Shree Apartment, 1464, Sadashiv Peth',1,20,504,'Pune',411030,'9, Mangesh-Shree Apartment, 1464, Sadashiv Peth, Pune - 411030','0','AKSPD8810F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(76,'641','EMP0000076',NULL,NULL,'Praveen',NULL,'Gaikwad','1983-06-06','Male','9823773324',NULL,'praveen.gaikwad@sganalytics.com','Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori, Near Muchmore Society',1,20,504,'Pune',411015,'Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori,Landmark:Near Muchmore Society, Pune - 411015','0','AJCPG8609C',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(77,'652','EMP0000077',NULL,NULL,'Pradeep','Kumar','Gupta','1990-07-20','Male','9246630625',NULL,'pradeep.kumar@sganalytics.com','Day & Night Medical Complex Opp Forest Off Srikulam',1,2,NULL,'Srikakulam',532001,'Day & Night Medical Complex Opp Forest Off Srikulam - 532001','0','CNPPK8310K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(78,'659','EMP0000078',NULL,NULL,'Laxmikant',NULL,'Waghmare','1982-01-26','Male','9867998594',NULL,'laxmikant.waghmare@sganalytics.com','23, Pawanbhumi Layout, Somalwada Wardha Road',1,20,488,'Nagpur',440025,'Flat No-C-803, Etasha Building, S.NO 45/2A, Handewadi Road, Near Ganga Village, Hadapsar - Pune -411028','0','ABAPW7853L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(79,'661','EMP0000079',NULL,NULL,'Lokendra',NULL,'Bhati','1986-05-09','Male','7836095979',NULL,'lokendra.bhati@sganalytics.com','64/16, Pratap Nagar, Sangaver',1,29,689,'Jaipur',302033,'64/16, Pratap Nagar, Sangaver, Jaipur - 302033','0','ALOPB7215K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(80,'670','EMP0000080',NULL,NULL,'Apurv',NULL,'Singh','1989-07-06','Male','9595517568',NULL,'apurv.singh@sganalytics.com','702, Amber, Nyati Empire, Kharadi',1,20,504,'Pune',411014,'702, Amber, Nyati Empire, Kharadi, Pune -411014','0','BWGPS2911F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:01','2017-05-12 09:40:01',NULL,NULL,NULL,NULL,NULL,NULL),(81,'671','EMP0000081',NULL,NULL,'Vinit',NULL,'Patil','1985-02-09','Male','9890732009',NULL,'vinit.patil@sganalytics.com','5, Sudarshan Colony, South Vasant Nagar',1,20,509,'Sangli',416416,'904, E2, Solacia, Behind Mose College, Wagholi, Pune - 412207','0','ARIPP7619P',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(82,'676','EMP0000082',NULL,NULL,'Ranjit',NULL,'Pawar','1985-09-02','Male','8879846692',NULL,'ranjit.pawar@sganalytics.com','36, Netaji Subash Marg, Rambaug',1,23,564,'Indore',452004,'36, Netaji Subash Marg, Rambaug, Indore, M.P - 452004','0','BOCPP0288N',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(83,'677','EMP0000083',NULL,NULL,'Sheetanshu',NULL,'Mishra','1987-10-08','Male','9540653095',NULL,'sheetanshu.mishra@sganalytics.com','LIG-4 Teacher\'s Colony, Near Nyas Colony',1,23,563,'Itarsi',0,'LIG-4 Teacher\'s Colony, Near Nyas Colony, Itarsi (M.P)','0','AZBPM4383Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(84,'684','EMP0000084',NULL,NULL,'Biswajit',NULL,'Singh(WFH)','1967-11-20','Male','9356277025',NULL,'biswajit.singh@sganalytics.com','178, New Defence Colony, S.A.S. Nagar',1,NULL,NULL,NULL,140603,'178, New Defence Colony,Zirakpur Dist, S.A.S. Nagar,Punjab ‐ 140603','0','ARXPS7679D',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(85,'696','EMP0000085',NULL,NULL,'Vijaya',NULL,'Rathod','1985-10-22','Female','9561588444',NULL,'vijaya.rathod@sganalytics.com','c/o, R.N.Rathod, Rajapeth, Near Tapar Hostel',1,20,433,'Amravati',444606,'c/o, Subramanyam, Flat No 204 B-Wing, Royal Heights, Bhau Patil Road, Pune - 411020 ','0','AOJPR5526F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(86,'701','EMP0000086',NULL,NULL,'Chaitanya',NULL,'Godbole','1989-02-04','Male','9702050257',NULL,'chaitanya.godbole@sganalytics.com','OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road',1,20,492,'Nashik',422013,'OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road, Nashik 422013','0','BCFPG7206Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(87,'702','EMP0000087',NULL,NULL,'Isabell',NULL,'Jenninger','1990-11-22','Female','9764373667',NULL,'isabell.jenninger@sganalytics.com','Seestr,22 13353',NULL,NULL,NULL,'Berlin',0,'Seestr,22 13353 Berlin, Germany.','0','BBBPJ2598D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(88,'703','EMP0000088',NULL,NULL,'Amrit',NULL,'Sinha','1990-08-09','Male','9717544955',NULL,'amrit.sinha@sganalytics.com','301 D, Arya Englave, Road No 15, Patel Nagar, Hatia',1,NULL,300,'Ranchi',834002,'301 D, Arya Englave, Road No 15, Patel Nagar, Hatia, Ranchi - 834002','0','DFIPS3188K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(89,'705','EMP0000089',NULL,NULL,'Mayur',NULL,'Hore','1983-12-06','Male','9620933222',NULL,'mayur.hore@sganalytics.com','Shagun, Behind Asian Radio House, Opp Market Yard',1,20,509,'Sangli',416416,'Shagun, Behind Asian Radio House, Opp Market Yard, Sangli- 416416','0','ABZPH7447L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(90,'706','EMP0000090',NULL,NULL,'Alwyn',NULL,'Shirodkar','1987-12-01','Male','9665809991',NULL,'alwyn.shirodkar@sganalytics.com','House No 1554, Malawadi, Mangaon',1,20,NULL,'Kudal',416519,'C/O Degaonkar Sanjay Gangadhar, S.No. 16/3/2, Flat No .B2-102, Shree Apt, Ambegaon Pathar, Pune - 411046','0','BRIPS7131L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:40:02','2017-05-12 09:40:02',NULL,NULL,NULL,NULL,NULL,NULL),(91,'710','EMP0000091',NULL,NULL,'Sambhaji','(Gopi)','Gaikwad','1988-06-12','Male','9552127539',NULL,'NA','Pandergaon',1,20,501,'Gangakhed',431714,'Sarve No 22/11, Thite Vasti, Kharadi, Pune-14','0','BGLPG7865H',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,1,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(92,'716','EMP0000092',NULL,NULL,'Ancy',NULL,'Johnson','1992-09-18','Female','9179762061',NULL,'ancy.johnson@sganalytics.com','F - 19, Chinav Appartment, Harishankar Puram, Lashkar',1,23,562,'Gwalior',0,'F - 19, Chinav Appartment, Harishankar Puram, Lashkar, Gwalior, MP','0','ASJPJ0976F',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(93,'724','EMP0000093',NULL,NULL,'Aditya',NULL,'Bhadoriya','1989-11-25','Male','8005387723',NULL,'aditya.bhadouriya@sganalytics.com','628/SH/21/B, Shakti Nangar, Behind Harshita Complex',1,35,935,'Lucknow',226016,'628/SH/21/B, Shakti Nangar, Behind Harshita Complex, Lucknow - 226016','0','BFIPB3455A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(94,'729','EMP0000094',NULL,NULL,'Mangesh',NULL,'Dhage','1986-03-05','Male','8149010561',NULL,'mangesh.dhage@sganalytics.com','AT Post: Sagoda',1,20,NULL,'Shegaon',444203,'C/o Eknath Sadhu Zurange SN 43 Pathare Thube Nagar Behind Balaji Hospital Kharadi - 411014','0','ANOPD2213M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(95,'742','EMP0000095',NULL,NULL,'Siddhartha',NULL,'Dongre','1986-09-17','Male','8983333940',NULL,'siddhartha.dongre@sganalytics.com','Vishwanath Rajiv Nagar South, Plot No 24, S. No 203/2B, Vimannagar',1,20,504,'Pune',411014,'Vishwanath Rajiv Nagar South, Plot No 24, S.no 203/2B, Vimannagar, Pune - 411014','0','BACPD6306B',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(96,'748','EMP0000096',NULL,NULL,'Adneya',NULL,'Audhi','1989-12-01','Male','9922346278',NULL,'adneya.audhi@sganalytics.com','43 Kranti Society, Sahakar Nagar - 2',1,20,504,'Pune',411009,'43 Kranti Society, Sahakar Nagar - 2, Pune - 411009','0','ALLPA6763E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(97,'750','EMP0000097',NULL,NULL,'Chetan',NULL,'Pulgam','1986-10-22','Male','8308429280',NULL,'chetan.pulgam@sganalytics.com','1448 Daji Peth',1,20,NULL,'Solapur',413005,'1448 Daji Peth, Solapur - 413005','0','ALSPP1302P',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(98,'751','EMP0000098',NULL,NULL,'Chandra','Mohan','Reddy Gummireddy','1984-07-04','Male','9989244573',NULL,'chandramohan.gummi@sganalytics.com','F. No. 304, VSR Classic - B, Road No - 6, KTR Colony, Nizampet',1,2,737,'Hyderabad',500090,'F. No. 304, VSR Classic - B, Road no - 6, KTR Colony, Nizampet, Hyderabad - 500090','0','AMXPG5831E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(99,'759','EMP0000099',NULL,NULL,'Roshan',NULL,'Dhongade','1985-12-06','Male','9096424248',NULL,'roshan.dhongade@sganalytics.com','Plot No 56, Adarash Nagar Ranala Colony, Kamptee',1,20,488,'Nagpur',0,'Flat No 101, Bwing spectrum Apartment, Bavdhan','0','ATJPD3237A',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:03','2017-05-12 09:40:03',NULL,NULL,NULL,NULL,NULL,NULL),(100,'761','EMP0000100',NULL,NULL,'Ashish',NULL,'Suwarnkar','1988-09-09','Male','9421921091',NULL,'ashish.suwarnkar@sganalytics.com','G-11, Vishwasagar City, Katpur Road',1,20,489,'Latur',413512,'c/o G.P Railkar Flat No 1, Bldg A-2, Khrishna Leela Terrace, Lane - 4 Mahatma Society, Kothrud - 411038','0','DMCPS9217J',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(101,'768','EMP0000101',NULL,NULL,'Steve',NULL,'Salvius','1988-03-04','Male','9701431063',NULL,'steve.salvius@sganalytics.com','310, Ajay Park, Najafgarh',1,20,NULL,'New Delhi',110043,'310, Ajay Park, Najafgarh, New Delhi - 110043','0','CLDPS3830E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(102,'772','EMP0000102',NULL,NULL,'Prashant',NULL,'Chothe','1981-08-06','Male','9892403907',NULL,'prashant.chothe@sganalytics.com','A2 - 303, Tirupati Campus-Ph II, Lane-2, Adarsh Col, Tingre Nagar Rd, Vishrantwadi',1,20,504,'Pune',411015,'A2 - 303, Tirupati Campus-Ph II, Lane-2, Adarsh Col, Tingre Nagar Rd, Vishrantwadi, Pune - 411015','0','AGMPC3282G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(103,'786','EMP0000103',NULL,NULL,'Megha',NULL,'Sharma','1987-04-19','Female','9545591133',NULL,'megha.sharma@sganalytics.com','2223, Sevda Bhawani, Above Shop No 376',1,29,689,'Jaipur',302001,'B-33 Mount N glory, Near Eon it Park, Kharadi, Pune ','0','FDVPS2342E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(104,'788','EMP0000104',NULL,NULL,'Aakash',NULL,'Singh','1990-11-21','Male','8237822534',NULL,'aakash.singh@sganalytics.com','B-127, D-1, Behind Petrol Pump Nepanagar',1,23,NULL,NULL,450221,'304, B9, Mangal Bhairav, Nandeo City, Pune -411041','0','DXJPS9947D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(105,'799','EMP0000105',NULL,NULL,'Vijay',NULL,'Baviskar','1985-08-04','Male','9764462436',NULL,'vijay.baviskar@sganalytics.com','Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar',1,20,504,'Pune',411032,'Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar, Pune - 411032','0','ASJPB7504M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(106,'801','EMP0000106',NULL,NULL,'Sagar',NULL,'Kamire','1980-10-10','Male','8087594018',NULL,'sagar.kamire@sganalytics.com','Dnyan Laxmi Appartment, Flat No 10, Rajarampuri 8th Lane',1,20,479,'Kolhapur',0,'Shree Laxmi Chaya Apppartment, Flat No 301, A Wing, Malwadi Hadapsar Pune.','0','AVDPK7092A',NULL,'Married ',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(107,'802','EMP0000107',NULL,NULL,'Amit',NULL,'Sangewar','1986-03-29','Male','9975133344',NULL,'amit.sangewar@sganalytics.com','Pimple Sadan F/1, Near PCMC School, Kasarwadi',1,20,504,'Pune',411034,'Pimple Sadan F/1, Near PCMC School, Kasarwadi Pune - 411034','0','BJRPS9075C',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:04','2017-05-12 09:40:04',NULL,NULL,NULL,NULL,NULL,NULL),(108,'803','EMP0000108',NULL,NULL,'Safa',NULL,'Burney','1989-12-26','Female','9960840994',NULL,'safa.burney@sganalytics.com','A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar',1,20,504,'Pune',411013,'A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar, Pune - 411013','0','BKTPB8073Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:05','2017-05-12 09:40:05',NULL,NULL,NULL,NULL,NULL,NULL),(109,'806','EMP0000109',NULL,NULL,'Reena',NULL,'Sahu','1985-12-21','Female','8928204300',NULL,'reena.sahu@sganalytics.com','OM Villa, D/O - Shri I.P.Sahu, Near Jai Public School, Hari Nagar, Katulboard',1,NULL,120,'Durg',491001,'Malhar Hostel, S.no 11, Rutuja Park, Karve Nagar, Pune - 411052','0','CEIPS1207M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:05','2017-05-12 09:40:05',NULL,NULL,NULL,NULL,NULL,NULL),(110,'809','EMP0000110',NULL,NULL,'Prerna',NULL,'Rawal','1991-01-08','Female','9922574319',NULL,'prerna.rawal@sganalytics.com','B1,101, Prasad Nagar, Wadgaon Sheri',1,20,504,'Pune',411014,'B1, 101, Prasad Nagar, Wadgaon Sheri, Pune - 411014','0','BYAPR1750D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:05','2017-05-12 09:40:05',NULL,NULL,NULL,NULL,NULL,NULL),(111,'810','EMP0000111',NULL,NULL,'Mradula',NULL,'Kotwani','1990-05-11','Female','8223001920',NULL,'mradula.kotwani@sganalytics.com','Roopmilan, New Market, Pilikothi Road',1,23,583,'Rewa',486001,'K 202, Ruby Park, Parkstreet, Wakad, Pune','0','CRCPK6278F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(112,'811','EMP0000112',NULL,NULL,'Asad',NULL,'Qureshi','1987-06-28','Male','9975386368',NULL,'asad.qureshi@sganalytics.com','493, Kuresh Nagar, Near Ismail Building, Khadki',1,20,504,'Pune',411003,'493, Kuresh Nagar, Near IsmailBuilding, Khadki, Pune - 411003','0','AAIPQ2593E',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(113,'812','EMP0000113',NULL,NULL,'Mahendra',NULL,'Nikam','1986-12-02','Male','9833452265',NULL,'mahendra.nikam@sganalytics.com','80, Gurudatta Colony, A/P Tal Shirpur',1,20,458,'Dhule',425405,'C/O Nitin Nikam, 27/09, Pratik Society, Paud Road, Pune -  38','0','AKQPN1603G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(114,'814','EMP0000114',NULL,NULL,'Bhargav',NULL,'Pandya','1991-05-03','Male','9673706401',NULL,'bhargav.pandya@sganalytics.com','61, Shubham Row House, Near Saraswati School, Honey Park Road, Adajan',1,12,NULL,'Surat',395009,'Sr no 48/4, Flat no 303, Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri, Pune - 411014','0','BCWPP1537L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(115,'816','EMP0000115',NULL,NULL,'Jitendra',NULL,'Nikam','1983-05-31','Male','9769976005',NULL,'jitendra.nikam@sganalytics.com','25 - A, Arunoday Colony, Chopda',1,20,NULL,'Jalgaon',425107,'Lane no 4, House no 4, Madhuban Society, Old Sanghavi, Pune - 27','0','AGDPN3585G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(116,'817','EMP0000116',NULL,NULL,'Anas',NULL,'Patel','1989-03-14','Male','9819402080',NULL,'anas.patel@sganalytics.com','22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104',1,20,486,'Mumbai',400008,'22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104, Mumbai - 400008','0','ARTPP7285J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(117,'825','EMP0000117',NULL,NULL,'Parminder',NULL,'Kaur','1969-08-31','Female','9921755899',NULL,'parminder@sganalytics.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AMJPK8117B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,10,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(118,'827','EMP0000118',NULL,NULL,'Yogesh','Kr','Singh','1983-08-01','Male','7387088388',NULL,'yogesh.singh@sganalytics.com','Vill & Post - Kanta, District - Chandavali',1,35,965,'Varanasi',0,'Vill & Post - Kanta, District - Chandavali, Varanasi - UP','0','BEKPS5421L',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(119,'830','EMP0000119',NULL,NULL,'Dhir',NULL,'Patwa','1990-10-25','Male','9833884531',NULL,'dhir.patwa@sganalytics.com','E/13, Rishikesh CHS, Evershine Nagar, Malad West',1,20,486,'Mumbai',400064,'E/13, Rishikesh CHS, Evershine Nagar, Malad west, Mumbai - 400064','0','BOYPP4836C',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(120,'831','EMP0000120',NULL,NULL,'Tushar','Ranjan','Senapati','1982-06-02','Male','9000543563',NULL,'tushar.senapati@sganalytics.com','AT / PO - Kuha, Dist - Khurda',1,26,604,'Bhubaneswar',751002,'AT / PO - Kuha, Dist - Khurda, Bhubaneswar - 751002','0','BXCPS8772H',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(121,'832','EMP0000121',NULL,NULL,'Tushar',NULL,'Patil','1990-05-22','Male','8149605963',NULL,'tushar.patil@sganalytics.com','Flat no 404, Omkar Swaroop Society, Narayangaon, Junnar',1,20,504,'Pune',410504,'B - 19, C Building, kate Residency, Dapodi, Pune - 411012','0','BHYPP9525M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:06','2017-05-12 09:40:06',NULL,NULL,NULL,NULL,NULL,NULL),(122,'833','EMP0000122',NULL,NULL,'Harshad',NULL,'Solanki','1991-10-04','Male','8087463665',NULL,'harshad.solanki@sganalytics.com','1680, R.S.Kedari Road, Camp',1,20,504,'Pune',411001,'1680, R.S.Kedari Road, Camp, Pune - 411001','0','EOVPS8725B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(123,'834','EMP0000123',NULL,NULL,'Jayesh',NULL,'Tare','1989-03-31','Male','9981354260',NULL,'jayesh.tare@sganalytics.com','43-B, Vandana Nagar',1,23,564,'Indore',452001,'43-B, Vandana Nagar, Ext Indore, M.P 452001','0','AQHPT1083B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(124,'835','EMP0000124',NULL,NULL,'Srobon',NULL,'Banerjee','1987-04-06','Male','9590827779',NULL,'srobon.banerjee@sganalytics.com','174/10, Netaji Subhas Chandra Bose Road, Kanak Apartment, Flat - A-4',1,36,1008,'Kolkata',700040,'A-104, ND, Ascent Apartment, Singasandra Aecs, Layout - A Block - Bangalore - 560068','0','ARBPB3810D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(125,'839','EMP0000125',NULL,NULL,'Vipul',NULL,'Verma','1990-07-18','Male','9867927653',NULL,'vipul.verma@sganalytics.com','117/Q/169, Manoram Kunj, near Sardar Patel Public School, Sharda Nagar',1,35,925,'Kanpur',208025,'117/Q/169, Manoram Kunj, near Sardar Patel Public School,Sharda Nagar, Kanpur - 208025','0','AJLPV7155M',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(126,'841','EMP0000126',NULL,NULL,'Ramanath',NULL,'Mahindrakar','1989-05-05','Male','9421151705',NULL,'ramanath.mahindrakar@sganalytics.com','Laxmi Niwas, Ward No. 4, H.No. 148/52, Durgabhat, Ponde',1,NULL,156,'Goa',403401,'Brahma Majestic, E-502, near Bakers point, NIBM road, Wanowrie, Pune - Maharashtra','0','BKYPM1873Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(127,'842','EMP0000127',NULL,NULL,'Khushboo',NULL,'Manka','1992-10-20','Female','9902524670',NULL,'khushboo.manka@sganalytics.com','Bhawani distributors, main road, Jugsalai',1,NULL,297,'Jamshedpur',831000,'Bhawani distributors, main road, Jugsalai, Jamshedpur, Jharkhand - 831000','0','BYAPM6813N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(128,'843','EMP0000128',NULL,NULL,'Neha',NULL,'Sangtani','1991-05-21','Female','9901519909',NULL,'neha.sangtani@sganalytics.com','Block NO.13, Kachnar Residency, Napier Town ',1,23,565,'Jabalpur',482001,'Block NO.13, Kachnar Residency, Napier Town , Jabalpur, Madhya Pradesh-482001','0','FPAPS9025B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(129,'844','EMP0000129',NULL,NULL,'Chiranjeevi',NULL,'Choudhary','1993-01-23','Male','8308680761',NULL,'chiranjeevi.choudhary@sganalytics.com','Rajendra Bhawan, Bose press gali, Puran chand lane, Kalyani chowk',1,5,105,'Muzaffarpur',0,'Rajendra Bhawan, Bose press gali, Puran chand lane,Kalyani chowk, Muzaffarpur, Bihar','0','AZCPC0794J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(130,'845','EMP0000130',NULL,NULL,'Milan',NULL,'Malkiya','1989-08-12','Male','9845931521',NULL,'milan.malkiya@sganalytics.com','14, Rupam society, Part - 3, Hirabaug, A.K Road',1,12,NULL,'Surat',395008,'14, Rupam society, Part - 3, hirabaug, A.K road, Surat, Gujarat, India - 395008','0','BCBPM7050G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(131,'846','EMP0000131',NULL,NULL,'Anup',NULL,'Kulkarni','1989-09-30','Male','8600500335',NULL,'anup.kulkarni@sganalytics.com','Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad',1,20,504,'Pune',411033,'Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad, Pune- 411033','0','BXZPK2725F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(132,'847','EMP0000132',NULL,NULL,'Nivedita',NULL,'Snehi','1991-09-06','Female','9739469656',NULL,'nivedita.snehi@sganalytics.com','#6/4, 2nd main, 4th cross, Govindnagar',1,17,321,'Bangalore',560040,'#6/4, 2nd main, 4th cross, Govindnagar, Bangalore - 560040','0',' EMSPS0469B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(133,'849','EMP0000133',NULL,NULL,'Mayur',NULL,'Deshmukh','1990-05-02','Male','7218369496',NULL,'mayur.deshmukh@sganalytics.com','A-605, Elite Homes, Near Akshara International School, Tathwade',1,20,504,'Pune',411033,'A-605, Elite Homes, Near Akshara International School, Tathwade Pune - 411033','0','AVXPD6098D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(134,'852','EMP0000134',NULL,NULL,'Akshay',NULL,'Bhansali','1992-06-03','Male','9503629988',NULL,'akshay.bhansali@sganalytics.com','A-98, Satyapuram society, Saswad road, Phursungi',1,20,504,'Pune',412308,'A-98, Satyapuram society, Pune, Saswad road, Phursungi, Pune-412308','0','AZBPB2313F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(135,'854','EMP0000135',NULL,NULL,'Rupali',NULL,'Helambe','1989-07-05','Female','9987055182',NULL,'rupali.helambe@sganalytics.com','B/6, Vishaka Apt, Nandanvan Colony',1,20,255,'Aurangabad',0,'B/6, Vishaka Apt, Nandanvan Colony, Aurangabad','0','AFJPH2459A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(136,'856','EMP0000136',NULL,NULL,'Raunak',NULL,'Rathi','1989-07-14','Male','8600273375',NULL,'raunak.rathi@sganalytics.com','Bus stand road, Akot',1,20,NULL,NULL,0,'Flat No. 101 , Saptarshi Apartment, DSK Vishwa, Dhayari, Pune','0','BCPPR2284F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(137,'866','EMP0000137',NULL,NULL,'Pritam','Kumar','Sarkar','1988-04-15','Male','9239030788',NULL,'pritam.sarkar@sganalytics.com','Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur',1,36,1008,'Kolkata',700127,'Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur, Kolkata - 700127','0','BLUPS3158K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:07','2017-05-12 09:40:07',NULL,NULL,NULL,NULL,NULL,NULL),(138,'872','EMP0000138',NULL,NULL,'Shanu',NULL,'Dhamija','1989-10-30','Male','7755901560',NULL,'shanu.dhamija@sganalytics.com','H.No.- 569, Adarsh Colony, Samadhi road',1,NULL,645,'Khanna',141401,'H.No.- 569, Adarsh Colony, Samadhi road, Khanna - 141401 (PB)','0','ARXPD0174A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(139,'875','EMP0000139',NULL,NULL,'Pavan','Kumar','Yadav','1992-07-09','Male','7045566357',NULL,'pavan.yadav@sganalytics.com','40AA/259 Sainik Nagar, Rajpur Chungi',1,35,886,'Agra',282001,'40AA/259 Sainik Nagar, Rajpur Chungi, Agra - 282001','0','ALMPY9011A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(140,'883','EMP0000140',NULL,NULL,'Sameer',NULL,'Inamdar','1989-12-03','Male','9921850311',NULL,'sameer.inamdar@sganalytics.com','At Post BIBI, Darphal Tal, North Solapur Dist',1,20,517,'Solapur',413222,'Sr No 14, Shankar Maharaj Vasahat, Chavan nagar, Dhankwadi, Pune - 43','0','ABZPI4316F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(141,'890','EMP0000141',NULL,NULL,'Rohan',NULL,'Walavalkar','1982-03-16','Male','9619827319',NULL,'rohan.walavalkar@sganalytics.com','828, Vaccine Depot Road, Pawar Compund, Tilakwadi',1,17,322,'Belgaum',590006,'C - 2, Building no 3, 1st Floor, Flat no 2, Vashi, Navi Mumbai','0','AAMPW4244Q',NULL,'Married',5,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(142,'891','EMP0000142',NULL,NULL,'Ritu',NULL,'Singh','1987-08-30','Female','7743819118',NULL,'ritu.singh@sganalytics.com','32- Kabir envclave Dayalbagh',1,35,886,'Agra',282005,'32- Kabir envclave Dayalbagh, Agra - 282005, UP','0','CERPS9466R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(143,'892','EMP0000143',NULL,NULL,'Nikita',NULL,'Madan','1992-02-25','Female','7743819116',NULL,'nikita.madan@sganalytics.com','1404, Sector A, Pocket B and C, Vasant Kunj',1,NULL,NULL,'New Delhi',110070,'1404, Sector A, Pocket B and C, Vasant Kunj, New Delhi - 110070','0','BIDPM4258A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(144,'895','EMP0000144',NULL,NULL,'Prachi',NULL,'Gandhi','1991-03-29','Female','9028796816',NULL,'prachi.gandhi@sganalytics.com','A 1/2, Agrasen Society, 8 Koregaon Park',1,20,504,'Pune',411001,'A 1/2, Agrasen Society, 8 Koregaon Park, Pune - 411001','0','AYYPG9090L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(145,'897','EMP0000145',NULL,NULL,'Radhika',NULL,'Khetan','1991-10-08','Female','9405429151',NULL,'radhika.khetan@sganalytics.com','Near Z.P. School, At. Po. Thiloni Ta. Duryapoor',1,20,433,NULL,0,'Rakshaknagar phase 2, o/p durgamandir between Radison hotel &Kharadi bypass, Kharadi','0','CKRPK7573B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(146,'899','EMP0000146',NULL,NULL,'Raj',NULL,'Kumar','1992-12-15','Male','8871379614',NULL,'raj.kumar@sganalytics.com','Vill + P.O: Bhadouns',1,5,NULL,NULL,0,'Vill + P.O: Bhadouns dist: Sheikhpura, Bihar','0','BWWPK4217J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(147,'901','EMP0000147',NULL,NULL,'Vicky',NULL,'Vidre','1991-05-17','Male','8903373711',NULL,'vicky.vidre@sganalytics.com','F11/11 Durga Colony, Vikram Nagar Khor, Neemuch',1,23,NULL,NULL,451470,'F11/11 Durga Colony, Vikram Nagar Khor, Neemuuh, MP - 451470','0','ALXPV7479G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(148,'902','EMP0000148',NULL,NULL,'Vipul',NULL,'Babbar','1990-06-13','Male','9828482572',NULL,'vipul.babbar@sganalytics.com','E-42, Ram Nagar Extension, Sodala',1,29,689,'Jaipur',302006,'E-42, Ram Nagar Extension, Sodala, Jaipur 302006','0','ARRPB0444P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(149,'904','EMP0000149',NULL,NULL,'Shweta',NULL,'Gogawale','1987-12-03','Female','9766656645',NULL,'shweta.gogawale@sganalytics.com','Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri',1,20,504,'Pune',411014,'Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri, Pune - 411014','0','ARYPG6943R',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(150,'909','EMP0000150',NULL,NULL,'P.T.','Satya','Kishore','1984-08-12','Male','9618436234',NULL,'satya.pt@sganalytics.com','P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla',1,2,NULL,'Indepalligudem',0,'P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla, Indepalligudem, West Godavari (Dist) Andhra Pradesh','0','CZCPS0472F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(151,'913','EMP0000151',NULL,NULL,'Amit',NULL,'Kathar','1991-10-24','Male','9637537515',NULL,'amit.kathar@sganalytics.com','Rajdurg 3 Mayadevi nagar, Mahabal Road',1,NULL,NULL,'Jalgaon',425001,'Pritam residency, near Anaod park bus stop, Wadgaon sheri, Pune','0','DUCPK5384N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(152,'915','EMP0000152',NULL,NULL,'Ramesh','Babu','Kopparthi','1988-08-18','Male','9702483177',NULL,'ramesh.kopparthi@sganalytics.com','D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2',1,2,NULL,NULL,534202,'D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2, Andhra Pradesh - 534202','0','CBUPK9760N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:08','2017-05-12 09:40:08',NULL,NULL,NULL,NULL,NULL,NULL),(153,'916','EMP0000153',NULL,NULL,'Vijish','Haridasan','Kottarapat','1989-05-23','Male','8097178190',NULL,'vijish.kottarapat@sganalytics.com','204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)',1,20,486,'Mumbai',0,'204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)','0','AXGPK9131M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:09','2017-05-12 09:40:09',NULL,NULL,NULL,NULL,NULL,NULL),(154,'917','EMP0000154',NULL,NULL,'Samiya',NULL,'Ayaz','1993-11-20','Female','7350408883',NULL,'samiya.ayaz@sganalytics.com','F- 603, Shefalika Heights, Near Kinara Hotel, Shivtrinagar, Kothrud',1,20,504,'Pune',411038,'F- 603, Shefalika Heights, near Kinara Hotel, Shivtrinagar, Kothrud, Pune, Maharashtra - 411038','0','BBIPA4160P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:09','2017-05-12 09:40:09',NULL,NULL,NULL,NULL,NULL,NULL),(155,'918','EMP0000155',NULL,NULL,'Soumya','Prakash','Jena','1993-11-03','Male','8087023571',NULL,'soumya.jena@sganalytics.com','PWD/LA/55, Industrial Estate',1,26,NULL,'Rourkela',0,'Flat No 11, f wing, Wanjale patil Heritage, Kondhwa dhawade, NDA Road, Pune','0','AXEPJ1959N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:09','2017-05-12 09:40:09',NULL,NULL,NULL,NULL,NULL,NULL),(156,'924','EMP0000156',NULL,NULL,'Sourabh',NULL,'Kulkarni','1985-04-21','Male','9823990793',NULL,'sourabh.kulkarni@sganalytics.com','E - 6, Rounak Residency, Mayur Colony, Kothrud',1,20,504,'Pune',411038,'E - 6, Rounak Residency, Mayur colony, Kothrud, Pune - 38','0','BHRPK4752L',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:09','2017-05-12 09:40:09',NULL,NULL,NULL,NULL,NULL,NULL),(157,'925','EMP0000157',NULL,NULL,'Farheen',NULL,'Rahman','1992-06-20','Female','9939671927',NULL,'farheen.rahman@sganalytics.com','H. No - A11, Fazal Manzil, New Tiwari Tankroad',1,NULL,NULL,'Ranchi',0,'Flat No 16, Building No - 9, Laxmi Narayan nagar society, Opp. Mukherjee udyan, Erandvana, Pune','0','BYAPR7860J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:09','2017-05-12 09:40:09',NULL,NULL,NULL,NULL,NULL,NULL),(158,'929','EMP0000158',NULL,NULL,'Sunil',NULL,'Dhake','1988-05-10','Male','7028263881',NULL,'sunil.dhake@sganalytics.com','Flat No. 18, Prabhu Square, Deepali Nagar, Mumbai Naka',1,20,492,'Nashik',0,'Flat No. 18, Prabhu square, Deepali Nagar, Mumbai Naka, Nashik','0','AKIPD7844B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(159,'931','EMP0000159',NULL,NULL,'Rishabh',NULL,'Nigam','1988-11-15','Male','8793375243',NULL,'rishabh.nigam@sganalytics.com','Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad',1,20,504,'Pune',411041,'Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad - 411041','0','AJLPN3876H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(160,'933','EMP0000160',NULL,NULL,'Naim',NULL,'Mahipal','1992-06-16','Male','9716640166',NULL,'naim.mahipal@sganalytics.com','Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi',1,14,NULL,'Fatehabad',125053,'Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi, Fatehabad, Harayana - 125053','0','CQBPM2850F',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(161,'936','EMP0000161',NULL,NULL,'Susshruth',NULL,'Apshankar','1971-05-28','Male','8380073727',NULL,'susshruth.apshankar@sganalytics.com','303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park',1,20,504,'Pune',411001,'303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park, Pune - 411001','0','AKWPA0122F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,10,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(162,'940','EMP0000162',NULL,NULL,'Sneha',NULL,'Deshpande','1988-10-29','Female','9822593350',NULL,'sneha.deshpande@sganalytics.com','#41, Sunflower Building, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'#41, Sunflower Building, Neco Garden, Viman Nagar, Pune- 411014','0','AOIPD5779B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(163,'943','EMP0000163',NULL,NULL,'Shakshi',NULL,'Yadav','1991-09-23','Female','9845305050',NULL,'shakshi.yadav@sganalytics.com','H/O Sundarkali Yadav, Near Samzhana Hotel, Birgunj - 16',NULL,NULL,NULL,NULL,44301,'BT Kawade Road, Suchandra corner, B-18, Pune','0','AMHPY6293L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(164,'945','EMP0000164',NULL,NULL,'Tripti','Rastogi','Vishnoi','1986-06-19','Female','9582218398',NULL,'tripti.vishnoi@sganalytics.com','C - 79, Nirala Nagar',1,35,935,'Lucknow',226020,'A-205, Nandan Euphora, Near Kumar Samrudhi Housing Society, Vishrantwadi, Pune - 411015','0','AMPPR6894L',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(165,'946','EMP0000165',NULL,NULL,'Atul',NULL,'Kumar','1992-03-01','Male','9545355674',NULL,'atul.kumar@sganalytics.com','C/o Keshav Kumar, Masipirhi, Viu - Babhankay Naman Vidya Road',1,NULL,NULL,'Hazaribagh',825301,'Jaiwant apartment, 3rd Floor, Mohan Nagar, Katraj, Pune - 411046','0','BQIPK6491A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(166,'947','EMP0000166',NULL,NULL,'Adrita',NULL,'Das','1992-03-14','Female','7767953941',NULL,'adrita.das@sganalytics.com','Q.No.598/2, Bagbera Railway Colony Near T.O.P',1,NULL,297,'Jamshedpur',831002,'Q.No.598/2, Bagbera Railway Colony Near T.O.P, Jamshedpur, Jharkhand - 831002','0','BMMPD4307A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(167,'948','EMP0000167',NULL,NULL,'Ankit',NULL,'Kapila','1991-12-14','Male','9560018039',NULL,'ankit.kapila@sganalytics.com','B4, Lane 3, Sector - 1, New Shimla',1,NULL,252,'Shimla',171009,'B4, Lane 3, Sector - 1, New Shimla, Shimla - 171009','0','CGNPK8074M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(168,'952','EMP0000168',NULL,NULL,'Salman',NULL,'Khan','1990-12-31','Male','8291374292',NULL,'salman.khan@sganalytics.com','Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west',1,20,486,'Mumbai',400086,'Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west, Mumbai - 400086','0','BEFPK9131N',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(169,'966','EMP0000169',NULL,NULL,'Chandan',NULL,'Kishore','1987-08-07','Male','9958767736',NULL,'chandan.kishore@sganalytics.com','HNO. 63A, Street No. 5, Deepak Vihar, Najafgarh',1,NULL,NULL,'New Delhi',110043,'HNO. 63A, Street No. 5, Deepak Vihar,Najafgarh, New Delhi - 110043','0','CIPPK5347D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(170,'967','EMP0000170',NULL,NULL,'Manas','Kumar','Raul','1983-06-05','Male','9890296764',NULL,'manas.raul@sganalytics.com','LIG 12, S.P.A Colony Chudcos, Bagdhiya, Baripada',1,26,NULL,'Takatpur',757003,'Flat C - 401, Krishna Residency, SUS - Pashan Road , Sai Chowk, Pashan,Pune = 411021','0',' ALCPR5933L',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(171,'968','EMP0000171',NULL,NULL,'Nishant',NULL,'Narad','1989-11-01','Male','9021310965',NULL,'nishant.narad@sganalytics.com','Walni, Th - Saoner',1,20,488,NULL,0,'Yash Society, B - Wing, 35#, Behind CNG Pump, Paud Road, Kothrud, Pune','0','AQAPN5796J',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,9,NULL,'2017-05-12 09:40:10','2017-05-12 09:40:10',NULL,NULL,NULL,NULL,NULL,NULL),(172,'972','EMP0000172',NULL,NULL,'Sunil','Kumar','Parimi','1985-07-13','Male','9703596999',NULL,'sunil.parimi@sganalytics.com','Pedamuthevi (post), Movva (MD), Krishna (DT)',1,NULL,NULL,NULL,521136,'Pedamuthevi (post), Movva (MD), Krishna (DT), Pin - 521136','0','BDDPP8794H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(173,'973','EMP0000173',NULL,NULL,'Prasad',NULL,'Jagtap','1989-01-27','Male','7276890909',NULL,'prasad.jagtap@sganalytics.com','55 / 66, Shiv colony',1,20,NULL,'Jalgaon',425001,'B- 905, Umag Premiere, Ivy Estate, Wagholi, Pune - 410227','0',' AMGPJ0531P',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(174,'977','EMP0000174',NULL,NULL,'Apurv',NULL,'Mahajan','1990-01-11','Male','8793845745',NULL,'apurva.mahajan@sganalytics.com','Plot No. 189, Flat No. 10, Anant Apt, Jyoti Nagar',1,20,255,'Aurangabad',0,'B- 501, Swaminarayan Apt, Near Suncity, Off Sinhgad road, Vadgaon, Pune - 411041','0','BNWPM5837M',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(175,'978','EMP0000175',NULL,NULL,'Ashish',NULL,'Dongre','1988-01-30','Male','8087673282',NULL,'ashish.dongre@sganalytics.com','Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar',1,20,504,'Pune',411028,'Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar, Pune - 411028','0','BEDPD1656R',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(176,'979','EMP0000176',NULL,NULL,'Deep',NULL,'Gada','1991-12-16','Male','9824207676',NULL,'deep.gada@sganalytics.com','301, Avadhpuri Apt, 80 feet road',1,NULL,NULL,'Veraval',362266,'301, Avadhpuri Apt, 80 feet road, Veraval - 362266','0','AYIPG3156D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(177,'980','EMP0000177',NULL,NULL,'Kaustubh',NULL,'Joshi','1990-09-11','Male','8149966205',NULL,'kaustubh.joshi@sganalytics.com','Taranjan Bunglow, Abhinavnagar, sangamner',1,NULL,NULL,NULL,422605,'Flat No. 14, Pushpa Apt, Vanaz corner, Kothrud, Pune - 411038','0','ANPPJ5041G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(178,'981','EMP0000178',NULL,NULL,'Mitisha',NULL,'Gupta','1990-04-06','Female','9993554500',NULL,'mitisha.gupta@sganalytics.com','121, Pandrinath Path Ada Bazar',1,23,564,'Indore',452004,'121, Pandrinath path Ada Bazar, Indore ( M.P.)- 452004','0','AQEPG153Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(179,'982','EMP0000179',NULL,NULL,'Prinkesh','Kumar','Giri','1991-10-27','Male','7276496585',NULL,'prinkesh.giri@sganalytics.com','E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Arera Colony',1,23,550,'Bhopal',0,'E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Areracolony Bhopal (MP)','0','BCUPG1337B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(180,'983','EMP0000180',NULL,NULL,'Radhika',NULL,'Bajaj','1993-12-19','Female','9960509806',NULL,'radhika.bajaj@sganalytics.com','589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury Park',1,20,504,'Pune',411037,'589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury park, Pune - 37','0','BMJPB2481E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(181,'984','EMP0000181',NULL,NULL,'Sakshi',NULL,'Aggarwal','1990-01-16','Female','9958916781',NULL,'sakshi.aggarwal@sganalytics.com','B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9',1,NULL,NULL,'Delhi',110075,'B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9, Delhi - 110075','0','AQXPA4523D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(182,'987','EMP0000182',NULL,NULL,'Shantanu',NULL,'Jana','1988-06-25','Male','9434432791',NULL,'shantanu.jana@sganalytics.com','Roypara road govt housing estate, Block - I, Flat No. 5',1,36,1008,'Kolkata',700050,'Roypara road govt housing estate, Block - I, Flat No. 5, Kolkata - 700050','0','AOLPJ9106R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(183,'989','EMP0000183',NULL,NULL,'Manoj',NULL,'Dhiware','1986-01-12','Male','9096049888',NULL,'manoj.dhiware@sganalytics.com','Plot no . 93/94, \'Siddhi\' Niwas, Nivara Nagari, Behind Dongre Hospital, Ldgaon Road',1,NULL,255,'Vaijapur',423701,'SR No. 253/2/3A/2, Bunglow No. 3, near Kumar Bakery, officers mess, Lohegaon Road, Khere Park, Pune - 411032','0','AYUPD9261C',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,1,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(184,'991','EMP0000184',NULL,NULL,'Sumit',NULL,'Lakhina','1989-06-05','Male','9971692020',NULL,'sumit.lakhina@sganalytics.com','90/25 A, 1st Floor Malviya Nagar',1,NULL,NULL,'New Delhi',0,'90/25 A, 1st Floor Malviya Nagar, New Delhi','0','EDWPS5924L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(185,'996','EMP0000185',NULL,NULL,'Ganesh',NULL,'Konar','1991-09-12','Male','9768590273',NULL,'ganesh.konar@sganalytics.com','9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate, Thane',1,20,520,'Thane',400604,'9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate , Thane -n 400604','0','BIKPK9855J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(186,'1001','EMP0000186',NULL,NULL,'Mitesh',NULL,'Oswal','1983-10-31','Male','8698619998',NULL,'mitesh.oswal@sganalytics.com','B- 502/ Eisha Pearl, Kondhwa BK',1,20,504,'Pune',411048,'B- 502/ Eisha Pearl, Kondhwa BK, Pune - 48','0','AAIPO8158K',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(187,'1002','EMP0000187',NULL,NULL,'Ruchi',NULL,'Srivastava','1991-05-23','Female','9765453933',NULL,'ruchi.srivastava@sganalytics.com','10/517, Khalasi Line, Kanpur',1,35,NULL,NULL,208001,'Flat - E, 904, Splendour County, Behind Wageshwar Termple, Wagholi, Loh Road, Pune','0','DJKPS8929G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(188,'1003','EMP0000188',NULL,NULL,'Jitesh',NULL,'Rane','1990-04-18','Male','9930735980',NULL,'jitesh.rane@sganalytics.com','803, 1A Wing, 8th Floor, Swadeshi Mhada Complex, Chunabhatti East Sion',1,NULL,486,'Mumbai',400022,'803, 1A Wing, 8th Floor,Swadeshi Mhada Complex,Chunabhatti East Sion,Mumbai – 400022','0','AQWPR7839Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:11','2017-05-12 09:40:11',NULL,NULL,NULL,NULL,NULL,NULL),(189,'1010','EMP0000189',NULL,NULL,'Pooja',NULL,'Pingale','1993-02-11','Female','9421605512',NULL,'pooja.pingale@sganalytics.com','Dr. Hedgewar colony, B6, Brahmin Ali',1,20,506,'Khed',0,'B-11,shivsagar co -op Hsg soc. Phase 1, Mauikloaug, Singhad Road, Pune','0','CHHPP3066R',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(190,'1015','EMP0000190',NULL,NULL,'Nayan',NULL,'Rijhwani','1990-03-18','Female','9823018644',NULL,'nayan.rijhwani@sganalytics.com','25, Shukla colony, Veer villa',1,23,NULL,'Mandsaur',0,'RH - 6, Pillar homes, Viman Nagar, Near Kidzee school, Pune - 411014','0','BJCPR6317K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(191,'1016','EMP0000191',NULL,NULL,'Vasudha',NULL,'Arora','1992-02-13','Female','9711412088',NULL,'vasudha.arora@sganalytics.com','127, Bank Enclave, Laxmi Nagar',1,NULL,NULL,'Delhi',110092,'202, Emperor 1, Supertech Emrald Court, Sector - 93A, Noida - 201301, UP','0','NA',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(192,'1018','EMP0000192',NULL,NULL,'Ammaar',NULL,'Shaikh','1988-11-03','Male','9545093038',NULL,'ammaar.shaikh@sganalytics.com','815 / 16, Bhawani peth opp ICC, Cable office',1,20,504,'Pune',411042,'Plot No. 5 A, Harmony Society Near gangadhan chowk Pune 411037','0','BRDPS7831L',NULL,'Married',7,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(193,'1021','EMP0000193',NULL,NULL,'Shraddha',NULL,'Patel','1986-07-04','Female','8888833674',NULL,'shraddha.patel@sganalytics.com','E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01',1,20,504,'Kalapadal',411028,'E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal, Pune 411028','0','BHSPP8501R',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(194,'1023','EMP0000194',NULL,NULL,'Rohit',NULL,'Kalghatgi','1980-05-28','Male','9370013454',NULL,'rohit.kalghatgi@sganalytics.com','A -9,403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud',1,20,504,'Pune',411038,'A -9, 403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud, Pune - 411038','0','AQAPK4267H',NULL,'Divorced',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,5,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(195,'1024','EMP0000195',NULL,NULL,'Narasimha','Achryulu','PTC','1986-07-30','Male','9966977477',NULL,'narasimha.tirumala@sganalytics.com','H.No. 20 - 120 / G-2, Aiswarya Enclave, Dayanand Nagar, Malkajgiri',1,2,737,'Hyderabad',500047,'H.No. 20 - 120 / G-2, Aiswarya Enclave,Dayanand Nagar,Malkajgiri,Hyderabad - 500047','0','ALCPN8063H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(196,'1025','EMP0000196',NULL,NULL,'Dhankirti',NULL,'Parmar','1989-10-23','Female','9177587666',NULL,'dhankirti.parmar@sganalytics.com','T - 186, Pratap Nagar, INS Shivaji',1,20,504,'Lonavala',410402,'Block S - 204, Madhuvanti, Nanded City, Sinhagad Road, Pune - 411041','0','BZAPP7583B',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(197,'1033','EMP0000197',NULL,NULL,'Amit',NULL,'Yerawar','1985-02-01','Male','9975028932',NULL,'amit.yerawar@sganalytics.com','Near A.C.S. College, Sumitra Nagar,Tukum',1,NULL,NULL,'Chandrapur',442401,'Flat No 2, Venkatesh terrace, Near Columbia Asia Hospital, Sainath Nagar Square, Kharadi, Pune-411015     ','0','ACVPY2211L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(198,'1034','EMP0000198',NULL,NULL,'Hitanshu',NULL,'Dhingra','1985-05-26','Male','9582947006',NULL,'hitanshu.dhingra@sganalytics.com','43006, Gali No. 10, Rampur Road, Haldwani',1,34,NULL,NULL,263139,'9/28, Gali No. 10, Rampur Road, Haldwani, Uttarakhand - 263139','0','ATWPD7637D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(199,'1036','EMP0000199',NULL,NULL,'Paresh',NULL,'Panchal','1989-12-29','Male','7760888005',NULL,'paresh.panchal@sganalytics.com','42739, Shivaji Nagar, RHB Colony',1,29,NULL,'Dungarpur',314001,'1/4, Shivaji Nagar, RHB Colony, Dungarpur, Rajasthan - 314001','0','BFTPP6032C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(200,'1038','EMP0000200',NULL,NULL,'Shweta',NULL,'Navarkar','1987-01-23','Female','9892942500',NULL,'shweta.navarkar@sganalytics.com','Neeltej Nagar, B - 17, Rambaug Lane - 4, Kalyan West',1,20,486,'Mumbai',421301,'Sunflower - 604, Park Springs Society, Porwal Road, Near Dhanori Jakat Naka, Lohegaon, Pune - 411032','0','AHWPN6238N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(201,'1040','EMP0000201',NULL,NULL,'Pranav',NULL,'Lohokare','1993-04-10','Male','9986555967',NULL,'pranav.lohokare@sganalytics.com','Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi',1,20,504,'Pune',411043,'Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi , Pune 411 043','0','AJEPL8791N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(202,'1041','EMP0000202',NULL,NULL,'Siddharth',NULL,'Singhvi','1992-11-30','Male','8007594415',NULL,'siddharth.singhvi@sganalytics.com','A - 8 , Kumar Aashiyana , Panmala, Sinhagad Road',1,20,504,'Pune',411030,'A - 8 , Kumar Aashiyana , Panmala, Sinhagad Road , Pune - 30','0','DDMPS2138K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(203,'1042','EMP0000203',NULL,NULL,'Avilin',NULL,'Mandal','1993-06-06','Male','9830975054',NULL,'avilin.mandal@sganalytics.com','301, Prince Anwar Shah Road',1,36,1008,'Kolkata',700045,'301, Prince Anwar Shah Road , Kolkatta - 700045','0','BVZPM9152N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(204,'1046','EMP0000204',NULL,NULL,'Sabyasachi','Guha','Raja','1980-07-13','Male','9899697608',NULL,'sabyasachi.guha@sganalytics.com','House No 33 , Rajpur Khurd Extension, P.O. IGNOU',1,NULL,NULL,'New Delhi',110068,'House No 33 , Rajpur Khurd Extension, P.O. IGNOU, New Delhi 110068','0','AJCPG5778N',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:12','2017-05-12 09:40:12',NULL,NULL,NULL,NULL,NULL,NULL),(205,'1050','EMP0000205',NULL,NULL,'Rakesh',NULL,'Hasurkar','1988-01-28','Male','9764404067',NULL,'rakesh.hasurkar@sganalytics.com','Sr. No . 27/B, Munjaba Vasti, Dhanori',1,20,504,'Pune',411015,'Sr. No . 27/B, Munjaba Vasti, Dhanori, Pune 15','0','AHIPH8897B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(206,'1053','EMP0000206',NULL,NULL,'Kalyani',NULL,'Bhende','1990-05-26','Female','9503764581',NULL,'kalyani.bhende@sganalytics.com','50, Rani Bhoslae Vihar, Opp C P Berar College, Tulsibaug',1,20,488,'Nagpur',0,'201 , \'B\' Wing , Karan Rhea Apartment, Sainath nagar, Vadgaonsheri , Pune','0','CDPPB2021Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(207,'1054','EMP0000207',NULL,NULL,'Seema',NULL,'Gurung','1988-09-28','Female','8390146987',NULL,'seema.gurung@sganalytics.com ','Youngtong Division, Sasing Matelte',1,36,997,NULL,0,'Star Gaze society, E-203, Dhanori-15, Pune','0','AWBPG0069Q',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,1,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(208,'1060','EMP0000208',NULL,NULL,'Himanshu',NULL,'Thukral','1993-01-18','Male','9999789403',NULL,'himanshu.thukral@sganalytics.com','E-19, Jhilmil Colony, Shahdara',1,NULL,NULL,'Delhi',110095,'E-19, Jhilmil Colony, Shahdara, Delhi - 95','0','APVPT0686F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(209,'1061','EMP0000209',NULL,NULL,'Rakesh',NULL,'Kakani','1984-10-31','Male','9739068282',NULL,'rakesh.kakani@sganalytics.com','53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa Nagar, Nikol Gam Road',1,12,170,'Ahmedabad',382350,'53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa nagar, Nikol Gam Road, Ahmedabad - 382 350','0','ATHPK3885H',NULL,'Married',6,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(210,'1062','EMP0000210',NULL,NULL,'Rameez',NULL,'Shaikh','1990-02-26','Male','9673959463',NULL,'rameez.shaikh@sganalytics.com','S. No. 48, Sai baba Nagar, Lane No - 5, Behind valley view school, Kondhwa Khurd',1,20,504,'Pune',411048,'S. No. 48, Sai baba Nagar, Lane No - 5,  Behind valley view school, Kondhwa Khurd, Pune 411 048','0','ESRPS1013J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(211,'1065','EMP0000211',NULL,NULL,'Shekhar',NULL,'Lanke','1969-01-15','Male','9823041486',NULL,'shekhar.lanke@sganalytics.com','A4/ 18 , Potnis Parisar, Karve Nagar ',1,20,504,'Pune',0,'A4/ 18 , Potnis Parisar, Karve Nagar , Pune','0','AAMPL9888R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,5,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(212,'1067','EMP0000212',NULL,NULL,'Ritwik',NULL,'Dey','1985-03-17','Male','9923370908',NULL,'ritwik.dey@sganalytics.com','308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan',1,20,504,'Pune',411021,'308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan, Pune 411 021','0','AIWPD54014',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(213,'1069','EMP0000213',NULL,NULL,'Paridhi',NULL,'Agarwal','1986-10-29','Female','8600017299',NULL,'paridhi.agarwal@sganalytics.com','Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy',1,20,504,'Pune',411014,'Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy, Pune -411014','0','ALZPA4632N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(214,'1070','EMP0000214',NULL,NULL,'Rahul',NULL,'Chakraborti','1986-01-15','Male','9724199690',NULL,'rahul.chakraborti@sganalytics.com','45/1, New Tollygunge, P.O  Purba Dutiary',1,36,1008,'Kolkata',700093,'45/1, New Tollygunge, P.O  Purba Dutiary, Kolkata 700093','0','AJAPC1468R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(215,'1071','EMP0000215',NULL,NULL,'Gopi','Chand','Mannem','1985-03-04','Male','9052220181',NULL,'gopichand.mannem@sganalytics.com','H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel )',1,2,NULL,NULL,521175,'H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel ), Krishna ( Dt ), Andhra Pradesh - 521175','0','ATRPM7848N',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(216,'1072','EMP0000216',NULL,NULL,'Akriti',NULL,'Srivastava','1991-10-06','Female','9532881262',NULL,'akriti.srivastava@sganalytics.com','438, Old Katra',1,35,889,'Allahabad',211002,'A-403 , Ginni Viviana, Nr. Mitcon Institute, Balewadi, Pune','0','EYIPS8285M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(217,'1074','EMP0000217',NULL,NULL,'Sunidhi',NULL,'Kakkar','1992-02-13','Female','7893406262',NULL,'sunidhi.kakkar@sganalytics.com','L-15, Shastri Nagar',1,35,940,'Meerut',250004,'L-15, Shastri Nagar, Meerut, UP - 250004','0','BNRPK1922N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(218,'1075','EMP0000218',NULL,NULL,'Sayli',NULL,'Rathi','1993-06-26','Female','9860290830',NULL,'sayli.rathi@sganalytics.com','Rathi Pura, AT Post, Yeoda, Tq Daryapur',1,20,433,'Amravati',0,'Prestige Classic Housing, D-1, Dava bazar, Mumbai Pune Highway, Chinchwad','0','CBMPR8848A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(219,'1077','EMP0000219',NULL,NULL,'Chiranjeevi',NULL,'Meesam','1986-06-20','Male','9573287838',NULL,'chiranjeevi.meesam@sganalytics.com','B S Peta, P P Agraharam, Makavarapalem',1,NULL,NULL,NULL,0,'B S Peta, P P Agraharam, Makavarapalem, Vishaka dist','0','AZAPM1795M',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(220,'1082','EMP0000220',NULL,NULL,'Keith',NULL,'Lobo','1985-04-22','Male','9011044352',NULL,'keith.lobo@sganalytics.com','Shubhashree Residency, C-1, 506, Akurdi',1,20,504,NULL,411035,'Padmachaya Housing Society , Kharadi, Pune 411 014','0','ADLPL1342G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:13','2017-05-12 09:40:13',NULL,NULL,NULL,NULL,NULL,NULL),(221,'1083','EMP0000221',NULL,NULL,'Sandesh',NULL,'Gade','1968-06-14','Male','9011012452',NULL,'sandesh.gade@sganalytics.com','9, Shahu Nagar, behind Noorani Masjid',1,20,NULL,'Jalgaon',425001,'9, Shahu Nagar, behind Noorani Masjid, Jalgaon,425001','0','AAXPG8252D',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(222,'1084','EMP0000222',NULL,NULL,'Jyoti',NULL,'Wadhwani','1988-01-04','Female','7720034188',NULL,'jyoti.wadhwani@sganalytics.com','Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar',1,20,504,NULL,411014,'Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar, Pune 411014','0','ACNPW5545M',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(223,'1087','EMP0000223',NULL,NULL,'Ankur',NULL,'Dixit','1982-06-29','Male','9453805878',NULL,'ankur.dixit@sganalytics.com','Amarnath Apt, Phase III, Flat No. 1, 1st floor, Adarsh Nagar, New Sanghvi',1,20,504,'Pune',411027,'Amarnath Apt, Phase III, Flat No. 1, 1st floor,Adarsh Nagar,New Sanghvi , Pune 27','0','BCTPD5708G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(224,'1090','EMP0000224',NULL,NULL,'Dustin',NULL,'Lichey','1988-09-09','Male','9823776569',NULL,'dustin.lichey@sganalytics.com','Radegaster Street 8, 06842 Dessag',NULL,NULL,NULL,NULL,0,'Radegaster Street 8, 06842 Dessag, Germany','0','AORPL2777A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(225,'1092','EMP0000225',NULL,NULL,'Abhishek',NULL,'Jha','1992-08-16','Male','9711553074',NULL,'abhishek.jha@sganalytics.com','Kh. No. 1704, New Karhera Colony',1,35,915,'Ghaziabad',201007,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','0','BAMPJ9378P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(226,'1094','EMP0000226',NULL,NULL,'Anand',NULL,'Sangeet','1984-10-15','Male','9717929709',NULL,'anand.sangeet@sganalytics.com','HIG,-0.2, VDA Flats, Naria',1,35,965,'Varanasi',221005,'HIG,-1/5, VDA Flats, Naria, Varanasi, Pin 221005','0','DKCPS3515R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(227,'1095','EMP0000227',NULL,NULL,'Geogy',NULL,'George','1986-12-31','Male','9880228857',NULL,'geogy.george@sganalytics.com','Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha',1,18,NULL,NULL,689512,'Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha, Kerala - 689512','0','ANIPG3492M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(228,'1097','EMP0000228',NULL,NULL,'Shariqa',NULL,'Mulla','1991-11-15','Female','7795287015',NULL,'shariqa.mulla@sganalytics.com','B. No. 76, M.H.B. Colony, Shah Bazar',1,20,255,'Aurangabad',0,'Survey No. 73, Hissa No. 1, Next to EON Free zone, Kharadi, Gera Emerald city','0','BTOPM0290G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(229,'1103','EMP0000229',NULL,NULL,'Rahul','Kumar','Burnwal','1990-12-21','Male','9831036183',NULL,'rahul.burnwal@sganalytics.com','2/H/3, Taltala Lane',1,36,1008,'Kolkata',700014,'2/H/3, Taltala Lane Kolkata - 700014','0','BCJPB9778C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(230,'1109','EMP0000230',NULL,NULL,'Roger',NULL,'D\'Souza','1986-08-20','Male','9764158808',NULL,'roger.dsouza@sganalytics.com','St.Joseph nagar, Next to Ghorpuri Gaon',1,20,504,'Pune',411001,'Flat No. D/403, Viva Sarovar, Jambhulwadi Road, Katraj Ambegaon Budruk, Pune - 411 046','0','AMOPD4686M',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(231,'1120','EMP0000231',NULL,NULL,'Sharayu',NULL,'Jain','1993-03-21','Female','8989070779',NULL,'sharayu.jain@sganalytics.com','306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop',1,23,564,'Indore',0,'306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop, Indore M.P','0','ASOPJ1992N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(232,'1121','EMP0000232',NULL,NULL,'Hem',NULL,'Thaker','1993-08-16','Male','7745880007',NULL,'hem.thaker@sganalytics.com','302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate Bank, 60 Feet Road, Ghatkopar (East)',1,20,486,'Mumbai',400077,'302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate bank, 60 feet road, Ghatkopar ( East ), Mumbai 77','0','ASQPT5375D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(233,'1123','EMP0000233',NULL,NULL,'Vineet',NULL,'Agarwal','1978-07-12','Male','9731313010',NULL,'vineet.agarwal@sganalytics.com','Flat No. 003, Vijaya Classic, Vijaya Bank layout, Bilekahalli',1,17,NULL,'Bengaluru',560076,'Flat # D1103, Kolte Patil Langston,Kharadi,Pune - 411014','0','AFSPA7399K',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(234,'1124','EMP0000234',NULL,NULL,'Ganesh',NULL,'Kudke','1992-08-31','Male','9960981805',NULL,'ganesh.kudke@sganalytics.com','Trimurti Colony No 2, Datta Nagar',1,20,NULL,NULL,431122,'Patil Complex, Building -4, B29, Aundh Road, Pune - 411 020','0','DIIPK1791K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(235,'1125','EMP0000235',NULL,NULL,'Shahab',NULL,'Mitha','1995-02-28','Male','9860203921',NULL,'shahab.mitha@sganalytics.com','P/16, Konark Campus, Viman Nagar',1,20,504,'Pune',411014,'P/16, Konark Campus, Viman Nagar, Pune - 411 014','0','CJWPM4341P',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:14','2017-05-12 09:40:14',NULL,NULL,NULL,NULL,NULL,NULL),(236,'1128','EMP0000236',NULL,NULL,'Sandeep',NULL,'Datta','1980-06-15','Male','7767815975',NULL,'sandeep.datta@sganalytics.com','2A, Samilton Greens, 159A NSC Bose Road, Tollygaunge, Regent Park',1,36,1008,'Kolkata',700040,'E1 / 401, Bramha SunCity, Vadgaon Sheri , Pune 411 014','0','AIGPD5352E',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(237,'1129','EMP0000237',NULL,NULL,'Geetika',NULL,'Gupta','1988-05-20','Female','8087616116',NULL,'geetika.gupta@sganalytics.com','46, Sanchar Nagar, Damoh Road',1,23,565,'Jabalpur',0,'D/601, Marvel Citrine, Rakshak Nagar, Kharadi, Pune','0','ALIPG1089J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(238,'1134','EMP0000238',NULL,NULL,'Nikhil',NULL,'Sharma','1991-08-25','Male','8558985896',NULL,'nikhil.sharma@sganalytics.com','Main bazar, Ward No 6',1,NULL,NULL,'Una',174303,'Main bazar, Ward No 6, Una - 174303, Himachal Pradesh','0','DHOPS0503Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(239,'1135','EMP0000239',NULL,NULL,'Rahul',NULL,'Agarwal','1979-02-04','Male','9845063982',NULL,'rahul.agarwal@sganalytics.com','c/o Dr. O P Agarwal, GP Das Lane, Mahamadia Bazar, Chandni Chowk',1,26,606,'Cuttack',753002,'B3 / 304, Tuscan Estate, Kharadi - Mundhwa Road, Next to Radisson Hotel, Pune 411 014','0','AHGPA8906L',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(240,'1136','EMP0000240',NULL,NULL,'Sakshi',NULL,'Kaushal','1991-07-06','Female','7774095033',NULL,'sakshi.kaushal@sganalytics.com','19360, Santosh Bhawan, Vidhya Peeth Marg, Vikas Nagar',1,34,863,'Dehradun',0,'F-801, Roystonea, Magarpatta City, Pune - 411013','0','CQAPK5363E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(241,'1137','EMP0000241',NULL,NULL,'Nikhil',NULL,'Venkatavelu','1994-03-03','Male','8463842283',NULL,'nikhil.venkatavelu@sganalytics.com','C-202, Kalpataru, Bhagoji Keer Road, Behind Paradise Cinema, Mahim West',1,20,486,'Mumbai',400016,'Guest House currently','0','AZHPV6024F',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,5,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(242,'1138','EMP0000242',NULL,NULL,'Shefali',NULL,'Arora','1993-12-18','Female','8435139445',NULL,'shefali.arora@sganalytics.com','H-448 , Aadharshila, Essarjee, East block, Awadhpuri',1,23,550,'Bhopal',0,'Guest House currently','0','BQRPA1921J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(243,'1139','EMP0000243',NULL,NULL,'Vikram',NULL,'Gupta','1995-05-21','Male','7839218872',NULL,'vikram.gupta@sganalytics.com','Sr. 704 Block, Saraswati Apartment, River View, Gomti Nagar',1,NULL,NULL,NULL,226010,'Guest House currently','0','BQWPG0024P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(244,'1140','EMP0000244',NULL,NULL,'Surabhi',NULL,'Singh','1990-08-16','Female','9755233255',NULL,'surabhi.singh@sganalytics.com','93-B , Nehru Park colony, Prem Nagar, P.O. Izzatnagar',1,NULL,NULL,NULL,0,'Guest House currently','0','EVUPS8926Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(245,'1141','EMP0000245',NULL,NULL,'Vishakha',NULL,'Avhad','1991-06-11','Female','8928009180',NULL,'vishakha.avhad@sganalytics.com','11, Arya Apartment, Kala Nagar, Jail Road',1,20,492,'Nashik',0,'Guest House currently','0','BKYPA1823N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(246,'1142','EMP0000246',NULL,NULL,'Samaksh',NULL,'Dahiya','1989-07-31','Male','7709564863',NULL,'samaksh.dahiya@sganalytics.com','A -1 / 261, Paschim Vihar',1,NULL,NULL,'New Delhi',63,'C - 902, The Latitude, NIBM, Kondwa','0','BHQPD2391M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(247,'1143','EMP0000247',NULL,NULL,'Subhrajyoti',NULL,'Ray','1988-09-26','Male','9158742416',NULL,'subhrajyoti.roy@sganalytics.com','LIV - 446, 4th Phase, Dumduma, H.B Colony',1,26,NULL,'Bhubaneswar',751019,'Guest House currently','0','BASPR6810A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(248,'1145','EMP0000248',NULL,NULL,'Anil',NULL,'Kumar','1994-09-23','Male','9695406049',NULL,'anil.kumar@sganalytics.com','H. No. 1581, LIG HBC , Sector 04',1,14,NULL,'Karnal',0,'Guest House currently','0','CTAPK9522L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(249,'1150','EMP0000249',NULL,NULL,'Siddharth',NULL,'Babani','1992-02-05','Male','8698020266',NULL,'siddharth.babani@sganalytics.com','D-3 , Hermes Heights, ST. Vincents street , Camp, 4th Floor',1,20,504,'Pune',411001,'D-3 , Hermes Heights, ST. Vincents street , Camp, 4th Floor, Pune -1','0','BSPPB1209N',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(250,'1153','EMP0000250',NULL,NULL,'Sri','Krishna','Hasa Yalamanchili','1987-01-26','Female','9000081295',NULL,'srikrishna.hasa@sganalytics.com','Flat - 202, Srinivasam , 31-16-18, Bullemma Street, Machavaram down',1,2,62,'Vijayawada',520004,'Flat - 1202, Tower-17, Amanora Township, Hadapsar - 411028','0','CIPPS3976L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(251,'1155','EMP0000251',NULL,NULL,'Supriya',NULL,'Sindkhedkar','1990-12-11','Female','8275411160',NULL,'supriya.sindkhedkar@sganalytics.com','Aashirwad Niwas, In front of Radha Krishna theatre, Kawar nagar',1,20,429,'Akola',444001,'Raj Mahal Building, H-18, Nr. Geuba Moses school, Yerawada,Pune','0','EQLPS8645N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(252,'1156','EMP0000252',NULL,NULL,'Viksha',NULL,'Upadhyay','1992-01-23','Female','8237641244',NULL,'viksha.upadhyay@sganalytics.com','Govt Quarter 2, Kedarpur Ambikapur, Surguja',1,NULL,NULL,NULL,0,'Silver Leaf 4A, Ramnagar colony, Bavdhan, Pune','0','ACRPU2719F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:15','2017-05-12 09:40:15',NULL,NULL,NULL,NULL,NULL,NULL),(253,'1159','EMP0000253',NULL,NULL,'Shashi',NULL,'Agarwal','1978-10-02','Male','9892252700',NULL,'shashi.agarwal@sganalytics.com','LIG - 206, Kotra Sultanabad',1,23,550,'Bhopal',462003,'LIG - 206, Kotra Sultanabad, Bhopal, MP 462003','0','AINPA0752G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(254,'1163','EMP0000254',NULL,NULL,'Amandeep',NULL,'Chanyal','1994-04-23','Male','9800161599',NULL,'amandeep.chanyal@sganalytics.com','Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road',1,34,NULL,'Haldwani',263139,'Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road, Haldwani, Dist Nainital, Uttarakhand - 263139','0','AVUPC9932A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(255,'1164','EMP0000255',NULL,NULL,'Shubham',NULL,'Agarwal','1994-08-12','Male','8972318731',NULL,'shubham.agarwal@sganalytics.com','D-4089, 4th Floor, Bima Complex, Kalamboli',1,20,NULL,'Navi Mumbai',410218,'D-4089, 4th Floor, Bima Complex, Kalamboli, Navi Mumbai- 410218','0','BURPA7875H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(256,'1165','EMP0000256',NULL,NULL,'Gavini',NULL,'Tharun','1994-08-17','Male','9002304113',NULL,'gavini.tharun@sganalytics.com','15-22, Padmavathi Nagar, Kamala Sadanan upstairs',1,2,NULL,'Tirupathi',517502,'15-22, Padmavathi Nagar, Kamala Sadanan upstairs, Tirupathi, 517502, Chitoor dist, Andhra Pradesh','0','ASYPT5751D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(257,'1166','EMP0000257',NULL,NULL,'Manas','Ranjan','Sahoo','1994-03-25','Male','9932584032',NULL,'manas.sahoo@sganalytics.com','B-2181, Narmada Vihar, NTPC Township',1,NULL,124,'Jamnipali',495450,'B-2181, Narmada Vihar, NTPC Township, Jamnipali, Korba, Chattisgarh-495450','0','FGVPS8484L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(258,'1169','EMP0000258',NULL,NULL,'Chaitanya',NULL,'Bhokare','1988-09-12','Male','9766859441',NULL,'chaitanya.bhokare@sganalytics.com','Parijat, Nr Phadke hospital, Jatharpeth',1,20,429,'Akola',444005,'\"Parijat\", Nr Phadke hospital, Jatharpeth, Akola - 444005','0','AVNPB2367F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(259,'1170','EMP0000259',NULL,NULL,'Shalini',NULL,'Sharma','1991-07-26','Female','8888839753',NULL,'shalini.sharma@sganalytics.com','13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi',1,NULL,NULL,NULL,180001,'13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi, Jammu & KASHMIR - 180001','0','ERQPS7103R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(260,'1171','EMP0000260',NULL,NULL,'Divya',NULL,'Chainani','1993-03-23','Female','88062331345',NULL,'divya.chainani@sganalytics.com','118/58,Kaushalpuri',1,35,925,'Kanpur',208012,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','AWBPC3777B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(261,'1172','EMP0000261',NULL,NULL,'Anshika',NULL,'Gandotra','1991-07-03','Female','9552271494',NULL,'anshika.gandotra@sganalytics.com','13, Sravana, RC Church, Colaba',1,20,486,'Mumbai',400001,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','ASCPG0051B',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(262,'1173','EMP0000262',NULL,NULL,'Vikas',NULL,'Unnikkannan','1992-04-15','Male','7387431526',NULL,' vikas.unnikkannan@sganalytics.com','Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa',1,20,504,'Pune',411048,'Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa, Pune - 411048','0','ADMPU7281L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(263,'1174','EMP0000263',NULL,NULL,'Shruti',NULL,'Vidwans','1986-02-01','Female','9881575599',NULL,'shruti.vidwans@sganalytics.com','400 B, Jaygad Apts., United Western Society, Karve Nagar',1,20,504,'Pune',411052,'400 B, Jaygad Apts., United Western Society, Karve Nagar, Pune - 411052','0','BDUPS7466N',NULL,'Widow',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(264,'1178','EMP0000264',NULL,NULL,'Poonam',NULL,'Raskar','1990-10-04','Female','9028515258',NULL,'poonam.raskar@sganalytics.com','A/702, Sukhwani Emerald, Near Sundar Sankul, Magarpatta',1,20,504,'Pune',411028,'A/702, Sukhwani Emerald, Near Sundar Sankul, Magarpatta, Pune - 411028','0','AYFPR4905G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(265,'1180','EMP0000265',NULL,NULL,'Jitendra','Kumar','Teli','1986-11-30','Male','9765287154',NULL,'jitendra.teli@sganalytics.com','76, Gumasta Nagar',1,23,564,'Indore',452009,'Lunkad Heritage, Viman Nagar, Pune','0','AJKPT1618G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(266,'1181','EMP0000266',NULL,NULL,'Shantanu',NULL,'Maddiwar','1990-05-14','Male','7875867656',NULL,'shantanu.maddiwar@sganalytics.com','F2, Gulmohar Plaza, Datala Road, Ramnagar',1,20,NULL,'Chandrapur',442401,'Siddhi Paying Guest, Opp Forest Country lane, Kharadi','0','AVKPM1617N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(267,'1183','EMP0000267',NULL,NULL,'Prachi',NULL,'Jain','1992-11-26','Female','8085475799',NULL,'prachi.jain@sganalytics.com','Flat - 203, Inner court, GTB Complex, T T Nagar',1,23,550,'Bhopal',0,'L804, Cosmos Society, Magarpatta,Hadapsar, Pune','0','ATNPJ6287G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:16','2017-05-12 09:40:16',NULL,NULL,NULL,NULL,NULL,NULL),(268,'1184','EMP0000268',NULL,NULL,'Sanaya',NULL,'Shaikh','1988-09-28','Female','9923329049',NULL,'sanaya.shaikh@sganalytics.com','H No 1-10-48, Juna Bazar',1,20,255,'Aurangabad',0,'Flat 503, B-11, R-Euphoria Society, Kondhwa Budruk, Opp Jalab Farms, Pune - 411048','0','CGEPS1986D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(269,'1185','EMP0000269',NULL,NULL,'Tushar',NULL,'Chugh','1994-03-29','Male','9416039078',NULL,'tushar.chugh@sganalytics.com','525, Huda -20, Kaithal',1,14,NULL,NULL,0,'6 Raja Apartment, Model Colony, Pune','0','BFQPC2888Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(270,'1189','EMP0000270',NULL,NULL,'Radheshyam',NULL,'Moholkar','1984-06-07','Male','7718899482',NULL,'radheshyam.moholkar@sganalytics.com','102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner',1,20,504,'Pune',411045,'102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner, Pune - 411045','0','ANNPM2934R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(271,'1195','EMP0000271',NULL,NULL,'Radhika',NULL,'Iyer','1994-11-28','Female','8796917089',NULL,'radhika.iyer@sganalytics.com','44,45,46, Rasta Peth, Nr. Lakheri Maruti Chowk, 201, Sumadhan Apt, Jews Street',1,20,504,'Pune',411011,'44,45,46 Rasta Peth, Nr. Lakheri Maruti Chowk,201, Sumadhan Apt, Jews Street, Pune - 411011','0','AEFP12320N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(272,'1197','EMP0000272',NULL,NULL,'Rajesh',NULL,'Viswanath','1978-12-11','Male','9886160022',NULL,'rajesh.viswanath@sganalytics.com','#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya',1,17,NULL,'Bengaluru',0,'#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya, Bengaluru','0','AFGPR9583Q',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(273,'1198','EMP0000273',NULL,NULL,'Priyanka',NULL,'Agrawal','1990-10-24','Female','8976683696',NULL,'priyanka.agrawal@sganalytics.com','A-204, Green Divine, Nr. Amanora, Hadapsar',1,20,504,'Pune',0,'A-204, Green Divine, Nr. Amanora , Hadapsar, Pune','0','AURPA9306N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(274,'1199','EMP0000274',NULL,NULL,'Harshal',NULL,'Patil','1991-04-18','Male','8087513172',NULL,'harshal.patil@sganalytics.com','Plot No. 36, Vivekanand Nagar, Bhadgaon road',1,20,NULL,'Pachora',0,'House No 57, Pimple Gurav, Pune - 411061','0','DFIPP7319D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(275,'1202','EMP0000275',NULL,NULL,'Ninad',NULL,'Suratkar','1993-03-07','Male','7798634778',NULL,'ninad.suratkar@sganalytics.com','G/4, Fokhale Vrindavan, Chinchwad',1,20,504,'Pune',411033,'G/4, Fokhale Vrindavan, Chinchwad, Pune-411033','0','DLJPS3590G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(276,'1203','EMP0000276',NULL,NULL,'Varad',NULL,'Sharma','1989-10-12','Male','8978918520',NULL,'varad.sharma@sganalytics.com','H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu(Tawi)',1,NULL,NULL,NULL,180002,'H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu( Tawi)- 180002','0','BSLPS6922F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(277,'1209','EMP0000277',NULL,NULL,'Geetesh',NULL,'Binjhade','1990-05-17','Male','9907321095',NULL,'geetesh.binjhade@sganalytics.com','House No. 1328, Nagpur Road, BSNL Colony, SARRA, Post Imlikheda',1,23,553,NULL,0,'House No. 1328, Nagpur Road, BSNL Colony, SARRA , Post Imlikheda, Chhindwara, MP','0','BKGPB5919N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(278,'1210','EMP0000278',NULL,NULL,'Heena',NULL,'Phulwani','1993-10-20','Female','7879949561',NULL,'heena.phulwani@sganalytics.com','Ward No. 37,7816, Jamidar Colony, Ramtekri',1,23,NULL,'Mandsaur',458001,'Ward No. 37, 7816, Jamidar Colony, Ramtekri, Mandsaur, M.P - 458001','0','CVSPP3631B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(279,'1211','EMP0000279',NULL,NULL,'Varun',NULL,'Janardhan','1988-07-26','Male','9096217076',NULL,'varun.janardhan@sganalytics.com','C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran',1,20,504,'Pune',412114,'C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran, Pune-412114','0','ALGPJ5296E',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(280,'1212','EMP0000280',NULL,NULL,'Satyarshi',NULL,'Mishra','1990-04-26','Male','9595331390',NULL,'satyarashi.mishra@sganalytics.com','H. No 85, Sachcha Kuteer,Laxmanpur Colony, Allahabad Road',1,35,NULL,'Sultanpur',228001,'Flat No. 307, Matoshri Building, Patil Nagar, Bavdhan, Pune-411021','0','BAUPM9697L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(281,'1213','EMP0000281',NULL,NULL,'Vikas',NULL,'Divate','1990-11-14','Male','9028098017',NULL,'vikas.divate@sganalytics.com','Divate Kirana, Abinav Nagar, Navin Nagar Road',1,NULL,NULL,'Sangamner',422605,'B - 14, Pushpa Apartment, Kothrud, Pune - 411038','0','ANCPD3009P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(282,'1214','EMP0000282',NULL,NULL,'Shweta',NULL,'Pandey','1982-03-01','Female','9717885757',NULL,'shweta.pandey@sganalytics.com','House No 2542, Coriender Bldg, Vijaya Gardens, Baridih',1,NULL,297,'Jamshedpur',0,'Guest House currently','0','ARJPP1028P',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(283,'1216','EMP0000283',NULL,NULL,'Jaikishan',NULL,'Dhanwani','1990-10-27','Male','9898224111',NULL,'jaikishan.dhanwani@sganalytics.com','13/ B-5, Gokul Nagar Society, Makarpura Road, Opp ONGC',1,12,227,'Vadodara',390009,'Flat No. 11, Block No. C, Seetai Park,Opp Kaka Halwai Shop, Aundh, D P Road, Pune-411007','0','AQFPD6017P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:17','2017-05-12 09:40:17',NULL,NULL,NULL,NULL,NULL,NULL),(284,'1217','EMP0000284',NULL,NULL,'Rishi',NULL,'Jayswal','1992-03-09','Male','9158053177',NULL,'rishi.jayswal@sganalytics.com','2/C, d.l Roy Street',1,36,1008,'Kolkata',700006,'Guest House currently','0','APMPJ2844N',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(285,'1218','EMP0000285',NULL,NULL,'A','Harish','Rao','1983-10-28','Male','9818948028',NULL,'aharish.rao@sganalytics.com','Holding No.4, Road 4, Contractors Area',1,NULL,297,'Bistupur',831001,'RH-13, Mahesh Society, Sambhajinagar, Chinchwad, Pune','0','AKWPR2786A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(286,'1219','EMP0000286',NULL,NULL,'Roshan',NULL,'Kumar','1985-04-15','Male','9999595619',NULL,'roshan.kumar@sganalytics.com','Ward No 09, P.O Brpur',1,5,NULL,NULL,854340,'D1-304, Ganga Constella, Kharadi','0','AWCPK1116B',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(287,'1220','EMP0000287',NULL,NULL,'Nishant',NULL,'Mantri','1987-11-21','Male','9972098115',NULL,'nishant.mantri@sganalytics.com','H No 4118 - 19, Karwa Nagar, Mantha Road ',1,NULL,NULL,'Jalna',431203,'F7 / 25, Hermes Heritage, Phase II, Shastri Nagar, Yerwada , Pune 411006','0','APHPM3028E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(288,'1221','EMP0000288',NULL,NULL,'Mangesh',NULL,'Shinde','1989-01-01','Male','9561317990',NULL,'mangesh.shinde@sganalytics.com','S.R. No.4812, Dhanlaxmi Society, Ganesh Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'S.R. No.4812, Dhanlaxmi Society, ganesh Nagar, Wadgaonsheri, Pune 411014','0','CNIPSO730G',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(289,'1222','EMP0000289',NULL,NULL,'Ajay',NULL,'Shekhawat','1992-12-28','Male','7566438221',NULL,'ajay.shekhawat@sganalytics.com','689 Road No. 8, Nanda Nagar',1,23,564,'Indore',452011,'689 Road No. 8, Nanda Nagar, Indore, MP 452011','0','FXPPS0254H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(290,'1227','EMP0000290',NULL,NULL,'Pratiksha',NULL,'Mandhane','1993-10-19','Female','9421679907',NULL,'pratiksha.mandhane@sganalytics.com','Kaviraj Vishnu Nagar, Basmat Road',1,NULL,NULL,'Parbhani',431401,'Guest House Currently','0','BWRPM2996M',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(291,'1228','EMP0000291',NULL,NULL,'Kunal',NULL,'Doshi','1982-12-02','Male','9538034400',NULL,'kunal.doshi@sganalytics.com','45, Rajeshvari Colony, Isanpur Road, Mani Nagar',1,12,NULL,'Ahemdabad',380008,'Vascon Ela, B- 402, Malvadi, Behind Amanora Mall, Hadapsar, Pune - 411028 ','0','AJVPD7527P',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(292,'1229','EMP0000292',NULL,NULL,'Abhijeet',NULL,'Kumar','1988-05-18','Male','8374017219',NULL,'abhijeet.kumar@sganalytics.com','N - 58/7, Near Plaza Market, Telco Colony',1,NULL,297,'Jamshedpur',831004,'A - 204, Sri Ram Residency, Wagholi, Pune - 412207','0','AXMPK0670K',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(293,'1231','EMP0000293',NULL,NULL,'Krishna',NULL,'Bamezai','1989-08-15','Male','7875790046',NULL,'krishna.bamezai@sganalytics.com','17/4, Pandoka Colony, Paloura',1,NULL,NULL,'Jammu',0,'302, Mithila, Shree Siddhivinayak Sankalp, Undri, Pune - 60','0','CKZPB8985N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(294,'1232','EMP0000294',NULL,NULL,'Viveki',NULL,'Singh','1993-02-11','Female','7680062851',NULL,'viveki.singh@sganalytics.com','Dr no - 403, BGM Patrudu Residency, Coromandel Gate',1,2,NULL,'Vishakapatnam',530011,'Shree Sai PG, Sangharsh Chowk, Chandan Nagar, Pune','0','DGFPS4140M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(295,'1238','EMP0000295',NULL,NULL,'Chaitanya',NULL,'Nandan','1993-01-30','Male','7507985936',NULL,'chaitanya.nandan@sganalytics.com','Yajurwed Housing Society,Opp Megharaj, Peth Road',1,20,492,'Nashik',0,'Sai Nagari, Lane No. 9, Chandan Nagar, Pune - 411014','0','AXVPN5265A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(296,'1239','EMP0000296',NULL,NULL,'Manasi',NULL,'Das','1983-12-25','Female','9731290700',NULL,'manasi.das@sganalytics.com','A-26, Eldeco Green Meadows, Sector P',1,35,NULL,'Greater Noida',0,'F-501, Marvel Ritz, Tupe Road, Behind Amanora Mall,Hadapsar, pune','0','ATWPB8080A',NULL,'Divorced',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(297,'1240','EMP0000297',NULL,NULL,'Santosh',NULL,'Kurade','1989-05-11','Male','9664907175',NULL,'santosh.kurade@sganalytics.com','At/P, Wagharali, Tal Gahinglaj',1,20,479,'Kolhapur',0,'At/P, Wagharali, Tal Gahinglaj, Kolhapur','0','BMMPK0996C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(298,'1242','EMP0000298',NULL,NULL,'Rohit',NULL,'Jain','1987-06-21','Male','9049070088',NULL,'rohit.jain@sganalytics.com','240, Jain Nagar',1,23,550,'Bhopal',462030,'B-301, Gokul Crest, Sakore Nagar, Pune-411014','0','AMAPJ4881A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(299,'1243','EMP0000299',NULL,NULL,'Suraj',NULL,'Dudhe','1985-02-24','Male','9545088288',NULL,'suraj.dudhe@sganalytics.com','Main Road, At    Kelor Saoner',1,20,488,'Nagpur',441112,'B6/302, Phase -II, Tirupati Campus, Road No. 2, Tingre Nagar, Vishrantwadi,Pune - 411015','0','ALZPD6503B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(300,'1244','EMP0000300',NULL,NULL,'Priyanka',NULL,'Padhi','1991-06-25','Female','8080849736',NULL,'priyanka.padhi@sganalytics.com','2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill',1,20,486,'Mumbai',400031,'2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill, Mumbai - 400031','0','BQZPP3895A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:18','2017-05-12 09:40:18',NULL,NULL,NULL,NULL,NULL,NULL),(301,'1247','EMP0000301',NULL,NULL,'June',NULL,'Biswas','1987-05-04','Female','8698909762',NULL,'june.biswas@sganalytics.com','903, B11, Margosa Heights, Mohammadwadi',1,20,504,'Pune',411060,'903, B11, Margosa Heights, Mohammadwadi, Pune - 411060','0','APDPB4354G',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(302,'1248','EMP0000302',NULL,NULL,'Kishore','Varma','Addepalli','1984-10-02','Male','9491571311',NULL,'kishorevarma.addepalli@sganalytics.com','Plot No. 351/ A, Flat No F 4, Om Sai Sudha  Residency, Vandanapuri Colony, Road No 2, Beeramguda, Patancheru Mandal',1,NULL,NULL,NULL,0,'Guest House currently','0','AMLPA6854H',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(303,'1249','EMP0000303',NULL,NULL,'Sweta',NULL,'Jaiswal','1991-01-14','Female','7350714214',NULL,'sweta.jaiswal@sganalytics.com','Type - 2B / 1712, HAL T/S, Ojar',1,20,492,'Nashik',422207,'318 A & B, Snehsagar Apt, Plot No. 9 & 10, Shukrawar Peth, Pune - 411002','0','ATVPJ3128L',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(304,'1250','EMP0000304',NULL,NULL,'Namrata',NULL,'Jagade','1988-02-08','Female','9527778877',NULL,'namrata.jagade@sganalytics.com','Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road',1,20,504,'Pune',411051,'Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road, Pune - 411051','0','ALCPJ5684L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(305,'1251','EMP0000305',NULL,NULL,'Neha',NULL,'Deshpande','1988-05-04','Female','7378315486',NULL,'neha.deshpande@sganalytics.com','Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe',1,20,504,'Pune',411041,'Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe, Pune 411 041','0','BVGPD9787B',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(306,'1252','EMP0000306',NULL,NULL,'Gouree',NULL,'Gurjar','1982-08-28','Female','9673992306',NULL,'gouree.gurjar@sganalytics.com','F- 701, Maple Woodz, Wagholi',1,20,504,'Pune',0,'F- 701, Maple Woodz, Wagholi, Pune','0','BKWPP7332P',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(307,'1253','EMP0000307',NULL,NULL,'Ashish','Kumar','Jain','1984-12-05','Male','9701810370',NULL,'ashish.jain@sganalytics.com','House No. 28, 2nd Floor, Street No. 3, New Krishna Nagar',1,NULL,NULL,'Delhi',110051,'House No. 28, 2nd Floor, Street No. 3,  New Krishna Nagar, Delhi - 110051','0','AJXPJ0188J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(308,'1254','EMP0000308',NULL,NULL,'Tony',NULL,'Thomas','1990-01-04','Male','7507191303',NULL,'tony.thomas@sganalytics.com','C-8/ 72, Century Enka, Col No. 2, Bhosari',1,20,504,'Pune',411039,'A2, Karishma Glory Hsg Society, Ajmera, Morwadi, Pimpri, Pune - 411018','0','AOAPT1539F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(309,'1255','EMP0000309',NULL,NULL,'Zahoor',NULL,'Hurrah','1989-12-18','Male','8087395066',NULL,'zahoor.hurrah@sganalytics.com','Nigeen Bagh, Krankshivan Colony, Sopore',1,NULL,NULL,'Kashmir',0,'Flat No. 504, Cindrella Apartment,  Shivneri Nagar,Kondhwa, Pune','0','AHNPHQ794A',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(310,'1256','EMP0000310',NULL,NULL,'Akshay',NULL,'Sahani','1992-10-17','Male','9579712663',NULL,'akshay.sahani@sganalytics.com','Flat No. 103, Plot No - 378, Sector-E, N-1, CIDCO',1,20,255,'Aurangabad',431003,'S. No- 22, Pavlina Terrace, Sopan Nagar Road, Wadgaon sheri, Pune - 411014','0','ESXPS1859C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(311,'1257','EMP0000311',NULL,NULL,'Ritu',NULL,'Sahewalla','1988-11-09','Female','9958121080',NULL,'ritu.sahewalla@sganalytics.com','Jai Bharat Tubewell store, Begu Road',1,14,NULL,'Sirsa',725055,'A-503, Downtown Langston, Kolte Patil, Kharadi, Pune - 411014','0','ANKPR8176R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(312,'1258','EMP0000312',NULL,NULL,'Vikas',NULL,'Dimaniya','1988-01-06','Male','9599927746',NULL,'vikas.dimaniya@sganalytics.com','House no. 183/1,New mandi keshru khera',1,35,940,'Meerut',250001,'House no. 183/1,New mandi keshru khera,Meerut cantt – 250001\n','0','BBKPD2052H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(313,'1259','EMP0000313',NULL,NULL,'Digvijay','Kumar','Kashyap','1982-02-09','Male','9920179210',NULL,'digvijay.kashyap@sganalytics.com','Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad',1,20,504,'Pune',411057,'Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad,Pune -411057\n','0','AXPPK8711J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(314,'1260','EMP0000314',NULL,NULL,'Vineeth',NULL,'CL','1990-07-01','Male','7066794553',NULL,'vineeth.cl@sganalytics.com','Cyrus House, Nr SNDP, Trichambaran, Taliparamba',1,18,391,'Kannur',670141,'Cyrus House, Nr SNDP, Trichambaran, Taliparamba, Kannur, Kerala-670141','0','AQQPC1113N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(315,'1262','EMP0000315',NULL,NULL,'Ramkrishna',NULL,'Umre','1981-11-01','Male','8451948400',NULL,'ramkrishna.umre@sganalytics.com','Balaji Colony, Behind SBI Agri Development Branch',1,23,563,'Babai',0,'1204, B-8, Park Infinia, Gurudatta Nagar, Fursungi, Pune','0','AMRPR51424',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(316,'1263','EMP0000316',NULL,NULL,'Arti',NULL,'Saproo','1977-09-17','Female','9711497477',NULL,'arti.saproo@sganalytics.com','No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli',1,17,NULL,'Bengaluru',560097,'No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli,Bangalore - 560097','0','ATBPS7910D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:19','2017-05-12 09:40:19',NULL,NULL,NULL,NULL,NULL,NULL),(317,'1264','EMP0000317',NULL,NULL,'Varun',NULL,'Gupta','1991-06-15','Male','9960732898',NULL,'varun.gupta@sganalytics.com','Gupta Flour & Oil Ind, Mohata Mill Road, Naya Jin',1,20,429,'Akola',0,'Flat No 12, Rajyog Heights, Ganpati Chowk, Viman Nagar, Pune','0','ASOPG5576F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(318,'1265','EMP0000318',NULL,NULL,'Gaurav',NULL,'Shukla','1982-04-18','Male','9582898882',NULL,'gaurav.shukla@sganalytics.com','G - 271, 2nd Floor, Sushant, LOK- 2, Sector 57',1,14,NULL,'Gurgaon',122010,'Flat no. 302, Tower 51,Future Towers, Amanora Park Town,Hadapsar, Pune – 411028','0','BEFPS3078J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(319,'1266','EMP0000319',NULL,NULL,'Sumeet',NULL,'Ranglani','1992-12-30','Male','7507002106',NULL,'sumeet.ranglani@sganalytics.com','B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh',1,20,504,'Pune',411007,'B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh, Pune - 411007','0','AZPPR0939M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(320,'1267','EMP0000320',NULL,NULL,'Vicky',NULL,'Lokhande','1989-02-26','Male','9130430440',NULL,'NA','Sangamwadi, Near Ram Mandir, Khadki',1,20,504,'Pune',411003,'Sangamwadi, Near Ram Mandir, Khadki, Pune - 411003','0','Not Available',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,1,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(321,'1268','EMP0000321',NULL,NULL,'Ankit',NULL,'Shankhwalker','1991-03-28','Male','9049340293',NULL,'ankit.shankhwalker@sganalytics.com','Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar, Panaji',1,NULL,NULL,'Goa',0,'Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar , Panaji, Goa','0','BOYPK5913B',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(322,'1269','EMP0000322',NULL,NULL,'Richa',NULL,'Sharma','1988-11-02','Female','9993959742',NULL,'richa.sharma@sganalytics.com','14, Karariya Farm, Koluvada Bagicha, Khushipura ward 36, Tehsil Huzur',1,23,550,'Bhopal',462010,'Sagar Park  Society, Lane No.3, Samadhan,  Near Sarvodaya hotel,Chandan nagar,  Nagar Road, Pune','0','ECVPS7813A',NULL,'Unmarried',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(323,'1271','EMP0000323',NULL,NULL,'Rajib',NULL,'Das','1982-04-11','Male','9420410815',NULL,'rajib.das@sganalytics.com','Bandhgara, Bolpur',1,36,NULL,'Birbhum',731204,'B-505, S3,Lifestyle Apt, Kunal Icon Road, Pimple Saudagar, Pune - 411027','0','AOSPD8740G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:20','2017-05-12 09:40:20',NULL,NULL,NULL,NULL,NULL,NULL),(324,'1272','EMP0000324',NULL,NULL,'Ankit',NULL,'Maheshwari','1978-06-30','Male','9765406615',NULL,'ankit.maheshwari@sganalytics.com','G-801, Marvel Zephyr, Kharadi',1,20,504,'Pune',411014,'G-801, Marvel Zephyr, Kharadi, Pune - 411014','0','AJQPM6553M',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(325,'1273','EMP0000325',NULL,NULL,'Imroz',NULL,'Khan','1991-01-10','Male','9319239923',NULL,'imroz.khan@sganalytics.com','H No 539, Gali Chobdaran, Mandi Ram Dass ',1,35,938,'Mathura',0,'E-103, Downtown Langston, Fountain Road, Kharadi, Pune','0','DASPK8557D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(326,'1274','EMP0000326',NULL,NULL,'Kunal',NULL,'Pateliya','1988-12-11','Male','8983700369',NULL,'kunal.pateliya@sganalytics.com','S/ No 29, Near R K puram, Munjaba Wasti, Dhanori',1,20,504,'Pune',411015,'S/ No 29, Near R K puram, Munjaba Wasti, Dhanori, Pune - 411015','0','AXYPP5691H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(327,'1275','EMP0000327',NULL,NULL,'Yogesh',NULL,'Hanse','1990-07-06','Male','9673119987',NULL,'yogesh.hanse@sganalytics.com','Ganesh Nagar, col No. 9 ,Bppkhel, CME',1,20,504,'Pune',411031,'Ganesh Nagar, col No. 9 ,Bppkhel, CME, Pune -  411 031','0','AGDPH6228A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(328,'1276','EMP0000328',NULL,NULL,'Prasad',NULL,'Galinde','1989-10-06','Male','9028795550',NULL,'prasad.galinde@sganalytics.com','Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi',1,20,504,'Pune',411014,'Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi, Pune - 411014','0','BKAPG5250K',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(329,'1277','EMP0000329',NULL,NULL,'D',NULL,'Kusuma','1987-05-03','Female','9545466542',NULL,'d.kusuma@sganalytics.com','Flat No. 416, GCN White Palms, Ramagondanahalli, Narayanpura Road',1,17,NULL,'Bengaluru',560066,'# 602B, Anshul Athena Society, Sainath Nagar, Wadgaonsheri, Pune','0','BZPPKOO53G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(330,'1278','EMP0000330',NULL,NULL,'Sandip',NULL,'Chavan','1983-06-13','Male','9011937481',NULL,'sandip.chavan@sganalytics.com','A/P Devale, Tal Panhala',1,20,479,'Kolhapur',0,'Mahadev Nagar, Manjri Road, Hadapsar, Pune - 28','0','AJLPC2618Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(331,'1279','EMP0000331',NULL,NULL,'Devi','Prasad','Swain','1991-12-20','Male','7873470610',NULL,'devi.swain@sganalytics.com','Plot No. B2 /128, Lingaraj Vihar, Pokhariput',1,26,NULL,'Bhubaneshwar',0,'Plot No. B2 /128, Lingaraj Vihar, Pokhariput, Bhubaneshwar, Odisha','0','FTIPS6420N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,6,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(332,'1280','EMP0000332',NULL,NULL,'Varun',NULL,'Hatmode','1982-03-03','Male','7507610468',NULL,'varun.hatmode@sganalytics.com','Plot No 24, Asmita Colony, Narendra Nagar',1,20,488,'Nagpur',440015,'C3/1201, Colonnade Society, Kharadi Bypass road, Kharadi, Pune - 411014','0','ACPPH2566R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(333,'1281','EMP0000333',NULL,NULL,'Sourish',NULL,'Chatterjee','1994-11-28','Male','8390739122',NULL,'sourish.chatterjee@sganalytics.com','1, Tilak Road',1,36,1008,'Kolkata',700029,'1, Tilak Road, Kolkata - 700029','0','AZDPC4950H',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(334,'1282','EMP0000334',NULL,NULL,'Dyamaapa','Dummi','Nataraj','1988-01-18','Male','9916855568',NULL,'dyamappa.nataraj@sganalytics.com','No. 114, Dummi-1, Hollakere',1,17,NULL,'Chitradurga',0,'Maneesh Neelaya No. 24, 3rd Floor, 11th MAIN, 9TH Cross road, Raghavendra layout, Kammagondanahari - 560015, Bangalore','0','BNBPD4822N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(335,'1283','EMP0000335',NULL,NULL,'Tarun','Bhargav','Paladugu','1987-05-13','Male','9599376349',NULL,'tarun.bhargav@sganalytics.com','3, Golden Oak Apartments, Defence Colony, Sainik Puri',1,2,NULL,'Secunderabad',56,'003, Golden Oak Apartments, Defence Colony, Sainik Puri, Secunderabad - 56','0','ARGPP6515J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(336,'1287','EMP0000336',NULL,NULL,'Anshul',NULL,'Yadav','1988-03-21','Male','9811841346',NULL,'anshul.yadav@sganalytics.com','434/8, Defence Officers Enclave, SP Marg, Chanakyapuri',1,NULL,NULL,'New Delhi',110021,'434/8, Defence Officers Enclave, SP Marg, Chanakyapuri, New Delhi - 110021','0','ACRPY2633G',NULL,'Married',8,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(337,'1288','EMP0000337',NULL,NULL,'Dhananjay',NULL,'Ramkrishnan','1991-04-29','Male','7276234569',NULL,'dhananjay.ramkrishnan@sganalytics.com','B-303, Ramrajya Planet, Near Datta Mandir, Old Mumbai Pune Highway 2, Kasarwadi',1,20,504,'Pune',411034,'B-303, Ramrajya Planet, Near Datta Mandir, Old Mumbai Pune Highway, Kasarwadi, Pune - 411034','0','ATPPR5212F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(338,'1289','EMP0000338',NULL,NULL,'Priyanka',NULL,'Thombre','1993-11-13','Female','7353125767',NULL,'priyanka.thombre@sganalytics.com','H. No. 26, Sainik Nagar, Laxmi Tek',1,17,322,'Belgaum',0,'Flat No. 201, Sainath Nagar, Karan Rhea, Wadgaonsheri','0','AUBPT3103C',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:21','2017-05-12 09:40:21',NULL,NULL,NULL,NULL,NULL,NULL),(339,'1290','EMP0000339',NULL,NULL,'Manmeet',NULL,'Singh','1992-03-11','Male','8897459307',NULL,'manmeet.singh@sganalytics.com','4633/24, Guru Nanak Wara, Putli Ghar, P.O Khalsa College',1,NULL,623,'Amritsar',143001,'4633/24, Guru Nanak Wara, Putli ghar, P.O Khalsa College, Amritsar 143001','0','FOAPS4251G',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(340,'1292','EMP0000340',NULL,NULL,'Swapnil',NULL,'Badgire','1993-05-17','Male','9422655805',NULL,'swapnil.badgire@sganalytics.com','Vyankatesh Nivas, Yerme Nagar, Nr. DED College, Udgir',1,20,480,'Latur',413517,'S. No. 45/ A, Manthan Society, Somnath Nagar, Wadgaon Sheri, Pune 411014','0','BQKPB2258J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(341,'1293','EMP0000341',NULL,NULL,'Alay',NULL,'Nallulwar','1986-12-19','Male','8698982249',NULL,'alay.nallulwar@sganalytics.com','42739, Professor Quarters, Nr. Luft Restaurant, Opp Uni Boys hostel, Navrangpura',1,12,170,'Ahmedabad',0,'D-271, Kumar Priyadarshan, Nr. Balaji Temple, Balaji Chowk, Sus Pashan Road, Pashan, Pune 411021','0','AMJPN9378D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(342,'1295','EMP0000342',NULL,NULL,'Shwetank',NULL,'Dwivedi','1992-05-25','Male','9811886880',NULL,'shwetank.dwivedi@sganalytics.com','83, GF2, Gohmuri',1,NULL,297,'Jamshedpur',0,'Rukminini,Sasanenagar, Hadapsar, Pune','0','BOFPD5272M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(343,'1296','EMP0000343',NULL,NULL,'Mahesh',NULL,'Nema','1990-09-20','Male','9752746160',NULL,'mahesh.nema@sganalytics.com','42, Naya Bazar 1, Mahatma Gandhi Ward',1,35,NULL,'Damoh',0,'42, Naya Bazar 1, Mahatma Gandhi Ward, Damoh, UP','0','ALIPN7746H',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(344,'1297','EMP0000344',NULL,NULL,'Sunayana',NULL,'Girme','1988-09-27','Female','9922009078',NULL,'sunayana.girme@sganalytics.com','S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud',1,20,504,'Pune',411021,'S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud. Pune - 21','0','AQPPG7637Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(345,'1299','EMP0000345',NULL,NULL,'Tanushree',NULL,'Das','1988-04-02','Female','9985556541',NULL,'tanushree.das@sganalytics.com','B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri, Pune - 411014','0','AYKPD6503H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(346,'1300','EMP0000346',NULL,NULL,'Manoj',NULL,'Kumar','1983-05-29','Male','9818093714',NULL,'manoj.kumar@sganalytics.com','R2H-226, Street-7, Rajnagar-II, Palam',1,NULL,NULL,'New Delhi',0,'R2H-226, Street-7, Rajnagar-II, Palam , New Delhi','0','BDKPK27195',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(347,'1301','EMP0000347',NULL,NULL,'Vinayak',NULL,'Joshi','1990-01-06','Male','9821463765',NULL,'vinayak.joshi@sganalytics.com','42875, B Wing, Sachin Society, Mithagar Road, Mulund (E)',1,20,486,'Mumbai',81,'5/20, B Wing, Sachin Society, Mithagar Road, Mulund ( E ), Mumbai - 81','0','AJVPJ0960C',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(348,'1302','EMP0000348',NULL,NULL,'Amruta',NULL,'Patil','1989-04-14','Female','8805543726',NULL,'amruta.patil@sganalytics.com','Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa',1,20,504,'Pune',411036,'Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa, Pune 411036','0','BGJPP7156G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(349,'1303','EMP0000349',NULL,NULL,'Paras',NULL,'Sachdeva','1994-10-04','Male','9818781379',NULL,'paras.sachdeva@sganalytics.com','H. No. 45,Mohalla Peerzadgan, Nr Juma Masjid, Rampur Maniharan',1,35,NULL,'Saharanpur',0,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','0','FQUPS4040B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(350,'1304','EMP0000350',NULL,NULL,'Namrata',NULL,'Kakade','1991-07-12','Female','7387434761',NULL,'namrata.kakade@sganalytics.com','208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar',1,20,504,'Pune',411020,'208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar, Pune - 411020','0','CAWPK2642E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(351,'1305','EMP0000351',NULL,NULL,'Sweekar',NULL,'TM','1990-08-31','Male','9945526729',NULL,'sweekar.tm@sganalytics.com','Venkateshwara general stores, Soraba Road, Sagar',1,17,NULL,NULL,577401,'Venkateshwara general stores, Soraba Road, Sagar- 577401, Shivamogga Dist, Karnataka','0','BAYPM4645L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(352,'1306','EMP0000352',NULL,NULL,'Mahesh',NULL,'Thengane','1990-09-17','Male','8149763624',NULL,'mahesh.thengane@sganalytics.com','Shri Sai Apt, Flat No. T-4, Ganpati ward',1,NULL,NULL,'Ballarpur',442701,'Om Sai bldg, Rajaram Patil Nagar, Lane no.2, nr. Forest County, Kharadi, Pune','0','AMOPT1337P',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(353,'1307','EMP0000353',NULL,NULL,'Yogesh',NULL,'Ghare','1989-06-19','Male','9552559530',NULL,'yogesh.ghare@sganalytics.com','255, Navi Sadashiv Peth, Nr LBS Road',1,20,504,'Pune',411030,'Someshwar apt, Wing B, Flat No. 29, Sinhagad road, Nr. Trimurti hospital, Pune','0','AQEPG4057B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(354,'1308','EMP0000354',NULL,NULL,'Sulaiman',NULL,'Islam','1982-03-07','Male','9706051105',NULL,'sulaiman.islam@sganalytics.com','VPO, Puranigudam, Na-Alimore',1,4,NULL,'Nagaon',782141,'Flat 306, Heritage, Bldg-3, NIBM , Undri road, Pune - 411060','0','AASP18414L',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:22','2017-05-12 09:40:22',NULL,NULL,NULL,NULL,NULL,NULL),(355,'1309','EMP0000355',NULL,NULL,'Deepak',NULL,'Abhale','1986-12-10','Male','9987704210',NULL,'deepak.abhale@sganalytics.com','B-404, Gopi Krishna Nagar, SN Dubey Road, Rawalpada, Dahisar(E)',1,20,486,'Mumbai',400068,'Swapna, S.No.6/2 , Lane No. 4, Nr. Reliance Mart, Charcoal Rest Lane, Kharadi, Pune-14','0','AKEPA8399J',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(356,'1310','EMP0000356',NULL,NULL,'Jisha',NULL,'Venugopal','1988-12-01','Female','9164718439',NULL,'jisha.venugopal@sganalytics.com','7, Keshav Chaya Apts. Bhav Patil Road, Bopodi',1,20,504,'Pune',411020,'7, Keshav Chaya Apts. Bhav Patil Road, Bopodi, Pune - 411020','0','ANDPV9872H',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,11,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(357,'1312','EMP0000357',NULL,NULL,'Akshay',NULL,'Metkar','1992-10-20','Male','9420074063',NULL,'akshay.metkar@sganalytics.com','AT Chhoriya Colony, Nandgaon Khomdeshwar',1,20,433,'Amravati',444708,'Bramhachaitanya Bunglow, Kalpataru Colony, Karve Nagar, Pune- 411052','0','BOYPM6767F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(358,'1313','EMP0000358',NULL,NULL,'Anshul',NULL,'Lavatre','1988-08-05','Female','8788529297',NULL,'anshul.lavatre@sganalytics.com','Uday Apartment,Raj Nagar, Chhaoni',1,20,NULL,'Nagpur',13,'Flat no9,Vijayraj Apartment,Famous Chowk New Sangvi','0','AKLPL5875H',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(359,'1314','EMP0000359',NULL,NULL,'Tejaswini',NULL,'Lohar','1982-09-03','Female','9844353542',NULL,'tejaswini.lohar@sganalytics.com','122/A Rajopadhye Nagar, Sane Guruji Vashashat, Radha Nagari Road',1,20,479,'Kolhapur',416012,'122/A Rajopadhye Nagar,Sane Guruji Vashashat,Radha nagari road,Kolhapur-416012','0','AFPPT6427E',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(360,'1315','EMP0000360',NULL,NULL,'Jayaprakash',NULL,'Mallikarjuna','1982-02-21','Male','9980067717',NULL,'jayaprakash.mallikarjuna@sganalytics.com','Devagiri Divine, #3, 30th Main, Banashankari III Stage',1,17,NULL,'Bengaluru',85,'Devagiri Divine, #3, 30th Main, Banashankari III Stage, Bangalore – 85','0','AEMPJ5353H',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(361,'1316','EMP0000361',NULL,NULL,'Manjinder','Kaur','Bhullar','1986-08-11','Female','9833673411',NULL,'manjinder.bhullar@sganalytics.com','B1/G2, Tolani Maritime Institute, Induri, Talegaon',1,20,504,'Pune',410507,'B1/G2, Tolani Maritime Institute, Induri, Talegaon, Pune - 410507','0','AVJPB4269Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(362,'1317','EMP0000362',NULL,NULL,'Himanshu',NULL,'Khatri','1988-10-05','Male','9811875571',NULL,'himanshu.khatri@sganalytics.com','D-58, Swarna Jayanti Puram, Nr. Govind, Puram',1,35,915,'Ghaziabad',201013,'D-58, Swarna Jayanti Puram, Nr. Govind, Puram, Ghaziabad, UP 201013','0','ATYPK9191R',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(363,'1318','EMP0000363',NULL,NULL,'Saurabh',NULL,'Goyal','1985-12-23','Male','9916294959',NULL,'saurabh.goyal@sganalytics.com','3-Devlok Colony, Shimla Bypass, Majra',1,34,NULL,'Dehradun',248171,'3-Devlok Colony, Shimla Bypass, Majra, Dehradun, Uttarakhand - 248171','0','APTPG1071P',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(364,'1319','EMP0000364',NULL,NULL,'Kalyani',NULL,'Deshpande','1994-12-15','Female','7208706882',NULL,'kalyani.deshpande@sganalytics.com','11,Gayatri Bunglow, Shivaji Nagar, Opp. Deval Dairy, Miraj, Sangli',1,20,NULL,NULL,416410,'11,Gayatri Bunglow, Shivajinagar, opp Deval Dairy, Miraj, Sangli- 416410','0','BZLPD9061K',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(365,'1320','EMP0000365',NULL,NULL,'Gaurav',NULL,'Sharma','1981-01-31','Male','9555255566',NULL,'gaurav.s@sganalytics.com','D- 20 A , South Extension Part 2',1,NULL,NULL,'New Delhi',110049,'D- 20 A , South Extension Part 2 ,New Delhi – 110049','0','BHXP5944Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(366,'1321','EMP0000366',NULL,NULL,'Aparna',NULL,'Desai','1992-12-25','Female','9970176373',NULL,'aparna.desai@sganalytics.com','Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar Hospital, Tilak Nagar, New Nallakunta',1,31,737,'Hyderabad',500044,'Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar hospital, Tilak Nagar, New Nallakunta, Hyderabad, Telangana- 500044','0','BZEPD3548J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(367,'1322','EMP0000367',NULL,NULL,'Vaibhav',NULL,'Agarwal','1990-07-12','Male','9921183097',NULL,'vaibhav.agarwal@sganalytics.com','E/1, Radhika Residency, Opp. Atlas Copco, Dapodi',1,20,504,'Pune',411012,'E/1, Radhika Residency, opp Atlas Copco, Dapodi - Pune - 12','0','AMVPA4578N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(368,'1323','EMP0000368',NULL,NULL,'Marlesh',NULL,'Patil','1989-05-15','Male','7875611750',NULL,'marlesh.patil@sganalytics.com','706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar',1,20,504,'Pune',411027,'706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar, Pune - 411027','0','BJEPP2810D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(369,'1324','EMP0000369',NULL,NULL,'Harshita',NULL,'Gupta','1993-05-25','Female','7073819662',NULL,'harshita.gupta@sganalytics.com','402, Parvana Apartment, Sector 21D',1,NULL,NULL,'Faridabad',0,'402, Parvana Apartment, Sector 21D, Faridabad, Delhi NCR','0','Applied',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,8,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(370,'1325','EMP0000370',NULL,NULL,'Himanshu',NULL,'Porwal','1991-05-19','Male','8982770907',NULL,'himanshu.porwal@sganalytics.com','65,(1-260) Sudama Nagar,Near Annapurna Mandir',1,23,564,'Indore',452009,'Flat no 1101,11th Floor,Platinum CL-3 Buliding,Bramha Suncity Vadgaonsheri Pune','0','CCLPP7208N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:23','2017-05-12 09:40:23',NULL,NULL,NULL,NULL,NULL,NULL),(371,'1326','EMP0000371',NULL,NULL,'Surbhi',NULL,'Jain','1992-06-19','Female','9993498040',NULL,'surbhi.jain@sganalytics.com','1,Parshavnath Parisar,Surajnagar',1,NULL,593,'Ujjain',0,'Amanora Park Town,Tower 18,Flat No-702,Hadapsar,Pune','0','BCFPJ4716C',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(372,'1327','EMP0000372',NULL,NULL,'Nilam',NULL,'Dhok','1990-03-18','Female','9503935999',NULL,'nilam.dhok@sganalytics.com','401,Panchpermeshwar Apt,Kisan Nagar No-3, Wagle Estate',1,20,520,'Thane',400604,'LX8/u4/13,A who tucker enclave,Near Hemant Karkare Udyan,15 no bus stop,Gondhale Nagar,Hadapsar-411028','0','BHUPD1617A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(373,'1328','EMP0000373',NULL,NULL,'Pooja',NULL,'Upadhyay','1987-10-15','Female','8007303443',NULL,'pooja.upadhyay@sganalytics.com','Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road, Market Yard',1,20,504,'Pune',411037,'Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road,Market Yard Pune-411037','0','ABTPU5853B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(374,'1329','EMP0000374',NULL,NULL,'Sneha',NULL,'Joshi','1991-09-01','Female','9168075663',NULL,'sneha.joshi@sganalytics.com','Flat no 566, Scheme No 40, Murlidhar Colony, Hanuman Nagar',1,17,NULL,'Belguam',9,'33 Keshav Kunj, Hanuman Nagar, Keshav Nagar, Mundhwa, Pune','0','APTPJ4186Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(375,'1330','EMP0000375',NULL,NULL,'Nitish',NULL,'Joshi','1991-04-05','Male','9423533243',NULL,'nitish.joshi@sganalytics.com','Patwardhan Baug, Central Bank Colony, Rama-Gopal, 6A, Erondwane',1,20,504,'Pune',411004,'Patwardhan Baug, Central Bank Colony, Rama-Gopal, 6A, Erondwane, Pune - 04','0','ANVPJ0756E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(376,'1331','EMP0000376',NULL,NULL,'Alok',NULL,'Bharti','1985-07-15','Male','9199712586',NULL,'alok.bharti@sganalytics.com','New road, Above old Bata, Sahibgunj',1,NULL,NULL,NULL,816109,'New road, Above old Bata, Sahibgunj, Jharkhand, 816109','0','AJZPB6555H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,3,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(377,'1332','EMP0000377',NULL,NULL,'Venkatrao',NULL,'Para','1991-06-15','Male','7263023348',NULL,'venkatrao.para@sganalytics.com','25659,Kotha Cheruvukommupalem (V),Nuzendla (m)',1,2,22,'Guntur',522659,'28/4/9,Galande Patil,Industrial Estate Near Bollywood Multiplex Pune-41101','0','BLEPP0215L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(378,'1333','EMP0000378',NULL,NULL,'Dushyant',NULL,'Chourey','1990-10-10','Male','9827287406',NULL,'dushyant.chourey@sganalytics.com','363-B-Sector Saruadharm Colony Kolar Road Exclusive Apt-2 Flat no-4-1',1,23,550,'Bhopal',0,'Shubshree Woods Society Row House A1/2 Pimple Saudagar Pune','0','AKSPC3603R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(379,'1334','EMP0000379',NULL,NULL,'Eswarareddy',NULL,'Osuri','1990-06-12','Male','9618542278',NULL,'eswara.reddy@sganalytics.com','1-51A, Narapureddypalli Village, Kotcherla Kota, Prakasam',1,2,NULL,'Kocherla Kota',523315,'Venky PG, Lane no 9, Sathyanagar Colony, Swami Smarta, Tukai Darson, Opp SP infocity, Fursungi - 412308','0','AAVPO0160E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(380,'1335','EMP0000380',NULL,NULL,'Sujitsingh',NULL,'Deore','1992-09-11','Male','9987172838',NULL,'sujitsingh.deore@sganalytics.com','Santoshi Mata Colony Karanja (Lad)',1,NULL,NULL,NULL,444105,'Harshni 12,Rambug Colony,Kothrud Pune','0','CMEPD5870M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(381,'1336','EMP0000381',NULL,NULL,'Basudeb',NULL,'Iyer','1973-05-09','Male','7743876047',NULL,'basudeb.iyer@sganalytics.com','Flat A502, Flying Heights, Near DY Patil School, Lohegaon',1,20,504,'Pune',0,'Flat A502, Flying Heights, Near DY Patil School, Lohegaon, Pune','0','AAFPI0391F',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,12,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(382,'1337','EMP0000382',NULL,NULL,'Purnima',NULL,'Verma','1993-06-04','Female ','9755650087',NULL,'purnima.verma@sganalytics.com','C/W-210, Shalimar Bunglow, Main Road, Sukhliya',1,23,564,'Indore',0,'Raj building, Borate Wasti, Chandan Nagar, Near Old Sai Mandir, Pune','0','AQNPV6801F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(383,'1338','EMP0000383',NULL,NULL,'Ankit',NULL,'Gangwal','1987-01-29','Male','8007196600',NULL,'gangwal.ankit@sganalytics.com','4/25Jawahar Nagar',1,29,689,'Jaipur',0,'4/25Jawahar Nagar,Jaipur','0','AKVPG3010H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,7,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(384,'1339','EMP0000384',NULL,NULL,'Teja','Srinivas','Sathuluri','1992-05-16','Male','9490964979',NULL,'teja.sathuluri@sganalytics.com','Door number: 1-2/3, F-F-1, Sri Sai Milayam, Tadigadapa Road, Pedapulipaka (V), Penamaluru (MDC)',1,2,NULL,'Vijayawada',521137,'Flat -301, Building number 6, Rakshak Nagar, Phase 2, Kharadi Bypass, Pune-411014','0','EGMPS8262Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,4,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(385,'1340','EMP0000385',NULL,NULL,'Raghavendra','Rao','Pattaswamy','1982-06-17','Male','9441250166',NULL,'raghavendra.pattaswamy@sganalytics.com','1-39/2, Prabhath nagar, Chaitanyapuri',1,2,737,'Hyderabad',500060,'1-39/2, Prabhath nagar, Chaitanyapuri, Hyderabad - 500060','0','AQSPP0431C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(386,'1341','EMP0000386',NULL,NULL,'Siddharth',NULL,'Pant','1973-10-01','Male','9741877411',NULL,'siddharth.pant@sganalytics.com','9-203, Mantri Residency, Kalena Agrahara, Bannerghatta Road',1,17,NULL,'Bengaluru',6076,'9-203, Mantri Residency, Kalena Agrahara, Bannerghatta road, Bangalore - 6076','0','AGBPP2852N',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(387,'1342','EMP0000387',NULL,NULL,'Rachit',NULL,'Huria','1993-05-19','Male','8962341161',NULL,'rachit.huria@sganalytics.com','136, Prannath ward No 6, Pana',1,23,NULL,NULL,488001,'Lane No 2, Regaram Patil Nagar, Kharadi, pune - 411014','0','AHSPH5048J',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,2,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(388,'1343','EMP0000388',NULL,NULL,'Prasad',NULL,'Chougule','1991-09-16','Male','8308324047',NULL,'prasad.chougule@sganalytics.com','Flat no 185, Dnyanhans, Soc No 1, R.K. Nagar, Marewadi',1,20,479,'Kolhapur',0,'15/6 vishwesh Building, Snehankit Colony, Warje Naka, Kothrud, Pune','0','ATEPC8598A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,1,1,13,NULL,'2017-05-12 09:40:24','2017-05-12 09:40:24',NULL,NULL,NULL,NULL,NULL,NULL),(389,'10155','EMP0000389',NULL,NULL,'Sirish','Kumar','Pammi','1982-02-09','Male ','9985401202',NULL,'sirishKumar.Pammi@ovum.com','D.No. 2-36-36, Trivedi Nagar, AC Gardens',1,NULL,52,'Rajahmundry ',533101,'Ho-No 1-2-33/59/102, Flat #102,Samhitha’s Saraswati Nilayam,Plot #59, Prasanth Nagar,Nizampet Road,Kukatpally 500072','617641873362','AOFPP6118M',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(390,'10254','EMP0000390',NULL,NULL,'Dasgupta ',NULL,'Archi ','1971-06-08','Male ','9885017888',NULL,'archi.dasgupta@Ovum.com','C/o. Ila Dasgupta, Race Course',1,36,997,'Jalpaiguri ',735101,'509, Prajapati Elite 3, HUDA Mayuri Nagar, Miyapur, Hyderabad - 500 049','306109511325','AHAPD7345L',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(391,'11178','EMP0000391',NULL,NULL,'Inderpreet',NULL,'Kaur','1985-06-07','Female ','7304468754',NULL,'inderpreet.kaur@Ovum.com','House No. 561 B/B, Ashoka Nagar, Near Kharadi',1,20,504,'Pune',411014,'561 B/B ASHOKA NAGAR, KHARADI','0','BLOPS6167G',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(392,'11314','EMP0000392',NULL,NULL,'Neha','Vijay','Dharia','1984-08-12','Female ','8886529992',NULL,'neha.dharia@ovum.com','House No. 7, Franconia, 3rd Pasta Lane, Colaba',1,NULL,486,'Mumbai ',400005,'Neha Dharia and Shailesh Bhojak\n306 Royal Castle,\nKodihalli Village, HAL Sanitary Board Area, 229/33, \nHAL Airport Rd, Bangalore-560017','0','BBAPD4042B ',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(393,'11315','EMP0000393',NULL,NULL,'Anupkumar',NULL,'Gangadharan','1981-10-24','Male ','8978993011',NULL,'Anupkumar.Gangadharan@ovum.com','MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally',1,31,737,'Hyderabad ',500038,'MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally, Hyderabad.','358356821931','AOBPG6594G',NULL,'Married ',1,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(394,'11321','EMP0000394',NULL,NULL,'Kedar ','Umesh ','Mohite ','1979-12-05','Male ','9740269271',NULL,'kedar.mohite@ovum.com',' 4-c nawab layout, Nirmala Apts, Tilak Nagar, Amravati Road',1,20,488,'Nagpur ',440010,'502, Prajapati Elite III, huda Layout, Mayuri Nagar, Miyapur','853164601947','APOPM9466P','J2993891','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(395,'11322','EMP0000395',NULL,NULL,'Vinay ','Kumar ','R','1978-03-01','Male ','9000275924',NULL,'vinay.kumar@sganalytics.com','H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad',1,31,737,'Hyderabad ',500015,'H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad - 500015','898799967864','AHCPR7736F',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(396,'11329','EMP0000396',NULL,NULL,'Vinay ',NULL,'Gupta ','1981-08-05','Male ','7702159497',NULL,'vinay.Gupta@ovum.com','Flat No-B1, 8th Floor, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar',1,31,737,'Hyderabad ',500050,'Flat No-B1, 8TH FLOOR, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar-500050','979495750198','AJEPG8899E','MH1420080019215','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(397,'11332','EMP0000397',NULL,NULL,'Subramanian',NULL,'Venkatraman','1984-02-25','Male ','9849222067',NULL,'Subramanian.Venkatraman@ovum.com','1-4-879/80, SBI Officers Colony, New bakaram, Gandhi Nagar',1,31,737,'Hyderabad ',500080,'Flat 102 , Jyothi lakeview apartment, Kavuri Hills , Madhapur ','0','AEVPV9120R','DLFAP009302082000','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(398,'11333','EMP0000398',NULL,NULL,'Arunasree',NULL,'Cheparthi','1975-05-10','Female ','9849574756',NULL,'Arunasree.Cheparthi@informa.com','Plot No -70, SBH Colony, Mohan Nagar, Kothapet',1,31,737,'Hyderabad ',5000035,'Plot No -70, SBH Colony, Mohan Nagar, Kothapet, Hyderabad - 5000035 ','455516529799','AFQPC2682H',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(399,'11336','EMP0000399',NULL,NULL,'Anushree',NULL,'Agarwal','1987-05-23','Female ','9985602640',NULL,'anushree.agarwal@ovum.com','21-6-500, Ghansi Bazar, Near High Court',1,31,737,'Hyderabad ',500002,'Sai Sharan Chabaria\'s, 2nd Floor, 1-8-264/4, Sindhi Colony, SP Road, Secunderabad','0','ASVPB5803D',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(400,'11337','EMP0000400',NULL,NULL,'Naga Sukumar',NULL,'Gattu','1984-12-23','Male ','9885784955',NULL,'naga.sukumar@ovum.com','H-No-2-11-44, Ganesh Street, Jangaon',1,31,756,'Warangal',506167,'Flat No- 402. H-No-4-10/3, Plot No 139, Abinay Residency, Budha Nagar,Peerzadiguda, Pin 500039, Ranga Reddy District - AP ','938362397865','AMYPG7752M','DLFAP1363562009','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(401,'11338','EMP0000401',NULL,NULL,'Kiran','Raj','Lokala','1984-02-13','Male ','9866616616',NULL,'Kiran.Lokala@ovum.com','Flat 401, Hallmark Ridge, Block - D, Sector - 1, Alkapur Township, \nCyberabad',1,31,737,'Hyderabad ',500089,'Flat 401, Hallmark Ridge, Block - D, Sector - 1, \nAlkapur Township, \nCyberabad - 500089','0','AEUPL2146N',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(402,'11340','EMP0000402',NULL,NULL,'Laxmi Reddy',NULL,'Vittalapuram','1987-04-30','Male ','7680944430',NULL,'Laxmareddy.Vittalapuram@informa.com','1-13,Vittalapuram,Maldakal,Gadwal',1,31,NULL,'Mahaboobnagar ',509132,'5-639/302,Sri Krishna Residency,Secretariat Colony, Manikonda, Hyderabad,Pin: 500089','359944400451','AHXPV5186G',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(403,'11343','EMP0000403',NULL,NULL,'Benny','Paul Prajeev','Mashapari','1981-10-28','Male ','9704093431',NULL,'benny.paul@ovum.com','BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi',1,31,737,'Hyderabad ',500047,'BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi, Andhra Pradesh, Pin -500047','523556327179','BRVPM6697L',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(404,'11344','EMP0000404',NULL,NULL,'Kranthi Kumar',NULL,'Buddharaju','1986-01-14','Male ','9885307007',NULL,'Kranthi.Buddharaju@ovum.com','H-No: 334,MIG, Balaji Nagar,Kukatpally',1,31,737,'Hyderabad ',500072,'H-No: 334,MIG, Balaji Nagar,Kukatpally, Hyderabad -72 ','370219290273','AWQPB8153R','DLFAP010295062006','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(405,'11345','EMP0000405',NULL,NULL,'Gajender','Satyanarayana ','Bachula','1983-07-17','Male ','9866048776',NULL,'gajender.bachula@ovum.com','H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy',1,31,737,'Hyderabad ',500047,'H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy District -Pin -500047','9059','AOJPB9485R',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:25','2017-05-12 09:40:25',NULL,NULL,NULL,NULL,NULL,NULL),(406,'11346','EMP0000406',NULL,NULL,'Chaitanya','Sundara','Pasupuleti','1980-07-10','Male ','9948570140',NULL,'chaitanya.sundara@sganalytics.com','Opposite Andhra Bank, Main Road ,Singaraya Konda',1,31,NULL,'Prakasam ',523101,'Plot No 1129, Opp Pragathi Nagar Church, Pragathi Nagar, Kukatpally, Hyderbad Pin -500090','8184452425490','BBUPP9237Q','DLFAP024114342009','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(407,'11349','EMP0000407',NULL,NULL,'Dhiraj','Pramod','Badgujar','1988-12-10','Male ','9423142370',NULL,'dhiraj.badgujar@ovum.com','05, Triveni Darshan Appartments, Bhabha Nagar',1,20,492,'Nashik',422011,'Kaveri Guest House, near post office, Madhapur, Secunderabad','283247865516','BMLPB1982J',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(408,'11350','EMP0000408',NULL,NULL,'Sandeep',NULL,'Sukhavasi','1984-03-14','Male ','9966257700',NULL,'sandeep.sukhavasi@ovum.com','12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad',1,31,737,'Hyderabad ',500017,'12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad, 500017','235945348844','CHKPS4943R',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(409,'11352','EMP0000409',NULL,NULL,'Vinita',NULL,'Mungikar','1990-10-02','Female ','9000908579',NULL,'vinita.mungikar@sganalytics.com','2-1-467, Street No 6,Nallakunta',1,31,737,'Hyderabad ',500044,'2-1-467, Street No 6,Nallakunta, Hyderbad , Pin : 500044','367150730270','BOTPM1901E','DLFAP0111344910','Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(410,'11354','EMP0000410',NULL,NULL,'Bharath','Kumar','Badavathu','1982-08-07','Male ','9160232554',NULL,'Bharathkumar.badavathu@sganalytics.com','H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal',1,31,737,'Hyderabad ',0,'H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal, RR Dist, ','0','BAXPK1706R','DLDAP03600653462012','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(411,'11358','EMP0000411',NULL,NULL,'Venkata Nagamalleshwari',NULL,'Pallapothu','1988-10-31','Female ','8790789337',NULL,'Nagamalleshwari.PV@ovum.com','H-No -1-3-176/35/4/3, Ground Floor, Padmashali Colony, Gandhi Nagar',1,31,737,'Hyderabad ',500029,'H.No:1-3-176/35/4/3, Padmashali colony, Gandhi nagar, Hyderabad','780765305032','BJIPP1450P','AP02320120011087','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(412,'11359','EMP0000412',NULL,NULL,'Sai Vivek',NULL,'Kammari','1987-06-01','Male ','8341383062',NULL,'k.saivivek@informa.com','1-49/2/D , Shankar Nagar, Chandanangar',1,31,737,'Hyderabad ',500050,'1-49/2/D , Shankar Nagar, Chandanangar, Hyderbad , Pin 500050','274805977014','AMYPV2916Q','AMYPV2916Q','Unmarried',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(413,'11360','EMP0000413',NULL,NULL,'Manisha',NULL,'Kuthari','1989-05-13','Female ','9866505533',NULL,'manisha.kuthari@informa.com','House No-17, Nehru Enclave, G.M.S Road, Ballupur',1,NULL,863,'Dehradun',248001,'Flat No -301, SVGK Residency , Plot No 53, Megha Hills, Madhapur, Hyderabad ','0','BDUPK3619M',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(414,'11361','EMP0000414',NULL,NULL,'Shubham ',NULL,'Pandey ','1990-05-19','Male ','9654744841',NULL,'shubham.pandey@informa.com','ME-59, Mini MIG Hemant Vihar, Barra -II',1,NULL,925,'Kanpur ',208027,'ME-59, Mini MIG Hemant Vihar, Barra -II, Kanpur, Pin 208027','0','BUOPP3326D',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(415,'11362','EMP0000415',NULL,NULL,'Sishir Cheela',NULL,'Naren','1989-10-15','Male ','8008019108',NULL,'SishirCheela.Naren@ovum.com','T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet',1,31,737,'Hyderabad ',500016,'T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet, Hyderabad, Pin : 500016','0','AKHPC1026B',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(416,'11364','EMP0000416',NULL,NULL,'Sangeetika ',NULL,'Srivastava ','1990-01-30','Female ','9505952883',NULL,'Sangeetika.Srivastava@ovum.com','\"Shivpuri\" Mall Road, Sitapur',1,NULL,935,'Lucknow ',0,'Plot 121, Phase 3, Kamlapuri Colony, Srinagar Colony, Banjara Hills, Hyderabad, Telangana -500073 ','0','CZWPS0239J',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(417,'11365','EMP0000417',NULL,NULL,'Bhupa','Prashanth',NULL,'1990-01-24','Male ','9160536357',NULL,'bhupa.prashanth@ovum.com','H-No-9-94/5, Laxmi Nagar Colony, Boduppal',1,31,NULL,'Hyderabad ',500092,'H.no 9-94/5, Lakshmi nagar colony, Boduppal, Hyd-92','557270199547','BKIPB8121N',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(418,'11366','EMP0000418',NULL,NULL,'Srinivasa','Rao','Mantha','1990-08-24','Male ','9032221627',NULL,'SrinivasaRao.Mantha@ovum.com','7-37/2, Seethampeta,Kothavalsa (Mandalam)',1,NULL,65,'Vizianagaram',535183,'Flat no 7353, 7th Block, Jana priya metroplos, Mothi Nagar, Hyderabad','993245246447','BDEPR3291L','KA5320120002120','Unmarried',8,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(419,'11367','EMP0000419',NULL,NULL,'Apoorv',NULL,'Gupta','1991-03-10','Male ','7745015662',NULL,'apoorv.gupta@ovum.com','RV-10, Indus Gradens, E-8 Extension, Gulmohar Colony',1,23,550,'Bhopal ',462039,'A2B-105, KUMAR Paradise, Mundhwa Road, Hadapsar Road, Pin -411028','443145230834','BGFPG4313Q','MP04D-2010-0067675','Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(420,'11368','EMP0000420',NULL,NULL,'N V Chalam',NULL,'Lakkapragada','1990-08-07','Male ','9666286033',NULL,'NVCHALAM.LAKKAPRAGADA@ovum.com','S/O , LLV Prasad, Near Venugopala Swamy Temple, Movva',1,2,NULL,'Krishna ',521135,'Flat No- 53, Gulmohar Park Colony, Near Dominos Pizza, Sri Lingampalli, Hyderabad, 500019','589957438576','AHUPL8865B',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:26','2017-05-12 09:40:26',NULL,NULL,NULL,NULL,NULL,NULL),(421,'11369','EMP0000421',NULL,NULL,'Dwaipayan ',NULL,'Bose','1989-01-29','Male ','9831145839',NULL,'dwaipayan.bose@ovum.com','22/1/1A, Monohar Pukur Road',1,36,NULL,'Kolkatta ',700029,'Royal PG, Sr. No 63, Lane 4, Rajaram Patil Nagar, EON IT Park, Khardi, Pune-411014 ','0','BHEPB6799R',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:27','2017-05-12 09:40:27',NULL,NULL,NULL,NULL,NULL,NULL),(422,'11370','EMP0000422',NULL,NULL,'Praveen ',' Kumar','Vadicharla ','1990-09-17','Male ','9948861999',NULL,'PraveenKumar.Vadicharla@sganalytics.com','ST2-1031, Centenary Colony, Rangagiri, Peddapalli',1,31,738,'Karimnagar ',505212,'Plot No-525, HMT Hills, Kukatpally, Hyderabad','466156172556','AMEPV9241L',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:27','2017-05-12 09:40:27',NULL,NULL,NULL,NULL,NULL,NULL),(423,'11371','EMP0000423',NULL,NULL,'Bhaskar ','Phani Shankar ','Thatavarti ','1987-06-18','Male ','9910348579',NULL,'thatavartibhaskar.phanishankar@sganalytics.com','D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada',1,NULL,NULL,'East Godavari ',533002,'D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada, 533002','624295395791','AGNPT0391G',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,1,2,13,NULL,'2017-05-12 09:40:27','2017-05-12 09:40:27',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_contributions`
--

DROP TABLE IF EXISTS `employer_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `actual_pf` decimal(10,0) DEFAULT NULL,
  `pf` decimal(10,0) DEFAULT NULL,
  `actual_esic` decimal(10,0) DEFAULT NULL,
  `esic` decimal(10,0) DEFAULT NULL,
  `actual_fp` decimal(10,0) DEFAULT NULL,
  `fp` decimal(10,0) DEFAULT NULL,
  `actual_insurance` decimal(10,0) DEFAULT NULL,
  `insurance` decimal(10,0) DEFAULT NULL,
  `actual_bonus` decimal(10,0) DEFAULT NULL,
  `bonus` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employer_contributions_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_42b846b7f8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_contributions`
--

LOCK TABLES `employer_contributions` WRITE;
/*!40000 ALTER TABLE `employer_contributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_family_pensions`
--

DROP TABLE IF EXISTS `employer_family_pensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_family_pensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_family_pensions`
--

LOCK TABLES `employer_family_pensions` WRITE;
/*!40000 ALTER TABLE `employer_family_pensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_family_pensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_insurances`
--

DROP TABLE IF EXISTS `employer_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_insurances`
--

LOCK TABLES `employer_insurances` WRITE;
/*!40000 ALTER TABLE `employer_insurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `employer_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esic_employer_masters`
--

DROP TABLE IF EXISTS `esic_employer_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esic_employer_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esic` tinyint(1) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `max_limit` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_employer_masters`
--

LOCK TABLES `esic_employer_masters` WRITE;
/*!40000 ALTER TABLE `esic_employer_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `esic_employer_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esic_employers`
--

DROP TABLE IF EXISTS `esic_employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esic_employers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_employers`
--

LOCK TABLES `esic_employers` WRITE;
/*!40000 ALTER TABLE `esic_employers` DISABLE KEYS */;
/*!40000 ALTER TABLE `esic_employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `esic_masters`
--

DROP TABLE IF EXISTS `esic_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esic_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esic` tinyint(1) DEFAULT NULL,
  `percentage` decimal(15,2) DEFAULT '0.00',
  `decimal` decimal(15,2) DEFAULT '0.00',
  `date_effective` date DEFAULT NULL,
  `max_limit` decimal(15,2) DEFAULT '0.00',
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_masters`
--

LOCK TABLES `esic_masters` WRITE;
/*!40000 ALTER TABLE `esic_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `esic_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excel_uploads`
--

DROP TABLE IF EXISTS `excel_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excel_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excel_uploads`
--

LOCK TABLES `excel_uploads` WRITE;
/*!40000 ALTER TABLE `excel_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `excel_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exit_interviews`
--

DROP TABLE IF EXISTS `exit_interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exit_interviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `question_master_id` int(11) DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_exit_interviews_on_employee_id` (`employee_id`),
  KEY `index_exit_interviews_on_question_master_id` (`question_master_id`),
  CONSTRAINT `fk_rails_233ad71822` FOREIGN KEY (`question_master_id`) REFERENCES `question_masters` (`id`),
  CONSTRAINT `fk_rails_968a5cb882` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exit_interviews`
--

LOCK TABLES `exit_interviews` WRITE;
/*!40000 ALTER TABLE `exit_interviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `exit_interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expencess_types`
--

DROP TABLE IF EXISTS `expencess_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expencess_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expencess_types`
--

LOCK TABLES `expencess_types` WRITE;
/*!40000 ALTER TABLE `expencess_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `expencess_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ctc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_experiences_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9760749907` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_designations`
--

DROP TABLE IF EXISTS `f_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_designations`
--

LOCK TABLES `f_designations` WRITE;
/*!40000 ALTER TABLE `f_designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `families` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `no_of_member` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8_unicode_ci,
  `marital` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adhar_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_passport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_issue_date` date DEFAULT NULL,
  `passport_expiry_date` date DEFAULT NULL,
  `medical_claim` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `is_handicap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handicap_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_families_on_employee_id` (`employee_id`),
  KEY `index_families_on_blood_group_id` (`blood_group_id`),
  KEY `index_families_on_religion_id` (`religion_id`),
  CONSTRAINT `fk_rails_4683ab9fbb` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7fb6f3c699` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_951b58ed70` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_ratings`
--

DROP TABLE IF EXISTS `final_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_ratings`
--

LOCK TABLES `final_ratings` WRITE;
/*!40000 ALTER TABLE `final_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final_reporters`
--

DROP TABLE IF EXISTS `final_reporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_reporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final_reporters`
--

LOCK TABLES `final_reporters` WRITE;
/*!40000 ALTER TABLE `final_reporters` DISABLE KEYS */;
/*!40000 ALTER TABLE `final_reporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finals`
--

DROP TABLE IF EXISTS `finals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finals`
--

LOCK TABLES `finals` WRITE;
/*!40000 ALTER TABLE `finals` DISABLE KEYS */;
/*!40000 ALTER TABLE `finals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_reporters`
--

DROP TABLE IF EXISTS `first_reporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `first_reporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_reporters`
--

LOCK TABLES `first_reporters` WRITE;
/*!40000 ALTER TABLE `first_reporters` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_reporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_coupan_masters`
--

DROP TABLE IF EXISTS `food_coupan_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_coupan_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT '0.00',
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_coupan_masters`
--

LOCK TABLES `food_coupan_masters` WRITE;
/*!40000 ALTER TABLE `food_coupan_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_coupan_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_deductions`
--

DROP TABLE IF EXISTS `food_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `food_date` date DEFAULT NULL,
  `no_of_coupan` int(11) DEFAULT NULL,
  `food_coupan_master_id` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT '0.00',
  `employee_id` int(11) DEFAULT NULL,
  `return_coupan` int(11) DEFAULT NULL,
  `total_coupan` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_food_deductions_on_food_coupan_master_id` (`food_coupan_master_id`),
  KEY `index_food_deductions_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_68f6ba0b6d` FOREIGN KEY (`food_coupan_master_id`) REFERENCES `food_coupan_masters` (`id`),
  CONSTRAINT `fk_rails_a0f2d9a2f1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_deductions`
--

LOCK TABLES `food_deductions` WRITE;
/*!40000 ALTER TABLE `food_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_masters`
--

DROP TABLE IF EXISTS `fp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_fp` tinyint(1) DEFAULT NULL,
  `min_limit` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_masters`
--

LOCK TABLES `fp_masters` WRITE;
/*!40000 ALTER TABLE `fp_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_bunches`
--

DROP TABLE IF EXISTS `goal_bunches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_bunches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `goal_confirm` tinyint(1) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraisee_confirm` tinyint(1) DEFAULT NULL,
  `appraiser_rating` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `appraiser_confirm` tinyint(1) DEFAULT NULL,
  `review_comment` text COLLATE utf8_unicode_ci,
  `reviewer_confirm` tinyint(1) DEFAULT NULL,
  `final_comment` text COLLATE utf8_unicode_ci,
  `final_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_calendar_id` int(11) DEFAULT NULL,
  `r_promotion` tinyint(1) DEFAULT NULL,
  `r_increment` tinyint(1) DEFAULT NULL,
  `r_ctc` decimal(10,0) DEFAULT NULL,
  `f_promotion` tinyint(1) DEFAULT NULL,
  `f_increment` tinyint(1) DEFAULT NULL,
  `f_ctc` decimal(10,0) DEFAULT NULL,
  `appraisee_rating_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_approval` tinyint(1) DEFAULT NULL,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `reviewer_rating_id` int(11) DEFAULT NULL,
  `final_rating_id` int(11) DEFAULT NULL,
  `final_id` int(11) DEFAULT NULL,
  `r_designation_id` int(11) DEFAULT NULL,
  `f_designation_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_bunches_on_employee_id` (`employee_id`),
  KEY `index_goal_bunches_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_bunches_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_5c40ebfbdd` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_bunches`
--

LOCK TABLES `goal_bunches` WRITE;
/*!40000 ALTER TABLE `goal_bunches` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_bunches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_measures`
--

DROP TABLE IF EXISTS `goal_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_measures`
--

LOCK TABLES `goal_measures` WRITE;
/*!40000 ALTER TABLE `goal_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_perspectives`
--

DROP TABLE IF EXISTS `goal_perspectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_perspectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `goal_weightage` tinyint(1) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_perspectives`
--

LOCK TABLES `goal_perspectives` WRITE;
/*!40000 ALTER TABLE `goal_perspectives` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_perspectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_rating_sheets`
--

DROP TABLE IF EXISTS `goal_rating_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_rating_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `employee_goal_id` int(11) DEFAULT NULL,
  `allign_to_supervisor` tinyint(1) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_period_id` int(11) DEFAULT NULL,
  `is_confirm_appraiser` tinyint(1) DEFAULT NULL,
  `is_confirm_appraisee` tinyint(1) DEFAULT NULL,
  `appraiser2_comment` text COLLATE utf8_unicode_ci,
  `final_comment` text COLLATE utf8_unicode_ci,
  `appraiser_2_id` int(11) DEFAULT NULL,
  `final_id_id` int(11) DEFAULT NULL,
  `is_confirm_final` tinyint(1) DEFAULT NULL,
  `is_confirm_appraiser2` tinyint(1) DEFAULT NULL,
  `appraisee_rating_id` int(11) DEFAULT NULL,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `appraiser2_rating_id` int(11) DEFAULT NULL,
  `final_rating_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_rating_sheets_on_appraisee_id` (`appraisee_id`),
  KEY `index_goal_rating_sheets_on_appraisee_rating_id` (`appraisee_rating_id`),
  KEY `index_goal_rating_sheets_on_appraiser2_rating_id` (`appraiser2_rating_id`),
  KEY `index_goal_rating_sheets_on_appraiser_2_id` (`appraiser_2_id`),
  KEY `index_goal_rating_sheets_on_appraiser_id` (`appraiser_id`),
  KEY `index_goal_rating_sheets_on_appraiser_rating_id` (`appraiser_rating_id`),
  KEY `index_goal_rating_sheets_on_employee_goal_id` (`employee_goal_id`),
  KEY `index_goal_rating_sheets_on_final_id_id` (`final_id_id`),
  KEY `index_goal_rating_sheets_on_final_rating_id` (`final_rating_id`),
  KEY `index_goal_rating_sheets_on_performance_period_id` (`performance_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_rating_sheets`
--

LOCK TABLES `goal_rating_sheets` WRITE;
/*!40000 ALTER TABLE `goal_rating_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_rating_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_ratings`
--

DROP TABLE IF EXISTS `goal_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_bunch_id` int(11) DEFAULT NULL,
  `goal_perspective_id` int(11) DEFAULT NULL,
  `goal_weightage` int(11) DEFAULT NULL,
  `goal_measure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target` text COLLATE utf8_unicode_ci,
  `aligned` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `reviewer_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `attribute_master_id` int(11) DEFAULT NULL,
  `goal_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `performance_calendar_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `is_assigned` tinyint(1) DEFAULT NULL,
  `is_hide` tinyint(1) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `appraisee_rating_id` int(11) DEFAULT NULL,
  `goal_setter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_ratings_on_goal_bunch_id` (`goal_bunch_id`),
  KEY `index_goal_ratings_on_goal_perspective_id` (`goal_perspective_id`),
  KEY `index_goal_ratings_on_attribute_id` (`attribute_id`),
  KEY `index_goal_ratings_on_attribute_master_id` (`attribute_master_id`),
  KEY `index_goal_ratings_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_ratings_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_goal_ratings_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_53077b3df5` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_6e86e151d5` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_9026e8df92` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_acde72b120` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `fk_rails_ca6eb4eeb5` FOREIGN KEY (`attribute_master_id`) REFERENCES `attribute_masters` (`id`),
  CONSTRAINT `fk_rails_d687b7b1ac` FOREIGN KEY (`goal_bunch_id`) REFERENCES `goal_bunches` (`id`),
  CONSTRAINT `fk_rails_d8b7394814` FOREIGN KEY (`goal_perspective_id`) REFERENCES `goal_perspectives` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_ratings`
--

LOCK TABLES `goal_ratings` WRITE;
/*!40000 ALTER TABLE `goal_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_setters`
--

DROP TABLE IF EXISTS `goal_setters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_setters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_setters`
--

LOCK TABLES `goal_setters` WRITE;
/*!40000 ALTER TABLE `goal_setters` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_setters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gratuities`
--

DROP TABLE IF EXISTS `gratuities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gratuities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `gratuity_master_id` int(11) DEFAULT NULL,
  `gratuity_amount` decimal(10,0) DEFAULT NULL,
  `no_of_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_gratuity` decimal(10,0) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gratuities_on_employee_id` (`employee_id`),
  KEY `index_gratuities_on_gratuity_master_id` (`gratuity_master_id`),
  CONSTRAINT `fk_rails_3482346dc0` FOREIGN KEY (`gratuity_master_id`) REFERENCES `gratuity_masters` (`id`),
  CONSTRAINT `fk_rails_738e9e43fa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gratuities`
--

LOCK TABLES `gratuities` WRITE;
/*!40000 ALTER TABLE `gratuities` DISABLE KEYS */;
/*!40000 ALTER TABLE `gratuities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gratuity_masters`
--

DROP TABLE IF EXISTS `gratuity_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gratuity_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_of_year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_in_month` int(11) DEFAULT NULL,
  `payable_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gratuity_masters`
--

LOCK TABLES `gratuity_masters` WRITE;
/*!40000 ALTER TABLE `gratuity_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `gratuity_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subdomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_groups_on_email` (`email`),
  UNIQUE KEY `index_groups_on_subdomain` (`subdomain`),
  UNIQUE KEY `index_groups_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'gs@gmail.com','$2a$10$G2V3UkaRp6/l5hd35jz7rulQ15xfA.dPtaV557wsvh4aMR4eLExfm','SG Analytics',NULL,NULL,NULL,1,'2017-05-11 14:29:26','2017-05-11 14:29:26','127.0.0.1','127.0.0.1','2017-05-11 14:29:26','2017-05-11 14:29:26',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `holiday_date` date DEFAULT NULL,
  `isweekend` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_send` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illness_types`
--

DROP TABLE IF EXISTS `illness_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illness_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illness_types`
--

LOCK TABLES `illness_types` WRITE;
/*!40000 ALTER TABLE `illness_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `illness_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `induction_activities`
--

DROP TABLE IF EXISTS `induction_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `induction_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` text COLLATE utf8_unicode_ci,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `induction_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `induction_completed` tinyint(1) DEFAULT NULL,
  `activity_date` date DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `program_agenda` text COLLATE utf8_unicode_ci,
  `facilitator_1` text COLLATE utf8_unicode_ci,
  `facilitator_2` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_induction_activities_on_employee_id` (`employee_id`),
  KEY `index_induction_activities_on_induction_master_id` (`induction_master_id`),
  CONSTRAINT `fk_rails_61a7bf8475` FOREIGN KEY (`induction_master_id`) REFERENCES `induction_masters` (`id`),
  CONSTRAINT `fk_rails_8fa8c58b93` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_activities`
--

LOCK TABLES `induction_activities` WRITE;
/*!40000 ALTER TABLE `induction_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `induction_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `induction_details`
--

DROP TABLE IF EXISTS `induction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `induction_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `induction_master_id` int(11) DEFAULT NULL,
  `induction_completed` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_induction_details_on_employee_id` (`employee_id`),
  KEY `index_induction_details_on_induction_master_id` (`induction_master_id`),
  CONSTRAINT `fk_rails_36bad7f136` FOREIGN KEY (`induction_master_id`) REFERENCES `induction_masters` (`id`),
  CONSTRAINT `fk_rails_f907e96d47` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_details`
--

LOCK TABLES `induction_details` WRITE;
/*!40000 ALTER TABLE `induction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `induction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `induction_masters`
--

DROP TABLE IF EXISTS `induction_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `induction_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_masters`
--

LOCK TABLES `induction_masters` WRITE;
/*!40000 ALTER TABLE `induction_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `induction_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `induction_templates`
--

DROP TABLE IF EXISTS `induction_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `induction_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `activity` text COLLATE utf8_unicode_ci,
  `day` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_induction_templates_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_8bfef299c5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_templates`
--

LOCK TABLES `induction_templates` WRITE;
/*!40000 ALTER TABLE `induction_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `induction_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instalments`
--

DROP TABLE IF EXISTS `instalments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instalments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advance_salary_id` int(11) DEFAULT NULL,
  `instalment_date` date DEFAULT NULL,
  `instalment_amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_complete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_instalments_on_advance_salary_id` (`advance_salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalments`
--

LOCK TABLES `instalments` WRITE;
/*!40000 ALTER TABLE `instalments` DISABLE KEYS */;
/*!40000 ALTER TABLE `instalments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_masters`
--

DROP TABLE IF EXISTS `insurance_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_insurance` tinyint(1) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_masters`
--

LOCK TABLES `insurance_masters` WRITE;
/*!40000 ALTER TABLE `insurance_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_analyses`
--

DROP TABLE IF EXISTS `interview_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_analyses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_request_history_id` int(11) DEFAULT NULL,
  `interview_evalution_id` int(11) DEFAULT NULL,
  `interview_attribute_id` int(11) DEFAULT NULL,
  `interview_decision_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `interview_schedule_id` int(11) DEFAULT NULL,
  `interview_round_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interview_analyses_on_vacancy_request_history_id` (`vacancy_request_history_id`),
  KEY `index_interview_analyses_on_interview_evalution_id` (`interview_evalution_id`),
  KEY `index_interview_analyses_on_interview_attribute_id` (`interview_attribute_id`),
  KEY `index_interview_analyses_on_interview_decision_id` (`interview_decision_id`),
  KEY `index_interview_analyses_on_interview_schedule_id` (`interview_schedule_id`),
  KEY `index_interview_analyses_on_interview_round_id` (`interview_round_id`),
  CONSTRAINT `fk_rails_2f1e7bc8af` FOREIGN KEY (`interview_attribute_id`) REFERENCES `interview_attributes` (`id`),
  CONSTRAINT `fk_rails_33cd369925` FOREIGN KEY (`interview_round_id`) REFERENCES `interview_rounds` (`id`),
  CONSTRAINT `fk_rails_6c9de4cce3` FOREIGN KEY (`vacancy_request_history_id`) REFERENCES `vacancy_request_histories` (`id`),
  CONSTRAINT `fk_rails_76a91f32ce` FOREIGN KEY (`interview_evalution_id`) REFERENCES `interview_evalutions` (`id`),
  CONSTRAINT `fk_rails_c18b17a975` FOREIGN KEY (`interview_decision_id`) REFERENCES `interview_decisions` (`id`),
  CONSTRAINT `fk_rails_e0f16f3279` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_analyses`
--

LOCK TABLES `interview_analyses` WRITE;
/*!40000 ALTER TABLE `interview_analyses` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_attributes`
--

DROP TABLE IF EXISTS `interview_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_attributes`
--

LOCK TABLES `interview_attributes` WRITE;
/*!40000 ALTER TABLE `interview_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_decisions`
--

DROP TABLE IF EXISTS `interview_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_decisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_decisions`
--

LOCK TABLES `interview_decisions` WRITE;
/*!40000 ALTER TABLE `interview_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_evalutions`
--

DROP TABLE IF EXISTS `interview_evalutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_evalutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_evalutions`
--

LOCK TABLES `interview_evalutions` WRITE;
/*!40000 ALTER TABLE `interview_evalutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_evalutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_reschedules`
--

DROP TABLE IF EXISTS `interview_reschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_reschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_schedule_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interview_reschedules_on_interview_schedule_id` (`interview_schedule_id`),
  KEY `index_interview_reschedules_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_0f33a373bb` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`),
  CONSTRAINT `fk_rails_5ebe9708fb` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_reschedules`
--

LOCK TABLES `interview_reschedules` WRITE;
/*!40000 ALTER TABLE `interview_reschedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_reschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_round_reschedules`
--

DROP TABLE IF EXISTS `interview_round_reschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_round_reschedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_round_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `interview_type_id` int(11) DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interview_round_reschedules_on_interview_round_id` (`interview_round_id`),
  KEY `index_interview_round_reschedules_on_employee_id` (`employee_id`),
  KEY `index_interview_round_reschedules_on_interview_type_id` (`interview_type_id`),
  CONSTRAINT `fk_rails_0d01eca257` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_916e2b2d35` FOREIGN KEY (`interview_type_id`) REFERENCES `interview_types` (`id`),
  CONSTRAINT `fk_rails_98124fad6a` FOREIGN KEY (`interview_round_id`) REFERENCES `interview_rounds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_round_reschedules`
--

LOCK TABLES `interview_round_reschedules` WRITE;
/*!40000 ALTER TABLE `interview_round_reschedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_round_reschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_rounds`
--

DROP TABLE IF EXISTS `interview_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_rounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_schedule_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `interview_type_id` int(11) DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `interview_round_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interview_rounds_on_interview_schedule_id` (`interview_schedule_id`),
  KEY `index_interview_rounds_on_employee_id` (`employee_id`),
  KEY `index_interview_rounds_on_interview_type_id` (`interview_type_id`),
  CONSTRAINT `fk_rails_154a608778` FOREIGN KEY (`interview_type_id`) REFERENCES `interview_types` (`id`),
  CONSTRAINT `fk_rails_833eb87331` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`),
  CONSTRAINT `fk_rails_cee9a84790` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_rounds`
--

LOCK TABLES `interview_rounds` WRITE;
/*!40000 ALTER TABLE `interview_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_schedules`
--

DROP TABLE IF EXISTS `interview_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `selected_resume_id` int(11) DEFAULT NULL,
  `candidate_name2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_interview_schedules_on_employee_id` (`employee_id`),
  KEY `index_interview_schedules_on_selected_resume_id` (`selected_resume_id`),
  CONSTRAINT `fk_rails_32d03a3ff6` FOREIGN KEY (`selected_resume_id`) REFERENCES `selected_resumes` (`id`),
  CONSTRAINT `fk_rails_5872837d23` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_schedules`
--

LOCK TABLES `interview_schedules` WRITE;
/*!40000 ALTER TABLE `interview_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_types`
--

DROP TABLE IF EXISTS `interview_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_types`
--

LOCK TABLES `interview_types` WRITE;
/*!40000 ALTER TABLE `interview_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment_declarations`
--

DROP TABLE IF EXISTS `investment_declarations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_declarations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `investment_head_id` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_investment_declarations_on_investment_head_id` (`investment_head_id`),
  KEY `index_investment_declarations_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_84a20a6fbd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_ca11fc6728` FOREIGN KEY (`investment_head_id`) REFERENCES `investment_heads` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment_declarations`
--

LOCK TABLES `investment_declarations` WRITE;
/*!40000 ALTER TABLE `investment_declarations` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment_declarations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment_heads`
--

DROP TABLE IF EXISTS `investment_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment_heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `limit` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_investment_heads_on_section_id` (`section_id`),
  CONSTRAINT `fk_rails_ab5353d94e` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment_heads`
--

LOCK TABLES `investment_heads` WRITE;
/*!40000 ALTER TABLE `investment_heads` DISABLE KEYS */;
/*!40000 ALTER TABLE `investment_heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_histories`
--

DROP TABLE IF EXISTS `issue_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_request_id` int(11) DEFAULT NULL,
  `issue_master_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `issue_tracker_member_id` int(11) DEFAULT NULL,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `issue_priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_histories_on_issue_request_id` (`issue_request_id`),
  KEY `index_issue_histories_on_issue_master_id` (`issue_master_id`),
  KEY `index_issue_histories_on_employee_id` (`employee_id`),
  KEY `index_issue_histories_on_issue_tracker_member_id` (`issue_tracker_member_id`),
  KEY `index_issue_histories_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  CONSTRAINT `fk_rails_114f4a43bc` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`),
  CONSTRAINT `fk_rails_2410ac093f` FOREIGN KEY (`issue_master_id`) REFERENCES `issue_masters` (`id`),
  CONSTRAINT `fk_rails_904e8b340a` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
  CONSTRAINT `fk_rails_be9ac0238f` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`),
  CONSTRAINT `fk_rails_ee5e5eba0f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_histories`
--

LOCK TABLES `issue_histories` WRITE;
/*!40000 ALTER TABLE `issue_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_locker_histories`
--

DROP TABLE IF EXISTS `issue_locker_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_locker_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_locker_id` int(11) DEFAULT NULL,
  `issue_request_id` int(11) DEFAULT NULL,
  `issue_tracker_member_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lock_date` date DEFAULT NULL,
  `lock_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_locker_histories_on_issue_locker_id` (`issue_locker_id`),
  KEY `index_issue_locker_histories_on_issue_request_id` (`issue_request_id`),
  KEY `index_issue_locker_histories_on_issue_tracker_member_id` (`issue_tracker_member_id`),
  CONSTRAINT `fk_rails_208f22a42b` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`),
  CONSTRAINT `fk_rails_3522022587` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
  CONSTRAINT `fk_rails_8b4aeab8ea` FOREIGN KEY (`issue_locker_id`) REFERENCES `issue_lockers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_locker_histories`
--

LOCK TABLES `issue_locker_histories` WRITE;
/*!40000 ALTER TABLE `issue_locker_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_locker_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_lockers`
--

DROP TABLE IF EXISTS `issue_lockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_lockers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_request_id` int(11) DEFAULT NULL,
  `issue_tracker_member_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lock_date` date DEFAULT NULL,
  `lock_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_lockers_on_issue_request_id` (`issue_request_id`),
  KEY `index_issue_lockers_on_issue_tracker_member_id` (`issue_tracker_member_id`),
  CONSTRAINT `fk_rails_31ade36ddd` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
  CONSTRAINT `fk_rails_a7d12210a9` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_lockers`
--

LOCK TABLES `issue_lockers` WRITE;
/*!40000 ALTER TABLE `issue_lockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_lockers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_masters`
--

DROP TABLE IF EXISTS `issue_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `issue_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_masters_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  KEY `index_issue_masters_on_issue_type_id` (`issue_type_id`),
  CONSTRAINT `fk_rails_602a7480c5` FOREIGN KEY (`issue_type_id`) REFERENCES `issue_types` (`id`),
  CONSTRAINT `fk_rails_7128f79d90` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_masters`
--

LOCK TABLES `issue_masters` WRITE;
/*!40000 ALTER TABLE `issue_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_requests`
--

DROP TABLE IF EXISTS `issue_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_master_id` int(11) DEFAULT NULL,
  `issue_tracker_member_id` int(11) DEFAULT NULL,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `issue_priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `issue_root_cause_id` int(11) DEFAULT NULL,
  `effort_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document1_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document1_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document1_file_size` int(11) DEFAULT NULL,
  `document1_updated_at` datetime DEFAULT NULL,
  `document2_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document2_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document2_file_size` int(11) DEFAULT NULL,
  `document2_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_requests_on_issue_master_id` (`issue_master_id`),
  KEY `index_issue_requests_on_issue_tracker_member_id` (`issue_tracker_member_id`),
  KEY `index_issue_requests_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  KEY `index_issue_requests_on_employee_id` (`employee_id`),
  KEY `index_issue_requests_on_issue_root_cause_id` (`issue_root_cause_id`),
  CONSTRAINT `fk_rails_837875ee73` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`),
  CONSTRAINT `fk_rails_85ea2875c9` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9d51796d9c` FOREIGN KEY (`issue_root_cause_id`) REFERENCES `issue_root_causes` (`id`),
  CONSTRAINT `fk_rails_a92cfda856` FOREIGN KEY (`issue_master_id`) REFERENCES `issue_masters` (`id`),
  CONSTRAINT `fk_rails_d77d0fd2ba` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_requests`
--

LOCK TABLES `issue_requests` WRITE;
/*!40000 ALTER TABLE `issue_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_root_causes`
--

DROP TABLE IF EXISTS `issue_root_causes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_root_causes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_root_causes_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  CONSTRAINT `fk_rails_f7b2d2be7e` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_root_causes`
--

LOCK TABLES `issue_root_causes` WRITE;
/*!40000 ALTER TABLE `issue_root_causes` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_root_causes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_tracker_accesses`
--

DROP TABLE IF EXISTS `issue_tracker_accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_tracker_accesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_tracker_accesses_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  CONSTRAINT `fk_rails_6d8670ba85` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tracker_accesses`
--

LOCK TABLES `issue_tracker_accesses` WRITE;
/*!40000 ALTER TABLE `issue_tracker_accesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_tracker_accesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_tracker_groups`
--

DROP TABLE IF EXISTS `issue_tracker_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_tracker_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tracker_groups`
--

LOCK TABLES `issue_tracker_groups` WRITE;
/*!40000 ALTER TABLE `issue_tracker_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_tracker_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_tracker_members`
--

DROP TABLE IF EXISTS `issue_tracker_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_tracker_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_tracker_group_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_tracker_members_on_issue_tracker_group_id` (`issue_tracker_group_id`),
  KEY `index_issue_tracker_members_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_3849762bde` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`),
  CONSTRAINT `fk_rails_6e38c9381b` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tracker_members`
--

LOCK TABLES `issue_tracker_members` WRITE;
/*!40000 ALTER TABLE `issue_tracker_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_tracker_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_types`
--

DROP TABLE IF EXISTS `issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_types`
--

LOCK TABLES `issue_types` WRITE;
/*!40000 ALTER TABLE `issue_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joining_details`
--

DROP TABLE IF EXISTS `joining_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joining_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_uan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_pf_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_efic_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `probation_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_mediclaim` tinyint(1) DEFAULT NULL,
  `medical_schem` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_passport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_issue_date` date DEFAULT NULL,
  `passport_expiry_date` date DEFAULT NULL,
  `is_society_member` tinyint(1) DEFAULT NULL,
  `retirement_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reserved_category_id` int(11) DEFAULT NULL,
  `select_pf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pf_max_amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_esic` tinyint(1) DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `payment_mode_id` int(11) DEFAULT NULL,
  `ot_option` tinyint(1) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT '1',
  `have_retention` tinyint(1) DEFAULT NULL,
  `is_employeer_pf` tinyint(1) DEFAULT NULL,
  `is_employeer_esic` tinyint(1) DEFAULT NULL,
  `is_insurance` tinyint(1) DEFAULT NULL,
  `is_family_pension` tinyint(1) DEFAULT NULL,
  `is_bonus` tinyint(1) DEFAULT NULL,
  `basis_of_time` tinyint(1) DEFAULT '0',
  `time_master` tinyint(1) DEFAULT NULL,
  `time_adjusted` tinyint(1) DEFAULT NULL,
  `leaving_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ot_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replacement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_joining_details_on_employee_id` (`employee_id`),
  KEY `index_joining_details_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_joining_details_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_joining_details_on_reserved_category_id` (`reserved_category_id`),
  KEY `index_joining_details_on_cost_center_id` (`cost_center_id`),
  KEY `index_joining_details_on_employee_category_id` (`employee_category_id`),
  KEY `index_joining_details_on_payment_mode_id` (`payment_mode_id`),
  CONSTRAINT `fk_rails_214c8daf87` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2399bfef36` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`),
  CONSTRAINT `fk_rails_393577d02f` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_62455f7dcc` FOREIGN KEY (`reserved_category_id`) REFERENCES `reserved_categories` (`id`),
  CONSTRAINT `fk_rails_7dd6739c2a` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `fk_rails_92efff7a56` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_bd93cb7284` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'2006-02-01',1,30,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(2,2,'2006-02-18',3,23,NULL,NULL,'100383353490',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(3,3,'2006-03-01',2,107,NULL,NULL,'100317423979',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(4,4,'2006-02-20',4,88,NULL,NULL,'100382983926',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(5,5,'2006-07-10',6,2,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(6,6,'2006-11-21',6,2,NULL,NULL,'100386478067',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(7,7,'2006-05-26',6,2,NULL,NULL,'100099375075',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(8,8,'2006-07-10',6,2,NULL,NULL,'100379644518',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(9,9,'2006-07-17',6,2,NULL,NULL,'100397046070',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(10,10,'2007-02-09',5,59,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(11,11,'2007-06-03',7,67,NULL,NULL,'100320197518',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(12,12,'2006-12-01',2,108,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(13,13,'2007-01-02',6,97,NULL,NULL,'100285064363',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(14,14,'2010-05-31',4,88,NULL,NULL,'100097549057',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(15,15,'2010-07-20',6,2,NULL,NULL,'100101253838',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(16,16,'2010-12-06',5,74,NULL,NULL,'100101001992',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(17,17,'2010-12-06',5,74,NULL,NULL,'100101001992',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(18,18,'2011-01-03',5,61,NULL,NULL,'100757805825',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(19,19,'2011-02-01',5,74,NULL,NULL,'100320995610',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(20,20,'2011-02-01',7,45,NULL,NULL,'100260060774',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(21,21,'2011-02-14',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(22,22,'2011-04-07',5,78,NULL,NULL,'100201032273',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(23,23,'2011-04-25',5,65,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(24,24,'2011-04-25',3,20,NULL,NULL,'100259587844',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(25,25,'2011-05-02',5,84,NULL,NULL,'100385159958',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(26,26,'2011-05-16',5,66,NULL,NULL,'100180745994',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(27,27,'2011-05-16',3,22,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(28,28,'2011-06-06',5,18,NULL,NULL,'100411758148',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(29,29,'2011-08-12',5,37,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(30,30,'2011-09-23',6,75,NULL,NULL,'100036195915',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(31,31,'2012-02-02',4,90,NULL,NULL,'100401092196',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(32,32,'2012-02-06',6,103,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(33,33,'2012-02-27',6,2,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(34,34,'2012-03-19',7,50,NULL,NULL,'100382976230',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(35,35,'2012-06-18',5,29,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(36,36,'2012-07-25',6,103,NULL,NULL,'100425541261',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(37,37,'2012-08-01',5,103,NULL,NULL,'100329036305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(38,38,'2012-11-15',5,18,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(39,39,'2013-01-01',5,56,NULL,NULL,'100379278805',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(40,40,'2013-01-14',6,97,NULL,NULL,'100118482971',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:57','2017-05-12 10:32:57',NULL,NULL),(41,41,'2013-05-20',5,12,NULL,NULL,'100805914938',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(42,42,'2013-07-24',6,94,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(43,43,'2013-09-02',5,73,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(44,44,'2013-10-01',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(45,45,'2014-01-06',6,96,NULL,NULL,'100561434208',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(46,46,'2014-01-01',5,78,NULL,NULL,'100382976230',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(47,47,'2014-02-01',6,2,NULL,NULL,'100329036305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(48,48,'2014-02-01',7,28,NULL,NULL,'100451415077',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(49,49,'2014-03-01',5,78,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(50,50,'2014-03-01',5,78,NULL,NULL,'100098859217',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(51,51,'2014-03-01',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(52,52,'2014-03-01',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(53,53,'2014-03-01',5,78,NULL,NULL,'100358760543',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(54,54,'2014-03-10',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(55,55,'2014-03-12',6,2,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(56,56,'2014-03-12',5,78,NULL,NULL,'100063707119',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(57,57,'2014-03-18',6,2,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(58,58,'2014-03-18',5,18,NULL,NULL,'100068084644',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(59,59,'2014-03-18',7,70,NULL,NULL,'100425489559',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(60,60,'2014-03-18',6,95,NULL,NULL,'100329036305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(61,61,'2014-03-18',6,93,NULL,NULL,'100004086209',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(62,62,'2014-04-08',6,105,NULL,NULL,'100354620849',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(63,63,'2014-04-14',5,87,NULL,NULL,'100036195915',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(64,64,'2014-04-14',5,78,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(65,65,'2014-04-14',6,104,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(66,66,'2014-04-14',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(67,67,'2014-05-05',7,52,NULL,NULL,'100051020367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(68,68,'2014-05-12',6,2,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(69,69,'2014-05-14',6,2,NULL,NULL,'100017702169',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(70,70,'2014-05-23',6,6,NULL,NULL,'100099375075',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(71,71,'2014-06-09',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(72,72,'2014-06-16',4,53,NULL,NULL,'100844191195',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(73,73,'2014-07-01',7,15,NULL,NULL,'100425465227',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(74,74,'2014-07-02',5,78,NULL,NULL,'100063707119',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(75,75,'2014-07-21',5,82,NULL,NULL,'100451925083',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(76,76,'2014-07-28',5,78,NULL,NULL,'100425489559',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(77,77,'2014-08-18',5,82,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(78,78,'2014-09-01',5,78,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(79,79,'2014-09-09',4,53,NULL,NULL,'100425586684',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(80,80,'2014-09-22',6,2,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(81,81,'2014-09-22',6,2,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(82,82,'2014-09-29',6,2,NULL,NULL,'100452653506',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(83,83,'2014-09-29',5,78,NULL,NULL,'100425491942',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(84,84,'2014-10-13',7,15,NULL,NULL,'100425488146',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(85,85,'2014-11-17',5,18,NULL,NULL,'100561682625',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(86,86,'2014-11-20',5,78,NULL,NULL,'100451905084',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(87,87,'2014-11-24',6,10,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(88,88,'2014-11-24',4,17,NULL,NULL,'100081748896',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(89,89,'2014-12-01',5,78,NULL,NULL,'100561781332',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(90,90,'2014-12-01',5,87,NULL,NULL,'100453997734',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(91,91,'2014-12-01',7,68,NULL,NULL,'100425489559',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(92,92,'2014-12-03',6,2,NULL,NULL,'100451579940',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(93,93,'2014-12-04',6,2,NULL,NULL,'100451415077',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(94,94,'2014-12-15',6,2,NULL,NULL,'100799090826',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(95,95,'2014-12-22',6,2,NULL,NULL,'100451937972',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(96,96,'2015-01-05',6,2,NULL,NULL,'100451668973',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(97,97,'2015-01-05',6,80,NULL,NULL,'100036169010',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(98,98,'2015-01-05',5,18,NULL,NULL,'100805914938',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(99,99,'2015-01-12',6,80,NULL,NULL,'100451764824',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(100,100,'2015-01-12',6,48,NULL,NULL,'100451510869',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(101,101,'2015-01-20',4,88,NULL,NULL,'100363295160',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(102,102,'2015-02-02',5,64,NULL,NULL,'100451693390',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(103,103,'2015-02-11',6,2,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(104,104,'2015-02-16',7,15,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(105,105,'2015-02-26',7,NULL,NULL,NULL,'100403580683',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(106,106,'2015-03-05',6,2,NULL,NULL,'100244112496',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(107,107,'2015-03-09',6,2,NULL,NULL,'100098859217',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(108,108,'2015-03-09',6,2,NULL,NULL,'100561781210',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(109,109,'2015-03-16',7,1,NULL,NULL,'100561453925',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(110,110,'2015-03-23',6,2,NULL,NULL,'100659900227',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(111,111,'2015-03-23',7,15,NULL,NULL,'100659809217',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(112,112,'2015-03-23',7,15,NULL,NULL,'100561309664',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(113,113,'2015-03-23',6,2,NULL,NULL,'100804315389',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(114,114,'2015-03-30',7,15,NULL,NULL,'100659492555',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(115,115,'2015-03-30',5,78,NULL,NULL,'100804315389',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(116,116,'2015-04-01',6,2,NULL,NULL,'100083079602',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(117,117,'2008-04-01',2,39,NULL,NULL,'100284078159',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(118,118,'2015-04-20',6,2,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(119,119,'2015-04-20',6,2,NULL,NULL,'100561422786',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(120,120,'2015-04-20',5,78,NULL,NULL,'100802160368',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(121,121,'2015-04-20',6,2,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(122,122,'2015-04-20',6,2,NULL,NULL,'100561396883',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(123,123,'2015-04-27',6,2,NULL,NULL,'100561500851',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(124,124,'2015-04-27',5,18,NULL,NULL,'100635546486',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(125,125,'2015-05-11',7,15,NULL,NULL,'100101253838',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:58','2017-05-12 10:32:58',NULL,NULL),(126,126,'2015-05-11',6,2,NULL,NULL,'100561639516',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(127,127,'2015-05-11',7,15,NULL,NULL,'100561811948',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(128,128,'2015-05-11',6,2,NULL,NULL,'100659831207',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(129,129,'2015-05-11',7,15,NULL,NULL,'100561834167',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(130,130,'2015-05-11',6,2,NULL,NULL,'100561549653',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(131,131,'2015-05-11',7,15,NULL,NULL,'100561434208',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(132,132,'2015-05-11',6,2,NULL,NULL,'100561652124',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(133,133,'2015-05-11',5,82,NULL,NULL,'100561680178',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(134,134,'2015-05-18',6,2,NULL,NULL,'100659784792',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(135,135,'2015-05-18',7,15,NULL,NULL,'100659867167',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(136,136,'2015-05-25',6,2,NULL,NULL,'100561306045',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(137,137,'2015-06-08',6,2,NULL,NULL,'100635241336',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(138,138,'2015-06-08',7,15,NULL,NULL,'100635486066',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(139,139,'2015-06-08',6,2,NULL,NULL,'100635184519',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(140,140,'2015-06-10',7,102,NULL,NULL,'100635158697',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(141,141,'2015-06-15',5,60,NULL,NULL,'100839126165',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(142,142,'2015-06-15',7,15,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(143,143,'2015-06-15',7,15,NULL,NULL,'100635402391',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(144,144,'2015-06-22',6,2,NULL,NULL,'100635226468',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(145,145,'2015-06-22',7,15,NULL,NULL,'100635359274',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(146,146,'2015-06-22',7,15,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(147,147,'2015-06-22',7,15,NULL,NULL,'100635634548',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(148,148,'2015-06-22',6,2,NULL,NULL,'100635632990',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(149,149,'2015-06-22',7,15,NULL,NULL,'100635531815',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(150,150,'2015-06-29',5,18,NULL,NULL,'100635405925',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(151,151,'2015-07-06',7,15,NULL,NULL,'100635461593',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(152,152,'2015-07-06',6,2,NULL,NULL,'100429699114',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(153,153,'2015-07-06',6,2,NULL,NULL,'100635164231',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(154,154,'2015-07-06',7,15,NULL,NULL,'100634996544',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(155,155,'2015-07-06',7,15,NULL,NULL,'100635570397',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(156,156,'2015-07-06',5,78,NULL,NULL,'100561434208',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(157,157,'2015-07-06',7,15,NULL,NULL,'100836822941',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(158,158,'2015-07-06',6,2,NULL,NULL,'100635323965',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(159,159,'2015-07-07',7,70,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(160,160,'2015-07-07',7,15,NULL,NULL,'100431978745',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(161,161,'2015-07-10',1,32,NULL,NULL,'100838028334',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(162,162,'2015-07-13',6,4,NULL,NULL,'100358760543',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(163,163,'2015-07-16',7,15,NULL,NULL,'100635184519',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(164,164,'2015-07-20',5,18,NULL,NULL,'100561727561',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(165,165,'2015-07-20',7,70,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(166,166,'2015-07-20',7,15,NULL,NULL,'100259587844',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(167,167,'2015-07-20',5,78,NULL,NULL,'100057179414',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(168,168,'2015-07-27',6,2,NULL,NULL,'100329036305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(169,169,'2015-08-03',6,2,NULL,NULL,'100635405925',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(170,170,'2015-08-03',5,18,NULL,NULL,'100240878595',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(171,171,'2015-08-05',7,49,NULL,NULL,'100561783946',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(172,172,'2015-08-17',5,78,NULL,NULL,'100635323965',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(173,173,'2015-08-17',6,2,NULL,NULL,'100635485106',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(174,174,'2015-08-17',7,15,NULL,NULL,'100843257986',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(175,175,'2015-08-17',6,2,NULL,NULL,'100451937972',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(176,176,'2015-08-17',7,15,NULL,NULL,'100635280745',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(177,177,'2015-08-17',7,15,NULL,NULL,'100561656133',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(178,178,'2015-08-17',7,15,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(179,179,'2015-08-17',7,15,NULL,NULL,'100635030589',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(180,180,'2015-08-17',7,15,NULL,NULL,'100635540045',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(181,181,'2015-08-17',7,15,NULL,NULL,'100561713510',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(182,182,'2015-08-17',7,15,NULL,NULL,'100033963722',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(183,183,'2015-08-18',6,7,NULL,NULL,'100635124564',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(184,184,'2015-08-18',5,78,NULL,NULL,'100635110657',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(185,185,'2015-08-24',6,2,NULL,NULL,'100150434525',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(186,186,'2015-09-08',5,35,NULL,NULL,'100851120774',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(187,187,'2015-09-14',6,2,NULL,NULL,'100854221403',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(188,188,'2015-09-14',7,15,NULL,NULL,'100834638322',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(189,189,'2015-09-21',7,71,NULL,NULL,'100844212613',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(190,190,'2015-09-29',5,78,NULL,NULL,'100833828417',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(191,191,'2015-09-30',5,78,NULL,NULL,'100401092196',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(192,192,'2015-10-05',5,78,NULL,NULL,'100843259818',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(193,193,'2015-10-06',7,70,NULL,NULL,'100083079602',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(194,194,'2015-10-08',3,13,NULL,NULL,'100315140366',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(195,195,'2015-10-13',6,2,NULL,NULL,'100840143191',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(196,196,'2015-10-19',5,12,NULL,NULL,'100135402094',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(197,197,'2015-11-02',6,2,NULL,NULL,'100243495804',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(198,198,'2015-11-02',5,78,NULL,NULL,'100013161068',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(199,199,'2015-11-16',5,78,NULL,NULL,'100061745890',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(200,200,'2015-11-16',6,9,NULL,NULL,'100679455933',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(201,201,'2015-11-23',5,34,NULL,NULL,'100725420829',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(202,202,'2015-11-23',6,2,NULL,NULL,'100856561501',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(203,203,'2015-11-23',6,5,NULL,NULL,'100600707494',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(204,204,'2015-12-01',3,14,NULL,NULL,'100679393228',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(205,205,'2015-12-07',7,28,NULL,NULL,'100869028462',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(206,206,'2015-12-07',7,42,NULL,NULL,'100679373753',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:32:59','2017-05-12 10:32:59',NULL,NULL),(207,207,'2015-12-07',7,44,NULL,NULL,'100865713347',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(208,208,'2016-01-04',5,78,NULL,NULL,'100662188384',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(209,209,'2016-01-04',5,78,NULL,NULL,'100300474980',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(210,210,'2016-01-04',7,43,NULL,NULL,'100843259818',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(211,211,'2016-01-04',4,92,NULL,NULL,'100858716272',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(212,212,'2016-01-11',4,40,NULL,NULL,'100438824167',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(213,213,'2016-01-11',7,70,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(214,214,'2016-01-18',5,60,NULL,NULL,'100859607362',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(215,215,'2016-01-18',5,78,NULL,NULL,'100869909973',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(216,216,'2016-01-18',6,2,NULL,NULL,'100854221403',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(217,217,'2016-01-21',5,78,NULL,NULL,'100369853916',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(218,218,'2016-01-25',7,15,NULL,NULL,'100561306045',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(219,219,'2016-01-25',6,2,NULL,NULL,'100126007396',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(220,220,'2016-01-27',7,28,NULL,NULL,'100725426458',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(221,221,'2016-01-28',4,89,NULL,NULL,'100331529854',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(222,222,'2016-02-01',5,78,NULL,NULL,'100180769794',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(223,223,'2016-02-04',5,54,NULL,NULL,'100535078923',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(224,224,'2016-02-12',5,62,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(225,225,'2016-02-22',5,83,NULL,NULL,'100563540948',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(226,226,'2016-02-26',5,78,NULL,NULL,'100858693081',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(227,227,'2016-02-29',5,78,NULL,NULL,'100465295158',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(228,228,'2016-03-07',5,82,NULL,NULL,'100381600683',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(229,229,'2016-03-21',6,2,NULL,NULL,'100317423979',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(230,230,'2016-04-05',7,70,NULL,NULL,'100860871876',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(231,231,'2016-04-11',5,82,NULL,NULL,'100432025627',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(232,232,'2016-04-11',7,15,NULL,NULL,'100861823105',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(233,233,'2016-05-02',2,99,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(234,234,'2016-05-02',6,2,NULL,NULL,'100883295996',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(235,235,'2016-05-02',6,75,NULL,NULL,'100893894918',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(236,236,'2016-05-02',3,46,NULL,NULL,'100890882995',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(237,237,'2016-05-09',5,78,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(238,238,'2016-05-18',7,15,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(239,239,'2016-05-23',2,109,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(240,240,'2016-05-23',7,28,NULL,NULL,'100883498129',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(241,241,'2016-05-23',7,15,NULL,NULL,'100896482029',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(242,242,'2016-05-23',7,15,NULL,NULL,'100401092196',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(243,243,'2016-05-23',7,15,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(244,244,'2016-05-23',7,15,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(245,245,'2016-05-23',7,15,NULL,NULL,'100896739821',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(246,246,'2016-05-23',7,15,NULL,NULL,'100893111002',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(247,247,'2016-05-23',7,15,NULL,NULL,'100891512605',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(248,248,'2016-05-23',7,15,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(249,249,'2016-05-30',7,70,NULL,NULL,'100888512038',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(250,250,'2016-06-13',3,19,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(251,251,'2016-06-15',7,70,NULL,NULL,'100892178843',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(252,252,'2016-06-15',7,70,NULL,NULL,'100896708691',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(253,253,'2016-06-20',5,54,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(254,254,'2016-06-30',6,51,NULL,NULL,'100886126030',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(255,255,'2016-06-30',6,51,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(256,256,'2016-06-30',6,51,NULL,NULL,'100886022757',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(257,257,'2016-06-30',6,51,NULL,NULL,'100240878595',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(258,258,'2016-07-04',7,15,NULL,NULL,'100896612427',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(259,259,'2016-07-06',7,70,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(260,260,'2016-07-06',7,70,NULL,NULL,'100891310672',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(261,261,'2016-07-06',7,70,NULL,NULL,'100896547125',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(262,262,'2016-07-18',6,51,NULL,NULL,'100896250502',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(263,263,'2016-07-18',7,70,NULL,NULL,'100891625870',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(264,264,'2016-07-21',6,101,NULL,NULL,'100889872147',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(265,265,'2016-07-25',7,15,NULL,NULL,'100659782318',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(266,266,'2016-07-26',7,15,NULL,NULL,'100930028306',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(267,267,'2016-08-01',7,15,NULL,NULL,'100432025627',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(268,268,'2016-08-01',7,15,NULL,NULL,'100843259818',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(269,269,'2016-08-01',7,15,NULL,NULL,'100928273122',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(270,270,'2016-08-10',5,18,NULL,NULL,'100914266680',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(271,271,'2016-08-22',7,77,NULL,NULL,'100928511027',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(272,272,'2016-08-24',3,36,NULL,NULL,'100930332349',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(273,273,'2016-08-24',7,15,NULL,NULL,'100916481073',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(274,274,'2016-08-29',7,15,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(275,275,'2016-08-30',7,72,NULL,NULL,'100926510512',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(276,276,'2016-08-30',6,2,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(277,277,'2016-09-01',7,15,NULL,NULL,'100929559434',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(278,278,'2016-09-01',7,15,NULL,NULL,'100924445714',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(279,279,'2016-09-01',7,15,NULL,NULL,'100918020138',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(280,280,'2016-09-01',7,15,NULL,NULL,'100425491942',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(281,281,'2016-09-01',7,15,NULL,NULL,'100913813066',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(282,282,'2016-09-06',5,78,NULL,NULL,'100354620849',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(283,283,'2016-09-06',7,15,NULL,NULL,'100915685453',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(284,284,'2016-09-06',7,15,NULL,NULL,'100925548478',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:00','2017-05-12 10:33:00',NULL,NULL),(285,285,'2016-09-06',5,60,NULL,NULL,'100925575643',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(286,286,'2016-09-09',5,81,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(287,287,'2016-09-12',6,2,NULL,NULL,'100927664697',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(288,288,'2016-09-12',6,2,NULL,NULL,'100036195915',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(289,289,'2016-09-12',7,15,NULL,NULL,'100913719591',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(290,290,'2016-09-14',7,15,NULL,NULL,'100924431943',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(291,291,'2016-09-16',4,53,NULL,NULL,'100925267870',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(292,292,'2016-09-19',7,15,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(293,293,'2016-09-19',7,15,NULL,NULL,'100928780530',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(294,294,'2016-09-19',7,15,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(295,295,'2016-09-29',7,15,NULL,NULL,'100950878496',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(296,296,'2016-09-30',6,2,NULL,NULL,'100259587844',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(297,297,'2016-09-30',7,15,NULL,NULL,'100946816059',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(298,298,'2016-09-30',6,2,NULL,NULL,'100432025627',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(299,299,'2016-09-30',6,2,NULL,NULL,'100947672129',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(300,300,'2016-10-03',7,15,NULL,NULL,'100948317054',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(301,301,'2016-10-12',5,79,NULL,NULL,'100949251560',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(302,302,'2016-10-17',5,78,NULL,NULL,'100947654005',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(303,303,'2016-10-19',6,2,NULL,NULL,'100948831561',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(304,304,'2016-10-24',7,70,NULL,NULL,'100973258393',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(305,305,'2016-10-24',7,77,NULL,NULL,'100358760543',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(306,306,'2016-11-01',6,11,NULL,NULL,'100973343156',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(307,307,'2016-11-01',4,53,NULL,NULL,'100432025627',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(308,308,'2016-11-02',7,15,NULL,NULL,'100973258431',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(309,309,'2016-11-02',7,77,NULL,NULL,'100973171867',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(310,310,'2016-11-02',7,70,NULL,NULL,'100973438792',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(311,311,'2016-11-02',7,70,NULL,NULL,'100973258420',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(312,312,'2016-11-07',5,78,NULL,NULL,'100973344386',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(313,313,'2016-11-07',5,63,NULL,NULL,'100973171879',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(314,314,'2016-11-10',6,87,NULL,NULL,'100973171880',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(315,315,'2016-11-14',5,78,NULL,NULL,'100973344393',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(316,316,'2016-11-14',5,60,NULL,NULL,'100973171908',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(317,317,'2016-11-14',6,31,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(318,318,'2016-11-21',5,86,NULL,NULL,'100973171931',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(319,319,'2016-11-23',6,31,NULL,NULL,'100973171949',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(320,320,'2016-11-11',7,68,NULL,NULL,'100973171898',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(321,321,'2016-11-24',5,34,NULL,NULL,'100988392798',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(322,322,'2016-11-24',7,77,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(323,323,'2016-11-28',5,74,NULL,NULL,'100259587844',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(324,324,'2016-11-30',3,47,NULL,NULL,'100099809793',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(325,325,'2016-12-01',5,34,NULL,NULL,'100329036305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(326,326,'2016-12-05',7,77,NULL,NULL,'100068209688',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(327,327,'2016-12-05',7,77,NULL,NULL,'100987544712',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(328,328,'2016-12-05',6,3,NULL,NULL,'100737391825',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(329,329,'2016-12-12',6,8,NULL,NULL,'100468050415',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(330,330,'2016-12-12',6,2,NULL,NULL,'100378866966',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(331,331,'2016-12-19',7,16,NULL,NULL,'100757805825',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(332,332,'2016-12-19',4,91,NULL,NULL,'100007576722',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(333,333,'2016-12-26',7,15,NULL,NULL,'101014934147',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(334,334,'2016-12-26',4,55,NULL,NULL,'100603832291',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(335,335,'2017-01-02',3,24,NULL,NULL,'100750617150',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(336,336,'2017-01-16',5,74,NULL,NULL,'100635184519',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(337,337,'2017-01-16',5,34,NULL,NULL,'101008333316',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(338,338,'2017-01-19',7,15,NULL,NULL,'101008333344',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(339,339,'2017-01-23',6,2,NULL,NULL,'100022263132',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(340,340,'2017-01-27',7,15,NULL,NULL,'101008333359',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(341,341,'2017-01-27',7,15,NULL,NULL,'100495408923',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(342,342,'2017-01-27',7,15,NULL,NULL,'101008333363',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(343,343,'2017-01-30',6,27,NULL,NULL,'101019428049',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(344,344,'2017-02-06',7,15,NULL,NULL,'100425585216',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(345,345,'2017-02-09',5,78,NULL,NULL,'100259587844',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(346,346,'2017-02-13',5,78,NULL,NULL,'100101091174',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(347,347,'2017-02-13',6,2,NULL,NULL,'100561656133',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(348,348,'2017-02-16',6,2,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(349,349,'2017-02-20',5,34,NULL,NULL,'100564054110',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(350,350,'2017-02-21',6,2,NULL,NULL,'100738091503',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(351,351,'2017-02-27',6,2,NULL,NULL,'101065056913',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(352,352,'2017-02-27',7,15,NULL,NULL,'101065056909',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(353,353,'2017-02-27',7,15,NULL,NULL,'100244317390',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(354,354,'2017-02-27',7,15,NULL,NULL,'101065056899',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(355,355,'2017-03-06',7,41,NULL,NULL,'100528538791',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(356,356,'2017-03-14',5,18,NULL,NULL,'100933535231',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(357,357,'2017-03-14',7,15,NULL,NULL,'100487894714',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(358,358,'2017-03-14',6,2,NULL,NULL,'101056148261',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:01','2017-05-12 10:33:01',NULL,NULL),(359,359,'2017-03-14',5,74,NULL,NULL,'100390247615',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(360,360,'2017-03-15',3,25,NULL,NULL,'101056148288',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(361,361,'2017-03-16',6,2,NULL,NULL,'100241300232',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(362,362,'2017-03-20',5,78,NULL,NULL,'100164536363',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(363,363,'2017-03-20',4,53,NULL,NULL,'100561484175',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(364,364,'2017-03-20',7,15,NULL,NULL,'100358760543',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(365,365,'2017-03-20',5,76,NULL,NULL,'100701136588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(366,366,'2017-03-22',7,15,NULL,NULL,'101056148290',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(367,367,'2017-03-24',7,15,NULL,NULL,'100100185168',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(368,368,'2017-03-27',6,2,NULL,NULL,'100396978367',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(369,369,'2017-03-27',6,85,NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(370,370,'2017-03-31',7,15,NULL,NULL,'100166277987',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(371,371,'2017-03-31',7,15,NULL,NULL,'100432025627',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(372,372,'2017-04-03',6,110,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(373,373,'2017-04-03',7,15,NULL,NULL,'100896708691',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(374,374,'2017-04-10',7,15,NULL,NULL,'100561656133',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(375,375,'2017-04-10',7,100,NULL,NULL,'100561656133',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(376,376,'2017-04-17',4,38,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(377,377,'2017-04-17',6,26,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(378,378,'2017-04-17',7,15,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(379,379,'2017-04-17',7,106,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(380,380,'2017-04-17',7,15,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(381,381,'2017-04-17',5,87,NULL,NULL,'100928511027',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(382,382,'2017-04-17',7,77,NULL,NULL,'100101253838',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(383,383,'2017-04-19',5,57,NULL,NULL,'100844191195',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(384,384,'2017-04-20',5,83,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(385,385,'2017-04-21',3,21,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(386,386,'2017-05-02',2,98,NULL,NULL,'100856561501',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(387,387,'2017-05-02',7,51,NULL,NULL,'100180745994',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(388,388,'2017-05-02',6,33,NULL,NULL,'100635485106',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(389,389,'2012-03-01',NULL,78,NULL,NULL,'100383422019',NULL,NULL,'6','60',NULL,NULL,'Yes ','0','2013-12-27','2023-12-26',NULL,'2042-02-28',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(390,390,'2012-03-01',NULL,69,NULL,NULL,'100100334240',NULL,NULL,'7','90',NULL,NULL,'Yes ','0','2012-03-01','2022-02-28',NULL,'2031-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(391,391,'2012-03-01',NULL,78,NULL,NULL,'100168425760',NULL,NULL,'8','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2045-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(392,392,'2012-03-01',NULL,78,NULL,NULL,'100259748549',NULL,NULL,'10','60',NULL,NULL,'Yes ','0','2003-03-11','2023-03-10',NULL,'2044-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(393,393,'2012-03-01',NULL,78,NULL,NULL,'100100125359',NULL,NULL,'11','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2041-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(394,394,'2012-07-23',NULL,78,NULL,NULL,'100200452012',NULL,NULL,'12','60',NULL,NULL,'Yes ','0','2010-05-10','2020-04-10',NULL,'2039-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(395,395,'2012-08-01',NULL,58,NULL,NULL,'100412936015',NULL,NULL,'13','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2038-02-28',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(396,396,'2013-01-07',NULL,53,NULL,NULL,'100412913962',NULL,NULL,'14','60',NULL,NULL,'Yes ','0','2008-02-05','2018-02-04',NULL,'2041-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(397,397,'2013-05-06',NULL,53,NULL,NULL,'100412162097',NULL,NULL,'15','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2044-02-29',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(398,398,'2013-05-29',NULL,2,NULL,NULL,'100100709773',NULL,NULL,'16','60',NULL,NULL,'No ','0','2009-11-03','2019-11-01',NULL,'2035-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(399,399,'2013-08-06',NULL,2,NULL,NULL,'100100185168',NULL,NULL,'17','60',NULL,NULL,'Yes ','0','2012-06-12','2022-06-11',NULL,'2047-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(400,400,'2013-08-28',NULL,2,NULL,NULL,'100258662428',NULL,NULL,'18','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2044-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(401,401,'2013-09-02',NULL,2,NULL,NULL,'100200722277',NULL,NULL,'19','60',NULL,NULL,'Yes ','0','2006-08-11','2016-07-11',NULL,'2044-02-29',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(402,402,'2014-04-21',NULL,2,NULL,NULL,'100207336774',NULL,NULL,'20','60',NULL,NULL,'Yes ','0','2009-03-20','2019-03-19',NULL,'2047-04-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(403,403,'2014-05-26',NULL,2,NULL,NULL,'100425594277',NULL,NULL,'21','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2041-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(404,404,'2014-05-26',NULL,2,NULL,NULL,'100201026805',NULL,NULL,'22','60',NULL,NULL,'Yes ','0','2006-03-24','2016-03-23',NULL,'2046-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(405,405,'2014-08-01',NULL,33,NULL,NULL,'100425572202',NULL,NULL,'23','60',NULL,NULL,'Yes ','0','2015-04-27','2025-04-26',NULL,'2043-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(406,406,'2014-08-25',NULL,102,NULL,NULL,'100425541261',NULL,NULL,'24','60',NULL,NULL,'Yes ','0','2013-08-14','2023-08-13',NULL,'2040-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(407,407,'2014-10-30',NULL,2,NULL,NULL,'100425544245',NULL,NULL,'25','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2048-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(408,408,'2014-11-03',NULL,2,NULL,NULL,'100378856887',NULL,NULL,'26','60',NULL,NULL,'Yes ','0','2013-10-18','2023-10-17',NULL,'2044-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(409,409,'2015-01-02',NULL,15,NULL,NULL,'100452754216',NULL,NULL,'27','60',NULL,NULL,'Yes ','0','2011-11-14','2021-11-13',NULL,'2050-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(410,410,'2015-03-13',NULL,2,NULL,NULL,'100805720253',NULL,NULL,'28','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2042-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(411,411,'2015-05-11',NULL,2,NULL,NULL,'100635331508',NULL,NULL,'29','60',NULL,NULL,'Yes ','0','2009-05-18','2019-05-17',NULL,'2048-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(412,412,'2015-06-15',NULL,2,NULL,NULL,'100843453258',NULL,NULL,'30','60',NULL,NULL,'Yes ','0','2014-07-30','2024-07-30',NULL,'2047-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(413,413,'2015-07-20',NULL,2,NULL,NULL,'100697435504',NULL,NULL,'31','60',NULL,NULL,'Yes ','0','2009-03-12','2019-03-11',NULL,'2049-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(414,414,'2016-01-11',NULL,2,NULL,NULL,'100354620849',NULL,NULL,'32','60',NULL,NULL,'Yes ','0','2012-09-25','2022-09-24',NULL,'2050-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(415,415,'2016-02-01',NULL,2,NULL,NULL,'100431346751',NULL,NULL,'33','60',NULL,NULL,'Yes ','0','2007-11-30','2017-11-29',NULL,'2049-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(416,416,'2016-04-04',NULL,2,NULL,NULL,'100440605871',NULL,NULL,'35','60',NULL,NULL,'Yes ','0','2014-03-21','2024-03-20',NULL,'2050-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(417,417,'2016-06-13',NULL,15,NULL,NULL,'100891602679',NULL,NULL,'36','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2050-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(418,418,'2016-09-21',NULL,2,NULL,NULL,'100925575643',NULL,NULL,'37','60',NULL,NULL,'Yes ','0','2014-09-05','2024-09-04',NULL,'2050-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(419,419,'2017-01-05',NULL,2,NULL,NULL,'100452780991',NULL,NULL,'38','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2051-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(420,420,'2017-01-23',NULL,2,NULL,NULL,'101014930931',NULL,NULL,'39','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2050-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(421,421,'2017-02-13',NULL,33,NULL,NULL,'100534628095',NULL,NULL,'40','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2049-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(422,422,'2017-04-24',NULL,15,NULL,NULL,'0',NULL,NULL,'41','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2050-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL),(423,423,'2017-04-24',NULL,2,NULL,NULL,'0',NULL,NULL,'42','60',NULL,NULL,'Yes ','0','2009-01-22','2019-01-21',NULL,'2047-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-05-12 10:33:02','2017-05-12 10:33:02',NULL,NULL);
/*!40000 ALTER TABLE `joining_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `late_mark_masters`
--

DROP TABLE IF EXISTS `late_mark_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `late_mark_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `late_mark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `late_mark_masters`
--

LOCK TABLES `late_mark_masters` WRITE;
/*!40000 ALTER TABLE `late_mark_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `late_mark_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leav_approveds`
--

DROP TABLE IF EXISTS `leav_approveds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leav_approveds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leav_approveds_on_employee_id` (`employee_id`),
  KEY `index_leav_approveds_on_employee_leav_request_id` (`employee_leav_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_approveds`
--

LOCK TABLES `leav_approveds` WRITE;
/*!40000 ALTER TABLE `leav_approveds` DISABLE KEYS */;
/*!40000 ALTER TABLE `leav_approveds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leav_cancelleds`
--

DROP TABLE IF EXISTS `leav_cancelleds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leav_cancelleds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leav_cancelleds_on_employee_id` (`employee_id`),
  KEY `index_leav_cancelleds_on_employee_leav_request_id` (`employee_leav_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_cancelleds`
--

LOCK TABLES `leav_cancelleds` WRITE;
/*!40000 ALTER TABLE `leav_cancelleds` DISABLE KEYS */;
/*!40000 ALTER TABLE `leav_cancelleds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leav_categories`
--

DROP TABLE IF EXISTS `leav_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leav_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_payble` tinyint(1) DEFAULT NULL,
  `from` decimal(10,0) DEFAULT NULL,
  `to` decimal(10,0) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_balance` tinyint(1) DEFAULT NULL,
  `limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_limit` tinyint(1) DEFAULT NULL,
  `is_cashable` tinyint(1) DEFAULT NULL,
  `assign_balance` tinyint(1) DEFAULT NULL,
  `is_continuous` tinyint(1) DEFAULT NULL,
  `monthly_leave` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'1.0','CL','Casual Leave',NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2.0','EL','Earned Leave',NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'3.0','LWP','LWP Leave',NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'4.0','ESIC','ESIC Leave',NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'5.0','AL','Advance Leave',NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'6.0','C.Off','Compensatory Off',NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `leav_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leav_rejecteds`
--

DROP TABLE IF EXISTS `leav_rejecteds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leav_rejecteds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leav_rejecteds_on_employee_id` (`employee_id`),
  KEY `index_leav_rejecteds_on_employee_leav_request_id` (`employee_leav_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_rejecteds`
--

LOCK TABLES `leav_rejecteds` WRITE;
/*!40000 ALTER TABLE `leav_rejecteds` DISABLE KEYS */;
/*!40000 ALTER TABLE `leav_rejecteds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_c_offs`
--

DROP TABLE IF EXISTS `leave_c_offs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_c_offs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `c_off_date` date DEFAULT NULL,
  `c_off_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_off_expire_day` int(11) DEFAULT '0',
  `expiry_status` tinyint(1) DEFAULT NULL,
  `is_taken` tinyint(1) DEFAULT '0',
  `expiry_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `leave_count` decimal(3,1) DEFAULT NULL,
  `is_expire` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_c_offs_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9c0707de08` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_c_offs`
--

LOCK TABLES `leave_c_offs` WRITE;
/*!40000 ALTER TABLE `leave_c_offs` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_c_offs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_cash_masters`
--

DROP TABLE IF EXISTS `leave_cash_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_cash_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_cash_masters`
--

LOCK TABLES `leave_cash_masters` WRITE;
/*!40000 ALTER TABLE `leave_cash_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_cash_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_cashables`
--

DROP TABLE IF EXISTS `leave_cashables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_cashables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cashable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_cashables_on_employee_id` (`employee_id`),
  KEY `index_leave_cashables_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_9d50fe4be1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_a0ff1845b1` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_cashables`
--

LOCK TABLES `leave_cashables` WRITE;
/*!40000 ALTER TABLE `leave_cashables` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_cashables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_details`
--

DROP TABLE IF EXISTS `leave_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salaryslip_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_details_on_salaryslip_id` (`salaryslip_id`),
  KEY `index_leave_details_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_0b5a0933d0` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_8be0405cd4` FOREIGN KEY (`salaryslip_id`) REFERENCES `salaryslips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_details`
--

LOCK TABLES `leave_details` WRITE;
/*!40000 ALTER TABLE `leave_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_masters`
--

DROP TABLE IF EXISTS `leave_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leav_category_id` int(11) DEFAULT NULL,
  `period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_day` decimal(10,0) DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_carry_forward` tinyint(1) DEFAULT NULL,
  `limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_workingday` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_masters_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_70bf421420` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_masters`
--

LOCK TABLES `leave_masters` WRITE;
/*!40000 ALTER TABLE `leave_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_records`
--

DROP TABLE IF EXISTS `leave_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count` decimal(10,0) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_records_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_leave_records_on_employee_id` (`employee_id`),
  KEY `index_leave_records_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_7084af96c0` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_caa1617fdd` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_eb9a898167` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_records`
--

LOCK TABLES `leave_records` WRITE;
/*!40000 ALTER TABLE `leave_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_status_records`
--

DROP TABLE IF EXISTS `leave_status_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_status_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `change_status_employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_status_records_on_employee_leav_request_id` (`employee_leav_request_id`),
  CONSTRAINT `fk_rails_860c58f234` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status_records`
--

LOCK TABLES `leave_status_records` WRITE;
/*!40000 ALTER TABLE `leave_status_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_status_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaving_reasons`
--

DROP TABLE IF EXISTS `leaving_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaving_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaving_reasons`
--

LOCK TABLES `leaving_reasons` WRITE;
/*!40000 ALTER TABLE `leaving_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaving_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_attendances`
--

DROP TABLE IF EXISTS `machine_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `in` datetime DEFAULT NULL,
  `out` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `shift_master_id` int(11) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT NULL,
  `present` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_machine_attendances_on_employee_id` (`employee_id`),
  KEY `index_machine_attendances_on_shift_master_id` (`shift_master_id`),
  CONSTRAINT `fk_rails_55c38ce56a` FOREIGN KEY (`shift_master_id`) REFERENCES `shift_masters` (`id`),
  CONSTRAINT `fk_rails_743778213d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_attendances`
--

LOCK TABLES `machine_attendances` WRITE;
/*!40000 ALTER TABLE `machine_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_2s`
--

DROP TABLE IF EXISTS `manager_2s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_2s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_2s`
--

LOCK TABLES `manager_2s` WRITE;
/*!40000 ALTER TABLE `manager_2s` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_2s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_histories`
--

DROP TABLE IF EXISTS `manager_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `manager_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_manager_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_6626907ede` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manual_member_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `member_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subdomain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `is_gps` tinyint(1) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_email` (`email`),
  UNIQUE KEY `index_members_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_members_on_member_code` (`member_code`),
  KEY `index_members_on_role_id` (`role_id`),
  KEY `index_members_on_company_id` (`company_id`),
  KEY `index_members_on_company_location_id` (`company_location_id`),
  KEY `index_members_on_department_id` (`department_id`),
  KEY `index_members_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_1e30d6a7f9` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4313c50609` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_4d6da59c74` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_8a1fbe96f3` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_ba7343b1aa` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_arrears`
--

DROP TABLE IF EXISTS `monthly_arrears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_arrears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_monthly_arrears_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_bd7d347f12` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_arrears`
--

LOCK TABLES `monthly_arrears` WRITE;
/*!40000 ALTER TABLE `monthly_arrears` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_arrears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_expences`
--

DROP TABLE IF EXISTS `monthly_expences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_expences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expence_date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT '0.00',
  `employee_id` int(11) DEFAULT NULL,
  `expencess_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_monthly_expences_on_employee_id` (`employee_id`),
  KEY `index_monthly_expences_on_expencess_type_id` (`expencess_type_id`),
  CONSTRAINT `fk_rails_230dfd3189` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_50565ec74d` FOREIGN KEY (`expencess_type_id`) REFERENCES `expencess_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_expences`
--

LOCK TABLES `monthly_expences` WRITE;
/*!40000 ALTER TABLE `monthly_expences` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_expences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationalities`
--

DROP TABLE IF EXISTS `nationalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
INSERT INTO `nationalities` VALUES (1,'1.0','Indian',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49');
/*!40000 ALTER TABLE `nationalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomination_masters`
--

DROP TABLE IF EXISTS `nomination_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomination_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomination_masters`
--

LOCK TABLES `nomination_masters` WRITE;
/*!40000 ALTER TABLE `nomination_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomination_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `od_records`
--

DROP TABLE IF EXISTS `od_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `on_duty_request_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_od_records_on_employee_id` (`employee_id`),
  KEY `index_od_records_on_on_duty_request_id` (`on_duty_request_id`),
  CONSTRAINT `fk_rails_1e8f8bb063` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_85eb71a07a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_records`
--

LOCK TABLES `od_records` WRITE;
/*!40000 ALTER TABLE `od_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `od_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `od_status_records`
--

DROP TABLE IF EXISTS `od_status_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `od_status_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `on_duty_request_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_od_status_records_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_od_status_records_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_2c147fe338` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_b6b50899cc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_status_records`
--

LOCK TABLES `od_status_records` WRITE;
/*!40000 ALTER TABLE `od_status_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `od_status_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_duty_requests`
--

DROP TABLE IF EXISTS `on_duty_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_duty_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `no_of_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `first_half` tinyint(1) DEFAULT NULL,
  `last_half` tinyint(1) DEFAULT NULL,
  `present_status` tinyint(1) DEFAULT NULL,
  `current_status` int(11) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_first_approved` tinyint(1) DEFAULT NULL,
  `is_second_approved` tinyint(1) DEFAULT NULL,
  `is_first_rejected` tinyint(1) DEFAULT NULL,
  `is_second_rejected` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_on_duty_requests_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_3f4c37aed9` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_duty_requests`
--

LOCK TABLES `on_duty_requests` WRITE;
/*!40000 ALTER TABLE `on_duty_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_duty_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_salary_components`
--

DROP TABLE IF EXISTS `other_salary_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_salary_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deducted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_salary_components`
--

LOCK TABLES `other_salary_components` WRITE;
/*!40000 ALTER TABLE `other_salary_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_salary_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overall_ratings`
--

DROP TABLE IF EXISTS `overall_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overall_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_rating_sheet_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `ro1_id` int(11) DEFAULT NULL,
  `ro2_id` int(11) DEFAULT NULL,
  `final_id` int(11) DEFAULT NULL,
  `ro1_rating_id` int(11) DEFAULT NULL,
  `ro1_comment` text COLLATE utf8_unicode_ci,
  `ro2_rating_id` int(11) DEFAULT NULL,
  `ro2_comment` text COLLATE utf8_unicode_ci,
  `final_rating_id` int(11) DEFAULT NULL,
  `final_comment` text COLLATE utf8_unicode_ci,
  `promotion` tinyint(1) DEFAULT NULL,
  `increement_amount` decimal(10,0) DEFAULT NULL,
  `final_ctc` decimal(10,0) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overall_ratings_on_employee_id` (`employee_id`),
  KEY `index_overall_ratings_on_final_id` (`final_id`),
  KEY `index_overall_ratings_on_final_rating_id` (`final_rating_id`),
  KEY `index_overall_ratings_on_goal_rating_sheet_id` (`goal_rating_sheet_id`),
  KEY `index_overall_ratings_on_ro1_id` (`ro1_id`),
  KEY `index_overall_ratings_on_ro1_rating_id` (`ro1_rating_id`),
  KEY `index_overall_ratings_on_ro2_id` (`ro2_id`),
  KEY `index_overall_ratings_on_ro2_rating_id` (`ro2_rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overall_ratings`
--

LOCK TABLES `overall_ratings` WRITE;
/*!40000 ALTER TABLE `overall_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `overall_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime_daily_records`
--

DROP TABLE IF EXISTS `overtime_daily_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime_daily_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `ot_daily_date` date DEFAULT NULL,
  `ot_daily_hrs` decimal(15,2) DEFAULT '0.00',
  `ot_rate` decimal(15,2) DEFAULT '0.00',
  `ot_daily_amount` decimal(15,2) DEFAULT '0.00',
  `attendance_bonus_amount` decimal(15,2) DEFAULT '0.00',
  `paid_holiday_amount` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overtime_daily_records_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_56654f8410` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime_daily_records`
--

LOCK TABLES `overtime_daily_records` WRITE;
/*!40000 ALTER TABLE `overtime_daily_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime_daily_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime_masters`
--

DROP TABLE IF EXISTS `overtime_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_over_time` tinyint(1) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `company_hrs` decimal(15,2) DEFAULT '0.00',
  `ot_rate` decimal(15,2) DEFAULT '0.00',
  `is_esic` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime_masters`
--

LOCK TABLES `overtime_masters` WRITE;
/*!40000 ALTER TABLE `overtime_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime_month_records`
--

DROP TABLE IF EXISTS `overtime_month_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime_month_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `overtime_data` date DEFAULT NULL,
  `attendance_bonus_amount` decimal(15,2) DEFAULT NULL,
  `paid_holiday_amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overtime_month_records_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_17013f43d8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime_month_records`
--

LOCK TABLES `overtime_month_records` WRITE;
/*!40000 ALTER TABLE `overtime_month_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime_month_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime_salaries`
--

DROP TABLE IF EXISTS `overtime_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtime_salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ot_hrs` decimal(15,2) DEFAULT '0.00',
  `ot_esic_amount` decimal(15,2) DEFAULT '0.00',
  `total_amount` decimal(15,2) DEFAULT '0.00',
  `attendence_bouns_amount` decimal(15,2) DEFAULT '0.00',
  `paid_holiday_amount` decimal(15,2) DEFAULT '0.00',
  `net_payble_amount` decimal(15,2) DEFAULT '0.00',
  `ot_date` date DEFAULT NULL,
  `basic_amount` decimal(15,2) DEFAULT '0.00',
  `ot_amount` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overtime_salaries_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_765ca5879a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime_salaries`
--

LOCK TABLES `overtime_salaries` WRITE;
/*!40000 ALTER TABLE `overtime_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtimes`
--

DROP TABLE IF EXISTS `overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `ot_date` date DEFAULT NULL,
  `ot_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_total_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_production` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `normal_wages_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_wages_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_earning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_on_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overtimes_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtimes`
--

LOCK TABLES `overtimes` WRITE;
/*!40000 ALTER TABLE `overtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_salary_components`
--

DROP TABLE IF EXISTS `parent_salary_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_salary_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_salary_components`
--

LOCK TABLES `parent_salary_components` WRITE;
/*!40000 ALTER TABLE `parent_salary_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `parent_salary_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particular_leave_records`
--

DROP TABLE IF EXISTS `particular_leave_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particular_leave_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `is_full` tinyint(1) DEFAULT NULL,
  `is_cancel_after_approve` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_particular_leave_records_on_employee_id` (`employee_id`),
  KEY `index_particular_leave_records_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_particular_leave_records_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_252e12812d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_c3675b7452` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_c6db58028e` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_leave_records`
--

LOCK TABLES `particular_leave_records` WRITE;
/*!40000 ALTER TABLE `particular_leave_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `particular_leave_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particular_od_records`
--

DROP TABLE IF EXISTS `particular_od_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particular_od_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `on_duty_request_id` int(11) DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `is_full` tinyint(1) DEFAULT NULL,
  `is_cancel_after_approve` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_particular_od_records_on_employee_id` (`employee_id`),
  KEY `index_particular_od_records_on_on_duty_request_id` (`on_duty_request_id`),
  CONSTRAINT `fk_rails_1988865263` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_d021077a8d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_od_records`
--

LOCK TABLES `particular_od_records` WRITE;
/*!40000 ALTER TABLE `particular_od_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `particular_od_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particular_vacancy_requests`
--

DROP TABLE IF EXISTS `particular_vacancy_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particular_vacancy_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `fulfillment_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `vacancy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `closed_position` int(11) DEFAULT NULL,
  `interview_schedule_id` int(11) DEFAULT NULL,
  `selected_resume_id` int(11) DEFAULT NULL,
  `candidate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_particular_vacancy_requests_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_particular_vacancy_requests_on_employee_id` (`employee_id`),
  KEY `index_particular_vacancy_requests_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_particular_vacancy_requests_on_interview_schedule_id` (`interview_schedule_id`),
  KEY `index_particular_vacancy_requests_on_selected_resume_id` (`selected_resume_id`),
  CONSTRAINT `fk_rails_96ecb6c727` FOREIGN KEY (`selected_resume_id`) REFERENCES `selected_resumes` (`id`),
  CONSTRAINT `fk_rails_acf7ee9414` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_b3f4490cc2` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`),
  CONSTRAINT `fk_rails_d10cd454d2` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`),
  CONSTRAINT `fk_rails_f4cb3c6ec6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_vacancy_requests`
--

LOCK TABLES `particular_vacancy_requests` WRITE;
/*!40000 ALTER TABLE `particular_vacancy_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `particular_vacancy_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,'1.0','Cheque',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(2,'2.0','Cash',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(3,'3.0','Bank',NULL,NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(4,'4.0','DD','Demand Draft',NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47'),(5,'5.0','NEFT','National Electronic Funds Transfer',NULL,'2017-05-11 13:50:47','2017-05-11 13:50:47');
/*!40000 ALTER TABLE `payment_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_overtime_masters`
--

DROP TABLE IF EXISTS `payroll_overtime_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_overtime_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_payroll` tinyint(1) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_overtime_masters`
--

LOCK TABLES `payroll_overtime_masters` WRITE;
/*!40000 ALTER TABLE `payroll_overtime_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_overtime_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_periods`
--

DROP TABLE IF EXISTS `payroll_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_periods`
--

LOCK TABLES `payroll_periods` WRITE;
/*!40000 ALTER TABLE `payroll_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_activities`
--

DROP TABLE IF EXISTS `performance_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_activities`
--

LOCK TABLES `performance_activities` WRITE;
/*!40000 ALTER TABLE `performance_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_calendars`
--

DROP TABLE IF EXISTS `performance_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `performance_activity_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_performance_calendars_on_period_id` (`period_id`),
  KEY `index_performance_calendars_on_performance_activity_id` (`performance_activity_id`),
  CONSTRAINT `fk_rails_23005f6fef` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_6dbef4ee67` FOREIGN KEY (`performance_activity_id`) REFERENCES `performance_activities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_calendars`
--

LOCK TABLES `performance_calendars` WRITE;
/*!40000 ALTER TABLE `performance_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_periods`
--

DROP TABLE IF EXISTS `performance_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_periods`
--

LOCK TABLES `performance_periods` WRITE;
/*!40000 ALTER TABLE `performance_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_employers`
--

DROP TABLE IF EXISTS `pf_employers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_employers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_employers`
--

LOCK TABLES `pf_employers` WRITE;
/*!40000 ALTER TABLE `pf_employers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_employers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_masters`
--

DROP TABLE IF EXISTS `pf_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_pf` tinyint(1) DEFAULT NULL,
  `percentage` decimal(4,2) DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `min_limit` decimal(15,2) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_masters`
--

LOCK TABLES `pf_masters` WRITE;
/*!40000 ALTER TABLE `pf_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `pf_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_tax_masters`
--

DROP TABLE IF EXISTS `professional_tax_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional_tax_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_amount` decimal(10,0) DEFAULT NULL,
  `max_amount` decimal(10,0) DEFAULT NULL,
  `for_month` decimal(10,0) DEFAULT NULL,
  `march_amount` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `basis_actual_amount` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_professional_tax_masters_on_company_location_id` (`company_location_id`),
  CONSTRAINT `fk_rails_c4e43471ae` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_tax_masters`
--

LOCK TABLES `professional_tax_masters` WRITE;
/*!40000 ALTER TABLE `professional_tax_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `professional_tax_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_taxes`
--

DROP TABLE IF EXISTS `professional_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_pt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_salary` decimal(15,2) DEFAULT '0.00',
  `max_salary` decimal(15,2) DEFAULT '0.00',
  `pt_amount` decimal(15,2) DEFAULT '0.00',
  `for_months` decimal(15,2) DEFAULT '0.00',
  `march_month` decimal(15,2) DEFAULT '0.00',
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_taxes`
--

LOCK TABLES `professional_taxes` WRITE;
/*!40000 ALTER TABLE `professional_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `professional_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_masters`
--

DROP TABLE IF EXISTS `project_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_masters`
--

LOCK TABLES `project_masters` WRITE;
/*!40000 ALTER TABLE `project_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_histories`
--

DROP TABLE IF EXISTS `promotion_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_promotion_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `employee_ctc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promotion_histories_on_employee_promotion_id` (`employee_promotion_id`),
  KEY `index_promotion_histories_on_employee_id` (`employee_id`),
  KEY `index_promotion_histories_on_department_id` (`department_id`),
  KEY `index_promotion_histories_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_promotion_histories_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_promotion_histories_on_employee_category_id` (`employee_category_id`),
  CONSTRAINT `fk_rails_2b25b2bafc` FOREIGN KEY (`employee_promotion_id`) REFERENCES `employee_promotions` (`id`),
  CONSTRAINT `fk_rails_2c7fe613b1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_435dc5d01b` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_719632b493` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_71b55fc824` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_73938147dc` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_histories`
--

LOCK TABLES `promotion_histories` WRITE;
/*!40000 ALTER TABLE `promotion_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punch_cards`
--

DROP TABLE IF EXISTS `punch_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punch_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punch_cards`
--

LOCK TABLES `punch_cards` WRITE;
/*!40000 ALTER TABLE `punch_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `punch_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualifications`
--

DROP TABLE IF EXISTS `qualifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `degree_type_id` int(11) DEFAULT NULL,
  `degree_stream_id` int(11) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `college` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marks_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_qualifications_on_employee_id` (`employee_id`),
  KEY `index_qualifications_on_degree_id` (`degree_id`),
  KEY `index_qualifications_on_degree_type_id` (`degree_type_id`),
  KEY `index_qualifications_on_degree_stream_id` (`degree_stream_id`),
  KEY `index_qualifications_on_year_id` (`year_id`),
  KEY `index_qualifications_on_university_id` (`university_id`),
  CONSTRAINT `fk_rails_046e89b830` FOREIGN KEY (`degree_stream_id`) REFERENCES `degree_streams` (`id`),
  CONSTRAINT `fk_rails_2cc4fb103d` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`),
  CONSTRAINT `fk_rails_3722b001f0` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_types` (`id`),
  CONSTRAINT `fk_rails_b0cde2dffd` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_bce702aaab` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_c642f67c39` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifications`
--

LOCK TABLES `qualifications` WRITE;
/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_masters`
--

DROP TABLE IF EXISTS `question_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_masters`
--

LOCK TABLES `question_masters` WRITE;
/*!40000 ALTER TABLE `question_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_designations`
--

DROP TABLE IF EXISTS `r_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_designations`
--

LOCK TABLES `r_designations` WRITE;
/*!40000 ALTER TABLE `r_designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_masters`
--

DROP TABLE IF EXISTS `rating_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_masters`
--

LOCK TABLES `rating_masters` WRITE;
/*!40000 ALTER TABLE `rating_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discription` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recognition_types`
--

DROP TABLE IF EXISTS `recognition_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recognition_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recognition_types`
--

LOCK TABLES `recognition_types` WRITE;
/*!40000 ALTER TABLE `recognition_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `recognition_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_masters`
--

DROP TABLE IF EXISTS `relation_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_masters`
--

LOCK TABLES `relation_masters` WRITE;
/*!40000 ALTER TABLE `relation_masters` DISABLE KEYS */;
INSERT INTO `relation_masters` VALUES (1,'1.0','Father',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(2,'2.0','Mother',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(3,'3.0','Daughter',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(4,'4.0','Son',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(5,'5.0','Brother',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(6,'6.0','Wife',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(7,'7.0','Husband',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50'),(8,'8.0','Sister',NULL,NULL,'2017-05-11 13:50:50','2017-05-11 13:50:50');
/*!40000 ALTER TABLE `relation_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Hinduism','1.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(2,'Jainism','2.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(3,'Islam','3.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(4,'Sikhism','4.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(5,'Christianity','5.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(6,'Buddhism','6.0',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replacements`
--

DROP TABLE IF EXISTS `replacements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replacements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replacements`
--

LOCK TABLES `replacements` WRITE;
/*!40000 ALTER TABLE `replacements` DISABLE KEYS */;
/*!40000 ALTER TABLE `replacements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_employee_transfers`
--

DROP TABLE IF EXISTS `reporting_employee_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_employee_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_transfer_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_employee_transfers_on_employee_transfer_id` (`employee_transfer_id`),
  CONSTRAINT `fk_rails_4b58f99d0a` FOREIGN KEY (`employee_transfer_id`) REFERENCES `employee_transfers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_employee_transfers`
--

LOCK TABLES `reporting_employee_transfers` WRITE;
/*!40000 ALTER TABLE `reporting_employee_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_employee_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_masters`
--

DROP TABLE IF EXISTS `reporting_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_expences` tinyint(1) DEFAULT NULL,
  `is_training` tinyint(1) DEFAULT NULL,
  `is_recruitment` tinyint(1) DEFAULT NULL,
  `is_resignation` tinyint(1) DEFAULT NULL,
  `is_transfer` tinyint(1) DEFAULT NULL,
  `is_promotion` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_d6a54407d7` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_masters_resigns`
--

DROP TABLE IF EXISTS `reporting_masters_resigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_masters_resigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_resignation_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `resignation_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_resigns_on_employee_resignation_id` (`employee_resignation_id`),
  KEY `index_reporting_masters_resigns_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_a39169356b` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`),
  CONSTRAINT `fk_rails_eb1ee47b3d` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters_resigns`
--

LOCK TABLES `reporting_masters_resigns` WRITE;
/*!40000 ALTER TABLE `reporting_masters_resigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_masters_resigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_masters_training_reqs`
--

DROP TABLE IF EXISTS `reporting_masters_training_reqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_masters_training_reqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_training` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters_training_reqs`
--

LOCK TABLES `reporting_masters_training_reqs` WRITE;
/*!40000 ALTER TABLE `reporting_masters_training_reqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_masters_training_reqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_masters_travel_requests`
--

DROP TABLE IF EXISTS `reporting_masters_travel_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_masters_travel_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `travel_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `daily_bill_comment` text COLLATE utf8_unicode_ci,
  `reporting_master_id` int(11) DEFAULT NULL,
  `travel_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters_travel_requests`
--

LOCK TABLES `reporting_masters_travel_requests` WRITE;
/*!40000 ALTER TABLE `reporting_masters_travel_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_masters_travel_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporting_masters_vacancy_masters`
--

DROP TABLE IF EXISTS `reporting_masters_vacancy_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_masters_vacancy_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vacancy_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_vacancy_masters_on_vacancy_master_id` (`vacancy_master_id`),
  CONSTRAINT `fk_rails_fa29a31aa7` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters_vacancy_masters`
--

LOCK TABLES `reporting_masters_vacancy_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters_vacancy_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_masters_vacancy_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved_categories`
--

DROP TABLE IF EXISTS `reserved_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserved_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_categories`
--

LOCK TABLES `reserved_categories` WRITE;
/*!40000 ALTER TABLE `reserved_categories` DISABLE KEYS */;
INSERT INTO `reserved_categories` VALUES (1,'1.0','GENERAL','General',NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(2,'2.0','OBC','Other Backward Classes',NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(3,'3.0','SC','Scheduled Caste',NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(4,'4.0','ST','Scheduled Tribes',NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(5,'5.0','NT','Nomadic Tribes',NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49');
/*!40000 ALTER TABLE `reserved_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resignation_histories`
--

DROP TABLE IF EXISTS `resignation_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resignation_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_resignation_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `resignation_date` date DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_notice_period` tinyint(1) DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tentative_leaving_date` date DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `exit_interview_date` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `leaving_date` date DEFAULT NULL,
  `settled_on` date DEFAULT NULL,
  `has_left` tinyint(1) DEFAULT NULL,
  `notice_served` tinyint(1) DEFAULT NULL,
  `rehired` tinyint(1) DEFAULT NULL,
  `leaving_reason_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resignation_histories_on_employee_resignation_id` (`employee_resignation_id`),
  KEY `index_resignation_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_resignation_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_834cfeb746` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b04daa0d11` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`),
  CONSTRAINT `fk_rails_d3d6058927` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignation_histories`
--

LOCK TABLES `resignation_histories` WRITE;
/*!40000 ALTER TABLE `resignation_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `resignation_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resignation_status_records`
--

DROP TABLE IF EXISTS `resignation_status_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resignation_status_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_resignation_id` int(11) DEFAULT NULL,
  `change_status_employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resignation_status_records_on_employee_resignation_id` (`employee_resignation_id`),
  KEY `index_resignation_status_records_on_change_status_employee_id` (`change_status_employee_id`),
  CONSTRAINT `fk_rails_8ed7115a02` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`),
  CONSTRAINT `fk_rails_9719223b51` FOREIGN KEY (`change_status_employee_id`) REFERENCES `change_status_employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignation_status_records`
--

LOCK TABLES `resignation_status_records` WRITE;
/*!40000 ALTER TABLE `resignation_status_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `resignation_status_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retention_moneys`
--

DROP TABLE IF EXISTS `retention_moneys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retention_moneys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `have_retention` tinyint(1) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `decimal` decimal(15,2) DEFAULT NULL,
  `no_of_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `persent` decimal(10,0) DEFAULT NULL,
  `max_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_persent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retention_moneys`
--

LOCK TABLES `retention_moneys` WRITE;
/*!40000 ALTER TABLE `retention_moneys` DISABLE KEYS */;
/*!40000 ALTER TABLE `retention_moneys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_ratings`
--

DROP TABLE IF EXISTS `reviewer_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_ratings`
--

LOCK TABLES `reviewer_ratings` WRITE;
/*!40000 ALTER TABLE `reviewer_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers`
--

DROP TABLE IF EXISTS `reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_allocations`
--

DROP TABLE IF EXISTS `reward_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_allocations`
--

LOCK TABLES `reward_allocations` WRITE;
/*!40000 ALTER TABLE `reward_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_owners`
--

DROP TABLE IF EXISTS `reward_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_owners`
--

LOCK TABLES `reward_owners` WRITE;
/*!40000 ALTER TABLE `reward_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_recognitions`
--

DROP TABLE IF EXISTS `reward_recognitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_recognitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reward_type_id` int(11) DEFAULT NULL,
  `reward_owner_id` int(11) DEFAULT NULL,
  `cost_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communication` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `r_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reward_recognitions_on_reward_type_id` (`reward_type_id`),
  KEY `index_reward_recognitions_on_reward_owner_id` (`reward_owner_id`),
  CONSTRAINT `fk_rails_6ee8f4d610` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_931c1253b0` FOREIGN KEY (`reward_owner_id`) REFERENCES `reward_owners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_recognitions`
--

LOCK TABLES `reward_recognitions` WRITE;
/*!40000 ALTER TABLE `reward_recognitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_recognitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward_types`
--

DROP TABLE IF EXISTS `reward_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward_types`
--

LOCK TABLES `reward_types` WRITE;
/*!40000 ALTER TABLE `reward_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards_allocations`
--

DROP TABLE IF EXISTS `rewards_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewards_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reward_type_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `allocated_qty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rewards_allocations_on_reward_type_id` (`reward_type_id`),
  KEY `index_rewards_allocations_on_department_id` (`department_id`),
  KEY `index_rewards_allocations_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_4857fcccb2` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_b3a76cc850` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_c2d3410490` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards_allocations`
--

LOCK TABLES `rewards_allocations` WRITE;
/*!40000 ALTER TABLE `rewards_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewards_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rewards_pals`
--

DROP TABLE IF EXISTS `rewards_pals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rewards_pals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `purpose` text COLLATE utf8_unicode_ci,
  `reward_type_id` int(11) DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rewards_pals_on_employee_id` (`employee_id`),
  KEY `index_rewards_pals_on_reward_type_id` (`reward_type_id`),
  KEY `index_rewards_pals_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_0ea1a76c59` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9f0c2a73fb` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_cf947cf32f` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rewards_pals`
--

LOCK TABLES `rewards_pals` WRITE;
/*!40000 ALTER TABLE `rewards_pals` DISABLE KEYS */;
/*!40000 ALTER TABLE `rewards_pals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1.0','Group Admin',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(2,'2.0','Admin',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(3,'3.0','Branch',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(4,'4.0','HOD',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49'),(5,'5.0','Supervisor',NULL,NULL,'2017-05-11 13:50:49','2017-05-11 13:50:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `root_cause_masters`
--

DROP TABLE IF EXISTS `root_cause_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `root_cause_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `root_cause_masters`
--

LOCK TABLES `root_cause_masters` WRITE;
/*!40000 ALTER TABLE `root_cause_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `root_cause_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_comp_mappings`
--

DROP TABLE IF EXISTS `salary_comp_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_comp_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_component_id` int(11) DEFAULT NULL,
  `erp_account_code` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `map_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salary_comp_mappings_on_salary_component_id` (`salary_component_id`),
  CONSTRAINT `fk_rails_49aad77cec` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_comp_mappings`
--

LOCK TABLES `salary_comp_mappings` WRITE;
/*!40000 ALTER TABLE `salary_comp_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_comp_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_component_templates`
--

DROP TABLE IF EXISTS `salary_component_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_component_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manual_template_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary_template_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `parent_salary_component_id` int(11) DEFAULT NULL,
  `percentage` decimal(4,2) DEFAULT NULL,
  `is_taxable` tinyint(1) DEFAULT NULL,
  `tax` decimal(4,2) DEFAULT NULL,
  `base` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_be_paid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_amount` decimal(15,2) DEFAULT NULL,
  `monthly_amount` decimal(15,2) DEFAULT NULL,
  `annual_amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salary_component_templates_on_salary_template_id` (`salary_template_id`),
  KEY `index_salary_component_templates_on_salary_component_id` (`salary_component_id`),
  KEY `index_salary_component_templates_on_parent_salary_component_id` (`parent_salary_component_id`),
  CONSTRAINT `fk_rails_308f210f51` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`),
  CONSTRAINT `fk_rails_a8d9f7bf2d` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_fb34186ee2` FOREIGN KEY (`parent_salary_component_id`) REFERENCES `parent_salary_components` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_component_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_components`
--

DROP TABLE IF EXISTS `salary_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_base` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'1.0','Basic','Basic',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(2,'2.0','HRA','HRA',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(3,'3.0','Special Allowance','Special Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(4,'4.0','Convenience Allowance','Convenience Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(5,'5.0','Other Allowance','Other Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(6,'6.0','Washing Allowance','Washing Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(7,'7.0','Driver Allowance','Driver Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(8,'8.0','Medical Allowance','Medical Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(9,'9.0','Children Education Allowance','Children Education Allowance',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(10,'10.0','PF','PF',0,NULL,'2017-05-11 13:50:56','2017-05-11 13:50:56',NULL,NULL,NULL,NULL),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(12,'12.0','Income Tax','Income Tax',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(13,'13.0','Food Deduction','Food Deduction',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(14,'14.0','Other Deduction','Other Deduction',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(15,'15.0','Prof. Tax','Prof. Tax',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(16,'16.0','Society','Deposit',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(17,'17.0','Society Loan','Society',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(18,'18.0','Retaintion','Retaintion',0,NULL,'2017-05-11 13:50:57','2017-05-11 13:50:57',NULL,NULL,NULL,NULL),(19,'19.0','DA','Dearness Allowance',0,NULL,'2017-05-11 13:50:58','2017-05-11 13:50:58',NULL,NULL,NULL,NULL),(20,'20.0','Welfare','Welfare',0,NULL,'2017-05-11 13:50:58','2017-05-11 13:50:58',NULL,NULL,NULL,NULL),(21,'21.0','Mobile Deduction','Mobile Deduction',0,NULL,'2017-05-11 13:50:58','2017-05-11 13:50:58',NULL,NULL,NULL,NULL),(22,'22.0','Rembursement of Medical Allowence','Rembursement of Medical Allowence',0,NULL,'2017-05-11 13:50:58','2017-05-11 13:50:58',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `salary_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_map_saps`
--

DROP TABLE IF EXISTS `salary_map_saps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_map_saps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_component_id` int(11) DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_debit` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salary_map_saps_on_salary_component_id` (`salary_component_id`),
  KEY `index_salary_map_saps_on_company_id` (`company_id`),
  KEY `index_salary_map_saps_on_company_location_id` (`company_location_id`),
  CONSTRAINT `fk_rails_850de8562e` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_9691baf3d9` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_ad2c35f5c2` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_map_saps`
--

LOCK TABLES `salary_map_saps` WRITE;
/*!40000 ALTER TABLE `salary_map_saps` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_map_saps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_templates`
--

DROP TABLE IF EXISTS `salary_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validity_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_templates`
--

LOCK TABLES `salary_templates` WRITE;
/*!40000 ALTER TABLE `salary_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaryslip_components`
--

DROP TABLE IF EXISTS `salaryslip_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryslip_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salaryslip_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `actual_amount` decimal(15,2) DEFAULT NULL,
  `calculated_amount` decimal(15,2) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `employee_template_id` int(11) DEFAULT NULL,
  `is_arrear` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salaryslip_components_on_salaryslip_id` (`salaryslip_id`),
  KEY `index_salaryslip_components_on_salary_component_id` (`salary_component_id`),
  KEY `index_salaryslip_components_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_2eefdd8975` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_3e744cafed` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_61ffc4ee46` FOREIGN KEY (`salaryslip_id`) REFERENCES `salaryslips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaryslip_components`
--

LOCK TABLES `salaryslip_components` WRITE;
/*!40000 ALTER TABLE `salaryslip_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaryslip_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaryslips`
--

DROP TABLE IF EXISTS `salaryslips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaryslips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_slip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `month_year` date DEFAULT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workingday_id` int(11) DEFAULT NULL,
  `actual_gross_salary` decimal(15,2) DEFAULT NULL,
  `calculated_gross_salary` decimal(15,2) DEFAULT NULL,
  `actual_total_deduction` decimal(15,2) DEFAULT NULL,
  `calculated_total_deduction` decimal(15,2) DEFAULT NULL,
  `actual_net_salary` decimal(15,2) DEFAULT NULL,
  `calculated_net_salary` decimal(15,2) DEFAULT NULL,
  `salary_template_id` int(11) DEFAULT NULL,
  `other_component_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_template_id` int(11) DEFAULT NULL,
  `arrear_actual_amount` decimal(15,2) DEFAULT NULL,
  `arrear_calculated_amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salaryslips_on_employee_id` (`employee_id`),
  KEY `index_salaryslips_on_workingday_id` (`workingday_id`),
  KEY `index_salaryslips_on_salary_template_id` (`salary_template_id`),
  KEY `index_salaryslips_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_26883533a7` FOREIGN KEY (`workingday_id`) REFERENCES `workingdays` (`id`),
  CONSTRAINT `fk_rails_514f6de682` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_588b701a4c` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`),
  CONSTRAINT `fk_rails_d880307445` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaryslips`
--

LOCK TABLES `salaryslips` WRITE;
/*!40000 ALTER TABLE `salaryslips` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaryslips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150324102043'),('20150325090846'),('20150325091324'),('20150325100517'),('20150325100542'),('20150325101803'),('20150325102033'),('20150325104717'),('20150325111606'),('20150325111623'),('20150325134729'),('20150325134819'),('20150325134837'),('20150325134903'),('20150325134922'),('20150325134940'),('20150325135957'),('20150325140537'),('20150325144044'),('20150325150921'),('20150325150947'),('20150325174047'),('20150325174955'),('20150327052554'),('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060618'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151202085649'),('20151216125726'),('20151216152348'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160126095053'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145448'),('20160316052708'),('20160316094100'),('20160316141509'),('20160331045040'),('20160404140512'),('20160412090355'),('20160415070421'),('20160420061134'),('20160422090711'),('20160425125834'),('20160425130117'),('20160425130430'),('20160426051551'),('20160427065407'),('20160427070132'),('20160429092014'),('20160429101007'),('20160430085609'),('20160430102835'),('20160430121430'),('20160502065715'),('20160503130816'),('20160505114907'),('20160506111946'),('20160506132700'),('20160507041032'),('20160507091410'),('20160507093658'),('20160507125255'),('20160509053112'),('20160510063354'),('20160510100004'),('20160511051814'),('20160512064603'),('20160512104401'),('20160512121825'),('20160513054933'),('20160513111008'),('20160514043418'),('20160518120252'),('20160518131745'),('20160519044004'),('20160519052729'),('20160519093350'),('20160519095917'),('20160521090528'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102305'),('20160521125304'),('20160521125746'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523065040'),('20160523101534'),('20160523105510'),('20160523121643'),('20160524135053'),('20160524141810'),('20160524151419'),('20160524160726'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525092335'),('20160525093729'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525103235'),('20160525123930'),('20160525133638'),('20160525151304'),('20160526051433'),('20160526052421'),('20160526052958'),('20160527084359'),('20160527104217'),('20160527111646'),('20160527120440'),('20160527140816'),('20160527141004'),('20160527141144'),('20160527142915'),('20160528063330'),('20160528063928'),('20160601110412'),('20160603070019'),('20160603074402'),('20160604051919'),('20160604051920'),('20160611123423'),('20160611124310'),('20160611124312'),('20160611124313'),('20160611124314'),('20160611133245'),('20160613092931'),('20160614072206'),('20160615092744'),('20160616065812'),('20160616070304'),('20160616095752'),('20160616124121'),('20160616133220'),('20160617092902'),('20160617104631'),('20160618095321'),('20160620054519'),('20160620055118'),('20160620064939'),('20160620072911'),('20160620104935'),('20160620121046'),('20160622093650'),('20160622130051'),('20160622131114'),('20160623041219'),('20160623041859'),('20160623052807'),('20160623070518'),('20160623071253'),('20160623080812'),('20160623081113'),('20160623112832'),('20160623134245'),('20160625182131'),('20160627072219'),('20160627073417'),('20160627110446'),('20160629063100'),('20160629065100'),('20160630094223'),('20160701085057'),('20160701114346'),('20160701134431'),('20160702054606'),('20160702063829'),('20160702070306'),('20160702095708'),('20160702120512'),('20160704101850'),('20160705193212'),('20160705194038'),('20160705195945'),('20160705235546'),('20160708094655'),('20160708113856'),('20160709092245'),('20160709092553'),('20160709092554'),('20160713065422'),('20160713103049'),('20160713120654'),('20160714101056'),('20160714110530'),('20160714111459'),('20160714111509'),('20160714150355'),('20160714151407'),('20160714152316'),('20160714152715'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715040433'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718052304'),('20160718060157'),('20160718060643'),('20160718064620'),('20160718065930'),('20160719060335'),('20160719061924'),('20160719091404'),('20160720064045'),('20160720130301'),('20160721085732'),('20160721102648'),('20160723062632'),('20160723080129'),('20160723105713'),('20160726055056'),('20160728072434'),('20160729053928'),('20160729065257'),('20160730091204'),('20160730094606'),('20160801111028'),('20160802071320'),('20160802100120'),('20160804113523'),('20160805110143'),('20160805121851'),('20160816125736'),('20160817071523'),('20160819054051'),('20160825065859'),('20160827064407'),('20160827065404'),('20160829042937'),('20160829070847'),('20160829104436'),('20160829120956'),('20160830111216'),('20160902105729'),('20160903102739'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160907102455'),('20160908061653'),('20160908093902'),('20160912055114'),('20160913043824'),('20160919045818'),('20160926060633'),('20160926063141'),('20160927120109'),('20161004100505'),('20161004100722'),('20161004130453'),('20161007125531'),('20161013052635'),('20161014073847'),('20161014124546'),('20161018113305'),('20161019065322'),('20161019103720'),('20161104093342'),('20161105060406'),('20161107100328'),('20161107135922'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161114115826'),('20161114125046'),('20161119073523'),('20161119073618'),('20161119073700'),('20161121132745'),('20161122113351'),('20161122114309'),('20161122114648'),('20161123105419'),('20161123105420'),('20161123105421'),('20161124060652'),('20161124071935'),('20161124091647'),('20161124091725'),('20161124112153'),('20161124112721'),('20161125104852'),('20161126103908'),('20161128060507'),('20161128111741'),('20161129124940'),('20161129125213'),('20161203040527'),('20161215074308'),('20161216062450'),('20161216112032'),('20161220121946'),('20161220124243'),('20161221070931'),('20161221115255'),('20161231091546'),('20161231115416'),('20170102083022'),('20170102084600'),('20170102091214'),('20170102092744'),('20170107064553'),('20170109044054'),('20170109125507'),('20170110045655'),('20170112050137'),('20170116051750'),('20170117094339'),('20170118034909'),('20170118040257'),('20170118070135'),('20170125122032'),('20170127063657'),('20170131111613'),('20170203131348'),('20170203141934'),('20170204035132'),('20170207105642'),('20170208060007'),('20170208124431'),('20170209052940'),('20170209064013'),('20170209103531'),('20170210072013'),('20170213063011'),('20170214120418'),('20170215060325'),('20170215062521'),('20170216040223'),('20170216053607'),('20170217092904'),('20170218051520'),('20170218053643'),('20170222091948'),('20170223053723'),('20170223053807'),('20170223070956'),('20170224043312'),('20170224044647'),('20170224062827'),('20170224091456'),('20170227050116'),('20170227050304'),('20170301093409'),('20170302113203'),('20170303040100'),('20170304054259'),('20170304114424'),('20170306045721'),('20170306084847'),('20170306095314'),('20170309062116'),('20170310122831'),('20170310123007'),('20170317054641'),('20170317070345'),('20170318044750'),('20170320060327'),('20170320062722'),('20170320065646'),('20170321050344'),('20170321071817'),('20170321084647'),('20170327102041'),('20170404093007'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170412064643'),('20170413063000'),('20170413072802'),('20170418111052'),('20170420105215'),('20170421050543'),('20170427043450'),('20170428041951'),('20170428045355'),('20170428061933'),('20170428093132'),('20170429090052'),('20170501071548'),('20170501075331'),('20170502044158'),('20170508073310'),('20170509052752'),('20170509053306'),('20170509091200'),('20170509105811');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `second_reporters`
--

DROP TABLE IF EXISTS `second_reporters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `second_reporters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `second_reporters`
--

LOCK TABLES `second_reporters` WRITE;
/*!40000 ALTER TABLE `second_reporters` DISABLE KEYS */;
/*!40000 ALTER TABLE `second_reporters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selected_resumes`
--

DROP TABLE IF EXISTS `selected_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selected_resumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skillset` text COLLATE utf8_unicode_ci,
  `degree_id` int(11) DEFAULT NULL,
  `ctc` decimal(10,0) DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `offer_letter_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortlist_for_interview` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_selected_resumes_on_degree_id` (`degree_id`),
  KEY `index_selected_resumes_on_vacancy_master_id` (`vacancy_master_id`),
  CONSTRAINT `fk_rails_0ecdcf8918` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_fd0d18111d` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selected_resumes`
--

LOCK TABLES `selected_resumes` WRITE;
/*!40000 ALTER TABLE `selected_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `selected_resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_masters`
--

DROP TABLE IF EXISTS `shift_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_masters`
--

LOCK TABLES `shift_masters` WRITE;
/*!40000 ALTER TABLE `shift_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_rotations`
--

DROP TABLE IF EXISTS `shift_rotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift_rotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_shift_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shift_rotations_on_company_shift_id` (`company_shift_id`),
  KEY `index_shift_rotations_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_31d8adc809` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_b2482f697c` FOREIGN KEY (`company_shift_id`) REFERENCES `company_shifts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_rotations`
--

LOCK TABLES `shift_rotations` WRITE;
/*!40000 ALTER TABLE `shift_rotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift_rotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skillsets`
--

DROP TABLE IF EXISTS `skillsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skillsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill_level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_skillsets_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_02ef74a1de` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsets`
--

LOCK TABLES `skillsets` WRITE;
/*!40000 ALTER TABLE `skillsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `skillsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slabs`
--

DROP TABLE IF EXISTS `slabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` decimal(10,0) DEFAULT NULL,
  `to` decimal(10,0) DEFAULT NULL,
  `texable_amount` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slabs`
--

LOCK TABLES `slabs` WRITE;
/*!40000 ALTER TABLE `slabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `slabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slip_informations`
--

DROP TABLE IF EXISTS `slip_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slip_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salaryslip_id` int(11) DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esic_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pf_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cl` decimal(10,0) DEFAULT NULL,
  `el` decimal(10,0) DEFAULT NULL,
  `c_off` decimal(10,0) DEFAULT NULL,
  `advance` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `account_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_slip_informations_on_salaryslip_id` (`salaryslip_id`),
  KEY `index_slip_informations_on_cost_center_id` (`cost_center_id`),
  KEY `index_slip_informations_on_department_id` (`department_id`),
  KEY `index_slip_informations_on_employee_designation_id` (`employee_designation_id`),
  CONSTRAINT `fk_rails_0009117d0a` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_6001d56ded` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `fk_rails_922655bdb9` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_e46f57a810` FOREIGN KEY (`salaryslip_id`) REFERENCES `salaryslips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slip_informations`
--

LOCK TABLES `slip_informations` WRITE;
/*!40000 ALTER TABLE `slip_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slip_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_member_ships`
--

DROP TABLE IF EXISTS `society_member_ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society_member_ships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_society_member` tinyint(1) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT '0.00',
  `employee_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_society_member_ships_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_b9123e0d59` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_member_ships`
--

LOCK TABLES `society_member_ships` WRITE;
/*!40000 ALTER TABLE `society_member_ships` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_member_ships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_states_on_country_id` (`country_id`),
  CONSTRAINT `fk_rails_40bd891262` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'AN','Union Territory of Andaman and Nicobar Islands','2017-05-11 13:50:58','2017-05-11 13:50:58'),(2,1,'AP','Andhra Pradesh','2017-05-11 13:50:58','2017-05-11 13:50:58'),(3,1,'AR','Arunachal Pradesh','2017-05-11 13:50:58','2017-05-11 13:50:58'),(4,1,'AS','Assam','2017-05-11 13:50:58','2017-05-11 13:50:58'),(5,1,'BR','Bihar','2017-05-11 13:50:58','2017-05-11 13:50:58'),(6,1,'CH','Chandigarh','2017-05-11 13:50:58','2017-05-11 13:50:58'),(7,1,'CT','State of Chhattisgarh','2017-05-11 13:50:58','2017-05-11 13:50:58'),(8,1,'DD','Daman and Diu','2017-05-11 13:50:58','2017-05-11 13:50:58'),(9,1,'DL','National Capital Territory of Delhi','2017-05-11 13:50:58','2017-05-11 13:50:58'),(10,1,'DN','Dadra and Nagar Haveli','2017-05-11 13:50:58','2017-05-11 13:50:58'),(11,1,'GA','Goa','2017-05-11 13:50:58','2017-05-11 13:50:58'),(12,1,'GJ','Gujarat','2017-05-11 13:50:58','2017-05-11 13:50:58'),(13,1,'HP','State of Himachal Pradesh','2017-05-11 13:50:58','2017-05-11 13:50:58'),(14,1,'HR','Haryana','2017-05-11 13:50:59','2017-05-11 13:50:59'),(15,1,'JH','State of Jharkhand','2017-05-11 13:50:59','2017-05-11 13:50:59'),(16,1,'JK','Kashmir','2017-05-11 13:50:59','2017-05-11 13:50:59'),(17,1,'KA','Karnataka','2017-05-11 13:50:59','2017-05-11 13:50:59'),(18,1,'KL','Kerala','2017-05-11 13:50:59','2017-05-11 13:50:59'),(19,1,'LD','Laccadives','2017-05-11 13:50:59','2017-05-11 13:50:59'),(20,1,'MH','Maharashtra','2017-05-11 13:50:59','2017-05-11 13:50:59'),(21,1,'ML','Meghalaya','2017-05-11 13:50:59','2017-05-11 13:50:59'),(22,1,'MN','Manipur','2017-05-11 13:50:59','2017-05-11 13:50:59'),(23,1,'MP','Madhya Pradesh','2017-05-11 13:50:59','2017-05-11 13:50:59'),(24,1,'MZ','Mizoram','2017-05-11 13:50:59','2017-05-11 13:50:59'),(25,1,'NL','Nagaland','2017-05-11 13:50:59','2017-05-11 13:50:59'),(26,1,'OR','Odisha','2017-05-11 13:50:59','2017-05-11 13:50:59'),(27,1,'PB','State of Punjab','2017-05-11 13:50:59','2017-05-11 13:50:59'),(28,1,'PY','Union Territory of Puducherry','2017-05-11 13:50:59','2017-05-11 13:50:59'),(29,1,'RJ','Rajasthan','2017-05-11 13:50:59','2017-05-11 13:50:59'),(30,1,'SK','Sikkim','2017-05-11 13:50:59','2017-05-11 13:50:59'),(31,1,'TG','Telangana','2017-05-11 13:50:59','2017-05-11 13:50:59'),(32,1,'TN','Tamil Nadu','2017-05-11 13:50:59','2017-05-11 13:50:59'),(33,1,'TR','Tripura','2017-05-11 13:50:59','2017-05-11 13:50:59'),(34,1,'UL','Uttarakhand','2017-05-11 13:50:59','2017-05-11 13:50:59'),(35,1,'UP','Uttar Pradesh','2017-05-11 13:51:00','2017-05-11 13:51:00'),(36,1,'WB','West Bengal','2017-05-11 13:51:00','2017-05-11 13:51:00');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texable_amounts`
--

DROP TABLE IF EXISTS `texable_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texable_amounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `yearly` decimal(10,0) DEFAULT NULL,
  `monthly` decimal(10,0) DEFAULT NULL,
  `remaining_amount` decimal(10,0) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_texable_amounts_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_e43576cc8d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texable_amounts`
--

LOCK TABLES `texable_amounts` WRITE;
/*!40000 ALTER TABLE `texable_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `texable_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texable_monthly_deductions`
--

DROP TABLE IF EXISTS `texable_monthly_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texable_monthly_deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salaryslip_id` int(11) DEFAULT NULL,
  `texable_deducted_amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_texable_monthly_deductions_on_employee_id` (`employee_id`),
  KEY `index_texable_monthly_deductions_on_salaryslip_id` (`salaryslip_id`),
  CONSTRAINT `fk_rails_0b8d1e0502` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_47df5f3b2a` FOREIGN KEY (`salaryslip_id`) REFERENCES `salaryslips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texable_monthly_deductions`
--

LOCK TABLES `texable_monthly_deductions` WRITE;
/*!40000 ALTER TABLE `texable_monthly_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `texable_monthly_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainee_requests`
--

DROP TABLE IF EXISTS `trainee_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainee_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `training_plan` tinyint(1) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trainee_requests_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_66e80626aa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainee_requests`
--

LOCK TABLES `trainee_requests` WRITE;
/*!40000 ALTER TABLE `trainee_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainee_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainees`
--

DROP TABLE IF EXISTS `trainees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_plan_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  `is_complete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trainees_on_training_plan_id` (`training_plan_id`),
  KEY `index_trainees_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_3cf21189e5` FOREIGN KEY (`training_plan_id`) REFERENCES `training_plans` (`id`),
  CONSTRAINT `fk_rails_a7c6771f5c` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainees`
--

LOCK TABLES `trainees` WRITE;
/*!40000 ALTER TABLE `trainees` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_approvals`
--

DROP TABLE IF EXISTS `training_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `traininig_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_employee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_approvals_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_e9495112c3` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_approvals`
--

LOCK TABLES `training_approvals` WRITE;
/*!40000 ALTER TABLE `training_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_plans`
--

DROP TABLE IF EXISTS `training_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_date` date DEFAULT NULL,
  `no_of_employee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trainer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `period_id` int(11) DEFAULT NULL,
  `trainer_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_trainer` text COLLATE utf8_unicode_ci,
  `trainer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_plans_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_a90174f6bf` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_plans`
--

LOCK TABLES `training_plans` WRITE;
/*!40000 ALTER TABLE `training_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_records`
--

DROP TABLE IF EXISTS `training_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trainer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_records_on_employee_id` (`employee_id`),
  KEY `index_training_records_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_1b8c9e001f` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_dc1e932421` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_records`
--

LOCK TABLES `training_records` WRITE;
/*!40000 ALTER TABLE `training_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_requests`
--

DROP TABLE IF EXISTS `training_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `training_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `no_of_employee` int(11) DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_requests_on_employee_id` (`employee_id`),
  KEY `index_training_requests_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_5443c76cb5` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_ef0e629309` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_requests`
--

LOCK TABLES `training_requests` WRITE;
/*!40000 ALTER TABLE `training_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_topic_masters`
--

DROP TABLE IF EXISTS `training_topic_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_topic_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_topic_masters`
--

LOCK TABLES `training_topic_masters` WRITE;
/*!40000 ALTER TABLE `training_topic_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_topic_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_topics`
--

DROP TABLE IF EXISTS `training_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_topics`
--

LOCK TABLES `training_topics` WRITE;
/*!40000 ALTER TABLE `training_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_histories`
--

DROP TABLE IF EXISTS `transfer_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_transfer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transfer_histories_on_employee_transfer_id` (`employee_transfer_id`),
  KEY `index_transfer_histories_on_employee_id` (`employee_id`),
  KEY `index_transfer_histories_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_transfer_histories_on_employee_category_id` (`employee_category_id`),
  KEY `index_transfer_histories_on_company_id` (`company_id`),
  KEY `index_transfer_histories_on_company_location_id` (`company_location_id`),
  KEY `index_transfer_histories_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_17bac9f9ec` FOREIGN KEY (`employee_transfer_id`) REFERENCES `employee_transfers` (`id`),
  CONSTRAINT `fk_rails_287f420d1d` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_2d8030b775` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_3719557a62` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_4c70840e16` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_6e8f518b5f` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a8c4109c40` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_histories`
--

LOCK TABLES `transfer_histories` WRITE;
/*!40000 ALTER TABLE `transfer_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_expence_types`
--

DROP TABLE IF EXISTS `travel_expence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_expence_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expence_types`
--

LOCK TABLES `travel_expence_types` WRITE;
/*!40000 ALTER TABLE `travel_expence_types` DISABLE KEYS */;
INSERT INTO `travel_expence_types` VALUES (1,'1.0','Travel Expense',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(2,'2.0','Food Expense',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(3,'3.0','Lodgging Expense',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(4,'4.0','Other Expense',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55');
/*!40000 ALTER TABLE `travel_expence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_expences`
--

DROP TABLE IF EXISTS `travel_expences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_expences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_request_id` int(11) DEFAULT NULL,
  `total_advance_amount` decimal(15,2) DEFAULT '0.00',
  `total_expence_amount` decimal(15,2) DEFAULT '0.00',
  `remaining_amount` decimal(15,2) DEFAULT '0.00',
  `employee_amount` decimal(15,2) DEFAULT '0.00',
  `company_amount` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_expences_on_travel_request_id` (`travel_request_id`),
  CONSTRAINT `fk_rails_1110db1868` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expences`
--

LOCK TABLES `travel_expences` WRITE;
/*!40000 ALTER TABLE `travel_expences` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_expences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_modes`
--

DROP TABLE IF EXISTS `travel_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_modes`
--

LOCK TABLES `travel_modes` WRITE;
/*!40000 ALTER TABLE `travel_modes` DISABLE KEYS */;
INSERT INTO `travel_modes` VALUES (1,'1.0','By Bus',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(2,'2.0','By Train',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(3,'3.0','By Plan',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(4,'4.0','By Ship',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55');
/*!40000 ALTER TABLE `travel_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_options`
--

DROP TABLE IF EXISTS `travel_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discription` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_options`
--

LOCK TABLES `travel_options` WRITE;
/*!40000 ALTER TABLE `travel_options` DISABLE KEYS */;
INSERT INTO `travel_options` VALUES (1,'1.0','Domestic',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(2,'2.0','National',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55'),(3,'3.0','International',NULL,NULL,'2017-05-11 13:50:55','2017-05-11 13:50:55');
/*!40000 ALTER TABLE `travel_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_request_histories`
--

DROP TABLE IF EXISTS `travel_request_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_request_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_date` date DEFAULT NULL,
  `traveling_date` date DEFAULT NULL,
  `tour_purpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_advance` decimal(10,0) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `daily_bill_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `travel_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_request_histories_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_request_histories_on_travel_mode_id` (`travel_mode_id`),
  KEY `index_travel_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_2f199330b2` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_bd36e7cbd9` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_c0ebfca129` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_request_histories`
--

LOCK TABLES `travel_request_histories` WRITE;
/*!40000 ALTER TABLE `travel_request_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_request_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_requests`
--

DROP TABLE IF EXISTS `travel_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `traveling_date` date DEFAULT NULL,
  `tour_purpose` text COLLATE utf8_unicode_ci,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_advance` decimal(15,2) DEFAULT '0.00',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `daily_bill_status` text COLLATE utf8_unicode_ci,
  `expense` decimal(10,0) DEFAULT NULL,
  `to` date DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_requests_on_employee_id` (`employee_id`),
  KEY `index_travel_requests_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_requests_on_travel_mode_id` (`travel_mode_id`),
  CONSTRAINT `fk_rails_50acc33858` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_5b96fe9977` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_985cfe5831` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_requests`
--

LOCK TABLES `travel_requests` WRITE;
/*!40000 ALTER TABLE `travel_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_masters`
--

DROP TABLE IF EXISTS `vacancy_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_position` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `vacancy_post_date` date DEFAULT NULL,
  `budget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `other_organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `vacancy_fullfillment_date` date DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `vacancy_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degree_1_id` int(11) DEFAULT NULL,
  `degree_2_id` int(11) DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_c007c5e793` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_d3ad0c0ad4` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_ed060670f9` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_masters`
--

LOCK TABLES `vacancy_masters` WRITE;
/*!40000 ALTER TABLE `vacancy_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacancy_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_request_histories`
--

DROP TABLE IF EXISTS `vacancy_request_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_request_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `vacancy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_position` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `vacancy_post_date` date DEFAULT NULL,
  `budget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `degree_1_id` int(11) DEFAULT NULL,
  `degree_2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_request_histories_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_vacancy_request_histories_on_department_id` (`department_id`),
  KEY `index_vacancy_request_histories_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_request_histories_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_request_histories_on_degree_id` (`degree_id`),
  KEY `index_vacancy_request_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_0990a86378` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2007d583f0` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_690afaafaf` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`),
  CONSTRAINT `fk_rails_85193e42c6` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_9d011e0876` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_9e78a9dc64` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_a3ee9c0997` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_request_histories`
--

LOCK TABLES `vacancy_request_histories` WRITE;
/*!40000 ALTER TABLE `vacancy_request_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacancy_request_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_details`
--

DROP TABLE IF EXISTS `visitor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_proof` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `purpose` text COLLATE utf8_unicode_ci,
  `visiting_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visitor_details_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_788b73f995` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_details`
--

LOCK TABLES `visitor_details` WRITE;
/*!40000 ALTER TABLE `visitor_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_off_masters`
--

DROP TABLE IF EXISTS `week_off_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_off_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_send` tinyint(1) DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `is_prefix` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_week_off_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_d7d7a5c392` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_off_masters`
--

LOCK TABLES `week_off_masters` WRITE;
/*!40000 ALTER TABLE `week_off_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `week_off_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_offs`
--

DROP TABLE IF EXISTS `week_offs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_offs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weekoff_date_range` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_week_offs_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_offs`
--

LOCK TABLES `week_offs` WRITE;
/*!40000 ALTER TABLE `week_offs` DISABLE KEYS */;
/*!40000 ALTER TABLE `week_offs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekoff_masters`
--

DROP TABLE IF EXISTS `weekoff_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekoff_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekoff_masters`
--

LOCK TABLES `weekoff_masters` WRITE;
/*!40000 ALTER TABLE `weekoff_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `weekoff_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `well_faires`
--

DROP TABLE IF EXISTS `well_faires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `well_faires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `well_faires`
--

LOCK TABLES `well_faires` WRITE;
/*!40000 ALTER TABLE `well_faires` DISABLE KEYS */;
/*!40000 ALTER TABLE `well_faires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workingdays`
--

DROP TABLE IF EXISTS `workingdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workingdays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_in_month` int(11) DEFAULT NULL,
  `present_day` decimal(10,0) DEFAULT NULL,
  `total_leave` decimal(10,0) DEFAULT NULL,
  `holiday_in_month` decimal(10,0) DEFAULT NULL,
  `week_off_day` decimal(10,0) DEFAULT NULL,
  `absent_day` decimal(10,0) DEFAULT NULL,
  `payable_day` decimal(10,0) DEFAULT NULL,
  `lwp_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cl_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `el_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esic_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coff_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `pay_leave` decimal(10,0) DEFAULT NULL,
  `nonpay_leave` decimal(10,2) DEFAULT NULL,
  `calculated_payable_days` decimal(10,0) DEFAULT NULL,
  `ot_hours` decimal(10,0) DEFAULT NULL,
  `od_leave` decimal(10,0) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `full_and_final` tinyint(1) DEFAULT NULL,
  `od_day` decimal(10,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workingdays_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_cbc8a0fe04` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingdays`
--

LOCK TABLES `workingdays` WRITE;
/*!40000 ALTER TABLE `workingdays` DISABLE KEYS */;
/*!40000 ALTER TABLE `workingdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-12 16:04:18
