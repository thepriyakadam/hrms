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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_masters`
--

LOCK TABLES `attribute_masters` WRITE;
/*!40000 ALTER TABLE `attribute_masters` DISABLE KEYS */;
INSERT INTO `attribute_masters` VALUES (1,'01','Business Acumen','Ability to demonstrate an understanding of industry trends, business concepts, opportunities, threats & constraints in the environment in which the organization operates.',1,NULL,'2017-05-15 07:19:52','2017-05-15 07:19:52',0,'',''),(2,'02','Analytical Ability','Ability to make systematic and rational judgments based on relevant information.',1,NULL,'2017-05-15 07:20:26','2017-05-15 07:20:26',0,'',''),(3,'03','Organizing & Planning','Ability to plan a course of action, manage and prioritize activities so as to execute them in a time-bound manner',1,NULL,'2017-05-15 07:20:49','2017-05-15 07:20:49',0,'',''),(4,'04','Communication','Capability of an individual to convey the right information and influence others towards desired action either verbally or by written means',1,NULL,'2017-05-15 07:21:03','2017-05-15 07:21:59',0,'',''),(5,'05','Presentation Skill','Presents prepared information in a clear & organized manner to a variety of audiences using the appropriate presentation tools',1,NULL,'2017-05-15 07:21:23','2017-05-15 07:21:23',0,'',''),(6,'06','Innovation & Creativity','Ability of an individual to provide an original solution by using various tools and techniques and constantly questioning the status quo',1,NULL,'2017-05-15 07:21:40','2017-05-15 07:21:40',0,'','');
/*!40000 ALTER TABLE `attribute_masters` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,13,'Shinning star of the month','AGWO',NULL,40,'2017-05-02 09:48:48','2017-05-02 09:48:48'),(2,10,'Best employee of the year','Chaneel Tech',NULL,36,'2017-05-02 10:27:01','2017-05-02 10:27:01'),(3,25,'Rising star ','Redefine Marcom Pvt Ltd ',NULL,40,'2017-05-02 10:31:55','2017-05-02 10:31:55'),(4,25,'One Year Milestone ','Redefine Marcom Pvt Ltd ',NULL,41,'2017-05-02 10:32:28','2017-05-02 10:32:28'),(5,36,'Best filmmaker and film','University of Delhi',NULL,38,'2017-05-08 06:30:38','2017-05-08 06:30:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,' Allahabad Bank',NULL,NULL,NULL,'2017-04-22 08:07:29','2017-04-22 08:07:29'),(2,' Andhra Bank',NULL,NULL,NULL,'2017-04-22 08:07:36','2017-04-22 08:07:36'),(3,' Bank of India',NULL,NULL,NULL,'2017-04-22 08:07:42','2017-04-22 08:07:42'),(4,' Bank of Baroda',NULL,NULL,NULL,'2017-04-22 08:07:47','2017-04-22 08:07:47'),(5,' Bank of Maharashtra',NULL,NULL,NULL,'2017-04-22 08:07:52','2017-04-22 08:07:52'),(6,' Canara Bank',NULL,NULL,NULL,'2017-04-22 08:07:57','2017-04-22 08:07:57'),(7,' Central Bank of India',NULL,NULL,NULL,'2017-04-22 08:08:02','2017-04-22 08:08:02'),(8,' Corporation Bank',NULL,NULL,NULL,'2017-04-22 08:08:06','2017-04-22 08:08:06'),(9,' Dena Bank',NULL,NULL,NULL,'2017-04-22 08:08:16','2017-04-22 08:08:16'),(10,' Indian Bank',NULL,NULL,NULL,'2017-04-22 08:08:24','2017-04-22 08:08:24'),(11,' Indian Overseas Bank',NULL,NULL,NULL,'2017-04-22 08:09:01','2017-04-22 08:09:01'),(12,' IDBI Bank',NULL,NULL,NULL,'2017-04-22 08:09:06','2017-04-22 08:09:06'),(13,' Oriental Bank of Commerce',NULL,NULL,NULL,'2017-04-22 08:09:10','2017-04-22 08:09:10'),(14,' Punjab & Sindh Bank',NULL,NULL,NULL,'2017-04-22 08:09:15','2017-04-22 08:09:15'),(15,' Punjab National Bank',NULL,NULL,NULL,'2017-04-22 08:09:20','2017-04-22 08:09:20'),(16,' State Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:24','2017-04-22 08:09:24'),(17,' Syndicate Bank',NULL,NULL,NULL,'2017-04-22 08:09:29','2017-04-22 08:09:29'),(18,' UCO Bank',NULL,NULL,NULL,'2017-04-22 08:09:33','2017-04-22 08:09:33'),(19,' Union Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:37','2017-04-22 08:09:37'),(20,' United Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:41','2017-04-22 08:09:41'),(21,' Vijaya Bank',NULL,NULL,NULL,'2017-04-22 08:09:46','2017-04-22 08:09:46'),(22,'HDFC',NULL,NULL,NULL,'2017-05-02 07:41:32','2017-05-02 07:41:32');
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
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'AB+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'B+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'O+',NULL,'2017-05-02 09:10:49','2017-05-02 09:10:49'),(5,'O-',NULL,'2017-05-02 09:10:56','2017-05-02 09:10:56'),(6,'A-',NULL,'2017-05-02 09:11:07','2017-05-02 09:11:07'),(7,'B-',NULL,'2017-05-02 09:11:14','2017-05-02 09:11:14'),(8,'AB-',NULL,'2017-05-02 09:11:27','2017-05-02 09:11:27');
/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
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
  CONSTRAINT `fk_rails_6311d49c43` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_4d62fa2844` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,26,'COPA','1 Year',39,'Computer Operating Programming Assistant Course','2017-05-02 08:48:28','2017-05-02 08:48:28'),(2,44,'Diploma in computer','3months',38,'','2017-05-02 08:58:10','2017-05-02 08:58:10'),(3,45,'Spots','football',31,'','2017-05-02 09:06:23','2017-05-02 09:06:23'),(4,42,'Diploma In International Business','3 Years',38,'','2017-05-02 09:14:18','2017-05-02 09:14:18'),(5,34,'SAP ABAP','60',39,'ERP (Advanced Business Application Programming) ','2017-05-02 09:59:27','2017-05-02 09:59:27'),(6,25,'National Indian Open Championship ','2 Months ',35,'Netball Open Championship ','2017-05-02 10:30:25','2017-05-02 10:30:25'),(7,25,'National Indian School Championship ','2 Months ',36,'Netball Nationals - School Level Senior Championship ','2017-05-02 10:31:11','2017-05-02 10:31:11'),(8,18,'3d Animation & Video Editing','1.5 year',34,'','2017-05-02 10:43:08','2017-05-02 10:43:08'),(9,33,'Multimedia','6 months',37,'Multimedia 6 Months, C Language 3 Months, O Level 1 Year, A level 1 year from National Institute of Electronics & Information Technology ( NIELIT) Delhi. ','2017-05-02 10:46:42','2017-05-02 10:46:42'),(10,8,'Web Designing Diploma','1 ',30,'','2017-05-02 10:49:05','2017-05-02 10:49:05'),(11,8,'Auto Cad','3 month',NULL,'','2017-05-02 10:49:26','2017-05-02 10:49:26'),(12,2,'3d Animation & Video Editing','1.5 year',34,'','2017-05-02 11:31:11','2017-05-02 11:31:11'),(13,12,'PD3D','3',33,'Post Diploma in 3D Animation(Maya Academy of Advanced Cinematics)','2017-05-03 04:16:59','2017-05-03 04:16:59'),(14,39,'Diploma In Financial Accounting','1 Year',40,'Accounts related','2017-05-03 04:42:45','2017-05-03 04:42:45'),(15,36,'Filmmaking & Script Writing','1 year',39,'','2017-05-08 06:29:54','2017-05-08 06:29:54');
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
INSERT INTO `companies` VALUES (1,NULL,'01','COM001','Redefine Marcom Pvt Ltd','Redefine',1,'7896541230','','','','New Delhi',1,9,138,'New Delhi',123456,'','9875463210','www.redefine.com',NULL,'2017-04-20 07:31:18','2017-05-02 12:50:13','redefine_logo.jpg','image/jpeg',25810,'2017-05-02 12:50:13');
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
  CONSTRAINT `fk_rails_6a024a8a15` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_0a365495de` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'01','COMLOC001','Delhi','','','New Delhi',1,9,138,123456,'','2017-04-20 07:35:54','2017-04-20 07:35:54'),(2,1,'02','COMLOC002','Bangalore','','','Bangalore',1,17,321,456321,'','2017-04-20 07:37:06','2017-04-20 07:37:06'),(3,1,'03','COMLOC003','Mumbai','','','Mumbai',1,20,486,987456,'','2017-04-20 07:39:06','2017-04-20 07:39:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_policies`
--

LOCK TABLES `company_policies` WRITE;
/*!40000 ALTER TABLE `company_policies` DISABLE KEYS */;
INSERT INTO `company_policies` VALUES (1,'HR Handbook','2017-01-01',NULL,1,'2017-05-01 11:36:36','2017-05-01 11:36:36','Redefine_-_HR_Manual_2016_-_17_22Aug.pdf','application/pdf',1180678,'2017-05-01 11:36:36','HR Handbook for the reference.');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'1.0','Private Limited ','All companies that are not public companies are defined by law as private. Being a private company is the default position',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'2.0','Limited Liability Partnership',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,NULL,'Sole Proprietorship',NULL,NULL,'2017-04-22 08:11:49','2017-04-22 08:11:49'),(4,NULL,'Partnership',NULL,NULL,'2017-04-22 08:12:04','2017-04-22 08:12:04'),(6,NULL,'Public Limited',NULL,NULL,'2017-04-22 08:12:27','2017-04-22 08:12:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
INSERT INTO `cost_centers` VALUES (1,NULL,'Redefine',NULL,NULL,'2017-05-01 09:17:24','2017-05-01 09:17:24');
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
INSERT INTO `countries` VALUES (1,'IN','India','2017-04-20 07:00:41','2017-04-20 07:00:41');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-04-20 07:31:18','2017-04-20 07:31:18'),(2,'company_location',3,'2017-04-20 07:35:54','2017-04-20 07:39:06'),(3,'department',10,'2017-04-20 09:29:09','2017-05-02 07:07:17'),(4,'employee',50,'2017-04-25 04:09:17','2017-04-25 04:09:18');
/*!40000 ALTER TABLE `custom_auto_increments` ENABLE KEYS */;
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
  CONSTRAINT `fk_rails_44e43dda14` FOREIGN KEY (`travel_expence_type_id`) REFERENCES `travel_expence_types` (`id`),
  CONSTRAINT `fk_rails_141a0d76cd` FOREIGN KEY (`daily_bill_detail_id`) REFERENCES `daily_bill_details` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_streams`
--

LOCK TABLES `degree_streams` WRITE;
/*!40000 ALTER TABLE `degree_streams` DISABLE KEYS */;
INSERT INTO `degree_streams` VALUES (1,NULL,'Pass',NULL,NULL,'2017-05-02 08:44:23','2017-05-02 08:44:23'),(2,NULL,'Hons',NULL,NULL,'2017-05-02 08:44:40','2017-05-02 08:44:40'),(3,NULL,'Commerce',NULL,NULL,'2017-05-02 08:44:48','2017-05-02 08:44:48'),(4,NULL,'Finance',NULL,NULL,'2017-05-02 08:44:56','2017-05-02 08:44:56'),(5,NULL,'Marketing',NULL,NULL,'2017-05-02 08:45:03','2017-05-02 08:45:03'),(6,NULL,'HR',NULL,NULL,'2017-05-02 08:45:08','2017-05-02 08:45:08'),(7,NULL,'General',NULL,NULL,'2017-05-02 08:45:15','2017-05-02 08:45:15'),(8,NULL,'Science',NULL,NULL,'2017-05-02 09:03:53','2017-05-02 09:03:53'),(9,NULL,'Computer',NULL,NULL,'2017-05-02 09:19:55','2017-05-02 09:19:55'),(10,NULL,'Marketing & Sales',NULL,NULL,'2017-05-02 09:32:46','2017-05-02 09:32:57'),(11,NULL,'Psychology',NULL,NULL,'2017-05-02 09:39:37','2017-05-02 09:39:37'),(12,NULL,'IT',NULL,NULL,'2017-05-02 09:51:51','2017-05-02 09:51:51'),(13,NULL,'Finance & Marketing',NULL,NULL,'2017-05-02 10:08:21','2017-05-02 10:08:21'),(14,NULL,'Public Relation',NULL,NULL,'2017-05-02 10:12:37','2017-05-02 10:12:37'),(15,NULL,'Communication',NULL,NULL,'2017-05-02 10:12:45','2017-05-02 10:12:45'),(16,NULL,'Retails ',NULL,NULL,'2017-05-02 10:17:39','2017-05-02 10:17:39'),(17,NULL,'Merchandising ',NULL,NULL,'2017-05-02 10:17:53','2017-05-02 10:17:53'),(18,NULL,'Events and PR',NULL,NULL,'2017-05-02 10:18:09','2017-05-02 10:18:09'),(19,NULL,'Journalism and Advertising ',NULL,NULL,'2017-05-02 10:20:02','2017-05-02 10:20:02'),(20,NULL,'Sociology',NULL,NULL,'2017-05-02 10:38:05','2017-05-02 10:38:05'),(21,NULL,'Arts',NULL,NULL,'2017-05-02 10:42:55','2017-05-02 10:42:55'),(22,NULL,'Physical Science',NULL,NULL,'2017-05-02 10:58:20','2017-05-02 10:58:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_types`
--

LOCK TABLES `degree_types` WRITE;
/*!40000 ALTER TABLE `degree_types` DISABLE KEYS */;
INSERT INTO `degree_types` VALUES (1,'1.0','Under Graduate',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,'2.0','Technical',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,'3.0','Senior Secondary',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,'4.0','Professional',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(5,'5.0','Primary School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(6,'6.0','Post Graduate',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(7,'7.0','Middle School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(8,'8.0','High School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(9,'9.0','Graduate',NULL,1,'2017-04-20 07:00:41','2017-05-03 04:09:42'),(10,'10.0','Diploma',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(11,NULL,'Advance Diploma ',NULL,NULL,'2017-05-02 10:23:38','2017-05-02 10:23:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` VALUES (1,NULL,'BBA',NULL,NULL,'2017-05-02 08:08:32','2017-05-02 08:08:32'),(2,NULL,'Bcom',NULL,NULL,'2017-05-02 08:08:53','2017-05-02 08:08:53'),(3,NULL,'B.A',NULL,NULL,'2017-05-02 08:08:58','2017-05-02 08:08:58'),(4,NULL,'BBM',NULL,NULL,'2017-05-02 08:10:07','2017-05-02 08:10:07'),(5,NULL,'PGDM',NULL,NULL,'2017-05-02 08:11:25','2017-05-02 08:11:25'),(6,NULL,'Mass Communication',NULL,NULL,'2017-05-02 08:14:34','2017-05-02 08:14:34'),(7,NULL,'12th',NULL,NULL,'2017-05-02 08:59:31','2017-05-02 08:59:31'),(8,NULL,'BTech',NULL,NULL,'2017-05-02 09:00:18','2017-05-02 09:00:18'),(9,NULL,'BCA',NULL,NULL,'2017-05-02 09:19:31','2017-05-02 09:19:31'),(10,NULL,'MCA',NULL,NULL,'2017-05-02 09:19:34','2017-05-02 09:19:34'),(11,NULL,'PGDITM',NULL,NULL,'2017-05-02 09:51:42','2017-05-02 09:51:42'),(12,NULL,'Masters',NULL,NULL,'2017-05-02 10:13:17','2017-05-02 10:13:17'),(13,NULL,'MBA',NULL,NULL,'2017-05-02 10:16:48','2017-05-02 10:16:48'),(14,NULL,'Events and PR ',NULL,NULL,'2017-05-02 10:20:38','2017-05-02 10:20:38'),(15,NULL,'Science',NULL,NULL,'2017-05-02 11:00:44','2017-05-02 11:00:44'),(16,NULL,'PGDM in Events',NULL,NULL,'2017-05-03 04:11:29','2017-05-03 04:11:29'),(17,NULL,'10th Pass',NULL,NULL,'2017-05-03 05:24:44','2017-05-03 05:24:44');
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
INSERT INTO `department_types` VALUES (1,'1.0','Executive','Executive',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'2.0','Operation','Operation',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'3.0','Support','Support',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'01','DEPT001','','Director',1,'','2017-04-20 09:29:09','2017-04-24 05:13:16',1),(2,1,'02','DEPT002','CND','CND',1,'','2017-04-21 09:05:47','2017-04-24 11:17:20',NULL),(3,1,'03','DEPT003','','CS&BD',1,'','2017-04-21 09:06:13','2017-04-21 09:06:13',NULL),(4,1,'04','DEPT004','','DDC',1,'','2017-04-21 09:07:19','2017-04-21 09:07:19',NULL),(5,1,'05','DEPT005','','OPS',1,'','2017-04-21 09:07:47','2017-04-21 09:07:47',NULL),(6,1,'06','DEPT006','','HRAF',1,'','2017-04-21 09:08:27','2017-04-21 09:08:27',NULL),(7,2,'07','DEPT007','','OPS',1,'','2017-04-21 09:09:40','2017-04-21 09:09:40',NULL),(8,3,'08','DEPT008','','OPS',1,'','2017-04-21 09:10:23','2017-04-21 09:10:23',NULL),(9,1,'09','DEPT009','','Database',1,'','2017-05-02 07:06:19','2017-05-02 07:06:19',NULL),(10,1,'10','DEPT010','','Lead Gen',1,'','2017-05-02 07:07:17','2017-05-02 07:07:17',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,1,NULL,'Port Blair','2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,1,NULL,'Sawi','2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,2,NULL,'Akividu','2017-04-20 07:00:41','2017-04-20 07:00:41'),(5,2,NULL,'Amalapuram','2017-04-20 07:00:41','2017-04-20 07:00:41'),(6,2,NULL,'Anantapur','2017-04-20 07:00:41','2017-04-20 07:00:41'),(7,2,NULL,'Andra','2017-04-20 07:00:41','2017-04-20 07:00:41'),(8,2,NULL,'Avanigadda','2017-04-20 07:00:41','2017-04-20 07:00:41'),(9,2,NULL,'Bapatla','2017-04-20 07:00:41','2017-04-20 07:00:41'),(10,2,NULL,'Bhimavaram','2017-04-20 07:00:41','2017-04-20 07:00:41'),(11,2,NULL,'Bobbili','2017-04-20 07:00:41','2017-04-20 07:00:41'),(12,2,NULL,'Chirala','2017-04-20 07:00:41','2017-04-20 07:00:41'),(13,2,NULL,'Chittoor','2017-04-20 07:00:41','2017-04-20 07:00:41'),(14,2,NULL,'Cumbum','2017-04-20 07:00:42','2017-04-20 07:00:42'),(15,2,NULL,'Darsi','2017-04-20 07:00:42','2017-04-20 07:00:42'),(16,2,NULL,'Dhone','2017-04-20 07:00:42','2017-04-20 07:00:42'),(17,2,NULL,'Eluru','2017-04-20 07:00:42','2017-04-20 07:00:42'),(18,2,NULL,'Gampalagudem','2017-04-20 07:00:42','2017-04-20 07:00:42'),(19,2,NULL,'Gannavaram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(20,2,NULL,'Gorantla','2017-04-20 07:00:42','2017-04-20 07:00:42'),(21,2,NULL,'Gudivada','2017-04-20 07:00:42','2017-04-20 07:00:42'),(22,2,NULL,'Guntur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(23,2,NULL,'Kadapa','2017-04-20 07:00:42','2017-04-20 07:00:42'),(24,2,NULL,'Kakinada','2017-04-20 07:00:42','2017-04-20 07:00:42'),(25,2,NULL,'Kanigiri','2017-04-20 07:00:42','2017-04-20 07:00:42'),(26,2,NULL,'Kavali','2017-04-20 07:00:42','2017-04-20 07:00:42'),(27,2,NULL,'Kovvur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(28,2,NULL,'Kuppam','2017-04-20 07:00:42','2017-04-20 07:00:42'),(29,2,NULL,'Kurnool','2017-04-20 07:00:42','2017-04-20 07:00:42'),(30,2,NULL,'Machilipatnam','2017-04-20 07:00:42','2017-04-20 07:00:42'),(31,2,NULL,'Madanapalle','2017-04-20 07:00:42','2017-04-20 07:00:42'),(32,2,NULL,'Mahal','2017-04-20 07:00:42','2017-04-20 07:00:42'),(33,2,NULL,'Mandapeta','2017-04-20 07:00:42','2017-04-20 07:00:42'),(34,2,NULL,'Mangalagiri','2017-04-20 07:00:42','2017-04-20 07:00:42'),(35,2,NULL,'Markapur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(36,2,NULL,'Medarametla','2017-04-20 07:00:42','2017-04-20 07:00:42'),(37,2,NULL,'Muddanuru','2017-04-20 07:00:42','2017-04-20 07:00:42'),(38,2,NULL,'Nagari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(39,2,NULL,'Nandigama','2017-04-20 07:00:42','2017-04-20 07:00:42'),(40,2,NULL,'Nandyal','2017-04-20 07:00:42','2017-04-20 07:00:42'),(41,2,NULL,'Narasaraopet','2017-04-20 07:00:42','2017-04-20 07:00:42'),(42,2,NULL,'Nellore','2017-04-20 07:00:42','2017-04-20 07:00:42'),(43,2,NULL,'Nuzvid','2017-04-20 07:00:42','2017-04-20 07:00:42'),(44,2,NULL,'Ongole','2017-04-20 07:00:42','2017-04-20 07:00:42'),(45,2,NULL,'Pakala','2017-04-20 07:00:42','2017-04-20 07:00:42'),(46,2,NULL,'Peddapuram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(47,2,NULL,'Piduguralla','2017-04-20 07:00:42','2017-04-20 07:00:42'),(48,2,NULL,'Pileru','2017-04-20 07:00:42','2017-04-20 07:00:42'),(49,2,NULL,'Pithapuram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(50,2,NULL,'Proddatur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(51,2,NULL,'Puttur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(52,2,NULL,'Rajahmundry','2017-04-20 07:00:42','2017-04-20 07:00:42'),(53,2,NULL,'Ramapuram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(54,2,NULL,'Ramavaram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(55,2,NULL,'Singarayakonda','2017-04-20 07:00:42','2017-04-20 07:00:42'),(56,2,NULL,'Srikakulam','2017-04-20 07:00:42','2017-04-20 07:00:42'),(57,2,NULL,'Tadepallegudem','2017-04-20 07:00:42','2017-04-20 07:00:42'),(58,2,NULL,'Tanuku','2017-04-20 07:00:42','2017-04-20 07:00:42'),(59,2,NULL,'Thenali','2017-04-20 07:00:42','2017-04-20 07:00:42'),(60,2,NULL,'Tirumala','2017-04-20 07:00:42','2017-04-20 07:00:42'),(61,2,NULL,'Tirumala - Tirupati','2017-04-20 07:00:42','2017-04-20 07:00:42'),(62,2,NULL,'Vijayawada','2017-04-20 07:00:42','2017-04-20 07:00:42'),(63,2,NULL,'Vinukonda','2017-04-20 07:00:42','2017-04-20 07:00:42'),(64,2,NULL,'Visakhapatnam','2017-04-20 07:00:42','2017-04-20 07:00:42'),(65,2,NULL,'Vizianagaram','2017-04-20 07:00:42','2017-04-20 07:00:42'),(66,2,NULL,'Yanam','2017-04-20 07:00:42','2017-04-20 07:00:42'),(67,3,NULL,'Hong','2017-04-20 07:00:42','2017-04-20 07:00:42'),(68,3,NULL,'Itanagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(69,4,NULL,'Arunachal','2017-04-20 07:00:42','2017-04-20 07:00:42'),(70,4,NULL,'Barpeta','2017-04-20 07:00:42','2017-04-20 07:00:42'),(71,4,NULL,'Bhandari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(72,4,NULL,'Dhubri','2017-04-20 07:00:42','2017-04-20 07:00:42'),(73,4,NULL,'Dibrugarh','2017-04-20 07:00:42','2017-04-20 07:00:42'),(74,4,NULL,'Golaghat','2017-04-20 07:00:42','2017-04-20 07:00:42'),(75,4,NULL,'Goshaingaon','2017-04-20 07:00:42','2017-04-20 07:00:42'),(76,4,NULL,'Guwahati','2017-04-20 07:00:42','2017-04-20 07:00:42'),(77,4,NULL,'Jorhat','2017-04-20 07:00:42','2017-04-20 07:00:42'),(78,4,NULL,'Karimganj','2017-04-20 07:00:42','2017-04-20 07:00:42'),(79,4,NULL,'Kokrajhar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(80,4,NULL,'Lala','2017-04-20 07:00:42','2017-04-20 07:00:42'),(81,4,NULL,'Nalbari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(82,4,NULL,'Namrup','2017-04-20 07:00:42','2017-04-20 07:00:42'),(83,4,NULL,'Nazira','2017-04-20 07:00:42','2017-04-20 07:00:42'),(84,4,NULL,'North Lakhimpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(85,4,NULL,'Powai','2017-04-20 07:00:42','2017-04-20 07:00:42'),(86,4,NULL,'Sibsagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(87,4,NULL,'Silchar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(88,4,NULL,'Tezpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(89,4,NULL,'Tinsukia','2017-04-20 07:00:42','2017-04-20 07:00:42'),(90,4,NULL,'Ulubari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(91,5,NULL,'Banka','2017-04-20 07:00:42','2017-04-20 07:00:42'),(92,5,NULL,'Begusarai','2017-04-20 07:00:42','2017-04-20 07:00:42'),(93,5,NULL,'Bhagalpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(94,5,NULL,'Bhawanipur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(95,5,NULL,'Bihar Sharif','2017-04-20 07:00:42','2017-04-20 07:00:42'),(96,5,NULL,'Chandan','2017-04-20 07:00:42','2017-04-20 07:00:42'),(97,5,NULL,'Darbhanga','2017-04-20 07:00:42','2017-04-20 07:00:42'),(98,5,NULL,'Dhaka','2017-04-20 07:00:42','2017-04-20 07:00:42'),(99,5,NULL,'Gaya','2017-04-20 07:00:42','2017-04-20 07:00:42'),(100,5,NULL,'Jaynagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(101,5,NULL,'Jha Jha','2017-04-20 07:00:42','2017-04-20 07:00:42'),(102,5,NULL,'Kamat','2017-04-20 07:00:42','2017-04-20 07:00:42'),(103,5,NULL,'Motihari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(104,5,NULL,'Munger','2017-04-20 07:00:42','2017-04-20 07:00:42'),(105,5,NULL,'Muzaffarpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(106,5,NULL,'Patna','2017-04-20 07:00:42','2017-04-20 07:00:42'),(107,5,NULL,'Purnea','2017-04-20 07:00:42','2017-04-20 07:00:42'),(108,5,NULL,'Pusa','2017-04-20 07:00:42','2017-04-20 07:00:42'),(109,5,NULL,'Raxaul','2017-04-20 07:00:42','2017-04-20 07:00:42'),(110,5,NULL,'Sakri','2017-04-20 07:00:42','2017-04-20 07:00:42'),(111,5,NULL,'Samastipur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(112,6,NULL,'Chandigarh','2017-04-20 07:00:42','2017-04-20 07:00:42'),(113,7,NULL,'Ambikapur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(114,7,NULL,'Bemetara','2017-04-20 07:00:42','2017-04-20 07:00:42'),(115,7,NULL,'Bhatapara','2017-04-20 07:00:42','2017-04-20 07:00:42'),(116,7,NULL,'Bhilai','2017-04-20 07:00:42','2017-04-20 07:00:42'),(117,7,NULL,'Bilaspur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(118,7,NULL,'Champa','2017-04-20 07:00:42','2017-04-20 07:00:42'),(119,7,NULL,'Dhamtari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(120,7,NULL,'Durg','2017-04-20 07:00:42','2017-04-20 07:00:42'),(121,7,NULL,'Jagdalpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(122,7,NULL,'Janjgir','2017-04-20 07:00:42','2017-04-20 07:00:42'),(123,7,NULL,'Koni','2017-04-20 07:00:42','2017-04-20 07:00:42'),(124,7,NULL,'Korba','2017-04-20 07:00:42','2017-04-20 07:00:42'),(125,7,NULL,'Kumhari','2017-04-20 07:00:42','2017-04-20 07:00:42'),(126,7,NULL,'Lanka','2017-04-20 07:00:42','2017-04-20 07:00:42'),(127,7,NULL,'Mohala','2017-04-20 07:00:42','2017-04-20 07:00:42'),(128,7,NULL,'Raigarh','2017-04-20 07:00:42','2017-04-20 07:00:42'),(129,7,NULL,'Raipur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(130,7,NULL,'Sukma','2017-04-20 07:00:42','2017-04-20 07:00:42'),(131,8,NULL,'Daman','2017-04-20 07:00:42','2017-04-20 07:00:42'),(132,9,NULL,'Alipur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(133,9,NULL,'Bawana','2017-04-20 07:00:42','2017-04-20 07:00:42'),(134,9,NULL,'Connaught Place','2017-04-20 07:00:42','2017-04-20 07:00:42'),(135,9,NULL,'Delhi','2017-04-20 07:00:42','2017-04-20 07:00:42'),(136,9,NULL,'Kalkaji Devi','2017-04-20 07:00:42','2017-04-20 07:00:42'),(137,9,NULL,'Narela','2017-04-20 07:00:42','2017-04-20 07:00:42'),(138,9,NULL,'New Delhi','2017-04-20 07:00:42','2017-04-20 07:00:42'),(139,9,NULL,'Shahdara','2017-04-20 07:00:42','2017-04-20 07:00:42'),(140,10,NULL,'Amal','2017-04-20 07:00:42','2017-04-20 07:00:42'),(141,10,NULL,'Silvassa','2017-04-20 07:00:42','2017-04-20 07:00:42'),(142,11,NULL,'Aldona','2017-04-20 07:00:42','2017-04-20 07:00:42'),(143,11,NULL,'Arpora','2017-04-20 07:00:42','2017-04-20 07:00:42'),(144,11,NULL,'Assagao','2017-04-20 07:00:42','2017-04-20 07:00:42'),(145,11,NULL,'Bambolim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(146,11,NULL,'Betalbatim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(147,11,NULL,'Betim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(148,11,NULL,'Calangute','2017-04-20 07:00:42','2017-04-20 07:00:42'),(149,11,NULL,'Candolim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(150,11,NULL,'Caranzalem','2017-04-20 07:00:42','2017-04-20 07:00:42'),(151,11,NULL,'Chicalim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(152,11,NULL,'Cuncolim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(153,11,NULL,'Curchorem','2017-04-20 07:00:42','2017-04-20 07:00:42'),(154,11,NULL,'Dicholi','2017-04-20 07:00:42','2017-04-20 07:00:42'),(155,11,NULL,'Dona Paula','2017-04-20 07:00:42','2017-04-20 07:00:42'),(156,11,NULL,'Goa','2017-04-20 07:00:42','2017-04-20 07:00:42'),(157,11,NULL,'Madgaon','2017-04-20 07:00:42','2017-04-20 07:00:42'),(158,11,NULL,'Marmagao','2017-04-20 07:00:42','2017-04-20 07:00:42'),(159,11,NULL,'Navelim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(160,11,NULL,'Panjim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(161,11,NULL,'Parra','2017-04-20 07:00:42','2017-04-20 07:00:42'),(162,11,NULL,'Ponda','2017-04-20 07:00:42','2017-04-20 07:00:42'),(163,11,NULL,'Quepem','2017-04-20 07:00:42','2017-04-20 07:00:42'),(164,11,NULL,'Saligao','2017-04-20 07:00:42','2017-04-20 07:00:42'),(165,11,NULL,'Sanquelim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(166,11,NULL,'Solim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(167,11,NULL,'Vainguinim','2017-04-20 07:00:42','2017-04-20 07:00:42'),(168,11,NULL,'Vasco','2017-04-20 07:00:42','2017-04-20 07:00:42'),(169,11,NULL,'Verna','2017-04-20 07:00:42','2017-04-20 07:00:42'),(170,12,NULL,'Ahmedabad','2017-04-20 07:00:42','2017-04-20 07:00:42'),(171,12,NULL,'Amreli','2017-04-20 07:00:42','2017-04-20 07:00:42'),(172,12,NULL,'Amroli','2017-04-20 07:00:42','2017-04-20 07:00:42'),(173,12,NULL,'Anand','2017-04-20 07:00:42','2017-04-20 07:00:42'),(174,12,NULL,'Ankleshwar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(175,12,NULL,'Antapur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(176,12,NULL,'Bardoli','2017-04-20 07:00:42','2017-04-20 07:00:42'),(177,12,NULL,'Basu','2017-04-20 07:00:42','2017-04-20 07:00:42'),(178,12,NULL,'Bhadath','2017-04-20 07:00:42','2017-04-20 07:00:42'),(179,12,NULL,'Bharuch','2017-04-20 07:00:42','2017-04-20 07:00:42'),(180,12,NULL,'Bhavnagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(181,12,NULL,'Bhuj','2017-04-20 07:00:42','2017-04-20 07:00:42'),(182,12,NULL,'Bilimora','2017-04-20 07:00:42','2017-04-20 07:00:42'),(183,12,NULL,'Chhota Udepur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(184,12,NULL,'Dahod','2017-04-20 07:00:42','2017-04-20 07:00:42'),(185,12,NULL,'Dewan','2017-04-20 07:00:42','2017-04-20 07:00:42'),(186,12,NULL,'Dhansura','2017-04-20 07:00:42','2017-04-20 07:00:42'),(187,12,NULL,'Dhrol','2017-04-20 07:00:42','2017-04-20 07:00:42'),(188,12,NULL,'Dwarka','2017-04-20 07:00:42','2017-04-20 07:00:42'),(189,12,NULL,'Gandhidham','2017-04-20 07:00:42','2017-04-20 07:00:42'),(190,12,NULL,'Gandhinagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(191,12,NULL,'Ghana','2017-04-20 07:00:42','2017-04-20 07:00:42'),(192,12,NULL,'Godhra','2017-04-20 07:00:42','2017-04-20 07:00:42'),(193,12,NULL,'Himatnagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(194,12,NULL,'Jalalpur','2017-04-20 07:00:42','2017-04-20 07:00:42'),(195,12,NULL,'Jamnagar','2017-04-20 07:00:42','2017-04-20 07:00:42'),(196,12,NULL,'Junagadh','2017-04-20 07:00:42','2017-04-20 07:00:42'),(197,12,NULL,'Kalol','2017-04-20 07:00:42','2017-04-20 07:00:42'),(198,12,NULL,'Karamsad','2017-04-20 07:00:42','2017-04-20 07:00:42'),(199,12,NULL,'Keshod','2017-04-20 07:00:42','2017-04-20 07:00:42'),(200,12,NULL,'Khambhat','2017-04-20 07:00:42','2017-04-20 07:00:42'),(201,12,NULL,'Kheda','2017-04-20 07:00:43','2017-04-20 07:00:43'),(202,12,NULL,'Khergam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(203,12,NULL,'Kosamba','2017-04-20 07:00:43','2017-04-20 07:00:43'),(204,12,NULL,'Mahesana','2017-04-20 07:00:43','2017-04-20 07:00:43'),(205,12,NULL,'Malpur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(206,12,NULL,'Mandvi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(207,12,NULL,'Matar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(208,12,NULL,'Mithapur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(209,12,NULL,'Modasa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(210,12,NULL,'Morvi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(211,12,NULL,'Mundra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(212,12,NULL,'Nadiad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(213,12,NULL,'Nagwa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(214,12,NULL,'Navsari','2017-04-20 07:00:43','2017-04-20 07:00:43'),(215,12,NULL,'Patan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(216,12,NULL,'Petlad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(217,12,NULL,'Porbandar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(218,12,NULL,'Rajkot','2017-04-20 07:00:43','2017-04-20 07:00:43'),(219,12,NULL,'Rander','2017-04-20 07:00:43','2017-04-20 07:00:43'),(220,12,NULL,'Rawal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(221,12,NULL,'Sachin','2017-04-20 07:00:43','2017-04-20 07:00:43'),(222,12,NULL,'Sami','2017-04-20 07:00:43','2017-04-20 07:00:43'),(223,12,NULL,'Sanand','2017-04-20 07:00:43','2017-04-20 07:00:43'),(224,12,NULL,'Somnath','2017-04-20 07:00:43','2017-04-20 07:00:43'),(225,12,NULL,'Surendranagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(226,12,NULL,'Thasra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(227,12,NULL,'Vadodara','2017-04-20 07:00:43','2017-04-20 07:00:43'),(228,12,NULL,'Vadodra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(229,12,NULL,'Valsad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(230,12,NULL,'Vapi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(231,12,NULL,'Vijapur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(232,12,NULL,'Visnagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(233,13,NULL,'Bhawan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(234,13,NULL,'Bilaspur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(235,13,NULL,'Chamba','2017-04-20 07:00:43','2017-04-20 07:00:43'),(236,13,NULL,'Dharamsala','2017-04-20 07:00:43','2017-04-20 07:00:43'),(237,13,NULL,'Dharmpur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(238,13,NULL,'Hamirpur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(239,13,NULL,'Hari','2017-04-20 07:00:43','2017-04-20 07:00:43'),(240,13,NULL,'Kalka','2017-04-20 07:00:43','2017-04-20 07:00:43'),(241,13,NULL,'Kangra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(242,13,NULL,'Kumar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(243,13,NULL,'Manali','2017-04-20 07:00:43','2017-04-20 07:00:43'),(244,13,NULL,'Mandi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(245,13,NULL,'Mani','2017-04-20 07:00:43','2017-04-20 07:00:43'),(246,13,NULL,'Mashobra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(247,13,NULL,'Nalagarh','2017-04-20 07:00:43','2017-04-20 07:00:43'),(248,13,NULL,'Nehra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(249,13,NULL,'Nurpur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(250,13,NULL,'Palampur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(251,13,NULL,'Paonta Sahib','2017-04-20 07:00:43','2017-04-20 07:00:43'),(252,13,NULL,'Shimla','2017-04-20 07:00:43','2017-04-20 07:00:43'),(253,13,NULL,'Solan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(254,14,NULL,'Ambala','2017-04-20 07:00:43','2017-04-20 07:00:43'),(255,14,NULL,'Aurangabad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(256,14,NULL,'Bahadurgarh','2017-04-20 07:00:43','2017-04-20 07:00:43'),(257,14,NULL,'Ballabgarh','2017-04-20 07:00:43','2017-04-20 07:00:43'),(258,14,NULL,'Bhiwani','2017-04-20 07:00:43','2017-04-20 07:00:43'),(259,14,NULL,'Budha','2017-04-20 07:00:43','2017-04-20 07:00:43'),(260,14,NULL,'Chhachhrauli','2017-04-20 07:00:43','2017-04-20 07:00:43'),(261,14,NULL,'Faridabad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(262,14,NULL,'Fatehabad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(263,14,NULL,'Ganga','2017-04-20 07:00:43','2017-04-20 07:00:43'),(264,14,NULL,'Gohana','2017-04-20 07:00:43','2017-04-20 07:00:43'),(265,14,NULL,'Gurgaon','2017-04-20 07:00:43','2017-04-20 07:00:43'),(266,14,NULL,'Hansi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(267,14,NULL,'Haryana','2017-04-20 07:00:43','2017-04-20 07:00:43'),(268,14,NULL,'Hisar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(269,14,NULL,'Indraprast','2017-04-20 07:00:43','2017-04-20 07:00:43'),(270,14,NULL,'Jhajjar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(271,14,NULL,'Jind','2017-04-20 07:00:43','2017-04-20 07:00:43'),(272,14,NULL,'Kaithal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(273,14,NULL,'Kalra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(274,14,NULL,'Karnal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(275,14,NULL,'Kaul','2017-04-20 07:00:43','2017-04-20 07:00:43'),(276,14,NULL,'Kotian','2017-04-20 07:00:43','2017-04-20 07:00:43'),(277,14,NULL,'Ladwa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(278,14,NULL,'Narnaul','2017-04-20 07:00:43','2017-04-20 07:00:43'),(279,14,NULL,'Nilokheri','2017-04-20 07:00:43','2017-04-20 07:00:43'),(280,14,NULL,'Odhan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(281,14,NULL,'Palwal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(282,14,NULL,'Panipat','2017-04-20 07:00:43','2017-04-20 07:00:43'),(283,14,NULL,'Pehowa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(284,14,NULL,'Rewari','2017-04-20 07:00:43','2017-04-20 07:00:43'),(285,14,NULL,'Rohtak','2017-04-20 07:00:43','2017-04-20 07:00:43'),(286,14,NULL,'Saha','2017-04-20 07:00:43','2017-04-20 07:00:43'),(287,14,NULL,'Shahabad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(288,14,NULL,'Sirsa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(289,14,NULL,'Sodhi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(290,14,NULL,'Sonipat','2017-04-20 07:00:43','2017-04-20 07:00:43'),(291,14,NULL,'Tohana','2017-04-20 07:00:43','2017-04-20 07:00:43'),(292,14,NULL,'Yamunanagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(293,15,NULL,'Bokaro','2017-04-20 07:00:43','2017-04-20 07:00:43'),(294,15,NULL,'Dhanbad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(295,15,NULL,'Dumka','2017-04-20 07:00:43','2017-04-20 07:00:43'),(296,15,NULL,'Hazaribagh','2017-04-20 07:00:43','2017-04-20 07:00:43'),(297,15,NULL,'Jamshedpur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(298,15,NULL,'Mahulia','2017-04-20 07:00:43','2017-04-20 07:00:43'),(299,15,NULL,'Ramgarh','2017-04-20 07:00:43','2017-04-20 07:00:43'),(300,15,NULL,'Ranchi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(301,16,NULL,'Anantnag','2017-04-20 07:00:43','2017-04-20 07:00:43'),(302,16,NULL,'Arch','2017-04-20 07:00:43','2017-04-20 07:00:43'),(303,16,NULL,'Bala','2017-04-20 07:00:43','2017-04-20 07:00:43'),(304,16,NULL,'Bawan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(305,16,NULL,'Gold','2017-04-20 07:00:43','2017-04-20 07:00:43'),(306,16,NULL,'Jammu','2017-04-20 07:00:43','2017-04-20 07:00:43'),(307,16,NULL,'Kargil','2017-04-20 07:00:43','2017-04-20 07:00:43'),(308,16,NULL,'Kathua','2017-04-20 07:00:43','2017-04-20 07:00:43'),(309,16,NULL,'Katra','2017-04-20 07:00:43','2017-04-20 07:00:43'),(310,16,NULL,'Kundan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(311,16,NULL,'Markal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(312,16,NULL,'Nila','2017-04-20 07:00:43','2017-04-20 07:00:43'),(313,16,NULL,'Pahalgam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(314,16,NULL,'Patel','2017-04-20 07:00:43','2017-04-20 07:00:43'),(315,16,NULL,'Raju','2017-04-20 07:00:43','2017-04-20 07:00:43'),(316,16,NULL,'Ranjan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(317,16,NULL,'Ring','2017-04-20 07:00:43','2017-04-20 07:00:43'),(318,16,NULL,'Srinagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(319,16,NULL,'Suman','2017-04-20 07:00:43','2017-04-20 07:00:43'),(320,17,NULL,'Bagalkot','2017-04-20 07:00:43','2017-04-20 07:00:43'),(321,17,NULL,'Bangalore','2017-04-20 07:00:43','2017-04-20 07:00:43'),(322,17,NULL,'Belgaum','2017-04-20 07:00:43','2017-04-20 07:00:43'),(323,17,NULL,'Bellare','2017-04-20 07:00:43','2017-04-20 07:00:43'),(324,17,NULL,'Bellary','2017-04-20 07:00:43','2017-04-20 07:00:43'),(325,17,NULL,'Bhadravati','2017-04-20 07:00:43','2017-04-20 07:00:43'),(326,17,NULL,'Bhatkal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(327,17,NULL,'Bidar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(328,17,NULL,'Bijapur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(329,17,NULL,'Channapatna','2017-04-20 07:00:43','2017-04-20 07:00:43'),(330,17,NULL,'Chikmagalūr','2017-04-20 07:00:43','2017-04-20 07:00:43'),(331,17,NULL,'Chikodi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(332,17,NULL,'Chintamani','2017-04-20 07:00:43','2017-04-20 07:00:43'),(333,17,NULL,'Chitradurga','2017-04-20 07:00:43','2017-04-20 07:00:43'),(334,17,NULL,'Davangere','2017-04-20 07:00:43','2017-04-20 07:00:43'),(335,17,NULL,'Dharwad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(336,17,NULL,'Gadag','2017-04-20 07:00:43','2017-04-20 07:00:43'),(337,17,NULL,'Gulbarga','2017-04-20 07:00:43','2017-04-20 07:00:43'),(338,17,NULL,'Hadadi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(339,17,NULL,'Hassan','2017-04-20 07:00:43','2017-04-20 07:00:43'),(340,17,NULL,'Haveri','2017-04-20 07:00:43','2017-04-20 07:00:43'),(341,17,NULL,'Hira','2017-04-20 07:00:43','2017-04-20 07:00:43'),(342,17,NULL,'Hiriyur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(343,17,NULL,'Honavar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(344,17,NULL,'Hospet','2017-04-20 07:00:43','2017-04-20 07:00:43'),(345,17,NULL,'Hubli','2017-04-20 07:00:43','2017-04-20 07:00:43'),(346,17,NULL,'Karwar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(347,17,NULL,'Kolar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(348,17,NULL,'Kollegal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(349,17,NULL,'Koppal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(350,17,NULL,'Kushalnagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(351,17,NULL,'Madikeri','2017-04-20 07:00:43','2017-04-20 07:00:43'),(352,17,NULL,'Mandya','2017-04-20 07:00:43','2017-04-20 07:00:43'),(353,17,NULL,'Mangalore','2017-04-20 07:00:43','2017-04-20 07:00:43'),(354,17,NULL,'Manipala','2017-04-20 07:00:43','2017-04-20 07:00:43'),(355,17,NULL,'Mundgod','2017-04-20 07:00:43','2017-04-20 07:00:43'),(356,17,NULL,'Mysore','2017-04-20 07:00:43','2017-04-20 07:00:43'),(357,17,NULL,'Nandi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(358,17,NULL,'Puttur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(359,17,NULL,'Raichur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(360,17,NULL,'Ramanagaram','2017-04-20 07:00:43','2017-04-20 07:00:43'),(361,17,NULL,'Sagar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(362,17,NULL,'Sandur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(363,17,NULL,'Sangam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(364,17,NULL,'Shanti Grama','2017-04-20 07:00:43','2017-04-20 07:00:43'),(365,17,NULL,'Shimoga','2017-04-20 07:00:43','2017-04-20 07:00:43'),(366,17,NULL,'Sirsi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(367,17,NULL,'Siruguppa','2017-04-20 07:00:43','2017-04-20 07:00:43'),(368,17,NULL,'Someshwar','2017-04-20 07:00:43','2017-04-20 07:00:43'),(369,17,NULL,'Tiptur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(370,17,NULL,'Tumkūr','2017-04-20 07:00:43','2017-04-20 07:00:43'),(371,17,NULL,'Udupi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(372,17,NULL,'Yadgir','2017-04-20 07:00:43','2017-04-20 07:00:43'),(373,18,NULL,'Alanallur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(374,18,NULL,'Alappuzha','2017-04-20 07:00:43','2017-04-20 07:00:43'),(375,18,NULL,'Aluva','2017-04-20 07:00:43','2017-04-20 07:00:43'),(376,18,NULL,'Anchal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(377,18,NULL,'Angadipuram','2017-04-20 07:00:43','2017-04-20 07:00:43'),(378,18,NULL,'Aranmula','2017-04-20 07:00:43','2017-04-20 07:00:43'),(379,18,NULL,'Attingal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(380,18,NULL,'Changanacheri','2017-04-20 07:00:43','2017-04-20 07:00:43'),(381,18,NULL,'Chengannur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(382,18,NULL,'Chittur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(383,18,NULL,'Edavanna','2017-04-20 07:00:43','2017-04-20 07:00:43'),(384,18,NULL,'Ernakulam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(385,18,NULL,'Guruvayur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(386,18,NULL,'Idukki','2017-04-20 07:00:43','2017-04-20 07:00:43'),(387,18,NULL,'Irinjalakuda','2017-04-20 07:00:43','2017-04-20 07:00:43'),(388,18,NULL,'Kaladi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(389,18,NULL,'Kalpetta','2017-04-20 07:00:43','2017-04-20 07:00:43'),(390,18,NULL,'Kanhangad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(391,18,NULL,'Kannur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(392,18,NULL,'Kasaragod','2017-04-20 07:00:43','2017-04-20 07:00:43'),(393,18,NULL,'Kayamkulam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(394,18,NULL,'Kochi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(395,18,NULL,'Kodungallur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(396,18,NULL,'Kollam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(397,18,NULL,'Koni','2017-04-20 07:00:43','2017-04-20 07:00:43'),(398,18,NULL,'Kottakkal','2017-04-20 07:00:43','2017-04-20 07:00:43'),(399,18,NULL,'Kottarakara','2017-04-20 07:00:43','2017-04-20 07:00:43'),(400,18,NULL,'Kottayam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(401,18,NULL,'Kozhikode','2017-04-20 07:00:43','2017-04-20 07:00:43'),(402,18,NULL,'Malappuram','2017-04-20 07:00:43','2017-04-20 07:00:43'),(403,18,NULL,'Manjeri','2017-04-20 07:00:43','2017-04-20 07:00:43'),(404,18,NULL,'Mattanur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(405,18,NULL,'Mavelikara','2017-04-20 07:00:43','2017-04-20 07:00:43'),(406,18,NULL,'Nilambur','2017-04-20 07:00:43','2017-04-20 07:00:43'),(407,18,NULL,'Ottappalam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(408,18,NULL,'Palakkad','2017-04-20 07:00:43','2017-04-20 07:00:43'),(409,18,NULL,'Palayam','2017-04-20 07:00:43','2017-04-20 07:00:43'),(410,18,NULL,'Parappanangadi','2017-04-20 07:00:43','2017-04-20 07:00:43'),(411,18,NULL,'Paravur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(412,18,NULL,'Pathanamthitta','2017-04-20 07:00:44','2017-04-20 07:00:44'),(413,18,NULL,'Pattambi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(414,18,NULL,'Payyanur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(415,18,NULL,'Ponnani','2017-04-20 07:00:44','2017-04-20 07:00:44'),(416,18,NULL,'Punalur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(417,18,NULL,'Shoranur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(418,18,NULL,'Sultans Battery','2017-04-20 07:00:44','2017-04-20 07:00:44'),(419,18,NULL,'Thalassery','2017-04-20 07:00:44','2017-04-20 07:00:44'),(420,18,NULL,'Thiruvananthapuram','2017-04-20 07:00:44','2017-04-20 07:00:44'),(421,18,NULL,'Thrissur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(422,18,NULL,'Tirur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(423,18,NULL,'Tiruvalla','2017-04-20 07:00:44','2017-04-20 07:00:44'),(424,18,NULL,'Vaikam','2017-04-20 07:00:44','2017-04-20 07:00:44'),(425,18,NULL,'Vazhakulam','2017-04-20 07:00:44','2017-04-20 07:00:44'),(426,19,NULL,'Kavaratti','2017-04-20 07:00:44','2017-04-20 07:00:44'),(427,20,NULL,'Abdul','2017-04-20 07:00:44','2017-04-20 07:00:44'),(428,20,NULL,'Ahmednagar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(429,20,NULL,'Akola','2017-04-20 07:00:44','2017-04-20 07:00:44'),(430,20,NULL,'Alibag','2017-04-20 07:00:44','2017-04-20 07:00:44'),(431,20,NULL,'Ambad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(432,20,NULL,'Ambarnath','2017-04-20 07:00:44','2017-04-20 07:00:44'),(433,20,NULL,'Amravati','2017-04-20 07:00:44','2017-04-20 07:00:44'),(434,20,NULL,'Andheri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(435,20,NULL,'Arvi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(436,20,NULL,'Aundh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(437,20,NULL,'Aurangabad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(438,20,NULL,'Badlapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(439,20,NULL,'Bandra','2017-04-20 07:00:44','2017-04-20 07:00:44'),(440,20,NULL,'Baramati','2017-04-20 07:00:44','2017-04-20 07:00:44'),(441,20,NULL,'Belapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(442,20,NULL,'Bhandup','2017-04-20 07:00:44','2017-04-20 07:00:44'),(443,20,NULL,'Bhiwandi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(444,20,NULL,'Bhusawal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(445,20,NULL,'Boisar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(446,20,NULL,'Chakan','2017-04-20 07:00:44','2017-04-20 07:00:44'),(447,20,NULL,'Chalisgaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(448,20,NULL,'Chandrapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(449,20,NULL,'Charan','2017-04-20 07:00:44','2017-04-20 07:00:44'),(450,20,NULL,'Chinchvad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(451,20,NULL,'Chiplun','2017-04-20 07:00:44','2017-04-20 07:00:44'),(452,20,NULL,'Chopda','2017-04-20 07:00:44','2017-04-20 07:00:44'),(453,20,NULL,'Colaba','2017-04-20 07:00:44','2017-04-20 07:00:44'),(454,20,NULL,'Dahanu','2017-04-20 07:00:44','2017-04-20 07:00:44'),(455,20,NULL,'Deolali','2017-04-20 07:00:44','2017-04-20 07:00:44'),(456,20,NULL,'Devgarh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(457,20,NULL,'Dharavi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(458,20,NULL,'Dhule','2017-04-20 07:00:44','2017-04-20 07:00:44'),(459,20,NULL,'Ellora Caves','2017-04-20 07:00:44','2017-04-20 07:00:44'),(460,20,NULL,'Gargoti','2017-04-20 07:00:44','2017-04-20 07:00:44'),(461,20,NULL,'Ghatkopar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(462,20,NULL,'Goregaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(463,20,NULL,'Hinganghat','2017-04-20 07:00:44','2017-04-20 07:00:44'),(464,20,NULL,'Hingoli','2017-04-20 07:00:44','2017-04-20 07:00:44'),(465,20,NULL,'Ichalkaranji','2017-04-20 07:00:44','2017-04-20 07:00:44'),(466,20,NULL,'Igatpuri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(467,20,NULL,'Jalgaon Jamod','2017-04-20 07:00:44','2017-04-20 07:00:44'),(468,20,NULL,'Jalna','2017-04-20 07:00:44','2017-04-20 07:00:44'),(469,20,NULL,'Kagal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(470,20,NULL,'Kalam','2017-04-20 07:00:44','2017-04-20 07:00:44'),(471,20,NULL,'Kalamboli','2017-04-20 07:00:44','2017-04-20 07:00:44'),(472,20,NULL,'Kalyan','2017-04-20 07:00:44','2017-04-20 07:00:44'),(473,20,NULL,'Kankauli','2017-04-20 07:00:44','2017-04-20 07:00:44'),(474,20,NULL,'Karad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(475,20,NULL,'Karanja','2017-04-20 07:00:44','2017-04-20 07:00:44'),(476,20,NULL,'Karjat','2017-04-20 07:00:44','2017-04-20 07:00:44'),(477,20,NULL,'Khalapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(478,20,NULL,'Khopoli','2017-04-20 07:00:44','2017-04-20 07:00:44'),(479,20,NULL,'Kolhapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(480,20,NULL,'Latur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(481,20,NULL,'Mahad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(482,20,NULL,'Mahim','2017-04-20 07:00:44','2017-04-20 07:00:44'),(483,20,NULL,'Mangaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(484,20,NULL,'Manor','2017-04-20 07:00:44','2017-04-20 07:00:44'),(485,20,NULL,'Miraj','2017-04-20 07:00:44','2017-04-20 07:00:44'),(486,20,NULL,'Mumbai','2017-04-20 07:00:44','2017-04-20 07:00:44'),(487,20,NULL,'Nadgaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(488,20,NULL,'Nagpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(489,20,NULL,'Nanded','2017-04-20 07:00:44','2017-04-20 07:00:44'),(490,20,NULL,'Nandurbar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(491,20,NULL,'Narayangaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(492,20,NULL,'Nashik','2017-04-20 07:00:44','2017-04-20 07:00:44'),(493,20,NULL,'Neral','2017-04-20 07:00:44','2017-04-20 07:00:44'),(494,20,NULL,'Neri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(495,20,NULL,'Osmanabad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(496,20,NULL,'Palghar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(497,20,NULL,'Palus','2017-04-20 07:00:44','2017-04-20 07:00:44'),(498,20,NULL,'Panchgani','2017-04-20 07:00:44','2017-04-20 07:00:44'),(499,20,NULL,'Pandharpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(500,20,NULL,'Panvel','2017-04-20 07:00:44','2017-04-20 07:00:44'),(501,20,NULL,'Parbhani','2017-04-20 07:00:44','2017-04-20 07:00:44'),(502,20,NULL,'Parel','2017-04-20 07:00:44','2017-04-20 07:00:44'),(503,20,NULL,'Pimpri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(504,20,NULL,'Pune','2017-04-20 07:00:44','2017-04-20 07:00:44'),(505,20,NULL,'Puras','2017-04-20 07:00:44','2017-04-20 07:00:44'),(506,20,NULL,'Ratnagiri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(507,20,NULL,'Sakri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(508,20,NULL,'Sangamner','2017-04-20 07:00:44','2017-04-20 07:00:44'),(509,20,NULL,'Sangli','2017-04-20 07:00:44','2017-04-20 07:00:44'),(510,20,NULL,'Sangola','2017-04-20 07:00:44','2017-04-20 07:00:44'),(511,20,NULL,'Satara','2017-04-20 07:00:44','2017-04-20 07:00:44'),(512,20,NULL,'Shahapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(513,20,NULL,'Shirgaon','2017-04-20 07:00:44','2017-04-20 07:00:44'),(514,20,NULL,'Shrigonda','2017-04-20 07:00:44','2017-04-20 07:00:44'),(515,20,NULL,'Sinnar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(516,20,NULL,'Sion','2017-04-20 07:00:44','2017-04-20 07:00:44'),(517,20,NULL,'Solapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(518,20,NULL,'Sopara','2017-04-20 07:00:44','2017-04-20 07:00:44'),(519,20,NULL,'Talegaon Dabhade','2017-04-20 07:00:44','2017-04-20 07:00:44'),(520,20,NULL,'Thane','2017-04-20 07:00:44','2017-04-20 07:00:44'),(521,20,NULL,'Trimbak','2017-04-20 07:00:44','2017-04-20 07:00:44'),(522,20,NULL,'Tuljapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(523,20,NULL,'Ulhasnagar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(524,20,NULL,'Umred','2017-04-20 07:00:44','2017-04-20 07:00:44'),(525,20,NULL,'Vadner','2017-04-20 07:00:44','2017-04-20 07:00:44'),(526,20,NULL,'Vasai','2017-04-20 07:00:44','2017-04-20 07:00:44'),(527,20,NULL,'Vashi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(528,20,NULL,'Virar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(529,20,NULL,'Wai','2017-04-20 07:00:44','2017-04-20 07:00:44'),(530,20,NULL,'Wardha','2017-04-20 07:00:44','2017-04-20 07:00:44'),(531,20,NULL,'Yavatmal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(532,20,NULL,'Yeola','2017-04-20 07:00:44','2017-04-20 07:00:44'),(533,21,NULL,'Nongpoh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(534,21,NULL,'Nongstoin','2017-04-20 07:00:44','2017-04-20 07:00:44'),(535,21,NULL,'Pala','2017-04-20 07:00:44','2017-04-20 07:00:44'),(536,21,NULL,'Shillong','2017-04-20 07:00:44','2017-04-20 07:00:44'),(537,21,NULL,'Tura','2017-04-20 07:00:44','2017-04-20 07:00:44'),(538,22,NULL,'Churachandpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(539,22,NULL,'Imphal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(540,23,NULL,'Amarkantak','2017-04-20 07:00:44','2017-04-20 07:00:44'),(541,23,NULL,'Ambah','2017-04-20 07:00:44','2017-04-20 07:00:44'),(542,23,NULL,'Anantpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(543,23,NULL,'Bagh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(544,23,NULL,'Balaghat','2017-04-20 07:00:44','2017-04-20 07:00:44'),(545,23,NULL,'Baroda','2017-04-20 07:00:44','2017-04-20 07:00:44'),(546,23,NULL,'Berasia','2017-04-20 07:00:44','2017-04-20 07:00:44'),(547,23,NULL,'Betul','2017-04-20 07:00:44','2017-04-20 07:00:44'),(548,23,NULL,'Bhagwan','2017-04-20 07:00:44','2017-04-20 07:00:44'),(549,23,NULL,'Bhartiya','2017-04-20 07:00:44','2017-04-20 07:00:44'),(550,23,NULL,'Bhopal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(551,23,NULL,'Chakra','2017-04-20 07:00:44','2017-04-20 07:00:44'),(552,23,NULL,'Chand','2017-04-20 07:00:44','2017-04-20 07:00:44'),(553,23,NULL,'Chhindwara','2017-04-20 07:00:44','2017-04-20 07:00:44'),(554,23,NULL,'Chopra','2017-04-20 07:00:44','2017-04-20 07:00:44'),(555,23,NULL,'Damoh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(556,23,NULL,'Dewas','2017-04-20 07:00:44','2017-04-20 07:00:44'),(557,23,NULL,'Dhar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(558,23,NULL,'Dindori','2017-04-20 07:00:44','2017-04-20 07:00:44'),(559,23,NULL,'Gandhigram','2017-04-20 07:00:44','2017-04-20 07:00:44'),(560,23,NULL,'Ganpat','2017-04-20 07:00:44','2017-04-20 07:00:44'),(561,23,NULL,'Guna','2017-04-20 07:00:44','2017-04-20 07:00:44'),(562,23,NULL,'Gwalior','2017-04-20 07:00:44','2017-04-20 07:00:44'),(563,23,NULL,'Hoshangabad','2017-04-20 07:00:44','2017-04-20 07:00:44'),(564,23,NULL,'Indore','2017-04-20 07:00:44','2017-04-20 07:00:44'),(565,23,NULL,'Jabalpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(566,23,NULL,'Kailaras','2017-04-20 07:00:44','2017-04-20 07:00:44'),(567,23,NULL,'Kamalpura','2017-04-20 07:00:44','2017-04-20 07:00:44'),(568,23,NULL,'Kataria','2017-04-20 07:00:44','2017-04-20 07:00:44'),(569,23,NULL,'Katni','2017-04-20 07:00:44','2017-04-20 07:00:44'),(570,23,NULL,'Khajuraho Group of Monuments','2017-04-20 07:00:44','2017-04-20 07:00:44'),(571,23,NULL,'Khargone','2017-04-20 07:00:44','2017-04-20 07:00:44'),(572,23,NULL,'Mandla','2017-04-20 07:00:44','2017-04-20 07:00:44'),(573,23,NULL,'Mandsaur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(574,23,NULL,'Mhow','2017-04-20 07:00:44','2017-04-20 07:00:44'),(575,23,NULL,'Morena','2017-04-20 07:00:44','2017-04-20 07:00:44'),(576,23,NULL,'Nadia','2017-04-20 07:00:44','2017-04-20 07:00:44'),(577,23,NULL,'Nagara','2017-04-20 07:00:44','2017-04-20 07:00:44'),(578,23,NULL,'Pachmarhi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(579,23,NULL,'Raipur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(580,23,NULL,'Rajapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(581,23,NULL,'Rama','2017-04-20 07:00:44','2017-04-20 07:00:44'),(582,23,NULL,'Ratlam','2017-04-20 07:00:44','2017-04-20 07:00:44'),(583,23,NULL,'Rewa','2017-04-20 07:00:44','2017-04-20 07:00:44'),(584,23,NULL,'Sagar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(585,23,NULL,'Sarangi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(586,23,NULL,'Satna','2017-04-20 07:00:44','2017-04-20 07:00:44'),(587,23,NULL,'Sehore','2017-04-20 07:00:44','2017-04-20 07:00:44'),(588,23,NULL,'Sendhwa','2017-04-20 07:00:44','2017-04-20 07:00:44'),(589,23,NULL,'Shahdol','2017-04-20 07:00:44','2017-04-20 07:00:44'),(590,23,NULL,'Sidhi','2017-04-20 07:00:44','2017-04-20 07:00:44'),(591,23,NULL,'Soni','2017-04-20 07:00:44','2017-04-20 07:00:44'),(592,23,NULL,'Tala','2017-04-20 07:00:44','2017-04-20 07:00:44'),(593,23,NULL,'Ujjain','2017-04-20 07:00:44','2017-04-20 07:00:44'),(594,23,NULL,'Vidisha','2017-04-20 07:00:44','2017-04-20 07:00:44'),(595,24,NULL,'Aizawl','2017-04-20 07:00:44','2017-04-20 07:00:44'),(596,25,NULL,'Chen','2017-04-20 07:00:44','2017-04-20 07:00:44'),(597,25,NULL,'Dimapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(598,25,NULL,'Kohima','2017-04-20 07:00:44','2017-04-20 07:00:44'),(599,26,NULL,'Angul','2017-04-20 07:00:44','2017-04-20 07:00:44'),(600,26,NULL,'Balangir','2017-04-20 07:00:44','2017-04-20 07:00:44'),(601,26,NULL,'Balasore','2017-04-20 07:00:44','2017-04-20 07:00:44'),(602,26,NULL,'Bargarh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(603,26,NULL,'Barpali','2017-04-20 07:00:44','2017-04-20 07:00:44'),(604,26,NULL,'Bhubaneswar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(605,26,NULL,'Brahmapur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(606,26,NULL,'Cuttack','2017-04-20 07:00:44','2017-04-20 07:00:44'),(607,26,NULL,'Dhenkanal','2017-04-20 07:00:44','2017-04-20 07:00:44'),(608,26,NULL,'Jajpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(609,26,NULL,'Jatani','2017-04-20 07:00:44','2017-04-20 07:00:44'),(610,26,NULL,'Jaypur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(611,26,NULL,'Jharsuguda','2017-04-20 07:00:44','2017-04-20 07:00:44'),(612,26,NULL,'Kalinga','2017-04-20 07:00:44','2017-04-20 07:00:44'),(613,26,NULL,'Khurda','2017-04-20 07:00:44','2017-04-20 07:00:44'),(614,26,NULL,'Koraput','2017-04-20 07:00:44','2017-04-20 07:00:44'),(615,26,NULL,'Nayagarh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(616,26,NULL,'Puri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(617,26,NULL,'Raurkela','2017-04-20 07:00:44','2017-04-20 07:00:44'),(618,26,NULL,'Rayagada','2017-04-20 07:00:44','2017-04-20 07:00:44'),(619,26,NULL,'Sambalpur','2017-04-20 07:00:44','2017-04-20 07:00:44'),(620,26,NULL,'Sundargarh','2017-04-20 07:00:44','2017-04-20 07:00:44'),(621,26,NULL,'Talcher','2017-04-20 07:00:44','2017-04-20 07:00:44'),(622,26,NULL,'Udaigiri','2017-04-20 07:00:44','2017-04-20 07:00:44'),(623,27,NULL,'Amritsar','2017-04-20 07:00:44','2017-04-20 07:00:44'),(624,27,NULL,'Banga','2017-04-20 07:00:45','2017-04-20 07:00:45'),(625,27,NULL,'Barnala','2017-04-20 07:00:45','2017-04-20 07:00:45'),(626,27,NULL,'Batala','2017-04-20 07:00:45','2017-04-20 07:00:45'),(627,27,NULL,'Bhatinda','2017-04-20 07:00:45','2017-04-20 07:00:45'),(628,27,NULL,'Dasua','2017-04-20 07:00:45','2017-04-20 07:00:45'),(629,27,NULL,'Dhariwal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(630,27,NULL,'Dhuri','2017-04-20 07:00:45','2017-04-20 07:00:45'),(631,27,NULL,'Dinanagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(632,27,NULL,'Faridkot','2017-04-20 07:00:45','2017-04-20 07:00:45'),(633,27,NULL,'Firozpur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(634,27,NULL,'Garhshankar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(635,27,NULL,'Gurdaspur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(636,27,NULL,'Hoshiarpur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(637,27,NULL,'Jagraon','2017-04-20 07:00:45','2017-04-20 07:00:45'),(638,27,NULL,'Jalalabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(639,27,NULL,'Jalandhar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(640,27,NULL,'Kapurthala Town','2017-04-20 07:00:45','2017-04-20 07:00:45'),(641,27,NULL,'Khanna','2017-04-20 07:00:45','2017-04-20 07:00:45'),(642,27,NULL,'Kharar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(643,27,NULL,'Kot Isa Khan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(644,27,NULL,'Kurali','2017-04-20 07:00:45','2017-04-20 07:00:45'),(645,27,NULL,'Ludhiana','2017-04-20 07:00:45','2017-04-20 07:00:45'),(646,27,NULL,'Machhiwara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(647,27,NULL,'Maharaj','2017-04-20 07:00:45','2017-04-20 07:00:45'),(648,27,NULL,'Mansa','2017-04-20 07:00:45','2017-04-20 07:00:45'),(649,27,NULL,'Moga','2017-04-20 07:00:45','2017-04-20 07:00:45'),(650,27,NULL,'Mohali','2017-04-20 07:00:45','2017-04-20 07:00:45'),(651,27,NULL,'Morinda','2017-04-20 07:00:45','2017-04-20 07:00:45'),(652,27,NULL,'Mukerian','2017-04-20 07:00:45','2017-04-20 07:00:45'),(653,27,NULL,'Muktsar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(654,27,NULL,'Nabha','2017-04-20 07:00:45','2017-04-20 07:00:45'),(655,27,NULL,'Pathankot','2017-04-20 07:00:45','2017-04-20 07:00:45'),(656,27,NULL,'Patiala','2017-04-20 07:00:45','2017-04-20 07:00:45'),(657,27,NULL,'Phagwara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(658,27,NULL,'Rajpura','2017-04-20 07:00:45','2017-04-20 07:00:45'),(659,27,NULL,'Rupnagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(660,27,NULL,'Sangrur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(661,27,NULL,'Shahkot','2017-04-20 07:00:45','2017-04-20 07:00:45'),(662,27,NULL,'Sirhind','2017-04-20 07:00:45','2017-04-20 07:00:45'),(663,27,NULL,'Sunam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(664,27,NULL,'Talwandi Sabo','2017-04-20 07:00:45','2017-04-20 07:00:45'),(665,27,NULL,'Tarn Taran','2017-04-20 07:00:45','2017-04-20 07:00:45'),(666,28,NULL,'Karaikal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(667,28,NULL,'Puducherry','2017-04-20 07:00:45','2017-04-20 07:00:45'),(668,29,NULL,'Ajmer','2017-04-20 07:00:45','2017-04-20 07:00:45'),(669,29,NULL,'Alwar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(670,29,NULL,'Amer','2017-04-20 07:00:45','2017-04-20 07:00:45'),(671,29,NULL,'Amet','2017-04-20 07:00:45','2017-04-20 07:00:45'),(672,29,NULL,'Balana','2017-04-20 07:00:45','2017-04-20 07:00:45'),(673,29,NULL,'Bali','2017-04-20 07:00:45','2017-04-20 07:00:45'),(674,29,NULL,'Banswara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(675,29,NULL,'Barmer','2017-04-20 07:00:45','2017-04-20 07:00:45'),(676,29,NULL,'Beawar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(677,29,NULL,'Bharatpur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(678,29,NULL,'Bhilwara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(679,29,NULL,'Bikaner','2017-04-20 07:00:45','2017-04-20 07:00:45'),(680,29,NULL,'Binavas','2017-04-20 07:00:45','2017-04-20 07:00:45'),(681,29,NULL,'Bundi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(682,29,NULL,'Charu','2017-04-20 07:00:45','2017-04-20 07:00:45'),(683,29,NULL,'Chetan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(684,29,NULL,'Chhabra','2017-04-20 07:00:45','2017-04-20 07:00:45'),(685,29,NULL,'Dipas','2017-04-20 07:00:45','2017-04-20 07:00:45'),(686,29,NULL,'Ganganagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(687,29,NULL,'Gangapur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(688,29,NULL,'Gangrar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(689,29,NULL,'Jaipur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(690,29,NULL,'Jaisalmer','2017-04-20 07:00:45','2017-04-20 07:00:45'),(691,29,NULL,'Jhalawar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(692,29,NULL,'Jhunjhunun','2017-04-20 07:00:45','2017-04-20 07:00:45'),(693,29,NULL,'Jodhpur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(694,29,NULL,'Kalan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(695,29,NULL,'Kanakpura','2017-04-20 07:00:45','2017-04-20 07:00:45'),(696,29,NULL,'Khan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(697,29,NULL,'Khinwara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(698,29,NULL,'Kishangarh','2017-04-20 07:00:45','2017-04-20 07:00:45'),(699,29,NULL,'Kolayat','2017-04-20 07:00:45','2017-04-20 07:00:45'),(700,29,NULL,'Kota','2017-04-20 07:00:45','2017-04-20 07:00:45'),(701,29,NULL,'Lamba Harisingh','2017-04-20 07:00:45','2017-04-20 07:00:45'),(702,29,NULL,'Mahajan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(703,29,NULL,'Mahatma','2017-04-20 07:00:45','2017-04-20 07:00:45'),(704,29,NULL,'Mandal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(705,29,NULL,'Manna','2017-04-20 07:00:45','2017-04-20 07:00:45'),(706,29,NULL,'Mount Abu','2017-04-20 07:00:45','2017-04-20 07:00:45'),(707,29,NULL,'Nagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(708,29,NULL,'Nagaur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(709,29,NULL,'Nanda','2017-04-20 07:00:45','2017-04-20 07:00:45'),(710,29,NULL,'Naraina','2017-04-20 07:00:45','2017-04-20 07:00:45'),(711,29,NULL,'Nathdwara','2017-04-20 07:00:45','2017-04-20 07:00:45'),(712,29,NULL,'Pali','2017-04-20 07:00:45','2017-04-20 07:00:45'),(713,29,NULL,'Pilani','2017-04-20 07:00:45','2017-04-20 07:00:45'),(714,29,NULL,'Pitampura','2017-04-20 07:00:45','2017-04-20 07:00:45'),(715,29,NULL,'Pushkar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(716,29,NULL,'Rana','2017-04-20 07:00:45','2017-04-20 07:00:45'),(717,29,NULL,'Roshan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(718,29,NULL,'Shiv','2017-04-20 07:00:45','2017-04-20 07:00:45'),(719,29,NULL,'Sikar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(720,29,NULL,'Sirohi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(721,29,NULL,'Sojat','2017-04-20 07:00:45','2017-04-20 07:00:45'),(722,29,NULL,'Sultan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(723,29,NULL,'Surana','2017-04-20 07:00:45','2017-04-20 07:00:45'),(724,29,NULL,'Suratgarh','2017-04-20 07:00:45','2017-04-20 07:00:45'),(725,29,NULL,'Thali','2017-04-20 07:00:45','2017-04-20 07:00:45'),(726,29,NULL,'Tonk','2017-04-20 07:00:45','2017-04-20 07:00:45'),(727,29,NULL,'Udaipur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(728,30,NULL,'Gangtok','2017-04-20 07:00:45','2017-04-20 07:00:45'),(729,30,NULL,'Manu','2017-04-20 07:00:45','2017-04-20 07:00:45'),(730,30,NULL,'Singtam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(731,30,NULL,'Sirwani','2017-04-20 07:00:45','2017-04-20 07:00:45'),(732,31,NULL,'Adilabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(733,31,NULL,'Balanagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(734,31,NULL,'Bhongir','2017-04-20 07:00:45','2017-04-20 07:00:45'),(735,31,NULL,'Bodhan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(736,31,NULL,'Gudur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(737,31,NULL,'Hyderabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(738,31,NULL,'Karimnagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(739,31,NULL,'Khammam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(740,31,NULL,'Kottagudem','2017-04-20 07:00:45','2017-04-20 07:00:45'),(741,31,NULL,'Mancherial','2017-04-20 07:00:45','2017-04-20 07:00:45'),(742,31,NULL,'Medak','2017-04-20 07:00:45','2017-04-20 07:00:45'),(743,31,NULL,'Medchal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(744,31,NULL,'Nalgonda','2017-04-20 07:00:45','2017-04-20 07:00:45'),(745,31,NULL,'Narsapur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(746,31,NULL,'Nizamabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(747,31,NULL,'Paloncha','2017-04-20 07:00:45','2017-04-20 07:00:45'),(748,31,NULL,'Patancheru','2017-04-20 07:00:45','2017-04-20 07:00:45'),(749,31,NULL,'Patelguda','2017-04-20 07:00:45','2017-04-20 07:00:45'),(750,31,NULL,'Pochampalli','2017-04-20 07:00:45','2017-04-20 07:00:45'),(751,31,NULL,'Secunderabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(752,31,NULL,'Shadnagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(753,31,NULL,'Suriapet','2017-04-20 07:00:45','2017-04-20 07:00:45'),(754,31,NULL,'Uppal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(755,31,NULL,'Vikarabad','2017-04-20 07:00:45','2017-04-20 07:00:45'),(756,31,NULL,'Warangal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(757,32,NULL,'Alangulam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(758,32,NULL,'Ambur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(759,32,NULL,'Annamalainagar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(760,32,NULL,'Arakkonam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(761,32,NULL,'Arani','2017-04-20 07:00:45','2017-04-20 07:00:45'),(762,32,NULL,'Ariyalur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(763,32,NULL,'Attur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(764,32,NULL,'Bodinayakkanur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(765,32,NULL,'Chennai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(766,32,NULL,'Cheyyar','2017-04-20 07:00:45','2017-04-20 07:00:45'),(767,32,NULL,'Chidambaram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(768,32,NULL,'Choolai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(769,32,NULL,'Coimbatore','2017-04-20 07:00:45','2017-04-20 07:00:45'),(770,32,NULL,'Coonoor','2017-04-20 07:00:45','2017-04-20 07:00:45'),(771,32,NULL,'Cuddalore','2017-04-20 07:00:45','2017-04-20 07:00:45'),(772,32,NULL,'Devipattinam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(773,32,NULL,'Dharapuram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(774,32,NULL,'Dharmapuri','2017-04-20 07:00:45','2017-04-20 07:00:45'),(775,32,NULL,'Dindigul','2017-04-20 07:00:45','2017-04-20 07:00:45'),(776,32,NULL,'Ekkattuthangal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(777,32,NULL,'Eral','2017-04-20 07:00:45','2017-04-20 07:00:45'),(778,32,NULL,'Erode','2017-04-20 07:00:45','2017-04-20 07:00:45'),(779,32,NULL,'Fort','2017-04-20 07:00:45','2017-04-20 07:00:45'),(780,32,NULL,'Gobichettipalayam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(781,32,NULL,'Guindy','2017-04-20 07:00:45','2017-04-20 07:00:45'),(782,32,NULL,'Hosur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(783,32,NULL,'Kalpakkam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(784,32,NULL,'Kanchipuram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(785,32,NULL,'Kangayam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(786,32,NULL,'Kaniyambadi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(787,32,NULL,'Kanniyakumari','2017-04-20 07:00:45','2017-04-20 07:00:45'),(788,32,NULL,'Karaikudi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(789,32,NULL,'Karamadai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(790,32,NULL,'Karur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(791,32,NULL,'Kodaikanal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(792,32,NULL,'Koothanallur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(793,32,NULL,'Kovilpatti','2017-04-20 07:00:45','2017-04-20 07:00:45'),(794,32,NULL,'Krishnagiri','2017-04-20 07:00:45','2017-04-20 07:00:45'),(795,32,NULL,'Kumbakonam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(796,32,NULL,'Kuzhithurai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(797,32,NULL,'Lalgudi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(798,32,NULL,'Madurai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(799,32,NULL,'Madurantakam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(800,32,NULL,'Mahabalipuram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(801,32,NULL,'Mannargudi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(802,32,NULL,'Mettur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(803,32,NULL,'Mylapore','2017-04-20 07:00:45','2017-04-20 07:00:45'),(804,32,NULL,'Nagapattinam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(805,32,NULL,'Nagercoil','2017-04-20 07:00:45','2017-04-20 07:00:45'),(806,32,NULL,'Namakkal','2017-04-20 07:00:45','2017-04-20 07:00:45'),(807,32,NULL,'Neyveli','2017-04-20 07:00:45','2017-04-20 07:00:45'),(808,32,NULL,'Omalur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(809,32,NULL,'Ooty','2017-04-20 07:00:45','2017-04-20 07:00:45'),(810,32,NULL,'Palani','2017-04-20 07:00:45','2017-04-20 07:00:45'),(811,32,NULL,'Palladam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(812,32,NULL,'Panruti','2017-04-20 07:00:45','2017-04-20 07:00:45'),(813,32,NULL,'Pattukkottai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(814,32,NULL,'Perambalur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(815,32,NULL,'Peranampattu','2017-04-20 07:00:45','2017-04-20 07:00:45'),(816,32,NULL,'Perundurai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(817,32,NULL,'Pollachi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(818,32,NULL,'Ponneri','2017-04-20 07:00:45','2017-04-20 07:00:45'),(819,32,NULL,'Pudukkottai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(820,32,NULL,'Puliyur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(821,32,NULL,'Rajapalaiyam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(822,32,NULL,'Ramanathapuram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(823,32,NULL,'Ranippettai','2017-04-20 07:00:45','2017-04-20 07:00:45'),(824,32,NULL,'Salem','2017-04-20 07:00:45','2017-04-20 07:00:45'),(825,32,NULL,'Sattur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(826,32,NULL,'Sholavandan','2017-04-20 07:00:45','2017-04-20 07:00:45'),(827,32,NULL,'Sirkazhi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(828,32,NULL,'Siruseri','2017-04-20 07:00:45','2017-04-20 07:00:45'),(829,32,NULL,'Sivaganga','2017-04-20 07:00:45','2017-04-20 07:00:45'),(830,32,NULL,'Sivakasi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(831,32,NULL,'Sriperumbudur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(832,32,NULL,'Srirangam','2017-04-20 07:00:45','2017-04-20 07:00:45'),(833,32,NULL,'Srivilliputhur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(834,32,NULL,'Tambaram','2017-04-20 07:00:45','2017-04-20 07:00:45'),(835,32,NULL,'Thanjavur','2017-04-20 07:00:45','2017-04-20 07:00:45'),(836,32,NULL,'Thenkasi','2017-04-20 07:00:45','2017-04-20 07:00:45'),(837,32,NULL,'Thirumangalam','2017-04-20 07:00:46','2017-04-20 07:00:46'),(838,32,NULL,'Thiruthani','2017-04-20 07:00:46','2017-04-20 07:00:46'),(839,32,NULL,'Thiruvarur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(840,32,NULL,'Thoothukudi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(841,32,NULL,'Tindivanam','2017-04-20 07:00:46','2017-04-20 07:00:46'),(842,32,NULL,'Tiruchchendur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(843,32,NULL,'Tiruchi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(844,32,NULL,'Tirunelveli','2017-04-20 07:00:46','2017-04-20 07:00:46'),(845,32,NULL,'Tiruppur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(846,32,NULL,'Tiruvallur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(847,32,NULL,'Tiruvannamalai','2017-04-20 07:00:46','2017-04-20 07:00:46'),(848,32,NULL,'Turaiyur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(849,32,NULL,'Vadamadurai','2017-04-20 07:00:46','2017-04-20 07:00:46'),(850,32,NULL,'Vandalur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(851,32,NULL,'Vandavasi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(852,32,NULL,'Vaniyambadi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(853,32,NULL,'Vellore','2017-04-20 07:00:46','2017-04-20 07:00:46'),(854,32,NULL,'Villupuram','2017-04-20 07:00:46','2017-04-20 07:00:46'),(855,32,NULL,'Wellington','2017-04-20 07:00:46','2017-04-20 07:00:46'),(856,32,NULL,'Yercaud','2017-04-20 07:00:46','2017-04-20 07:00:46'),(857,33,NULL,'Agartala','2017-04-20 07:00:46','2017-04-20 07:00:46'),(858,33,NULL,'Kamalpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(859,34,NULL,'Adwani','2017-04-20 07:00:46','2017-04-20 07:00:46'),(860,34,NULL,'Almora','2017-04-20 07:00:46','2017-04-20 07:00:46'),(861,34,NULL,'Dang','2017-04-20 07:00:46','2017-04-20 07:00:46'),(862,34,NULL,'Dangi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(863,34,NULL,'Dehradun','2017-04-20 07:00:46','2017-04-20 07:00:46'),(864,34,NULL,'Dhanaulti','2017-04-20 07:00:46','2017-04-20 07:00:46'),(865,34,NULL,'Dogadda','2017-04-20 07:00:46','2017-04-20 07:00:46'),(866,34,NULL,'Dwarahat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(867,34,NULL,'Haldwani','2017-04-20 07:00:46','2017-04-20 07:00:46'),(868,34,NULL,'Haridwar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(869,34,NULL,'Jamal','2017-04-20 07:00:46','2017-04-20 07:00:46'),(870,34,NULL,'Jaspur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(871,34,NULL,'Kashipur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(872,34,NULL,'Lohaghat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(873,34,NULL,'Mill','2017-04-20 07:00:46','2017-04-20 07:00:46'),(874,34,NULL,'Mussoorie','2017-04-20 07:00:46','2017-04-20 07:00:46'),(875,34,NULL,'Nagal','2017-04-20 07:00:46','2017-04-20 07:00:46'),(876,34,NULL,'Naini','2017-04-20 07:00:46','2017-04-20 07:00:46'),(877,34,NULL,'Pantnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(878,34,NULL,'Pauri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(879,34,NULL,'Pithoragarh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(880,34,NULL,'Ramnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(881,34,NULL,'Rishikesh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(882,34,NULL,'Roorkee','2017-04-20 07:00:46','2017-04-20 07:00:46'),(883,34,NULL,'Sidhpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(884,34,NULL,'Uttarkashi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(885,34,NULL,'Vikasnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(886,35,NULL,'Agra','2017-04-20 07:00:46','2017-04-20 07:00:46'),(887,35,NULL,'Ajabpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(888,35,NULL,'Aligarh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(889,35,NULL,'Allahabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(890,35,NULL,'Anandnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(891,35,NULL,'Arora','2017-04-20 07:00:46','2017-04-20 07:00:46'),(892,35,NULL,'Azamgarh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(893,35,NULL,'Bagpat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(894,35,NULL,'Balu','2017-04-20 07:00:46','2017-04-20 07:00:46'),(895,35,NULL,'Banda','2017-04-20 07:00:46','2017-04-20 07:00:46'),(896,35,NULL,'Bank','2017-04-20 07:00:46','2017-04-20 07:00:46'),(897,35,NULL,'Bareilly','2017-04-20 07:00:46','2017-04-20 07:00:46'),(898,35,NULL,'Basti','2017-04-20 07:00:46','2017-04-20 07:00:46'),(899,35,NULL,'Bela','2017-04-20 07:00:46','2017-04-20 07:00:46'),(900,35,NULL,'Bhadohi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(901,35,NULL,'Bichpuri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(902,35,NULL,'Budaun','2017-04-20 07:00:46','2017-04-20 07:00:46'),(903,35,NULL,'Bulandshahr','2017-04-20 07:00:46','2017-04-20 07:00:46'),(904,35,NULL,'Chandauli','2017-04-20 07:00:46','2017-04-20 07:00:46'),(905,35,NULL,'Chandausi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(906,35,NULL,'Chitra','2017-04-20 07:00:46','2017-04-20 07:00:46'),(907,35,NULL,'Dadri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(908,35,NULL,'Dasna','2017-04-20 07:00:46','2017-04-20 07:00:46'),(909,35,NULL,'Deoria','2017-04-20 07:00:46','2017-04-20 07:00:46'),(910,35,NULL,'Etawah','2017-04-20 07:00:46','2017-04-20 07:00:46'),(911,35,NULL,'Faizabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(912,35,NULL,'Fatehgarh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(913,35,NULL,'Fatehpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(914,35,NULL,'Firozabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(915,35,NULL,'Ghaziabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(916,35,NULL,'Gonda','2017-04-20 07:00:46','2017-04-20 07:00:46'),(917,35,NULL,'Gorakhpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(918,35,NULL,'Hamirpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(919,35,NULL,'Hapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(920,35,NULL,'Iglas','2017-04-20 07:00:46','2017-04-20 07:00:46'),(921,35,NULL,'Jalesar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(922,35,NULL,'Jaunpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(923,35,NULL,'Jhansi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(924,35,NULL,'Kaimganj','2017-04-20 07:00:46','2017-04-20 07:00:46'),(925,35,NULL,'Kanpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(926,35,NULL,'Karari','2017-04-20 07:00:46','2017-04-20 07:00:46'),(927,35,NULL,'Kasganj','2017-04-20 07:00:46','2017-04-20 07:00:46'),(928,35,NULL,'Kasia','2017-04-20 07:00:46','2017-04-20 07:00:46'),(929,35,NULL,'Khandar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(930,35,NULL,'Khatauli','2017-04-20 07:00:46','2017-04-20 07:00:46'),(931,35,NULL,'Kheri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(932,35,NULL,'Khurja','2017-04-20 07:00:46','2017-04-20 07:00:46'),(933,35,NULL,'Kunwar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(934,35,NULL,'Lakhimpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(935,35,NULL,'Lucknow','2017-04-20 07:00:46','2017-04-20 07:00:46'),(936,35,NULL,'Madhoganj','2017-04-20 07:00:46','2017-04-20 07:00:46'),(937,35,NULL,'Mathan','2017-04-20 07:00:46','2017-04-20 07:00:46'),(938,35,NULL,'Mathura','2017-04-20 07:00:46','2017-04-20 07:00:46'),(939,35,NULL,'Mawana','2017-04-20 07:00:46','2017-04-20 07:00:46'),(940,35,NULL,'Meerut','2017-04-20 07:00:46','2017-04-20 07:00:46'),(941,35,NULL,'Mehra','2017-04-20 07:00:46','2017-04-20 07:00:46'),(942,35,NULL,'Mirza Murad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(943,35,NULL,'Mirzapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(944,35,NULL,'Mohan','2017-04-20 07:00:46','2017-04-20 07:00:46'),(945,35,NULL,'Moradabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(946,35,NULL,'Muzaffarnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(947,35,NULL,'Noida','2017-04-20 07:00:46','2017-04-20 07:00:46'),(948,35,NULL,'Orai','2017-04-20 07:00:46','2017-04-20 07:00:46'),(949,35,NULL,'Padrauna','2017-04-20 07:00:46','2017-04-20 07:00:46'),(950,35,NULL,'Phaphamau','2017-04-20 07:00:46','2017-04-20 07:00:46'),(951,35,NULL,'Pilkhuwa','2017-04-20 07:00:46','2017-04-20 07:00:46'),(952,35,NULL,'Potti','2017-04-20 07:00:46','2017-04-20 07:00:46'),(953,35,NULL,'Rampur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(954,35,NULL,'Saharanpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(955,35,NULL,'Sahibabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(956,35,NULL,'Shahjahanpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(957,35,NULL,'Shamsabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(958,35,NULL,'Sikka','2017-04-20 07:00:46','2017-04-20 07:00:46'),(959,35,NULL,'Sitapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(960,35,NULL,'Sultanpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(961,35,NULL,'Tanda','2017-04-20 07:00:46','2017-04-20 07:00:46'),(962,35,NULL,'Teri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(963,35,NULL,'Tikamgarh','2017-04-20 07:00:46','2017-04-20 07:00:46'),(964,35,NULL,'Unnao','2017-04-20 07:00:46','2017-04-20 07:00:46'),(965,35,NULL,'Varanasi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(966,36,NULL,'Alipur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(967,36,NULL,'Asansol','2017-04-20 07:00:46','2017-04-20 07:00:46'),(968,36,NULL,'Baharampur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(969,36,NULL,'Baidyabati','2017-04-20 07:00:46','2017-04-20 07:00:46'),(970,36,NULL,'Bali','2017-04-20 07:00:46','2017-04-20 07:00:46'),(971,36,NULL,'Balurghat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(972,36,NULL,'Bangaon','2017-04-20 07:00:46','2017-04-20 07:00:46'),(973,36,NULL,'Bankura','2017-04-20 07:00:46','2017-04-20 07:00:46'),(974,36,NULL,'Barakpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(975,36,NULL,'Barddhaman','2017-04-20 07:00:46','2017-04-20 07:00:46'),(976,36,NULL,'Basirhat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(977,36,NULL,'Behala','2017-04-20 07:00:46','2017-04-20 07:00:46'),(978,36,NULL,'Belgharia','2017-04-20 07:00:46','2017-04-20 07:00:46'),(979,36,NULL,'Binnaguri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(980,36,NULL,'Bishnupur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(981,36,NULL,'Bolpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(982,36,NULL,'Budbud','2017-04-20 07:00:46','2017-04-20 07:00:46'),(983,36,NULL,'Canning','2017-04-20 07:00:46','2017-04-20 07:00:46'),(984,36,NULL,'Chandannagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(985,36,NULL,'Dam Dam','2017-04-20 07:00:46','2017-04-20 07:00:46'),(986,36,NULL,'Darjeeling','2017-04-20 07:00:46','2017-04-20 07:00:46'),(987,36,NULL,'Durgapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(988,36,NULL,'Farakka','2017-04-20 07:00:46','2017-04-20 07:00:46'),(989,36,NULL,'Ghatal','2017-04-20 07:00:46','2017-04-20 07:00:46'),(990,36,NULL,'Gujrat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(991,36,NULL,'Habra','2017-04-20 07:00:46','2017-04-20 07:00:46'),(992,36,NULL,'Haldia','2017-04-20 07:00:46','2017-04-20 07:00:46'),(993,36,NULL,'Haripur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(994,36,NULL,'Howrah','2017-04-20 07:00:46','2017-04-20 07:00:46'),(995,36,NULL,'Hugli','2017-04-20 07:00:46','2017-04-20 07:00:46'),(996,36,NULL,'Jadabpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(997,36,NULL,'Jalpaiguri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(998,36,NULL,'Jayanti','2017-04-20 07:00:46','2017-04-20 07:00:46'),(999,36,NULL,'Jhargram','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1000,36,NULL,'Kakdwip','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1001,36,NULL,'Kalyani','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1002,36,NULL,'Kanchrapara','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1003,36,NULL,'Kandi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1004,36,NULL,'Karsiyang','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1005,36,NULL,'Katoya','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1006,36,NULL,'Kharagpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1007,36,NULL,'Koch Bihar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1008,36,NULL,'Kolkata','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1009,36,NULL,'Konnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1010,36,NULL,'Kulti','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1011,36,NULL,'Liluah','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1012,36,NULL,'Maldah','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1013,36,NULL,'Manipur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1014,36,NULL,'Mayapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1015,36,NULL,'Medinipur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1016,36,NULL,'Multi','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1017,36,NULL,'Murshidabad','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1018,36,NULL,'Nabadwip','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1019,36,NULL,'Panchal','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1020,36,NULL,'Puruliya','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1021,36,NULL,'Rajpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1022,36,NULL,'Ranaghat','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1023,36,NULL,'Raniganj','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1024,36,NULL,'Rudrapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1025,36,NULL,'Rupnarayanpur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1026,36,NULL,'Salt Lake City','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1027,36,NULL,'Saranga','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1028,36,NULL,'Serampore','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1029,36,NULL,'Shyamnagar','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1030,36,NULL,'Siliguri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1031,36,NULL,'Siuri','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1032,23,NULL,'Shajapur','2017-04-20 07:00:46','2017-04-20 07:00:46'),(1033,9,'','New Delhi','2017-04-21 09:16:53','2017-04-21 09:16:53');
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
  CONSTRAINT `fk_rails_446fb0cf6d` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`),
  CONSTRAINT `fk_rails_1d213449b8` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  CONSTRAINT `fk_rails_71c4e35e55` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_2066b5e194` FOREIGN KEY (`employee_arrear_id`) REFERENCES `employee_arrears` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=2907 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (372,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(373,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(374,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(375,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(376,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(377,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(378,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(379,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(380,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(381,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(382,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(383,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(384,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(385,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(386,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(387,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(388,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(389,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(390,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(391,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(392,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(393,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(394,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(395,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(396,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(397,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(398,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(399,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(400,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(401,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(402,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(403,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(404,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(405,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(406,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL),(407,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(408,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(409,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(410,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(411,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(412,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(413,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(414,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(415,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(416,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(417,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(418,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(419,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(420,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(421,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(422,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(423,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(424,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(425,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(426,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(427,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(428,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(429,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(430,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(431,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(432,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(433,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(434,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(435,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(436,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(437,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(438,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(439,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(440,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(441,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL),(442,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(443,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(444,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(445,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(446,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(447,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(448,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(449,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(450,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:11','2017-05-10 05:35:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(451,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(452,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(453,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(454,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(455,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(456,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(457,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(458,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(459,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(460,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(461,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(462,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(463,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(464,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(465,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(466,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(467,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(468,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(469,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(470,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(471,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(472,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(473,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(474,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(475,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(476,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL),(477,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(478,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(479,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(480,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(481,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(482,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(483,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(484,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(485,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(486,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(487,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(488,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(489,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(490,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(491,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(492,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(493,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(494,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(495,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(496,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(497,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(498,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(499,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(500,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(501,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(502,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(503,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(504,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(505,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(506,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(507,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(508,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(509,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(510,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(511,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,2,NULL),(512,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(513,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(514,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(515,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(516,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(517,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(518,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(519,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(520,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(521,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(522,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(523,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(524,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(525,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(526,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(527,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(528,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(529,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(530,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(531,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(532,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(533,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(534,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(535,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(536,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(537,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(538,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(539,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(540,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(541,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(542,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(543,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(544,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(545,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(546,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),(547,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(548,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(549,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(550,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(551,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(552,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(553,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:12','2017-05-10 05:35:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(554,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(555,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(556,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(557,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(558,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(559,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(560,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(561,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(562,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(563,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(564,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(565,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(566,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(567,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(568,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(569,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(570,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(571,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(572,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(573,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(574,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(575,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(576,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(577,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(578,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(579,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(580,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(581,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,8,NULL),(582,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(583,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(584,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(585,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(586,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(587,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(588,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(589,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(590,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(591,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(592,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(593,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(594,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(595,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(596,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(597,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(598,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(599,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(600,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(601,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(602,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(603,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(604,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(605,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(606,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(607,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(608,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(609,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(610,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(611,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(612,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(613,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(614,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(615,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(616,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,NULL),(617,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(618,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(619,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(620,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(621,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(622,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(623,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(624,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(625,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(626,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(627,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(628,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(629,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(630,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(631,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(632,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(633,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(634,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(635,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(636,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(637,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(638,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(639,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(640,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(641,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(642,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(643,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(644,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(645,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(646,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(647,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(648,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(649,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(650,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(651,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,2,NULL),(652,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:13','2017-05-10 05:35:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(653,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(654,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(655,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(656,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(657,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(658,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(659,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(660,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(661,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(662,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(663,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(664,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(665,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(666,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(667,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(668,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(669,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(670,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(671,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(672,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(673,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(674,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(675,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(676,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(677,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(678,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(679,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(680,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(681,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(682,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(683,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(684,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(685,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(686,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,4,NULL),(687,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(688,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(689,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(690,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(691,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(692,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(693,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(694,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(695,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(696,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(697,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(698,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(699,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(700,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(701,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(702,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(703,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(704,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(705,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(706,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(707,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(708,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(709,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(710,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(711,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(712,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(713,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(714,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(715,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(716,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(717,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(718,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(719,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(720,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(721,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,9,NULL),(722,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(723,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(724,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(725,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(726,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(727,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(728,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(729,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(730,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(731,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(732,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(733,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(734,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(735,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(736,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(737,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(738,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(739,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(740,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(741,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(742,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(743,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(744,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(745,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(746,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(747,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:14','2017-05-10 05:35:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(748,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(749,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(750,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(751,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(752,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(753,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(754,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(755,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(756,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL),(757,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(758,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(759,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(760,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(761,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(762,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(763,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(764,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(765,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(766,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(767,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(768,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(769,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(770,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(771,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(772,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(773,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(774,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(775,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(776,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(777,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(778,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(779,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(780,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(781,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(782,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(783,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(784,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(785,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(786,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(787,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(788,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(789,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(790,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(791,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL),(792,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(793,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(794,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(795,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(796,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(797,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(798,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(799,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(800,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(801,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(802,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(803,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(804,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(805,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(806,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(807,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(808,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(809,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(810,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(811,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(812,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(813,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(814,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(815,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(816,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(817,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(818,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(819,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(820,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(821,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(822,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(823,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(824,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(825,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(826,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,10,NULL),(827,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(828,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(829,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(830,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(831,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(832,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(833,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(834,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(835,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(836,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(837,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(838,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(839,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(840,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(841,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:15','2017-05-10 05:35:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(842,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(843,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(844,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(845,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(846,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(847,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(848,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(849,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(850,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(851,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(852,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(853,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(854,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(855,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(856,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(857,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(858,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(859,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(860,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(861,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,6,NULL),(862,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(863,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(864,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(865,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(866,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(867,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(868,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(869,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(870,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(871,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(872,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(873,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(874,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(875,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(876,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(877,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(878,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(879,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(880,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(881,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(882,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(883,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(884,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(885,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(886,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(887,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(888,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(889,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(890,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(891,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(892,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(893,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(894,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(895,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(896,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,8,NULL),(897,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(898,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(899,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(900,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(901,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(902,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(903,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(904,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(905,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(906,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(907,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(908,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(909,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(910,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(911,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(912,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(913,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(914,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(915,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(916,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(917,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(918,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(919,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(920,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(921,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(922,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(923,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(924,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(925,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(926,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(927,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(928,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(929,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(930,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(931,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:16','2017-05-10 05:35:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,4,NULL),(932,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(933,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(934,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(935,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(936,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(937,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(938,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(939,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(940,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(941,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(942,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(943,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(944,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(945,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(946,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(947,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(948,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(949,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(950,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(951,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(952,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(953,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(954,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(955,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(956,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(957,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(958,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(959,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(960,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(961,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(962,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(963,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(964,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(965,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(966,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,10,NULL),(967,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(968,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(969,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(970,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(971,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(972,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(973,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(974,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(975,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(976,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(977,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(978,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(979,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(980,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(981,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(982,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(983,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(984,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(985,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(986,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(987,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(988,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(989,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(990,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(991,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(992,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(993,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(994,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(995,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(996,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(997,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(998,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(999,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(1000,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(1001,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,2,NULL),(1002,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1003,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1004,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1005,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1006,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1007,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1008,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1009,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1010,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1011,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1012,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1013,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1014,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1015,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1016,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1017,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1018,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1019,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1020,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1021,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1022,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1023,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1024,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1025,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:17','2017-05-10 05:35:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1026,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1027,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1028,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1029,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1030,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1031,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1032,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1033,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1034,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1035,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1036,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,5,NULL),(1037,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1038,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1039,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1040,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1041,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1042,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1043,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1044,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1045,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1046,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1047,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1048,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1049,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1050,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1051,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1052,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1053,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1054,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1055,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1056,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1057,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1058,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1059,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1060,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1061,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1062,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1063,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1064,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1065,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1066,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1067,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1068,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1069,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1070,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1071,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,3,NULL),(1072,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1073,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1074,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1075,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1076,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1077,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1078,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1079,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1080,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1081,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1082,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1083,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1084,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1085,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1086,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1087,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1088,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1089,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1090,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1091,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1092,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1093,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1094,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1095,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1096,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1097,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1098,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1099,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1100,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1101,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1102,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1103,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1104,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1105,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1106,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,6,NULL),(1107,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1108,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1109,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1110,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1111,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1112,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1113,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1114,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1115,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1116,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1117,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1118,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:18','2017-05-10 05:35:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1119,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1120,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1121,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1122,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1123,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1124,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1125,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1126,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1127,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1128,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1129,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1130,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1131,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1132,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1133,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1134,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1135,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1136,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1137,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1138,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1139,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1140,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1141,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,8,NULL),(1142,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1143,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1144,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1145,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1146,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1147,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1148,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1149,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1150,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1151,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1152,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1153,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1154,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1155,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1156,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1157,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1158,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1159,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1160,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1161,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1162,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1163,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1164,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1165,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1166,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1167,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1168,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1169,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1170,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1171,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1172,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1173,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1174,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1175,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1176,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,2,NULL),(1177,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1178,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1179,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1180,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1181,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1182,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1183,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1184,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1185,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1186,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1187,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1188,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1189,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1190,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1191,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1192,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1193,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1194,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1195,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1196,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1197,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1198,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1199,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1200,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1201,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1202,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1203,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1204,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1205,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1206,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1207,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1208,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1209,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1210,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:19','2017-05-10 05:35:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1211,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(1212,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1213,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1214,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1215,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1216,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1217,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1218,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1219,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1220,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1221,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1222,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1223,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1224,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1225,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1226,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1227,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1228,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1229,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1230,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1231,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1232,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1233,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1234,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1235,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1236,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1237,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1238,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1239,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1240,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1241,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1242,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1243,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1244,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1245,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1246,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(1247,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1248,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1249,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1250,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1251,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1252,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1253,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1254,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1255,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1256,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1257,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1258,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1259,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1260,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1261,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1262,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1263,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1264,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1265,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1266,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1267,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1268,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1269,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1270,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1271,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1272,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1273,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1274,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1275,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1276,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1277,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1278,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1279,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1280,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1281,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(1282,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1283,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1284,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1285,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1286,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1287,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1288,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1289,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1290,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1291,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1292,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1293,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1294,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1295,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1296,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1297,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1298,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1299,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1300,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1301,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1302,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1303,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1304,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:20','2017-05-10 05:35:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1305,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1306,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1307,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1308,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1309,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1310,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1311,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1312,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1313,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1314,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1315,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1316,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,8,NULL),(1317,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1318,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1319,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1320,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1321,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1322,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1323,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1324,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1325,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1326,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1327,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1328,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1329,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1330,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1331,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1332,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1333,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1334,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1335,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1336,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1337,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1338,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1339,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1340,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1341,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1342,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1343,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1344,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1345,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1346,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1347,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1348,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1349,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1350,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1351,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(1352,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1353,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1354,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1355,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1356,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1357,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1358,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1359,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1360,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1361,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1362,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1363,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1364,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1365,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1366,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1367,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1368,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1369,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1370,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1371,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1372,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1373,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1374,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1375,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1376,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1377,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1378,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1379,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1380,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1381,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1382,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1383,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1384,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1385,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1386,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,4,NULL),(1387,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1388,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1389,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1390,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1391,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1392,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:21','2017-05-10 05:35:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1393,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1394,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1395,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1396,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1397,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1398,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1399,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1400,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1401,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1402,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1403,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1404,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1405,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1406,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1407,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1408,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1409,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1410,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1411,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1412,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1413,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1414,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1415,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1416,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1417,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1418,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1419,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1420,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1421,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,10,NULL),(1422,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1423,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1424,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1425,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1426,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1427,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1428,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1429,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1430,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1431,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1432,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1433,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1434,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1435,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1436,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1437,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1438,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1439,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1440,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1441,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1442,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1443,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1444,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1445,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1446,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1447,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1448,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1449,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1450,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1451,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1452,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1453,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1454,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1455,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1456,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,8,NULL),(1457,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1458,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1459,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1460,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1461,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1462,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1463,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1464,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1465,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1466,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1467,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1468,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1469,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1470,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1471,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1472,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1473,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1474,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1475,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1476,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1477,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1478,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1479,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1480,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1481,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1482,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1483,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:22','2017-05-10 05:35:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1484,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1485,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1486,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1487,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1488,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1489,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1490,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1491,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,9,NULL),(1492,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1493,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1494,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1495,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1496,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1497,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1498,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1499,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1500,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1501,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1502,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1503,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1504,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1505,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1506,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1507,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1508,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1509,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1510,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1511,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1512,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1513,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1514,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1515,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1516,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1517,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1518,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1519,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1520,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1521,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1522,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1523,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1524,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1525,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1526,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,2,NULL),(1527,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1528,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1529,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1530,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1531,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1532,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1533,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1534,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1535,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1536,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1537,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1538,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1539,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1540,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1541,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1542,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1543,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1544,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1545,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1546,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1547,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1548,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1549,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1550,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1551,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1552,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1553,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1554,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1555,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1556,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1557,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1558,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1559,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1560,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1561,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,10,NULL),(1562,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1563,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1564,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1565,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1566,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1567,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1568,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1569,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1570,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1571,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1572,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:23','2017-05-10 05:35:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1573,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1574,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1575,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1576,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1577,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1578,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1579,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1580,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1581,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1582,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1583,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1584,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1585,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1586,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1587,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1588,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1589,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1590,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1591,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1592,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1593,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1594,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1595,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1596,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,10,NULL),(1597,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1598,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1599,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1600,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1601,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1602,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1603,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1604,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1605,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1606,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1607,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1608,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1609,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1610,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1611,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1612,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1613,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1614,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1615,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1616,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1617,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1618,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1619,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1620,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1621,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1622,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1623,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1624,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1625,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1626,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1627,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1628,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1629,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1630,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1631,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,2,NULL),(1632,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1633,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1634,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1635,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1636,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1637,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1638,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1639,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1640,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1641,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1642,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1643,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1644,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1645,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1646,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1647,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1648,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1649,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1650,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1651,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1652,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1653,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1654,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1655,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1656,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1657,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1658,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1659,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:24','2017-05-10 05:35:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1660,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1661,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1662,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1663,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1664,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1665,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1666,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,9,NULL),(1667,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1668,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1669,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1670,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1671,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1672,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1673,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1674,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1675,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1676,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1677,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1678,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1679,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1680,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1681,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1682,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1683,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1684,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1685,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1686,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1687,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1688,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1689,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1690,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1691,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1692,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1693,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1694,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1695,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1696,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1697,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1698,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1699,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1700,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1701,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,38,10,NULL),(1702,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1703,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1704,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1705,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1706,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1707,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1708,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1709,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1710,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1711,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1712,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1713,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1714,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1715,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1716,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1717,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1718,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1719,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1720,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1721,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1722,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1723,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1724,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1725,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1726,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1727,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1728,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1729,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1730,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1731,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1732,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1733,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1734,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1735,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1736,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39,8,NULL),(1737,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1738,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1739,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1740,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1741,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1742,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1743,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1744,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:25','2017-05-10 05:35:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1745,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1746,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1747,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1748,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1749,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1750,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1751,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1752,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1753,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1754,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1755,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1756,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1757,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1758,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1759,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1760,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1761,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1762,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1763,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1764,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1765,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1766,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1767,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1768,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1769,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1770,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1771,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,2,NULL),(1772,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1773,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1774,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1775,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1776,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1777,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1778,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1779,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1780,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1781,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1782,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1783,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1784,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1785,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1786,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1787,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1788,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1789,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1790,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1791,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1792,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1793,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1794,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1795,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1796,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1797,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1798,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1799,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1800,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1801,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1802,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1803,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1804,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1805,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1806,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41,5,NULL),(1807,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1808,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1809,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1810,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1811,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1812,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1813,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1814,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1815,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1816,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1817,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1818,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1819,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1820,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1821,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1822,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1823,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1824,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1825,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1826,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1827,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1828,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:26','2017-05-10 05:35:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1829,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1830,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1831,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1832,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1833,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1834,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1835,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1836,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1837,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1838,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1839,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1840,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1841,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,4,NULL),(1842,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1843,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1844,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1845,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1846,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1847,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1848,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1849,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1850,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1851,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1852,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1853,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1854,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1855,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1856,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1857,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1858,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1859,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1860,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1861,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1862,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1863,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1864,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1865,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1866,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1867,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1868,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1869,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1870,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1871,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1872,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1873,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1874,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1875,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1876,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,8,NULL),(1877,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1878,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1879,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1880,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1881,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1882,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1883,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1884,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1885,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1886,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1887,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1888,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1889,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1890,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1891,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1892,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1893,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1894,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1895,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1896,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1897,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1898,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1899,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1900,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1901,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1902,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1903,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1904,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1905,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1906,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1907,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1908,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1909,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1910,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1911,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44,8,NULL),(1912,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1913,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:27','2017-05-10 05:35:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1914,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1915,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1916,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1917,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1918,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1919,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1920,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1921,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1922,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1923,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1924,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1925,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1926,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1927,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1928,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1929,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1930,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1931,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1932,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1933,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1934,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1935,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1936,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1937,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1938,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1939,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1940,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1941,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1942,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1943,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1944,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1945,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1946,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,45,8,NULL),(1947,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1948,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1949,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1950,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1951,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1952,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1953,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1954,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1955,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1956,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1957,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1958,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1959,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1960,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1961,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1962,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1963,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1964,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1965,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1966,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1967,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1968,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1969,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1970,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1971,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1972,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1973,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1974,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1975,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1976,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1977,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1978,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1979,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1980,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1981,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,4,NULL),(1982,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1983,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1984,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1985,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1986,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1987,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1988,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1989,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1990,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1991,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1992,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1993,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1994,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1995,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1996,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1997,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1998,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(1999,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:28','2017-05-10 05:35:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2000,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2001,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2002,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2003,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2004,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2005,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2006,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2007,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2008,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2009,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2010,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2011,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2012,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2013,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2014,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2015,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2016,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,47,8,NULL),(2017,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2018,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2019,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2020,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2021,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2022,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2023,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2024,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2025,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2026,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2027,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2028,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2029,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2030,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2031,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2032,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2033,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2034,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2035,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2036,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2037,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2038,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2039,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2040,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2041,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2042,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2043,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2044,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2045,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2046,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2047,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2048,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2049,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2050,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2051,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,4,NULL),(2052,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2053,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2054,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2055,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2056,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2057,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2058,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2059,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2060,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2061,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2062,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2063,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2064,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2065,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2066,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2067,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2068,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2069,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2070,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2071,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2072,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2073,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2074,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2075,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2076,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2077,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2078,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2079,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2080,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2081,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2082,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2083,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:29','2017-05-10 05:35:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2084,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2085,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2086,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,10,NULL),(2087,'2017-05-07','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2088,'2017-05-14','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2089,'2017-05-21','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2090,'2017-05-28','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2091,'2017-06-04','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2092,'2017-06-11','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2093,'2017-06-18','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2094,'2017-06-25','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2095,'2017-07-02','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2096,'2017-07-09','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2097,'2017-07-16','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2098,'2017-07-23','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2099,'2017-07-30','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2100,'2017-08-06','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2101,'2017-08-13','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2102,'2017-08-20','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2103,'2017-08-27','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2104,'2017-09-03','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2105,'2017-09-10','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2106,'2017-09-17','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2107,'2017-09-24','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2108,'2017-10-01','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2109,'2017-10-08','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2110,'2017-10-15','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2111,'2017-10-22','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2112,'2017-10-29','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2113,'2017-11-05','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2114,'2017-11-12','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2115,'2017-11-19','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2116,'2017-11-26','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2117,'2017-12-03','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2118,'2017-12-10','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2119,'2017-12-17','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2120,'2017-12-24','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2121,'2017-12-31','W',NULL,NULL,0,'2017-05-10 05:35:30','2017-05-10 05:35:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,5,NULL),(2774,'2017-05-04',NULL,'2017-05-22 09:27:00','2017-05-22 17:43:00',0,'2017-05-22 12:45:51','2017-05-22 12:45:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,NULL,NULL);
/*!40000 ALTER TABLE `employee_attendances` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
INSERT INTO `employee_bank_details` VALUES (1,1,'15631930001836','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(2,2,'111000117663','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(3,3,'16711000007725','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(4,4,'261050084283','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(5,5,'15631050020702','HDFC','New Rajinder Nagar',NULL,'0','0','0','HDFC0000931','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(6,6,'9351050012215','HDFC','Netaji Subhash Place',NULL,'0','0','0','HDFC0000935','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(7,7,'15631050020952','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(8,8,'15631050020986','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(9,9,'50100048994828','HDFC','Noida Sec 110',NULL,'0','0','0','HDFC0000930','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(10,10,'50100078806291','HDFC','Connaught Place        ',NULL,'0','0','0','HDFC0001563','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(11,11,'50100071533249','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(12,12,'50100193081595','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(13,13,'50100169223763','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(14,14,'1321530013893','HDFC','Palam',NULL,'0','0','0','HDFC0000132','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(15,15,'5571050007741','HDFC','Greater Kailash-II, New Delhi        ',NULL,'0','0','0','HDFC0000557','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(16,16,'50100169224269','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(17,17,'50100169224154','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(18,18,'50100173390522','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(19,19,'2711050065355','HDFC','Kalkaji','cc31,kalkaji','0','0','0','HDFC0000271','2017-05-02 07:41:45','2017-05-02 11:39:52',22),(20,20,'261050084293','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(21,21,'10691050019834','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(22,22,'50100085472581','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(23,23,'50100085472605','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(24,24,'50100078806150','HDFC','Connaught Place        ',NULL,'0','0','0','HDFC0001563','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(25,25,'50100118310550','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(26,26,'50100193082112','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(27,27,'50100103365510','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(28,28,'50100118310202','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(29,29,'50100118310610','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(30,30,'50100118310649','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(31,31,'50100118310725','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(32,32,'50100105617901','HDFC','Chuna Mandi ,Paharganj, New Delhi',NULL,'0','0','0','HDFC0003687','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(33,33,'50100105618009','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(34,34,'50100105617937','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(35,35,'50100105617861','HDFC','Chunamandi Paharganj',NULL,'0','0','0','HDFC0003687','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(36,36,'50100120102699','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(37,37,'50100169223740','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(38,38,'50100169223701','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(39,39,'50100169224193','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(40,40,'50100184929312','HDFC','Jhandewalan Extension',NULL,'0','0','0','HDFC0004754','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(41,41,'50100183683360','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(42,42,'50100173390532','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(43,43,'50100173390519','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(44,44,'50100186398973','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(45,45,'15631050020890','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(46,46,'50100186398999','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026 ','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(47,47,'50100186399887','HDFC',NULL,NULL,'0','0','0',NULL,'2017-05-02 07:41:45','2017-05-02 07:41:45',22),(48,48,'50100186399861','HDFC','Old Rajinder Nagar',NULL,'0','0','0','HDFC0000026','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(49,49,'50100053916646','HDFC','Barakhamba Road New Delhi 110001',NULL,'0','0','0','HDFC0000708','2017-05-02 07:41:45','2017-05-02 07:41:45',22),(50,50,'50100171742918','HDFC','Ahura Centre, Gr. Floor, Mahakali Caves Road, Andheri (E), Mumbai-400093.',NULL,'0','0','0','HDFC0000543','2017-05-02 07:41:45','2017-05-02 07:41:45',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'1','Director','',NULL,'2017-04-20 07:00:40','2017-04-25 06:09:56',1),(2,'2','Staff','',NULL,'2017-04-20 07:00:40','2017-04-25 06:10:45',1),(3,'3','Worker','',NULL,'2017-04-20 07:00:40','2017-04-25 06:10:54',0),(4,'4','Senior Staff','',NULL,'2017-04-25 06:10:38','2017-04-25 06:10:38',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_code_masters`
--

LOCK TABLES `employee_code_masters` WRITE;
/*!40000 ALTER TABLE `employee_code_masters` DISABLE KEYS */;
INSERT INTO `employee_code_masters` VALUES (1,'Permanent','1001','1127',1,NULL,'2017-04-21 09:03:24','2017-05-01 05:55:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (61,'1.0','3D & GRAPHIC DESIGNER',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(62,'2.0','Accounts Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(63,'3.0','Alliance Associate',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(64,'4.0','Asst Manager - Lead Generation',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(65,'5.0','Asst Manager - Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(66,'6.0','Asst Manager Database',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(67,'7.0','Branch Operation Lead',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(68,'8.0','Client Servicing - Associate Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(69,'9.0','Content Writer',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(70,'10.0','Creative  - Lead',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(71,'11.0','Database Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(72,'12.0','Director',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(73,'13.0','Deputy Manager Accounts','',NULL,'2017-04-25 13:18:22','2017-05-02 04:55:48'),(74,'14.0','Executive - Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(75,'15.0','Executive Conversational',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(76,'16.0','Executive Conversational Specialist',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(77,'17.0','Executive DemandCom',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(78,'18.0','Executive-Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(79,'19.0','HR Associate',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(80,'20.0','Manager - Database',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(81,'21.0','Manager - DemandCOM',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(82,'22.0','Operation Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(83,'23.0','Program Associates Rewards',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(84,'24.0','SEO Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(85,'25.0','Sr Business Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(86,'26.0','Sr Creative - Graphic & 3D',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(87,'27.0','Sr Executive Client Servicing - Operation',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(88,'28.0','Sr Executive Demand Com',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(89,'29.0','Sr Team Lead -Conversational',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(90,'30.0','Sr.Business Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(91,'31.0','TL- Conversational Specialist',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'1.0','G',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
/*!40000 ALTER TABLE `employee_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_jc_lists`
--

DROP TABLE IF EXISTS `employee_jc_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_jc_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joining_checklist_master_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_jc_lists_on_joining_checklist_master_id` (`joining_checklist_master_id`),
  KEY `index_employee_jc_lists_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_e835de41c6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_3246ca44bd` FOREIGN KEY (`joining_checklist_master_id`) REFERENCES `joining_checklist_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_jc_lists`
--

LOCK TABLES `employee_jc_lists` WRITE;
/*!40000 ALTER TABLE `employee_jc_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_jc_lists` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (49,4,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(50,5,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(51,6,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(52,7,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(53,8,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(54,9,2,NULL,'4.5',NULL,'6.0','2017-04-25 13:38:47','2017-05-03 09:58:54',NULL,'2017-01-01','2017-12-31',1),(55,10,2,NULL,'4.5',NULL,'4.5','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(56,11,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(57,12,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(58,13,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(59,14,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(60,15,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(61,16,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(62,17,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(63,18,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(64,19,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(65,20,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(66,21,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(67,22,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(68,23,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(69,24,2,NULL,'5.5',NULL,'6.0','2017-04-25 13:38:47','2017-05-03 08:30:22',NULL,'2017-01-01','2017-12-31',1),(70,25,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(71,26,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(72,27,2,NULL,'0',NULL,'0','2017-04-25 13:38:47','2017-05-02 11:58:12',NULL,'2017-01-01','2017-12-31',1),(73,28,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(74,29,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(75,30,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(76,31,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(77,32,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(78,33,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(79,34,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(80,35,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(81,36,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(82,37,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(83,38,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(84,39,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(85,40,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(86,41,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(87,42,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(88,43,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(89,44,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(90,45,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(91,46,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(92,47,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(93,48,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(94,49,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(95,50,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(96,4,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(97,5,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(98,6,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(99,7,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(100,8,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(101,9,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(102,10,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(103,11,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(104,12,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(105,13,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(106,14,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(107,15,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(108,16,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(109,17,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(110,18,7,NULL,'4.0',NULL,'4.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(111,19,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(112,20,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(113,21,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(114,22,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(115,23,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(116,24,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(117,25,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(118,26,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(119,27,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(120,28,7,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(121,29,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(122,30,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(123,31,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(124,32,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(125,33,7,NULL,'4.0',NULL,'4.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(126,34,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(127,35,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(128,36,7,NULL,'0.0',NULL,'6.0','2017-04-25 13:38:47','2017-05-08 06:38:43',NULL,'2017-01-01','2017-12-31',1),(129,37,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(130,38,7,NULL,'5.0',NULL,'5.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(131,39,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(132,40,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(133,41,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(134,42,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(135,43,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(136,44,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(137,45,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(138,46,7,NULL,'0',NULL,'6.0','2017-04-25 13:38:47','2017-05-02 12:08:51',NULL,'2017-01-01','2017-12-31',1),(139,47,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(140,48,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(141,49,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,'2017-01-01','2017-12-31',1),(142,50,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(143,4,1,NULL,'3',NULL,'6.0','2017-04-25 13:38:48','2017-05-03 08:24:39',NULL,'2017-01-01','2017-12-31',1),(144,5,1,NULL,'5.5',NULL,'7.0','2017-04-25 13:38:48','2017-05-15 07:11:49',NULL,'2017-01-01','2017-12-31',1),(145,6,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(146,7,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(147,8,1,NULL,'4.5',NULL,'9.5','2017-04-25 13:38:48','2017-05-02 11:55:10',NULL,'2017-01-01','2017-12-31',1),(148,9,1,NULL,'0.5',NULL,'0.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(149,10,1,NULL,'1.0',NULL,'1.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(150,11,1,NULL,'4.0',NULL,'8.0','2017-04-25 13:38:48','2017-05-03 05:13:04',NULL,'2017-01-01','2017-12-31',1),(151,12,1,NULL,'8',NULL,'10.0','2017-04-25 13:38:48','2017-05-02 11:56:22',NULL,'2017-01-01','2017-12-31',1),(152,13,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(153,14,1,NULL,'1.0',NULL,'7.0','2017-04-25 13:38:48','2017-05-02 12:06:02',NULL,'2017-01-01','2017-12-31',1),(154,15,1,NULL,'8.5',NULL,'8.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(155,16,1,NULL,'9.5',NULL,'9.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(156,17,1,NULL,'8.5',NULL,'8.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(157,18,1,NULL,'0',NULL,'3.0','2017-04-25 13:38:48','2017-05-02 12:08:07',NULL,'2017-01-01','2017-12-31',1),(158,19,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(159,20,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(160,21,1,NULL,'6.0',NULL,'7.0','2017-04-25 13:38:48','2017-05-02 11:54:20',NULL,'2017-01-01','2017-12-31',1),(161,22,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(162,23,1,NULL,'5.0',NULL,'5.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(163,24,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(164,25,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(165,26,1,NULL,'11.0',NULL,'11.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(166,27,1,NULL,'0',NULL,'2.0','2017-04-25 13:38:48','2017-05-02 11:59:54',NULL,'2017-01-01','2017-12-31',1),(167,28,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(168,29,1,NULL,'8',NULL,'9.0','2017-04-25 13:38:48','2017-05-02 12:00:55',NULL,'2017-01-01','2017-12-31',1),(169,30,1,NULL,'5.5',NULL,'7.0','2017-04-25 13:38:48','2017-05-02 12:01:30',NULL,'2017-01-01','2017-12-31',1),(170,31,1,NULL,'7',NULL,'8.0','2017-04-25 13:38:48','2017-05-02 12:02:09',NULL,'2017-01-01','2017-12-31',1),(171,32,1,NULL,'7.5',NULL,'7.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(172,33,1,NULL,'6',NULL,'7.5','2017-04-25 13:38:48','2017-05-02 12:03:00',NULL,'2017-01-01','2017-12-31',1),(173,34,1,NULL,'5.0',NULL,'6.0','2017-04-25 13:38:48','2017-05-02 12:03:35',NULL,'2017-01-01','2017-12-31',1),(174,35,1,NULL,'0',NULL,'2.0','2017-04-25 13:38:48','2017-05-03 09:44:04',NULL,'2017-01-01','2017-12-31',1),(175,36,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(176,37,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(177,38,1,NULL,'7.5',NULL,'8.5','2017-04-25 13:38:48','2017-05-02 12:06:38',NULL,'2017-01-01','2017-12-31',1),(178,39,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(179,40,1,NULL,'6',NULL,'7.0','2017-04-25 13:38:48','2017-05-02 12:07:27',NULL,'2017-01-01','2017-12-31',1),(180,41,1,NULL,'11.0',NULL,'12.0','2017-04-25 13:38:48','2017-05-09 06:51:14',NULL,'2017-01-01','2017-12-31',1),(181,42,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(182,43,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(183,44,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(184,45,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(185,46,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(186,47,1,NULL,'6.5',NULL,'10.5','2017-04-25 13:38:48','2017-05-02 12:09:57',NULL,'2017-01-01','2017-12-31',1),(187,48,1,NULL,'7.5',NULL,'7.5','2017-04-25 13:38:48','2017-05-09 12:09:59',NULL,'2017-01-01','2017-12-31',1),(188,49,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(189,50,1,NULL,'2.0',NULL,'2.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,'2017-01-01','2017-12-31',1),(190,45,6,NULL,'1',NULL,'1','2017-05-03 04:59:23','2017-05-03 04:59:23',NULL,NULL,NULL,1),(191,16,6,NULL,'2.0',NULL,'2.0','2017-05-03 05:00:04','2017-05-03 05:00:23',NULL,NULL,NULL,1),(192,4,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(193,5,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(194,6,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(195,7,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(196,8,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(197,9,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(198,10,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(199,11,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(200,12,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(201,13,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(202,14,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(203,15,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(204,16,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(205,17,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(206,18,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(207,19,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(208,20,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(209,21,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(210,22,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(211,23,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(212,24,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(213,25,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(214,26,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(215,27,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(216,28,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(217,29,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(218,30,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(219,31,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(220,32,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(221,33,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(222,34,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(223,35,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(224,36,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(225,37,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(226,38,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(227,39,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(228,40,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(229,41,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(230,42,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(231,43,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(232,44,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(233,45,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(234,46,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(235,47,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(236,48,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(237,49,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1),(238,50,8,NULL,'1',NULL,'1','2017-05-19 07:28:58','2017-05-19 07:28:58',NULL,'2017-05-01','2017-05-31',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_requests`
--

LOCK TABLES `employee_leav_requests` WRITE;
/*!40000 ALTER TABLE `employee_leav_requests` DISABLE KEYS */;
INSERT INTO `employee_leav_requests` VALUES (2,5,1,'Full Day','2017-05-06 00:00:00','2017-05-06 00:00:00',NULL,NULL,1.0,NULL,NULL,'Personal Work',1,0,1,0,0,0,2,NULL,NULL,'2017-05-03 04:53:40','2017-05-08 11:37:00',2,1),(3,11,1,'Full Day','2017-05-15 00:00:00','2017-05-18 00:00:00',NULL,NULL,4.0,NULL,NULL,'Personal',1,0,1,0,0,0,2,NULL,NULL,'2017-05-03 05:13:04','2017-05-03 05:27:46',20,2),(4,36,7,'Full Day','2017-05-01 00:00:00','2017-05-06 00:00:00',NULL,NULL,6.0,NULL,NULL,'Suffering from food poisoning. Was present in second half on 3/5/2017',1,0,0,0,0,0,0,NULL,NULL,'2017-05-08 06:38:43','2017-05-08 06:38:43',5,NULL),(5,41,1,'Full Day','2017-05-12 00:00:00','2017-05-12 00:00:00',NULL,NULL,1.0,NULL,NULL,'Leave for shab-e-baraat festival',1,0,0,0,0,0,0,NULL,NULL,'2017-05-09 06:51:14','2017-05-09 06:51:14',3,NULL),(6,5,1,'Half Day','2017-05-15 00:00:00','2017-05-15 00:00:00',NULL,NULL,0.5,0,1,'Hospital',1,0,0,0,0,0,0,NULL,NULL,'2017-05-15 07:11:49','2017-05-15 07:11:49',2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_physicals`
--

LOCK TABLES `employee_physicals` WRITE;
/*!40000 ALTER TABLE `employee_physicals` DISABLE KEYS */;
INSERT INTO `employee_physicals` VALUES (1,26,'152(cm)','40(kg)','S','28','2017-05-02 08:50:21','2017-05-02 08:50:21'),(2,44,'170CM','50','S','30','2017-05-02 08:59:48','2017-05-02 08:59:48'),(3,29,'5\'6\"','49','M','','2017-05-02 09:05:04','2017-05-02 09:05:04'),(4,47,'182','81','XL','34','2017-05-02 09:07:23','2017-05-02 09:07:23'),(5,45,'5.9','82','XL','36','2017-05-02 09:08:13','2017-05-02 09:08:13'),(6,43,'5','50','S','28','2017-05-02 09:19:19','2017-05-02 09:19:19'),(7,48,'179','82','XL','32','2017-05-02 09:22:24','2017-05-02 09:22:24'),(8,32,'5.10(1.78)','50 (110.231)','XL','40','2017-05-02 09:33:15','2017-05-02 09:33:15'),(9,30,'5','49','XS','28','2017-05-02 09:41:31','2017-05-02 09:41:31'),(10,13,'5.2','85','XXL','38','2017-05-02 09:53:36','2017-05-02 09:53:36'),(11,34,'5.9','72','L','34','2017-05-02 10:01:48','2017-05-02 10:01:48'),(12,17,'5.3','53','S','28','2017-05-02 10:13:17','2017-05-02 10:13:17'),(13,23,'5.3','54','S','32','2017-05-02 10:25:08','2017-05-02 10:25:08'),(14,25,'175.26cm','81 Kg ','XL','34','2017-05-02 10:33:38','2017-05-02 10:33:38'),(15,18,'177','65','L','34','2017-05-02 10:43:46','2017-05-02 10:43:46'),(16,8,'5.8','85','XL','36','2017-05-02 10:50:02','2017-05-02 10:50:02'),(17,31,'172','74','L','34','2017-05-02 11:03:49','2017-05-02 11:03:49'),(18,2,'177','68','L','34','2017-05-02 11:31:33','2017-05-02 11:31:33'),(19,19,'5.8','67','M','32','2017-05-02 11:43:59','2017-05-02 11:43:59'),(20,36,'5\'5','67','M','30','2017-05-08 06:31:22','2017-05-08 06:31:22');
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
  CONSTRAINT `fk_rails_44a698c5ef` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_093db97005` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_19e6edf49d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_templates`
--

LOCK TABLES `employee_salary_templates` WRITE;
/*!40000 ALTER TABLE `employee_salary_templates` DISABLE KEYS */;
INSERT INTO `employee_salary_templates` VALUES (1,1,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,35000.00,420000.00,1,'2017-04-26 04:55:50','2017-05-02 05:07:35',1,NULL),(2,1,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,17500.00,210000.00,1,'2017-04-26 04:55:50','2017-05-02 05:07:35',1,NULL),(3,1,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,1,'2017-04-26 04:55:50','2017-05-02 05:07:35',1,NULL),(4,1,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,1,'2017-04-26 04:55:50','2017-05-02 05:07:35',1,NULL),(5,1,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,14650.00,175800.00,1,'2017-04-26 04:55:50','2017-05-02 05:07:35',1,NULL),(6,2,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,37500.00,450000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(7,2,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,18750.00,225000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(8,2,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(9,2,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(10,2,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,15900.00,190800.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(11,3,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(12,3,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(13,3,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(14,3,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(15,3,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,24650.00,295800.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(16,4,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(17,4,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(18,4,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(19,4,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(20,4,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4650.00,55800.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(21,20,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(22,20,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(23,20,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(24,20,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(25,20,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(26,21,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,12500.00,150000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(27,21,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(28,21,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(29,21,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(30,21,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,11400.00,136800.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(31,5,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,42000.00,504000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(32,5,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,21000.00,252000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(33,5,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(34,5,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(35,5,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,18150.00,217800.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(36,6,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,13166.50,157992.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(37,6,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6583.25,78996.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(38,6,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(39,6,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(40,6,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3733.25,44796.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(41,7,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(42,7,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(43,7,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(44,7,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(45,7,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(46,8,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,14458.50,173496.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(47,8,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7229.25,86748.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(48,8,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(49,8,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(50,8,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4379.25,52548.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(51,9,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,24750.00,297000.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(52,9,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,12375.00,148500.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(53,9,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(54,9,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(55,9,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,9525.00,114300.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(56,22,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7750.00,93000.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(57,22,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3875.00,46500.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(58,22,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(59,22,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(60,22,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1025.00,12300.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(61,23,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,12500.00,150000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(62,23,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(63,23,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(64,23,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(65,23,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3400.00,40800.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(66,10,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(67,10,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(68,10,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(69,10,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(70,10,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(71,24,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10208.50,122496.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(72,24,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5104.25,61248.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(73,24,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(74,24,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(75,24,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2254.25,27048.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(76,25,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(77,25,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(78,25,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(79,25,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(80,25,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6650.00,79800.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(81,11,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,17500.00,210000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(82,11,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,8750.00,105000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(83,11,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(84,11,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(85,11,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5900.00,70800.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(86,12,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,28750.00,345000.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(87,12,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,14375.00,172500.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(88,12,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(89,12,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(90,12,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,11525.00,138300.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(91,26,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10666.50,127992.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(92,26,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5333.25,63996.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(93,26,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(94,26,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(95,26,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2483.25,29796.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(96,27,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,37500.00,450000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(97,27,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,18750.00,225000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(98,27,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(99,27,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(100,27,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,15900.00,190800.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(101,28,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,8250.00,99000.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(102,28,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4125.00,49500.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(103,28,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(104,28,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(105,28,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1275.00,15300.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(106,29,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,9416.50,112992.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(107,29,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4708.25,56496.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(108,29,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(109,29,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(110,29,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1858.25,22296.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(111,30,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10916.50,130992.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(112,30,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5458.25,65496.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(113,30,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(114,30,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(115,30,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2608.25,31296.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(116,31,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10541.50,126492.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(117,31,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5270.75,63240.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(118,31,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(119,31,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(120,31,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2420.75,29040.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(121,32,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6500.00,78000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(122,32,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3250.00,39000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(123,32,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(124,32,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(125,32,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,400.00,4800.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(126,33,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(127,33,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(128,33,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(129,33,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(130,33,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(131,34,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10000.00,120000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(132,34,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5000.00,60000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(133,34,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(134,34,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(135,34,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2150.00,25800.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(136,35,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10624.50,127488.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(137,35,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5312.25,63744.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(138,35,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(139,35,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(140,35,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2462.25,29544.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(141,36,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,11000.00,132000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(142,36,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5500.00,66000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(143,36,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(144,36,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(145,36,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,13150.00,157800.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(146,13,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,8500.00,102000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(147,13,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4250.00,51000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(148,13,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(149,13,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(150,13,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(151,37,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5500.00,66000.00,31,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(152,37,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2750.00,33000.00,31,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL,NULL),(153,37,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(154,37,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(155,37,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,-100.00,-1200.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(156,14,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,11500.00,138000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(157,14,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(158,14,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(159,14,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(160,14,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2900.00,34800.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(161,38,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,8041.50,96492.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(162,38,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4020.75,48240.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(163,38,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(164,38,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(165,38,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1170.75,14040.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(166,15,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,11541.50,138492.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(167,15,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5770.75,69240.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(168,15,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(169,15,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(170,15,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2920.75,35040.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(171,39,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7550.00,90600.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(172,39,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3775.00,45300.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(173,39,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(174,39,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(175,39,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,925.00,11100.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(176,16,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,12583.50,150996.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(177,16,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6291.75,75492.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(178,16,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(179,16,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(180,16,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3441.75,41292.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(181,40,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(182,40,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(183,40,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(184,40,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(185,40,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(186,41,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,8041.00,96492.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(187,41,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4020.50,48240.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(188,41,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(189,41,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(190,41,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1170.50,14040.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(191,17,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,20000.00,240000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(192,17,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10000.00,120000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(193,17,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(194,17,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(195,17,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7150.00,85800.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(196,42,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(197,42,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(198,42,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(199,42,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(200,42,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(201,43,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(202,43,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(203,43,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(204,43,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(205,43,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(206,18,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(207,18,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(208,18,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(209,18,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(210,18,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(211,44,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(212,44,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(213,44,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(214,44,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(215,44,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(216,45,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7916.50,94992.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(217,45,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3958.25,47496.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(218,45,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(219,45,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(220,45,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1108.25,13296.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(221,19,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,14000.00,168000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(222,19,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,7000.00,84000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(223,19,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(224,19,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(225,19,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,4150.00,49800.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(226,46,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(227,46,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(228,46,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(229,46,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(230,46,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(231,47,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(232,47,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3125.00,37500.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(233,47,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(234,47,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(235,47,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(236,48,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6249.50,74988.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(237,48,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3124.75,37488.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(238,48,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(239,48,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(240,48,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,274.75,3288.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(241,49,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,12000.00,144000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(242,49,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,6000.00,72000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(243,49,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(244,49,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(245,49,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,3150.00,37800.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(246,50,1,1,0,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(247,50,1,2,0,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(248,50,1,4,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(249,50,1,8,0,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL),(250,50,1,5,0,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_templates`
--

LOCK TABLES `employee_templates` WRITE;
/*!40000 ALTER TABLE `employee_templates` DISABLE KEYS */;
INSERT INTO `employee_templates` VALUES (1,1,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(2,2,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(3,3,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(4,4,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(5,20,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(6,21,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(7,5,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(8,6,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(9,7,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(10,8,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(11,9,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(12,22,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(13,23,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(14,10,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(15,24,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(16,25,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(17,11,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(18,12,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(19,26,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(20,27,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(21,28,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(22,29,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(23,30,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(24,31,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(25,32,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(26,33,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(27,34,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(28,35,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(29,36,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(30,13,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(31,37,1,1,'2017-04-26',NULL,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(32,14,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(33,38,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(34,15,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(35,39,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(36,16,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(37,40,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(38,41,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(39,17,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(40,42,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(41,43,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(42,18,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(43,44,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(44,45,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(45,19,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(46,46,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(47,47,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(48,48,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(49,49,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(50,50,1,1,'2017-04-26',NULL,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (1,'01','Trainee',NULL,NULL,'2017-04-20 07:00:40','2017-04-22 08:15:31'),(2,'02','Permanent',NULL,NULL,'2017-04-20 07:00:40','2017-04-22 08:15:37'),(3,'03','Probation',NULL,NULL,'2017-04-20 07:00:40','2017-04-24 04:52:20'),(4,'04','Resigned',NULL,NULL,'2017-04-20 07:00:40','2017-04-22 08:15:50'),(5,'05','Notice Period',NULL,NULL,'2017-04-20 09:33:20','2017-04-22 08:17:12'),(6,'11','Director',NULL,NULL,'2017-04-22 08:16:38','2017-04-22 08:16:38'),(7,'12','Senior Staff',NULL,NULL,'2017-04-22 08:16:51','2017-04-22 08:16:51'),(8,'13','Staff',NULL,NULL,'2017-04-22 08:17:02','2017-04-22 08:17:02');
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
  CONSTRAINT `fk_rails_f68e39d463` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4e2c1bbc27` FOREIGN KEY (`week_off_master_id`) REFERENCES `week_off_masters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1751 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_week_offs`
--

LOCK TABLES `employee_week_offs` WRITE;
/*!40000 ALTER TABLE `employee_week_offs` DISABLE KEYS */;
INSERT INTO `employee_week_offs` VALUES (1,1,1,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(2,1,1,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(3,1,1,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(4,1,1,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(5,1,1,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(6,1,1,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(7,1,1,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(8,1,1,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(9,1,1,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(10,1,1,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(11,1,1,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(12,1,1,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(13,1,1,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(14,1,1,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(15,1,1,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(16,1,1,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(17,1,1,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(18,1,1,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(19,1,1,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(20,1,1,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(21,1,1,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(22,1,1,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(23,1,1,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(24,1,1,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(25,1,1,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(26,1,1,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(27,1,1,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(28,1,1,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(29,1,1,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(30,1,1,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(31,1,1,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(32,1,1,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(33,1,1,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(34,1,1,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(35,1,1,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(36,2,2,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(37,2,2,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(38,2,2,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(39,2,2,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(40,2,2,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(41,2,2,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(42,2,2,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(43,2,2,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(44,2,2,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(45,2,2,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(46,2,2,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(47,2,2,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(48,2,2,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(49,2,2,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(50,2,2,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(51,2,2,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(52,2,2,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(53,2,2,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(54,2,2,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(55,2,2,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(56,2,2,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(57,2,2,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(58,2,2,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(59,2,2,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(60,2,2,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(61,2,2,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(62,2,2,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(63,2,2,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(64,2,2,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(65,2,2,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(66,2,2,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(67,2,2,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(68,2,2,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(69,2,2,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(70,2,2,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(71,3,3,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(72,3,3,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(73,3,3,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(74,3,3,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(75,3,3,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(76,3,3,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(77,3,3,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(78,3,3,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:11','2017-05-10 05:35:11'),(79,3,3,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(80,3,3,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(81,3,3,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(82,3,3,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(83,3,3,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(84,3,3,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(85,3,3,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(86,3,3,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(87,3,3,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(88,3,3,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(89,3,3,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(90,3,3,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(91,3,3,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(92,3,3,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(93,3,3,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(94,3,3,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(95,3,3,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(96,3,3,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(97,3,3,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(98,3,3,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(99,3,3,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(100,3,3,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(101,3,3,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(102,3,3,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(103,3,3,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(104,3,3,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(105,3,3,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(106,4,4,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(107,4,4,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(108,4,4,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(109,4,4,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(110,4,4,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(111,4,4,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(112,4,4,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(113,4,4,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(114,4,4,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(115,4,4,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(116,4,4,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(117,4,4,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(118,4,4,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(119,4,4,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(120,4,4,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(121,4,4,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(122,4,4,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(123,4,4,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(124,4,4,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(125,4,4,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(126,4,4,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(127,4,4,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(128,4,4,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(129,4,4,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(130,4,4,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(131,4,4,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(132,4,4,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(133,4,4,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(134,4,4,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(135,4,4,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(136,4,4,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(137,4,4,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(138,4,4,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(139,4,4,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(140,4,4,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(141,5,5,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(142,5,5,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(143,5,5,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(144,5,5,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(145,5,5,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(146,5,5,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(147,5,5,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(148,5,5,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(149,5,5,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(150,5,5,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(151,5,5,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(152,5,5,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(153,5,5,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(154,5,5,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(155,5,5,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(156,5,5,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(157,5,5,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(158,5,5,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(159,5,5,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(160,5,5,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(161,5,5,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(162,5,5,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(163,5,5,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(164,5,5,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(165,5,5,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(166,5,5,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(167,5,5,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(168,5,5,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(169,5,5,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(170,5,5,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(171,5,5,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(172,5,5,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(173,5,5,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(174,5,5,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(175,5,5,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(176,6,6,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(177,6,6,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(178,6,6,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(179,6,6,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(180,6,6,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(181,6,6,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(182,6,6,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:12','2017-05-10 05:35:12'),(183,6,6,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(184,6,6,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(185,6,6,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(186,6,6,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(187,6,6,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(188,6,6,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(189,6,6,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(190,6,6,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(191,6,6,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(192,6,6,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(193,6,6,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(194,6,6,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(195,6,6,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(196,6,6,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(197,6,6,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(198,6,6,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(199,6,6,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(200,6,6,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(201,6,6,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(202,6,6,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(203,6,6,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(204,6,6,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(205,6,6,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(206,6,6,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(207,6,6,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(208,6,6,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(209,6,6,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(210,6,6,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(211,7,7,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(212,7,7,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(213,7,7,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(214,7,7,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(215,7,7,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(216,7,7,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(217,7,7,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(218,7,7,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(219,7,7,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(220,7,7,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(221,7,7,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(222,7,7,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(223,7,7,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(224,7,7,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(225,7,7,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(226,7,7,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(227,7,7,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(228,7,7,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(229,7,7,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(230,7,7,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(231,7,7,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(232,7,7,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(233,7,7,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(234,7,7,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(235,7,7,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(236,7,7,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(237,7,7,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(238,7,7,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(239,7,7,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(240,7,7,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(241,7,7,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(242,7,7,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(243,7,7,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(244,7,7,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(245,7,7,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(246,8,8,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(247,8,8,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(248,8,8,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(249,8,8,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(250,8,8,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(251,8,8,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(252,8,8,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(253,8,8,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(254,8,8,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(255,8,8,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(256,8,8,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(257,8,8,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(258,8,8,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(259,8,8,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(260,8,8,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(261,8,8,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(262,8,8,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(263,8,8,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(264,8,8,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(265,8,8,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(266,8,8,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(267,8,8,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(268,8,8,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(269,8,8,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(270,8,8,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(271,8,8,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(272,8,8,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(273,8,8,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(274,8,8,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(275,8,8,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(276,8,8,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(277,8,8,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(278,8,8,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(279,8,8,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(280,8,8,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(281,9,9,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:13','2017-05-10 05:35:13'),(282,9,9,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(283,9,9,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(284,9,9,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(285,9,9,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(286,9,9,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(287,9,9,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(288,9,9,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(289,9,9,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(290,9,9,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(291,9,9,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(292,9,9,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(293,9,9,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(294,9,9,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(295,9,9,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(296,9,9,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(297,9,9,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(298,9,9,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(299,9,9,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(300,9,9,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(301,9,9,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(302,9,9,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(303,9,9,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(304,9,9,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(305,9,9,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(306,9,9,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(307,9,9,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(308,9,9,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(309,9,9,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(310,9,9,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(311,9,9,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(312,9,9,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(313,9,9,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(314,9,9,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(315,9,9,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(316,10,10,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(317,10,10,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(318,10,10,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(319,10,10,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(320,10,10,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(321,10,10,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(322,10,10,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(323,10,10,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(324,10,10,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(325,10,10,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(326,10,10,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(327,10,10,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(328,10,10,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(329,10,10,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(330,10,10,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(331,10,10,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(332,10,10,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(333,10,10,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(334,10,10,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(335,10,10,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(336,10,10,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(337,10,10,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(338,10,10,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(339,10,10,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(340,10,10,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(341,10,10,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(342,10,10,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(343,10,10,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(344,10,10,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(345,10,10,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(346,10,10,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(347,10,10,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(348,10,10,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(349,10,10,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(350,10,10,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(351,11,11,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(352,11,11,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(353,11,11,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(354,11,11,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(355,11,11,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(356,11,11,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(357,11,11,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(358,11,11,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(359,11,11,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(360,11,11,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(361,11,11,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(362,11,11,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(363,11,11,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(364,11,11,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(365,11,11,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(366,11,11,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(367,11,11,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(368,11,11,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(369,11,11,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(370,11,11,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(371,11,11,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(372,11,11,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(373,11,11,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(374,11,11,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(375,11,11,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(376,11,11,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:14','2017-05-10 05:35:14'),(377,11,11,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(378,11,11,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(379,11,11,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(380,11,11,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(381,11,11,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(382,11,11,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(383,11,11,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(384,11,11,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(385,11,11,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(386,12,12,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(387,12,12,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(388,12,12,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(389,12,12,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(390,12,12,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(391,12,12,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(392,12,12,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(393,12,12,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(394,12,12,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(395,12,12,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(396,12,12,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(397,12,12,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(398,12,12,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(399,12,12,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(400,12,12,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(401,12,12,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(402,12,12,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(403,12,12,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(404,12,12,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(405,12,12,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(406,12,12,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(407,12,12,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(408,12,12,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(409,12,12,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(410,12,12,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(411,12,12,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(412,12,12,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(413,12,12,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(414,12,12,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(415,12,12,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(416,12,12,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(417,12,12,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(418,12,12,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(419,12,12,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(420,12,12,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(421,13,13,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(422,13,13,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(423,13,13,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(424,13,13,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(425,13,13,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(426,13,13,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(427,13,13,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(428,13,13,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(429,13,13,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(430,13,13,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(431,13,13,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(432,13,13,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(433,13,13,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(434,13,13,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(435,13,13,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(436,13,13,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(437,13,13,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(438,13,13,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(439,13,13,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(440,13,13,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(441,13,13,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(442,13,13,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(443,13,13,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(444,13,13,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(445,13,13,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(446,13,13,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(447,13,13,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(448,13,13,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(449,13,13,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(450,13,13,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(451,13,13,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(452,13,13,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(453,13,13,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(454,13,13,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(455,13,13,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(456,14,14,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(457,14,14,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(458,14,14,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(459,14,14,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(460,14,14,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(461,14,14,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(462,14,14,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(463,14,14,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(464,14,14,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(465,14,14,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(466,14,14,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(467,14,14,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(468,14,14,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(469,14,14,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:15','2017-05-10 05:35:15'),(470,14,14,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(471,14,14,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(472,14,14,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(473,14,14,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(474,14,14,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(475,14,14,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(476,14,14,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(477,14,14,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(478,14,14,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(479,14,14,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(480,14,14,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(481,14,14,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(482,14,14,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(483,14,14,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(484,14,14,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(485,14,14,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(486,14,14,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(487,14,14,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(488,14,14,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(489,14,14,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(490,14,14,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(491,15,15,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(492,15,15,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(493,15,15,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(494,15,15,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(495,15,15,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(496,15,15,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(497,15,15,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(498,15,15,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(499,15,15,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(500,15,15,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(501,15,15,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(502,15,15,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(503,15,15,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(504,15,15,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(505,15,15,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(506,15,15,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(507,15,15,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(508,15,15,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(509,15,15,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(510,15,15,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(511,15,15,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(512,15,15,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(513,15,15,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(514,15,15,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(515,15,15,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(516,15,15,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(517,15,15,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(518,15,15,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(519,15,15,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(520,15,15,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(521,15,15,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(522,15,15,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(523,15,15,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(524,15,15,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(525,15,15,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(526,16,16,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(527,16,16,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(528,16,16,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(529,16,16,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(530,16,16,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(531,16,16,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(532,16,16,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(533,16,16,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(534,16,16,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(535,16,16,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(536,16,16,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(537,16,16,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(538,16,16,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(539,16,16,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(540,16,16,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(541,16,16,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(542,16,16,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(543,16,16,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(544,16,16,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(545,16,16,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(546,16,16,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(547,16,16,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(548,16,16,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(549,16,16,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(550,16,16,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(551,16,16,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(552,16,16,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(553,16,16,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(554,16,16,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(555,16,16,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(556,16,16,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(557,16,16,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(558,16,16,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(559,16,16,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(560,16,16,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:16','2017-05-10 05:35:16'),(561,17,17,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(562,17,17,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(563,17,17,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(564,17,17,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(565,17,17,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(566,17,17,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(567,17,17,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(568,17,17,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(569,17,17,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(570,17,17,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(571,17,17,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(572,17,17,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(573,17,17,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(574,17,17,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(575,17,17,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(576,17,17,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(577,17,17,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(578,17,17,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(579,17,17,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(580,17,17,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(581,17,17,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(582,17,17,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(583,17,17,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(584,17,17,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(585,17,17,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(586,17,17,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(587,17,17,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(588,17,17,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(589,17,17,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(590,17,17,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(591,17,17,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(592,17,17,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(593,17,17,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(594,17,17,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(595,17,17,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(596,18,18,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(597,18,18,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(598,18,18,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(599,18,18,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(600,18,18,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(601,18,18,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(602,18,18,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(603,18,18,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(604,18,18,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(605,18,18,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(606,18,18,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(607,18,18,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(608,18,18,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(609,18,18,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(610,18,18,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(611,18,18,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(612,18,18,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(613,18,18,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(614,18,18,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(615,18,18,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(616,18,18,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(617,18,18,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(618,18,18,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(619,18,18,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(620,18,18,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(621,18,18,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(622,18,18,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(623,18,18,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(624,18,18,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(625,18,18,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(626,18,18,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(627,18,18,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(628,18,18,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(629,18,18,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(630,18,18,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(631,19,19,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(632,19,19,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(633,19,19,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(634,19,19,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(635,19,19,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(636,19,19,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(637,19,19,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(638,19,19,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(639,19,19,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(640,19,19,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(641,19,19,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(642,19,19,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(643,19,19,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(644,19,19,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(645,19,19,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(646,19,19,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(647,19,19,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(648,19,19,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(649,19,19,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(650,19,19,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(651,19,19,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(652,19,19,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(653,19,19,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(654,19,19,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:17','2017-05-10 05:35:17'),(655,19,19,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(656,19,19,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(657,19,19,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(658,19,19,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(659,19,19,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(660,19,19,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(661,19,19,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(662,19,19,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(663,19,19,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(664,19,19,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(665,19,19,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(666,20,20,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(667,20,20,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(668,20,20,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(669,20,20,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(670,20,20,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(671,20,20,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(672,20,20,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(673,20,20,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(674,20,20,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(675,20,20,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(676,20,20,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(677,20,20,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(678,20,20,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(679,20,20,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(680,20,20,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(681,20,20,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(682,20,20,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(683,20,20,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(684,20,20,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(685,20,20,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(686,20,20,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(687,20,20,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(688,20,20,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(689,20,20,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(690,20,20,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(691,20,20,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(692,20,20,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(693,20,20,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(694,20,20,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(695,20,20,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(696,20,20,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(697,20,20,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(698,20,20,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(699,20,20,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(700,20,20,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(701,21,21,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(702,21,21,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(703,21,21,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(704,21,21,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(705,21,21,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(706,21,21,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(707,21,21,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(708,21,21,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(709,21,21,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(710,21,21,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(711,21,21,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(712,21,21,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(713,21,21,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(714,21,21,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(715,21,21,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(716,21,21,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(717,21,21,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(718,21,21,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(719,21,21,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(720,21,21,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(721,21,21,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(722,21,21,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(723,21,21,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(724,21,21,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(725,21,21,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(726,21,21,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(727,21,21,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(728,21,21,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(729,21,21,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(730,21,21,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(731,21,21,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(732,21,21,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(733,21,21,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(734,21,21,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(735,21,21,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(736,22,22,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(737,22,22,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(738,22,22,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(739,22,22,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(740,22,22,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(741,22,22,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(742,22,22,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(743,22,22,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(744,22,22,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(745,22,22,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(746,22,22,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(747,22,22,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:18','2017-05-10 05:35:18'),(748,22,22,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(749,22,22,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(750,22,22,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(751,22,22,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(752,22,22,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(753,22,22,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(754,22,22,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(755,22,22,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(756,22,22,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(757,22,22,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(758,22,22,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(759,22,22,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(760,22,22,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(761,22,22,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(762,22,22,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(763,22,22,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(764,22,22,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(765,22,22,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(766,22,22,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(767,22,22,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(768,22,22,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(769,22,22,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(770,22,22,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(771,23,23,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(772,23,23,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(773,23,23,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(774,23,23,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(775,23,23,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(776,23,23,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(777,23,23,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(778,23,23,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(779,23,23,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(780,23,23,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(781,23,23,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(782,23,23,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(783,23,23,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(784,23,23,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(785,23,23,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(786,23,23,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(787,23,23,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(788,23,23,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(789,23,23,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(790,23,23,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(791,23,23,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(792,23,23,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(793,23,23,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(794,23,23,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(795,23,23,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(796,23,23,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(797,23,23,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(798,23,23,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(799,23,23,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(800,23,23,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(801,23,23,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(802,23,23,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(803,23,23,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(804,23,23,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(805,23,23,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(806,24,24,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(807,24,24,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(808,24,24,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(809,24,24,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(810,24,24,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(811,24,24,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(812,24,24,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(813,24,24,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(814,24,24,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(815,24,24,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(816,24,24,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(817,24,24,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(818,24,24,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(819,24,24,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(820,24,24,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(821,24,24,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(822,24,24,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(823,24,24,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(824,24,24,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(825,24,24,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(826,24,24,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(827,24,24,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(828,24,24,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(829,24,24,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(830,24,24,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(831,24,24,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(832,24,24,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(833,24,24,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(834,24,24,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(835,24,24,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(836,24,24,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(837,24,24,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(838,24,24,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(839,24,24,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:19','2017-05-10 05:35:19'),(840,24,24,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(841,25,25,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(842,25,25,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(843,25,25,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(844,25,25,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(845,25,25,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(846,25,25,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(847,25,25,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(848,25,25,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(849,25,25,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(850,25,25,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(851,25,25,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(852,25,25,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(853,25,25,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(854,25,25,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(855,25,25,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(856,25,25,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(857,25,25,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(858,25,25,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(859,25,25,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(860,25,25,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(861,25,25,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(862,25,25,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(863,25,25,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(864,25,25,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(865,25,25,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(866,25,25,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(867,25,25,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(868,25,25,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(869,25,25,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(870,25,25,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(871,25,25,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(872,25,25,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(873,25,25,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(874,25,25,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(875,25,25,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(876,26,26,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(877,26,26,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(878,26,26,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(879,26,26,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(880,26,26,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(881,26,26,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(882,26,26,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(883,26,26,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(884,26,26,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(885,26,26,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(886,26,26,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(887,26,26,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(888,26,26,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(889,26,26,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(890,26,26,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(891,26,26,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(892,26,26,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(893,26,26,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(894,26,26,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(895,26,26,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(896,26,26,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(897,26,26,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(898,26,26,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(899,26,26,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(900,26,26,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(901,26,26,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(902,26,26,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(903,26,26,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(904,26,26,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(905,26,26,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(906,26,26,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(907,26,26,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(908,26,26,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(909,26,26,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(910,26,26,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(911,27,27,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(912,27,27,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(913,27,27,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(914,27,27,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(915,27,27,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(916,27,27,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(917,27,27,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(918,27,27,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(919,27,27,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(920,27,27,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(921,27,27,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(922,27,27,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(923,27,27,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(924,27,27,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(925,27,27,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(926,27,27,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(927,27,27,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(928,27,27,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(929,27,27,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(930,27,27,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(931,27,27,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(932,27,27,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:20','2017-05-10 05:35:20'),(933,27,27,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(934,27,27,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(935,27,27,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(936,27,27,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(937,27,27,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(938,27,27,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(939,27,27,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(940,27,27,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(941,27,27,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(942,27,27,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(943,27,27,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(944,27,27,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(945,27,27,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(946,28,28,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(947,28,28,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(948,28,28,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(949,28,28,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(950,28,28,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(951,28,28,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(952,28,28,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(953,28,28,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(954,28,28,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(955,28,28,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(956,28,28,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(957,28,28,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(958,28,28,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(959,28,28,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(960,28,28,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(961,28,28,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(962,28,28,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(963,28,28,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(964,28,28,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(965,28,28,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(966,28,28,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(967,28,28,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(968,28,28,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(969,28,28,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(970,28,28,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(971,28,28,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(972,28,28,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(973,28,28,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(974,28,28,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(975,28,28,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(976,28,28,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(977,28,28,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(978,28,28,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(979,28,28,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(980,28,28,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(981,29,29,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(982,29,29,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(983,29,29,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(984,29,29,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(985,29,29,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(986,29,29,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(987,29,29,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(988,29,29,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(989,29,29,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(990,29,29,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(991,29,29,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(992,29,29,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(993,29,29,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(994,29,29,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(995,29,29,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(996,29,29,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(997,29,29,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(998,29,29,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(999,29,29,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1000,29,29,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1001,29,29,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1002,29,29,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1003,29,29,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1004,29,29,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1005,29,29,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1006,29,29,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1007,29,29,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1008,29,29,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1009,29,29,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1010,29,29,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1011,29,29,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1012,29,29,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1013,29,29,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1014,29,29,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1015,29,29,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1016,30,30,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1017,30,30,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1018,30,30,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1019,30,30,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1020,30,30,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1021,30,30,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:21','2017-05-10 05:35:21'),(1022,30,30,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1023,30,30,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1024,30,30,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1025,30,30,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1026,30,30,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1027,30,30,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1028,30,30,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1029,30,30,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1030,30,30,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1031,30,30,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1032,30,30,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1033,30,30,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1034,30,30,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1035,30,30,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1036,30,30,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1037,30,30,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1038,30,30,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1039,30,30,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1040,30,30,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1041,30,30,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1042,30,30,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1043,30,30,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1044,30,30,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1045,30,30,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1046,30,30,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1047,30,30,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1048,30,30,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1049,30,30,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1050,30,30,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1051,31,31,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1052,31,31,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1053,31,31,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1054,31,31,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1055,31,31,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1056,31,31,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1057,31,31,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1058,31,31,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1059,31,31,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1060,31,31,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1061,31,31,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1062,31,31,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1063,31,31,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1064,31,31,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1065,31,31,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1066,31,31,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1067,31,31,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1068,31,31,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1069,31,31,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1070,31,31,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1071,31,31,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1072,31,31,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1073,31,31,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1074,31,31,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1075,31,31,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1076,31,31,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1077,31,31,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1078,31,31,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1079,31,31,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1080,31,31,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1081,31,31,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1082,31,31,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1083,31,31,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1084,31,31,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1085,31,31,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1086,32,32,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1087,32,32,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1088,32,32,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1089,32,32,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1090,32,32,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1091,32,32,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1092,32,32,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1093,32,32,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1094,32,32,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1095,32,32,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1096,32,32,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1097,32,32,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1098,32,32,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1099,32,32,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1100,32,32,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1101,32,32,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1102,32,32,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1103,32,32,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1104,32,32,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1105,32,32,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1106,32,32,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1107,32,32,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1108,32,32,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1109,32,32,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1110,32,32,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1111,32,32,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:22','2017-05-10 05:35:22'),(1112,32,32,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1113,32,32,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1114,32,32,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1115,32,32,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1116,32,32,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1117,32,32,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1118,32,32,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1119,32,32,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1120,32,32,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1121,33,33,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1122,33,33,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1123,33,33,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1124,33,33,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1125,33,33,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1126,33,33,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1127,33,33,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1128,33,33,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1129,33,33,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1130,33,33,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1131,33,33,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1132,33,33,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1133,33,33,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1134,33,33,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1135,33,33,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1136,33,33,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1137,33,33,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1138,33,33,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1139,33,33,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1140,33,33,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1141,33,33,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1142,33,33,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1143,33,33,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1144,33,33,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1145,33,33,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1146,33,33,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1147,33,33,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1148,33,33,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1149,33,33,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1150,33,33,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1151,33,33,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1152,33,33,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1153,33,33,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1154,33,33,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1155,33,33,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1156,34,34,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1157,34,34,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1158,34,34,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1159,34,34,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1160,34,34,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1161,34,34,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1162,34,34,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1163,34,34,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1164,34,34,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1165,34,34,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1166,34,34,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1167,34,34,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1168,34,34,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1169,34,34,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1170,34,34,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1171,34,34,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1172,34,34,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1173,34,34,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1174,34,34,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1175,34,34,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1176,34,34,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1177,34,34,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1178,34,34,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1179,34,34,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1180,34,34,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1181,34,34,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1182,34,34,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1183,34,34,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1184,34,34,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1185,34,34,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1186,34,34,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1187,34,34,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1188,34,34,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1189,34,34,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1190,34,34,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1191,35,35,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1192,35,35,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1193,35,35,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1194,35,35,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1195,35,35,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1196,35,35,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1197,35,35,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1198,35,35,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1199,35,35,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1200,35,35,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:23','2017-05-10 05:35:23'),(1201,35,35,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1202,35,35,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1203,35,35,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1204,35,35,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1205,35,35,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1206,35,35,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1207,35,35,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1208,35,35,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1209,35,35,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1210,35,35,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1211,35,35,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1212,35,35,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1213,35,35,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1214,35,35,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1215,35,35,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1216,35,35,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1217,35,35,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1218,35,35,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1219,35,35,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1220,35,35,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1221,35,35,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1222,35,35,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1223,35,35,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1224,35,35,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1225,35,35,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1226,36,36,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1227,36,36,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1228,36,36,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1229,36,36,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1230,36,36,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1231,36,36,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1232,36,36,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1233,36,36,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1234,36,36,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1235,36,36,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1236,36,36,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1237,36,36,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1238,36,36,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1239,36,36,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1240,36,36,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1241,36,36,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1242,36,36,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1243,36,36,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1244,36,36,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1245,36,36,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1246,36,36,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1247,36,36,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1248,36,36,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1249,36,36,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1250,36,36,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1251,36,36,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1252,36,36,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1253,36,36,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1254,36,36,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1255,36,36,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1256,36,36,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1257,36,36,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1258,36,36,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1259,36,36,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1260,36,36,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1261,37,37,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1262,37,37,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1263,37,37,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1264,37,37,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1265,37,37,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1266,37,37,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1267,37,37,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1268,37,37,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1269,37,37,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1270,37,37,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1271,37,37,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1272,37,37,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1273,37,37,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1274,37,37,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1275,37,37,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1276,37,37,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1277,37,37,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1278,37,37,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1279,37,37,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1280,37,37,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1281,37,37,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1282,37,37,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1283,37,37,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1284,37,37,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1285,37,37,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1286,37,37,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1287,37,37,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1288,37,37,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:24','2017-05-10 05:35:24'),(1289,37,37,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1290,37,37,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1291,37,37,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1292,37,37,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1293,37,37,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1294,37,37,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1295,37,37,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1296,38,38,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1297,38,38,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1298,38,38,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1299,38,38,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1300,38,38,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1301,38,38,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1302,38,38,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1303,38,38,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1304,38,38,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1305,38,38,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1306,38,38,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1307,38,38,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1308,38,38,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1309,38,38,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1310,38,38,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1311,38,38,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1312,38,38,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1313,38,38,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1314,38,38,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1315,38,38,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1316,38,38,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1317,38,38,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1318,38,38,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1319,38,38,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1320,38,38,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1321,38,38,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1322,38,38,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1323,38,38,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1324,38,38,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1325,38,38,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1326,38,38,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1327,38,38,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1328,38,38,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1329,38,38,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1330,38,38,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1331,39,39,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1332,39,39,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1333,39,39,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1334,39,39,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1335,39,39,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1336,39,39,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1337,39,39,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1338,39,39,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1339,39,39,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1340,39,39,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1341,39,39,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1342,39,39,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1343,39,39,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1344,39,39,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1345,39,39,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1346,39,39,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1347,39,39,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1348,39,39,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1349,39,39,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1350,39,39,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1351,39,39,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1352,39,39,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1353,39,39,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1354,39,39,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1355,39,39,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1356,39,39,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1357,39,39,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1358,39,39,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1359,39,39,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1360,39,39,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1361,39,39,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1362,39,39,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1363,39,39,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1364,39,39,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1365,39,39,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1366,40,40,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1367,40,40,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1368,40,40,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1369,40,40,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1370,40,40,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1371,40,40,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1372,40,40,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:25','2017-05-10 05:35:25'),(1373,40,40,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1374,40,40,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1375,40,40,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1376,40,40,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1377,40,40,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1378,40,40,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1379,40,40,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1380,40,40,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1381,40,40,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1382,40,40,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1383,40,40,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1384,40,40,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1385,40,40,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1386,40,40,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1387,40,40,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1388,40,40,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1389,40,40,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1390,40,40,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1391,40,40,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1392,40,40,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1393,40,40,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1394,40,40,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1395,40,40,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1396,40,40,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1397,40,40,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1398,40,40,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1399,40,40,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1400,40,40,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1401,41,41,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1402,41,41,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1403,41,41,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1404,41,41,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1405,41,41,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1406,41,41,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1407,41,41,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1408,41,41,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1409,41,41,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1410,41,41,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1411,41,41,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1412,41,41,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1413,41,41,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1414,41,41,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1415,41,41,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1416,41,41,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1417,41,41,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1418,41,41,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1419,41,41,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1420,41,41,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1421,41,41,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1422,41,41,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1423,41,41,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1424,41,41,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1425,41,41,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1426,41,41,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1427,41,41,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1428,41,41,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1429,41,41,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1430,41,41,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1431,41,41,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1432,41,41,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1433,41,41,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1434,41,41,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1435,41,41,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1436,42,42,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1437,42,42,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1438,42,42,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1439,42,42,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1440,42,42,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1441,42,42,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1442,42,42,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1443,42,42,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1444,42,42,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1445,42,42,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1446,42,42,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1447,42,42,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1448,42,42,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1449,42,42,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1450,42,42,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1451,42,42,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1452,42,42,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1453,42,42,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1454,42,42,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1455,42,42,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1456,42,42,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1457,42,42,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:26','2017-05-10 05:35:26'),(1458,42,42,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1459,42,42,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1460,42,42,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1461,42,42,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1462,42,42,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1463,42,42,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1464,42,42,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1465,42,42,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1466,42,42,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1467,42,42,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1468,42,42,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1469,42,42,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1470,42,42,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1471,43,43,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1472,43,43,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1473,43,43,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1474,43,43,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1475,43,43,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1476,43,43,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1477,43,43,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1478,43,43,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1479,43,43,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1480,43,43,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1481,43,43,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1482,43,43,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1483,43,43,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1484,43,43,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1485,43,43,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1486,43,43,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1487,43,43,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1488,43,43,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1489,43,43,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1490,43,43,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1491,43,43,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1492,43,43,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1493,43,43,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1494,43,43,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1495,43,43,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1496,43,43,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1497,43,43,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1498,43,43,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1499,43,43,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1500,43,43,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1501,43,43,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1502,43,43,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1503,43,43,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1504,43,43,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1505,43,43,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1506,44,44,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1507,44,44,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1508,44,44,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1509,44,44,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1510,44,44,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1511,44,44,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1512,44,44,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1513,44,44,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1514,44,44,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1515,44,44,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1516,44,44,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1517,44,44,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1518,44,44,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1519,44,44,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1520,44,44,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1521,44,44,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1522,44,44,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1523,44,44,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1524,44,44,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1525,44,44,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1526,44,44,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1527,44,44,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1528,44,44,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1529,44,44,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1530,44,44,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1531,44,44,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1532,44,44,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1533,44,44,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1534,44,44,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1535,44,44,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1536,44,44,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1537,44,44,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1538,44,44,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1539,44,44,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1540,44,44,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1541,45,45,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1542,45,45,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:27','2017-05-10 05:35:27'),(1543,45,45,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1544,45,45,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1545,45,45,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1546,45,45,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1547,45,45,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1548,45,45,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1549,45,45,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1550,45,45,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1551,45,45,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1552,45,45,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1553,45,45,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1554,45,45,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1555,45,45,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1556,45,45,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1557,45,45,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1558,45,45,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1559,45,45,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1560,45,45,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1561,45,45,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1562,45,45,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1563,45,45,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1564,45,45,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1565,45,45,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1566,45,45,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1567,45,45,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1568,45,45,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1569,45,45,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1570,45,45,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1571,45,45,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1572,45,45,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1573,45,45,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1574,45,45,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1575,45,45,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1576,46,46,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1577,46,46,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1578,46,46,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1579,46,46,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1580,46,46,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1581,46,46,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1582,46,46,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1583,46,46,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1584,46,46,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1585,46,46,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1586,46,46,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1587,46,46,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1588,46,46,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1589,46,46,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1590,46,46,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1591,46,46,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1592,46,46,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1593,46,46,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1594,46,46,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1595,46,46,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1596,46,46,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1597,46,46,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1598,46,46,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1599,46,46,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1600,46,46,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1601,46,46,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1602,46,46,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1603,46,46,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1604,46,46,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1605,46,46,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1606,46,46,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1607,46,46,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1608,46,46,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1609,46,46,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1610,46,46,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1611,47,47,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1612,47,47,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1613,47,47,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1614,47,47,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1615,47,47,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1616,47,47,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1617,47,47,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1618,47,47,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1619,47,47,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1620,47,47,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1621,47,47,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1622,47,47,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1623,47,47,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1624,47,47,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1625,47,47,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1626,47,47,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1627,47,47,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1628,47,47,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:28','2017-05-10 05:35:28'),(1629,47,47,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1630,47,47,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1631,47,47,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1632,47,47,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1633,47,47,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1634,47,47,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1635,47,47,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1636,47,47,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1637,47,47,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1638,47,47,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1639,47,47,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1640,47,47,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1641,47,47,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1642,47,47,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1643,47,47,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1644,47,47,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1645,47,47,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1646,48,48,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1647,48,48,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1648,48,48,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1649,48,48,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1650,48,48,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1651,48,48,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1652,48,48,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1653,48,48,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1654,48,48,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1655,48,48,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1656,48,48,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1657,48,48,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1658,48,48,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1659,48,48,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1660,48,48,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1661,48,48,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1662,48,48,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1663,48,48,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1664,48,48,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1665,48,48,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1666,48,48,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1667,48,48,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1668,48,48,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1669,48,48,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1670,48,48,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1671,48,48,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1672,48,48,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1673,48,48,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1674,48,48,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1675,48,48,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1676,48,48,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1677,48,48,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1678,48,48,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1679,48,48,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1680,48,48,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1681,49,49,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1682,49,49,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1683,49,49,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1684,49,49,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1685,49,49,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1686,49,49,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1687,49,49,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1688,49,49,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1689,49,49,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1690,49,49,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1691,49,49,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1692,49,49,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1693,49,49,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1694,49,49,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1695,49,49,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1696,49,49,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1697,49,49,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1698,49,49,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1699,49,49,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1700,49,49,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1701,49,49,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1702,49,49,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1703,49,49,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1704,49,49,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1705,49,49,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1706,49,49,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1707,49,49,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1708,49,49,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1709,49,49,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1710,49,49,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1711,49,49,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:29','2017-05-10 05:35:29'),(1712,49,49,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1713,49,49,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1714,49,49,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1715,49,49,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1716,50,50,'Sun','2017-05-07',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1717,50,50,'Sun','2017-05-14',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1718,50,50,'Sun','2017-05-21',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1719,50,50,'Sun','2017-05-28',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1720,50,50,'Sun','2017-06-04',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1721,50,50,'Sun','2017-06-11',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1722,50,50,'Sun','2017-06-18',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1723,50,50,'Sun','2017-06-25',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1724,50,50,'Sun','2017-07-02',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1725,50,50,'Sun','2017-07-09',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1726,50,50,'Sun','2017-07-16',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1727,50,50,'Sun','2017-07-23',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1728,50,50,'Sun','2017-07-30',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1729,50,50,'Sun','2017-08-06',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1730,50,50,'Sun','2017-08-13',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1731,50,50,'Sun','2017-08-20',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1732,50,50,'Sun','2017-08-27',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1733,50,50,'Sun','2017-09-03',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1734,50,50,'Sun','2017-09-10',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1735,50,50,'Sun','2017-09-17',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1736,50,50,'Sun','2017-09-24',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1737,50,50,'Sun','2017-10-01',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1738,50,50,'Sun','2017-10-08',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1739,50,50,'Sun','2017-10-15',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1740,50,50,'Sun','2017-10-22',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1741,50,50,'Sun','2017-10-29',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1742,50,50,'Sun','2017-11-05',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1743,50,50,'Sun','2017-11-12',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1744,50,50,'Sun','2017-11-19',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1745,50,50,'Sun','2017-11-26',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1746,50,50,'Sun','2017-12-03',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1747,50,50,'Sun','2017-12-10',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1748,50,50,'Sun','2017-12-17',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1749,50,50,'Sun','2017-12-24',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30'),(1750,50,50,'Sun','2017-12-31',NULL,NULL,'2017-05-10 05:35:30','2017-05-10 05:35:30');
/*!40000 ALTER TABLE `employee_week_offs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','EMP0000001',NULL,NULL,'Akshay',NULL,'Suri','1978-08-10','Male','9811057680',NULL,'a.suri@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','AJWPS0416K',NULL,'Married',NULL,2,1,NULL,'No','No','Active',1,1,1,1,NULL,'2017-04-25 04:09:17','2017-05-01 05:08:38',1,NULL,NULL,NULL,NULL,NULL),(2,'2','EMP0000002',NULL,NULL,'Sandipan',NULL,'Ray','1974-08-10','Male','9810469900',NULL,'s.ray@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','AFGPR0677D',NULL,'Married',NULL,2,1,NULL,'No','No','Active',1,1,1,1,NULL,'2017-04-25 04:09:17','2017-05-01 05:08:48',1,NULL,NULL,NULL,NULL,NULL),(3,'3','EMP0000003',NULL,NULL,'Vishal',NULL,'Chhibber','1980-05-24','Male','9818273232',NULL,'v.chhibber@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','ADFPC8373A',NULL,'Married',NULL,2,1,NULL,'No','No','Active',1,1,1,1,NULL,'2017-04-25 04:09:17','2017-05-01 05:08:57',1,NULL,NULL,NULL,NULL,NULL),(4,'4','EMP0000004',NULL,NULL,'Devender',NULL,'Kumar','1985-09-29','Male','9717527782',NULL,'devender.rawat@redefine.in','Krishana Vihar, Mohkam Pur Khurd, Dehradun, Uttarakhand-248005',1,34,863,NULL,248005,NULL,'2026','DEMPK1138C','DL- 0920060146874','Married',NULL,2,1,NULL,'No','No','Active',2,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 06:45:14',1,NULL,NULL,NULL,NULL,1),(5,'7','EMP0000005',NULL,NULL,'Swadesh',NULL,'Gupta','1984-03-26','Male','9311605558',NULL,'swadesh.gupta@redefine.in','586,587,Shekhupura Colony,Aliganj,Lucknow-222022',1,9,NULL,NULL,110051,'34,2nd Floor, Baldev Park\nNear Dixit Dairy\nDelhi-110051\n','0','BCBPG1122M',NULL,'Married',NULL,2,1,NULL,'No','No','Active',2,1,1,3,NULL,'2017-04-25 04:09:17','2017-05-01 06:46:46',1,NULL,NULL,NULL,NULL,1),(6,'8','EMP0000006',NULL,'','Kirti','','Puri','1993-07-17','Female','9560032603',NULL,'kirti.puri@redefine.in','Block-E, B.K.Dutt Colony, Karbala, Lodhi Road, New Delhi-03',1,9,135,'New Delhi',110003,'Same as Current','9627','CAMPP2068M','','Married',NULL,2,1,2,'No','No','Active',9,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-02 08:43:56',1,NULL,NULL,NULL,NULL,2),(7,'10','EMP0000007',NULL,'','Santosh','Kumar','Shah','1983-07-23','Male','9650776747',NULL,'shahsantosh916@gmail.com','h no - 48 khasra no --155 1st floor , street no 3/5 block no - A janta yar mukandpur delhi- 110042',1,9,NULL,'',110042,'Same as Current','901727668404','HHTPS6961K','DL-0220090004607','Married',3,2,1,2,'No','No','Active',21,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-03 05:16:36',1,NULL,NULL,NULL,NULL,2),(8,'13','EMP0000008',NULL,NULL,'Naresh',NULL,'Kumar','1988-10-04','Male','7838011428',NULL,'naresh.kumar@redefine.in','Same as Current',1,9,NULL,NULL,110059,'A-453, JJ Colony, Hastal Road, Uttam Nagar, New Delhi-59','6041','DREPK0860G','DL-0920130218255','Married',NULL,2,1,NULL,'No','No','Active',2,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 07:02:02',1,NULL,NULL,NULL,NULL,1),(9,'18','EMP0000009',NULL,NULL,'Satish','Kumar','Yadav','1984-02-24','Male','9999413126',NULL,'satish.yadav@redefine.in','B-317, I.D.P.L, Virbhadra, Rishikesh, Uttarakhand',1,9,NULL,NULL,201301,'C/o-Sahab Singh Rana Village-Chaura Sadatpur,Sector-22, Room No-1, 2nd Floor, Near Block J-239 Noida-201301','0','AEEPY2761A',NULL,'Married',NULL,2,1,NULL,'No','No','Active',2,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-01 07:03:31',1,NULL,NULL,NULL,NULL,1),(10,'25','EMP0000010',NULL,'','Ashish','Kumar','Dubey','1986-07-10','Male','9555189991',NULL,'ashish.dubey@redefine.in','Address',1,9,NULL,'',110077,'B – 55 MBR Enclave,Pochunpur Dwarka Sec 23, New Delhi - 110077','0','ATIPD8836A','','Married',NULL,2,1,NULL,'No','No','Active',2,1,1,9,NULL,'2017-04-25 04:09:17','2017-05-02 07:17:31',1,NULL,NULL,NULL,NULL,1),(11,'40','EMP0000011',NULL,NULL,'Raksha',NULL,'Dwivedi','1992-03-04','Female','9560089603',NULL,'raksha.shukla@redefine.in','W/O Priyanshu Shukla, H.N.-127/961, W-1, Saket Nagar, Juhi Colony, Kanpur-208014',1,9,NULL,NULL,110095,'D-12, S-4,Dilshad Colony,Delhi- 110095','4504','BOXPD65769',NULL,'Married',NULL,2,1,NULL,'No','No','Active',20,1,1,3,NULL,'2017-04-25 04:09:17','2017-05-01 07:04:45',1,NULL,NULL,NULL,NULL,2),(12,'41','EMP0000012',NULL,NULL,'Chandan','Baran ','Das','1984-10-19','Male','9836363232',NULL,'chandan.das@redefine.in','5/70, Bijoygarh Colony, Ward No.-98, Jadavpur, Kolkata-700092',1,14,265,NULL,122002,'Room No.-412, H. N. -1007, Sarswati Vihar, Gurgaon ','0','ATYPD2334F',NULL,'Married',NULL,2,1,NULL,'No','No','Active',2,1,1,3,NULL,'2017-04-25 04:09:17','2017-05-01 07:04:57',1,NULL,NULL,NULL,NULL,1),(13,'73','EMP0000013',NULL,'','Parul','','Nanda','1988-05-27','Female','9810356548',NULL,'parul.nanda@redefine.in','6-12 Nehru nagar new delhi - 110065',1,9,138,'',110065,'N-11 Old Double Dtorey Lajpat Nagar-4 New Delhi -110024','462694242788','AMPPN9897H','','Married',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:19:15',1,NULL,NULL,NULL,NULL,2),(14,'77','EMP0000014',NULL,NULL,'Sonia',NULL,'Verma','1987-11-20','Female','9873988046',NULL,'talen@redine.in','1/26 Double Storey Vijay Nagar Delhi - 110009',1,9,NULL,NULL,110009,'Same as Current','459593011066','CUWPS6989L',NULL,'Married',NULL,2,1,NULL,'No','No','Active',21,1,1,6,NULL,'2017-04-25 04:09:17','2017-05-03 05:02:05',1,NULL,NULL,NULL,NULL,2),(15,'87','EMP0000015',NULL,'Mr.','Brajesh','','Kumar','1981-10-06','Male','8750083444',NULL,'brajesh.kumar@redefine.in','E-28 Saraswati Enclave Gurgaon-122001',1,14,265,'',122001,'Same as Current','863827347254','BVDPK1022R','','Married',4,2,1,NULL,'No','No','Active',10,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-02 09:37:31',1,NULL,NULL,NULL,NULL,2),(16,'93','EMP0000016',NULL,NULL,'Prem','Ranjan ','Das','1976-12-15','Male','9873686647',NULL,'premranjan.das@redefine.in','3-A,Buddh bazar ,Chhath Park DK Mohan garden West delhi -59',1,9,NULL,NULL,110059,'C/O Soniya Plot no-49 Vikas Nagar Ext Uttam Nagar Delhi-110059 ','883343441698','AMBPD9267D',NULL,'Married',NULL,2,1,NULL,'No','No','Active',9,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-01 07:05:55',1,NULL,NULL,NULL,NULL,2),(17,'96','EMP0000017',NULL,'','Poonam','','Wadhwa','1984-02-04','Female','9811553803',NULL,'poonam.wadhwa@redefine.in','cc-89C Shalimar bagh,Near police station New Delhi- 110088',1,9,NULL,'',110088,'Same as Current','715272359575','AYAPP8035G','','Married',NULL,2,1,NULL,'No','No','Active',2,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:19:55',1,NULL,NULL,NULL,NULL,1),(18,'103','EMP0000018',NULL,NULL,'Dinesh','Kumar','Dangi','1987-01-05','Male','9873524003',NULL,'dinesh.dangi@redefine.in','A-119 gali Chopal Wali no - 6 Shalimar Village Delhi-110088',1,9,NULL,NULL,110088,'Same as Current','629331615971','AYLPK4828K',NULL,'Married',NULL,2,1,NULL,'No','No','Active',8,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 07:06:36',1,NULL,NULL,NULL,NULL,2),(19,'109','EMP0000019',NULL,NULL,'Brijesh','Kumar','Verma','1979-12-02','Male','9990028618',NULL,'brijesh.verma@redefine.in','Sri Ghanshyam Das Verma,Geetanjali Bhawan Kali Mandir Station Road dist-Ghazipur UP',1,9,NULL,NULL,110059,'u-65 sf , Vishu Vihar,Uttam Nagar-110059 Near Goyal Hardware','451068137456','AGDPV7056L',NULL,'Married',NULL,2,1,NULL,'No','No','Active',10,1,1,5,NULL,'2017-04-25 04:09:17','2017-05-01 07:09:44',1,NULL,NULL,NULL,NULL,2),(20,'5','EMP0000020',NULL,NULL,'Mohd',NULL,'Shahnawaz','1990-02-09','Male','9599281264',NULL,'mohd.shahnawaz@redefine.in','Same as Current',1,9,NULL,NULL,110006,'H.No-462, Street Matia Mahal,Jama Masjid,Delhi-110006','0','BYBPS0114F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',2,1,1,3,NULL,'2017-04-25 04:09:17','2017-05-01 07:09:57',1,NULL,NULL,NULL,NULL,1),(21,'6','EMP0000021',NULL,NULL,'Nagma',NULL,'Ansari','1989-07-21','Female','9650570746',NULL,'nagma.ansari@redefine.in/accounts@redefinemarcom.com','Same as Current',1,9,NULL,NULL,110091,'B-4, Stret No.9, Pratap Nagar, Mayur Vihar Phase-I, New Delhi-91','7098','BQMPA4731M',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',2,1,1,6,NULL,'2017-04-25 04:09:17','2017-05-01 07:10:08',1,NULL,NULL,NULL,NULL,1),(22,'23','EMP0000022',NULL,'','Puneet','','Sharma','1992-11-20','Male','9891717997',NULL,'puneet.sharma@redefine.in','T-25, baljeet nagar, Near West patel nagar, New Delhi-08',1,9,138,'Delhi',110008,'Same as Current','7547','DPHPS2356A','','',NULL,2,1,NULL,'No','No','Active',3,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-02 11:17:41',1,NULL,NULL,NULL,NULL,2),(23,'24','EMP0000023',NULL,NULL,'Praveen',NULL,'Paudyal','1992-12-17','Male','9718209509',NULL,'praveen.paudyal@redefine.in','House no. 2029, Sec-4-b,  Vasundhara, Ghaziabad-201012',1,9,915,NULL,201012,'Same as Current','9273','BZGPP0822B',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',2,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 07:10:30',1,NULL,NULL,NULL,NULL,1),(24,'33','EMP0000024',NULL,NULL,'Indrani',NULL,NULL,'1988-05-25','Female','9911879557',NULL,'indrani.arora@redefine.in','H.N.-3216, Arya Pura, Sabji Mandi, Near Clock Tower, Delhi-07',1,9,NULL,NULL,110007,'Same as Current','0','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',16,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-02 07:27:38',1,NULL,NULL,NULL,NULL,9),(25,'36','EMP0000025',NULL,NULL,'Dilip','Singh','Bist','1993-02-24','Male','9873264222',NULL,'dilip.bist@redefine.in','N-23/A, Jagat Ram Park,Laxmi Nagar, Delhi-92',1,9,NULL,NULL,110092,'Same as Current','4757','BLWPB7112G',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',3,1,1,3,NULL,'2017-04-25 04:09:17','2017-05-01 07:11:14',1,NULL,NULL,NULL,NULL,2),(26,'48','EMP0000026',NULL,NULL,'Rachna',NULL,'Negi','1995-02-07','Female','8527480866',NULL,'rachna.negi@redefine.in','I-16/258 Pyare Lal Road, Dev Nagar,Karol Bagh, New Delhi-05',1,9,NULL,NULL,110005,'Same as Current','8062','AZUPN4429P',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',16,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-02 07:27:50',1,NULL,NULL,NULL,NULL,9),(27,'50','EMP0000027',NULL,'','Meenakshi','','Sharma','1994-08-17','Female','8527315659',NULL,'meenakshi.sharma@redefine.in','H. N.-268, Block-22, Panchkuian Road Near Mandir Marg, New Delhi-01 ',1,9,135,'',110001,'Same as Current','241206058792','FOAPS6051C','','',2,2,1,NULL,'No','No','Active',16,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-02 08:57:05',1,NULL,NULL,NULL,NULL,9),(28,'56','EMP0000028',NULL,NULL,'Manish',NULL,'Rawat','1997-05-30','Male','8826715704',NULL,'manish.rawat@redefine.in','150-B, DDA Flat, Gazipur, New Delhi-96',1,9,NULL,NULL,110096,'Same as Current','8596','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',6,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-02 07:28:20',1,NULL,NULL,NULL,NULL,9),(29,'58','EMP0000029',NULL,NULL,'Nancy',NULL,'Jain','1993-08-18','Female','8802643060',NULL,'nancy.jain@redefine.in','H.No.-1/5650, Street No.-11, Balbir Nagar, Shahdara, Delhi-32',1,9,NULL,NULL,110032,'Same as Current','355223329926','BAUPJ6733J',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',6,1,1,4,NULL,'2017-04-25 04:09:17','2017-05-02 07:28:37',1,NULL,NULL,NULL,NULL,9),(30,'62','EMP0000030',NULL,'','Simran','','Kaur','1994-03-23','Female','9910527496',NULL,'simran.kaur@redefine.in','WZ-3258, Mahindra Park, Rani bagh, Delhi-34',1,9,NULL,'',110034,'Same as Current','823340650090','DJTPK9507D','','',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:20:29',1,NULL,NULL,NULL,NULL,2),(31,'65','EMP0000031',NULL,'','Ravit','','Marwah','1993-12-25','Male','9599281262',NULL,'ravit.marwah@redefine.in','C-121/A, Ganesh Nagar,Tilak Nagar, Behind Mangla Hospital,Delhi-110018',1,9,NULL,'',110018,'Same as Current','513506656089','CRHPM1769C','','',3,2,1,NULL,'No','No','Active',3,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-02 11:18:50',1,NULL,NULL,NULL,NULL,2),(32,'66','EMP0000032',NULL,'','R.','','Balaji','1997-11-22','Male','9891524833',NULL,'r.balaji@redefine.in','D-2, 222 Kidwai Nagar west, delhi-110023',1,9,NULL,'',110023,'Same as Current','896703653000','N.A','','',NULL,2,1,NULL,'No','No','Active',10,1,1,9,NULL,'2017-04-25 04:09:17','2017-05-02 07:19:24',1,NULL,NULL,NULL,NULL,2),(33,'68','EMP0000033',NULL,NULL,'Bhawna',NULL,'Kansotia','1992-10-29','Female','9654014552',NULL,'bhawna@redefine.in','16/587, 1-floor,Bapa Nagar, Karol Bagh, Delhi-110005',1,9,NULL,NULL,110005,'Same as Current','875005688602','CCPPB22489',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',8,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 07:15:26',1,NULL,NULL,NULL,NULL,2),(34,'69','EMP0000034',NULL,'','Rajat','','Rathore','1990-10-12','Male','7795111251',NULL,'rajat.rathor@redefine.in','Flat 1802, A1 Tower,Gardenia Glory, Sec 46, Noida – 201301',1,35,NULL,'',201301,'Same as Current','810336007378','ASNPR7948D','','',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:21:02',1,NULL,NULL,NULL,NULL,2),(35,'70','EMP0000035',NULL,'','Reshu ','','',NULL,'Male','9891391702',NULL,'reshu.dwivedi@redefine.in','A-1/21, Sec 18, Rohini,Delhi – 110085',1,9,NULL,'',110085,'Same as Current','723805728700','CLEPD7171G','','',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:21:42',1,NULL,NULL,NULL,NULL,2),(36,'72','EMP0000036',NULL,NULL,'Sahiba','Kaur','Chawla',NULL,'Female','9999845366',NULL,'sahibakaur.chawla@redefine.in','32/20 East Patel Nagar New Delhi – 110008',1,9,NULL,NULL,110008,'Same as Current','455120389983','ARMPC7657A','DL-1020100034643','Unmarried',NULL,2,1,NULL,'No','No','Active',5,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 06:50:19',1,NULL,NULL,NULL,NULL,2),(37,'76','EMP0000037',NULL,'','Pawan','','Jha','1994-08-07','Male','9716161033',NULL,'pawan.jha@redefine.in','157 new pmgp colony anand nagar eastern express highway mumbai mulund east maharasthra - 400081',1,20,486,'',400081,'Dharam vihar Khora colony Ghaziabad up ','678528940071','AVHPJ9783H','','',NULL,2,1,NULL,'No','No','Active',10,1,1,9,NULL,'2017-04-25 04:09:17','2017-05-02 07:18:48',1,NULL,NULL,NULL,NULL,2),(38,'83','EMP0000038',NULL,'','Mansi ','','Grover','1993-05-10','Female','9313909729',NULL,'mansi.grover@redefine.in','A- 73 Extn Mohan Garden Uttam nagar new delhi -110059',1,9,NULL,'',110059,'Same as Current','225190820178','BQGPG9012H','','',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:17','2017-05-02 07:33:43',1,NULL,NULL,NULL,NULL,2),(39,'92','EMP0000039',NULL,'','Sahil','','Kanda','1996-08-31','Male','8377062838',NULL,'sahil.kanda@redefine.in','H-192 Uttam Nagar Mohan Garden ,Rama Park Road Delhi-110059',1,9,NULL,'',110059,'Same as Current','430397673194','EAJPK2591F','','',NULL,2,1,NULL,'No','No','Active',21,1,1,8,NULL,'2017-04-25 04:09:17','2017-05-03 04:46:05',1,NULL,NULL,NULL,NULL,2),(40,'94','EMP0000040',NULL,NULL,'Smita',NULL,'Jha','1993-12-09','Female','9599329060',NULL,'smita.jha@redefine.in','B-31,Plot no 10,Himalyan Residency ,Dwarka,Sec-22 delhi-110077',1,9,NULL,NULL,110077,'Same as Current','207453522783','FRHPS2882F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',2,1,1,2,NULL,'2017-04-25 04:09:17','2017-05-01 07:17:33',1,NULL,NULL,NULL,NULL,1),(41,'95','EMP0000041',NULL,NULL,'Mohammed',NULL,'Hussain','1995-10-24','Male','9900293283',NULL,'mohammed.hussain@redefine.in','Hno- 283/4 16th cross ,devarajus nagar,old guddahalli mysore road Bangalore- 560026',1,17,NULL,NULL,560026,'Same as Current','0','ALEPH0106R',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',3,1,2,5,NULL,'2017-04-25 04:09:17','2017-05-01 07:17:42',1,NULL,NULL,NULL,NULL,2),(42,'101','EMP0000042',NULL,NULL,'Pankhuri',NULL,'Singh','1995-12-05','Male','9971908034',NULL,'pankhuri.singh@redefine.in','64/11 Railway Colony Subzi mandi pratap nagar delhi-110007',1,9,NULL,NULL,110007,'Same as Current','323103610078','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',16,1,1,4,NULL,'2017-04-25 04:09:18','2017-05-02 07:29:24',1,NULL,NULL,NULL,NULL,9),(43,'102','EMP0000043',NULL,'Miss.','Twinkle','','Aggarwal','1996-08-10','Female','9582044757',NULL,'twinkle.aggarwal@redefine.in','Same as Current',1,9,1033,'',110051,' A-68 Aram ParkNear Chandu Park Krishna Nagar Ram Nagar Delhi-110051','318304392288','BQSPA3155M','','UnMarried',3,2,1,2,'No','No','Active',6,1,1,8,NULL,'2017-04-25 04:09:18','2017-05-02 09:15:02',1,NULL,NULL,NULL,NULL,9),(44,'106','EMP0000044',NULL,'','Kritika','','Jain','1993-07-08','Female','9953102801',NULL,'kritika.jain@redefine.in','C-31/5 B,street no 2 , Arjun Mohalla ,Maujpur north east delhi 110053',1,9,139,'Delhi',110053,'Same as Current','611055444724','NOT HAVING','','',NULL,2,1,NULL,'No','No','Active',16,1,1,8,NULL,'2017-04-25 04:09:18','2017-05-02 09:06:04',1,NULL,NULL,NULL,NULL,9),(45,'107','EMP0000045',NULL,'','M.','','Vijay','1990-09-03','Male','7531031247',NULL,'mani.vijay@redefine.in','DDA Colony House no C634 2nd Floor Khyala Near Subhash Nagar New Delhi -110018 ',1,9,138,'',110018,'Same as Current','889951406510','ANRPV7882P','','UnMarried',3,2,1,2,'No','No','Active',16,1,1,8,NULL,'2017-04-25 04:09:18','2017-05-02 09:15:38',1,NULL,NULL,NULL,NULL,9),(46,'110','EMP0000046',NULL,NULL,'Vipul',NULL,'Kumar','1995-08-19','Male','8447727091',NULL,'vipul.kumar@redefine.in','6178/1 , Block 1 gali no 3 Dev Nagar Karol Bagh Delhi - 110005',1,9,NULL,NULL,110008,'18/13 west patel nagar New Delhi - 110008','217293351361','AGGPK4451L',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',6,1,1,4,NULL,'2017-04-25 04:09:18','2017-05-02 07:30:25',1,NULL,NULL,NULL,NULL,9),(47,'111','EMP0000047',NULL,'','Aryan','','Singh','1998-01-22','Male','9205854394',NULL,'aryan.singh@redefine.in','Same as Current',1,9,138,'',110015,'B-452 Sudarshan park new delhi-110015','577273113535','HGBPS1753J','DL-1020160145459','',4,2,1,2,'No','No','Active',6,1,1,8,NULL,'2017-04-25 04:09:18','2017-05-02 09:13:33',1,NULL,NULL,NULL,NULL,9),(48,'112','EMP0000048',NULL,NULL,'Ayush',NULL,'Sharma','1994-04-19','Male','9582620251',NULL,'ayush.sharma@redefine.in','944 Ram Puram Muzaffarnagar UP pin-251001',1,9,NULL,NULL,110008,'4/2 west patel nagar block 4 opp women\'s showroom delhi- 110008','276876665419','HCYPS9625C',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',16,1,1,4,NULL,'2017-04-25 04:09:18','2017-05-02 07:30:52',1,NULL,NULL,NULL,NULL,9),(49,'114','EMP0000049',NULL,'','Akshay','','Verma','1993-01-24','Male','8802681891',NULL,'akshay.verma@redefine.in','2237/2 Kham pur West Patel nagar - new delhi 110008',1,9,NULL,'',110008,'Same as Current','664037777765','ASFPV9970P','','',NULL,2,1,NULL,'No','No','Active',17,1,1,10,NULL,'2017-04-25 04:09:18','2017-05-02 07:22:19',1,NULL,NULL,NULL,NULL,2),(50,'116','EMP0000050',NULL,NULL,'Rahul',NULL,'Gupta','1991-05-25','Male','9920479760',NULL,'rahul.gupta@redefine.in','Sai Shradha Seva Mandal,Jija Mata,Appa pada,Kurar Village,Malad East S.O, Mumbai,Maharashtra- 4000097',1,20,486,NULL,4000097,'Same as Current','277882435239','ATKPG2068F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',3,1,3,5,NULL,'2017-04-25 04:09:18','2017-05-01 07:20:07',1,NULL,NULL,NULL,NULL,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_employers`
--

LOCK TABLES `esic_employers` WRITE;
/*!40000 ALTER TABLE `esic_employers` DISABLE KEYS */;
INSERT INTO `esic_employers` VALUES (1,'1,2,4,5,8',2,'2017-05-01','2017-05-31',1,NULL,'2017-05-02 05:02:57','2017-05-02 05:02:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_masters`
--

LOCK TABLES `esic_masters` WRITE;
/*!40000 ALTER TABLE `esic_masters` DISABLE KEYS */;
INSERT INTO `esic_masters` VALUES (1,1,1.75,0.00,'2017-05-01',21000.00,'1,2,4,5,8',NULL,'2017-05-02 04:52:25','2017-05-02 04:52:25',1,'2017-05-31');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` VALUES (1,26,'Redefine Marcom Pvt.Ltd.','Response Executive','2','21333',NULL,NULL,NULL,'2017-05-02 08:47:07','2017-05-02 08:47:07'),(2,27,'Weblink.net','business developer executive','8 Months','15000',NULL,NULL,NULL,'2017-05-02 08:50:21','2017-05-02 08:50:21'),(3,45,'Axiom','Customer care excutive','2','1.92',NULL,NULL,NULL,'2017-05-02 09:03:32','2017-05-02 09:03:32'),(4,29,'Ienergizer','Executive','1','14,ooo',NULL,NULL,NULL,'2017-05-02 09:04:25','2017-05-02 09:04:25'),(5,15,'Machwan Communication Pvt Ltd','Sr. Executive Database','3.5','2.20',NULL,NULL,NULL,'2017-05-02 09:28:36','2017-05-02 09:28:36'),(6,15,'Prognosys Direct Pvt Ltd','Sr. Executive Database','3','2.30',NULL,NULL,NULL,'2017-05-02 09:29:11','2017-05-02 09:29:11'),(7,15,'TBCS Data','Asst. Manager  - Database','1.5','2.88',NULL,NULL,NULL,'2017-05-02 09:29:34','2017-05-02 09:29:34'),(8,30,'Brillianz Eduction Group','Senior counsellor','1.5','3000 AED',NULL,NULL,NULL,'2017-05-02 09:39:51','2017-05-02 09:39:51'),(9,13,'Ssignature Siestas PVT LTD','TO Councellor','3.5','22000',NULL,NULL,NULL,'2017-05-02 09:43:52','2017-05-02 09:43:52'),(10,38,'HDFC Life Insurance ','counselor','2016','18,000',NULL,NULL,NULL,'2017-05-02 09:43:57','2017-05-02 09:44:55'),(11,13,'AGWO','Volunteer','1.5','20000',NULL,NULL,NULL,'2017-05-02 09:44:35','2017-05-02 09:44:35'),(12,34,'GCL (Gopal Group)','Executive-IT/SAP MM Functional Consultant','3','321840',NULL,NULL,NULL,'2017-05-02 09:55:27','2017-05-02 09:55:49'),(13,17,'Solutions Integrated Marketing Services Pvt Limited','Response Executive','9 month','',NULL,NULL,NULL,'2017-05-02 10:09:32','2017-05-02 10:09:32'),(14,17,'Solutions Integrated Marketing Services Pvt Limited','Team Leader','1 year','',NULL,NULL,NULL,'2017-05-02 10:10:20','2017-05-02 10:10:20'),(15,17,'Solutions Integrated Marketing Services Pvt Limited','Supervisor','2 years','',NULL,NULL,NULL,'2017-05-02 10:11:14','2017-05-02 10:11:14'),(16,17,'NComputing','Marketing Specialist','1 Year','',NULL,NULL,NULL,'2017-05-02 10:11:57','2017-05-02 10:11:57'),(17,10,'Channel Technology Pvt Ltd ','Senior TL','4 Years','',NULL,NULL,NULL,'2017-05-02 10:21:14','2017-05-02 10:24:06'),(18,10,'IIFL ','Marketing Executive','1 Year','',NULL,NULL,NULL,'2017-05-02 10:21:59','2017-05-02 10:21:59'),(19,10,'Infoedge','Senior Marketing Executive','3 Mointh','',NULL,NULL,NULL,'2017-05-02 10:23:22','2017-05-02 10:23:22'),(20,25,'Proboyz Event Solutions ','Production Executive ','9 Months ','',NULL,NULL,NULL,'2017-05-02 10:26:24','2017-05-02 10:26:24'),(21,25,'Genie Infotainment Pvt Ltd ','Team Lead Marketing ','11 Months ','',NULL,NULL,NULL,'2017-05-02 10:27:06','2017-05-02 10:27:06'),(22,25,'Franchise India Brand Ltd ','Executive Operations ','1 Year ','',NULL,NULL,NULL,'2017-05-02 10:27:39','2017-05-02 10:27:39'),(23,33,'Spurinfoconsultancy','SEO Executive','1.5','15',NULL,NULL,NULL,'2017-05-02 10:38:02','2017-05-02 10:41:40'),(24,40,'Blue Feathers','Content Creator & Writer','1 ','22,000/month ',NULL,NULL,NULL,'2017-05-02 10:41:37','2017-05-02 10:41:37'),(25,18,'Emediscene','3d Designer','1 year','15,000',NULL,NULL,NULL,'2017-05-02 10:42:04','2017-05-02 10:50:44'),(26,8,'DIMS','Web Designer','4','',NULL,NULL,NULL,'2017-05-02 10:46:15','2017-05-02 10:46:15'),(27,8,'Culture holidays','Web Designer','6 month','',NULL,NULL,NULL,'2017-05-02 10:47:21','2017-05-02 10:47:21'),(28,8,'Paras Holidays','Web Designer','2 month','',NULL,NULL,NULL,'2017-05-02 10:48:10','2017-05-02 10:48:10'),(29,31,'Pournavi Events','Event Supervisor ','0.8','',NULL,NULL,NULL,'2017-05-02 11:05:49','2017-05-02 11:05:49'),(30,31,'Red Pacific Events ','Event Executive ','1.6','',NULL,NULL,NULL,'2017-05-02 11:06:30','2017-05-02 11:06:30'),(31,22,'Dish Tv','CCE','1','14',NULL,NULL,NULL,'2017-05-02 11:09:55','2017-05-02 11:09:55'),(32,19,'Bharti Airtel','Sales Executive','2008-2011','1.1LAKH',NULL,NULL,NULL,'2017-05-02 11:15:36','2017-05-02 11:15:36'),(33,2,'Emediscene','3d Designer','1 year','15,000',NULL,NULL,NULL,'2017-05-02 11:27:40','2017-05-02 11:30:28'),(34,19,'Truknox Technologies  Pvt. Ltd.','Relationship Manager','2','1.9Lakh',NULL,NULL,NULL,'2017-05-02 11:28:32','2017-05-02 11:28:32'),(35,19,'Onevents and Promotions Pvt. Ltd.','Operation Manager','4','3Lakh',NULL,NULL,NULL,'2017-05-02 11:33:23','2017-05-02 11:33:23'),(36,5,'Knight Kings Pvt Ltd','Manager','6 Months','',NULL,NULL,NULL,'2017-05-03 04:10:11','2017-05-03 04:10:11'),(37,12,'Duckback Informations Pvt Ltd','Manager Sales','7','',NULL,NULL,NULL,'2017-05-03 04:14:15','2017-05-03 04:18:10'),(38,11,'I dream biz','Event Executive','1.5','',NULL,NULL,NULL,'2017-05-03 04:20:29','2017-05-03 04:20:29'),(39,20,'End to End Markaeting','Response Executive','10 Months','',NULL,NULL,NULL,'2017-05-03 04:22:19','2017-05-03 04:22:19'),(40,20,'Les Concierge Services','Operations Exec','1 Year 3 Months','',NULL,NULL,NULL,'2017-05-03 04:22:51','2017-05-03 04:22:51'),(41,20,'L B Associates','Assistant Manager - Space Selling','4 Months','',NULL,NULL,NULL,'2017-05-03 04:23:11','2017-05-03 04:23:11'),(42,39,'Satguru Associates','Assistant Accountant','1','',NULL,NULL,NULL,'2017-05-03 04:41:48','2017-05-03 04:41:48'),(43,7,'Ajanta Offset Pvt Ltd.','Co-ordination','5 Years','',NULL,NULL,NULL,'2017-05-03 05:26:59','2017-05-03 05:26:59'),(44,7,'First Flight ','Ops','3 Years','',NULL,NULL,NULL,'2017-05-03 05:27:31','2017-05-03 05:27:31'),(45,36,'Tangent Films','Assistant Director','1.4','',NULL,NULL,NULL,'2017-05-08 06:28:32','2017-05-08 06:28:32'),(46,41,'Promence Events &Branding','Opertion Executive','1yr 2 month','15000/-',NULL,NULL,NULL,'2017-05-09 06:40:18','2017-05-09 06:40:18'),(47,41,'Purnatha sales & Marketing pvt ltd','Operation executive','1 year','18000/-',NULL,NULL,NULL,'2017-05-09 06:42:00','2017-05-09 06:42:00');
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
  CONSTRAINT `fk_rails_951b58ed70` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_4683ab9fbb` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7fb6f3c699` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
INSERT INTO `families` VALUES (1,6,NULL,'Kuldeep','Kumar','Sharma','Male','1992-08-24',24,'9999401556','','','Married','Husband','','','',NULL,'',NULL,NULL,'No',NULL,'',NULL,2,'2017-05-02 08:46:44','2017-05-02 08:46:44'),(2,24,NULL,'Anita','','Kumari','','1968-03-20',NULL,'','','','','Mother','','','',NULL,'',NULL,NULL,'',NULL,'','',NULL,'2017-05-02 08:48:51','2017-05-02 08:50:00'),(3,26,NULL,'Anita','','Negi','Female','1971-04-25',46,'9818719308','','I-16/258,Pyare Lal Road, Karol Bagh','Married','Mother','Working','','',NULL,'',NULL,NULL,'No',1,'',NULL,2,'2017-05-02 08:53:35','2017-05-02 08:53:35'),(4,27,NULL,'Suraj','Mani','sharma','Male',NULL,57,'9711897054','','22/268 Panchkuian Road Mandir marg New Delhi','Married','Father','Goverment Employee','','',NULL,'',NULL,NULL,'',NULL,'',NULL,2,'2017-05-02 08:54:33','2017-05-02 08:54:33'),(5,27,NULL,'Vijay ','Laxmi ','Sharma','Female',NULL,43,'9910616881','','22/268 Panchkuian Road Mandir marg New Delhi','Married','Mother','House Wife','','',NULL,'',NULL,NULL,'',NULL,'',NULL,2,'2017-05-02 08:56:04','2017-05-02 08:56:04'),(6,44,NULL,'Suman','','Jain','Female',NULL,48,'9711826320','','c-31/5B abhimanyu street number-2 , arjun mohallah , moujpur , delhi-110053','Married','Mother','','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,5,'2017-05-02 09:04:10','2017-05-02 09:04:10'),(7,29,NULL,'Ram ','Babu','Jain','Male','1960-10-06',57,'9899183185','','Hno 1/5650,Balbir Nagar Ext., Shahdara, Delhi-32','','Father','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,5,'2017-05-02 09:07:20','2017-05-02 09:07:20'),(8,47,NULL,'Hakim','','Singh','Male',NULL,51,'9818447415','','B-452 Sudershan Park,New Delhi-15','Married','Father','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,2,'2017-05-02 09:09:49','2017-05-02 09:09:49'),(9,45,NULL,'R','','Laxmi','Female',NULL,48,'7531074206','NA','DDA Colony Khayla New Delhi  H-N C-634 2 Floor - Pin 110018 ','Married','Mom','House Wife','','',NULL,'',NULL,NULL,'No',NULL,'',NULL,2,'2017-05-02 09:13:32','2017-05-02 09:13:32'),(10,42,NULL,'Neetu','','Singh','Female','1975-09-29',41,'9811947805','singhneetu32@gmail.com','64/11 Railway Colony, Subzi Mandi, Pratap Nagar, Delhi-110007','','Mother','House Wife','','',NULL,'',NULL,NULL,'',3,'','',2,'2017-05-02 09:17:05','2017-05-02 09:17:20'),(11,43,NULL,'Anita','','Aggarwal','Female','1968-10-01',49,'8860508054','','A-68 Aram Park Near Chandu Park,Ram Nagar,Krishna Nagar','Married','Mother','House Wife','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-02 09:18:00','2017-05-02 09:18:00'),(12,48,NULL,'satish','kumar','sharma','Male',NULL,56,'9045003235','','','Married','father','','','',NULL,'',NULL,NULL,'No',2,'',NULL,2,'2017-05-02 09:24:32','2017-05-02 09:24:32'),(13,28,NULL,'Mahavir','','Singh','Male','1964-02-28',54,'9810186782','mahavirsingh1964@gmail.com','108 - C, DDA Flats, Gazipur','Married','Father','','','',NULL,'',NULL,NULL,'Yes',4,'No',NULL,2,'2017-05-02 09:26:47','2017-05-02 09:26:47'),(14,15,NULL,'Archana','','Priyadarshani','Female','1987-02-02',28,'8750085444','archuace@gmail.com','H.No- E-28, Sarswati Enclave, Kadipur ,Gurgaon-122001','Married','Wife','Working','','',NULL,'',NULL,NULL,'Yes',3,'No',NULL,2,'2017-05-02 09:35:08','2017-05-02 09:35:08'),(15,32,NULL,'R.','','Ramu','Male',NULL,51,'9891524833','','Same','Married','Father','','','',NULL,'',NULL,NULL,'',1,'',NULL,2,'2017-05-02 09:35:31','2017-05-02 09:35:31'),(16,15,NULL,'Saurabh','Kumar','Jha','','2011-01-19',6,'','','Same','','Son','','','',NULL,'',NULL,NULL,'',3,'',NULL,NULL,'2017-05-02 09:35:52','2017-05-02 09:35:52'),(17,15,NULL,'Mira','','Jha','',NULL,60,'','','','','Mother','','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-02 09:36:17','2017-05-02 09:36:17'),(18,49,NULL,'Mr. Ajay','Kumar','Verma','Male','1966-08-11',51,'8802681891','','same','','Father','Business','','',NULL,'',NULL,NULL,'Yes',NULL,'No',NULL,2,'2017-05-02 09:46:02','2017-05-02 09:46:02'),(19,30,NULL,'Harbans','','kaur','Female',NULL,NULL,'9910527496','simran.k4203@gmail.com','','Married','Mother','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,NULL,'2017-05-02 09:49:13','2017-05-02 09:49:13'),(20,38,NULL,'Mohan','','Lal','Male','1963-10-15',54,'8800754425','','Same','Married','Father','','','',NULL,'',NULL,NULL,'No',3,'No',NULL,2,'2017-05-02 09:50:54','2017-05-02 09:50:54'),(21,13,NULL,'Manish','Kumar','Chabra','Male','2017-05-13',35,'8447059329','manishchabra@gmail.com','N-11 Old double storey Lajpat Nagar-1v','Married','Spouse','Business','','',NULL,'',NULL,NULL,'Yes',3,'No',NULL,2,'2017-05-02 09:52:21','2017-05-02 09:52:21'),(22,34,NULL,'RAJAT','','RATHOR','Male','1990-10-12',26,'8377884177','rajat.rathor2007@gmail.com','F-1802, A1 TOWER , GARDENIA GLORY ,NOIDA-46,(U.P)','Married','Single','','','ASNPR7948D',NULL,'	K-6077456',NULL,NULL,'No',3,'No',NULL,2,'2017-05-02 10:05:39','2017-05-02 10:05:39'),(23,17,NULL,'Nitin','','Wadhwa','Male','1984-07-27',32,'9711177017','','cc-89/c shalimar bagh','Married','Husband','','','',NULL,'',NULL,NULL,'No',3,'No',NULL,2,'2017-05-02 10:16:11','2017-05-02 10:16:11'),(24,23,NULL,'Babu ','Ram','Paudyal','Male',NULL,NULL,'9810844183','b.paudyal121@redefine.in','Sector4/B House No.2029, Vasundhara Ghaziabad','','Father','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,2,'2017-05-02 10:26:56','2017-05-02 10:26:56'),(25,23,NULL,'Saraswati','','Paudyal','Female',NULL,NULL,'9810324750','','Sector4/B House No.2029, Vasundhara Ghaziabad','Married','Mother','','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-02 10:29:55','2017-05-02 10:29:55'),(26,25,NULL,'Rajender ','Singh ','Bist ','Male',NULL,NULL,'','','','Married','Father ','','','',NULL,'',NULL,NULL,'',3,'',NULL,2,'2017-05-02 10:34:39','2017-05-02 10:34:39'),(27,25,NULL,'Sarojini ','','Bist ','Female',NULL,NULL,'','','','Married','Mother ','','','',NULL,'',NULL,NULL,'',3,'',NULL,2,'2017-05-02 10:35:29','2017-05-02 10:35:29'),(28,10,NULL,'Amrita','','Dubey','Female',NULL,NULL,'9821909825','','','Married','wife','','','',NULL,'',NULL,NULL,'',3,'No',NULL,2,'2017-05-02 10:39:45','2017-05-02 10:39:45'),(29,40,NULL,'Sunila ','','Jha','Male',NULL,NULL,'','','','','Mother ','','','',NULL,'',NULL,NULL,'',3,'',NULL,NULL,'2017-05-02 10:44:47','2017-05-02 10:44:47'),(30,18,NULL,'Kamlesh ','','Devi','Female',NULL,NULL,'9871483741','','','','Mother','','','',NULL,'',NULL,NULL,'',NULL,'','',2,'2017-05-02 10:45:23','2017-05-02 10:46:34'),(31,18,NULL,'Devender','',' Singh','',NULL,NULL,'9871483741','','','','Father','Clark in Andhra Bank','','',NULL,'',NULL,NULL,'',NULL,'','',NULL,'2017-05-02 10:46:14','2017-05-02 10:48:56'),(32,33,NULL,'Chamal','','Lal','Male',NULL,NULL,'8826570299','','16/587 \"H\" First Floor, Bapa Nagar, Hardhyan Singh Road, Karol Bagh New Delhi 110005','Married','Father','Tailor','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-02 10:50:37','2017-05-02 10:50:37'),(33,8,NULL,'Geeta ','','Kumar','Female','1988-01-19',28,'9871088347','','A-453, Hastsal Road, Uttam Nagar, New Delhi-59','Married','Wife','','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-02 10:55:37','2017-05-02 10:55:37'),(34,31,NULL,'Promila','','Marwah','Female','1959-10-29',55,'9540989295','madhumarwah80@gmail.com','C - 121/A Ganesh Nagar , New Delhi -  110018','Married','Mother','','','',NULL,'',NULL,NULL,'Yes',NULL,'No',NULL,2,'2017-05-02 11:03:21','2017-05-02 11:03:21'),(35,22,NULL,'Sushma','','Sharma','Female','1962-01-09',55,'7065482085','','T-25, Baljeet Nagar','Married','Mother','House Wife','','',NULL,'',NULL,NULL,'No',NULL,'No',NULL,2,'2017-05-02 11:16:34','2017-05-02 11:16:34'),(36,2,NULL,'Kamlesh ','','Devi','',NULL,NULL,'','','','','Mother','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,NULL,'2017-05-02 11:31:55','2017-05-02 11:31:55'),(37,2,NULL,'Devender ','','Singh','',NULL,NULL,'','','','','Father','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,NULL,'2017-05-02 11:32:17','2017-05-02 11:32:17'),(38,2,NULL,'Deepa','','Kumari','','1987-08-28',30,'','','','','Wife','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,NULL,'2017-05-02 11:33:26','2017-05-02 11:33:26'),(39,19,NULL,'Ghanshyam ','','Verma','Male',NULL,NULL,'','','V-65,Uttam Nagar','','Father','','','',NULL,'',NULL,NULL,'',3,'',NULL,NULL,'2017-05-02 11:45:27','2017-05-02 11:45:27'),(40,19,NULL,'sangita','','verma','Female','2017-12-08',NULL,'9891769703','sangita.brijesh@gmail.com','V- 65, vishu vihar, uttam Nagar, New Delhi- 110059','','Wife','','','',NULL,'',NULL,NULL,'',3,'',NULL,2,'2017-05-02 11:47:51','2017-05-02 11:47:51'),(41,5,NULL,'Dolly','','Gupta','Female','1985-07-19',32,'9711409161','23doll1985@gmail.com','','','Wife','','','',NULL,'',NULL,NULL,'',3,'',NULL,NULL,'2017-05-03 04:12:06','2017-05-03 04:12:06'),(42,12,NULL,'Deepika','','Guru','',NULL,NULL,'','','','','Wife','','','',NULL,'',NULL,NULL,'',NULL,'',NULL,NULL,'2017-05-03 04:22:20','2017-05-03 04:22:20'),(43,20,NULL,'Ghazala ','','Sherin','Female','2017-09-17',52,'9313542471','','','Married','Mother','','','',NULL,'',NULL,NULL,'No',NULL,'No',NULL,3,'2017-05-03 04:25:25','2017-05-03 04:25:25'),(44,11,NULL,'Priyanshu','','Shukla','Male','1987-09-21',30,'7827880348','priyanshu44@gmail.com','D-12,S-4, Dilshad Colony,Delhi- 95','','Husband','','','',NULL,'',NULL,NULL,'',3,'',NULL,2,'2017-05-03 04:27:39','2017-05-03 04:27:39'),(45,39,NULL,'ANNU','','KANDA','Female',NULL,45,'8510075744','','SAME','Married','SON','','','',NULL,'',NULL,NULL,'',NULL,'No',NULL,2,'2017-05-03 04:45:13','2017-05-03 04:45:13'),(46,7,NULL,'Anita','','Devi','Female','1985-06-12',32,'9650776747','','Same','Married','Wife','','','',NULL,'',NULL,NULL,'',4,'No','',2,'2017-05-03 05:28:35','2017-05-03 05:29:32'),(47,36,NULL,'Eddy','','Singh','Male','1963-09-07',54,'9811556171','singheddy@gmail.com','','Married','Father','','','',NULL,'',NULL,NULL,'Yes',5,'No',NULL,4,'2017-05-08 06:35:23','2017-05-08 06:35:23'),(48,41,NULL,'ashfaq ','','ahmed','Male',NULL,50,'9845775042','','Same','Married','Father','','','',NULL,'',NULL,NULL,'No',NULL,'No',NULL,3,'2017-05-09 06:46:02','2017-05-09 06:46:02');
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
  CONSTRAINT `fk_rails_5c40ebfbdd` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_bunches`
--

LOCK TABLES `goal_bunches` WRITE;
/*!40000 ALTER TABLE `goal_bunches` DISABLE KEYS */;
INSERT INTO `goal_bunches` VALUES (1,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-01 12:23:04','2017-05-01 12:23:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-01 12:41:40','2017-05-01 12:41:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-02 11:22:58','2017-05-02 11:22:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-11 10:30:02','2017-05-11 10:30:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(5,4,1,'I have worked hard to meet all the goals and  beyond',1,'3.4','can be recommended for promotion.',1,'ok',1,'develop this resource',1,'2017-05-15 06:48:04','2017-05-15 08:19:28',NULL,1,1,NULL,NULL,NULL,NULL,'3.9',1,4,2,1,4,4,1,74,NULL,1),(6,4,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-05-15 08:01:57','2017-05-15 08:14:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `goal_bunches` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_perspectives`
--

LOCK TABLES `goal_perspectives` WRITE;
/*!40000 ALTER TABLE `goal_perspectives` DISABLE KEYS */;
INSERT INTO `goal_perspectives` VALUES (1,'Internal',NULL,'2017-05-11 10:29:27','2017-05-11 10:29:43',1,0,NULL,NULL),(2,'Customer',NULL,'2017-05-11 10:29:38','2017-05-15 07:17:27',1,0,NULL,NULL),(3,'Learning and Growth',NULL,'2017-05-15 07:17:40','2017-05-15 07:17:40',1,0,NULL,NULL),(4,'Financials',NULL,'2017-05-15 07:17:50','2017-05-15 07:17:50',1,0,NULL,NULL);
/*!40000 ALTER TABLE `goal_perspectives` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_ratings`
--

LOCK TABLES `goal_ratings` WRITE;
/*!40000 ALTER TABLE `goal_ratings` DISABLE KEYS */;
INSERT INTO `goal_ratings` VALUES (1,4,1,80,'3 customer','3','Yes',NULL,NULL,NULL,'2017-05-11 10:30:29','2017-05-11 10:30:29',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,14,21,NULL,NULL,NULL,14),(2,4,1,20,'20','200','',NULL,NULL,NULL,'2017-05-11 10:30:43','2017-05-11 10:30:43',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,14,21,NULL,NULL,NULL,14),(3,5,2,50,'New Customer acquisition','3 Per Quarter','Yes','3 new customers','Worked hard for new customer acquisition.3rd did not close','ok','2017-05-15 07:30:36','2017-05-15 08:17:12',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,4,2,1,3,4,4),(4,5,2,10,'Customer satisfaction level','98%','Yes','95%','there were 2 minor customer complaints that could have been avoided.','ok','2017-05-15 07:31:20','2017-05-15 08:17:12',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,4,2,1,3,3,4),(5,5,4,10,'Revenue increment','5 cr / year','Yes','15 cr','good job','ok','2017-05-15 07:31:48','2017-05-15 08:17:12',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,4,2,1,5,5,4),(6,5,3,5,'Team certifications','12 per year','No','9','needs improvement','ok','2017-05-15 07:33:44','2017-05-15 08:17:12',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,4,2,1,3,3,4),(7,5,1,5,'Office Timings','9:00 AM Daily','','came every day at 9.00 am','good','ok','2017-05-15 07:35:07','2017-05-15 08:17:12',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,1,4,2,1,5,5,4),(8,5,NULL,10,'Process improvement initiative','2','','2 new process initiatives','needs further understanding of business procecss in the area of logistics','ok','2017-05-15 07:35:52','2017-05-15 08:17:12',NULL,6,'Attribute',NULL,NULL,NULL,NULL,1,4,2,1,4,4,4),(9,5,NULL,10,'Proposal for new line of business','2 Per year','','new ideas of business proposed from time to time','needs better articulation','ok','2017-05-15 07:36:44','2017-05-15 08:17:12',NULL,1,'Attribute',NULL,NULL,NULL,NULL,1,4,2,1,3,3,4),(10,6,1,20,'Office Hour','9 hr daily','No',NULL,NULL,NULL,'2017-05-15 08:09:28','2017-05-15 08:09:28',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,2,4,2,NULL,NULL,NULL,4),(11,6,2,40,'Customer satisfaction level','90%','No',NULL,NULL,NULL,'2017-05-15 08:10:41','2017-05-15 08:10:41',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,2,4,2,NULL,NULL,NULL,4),(12,6,3,10,'Team certifications','9 certification','Yes',NULL,NULL,NULL,'2017-05-15 08:11:22','2017-05-15 08:11:22',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,2,4,2,NULL,NULL,NULL,4),(13,6,NULL,10,'Proposal for new line of business','3 per year','No',NULL,NULL,NULL,'2017-05-15 08:12:14','2017-05-15 08:12:14',NULL,1,'Attribute',NULL,NULL,NULL,NULL,2,4,2,NULL,NULL,NULL,4),(14,6,4,20,'Revenue increment','50','No',NULL,NULL,NULL,'2017-05-15 08:12:59','2017-05-15 08:12:59',NULL,NULL,'Goal',NULL,NULL,NULL,NULL,2,4,2,NULL,NULL,NULL,4);
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
INSERT INTO `groups` VALUES (1,'redefine@gmail.com','$2a$10$znB1Ku3ss4lcRkQzsIbmj.2pV7wNa83Lu8.Hss9oqULh/MzVIA22C','Redefine',NULL,NULL,NULL,10,'2017-05-01 12:11:39','2017-05-01 05:03:09','103.211.54.139','103.57.85.129','2017-04-20 07:11:34','2017-05-01 12:11:39',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_masters`
--

LOCK TABLES `induction_masters` WRITE;
/*!40000 ALTER TABLE `induction_masters` DISABLE KEYS */;
INSERT INTO `induction_masters` VALUES (1,'1','Employee','2017-05-02 12:41:19','2017-05-02 12:41:19',NULL,NULL,NULL,NULL);
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
  CONSTRAINT `fk_rails_33cd369925` FOREIGN KEY (`interview_round_id`) REFERENCES `interview_rounds` (`id`),
  CONSTRAINT `fk_rails_2f1e7bc8af` FOREIGN KEY (`interview_attribute_id`) REFERENCES `interview_attributes` (`id`),
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
  CONSTRAINT `fk_rails_5ebe9708fb` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_0f33a373bb` FOREIGN KEY (`interview_schedule_id`) REFERENCES `interview_schedules` (`id`)
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
  CONSTRAINT `fk_rails_916e2b2d35` FOREIGN KEY (`interview_type_id`) REFERENCES `interview_types` (`id`),
  CONSTRAINT `fk_rails_0d01eca257` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
  `is_confirm` tinyint(1) DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
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
  CONSTRAINT `fk_rails_be9ac0238f` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`),
  CONSTRAINT `fk_rails_114f4a43bc` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`),
  CONSTRAINT `fk_rails_2410ac093f` FOREIGN KEY (`issue_master_id`) REFERENCES `issue_masters` (`id`),
  CONSTRAINT `fk_rails_904e8b340a` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
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
  CONSTRAINT `fk_rails_3522022587` FOREIGN KEY (`issue_tracker_member_id`) REFERENCES `issue_tracker_members` (`id`),
  CONSTRAINT `fk_rails_208f22a42b` FOREIGN KEY (`issue_request_id`) REFERENCES `issue_requests` (`id`),
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
  CONSTRAINT `fk_rails_6e38c9381b` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_3849762bde` FOREIGN KEY (`issue_tracker_group_id`) REFERENCES `issue_tracker_groups` (`id`)
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
-- Table structure for table `joining_checklist_masters`
--

DROP TABLE IF EXISTS `joining_checklist_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joining_checklist_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_checklist_masters`
--

LOCK TABLES `joining_checklist_masters` WRITE;
/*!40000 ALTER TABLE `joining_checklist_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `joining_checklist_masters` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'2009-06-02',NULL,72,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(2,2,'2010-04-10',NULL,72,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(3,3,'2009-06-02',NULL,72,NULL,NULL,'100454115997','DLCPM10068000000000050','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(4,4,'2009-08-06',NULL,86,NULL,NULL,'100453998915','DLCPM10068000000000001','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(5,5,'2010-09-01',NULL,85,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(6,6,'2011-09-01',NULL,89,NULL,NULL,'100454215052','DLCPM10068000000000003','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(7,7,'2012-03-13',NULL,67,NULL,NULL,'100454364966','DLCPM10068000000000005','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(8,8,'2012-08-20',NULL,70,NULL,NULL,'100454271860','DLCPM10068000000000045','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(9,9,'2012-12-17',NULL,81,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(10,10,'2014-05-05',NULL,80,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(11,11,'2014-12-14',NULL,68,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(12,12,'2015-02-09',NULL,85,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(13,13,'2015-02-23',NULL,77,NULL,NULL,'100893530255','DLCPM10068000000000109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(14,14,'2015-03-09',NULL,79,NULL,NULL,'100938142893','DLCPM10068000000000116','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(15,15,'2015-05-01',NULL,66,NULL,NULL,'100454281216','DLCPM10068000000000031','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(16,16,'2015-05-15',NULL,91,NULL,NULL,'100929157502','DLCPM10068000000000124','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(17,17,'2015-06-01',NULL,64,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(18,18,'2015-06-07',NULL,61,NULL,NULL,'100915654721','DLCPM10068000000000132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(19,19,'2015-07-01',NULL,65,NULL,NULL,'100954207953','DLCPM10068000000000136','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(20,20,'2015-09-25',NULL,85,NULL,NULL,'0',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,NULL,1,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(21,21,'2015-11-04',NULL,73,NULL,NULL,'100454154711','DLCPM10068000000000002','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(22,22,'2015-12-17',NULL,78,'2016-08-01',NULL,'100454352217','DLCPM10068000000000060','1114536809.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(23,23,'2016-01-05',NULL,83,'2016-08-01',NULL,'100453970521','DLCPM10068000000000062','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(24,24,'2016-02-02',NULL,75,'2017-01-01',NULL,'100575414409','DLCPM10068000000000071',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(25,25,'2016-04-01',NULL,87,'2017-01-01',NULL,'100575091329','DLCPM10068000000000074','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(26,26,'2016-03-08',NULL,76,'2017-01-09',NULL,'100574854355','DLCPM10068000000000078','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(27,27,'2016-03-28',NULL,76,'2017-01-01',NULL,'100575339353','DLCPM10068000000000088','1114670572.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(28,28,'2016-04-05',NULL,76,'2017-01-01',NULL,'100864301745','DLCPM10068000000000093','1114700527.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(29,29,'2015-12-17',1,76,NULL,NULL,'100866989728','DLCPM10068000000000095',NULL,'','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','',NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-05-02 09:09:50','',NULL),(30,30,'2016-06-06',NULL,88,'2017-01-01',NULL,'100861245425','DLCPM10068000000000099','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(31,31,'2016-06-23',NULL,82,NULL,NULL,'100878897290','DLCPM10068000000000101','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(32,32,'2016-06-27',NULL,71,'2017-01-01',NULL,'100865716916','DLCPM10068000000000108','1114808738.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,4,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(33,33,'2016-06-28',NULL,84,'2017-01-01',NULL,'100859692032','DLCPM10068000000000103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(34,34,'2016-07-01',NULL,77,'2017-01-01',NULL,'100867410470','DLCPM10068000000000104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(35,35,'2016-08-16',NULL,77,NULL,NULL,'100865705849','DLCPM10068000000000105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(36,36,'2016-08-01',NULL,63,'2017-01-01',NULL,'100454027563','DLCPM10068000000000046','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(37,37,'2016-08-01',NULL,71,'2017-01-01',NULL,'100935819057','DLCPM10068000000000114','1114867111.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(38,38,'2016-08-01',NULL,77,NULL,NULL,'100934677694','DLCPM10068000000000117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(39,39,'2016-08-03',NULL,62,'2017-01-01',NULL,'100923234508','DLCPM10068000000000128','1114889070.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,4,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(40,40,'2016-08-22',NULL,69,'2017-04-01',NULL,'100917733456','DLCPM10068000000000123','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(41,41,'2016-08-22',NULL,78,'2017-04-01',NULL,'100913443268','DLCPM10068000000000122','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(42,42,'2016-09-01',NULL,76,'2017-01-01',NULL,'100930097309','DLCPM10068000000000131','1114889077.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(43,43,'2016-08-22',1,76,NULL,NULL,'100924407924','DLCPM10068000000000130','1114889076.0','','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','',1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-05-02 09:12:59','',NULL),(44,44,'2016-10-01',NULL,76,'2017-01-01',NULL,'100954207969','DLCPM10068000000000137','1114906878.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(45,45,'2016-10-03',NULL,76,NULL,NULL,'100453941212','DLCPM10068000000000054',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,4,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(46,46,'2016-10-06',NULL,76,NULL,NULL,'100954207982','DLCPM10068000000000139','1114906882.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(47,47,'2016-10-10',NULL,76,NULL,NULL,'100954207976','DLCPM10068000000000138','1114906881.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(48,48,'2016-11-09',NULL,76,NULL,NULL,'100957376055','DLCPM10068000000000140','1114926931.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,1,2,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(49,49,'2016-12-01',NULL,77,NULL,NULL,'100965093370','DLCPM10068000000010142','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL),(50,50,'2015-07-06',NULL,74,NULL,NULL,'100574945263','DLCPM10068000000000080','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,NULL,1,2,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'CL','Casual Leave','Casual Leave',NULL,'2017-04-20 07:00:41','2017-05-01 08:12:48',1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL),(2,'EL','Earned Leave','Earned Leave',NULL,'2017-04-20 07:00:41','2017-05-01 08:12:06',1,NULL,NULL,1,0,NULL,NULL,0,1,0,NULL),(3,'LWP','LWP Leave','LWP Leave',NULL,'2017-04-20 07:00:41','2017-04-27 07:22:00',0,NULL,NULL,1,0,NULL,NULL,0,0,0,NULL),(4,'4.0','ESIC','ESIC Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'5.0','AL','Advance Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'C.Off','C.Off','Compensatory Off',NULL,'2017-04-20 07:00:41','2017-05-03 05:05:12',0,NULL,NULL,0,0,NULL,NULL,0,0,0,NULL),(7,'SL','Sick Leave','Sick Leave',NULL,'2017-04-25 13:38:27','2017-05-01 08:12:14',1,NULL,NULL,1,0,NULL,NULL,0,1,0,NULL),(8,'SRL','Short Leave','Short Leave',NULL,'2017-05-01 09:05:39','2017-05-01 09:06:03',1,1,1,1,1,NULL,NULL,0,1,0,1);
/*!40000 ALTER TABLE `leav_categories` ENABLE KEYS */;
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
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_c_offs_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9c0707de08` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_c_offs`
--

LOCK TABLES `leave_c_offs` WRITE;
/*!40000 ALTER TABLE `leave_c_offs` DISABLE KEYS */;
INSERT INTO `leave_c_offs` VALUES (1,45,'2017-04-05','Full Day',0,0,0,NULL,'2017-05-03 04:59:23','2017-05-03 04:59:23',1.0,NULL,NULL),(2,16,'2017-03-24','Full Day',0,0,0,NULL,'2017-05-03 05:00:04','2017-05-03 05:00:04',1.0,NULL,NULL),(3,16,'2017-04-05','Full Day',0,0,0,NULL,'2017-05-03 05:00:23','2017-05-03 05:00:23',1.0,NULL,NULL);
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
  CONSTRAINT `fk_rails_a0ff1845b1` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_9d50fe4be1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_masters`
--

LOCK TABLES `leave_masters` WRITE;
/*!40000 ALTER TABLE `leave_masters` DISABLE KEYS */;
INSERT INTO `leave_masters` VALUES (1,1,'Yearly',NULL,'12',0,'','2017-05-01 08:14:53','2017-05-01 08:14:53',NULL),(2,8,'Monthly',NULL,'1',0,'','2017-05-01 09:06:32','2017-05-01 09:06:32',NULL),(3,2,'Yearly',NULL,'6',1,'3','2017-05-01 09:09:09','2017-05-01 09:09:09',NULL),(4,7,'Yearly',NULL,'6',0,'','2017-05-01 09:09:26','2017-05-01 09:09:26',NULL);
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
  CONSTRAINT `fk_rails_caa1617fdd` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_7084af96c0` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_eb9a898167` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_records`
--

LOCK TABLES `leave_records` WRITE;
/*!40000 ALTER TABLE `leave_records` DISABLE KEYS */;
INSERT INTO `leave_records` VALUES (1,2,5,'2017-05-06','FirstApproved','2017-05-03 04:53:40','2017-05-03 04:53:40',1,1),(2,3,11,'2017-05-15','FirstApproved','2017-05-03 05:13:04','2017-05-03 05:13:04',1,1),(3,3,11,'2017-05-16','FirstApproved','2017-05-03 05:13:04','2017-05-03 05:13:04',1,1),(4,3,11,'2017-05-17','FirstApproved','2017-05-03 05:13:04','2017-05-03 05:13:04',1,1),(5,3,11,'2017-05-18','FirstApproved','2017-05-03 05:13:04','2017-05-03 05:13:04',1,1),(6,4,36,'2017-05-01','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(7,4,36,'2017-05-02','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(8,4,36,'2017-05-03','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(9,4,36,'2017-05-04','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(10,4,36,'2017-05-05','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(11,4,36,'2017-05-06','Pending','2017-05-08 06:38:43','2017-05-08 06:38:43',1,7),(12,5,41,'2017-05-12','Pending','2017-05-09 06:51:14','2017-05-09 06:51:14',1,1),(13,6,5,'2017-05-15','Pending','2017-05-15 07:11:49','2017-05-15 07:11:49',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status_records`
--

LOCK TABLES `leave_status_records` WRITE;
/*!40000 ALTER TABLE `leave_status_records` DISABLE KEYS */;
INSERT INTO `leave_status_records` VALUES (1,2,'Pending','2017-05-03 00:00:00','2017-05-03 04:53:40','2017-05-03 04:53:40',1),(2,3,'Pending','2017-05-03 00:00:00','2017-05-03 05:13:04','2017-05-03 05:13:04',11),(3,3,'FirstApproved','2017-05-03 05:27:46','2017-05-03 05:27:46','2017-05-03 05:27:46',20),(4,2,'FirstApproved','2017-05-08 11:37:00','2017-05-08 11:37:00','2017-05-08 11:37:00',2),(5,5,'Pending','2017-05-09 00:00:00','2017-05-09 06:51:14','2017-05-09 06:51:14',41),(6,6,'Pending','2017-05-15 00:00:00','2017-05-15 07:11:49','2017-05-15 07:11:49',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (7,24,'2017-05-01 07:28:13','2017-05-01 07:28:13','2017-05-01','2017-05-02',16,9),(8,26,'2017-05-01 07:28:31','2017-05-01 07:28:31','2017-05-01','2017-05-02',16,9),(9,27,'2017-05-01 07:28:45','2017-05-01 07:28:45','2017-05-01','2017-05-02',16,9),(10,28,'2017-05-01 07:29:02','2017-05-01 07:29:02','2017-05-01','2017-05-02',6,9),(11,29,'2017-05-01 07:29:19','2017-05-01 07:29:19','2017-05-01','2017-05-02',6,9),(12,42,'2017-05-01 07:29:52','2017-05-01 07:29:52','2017-05-01','2017-05-02',16,9),(13,43,'2017-05-01 07:30:09','2017-05-01 07:30:09','2017-05-01','2017-05-02',6,9),(14,44,'2017-05-01 07:30:25','2017-05-01 07:30:25','2017-05-01','2017-05-02',16,9),(15,45,'2017-05-01 07:30:42','2017-05-01 07:30:42','2017-05-01','2017-05-02',16,9),(16,46,'2017-05-01 07:30:52','2017-05-01 07:30:52','2017-05-01','2017-05-02',6,9),(17,47,'2017-05-01 07:31:01','2017-05-01 07:31:01','2017-05-01','2017-05-02',6,9),(18,48,'2017-05-01 07:31:11','2017-05-01 07:31:11','2017-05-01','2017-05-02',16,9),(19,37,'2017-05-01 07:33:11','2017-05-01 07:33:11','2017-05-01','2017-05-01',10,2),(20,38,'2017-05-01 07:33:25','2017-05-01 07:33:25','2017-05-01','2017-05-01',17,2),(21,24,'2017-05-02 06:02:37','2017-05-02 06:02:37','2017-05-02','2017-05-02',9,NULL),(22,26,'2017-05-02 06:03:11','2017-05-02 06:03:11','2017-05-02','2017-05-02',9,NULL),(23,27,'2017-05-02 06:03:45','2017-05-02 06:03:45','2017-05-02','2017-05-02',9,NULL),(24,28,'2017-05-02 06:03:56','2017-05-02 06:03:56','2017-05-02','2017-05-02',9,NULL),(25,29,'2017-05-02 06:04:06','2017-05-02 06:04:06','2017-05-02','2017-05-02',9,NULL),(26,42,'2017-05-02 06:04:24','2017-05-02 06:04:24','2017-05-02','2017-05-02',9,NULL),(27,43,'2017-05-02 06:04:53','2017-05-02 06:04:53','2017-05-02','2017-05-02',9,NULL),(28,43,'2017-05-02 06:04:57','2017-05-02 06:04:57','2017-05-02','2017-05-02',9,NULL),(29,44,'2017-05-02 06:05:08','2017-05-02 06:05:08','2017-05-02','2017-05-02',9,NULL),(30,45,'2017-05-02 06:05:28','2017-05-02 06:05:28','2017-05-02','2017-05-02',9,NULL),(31,46,'2017-05-02 06:05:40','2017-05-02 06:05:40','2017-05-02','2017-05-02',9,NULL),(32,47,'2017-05-02 06:05:49','2017-05-02 06:05:49','2017-05-02','2017-05-02',9,NULL),(33,48,'2017-05-02 06:06:05','2017-05-02 06:06:05','2017-05-02','2017-05-02',9,NULL),(34,24,'2017-05-02 07:27:38','2017-05-02 07:27:38','2017-05-02',NULL,16,9),(35,26,'2017-05-02 07:27:50','2017-05-02 07:27:50','2017-05-02',NULL,16,9),(36,27,'2017-05-02 07:28:04','2017-05-02 07:28:04','2017-05-02',NULL,16,9),(37,28,'2017-05-02 07:28:20','2017-05-02 07:28:20','2017-05-02',NULL,6,9),(38,29,'2017-05-02 07:28:37','2017-05-02 07:28:37','2017-05-02',NULL,6,9),(39,42,'2017-05-02 07:29:14','2017-05-02 07:29:14','2017-05-02','2017-05-02',16,2),(40,42,'2017-05-02 07:29:24','2017-05-02 07:29:24','2017-05-02',NULL,16,9),(41,43,'2017-05-02 07:29:41','2017-05-02 07:29:41','2017-05-02',NULL,6,9),(42,44,'2017-05-02 07:30:00','2017-05-02 07:30:00','2017-05-02',NULL,16,9),(43,45,'2017-05-02 07:30:12','2017-05-02 07:30:12','2017-05-02',NULL,16,9),(44,46,'2017-05-02 07:30:25','2017-05-02 07:30:25','2017-05-02',NULL,6,9),(45,47,'2017-05-02 07:30:37','2017-05-02 07:30:37','2017-05-02',NULL,6,9),(46,48,'2017-05-02 07:30:52','2017-05-02 07:30:52','2017-05-02',NULL,16,9),(47,14,'2017-05-03 05:02:05','2017-05-03 05:02:05','2017-05-03','2017-05-03',21,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (8,'77',1,'EMP0000014',NULL,'talen@redine.in','$2a$10$skz08P5vRQhejUoJX3.0ReF8MLXLvtupn5/hCq4ux0WdbMiUMKLhy',NULL,NULL,NULL,57,'2017-05-25 11:59:36','2017-05-24 05:04:17','103.57.84.210','207.244.90.69','2017-04-25 05:12:21','2017-05-25 11:59:36',1,1,6,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'1',1,'EMP0000001',NULL,'a.suri@redefine.in','$2a$10$dybQlfMGz3tTyOt9pENZYu9c0HFSZIiRhfYYsb9gPad5KlnF8uYW6',NULL,NULL,NULL,20,'2017-05-17 11:36:06','2017-05-15 08:16:33','114.143.205.226','114.143.205.226','2017-05-01 05:08:38','2017-05-17 11:36:06',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'2',1,'EMP0000002',NULL,'s.ray@redefine.in','$2a$10$r2flvUVjJtITqfo5udUTfOWcIoo2foFHzGwfa/HPNT97eXq8NCB7S',NULL,NULL,NULL,23,'2017-05-15 09:58:29','2017-05-15 08:13:49','114.143.205.226','114.143.205.226','2017-05-01 05:08:48','2017-05-15 09:58:29',1,1,1,2,'SR_Profile.jpg','image/jpeg',10368,'2017-05-08 11:45:19',NULL,NULL,NULL,NULL),(11,'3',1,'EMP0000003',NULL,'v.chhibber@redefine.in','$2a$10$4jVY9/o3ZFPTZlLELcqQGejo64hL/GVWhR8OMWUOqKJDRiOSxZsfq',NULL,NULL,NULL,13,'2017-05-15 06:36:22','2017-05-12 08:24:49','114.143.205.226','182.72.205.179','2017-05-01 05:08:57','2017-05-15 06:36:22',1,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'4',6,'EMP0000004',NULL,'devender.rawat@redefine.in','$2a$10$iQy4lOj7m/jY7B6MMOkyBuDcIkBUUSEtDkr8RdFmJtQBpbG0txXZS',NULL,NULL,NULL,4,'2017-05-15 08:03:38','2017-05-15 07:27:41','114.143.205.226','114.143.205.226','2017-05-01 06:45:14','2017-05-15 08:03:38',1,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'7',5,'EMP0000005',NULL,'swadesh.gupta@redefine.in','$2a$10$ZqJ073cGuvTTaWwSPAf.P.Jf6mDIKGkloWPipVHui14tGTjCf7Ro6',NULL,NULL,NULL,2,'2017-05-08 07:03:56','2017-05-03 04:13:04','103.211.55.55','103.211.54.139','2017-05-01 06:46:46','2017-05-08 07:03:56',1,1,3,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'72',6,'EMP0000036',NULL,'sahibakaur.chawla@redefine.in','$2a$10$WADuIfyRQFWopum9e3dkuOcU9Z3CP7dvth76KzsiMMRdGKAEYaj.i',NULL,NULL,NULL,1,'2017-05-08 06:36:01','2017-05-08 06:36:01','103.211.55.55','103.211.55.55','2017-05-01 06:50:19','2017-05-08 06:36:01',1,1,2,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'8',5,'EMP0000006',NULL,'kirti.puri@redefine.in','$2a$10$G7zeyhXgq.QzxjDcBE5/ouq0lU.ZeLOI1G.GVl7Sd7VKpHoBJhNXa',NULL,NULL,NULL,3,'2017-05-02 11:33:10','2017-05-02 11:29:32','103.211.54.139','103.211.54.139','2017-05-01 06:50:46','2017-05-02 11:33:10',1,1,8,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'10',6,'EMP0000007',NULL,'1010@xyz.com','$2a$10$FzbmItA4lPZUo4EKajgmN.Vcba6zEowZShtlHRmVBxAYnAKYLqpY.',NULL,NULL,NULL,2,'2017-05-03 05:30:55','2017-05-03 05:12:40','122.162.1.132','122.162.1.132','2017-05-01 06:51:34','2017-05-03 05:30:55',1,1,8,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'13',5,'EMP0000008',NULL,'naresh.kumar@redefine.in','$2a$10$tcWB0MCCVNYkqUVQGXBbGepv48TaB/7zcSXj3yZIbzm.s7OhFctMe',NULL,NULL,NULL,3,'2017-05-08 06:24:41','2017-05-02 12:00:20','103.211.55.55','103.211.54.139','2017-05-01 07:02:02','2017-05-08 06:24:41',1,1,2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'18',4,'EMP0000009',NULL,'satish.yadav@redefine.in','$2a$10$8bHpA1cWzUTGsnzrJiODcemJK4mkXGtGrDxoqaw2Qs0qtQjV9y1ty',NULL,NULL,NULL,5,'2017-05-03 11:20:30','2017-05-02 07:31:46','103.211.54.157','103.211.54.139','2017-05-01 07:03:31','2017-05-03 11:22:10',1,1,4,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'25',4,'EMP0000010',NULL,'ashish.dubey@redefine.in','$2a$10$cu5X1kIvOxxtC9juAobTTOOTc6iY3t59Yc/17TZmxUX16ogh/SAZ.',NULL,NULL,NULL,2,'2017-05-02 07:35:31','2017-05-02 05:57:10','103.211.54.139','103.211.54.139','2017-05-01 07:03:49','2017-05-02 07:35:31',1,1,9,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'40',6,'EMP0000011',NULL,'raksha.shukla@redefine.in','$2a$10$AJNV3iUb/MagrqISfjUPgOy1LQfVqV6lzKqGC3PI2E.zSV2ym8X.y',NULL,NULL,NULL,4,'2017-05-08 11:03:16','2017-05-03 11:02:01','103.211.54.16','103.211.54.157','2017-05-01 07:04:45','2017-05-08 11:03:16',1,1,3,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'41',6,'EMP0000012',NULL,'chandan.das@redefine.in','$2a$10$bZDp7gDMUBbYXiMxiDR43eZJqvFR3X.RDjTEb/7gXlWDak/zZnmwq',NULL,NULL,NULL,1,'2017-05-03 04:23:09','2017-05-03 04:23:09','103.211.54.139','103.211.54.139','2017-05-01 07:04:57','2017-05-03 04:25:00',1,1,3,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'73',6,'EMP0000013',NULL,'parul.nanda@redefine.in','$2a$10$5MrO6xYigGdaERioLX3.medCEAzbOd7IEe3A1rSpBGgRo08IyTILa',NULL,NULL,NULL,3,'2017-05-03 11:03:34','2017-05-02 11:28:51','103.211.54.157','103.211.54.139','2017-05-01 07:05:13','2017-05-03 11:03:34',1,1,10,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'87',6,'EMP0000015',NULL,'brajesh.kumar@redefine.in','$2a$10$Pl.wLB1/3yjCHOAdi2U31OThEccC/TdwD3LhEklIFJzKo3bdFFs.G',NULL,NULL,NULL,2,'2017-05-11 11:10:01','2017-05-11 09:32:35','103.211.54.16','103.211.54.16','2017-05-01 07:05:41','2017-05-11 11:10:01',1,1,8,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'93',5,'EMP0000016',NULL,'premranjan.das@redefine.in','$2a$10$5ywfC/AT9wM4kUbtm.Vzeu2IbIvhYDOaBe9MPc2QM62uUafDo6ee6',NULL,NULL,NULL,5,'2017-05-09 06:41:58','2017-05-03 05:39:00','103.211.54.16','47.30.104.253','2017-05-01 07:05:55','2017-05-09 06:43:52',1,1,4,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'96',4,'EMP0000017',NULL,'poonam.wadhwa@redefine.in','$2a$10$T3vr2ch20999Vnpo/tr8aOfGB330zVfAILIhZzWDOfqfSsOeCwwj.',NULL,NULL,NULL,7,'2017-05-09 06:19:30','2017-05-03 11:01:52','103.211.54.16','103.211.54.157','2017-05-01 07:06:23','2017-05-09 06:19:30',1,1,10,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'103',6,'EMP0000018',NULL,'dinesh.dangi@redefine.in','$2a$10$QFObJV8s1ST6avXpYB2D1eD/oPAVwufduX3eOyiRIe/DNoo2CQjj.',NULL,NULL,NULL,3,'2017-05-02 12:15:53','2017-05-02 11:41:49','103.211.54.139','103.211.54.139','2017-05-01 07:06:36','2017-05-02 12:15:53',1,1,2,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'109',6,'EMP0000019',NULL,'brijesh.verma@redefine.in','$2a$10$qS/AKOdiM1rIeY5h9uek7u4LXqG3VN.FbAZKiHI3vdeokNyGE7wNe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-05-01 07:09:44','2017-05-01 07:09:44',1,1,5,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'5',5,'EMP0000020',NULL,'mohd.shahnawaz@redefine.in','$2a$10$WfT86kPbQU/In.mlm8awE.reKBNv9Huin5CbTtuZdY33coekJ1fbS',NULL,NULL,'2017-05-03 05:20:54',2,'2017-05-03 05:20:54','2017-05-03 04:26:01','103.211.54.139','103.211.54.139','2017-05-01 07:09:57','2017-05-15 06:58:07',1,1,3,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'6',1,'EMP0000021',NULL,'nagma.ansari@redefine.in/accounts@redefinemarcom.com','$2a$10$lYRa3P.EJ737BD0aygUAbuSEYDEeE8lvOWTxfz9f4/7EIUJC.A6lu',NULL,NULL,NULL,2,'2017-05-11 10:31:11','2017-05-03 04:37:29','114.143.205.226','103.211.54.139','2017-05-01 07:10:08','2017-05-11 10:31:11',1,1,6,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'23',6,'EMP0000022',NULL,'puneet.sharma@redefine.in','$2a$10$WEgTwver55dzDPIMVZ1FBuNSMVrBvPdsdYaRYjNpDao2gnq/30Umi',NULL,NULL,NULL,4,'2017-05-17 04:16:13','2017-05-02 12:03:46','122.162.35.185','103.211.54.139','2017-05-01 07:10:18','2017-05-17 04:16:13',1,1,8,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'24',6,'EMP0000023',NULL,'praveen.paudyal@redefine.in','$2a$10$sV6M10CfaVW5CNhGXVBHguMTSIAXE7upqRH1uIxrRAzL/bA7Lcf0K',NULL,NULL,NULL,2,'2017-05-12 05:27:41','2017-05-02 12:01:15','103.211.54.113','103.211.54.139','2017-05-01 07:10:30','2017-05-12 05:27:41',1,1,2,23,'IMG_4257.JPG','image/jpeg',24661,'2017-05-02 12:06:23',NULL,NULL,NULL,NULL),(32,'33',6,'EMP0000024',NULL,'indrani.arora@redefine.in','$2a$10$CIBwMBMntJlH0ZiUHR6fzu1Q54AZCWYP.OEklbIWdmnaTQHpRIj6i',NULL,NULL,NULL,2,'2017-05-03 05:05:39','2017-05-03 05:02:55','103.211.54.139','103.211.54.139','2017-05-01 07:10:52','2017-05-03 05:05:39',1,1,4,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'36',6,'EMP0000025',NULL,'dilip.bist@redefine.in','$2a$10$nsEDV3MhWkUu.r7m8yu2aOp777hCP7JrayGuSOzRMM57cM952aevG',NULL,NULL,NULL,1,'2017-05-02 11:27:03','2017-05-02 11:27:03','103.211.54.139','103.211.54.139','2017-05-01 07:11:14','2017-05-02 11:27:42',1,1,3,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'48',6,'EMP0000026',NULL,'rachna.negi@redefine.in','$2a$10$KOWuNIKVAfSGN2LNlmSKteCGVDkRNR/dc/ImhAhnzy3t/0iZ3vvxS',NULL,NULL,NULL,4,'2017-05-10 06:31:00','2017-05-08 09:40:20','103.211.54.16','103.211.54.16','2017-05-01 07:11:29','2017-05-10 06:31:00',1,1,4,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'50',6,'EMP0000027',NULL,'meenakshi.sharma@redefine.in','$2a$10$8HpqIvuNG7dJeCj63B3oRO6CaXjNfRCjISFeAVyepKAUNnzL9ML7u',NULL,NULL,NULL,6,'2017-05-15 05:45:23','2017-05-12 10:26:52','122.162.61.235','103.211.54.113','2017-05-01 07:13:50','2017-05-15 05:45:23',1,1,8,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'56',6,'EMP0000028',NULL,'manish.rawat@redefine.in','$2a$10$DY00lCN9NnLwbWei4yoPPebiwcBn0JxJzIGxTmjrgvbGJXk7re4CW',NULL,NULL,NULL,10,'2017-05-17 07:37:56','2017-05-15 09:07:04','122.162.35.185','122.162.61.235','2017-05-01 07:14:10','2017-05-17 07:37:56',1,1,4,28,'606239.jpg','image/jpeg',359112,'2017-05-02 11:15:56',NULL,NULL,NULL,NULL),(37,'58',6,'EMP0000029',NULL,'nancy.jain@redefine.in','$2a$10$WxCW6vmeGxhFs2OM1lDJX.42ZOHfN8ZVfKZKec38X2Yd8xQZ0cps2',NULL,NULL,NULL,2,'2017-05-02 11:30:49','2017-05-02 11:14:45','103.211.54.139','103.211.54.139','2017-05-01 07:14:28','2017-05-02 11:30:49',1,1,4,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'62',6,'EMP0000030',NULL,'simran.kaur@redefine.in','$2a$10$tiNJe.uq0xo1iJhFgY2ANe5.W9mgCrn57mDPrmUwW/2F5oV5C0xXS',NULL,NULL,NULL,2,'2017-05-03 11:02:50','2017-05-02 11:24:23','103.211.54.157','103.211.54.139','2017-05-01 07:14:40','2017-05-03 11:02:50',1,1,10,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'65',6,'EMP0000031',NULL,'ravit.marwah@redefine.in','$2a$10$9M24RFXguhNAWGG3vWQI/O8.IATBSwa3eBQGgkIYLQOQsyoV7Crz2',NULL,NULL,'2017-05-02 11:20:26',11,'2017-05-22 10:09:38','2017-05-18 10:46:25','103.211.54.61','103.211.54.61','2017-05-01 07:14:49','2017-05-22 10:09:38',1,1,8,31,'WhatsApp_Image_2017-02-14_at_12.29.53_PM.jpeg','image/jpeg',69655,'2017-05-02 11:24:14',NULL,NULL,NULL,NULL),(40,'66',6,'EMP0000032',NULL,'r.balaji@redefine.in','$2a$10$y7HzZfS1PQa5EqF3pzfbEuIBEj0GmE7FPQ6hPe6/yVmGwTQu3AtxK',NULL,NULL,NULL,3,'2017-05-11 09:35:52','2017-05-02 11:13:06','103.211.54.16','103.211.54.139','2017-05-01 07:15:08','2017-05-11 09:35:52',1,1,9,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'68',6,'EMP0000033',NULL,'bhawna@redefine.in','$2a$10$y4Ru73pVuCMPI/2dwp.gU.0ejSop00KO3aZ/lXM8uxxudZrt7DKOO',NULL,NULL,NULL,1,'2017-05-02 12:01:31','2017-05-02 12:01:31','103.211.54.139','103.211.54.139','2017-05-01 07:15:26','2017-05-02 12:04:20',1,1,2,33,'bkk.jpg','image/jpeg',113555,'2017-05-02 12:04:20',NULL,NULL,NULL,NULL),(42,'69',6,'EMP0000034',NULL,'rajat.rathor@redefine.in','$2a$10$qxhmCz7.RuA5knriJ2uBtu6DKdSWXqixfux796rHbCa3oAElZoDbW',NULL,NULL,NULL,3,'2017-05-11 12:45:11','2017-05-02 11:16:49','103.211.54.16','103.211.54.139','2017-05-01 07:15:36','2017-05-11 12:45:11',1,1,10,34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'70',6,'EMP0000035',NULL,'reshu.dwivedi@redefine.in','$2a$10$oKzbWhHrswTxNSmqJer3HeRFsuTx4pckKwa7IQSEKBg7flM5/5dRe',NULL,NULL,NULL,1,'2017-05-12 09:39:40','2017-05-12 09:39:40','103.211.54.113','103.211.54.113','2017-05-01 07:16:01','2017-05-12 09:39:40',1,1,10,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'76',6,'EMP0000037',NULL,'pawan.jha@redefine.in','$2a$10$plOSpzP3g7FWKt27PhFxhuU9f.L05LCtN1cOO/i1MI0TQJMcIeRJK',NULL,NULL,NULL,2,'2017-05-11 09:36:50','2017-05-02 11:17:24','103.211.54.16','103.211.54.139','2017-05-01 07:17:00','2017-05-11 09:36:50',1,1,9,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'83',6,'EMP0000038',NULL,'mansi.grover@redefine.in','$2a$10$wePw.dkjbFrifxoBmQ7VPuUXndYJ56DWMl61avTUbU3snEoDzxrqu',NULL,NULL,NULL,7,'2017-05-15 05:46:56','2017-05-03 11:02:24','122.162.61.235','103.211.54.157','2017-05-01 07:17:12','2017-05-15 05:46:56',1,1,10,38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'92',6,'EMP0000039',NULL,'sahil.kanda@reddefine.in','$2a$10$fiadTIhls1e7qy8CocRjv.T3XvelZIz/5StTV7Ud52QKlBjrsQfN6',NULL,NULL,NULL,1,'2017-05-03 04:46:37','2017-05-03 04:46:37','103.211.54.139','103.211.54.139','2017-05-01 07:17:23','2017-05-03 04:46:37',1,1,8,39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'94',6,'EMP0000040',NULL,'smita.jha@redefine.in','$2a$10$MEyvUOUAiYN8Nr/P/41.1.T1bMp88JLaK1X5XmouVvTC.7ECZfipi',NULL,NULL,'2017-05-02 11:23:15',1,'2017-05-02 11:23:15','2017-05-02 11:23:15','103.211.54.139','103.211.54.139','2017-05-01 07:17:33','2017-05-02 11:25:10',1,1,2,40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'95',6,'EMP0000041',NULL,'mohammed.hussain@redefine.in','$2a$10$pFBjDYakSBhBzBXbCKYQQ.MOcddq/RO8uM1kXVghbJYkw4VmXq56.',NULL,NULL,NULL,1,'2017-05-09 06:47:14','2017-05-09 06:47:14','122.167.13.251','122.167.13.251','2017-05-01 07:17:42','2017-05-09 06:47:14',1,2,5,41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'101',6,'EMP0000042',NULL,'pankhuri.singh@redefine.in','$2a$10$C8XDj6wvl33qzJWUwTBdZufiWnAzYDOVGUcl5CVGYycNqeJ3Nb5aC',NULL,NULL,NULL,1,'2017-05-02 11:17:50','2017-05-02 11:17:50','103.211.54.139','103.211.54.139','2017-05-01 07:17:57','2017-05-02 11:17:50',1,1,4,42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'102',6,'EMP0000043',NULL,'twinkle.aggarwal@redefine.in','$2a$10$UDwkWCCnzMWl6AUDtiBMLuRIO9yGrzHLe.qlDPw1lQsOp6yq7zqGG',NULL,NULL,NULL,2,'2017-05-02 11:18:32','2017-05-02 11:12:27','103.211.54.139','103.211.54.139','2017-05-01 07:18:12','2017-05-02 11:18:32',1,1,8,43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'106',6,'EMP0000044',NULL,'kritika.jain@redefine.in','$2a$10$fHyKuTWOdoWNV2p6l8p1NOatYVdWj9avOXbUhh2b3WO27okhwhr1W',NULL,NULL,NULL,3,'2017-05-02 12:15:22','2017-05-02 11:16:11','103.211.54.139','103.211.54.139','2017-05-01 07:19:02','2017-05-02 12:15:22',1,1,8,44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'107',6,'EMP0000045',NULL,'mani.vijay@redefine.in','$2a$10$1.pj5DAKReFq8R8iHTUgT.c1z2SA3txby.lBhG/Jo21AN4/dFZV/u',NULL,NULL,NULL,7,'2017-05-11 09:37:52','2017-05-08 05:49:19','103.211.54.16','103.211.55.55','2017-05-01 07:19:13','2017-05-11 09:37:52',1,1,8,45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'110',6,'EMP0000046',NULL,'vipul.kumar@redefine.in','$2a$10$NJ1sBLYlUhYVoHB6vAx6rurf0ULw7naOCPu4B1xfR1wTTIcC8cZXq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-05-01 07:19:26','2017-05-01 07:19:26',1,1,4,46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'111',6,'EMP0000047',NULL,'aryan.singh@redefine.in','$2a$10$hhdtiPZ9ZekdQfG88VVPleAhUYovQq6XrQ.NHxoOH3YOhcCHFR6Yq',NULL,NULL,NULL,6,'2017-05-19 08:53:56','2017-05-17 07:47:25','103.211.54.61','122.162.35.185','2017-05-01 07:19:37','2017-05-19 08:53:56',1,1,8,47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'112',6,'EMP0000048',NULL,'ayush.sharma@redefine.in','$2a$10$.sma0LQF8CU3.ok17Q5i6OxVOYhbEMiP.CprwL27IOaSEdU2GPvO2',NULL,NULL,NULL,5,'2017-05-23 06:25:29','2017-05-19 11:03:44','103.211.55.255','103.211.54.61','2017-05-01 07:19:46','2017-05-23 06:25:29',1,1,4,48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'114',6,'EMP0000049',NULL,'akshay.verma@redefine.in','$2a$10$pxLesjA4TfplQBXocBGI7O8rWkon6XPu42IfJAqaoHLbBYR5wwxyO',NULL,NULL,NULL,2,'2017-05-03 11:08:11','2017-05-02 12:13:14','103.211.54.157','103.211.54.139','2017-05-01 07:19:55','2017-05-03 11:08:42',1,1,10,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'116',6,'EMP0000050',NULL,'rahul.gupta@redefine.in','$2a$10$TZqsRL.VXRxmSyehTeYBLOFA6YTp.1EdfTi6I26nOyg4JzYg6colS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-05-01 07:20:07','2017-05-01 07:20:07',1,3,5,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `nationalities` VALUES (1,'1.0','Indian',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_records`
--

LOCK TABLES `od_records` WRITE;
/*!40000 ALTER TABLE `od_records` DISABLE KEYS */;
INSERT INTO `od_records` VALUES (1,31,1,'2017-05-05','Cancelled','2017-05-08 06:20:02','2017-05-08 06:20:02'),(2,31,1,'2017-05-06','Cancelled','2017-05-08 06:20:02','2017-05-08 06:20:02'),(3,31,2,'2017-05-05','Cancelled','2017-05-08 06:22:48','2017-05-08 06:22:48'),(4,5,3,'2017-05-04','FirstApproved','2017-05-08 07:06:25','2017-05-08 07:06:25'),(5,31,4,'2017-05-05','Pending','2017-05-08 11:41:54','2017-05-08 11:41:54'),(6,31,4,'2017-05-06','Pending','2017-05-08 11:41:54','2017-05-08 11:41:54'),(7,31,5,'2017-05-15','Pending','2017-05-15 04:12:30','2017-05-15 04:12:30'),(8,31,5,'2017-05-16','Pending','2017-05-15 04:12:30','2017-05-15 04:12:30'),(9,31,5,'2017-05-17','Pending','2017-05-15 04:12:30','2017-05-15 04:12:30'),(10,31,5,'2017-05-18','Pending','2017-05-15 04:12:30','2017-05-15 04:12:30'),(11,5,6,'2017-05-10','Pending','2017-05-15 07:06:28','2017-05-15 07:06:28'),(12,5,6,'2017-05-11','Pending','2017-05-15 07:06:28','2017-05-15 07:06:28'),(13,31,7,'2017-05-23','Pending','2017-05-22 10:10:43','2017-05-22 10:10:43'),(14,31,7,'2017-05-24','Pending','2017-05-22 10:10:43','2017-05-22 10:10:43'),(15,31,7,'2017-05-25','Pending','2017-05-22 10:10:43','2017-05-22 10:10:43'),(16,31,7,'2017-05-26','Pending','2017-05-22 10:10:43','2017-05-22 10:10:43'),(17,31,7,'2017-05-27','Pending','2017-05-22 10:10:43','2017-05-22 10:10:43'),(18,4,8,'2017-05-24','Cancelled','2017-05-23 10:48:26','2017-05-23 10:48:26'),(19,4,8,'2017-05-25','Cancelled','2017-05-23 10:48:26','2017-05-23 10:48:26');
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
  CONSTRAINT `fk_rails_b6b50899cc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_2c147fe338` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_status_records`
--

LOCK TABLES `od_status_records` WRITE;
/*!40000 ALTER TABLE `od_status_records` DISABLE KEYS */;
INSERT INTO `od_status_records` VALUES (1,1,31,'Pending','2017-05-08 00:00:00','2017-05-08 06:20:02','2017-05-08 06:20:02'),(2,1,31,'Cancelled','2017-05-08 00:00:00','2017-05-08 06:21:52','2017-05-08 06:21:52'),(3,2,31,'Pending','2017-05-08 00:00:00','2017-05-08 06:22:48','2017-05-08 06:22:48'),(4,3,5,'Pending','2017-05-08 00:00:00','2017-05-08 07:06:25','2017-05-08 07:06:25'),(5,3,2,'FirstApproved','2017-05-08 00:00:00','2017-05-08 11:36:24','2017-05-08 11:36:24'),(6,2,31,'Cancelled','2017-05-08 00:00:00','2017-05-08 11:38:39','2017-05-08 11:38:39'),(7,4,31,'Pending','2017-05-08 00:00:00','2017-05-08 11:41:54','2017-05-08 11:41:54'),(8,5,31,'Pending','2017-05-15 00:00:00','2017-05-15 04:12:30','2017-05-15 04:12:30'),(9,6,5,'Pending','2017-05-15 00:00:00','2017-05-15 07:06:28','2017-05-15 07:06:28'),(10,7,31,'Pending','2017-05-22 00:00:00','2017-05-22 10:10:43','2017-05-22 10:10:43'),(11,8,4,'Pending','2017-05-23 00:00:00','2017-05-23 10:48:26','2017-05-23 10:48:26'),(12,8,14,'Cancelled','2017-05-23 00:00:00','2017-05-23 10:50:26','2017-05-23 10:50:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_duty_requests`
--

LOCK TABLES `on_duty_requests` WRITE;
/*!40000 ALTER TABLE `on_duty_requests` DISABLE KEYS */;
INSERT INTO `on_duty_requests` VALUES (1,31,'Full Day','2017-05-05 00:00:00','2017-05-06 00:00:00','2.0','Fujitsu Event in Crowne plaza Okhla',NULL,NULL,NULL,1,1,1,0,0,0,0,'2017-05-08 06:20:02','2017-05-08 06:21:52',3,NULL),(2,31,'Half Day','2017-05-05 00:00:00','2017-05-05 00:00:00','0.5','Fujitsu Event in Crowne plaza Okhla',0,1,1,1,1,1,0,0,0,0,'2017-05-08 06:22:48','2017-05-08 11:38:39',3,NULL),(3,5,'Half Day','2017-05-04 00:00:00','2017-05-04 00:00:00','0.5','Meeting in ESRI morning',1,0,NULL,2,1,0,1,0,0,0,'2017-05-08 07:06:25','2017-05-08 11:36:24',2,1),(4,31,'Full/Half','2017-05-05 00:00:00','2017-05-06 00:00:00','1.0','OD request for Fujitsu IPP event in Crowne Plaza Okhla from 5th May 1pm to 6th May 10.30',1,1,1,0,1,0,0,0,0,0,'2017-05-08 11:41:54','2017-05-08 11:41:54',3,NULL),(5,31,'Full/Half','2017-05-15 00:00:00','2017-05-18 00:00:00','3.5','Avaya Cluster Event in Bhopal & Indore',1,0,0,0,1,0,0,0,0,0,'2017-05-15 04:12:30','2017-05-15 04:12:30',3,NULL),(6,5,'Full Day','2017-05-10 00:00:00','2017-05-11 00:00:00','2.0','Travelling to Mumbai for Meeting',NULL,NULL,NULL,0,1,0,0,0,0,0,'2017-05-15 07:06:28','2017-05-15 07:06:28',2,NULL),(7,31,'Full Day','2017-05-23 00:00:00','2017-05-27 00:00:00','5.0','OD Request for Avaya - Nashik, Ambernath & Nagpur ',NULL,NULL,NULL,0,1,0,0,0,0,0,'2017-05-22 10:10:43','2017-05-22 10:10:43',3,NULL),(8,4,'Full Day','2017-05-24 00:00:00','2017-05-25 00:00:00','2.0','Test Request ',NULL,NULL,NULL,1,1,1,0,0,0,0,'2017-05-23 10:48:26','2017-05-23 10:50:26',2,NULL);
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
  CONSTRAINT `fk_rails_c3675b7452` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_252e12812d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,'01','Cheque','',1,'2017-04-20 07:00:40','2017-04-22 07:58:30'),(2,'02','Cash','',NULL,'2017-04-20 07:00:40','2017-04-21 07:52:19'),(3,'03','Bank','',NULL,'2017-04-21 07:50:44','2017-04-21 07:52:28'),(4,'04','DD','',NULL,'2017-04-21 07:50:59','2017-04-21 07:52:35'),(5,'05','Debit Cards','',NULL,'2017-04-22 08:04:26','2017-04-22 08:04:26'),(6,'06','Credit Cards','',NULL,'2017-04-22 08:05:55','2017-04-22 08:05:55'),(7,'07','Mobile Wallet','',NULL,'2017-04-22 08:06:15','2017-04-22 08:06:15'),(8,'09','Money Orders','',NULL,'2017-04-22 08:06:37','2017-04-22 08:06:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_periods`
--

LOCK TABLES `payroll_periods` WRITE;
/*!40000 ALTER TABLE `payroll_periods` DISABLE KEYS */;
INSERT INTO `payroll_periods` VALUES (1,'2017-01-01','2017-12-31',1,'2017-05-12 09:56:06','2017-05-12 10:03:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_activities`
--

LOCK TABLES `performance_activities` WRITE;
/*!40000 ALTER TABLE `performance_activities` DISABLE KEYS */;
INSERT INTO `performance_activities` VALUES (1,'01','Goal Setting','',NULL,'2017-05-15 07:22:31','2017-05-15 07:22:31'),(2,'02','Goals Review by supervisor','',NULL,'2017-05-15 07:22:46','2017-05-15 07:22:46'),(3,'03','Self Evaluation','',NULL,'2017-05-15 07:22:56','2017-05-15 07:22:56'),(4,'04','Reviewer Evaluation','',NULL,'2017-05-15 07:23:12','2017-05-15 07:23:12'),(5,'05','Release Final rating ','',NULL,'2017-05-15 07:23:32','2017-05-15 07:23:32');
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
  CONSTRAINT `fk_rails_6dbef4ee67` FOREIGN KEY (`performance_activity_id`) REFERENCES `performance_activities` (`id`),
  CONSTRAINT `fk_rails_23005f6fef` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_calendars`
--

LOCK TABLES `performance_calendars` WRITE;
/*!40000 ALTER TABLE `performance_calendars` DISABLE KEYS */;
INSERT INTO `performance_calendars` VALUES (1,1,1,'2016-12-15','2016-12-25',NULL,'2017-05-15 07:24:11','2017-05-15 07:24:11'),(2,1,2,'2016-12-25','2016-12-28',NULL,'2017-05-15 07:24:34','2017-05-15 07:24:34'),(3,1,3,'2017-12-01','2017-12-15',NULL,'2017-05-15 07:25:17','2017-05-15 07:25:17'),(4,1,4,'2017-12-16','2017-12-20',NULL,'2017-05-15 07:25:55','2017-05-15 07:25:55'),(5,1,5,'2017-12-20','2017-12-25',NULL,'2017-05-15 07:26:36','2017-05-15 07:26:36');
/*!40000 ALTER TABLE `performance_calendars` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (1,'2017','2017-01-01','2017-12-31',1,NULL,'2017-05-01 09:58:54','2017-05-01 09:58:54'),(2,'2017H1','2017-01-01','2017-06-30',1,NULL,'2017-05-15 07:10:35','2017-05-15 07:10:35'),(3,'2017H2','2017-07-01','2017-12-31',1,NULL,'2017-05-15 07:11:07','2017-05-15 07:11:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_employers`
--

LOCK TABLES `pf_employers` WRITE;
/*!40000 ALTER TABLE `pf_employers` DISABLE KEYS */;
INSERT INTO `pf_employers` VALUES (1,'1,2,4,5,8',13,'2017-05-01','2017-05-31',1,NULL,'2017-05-02 05:06:01','2017-05-02 05:06:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_masters`
--

LOCK TABLES `pf_masters` WRITE;
/*!40000 ALTER TABLE `pf_masters` DISABLE KEYS */;
INSERT INTO `pf_masters` VALUES (1,1,12.00,'2017-05-01',15000.00,'1',1,NULL,'2017-05-02 04:53:53','2017-05-02 04:53:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_tax_masters`
--

LOCK TABLES `professional_tax_masters` WRITE;
/*!40000 ALTER TABLE `professional_tax_masters` DISABLE KEYS */;
INSERT INTO `professional_tax_masters` VALUES (1,'1,2,4,5,8',0,1000000,200,200,NULL,NULL,1,NULL,'2017-05-02 05:00:30','2017-05-02 05:00:30',2,0);
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
  CONSTRAINT `fk_rails_73938147dc` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_2b25b2bafc` FOREIGN KEY (`employee_promotion_id`) REFERENCES `employee_promotions` (`id`),
  CONSTRAINT `fk_rails_2c7fe613b1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_435dc5d01b` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_719632b493` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_71b55fc824` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
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
  CONSTRAINT `fk_rails_2cc4fb103d` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`),
  CONSTRAINT `fk_rails_046e89b830` FOREIGN KEY (`degree_stream_id`) REFERENCES `degree_streams` (`id`),
  CONSTRAINT `fk_rails_3722b001f0` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_types` (`id`),
  CONSTRAINT `fk_rails_b0cde2dffd` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_bce702aaab` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_c642f67c39` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifications`
--

LOCK TABLES `qualifications` WRITE;
/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;
INSERT INTO `qualifications` VALUES (1,24,3,9,NULL,33,1,'DELHI UNIVERSITY',NULL,'50','2017-05-02 08:43:45','2017-05-02 08:43:45'),(2,6,2,9,NULL,38,1,'Delhi University',NULL,'68.71','2017-05-02 08:44:40','2017-05-02 08:44:40'),(3,26,2,1,1,42,1,'SOL',NULL,'56','2017-05-02 08:46:25','2017-05-02 08:46:25'),(4,27,3,1,1,42,1,'Janki Devi Memorial College',NULL,'50','2017-05-02 08:48:45','2017-05-02 08:48:45'),(5,44,3,1,1,40,1,'SOL',NULL,'62%','2017-05-02 08:54:54','2017-05-02 08:54:54'),(6,45,7,3,1,33,1,'sarvodiya vidyalaya',NULL,'58.12','2017-05-02 09:01:21','2017-05-02 09:01:21'),(7,29,6,9,7,39,3,'Madhubala Institute Of Journalism',NULL,'78','2017-05-02 09:03:44','2017-05-02 09:03:44'),(8,47,7,3,8,40,NULL,'S.M.Arya Public School',NULL,'78.9','2017-05-02 09:04:53','2017-05-02 09:04:53'),(9,42,1,9,7,41,4,'Jagannath Institute Of Management Sciences',NULL,'65','2017-05-02 09:13:08','2017-05-02 09:13:08'),(10,43,1,9,7,41,4,'Jagannath Institute Of Management Science',NULL,'59','2017-05-02 09:14:04','2017-05-02 09:14:04'),(11,48,1,9,5,39,3,'Graphic era university',NULL,'58.5','2017-05-02 09:20:57','2017-05-02 09:20:57'),(12,28,7,3,9,41,NULL,'Dashmesh Public School',NULL,'57 %','2017-05-02 09:21:56','2017-05-02 09:21:56'),(13,15,10,6,9,32,5,'',NULL,'78','2017-05-02 09:26:50','2017-05-02 09:26:50'),(14,32,3,1,1,NULL,2,'Jesus And Mary College',NULL,'60%','2017-05-02 09:29:01','2017-05-02 09:29:01'),(15,13,3,9,1,33,1,'',NULL,'60','2017-05-02 09:32:05','2017-05-02 09:32:05'),(16,30,2,9,3,40,1,'Correspondence',NULL,'60%','2017-05-02 09:35:50','2017-05-02 09:35:50'),(17,49,5,6,10,42,1,'Institute of Management Technology',NULL,'65%','2017-05-02 09:39:35','2017-05-02 09:39:35'),(18,38,3,1,11,40,2,'Correspondence',NULL,'58 %','2017-05-02 09:41:19','2017-05-02 09:41:19'),(19,34,11,6,12,43,6,'SCDL',NULL,'58','2017-05-02 09:54:31','2017-05-02 09:54:31'),(20,17,3,9,1,NULL,1,'correspondence',NULL,'48','2017-05-02 10:04:12','2017-05-02 10:04:12'),(21,23,12,6,14,42,4,'',NULL,'72%','2017-05-02 10:16:33','2017-05-02 10:16:33'),(22,23,6,9,15,39,7,'',NULL,'67%','2017-05-02 10:17:32','2017-05-02 10:17:32'),(23,23,6,10,15,40,8,'BHARTIYE VIDYA BHAWAN',NULL,'74%','2017-05-02 10:18:20','2017-05-02 10:18:20'),(24,10,13,6,5,36,10,'',NULL,'81','2017-05-02 10:19:43','2017-05-02 10:19:43'),(25,23,6,10,19,39,7,'NRAI',NULL,'67%','2017-05-02 10:21:40','2017-05-02 10:21:40'),(26,25,14,10,NULL,37,9,'EMDI Institute of Event Management ',NULL,'85%','2017-05-02 10:22:09','2017-05-02 10:22:09'),(27,25,1,9,16,40,2,'IGNOU',NULL,'71%','2017-05-02 10:23:04','2017-05-02 10:23:04'),(28,25,5,11,17,41,2,'IGNOU',NULL,'70%','2017-05-02 10:24:30','2017-05-02 10:24:30'),(29,33,2,9,1,39,1,'Laxmi Bai',NULL,'51','2017-05-02 10:35:39','2017-05-02 10:35:39'),(30,40,3,9,20,40,1,'Miranda House',NULL,'60.50','2017-05-02 10:39:32','2017-05-02 10:39:32'),(31,18,3,9,1,37,NULL,'Chander Mohan Jha College / Meghalaya University',NULL,'71','2017-05-02 10:40:13','2017-05-02 10:40:13'),(32,8,3,9,21,NULL,1,'Delhi University',NULL,' ','2017-05-02 10:44:55','2017-05-02 10:44:55'),(33,19,2,9,3,28,11,'vinoba bhave university, HAZARIBAGH',NULL,'58','2017-05-02 11:06:24','2017-05-02 11:06:24'),(34,22,2,9,1,40,1,'SOL',NULL,'65','2017-05-02 11:07:22','2017-05-02 11:07:22'),(35,31,15,9,22,39,1,'Shyam Lal College',NULL,'58','2017-05-02 11:09:06','2017-05-02 11:15:56'),(36,19,13,6,13,32,12,'haldia institute of technology and management',NULL,'62','2017-05-02 11:11:35','2017-05-02 11:11:35'),(37,2,3,9,1,37,NULL,'meghalaya university',NULL,'71%','2017-05-02 11:29:33','2017-05-02 11:29:47'),(38,5,15,9,8,33,13,'',NULL,'61','2017-05-03 04:08:34','2017-05-03 04:08:34'),(39,12,2,9,1,32,14,'Bangabasi College',NULL,'56','2017-05-03 04:11:08','2017-05-03 04:11:08'),(40,11,14,11,18,37,15,'NIEM',NULL,'68%','2017-05-03 04:19:32','2017-05-03 04:19:32'),(41,20,13,6,5,35,16,'Jamia Millia Islamia',NULL,'67.5%','2017-05-03 04:21:38','2017-05-03 04:21:38'),(42,39,2,1,1,42,1,'DELHI UNIVERSITY',NULL,'60%','2017-05-03 04:41:03','2017-05-03 04:41:03'),(43,7,17,7,NULL,31,NULL,'Open(N.O.S.E)',NULL,'62%','2017-05-03 05:26:11','2017-05-03 05:26:11'),(44,36,6,6,19,41,17,'Guru Jameshwar',NULL,'72%','2017-05-08 06:27:39','2017-05-08 06:27:39'),(45,41,7,1,3,37,18,'Alamin College',NULL,'49%','2017-05-09 06:38:29','2017-05-09 06:38:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,'1','Below 50% of Goals Achieved',NULL,'2017-05-01 09:59:45','2017-05-15 07:17:00',1),(2,'2','50% to 90% of goals achieved',NULL,'2017-05-01 10:00:06','2017-05-15 07:16:41',1),(3,'3','90% of Goals achieved',NULL,'2017-05-01 10:00:25','2017-05-15 07:15:38',1),(4,'4','100% of Goals Achieved',NULL,'2017-05-01 10:01:01','2017-05-15 07:13:14',1),(5,'5','125% of goals achieved',NULL,'2017-05-01 10:01:14','2017-05-15 07:13:04',1);
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
INSERT INTO `relation_masters` VALUES (1,'1.0','Father',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'2.0','Mother',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'3.0','Daughter',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'4.0','Son',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(5,'5.0','Brother',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(6,'6.0','Wife',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(7,'7.0','Husband',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(8,'8.0','Sister',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Christian','1.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'Hindu','2.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'Muslim','3.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'Sikh','4.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(5,'jainism',NULL,NULL,NULL,'2017-05-02 09:02:11','2017-05-02 09:02:11');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rembursmentmasters`
--

DROP TABLE IF EXISTS `rembursmentmasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rembursmentmasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rembursmentmasters`
--

LOCK TABLES `rembursmentmasters` WRITE;
/*!40000 ALTER TABLE `rembursmentmasters` DISABLE KEYS */;
/*!40000 ALTER TABLE `rembursmentmasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rembursments`
--

DROP TABLE IF EXISTS `rembursments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rembursments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `rembursment_date` date DEFAULT NULL,
  `rembursmentmaster_id` int(11) DEFAULT NULL,
  `amount` decimal(5,1) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rembursments_on_employee_id` (`employee_id`),
  KEY `index_rembursments_on_rembursmentmaster_id` (`rembursmentmaster_id`),
  CONSTRAINT `fk_rails_9b0b083282` FOREIGN KEY (`rembursmentmaster_id`) REFERENCES `rembursmentmasters` (`id`),
  CONSTRAINT `fk_rails_031f8e5da5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rembursments`
--

LOCK TABLES `rembursments` WRITE;
/*!40000 ALTER TABLE `rembursments` DISABLE KEYS */;
/*!40000 ALTER TABLE `rembursments` ENABLE KEYS */;
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
-- Table structure for table `reporting_master_rembursments`
--

DROP TABLE IF EXISTS `reporting_master_rembursments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_master_rembursments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rembursment_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_master_rembursments_on_rembursment_id` (`rembursment_id`),
  CONSTRAINT `fk_rails_7c4ed99cc5` FOREIGN KEY (`rembursment_id`) REFERENCES `rembursments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_master_rembursments`
--

LOCK TABLES `reporting_master_rembursments` WRITE;
/*!40000 ALTER TABLE `reporting_master_rembursments` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporting_master_rembursments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,1,'2017-04-25 04:12:49','2017-04-25 04:12:49',0,0,0,0,0,0,1),(2,NULL,NULL,NULL,2,'2017-05-01 06:33:49','2017-05-01 06:33:49',0,0,0,0,0,0,1),(3,NULL,NULL,NULL,3,'2017-05-01 06:34:47','2017-05-01 06:34:47',0,0,0,0,0,0,1),(4,NULL,NULL,NULL,5,'2017-05-01 06:47:40','2017-05-01 06:47:40',0,0,0,0,0,0,1),(5,NULL,NULL,NULL,8,'2017-05-01 06:47:53','2017-05-01 06:47:53',0,0,0,0,0,0,1),(6,NULL,NULL,NULL,9,'2017-05-01 06:48:00','2017-05-01 06:48:00',0,0,0,0,0,0,1),(7,NULL,NULL,NULL,10,'2017-05-01 06:48:25','2017-05-01 06:48:25',0,0,0,0,0,0,1),(8,NULL,NULL,NULL,17,'2017-05-01 06:48:39','2017-05-01 06:48:39',0,0,0,0,0,0,1),(9,NULL,NULL,NULL,20,'2017-05-01 06:48:48','2017-05-01 06:48:48',0,0,0,0,0,0,1),(10,NULL,NULL,NULL,21,'2017-05-01 06:49:11','2017-05-01 06:49:11',0,0,0,0,0,0,1),(11,NULL,NULL,NULL,6,'2017-05-01 07:27:34','2017-05-02 07:25:06',0,0,0,0,0,0,1),(12,NULL,NULL,NULL,16,'2017-05-01 07:27:44','2017-05-01 07:27:44',0,0,0,0,0,0,1);
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
  CONSTRAINT `fk_rails_eb1ee47b3d` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_a39169356b` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`)
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
INSERT INTO `reserved_categories` VALUES (1,'1.0','GENERAL','GENERAL',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'2.0','OBC','OTHER BACKWARD CLASSES',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'3.0','SC','SCHEDULED CASTE',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'4.0','ST','SCHEDULED TRIBE',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(5,'5.0','OTHERS','',NULL,'2017-05-01 06:05:39','2017-05-01 06:05:39');
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
  CONSTRAINT `fk_rails_9719223b51` FOREIGN KEY (`change_status_employee_id`) REFERENCES `change_status_employees` (`id`),
  CONSTRAINT `fk_rails_8ed7115a02` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`)
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
  CONSTRAINT `fk_rails_c2d3410490` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_4857fcccb2` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_b3a76cc850` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
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
  CONSTRAINT `fk_rails_cf947cf32f` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_0ea1a76c59` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9f0c2a73fb` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1','GroupAdmin','',1,'2017-04-25 04:09:55','2017-05-01 06:03:07'),(2,'2','Admin','',NULL,'2017-04-25 04:10:04','2017-04-25 04:10:04'),(3,'3','Branch','',NULL,'2017-04-25 04:10:16','2017-04-25 04:10:16'),(4,'4','HOD','',NULL,'2017-04-25 04:10:29','2017-04-25 04:10:29'),(5,'5','Supervisor','',NULL,'2017-04-25 04:10:56','2017-04-25 04:10:56'),(6,'6','Employee','',NULL,'2017-04-25 04:11:05','2017-04-25 04:11:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
INSERT INTO `salary_component_templates` VALUES (1,'1',1,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,'2017-04-26 04:49:44','2017-04-26 04:49:44',NULL),(2,'1',1,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,'2017-04-26 04:49:52','2017-04-26 04:49:52',NULL),(3,'1',1,4,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,'2017-04-26 04:49:57','2017-04-26 04:49:57',NULL),(4,'1',1,8,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,'2017-04-26 04:50:10','2017-04-26 04:50:10',NULL),(5,'1',1,5,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,'2017-04-26 04:50:15','2017-04-26 04:50:15',NULL);
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
INSERT INTO `salary_components` VALUES (1,'01','Basic','Basic',0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:21','',1,1,NULL),(2,'02','HRA','HRA',0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:35','',1,1,NULL),(3,'3.0','Special Allowance','Special Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(4,'04','Convenience Allowance','Convenience Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:50','',1,1,NULL),(5,'05','Other Allowance','Other Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-26 04:49:04','',1,1,NULL),(6,'6.0','Washing Allowance','Washing Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(7,'7.0','Driver Allowance','Driver Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(8,'08','Medical Allowance','Medical Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-26 04:49:19','',1,1,NULL),(9,'9.0','Children Education Allowance','Children Education Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(10,'10.0','PF','PF',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(12,'12.0','Income Tax','Income Tax',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(13,'13.0','Food Deduction','Food Deduction',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(14,'14.0','Other Deduction','Other Deduction',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(15,'15.0','Prof. Tax','Prof. Tax',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(16,'16.0','Society','Deposit',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(17,'17.0','Society Loan','Society',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(18,'18.0','Retaintion','Retaintion',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(19,'19.0','DA','Dearness Allowance',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(20,'20.0','Welfair','Welfair',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(21,'21.0','Mobile Deduction','Mobile Deduction',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL),(22,'22.0','Rembursement of Medical Allowence','Rembursement of Medical Allowence',0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL,NULL);
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
  CONSTRAINT `fk_rails_ad2c35f5c2` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_850de8562e` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_9691baf3d9` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_templates`
--

LOCK TABLES `salary_templates` WRITE;
/*!40000 ALTER TABLE `salary_templates` DISABLE KEYS */;
INSERT INTO `salary_templates` VALUES (1,'1','Employee Salary Template','2017-04-01','2017-04-26 04:47:52','2017-04-26 04:47:52',1,NULL);
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
  CONSTRAINT `fk_rails_3e744cafed` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_2eefdd8975` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
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
INSERT INTO `schema_migrations` VALUES ('20150324102043'),('20150325090846'),('20150325091324'),('20150325100517'),('20150325100542'),('20150325101803'),('20150325102033'),('20150325104717'),('20150325111606'),('20150325111623'),('20150325134729'),('20150325134819'),('20150325134837'),('20150325134903'),('20150325134922'),('20150325134940'),('20150325135957'),('20150325140537'),('20150325144044'),('20150325150921'),('20150325150947'),('20150325174047'),('20150325174955'),('20150327052554'),('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060618'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151202085649'),('20151216125726'),('20151216152348'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160126095053'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145448'),('20160316052708'),('20160316094100'),('20160316141509'),('20160331045040'),('20160404140512'),('20160412090355'),('20160415070421'),('20160420061134'),('20160422090711'),('20160425125834'),('20160425130117'),('20160425130430'),('20160426051551'),('20160427065407'),('20160427070132'),('20160429092014'),('20160429101007'),('20160430085609'),('20160430102835'),('20160430121430'),('20160502065715'),('20160503130816'),('20160505114907'),('20160506111946'),('20160506132700'),('20160507041032'),('20160507091410'),('20160507093658'),('20160507125255'),('20160509053112'),('20160510063354'),('20160510100004'),('20160511051814'),('20160512064603'),('20160512104401'),('20160512121825'),('20160513054933'),('20160513111008'),('20160514043418'),('20160518120252'),('20160518131745'),('20160519044004'),('20160519052729'),('20160519093350'),('20160519095917'),('20160521090528'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102305'),('20160521125304'),('20160521125746'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523065040'),('20160523101534'),('20160523105510'),('20160523121643'),('20160524135053'),('20160524141810'),('20160524151419'),('20160524160726'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525092335'),('20160525093729'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525103235'),('20160525123930'),('20160525133638'),('20160525151304'),('20160526051433'),('20160526052421'),('20160526052958'),('20160527084359'),('20160527104217'),('20160527111646'),('20160527120440'),('20160527140816'),('20160527141004'),('20160527141144'),('20160527142915'),('20160528063330'),('20160528063928'),('20160601110412'),('20160603070019'),('20160603074402'),('20160604051919'),('20160604051920'),('20160611123423'),('20160611124310'),('20160611124312'),('20160611124313'),('20160611124314'),('20160611133245'),('20160613092931'),('20160614072206'),('20160615092744'),('20160616065812'),('20160616070304'),('20160616095752'),('20160616124121'),('20160616133220'),('20160617092902'),('20160617104631'),('20160618095321'),('20160620054519'),('20160620055118'),('20160620064939'),('20160620072911'),('20160620104935'),('20160620121046'),('20160622093650'),('20160622130051'),('20160622131114'),('20160623041219'),('20160623041859'),('20160623052807'),('20160623070518'),('20160623071253'),('20160623080812'),('20160623081113'),('20160623112832'),('20160623134245'),('20160625182131'),('20160627072219'),('20160627073417'),('20160627110446'),('20160629063100'),('20160629065100'),('20160630094223'),('20160701085057'),('20160701114346'),('20160701134431'),('20160702054606'),('20160702063829'),('20160702070306'),('20160702095708'),('20160702120512'),('20160704101850'),('20160705193212'),('20160705194038'),('20160705195945'),('20160705235546'),('20160708094655'),('20160708113856'),('20160709092245'),('20160709092553'),('20160709092554'),('20160713065422'),('20160713103049'),('20160713120654'),('20160714101056'),('20160714110530'),('20160714111459'),('20160714111509'),('20160714150355'),('20160714151407'),('20160714152316'),('20160714152715'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715040433'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718052304'),('20160718060157'),('20160718060643'),('20160718064620'),('20160718065930'),('20160719060335'),('20160719061924'),('20160719091404'),('20160720064045'),('20160720130301'),('20160721085732'),('20160721102648'),('20160723062632'),('20160723080129'),('20160723105713'),('20160726055056'),('20160728072434'),('20160729053928'),('20160729065257'),('20160730091204'),('20160730094606'),('20160801111028'),('20160802071320'),('20160802100120'),('20160804113523'),('20160805110143'),('20160805121851'),('20160816125736'),('20160817071523'),('20160819054051'),('20160825065859'),('20160827064407'),('20160827065404'),('20160829042937'),('20160829070847'),('20160829104436'),('20160829120956'),('20160830111216'),('20160902105729'),('20160903102739'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160907102455'),('20160908061653'),('20160908093902'),('20160912055114'),('20160913043824'),('20160919045818'),('20160926060633'),('20160926063141'),('20160927120109'),('20161004100505'),('20161004100722'),('20161004130453'),('20161007125531'),('20161013052635'),('20161014073847'),('20161014124546'),('20161018113305'),('20161019065322'),('20161019103720'),('20161104093342'),('20161105060406'),('20161107100328'),('20161107135922'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161114115826'),('20161114125046'),('20161119073523'),('20161119073618'),('20161119073700'),('20161121132745'),('20161122113351'),('20161122114309'),('20161122114648'),('20161123105419'),('20161123105420'),('20161123105421'),('20161124060652'),('20161124071935'),('20161124091647'),('20161124091725'),('20161124112153'),('20161124112721'),('20161125104852'),('20161126103908'),('20161128060507'),('20161128111741'),('20161129124940'),('20161129125213'),('20161203040527'),('20161212104430'),('20161215074308'),('20161216062450'),('20161216112032'),('20161220121946'),('20161220124243'),('20161221070931'),('20161221115255'),('20161231091546'),('20161231115416'),('20170102083022'),('20170102084600'),('20170102091214'),('20170102092744'),('20170107064553'),('20170109044054'),('20170109125507'),('20170110045655'),('20170112050137'),('20170116051750'),('20170117094339'),('20170118034909'),('20170118040257'),('20170118070135'),('20170125122032'),('20170127063657'),('20170131111613'),('20170203131348'),('20170203141934'),('20170204035132'),('20170207105642'),('20170208060007'),('20170208124431'),('20170209052940'),('20170209064013'),('20170209103531'),('20170210072013'),('20170213063011'),('20170214120418'),('20170215060325'),('20170215062521'),('20170216040223'),('20170216053607'),('20170217092904'),('20170218051520'),('20170218053643'),('20170222091948'),('20170223053723'),('20170223053807'),('20170223070956'),('20170224043312'),('20170224044647'),('20170224062827'),('20170224091456'),('20170227050116'),('20170227050304'),('20170301093409'),('20170302113203'),('20170303040100'),('20170304054259'),('20170304114424'),('20170306045721'),('20170306084847'),('20170306095314'),('20170309062116'),('20170310122831'),('20170310123007'),('20170317054641'),('20170317070345'),('20170318044750'),('20170320060327'),('20170320062722'),('20170320065646'),('20170321050344'),('20170321071817'),('20170321084647'),('20170327102041'),('20170404093007'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170412064643'),('20170413063000'),('20170413072802'),('20170418111052'),('20170420105215'),('20170421050543'),('20170427043450'),('20170428041951'),('20170428045355'),('20170428061933'),('20170428093132'),('20170429090052'),('20170501071548'),('20170501075331'),('20170502044158'),('20170508073310'),('20170508142940'),('20170508144515'),('20170509052752'),('20170509053306'),('20170509091200'),('20170509105811'),('20170511092455'),('20170513090123'),('20170516100415'),('20170516101636'),('20170516131303'),('20170516132052'),('20170518133935');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsets`
--

LOCK TABLES `skillsets` WRITE;
/*!40000 ALTER TABLE `skillsets` DISABLE KEYS */;
INSERT INTO `skillsets` VALUES (1,45,'communication skill','Competence',NULL,'2017-05-02 09:05:34','2017-05-02 09:05:34'),(2,42,'Communication','Proficiency',NULL,'2017-05-02 09:18:13','2017-05-02 09:18:13'),(3,15,'Excel','Expertise',NULL,'2017-05-02 09:30:11','2017-05-02 09:30:11'),(4,13,'Parul Nanda','Mastery',NULL,'2017-05-02 09:46:06','2017-05-02 09:46:06');
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
  CONSTRAINT `fk_rails_922655bdb9` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_0009117d0a` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_6001d56ded` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
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
INSERT INTO `states` VALUES (1,1,'AN','Union Territory of Andaman and Nicobar Islands','2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,1,'AP','Andhra Pradesh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,1,'AR','Arunachal Pradesh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,1,'AS','Assam','2017-04-20 07:00:41','2017-04-20 07:00:41'),(5,1,'BR','Bihar','2017-04-20 07:00:41','2017-04-20 07:00:41'),(6,1,'CH','Chandigarh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(7,1,'CT','State of Chhattisgarh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(8,1,'DD','Daman and Diu','2017-04-20 07:00:41','2017-04-20 07:00:41'),(9,1,'DL','National Capital Territory of Delhi','2017-04-20 07:00:41','2017-04-20 07:00:41'),(10,1,'DN','Dadra and Nagar Haveli','2017-04-20 07:00:41','2017-04-20 07:00:41'),(11,1,'GA','Goa','2017-04-20 07:00:41','2017-04-20 07:00:41'),(12,1,'GJ','Gujarat','2017-04-20 07:00:41','2017-04-20 07:00:41'),(13,1,'HP','State of Himachal Pradesh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(14,1,'HR','Haryana','2017-04-20 07:00:41','2017-04-20 07:00:41'),(15,1,'JH','State of Jharkhand','2017-04-20 07:00:41','2017-04-20 07:00:41'),(16,1,'JK','Kashmir','2017-04-20 07:00:41','2017-04-20 07:00:41'),(17,1,'KA','Karnataka','2017-04-20 07:00:41','2017-04-20 07:00:41'),(18,1,'KL','Kerala','2017-04-20 07:00:41','2017-04-20 07:00:41'),(19,1,'LD','Laccadives','2017-04-20 07:00:41','2017-04-20 07:00:41'),(20,1,'MH','Maharashtra','2017-04-20 07:00:41','2017-04-20 07:00:41'),(21,1,'ML','Meghalaya','2017-04-20 07:00:41','2017-04-20 07:00:41'),(22,1,'MN','Manipur','2017-04-20 07:00:41','2017-04-20 07:00:41'),(23,1,'MP','Madhya Pradesh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(24,1,'MZ','Mizoram','2017-04-20 07:00:41','2017-04-20 07:00:41'),(25,1,'NL','Nagaland','2017-04-20 07:00:41','2017-04-20 07:00:41'),(26,1,'OR','Odisha','2017-04-20 07:00:41','2017-04-20 07:00:41'),(27,1,'PB','State of Punjab','2017-04-20 07:00:41','2017-04-20 07:00:41'),(28,1,'PY','Union Territory of Puducherry','2017-04-20 07:00:41','2017-04-20 07:00:41'),(29,1,'RJ','Rajasthan','2017-04-20 07:00:41','2017-04-20 07:00:41'),(30,1,'SK','Sikkim','2017-04-20 07:00:41','2017-04-20 07:00:41'),(31,1,'TG','Telangana','2017-04-20 07:00:41','2017-04-20 07:00:41'),(32,1,'TN','Tamil Nadu','2017-04-20 07:00:41','2017-04-20 07:00:41'),(33,1,'TR','Tripura','2017-04-20 07:00:41','2017-04-20 07:00:41'),(34,1,'UL','Uttarakhand','2017-04-20 07:00:41','2017-04-20 07:00:41'),(35,1,'UP','Uttar Pradesh','2017-04-20 07:00:41','2017-04-20 07:00:41'),(36,1,'WB','West Bengal','2017-04-20 07:00:41','2017-04-20 07:00:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_topic_masters`
--

LOCK TABLES `training_topic_masters` WRITE;
/*!40000 ALTER TABLE `training_topic_masters` DISABLE KEYS */;
INSERT INTO `training_topic_masters` VALUES (1,'HRMS','HRMS','',NULL,NULL,'2017-05-02 12:38:54','2017-05-02 12:38:54');
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
INSERT INTO `travel_expence_types` VALUES (1,'1.0','Travel Expence',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,'2.0','Food Expence',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,'3.0','Lodgging Expence',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,'4.0','Other Expence',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41');
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
INSERT INTO `travel_modes` VALUES (1,'1.0','By Bus',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,'2.0','By Train',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,'3.0','By Plan',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,'4.0','By Ship',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41');
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
INSERT INTO `travel_options` VALUES (1,'1.0','Domestic',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,'2.0','National',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,'3.0','International',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,NULL,'University of Delhi',NULL,NULL,'2017-05-02 08:39:24','2017-05-02 08:39:24'),(2,NULL,'IGNOU',NULL,NULL,'2017-05-02 08:39:43','2017-05-02 08:39:43'),(3,NULL,'graphic era deemd  university',NULL,1,'2017-05-02 08:39:53','2017-05-02 09:18:41'),(4,NULL,'Jaipur National university',NULL,NULL,'2017-05-02 09:11:18','2017-05-02 09:11:54'),(5,NULL,'Maharishi Dayanand University(MDU)',NULL,NULL,'2017-05-02 09:25:30','2017-05-02 09:25:30'),(6,NULL,'Symbosis Pune',NULL,NULL,'2017-05-02 09:52:14','2017-05-02 09:52:14'),(7,NULL,'Punjab Technical University',NULL,NULL,'2017-05-02 10:13:47','2017-05-02 10:13:47'),(8,NULL,'Bhartiye Vidya Bhawan',NULL,NULL,'2017-05-02 10:13:54','2017-05-02 10:13:54'),(9,NULL,'EMDI Institute of Event Management ',NULL,NULL,'2017-05-02 10:14:54','2017-05-02 10:15:18'),(10,NULL,'Allahabad Agricultural University',NULL,NULL,'2017-05-02 10:17:21','2017-05-02 10:17:21'),(11,NULL,'vinoba bhave university, HAZARIBAGH',NULL,NULL,'2017-05-02 11:04:56','2017-05-02 11:04:56'),(12,NULL,'haldia institute of technology and management',NULL,NULL,'2017-05-02 11:09:41','2017-05-02 11:09:41'),(13,NULL,'Lucknow University',NULL,NULL,'2017-05-03 04:06:28','2017-05-03 04:06:28'),(14,NULL,'Calcutta University',NULL,1,'2017-05-03 04:08:33','2017-05-03 04:09:21'),(15,NULL,'Mumbai University',NULL,NULL,'2017-05-03 04:17:33','2017-05-03 04:17:33'),(16,NULL,'Jamia Millia Islamia',NULL,NULL,'2017-05-03 04:19:49','2017-05-03 04:19:49'),(17,NULL,'Gurujameshwar University',NULL,NULL,'2017-05-08 06:25:47','2017-05-08 06:25:47'),(18,NULL,'Bangalore University',NULL,NULL,'2017-05-09 06:37:13','2017-05-09 06:37:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_off_masters`
--

LOCK TABLES `week_off_masters` WRITE;
/*!40000 ALTER TABLE `week_off_masters` DISABLE KEYS */;
INSERT INTO `week_off_masters` VALUES (1,1,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:11',1,'2017-05-01','2017-12-31',NULL),(2,2,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:11',1,'2017-05-01','2017-12-31',NULL),(3,3,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:12',1,'2017-05-01','2017-12-31',NULL),(4,4,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:12',1,'2017-05-01','2017-12-31',NULL),(5,5,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:12',1,'2017-05-01','2017-12-31',NULL),(6,6,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:13',1,'2017-05-01','2017-12-31',NULL),(7,7,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:13',1,'2017-05-01','2017-12-31',NULL),(8,8,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:13',1,'2017-05-01','2017-12-31',NULL),(9,9,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:14',1,'2017-05-01','2017-12-31',NULL),(10,10,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:14',1,'2017-05-01','2017-12-31',NULL),(11,11,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:15',1,'2017-05-01','2017-12-31',NULL),(12,12,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:15',1,'2017-05-01','2017-12-31',NULL),(13,13,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:15',1,'2017-05-01','2017-12-31',NULL),(14,14,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:16',1,'2017-05-01','2017-12-31',NULL),(15,15,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:16',1,'2017-05-01','2017-12-31',NULL),(16,16,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:17',1,'2017-05-01','2017-12-31',NULL),(17,17,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:17',1,'2017-05-01','2017-12-31',NULL),(18,18,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:17',1,'2017-05-01','2017-12-31',NULL),(19,19,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:18',1,'2017-05-01','2017-12-31',NULL),(20,20,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:18',1,'2017-05-01','2017-12-31',NULL),(21,21,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:18',1,'2017-05-01','2017-12-31',NULL),(22,22,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:19',1,'2017-05-01','2017-12-31',NULL),(23,23,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:19',1,'2017-05-01','2017-12-31',NULL),(24,24,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:20',1,'2017-05-01','2017-12-31',NULL),(25,25,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:20',1,'2017-05-01','2017-12-31',NULL),(26,26,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:20',1,'2017-05-01','2017-12-31',NULL),(27,27,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:21',1,'2017-05-01','2017-12-31',NULL),(28,28,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:21',1,'2017-05-01','2017-12-31',NULL),(29,29,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:21',1,'2017-05-01','2017-12-31',NULL),(30,30,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:22',1,'2017-05-01','2017-12-31',NULL),(31,31,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:22',1,'2017-05-01','2017-12-31',NULL),(32,32,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:23',1,'2017-05-01','2017-12-31',NULL),(33,33,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:23',1,'2017-05-01','2017-12-31',NULL),(34,34,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:23',1,'2017-05-01','2017-12-31',NULL),(35,35,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:24',1,'2017-05-01','2017-12-31',NULL),(36,36,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:24',1,'2017-05-01','2017-12-31',NULL),(37,37,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:25',1,'2017-05-01','2017-12-31',NULL),(38,38,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:25',1,'2017-05-01','2017-12-31',NULL),(39,39,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:25',1,'2017-05-01','2017-12-31',NULL),(40,40,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:26',1,'2017-05-01','2017-12-31',NULL),(41,41,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:26',1,'2017-05-01','2017-12-31',NULL),(42,42,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:27',1,'2017-05-01','2017-12-31',NULL),(43,43,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:27',1,'2017-05-01','2017-12-31',NULL),(44,44,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:27',1,'2017-05-01','2017-12-31',NULL),(45,45,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:28',1,'2017-05-01','2017-12-31',NULL),(46,46,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:28',1,'2017-05-01','2017-12-31',NULL),(47,47,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:29',1,'2017-05-01','2017-12-31',NULL),(48,48,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:29',1,'2017-05-01','2017-12-31',NULL),(49,49,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:30',1,'2017-05-01','2017-12-31',NULL),(50,50,'Sun',1,'2017-05-10 05:34:43','2017-05-10 05:35:30',1,'2017-05-01','2017-12-31',NULL);
/*!40000 ALTER TABLE `week_off_masters` ENABLE KEYS */;
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
  `gatepass` decimal(10,0) DEFAULT NULL,
  `calculated_payable_days` decimal(10,0) DEFAULT NULL,
  `ot_hours` decimal(10,0) DEFAULT NULL,
  `od_leave` decimal(10,0) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `full_and_final` tinyint(1) DEFAULT NULL,
  `od_day` decimal(10,0) DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `date` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (20,1995,NULL,'2017-05-02 08:40:30','2017-05-02 08:40:30'),(21,1996,NULL,'2017-05-02 08:40:33','2017-05-02 08:40:33'),(22,1997,NULL,'2017-05-02 08:40:37','2017-05-02 08:40:37'),(23,1998,NULL,'2017-05-02 08:40:40','2017-05-02 08:40:40'),(24,1999,NULL,'2017-05-02 08:40:45','2017-05-02 08:40:45'),(25,2000,NULL,'2017-05-02 08:40:49','2017-05-02 08:40:49'),(26,2001,NULL,'2017-05-02 08:40:53','2017-05-02 08:40:53'),(27,2002,NULL,'2017-05-02 08:40:56','2017-05-02 08:40:56'),(28,2003,NULL,'2017-05-02 08:40:59','2017-05-02 08:40:59'),(29,2004,NULL,'2017-05-02 08:41:02','2017-05-02 08:41:02'),(30,2005,NULL,'2017-05-02 08:41:05','2017-05-02 08:41:05'),(31,2006,NULL,'2017-05-02 08:41:08','2017-05-02 08:41:08'),(32,2007,NULL,'2017-05-02 08:41:11','2017-05-02 08:41:11'),(33,2008,NULL,'2017-05-02 08:41:14','2017-05-02 08:41:14'),(34,2009,NULL,'2017-05-02 08:41:17','2017-05-02 08:41:17'),(35,2010,NULL,'2017-05-02 08:41:23','2017-05-02 08:41:23'),(36,2011,NULL,'2017-05-02 08:41:26','2017-05-02 08:41:26'),(37,2012,NULL,'2017-05-02 08:41:29','2017-05-02 08:41:29'),(38,2013,NULL,'2017-05-02 08:41:33','2017-05-02 08:41:33'),(39,2014,NULL,'2017-05-02 08:41:36','2017-05-02 08:41:36'),(40,2015,NULL,'2017-05-02 08:41:39','2017-05-02 08:41:39'),(41,2016,NULL,'2017-05-02 08:41:42','2017-05-02 08:41:42'),(42,2017,NULL,'2017-05-02 08:41:45','2017-05-02 08:41:45'),(43,2018,NULL,'2017-05-02 09:52:21','2017-05-02 09:52:21');
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

-- Dump completed on 2017-05-26 18:04:21
