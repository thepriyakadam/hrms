-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
  `intrest` tinyint(1) DEFAULT NULL,
  `rate` decimal(10,0) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'BANK OF INDIA',NULL,NULL,NULL,'2018-01-03 14:24:42','2018-01-03 14:24:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(2,'AB+',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(3,'B+',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(4,'O+',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(5,'A-',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(6,'B-',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(7,'O-',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(8,'AB-',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(9,'A1B +VE',NULL,'2018-01-03 14:23:26','2018-01-03 14:23:26'),(10,'0+',NULL,'2018-01-03 14:23:27','2018-01-03 14:23:27'),(11,'O +',NULL,'2018-01-03 16:26:57','2018-01-03 16:26:57'),(12,'AB +',NULL,'2018-01-03 16:26:58','2018-01-03 16:26:58');
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
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circulars`
--

LOCK TABLES `circulars` WRITE;
/*!40000 ALTER TABLE `circulars` DISABLE KEYS */;
INSERT INTO `circulars` VALUES (1,'2017-01-01','KRA Reviews-Q3',1,NULL,'yojana.g@sparkline.co.in',NULL,'2018-01-06 09:18:45','2018-01-06 09:18:45',NULL,NULL,NULL,NULL,'KRA_Reviews_Q3.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',11641,'2018-01-06 09:18:45');
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
INSERT INTO `companies` VALUES (1,NULL,'C_1001','COM001','Sparkline Equipments Pvt. Ltd.','Sparkline',1,'9876541230','AACCS5871L','27AACCS5871L1ZU','','Plot No.32/2 and 38, FII Block, MIDC Pimpri, Pune',1,1,1,'Pune',411018,'hr.pune@sparkline.co.in','9372705832','www.sparklineequip.com','1994-09-13','2018-01-03 14:17:16','2018-01-06 10:04:11',NULL,NULL,NULL,NULL);
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
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_events`
--

LOCK TABLES `company_events` WRITE;
/*!40000 ALTER TABLE `company_events` DISABLE KEYS */;
INSERT INTO `company_events` VALUES (1,'Training-Inventory Management','2018-01-18','Training Room-UNIT I',1,'2pm','By Mr.Harun Tamboli for SCM & Commercial Departments','purchase@sparkline.co.in',NULL,'2018-01-06 10:54:11','2018-01-06 10:54:11'),(2,'Training-GD & T','2018-01-11','Training Room UNIT I',1,'2 pm','By Mr.Jamir Shaikh for Design Department','design@sparkline.co.in',NULL,'2018-01-06 10:55:19','2018-01-06 10:55:19'),(3,'Training - Product (Wire Rope Hoist)','2018-01-20','Training Room UNIT I',1,'11am','By.Mr.Dilip for Pune Sales Team','sales@sparkline.co.in',NULL,'2018-01-06 10:56:23','2018-01-06 10:56:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'CL_101','COMLOC001','Pune','hr.pune@sparkline.co.in','Plot No.38, FII Block, MIDC Pimpri, Pune','Pune',1,1,1,411018,'9372705832','2018-01-03 14:22:41','2018-01-06 08:52:53'),(2,1,'CL_102','COMLOC002','Chennai (Pillaipakkam)','josan@sparkline.co.in','Sparkline Equipments (P) Ltd  | Plot  No. A-21  SIPCOT Industrial Park,Pillaipakkam, Sriperambudhur.','Chennai',1,5,5,602105,'8939645450','2018-01-06 08:57:09','2018-01-06 08:57:38'),(3,1,'CL_103','COMLOC003','Chennai (Guindy)','ganesh.g@sparkline.co.in','Sparkline Equipments (P) Ltd, 112 Annasalai, Guindy, Chennai.','Guindy',1,5,12,600032,'9543845457','2018-01-06 09:02:03','2018-01-06 09:02:03'),(4,1,'CL_104','COMLOC004','Jamshedpur','account.jsr@sparkline.co.in','A/2,3RD FLOOR , GANDHI TOWER GANESH VATIKA, ULIYAN, ANIL SUR PATH, KADMA, JAMSHEDPUR, JHARKHAND, INDIA','JHARKHAND',1,3,3,831005,'06572308006','2018-01-06 09:07:21','2018-01-06 09:07:21'),(5,1,'CL_105','COMLOC005','Delhi','account.delhi@sparkline.co.in','MD Plaza, Shop No 38 ,New Sabzi Mandi, Sector – 16, Faridabad , Haryana ','Faridabad',1,7,19,121002,'1294170257','2018-01-06 09:12:07','2018-01-06 09:12:07'),(6,1,'CL_106','COMLOC006','Gujarat','rahul.j@sparkline.co.in','Baroda','Baroda',1,12,22,390001,'','2018-01-08 14:45:39','2018-01-08 14:45:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'CT_1001','Private Limited ','Private Limited ',NULL,'2018-01-03 13:11:29','2018-01-03 13:11:29'),(2,'CT_1002','Limited Liability Partnership','Limited Liability Partnership',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(3,'CT_1003','Public Limited','Public Limited',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30');
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `role1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_contact_details_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_d613be133f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
INSERT INTO `contact_details` VALUES (1,126,'HR Executive','',1,'Payroll','HRMS','Recruitment & Onboarding','Training & Development','Performance Management','','','','2018-01-06 10:57:48','2018-01-06 11:11:18'),(2,2,'Ajay Raval','',1,'Head of Project Department','Project Management','','','','','','','2018-01-06 10:58:38','2018-01-06 10:58:44'),(3,25,'Bhavesh Shirode','',1,'Business Manager-Components','Manufacturing Head-Pune','P & L Owner','','','','','','2018-01-06 10:59:30','2018-01-06 11:00:15'),(4,22,'Balagouda Patil','',1,'Head-Crane Design','Electrical','Automation','Defect Management System','','','','','2018-01-06 11:00:05','2018-01-06 11:03:12'),(5,7,'Amit Mishra','',1,'Head-Services','After Sales Service','P & L Owner-TRIDA','','','','','','2018-01-06 11:02:07','2018-01-06 11:02:07'),(6,27,'Head-Finance & Commercial','',1,'Financial Management','Sparkline P & L','','','','','','','2018-01-06 11:05:00','2018-01-06 11:05:00'),(7,48,'Head- Design Automation','',1,'New Product Development','Automation','Mechanical Design','','','','','','2018-01-06 11:05:49','2018-01-06 11:05:49'),(8,52,'Head-Supply Chain Management','',1,'Inventory Control','ERP','','','','','','','2018-01-06 11:06:24','2018-01-06 11:06:30'),(9,63,'Manufacturing Manager ','',1,'Production Planning & Control','Crane Manufacturing','','','','','','','2018-01-06 11:07:28','2018-01-06 11:07:33'),(10,78,'IR & Admin','',1,'Health & Safety Management','Site Safety','Safety Audits & Work Permits','Legal Compliances','Contract Labour Management','Admin & Facility Management','Vehicle Management','Stationery & Offical Supplies','2018-01-06 11:09:12','2018-01-06 11:09:12'),(11,115,'Business Head-Farm Division','',1,'Farm Equipment','P & L Owner','','','','','','','2018-01-06 11:09:54','2018-01-06 11:09:54'),(12,88,'Head-Indstahl','',1,'Indstahl Spare Parts Distribution Company','Spares Sales-Chennai Unit','P & L Owner','','','','','','2018-01-06 11:10:49','2018-01-06 11:10:49');
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;
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
INSERT INTO `cost_centers` VALUES (1,NULL,'Crane',NULL,NULL,'2018-01-05 16:06:15','2018-01-05 16:06:15'),(2,NULL,'TRIDA',NULL,NULL,'2018-01-05 16:06:15','2018-01-05 16:06:15'),(3,NULL,'Design Automation',NULL,NULL,'2018-01-05 16:06:16','2018-01-05 16:06:16'),(4,NULL,'Component',NULL,NULL,'2018-01-05 16:06:16','2018-01-05 16:06:16'),(5,NULL,'INDSTHAL',NULL,NULL,'2018-01-05 16:06:18','2018-01-05 16:06:18'),(6,NULL,'Farm Division',NULL,NULL,'2018-01-06 10:36:22','2018-01-06 10:36:22');
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
INSERT INTO `countries` VALUES (1,'IN','India','2018-01-03 13:11:41','2018-01-03 13:11:41');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2018-01-03 14:17:16','2018-01-03 14:17:16'),(2,'company_location',6,'2018-01-03 14:22:41','2018-01-08 14:45:39'),(3,'department',33,'2018-01-03 14:23:16','2018-01-08 14:52:02'),(4,'employee',136,'2018-01-03 14:23:16','2018-01-03 16:26:58');
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
  `time` datetime DEFAULT NULL,
  `employee_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reader_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_attendances`
--

LOCK TABLES `daily_attendances` WRITE;
/*!40000 ALTER TABLE `daily_attendances` DISABLE KEYS */;
INSERT INTO `daily_attendances` VALUES (1201,NULL,'2017-12-31','2017-12-31 17:03:43','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:22','2018-01-08 13:12:22'),(1202,NULL,'2017-12-31','2017-12-31 17:04:14','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1203,NULL,'2017-12-31','2017-12-31 17:04:30','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1204,NULL,'2017-12-31','2017-12-31 17:05:00','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1205,NULL,'2017-12-31','2017-12-31 17:05:42','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1206,NULL,'2017-12-31','2017-12-31 17:06:35','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1207,NULL,'2017-12-31','2017-12-31 17:07:32','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1208,NULL,'2017-12-31','2017-12-31 17:07:38','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1209,NULL,'2017-12-31','2017-12-31 17:08:32','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1210,NULL,'2017-12-31','2017-12-31 17:08:39','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1211,NULL,'2017-12-31','2017-12-31 17:08:50','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1212,NULL,'2017-12-31','2017-12-31 17:09:33','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1213,NULL,'2017-12-31','2017-12-31 17:10:32','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1214,NULL,'2017-12-31','2017-12-31 17:11:05','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1215,NULL,'2017-12-31','2017-12-31 18:01:04','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1216,NULL,'2017-12-31','2017-12-31 18:17:53','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1217,NULL,'2017-12-31','2017-12-31 18:18:04','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1218,NULL,'2018-01-01','2018-01-01 08:15:18','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1219,NULL,'2018-01-01','2018-01-01 08:16:53','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1220,NULL,'2018-01-01','2018-01-01 08:22:30','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1221,NULL,'2018-01-01','2018-01-01 08:22:42','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1222,NULL,'2018-01-01','2018-01-01 08:22:48','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1223,NULL,'2018-01-01','2018-01-01 08:22:56','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1224,NULL,'2018-01-01','2018-01-01 08:23:32','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1225,NULL,'2018-01-01','2018-01-01 08:24:28','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1226,NULL,'2018-01-01','2018-01-01 08:25:47','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1227,NULL,'2018-01-01','2018-01-01 08:27:19','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1228,NULL,'2018-01-01','2018-01-01 08:27:35','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1229,NULL,'2018-01-01','2018-01-01 08:27:51','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1230,NULL,'2018-01-01','2018-01-01 08:28:00','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1231,NULL,'2018-01-01','2018-01-01 08:28:41','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1232,NULL,'2018-01-01','2018-01-01 08:30:25','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1233,NULL,'2018-01-01','2018-01-01 08:30:31','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1234,NULL,'2018-01-01','2018-01-01 08:30:51','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1235,NULL,'2018-01-01','2018-01-01 08:30:55','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1236,NULL,'2018-01-01','2018-01-01 08:31:06','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1237,NULL,'2018-01-01','2018-01-01 09:29:49','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1238,NULL,'2018-01-01','2018-01-01 17:03:59','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1239,NULL,'2018-01-01','2018-01-01 17:04:01','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1240,NULL,'2018-01-01','2018-01-01 17:04:08','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1241,NULL,'2018-01-01','2018-01-01 17:07:01','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1242,NULL,'2018-01-01','2018-01-01 17:08:16','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1243,NULL,'2018-01-01','2018-01-01 17:14:28','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1244,NULL,'2018-01-01','2018-01-01 17:18:12','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1245,NULL,'2018-01-01','2018-01-01 17:19:29','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1246,NULL,'2018-01-01','2018-01-01 17:20:44','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:29','2018-01-08 13:12:29'),(1247,NULL,'2018-01-01','2018-01-01 17:30:36','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1248,NULL,'2018-01-01','2018-01-01 17:45:38','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1249,NULL,'2018-01-01','2018-01-01 17:49:43','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1250,NULL,'2018-01-01','2018-01-01 17:52:47','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1251,NULL,'2018-01-01','2018-01-01 17:57:17','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1252,NULL,'2018-01-01','2018-01-01 17:59:13','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1253,NULL,'2018-01-01','2018-01-01 18:15:14','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1254,NULL,'2018-01-01','2018-01-01 18:15:45','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:30','2018-01-08 13:12:30'),(1255,NULL,'2018-01-01','2018-01-01 19:18:58','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1256,NULL,'2018-01-01','2018-01-01 19:36:50','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1257,NULL,'2018-01-02','2018-01-02 08:20:05','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1258,NULL,'2018-01-02','2018-01-02 08:22:05','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1259,NULL,'2018-01-02','2018-01-02 08:22:16','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1260,NULL,'2018-01-02','2018-01-02 08:22:50','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1261,NULL,'2018-01-02','2018-01-02 08:23:40','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1262,NULL,'2018-01-02','2018-01-02 08:25:21','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1263,NULL,'2018-01-02','2018-01-02 08:25:40','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1264,NULL,'2018-01-02','2018-01-02 08:26:14','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1265,NULL,'2018-01-02','2018-01-02 08:26:20','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1266,NULL,'2018-01-02','2018-01-02 08:26:59','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1267,NULL,'2018-01-02','2018-01-02 08:27:42','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1268,NULL,'2018-01-02','2018-01-02 08:27:46','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1269,NULL,'2018-01-02','2018-01-02 08:28:23','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1270,NULL,'2018-01-02','2018-01-02 08:28:38','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1271,NULL,'2018-01-02','2018-01-02 08:30:24','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1272,NULL,'2018-01-02','2018-01-02 08:30:56','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1273,NULL,'2018-01-02','2018-01-02 08:31:17','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1274,NULL,'2018-01-02','2018-01-02 08:32:00','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1275,NULL,'2018-01-02','2018-01-02 08:35:33','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1276,NULL,'2018-01-02','2018-01-02 16:00:42','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1277,NULL,'2018-01-02','2018-01-02 17:00:18','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1278,NULL,'2018-01-02','2018-01-02 17:00:27','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1279,NULL,'2018-01-02','2018-01-02 17:00:53','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1280,NULL,'2018-01-02','2018-01-02 17:01:45','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1281,NULL,'2018-01-02','2018-01-02 17:06:20','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1282,NULL,'2018-01-02','2018-01-02 17:10:10','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1283,NULL,'2018-01-02','2018-01-02 17:10:16','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1284,NULL,'2018-01-02','2018-01-02 17:10:18','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1285,NULL,'2018-01-02','2018-01-02 17:14:32','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1286,NULL,'2018-01-02','2018-01-02 17:19:09','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1287,NULL,'2018-01-02','2018-01-02 17:22:08','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1288,NULL,'2018-01-02','2018-01-02 17:23:07','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:35','2018-01-08 13:12:35'),(1289,NULL,'2018-01-02','2018-01-02 17:29:34','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1290,NULL,'2018-01-02','2018-01-02 18:14:34','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1291,NULL,'2018-01-02','2018-01-02 19:26:46','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1292,NULL,'2018-01-03','2018-01-03 08:04:13','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1293,NULL,'2018-01-03','2018-01-03 08:11:34','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1294,NULL,'2018-01-03','2018-01-03 08:15:26','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1295,NULL,'2018-01-03','2018-01-03 08:20:05','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1296,NULL,'2018-01-03','2018-01-03 08:20:15','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1297,NULL,'2018-01-03','2018-01-03 08:20:59','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1298,NULL,'2018-01-03','2018-01-03 08:21:05','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1299,NULL,'2018-01-03','2018-01-03 08:22:27','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1300,NULL,'2018-01-03','2018-01-03 08:22:30','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1301,NULL,'2018-01-03','2018-01-03 08:23:48','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1302,NULL,'2018-01-03','2018-01-03 08:23:57','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1303,NULL,'2018-01-03','2018-01-03 08:24:04','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1304,NULL,'2018-01-03','2018-01-03 08:24:14','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1305,NULL,'2018-01-03','2018-01-03 08:24:50','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1306,NULL,'2018-01-03','2018-01-03 08:24:55','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1307,NULL,'2018-01-03','2018-01-03 08:25:14','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1308,NULL,'2018-01-03','2018-01-03 08:26:46','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1309,NULL,'2018-01-03','2018-01-03 08:27:36','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1310,NULL,'2018-01-03','2018-01-03 08:36:31','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1311,NULL,'2018-01-03','2018-01-03 09:13:27','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1312,NULL,'2018-01-03','2018-01-03 12:27:51','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1313,NULL,'2018-01-03','2018-01-03 16:57:38','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1314,NULL,'2018-01-03','2018-01-03 16:57:45','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1315,NULL,'2018-01-03','2018-01-03 16:59:26','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1316,NULL,'2018-01-03','2018-01-03 17:00:14','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1317,NULL,'2018-01-03','2018-01-03 17:00:27','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1318,NULL,'2018-01-03','2018-01-03 17:01:29','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1319,NULL,'2018-01-03','2018-01-03 17:02:10','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1320,NULL,'2018-01-03','2018-01-03 17:04:35','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1321,NULL,'2018-01-03','2018-01-03 17:17:18','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1322,NULL,'2018-01-03','2018-01-03 17:18:32','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1323,NULL,'2018-01-03','2018-01-03 17:20:48','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1324,NULL,'2018-01-03','2018-01-03 17:38:10','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1325,NULL,'2018-01-03','2018-01-03 17:38:40','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1326,NULL,'2018-01-03','2018-01-03 18:12:15','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1327,NULL,'2018-01-03','2018-01-03 18:16:28','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:40','2018-01-08 13:12:40'),(1328,NULL,'2018-01-03','2018-01-03 18:18:02','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1329,NULL,'2018-01-03','2018-01-03 18:18:11','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1330,NULL,'2018-01-03','2018-01-03 18:18:14','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1331,NULL,'2018-01-03','2018-01-03 20:18:52','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1332,NULL,'2018-01-03','2018-01-03 20:20:47','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1333,NULL,'2018-01-04','2018-01-04 08:21:13','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1334,NULL,'2018-01-04','2018-01-04 08:29:14','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1335,NULL,'2018-01-04','2018-01-04 08:29:28','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1336,NULL,'2018-01-04','2018-01-04 08:40:58','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1337,NULL,'2018-01-04','2018-01-04 08:41:05','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1338,NULL,'2018-01-04','2018-01-04 09:02:42','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1339,NULL,'2018-01-04','2018-01-04 09:15:07','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1340,NULL,'2018-01-04','2018-01-04 12:21:49','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1341,NULL,'2018-01-04','2018-01-04 12:22:03','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1342,NULL,'2018-01-04','2018-01-04 16:57:20','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1343,NULL,'2018-01-04','2018-01-04 17:00:21','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1344,NULL,'2018-01-04','2018-01-04 17:00:26','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1345,NULL,'2018-01-04','2018-01-04 17:39:27','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1346,NULL,'2018-01-04','2018-01-04 18:15:06','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1347,NULL,'2018-01-05','2018-01-05 08:16:30','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1348,NULL,'2018-01-05','2018-01-05 08:18:25','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1349,NULL,'2018-01-05','2018-01-05 08:18:39','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1350,NULL,'2018-01-05','2018-01-05 08:20:51','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1351,NULL,'2018-01-05','2018-01-05 08:21:22','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1352,NULL,'2018-01-05','2018-01-05 08:21:27','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1353,NULL,'2018-01-05','2018-01-05 08:21:49','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1354,NULL,'2018-01-05','2018-01-05 08:22:34','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1355,NULL,'2018-01-05','2018-01-05 08:23:20','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1356,NULL,'2018-01-05','2018-01-05 08:23:41','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1357,NULL,'2018-01-05','2018-01-05 08:24:16','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1358,NULL,'2018-01-05','2018-01-05 08:25:08','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1359,NULL,'2018-01-05','2018-01-05 08:25:19','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1360,NULL,'2018-01-05','2018-01-05 08:26:02','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1361,NULL,'2018-01-05','2018-01-05 08:26:16','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1362,NULL,'2018-01-05','2018-01-05 08:26:19','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1363,NULL,'2018-01-05','2018-01-05 08:26:26','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1364,NULL,'2018-01-05','2018-01-05 08:26:29','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1365,NULL,'2018-01-05','2018-01-05 08:28:17','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1366,NULL,'2018-01-05','2018-01-05 08:29:59','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1367,NULL,'2018-01-05','2018-01-05 08:30:30','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1368,NULL,'2018-01-05','2018-01-05 08:38:01','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1369,NULL,'2018-01-05','2018-01-05 09:03:08','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1370,NULL,'2018-01-05','2018-01-05 15:04:13','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1371,NULL,'2018-01-05','2018-01-05 16:59:23','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1372,NULL,'2018-01-05','2018-01-05 17:00:43','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1373,NULL,'2018-01-05','2018-01-05 17:01:28','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1374,NULL,'2018-01-05','2018-01-05 17:01:31','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1375,NULL,'2018-01-05','2018-01-05 17:03:56','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1376,NULL,'2018-01-05','2018-01-05 17:06:55','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1377,NULL,'2018-01-05','2018-01-05 17:14:17','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1378,NULL,'2018-01-05','2018-01-05 17:17:58','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1379,NULL,'2018-01-05','2018-01-05 17:18:35','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1380,NULL,'2018-01-05','2018-01-05 17:19:18','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1381,NULL,'2018-01-05','2018-01-05 17:32:49','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1382,NULL,'2018-01-05','2018-01-05 17:34:17','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1383,NULL,'2018-01-05','2018-01-05 17:49:46','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1384,NULL,'2018-01-05','2018-01-05 18:00:48','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:47','2018-01-08 13:12:47'),(1385,NULL,'2018-01-05','2018-01-05 18:04:06','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1386,NULL,'2018-01-05','2018-01-05 18:05:35','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1387,NULL,'2018-01-05','2018-01-05 18:18:33','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1388,NULL,'2018-01-05','2018-01-05 18:18:42','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1389,NULL,'2018-01-05','2018-01-05 18:31:58','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1390,NULL,'2018-01-05','2018-01-05 19:04:46','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1391,NULL,'2018-01-05','2018-01-05 21:08:26','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:48','2018-01-08 13:12:48'),(1392,NULL,'2018-01-05','2018-01-05 21:08:41','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1393,NULL,'2018-01-06','2018-01-06 08:08:12','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1394,NULL,'2018-01-06','2018-01-06 08:15:26','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1395,NULL,'2018-01-06','2018-01-06 08:15:33','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1396,NULL,'2018-01-06','2018-01-06 08:16:17','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1397,NULL,'2018-01-06','2018-01-06 08:16:26','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1398,NULL,'2018-01-06','2018-01-06 08:18:01','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1399,NULL,'2018-01-06','2018-01-06 08:18:36','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1400,NULL,'2018-01-06','2018-01-06 08:21:51','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1401,NULL,'2018-01-06','2018-01-06 08:21:58','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1402,NULL,'2018-01-06','2018-01-06 08:22:16','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1403,NULL,'2018-01-06','2018-01-06 08:22:18','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1404,NULL,'2018-01-06','2018-01-06 08:22:55','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1405,NULL,'2018-01-06','2018-01-06 08:24:16','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1406,NULL,'2018-01-06','2018-01-06 08:24:37','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1407,NULL,'2018-01-06','2018-01-06 08:24:43','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1408,NULL,'2018-01-06','2018-01-06 08:24:46','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1409,NULL,'2018-01-06','2018-01-06 08:25:03','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1410,NULL,'2018-01-06','2018-01-06 08:25:10','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1411,NULL,'2018-01-06','2018-01-06 08:27:17','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1412,NULL,'2018-01-06','2018-01-06 08:27:45','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1413,NULL,'2018-01-06','2018-01-06 08:28:29','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1414,NULL,'2018-01-06','2018-01-06 08:56:08','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1415,NULL,'2018-01-06','2018-01-06 12:28:49','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1416,NULL,'2018-01-06','2018-01-06 16:59:24','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1417,NULL,'2018-01-06','2018-01-06 17:00:05','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1418,NULL,'2018-01-06','2018-01-06 17:01:11','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1419,NULL,'2018-01-06','2018-01-06 17:01:26','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1420,NULL,'2018-01-06','2018-01-06 17:01:32','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1421,NULL,'2018-01-06','2018-01-06 17:02:54','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1422,NULL,'2018-01-06','2018-01-06 17:13:35','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1423,NULL,'2018-01-06','2018-01-06 17:13:47','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1424,NULL,'2018-01-06','2018-01-06 17:13:50','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1425,NULL,'2018-01-06','2018-01-06 17:15:13','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1426,NULL,'2018-01-06','2018-01-06 17:34:11','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1427,NULL,'2018-01-06','2018-01-06 17:45:47','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1428,NULL,'2018-01-06','2018-01-06 17:53:15','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1429,NULL,'2018-01-06','2018-01-06 18:08:24','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1430,NULL,'2018-01-06','2018-01-06 18:19:37','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:53','2018-01-08 13:12:53'),(1431,NULL,'2018-01-06','2018-01-06 18:31:31','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1432,NULL,'2018-01-06','2018-01-06 18:36:10','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1433,NULL,'2018-01-06','2018-01-06 19:02:32','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1434,NULL,'2018-01-06','2018-01-06 19:11:38','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1435,NULL,'2018-01-06','2018-01-06 20:11:26','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1436,NULL,'2018-01-06','2018-01-06 20:11:37','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1437,NULL,'2018-01-06','2018-01-06 20:11:38','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1438,NULL,'2018-01-07','2018-01-07 08:13:42','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1439,NULL,'2018-01-07','2018-01-07 08:15:13','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1440,NULL,'2018-01-07','2018-01-07 08:18:47','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1441,NULL,'2018-01-07','2018-01-07 08:19:59','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1442,NULL,'2018-01-07','2018-01-07 08:20:22','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1443,NULL,'2018-01-07','2018-01-07 08:22:53','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1444,NULL,'2018-01-07','2018-01-07 08:23:00','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1445,NULL,'2018-01-07','2018-01-07 08:23:07','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1446,NULL,'2018-01-07','2018-01-07 08:23:10','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1447,NULL,'2018-01-07','2018-01-07 08:23:28','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1448,NULL,'2018-01-07','2018-01-07 08:23:31','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1449,NULL,'2018-01-07','2018-01-07 08:23:36','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1450,NULL,'2018-01-07','2018-01-07 08:24:08','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1451,NULL,'2018-01-07','2018-01-07 08:24:52','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1452,NULL,'2018-01-07','2018-01-07 08:25:41','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1453,NULL,'2018-01-07','2018-01-07 08:25:54','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1454,NULL,'2018-01-07','2018-01-07 08:26:05','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1455,NULL,'2018-01-07','2018-01-07 08:27:29','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1456,NULL,'2018-01-07','2018-01-07 08:46:30','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1457,NULL,'2018-01-07','2018-01-07 09:10:14','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1458,NULL,'2018-01-07','2018-01-07 15:24:53','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1459,NULL,'2018-01-07','2018-01-07 16:58:27','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1460,NULL,'2018-01-07','2018-01-07 16:59:46','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1461,NULL,'2018-01-07','2018-01-07 17:00:05','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1462,NULL,'2018-01-07','2018-01-07 17:00:08','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1463,NULL,'2018-01-07','2018-01-07 17:00:34','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1464,NULL,'2018-01-07','2018-01-07 17:00:39','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1465,NULL,'2018-01-07','2018-01-07 17:00:44','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1466,NULL,'2018-01-07','2018-01-07 17:01:44','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:58','2018-01-08 13:12:58'),(1467,NULL,'2018-01-07','2018-01-07 17:03:13','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1468,NULL,'2018-01-07','2018-01-07 17:03:43','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1469,NULL,'2018-01-07','2018-01-07 17:07:26','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1470,NULL,'2018-01-07','2018-01-07 17:18:47','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1471,NULL,'2018-01-07','2018-01-07 17:21:01','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1472,NULL,'2018-01-07','2018-01-07 17:41:18','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1473,NULL,'2018-01-07','2018-01-07 17:42:43','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1474,NULL,'2018-01-07','2018-01-07 17:52:05','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:12:59','2018-01-08 13:12:59'),(1475,NULL,'2018-01-07','2018-01-07 17:52:12','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1476,NULL,'2018-01-07','2018-01-07 17:54:43','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1477,NULL,'2018-01-07','2018-01-07 19:06:44','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1478,NULL,'2018-01-07','2018-01-07 19:07:12','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1479,NULL,'2018-01-08','2018-01-08 08:14:35','15191',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1480,NULL,'2018-01-08','2018-01-08 08:15:50','10210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1481,NULL,'2018-01-08','2018-01-08 08:17:33','6206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1482,NULL,'2018-01-08','2018-01-08 08:17:39','6203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1483,NULL,'2018-01-08','2018-01-08 08:20:40','7202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1484,NULL,'2018-01-08','2018-01-08 08:21:27','11208',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1485,NULL,'2018-01-08','2018-01-08 08:21:47','5205',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1486,NULL,'2018-01-08','2018-01-08 08:21:52','12105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1487,NULL,'2018-01-08','2018-01-08 08:23:58','10214',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1488,NULL,'2018-01-08','2018-01-08 08:24:38','10109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1489,NULL,'2018-01-08','2018-01-08 08:25:34','15199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1490,NULL,'2018-01-08','2018-01-08 08:25:44','15183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1491,NULL,'2018-01-08','2018-01-08 08:25:49','9107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1492,NULL,'2018-01-08','2018-01-08 08:25:52','11206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1493,NULL,'2018-01-08','2018-01-08 08:26:01','6202',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1494,NULL,'2018-01-08','2018-01-08 08:26:09','8102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1495,NULL,'2018-01-08','2018-01-08 08:26:42','10212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1496,NULL,'2018-01-08','2018-01-08 08:27:58','15197',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1497,NULL,'2018-01-08','2018-01-08 08:28:21','9110',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1498,NULL,'2018-01-08','2018-01-08 08:29:14','10108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1499,NULL,'2018-01-06','2018-01-06 17:05:16','5101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1500,NULL,'2018-01-06','2018-01-06 17:12:37','15105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1501,NULL,'2018-01-06','2018-01-06 17:16:07','101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1502,NULL,'2018-01-06','2018-01-06 17:16:56','15210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1503,NULL,'2018-01-06','2018-01-06 17:18:07','11113',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1504,NULL,'2018-01-06','2018-01-06 17:24:42','7104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1505,NULL,'2018-01-06','2018-01-06 17:27:42','5107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1506,NULL,'2018-01-06','2018-01-06 17:28:24','5203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1507,NULL,'2018-01-06','2018-01-06 17:30:23','7103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1508,NULL,'2018-01-06','2018-01-06 17:39:59','15172',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1509,NULL,'2018-01-06','2018-01-06 17:42:20','15188',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1510,NULL,'2018-01-06','2018-01-06 17:44:11','15209',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1511,NULL,'2018-01-06','2018-01-06 17:45:24','15206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1512,NULL,'2018-01-06','2018-01-06 17:57:17','15189',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1513,NULL,'2018-01-06','2018-01-06 18:01:24','15131',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1514,NULL,'2018-01-06','2018-01-06 18:02:15','10106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1515,NULL,'2018-01-06','2018-01-06 18:06:06','9102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1516,NULL,'2018-01-06','2018-01-06 18:12:05','15132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1517,NULL,'2018-01-06','2018-01-06 18:12:47','8101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1518,NULL,'2018-01-06','2018-01-06 18:13:55','15171',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1519,NULL,'2018-01-06','2018-01-06 18:14:59','14123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1520,NULL,'2018-01-06','2018-01-06 18:17:58','15130',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1521,NULL,'2018-01-06','2018-01-06 18:18:00','15139',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1522,NULL,'2018-01-06','2018-01-06 18:18:40','9103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1523,NULL,'2018-01-06','2018-01-06 18:19:11','11101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1524,NULL,'2018-01-06','2018-01-06 18:20:12','10105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1525,NULL,'2018-01-06','2018-01-06 18:31:26','9105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1526,NULL,'2018-01-06','2018-01-06 18:35:15','12103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1527,NULL,'2018-01-06','2018-01-06 18:43:39','13108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1528,NULL,'2018-01-06','2018-01-06 18:46:14','13106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1529,NULL,'2018-01-06','2018-01-06 18:59:28','15106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1530,NULL,'2018-01-06','2018-01-06 19:06:58','15145',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1531,NULL,'2018-01-06','2018-01-06 19:12:58','15184',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1532,NULL,'2018-01-06','2018-01-06 19:14:26','15144',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1533,NULL,'2018-01-06','2018-01-06 19:18:05','5104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1534,NULL,'2018-01-06','2018-01-06 19:20:17','11115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1535,NULL,'2018-01-06','2018-01-06 19:20:24','15104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1536,NULL,'2018-01-06','2018-01-06 19:28:37','9101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1537,NULL,'2018-01-06','2018-01-06 19:28:48','9109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1538,NULL,'2018-01-06','2018-01-06 19:34:31','2101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1539,NULL,'2018-01-06','2018-01-06 21:02:09','8105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1540,NULL,'2018-01-06','2018-01-06 21:02:15','15192',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1541,NULL,'2018-01-07','2018-01-07 08:17:04','5101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1542,NULL,'2018-01-07','2018-01-07 08:17:18','6204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1543,NULL,'2018-01-07','2018-01-07 10:05:21','13108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1544,NULL,'2018-01-07','2018-01-07 12:42:11','15171',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1545,NULL,'2018-01-07','2018-01-07 15:32:58','13108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1546,NULL,'2018-01-07','2018-01-07 16:44:57','15171',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1547,NULL,'2018-01-08','2018-01-08 08:02:22','7103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1548,NULL,'2018-01-08','2018-01-08 08:07:21','9103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1549,NULL,'2018-01-08','2018-01-08 08:14:36','15184',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1550,NULL,'2018-01-08','2018-01-08 08:15:21','15206',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1551,NULL,'2018-01-08','2018-01-08 08:17:21','5203',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1552,NULL,'2018-01-08','2018-01-08 08:20:43','14121',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1553,NULL,'2018-01-08','2018-01-08 08:20:51','9109',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1554,NULL,'2018-01-08','2018-01-08 08:26:31','15188',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1555,NULL,'2018-01-08','2018-01-08 08:26:40','15210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1556,NULL,'2018-01-08','2018-01-08 08:26:47','15143',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1557,NULL,'2018-01-08','2018-01-08 08:27:24','15137',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1558,NULL,'2018-01-08','2018-01-08 08:27:29','14123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1559,NULL,'2018-01-08','2018-01-08 08:27:36','15139',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1560,NULL,'2018-01-08','2018-01-08 08:27:53','8104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1561,NULL,'2018-01-08','2018-01-08 08:28:16','2101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1562,NULL,'2018-01-08','2018-01-08 08:28:23','15144',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1563,NULL,'2018-01-08','2018-01-08 08:28:35','15122',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1564,NULL,'2018-01-08','2018-01-08 08:28:38','11101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1565,NULL,'2018-01-08','2018-01-08 08:28:42','15172',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1566,NULL,'2018-01-08','2018-01-08 08:28:56','15200',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1567,NULL,'2018-01-08','2018-01-08 08:29:15','15104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1568,NULL,'2018-01-08','2018-01-08 08:29:20','10106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1569,NULL,'2018-01-08','2018-01-08 08:29:24','15131',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1570,NULL,'2018-01-08','2018-01-08 08:29:32','13106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1571,NULL,'2018-01-08','2018-01-08 08:29:47','12103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1572,NULL,'2018-01-08','2018-01-08 08:29:54','15171',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1573,NULL,'2018-01-08','2018-01-08 08:30:01','7104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1574,NULL,'2018-01-08','2018-01-08 08:30:05','15106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1575,NULL,'2018-01-08','2018-01-08 08:30:06','15106',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1576,NULL,'2018-01-08','2018-01-08 08:30:11','15132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1577,NULL,'2018-01-08','2018-01-08 08:30:34','15130',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1578,NULL,'2018-01-08','2018-01-08 08:30:56','15209',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1579,NULL,'2018-01-08','2018-01-08 08:31:05','13108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1580,NULL,'2018-01-08','2018-01-08 08:33:19','8101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(1581,NULL,'2018-01-08','2018-01-08 08:34:19','9102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1582,NULL,'2018-01-08','2018-01-08 08:34:46','5107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1583,NULL,'2018-01-08','2018-01-08 08:34:52','15204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1584,NULL,'2018-01-08','2018-01-08 08:32:20','95102',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1585,NULL,'2018-01-08','2018-01-08 08:32:29','101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1586,NULL,'2018-01-08','2018-01-08 08:32:34','101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1587,NULL,'2018-01-08','2018-01-08 08:34:48','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1588,NULL,'2018-01-08','2018-01-08 08:46:55','9105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(1589,NULL,'2018-01-08','2018-01-08 08:47:20','15192',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1590,NULL,'2018-01-08','2018-01-08 08:47:28','10105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1591,NULL,'2018-01-08','2018-01-08 08:51:07','15105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1592,NULL,'2018-01-08','2018-01-08 09:21:19','11113',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1593,NULL,'2018-01-08','2018-01-08 08:40:07','15181',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1594,NULL,'2018-01-08','2018-01-08 08:43:04','10107',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1595,NULL,'2018-01-08','2018-01-08 09:28:55','8105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1596,NULL,'2018-01-08','2018-01-08 09:04:21','5104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1597,NULL,'2018-01-08','2018-01-08 09:04:48','8103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(1598,NULL,'2018-01-08','2018-01-08 09:04:49','8103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:16','2018-01-08 13:13:16'),(1599,NULL,'2018-01-08','2018-01-08 09:15:35','15145',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:16','2018-01-08 13:13:16'),(1600,NULL,'2018-01-08','2018-01-08 09:19:05','12104',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 13:13:16','2018-01-08 13:13:16'),(1601,NULL,'2018-01-08','2018-01-08 13:36:07','5108',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-08 14:18:44','2018-01-08 14:18:44');
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
INSERT INTO `degree_streams` VALUES (1,'QS_1001','Aerospace','Aerospace',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(2,'QS_1002','Archaeology','Archaeology',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(3,'QS_1003','Asian language and culture','Asian language and culture',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(4,'QS_1004','Automotive ','Automotive ',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(5,'QS_1005','Chemical','Chemical',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(6,'QS_1006','Civil','Civil',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(7,'QS_1007','Commerce','Commerce',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(8,'QS_1008','Computer Application','Computer Application',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(9,'QS_1009','Computer Architecture','Computer Architecture',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(10,'QS_1010','Computer Science','Computer Science',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(11,'QS_1011','Creative Writing','Creative Writing',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(12,'QS_1012','Electrical','Electrical',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(13,'QS_1013','Electrical & Electronics','Electrical & Electronics',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(14,'QS_1014','Human Resource','Human Resource',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(15,'QS_1015','Information Technology  ','Information Technology  ',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(16,'QS_1016','Marine','Marine',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(17,'QS_1017','Mathematics','Mathematics',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(18,'QS_1018','Mechanical','Mechanical',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(19,'QS_1019','Philosophy','Philosophy',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(20,'QS_1020','Psychology','Psychology',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(21,'QS_1021','Robotics','Robotics',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(22,'QS_1022','Safety','Safety',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(23,'QS_1023','Science','Science',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(24,'QS_1024','Textile','Textile',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39'),(25,'QS_1025','Theater: Design & Production','Theater: Design & Production',NULL,'2018-01-03 13:11:39','2018-01-03 13:11:39');
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
INSERT INTO `degree_types` VALUES (1,'QL_1001','High School ','Between 10th Grade and 12th Grade',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(2,'QL_1002','Senior Secondary','12th Grade passed',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(3,'QL_1003','Diploma','Diploma programme',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(4,'QL_1004','Under Graduate','Pursuing graduation',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(5,'QL_1005','Graduate','Graduated',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(6,'QL_1006','Under Post Graduate','Pursuing post graduation',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38'),(7,'QL_1007','Post Graduate','Graduated',NULL,'2018-01-03 13:11:38','2018-01-03 13:11:38');
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
INSERT INTO `degrees` VALUES (1,'QUALIFICTATION_1001','BCA ','Bachelor of Computer Application',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(2,'QUALIFICTATION_1002','BBA','Bachelor of Business Administration',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(3,'QUALIFICTATION_1003','B.Com ','Bachelor of Commerce   ',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(4,'QUALIFICTATION_1004',' B.Sc. ','Bachelor of Science ',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(5,'QUALIFICTATION_1005','BA','Bachelor  of Arts  ',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(6,'QUALIFICTATION_1006','BE','Bachelor of Engineering   ',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(7,'QUALIFICTATION_1007','B.Tech','Bachelor of Technology',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(8,'QUALIFICTATION_1008','DCA','Diploma in Computer Application',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(9,'QUALIFICTATION_1009','ITI','Industrial Training Institute',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(10,'QUALIFICTATION_1010','BSW','Bachelor  of Social Work',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(11,'QUALIFICTATION_1011','Polytechnic','Polytechnic',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(12,'QUALIFICTATION_1012','LL.B','Bachelor of Laws',NULL,'2018-01-03 13:11:35','2018-01-03 13:11:35'),(13,'QUALIFICTATION_1013','BCM','Bachelor of computer management',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(14,'QUALIFICTATION_1014','BFA','Bachelor  of Fine Arts ',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(15,'QUALIFICTATION_1015','BMS','Bachelor  of Management Study',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(16,'QUALIFICTATION_1016','BCS','Bachelor  of Computer Science',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(17,'QUALIFICTATION_1017','BBM','Bachelor  of Business Management',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(18,'QUALIFICTATION_1018','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(19,'QUALIFICTATION_1019','BHM','Bachelor  of Hotel Management',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(20,'QUALIFICTATION_1020','B.Pharma','Bachelor of Pharmacy',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(21,'QUALIFICTATION_1021','BS','Bachelor of Science',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(22,'QUALIFICTATION_1022','CS','Company Secretary',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(23,'QUALIFICTATION_1023','CA','Chartered Accountant',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(24,'QUALIFICTATION_1024','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(25,'QUALIFICTATION_1025','MCA','Master of Computer Application',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(26,'QUALIFICTATION_1026','MBA','Master of Business Administration',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(27,'QUALIFICTATION_1027','M.Com','Master of Commerce',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(28,'QUALIFICTATION_1028','M.Sc.','Master of Science',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(29,'QUALIFICTATION_1029','MA','Master of Arts',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(30,'QUALIFICTATION_1030','ME','Master of Engineering',NULL,'2018-01-03 13:11:36','2018-01-03 13:11:36'),(31,'QUALIFICTATION_1031','M.Tech','Master of Technology ',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(32,'QUALIFICTATION_1032','PGDCA','Post Graduate Diploma in Computer Application',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(33,'QUALIFICTATION_1033','MSW','Master of Social Work ',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(34,'QUALIFICTATION_1034','LL.M ','Master of Laws',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(35,'QUALIFICTATION_1035','MCM','Master of Computer Management',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(36,'QUALIFICTATION_1036','MFA','Master of Fine Arts ',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(37,'QUALIFICTATION_1037','MMS','Master of Management Studies',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(38,'QUALIFICTATION_1038','MCS','Master of Computer Science',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(39,'QUALIFICTATION_1039','MBM','Master in Business Management',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(40,'QUALIFICTATION_1040','MJMC','Master of Journalism and Mass Communication',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(41,'QUALIFICTATION_1041','MHM','Master in Hotel Management ',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(42,'QUALIFICTATION_1042','M.Pharma','Master of Pharmacy',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(43,'QUALIFICTATION_1043','MS','Master of Science',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37'),(44,'QUALIFICTATION_1044','MD','Medicine Doctor ',NULL,'2018-01-03 13:11:37','2018-01-03 13:11:37');
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
INSERT INTO `department_types` VALUES (1,'DT_1001','Executive','Executive Department',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(2,'DT_1002','Operations','Operations Department',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(3,'DT_1003','Corporate','Corporate Department',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,NULL,'DEPT001',NULL,'Sales',NULL,NULL,NULL,'2018-01-03 14:23:16','2018-01-03 14:23:16'),(2,1,NULL,'DEPT002',NULL,'Project',NULL,NULL,NULL,'2018-01-03 14:23:17','2018-01-03 14:23:17'),(3,1,NULL,'DEPT003',NULL,'Service',NULL,NULL,NULL,'2018-01-03 14:23:17','2018-01-03 14:23:17'),(4,1,NULL,'DEPT004',NULL,'IT',NULL,NULL,NULL,'2018-01-03 14:23:17','2018-01-03 14:23:17'),(5,1,NULL,'DEPT005',NULL,'Commercial',NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-03 14:23:18'),(6,1,NULL,'DEPT006',NULL,'Finance',NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-03 14:23:18'),(7,1,NULL,'DEPT007',NULL,'Design',NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-03 14:23:18'),(8,1,NULL,'DEPT008',NULL,'Quality',NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-03 14:23:19'),(9,1,NULL,'DEPT009',NULL,'HR & Admin',NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-03 14:23:19'),(10,1,NULL,'DEPT010',NULL,'Manufacturing',NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-03 14:23:20'),(11,1,NULL,'DEPT011',NULL,'SCM',NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-03 14:23:20'),(12,1,NULL,'DEPT012',NULL,'I & C',NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-03 14:23:21'),(13,1,NULL,'DEPT013',NULL,'Director',NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-03 14:23:31'),(14,1,NULL,'DEPT014',NULL,'Safety',NULL,NULL,NULL,'2018-01-03 14:23:33','2018-01-03 14:23:33'),(15,1,NULL,'DEPT015',NULL,'Farm Division',NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-03 16:26:57'),(16,1,NULL,'DEPT016',NULL,'Component',NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-03 16:26:57'),(17,2,'101','DEPT017','Stores,Purchase,Logistics','SCM',2,'',NULL,'2018-01-08 14:31:06','2018-01-08 14:31:06'),(18,2,'102','DEPT018','','Projects',1,'',NULL,'2018-01-08 14:32:00','2018-01-08 14:32:00'),(19,2,'103','DEPT019','','Sales ',1,'',NULL,'2018-01-08 14:32:13','2018-01-08 14:32:13'),(20,2,'104','DEPT020','','Manufacturing',2,'',NULL,'2018-01-08 14:32:46','2018-01-08 14:32:46'),(21,2,'105','DEPT021','','HR & Admin',1,'',NULL,'2018-01-08 14:33:35','2018-01-08 14:33:35'),(22,2,'106','DEPT022','','Quality',2,'',NULL,'2018-01-08 14:34:04','2018-01-08 14:34:04'),(23,3,'107','DEPT023','','Sales',1,'',NULL,'2018-01-08 14:34:15','2018-01-08 14:34:15'),(24,3,'108','DEPT024','','I & C',2,'',NULL,'2018-01-08 14:34:59','2018-01-08 14:34:59'),(25,4,'109','DEPT025','','Finance',1,'',NULL,'2018-01-08 14:35:28','2018-01-08 14:35:28'),(26,4,'110','DEPT026','','I & C',2,'',NULL,'2018-01-08 14:35:49','2018-01-08 14:35:49'),(27,4,'111','DEPT027','','Service',1,'',NULL,'2018-01-08 14:36:17','2018-01-08 14:36:17'),(28,5,'112','DEPT028','TRIDA','Service',1,'',NULL,'2018-01-08 14:37:29','2018-01-08 14:37:29'),(29,5,'113','DEPT029','','Projects',1,'',NULL,'2018-01-08 14:37:53','2018-01-08 14:37:53'),(30,5,'114','DEPT030','','Sales',1,'',NULL,'2018-01-08 14:38:04','2018-01-08 14:38:04'),(31,6,'115','DEPT031','TRIDA','Service',1,'',NULL,'2018-01-08 14:51:10','2018-01-08 14:51:10'),(32,6,'116','DEPT032','','I & C',2,'',NULL,'2018-01-08 14:51:24','2018-01-08 14:51:24'),(33,6,'117','DEPT033','','Sales',1,'',NULL,'2018-01-08 14:52:02','2018-01-08 14:52:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'Pune','2018-01-03 13:13:30','2018-01-03 13:13:30'),(2,2,NULL,'punjab','2018-01-03 14:23:17','2018-01-03 14:23:17'),(3,3,NULL,'EAST SINGHBHUM','2018-01-03 14:23:18','2018-01-03 14:23:18'),(4,4,NULL,'Vizag','2018-01-03 14:23:19','2018-01-03 14:23:19'),(5,5,NULL,'Thiruvallur','2018-01-03 14:23:22','2018-01-03 14:23:22'),(6,6,NULL,'Uttrakhand','2018-01-03 14:23:22','2018-01-03 14:23:22'),(7,7,NULL,'Palwal','2018-01-03 14:23:22','2018-01-03 14:23:22'),(8,5,NULL,'Pudukottai','2018-01-03 14:23:23','2018-01-03 14:23:23'),(9,8,NULL,'Allahabad','2018-01-03 14:23:23','2018-01-03 14:23:23'),(10,5,NULL,'KANYAKUMARI','2018-01-03 14:23:24','2018-01-03 14:23:24'),(11,8,NULL,'Azamgarh','2018-01-03 14:23:25','2018-01-03 14:23:25'),(12,5,NULL,'Chennai','2018-01-03 14:23:25','2018-01-03 14:23:25'),(13,9,NULL,'Banglore','2018-01-03 14:23:26','2018-01-03 14:23:26'),(14,5,NULL,'THIRUVANNAMALAI','2018-01-03 14:23:27','2018-01-03 14:23:27'),(15,5,NULL,'Pondicherry','2018-01-03 14:23:28','2018-01-03 14:23:28'),(16,5,NULL,'Thiruvarur','2018-01-03 14:23:28','2018-01-03 14:23:28'),(17,4,NULL,'Andhra Pradesh','2018-01-03 14:23:29','2018-01-03 14:23:29'),(18,8,NULL,'Ghaziabad','2018-01-03 14:23:31','2018-01-03 14:23:31'),(19,7,NULL,'Faridabad','2018-01-03 14:23:32','2018-01-03 14:23:32'),(20,11,NULL,'katni','2018-01-03 14:23:32','2018-01-03 14:23:32'),(21,5,NULL,'Ramanadhapuram','2018-01-03 14:23:33','2018-01-03 14:23:33'),(22,12,'11','Vadodara','2018-01-08 14:44:09','2018-01-08 14:44:09');
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
  CONSTRAINT `fk_rails_beeb90dcd2` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
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
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_due_employee_details_on_employee_id` (`employee_id`),
  KEY `index_due_employee_details_on_due_template_id` (`due_template_id`),
  KEY `index_due_employee_details_on_due_employee_template_id` (`due_employee_template_id`),
  KEY `index_due_employee_details_on_due_detail_id` (`due_detail_id`),
  CONSTRAINT `fk_rails_7abe24328a` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
  CONSTRAINT `fk_rails_83dea4b3e1` FOREIGN KEY (`due_detail_id`) REFERENCES `due_details` (`id`),
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
  `holiday_id` int(11) DEFAULT NULL,
  `employee_week_off_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_cccb9f7b46` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`),
  CONSTRAINT `fk_rails_dd1af2be7a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_e1778f034d` FOREIGN KEY (`machine_attendance_id`) REFERENCES `machine_attendances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (1759,24,'2017-12-31','HD','2017-12-31 17:03:43',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1760,94,'2017-12-31','HD','2017-12-31 17:04:14',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1761,45,'2017-12-31','HD','2017-12-31 17:04:30',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1762,55,'2017-12-31','HD','2017-12-31 17:05:00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1763,20,'2017-12-31','HD','2017-12-31 17:05:42',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1764,17,'2017-12-31','HD','2017-12-31 17:06:35',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:23','2018-01-08 13:12:23'),(1765,63,'2017-12-31','HD','2017-12-31 17:07:32',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1766,109,'2017-12-31','HD','2017-12-31 17:07:38',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1767,68,'2017-12-31','HD','2017-12-31 17:08:32',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1768,31,'2017-12-31','HD','2017-12-31 17:08:39',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1769,86,'2017-12-31','HD','2017-12-31 17:08:50',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1770,117,'2017-12-31','HD','2017-12-31 17:09:33',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:24','2018-01-08 13:12:24'),(1771,111,'2017-12-31','HD','2017-12-31 17:10:32',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1772,83,'2017-12-31','HD','2017-12-31 17:11:05',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1773,40,'2017-12-31','HD','2017-12-31 18:01:04',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1774,12,'2017-12-31','HD','2017-12-31 18:17:53',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1775,76,'2017-12-31','HD','2017-12-31 18:18:04',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1776,83,'2018-01-01','P','2018-01-01 08:15:18','2018-01-01 18:15:45',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:00',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:25','2018-01-08 13:12:25'),(1777,85,'2018-01-01','P','2018-01-01 08:16:53','2018-01-01 17:18:12',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:01',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1778,12,'2018-01-01','HD','2018-01-01 08:22:30',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1779,31,'2018-01-01','P','2018-01-01 08:22:42','2018-01-01 17:14:28',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:51',NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1780,76,'2018-01-01','P','2018-01-01 08:22:48','2018-01-01 17:49:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:26',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1781,68,'2018-01-01','P','2018-01-01 08:22:56','2018-01-01 17:57:17',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:34',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1782,17,'2018-01-01','P','2018-01-01 08:23:32','2018-01-01 17:08:16',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:44',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:26','2018-01-08 13:12:26'),(1783,45,'2018-01-01','P','2018-01-01 08:24:28','2018-01-01 17:07:01',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:42',NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1784,111,'2018-01-01','P','2018-01-01 08:25:47','2018-01-01 17:19:29',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:53',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1785,63,'2018-01-01','P','2018-01-01 08:27:19','2018-01-01 18:15:14',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:47',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1786,20,'2018-01-01','P','2018-01-01 08:27:35','2018-01-01 17:45:38',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:18',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1787,94,'2018-01-01','P','2018-01-01 08:27:51','2018-01-01 17:04:01',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:36',NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1788,109,'2018-01-01','P','2018-01-01 08:28:00','2018-01-01 17:52:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:24',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1789,23,'2018-01-01','P','2018-01-01 08:28:41','2018-01-01 17:30:36',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:01',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:27','2018-01-08 13:12:27'),(1790,24,'2018-01-01','P','2018-01-01 08:30:25','2018-01-01 17:04:08',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:33',NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1791,55,'2018-01-01','P','2018-01-01 08:30:31','2018-01-01 17:03:59',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:33',NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1792,46,'2018-01-01','P','2018-01-01 08:30:51','2018-01-01 17:20:44',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:49',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1793,40,'2018-01-01','P','2018-01-01 08:30:55','2018-01-01 19:36:50',NULL,0,NULL,NULL,NULL,NULL,NULL,'11:05',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1794,117,'2018-01-01','P','2018-01-01 08:31:06','2018-01-01 19:18:58',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:47',NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1795,86,'2018-01-01','P','2018-01-01 09:29:49','2018-01-01 17:59:13',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:29',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:28','2018-01-08 13:12:28'),(1796,85,'2018-01-02','P','2018-01-02 08:20:05','2018-01-02 17:00:27',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:40',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1797,83,'2018-01-02','P','2018-01-02 08:22:05','2018-01-02 17:10:16',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:48',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1798,80,'2018-01-02','HD','2018-01-02 08:22:16',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1799,76,'2018-01-02','P','2018-01-02 08:22:50','2018-01-02 17:29:34',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:06',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1800,63,'2018-01-02','P','2018-01-02 08:23:40','2018-01-02 17:22:08',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:58',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:31','2018-01-08 13:12:31'),(1801,45,'2018-01-02','HD','2018-01-02 08:25:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1802,94,'2018-01-02','HD','2018-01-02 08:25:40',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1803,17,'2018-01-02','P','2018-01-02 08:26:14','2018-01-02 17:01:45',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1804,111,'2018-01-02','P','2018-01-02 08:26:20','2018-01-02 17:23:07',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:56',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1805,31,'2018-01-02','P','2018-01-02 08:26:59','2018-01-02 16:00:42',NULL,0,NULL,NULL,NULL,NULL,NULL,'07:33',NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1806,68,'2018-01-02','P','2018-01-02 08:27:42','2018-01-02 17:10:10',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:42',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1807,109,'2018-01-02','P','2018-01-02 08:27:46','2018-01-02 17:14:32',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:46',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:32','2018-01-08 13:12:32'),(1808,46,'2018-01-02','P','2018-01-02 08:28:23','2018-01-02 17:06:20',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:37',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1809,91,'2018-01-02','P','2018-01-02 08:28:38','2018-01-02 17:00:53',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:32',NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1810,20,'2018-01-02','P','2018-01-02 08:30:24','2018-01-02 17:00:18',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:29',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1811,86,'2018-01-02','P','2018-01-02 08:30:56','2018-01-02 17:10:18',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:39',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1812,40,'2018-01-02','P','2018-01-02 08:31:17','2018-01-02 19:26:46',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:55',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1813,23,'2018-01-02','P','2018-01-02 08:32:00','2018-01-02 17:19:09',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:47',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:33','2018-01-08 13:12:33'),(1814,117,'2018-01-02','P','2018-01-02 08:35:33','2018-01-02 18:14:34',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:39',NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:34','2018-01-08 13:12:34'),(1815,83,'2018-01-03','P','2018-01-03 08:04:13','2018-01-03 18:18:14',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:14',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1816,111,'2018-01-03','P','2018-01-03 08:11:34','2018-01-03 17:20:48',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:09',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1817,85,'2018-01-03','P','2018-01-03 08:15:26','2018-01-03 17:01:29',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:46',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1818,45,'2018-01-03','P','2018-01-03 08:20:05','2018-01-03 17:00:27',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:40',NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:36','2018-01-08 13:12:36'),(1819,76,'2018-01-03','P','2018-01-03 08:20:15','2018-01-03 18:18:11',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:57',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1820,17,'2018-01-03','P','2018-01-03 08:20:59','2018-01-03 16:59:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:38',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1821,63,'2018-01-03','P','2018-01-03 08:21:05','2018-01-03 18:18:02',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:56',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1822,117,'2018-01-03','P','2018-01-03 08:22:27','2018-01-03 20:18:52',NULL,0,NULL,NULL,NULL,NULL,NULL,'11:56',NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1823,94,'2018-01-03','P','2018-01-03 08:22:30','2018-01-03 16:57:38',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1824,46,'2018-01-03','P','2018-01-03 08:23:48','2018-01-03 17:04:35',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:40',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1825,109,'2018-01-03','P','2018-01-03 08:23:57','2018-01-03 17:17:18',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:53',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1826,86,'2018-01-03','P','2018-01-03 08:24:04','2018-01-03 18:16:28',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:52',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:37','2018-01-08 13:12:37'),(1827,80,'2018-01-03','P','2018-01-03 08:24:14','2018-01-03 17:38:10',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:13',NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1828,55,'2018-01-03','P','2018-01-03 08:24:50','2018-01-03 17:00:14',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1829,91,'2018-01-03','P','2018-01-03 08:24:55','2018-01-03 17:02:10',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:37',NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1830,20,'2018-01-03','HD','2018-01-03 08:25:14','2018-01-03 12:27:51',NULL,0,NULL,NULL,NULL,NULL,NULL,'04:02',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1831,23,'2018-01-03','P','2018-01-03 08:26:46','2018-01-03 18:12:15',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:45',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1832,40,'2018-01-03','P','2018-01-03 08:27:36','2018-01-03 20:20:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'11:53',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1833,68,'2018-01-03','P','2018-01-03 08:36:31','2018-01-03 17:18:32',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:42',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1834,106,'2018-01-03','P','2018-01-03 09:13:27','2018-01-03 17:38:40',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:25',NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:12:38','2018-01-08 13:12:38'),(1835,24,'2018-01-03','HD','2018-01-03 16:57:45',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:39','2018-01-08 13:12:39'),(1836,20,'2018-01-04','HD','2018-01-04 08:21:13','2018-01-04 12:22:03',NULL,0,NULL,NULL,NULL,NULL,NULL,'04:00',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1837,117,'2018-01-04','P','2018-01-04 08:29:14','2018-01-04 18:15:06',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:45',NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1838,86,'2018-01-04','P','2018-01-04 08:29:28','2018-01-04 16:57:20',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:27',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:41','2018-01-08 13:12:41'),(1839,76,'2018-01-04','P','2018-01-04 08:40:58','2018-01-04 17:00:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:19',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1840,12,'2018-01-04','P','2018-01-04 08:41:05','2018-01-04 17:00:21',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:19',NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1841,80,'2018-01-04','HD','2018-01-04 09:02:42','2018-01-04 12:21:49',NULL,0,NULL,NULL,NULL,NULL,NULL,'03:19',NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1842,106,'2018-01-04','P','2018-01-04 09:15:07','2018-01-04 17:39:27',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:24',NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:12:42','2018-01-08 13:12:42'),(1843,17,'2018-01-05','P','2018-01-05 08:16:30','2018-01-05 17:00:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:44',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1844,76,'2018-01-05','P','2018-01-05 08:18:25','2018-01-05 18:18:33',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:00',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1845,83,'2018-01-05','P','2018-01-05 08:18:39','2018-01-05 18:04:06',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:45',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1846,24,'2018-01-05','P','2018-01-05 08:20:51','2018-01-05 16:59:23',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:38',NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1847,85,'2018-01-05','P','2018-01-05 08:21:22','2018-01-05 17:19:18',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:57',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:43','2018-01-08 13:12:43'),(1848,94,'2018-01-05','P','2018-01-05 08:21:27','2018-01-05 17:01:31',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:40',NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1849,45,'2018-01-05','P','2018-01-05 08:21:49','2018-01-05 17:01:28',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:39',NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1850,91,'2018-01-05','P','2018-01-05 08:22:34','2018-01-05 17:14:17',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:51',NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1851,63,'2018-01-05','P','2018-01-05 08:23:20','2018-01-05 18:00:48',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:37',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1852,20,'2018-01-05','P','2018-01-05 08:23:41','2018-01-05 17:32:49',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:09',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1853,109,'2018-01-05','P','2018-01-05 08:24:16','2018-01-05 18:31:58',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:07',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1854,31,'2018-01-05','P','2018-01-05 08:25:08','2018-01-05 17:03:56',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:38',NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1855,117,'2018-01-05','P','2018-01-05 08:25:19','2018-01-05 21:08:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'12:43',NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:44','2018-01-08 13:12:44'),(1856,12,'2018-01-05','P','2018-01-05 08:26:02','2018-01-05 18:18:42',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:52',NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1857,106,'2018-01-05','HD','2018-01-05 08:26:16','2018-01-05 15:04:13',NULL,0,NULL,NULL,NULL,NULL,NULL,'06:37',NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1858,111,'2018-01-05','P','2018-01-05 08:26:19','2018-01-05 17:49:46',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:23',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1859,23,'2018-01-05','P','2018-01-05 08:26:26','2018-01-05 18:05:35',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:39',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1860,46,'2018-01-05','P','2018-01-05 08:26:29','2018-01-05 17:17:58',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:51',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1861,86,'2018-01-05','P','2018-01-05 08:28:17','2018-01-05 19:04:46',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:36',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1862,40,'2018-01-05','P','2018-01-05 08:29:59','2018-01-05 21:08:41',NULL,0,NULL,NULL,NULL,NULL,NULL,'12:38',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1863,55,'2018-01-05','P','2018-01-05 08:30:30','2018-01-05 17:06:55',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:36',NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1864,68,'2018-01-05','P','2018-01-05 08:38:01','2018-01-05 17:34:17',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:56',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:45','2018-01-08 13:12:45'),(1865,80,'2018-01-05','P','2018-01-05 09:03:08','2018-01-05 17:18:35',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:15',NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:46','2018-01-08 13:12:46'),(1866,83,'2018-01-06','P','2018-01-06 08:08:12','2018-01-06 17:53:15',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:45',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1867,31,'2018-01-06','P','2018-01-06 08:15:26','2018-01-06 17:13:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:58',NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1868,76,'2018-01-06','P','2018-01-06 08:15:33','2018-01-06 20:11:37',NULL,0,NULL,NULL,NULL,NULL,NULL,'11:56',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1869,111,'2018-01-06','P','2018-01-06 08:16:17','2018-01-06 19:11:38',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:55',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1870,85,'2018-01-06','P','2018-01-06 08:16:26','2018-01-06 17:13:50',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:57',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:49','2018-01-08 13:12:49'),(1871,94,'2018-01-06','P','2018-01-06 08:18:01','2018-01-06 17:01:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:43',NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1872,63,'2018-01-06','P','2018-01-06 08:18:36','2018-01-06 18:19:37',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:01',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1873,45,'2018-01-06','P','2018-01-06 08:21:51','2018-01-06 17:01:32',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:39',NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1874,86,'2018-01-06','P','2018-01-06 08:21:58','2018-01-06 19:02:32',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:40',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1875,17,'2018-01-06','P','2018-01-06 08:22:16','2018-01-06 17:02:54',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:40',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1876,68,'2018-01-06','P','2018-01-06 08:22:18','2018-01-06 18:36:10',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:13',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1877,91,'2018-01-06','P','2018-01-06 08:22:55','2018-01-06 17:13:35',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:50',NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1878,20,'2018-01-06','P','2018-01-06 08:24:16','2018-01-06 16:59:24',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:50','2018-01-08 13:12:50'),(1879,24,'2018-01-06','P','2018-01-06 08:24:37','2018-01-06 17:00:05',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1880,80,'2018-01-06','P','2018-01-06 08:24:43','2018-01-06 18:08:24',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:43',NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1881,109,'2018-01-06','P','2018-01-06 08:24:46','2018-01-06 17:45:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:21',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1882,40,'2018-01-06','P','2018-01-06 08:25:03','2018-01-06 20:11:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'11:46',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1883,12,'2018-01-06','HD','2018-01-06 08:25:10','2018-01-06 12:28:49',NULL,0,NULL,NULL,NULL,NULL,NULL,'04:03',NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1884,46,'2018-01-06','P','2018-01-06 08:27:17','2018-01-06 17:34:11',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:06',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1885,55,'2018-01-06','P','2018-01-06 08:27:45','2018-01-06 17:01:11',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:33',NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:51','2018-01-08 13:12:51'),(1886,23,'2018-01-06','P','2018-01-06 08:28:29','2018-01-06 18:31:31',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:03',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1887,106,'2018-01-06','P','2018-01-06 08:56:08','2018-01-06 17:15:13',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:19',NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:12:52','2018-01-08 13:12:52'),(1888,117,'2018-01-06','HD','2018-01-06 20:11:38',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:12:54','2018-01-08 13:12:54'),(1889,83,'2018-01-07','P','2018-01-07 08:13:42','2018-01-07 17:21:01',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:07',NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1890,85,'2018-01-07','P','2018-01-07 08:15:13','2018-01-07 17:03:13',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:48',NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1891,76,'2018-01-07','P','2018-01-07 08:18:47','2018-01-07 17:54:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:35',NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1892,17,'2018-01-07','P','2018-01-07 08:19:59','2018-01-07 17:01:44',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:41',NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1893,106,'2018-01-07','P','2018-01-07 08:20:22','2018-01-07 17:42:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:22',NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1894,55,'2018-01-07','P','2018-01-07 08:22:53','2018-01-07 17:00:44',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:37',NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1895,24,'2018-01-07','P','2018-01-07 08:23:00','2018-01-07 17:00:39',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:37',NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1896,63,'2018-01-07','P','2018-01-07 08:23:07','2018-01-07 17:52:05',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:28',NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:12:55','2018-01-08 13:12:55'),(1897,12,'2018-01-07','P','2018-01-07 08:23:10','2018-01-07 17:52:12',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:29',NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1898,31,'2018-01-07','P','2018-01-07 08:23:28','2018-01-07 17:00:08',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:36',NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1899,109,'2018-01-07','P','2018-01-07 08:23:31','2018-01-07 17:18:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:55',NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1900,46,'2018-01-07','P','2018-01-07 08:23:36','2018-01-07 16:58:27',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:34',NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1901,91,'2018-01-07','P','2018-01-07 08:24:08','2018-01-07 17:03:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:39',NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1902,80,'2018-01-07','P','2018-01-07 08:24:52','2018-01-07 17:00:34',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:35',NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1903,111,'2018-01-07','P','2018-01-07 08:25:41','2018-01-07 19:07:12',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:41',NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1904,20,'2018-01-07','P','2018-01-07 08:25:54','2018-01-07 16:59:46',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:33',NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:12:56','2018-01-08 13:12:56'),(1905,68,'2018-01-07','P','2018-01-07 08:26:05','2018-01-07 17:07:26',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:41',NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1906,40,'2018-01-07','P','2018-01-07 08:27:29','2018-01-07 17:41:18',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:13',NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1907,23,'2018-01-07','HD','2018-01-07 08:46:30','2018-01-07 15:24:53',NULL,0,NULL,NULL,NULL,NULL,NULL,'06:38',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1908,86,'2018-01-07','P','2018-01-07 09:10:14','2018-01-07 19:06:44',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:56',NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:12:57','2018-01-08 13:12:57'),(1909,83,'2018-01-08','HD','2018-01-08 08:14:35',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15191,'RAHUL RAYKAR',NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1910,94,'2018-01-08','HD','2018-01-08 08:15:50',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10210,'SANTOSH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:13:00','2018-01-08 13:13:00'),(1911,85,'2018-01-08','HD','2018-01-08 08:17:33',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',6206,'RAJU SABLE',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1912,17,'2018-01-08','HD','2018-01-08 08:17:39',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',6203,'ASHOK KADAM',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1913,45,'2018-01-08','HD','2018-01-08 08:20:40',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7202,'GORAKSHNATH DHAGE',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1914,111,'2018-01-08','HD','2018-01-08 08:21:27',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11208,'VAIBHAV BONDRE',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1915,24,'2018-01-08','HD','2018-01-08 08:21:47',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5205,'BALASAHEB PAVALE',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1916,63,'2018-01-08','HD','2018-01-08 08:21:52',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',12105,'NARENDRA MANGAVE',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1917,31,'2018-01-08','HD','2018-01-08 08:23:58',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10214,'DHARMARAJ PAWAR',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1918,109,'2018-01-08','HD','2018-01-08 08:24:38',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10109,'TATYABHAU GUND',NULL,NULL,NULL,'2018-01-08 13:13:01','2018-01-08 13:13:01'),(1919,76,'2018-01-08','HD','2018-01-08 08:25:34',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15199,'PRAMOD PATIL',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1920,86,'2018-01-08','HD','2018-01-08 08:25:44',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15183,'ROSHAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1921,117,'2018-01-08','HD','2018-01-08 08:25:49',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9107,'VINAYAK KAKADE',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1922,20,'2018-01-08','HD','2018-01-08 08:25:52',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11206,'BABAN BIRADAR',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1923,46,'2018-01-08','HD','2018-01-08 08:26:01',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',6202,'HARIRAM BOBADE',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1924,80,'2018-01-08','HD','2018-01-08 08:26:09',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8102,'PRAVIN JAGTAP',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1925,68,'2018-01-08','HD','2018-01-08 08:26:42',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10212,'NITIN SHITOLE',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1926,106,'2018-01-08','HD','2018-01-08 08:27:58',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15197,'SURAJ SALUNKHE',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1927,40,'2018-01-08','HD','2018-01-08 08:28:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9110,'GANESH DHAMAL',NULL,NULL,NULL,'2018-01-08 13:13:02','2018-01-08 13:13:02'),(1928,55,'2018-01-08','HD','2018-01-08 08:29:14',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10108,'KEDAR CHANDRAJENA',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1929,121,'2018-01-06','HD','2018-01-06 17:05:16',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5101,'VISHNU BHAGWAT',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1930,64,'2018-01-06','HD','2018-01-06 17:12:37',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15105,'NEHA TANK',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1931,74,'2018-01-06','HD','2018-01-06 17:16:07',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',101,'PRADNYA THIPASE',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1932,136,'2018-01-06','HD','2018-01-06 17:16:56',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15210,'ANUJA PATIL',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1933,120,'2018-01-06','HD','2018-01-06 17:18:07',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11113,'VISHAL NIMAVAT',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1934,95,'2018-01-06','HD','2018-01-06 17:24:42',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7104,'SAROJ PATIL',NULL,NULL,NULL,'2018-01-08 13:13:03','2018-01-08 13:13:03'),(1935,60,'2018-01-06','HD','2018-01-06 17:27:42',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5107,'MADHUKAR SHEDGE',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1936,29,'2018-01-06','HD','2018-01-06 17:28:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5203,'DASHARATH LOANKAR',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1937,32,'2018-01-06','HD','2018-01-06 17:30:23',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7103,'DILIP LOHAR',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1938,18,'2018-01-06','HD','2018-01-06 17:39:59',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15172,'ASHVINI NALAWADE',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1939,92,'2018-01-06','HD','2018-01-06 17:42:20',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15188,'SANKALP SARNOBAT',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1940,135,'2018-01-06','HD','2018-01-06 17:44:11',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15209,'MILIND KOTKAR',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1941,132,'2018-01-06','HD','2018-01-06 17:45:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15206,'VINODAKUMAR',NULL,NULL,NULL,'2018-01-08 13:13:04','2018-01-08 13:13:04'),(1942,104,'2018-01-06','HD','2018-01-06 17:57:17',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15189,'SUMOG PATIL',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1943,59,'2018-01-06','HD','2018-01-06 18:01:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15131,'KUSHAL JAIN',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1944,30,'2018-01-06','HD','2018-01-06 18:02:15',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10106,'DATTA BIRAMANE',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1945,15,'2018-01-06','HD','2018-01-06 18:06:06',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9102,'ANKUSH VEDPATHAK',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1946,25,'2018-01-06','HD','2018-01-06 18:12:05',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15132,'BHAVESH SHIRODE',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1947,27,'2018-01-06','HD','2018-01-06 18:12:47',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8101,'CHINTAMANI DHAMAL',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1948,72,'2018-01-06','HD','2018-01-06 18:13:55',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15171,'PRABHAKAR REDEKAR',NULL,NULL,NULL,'2018-01-08 13:13:05','2018-01-08 13:13:05'),(1949,118,'2018-01-06','HD','2018-01-06 18:14:59',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',14123,'VINOD SAVARATKAR',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1950,21,'2018-01-06','HD','2018-01-06 18:17:58',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15130,'BAHUBALI GOTURE',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1951,81,'2018-01-06','HD','2018-01-06 18:18:00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15139,'RAGHAVENDRA KULKARNI',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1952,119,'2018-01-06','HD','2018-01-06 18:18:40',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9103,'VISHAL JAMDADE',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1953,122,'2018-01-06','HD','2018-01-06 18:19:11',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11101,'VISHNU MEHETRE',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1954,57,'2018-01-06','HD','2018-01-06 18:20:12',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10105,'KIRAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1955,51,'2018-01-06','HD','2018-01-06 18:31:26',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9105,'JAYPRAKASH DABHADE',NULL,NULL,NULL,'2018-01-08 13:13:06','2018-01-08 13:13:06'),(1956,10,'2018-01-06','HD','2018-01-06 18:35:15',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',12103,'AMOL JAGTAP',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1957,75,'2018-01-06','HD','2018-01-06 18:43:39',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',13108,'PRAFUL WALUNJKAR',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1958,103,'2018-01-06','HD','2018-01-06 18:46:14',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',13106,'SUMIT PURI',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1959,78,'2018-01-06','HD','2018-01-06 18:59:28',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15106,'PRASHANT SHABADI',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1960,6,'2018-01-06','HD','2018-01-06 19:06:58',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15145,'AMIT BELGAONKAR',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1961,108,'2018-01-06','HD','2018-01-06 19:12:58',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15184,'TAPAS KULKARNI',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1962,90,'2018-01-06','HD','2018-01-06 19:14:26',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15144,'SANDEEP PANSARE',NULL,NULL,NULL,'2018-01-08 13:13:07','2018-01-08 13:13:07'),(1963,33,'2018-01-06','HD','2018-01-06 19:18:05',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5104,'DILIP LONKAR',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1964,2,'2018-01-06','HD','2018-01-06 19:20:17',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11115,'AJAY RAVAL',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1965,112,'2018-01-06','HD','2018-01-06 19:20:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15104,'VAIBHAV UGARE',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1966,22,'2018-01-06','HD','2018-01-06 19:28:37',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9101,'BALAGOUDA PATIL',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1967,116,'2018-01-06','HD','2018-01-06 19:28:48',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9109,'VINAY CHAVAN',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1968,97,'2018-01-06','HD','2018-01-06 19:34:31',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',2101,'SHIVAJI UNDRE',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1969,52,'2018-01-06','HD','2018-01-06 21:02:09',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8105,'JEEVAN',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1970,69,'2018-01-06','HD','2018-01-06 21:02:15',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15192,'OMKAR RAVAN',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1971,121,'2018-01-07','HD','2018-01-07 08:17:04',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5101,'VISHNU BHAGWAT',NULL,NULL,NULL,'2018-01-08 13:13:08','2018-01-08 13:13:08'),(1972,41,'2018-01-07','HD','2018-01-07 08:17:18',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',6204,'GANESH MANDHARE',NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1973,75,'2018-01-07','HD','2018-01-07 10:05:21','2018-01-07 15:32:58',NULL,0,NULL,NULL,NULL,NULL,NULL,'05:27',NULL,NULL,NULL,NULL,'January',13108,'PRAFUL WALUNJKAR',NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1974,72,'2018-01-07','HD','2018-01-07 12:42:11','2018-01-07 16:44:57',NULL,0,NULL,NULL,NULL,NULL,NULL,'04:02',NULL,NULL,NULL,NULL,'January',15171,'PRABHAKAR REDEKAR',NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1975,32,'2018-01-08','HD','2018-01-08 08:02:22',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7103,'DILIP LOHAR',NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1976,119,'2018-01-08','HD','2018-01-08 08:07:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9103,'VISHAL JAMDADE',NULL,NULL,NULL,'2018-01-08 13:13:09','2018-01-08 13:13:09'),(1977,108,'2018-01-08','HD','2018-01-08 08:14:36',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15184,'TAPAS KULKARNI',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1978,132,'2018-01-08','HD','2018-01-08 08:15:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15206,'VINODAKUMAR',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1979,29,'2018-01-08','HD','2018-01-08 08:17:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5203,'DASHARATH LOANKAR',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1980,4,'2018-01-08','HD','2018-01-08 08:20:43',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',14121,'AJIT MAHABARE',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1981,116,'2018-01-08','HD','2018-01-08 08:20:51',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9109,'VINAY CHAVAN',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1982,92,'2018-01-08','HD','2018-01-08 08:26:31',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15188,'SANKALP SARNOBAT',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1983,136,'2018-01-08','HD','2018-01-08 08:26:40',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15210,'ANUJA PATIL',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1984,105,'2018-01-08','HD','2018-01-08 08:26:47',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15143,'SURAJ KONDARE',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1985,126,'2018-01-08','HD','2018-01-08 08:27:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15137,'YOJANA GAIKWAD',NULL,NULL,NULL,'2018-01-08 13:13:10','2018-01-08 13:13:10'),(1986,118,'2018-01-08','HD','2018-01-08 08:27:29',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',14123,'VINOD SAVARATKAR',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1987,81,'2018-01-08','HD','2018-01-08 08:27:36',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15139,'RAGHAVENDRA KULKARNI',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1988,115,'2018-01-08','HD','2018-01-08 08:27:53',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8104,'VIKAS RANAWARE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1989,97,'2018-01-08','HD','2018-01-08 08:28:16',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',2101,'SHIVAJI UNDRE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1990,90,'2018-01-08','HD','2018-01-08 08:28:23',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15144,'SANDEEP PANSARE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1991,54,'2018-01-08','HD','2018-01-08 08:28:35',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15122,'KAVITA HURPADE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1992,122,'2018-01-08','HD','2018-01-08 08:28:38',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11101,'VISHNU MEHETRE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1993,18,'2018-01-08','HD','2018-01-08 08:28:42',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15172,'ASHVINI NALAWADE',NULL,NULL,NULL,'2018-01-08 13:13:11','2018-01-08 13:13:11'),(1994,58,'2018-01-08','HD','2018-01-08 08:28:56',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15200,'Krunal Agarkar',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1995,112,'2018-01-08','HD','2018-01-08 08:29:15',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15104,'VAIBHAV UGARE',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1996,30,'2018-01-08','HD','2018-01-08 08:29:20',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10106,'DATTA BIRAMANE',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1997,59,'2018-01-08','HD','2018-01-08 08:29:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15131,'KUSHAL JAIN',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1998,103,'2018-01-08','HD','2018-01-08 08:29:32',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',13106,'SUMIT PURI',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(1999,10,'2018-01-08','HD','2018-01-08 08:29:47',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',12103,'AMOL JAGTAP',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(2000,72,'2018-01-08','HD','2018-01-08 08:29:54',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15171,'PRABHAKAR REDEKAR',NULL,NULL,NULL,'2018-01-08 13:13:12','2018-01-08 13:13:12'),(2001,95,'2018-01-08','HD','2018-01-08 08:30:01',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',7104,'SAROJ PATIL',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2002,78,'2018-01-08','HD','2018-01-08 08:30:05','2018-01-08 08:30:06',NULL,0,NULL,NULL,NULL,NULL,NULL,'00:00',NULL,NULL,NULL,NULL,'January',15106,'PRASHANT SHABADI',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2003,25,'2018-01-08','HD','2018-01-08 08:30:11',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15132,'BHAVESH SHIRODE',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2004,21,'2018-01-08','HD','2018-01-08 08:30:34',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15130,'BAHUBALI GOTURE',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2005,135,'2018-01-08','HD','2018-01-08 08:30:56',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15209,'MILIND KOTKAR',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2006,75,'2018-01-08','HD','2018-01-08 08:31:05',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',13108,'PRAFUL WALUNJKAR',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2007,27,'2018-01-08','HD','2018-01-08 08:33:19',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8101,'CHINTAMANI DHAMAL',NULL,NULL,NULL,'2018-01-08 13:13:13','2018-01-08 13:13:13'),(2008,15,'2018-01-08','HD','2018-01-08 08:34:19',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9102,'ANKUSH VEDPATHAK',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2009,60,'2018-01-08','HD','2018-01-08 08:34:46',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5107,'MADHUKAR SHEDGE',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2010,130,'2018-01-08','HD','2018-01-08 08:34:52',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15204,'TEJAS  DHAMAL',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2011,88,'2018-01-08','HD','2018-01-08 08:32:20',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',95102,'SADANAND BORSE',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2012,74,'2018-01-08','HD','2018-01-08 08:32:29','2018-01-08 08:32:34',NULL,0,NULL,NULL,NULL,NULL,NULL,'00:00',NULL,NULL,NULL,NULL,'January',101,'PRADNYA THIPASE',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2013,23,'2018-01-08','HD','2018-01-08 08:34:48','2018-01-08 13:36:07',NULL,0,NULL,NULL,NULL,NULL,NULL,'05:01',NULL,NULL,NULL,NULL,'January',5108,'BALAJI UMATE',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2014,51,'2018-01-08','HD','2018-01-08 08:46:55',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',9105,'JAYPRAKASH DABHADE',NULL,NULL,NULL,'2018-01-08 13:13:14','2018-01-08 13:13:14'),(2015,69,'2018-01-08','HD','2018-01-08 08:47:20',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15192,'OMKAR RAVAN',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2016,57,'2018-01-08','HD','2018-01-08 08:47:28',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10105,'KIRAN JADHAV',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2017,64,'2018-01-08','HD','2018-01-08 08:51:07',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15105,'NEHA TANK',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2018,120,'2018-01-08','HD','2018-01-08 09:21:19',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',11113,'VISHAL NIMAVAT',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2019,12,'2018-01-08','HD','2018-01-08 08:40:07',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15181,'ANIKET PATIL',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2020,91,'2018-01-08','HD','2018-01-08 08:43:04',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',10107,'SANJAY AMALE',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2021,52,'2018-01-08','HD','2018-01-08 09:28:55',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',8105,'JEEVAN',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2022,33,'2018-01-08','HD','2018-01-08 09:04:21',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',5104,'DILIP LONKAR',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2023,96,'2018-01-08','HD','2018-01-08 09:04:48','2018-01-08 09:04:49',NULL,0,NULL,NULL,NULL,NULL,NULL,'00:00',NULL,NULL,NULL,NULL,'January',8103,'SATHISHA M.R',NULL,NULL,NULL,'2018-01-08 13:13:15','2018-01-08 13:13:15'),(2024,6,'2018-01-08','HD','2018-01-08 09:15:35',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',15145,'AMIT BELGAONKAR',NULL,NULL,NULL,'2018-01-08 13:13:16','2018-01-08 13:13:16'),(2025,48,'2018-01-08','HD','2018-01-08 09:19:05',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'January',12104,'JAMIR SHAIKH',NULL,NULL,NULL,'2018-01-08 13:13:16','2018-01-08 13:13:16'),(2026,1,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2027,2,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2028,3,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2029,4,'2018-01-26','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2030,5,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2031,6,'2018-01-26','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2032,7,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2033,8,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2034,9,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2035,10,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2036,11,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:26','2018-01-08 13:58:26'),(2037,12,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2038,13,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2039,14,'2018-01-26','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2040,15,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2041,16,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2042,17,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2043,18,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2044,19,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2045,20,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2046,21,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2047,22,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2048,23,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2049,24,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2050,25,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:27','2018-01-08 13:58:27'),(2051,26,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2052,27,'2018-01-26','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2053,28,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2054,29,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2055,30,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2056,31,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2057,32,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2058,33,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2059,34,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2060,35,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2061,36,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2062,37,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2063,38,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:28','2018-01-08 13:58:28'),(2064,39,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2065,40,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2066,41,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2067,42,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2068,43,'2018-01-26','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2069,44,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2070,45,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2071,46,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2072,47,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2073,48,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2074,49,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2075,50,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2076,51,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2077,52,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2078,53,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2079,54,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:29','2018-01-08 13:58:29'),(2080,55,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2081,56,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2082,57,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2083,58,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2084,59,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2085,60,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2086,61,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2087,62,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2088,63,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2089,64,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2090,65,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2091,66,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2092,67,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2093,68,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2094,69,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:30','2018-01-08 13:58:30'),(2095,70,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2096,71,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2097,72,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2098,73,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2099,74,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2100,75,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2101,76,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2102,77,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2103,78,'2018-01-26','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2104,79,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2105,80,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2106,81,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2107,82,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2108,83,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2109,84,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2110,85,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:31','2018-01-08 13:58:31'),(2111,86,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2112,87,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2113,88,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2114,89,'2018-01-26','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2115,90,'2018-01-26','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2116,91,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2117,92,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2118,93,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2119,94,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2120,95,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2121,96,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2122,97,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2123,98,'2018-01-26','NH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2124,99,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2125,100,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2126,101,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:32','2018-01-08 13:58:32'),(2127,102,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2128,103,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2129,104,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2130,105,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2131,106,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2132,107,'2018-01-26','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2133,108,'2018-01-26','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2134,109,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2135,110,'2018-01-26','NH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2136,111,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2137,112,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2138,113,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2139,114,'2018-01-26','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2140,115,'2018-01-26','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:33','2018-01-08 13:58:33'),(2141,116,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2142,117,'2018-01-26','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2143,118,'2018-01-26','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2144,119,'2018-01-26','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2145,120,'2018-01-26','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2146,121,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2147,122,'2018-01-26','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2148,123,'2018-01-26','NH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2149,124,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2150,125,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2151,126,'2018-01-26','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2152,127,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2153,128,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2154,129,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2155,130,'2018-01-26','NH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2156,131,'2018-01-26','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2157,132,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:34','2018-01-08 13:58:34'),(2158,133,'2018-01-26','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:35','2018-01-08 13:58:35'),(2159,134,'2018-01-26','NH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:35','2018-01-08 13:58:35'),(2160,135,'2018-01-26','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:35','2018-01-08 13:58:35'),(2161,136,'2018-01-26','NH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2018-01-08 13:58:35','2018-01-08 13:58:35'),(2162,1,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:50','2018-01-08 13:59:50'),(2163,2,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:50','2018-01-08 13:59:50'),(2164,3,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2165,4,'2018-08-15','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2166,5,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2167,6,'2018-08-15','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2168,7,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2169,8,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2170,9,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2171,10,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2172,11,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2173,12,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2174,13,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2175,14,'2018-08-15','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2176,15,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2177,16,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2178,17,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2179,18,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:51','2018-01-08 13:59:51'),(2180,19,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2181,20,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2182,21,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2183,22,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2184,23,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2185,24,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2186,25,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2187,26,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2188,27,'2018-08-15','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2189,28,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2190,29,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2191,30,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2192,31,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2193,32,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2194,33,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2195,34,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:52','2018-01-08 13:59:52'),(2196,35,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2197,36,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2198,37,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2199,38,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2200,39,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2201,40,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2202,41,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2203,42,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2204,43,'2018-08-15','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2205,44,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2206,45,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2207,46,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2208,47,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:53','2018-01-08 13:59:53'),(2209,48,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2210,49,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2211,50,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2212,51,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2213,52,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2214,53,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2215,54,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2216,55,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2217,56,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2218,57,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2219,58,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2220,59,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2221,60,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2222,61,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2223,62,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:54','2018-01-08 13:59:54'),(2224,63,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2225,64,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2226,65,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2227,66,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2228,67,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2229,68,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2230,69,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2231,70,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2232,71,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2233,72,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2234,73,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2235,74,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2236,75,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2237,76,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2238,77,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:55','2018-01-08 13:59:55'),(2239,78,'2018-08-15','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2240,79,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2241,80,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2242,81,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2243,82,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2244,83,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2245,84,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2246,85,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2247,86,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2248,87,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2249,88,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2250,89,'2018-08-15','NH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2251,90,'2018-08-15','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2252,91,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2253,92,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2254,93,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:56','2018-01-08 13:59:56'),(2255,94,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2256,95,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2257,96,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2258,97,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2259,98,'2018-08-15','NH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2260,99,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2261,100,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2262,101,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2263,102,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2264,103,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2265,104,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2266,105,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2267,106,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2268,107,'2018-08-15','NH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2269,108,'2018-08-15','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:57','2018-01-08 13:59:57'),(2270,109,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2271,110,'2018-08-15','NH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2272,111,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2273,112,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2274,113,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2275,114,'2018-08-15','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2276,115,'2018-08-15','NH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2277,116,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2278,117,'2018-08-15','NH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2279,118,'2018-08-15','NH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2280,119,'2018-08-15','NH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2281,120,'2018-08-15','NH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2282,121,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2283,122,'2018-08-15','NH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2284,123,'2018-08-15','NH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2285,124,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2286,125,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:58','2018-01-08 13:59:58'),(2287,126,'2018-08-15','NH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2288,127,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2289,128,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2290,129,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2291,130,'2018-08-15','NH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2292,131,'2018-08-15','NH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2293,132,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2294,133,'2018-08-15','NH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2295,134,'2018-08-15','NH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2296,135,'2018-08-15','NH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2297,136,'2018-08-15','NH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'2018-01-08 13:59:59','2018-01-08 13:59:59'),(2298,1,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2299,2,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2300,3,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2301,4,'2018-05-01','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2302,5,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2303,6,'2018-05-01','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2304,7,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2305,8,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2306,9,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2307,10,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:00','2018-01-08 14:11:00'),(2308,11,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2309,12,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2310,13,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2311,14,'2018-05-01','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2312,15,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2313,16,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2314,17,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2315,18,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2316,19,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2317,20,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2318,21,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2319,22,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2320,23,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2321,24,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2322,25,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:01','2018-01-08 14:11:01'),(2323,26,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2324,27,'2018-05-01','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2325,28,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2326,29,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2327,30,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2328,31,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2329,32,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2330,33,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2331,34,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2332,35,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2333,36,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2334,37,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2335,38,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2336,39,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2337,40,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2338,41,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2339,42,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:02','2018-01-08 14:11:02'),(2340,43,'2018-05-01','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2341,44,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2342,45,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2343,46,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2344,47,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2345,48,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2346,49,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2347,50,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2348,51,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2349,52,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2350,53,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2351,54,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2352,55,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2353,56,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2354,57,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2355,58,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:03','2018-01-08 14:11:03'),(2356,59,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2357,60,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2358,61,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2359,62,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2360,63,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2361,64,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2362,65,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2363,66,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2364,67,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2365,68,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2366,69,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2367,70,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2368,71,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2369,72,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2370,73,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:04','2018-01-08 14:11:04'),(2371,74,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2372,75,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2373,76,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2374,77,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2375,78,'2018-05-01','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2376,79,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2377,80,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2378,81,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2379,82,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2380,83,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2381,84,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2382,85,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2383,86,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2384,87,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2385,88,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2386,89,'2018-05-01','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:05','2018-01-08 14:11:05'),(2387,90,'2018-05-01','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2388,91,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2389,92,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2390,93,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2391,94,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2392,95,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2393,96,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2394,97,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2395,98,'2018-05-01','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2396,99,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2397,100,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2398,101,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2399,102,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2400,103,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2401,104,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:06','2018-01-08 14:11:06'),(2402,105,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2403,106,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2404,107,'2018-05-01','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2405,108,'2018-05-01','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2406,109,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2407,110,'2018-05-01','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2408,111,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2409,112,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2410,113,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2411,114,'2018-05-01','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2412,115,'2018-05-01','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2413,116,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2414,117,'2018-05-01','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:07','2018-01-08 14:11:07'),(2415,118,'2018-05-01','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2416,119,'2018-05-01','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2417,120,'2018-05-01','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2418,121,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2419,122,'2018-05-01','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2420,123,'2018-05-01','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2421,124,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2422,125,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2423,126,'2018-05-01','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2424,127,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2425,128,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2426,129,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2427,130,'2018-05-01','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2428,131,'2018-05-01','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2429,132,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2430,133,'2018-05-01','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:08','2018-01-08 14:11:08'),(2431,134,'2018-05-01','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:09','2018-01-08 14:11:09'),(2432,135,'2018-05-01','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:09','2018-01-08 14:11:09'),(2433,136,'2018-05-01','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,'2018-01-08 14:11:09','2018-01-08 14:11:09'),(2434,2,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:27','2018-01-08 14:12:27'),(2435,4,'2018-09-13','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:27','2018-01-08 14:12:27'),(2436,5,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:27','2018-01-08 14:12:27'),(2437,6,'2018-09-13','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:28','2018-01-08 14:12:28'),(2438,7,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:28','2018-01-08 14:12:28'),(2439,10,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:28','2018-01-08 14:12:28'),(2440,11,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:54','2018-01-08 14:12:54'),(2441,12,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:54','2018-01-08 14:12:54'),(2442,13,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:54','2018-01-08 14:12:54'),(2443,15,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:12:54','2018-01-08 14:12:54'),(2444,17,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:22','2018-01-08 14:15:22'),(2445,18,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:22','2018-01-08 14:15:22'),(2446,19,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2447,20,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2448,21,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2449,22,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2450,23,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2451,24,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2452,25,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2453,27,'2018-09-13','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2454,28,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2455,29,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2456,30,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2457,31,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2458,32,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:23','2018-01-08 14:15:23'),(2459,33,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2460,34,'2018-09-13','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2461,35,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2462,37,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2463,38,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2464,40,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2465,41,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2466,42,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2467,43,'2018-09-13','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2468,44,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2469,45,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2470,46,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:24','2018-01-08 14:15:24'),(2471,48,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2472,51,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2473,52,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2474,53,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2475,54,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2476,55,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2477,56,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2478,57,'2018-09-13','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2479,58,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2480,59,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2481,60,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:15:25','2018-01-08 14:15:25'),(2482,50,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2483,63,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2484,64,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2485,66,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2486,67,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2487,68,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:21','2018-01-08 14:17:21'),(2488,65,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:44','2018-01-08 14:17:44'),(2489,69,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:44','2018-01-08 14:17:44'),(2490,70,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:44','2018-01-08 14:17:44'),(2491,71,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:44','2018-01-08 14:17:44'),(2492,72,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:44','2018-01-08 14:17:44'),(2493,74,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:17:45','2018-01-08 14:17:45'),(2494,75,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:15','2018-01-08 14:18:15'),(2495,76,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:15','2018-01-08 14:18:15'),(2496,77,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:16','2018-01-08 14:18:16'),(2497,78,'2018-09-13','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:16','2018-01-08 14:18:16'),(2498,79,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:16','2018-01-08 14:18:16'),(2499,80,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:16','2018-01-08 14:18:16'),(2500,62,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:46','2018-01-08 14:18:46'),(2501,81,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:46','2018-01-08 14:18:46'),(2502,83,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:46','2018-01-08 14:18:46'),(2503,84,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:46','2018-01-08 14:18:46'),(2504,85,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:46','2018-01-08 14:18:46'),(2505,86,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:18:47','2018-01-08 14:18:47'),(2506,90,'2018-09-13','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:19:38','2018-01-08 14:19:38'),(2507,91,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:19:38','2018-01-08 14:19:38'),(2508,92,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:19:38','2018-01-08 14:19:38'),(2509,87,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2510,88,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2511,89,'2018-09-13','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2512,94,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2513,95,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2514,96,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2515,97,'2018-09-13','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2516,98,'2018-09-13','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2517,99,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:53','2018-01-08 14:20:53'),(2518,100,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2519,102,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2520,103,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2521,104,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2522,105,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2523,106,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2524,108,'2018-09-13','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2525,109,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2526,111,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2527,112,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2528,113,'2018-09-13','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2529,114,'2018-09-13','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2530,115,'2018-09-13','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2531,116,'2018-09-13','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2532,117,'2018-09-13','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2533,118,'2018-09-13','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:54','2018-01-08 14:20:54'),(2534,119,'2018-09-13','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:55','2018-01-08 14:20:55'),(2535,120,'2018-09-13','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:55','2018-01-08 14:20:55'),(2536,121,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:55','2018-01-08 14:20:55'),(2537,122,'2018-09-13','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:55','2018-01-08 14:20:55'),(2538,123,'2018-09-13','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:20:55','2018-01-08 14:20:55'),(2539,126,'2018-09-13','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2540,127,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2541,128,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2542,129,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2543,130,'2018-09-13','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2544,131,'2018-09-13','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2545,132,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2546,134,'2018-09-13','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2547,135,'2018-09-13','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:21:52','2018-01-08 14:21:52'),(2548,136,'2018-09-13','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'2018-01-08 14:22:13','2018-01-08 14:22:13'),(2549,1,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:04','2018-01-08 14:23:04'),(2550,2,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:04','2018-01-08 14:23:04'),(2551,3,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:04','2018-01-08 14:23:04'),(2552,4,'2018-10-19','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2553,5,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2554,6,'2018-10-19','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2555,7,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2556,8,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2557,9,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2558,10,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2559,11,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2560,12,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2561,13,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2562,14,'2018-10-19','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2563,15,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2564,16,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2565,17,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2566,18,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:05','2018-01-08 14:23:05'),(2567,19,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2568,20,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2569,21,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2570,22,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2571,23,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2572,24,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2573,25,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2574,26,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2575,27,'2018-10-19','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2576,28,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2577,29,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2578,30,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2579,31,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2580,32,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:06','2018-01-08 14:23:06'),(2581,33,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2582,34,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2583,35,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2584,36,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2585,37,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2586,38,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2587,39,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2588,40,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2589,41,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2590,42,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2591,43,'2018-10-19','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2592,44,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2593,45,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2594,46,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:07','2018-01-08 14:23:07'),(2595,47,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2596,48,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2597,49,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2598,50,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2599,51,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2600,52,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2601,53,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2602,54,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2603,55,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2604,56,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2605,57,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2606,58,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2607,59,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2608,60,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:08','2018-01-08 14:23:08'),(2609,61,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2610,62,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2611,63,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2612,64,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2613,65,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2614,66,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2615,67,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2616,68,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2617,69,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2618,70,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2619,71,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2620,72,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2621,73,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2622,74,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2623,75,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2624,76,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2625,77,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:09','2018-01-08 14:23:09'),(2626,78,'2018-10-19','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2627,79,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2628,80,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2629,81,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2630,82,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2631,83,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2632,84,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2633,85,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2634,86,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2635,87,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2636,88,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2637,89,'2018-10-19','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2638,90,'2018-10-19','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2639,91,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2640,92,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:10','2018-01-08 14:23:10'),(2641,93,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2642,94,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2643,95,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2644,96,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2645,97,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2646,98,'2018-10-19','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2647,99,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2648,100,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2649,101,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2650,102,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2651,103,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2652,104,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:11','2018-01-08 14:23:11'),(2653,105,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2654,106,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2655,107,'2018-10-19','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2656,108,'2018-10-19','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2657,109,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2658,110,'2018-10-19','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2659,111,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2660,112,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2661,113,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2662,114,'2018-10-19','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2663,115,'2018-10-19','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2664,116,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2665,117,'2018-10-19','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2666,118,'2018-10-19','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2667,119,'2018-10-19','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2668,120,'2018-10-19','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:12','2018-01-08 14:23:12'),(2669,121,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2670,122,'2018-10-19','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2671,123,'2018-10-19','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2672,124,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2673,125,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2674,126,'2018-10-19','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2675,127,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2676,128,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2677,129,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2678,130,'2018-10-19','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2679,131,'2018-10-19','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2680,132,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2681,133,'2018-10-19','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2682,134,'2018-10-19','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2683,135,'2018-10-19','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2684,136,'2018-10-19','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,'2018-01-08 14:23:13','2018-01-08 14:23:13'),(2685,1,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2686,2,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2687,3,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2688,4,'2018-11-06','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2689,5,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2690,6,'2018-11-06','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2691,7,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:30','2018-01-08 14:23:30'),(2692,8,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2693,9,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2694,10,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2695,11,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2696,12,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2697,13,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2698,14,'2018-11-06','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2699,15,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2700,16,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2701,17,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2702,18,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:31','2018-01-08 14:23:31'),(2703,19,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2704,20,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2705,21,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2706,22,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2707,23,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2708,24,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2709,25,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2710,26,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2711,27,'2018-11-06','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2712,28,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2713,29,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2714,30,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2715,31,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2716,32,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:32','2018-01-08 14:23:32'),(2717,33,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2718,34,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2719,35,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2720,36,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2721,37,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2722,38,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2723,39,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2724,40,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2725,41,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2726,42,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2727,43,'2018-11-06','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2728,44,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2729,45,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2730,46,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:33','2018-01-08 14:23:33'),(2731,47,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2732,48,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2733,49,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2734,50,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2735,51,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2736,52,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2737,53,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2738,54,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2739,55,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2740,56,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2741,57,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2742,58,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2743,59,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2744,60,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2745,61,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2746,62,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:34','2018-01-08 14:23:34'),(2747,63,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2748,64,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2749,65,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2750,66,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2751,67,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2752,68,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2753,69,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2754,70,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2755,71,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2756,72,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2757,73,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2758,74,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2759,75,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2760,76,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2761,77,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:35','2018-01-08 14:23:35'),(2762,78,'2018-11-06','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2763,79,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2764,80,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2765,81,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2766,82,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2767,83,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2768,84,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2769,85,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2770,86,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2771,87,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2772,88,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2773,89,'2018-11-06','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2774,90,'2018-11-06','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2775,91,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:36','2018-01-08 14:23:36'),(2776,92,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2777,93,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2778,94,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2779,95,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2780,96,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2781,97,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2782,98,'2018-11-06','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2783,99,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2784,100,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2785,101,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2786,102,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2787,103,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2788,104,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2789,105,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:37','2018-01-08 14:23:37'),(2790,106,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2791,107,'2018-11-06','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2792,108,'2018-11-06','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2793,109,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2794,110,'2018-11-06','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2795,111,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2796,112,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2797,113,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2798,114,'2018-11-06','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2799,115,'2018-11-06','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2800,116,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2801,117,'2018-11-06','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2802,118,'2018-11-06','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:38','2018-01-08 14:23:38'),(2803,119,'2018-11-06','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2804,120,'2018-11-06','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2805,121,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2806,122,'2018-11-06','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2807,123,'2018-11-06','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2808,124,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2809,125,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2810,126,'2018-11-06','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2811,127,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2812,128,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2813,129,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2814,130,'2018-11-06','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2815,131,'2018-11-06','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:39','2018-01-08 14:23:39'),(2816,132,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:40','2018-01-08 14:23:40'),(2817,133,'2018-11-06','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:40','2018-01-08 14:23:40'),(2818,134,'2018-11-06','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:40','2018-01-08 14:23:40'),(2819,135,'2018-11-06','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:40','2018-01-08 14:23:40'),(2820,136,'2018-11-06','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,'2018-01-08 14:23:40','2018-01-08 14:23:40'),(2821,1,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2822,2,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2823,3,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2824,4,'2018-11-07','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2825,5,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2826,6,'2018-11-07','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:23:59','2018-01-08 14:23:59'),(2827,7,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2828,8,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2829,9,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2830,10,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2831,11,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2832,12,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2833,13,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2834,14,'2018-11-07','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2835,15,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2836,16,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2837,17,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2838,18,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2839,19,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:00','2018-01-08 14:24:00'),(2840,20,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2841,21,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2842,22,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2843,23,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2844,24,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2845,25,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2846,26,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2847,27,'2018-11-07','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2848,28,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2849,29,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2850,30,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2851,31,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2852,32,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2853,33,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2854,34,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2855,35,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:01','2018-01-08 14:24:01'),(2856,36,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2857,37,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2858,38,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2859,39,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2860,40,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2861,41,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2862,42,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2863,43,'2018-11-07','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2864,44,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2865,45,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2866,46,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2867,47,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2868,48,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:02','2018-01-08 14:24:02'),(2869,49,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2870,50,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2871,51,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2872,52,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2873,53,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2874,54,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2875,55,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2876,56,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2877,57,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2878,58,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2879,59,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2880,60,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:03','2018-01-08 14:24:03'),(2881,61,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2882,62,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2883,63,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2884,64,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2885,65,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2886,66,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2887,67,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2888,68,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2889,69,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2890,70,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2891,71,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2892,72,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2893,73,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2894,74,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:04','2018-01-08 14:24:04'),(2895,75,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2896,76,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2897,77,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2898,78,'2018-11-07','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2899,79,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2900,80,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2901,81,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2902,82,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2903,83,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2904,84,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2905,85,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2906,86,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2907,87,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2908,88,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2909,89,'2018-11-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:05','2018-01-08 14:24:05'),(2910,90,'2018-11-07','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2911,91,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2912,92,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2913,93,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2914,94,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2915,95,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2916,96,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2917,97,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2918,98,'2018-11-07','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2919,99,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2920,100,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2921,101,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2922,102,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2923,103,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:06','2018-01-08 14:24:06'),(2924,104,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2925,105,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2926,106,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2927,107,'2018-11-07','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2928,108,'2018-11-07','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2929,109,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2930,110,'2018-11-07','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2931,111,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2932,112,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2933,113,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2934,114,'2018-11-07','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2935,115,'2018-11-07','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2936,116,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2937,117,'2018-11-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:07','2018-01-08 14:24:07'),(2938,118,'2018-11-07','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2939,119,'2018-11-07','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2940,120,'2018-11-07','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2941,121,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2942,122,'2018-11-07','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2943,123,'2018-11-07','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2944,124,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2945,125,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2946,126,'2018-11-07','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2947,127,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2948,128,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2949,129,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2950,130,'2018-11-07','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:08','2018-01-08 14:24:08'),(2951,131,'2018-11-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2952,132,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2953,133,'2018-11-07','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2954,134,'2018-11-07','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2955,135,'2018-11-07','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2956,136,'2018-11-07','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,NULL,'2018-01-08 14:24:09','2018-01-08 14:24:09'),(2957,1,'2018-11-08','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2958,2,'2018-11-08','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2959,3,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2960,4,'2018-11-08','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2961,5,'2018-11-08','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2962,6,'2018-11-08','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2963,7,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2964,8,'2018-11-08','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:13','2018-01-08 14:25:13'),(2965,9,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:14','2018-01-08 14:25:14'),(2966,10,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:14','2018-01-08 14:25:14'),(2967,11,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2968,12,'2018-11-08','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2969,13,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2970,14,'2018-11-08','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2971,15,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2972,17,'2018-11-08','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2973,18,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:37','2018-01-08 14:25:37'),(2974,19,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:38','2018-01-08 14:25:38'),(2975,20,'2018-11-08','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:38','2018-01-08 14:25:38'),(2976,21,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:57','2018-01-08 14:25:57'),(2977,22,'2018-11-08','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2978,23,'2018-11-08','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2979,24,'2018-11-08','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2980,25,'2018-11-08','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2981,26,'2018-11-08','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2982,27,'2018-11-08','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2983,28,'2018-11-08','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2984,29,'2018-11-08','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,NULL,'2018-01-08 14:25:58','2018-01-08 14:25:58'),(2985,17,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:30','2018-01-08 15:15:30'),(2986,23,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:30','2018-01-08 15:15:30'),(2987,24,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:30','2018-01-08 15:15:30'),(2988,45,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2989,55,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2990,63,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2991,68,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2992,80,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2993,83,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2994,85,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2995,86,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2996,91,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2997,94,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2998,109,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(2999,111,'2018-08-07','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:15:31','2018-01-08 15:15:31'),(3000,12,'2018-08-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:16:29','2018-01-08 15:16:29'),(3001,31,'2018-08-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:16:29','2018-01-08 15:16:29'),(3002,76,'2018-08-07','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:16:29','2018-01-08 15:16:29'),(3003,20,'2018-08-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:17:47','2018-01-08 15:17:47'),(3004,40,'2018-08-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:17:47','2018-01-08 15:17:47'),(3005,46,'2018-08-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:17:47','2018-01-08 15:17:47'),(3006,106,'2018-08-07','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,NULL,'2018-01-08 15:17:48','2018-01-08 15:17:48'),(3007,1,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3008,2,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3009,4,'2018-11-09','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3010,5,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3011,6,'2018-11-09','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3012,7,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3013,10,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3014,11,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3015,12,'2018-11-09','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:00','2018-01-08 15:19:00'),(3016,13,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3017,15,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3018,17,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3019,18,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3020,19,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3021,20,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3022,21,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3023,22,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3024,23,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3025,24,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3026,25,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3027,27,'2018-11-09','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3028,28,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3029,29,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3030,30,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3031,31,'2018-11-09','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:01','2018-01-08 15:19:01'),(3032,32,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3033,33,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3034,35,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3035,37,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3036,40,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3037,41,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3038,43,'2018-11-09','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3039,44,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3040,45,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3041,46,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3042,48,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3043,50,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3044,51,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3045,52,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3046,54,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3047,55,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:02','2018-01-08 15:19:02'),(3048,56,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3049,57,'2018-11-09','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3050,58,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3051,59,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3052,60,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3053,63,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3054,64,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3055,66,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3056,68,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3057,69,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3058,71,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3059,72,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3060,74,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3061,75,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3062,76,'2018-11-09','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3063,78,'2018-11-09','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3064,80,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:03','2018-01-08 15:19:03'),(3065,81,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3066,83,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3067,84,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3068,85,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3069,86,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3070,87,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3071,88,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3072,90,'2018-11-09','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3073,91,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3074,92,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3075,93,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3076,94,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:04','2018-01-08 15:19:04'),(3077,95,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3078,96,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3079,97,'2018-11-09','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3080,98,'2018-11-09','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3081,99,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3082,103,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3083,104,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3084,105,'2018-11-09','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3085,106,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3086,108,'2018-11-09','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3087,109,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3088,111,'2018-11-09','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3089,112,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3090,115,'2018-11-09','PH',NULL,NULL,NULL,0,4,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:05','2018-01-08 15:19:05'),(3091,116,'2018-11-09','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3092,117,'2018-11-09','PH',NULL,NULL,NULL,0,11,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3093,118,'2018-11-09','PH',NULL,NULL,NULL,0,7,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3094,119,'2018-11-09','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3095,120,'2018-11-09','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3096,121,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3097,122,'2018-11-09','PH',NULL,NULL,NULL,0,5,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3098,123,'2018-11-09','PH',NULL,NULL,NULL,0,13,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3099,126,'2018-11-09','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3100,130,'2018-11-09','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3101,132,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3102,135,'2018-11-09','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3103,136,'2018-11-09','PH',NULL,NULL,NULL,0,15,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,'2018-01-08 15:19:06','2018-01-08 15:19:06'),(3104,3,'2018-03-02','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:44','2018-01-08 15:19:44'),(3105,36,'2018-03-02','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3106,39,'2018-03-02','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3107,47,'2018-03-02','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3108,61,'2018-03-02','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3109,101,'2018-03-02','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3110,107,'2018-03-02','PH',NULL,NULL,NULL,0,2,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3111,133,'2018-03-02','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:19:45','2018-01-08 15:19:45'),(3112,8,'2018-03-02','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:20:15','2018-01-08 15:20:15'),(3113,9,'2018-03-02','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:20:15','2018-01-08 15:20:15'),(3114,26,'2018-03-02','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:20:15','2018-01-08 15:20:15'),(3115,73,'2018-03-02','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:20:15','2018-01-08 15:20:15'),(3116,125,'2018-03-02','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,'2018-01-08 15:20:15','2018-01-08 15:20:15'),(3117,14,'2018-09-03','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,'2018-01-08 15:24:38','2018-01-08 15:24:38'),(3118,49,'2018-09-03','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,'2018-01-08 15:24:38','2018-01-08 15:24:38'),(3119,82,'2018-09-03','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,'2018-01-08 15:24:38','2018-01-08 15:24:38'),(3120,110,'2018-09-03','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,'2018-01-08 15:24:38','2018-01-08 15:24:38'),(3121,124,'2018-09-03','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,'2018-01-08 15:24:38','2018-01-08 15:24:38'),(3122,14,'2018-10-18','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:04','2018-01-08 15:25:04'),(3123,49,'2018-10-18','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:04','2018-01-08 15:25:04'),(3124,82,'2018-10-18','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:04','2018-01-08 15:25:04'),(3125,110,'2018-10-18','PH',NULL,NULL,NULL,0,14,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:04','2018-01-08 15:25:04'),(3126,124,'2018-10-18','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:04','2018-01-08 15:25:04'),(3127,53,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3128,67,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3129,70,'2018-10-18','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3130,79,'2018-10-18','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3131,89,'2018-10-18','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3132,100,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3133,114,'2018-10-18','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3134,127,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3135,128,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3136,129,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:28','2018-01-08 15:25:28'),(3137,131,'2018-10-18','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:29','2018-01-08 15:25:29'),(3138,134,'2018-10-18','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,NULL,'2018-01-08 15:25:29','2018-01-08 15:25:29'),(3139,16,'2018-01-15','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3140,34,'2018-01-15','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3141,38,'2018-01-15','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3142,42,'2018-01-15','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3143,53,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3144,62,'2018-01-15','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3145,65,'2018-01-15','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3146,67,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3147,70,'2018-01-15','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3148,77,'2018-01-15','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3149,79,'2018-01-15','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3150,89,'2018-01-15','PH',NULL,NULL,NULL,0,8,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3151,100,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3152,102,'2018-01-15','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:00','2018-01-08 15:26:00'),(3153,113,'2018-01-15','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3154,114,'2018-01-15','PH',NULL,NULL,NULL,0,9,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3155,127,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3156,128,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3157,129,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3158,131,'2018-01-15','PH',NULL,NULL,NULL,0,10,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3159,134,'2018-01-15','PH',NULL,NULL,NULL,0,16,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,'2018-01-08 15:26:01','2018-01-08 15:26:01'),(3160,16,'2018-04-14','PH',NULL,NULL,NULL,0,3,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3161,34,'2018-04-14','PH',NULL,NULL,NULL,0,6,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3162,38,'2018-04-14','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3163,42,'2018-04-14','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3164,62,'2018-04-14','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3165,65,'2018-04-14','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3166,77,'2018-04-14','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3167,102,'2018-04-14','PH',NULL,NULL,NULL,0,1,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:25','2018-01-08 15:26:25'),(3168,113,'2018-04-14','PH',NULL,NULL,NULL,0,12,1.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,NULL,'2018-01-08 15:26:26','2018-01-08 15:26:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
INSERT INTO `employee_bank_details` VALUES (1,1,1,'50710110007646',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705838','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(2,2,1,'50710110013996',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705810','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(3,3,1,'670010110016215',NULL,'NIT Faridabad','2-A/6, BUNGLOW NIT Faridabad','0','110013053','006700','BKID0006700','2018-01-03 14:24:42','2018-01-03 14:24:42'),(4,4,1,'53610310001008',NULL,'AUNDH-BANER','274/2 HNO594 DONGRE PA, TIL BUNGLOW BANER MAHARASHTRA, PUNE, 411045','9372705913','411013037','000536','BKID0000536','2018-01-03 14:24:42','2018-01-03 14:24:42'),(5,5,1,'50710110022401',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705905','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(6,6,1,'50710110021452',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(7,7,1,'50710110008825',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705902','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(8,8,1,'450010110008116',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9386727343','831013002','004500','BKID0004500','2018-01-03 14:24:42','2018-01-03 14:24:42'),(9,9,1,'450010110014015',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9304066621','831013002','004500','BKID0004500','2018-01-03 14:24:42','2018-01-03 14:24:42'),(10,10,1,'50710110007045',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705827','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(11,11,1,'50710310001229',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705830','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(12,12,1,'50716310000028',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9325609620','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(13,13,1,'50710410000013',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(14,15,1,'50710110007600',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9512750013','411013020','000507','BKID0000507','2018-01-03 14:24:42','2018-01-03 14:24:42'),(15,16,1,'800410110007484',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','0','600013014','008004','BKID0008004','2018-01-03 14:24:42','2018-01-03 14:24:42'),(16,17,1,'50710110002823',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7812045457','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(17,18,1,'50710110022379',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(18,19,1,'50710310000213',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(19,20,1,'50710110013982',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705836','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(20,21,1,'50710110013987',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705911','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(21,22,1,'50710110006201',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(22,23,1,'50710110002911',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705906','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(23,24,1,'50710110002830',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705806','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(24,25,1,'50710110020781',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(25,26,1,'450010110008876',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9325882324','831013002','004500','BKID0004500','2018-01-03 14:24:43','2018-01-03 14:24:43'),(26,27,1,'50710110006200',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8798083633','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(27,28,1,'50710310000724',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705813','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(28,29,1,'50710110002102',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001210','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(29,30,1,'50710310000190',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705814','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(30,31,1,'50710310000212',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705807','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(31,32,1,'50710110005142',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(32,33,1,'50710110002829',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(33,34,1,'801116510000089',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705811','600013005','008011','BKID0008011','2018-01-03 14:24:43','2018-01-03 14:24:43'),(34,35,1,'50710110021518',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9543845457','411013020','000507','BKID0000507','2018-01-03 14:24:43','2018-01-03 14:24:43'),(35,36,1,'689210110002800',NULL,'Avas Vikas',' A-9, AVAS VIKAS, RUDRAPUR, DIST. UDHAMSINGH NAGAR','7410001204','263013202','006892','BKID0006892','2018-01-03 14:24:44','2018-01-03 14:24:44'),(36,37,1,'50710310000903',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224494','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(37,38,1,'801110510000464',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705820','600013005','008011','BKID0008011','2018-01-03 14:24:44','2018-01-03 14:24:44'),(38,39,1,'670210110009464',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','8939645458','110013051','006702','BKID0006702','2018-01-03 14:24:44','2018-01-03 14:24:44'),(39,40,1,'50710110009290',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224492','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(40,41,1,'50710110000292',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705818','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(41,42,1,'801110110009614',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','0','600013005','008011','BKID0008011','2018-01-03 14:24:44','2018-01-03 14:24:44'),(42,43,1,'50710110002851',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9962099178','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(43,44,1,'50710110002824',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705819','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(44,45,1,'50710110002838',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705822','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(45,46,1,'50710110002415',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(46,47,1,'670210110005617',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','0','110013051','006702','BKID0006702','2018-01-03 14:24:44','2018-01-03 14:24:44'),(47,48,1,'50710310000969',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224497','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(48,49,1,'202010110026774',NULL,'GANDHINAGAR','GANDHINAGAR,SECTOR 16, NEAR PATNAG,YOJANA B, GANDHINAGAR,AHMEDABAD,382016,GUJARAT','9372705823','380013044','002020','BKID0002020','2018-01-03 14:24:44','2018-01-03 14:24:44'),(49,50,1,'50710110020243',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(50,51,1,'50710110007667',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(51,52,1,'50710110006202',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705831','411013020','000507','BKID0000507','2018-01-03 14:24:44','2018-01-03 14:24:44'),(52,53,1,'827510110007947',NULL,'NAGERCOIL','885 KP ROAD,WARD NO 27 R,NAGERCOIL,629001,TAMIL NADU','9372705815','629013001','008275','BKID0008275','2018-01-03 14:24:44','2018-01-03 14:24:44'),(53,54,1,'963710110002546',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8939645450','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(54,55,1,'50710310000209',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(55,56,1,'50710110021127',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(56,57,1,'50710310000154',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705835','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(57,58,1,'50710110023116',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(58,59,1,'670210110005619',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(59,60,1,'50710110006509',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705829','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(60,61,1,'712010110007841',NULL,'Greater Noida','C6-7, F block Beta-II, Greater Noida','9372705904','110013081','007120','BKID0007120','2018-01-03 14:24:45','2018-01-03 14:24:45'),(61,62,1,'801110110010078',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','7428224498','600013005','008011','BKID0008011','2018-01-03 14:24:45','2018-01-03 14:24:45'),(62,63,1,'50710310001230',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9840307220','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(63,64,1,'50710110019828',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705828','411013020','000507','BKID0000507','2018-01-03 14:24:45','2018-01-03 14:24:45'),(64,65,1,'841310110008356',NULL,'JP Nagar','JAYAPRAKASH NAGAR,71,50/2, 15TH CROSS,JP NAGAR, 6TH PHASE,BANGALORE','0','560013022','008413','BKID0008413','2018-01-03 14:24:45','2018-01-03 14:24:45'),(65,66,1,'61210110006949',NULL,'Walchandnagar','At And Post Walchandnagar, City Kalamb, Dist Pune 413114','7406842424','413013541','000612','BKID0000612','2018-01-03 14:24:45','2018-01-03 14:24:45'),(66,67,1,'801110510000481',NULL,'Guindy','NO. 111,MOUNT VIEW,MOUNT,GUINDY,CHENNAI-600032','7410001203','600013005','008011','BKID0008011','2018-01-03 14:24:46','2018-01-03 14:24:46'),(67,68,1,'50710310000204',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(68,69,1,'50710310002559',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705908','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(69,70,1,'805710110002068',NULL,'Sriperumbudur','150/1 &151/1 BY PASS ,SRIPERUMBUDUR ,TAMIL NADU ,602105','7410001201','600013035','008057','BKID0008057','2018-01-03 14:24:46','2018-01-03 14:24:46'),(70,71,1,'50710110002836',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(71,72,1,'50710110022368',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705833','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(72,73,1,'450010110008113',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','0','831013002','004500','BKID0004500','2018-01-03 14:24:46','2018-01-03 14:24:46'),(73,74,1,'50710110002850',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9386727342','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(74,75,1,'50710110006196',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(75,76,1,'50710110023183',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705910','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-06 09:54:12'),(76,77,1,'801116510000046',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705826','600013005','008011','BKID0008011','2018-01-03 14:24:46','2018-01-03 14:24:46'),(77,78,1,'50710110020942',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9176525459','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(78,79,1,'805710110002067',NULL,'Sriperumbudur','150/1 &151/1 BY PASS ,SRIPERUMBUDUR ,TAMIL NADU ,602105','9372705832','600013035','008057','BKID0008057','2018-01-03 14:24:46','2018-01-03 14:24:46'),(79,80,1,'50710110006203',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(80,81,1,'50710310000959',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','3972705812','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(81,82,1,'50710110008077',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:46','2018-01-03 14:24:46'),(82,83,1,'50710310002560',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9727651695','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(83,84,1,'50710110002831',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(84,85,1,'50710110002833',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705808','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(85,86,1,'50716310000027',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(86,87,1,'50710110008445',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(87,88,1,'50710110002860',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(88,89,1,'861910110004415',NULL,'Harbour Road','Harbour Road Branch,manganese House,,harbour Road,,vishakapatnam,530001,andhra Pradesh','9372705803','530013003','008619','BKID0008619','2018-01-03 14:24:47','2018-01-03 14:24:47'),(89,90,1,'50710110021406',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(90,91,1,'50710110009666',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(91,92,1,'50710310002693',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(92,93,1,'450010110008114',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','0','831013002','004500','BKID0004500','2018-01-03 14:24:47','2018-01-03 14:24:47'),(93,94,1,'50710310000206',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9386727341','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(94,95,1,'50710110005143',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(95,96,1,'50710110006192',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001202','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(96,97,1,'50710110002820',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705816','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(97,98,1,'50810100017654',NULL,'Swargate','SWAR GATE,34/35, PARWATI DARSHAN,SWAR GATE,PUNE,411009,MAHARASHTRA','9372705805','411013013','000508','BKID0000508','2018-01-03 14:24:47','2018-01-03 14:24:47'),(98,99,1,'50710110022637',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705804','411013020','000507','BKID0000507','2018-01-03 14:24:47','2018-01-03 14:24:47'),(99,100,1,'805710310000979',NULL,'SRIPERUMBUDUR ','SRIPERUMBUDUR (TN)-602105','7410001208','600013035','008057','BKID0008057','2018-01-03 14:24:48','2018-01-03 14:24:48'),(100,101,1,'670010110015463',NULL,'NIT Faridabad','2-A/6, BUNGLOW NIT Faridabad','0','110013053','006700','BKID0006700','2018-01-03 14:24:48','2018-01-03 14:24:48'),(101,102,1,'800410110006534',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','7428224495','600013014','008004','BKID0008004','2018-01-03 14:24:48','2018-01-03 14:24:48'),(102,103,1,'50710410000029',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8144645457','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(103,104,1,'50710310002692',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(104,105,1,'50710110021022',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(105,106,1,'50310110019903',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001205','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(106,107,1,'670210110006168',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','8600236295','110013051','006702','BKID0006702','2018-01-03 14:24:48','2018-01-03 14:24:48'),(107,108,1,'50716310000026',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224493','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(108,109,1,'50710310000208',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705801','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(109,110,1,'274410310000211',NULL,'RAJULA ','LAKHANI CHAMBERS, TOWER ROAD, RAJULA. DIST AMRELI','9372705825','365013503','002744','BKID0002744','2018-01-03 14:24:48','2018-01-03 14:24:48'),(110,111,1,'50710310000750',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9407851901','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(111,112,1,'50710110020329',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705912','411013020','000507','BKID0000507','2018-01-03 14:24:48','2018-01-03 14:24:48'),(112,113,1,'800410310001203',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','0','600013014','008004','BKID0008004','2018-01-03 14:24:49','2018-01-03 14:24:49'),(113,114,1,'805710310000938',NULL,'SRIPERUMBADUR','150/ 1 & 151 /1 BY-PASS SRIPERUMBUDUR','9092543481','600013035','008057','BKID0008057','2018-01-03 14:24:49','2018-01-03 14:24:49'),(114,115,1,'50710110006160',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(115,116,1,'50710110008827',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705821','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(116,117,1,'50710110008088',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(117,118,1,'50710110019507',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705824','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(118,119,1,'50710110007488',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(119,120,1,'50710110013995',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705817','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(120,121,1,'50710110002822',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705901','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(121,122,1,'50710310000254',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705809','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(122,123,1,'50810100011954',NULL,'Swargate','SWAR GATE,34/35, PARWATI DARSHAN,SWAR GATE,PUNE,411009,MAHARASHTRA','9371769137','411013013','000508','BKID0000508','2018-01-03 14:24:49','2018-01-03 14:24:49'),(123,124,1,'206810110012732',NULL,'Meghaninagar','47, Jyoti Darshan Society, Nr. Pooja & Ashirwad Hospital, Meghaninagar, Ahmedabad - 380 016','9372705802','380013082','002068','BKID0002068','2018-01-03 14:24:49','2018-01-03 14:24:49'),(124,125,1,'50710310002696',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(125,126,1,'50710110021055',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-03 14:24:49','2018-01-03 14:24:49'),(126,127,1,'803210110007720',NULL,'VELACHERY','32/3 velachery main road, tamil nadu,chennai - 600042','0','600013034','008032','BKID0008032','2018-01-06 09:54:13','2018-01-06 09:54:13'),(127,128,1,'805410110011869',NULL,NULL,'THAMBARAM,91/A RAJAJI SALAI,TAMBARAM WEST,CHENNAI,600045,TAMIL NADU','0','600013028','008054','BKID0008054','2018-01-06 09:54:13','2018-01-06 09:54:13'),(128,129,1,'805710110002181',NULL,'SRIPERUMBADUR','150/ 1 & 151 /1 BYE-PASS SRIPERUMBUDUR','8122221063','600013035','8057.0','BKID0008057','2018-01-06 09:54:13','2018-01-06 09:54:13'),(129,130,1,'0',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-06 09:54:13','2018-01-06 09:54:13'),(130,131,1,'805710110002173',NULL,'SRIPERUMBADUR','150/ 1 & 151 /1 BYE-PASS SRIPERUMBUDUR','9629630052','600013035','8057.0','BKID0008057','2018-01-06 09:54:13','2018-01-06 09:54:13'),(131,132,1,'50710310002808',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-06 09:54:13','2018-01-06 09:54:13'),(132,133,1,'0',NULL,NULL,NULL,'0','0',NULL,NULL,'2018-01-06 09:54:13','2018-01-06 09:54:13'),(133,134,1,'0',NULL,NULL,NULL,'0','0',NULL,NULL,'2018-01-06 09:54:13','2018-01-06 09:54:13'),(134,135,1,'50710110023548',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-06 09:54:13','2018-01-06 09:54:13'),(135,136,1,'0',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2018-01-06 09:54:13','2018-01-06 09:54:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'EC_1001','Director','Director',NULL,NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31'),(2,'EC_1002','Employee','Employee',NULL,1,'2018-01-03 13:11:31','2018-01-06 11:24:07'),(3,'EC_1003','Workers','Workers',NULL,NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31');
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
INSERT INTO `employee_code_masters` VALUES (1,'Employee','10001','10001',1,NULL,'2018-01-06 09:45:14','2018-01-06 09:45:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,NULL,'Key Account Head',NULL,NULL,'2018-01-03 14:24:10','2018-01-03 14:24:10'),(2,NULL,'Head Projects',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(3,NULL,'Sales & Service engineer',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(4,NULL,'System Admin',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(5,NULL,'Key Account Manager',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(6,NULL,'Commercial Assistant',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(7,NULL,'Head After Sales Service',NULL,NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(8,NULL,'Account Executive',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(9,NULL,'Service & Sales Engineer',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(10,NULL,'TL (Special projects)',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(11,NULL,'TL (New product development)',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(12,NULL,'Quality Engineer',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(13,NULL,'Draughtsman',NULL,NULL,'2018-01-03 14:24:12','2018-01-03 14:24:12'),(14,NULL,'HR & Admin',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(15,NULL,'Lead estimator',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(16,NULL,'Fitter operator',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(17,NULL,'Design Engineer',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(18,NULL,'QA Tech',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(19,NULL,'Expeditor',NULL,NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(20,NULL,'Design Head',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(21,NULL,'Dispatch Team leader',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(22,NULL,'Component Business Manager',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(23,NULL,'Service engineer-East',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(24,NULL,'Commercial Head',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(25,NULL,'I & C Engineer',NULL,NULL,'2018-01-03 14:24:14','2018-01-03 14:24:14'),(26,NULL,'I & C Supervisor',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(27,NULL,'Project Admin',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(28,NULL,'Jr.Quality',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(29,NULL,'TL (Cranes)',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(30,NULL,'OMS & OPD Lead',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(31,NULL,'Project Manager',NULL,NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(32,NULL,'Regional Manager-Regional Sales',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(33,NULL,'Site Engineer',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(34,NULL,'Buyer (Sub cont.& RM)',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(35,NULL,'I&C Technician',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(36,NULL,'Sr.Sales Engineer',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(37,NULL,'Commercial Officer',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(38,NULL,'Service Manager Ops.',NULL,NULL,'2018-01-03 14:24:16','2018-01-03 14:24:16'),(39,NULL,'Store Incharge',NULL,NULL,'2018-01-03 14:24:17','2018-01-03 14:24:17'),(40,NULL,'Service engineer-North',NULL,NULL,'2018-01-03 14:24:17','2018-01-03 14:24:17'),(41,NULL,'Project Estimator',NULL,NULL,'2018-01-03 14:24:17','2018-01-03 14:24:17'),(42,NULL,'SCM Head',NULL,NULL,'2018-01-03 14:24:17','2018-01-03 14:24:17'),(43,NULL,'Manufacturing Manager',NULL,NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18'),(44,NULL,'Project Engineer',NULL,NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18'),(45,NULL,'Store Team leader',NULL,NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18'),(46,NULL,'GET Service',NULL,NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18'),(47,NULL,'Service Manager West',NULL,NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18'),(48,NULL,'Project Manager(North) Med Proj',NULL,NULL,'2018-01-03 14:24:19','2018-01-03 14:24:19'),(49,NULL,'Production TL (Mech)',NULL,NULL,'2018-01-03 14:24:19','2018-01-03 14:24:19'),(50,NULL,'Sales Engineer',NULL,NULL,'2018-01-03 14:24:20','2018-01-03 14:24:20'),(51,NULL,'GET',NULL,NULL,'2018-01-03 14:24:20','2018-01-03 14:24:20'),(52,NULL,'Production Engineer',NULL,NULL,'2018-01-03 14:24:20','2018-01-03 14:24:20'),(53,NULL,'GET Projects',NULL,NULL,'2018-01-03 14:24:20','2018-01-03 14:24:20'),(54,NULL,'TL ( Fixtures& Offshore)',NULL,NULL,'2018-01-03 14:24:21','2018-01-03 14:24:21'),(55,NULL,'Sr.Quality Engineer',NULL,NULL,'2018-01-03 14:24:21','2018-01-03 14:24:21'),(56,NULL,'Project Manager(South) Med Proj',NULL,NULL,'2018-01-03 14:24:21','2018-01-03 14:24:21'),(57,NULL,'Assistant Manager HR',NULL,NULL,'2018-01-03 14:24:21','2018-01-03 14:24:21'),(58,NULL,'QA/Dispatch Tech',NULL,NULL,'2018-01-03 14:24:22','2018-01-03 14:24:22'),(59,NULL,'Service engineer',NULL,NULL,'2018-01-03 14:24:22','2018-01-03 14:24:22'),(60,NULL,'GET Manufacturing',NULL,NULL,'2018-01-03 14:24:22','2018-01-03 14:24:22'),(61,NULL,'I & C Manager',NULL,NULL,'2018-01-03 14:24:22','2018-01-03 14:24:22'),(62,NULL,'Production Technician(Elect.)',NULL,NULL,'2018-01-03 14:24:22','2018-01-03 14:24:22'),(63,NULL,'I & C Technician',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(64,NULL,'Head INDSTHAL',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(65,NULL,'Senior Engineer Quality',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(66,NULL,'ERP Implementation Engineer',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(67,NULL,'Electrician',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(68,NULL,'GET Sales',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(69,NULL,'I&C Head',NULL,NULL,'2018-01-03 14:24:23','2018-01-03 14:24:23'),(70,NULL,'Development Head',NULL,NULL,'2018-01-03 14:24:24','2018-01-03 14:24:24'),(71,NULL,'Director',NULL,NULL,'2018-01-03 14:24:24','2018-01-03 14:24:24'),(72,NULL,'Regional Sales Manager-W&S',NULL,NULL,'2018-01-03 14:24:24','2018-01-03 14:24:24'),(73,NULL,'Sales Admin',NULL,NULL,'2018-01-03 14:24:24','2018-01-03 14:24:24'),(74,NULL,'Stores Executive',NULL,NULL,'2018-01-03 14:24:24','2018-01-03 14:24:24'),(75,NULL,'EA to MD',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(76,NULL,'Production technician(Mech.)',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(77,NULL,'Safety officer',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(78,NULL,'Maintenance executive',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(79,NULL,'IT Manager /Cum Corporate',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(80,NULL,'Buyer (Local & Import)',NULL,NULL,'2018-01-03 14:24:25','2018-01-03 14:24:25'),(81,NULL,'GET I & C',NULL,NULL,'2018-01-03 14:24:26','2018-01-03 14:24:26'),(82,NULL,'HR Executive',NULL,NULL,'2018-01-03 14:24:26','2018-01-03 14:24:26'),(83,NULL,'GET Production',NULL,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(84,NULL,'Jr.Engineer Operations',NULL,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(85,NULL,'Business Development Manager',NULL,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(86,NULL,'Executive Stores & Logistics',NULL,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42'),(87,NULL,'Executive Admin',NULL,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42');
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
  CONSTRAINT `fk_rails_13b4974483` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_d8bb8b3a19` FOREIGN KEY (`employee_gp_id`) REFERENCES `employee_gps` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'EG_1001','A','Grade A Employee','2018-01-03 13:11:31','2018-01-03 13:11:31'),(2,NULL,'MMC1',NULL,'2018-01-03 14:24:10','2018-01-03 14:24:10'),(3,NULL,'MMC2',NULL,'2018-01-03 14:24:10','2018-01-03 14:24:10'),(4,NULL,'JMC3',NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(5,NULL,'JMC1',NULL,'2018-01-03 14:24:11','2018-01-03 14:24:11'),(6,NULL,'JMC2',NULL,'2018-01-03 14:24:13','2018-01-03 14:24:13'),(7,NULL,'JMC4',NULL,'2018-01-03 14:24:15','2018-01-03 14:24:15'),(8,NULL,'JMC 4',NULL,'2018-01-03 14:24:18','2018-01-03 14:24:18');
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
  CONSTRAINT `fk_rails_3246ca44bd` FOREIGN KEY (`joining_checklist_master_id`) REFERENCES `joining_checklist_masters` (`id`),
  CONSTRAINT `fk_rails_e835de41c6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  `carry_forward` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collapse_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_balances_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_balances_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_258306096f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_42e9a9a920` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (1,100,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:45','2018-01-05 15:44:45'),(2,1,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:45','2018-01-05 15:44:45'),(3,2,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:45','2018-01-05 15:44:45'),(4,3,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(5,5,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(6,4,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(7,7,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(8,6,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(9,9,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(10,8,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(11,10,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(12,12,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(13,13,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:46','2018-01-05 15:44:46'),(14,15,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(15,16,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(16,17,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(17,18,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(18,19,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(19,20,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(20,21,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(21,22,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(22,23,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(23,24,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(24,25,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(25,26,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(26,27,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(27,28,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(28,29,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:47','2018-01-05 15:44:47'),(29,30,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(30,31,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(31,32,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(32,33,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(33,34,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(34,35,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(35,36,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(36,37,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(37,38,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(38,39,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(39,40,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(40,41,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(41,42,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(42,43,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(43,44,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(44,45,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:48','2018-01-05 15:44:48'),(45,46,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(46,47,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(47,48,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(48,49,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(49,51,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(50,52,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(51,53,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(52,54,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(53,55,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(54,57,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(55,59,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(56,60,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(57,61,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(58,62,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(59,63,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:49','2018-01-05 15:44:49'),(60,64,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(61,65,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(62,66,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(63,67,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(64,68,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(65,69,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(66,71,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(67,72,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(68,73,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(69,74,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(70,75,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(71,77,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(72,78,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(73,80,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(74,70,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(75,81,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(76,82,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:50','2018-01-05 15:44:50'),(77,83,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(78,84,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(79,85,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(80,86,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(81,89,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(82,79,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(83,87,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(84,88,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(85,90,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(86,91,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(87,92,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(88,94,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(89,93,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(90,95,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(91,96,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(92,97,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:51','2018-01-05 15:44:51'),(93,98,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(94,99,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(95,101,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(96,102,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(97,103,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(98,104,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(99,105,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(100,106,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(101,107,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(102,108,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(103,109,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(104,110,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(105,111,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(106,112,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(107,113,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(108,114,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(109,115,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:52','2018-01-05 15:44:52'),(110,116,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(111,117,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(112,118,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(113,119,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(114,120,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(115,121,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(116,122,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(117,123,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(118,124,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(119,125,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(120,126,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(121,76,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(122,58,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(123,127,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(124,128,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(125,129,7,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:53','2018-01-05 15:44:53'),(126,130,7,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(127,131,7,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(128,100,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(129,1,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(130,2,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(131,3,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(132,5,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(133,4,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(134,7,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(135,6,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(136,9,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(137,8,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(138,10,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(139,12,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(140,13,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:54','2018-01-05 15:44:54'),(141,15,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(142,16,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(143,17,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(144,18,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(145,19,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(146,20,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(147,21,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(148,22,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(149,23,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(150,24,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(151,25,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(152,26,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(153,27,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(154,28,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(155,29,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:55','2018-01-05 15:44:55'),(156,30,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(157,31,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(158,32,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(159,33,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(160,34,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(161,35,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(162,36,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(163,37,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(164,38,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(165,39,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(166,40,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(167,41,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(168,42,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(169,43,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(170,44,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(171,45,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(172,46,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:56','2018-01-05 15:44:56'),(173,47,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(174,48,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(175,49,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(176,51,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(177,52,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(178,53,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(179,54,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(180,55,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(181,57,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(182,59,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(183,60,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(184,61,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(185,62,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(186,63,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(187,64,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:57','2018-01-05 15:44:57'),(188,65,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(189,66,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(190,67,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(191,68,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(192,69,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(193,71,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(194,72,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(195,73,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(196,74,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(197,75,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(198,77,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(199,78,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(200,80,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(201,70,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(202,81,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:58','2018-01-05 15:44:58'),(203,82,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(204,83,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(205,84,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(206,85,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(207,86,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(208,89,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(209,79,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(210,87,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(211,88,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(212,90,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(213,91,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(214,92,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(215,94,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(216,93,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(217,95,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:44:59','2018-01-05 15:44:59'),(218,96,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(219,97,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(220,98,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(221,99,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(222,101,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(223,102,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(224,103,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(225,104,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(226,105,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(227,106,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(228,107,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(229,108,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(230,109,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(231,110,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(232,111,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(233,112,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:00','2018-01-05 15:45:00'),(234,113,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(235,114,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(236,115,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(237,116,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(238,117,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(239,118,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(240,119,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(241,120,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(242,121,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(243,122,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(244,123,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(245,124,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(246,125,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:01','2018-01-05 15:45:01'),(247,126,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(248,76,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(249,58,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(250,127,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(251,128,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(252,129,8,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(253,130,8,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(254,131,8,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(255,100,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(256,1,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(257,2,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(258,3,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(259,5,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(260,4,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(261,7,9,'26.5',NULL,'26.5',NULL,'2018-01-01','2018-12-31',1,'0.0','26.5','0.0','30.0','2018-01-05 15:45:02','2018-01-05 15:45:02'),(262,6,9,'17.0',NULL,'17.0',NULL,'2018-01-01','2018-12-31',1,'0.0','17.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(263,9,9,'9.0',NULL,'9.0',NULL,'2018-01-01','2018-12-31',1,'0.0','9.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(264,8,9,'29.0',NULL,'29.0',NULL,'2018-01-01','2018-12-31',1,'0.0','29.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(265,10,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(266,12,9,'6.5',NULL,'6.5',NULL,'2018-01-01','2018-12-31',1,'0.0','6.5','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(267,13,9,'0.0',NULL,'0.0',NULL,'2018-01-01','2018-12-31',1,'0.0','0.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(268,15,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(269,16,9,'9.0',NULL,'9.0',NULL,'2018-01-01','2018-12-31',1,'0.0','9.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(270,17,9,'13.5',NULL,'13.5',NULL,'2018-01-01','2018-12-31',1,'0.0','13.5','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(271,18,9,'10.0',NULL,'10.0',NULL,'2018-01-01','2018-12-31',1,'0.0','10.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(272,19,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(273,20,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(274,21,9,'14.5',NULL,'14.5',NULL,'2018-01-01','2018-12-31',1,'0.0','14.5','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(275,22,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(276,23,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(277,24,9,'4.5',NULL,'4.5',NULL,'2018-01-01','2018-12-31',1,'0.0','4.5','0.0','30.0','2018-01-05 15:45:03','2018-01-05 15:45:03'),(278,25,9,'5.0',NULL,'5.0',NULL,'2018-01-01','2018-12-31',1,'0.0','5.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(279,26,9,'26.0',NULL,'26.0',NULL,'2018-01-01','2018-12-31',1,'0.0','26.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(280,27,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(281,28,9,'11.0',NULL,'11.0',NULL,'2018-01-01','2018-12-31',1,'0.0','11.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(282,29,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(283,30,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(284,31,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(285,32,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(286,33,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(287,34,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(288,35,9,'15.5',NULL,'15.5',NULL,'2018-01-01','2018-12-31',1,'0.0','15.5','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(289,36,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(290,37,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(291,38,9,'18.0',NULL,'18.0',NULL,'2018-01-01','2018-12-31',1,'0.0','18.0','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(292,39,9,'27.5',NULL,'27.5',NULL,'2018-01-01','2018-12-31',1,'0.0','27.5','0.0','30.0','2018-01-05 15:45:04','2018-01-05 15:45:04'),(293,40,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(294,41,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(295,42,9,'11.5',NULL,'11.5',NULL,'2018-01-01','2018-12-31',1,'0.0','11.5','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(296,43,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(297,44,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(298,45,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(299,46,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(300,47,9,'19.5',NULL,'19.5',NULL,'2018-01-01','2018-12-31',1,'0.0','19.5','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(301,48,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(302,49,9,'7.5',NULL,'7.5',NULL,'2018-01-01','2018-12-31',1,'0.0','7.5','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(303,51,9,'19.0',NULL,'19.0',NULL,'2018-01-01','2018-12-31',1,'0.0','19.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(304,52,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:05','2018-01-05 15:45:05'),(305,53,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(306,54,9,'17.5',NULL,'17.5',NULL,'2018-01-01','2018-12-31',1,'0.0','17.5','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(307,55,9,'14.0',NULL,'14.0',NULL,'2018-01-01','2018-12-31',1,'0.0','14.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(308,57,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(309,59,9,'17.5',NULL,'17.5',NULL,'2018-01-01','2018-12-31',1,'0.0','17.5','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(310,60,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(311,61,9,'27.0',NULL,'27.0',NULL,'2018-01-01','2018-12-31',1,'0.0','27.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(312,62,9,'5.5',NULL,'5.5',NULL,'2018-01-01','2018-12-31',1,'0.0','5.5','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(313,63,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(314,64,9,'29.5',NULL,'29.5',NULL,'2018-01-01','2018-12-31',1,'0.0','29.5','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(315,65,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(316,66,9,'16.0',NULL,'16.0',NULL,'2018-01-01','2018-12-31',1,'0.0','16.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(317,67,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(318,68,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(319,69,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(320,71,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:06','2018-01-05 15:45:06'),(321,72,9,'12.0',NULL,'12.0',NULL,'2018-01-01','2018-12-31',1,'0.0','12.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(322,73,9,'26.0',NULL,'26.0',NULL,'2018-01-01','2018-12-31',1,'0.0','26.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(323,74,9,'19.0',NULL,'19.0',NULL,'2018-01-01','2018-12-31',1,'0.0','19.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(324,75,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(325,77,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(326,78,9,'25.5',NULL,'25.5',NULL,'2018-01-01','2018-12-31',1,'0.0','25.5','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(327,80,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(328,70,9,'7.0',NULL,'7.0',NULL,'2018-01-01','2018-12-31',1,'0.0','7.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(329,81,9,'5.0',NULL,'5.0',NULL,'2018-01-01','2018-12-31',1,'0.0','5.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(330,82,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(331,83,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(332,84,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(333,85,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(334,86,9,'7.0',NULL,'7.0',NULL,'2018-01-01','2018-12-31',1,'0.0','7.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(335,89,9,'9.0',NULL,'9.0',NULL,'2018-01-01','2018-12-31',1,'0.0','9.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(336,79,9,'7.0',NULL,'7.0',NULL,'2018-01-01','2018-12-31',1,'0.0','7.0','0.0','30.0','2018-01-05 15:45:07','2018-01-05 15:45:07'),(337,87,9,'7.5',NULL,'7.5',NULL,'2018-01-01','2018-12-31',1,'0.0','7.5','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(338,88,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(339,90,9,'21.0',NULL,'21.0',NULL,'2018-01-01','2018-12-31',1,'0.0','21.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(340,91,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(341,92,9,'4.5',NULL,'4.5',NULL,'2018-01-01','2018-12-31',1,'0.0','4.5','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(342,94,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(343,93,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(344,95,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(345,96,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(346,97,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(347,98,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(348,99,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(349,101,9,'8.0',NULL,'8.0',NULL,'2018-01-01','2018-12-31',1,'0.0','8.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(350,102,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(351,103,9,'18.5',NULL,'18.5',NULL,'2018-01-01','2018-12-31',1,'0.0','18.5','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(352,104,9,'5.5',NULL,'5.5',NULL,'2018-01-01','2018-12-31',1,'0.0','5.5','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(353,105,9,'21.0',NULL,'21.0',NULL,'2018-01-01','2018-12-31',1,'0.0','21.0','0.0','30.0','2018-01-05 15:45:08','2018-01-05 15:45:08'),(354,106,9,'5.0',NULL,'5.0',NULL,'2018-01-01','2018-12-31',1,'0.0','5.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(355,107,9,'28.0',NULL,'28.0',NULL,'2018-01-01','2018-12-31',1,'0.0','28.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(356,108,9,'7.0',NULL,'7.0',NULL,'2018-01-01','2018-12-31',1,'0.0','7.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(357,109,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(358,110,9,'5.0',NULL,'5.0',NULL,'2018-01-01','2018-12-31',1,'0.0','5.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(359,111,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(360,112,9,'23.0',NULL,'23.0',NULL,'2018-01-01','2018-12-31',1,'0.0','23.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(361,113,9,'5.0',NULL,'5.0',NULL,'2018-01-01','2018-12-31',1,'0.0','5.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(362,114,9,'12.0',NULL,'12.0',NULL,'2018-01-01','2018-12-31',1,'0.0','12.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(363,115,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(364,116,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(365,117,9,'27.5',NULL,'27.5',NULL,'2018-01-01','2018-12-31',1,'0.0','27.5','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(366,118,9,'21.5',NULL,'21.5',NULL,'2018-01-01','2018-12-31',1,'0.0','21.5','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(367,119,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(368,120,9,'28.0',NULL,'28.0',NULL,'2018-01-01','2018-12-31',1,'0.0','28.0','0.0','30.0','2018-01-05 15:45:09','2018-01-05 15:45:09'),(369,121,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(370,122,9,'30.0',NULL,'30.0',NULL,'2018-01-01','2018-12-31',1,'0.0','30.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(371,123,9,'15.0',NULL,'15.0',NULL,'2018-01-01','2018-12-31',1,'0.0','15.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(372,124,9,'17.0',NULL,'17.0',NULL,'2018-01-01','2018-12-31',1,'0.0','17.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(373,125,9,'6.0',NULL,'6.0',NULL,'2018-01-01','2018-12-31',1,'0.0','6.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(374,126,9,'15.5',NULL,'15.5',NULL,'2018-01-01','2018-12-31',1,'0.0','15.5','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(375,76,9,'3.0',NULL,'3.0',NULL,'2018-01-01','2018-12-31',1,'0.0','3.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(376,58,9,'4.5',NULL,'4.5',NULL,'2018-01-01','2018-12-31',1,'0.0','4.5','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(377,127,9,'2.5',NULL,'2.5',NULL,'2018-01-01','2018-12-31',1,'0.0','2.5','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(378,128,9,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(379,129,9,'2.0',NULL,'2.0',NULL,'2018-01-01','2018-12-31',1,'0.0','2.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(380,130,9,'0.0',NULL,'0.0',NULL,'2018-01-01','2018-12-31',1,'0.0','0.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10'),(381,131,9,'0.0',NULL,'0.0',NULL,'2018-01-01','2018-12-31',1,'0.0','0.0','0.0','30.0','2018-01-05 15:45:10','2018-01-05 15:45:10');
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
  `employee_leav_balance_id` int(11) DEFAULT NULL,
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
-- Table structure for table `employee_location_histories`
--

DROP TABLE IF EXISTS `employee_location_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_location_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_location_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_e116b56b9a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_location_histories`
--

LOCK TABLES `employee_location_histories` WRITE;
/*!40000 ALTER TABLE `employee_location_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_location_histories` ENABLE KEYS */;
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
-- Table structure for table `employee_plans`
--

DROP TABLE IF EXISTS `employee_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `meeting_with` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meeting_agenda` text COLLATE utf8_unicode_ci,
  `confirm` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `plan_reason_master_id` int(11) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_plans_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_ce3a555f40` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_plans`
--

LOCK TABLES `employee_plans` WRITE;
/*!40000 ALTER TABLE `employee_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_plans` ENABLE KEYS */;
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
  `exit_interview_status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_resignations_on_employee_id` (`employee_id`),
  KEY `index_employee_resignations_on_leaving_reason_id` (`leaving_reason_id`),
  CONSTRAINT `fk_rails_934242d84f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b49e6901c2` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_resignations`
--

LOCK TABLES `employee_resignations` WRITE;
/*!40000 ALTER TABLE `employee_resignations` DISABLE KEYS */;
INSERT INTO `employee_resignations` VALUES (1,126,'2018-01-12','abc',NULL,NULL,'6','2018-01-18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Pending',1,126,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,0,NULL,NULL,'2018-01-06 00:00:00',NULL,'2018-01-06 12:42:04','2018-01-06 12:42:04');
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
INSERT INTO `employee_types` VALUES (1,'ET_1001','Intern','Employee is an intern',NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31'),(2,'ET_1002','Freelancer','Freelancer',NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31'),(3,'ET_1003','Probation','Permanent Employee',NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31'),(4,'ET_1004','Resigned','Resigned',NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31'),(5,'ET_1005','Confirmed','Confirmed Employee',NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31');
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
  `sub_department_id` int(11) DEFAULT NULL,
  `employee_signature_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_file_size` int(11) DEFAULT NULL,
  `employee_signature_updated_at` datetime DEFAULT NULL,
  `emergency_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  KEY `index_employees_on_company_id` (`company_id`),
  KEY `index_employees_on_company_location_id` (`company_location_id`),
  KEY `index_employees_on_department_id` (`department_id`),
  KEY `index_employees_on_employee_code_master_id` (`employee_code_master_id`),
  CONSTRAINT `fk_rails_0025f65a97` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_0e6f1ceeeb` FOREIGN KEY (`employee_code_master_id`) REFERENCES `employee_code_masters` (`id`),
  CONSTRAINT `fk_rails_0f20a81443` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_44cfcfba34` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_6242475258` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_7fb9aac7a3` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `fk_rails_8587c7b912` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_aff313c1b7` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_c3ceaae2da` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  CONSTRAINT `fk_rails_eb26439f43` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'15126','EMP0000001',NULL,'Mr.','ABHIJEET','','TIWARI','1987-06-02','Male','9372705838','0','0','abhijeet@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456789','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2018-01-03 14:23:16','2018-01-06 09:55:07',NULL,NULL,NULL,NULL),(2,'11115','EMP0000002',NULL,'Mr.','AJAY','DINESH','RAVAL','1986-10-18','Male','9372705810','0','0','ajay.r@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456790','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',126,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:17','2018-01-06 09:55:07',NULL,NULL,NULL,NULL),(3,'15193','EMP0000003',NULL,'Mr.','AJAYPAL','CHARANJIT','SPALL','1991-02-22','Male','0','0','0','ajay.spall@sparkline.co.in','','H. No 144 Moh. Guru Nanak Pura, Ward no 7 Bassi Pathana, Feteharh Sahib ,Punjab',1,2,2,'punjab',140412,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456791','ABCDE12345B','','Unmarried',2,NULL,1,7,'NA','NA','Active',7,NULL,1,5,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:17','2018-01-06 09:55:07',NULL,NULL,NULL,NULL),(4,'14121','EMP0000004',NULL,'Mr.','AJIT','VILAS','MAHABARE','1986-05-17','Male','9372705913','0','0','ajit.m@sparkline.co.in','','MAHAJAN ALI, RAVIWAR PETH, JUNNAR 410502',1,1,1,'JUNNAR',410502,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456792','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',115,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:07',NULL,NULL,NULL,NULL),(5,'7101','EMP0000005',NULL,'Mr.','AJIT','NANDKUMAR','MEDHEKAR','1977-01-19','Male','9372705905','0','0','ajit@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456793','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:07',NULL,NULL,NULL,NULL),(6,'15145','EMP0000006',NULL,'Mr.','AMIT','BHAIRU','BELGAONKAR','1994-01-31','Male','0','0','0','amit.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456794','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',27,NULL,1,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(7,'9108','EMP0000007',NULL,'Mr.','AMIT','ARUNKUMAR','MISHRA','1985-08-27','Male','9372705902','0','0','amit.mishra@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456795','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(8,'10104','EMP0000008',NULL,'Mr.','AMIT','','SHARMA','1986-03-01','Male','9386727343','0','0','account.jsr@sparkline.co.in','','Q.NO.-18/X,CROSS ROAD NO.-22, SIDHGORA, PO- AGRICO,PS- SIDHGORA',1,3,3,'JAMSHEDPUR',831009,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456796','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',27,NULL,1,4,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(9,'15177','EMP0000009',NULL,'Mr.','AMIT KUMAR','GOKUL','NAYAK','1990-04-19','Male','9304066621','0','0','amit.nayak@sparkline.co.in','','K2-6,CROSS ROAD NO.-1,NEAR RING ROAD,TELCO COLONY ,PO- TELCO,PS-TELCO',1,3,3,'JAMSHEDPUR',831004,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456797','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',7,NULL,1,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:18','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(10,'12103','EMP0000010',NULL,'Mr.','AMOL','ASHOK','JAGTAP','1983-11-20','Male','9372705827','0','0','amol.j@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456798','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(11,'12106','EMP0000011',NULL,'Mr','AMOL','NEMINATH','PATIL','1990-08-29','Male','9372705830','0','0','amol.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456799','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',48,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-08 15:12:22',NULL,NULL,NULL,NULL),(12,'15181','EMP0000012',NULL,'Mr.','ANIKET','BABASO','PATIL','1992-06-15','Male','9325609620','0','0','aniket.patil@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456800','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',76,52,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(13,'15174','EMP0000013',NULL,'Mr','Anil','Rajkumar','Gosavi','1988-08-17','Male','0','0','0','anil.g@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456801','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',32,22,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-08 15:12:22',NULL,NULL,NULL,NULL),(14,'15152','EMP0000014',NULL,'Mr','Anirudh','Vinubhai','Savaliya','1985-06-25','Male','9512750013','0','0','anirudh.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456802','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',25,NULL,1,6,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-08 15:12:22',NULL,NULL,NULL,NULL),(15,'9102','EMP0000015',NULL,'Mr.','ANKUSH','MOHAN','VEDPATHAK','1984-12-29','Male','0','0','0','ankush.v@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456803','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(16,'15178','EMP0000016',NULL,'Mr.','ARIF','SHARIF','SYED','1989-04-01','Male','7812045457','0','0','arif.s@sparkline.co.in','','No,58-15/124/3 Sri Sai resedency,Shanthi Nagar,NED Kotha Road',1,4,4,'Vizag',530009,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456804','ABCDE12345B','','Unmarried',3,NULL,1,8,'NA','NA','Active',7,NULL,1,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-08 15:12:22',NULL,NULL,NULL,NULL),(17,'6203','EMP0000017',NULL,'Mr.','ASHOK','','KADAM','1963-06-01','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456805','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(18,'15172','EMP0000018',NULL,'Mr.','ASHVINI','VASANT','NALAWADE','1992-06-06','Male','0','0','0','ashvini.n@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456806','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',10,22,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:08',NULL,NULL,NULL,NULL),(19,'10211','EMP0000019',NULL,'Mr.','AVINASH','KISAN','PAWAR','1984-01-09','Male','9372705836','0','0','sheela@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456807','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',74,7,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(20,'11206','EMP0000020',NULL,'Mr.','BABAN','KESHAVRAO','BIRADAR','1983-03-03','Male','9372705911','0','0','harish.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456808','ABCDE12345B','','Married',8,NULL,1,7,'NA','NA','Active',52,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(21,'15130','EMP0000021',NULL,'Mr.','BAHUBALI','ASHOK','GOTURE','1986-01-12','Male','0','0','0','bahubali.g@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456809','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(22,'9101','EMP0000022',NULL,'Mr.','BALAGOUDA','ANNAGOUDA','PATIL','1981-01-07','Male','9372705906','0','0','b.patil@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456810','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',126,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:20','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(23,'5108','EMP0000023',NULL,'Mr.','BALAJI','','UMATE','1974-06-01','Male','9372705806','0','0','balaji.u@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456811','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(24,'5205','EMP0000024',NULL,'Mr.','BALASAHEB','SHRIHARI','PAVALE','1960-06-02','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456812','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(25,'15132','EMP0000025',NULL,'Mr.','BHAVESH','RAMESH','SHIRODE','1990-04-15','Male','9325882324','0','0','bhavesh@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456813','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(26,'15117','EMP0000026',NULL,'Mr.','BISWAJIT','HEMANTKUMAR','GHOSH','1989-02-21','Male','8798083633','0','0','biswajit.g@sparkline.co.in','','VILL-POST OFFICE-CHITRESHWAR,PS- BAHARAGORA, DIST-EAST SINGHBHUM',1,3,3,'BAHARAGORA',832101,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456814','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',7,NULL,1,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:09',NULL,NULL,NULL,NULL),(27,'8101','EMP0000027',NULL,'Mr.','CHINTAMANI','SHIVAJIRAO','DHAMAL','1983-06-07','Male','9372705813','0','0','chintamani@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456815','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',126,NULL,1,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(28,'15156','EMP0000028',NULL,'Mr.','DAMODAR','GANSING','PATEL','1985-03-20','Male','7410001210','0','0','damodar.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456816','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(29,'5203','EMP0000029',NULL,'Mr.','DASHARATH','','LOANKAR','1979-04-22','Male','9372705814','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456817','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',30,96,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(30,'10106','EMP0000030',NULL,'Mr.','DATTA','DINKAR','BIRAMANE','1984-03-16','Male','9372705807','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456818','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(31,'10214','EMP0000031',NULL,'Mr.','DHARMARAJ','PANDURANG','PAWAR','1985-03-20','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456819','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',52,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:21','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(32,'7103','EMP0000032',NULL,'Mr.','DILIP','VITHAL','LOHAR','1962-07-25','Male','0','0','0','lohar@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456820','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(33,'5104','EMP0000033',NULL,'Mr.','DILIP','','LONKAR','1980-12-29','Male','9372705811','0','0','dilip@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456821','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(34,'14124','EMP0000034',NULL,'Mr.','DILLIGANESH','GURUNATHAN P','','1991-03-26','Male','9543845457','0','0','ganesh.g@sparkline.co.in','','No 73 Natham Vi,Panjetty Po, Ponneri Tk',1,5,5,'Chennai',601204,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456822','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',88,NULL,1,3,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(35,'15155','EMP0000035',NULL,'Mr.','DIPAK','MAHADEO','RAJURKAR','1990-05-22','Male','7410001204','0','0','dipak.r@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456823','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(36,'15123','EMP0000036',NULL,'Mr.','DIPENDRA','RAMESHCHANDRA','KANT','1991-05-05','Male','7428224494','0','0','dipendra.k@sparkline.co.in','','H.No 1, Baghani, Sanra Malla, Nainital',1,6,6,'Uttrakhand',263159,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456824','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',2,NULL,1,5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(37,'9104','EMP0000037',NULL,'Mr.','EAKNATH','DATTU','KADAM','1970-05-20','Male','9372705820','0','0','kadam@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456825','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-06 09:55:10',NULL,NULL,NULL,NULL),(38,'15148','EMP0000038',NULL,'Mr.','ELANGOVAN','','BOOPALAN','1991-09-28','Male','8939645458','0','0','elangovan.b@sparkline.co.in','','No 8A, Vijayalakshmi Nagar,Kallikuppam,Ambatoore',1,5,5,'Chennai',600053,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456826','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',7,NULL,1,3,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:22','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(39,'13102','EMP0000039',NULL,'Mr.','GAJENDER','SATPAL SINGH','SINGH','1989-05-01','Male','7428224492','0','0','account.delhi@sparkline.co.in','','H. No 182 Villgae Sevli Tehcil Hodal, Distt. Palwal',1,7,7,'Hodal',121105,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456827','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',27,NULL,1,5,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(40,'9110','EMP0000040',NULL,'Mr.','GANESH','PANDURANG','DHAMAL','1985-09-03','Male','9372705818','0','0','ganesh.d@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456828','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',52,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(41,'6204','EMP0000041',NULL,'Mr.','GANESH','MARUTI','MANDHARE','1981-01-28','Male','0','0','0','sheela@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456829','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(42,'14120','EMP0000042',NULL,'Mr.','GANESH KUMAR','ULAGANATHAN','','1990-09-02','Male','9962099178','0','0','ganesh.k@sparkline.co.in','','No.3496 South 2 nd St,Pudhukottai',1,5,8,'Pudhukottai',622001,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden ','123456830','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',102,98,1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(43,'5102','EMP0000043',NULL,'Mr.','GAUTAM','','DURAPHE','1974-08-12','Male','9372705819','0','0','gautam@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456831','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',27,NULL,1,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(44,'5106','EMP0000044',NULL,'Mr.','GIRIJAPRASAD','','SETHA','1973-12-03','Male','9372705822','0','0','girija.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456832','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(45,'7202','EMP0000045',NULL,'Mr.','GORAKSHNATH','KHANDU','DHAGE','1977-03-15','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456833','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(46,'6202','EMP0000046',NULL,'Mr.','HARIRAM','DNYANOBA','BOBADE','1983-05-05','Male','0','0','0','harish.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456834','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',52,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:23','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(47,'10113','EMP0000047',NULL,'Mr.','HEMANT','RAMDULARE','KUMAR','1988-03-15','Male','7428224497','0','0','hemant.k@sparkline.co.in','','Village- Balkaranpur, Soraon - Allahabad',1,8,9,'Allahabad',212502,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456835','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',7,NULL,1,5,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(48,'12104','EMP0000048',NULL,'Mr.','JAMIR','CHAND','SHAIKH','1982-05-27','Male','9372705823','0','0','jamir.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456836','ABCDE12345B','','Married',4,NULL,1,8,'NA','NA','Active',126,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(49,'15187','EMP0000049',NULL,'Mr.','JANANTIK','PIYUSHBHAI','TRIVEDI','1984-11-01','Male','0','0','0','janantik.t@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456837','ABCDE12345B','','Married',7,NULL,1,7,'NA','NA','Active',98,NULL,1,6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(50,'15108','EMP0000050',NULL,'Mr.','Jaykumar','BHARATH','Chougale','1992-12-03','Male','0','0','0','jaykumar.c@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456838','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:11',NULL,NULL,NULL,NULL),(51,'9105','EMP0000051',NULL,'Mr.','JAYPRAKASH','BHIMRAO','DABHADE','1983-07-23','Male','9372705831','0','0','jayprakash@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456839','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(52,'8105','EMP0000052',NULL,'Mr.','JEEVAN','S','','1987-04-21','Male','9372705815','0','0','jeevan@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456840','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(53,'15166','EMP0000053',NULL,'Mr.','JOSAN PRAJAI PAUL P','','','1988-10-04','Male','8939645450','0','0','josan.p@sparkline.co.in','','5/26 , B7, Prakash Street, Manavizhai, Vazhukamparai, Sucindrum Post, Kanyakumari',1,5,10,'NAGERCOIL',629704,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456841','ABCDE12345B','','Married',3,NULL,1,9,'NA','NA','Active',63,25,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-08 15:12:24',NULL,NULL,NULL,NULL),(54,'15122','EMP0000054',NULL,'Miss.','KAVITA','RAMDAS','HURPADE','1992-08-23','Female','0','0','0','kavita.h@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456842','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',48,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(55,'10108','EMP0000055',NULL,'Mr.','KEDAR','VISHWAMBAR','CHANDRAJENA','1983-05-02','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456843','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(56,'15138','EMP0000056',NULL,'Mr.','KETAN','CHANDRAKANT','KHOMANE','1993-12-23','Male','9372705835','0','0','ketan.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456844','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',2,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(57,'10105','EMP0000057',NULL,'Mr.','KIRAN','SHIVAJI','JADHAV','1984-10-10','Male','0','0','0','kiran.j@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456845','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',27,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(58,'15200','EMP0000058',NULL,'Mr.','Krunal','','Agarkar','1992-10-28','Male','0','0','0','krunal.a@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456846','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(59,'15131','EMP0000059',NULL,'Mr.','KUSHAL','MAHENDRA KUMAR','JAIN','1987-11-10','Male','9372705829','0','0','kushal.j@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456847','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(60,'5107','EMP0000060',NULL,'Mr.','MADHUKAR','','SHEDGE','1974-07-04','Male','9372705904','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456848','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:12',NULL,NULL,NULL,NULL),(61,'13105','EMP0000061',NULL,'Mr.','MANOJ','TALAKHU RAM','KUMAR','1983-06-25','Male','7428224498','0','0','manoj.kumar@sparkline.co.in','','H.No 28 Village-Bakiya Post Office-Sanjarpur- Nizamabad',1,8,11,'Azamgarh',276206,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456849','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',2,NULL,1,5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(62,'15195','EMP0000062',NULL,'Mr.','MOHAMMED MUBARAK','SABIR ALI','','1993-07-05','Male','0','0','0','datta.b@sparkline.co.in','','No 271,Ganesh Nagar,Arikkambedu,Chennai',1,5,12,'Chennai',600064,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456850','ABCDE12345B','','Unmarried',8,NULL,1,8,'NA','NA','Active',96,NULL,1,3,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-08 15:12:25',NULL,NULL,NULL,NULL),(63,'12105','EMP0000063',NULL,'Mr.','NARENDRA','VASANT','MANGAVE','1991-06-06','Male','9372705828','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456851','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:25','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(64,'15105','EMP0000064',NULL,'Miss.','NEHA','MILAN','TANK','1992-11-26','Female','0','0','0','neha.t@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456852','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',48,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:26','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(65,'15167','EMP0000065',NULL,'Mr.','NIKHIL','RAMESH','GOWDA','1992-03-24','Male','7406842424','0','0','nikhil.g@sparkline.co.in','','No 4, Saibaba nilaya, Krishna Moorthy Laayout, Ganigarapalaya',1,9,13,'Banglore',560062,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456853','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',98,NULL,1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:26','2018-01-08 15:12:25',NULL,NULL,NULL,NULL),(66,'15150','EMP0000066',NULL,'Mr.','NILAMKUMAR','VASANTRAO','WAGHMODE','1987-05-08','Male','7410001203','0','0','nilamkumar.w@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456854','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',2,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:26','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(67,'15154','EMP0000067',NULL,'Mr.','NIRMALKUMAR','','MANIVANNAN','1993-12-12','Male','0','0','0','nirmal.m@sparkline.co.in','','NO.580,MIG,1ST MAIN ROAD,MATHUR MMDA,CHENNAI',1,10,5,'CHENNAI',600068,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456855','ABCDE12345B','','Unmarried',9,NULL,1,7,'NA','NA','Active',53,25,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:26','2018-01-08 15:12:25',NULL,NULL,NULL,NULL),(68,'10212','EMP0000068',NULL,'Mr.','NITIN','HARIBHAU','SHITOLE','1984-01-13','Male','9372705908','0','0','nitin.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456856','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(69,'15192','EMP0000069',NULL,'Mr.','OMKAR','SUNIL','RAVAN','1995-04-05','Male','7410001201','0','0','omkar.r@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456857','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',2,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-06 09:55:13',NULL,NULL,NULL,NULL),(70,'15185','EMP0000070',NULL,'Mr.','PARTHIBAN','RAJENDRAN','','1984-08-30','Male','0','0','0','parthiban.r@sparkline.co.in','','s/o V.Rajendiran NO:55 pall street ,pennattagaram (post & village) vandavasi(tk) Thiruvannamalai (dt)',1,5,14,'KANCHIPURAM',604406,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456858','ABCDE12345B','','Unmarried',10,NULL,1,7,'NA','NA','Active',53,25,1,2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-08 15:12:25',NULL,NULL,NULL,NULL),(71,'6205','EMP0000071',NULL,'Mr.','POPAT','NATHA','SONAWANE','1984-08-30','Male','0','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456859','ABCDE12345B','','Married',1,NULL,1,NULL,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(72,'15171','EMP0000072',NULL,'Mr.','PRABHAKAR','MAHADEV','REDEKAR','1993-11-05','Male','9372705833','0','0','prabhakar.r@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456860','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(73,'15134','EMP0000073',NULL,'Mr.','PRADEEP','','GUPTA','1988-12-20','Male','0','0','0','account.jsr@sparkline.co.in','','H.NO.-L4/4,ROAD NO.-14,NEAR RAM MANDIR, PO-TELCO',1,3,3,'JAMSHEDPUR',831004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456861','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',7,NULL,1,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:27','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(74,'101','EMP0000074',NULL,'Mr.','PRADNYA','VIKRANT','THIPASE','1977-02-16','Male','9386727342','0','0','sheela@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456862','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(75,'13108','EMP0000075',NULL,'Mr.','PRAFUL','MURLIDHAR','WALUNJKAR','1983-03-30','Male','0','0','0','praful.w@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456863','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',48,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(76,'15199','EMP0000076',NULL,'Mr.','PRAMOD','','PATIL','1991-05-07','Male','9372705910','0','0','pramod.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456864','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',52,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(77,'14119','EMP0000077',NULL,'Mr.','PRASANDH','SANTHAKUMAR','','1992-08-30','Male','9372705826','0','0','prasandh.s@sparkline.co.in','','No 4/569, Kalaivanar Nagar,Gorimedu,Pondicherry',1,5,15,'Pondicherry',605006,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456865','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',96,NULL,1,3,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-08 15:12:26',NULL,NULL,NULL,NULL),(78,'15106','EMP0000078',NULL,'Mr.','PRASHANT','GUNDAPPA','SHABADI','1979-12-08','Male','9376525459','0','0','prashant.shabadi@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456866','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:14',NULL,NULL,NULL,NULL),(79,'15186','EMP0000079',NULL,'Mr.','PRAVEENKUMAR','SOMAN','','1991-04-08','Male','9372705832','0','0','pravinkumar.s@sparkline.co.in','','163, west street, Menangudi',1,5,16,'Nannilam taluk',609608,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456867','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',53,25,1,2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-08 15:12:26',NULL,NULL,NULL,NULL),(80,'8102','EMP0000080',NULL,'Mr.','PRAVIN','DADASO','JAGTAP','1982-05-31','Male','0','0','0','pravin@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456868','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',23,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(81,'15139','EMP0000081',NULL,'Mr.','RAGHAVENDRA','BHEEMARAO','KULKARNI','1987-06-10','Male','3972705812','0','0','raghavendra.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456869','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(82,'9106','EMP0000082',NULL,'Mr.','RAHUL','','JALKE','1989-11-08','Male','0','0','0','rahul.j@sparkerp.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456870','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',7,NULL,1,6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-08 15:12:26',NULL,NULL,NULL,NULL),(83,'15191','EMP0000083',NULL,'Mr.','RAHUL','JAGADISH','RAYKAR','1995-07-01','Male','9727651695','0','0','balaji.u@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456871','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(84,'102','EMP0000084',NULL,'Mr.','RAJU','','KONDHARE','1967-06-01','Male','0','0','0','rajendra.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456872','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:28','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(85,'6206','EMP0000085',NULL,'Mr.','RAJU','ANANDRAO','SABLE','1973-05-10','Male','9372705808','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456873','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(86,'15183','EMP0000086',NULL,'Mr.','ROSHAN','DILIP','JADHAV','1995-02-15','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456874','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(87,'15169','EMP0000087',NULL,'Mr.','SACHIN','BABAN','MALAGE','1986-06-01','Male','0','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456875','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(88,'95102','EMP0000088',NULL,'Mr.','SADANAND','','BORSE','1966-10-24','Male','0','0','0','sadanand@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456876','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-06 09:55:15',NULL,NULL,NULL,NULL),(89,'15175','EMP0000089',NULL,'Mr.','SAI KRISHNA','','','1988-02-29','Male','0','0','0','sai.krishna@sparkline.co.in','','S/o:Manikeswar rao,Door no-23-7-34,Kurpam market ,Visakhapatnam',1,4,17,'Visakhapatnam',530001,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456877','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',53,25,1,2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-08 15:12:26',NULL,NULL,NULL,NULL),(90,'15144','EMP0000090',NULL,'Mr.','SANDEEP','','PANSARE','1988-06-18','Male','9372705803','0','0','sandeep@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456878','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',115,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:29','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(91,'10107','EMP0000091',NULL,'Mr.','SANJAY','DATTATRAY','AMALE','1971-01-03','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456879','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(92,'15188','EMP0000092',NULL,'Mr.','SANKALP','VENKATESH','SARNOBAT','1994-08-18','Male','0','0','0','sankalp.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456880','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(93,'15135','EMP0000093',NULL,'Mr.','SANTOSH','','KUMAR','1992-02-02','Male','0','0','0','account.jsr@sparkline.co.in','','K-3/106,ROAD NO -15, TELCO, NEAR RAM MANDIR,PO- TELCO',1,3,3,'JAMSHEDPUR',831004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456881','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-08 15:12:26',NULL,NULL,NULL,NULL),(94,'10210','EMP0000094',NULL,'Mr.','SANTOSH','MARUTI','MANDHARE','1983-07-03','Male','0','0','0','narendra.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456882','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(95,'7104','EMP0000095',NULL,'Mr.','SAROJ','ULHAS','PATIL','1966-06-24','Male','9386727341','0','0','saroj@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456883','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',2,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(96,'8103','EMP0000096',NULL,'Mr.','SATHISHA','','M.R','1986-06-08','Male','0','0','0','sathisha@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456884','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:30','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(97,'2101','EMP0000097',NULL,'Mr.','SHIVAJI','','UNDRE','1968-08-15','Male','7410001202','0','0','shivaji@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456885','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-06 09:55:16',NULL,NULL,NULL,NULL),(98,'15127','EMP0000098',NULL,'Mr.','SIDDHARTH','SHITALKUMAR','DOSHI','1992-05-13','Male','9372705816','0','0','siddharth@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456886','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',126,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-06 09:55:17',NULL,NULL,NULL,NULL),(99,'15182','EMP0000099',NULL,'Mr.','SILACHI','ASHOK','CHOURASIA','1990-06-25','Male','9372705805','0','0','silachi.c@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456887','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-06 09:55:17',NULL,NULL,NULL,NULL),(100,'15194','EMP0000100',NULL,'Mr.','SOUNDHAR','ANNADURAI','','2017-11-29','Male','9372705804','0','0','josan.p@sparkline.co.in','','NO.314,Therkumedu village ,Gudalur post,polur taluk',1,5,14,'Arni',606907,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456888','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',53,25,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-08 15:12:27',NULL,NULL,NULL,NULL),(101,'15168','EMP0000101',NULL,'Mr.','SUBOOR','','PILOT','1994-08-16','Male','7410001208','0','0','suboor.p@sparkline.co.in','','H.No 394 Tauri 13 Biswa, Ghaziabad',1,8,18,'Ghaziabad',254304,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456889','ABCDE12345B','','Unmarried',3,NULL,1,8,'NA','NA','Active',1,98,1,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-06 09:55:17',NULL,NULL,NULL,NULL),(102,'14110','EMP0000102',NULL,'Mr.','SUDHARSHAN','MEGANATHAN','','1988-03-20','Male','0','0','0','sudharshan.m@sparkline.co.in','','No,308 Mettu Colony Via, Kizhpudhupakkam,Cheyyaru',1,5,14,'Cheyyaru',604407,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456890','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',98,NULL,1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-08 15:12:27',NULL,NULL,NULL,NULL),(103,'13106','EMP0000103',NULL,'Mr.','SUMIT','SURESH','PURI','1993-04-22','Male','7428224495','0','0','sumit.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456891','ABCDE12345B','','Married',2,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:31','2018-01-06 09:55:17',NULL,NULL,NULL,NULL),(104,'15189','EMP0000104',NULL,'Mr.','SUMOG','SANGAM','PATIL','1995-03-14','Male','8144645457','0','0','sumog.p@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456892','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:17',NULL,NULL,NULL,NULL),(105,'15143','EMP0000105',NULL,'Mr.','SURAJ','R','KONDARE','1993-05-01','Male','0','0','0','suraj.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456893','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',96,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(106,'15197','EMP0000106',NULL,'Mr.','SURAJ','','SALUNKHE','1996-04-16','Male','0','0','0','suraj.salunkhe@sparkline.co.in','','A/P. Bhade ,Tal: khandala,Dist: Satara',1,1,1,'Satara',415526,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456894','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',52,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(107,'11110','EMP0000107',NULL,'Mr.','SURESH','','RATHORE','1988-11-15','Male','7410001205','0','0','suresh.r@sparkline.co.in','','H. No 113 Near JCB Chowk,Sanjay Colony , Ballabgarh',1,7,19,'Faridabad',121004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456895','ABCDE12345B','','Married',5,NULL,1,7,'NA','NA','Active',2,NULL,1,5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(108,'15184','EMP0000108',NULL,'Mr.','TAPAS','PRAKASH','KULKARNI','1989-09-05','Male','0','0','0','tapas.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456896','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',126,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(109,'10109','EMP0000109',NULL,'Mr.','TATYABHAU','NIVRUTTI','GUND','1983-06-09','Male','7428224493','0','0','gund.t@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456897','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:32','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(110,'15159','EMP0000110',NULL,'Mr.','UMESH','GOPAL','MALVIYA','1991-10-02','Male','9372705801','0','0','pipavav@sparkline.co.in','','RBII 330 A, Near Railway hospital,new katni',1,11,20,'katni',483501,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456898','ABCDE12345B','','Unmarried',3,NULL,1,7,'NA','NA','Active',53,25,1,6,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:33','2018-01-08 15:12:27',NULL,NULL,NULL,NULL),(111,'11208','EMP0000111',NULL,'Mr.','VAIBHAV','JAGANNATH','BONDRE','1986-06-01','Male','9372705825','0','0','vaibhav.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456899','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',63,25,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:33','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(112,'15104','EMP0000112',NULL,'Mr.','VAIBHAV','APPASO','UGARE','1990-06-24','Male','0','0','0','vaibhav.u@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456900','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:33','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(113,'15196','EMP0000113',NULL,'Mr.','VENKATESH','RAVIKARAN','','1996-01-03','Male','9372705912','0','0','datta.b@sparkline.co.in','','No 29, Kaiyakariamman Koil St,Ramanadhapuram',1,5,21,'Ramanadhapuram',623501,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456901','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',96,NULL,1,3,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(114,'15170','EMP0000114',NULL,'Mr.','VENKATESH','V.','','1992-10-17','Male','0','0','0','venkatesh.v@sparkline.co.in','','21/96 3RD STREET ASSISI NAGAR MADHAVARAM',1,5,5,'CHENNAI',600060,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456902','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',53,25,1,2,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(115,'8104','EMP0000115',NULL,'Mr.','VIKAS','CHHABURAO','RANAWARE','1975-07-31','Male','0','0','0','vikas@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456903','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',126,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(116,'9109','EMP0000116',NULL,'Mr.','VINAY','LAXMAN','CHAVAN','1982-01-08','Male','0','0','0','vinay.c@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456904','ABCDE12345B','','Unmarried',4,NULL,1,7,'NA','NA','Active',27,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:18',NULL,NULL,NULL,NULL),(117,'9107','EMP0000117',NULL,'Mr.','VINAYAK','ASHOK','KAKADE','1988-02-18','Male','9372705821','0','0','vinayak.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456905','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',52,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(118,'14123','EMP0000118',NULL,'Mr.','VINOD','VASANT','SAVARATKAR','1987-01-01','Male','0','0','0','vinod.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456906','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',22,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(119,'9103','EMP0000119',NULL,'Mr.','VISHAL','TULSHIDAS','JAMDADE','1983-08-07','Male','9372705824','0','0','vishal@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456907','ABCDE12345B','','Married',4,NULL,1,7,'NA','NA','Active',27,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(120,'11113','EMP0000120',NULL,'Mr.','VISHAL','VASANTLAL','NIMAVAT','1990-06-22','Male','0','0','0','vishal.n@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456908','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',98,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(121,'5101','EMP0000121',NULL,'Mr.','VISHNU','','BHAGWAT','1981-04-02','Male','9372705817','0','0','sheela@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456909','ABCDE12345B','','Married',3,NULL,1,7,'NA','NA','Active',7,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(122,'11101','EMP0000122',NULL,'Mr.','VISHNU','POPAT','MEHETRE','1987-10-05','Male','9372705901','0','0','vishnu.s@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456910','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',27,NULL,1,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:34','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(123,'95101','EMP0000123',NULL,'Mr.','VRUSHALI','SHITALKUMAR','DOSHI','1966-12-29','Male','9372705809','0','0','vrushali@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456911','ABCDE12345B','','Married',1,NULL,1,7,'NA','NA','Active',126,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:35','2018-01-06 09:55:19',NULL,NULL,NULL,NULL),(124,'15157','EMP0000124',NULL,'Mr.','YOGESH','','DAMOR','1991-07-23','Male','9371769137','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456912','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',96,NULL,1,6,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:35','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(125,'15190','EMP0000125',NULL,'Mr.','YOGESH','VENKATESH','HIREMATH','1995-08-23','Male','9372705802','0','0','datta.b@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456913','ABCDE12345B','','Unmarried',1,NULL,1,7,'NA','NA','Active',96,NULL,1,4,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 14:23:35','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(126,'15137','EMP0000126',NULL,'Mrs.','YOJANA','ASHOK','GAIKWAD','1990-09-25','Female','7066244785','0','0','yojana.g@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','204663693922','ARZPG2247F','','Married',1,NULL,1,7,'','NA','Active',126,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2018-01-03 14:23:35','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(127,'15201','EMP0000127',NULL,'Mr.','ALAGURAJA ','A','','1996-07-21','Male','0','0','0','venkatesh.v@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411019,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456915','ABCDE12345B','','Unmarried',NULL,NULL,1,7,'NA','NA','Active',NULL,NULL,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:56','2018-01-08 15:12:28',NULL,NULL,NULL,NULL),(128,'15202','EMP0000128',NULL,'Mr.','MOHAN BABU','H','','1995-04-12','Male','0','0','0','venkatesh.v@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411020,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456916','BUCPB2106B        ','','Unmarried',NULL,NULL,1,7,'NA','NA','Active',NULL,NULL,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:56','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(129,'15203','EMP0000129',NULL,'Mr.','PRAKASH ','R','','1994-04-13','Male','0','0','0','venkatesh.v@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411021,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456917','ABCDE12345B','','Unmarried',NULL,NULL,1,7,'NA','NA','Active',NULL,NULL,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:56','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(130,'15204','EMP0000130',NULL,'Mr.','TEJAS ',' KESHAV','DHAMAL','1994-01-07','Male','0','0','0','tejas.d@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411022,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456918','CZXPD1268H       ','','Unmarried',NULL,NULL,1,7,'NA','NA','Active',NULL,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(131,'15205','EMP0000131',NULL,'Mr.',' VIJAYKUMAR','N','','1993-06-15','Male','0','0','0','vijaykumar.n@sparkline.co.in','','Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,1,1,'Pune',411023,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456919','ARAPV1433D      ','','Unmarried',NULL,NULL,1,7,'NA','NA','Active',NULL,NULL,1,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(132,'15206','EMP0000132',NULL,'Mr.','VINODAKUMAR','S','','1994-01-31','Male','9738964979','0','0','vinoda.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456789','GJEPK3398L    ','236547895.0','Unmarried',1,NULL,1,7,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(133,'15207','EMP0000133',NULL,'Mr.','ANMOL','','CHOUDHARY','1997-03-04','Male','9582842098','0','0','account.delhi@sparkline.co.in','','Sparkline Equipments Pvt Ltd',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','598745223','CHPPA4467H   ','565412563.0','Unmarried',11,NULL,1,7,'NA','NA','Active',NULL,NULL,1,5,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:57','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(134,'15208','EMP0000134',NULL,'Mr.','SELVAM','M','','1991-07-24','Male','9843559662','0','0','selvam.m@sparkline.co.in','','Sparkline Equipments Pvt Ltd',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','489652314','IJHY145Y','456233987.0','Unmarried',3,NULL,1,7,'NA','NA','Active',NULL,NULL,1,2,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:58','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(135,'15209','EMP0000135',NULL,'Mr.','MILIND','','KOTKAR','1994-02-03','Male','7385040400','0','0','milind.k@sparkline.co.in','','Sparkline Equipments Pvt Ltd',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','632541789','CNGPK6190Q  ','236897456.0','Unmarried',12,NULL,1,7,'NA','NA','Active',NULL,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:58','2018-01-08 15:12:29',NULL,NULL,NULL,NULL),(136,'15210','EMP0000136',NULL,'Ms.','ANUJA','AJIT','PATIL','1993-03-25','Female','8482859288','0','0','vikas@sparkline.co.in','','Sparkline Equipments Pvt Ltd',1,1,1,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','655894562','DNJPP0804E','564656845.0','Unmarried',NULL,NULL,1,10,'NA','NA','Active',NULL,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 16:26:58','2018-01-08 15:12:29',NULL,NULL,NULL,NULL);
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
  `employee_resignation_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_exit_interviews_on_employee_id` (`employee_id`),
  KEY `index_exit_interviews_on_question_master_id` (`question_master_id`),
  KEY `index_exit_interviews_on_employee_resignation_id` (`employee_resignation_id`),
  CONSTRAINT `fk_rails_233ad71822` FOREIGN KEY (`question_master_id`) REFERENCES `question_masters` (`id`),
  CONSTRAINT `fk_rails_968a5cb882` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b2e8828f2a` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`)
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
  `relation_master_id` int(11) DEFAULT NULL,
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
-- Table structure for table `frequest_questions`
--

DROP TABLE IF EXISTS `frequest_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequest_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` text COLLATE utf8_unicode_ci,
  `answer` text COLLATE utf8_unicode_ci,
  `employees_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_frequest_questions_on_employees_id` (`employees_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequest_questions`
--

LOCK TABLES `frequest_questions` WRITE;
/*!40000 ALTER TABLE `frequest_questions` DISABLE KEYS */;
INSERT INTO `frequest_questions` VALUES (1,'1001','Is there a mandate to complete a certain average number of hours in a month?','Employees have to maintain an average of 8 hours per day in a salary cycle period',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(2,'1002','What are the total number of hours that I need to work to be marked present for a full day?','A working day is considered a full day if an employee works for more than 8 hours',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(3,'1003','Are there any minimum number of hours I need to complete to be marked present for half a day?','To avail a half-day leave, the employee is required to work for a minimum period of 4 hours and should intimate the immediate supervisor or the HOD by applying Half Day in System',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(4,'1004','What are the types of leaves (leave ledgers) I am eligible to get?','SEPL follows the All planned leave system. which is inclusive of Paid Leave, Sick Leave, Casual leaves and approved Compensatory off.',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(5,'1005','How do I change my password in HRMS','Passwords can be changed in the My Profile Page. My Profile page is located by navigating the following path: Home > People Tools > Maintain Security > Use > My Profile.When you are in the My Profile page, you will see an option to change your password which reads as, \"Change password\". Click on this link. Type the old password and the new password. Make a note of the new password. Then, click on save, to save the password. If your save is successful, you will be brought back to the General Profile Information screen. Your new password is now in effect.',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(6,'1006','What is the Late Coming Rule?','As per Policy 1 hour late coming is allowed for 3 times in a month, every subsequent late coming is considered as Fine-Rs.100/-',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(7,'1007','What happens to my balance leaves after Resignation','Pending PL are encashed during Full & Final Settlement, SL & CL are lapsed. ',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(8,'1008','Can I avail leaves after resignation?','All Leaves are frozen after you resign,any leaves taken during Notice period will be considered as Leave without pay,C-offs can be used',NULL,0,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(9,'1009','What is the payroll cycle that is followed at SEPL?','1st of a month to 30th or 31st of that month (Eg:- 1-Aug-2017 to 31-Aug-2017)',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(10,'1010','How are leaves calculated?','Privilege leave is calculated for a period of one calendar year (Jan- Dec), 1 day per every 20 physically present days, including weekly-offs and Leaves(CO/CL/PL/SL). ',NULL,1,'2018-01-06 10:52:38','2018-01-06 10:52:38'),(11,'1011','Can I take leave during my probation period?','SEPLdiscourages employees from taking leaves during the first Six months after joining. If an employee has to take a leave during this period, it will be treated as Leave Without Pay. However C-off is applicable for Probation Period.',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(12,'1012','At the end of the year, how many leaves get carried to the next year?','For the subsequent calendar year, an employee is allowed to keep only 30 leaves balance, all other PL\'s are encashed',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(13,'1013','My manager has asked me to work on my week-off due to business reasons. How do I apply for a comp. off.?','Employees required to work on a weekend are eligible for a Comp off in lieu of working on this day, provided it is initiated and approved by HOD. Apply for C-off from Employee Self Service-C-off Request',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(14,'1014','What are the minimum working hours to avail a comp. off.?','A working day is considered a eligible for a comp. off. if an employee works for more than 7 hours',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(15,'1015','What is the sandwich rule that I heard about from my colleagues?','Any Leave except C-off on a Saturday and  Monday will lead to loss of pay for 3 days instead of two days.',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(16,'1016','I am using the HRMS portal for the first time. How do I apply for a leave?','You can login to the system and access the portal user manual for detailed guide',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(17,'1017','What is the difference between Salary and CTC','Any cost born by the employer on behalf of the employee like employer contribution to Provident Fund, Gratuity expense, Insurance expenses etc. over and above the employee\'s salary form part of the total CTC of the employee.',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(18,'1019','How to check my PF balance / passbook','To view provident fund passbook, one may access it here . (https://passbook.epfindia.gov.in/MemberPassBook/Login.jsp) with one\'s UAN and password. ',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(19,'1020','How to link my Aadhar Card with UAN','1- To link your Aadhaar in UAN database, you have to login at UAN member portal. You can login at UAN member portal after the UAN activation2- At the UAN portal dashboard menu, you would see a link to ‘Manage’. In the drop-down menu, select ‘KYC’.3- You would see a form to update KYC documents. You can update or submit any of the document through this form. Now enter the document number and name as per the document. 4- After the submission of details, your given information is sent to the employer. After the approval by the employer the new KYC document or Aadhaar is added in UAN database.',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(20,'1021','How can I get my LTA Amount','Claim your LTA (if mentioned in your salary letter) by filling LTA requision form and Submit to HR, you will get the amount after 3 months. For more details refer to LTA Policy.',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(21,'1022','How to link the esic Nominee ','On Esic Dash board employee can make the  changes for DOB, Nomine, Address only ',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(22,'1023','I have sent a request for approval (leave, attendance correction etc), but then realized it needs some edits, what do I do?','Request your Manager to Reject the Leave and then reapply ',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(23,'1024','What happens if I forget to apply for leave during a particular month? What is the cut off date by which my leave application should be approved in HRMS?','It will be considered as LWP if you forget to apply leave in HRMS. 1st day of subsequent month of Salary month will be the cut off for applying leaves. ',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39'),(24,'1025','I have applied for leave but my manager has not approved them will my salary be deducted for such unapproved leaves?','If the leave is unapproved till 2nd Day of subsequent month of Salary month will be approved by default by HR',NULL,1,'2018-01-06 10:52:39','2018-01-06 10:52:39');
/*!40000 ALTER TABLE `frequest_questions` ENABLE KEYS */;
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
  CONSTRAINT `fk_rails_53077b3df5` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_6e86e151d5` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_9026e8df92` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
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
INSERT INTO `groups` VALUES (1,'sp@sparkline.com','$2a$10$axs7.h.ha7WpzLUqDsQwG.frSdjKpkTr0J03OYO5YpN4fQI8Uhkte','Sparkline',NULL,NULL,NULL,1,'2018-01-03 13:13:06','2018-01-03 13:13:06','127.0.0.1','127.0.0.1','2018-01-03 13:13:06','2018-01-03 13:13:06',NULL,NULL,NULL,NULL);
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
  `c_off` tinyint(1) DEFAULT NULL,
  `holiday_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'101','Republic Day','','2018-01-26',NULL,0,1,'National','2018-01-06 11:18:11','2018-01-06 11:18:11'),(2,'102','Independance Day','','2018-08-15',NULL,0,1,'National','2018-01-06 11:20:05','2018-01-06 11:20:05'),(3,'103','May Day/ Workers Day','','2018-05-01',NULL,0,1,'Public','2018-01-08 14:00:38','2018-01-08 14:00:38'),(4,'104','Ganesh Chaturthi','','2018-09-13',NULL,0,1,'Public','2018-01-08 14:02:43','2018-01-08 14:02:43'),(5,'105','Dussehra','Vijaya Dashmi','2018-10-19',NULL,0,1,'Public','2018-01-08 14:03:49','2018-01-08 14:03:49'),(6,'106','Diwali','Narak Chaturdashi','2018-11-06',NULL,0,1,'Public','2018-01-08 14:04:37','2018-01-08 14:04:37'),(7,'107','Diwali','Lakshmi Puja','2018-11-07',NULL,0,1,'Public','2018-01-08 14:05:02','2018-01-08 14:05:02'),(8,'108','Diwali','Bali Pratipada','2018-11-08',NULL,0,1,'Public','2018-01-08 14:05:45','2018-01-08 14:05:45'),(9,'109','Diwali','Bhai dooj','2018-11-09',NULL,0,1,'Public','2018-01-08 14:06:17','2018-01-08 14:06:17'),(10,'110','Rakshabandhan','','2018-08-07',NULL,0,1,'Public','2018-01-08 14:07:17','2018-01-08 14:07:17'),(11,'111','Holi','','2018-03-02',NULL,0,1,'Public','2018-01-08 14:07:43','2018-01-08 14:07:43'),(12,'112','Chhat Puja','JSR Region','2018-11-13',NULL,0,1,'Public','2018-01-08 14:08:13','2018-01-08 14:08:13'),(13,'113','Janmashtami','Gujarat Region','2018-09-03',NULL,0,1,'Public','2018-01-08 14:08:50','2018-01-08 14:08:50'),(14,'114','Navratri','Gujarat Region','2018-10-18',NULL,0,1,'Public','2018-01-08 14:09:16','2018-01-08 14:09:16'),(15,'115','Pongal','','2018-01-15',NULL,0,1,'Public','2018-01-08 14:09:45','2018-01-08 14:09:45'),(16,'116','Tamil New Year','','2018-04-14',NULL,0,1,'Public','2018-01-08 14:10:08','2018-01-08 14:10:08');
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
  `multiple_investment` tinyint(1) DEFAULT NULL,
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
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `notice_period_after_probation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_off` tinyint(1) DEFAULT NULL,
  `is_da` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'2015-11-01',2,1,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:10','2018-01-06 09:54:39'),(2,2,'2011-07-20',3,2,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(3,3,'2017-07-12',4,3,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9800.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(4,4,'2014-12-08',4,4,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9555.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(5,5,'2007-05-01',2,5,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(6,6,'2016-07-11',5,6,NULL,NULL,NULL,NULL,'','','3307255026.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9200.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(7,7,'2009-07-01',3,7,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:11','2018-01-06 09:54:39'),(8,8,'2010-09-01',4,8,NULL,NULL,NULL,NULL,'','','3304421623.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8745.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:39'),(9,9,'2017-04-19',5,9,NULL,NULL,NULL,NULL,'','','3308396892.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9600.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:39'),(10,10,'2012-06-07',4,10,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:39'),(11,11,'2012-08-01',4,11,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11218.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:39'),(12,12,'2017-06-02',5,12,NULL,NULL,NULL,NULL,'','','3307244964.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9185.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:40'),(13,13,'2017-04-14',5,13,NULL,NULL,NULL,NULL,'','','3308391619.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9400.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:12','2018-01-06 09:54:40'),(14,14,'2016-08-01',6,14,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9250.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(15,15,'2009-01-01',4,15,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8812.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(16,16,'2017-04-17',4,9,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11628.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(17,17,'2003-07-20',5,16,NULL,NULL,NULL,NULL,'','','3303752825.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9426.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(18,18,'2017-02-21',4,17,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9675.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(19,19,'2010-11-01',5,18,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11040.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:13','2018-01-06 09:54:40'),(20,20,'2011-06-01',5,19,NULL,NULL,NULL,NULL,'','','3304723515.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9240.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:40'),(21,21,'2016-01-01',4,17,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:40'),(22,22,'2017-04-01',3,20,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(23,23,'1991-09-09',4,21,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(24,24,'2005-02-01',5,16,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','14000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(25,25,'2016-01-01',3,22,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(26,26,'2015-07-01',4,23,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9460.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(27,27,'2007-06-08',3,24,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:14','2018-01-06 09:54:41'),(28,28,'2016-08-26',6,25,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9065.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:41'),(29,29,'2005-02-01',4,26,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11250.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:41'),(30,30,'2010-10-01',4,27,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8970.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:41'),(31,31,'2010-11-22',5,28,NULL,NULL,NULL,NULL,'','','3304615352.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9484.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:41'),(32,32,'2007-09-01',4,29,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:41'),(33,33,'2005-02-01',2,30,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:42'),(34,34,'2014-12-02',4,14,NULL,NULL,NULL,NULL,'','','3306608040.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8845.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:42'),(35,35,'2016-08-22',6,25,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9062.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:15','2018-01-06 09:54:42'),(36,36,'2015-11-01',7,31,NULL,NULL,NULL,NULL,'','','1320162564.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(37,37,'2009-04-01',2,32,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(38,38,'2016-07-07',6,33,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(39,39,'2013-01-14',4,8,NULL,NULL,NULL,NULL,'','','1320976605.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8807.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(40,40,'2009-10-01',4,34,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9700.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(41,41,'2003-05-16',4,35,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11520.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(42,42,'2014-11-26',4,36,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11880.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(43,43,'2005-02-01',7,37,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:16','2018-01-06 09:54:42'),(44,44,'2005-02-01',2,38,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:42'),(45,45,'2007-07-01',5,16,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10363.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:42'),(46,46,'2006-08-01',5,39,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9555.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:42'),(47,47,'2010-11-15',4,40,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8963.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:43'),(48,48,'2012-06-07',3,20,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:43'),(49,49,'2017-06-27',4,36,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9500.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:43'),(50,50,'2015-06-22',4,17,NULL,NULL,NULL,NULL,'','','3306767846.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9350.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:43'),(51,51,'2009-05-01',4,41,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12500.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:17','2018-01-06 09:54:43'),(52,52,'2008-07-09',3,42,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(53,53,'2016-09-20',8,43,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12030.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(54,54,'2015-10-05',4,17,NULL,NULL,NULL,NULL,'','','3306898714.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(55,55,'2010-11-01',5,16,NULL,NULL,NULL,NULL,'','','3304402457.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9484.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(56,56,'2016-04-06',6,44,NULL,NULL,NULL,NULL,'','','3307130440.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8840.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(57,57,'2010-09-20',4,45,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9207.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:43'),(58,58,'2017-09-01',5,46,NULL,NULL,NULL,NULL,'','','3308704974.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:18','2018-01-06 09:54:44'),(59,59,'2016-01-11',2,47,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','14926.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:19','2018-01-06 09:54:44'),(60,60,'2005-02-01',4,26,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11500.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:19','2018-01-06 09:54:44'),(61,61,'2013-10-08',2,48,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10459.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:19','2018-01-06 09:54:44'),(62,62,'2017-07-17',4,25,NULL,NULL,NULL,NULL,'','','3308737776.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9250.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:19','2018-01-06 09:54:44'),(63,63,'2012-08-01',4,49,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11218.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:19','2018-01-06 09:54:44'),(64,64,'2015-04-16',4,17,NULL,NULL,NULL,NULL,'','','3306769568.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8921.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(65,65,'2016-11-22',6,50,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9500.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(66,66,'2016-07-22',6,44,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11200.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(67,67,'2016-08-18',5,51,NULL,NULL,NULL,NULL,'','','3307346967.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9100.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(68,68,'2010-11-01',4,52,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10818.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(69,69,'2017-07-10',5,53,NULL,NULL,NULL,NULL,'','','3308698010.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:44'),(70,70,'2005-07-19',6,12,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9030.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:20','2018-01-06 09:54:45'),(71,71,'2005-07-19',4,35,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13750.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(72,72,'2017-02-16',6,17,NULL,NULL,NULL,NULL,'','','3308122662.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9275.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(73,73,'2016-01-03',4,25,NULL,NULL,NULL,NULL,'','','3304979134.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9221.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(74,74,'2000-04-01',7,37,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(75,75,'2013-11-08',4,54,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12688.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(76,76,'2017-09-11',4,55,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9243.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(77,77,'2014-09-26',7,56,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9513.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(78,78,'2015-06-12',7,57,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8989.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:21','2018-01-06 09:54:45'),(79,79,'2017-06-09',6,12,NULL,NULL,NULL,NULL,'','','3308617287.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8700.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:45'),(80,80,'2007-03-05',4,58,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11069.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:45'),(81,81,'2017-07-25',6,13,NULL,NULL,NULL,NULL,'','','3308719779.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9310.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(82,82,'2009-07-01',4,59,NULL,NULL,NULL,NULL,'','','3308698121.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10753.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(83,83,'2017-07-10',5,60,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(84,84,'2000-05-01',7,61,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(85,85,'2006-09-01',5,62,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12526.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(86,86,'2017-06-15',5,51,NULL,NULL,NULL,NULL,'','','3308617066.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:22','2018-01-06 09:54:46'),(87,87,'2017-07-01',5,63,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9240.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:46'),(88,88,'1995-04-01',3,64,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:46'),(89,89,'2017-04-17',4,65,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:46'),(90,90,'2016-05-16',6,66,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13698.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:46'),(91,91,'2010-11-01',5,67,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10158.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:46'),(92,92,'2017-07-10',5,68,NULL,NULL,NULL,NULL,'','','3308698046.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:47'),(93,93,'2016-01-03',5,16,NULL,NULL,NULL,NULL,'','','3305708415.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8820.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:47'),(94,94,'2010-11-01',5,16,NULL,NULL,NULL,NULL,'','','3304402456.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10473.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:47'),(95,95,'2017-05-06',3,44,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:23','2018-01-06 09:54:47'),(96,96,'2008-07-01',3,69,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(97,97,'1999-08-01',2,70,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(98,98,'2015-11-01',3,71,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(99,99,'2017-06-12',4,36,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(100,100,'2017-07-17',5,52,NULL,NULL,NULL,NULL,'','','3308719716.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9136.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(101,101,'2016-12-26',4,50,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10080.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(102,102,'2014-04-07',2,72,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:47'),(103,103,'2013-09-23',4,73,NULL,NULL,NULL,NULL,'','','3306036969.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8850.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:48'),(104,104,'2017-07-10',5,68,NULL,NULL,NULL,NULL,'','','3308697922.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:48'),(105,105,'2016-05-19',6,33,NULL,NULL,NULL,NULL,'','','3307177205.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8840.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:48'),(106,106,'2017-08-01',6,74,NULL,NULL,NULL,NULL,'','','3306767400.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8494.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:48'),(107,107,'2011-07-01',2,48,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10459.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:24','2018-01-06 09:54:48'),(108,108,'2017-06-19',4,75,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9156.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:48'),(109,109,'2010-11-01',4,76,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11200.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:48'),(110,110,'2016-09-01',6,77,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10014.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:48'),(111,111,'2011-06-20',5,78,NULL,NULL,NULL,NULL,'','','3304960603.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9100.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:48'),(112,112,'2015-02-23',4,17,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8775.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:48'),(113,113,'2017-07-20',4,25,NULL,NULL,NULL,NULL,'','','3308737866.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9157.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:49'),(114,114,'2017-02-10',5,8,NULL,NULL,NULL,NULL,'','','3308117648.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9349.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:49'),(115,115,'2008-07-14',3,79,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:49'),(116,116,'2009-09-01',4,8,NULL,NULL,NULL,NULL,'','','3304089661.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:49'),(117,117,'2009-07-01',4,80,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11051.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:25','2018-01-06 09:54:49'),(118,118,'2014-12-23',4,13,NULL,NULL,NULL,NULL,'','','3306180945.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9086.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(119,119,'2008-03-01',4,8,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11531.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(120,120,'2011-07-20',2,5,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13932.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(121,121,'2005-02-01',5,35,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13780.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(122,122,'2011-01-01',4,6,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8800.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(123,123,'1996-01-01',3,71,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:49'),(124,124,'2016-08-29',6,25,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10800.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:50'),(125,125,'2017-07-10',5,81,NULL,NULL,NULL,NULL,'','','3308697982.0','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,'',0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 09:54:50'),(126,126,'2016-03-28',4,82,NULL,NULL,NULL,NULL,'','','','6 Months','30.0',NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9000.0',0,NULL,2,NULL,'',0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 14:24:26','2018-01-06 11:24:21'),(127,127,'2017-11-01',5,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(128,128,'2017-11-03',5,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(129,129,'2017-11-08',5,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(130,130,'2017-11-21',4,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8976.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(131,131,'2017-11-20',4,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11725.0',0,NULL,2,NULL,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:41','2018-01-03 16:27:41'),(132,132,'2017-12-01',5,9,NULL,NULL,'2018-06-01',NULL,NULL,NULL,'101220913534.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42'),(133,133,'2017-12-01',5,77,NULL,NULL,'2018-06-01',NULL,NULL,NULL,'101072418056.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9135.5',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42'),(134,134,'2017-12-01',4,86,NULL,NULL,'2018-06-01',NULL,NULL,NULL,'5127554382.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9276.36',0,NULL,2,NULL,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42'),(135,135,'2017-12-15',5,9,NULL,NULL,'2018-06-15',NULL,NULL,NULL,'3307924671.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9108.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42'),(136,136,'2017-12-13',5,87,NULL,NULL,'2018-06-13',NULL,NULL,NULL,'3309186363.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,NULL,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,NULL,1,NULL,'2018-01-03 16:27:42','2018-01-03 16:27:42');
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
  `weekoff_sandwich` tinyint(1) DEFAULT NULL,
  `holiday_sandwich` tinyint(1) DEFAULT NULL,
  `transfer` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'L','Leave','Planed leave, Sick leave, Casual leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(2,'HDL','Half day leave','Half day leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(3,'ML','Maternity Leave','Maternity Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(4,'PL','Paternity Leave','Paternity Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(5,'C.Off','Compensatory Off','Compensatory Off',NULL,0,NULL,NULL,0,0,NULL,0,0,0,0,NULL,0,NULL,0,'2018-01-03 13:11:41','2018-01-06 11:09:45'),(6,'OD','Out Duty','Out Duty',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(7,'  CasualLeave','  CasualLeave','',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,0,NULL,0,'2018-01-05 15:44:45','2018-01-06 11:10:04'),(8,'SickLeave','SickLeave','',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,0,NULL,0,'2018-01-05 15:44:54','2018-01-06 11:10:13'),(9,'PaidLeave','PaidLeave','',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,0,NULL,0,'2018-01-05 15:45:02','2018-01-06 11:10:22');
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
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaving_reasons`
--

LOCK TABLES `leaving_reasons` WRITE;
/*!40000 ALTER TABLE `leaving_reasons` DISABLE KEYS */;
INSERT INTO `leaving_reasons` VALUES (1,'1','Further studies','',1,'2018-01-06 10:40:50','2018-01-06 10:40:50'),(2,'2','Health Factors','',1,'2018-01-06 10:41:01','2018-01-06 10:41:01'),(3,'3','Marriage / Family','',1,'2018-01-06 10:41:11','2018-01-06 10:41:11'),(4,'4','Better Opportunity / Salary','',1,'2018-01-06 10:41:22','2018-01-06 10:41:22'),(5,'5','Overseas Opportunity','',1,'2018-01-06 10:41:33','2018-01-06 10:41:33'),(6,'6','Job Different from expectation','',1,'2018-01-06 10:41:45','2018-01-06 10:41:45'),(7,'7','Work not challenging','',1,'2018-01-06 10:41:55','2018-01-06 10:41:55'),(8,'8','Work culture','',1,'2018-01-06 10:42:04','2018-01-06 10:42:04'),(9,'9','Working Hours','',1,'2018-01-06 10:42:13','2018-01-06 10:42:13'),(10,'10','More responsibilities','',1,'2018-01-06 10:42:23','2018-01-06 10:42:23'),(11,'11','Lack of Co-operation','',1,'2018-01-06 10:42:34','2018-01-06 10:42:34'),(12,'12','Lack of Recognition','',1,'2018-01-06 10:42:49','2018-01-06 10:42:49'),(13,'13','Others: Specify Below','',1,'2018-01-06 10:43:00','2018-01-06 10:43:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'15194',6,NULL,NULL,'15194@xyz.com','$2a$10$.EMTYBe7gRKLZ9li3.GZpeqoa1gdh.hIzTbCGg5DwB4A/jN5Ri0my',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:08','2018-01-03 14:27:13',1,1,NULL,100,NULL,NULL,NULL,NULL),(2,'15126',6,NULL,NULL,'15126@xyz.com','$2a$10$FhkZLbz0rHOvQOZTvWSyGuosGRuZQXZEMFQrsviyDRX7rBaBvc.pG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:09','2018-01-06 09:47:01',1,1,1,1,NULL,NULL,NULL,NULL),(3,'11115',4,NULL,NULL,'11115@xyz.com','$2a$10$FqFt/NQ/novDSILozXKjtOL4oUM4deuOUmvN2LD73iZkI3iqgZ2eq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:09','2018-01-03 14:27:13',1,1,NULL,2,NULL,NULL,NULL,NULL),(4,'15193',6,NULL,NULL,'15193@xyz.com','$2a$10$dspJvHMxNvRrFCB3PPcoM.y8VvCV0soad2SOKcyFX5Xr6iPhvOoAW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:09','2018-01-03 14:27:13',1,1,NULL,3,NULL,NULL,NULL,NULL),(5,'14121',6,NULL,NULL,'14121@xyz.com','$2a$10$wNX6haAlPL4WfyY3KbwH.ePYaE5oDm5z8tQZrW0yf3qY89w1H5/di',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:09','2018-01-03 14:27:13',1,1,NULL,4,NULL,NULL,NULL,NULL),(6,'7101',6,NULL,NULL,'7101@xyz.com','$2a$10$K41dIZamcRBQciE7TahCAuvE4cd7M4OXk0DFuHEUacT3SfuNFENBa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:09','2018-01-03 14:27:13',1,1,NULL,5,NULL,NULL,NULL,NULL),(7,'15145',6,NULL,NULL,'15145@xyz.com','$2a$10$PTn/0i8V7p112wIkEzBaXOBaRcQD85M7cW.Lcykf9bOmvAmXVuLhy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:13',1,1,NULL,6,NULL,NULL,NULL,NULL),(8,'15177',6,NULL,NULL,'15177@xyz.com','$2a$10$LMpiz4pFl1seBDkPaFZRtOvXiLWMtIckiqsfIDu1yqOW4KI2bETge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:13',1,1,NULL,9,NULL,NULL,NULL,NULL),(9,'9108',4,NULL,NULL,'9108@xyz.com','$2a$10$P6G1H03r41BeRmXeoVO87uEiIlEoPuXOS2E0uZ5QShjWuocZezwpC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:13',1,1,NULL,7,NULL,NULL,NULL,NULL),(10,'10104',6,NULL,NULL,'10104@xyz.com','$2a$10$QDNq8HSxVvTY52z9DgLssOLs1I.ehztkmM7doiyDocIxVLfQxBN6m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:14',1,1,NULL,8,NULL,NULL,NULL,NULL),(11,'12103',6,NULL,NULL,'12103@xyz.com','$2a$10$CjTBsI0H.lzbrY49zoSb/ew4U5jawqh9NpwSLttotxMpk5h32l1Ja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:14',1,1,NULL,10,NULL,NULL,NULL,NULL),(12,'12106',6,NULL,NULL,'12106@xyz.com','$2a$10$MkF83.o7B1Z.l3XzBG2tT.Cp1TYjhavjOuLKeTT6QHLY8ij/7E97y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:10','2018-01-03 14:27:14',1,1,NULL,11,NULL,NULL,NULL,NULL),(13,'15181',6,NULL,NULL,'15181@xyz.com','$2a$10$zZSx2sUrjz4t0z7.o2FbteYhAYTcN6qfhELQA2DOrwIc0VogRSwre',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:11','2018-01-03 14:27:14',1,1,NULL,12,NULL,NULL,NULL,NULL),(14,'15174',6,NULL,NULL,'15174@xyz.com','$2a$10$neVIxoj9ldaTQvbtFOb3Xuih1dhKlsHawG7eeRaT0Ko1uB2FsXnkC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:11','2018-01-03 14:27:14',1,1,NULL,13,NULL,NULL,NULL,NULL),(15,'15152',6,NULL,NULL,'15152@xyz.com','$2a$10$xTX0P9AuIMmm2rfK5w2uOO/inwr3vMpdSI0EMPIEmxLij.KtdRwO.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:11','2018-01-03 14:27:14',1,1,NULL,14,NULL,NULL,NULL,NULL),(16,'9102',6,NULL,NULL,'9102@xyz.com','$2a$10$ve/mVyJi2UnneIn4MukWpe800mFjiWLezIjt46paSjt1hYjsCumfm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:11','2018-01-03 14:27:14',1,1,NULL,15,NULL,NULL,NULL,NULL),(17,'15178',6,NULL,NULL,'15178@xyz.com','$2a$10$qZufzs30ePSok0yuohEc7OTt1BiziTxd2kqnDtTN6R.KGlPnR8Y5a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:11','2018-01-03 14:27:15',1,1,NULL,16,NULL,NULL,NULL,NULL),(18,'6203',6,NULL,NULL,'6203@xyz.com','$2a$10$1KPTCWu2P8Lv3LxhV1EIleulR4Dk6lTueucA9WjCxMpot8Rg6hziC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:12','2018-01-03 14:27:15',1,1,NULL,17,NULL,NULL,NULL,NULL),(19,'15172',6,NULL,NULL,'15172@xyz.com','$2a$10$bgMfvZ2RtVLRrrRSjgc0u.wuhM1NMxf5iZkFRT0/hP7dReY23l1sO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:12','2018-01-03 14:27:15',1,1,NULL,18,NULL,NULL,NULL,NULL),(20,'10211',6,NULL,NULL,'10211@xyz.com','$2a$10$L0DBWLZs2aYNxlVLgLlWLe0JieXuiwAdDPldxd637kYWbTU6rY/.6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:12','2018-01-03 14:27:15',1,1,NULL,19,NULL,NULL,NULL,NULL),(21,'11206',6,NULL,NULL,'11206@xyz.com','$2a$10$j4v4M4.XFC.ddNNz3lr85uh9IvDdklEquyUEJGNX5imUNlYcfjUBK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:12','2018-01-03 14:27:15',1,1,NULL,20,NULL,NULL,NULL,NULL),(22,'15130',6,NULL,NULL,'15130@xyz.com','$2a$10$NfTE50NOM4v2/TTGV7Gmq.kR9JMK3nWCFA96eJ7.DIpxQ0Dm77.cW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:12','2018-01-03 14:27:15',1,1,NULL,21,NULL,NULL,NULL,NULL),(23,'9101',4,NULL,NULL,'9101@xyz.com','$2a$10$S2qoBEHSt9DfxONAeqJTzeyAl6P5PsXknc1rS5KnWUPssHNDKpEdi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:13','2018-01-03 14:27:15',1,1,NULL,22,NULL,NULL,NULL,NULL),(24,'5108',6,NULL,NULL,'5108@xyz.com','$2a$10$4TOhcdLnO8wbRPceRFRkDOIaNAtCudzdoSG8R87RimvbEjk7tYhW6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:13','2018-01-03 14:27:15',1,1,NULL,23,NULL,NULL,NULL,NULL),(25,'5205',6,NULL,NULL,'5205@xyz.com','$2a$10$PChcJtUQZibQisFtPNsdS.7IfNNXpR7XIZx.yJrJOxp.hCTeJ8Khm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:13','2018-01-03 14:27:16',1,1,NULL,24,NULL,NULL,NULL,NULL),(26,'15132',4,NULL,NULL,'15132@xyz.com','$2a$10$cnj5VRLbWgANsJJsSUjseOaK13Hs0/H5vpKuyt2it85ZR.mr0ZqkO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:13','2018-01-03 14:27:16',1,1,NULL,25,NULL,NULL,NULL,NULL),(27,'15117',6,NULL,NULL,'15117@xyz.com','$2a$10$Dn7wLUgKJzEJE1NKF0aDQuHJEK76ZijgiZfI7Vz8mFnFhf/H5bHWO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:14','2018-01-03 14:27:16',1,1,NULL,26,NULL,NULL,NULL,NULL),(28,'8101',4,NULL,NULL,'8101@xyz.com','$2a$10$Zrv8565uNB1e9p.DKvhmyewQPVAL1h000mozqxcKiY7H9LJQAZg3y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:14','2018-01-03 14:27:16',1,1,NULL,27,NULL,NULL,NULL,NULL),(29,'15156',6,NULL,NULL,'15156@xyz.com','$2a$10$W1taRXsJFiTP5vNFEyNKPeWAcECPXWWqOXfvz8ciyZKtjUTsDQPoC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:14','2018-01-03 14:27:16',1,1,NULL,28,NULL,NULL,NULL,NULL),(30,'5203',6,NULL,NULL,'5203@xyz.com','$2a$10$Q4tnlBgsywI7xCwe1/orR.BSt4sKOrrj1TeCfKOMPqNKM7yz8nR4K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:14','2018-01-03 14:27:16',1,1,NULL,29,NULL,NULL,NULL,NULL),(31,'10106',6,NULL,NULL,'10106@xyz.com','$2a$10$MdzjVQhAkmUEbZf5AbYDneuYxcS6/JhVIP3wwXCvE.EEWMdTwEC1i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:14','2018-01-03 14:27:16',1,1,NULL,30,NULL,NULL,NULL,NULL),(32,'10214',6,NULL,NULL,'10214@xyz.com','$2a$10$kkG44Nb0GufHBPANFZYJveBM06rKkPzZPExQuGW6Ofks0IdaVjcfC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:16',1,1,NULL,31,NULL,NULL,NULL,NULL),(33,'7103',6,NULL,NULL,'7103@xyz.com','$2a$10$EMXIM.LtjbMaw9fqwCnUGueV0EIs3GyB3s/P9MkspHzxSxjLk2uzi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:16',1,1,NULL,32,NULL,NULL,NULL,NULL),(34,'5104',6,NULL,NULL,'5104@xyz.com','$2a$10$YTg2z7hHAlzefBR2wBoCCey9sQYsX8.CN2xCpzC76DgOBGRUfJewm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:17',1,1,NULL,33,NULL,NULL,NULL,NULL),(35,'14124',6,NULL,NULL,'14124@xyz.com','$2a$10$rhNBypOJ/PoRo5KeJAl8DepoeeEm70nYn4KdABE5NT6OwIO544VyS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:17',1,1,NULL,34,NULL,NULL,NULL,NULL),(36,'15155',6,NULL,NULL,'15155@xyz.com','$2a$10$Q6xBSSfnsbxKzZM2aYIck.uVc3C2EmLgf/MFABLltMbY0szExAMl6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:17',1,1,NULL,35,NULL,NULL,NULL,NULL),(37,'15123',6,NULL,NULL,'15123@xyz.com','$2a$10$bVAjnEBXsa9aSI71BW4mY.F.fD9djnK3TtpoB.BW2ucECdLS8pU7G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:17',1,1,NULL,36,NULL,NULL,NULL,NULL),(38,'9104',6,NULL,NULL,'9104@xyz.com','$2a$10$AO0vxq8aX7n.SYoqg4nIn.EqdZ8t./IZZUMtY6GtOqU6BdqRwuR32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:15','2018-01-03 14:27:17',1,1,NULL,37,NULL,NULL,NULL,NULL),(39,'15148',6,NULL,NULL,'15148@xyz.com','$2a$10$cb2oPHgWoBc8R4yc0EJFRu0F6WIBxjfIynkBZGUwpx0S7T8kNJuZK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:17',1,1,NULL,38,NULL,NULL,NULL,NULL),(40,'13102',6,NULL,NULL,'13102@xyz.com','$2a$10$YT1A.MPt.qEM9nZkRekf4OCXnr77yiW5RhD0Kn66P8aSSWi/IkMWy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:17',1,1,NULL,39,NULL,NULL,NULL,NULL),(41,'9110',6,NULL,NULL,'9110@xyz.com','$2a$10$ZZxcaZDHAsel5xd4l0Zay.nqmHvMV10TitX8tH0VmwVQxMmr6GkvG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:17',1,1,NULL,40,NULL,NULL,NULL,NULL),(42,'14120',6,NULL,NULL,'14120@xyz.com','$2a$10$YAkOoZjq7dVq98nDPv7HgeSTSyh8IzhhKTsuiFpyUR0HgPC8bue/e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:18',1,1,NULL,42,NULL,NULL,NULL,NULL),(43,'6204',6,NULL,NULL,'6204@xyz.com','$2a$10$Zv4VS/5/4KRg4QJbyESRIukuiFz1HTPzNVk33SLt2gnVETyjxZhky',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:18',1,1,NULL,41,NULL,NULL,NULL,NULL),(44,'5102',6,NULL,NULL,'5102@xyz.com','$2a$10$Mn1yVS9aekuHOfkMbP3UtOD3UhXHQb0dyl0hJPFcfzMgxs6abcXrS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:16','2018-01-03 14:27:18',1,1,NULL,43,NULL,NULL,NULL,NULL),(45,'5106',6,NULL,NULL,'5106@xyz.com','$2a$10$G4kB4S/qwCCuGinyD4.q0.TbJeqAjHa7.zkd2/0DUpWob9iFrfjlu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:18',1,1,NULL,44,NULL,NULL,NULL,NULL),(46,'7202',6,NULL,NULL,'7202@xyz.com','$2a$10$OEWTEE4cuevmu4jy6LlpfuFiSV0D7DflvwTyILh5HU5zRRvliBpsm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:18',1,1,NULL,45,NULL,NULL,NULL,NULL),(47,'6202',6,NULL,NULL,'6202@xyz.com','$2a$10$UoOLnS/jtJVCpUMTE6Yu9uFMcfKMlzHSHbKj62y7J1ZnS89.Nl6au',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:18',1,1,NULL,46,NULL,NULL,NULL,NULL),(48,'10113',6,NULL,NULL,'10113@xyz.com','$2a$10$DXkvbZbqL3B3GyoQaxWQ7./Jr8XAd7Jy/COrB028l4Y1x8jRNfAFi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:18',1,1,NULL,47,NULL,NULL,NULL,NULL),(49,'12104',4,NULL,NULL,'12104@xyz.com','$2a$10$XSncn9lChQZVN14Y2xK1lOVDg2E0coNgZ4dsqMTHFYab5TaxfvYDK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:18',1,1,NULL,48,NULL,NULL,NULL,NULL),(50,'15187',6,NULL,NULL,'15187@xyz.com','$2a$10$MuGkjsD2bJuAKxsCJMWhn.i.qLab5oAu5FnpF/mmfeBMx4QC1RdVq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:17','2018-01-03 14:27:19',1,1,NULL,49,NULL,NULL,NULL,NULL),(51,'15108',6,NULL,NULL,'15108@xyz.com','$2a$10$2.jeO45lprzVHltz1OUg8el2.g7dl9aIM909lLJQ1.tK9hYwZKFoa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,50,NULL,NULL,NULL,NULL),(52,'9105',6,NULL,NULL,'9105@xyz.com','$2a$10$0V5G7.xudK8yx./p7.CvvOA1vSM5np79zRYh9qUITIwzrqy1/yfy2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,51,NULL,NULL,NULL,NULL),(53,'8105',4,NULL,NULL,'8105@xyz.com','$2a$10$WEFu.LsqpJEMkTod91PeoexfooOgBAP6OuRKpKwdcAdYUUHNJojHS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,52,NULL,NULL,NULL,NULL),(54,'15166',6,NULL,NULL,'15166@xyz.com','$2a$10$5MpXcsyUratOCHYW5C4puelttPavH6nI7/KWUTRirtntKLHayeY2a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,53,NULL,NULL,NULL,NULL),(55,'15122',6,NULL,NULL,'15122@xyz.com','$2a$10$Y3nRrxd7b3PI2fWFcyrLMOMA/X0GNbDz2emtTRTP5ogYLaYTVvTdi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,54,NULL,NULL,NULL,NULL),(56,'10108',6,NULL,NULL,'10108@xyz.com','$2a$10$7ikmugwLYgr9D8X8WbFETOXF3oHGEh5Xc0EnY7d25rSE9ju9KrCUS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:18','2018-01-03 14:27:19',1,1,NULL,55,NULL,NULL,NULL,NULL),(57,'15138',6,NULL,NULL,'15138@xyz.com','$2a$10$JhnpVhsTuGmtBYrfm7mYE.rVR4d3UG8ZisjL86jVwnc3SZUhfa0LS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:19','2018-01-03 14:27:19',1,1,NULL,56,NULL,NULL,NULL,NULL),(58,'10105',6,NULL,NULL,'10105@xyz.com','$2a$10$F1GcS34vvLe7DuvstwgHHeqSfAQ0cANubXDzriXjLoG4G5E8gmKXC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:19','2018-01-03 14:27:20',1,1,NULL,57,NULL,NULL,NULL,NULL),(59,'15200',6,NULL,NULL,'15200@xyz.com','$2a$10$dONOk61TRHs7GVVZNg.teeJxwf2crWwKenDssW06Wf4jsKG9iHyc6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:19','2018-01-03 14:27:20',1,1,NULL,58,NULL,NULL,NULL,NULL),(60,'15131',6,NULL,NULL,'15131@xyz.com','$2a$10$JFJzZc/8/PEiFIKO42e8V.QrmFcYW.bEt7q47D/NGVcEw6Y8qtmju',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:19','2018-01-03 14:27:20',1,1,NULL,59,NULL,NULL,NULL,NULL),(61,'14110',6,NULL,NULL,'14110@xyz.com','$2a$10$E9FNvDcCdzqS8oHolmtfCeRWbd76mYhq/PfRTO2iJaj7OFqCFA8Sy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:19','2018-01-03 14:27:20',1,1,NULL,102,NULL,NULL,NULL,NULL),(62,'5107',6,NULL,NULL,'5107@xyz.com','$2a$10$hN6aoZRmokPrxvxCvE0Fe.uUBj9IdktKwXlpoxTryK69ei0Z//skG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:20','2018-01-03 14:27:20',1,1,NULL,60,NULL,NULL,NULL,NULL),(63,'13105',6,NULL,NULL,'13105@xyz.com','$2a$10$H5RwDrsoHUK6dGCOs1kZ9uzhDPwVcxoSc7LiJSZpX1kIsK7hrXvGW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:20','2018-01-03 14:27:20',1,1,NULL,61,NULL,NULL,NULL,NULL),(64,'15195',6,NULL,NULL,'15195@xyz.com','$2a$10$Hyfft7aqby.txsgvdpvV/eUl1lWggq3gdUNRtS6h4zW0D/CMskHWW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:20','2018-01-03 14:27:20',1,1,NULL,62,NULL,NULL,NULL,NULL),(65,'12105',6,NULL,NULL,'12105@xyz.com','$2a$10$tqr9fXiRKypvdpY32o1O/.mz2QFlg6B9temp/gVXiPCNBWDul0Pfi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:20','2018-01-03 14:27:21',1,1,NULL,63,NULL,NULL,NULL,NULL),(66,'15105',6,NULL,NULL,'15105@xyz.com','$2a$10$WdgMX3JJTmwpuPYPEWwurufLF4/Tk2jrbk5pdWMGCJnB1ECji7cBK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:21','2018-01-03 14:27:21',1,1,NULL,64,NULL,NULL,NULL,NULL),(67,'15167',6,NULL,NULL,'15167@xyz.com','$2a$10$Os39Kwvd1rLBJuDGrs7EUefg0WFrL6COT3RYPGiVgRTFwCegY55J6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:21','2018-01-03 14:27:21',1,1,NULL,65,NULL,NULL,NULL,NULL),(68,'15150',6,NULL,NULL,'15150@xyz.com','$2a$10$GCxh6Hr2dICBz.gN02fMoe7DOAfZssxEDxvm.LWHGiSdViCCNiimW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:21','2018-01-03 14:27:21',1,1,NULL,66,NULL,NULL,NULL,NULL),(69,'15154',6,NULL,NULL,'15154@xyz.com','$2a$10$6xELGvzBFAW5oRDgzkknlu7GpijB3kz2XdvrnPvOCOfNWb7DsgtaS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:21','2018-01-03 14:27:21',1,1,NULL,67,NULL,NULL,NULL,NULL),(70,'10212',6,NULL,NULL,'10212@xyz.com','$2a$10$MHI7HkUVbnzgZBTL3q8EcOp72dDvPxYQbwcCNO.bzvY1N7QDK5Yb2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:21','2018-01-03 14:27:21',1,1,NULL,68,NULL,NULL,NULL,NULL),(71,'15192',6,NULL,NULL,'15192@xyz.com','$2a$10$FiiZHmRB9OWHTm3jBf0TDejgQK1gTOTxQ6noiqmQxU0JyubmB1t3G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:21',1,1,NULL,69,NULL,NULL,NULL,NULL),(72,'6205',6,NULL,NULL,'6205@xyz.com','$2a$10$wPjWjjg0BU9vtN0B2ssW0evIwZwGA/zOBNwiTsiJaca7auWGWLtHG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:22',1,1,NULL,71,NULL,NULL,NULL,NULL),(73,'15171',6,NULL,NULL,'15171@xyz.com','$2a$10$mZBEXkT/KviVEyj0GH2Xe.jKYudbioEd5tfGksyeZBqzhNB4jhqp6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:22',1,1,NULL,72,NULL,NULL,NULL,NULL),(74,'15134',6,NULL,NULL,'15134@xyz.com','$2a$10$kWBU/TxanPpFWCUPKOcUU.bJLoNdkneHdNc4npl9Rd11a7Yx0xf8C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:22',1,1,NULL,73,NULL,NULL,NULL,NULL),(75,'101',6,NULL,NULL,'101@xyz.com','$2a$10$FMQtnT.MvwNKTPQ7rRBBvuvlUhk6sbnSqNx1g/y9hwdi6OThWjasS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:22',1,1,NULL,74,NULL,NULL,NULL,NULL),(76,'13108',6,NULL,NULL,'13108@xyz.com','$2a$10$Etb9EMi49gb7BI5DVeymHO2bwuSdMNlb5o9tbfyDqUSpt5R95ouBO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:22','2018-01-03 14:27:22',1,1,NULL,75,NULL,NULL,NULL,NULL),(77,'15199',6,NULL,NULL,'15199@xyz.com','$2a$10$Hai8CLsV2M7NZirloQdWbeEWBzpovgZW6H7ofXxEHlJhUXJ.clpEK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:22',1,1,NULL,76,NULL,NULL,NULL,NULL),(78,'15106',6,NULL,NULL,'15106@xyz.com','$2a$10$rNHvfT6i.r0./UU8l/aXiO7FSX052abh2lZmFkewIk/nkp/cFfyWK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:22',1,1,NULL,78,NULL,NULL,NULL,NULL),(79,'8102',6,NULL,NULL,'8102@xyz.com','$2a$10$UblWyE/yME5CxwMl5lJT9.AkLjmF7O/1XTFtY5qxKfzrCEuYtkhKW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:22',1,1,NULL,80,NULL,NULL,NULL,NULL),(80,'15185',6,NULL,NULL,'15185@xyz.com','$2a$10$w6bqWZEp.VaI2A2rCh7JpeZqOPkLdvl.pgBmiJsdGnpxsbhTGBq2W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:23',1,1,NULL,70,NULL,NULL,NULL,NULL),(81,'15139',6,NULL,NULL,'15139@xyz.com','$2a$10$HSzuVVQ4UIqIMWaITpB0cuGa2Gno6ezMglCzmVcy46bd3414tXkJm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:23',1,1,NULL,81,NULL,NULL,NULL,NULL),(82,'9106',6,NULL,NULL,'9106@xyz.com','$2a$10$obUEyLtwK0U2F3td8EAlz.k.DrNtcm5pHbtPqB5StCbNzCGFMa6bq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:23','2018-01-03 14:27:23',1,1,NULL,82,NULL,NULL,NULL,NULL),(83,'15191',6,NULL,NULL,'15191@xyz.com','$2a$10$R7X2MUiWtPlgxozKQ5Bu8.i5DfiYmczJ2yQIicGQcJI.WkPFw9juq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:23',1,1,NULL,83,NULL,NULL,NULL,NULL),(84,'102',6,NULL,NULL,'102@xyz.com','$2a$10$WArSd7HCnVHN2grb0vqrY.gJiY1ulS37ZOepXIQmQ7S02zjMkOAZO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:23',1,1,NULL,84,NULL,NULL,NULL,NULL),(85,'6206',6,NULL,NULL,'6206@xyz.com','$2a$10$M2bUDnlHfmaYatQylUrbwORRcNqXqwbsRzCXFwxaoZYsmdVzbNiye',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:23',1,1,NULL,85,NULL,NULL,NULL,NULL),(86,'15183',6,NULL,NULL,'15183@xyz.com','$2a$10$wuC1Tx2H5VLOlGt7yPypyOmSJGR09YnFML.9mNmWXC9zpfQzI9XCu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:23',1,1,NULL,86,NULL,NULL,NULL,NULL),(87,'14119',6,NULL,NULL,'14119@xyz.com','$2a$10$qptkUxIDZcw289Rs.O2o9OCIjgrY68RSll9si1itxZyjp95dpPqJa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:23',1,1,NULL,77,NULL,NULL,NULL,NULL),(88,'15186',6,NULL,NULL,'15186@xyz.com','$2a$10$ZpJVx45jAK2glswb775CfeidWncaMKH6RE9k9FmhNyVo8LFBsOWve',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:24','2018-01-03 14:27:24',1,1,NULL,79,NULL,NULL,NULL,NULL),(89,'15175',6,NULL,NULL,'15175@xyz.com','$2a$10$7RY6NY7pQwJ8RqV8MavA6etdW375XTDIvGmVG/ZPqyM1ZTG5BxBP.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,89,NULL,NULL,NULL,NULL),(90,'15169',6,NULL,NULL,'15169@xyz.com','$2a$10$MCqHYCz85JQfN8lJ/6tuvOHHu8wX3SUkgOfAf3zx0AP5ZHsNgn3ju',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,87,NULL,NULL,NULL,NULL),(91,'95102',4,NULL,NULL,'95102@xyz.com','$2a$10$9Yojvfr.Am5xONmu4IC96OyWHJ8cy/XOWpDXaW4FAyTipCQfbpIiG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,88,NULL,NULL,NULL,NULL),(92,'15144',6,NULL,NULL,'15144@xyz.com','$2a$10$4W.L3bYYq00DhYEOM7p2L.ijUSKHiZGRGI7iCQHAvITLpMnlPV9oS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,90,NULL,NULL,NULL,NULL),(93,'10107',6,NULL,NULL,'10107@xyz.com','$2a$10$zph687RMtUYdjZ54KywskenpZHneCTFnLWIOmC/VgzC0z.m3..Roa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,91,NULL,NULL,NULL,NULL),(94,'15188',6,NULL,NULL,'15188@xyz.com','$2a$10$Q0bZkStxI071O.so9ynH3.yWaS8dqivmN5yf3sMcL3xZZ0fgb.UwK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:25','2018-01-03 14:27:24',1,1,NULL,92,NULL,NULL,NULL,NULL),(95,'15135',6,NULL,NULL,'15135@xyz.com','$2a$10$cKMpQjpbjHcdpczMLu6VFONxpVczKtOKv1QadTf/Mvv8UHGvLOgQ2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:26','2018-01-03 14:27:25',1,1,NULL,93,NULL,NULL,NULL,NULL),(96,'10210',6,NULL,NULL,'10210@xyz.com','$2a$10$gQc4V.z5h8NBZ11lJJlu6OJq8PPifwTI7ysLXFCZ0QYxP3aNXZh62',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:26','2018-01-03 14:27:25',1,1,NULL,94,NULL,NULL,NULL,NULL),(97,'7104',6,NULL,NULL,'7104@xyz.com','$2a$10$ctjIXqrXcib3NiZwPDoMg.Y6cwtZjIDFrpBa4kWBoV/f27vmaodkG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:26','2018-01-03 14:27:25',1,1,NULL,95,NULL,NULL,NULL,NULL),(98,'8103',4,NULL,NULL,'8103@xyz.com','$2a$10$3gdRmWJNGbrDwgQHZF6rM.7BpHgr4M3HfjffUujgsduDoojgwxzci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:26','2018-01-03 14:27:25',1,1,NULL,96,NULL,NULL,NULL,NULL),(99,'2101',6,NULL,NULL,'2101@xyz.com','$2a$10$Se8nLRtajwHJ6CTA.KB6geTtuzqJ.KlOZQDQxVg2q9nGH2OkHQ87O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:26','2018-01-03 14:27:25',1,1,NULL,97,NULL,NULL,NULL,NULL),(100,'15127',4,NULL,NULL,'15127@xyz.com','$2a$10$r.MbhgJkci7ORZBp2zkQGecw9qxYCWvtsjBbYDz4TKAqXt2j6Zxei',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:27','2018-01-03 14:27:25',1,1,NULL,98,NULL,NULL,NULL,NULL),(101,'15182',6,NULL,NULL,'15182@xyz.com','$2a$10$IdZwuR.Qrv4w6w0AXTnCBuHci66xGSfTIqS0c65UjRPxluepaoQcq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:27','2018-01-03 14:27:25',1,1,NULL,99,NULL,NULL,NULL,NULL),(102,'15168',6,NULL,NULL,'15168@xyz.com','$2a$10$IuELfayoNyN/vzqnLTX5v.jwMIeDcYQ3nkstjE5agKD5hj7L0a5QC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:27','2018-01-03 14:27:25',1,1,NULL,101,NULL,NULL,NULL,NULL),(103,'13106',6,NULL,NULL,'13106@xyz.com','$2a$10$rxfKfShiwe2npcDsRTmyreWH0FVkAfGH2TQdjFcSIdY/STsJFM8IW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:27','2018-01-03 14:27:26',1,1,NULL,103,NULL,NULL,NULL,NULL),(104,'15189',6,NULL,NULL,'15189@xyz.com','$2a$10$lFBgC1./JQBoh0MCjzhLUecg/FDpoM8Izhnt4xPpJ6GMn3H/t4SCa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:27','2018-01-03 14:27:26',1,1,NULL,104,NULL,NULL,NULL,NULL),(105,'15143',6,NULL,NULL,'15143@xyz.com','$2a$10$eiJekSZv8lF.QWu3t3EyNO.lWlb2wO8Vr6gmhNvACcPIaesYsUuIm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:28','2018-01-03 14:27:26',1,1,NULL,105,NULL,NULL,NULL,NULL),(106,'15197',6,NULL,NULL,'15197@xyz.com','$2a$10$cNTTkhknGWcG9pmyQ7XNTe4UZyDXKp7URVIG70YyeBRn4W1rXXNLS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2018-01-08 12:07:28','2018-01-08 12:07:28','127.0.0.1','127.0.0.1','2018-01-03 14:25:28','2018-01-08 12:07:28',1,1,NULL,106,NULL,NULL,NULL,NULL),(107,'11110',6,NULL,NULL,'11110@xyz.com','$2a$10$Dpw2VWtT.xWTCUAxxiAqGe3NYM6gS2sB/l/3UwGWt5ln9rMrL8p1a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:28','2018-01-03 14:27:26',1,1,NULL,107,NULL,NULL,NULL,NULL),(108,'15184',6,NULL,NULL,'15184@xyz.com','$2a$10$mx6fmSP3PnhVsiTEng9UQOx4c9HLeh7wOI4Ukq300uZtQrPFDw2ja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:28','2018-01-03 14:27:26',1,1,NULL,108,NULL,NULL,NULL,NULL),(109,'10109',6,NULL,NULL,'10109@xyz.com','$2a$10$6YWy1C8AUPoqR191khznPejZahv0a6rgVMSne9zIZ/U3dgpeERZh2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:29','2018-01-03 14:27:26',1,1,NULL,109,NULL,NULL,NULL,NULL),(110,'15159',6,NULL,NULL,'15159@xyz.com','$2a$10$o7.i8F.A8Sopyu0YxXOPre8xLIdjfMSHA5wNsaXOilNtsQgs8RVBa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:29','2018-01-03 14:27:26',1,1,NULL,110,NULL,NULL,NULL,NULL),(111,'11208',6,NULL,NULL,'11208@xyz.com','$2a$10$ZRJW1AEd7TFqoLmjAE53bOC7H74DtKVjYAzWOKaJP.sFKfAXnknpW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:29','2018-01-03 14:27:27',1,1,NULL,111,NULL,NULL,NULL,NULL),(112,'15104',6,NULL,NULL,'15104@xyz.com','$2a$10$bOcX.MyavraK9sPajTpWQervvtzZrp4UGFbUGm7.toCac.dRggJSq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:29','2018-01-03 14:27:27',1,1,NULL,112,NULL,NULL,NULL,NULL),(113,'15196',6,NULL,NULL,'15196@xyz.com','$2a$10$ruHBfF3mamE5zHILrmaR0uCQGrnlWFSRpO0oEhtm0.E0NVord7OA.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:30','2018-01-03 14:27:27',1,1,NULL,113,NULL,NULL,NULL,NULL),(114,'15170',6,NULL,NULL,'15170@xyz.com','$2a$10$2XuE9NnIsnLXEJQN.L4d4OeCAC8BO2x2u.XcjGf2TpyBVq/PqzWAO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:30','2018-01-03 14:27:27',1,1,NULL,114,NULL,NULL,NULL,NULL),(115,'8104',4,NULL,NULL,'8104@xyz.com','$2a$10$Q7c5wRVg5Yds76kedkLe9.gF8w2RDLiTdP0vUU.JEELYZjYhxuBa.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:30','2018-01-03 14:27:27',1,1,NULL,115,NULL,NULL,NULL,NULL),(116,'9109',6,NULL,NULL,'9109@xyz.com','$2a$10$R.dzXe5s6gkDw//mVtlOAODatWfNORZQW0nAq8kMJT97iYghy9uCK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:31','2018-01-03 14:27:27',1,1,NULL,116,NULL,NULL,NULL,NULL),(117,'9107',6,NULL,NULL,'9107@xyz.com','$2a$10$p4MwkQwWkyRpedog8NaMYe9PVbOmbzfaJsRZJP6ipQQyBz9ruv/tC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:31','2018-01-03 14:27:27',1,1,NULL,117,NULL,NULL,NULL,NULL),(118,'14123',6,NULL,NULL,'14123@xyz.com','$2a$10$L8U5bq6rajmICI3uJ.WRPepDAC7J3bgT8yHBaNiFaJNrVFS3Yv3GS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:31','2018-01-03 14:27:27',1,1,NULL,118,NULL,NULL,NULL,NULL),(119,'9103',6,NULL,NULL,'9103@xyz.com','$2a$10$kkdDRS2PCQ3a7OaEamgV7ukAQGY6a39J.ucxxIfavlj/aI9tkiqYW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:31','2018-01-03 14:27:28',1,1,NULL,119,NULL,NULL,NULL,NULL),(120,'11113',6,NULL,NULL,'11113@xyz.com','$2a$10$5GJn/JHCTafVImXY6bYUwOl0LgUbmXqXEmB0KG7iyX/Tg9OBgziL6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:32','2018-01-03 14:27:28',1,1,NULL,120,NULL,NULL,NULL,NULL),(121,'5101',6,NULL,NULL,'5101@xyz.com','$2a$10$xmg5Ib3JfzrggAqdMfKs3ujty.iWqMFWlkNrJYiQH/z/pgwJTZZ9W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:32','2018-01-03 14:27:28',1,1,NULL,121,NULL,NULL,NULL,NULL),(122,'11101',6,NULL,NULL,'11101@xyz.com','$2a$10$5XLAS2URjU09tOsiJJttReU8oN93SNDRdyPAGW8m6B952dWVUIsq6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:32','2018-01-03 14:27:28',1,1,NULL,122,NULL,NULL,NULL,NULL),(123,'95101',6,NULL,NULL,'95101@xyz.com','$2a$10$DVvH/oifSP4ZNwobjzFRKOwu46J4xxoSQcUxJ5N83JD2He1oARjci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:32','2018-01-03 14:27:28',1,1,NULL,123,NULL,NULL,NULL,NULL),(124,'15157',6,NULL,NULL,'15157@xyz.com','$2a$10$lzliPQwWw2rJUEfQKLMTgu4VUYXuUfOaD.frTIIbNRKaM62MrW6Bm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:32','2018-01-03 14:27:28',1,1,NULL,124,NULL,NULL,NULL,NULL),(125,'15190',6,NULL,NULL,'15190@xyz.com','$2a$10$Bql6gzaxkYEUz./0U6Pg.OuNTWXPxfUXH6RlBQAuo2DrFnI9fljKa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-01-03 14:25:33','2018-01-03 14:27:28',1,1,NULL,125,NULL,NULL,NULL,NULL),(126,'15137',1,NULL,NULL,'15137@xyz.com','$2a$10$Wq0vaQYSpg7T2Bpc282wC.g4kDk6SliZyP1CNRDUGisMLl.HjgrXm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,'2018-01-08 16:27:52','2018-01-08 13:51:44','192.168.0.67','192.168.0.67','2018-01-03 14:25:33','2018-01-08 16:27:52',1,1,9,126,NULL,NULL,NULL,NULL);
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
INSERT INTO `nationalities` VALUES (1,'NATION_1001','Indian','Indian Nationality',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,'PM_1001','Cash',NULL,NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(2,'PM_1002','Cheque',NULL,NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(3,'PM_1003','NEFT','National Electronic Funds Transfer',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(4,'PM_1004','RTGS','Real Time Gross Settlement',NULL,'2018-01-03 13:11:30','2018-01-03 13:11:30'),(5,'PM_1005','Credit Cards',NULL,NULL,'2018-01-03 13:11:31','2018-01-03 13:11:31');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punch_masters`
--

LOCK TABLES `punch_masters` WRITE;
/*!40000 ALTER TABLE `punch_masters` DISABLE KEYS */;
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
  CONSTRAINT `fk_rails_046e89b830` FOREIGN KEY (`degree_stream_id`) REFERENCES `degree_streams` (`id`),
  CONSTRAINT `fk_rails_2cc4fb103d` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`),
  CONSTRAINT `fk_rails_3722b001f0` FOREIGN KEY (`degree_type_id`) REFERENCES `degree_types` (`id`),
  CONSTRAINT `fk_rails_b0cde2dffd` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_bce702aaab` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`),
  CONSTRAINT `fk_rails_c642f67c39` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifications`
--

LOCK TABLES `qualifications` WRITE;
/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;
INSERT INTO `qualifications` VALUES (1,126,26,7,14,55,NULL,'',NULL,'65%','2018-01-06 09:24:01','2018-01-06 09:24:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_masters`
--

LOCK TABLES `question_masters` WRITE;
/*!40000 ALTER TABLE `question_masters` DISABLE KEYS */;
INSERT INTO `question_masters` VALUES (1,'1','List your expectations when you joined the company & have your expectations satisfied?',NULL,NULL,'2018-01-06 10:43:21','2018-01-06 10:43:33'),(2,'2','What according to you are the positive points about the company?',NULL,NULL,'2018-01-06 10:43:46','2018-01-06 10:43:46'),(3,'3','What according to you are the negative points about the company?',NULL,NULL,'2018-01-06 10:43:58','2018-01-06 10:43:58'),(4,'4','Where are you joining now and at what capacity? [Company Name, location, designation, salary]',NULL,NULL,'2018-01-06 10:44:10','2018-01-06 10:44:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_masters`
--

LOCK TABLES `relation_masters` WRITE;
/*!40000 ALTER TABLE `relation_masters` DISABLE KEYS */;
INSERT INTO `relation_masters` VALUES (1,'RELATION_1001','Father','Father',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(2,'RELATION_1002','Mother','Mother',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(3,'RELATION_1003','Daughter','Daughter',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(4,'RELATION_1004','Son','Son',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(5,'RELATION_1005','Brother','Brother',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(6,'RELATION_1006','Spouse','Spouse',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(7,'RELATION_1007','Sister','Sister',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34'),(8,'RELATION_1008','Father-in-law','Father-in-law',NULL,'2018-01-03 13:11:34','2018-01-03 13:11:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Hinduism','REL_1001','Hindu',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(2,'Jainism','REL_1002','Jain',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(3,'Islam','REL_1003','Islam',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(4,'Christianity','REL_1004','Christianity',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(5,'Sikhism','REL_1005','Sikhism',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(6,'Buddhism','REL_1006','Buddhism',NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(7,'HINDU',NULL,NULL,NULL,'2018-01-03 13:13:30','2018-01-03 13:13:30'),(8,'Muslim',NULL,NULL,NULL,'2018-01-03 14:23:19','2018-01-03 14:23:19'),(9,'CHRISTIAN',NULL,NULL,NULL,'2018-01-03 14:23:24','2018-01-03 14:23:24'),(10,'Jain',NULL,NULL,NULL,'2018-01-03 16:26:58','2018-01-03 16:26:58');
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
  CONSTRAINT `fk_rails_031f8e5da5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9b0b083282` FOREIGN KEY (`rembursmentmaster_id`) REFERENCES `rembursmentmasters` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_categories`
--

LOCK TABLES `reserved_categories` WRITE;
/*!40000 ALTER TABLE `reserved_categories` DISABLE KEYS */;
INSERT INTO `reserved_categories` VALUES (1,'RC_1001','SC',NULL,NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(2,'RC_1002','ST',NULL,NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(3,'RC_1003','OBC',NULL,NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(4,'RC_1004','General',NULL,NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33'),(5,'RC_1005','NT',NULL,NULL,'2018-01-03 13:11:33','2018-01-03 13:11:33');
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
  CONSTRAINT `fk_rails_4ccbad3903` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
  CONSTRAINT `fk_rails_834cfeb746` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignation_status_records`
--

LOCK TABLES `resignation_status_records` WRITE;
/*!40000 ALTER TABLE `resignation_status_records` DISABLE KEYS */;
INSERT INTO `resignation_status_records` VALUES (1,1,126,'Pending','2018-01-06 00:00:00','2018-01-06 12:42:04','2018-01-06 12:42:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ER_1001','GroupAdmin','All Access of the system',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(2,'ER_1002','Admin','Company Level All Access',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(3,'ER_1003','Branch','Branch level all access',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(4,'ER_1004','HOD','Employee Self Service and Manager Self Service Access',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(5,'ER_1005','Supervisor','Employee Self Service and Manager Self Service Access',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(6,'ER_1006','Employee','Employee Self Service  ',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(7,'ER_1007','GroupRecruiter','All Recruitment access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(8,'ER_1008','AdminRecruiter','Company Level Recruitment access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(9,'ER_1009','Recruiter','Branch Level Recruitment access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(10,'ER_1010','GroupTimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(11,'ER_1011','AdminTimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32'),(12,'ER_1012','TimeManagement','All Time Management access, Employee Self Service and Manager Self Service',NULL,'2018-01-03 13:11:32','2018-01-03 13:11:32');
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
  CONSTRAINT `fk_rails_308f210f51` FOREIGN KEY (`salary_template_id`) REFERENCES `salary_templates` (`id`),
  CONSTRAINT `fk_rails_a8d9f7bf2d` FOREIGN KEY (`salary_component_id`) REFERENCES `salary_components` (`id`)
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
  `other_component_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160113091730'),('20160113093434'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092244'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170508142940'),('20170508144515'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170616052732'),('20170617045509'),('20170617062016'),('20170617103654'),('20170619090333'),('20170619093726'),('20170620124404'),('20170621071225'),('20170623073735'),('20170628085423'),('20170803091421'),('20170822073828'),('20170926072224'),('20171015094950'),('20171211112950'),('20171215123749'),('20180102042535'),('20180106103351');
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
  `contact_no2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_ctc` decimal(10,0) DEFAULT NULL,
  `add_by_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,NULL,'Maharashtra','2018-01-03 13:13:30','2018-01-03 13:13:30'),(2,1,NULL,'Punjab','2018-01-03 14:23:17','2018-01-03 14:23:17'),(3,1,NULL,'JHARKHAND','2018-01-03 14:23:18','2018-01-03 14:23:18'),(4,1,NULL,'Andhra Pradesh','2018-01-03 14:23:19','2018-01-03 14:23:19'),(5,1,NULL,'Tamilnadu','2018-01-03 14:23:22','2018-01-03 14:23:22'),(6,1,NULL,'Uttrakhand','2018-01-03 14:23:22','2018-01-03 14:23:22'),(7,1,NULL,'Haryana','2018-01-03 14:23:22','2018-01-03 14:23:22'),(8,1,NULL,'Uttar pradesh','2018-01-03 14:23:23','2018-01-03 14:23:23'),(9,1,NULL,'Karnataka','2018-01-03 14:23:26','2018-01-03 14:23:26'),(10,1,NULL,'TAMIL NADU','2018-01-03 14:23:26','2018-01-03 14:23:26'),(11,1,NULL,'Madhya Pradesh','2018-01-03 14:23:32','2018-01-03 14:23:32'),(12,1,'13','Gujarat','2018-01-08 14:42:58','2018-01-08 14:42:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
INSERT INTO `sub_departments` VALUES (1,1,NULL,'NA',NULL,'2018-01-03 14:23:16','2018-01-03 14:23:16'),(2,1,NULL,'',NULL,'2018-01-03 16:26:47','2018-01-03 16:26:47'),(3,10,NULL,NULL,NULL,'2018-01-03 16:26:56','2018-01-03 16:26:56'),(4,16,NULL,'SCM',NULL,'2018-01-03 16:26:58','2018-01-03 16:26:58');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_companies`
--

LOCK TABLES `target_companies` WRITE;
/*!40000 ALTER TABLE `target_companies` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoughts`
--

LOCK TABLES `thoughts` WRITE;
/*!40000 ALTER TABLE `thoughts` DISABLE KEYS */;
INSERT INTO `thoughts` VALUES (1,'2018-01-01',' \"Wisdom is the reward you get for a lifetime of listening when you\'d have preferred to talk.\" ',NULL,'2018-01-05 14:17:31','2018-01-05 14:17:31'),(2,'2018-01-02',' \"One of the most sincere forms of respect is actually listening to what another has to say.\" ',NULL,'2018-01-05 14:17:31','2018-01-05 14:17:31'),(3,'2018-01-03',' \"If you make listening and observation your occupation, you will gain much more than you can by talk.\" ',NULL,'2018-01-05 14:17:31','2018-01-05 14:17:31'),(4,'2018-01-04',' \"Listening is a magnetic and strange thing, a creative force. The friends who listen to us are the ones we move toward. When we are listened to, it creates us, makes us unfold and expand.\" ',NULL,'2018-01-05 14:17:31','2018-01-05 14:17:31'),(5,'2018-01-05','\"Most of the successful people I\'ve known are the ones who do more listening than talking.\" ','Bernard Baruch\r\n','2018-01-05 14:17:32','2018-01-05 14:27:18'),(6,'2018-01-06','\"Listening is being able to be changed by the other person.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(7,'2018-01-07','\"Everything in writing begins with language. Language begins with listening.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(8,'2018-01-08',' \"There is as much wisdom in listening as there is in speaking--and that goes for all relationships, not just romantic ones.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(9,'2018-01-09',' \"The most important thing in communication is hearing what isn\'t said\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(10,'2018-01-10',' \"When people talk, listen completely. Most people never listen.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(11,'2018-01-11','\"Most people do not listen with the intent to understand; they listen with the intent to reply.\"',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(12,'2018-01-12',' \"Friends are those rare people who ask how we are, and then wait to hear the answer.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(13,'2018-01-13',' \"The art of conversation lies in listening.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(14,'2018-01-14',' \"You cannot truly listen to anyone and do anything else at the same time.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(15,'2018-01-15',' \"We have two ears and one tongue so that we would listen more and talk less.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(16,'2018-01-16',' \"Stories are a communal currency of humanity.\" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(17,'2018-01-17','\"Great stories happen to those who can tell them. \" ',NULL,'2018-01-05 14:17:32','2018-01-05 14:17:32'),(18,'2018-01-18',' \"The engineers of the future will be poets. \" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(19,'2018-01-19',' \"The human species thinks in metaphors and learns through stories.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(20,'2018-01-20',' \"Sometimes reality is too complex. Stories give it form.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(21,'2018-01-21',' \"Story is a yearning meeting an obstacle. \" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(22,'2018-01-22',' \"If you\'re going to have a story, have a big story, or none at all. \" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(23,'2018-01-23',' \"Storytelling reveals meaning without committing the error of defining it.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(24,'2018-01-24',' \"The stories we tell literally make the world. If you want to change the world, you need to change your story. This truth applies both to individuals and institutions.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(25,'2018-01-25',' \"Those who tell the stories rule the world.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(26,'2018-01-26',' \"There is no greater agony than bearing an untold story inside you.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(27,'2018-01-27',' \"There\'s always room for a story that can transport people to another place.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(28,'2018-01-28',' \"Enlightenment is the key to everything, and it is the key to intimacy, because it is the goal of true authenticity.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(29,'2018-01-29',' \"We need to find the courage to say no to the things and people that are not serving us if we want to rediscover ourselves and live our lives with authenticity.\" ',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(30,'2018-01-30','\"I know of nothing more valuable, when it comes to the all-important virtue of authenticity, than simply being who you are.\" --',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(31,'2018-01-31','\"The keys to brand success are self-definition, transparency, authenticity and accountability.\" --',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(32,'2018-02-01','\"Yes, in all my research, the greatest leaders looked inward and were able to tell a good story with authenticity and passion.\" --',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(33,'2018-02-02',' \"Hard times arouse an instinctive desire for authenticity.\"--',NULL,'2018-01-05 14:17:33','2018-01-05 14:17:33'),(34,'2018-02-03',' \"Always be a first-rate version of yourself and not a second-rate version of someone else.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(35,'2018-02-04',' \"Be yourself--not your idea of what you think somebody else\'s idea of yourself should be.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(36,'2018-02-05','\"Shine with all you have. When someone tries to blow you out, just take their oxygen and burn brighter.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(37,'2018-02-06','\"Live authentically. Why would you continue to compromise something that\'s beautiful to create something that is fake?\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(38,'2018-02-07',' \"Authentic brands don\'t emerge from marketing cubicles or advertising agencies. They emanate from everything the company does. . .\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(39,'2018-02-08',' \"Authenticity requires a certain measure of vulnerability, transparency, and integrity\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(40,'2018-02-09',' \"We have to dare to be ourselves, however frightening or strange that self may prove to be.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(41,'2018-02-10',' \"If you trade your authenticity for safety, you may experience the following: anxiety, depression, eating disorders, addiction, rage, blame, resentment, and inexplicable grief.\" -',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(42,'2018-02-11',' \"I can be a better me than anyone can.\" -',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(43,'2018-02-12',' \"There is no persuasiveness more effectual than the transparency of a single heart, of a sincere life.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(44,'2018-02-13','\"Transparency, honesty, kindness, good stewardship, even humor, work in businesses at all times.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(45,'2018-02-14','\"A lack of transparency results in distrust and a deep sense of insecurity.\"',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(46,'2018-02-15',' \"I love when things are transparent, free and clear of all inhibition and judgment.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(47,'2018-02-16',' \"Eyes so transparent that through them the soul is seen.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(48,'2018-02-17','\"Transparency is not the same as looking straight through a building: it\'s not just a physical idea, it\'s also an intellectual one.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(49,'2018-02-18',' \"I wish that every human life might be pure transparent freedom.\" --',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(50,'2018-02-19',' \"Truth never damages a cause that is just.\" ',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(51,'2018-02-20','\"He had shown her all the workings of his soul, mistaking this for love.\" ',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(52,'2018-02-21',' \"Our whole philosophy is one of transparency.\" ',NULL,'2018-01-05 14:17:34','2018-01-05 14:17:34'),(53,'2018-02-22',' \"A basic tenet of healthy democracy is open dialogue and transparency\"',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(54,'2018-02-23',' \"I just think we need more accountability and more transparency.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(55,'2018-02-24',' \"Honesty is the first chapter in the book of wisdom.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(56,'2018-02-25',' \"Individual commitment to a group effort--that is what makes a team work, a company work, a society work, a civilization work.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(57,'2018-02-26','\"Talent wins games, but teamwork and intelligence wins championships.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(58,'2018-02-27',' \"Teamwork is the ability to work together toward a common vision. The ability to direct individual accomplishments toward organizational objectives. It is the fuel that allows common people to attain uncommon results.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(59,'2018-02-28',' \"Alone we can do so little, together we can do so much.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(60,'2018-03-01',' \"Remember teamwork begins by building trust. And the only way to do that is to overcome our need for invulnerability.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(61,'2018-03-02',' \"I invite everyone to choose forgiveness rather than division, teamwork over personal ambition.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(62,'2018-03-03',' \"None of us is as smart as all of us.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(63,'2018-03-04',' \"Coming together is a beginning. Keeping together is progress. Working together is success.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(64,'2018-03-05','\"If everyone is moving forward together, then success takes care of itself.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(65,'2018-03-06',' \"The strength of the team is each individual member. The strength of each member is the team.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(66,'2018-03-07',' \"Collaboration allows teachers to capture each other\'s fund of collective intelligence.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(67,'2018-03-08',' \"It takes two flints to make a fire.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(68,'2018-03-09',' \"Unity is strength. . . when there is teamwork and collaboration, wonderful things can be achieved.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(69,'2018-03-10',' \"To me, teamwork is the beauty of our sport, where you have five acting as one. You become selfless.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(70,'2018-03-11','\"The best teamwork comes from men who are working independently toward one goal in unison.\" ',NULL,'2018-01-05 14:17:35','2018-01-05 14:17:35'),(71,'2018-03-12',' \"I think that if you keep your eyes and your ears open and you are receptive to learning, there are skills you can get from any job at all.\"',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(72,'2018-03-13','\"Seeking means: to have a goal; but finding means: to be free, to be receptive, to have no goal.\"',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(73,'2018-03-14',' \"It is impossible to withhold education from the receptive mind, as it is impossible to force it upon the unreasoning.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(74,'2018-03-15',' \"One of the things I\'ve learned is to be receptive of feedback.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(75,'2018-03-16','\"The best way to persuade people is with your ears--by listening to them. \" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(76,'2018-03-17',' \"Confidence, like art, never comes from having all the answers; it comes from being open to all the questions.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(77,'2018-03-18',' \"Life is 10% what happens to me and 90% how I react.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(78,'2018-03-19','\"The pessimist complains about the wind; the optimist expects it to change; the realist adjusts the sails.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(79,'2018-03-20','\"Relax & clear your mind if someone is speaking, so that you\'re receptive to what they\'re saying.\"',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(80,'2018-03-21','\"The most difficult thing is the decision to act, the rest is merely tenacity.\"',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(81,'2018-03-22','\"Either you run the day, or they day runs you\"',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(82,'2018-03-23','\"Tactics, fitness, stroke ability, adaptability, experience, and sportsmanship are all necessary for winning.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(83,'2018-03-24','\"It is not the strongest or the most intelligent who will survive but those who can best manage change.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(84,'2018-03-25','\"Adaptability is about the powerful difference between adapting to cope and adapting to win.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(85,'2018-03-26',' \"The art of life is a constant readjustment to our surroundings.\" ',NULL,'2018-01-05 14:17:36','2018-01-05 14:17:36'),(86,'2018-03-27',' \"Adaptability is not imitation. It means power of resistance and assimilation.\"',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(87,'2018-03-28',' \"You can\'t build an adaptable organization without adaptable people- and individuals change only when they have to, or when they want to.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(88,'2018-03-29','\"People will try to tell you that all the great opportunities have been snapped up. In reality, the world changes every second, blowing new opportunities in all directions, including yours.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(89,'2018-03-30','\"Learn to adjust yourself to the conditions you have to endure, but make a point of trying to alter or correct conditions so that they are most favorable to you.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(90,'2018-03-31',' \"All fixed set patterns are incapable of adaptability or pliability. The truth is outside of all fixed patterns.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(91,'2018-04-01',' \"A wise man adapts himself to circumstances, as water shapes itself to the vessel that contains it.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(92,'2018-04-02','\"Fall seven times and stand up eight.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(93,'2018-04-03',' \"When I let go of what I am, I become what I might be.\"',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(94,'2018-04-04',' \"You can\'t fall if you don\'t climb. But there\'s no joy in living your whole life on the ground.\"',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(95,'2018-04-05','\"Every great dream begins with a dreamer. Always remember, you have within you the strength, the patience, and the passion to reach for the stars to change the world.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(96,'2018-04-06','\"There is no passion to be found playing small--in settling for a life that is less than the one you are capable of living.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(97,'2018-04-07','\"Develop a passion for learning. If you do, you will never cease to grow.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(98,'2018-04-08','\"Passion is energy. Feel the power that comes from focusing on what excites you.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(99,'2018-04-09',' \"If passion drives you, let reason hold the reins.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(100,'2018-04-10','\"We must act out passion before we can feel it.\" ',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(101,'2018-04-11',' \"It is obvious that we can no more explain a passion to a person who has never experienced it than we can explain light to the blind.\"',NULL,'2018-01-05 14:17:37','2018-01-05 14:17:37'),(102,'2018-04-12','\"Nothing is as important as passion. No matter what you want to do with your life, be passionate.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(103,'2018-04-13','\"You can\'t fake passion.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(104,'2018-04-14',' \"You have to be burning with \"an idea, or a problem, or a wrong that you want to right.\" If you\'re not passionate enough from the start, you\'ll never stick it out.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(105,'2018-04-15','\"Yes, in all my research, the greatest leaders looked inward and were able to tell a good story with authenticity and passion.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(106,'2018-04-16','\"If you feel like there\'s something out there that you\'re supposed to be doing, if you have a passion for it, then stop wishing and just do it.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(107,'2018-04-17','\"If you don\'t love what you do, you won\'t do it with much conviction or passion.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(108,'2018-04-18','\"There is no end. There is no beginning. There is only the passion of life. There is no end. There is no beginning. There is only the passion of life.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(109,'2018-04-19','\"Any guy that\'s not working with the same amount of intensity and passion that I do, I don\'t want to know.\" ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(110,'2018-04-20','\"It is the soul\'s duty to be loyal to its own desires. It must abandon itself to its master passion. ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(111,'2018-04-21','“The way get started is to quit talking and begin doing.” ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(112,'2018-04-22','\"The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.” ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(113,'2018-04-23','“Don’t let yesterday take up too much of today.” ',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(114,'2018-04-24','\"The husband who decides to surprise his wife is often very much surprised himself.\"',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(115,'2018-04-25',' \"Never tell people how to do things. Tell them what to do and they will surprise you with their ingenuity.\"',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(116,'2018-04-26','\"A story to me means a plot where there is some surprise. Because that is how life is--full of surprises.\"',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(117,'2018-04-27',' \"Truth is so rare that it is delightful to tell it.\"',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(118,'2018-04-28',' \"It doesn\'t take much to surprise others, but to surprise oneself- now that is a great feat.\"',NULL,'2018-01-05 14:17:38','2018-01-05 14:17:38'),(119,'2018-04-29',' \"Surprise yourself every day with your own courage.\"',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(120,'2018-04-30','\"To the issues of friendship, love, business and war, \"surprise\" is the optimistic solution.\"',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(121,'2018-05-01','\"Never tell people how to do things. Tell them what to do and they will surprise you with their ingenuity.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(122,'2018-05-02',' \"A story to me means a plot where there is some surprise. Because that is how life is--full of surprises.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(123,'2018-05-03',' \"People tend to play in their comfort zone, so the best things are achieved in a state of surprise, actually.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(124,'2018-05-04','\"Simplicity is the ultimate sophistication.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(125,'2018-05-05','\"There is no greatness where there is no simplicity, goodness and truth.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(126,'2018-05-06','\"Manifest plainness, embrace simplicity, reduce selfishness, have few desires.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(127,'2018-05-07',' \"Simplicity and repose are the qualities that measure the true value of any work of art.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(128,'2018-05-08',' \"Simplicity is the most difficult thing to secure in this world; it is the last limit of experience and the last effort of genius.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(129,'2018-05-09',' \"There is a certain majesty in simplicity which is far above all the quaintness of wit.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(130,'2018-05-10','\"Simplicity is not the goal. It is the by-product of a good idea and modest expectations.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(131,'2018-05-11','\"Simplicity is prerequisite for reliability.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(132,'2018-05-12','\"Simplicity, clarity, singleness: These are the attributes that give our lives power and vividness and joy as they are also the marks of great art. They seem to be the purpose of God for his whole creation.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(133,'2018-05-13',' \"If you haven\'t done much giving in your life-try it and see how you feel afterwards.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(134,'2018-05-14',' \"If you can\'t explain it to a six year old, you don\'t understand it yourself.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(135,'2018-05-15',' \"Life is really simple, but we insist on making it complicated.\"',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(136,'2018-05-16',' Simplicity is about subtracting the obvious and adding the meaningful.\" ',NULL,'2018-01-05 14:17:39','2018-01-05 14:17:39'),(137,'2018-05-17',' \"Free yourself from the complexities of your life! A life of simplicity and happiness awaits you.\"',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(138,'2018-05-18','\"Nature is pleased with simplicity. And nature is no dummy\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(139,'2018-05-19','\"If you will stay close to nature, to its simplicity, to the small things hardly noticeable, those things can unexpectedly become great and immeasurable.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(140,'2018-05-20',' \"Reflect upon your present blessings--of which every man has many--not on your past misfortunes, of which all men have some.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(141,'2018-05-21',' \"The truest indication of gratitude is to return what you are grateful for.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(142,'2018-05-22',' \"I work very hard, and I play very hard. I\'m grateful for life. And I live it--I believe life loves the liver of it. I live it.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(143,'2018-05-23',' \"When you are grateful--when you can see what you have--you unlock blessings to flow in your life.\"',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(144,'2018-05-24','\"We must find time to stop and thank the people who make a difference in our lives.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(145,'2018-05-25',' \"True forgiveness is when you can say, \"Thank you for that experience.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(146,'2018-05-26',' \"You can complain because roses have thorns, or you can be grateful that thorn bushes have roses.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(147,'2018-05-27','\"Do not spoil what you have by desiring what you have not; remember that what you now have was once among the things you only hoped for.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(148,'2018-05-28','\"Cultivate the habit of being grateful for every good thing that comes to you, and to give thanks continuously. And because all things have contributed to your advancement, you should include all things in your gratitude.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(149,'2018-05-29','10. \"Let gratitude be the pillow upon which you kneel to say your nightly prayer. And let faith be the bridge you build to overcome evil and welcome good.\"',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(150,'2018-05-30','\"We can only be said to be alive in those moments when our hearts are conscious of our treasures.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(151,'2018-05-31','\"As we express our gratitude, we must never forget that the highest appreciation is not to utter words, but to live by them.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(152,'2018-06-01','\"Gratitude is not only the greatest of virtues, but the parent of all others.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(153,'2018-06-02','\"Those who have the ability to be grateful are the ones who have the ability to achieve greatness.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(154,'2018-06-03',' \"This is my simple religion. There is no need for temples; no need for complicated philosophy. Our own brain, our own heart is our temple; the philosophy is kindness.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(155,'2018-06-04','\"A warm smile is the universal language of kindness.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(156,'2018-06-05',' \"Truth is a deep kindness that teaches us to be content in our everyday life and share with the people the same happiness.\" ',NULL,'2018-01-05 14:17:40','2018-01-05 14:17:40'),(157,'2018-06-06',' \"There is overwhelming evidence that the higher the level of self-esteem, the more likely one will be to treat others with respect, kindness, and generosity.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(158,'2018-06-07',' \"Wherever there is a human being, there is an opportunity for a kindness.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(159,'2018-06-08','\"Treat everyone with respect and kindness. Period. No exceptions.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(160,'2018-06-09',' \"Be kind, for everyone you meet is fighting a harder battle.\"',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(161,'2018-06-10','\"Kindness is a language which the deaf can hear and the blind can see.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(162,'2018-06-11','\"The smallest act of kindness is worth more than the greatest intention.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(163,'2018-06-12',' \"I would rather make mistakes in kindness and compassion than work miracles in unkindness and hardness.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(164,'2018-06-13','\"Never lose a chance of saying a kind word. \" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(165,'2018-06-14',' \"Our kindness may be the most persuasive argument for that which we believe.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(166,'2018-06-15',' \"It\'s a little embarrassing that after 45 years of research & study, the best advice I can give people is to be a little kinder to each other.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(167,'2018-06-16',' \"It seems to me that no matter what religion you subscribe to, acts of kindness are the stepping-stones to making the world a better place--because we become better people in it.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(168,'2018-06-17','\"Never look down on anybody unless you\'re helping them up.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(169,'2018-06-18',' \"Humility is not thinking less of yourself, it\'s thinking of yourself less.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(170,'2018-06-19','\"Pride makes us artificial and humility makes us real.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(171,'2018-06-20',' \"Thank you\' is the best prayer that anyone could say. I say that one a lot. Thank you expresses extreme gratitude, humility, understanding.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(172,'2018-06-21',' \"The greatest friend of truth is Time, her greatest enemy is Prejudice, and her constant companion is Humility.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(173,'2018-06-22',' \"The proud man can learn humility, but he will be proud of it.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(174,'2018-06-23',' \"Real genius is nothing else but the supernatural virtue of humility in the domain of thought.\" ',NULL,'2018-01-05 14:17:41','2018-01-05 14:17:41'),(175,'2018-06-24',' \"Humility is really important because it keeps you fresh and new.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(176,'2018-06-25','\"Humility, that low, sweet root, from which all heavenly virtues shoot.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(177,'2018-06-26',' \"Humility is throwing oneself away in complete concentration on something or someone else.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(178,'2018-06-27','\"Pride must die in you, or nothing of heaven can live in you.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(179,'2018-06-28','\"Humility is nothing but truth, and pride is nothing but lying.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(180,'2018-06-29',' \"One cannot be humble and aware of oneself at the same time.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(181,'2018-06-30','\"Selflessness is humility. Humility and freedom go hand in hand. Only a humble person can be free.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(182,'2018-07-01',' \"Have more humility. Remember you don\'t know the limits of your own abilities. Successful or not, if you keep pushing beyond yourself, you will enrich your own life--and maybe even please a few strangers.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(183,'2018-07-02','\"No one has ever become poor by giving.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(184,'2018-07-03',' \"A kind gesture can reach a wound that only compassion can heal.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(185,'2018-07-04',' \"Give, but give until it hurts.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(186,'2018-07-05',' \"As we work to create light for others, we naturally light our own way.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(187,'2018-07-06','Until we can receive with an open heart, we\'re never really giving with an open heart. When we attach judgment to receiving help, we knowingly or unknowingly attach judgment to giving help.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(188,'2018-07-07',' \"Even the smallest act of caring for another person is like a drop of water -it will make ripples throughout the entire pond...\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(189,'2018-07-08',' \"Don\'t wait for other people to be loving, giving, compassionate, grateful, forgiving, generous, or friendly... lead the way!\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(190,'2018-07-09','\"What we spend, we lose. What we keep will be left for others. What we give away will be ours forever.\" ',NULL,'2018-01-05 14:17:42','2018-01-05 14:17:42'),(191,'2018-07-10',' \"There is a very real relationship, both quantitatively and qualitatively, between what you contribute and what you get out of this world.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(192,'2018-07-11',' \"When in doubt as to what you should do, err on the side of giving.\"',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(193,'2018-07-12','\"I wish I were like Facebook; being able to \'like\' and \'share\' everything I get.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(194,'2018-07-13',' \"Just like downing a powerful caffeine drink, \"reaching out to others\" pays that big \"life energizer dividend!\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(195,'2018-07-14','\"Every sunrise is an invitation for us to arise and brighten someone\'s day.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(196,'2018-07-15','\"Nothing in the world can take the place of persistence. Talent will not; nothing is more common than unsuccessful men with talent. Genius will not; unrewarded genius is almost a proverb. Education will not; the world is full of educated derelicts. Persistence and determination alone are omnipotent.\" -Calvin Coolidge',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(197,'2018-07-16',' \"Energy and persistence conquer all things.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(198,'2018-07-17',' \"As long as we are persistence in our pursuit of our deepest destiny, we will continue to grow. We cannot choose the day or time when we will fully bloom. It happens in its own time.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(199,'2018-07-18','\"Success is almost totally dependent upon drive and persistence. The extra energy required to make another effort or try another approach is the secret of winning.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(200,'2018-07-19','\"Never let your persistence and passion turn into stubbornness and ignorance.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(201,'2018-07-20',' \"The difference between people who believe they have books inside of them and those who actually write books is sheer cussed persistence--the ability to make yourself work at your craft, every day--the belief, even in the face of obstacles, that you\'ve got something worth saying.\" -Jennifer Weiner',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(202,'2018-07-21','\"When I meet successful people I ask 100 questions as to what they attribute their success to. It is usually the same: persistence, hard work and hiring good people.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(203,'2018-07-22','\"Success is stumbling from failure to failure with no loss of enthusiasm.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(204,'2018-07-23','\"The best way out is always through.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(205,'2018-07-24',' \"If you have an important point to make, don\'t try to be subtle or clever. Use a pile driver. Hit the point once. Then come back and hit it again. Then hit it a third time--a tremendous whack.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(206,'2018-07-25',' \"Knowing trees, I understand the meaning of patience. Knowing grass, I can appreciate persistence.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(207,'2018-07-26',' \"Character consists of what you do on the third and fourth tries.\" ',NULL,'2018-01-05 14:17:43','2018-01-05 14:17:43'),(208,'2018-07-27',' \"Keep a little fire burning; however small, however hidden.\" \"Keep a little fire burning; however small, however hidden.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(209,'2018-07-28','\"No matter how much falls on us, we keep plowing ahead. That\'s the only way to keep the roads clear.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(210,'2018-07-29',' \"If you wish to be out front, then act as if you were behind.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(211,'2018-07-30','\"The slogans \"hang on\" and \"press on\" have solved and will continue to solve the problems of humanity.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(212,'2018-07-31',' \"It is during our darkest moments that we must focus to see the light.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(213,'2018-08-01',' \"You never have to change anything you got up in the middle of the night to write.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(214,'2018-08-02',' \"Do you want to know who you are? Don\'t ask. Act! Action will delineate and define you.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(215,'2018-08-03',' \"The best way to predict the future is to invent it.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(216,'2018-08-04',' \"If you have built castles in the air, your work need not be lost; that is where they should be. Now put the foundations under them.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(217,'2018-08-05',' \"I know for sure that what we dwell on is who we become.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(218,'2018-08-06',' \"Logic will get you from A to B. Imagination will take you everywhere.\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(219,'2018-08-07',' \"If not us, who? If not now, when?\" ',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(220,'2018-08-08','\"Winners lose much more often than losers. So if you keep losing but you\'re still trying, keep it up! You\'re right on track.\"',NULL,'2018-01-05 14:17:44','2018-01-05 14:17:44'),(221,'2018-08-09',' \"Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you\'ll be a success.\"',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(222,'2018-08-10','\"When the need to succeed is as bad as the need to breathe, then you\'ll be successful.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(223,'2018-08-11','\"If you want to test your memory, try to recall what you were worrying about one year ago today.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(224,'2018-08-12',' \"What you do speaks so loudly that I cannot hear what you say.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(225,'2018-08-13','\"In three words I can sum up everything I\'ve learned about life: it goes on.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(226,'2018-08-14',' \"Life is really simple, but we insist on making it complicated.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(227,'2018-08-15',' \"Go confidently in the direction of your dreams. Live the life you have imagined.\"',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(228,'2018-08-16','\"Only a life lived for others is a life worthwhile.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(229,'2018-08-17',' \"Change is the law of life. And those who look only to the past or present are certain to miss the future.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(230,'2018-08-18',' \"Life is a succession of lessons which must be lived to be understood.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(231,'2018-08-19',' \"The price of anything is the amount of life you exchange for it.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(232,'2018-08-20',' \"Life is far too important a thing ever to talk seriously about.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(233,'2018-08-21','\"Don\'t let life discourage you; everyone who got where he is had to begin where he was.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(234,'2018-08-22',' \"The only disability in life is a bad attitude.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(235,'2018-08-23',' \"Every creature is better alive than dead, men and moose and pine trees, and he who understands it aright will rather preserve its life than destroy it.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(236,'2018-08-24',' \"Don\'t let life discourage you; everyone who got where he is had to begin where he was.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(237,'2018-08-25',' \"Not life, but good life, is to be chiefly valued.\" ',NULL,'2018-01-05 14:17:45','2018-01-05 14:17:45'),(238,'2018-08-26',' \"If you live long enough, you\'ll make mistakes. But if you learn from them, you\'ll be a better person. It\'s how you handle adversity, not how it affects you. The main thing is never quit, never quit, never quit.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(239,'2018-08-27','\"Life in abundance comes only through great love.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(240,'2018-08-28',' \"Love is not maximum emotion. Love is maximum commitment.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(241,'2018-08-29','\"Although love is communicated in a number of ways,our words often reflect the condition of our heart.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(242,'2018-08-30',' \"Keep love in your heart. A life without it is like a sunless garden when the flowers are dead.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(243,'2018-08-31',' \"Sometimes the heart sees what is invisible to the eye.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(244,'2018-09-01','\"I have decided to stick with love. Hate is too great a burden to bear.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(245,'2018-09-02','\"Where there is love there is life.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(246,'2018-09-03','\"Let us always meet each other with smile, for the smile is the beginning of love.\"',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(247,'2018-09-04',' \"A loving heart is the beginning of all knowledge.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(248,'2018-09-05',' \"Love begins at home, and it is not how much we do... but how much love we put in that action.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(249,'2018-09-06',' \"A flower cannot blossom without sunshine, and man cannot live without love.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(250,'2018-09-07',' \"We love life, not because we are used to living but because we are used to loving.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(251,'2018-09-08',' \"Love yourself first and everything else falls into line. You really have to love yourself to get anything done in this world.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(252,'2018-09-09',' \"Love is a better teacher than duty.\"',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(253,'2018-09-10',' \"The best proof of love is trust.\" ',NULL,'2018-01-05 14:17:46','2018-01-05 14:17:46'),(254,'2018-09-11','\"Love is life. And if you miss love, you miss life.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(255,'2018-09-12','\"Faith makes all things possible... love makes all things easy.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(256,'2018-09-13',' \"Change is hardest at the beginning, messiest in the middle and best at the end.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(257,'2018-09-14',' \"Be the change that you wish to see in the world.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(258,'2018-09-15',' \"Things change. And friends leave. Life doesn\'t stop for anybody.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(259,'2018-09-16',' \"Never doubt that a small group of thoughtful, committed, citizens can change the world. Indeed, it is the only thing that ever has.\" -',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(260,'2018-09-17',' \"Everyone thinks of changing the world, but no one thinks of changing himself.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(261,'2018-09-18','\"Education is the most powerful weapon which you can use to change the world.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(262,'2018-09-19','\"Change will not come if we wait for some other person, or if we wait for some other time. We are the ones we\'ve been waiting for. We are the change that we seek.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(263,'2018-09-20',' \"They always say time changes things, but you actually have to change them yourself.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(264,'2018-09-21',' \"We are taught you must blame your father, your sisters, your brothers, the school, the teachers--but never blame yourself. It\'s never your fault. But it\'s always your fault, because if you wanted to change you\'re the one who has got to change.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(265,'2018-09-22','\"Change the way you look at things and the things you look at change.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(266,'2018-09-23',' \"No matter who you are, no matter what you did, no matter where you\'ve come from, you can always change, become a better version of yourself.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(267,'2018-09-24',' \"Those who cannot change their minds cannot change anything.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(268,'2018-09-25',' \"I alone cannot change the world, but I can cast a stone across the waters to create many ripples.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(269,'2018-09-26',' \"Change is the end result of all true learning.\" ',NULL,'2018-01-05 14:17:47','2018-01-05 14:17:47'),(270,'2018-09-27',' \"To improve is to change; to be perfect is to change often.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(271,'2018-09-28',' \"Life belongs to the living, and he who lives must be prepared for changes\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(272,'2018-09-29',' \"If you want to change the world, pick up your pen and write.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(273,'2018-09-30',' \"A tiny change today brings a dramatically different tomorrow.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(274,'2018-10-01',' \"Change your thoughts and you change your world.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(275,'2018-10-02',' \"Forgiveness does not change the past, but it does enlarge the future\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(276,'2018-10-03',' \"Some people believe holding on and hanging in there are signs of great strength. However, there are times when it takes much more strength to know when to let go and then do it.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(277,'2018-10-04',' \"The beautiful journey of today can only begin when we learn to let go of yesterday.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(278,'2018-10-05',' \"Thank God I found the GOOD in goodbye\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(279,'2018-10-06',' \"The weak can never forgive. Forgiveness is the attribute of the strong.\"',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(280,'2018-10-07',' \"Always forgive your enemies--nothing annoys them so much.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(281,'2018-10-08',' \"Forgiveness is the fragrance that the violet sheds on the heel that has crushed it.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(282,'2018-10-09',' \"When you forgive, you in no way change the past--but you sure do change the future.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(283,'2018-10-10',' \"People can be more forgiving than you can imagine. But you have to forgive yourself. Let go of what\'s bitter and move on.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(284,'2018-10-11',' \"To err is human; to forgive, divine.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(285,'2018-10-12',' \"There is no love without forgiveness, and there is no forgiveness without love.\"',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(286,'2018-10-13',' \"Forgiveness is a funny thing. It warms the heart and cools the sting.\" ',NULL,'2018-01-05 14:17:48','2018-01-05 14:17:48'),(287,'2018-10-14',' \"It takes one person to forgive, it takes two people to be reunited.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(288,'2018-10-15',' \"Forgiveness is a gift you give yourself.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(289,'2018-10-16',' \"Without forgiveness, there\'s no future.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(290,'2018-10-17',' \"Sooner or later we\'ve all got to let go of our past.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(291,'2018-10-18',' \"Yesterday is not ours to recover, but tomorrow is ours to win or lose.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(292,'2018-10-19',' \"The great courageous act that we must all do, is to have the courage to step out of our history and past so that we can live our dreams.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(293,'2018-10-20',' \"I\'ve learned through the years that it\'s not where you live, it\'s the people who surround you that make you feel at home.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(294,'2018-10-21','\"The love of family and the admiration of friends is much more important than wealth and privilege.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(295,'2018-10-22',' \"Family is not an important thing. It\'s everything.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(296,'2018-10-23',' \"Family is the most important thing in the world.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(297,'2018-10-24',' \"A happy family is but an earlier heaven.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(298,'2018-10-25',' \"A man should never neglect his family for business.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(299,'2018-10-26',' \"To us, family means putting your arms around each other and being there.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(300,'2018-10-27',' \"Without a family, man, alone in the world, trembles with the cold.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(301,'2018-10-28',' \"Cherish your human connections--your relationships with friends and family.\" ',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(302,'2018-10-29',' \"In every conceivable manner, the family is link to our past, bridge to our future.\"',NULL,'2018-01-05 14:17:49','2018-01-05 14:17:49'),(303,'2018-10-30',' \"The family is one of nature\'s masterpieces.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(304,'2018-10-31','. \"The family is the first essential cell of human society.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(305,'2018-11-01',' \"Family means no one gets left behind or forgotten.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(306,'2018-11-02','\"A man travels the world over in search of what he needs, and returns home to find it.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(307,'2018-11-03','\"I sustain myself with the love of family.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(308,'2018-11-04',' \"Home is where you are loved the most and act the worst.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(309,'2018-11-05',' \"You are born into your family and your family is born into you. No returns. No exchanges.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(310,'2018-11-06',' \"Home is people. Not a place. If you go back there after the people are gone, then all you can see is what is not there any more.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(311,'2018-11-07','\"That which does not kill us makes us stronger.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(312,'2018-11-08',' \"We are only as strong as we are united, as weak as we are divided.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(313,'2018-11-09',' \"Courage is the most important of all the virtues because without courage, you can\'t practice any other virtue consistently.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(314,'2018-11-10',' \"A brave man acknowledges the strength of others.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(315,'2018-11-11',' \"Strength does not come from physical capacity. It comes from an indomitable will.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(316,'2018-11-12','\"It is easier to build strong children than to repair broken men.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(317,'2018-11-13','\"With the new day comes new strength and new thoughts.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(318,'2018-11-14','\"The world breaks every one and afterward many are strong at the broken places.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(319,'2018-11-15','\"Be strong. Live honorably and with dignity. When you don\'t think you can, hold on.\" ',NULL,'2018-01-05 14:17:50','2018-01-05 14:17:50'),(320,'2018-11-16',' \"You feel your strength in the experience of pain.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(321,'2018-11-17','\"My attitude is that if you push me towards something that you think is a weakness, then I will turn that perceived weakness into a strength.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(322,'2018-11-18','\"Its not always necessary to be strong, but to feel strong.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(323,'2018-11-19',' \"We acquire the strength we have overcome.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(324,'2018-11-20',' \"Mastering others is strength. Mastering oneself makes you fearless.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(325,'2018-11-21',' \"We gain strength, and courage, and confidence by each experience in which we really stop to look fear in the face... we must do that which we think we cannot.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(326,'2018-11-22',' \"Character cannot be developed in ease and quiet. Only through experience of trial and suffering can the soul be strengthened, ambition inspired, and success achieved.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(327,'2018-11-23',' \"Shallow men believe in luck. Strong men believe in cause and effect.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(328,'2018-11-24','\"Leadership is service, not position.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(329,'2018-11-25','\"A leader is a dealer in hope.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(330,'2018-11-26',' \"A leader is one who knows the way, goes the way, and shows the way.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(331,'2018-11-27',' \"No man will make a great leader who wants to do it all himself, or to get all the credit for doing it.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(332,'2018-11-28','\"As we look ahead into the next century, leaders will be those who empower others.\" ',NULL,'2018-01-05 14:17:51','2018-01-05 14:17:51'),(333,'2018-11-29','\"A genuine leader is not a searcher for consensus but a molder of consensus.\"',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(334,'2018-11-30','\"Effective leadership is not about making speeches or being liked; leadership is defined by results not attributes.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(335,'2018-12-01','\"Innovation distinguishes between a leader and a follower.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(336,'2018-12-02','\"Be the chief but never the lord.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(337,'2018-12-03',' \"The speed of the team is the speed of the boss. \"',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(338,'2018-12-04',' \"Leaders think and talk about the solutions. Followers think and talk about the problems.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(339,'2018-12-05',' \"Leadership and learning are indispensable to each other.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(340,'2018-12-06',' \"To handle yourself, use your head; to handle others, use your heart.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(341,'2018-12-07','\"Management is nothing more than motivating other people.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(342,'2018-12-08',' \"Management is efficiency in climbing the ladder of success; leadership determines whether the ladder is leaning against the right wall.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(343,'2018-12-09',' \"The price of greatness is responsibility.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(344,'2018-12-10',' \"The key to successful leadership today is influence, not authority.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(345,'2018-12-11',' \"Create with the heart; build with the mind.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(346,'2018-12-12',' \"No legacy is so rich as honesty.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(347,'2018-12-13',' \"Carve your name on hearts, not tombstones. A legacy is etched into the minds of others and the stories they share about you.\" ',NULL,'2018-01-05 14:17:52','2018-01-05 14:17:52'),(348,'2018-12-14',' \"If you would not be forgotten as soon as you are dead, either write something worth reading or do something worth writing.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(349,'2018-12-15','\"The things you do for yourself are gone when you are gone, but the things you do for others remain as your legacy.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(350,'2018-12-16',' \"The only thing you take with you when you\'re gone is what you leave behind.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(351,'2018-12-17','\"I agree with you entirely in condemning the mania of giving names to objects of any kind after persons still living. Death alone can seal the title of any man to this honor, by putting it out of his power to forfeit it.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(352,'2018-12-18',' \"The greatest use of life is to spend it for something that will outlast it.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(353,'2018-12-19',' \"You can\'t leave a footprint that lasts if you\'re always walking on tiptoe.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(354,'2018-12-20','\"If you succumb to the temptation of using violence in the struggle, unborn generations will be the recipients of a long and desolate night of bitterness, and your chief legacy to the future will be an endless reign of meaningless chaos.\" ',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(355,'2018-12-21','\"Whatever the mind of man can conceive and believe, it can achieve.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(356,'2018-12-22','\"Strive not to be a success, but rather to be of value.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(357,'2018-12-23','\"Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(358,'2018-12-24','\"I attribute my success to this: I never gave or took any excuse.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(359,'2018-12-25','\"You miss 100% of the shots you don’t take.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(360,'2018-12-26','\"The most difficult thing is the decision to act, the rest is merely tenacity.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(361,'2018-12-27','\"Every strike brings me closer to the next home run.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(362,'2018-12-28','\"Definiteness of purpose is the starting point of all achievement.\"',NULL,'2018-01-05 14:17:53','2018-01-05 14:17:53'),(363,'2018-12-29','\"Life isn\'t about getting and having, it\'s about giving and being.\"',NULL,'2018-01-05 14:17:54','2018-01-05 14:17:54'),(364,'2018-12-30','\"Life is what happens to you while you’re busy making other plans.\"',NULL,'2018-01-05 14:17:54','2018-01-05 14:17:54'),(365,'2018-12-31','\"We become what we think about.\"',NULL,'2018-01-05 14:17:54','2018-01-05 14:17:54');
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
  CONSTRAINT `fk_rails_66e80626aa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_aec79e9d4b` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
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
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_approvals_on_training_request_id` (`training_request_id`),
  KEY `index_training_approvals_on_employee_id` (`employee_id`),
  KEY `index_training_approvals_on_training_topic_master_id` (`training_topic_master_id`),
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
INSERT INTO `travel_expence_types` VALUES (1,'ET_1001','Travel Expense',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(2,'ET_1002','Food Expense',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(3,'ET_1003','Laundary Expense',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(4,'ET_1004','Lodging Expense',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40');
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
INSERT INTO `travel_modes` VALUES (1,'TM_1001','By Plan',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(2,'TM_1002','By Bus',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(3,'TM_1003','By train',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(4,'TM_1004','By Ship',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40');
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
INSERT INTO `travel_options` VALUES (1,'TO_1001','Domestic',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(2,'TO_1002','National',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40'),(3,'TO_1003','International',NULL,NULL,'2018-01-03 13:11:40','2018-01-03 13:11:40');
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
  CONSTRAINT `fk_rails_2f199330b2` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_b07d84a89f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
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
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `vacancy_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vacancy_fullfillment_date` date DEFAULT NULL,
  `vacancy_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experince_max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replacement_id` int(11) DEFAULT NULL,
  `notice_period` tinyint(1) DEFAULT NULL,
  `notice_period_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relocation_rerimbursement` tinyint(1) DEFAULT NULL,
  `relocation_cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `vacancy_of` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT NULL,
  `target_company_id` int(11) DEFAULT NULL,
  `secondary_skill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  CONSTRAINT `fk_rails_0990a86378` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
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
  CONSTRAINT `fk_rails_303f7c28a8` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_cf7bd63395` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_off_masters`
--

LOCK TABLES `week_off_masters` WRITE;
/*!40000 ALTER TABLE `week_off_masters` DISABLE KEYS */;
INSERT INTO `week_off_masters` VALUES (1,17,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(2,23,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(3,24,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(4,45,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(5,55,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(6,63,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(7,68,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(8,80,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(9,83,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(10,85,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(11,86,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(12,91,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(13,94,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:43','2018-01-08 16:30:43'),(14,109,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:44','2018-01-08 16:30:44'),(15,111,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:30:44','2018-01-08 16:30:44'),(16,20,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:31:39','2018-01-08 16:31:39'),(17,46,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:31:39','2018-01-08 16:31:39'),(18,106,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:31:39','2018-01-08 16:31:39'),(19,12,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:01','2018-01-08 16:32:01'),(20,31,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:01','2018-01-08 16:32:01'),(21,76,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:01','2018-01-08 16:32:01'),(22,3,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(23,36,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(24,39,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(25,47,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(26,61,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(27,101,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(28,107,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(29,133,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:32:48','2018-01-08 16:32:48'),(30,8,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:25','2018-01-08 16:33:25'),(31,9,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:25','2018-01-08 16:33:25'),(32,26,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:25','2018-01-08 16:33:25'),(33,73,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:25','2018-01-08 16:33:25'),(34,125,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:25','2018-01-08 16:33:25'),(35,16,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(36,34,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(37,38,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(38,42,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(39,53,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(40,62,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(41,65,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(42,67,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(43,70,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(44,77,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(45,79,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(46,89,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(47,100,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(48,102,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:52','2018-01-08 16:33:52'),(49,113,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(50,114,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(51,127,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(52,128,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(53,129,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(54,131,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(55,134,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:33:53','2018-01-08 16:33:53'),(56,14,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:34:15','2018-01-08 16:34:15'),(57,49,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:34:15','2018-01-08 16:34:15'),(58,82,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:34:15','2018-01-08 16:34:15'),(59,110,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:34:15','2018-01-08 16:34:15'),(60,124,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:34:15','2018-01-08 16:34:15'),(61,1,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:52','2018-01-08 16:36:52'),(62,2,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:52','2018-01-08 16:36:52'),(63,4,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:52','2018-01-08 16:36:52'),(64,5,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:52','2018-01-08 16:36:52'),(65,6,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:52','2018-01-08 16:36:52'),(66,7,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(67,10,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(68,11,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(69,13,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(70,15,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(71,18,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(72,19,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(73,21,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(74,22,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(75,25,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(76,27,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(77,28,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(78,30,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(79,33,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(80,35,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(81,37,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(82,40,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(83,41,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:53','2018-01-08 16:36:53'),(84,43,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(85,44,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(86,48,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(87,50,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(88,51,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(89,52,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(90,54,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(91,56,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(92,57,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(93,58,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(94,59,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(95,64,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(96,66,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(97,69,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(98,71,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(99,72,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(100,74,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(101,75,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(102,78,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(103,81,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:54','2018-01-08 16:36:54'),(104,84,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(105,86,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(106,87,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(107,88,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(108,90,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(109,92,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(110,93,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(111,95,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(112,96,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(113,97,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(114,98,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(115,99,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(116,103,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(117,104,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(118,105,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(119,108,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(120,112,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(121,115,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(122,116,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(123,117,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:55','2018-01-08 16:36:55'),(124,118,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(125,119,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(126,120,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(127,121,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(128,123,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(129,132,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(130,135,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(131,136,'Sun',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:36:56','2018-01-08 16:36:56'),(132,29,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:39:09','2018-01-08 16:39:09'),(133,60,'Thu',1,NULL,'2018-01-01','2020-12-31',NULL,'2018-01-08 16:40:38','2018-01-08 16:40:38');
/*!40000 ALTER TABLE `week_off_masters` ENABLE KEYS */;
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
INSERT INTO `years` VALUES (1,1960,NULL,'2018-01-03 13:11:41','2018-01-03 13:11:41'),(2,1961,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(3,1962,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(4,1963,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(5,1964,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(6,1965,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(7,1966,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(8,1967,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(9,1968,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(10,1969,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(11,1970,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(12,1971,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(13,1972,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(14,1973,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(15,1974,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(16,1975,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(17,1976,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(18,1977,NULL,'2018-01-03 13:11:42','2018-01-03 13:11:42'),(19,1978,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(20,1979,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(21,1980,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(22,1981,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(23,1982,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(24,1983,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(25,1984,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(26,1985,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(27,1986,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(28,1987,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(29,1988,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(30,1989,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(31,1990,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(32,1991,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(33,1992,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(34,1993,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(35,1994,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(36,1995,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(37,1996,NULL,'2018-01-03 13:11:43','2018-01-03 13:11:43'),(38,1997,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(39,1998,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(40,1999,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(41,2000,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(42,2001,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(43,2002,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(44,2003,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(45,2004,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(46,2005,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(47,2006,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(48,2007,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(49,2008,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(50,2009,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(51,2010,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(52,2011,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(53,2012,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(54,2013,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(55,2014,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(56,2015,NULL,'2018-01-03 13:11:44','2018-01-03 13:11:44'),(57,2016,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(58,2017,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(59,2018,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(60,2019,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(61,2020,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(62,2021,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(63,2022,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(64,2023,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(65,2024,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45'),(66,2025,NULL,'2018-01-03 13:11:45','2018-01-03 13:11:45');
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

-- Dump completed on 2018-01-08 17:12:54
