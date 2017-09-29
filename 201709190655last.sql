-- MySQL dump 10.13  Distrib 5.5.56, for Win64 (AMD64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.5.56-log

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
  `root_cause_master_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `advance_type_id` int(11) DEFAULT NULL,
  `interest` decimal(15,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_advance_salaries_on_employee_id` (`employee_id`),
  KEY `index_advance_salaries_on_advance_type_id` (`advance_type_id`),
  CONSTRAINT `fk_rails_09b162b4e8` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_types` (`id`),
  CONSTRAINT `fk_rails_d19a28b780` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  `attribute_weightage` tinyint(1) DEFAULT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Kotak Bank Ltd','Bank_1001','',NULL,'2017-09-19 13:12:35','2017-09-19 13:12:35'),(2,'Axis Bank Ltd','Bank_1002','',NULL,'2017-09-19 13:12:57','2017-09-19 13:12:57'),(3,'Vijaya Bank','Bank_1003','',NULL,'2017-09-19 13:13:47','2017-09-19 13:13:47'),(4,'HDFC Bank','Bank_1004','',NULL,'2017-09-19 13:15:12','2017-09-19 13:15:12'),(5,'ICICI Bank','Bank_1005','',NULL,'2017-09-19 13:15:52','2017-09-19 13:15:52'),(6,'State Bank of India','Bank_1006	','',NULL,'2017-09-19 13:16:11','2017-09-19 13:16:11'),(7,'Saraswat Bank','Bank_1007','',NULL,'2017-09-19 13:17:31','2017-09-19 13:17:31'),(8,'Canara Bank','Bank_1008','',NULL,'2017-09-19 13:18:13','2017-09-19 13:18:13'),(9,'NA','Bank_1009','',NULL,'2017-09-19 13:19:04','2017-09-19 13:19:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'AB+',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'B+',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'O+',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'A-',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,'B-',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,'O-',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(8,'AB-',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(9,'NA',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
  `actual_amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
-- Table structure for table `candidate_forms`
--

DROP TABLE IF EXISTS `candidate_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_request_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `skill_set` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_by_id` int(11) DEFAULT NULL,
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
  KEY `index_candidate_forms_on_vacancy_request_id` (`vacancy_request_id`),
  KEY `index_candidate_forms_on_qualification_id` (`qualification_id`),
  KEY `index_candidate_forms_on_degree_id` (`degree_id`),
  CONSTRAINT `fk_rails_555f323d78` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_62210d6830` FOREIGN KEY (`qualification_id`) REFERENCES `qualifications` (`id`),
  CONSTRAINT `fk_rails_6af1766f5d` FOREIGN KEY (`vacancy_request_id`) REFERENCES `vacancy_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_forms`
--

LOCK TABLES `candidate_forms` WRITE;
/*!40000 ALTER TABLE `candidate_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_interview_schedules`
--

DROP TABLE IF EXISTS `candidate_interview_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_interview_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_form_id` int(11) DEFAULT NULL,
  `interviewer_id` int(11) DEFAULT NULL,
  `interview_type_master_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_candidate_interview_schedules_on_candidate_form_id` (`candidate_form_id`),
  KEY `index_candidate_interview_schedules_on_interview_type_master_id` (`interview_type_master_id`),
  CONSTRAINT `fk_rails_0531664a1c` FOREIGN KEY (`interview_type_master_id`) REFERENCES `interview_type_masters` (`id`),
  CONSTRAINT `fk_rails_ad6faf2cb7` FOREIGN KEY (`candidate_form_id`) REFERENCES `candidate_forms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_interview_schedules`
--

LOCK TABLES `candidate_interview_schedules` WRITE;
/*!40000 ALTER TABLE `candidate_interview_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_interview_schedules` ENABLE KEYS */;
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
  `employee_designation_id` int(11) DEFAULT NULL,
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
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_master_id` int(11) DEFAULT NULL,
  `degree_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_capture_resumes_on_country_id` (`country_id`),
  KEY `index_capture_resumes_on_state_id` (`state_id`),
  KEY `index_capture_resumes_on_district_id` (`district_id`),
  KEY `index_capture_resumes_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_capture_resumes_on_vacancy_master_id` (`vacancy_master_id`),
  KEY `index_capture_resumes_on_degree_id` (`degree_id`),
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
-- Table structure for table `change_designations`
--

DROP TABLE IF EXISTS `change_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `change_by_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_change_designations_on_employee_id` (`employee_id`),
  KEY `index_change_designations_on_employee_designation_id` (`employee_designation_id`),
  CONSTRAINT `fk_rails_39290de730` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_b1e6122c28` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_designations`
--

LOCK TABLES `change_designations` WRITE;
/*!40000 ALTER TABLE `change_designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_designations` ENABLE KEYS */;
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
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,NULL,'CC_1001','COM001','SG Analytics Private Limited','SG Analytics India',1,'U74140MH2007PTC169396','AAKCS7498H','','','\"SG Analytics Pvt Ltd 602, 6th Floor, Wing 2, Cluster C EON Free Zone, Kharadi\"',1,15,83,'Pune',411014,'','+912067307200','www.sganalytics.com',NULL,'2017-09-19 04:18:49','2017-09-19 04:18:49','SGA_New_Logo.png','image/png',52342,'2017-09-19 04:18:49'),(2,NULL,'CC_1002','COM002','SG Analytics Inc.','SG Analytics USA',4,'ABCDEF0000000111111111','','','','1350, 2nd Floor, Avenue of the Americas',2,31,132,'New York',10019,'','+18446224488','www.sganalytics.com',NULL,'2017-09-19 08:29:34','2017-09-19 08:29:34','SGA_New_Logo.png','image/png',52342,'2017-09-19 08:29:34');
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
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
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
INSERT INTO `company_locations` VALUES (1,1,'CL_1001','COMLOC001','Pune','hrms@sganalytics.com','SG Analytics Pvt Ltd 602, 6th Floor, Wing 2, Cluster C EON Free Zone, Kharadi.','Pune',1,15,83,411014,'+912067307200','2017-09-19 04:20:41','2017-09-19 08:36:18'),(2,1,'CL_1002','COMLOC002','Hyderabad','hrms@sganalytics.com','401, 4th Floor, Shangrila Plaza, Road No. 2, Banjara Hills','Hyderabad',1,27,109,500033,'','2017-09-19 04:22:27','2017-09-19 08:36:39'),(3,2,'CL_1003','COMLOC003','New York','hrms@sganalytics.com','1350, 2nd Floor, Avenue of the Americas','New Yark',2,31,132,10019,'+18446224488','2017-09-19 08:31:46','2017-09-19 08:31:46');
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
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `policy_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_policies_on_policy_type_id` (`policy_type_id`),
  CONSTRAINT `fk_rails_d3230c8d05` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_types` (`id`)
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
  `in_max_time` datetime DEFAULT NULL,
  `out_min_time` datetime DEFAULT NULL,
  `out_max_time` datetime DEFAULT NULL,
  `working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `in_min_time` datetime DEFAULT NULL,
  `rest_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shift_master_id` int(11) DEFAULT NULL,
  `time_adjust` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'CT_1001','Private Limited ','Private Limited ',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'CT_1002','Limited Liability Partnership','Limited Liability Partnership',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'CT_1003','Public Limited','Public Limited',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'CT_1004','Incorporation','Incorporation',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
INSERT INTO `cost_centers` VALUES (1,NULL,'POOL',NULL,NULL,'2017-09-19 05:29:05','2017-09-19 05:29:05'),(2,NULL,'RES',NULL,NULL,'2017-09-19 05:29:13','2017-09-19 05:29:13'),(3,NULL,'PR',NULL,NULL,'2017-09-19 05:29:20','2017-09-19 05:29:20'),(4,NULL,'AT',NULL,NULL,'2017-09-19 05:29:27','2017-09-19 05:29:27'),(5,NULL,'COPR',NULL,NULL,'2017-09-19 05:29:35','2017-09-19 05:29:35'),(6,NULL,'SBD',NULL,NULL,'2017-09-19 05:29:42','2017-09-19 05:29:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'IN','India','2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'USA','United States of America','2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'GER','Germany','2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'OMAN','Oman','2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'CH','Switzerland','2017-09-19 04:12:12','2017-09-19 04:12:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_auto_increments`
--

LOCK TABLES `custom_auto_increments` WRITE;
/*!40000 ALTER TABLE `custom_auto_increments` DISABLE KEYS */;
INSERT INTO `custom_auto_increments` VALUES (1,'company',2,'2017-09-19 04:18:49','2017-09-19 08:29:34'),(2,'company_location',3,'2017-09-19 04:20:41','2017-09-19 08:31:46'),(3,'employee',451,'2017-09-19 05:21:02','2017-09-19 05:21:08');
/*!40000 ALTER TABLE `custom_auto_increments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_attendances`
--

DROP TABLE IF EXISTS `daily_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_attendances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reader_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_attendances`
--

LOCK TABLES `daily_attendances` WRITE;
/*!40000 ALTER TABLE `daily_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_attendances` ENABLE KEYS */;
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
  `travel_expence_type_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `request_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_master_id` int(11) DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `remarks` text COLLATE utf8_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `avatar_file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_file_size` int(11) DEFAULT NULL,
  `avatar_file_updated_at` datetime DEFAULT NULL,
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
INSERT INTO `degree_streams` VALUES (1,'QS_1001','Aerospace','Aerospace',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'QS_1002','Archaeology','Archaeology',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'QS_1003','Asian language and culture','Asian language and culture',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'QS_1004','Automotive ','Automotive ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'QS_1005','Chemical','Chemical',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,'QS_1006','Civil','Civil',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,'QS_1007','Commerce','Commerce',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(8,'QS_1008','Computer Application','Computer Application',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(9,'QS_1009','Computer Architecture','Computer Architecture',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(10,'QS_1010','Computer Science','Computer Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(11,'QS_1011','Creative Writing','Creative Writing',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(12,'QS_1012','Electrical','Electrical',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(13,'QS_1013','Electrical & Electronics','Electrical & Electronics',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(14,'QS_1014','Human Resource','Human Resource',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(15,'QS_1015','Information Technology  ','Information Technology  ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(16,'QS_1016','Marine','Marine',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(17,'QS_1017','Mathematics','Mathematics',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(18,'QS_1018','Mechanical','Mechanical',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(19,'QS_1019','Philosophy','Philosophy',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(20,'QS_1020','Psychology','Psychology',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(21,'QS_1021','Robotics','Robotics',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(22,'QS_1022','Safety','Safety',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(23,'QS_1023','Science','Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(24,'QS_1024','Textile','Textile',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(25,'QS_1025','Theater: Design & Production','Theater: Design & Production',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_types`
--

LOCK TABLES `degree_types` WRITE;
/*!40000 ALTER TABLE `degree_types` DISABLE KEYS */;
INSERT INTO `degree_types` VALUES (1,'QL_1001','High School ','Between 10th Grade and 12th Grade',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'QL_1002','Senior Secondary','12th Grade passed',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'QL_1003','Diploma','Diploma programme',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'QL_1004','Under Graduate','Pursuing graduation',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'QL_1005','Graduate','Graduated',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,'QL_1006','Under Post Graduate','Pursuing post graduation',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,'QL_1007','Post Graduate','Graduated',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
INSERT INTO `degrees` VALUES (1,'QUALIFICTATION_1001','BCA ','Bachelor of Computer Application',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'QUALIFICTATION_1002','BBA','Bachelor of Business Administration',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'QUALIFICTATION_1003','B.Com ','Bachelor of Commerce   ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'QUALIFICTATION_1004',' B.Sc. ','Bachelor of Science ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'QUALIFICTATION_1005','BA','Bachelor  of Arts  ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,'QUALIFICTATION_1006','BE','Bachelor of Engineering   ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,'QUALIFICTATION_1007','B.Tech','Bachelor of Technology',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(8,'QUALIFICTATION_1008','DCA','Diploma in Computer Application',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(9,'QUALIFICTATION_1009','ITI','Industrial Training Institute',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(10,'QUALIFICTATION_1010','BSW','Bachelor  of Social Work',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(11,'QUALIFICTATION_1011','Polytechnic','Polytechnic',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(12,'QUALIFICTATION_1012','LL.B','Bachelor of Laws',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(13,'QUALIFICTATION_1013','BCM','Bachelor of computer management',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(14,'QUALIFICTATION_1014','BFA','Bachelor  of Fine Arts ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(15,'QUALIFICTATION_1015','BMS','Bachelor  of Management Study',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(16,'QUALIFICTATION_1016','BCS','Bachelor  of Computer Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(17,'QUALIFICTATION_1017','BBM','Bachelor  of Business Management',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(18,'QUALIFICTATION_1018','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(19,'QUALIFICTATION_1019','BHM','Bachelor  of Hotel Management',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(20,'QUALIFICTATION_1020','B.Pharma','Bachelor of Pharmacy',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(21,'QUALIFICTATION_1021','BS','Bachelor of Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(22,'QUALIFICTATION_1022','CS','Company Secretary',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(23,'QUALIFICTATION_1023','CA','Chartered Accountant',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(24,'QUALIFICTATION_1024','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(25,'QUALIFICTATION_1025','MCA','Master of Computer Application',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(26,'QUALIFICTATION_1026','MBA','Master of Business Administration',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(27,'QUALIFICTATION_1027','M.Com','Master of Commerce',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(28,'QUALIFICTATION_1028','M.Sc.','Master of Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(29,'QUALIFICTATION_1029','MA','Master of Arts',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(30,'QUALIFICTATION_1030','ME','Master of Engineering',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(31,'QUALIFICTATION_1031','M.Tech','Master of Technology ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(32,'QUALIFICTATION_1032','PGDCA','Post Graduate Diploma in Computer Application',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(33,'QUALIFICTATION_1033','MSW','Master of Social Work ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(34,'QUALIFICTATION_1034','LL.M ','Master of Laws',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(35,'QUALIFICTATION_1035','MCM','Master of Computer Management',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(36,'QUALIFICTATION_1036','MFA','Master of Fine Arts ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(37,'QUALIFICTATION_1037','MMS','Master of Management Studies',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(38,'QUALIFICTATION_1038','MCS','Master of Computer Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(39,'QUALIFICTATION_1039','MBM','Master in Business Management',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(40,'QUALIFICTATION_1040','MJMC','Master of Journalism and Mass Communication',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(41,'QUALIFICTATION_1041','MHM','Master in Hotel Management ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(42,'QUALIFICTATION_1042','M.Pharma','Master of Pharmacy',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(43,'QUALIFICTATION_1043','MS','Master of Science',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(44,'QUALIFICTATION_1044','MD','Medicine Doctor ',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
INSERT INTO `department_types` VALUES (1,'DT_1001','Executive','Executive Department',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'DT_1002','Operations','Operations Department',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'DT_1003','Corporate','Corporate Department',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11');
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_company_location_id` (`company_location_id`),
  KEY `index_departments_on_department_type_id` (`department_type_id`),
  CONSTRAINT `fk_rails_076d214b06` FOREIGN KEY (`department_type_id`) REFERENCES `department_types` (`id`),
  CONSTRAINT `fk_rails_561a2a353c` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,NULL,'D_1001','Equity Research','ER',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(2,1,NULL,'D_1002','Quantitative Research','QR',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(3,1,NULL,'D_1003','Fixed Income','FI',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(4,1,NULL,'D_1004','Investment Banking','IB',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(5,1,NULL,'D_1005','Business Research and Consulting','BRC',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(6,1,NULL,'D_1006','Environment Social Governance','ESG',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(7,1,NULL,'D_1007','FDAA','FDAA',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(8,1,NULL,'D_1008','Dedicated','DED',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(9,1,NULL,'D_1009','General','GEN',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(10,1,NULL,'D_1010','PR 1','PR1',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(11,1,NULL,'D_1011','PR 2','PR2',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(12,1,NULL,'D_1012','Pharma and Life Sciences','PLS',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(13,1,NULL,'D_1013','Dedicated','DED',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(14,1,NULL,'D_1014','General','GEN',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(15,1,NULL,'D_1015','Social Media','SM',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(16,1,NULL,'D_1016','Technology','TECH',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(17,1,NULL,'D_1017','General','GEN',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(18,1,NULL,'D_1018','Admin','ADMIN',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(19,1,NULL,'D_1019','Human Resources','HR',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(20,1,NULL,'D_1020','Information Technology','IT',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(21,1,NULL,'D_1021','Operations Efficiency','OE',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(22,1,NULL,'D_1022','Finance','FIN',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(23,1,NULL,'D_1023','Designing & Editorial','DEE',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(24,1,NULL,'D_1024','Management','MGMT',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(25,1,NULL,'D_1025','General','GEN',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(26,1,NULL,'D_1026','Pre-sales','PS',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(27,1,NULL,'D_1027','Business Development','BD',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(28,2,NULL,'D_1028','Dedicated','DED1',2,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(29,2,NULL,'D_1029','Information Technology','IT1',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(30,2,NULL,'D_1030','Admin','ADMIN1',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(31,2,NULL,'D_1031','Human Resources','HR1',3,NULL,NULL,'2017-09-19 04:55:52','2017-09-19 04:55:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'East Godavari ','2017-09-19 04:12:13','2017-09-19 04:12:13'),(2,1,NULL,'Guntur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(3,1,NULL,'Krishna','2017-09-19 04:12:13','2017-09-19 04:12:13'),(4,1,NULL,'Rajahmundry ','2017-09-19 04:12:13','2017-09-19 04:12:13'),(5,1,NULL,'Srikakulam','2017-09-19 04:12:13','2017-09-19 04:12:13'),(6,1,NULL,'Vijayawada','2017-09-19 04:12:13','2017-09-19 04:12:13'),(7,1,NULL,'Visakhapatnam','2017-09-19 04:12:13','2017-09-19 04:12:13'),(8,1,NULL,'Vizianagaram','2017-09-19 04:12:13','2017-09-19 04:12:13'),(9,1,NULL,'West Godavari','2017-09-19 04:12:13','2017-09-19 04:12:13'),(10,2,NULL,'Kamrup Metropolitan','2017-09-19 04:12:13','2017-09-19 04:12:13'),(11,2,NULL,'Nagaon','2017-09-19 04:12:13','2017-09-19 04:12:13'),(12,3,NULL,'Muzaffarpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(13,3,NULL,'Patna','2017-09-19 04:12:13','2017-09-19 04:12:13'),(14,3,NULL,'Supaul','2017-09-19 04:12:13','2017-09-19 04:12:13'),(15,4,NULL,'Korba','2017-09-19 04:12:13','2017-09-19 04:12:13'),(16,4,NULL,'Raipur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(17,5,NULL,'Delhi','2017-09-19 04:12:13','2017-09-19 04:12:13'),(18,5,NULL,'Delhi NCR','2017-09-19 04:12:13','2017-09-19 04:12:13'),(19,6,NULL,'Goa','2017-09-19 04:12:13','2017-09-19 04:12:13'),(20,7,NULL,'Ahmedabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(21,7,NULL,'Gir Somnath','2017-09-19 04:12:13','2017-09-19 04:12:13'),(22,7,NULL,'Surat','2017-09-19 04:12:13','2017-09-19 04:12:13'),(23,7,NULL,'Vadodara','2017-09-19 04:12:13','2017-09-19 04:12:13'),(24,8,NULL,'Faridabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(25,8,NULL,'Gurgaon','2017-09-19 04:12:13','2017-09-19 04:12:13'),(26,8,NULL,'Kaithal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(27,8,NULL,'Karnal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(28,9,NULL,'Bhoranj','2017-09-19 04:12:13','2017-09-19 04:12:13'),(29,9,NULL,'Shimla','2017-09-19 04:12:13','2017-09-19 04:12:13'),(30,9,NULL,'Una','2017-09-19 04:12:13','2017-09-19 04:12:13'),(31,10,NULL,'Baramulla','2017-09-19 04:12:13','2017-09-19 04:12:13'),(32,10,NULL,'Jammu','2017-09-19 04:12:13','2017-09-19 04:12:13'),(33,11,NULL,'Bokaro','2017-09-19 04:12:13','2017-09-19 04:12:13'),(34,11,NULL,'Dhanbad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(35,11,NULL,'Hazaribag','2017-09-19 04:12:13','2017-09-19 04:12:13'),(36,11,NULL,'Jamshedpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(37,11,NULL,'Ranchi','2017-09-19 04:12:13','2017-09-19 04:12:13'),(38,11,NULL,'Sahibgunj','2017-09-19 04:12:13','2017-09-19 04:12:13'),(39,11,NULL,'Saraikela Kharsawan','2017-09-19 04:12:13','2017-09-19 04:12:13'),(40,12,NULL,'Belgaum','2017-09-19 04:12:13','2017-09-19 04:12:13'),(41,12,NULL,'Bellary','2017-09-19 04:12:13','2017-09-19 04:12:13'),(42,12,NULL,'Bengaluru','2017-09-19 04:12:13','2017-09-19 04:12:13'),(43,12,NULL,'Chitradurga','2017-09-19 04:12:13','2017-09-19 04:12:13'),(44,12,NULL,'Davangere','2017-09-19 04:12:13','2017-09-19 04:12:13'),(45,12,NULL,'Marinakatti Post','2017-09-19 04:12:13','2017-09-19 04:12:13'),(46,12,NULL,'Shivamogga','2017-09-19 04:12:13','2017-09-19 04:12:13'),(47,13,NULL,'Alappuzha','2017-09-19 04:12:13','2017-09-19 04:12:13'),(48,13,NULL,'Kannur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(49,13,NULL,'Pathanamthitta','2017-09-19 04:12:13','2017-09-19 04:12:13'),(50,14,NULL,'Betul','2017-09-19 04:12:13','2017-09-19 04:12:13'),(51,14,NULL,'Bhopal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(52,14,NULL,'Burhanpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(53,14,NULL,'Chhindwara','2017-09-19 04:12:13','2017-09-19 04:12:13'),(54,14,NULL,'Damoh','2017-09-19 04:12:13','2017-09-19 04:12:13'),(55,14,NULL,'Gwalior','2017-09-19 04:12:13','2017-09-19 04:12:13'),(56,14,NULL,'Hoshangabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(57,14,NULL,'Indore','2017-09-19 04:12:13','2017-09-19 04:12:13'),(58,14,NULL,'Jabalpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(59,14,NULL,'Mandsaur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(60,14,NULL,'Panna','2017-09-19 04:12:13','2017-09-19 04:12:13'),(61,14,NULL,'Sagar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(62,14,NULL,'Shajapur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(63,14,NULL,'Shivpuri','2017-09-19 04:12:13','2017-09-19 04:12:13'),(64,14,NULL,'Ujjain','2017-09-19 04:12:13','2017-09-19 04:12:13'),(65,15,NULL,'Ahmednagar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(66,15,NULL,'Akola','2017-09-19 04:12:13','2017-09-19 04:12:13'),(67,15,NULL,'Amravati','2017-09-19 04:12:13','2017-09-19 04:12:13'),(68,15,NULL,'Aurangabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(69,15,NULL,'Beed','2017-09-19 04:12:13','2017-09-19 04:12:13'),(70,15,NULL,'Buldana','2017-09-19 04:12:13','2017-09-19 04:12:13'),(71,15,NULL,'Chandrapur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(72,15,NULL,'Dhule','2017-09-19 04:12:13','2017-09-19 04:12:13'),(73,15,NULL,'Jalgaon','2017-09-19 04:12:13','2017-09-19 04:12:13'),(74,15,NULL,'Jalna','2017-09-19 04:12:13','2017-09-19 04:12:13'),(75,15,NULL,'Kolhapur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(76,15,NULL,'Latur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(77,15,NULL,'Mumbai','2017-09-19 04:12:13','2017-09-19 04:12:13'),(78,15,NULL,'Nagpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(79,15,NULL,'Nanded','2017-09-19 04:12:13','2017-09-19 04:12:13'),(80,15,NULL,'Nashik','2017-09-19 04:12:13','2017-09-19 04:12:13'),(81,15,NULL,'Navi Mumbai','2017-09-19 04:12:13','2017-09-19 04:12:13'),(82,15,NULL,'Parbhani','2017-09-19 04:12:13','2017-09-19 04:12:13'),(83,15,NULL,'Pune','2017-09-19 04:12:13','2017-09-19 04:12:13'),(84,15,NULL,'Raigadh','2017-09-19 04:12:13','2017-09-19 04:12:13'),(85,15,NULL,'Ratnagiri','2017-09-19 04:12:13','2017-09-19 04:12:13'),(86,15,NULL,'Sangli','2017-09-19 04:12:13','2017-09-19 04:12:13'),(87,15,NULL,'Sindhudurg','2017-09-19 04:12:13','2017-09-19 04:12:13'),(88,15,NULL,'Solapur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(89,15,NULL,'Thane','2017-09-19 04:12:13','2017-09-19 04:12:13'),(90,15,NULL,'Washim','2017-09-19 04:12:13','2017-09-19 04:12:13'),(91,15,NULL,'Yavatmal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(92,16,NULL,'Shillong','2017-09-19 04:12:13','2017-09-19 04:12:13'),(93,21,NULL,'Kathmandu','2017-09-19 04:12:13','2017-09-19 04:12:13'),(94,22,NULL,'New Delhi','2017-09-19 04:12:13','2017-09-19 04:12:13'),(95,24,NULL,'Bhubaneshwar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(96,24,NULL,'Cuttack','2017-09-19 04:12:13','2017-09-19 04:12:13'),(97,24,NULL,'Khurda','2017-09-19 04:12:13','2017-09-19 04:12:13'),(98,24,NULL,'Mayurbhanj','2017-09-19 04:12:13','2017-09-19 04:12:13'),(99,24,NULL,'Nabarangapur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(100,24,NULL,'Sundergarh','2017-09-19 04:12:13','2017-09-19 04:12:13'),(101,25,NULL,'Amritsar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(102,25,NULL,'Ludhiana','2017-09-19 04:12:13','2017-09-19 04:12:13'),(103,25,NULL,'Mohali','2017-09-19 04:12:13','2017-09-19 04:12:13'),(104,25,NULL,'Muktsar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(105,26,NULL,'Ajmer','2017-09-19 04:12:13','2017-09-19 04:12:13'),(106,26,NULL,'Bhilwara','2017-09-19 04:12:13','2017-09-19 04:12:13'),(107,26,NULL,'Dausa','2017-09-19 04:12:13','2017-09-19 04:12:13'),(108,26,NULL,'Jaipur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(109,27,NULL,'Hyderabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(110,27,NULL,'Karimnagar ','2017-09-19 04:12:13','2017-09-19 04:12:13'),(111,27,NULL,'Mahaboobnagar ','2017-09-19 04:12:13','2017-09-19 04:12:13'),(112,27,NULL,'Nacharam','2017-09-19 04:12:13','2017-09-19 04:12:13'),(113,27,NULL,'Prakasam','2017-09-19 04:12:13','2017-09-19 04:12:13'),(114,27,NULL,'Rangareddy ','2017-09-19 04:12:13','2017-09-19 04:12:13'),(115,27,NULL,'Warangal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(116,28,NULL,'Agra','2017-09-19 04:12:13','2017-09-19 04:12:13'),(117,28,NULL,'Allahabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(118,28,NULL,'Gautam Budh Nagar','2017-09-19 04:12:13','2017-09-19 04:12:13'),(119,28,NULL,'Ghaziabad','2017-09-19 04:12:13','2017-09-19 04:12:13'),(120,28,NULL,'Gorakhpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(121,28,NULL,'Kanpur','2017-09-19 04:12:13','2017-09-19 04:12:13'),(122,28,NULL,'Lucknow','2017-09-19 04:12:13','2017-09-19 04:12:13'),(123,28,NULL,'Mathura','2017-09-19 04:12:13','2017-09-19 04:12:13'),(124,28,NULL,'Meerut','2017-09-19 04:12:13','2017-09-19 04:12:13'),(125,28,NULL,'Varanasi','2017-09-19 04:12:13','2017-09-19 04:12:13'),(126,29,NULL,'Dehradun','2017-09-19 04:12:13','2017-09-19 04:12:13'),(127,29,NULL,'Nainital','2017-09-19 04:12:13','2017-09-19 04:12:13'),(128,30,NULL,'Birbhum','2017-09-19 04:12:13','2017-09-19 04:12:13'),(129,30,NULL,'Hooghly','2017-09-19 04:12:13','2017-09-19 04:12:13'),(130,30,NULL,'Jalpaiguri','2017-09-19 04:12:13','2017-09-19 04:12:13'),(131,30,NULL,'Kolkata','2017-09-19 04:12:13','2017-09-19 04:12:13'),(132,31,'','New York','2017-09-19 08:28:57','2017-09-19 08:28:57');
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
  `due_employee_detail_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `amount` decimal(10,0) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `due_template_id` int(11) DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_due_details_on_due_employee_template_id` (`due_employee_template_id`),
  KEY `index_due_details_on_due_template_id` (`due_template_id`),
  CONSTRAINT `fk_rails_e4cbdb3410` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`),
  CONSTRAINT `fk_rails_beeb90dcd2` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`)
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
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_due_employee_details_on_employee_id` (`employee_id`),
  KEY `index_due_employee_details_on_due_template_id` (`due_template_id`),
  KEY `index_due_employee_details_on_due_employee_template_id` (`due_employee_template_id`),
  KEY `index_due_employee_details_on_due_detail_id` (`due_detail_id`),
  CONSTRAINT `fk_rails_83dea4b3e1` FOREIGN KEY (`due_detail_id`) REFERENCES `due_details` (`id`),
  CONSTRAINT `fk_rails_7abe24328a` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
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
  `department_id` int(11) DEFAULT NULL,
  `count` decimal(5,2) DEFAULT NULL,
  `employee_leav_request_id` int(11) DEFAULT NULL,
  `on_duty_request_id` int(11) DEFAULT NULL,
  `company_time_master_id` int(11) DEFAULT NULL,
  `working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rest_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `difference_hrs` decimal(10,0) DEFAULT NULL,
  `overtime_hrs` decimal(10,0) DEFAULT NULL,
  `late_mark` decimal(10,0) DEFAULT NULL,
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_code` int(11) DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_week_off_id` int(11) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  KEY `index_employee_attendances_on_employee_week_off_id` (`employee_week_off_id`),
  KEY `index_employee_attendances_on_holiday_id` (`holiday_id`),
  CONSTRAINT `fk_rails_b05fcec060` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`),
  CONSTRAINT `fk_rails_4ba11eda7e` FOREIGN KEY (`employee_week_off_id`) REFERENCES `employee_week_offs` (`id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_cccb9f7b46` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`),
  CONSTRAINT `fk_rails_dd1af2be7a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_e1778f034d` FOREIGN KEY (`machine_attendance_id`) REFERENCES `machine_attendances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (1,1,'2017-10-02','H',NULL,NULL,NULL,0,24,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(2,2,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(3,3,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(4,4,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(5,5,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(6,6,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(7,7,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(8,8,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(9,9,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(10,10,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(11,11,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(12,12,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(13,13,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(14,14,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(15,15,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(16,16,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(17,17,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(18,18,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(19,19,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(20,20,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(21,21,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(22,22,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(23,23,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(24,24,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(25,25,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(26,26,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(27,27,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(28,28,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(29,29,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(30,30,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(31,31,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(32,32,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(33,33,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(34,34,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(35,35,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(36,36,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(37,37,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(38,38,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(39,39,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(40,40,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(41,41,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(42,42,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(43,43,'2017-10-02','H',NULL,NULL,NULL,0,26,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(44,44,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(45,45,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(46,46,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(47,47,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(48,48,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(49,49,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(50,50,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(51,51,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(52,52,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(53,53,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(54,54,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(55,55,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(56,56,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(57,57,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(58,58,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(59,59,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(60,60,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(61,61,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(62,62,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(63,63,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(64,64,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(65,65,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(66,66,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(67,67,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(68,68,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(69,69,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(70,70,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(71,71,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(72,72,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(73,73,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(74,74,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(75,75,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(76,76,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(77,77,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(78,78,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(79,79,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(80,80,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(81,81,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(82,82,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(83,83,'2017-10-02','H',NULL,NULL,NULL,0,26,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(84,84,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(85,85,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(86,86,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(87,87,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(88,88,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(89,89,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(90,90,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(91,91,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(92,92,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(93,93,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(94,94,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(95,95,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(96,96,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(97,97,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(98,98,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(99,99,'2017-10-02','H',NULL,NULL,NULL,0,24,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(100,100,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(101,101,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(102,102,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(103,103,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(104,104,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(105,105,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(106,106,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(107,107,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(108,108,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(109,109,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(110,110,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(111,111,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:52','2017-09-19 12:13:52',NULL,2),(112,112,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(113,113,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(114,114,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(115,115,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(116,116,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(117,117,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(118,118,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(119,119,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(120,120,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(121,121,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(122,122,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(123,123,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(124,124,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(125,125,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(126,126,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(127,127,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(128,128,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(129,129,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(130,130,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(131,131,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(132,132,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(133,133,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(134,134,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(135,135,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(136,136,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(137,137,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(138,138,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(139,139,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(140,140,'2017-10-02','H',NULL,NULL,NULL,0,24,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(141,141,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(142,142,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(143,143,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(144,144,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(145,145,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(146,146,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(147,147,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(148,148,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(149,149,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(150,150,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(151,151,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(152,152,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(153,153,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(154,154,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(155,155,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(156,156,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(157,157,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(158,158,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(159,159,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(160,160,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(161,161,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(162,162,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(163,163,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(164,164,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(165,165,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(166,166,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(167,167,'2017-10-02','H',NULL,NULL,NULL,0,21,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(168,168,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(169,169,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(170,170,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(171,171,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(172,172,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(173,173,'2017-10-02','H',NULL,NULL,NULL,0,26,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(174,174,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(175,175,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(176,176,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(177,177,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(178,178,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(179,179,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(180,180,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(181,181,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(182,182,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(183,183,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(184,184,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(185,185,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(186,186,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(187,187,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(188,188,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(189,189,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(190,190,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(191,191,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(192,192,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(193,193,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(194,194,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(195,195,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(196,196,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(197,197,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(198,198,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(199,199,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(200,200,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(201,201,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(202,202,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(203,203,'2017-10-02','H',NULL,NULL,NULL,0,26,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(204,204,'2017-10-02','H',NULL,NULL,NULL,0,21,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(205,205,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(206,206,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(207,207,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(208,208,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(209,209,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(210,210,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(211,211,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(212,212,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(213,213,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(214,214,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(215,215,'2017-10-02','H',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(216,216,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(217,217,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(218,218,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(219,219,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(220,220,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(221,221,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(222,222,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(223,223,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(224,224,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(225,225,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(226,226,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(227,227,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(228,228,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(229,229,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(230,230,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(231,231,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(232,232,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(233,233,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(234,234,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(235,235,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(236,236,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(237,237,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(238,238,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(239,239,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(240,240,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(241,241,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(242,242,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(243,243,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(244,244,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:53','2017-09-19 12:13:53',NULL,2),(245,245,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(246,246,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(247,247,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(248,248,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(249,249,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(250,250,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(251,251,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(252,252,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(253,253,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(254,254,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(255,255,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(256,256,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(257,257,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(258,258,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(259,259,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(260,260,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(261,261,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(262,262,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(263,263,'2017-10-02','H',NULL,NULL,NULL,0,18,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(264,264,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(265,265,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(266,266,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(267,267,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(268,268,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(269,269,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(270,270,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(271,271,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(272,272,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(273,273,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(274,274,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(275,275,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(276,276,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(277,277,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(278,278,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(279,279,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(280,280,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(281,281,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(282,282,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(283,283,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(284,284,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(285,285,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(286,286,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(287,287,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(288,288,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(289,289,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(290,290,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(291,291,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(292,292,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(293,293,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(294,294,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(295,295,'2017-10-02','H',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(296,296,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(297,297,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(298,298,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(299,299,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(300,300,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(301,301,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(302,302,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(303,303,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(304,304,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(305,305,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(306,306,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(307,307,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(308,308,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(309,309,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(310,310,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(311,311,'2017-10-02','H',NULL,NULL,NULL,0,27,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(312,312,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(313,313,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(314,314,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(315,315,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(316,316,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(317,317,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(318,318,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(319,319,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(320,320,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(321,321,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(322,322,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(323,323,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(324,324,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(325,325,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(326,326,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(327,327,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(328,328,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(329,329,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(330,330,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(331,331,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(332,332,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(333,333,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(334,334,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(335,335,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(336,336,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(337,337,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(338,338,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(339,339,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(340,340,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(341,341,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(342,342,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(343,343,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(344,344,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(345,345,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(346,346,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(347,347,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(348,348,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(349,349,'2017-10-02','H',NULL,NULL,NULL,0,19,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(350,350,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(351,351,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(352,352,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(353,353,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(354,354,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(355,355,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(356,356,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(357,357,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(358,358,'2017-10-02','H',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(359,359,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(360,360,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(361,361,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(362,362,'2017-10-02','H',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(363,363,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(364,364,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(365,365,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(366,366,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(367,367,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(368,368,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(369,369,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(370,370,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(371,371,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(372,372,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(373,373,'2017-10-02','H',NULL,NULL,NULL,0,20,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(374,374,'2017-10-02','H',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(375,375,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(376,376,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(377,377,'2017-10-02','H',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:54','2017-09-19 12:13:54',NULL,2),(378,378,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(379,379,'2017-10-02','H',NULL,NULL,NULL,0,23,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(380,380,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(381,381,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(382,382,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(383,383,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(384,384,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(385,385,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(386,386,'2017-10-02','H',NULL,NULL,NULL,0,22,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(387,387,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(388,388,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(389,389,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(390,390,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(391,391,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(392,392,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(393,393,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(394,394,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(395,395,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(396,396,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(397,397,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(398,398,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(399,399,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(400,400,'2017-10-02','H',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(401,401,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(402,402,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(403,403,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(404,404,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(405,405,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(406,406,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(407,407,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(408,408,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(409,409,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(410,410,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(411,411,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(412,412,'2017-10-02','H',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(413,413,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(414,414,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(415,415,'2017-10-02','H',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(416,416,'2017-10-02','H',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(417,417,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(418,418,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(419,419,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(420,420,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(421,421,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(422,422,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(423,423,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(424,424,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(425,425,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(426,426,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(427,427,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(428,428,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(429,429,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(430,430,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(431,431,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(432,432,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(433,433,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(434,434,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(435,435,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(436,436,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(437,437,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(438,438,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(439,439,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(440,440,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(441,441,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(442,442,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(443,443,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(444,444,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(445,445,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(446,446,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(447,447,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(448,448,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(449,449,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(450,450,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2),(451,451,'2017-10-02','H',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 12:13:55','2017-09-19 12:13:55',NULL,2);
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
  `bank_id` int(11) DEFAULT NULL,
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
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'EC_1001','Staff','',NULL,1,'2017-09-19 05:32:12','2017-09-19 05:32:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_code_masters`
--

LOCK TABLES `employee_code_masters` WRITE;
/*!40000 ALTER TABLE `employee_code_masters` DISABLE KEYS */;
INSERT INTO `employee_code_masters` VALUES (1,'Pune','1','1',1,NULL,'2017-09-19 04:59:42','2017-09-19 04:59:42'),(2,'Hyderabad','200','200',1,NULL,'2017-09-19 05:00:06','2017-09-19 05:00:06');
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
  `day` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_daily_activities_on_employee_id` (`employee_id`),
  KEY `index_employee_daily_activities_on_project_master_id` (`project_master_id`),
  CONSTRAINT `fk_rails_acada942e0` FOREIGN KEY (`project_master_id`) REFERENCES `project_masters` (`id`),
  CONSTRAINT `fk_rails_3247428dc6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,'0','Analyst',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(2,'0','Assistant Manager',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(3,'0','Associate Analyst',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(4,'0','Associate Content Specialist',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(5,'0','Associate Director ',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(6,'0','Associate Project Manager',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(7,'0','Associate Vice President ',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(8,'0','BI Engineer',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(9,'0','Big Data Engineer',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(10,'0','CEO',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(11,'0','Client Relationship Manager',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(12,'0','COO',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(13,'0','Data Analyst',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(14,'0','Data Scientist',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(15,'0','Database Architect',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(16,'0','Delivery Lead – Data Analytics',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(17,'0','Deputy Manager ',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(18,'0','Digital Marketing Head',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(19,'0','Director',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(20,'0','Executive',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(21,'0','Front Office Executive',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(22,'0','Graphic Designer',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(23,'0','Head - Human Resources & Administration',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(24,'0','Head - IT',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(25,'0','Head Finance',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(26,'0','Inside Sales Consultant: Pharma and Life Science',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(27,'0','IT Analyst',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(28,'0','Junior Data Scientist',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(29,'0','Lead Analyst',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(30,'0','Lead Data Scientist',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(31,'0','Lead Developer',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(32,'0','Lead Engineer',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(33,'0','Manager',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(34,'0','Office Assistant',NULL,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(35,'0','Office Driver',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(36,'0','Project Manager',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(37,'0','Reporting Specialist',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(38,'0','Research Analyst',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(39,'0','Research Manager',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(40,'0','Senior Analyst',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(41,'0','Senior Business Development Executive',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(42,'0','Senior Content Editor',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(43,'0','Senior Data Scientist',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(44,'0','Senior Developer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(45,'0','Senior Editor',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(46,'0','Senior Executive',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(47,'0','Senior Financial Analyst',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(48,'0','Senior Graphic Designer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(49,'0','Senior Manager',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(50,'0','Senior Primary Research Analyst',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(51,'0','Senior Research Manager',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(52,'0','Senior Software Engineer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(53,'0','Senior System Administrator',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(54,'0','Senior Vice President - Analytics',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(55,'0','Senior Vice President - Investment Research',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(56,'0','Software Engineer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(57,'0','System Administrator',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(58,'0','Team Lead',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(59,'0','VBA developer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(60,'0','Vice President',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14'),(61,'0','Web Developer',NULL,NULL,'2017-09-19 04:12:14','2017-09-19 04:12:14');
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
  `employee_id` int(11) DEFAULT NULL,
  `employee_gp_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_gps_histories_on_employee_id` (`employee_id`),
  KEY `index_employee_gps_histories_on_employee_gp_id` (`employee_gp_id`),
  CONSTRAINT `fk_rails_d8bb8b3a19` FOREIGN KEY (`employee_gp_id`) REFERENCES `employee_gps` (`id`),
  CONSTRAINT `fk_rails_13b4974483` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
INSERT INTO `employee_grades` VALUES (1,'EG_1001','A','Grade A Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'EG_1002','B','Grade B Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'EG_1003','C','Grade C Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'EG_1004','D','Grade D Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(5,'EG_1005','E','Grade E Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(6,'EG_1006','F','Grade F Employee','2017-09-19 04:12:11','2017-09-19 04:12:11'),(7,'EG_1007','G','Grade G Employee','2017-09-19 04:12:11','2017-09-19 04:12:11');
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
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `total_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `carry_forward` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collapse_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_balances_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_balances_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_258306096f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_42e9a9a920` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
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
  `first_reporter_id` int(11) DEFAULT NULL,
  `second_reporter_id` int(11) DEFAULT NULL,
  `present_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `employee_id` int(11) DEFAULT NULL,
  `relation_master_id` int(11) DEFAULT NULL,
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
  `illness_type_id` int(11) DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_nominations_on_nomination_master_id` (`nomination_master_id`),
  KEY `index_employee_nominations_on_family_id` (`family_id`),
  KEY `index_employee_nominations_on_employee_id` (`employee_id`),
  KEY `index_employee_nominations_on_relation_master_id` (`relation_master_id`),
  KEY `index_employee_nominations_on_district_id` (`district_id`),
  KEY `index_employee_nominations_on_state_id` (`state_id`),
  KEY `index_employee_nominations_on_country_id` (`country_id`),
  KEY `index_employee_nominations_on_illness_type_id` (`illness_type_id`),
  CONSTRAINT `fk_rails_e303215b65` FOREIGN KEY (`illness_type_id`) REFERENCES `illness_types` (`id`),
  CONSTRAINT `fk_rails_274288ef05` FOREIGN KEY (`relation_master_id`) REFERENCES `relation_masters` (`id`),
  CONSTRAINT `fk_rails_306f672001` FOREIGN KEY (`nomination_master_id`) REFERENCES `nomination_masters` (`id`),
  CONSTRAINT `fk_rails_534510336c` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_57674930be` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_5f640c6edc` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`),
  CONSTRAINT `fk_rails_60bbfeb69b` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_b6a79415fd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  `resign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leaving_reason_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `change_status_employee_id` int(11) DEFAULT NULL,
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_resignations_on_employee_id` (`employee_id`),
  KEY `index_employee_resignations_on_leaving_reason_id` (`leaving_reason_id`),
  CONSTRAINT `fk_rails_b49e6901c2` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
  CONSTRAINT `fk_rails_934242d84f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_salary_templates_on_employee_id` (`employee_id`),
  KEY `index_employee_salary_templates_on_salary_template_id` (`salary_template_id`),
  KEY `index_employee_salary_templates_on_salary_component_id` (`salary_component_id`),
  KEY `index_employee_salary_templates_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_7f73b6d393` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_0a4494cbdd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
  `task_time1` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `gross_salary` decimal(10,0) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
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
INSERT INTO `employee_types` VALUES (1,'ET_1001','Intern','Employee is an intern',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'ET_1002','Freelancer','Freelancer',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'ET_1003','Probation','Permanent Employee',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'ET_1004','Resigned','Resigned',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(5,'ET_1005','Confirmed','Confirmed Employee',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11');
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
  `optinal_contact_no1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optional_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `employee_code_master_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
  `extension_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_file_size` int(11) DEFAULT NULL,
  `employee_signature_updated_at` datetime DEFAULT NULL,
  `service_master_id` int(11) DEFAULT NULL,
  `resource_pool_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employees_on_employee_code` (`employee_code`),
  KEY `index_employees_on_country_id` (`country_id`),
  KEY `index_employees_on_state_id` (`state_id`),
  KEY `index_employees_on_district_id` (`district_id`),
  KEY `index_employees_on_blood_group_id` (`blood_group_id`),
  KEY `index_employees_on_employee_type_id` (`employee_type_id`),
  KEY `index_employees_on_nationality_id` (`nationality_id`),
  KEY `index_employees_on_religion_id` (`religion_id`),
  KEY `index_employees_on_company_id` (`company_id`),
  KEY `index_employees_on_company_location_id` (`company_location_id`),
  KEY `index_employees_on_department_id` (`department_id`),
  KEY `index_employees_on_employee_code_master_id` (`employee_code_master_id`),
  KEY `index_employees_on_sub_department_id` (`sub_department_id`),
  KEY `index_employees_on_service_master_id` (`service_master_id`),
  KEY `index_employees_on_resource_pool_master_id` (`resource_pool_master_id`),
  CONSTRAINT `fk_rails_4dfc077508` FOREIGN KEY (`resource_pool_master_id`) REFERENCES `resource_pool_masters` (`id`),
  CONSTRAINT `fk_rails_0025f65a97` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_0e6f1ceeeb` FOREIGN KEY (`employee_code_master_id`) REFERENCES `employee_code_masters` (`id`),
  CONSTRAINT `fk_rails_0f20a81443` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_3cad0b3f1b` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`id`),
  CONSTRAINT `fk_rails_41fab8edaf` FOREIGN KEY (`service_master_id`) REFERENCES `service_masters` (`id`),
  CONSTRAINT `fk_rails_44cfcfba34` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_6242475258` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_7fb9aac7a3` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `fk_rails_8587c7b912` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_aff313c1b7` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_c3ceaae2da` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  CONSTRAINT `fk_rails_eb26439f43` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','EMP0000001',NULL,'Mr.','Sushant',NULL,'Gupta','1967-09-24','Male','7201','9890016447','5001','sushant@sganalytics.com','NA','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,15,83,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','NA','AHRPG0717C','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9921755899',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2','EMP0000002',NULL,'Mrs.','Simran',NULL,'Wadhwa','1983-11-20','Female','7223','9850248555','5023','simran@sganalytics.com','NA','D 802, Mystique Moods, Viman Nagar',1,15,83,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','NA','AAYPW3067B','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9850069823',NULL,NULL,NULL,NULL,NULL,NULL),(3,'4','EMP0000003',NULL,'Mr.','Rahul',NULL,'Sowani','1982-02-18','Male','7253','9850069823','5053','rahul@sganalytics.com','NA','D 802, Mystique Moods, Viman Nagar',1,15,83,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','NA','BHRPS9517B','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9850248555',NULL,NULL,NULL,NULL,NULL,NULL),(4,'5','EMP0000004',NULL,'Mr.','Shrikrishna',NULL,'Bawachkar','1981-12-19','Male','7266','9765830856','5066','shrikrishna@sganalytics.com','shrikrishna.bawachkar@gamil.com','Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth',1,15,83,'Pune',411030,'Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth, Pune 30','NA','AMTPB5555G','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'93700',NULL,NULL,NULL,NULL,NULL,NULL),(5,'33','EMP0000005',NULL,'Mr.','Ashok',NULL,'Kumar','1988-03-05','Male','0','9579647553','0','ashok@sganalytics.com','kumar_aa16@yahoo.com','Vill. Kakkar PO. Chandruhi Teh.',1,9,28,'Hamirpur',177024,'Willam Nagar Omkar Colony S.No. 9/1 Amrut Apartment Pimple Gurave Pune - 411027','NA','AYXPK8982E','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9021913453',NULL,NULL,NULL,NULL,NULL,NULL),(6,'37','EMP0000006',NULL,'Mr.','Anil',NULL,'Bhote','1984-03-19','Male','0','9604609338','0','anil@sganalytics.com','anilsb2006@rediffmail.com','Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale',1,15,83,'Talegaon Dabhade',410507,'Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale, Talegaon Dabhade - 410507','NA','ANHPB3506E','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9665117828',NULL,NULL,NULL,NULL,NULL,NULL),(7,'44','EMP0000007',NULL,'Mr.','Umesh',NULL,'Shelar','1985-12-24','Male','0','9960258387','0','umesh@sganalytics.com','uashelar@gmail.com','At – Sherpe (Patilwadi),  Post – Kurangavane',1,15,87,'Kankavli',416703,'C/o – Anurath Kisan Sherkhane , Sr. No. 59/2 B 1, Near Raigad Colony,Gulmohar Colony, Rahatani, Pune 411 017','NA','BHOPS9509L','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9552511938',NULL,NULL,NULL,NULL,NULL,NULL),(8,'50','EMP0000008',NULL,'Mr.','Pradip',NULL,'Chowdhary','1982-01-08','Male','0','9860484814','0','pradip@sganalytics.com','NA','At Khedi Tal',1,15,73,'Jalgaon',0,'B-12,Wagheshwar Nagar,Near Wagheshwar Temple Wagholi, Tal-Haveli, Dist-Pune','NA','AHWPC3011G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9765880650',NULL,NULL,NULL,NULL,NULL,NULL),(9,'51','EMP0000009',NULL,'Mr.','Umed','Padghan','(Patil)','1980-12-27','Male','7209','9960641806','5009','umedpatil@sganalytics.com','NA','At Post Mera B.K.',1,15,70,'Chikhali',443201,'Flat No- 4, Krushnavel Apt, Plot No 15, Girija Society, Kothrud, Pune-38','NA','ARZPP3982E','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9766542682',NULL,NULL,NULL,NULL,NULL,NULL),(10,'61','EMP0000010',NULL,'Mr.','Ravi',NULL,'Vitkar','1989-06-15','Male','0','9923647439','0','NA','NA','101, Lalchal, Kusalkar Putala, Gokhale Nagar',1,15,83,'Pune',411016,'101, Lalchal, Kusalkar Putala, Gokhale Nagar, Pune 411 016.','NA','AHYPV4125G','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9764878258',NULL,NULL,NULL,NULL,NULL,NULL),(11,'139','EMP0000011',NULL,'Mr.','Ahmed',NULL,'Hakki','1962-05-27','Male','0','41795761586','0','ahakki@sganalytics.com','wickhakki@bluewin.ch        ','Burain 12, 8803 Rüschlikon',5,17,NULL,'NA',0,'Burain 12, 8803 Rüschlikon, Switzerland       ','NA','NA','NA','Married',1,5,3,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'41796240080',NULL,NULL,NULL,NULL,NULL,NULL),(12,'185','EMP0000012',NULL,'Mr.','Abhishek',NULL,'Bagrodia','1987-06-13','Male','7264','9823011026','5064','abhishek.bagrodia@sganalytics.com','abhishek.bagrodia@gmail.com','E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilakh',1,15,83,'Pune',411007,'E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilkah, Pune-411007\n','NA','AJJPB7169D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,3,NULL,'9822053144',NULL,NULL,NULL,NULL,NULL,NULL),(13,'191','EMP0000013',NULL,'Mr.','Ashvarya',NULL,'Verma','1985-01-03','Male','7314','9987549821','5130','ashvarya.verma@sganalytics.com','ashvarya.verma@gmail.com','F-1/44 Manas Apartment, Old Ashoka Garden, Behind Prabhat Petrol Pump',1,14,51,'Bhopal',462023,'B-4, Deokar Residency, Near Green Thing Restaurant, Wadgaon Sheri, Pune - 411014','NA','AJJPV0966A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,3,NULL,'7709259086',NULL,NULL,NULL,NULL,NULL,NULL),(14,'221','EMP0000014',NULL,'Mr.','Ashish',NULL,'Tendulkar','1979-08-06','Male','0','9820953312','0','ashish.tendulkar@sganalytics.com','ashishten@gmail.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,15,77,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','NA','ADKPT0104D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9969528348',NULL,NULL,NULL,NULL,NULL,NULL),(15,'222','EMP0000015',NULL,'Mr.','Sameer',NULL,'Tendulkar','1979-08-06','Male','7220','9820953329','5020','sameer.tendulkar@sganalytics.com','sammytendz@yahoo.co.in','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,15,77,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','NA','AEVPT9801R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9969528348',NULL,NULL,NULL,NULL,NULL,NULL),(16,'265','EMP0000016',NULL,'Mrs.','Divya',NULL,'Prasad','1982-09-08','Female','7350','9049870545','5136','divya.prasad@sganalytics.com','divya_upadhya@yahoo.com','48/2,Dhanlaxmi Society,Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri',1,15,83,'Pune',411014,'48/2,Dhanlaxmi Society,Ganesh Nagar,Near Anand Park bus stop,Vadgaonsheri, Pune -411014','NA','AASPU9653K','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'8605271437',NULL,NULL,NULL,NULL,NULL,NULL),(17,'277','EMP0000017',NULL,'Mr.','Roohul',NULL,'Kapadiya','1989-05-28','Male','7277','7798842427','5076','roohul.kapadia@sganalytics.com','roohulkapadia@yahoo.com','2/3076/78, Hidayat Manzil, Sagrampura, Sindhiwaad',1,7,22,'Surat',395003,'Jagdamba Society, Nr. Bora Classes, Somnath Nagar, Vadgaon Sheri, Pune-411006, Maharashtra.','NA','AUZPK4035C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9879844300',NULL,NULL,NULL,NULL,NULL,NULL),(18,'281','EMP0000018',NULL,'Mr.','Ninad',NULL,'Kadake','1980-11-04','Male','0','9763775428','0','ninad.kadake@sganalytics.com','NA','12 D, Shankar Chhaya Apartment, Near Mhatre Bridge, Erandwane',1,15,83,'Pune',411004,'12 D Shankar Chhaya Apartment Near Mhatre Bridge Erandwane Pune. 411 004.','NA','AYBPK7303F','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9890160808',NULL,NULL,NULL,NULL,NULL,NULL),(19,'282','EMP0000019',NULL,'Mr.','Gunjan',NULL,'Bhatt','1980-11-15','Male','0','9561826233','0','gunjan.bhatt@sganalytics.com','NA','78/465 Vijaynagar, Naranpura',1,7,20,'Ahmedabad',380013,'G-304, Daffodils, Magarpatta City – 411013','NA','AFXPB0304A','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9833381046',NULL,NULL,NULL,NULL,NULL,NULL),(20,'290','EMP0000020',NULL,'Mr.','Krashna',NULL,'Patharakar','1987-05-04','Male','0','9823385435','0','krushna.patharakar@sganalytics.com','cakrushnapatharakar@gmail.com','Priti Niwas, Kranti chowk, Main road',1,15,69,'Kille Dharur',0,'Flat no.6, bldg 2, Salokha hsg soc. Near BSNL office, off Satara road, pune 411009','NA','BRMPP5843C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9923267433',NULL,NULL,NULL,NULL,NULL,NULL),(21,'295','EMP0000021',NULL,'Mrs.','Sonal',NULL,'Mamtora','1981-08-17','Female','7355','9158887753','5144','sonal.mamtora@sganalytics.com','sonalmer17@yahoo.co.in','Flat no. 604, B Wing, Dhavel Windscapess Cooperative Housing Society, Hingle Mala Road, Sasane Nagar, Hadapsar',1,15,83,'Pune',411028,'Flat no. 604, B wing, Dhavel WindscapessCooperative housing society, Hingle Mala Road(Behind New English High School), Sasane Nagar, Hadapsar Pune 411028','NA','AKAPM5674N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9923177757',NULL,NULL,NULL,NULL,NULL,NULL),(22,'296','EMP0000022',NULL,'Mr.','Nayanjyoti',NULL,'Das','1981-01-30','Male','7283','9833979018','5082','nayanjyoti.das@sganalytics.com','nayandas30@gmail.com','House No.33, Sandhyachal Nagar, Lalmati, Beltola',1,2,10,'Guwahati',781028,'B2/302, Lunkad Gold Coast, Viman Nagar, Pune - 411014, Maharashtra','NA','AIFPD0419H','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,9,NULL,'9920296644',NULL,NULL,NULL,NULL,NULL,NULL),(23,'298','EMP0000023',NULL,'Mr.','Suhrid',NULL,'Barua','1975-11-21','Male','0','9970186748','0','suhrid.barua@sganalytics.com','suhridbarua@gmail.com','KKB Road Chenikuthi \'Rupan\'',1,2,10,'Guwahati',781003,'Ganga Kunj Society H Block 201 Kalas Vishrantwadi Alandi Road Pune 411015','NA','AIKPB6845Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9766107632',NULL,NULL,NULL,NULL,NULL,NULL),(24,'304','EMP0000024',NULL,'Mrs.','Jyoti',NULL,'Huria','1985-02-18','Female','7266','9764571611','5026','jyoti.huria@sganalytics.com','surijyoti85@yahoo.com','13/450, BTI Road',1,14,60,'Panna',488001,'H.No-307,48/2,Raj Palace,Dhanalaxmi Society ganesg nagar wadgaon sheri Pune','NA','CIXPS6425E','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9823389432',NULL,NULL,NULL,NULL,NULL,NULL),(25,'305','EMP0000025',NULL,'Mr.','Mayuresh',NULL,'Wagh','1982-05-21','Male','7255','9823294888','5055','mayuresh.wagh@sganalytics.com','wagh.mayuresh@gmail.com','53, Mukund Nagar, Shree Ahireshwar Wadi',1,15,83,'Pune',411037,'53, Mukund Nagar, Shree Ahireshwar Wadi, Pune 411037','NA','AAPPW7193R','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'97671',NULL,NULL,NULL,NULL,NULL,NULL),(26,'310','EMP0000026',NULL,'Mr.','Varun',NULL,'Goela','1984-08-20','Male','0','7709378001','0','varun.goela@sganalytics.com','varun.goela@gmail.com','5,B-3, Bhamashah Marg',1,5,17,'Delhi',110009,'Flat 302, 4th Floor, Bhakti Apartments, Viman Nagar, Pune','NA','AGWPG5937E','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9811349066',NULL,NULL,NULL,NULL,NULL,NULL),(27,'351','EMP0000027',NULL,'Miss','Sneha',NULL,'Shinde','1989-01-29','Female','7543','9096867031','0','sneha.shinde@sganalytics.com','sneha.29189@gmail.com','Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada',1,15,83,'Pune',411006,'Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada Pune 411006','NA','CHIPS5059Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9922903288',NULL,NULL,NULL,NULL,NULL,NULL),(28,'371','EMP0000028',NULL,'Mr.','Parth',NULL,'Arora','1983-04-25','Male','7270','8390395821','5070','parth.arora@sganalytics.com','parth83@gmail.com','C/103 Gala Swing, South Bopal',1,7,20,'Ahmedabad',0,'E 5 / 605 Rohan Mithila ,Near Symbiosis college ,Viman Nagar, Pune - 411014','NA','AFAPA4280P','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9825978927',NULL,NULL,NULL,NULL,NULL,NULL),(29,'372','EMP0000029',NULL,'Mrs.','Renuka','Vikram','Vaishnav','1982-08-03','Female','1055','9011086816','0','renuka.vaishnav@sganalytics.com','chrisapu06@gmail.com','Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar, Village Mundhwa',1,15,83,'Pune',411036,'Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar,Village Mundhwa, Pune- 411036','NA','AOZPM2520A','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'8806781777',NULL,NULL,NULL,NULL,NULL,NULL),(30,'383','EMP0000030',NULL,'Mr.','Shrikant',NULL,'Sawant','1981-12-05','Male','0','9970766699','0','shrikant.sawant@sganalytics.com','shrikantsawant00@gmail.com','C/3 , Pimple Apartments , Kasarwadi ',1,15,83,'Pune',411034,'C/3 , Pimple Apartments , Kasarwadi , Pune - 411034','NA','BYJPS8885D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9623068886',NULL,NULL,NULL,NULL,NULL,NULL),(31,'411','EMP0000031',NULL,'Mr.','Chaitanya',NULL,'Kanade','1985-01-27','Male','1044','7385219155','7548','chaitanya.kanade@sganalytics.com','ckanade09@yahoo.com','S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai Gas Agency, Wadgaon Sheri',1,15,83,'Pune',411014,'S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai gas agency, Wadgaonsheri, Pune- 411014.','NA','ASTPK1180A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9850362339',NULL,NULL,NULL,NULL,NULL,NULL),(32,'413','EMP0000032',NULL,'Mr.','Mohammed',NULL,'Khan','1986-09-16','Male','0','9823616946','0','mohammed.khan@sganalytics.com','mohammed86khan@gmail.com','38 A ,52, Ashutosh Apartments , Napean Sea Raod',1,15,77,'Mumbai',400006,'Flat 1402, 14th Floor,Tower 12A, Amanora Park Town, Pune - 411028','NA','BGXPK5662A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,8,NULL,'9823104028',NULL,NULL,NULL,NULL,NULL,NULL),(33,'439','EMP0000033',NULL,'Mrs.','Khushboo',NULL,'Gupta','1986-01-15','Female','7243','8380078776','5043','khushboo.gupta@sganalytics.com','khush.g3@gmail.com','Flat no 404, Shree Radhey Apartment, opp to MSEB Office, Wardhaman Nagar',1,15,78,'Nagpur',440008,'Wing A3, Flat no. 802, Acolade Society, Opposite Hyundari Showroom, Tukaram Nagar, Kharadi, Pune, Maharashtra 411014','NA','AKKPG0871B','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,3,NULL,'9970157846',NULL,NULL,NULL,NULL,NULL,NULL),(34,'444','EMP0000034',NULL,'Mr.','Sanjay',NULL,'Ujalambkar','1967-11-20','Male','7568','9922918554','0','sanjay.ujalambkar@sganalytics.com','sanjay.ujalambkar@rediffmail.com','Flat no - A - 15, Sukhwani Discover, 3rd Floor, Near Sant Nirankari Satsang Bhavan, Vijaynagar, Kalewadi',1,15,83,'Pune',411017,'Flat no - A - 15, Sukhwani Discover,3rd Floor , Near Sant Nirankari Satsang Bhavan, Vijaynagar,Kalewadi,Pune - 411017','NA','AAOPU6003F','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9922948554',NULL,NULL,NULL,NULL,NULL,NULL),(35,'448','EMP0000035',NULL,'Mr.','Balaji',NULL,'Khandade','1977-03-01','Male','0','9175000220','0','balaji.khandade@sganalytics.com','balaji.khandade@gmail.com','Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi',1,15,83,'Pune',411017,'Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi , Pune - 411017','NA','AWNPK5452B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9421462267',NULL,NULL,NULL,NULL,NULL,NULL),(36,'464','EMP0000036',NULL,'Mr.','Chandra','Bhanu','Gembali','1986-08-12','Male','0','8007127868','0','chandra.gembali@sganalytics.com','bhanu.gembly@gmail.com','Pendrani Rise Mills, Jagat Jagani Street',1,24,99,'Umerkote',764073,'Pendrani Rise Mills, Jagat Jagani Street, Umerkote 764073, Nabarangapur Dist Odisha','NA','AQJPB4244N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'7381591234',NULL,NULL,NULL,NULL,NULL,NULL),(37,'495','EMP0000037',NULL,'Miss','Yogita',NULL,'Wahalkar','1990-01-23','Female','1051','9096809391','0','yogita.wahalkar@sganalytics.com','yogitawahalkar@gmail.com','P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad',1,15,83,'Pune',411033,'P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad, Pune-33','NA','ABEPW1646D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9326182454',NULL,NULL,NULL,NULL,NULL,NULL),(38,'499','EMP0000038',NULL,'Mr.','Saket',NULL,'Kumar','1981-04-07','Male','0','9049988426','0','saket.kumar@sganalytics.com','sinhasaket@outlook.com','Flat No. 62, Tulip Appt, Neco Garden, Viman Nagar',1,15,83,'Pune',411014,'Flat No. 62, Tulip Appt, Neco garden, Viman Nagar, Pune - 411014','NA','AYMPK6852E','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,6,NULL,'7350010480',NULL,NULL,NULL,NULL,NULL,NULL),(39,'522','EMP0000039',NULL,'Miss','Vartika',NULL,'Deshma','1992-10-16','Female','7335','8087964076','5123','vartika.deshma@sganalytics.com','deshma.vartika5645@gmail.com','H.No.2675, Bairagpura',1,28,123,'Mathura',281001,'Tai niwas, Flat no.204, Opp Zensar, Kharadi, Pune','NA','BHFPD4443P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9045171975',NULL,NULL,NULL,NULL,NULL,NULL),(40,'530','EMP0000040',NULL,'Mr.','Shashank',NULL,'Kulkarni','1986-09-10','Male','7546','9823883424','0','shashank.kulkarni@sganalytics.com','shashankkulkarni10@gmail.com','Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari',1,15,83,'Pune',411041,'Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari 411041','NA','BMFPK8112B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9619889269',NULL,NULL,NULL,NULL,NULL,NULL),(41,'540','EMP0000041',NULL,'Mr.','Shrikant',NULL,'Sankpal','1987-04-23','Male','7284','9822513894','5083','shrikant.sankpal@sganalytics.com','shrikantsankpal@gmail.com','138, Mangalwar Peth, Opp Raj Auto',1,15,83,'Pune',411011,'138, Mangalwar Peth, Opp Raj Auto, Pune - 411011','NA','CNNPS4165E','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9689934302',NULL,NULL,NULL,NULL,NULL,NULL),(42,'542','EMP0000042',NULL,'Mr.','Rahil',NULL,'Khan','1981-12-08','Male','7369','9822041473','5148','rahil.khan@sganalytics.com','findrahil@gmail.com','Victoria Mansions,7, Castellino Road',1,15,83,'Pune',411001,'Victoria Mansions, 7, Castellino Road, Pune - 411001','NA','APKPK5346N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,6,NULL,'9822450230',NULL,NULL,NULL,NULL,NULL,NULL),(43,'546','EMP0000043',NULL,'Mr.','Aditya',NULL,'Thard','1988-09-21','Male','5036','9503232902','7236','aditya.thard@sganalytics.com','aditya.thard@gmail.com','700 / C, Block P, New Alipore',1,30,131,'Kolkata',700053,'Kumar Padmalaya, Flat no A3/2, Aundh, Near Medipoint Hospital, Pune - 411006','NA','AGWPT5140Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,26,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'8308808905',NULL,NULL,NULL,NULL,NULL,NULL),(44,'555','EMP0000044',NULL,'Mr.','Chandraprakash',NULL,'Sharma','1988-08-30','Male','0','9673727597','0','chandraprakash.sharma@sganalytics.com','chandra.sharma14@yahoo.com','S.No 79/1 CTS 038, 10 Near Marathi School, Kalewadi',1,15,83,'Pune',411017,'S.No 79/1 CTS 038,10 Near Marathi School,Kalewadi,Pune','NA','CIFPS1598N','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9922493778',NULL,NULL,NULL,NULL,NULL,NULL),(45,'556','EMP0000045',NULL,'Mr.','Amit',NULL,'Fartode','1988-11-16','Male','7261','9975708420','5061','amit.fartode@sganalytics.com','fartodeamit@gmail.com','26 Forest Colony, Yashoda Nagar',1,15,67,'Amravati',444602,'201 - B,Seetai Corner, Opposite DSK Toyota Showroom,Mumbai - Bangalore High way, Bavdhan, Pune - 411021','NA','ABBPF8738L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'8421725363',NULL,NULL,NULL,NULL,NULL,NULL),(46,'558','EMP0000046',NULL,'Miss','Karuna',NULL,'Ovhal','1985-05-03','Female','7327','8007346267','5116','karuna.ovhal@sganalytics.com','karuna.ovhal@gmail.com','43020, Pratik Nagar, Vishrantwadi, Yerwada',1,15,83,'Pune',411006,'10/12,Pratik Nagar,Vishrantwadi ,Yerwada,Pune-411006.','NA','AAQPO6244G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9028258771',NULL,NULL,NULL,NULL,NULL,NULL),(47,'563','EMP0000047',NULL,'Miss','Sneha',NULL,'Govindalwar','1989-02-28','Female','0','8055639054','0','sneha.govindalwar@sganalytics.com','snehagovindalwar@gmail.com','Chintamani Nagar-3, A-11/29, Bibwewadi',1,15,83,'Pune',411037,'Chintamani Nagar-3,A-11/29,Bibwewadi,Pune - 411037','NA','ARMPG3954C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9021784845',NULL,NULL,NULL,NULL,NULL,NULL),(48,'566','EMP0000048',NULL,'Miss','Petra',NULL,'Brncalova','1987-03-08','Female','0','7030523632','0','petra.brncalova@sganalytics.com','p.brncalova@gmail.com','Hemmelrather Weg 269, 51377 Leverkusen',3,17,NULL,'NA',0,'A / F 11, Ganga Park Society, Pingle Vasti, Mundhwa Road, Pune','NA','BYJPB4829C','NA','Unmarried',3,5,2,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9923048170',NULL,NULL,NULL,NULL,NULL,NULL),(49,'570','EMP0000049',NULL,'Mr.','Pavanprit',NULL,'Singh','1991-05-15','Male','7337','9975207413','5215','pavanprit.singh@sganalytics.com','pavanprit196@gmail.com','Gulzar Singh, House no 11, Village Malmohri, Naurangabad, Tatn Taran',1,25,101,'Amritsar',143401,'Harman House,Ranjeet Nagar,Yerwada, Pune - 411006','NA','DSDPS7994K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9689745213',NULL,NULL,NULL,NULL,NULL,NULL),(50,'572','EMP0000050',NULL,'Miss','Priya',NULL,'Dikhale','1990-01-02','Female','0','9975112721','0','priya.dikhale@sganalytics.com','priya.020190@gmail.com','Shriram Nagar, Bldg - B4, Flat no 9, Aundh',1,15,83,'Pune',411007,'Shriram Nagar, Bldg - B4, Flat no 9, Aundh, Pune - 411007','NA','BZEPD4523M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9096199802',NULL,NULL,NULL,NULL,NULL,NULL),(51,'574','EMP0000051',NULL,'Mr.','Gaurav',NULL,'Sharma','1992-04-08','Male','0','9731139271','0','gaurav.sharma@sganalytics.com','gaurav8492@rediffmail.com','1st Floor, Sampat Building, Airport Road, Vijaynagar, Totu',1,9,29,'Shimla',171011,'701, B-3, Oxygen Valley, Near Ravi Garden, Pune-Solapur highway, Manjri BK, PUNE','NA','CVWPS3620K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,NULL,NULL,'9637171570',NULL,NULL,NULL,NULL,NULL,NULL),(52,'575','EMP0000052',NULL,'Mr.','Srinivasan',NULL,'Venkatesan','1990-06-16','Male','7275','9920349342','5075','srinivasan.venkatesan@sganalytics.com','sri_v@live.com','RDP 1 / 35, Jaiganga CHS, Flat No. 16, Sector 2, Charkop, Kandivali West',1,15,77,'Mumbai',400067,'RDP 1 / 35, Jaiganga CHS, Flat no 16, Sector 2, Charkop, Kandivali West, Mumbai - 400067','NA','CEKPS8900K','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:02','2017-09-19 05:21:02',NULL,NULL,NULL,NULL,1,NULL,'9930618623',NULL,NULL,NULL,NULL,NULL,NULL),(53,'579','EMP0000053',NULL,'Mr.','Moses',NULL,'Gaikwad','1986-07-19','Male','1040','8806064076','4001','moses.gaikwad@sganalytics.com','mosessoloman@gmail.com','Phayer Road, Opp Hutchings School, Bungalow No 10',1,15,83,'Pune',411040,'Phayer Road, Opp Hutchings School, Bungalow no 10, Pune - 411040','NA','BKZPG9139E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9763127419',NULL,NULL,NULL,NULL,NULL,NULL),(54,'582','EMP0000054',NULL,'Mrs.','Savita',NULL,'Kaintura','1982-12-03','Female','1038','9689865298','0','savita.kaintura@sganalytics.com','savita.kaintura@yahoo.com','B - 252, Prodyogiki Apartment, Plot No 11, Sector 03, Dwarka',1,5,17,'New Delhi',110078,'C - 28, Isher Apartment, Near Montvertvirt Prestine, Aundh Road, Khadki Station, Pune - 411020','NA','ARRPK1789L','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9850714434',NULL,NULL,NULL,NULL,NULL,NULL),(55,'594','EMP0000055',NULL,'Mr.','Satish',NULL,'Shinde','1983-11-24','Male','0','9594321689','0','satish.shinde@sganalytics.com','shinde123satish@gmail.com','Harshada Samartha Society, D/9, Pimple Saudagar',1,15,83,'Pune',411027,'Harshada Samartha Society, D/9, Pimple Saudagar, Pune - 411027','NA','BMQPS7340A','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9930321689',NULL,NULL,NULL,NULL,NULL,NULL),(56,'596','EMP0000056',NULL,'Mr.','Pankaj',NULL,'Kumar','1988-11-07','Male','7239','8087600279','5039','pankaj.kumar@sganalytics.com','pankaj.bansal711@gmail.com','H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate',1,25,104,'Giddarbaha',152101,'H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate, Giddarbaha, Punjab - 152101','NA','AUEPK1376P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9463892711',NULL,NULL,NULL,NULL,NULL,NULL),(57,'597','EMP0000057',NULL,'Mr.','Avinash',NULL,'Kumar','1988-10-17','Male','7350','9013034003','5136','avinash.kumar@sganalytics.com','akumar4731@gmail.com','S1, Navy Nagar, Naval Station Karanja',1,15,84,'Uran',400704,'S1, Navy Nagar, Naval Station Karanja, Uran, Raigadh, Maharashtra - 400704','NA','BKPPK9950D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9757097962',NULL,NULL,NULL,NULL,NULL,NULL),(58,'598','EMP0000058',NULL,'Miss','Pradnya',NULL,'Bathe','1985-02-02','Female','0','9421669922','0','pradnya.bathe@sganalytics.com','pradnya.bathe@gmail.com','RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar',1,15,83,'Pune',411028,'RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar, Pune - 411028','NA','BBNPB4806L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9423505454',NULL,NULL,NULL,NULL,NULL,NULL),(59,'607','EMP0000059',NULL,'Mr.','Arvind',NULL,'Kumar','1989-01-03','Male','0','9175116342','0','arvind.kumar@sganalytics.com','arvd.maa@gmail.com','H.no - 25',1,11,39,'Bagharayadih',833216,'Flat no 103, Mahalaxmi Complex, Vishal nagar, Pimple - Nilakh, Pune - 411025','NA','CSOPK1998K','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9771445908',NULL,NULL,NULL,NULL,NULL,NULL),(60,'608','EMP0000060',NULL,'Mr.','Kamran',NULL,'Ahmad','1980-02-07','Male','0','9762579155','0','kamran.ahmad@sganalytics.com','kamran0780@gmail.com','H. No. 285/332/3, Sector - 3, Chakia',1,28,117,'Allahabad',211016,'Flat 31, B- II, Kamaldeep Gardens, Kondhwa Khurd, Pune - 411048','NA','AKTPA5425E','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9936883984',NULL,NULL,NULL,NULL,NULL,NULL),(61,'609','EMP0000061',NULL,'Mr.','Anil',NULL,'Jadhav','1971-01-05','Male','7310','9420861630','5099','anil.jadhav@sganalytics.com','aneeljadhav14@gmail.com','Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi',1,15,83,'Pune',411037,'Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi, Pune - 411037','NA','ANLPJ8471G','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9011035464',NULL,NULL,NULL,NULL,NULL,NULL),(62,'617','EMP0000062',NULL,'Mr.','Harshit',NULL,'Tiwari','1985-04-11','Male','0','9415258837','0','harshit.tiwari@sganalytics.com','harxit@gmail.com','D-109,Divya Nagar Colony, Near MMM Engg College',1,28,120,'Gorakhpur',273001,'C - 402, La Goriosa, Wadgaon Sheri, Pune - 411014','NA','AJCPT7399G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,10,NULL,'8698665598',NULL,NULL,NULL,NULL,NULL,NULL),(63,'620','EMP0000063',NULL,'Mr.','Amit',NULL,'Bansal','1987-04-17','Male','0','9168246460','0','amit.bansal@sganalytics.com','bansalamit17@yahoo.com','53,Krishna Kunj, Mittal Colony, Khoda Ganeshji Road, Madanganj-kishangarh',1,26,105,'Ajmer',305801,'E-3, 504, Ganga Constella,Near Eon IT Park, Kharadi,Pune - 411014','NA','AWGPB8561K','NA','Married ',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL),(64,'626','EMP0000064',NULL,'Mr.','Jayesh',NULL,'Awaghade','1988-10-09','Male','7521','9096332262','0','jayesh.awaghade@sganalytics.com','jayesh.in09@gmail.com','Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road',1,15,83,'Daund',413801,'Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road,Daund, Pune - 413801','NA','APSPA6177P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9762936058',NULL,NULL,NULL,NULL,NULL,NULL),(65,'638','EMP0000065',NULL,'Mr.','Omkar',NULL,'Dhavale','1990-10-07','Male','0','9860200960','0','omkar.dhavale@sganalytics.com','omkardhavale7@gmail.com','9, Mangesh-Shree Apartment, 1464, Sadashiv Peth',1,15,83,'Pune',411030,'9, Mangesh-Shree Apartment, 1464, Sadashiv Peth, Pune - 411030','NA','AKSPD8810F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9860200970',NULL,NULL,NULL,NULL,NULL,NULL),(66,'641','EMP0000066',NULL,'Mr.','Praveen',NULL,'Gaikwad','1983-06-06','Male','0','9823773324','0','praveen.gaikwad@sganalytics.com','praveen248@gmail.com','Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori, Near Muchmore Society',1,15,83,'Pune',411015,'Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori,Landmark:Near Muchmore Society, Pune - 411015','NA','AJCPG8609C','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9225500068',NULL,NULL,NULL,NULL,NULL,NULL),(67,'652','EMP0000067',NULL,'Mr.','Pradeep','Kumar','Gupta','1990-07-20','Male','0','9246630625','0','pradeep.kumar@sganalytics.com','guptakpl@gmail.com','Day & Night Medical Complex Opp Forest Off Srikulam',1,1,5,'Srikakulam',532001,'Day & Night Medical Complex Opp Forest Off Srikulam - 532001','NA','CNPPK8310K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,10,NULL,'9246630625',NULL,NULL,NULL,NULL,NULL,NULL),(68,'659','EMP0000068',NULL,'Mr.','Laxmikant',NULL,'Waghmare','1982-01-26','Male','7341','9867998594','5129','laxmikant.waghmare@sganalytics.com','laxmikant.waghmare@gmail.com','23, Pawanbhumi Layout, Somalwada Wardha Road',1,15,78,'Nagpur',440025,'Flat No-C-803, Etasha Building, S.NO 45/2A, Handewadi Road, Near Ganga Village, Hadapsar - Pune -411028','NA','ABAPW7853L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9970175608',NULL,NULL,NULL,NULL,NULL,NULL),(69,'661','EMP0000069',NULL,'Mr.','Lokendra',NULL,'Bhati','1986-05-09','Male','7288','7836095979','5087','lokendra.bhati@sganalytics.com','calbhati@gmail.com','64/16, Pratap Nagar, Sangaver',1,26,108,'Jaipur',302033,'64/16, Pratap Nagar, Sangaver, Jaipur - 302033','NA','ALOPB7215K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'141',NULL,NULL,NULL,NULL,NULL,NULL),(70,'670','EMP0000070',NULL,'Mr.','Apurv',NULL,'Singh','1989-07-06','Male','7247','9595517568','5047','apurv.singh@sganalytics.com','apurva6789@gmail.com','702, Amber, Nyati Empire, Kharadi',1,15,83,'Pune',411014,'702, Amber, Nyati Empire, Kharadi, Pune -411014','NA','BWGPS2911F','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'9921097686',NULL,NULL,NULL,NULL,NULL,NULL),(71,'676','EMP0000071',NULL,'Mr.','Ranjit',NULL,'Pawar','1985-09-02','Male','0','8879846692','0','ranjit.pawar@sganalytics.com','ranjitsingpawar@gmail.com','36, Netaji Subash Marg, Rambaug',1,14,57,'Indore',452004,'36, Netaji Subash Marg, Rambaug, Indore, M.P - 452004','NA','BOCPP0288N','NA','Unmarried',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9890098286',NULL,NULL,NULL,NULL,NULL,NULL),(72,'684','EMP0000072',NULL,'Mr.','Biswajit',NULL,'Singh(WFH)','1967-11-20','Male','0','9356277025','0','biswajit.singh@sganalytics.com','bswjtsingh@gmail.com','178, New Defence Colony, S.A.S. Nagar',1,25,103,'Zirakpur',140603,'178, New Defence Colony,Zirakpur Dist, S.A.S. Nagar,Punjab ‐ 140603','NA','ARXPS7679D','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9316634166',NULL,NULL,NULL,NULL,NULL,NULL),(73,'696','EMP0000073',NULL,'Miss','Vijaya',NULL,'Rathod','1985-10-22','Female','0','9561588444','0','vijaya.rathod@sganalytics.com','vjraj22@gmail.com','c/o, R.N.Rathod, Rajapeth, Near Tapar Hostel',1,15,67,'Amravati',444606,'c/o, Subramanyam, Flat No 204 B-Wing, Royal Heights, Bhau Patil Road, Pune - 411020 ','NA','AOJPR5526F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,2,NULL,'8888867431',NULL,NULL,NULL,NULL,NULL,NULL),(74,'701','EMP0000074',NULL,'Mr.','Chaitanya',NULL,'Godbole','1989-02-04','Male','0','9702050257','0','chaitanya.godbole@sganalytics.com','chaitanyagodbole4@gmail.com','OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road',1,15,80,'Nashik',422013,'OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road, Nashik 422013','NA','BCFPG7206Q','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9960096857',NULL,NULL,NULL,NULL,NULL,NULL),(75,'703','EMP0000075',NULL,'Mr.','Amrit',NULL,'Sinha','1990-08-09','Male','0','9717544955','0','amrit.sinha@sganalytics.com','ammy.sinha@gmail.com','301 D, Arya Englave, Road No 15, Patel Nagar, Hatia',1,11,37,'Ranchi',834002,'301 D, Arya Englave, Road No 15, Patel Nagar, Hatia, Ranchi - 834002','NA','DFIPS3188K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9890219905',NULL,NULL,NULL,NULL,NULL,NULL),(76,'705','EMP0000076',NULL,'Mr.','Mayur',NULL,'Hore','1983-12-06','Male','7318','9620933222','5107','mayur.hore@sganalytics.com','mayurhore@gmail.com','Shagun, Behind Asian Radio House, Opp Market Yard',1,15,86,'Sangli',416416,'Shagun, Behind Asian Radio House, Opp Market Yard, Sangli- 416416','NA','ABZPH7447L','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9822066913',NULL,NULL,NULL,NULL,NULL,NULL),(77,'706','EMP0000077',NULL,'Mr.','Alwyn',NULL,'Shirodkar','1987-12-01','Male','0','9665809991','0','alwyn.shirodkar@sganalytics.com','design.allwyn@gmail.com','House No 1554, Malawadi, Mangaon',1,15,87,'Kudal',416519,'C/O Degaonkar Sanjay Gangadhar, S.No. 16/3/2, Flat No .B2-102, Shree Apt, Ambegaon Pathar, Pune - 411046','NA','BRIPS7131L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9960393369',NULL,NULL,NULL,NULL,NULL,NULL),(78,'710','EMP0000078',NULL,'Mr.','Sambhaji','(Gopi)','Gaikwad','1988-06-12','Male','0','9552127539','0','NA','NA','Pandergaon',1,15,82,'Gangakhed',431714,'Sarve No 22/11, Thite Vasti, Kharadi, Pune-14','NA','BGLPG7865H','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9763858253',NULL,NULL,NULL,NULL,NULL,NULL),(79,'716','EMP0000079',NULL,'Miss','Ancy',NULL,'Johnson','1992-09-18','Female','0','9179762061','0','ancy.johnson@sganalytics.com','ncjohnson384@gmail.com','F - 19, Chinav Appartment, Harishankar Puram, Lashkar',1,14,55,'Gwalior',0,'F - 19, Chinav Appartment, Harishankar Puram, Lashkar, Gwalior, MP','NA','ASJPJ0976F','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'7507078875',NULL,NULL,NULL,NULL,NULL,NULL),(80,'729','EMP0000080',NULL,'Mr.','Mangesh',NULL,'Dhage','1986-03-05','Male','0','8149010561','0','mangesh.dhage@sganalytics.com','mangeshdhage@gmail.com','AT Post: Sagoda',1,15,70,'Shegaon',444203,'C/o Eknath Sadhu Zurange SN 43 Pathare Thube Nagar Behind Balaji Hospital Kharadi - 411014','NA','ANOPD2213M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'8275022541',NULL,NULL,NULL,NULL,NULL,NULL),(81,'742','EMP0000081',NULL,'Mr.','Siddhartha',NULL,'Dongre','1986-09-17','Male','0','8983333940','0','siddhartha.dongre@sganalytics.com','siddhartha1321@gmail.com','Vishwanath Rajiv Nagar South, Plot No 24, S. No 203/2B, Vimannagar',1,15,83,'Pune',411014,'Vishwanath Rajiv Nagar South, Plot No 24, S.no 203/2B, Vimannagar, Pune - 411014','NA','BACPD6306B','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9423102962',NULL,NULL,NULL,NULL,NULL,NULL),(82,'748','EMP0000082',NULL,'Mr.','Adneya',NULL,'Audhi','1989-12-01','Male','0','9922346278','0','adneya.audhi@sganalytics.com','adneya.audhi@yahoo.com','43 Kranti Society, Sahakar Nagar - 2',1,15,83,'Pune',411009,'43 Kranti Society, Sahakar Nagar - 2, Pune - 411009','NA','ALLPA6763E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9823023660',NULL,NULL,NULL,NULL,NULL,NULL),(83,'750','EMP0000083',NULL,'Mr.','Chetan',NULL,'Pulgam','1986-10-22','Male','5084','8308429280','7224','chetan.pulgam@sganalytics.com','cpulgam@gmail.com','1448 Daji Peth',1,15,88,'Solapur',413005,'1448 Daji Peth, Solapur - 413005','NA','ALSPP1302P','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,26,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9822311544',NULL,NULL,NULL,NULL,NULL,NULL),(84,'751','EMP0000084',NULL,'Mr.','Chandra','Mohan','Reddy Gummireddy','1984-07-04','Male','0','9989244573','0','chandramohan.gummi@sganalytics.com','chandramohanreddy.g@gmail.com','F. No. 304, VSR Classic - B, Road No - 6, KTR Colony, Nizampet',1,1,109,'Hyderabad',500090,'F. No. 304, VSR Classic - B, Road no - 6, KTR Colony, Nizampet, Hyderabad - 500090','NA','AMXPG5831E','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'8500224651',NULL,NULL,NULL,NULL,NULL,NULL),(85,'761','EMP0000085',NULL,'Mr.','Ashish',NULL,'Suwarnkar','1988-09-09','Male','5024','9421921091','7224','ashish.suwarnkar@sganalytics.com','suwarnkar.ashish@gmail.com','G-11, Vishwasagar City, Katpur Road',1,15,79,'Latur',413512,'c/o G.P Railkar Flat No 1, Bldg A-2, Khrishna Leela Terrace, Lane - 4 Mahatma Society, Kothrud - 411038','NA','DMCPS9217J','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9579486785',NULL,NULL,NULL,NULL,NULL,NULL),(86,'768','EMP0000086',NULL,'Mr.','Steve',NULL,'Salvius','1988-03-04','Male','7271','9701431063','5071','steve.salvius@sganalytics.com','stevesalvius@gmail.com','310, Ajay Park, Najafgarh',1,15,17,'New Delhi',110043,'310, Ajay Park, Najafgarh, New Delhi - 110043','NA','CLDPS3830E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9899232883',NULL,NULL,NULL,NULL,NULL,NULL),(87,'786','EMP0000087',NULL,'Mrs.','Megha',NULL,'Sharma','1987-04-19','Female','7265','9545591133','5065','megha.sharma@sganalytics.com','meghasharmajain@gmail.com','2223, Sevda Bhawani, Above Shop No 376',1,26,108,'Jaipur',302001,'B-33 Mount N glory, Near Eon it Park, Kharadi, Pune ','NA','FDVPS2342E','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'9769965114',NULL,NULL,NULL,NULL,NULL,NULL),(88,'788','EMP0000088',NULL,'Mr.','Aakash',NULL,'Singh','1990-11-21','Male','0','8237822534','0','aakash.singh@sganalytics.com','aakash21singh@gmail.com','B-127, D-1, Behind Petrol Pump',1,14,52,'Nepanagar',450221,'304, B9, Mangal Bhairav, Nandeo City, Pune -411041','NA','DXJPS9947D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9623656966',NULL,NULL,NULL,NULL,NULL,NULL),(89,'799','EMP0000089',NULL,'Mr.','Vijay',NULL,'Baviskar','1985-08-04','Male','0','9764462436','0','vijay.baviskar@sganalytics.com','vjbaviskar@gmail.com','Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar',1,15,83,'Pune',411032,'Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar, Pune - 411032','NA','ASJPB7504M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9823232635',NULL,NULL,NULL,NULL,NULL,NULL),(90,'801','EMP0000090',NULL,'Mr.','Sagar',NULL,'Kamire','1980-10-10','Male','7250','8087594018','5050','sagar.kamire@sganalytics.com','kamiresagar@gmail.com','Dnyan Laxmi Appartment, Flat No 10, Rajarampuri 8th Lane',1,15,75,'Kolhapur',0,'Shree Laxmi Chaya Apppartment, Flat No 301, A Wing, Malwadi Hadapsar Pune.','NA','AVDPK7092A','NA','Married ',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'9096765011',NULL,NULL,NULL,NULL,NULL,NULL),(91,'802','EMP0000091',NULL,'Mr.','Amit',NULL,'Sangewar','1986-03-29','Male','0','9975133344','0','amit.sangewar@sganalytics.com','amitsangewar@rediffmail.com','Pimple Sadan F/1, Near PCMC School, Kasarwadi',1,15,83,'Pune',411034,'Pimple Sadan F/1, Near PCMC School, Kasarwadi Pune - 411034','NA','BJRPS9075C','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'9970786341',NULL,NULL,NULL,NULL,NULL,NULL),(92,'803','EMP0000092',NULL,'Miss','Safa',NULL,'Burney','1989-12-26','Female','7312','9960840994','5101','safa.burney@sganalytics.com','safaburney@gmail.com','A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar',1,15,83,'Pune',411013,'A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar, Pune - 411013','NA','BKTPB8073Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,10,NULL,'9423039974',NULL,NULL,NULL,NULL,NULL,NULL),(93,'809','EMP0000093',NULL,'Miss','Prerna',NULL,'Rawal','1991-01-08','Female','0','9922574319','0','prerna.rawal@sganalytics.com','prerna.r1@gmail.com','B1,101, Prasad Nagar, Wadgaon Sheri',1,15,83,'Pune',411014,'B1, 101, Prasad Nagar, Wadgaon Sheri, Pune - 411014','NA','BYAPR1750D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9881548405',NULL,NULL,NULL,NULL,NULL,NULL),(94,'811','EMP0000094',NULL,'Mr.','Asad',NULL,'Qureshi','1987-06-28','Male','0','9975386368','0','asad.qureshi@sganalytics.com','asad.asad123@rediffmail.com','493, Kuresh Nagar, Near Ismail Building, Khadki',1,15,83,'Pune',411003,'493, Kuresh Nagar, Near IsmailBuilding, Khadki, Pune - 411003','NA','AAIPQ2593E','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'8087860656',NULL,NULL,NULL,NULL,NULL,NULL),(95,'812','EMP0000095',NULL,'Mr.','Mahendra',NULL,'Nikam','1986-12-02','Male','7374','9833452265','5152','mahendra.nikam@sganalytics.com','mahindra.nikam@gmail.com','80, Gurudatta Colony, A/P Tal Shirpur',1,15,72,'Dhule',425405,'C/O Nitin Nikam, 27/09, Pratik Society, Paud Road, Pune -  38','NA','AKQPN1603G','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9766058800',NULL,NULL,NULL,NULL,NULL,NULL),(96,'814','EMP0000096',NULL,'Mr.','Bhargav',NULL,'Pandya','1991-05-03','Male','0','9673706401','0','bhargav.pandya@sganalytics.com','bhargav.pandya003@gmail.com','61, Shubham Row House, Near Saraswati School, Honey Park Road, Adajan',1,7,22,'Surat',395009,'Sr no 48/4, Flat no 303, Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri, Pune - 411014','NA','BCWPP1537L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9377600756',NULL,NULL,NULL,NULL,NULL,NULL),(97,'816','EMP0000097',NULL,'Mr.','Jitendra',NULL,'Nikam','1983-05-31','Male','0','9769976005','0','jitendra.nikam@sganalytics.com','jpnikam@yahoo.com','25 - A, Arunoday Colony, Chopda',1,15,73,'Jalgaon',425107,'Lane no 4, House no 4, Madhuban Society, Old Sanghavi, Pune - 27','NA','AGDPN3585G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9975627261',NULL,NULL,NULL,NULL,NULL,NULL),(98,'817','EMP0000098',NULL,'Mr.','Anas',NULL,'Patel','1989-03-14','Male','7241','9819402080','5041','anas.patel@sganalytics.com','anaspatel89@yahoo.com','22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104',1,15,77,'Mumbai',400008,'22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104, Mumbai - 400008','NA','ARTPP7285J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9892560707',NULL,NULL,NULL,NULL,NULL,NULL),(99,'825','EMP0000099',NULL,'Mrs.','Parminder',NULL,'Kaur','1969-08-31','Female','0','9921755899','0','parminder@sganalytics.com','parmindersimikaur@gmail.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,15,83,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','NA','AMJPK8117B','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9890016447',NULL,NULL,NULL,NULL,NULL,NULL),(100,'827','EMP0000100',NULL,'Mr.','Yogesh','Kr','Singh','1983-08-01','Male','7218','7387088388','5018','yogesh.singh@sganalytics.com','yksingh567@gmail.com','Vill & Post - Kanta, District - Chandavali',1,28,125,'Varanasi',0,'Vill & Post - Kanta, District - Chandavali, Varanasi - UP','NA','BEKPS5421L','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9005840363',NULL,NULL,NULL,NULL,NULL,NULL),(101,'830','EMP0000101',NULL,'Mr.','Dhir',NULL,'Patwa','1990-10-25','Male','7317','9833884531','5106','dhir.patwa@sganalytics.com','patwa.dhir@gmail.com','E/13, Rishikesh CHS, Evershine Nagar, Malad West',1,15,77,'Mumbai',400064,'E/13, Rishikesh CHS, Evershine Nagar, Malad west, Mumbai - 400064','NA','BOYPP4836C','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9323787069',NULL,NULL,NULL,NULL,NULL,NULL),(102,'831','EMP0000102',NULL,'Mr.','Tushar','Ranjan','Senapati','1982-06-02','Male','7244','9000543563','5044','tushar.senapati@sganalytics.com','tushar115@gmail.com','AT / PO - Kuha',1,24,97,'Bhubaneshwar',751002,'AT / PO - Kuha, Dist - Khurda, Bhubaneswar - 751002','NA','BXCPS8772H','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9731304806',NULL,NULL,NULL,NULL,NULL,NULL),(103,'832','EMP0000103',NULL,'Mr.','Tushar',NULL,'Patil','1990-05-22','Male','0','8149605963','0','tushar.patil@sganalytics.com','tusharpatil.98@gmail.com','Flat no 404, Omkar Swaroop Society, Narayangaon, Junnar',1,15,83,'Pune',410504,'B - 19, C Building, kate Residency, Dapodi, Pune - 411012','NA','BHYPP9525M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9158613333',NULL,NULL,NULL,NULL,NULL,NULL),(104,'833','EMP0000104',NULL,'Mr.','Harshad',NULL,'Solanki','1991-10-04','Male','7259','8087463665','5059','harshad.solanki@sganalytics.com','harshads74@gmail.com','1680, R.S.Kedari Road, Camp',1,15,83,'Pune',411001,'1680, R.S.Kedari Road, Camp, Pune - 411001','NA','EOVPS8725B','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'8793323336',NULL,NULL,NULL,NULL,NULL,NULL),(105,'834','EMP0000105',NULL,'Mr.','Jayesh',NULL,'Tare','1989-03-31','Male','7378','9981354260','5155','jayesh.tare@sganalytics.com','jayeshtr@yahoo.com','43-B, Vandana Nagar',1,14,57,'Indore',452001,'43-B, Vandana Nagar, Ext Indore, M.P 452001','NA','AQHPT1083B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9827685443',NULL,NULL,NULL,NULL,NULL,NULL),(106,'835','EMP0000106',NULL,'Mr.','Srobon',NULL,'Banerjee','1987-04-06','Male','7287','9590827779','5086','srobon.banerjee@sganalytics.com','srobon@gmail.com','174/10, Netaji Subhas Chandra Bose Road, Kanak Apartment, Flat - A-4',1,30,131,'Kolkata',700040,'A-104, ND, Ascent Apartment, Singasandra Aecs, Layout - A Block - Bangalore - 560068','NA','ARBPB3810D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9742388658',NULL,NULL,NULL,NULL,NULL,NULL),(107,'839','EMP0000107',NULL,'Mr.','Vipul',NULL,'Verma','1990-07-18','Male','7314','9867927653','5130','vipul.verma@sganalytics.com','vipulverma18@gmail.com','117/Q/169, Manoram Kunj, near Sardar Patel Public School, Sharda Nagar',1,28,121,'Kanpur',208025,'117/Q/169, Manoram Kunj, near Sardar Patel Public School,Sharda Nagar, Kanpur - 208025','NA','AJLPV7155M','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'9450137120',NULL,NULL,NULL,NULL,NULL,NULL),(108,'841','EMP0000108',NULL,'Mr.','Ramanath',NULL,'Mahindrakar','1989-05-05','Male','0','9421151705','0','ramanath.mahindrakar@sganalytics.com','mahindrakarpawan@gmail.com','Laxmi Niwas, Ward No. 4, H.No. 148/52, Durgabhat, Ponde',1,6,19,'Goa',403401,'Brahma Majestic, E-502, near Bakers point, NIBM road, Wanowrie, Pune - Maharashtra','NA','BKYPM1873Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9421243029',NULL,NULL,NULL,NULL,NULL,NULL),(109,'842','EMP0000109',NULL,'Miss','Khushboo',NULL,'Manka','1992-10-20','Female','0','9902524670','0','khushboo.manka@sganalytics.com','khushboomanka3@gmail.com','Bhawani distributors, main road, Jugsalai',1,11,36,'Jamshedpur',831000,'Bhawani distributors, main road, Jugsalai, Jamshedpur, Jharkhand - 831000','NA','BYAPM6813N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9572597747',NULL,NULL,NULL,NULL,NULL,NULL),(110,'843','EMP0000110',NULL,'Miss','Neha',NULL,'Sangtani','1991-05-21','Female','0','9901519909','0','neha.sangtani@sganalytics.com','neha.sangtani@gmail.com','Block NO.13, Kachnar Residency, Napier Town ',1,14,58,'Jabalpur',482001,'Block NO.13, Kachnar Residency, Napier Town , Jabalpur, Madhya Pradesh-482001','NA','FPAPS9025B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'7389559719',NULL,NULL,NULL,NULL,NULL,NULL),(111,'844','EMP0000111',NULL,'Mr.','Chiranjeevi',NULL,'Choudhary','1993-01-23','Male','0','8308680761','0','chiranjeevi.choudhary@sganalytics.com','chiranjeevi.2301@gmail.com','Rajendra Bhawan, Bose press gali, Puran chand lane, Kalyani chowk',1,3,12,'Muzaffarpur',0,'Rajendra Bhawan, Bose press gali, Puran chand lane,Kalyani chowk, Muzaffarpur, Bihar','NA','AZCPC0794J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9901521868',NULL,NULL,NULL,NULL,NULL,NULL),(112,'845','EMP0000112',NULL,'Mr.','Milan',NULL,'Malkiya','1989-08-12','Male','0','9845931521','0','milan.malkiya@sganalytics.com','milanmalkiya07et858@gmail.com','14, Rupam society, Part - 3, Hirabaug, A.K Road',1,7,22,'Surat',395008,'14, Rupam society, Part - 3, hirabaug, A.K road, Surat, Gujarat, India - 395008','NA','BCBPM7050G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'8000038088',NULL,NULL,NULL,NULL,NULL,NULL),(113,'846','EMP0000113',NULL,'Mr.','Anup',NULL,'Kulkarni','1989-09-30','Male','7294','8600500335','5093','anup.kulkarni@sganalytics.com','k.anupkulkarni@gmail.com','Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad',1,15,83,'Pune',411033,'Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad, Pune- 411033','NA','BXZPK2725F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'7745881149',NULL,NULL,NULL,NULL,NULL,NULL),(114,'847','EMP0000114',NULL,'Miss','Nivedita',NULL,'Snehi','1991-09-06','Female','0','9739469656','0','nivedita.snehi@sganalytics.com','niveditasnehi@gmail.com','#6/4, 2nd main, 4th cross, Govindnagar',1,12,42,'Bengaluru',560040,'#6/4, 2nd main, 4th cross, Govindnagar, Bangalore - 560040','NA','EMSPS0469B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9739469656',NULL,NULL,NULL,NULL,NULL,NULL),(115,'849','EMP0000115',NULL,'Mr.','Mayur',NULL,'Deshmukh','1990-05-02','Male','0','7218369496','0','mayur.deshmukh@sganalytics.com','mayurdeshmukh6001@gmail.com','A-605, Elite Homes, Near Akshara International School, Tathwade',1,15,83,'Pune',411033,'A-605, Elite Homes, Near Akshara International School, Tathwade Pune - 411033','NA','AVXPD6098D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,10,NULL,'8390048989',NULL,NULL,NULL,NULL,NULL,NULL),(116,'852','EMP0000116',NULL,'Mr.','Akshay',NULL,'Bhansali','1992-06-03','Male','0','9503629988','0','akshay.bhansali@sganalytics.com','akshaybhansali03@gmail.com','A-98, Satyapuram society, Saswad road, Phursungi',1,15,83,'Pune',412308,'A-98, Satyapuram society, Pune, Saswad road, Phursungi, Pune-412308','NA','AZBPB2313F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9850129505',NULL,NULL,NULL,NULL,NULL,NULL),(117,'854','EMP0000117',NULL,'Miss','Rupali',NULL,'Helambe','1989-07-05','Female','0','9987055182','0','rupali.helambe@sganalytics.com','rupali.helambe5@gmail.com','B/6, Vishaka Apt, Nandanvan Colony',1,15,68,'Aurangabad',0,'B/6, Vishaka Apt, Nandanvan Colony, Aurangabad','NA','AFJPH2459A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9423151209',NULL,NULL,NULL,NULL,NULL,NULL),(118,'856','EMP0000118',NULL,'Mr.','Raunak',NULL,'Rathi','1989-07-14','Male','7356','8600273375','5115','raunak.rathi@sganalytics.com','raunakplc@gmail.com','Bus stand road',1,15,66,'Akot',0,'Flat No. 101 , Saptarshi Apartment, DSK Vishwa, Dhayari, Pune','NA','BCPPR2284F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9423424316',NULL,NULL,NULL,NULL,NULL,NULL),(119,'866','EMP0000119',NULL,'Mr.','Pritam','Kumar','Sarkar','1988-04-15','Male','7313','9239030788','5102','pritam.sarkar@sganalytics.com','sarkar_pritam2007@yahoo.co.in','Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur',1,30,131,'Kolkata',700127,'Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur, Kolkata - 700127','NA','BLUPS3158K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,3,NULL,'8981346526',NULL,NULL,NULL,NULL,NULL,NULL),(120,'872','EMP0000120',NULL,'Mr.','Shanu',NULL,'Dhamija','1989-10-30','Male','0','7755901560','0','shanu.dhamija@sganalytics.com','dhamija_shanu@yahoo.com','H.No.- 569, Adarsh Colony, Samadhi road',1,25,102,'Khanna',141401,'H.No.- 569, Adarsh Colony, Samadhi road, Khanna - 141401 (PB)','NA','ARXPD0174A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9814100660',NULL,NULL,NULL,NULL,NULL,NULL),(121,'875','EMP0000121',NULL,'Mr.','Pavan','Kumar','Yadav','1992-07-09','Male','0','7045566357','0','pavan.yadav@sganalytics.com','pavank721.ind@gmail.com','40AA/259 Sainik Nagar, Rajpur Chungi',1,28,116,'Agra',282001,'40AA/259 Sainik Nagar, Rajpur Chungi, Agra - 282001','NA','ALMPY9011A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,1,NULL,'9793722550',NULL,NULL,NULL,NULL,NULL,NULL),(122,'883','EMP0000122',NULL,'Mr.','Sameer',NULL,'Inamdar','1989-12-03','Male','0','9921850311','0','sameer.inamdar@sganalytics.com','inamdar.sam17@gmail.com','At Post BIBI, Darphal Tal, North Solapur Dist',1,15,88,'Solapur',413222,'Sr No 14, Shankar Maharaj Vasahat, Chavan nagar, Dhankwadi, Pune - 43','NA','ABZPI4316F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9890582743',NULL,NULL,NULL,NULL,NULL,NULL),(123,'891','EMP0000123',NULL,'Miss','Ritu',NULL,'Singh','1987-08-30','Female','0','7743819118','0','ritu.singh@sganalytics.com','ritu.singh@siib.ac.in','32- Kabir envclave Dayalbagh',1,28,116,'Agra',282005,'32- Kabir envclave Dayalbagh, Agra - 282005, UP','NA','CERPS9466R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9837279605',NULL,NULL,NULL,NULL,NULL,NULL),(124,'892','EMP0000124',NULL,'Miss','Nikita',NULL,'Madan','1992-02-25','Female','7292','7743819116','5091','nikita.madan@sganalytics.com','nikita.madan@siib.ac.in','1404, Sector A, Pocket B and C, Vasant Kunj',1,5,17,'New Delhi',110070,'1404, Sector A, Pocket B and C, Vasant Kunj, New Delhi - 110070','NA','BIDPM4258A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:03','2017-09-19 05:21:03',NULL,NULL,NULL,NULL,NULL,NULL,'9968292599',NULL,NULL,NULL,NULL,NULL,NULL),(125,'895','EMP0000125',NULL,'Miss','Prachi',NULL,'Gandhi','1991-03-29','Female','0','9028796816','0','prachi.gandhi@sganalytics.com','prachigandhi29@gmail.com','A 1/2, Agrasen Society, 8 Koregaon Park',1,15,83,'Pune',411001,'A 1/2, Agrasen Society, 8 Koregaon Park, Pune - 411001','NA','AYYPG9090L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9326695007',NULL,NULL,NULL,NULL,NULL,NULL),(126,'897','EMP0000126',NULL,'Miss','Radhika',NULL,'Khetan','1991-10-08','Female','0','9405429151','0','radhika.khetan@sganalytics.com','radhikakhetan812@gmail.com','Near Z.P. School, At. Po. Thiloni Ta. Duryapoor',1,15,67,'Amravati',0,'Rakshaknagar phase 2, o/p durgamandir between Radison hotel &Kharadi bypass, Kharadi','NA','CKRPK7573B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9271260102',NULL,NULL,NULL,NULL,NULL,NULL),(127,'902','EMP0000127',NULL,'Mr.','Vipul',NULL,'Babbar','1990-06-13','Male','0','9828482572','0','vipul.babbar@sganalytics.com','vipul.excellere@gmail.com','E-42, Ram Nagar Extension, Sodala',1,26,108,'Jaipur',302006,'E-42, Ram Nagar Extension, Sodala, Jaipur 302006','NA','ARRPB0444P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,7,NULL,'9983759950',NULL,NULL,NULL,NULL,NULL,NULL),(128,'904','EMP0000128',NULL,'Mrs.','Shweta',NULL,'Gogawale','1987-12-03','Female','0','9766656645','0','shweta.gogawale@sganalytics.com','shwetagogawale@gmail.com','Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri',1,15,83,'Pune',411014,'Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri, Pune - 411014','NA','ARYPG6943R','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,2,NULL,'9766654632',NULL,NULL,NULL,NULL,NULL,NULL),(129,'909','EMP0000129',NULL,'Mr.','P.T. Satya',NULL,'Kishore','1984-08-12','Male','7281','9618436234','5080','satya.pt@sganalytics.com','ptskishore2012@gmail.com','P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla',1,1,9,'Indepalligudem',0,'P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla, Indepalligudem, West Godavari (Dist) Andhra Pradesh','NA','CZCPS0472F','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'8008903642',NULL,NULL,NULL,NULL,NULL,NULL),(130,'913','EMP0000130',NULL,'Mr.','Amit',NULL,'Kathar','1991-10-24','Male','0','9637537515','0','amit.kathar@sganalytics.com','amitkathar24@gmail.com','Rajdurg 3 Mayadevi nagar, Mahabal Road',1,15,73,'Jalgaon',425001,'Pritam residency, near Anaod park bus stop, Wadgaon sheri, Pune','NA','DUCPK5384N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9552595995',NULL,NULL,NULL,NULL,NULL,NULL),(131,'915','EMP0000131',NULL,'Mr.','Ramesh','Babu','Kopparthi','1988-08-18','Male','0','9702483177','0','ramesh.kopparthi@sganalytics.com','kramesh.finance@gmail.com','D.no: 27-3-71, Nethaji street, Srirampuram',1,1,9,'Bhimavaram',534202,'D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2, Andhra Pradesh - 534202','NA','CBUPK9760N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9885019293',NULL,NULL,NULL,NULL,NULL,NULL),(132,'916','EMP0000132',NULL,'Mr.','Vijish','Haridasan','Kottarapat','1989-05-23','Male','0','8097178190','0','vijish.kottarapat@sganalytics.com','vijishkh@gmail.com','204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)',1,15,77,'Mumbai',0,'204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)','NA','AXGPK9131M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'8652284525',NULL,NULL,NULL,NULL,NULL,NULL),(133,'917','EMP0000133',NULL,'Miss','Samiya',NULL,'Ayaz','1993-11-20','Female','0','7350408883','0','samiya.ayaz@sganalytics.com','samiya_siddiqui@hotmail.com','F- 603, Shefalika Heights, Near Kinara Hotel, Shivtrinagar, Kothrud',1,15,83,'Pune',411038,'F- 603, Shefalika Heights, near Kinara Hotel, Shivtrinagar, Kothrud, Pune, Maharashtra - 411038','NA','BBIPA4160P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'8975771000',NULL,NULL,NULL,NULL,NULL,NULL),(134,'918','EMP0000134',NULL,'Mr.','Soumya','Prakash','Jena','1993-11-03','Male','0','8087023571','0','soumya.jena@sganalytics.com','sjena44@gmail.com','PWD/LA/55, Industrial Estate',1,24,100,'Rourkela',0,'Flat No 11, f wing, Wanjale patil Heritage, Kondhwa dhawade, NDA Road, Pune','NA','AXEPJ1959N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9657478858',NULL,NULL,NULL,NULL,NULL,NULL),(135,'924','EMP0000135',NULL,'Mr.','Sourabh',NULL,'Kulkarni','1985-04-21','Male','0','9823990793','0','sourabh.kulkarni@sganalytics.com','sourabh_kul21@yahoo.co.in','E - 6, Rounak Residency, Mayur Colony, Kothrud',1,15,83,'Pune',411038,'E - 6, Rounak Residency, Mayur colony, Kothrud, Pune - 38','NA','BHRPK4752L','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9225631079',NULL,NULL,NULL,NULL,NULL,NULL),(136,'925','EMP0000136',NULL,'Miss','Farheen',NULL,'Rahman','1992-06-20','Female','0','9939671927','0','farheen.rahman@sganalytics.com','farheenrahman2008@gmail.com','H. No - A11, Fazal Manzil, New Tiwari Tankroad',1,11,37,'Ranchi',0,'Flat No 16, Building No - 9, Laxmi Narayan nagar society, Opp. Mukherjee udyan, Erandvana, Pune','NA','BYAPR7860J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9939671927',NULL,NULL,NULL,NULL,NULL,NULL),(137,'929','EMP0000137',NULL,'Mr.','Sunil',NULL,'Dhake','1988-05-10','Male','0','7028263881','0','sunil.dhake@sganalytics.com','dhakesid@gmail.com','Flat No. 18, Prabhu Square, Deepali Nagar, Mumbai Naka',1,15,80,'Nashik',0,'Flat No. 18, Prabhu square, Deepali Nagar, Mumbai Naka, Nashik','NA','AKIPD7844B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,3,NULL,'9890028505',NULL,NULL,NULL,NULL,NULL,NULL),(138,'931','EMP0000138',NULL,'Mr.','Rishabh',NULL,'Nigam','1988-11-15','Male','1006','8793375243','0','rishabh.nigam@sganalytics.com','rishabh.nigam1511@gmail.com','Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad',1,15,83,'Pune',411041,'Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad - 411041','NA','AJLPN3876H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8692170294',NULL,NULL,NULL,NULL,NULL,NULL),(139,'933','EMP0000139',NULL,'Mr.','Naim',NULL,'Mahipal','1992-06-16','Male','0','9716640166','0','naim.mahipal@sganalytics.com','naimmahipal2012@gmail.com','Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi',1,8,NULL,'Fatehabad',125053,'Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi, Fatehabad, Harayana - 125053','NA','CQBPM2850F','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,2,NULL,'9599504246',NULL,NULL,NULL,NULL,NULL,NULL),(140,'936','EMP0000140',NULL,'Mr.','Susshruth',NULL,'Apshankar','1971-05-28','Male','7373','8380073727','5167','susshruth.apshankar@sganalytics.com','sapshankar@hotmail.com','303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park',1,15,83,'Pune',411001,'303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park, Pune - 411001','NA','AKWPA0122F','NA','Married',3,5,1,NULL,'NA','NA','Active',1,NULL,1,1,24,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 06:16:30',NULL,NULL,NULL,NULL,NULL,NULL,'8380093727',NULL,NULL,NULL,NULL,NULL,NULL),(141,'940','EMP0000141',NULL,'Mrs.','Sneha',NULL,'Deshpande','1988-10-29','Female','0','9822593350','0','sneha.deshpande@sganalytics.com','sneha.a.deshpande@gmail.com','#41, Sunflower Building, Neco Garden, Viman Nagar',1,15,83,'Pune',411014,'#41, Sunflower Building, Neco Garden, Viman Nagar, Pune- 411014','NA','AOIPD5779B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9822590206',NULL,NULL,NULL,NULL,NULL,NULL),(142,'943','EMP0000142',NULL,'Miss','Shakshi',NULL,'Yadav','1991-09-23','Female','0','9845305050','0','shakshi.yadav@sganalytics.com','sakshiyadav23@gmail.com','H/O Sundarkali Yadav, Near Samzhana Hotel',NULL,17,NULL,'Birgunj',44301,'BT Kawade Road, Suchandra corner, B-18, Pune','NA','AMHPY6293L','NA','Unmarried',3,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,3,NULL,'977845305050',NULL,NULL,NULL,NULL,NULL,NULL),(143,'945','EMP0000143',NULL,'Mrs.','Tripti','Rastogi','Vishnoi','1986-06-19','Female','0','9582218398','0','tripti.vishnoi@sganalytics.com','tripti.rastogi1@gmail.com','C - 79, Nirala Nagar',1,28,122,'Lucknow',226020,'A-205, Nandan Euphora, Near Kumar Samrudhi Housing Society, Vishrantwadi, Pune - 411015','NA','AMPPR6894L','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7774037189',NULL,NULL,NULL,NULL,NULL,NULL),(144,'952','EMP0000144',NULL,'Mr.','Salman',NULL,'Khan','1990-12-31','Male','0','8291374292','0','salman.khan@sganalytics.com','samkhan44@yahoo.com','Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west',1,15,77,'Mumbai',400086,'Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west, Mumbai - 400086','NA','BEFPK9131N','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'7738205600',NULL,NULL,NULL,NULL,NULL,NULL),(145,'964','EMP0000145',NULL,'Mr.','Dharit',NULL,'Chokshi','1991-10-13','Male','0','9945313311','0','dharit.chokshi@sganalytics.com','dharit99@gmail.com','10, Vasupujya Flats, Amul Society, New Sharda Mandir road, Sukhipura, Paldi',1,7,20,'Ahmedabad',380007,'10, Vasupujya flats, amul society, New Sharda Mandir road, Sukhipura, Paldi - Ahemdabad 380007','NA','NA','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,10,NULL,'9879200147',NULL,NULL,NULL,NULL,NULL,NULL),(146,'967','EMP0000146',NULL,'Mr.','Manas','Kumar','Raul','1983-06-05','Male','7225','9890296764','5025','manas.raul@sganalytics.com','manas123raul@yahoo.co.in','LIG 12, S.P.A Colony Chudcos, Bagdhiya, Baripada',1,24,98,'Takatpur',757003,'Flat C - 401, Krishna Residency, SUS - Pashan Road , Sai Chowk, Pashan,Pune = 411021','NA','ALCPR5933L','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,8,NULL,'9960613531',NULL,NULL,NULL,NULL,NULL,NULL),(147,'968','EMP0000147',NULL,'Mr.','Nishant',NULL,'Narad','1989-11-01','Male','0','9021310965','0','nishant.narad@sganalytics.com','nishi61755@yahoo.com','Walni, Th - Saoner',1,15,78,'Nagpur',0,'Yash Society, B - Wing, 35#, Behind CNG Pump, Paud Road, Kothrud, Pune','NA','AQAPN5796J','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7709573222',NULL,NULL,NULL,NULL,NULL,NULL),(148,'972','EMP0000148',NULL,'Mr.','Sunil','Kumar','Parimi','1985-07-13','Male','7282','9703596999','5081','sunil.parimi@sganalytics.com','sunilkumar_nani@gmail.com','Pedamuthevi (post)',1,1,3,'Movva',521136,'Pedamuthevi (post), Movva (MD), Krishna (DT), Pin - 521136','NA','BDDPP8794H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'8897796999',NULL,NULL,NULL,NULL,NULL,NULL),(149,'973','EMP0000149',NULL,'Mr.','Prasad',NULL,'Jagtap','1989-01-27','Male','7359','7276890909','0','prasad.jagtap@sganalytics.com','jagtap.prasad@outlook.com','55 / 66, Shiv colony',1,15,73,'Jalgaon',425001,'B- 905, Umag Premiere, Ivy Estate, Wagholi, Pune - 410227','NA','AMGPJ0531P','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,8,NULL,'9028241242',NULL,NULL,NULL,NULL,NULL,NULL),(150,'977','EMP0000150',NULL,'Mr.','Apurv',NULL,'Mahajan','1990-01-11','Male','0','8793845745','0','apurva.mahajan@sganalytics.com','apurvmahajan1@gmail.com','Plot No. 189, Flat No. 10, Anant Apt, Jyoti Nagar',1,15,68,'Aurangabad',0,'B- 501, Swaminarayan Apt, Near Suncity, Off Sinhgad road, Vadgaon, Pune - 411041','NA','BNWPM5837M','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9766165651',NULL,NULL,NULL,NULL,NULL,NULL),(151,'978','EMP0000151',NULL,'Mr.','Ashish',NULL,'Dongre','1988-01-30','Male','0','8087673282','0','ashish.dongre@sganalytics.com','ashish.dongre88@gmail.com','Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar',1,15,83,'Pune',411028,'Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar, Pune - 411028','NA','BEDPD1656R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9623797986',NULL,NULL,NULL,NULL,NULL,NULL),(152,'979','EMP0000152',NULL,'Mr.','Deep',NULL,'Gada','1991-12-16','Male','0','9824207676','0','deep.gada@sganalytics.com','deepgada05@gmail.com','301, Avadhpuri Apt, 80 feet road',1,7,21,'Veraval',362266,'301, Avadhpuri Apt, 80 feet road, Veraval - 362266','NA','AYIPG3156D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9824207676',NULL,NULL,NULL,NULL,NULL,NULL),(153,'980','EMP0000153',NULL,'Mr.','Kaustubh',NULL,'Joshi','1990-09-11','Male','0','8149966205','0','kaustubh.joshi@sganalytics.com','kautubhjoshi45@gmail.com','Taranjan Bunglow, Abhinavnagar',1,15,65,'Sangamner',422605,'Flat No. 14, Pushpa Apt, Vanaz corner, Kothrud, Pune - 411038','NA','ANPPJ5041G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'8087281500',NULL,NULL,NULL,NULL,NULL,NULL),(154,'981','EMP0000154',NULL,'Miss','Mitisha',NULL,'Gupta','1990-04-06','Female','0','9993554500','0','mitisha.gupta@sganalytics.com','mitisha_g@yahoo.com','121, Pandrinath Path Ada Bazar',1,14,57,'Indore',452004,'121, Pandrinath path Ada Bazar, Indore ( M.P.)- 452004','NA','AQEPG153Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9993554500',NULL,NULL,NULL,NULL,NULL,NULL),(155,'982','EMP0000155',NULL,'Mr.','Prinkesh','Kumar','Giri','1991-10-27','Male','0','7276496585','0','prinkesh.giri@sganalytics.com','prinkeshgiri@gmail.com','E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Arera Colony',1,14,51,'Bhopal',0,'E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Areracolony Bhopal (MP)','NA','BCUPG1337B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9752655392',NULL,NULL,NULL,NULL,NULL,NULL),(156,'983','EMP0000156',NULL,'Miss','Radhika',NULL,'Bajaj','1993-12-19','Female','0','9960509806','0','radhika.bajaj@sganalytics.com','i.radhika.bajaj@gmail.com','589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury Park',1,15,83,'Pune',411037,'589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury park, Pune - 37','NA','BMJPB2481E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9405023507',NULL,NULL,NULL,NULL,NULL,NULL),(157,'987','EMP0000157',NULL,'Mr.','Shantanu',NULL,'Jana','1988-06-25','Male','0','9434432791','0','shantanu.jana@sganalytics.com','shantanu.jana14@gmail.com','Roypara road govt housing estate, Block - I, Flat No. 5',1,30,131,'Kolkata',700050,'Roypara road govt housing estate, Block - I, Flat No. 5, Kolkata - 700050','NA','AOLPJ9106R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,2,NULL,'9434432791',NULL,NULL,NULL,NULL,NULL,NULL),(158,'989','EMP0000158',NULL,'Mr.','Manoj',NULL,'Dhiware','1986-01-12','Male','7551','9096049888','0','manoj.dhiware@sganalytics.com','MNJdhiware@gmail.com','Plot no . 93/94, \'Siddhi\' Niwas, Nivara Nagari, Behind Dongre Hospital, Ldgaon Road',1,15,68,'Vaijapur',423701,'SR No. 253/2/3A/2, Bunglow No. 3, near Kumar Bakery, officers mess, Lohegaon Road, Khere Park, Pune - 411032','NA','AYUPD9261C','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9623697135',NULL,NULL,NULL,NULL,NULL,NULL),(159,'991','EMP0000159',NULL,'Mr.','Sumit',NULL,'Lakhina','1989-06-05','Male','0','9971692020','0','sumit.lakhina@sganalytics.com','sumit.tuff@gmail.com','90/25 A, 1st Floor Malviya Nagar',1,5,17,'New Delhi',0,'90/25 A, 1st Floor Malviya Nagar, New Delhi','NA','EDWPS5924L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9466555817',NULL,NULL,NULL,NULL,NULL,NULL),(160,'996','EMP0000160',NULL,'Mr.','Ganesh',NULL,'Konar','1991-09-12','Male','7319','9768590273','5108','ganesh.konar@sganalytics.com','ganeshkonar18@gmail.com','9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate, Thane',1,15,89,'Thane',400604,'9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate , Thane -n 400604','NA','BIKPK9855J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9892495585',NULL,NULL,NULL,NULL,NULL,NULL),(161,'1001','EMP0000161',NULL,'Mr.','Mitesh',NULL,'Oswal','1983-10-31','Male','0','8698619998','0','mitesh.oswal@sganalytics.com','oswal.mitesh@gmail.com','B- 502/ Eisha Pearl, Kondhwa BK',1,15,83,'Pune',411048,'B- 502/ Eisha Pearl, Kondhwa BK, Pune - 48','NA','AAIPO8158K','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8421644704',NULL,NULL,NULL,NULL,NULL,NULL),(162,'1002','EMP0000162',NULL,'Miss','Ruchi',NULL,'Srivastava','1991-05-23','Female','0','9765453933','0','ruchi.srivastava@sganalytics.com','ruchi.m44@gmail.com','10/517, Khalasi Line',1,28,121,'Kanpur',208001,'Flat - E, 904, Splendour County, Behind Wageshwar Termple, Wagholi, Loh Road, Pune','NA','DJKPS8929G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,3,NULL,'9532997887',NULL,NULL,NULL,NULL,NULL,NULL),(163,'1003','EMP0000163',NULL,'Mr.','Jitesh',NULL,'Rane','1990-04-18','Male','7339','9930735980','5127','jitesh.rane@sganalytics.com','jitesh.rane@hotmail.com','803, 1A Wing, 8th Floor, Swadeshi Mhada Complex, Chunabhatti East Sion',1,15,77,'Mumbai',400022,'803, 1A Wing, 8th Floor,Swadeshi Mhada Complex,Chunabhatti East Sion,Mumbai – 400022','NA','AQWPR7839Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,3,NULL,'9869848342',NULL,NULL,NULL,NULL,NULL,NULL),(164,'1010','EMP0000164',NULL,'Mrs.','Pooja',NULL,'Pingale','1993-02-11','Female','1037','9421605512','0','pooja.pingale@sganalytics.com','poojapingale11@gmail.com','Dr. Hedgewar colony, B6, Brahmin Ali',1,15,85,'Khed',0,'B-11,shivsagar co -op Hsg soc. Phase 1, Mauikloaug, Singhad Road, Pune','NA','CHHPP3066R','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8983120949',NULL,NULL,NULL,NULL,NULL,NULL),(165,'1018','EMP0000165',NULL,'Mr.','Ammaar',NULL,'Shaikh','1988-11-03','Male','7275','9545093038','5075','ammaar.shaikh@sganalytics.com','ammaar_skl@hotmail.com','815 / 16, Bhawani peth opp ICC, Cable office',1,15,83,'Pune',411042,'Plot No. 5 A, Harmony Society Near gangadhan chowk Pune 411037','NA','BRDPS7831L','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9765078677',NULL,NULL,NULL,NULL,NULL,NULL),(166,'1021','EMP0000166',NULL,'Miss','Shraddha',NULL,'Patel','1986-07-04','Female','1057','8888833674','0','shraddha.patel@sganalytics.com','shraddha.patel86@gmail.com','E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal',1,15,83,'Pune',411028,'E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal, Pune 411028','NA','BHSPP8501R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8888833675',NULL,NULL,NULL,NULL,NULL,NULL),(167,'1023','EMP0000167',NULL,'Mr.','Rohit',NULL,'Kalghatgi','1980-05-28','Male','7539','9370013454','0','rohit.kalghatgi@sganalytics.com','rkalghatgi@gmail.com','A -9,403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud',1,15,83,'Pune',411038,'A -9, 403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud, Pune - 411038','NA','AQAPK4267H','NA','Divorced',1,5,1,NULL,'NA','NA','Active',140,NULL,1,1,21,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:58:39',NULL,NULL,NULL,NULL,NULL,NULL,'9370013455',NULL,NULL,NULL,NULL,NULL,NULL),(168,'1033','EMP0000168',NULL,'Mr.','Amit',NULL,'Yerawar','1985-02-01','Male','0','9975028932','0','amit.yerawar@sganalytics.com','amit.yerawar@gmail.com','Near A.C.S. College, Sumitra Nagar, Tukum',1,15,71,'Chandrapur',442401,'Flat No 2, Venkatesh terrace, Near Columbia Asia Hospital, Sainath Nagar Square, Kharadi, Pune-411015     ','NA','ACVPY2211L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8600696789',NULL,NULL,NULL,NULL,NULL,NULL),(169,'1034','EMP0000169',NULL,'Mr.','Hitanshu',NULL,'Dhingra','1985-05-26','Male','7380','9582947006','5016','hitanshu.dhingra@sganalytics.com','hitanshu.dhingra@gmail.com','43006, Gali No. 10, Rampur Road',1,29,127,'Haldwani',263139,'9/28, Gali No. 10, Rampur Road, Haldwani, Uttarakhand - 263139','NA','ATWPD7637D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7838050586',NULL,NULL,NULL,NULL,NULL,NULL),(170,'1038','EMP0000170',NULL,'Mrs.','Shweta',NULL,'Navarkar','1987-01-23','Female','0','9892942500','0','shweta.navarkar@sganalytics.com','shweta2301@gmail.com','Neeltej Nagar, B - 17, Rambaug Lane - 4, Kalyan West',1,15,77,'Mumbai',421301,'Sunflower - 604, Park Springs Society, Porwal Road, Near Dhanori Jakat Naka, Lohegaon, Pune - 411032','NA','AHWPN6238N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8600140200',NULL,NULL,NULL,NULL,NULL,NULL),(171,'1040','EMP0000171',NULL,'Mr.','Pranav',NULL,'Lohokare','1993-04-10','Male','0','9986555967','0','pranav.lohokare@sganalytics.com','pranavlohokare@gmail.com','Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi',1,15,83,'Pune',411043,'Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi , Pune 411 043','NA','AJEPL8791N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9421697904',NULL,NULL,NULL,NULL,NULL,NULL),(172,'1046','EMP0000172',NULL,'Mr.','Sabyasachi','Guha','Raja','1980-07-13','Male','7248','9899697608','5048','sabyasachi.guha@sganalytics.com','sabyasachigr@gmail.com','House No 33 , Rajpur Khurd Extension, P.O. IGNOU',1,5,17,'New Delhi',110068,'House No 33 , Rajpur Khurd Extension, P.O. IGNOU, New Delhi 110068','NA','AJCPG5778N','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9899300703',NULL,NULL,NULL,NULL,NULL,NULL),(173,'1050','EMP0000173',NULL,'Mr.','Rakesh',NULL,'Hasurkar','1988-01-28','Male','5031','9764404067','7231','rakesh.hasurkar@sganalytics.com','hasurkar28@gmail.com','Sr. No . 27/B, Munjaba Vasti, Dhanori',1,15,83,'Pune',411015,'Sr. No . 27/B, Munjaba Vasti, Dhanori, Pune 15','NA','AHIPH8897B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,26,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9373724728',NULL,NULL,NULL,NULL,NULL,NULL),(174,'1053','EMP0000174',NULL,'Miss','Kalyani',NULL,'Bhende','1990-05-26','Female','7506','9503764581','0','kalyani.bhende@sganalytics.com','kalyani.bhende26@gmail.com','50, Rani Bhoslae Vihar, Opp C P Berar College, Tulsibaug',1,15,78,'Nagpur',0,'201 , \'B\' Wing , Karan Rhea Apartment, Sainath nagar, Vadgaonsheri , Pune','NA','CDPPB2021Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'8605448226',NULL,NULL,NULL,NULL,NULL,NULL),(175,'1054','EMP0000175',NULL,'Mrs.','Seema',NULL,'Gurung','1988-09-28','Female','7202','8390146987','5002','seema.gurung@sganalytics.com ','seemagurung88@gmail.com','Youngtong Division, Sasing Matelte',1,30,130,'Jalpaiguri',0,'Star Gaze society, E-203, Dhanori-15, Pune','NA','AWBPG0069Q','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9049451527',NULL,NULL,NULL,NULL,NULL,NULL),(176,'1061','EMP0000176',NULL,'Mr.','Rakesh',NULL,'Kakani','1984-10-31','Male','7513','9739068282','0','rakesh.kakani@sganalytics.com','rakeshkakani@gmail.com','53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa Nagar, Nikol Gam Road',1,7,20,'Ahmedabad',382350,'53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa nagar, Nikol Gam Road, Ahmedabad - 382 350','NA','ATHPK3885H','NA','Married',8,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9924866907',NULL,NULL,NULL,NULL,NULL,NULL),(177,'1062','EMP0000177',NULL,'Mr.','Rameez',NULL,'Shaikh','1990-02-26','Male','7228','9673959463','5028','rameez.shaikh@sganalytics.com','rameez_shaikh22@yahoo.com','S. No. 48, Sai baba Nagar, Lane No - 5, Behind valley view school, Kondhwa Khurd',1,15,83,'Pune',411048,'S. No. 48, Sai baba Nagar, Lane No - 5,  Behind valley view school, Kondhwa Khurd, Pune 411 048','NA','ESRPS1013J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7875599394',NULL,NULL,NULL,NULL,NULL,NULL),(178,'1067','EMP0000178',NULL,'Mr.','Ritwik',NULL,'Dey','1985-03-17','Male','7229','9923370908','5029','ritwik.dey@sganalytics.com','ritwik.s.dey@gmail.com','308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan',1,15,83,'Pune',411021,'308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan, Pune 411 021','NA','AIWPD5401A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9923370908',NULL,NULL,NULL,NULL,NULL,NULL),(179,'1069','EMP0000179',NULL,'Miss','Paridhi',NULL,'Agarwal','1986-10-29','Female','1002','8600017299','0','paridhi.agarwal@sganalytics.com','paridhi.agarwal2910@gmail.com','Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy',1,15,83,'Pune',411014,'Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy, Pune -411014','NA','ALZPA4632N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9079684003',NULL,NULL,NULL,NULL,NULL,NULL),(180,'1070','EMP0000180',NULL,'Mr.','Rahul',NULL,'Chakraborti','1986-01-15','Male','1005','9724199690','7565','rahul.chakraborti@sganalytics.com','rahulchakraborti0@gmail.com','45/1, New Tollygunge, P.O  Purba Dutiary',1,30,131,'Kolkata',700093,'45/1, New Tollygunge, P.O  Purba Dutiary, Kolkata 700093','NA','AJAPC1468R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9804112082',NULL,NULL,NULL,NULL,NULL,NULL),(181,'1071','EMP0000181',NULL,'Mr.','Gopi','Chand','Mannem','1985-03-04','Male','0','9052220181','0','gopichand.mannem@sganalytics.com','mannemchand1@gmail.com','H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel )',1,1,3,'Vijayawada',521175,'H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel ), Krishna ( Dt ), Andhra Pradesh - 521175','NA','ATRPM7848N','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,1,NULL,'9494450510',NULL,NULL,NULL,NULL,NULL,NULL),(182,'1072','EMP0000182',NULL,'Miss','Akriti',NULL,'Srivastava','1991-10-06','Female','0','9532881262','0','akriti.srivastava@sganalytics.com','akritisrivastavabbdnitm@gmail.com','438, Old Katra',1,28,117,'Allahabad',211002,'A-403 , Ginni Viviana, Nr. Mitcon Institute, Balewadi, Pune','NA','EYIPS8285M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9673286376',NULL,NULL,NULL,NULL,NULL,NULL),(183,'1074','EMP0000183',NULL,'Miss','Sunidhi',NULL,'Kakkar','1992-02-13','Female','0','7893406262','0','sunidhi.kakkar@sganalytics.com','sunidhikakkar@gmail.com','L-15, Shastri Nagar',1,28,124,'Meerut',250004,'L-15, Shastri Nagar, Meerut, UP - 250004','NA','BNRPK1922N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7895353565',NULL,NULL,NULL,NULL,NULL,NULL),(184,'1075','EMP0000184',NULL,'Miss','Sayli',NULL,'Rathi','1993-06-26','Female','0','9860290830','0','sayli.rathi@sganalytics.com','rathi.sayli@gmail.com','Rathi Pura, AT Post, Yeoda, Tq Daryapur',1,15,67,'Amravati',0,'Prestige Classic Housing, D-1, Dava bazar, Mumbai Pune Highway, Chinchwad','NA','CBMPR8848A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9890647476',NULL,NULL,NULL,NULL,NULL,NULL),(185,'1083','EMP0000185',NULL,'Mr.','Sandesh',NULL,'Gade','1968-06-14','Male','7308','9011012452','5097','sandesh.gade@sganalytics.com','sandeshgade123@gmail.com','9, Shahu Nagar, behind Noorani Masjid',1,15,73,'Jalgaon',425001,'9, Shahu Nagar, behind Noorani Masjid, Jalgaon,425001','NA','AAXPG8252D','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9403479721',NULL,NULL,NULL,NULL,NULL,NULL),(186,'1084','EMP0000186',NULL,'Mrs.','Jyoti',NULL,'Wadhwani','1988-01-04','Female','0','7720034188','0','jyoti.wadhwani@sganalytics.com','jyotiwadhwani4@gmail.com','Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar',1,15,83,'Pune',411014,'Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar, Pune 411014','NA','ACNPW5545M','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9011367800',NULL,NULL,NULL,NULL,NULL,NULL),(187,'1090','EMP0000187',NULL,'Mr.','Dustin',NULL,'Lichey','1988-09-09','Male','7257','9823776569','5057','dustin.lichey@sganalytics.com','dustin.lichey@gmail.com','Radegaster Street 8, 06842 Dessag',3,17,NULL,'NA',0,'Radegaster Street 8, 06842 Dessag, Germany','NA','AORPL2777A','NA','Unmarried',1,5,2,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'49',NULL,NULL,NULL,NULL,NULL,NULL),(188,'1092','EMP0000188',NULL,'Mr.','Abhishek',NULL,'Jha','1992-08-16','Male','7347','9711553074','5139','abhishek.jha@sganalytics.com','1992abhishekjha@gmail.com','Kh. No. 1704, New Karhera Colony',1,28,119,'Ghaziabad',201007,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','NA','BAMPJ9378P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'7838197131',NULL,NULL,NULL,NULL,NULL,NULL),(189,'1094','EMP0000189',NULL,'Mr.','Anand',NULL,'Sangeet','1984-10-15','Male','7332','9717929709','5120','anand.sangeet@sganalytics.com','anand.iet54@gmail.com','HIG,-0.2, VDA Flats, Naria',1,28,125,'Varanasi',221005,'HIG,-1/5, VDA Flats, Naria, Varanasi, Pin 221005','NA','DKCPS3515R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9415618949',NULL,NULL,NULL,NULL,NULL,NULL),(190,'1095','EMP0000190',NULL,'Mr.','Geogy',NULL,'George','1986-12-31','Male','7354','9880228857','7345','geogy.george@sganalytics.com','geogy_86@hotmail.com','Vadakethdahil Bethel, Kudassnad  P.O',1,13,47,'Pandalam',689512,'Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha, Kerala - 689512','NA','ANIPG3492M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,7,NULL,'9495086893',NULL,NULL,NULL,NULL,NULL,NULL),(191,'1097','EMP0000191',NULL,'Miss','Shariqa',NULL,'Mulla','1991-11-15','Female','0','7795287015','0','shariqa.mulla@sganalytics.com','mshariqa1511@gmail.com','B. No. 76, M.H.B. Colony, Shah Bazar',1,15,68,'Aurangabad',0,'Survey No. 73, Hissa No. 1, Next to EON Free zone, Kharadi, Gera Emerald city','NA','BTOPM0290G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,10,NULL,'9422208826',NULL,NULL,NULL,NULL,NULL,NULL),(192,'1103','EMP0000192',NULL,'Mr.','Rahul','Kumar','Burnwal','1990-12-21','Male','7204','9831036183','5004','rahul.burnwal@sganalytics.com','rahul.burnwal@yahoo.com','2/H/3, Taltala Lane',1,30,131,'Kolkata',700014,'2/H/3, Taltala Lane Kolkata - 700014','NA','BCJPB9778C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9831046734',NULL,NULL,NULL,NULL,NULL,NULL),(193,'1109','EMP0000193',NULL,'Mr.','Roger',NULL,'D\'Souza','1986-08-20','Male','1047','9764158808','0','roger.dsouza@sganalytics.com','roger.dsouza2016@gmail.com','St.Joseph nagar, Next to Ghorpuri Gaon',1,15,83,'Pune',411001,'Flat No. D/403, Viva Sarovar, Jambhulwadi Road, Katraj Ambegaon Budruk, Pune - 411 046','NA','AMOPD4686M','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9922754054',NULL,NULL,NULL,NULL,NULL,NULL),(194,'1120','EMP0000194',NULL,'Miss','Sharayu',NULL,'Jain','1993-03-21','Female','0','8989070779','0','sharayu.jain@sganalytics.com','sharayujain21@gmail.com','306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop',1,14,57,'Indore',0,'306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop, Indore M.P','NA','ASOPJ1992N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,10,NULL,'9893026560',NULL,NULL,NULL,NULL,NULL,NULL),(195,'1121','EMP0000195',NULL,'Mr.','Hem',NULL,'Thaker','1993-08-16','Male','0','7745880007','0','hem.thaker@sganalytics.com','thaker.hem@gmail.com','302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate Bank, 60 Feet Road, Ghatkopar (East)',1,15,77,'Mumbai',400077,'302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate bank, 60 feet road, Ghatkopar ( East ), Mumbai 77','NA','ASQPT5375D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,7,NULL,'9820073223',NULL,NULL,NULL,NULL,NULL,NULL),(196,'1123','EMP0000196',NULL,'Mr.','Vineet',NULL,'Agarwal','1978-07-12','Male','7295','9731313010','5094','vineet.agarwal@sganalytics.com','vineet1207@gmail.com','Flat No. 003, Vijaya Classic, Vijaya Bank layout, Bilekahalli',1,12,42,'Bengaluru',560076,'Flat # D1103, Kolte Patil Langston,Kharadi,Pune - 411014','NA','AFSPA7399K','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:04','2017-09-19 05:21:04',NULL,NULL,NULL,NULL,NULL,NULL,'9986344499',NULL,NULL,NULL,NULL,NULL,NULL),(197,'1124','EMP0000197',NULL,'Mr.','Ganesh',NULL,'Kudke','1992-08-31','Male','0','9960981805','0','ganesh.kudke@sganalytics.com','ganesh.kudke@yahoo.in','Trimurti Colony No 2, Datta Nagar',1,15,69,'Beed',431122,'Patil Complex, Building -4, B29, Aundh Road, Pune - 411 020','NA','DIIPK1791K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9975439673',NULL,NULL,NULL,NULL,NULL,NULL),(198,'1125','EMP0000198',NULL,'Mr.','Shahab',NULL,'Mitha','1995-02-28','Male','0','9860203921','0','shahab.mitha@sganalytics.com','shahabmitha@gmail.com','P/16, Konark Campus, Viman Nagar',1,15,83,'Pune',411014,'P/16, Konark Campus, Viman Nagar, Pune - 411 014','NA','CJWPM4341P','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9890275977',NULL,NULL,NULL,NULL,NULL,NULL),(199,'1128','EMP0000199',NULL,'Mr.','Sandeep',NULL,'Datta','1980-06-15','Male','7215','7767815975','5015','sandeep.datta@sganalytics.com','sandeepdat@gmail.com','2A, Samilton Greens, 159A NSC Bose Road, Tollygaunge, Regent Park',1,30,131,'Kolkata',700040,'E1 / 401, Bramha SunCity, Vadgaon Sheri , Pune 411 014','NA','AIGPD5352E','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7030488181',NULL,NULL,NULL,NULL,NULL,NULL),(200,'1129','EMP0000200',NULL,'Mrs.','Geetika',NULL,'Gupta','1988-05-20','Female','0','8087616116','0','geetika.gupta@sganalytics.com','geetika.gupta2122@gmail.com','46, Sanchar Nagar, Damoh Road',1,14,58,'Jabalpur',0,'D/601, Marvel Citrine, Rakshak Nagar, Kharadi, Pune','NA','ALIPG1089J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9028708015',NULL,NULL,NULL,NULL,NULL,NULL),(201,'1134','EMP0000201',NULL,'Mr.','Nikhil',NULL,'Sharma','1991-08-25','Male','0','8558985896','0','nikhil.sharma@sganalytics.com','nikhilsharma223656@gmail.com','Main bazar, Ward No 6',1,9,30,'Una',174303,'Main bazar, Ward No 6, Una - 174303, Himachal Pradesh','NA','DHOPS0503Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,7,NULL,'7589187460',NULL,NULL,NULL,NULL,NULL,NULL),(202,'1135','EMP0000202',NULL,'Mr.','Rahul',NULL,'Agarwal','1979-02-04','Male','7217','9845063982','5017','rahul.agarwal@sganalytics.com','rahul0402@gmail.com','c/o Dr. O P Agarwal, GP Das Lane, Mahamadia Bazar, Chandni Chowk',1,24,96,'Cuttack',753002,'B3 / 304, Tuscan Estate, Kharadi - Mundhwa Road, Next to Radisson Hotel, Pune 411 014','NA','AHGPA8906L','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9980563981',NULL,NULL,NULL,NULL,NULL,NULL),(203,'1136','EMP0000203',NULL,'Miss','Sakshi',NULL,'Kaushal','1991-07-06','Female','5110','7774095033','7321','sakshi.kaushal@sganalytics.com','sakshikaushal20@yahoo.com','19360, Santosh Bhawan, Vidhya Peeth Marg, Vikas Nagar',1,29,126,'Dehradun',0,'F-801, Roystonea, Magarpatta City, Pune - 411013','NA','CQAPK5363E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,26,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7774095001',NULL,NULL,NULL,NULL,NULL,NULL),(204,'1137','EMP0000204',NULL,'Mr.','Nikhil',NULL,'Venkatavelu','1994-03-03','Male','7539','8463842283','0','nikhil.venkatavelu@sganalytics.com','nikhilvenkatavelu@gmail.com','C-202, Kalpataru, Bhagoji Keer Road, Behind Paradise Cinema, Mahim West',1,15,77,'Mumbai',400016,'Guest House currently','NA','AZHPV6024F','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',167,140,1,1,21,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 06:15:32',NULL,NULL,NULL,NULL,NULL,NULL,'7045455650',NULL,NULL,NULL,NULL,NULL,NULL),(205,'1138','EMP0000205',NULL,'Miss','Shefali',NULL,'Arora','1993-12-18','Female','0','8435139445','0','shefali.arora@sganalytics.com','shefaliarora18@gmail.com','H-448 , Aadharshila, Essarjee, East block, Awadhpuri',1,14,51,'Bhopal',0,'Guest House currently','NA','BQRPA1921J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9752416399',NULL,NULL,NULL,NULL,NULL,NULL),(206,'1141','EMP0000206',NULL,'Miss','Vishakha',NULL,'Avhad','1991-06-11','Female','0','8928009180','0','vishakha.avhad@sganalytics.com','vishakha_245@rediffmail.com','11, Arya Apartment, Kala Nagar, Jail Road',1,15,80,'Nashik',0,'Guest House currently','NA','BKYPA1823N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,3,NULL,'9420609558',NULL,NULL,NULL,NULL,NULL,NULL),(207,'1142','EMP0000207',NULL,'Mr.','Samaksh',NULL,'Dahiya','1989-07-31','Male','0','7709564863','0','samaksh.dahiya@sganalytics.com','SPACKSAM@gmail.com','A -1 / 261, Paschim Vihar',1,5,17,'New Delhi',63,'C - 902, The Latitude, NIBM, Kondwa','NA','BHQPD2391M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9811225154',NULL,NULL,NULL,NULL,NULL,NULL),(208,'1145','EMP0000208',NULL,'Mr.','Anil',NULL,'Kumar','1994-09-23','Male','0','9695406049','0','anil.kumar@sganalytics.com','nlkumar528@gmail.com','H. No. 1581, LIG HBC , Sector 04',1,8,27,'Karnal',0,'Guest House currently','NA','CTAPK9522L','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,7,NULL,'9416928172',NULL,NULL,NULL,NULL,NULL,NULL),(209,'1153','EMP0000209',NULL,'Miss','Sri Krishna',NULL,'Hasa Yalamanchili','1987-01-26','Female','7333','9000081295','5121','srikrishna.hasa@sganalytics.com','kri.hasa@gmail.com','Flat - 202, Srinivasam , 31-16-18, Bullemma Street, Machavaram down',1,1,6,'Vijayawada',520004,'Flat - 1202, Tower-17, Amanora Township, Hadapsar - 411028','NA','CIPPS3976L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9599376349',NULL,NULL,NULL,NULL,NULL,NULL),(210,'1155','EMP0000210',NULL,'Miss','Supriya',NULL,'Sindkhedkar','1990-12-11','Female','1039','8275411160','0','supriya.sindkhedkar@sganalytics.com','ssupriya011@gmail.com','Aashirwad Niwas, In front of Radha Krishna Theatre, Kawar nagar',1,15,66,'Akola',444001,'Raj Mahal Building, H-18, Nr. Geuba Moses school, Yerawada,Pune','NA','EQLPS8645N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7057872344',NULL,NULL,NULL,NULL,NULL,NULL),(211,'1159','EMP0000211',NULL,'Mr.','Shashi',NULL,'Agarwal','1978-10-02','Male','0','9892252700','0','shashi.agarwal@sganalytics.com','shashi21078@gmail.com','LIG - 206, Kotra Sultanabad',1,14,51,'Bhopal',462003,'LIG - 206, Kotra Sultanabad, Bhopal, MP 462003','NA','AINPA0752G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9699574463',NULL,NULL,NULL,NULL,NULL,NULL),(212,'1164','EMP0000212',NULL,'Mr.','Shubham',NULL,'Agarwal','1994-08-12','Male','7532','8972318731','0','shubham.agarwal@sganalytics.com','shubhama999@gmail.com','D-4089, 4th Floor, Bima Complex, Kalamboli',1,15,81,'Navi Mumbai',410218,'D-4089, 4th Floor, Bima Complex, Kalamboli, Navi Mumbai- 410218','NA','BURPA7875H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,10,NULL,'9322902108',NULL,NULL,NULL,NULL,NULL,NULL),(213,'1166','EMP0000213',NULL,'Mr.','Manas','Ranjan','Sahoo','1994-03-25','Male','0','9932584032','0','manas.sahoo@sganalytics.com','manas7671@gmail.com','B-2181, Narmada Vihar, NTPC Township',1,4,15,'Jamnipali',495450,'B-2181, Narmada Vihar, NTPC Township, Jamnipali, Korba, Chattisgarh-495450','NA','FGVPS8484L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,11,NULL,'9630814015',NULL,NULL,NULL,NULL,NULL,NULL),(214,'1169','EMP0000214',NULL,'Mr.','Chaitanya',NULL,'Bhokare','1988-09-12','Male','5142','9766859441','7353','chaitanya.bhokare@sganalytics.com','chaitanya.bhokare12@gmail.com','Parijat, Nr Phadke hospital, Jatharpeth',1,15,66,'Akola',444005,'\"Parijat\", Nr Phadke hospital, Jatharpeth, Akola - 444005','NA','AVNPB2367F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7276098563',NULL,NULL,NULL,NULL,NULL,NULL),(215,'1170','EMP0000215',NULL,'Mrs.','Shalini',NULL,'Sharma','1991-07-26','Female','1017','8888839753','0','shalini.sharma@sganalytics.com','ssshalu2627@gmail.com','13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi',1,10,32,'Jammu',180001,'13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi, Jammu & KASHMIR - 180001','NA','ERQPS7103R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9881188199',NULL,NULL,NULL,NULL,NULL,NULL),(216,'1171','EMP0000216',NULL,'Miss','Divya',NULL,'Chainani','1993-03-23','Female','1034','88062331345','0','divya.chainani@sganalytics.com','divya.chainani23@gmail.com','118/58,Kaushalpuri',1,28,121,'Kanpur',208012,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','NA','AWBPC3777B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9935168295',NULL,NULL,NULL,NULL,NULL,NULL),(217,'1174','EMP0000217',NULL,'Miss','Shruti',NULL,'Vidwans','1986-02-01','Female','7053','9881575599','0','shruti.vidwans@sganalytics.com','shruti.vidwans1@gmail.com','400 B, Jaygad Apts., United Western Society, Karve Nagar',1,15,83,'Pune',411052,'400 B, Jaygad Apts., United Western Society, Karve Nagar, Pune - 411052','NA','BDUPS7466N','NA','Widow',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9850977907',NULL,NULL,NULL,NULL,NULL,NULL),(218,'1180','EMP0000218',NULL,'Mr.','Jitendra','Kumar','Teli','1986-11-30','Male','7263','9765287154','5063','jitendra.teli@sganalytics.com','jitendrateli.jt@gmail.com','76, Gumasta Nagar',1,14,57,'Indore',452009,'Lunkad Heritage, Viman Nagar, Pune','NA','AJKPT1618G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,3,NULL,'9713908768',NULL,NULL,NULL,NULL,NULL,NULL),(219,'1181','EMP0000219',NULL,'Mr.','Shantanu',NULL,'Maddiwar','1990-05-14','Male','0','7875867656','0','shantanu.maddiwar@sganalytics.com','shantanu-maddy@yahoo.co.in','F2, Gulmohar Plaza, Datala Road',1,15,71,'Ramnagar',442401,'Siddhi Paying Guest, Opp Forest Country lane, Kharadi','NA','AVKPM1617N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'8149959661',NULL,NULL,NULL,NULL,NULL,NULL),(220,'1183','EMP0000220',NULL,'Miss','Prachi',NULL,'Jain','1992-11-26','Female','0','8085475799','0','prachi.jain@sganalytics.com','prachijain717@gmail.com','Flat - 203, Inner court, GTB Complex, T T Nagar',1,14,51,'Bhopal',0,'L804, Cosmos Society, Magarpatta,Hadapsar, Pune','NA','ATNPJ6287G','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,2,NULL,'9755476530',NULL,NULL,NULL,NULL,NULL,NULL),(221,'1184','EMP0000221',NULL,'Miss','Sanaya',NULL,'Shaikh','1988-09-28','Female','0','9923329049','0','sanaya.shaikh@sganalytics.com','sanaya.shaikh28@gmail.com','H No 1-10-48, Juna Bazar',1,15,68,'Aurangabad',0,'Flat 503, B-11, R-Euphoria Society, Kondhwa Budruk, Opp Jalab Farms, Pune - 411048','NA','CGEPS1986D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8411080055',NULL,NULL,NULL,NULL,NULL,NULL),(222,'1185','EMP0000222',NULL,'Mr.','Tushar',NULL,'Chugh','1994-03-29','Male','0','9416039078','0','tushar.chugh@sganalytics.com','tusharchugh078@gmail.com','525, Huda -20',1,8,26,'Kaithal',0,'6 Raja Apartment, Model Colony, Pune','NA','BFQPC2888Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,3,NULL,'7350091234',NULL,NULL,NULL,NULL,NULL,NULL),(223,'1189','EMP0000223',NULL,'Mr.','Radheshyam',NULL,'Moholkar','1984-06-07','Male','0','7718899482','0','radheshyam.moholkar@sganalytics.com','radheshyam.moholkar@hotmail.com','102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner',1,15,83,'Pune',411045,'102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner, Pune - 411045','NA','ANNPM2934R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8793550275',NULL,NULL,NULL,NULL,NULL,NULL),(224,'1195','EMP0000224',NULL,'Miss','Radhika',NULL,'Iyer','1994-11-28','Female','7367','8796917089','0','radhika.iyer@sganalytics.com','iyerradhika2811@gmail.com','44,45,46, Rasta Peth, Nr. Lakheri Maruti Chowk, 201, Sumadhan Apt, Jews Street',1,15,83,'Pune',411011,'44,45,46 Rasta Peth, Nr. Lakheri Maruti Chowk,201, Sumadhan Apt, Jews Street, Pune - 411011','NA','AEFP12320N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'9545243863',NULL,NULL,NULL,NULL,NULL,NULL),(225,'1197','EMP0000225',NULL,'Mr.','Rajesh',NULL,'Viswanath','1978-12-11','Male','7343','9886160022','5131','rajesh.viswanath@sganalytics.com','rajeshviswanath@hotmail.com','#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya',1,12,42,'Bengaluru',0,'#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya, Bengaluru','NA','AFGPR9583Q','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9986608558',NULL,NULL,NULL,NULL,NULL,NULL),(226,'1198','EMP0000226',NULL,'Mrs.','Priyanka',NULL,'Agrawal','1990-10-24','Female','0','8976683696','0','priyanka.agrawal@sganalytics.com','priyankaagrawal24@gmail.com','A-204, Green Divine, Nr. Amanora, Hadapsar',1,15,83,'Pune',0,'A-204, Green Divine, Nr. Amanora , Hadapsar, Pune','NA','AURPA9306N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8975155203',NULL,NULL,NULL,NULL,NULL,NULL),(227,'1209','EMP0000227',NULL,'Mr.','Geetesh',NULL,'Binjhade','1990-05-17','Male','0','9907321095','0','geetesh.binjhade@sganalytics.com','geeteshbinjhade@gmail.com','House No. 1328, Nagpur Road, BSNL Colony, SARRA',1,14,53,'Imlikheda',0,'House No. 1328, Nagpur Road, BSNL Colony, SARRA , Post Imlikheda, Chhindwara, MP','NA','BKGPB5919N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'7024115920',NULL,NULL,NULL,NULL,NULL,NULL),(228,'1210','EMP0000228',NULL,'Miss','Heena',NULL,'Phulwani','1993-10-20','Female','0','7879949561','0','heena.phulwani@sganalytics.com','heenaphulwani2014@gmail.com','Ward No. 37,7816, Jamidar Colony, Ramtekri',1,14,59,'Mandsaur',458001,'Ward No. 37, 7816, Jamidar Colony, Ramtekri, Mandsaur, M.P - 458001','NA','CVSPP3631B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'8345604545',NULL,NULL,NULL,NULL,NULL,NULL),(229,'1211','EMP0000229',NULL,'Mr.','Varun',NULL,'Janardhan','1988-07-26','Male','0','9096217076','0','varun.janardhan@sganalytics.com','varun.janardhan26@gmail.com','C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran',1,15,83,'Pune',412114,'C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran, Pune-412114','NA','ALGPJ5296E','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9730155991',NULL,NULL,NULL,NULL,NULL,NULL),(230,'1213','EMP0000230',NULL,'Mr.','Vikas',NULL,'Divate','1990-11-14','Male','0','9028098017','0','vikas.divate@sganalytics.com','divatevikas@gmail.com','Divate Kirana, Abinav Nagar, Navin Nagar Road',1,15,65,'Sangamner',422605,'B - 14, Pushpa Apartment, Kothrud, Pune - 411038','NA','ANCPD3009P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9730737374',NULL,NULL,NULL,NULL,NULL,NULL),(231,'1217','EMP0000231',NULL,'Mr.','Rishi',NULL,'Jayswal','1992-03-09','Male','0','9158053177','0','rishi.jayswal@sganalytics.com','rishi.jayswal92@gmail.com','2/C, d.l Roy Street',1,30,131,'Kolkata',700006,'Guest House currently','NA','APMPJ2844N','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9831629391',NULL,NULL,NULL,NULL,NULL,NULL),(232,'1218','EMP0000232',NULL,'Mr.','A Harish',NULL,'Rao','1983-10-28','Male','7528','9818948028','0','aharish.rao@sganalytics.com','harryl_rao@yahoo.co.in','Holding No.4, Road 4, Contractors Area',1,11,36,'Bistupur',831001,'RH-13, Mahesh Society, Sambhajinagar, Chinchwad, Pune','NA','AKWPR2786A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,9,NULL,'9890286691',NULL,NULL,NULL,NULL,NULL,NULL),(233,'1219','EMP0000233',NULL,'Mr.','Roshan',NULL,'Kumar','1985-04-15','Male','7349','9999595619','5135','roshan.kumar@sganalytics.com','roshan.dreamz@gmail.com','Ward No 09, P.O Brpur',1,3,14,'Supaul',854340,'D1-304, Ganga Constella, Kharadi','NA','AWCPK1116B','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,7,NULL,'8447581569',NULL,NULL,NULL,NULL,NULL,NULL),(234,'1220','EMP0000234',NULL,'Mr.','Nishant',NULL,'Mantri','1987-11-21','Male','0','9972098115','0','nishant.mantri@sganalytics.com','mantri13@gmail.com','H No 4118 - 19, Karwa Nagar, Mantha Road ',1,15,74,'Jalna',431203,'F7 / 25, Hermes Heritage, Phase II, Shastri Nagar, Yerwada , Pune 411006','NA','APHPM3028E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9890765276',NULL,NULL,NULL,NULL,NULL,NULL),(235,'1221','EMP0000235',NULL,'Mr.','Mangesh',NULL,'Shinde','1989-01-01','Male','0','9561317990','0','mangesh.shinde@sganalytics.com','mangeshshinde001@gmail.com','S.R. No.4812, Dhanlaxmi Society, Ganesh Nagar, Wadgaonsheri',1,15,83,'Pune',411014,'S.R. No.4812, Dhanlaxmi Society, ganesh Nagar, Wadgaonsheri, Pune 411014','NA','CNIPSO730G','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9503157720',NULL,NULL,NULL,NULL,NULL,NULL),(236,'1222','EMP0000236',NULL,'Mr.','Ajay',NULL,'Shekhawat','1992-12-28','Male','0','7566438221','0','ajay.shekhawat@sganalytics.com','ajayshekhawat2812@yahoo.com','689 Road No. 8, Nanda Nagar',1,14,57,'Indore',452011,'689 Road No. 8, Nanda Nagar, Indore, MP 452011','NA','FXPPS0254H','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9111015857',NULL,NULL,NULL,NULL,NULL,NULL),(237,'1227','EMP0000237',NULL,'Miss','Pratiksha',NULL,'Mandhane','1993-10-19','Female','0','9421679907','0','pratiksha.mandhane@sganalytics.com','pratikshamandhane@gmail.com','Kaviraj Vishnu Nagar, Basmat Road',1,15,82,'Parbhani',431401,'Guest House Currently','NA','BWRPM2996M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9421324784',NULL,NULL,NULL,NULL,NULL,NULL),(238,'1228','EMP0000238',NULL,'Mr.','Kunal',NULL,'Doshi','1982-12-02','Male','7351','9538034400','5140','kunal.doshi@sganalytics.com','nikur_kunal@yahoo.co.in','45, Rajeshvari Colony, Isanpur Road, Mani Nagar',1,7,20,'Ahmedabad',380008,'Vascon Ela, B- 402, Malvadi, Behind Amanora Mall, Hadapsar, Pune - 411028 ','NA','AJVPD7527P','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8971419988',NULL,NULL,NULL,NULL,NULL,NULL),(239,'1231','EMP0000239',NULL,'Mr.','Krishna',NULL,'Bamezai','1989-08-15','Male','0','7875790046','0','krishna.bamezai@sganalytics.com','krishnabamezai17@gmail.com','17/4, Pandoka Colony, Paloura',1,10,32,'Jammu',0,'302, Mithila, Shree Siddhivinayak Sankalp, Undri, Pune - 60','NA','CKZPB8985N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,7,NULL,'9665295950',NULL,NULL,NULL,NULL,NULL,NULL),(240,'1232','EMP0000240',NULL,'Miss','Viveki',NULL,'Singh','1993-02-11','Female','0','7680062851','0','viveki.singh@sganalytics.com','vivekisingh338@gmail.com','Dr no - 403, BGM Patrudu Residency, Coromandel Gate',1,1,7,'Vishakapatnam',530011,'Shree Sai PG, Sangharsh Chowk, Chandan Nagar, Pune','NA','DGFPS4140M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,3,NULL,'7276992981',NULL,NULL,NULL,NULL,NULL,NULL),(241,'1238','EMP0000241',NULL,'Mr.','Chaitanya',NULL,'Nandan','1993-01-30','Male','0','7507985936','0','chaitanya.nandan@sganalytics.com','chaitanyanandan3@gmail.com','Yajurwed Housing Society,Opp Megharaj, Peth Road',1,15,80,'Nashik',0,'Sai Nagari, Lane No. 9, Chandan Nagar, Pune - 411014','NA','AXVPN5265A','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9421511006',NULL,NULL,NULL,NULL,NULL,NULL),(242,'1239','EMP0000242',NULL,'Miss','Manasi',NULL,'Das','1983-12-25','Female','0','9731290700','0','manasi.das@sganalytics.com','manasidas802@gmail.com','A-26, Eldeco Green Meadows, Sector P',1,28,118,'Greater Noida',0,'F-501, Marvel Ritz, Tupe Road, Behind Amanora Mall,Hadapsar, pune','NA','ATWPB8080A','NA','Divorced',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9868041301',NULL,NULL,NULL,NULL,NULL,NULL),(243,'1240','EMP0000243',NULL,'Mr.','Santosh',NULL,'Kurade','1989-05-11','Male','0','9664907175','0','santosh.kurade@sganalytics.com','santosh.kurade50@gmail.com','At/P, Wagharali, Tal Gahinglaj',1,15,75,'Kolhapur',0,'At/P, Wagharali, Tal Gahinglaj, Kolhapur','NA','BMMPK0996E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9922820871',NULL,NULL,NULL,NULL,NULL,NULL),(244,'1242','EMP0000244',NULL,'Mr.','Rohit',NULL,'Jain','1987-06-21','Male','0','9049070088','0','rohit.jain@sganalytics.com','rojain15@gmail.com','240, Jain Nagar',1,14,51,'Bhopal',462030,'B-301, Gokul Crest, Sakore Nagar, Pune-411014','NA','AMAPJ4881A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,1,NULL,'9822655677',NULL,NULL,NULL,NULL,NULL,NULL),(245,'1243','EMP0000245',NULL,'Mr.','Suraj',NULL,'Dudhe','1985-02-24','Male','0','9545088288','0','suraj.dudhe@sganalytics.com','suraj.dudhe@gmail.com','Main Road, At Kelor Saoner',1,15,78,'Nagpur',441112,'B6/302, Phase -II, Tirupati Campus, Road No. 2, Tingre Nagar, Vishrantwadi,Pune - 411015','NA','ALZPD6503B','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9922916477',NULL,NULL,NULL,NULL,NULL,NULL),(246,'1244','EMP0000246',NULL,'Miss','Priyanka',NULL,'Padhi','1991-06-25','Female','0','8080849736','0','priyanka.padhi@sganalytics.com','priyankapadhi1991@gmail.com','2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill',1,15,77,'Mumbai',400031,'2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill, Mumbai - 400031','NA','BQZPP3895A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9923349435',NULL,NULL,NULL,NULL,NULL,NULL),(247,'1247','EMP0000247',NULL,'Miss','June',NULL,'Biswas','1987-05-04','Female','0','8698909762','0','june.biswas@sganalytics.com','junebiswas@gmail.com','903, B11, Margosa Heights, Mohammadwadi',1,15,83,'Pune',411060,'903, B11, Margosa Heights, Mohammadwadi, Pune - 411060','NA','APDPB4354G','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9049912922',NULL,NULL,NULL,NULL,NULL,NULL),(248,'1249','EMP0000248',NULL,'Miss','Sweta',NULL,'Jaiswal','1991-01-14','Female','7370','7350714214','5149','sweta.jaiswal@sganalytics.com','jaiswalsweta17@gmail.com','Type - 2B / 1712, HAL T/S, Ojar',1,15,80,'Nashik',422207,'318 A & B, Snehsagar Apt, Plot No. 9 & 10, Shukrawar Peth, Pune - 411002','NA','ATVPJ3128L','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9405367323',NULL,NULL,NULL,NULL,NULL,NULL),(249,'1250','EMP0000249',NULL,'Miss','Namrata',NULL,'Jagade','1988-02-08','Female','0','9527778877','0','namrata.jagade@sganalytics.com','namrata-828@yahoo.co.in','Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road',1,15,83,'Pune',411051,'Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road, Pune - 411051','NA','ALCPJ5684L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'9922928524',NULL,NULL,NULL,NULL,NULL,NULL),(250,'1251','EMP0000250',NULL,'Miss','Neha',NULL,'Deshpande','1988-05-04','Female','7361','7378315486','0','neha.deshpande@sganalytics.com','nehadp0488@gmail.com','Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe',1,15,83,'Pune',411041,'Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe, Pune 411 041','NA','BVGPD9787B','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'9021166811',NULL,NULL,NULL,NULL,NULL,NULL),(251,'1252','EMP0000251',NULL,'Mrs.','Gouree',NULL,'Gurjar','1982-08-28','Female','7365','9673992306','0','gouree.gurjar@sganalytics.com','goureeg@gmail.com','F- 701, Maple Woodz, Wagholi',1,15,83,'Pune',0,'F- 701, Maple Woodz, Wagholi, Pune','NA','BKWPP7332P','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'9673992309',NULL,NULL,NULL,NULL,NULL,NULL),(252,'1253','EMP0000252',NULL,'Mr.','Ashish','Kumar','Jain','1984-12-05','Male','0','9701810370','0','ashish.jain@sganalytics.com','ashish51284@gmail.com','House No. 28, 2nd Floor, Street No. 3, New Krishna Nagar',1,5,17,'Delhi',110051,'House No. 28, 2nd Floor, Street No. 3,  New Krishna Nagar, Delhi - 110051','NA','AJXPJ0188J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'97112116767',NULL,NULL,NULL,NULL,NULL,NULL),(253,'1254','EMP0000253',NULL,'Mr.','Tony',NULL,'Thomas','1990-01-04','Male','0','7507191303','0','tony.thomas@sganalytics.com','tonythomas4190@gmail.com','C-8/ 72, Century Enka, Col No. 2, Bhosari',1,15,83,'Pune',411039,'A2, Karishma Glory Hsg Society, Ajmera, Morwadi, Pimpri, Pune - 411018','NA','AOAPT1539F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9145116593',NULL,NULL,NULL,NULL,NULL,NULL),(254,'1255','EMP0000254',NULL,'Mr.','Zahoor',NULL,'Hurrah','1989-12-18','Male','7364','8087395066','0','zahoor.hurrah@sganalytics.com','zahoornabii@gmail.com','Nigeen Bagh, Krankshivan Colony',1,10,31,'Sopore',0,'Flat No. 504, Cindrella Apartment,  Shivneri Nagar,Kondhwa, Pune','NA','AHNPH8794A','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'8087925404',NULL,NULL,NULL,NULL,NULL,NULL),(255,'1256','EMP0000255',NULL,'Mr.','Akshay',NULL,'Sahani','1992-10-17','Male','1036','9579712663','0','akshay.sahani@sganalytics.com','sahaniakshay@yahoo.com','Flat No. 103, Plot No - 378, Sector-E, N-1, CIDCO',1,15,68,'Aurangabad',431003,'S. No- 22, Pavlina Terrace, Sopan Nagar Road, Wadgaon sheri, Pune - 411014','NA','ESXPS1859C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7676441766',NULL,NULL,NULL,NULL,NULL,NULL),(256,'1258','EMP0000256',NULL,'Mr.','Vikas',NULL,'Dimaniya','1988-01-06','Male','7378','9599927746','5155','vikas.dimaniya@sganalytics.com','vdimaniya@gmail.com','House no. 183/1,New mandi keshru khera',1,28,124,'Meerut',250001,'House no. 183/1,New mandi keshru khera,Meerut cantt – 250001\n','NA','BBKPD2052H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8477091998',NULL,NULL,NULL,NULL,NULL,NULL),(257,'1260','EMP0000257',NULL,'Mr.','Vineeth',NULL,'CL','1990-07-01','Male','7290','7066794553','5089','vineeth.cl@sganalytics.com','vineeth1192@gmail.com','Cyrus House, Nr SNDP, Trichambaran, Taliparamba',1,13,48,'Kannur',670141,'Cyrus House, Nr SNDP, Trichambaran, Taliparamba, Kannur, Kerala-670141','NA','AQQPC1113N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'7034295802',NULL,NULL,NULL,NULL,NULL,NULL),(258,'1262','EMP0000258',NULL,'Mr.','Ramkrishna',NULL,'Umre','1981-11-01','Male','7299','8451948400','5096','ramkrishna.umre@sganalytics.com','rkumre@gmail.com','Balaji Colony, Behind SBI Agri Development Branch',1,14,56,'Babai',0,'1204, B-8, Park Infinia, Gurudatta Nagar, Fursungi, Pune','NA','AMRPR51424','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8451948500',NULL,NULL,NULL,NULL,NULL,NULL),(259,'1263','EMP0000259',NULL,'Miss','Arti',NULL,'Saproo','1977-09-17','Female','7558','9711497477','0','arti.saproo@sganalytics.com','saproo.arti@gmail.com','No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli',1,12,42,'Bengaluru',560097,'No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli,Bangalore - 560097','NA','ATBPS7910D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9980160745',NULL,NULL,NULL,NULL,NULL,NULL),(260,'1264','EMP0000260',NULL,'Mr.','Varun',NULL,'Gupta','1991-06-15','Male','5019','9960732898','7219','varun.gupta@sganalytics.com','varungupta1591@gmail.com','Gupta Flour & Oil Ind, Mohata Mill Road, Naya Jin',1,15,66,'Akola',0,'Flat No 12, Rajyog Heights, Ganpati Chowk, Viman Nagar, Pune','NA','ASOPG5576F','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9665721504',NULL,NULL,NULL,NULL,NULL,NULL),(261,'1265','EMP0000261',NULL,'Mr.','Gaurav',NULL,'Shukla','1982-04-18','Male','0','9582898882','0','gaurav.shukla@sganalytics.com','gvshukla@gmail.com','G - 271, 2nd Floor, Sushant, LOK- 2, Sector 57',1,8,25,'Gurgaon',122010,'Flat no. 302, Tower 51,Future Towers, Amanora Park Town,Hadapsar, Pune – 411028','NA','BEFPS3078J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,7,NULL,'9650339555',NULL,NULL,NULL,NULL,NULL,NULL),(262,'1266','EMP0000262',NULL,'Mr.','Sumeet',NULL,'Ranglani','1992-12-30','Male','5146','7507002106','7298','sumeet.ranglani@sganalytics.com','sumeetranglani3012@hotmail.com','B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh',1,15,83,'Pune',411007,'B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh, Pune - 411007','NA','AZPPR0939M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8421688800',NULL,NULL,NULL,NULL,NULL,NULL),(263,'1267','EMP0000263',NULL,'Mr.','Vicky',NULL,'Lokhande','1989-02-26','Male','0','9130430440','0','NA','NA','Sangamwadi, Near Ram Mandir, Khadki',1,15,83,'Pune',411003,'Sangamwadi, Near Ram Mandir, Khadki, Pune - 411003','NA','NA','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,18,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9130430440',NULL,NULL,NULL,NULL,NULL,NULL),(264,'1269','EMP0000264',NULL,'Miss','Richa',NULL,'Sharma','1988-11-02','Female','7260','9993959742','5060','richa.sharma@sganalytics.com','0211richa@gmail.com','14, Karariya Farm, Koluvada Bagicha, Khushipura ward 36, Tehsil Huzur',1,14,51,'Bhopal',462010,'Sagar Park  Society, Lane No.3, Samadhan,  Near Sarvodaya hotel,Chandan nagar,  Nagar Road, Pune','NA','ECVPS7813A','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'992325766',NULL,NULL,NULL,NULL,NULL,NULL),(265,'1271','EMP0000265',NULL,'Mr.','Rajib',NULL,'Das','1982-04-11','Male','7212','9420410815','5012','rajib.das@sganalytics.com','rajib1d@gmail.com             ','Bandhgara',1,30,128,'Bolpur',731204,'B-505, S3,Lifestyle Apt, Kunal Icon Road, Pimple Saudagar, Pune - 411027','NA','AOSPD8740G','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9420410830',NULL,NULL,NULL,NULL,NULL,NULL),(266,'1272','EMP0000266',NULL,'Mr.','Ankit',NULL,'Maheshwari','1978-06-30','Male','7214','9765406615','5151','ankit.maheshwari@sganalytics.com','maheshwariankit@rediffmail.com','G-801, Marvel Zephyr, Kharadi',1,15,83,'Pune',411014,'G-801, Marvel Zephyr, Kharadi, Pune - 411014','NA','AJQPM6553M','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'9881136320',NULL,NULL,NULL,NULL,NULL,NULL),(267,'1273','EMP0000267',NULL,'Mr.','Imroz',NULL,'Khan','1991-01-10','Male','7511','9319239923','0','imroz.khan@sganalytics.com','imrozkhan111@gmail.com','H No 539, Gali Chobdaran, Mandi Ram Dass ',1,28,123,'Mathura',0,'E-103, Downtown Langston, Fountain Road, Kharadi, Pune','NA','DASPK8557D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,NULL,NULL,'8452905628',NULL,NULL,NULL,NULL,NULL,NULL),(268,'1274','EMP0000268',NULL,'Mr.','Kunal',NULL,'Pateliya','1988-12-11','Male','7363','8983700369','0','kunal.pateliya@sganalytics.com','kunalpateliya555@gmail.com','S/ No 29, Near R K puram, Munjaba Wasti, Dhanori',1,15,83,'Pune',411015,'S/ No 29, Near R K puram, Munjaba Wasti, Dhanori, Pune - 411015','NA','AXYPP5691H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:05','2017-09-19 05:21:05',NULL,NULL,NULL,NULL,8,NULL,'9983942467',NULL,NULL,NULL,NULL,NULL,NULL),(269,'1275','EMP0000269',NULL,'Mr.','Yogesh',NULL,'Hanse','1990-07-06','Male','7360','9673119987','0','yogesh.hanse@sganalytics.com','yogeshyh@gmail.com','Ganesh Nagar, col No. 9 ,Bppkhel, CME',1,15,83,'Pune',411031,'Ganesh Nagar, col No. 9 ,Bppkhel, CME, Pune -  411 031','NA','AGDPH6228A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,8,NULL,'9579798191',NULL,NULL,NULL,NULL,NULL,NULL),(270,'1276','EMP0000270',NULL,'Mr.','Prasad',NULL,'Galinde','1989-10-06','Male','5146','9028795550','7298','prasad.galinde@sganalytics.com','galinde.prasad@gmail.com','Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi',1,15,83,'Pune',411014,'Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi, Pune - 411014','NA','BKAPG5250K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,11,NULL,'8149132373',NULL,NULL,NULL,NULL,NULL,NULL),(271,'1277','EMP0000271',NULL,'Mrs.','D',NULL,'Kusuma','1987-05-03','Female','7572','9545466542','0','d.kusuma@sganalytics.com','kusuma.d1987@gmail.com','Flat No. 416, GCN White Palms, Ramagondanahalli, Narayanpura Road',1,12,42,'Bengaluru',560066,'# 602B, Anshul Athena Society, Sainath Nagar, Wadgaonsheri, Pune','NA','BZPPKOO53G','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9545466758',NULL,NULL,NULL,NULL,NULL,NULL),(272,'1278','EMP0000272',NULL,'Mr.','Sandip',NULL,'Chavan','1983-06-13','Male','7246','9011937481','5046','sandip.chavan@sganalytics.com','sandeepchavan83@yahoo.co.in','A/P Devale, Tal Panhala',1,15,75,'Kolhapur',0,'Mahadev Nagar, Manjri Road, Hadapsar, Pune - 28','NA','AJLPC2618Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,3,NULL,'9130604069',NULL,NULL,NULL,NULL,NULL,NULL),(273,'1279','EMP0000273',NULL,'Mr.','Devi','Prasad','Swain','1991-12-20','Male','0','7873470610','0','devi.swain@sganalytics.com','devi.winanything@gmail.com','Plot No. B2 /128, Lingaraj Vihar, Pokhariput',1,24,95,'Bhubaneshwar',0,'Plot No. B2 /128, Lingaraj Vihar, Pokhariput, Bhubaneshwar, Odisha','NA','FTIPS6420N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9035910355',NULL,NULL,NULL,NULL,NULL,NULL),(274,'1280','EMP0000274',NULL,'Mr.','Varun',NULL,'Hatmode','1982-03-03','Male','7272','7507610468','5072','varun.hatmode@sganalytics.com','varun.hatmode@gmail.com','Plot No 24, Asmita Colony, Narendra Nagar',1,15,78,'Nagpur',440015,'C3/1201, Colonnade Society, Kharadi Bypass road, Kharadi, Pune - 411014','NA','ACPPH2566R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9561065601',NULL,NULL,NULL,NULL,NULL,NULL),(275,'1281','EMP0000275',NULL,'Mr.','Sourish',NULL,'Chatterjee','1994-11-28','Male','0','8390739122','0','sourish.chatterjee@sganalytics.com','sourish.sunny@gmail.com','1, Tilak Road',1,30,131,'Kolkata',700029,'1, Tilak Road, Kolkata - 700029','NA','AZDPC4950H','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9831206702',NULL,NULL,NULL,NULL,NULL,NULL),(276,'1282','EMP0000276',NULL,'Mr.','Dyamaapa','Dummi','Nataraj','1988-01-18','Male','0','9916855568','0','dyamappa.nataraj@sganalytics.com','dyan.natarj@gmail.com','No. 114, Dummi-1, Hollakere',1,12,43,'Chitradurga',0,'Maneesh Neelaya No. 24, 3rd Floor, 11th MAIN, 9TH Cross road, Raghavendra layout, Kammagondanahari - 560015, Bangalore','NA','BNBPD4822N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,11,NULL,'9740350222',NULL,NULL,NULL,NULL,NULL,NULL),(277,'1287','EMP0000277',NULL,'Mr.','Anshul',NULL,'Yadav','1988-03-21','Male','7280','9811841346','5079','anshul.yadav@sganalytics.com','anshullyadavv@gmail.com','434/8, Defence Officers Enclave, SP Marg, Chanakyapuri',1,5,17,'New Delhi',110021,'434/8, Defence Officers Enclave, SP Marg, Chanakyapuri, New Delhi - 110021','NA','ACRPY2633G','NA','Married',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9899993792',NULL,NULL,NULL,NULL,NULL,NULL),(278,'1289','EMP0000278',NULL,'Miss','Priyanka',NULL,'Thombre','1993-11-13','Female','0','7353125767','0','priyanka.thombre@sganalytics.com','priyankathombre13@gmail.com','H. No. 26, Sainik Nagar, Laxmi Tek',1,12,40,'Belgaum',0,'Flat No. 201, Sainath Nagar, Karan Rhea, Wadgaonsheri','NA','AUBPT3103C','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9481403927',NULL,NULL,NULL,NULL,NULL,NULL),(279,'1290','EMP0000279',NULL,'Mr.','Manmeet',NULL,'Singh','1992-03-11','Male','0','8897459307','0','manmeet.singh@sganalytics.com','manmeetsandhu0351@gmail.com','4633/24, Guru Nanak Wara, Putli Ghar, P.O Khalsa College',1,25,101,'Amritsar',143001,'4633/24, Guru Nanak Wara, Putli ghar, P.O Khalsa College, Amritsar 143001','NA','FOAPS4251G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9888542700',NULL,NULL,NULL,NULL,NULL,NULL),(280,'1291','EMP0000280',NULL,'Mr.','JAMES','T.','De CICCO III','1966-11-19','Male','0','0','0','jim.decicco@sganalytics.com','jdecicco66@gmail.com','23 Hidden Lake Drive',NULL,23,NULL,'North Brunswick',8902,'23 Hidden Lake Drive, North Brunswick, NJ 08902','NA','NA','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(281,'1292','EMP0000281',NULL,'Mr.','Swapnil',NULL,'Badgire','1993-05-17','Male','0','9422655805','0','swapnil.badgire@sganalytics.com','badgireswapnil@gmail.com','Vyankatesh Nivas, Yerme Nagar, Nr. DED College, Udgir',1,15,76,'Latur',413517,'S. No. 45/ A, Manthan Society, Somnath Nagar, Wadgaon Sheri, Pune 411014','NA','BQKPB2258J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'8087416938',NULL,NULL,NULL,NULL,NULL,NULL),(282,'1295','EMP0000282',NULL,'Mr.','Shwetank',NULL,'Dwivedi','1992-05-25','Male','7345','9811886880','5133','shwetank.dwivedi@sganalytics.com','cashwetank@gmail.com','83, GF2, Gohmuri',1,11,36,'Jamshedpur',0,'Rukminini,Sasanenagar, Hadapsar, Pune','NA','BOFPD5272M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9811886880',NULL,NULL,NULL,NULL,NULL,NULL),(283,'1296','EMP0000283',NULL,'Mr.','Mahesh',NULL,'Nema','1990-09-20','Male','0','9752746160','0','mahesh.nema@sganalytics.com','maheshnema01@gmail.com','42, Naya Bazar 1, Mahatma Gandhi Ward',1,14,54,'Damoh',0,'42, Naya Bazar 1, Mahatma Gandhi Ward, Damoh, UP','NA','ALIPN7746H','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'8866359369',NULL,NULL,NULL,NULL,NULL,NULL),(284,'1297','EMP0000284',NULL,'Miss','Sunayana',NULL,'Girme','1988-09-27','Female','0','9922009078','0','sunayana.girme@sganalytics.com','sunayana.girme@gmail.com','S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud',1,15,83,'Pune',411021,'S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud. Pune - 21','NA','AQPPG7637Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9763674785',NULL,NULL,NULL,NULL,NULL,NULL),(285,'1299','EMP0000285',NULL,'Mrs.','Tanushree',NULL,'Das','1988-04-02','Female','0','9985556541','0','tanushree.das@sganalytics.com','tanushreedas02@gmail.com','B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri',1,15,83,'Pune',411014,'B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri, Pune - 411014','NA','AYKPD6503H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,6,NULL,'9075087511',NULL,NULL,NULL,NULL,NULL,NULL),(286,'1300','EMP0000286',NULL,'Mr.','Manoj',NULL,'Kumar','1983-05-29','Male','0','9818093714','0','manoj.kumar@sganalytics.com','soumann@gmail.com','R2H-226, Street-7, Rajnagar-II, Palam',1,5,17,'New Delhi',0,'R2H-226, Street-7, Rajnagar-II, Palam , New Delhi','NA','BDKPK27195','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9868552243',NULL,NULL,NULL,NULL,NULL,NULL),(287,'1301','EMP0000287',NULL,'Mr.','Vinayak',NULL,'Joshi','1990-01-06','Male','0','9821463765','0','vinayak.joshi@sganalytics.com','joshi.vinayak90@gmail.com','42875, B Wing, Sachin Society, Mithagar Road, Mulund (E)',1,15,77,'Mumbai',81,'5/20, B Wing, Sachin Society, Mithagar Road, Mulund ( E ), Mumbai - 81','NA','AJVPJ0960C','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9821463765',NULL,NULL,NULL,NULL,NULL,NULL),(288,'1302','EMP0000288',NULL,'Miss','Amruta',NULL,'Patil','1989-04-14','Female','0','8805543726','0','amruta.patil@sganalytics.com','amrita_6patil@yahoo.co.in','Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa',1,15,83,'Pune',411036,'Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa, Pune 411036','NA','BGJPP7156G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,6,NULL,'9731094346',NULL,NULL,NULL,NULL,NULL,NULL),(289,'1304','EMP0000289',NULL,'Miss','Namrata',NULL,'Kakade','1991-07-12','Female','5032','7387434761','7232','namrata.kakade@sganalytics.com','kakade.namrata12@yahoo.com','208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar',1,15,83,'Pune',411020,'208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar, Pune - 411020','NA','CAWPK2642E','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9923288640',NULL,NULL,NULL,NULL,NULL,NULL),(290,'1305','EMP0000290',NULL,'Mr.','Sweekar',NULL,'TM','1990-08-31','Male','0','9945526729','0','sweekar.tm@sganalytics.com','sweekartm@yahoo.co.in','Venkateshwara general stores, Soraba Road, Sagar',1,12,46,'Shivamogga',577401,'Venkateshwara general stores, Soraba Road, Sagar- 577401, Shivamogga Dist, Karnataka','NA','BAYPM4645L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,6,NULL,'9986460723',NULL,NULL,NULL,NULL,NULL,NULL),(291,'1306','EMP0000291',NULL,'Mr.','Mahesh',NULL,'Thengane','1990-09-17','Male','0','8149763624','0','mahesh.thengane@sganalytics.com','maheshthengane5@gmail.com','Shri Sai Apt, Flat No. T-4, Ganpati ward',1,15,71,'Ballarpur',442701,'Om Sai bldg, Rajaram Patil Nagar, Lane no.2, nr. Forest County, Kharadi, Pune','NA','AMOPT1337P','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9423117433',NULL,NULL,NULL,NULL,NULL,NULL),(292,'1307','EMP0000292',NULL,'Mr.','Yogesh',NULL,'Ghare','1989-06-19','Male','0','9552559530','0','yogesh.ghare@sganalytics.com','yogeshghare89@gmail.com','255, Navi Sadashiv Peth, Nr LBS Road',1,15,83,'Pune',411030,'Someshwar apt, Wing B, Flat No. 29, Sinhagad road, Nr. Trimurti hospital, Pune','NA','AQEPG4057B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'8390666066',NULL,NULL,NULL,NULL,NULL,NULL),(293,'1308','EMP0000293',NULL,'Mr.','Sulaiman',NULL,'Islam','1982-03-07','Male','0','9706051105','0','sulaiman.islam@sganalytics.com','sulaiman.islam@gmail.com','VPO, Puranigudam, Na-Alimore',1,2,11,'Nagaon',782141,'Flat 306, Heritage, Bldg-3, NIBM , Undri road, Pune - 411060','NA','AASP18414L','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'8446639097',NULL,NULL,NULL,NULL,NULL,NULL),(294,'1309','EMP0000294',NULL,'Mr.','Deepak',NULL,'Abhale','1986-12-10','Male','0','9987704210','0','deepak.abhale@sganalytics.com','deepak.abhaleworld@yahoo.com','B-404, Gopi Krishna Nagar, SN Dubey Road, Rawalpada, Dahisar(E)',1,15,77,'Mumbai',400068,'Swapna, S.No.6/2 , Lane No. 4, Nr. Reliance Mart, Charcoal Rest Lane, Kharadi, Pune-14','NA','AKEPA8399J','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9768785978',NULL,NULL,NULL,NULL,NULL,NULL),(295,'1310','EMP0000295',NULL,'Mrs.','Jisha',NULL,'Venugopal','1988-12-01','Female','7286','9164718439','5085','jisha.venugopal@sganalytics.com','jisha.venugopal@gmail.com','7, Keshav Chaya Apts. Bhav Patil Road, Bopodi',1,15,83,'Pune',411020,'7, Keshav Chaya Apts. Bhav Patil Road, Bopodi, Pune - 411020','NA','ANDPV9872H','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9632897458',NULL,NULL,NULL,NULL,NULL,NULL),(296,'1314','EMP0000296',NULL,'Miss','Tejaswini',NULL,'Lohar','1982-09-03','Female','0','9844353542','0','tejaswini.lohar@sganalytics.com','teja_lohar@rediffmail.com','122/A Rajopadhye Nagar, Sane Guruji Vashashat, Radha Nagari Road',1,15,75,'Kolhapur',416012,'122/A Rajopadhye Nagar,Sane Guruji Vashashat,Radha nagari road,Kolhapur-416012','NA','AFPPT6427E','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,10,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(297,'1315','EMP0000297',NULL,'Mr.','Jayaprakash',NULL,'Mallikarjuna','1982-02-21','Male','7278','9980067717','5077','jayaprakash.mallikarjuna@sganalytics.com','Jayaprakash.mallikarjun@gmail.com','Devagiri Divine, #3, 30th Main, Banashankari III Stage',1,12,42,'Bengaluru',85,'Devagiri Divine, #3, 30th Main, Banashankari III Stage, Bangalore – 85','NA','AEMPJ5353H','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9980047717',NULL,NULL,NULL,NULL,NULL,NULL),(298,'1316','EMP0000298',NULL,'Mrs.','Manjinder','Kaur','Bhullar','1986-08-11','Female','0','9833673411','0','manjinder.bhullar@sganalytics.com','manjinderkaur.nhullar@gmail.com','B1/G2, Tolani Maritime Institute, Induri, Talegaon',1,15,83,'Pune',410507,'B1/G2, Tolani Maritime Institute, Induri, Talegaon, Pune - 410507','NA','AVJPB4269Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9890950963',NULL,NULL,NULL,NULL,NULL,NULL),(299,'1317','EMP0000299',NULL,'Mr.','Himanshu',NULL,'Khatri','1988-10-05','Male','0','9811875571','0','himanshu.khatri@sganalytics.com','khatri.himanshu24@gmail.com','D-58, Swarna Jayanti Puram, Nr. Govind, Puram',1,28,119,'Ghaziabad',201013,'D-58, Swarna Jayanti Puram, Nr. Govind, Puram, Ghaziabad, UP 201013','NA','ATYPK9191R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9953836690',NULL,NULL,NULL,NULL,NULL,NULL),(300,'1318','EMP0000300',NULL,'Mr.','Saurabh',NULL,'Goyal','1985-12-23','Male','0','9916294959','0','saurabh.goyal@sganalytics.com','saurabhgoyal23@gmail.com','3-Devlok Colony, Shimla Bypass, Majra',1,29,126,'Dehradun',248171,'3-Devlok Colony, Shimla Bypass, Majra, Dehradun, Uttarakhand - 248171','NA','APTPG1071P','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9916294948',NULL,NULL,NULL,NULL,NULL,NULL),(301,'1319','EMP0000301',NULL,'Miss','Kalyani',NULL,'Deshpande','1994-12-15','Female','0','7208706882','0','kalyani.deshpande@sganalytics.com','kalyani1512@gmail.com','11,Gayatri Bunglow, Shivaji Nagar, Opp. Deval Dairy, Miraj',1,15,86,'Sangli',416410,'11,Gayatri Bunglow, Shivajinagar, opp Deval Dairy, Miraj, Sangli- 416410','NA','BZLPD9061K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,2,NULL,'7715808468',NULL,NULL,NULL,NULL,NULL,NULL),(302,'1320','EMP0000302',NULL,'Mr.','Gaurav',NULL,'Sharma','1981-01-31','Male','0','9555255566','0','gaurav.s@sganalytics.com','gauravsharmaat@gmail.com','D- 20 A , South Extension Part 2',1,5,17,'New Delhi',110049,'D- 20 A , South Extension Part 2 ,New Delhi – 110049','NA','BHXP5944Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,9,NULL,'9867655313',NULL,NULL,NULL,NULL,NULL,NULL),(303,'1321','EMP0000303',NULL,'Miss','Aparna',NULL,'Desai','1992-12-25','Female','0','9970176373','0','aparna.desai@sganalytics.com','aparna.desai@siib.ac.in','Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar Hospital, Tilak Nagar, New Nallakunta',1,27,109,'Hyderabad',500044,'Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar hospital, Tilak Nagar, New Nallakunta, Hyderabad, Telangana- 500044','NA','BZEPD3548J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9490215996',NULL,NULL,NULL,NULL,NULL,NULL),(304,'1323','EMP0000304',NULL,'Mr.','Marlesh',NULL,'Patil','1989-05-15','Male','0','7875611750','0','marlesh.patil@sganalytics.com','marlesh.patil5@gmail.com','706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar',1,15,83,'Pune',411027,'706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar, Pune - 411027','NA','BJEPP2810D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,2,NULL,'20',NULL,NULL,NULL,NULL,NULL,NULL),(305,'1324','EMP0000305',NULL,'Miss','Harshita',NULL,'Gupta','1993-05-25','Female','7573','7073819662','0','harshita.gupta@sganalytics.com','harshitagupta73@gmail.com','402, Parvana Apartment, Sector 21D',1,5,18,'Faridabad',0,'402, Parvana Apartment, Sector 21D, Faridabad, Delhi NCR','NA','Applied','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'129',NULL,NULL,NULL,NULL,NULL,NULL),(306,'1325','EMP0000306',NULL,'Mr.','Himanshu',NULL,'Porwal','1991-05-19','Male','0','8982770907','0','himanshu.porwal@sganalytics.com','himanshu.porwal195@gmail.com','65,(1-260) Sudama Nagar,Near Annapurna Mandir',1,14,57,'Indore',452009,'Flat no 1101,11th Floor,Platinum CL-3 Buliding,Bramha Suncity Vadgaonsheri Pune','NA','CCLPP7208N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'713',NULL,NULL,NULL,NULL,NULL,NULL),(307,'1326','EMP0000307',NULL,'Miss','Surbhi',NULL,'Jain','1992-06-19','Female','0','9993498040','0','surbhi.jain@sganalytics.com','jain.surbhi@gmail.com','1,Parshavnath Parisar,Surajnagar',1,14,64,'Ujjain',0,'Amanora Park Town,Tower 18,Flat No-702,Hadapsar,Pune','NA','BCFPJ4716C','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'734',NULL,NULL,NULL,NULL,NULL,NULL),(308,'1327','EMP0000308',NULL,'Miss','Nilam',NULL,'Dhok','1990-03-18','Female','0','9503935999','0','nilam.dhok@sganalytics.com','nilam.dhok18@gmail.com','401,Panchpermeshwar Apt,Kisan Nagar No-3, Wagle Estate',1,15,89,'Thane',400604,'LX8/u4/13,A who tucker enclave,Near Hemant Karkare Udyan,15 no bus stop,Gondhale Nagar,Hadapsar-411028','NA','BHUPD1617A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9503040907',NULL,NULL,NULL,NULL,NULL,NULL),(309,'1328','EMP0000309',NULL,'Mrs.','Pooja',NULL,'Upadhyay','1987-10-15','Female','0','8007303443','0','pooja.upadhyay@sganalytics.com','upadhyaypooja15@gmail.com','Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road, Market Yard',1,15,83,'Pune',411037,'Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road,Market Yard Pune-411037','NA','ABTPU5853B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9637530482',NULL,NULL,NULL,NULL,NULL,NULL),(310,'1329','EMP0000310',NULL,'Miss','Sneha',NULL,'Joshi','1991-09-01','Female','0','9168075663','0','sneha.joshi@sganalytics.com','sj75663@gmail.com','Flat no 566, Scheme No 40, Murlidhar Colony, Hanuman Nagar',1,12,40,'Belgaum',9,'33 Keshav Kunj, Hanuman Nagar, Keshav Nagar, Mundhwa, Pune','NA','APTPJ4186Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,3,NULL,'9449791177',NULL,NULL,NULL,NULL,NULL,NULL),(311,'1331','EMP0000311',NULL,'Mr.','Alok',NULL,'Bharti','1985-07-15','Male','7561','9199712586','0','alok.bharti@sganalytics.com','bhartialok514@gmail.com','New road, Above old Bata',1,11,38,'Sahibgunj',816109,'New road, Above old Bata, Sahibgunj, Jharkhand, 816109','NA','AJZPB6555H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9960138458',NULL,NULL,NULL,NULL,NULL,NULL),(312,'1332','EMP0000312',NULL,'Mr.','Venkatrao',NULL,'Para','1991-06-15','Male','0','7263023348','0','venkatrao.para@sganalytics.com','venkat.para11@gmail.com','25659,Kotha Cheruvukommupalem (V),Nuzendla (m)',1,1,2,'Guntur',522659,'28/4/9,Galande Patil,Industrial Estate Near Bollywood Multiplex Pune-41101','NA','BLEPP0215L','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'7337353387',NULL,NULL,NULL,NULL,NULL,NULL),(313,'1333','EMP0000313',NULL,'Mr.','Dushyant',NULL,'Chourey','1990-10-10','Male','0','9827287406','0','dushyant.chourey@sganalytics.com','dushyantchourey1315@jaipuria.ac.in','363-B-Sector Saruadharm Colony Kolar Road Exclusive Apt-2 Flat no-4-1',1,14,51,'Bhopal',0,'Shubshree Woods Society Row House A1/2 Pimple Saudagar Pune','NA','AKSPC3603R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9827287406',NULL,NULL,NULL,NULL,NULL,NULL),(314,'1334','EMP0000314',NULL,'Mr.','Eswarareddy',NULL,'Osuri','1990-06-12','Male','0','9112814559','0','eswara.reddy@sganalytics.com','reswar966@gmail.com','1-51A, Narapureddypalli Village, Kotcherla Kota',1,1,113,'Kocherla Kota',523315,'Venky PG, Lane no 9, Sathyanagar Colony, Swami Smarta, Tukai Darson, Opp SP infocity, Fursungi - 412308','NA','AAVPO0160E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,8,NULL,'9618542278',NULL,NULL,NULL,NULL,NULL,NULL),(315,'1335','EMP0000315',NULL,'Mr.','Sujitsingh',NULL,'Deore','1992-09-11','Male','0','9987172838','0','sujitsingh.deore@sganalytics.com','sujitdeore540@gmail.com','Santoshi Mata Colony Karanja (Lad)',1,15,90,'Washim',444105,'Harshni 12,Rambug Colony,Kothrud Pune','NA','CMEPD5870M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9029670115',NULL,NULL,NULL,NULL,NULL,NULL),(316,'1336','EMP0000316',NULL,'Mr.','Basudeb',NULL,'Iyer','1973-05-09','Male','0','7743876047','0','basudeb.iyer@sganalytics.com','basuiyer9@gmail.com','Flat A502, Flying Heights, Near DY Patil School, Lohegaon',1,15,83,'Pune',0,'Flat A502, Flying Heights, Near DY Patil School, Lohegaon, Pune','NA','AAFPI0391F','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,9,NULL,'7743876047',NULL,NULL,NULL,NULL,NULL,NULL),(317,'1337','EMP0000317',NULL,'Miss','Purnima',NULL,'Verma','1993-06-04','Female','0','9755650087','0','purnima.verma@sganalytics.com','verma.purnima0408@gmail.com','C/W-210, Shalimar Bunglow, Main Road, Sukhliya',1,14,57,'Indore',0,'Raj building, Borate Wasti, Chandan Nagar, Near Old Sai Mandir, Pune','NA','AQNPV6801F','NA','Unmarried',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,8,NULL,'7898786627',NULL,NULL,NULL,NULL,NULL,NULL),(318,'1338','EMP0000318',NULL,'Mr.','Ankit',NULL,'Gangwal','1987-01-29','Male','7570','8007196600','0','gangwal.ankit@sganalytics.com','ankit_gangwal@yahoo.com','4/25 Jawahar Nagar',1,26,108,'Jaipur',0,'4/25Jawahar Nagar,Jaipur','NA','AKVPG3010H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9799557177',NULL,NULL,NULL,NULL,NULL,NULL),(319,'1339','EMP0000319',NULL,'Mr.','Teja','Srinivas','Sathuluri','1992-05-16','Male','0','9490964979','0','teja.sathuluri@sganalytics.com','teja.sathuluri@gmail.com','Door number: 1-2/3, F-F-1, Sri Sai Milayam, Tadigadapa Road, Pedapulipaka (V), Penamaluru (MDC)',1,1,3,'Vijayawada',521137,'Flat -301, Building number 6, Rakshak Nagar, Phase 2, Kharadi Bypass, Pune-411014','NA','EGMPS8262Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9440162260',NULL,NULL,NULL,NULL,NULL,NULL),(320,'1340','EMP0000320',NULL,'Mr.','Raghavendra','Rao','Pattaswamy','1982-06-17','Male','0','9441250166','0','raghavendra.pattaswamy@sganalytics.com','raghava.sai@gmail.com','1-39/2, Prabhath nagar, Chaitanyapuri',1,1,109,'Hyderabad',500060,'1-39/2, Prabhath nagar, Chaitanyapuri, Hyderabad - 500060','NA','AQSPP0431C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9000994359',NULL,NULL,NULL,NULL,NULL,NULL),(321,'1341','EMP0000321',NULL,'Mr.','Siddharth',NULL,'Pant','1973-10-01','Male','7206','9741877411','5006','siddharth.pant@sganalytics.com','siddharth.pant@gmail.com','9-203, Mantri Residency, Kalena Agrahara, Bannerghatta Road',1,12,42,'Bengaluru',6076,'9-203, Mantri Residency, Kalena Agrahara, Bannerghatta road, Bangalore - 6076','NA','AGBPP2852N','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9632274274',NULL,NULL,NULL,NULL,NULL,NULL),(322,'1342','EMP0000322',NULL,'Mr.','Rachit',NULL,'Huria','1993-05-19','Male','0','8962341161','0','rachit.huria@sganalytics.com','rachithuria19@gmail.com','136, Prannath ward No 6',1,14,61,'Pana',488001,'Lane No 2, Regaram Patil Nagar, Kharadi, pune - 411014','NA','AHSPH5048J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9823389432',NULL,NULL,NULL,NULL,NULL,NULL),(323,'1343','EMP0000323',NULL,'Mr.','Prasad',NULL,'Chougule','1991-09-16','Male','0','8308324047','0','prasad.chougule@sganalytics.com','chouguleprasad09@gmail.com','Flat no 185, Dnyanhans, Soc No 1, R.K. Nagar, Marewadi',1,15,75,'Kolhapur',0,'15/6 vishwesh Building, Snehankit Colony, Warje Naka, Kothrud, Pune','NA','ATEPC8598A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,7,NULL,'7709343143',NULL,NULL,NULL,NULL,NULL,NULL),(324,'1344','EMP0000324',NULL,'Miss','Aiswarya',NULL,'Krishnan','1994-11-24','Female','0','8554878886','0','aiswarya.krishnan@sganalytics.com','akrishnan017@gmail.com','Krishnavilasam, Pannivizha, P.O Anandappally',1,13,49,'Adoor',691525,'Type II,87/2,Range Hills Estate,Kirkee,Pune-20','NA','BGHPA8237M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,3,NULL,'9881294753',NULL,NULL,NULL,NULL,NULL,NULL),(325,'1345','EMP0000325',NULL,'Mr.','Madhav',NULL,'Gajbhare','1991-08-12','Male','0','7798283871','0','madhav.gajbhare@sganalytics.com','madhavdevi2@gmail.com','194, Ghungrala, Naigaon',1,15,79,'Nanded',431709,'c/o Sachin Kamble,Lane no 15,Rajaram Patil Nagar,Kharadi Gaon,Pune-411014','NA','AUOPG4607P','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,3,NULL,'9011286965',NULL,NULL,NULL,NULL,NULL,NULL),(326,'1346','EMP0000326',NULL,'Mr.','Akshay',NULL,'Yande','1990-10-06','Male','0','9960067513','0','akshay.yande@sganalytics.com','yande.akshay90@gmail.com','Flat No 38, Mangal Murti Park Society, Near Sutar Hospital Kothrud',1,15,83,'Pune',411029,'Flat No 38,Mangal Murti Park Society,Near Sutar Hospital Kothrud,Pune 411029','NA','AETPY2552A','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9960067517',NULL,NULL,NULL,NULL,NULL,NULL),(327,'1347','EMP0000327',NULL,'Mr.','Swanand',NULL,'Dhabu','1988-05-15','Male','7212','9654234712','5012','swanand.dhabu@sganalytics.com','swananddhabu@gmail.com','C-302, Amrapali Towers, New Ashoka Road',1,15,80,'Nashik',422011,'4-503,Alcove Apartments,Pimple Saudagar,Pune-27','NA','ANWPD0104B','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9654234712',NULL,NULL,NULL,NULL,NULL,NULL),(328,'1348','EMP0000328',NULL,'Mrs.','Nibedita',NULL,'Saha','1984-07-19','Female','0','9711260861','0','nibedita.saha@sganalytics.com','nibeditas@gmail.com','44A/1A, Karl Marx Sarani, Kidderpore',1,30,131,'Kolkata',700023,'Tower B,Flat 6012,Devinder Vihar,Gurgaon,Sector 56-122011','NA','ARWPS6217L','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,9,NULL,'9873913037',NULL,NULL,NULL,NULL,NULL,NULL),(329,'1350','EMP0000329',NULL,'Mr.','Nakul',NULL,'Gauridhar','1990-03-19','Male','0','8888682842','0','nakul.gauridhar@sganalytics.com','gauridharnakul@gmail.com','3/27,Jawahar Nagar,Nanak Heda',1,14,64,'Ujjain',0,'Shri.Murmure Anant Amrut,Tapodham,Lane no 5,Warje,S.No 9/4,Opp Kamal Const/Pune-411058','NA','BBRPG4430K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,8,NULL,'8959258229',NULL,NULL,NULL,NULL,NULL,NULL),(330,'1351','EMP0000330',NULL,'Mr.','Manish',NULL,'Yadav','1994-08-04','Male','0','8269774943','0','manish.yadav@sganalytics.com','my0494@gmail.com','573, DUH Nagar, Rajendra Nagar',1,14,57,'Indore',0,'501-B,Mayur Kilbil,Dhanori,Pune','NA','ALVPY5011H','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'999372121',NULL,NULL,NULL,NULL,NULL,NULL),(331,'1352','EMP0000331',NULL,'Mr.','Aniket',NULL,'Yerawar','1992-04-21','Male','0','9921255416','0','aniket.yerawar@sganalytics.com','av.yerawar@gmail.com','48, Bharat Nagar, Wadgaon Road',1,15,91,'Yavatmal',445001,'Flat No 2,Vyankatesh Terece,Kharadi,Pune-411013','NA','AHXPY2111L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9975028932',NULL,NULL,NULL,NULL,NULL,NULL),(332,'1353','EMP0000332',NULL,'Mr.','Kritarth',NULL,'Srivastava','1989-03-28','Male','0','8878643952','0','kritarth.srivastava@sganalytics.com','kritarthsame@gmail.com','156, Purshottam Nagar, Khuldabad',1,28,117,'Allahabad',211016,'156,Purshottam Nagar,Khuldabad,Allahabad,Uttar Pradesh-211016','NA','CUQPS4054J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,11,NULL,'9839349407',NULL,NULL,NULL,NULL,NULL,NULL),(333,'1354','EMP0000333',NULL,'Mr.','Narendar',NULL,'Nagineni','1985-11-09','Male','0','8008955709','0','narendar.nagineni@sganalytics.com','narendar.rao359@gmail.com','H No 5-176, Chintha Nekkonda',1,27,115,'Parvathagiri',506122,'H No 5-176,Chintha Nekkonda,Parvatha giri,Warangal-506122','NA','AWEPN0242K','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9963435360',NULL,NULL,NULL,NULL,NULL,NULL),(334,'1355','EMP0000334',NULL,'Mrs.','Ruchi',NULL,'Vishwakarma','1988-10-16','Female','0','8765755516','0','ruchi.vishwakarma@sganalytics.com','ruchivishwakarma16oct@gmail.com','J 604, IRIS, Magarpatta City, Hadapsar',1,15,83,'Pune',0,'B Wing, 702, Konark Medowr Wagholi, Near Wagheshwar Temple, Pune','NA','BBAPV7750C','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,8,NULL,'8888168786',NULL,NULL,NULL,NULL,NULL,NULL),(335,'1356','EMP0000335',NULL,'Mr.','Nikhil',NULL,'Baghela','1995-01-02','Male','0','8435305341','0','nikhil.baghela@sganalytics.com','nikhil6664@gmail.com','Bazar Mohalla',1,14,62,'Sundarsi',0,'Bazar Mohalla, Sundarsi, Shajapur, Madhya Pradesh','NA','BPDPB5461D','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9754102784',NULL,NULL,NULL,NULL,NULL,NULL),(336,'1357','EMP0000336',NULL,'Mr.','Saksham',NULL,'Sethi','1993-04-19','Male','0','9425071957','0','saksham.sethi@sganalytics.com','saksham19apr@gmail.com','61, Janki Nagar, (Main)',1,14,57,'Indore',0,'61, Janki Nagar, (Main) Indore, Madhya Pradesh','NA','DPAPS6515C','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9423071957',NULL,NULL,NULL,NULL,NULL,NULL),(337,'1358','EMP0000337',NULL,'Mr.','Chinmay',NULL,'Sharma','1991-11-20','Male','0','9926003923','0','chinmay.sharma@sganalytics.com','chinmaysharma_119@yahoo.com','4, Shankar Bagh Colony, Near Marimata Square',1,14,57,'Indore',0,'4, Shankar Bagh Colony, Near Marimata Square, Indore, M.P','NA','CPAPS3888F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9766868676',NULL,NULL,NULL,NULL,NULL,NULL),(338,'1359','EMP0000338',NULL,'Mr.','Tarun',NULL,'Teesgaonkar','1989-09-05','Male','0','9713630315','0','tarun.teesgaonkar@sganalytics.com','tarunteesgaonker@gmail.com','Krishna',1,14,63,'Shivpuri',473551,'Krishna, Shivpuri, M.P. - 473551','NA','Yet to Apply','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,1,NULL,'9179373926',NULL,NULL,NULL,NULL,NULL,NULL),(339,'1360','EMP0000339',NULL,'Mr.','Rahul',NULL,'Kulkarni','1994-04-15','Male','0','7247506590','0','rahul.kulkarni@sganalytics.com','rahul.dilipkulkarni@gmail.com','71, Lav-Kush Nagar, Behind Awadhpuri, Berkheda',1,14,51,'Bhopal',0,'71,Lav-Kush Nagar,Behind Awadhpuri,Berkheda,Bhopal(M.P)','NA','COOPK7088G','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,7,NULL,'7566384737',NULL,NULL,NULL,NULL,NULL,NULL),(340,'1361','EMP0000340',NULL,'Mr.','Advait',NULL,'Iyer','1995-07-17','Male','0','9429762506','0','advait.iyer@sganalytics.com','advaitiyer1995@gmail.com','Plot No 7B,Bhange Vihar,Trimurti Nagar',1,15,78,'Nagpur',440022,'Plot No 7B,Bhange Vihar,Trimurti Nagar,Nagpur-440022','NA','AFBPI0140R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:06','2017-09-19 05:21:06',NULL,NULL,NULL,NULL,NULL,NULL,'9423762506',NULL,NULL,NULL,NULL,NULL,NULL),(341,'1362','EMP0000341',NULL,'Mr.','Vikas',NULL,'Omar','1995-12-02','Male','0','9628498655','0','vikas.omar@sganalytics.com','omarvikas@gmail.com','Ward No 6,Kabir Nagar',1,28,121,'Derapur',0,'Ward No 6,Kabir Nagar,Derapur,Kanpur Dehat,Uttar Pradesh','NA','ACNPO2062P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(342,'1363','EMP0000342',NULL,'Mr.','Nishant',NULL,'Kumar','1992-12-30','Male','0','9826422177','0','nishant.kumar@sganalytics.com','nishantkumar6316@gmail.com','JR. MIG-708, Sector-2, PT.Deendayal Upadhyay Nagar',1,4,16,'Raipur',0,'JR. MIG-708,Sector-2,PT.Deendayal Upadhyay Nagar,Raipur,(C.G)','NA','CJOPK1436P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(343,'1364','EMP0000343',NULL,'Miss','Debadrita',NULL,'Basu','1992-09-20','Female','0','9830642661','0','debadrita.basu@sganalytics.com','debadritabasu16@gmail.com','A/21,Amarabati(1st Floor), Sodepur',1,30,131,'Kolkata',700110,'A/21,Amarabati(1st Floor),PO Sodepur,Kolkata-700110','NA','BBUPB1998J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9765291449',NULL,NULL,NULL,NULL,NULL,NULL),(344,'1365','EMP0000344',NULL,'Miss','Harshita',NULL,'Saraf','1995-01-17','Female','0','7350407337','0','harshita.saraf@sganalytics.com','saraf.harshita1@gmail.com','227,\'Vidyaprakash\',Balaji Ward No 1,Near Old SP College',1,15,71,'Chandrapur',442402,'227,\'Vidyaprakash\',Balaji Ward No 1,Near Old SP College,Chandrapur,Maharashtra-442402','NA','FLQPS3558R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9226487976',NULL,NULL,NULL,NULL,NULL,NULL),(345,'1366','EMP0000345',NULL,'Miss','Pragati',NULL,'Sinha','1995-12-18','Female','0','9075993091','0','pragati.sinha@sganalytics.com','pragati94@gmail.com','202, Sriramkunj Apartment, IAS Colony, Bailey Road, Danapur',1,3,13,'Patna',801503,'202,Sriramkunj Apartment,IAS Colony,Bailey Road,Danapur,Patna,Bihar-801503','NA','CSTPP5093D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9431465111',NULL,NULL,NULL,NULL,NULL,NULL),(346,'1367','EMP0000346',NULL,'Miss','Vandana',NULL,'Shivani','1988-07-11','Female','0','9755182796','0','vandana.shivani@sganalytics.com','vandanashivani11@gmail.com','House No 13, Sunvillas, Walmi Road, Chunnabhatti',1,14,51,'Bhopal',462016,'House No 13,Sunvillas,Walmi Road,Chunnabhatti,Bhopal,462016','NA','HIYPS8305H','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9893091505',NULL,NULL,NULL,NULL,NULL,NULL),(347,'1368','EMP0000347',NULL,'Miss','Anushtha',NULL,'Vijay','1995-09-18','Female','0','9460358441','0','anushtha.vijay@sganalytics.com','anushthavj@gmail.com','House No 4, Gudha Katla Road, Ward -25, Bandikui',1,26,107,'Dausa',303313,'House No 4,Gudha Katla Road,Ward -25,Bandikui,Dausa,Rajasthan,Pin-303313','NA','BCUPV4468G','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(348,'1369','EMP0000348',NULL,'Miss','Kajal',NULL,'Rathore','1996-07-05','Female','0','9424430105','0','kajal.rathore@sganalytics.com','rathorekajal555@gmail.com','Ambedkar Ward,Hanuman Akhada Tikari',1,14,50,'Betul',460001,'Ambedkar Ward,Hanuman Akhada Tikari,Betul(MP)-460001','NA','CJCPR7710M','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,9,NULL,'8225004207',NULL,NULL,NULL,NULL,NULL,NULL),(349,'1370','EMP0000349',NULL,'Mrs.','Sonia',NULL,'Gawra','1987-11-26','Female','7342','9511781522','5130','sonia.gawra@sganalytics.com','soniania5@gmail.com','A1-401, Life Park, Mohammedwadi',1,15,83,'Pune',411060,'A1-401,Life Park,Mohammedwadi,Pune-411060','NA','AOBPG8025J','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9860486023',NULL,NULL,NULL,NULL,NULL,NULL),(350,'1371','EMP0000350',NULL,'Mr.','Manoj',NULL,'Janjalkar','1986-12-09','Male','0','9823018842','0','manoj.janjalkar@sganalytics.com','manojjanjalkar@gmail.com','M-20-C, Railway Police Colony, Beside Saint Aloysius School, Yawal Roa',1,15,73,'Bhusawal',425201,'M-20-C,Railway Police Colony,Beside Saint Aloysius School,Yawal Roa,Bhusawal-425201','NA','AMPPJ5872N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9923095287',NULL,NULL,NULL,NULL,NULL,NULL),(351,'1372','EMP0000351',NULL,'Mr.','Dhaval',NULL,'Rami','1991-07-25','Male','0','9145489231','0','dhaval.rami@sganalytics.com','dhaval.rami1991@gmail.com','K-204, ShriNand Nugar Part 1, Vejalpur',1,7,20,'Ahmedabad',51,'A-302,Laxmi Township Phase-1,Vishrantwadi,Pune-411015','NA','BWMPR5002G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'8788862984',NULL,NULL,NULL,NULL,NULL,NULL),(352,'1373','EMP0000352',NULL,'Mr.','Prabhat',NULL,'Gupta','1987-04-23','Male','0','8454073247','0','prabhat.gupta@sganalytics.com','gprabhat47@gmail.com','5, Amar Town house, Amar Complex, New Sawa',1,7,23,'Vadodara',390008,'D-201,IRIS,Magarpatta City,Pune-411028','NA','AJDPG4605K','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9825317001',NULL,NULL,NULL,NULL,NULL,NULL),(353,'1374','EMP0000353',NULL,'Mr.','Sunil',NULL,'Mane','1974-12-22','Male','7572','9989929922','0','sunil.mane@sganalytics.com','sunimane13@gmail.com','A-30, Vasant Vihar Apartment, S No 33/2/1, Behind Lokmat Press, Sinhagad Road',1,15,83,'Pune',41,'A-30,Vasant Vihar Apartment,S No 33/2/1,Behind Lokmat Press,Sinhagad Road,Pune-41','NA','AJIPM0175D','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9989928822',NULL,NULL,NULL,NULL,NULL,NULL),(354,'1375','EMP0000354',NULL,'Mr.','Wilbur',NULL,'Francis','1988-09-18','Male','0','9850445813','0','wilbur.francis@sganalytics.com','wilbur.francis@gmail.com','B 10, Kantinimai Housing Society, Near Sai Baba Mandir, Sai Baba Nagar, Kondhwa Khurd',1,15,83,'Pune',411048,'B 10,Kantinimai Housing Society,Near Sai Baba Mandir,Sai Baba Nagar,Kondhwa Khurd,Pune-411048','NA','ABPPF3664H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'9657542102',NULL,NULL,NULL,NULL,NULL,NULL),(355,'1376','EMP0000355',NULL,'Mr.','Pankaj',NULL,'Patil','1990-10-01','Male','0','9890760670','0','pankaj.patil@sganalytics.com','pankaj011090@gmail.com','453-2 Patil Galwada,Kadgaon',1,15,75,'Gadhinglaj',416502,'12 Vrindavan Apartment,Opposite BSNL Office,Wadgaon Sheri,Pune-14','NA','CVOPP0613D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'9271268920',NULL,NULL,NULL,NULL,NULL,NULL),(356,'1377','EMP0000356',NULL,'Mr.','Siddharth',NULL,'Jain','1990-10-07','Male','0','8879998863','0','siddharth.jain@sganalytics.com','siddharthjain071090@gmail.com','13/52, Yashwant Nagar, Goregaon(W), Opp Ganesh Mandir',1,15,77,'Mumbai',400062,'13/52,Yashwant Nagar,Goregaon(W),Opp Ganesh Mandir Mumbai-400062','NA','ALDPJ5911H','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9833651020',NULL,NULL,NULL,NULL,NULL,NULL),(357,'1378','EMP0000357',NULL,'Miss','Deepa',NULL,'Math','1991-09-12','Female','0','9739296459','0','deepa.math@sganalytics.com','deepa.math03@gmail.com','Door No 364, 9th ward, Near Markandeshwara School, Sadashiva Nagar',1,12,41,'Hospet',0,'Door No 364,9th ward,Near Markandeshwara School,Sadashiva Nagar,Hospet,Bellary,Karnataka','NA','BKKPD1922K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9590693312',NULL,NULL,NULL,NULL,NULL,NULL),(358,'1379','EMP0000358',NULL,'Mr.','Gaurav',NULL,'Tayal','1991-06-14','Male','0','9968899667','0','gaurav.tayal@sganalytics.com','gaurav.tayal1991@gmail.com','D67A, Lajpat Nagar, Sahibabad',1,28,119,'Ghaziabad',201005,'D67A,Lajpat Nagar,Sahibabad,Ghazibad(U.P)-201005','NA','AQLPT8432A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9926334833',NULL,NULL,NULL,NULL,NULL,NULL),(359,'1380','EMP0000359',NULL,'Miss','Latika',NULL,'Sachdeva','1985-12-22','Female','0','9899454588','0','latika.sachdeva@sganalytics.com','latika.sachdeva@gmail.com','711, Metro View Apartments, Pocket - B, Sector - 13, Dwarka',1,5,17,'New Delhi',110078,'Flat no 9, Building A-1, Phase - 2, Ratn Park, Pashan Sus Road,Pune','NA','BNJPS6297Q','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9013131549',NULL,NULL,NULL,NULL,NULL,NULL),(360,'1381','EMP0000360',NULL,'Mr.','Ankit',NULL,'Bhingare','1992-05-29','Male','0','9561052679','0','ankit.bhingare@sganalytics.com','ankit.bhingare@gmail.com','262/B - 9, Sai - Suman CHS LTD, Sector 2, Charkop, Kandivali West',1,15,77,'Mumbai',400067,'262/B - 9, Sai - Suman CHS LTD, Sector 2, Charkop, Kandivali West, Mumbai - 400067','NA','AYBPB8583G','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9869418190',NULL,NULL,NULL,NULL,NULL,NULL),(361,'1382','EMP0000361',NULL,'Mrs.','Shilin',NULL,'Josline','1991-04-01','Female','0','9686243501','0','shilin.josline@sganalytics.com','shil.josline@gmail.com','2C - 202, East of NGEF Layout, Kasturi Nagar',1,12,42,'Bengaluru',560043,'302, A.K. Residency, new Airport Road, Pune - 411032','NA','ATRPJ7619J','NA','Married',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'9790939660',NULL,NULL,NULL,NULL,NULL,NULL),(362,'1383','EMP0000362',NULL,'Mrs.','Shravya',NULL,'Ananthapur','1990-02-22','Female','0','7030568348','0','shravya.ananthapur@sganalytics.com','shravya.ananthpur@gmail.com','\"Shruthi Shravya\", # 196/2, M.C.C \"A\" block, Ashraya Hospital Road',1,12,44,'Davangere',577004,'Palladium Homes, E - 904, Lohegaon Dhanori Road, Dhanori, Pune','NA','BTKPS6536H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9910545671',NULL,NULL,NULL,NULL,NULL,NULL),(363,'1384','EMP0000363',NULL,'Miss','Sonal',NULL,'Kothari','1989-03-01','Female ','0','7875481199','0','sonal.kothari@sganalytics.com','sonalk.89@gmail.com','1/302,Gera Gardens,Koregaon Park,Near Taj Vivanta Hotel,Pune',1,15,83,'Pune',411001,'83-MIT Revieria,Opposite Max Muller Bhavan,Boat Club Road,Pune-411001','NA','BBDPK5600F','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9422304232',NULL,NULL,NULL,NULL,NULL,NULL),(364,'1385','EMP0000364',NULL,'Mr.','Aveek',NULL,'Roy','1975-02-23','Male ','0','9886139876','0','aveek.roy@sganalytics.com','aaveekroy@yahoo.in','C/o Shri Ajoy Kumar Roy,Kenchs Trace Road,Laban,Shillong,Meghalaya',1,16,92,'Shillong',793004,'C/o Shri Ajoy Kumar Roy,Kenchs Trace Road,Laban,Shillong,Meghalaya-793004','NA','AHVPR6144G','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,9,NULL,'9886259876',NULL,NULL,NULL,NULL,NULL,NULL),(365,'1386','EMP0000365',NULL,'Mr.','Praful',NULL,'Damodar','1990-10-03','Male ','0','8421260832','0','praful.damodar@sganalytics.com','mcapraful@gmail.com','S.No-77,Samarth Nagar,Near Tannu School,Sai Chowk,New Sangvi',1,15,83,'Pune',411027,'S.No-77,Samarth Nagar,Near Tannu School,Sai Chowk,New Sangvi,Pune-411027','NA','BMVPD6345K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,9,NULL,'8380075230',NULL,NULL,NULL,NULL,NULL,NULL),(366,'1387','EMP0000366',NULL,'Mr.','Vipin',NULL,'Ganvir','1984-09-17','Male ','0','8087696090','0','vipin.ganvir@sganalytics.com','vipin.ganvir15@gmail.com','J.W Ganvir,Near De Ambedkar Square,Patipura,Yavatmal',1,15,91,'Yavatmal',443001,'Flat No 201,Sayali,Siddhivinayak Manas Society,Dhayri Phata,Sinhagad Road,Pune-41','NA','AqLPG4889Q','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9860394105',NULL,NULL,NULL,NULL,NULL,NULL),(367,'1388','EMP0000367',NULL,'Mr.','Nikhil',NULL,'Ingle','1990-03-17','Male ','0','9762972943','0','nikhil.Ingle@sganalytics.com','ingle.nikhil17@gmail.com','S.No 82/2/1,sudarshan Nagar,Near Mahadev Mandir,Pimple Gurav',1,15,83,'Pune',411061,'S.No 82/2/1,sudarshan Nagar,Near Mahadev Mandir,Pimple Gurav,Pune -411061','NA','ACZPI15115K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'8446189076',NULL,NULL,NULL,NULL,NULL,NULL),(368,'1389','EMP0000368',NULL,'Mr.','Adhik',NULL,'Sathe','1981-02-20','Male ','0','9922926065','0','adhik.sathe@sganalytics.com','adhiksathe@gmail.com','1480,Shukrawar Peth,Tulshibag Road,Rajendra Park Society',1,15,83,'Pune',411061,'1480,Shukrawar Peth,Tulshibag Road,Rajendra Park Society,Pune-411002','NA','AZIPS1202M','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9850899172',NULL,NULL,NULL,NULL,NULL,NULL),(369,'1391','EMP0000369',NULL,'Mr.','Mohit',NULL,'Sehra','1995-12-30','Male ','0','7060585855','0','mohit.sehra@sganalytics.com','msehra70@gmail.com','H.No 25,Anand dham Colony,Krishma Nagar,Mathura',1,28,123,'Mathura',0,'H.No 25,Anand dham Colony,Krishma Nagar,Mathura','NA','GVWPS2433C','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'8979154779',NULL,NULL,NULL,NULL,NULL,NULL),(370,'1392','EMP0000370',NULL,'Mr.','Simran',NULL,'Singh','1994-10-20','Male ','0','8972049325','0','simran.singh@sganalytics.com','sssimran94@gmail.com','892,Sector-70,Mohali,Punjab',1,25,103,'Mohali',0,'892,Sector-70,Mohali,Punjab','NA','FWMPS5513M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'9417527818',NULL,NULL,NULL,NULL,NULL,NULL),(371,'1393','EMP0000371',NULL,'Miss','Alka',NULL,'Singh','1994-08-20','Female ','0','9534037104','0','alka.singh@sganalytics.com','alkasingh.dhn@gmail.com','Flat No-404,Nirmala Kunj,NearOld Zila School,Anandtola,Jagjivan Nagar,Dhanbad,Jharkhand',1,11,34,'Dhanbad',826001,'Flat No-404,Nirmala Kunj,NearOld Zila School,Anandtola,Jagjivan Nagar,Dhanbad,Jharkhand-826001','NA','EIJPS4960N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'888426444',NULL,NULL,NULL,NULL,NULL,NULL),(372,'1394','EMP0000372',NULL,'Mr.','Sunil',NULL,'Kumar','1993-01-20','Male ','0','8116455001','0','sunil.kumar@sganalytics.com','asunil2001@gmail.com','S.no-5-27/A,Moningi street,Hiramandalam-532459,Srikakulam,Andhra Pradesh',1,1,5,'Srikakulam',0,'S.no-5-27/A,Moningi street,Hiramandalam-532459,Srikakulam,Andhra Pradesh','NA','CUDPK9048M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'9411111990',NULL,NULL,NULL,NULL,NULL,NULL),(373,'1396','EMP0000373',NULL,'Mr.','Sarfaraz',NULL,'Chougule','1978-08-12','Male ','0','8149974060','0','sarfaraz.chougule@sganalytics.com','sarfaraz.chougule@gmail.com','#2,Alfa Comforts,Sr.No 46/10,Opp.New Grace English School,Kondhwa(BK),Pune',1,15,83,'Pune',411002,'1B,604,H & M Royal,Opposite Talab Factory,Kondhwa(BK),Pune-411048','NA','AFLPC8868C','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9323701550',NULL,NULL,NULL,NULL,NULL,NULL),(374,'1397','EMP0000374',NULL,'Mr.','Samit',NULL,'Tamhaney','1974-01-31','Male ','0','9916511003','0','samit.tamhaney@sganalytics.com','samit_t@hotmail.com','Flat No :B 309,Bhavya Serene Apartments,Off Central Jail Road,Near Norbet Church,3rd Cross,Bangalore',1,12,42,'Bengaluru',560035,'Flat No :B 309,Bhavya Serene Apartments,Off Central Jail Road,Near Norbet Church,3rd Cross,Bangalore560035','NA','ACZPT6314R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9916928003',NULL,NULL,NULL,NULL,NULL,NULL),(375,'1398','EMP0000375',NULL,'Miss','Ammarah',NULL,'Khan','1991-07-28','Female ','0','8087995642','0','ammarah.khan@sganalytics.com','khanammarah@gmail.com','A3/C-17,Ravi Park,Jagtap Nagar,Wanawadi,Pune',1,15,83,'Pune',411048,'A3/C-17,Ravi Park,Jagtap Nagar,Wanawadi,Pune-411040','NA','BJUPK1389N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'8087995641',NULL,NULL,NULL,NULL,NULL,NULL),(376,'1399','EMP0000376',NULL,'Miss','Neha',NULL,'Kandwal','1992-09-30','Female ','0','8860852814','0','neha.kandwal@sganalytics.com','kandwalneha92@gmail.com','A-304,Appu Enclave Apartments,Plot No.3d,Sector -II,Dwarka,New Delhi',1,22,94,'New Delhi',11075,'A-304,Appu Enclave Apartments,Plot No.3d,Sector -II,Dwarka,New Delhi-11075','NA','DQKPK4850H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9811628951',NULL,NULL,NULL,NULL,NULL,NULL),(377,'1400','EMP0000377',NULL,'Miss','Renuka',NULL,'Toshniwal','1990-04-10','Female ','0','9960637205','0','renuka.toshniwal@sganalytics.com','renuka.toshniwal@gmail.com','4,Ulkanagri,Jawahar Colony,\'Toshniwal Complex\',Garkheda Parisar,Opp.Bank of India,Aurangabad',1,15,68,'Aurangabad',431009,'4,Ulkanagri,Jawahar Colony,\'Toshniwal Complex\',Garkheda Parisar,Opp.Bank of India,Aurangabad,431009','NA','AKIPT1046R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9960637202',NULL,NULL,NULL,NULL,NULL,NULL),(378,'1401','EMP0000378',NULL,'Miss','Monica',NULL,'Shrestha','1992-07-15','Female ','0','9930855150','0','monica.shrestha@sganalytics.com','mshrestha8888@gmail.com','Jyatha,30,Kathmandu,Nepal(190/28 Amrit Marg)',1,21,93,'Kathmandu',0,'Jyatha,30,Kathmandu,Nepal(190/28 Amrit Marg)','NA','COBPM5423E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9860568875',NULL,NULL,NULL,NULL,NULL,NULL),(379,'1402','EMP0000379',NULL,'Mr.','Rhishikesh',NULL,'Gawali','1990-11-03','Male ','0','8605473349','0','rhishikesh.gawali@sganalytics.com','rushikeshgawali@gmail.com','S.No 20/4,Kharadkar Park,Kharadi,Near Columbia Asia Hospital,Pune',1,15,83,'Pune',411014,'S.No 20/4,Kharadkar Park,Kharadi,Near Columbia Asia Hospital,Pune-14','NA','BECPG2522Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9552759291',NULL,NULL,NULL,NULL,NULL,NULL),(380,'1403','EMP0000380',NULL,'Mr.','Vaibhav',NULL,'Utane','1989-08-27','Male ','0','7722038000','0','vaibhav.utane@sganalytics.com','magicvaibhav@gmail.com','Plot No-17,Mahalaxmi Housing Society,Beltarodi road Nagpur',1,15,78,'Nagpur',440015,'Plot No-17,Mahalaxmi Housing Society,Beltarodi road Nagpur 440015','NA','ADZPU5178M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9850183040',NULL,NULL,NULL,NULL,NULL,NULL),(381,'1404','EMP0000381',NULL,'Miss','Mohini',NULL,'Aphale','1991-11-29','Female ','0','8871823132','0','mohini.aphale@sganalytics.com','mohini.imdr@gmail.com','D-204,Pine,Spring ValleyDew,Katara Hills,Bhopal',1,14,51,'Bhopal',462043,'E/4,Navaldhan,PMC Colony,Hanuman Nagar,Senapati Bapat Road,Near Ratna Hospital,Pune-16','NA','BALPA0582R','NA','Unmarried',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9826040186',NULL,NULL,NULL,NULL,NULL,NULL),(382,'1405','EMP0000382',NULL,'Mr.','Amit',NULL,'Khillare','1989-07-14','Male ','0','8087501079','0','amit.khillare@sganalytics.com','amitkhillare1@gmail.com','P.N 70,Pethe Nagar,Bhausingh pura,Aurangabad',1,15,68,'Aurangabad',431004,'301,Sai Krupa Apartment,Gokul Nagar,Dhanori,Pune-411015','NA','DRDPK8923D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'9545010399',NULL,NULL,NULL,NULL,NULL,NULL),(383,'1406','EMP0000383',NULL,'Mr.','Dinesh',NULL,'Poojary','1971-07-10','Male ','0','7798365796','0','dinesh.poojari@sganalytics.com','dineshpujari@gmail.com','H.no:2-84,Badyar House,Eliyamadu Village,Marinakatti Post,Karnataka',1,12,45,'Marinakatti Post',574324,'Survey No.16,Savta Mali Colony,Gondhale Nagar,Hadapsar,Pune-411028','NA','AQRPP6709L','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9011559483',NULL,NULL,NULL,NULL,NULL,NULL),(384,'1407','EMP0000384',NULL,'Mrs.','Priyanka',NULL,'Sinha','1989-11-06','Female ','0','8087471260','0','priyanka.sinha@sganalytics.com','pr.sinha06@gmail.com','10/119, Rukmini Niwas, Dr Bhabha Marg, Munka Bagicha, Kani Bazar, Hazaribag, Jharkhand',1,11,35,'Hazaribag',825301,'H1 - 601, Solacia Phase -2, BAIF Road, Near Wagheswar Temple, Wagholi, Pune - 412207','NA','GKMPS6018C','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'7507956805',NULL,NULL,NULL,NULL,NULL,NULL),(385,'1408','EMP0000385',NULL,'Miss','Mojgon',NULL,'Navayazdan','1992-10-16','Female ','0','7776917562','0','mojgon.navayazdan@sganalytics.com','mojgonnavayazdan@yahoo.com','Flat no - 401, A - Wing, Shri Ram Pride, Sr no 18, Dhanori, Pune',1,15,83,'Pune',411015,'Flat no 810, Bldg No B-5, Green Hive Society, Bhekarai Nagar, Phursungi, Pune - 412308','NA','AQDPN9578P','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,8,NULL,'7776917561',NULL,NULL,NULL,NULL,NULL,NULL),(386,'1409','EMP0000386',NULL,'Mr.','Nitin',NULL,'Karva','1990-05-10','Male ','0','9422108747','0','nitin.karva@sganalytics.com','karwa.nitin@gmail.com','C/O, Laxmi Sall Mill, Jintur Road, Distrcit Parbhani, Selu',1,15,82,'Selu',431503,'Flat no -702, A - 2, Belcastle Society, Near New Orbis School, Keshav nagar, Mundhwa, Pune - 411036','NA','BRLPK6834K','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'7276161716',NULL,NULL,NULL,NULL,NULL,NULL),(387,'1410','EMP0000387',NULL,'Mr.','Madhup',NULL,'Sukoon','1996-01-23','Male ','0','8116168198','0','madhup.sukoon@sganalytics.com','madhup96@gmail.com','Sai Dua Niwas, II B, Shyama Apartment, Block -B, Hirapur, Dhanbad, Jharkhand',1,11,34,'Dhanbad',0,'Sai Dua Niwas, II B, Shyama Apartment, Block -B, Hirapur, Dhanbad, Jharkhand','NA','EYSPS5212L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,10,NULL,'9430382591',NULL,NULL,NULL,NULL,NULL,NULL),(388,'1411','EMP0000388',NULL,'Mrs.','Suvarna',NULL,'Shelar','1987-06-18','Female ','0','9763571044','0','suvarna.shelar@sganalytics.com','suvarnashelar10@gmail.com','H.no. B -23, First Floor, Flat no 2, S. no. 71/1+2, Matermind school Road, Krushna nagar, Navi Sangavi, Pune',1,15,83,'Pune',411027,'H.no. B -23, First Floor, Flat no 2, S. no. 71/1+2, Matermind school Road, Krushna nagar, Navi Sangavi, Pune - 411027','NA','CXSPS4315R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'8308605103',NULL,NULL,NULL,NULL,NULL,NULL),(389,'1412','EMP0000389',NULL,'Miss','Konica',NULL,'Kothari','1993-12-30','Female ','0','7770077131','0','konica.kothari@sganalytics.com','konicakothari@gmail.com','446, Raviwar Peth, Opp Railway Booking Office, Pune',1,15,83,'Pune',411002,'446, Raviwar Peth, Opp Railway Booking Office, Pune - 411002','NA','BFRPK9115F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9823055656',NULL,NULL,NULL,NULL,NULL,NULL),(390,'1413','EMP0000390',NULL,'Mr.','Ishan',NULL,'Dafaria','1994-06-30','Male ','0','7000056114','0','ishan.dafaria@sganalytics.com','dafariaishan94@gmail.com','B - 616, Mahananda Nagar, Ujjan, MP',1,14,64,'Ujjain',456010,'B - 616, Mahananda Nagar, Ujjan, MP - 456010','NA','BLNPD6725N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9826362729',NULL,NULL,NULL,NULL,NULL,NULL),(391,'1414','EMP0000391',NULL,'Miss','Aishwarya',NULL,'Mate','1994-09-21','Female ','0','8983116963','0','aishwarya.mate@sganalytics.com','aish21.1994@gmail.com','Flat no 202, Saiket Apartments, Off Lane No 15, Prabhat Raod, Pune',1,15,83,'Pune',411004,'Flat no 202, Saiket Apartments, Off Lane No 15, Prabhat Raod, Pune - 411004','NA','CFCPM7755P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9822009368',NULL,NULL,NULL,NULL,NULL,NULL),(392,'1415','EMP0000392',NULL,'Miss','Priyanka',NULL,'Dalvi','1996-05-09','Female ','0','7387397481','0','priyanka.dalvi@sganalytics.com','priyankajd96@gmail.com','1089, Raviwar Peth, Behind Agresen Bhavan, Pune',1,15,83,'Pune',411002,'1089, Raviwar Peth, Behind Agresen Bhavan, Pune - 411002','NA','CDNPD4437Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9890111723',NULL,NULL,NULL,NULL,NULL,NULL),(393,'1416','EMP0000393',NULL,'Miss','Janhavi',NULL,'Umbrekar','1988-05-08','Female ','0','7066640806','0','janhavi.umbrekar@sganalytics.com','janhavi.umbrekar@gmail.com','615, Vyankatesh Apartment, Shaniwar Peth, Opposite Maharashtra Paper Company, Pune',1,15,83,'Pune',411030,'615, Vyankatesh Apartment, Shaniwar Peth, Opposite Maharashtra Paper Company, Pune - 411030','NA','ABOPU6132A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9860785327',NULL,NULL,NULL,NULL,NULL,NULL),(394,'1418','EMP0000394',NULL,'Mr.','Abhishek',NULL,'Lingras','1990-10-10','Male ','0','9822659717','0','abhishek.lingras@sganalytics.com','a.b.lingras@gmail.com','1748, E ward, Rajarampuri, 5th lane, Kolhapur',1,15,75,'Kolhapur',416008,'Sai Villa Bunglow, Kalashree Lane No 3, Cummins college road, Karve Nagar, Pune - 411052','NA','AEMPL9905M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9421244500',NULL,NULL,NULL,NULL,NULL,NULL),(395,'1419','EMP0000395',NULL,'Miss','Rubica',NULL,'Bhowmick','1991-07-23','Female ','0','7875036673','0','rubica.bhowmick@sganalytics.com','rubica1000@gmail.com','Flat No - 728, Rail Vihar, Kasba Golpark, Kolkata',1,30,131,'Kolkata',700107,'B - 502, Zinnia, Magarpatta City, Pune - 411028','NA','BVLPB1016N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,9,NULL,'8208393174',NULL,NULL,NULL,NULL,NULL,NULL),(396,'1420','EMP0000396',NULL,'Mr.','Subash',NULL,'Rambhatla','1985-10-26','Male ','0','8886884410','0','subash.rambhatla@sganalytics.com','subash.rambhatla@gmail.com','H.No:10-25/1, St.No:8, HMT Nagar, Nacharam',1,27,112,'Nacharam',500076,'H.No:10-25/1, St.No:8, HMT Nagar, Nacharam-76','NA','AQXPR3722M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9581261391',NULL,NULL,NULL,NULL,NULL,NULL),(397,'1421','EMP0000397',NULL,'Mr.','Yogesh',NULL,'Nehchalani','1993-12-13','Male','0','8871581862','0','yogesh.nehchalani@sganalytics.com','nehchalani@gmail.com','82,Revenue Nagar,Behind Sukhmani Hero Showroom',1,14,57,'Indore',0,'82,Revenue Nagar,Behind Sukhmani Hero Showroom,Indore MP','NA','BBQPN2110Q','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9920755389',NULL,NULL,NULL,NULL,NULL,NULL),(398,'1422','EMP0000398',NULL,'Mr.','Ankit',NULL,'Jain','1991-01-14','Male','0','9752222983','0','ankit.jain@sganalytics.com','ankit147jain@yahoo.co.in','51,Vinoda Nagar,Near Ravindra Nagar',1,14,57,'Indore',0,'51,Vinoda Nagar,Near Ravindra Nagar,Indore','NA','AQHPJ8724D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9977999410',NULL,NULL,NULL,NULL,NULL,NULL),(399,'1423','EMP0000399',NULL,'Mr.','Pranay',NULL,'Bharambe','1990-10-16','Male','0','9561174766','0','pranay.bharambe@sganalytics.com','pranay.tesla@gmail.com','A-1,Mantri Park,Behind Kothrud Bus Stand,Kothrud',1,15,83,'Pune',411038,'A-1,Mantri Park,Behind Kothrud Bus Stand,Kothrud,Pune-38','NA','AUWPB3863J','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9110948821',NULL,NULL,NULL,NULL,NULL,NULL),(400,'1424','EMP0000400',NULL,'Mr.','Sachin',NULL,'Kumar','1978-07-27','Male','0','9717003721','0','sachin.kumar@sganalytics.com','sachin.sinha27@gmail.com','UG-1,Devkunj Apartment,Plot No-618,Sector-1,Vaishali',1,28,119,'Ghaziabad',0,'UG-1,Devkunj Apartment,Plot No-618,Sector-1,Vaishali,Ghaziabad','NA','APDPK4942F','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9899313221',NULL,NULL,NULL,NULL,NULL,NULL),(401,'1425','EMP0000401',NULL,'Miss','Juhi',NULL,'Gaikwad','1994-04-06','Female','0','9547056342','0','juhi.gaikwad@sganalytics.com','juhigaikwad06@gmail.com','NIT Plot no 383, Kushi Nagar, Jaripatak',1,15,78,'Nagpur',440014,'NIT Plot no 383, Kushi Nagar, Jaripatak, Nagpur - 440014','NA','BRTPG9671A','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9373120078',NULL,NULL,NULL,NULL,NULL,NULL),(402,'1426','EMP0000402',NULL,'Mr.','Wasim',NULL,'Akram','1990-09-23','Male','0','9604557119','0','wasim.akram@sganalytics.com','wasim.akram960@gmail.com','House no 130, Vill+Post : TELO, Dandudih',1,11,33,'Bokaro',0,'Anand Niwas, Near Hanuman Mandir, Chandan Nagar, Pune - 411014','NA','ATIPA2087L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'7741074044',NULL,NULL,NULL,NULL,NULL,NULL),(403,'1427','EMP0000403',NULL,'Mr.','Sujit',NULL,'Daswant','1992-08-08','Male','0','9921530494','0','sujit.daswant@sganalytics.com','sujit88daswant@outlook.com','AP - Geoudgoan, Tal Barshi',1,15,88,'Solapur',413406,'AP - Geoudgoan, Tal Barshi, District Solapur - 413406','NA','BIFPD8150A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9921530494',NULL,NULL,NULL,NULL,NULL,NULL),(404,'1428','EMP0000404',NULL,'Mr.','Tanmay',NULL,'Gupta','1994-12-28','Male','0','7803095128','0','tanmay.gupta@sganalytics.com','tanmaygupta2812@gmail.com','61/5, Manorama Ganj',1,14,57,'Indore',0,'61/5, Manorama Ganj, Indore','NA','BMDPG6621B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9827622360',NULL,NULL,NULL,NULL,NULL,NULL),(405,'1429','EMP0000405',NULL,'Miss','Priya',NULL,'Baldwa','1993-08-02','Female','0','8854057718','0','priya.baldwa@sganalytics.com','priyabaldwa02@gmail.com','B - 20, Basant Vihar',1,26,106,'Bhilwara',311001,'B - 20, Basant Vihar, Bhilwara, Rajasthan - 311001','NA','CBAPB6851M','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'9414114463',NULL,NULL,NULL,NULL,NULL,NULL),(406,'1430','EMP0000406',NULL,'Mr.','Vikram',NULL,'Paranjpe','1989-05-21','Male','0','9730811566','0','vikram.paranjpe@sganalytics.com','vikramparanjpe55@gmail.com','403/Bullet Building, Hindu Colony, L.N. Road, Dadar - East',1,15,77,'Mumbai',400014,'A3/402, Kumar Palmgrove Society, Near Sai Services, Kondhwa Khurd, Pune - 411048','NA','BAZPP0579H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,7,NULL,'7276236457',NULL,NULL,NULL,NULL,NULL,NULL),(407,'1431','EMP0000407',NULL,'Mr.','Shahbaz',NULL,'Khan','1994-12-04','Male','0','9049227337','0','shahbaz.khan@sganalytics.com','shahbazkhan3330@gmail.com','B - 19, Tejas Kamdhenu Estates, Opposite Mantri Market, Hadapsar',1,15,83,'Pune',411028,'B - 19, Tejas Kamdhenu Estates, Opposite Mantri Market, Hadapsar - 411028','NA','CUYPK0782R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,1,NULL,'8600990005',NULL,NULL,NULL,NULL,NULL,NULL),(408,'1432','EMP0000408',NULL,'Mr.','Shashwat',NULL,'Siddhant','1995-10-12','Male','0','9663576497','0','shashwat.siddhant@sganalytics.com','shashwat007@gmail.com','C/18, Jal Vidyut Apartment, Sector - 21C,Part - III',1,8,24,'Faridabad',121001,'C/18, Jal Vidyut Apartment, Sector - 21C,Part - III, Faridabad - 121001','NA','IUHPS9231J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9717092692',NULL,NULL,NULL,NULL,NULL,NULL),(409,'1433','EMP0000409',NULL,'Miss','Asha',NULL,'Christina','1987-05-15','Female','0','9902328453','0','asha.christina@sganalytics.com','ash.christina.ac@gmail.com','No - 137, Lalbagh Road',1,12,42,'Bengaluru',560027,'No - 137, Lalbagh Road, Bangalore - 560027','NA','ARLPC6075D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9008900607',NULL,NULL,NULL,NULL,NULL,NULL),(410,'1434','EMP0000410',NULL,'Miss','Purva',NULL,'Jathar','1992-08-27','Female','0','8329905917','0','purva.jathar@sganalytics.com','purvajathar1@gmail.com','Flat No. BC - 10, Srikrupa Bldg, Atal Society, Bibewadi Road, Bibwewadi',1,15,83,'Pune',411037,'Flat No. BC - 10, Srikrupa Bldg, Atal Society, Bibewadi Road, Bibwewadi, Pune - 411037','NA','AZAPJ2363A','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9422512426',NULL,NULL,NULL,NULL,NULL,NULL),(411,'1435','EMP0000411',NULL,'Miss','Baby',NULL,'Tabassum','1980-09-08','Female','0','8506831109','0','baby.tabassum@sganalytics.com','dishadu.2304@gmail.com','House No F / 469, Street No - 19, Khojoori Khas, Karawal Nagar Road',1,5,17,'Delhi',110094,'House No F / 469, Street No - 19, Khojoori Khas, Karawal Nagar Road, Delhi - 110094','NA','AQWPT0370J','NA','Unmarried',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'7503527129',NULL,NULL,NULL,NULL,NULL,NULL),(412,'1436','EMP0000412',NULL,'Mrs.','Neha',NULL,'Kumari','1990-08-07','Female','0','7030524784','0','neha.kumari@sganalytics.com','neha.kumari692@gmail.com','Amanora Park Town, Aspire Tower, 04/1704, Hadapsar',1,15,83,'Pune',411028,'Amanora Park Town, Aspire Tower, 04/1704, Hadapsar, Pune - 411028','NA','BLHPK6070M','NA','Married',9,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-09-19 05:21:07','2017-09-19 05:21:07',NULL,NULL,NULL,NULL,NULL,NULL,'9623258163',NULL,NULL,NULL,NULL,NULL,NULL),(413,'1437','EMP0000413',NULL,'Mr.','Nikhil',NULL,'Basantani','1993-01-19','Male','0','9960993800','0','nikhil.basantani@sganalytics.com','nikhilbasantani@gmail.com','Flat no 12, Vrundhavan Apartment, Near Post Office, Wadgoansheri',1,15,83,'Pune',411014,'Flat no 12, Vrundhavan Apartment, Near Post Office, Wadgoansheri, Pune - 411014','NA','BNBPB1637D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,8,NULL,'9890760670',NULL,NULL,NULL,NULL,NULL,NULL),(414,'1438','EMP0000414',NULL,'Mr.','Rohit',NULL,'Shelare','1991-10-09','Male','0','9545310138','0','rohit.shelare@sganalytics.com','rohitshelare1@gmail.com','Plot no 722, Buddha Nagar, B/H, Jaswant Tuli Mall, Post Dr. Ambedkar Marg',1,15,78,'Nagpur',440017,'Flat no 7,Wing A, Sai Residency, B/H Amaar Hotel, Chandan Nagar, Pune - 411014','NA','FORPS2325E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,8,NULL,'9850598963',NULL,NULL,NULL,NULL,NULL,NULL),(415,'1439','EMP0000415',NULL,'Mrs.','Kirti',NULL,'Agarwal','1990-06-25','Female','0','8820037479','0','kirti.agarwal@sganalytics.com','kirti.agarwal2506@gmail.com','Chaitali Apartment, Floor 3, Flat no 32, 19/5 K C Dey Lane, Rishra, Hoogly',1,30,129,'Hooghly',712248,'Flat no 1503, Tower No 56, Future Tower, Phase 1, Floor no 15, Amanora Park Town, Hadapsar, Pune - 411028','NA','AXZPA0708M','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,NULL,NULL,'9830628490',NULL,NULL,NULL,NULL,NULL,NULL),(416,'1440','EMP0000416',NULL,'Mr.','Prashant',NULL,'Sancheti','1992-11-26','Male','0','8007649800','0','prashant.sancheti@sganalytics.com','sancheti.prashant26@gmail.com','Near Bazar Galli, Vadalibhoi',1,15,80,'Nashik',423117,'Near Bazar Galli, Vadalibhoi, Nashik - 423117','NA','FPPPS8399H','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,NULL,NULL,'9850514643',NULL,NULL,NULL,NULL,NULL,NULL),(417,'10155','EMP0000417',NULL,'Mr.','Sirish','Kumar','Pammi','1982-02-09','Male','0','9985401202','0','sirishKumar.Pammi@ovum.com','NA','D.No. 2-36-36, Trivedi Nagar, AC Gardens',1,1,4,'Rajahmundry ',533101,'Ho-No 1-2-33/59/102, Flat #102,Samhitha’s Saraswati Nilayam,Plot #59, Prasanth Nagar,Nizampet Road,Kukatpally 500072','617641873362.0','AOFPP6118M','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(418,'10254','EMP0000418',NULL,'Mr.','Dasgupta ',NULL,'Archi ','1971-06-08','Male','0','9885017888','0','archi.dasgupta@Ovum.com','NA','C/o. Ila Dasgupta, Race Course',1,30,130,'Jalpaiguri ',735101,'509, Prajapati Elite 3, HUDA Mayuri Nagar, Miyapur, Hyderabad - 500 049','306109511325.0','AHAPD7345L','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(419,'11178','EMP0000419',NULL,'Miss','Inderpreet',NULL,'Kaur','1985-06-07','Female ','0','7304468754','0','inderpreet.kaur@Ovum.com','NA','House No. 561 B/B, Ashoka Nagar, Near Kharadi',1,15,83,'Pune',411014,'561 B/B ASHOKA NAGAR, KHARADI','NA','BLOPS6167G','NA','Unmarried',1,5,1,5,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(420,'11314','EMP0000420',NULL,'Miss','Neha','Vijay','Dharia','1984-08-12','Female ','0','8886529992','0','neha.dharia@ovum.com','NA','House No. 7, Franconia, 3rd Pasta Lane, Colaba',1,15,77,'Mumbai ',400005,'Neha Dharia and Shailesh Bhojak\n306 Royal Castle,\nKodihalli Village, HAL Sanitary Board Area, 229/33, \nHAL Airport Rd, Bangalore-560017','NA','BBAPD4042B ','NA','Unmarried',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(421,'11315','EMP0000421',NULL,'Mr.','Anupkumar',NULL,'Gangadharan','1981-10-24','Male ','0','8978993011','0','Anupkumar.Gangadharan@ovum.com','NA','MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally',1,27,109,'Hyderabad ',500038,'MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally, Hyderabad.','358356821931.0','AOBPG6594G','NA','Married ',1,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(422,'11321','EMP0000422',NULL,'Mr.','Kedar ','Umesh ','Mohite ','1979-12-05','Male ','0','9740269271','0','kedar.mohite@ovum.com','NA',' 4-c nawab layout, Nirmala Apts, Tilak Nagar, Amravati Road',1,15,78,'Nagpur ',440010,'502, Prajapati Elite III, huda Layout, Mayuri Nagar, Miyapur','853164601947.0','APOPM9466P','J2993891','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(423,'11322','EMP0000423',NULL,'Mr.','Vinay ','Kumar ','R','1978-03-01','Male ','0','9000275924','0','vinay.kumar@sganalytics.com','NA','H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad',1,27,109,'Hyderabad ',500015,'H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad - 500015','898799967864.0','AHCPR7736F','NA','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(424,'11329','EMP0000424',NULL,'Mr.','Vinay ',NULL,'Gupta ','1981-08-05','Male ','0','7702159497','0','vinay.Gupta@ovum.com','NA','Flat No-B1, 8th Floor, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar',1,27,109,'Hyderabad ',500050,'Flat No-B1, 8TH FLOOR, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar-500050','979495750198.0','AJEPG8899E','MH1420080019215','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(425,'11332','EMP0000425',NULL,'Mr.','Subramanian',NULL,'Venkatraman','1984-02-25','Male ','0','9849222067','0','Subramanian.Venkatraman@ovum.com','NA','1-4-879/80, SBI Officers Colony, New bakaram, Gandhi Nagar',1,27,109,'Hyderabad ',500080,'Flat 102 , Jyothi lakeview apartment, Kavuri Hills , Madhapur ','AEVPV9120R','AEVPV9120R','DLFAP009302082000','Married ',1,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(426,'11333','EMP0000426',NULL,'Mrs.','Arunasree',NULL,'Cheparthi','1975-05-10','Female ','0','9849574756','0','Arunasree.Cheparthi@informa.com','NA','Plot No -70, SBH Colony, Mohan Nagar, Kothapet',1,27,109,'Hyderabad ',5000035,'Plot No -70, SBH Colony, Mohan Nagar, Kothapet, Hyderabad - 5000035 ','455516529799.0','AFQPC2682H','NA','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(427,'11336','EMP0000427',NULL,'Mrs.','Anushree',NULL,'Agarwal','1987-05-23','Female ','0','9985602640','0','anushree.agarwal@ovum.com','NA','21-6-500, Ghansi Bazar, Near High Court',1,27,109,'Hyderabad ',500002,'Sai Sharan Chabaria\'s, 2nd Floor, 1-8-264/4, Sindhi Colony, SP Road, Secunderabad','NA','ASVPB5803D','NA','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(428,'11337','EMP0000428',NULL,'Mr.','Naga Sukumar',NULL,'Gattu','1984-12-23','Male ','0','9885784955','0','naga.sukumar@ovum.com','NA','H-No-2-11-44, Ganesh Street, Jangaon',1,27,115,'Warangal',506167,'Flat No- 402. H-No-4-10/3, Plot No 139, Abinay Residency, Budha Nagar,Peerzadiguda, Pin 500039, Ranga Reddy District - AP ','938362397865.0','AMYPG7752M','DLFAP1363562009','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(429,'11338','EMP0000429',NULL,'Mr.','Kiran','Raj','Lokala','1984-02-13','Male ','0','9866616616','0','Kiran.Lokala@ovum.com','NA','Flat 401, Hallmark Ridge, Block - D, Sector - 1, Alkapur Township, \nCyberabad',1,27,109,'Hyderabad ',500089,'Flat 401, Hallmark Ridge, Block - D, Sector - 1, \nAlkapur Township, \nCyberabad - 500089','NA','AEUPL2146N','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(430,'11340','EMP0000430',NULL,'Mr.','Laxmi Reddy',NULL,'Vittalapuram','1987-04-30','Male ','0','7680944430','0','Laxmareddy.Vittalapuram@informa.com','NA','1-13,Vittalapuram,Maldakal,Gadwal',1,27,111,'Mahaboobnagar ',509132,'5-639/302,Sri Krishna Residency,Secretariat Colony, Manikonda, Hyderabad,Pin: 500089','359944400451.0','AHXPV5186G','NA','Married ',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(431,'11343','EMP0000431',NULL,'Mr.','Benny','Paul Prajeev','Mashapari','1981-10-28','Male ','0','9704093431','0','benny.paul@ovum.com','NA','BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi',1,27,109,'Hyderabad ',500047,'BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi, Andhra Pradesh, Pin -500047','523556327179.0','BRVPM6697L','NA','Married ',4,5,1,4,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(432,'11344','EMP0000432',NULL,'Mr.','Kranthi Kumar',NULL,'Buddharaju','1986-01-14','Male ','0','9885307007','0','Kranthi.Buddharaju@ovum.com','NA','H-No: 334,MIG, Balaji Nagar,Kukatpally',1,27,109,'Hyderabad ',500072,'H-No: 334,MIG, Balaji Nagar,Kukatpally, Hyderabad -72 ','370219290273.0','AWQPB8153R','DLFAP010295062006','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(433,'11345','EMP0000433',NULL,'Mr.','Gajender','Satyanarayana ','Bachula','1983-07-17','Male ','0','9866048776','0','gajender.bachula@ovum.com','NA','H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy',1,27,109,'Hyderabad ',500047,'H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy District -Pin -500047','9059 0053 6065','AOJPB9485R','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(434,'11346','EMP0000434',NULL,'Mr.','Chaitanya','Sundara','Pasupuleti','1980-07-10','Male ','0','9948570140','0','chaitanya.sundara@sganalytics.com','NA','Opposite Andhra Bank, Main Road ,Singaraya Konda',1,27,113,'Prakasam ',523101,'Plot No 1129, Opp Pragathi Nagar Church, Pragathi Nagar, Kukatpally, Hyderbad Pin -500090','8184452425490.0','BBUPP9237Q','DLFAP024114342009','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(435,'11349','EMP0000435',NULL,'Mr.','Dhiraj','Pramod','Badgujar','1988-12-10','Male ','0','9423142370','0','dhiraj.badgujar@ovum.com','NA','05, Triveni Darshan Appartments, Bhabha Nagar',1,15,80,'Nashik',422011,'Kaveri Guest House, near post office, Madhapur, Secunderabad','283247865516.0','BMLPB1982J','NA','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(436,'11350','EMP0000436',NULL,'Mr.','Sandeep',NULL,'Sukhavasi','1984-03-14','Male ','0','9966257700','0','sandeep.sukhavasi@ovum.com','NA','12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad',1,27,109,'Hyderabad ',500017,'12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad, 500017','235945348844.0','CHKPS4943R','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(437,'11352','EMP0000437',NULL,'Mrs.','Vinita',NULL,'Mungikar','1990-10-02','Female ','0','9000908579','0','vinita.mungikar@sganalytics.com','NA','2-1-467, Street No 6,Nallakunta',1,27,109,'Hyderabad ',500044,'2-1-467, Street No 6,Nallakunta, Hyderbad , Pin : 500044','367150730270.0','BOTPM1901E','DLFAP0111344910','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(438,'11354','EMP0000438',NULL,'Mr.','Bharath','Kumar','Badavathu','1982-08-07','Male ','0','9160232554','0','Bharathkumar.badavathu@sganalytics.com','NA','H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal',1,27,109,'Hyderabad ',0,'H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal, RR Dist, ','BAXPK1706R','BAXPK1706R','DLDAP03600653462012','Married ',3,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(439,'11358','EMP0000439',NULL,'Mrs.','Venkata','Nagamalleshwari','Pallapothu','1988-10-31','Female ','0','8790789337','0','Nagamalleshwari.PV@ovum.com','NA','H-No -1-3-176/35/4/3, Ground Floor, Padmashali Colony, Gandhi Nagar',1,27,109,'Hyderabad ',500029,'H.No:1-3-176/35/4/3, Padmashali colony, Gandhi nagar, Hyderabad','780765305032.0','BJIPP1450P','AP02320120011087','Married ',6,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(440,'11359','EMP0000440',NULL,'Mr.','Sai Vivek',NULL,'Kammari','1987-06-01','Male ','0','8341383062','0','k.saivivek@informa.com','NA','1-49/2/D , Shankar Nagar, Chandanangar',1,27,109,'Hyderabad ',500050,'1-49/2/D , Shankar Nagar, Chandanangar, Hyderbad , Pin 500050','274805977014.0','AMYPV2916Q','AMYPV2916Q','Unmarried',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(441,'11360','EMP0000441',NULL,'Miss','Manisha',NULL,'Kuthari','1989-05-13','Female ','0','9866505533','0','manisha.kuthari@informa.com','NA','House No-17, Nehru Enclave, G.M.S Road, Ballupur',1,29,126,'Dehradun',248001,'Flat No -301, SVGK Residency , Plot No 53, Megha Hills, Madhapur, Hyderabad ','NA','BDUPK3619M','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(442,'11361','EMP0000442',NULL,'Mr.','Shubham ',NULL,'Pandey ','1990-05-19','Male ','0','9654744841','0','shubham.pandey@informa.com','NA','ME-59, Mini MIG Hemant Vihar, Barra -II',1,28,121,'Kanpur ',208027,'ME-59, Mini MIG Hemant Vihar, Barra -II, Kanpur, Pin 208027','NA','BUOPP3326D','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(443,'11362','EMP0000443',NULL,'Mr.','Sishir Cheela',NULL,'Naren','1989-10-15','Male ','0','8008019108','0','SishirCheela.Naren@ovum.com','NA','T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet',1,27,109,'Hyderabad ',500016,'T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet, Hyderabad, Pin : 500016','NA','AKHPC1026B','NA','Married ',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(444,'11364','EMP0000444',NULL,'Miss','Sangeetika ',NULL,'Srivastava ','1990-01-30','Female ','0','9505952883','0','Sangeetika.Srivastava@ovum.com','NA','\"Shivpuri\" Mall Road, Sitapur',1,28,122,'Lucknow',0,'Plot 121, Phase 3, Kamlapuri Colony, Srinagar Colony, Banjara Hills, Hyderabad, Telangana -500073 ','NA','CZWPS0239J','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(445,'11365','EMP0000445',NULL,'Mr.','Bhupa',NULL,'Prashanth','1990-01-24','Male ','0','9160536357','0','bhupa.prashanth@ovum.com','NA','H-No-9-94/5, Laxmi Nagar Colony, Boduppal',1,27,114,'Hyderabad ',500092,'H.no 9-94/5, Lakshmi nagar colony, Boduppal, Hyd-92','557270199547','BKIPB8121N','NA','Married ',4,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(446,'11366','EMP0000446',NULL,'Mr.','Srinivasa','Rao','Mantha','1990-08-24','Male ','0','9032221627','0','SrinivasaRao.Mantha@ovum.com','NA','7-37/2, Seethampeta,Kothavalsa (Mandalam)',1,1,8,'Vizianagaram',535183,'Flat no 7353, 7th Block, Jana priya metroplos, Mothi Nagar, Hyderabad','993245246447.0','BDEPR3291L','KA5320120002120','Unmarried',7,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(447,'11367','EMP0000447',NULL,'Mr.','Apoorv',NULL,'Gupta','1991-03-10','Male ','0','7745015662','0','apoorv.gupta@ovum.com','NA','RV-10, Indus Gradens, E-8 Extension, Gulmohar Colony',1,14,51,'Bhopal',462039,'A2B-105, KUMAR Paradise, Mundhwa Road, Hadapsar Road, Pin -411028','443145230834.0','BGFPG4313Q','MP04D-2010-0067675','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(448,'11368','EMP0000448',NULL,'Mr.','N V Chalam',NULL,'Lakkapragada','1990-08-07','Male ','0','9666286033','0','NVCHALAM.LAKKAPRAGADA@ovum.com','NA','S/O , LLV Prasad, Near Venugopala Swamy Temple, Movva',1,1,3,'Krishna ',521135,'Flat No- 53, Gulmohar Park Colony, Near Dominos Pizza, Sri Lingampalli, Hyderabad, 500019','589957438576.0','AHUPL8865B','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(449,'11369','EMP0000449',NULL,'Mr.','Dwaipayan ',NULL,'Bose','1989-01-29','Male ','0','9831145839','0','dwaipayan.bose@ovum.com','NA','22/1/1A, Monohar Pukur Road',1,30,131,'Kolkata',700029,'Royal PG, Sr. No 63, Lane 4, Rajaram Patil Nagar, EON IT Park, Khardi, Pune-411014 ','NA','BHEPB6799R','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(450,'11370','EMP0000450',NULL,'Mr.','Praveen ',' Kumar','Vadicharla ','1990-09-17','Male ','0','9948861999','0','PraveenKumar.Vadicharla@sganalytics.com','NA','ST2-1031, Centenary Colony, Rangagiri, Peddapalli',1,27,110,'Karimnagar ',505212,'Plot No-525, HMT Hills, Kukatpally, Hyderabad','466156172556.0','AMEPV9241L','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),(451,'11371','EMP0000451',NULL,'Mr.','Bhaskar ','Phani Shankar ','Thatavarti ','1987-06-18','Male ','0','9910348579','0','thatavartibhaskar.phanishankar@sganalytics.com','NA','D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada',1,1,1,'East Godavari ',533002,'D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada, 533002','624295395791.0','AGNPT0391G','NA','Unmarried',9,5,1,1,'NA','NA','Active',NULL,NULL,1,2,8,NULL,NULL,'2017-09-19 05:21:08','2017-09-19 05:21:08',NULL,NULL,NULL,NULL,7,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL);
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
  `to_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `relation_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_families_on_employee_id` (`employee_id`),
  KEY `index_families_on_blood_group_id` (`blood_group_id`),
  KEY `index_families_on_religion_id` (`religion_id`),
  KEY `index_families_on_relation_master_id` (`relation_master_id`),
  CONSTRAINT `fk_rails_121ea40d37` FOREIGN KEY (`relation_master_id`) REFERENCES `relation_masters` (`id`),
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
  `is_paid` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_food_deductions_on_food_coupan_master_id` (`food_coupan_master_id`),
  KEY `index_food_deductions_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_a0f2d9a2f1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_68f6ba0b6d` FOREIGN KEY (`food_coupan_master_id`) REFERENCES `food_coupan_masters` (`id`)
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
  `goal_approval` tinyint(1) DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraisee_rating_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `r_promotion` tinyint(1) DEFAULT NULL,
  `r_increment` tinyint(1) DEFAULT NULL,
  `r_designation_id` int(11) DEFAULT NULL,
  `r_ctc` decimal(10,0) DEFAULT NULL,
  `final_id` int(11) DEFAULT NULL,
  `final_comment` text COLLATE utf8_unicode_ci,
  `final_rating_id` int(11) DEFAULT NULL,
  `final_confirm` tinyint(1) DEFAULT NULL,
  `f_promotion` tinyint(1) DEFAULT NULL,
  `f_increment` tinyint(1) DEFAULT NULL,
  `f_designation_id` int(11) DEFAULT NULL,
  `f_ctc` decimal(10,0) DEFAULT NULL,
  `performance_calendar_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_bunches_on_employee_id` (`employee_id`),
  KEY `index_goal_bunches_on_period_id` (`period_id`),
  KEY `index_goal_bunches_on_performance_calendar_id` (`performance_calendar_id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
-- Table structure for table `goal_perspectives`
--

DROP TABLE IF EXISTS `goal_perspectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_perspectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_weightage` tinyint(1) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `period_id` int(11) DEFAULT NULL,
  `goal_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_perspective_id` int(11) DEFAULT NULL,
  `attribute_master_id` int(11) DEFAULT NULL,
  `goal_weightage` int(11) DEFAULT NULL,
  `goal_measure` text COLLATE utf8_unicode_ci,
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
  `performance_calendar_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `is_assigned` tinyint(1) DEFAULT NULL,
  `is_hide` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_ratings_on_goal_bunch_id` (`goal_bunch_id`),
  KEY `index_goal_ratings_on_period_id` (`period_id`),
  KEY `index_goal_ratings_on_goal_perspective_id` (`goal_perspective_id`),
  KEY `index_goal_ratings_on_attribute_master_id` (`attribute_master_id`),
  KEY `index_goal_ratings_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_ratings_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_9026e8df92` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_53077b3df5` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_6e86e151d5` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
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
-- Table structure for table `greetings`
--

DROP TABLE IF EXISTS `greetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `greeting_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `birthday_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday_image_file_size` int(11) DEFAULT NULL,
  `birthday_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greetings`
--

LOCK TABLES `greetings` WRITE;
/*!40000 ALTER TABLE `greetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `greetings` ENABLE KEYS */;
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
INSERT INTO `groups` VALUES (1,'sg@gmail.com','$2a$10$Jt.B/eZ7U/Qf3W0KZc4g2.Nx5zKlusD0zO..qg1F6eSm2Pt7349j.','SGA',NULL,NULL,NULL,2,'2017-09-19 05:27:10','2017-09-19 04:13:19','172.16.0.131','192.168.1.38','2017-09-19 04:13:19','2017-09-19 05:27:10',NULL,NULL,NULL,NULL);
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
  `is_send` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `c_off` tinyint(1) DEFAULT NULL,
  `holiday_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'1','Ganesh Chaturthi / Vinayaka Chaturthi','Ganesh Chaturthi / Vinayaka Chaturthi','2017-08-25',NULL,0,'2017-09-19 06:14:41','2017-09-19 06:16:06',0,'Public'),(2,'2','Gandhi Jayanti','Gandhi Jayanti','2017-10-02',NULL,0,'2017-09-19 06:17:01','2017-09-19 06:17:01',1,'National'),(3,'3','Diwali – Laxmi Pooja','Diwali – Laxmi Pooja','2017-10-19',NULL,0,'2017-09-19 06:19:30','2017-09-19 06:19:30',0,'Public'),(4,'4','Christmas Day','Christmas Day','2017-12-25',NULL,0,'2017-09-19 06:20:05','2017-09-19 06:20:05',0,'Public'),(5,'Informa-1','Labor Day','Labor Day','2017-09-04',NULL,0,'2017-09-19 12:23:47','2017-09-19 12:23:47',1,'Public'),(6,'Informa-2','Columbus Day','Columbus Day','2017-10-09',NULL,0,'2017-09-19 12:26:05','2017-09-19 12:26:05',1,'Public'),(7,'Informa-3','Thanksgiving Day','Thanksgiving Day','2017-11-23',NULL,0,'2017-09-19 12:26:45','2017-09-19 12:26:45',1,''),(8,'ME-1','Eid al-Adha','NBO-NBADS-QNB','2017-08-31',NULL,0,'2017-09-19 12:45:59','2017-09-19 13:13:44',1,''),(9,'ME-2','Eid al-Adha','NBO-NBADS-QNB','2017-09-03',NULL,0,'2017-09-19 12:46:30','2017-09-19 13:15:01',1,''),(10,'ME-3','Eid al-Adha','NBO-QNB','2017-09-04',NULL,0,'2017-09-19 12:46:58','2017-09-19 13:15:57',1,''),(11,'ME-4','Eid al-Adha','QNB','2017-09-05',NULL,0,'2017-09-19 12:47:41','2017-09-19 13:16:25',1,''),(12,'ME-5','New Hijri Year','NBO-NBADS','2017-09-21',NULL,0,'2017-09-19 12:50:16','2017-09-19 13:17:23',1,''),(13,'ME-6','National Day','NBO','2017-11-19',NULL,0,'2017-09-19 12:53:34','2017-09-19 13:18:26',1,'Public');
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
  `employee_id` int(11) DEFAULT NULL,
  `induction_master_id` int(11) DEFAULT NULL,
  `activity` text COLLATE utf8_unicode_ci,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_date` date DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `program_agenda` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `induction_completed` tinyint(1) DEFAULT NULL,
  `facilitator_1` text COLLATE utf8_unicode_ci,
  `facilitator_2` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
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
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `is_complete` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_instalments_on_advance_salary_id` (`advance_salary_id`),
  CONSTRAINT `fk_rails_d6336d8b47` FOREIGN KEY (`advance_salary_id`) REFERENCES `advance_salaries` (`id`)
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
  `interview_schedule_id` int(11) DEFAULT NULL,
  `interview_round_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `interview_round_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `selected_resume_id` int(11) DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `candidate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `candidate_name2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
-- Table structure for table `interview_type_masters`
--

DROP TABLE IF EXISTS `interview_type_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interview_type_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_type_masters`
--

LOCK TABLES `interview_type_masters` WRITE;
/*!40000 ALTER TABLE `interview_type_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_type_masters` ENABLE KEYS */;
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
  `is_confirm` tinyint(1) DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
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
  `document_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `company_rfid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gate_rfid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `ot_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `notice_period_after_probation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_off` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'2006-02-01',1,10,'893139163','0',NULL,NULL,'100386521977',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(2,2,'2006-02-18',3,7,'893486699','0',NULL,NULL,'100383353490',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(3,3,'2006-03-01',2,60,'893998619','0',NULL,NULL,'100317423979',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(4,4,'2006-02-20',4,49,'892339691','82518',NULL,NULL,'100382983926',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(5,5,'2006-07-10',6,1,'893409211','0',NULL,NULL,'100101091174',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(6,6,'2006-05-26',6,1,'894100427','0',NULL,NULL,'100099375075',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(7,7,'2006-07-17',6,1,'893325915','0',NULL,NULL,'100397046070',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(8,8,'2007-01-02',6,53,'893135979','0',NULL,NULL,'100285064363',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(9,9,'2007-02-09',5,33,'892774635','0',NULL,NULL,'100396978367',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(10,10,'2007-06-03',7,34,'892668907','0',NULL,NULL,'100320197518',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(11,11,'2006-12-01',2,60,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(12,12,'2010-05-31',4,49,'892569371','0',NULL,NULL,'100097549057',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(13,13,'2010-07-20',6,1,'893031563','0',NULL,NULL,'100101253838',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(14,14,'2010-12-06',5,36,'893947019','0',NULL,NULL,'100101001992',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(15,15,'2010-12-06',5,36,'893923531','0',NULL,NULL,'100378560351',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(16,16,'2011-01-03',5,33,'893311003','0',NULL,NULL,'100757805825',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(17,17,'2011-02-01',5,36,'893319003','10779',NULL,NULL,'100320995610',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(18,18,'2011-02-01',7,22,'893941787','0',NULL,NULL,'100260060774',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(19,19,'2011-02-14',5,40,'893911899','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(20,20,'2011-04-07',5,40,'893247755','0',NULL,NULL,'100201032273',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(21,21,'2011-04-25',5,33,'892916939','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(22,22,'2011-04-25',3,7,'894132075','0',NULL,NULL,'100259587844',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(23,23,'2011-05-02',5,45,'893625147','0',NULL,NULL,'100385159958',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(24,24,'2011-05-16',5,33,'892774587','0',NULL,NULL,'100180745994',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(25,25,'2011-05-16',3,7,'893336523','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(26,26,'2011-06-06',5,6,'893348219','0',NULL,NULL,'100411758148',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(27,27,'2011-09-23',6,40,'893293675','0',NULL,NULL,'100036195915',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(28,28,'2012-02-02',4,49,'894106219','0',NULL,NULL,'100401092196',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(29,29,'2012-02-06',6,58,'894123867','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(30,30,'2012-03-19',6,1,'893299467','0',NULL,NULL,'100382976230',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(31,31,'2012-07-25',6,2,'893338651','0',NULL,NULL,'100425541261',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(32,32,'2012-08-01',5,58,'893349019','0',NULL,NULL,'100329036305',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(33,33,'2012-11-15',5,6,'893054011','0',NULL,NULL,'100386521977',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(34,34,'2013-01-01',5,33,'893760459','0',NULL,NULL,'100379278805',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(35,35,'2013-01-14',6,53,'893033963','0',NULL,NULL,'100118482971',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(36,36,'2013-05-20',5,6,'894131003','0',NULL,NULL,'100805914938',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(37,37,'2013-07-24',6,50,'894092267','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(38,38,'2013-09-02',6,58,'893351467','0',NULL,NULL,'100378374372',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(39,39,'2013-10-01',5,40,'893309563','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(40,40,'2014-01-06',6,2,'893332635','0',NULL,NULL,'100561434208',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(41,41,'2014-01-01',5,40,'893937307','0',NULL,NULL,'100382976230',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(42,42,'2014-02-01',6,1,'892548907','0',NULL,NULL,'100329036305',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(43,43,'2014-02-01',7,20,'893211131','0',NULL,NULL,'100451415077',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(44,44,'2014-03-01',5,40,'893625003','0',NULL,NULL,'100701136588',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(45,45,'2014-03-01',5,40,'893428779','0',NULL,NULL,'100098859217',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(46,46,'2014-03-01',5,40,'893215771','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(47,47,'2014-03-01',5,40,'893295131','0',NULL,NULL,'100358760543',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(48,48,'2014-03-10',5,40,'893726539','0',NULL,NULL,'100750073805',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(49,49,'2014-03-12',5,40,'893327179','82733',NULL,NULL,'100022263132',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(50,50,'2014-03-12',5,40,'894125595','0',NULL,NULL,'100063707119',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(51,51,'2014-03-18',6,1,'893351259','0',NULL,NULL,'100151718260',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(52,52,'2014-03-18',5,6,'893635979','0',NULL,NULL,'100068084644',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(53,53,'2014-03-18',7,1,'894122203','0',NULL,NULL,'100425489559',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(54,54,'2014-03-18',6,50,'893334459','0',NULL,NULL,'100004086209',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(55,55,'2014-04-14',5,48,'893939355','0',NULL,NULL,'100036195915',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(56,56,'2014-04-14',5,40,'892706683','0',NULL,NULL,'100283791455',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(57,57,'2014-04-14',5,33,'893356043','82739',NULL,NULL,'100101091174',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(58,58,'2014-04-14',5,40,'893471931','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(59,59,'2014-05-12',6,1,'893324299','0',NULL,NULL,'100101091174',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(60,60,'2014-05-14',6,1,'892854107','0',NULL,NULL,'100017702169',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(61,61,'2014-05-23',6,2,'893324971','0',NULL,NULL,'100099375075',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(62,62,'2014-06-09',5,40,'894119723','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(63,63,'2014-06-16',5,36,'893449659','0',NULL,NULL,'100844191195',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(64,64,'2014-07-01',7,3,'894092427','0',NULL,NULL,'100425465227',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(65,65,'2014-07-21',5,43,'893315099','0',NULL,NULL,'100451925083',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(66,66,'2014-07-28',4,29,'893327643','0',NULL,NULL,'100425489559',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(67,67,'2014-08-18',5,43,'892238971','0',NULL,NULL,'100425544087',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(68,68,'2014-09-01',4,29,'893962731','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(69,69,'2014-09-09',5,6,'893326987','0',NULL,NULL,'100425586684',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(70,70,'2014-09-22',6,1,'893349611','82726',NULL,NULL,'100022263132',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(71,71,'2014-09-29',5,40,'892387739','0',NULL,NULL,'100452653506',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(72,72,'2014-10-13',7,3,'0','0',NULL,NULL,'100425488146',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(73,73,'2014-11-17',5,36,'893067243','0',NULL,NULL,'100561682625',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(74,74,'2014-11-20',5,40,'893649291','0',NULL,NULL,'100451905084',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(75,75,'2014-11-24',4,5,'893404491','0',NULL,NULL,'100081748896',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(76,76,'2014-12-01',5,40,'892880811','0',NULL,NULL,'100561781332',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(77,77,'2014-12-01',5,58,'894085659','0',NULL,NULL,'100453997734',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(78,78,'2014-12-01',7,35,'893341707','0',NULL,NULL,'100452735030',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(79,79,'2014-12-03',6,1,'893916059','0',NULL,NULL,'100451579940',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(80,80,'2014-12-15',6,1,'893302027','0',NULL,NULL,'100799090826',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(81,81,'2014-12-22',6,1,'894122475','0',NULL,NULL,'100451937972',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(82,82,'2015-01-05',6,1,'893286107','0',NULL,NULL,'100451668973',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(83,83,'2015-01-05',6,41,'893958699','0',NULL,NULL,'100036169010',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(84,84,'2015-01-05',5,6,'893342795','0',NULL,NULL,'100805914938',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(85,85,'2015-01-12',6,26,'893976075','0',NULL,NULL,'100451510869',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(86,86,'2015-01-20',3,7,'893312539','0',NULL,NULL,'100363295160',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(87,87,'2015-02-11',5,40,'894091547','0',NULL,NULL,'100451417426',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(88,88,'2015-02-16',6,1,'893699595','0',NULL,NULL,'100030968328',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(89,89,'2015-02-26',7,57,'893344715','0',NULL,NULL,'100403580683',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(90,90,'2015-03-05',6,1,'893307771','0',NULL,NULL,'100635202581',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(91,91,'2015-03-09',5,40,'892602971','0',NULL,NULL,'100561781210',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(92,92,'2015-03-09',6,1,'892261963','0',NULL,NULL,'100098859217',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(93,93,'2015-03-23',6,1,'893321979','0',NULL,NULL,'100659900227',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(94,94,'2015-03-23',6,1,'893311755','0',NULL,NULL,'100561309664',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(95,95,'2015-03-23',5,40,'893310091','0',NULL,NULL,'100804315389',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(96,96,'2015-03-30',6,1,'893303883','0',NULL,NULL,'100659492555',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(97,97,'2015-03-30',4,29,'893351787','0',NULL,NULL,'100659782318',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(98,98,'2015-04-01',6,1,'894117371','0',NULL,NULL,'100083079602',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(99,99,'2008-04-01',2,19,'892867355','0',NULL,NULL,'100284078159',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(100,100,'2015-04-20',6,1,'894099835','0',NULL,NULL,'100635241740',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(101,101,'2015-04-20',6,1,'893281131','82731',NULL,NULL,'100561422786',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(102,102,'2015-04-20',5,40,'892283419','0',NULL,NULL,'100802844747',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(103,103,'2015-04-20',5,40,'892834555','82728',NULL,NULL,'100802160368',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(104,104,'2015-04-20',6,1,'892620219','82727',NULL,NULL,'100561396883',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(105,105,'2015-04-27',6,1,'893287803','0',NULL,NULL,'100561500851',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(106,106,'2015-04-27',5,36,'892329979','0',NULL,NULL,'100635546486',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(107,107,'2015-05-11',6,1,'893319707','0',NULL,NULL,'100659831796',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(108,108,'2015-05-11',6,1,'892916555','0',NULL,NULL,'100561639516',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(109,109,'2015-05-11',6,1,'892265371','0',NULL,NULL,'100561811948',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(110,110,'2015-05-11',6,1,'893992267','0',NULL,NULL,'100659831207',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(111,111,'2015-05-11',7,3,'894094075','0',NULL,NULL,'100561834167',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(112,112,'2015-05-11',6,1,'894095355','0',NULL,NULL,'100561549653',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(113,113,'2015-05-11',6,1,'894111707','0',NULL,NULL,'100561434208',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(114,114,'2015-05-11',6,1,'894114523','0',NULL,NULL,'100561652124',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(115,115,'2015-05-11',5,43,'893445467','0',NULL,NULL,'100561680178',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(116,116,'2015-05-18',6,1,'893352587','0',NULL,NULL,'100659784792',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(117,117,'2015-05-18',6,1,'893356443','0',NULL,NULL,'100659867167',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(118,118,'2015-05-25',6,1,'893294795','0',NULL,NULL,'100561306045',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(119,119,'2015-06-08',6,1,'893318539','0',NULL,NULL,'100635241336',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(120,120,'2015-06-08',6,1,'893349259','0',NULL,NULL,'100635486066',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(121,121,'2015-06-08',6,1,'894126411','0',NULL,NULL,'100750863041',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(122,122,'2015-06-10',7,57,'894097451','0',NULL,NULL,'100635158697',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(123,123,'2015-06-15',6,1,'894096203','0',NULL,NULL,'100635578454',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(124,124,'2015-06-15',6,1,'893289771','0',NULL,NULL,'100635402391',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(125,125,'2015-06-22',6,1,'893347019','0',NULL,NULL,'100635226468',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(126,126,'2015-06-22',6,1,'893346171','0',NULL,NULL,'100635359274',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(127,127,'2015-06-22',6,1,'894097931','0',NULL,NULL,'100635632990',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(128,128,'2015-06-22',6,1,'892800235','0',NULL,NULL,'100635531815',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(129,129,'2015-06-29',5,6,'893339563','0',NULL,NULL,'100837557386',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(130,130,'2015-07-06',6,1,'893531995','0',NULL,NULL,'100635461593',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(131,131,'2015-07-06',6,1,'894093483','0',NULL,NULL,'100429699114',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(132,132,'2015-07-06',5,40,'893274987','0',NULL,NULL,'100635164231',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(133,133,'2015-07-06',6,1,'893764987','0',NULL,NULL,'100634996544',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(134,134,'2015-07-06',6,1,'893390107','0',NULL,NULL,'100635570397',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(135,135,'2015-07-06',4,29,'893584235','0',NULL,NULL,'100840196648',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(136,136,'2015-07-06',7,3,'894111579','0',NULL,NULL,'100836822941',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(137,137,'2015-07-06',6,1,'892817339','0',NULL,NULL,'100635323965',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(138,138,'2015-07-07',7,1,'893328715','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(139,139,'2015-07-07',6,1,'893261051','0',NULL,NULL,'100431978745',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(140,140,'2015-07-10',1,12,'892783195','0',NULL,NULL,'100838028334',NULL,NULL,'0','120',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(141,141,'2015-07-13',6,1,'893907131','0',NULL,NULL,'100358760543',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(142,142,'2015-07-16',7,3,'892339291','0',NULL,NULL,'100635184519',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(143,143,'2015-07-20',5,36,'893278859','0',NULL,NULL,'100561727561',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:17','2017-09-19 05:55:17','0',NULL),(144,144,'2015-07-27',5,40,'893769067','0',NULL,NULL,'100329036305',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(145,145,'2015-08-03',5,43,'894098411','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(146,146,'2015-08-03',5,6,'893295147','0',NULL,NULL,'100240878595',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(147,147,'2015-08-05',7,27,'892296043','0',NULL,NULL,'100561783946',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(148,148,'2015-08-17',5,40,'893904795','0',NULL,NULL,'100370770313',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(149,149,'2015-08-17',6,1,'892887083','82740',NULL,NULL,'100635485106',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(150,150,'2015-08-17',6,1,'893752475','0',NULL,NULL,'100843257986',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(151,151,'2015-08-17',6,1,'893838987','0',NULL,NULL,'100092685384',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(152,152,'2015-08-17',7,3,'892520987','0',NULL,NULL,'100635280745',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(153,153,'2015-08-17',6,1,'892456043','0',NULL,NULL,'100561656133',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(154,154,'2015-08-17',7,3,'893365403','0',NULL,NULL,'100841427203',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(155,155,'2015-08-17',7,3,'894129355','0',NULL,NULL,'100635030589',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(156,156,'2015-08-17',6,1,'893763435','0',NULL,NULL,'100635540045',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(157,157,'2015-08-17',6,1,'894084651','0',NULL,NULL,'100033963722',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(158,158,'2015-08-18',6,2,'892354347','0',NULL,NULL,'100635124564',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(159,159,'2015-08-18',4,29,'892730251','0',NULL,NULL,'100635110657',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(160,160,'2015-08-24',5,40,'894085339','0',NULL,NULL,'100150434525',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(161,161,'2015-09-08',5,15,'893475787','0',NULL,NULL,'100851120774',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(162,162,'2015-09-14',6,1,'892897211','0',NULL,NULL,'100854221403',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(163,163,'2015-09-14',7,3,'892572235','0',NULL,NULL,'100834638322',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(164,164,'2015-09-21',7,1,'894125723','0',NULL,NULL,'100844212613',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(165,165,'2015-10-05',5,40,'893888523','0',NULL,NULL,'100843259818',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(166,166,'2015-10-06',7,1,'894086587','0',NULL,NULL,'100843280557',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(167,167,'2015-10-08',3,7,'892851099','0',NULL,NULL,'100315140366',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(168,168,'2015-11-02',6,1,'894097915','0',NULL,NULL,'100243495804',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(169,169,'2015-11-02',5,40,'894128155','0',NULL,NULL,'100013161068',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(170,170,'2015-11-16',6,2,'892860603','0',NULL,NULL,'100679455933',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(171,171,'2015-11-23',5,43,'893341307','0',NULL,NULL,'100725420829',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(172,172,'2015-12-01',3,7,'893325659','0',NULL,NULL,'100679393228',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(173,173,'2015-12-07',7,20,'893689115','0',NULL,NULL,'100869028462',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(174,174,'2015-12-07',7,20,'892449179','0',NULL,NULL,'100679373753',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(175,175,'2015-12-07',7,21,'893152283','0',NULL,NULL,'100865713347',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(176,176,'2016-01-04',4,29,'894128459','0',NULL,NULL,'100300474980',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(177,177,'2016-01-04',7,20,'892214971','0',NULL,NULL,'100468872543',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(178,178,'2016-01-11',4,19,'893941115','0',NULL,NULL,'100438824167',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(179,179,'2016-01-11',7,1,'893281547','0',NULL,NULL,'100862740467',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(180,180,'2016-01-18',5,33,'893294475','0',NULL,NULL,'100859607362',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(181,181,'2016-01-18',5,40,'893245611','0',NULL,NULL,'100869909973',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(182,182,'2016-01-18',5,40,'893314427','0',NULL,NULL,'100545213408',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(183,183,'2016-01-21',5,40,'892380443','0',NULL,NULL,'100369853916',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(184,184,'2016-01-25',7,3,'892355371','0',NULL,NULL,'100725597086',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(185,185,'2016-01-28',4,49,'893848539','0',NULL,NULL,'100331529854',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(186,186,'2016-02-01',5,40,'892357883','0',NULL,NULL,'100180769794',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(187,187,'2016-02-12',5,33,'892649307','0',NULL,NULL,'100872977179',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(188,188,'2016-02-22',4,31,'892353051','0',NULL,NULL,'100563540948',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(189,189,'2016-02-26',5,40,'892849627','0',NULL,NULL,'100858693081',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(190,190,'2016-02-29',5,40,'893912491','0',NULL,NULL,'100465295158',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(191,191,'2016-03-07',5,43,'893789915','0',NULL,NULL,'100381600683',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(192,192,'2016-03-21',6,1,'894100859','0',NULL,NULL,'100697330241',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(193,193,'2016-04-05',7,1,'894118971','0',NULL,NULL,'100860871876',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(194,194,'2016-04-11',5,43,'894099659','0',NULL,NULL,'100858503411',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(195,195,'2016-04-11',7,3,'893348171','0',NULL,NULL,'100861823105',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(196,196,'2016-05-02',2,55,'892730827','82742',NULL,NULL,'100894818086',NULL,NULL,'0','120',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(197,197,'2016-05-02',6,1,'892712827','0',NULL,NULL,'100883295996',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(198,198,'2016-05-02',6,1,'892706939','0',NULL,NULL,'100893894918',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(199,199,'2016-05-02',3,23,'892753819','0',NULL,NULL,'100890882995',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(200,200,'2016-05-09',5,40,'893048155','0',NULL,NULL,'100893202434',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(201,201,'2016-05-18',7,3,'894126475','0',NULL,NULL,'100883550550',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(202,202,'2016-05-23',2,60,'893278699','0',NULL,NULL,'100891029875',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(203,203,'2016-05-23',7,20,'893467051','0',NULL,NULL,'100883498129',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(204,204,'2016-05-23',7,3,'893800203','0',NULL,NULL,'100896482029',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(205,205,'2016-05-23',7,3,'893343979','0',NULL,NULL,'100889314683',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(206,206,'2016-05-23',7,3,'893281627','0',NULL,NULL,'100896739821',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(207,207,'2016-05-23',6,1,'893502059','0',NULL,NULL,'100893111002',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(208,208,'2016-05-23',7,3,'893330907','0',NULL,NULL,'100888576568',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(209,209,'2016-06-13',3,7,'893780779','0',NULL,NULL,'100896503132',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(210,210,'2016-06-15',7,1,'893640987','0',NULL,NULL,'100892178843',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(211,211,'2016-06-20',4,31,'893353563','0',NULL,NULL,'100884680492',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(212,212,'2016-06-30',6,28,'893969163','0',NULL,NULL,'100891362932',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(213,213,'2016-06-30',6,28,'893577083','0',NULL,NULL,'100893091027',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(214,214,'2016-07-04',7,3,'893929019','0',NULL,NULL,'100896612427',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(215,215,'2016-07-06',7,1,'893679435','0',NULL,NULL,'100895552492',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(216,216,'2016-07-06',7,1,'893239051','0',NULL,NULL,'100891310672',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(217,217,'2016-07-18',7,1,'893350171','0',NULL,NULL,'100891625870',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(218,218,'2016-07-25',7,3,'894121243','0',NULL,NULL,'100912700282',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(219,219,'2016-07-26',7,3,'893926411','0',NULL,NULL,'100930028306',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(220,220,'2016-08-01',7,3,'893246923','0',NULL,NULL,'100926515983',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(221,221,'2016-08-01',7,3,'893219579','0',NULL,NULL,'100930638919',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(222,222,'2016-08-01',7,3,'893966859','0',NULL,NULL,'100928273122',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(223,223,'2016-08-10',5,6,'893347931','82724',NULL,NULL,'100914266680',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(224,224,'2016-08-22',7,1,'893470187','0',NULL,NULL,'100928511027',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(225,225,'2016-08-24',3,16,'893326251','0',NULL,NULL,'100930332349',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(226,226,'2016-08-24',7,3,'893316139','0',NULL,NULL,'100916481073',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(227,227,'2016-09-01',7,3,'893279435','0',NULL,NULL,'100929559434',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(228,228,'2016-09-01',7,3,'893167339','0',NULL,NULL,'100924445714',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(229,229,'2016-09-01',7,3,'893870891','0',NULL,NULL,'100918020138',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(230,230,'2016-09-01',7,3,'892553211','82721',NULL,NULL,'100913813066',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(231,231,'2016-09-06',7,3,'894129467','0',NULL,NULL,'100925548478',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(232,232,'2016-09-06',5,33,'892788763','0',NULL,NULL,'100912347068',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(233,233,'2016-09-09',5,42,'893666811','0',NULL,NULL,'100930591802',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(234,234,'2016-09-12',6,1,'893324011','0',NULL,NULL,'100927664697',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(235,235,'2016-09-12',6,1,'894086203','0',NULL,NULL,'100929833486',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(236,236,'2016-09-12',7,3,'892873483','0',NULL,NULL,'100913719591',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(237,237,'2016-09-14',7,3,'893340155','0',NULL,NULL,'100924431943',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(238,238,'2016-09-16',4,29,'892627931','0',NULL,NULL,'100925267870',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(239,239,'2016-09-19',7,3,'893343123','0',NULL,NULL,'100928780530',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(240,240,'2016-09-19',7,3,'892782587','0',NULL,NULL,'100912881082',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(241,241,'2016-09-29',7,3,'893070139','82723',NULL,NULL,'100950878496',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(242,242,'2016-09-30',6,1,'893322763','0',NULL,NULL,'100950282129',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(243,243,'2016-09-30',7,3,'894050363','0',NULL,NULL,'100946816059',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(244,244,'2016-09-30',6,1,'894127851','0',NULL,NULL,'100948421139',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(245,245,'2016-09-30',5,40,'893868123','0',NULL,NULL,'100947672129',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(246,246,'2016-10-03',7,3,'893296955','0',NULL,NULL,'100948317054',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(247,247,'2016-10-12',5,40,'893343819','82722',NULL,NULL,'100949251560',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(248,248,'2016-10-19',6,1,'893298027','0',NULL,NULL,'100948831561',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(249,249,'2016-10-24',7,1,'894129451','0',NULL,NULL,'100973258393',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(250,250,'2016-10-24',7,1,'893351931','0',NULL,NULL,'100973258408',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(251,251,'2016-11-01',6,2,'893279195','82732',NULL,NULL,'100973343156',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(252,252,'2016-11-01',4,29,'893277547','82746',NULL,NULL,'100973258412',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(253,253,'2016-11-02',7,3,'892856475','0',NULL,NULL,'100973258431',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(254,254,'2016-11-02',7,1,'894122955','0',NULL,NULL,'100973171867',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(255,255,'2016-11-02',7,1,'894120971','0',NULL,NULL,'100973438792',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(256,256,'2016-11-07',5,40,'893292779','82725',NULL,NULL,'100973344386',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(257,257,'2016-11-10',6,48,'892997611','0',NULL,NULL,'100973171880',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(258,258,'2016-11-14',5,40,'893313371','0',NULL,NULL,'100973344393',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(259,259,'2016-11-14',5,33,'893990155','0',NULL,NULL,'100973171908',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(260,260,'2016-11-14',6,11,'894105867','0',NULL,NULL,'100973171920',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(261,261,'2016-11-21',5,47,'893819707','0',NULL,NULL,'100973171931',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(262,262,'2016-11-23',6,11,'893347483','0',NULL,NULL,'100973171949',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(263,263,'2016-11-11',7,35,'894099371','0',NULL,NULL,'100973171898',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(264,264,'2016-11-24',7,1,'893953419','0',NULL,NULL,'100988392812',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(265,265,'2016-11-28',5,36,'893352139','0',NULL,NULL,'100318291423',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(266,266,'2016-11-30',3,25,'893428139','82747',NULL,NULL,'100099809793',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(267,267,'2016-12-01',5,14,'893516971','0',NULL,NULL,'100987554671',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(268,268,'2016-12-05',7,1,'893281995','0',NULL,NULL,'100068209688',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(269,269,'2016-12-05',7,1,'893344699','82735',NULL,NULL,'100987544712',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(270,270,'2016-12-05',6,1,'893280795','0',NULL,NULL,'100737391825',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(271,271,'2016-12-12',6,2,'893553243','0',NULL,NULL,'100468050415',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(272,272,'2016-12-12',6,1,'893236763','0',NULL,NULL,'100378866966',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(273,273,'2016-12-19',7,4,'892459067','0',NULL,NULL,'100757805825',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(274,274,'2016-12-19',4,49,'894100987','75054',NULL,NULL,'100007576722',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(275,275,'2016-12-26',7,3,'894105675','0',NULL,NULL,'101014934147',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(276,276,'2016-12-26',4,29,'892349627','0',NULL,NULL,'100603832291',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(277,277,'2017-01-16',5,36,'893787947','82738',NULL,NULL,'100087292423',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(278,278,'2017-01-19',7,3,'893307099','0',NULL,NULL,'101008333344',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(279,279,'2017-01-23',6,1,'892882859','0',NULL,NULL,'100567393193',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(280,280,'2017-01-03',2,60,'892923387','0',NULL,NULL,'0',NULL,NULL,'0','15',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(281,281,'2017-01-27',7,3,'893302203','0',NULL,NULL,'101008333359',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:18','2017-09-19 05:55:18','0',NULL),(282,282,'2017-01-27',7,3,'893355419','0',NULL,NULL,'101008333363',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(283,283,'2017-01-30',6,9,'893305131','0',NULL,NULL,'101019428049',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(284,284,'2017-02-06',7,3,'893953371','0',NULL,NULL,'100425585216',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(285,285,'2017-02-09',5,40,'892646315','0',NULL,NULL,'100003400203',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(286,286,'2017-02-13',5,40,'894046619','0',NULL,NULL,'100541295014',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(287,287,'2017-02-13',6,1,'893929451','0',NULL,NULL,'101041674904',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(288,288,'2017-02-16',6,1,'894091131','0',NULL,NULL,'100986716507',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(289,289,'2017-02-21',6,1,'892336187','0',NULL,NULL,'100738091503',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(290,290,'2017-02-27',6,1,'893335867','0',NULL,NULL,'101065056913',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(291,291,'2017-02-27',7,3,'892448091','0',NULL,NULL,'101065056909',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(292,292,'2017-02-27',7,3,'893657499','0',NULL,NULL,'100244317390',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(293,293,'2017-02-27',7,3,'893010555','0',NULL,NULL,'101065056899',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(294,294,'2017-03-06',7,20,'893915515','0',NULL,NULL,'100528538791',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(295,295,'2017-03-14',5,6,'894127275','0',NULL,NULL,'100933535231',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(296,296,'2017-03-14',5,36,'893303355','0',NULL,NULL,'100390247615',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(297,297,'2017-03-15',3,7,'892916651','82737',NULL,NULL,'101056148288',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(298,298,'2017-03-16',6,1,'892239147','0',NULL,NULL,'100241300232',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(299,299,'2017-03-20',5,40,'892549531','0',NULL,NULL,'100164536363',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(300,300,'2017-03-20',4,29,'893312987','0',NULL,NULL,'100342436085',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(301,301,'2017-03-20',7,3,'893139291','0',NULL,NULL,'101056148274',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(302,302,'2017-03-20',5,37,'892986459','0',NULL,NULL,'100151718260',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(303,303,'2017-03-22',7,3,'892831163','0',NULL,NULL,'101056148290',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(304,304,'2017-03-27',6,1,'892354571','0',NULL,NULL,'100396978367',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(305,305,'2017-03-27',6,46,'893765339','0',NULL,NULL,'100386521977',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(306,306,'2017-03-31',7,3,'892422587','0',NULL,NULL,'100166277987',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(307,307,'2017-03-31',7,3,'894106363','0',NULL,NULL,'100432025627',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(308,308,'2017-04-03',6,61,'893305467','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(309,309,'2017-04-03',7,3,'893501755','0',NULL,NULL,'100896708691',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(310,310,'2017-04-10',7,3,'893337435','0',NULL,NULL,'100561656133',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(311,311,'2017-04-17',4,18,'894128347','82744',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(312,312,'2017-04-17',6,8,'893285739','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(313,313,'2017-04-17',7,3,'894097163','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(314,314,'2017-04-17',7,59,'893870171','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(315,315,'2017-04-17',7,3,'893813163','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(316,316,'2017-04-17',5,48,'893329051','82743',NULL,NULL,'100928511027',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(317,317,'2017-04-17',7,1,'893968731','0',NULL,NULL,'100101253838',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(318,318,'2017-04-19',5,33,'892744475','0',NULL,NULL,'100086312376',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(319,319,'2017-04-20',5,44,'893823675','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(320,320,'2017-04-21',3,7,'893317099','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(321,321,'2017-05-02',2,54,'894117275','0',NULL,NULL,'100856561501',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(322,322,'2017-05-02',7,28,'892458443','0',NULL,NULL,'100180745994',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(323,323,'2017-05-02',6,13,'894042651','0',NULL,NULL,'100635485106',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(324,324,'2017-05-08',7,3,'893427131','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(325,325,'2017-05-08',6,1,'894097323','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(326,326,'2017-05-08',5,52,'894111723','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(327,327,'2017-05-08',5,40,'893976555','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(328,328,'2017-05-08',5,39,'893297867','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(329,329,'2017-05-08',7,1,'893399739','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(330,330,'2017-05-08',7,3,'892806747','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(331,331,'2017-05-09',6,1,'893342539','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(332,332,'2017-05-10',5,14,'893735611','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(333,333,'2017-05-10',6,56,'894042155','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(334,334,'2017-05-15',7,1,'893899771','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(335,335,'2017-05-22',7,3,'892814395','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(336,336,'2017-05-22',7,3,'894128571','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(337,337,'2017-05-22',7,3,'893942299','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(338,338,'2017-05-22',7,3,'893016843','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(339,339,'2017-05-25',7,3,'893310139','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(340,340,'2017-05-25',7,3,'893332859','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(341,341,'2017-05-25',7,3,'893066235','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(342,342,'2017-05-25',7,3,'893008331','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(343,343,'2017-05-25',7,3,'893276267','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(344,344,'2017-05-25',7,3,'894106459','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(345,345,'2017-05-25',7,3,'893742299','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(346,346,'2017-05-25',7,3,'893135771','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(347,347,'2017-05-25',7,3,'892800315','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(348,348,'2017-05-25',7,3,'893349083','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(349,349,'2017-05-29',6,2,'893307355','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(350,350,'2017-05-29',7,3,'893687099','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(351,351,'2017-05-29',7,3,'893324747','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(352,352,'2017-06-01',4,30,'893788379','82745',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(353,353,'2017-06-02',5,17,'894105803','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(354,354,'2017-06-05',7,1,'893260779','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(355,355,'2017-06-05',7,1,'893534459','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(356,356,'2017-06-05',5,40,'894130251','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(357,357,'2017-06-05',7,3,'892806827','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(358,358,'2017-06-05',7,3,'893730875','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(359,359,'2017-06-12',6,1,'894111947','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(360,360,'2017-06-13',6,56,'893701259','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(361,361,'2017-06-19',6,56,'894093867','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(362,362,'2017-06-20',6,1,'893804683','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(363,363,'2017-06-27',6,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(364,364,'2017-06-27',4,51,'0','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(365,365,'2017-06-27',6,61,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(366,366,'2017-06-27',5,40,'0','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(367,367,'2017-06-29',5,14,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(368,368,'2017-06-29',4,29,'0','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(369,369,'2017-07-06',6,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(370,370,'2017-07-06',6,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(371,371,'2017-07-06',6,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(372,372,'2017-07-06',6,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(373,373,'2017-07-10',3,24,'0','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(374,374,'2017-07-10',4,49,'0','0',NULL,NULL,'0',NULL,NULL,'0','90',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(375,375,'2017-07-10',7,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(376,376,'2017-07-13',7,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(377,377,'2017-07-13',7,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(378,378,'2017-07-14',6,56,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(379,379,'2017-07-17',NULL,22,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(380,380,'2017-07-17',NULL,46,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(381,381,'2017-07-17',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(382,382,'2017-07-17',NULL,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(383,383,'2017-07-19',NULL,40,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(384,384,'2017-07-21',NULL,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(385,385,'2017-07-21',NULL,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(386,386,'2017-07-24',NULL,2,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(387,387,'2017-07-24',NULL,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(388,388,'2017-07-24',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(389,389,'2017-07-28',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(390,390,'2017-07-24',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','30',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(391,391,'2017-07-24',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(392,392,'2017-07-24',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(393,393,'2017-07-24',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(394,394,'2017-07-28',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(395,395,'2017-07-31',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(396,396,'2017-08-02',NULL,32,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(397,397,'2017-08-07',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(398,398,'2017-08-07',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(399,399,'2017-08-14',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(400,400,'2017-08-14',NULL,40,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(401,401,'2017-08-16',NULL,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(402,402,'2017-08-21',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(403,403,'2017-08-21',NULL,56,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(404,404,'2017-08-21',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(405,405,'2017-08-21',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(406,406,'2017-08-23',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(407,407,'2017-08-23',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(408,408,'2017-08-28',NULL,28,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(409,409,'2017-08-30',NULL,40,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(410,410,'2017-08-30',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(411,411,'2017-09-04',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(412,412,'2017-09-04',NULL,3,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(413,413,'2017-09-11',NULL,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:19','2017-09-19 05:55:19','0',NULL),(414,414,'2017-09-11',NULL,38,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','0',NULL),(415,415,'2017-09-11',NULL,40,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','0',NULL),(416,416,'2017-09-13',NULL,8,'0','0',NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'NA','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','0',NULL),(417,417,'2012-03-01',NULL,40,'2','0',NULL,NULL,'100383422019',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2013-12-27','2023-12-26',NULL,'2042-02-28',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','6',NULL),(418,418,'2012-03-01',NULL,60,'4','0',NULL,NULL,'100100334240',NULL,NULL,'0','90',NULL,NULL,'Yes ','0','2012-03-01','2022-02-28',NULL,'2031-06-30',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','7',NULL),(419,419,'2012-03-01',NULL,40,'0','0',NULL,NULL,'100168425760',NULL,NULL,'0','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2045-06-30',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','8',NULL),(420,420,'2012-03-01',NULL,40,'0','0',NULL,NULL,'100259748549',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2003-03-11','2023-03-10',NULL,'2044-08-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','10',NULL),(421,421,'2012-03-01',NULL,40,'19','0',NULL,NULL,'100100125359',NULL,NULL,'0','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2041-10-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','11',NULL),(422,422,'2012-07-23',NULL,40,'26','0',NULL,NULL,'100200452012',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2010-05-10','2020-04-10',NULL,'2039-12-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','12',NULL),(423,423,'2012-08-01',NULL,33,'34','0',NULL,NULL,'100412936015',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2038-02-28',NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','13',NULL),(424,424,'2013-01-07',NULL,29,'18','0',NULL,NULL,'100412913962',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2008-02-05','2018-02-04',NULL,'2041-08-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','14',NULL),(425,425,'2013-05-06',NULL,29,'55','0',NULL,NULL,'100412162097',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2044-02-29',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','15',NULL),(426,426,'2013-05-29',NULL,1,'3','0',NULL,NULL,'100100709773',NULL,NULL,'0','60',NULL,NULL,'No ','0','2009-11-03','2019-11-01',NULL,'2035-05-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','16',NULL),(427,427,'2013-08-06',NULL,1,'24','0',NULL,NULL,'100100185168',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2012-06-12','2022-06-11',NULL,'2047-05-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','17',NULL),(428,428,'2013-08-28',NULL,1,'6','0',NULL,NULL,'100258662428',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2044-12-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','18',NULL),(429,429,'2013-09-02',NULL,1,'3','0',NULL,NULL,'100200722277',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2006-08-11','2016-07-11',NULL,'2044-02-29',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','19',NULL),(430,430,'2014-04-21',NULL,1,'14','0',NULL,NULL,'100207336774',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2009-03-20','2019-03-19',NULL,'2047-04-30',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','20',NULL),(431,431,'2014-05-26',NULL,1,'20','0',NULL,NULL,'100425594277',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2041-10-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','21',NULL),(432,432,'2014-05-26',NULL,1,'15','0',NULL,NULL,'100201026805',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2006-03-24','2016-03-23',NULL,'2046-01-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','22',NULL),(433,433,'2014-08-01',NULL,13,'42','0',NULL,NULL,'100425572202',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2015-04-27','2025-04-26',NULL,'2043-07-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','23',NULL),(434,434,'2014-08-25',NULL,57,'36','0',NULL,NULL,'100425541261',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2013-08-14','2023-08-13',NULL,'2040-07-31',NULL,NULL,NULL,NULL,NULL,5,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','24',NULL),(435,435,'2014-10-30',NULL,1,'0','0',NULL,NULL,'100425544245',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2048-12-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','25',NULL),(436,436,'2014-11-03',NULL,1,'49','0',NULL,NULL,'100378856887',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2013-10-18','2023-10-17',NULL,'2044-03-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','26',NULL),(437,437,'2015-01-02',NULL,3,'45','0',NULL,NULL,'100452754216',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2011-11-14','2021-11-13',NULL,'2050-10-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','27',NULL),(438,438,'2015-03-13',NULL,1,'30','0',NULL,NULL,'100805720253',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2042-08-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','28',NULL),(439,439,'2015-05-11',NULL,1,'44','0',NULL,NULL,'100635331508',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2009-05-18','2019-05-17',NULL,'2048-10-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','29',NULL),(440,440,'2015-06-15',NULL,1,'35','0',NULL,NULL,'100843453258',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2014-07-30','2024-07-30',NULL,'2047-05-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','30',NULL),(441,441,'2015-07-20',NULL,1,'90','0',NULL,NULL,'100697435504',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2009-03-12','2019-03-11',NULL,'2049-05-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','31',NULL),(442,442,'2016-01-11',NULL,1,'9','0',NULL,NULL,'100354620849',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2012-09-25','2022-09-24',NULL,'2050-05-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','32',NULL),(443,443,'2016-02-01',NULL,1,'0','0',NULL,NULL,'100431346751',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2007-11-30','2017-11-29',NULL,'2049-10-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','33',NULL),(444,444,'2016-04-04',NULL,1,'0','0',NULL,NULL,'100440605871',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2014-03-21','2024-03-20',NULL,'2050-01-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','35',NULL),(445,445,'2016-06-13',NULL,3,'23','0',NULL,NULL,'100891602679',NULL,NULL,'0','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2050-01-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','36',NULL),(446,446,'2016-09-21',NULL,1,'21','0',NULL,NULL,'100925575643',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2014-09-05','2024-09-04',NULL,'2050-08-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','37',NULL),(447,447,'2017-01-05',NULL,1,'0','0',NULL,NULL,'100452780991',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2051-03-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','38',NULL),(448,448,'2017-01-23',NULL,1,'16','0',NULL,NULL,'101014930931',NULL,NULL,'0','60',NULL,NULL,'No ','0',NULL,NULL,NULL,'2050-08-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','39',NULL),(449,449,'2017-02-13',NULL,13,'0','0',NULL,NULL,'100534628095',NULL,NULL,'0','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2049-01-31',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','40',NULL),(450,450,'2017-04-24',NULL,3,'39','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'NA ','0',NULL,NULL,NULL,'2050-09-30',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','41',NULL),(451,451,'2017-04-24',NULL,1,'0','0',NULL,NULL,'0',NULL,NULL,'0','60',NULL,NULL,'Yes ','0','2009-01-22','2019-01-21',NULL,'2047-06-30',NULL,NULL,NULL,NULL,NULL,2,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-09-19 05:55:20','2017-09-19 05:55:20','42',NULL);
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `weekoff_sandwich` tinyint(1) DEFAULT NULL,
  `holiday_sandwich` tinyint(1) DEFAULT NULL,
  `transfer` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'L','Leave','Planed leave, Sick leave, Casual leave',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,'2017-09-19 04:12:12','2017-09-19 06:27:38',0,NULL,0),(2,'HDL','Half day leave','Half day leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(3,'HBL','Half day Birthday leave','Half day Birthday leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(4,'ML','Maternity Leave','Maternity Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(5,'PL','Paternity Leave','Paternity Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(6,'C.Off','Compensatory Off','Compensatory Off',NULL,0,NULL,NULL,1,1,NULL,0,0,0,0,NULL,'2017-09-19 04:12:12','2017-09-19 06:27:49',0,NULL,0),(7,'OD','Out Duty','Out Duty',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(8,'WFH','Work from Home','Work from Home',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(9,'ACF','Access card forgotten','Access card forgotten',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(10,'LWP','Leave without pay','Leave without pay',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL),(11,'HDLWP','Half day leave without pay','Half day leave without pay',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12',NULL,NULL,NULL);
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
  `leave_count` decimal(3,1) DEFAULT NULL,
  `is_expire` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taken_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
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
  `company_workingday` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `leav_category_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `shift_master_id` int(11) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT NULL,
  `present` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_updated` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_manager_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_6626907ede` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (1,167,140,NULL,'2017-09-19',NULL,'2017-09-19 05:58:39','2017-09-19 05:58:39'),(2,204,167,140,'2017-09-19',NULL,'2017-09-19 06:15:32','2017-09-19 06:15:32'),(3,140,1,NULL,'2017-09-19',NULL,'2017-09-19 06:16:30','2017-09-19 06:16:30');
/*!40000 ALTER TABLE `manager_histories` ENABLE KEYS */;
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
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_gps` tinyint(1) DEFAULT NULL,
  `boolean` tinyint(1) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `float` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'1023',1,'EMP0000167',NULL,'rohit.kalghatgi@sganalytics.com','$2a$10$BK7KdInaIUzHkGoxp6.3meBM29SU3PbZJOoIGWmt9KUiUAY6cEU3W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'2017-09-19 11:55:45','2017-09-19 09:37:34','172.16.1.1','172.16.1.83','2017-09-19 05:58:39','2017-09-19 11:55:45',1,1,21,167,NULL,NULL,NULL,NULL),(2,'1137',6,'EMP0000204',NULL,'nikhil.venkatavelu@sganalytics.com','$2a$10$UFBmK1Vpo7UZKMQIGGD/U.J/fIqTActcCj8mxFFVGhlXDp6xiOV2O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2017-09-19 06:56:01','2017-09-19 06:30:22','172.16.0.215','172.16.0.215','2017-09-19 06:15:32','2017-09-19 06:56:01',1,1,21,204,NULL,NULL,NULL,NULL),(3,'936',5,'EMP0000140',NULL,'susshruth.apshankar@sganalytics.com','$2a$10$kMl4L0foCH6dltKIrw1buuYJyu2JcSfyx9Cm1WVEZ8DR3n4w.sVeK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-19 06:16:30','2017-09-19 06:16:30',1,1,24,140,NULL,NULL,NULL,NULL);
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
  `is_paid` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_monthly_expences_on_employee_id` (`employee_id`),
  KEY `index_monthly_expences_on_expencess_type_id` (`expencess_type_id`),
  CONSTRAINT `fk_rails_50565ec74d` FOREIGN KEY (`expencess_type_id`) REFERENCES `expencess_types` (`id`),
  CONSTRAINT `fk_rails_230dfd3189` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
INSERT INTO `nationalities` VALUES (1,'NATION_1001','Indian','Indian Nationality',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'NATION_1002','German','German Nationality',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'NATION_1003','Swiss','Swiss Nationality',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'NATION_1005','Nepalese','Nepalese Nationality',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11');
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
  `employee_designation_id` int(11) DEFAULT NULL,
  `candidate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `fulfillment_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `closed_position` int(11) DEFAULT NULL,
  `interview_schedule_id` int(11) DEFAULT NULL,
  `selected_resume_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
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
  `company_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
-- Table structure for table `policy_types`
--

DROP TABLE IF EXISTS `policy_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_types`
--

LOCK TABLES `policy_types` WRITE;
/*!40000 ALTER TABLE `policy_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_types` ENABLE KEYS */;
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
  `company_location_id` int(11) DEFAULT NULL,
  `basis_actual_amount` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
-- Table structure for table `punch_masters`
--

DROP TABLE IF EXISTS `punch_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punch_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `reader_in` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reader_out` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_day_hrs` decimal(10,0) DEFAULT NULL,
  `half_day_hrs` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punch_masters`
--

LOCK TABLES `punch_masters` WRITE;
/*!40000 ALTER TABLE `punch_masters` DISABLE KEYS */;
INSERT INTO `punch_masters` VALUES (1,'04:00:00','23:59:00','Main Door IN','Main Door Out',7,4,1,'2017-09-19 10:05:00','2017-09-19 10:07:57'),(2,'00:15:00','04:00:00','Main Door IN','Main Door Out',7,4,0,'2017-09-19 10:06:00','2017-09-19 10:06:00');
/*!40000 ALTER TABLE `punch_masters` ENABLE KEYS */;
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
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
-- Table structure for table `recruiters`
--

DROP TABLE IF EXISTS `recruiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruiters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_recruiters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_14fdadfe2b` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiters`
--

LOCK TABLES `recruiters` WRITE;
/*!40000 ALTER TABLE `recruiters` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruiters` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_masters`
--

LOCK TABLES `relation_masters` WRITE;
/*!40000 ALTER TABLE `relation_masters` DISABLE KEYS */;
INSERT INTO `relation_masters` VALUES (1,'RELATION_1001','Father','Father',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,'RELATION_1002','Mother','Mother',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,'RELATION_1003','Daughter','Daughter',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,'RELATION_1004','Son','Son',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,'RELATION_1005','Brother','Brother',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,'RELATION_1006','Spouse','Spouse',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,'RELATION_1007','Sister','Sister',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(8,'RELATION_1008','Father-in-law','Father-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(9,'RELATION_1009','Mother-in-law','Mother-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(10,'RELATION_1010','Daughter-in-law','Daughter-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(11,'RELATION_1011','Son-in-law','Son-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(12,'RELATION_1012','Brother-in-law','Brother-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12'),(13,'RELATION_1013','Sister-in-law','Sister-in-law',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Hinduism','REL_1001','Hindu',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'Jainism','REL_1002','Jain',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'Islam','REL_1003','Islam',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'Christianity','REL_1004','Christianity',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(5,'Sikhism','REL_1005','Sikhism',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(6,'Buddhism','REL_1006','Buddhism',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(7,'Zoroastrianism','REL_1007','Zoroastrianism',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(8,'Atheist','REL_1008','Atheist',NULL,'2017-09-19 04:12:12','2017-09-19 04:12:12');
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
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_d6a54407d7` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,1,1,'2017-09-19 05:57:58','2017-09-19 05:57:58'),(2,NULL,NULL,NULL,140,1,'2017-09-19 05:58:11','2017-09-19 05:58:11'),(3,NULL,NULL,NULL,3,1,'2017-09-19 06:00:38','2017-09-19 06:00:38'),(4,NULL,NULL,NULL,4,1,'2017-09-19 06:00:46','2017-09-19 06:00:46'),(5,NULL,NULL,NULL,9,1,'2017-09-19 06:00:55','2017-09-19 06:00:55'),(6,NULL,NULL,NULL,12,1,'2017-09-19 06:01:04','2017-09-19 06:01:04'),(7,NULL,NULL,NULL,14,1,'2017-09-19 06:01:17','2017-09-19 06:01:17'),(8,NULL,NULL,NULL,15,1,'2017-09-19 06:01:27','2017-09-19 06:01:27'),(9,NULL,NULL,NULL,17,1,'2017-09-19 06:01:35','2017-09-19 06:01:35'),(10,NULL,NULL,NULL,22,1,'2017-09-19 06:01:53','2017-09-19 06:01:53'),(11,NULL,NULL,NULL,26,1,'2017-09-19 06:02:18','2017-09-19 06:02:18'),(12,NULL,NULL,NULL,25,1,'2017-09-19 06:02:32','2017-09-19 06:02:32'),(13,NULL,NULL,NULL,33,1,'2017-09-19 06:02:44','2017-09-19 06:02:44'),(14,NULL,NULL,NULL,28,0,'2017-09-19 06:02:55','2017-09-19 06:02:55'),(15,NULL,NULL,NULL,63,1,'2017-09-19 06:03:34','2017-09-19 06:03:34'),(16,NULL,NULL,NULL,190,1,'2017-09-19 06:03:50','2017-09-19 06:03:50'),(17,NULL,NULL,NULL,68,1,'2017-09-19 06:04:30','2017-09-19 06:04:30'),(18,NULL,NULL,NULL,167,1,'2017-09-19 06:04:56','2017-09-19 06:04:56'),(19,NULL,NULL,NULL,199,1,'2017-09-19 06:05:05','2017-09-19 06:05:05'),(20,NULL,NULL,NULL,202,1,'2017-09-19 06:05:41','2017-09-19 06:05:41'),(21,NULL,NULL,NULL,106,1,'2017-09-19 06:06:10','2017-09-19 06:06:10'),(22,NULL,NULL,NULL,73,1,'2017-09-19 06:06:16','2017-09-19 06:06:16'),(23,NULL,NULL,NULL,297,1,'2017-09-19 06:06:35','2017-09-19 06:06:35'),(24,NULL,NULL,NULL,86,1,'2017-09-19 06:07:13','2017-09-19 06:07:13'),(25,NULL,NULL,NULL,274,1,'2017-09-19 06:07:23','2017-09-19 06:07:23'),(26,NULL,NULL,NULL,225,1,'2017-09-19 06:07:34','2017-09-19 06:07:34'),(27,NULL,NULL,NULL,321,1,'2017-09-19 06:07:40','2017-09-19 06:07:40'),(28,NULL,NULL,NULL,266,1,'2017-09-19 06:07:52','2017-09-19 06:07:52');
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
  `employee_training` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_training_reqs_on_training_request_id` (`training_request_id`),
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
  `travel_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `daily_bill_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_travel_requests_on_travel_request_id` (`travel_request_id`),
  CONSTRAINT `fk_rails_b36ee15272` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`)
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
  `vacancy_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_categories`
--

LOCK TABLES `reserved_categories` WRITE;
/*!40000 ALTER TABLE `reserved_categories` DISABLE KEYS */;
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
  `employee_id` int(11) DEFAULT NULL,
  `resign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resignation_histories_on_employee_resignation_id` (`employee_resignation_id`),
  KEY `index_resignation_histories_on_leaving_reason_id` (`leaving_reason_id`),
  KEY `index_resignation_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_834cfeb746` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ccbad3903` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
  CONSTRAINT `fk_rails_b04daa0d11` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`)
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
-- Table structure for table `resource_pool_masters`
--

DROP TABLE IF EXISTS `resource_pool_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_pool_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_pool_masters`
--

LOCK TABLES `resource_pool_masters` WRITE;
/*!40000 ALTER TABLE `resource_pool_masters` DISABLE KEYS */;
INSERT INTO `resource_pool_masters` VALUES (1,'Resource Pool Code','Resource Pool Description','Resource Pool Description',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(2,'RES-ER-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(3,'RES-ER-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(4,'RES-ER-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(5,'RES-ER-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(6,'RES-ER-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(7,'RES-ER-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(8,'RES-DED-TRSL-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(9,'RES-DED-TRSL-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(10,'RES-DED-TRSL-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(11,'RES-DED-TRSL-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(12,'RES-DED-TRSL-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(13,'RES-FI-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(14,'RES-FI-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(15,'RES-FI-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(16,'RES-FI-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(17,'RES-IB-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(18,'RES-IB-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(19,'RES-IB-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(20,'RES-IB-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(21,'RES-IB-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(22,'RES-IB-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:57','2017-09-19 11:05:57'),(23,'RES-BRC-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(24,'RES-BRC-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(25,'RES-BRC-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(26,'RES-BRC-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(27,'RES-ESG-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(28,'RES-ESG-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(29,'RES-ESG-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(30,'RES-ESG-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(31,'RES-FDAA-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(32,'RES-FDAA-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(33,'RES-FDAA-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(34,'RES-FDAA-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(35,'RES-DED-NASDAQ-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(36,'RES-DED-NASDAQ-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(37,'RES-DED-NASDAQ-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(38,'RES-DED-NOVUS-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(39,'RES-DED-NOVUS-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(40,'RES-DED-NOVUS-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(41,'RES-DED-NOVUS-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(42,'RES-DED-NOVUS-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(43,'RES-DED-OREEDO-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(44,'RES-DED-OREEDO-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(45,'RES-DED-OREEDO-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(46,'RES-DED-OVUM-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(47,'RES-DED-OVUM-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(48,'RES-DED-OVUM-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(49,'RES-DED-OVUM-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(50,'RES-DED-OVUM-SCED','Senior Content Editor','Senior Content Editor',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(51,'RES-DED-INFORMA-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(52,'RES-DED-INFORMA-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(53,'RES-DED-INFORMA-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(54,'RES-DED-INFORMA-DEV','Developer ','Developer ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(55,'RES-DED-INFORMA-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(56,'RES-GEN-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(57,'RES-GEN-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(58,'RES-GEN-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(59,'RES-GEN-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(60,'RES-GEN-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(61,'PR-PR1-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(62,'PR-PR1-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(63,'PR-PR1-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(64,'PR-PR2-MGR','Manager ','Manager ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(65,'PR-PR1-MGR','Manager ','Manager ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(66,'PR-PR1-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(67,'PR-PR1-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(68,'PR-PR1-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(69,'PR-PR2-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(70,'PR-PR2-IANA','Intermediate Analyst','Intermediate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(71,'PR-PR2-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(72,'PR-PR2-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(73,'PR-PLS-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(74,'PR-PLS-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(75,'PR-PLS-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(76,'PR-PLS-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(77,'PR-DED-EIQ-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(78,'PR-DED-EIQ-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(79,'PR-DED-EIQ-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(80,'PR-DED-EIQ-DEV','Developer ','Developer ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(81,'PR-DED-EIQ-MGR','Manager ','Manager ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(82,'PR-DED-EIQ-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(83,'PR-DED-EIQ-SGDE','Senior Graphic Designer','Senior Graphic Designer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(84,'PR-DED-EIQ-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(85,'AT-GEN-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(86,'AT-GEN-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(87,'AT-DED-NICK-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(88,'AT-GEN-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(89,'AT-DED-TRTA-ANA','Analyst ','Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(90,'AT-GEN-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(91,'RES-DED-NOVUS-DBA','Database Architect','Database Architect',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(92,'AT-TECH-DEV','Developer ','Developer ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(93,'AT-GEN-DS','Data Scientist','Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(94,'AT-DED-TRTA-DS','Data Scientist','Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(95,'AT-DED-NICK-DS','Data Scientist','Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(96,'AT-GEN-ENGG','Engineer ','Engineer ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(97,'AT-DED-NICK-ENGG','Engineer ','Engineer ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(98,'AT-DED-NICK-JDS','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(99,'AT-DED-TRTA-JDS','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(100,'AT-GEN-JDS','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(101,'AT-DED-NICK-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(102,'AT-GEN-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(103,'AT-DED-NICK-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(104,'AT-DED-TRTA-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(105,'AT-TECH-SDEV','Senior Developer','Senior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(106,'RES-DED-NOVUS-SDEV','Senior Developer','Senior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(107,'AT-GEN-SDS','Senior Data Scientist','Senior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(108,'AT-DED-NICK-SDS','Senior Data Scientist','Senior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(109,'AT-TECH-SENGG','Senior Engineer','Senior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(110,'AT-GEN-SENGG','Senior Engineer','Senior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(111,'COPR-DEE-GDE','Graphic Designer','Graphic Designer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(112,'COPR-DEE-JCED','Junior Content Editor','Junior Content Editor',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(113,'COPR-DEE-SCED','Senior Content Editor','Senior Content Editor',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(114,'COPR-DEE-SGDE','Senior Graphic Designer','Senior Graphic Designer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(115,'RES-GEN-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(116,'RES-GEN-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(117,'RES-GEN-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(118,'RES-GEN-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(119,'RES-GEN-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(120,'RES-GEN-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(121,'RES-GEN-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(122,'RES-GEN-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(123,'RES-GEN-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(124,'RES-GEN-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(125,'RES-GEN-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(126,'RES-GEN-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(127,'RES-ER-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(128,'RES-ER-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(129,'RES-ER-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(130,'RES-ER-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(131,'RES-ER-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(132,'RES-ER-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(133,'RES-ER-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(134,'RES-ER-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(135,'RES-ER-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(136,'RES-ER-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(137,'RES-ER-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(138,'RES-QR-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(139,'RES-QR-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(140,'RES-QR-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(141,'RES-QR-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(142,'RES-QR-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(143,'RES-QR-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(144,'RES-QR-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(145,'RES-QR-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(146,'RES-QR-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(147,'RES-QR-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(148,'RES-QR-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(149,'RES-QR-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(150,'RES-QR-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(151,'RES-QR-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(152,'RES-QR-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(153,'RES-QR-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(154,'RES-FI-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(155,'RES-FI-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(156,'RES-FI-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(157,'RES-FI-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(158,'RES-FI-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(159,'RES-FI-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(160,'RES-FI-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(161,'RES-FI-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(162,'RES-FI-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(163,'RES-FI-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(164,'RES-FI-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(165,'RES-FI-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(166,'RES-FI-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(167,'RES-IB-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(168,'RES-IB-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(169,'RES-IB-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(170,'RES-IB-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(171,'RES-IB-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(172,'RES-IB-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(173,'RES-IB-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(174,'RES-IB-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(175,'RES-IB-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(176,'RES-IB-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(177,'RES-IB-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(178,'RES-BRC-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(179,'RES-BRC-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(180,'RES-BRC-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(181,'RES-BRC-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(182,'RES-BRC-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(183,'RES-BRC-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(184,'RES-BRC-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(185,'RES-BRC-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(186,'RES-BRC-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(187,'RES-BRC-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(188,'RES-BRC-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(189,'RES-BRC-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(190,'RES-BRC-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(191,'RES-ESG-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(192,'RES-ESG-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(193,'RES-ESG-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(194,'RES-ESG-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(195,'RES-ESG-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(196,'RES-ESG-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(197,'RES-ESG-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(198,'RES-ESG-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(199,'RES-ESG-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(200,'RES-ESG-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(201,'RES-ESG-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(202,'RES-ESG-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(203,'RES-ESG-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(204,'RES-FDAA-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(205,'RES-FDAA-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(206,'RES-FDAA-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(207,'RES-FDAA-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(208,'RES-FDAA-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(209,'RES-FDAA-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(210,'RES-FDAA-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(211,'RES-FDAA-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(212,'RES-FDAA-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(213,'RES-FDAA-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(214,'RES-FDAA-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(215,'RES-FDAA-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(216,'RES-FDAA-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(217,'RES-DED-TRSL-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(218,'RES-DED-TRSL-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(219,'RES-DED-TRSL-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(220,'RES-DED-TRSL-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(221,'RES-DED-TRSL-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(222,'RES-DED-TRSL-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(223,'RES-DED-TRSL-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(224,'RES-DED-TRSL-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(225,'RES-DED-TRSL-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(226,'RES-DED-TRSL-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(227,'RES-DED-TRSL-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(228,'RES-DED-TRSL-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(229,'RES-DED-Nasdaq-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(230,'RES-DED-Nasdaq-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(231,'RES-DED-Nasdaq-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(232,'RES-DED-Nasdaq-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(233,'RES-DED-Nasdaq-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(234,'RES-DED-Nasdaq-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(235,'RES-DED-Nasdaq-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(236,'RES-DED-Nasdaq-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(237,'RES-DED-Nasdaq-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(238,'RES-DED-Nasdaq-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(239,'RES-DED-Nasdaq-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(240,'RES-DED-Nasdaq-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(241,'RES-DED-Nasdaq-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(242,'RES-DED-Nasdaq-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(243,'RES-DED-Novus-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(244,'RES-DED-Novus-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(245,'RES-DED-Novus-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(246,'RES-DED-Novus-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(247,'RES-DED-Novus-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(248,'RES-DED-Novus-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(249,'RES-DED-Novus-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(250,'RES-DED-Novus-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(251,'RES-DED-Novus-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(252,'RES-DED-Novus-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(253,'RES-DED-Novus-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(254,'RES-DED-Novus-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(255,'RES-DED-ARC-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(256,'RES-DED-ARC-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(257,'RES-DED-ARC-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(258,'RES-DED-ARC-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(259,'RES-DED-ARC-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(260,'RES-DED-ARC-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(261,'RES-DED-ARC-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(262,'RES-DED-ARC-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(263,'RES-DED-ARC-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(264,'RES-DED-ARC-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(265,'RES-DED-ARC-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(266,'RES-DED-ARC-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(267,'RES-DED-ARC-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(268,'RES-DED-ARC-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(269,'RES-DED-ARC-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(270,'RES-DED-ARC-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(271,'RES-DED-CB-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(272,'RES-DED-CB-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(273,'RES-DED-CB-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(274,'RES-DED-CB-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(275,'RES-DED-CB-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(276,'RES-DED-CB-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(277,'RES-DED-CB-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(278,'RES-DED-CB-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(279,'RES-DED-CB-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(280,'RES-DED-CB-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(281,'RES-DED-CB-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(282,'RES-DED-CB-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(283,'RES-DED-CB-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(284,'RES-DED-CB-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(285,'RES-DED-CB-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(286,'RES-DED-CB-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(287,'RES-DED-Oreedo-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(288,'RES-DED-Oreedo-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(289,'RES-DED-Oreedo-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(290,'RES-DED-Oreedo-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(291,'RES-DED-Oreedo-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(292,'RES-DED-Oreedo-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(293,'RES-DED-Oreedo-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(294,'RES-DED-Oreedo-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(295,'RES-DED-Oreedo-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(296,'RES-DED-Oreedo-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(297,'RES-DED-Oreedo-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(298,'RES-DED-Oreedo-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(299,'RES-DED-Oreedo-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(300,'RES-DED-Oreedo-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(301,'RES-DED-Ovum-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(302,'RES-DED-Ovum-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(303,'RES-DED-Ovum-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(304,'RES-DED-Ovum-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(305,'RES-DED-Ovum-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(306,'RES-DED-Ovum-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(307,'RES-DED-Ovum-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(308,'RES-DED-Ovum-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(309,'RES-DED-Ovum-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(310,'RES-DED-Ovum-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(311,'RES-DED-Ovum-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(312,'RES-DED-Ovum-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(313,'RES-DED-Ovum-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(314,'RES-DED-Informa-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(315,'RES-DED-Informa-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(316,'RES-DED-Informa-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(317,'RES-DED-Informa-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(318,'RES-DED-Informa-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(319,'RES-DED-Informa-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(320,'RES-DED-Informa-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(321,'RES-DED-Informa-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(322,'RES-DED-Informa-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(323,'RES-DED-Informa-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(324,'RES-DED-Informa-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(325,'RES-DED-Informa-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(326,'RES-DED-Informa-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(327,'RES-DED-Informa-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(328,'PR-PR1-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(329,'PR-PR1-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(330,'PR-PR1-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(331,'PR-PR1-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(332,'PR-PR1-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(333,'PR-PR1-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(334,'PR-PR1-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(335,'PR-PR1-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(336,'PR-PR1-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(337,'PR-PR1-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(338,'PR-PR1-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(339,'PR-PR1-EXE','Executive','Executive',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(340,'PR-PR2-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(341,'PR-PR2-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(342,'PR-PR2-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(343,'PR-PR2-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(344,'PR-PR2-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(345,'PR-PR2-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(346,'PR-PR2-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(347,'PR-PR2-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(348,'PR-PR2-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(349,'PR-PR2-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(350,'PR-PR2-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(351,'PR-PR2-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(352,'PR-PR2-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(353,'PR-PR2-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(354,'PR-PLS-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(355,'PR-PLS-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(356,'PR-PLS-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(357,'PR-PLS-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(358,'PR-PLS-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(359,'PR-PLS-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(360,'PR-PLS-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(361,'PR-PLS-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(362,'PR-PLS-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(363,'PR-PLS-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(364,'PR-PLS-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(365,'PR-PLS-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(366,'PR-PLS-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(367,'PR-DED-EIQ-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(368,'PR-DED-EIQ-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(369,'PR-DED-EIQ-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(370,'PR-DED-EIQ-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(371,'PR-DED-EIQ-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(372,'PR-DED-EIQ-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(373,'PR-DED-EIQ-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(374,'PR-DED-EIQ-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(375,'PR-DED-EIQ-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(376,'PR-DED-EIQ-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(377,'PR-DED-EIQ-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(378,'PR-DED-EIQ-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(379,'PR-DED-EIQ-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(380,'AT-SM-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(381,'AT-SM-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(382,'AT-SM-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(383,'AT-SM-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(384,'AT-SM-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(385,'AT-SM-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(386,'AT-SM-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(387,'AT-SM-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(388,'AT-SM-JDS','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(389,'AT-SM-DS','Data Scientist','Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(390,'AT-SM-SDS','Senior Data Scientist','Senior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(391,'AT-SM-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(392,'AT-SM-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(393,'AT-SM-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(394,'AT-SM-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(395,'AT-SM-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(396,'AT-SM-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(397,'AT-SM-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(398,'AT-SM-JDEV','Junior Developer','Junior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(399,'AT-SM-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(400,'AT-SM-SDEV','Senior Developer','Senior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(401,'AT-SM-JENGG','Junior Engineer','Junior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(402,'AT-SM-ENGG','Engineer','Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(403,'AT-SM-SENGG','Senior Engineer','Senior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(404,'AT-SM-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(405,'AT-SM-DBA','Database Architect','Database Architect',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(406,'AT-TECH-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(407,'AT-TECH-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(408,'AT-TECH-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(409,'AT-TECH-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(410,'AT-TECH-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(411,'AT-TECH-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(412,'AT-TECH-SANA','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(413,'AT-TECH-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(414,'AT-TECH-JDS','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(415,'AT-TECH-DS','Data Scientist','Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(416,'AT-TECH-SDS','Senior Data Scientist','Senior Data Scientist',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(417,'AT-TECH-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(418,'AT-TECH-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(419,'AT-TECH-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(420,'AT-TECH-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(421,'AT-TECH-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(422,'AT-TECH-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(423,'AT-TECH-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(424,'AT-TECH-JDEV','Junior Developer','Junior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(425,'AT-TECH-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(426,'AT-TECH-JENGG','Junior Engineer','Junior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(427,'AT-TECH-ENGG','Engineer','Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(428,'AT-TECH-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(429,'AT-TECH-DBA','Database Architect','Database Architect',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(430,'AT-GEN-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(431,'AT-GEN-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(432,'AT-GEN-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(433,'AT-GEN-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(434,'AT-GEN-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(435,'AT-GEN-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(436,'AT-GEN-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(437,'AT-GEN-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(438,'AT-GEN-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(439,'AT-GEN-PM','Project Manager','Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(440,'AT-GEN-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(441,'AT-GEN-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(442,'AT-GEN-JDEV','Junior Developer','Junior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(443,'AT-GEN-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(444,'AT-GEN-SDEV','Senior Developer','Senior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(445,'AT-GEN-JENGG','Junior Engineer','Junior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(446,'AT-GEN-ENGG','Engineer','Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(447,'AT-GEN-DBA','Database Architect','Database Architect',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(448,'AT-DED-Nick-INT','Intern','Intern',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(449,'AT-DED-Nick-ACM1','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(450,'AT-DED-Nick-ACM2','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(451,'AT-DED-Nick-IANA','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(452,'AT-DED-Nick-AANA','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(453,'AT-DED-Nick-ANA','Analyst','Analyst',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(454,'AT-DED-Nick-TL','Team Lead','Team Lead',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(455,'AT-DED-Nick-AMGR','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(456,'AT-DED-Nick-MGR','Manager','Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(457,'AT-DED-Nick-SMGR','Senior Manager','Senior Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(458,'AT-DED-Nick-APM','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(459,'AT-DED-Nick-SPM','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(460,'AT-DED-Nick-SME','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(461,'AT-DED-Nick-JDEV','Junior Developer','Junior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(462,'AT-DED-Nick-DEV','Developer','Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(463,'AT-DED-Nick-SDEV','Senior Developer','Senior Developer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(464,'AT-DED-Nick-JENGG','Junior Engineer','Junior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(465,'AT-DED-Nick-ENGG','Engineer','Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(466,'AT-DED-Nick-SENGG','Senior Engineer','Senior Engineer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(467,'AT-DED-Nick-C-REL','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(468,'AT-DED-Nick-DBA','Database Architect','Database Architect',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(469,'COPR-DEE-JGDE','Junior Graphic Designer','Junior Graphic Designer',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(470,'COPR-DEE-CED','Content Editor','Content Editor',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58'),(471,'NA','NA','NA',NULL,'2017-09-19 11:05:58','2017-09-19 11:05:58');
/*!40000 ALTER TABLE `resource_pool_masters` ENABLE KEYS */;
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
  `persent` decimal(10,0) DEFAULT NULL,
  `max_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_persent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `r_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reward_recognitions_on_reward_type_id` (`reward_type_id`),
  KEY `index_reward_recognitions_on_reward_owner_id` (`reward_owner_id`),
  CONSTRAINT `fk_rails_931c1253b0` FOREIGN KEY (`reward_owner_id`) REFERENCES `reward_owners` (`id`),
  CONSTRAINT `fk_rails_6ee8f4d610` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`)
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
  CONSTRAINT `fk_rails_b3a76cc850` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_4857fcccb2` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`)
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
  CONSTRAINT `fk_rails_9f0c2a73fb` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_0ea1a76c59` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ER_1001','GroupAdmin','All Access of the system',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'ER_1002','Admin','Company Level All Access',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'ER_1003','Branch','Branch level all access',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'ER_1004','HOD','Employee Self Service and Manager Self Service Access',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(5,'ER_1005','Supervisor','Employee Self Service and Manager Self Service Access',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(6,'ER_1006','Employee','Employee Self Service  ',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(7,'ER_1007','GroupRecruiter','All Recruitment access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(8,'ER_1008','AdminRecruiter','Company Level Recruitment access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(9,'ER_1009','Recruiter','Branch Level Recruitment access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(10,'ER_1010','GroupTimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(11,'ER_1011','AdminTimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(12,'ER_1012','TimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2017-09-19 04:12:11','2017-09-19 04:12:11');
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
  `map_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  CONSTRAINT `fk_rails_a8d9f7bf2d` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`),
  CONSTRAINT `fk_rails_308f210f51` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`)
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
  `parent_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_base` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
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
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `account_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_debit` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_salaryslips_on_employee_id` (`employee_id`),
  KEY `index_salaryslips_on_workingday_id` (`workingday_id`),
  KEY `index_salaryslips_on_salary_template_id` (`salary_template_id`),
  KEY `index_salaryslips_on_employee_template_id` (`employee_template_id`),
  CONSTRAINT `fk_rails_d880307445` FOREIGN KEY (`employee_template_id`) REFERENCES `employee_templates` (`id`),
  CONSTRAINT `fk_rails_26883533a7` FOREIGN KEY (`workingday_id`) REFERENCES `workingdays` (`id`),
  CONSTRAINT `fk_rails_514f6de682` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_588b701a4c` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`)
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160113091730'),('20160113093434'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092244'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170508142940'),('20170508144515'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170616052732'),('20170617045509'),('20170617062016'),('20170617103654'),('20170617122323'),('20170619090333'),('20170619093726'),('20170620124404'),('20170621071225'),('20170623073735'),('20170628085423'),('20170720090004'),('20170721053749'),('20170721092158'),('20170724071545'),('20170724105724'),('20170724115749'),('20170729093743'),('20170729093918'),('20170802054021'),('20170803091421'),('20170803091530'),('20170804042541'),('20170804114606'),('20170804125658'),('20170808095750'),('20170809114810'),('20170810094343'),('20170812084726'),('20170814060527'),('20170814075623'),('20170817121331'),('20170818095147'),('20170818114745'),('20170818121249'),('20170822065908'),('20170822073828'),('20170822081704'),('20170822113535'),('20170823081914'),('20170824074800'),('20170824075024'),('20170824085729'),('20170824110622'),('20170824113357'),('20170831060542'),('20170919120217');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `limit` decimal(10,0) DEFAULT NULL,
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
  `offer_letter_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortlist_for_interview` tinyint(1) DEFAULT NULL,
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
  `add_by_id` int(11) DEFAULT NULL,
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
-- Table structure for table `service_masters`
--

DROP TABLE IF EXISTS `service_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_masters`
--

LOCK TABLES `service_masters` WRITE;
/*!40000 ALTER TABLE `service_masters` DISABLE KEYS */;
INSERT INTO `service_masters` VALUES (1,'L000','Intern','Intern',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(2,'L001','Analyst','Analyst',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(3,'L002','Associate Analyst','Associate Analyst',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(4,'L003','Intermediate Analyst ','Intermediate Analyst ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(5,'L004','Client Relationship Manager','Client Relationship Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(6,'L005','Senior Analyst','Senior Analyst',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(7,'L006','Team Lead','Team Lead',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(8,'L007','Subject Matter Expert','Subject Matter Expert',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(9,'L008','Database Architect','Database Architect',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(10,'L009','Junior Content Editor','Junior Content Editor',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(11,'L010','Associate Project Manager','Associate Project Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(12,'L011','Project Manager','Project Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(13,'L012','Senior Project Manager','Senior Project Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(14,'L013','Assistant Manager','Assistant Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(15,'L015','Manager','Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(16,'L016','Senior Manager','Senior Manager',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(17,'L017','Account Manager 1','Account Manager 1',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(18,'L018','Account Manager 2','Account Manager 2',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(19,'L019','Junior Graphic Designer','Junior Graphic Designer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(20,'L020','Graphic Designer','Graphic Designer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(21,'L021','Senior Graphic Designer','Senior Graphic Designer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(22,'L022','Junior Data Scientist','Junior Data Scientist',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(23,'L023','Data Scientist','Data Scientist',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(24,'L024','Senior Data Scientist','Senior Data Scientist',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(25,'L025','Junior Developer','Junior Developer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(26,'L026','Developer','Developer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(27,'L027','Senior Developer','Senior Developer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(28,'L028','Junior Engineer','Junior Engineer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(29,'L029','Engineer','Engineer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(30,'L030','Content Editor','Content Editor',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(31,'L031','Senior Content Editor','Senior Content Editor',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(32,'L032','Senior Engineer','Senior Engineer',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(33,'L033','CEO','CEO',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(34,'L034','Senior System Administrator','Senior System Administrator',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(35,'L035','Assistant','Assistant',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(36,'L036','Manager ','Manager ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(37,'L037','Executive','Executive',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(38,'L038','Assistant Manager ','Assistant Manager ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(39,'L039','Associate Director ','Associate Director ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(40,'L040','Driver','Driver',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(41,'L041','Senior Executive','Senior Executive',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(42,'L042','Sales Consultant','Sales Consultant',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(43,'L043','System Administrator','System Administrator',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(44,'L044','Director','Director',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(45,'L045','COO','COO',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(46,'L046','Engineer ','Engineer ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(47,'L047','Intermediate Analyst','Intermediate Analyst',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(48,'L048','Senior Executive ','Senior Executive ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(49,'L049','Developer ','Developer ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(50,'L050','Deputy Manager ','Deputy Manager ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28'),(51,'L051','System Administrator ','System Administrator ',NULL,'2017-09-19 11:01:28','2017-09-19 11:01:28');
/*!40000 ALTER TABLE `service_masters` ENABLE KEYS */;
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
  `employee_designation_id` int(11) DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `esic_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pf_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cl` decimal(10,0) DEFAULT NULL,
  `el` decimal(10,0) DEFAULT NULL,
  `c_off` decimal(10,0) DEFAULT NULL,
  `advance` decimal(10,0) DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,NULL,'Andhra Pradesh','2017-09-19 04:12:12','2017-09-19 04:12:12'),(2,1,NULL,'Assam','2017-09-19 04:12:12','2017-09-19 04:12:12'),(3,1,NULL,'Bihar','2017-09-19 04:12:12','2017-09-19 04:12:12'),(4,1,NULL,'Chhattisgarh','2017-09-19 04:12:12','2017-09-19 04:12:12'),(5,1,NULL,'Delhi','2017-09-19 04:12:12','2017-09-19 04:12:12'),(6,1,NULL,'Goa','2017-09-19 04:12:12','2017-09-19 04:12:12'),(7,1,NULL,'Gujarat','2017-09-19 04:12:12','2017-09-19 04:12:12'),(8,1,NULL,'Haryana','2017-09-19 04:12:12','2017-09-19 04:12:12'),(9,1,NULL,'Himachal Pradesh','2017-09-19 04:12:12','2017-09-19 04:12:12'),(10,1,NULL,'Jammu & Kashmir','2017-09-19 04:12:12','2017-09-19 04:12:12'),(11,1,NULL,'Jharkhand','2017-09-19 04:12:12','2017-09-19 04:12:12'),(12,1,NULL,'Karnataka','2017-09-19 04:12:12','2017-09-19 04:12:12'),(13,1,NULL,'Kerala','2017-09-19 04:12:12','2017-09-19 04:12:12'),(14,1,NULL,'Madhya Pradesh','2017-09-19 04:12:12','2017-09-19 04:12:12'),(15,1,NULL,'Maharashtra','2017-09-19 04:12:12','2017-09-19 04:12:12'),(16,1,NULL,'Meghalaya','2017-09-19 04:12:12','2017-09-19 04:12:12'),(17,5,NULL,'NA','2017-09-19 04:12:12','2017-09-19 04:12:12'),(18,3,NULL,'NA','2017-09-19 04:12:12','2017-09-19 04:12:12'),(19,NULL,NULL,'NA','2017-09-19 04:12:12','2017-09-19 04:12:12'),(20,3,NULL,'NA','2017-09-19 04:12:12','2017-09-19 04:12:12'),(21,1,NULL,'Nepal','2017-09-19 04:12:12','2017-09-19 04:12:12'),(22,1,NULL,'New Delhi','2017-09-19 04:12:12','2017-09-19 04:12:12'),(23,NULL,NULL,'New Jersey','2017-09-19 04:12:12','2017-09-19 04:12:12'),(24,1,NULL,'Odisha','2017-09-19 04:12:12','2017-09-19 04:12:12'),(25,1,NULL,'Punjab','2017-09-19 04:12:12','2017-09-19 04:12:12'),(26,1,NULL,'Rajasthan','2017-09-19 04:12:12','2017-09-19 04:12:12'),(27,1,NULL,'Telangana','2017-09-19 04:12:12','2017-09-19 04:12:12'),(28,1,NULL,'Uttar Pradesh','2017-09-19 04:12:12','2017-09-19 04:12:12'),(29,1,NULL,'Uttarakhand','2017-09-19 04:12:13','2017-09-19 04:12:13'),(30,1,NULL,'West Bengal','2017-09-19 04:12:13','2017-09-19 04:12:13'),(31,2,'','New York','2017-09-19 08:28:27','2017-09-19 08:28:27');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_c_offs`
--

DROP TABLE IF EXISTS `status_c_offs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_c_offs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_c_off_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status_c_offs_on_leave_c_off_id` (`leave_c_off_id`),
  KEY `index_status_c_offs_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_1560aed95d` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_7fe1fe3816` FOREIGN KEY (`leave_c_off_id`) REFERENCES `leave_c_offs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_c_offs`
--

LOCK TABLES `status_c_offs` WRITE;
/*!40000 ALTER TABLE `status_c_offs` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_c_offs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_departments`
--

DROP TABLE IF EXISTS `sub_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sub_departments_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_6f78497161` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
INSERT INTO `sub_departments` VALUES (1,8,'0','TRSL',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(2,8,'0','Nasdaq',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(3,8,'0','Novus',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(4,8,'0','ARC',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(5,8,'0','CB',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(6,8,'0','Oreedo',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(7,8,'0','Ovum',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(8,8,'0','Informa',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(9,8,'0','EIQ',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(10,8,'0','Nick',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(11,8,'0','TRTA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(12,1,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(13,2,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(14,3,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(15,4,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(16,5,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(17,6,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(18,7,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(19,9,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(20,10,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(21,11,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(22,12,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(23,9,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(24,15,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(25,16,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(26,9,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(27,18,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(28,19,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(29,20,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(30,21,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(31,22,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(32,23,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(33,24,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(34,9,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(35,26,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(36,27,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(37,28,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(38,29,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(39,30,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52'),(40,31,'0','NA',1,'2017-09-19 04:55:52','2017-09-19 04:55:52');
/*!40000 ALTER TABLE `sub_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_companies`
--

DROP TABLE IF EXISTS `target_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_companies`
--

LOCK TABLES `target_companies` WRITE;
/*!40000 ALTER TABLE `target_companies` DISABLE KEYS */;
INSERT INTO `target_companies` VALUES (1,'TC_001','Crisil',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(2,'TC_002','Evalueserve',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(3,'TC_003','Markets & Markets',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(4,'TC_004','Genpact',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(5,'TC_005','ZS associates',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(6,'TC_006','Thomson Reuters',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(7,'TC_007','Moody Analytics',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(8,'TC_008','Copal Amba',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(9,'TC_009','Fractal Analytics',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(10,'TC_010','Credit Rating (Fitch Rating)',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(11,'TC_011','Smart Cube',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(12,'TC_012','Smart Analyst',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(13,'TC_013','IMRB (Kantar)',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(14,'TC_014','Neilsen',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(15,'TC_015','Deloitte',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(16,'TC_016','GD Research',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(17,'TC_017','Cheers interactive',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(18,'TC_018','Cross Tab',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(19,'TC_019','Blue Ocean',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(20,'TC_020','Absolute Data',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(21,'TC_021','Mu Sigma',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(22,'TC_022','Tesco',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(23,'TC_023','Target Corp',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(24,'TC_024','Zion Market Research',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(25,'TC_025','Future Market Insights',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(26,'TC_026','Allied Analytics',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(27,'TC_027','JP Morgan',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(28,'TC_028','Karvy Analytics',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(29,'TC_029','S&P Global',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(30,'TC_030','Verity',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(31,'TC_031','Transparent value',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(32,'TC_032','Transparency Market Research',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(33,'TC_033','Aranca',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(34,'TC_034','Bank of America',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(35,'TC_035','Global Analytics',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(36,'TC_036','Novartis',NULL,1,'2017-09-19 04:12:11','2017-09-19 04:12:11'),(37,'TC001','Crisil',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(38,'TC002','Evalueserve',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(39,'TC003','Markets & Markets',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(40,'TC004','Genpact',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(41,'TC005','ZS associates',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(42,'TC006','Thomson Reuters',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(43,'TC007','Moody Analytics',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(44,'TC008','Copal Amba',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(45,'TC009','Fractal Analytics',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(46,'TC010','Credit Rating (Fitch Rating)',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(47,'TC011','Smart Cube',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(48,'TC012','Smart Analyst',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(49,'TC013','IMRB (Kantar)',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(50,'TC014','Neilsen',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(51,'TC015','Deloitte',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(52,'TC016','GD Research',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(53,'TC017','Cheers interactive',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(54,'TC018','Cross Tab',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(55,'TC019','Blue Ocean',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(56,'TC020','Absolute Data',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(57,'TC021','Mu Sigma',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(58,'TC022','Tesco',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(59,'TC023','Target Corp',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(60,'TC024','Zion Market Research',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(61,'TC025','Future Market Insights',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(62,'TC026','Allied Analytics',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(63,'TC027','JP Morgan',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(64,'TC028','Karvy Analytics',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(65,'TC029','S&P Global',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(66,'TC030','Verity',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(67,'TC031','Transparent value',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(68,'TC032','Transparency Market Research',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(69,'TC033','Aranca',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(70,'TC034','Bank of America',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(71,'TC035','Global Analytics',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51'),(72,'TC036','Novartis',NULL,1,'2017-09-19 13:05:51','2017-09-19 13:05:51');
/*!40000 ALTER TABLE `target_companies` ENABLE KEYS */;
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
  CONSTRAINT `fk_rails_47df5f3b2a` FOREIGN KEY (`salaryslip_id`) REFERENCES `salaryslips` (`id`),
  CONSTRAINT `fk_rails_0b8d1e0502` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
-- Table structure for table `thoughts`
--

DROP TABLE IF EXISTS `thoughts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thoughts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `thought` text COLLATE utf8_unicode_ci,
  `thought_of` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoughts`
--

LOCK TABLES `thoughts` WRITE;
/*!40000 ALTER TABLE `thoughts` DISABLE KEYS */;
/*!40000 ALTER TABLE `thoughts` ENABLE KEYS */;
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `training_topic_master_id` int(11) DEFAULT NULL,
  `is_complete` tinyint(1) DEFAULT NULL,
  `training_plan` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trainee_requests_on_training_request_id` (`training_request_id`),
  KEY `index_trainee_requests_on_employee_id` (`employee_id`),
  KEY `index_trainee_requests_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_aec79e9d4b` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_66e80626aa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_bb8b581ef0` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`)
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
  `employee_id` int(11) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  `is_complete` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trainees_on_training_plan_id` (`training_plan_id`),
  KEY `index_trainees_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_a7c6771f5c` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_3cf21189e5` FOREIGN KEY (`training_plan_id`) REFERENCES `training_plans` (`id`)
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
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_approvals_on_training_request_id` (`training_request_id`),
  KEY `index_training_approvals_on_employee_id` (`employee_id`),
  KEY `index_training_approvals_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_b4d09339d3` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_7d0c8c3052` FOREIGN KEY (`training_request_id`) REFERENCES `training_requests` (`id`),
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
  `training_topic_master_id` int(11) DEFAULT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  `trainer_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_trainer` text COLLATE utf8_unicode_ci,
  `period_id` int(11) DEFAULT NULL,
  `trainer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_plans_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_training_plans_on_training_request_id` (`training_request_id`),
  KEY `index_training_plans_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_a90174f6bf` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_722231f687` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
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
  `training_topic_master_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `no_of_employee` int(11) DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `employee_category_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_location_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_company_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_expence_types`
--

LOCK TABLES `travel_expence_types` WRITE;
/*!40000 ALTER TABLE `travel_expence_types` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_modes`
--

LOCK TABLES `travel_modes` WRITE;
/*!40000 ALTER TABLE `travel_modes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_options`
--

LOCK TABLES `travel_options` WRITE;
/*!40000 ALTER TABLE `travel_options` DISABLE KEYS */;
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
  `travel_mode_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_bill_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_request_histories_on_travel_request_id` (`travel_request_id`),
  KEY `index_travel_request_histories_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_request_histories_on_travel_mode_id` (`travel_mode_id`),
  KEY `index_travel_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_c0ebfca129` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_2f199330b2` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_b07d84a89f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
  CONSTRAINT `fk_rails_bd36e7cbd9` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`)
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
  `to` date DEFAULT NULL,
  `total_advance` decimal(10,0) DEFAULT NULL,
  `tour_purpose` text COLLATE utf8_unicode_ci,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traveling_advance` decimal(15,2) DEFAULT '0.00',
  `reporting_master_id` int(11) DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense` decimal(10,0) DEFAULT NULL,
  `daily_bill_status` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'UNI_01','Indian Institute of Technology, Delhi',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(2,'UNI_02','INSEAD',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(3,'UNI_03','NA',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(4,'UNI_04','NIT Bhopal',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(5,'UNI_05','NIT Allahabad',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(6,'UNI_06','SDM Mysore',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(7,'UNI_07','IMT Nagpur',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(8,'UNI_08','JNTU',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24'),(9,'UNI_09','ICFAI, Kolkata',NULL,NULL,'2017-09-19 12:59:24','2017-09-19 12:59:24');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
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
  `justification` text COLLATE utf8_unicode_ci,
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
  `vacancy_fullfillment_date` date DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `vacancy_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `target_date` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `vacancy_of` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT NULL,
  `secondary_skill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  KEY `index_vacancy_masters_on_company_id` (`company_id`),
  KEY `index_vacancy_masters_on_sub_department_id` (`sub_department_id`),
  KEY `index_vacancy_masters_on_cost_center_id` (`cost_center_id`),
  CONSTRAINT `fk_rails_026a45f54e` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_96332426ca` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b3b3eb60a4` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`id`),
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
  KEY `index_vacancy_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_a3ee9c0997` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_0990a86378` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_690afaafaf` FOREIGN KEY (`vacancy_master_id`) REFERENCES `vacancy_masters` (`id`),
  CONSTRAINT `fk_rails_85193e42c6` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_9d011e0876` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_9e78a9dc64` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
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
-- Table structure for table `vacancy_request_statuses`
--

DROP TABLE IF EXISTS `vacancy_request_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_request_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy_request_id` int(11) DEFAULT NULL,
  `action_by_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_request_statuses_on_vacancy_request_id` (`vacancy_request_id`),
  CONSTRAINT `fk_rails_936b22fff3` FOREIGN KEY (`vacancy_request_id`) REFERENCES `vacancy_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_request_statuses`
--

LOCK TABLES `vacancy_request_statuses` WRITE;
/*!40000 ALTER TABLE `vacancy_request_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacancy_request_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_requests`
--

DROP TABLE IF EXISTS `vacancy_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacancy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_position` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `request_by_id` int(11) DEFAULT NULL,
  `approval_by_id` int(11) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skill_set` text COLLATE utf8_unicode_ci,
  `employee_designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_requests_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_requests_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_cf7bd63395` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_303f7c28a8` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_requests`
--

LOCK TABLES `vacancy_requests` WRITE;
/*!40000 ALTER TABLE `vacancy_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacancy_requests` ENABLE KEYS */;
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
  `is_send` tinyint(1) DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `is_prefix` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `date` date DEFAULT NULL,
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `day_in_month` int(11) DEFAULT NULL,
  `present_day` decimal(10,2) DEFAULT NULL,
  `holiday_in_month` decimal(10,2) DEFAULT NULL,
  `week_off_day` decimal(10,2) DEFAULT NULL,
  `absent_day` decimal(10,2) DEFAULT NULL,
  `payable_day` decimal(10,2) DEFAULT NULL,
  `nonpayable_day` decimal(10,2) DEFAULT NULL,
  `calculated_payable_days` decimal(10,2) DEFAULT NULL,
  `pay_leave` decimal(10,2) DEFAULT NULL,
  `nonpay_leave` decimal(10,2) DEFAULT NULL,
  `od_day` decimal(10,2) DEFAULT NULL,
  `ot_hours` decimal(10,2) DEFAULT NULL,
  `total_leave` decimal(10,2) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `full_and_final` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (1,1960,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(2,1961,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(3,1962,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(4,1963,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(5,1964,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(6,1965,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(7,1966,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(8,1967,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(9,1968,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(10,1969,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(11,1970,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(12,1971,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(13,1972,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(14,1973,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(15,1974,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(16,1975,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(17,1976,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(18,1977,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(19,1978,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(20,1979,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(21,1980,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(22,1981,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(23,1982,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(24,1983,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(25,1984,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(26,1985,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(27,1986,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(28,1987,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(29,1988,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(30,1989,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(31,1990,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(32,1991,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(33,1992,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(34,1993,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(35,1994,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(36,1995,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(37,1996,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(38,1997,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(39,1998,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(40,1999,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(41,2000,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(42,2001,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(43,2002,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(44,2003,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(45,2004,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(46,2005,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(47,2006,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(48,2007,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(49,2008,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(50,2009,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(51,2010,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(52,2011,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(53,2012,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(54,2013,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(55,2014,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(56,2015,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(57,2016,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(58,2017,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(59,2018,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(60,2019,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(61,2020,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(62,2021,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(63,2022,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(64,2023,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(65,2024,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13'),(66,2025,NULL,'2017-09-19 04:12:13','2017-09-19 04:12:13');
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

-- Dump completed on 2017-09-19 18:54:31