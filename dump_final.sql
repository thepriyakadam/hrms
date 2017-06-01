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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
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
-- Table structure for table `authorized_bies`
--

DROP TABLE IF EXISTS `authorized_bies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorized_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_bies`
--

LOCK TABLES `authorized_bies` WRITE;
/*!40000 ALTER TABLE `authorized_bies` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorized_bies` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,' Allahabad Bank',NULL,NULL,NULL,'2017-04-22 08:07:29','2017-04-22 08:07:29'),(2,' Andhra Bank',NULL,NULL,NULL,'2017-04-22 08:07:36','2017-04-22 08:07:36'),(3,' Bank of India',NULL,NULL,NULL,'2017-04-22 08:07:42','2017-04-22 08:07:42'),(4,' Bank of Baroda',NULL,NULL,NULL,'2017-04-22 08:07:47','2017-04-22 08:07:47'),(5,' Bank of Maharashtra',NULL,NULL,NULL,'2017-04-22 08:07:52','2017-04-22 08:07:52'),(6,' Canara Bank',NULL,NULL,NULL,'2017-04-22 08:07:57','2017-04-22 08:07:57'),(7,' Central Bank of India',NULL,NULL,NULL,'2017-04-22 08:08:02','2017-04-22 08:08:02'),(8,' Corporation Bank',NULL,NULL,NULL,'2017-04-22 08:08:06','2017-04-22 08:08:06'),(9,' Dena Bank',NULL,NULL,NULL,'2017-04-22 08:08:16','2017-04-22 08:08:16'),(10,' Indian Bank',NULL,NULL,NULL,'2017-04-22 08:08:24','2017-04-22 08:08:24'),(11,' Indian Overseas Bank',NULL,NULL,NULL,'2017-04-22 08:09:01','2017-04-22 08:09:01'),(12,' IDBI Bank',NULL,NULL,NULL,'2017-04-22 08:09:06','2017-04-22 08:09:06'),(13,' Oriental Bank of Commerce',NULL,NULL,NULL,'2017-04-22 08:09:10','2017-04-22 08:09:10'),(14,' Punjab & Sindh Bank',NULL,NULL,NULL,'2017-04-22 08:09:15','2017-04-22 08:09:15'),(15,' Punjab National Bank',NULL,NULL,NULL,'2017-04-22 08:09:20','2017-04-22 08:09:20'),(16,' State Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:24','2017-04-22 08:09:24'),(17,' Syndicate Bank',NULL,NULL,NULL,'2017-04-22 08:09:29','2017-04-22 08:09:29'),(18,' UCO Bank',NULL,NULL,NULL,'2017-04-22 08:09:33','2017-04-22 08:09:33'),(19,' Union Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:37','2017-04-22 08:09:37'),(20,' United Bank of India',NULL,NULL,NULL,'2017-04-22 08:09:41','2017-04-22 08:09:41'),(21,' Vijaya Bank',NULL,NULL,NULL,'2017-04-22 08:09:46','2017-04-22 08:09:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'AB+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'B+',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
INSERT INTO `companies` VALUES (1,NULL,'01','COM001','Redefine Marcom Pvt Ltd','Redefine',1,'7896541230','','','','New Delhi',1,9,138,'New Delhi',123456,'','9875463210','www.redefine.com',NULL,'2017-04-20 07:31:18','2017-04-20 09:26:45',NULL,NULL,NULL,NULL);
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-04-20 07:31:18','2017-04-20 07:31:18'),(2,'company_location',3,'2017-04-20 07:35:54','2017-04-20 07:39:06'),(3,'department',8,'2017-04-20 09:29:09','2017-04-21 09:10:23'),(4,'employee',50,'2017-04-25 04:09:17','2017-04-25 04:09:18');
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_daily_bill_details_on_travel_request_id` (`travel_request_id`),
  KEY `index_daily_bill_details_on_travel_expence_type_id` (`travel_expence_type_id`),
  KEY `index_daily_bill_details_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_daily_bill_details_on_currency_master_id` (`currency_master_id`),
  CONSTRAINT `fk_rails_6ffb83d83c` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_streams`
--

LOCK TABLES `degree_streams` WRITE;
/*!40000 ALTER TABLE `degree_streams` DISABLE KEYS */;
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
INSERT INTO `degree_types` VALUES (1,'1.0','Under Graduate',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(2,'2.0','Technical',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(3,'3.0','Senior Secondary',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(4,'4.0','Professional',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(5,'5.0','Primary School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(6,'6.0','Post Graduate',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(7,'7.0','Middle School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(8,'8.0','High School',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(9,'9.0','Graduate',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41'),(10,'10.0','Diploma',NULL,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'01','DEPT001','','Director',1,'','2017-04-20 09:29:09','2017-04-24 05:13:16',1),(2,1,'02','DEPT002','CND','CND',1,'','2017-04-21 09:05:47','2017-04-24 11:17:20',NULL),(3,1,'03','DEPT003','','CS&BD',1,'','2017-04-21 09:06:13','2017-04-21 09:06:13',NULL),(4,1,'04','DEPT004','','DDC',1,'','2017-04-21 09:07:19','2017-04-21 09:07:19',NULL),(5,1,'05','DEPT005','','OPS',1,'','2017-04-21 09:07:47','2017-04-21 09:07:47',NULL),(6,1,'06','DEPT006','','HRAF',1,'','2017-04-21 09:08:27','2017-04-21 09:08:27',NULL),(7,2,'07','DEPT007','','OPS',1,'','2017-04-21 09:09:40','2017-04-21 09:09:40',NULL),(8,3,'08','DEPT008','','OPS',1,'','2017-04-21 09:10:23','2017-04-21 09:10:23',NULL);
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
  `employee_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `present` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `machine_attendance_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `count` decimal(5,2) DEFAULT NULL,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `company_time_master_id` int(11) DEFAULT NULL,
  `working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rest_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `difference_hrs` decimal(10,0) DEFAULT NULL,
  `overtime_hrs` decimal(10,0) DEFAULT NULL,
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `late_mark` decimal(10,0) DEFAULT NULL,
  `on_duty_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_cccb9f7b46` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`),
  CONSTRAINT `fk_rails_dd1af2be7a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_e1778f034d` FOREIGN KEY (`machine_attendance_id`) REFERENCES `machine_attendances` (`id`)
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
INSERT INTO `employee_code_masters` VALUES (1,'Permanent','10001','10001',1,NULL,'2017-04-21 09:03:24','2017-04-21 09:03:24');
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
INSERT INTO `employee_designations` VALUES (61,'1.0','3D & GRAPHIC DESIGNER',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(62,'2.0','Accounts Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(63,'3.0','Alliance Associate',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(64,'4.0','Asst Manager - Lead Generation',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(65,'5.0','Asst Manager - Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(66,'6.0','Asst Manager Database',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(67,'7.0','Branch Operation Lead',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(68,'8.0','Client Servicing - Associate Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(69,'9.0','Content Writer',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(70,'10.0','Creative  - Lead',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(71,'11.0','Database Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(72,'12.0','Director',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(73,'13.0','Dupty Manager Accounts',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(74,'14.0','Executive - Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(75,'15.0','Executive Conversational',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(76,'16.0','Executive Conversational Specialist',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(77,'17.0','Executive DemandCom',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(78,'18.0','Executive-Operations',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(79,'19.0','HR Associate',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(80,'20.0','Manager - Database',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(81,'21.0','Manager - DemandCOM',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(82,'22.0','Operation Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(83,'23.0','Program Associates Rewards',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(84,'24.0','SEO Executive',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(85,'25.0','Sr Business Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(86,'26.0','Sr Creative - Graphic & 3D',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(87,'27.0','Sr Executive Client Servicing - Operation',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(88,'28.0','Sr Executive Demand Com',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(89,'29.0','Sr Team Lead -Conversational',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(90,'30.0','Sr.Business Manager',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22'),(91,'31.0','TL- Conversational Specialist',NULL,NULL,'2017-04-25 13:18:22','2017-04-25 13:18:22');
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
-- Table structure for table `employee_gps_histories`
--

DROP TABLE IF EXISTS `employee_gps_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_gps_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_gps_histories_on_member_id` (`member_id`),
  CONSTRAINT `fk_rails_850c70a5fd` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (49,4,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(50,5,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(51,6,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(52,7,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(53,8,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(54,9,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(55,10,2,NULL,'4.5',NULL,'4.5','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(56,11,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(57,12,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(58,13,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(59,14,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(60,15,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(61,16,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(62,17,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(63,18,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(64,19,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(65,20,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(66,21,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(67,22,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(68,23,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(69,24,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(70,25,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(71,26,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(72,27,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(73,28,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(74,29,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(75,30,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(76,31,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(77,32,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(78,33,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(79,34,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(80,35,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(81,36,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(82,37,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(83,38,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(84,39,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(85,40,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(86,41,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(87,42,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(88,43,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(89,44,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(90,45,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(91,46,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(92,47,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(93,48,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(94,49,2,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(95,50,2,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(96,4,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(97,5,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(98,6,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(99,7,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(100,8,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(101,9,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(102,10,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(103,11,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(104,12,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(105,13,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(106,14,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(107,15,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(108,16,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(109,17,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(110,18,7,NULL,'4.0',NULL,'4.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(111,19,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(112,20,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(113,21,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(114,22,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(115,23,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(116,24,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(117,25,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(118,26,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(119,27,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(120,28,7,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(121,29,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(122,30,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(123,31,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(124,32,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(125,33,7,NULL,'4.0',NULL,'4.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(126,34,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(127,35,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(128,36,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(129,37,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(130,38,7,NULL,'5.0',NULL,'5.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(131,39,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(132,40,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(133,41,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(134,42,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(135,43,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(136,44,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(137,45,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(138,46,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(139,47,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(140,48,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(141,49,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:47','2017-04-25 13:38:47',NULL,NULL,NULL,1),(142,50,7,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(143,4,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(144,5,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(145,6,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(146,7,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(147,8,1,NULL,'9.5',NULL,'9.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(148,9,1,NULL,'0.5',NULL,'0.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(149,10,1,NULL,'1.0',NULL,'1.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(150,11,1,NULL,'8.0',NULL,'8.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(151,12,1,NULL,'10.0',NULL,'10.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(152,13,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(153,14,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(154,15,1,NULL,'8.5',NULL,'8.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(155,16,1,NULL,'9.5',NULL,'9.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(156,17,1,NULL,'8.5',NULL,'8.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(157,18,1,NULL,'3.0',NULL,'3.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(158,19,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(159,20,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(160,21,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(161,22,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(162,23,1,NULL,'5.0',NULL,'5.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(163,24,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(164,25,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(165,26,1,NULL,'11.0',NULL,'11.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(166,27,1,NULL,'2.0',NULL,'2.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(167,28,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(168,29,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(169,30,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(170,31,1,NULL,'8.0',NULL,'8.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(171,32,1,NULL,'7.5',NULL,'7.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(172,33,1,NULL,'7.5',NULL,'7.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(173,34,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(174,35,1,NULL,'2.0',NULL,'2.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(175,36,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(176,37,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(177,38,1,NULL,'8.5',NULL,'8.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(178,39,1,NULL,'9.0',NULL,'9.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(179,40,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(180,41,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(181,42,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(182,43,1,NULL,'7.0',NULL,'7.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(183,44,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(184,45,1,NULL,'12.0',NULL,'12.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(185,46,1,NULL,'0.0',NULL,'0.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(186,47,1,NULL,'10.5',NULL,'10.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(187,48,1,NULL,'7.5',NULL,'7.5','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(188,49,1,NULL,'6.0',NULL,'6.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1),(189,50,1,NULL,'2.0',NULL,'2.0','2017-04-25 13:38:48','2017-04-25 13:38:48',NULL,NULL,NULL,1);
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
  `first_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  `present_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_requests_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_requests_on_leav_category_id` (`leav_category_id`),
  KEY `index_employee_leav_requests_on_first_reporter_id` (`first_reporter_id`),
  KEY `index_employee_leav_requests_on_second_reporter_id` (`second_reporter_id`),
  CONSTRAINT `fk_rails_feec339143` FOREIGN KEY (`second_reporter_id`) REFERENCES `second_reporters` (`id`),
  CONSTRAINT `fk_rails_36b7682875` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_68601cf95e` FOREIGN KEY (`first_reporter_id`) REFERENCES `first_reporters` (`id`),
  CONSTRAINT `fk_rails_76a71d5b78` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `second_reporter_id` int(11) DEFAULT NULL,
  `final_reporter_id` int(11) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_first_approved` tinyint(1) DEFAULT NULL,
  `is_second_approved` tinyint(1) DEFAULT NULL,
  `is_final_approved` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_first_rejected` tinyint(1) DEFAULT NULL,
  `is_second_rejected` tinyint(1) DEFAULT NULL,
  `is_final_rejected` tinyint(1) DEFAULT NULL,
  `application_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_resignations_on_employee_id` (`employee_id`),
  KEY `index_employee_resignations_on_leaving_reason_id` (`leaving_reason_id`),
  KEY `index_employee_resignations_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_employee_resignations_on_second_reporter_id` (`second_reporter_id`),
  KEY `index_employee_resignations_on_final_reporter_id` (`final_reporter_id`),
  CONSTRAINT `fk_rails_28528e25a1` FOREIGN KEY (`final_reporter_id`) REFERENCES `final_reporters` (`id`),
  CONSTRAINT `fk_rails_8480baf6c1` FOREIGN KEY (`second_reporter_id`) REFERENCES `second_reporters` (`id`),
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
  `parent_salary_component_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_employee_salary_templates_on_employee_id` (`employee_id`),
  KEY `index_employee_salary_templates_on_salary_template_id` (`salary_template_id`),
  KEY `index_employee_salary_templates_on_salary_component_id` (`salary_component_id`),
  KEY `index_employee_salary_templates_on_parent_salary_component_id` (`parent_salary_component_id`),
  KEY `index_employee_salary_templates_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_0a4494cbdd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7f73b6d393` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_98548e5d4d` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_9cd9c2068b` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`),
  CONSTRAINT `fk_rails_c49eb88a1c` FOREIGN KEY (`parent_salary_component_id`) REFERENCES `parent_salary_components` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_templates`
--

LOCK TABLES `employee_salary_templates` WRITE;
/*!40000 ALTER TABLE `employee_salary_templates` DISABLE KEYS */;
INSERT INTO `employee_salary_templates` VALUES (1,1,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,35000.00,420000.00,1,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(2,1,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,17500.00,210000.00,1,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(3,1,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,1,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(4,1,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,1,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(5,1,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14650.00,175800.00,1,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(6,2,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,37500.00,450000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(7,2,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18750.00,225000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(8,2,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(9,2,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(10,2,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15900.00,190800.00,2,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(11,3,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(12,3,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(13,3,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(14,3,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(15,3,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,24650.00,295800.00,3,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(16,4,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(17,4,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(18,4,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(19,4,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(20,4,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4650.00,55800.00,4,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(21,20,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(22,20,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(23,20,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(24,20,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(25,20,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,5,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(26,21,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12500.00,150000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(27,21,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(28,21,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(29,21,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(30,21,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11400.00,136800.00,6,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(31,5,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,42000.00,504000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(32,5,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,21000.00,252000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(33,5,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(34,5,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(35,5,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18150.00,217800.00,7,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(36,6,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13166.50,157992.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(37,6,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6583.25,78996.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(38,6,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(39,6,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(40,6,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3733.25,44796.00,8,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(41,7,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(42,7,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(43,7,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(44,7,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(45,7,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,9,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(46,8,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14458.50,173496.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(47,8,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7229.25,86748.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(48,8,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(49,8,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(50,8,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4379.25,52548.00,10,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(51,9,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,24750.00,297000.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(52,9,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12375.00,148500.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(53,9,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(54,9,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(55,9,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9525.00,114300.00,11,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(56,22,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7750.00,93000.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(57,22,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3875.00,46500.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(58,22,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(59,22,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(60,22,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1025.00,12300.00,12,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(61,23,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12500.00,150000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(62,23,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(63,23,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(64,23,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(65,23,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3400.00,40800.00,13,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(66,10,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(67,10,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(68,10,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(69,10,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(70,10,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,14,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(71,24,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10208.50,122496.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(72,24,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5104.25,61248.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(73,24,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(74,24,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(75,24,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2254.25,27048.00,15,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(76,25,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(77,25,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(78,25,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(79,25,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(80,25,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6650.00,79800.00,16,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(81,11,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,17500.00,210000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(82,11,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8750.00,105000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(83,11,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(84,11,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(85,11,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5900.00,70800.00,17,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(86,12,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,28750.00,345000.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(87,12,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14375.00,172500.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(88,12,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(89,12,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(90,12,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11525.00,138300.00,18,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(91,26,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10666.50,127992.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(92,26,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5333.25,63996.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(93,26,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(94,26,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(95,26,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2483.25,29796.00,19,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(96,27,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,37500.00,450000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(97,27,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18750.00,225000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(98,27,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(99,27,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(100,27,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15900.00,190800.00,20,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(101,28,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8250.00,99000.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(102,28,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4125.00,49500.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(103,28,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(104,28,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(105,28,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1275.00,15300.00,21,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(106,29,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9416.50,112992.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(107,29,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4708.25,56496.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(108,29,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(109,29,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(110,29,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1858.25,22296.00,22,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(111,30,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10916.50,130992.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(112,30,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5458.25,65496.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(113,30,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(114,30,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(115,30,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2608.25,31296.00,23,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(116,31,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10541.50,126492.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(117,31,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5270.75,63240.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(118,31,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(119,31,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(120,31,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2420.75,29040.00,24,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(121,32,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6500.00,78000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(122,32,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3250.00,39000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(123,32,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(124,32,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(125,32,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,400.00,4800.00,25,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(126,33,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(127,33,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(128,33,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(129,33,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(130,33,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,26,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(131,34,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10000.00,120000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(132,34,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5000.00,60000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(133,34,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(134,34,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(135,34,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2150.00,25800.00,27,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(136,35,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10624.50,127488.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(137,35,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5312.25,63744.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(138,35,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(139,35,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(140,35,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2462.25,29544.00,28,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(141,36,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11000.00,132000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(142,36,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5500.00,66000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(143,36,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(144,36,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(145,36,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13150.00,157800.00,29,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(146,13,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8500.00,102000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(147,13,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4250.00,51000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(148,13,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(149,13,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(150,13,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,30,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(151,37,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5500.00,66000.00,31,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(152,37,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2750.00,33000.00,31,'2017-04-26 04:55:50','2017-04-26 04:55:50',NULL),(153,37,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(154,37,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(155,37,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,-100.00,-1200.00,31,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(156,14,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11500.00,138000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(157,14,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(158,14,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(159,14,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(160,14,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2900.00,34800.00,32,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(161,38,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8041.50,96492.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(162,38,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4020.75,48240.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(163,38,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(164,38,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(165,38,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1170.75,14040.00,33,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(166,15,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11541.50,138492.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(167,15,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5770.75,69240.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(168,15,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(169,15,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(170,15,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2920.75,35040.00,34,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(171,39,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7550.00,90600.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(172,39,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3775.00,45300.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(173,39,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(174,39,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(175,39,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,925.00,11100.00,35,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(176,16,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12583.50,150996.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(177,16,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6291.75,75492.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(178,16,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(179,16,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(180,16,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3441.75,41292.00,36,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(181,40,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(182,40,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(183,40,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(184,40,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(185,40,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,37,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(186,41,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8041.00,96492.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(187,41,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4020.50,48240.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(188,41,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(189,41,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(190,41,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1170.50,14040.00,38,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(191,17,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,20000.00,240000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(192,17,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10000.00,120000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(193,17,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(194,17,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(195,17,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7150.00,85800.00,39,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(196,42,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(197,42,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(198,42,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(199,42,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(200,42,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,40,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(201,43,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(202,43,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(203,43,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(204,43,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(205,43,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,41,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(206,18,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(207,18,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(208,18,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(209,18,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(210,18,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,42,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(211,44,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(212,44,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(213,44,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(214,44,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(215,44,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,43,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(216,45,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7916.50,94992.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(217,45,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3958.25,47496.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(218,45,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(219,45,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(220,45,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1108.25,13296.00,44,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(221,19,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14000.00,168000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(222,19,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7000.00,84000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(223,19,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(224,19,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(225,19,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4150.00,49800.00,45,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(226,46,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5750.00,69000.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(227,46,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2875.00,34500.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(228,46,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(229,46,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(230,46,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,25.00,300.00,46,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(231,47,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6250.00,75000.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(232,47,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3125.00,37500.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(233,47,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(234,47,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(235,47,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,47,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(236,48,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6249.50,74988.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(237,48,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3124.75,37488.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(238,48,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(239,48,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(240,48,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,274.75,3288.00,48,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(241,49,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12000.00,144000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(242,49,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6000.00,72000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(243,49,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(244,49,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(245,49,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3150.00,37800.00,49,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(246,50,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10550.00,126600.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(247,50,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5275.00,63300.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(248,50,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(249,50,1,8,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL),(250,50,1,5,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2425.00,29100.00,50,'2017-04-26 04:55:51','2017-04-26 04:55:51',NULL);
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_employee_transfers_on_employee_id` (`employee_id`),
  KEY `index_employee_transfers_on_reporting_master_id` (`reporting_master_id`),
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
  CONSTRAINT `fk_rails_b36922fdd3` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_ba9cc4640b` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `manager_2_id` int(11) DEFAULT NULL,
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
  KEY `index_employees_on_manager_2_id` (`manager_2_id`),
  KEY `index_employees_on_company_id` (`company_id`),
  KEY `index_employees_on_company_location_id` (`company_location_id`),
  KEY `index_employees_on_department_id` (`department_id`),
  KEY `index_employees_on_punch_card_id` (`punch_card_id`),
  KEY `index_employees_on_employee_code_master_id` (`employee_code_master_id`),
  CONSTRAINT `fk_rails_0025f65a97` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_0e6f1ceeeb` FOREIGN KEY (`employee_code_master_id`) REFERENCES `employee_code_masters` (`id`),
  CONSTRAINT `fk_rails_0f20a81443` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_35378dc89f` FOREIGN KEY (`manager_2_id`) REFERENCES `manager_2s` (`id`),
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
INSERT INTO `employees` VALUES (1,'1001','EMP0000001',NULL,NULL,'Akshay',NULL,'Suri','1978-08-10','Male','9811057680',NULL,'a.suri@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','AJWPS0416K',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(2,'1002','EMP0000002',NULL,NULL,'Sandipan',NULL,'Ray','1974-08-10','Male','9810469900',NULL,'s.ray@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','AFGPR0677D',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(3,'1003','EMP0000003',NULL,NULL,'Vishal',NULL,'Chhibber','1980-05-24','Male','9818273232',NULL,'v.chhibber@redefine.in','Address',1,9,NULL,NULL,100000,NULL,'0','ADFPC8373A',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(4,'1004','EMP0000004',NULL,NULL,'Devender',NULL,'Kumar','1985-09-29','Male','9717527782',NULL,'devender.rawat@redefine.in','Krishana Vihar, Mohkam Pur Khurd, Dehradun, Uttarakhand-248005',1,34,863,NULL,248005,NULL,'2026','DEMPK1138C','DL- 0920060146874','Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(5,'1007','EMP0000005',NULL,NULL,'Swadesh',NULL,'Gupta','1984-03-26','Male','9311605558',NULL,'swadesh.gupta@redefine.in','586,587,Shekhupura Colony,Aliganj,Lucknow-222022',1,9,NULL,NULL,110051,'34,2nd Floor, Baldev Park\nNear Dixit Dairy\nDelhi-110051\n','0','BCBPG1122M',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,3,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(6,'1008','EMP0000006',NULL,NULL,'Kirti',NULL,'Puri','1993-07-17','Female','9560314084',NULL,'kirti.puri@redefine.in','Block-E, B.K.Dutt Colony, Karbala, Lodhi Road, New Delhi-03',1,9,NULL,NULL,110003,'Same as Current','9627','CAMPP2068M',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(7,'1010','EMP0000007',NULL,NULL,'Santosh','Kumar','Shah','1983-07-23','Male','9650776747',NULL,NULL,'h no - 48 khasra no --155 1st floor , street no 3/5 block no - A janta yar mukandpur delhi- 110042',1,9,NULL,NULL,110042,'Same as Current','901727668404',NULL,'DL-0220090004607','Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(8,'1013','EMP0000008',NULL,NULL,'Naresh',NULL,'Kumar','1988-10-04','Male','7838011428',NULL,'naresh.kumar@redefine.in','Same as Current',1,9,NULL,NULL,110059,'A-453, JJ Colony, Hastal Road, Uttam Nagar, New Delhi-59','6041','DREPK0860G','DL-0920130218255','Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(9,'1018','EMP0000009',NULL,NULL,'Satish','Kumar','Yadav','1984-02-24','Male','9999413126',NULL,'satish.yadav@redefine.in','B-317, I.D.P.L, Virbhadra, Rishikesh, Uttarakhand',1,9,NULL,NULL,201301,'C/o-Sahab Singh Rana Village-Chaura Sadatpur,Sector-22, Room No-1, 2nd Floor, Near Block J-239 Noida-201301','0','AEEPY2761A',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(10,'1025','EMP0000010',NULL,NULL,'Ashish','Kumar','Dubey','1986-07-10','Male','9555189991',NULL,'ashish.dubey@redefine.in','Address',1,9,NULL,NULL,110077,'B – 55 MBR Enclave,Pochunpur Dwarka Sec 23, New Delhi - 110077','0','ATIPD8836A',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(11,'1040','EMP0000011',NULL,NULL,'Raksha',NULL,'Dwivedi','1992-03-04','Female','9560089603',NULL,'raksha.shukla@redefine.in','W/O Priyanshu Shukla, H.N.-127/961, W-1, Saket Nagar, Juhi Colony, Kanpur-208014',1,9,NULL,NULL,110095,'D-12, S-4,Dilshad Colony,Delhi- 110095','4504','BOXPD65769',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,3,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(12,'1041','EMP0000012',NULL,NULL,'Chandan','Baran ','Das','1984-10-19','Male','9836363232',NULL,'chandan.das@redefine.in','5/70, Bijoygarh Colony, Ward No.-98, Jadavpur, Kolkata-700092',1,14,265,NULL,122002,'Room No.-412, H. N. -1007, Sarswati Vihar, Gurgaon ','0','ATYPD2334F',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,3,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(13,'1073','EMP0000013',NULL,NULL,'Parul',NULL,'Nanda','1988-05-27','Female','9810356548',NULL,'parul.nanda@redefine.in','6-12 Nehru nagar new delhi - 110065',1,9,138,NULL,110065,'N-11 Old Double Dtorey Lajpat Nagar-4 New Delhi -110024','462694242788','AMPPN9897H',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(14,'1077','EMP0000014',NULL,NULL,'Sonia',NULL,'Verma','1987-11-20','Female','9873988046',NULL,'talen@redine.in','1/26 Double Storey Vijay Nagar Delhi - 110009',1,9,NULL,NULL,110009,'Same as Current','459593011066','CUWPS6989L',NULL,'Married',NULL,2,1,NULL,'No','No','Active',1,NULL,1,1,6,NULL,'2017-04-25 04:09:17','2017-04-25 05:12:21',1,NULL,NULL,NULL,NULL),(15,'1087','EMP0000015',NULL,NULL,'Brajesh',NULL,'Kumar','1981-10-06','Male','8750083444',NULL,'brajesh.kumar@redefine.in','E-28 Saraswati Enclave Gurgaon-122001',1,14,265,NULL,122001,'Same as Current','863827347254','BVDPK1022R',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(16,'1093','EMP0000016',NULL,NULL,'Prem','Ranjan ','Das','1976-12-15','Male','9873686647',NULL,'premranjan.das@redefine.in','3-A,Buddh bazar ,Chhath Park DK Mohan garden West delhi -59',1,9,NULL,NULL,110059,'C/O Soniya Plot no-49 Vikas Nagar Ext Uttam Nagar Delhi-110059 ','883343441698','AMBPD9267D',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(17,'1096','EMP0000017',NULL,NULL,'Poonam',NULL,'Wadhwa','1984-02-04','Female','9811553803',NULL,'poonam.wadhwa@redefine.in','cc-89C Shalimar bagh,Near police station New Delhi- 110088',1,9,NULL,NULL,110088,'Same as Current','715272359575','AYAPP8035G',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(18,'1103','EMP0000018',NULL,NULL,'Dinesh','Kumar','Dangi','1987-01-05','Male','9873524003',NULL,'dinesh.dangi@redefine.in','A-119 gali Chopal Wali no - 6 Shalimar Village Delhi-110088',1,9,NULL,NULL,110088,'Same as Current','629331615971','AYLPK4828K',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(19,'1109','EMP0000019',NULL,NULL,'Brijesh','Kumar','Verma','1979-12-02','Male','9990028618',NULL,'brijesh.verma@redefine.in','Sri Ghanshyam Das Verma,Geetanjali Bhawan Kali Mandir Station Road dist-Ghazipur UP',1,9,NULL,NULL,110059,'u-65 sf , Vishu Vihar,Uttam Nagar-110059 Near Goyal Hardware','451068137456','AGDPV7056L',NULL,'Married',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(20,'1005','EMP0000020',NULL,NULL,'Mohd',NULL,'Shahnawaz','1990-02-09','Male','9599281264',NULL,'mohd.shahnawaz@redefine.in','Same as Current',1,9,NULL,NULL,110006,'H.No-462, Street Matia Mahal,Jama Masjid,Delhi-110006','0','BYBPS0114F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,3,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(21,'1006','EMP0000021',NULL,NULL,'Nagma',NULL,'Ansari','1989-07-21','Female','9650570746',NULL,'nagma.ansari@redefine.in/accounts@redefinemarcom.com','Same as Current',1,9,NULL,NULL,110091,'B-4, Stret No.9, Pratap Nagar, Mayur Vihar Phase-I, New Delhi-91','7098','BQMPA4731M',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,6,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(22,'1023','EMP0000022',NULL,NULL,'Puneet',NULL,'Sharma','1992-11-20','Male','9582999972',NULL,'puneet.sharma@redefine.in','T-25, baljeet nagar, Near West patel nagar, New Delhi-08',1,9,NULL,NULL,110008,'Same as Current','7547','DPHPS2356A',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(23,'1024','EMP0000023',NULL,NULL,'Praveen',NULL,'Paudyal','1992-12-17','Male','9718209509',NULL,'praveen.paudyal@redefine.in','House no. 2029, Sec-4-b,  Vasundhara, Ghaziabad-201012',1,9,915,NULL,201012,'Same as Current','9273','BZGPP0822B',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(24,'1033','EMP0000024',NULL,NULL,'Indrani',NULL,NULL,'1988-05-25','Female','9911879557',NULL,'indrani.arora@redefine.in','H.N.-3216, Arya Pura, Sabji Mandi, Near Clock Tower, Delhi-07',1,9,NULL,NULL,110007,'Same as Current','0','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(25,'1036','EMP0000025',NULL,NULL,'Dilip','Singh','Bist','1993-02-24','Male','9873264222',NULL,'dilip.bist@redefine.in','N-23/A, Jagat Ram Park,Laxmi Nagar, Delhi-92',1,9,NULL,NULL,110092,'Same as Current','4757','BLWPB7112G',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,3,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(26,'1048','EMP0000026',NULL,NULL,'Rachna',NULL,'Negi','1995-02-07','Female','8527480866',NULL,'rachna.negi@redefine.in','I-16/258 Pyare Lal Road, Dev Nagar,Karol Bagh, New Delhi-05',1,9,NULL,NULL,110005,'Same as Current','8062','AZUPN4429P',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(27,'1050','EMP0000027',NULL,NULL,'Meenakshi',NULL,'Sharma','1994-08-17','Female','8527315659',NULL,'meenakshi.sharma@redefine.in','H. N.-268, Block-22, Panchkuian Road Near Mandir Marg, New Delhi-01 ',1,9,135,NULL,110001,'Same as Current','241206058792','FOAPS6051C',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(28,'1056','EMP0000028',NULL,NULL,'Manish',NULL,'Rawat','1997-05-30','Male','8826715704',NULL,'manish.rawat@redefine.in','150-B, DDA Flat, Gazipur, New Delhi-96',1,9,NULL,NULL,110096,'Same as Current','8596','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(29,'1058','EMP0000029',NULL,NULL,'Nancy',NULL,'Jain','1993-08-18','Female','8802643060',NULL,'nancy.jain@redefine.in','H.No.-1/5650, Street No.-11, Balbir Nagar, Shahdara, Delhi-32',1,9,NULL,NULL,110032,'Same as Current','355223329926','BAUPJ6733J',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(30,'1062','EMP0000030',NULL,NULL,'Simran',NULL,'Kaur','1994-03-23','Female','9910527496',NULL,'simran.kaur@redefine.in','WZ-3258, Mahindra Park, Rani bagh, Delhi-34',1,9,NULL,NULL,110034,'Same as Current','823340650090','DJTPK9507D',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(31,'1065','EMP0000031',NULL,NULL,'Ravit',NULL,'Marwah',NULL,'Male','9599281262',NULL,'ravit.marwah@redefine.in','C-121/A, Ganesh Nagar,Tilak Nagar, Behind Mangla Hospital,Delhi-110018',1,9,NULL,NULL,110018,'Same as Current','513506656089','CRHPM1769C',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(32,'1066','EMP0000032',NULL,NULL,'R.',NULL,'Balaji','1997-11-22','Male','9891524833',NULL,'r.balaji@redefine.in','D-2, 222 Kidwai Nagar west, delhi-110023',1,9,NULL,NULL,110023,'Same as Current','896703653000','N.A',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(33,'1068','EMP0000033',NULL,NULL,'Bhawna',NULL,'Kansotia','1992-10-29','Female','9654014552',NULL,'bhawna@redefine.in','16/587, 1-floor,Bapa Nagar, Karol Bagh, Delhi-110005',1,9,NULL,NULL,110005,'Same as Current','875005688602','CCPPB22489',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(34,'1069','EMP0000034',NULL,NULL,'Rajat',NULL,'Rathore','1990-10-12','Male','7795111251',NULL,'rajat.rathor@redefine.in','Flat 1802, A1 Tower,Gardenia Glory, Sec 46, Noida – 201301',1,35,NULL,NULL,201301,'Same as Current','810336007378','ASNPR7948D',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(35,'1070','EMP0000035',NULL,NULL,'Reshu ',NULL,NULL,NULL,'Male','9891391702',NULL,'reshu.dwivedi@redefine.in','A-1/21, Sec 18, Rohini,Delhi – 110085',1,9,NULL,NULL,110085,'Same as Current','723805728700','CLEPD7171G',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(36,'1072','EMP0000036',NULL,NULL,'Sahiba','Kaur','Chawla',NULL,'Female','9999845366',NULL,'sahibakaur.chawla@redefine.in','32/20 East Patel Nagar New Delhi – 110008',1,9,NULL,NULL,110008,'Same as Current','455120389983','ARMPC7657A','DL-1020100034643','Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(37,'1076','EMP0000037',NULL,NULL,'Pawan',NULL,'Jha','1994-08-07','Male','9716161033',NULL,'pawan.jha@redefine.in','157 new pmgp colony anand nagar eastern express highway mumbai mulund east maharasthra - 400081',1,20,486,NULL,400081,'Dharam vihar Khora colony Ghaziabad up ','678528940071','AVHPJ9783H',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(38,'1083','EMP0000038',NULL,NULL,'Mansi ',NULL,'Grover','1993-05-10','Female','9313909729',NULL,'mansi.grover@redefine.in','A- 73 Extn Mohan Garden Uttam nagar new delhi -110059',1,9,NULL,NULL,110059,'Same as Current','225190820178','BQGPG9012H',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(39,'1092','EMP0000039',NULL,NULL,'Sahil',NULL,'Kanda','1996-08-31','Male','8377062838',NULL,'sahil.kanda@reddefine.in','H-192 Uttam Nagar Mohan Garden ,Rama Park Road Delhi-110059',1,9,NULL,NULL,110059,'Same as Current','430397673194','EAJPK2591F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,6,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(40,'1094','EMP0000040',NULL,NULL,'Smita',NULL,'Jha','1993-12-09','Female','9599329060',NULL,'smita.jha@redefine.in','B-31,Plot no 10,Himalyan Residency ,Dwarka,Sec-22 delhi-110077',1,9,NULL,NULL,110077,'Same as Current','207453522783','FRHPS2882F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(41,'1095','EMP0000041',NULL,NULL,'Mohammed',NULL,'Hussain','1995-10-24','Male','9900293283',NULL,'mohammed.hussain@redefine.in','Hno- 283/4 16th cross ,devarajus nagar,old guddahalli mysore road Bangalore- 560026',1,17,NULL,NULL,560026,'Same as Current','0','ALEPH0106R',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,2,5,NULL,'2017-04-25 04:09:17','2017-04-25 04:09:17',1,NULL,NULL,NULL,NULL),(42,'1101','EMP0000042',NULL,NULL,'Pankhuri',NULL,'Singh','1995-12-05','Male','9971908034',NULL,'pankhuri.singh@redefine.in','64/11 Railway Colony Subzi mandi pratap nagar delhi-110007',1,9,NULL,NULL,110007,'Same as Current','323103610078','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(43,'1102','EMP0000043',NULL,NULL,'Twinkle',NULL,'Aggarwal','1996-08-10','Female','9582044757',NULL,'twinkle.aggarwal@redefine.in','Same as Current',1,9,NULL,NULL,110051,' A-68 Aram ParkNear Chandu Park Krishna Nagar Ram Nagar Delhi-110051\n\n\n\n\n','318304392288','BQSPA3155M',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(44,'1106','EMP0000044',NULL,NULL,'Kritika',NULL,'Jain','1993-07-08','Female','9953102801',NULL,'kritika.jain@redefine.in','C-31/5 B,street no 2 , Arjun Mohalla ,Maujpur north east delhi 110053',1,9,NULL,NULL,110053,'Same as Current','611055444724','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(45,'1107','EMP0000045',NULL,NULL,'M.',NULL,'Vijay','1999-09-03','Male','7531031247',NULL,'mani.vijay@redefine.in','DDA Colony House no C634 2nd Floor Khyala Near Subhash Nagar New Delhi -110018 ',1,9,138,NULL,110018,'Same as Current','889951406510','ANRPV7882P',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(46,'1110','EMP0000046',NULL,NULL,'Vipul',NULL,'Kumar','1995-08-19','Male','8447727091',NULL,'vipul.kumar@redefine.in','6178/1 , Block 1 gali no 3 Dev Nagar Karol Bagh Delhi - 110005',1,9,NULL,NULL,110008,'18/13 west patel nagar New Delhi - 110008','217293351361','AGGPK4451L',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(47,'1111','EMP0000047',NULL,NULL,'Aryan',NULL,'Singh','1998-01-22','Male','9205854394',NULL,'aryan.singh@redefine.in','Same as Current',1,9,138,NULL,110015,'B-452 Sudarshan park new delhi-110015','577273113535','NOT HAVING',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(48,'1112','EMP0000048',NULL,NULL,'Ayush',NULL,'Sharma','1994-04-19','Male','9582620251',NULL,'ayush.sharma@redefine.in','944 Ram Puram Muzaffarnagar UP pin-251001',1,9,NULL,NULL,110008,'4/2 west patel nagar block 4 opp women\'s showroom delhi- 110008','276876665419','HCYPS9625C',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(49,'1114','EMP0000049',NULL,NULL,'Akshay',NULL,'Verma','1993-01-24','Male','8802681891',NULL,'akshay.verma@redefine.in','2237/2 Kham pur West Patel nagar - new delhi 110008',1,9,NULL,NULL,110008,'Same as Current','664037777765','ASFPV9970P',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL),(50,'1116','EMP0000050',NULL,NULL,'Rahul',NULL,'Gupta','1991-05-25','Male','9920479760',NULL,'rahul.gupta@redefine.in','Sai Shradha Seva Mandal,Jija Mata,Appa pada,Kurar Village,Malad East S.O, Mumbai,Maharashtra- 4000097',1,20,486,NULL,4000097,'Same as Current','277882435239','ATKPG2068F',NULL,'Unmarried',NULL,2,1,NULL,'No','No','Active',NULL,NULL,1,3,5,NULL,'2017-04-25 04:09:18','2017-04-25 04:09:18',1,NULL,NULL,NULL,NULL);
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
  CONSTRAINT `fk_rails_951b58ed70` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_4683ab9fbb` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7fb6f3c699` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`)
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
-- Table structure for table `goal_bunches`
--

DROP TABLE IF EXISTS `goal_bunches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_bunches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `goal_confirm` tinyint(1) DEFAULT NULL,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraisee_confirm` tinyint(1) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `appraiser_rating` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `appraiser_confirm` tinyint(1) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `review_comment` text COLLATE utf8_unicode_ci,
  `reviewer_rating_id` int(11) DEFAULT NULL,
  `reviewer_confirm` tinyint(1) DEFAULT NULL,
  `final_id` int(11) DEFAULT NULL,
  `final_comment` text COLLATE utf8_unicode_ci,
  `final_rating_id` int(11) DEFAULT NULL,
  `final_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_calendar_id` int(11) DEFAULT NULL,
  `r_promotion` tinyint(1) DEFAULT NULL,
  `r_increment` tinyint(1) DEFAULT NULL,
  `r_designation_id` int(11) DEFAULT NULL,
  `r_ctc` decimal(10,0) DEFAULT NULL,
  `f_promotion` tinyint(1) DEFAULT NULL,
  `f_increment` tinyint(1) DEFAULT NULL,
  `f_designation_id` int(11) DEFAULT NULL,
  `f_ctc` decimal(10,0) DEFAULT NULL,
  `appraisee_rating_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_approval` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_bunches_on_employee_id` (`employee_id`),
  KEY `index_goal_bunches_on_appraisee_id` (`appraisee_id`),
  KEY `index_goal_bunches_on_appraiser_id` (`appraiser_id`),
  KEY `index_goal_bunches_on_reviewer_id` (`reviewer_id`),
  KEY `index_goal_bunches_on_reviewer_rating_id` (`reviewer_rating_id`),
  KEY `index_goal_bunches_on_final_id` (`final_id`),
  KEY `index_goal_bunches_on_final_rating_id` (`final_rating_id`),
  KEY `index_goal_bunches_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_bunches_on_r_designation_id` (`r_designation_id`),
  KEY `index_goal_bunches_on_f_designation_id` (`f_designation_id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_4dc52351c6` FOREIGN KEY (`f_designation_id`) REFERENCES `f_designations` (`id`),
  CONSTRAINT `fk_rails_7d2d58e4aa` FOREIGN KEY (`r_designation_id`) REFERENCES `r_designations` (`id`),
  CONSTRAINT `fk_rails_9f504f9ae1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers` (`id`),
  CONSTRAINT `fk_rails_d23b4f7653` FOREIGN KEY (`final_rating_id`) REFERENCES `final_ratings` (`id`),
  CONSTRAINT `fk_rails_e600ac96e3` FOREIGN KEY (`reviewer_rating_id`) REFERENCES `reviewer_ratings` (`id`),
  CONSTRAINT `fk_rails_ec199cab30` FOREIGN KEY (`appraisee_id`) REFERENCES `appraisees` (`id`),
  CONSTRAINT `fk_rails_f18e6db452` FOREIGN KEY (`appraiser_id`) REFERENCES `appraisers` (`id`),
  CONSTRAINT `fk_rails_f40d698ac5` FOREIGN KEY (`final_id`) REFERENCES `finals` (`id`)
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
  `goal_setter_id` int(11) DEFAULT NULL,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_id` int(11) DEFAULT NULL,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_goal_ratings_on_goal_bunch_id` (`goal_bunch_id`),
  KEY `index_goal_ratings_on_goal_perspective_id` (`goal_perspective_id`),
  KEY `index_goal_ratings_on_goal_setter_id` (`goal_setter_id`),
  KEY `index_goal_ratings_on_appraisee_id` (`appraisee_id`),
  KEY `index_goal_ratings_on_appraiser_id` (`appraiser_id`),
  KEY `index_goal_ratings_on_appraiser_rating_id` (`appraiser_rating_id`),
  KEY `index_goal_ratings_on_reviewer_id` (`reviewer_id`),
  KEY `index_goal_ratings_on_attribute_id` (`attribute_id`),
  KEY `index_goal_ratings_on_attribute_master_id` (`attribute_master_id`),
  KEY `index_goal_ratings_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_ratings_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_goal_ratings_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_53077b3df5` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_148c3fde36` FOREIGN KEY (`appraisee_id`) REFERENCES `appraisees` (`id`),
  CONSTRAINT `fk_rails_29b7b75090` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers` (`id`),
  CONSTRAINT `fk_rails_3e8e8f22ef` FOREIGN KEY (`appraiser_rating_id`) REFERENCES `appraiser_ratings` (`id`),
  CONSTRAINT `fk_rails_4fbfad9588` FOREIGN KEY (`appraiser_id`) REFERENCES `appraisers` (`id`),
  CONSTRAINT `fk_rails_6e86e151d5` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_9026e8df92` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_9452dd42b5` FOREIGN KEY (`goal_setter_id`) REFERENCES `goal_setters` (`id`),
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
INSERT INTO `groups` VALUES (1,'redefine@gmail.com','$2a$10$znB1Ku3ss4lcRkQzsIbmj.2pV7wNa83Lu8.Hss9oqULh/MzVIA22C','Redefine',NULL,NULL,NULL,8,'2017-04-25 06:09:36','2017-04-25 03:37:41','114.143.205.226','114.143.205.226','2017-04-20 07:11:34','2017-04-25 06:09:36',NULL,NULL,NULL,NULL);
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
  `replacement_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_joining_details_on_employee_id` (`employee_id`),
  KEY `index_joining_details_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_joining_details_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_joining_details_on_reserved_category_id` (`reserved_category_id`),
  KEY `index_joining_details_on_cost_center_id` (`cost_center_id`),
  KEY `index_joining_details_on_employee_category_id` (`employee_category_id`),
  KEY `index_joining_details_on_payment_mode_id` (`payment_mode_id`),
  KEY `index_joining_details_on_replacement_id` (`replacement_id`),
  CONSTRAINT `fk_rails_214c8daf87` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2399bfef36` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`),
  CONSTRAINT `fk_rails_393577d02f` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_62455f7dcc` FOREIGN KEY (`reserved_category_id`) REFERENCES `reserved_categories` (`id`),
  CONSTRAINT `fk_rails_6eaf6acc55` FOREIGN KEY (`replacement_id`) REFERENCES `replacements` (`id`),
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
INSERT INTO `joining_details` VALUES (1,1,'2009-06-02',NULL,72,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(2,2,'2010-04-10',NULL,72,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(3,3,'2009-06-02',NULL,72,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(4,4,'2009-08-06',NULL,86,NULL,NULL,'100453998915',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(5,5,'2010-09-01',NULL,85,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(6,6,'2011-09-01',NULL,89,NULL,NULL,'100454154711',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(7,7,'2012-03-13',NULL,67,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(8,8,'2012-08-20',NULL,70,NULL,NULL,'100454215052',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(9,9,'2012-12-17',NULL,81,NULL,NULL,'100454364966',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(10,10,'2014-05-05',NULL,80,NULL,NULL,'100454271860',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(11,11,'2014-12-14',NULL,68,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(12,12,'2015-02-09',NULL,85,NULL,NULL,'100454352217',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(13,13,'2015-02-23',NULL,77,NULL,NULL,'100453970521',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(14,14,'2015-03-09',NULL,79,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(15,15,'2015-05-01',NULL,66,NULL,NULL,'100575414409',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(16,16,'2015-05-15',NULL,91,NULL,NULL,'100575091329',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(17,17,'2015-06-01',NULL,64,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(18,18,'2015-06-07',NULL,61,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(19,19,'2015-07-01',NULL,65,NULL,NULL,'100574854355',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(20,20,'2015-09-25',NULL,85,NULL,NULL,'100575339353',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(21,21,'2015-11-04',NULL,73,NULL,NULL,'100864301745',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(22,22,'2015-12-17',NULL,78,'2016-08-01',NULL,'100866989728',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(23,23,'2016-01-05',NULL,83,'2016-08-01',NULL,'100861245425',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(24,24,'2016-02-02',NULL,75,'2017-01-01',NULL,'100878897290',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(25,25,'2016-04-01',NULL,87,'2017-01-01',NULL,'100865716916',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(26,26,'2016-03-08',NULL,76,'2017-01-09',NULL,'100859692032',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(27,27,'2016-03-28',NULL,76,'2017-01-01',NULL,'100867410470',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(28,28,'2016-04-05',NULL,76,'2017-01-01',NULL,'100865705849',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(29,29,'2016-05-23',NULL,76,NULL,NULL,'100454027563',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(30,30,'2016-06-06',NULL,88,'2017-01-01',NULL,'100893530255',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(31,31,'2016-06-23',NULL,82,NULL,NULL,'100935819057',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(32,32,'2016-06-27',NULL,71,'2017-01-01',NULL,'100938142893',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(33,33,'2016-06-28',NULL,84,'2017-01-01',NULL,'100934677694',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(34,34,'2016-07-01',NULL,77,'2017-01-01',NULL,'100454281216',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(35,35,'2016-08-16',NULL,77,NULL,NULL,'100923234508',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(36,36,'2016-08-01',NULL,63,'2017-01-01',NULL,'100929157502',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(37,37,'2016-08-01',NULL,71,'2017-01-01',NULL,'100917733456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(38,38,'2016-08-01',NULL,77,NULL,NULL,'100913443268',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(39,39,'2016-08-03',NULL,62,'2017-01-01',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(40,40,'2016-08-22',NULL,69,'2017-04-01',NULL,'100930097309',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(41,41,'2016-08-22',NULL,78,'2017-04-01',NULL,'100924407924',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(42,42,'2016-09-01',NULL,76,'2017-01-01',NULL,'100915654721',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(43,43,'2016-09-27',NULL,76,NULL,NULL,'100954207969',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(44,44,'2016-10-01',NULL,76,'2017-01-01',NULL,'100453941212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(45,45,'2016-10-03',NULL,76,NULL,NULL,'100954207953',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(46,46,'2016-10-06',NULL,76,NULL,NULL,'100954207982',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(47,47,'2016-10-10',NULL,76,NULL,NULL,'100954207976',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(48,48,'2016-11-09',NULL,76,NULL,NULL,'100957376055',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(49,49,'2016-12-01',NULL,77,NULL,NULL,'100965093370',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL),(50,50,'2015-07-06',NULL,74,NULL,NULL,'100574945263',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-04-25 08:16:34','2017-04-25 08:16:34',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'1.0','CL','Casual Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'2.0','EL','Earned Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'3.0','LWP','LWP Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'4.0','ESIC','ESIC Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'5.0','AL','Advance Leave',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'6.0','C.Off','Compensatory Off',NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'7.0','Sick Leave','',NULL,'2017-04-25 13:38:27','2017-04-25 13:38:27',1,NULL,NULL,1,0,NULL,NULL,0,0,0,NULL);
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
  CONSTRAINT `fk_rails_caa1617fdd` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_7084af96c0` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
  `change_status_employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_status_records_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_leave_status_records_on_change_status_employee_id` (`change_status_employee_id`),
  CONSTRAINT `fk_rails_80fb730e9f` FOREIGN KEY (`change_status_employee_id`) REFERENCES `change_status_employees` (`id`),
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
  `user_id` int(11) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_machine_attendances_on_employee_id` (`employee_id`),
  KEY `index_machine_attendances_on_shift_master_id` (`shift_master_id`),
  KEY `index_machine_attendances_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_55c38ce56a` FOREIGN KEY (`shift_master_id`) REFERENCES `shift_masters` (`id`),
  CONSTRAINT `fk_rails_743778213d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_92c2935f30` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
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
  `manager_id` int(11) DEFAULT NULL,
  `manager_2_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_manager_histories_on_employee_id` (`employee_id`),
  KEY `index_manager_histories_on_manager_id` (`manager_id`),
  KEY `index_manager_histories_on_manager_2_id` (`manager_2_id`),
  CONSTRAINT `fk_rails_12b5d02349` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`),
  CONSTRAINT `fk_rails_6626907ede` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7c326729cd` FOREIGN KEY (`manager_2_id`) REFERENCES `manager_2s` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `meet_tos`
--

DROP TABLE IF EXISTS `meet_tos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet_tos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet_tos`
--

LOCK TABLES `meet_tos` WRITE;
/*!40000 ALTER TABLE `meet_tos` DISABLE KEYS */;
/*!40000 ALTER TABLE `meet_tos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (8,'10014',1,'EMP0000014',NULL,'talen@redine.in','$2a$10$L2RAZb9ftO/EUiL8AiNtQulqK.qPY/i5zlHTZgdKH1BXIPe7nJg8G',NULL,NULL,'2017-04-25 09:59:14',5,'2017-04-25 10:09:31','2017-04-25 09:59:14','103.57.85.197','103.57.85.197','2017-04-25 05:12:21','2017-04-25 10:09:31',1,1,6,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  CONSTRAINT `fk_rails_b6b50899cc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_2c147fe338` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`)
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
  `first_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  `current_status` int(11) DEFAULT NULL,
  `is_pending` tinyint(1) DEFAULT NULL,
  `is_cancelled` tinyint(1) DEFAULT NULL,
  `is_first_approved` tinyint(1) DEFAULT NULL,
  `is_second_approved` tinyint(1) DEFAULT NULL,
  `is_first_rejected` tinyint(1) DEFAULT NULL,
  `is_second_rejected` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_on_duty_requests_on_employee_id` (`employee_id`),
  KEY `index_on_duty_requests_on_first_reporter_id` (`first_reporter_id`),
  KEY `index_on_duty_requests_on_second_reporter_id` (`second_reporter_id`),
  CONSTRAINT `fk_rails_3f108f7c0e` FOREIGN KEY (`second_reporter_id`) REFERENCES `second_reporters` (`id`),
  CONSTRAINT `fk_rails_3f4c37aed9` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_face2efa23` FOREIGN KEY (`first_reporter_id`) REFERENCES `first_reporters` (`id`)
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
  CONSTRAINT `fk_rails_6dbef4ee67` FOREIGN KEY (`performance_activity_id`) REFERENCES `performance_activities` (`id`),
  CONSTRAINT `fk_rails_23005f6fef` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Christian','1.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'Hindu','2.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'Muslim','3.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'Sikh','4.0',NULL,NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_employee_transfers_on_employee_transfer_id` (`employee_transfer_id`),
  KEY `index_reporting_employee_transfers_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_7824eb06c2` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,1,'2017-04-25 04:12:49','2017-04-25 04:12:49',0,0,0,0,0,0,1);
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
  `training_request_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_training` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_training_reqs_on_training_request_id` (`training_request_id`),
  KEY `index_reporting_masters_training_reqs_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_32846684e4` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_6a9a7e031f` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`)
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
  `travel_request_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `travel_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `daily_bill_comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_travel_requests_on_travel_request_id` (`travel_request_id`),
  KEY `index_reporting_masters_travel_requests_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_b36ee15272` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
  CONSTRAINT `fk_rails_e52f190f66` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vacancy_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_vacancy_masters_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_reporting_masters_vacancy_masters_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_023d07fad1` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_categories`
--

LOCK TABLES `reserved_categories` WRITE;
/*!40000 ALTER TABLE `reserved_categories` DISABLE KEYS */;
INSERT INTO `reserved_categories` VALUES (1,'1.0','GENERAL','GENERAL',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(2,'2.0','OBC','OTHER BACKWARD CLASSES',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(3,'3.0','SC','SCHEDULED CASTE',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40'),(4,'4.0','ST','SCHEDULED TRIBE',NULL,'2017-04-20 07:00:40','2017-04-20 07:00:40');
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
INSERT INTO `roles` VALUES (1,'1','GroupAdmin','',NULL,'2017-04-25 04:09:55','2017-04-25 04:09:55'),(2,'2','Admin','',NULL,'2017-04-25 04:10:04','2017-04-25 04:10:04'),(3,'3','Branch','',NULL,'2017-04-25 04:10:16','2017-04-25 04:10:16'),(4,'4','HOD','',NULL,'2017-04-25 04:10:29','2017-04-25 04:10:29'),(5,'5','Supervisor','',NULL,'2017-04-25 04:10:56','2017-04-25 04:10:56'),(6,'6','Employee','',NULL,'2017-04-25 04:11:05','2017-04-25 04:11:05');
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
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salary_component_templates_on_salary_template_id` (`salary_template_id`),
  KEY `index_salary_component_templates_on_salary_component_id` (`salary_component_id`),
  KEY `index_salary_component_templates_on_parent_salary_component_id` (`parent_salary_component_id`),
  KEY `index_salary_component_templates_on_parent_id` (`parent_id`),
  CONSTRAINT `fk_rails_a46279275d` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
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
INSERT INTO `salary_component_templates` VALUES (1,'1',1,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-04-26 04:49:44','2017-04-26 04:49:44'),(2,'1',1,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-04-26 04:49:52','2017-04-26 04:49:52'),(3,'1',1,4,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-04-26 04:49:57','2017-04-26 04:49:57'),(4,'1',1,8,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-04-26 04:50:10','2017-04-26 04:50:10'),(5,'1',1,5,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-04-26 04:50:15','2017-04-26 04:50:15');
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
  `parent_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_base` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salary_components_on_parent_id` (`parent_id`),
  CONSTRAINT `fk_rails_0f60effe8f` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'01','Basic','Basic',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:21','',1,1),(2,'02','HRA','HRA',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:35','',1,1),(3,'3.0','Special Allowance','Special Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(4,'04','Convenience Allowance','Convenience Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-26 04:48:50','',1,1),(5,'05','Other Allowance','Other Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-26 04:49:04','',1,1),(6,'6.0','Washing Allowance','Washing Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(7,'7.0','Driver Allowance','Driver Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(8,'08','Medical Allowance','Medical Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-26 04:49:19','',1,1),(9,'9.0','Children Education Allowance','Children Education Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(10,'10.0','PF','PF',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(12,'12.0','Income Tax','Income Tax',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(13,'13.0','Food Deduction','Food Deduction',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(14,'14.0','Other Deduction','Other Deduction',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(15,'15.0','Prof. Tax','Prof. Tax',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(16,'16.0','Society','Deposit',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(17,'17.0','Society Loan','Society',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(18,'18.0','Retaintion','Retaintion',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(19,'19.0','DA','Dearness Allowance',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(20,'20.0','Welfair','Welfair',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(21,'21.0','Mobile Deduction','Mobile Deduction',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL),(22,'22.0','Rembursement of Medical Allowence','Rembursement of Medical Allowence',NULL,0,NULL,'2017-04-20 07:00:41','2017-04-20 07:00:41',NULL,NULL,NULL);
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
INSERT INTO `schema_migrations` VALUES ('20150324102043'),('20150325090846'),('20150325091324'),('20150325100517'),('20150325100542'),('20150325101803'),('20150325102033'),('20150325104717'),('20150325111606'),('20150325111623'),('20150325134729'),('20150325134819'),('20150325134837'),('20150325134903'),('20150325134922'),('20150325134940'),('20150325135957'),('20150325140537'),('20150325144044'),('20150325150921'),('20150325150947'),('20150325174047'),('20150325174955'),('20150327052554'),('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060618'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151202085649'),('20151216125726'),('20151216152348'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160126095053'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145448'),('20160316052708'),('20160316094100'),('20160316141509'),('20160331045040'),('20160404140512'),('20160412090355'),('20160415070421'),('20160420061134'),('20160422090711'),('20160425125834'),('20160425130117'),('20160425130430'),('20160426051551'),('20160427065407'),('20160427070132'),('20160429092014'),('20160429101007'),('20160430085609'),('20160430102835'),('20160430121430'),('20160502065715'),('20160503130816'),('20160505114907'),('20160506111946'),('20160506132700'),('20160507041032'),('20160507091410'),('20160507093658'),('20160507125255'),('20160509053112'),('20160510063354'),('20160510100004'),('20160511051814'),('20160512064603'),('20160512104401'),('20160512121825'),('20160513054933'),('20160513111008'),('20160514043418'),('20160518120252'),('20160518131745'),('20160519044004'),('20160519052729'),('20160519093350'),('20160519095917'),('20160521090528'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102305'),('20160521125304'),('20160521125746'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523065040'),('20160523101534'),('20160523105510'),('20160523121643'),('20160524135053'),('20160524141810'),('20160524151419'),('20160524160726'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525092335'),('20160525093729'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525103235'),('20160525123930'),('20160525133638'),('20160525151304'),('20160526051433'),('20160526052421'),('20160526052958'),('20160527084359'),('20160527104217'),('20160527111646'),('20160527120440'),('20160527140816'),('20160527141004'),('20160527141144'),('20160527142915'),('20160528063330'),('20160528063928'),('20160601110412'),('20160603070019'),('20160603074402'),('20160604051919'),('20160604051920'),('20160611123423'),('20160611124310'),('20160611124312'),('20160611124313'),('20160611124314'),('20160611133245'),('20160613092931'),('20160614072206'),('20160615092744'),('20160616065812'),('20160616070304'),('20160616095752'),('20160616124121'),('20160616133220'),('20160617092902'),('20160617104631'),('20160618095321'),('20160620054519'),('20160620055118'),('20160620064939'),('20160620072911'),('20160620104935'),('20160620121046'),('20160622093650'),('20160622130051'),('20160622131114'),('20160623041219'),('20160623041859'),('20160623052807'),('20160623070518'),('20160623071253'),('20160623080812'),('20160623081113'),('20160623112832'),('20160623134245'),('20160625182131'),('20160627072219'),('20160627073417'),('20160627110446'),('20160629063100'),('20160629065100'),('20160630094223'),('20160701085057'),('20160701114346'),('20160701134431'),('20160702054606'),('20160702063829'),('20160702070306'),('20160702095708'),('20160702120512'),('20160704101850'),('20160705193212'),('20160705194038'),('20160705195945'),('20160705235546'),('20160708094655'),('20160708113856'),('20160709092245'),('20160709092553'),('20160709092554'),('20160713065422'),('20160713103049'),('20160713120654'),('20160714101056'),('20160714110530'),('20160714111459'),('20160714111509'),('20160714150355'),('20160714151407'),('20160714152316'),('20160714152715'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715040433'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718052304'),('20160718060157'),('20160718060643'),('20160718064620'),('20160718065930'),('20160719060335'),('20160719061924'),('20160719091404'),('20160720064045'),('20160720130301'),('20160721085732'),('20160721102648'),('20160723062632'),('20160723080129'),('20160723105713'),('20160726055056'),('20160728072434'),('20160729053928'),('20160729065257'),('20160730091204'),('20160730094606'),('20160801111028'),('20160802071320'),('20160802100120'),('20160804113523'),('20160805110143'),('20160805121851'),('20160816125736'),('20160817071523'),('20160819054051'),('20160825065859'),('20160827064407'),('20160827065404'),('20160829042937'),('20160829070847'),('20160829104436'),('20160829120956'),('20160830111216'),('20160902105729'),('20160903102739'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160907102455'),('20160908061653'),('20160908093902'),('20160912055114'),('20160913043824'),('20160919045818'),('20160926060633'),('20160926063141'),('20160927120109'),('20161004100505'),('20161004100722'),('20161004130453'),('20161007125531'),('20161013052635'),('20161014073847'),('20161014124546'),('20161018113305'),('20161019065322'),('20161019103720'),('20161104093342'),('20161105060406'),('20161107100328'),('20161107135922'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161114115826'),('20161114125046'),('20161119073523'),('20161119073618'),('20161119073700'),('20161121132745'),('20161122113351'),('20161122114309'),('20161122114648'),('20161123105419'),('20161123105420'),('20161123105421'),('20161124060652'),('20161124071935'),('20161124091647'),('20161124091725'),('20161124112153'),('20161124112721'),('20161125104852'),('20161126103908'),('20161128060507'),('20161128111741'),('20161129124940'),('20161129125213'),('20161203040527'),('20161212104430'),('20161215074308'),('20161216062450'),('20161216112032'),('20161220121946'),('20161220124243'),('20161221070931'),('20161221115255'),('20161231091546'),('20161231115416'),('20170102083022'),('20170102084600'),('20170102091214'),('20170102092744'),('20170107064553'),('20170109044054'),('20170109125507'),('20170110045655'),('20170112050137'),('20170116051750'),('20170117094339'),('20170118034909'),('20170118040257'),('20170118070135'),('20170125122032'),('20170127063657'),('20170131111613'),('20170203131348'),('20170203141934'),('20170204035132'),('20170207105642'),('20170208060007'),('20170208124431'),('20170209052940'),('20170209064013'),('20170209103531'),('20170210072013'),('20170213063011'),('20170214120418'),('20170215060325'),('20170215062521'),('20170216040223'),('20170216053607'),('20170217092904'),('20170218051520'),('20170218053643'),('20170222091948'),('20170223053723'),('20170223053807'),('20170223070956'),('20170224043312'),('20170224044647'),('20170224062827'),('20170224091456'),('20170227050116'),('20170227050304'),('20170301093409'),('20170302113203'),('20170303040100'),('20170304054259'),('20170304114424'),('20170306045721'),('20170306084847'),('20170306095314'),('20170309062116'),('20170310122831'),('20170310123007'),('20170317054641'),('20170317070345'),('20170318044750'),('20170320060327'),('20170320062722'),('20170320065646'),('20170321050344'),('20170321071817'),('20170321084647'),('20170327102041'),('20170404093007'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170412064643'),('20170413063000'),('20170413072802');
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
-- Table structure for table `texable_monthly_deductions`
--

DROP TABLE IF EXISTS `texable_monthly_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texable_monthly_deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salayslip_id` int(11) DEFAULT NULL,
  `texable_deducted_amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_texable_monthly_deductions_on_employee_id` (`employee_id`),
  KEY `index_texable_monthly_deductions_on_salayslip_id` (`salayslip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `training_request_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_plan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trainee_requests_on_training_request_id` (`training_request_id`),
  KEY `index_trainee_requests_on_employee_id` (`employee_id`),
  KEY `index_trainee_requests_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_trainee_requests_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_66e80626aa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_aec79e9d4b` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_bb8b581ef0` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`),
  CONSTRAINT `fk_rails_d280fd45dc` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `training_request_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `traininig_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_employee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_approvals_on_training_request_id` (`training_request_id`),
  KEY `index_training_approvals_on_employee_id` (`employee_id`),
  KEY `index_training_approvals_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_training_approvals_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_3a02a469e8` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_7d0c8c3052` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`),
  CONSTRAINT `fk_rails_b4d09339d3` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
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
  `training_topic_master_id` int(11) DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `trainer_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_trainer` text COLLATE utf8_unicode_ci,
  `trainer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_plans_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_training_plans_on_training_request_id` (`training_request_id`),
  KEY `index_training_plans_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_722231f687` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_a90174f6bf` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_cbe0a9898c` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`)
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `no_of_employee` int(11) DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_training_requests_on_employee_id` (`employee_id`),
  KEY `index_training_requests_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_training_requests_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_5443c76cb5` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_9550c2af99` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_transfer_histories_on_employee_transfer_id` (`employee_transfer_id`),
  KEY `index_transfer_histories_on_employee_id` (`employee_id`),
  KEY `index_transfer_histories_on_reporting_master_id` (`reporting_master_id`),
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
  CONSTRAINT `fk_rails_54886f5039` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
  `travel_request_id` int(11) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `traveling_date` date DEFAULT NULL,
  `tour_purpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_advance` decimal(10,0) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `daily_bill_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_request_histories_on_travel_request_id` (`travel_request_id`),
  KEY `index_travel_request_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_travel_request_histories_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_request_histories_on_travel_mode_id` (`travel_mode_id`),
  KEY `index_travel_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_2f199330b2` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_b07d84a89f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
  CONSTRAINT `fk_rails_bd36e7cbd9` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_c0ebfca129` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_df8915e1a4` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `daily_bill_status` text COLLATE utf8_unicode_ci,
  `expense` decimal(10,0) DEFAULT NULL,
  `to` date DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_requests_on_employee_id` (`employee_id`),
  KEY `index_travel_requests_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_travel_requests_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_requests_on_travel_mode_id` (`travel_mode_id`),
  CONSTRAINT `fk_rails_50acc33858` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_5b96fe9977` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_985cfe5831` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_cb56ddb570` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `degree_1_id` int(11) DEFAULT NULL,
  `degree_2_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_degree_1_id` (`degree_1_id`),
  KEY `index_vacancy_masters_on_degree_2_id` (`degree_2_id`),
  KEY `index_vacancy_masters_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_bed3a0c8e2` FOREIGN KEY (`degree_2_id`) REFERENCES `degree_2s` (`id`),
  CONSTRAINT `fk_rails_c007c5e793` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_d3ad0c0ad4` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_df58fcff1a` FOREIGN KEY (`degree_1_id`) REFERENCES `degree_1s` (`id`),
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
  `degree_1_id` int(11) DEFAULT NULL,
  `degree_2_id` int(11) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `index_vacancy_request_histories_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_vacancy_request_histories_on_department_id` (`department_id`),
  KEY `index_vacancy_request_histories_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_request_histories_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_request_histories_on_degree_id` (`degree_id`),
  KEY `index_vacancy_request_histories_on_degree_1_id` (`degree_1_id`),
  KEY `index_vacancy_request_histories_on_degree_2_id` (`degree_2_id`),
  KEY `index_vacancy_request_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_a3ee9c0997` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_0990a86378` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2007d583f0` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
  CONSTRAINT `fk_rails_690afaafaf` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`),
  CONSTRAINT `fk_rails_7d68d4addb` FOREIGN KEY (`degree_2_id`) REFERENCES `degree_2s` (`id`),
  CONSTRAINT `fk_rails_85193e42c6` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_9d011e0876` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_9e78a9dc64` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_9f4cb503bc` FOREIGN KEY (`degree_1_id`) REFERENCES `degree_1s` (`id`)
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
  `gatepass` decimal(10,0) DEFAULT NULL,
  `calculated_payable_days` decimal(10,0) DEFAULT NULL,
  `ot_hours` decimal(10,0) DEFAULT NULL,
  `od_leave` decimal(10,0) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `full_and_final` tinyint(1) DEFAULT NULL,
  `od_day` decimal(10,0) DEFAULT NULL,
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

-- Dump completed on 2017-04-28  9:39:25
