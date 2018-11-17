-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
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
-- Table structure for table `attendance_regularizations`
--

DROP TABLE IF EXISTS `attendance_regularizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_regularizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regularization_reason_id` int(11) DEFAULT NULL,
  `justification` text COLLATE utf8_unicode_ci,
  `manager_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attendance_regularizations_on_employee_id` (`employee_id`),
  KEY `index_attendance_regularizations_on_regularization_reason_id` (`regularization_reason_id`),
  CONSTRAINT `fk_rails_0b6388af13` FOREIGN KEY (`regularization_reason_id`) REFERENCES `regularization_reasons` (`id`),
  CONSTRAINT `fk_rails_246b3e2536` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_regularizations`
--

LOCK TABLES `attendance_regularizations` WRITE;
/*!40000 ALTER TABLE `attendance_regularizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_regularizations` ENABLE KEYS */;
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
-- Table structure for table `billing_options`
--

DROP TABLE IF EXISTS `billing_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expence_opestion_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_billing_options_on_expence_opestion_id` (`expence_opestion_id`),
  CONSTRAINT `fk_rails_d6fa0cc8a5` FOREIGN KEY (`expence_opestion_id`) REFERENCES `expence_opestions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_options`
--

LOCK TABLES `billing_options` WRITE;
/*!40000 ALTER TABLE `billing_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_options` ENABLE KEYS */;
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
INSERT INTO `blood_groups` VALUES (2,'0+',NULL,'2018-11-17 07:46:39','2018-11-17 07:46:39'),(3,'A+',NULL,'2018-11-17 07:46:47','2018-11-17 07:46:47'),(4,'A-',NULL,'2018-11-17 07:46:50','2018-11-17 07:46:50'),(5,'AB+',NULL,'2018-11-17 07:47:09','2018-11-17 07:47:14'),(6,'AB-',NULL,'2018-11-17 07:47:20','2018-11-17 07:47:20'),(7,'B+',NULL,'2018-11-17 07:47:25','2018-11-17 07:47:25'),(8,'B-',NULL,'2018-11-17 07:47:28','2018-11-17 07:47:28'),(9,'O+',NULL,'2018-11-17 07:47:31','2018-11-17 07:47:31');
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
INSERT INTO `companies` VALUES (1,NULL,'CC_1001','COM001','Premier Ltd.','Premier Ltd.',1,'123456','AAQPP94885','27AADDS5671L1ZU','','Mumbai Pune Road, Chinchwad,Pune',1,NULL,NULL,'pune',411019,'','9909909900','http://premier.co.in','2018-11-17','2018-11-17 06:12:23','2018-11-17 06:14:16',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'CLC_1001','COMLOC001','Pune','rmtavhare@premier.co.in','Mumbai Pune Road, Chinchwad, Pune','Pune',1,1,363,411019,' +91-20-66310000','2018-11-17 06:16:22','2018-11-17 06:19:46'),(2,1,'CLC_1002','COMLOC002','Mumbai','rmtavhare@premier.co.in','58, Nariman Bhavan, Nariman Point, Mumbai','Mumbai',1,1,355,400021,'+91-22-61179000','2018-11-17 06:18:48','2018-11-17 06:18:48'),(3,1,'CLC_1003','COMLOC003','Chennai (Guindy)','rmtavhare@premier.co.in','T-8/1, 4th Main Road Anna Nagar, Chennai ','Chennai',1,23,468,600,'+91-44-2619 0809','2018-11-17 06:27:22','2018-11-17 06:27:22'),(4,1,'CLC_1004','COMLOC004','Delhi','rmtavhare@premier.co.in','407, World Trade Centre, Bara Khamba Lane, New Delhi','New Delhi',1,33,139,110,'+91-11-2341 3331','2018-11-17 06:29:37','2018-11-17 06:29:37'),(5,1,'CLC_1005','COMLOC005','Kolkata','rmtavhare@premier.co.in','1st Floor, Commerce House Room No.7 & 7A,  2 Ganesh Chandra Avenue,  Kolkata','Kolkata',1,28,645,700,'93321 01342','2018-11-17 06:31:30','2018-11-17 06:31:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'CT_1001','Private Limited','Private Limited',NULL,'2018-11-17 06:07:54','2018-11-17 06:07:54');
/*!40000 ALTER TABLE `company_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_records`
--

DROP TABLE IF EXISTS `compliance_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliance_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compliance_type_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `compliance_date` date DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_compliance_records_on_compliance_type_id` (`compliance_type_id`),
  KEY `index_compliance_records_on_agency_id` (`agency_id`),
  CONSTRAINT `fk_rails_266e53ca69` FOREIGN KEY (`compliance_type_id`) REFERENCES `compliance_types` (`id`),
  CONSTRAINT `fk_rails_38fb9d9051` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance_records`
--

LOCK TABLES `compliance_records` WRITE;
/*!40000 ALTER TABLE `compliance_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliance_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance_types`
--

DROP TABLE IF EXISTS `compliance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliance_types` (
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
-- Dumping data for table `compliance_types`
--

LOCK TABLES `compliance_types` WRITE;
/*!40000 ALTER TABLE `compliance_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliance_types` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
INSERT INTO `cost_centers` VALUES (1,'CC_1001','101',NULL,NULL,'2018-11-17 09:09:24','2018-11-17 09:09:24'),(2,'CC_1002','103',NULL,NULL,'2018-11-17 09:10:12','2018-11-17 09:10:12'),(3,'CC_1003','201',NULL,NULL,'2018-11-17 09:10:37','2018-11-17 09:10:37'),(4,'CC_1004','213',NULL,NULL,'2018-11-17 09:11:01','2018-11-17 09:11:01'),(5,'CC_1005','301',NULL,NULL,'2018-11-17 09:11:24','2018-11-17 09:11:24'),(6,'CC_1006','302',NULL,NULL,'2018-11-17 09:11:44','2018-11-17 09:11:44'),(7,'CC_1007','303',NULL,NULL,'2018-11-17 09:13:26','2018-11-17 09:13:26'),(8,'CC_1008','304',NULL,NULL,'2018-11-17 09:14:40','2018-11-17 09:14:40'),(9,'CC_1009','308',NULL,NULL,'2018-11-17 09:15:03','2018-11-17 09:15:03'),(10,'CC_1010','311',NULL,NULL,'2018-11-17 09:15:28','2018-11-17 09:15:28'),(11,'CC_1011','331',NULL,NULL,'2018-11-17 09:16:05','2018-11-17 09:16:05'),(12,'CC_1012','333',NULL,NULL,'2018-11-17 09:16:19','2018-11-17 09:17:11'),(13,'CC_1013','401',NULL,NULL,'2018-11-17 09:17:28','2018-11-17 09:17:28'),(14,'CC_1014','405',NULL,NULL,'2018-11-17 09:17:55','2018-11-17 09:17:55'),(15,'CC_1015','406',NULL,NULL,'2018-11-17 09:18:28','2018-11-17 09:18:28'),(16,'CC_1016','411',NULL,NULL,'2018-11-17 09:18:49','2018-11-17 09:18:49'),(17,'CC_1017','473',NULL,NULL,'2018-11-17 09:23:46','2018-11-17 09:23:46'),(18,'CC_1018','501',NULL,NULL,'2018-11-17 09:24:16','2018-11-17 09:24:16'),(19,'CC_1019','601',NULL,NULL,'2018-11-17 09:24:56','2018-11-17 09:24:56'),(20,'CC_1020','701',NULL,NULL,'2018-11-17 09:25:22','2018-11-17 09:25:22'),(21,'CC_1021','711',NULL,NULL,'2018-11-17 09:26:05','2018-11-17 09:26:05'),(22,'CC_1022','801',NULL,NULL,'2018-11-17 09:26:30','2018-11-17 09:26:30'),(23,'CC_1023','850',NULL,NULL,'2018-11-17 09:27:00','2018-11-17 09:27:00'),(24,'CC_1024','901',NULL,NULL,'2018-11-17 09:27:28','2018-11-17 09:27:28'),(25,'CC_1025','1001',NULL,NULL,'2018-11-17 09:29:54','2018-11-17 09:29:54'),(26,'CC_1026','1101',NULL,NULL,'2018-11-17 09:42:51','2018-11-17 09:42:51'),(27,'CC_1027','1201',NULL,NULL,'2018-11-17 09:43:10','2018-11-17 09:43:10'),(28,'CC_1028','1203',NULL,NULL,'2018-11-17 09:44:53','2018-11-17 09:44:53'),(29,'CC_1029','1205',NULL,NULL,'2018-11-17 09:45:43','2018-11-17 09:45:43'),(30,'CC_1030','1230',NULL,NULL,'2018-11-17 09:46:20','2018-11-17 09:46:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'C001','India','2018-11-17 06:02:20','2018-11-17 06:02:20'),(2,'C002','NA','2018-11-17 06:02:20','2018-11-17 06:02:20');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_auto_increments_on_counter_model_name` (`counter_model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_auto_increments`
--

LOCK TABLES `custom_auto_increments` WRITE;
/*!40000 ALTER TABLE `custom_auto_increments` DISABLE KEYS */;
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2018-11-17 06:12:23','2018-11-17 06:12:23'),(2,'company_location',5,'2018-11-17 06:16:22','2018-11-17 06:31:30'),(3,'department',30,'2018-11-17 07:11:15','2018-11-17 07:35:13'),(4,'employee',366,'2018-11-17 08:05:09','2018-11-17 08:05:19');
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
  `comment` text COLLATE utf8_unicode_ci,
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
  `expence_opestion_id` int(11) DEFAULT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `billing_option_id` int(11) DEFAULT NULL,
  `billing_opestion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_daily_bill_details_on_travel_request_id` (`travel_request_id`),
  KEY `index_daily_bill_details_on_travel_expence_type_id` (`travel_expence_type_id`),
  KEY `index_daily_bill_details_on_currency_master_id` (`currency_master_id`),
  KEY `index_daily_bill_details_on_expence_opestion_id` (`expence_opestion_id`),
  KEY `index_daily_bill_details_on_mode_id` (`mode_id`),
  KEY `index_daily_bill_details_on_billing_option_id` (`billing_option_id`),
  CONSTRAINT `fk_rails_65250cd466` FOREIGN KEY (`billing_option_id`) REFERENCES `billing_options` (`id`),
  CONSTRAINT `fk_rails_72d5ff4326` FOREIGN KEY (`expence_opestion_id`) REFERENCES `expence_opestions` (`id`),
  CONSTRAINT `fk_rails_bfd526f25a` FOREIGN KEY (`travel_expence_type_id`) REFERENCES `travel_expence_types` (`id`),
  CONSTRAINT `fk_rails_dca2001299` FOREIGN KEY (`currency_master_id`) REFERENCES `currency_masters` (`id`),
  CONSTRAINT `fk_rails_eb389e826f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
  CONSTRAINT `fk_rails_ed7995a53b` FOREIGN KEY (`mode_id`) REFERENCES `modes` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_types`
--

LOCK TABLES `degree_types` WRITE;
/*!40000 ALTER TABLE `degree_types` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_types`
--

LOCK TABLES `department_types` WRITE;
/*!40000 ALTER TABLE `department_types` DISABLE KEYS */;
INSERT INTO `department_types` VALUES (1,'DT_1001','Corporate','Corporate ',NULL,'2018-11-17 07:09:43','2018-11-17 07:36:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'DC_1003','DEPT001','','COO OFFICE',1,'',NULL,'2018-11-17 07:11:15','2018-11-17 07:19:26'),(2,1,'DC_1001','DEPT002','','ADMINISTRATION',1,'',NULL,'2018-11-17 07:18:17','2018-11-17 07:18:17'),(3,1,'DC_1002','DEPT003','','AUDIT',1,'',NULL,'2018-11-17 07:18:47','2018-11-17 07:18:47'),(4,1,'DC_1004','DEPT004','','CORPORATE OFFICE',1,'',NULL,'2018-11-17 07:20:17','2018-11-17 07:20:17'),(5,2,'DC_1005','DEPT005','','CORPORATE OFFICE',1,'',NULL,'2018-11-17 07:20:31','2018-11-17 07:20:31'),(6,1,'DC_1006','DEPT006','','DESIGN AND DEVELOPMENT GROUP',1,'',NULL,'2018-11-17 07:20:56','2018-11-17 07:20:56'),(7,1,'DC_1007','DEPT007','','ED MAINTENANCE',1,'',NULL,'2018-11-17 07:21:32','2018-11-17 07:21:32'),(8,1,'DC_1008','DEPT008','','ED MATERIALS',1,'',NULL,'2018-11-17 07:21:57','2018-11-17 07:21:57'),(9,1,'DC_1009','DEPT009','','ED PAINT SHOP',1,'',NULL,'2018-11-17 07:22:27','2018-11-17 07:22:27'),(10,1,'DC_1010','DEPT010','','ED PRODUCTION FABRICATION',1,'',NULL,'2018-11-17 07:23:10','2018-11-17 07:23:10'),(11,1,'DC_1011','DEPT011','','ED PRODUCTION MACHINING',1,'',NULL,'2018-11-17 07:23:47','2018-11-17 07:23:47'),(12,1,'DC_1012','DEPT012','','ED PROJECTS',1,'',NULL,'2018-11-17 07:24:37','2018-11-17 07:24:37'),(13,1,'DC_1013','DEPT013','','ED QA',1,'',NULL,'2018-11-17 07:25:17','2018-11-17 07:25:17'),(14,1,'DC_1014','DEPT014','','ED SALES & MARKETING',1,'',NULL,'2018-11-17 07:25:46','2018-11-17 07:25:46'),(15,1,'DC_1015','DEPT015','','ED STORES & LOGISTICS',1,'',NULL,'2018-11-17 07:26:30','2018-11-17 07:26:30'),(16,1,'DC_1016','DEPT016','','FINANCE',1,'',NULL,'2018-11-17 07:27:07','2018-11-17 07:27:07'),(17,1,'DC_1017','DEPT017','','H.R.D.',1,'',NULL,'2018-11-17 07:27:44','2018-11-17 07:27:44'),(18,1,'DC_1018','DEPT018','','HEAVY MACHINES GROUP',1,'',NULL,'2018-11-17 07:28:14','2018-11-17 07:28:14'),(19,1,'DC_1019','DEPT019','','LIGHT MACHINES GROUP',1,'',NULL,'2018-11-17 07:28:52','2018-11-17 07:28:52'),(20,1,'DC_1020','DEPT020','','MATERIALS',1,'',NULL,'2018-11-17 07:29:24','2018-11-17 07:29:24'),(21,1,'DC_1021','DEPT021','','MD LOGISTICS',1,'',NULL,'2018-11-17 07:30:14','2018-11-17 07:30:14'),(22,1,'DC_1022','DEPT022','','PRODUCTION PLANNING CONTROL',1,'',NULL,'2018-11-17 07:30:59','2018-11-17 07:30:59'),(23,1,'DC_1023','DEPT023','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:31:37','2018-11-17 07:31:37'),(24,5,'DC_1024','DEPT024','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:31:59','2018-11-17 07:31:59'),(25,3,'DC_1025','DEPT025','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:32:15','2018-11-17 07:32:15'),(26,4,'DC_1026','DEPT026','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:32:34','2018-11-17 07:32:34'),(27,1,'DC_1027','DEPT027','','SYSTEM',1,'',NULL,'2018-11-17 07:33:31','2018-11-17 07:33:31'),(28,1,'DC_1028','DEPT028','','TOOL ROOM / TOOL CRIB',1,'',NULL,'2018-11-17 07:34:04','2018-11-17 07:34:04'),(29,1,'DC_1029','DEPT029','','TQM,QA,STD',1,'',NULL,'2018-11-17 07:34:39','2018-11-17 07:34:39'),(30,1,'DC_1030','DEPT030','','VENDOR DEVELOPEMENT',1,'',NULL,'2018-11-17 07:35:13','2018-11-17 07:35:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,2,'D0001','Anantapur','2018-11-17 06:02:20','2018-11-17 06:02:20'),(2,2,'D0002','Chittoor','2018-11-17 06:02:20','2018-11-17 06:02:20'),(3,2,'D0003','East Godavari','2018-11-17 06:02:20','2018-11-17 06:02:20'),(4,2,'D0004','Guntur','2018-11-17 06:02:20','2018-11-17 06:02:20'),(5,2,'D0005','Krishna','2018-11-17 06:02:20','2018-11-17 06:02:20'),(6,2,'D0006','Kurnool','2018-11-17 06:02:20','2018-11-17 06:02:20'),(7,2,'D0007','Prakasam','2018-11-17 06:02:20','2018-11-17 06:02:20'),(8,2,'D0008','Srikakulam','2018-11-17 06:02:20','2018-11-17 06:02:20'),(9,2,'D0009','Sri Potti Sriramulu Nellore','2018-11-17 06:02:20','2018-11-17 06:02:20'),(10,2,'D0010','YSR District, Kadapa (Cuddapah)','2018-11-17 06:02:20','2018-11-17 06:02:20'),(11,2,'D0733','NA','2018-11-17 06:02:20','2018-11-17 06:02:20'),(12,3,'D0011','Anjaw','2018-11-17 06:02:20','2018-11-17 06:02:20'),(13,3,'D0012','Changlang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(14,3,'D0013','Dibang Valley','2018-11-17 06:02:20','2018-11-17 06:02:20'),(15,3,'D0014','East Kameng','2018-11-17 06:02:20','2018-11-17 06:02:20'),(16,3,'D0015','East Siang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(17,3,'D0016','Kra Daadi','2018-11-17 06:02:20','2018-11-17 06:02:20'),(18,3,'D0017','Kurung Kumey','2018-11-17 06:02:20','2018-11-17 06:02:20'),(19,3,'D0018','Lohit','2018-11-17 06:02:20','2018-11-17 06:02:20'),(20,3,'D0019','Longding','2018-11-17 06:02:20','2018-11-17 06:02:20'),(21,3,'D0020','Lower Dibang Valley','2018-11-17 06:02:20','2018-11-17 06:02:20'),(22,3,'D0021','Lower Siang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(23,3,'D0022','Lower Subansiri','2018-11-17 06:02:20','2018-11-17 06:02:20'),(24,3,'D0023','Namsai','2018-11-17 06:02:20','2018-11-17 06:02:20'),(25,3,'D0024','Papum Pare','2018-11-17 06:02:20','2018-11-17 06:02:20'),(26,3,'D0025','Siang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(27,3,'D0026','Tawang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(28,3,'D0027','Tirap','2018-11-17 06:02:20','2018-11-17 06:02:20'),(29,3,'D0028','Upper Siang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(30,3,'D0029','Upper Subansiri','2018-11-17 06:02:20','2018-11-17 06:02:20'),(31,3,'D0030','West Kameng','2018-11-17 06:02:20','2018-11-17 06:02:20'),(32,3,'D0031','West Siang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(33,3,'D0734','NA','2018-11-17 06:02:20','2018-11-17 06:02:20'),(34,4,'D0032','Baksa','2018-11-17 06:02:20','2018-11-17 06:02:20'),(35,4,'D0033','Barpeta','2018-11-17 06:02:20','2018-11-17 06:02:20'),(36,4,'D0034','Biswanath','2018-11-17 06:02:20','2018-11-17 06:02:20'),(37,4,'D0035','Bongaigaon','2018-11-17 06:02:20','2018-11-17 06:02:20'),(38,4,'D0036','Cachar','2018-11-17 06:02:20','2018-11-17 06:02:20'),(39,4,'D0037','Charaideo','2018-11-17 06:02:20','2018-11-17 06:02:20'),(40,4,'D0038','Chirang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(41,4,'D0039','Darrang','2018-11-17 06:02:20','2018-11-17 06:02:20'),(42,4,'D0040','Dhemaji','2018-11-17 06:02:20','2018-11-17 06:02:20'),(43,4,'D0041','Dhubri','2018-11-17 06:02:20','2018-11-17 06:02:20'),(44,4,'D0042','Dibrugarh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(45,4,'D0043','Dima Hasao (North Cachar Hills)','2018-11-17 06:02:20','2018-11-17 06:02:20'),(46,4,'D0044','Goalpara','2018-11-17 06:02:20','2018-11-17 06:02:20'),(47,4,'D0045','Golaghat','2018-11-17 06:02:20','2018-11-17 06:02:20'),(48,4,'D0046','Hailakandi','2018-11-17 06:02:20','2018-11-17 06:02:20'),(49,4,'D0047','Hojai','2018-11-17 06:02:20','2018-11-17 06:02:20'),(50,4,'D0048','Jorhat','2018-11-17 06:02:20','2018-11-17 06:02:20'),(51,4,'D0049','Kamrup','2018-11-17 06:02:20','2018-11-17 06:02:20'),(52,4,'D0050','Kamrup Metropolitan','2018-11-17 06:02:20','2018-11-17 06:02:20'),(53,4,'D0051','Karbi Anglong','2018-11-17 06:02:20','2018-11-17 06:02:20'),(54,4,'D0052','Karimganj','2018-11-17 06:02:21','2018-11-17 06:02:21'),(55,4,'D0053','Kokrajhar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(56,4,'D0054','Lakhimpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(57,4,'D0056','Majuli','2018-11-17 06:02:21','2018-11-17 06:02:21'),(58,4,'D0057','Morigaon','2018-11-17 06:02:21','2018-11-17 06:02:21'),(59,4,'D0058','Nagaon','2018-11-17 06:02:21','2018-11-17 06:02:21'),(60,4,'D0059','Nalbari','2018-11-17 06:02:21','2018-11-17 06:02:21'),(61,4,'D0060','Sivasagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(62,4,'D0061','Sonitpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(63,4,'D0062','South Salamara-Mankachar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(64,4,'D0063','Tinsukia','2018-11-17 06:02:21','2018-11-17 06:02:21'),(65,4,'D0064','Udalguri','2018-11-17 06:02:21','2018-11-17 06:02:21'),(66,4,'D0065','West Karbi Anglong','2018-11-17 06:02:21','2018-11-17 06:02:21'),(67,4,'D0735','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(68,5,'D0066','Araria','2018-11-17 06:02:21','2018-11-17 06:02:21'),(69,5,'D0067','Arwal','2018-11-17 06:02:21','2018-11-17 06:02:21'),(70,5,'D0068','Aurangabad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(71,5,'D0069','Banka','2018-11-17 06:02:21','2018-11-17 06:02:21'),(72,5,'D0070','Begusarai','2018-11-17 06:02:21','2018-11-17 06:02:21'),(73,5,'D0071','Bhagalpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(74,5,'D0072','Bhojpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(75,5,'D0073','Buxar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(76,5,'D0074','Darbhanga','2018-11-17 06:02:21','2018-11-17 06:02:21'),(77,5,'D0075','East Champaran (Motihari)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(78,5,'D0076','Gaya','2018-11-17 06:02:21','2018-11-17 06:02:21'),(79,5,'D0077','Gopalganj','2018-11-17 06:02:21','2018-11-17 06:02:21'),(80,5,'D0078','Jamui','2018-11-17 06:02:21','2018-11-17 06:02:21'),(81,5,'D0079','Jehanabad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(82,5,'D0080','Kaimur (Bhabua)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(83,5,'D0081','Katihar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(84,5,'D0082','Khagaria','2018-11-17 06:02:21','2018-11-17 06:02:21'),(85,5,'D0083','Kishanganj','2018-11-17 06:02:21','2018-11-17 06:02:21'),(86,5,'D0084','Lakhisarai','2018-11-17 06:02:21','2018-11-17 06:02:21'),(87,5,'D0085','Madhepura','2018-11-17 06:02:21','2018-11-17 06:02:21'),(88,5,'D0086','Madhubani','2018-11-17 06:02:21','2018-11-17 06:02:21'),(89,5,'D0087','Munger (Monghyr)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(90,5,'D0088','Muzaffarpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(91,5,'D0089','Nalanda','2018-11-17 06:02:21','2018-11-17 06:02:21'),(92,5,'D0090','Nawada','2018-11-17 06:02:21','2018-11-17 06:02:21'),(93,5,'D0091','Patna','2018-11-17 06:02:21','2018-11-17 06:02:21'),(94,5,'D0092','Purnia (Purnea)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(95,5,'D0093','Rohtas','2018-11-17 06:02:21','2018-11-17 06:02:21'),(96,5,'D0094','Saharsa','2018-11-17 06:02:21','2018-11-17 06:02:21'),(97,5,'D0095','Samastipur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(98,5,'D0096','Saran','2018-11-17 06:02:21','2018-11-17 06:02:21'),(99,5,'D0097','Sheikhpura','2018-11-17 06:02:21','2018-11-17 06:02:21'),(100,5,'D0098','Sheohar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(101,5,'D0099','Sitamarhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(102,5,'D0100','Siwan','2018-11-17 06:02:21','2018-11-17 06:02:21'),(103,5,'D0101','Supaul','2018-11-17 06:02:21','2018-11-17 06:02:21'),(104,5,'D0102','Vaishali','2018-11-17 06:02:21','2018-11-17 06:02:21'),(105,5,'D0103','West Champaran','2018-11-17 06:02:21','2018-11-17 06:02:21'),(106,5,'D0736','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(107,29,'D0104','Chandigarh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(108,29,'D0737','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(109,6,'D0106','Balod','2018-11-17 06:02:21','2018-11-17 06:02:21'),(110,6,'D0107','Baloda Bazar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(111,6,'D0108','Balrampur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(112,6,'D0109','Bastar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(113,6,'D0110','Bemetara','2018-11-17 06:02:21','2018-11-17 06:02:21'),(114,6,'D0111','Bijapur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(115,6,'D0112','Bilaspur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(116,6,'D0113','Dantewada (South Bastar)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(117,6,'D0114','Dhamtari','2018-11-17 06:02:21','2018-11-17 06:02:21'),(118,6,'D0115','Durg','2018-11-17 06:02:21','2018-11-17 06:02:21'),(119,6,'D0116','Gariyaband','2018-11-17 06:02:21','2018-11-17 06:02:21'),(120,6,'D0117','Janjgir-Champa','2018-11-17 06:02:21','2018-11-17 06:02:21'),(121,6,'D0118','Jashpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(122,6,'D0119','Kabirdham (Kawardha)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(123,6,'D0120','Kanker (North Bastar)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(124,6,'D0121','Kondagaon','2018-11-17 06:02:21','2018-11-17 06:02:21'),(125,6,'D0122','Korba','2018-11-17 06:02:21','2018-11-17 06:02:21'),(126,6,'D0123','Korea (Koriya)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(127,6,'D0124','Mahasamund','2018-11-17 06:02:21','2018-11-17 06:02:21'),(128,6,'D0125','Mungeli','2018-11-17 06:02:21','2018-11-17 06:02:21'),(129,6,'D0126','Narayanpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(130,6,'D0127','Raigarh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(131,6,'D0128','Raipur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(132,6,'D0129','Rajnandgaon','2018-11-17 06:02:21','2018-11-17 06:02:21'),(133,6,'D0130','Sukma','2018-11-17 06:02:21','2018-11-17 06:02:21'),(134,6,'D0131','Surajpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(135,6,'D0132','Surguja','2018-11-17 06:02:21','2018-11-17 06:02:21'),(136,6,'D0738','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(137,33,'D0133','Central Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(138,33,'D0134','East Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(139,33,'D0135','New Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(140,33,'D0136','North Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(141,33,'D0137','North East Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(142,33,'D0138','North West Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(143,33,'D0139','Shahdara','2018-11-17 06:02:21','2018-11-17 06:02:21'),(144,33,'D0140','South Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(145,33,'D0141','South East Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(146,33,'D0142','South West Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(147,33,'D0143','West Delhi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(148,33,'D0739','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(149,7,'D0144','North Goa','2018-11-17 06:02:21','2018-11-17 06:02:21'),(150,7,'D0145','South Goa','2018-11-17 06:02:21','2018-11-17 06:02:21'),(151,7,'D0740','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(152,8,'D0146','Ahmedabad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(153,8,'D0147','Amreli','2018-11-17 06:02:21','2018-11-17 06:02:21'),(154,8,'D0148','Anand','2018-11-17 06:02:21','2018-11-17 06:02:21'),(155,8,'D0149','Aravalli','2018-11-17 06:02:21','2018-11-17 06:02:21'),(156,8,'D0150','Banaskantha (Palanpur)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(157,8,'D0151','Bharuch','2018-11-17 06:02:21','2018-11-17 06:02:21'),(158,8,'D0152','Bhavnagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(159,8,'D0153','Botad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(160,8,'D0154','Chhota Udepur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(161,8,'D0155','Dahod','2018-11-17 06:02:21','2018-11-17 06:02:21'),(162,8,'D0156','Dangs (Ahwa)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(163,8,'D0157','Devbhoomi Dwarka','2018-11-17 06:02:21','2018-11-17 06:02:21'),(164,8,'D0158','Gandhinagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(165,8,'D0159','Gir Somnath','2018-11-17 06:02:21','2018-11-17 06:02:21'),(166,8,'D0160','Jamnagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(167,8,'D0161','Junagadh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(168,8,'D0162','Kachchh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(169,8,'D0163','Kheda (Nadiad)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(170,8,'D0164','Mahisagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(171,8,'D0165','Mehsana','2018-11-17 06:02:21','2018-11-17 06:02:21'),(172,8,'D0166','Morbi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(173,8,'D0167','Narmada (Rajpipla)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(174,8,'D0168','Navsari','2018-11-17 06:02:21','2018-11-17 06:02:21'),(175,8,'D0169','Panchmahal (Godhra)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(176,8,'D0170','Patan','2018-11-17 06:02:21','2018-11-17 06:02:21'),(177,8,'D0171','Porbandar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(178,8,'D0172','Rajkot','2018-11-17 06:02:21','2018-11-17 06:02:21'),(179,8,'D0173','Sabarkantha (Himmatnagar)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(180,8,'D0174','Surat','2018-11-17 06:02:21','2018-11-17 06:02:21'),(181,8,'D0175','Surendranagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(182,8,'D0176','Tapi (Vyara)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(183,8,'D0177','Vadodara','2018-11-17 06:02:21','2018-11-17 06:02:21'),(184,8,'D0178','Valsad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(185,8,'D0741','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(186,9,'D0179','Ambala','2018-11-17 06:02:21','2018-11-17 06:02:21'),(187,9,'D0180','Bhiwani','2018-11-17 06:02:21','2018-11-17 06:02:21'),(188,9,'D0181','Charkhi Dadri','2018-11-17 06:02:21','2018-11-17 06:02:21'),(189,9,'D0182','Faridabad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(190,9,'D0183','Fatehabad','2018-11-17 06:02:21','2018-11-17 06:02:21'),(191,9,'D0184','Gurugram (Gurgaon)','2018-11-17 06:02:21','2018-11-17 06:02:21'),(192,9,'D0185','Hisar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(193,9,'D0186','Jhajjar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(194,9,'D0187','Jind','2018-11-17 06:02:21','2018-11-17 06:02:21'),(195,9,'D0188','Kaithal','2018-11-17 06:02:21','2018-11-17 06:02:21'),(196,9,'D0189','Karnal','2018-11-17 06:02:21','2018-11-17 06:02:21'),(197,9,'D0190','Kurukshetra','2018-11-17 06:02:21','2018-11-17 06:02:21'),(198,9,'D0191','Mahendragarh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(199,9,'D0192','Nuh','2018-11-17 06:02:21','2018-11-17 06:02:21'),(200,9,'D0193','Palwal','2018-11-17 06:02:21','2018-11-17 06:02:21'),(201,9,'D0194','Panchkula','2018-11-17 06:02:21','2018-11-17 06:02:21'),(202,9,'D0195','Panipat','2018-11-17 06:02:21','2018-11-17 06:02:21'),(203,9,'D0196','Rewari','2018-11-17 06:02:21','2018-11-17 06:02:21'),(204,9,'D0197','Rohtak','2018-11-17 06:02:21','2018-11-17 06:02:21'),(205,9,'D0198','Sirsa','2018-11-17 06:02:21','2018-11-17 06:02:21'),(206,9,'D0199','Sonipat','2018-11-17 06:02:21','2018-11-17 06:02:21'),(207,9,'D0200','Yamunanagar','2018-11-17 06:02:21','2018-11-17 06:02:21'),(208,9,'D0742','NA','2018-11-17 06:02:21','2018-11-17 06:02:21'),(209,10,'D0201','Bilaspur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(210,10,'D0203','Chamba','2018-11-17 06:02:21','2018-11-17 06:02:21'),(211,10,'D0204','Hamirpur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(212,10,'D0205','Kangra','2018-11-17 06:02:21','2018-11-17 06:02:21'),(213,10,'D0206','Kinnaur','2018-11-17 06:02:21','2018-11-17 06:02:21'),(214,10,'D0207','Kullu','2018-11-17 06:02:21','2018-11-17 06:02:21'),(215,10,'D0208','Lahaul & Spiti','2018-11-17 06:02:21','2018-11-17 06:02:21'),(216,10,'D0209','Mandi','2018-11-17 06:02:21','2018-11-17 06:02:21'),(217,10,'D0210','Shimla','2018-11-17 06:02:22','2018-11-17 06:02:22'),(218,10,'D0211','Sirmaur (Sirmour)','2018-11-17 06:02:22','2018-11-17 06:02:22'),(219,10,'D0212','Solan','2018-11-17 06:02:22','2018-11-17 06:02:22'),(220,10,'D0213','Una','2018-11-17 06:02:22','2018-11-17 06:02:22'),(221,10,'D0743','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(222,11,'D0214','Anantnag','2018-11-17 06:02:22','2018-11-17 06:02:22'),(223,11,'D0215','Bandipore','2018-11-17 06:02:22','2018-11-17 06:02:22'),(224,11,'D0216','Baramulla','2018-11-17 06:02:22','2018-11-17 06:02:22'),(225,11,'D0217','Budgam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(226,11,'D0218','Doda','2018-11-17 06:02:22','2018-11-17 06:02:22'),(227,11,'D0219','Ganderbal','2018-11-17 06:02:22','2018-11-17 06:02:22'),(228,11,'D0220','Jammu','2018-11-17 06:02:22','2018-11-17 06:02:22'),(229,11,'D0221','Kargil','2018-11-17 06:02:22','2018-11-17 06:02:22'),(230,11,'D0222','Kathua','2018-11-17 06:02:22','2018-11-17 06:02:22'),(231,11,'D0223','Kishtwar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(232,11,'D0224','Kulgam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(233,11,'D0225','Kupwara','2018-11-17 06:02:22','2018-11-17 06:02:22'),(234,11,'D0226','Leh','2018-11-17 06:02:22','2018-11-17 06:02:22'),(235,11,'D0227','Poonch','2018-11-17 06:02:22','2018-11-17 06:02:22'),(236,11,'D0228','Pulwama','2018-11-17 06:02:22','2018-11-17 06:02:22'),(237,11,'D0229','Rajouri','2018-11-17 06:02:22','2018-11-17 06:02:22'),(238,11,'D0230','Ramban','2018-11-17 06:02:22','2018-11-17 06:02:22'),(239,11,'D0231','Reasi','2018-11-17 06:02:22','2018-11-17 06:02:22'),(240,11,'D0232','Samba','2018-11-17 06:02:22','2018-11-17 06:02:22'),(241,11,'D0233','Shopian','2018-11-17 06:02:22','2018-11-17 06:02:22'),(242,11,'D0234','Srinagar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(243,11,'D0235','Udhampur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(244,11,'D0744','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(245,12,'D0236','Bokaro','2018-11-17 06:02:22','2018-11-17 06:02:22'),(246,12,'D0237','Chatra','2018-11-17 06:02:22','2018-11-17 06:02:22'),(247,12,'D0238','Deoghar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(248,12,'D0239','Dhanbad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(249,12,'D0240','Dumka','2018-11-17 06:02:22','2018-11-17 06:02:22'),(250,12,'D0241','East Singhbhum','2018-11-17 06:02:22','2018-11-17 06:02:22'),(251,12,'D0242','Garhwa','2018-11-17 06:02:22','2018-11-17 06:02:22'),(252,12,'D0243','Giridih','2018-11-17 06:02:22','2018-11-17 06:02:22'),(253,12,'D0244','Godda','2018-11-17 06:02:22','2018-11-17 06:02:22'),(254,12,'D0245','Gumla','2018-11-17 06:02:22','2018-11-17 06:02:22'),(255,12,'D0246','Hazaribag','2018-11-17 06:02:22','2018-11-17 06:02:22'),(256,12,'D0247','Jamtara','2018-11-17 06:02:22','2018-11-17 06:02:22'),(257,12,'D0248','Khunti','2018-11-17 06:02:22','2018-11-17 06:02:22'),(258,12,'D0249','Koderma','2018-11-17 06:02:22','2018-11-17 06:02:22'),(259,12,'D0250','Latehar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(260,12,'D0251','Lohardaga','2018-11-17 06:02:22','2018-11-17 06:02:22'),(261,12,'D0252','Pakur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(262,12,'D0253','Palamu','2018-11-17 06:02:22','2018-11-17 06:02:22'),(263,12,'D0254','Ramgarh','2018-11-17 06:02:22','2018-11-17 06:02:22'),(264,12,'D0255','Ranchi','2018-11-17 06:02:22','2018-11-17 06:02:22'),(265,12,'D0256','Sahibganj','2018-11-17 06:02:22','2018-11-17 06:02:22'),(266,12,'D0257','Seraikela-Kharsawan','2018-11-17 06:02:22','2018-11-17 06:02:22'),(267,12,'D0258','Simdega','2018-11-17 06:02:22','2018-11-17 06:02:22'),(268,12,'D0259','West Singhbhum','2018-11-17 06:02:22','2018-11-17 06:02:22'),(269,12,'D0745','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(270,13,'D0260','Alappuzha','2018-11-17 06:02:22','2018-11-17 06:02:22'),(271,13,'D0261','Ernakulam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(272,13,'D0262','Idukki','2018-11-17 06:02:22','2018-11-17 06:02:22'),(273,13,'D0263','Kannur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(274,13,'D0264','Kasaragod','2018-11-17 06:02:22','2018-11-17 06:02:22'),(275,13,'D0265','Kollam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(276,13,'D0266','Kottayam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(277,13,'D0267','Kozhikode','2018-11-17 06:02:22','2018-11-17 06:02:22'),(278,13,'D0268','Malappuram','2018-11-17 06:02:22','2018-11-17 06:02:22'),(279,13,'D0269','Palakkad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(280,13,'D0270','Pathanamthitta','2018-11-17 06:02:22','2018-11-17 06:02:22'),(281,13,'D0271','Thiruvananthapuram','2018-11-17 06:02:22','2018-11-17 06:02:22'),(282,13,'D0272','Thrissur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(283,13,'D0273','Wayanad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(284,13,'D0746','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(285,34,'D0274','Lakshadweep','2018-11-17 06:02:22','2018-11-17 06:02:22'),(286,34,'D0747','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(287,14,'D0275','Agar Malwa','2018-11-17 06:02:22','2018-11-17 06:02:22'),(288,14,'D0276','Alirajpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(289,14,'D0277','Anuppur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(290,14,'D0278','Ashoknagar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(291,14,'D0279','Balaghat','2018-11-17 06:02:22','2018-11-17 06:02:22'),(292,14,'D0280','Barwani','2018-11-17 06:02:22','2018-11-17 06:02:22'),(293,14,'D0281','Betul','2018-11-17 06:02:22','2018-11-17 06:02:22'),(294,14,'D0282','Bhind','2018-11-17 06:02:22','2018-11-17 06:02:22'),(295,14,'D0283','Bhopal','2018-11-17 06:02:22','2018-11-17 06:02:22'),(296,14,'D0284','Burhanpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(297,14,'D0285','Chhatarpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(298,14,'D0286','Chhindwara','2018-11-17 06:02:22','2018-11-17 06:02:22'),(299,14,'D0287','Damoh','2018-11-17 06:02:22','2018-11-17 06:02:22'),(300,14,'D0288','Datia','2018-11-17 06:02:22','2018-11-17 06:02:22'),(301,14,'D0289','Dewas','2018-11-17 06:02:22','2018-11-17 06:02:22'),(302,14,'D0290','Dhar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(303,14,'D0291','Dindori','2018-11-17 06:02:22','2018-11-17 06:02:22'),(304,14,'D0292','Guna','2018-11-17 06:02:22','2018-11-17 06:02:22'),(305,14,'D0293','Gwalior','2018-11-17 06:02:22','2018-11-17 06:02:22'),(306,14,'D0294','Harda','2018-11-17 06:02:22','2018-11-17 06:02:22'),(307,14,'D0295','Hoshangabad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(308,14,'D0296','Indore','2018-11-17 06:02:22','2018-11-17 06:02:22'),(309,14,'D0298','Jabalpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(310,14,'D0299','Jhabua','2018-11-17 06:02:22','2018-11-17 06:02:22'),(311,14,'D0300','Katni','2018-11-17 06:02:22','2018-11-17 06:02:22'),(312,14,'D0301','Khandwa','2018-11-17 06:02:22','2018-11-17 06:02:22'),(313,14,'D0302','Khargone','2018-11-17 06:02:22','2018-11-17 06:02:22'),(314,14,'D0303','Mandla','2018-11-17 06:02:22','2018-11-17 06:02:22'),(315,14,'D0304','Mandsaur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(316,14,'D0305','Morena','2018-11-17 06:02:22','2018-11-17 06:02:22'),(317,14,'D0306','Narsinghpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(318,14,'D0307','Neemuch','2018-11-17 06:02:22','2018-11-17 06:02:22'),(319,14,'D0308','Panna','2018-11-17 06:02:22','2018-11-17 06:02:22'),(320,14,'D0309','Raisen','2018-11-17 06:02:22','2018-11-17 06:02:22'),(321,14,'D0310','Rajgarh','2018-11-17 06:02:22','2018-11-17 06:02:22'),(322,14,'D0311','Ratlam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(323,14,'D0312','Rewa','2018-11-17 06:02:22','2018-11-17 06:02:22'),(324,14,'D0313','Sagar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(325,14,'D0314','Satna','2018-11-17 06:02:22','2018-11-17 06:02:22'),(326,14,'D0315','Sehore','2018-11-17 06:02:22','2018-11-17 06:02:22'),(327,14,'D0316','Seoni','2018-11-17 06:02:22','2018-11-17 06:02:22'),(328,14,'D0317','Shahdol','2018-11-17 06:02:22','2018-11-17 06:02:22'),(329,14,'D0318','Shajapur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(330,14,'D0319','Sheopur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(331,14,'D0320','Shivpuri','2018-11-17 06:02:22','2018-11-17 06:02:22'),(332,14,'D0321','Sidhi','2018-11-17 06:02:22','2018-11-17 06:02:22'),(333,14,'D0322','Singrauli','2018-11-17 06:02:22','2018-11-17 06:02:22'),(334,14,'D0333','Tikamgarh','2018-11-17 06:02:22','2018-11-17 06:02:22'),(335,14,'D0334','Ujjain','2018-11-17 06:02:22','2018-11-17 06:02:22'),(336,14,'D0335','Umaria','2018-11-17 06:02:22','2018-11-17 06:02:22'),(337,14,'D0335','Vidisha','2018-11-17 06:02:22','2018-11-17 06:02:22'),(338,14,'D0748','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(339,1,'D0336','Ahmednagar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(340,1,'D0337','Akola','2018-11-17 06:02:22','2018-11-17 06:02:22'),(341,1,'D0339','Amravati','2018-11-17 06:02:22','2018-11-17 06:02:22'),(342,1,'D0340','Aurangabad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(343,1,'D0341','Beed','2018-11-17 06:02:22','2018-11-17 06:02:22'),(344,1,'D0342','Bhandara','2018-11-17 06:02:22','2018-11-17 06:02:22'),(345,1,'D0343','Buldhana','2018-11-17 06:02:22','2018-11-17 06:02:22'),(346,1,'D0344','Chandrapur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(347,1,'D0345','Dhule','2018-11-17 06:02:22','2018-11-17 06:02:22'),(348,1,'D0346','Gadchiroli','2018-11-17 06:02:22','2018-11-17 06:02:22'),(349,1,'D0347','Gondia','2018-11-17 06:02:22','2018-11-17 06:02:22'),(350,1,'D0348','Hingoli','2018-11-17 06:02:22','2018-11-17 06:02:22'),(351,1,'D0349','Jalgaon','2018-11-17 06:02:22','2018-11-17 06:02:22'),(352,1,'D0350','Jalna','2018-11-17 06:02:22','2018-11-17 06:02:22'),(353,1,'D0351','Kolhapur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(354,1,'D0352','Latur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(355,1,'D0353','Mumbai Suburban','2018-11-17 06:02:22','2018-11-17 06:02:22'),(356,1,'D0354','Nagpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(357,1,'D0355','Nanded','2018-11-17 06:02:22','2018-11-17 06:02:22'),(358,1,'D0356','Nandurbar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(359,1,'D0357','Nashik','2018-11-17 06:02:22','2018-11-17 06:02:22'),(360,1,'D0358','Osmanabad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(361,1,'D0359','Palghar','2018-11-17 06:02:22','2018-11-17 06:02:22'),(362,1,'D0360','Parbhani','2018-11-17 06:02:22','2018-11-17 06:02:22'),(363,1,'D0361','Pune','2018-11-17 06:02:22','2018-11-17 06:02:22'),(364,1,'D0362','Raigad','2018-11-17 06:02:22','2018-11-17 06:02:22'),(365,1,'D0363','Ratnagiri','2018-11-17 06:02:22','2018-11-17 06:02:22'),(366,1,'D0364','Sangli','2018-11-17 06:02:22','2018-11-17 06:02:22'),(367,1,'D0365','Satara','2018-11-17 06:02:22','2018-11-17 06:02:22'),(368,1,'D0366','Sindhudurg','2018-11-17 06:02:22','2018-11-17 06:02:22'),(369,1,'D0367','Solapur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(370,1,'D0368','Thane','2018-11-17 06:02:22','2018-11-17 06:02:22'),(371,1,'D0369','Wardha','2018-11-17 06:02:22','2018-11-17 06:02:22'),(372,1,'D0370','Washim','2018-11-17 06:02:22','2018-11-17 06:02:22'),(373,1,'D0371','Yavatmal','2018-11-17 06:02:22','2018-11-17 06:02:22'),(374,1,'D0749','NA','2018-11-17 06:02:22','2018-11-17 06:02:22'),(375,15,'D0372','Bishnupur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(376,15,'D0373','Chandel','2018-11-17 06:02:22','2018-11-17 06:02:22'),(377,15,'D0374','Churachandpur','2018-11-17 06:02:22','2018-11-17 06:02:22'),(378,15,'D0375','Imphal East','2018-11-17 06:02:22','2018-11-17 06:02:22'),(379,15,'D0376','Imphal West','2018-11-17 06:02:22','2018-11-17 06:02:22'),(380,15,'D0377','Jiribam','2018-11-17 06:02:22','2018-11-17 06:02:22'),(381,15,'D0378','Kakching','2018-11-17 06:02:22','2018-11-17 06:02:22'),(382,15,'D0379','Kamjong','2018-11-17 06:02:22','2018-11-17 06:02:22'),(383,15,'D0380','Kangpokpi','2018-11-17 06:02:22','2018-11-17 06:02:22'),(384,15,'D0381','Noney','2018-11-17 06:02:22','2018-11-17 06:02:22'),(385,15,'D0382','Pherzawl','2018-11-17 06:02:22','2018-11-17 06:02:22'),(386,15,'D0383','Senapati','2018-11-17 06:02:22','2018-11-17 06:02:22'),(387,15,'D0384','Tamenglong','2018-11-17 06:02:22','2018-11-17 06:02:22'),(388,15,'D0385','Tengnoupal','2018-11-17 06:02:22','2018-11-17 06:02:22'),(389,15,'D0386','Thoubal','2018-11-17 06:02:22','2018-11-17 06:02:22'),(390,15,'D0387','Ukhrul','2018-11-17 06:02:22','2018-11-17 06:02:22'),(391,15,'D0750','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(392,16,'D0388','East Garo Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(393,16,'D0390','East Jaintia Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(394,16,'D0391','East Khasi Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(395,16,'D0392','North Garo Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(396,16,'D0393','Ri Bhoi','2018-11-17 06:02:23','2018-11-17 06:02:23'),(397,16,'D0394','South Garo Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(398,16,'D0395','South West Garo Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(399,16,'D0396','South West Khasi Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(400,16,'D0397','West Garo Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(401,16,'D0398','West Jaintia Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(402,16,'D0399','West Khasi Hills','2018-11-17 06:02:23','2018-11-17 06:02:23'),(403,16,'D0751','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(404,17,'D0400','Aizawl','2018-11-17 06:02:23','2018-11-17 06:02:23'),(405,17,'D0401','Champhai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(406,17,'D0402','Kolasib','2018-11-17 06:02:23','2018-11-17 06:02:23'),(407,17,'D0403','Lawngtlai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(408,17,'D0404','Lunglei','2018-11-17 06:02:23','2018-11-17 06:02:23'),(409,17,'D0405','Mamit','2018-11-17 06:02:23','2018-11-17 06:02:23'),(410,17,'D0406','Saiha','2018-11-17 06:02:23','2018-11-17 06:02:23'),(411,17,'D0407','Serchhip','2018-11-17 06:02:23','2018-11-17 06:02:23'),(412,17,'D0752','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(413,18,'D0408','Dimapur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(414,18,'D0409','Kiphire','2018-11-17 06:02:23','2018-11-17 06:02:23'),(415,18,'D0410','Kohima','2018-11-17 06:02:23','2018-11-17 06:02:23'),(416,18,'D0411','Longleng','2018-11-17 06:02:23','2018-11-17 06:02:23'),(417,18,'D0412','Mokokchung','2018-11-17 06:02:23','2018-11-17 06:02:23'),(418,18,'D0413','Mon','2018-11-17 06:02:23','2018-11-17 06:02:23'),(419,18,'D0414','Peren','2018-11-17 06:02:23','2018-11-17 06:02:23'),(420,18,'D0415','Phek','2018-11-17 06:02:23','2018-11-17 06:02:23'),(421,18,'D0416','Tuensang','2018-11-17 06:02:23','2018-11-17 06:02:23'),(422,18,'D0417','Wokha','2018-11-17 06:02:23','2018-11-17 06:02:23'),(423,18,'D0418','Zunheboto','2018-11-17 06:02:23','2018-11-17 06:02:23'),(424,18,'D0752','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(425,19,'D0419','Angul','2018-11-17 06:02:23','2018-11-17 06:02:23'),(426,19,'D0420','Balangir','2018-11-17 06:02:23','2018-11-17 06:02:23'),(427,19,'D0421','Balasore','2018-11-17 06:02:23','2018-11-17 06:02:23'),(428,19,'D0422','Bargarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(429,19,'D0423','Bhadrak','2018-11-17 06:02:23','2018-11-17 06:02:23'),(430,19,'D0424','Boudh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(431,19,'D0425','Cuttack','2018-11-17 06:02:23','2018-11-17 06:02:23'),(432,19,'D0426','Deogarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(433,19,'D0427','Tuensang','2018-11-17 06:02:23','2018-11-17 06:02:23'),(434,19,'D0428','Dhenkanal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(435,19,'D0429','Gajapati','2018-11-17 06:02:23','2018-11-17 06:02:23'),(436,19,'D0430','Ganjam','2018-11-17 06:02:23','2018-11-17 06:02:23'),(437,19,'D0431','Jagatsinghapur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(438,19,'D0432','Jajpur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(439,19,'D0433','Jharsuguda','2018-11-17 06:02:23','2018-11-17 06:02:23'),(440,19,'D0434','Kalahandi','2018-11-17 06:02:23','2018-11-17 06:02:23'),(441,19,'D0435','Kandhamal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(442,19,'D0436','Kendrapara','2018-11-17 06:02:23','2018-11-17 06:02:23'),(443,19,'D0437','Kendujhar (Keonjhar)','2018-11-17 06:02:23','2018-11-17 06:02:23'),(444,19,'D0438','Khordha','2018-11-17 06:02:23','2018-11-17 06:02:23'),(445,19,'D0439','Koraput','2018-11-17 06:02:23','2018-11-17 06:02:23'),(446,19,'D0440','Malkangiri','2018-11-17 06:02:23','2018-11-17 06:02:23'),(447,19,'D0441','Mayurbhanj','2018-11-17 06:02:23','2018-11-17 06:02:23'),(448,19,'D0442','Nabarangpur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(449,19,'D0443','Nayagarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(450,19,'D0444','Nuapada','2018-11-17 06:02:23','2018-11-17 06:02:23'),(451,19,'D0445','Puri','2018-11-17 06:02:23','2018-11-17 06:02:23'),(452,19,'D0446','Rayagada','2018-11-17 06:02:23','2018-11-17 06:02:23'),(453,19,'D0447','Sambalpur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(454,19,'D0448','Sonepur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(455,19,'D0449','Sundargarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(456,19,'D0753','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(457,35,'D0450','Karaikal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(458,35,'D0451','Mahe','2018-11-17 06:02:23','2018-11-17 06:02:23'),(459,35,'D0452','Puducherry','2018-11-17 06:02:23','2018-11-17 06:02:23'),(460,35,'D0453','Yanam','2018-11-17 06:02:23','2018-11-17 06:02:23'),(461,35,'D0754','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(462,22,'D0454','East Sikkim','2018-11-17 06:02:23','2018-11-17 06:02:23'),(463,22,'D0455','North Sikkim','2018-11-17 06:02:23','2018-11-17 06:02:23'),(464,22,'D0456','South Sikkim','2018-11-17 06:02:23','2018-11-17 06:02:23'),(465,22,'D0457','West Sikkim','2018-11-17 06:02:23','2018-11-17 06:02:23'),(466,22,'D0755','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(467,23,'D0458','Ariyalur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(468,23,'D0459','Chennai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(469,23,'D0460','Coimbatore','2018-11-17 06:02:23','2018-11-17 06:02:23'),(470,23,'D0461','Cuddalore','2018-11-17 06:02:23','2018-11-17 06:02:23'),(471,23,'D0462','Dharmapuri','2018-11-17 06:02:23','2018-11-17 06:02:23'),(472,23,'D0463','Dindigul','2018-11-17 06:02:23','2018-11-17 06:02:23'),(473,23,'D0464','Erode','2018-11-17 06:02:23','2018-11-17 06:02:23'),(474,23,'D0465','Kanchipuram','2018-11-17 06:02:23','2018-11-17 06:02:23'),(475,23,'D0466','Kanyakumari','2018-11-17 06:02:23','2018-11-17 06:02:23'),(476,23,'D0467','Karur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(477,23,'D0468','Krishnagiri','2018-11-17 06:02:23','2018-11-17 06:02:23'),(478,23,'D0469','Madurai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(479,23,'D0470','Nagapattinam','2018-11-17 06:02:23','2018-11-17 06:02:23'),(480,23,'D0471','Namakkal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(481,23,'D0472','Nilgiris','2018-11-17 06:02:23','2018-11-17 06:02:23'),(482,23,'D0473','Perambalur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(483,23,'D0474','Pudukkottai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(484,23,'D0475','Ramanathapuram','2018-11-17 06:02:23','2018-11-17 06:02:23'),(485,23,'D0476','Salem','2018-11-17 06:02:23','2018-11-17 06:02:23'),(486,23,'D0477','Sivaganga','2018-11-17 06:02:23','2018-11-17 06:02:23'),(487,23,'D0478','Thanjavur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(488,23,'D0479','Theni','2018-11-17 06:02:23','2018-11-17 06:02:23'),(489,23,'D0480','Thoothukudi (Tuticorin)','2018-11-17 06:02:23','2018-11-17 06:02:23'),(490,23,'D0481','Tiruchirappalli','2018-11-17 06:02:23','2018-11-17 06:02:23'),(491,23,'D0482','Tirunelveli','2018-11-17 06:02:23','2018-11-17 06:02:23'),(492,23,'D0483','Tiruppur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(493,23,'D0484','Tiruvallur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(494,23,'D0485','Tiruvannamalai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(495,23,'D0486','Tiruvarur','2018-11-17 06:02:23','2018-11-17 06:02:23'),(496,23,'D0487','Vellore','2018-11-17 06:02:23','2018-11-17 06:02:23'),(497,23,'D0488','Viluppuram','2018-11-17 06:02:23','2018-11-17 06:02:23'),(498,23,'D0489','Virudhunagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(499,23,'D0756','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(500,24,'D0490','Adilabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(501,24,'D0491','Bhadradri Kothagudem','2018-11-17 06:02:23','2018-11-17 06:02:23'),(502,24,'D0492','Hyderabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(503,24,'D0493','Jagtial','2018-11-17 06:02:23','2018-11-17 06:02:23'),(504,24,'D0494','Jangaon','2018-11-17 06:02:23','2018-11-17 06:02:23'),(505,24,'D0495','Jayashankar Bhoopalpally','2018-11-17 06:02:23','2018-11-17 06:02:23'),(506,24,'D0496','Jogulamba Gadwal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(507,24,'D0497','Kamareddy','2018-11-17 06:02:23','2018-11-17 06:02:23'),(508,24,'D0498','Karimnagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(509,24,'D0499','Khammam','2018-11-17 06:02:23','2018-11-17 06:02:23'),(510,24,'D0500','Komaram Bheem Asifabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(511,24,'D0501','Mahabubabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(512,24,'D0502','Mahabubnagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(513,24,'D0503','Mancherial','2018-11-17 06:02:23','2018-11-17 06:02:23'),(514,24,'D0504','Medak','2018-11-17 06:02:23','2018-11-17 06:02:23'),(515,24,'D0505','Medchal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(516,24,'D0506','Nagarkurnool','2018-11-17 06:02:23','2018-11-17 06:02:23'),(517,24,'D0507','Nalgonda','2018-11-17 06:02:23','2018-11-17 06:02:23'),(518,24,'D0508','Nirmal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(519,24,'D0509','Nizamabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(520,24,'D0510','Peddapalli','2018-11-17 06:02:23','2018-11-17 06:02:23'),(521,24,'D0511','Rajanna Sircilla','2018-11-17 06:02:23','2018-11-17 06:02:23'),(522,24,'D0512','Rangareddy','2018-11-17 06:02:23','2018-11-17 06:02:23'),(523,24,'D0513','Sangareddy','2018-11-17 06:02:23','2018-11-17 06:02:23'),(524,24,'D0514','Siddipet','2018-11-17 06:02:23','2018-11-17 06:02:23'),(525,24,'D0515','Suryapet','2018-11-17 06:02:23','2018-11-17 06:02:23'),(526,24,'D0516','Vikarabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(527,24,'D0517','Wanaparthy','2018-11-17 06:02:23','2018-11-17 06:02:23'),(528,24,'D0518','Warangal (Rural)','2018-11-17 06:02:23','2018-11-17 06:02:23'),(529,24,'D0519','Warangal (Urban)','2018-11-17 06:02:23','2018-11-17 06:02:23'),(530,24,'D0520','Viluppuram','2018-11-17 06:02:23','2018-11-17 06:02:23'),(531,24,'D0521','Yadadri Bhuvanagiri','2018-11-17 06:02:23','2018-11-17 06:02:23'),(532,24,'D0757','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(533,25,'D0522','Dhalai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(534,25,'D0526','Gomati','2018-11-17 06:02:23','2018-11-17 06:02:23'),(535,25,'D0527','Khowai','2018-11-17 06:02:23','2018-11-17 06:02:23'),(536,25,'D0528','North Tripura','2018-11-17 06:02:23','2018-11-17 06:02:23'),(537,25,'D0529','Sepahijala','2018-11-17 06:02:23','2018-11-17 06:02:23'),(538,25,'D0530','South Tripura','2018-11-17 06:02:23','2018-11-17 06:02:23'),(539,25,'D0531','Unakoti','2018-11-17 06:02:23','2018-11-17 06:02:23'),(540,25,'D0532','West Tripura','2018-11-17 06:02:23','2018-11-17 06:02:23'),(541,25,'D0533','Karimnagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(542,25,'D0534','Khammam','2018-11-17 06:02:23','2018-11-17 06:02:23'),(543,25,'D0758','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(544,27,'D0535','Almora','2018-11-17 06:02:23','2018-11-17 06:02:23'),(545,27,'D0536','Bageshwar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(546,27,'D0537','Chamoli','2018-11-17 06:02:23','2018-11-17 06:02:23'),(547,27,'D0538','Champawat','2018-11-17 06:02:23','2018-11-17 06:02:23'),(548,27,'D0539','Dehradun','2018-11-17 06:02:23','2018-11-17 06:02:23'),(549,27,'D0540','Haridwar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(550,27,'D0541','Nainital','2018-11-17 06:02:23','2018-11-17 06:02:23'),(551,27,'D0542','Pauri Garhwal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(552,27,'D0543','Pithoragarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(553,27,'D0544','Rudraprayag','2018-11-17 06:02:23','2018-11-17 06:02:23'),(554,27,'D0545','Tehri Garhwal','2018-11-17 06:02:23','2018-11-17 06:02:23'),(555,27,'D0546','Udham Singh Nagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(556,27,'D0547','Uttarkashi','2018-11-17 06:02:23','2018-11-17 06:02:23'),(557,27,'D0759','NA','2018-11-17 06:02:23','2018-11-17 06:02:23'),(558,26,'D0548','Agra','2018-11-17 06:02:23','2018-11-17 06:02:23'),(559,26,'D0549','Aligarh','2018-11-17 06:02:23','2018-11-17 06:02:23'),(560,26,'D0550','Allahabad','2018-11-17 06:02:23','2018-11-17 06:02:23'),(561,26,'D0551','Ambedkar Nagar','2018-11-17 06:02:23','2018-11-17 06:02:23'),(562,26,'D0552','Amethi (Chatrapati Sahuji Mahraj Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(563,26,'D0553','Amroha (J.P. Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(564,26,'D0554','Auraiya','2018-11-17 06:02:24','2018-11-17 06:02:24'),(565,26,'D0555','Azamgarh','2018-11-17 06:02:24','2018-11-17 06:02:24'),(566,26,'D0556','Baghpat','2018-11-17 06:02:24','2018-11-17 06:02:24'),(567,26,'D0557','Bahraich','2018-11-17 06:02:24','2018-11-17 06:02:24'),(568,26,'D0558','Ballia','2018-11-17 06:02:24','2018-11-17 06:02:24'),(569,26,'D0559','Balrampur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(570,26,'D0560','Banda','2018-11-17 06:02:24','2018-11-17 06:02:24'),(571,26,'D0561','Barabanki','2018-11-17 06:02:24','2018-11-17 06:02:24'),(572,26,'D0562','Bareilly','2018-11-17 06:02:24','2018-11-17 06:02:24'),(573,26,'D0563','Basti','2018-11-17 06:02:24','2018-11-17 06:02:24'),(574,26,'D0564','Bhadohi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(575,26,'D0565','Bijnor','2018-11-17 06:02:24','2018-11-17 06:02:24'),(576,26,'D0566','Budaun','2018-11-17 06:02:24','2018-11-17 06:02:24'),(577,26,'D0567','Bulandshahr','2018-11-17 06:02:24','2018-11-17 06:02:24'),(578,26,'D0568','Chandauli','2018-11-17 06:02:24','2018-11-17 06:02:24'),(579,26,'D0569','Chitrakoot','2018-11-17 06:02:24','2018-11-17 06:02:24'),(580,26,'D0570','Deoria','2018-11-17 06:02:24','2018-11-17 06:02:24'),(581,26,'D0571','Etah','2018-11-17 06:02:24','2018-11-17 06:02:24'),(582,26,'D0572','Etawah','2018-11-17 06:02:24','2018-11-17 06:02:24'),(583,26,'D0573','Faizabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(584,26,'D0574','Farrukhabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(585,26,'D0575','Fatehpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(586,26,'D0576','Firozabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(587,26,'D0578','Gautam Buddha Nagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(588,26,'D0579','Ghaziabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(589,26,'D0580','Ghazipur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(590,26,'D0581','Gonda','2018-11-17 06:02:24','2018-11-17 06:02:24'),(591,26,'D0582','Gorakhpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(592,26,'D0583','Hamirpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(593,26,'D0584','Hapur (Panchsheel Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(594,26,'D0585','Hardoi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(595,26,'D0586','Hathras','2018-11-17 06:02:24','2018-11-17 06:02:24'),(596,26,'D0587','Jalaun','2018-11-17 06:02:24','2018-11-17 06:02:24'),(597,26,'D0588','Jaunpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(598,26,'D0589','Jhansi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(599,26,'D0590','Kannauj','2018-11-17 06:02:24','2018-11-17 06:02:24'),(600,26,'D0591','Kanpur Dehat','2018-11-17 06:02:24','2018-11-17 06:02:24'),(601,26,'D0592','Kanpur Nagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(602,26,'D0593','Kanshiram Nagar (Kasganj)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(603,26,'D0594','Kaushambi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(604,26,'D0595','Kushinagar (Padrauna)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(605,26,'D0596','Lakhimpur - Kheri','2018-11-17 06:02:24','2018-11-17 06:02:24'),(606,26,'D0597','Lalitpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(607,26,'D0598','Lucknow','2018-11-17 06:02:24','2018-11-17 06:02:24'),(608,26,'D0599','Maharajganj','2018-11-17 06:02:24','2018-11-17 06:02:24'),(609,26,'D0600','Mahoba','2018-11-17 06:02:24','2018-11-17 06:02:24'),(610,26,'D0601','Mainpuri','2018-11-17 06:02:24','2018-11-17 06:02:24'),(611,26,'D0602','Mathura','2018-11-17 06:02:24','2018-11-17 06:02:24'),(612,26,'D0603','Mau','2018-11-17 06:02:24','2018-11-17 06:02:24'),(613,26,'D0604','Meerut','2018-11-17 06:02:24','2018-11-17 06:02:24'),(614,26,'D0605','Mirzapur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(615,26,'D0606','Moradabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(616,26,'D0607','Muzaffarnagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(617,26,'D0608','Pilibhit','2018-11-17 06:02:24','2018-11-17 06:02:24'),(618,26,'D0609','Pratapgarh','2018-11-17 06:02:24','2018-11-17 06:02:24'),(619,26,'D0610','RaeBareli','2018-11-17 06:02:24','2018-11-17 06:02:24'),(620,26,'D0611','Rampur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(621,26,'D0612','Saharanpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(622,26,'D0613','Sambhal (Bhim Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(623,26,'D0614','Sant Kabir Nagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(624,26,'D0615','Shahjahanpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(625,26,'D0616','Shamali (Prabuddh Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(626,26,'D0617','Shravasti','2018-11-17 06:02:24','2018-11-17 06:02:24'),(627,26,'D0618','Siddharth Nagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(628,26,'D0619','Sitapur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(629,26,'D0620','Sonbhadra','2018-11-17 06:02:24','2018-11-17 06:02:24'),(630,26,'D0621','Sultanpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(631,26,'D0622','Unnao','2018-11-17 06:02:24','2018-11-17 06:02:24'),(632,26,'D0623','Varanasi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(633,26,'D0760','NA','2018-11-17 06:02:24','2018-11-17 06:02:24'),(634,28,'D0624','Alipurduar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(635,28,'D0625','Bankura','2018-11-17 06:02:24','2018-11-17 06:02:24'),(636,28,'D0628','Birbhum','2018-11-17 06:02:24','2018-11-17 06:02:24'),(637,28,'D0627','Cooch Behar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(638,28,'D0628','Dakshin Dinajpur (South Dinajpur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(639,28,'D0629','Darjeeling','2018-11-17 06:02:24','2018-11-17 06:02:24'),(640,28,'D0630','Hooghly','2018-11-17 06:02:24','2018-11-17 06:02:24'),(641,28,'D0631','Howrah','2018-11-17 06:02:24','2018-11-17 06:02:24'),(642,28,'D0632','Jalpaiguri','2018-11-17 06:02:24','2018-11-17 06:02:24'),(643,28,'D0633','Jhargram','2018-11-17 06:02:24','2018-11-17 06:02:24'),(644,28,'D0634','Kalimpong','2018-11-17 06:02:24','2018-11-17 06:02:24'),(645,28,'D0635','Kolkata','2018-11-17 06:02:24','2018-11-17 06:02:24'),(646,28,'D0636','Malda','2018-11-17 06:02:24','2018-11-17 06:02:24'),(647,28,'D0637','Murshidabad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(648,28,'D0638','Nadia','2018-11-17 06:02:24','2018-11-17 06:02:24'),(649,28,'D0639','North 24 Parganas','2018-11-17 06:02:24','2018-11-17 06:02:24'),(650,28,'D0640','Paschim Medinipur (West Medinipur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(651,28,'D0641','Paschim (West) Burdwan (Bardhaman)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(652,28,'D0642','Purba Burdwan (Bardhaman)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(653,28,'D0643','Purba Medinipur (East Medinipur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(654,28,'D0644','Purulia','2018-11-17 06:02:24','2018-11-17 06:02:24'),(655,28,'D0645','South 24 Parganas','2018-11-17 06:02:24','2018-11-17 06:02:24'),(656,28,'D0646','Uttar Dinajpur (North Dinajpur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(657,28,'D0761','NA','2018-11-17 06:02:24','2018-11-17 06:02:24'),(658,36,'D0647','Bagalkot','2018-11-17 06:02:24','2018-11-17 06:02:24'),(659,36,'D0648','Ballari (Bellary)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(660,36,'D0649','Belagavi (Belgaum)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(661,36,'D0650','Bengaluru (Bangalore) Rural','2018-11-17 06:02:24','2018-11-17 06:02:24'),(662,36,'D0651','Bengaluru (Bangalore) Urban','2018-11-17 06:02:24','2018-11-17 06:02:24'),(663,36,'D0652','Bidar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(664,36,'D0653','Chamarajanagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(665,36,'D0654','Chikballapur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(666,36,'D0655','Chikkamagaluru (Chikmagalur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(667,36,'D0656','Chitradurga','2018-11-17 06:02:24','2018-11-17 06:02:24'),(668,36,'D0657','Dakshina Kannada','2018-11-17 06:02:24','2018-11-17 06:02:24'),(669,36,'D0658','Davangere','2018-11-17 06:02:24','2018-11-17 06:02:24'),(670,36,'D0659','Dharwad','2018-11-17 06:02:24','2018-11-17 06:02:24'),(671,36,'D0660','Gadag','2018-11-17 06:02:24','2018-11-17 06:02:24'),(672,36,'D0661','Hassan','2018-11-17 06:02:24','2018-11-17 06:02:24'),(673,36,'D0662','Haveri','2018-11-17 06:02:24','2018-11-17 06:02:24'),(674,36,'D0663','Kalaburagi (Gulbarga)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(675,36,'D0664','Kodagu','2018-11-17 06:02:24','2018-11-17 06:02:24'),(676,36,'D0665','Kolar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(677,36,'D0666','Koppal','2018-11-17 06:02:24','2018-11-17 06:02:24'),(678,36,'D0667','Mandya','2018-11-17 06:02:24','2018-11-17 06:02:24'),(679,36,'D0668','Mysuru (Mysore)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(680,36,'D0669','Raichur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(681,36,'D0670','Ramanagara','2018-11-17 06:02:24','2018-11-17 06:02:24'),(682,36,'D0671','Shivamogga (Shimoga)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(683,36,'D0672','Tumakuru (Tumkur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(684,36,'D0673','Udupi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(685,36,'D0674','Uttara Kannada (Karwar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(686,36,'D0675','Vijayapura (Bijapur)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(687,36,'D0676','Yadgir','2018-11-17 06:02:24','2018-11-17 06:02:24'),(688,36,'D0762','NA','2018-11-17 06:02:24','2018-11-17 06:02:24'),(689,20,'D0677','Amritsar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(690,20,'D0678','Barnala','2018-11-17 06:02:24','2018-11-17 06:02:24'),(691,20,'D0679','Bathinda','2018-11-17 06:02:24','2018-11-17 06:02:24'),(692,20,'D0680','Faridkot','2018-11-17 06:02:24','2018-11-17 06:02:24'),(693,20,'D0681','Fatehgarh Sahib','2018-11-17 06:02:24','2018-11-17 06:02:24'),(694,20,'D0682','Fazilka','2018-11-17 06:02:24','2018-11-17 06:02:24'),(695,20,'D0683','Ferozepur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(696,20,'D0684','Gurdaspur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(697,20,'D0685','Hoshiarpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(698,20,'D0686','Jalandhar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(699,20,'D0687','Kapurthala','2018-11-17 06:02:24','2018-11-17 06:02:24'),(700,20,'D0688','Ludhiana','2018-11-17 06:02:24','2018-11-17 06:02:24'),(701,20,'D0689','Mansa','2018-11-17 06:02:24','2018-11-17 06:02:24'),(702,20,'D0690','Moga','2018-11-17 06:02:24','2018-11-17 06:02:24'),(703,20,'D0691','Muktsar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(704,20,'D0692','Nawanshahr (Shahid Bhagat Singh Nagar)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(705,20,'D0693','Pathankot','2018-11-17 06:02:24','2018-11-17 06:02:24'),(706,20,'D0694','Patiala','2018-11-17 06:02:24','2018-11-17 06:02:24'),(707,20,'D0695','Rupnagar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(708,20,'D0696','Sahibzada Ajit Singh Nagar (Mohali)','2018-11-17 06:02:24','2018-11-17 06:02:24'),(709,20,'D0697','Sangrur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(710,20,'D0698','Tarn Taran','2018-11-17 06:02:24','2018-11-17 06:02:24'),(711,20,'D0763','NA','2018-11-17 06:02:24','2018-11-17 06:02:24'),(712,21,'D0699','Ajmer','2018-11-17 06:02:24','2018-11-17 06:02:24'),(713,21,'D0700','Alwar','2018-11-17 06:02:24','2018-11-17 06:02:24'),(714,21,'D0701','Banswara','2018-11-17 06:02:24','2018-11-17 06:02:24'),(715,21,'D0702','Baran','2018-11-17 06:02:24','2018-11-17 06:02:24'),(716,21,'D0703','Barmer','2018-11-17 06:02:24','2018-11-17 06:02:24'),(717,21,'D0704','Bharatpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(718,21,'D0705','Bhilwara','2018-11-17 06:02:24','2018-11-17 06:02:24'),(719,21,'D0706','Bikaner','2018-11-17 06:02:24','2018-11-17 06:02:24'),(720,21,'D0707','Bundi','2018-11-17 06:02:24','2018-11-17 06:02:24'),(721,21,'D0708','Chittorgarh','2018-11-17 06:02:24','2018-11-17 06:02:24'),(722,21,'D0709','Churu','2018-11-17 06:02:24','2018-11-17 06:02:24'),(723,21,'D0710','Dausa','2018-11-17 06:02:24','2018-11-17 06:02:24'),(724,21,'D0711','Dholpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(725,21,'D0712','Dungarpur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(726,21,'D0713','Hanumangarh','2018-11-17 06:02:24','2018-11-17 06:02:24'),(727,21,'D0714','Jaipur','2018-11-17 06:02:24','2018-11-17 06:02:24'),(728,21,'D0715','Jaisalmer','2018-11-17 06:02:25','2018-11-17 06:02:25'),(729,21,'D0716','Jalore','2018-11-17 06:02:25','2018-11-17 06:02:25'),(730,21,'D0718','Jhalawar','2018-11-17 06:02:25','2018-11-17 06:02:25'),(731,21,'D0719','Jhunjhunu','2018-11-17 06:02:25','2018-11-17 06:02:25'),(732,21,'D0720','Jodhpur','2018-11-17 06:02:25','2018-11-17 06:02:25'),(733,21,'D0721','Karauli','2018-11-17 06:02:25','2018-11-17 06:02:25'),(734,21,'D0722','Kota','2018-11-17 06:02:25','2018-11-17 06:02:25'),(735,21,'D0723','Nagaur','2018-11-17 06:02:25','2018-11-17 06:02:25'),(736,21,'D0724','Pali','2018-11-17 06:02:25','2018-11-17 06:02:25'),(737,21,'D0725','Pratapgarh','2018-11-17 06:02:25','2018-11-17 06:02:25'),(738,21,'D0726','Rajsamand','2018-11-17 06:02:25','2018-11-17 06:02:25'),(739,21,'D0727','Sawai Madhopur','2018-11-17 06:02:25','2018-11-17 06:02:25'),(740,21,'D0728','Sikar','2018-11-17 06:02:25','2018-11-17 06:02:25'),(741,21,'D0729','Sirohi','2018-11-17 06:02:25','2018-11-17 06:02:25'),(742,21,'D0730','Sri Ganganagar','2018-11-17 06:02:25','2018-11-17 06:02:25'),(743,21,'D0731','Tonk','2018-11-17 06:02:25','2018-11-17 06:02:25'),(744,21,'D0732','Udaipur','2018-11-17 06:02:25','2018-11-17 06:02:25'),(745,21,'D0764','NA','2018-11-17 06:02:25','2018-11-17 06:02:25'),(746,38,'D0675','NA','2018-11-17 06:03:58','2018-11-17 06:05:17');
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
-- Table structure for table `email_reminders`
--

DROP TABLE IF EXISTS `email_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_date` date DEFAULT NULL,
  `reminder_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reminder_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_text` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_reminders_on_task_id` (`task_id`),
  CONSTRAINT `fk_rails_da7e049cfe` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_reminders`
--

LOCK TABLES `email_reminders` WRITE;
/*!40000 ALTER TABLE `email_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_reminders` ENABLE KEYS */;
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
  `is_regularization` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'EC_1001','Company Trainee','',NULL,1,'2018-11-17 09:17:23','2018-11-17 09:17:23'),(2,'EC_1002','Management','',NULL,1,'2018-11-17 09:17:38','2018-11-17 09:17:38'),(3,'EC_1003','Operative','',NULL,1,'2018-11-17 09:17:56','2018-11-17 09:17:56'),(4,'EC_1004','Staff','',NULL,1,'2018-11-17 09:18:07','2018-11-17 09:18:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,'ED_1001','CNC MACHINIST',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(2,'ED_1002','MACHINIST',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(3,'ED_1003','MAZDOOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(4,'ED_1004','MANAGER (DESIGN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(5,'ED_1005','JOB INSPECTOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(6,'ED_1006','EXECUTIVE (MD)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(7,'ED_1007','GRINDER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(8,'ED_1008','FITTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(9,'ED_1009','ASSOCIATE HEAD (ELECTRONIC DESIGN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(10,'ED_1010','TURNER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(11,'ED_1011','ELECT.D*MAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(12,'ED_1012','WIREMAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(13,'ED_1013','MECH DRAUGHTSMAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(14,'ED_1014','ELECTRICIAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(15,'ED_1015','ASSOCIATE HEAD (PLANT & MAINTENANCE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(16,'ED_1016','PAINTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(17,'ED_1017','HEAD (SALES & MKTG - GEAR MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(18,'ED_1018','ASSOCIATE HEAD (SYSTEM)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(19,'ED_1019','TYPIST CUM CLERK',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(20,'ED_1020','FITTER CUM SCRAPER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(21,'ED_1021','STENOGRAPHER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(22,'ED_1022','HEAD (DESIGN & DEVELOPMENT)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(23,'ED_1023','ASSOCIATE HEAD (PROJECTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(24,'ED_1024','MANAGER (PURCHASE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(25,'ED_1025','DRIVER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(26,'ED_1026','MANAGER (IT HARDWARE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(27,'ED_1027','MANAGER (ELECTRICAL ASSY - GEAR MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(28,'ED_1028','HEAD (COMMERCIAL, MARKETING & PURCHASE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(29,'ED_1029','ASSOCIATE HEAD (INTERNAL AUDIT)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(30,'ED_1030','MANAGER (STORES & LOGISTICS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(31,'ED_1031','EXECUTIVE (ADMIN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(32,'ED_1032','MOTOR VEHICLE DRIVER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(33,'ED_1033','MANAGER (PROJECTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(34,'ED_1034','MANAGER (PRODUCTION - SGI)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(35,'ED_1035','MANAGER (PLANT ADMIN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(36,'ED_1036','MANAGER (PRODUCTION - PRIMARY PARTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(37,'ED_1037','MANAGER (ELECTRICAL ASSY - HEAVY MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(38,'ED_1038','AUTO MECH.',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(39,'ED_1039','MANAGER (SOFTWARE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(40,'ED_1040','ASSOCIATE HEAD (BANKING & CASH)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(41,'ED_1041','MANAGER (PRODUCTION - HEAVY M/C)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(42,'ED_1042','MANAGER (MAINTENANCE ELECTRICAL)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(43,'ED_1043','EXECUTIVE (ACCOUNTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(44,'ED_1044','MUKADAMI CLERK',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(45,'ED_1045','WELDER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(46,'ED_1046','PAINTER CUM BLASTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(47,'ED_1047','MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(48,'ED_1048','MANAGER (MAINTENANCE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(49,'ED_1049','MANAGER (SPARES & SERVICING)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(50,'ED_1050','ASSOCIATE HEAD (Q.A.)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(51,'ED_1051','MANAGER (FIXTURE & TOOL DESIGN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(52,'ED_1052','ASSOCIATE HEAD (CURRENT ASSETS & GST)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(53,'ED_1053','JIG BORER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(54,'ED_1054','ASSOCIATE HEAD (ACCOUNTS - PLANT)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(55,'ED_1055','EXECUTIVE (ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(56,'ED_1056','MANAGER (PRODUCTION - CUTTING & BENDING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(57,'ED_1057','SECURITY GUARD',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(58,'ED_1058','MANAGER (GEAR MACHINE ASSY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(59,'ED_1059','MANAGER (QA - NDT)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(60,'ED_1060','OFFICE ASSTT.',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(61,'ED_1061','FITTER (MAINT.)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(62,'ED_1062','MANAGER (SALES & SERVICE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(63,'ED_1063','AUTO MECHANIC CUM DRIVER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(64,'ED_1064','M.M.T.M.(FITTER)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(65,'ED_1065','MANAGER (PURCHASE - INDIRECT MATERIAL)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(66,'ED_1066','ASSOCIATE HEAD (METRO MANUFACTURING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(67,'ED_1067','FITTER-CUM SCRAPER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(68,'ED_1068','MARKER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(69,'ED_1069','D.P.OPT.CUM.MAZDOOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(70,'ED_1070','MANAGER (MACHINE SHOP)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(71,'ED_1071','ASSOCIATE HEAD (MARKETING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(72,'ED_1072','HEAD (MANUFACTURING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(73,'ED_1073','MANAGER (ELECTRICAL DESIGN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(74,'ED_1074','MANAGER (SERVICING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(75,'ED_1075','EXECUTIVE (SYSTEM)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(76,'ED_1076','MANAGER (PLANNING & PRODUCTION CONTROL)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(77,'ED_1077','EXECUTIVE (WELFARE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(78,'ED_1078','MANAGER (PRODUCTION - METRO/WIND)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(79,'ED_1079','MANAGER (SERVICING & APPLICATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(80,'ED_1080','HEAD (ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(81,'ED_1081','EXECUTIVE (IR)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(82,'ED_1082','MANAGER (GEAR MACHINES ASSY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(83,'ED_1083','ASSOCIATE HEAD (CO ADMIN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(84,'ED_1084','MANAGER (CORPORATE AFFAIRS)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(85,'ED_1085','COMPANY TRAINEE',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(86,'ED_1086','EXECUTIVE (FINANCE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(87,'ED_1087','ASSOCIATE HEAD (SECRETARIAL & TAXATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(88,'ED_1088','MANAGER (BANKING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(89,'ED_1089','EXECUTIVE (TAXATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(90,'ED_1090','MANAGER (ADMINISTRATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(91,'ED_1091','EXECUTIVE',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(92,'ED_1092','ASSOCIATE HEAD (IR)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(93,'ED_1093','ASSOCIATE HEAD (PRODUCTION SGI)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(94,'ED_1094','MANAGER (SALES TAX & P&L)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(95,'ED_1095','ASSEMBLY PIPER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(96,'ED_1096','MACHINIST BORER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(97,'ED_1097','HEAD (IR & ADMIN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(98,'ED_1098','DRILLER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(99,'ED_1099','DRILLER CUM BENDING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(100,'ED_1100','ASSOCIATE HEAD (MAINTENANCE ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(101,'ED_1101','MANAGER (PRODUCTION - METRO)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(102,'ED_1102','CNC TURNER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(103,'ED_1103','MANAGER (SECURITY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(104,'ED_1104','ASSOCIATE HEAD (SALES & MKTG - NORTH REGION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(105,'ED_1105','MANAGER (PAINT - METRO/OTHER)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(106,'ED_1106','EXECUTIVE (SECURITY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(107,'ED_1107','WELDER CUM BENDING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(108,'ED_1108','MAINTENANCE FITTER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(109,'ED_1109','CUTTING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(110,'ED_1110','MANAGER (QA - WIND)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'EG_1001','06',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(2,'EG_1002','21',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(3,'EG_1003','26',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(4,'EG_1004','22',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(5,'EG_1005','114',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(6,'EG_1006','11',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(7,'EG_1007','115',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(8,'EG_1008','23',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(9,'EG_1009','113',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(10,'EG_1010','112',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(11,'EG_1011','12',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(12,'EG_1012','25',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(13,'EG_1013','30',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(14,'EG_1014','24',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(15,'EG_1015','31',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(16,'EG_1016','111',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(17,'EG_1017','97',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50');
/*!40000 ALTER TABLE `employee_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_insentives`
--

DROP TABLE IF EXISTS `employee_insentives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_insentives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_insentives_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_3dd1c95d48` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_insentives`
--

LOCK TABLES `employee_insentives` WRITE;
/*!40000 ALTER TABLE `employee_insentives` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_insentives` ENABLE KEYS */;
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
  `date_time` datetime DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `listed_company_id` int(11) DEFAULT NULL,
  `plan_or_unplan` tinyint(1) DEFAULT NULL,
  `start_latitude` float DEFAULT NULL,
  `start_longitude` float DEFAULT NULL,
  `start_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_latitude` float DEFAULT NULL,
  `end_longitude` float DEFAULT NULL,
  `end_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_latitude` float DEFAULT NULL,
  `created_longitude` decimal(10,0) DEFAULT NULL,
  `created_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_plans_on_employee_id` (`employee_id`),
  KEY `index_employee_plans_on_listed_company_id` (`listed_company_id`),
  CONSTRAINT `fk_rails_4beb662db4` FOREIGN KEY (`listed_company_id`) REFERENCES `listed_companies` (`id`),
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
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (1,'ET_1001','Permanent','Permanent Employment',NULL,'2018-11-17 07:39:52','2018-11-17 07:39:52'),(2,'ET_1002','Company Trainee','Company Trainee Employment',NULL,'2018-11-17 07:40:21','2018-11-17 07:40:21'),(3,'ET_1003','Probation','Probation Employment',NULL,'2018-11-17 07:40:43','2018-11-17 07:40:43');
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
  `employee_option` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'2207','EMP0000001',NULL,'MR','SHIVAJI','LAXMAN','PARTE','1960-05-28','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','396510178038','AAQPP9426P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(2,'2319','EMP0000002',NULL,'MR','CHANDKANT','BHIMARAO','PATIL','1959-06-01','Male','0','0','0','CHANDKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','227001286319','AAQPP9489A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(3,'2346','EMP0000003',NULL,'MR','DADU','VISHWNATH','JAGTAP','1960-06-01','Male','0','0','0','DADU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','285605969749','AANPJ8539L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(4,'2397','EMP0000004',NULL,'MR','MOHAN','KRUSHNA','BHOSALE','1959-05-05','Male','0','0','0','MOHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','705257474849','AAPPB2892J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(5,'2410','EMP0000005',NULL,'MR','SARANG','CHANDRAKANT','NAIK','1960-10-28','Male','0','0','0','scnaik@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','457737349188','AAHPN0646G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(6,'2461','EMP0000006',NULL,'MR','ROHIDAS','MAHADEV','KUNJIR','1961-06-01','Male','0','0','0','ROHIDAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','692068941760','AAZPK8327R',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(7,'2525','EMP0000007',NULL,'MR','ASHOK','DODHA','THAKARE','1961-06-01','Male','9326318997','0','0','adthakare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','505966808186','AAGPT3125P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(8,'2526','EMP0000008',NULL,'MR','SHARADKUMAR','NARAYAN','JADHAV','1963-03-20','Male','0','0','0','SHARADKUMAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','433339852158','AANPJ8567A',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(9,'2527','EMP0000009',NULL,'MR','SHINDE','SHANKAR','BABURAO','1962-01-01','Male','0','0','0','SHINDE@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','260650866796','ABXPS0380F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(10,'2528','EMP0000010',NULL,'MR','PURUSHOTTAM','VINAYK','SONAVANE PATIL','1959-05-05','Male','0','0','0','PURUSHOTTAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','372519243614','AAQPP9485N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(11,'2529','EMP0000011',NULL,'MR','DILIP','BHAGAWAN','AWADE','1960-09-29','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','230456951420','AAMPA8613M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(12,'2530','EMP0000012',NULL,'MR','SUNIL','ANANDRAO','LOKHANDE','1960-11-03','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','977752293951','AAEPL3301M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(13,'2538','EMP0000013',NULL,'MR','PRAFULLKUMAR','JAIKUMAR','PATIL','1960-06-01','Male','9325378741','0','0','pjpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','346207355153','AAQPP9481J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(14,'2662','EMP0000014',NULL,'MR','PRAVIN','JAYSING','GANGAWANE','1962-02-10','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','658437291383','AASPG3871B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(15,'2690','EMP0000015',NULL,'MR','CHANDRASHEKHAR','BABURAO','KHYADE','1960-06-08','Male','0','0','0','CHANDRASHEKHAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','709245080459','ABXPK1381J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(16,'2782','EMP0000016',NULL,'MR','JAIRAJ','DEVRAJ','PILLAY','1964-04-09','Male','0','0','0','JAIRAJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','439634172424','AGMPP0267A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(17,'2789','EMP0000017',NULL,'MR','SHRIKRISHNA','BHAGWAN','KULKARNI','1960-07-17','Male','0','0','0','SHRIKRISHNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','990693928014','AAZPK6660K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(18,'2791','EMP0000018',NULL,'MR','VASANT','EKNATH','RAKSHE','1962-06-01','Male','0','0','0','VASANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','536021183752','ACDPR8368K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(19,'2798','EMP0000019',NULL,'MR','SUNIL','MAHADEO','GHORPADE','1963-02-14','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','971179490297','AASPG2927Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09',NULL,NULL,NULL,NULL,NULL),(20,'2867','EMP0000020',NULL,'MR','SITARAM','TUKARAM','KARDILE','1966-07-06','Male','0','0','0','stkardile@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','665922693220','AAZPK6665N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(21,'2934','EMP0000021',NULL,'MR','ASLAM','AKBAR','KAZI','1962-07-25','Male','0','0','0','ASLAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','397399807813','AAZPK6663L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(22,'2946','EMP0000022',NULL,'MR','GAJANAN','PRABHAKAR','NIPHADKAR','1966-01-14','Male','0','0','0','GAJANAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','250417869369','AAHPN0225H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(23,'2955','EMP0000023',NULL,'MR','AJIT','HIRALAL','PANDHARE','1968-06-27','Male','0','0','0','ahpandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','308566816603','AAQPP9484P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(24,'2971','EMP0000024',NULL,'MR','PRASANNA','PRABHAKAR','JOSHI','1962-10-25','Male','9371105523','0','0','ppjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','376122506432','AANPJ8566B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(25,'2994','EMP0000025',NULL,'MR','DAYANAND','VISHNU','JADHAV','1971-01-01','Male','0','0','0','DAYANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','664151827757','AAYPJ2517P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(26,'3002','EMP0000026',NULL,'MR','VISHWAJIT','RAJKUMAR','KOTHARI','1964-08-07','Male','8411094712','0','0','vrkothari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','436354396986','AAZPK6670R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(27,'3027','EMP0000027',NULL,'MR','SUNIL','DNYANDEO','BHARAMBE','1967-04-16','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','644114327730','AAPPB2908K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(28,'3062','EMP0000028',NULL,'MR','SACHIN','DINKAR','VICHARE','1967-07-16','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','512509400696','AAIPV1925F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(29,'3068','EMP0000029',NULL,'MR','BALAJI','RANGRAO','BHOSALE','1971-03-05','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','552872469223','AAPPB2907G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(30,'3073','EMP0000030',NULL,'MR','DATTATRAY','LAXMAN','MANDHARE','1971-04-23','Male','9371644581','0','0','dlmandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','391106012453','AVSPM2368N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(31,'3097','EMP0000031',NULL,'MR','VIJAY','SAMPTRAO','DHANE','1966-11-06','Male','9325332300','0','0','vsdhane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','924753558809','AAMPD6691A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(32,'3109','EMP0000032',NULL,'MR','VASUDEV','MAROTI','HIWARKAR','1964-08-07','Male','0','0','0','VASUDEV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','966677123812','AACPH3456R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(33,'3110','EMP0000033',NULL,'MR','SANJAY','SADU','KANDHARE','1964-08-12','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','898324940822','AAZPK8286D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(34,'3127','EMP0000034',NULL,'MR','SUNIL','MAHADEV','DIXIT','1968-10-31','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','278851647108','AAXPD8204G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(35,'3129','EMP0000035',NULL,'MR','BALASAHEB','SHANKARRAO','BANKAR','1965-07-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','249454988043','AAPPB1839B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(36,'3133','EMP0000036',NULL,'MR','RAMESH','SHANKAR','JAGTAP','1967-07-02','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','424250394673','AANPJ7738F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(37,'3140','EMP0000037',NULL,'MR','MALHARI','SHIVAJI','MALAVE','1967-06-16','Male','0','0','0','MALHARI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','497717765494','AAUPM1614Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(38,'3150','EMP0000038',NULL,'MR','NIRANJAN','BABURAO','DESHMUKH','1966-12-30','Male','0','0','0','NIRANJAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','249036328720','AAMPD5893L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(39,'3152','EMP0000039',NULL,'MR','VASANT','MURLIDHAR','KHAIRE','1966-07-07','Male','0','0','0','VASANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','925255453507','AAZPK6681N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(40,'3170','EMP0000040',NULL,'MR','SHAILESH','BALKRISHNA','KULKARNI','1968-12-13','Male','0','0','0','SHAILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','790782956373','AAZPK6682R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(41,'3171','EMP0000041',NULL,'MR','RAVINDRA','KASHIRAM','ADHAV','1968-08-01','Male','0','0','0','RAVINDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','642667959387','AAMPA7873M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(42,'3173','EMP0000042',NULL,'MR','ANANT','NARAYAN','PASTAY','1959-09-29','Male','0','0','0','ANANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','579336080937','AAQPP8020P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(43,'3265','EMP0000043',NULL,'MR','SUHAS','DATTATRAY','JOSHI','1965-01-04','Male','8411091634','0','0','sdjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','819028836899','AANPJ8548F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(44,'3288','EMP0000044',NULL,'MR','MOHAN','DNYANADEV','SAPKAL','1971-04-27','Male','0','0','0','MOHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','569175038002','ATIPS0639N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(45,'3289','EMP0000045',NULL,'MR','MAHADEO','LAXMAN','KHEDEKAR','1970-07-07','Male','0','0','0','MAHADEO@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','239203427465','AAZPK8293J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(46,'3524','EMP0000046',NULL,'MR','JAYRAM','BAJIRAO','MANDHARE','1974-02-17','Male','0','0','0','jbmandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','504579884986','AIGPM1016J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(47,'3638','EMP0000047',NULL,'MR','MAHESH','RAMESH','DEO','1967-04-20','Male','9325378773','0','0','mrdeo@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','928066419781','AAMPD6695E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(48,'3812','EMP0000048',NULL,'MR','PRABHAKAR','KISAN','SAWANT','1962-06-01','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','325075328925','BEUPS7343H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(49,'3826','EMP0000049',NULL,'MR','RAVINDRA','SUBHASH','MAHAJAN','1971-12-04','Male','0','0','0','rsmahajan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','730866190740','AGUPM0901G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(50,'3855','EMP0000050',NULL,'MR','JAYWANT','ARJUN','UTTEKAR','1963-05-04','Male','9325378765','0','0','JAYWANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','696192777322','AARPU4518N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(51,'3878','EMP0000051',NULL,'MR','JYOTIRAM','BHANUDAS','JADHAV','1982-02-14','Male','0','0','0','jbjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','626755422115','AFUPJ4823R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(52,'3944','EMP0000052',NULL,'MR','ARVIND','BABURAO','SALOKHE','1965-08-15','Male','0','0','0','absalokhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','656639697529','ACJPS3990A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(53,'3945','EMP0000053',NULL,'MR','PRANESH','ARVIND','MUDDAPUR','1964-04-26','Male','8411092312','0','0','pamuddapur@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','436966754346','ABPPM3361G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(54,'3948','EMP0000054',NULL,'MR','SADANAND','DATTATRAY','DIGHE','1964-03-06','Male','9325378767','0','0','sddighe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','563041832986','AECPD4150N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(55,'3952','EMP0000055',NULL,'MR','RAJENDRA','TUKARAM','DHURI','1962-07-17','Male','9325635278','0','0','rtdhuri@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','201423044549','AIDPD5515C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(56,'4033','EMP0000056',NULL,'MR','RAJENDRA','DINKAR','PHALKE','1971-01-30','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','589345016193','ANQPP5635D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(57,'4153','EMP0000057',NULL,'MR','CHANDRAKANT','RANBA','KAMBLE','1963-01-20','Male','0','0','0','crkamble@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','632021316868','BBCPK7034E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(58,'4169','EMP0000058',NULL,'MR','KUMBHAR','SHANTARAM','SHANKAR','1968-02-15','Male','9326024916','0','0','sskumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','831088734141','AIDPK2314C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(59,'4191','EMP0000059',NULL,'MR','BAPUSAHEB','BHUJANGRAO','GHORPADE','1975-05-10','Male','9371161241','0','0','bbghorpade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','347944149362','AOGPG4608A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(60,'4202','EMP0000060',NULL,'MR','SUJEET','BIRUJI','MURADE','1975-06-14','Male','9370906497','0','0','sbmurade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','704474079444','AOZPM2133H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(61,'4204','EMP0000061',NULL,'MR','SANTOSH','RAMCHANDRA','KAMBALE','1976-06-01','Male','0','0','0','srkamble@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','806337185751','AXAPK2359M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(62,'4211','EMP0000062',NULL,'MR','SUDAM','BANSILAL','NAVGIRE','1969-01-10','Male','0','0','0','sbnavgire@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','657454284578','ABWPN2560M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(63,'4235','EMP0000063',NULL,'MR','YASHWANT','RAOSAHEB','INGALE','1971-01-05','Male','9325378780','0','0','yringale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','201453424478','AABPI1780L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(64,'4247','EMP0000064',NULL,'MR','VITTHAL','MARUTI','KANTE','1961-01-27','Male','9325635674','0','0','vmkante@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','797537452261','ABKPK3667J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(65,'4248','EMP0000065',NULL,'MR','AMIT','PRASAD','SHINDE','1978-01-22','Male','0','0','0','apshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','501376256702','BGRPS8445M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(66,'4299','EMP0000066',NULL,'MR','KEDAR','GURUNATH','GAVANKAR','1981-11-23','Male','0','0','0','KEDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','414798012426','ALEPG8101F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(67,'4300','EMP0000067',NULL,'MR','RAJU','NARAYAN','BHUJBAL','1969-06-01','Male','9326024825','0','0','RAJU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','243492705510','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(68,'4301','EMP0000068',NULL,'MR','PRAMOD','DILIP','GADHAVE','1981-10-30','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','522050022929','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(69,'4371','EMP0000069',NULL,'MR','ATUL','BALASO','MANE','1984-06-01','Male','8411093268','0','0','abmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','543264759720','ATXPM6063D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(70,'4382','EMP0000070',NULL,'MR','DATTATRAY','BABURAO','CHIKANE','1965-06-03','Male','0','0','0','dbchikane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','744967600464','AAMPC3961E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(71,'4399','EMP0000071',NULL,'MR','RAJU','CHIMANRAO','RAUT','1971-05-30','Male','9371105516','0','0','rcraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','262657986987','AJJPR8303B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(72,'4524','EMP0000072',NULL,'MR','SUBHASH','BALVANT','PATIL','1984-05-25','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','669104682067','AOYPP6517M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(73,'4525','EMP0000073',NULL,'MR','SANJAY','SIDRAM','PATIL','1981-06-01','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','298193288611','AOZPP4911Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(74,'4526','EMP0000074',NULL,'MR','SACHIN','DATTU','SHINDE','1981-09-20','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','303812823694','CEMPS9264N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(75,'4527','EMP0000075',NULL,'MR','CHANDRAKANT','MAHADEV','MALI','1982-10-15','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','422103180960','AQEPM8869K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(76,'4556','EMP0000076',NULL,'MR','JOSHI','UPENDRA','RAMCHANDRA','1976-06-24','Male','9372342130','0','0','urjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','391781460816','AKDPJ3511G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(77,'4636','EMP0000077',NULL,'MR','PRAKASH','SITARAM','ADAVADE','1978-06-01','Male','0','0','0','psadavade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','313716166292','ADGPA9349B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(78,'4678','EMP0000078',NULL,'MR','VISHNUPRASAD','SUDAMAPRASAD','MISHRA','1960-06-15','Male','0','0','0','VISHNUPRASAD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','254683440591','AJBPM9442L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(79,'4711','EMP0000079',NULL,'MR','SIDHANATH','LALASAHEB','DESHMUKH','1975-10-01','Male','0','0','0','SIDHANATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','757618725746','AOCPD9791H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(80,'4712','EMP0000080',NULL,'MR','SHIVAJI','NIVRUTTI','KSHIRSAGAR','1983-01-02','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','976168647885','AWQPK3744B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(81,'4720','EMP0000081',NULL,'MR','DINKAR','SHIVAJI','HOLMUKHE','1976-02-29','Male','0','0','0','DINKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','816140851847','ADAPH7867F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(82,'4721','EMP0000082',NULL,'MR','SACHIN','KISHNAJI','MALME','1978-05-31','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','383927173783','APBPM5932P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(83,'4750','EMP0000083',NULL,'MR','NILESH','MANOHAR','KUMBHAVDEKAR','1975-03-24','Male','0','0','0','NILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','321959995387','BAQPK2078H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(84,'4756','EMP0000084',NULL,'MR','MAHESH','NARAYAN','SHINDE','1979-05-13','Male','0','0','0','MAHESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','910574823649','BNXPS8054B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(85,'4859','EMP0000085',NULL,'MR','BIRMAL','BHIVA','KHANDEKAR','1982-06-01','Male','0','0','0','BIRMAL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','361474417728','AUNPK0423G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(86,'4863','EMP0000086',NULL,'MR','BALAJI','RAMRAO','GAWARE','1976-06-04','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','401430558890','ASXPG6910C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(87,'4882','EMP0000087',NULL,'MR','RAVINDRA','MADHUKAR','KAMBLE','1976-06-06','Male','0','0','0','RAVINDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','634073155964','AXPPK0295D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(88,'4883','EMP0000088',NULL,'MR','DINESH','RANGRAO','DESALE','1980-06-01','Male','0','0','0','DINESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','847642735690','ALKPD4281F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(89,'4885','EMP0000089',NULL,'MR','DEVANAND','LAXMAN','NEMADE','1977-01-05','Male','0','0','0','DEVANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','517124744658','AHLPN3487A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(90,'4886','EMP0000090',NULL,'MR','LICHADE','HEMANTKUMAR','DINDAYAL','1980-06-20','Male','0','0','0','LICHADE@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','676287481423','AEBPL6268G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(91,'4896','EMP0000091',NULL,'MR','KRUSHNAT','SOPAN','DADAS','1980-06-01','Male','0','0','0','KRUSHNAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','690793455367','ANCPD0052E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(92,'4907','EMP0000092',NULL,'MR','RAJIV','PRABHAKAR','SHRISATH','1973-01-26','Male','0','0','0','RAJIV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','666074208763','BIMPS5590N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(93,'4935','EMP0000093',NULL,'MR','RAMESH','ASHOK','SAWANT','1985-09-16','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','276088913355','BNPPS1245G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(94,'4937','EMP0000094',NULL,'MR','GANESH','RAMDAS','NEHARKAR','1978-12-04','Male','0','0','0','grneharkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','846807525104','AFZPN4317F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(95,'4939','EMP0000095',NULL,'MR','ABDUL WARIS','ABDUL ','HAFIS','1977-07-02','Male','0','0','0','ABDUL WARIS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','659898372246','AMLPA4355K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(96,'4940','EMP0000096',NULL,'MR','RAJENDRA','DAGDU','SALUNKHE','1980-06-02','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','204975693444','BWGPS2416H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(97,'4945','EMP0000097',NULL,'MR','NANASAHEB','BHIKAJI','WAGHMARE','1963-06-01','Male','0','0','0','nbwaghmare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','648425610485','AAQPW9129G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(98,'4946','EMP0000098',NULL,'MR','SWAPNIL','BABASAHEB','DESHMUKH','1982-06-12','Male','0','0','0','SWAPNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','278499402952','AKYPD0067E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(99,'4947','EMP0000099',NULL,'MR','AMOL','SUDAM','KONDE','1980-06-03','Male','0','0','0','AMOL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','751637228417','AWTPK2990C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(100,'4948','EMP0000100',NULL,'MR','SHAYMSUNDAR','PANDURANG','SALUNKHE','1977-12-21','Male','0','0','0','SHAYMSUNDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','605437332052','BOYPS5762Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(101,'4950','EMP0000101',NULL,'MR','SAIBANNA','BABURAO','REDDY','1977-04-02','Male','9325635248','0','0','sbreddy@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','583858170198','ASIPB2271L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(102,'4961','EMP0000102',NULL,'MR','RAJESH','MULCHAND','PAWAR','1984-03-22','Male','0','0','0','RAJESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','965242648119','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(103,'4989','EMP0000103',NULL,'MR','KISHOR','BAPURAO','CHAVAN','1983-06-14','Male','0','0','0','kbchavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','641395674870','ALFPC1238C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(104,'5021','EMP0000104',NULL,'MR','SWAPNAJIT','DATTATRAY','BHOSALE','1985-04-11','Male','0','0','0','SWAPNAJIT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','335103674939','ARGPB0222L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(105,'5041','EMP0000105',NULL,'MR','ANIL','LAHUDAS','KUMBHAR','1981-06-30','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','694301840778','BFHPK5905F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(106,'5071','EMP0000106',NULL,'MR','VIJAY','EKNATH','MONE','1962-10-09','Male','9371086750','0','0','vemone@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','519313199257','ABAPM6720E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(107,'5082','EMP0000107',NULL,'MR','KISHOR','RAMKRISHNA','POTNIS','1965-05-12','Male','9371637263','0','0','krpotnis@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','855936491415','AUMPP9095N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(108,'5107','EMP0000108',NULL,'MR','MADAN','SHANKARRAO','PHALKE','1978-04-30','Male','0','0','0','MADAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','834447948442','AUQPP2118L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(109,'5108','EMP0000109',NULL,'MR','BHARAT','VILAS','JADHAV','1985-07-28','Male','0','0','0','BHARAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','900747639796','AIJPJ1132D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(110,'5109','EMP0000110',NULL,'MR','TANAJI','SONABA','KENGAR','1982-06-07','Male','0','0','0','TANAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','605655477584','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(111,'5110','EMP0000111',NULL,'MR','RAJENDRA','GANPAT','SATAV','1981-03-10','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','681993831718','CBLPS7639K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(112,'5120','EMP0000112',NULL,'MR','MAHESH','DAGADU','KUMBHAR','1983-11-01','Male','0','0','0','mdkumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','232245488303','AUMPK6831H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(113,'5130','EMP0000113',NULL,'MR','DIPAK','MUKUNDA','SHINDE','1981-06-24','Male','0','0','0','DIPAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','541982609922','BHWPS7514K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(114,'5131','EMP0000114',NULL,'MR','SANDIP','KHASHABA','DESAI','1984-01-15','Male','0','0','0','SANDIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','802643713293','AOGPD2551K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(115,'5132','EMP0000115',NULL,'MR','CHANDRAKANT','ATMARAM','JADHAV','1983-06-19','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','260102430543','AGIPJ5019L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(116,'5140','EMP0000116',NULL,'MR','VIRSINH','SAMBHAJIRAO','MANE','1978-06-21','Male','0','0','0','VIRSINH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','678270599269','AXEPM9178N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(117,'5141','EMP0000117',NULL,'MR','GANESH','KALIDAS','PATIL','1982-09-10','Male','0','0','0','GANESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','521741675384','ASQPP7944Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(118,'5142','EMP0000118',NULL,'MR','BABASAHEB','BHIMRAO','SHINDE','1976-06-01','Male','0','0','0','BABASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','912435000649','BRDPS6944Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(119,'5143','EMP0000119',NULL,'MR','SUBHASH','SADHU','MOHITE','1982-11-13','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','677961417790','ATLPM2195C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(120,'5156','EMP0000120',NULL,'MR','BALU','MADHUKAR','DHAVALE','1979-09-10','Male','0','0','0','BALU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','431208515643','AODPD2943Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(121,'5157','EMP0000121',NULL,'MR','PRASHANT','SUBHASH','SHIRKE','1984-10-01','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','526847992654','BQPPS2214G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(122,'5189','EMP0000122',NULL,'MR','AKHILESH','SHRIKRISHNA','BAGADE','1978-07-25','Male','0','0','0','AKHILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','560737063674','AOUPB7803G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(123,'5194','EMP0000123',NULL,'MR','SUNIL','BABRUWAN','PAWAR','1978-06-01','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','936381622918','AWNPP4045P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(124,'5205','EMP0000124',NULL,'MR','ASHOK','PANDURANG','AWARE','1981-06-09','Male','0','0','0','ASHOK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','717464213174','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(125,'5248','EMP0000125',NULL,'MR','ANAND','SHIDDANNA','KITTAD','1980-06-01','Male','0','0','0','ANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','682419870288','BAOPK1793D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(126,'5270','EMP0000126',NULL,'MR','KIRAN','MHASKU','KAMTHE','1981-01-22','Male','0','0','0','kmkamthe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','786651512579','AVCPK8359D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(127,'5339','EMP0000127',NULL,'MR','SHANTARAM','KASHINATH','MAHAJAN','1961-06-03','Male','9326653843','0','0','skmahajan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','736452363266','AATPM8084F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(128,'5380','EMP0000128',NULL,'MR','SANJAY','SHIVAJI','LOHAR','1977-10-07','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','790601753175','ADFPL1929D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(129,'5382','EMP0000129',NULL,'MR','KISHOR','KISANRAO','KHAJONE','1973-10-12','Male','0','0','0','KISHOR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','279228113462','BCIPK7653L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(130,'5434','EMP0000130',NULL,'MR','BHIVA','NAMDEV','WAGHMODE','1963-06-01','Male','0','0','0','BHIVA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','678524820220','ABEPW6209L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(131,'5462','EMP0000131',NULL,'MR','SHRIRAM','BHALCHANDRA','MEHENDALE','1959-07-24','Male','9325378755','0','0','sbmehendale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','844258638026','AAYPM4888L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(132,'5590','EMP0000132',NULL,'MR','SANJAY','SHARAD','CHAVAN','1970-05-27','Male','9325378762','0','0','sschavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','815775871629','AOJPC0353D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(133,'5591','EMP0000133',NULL,'MR','ASHOKKUMAR','SANTANSINGH','MARAVI','1966-05-29','Male','9325378763','0','0','akmaravi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','601061026613','AYHPM6509K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(134,'5598','EMP0000134',NULL,'MR','VIKRAM','DNYANDEO','NARULE','1979-04-17','Male','9326090425','0','0','vdnarule@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','981855391400','AEOPN1414M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(135,'5624','EMP0000135',NULL,'MR','RAMDAS','BALIRAM','JAGTAP','1970-06-01','Male','0','0','0','RAMDAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','639995699223','AJTPJ8178N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(136,'5625','EMP0000136',NULL,'MR','SURESH','GAJENDRA','MANE','1971-05-07','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','452559491794','AUNPM8689E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(137,'5635','EMP0000137',NULL,'MR','BHAMRE','PRAKASH','NARHAR','1963-06-30','Male','8411045757','0','0','pnbhamare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','798383183280','AHIPB7394R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(138,'5652','EMP0000138',NULL,'MR','SUNITKUMAR','SUNILKUMAR','DASGUPTA','1962-05-19','Male','9373066247','0','0','ssdasgupta@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','296384923534','AFHPD3124N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(139,'5656','EMP0000139',NULL,'MR','KONDAJI','APPAJI','DUKREPATIL','1968-06-01','Male','9371868953','0','0','kadukarepatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','715653856960','AALPD4056E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(140,'5681','EMP0000140',NULL,'MR','REGHU','P','G','1966-05-10','Male','9381781792','0','0','REGHU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','887295962482','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(141,'5684','EMP0000141',NULL,'MR','PRAKASH','MAHARU','RATHOD','1975-02-20','Male','0','0','0','PRAKASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','598818711549','AOKPR9725F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(142,'5726','EMP0000142',NULL,'MR','AYAN',NULL,'CHATTOPADHYAY','1970-01-01','Male','9332101342','0','0','anchattopadhyay@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','317615538342','ALAPC1330Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(143,'5734','EMP0000143',NULL,'MR','SANTOSH','SHRIRANG','JAGDALE','1973-06-28','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','247998666800','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(144,'5937','EMP0000144',NULL,'MR','PARWEJ','NOORMAHAMAD','KILLEDAR','1985-07-30','Male','0','0','0','PARWEJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','397967444266','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(145,'5938','EMP0000145',NULL,'MR','PRAVIN','GORAKSHANATH','HAGAVANE','1984-01-08','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','997503336168','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(146,'5939','EMP0000146',NULL,'MR','SOMNATH','RANGNATH','MALEKAR','1980-05-09','Male','0','0','0','SOMNATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','585976352076','AMDPM9987D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(147,'5940','EMP0000147',NULL,'MR','JYOTIRAM','BALBHIM','JADHAV','1978-06-01','Male','0','0','0','JYOTIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','479322045765','AJXPJ4871C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(148,'5941','EMP0000148',NULL,'MR','IMRAN','KHUDBUDDIN','SHAIKH','1984-07-14','Male','0','0','0','IMRAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','712989535383','BWKPS8732E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(149,'5942','EMP0000149',NULL,'MR','TEJABSINGH','AJABSINGH','PATIL','1984-09-01','Male','0','0','0','TEJABSINGH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','495936305567','ARDPP5302L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(150,'5943','EMP0000150',NULL,'MR','DADA','BARKU','SONWAL','1980-02-03','Male','0','0','0','DADA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','267543481113','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(151,'5944','EMP0000151',NULL,'MR','SURAJ','ASHOK','PHALKE','1986-01-26','Male','0','0','0','SURAJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','662655890449','ATIPP4855D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(152,'5945','EMP0000152',NULL,'MR','JAKIRULLA','HANIF','KHAN','1977-04-02','Male','8411094477','0','0','JAKIRULLA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','988623869852','BMCPK6579B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(153,'5948','EMP0000153',NULL,'MR','VILAS','MADHAV','DAITHANKAR','1971-06-01','Male','0','0','0','VILAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','815321421482','AUMPD8881E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(154,'5949','EMP0000154',NULL,'MR','SUNIL','VASANT','DERE','1978-12-02','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','636100877333','AMPPD6647K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(155,'5950','EMP0000155',NULL,'MR','PRADIP','SARJERAO','SHINDE','1983-09-23','Male','0','0','0','PRADIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','202294840458','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(156,'5951','EMP0000156',NULL,'MR','AVINASH','KRUSHNA','CHAUDHARI','1973-11-03','Male','0','0','0','AVINASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','306685434659','AQPPC5966J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(157,'5952','EMP0000157',NULL,'MR','AMOL','BANDU','SALUNKHE','1984-07-12','Male','0','0','0','AMOL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','539344821890','BQYPS2012R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(158,'5954','EMP0000158',NULL,'MR','VISHWANATH','BABURAO','AIRSHINGE','1982-08-01','Male','0','0','0','VISHWANATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','609075707260','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(159,'5955','EMP0000159',NULL,'MR','PRAMOD','MANSING','PATIL','1973-08-29','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','314450047832','AWNPP4011D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(160,'5956','EMP0000160',NULL,'MR','DHANAJI','RAOSAHEB','PALKAR','1982-04-09','Male','0','0','0','DHANAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','499367787118','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(161,'5957','EMP0000161',NULL,'MR','ANIL','SHANKAR','PATEKAR','1984-04-07','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','636893587162','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(162,'5958','EMP0000162',NULL,'MR','DHARMENDRA','POPAT','JADHAV','1984-03-19','Male','0','0','0','DHARMENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','318349895027','AMXPJ2179G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(163,'5959','EMP0000163',NULL,'MR','SAMBHAJI','VISHNU','KOLEKAR','1983-06-04','Male','0','0','0','SAMBHAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','781802589467','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(164,'5960','EMP0000164',NULL,'MR','BALKRISHNA','VISHWANATH','DEVKAR','1981-12-15','Male','0','0','0','BALKRISHNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','938825907563','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(165,'5961','EMP0000165',NULL,'MR','ASHOK','KISAN','KURLEKAR','1982-04-01','Male','0','0','0','ASHOK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','442707219893','AVSPK7319R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(166,'5962','EMP0000166',NULL,'MR','CHANDRKANT','SITARAM','KADAM','1974-01-20','Male','0','0','0','CHANDRKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','431631754085','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(167,'5963','EMP0000167',NULL,'MR','GOVARDHAN','BHAGVAN','CHAVAN','1983-06-25','Male','9371656116','0','0','GOVARDHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','280098562865','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(168,'5964','EMP0000168',NULL,'MR','BHALCHANDRA','MADHUKAR','MALI','1982-09-28','Male','0','0','0','BHALCHANDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','727066184135','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(169,'5966','EMP0000169',NULL,'MR','JAMADAR','MANSOUR','SHABBIR','1986-04-14','Male','0','0','0','JAMADAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','623213438554','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(170,'5968','EMP0000170',NULL,'MR','NAGESH','MOHAN','BADDI','1983-08-12','Male','0','0','0','NAGESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','427164164630','PANNOTAVBL',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(171,'5969','EMP0000171',NULL,'MR','KRISHNAT','TUKARAM','SAPKAL','1987-09-15','Male','0','0','0','KRISHNAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','576431766008','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(172,'5970','EMP0000172',NULL,'MR','DILIP','RAGHUNATH','PALEKAR','1976-01-11','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','734247287642','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(173,'5971','EMP0000173',NULL,'MR','SACHIN','PRABHAKAR','ALAT','1985-01-14','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','889324411777','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(174,'5973','EMP0000174',NULL,'MR','NITIN','VITTHAL','GURAV','1985-01-10','Male','0','0','0','NITIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','593096163688','ANNPG2010N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(175,'5974','EMP0000175',NULL,'MR','AVINASH','NILKANTH','HONDRE','1983-05-11','Male','0','0','0','AVINASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','835154348276','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(176,'5975','EMP0000176',NULL,'MR','SACHIN','DINKAR','JADHAV','1981-08-27','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','447748134912','AUCPJ0743M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(177,'5976','EMP0000177',NULL,'MR','DEEPAK','DATTATRAYA','KUDALE','1983-07-25','Male','0','0','0','DEEPAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','251109365081','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(178,'5977','EMP0000178',NULL,'MR','ASHISH','PRABHAKAR','SHINDE','1983-07-04','Male','0','0','0','ASHISH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','693685586002','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(179,'5978','EMP0000179',NULL,'MR','VAIBHAV','PURUSHOTTAM','LINGADE','1983-09-28','Male','0','0','0','VAIBHAV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','784302267972','AHBPL1375M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(180,'5980','EMP0000180',NULL,'MR','SUNIL','ASHOK','SAVARATKAR','1984-01-27','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','888815881481','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(181,'5981','EMP0000181',NULL,'MR','MANIK','GANPATI','PATIL','1985-03-13','Male','0','0','0','MANIK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','323472710693','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(182,'5982','EMP0000182',NULL,'MR','SUBHASH','GENDEV','SURYAVANSHI','1986-10-14','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','466238703592','BQBPS0485D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(183,'5984','EMP0000183',NULL,'MR','SANJAY','MANOHAR','PAWAR','1975-08-05','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','379625738674','BCSPP6842E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(184,'5985','EMP0000184',NULL,'MR','GAJANAN','EKANATH','DUBAL','1981-10-11','Male','0','0','0','GAJANAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','555523835555','AOQPD8584A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(185,'5987','EMP0000185',NULL,'MR','PRASHANT','GULABRAO','RAUT','1981-04-04','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','321045885316','AQHPR2852G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(186,'5988','EMP0000186',NULL,'MR','KAPIL','PREMSUKH','DANGE','1984-08-12','Male','0','0','0','KAPIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','568091130352','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(187,'5989','EMP0000187',NULL,'MR','DASHARATH','SHANKAR','MHALE','1984-05-24','Male','0','0','0','DASHARATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','466446553040','AZPPM6150R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(188,'5990','EMP0000188',NULL,'MR','SANTOSH','LAXMAN','KUMBHAR','1982-08-26','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','573746830470','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(189,'5991','EMP0000189',NULL,'MR','CHANDRAKANT','MADHUKARRAO','CHAWATKAR','1980-08-08','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','421017651465','AHUPC8387M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(190,'6019','EMP0000190',NULL,'MR','SACHIN','SHANKAR','CHAUDHARI','1980-04-05','Male','9326442912','0','0','sachinchaudhari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','798518945965','ALLPC8585G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(191,'6127','EMP0000191',NULL,'MR','SUBHASH','RAMCHANDRA','GAWALI','1964-02-28','Male','0','0','0','srgawali@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','319146256308','AQVPG1155B',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(192,'6128','EMP0000192',NULL,'MR','RAMESH','PANDURANG','BORADE','1975-08-05','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','273725948532','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(193,'6129','EMP0000193',NULL,'MR','BABASAHEB','GUNDAPPA','BHANDARE','1975-06-25','Male','0','0','0','BABASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','785363611137','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(194,'6130','EMP0000194',NULL,'MR','BHARAT','MAHADEO','RAWAN','1973-10-31','Male','0','0','0','BHARAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','991329000707','AIVPR8686E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(195,'6131','EMP0000195',NULL,'MR','MIRZA MAZHAR','NAWAB','BAIG','1978-09-13','Male','9371458089','0','0','mnbmirza@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','493689602247','AQSPM8598F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(196,'6142','EMP0000196',NULL,'MR','RAJENDRA','JALINDAR','JADHAV','1979-06-05','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','333957779964','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(197,'6143','EMP0000197',NULL,'MR','VIJAY','BANDU','SALUNKHE','1980-02-13','Male','0','0','0','VIJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','887258107272','BZIPS0022C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(198,'6144','EMP0000198',NULL,'MR','DNYANU','SHIVAJI','JAGTAP','1979-10-25','Male','0','0','0','DNYANU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','426158037778','AJVPJ1705H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(199,'6145','EMP0000199',NULL,'MR','SUBHASH','ANANDRAO','MORE','1978-02-13','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','652380115416','BAHPM2670N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(200,'6146','EMP0000200',NULL,'MR','VIKAS','PANDURANG','SHINDE','1984-07-06','Male','0','0','0','VIKAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','230946426171','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(201,'6147','EMP0000201',NULL,'MR','SURESH','RAGHUNATH','PALEKAR','1970-06-15','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','234560374028','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(202,'6164','EMP0000202',NULL,'MR','SUKHDEV','GHAMAJI','DADAS','1976-06-06','Male','0','0','0','SUKHDEV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','216125975098','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(203,'6165','EMP0000203',NULL,'MR','TULSHIRAM','KENCHAPPA','KAMBLE','1983-04-21','Male','0','0','0','TULSHIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','330359527586','AXDPK7447D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(204,'6166','EMP0000204',NULL,'MR','DATTATRAY','RAMCHANDRA','BEBALE','1983-01-13','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','835472127256','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(205,'6167','EMP0000205',NULL,'MR','DATTATRAY','JYOTIRAM','SHELKE','1985-02-04','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','873636897306','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(206,'6176','EMP0000206',NULL,'MR','SANTOSH','JAYRAM','TAYADE','1975-06-21','Male','8411899110','0','0','sjtayade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','838207049375','AIIPT0050D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(207,'6177','EMP0000207',NULL,'MR','NAIR','RAJIV','GOPINATHAN','1982-08-08','Male','8411093300','0','0','rgnair@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','399307077772','AGPPN2457B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(208,'6179','EMP0000208',NULL,'MR','SANDIP','SONU','WAGH','1981-03-04','Male','0','0','0','SANDIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','289521508606','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(209,'6180','EMP0000209',NULL,'MR','PARESH','TUKARAM','MAHAJAN','1983-02-27','Male','0','0','0','PARESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','740266323421','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(210,'6198','EMP0000210',NULL,'MR','ANKUSH','MARUTI','KARDILE','1965-10-16','Male','9325635247','0','0','amkardile@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','491324851625','BRVPK3443A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(211,'6201','EMP0000211',NULL,'MR','DATTATRAY','LAXMAN','HANDE','1976-06-25','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','302824066739','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(212,'6208','EMP0000212',NULL,'MR','UTTAM','BABJI','NALAWADE','1963-06-17','Male','9372153492','0','0','ubnalawade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','421467274720','AAMPN2166L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(213,'6211','EMP0000213',NULL,'MRS','SHUBHANGI','SANJAY','CHAVAN','1981-02-22','Female','0','0','0','shubhangichavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','442596010370','AIMPC8489M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(214,'6212','EMP0000214',NULL,'MR','ASHOK','SIDDAPPA','BHAYAGONDI','1978-09-28','Male','0','0','0','asbhayagondi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','549246418338','APYPB2390D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(215,'6238','EMP0000215',NULL,'MR','SUBRATA',NULL,'KONAR','1972-04-15','Male','9332056627','0','0','snkonar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','901430221592','APRPK7807D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(216,'6243','EMP0000216',NULL,'MR','PREMANAND','DILIP','PARDESHI','1983-12-28','Male','9370592539','0','0','pdpardeshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','919898504319','AWVPP8102H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(217,'6245','EMP0000217',NULL,'MR','NIKHIL','VIJAY','PALAV','1985-01-21','Male','8411077008','0','0','nvpalav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','560202609617','BDDPP3384B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(218,'6252','EMP0000218',NULL,'MR','ABASAHEB','SHRIKANT','JADHAV','1986-11-07','Male','0','0','0','asjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','459554403764','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(219,'6254','EMP0000219',NULL,'MRS','JAYSHRI','VIKRAM','DHUMAL','1978-06-30','Female','0','0','0','jvdhumal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','397546030876','ANOPD2586K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(220,'6271','EMP0000220',NULL,'MS','PRANALI','SHAILENDRA','SHINDE','1969-04-04','Female','9373693059','0','0','psshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','444319482917','CUZPS1443N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(221,'6308','EMP0000221',NULL,'MR','SANTOSH','KUMAR','DHANSRHREE','1984-02-13','Male','0','0','0','bsantoshkumar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','861561808517','ASLPD2840G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(222,'6312','EMP0000222',NULL,'MR','SURESH','MALKARI','GHERADE','1985-05-16','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','224905134681','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(223,'6313','EMP0000223',NULL,'MR','SOMESHWAR','VIJAY','SARGADE','1985-07-27','Male','9370948627','0','0','svsargade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','423303959526','EBFPS0389E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(224,'6318','EMP0000224',NULL,'MR','AJIT','VENKATESH','TAVARGERI','1982-12-25','Male','9372912334','0','0','avtavargeri@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','324447371380','AIWPT2183K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(225,'6319','EMP0000225',NULL,'MR','BHIMRAO','PANDIT','MUNDE','1990-01-07','Male','0','0','0','BHIMRAO@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','877497183488','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(226,'6326','EMP0000226',NULL,'MR','MAHESH','KUMAR','MAHATMAGANDHI','1979-04-24','Male','9381781791','0','0','maheshkumar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','487007807056','ASLPM1716E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(227,'6331','EMP0000227',NULL,'MR','MAHADEV','RAGHUNATH','TAMBE','1984-07-07','Male','0','0','0','mrtambe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','483434026108','AHGPT9849M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(228,'6340','EMP0000228',NULL,'MR','NAGARAJ','MAHANTAPPA','KUNTOJI','1965-02-06','Male','9325301210','0','0','mknagaraj@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','451277592057','ABRPK3073B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(229,'6345','EMP0000229',NULL,'MR','AMAR','SHRINIVAS','JAGADALE','1981-07-02','Male','9371105524','0','0','asjagdale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','922334798028','AKEPJ7753K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(230,'6347','EMP0000230',NULL,'MRS','BHAKTI','VAIBHAV','MAHASHABDE','1982-12-25','Female','0','0','0','bvmahashabde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','807045994391','BPMPM9512D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(231,'6371','EMP0000231',NULL,'MR','RAJENDRA','SOMAJI','BORKAR','1967-09-03','Male','9372271248','0','0','rsborkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','212851050159','ABOPB5761C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(232,'6386','EMP0000232',NULL,'MR','RAHULKUMAR','SARJERAO','CHAVAN','1983-12-21','Male','9371637261','0','0','rschavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','219965358042','ANKPC3896R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(233,'6387','EMP0000233',NULL,'MR','VISHNU','DNYANOBA','UBALE','1978-06-14','Male','0','0','0','VISHNU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','569135220462','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(234,'6405','EMP0000234',NULL,'MRS','POONAM','AMOL','BHOI','1977-05-28','Female','8411089180','0','0','pabhoi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','824513901015','AMIPB1267C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(235,'6411','EMP0000235',NULL,'MR','BHUSHAN','GANESH','PAWAR','1987-04-18','Male','9371105528','0','0','bgpawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','613118227657','BOHPP6701F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(236,'6436','EMP0000236',NULL,'MR','SHANTINATH','MAHADEV','SUTAR','1986-04-12','Male','0','0','0','smsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','438820626853','BZAPS1523A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(237,'6442','EMP0000237',NULL,'MR','SURESH','NAMDEO','TIKHE','1971-09-08','Male','8411095279','0','0','sntikhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','718205561749','ADNPT0844K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(238,'6452','EMP0000238',NULL,'MR','DILDAR','JAHANGIR','JAHAGIRDAR','1986-06-01','Male','0','0','0','DILDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','238365091445','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(239,'6453','EMP0000239',NULL,'MR','SHIVAJI','NAMDEV','KARE','1984-06-05','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','223813409489','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(240,'6455','EMP0000240',NULL,'MR','VINOD','GENU','BHOSALE','1974-12-10','Male','0','0','0','VINOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','707943405242','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(241,'6459','EMP0000241',NULL,'MR','DILIP','MOTILAL','SHINDE','1978-11-05','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','841098416645','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(242,'6468','EMP0000242',NULL,'MR','SOURAV',NULL,'DAS','1986-05-08','Male','9386393040','0','0','souravdas@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','460995103782','APQPD7564R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(243,'6471','EMP0000243',NULL,'MR','SURESH','PANDURANG','PADWAL','1964-06-01','Male','9325378749','0','0','sppadwal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','619268426617','ABSPP9597Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(244,'6472','EMP0000244',NULL,'MR','BALASAHEB','SONAJI','WAJE','1968-06-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','243248572281','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(245,'6473','EMP0000245',NULL,'MR','D','S','AWAD','1982-07-02','Male','0','0','0','D@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','0','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(246,'6474','EMP0000246',NULL,'MR','SANTOSH','HANUMANT','KADAM','1989-03-17','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','775675675958','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(247,'6475','EMP0000247',NULL,'MR','PRABHAKAR','NIVRUTTI','JANEKAR','1972-06-02','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','940337763524','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(248,'6480','EMP0000248',NULL,'MR','SANDESH','KONDIRAM','SHIVARKAR','1983-10-29','Male','0','0','0','SANDESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','927491306230','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(249,'6482','EMP0000249',NULL,'MR','DNYANESHWAR','SHANKAR','JADHAV','1977-06-15','Male','0','0','0','DNYANESHWAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','486945542323','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(250,'6483','EMP0000250',NULL,'MR','S','S','CHAVAN','1977-06-06','Male','0','0','0','sureshchavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','922749494861','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(251,'6487','EMP0000251',NULL,'MR','SUNIL','JAGANNATH','PATIL','1982-01-30','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','302139059147','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(252,'6490','EMP0000252',NULL,'MR','SAGAR','MARUTI','SAVANT','1987-05-17','Male','0','0','0','SAGAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','507009225822','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(253,'6492','EMP0000253',NULL,'MR','SAMEER','ASHOK','DAUNDE','1979-02-09','Male','0','0','0','SAMEER@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','400178573329','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(254,'6493','EMP0000254',NULL,'MR','SHALIGRAM','PARASHRAM','NIRMAL','1978-01-24','Male','0','0','0','SHALIGRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','517264996936','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(255,'6501','EMP0000255',NULL,'MR','CHANDRAVADAN','BHAUSAHEB','KALE','1961-02-19','Male','9326024668','0','0','cbkale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','603916011965','AIXPK9652K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(256,'6504','EMP0000256',NULL,'MR','DHONDIRAM','SHANKAR','PATIL','1979-07-06','Male','0','0','0','DHONDIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','752144867212','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(257,'6515','EMP0000257',NULL,'MR','BALAJI','VAMANRAO','BIRADAR','1988-01-05','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','346156205418','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(258,'6516','EMP0000258',NULL,'MR','SACHIN','GULAB','JADHAV','1977-01-02','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','546468244236','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(259,'6519','EMP0000259',NULL,'MR','BASAVANAPPA','SHANKAR','BANDICHHODE','1976-06-10','Male','0','0','0','BASAVANAPPA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','703052658048','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(260,'6520','EMP0000260',NULL,'MR','SHIVSHARNAPPA','BHIMSHYO','BODHANKAR','1976-01-14','Male','0','0','0','sbbodankar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','841262978719','AOAPB7567B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(261,'6521','EMP0000261',NULL,'MR','DATTATRAYA','LAXMAN','SARAK','1987-06-05','Male','0','0','0','DATTATRAYA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','366804923808','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(262,'6522','EMP0000262',NULL,'MR','WADAR','ARJUN','SHANKAR','1984-02-01','Male','0','0','0','WADAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','670407999855','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(263,'6524','EMP0000263',NULL,'MR','BHIMSEN','TANAJI','PANCHAL','1986-06-10','Male','9326024889','0','0','BHIMSEN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','335695864661','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(264,'6525','EMP0000264',NULL,'MR','LAXMAN','RAOSAHEB','MUGALE','1973-03-03','Male','0','0','0','LAXMAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','934868920373','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(265,'6526','EMP0000265',NULL,'MR','PRAVIN','GOPAL','KARNEKAR','1978-06-05','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','956228831057','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(266,'6529','EMP0000266',NULL,'MR','YOGESH','SHIVAJI','SHINDE','1983-11-15','Male','0','0','0','ysshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','762060925963','BZTPS1195P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(267,'6530','EMP0000267',NULL,'MR','PRAMOD','MANIKRAO','CHOUGULE','1989-01-01','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','446447581898','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(268,'6557','EMP0000268',NULL,'MR','PANJAB','SURESH','WANKHEDE','1982-11-09','Male','9373693057','0','0','pswankhade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','785075398415','ABEPW1656M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(269,'6565','EMP0000269',NULL,'MR','SAMBHAJI','EKANATH','PATIL','1982-07-05','Male','0','0','0','sepatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','757485449376','ANOPP6376K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(270,'6566','EMP0000270',NULL,'MR','SHASHIKANT','CHINTAMAN','KOSHTI','1965-01-05','Male','9325378774','0','0','sckoshti@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','216977160817','AAZPK8247N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(271,'6570','EMP0000271',NULL,'MR','ANAND','DILEEP','BHOODHAR','1982-12-15','Male','0','0','0','adbhoodhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','467828496125','AKGPB5324G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(272,'6571','EMP0000272',NULL,'MR','ANIL','RAJENDRA','SURYAWANSHI','1987-07-25','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','233466205013','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(273,'6575','EMP0000273',NULL,'MR','VINAYAK','VITTHAL','PATIL','1987-07-10','Male','0','0','0','VINAYAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','919403116782','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(274,'6576','EMP0000274',NULL,'MR','MADHUKAR','SUDHAKAR','SOLANKE','1974-10-04','Male','0','0','0','MADHUKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','458870798683','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(275,'6577','EMP0000275',NULL,'MR','PRAMOD','SHANKAR','THORAT','1983-05-15','Male','0','0','0','psthorat@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','988445177921','AJMPT0543J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(276,'6585','EMP0000276',NULL,'MR','SHRIKANT','SUDAM','HANDAL','1986-09-27','Male','0','0','0','sshandal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','757279349732','ADRPH8575K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(277,'6596','EMP0000277',NULL,'MR','PRADIP','RAMCHANDRA','PATIL','1986-06-19','Male','0','0','0','PRADIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','757925538335','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(278,'6598','EMP0000278',NULL,'MR','VIKAS','JAYARAM','PAWAR','1982-06-22','Male','0','0','0','VIKAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','766070503269','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(279,'6601','EMP0000279',NULL,'MR','JOHN','SEBASTIAN','MASCARENHAS','1989-02-17','Male','0','0','0','JOHN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','930519308351','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(280,'6602','EMP0000280',NULL,'MR','VIJAY','PRABHAKAR','DHUME','1986-07-24','Male','0','0','0','VIJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','319055592139','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(281,'6603','EMP0000281',NULL,'MR','PRAVIN','VILAS','WAGHAMARE','1987-11-05','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','649160841886','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(282,'6604','EMP0000282',NULL,'MR','SACHIN','KARBHARI','CHAKRANARAYAN','1990-07-13','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','706586504537','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(283,'6605','EMP0000283',NULL,'MR','JAYRAM','VIKRAM','SHINDE','1985-01-25','Male','0','0','0','JAYRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','607867914199','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(284,'6606','EMP0000284',NULL,'MR','MAHAMADALI','AYUB','SAYYAD','1977-06-29','Male','9325635672','0','0','masayyad@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','666732122635','BAEPS8991K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(285,'6610','EMP0000285',NULL,'MR','YOGESH','GANESH','NALKANDE','1987-01-25','Male','0','0','0','YOGESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','506886872752','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(286,'6612','EMP0000286',NULL,'MR','SHANKAR','SITARAM','GALAVE','1984-06-24','Male','0','0','0','ssgalve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','565559756185','APLPG9001P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(287,'6615','EMP0000287',NULL,'MR','GANESH','BALASAHEB','SALUNKHE','1981-06-14','Male','9325332304','0','0','gbsalunkhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','801911187682','BTDPS2224P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(288,'6618','EMP0000288',NULL,'MR','GIRISH','MALLAPPA','HAVALAKOD','1985-07-08','Male','0','0','0','GIRISH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','557254932197','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(289,'6623','EMP0000289',NULL,'MR','DEEPAK','RAM','BOHARA','1979-04-26','Male','9325378761','0','0','drbohara@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','307405617432','AWBPB1104D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(290,'6624','EMP0000290',NULL,'MR','SANTOSH','SHASHIKANT','AMBEKAR','1979-01-15','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','210250780633','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(291,'6629','EMP0000291',NULL,'MR','OM','PRAKASH','GUPTA','1961-05-14','Male','7428356679','0','0','opgupta@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','525008060837','ABAPG7308J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,4,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(292,'6637','EMP0000292',NULL,'MR','SANJAY','BAPURAO','HIRVE','1971-04-15','Male','9372271247','0','0','sbhirve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','618835562481','ABXPH2722E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(293,'6650','EMP0000293',NULL,'MR','PRABHAKAR','ARJUN','KAMBLE','1977-12-05','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','412326081351','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(294,'6652','EMP0000294',NULL,'MR','ABHIMANYU','VISHWANATH','KONDHARE','1976-06-01','Male','0','0','0','ABHIMANYU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','745032044298','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(295,'6664','EMP0000295',NULL,'MR','RAVINDRA','RAMDAS','JAIN','1963-03-31','Male','9371781885','0','0','rrjain@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','790390835316','AFXPJ6504L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(296,'6667','EMP0000296',NULL,'MR','SAHEBRAO','VAIJINATH','LANDGE','1977-02-20','Male','0','0','0','svlandge@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','953960761208','AECPL1695Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(297,'6695','EMP0000297',NULL,'MR','PRATAP','ATMARAM','RANAWARE','1975-11-20','Male','0','0','0','PRATAP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','705034965758','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(298,'6696','EMP0000298',NULL,'MR','BANDU','JAYWANT','SURYAWANSHI','1965-06-01','Male','0','0','0','bjsuryawanshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','385569741318','CHSPS3667J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(299,'6697','EMP0000299',NULL,'MR','SHAHAJI','NATHURAM','SAWANT','1975-06-29','Male','0','0','0','SHAHAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','267454372889','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(300,'6698','EMP0000300',NULL,'MR','DHANAJAY','ARJUN','SHENDKAR','1980-07-14','Male','0','0','0','dashendkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','356122782556','BMKPS0756E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(301,'6699','EMP0000301',NULL,'MR','SUDHIR','MANOHAR','BHOLE','1972-10-27','Male','0','0','0','SUDHIR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','633649964779','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(302,'6700','EMP0000302',NULL,'MR','NIRAJAN','ONKARARAO','DESHMUKH','1979-10-02','Male','0','0','0','NIRAJAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','650602806398','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(303,'6701','EMP0000303',NULL,'MR','HANUMANT','VISHNU','KURADE','1965-06-01','Male','0','0','0','hvkurade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','613219062815','ABZPK5059R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(304,'6702','EMP0000304',NULL,'MR','BALASAHEB','SHRIRAM','PATIL','1978-06-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','869046030495','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(305,'6703','EMP0000305',NULL,'MR','MALLIKARJUN','LAGAMANNA','KATTIMANI','1983-06-01','Male','0','0','0','MALLIKARJUN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','680606970127','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(306,'6704','EMP0000306',NULL,'MR','ANNA','BABAN','NIMBALKAR','1976-07-12','Male','0','0','0','ANNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','606454638634','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(307,'6706','EMP0000307',NULL,'MR','GANGADHAR','DEVRAOJI','GEDEKAR','1986-03-23','Male','0','0','0','GANGADHAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','385398150022','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(308,'6707','EMP0000308',NULL,'MR','NILESH','BALAKRISHNA','LOHAR','1981-04-04','Male','0','0','0','NILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','359614886643','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(309,'6708','EMP0000309',NULL,'MR','PRAVIN','SHRIRANG','LOHAR','1982-11-07','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','909553058753','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(310,'6709','EMP0000310',NULL,'MR','MANE','RAMCHANDRA','BABURAV','1981-04-16','Male','0','0','0','rbmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','581417706714','ANSPM7017J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(311,'6711','EMP0000311',NULL,'MR','HEMANT','PRABHAKARRAO','WARHEKAR','1985-06-04','Male','0','0','0','HEMANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','597985196169','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(312,'6712','EMP0000312',NULL,'MR','PRASHANT','VILAS','GAVALI','1985-07-02','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','271435174946','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(313,'6713','EMP0000313',NULL,'MR','SUGRIV','SOMNATH','KAKADE','1978-06-10','Male','0','0','0','sskakade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','842004840057','BSTPK0973Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(314,'6724','EMP0000314',NULL,'MS','PRAJAKTA','NITIN','DHORJE','1987-06-26','Female','9371370167','0','0','pndhorje@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','775972747871','ASYPD6155F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(315,'6729','EMP0000315',NULL,'MR','SAMEER','PURUSHOTTAM','SHIRODKAR','1977-03-06','Male','9372342132','0','0','spshirodkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','636952774225','BDAPS5367Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(316,'6735','EMP0000316',NULL,'MR','RAJESH','BABASINGH','GAUTAM','1978-10-05','Male','9372337073','0','0','rbgoutam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','444254126931','AOBPG4665C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(317,'6741','EMP0000317',NULL,'MR','CHANDRASHEKHAR','SHANKAR','TISGAONKAR','1962-03-31','Male','9325378742','0','0','cstisgaonkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','572833410848','AAKPT4095N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(318,'6770','EMP0000318',NULL,'MR','ANIL','RAJARAM','DHOLE','1977-09-18','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','872220485617','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(319,'6771','EMP0000319',NULL,'MR','GANESH','NAMDEO','SHINDE','1973-12-12','Male','0','0','0','gnshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','694653614626','CJXPS4941L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(320,'6774','EMP0000320',NULL,'MR','SHIVAJI','RAMU','HAKE','1975-06-01','Male','0','0','0','srhake@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','206669302188','ADGPH5706B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(321,'6787','EMP0000321',NULL,'MR','BALASAHEB','MARUTI','KUMBHAR','1967-06-12','Male','0','0','0','bmkumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','401600728131','ASZPK2732N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(322,'6810','EMP0000322',NULL,'MR','ARVIND','HARIBHAU','BANSODE','1967-08-01','Male','0','0','0','ahbansode@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','584944302001','BAZPB3404R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(323,'6811','EMP0000323',NULL,'MR','MADHUKAR','PRALHAD','CHOUDHARY','1972-03-27','Male','0','0','0','mpchaudhari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','624445148247','AGRPC1215G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(324,'6812','EMP0000324',NULL,'MR','KAILAS','RATAN','PATIL','1981-11-17','Male','0','0','0','krpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','300353462801','BMCPP4633B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(325,'6813','EMP0000325',NULL,'MR','RUPCHANDRA','SHAMRAO','KADAM','1986-08-15','Male','0','0','0','rskadam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','267615342306','CMLPK5151R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(326,'6814','EMP0000326',NULL,'MR','DATTATRAY','HANMANT','PAWAR','1979-08-15','Male','0','0','0','dhpawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','820323573721','BWJPP7949D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(327,'6817','EMP0000327',NULL,'MR','SUNIL','KUNDALLAL','JAISWAL','1971-08-07','Male','0','0','0','skjaiswal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','360972653157','AMIPJ5876B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(328,'6818','EMP0000328',NULL,'MR','NAVNATH','DATTATRAY','SUTAR','1976-07-02','Male','0','0','0','ndsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','959002157073','CAJPS7256K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(329,'6819','EMP0000329',NULL,'MR','MILAN','SUBAL','MANNA','1989-04-17','Male','0','0','0','msmanna@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','820265082037','AXKPM0135B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(330,'6820','EMP0000330',NULL,'MR','JAYRAJ','SANJEEV','SAPALIKA','1983-10-15','Male','0','0','0','jssapalika@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','477846066495','CWSPS7897D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(331,'6821','EMP0000331',NULL,'MR','RANGARAO','PARSU','REDEKAR','1976-06-09','Male','0','0','0','rpredekar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','398535531067','BGQPR3931N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(332,'6822','EMP0000332',NULL,'MR','RAMKRUSHNA','MADAN','INGOLE','1986-11-29','Male','0','0','0','rmingole@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','389790122032','ABZPJ3438A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(333,'6823','EMP0000333',NULL,'MR','SAMBHAJIRAO','VISHVASRAO','DISALE','1966-10-25','Male','0','0','0','svdisale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','299444383592','APIPD8502K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(334,'6824','EMP0000334',NULL,'MR','ABHAY','JAGANNATH','RAUT','1976-12-09','Male','0','0','0','ajraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','829584644604','BFOPR6604B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(335,'6825','EMP0000335',NULL,'MR','MAHADVE','JAGANNATH','WAGHMARE','1973-06-02','Male','0','0','0','mjwaghmare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','966812470470','ABNPW4601R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(336,'6826','EMP0000336',NULL,'MR','SHRINIWAS','TAYAPPA','DAYAL','1969-06-26','Male','0','0','0','stdayal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','200920157932','BDJPD7777E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(337,'6828','EMP0000337',NULL,'MR','RAGHUNATH','MAHADEV','MANE','1962-06-15','Male','0','0','0','rmmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','321182762928','BTNPM1387F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(338,'6841','EMP0000338',NULL,'MR','AMOL','DATTATRAY','PALKHE','1973-03-27','Male','0','0','0','adpalkhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','512716433227','APWPP7416E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(339,'6868','EMP0000339',NULL,'MR','NARESH','VITTHALSA','SONWAL','1970-09-20','Male','0','0','0','nvsonwal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','422951768416','BVCPS9482G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(340,'6880','EMP0000340',NULL,'MR','NISCHAD','ABDUL','SALAM','1972-07-26','Male','8411094368','0','0','nasalam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','895544061622','ATHPS6225K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(341,'6883','EMP0000341',NULL,'MS','SUSHAMA','JAYAWANT','SHIRKE','1971-01-01','Female','0','0','0','sjshirke@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','685952329860','CMSPS3947L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(342,'6889','EMP0000342',NULL,'MR','MANDALA','JOHN','PAUL','1991-08-25','Male','9372268434','0','0','johnpaul@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','821813346766','BZFPM7432K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(343,'6890','EMP0000343',NULL,'MR','VASANT','PARBATRAO','NITTURE','1972-07-02','Male','9371105526','0','0','vpnitture@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','735241551567','AAHPN0641B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(344,'6894','EMP0000344',NULL,'MR','S','R','BARSE','1989-02-10','Male','0','0','0','S@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','0','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(345,'6898','EMP0000345',NULL,'MR','ASHOK','MAHADEV','SUTAR','1965-06-04','Male','9326653845','0','0','amsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','281193949309','ADXPS3657F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(346,'6903','EMP0000346',NULL,'MR','SAHIL','ILAI','MUJAWAR','1995-01-01','Male','0','0','0','simujawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','442908965210','CVEPM1715P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(347,'6906','EMP0000347',NULL,'MR','ANANT','ASHOK','PATIL','1987-06-13','Male','0','0','0','aapatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','431234069658','BNOPP9009G',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(348,'6908','EMP0000348',NULL,'MR','SUCHIT','CHANDRASHEKHAR','JADHAV','1996-10-22','Male','0','0','0',' scjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','557488513202','BBUPJ9624H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(349,'6909','EMP0000349',NULL,'MR','SURAJ','ADHIK','JAGDALE','1994-02-15','Male','0','0','0','sajagadale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','762216764197','BBWPJ2043N',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(350,'6911','EMP0000350',NULL,'MR','AKASH','EKNATH','BARAVE','1994-09-21','Male','0','0','0','aebarve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','203851333406','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(351,'6916','EMP0000351',NULL,'MR','P','M','SHINDE','1983-09-30','Male','0','0','0','pmshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','471318169224','BMWPS1957B',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(352,'6917','EMP0000352',NULL,'MR','PRATIK','DEEPAK','RAUT','1993-01-15','Male','0','0','0','pdraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','980301759834','AVAPR4481P',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(353,'6920','EMP0000353',NULL,'MS','GEETA','SURESH','MULIK','1993-07-13','Female','0','0','0','GEETA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','612548733033','BNUPM3042A',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(354,'7072','EMP0000354',NULL,'MS','NAMRATA','KASHIRAM','KHEDEKAR','1989-07-19','Female','0','0','0','nkkhedekar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','868120373518','DRTPK1149D',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(355,'7108','EMP0000355',NULL,'MR','SAGAR','BHASKAR','THOMBARE','1991-11-09','Male','0','0','0','SAGAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','713793317334','APEPT1059D',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(356,'7110','EMP0000356',NULL,'MR','RAJKUMAR','SADASHIV','SUTAR','1992-08-11','Male','0','0','0','RAJKUMAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','632291807471','CJGPS7837A',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(357,'8607','EMP0000357',NULL,'MR','PRADIP','SHANKARLAL','DAVE','1960-09-21','Male','0','0','0','psdave@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','985840883840','ACCPD1507B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(358,'8610','EMP0000358',NULL,'MR','HEMANT','GAJANAN','SAMANT','1959-08-30','Male','0','0','0','hgsamant@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','429397765913','AFOPS1619A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(359,'8617','EMP0000359',NULL,'MR','DINESH','HARIBANSH','PATHAK','1959-09-15','Male','0','0','0','DINESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','706532893235','ADRPP5776C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(360,'8621','EMP0000360',NULL,'MR','MANGESH','KASHIRAM','DHADVE','1979-05-25','Male','0','0','0','mkdhadve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','390796616955','AOSPD1660D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(361,'8622','EMP0000361',NULL,'MRS','URMILA','UMESH','NAGARKAR','1962-09-20','Female','0','0','0','urmilanagarkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','718271709949','ABUPN0104F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(362,'8633','EMP0000362',NULL,'MR','MILIND','RAMESH','PATIL','1986-10-30','Male','0','0','0','mrpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','673643008360','BDAPP0569D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(363,'8647','EMP0000363',NULL,'MR','GANESH','SHRIRANG','PARTHE','1982-08-22','Male','0','0','0','gsparthe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','785295999974','AZSPP0256E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(364,'8650','EMP0000364',NULL,'MR','VIJAY','DATTATRAY','GAWADE','1980-10-12','Male','0','0','0','vdgawade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','443706469030','ALWPG5715B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(365,'8653','EMP0000365',NULL,'MR','SAURABH','DEEPAK','MHATRE','1991-12-24','Male','0','0','0','sdmhatre@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','0','BCIPM5641L',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(366,'8654','EMP0000366',NULL,'MS','RESHMA','ABDUL','WAHID SHAIKH','1994-09-28','Female','0','0','0','reshmashaikh@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','0','DUVPS3700P',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL);
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
-- Table structure for table `expence_opestions`
--

DROP TABLE IF EXISTS `expence_opestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expence_opestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_grade_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_expence_opestions_on_employee_grade_id` (`employee_grade_id`),
  CONSTRAINT `fk_rails_7756d8e31e` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expence_opestions`
--

LOCK TABLES `expence_opestions` WRITE;
/*!40000 ALTER TABLE `expence_opestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `expence_opestions` ENABLE KEYS */;
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
-- Table structure for table `expenses_masters`
--

DROP TABLE IF EXISTS `expenses_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expence_opestion_id` int(11) DEFAULT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `billing_opestion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_option_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `min_amount` float DEFAULT NULL,
  `max_amount` float DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_expenses_masters_on_expence_opestion_id` (`expence_opestion_id`),
  KEY `index_expenses_masters_on_mode_id` (`mode_id`),
  KEY `index_expenses_masters_on_billing_option_id` (`billing_option_id`),
  KEY `index_expenses_masters_on_employee_grade_id` (`employee_grade_id`),
  CONSTRAINT `fk_rails_3ff6644ab1` FOREIGN KEY (`mode_id`) REFERENCES `modes` (`id`),
  CONSTRAINT `fk_rails_655024b1e6` FOREIGN KEY (`billing_option_id`) REFERENCES `billing_options` (`id`),
  CONSTRAINT `fk_rails_b5c3d4d262` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_c37b74ed1d` FOREIGN KEY (`expence_opestion_id`) REFERENCES `expence_opestions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses_masters`
--

LOCK TABLES `expenses_masters` WRITE;
/*!40000 ALTER TABLE `expenses_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses_masters` ENABLE KEYS */;
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
-- Table structure for table `food_options`
--

DROP TABLE IF EXISTS `food_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_option_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `amount` decimal(15,10) DEFAULT NULL,
  `is_optional` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_food_options_on_travel_option_id` (`travel_option_id`),
  CONSTRAINT `fk_rails_7b57c0d7df` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_options`
--

LOCK TABLES `food_options` WRITE;
/*!40000 ALTER TABLE `food_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_options` ENABLE KEYS */;
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
  `employee_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_frequest_questions_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_4e5320da74` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequest_questions`
--

LOCK TABLES `frequest_questions` WRITE;
/*!40000 ALTER TABLE `frequest_questions` DISABLE KEYS */;
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
  `transfer_option` tinyint(1) DEFAULT NULL,
  `transfer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `f_transfer_option` tinyint(1) DEFAULT NULL,
  `f_transfer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_comment` text COLLATE utf8_unicode_ci,
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
  `name` text COLLATE utf8_unicode_ci,
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
  `goal_weightage` float DEFAULT NULL,
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
  `activity` text COLLATE utf8_unicode_ci,
  `document_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_file_size` int(11) DEFAULT NULL,
  `document_updated_at` datetime DEFAULT NULL,
  `document_present` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- Table structure for table `gps_informations`
--

DROP TABLE IF EXISTS `gps_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `radius` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `to_days` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gps_informations_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_c7436768b1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gps_informations`
--

LOCK TABLES `gps_informations` WRITE;
/*!40000 ALTER TABLE `gps_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gps_informations` ENABLE KEYS */;
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
INSERT INTO `groups` VALUES (1,'premier@gmail.com','$2a$10$g6llLTjfv0lyRWO9Q1pttewhJ.JNpMVkq3Bd1vcvMU74WDEZCgtsG','Premier',NULL,NULL,NULL,2,'2018-11-17 07:56:42','2018-11-17 05:36:40','127.0.0.1','192.168.13.249','2018-11-17 05:36:40','2018-11-17 07:56:42',NULL,NULL,NULL,NULL);
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
-- Table structure for table `housing_rents`
--

DROP TABLE IF EXISTS `housing_rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housing_rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investmentment_declaration_id` int(11) DEFAULT NULL,
  `metro_city` tinyint(1) DEFAULT NULL,
  `estimated_rent` decimal(10,0) DEFAULT NULL,
  `actual_rent` decimal(10,0) DEFAULT NULL,
  `accepted_rent` decimal(10,0) DEFAULT NULL,
  `rejected_rent` decimal(10,0) DEFAULT NULL,
  `landlord_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landlord_pan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_rents`
--

LOCK TABLES `housing_rents` WRITE;
/*!40000 ALTER TABLE `housing_rents` DISABLE KEYS */;
/*!40000 ALTER TABLE `housing_rents` ENABLE KEYS */;
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
-- Table structure for table `income_tax_masters`
--

DROP TABLE IF EXISTS `income_tax_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_tax_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `second_name` text COLLATE utf8_unicode_ci,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_tax_masters`
--

LOCK TABLES `income_tax_masters` WRITE;
/*!40000 ALTER TABLE `income_tax_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `income_tax_masters` ENABLE KEYS */;
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
  `actual_amt` decimal(10,0) DEFAULT NULL,
  `accepted_amt` decimal(10,0) DEFAULT NULL,
  `rejected_amt` decimal(10,0) DEFAULT NULL,
  `total_amt` decimal(10,0) DEFAULT NULL,
  `is_approve` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `welfare` tinyint(1) DEFAULT NULL,
  `c_off_applicable_day` decimal(10,0) DEFAULT '0',
  `c_off_expire` tinyint(1) DEFAULT NULL,
  `contract_month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `is_regularization` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
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
-- Table structure for table `latemark_deductions`
--

DROP TABLE IF EXISTS `latemark_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latemark_deductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `latemark_day` date DEFAULT NULL,
  `latemark_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latemark_amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_latemark_deductions_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_2f75c48c95` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latemark_deductions`
--

LOCK TABLES `latemark_deductions` WRITE;
/*!40000 ALTER TABLE `latemark_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `latemark_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latemark_masters`
--

DROP TABLE IF EXISTS `latemark_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latemark_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_time` time DEFAULT NULL,
  `allow_latemark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `late_limit` time DEFAULT NULL,
  `halfday_allow` tinyint(1) DEFAULT NULL,
  `fullday_working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `halfday_working_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latemark_masters`
--

LOCK TABLES `latemark_masters` WRITE;
/*!40000 ALTER TABLE `latemark_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `latemark_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latemark_totals`
--

DROP TABLE IF EXISTS `latemark_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latemark_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `latemark_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `confirm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_latemark_totals_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_bf3ade75e1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latemark_totals`
--

LOCK TABLES `latemark_totals` WRITE;
/*!40000 ALTER TABLE `latemark_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `latemark_totals` ENABLE KEYS */;
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
  `pre_request` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
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
  `balance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `count` decimal(15,2) DEFAULT NULL,
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
-- Table structure for table `listed_companies`
--

DROP TABLE IF EXISTS `listed_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listed_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optinal_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listed_companies`
--

LOCK TABLES `listed_companies` WRITE;
/*!40000 ALTER TABLE `listed_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `listed_companies` ENABLE KEYS */;
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
-- Table structure for table `meeting_follow_ups`
--

DROP TABLE IF EXISTS `meeting_follow_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_follow_ups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_plan_id` int(11) DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `follow_up_response` text COLLATE utf8_unicode_ci,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `next_date` date DEFAULT NULL,
  `next_time` time DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meeting_follow_ups_on_employee_plan_id` (`employee_plan_id`),
  CONSTRAINT `fk_rails_05e860a69d` FOREIGN KEY (`employee_plan_id`) REFERENCES `employee_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_follow_ups`
--

LOCK TABLES `meeting_follow_ups` WRITE;
/*!40000 ALTER TABLE `meeting_follow_ups` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_follow_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_minutes`
--

DROP TABLE IF EXISTS `meeting_minutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_minutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_plan_id` int(11) DEFAULT NULL,
  `minutes` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meeting_minutes_on_employee_plan_id` (`employee_plan_id`),
  CONSTRAINT `fk_rails_d0d5912f92` FOREIGN KEY (`employee_plan_id`) REFERENCES `employee_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_minutes`
--

LOCK TABLES `meeting_minutes` WRITE;
/*!40000 ALTER TABLE `meeting_minutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_minutes` ENABLE KEYS */;
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
-- Table structure for table `modes`
--

DROP TABLE IF EXISTS `modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expence_opestion_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_modes_on_expence_opestion_id` (`expence_opestion_id`),
  CONSTRAINT `fk_rails_a1140761ea` FOREIGN KEY (`expence_opestion_id`) REFERENCES `expence_opestions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modes`
--

LOCK TABLES `modes` WRITE;
/*!40000 ALTER TABLE `modes` DISABLE KEYS */;
/*!40000 ALTER TABLE `modes` ENABLE KEYS */;
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
-- Table structure for table `monthly_income_taxes`
--

DROP TABLE IF EXISTS `monthly_income_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthly_income_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `bsr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `challan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tax_deposited` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_income_taxes`
--

LOCK TABLES `monthly_income_taxes` WRITE;
/*!40000 ALTER TABLE `monthly_income_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_income_taxes` ENABLE KEYS */;
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
INSERT INTO `nationalities` VALUES (1,'N_1001','Indian','Indian ',NULL,'2018-11-17 07:41:43','2018-11-17 07:41:43');
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
  `marks` tinyint(1) DEFAULT NULL,
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
-- Table structure for table `quarter_income_taxes`
--

DROP TABLE IF EXISTS `quarter_income_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quarter_income_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `quarter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reciept_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paid_amount` decimal(10,0) DEFAULT NULL,
  `tax_amount_deducted` decimal(10,0) DEFAULT NULL,
  `tax_amount_deposited` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarter_income_taxes`
--

LOCK TABLES `quarter_income_taxes` WRITE;
/*!40000 ALTER TABLE `quarter_income_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `quarter_income_taxes` ENABLE KEYS */;
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
-- Table structure for table `regularization_reasons`
--

DROP TABLE IF EXISTS `regularization_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regularization_reasons` (
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
-- Dumping data for table `regularization_reasons`
--

LOCK TABLES `regularization_reasons` WRITE;
/*!40000 ALTER TABLE `regularization_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `regularization_reasons` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_masters`
--

LOCK TABLES `relation_masters` WRITE;
/*!40000 ALTER TABLE `relation_masters` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160113091730'),('20160113093434'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092244'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170508142940'),('20170508144515'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170616052732'),('20170617045509'),('20170617062016'),('20170617103654'),('20170619090333'),('20170619093726'),('20170620124404'),('20170621071225'),('20170623073735'),('20170628085423'),('20170803091421'),('20170822073828'),('20170926072224'),('20171015094950'),('20171211112950'),('20171215123749'),('20180101054304'),('20180106055307'),('20180106103351'),('20180111084545'),('20180112043259'),('20180112043926'),('20180112050823'),('20180112051349'),('20180115071109'),('20180117115112'),('20180118052827'),('20180119043105'),('20180120054240'),('20180122063826'),('20180123062737'),('20180123071508'),('20180125061315'),('20180129065031'),('20180130121254'),('20180131045512'),('20180131100047'),('20180131112409'),('20180131125432'),('20180205061421'),('20180205062146'),('20180206044138'),('20180209063251'),('20180219154812'),('20180302070901'),('20180305105413'),('20180306061915'),('20180314091129'),('20180320042856'),('20180327112339'),('20180329130218'),('20180330065333'),('20180330101308'),('20180405110211'),('20180413050118'),('20180413050928'),('20180413051226'),('20180413084503'),('20180413085146'),('20180424052059'),('20180425115559'),('20180502060522'),('20180503061619'),('20180614045158'),('20180614045932'),('20180614060121'),('20180615044220'),('20180615044537'),('20180616065854'),('20180616065955'),('20180618052731'),('20180618095019'),('20180620070911'),('20180705062420'),('20180705110754'),('20180706094527'),('20180707053515'),('20180710102444'),('20180710103031'),('20180725061956'),('20180725064223'),('20180725124208'),('20180725131843'),('20180727054525'),('20180829041504'),('20180829041547'),('20180829041648'),('20180829102000'),('20180903070010'),('20180905073002'),('20180910052338'),('20180910063334'),('20180910081112'),('20180910081735'),('20180910121243'),('20180910121244'),('20180911041233'),('20180911041234'),('20181001121954'),('20181003092326'),('20181004114059'),('20181014094257');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'S001','Maharashtra','2018-11-17 06:02:20','2018-11-17 06:02:20'),(2,1,'S002','Andhra Pradesh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(3,1,'S003','Arunachal Pradesh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(4,1,'S004','Assam','2018-11-17 06:02:20','2018-11-17 06:02:20'),(5,1,'S005','Bihar','2018-11-17 06:02:20','2018-11-17 06:02:20'),(6,1,'S006','Chhattisgarh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(7,1,'S007','Goa','2018-11-17 06:02:20','2018-11-17 06:02:20'),(8,1,'S008','Gujarat','2018-11-17 06:02:20','2018-11-17 06:02:20'),(9,1,'S009','Haryana','2018-11-17 06:02:20','2018-11-17 06:02:20'),(10,1,'S0010','Himachal Pradesh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(11,1,'S0011','Jammu and Kashmir','2018-11-17 06:02:20','2018-11-17 06:02:20'),(12,1,'S0012','Jharkhand','2018-11-17 06:02:20','2018-11-17 06:02:20'),(13,1,'S0013','Kerala','2018-11-17 06:02:20','2018-11-17 06:02:20'),(14,1,'S0014','Madhya Pradesh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(15,1,'S0015','Manipur','2018-11-17 06:02:20','2018-11-17 06:02:20'),(16,1,'S0016','Meghalaya','2018-11-17 06:02:20','2018-11-17 06:02:20'),(17,1,'S0017','Mizoram','2018-11-17 06:02:20','2018-11-17 06:02:20'),(18,1,'S0018','Nagaland','2018-11-17 06:02:20','2018-11-17 06:02:20'),(19,1,'S0019','Odisha','2018-11-17 06:02:20','2018-11-17 06:02:20'),(20,1,'S0020','Punjab','2018-11-17 06:02:20','2018-11-17 06:02:20'),(21,1,'S0021','Rajasthan','2018-11-17 06:02:20','2018-11-17 06:02:20'),(22,1,'S0022','Sikkim','2018-11-17 06:02:20','2018-11-17 06:02:20'),(23,1,'S0023','Tamil Nadu','2018-11-17 06:02:20','2018-11-17 06:02:20'),(24,1,'S0024','Telangana','2018-11-17 06:02:20','2018-11-17 06:02:20'),(25,1,'S0025','Tripura','2018-11-17 06:02:20','2018-11-17 06:02:20'),(26,1,'S0026','Uttar Pradesh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(27,1,'S0027','Uttarakhand','2018-11-17 06:02:20','2018-11-17 06:02:20'),(28,1,'S0028','West Bengal','2018-11-17 06:02:20','2018-11-17 06:02:20'),(29,1,'S0029','Chandigarh','2018-11-17 06:02:20','2018-11-17 06:02:20'),(30,1,'S0026','Andaman and Nicobar Islands','2018-11-17 06:02:20','2018-11-17 06:02:20'),(31,1,'S0027','Dadar and Nagar Haveli','2018-11-17 06:02:20','2018-11-17 06:02:20'),(32,1,'S0028','Daman and Diu','2018-11-17 06:02:20','2018-11-17 06:02:20'),(33,1,'S0029','Delhi','2018-11-17 06:02:20','2018-11-17 06:02:20'),(34,1,'S0028','Lakshadweep','2018-11-17 06:02:20','2018-11-17 06:02:20'),(35,1,'S0029','Puducherry (Pondicherry)','2018-11-17 06:02:20','2018-11-17 06:02:20'),(36,1,'S0030','Karnataka','2018-11-17 06:02:20','2018-11-17 06:02:20'),(37,1,'S0031','NA','2018-11-17 06:02:20','2018-11-17 06:02:20'),(38,2,'S0032','NA','2018-11-17 06:02:20','2018-11-17 06:02:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
INSERT INTO `sub_departments` VALUES (1,11,NULL,'NA',NULL,'2018-11-17 08:05:09','2018-11-17 08:05:09');
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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
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
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
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
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `post_topic` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_c0dffd1f4e` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
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
-- Table structure for table `transaction_records`
--

DROP TABLE IF EXISTS `transaction_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compliance_type_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `reminder_Date` date DEFAULT NULL,
  `previous_days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `after_days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reminder_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transaction_records_on_compliance_type_id` (`compliance_type_id`),
  CONSTRAINT `fk_rails_605740f31c` FOREIGN KEY (`compliance_type_id`) REFERENCES `compliance_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_records`
--

LOCK TABLES `transaction_records` WRITE;
/*!40000 ALTER TABLE `transaction_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_records` ENABLE KEYS */;
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
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
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
-- Table structure for table `transport_allowances`
--

DROP TABLE IF EXISTS `transport_allowances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_allowances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `option` tinyint(1) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transport_allowances_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_b404fe76bd` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_allowances`
--

LOCK TABLES `transport_allowances` WRITE;
/*!40000 ALTER TABLE `transport_allowances` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_allowances` ENABLE KEYS */;
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
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense` decimal(10,0) DEFAULT NULL,
  `daily_bill_status` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `project_master_id` int(11) DEFAULT NULL,
  `approved_amount` decimal(15,10) DEFAULT NULL,
  `from_time` time DEFAULT NULL,
  `to_time` time DEFAULT NULL,
  `employee_plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_requests_on_employee_id` (`employee_id`),
  KEY `index_travel_requests_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_requests_on_travel_mode_id` (`travel_mode_id`),
  KEY `index_travel_requests_on_project_master_id` (`project_master_id`),
  KEY `index_travel_requests_on_employee_plan_id` (`employee_plan_id`),
  CONSTRAINT `fk_rails_50acc33858` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_5b96fe9977` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_85c22a5896` FOREIGN KEY (`project_master_id`) REFERENCES `project_masters` (`id`),
  CONSTRAINT `fk_rails_985cfe5831` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b27ec25f1d` FOREIGN KEY (`employee_plan_id`) REFERENCES `employee_plans` (`id`)
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
  `first` tinyint(1) DEFAULT NULL,
  `second` tinyint(1) DEFAULT NULL,
  `third` tinyint(1) DEFAULT NULL,
  `forth` tinyint(1) DEFAULT NULL,
  `fifth` tinyint(1) DEFAULT NULL,
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

-- Dump completed on 2018-11-17 15:19:22
