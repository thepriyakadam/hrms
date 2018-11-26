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
INSERT INTO `companies` VALUES (1,NULL,'CC_1001','COM001','Premier Ltd.','Premier Ltd.',1,'123456','AAQPP94885','27AADDS5671L1ZU','','Mumbai Pune Road, Chinchwad,Pune',1,NULL,NULL,'pune',411019,'','9909909900','http://premier.co.in','2018-11-17','2018-11-17 06:12:23','2018-11-17 10:18:04','logo.png','image/png',6196,'2018-11-17 10:18:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
INSERT INTO `cost_centers` VALUES (1,'CC_1001','101',NULL,NULL,'2018-11-17 09:09:24','2018-11-17 09:09:24'),(2,'CC_1002','103',NULL,NULL,'2018-11-17 09:10:12','2018-11-17 09:10:12'),(3,'CC_1003','201',NULL,NULL,'2018-11-17 09:10:37','2018-11-17 09:10:37'),(4,'CC_1004','213',NULL,NULL,'2018-11-17 09:11:01','2018-11-17 09:11:01'),(5,'CC_1005','301',NULL,NULL,'2018-11-17 09:11:24','2018-11-17 09:11:24'),(6,'CC_1006','302',NULL,NULL,'2018-11-17 09:11:44','2018-11-17 09:11:44'),(7,'CC_1007','303',NULL,NULL,'2018-11-17 09:13:26','2018-11-17 09:13:26'),(8,'CC_1008','304',NULL,NULL,'2018-11-17 09:14:40','2018-11-17 09:14:40'),(9,'CC_1009','308',NULL,NULL,'2018-11-17 09:15:03','2018-11-17 09:15:03'),(10,'CC_1010','311',NULL,NULL,'2018-11-17 09:15:28','2018-11-17 09:15:28'),(11,'CC_1011','331',NULL,NULL,'2018-11-17 09:16:05','2018-11-17 09:16:05'),(12,'CC_1012','333',NULL,NULL,'2018-11-17 09:16:19','2018-11-17 09:17:11'),(13,'CC_1013','401',NULL,NULL,'2018-11-17 09:17:28','2018-11-17 09:17:28'),(14,'CC_1014','405',NULL,NULL,'2018-11-17 09:17:55','2018-11-17 09:17:55'),(15,'CC_1015','406',NULL,NULL,'2018-11-17 09:18:28','2018-11-17 09:18:28'),(16,'CC_1016','411',NULL,NULL,'2018-11-17 09:18:49','2018-11-17 09:18:49'),(17,'CC_1017','473',NULL,NULL,'2018-11-17 09:23:46','2018-11-17 09:23:46'),(18,'CC_1018','501',NULL,NULL,'2018-11-17 09:24:16','2018-11-17 09:24:16'),(19,'CC_1019','601',NULL,NULL,'2018-11-17 09:24:56','2018-11-17 09:24:56'),(20,'CC_1020','701',NULL,NULL,'2018-11-17 09:25:22','2018-11-17 09:25:22'),(21,'CC_1021','711',NULL,NULL,'2018-11-17 09:26:05','2018-11-17 09:26:05'),(22,'CC_1022','801',NULL,NULL,'2018-11-17 09:26:30','2018-11-17 09:26:30'),(23,'CC_1023','850',NULL,NULL,'2018-11-17 09:27:00','2018-11-17 09:27:00'),(24,'CC_1024','901',NULL,NULL,'2018-11-17 09:27:28','2018-11-17 09:27:28'),(25,'CC_1025','1001',NULL,NULL,'2018-11-17 09:29:54','2018-11-17 09:29:54'),(26,'CC_1026','1101',NULL,NULL,'2018-11-17 09:42:51','2018-11-17 09:42:51'),(27,'CC_1027','1201',NULL,NULL,'2018-11-17 09:43:10','2018-11-17 09:43:10'),(28,'CC_1028','1203',NULL,NULL,'2018-11-17 09:44:53','2018-11-17 09:44:53'),(29,'CC_1029','1205',NULL,NULL,'2018-11-17 09:45:43','2018-11-17 09:45:43'),(30,'CC_1030','1230',NULL,NULL,'2018-11-17 09:46:20','2018-11-17 09:46:20'),(31,'CC_1031','7075A',NULL,NULL,'2018-11-17 09:52:51','2018-11-19 11:03:01'),(32,'CC_1032','103.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:03:21'),(33,'CC_1033','701.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:03:36'),(34,'CC_1034','1802.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:13:54'),(35,'CC_1035','401.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:04'),(36,'CC_1036','1001.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:13'),(37,'CC_1037','1201.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:23'),(38,'CC_1038','406.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:33'),(39,'CC_1039','7077A',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:43'),(40,'CC_1040','7011A',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:14:53'),(41,'CC_1041','308.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:15:02'),(42,'CC_1042','405.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:15:14'),(43,'CC_1043','303.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:15:24'),(44,'CC_1044','7012A',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:15:38'),(45,'CC_1045','311.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:15:54'),(46,'CC_1046','501.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:16:04'),(47,'CC_1047','1801.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:17:12'),(48,'CC_1048','801.0',NULL,NULL,'2018-11-17 10:01:14','2018-11-19 11:17:25'),(49,'CC_1049','7076A',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:17:35'),(50,'CC_1050','2201.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:17:44'),(51,'CC_1051','101.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:17:53'),(52,'CC_1052','7009A',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:18:03'),(53,'CC_1053','2001.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:18:14'),(54,'CC_1054','3101.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:18:31'),(55,'CC_1055','1301.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:18:43'),(56,'CC_1056','1701.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:18:56'),(57,'CC_1057','2801.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:19:04'),(58,'CC_1058','301.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:19:17'),(59,'CC_1059','2601.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:19:37'),(60,'CC_1060','1601.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:19:46'),(61,'CC_1061','901.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:19:57'),(62,'CC_1062','7078A',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:20:16'),(63,'CC_1063','2401.0',NULL,NULL,'2018-11-17 10:01:15','2018-11-19 11:20:25'),(64,'CC_1064','7020A',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:20:35'),(65,'CC_1065','1901.0',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:20:44'),(66,'CC_1066','1203.0',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:20:58'),(67,'CC_1067','850.0',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:21:18'),(68,'CC_1068','1101.0',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:21:27'),(69,'CC_1069','711.0',NULL,NULL,'2018-11-17 10:01:16','2018-11-19 11:21:35'),(70,'CC_1070','333.0',NULL,NULL,'2018-11-17 10:01:17','2018-11-19 11:21:44'),(71,'CC_1071','213.0',NULL,NULL,'2018-11-17 10:01:17','2018-11-19 11:21:55'),(72,'CC_1072','7010A',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:22:06'),(73,'CC_1073','411.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:22:16'),(74,'CC_1074','331.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:22:25'),(75,'CC_1075','1205.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:22:34'),(76,'CC_1076','601.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:22:43'),(77,'CC_1077','302.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:26:40'),(78,'CC_1078','304.0',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:26:52'),(79,'CC_1079','709A',NULL,NULL,'2018-11-17 10:01:18','2018-11-19 11:27:02'),(80,'CC_1080','201.0',NULL,NULL,'2018-11-17 10:01:19','2018-11-19 11:27:12'),(81,'CC_1081','1303.0',NULL,NULL,'2018-11-17 10:01:19','2018-11-19 11:27:20'),(82,'CC_1082','1230.0',NULL,NULL,'2018-11-17 10:01:19','2018-11-19 11:27:30'),(83,'CC_1083','701A',NULL,NULL,'2018-11-17 10:01:20','2018-11-19 11:27:38'),(84,'CC_1084','4001.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:27:49'),(85,'CC_1085','3701.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:27:59'),(86,'CC_1086','3901.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:28:09'),(87,'CC_1087','1273.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:28:18'),(88,'CC_1088','1973.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:28:27'),(89,'CC_1089','473.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:28:35'),(90,'CC_1090','5003.0',NULL,NULL,'2018-11-17 10:01:21','2018-11-19 11:28:43'),(91,NULL,'230.0',NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23'),(92,NULL,'130.0',NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2018-11-17 06:12:23','2018-11-17 06:12:23'),(2,'company_location',5,'2018-11-17 06:16:22','2018-11-17 06:31:30'),(3,'department',31,'2018-11-17 07:11:15','2018-11-20 06:36:52'),(4,'employee',371,'2018-11-17 08:05:09','2018-11-20 06:36:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'DC_1003','DEPT001','','COO OFFICE',1,'',NULL,'2018-11-17 07:11:15','2018-11-17 07:19:26'),(2,1,'DC_1001','DEPT002','','ADMINISTRATION',1,'',NULL,'2018-11-17 07:18:17','2018-11-17 07:18:17'),(3,1,'DC_1002','DEPT003','','AUDIT',1,'',NULL,'2018-11-17 07:18:47','2018-11-17 07:18:47'),(4,1,'DC_1004','DEPT004','','CORPORATE OFFICE',1,'',NULL,'2018-11-17 07:20:17','2018-11-17 07:20:17'),(5,2,'DC_1005','DEPT005','','CORPORATE OFFICE',1,'',NULL,'2018-11-17 07:20:31','2018-11-17 07:20:31'),(6,1,'DC_1006','DEPT006','','DESIGN AND DEVELOPMENT GROUP',1,'',NULL,'2018-11-17 07:20:56','2018-11-17 07:20:56'),(7,1,'DC_1007','DEPT007','','ED MAINTENANCE',1,'',NULL,'2018-11-17 07:21:32','2018-11-17 07:21:32'),(8,1,'DC_1008','DEPT008','','ED MATERIALS',1,'',NULL,'2018-11-17 07:21:57','2018-11-17 07:21:57'),(9,1,'DC_1009','DEPT009','','ED PAINT SHOP',1,'',NULL,'2018-11-17 07:22:27','2018-11-17 07:22:27'),(10,1,'DC_1010','DEPT010','','ED PRODUCTION FABRICATION',1,'',NULL,'2018-11-17 07:23:10','2018-11-17 07:23:10'),(11,1,'DC_1011','DEPT011','','ED PRODUCTION MACHINING',1,'',NULL,'2018-11-17 07:23:47','2018-11-17 07:23:47'),(12,1,'DC_1012','DEPT012','','ED PROJECTS',1,'',NULL,'2018-11-17 07:24:37','2018-11-17 07:24:37'),(13,1,'DC_1013','DEPT013','','ED QA',1,'',NULL,'2018-11-17 07:25:17','2018-11-17 07:25:17'),(14,1,'DC_1014','DEPT014','','ED SALES & MARKETING',1,'',NULL,'2018-11-17 07:25:46','2018-11-17 07:25:46'),(15,1,'DC_1015','DEPT015','','ED STORES & LOGISTICS',1,'',NULL,'2018-11-17 07:26:30','2018-11-17 07:26:30'),(16,1,'DC_1016','DEPT016','','FINANCE',1,'',NULL,'2018-11-17 07:27:07','2018-11-17 07:27:07'),(17,1,'DC_1017','DEPT017','','H.R.D.',1,'',NULL,'2018-11-17 07:27:44','2018-11-17 07:27:44'),(18,1,'DC_1018','DEPT018','','HEAVY MACHINES GROUP',1,'',NULL,'2018-11-17 07:28:14','2018-11-17 07:28:14'),(19,1,'DC_1019','DEPT019','','LIGHT MACHINES GROUP',1,'',NULL,'2018-11-17 07:28:52','2018-11-17 07:28:52'),(20,1,'DC_1020','DEPT020','','MATERIALS',1,'',NULL,'2018-11-17 07:29:24','2018-11-17 07:29:24'),(21,1,'DC_1021','DEPT021','','MD LOGISTICS',1,'',NULL,'2018-11-17 07:30:14','2018-11-17 07:30:14'),(22,1,'DC_1022','DEPT022','','PRODUCTION PLANNING CONTROL',1,'',NULL,'2018-11-17 07:30:59','2018-11-17 07:30:59'),(23,1,'DC_1023','DEPT023','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:31:37','2018-11-17 07:31:37'),(24,5,'DC_1024','DEPT024','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:31:59','2018-11-17 07:31:59'),(25,3,'DC_1025','DEPT025','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:32:15','2018-11-17 07:32:15'),(26,4,'DC_1026','DEPT026','','SALES AND MARKETING',1,'',NULL,'2018-11-17 07:32:34','2018-11-17 07:32:34'),(27,1,'DC_1027','DEPT027','','SYSTEM',1,'',NULL,'2018-11-17 07:33:31','2018-11-17 07:33:31'),(28,1,'DC_1028','DEPT028','','TOOL ROOM / TOOL CRIB',1,'',NULL,'2018-11-17 07:34:04','2018-11-17 07:34:04'),(29,1,'DC_1029','DEPT029','','TQM,QA,STD',1,'',NULL,'2018-11-17 07:34:39','2018-11-17 07:34:39'),(30,1,'DC_1030','DEPT030','','VENDOR DEVELOPEMENT',1,'',NULL,'2018-11-17 07:35:13','2018-11-17 07:35:13'),(31,1,'DC_1031','DEPT031','','COMMON DEPT',1,'',NULL,'2018-11-20 06:36:52','2018-11-20 06:41:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,'ED_1001','CNC MACHINIST',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(2,'ED_1002','MACHINIST',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(3,'ED_1003','MAZDOOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(4,'ED_1004','MANAGER (DESIGN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(5,'ED_1005','JOB INSPECTOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(6,'ED_1006','EXECUTIVE (MD)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(7,'ED_1007','GRINDER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(8,'ED_1008','FITTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(9,'ED_1009','ASSOCIATE HEAD (ELECTRONIC DESIGN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(10,'ED_1010','TURNER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(11,'ED_1011','ELECT.D*MAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(12,'ED_1012','WIREMAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(13,'ED_1013','MECH DRAUGHTSMAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(14,'ED_1014','ELECTRICIAN',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(15,'ED_1015','ASSOCIATE HEAD (PLANT & MAINTENANCE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(16,'ED_1016','PAINTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(17,'ED_1017','HEAD (SALES & MKTG - GEAR MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(18,'ED_1018','ASSOCIATE HEAD (SYSTEM)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(19,'ED_1019','TYPIST CUM CLERK',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(20,'ED_1020','FITTER CUM SCRAPER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(21,'ED_1021','STENOGRAPHER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(22,'ED_1022','HEAD (DESIGN & DEVELOPMENT)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(23,'ED_1023','ASSOCIATE HEAD (PROJECTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(24,'ED_1024','MANAGER (PURCHASE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(25,'ED_1025','DRIVER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(26,'ED_1026','MANAGER (IT HARDWARE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(27,'ED_1027','MANAGER (ELECTRICAL ASSY - GEAR MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(28,'ED_1028','HEAD (COMMERCIAL, MARKETING & PURCHASE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(29,'ED_1029','ASSOCIATE HEAD (INTERNAL AUDIT)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(30,'ED_1030','MANAGER (STORES & LOGISTICS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(31,'ED_1031','EXECUTIVE (ADMIN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(32,'ED_1032','MOTOR VEHICLE DRIVER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(33,'ED_1033','MANAGER (PROJECTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(34,'ED_1034','MANAGER (PRODUCTION - SGI)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(35,'ED_1035','MANAGER (PLANT ADMIN)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(36,'ED_1036','MANAGER (PRODUCTION - PRIMARY PARTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(37,'ED_1037','MANAGER (ELECTRICAL ASSY - HEAVY MACHINES)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(38,'ED_1038','AUTO MECH.',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(39,'ED_1039','MANAGER (SOFTWARE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(40,'ED_1040','ASSOCIATE HEAD (BANKING & CASH)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(41,'ED_1041','MANAGER (PRODUCTION - HEAVY M/C)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(42,'ED_1042','MANAGER (MAINTENANCE ELECTRICAL)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(43,'ED_1043','EXECUTIVE (ACCOUNTS)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(44,'ED_1044','MUKADAMI CLERK',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(45,'ED_1045','WELDER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(46,'ED_1046','PAINTER CUM BLASTER',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(47,'ED_1047','MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(48,'ED_1048','MANAGER (MAINTENANCE)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(49,'ED_1049','MANAGER (SPARES & SERVICING)',NULL,NULL,'2018-11-17 09:18:50','2018-11-17 09:18:50'),(50,'ED_1050','ASSOCIATE HEAD (Q.A.)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(51,'ED_1051','MANAGER (FIXTURE & TOOL DESIGN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(52,'ED_1052','ASSOCIATE HEAD (CURRENT ASSETS & GST)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(53,'ED_1053','JIG BORER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(54,'ED_1054','ASSOCIATE HEAD (ACCOUNTS - PLANT)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(55,'ED_1055','EXECUTIVE (ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(56,'ED_1056','MANAGER (PRODUCTION - CUTTING & BENDING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(57,'ED_1057','SECURITY GUARD',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(58,'ED_1058','MANAGER (GEAR MACHINE ASSY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(59,'ED_1059','MANAGER (QA - NDT)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(60,'ED_1060','OFFICE ASSTT.',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(61,'ED_1061','FITTER (MAINT.)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(62,'ED_1062','MANAGER (SALES & SERVICE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(63,'ED_1063','AUTO MECHANIC CUM DRIVER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(64,'ED_1064','M.M.T.M.(FITTER)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(65,'ED_1065','MANAGER (PURCHASE - INDIRECT MATERIAL)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(66,'ED_1066','ASSOCIATE HEAD (METRO MANUFACTURING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(67,'ED_1067','FITTER-CUM SCRAPER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(68,'ED_1068','MARKER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(69,'ED_1069','D.P.OPT.CUM.MAZDOOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(70,'ED_1070','MANAGER (MACHINE SHOP)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(71,'ED_1071','ASSOCIATE HEAD (MARKETING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(72,'ED_1072','HEAD (MANUFACTURING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(73,'ED_1073','MANAGER (ELECTRICAL DESIGN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(74,'ED_1074','MANAGER (SERVICING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(75,'ED_1075','EXECUTIVE (SYSTEM)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(76,'ED_1076','MANAGER (PLANNING & PRODUCTION CONTROL)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(77,'ED_1077','EXECUTIVE (WELFARE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(78,'ED_1078','MANAGER (PRODUCTION - METRO/WIND)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(79,'ED_1079','MANAGER (SERVICING & APPLICATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(80,'ED_1080','HEAD (ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(81,'ED_1081','EXECUTIVE (IR)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(82,'ED_1082','MANAGER (GEAR MACHINES ASSY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(83,'ED_1083','ASSOCIATE HEAD (CO ADMIN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(84,'ED_1084','MANAGER (CORPORATE AFFAIRS)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(85,'ED_1085','COMPANY TRAINEE',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(86,'ED_1086','EXECUTIVE (FINANCE)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(87,'ED_1087','ASSOCIATE HEAD (SECRETARIAL & TAXATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(88,'ED_1088','MANAGER (BANKING)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(89,'ED_1089','EXECUTIVE (TAXATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(90,'ED_1090','MANAGER (ADMINISTRATION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(91,'ED_1091','EXECUTIVE',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(92,'ED_1092','ASSOCIATE HEAD (IR)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(93,'ED_1093','ASSOCIATE HEAD (PRODUCTION SGI)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(94,'ED_1094','MANAGER (SALES TAX & P&L)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(95,'ED_1095','ASSEMBLY PIPER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(96,'ED_1096','MACHINIST BORER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(97,'ED_1097','HEAD (IR & ADMIN)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(98,'ED_1098','DRILLER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(99,'ED_1099','DRILLER CUM BENDING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(100,'ED_1100','ASSOCIATE HEAD (MAINTENANCE ED)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(101,'ED_1101','MANAGER (PRODUCTION - METRO)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(102,'ED_1102','CNC TURNER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(103,'ED_1103','MANAGER (SECURITY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(104,'ED_1104','ASSOCIATE HEAD (SALES & MKTG - NORTH REGION)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(105,'ED_1105','MANAGER (PAINT - METRO/OTHER)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(106,'ED_1106','EXECUTIVE (SECURITY)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(107,'ED_1107','WELDER CUM BENDING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(108,'ED_1108','MAINTENANCE FITTER',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(109,'ED_1109','CUTTING MACHINE OPERATOR',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(110,'ED_1110','MANAGER (QA - WIND)',NULL,NULL,'2018-11-17 09:18:51','2018-11-17 09:18:51'),(111,'ED_1111','Chief Operating Officer',NULL,NULL,'2018-11-20 06:30:53','2018-11-20 06:30:53'),(112,'ED_1112','Head (HR & Admin)',NULL,NULL,'2018-11-20 06:30:53','2018-11-20 06:30:53'),(113,'ED_1113','Head (MD)',NULL,NULL,'2018-11-20 06:30:53','2018-11-20 06:30:53'),(114,'ED_1114','Head (Legal) & Co. Secretary',NULL,NULL,'2018-11-20 06:30:53','2018-11-20 06:30:53'),(115,'ED_1115','Head (Finance & CFO)',NULL,NULL,'2018-11-20 06:30:53','2018-11-20 06:30:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'EG_1001','06',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(2,'EG_1002','21',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(3,'EG_1003','26',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(4,'EG_1004','22',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(5,'EG_1005','114',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(6,'EG_1006','11',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(7,'EG_1007','115',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(8,'EG_1008','23',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(9,'EG_1009','113',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(10,'EG_1010','112',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(11,'EG_1011','12',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(12,'EG_1012','25',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(13,'EG_1013','30',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(14,'EG_1014','24',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(15,'EG_1015','31',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(16,'EG_1016','111',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(17,'EG_1017','97',NULL,'2018-11-17 09:16:50','2018-11-17 09:16:50'),(18,'EG_1018','110','','2018-11-20 06:45:26','2018-11-20 06:45:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_templates`
--

LOCK TABLES `employee_salary_templates` WRITE;
/*!40000 ALTER TABLE `employee_salary_templates` DISABLE KEYS */;
INSERT INTO `employee_salary_templates` VALUES (1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16735.00,200820.00,1,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(2,1,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,1,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(3,1,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,1,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(4,1,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,1,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(5,1,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3239.00,38868.00,1,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(6,2,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16415.00,196980.00,2,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(7,2,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,2,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(8,2,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,2,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(9,2,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,2,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(10,2,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3286.00,39432.00,2,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(11,3,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14960.00,179520.00,3,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(12,3,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,3,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(13,3,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,3,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(14,3,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,3,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(15,3,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3055.00,36660.00,3,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(16,4,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15945.00,191340.00,4,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(17,4,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,4,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(18,4,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,4,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(19,4,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,4,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(20,4,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3246.00,38952.00,4,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(21,6,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15965.00,191580.00,5,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(22,6,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,5,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(23,6,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,5,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(24,6,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,5,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(25,6,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3130.00,37560.00,5,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(26,8,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15945.00,191340.00,6,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(27,8,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,6,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(28,8,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,6,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(29,8,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,6,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(30,8,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3204.00,38448.00,6,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(31,9,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16145.00,193740.00,7,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(32,9,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,7,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(33,9,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,7,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(34,9,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,7,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(35,9,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3213.00,38556.00,7,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(36,10,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15965.00,191580.00,8,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(37,10,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,8,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(38,10,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,8,NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(39,10,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,8,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(40,10,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3237.00,38844.00,8,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(41,11,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15680.00,188160.00,9,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(42,11,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,9,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(43,11,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,9,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(44,11,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,9,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(45,11,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3156.00,37872.00,9,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(46,12,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16635.00,199620.00,10,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(47,12,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,10,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(48,12,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,10,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(49,12,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,10,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(50,12,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3167.00,38004.00,10,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(51,14,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15455.00,185460.00,11,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(52,14,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,11,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(53,14,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,11,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(54,14,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,11,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(55,14,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3209.00,38508.00,11,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(56,15,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16145.00,193740.00,12,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(57,15,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,12,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(58,15,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,12,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(59,15,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,12,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(60,15,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3201.00,38412.00,12,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(61,16,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14765.00,177180.00,13,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(62,16,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,13,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(63,16,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,13,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(64,16,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,13,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(65,16,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2988.00,35856.00,13,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(66,17,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16735.00,200820.00,14,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(67,17,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,14,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(68,17,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,14,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(69,17,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,14,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(70,17,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3289.00,39468.00,14,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(71,18,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16335.00,196020.00,15,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(72,18,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,15,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(73,18,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,15,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(74,18,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,15,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(75,18,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3099.00,37188.00,15,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(76,19,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16055.00,192660.00,16,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(77,19,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,16,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(78,19,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,16,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(79,19,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,16,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(80,19,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3207.00,38484.00,16,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(81,21,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15605.00,187260.00,17,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(82,21,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,17,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(83,21,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,17,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(84,21,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,17,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(85,21,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3039.00,36468.00,17,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(86,22,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15455.00,185460.00,18,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(87,22,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,18,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(88,22,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,18,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(89,22,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,18,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(90,22,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2937.00,35244.00,18,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(91,25,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14340.00,172080.00,19,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(92,25,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,19,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(93,25,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,19,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(94,25,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,19,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(95,25,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2738.00,32856.00,19,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(96,27,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15515.00,186180.00,20,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(97,27,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,20,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(98,27,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,20,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(99,27,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,20,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(100,27,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3037.00,36444.00,20,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(101,28,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15380.00,184560.00,21,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(102,28,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,21,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(103,28,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,21,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(104,28,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,21,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(105,28,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2911.00,34932.00,21,NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(106,29,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15545.00,186540.00,22,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(107,29,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,22,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(108,29,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,22,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(109,29,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,22,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(110,29,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2893.00,34716.00,22,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(111,32,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15335.00,184020.00,23,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(112,32,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,23,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(113,32,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,23,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(114,32,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,23,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(115,32,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2947.00,35364.00,23,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(116,33,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15385.00,184620.00,24,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(117,33,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,24,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(118,33,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,24,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(119,33,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,24,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(120,33,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2856.00,34272.00,24,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(121,34,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15225.00,182700.00,25,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(122,34,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,25,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(123,34,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,25,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(124,34,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,25,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(125,34,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2851.00,34212.00,25,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(126,35,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15225.00,182700.00,26,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(127,35,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,26,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(128,35,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,26,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(129,35,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,26,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(130,35,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2832.00,33984.00,26,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(131,36,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15305.00,183660.00,27,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(132,36,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,27,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(133,36,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,27,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(134,36,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,27,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(135,36,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2834.00,34008.00,27,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(136,37,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15335.00,184020.00,28,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(137,37,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,28,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(138,37,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,28,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(139,37,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,28,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(140,37,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2868.00,34416.00,28,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(141,38,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15225.00,182700.00,29,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(142,38,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,29,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(143,38,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,29,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(144,38,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,29,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(145,38,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2908.00,34896.00,29,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(146,39,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15245.00,182940.00,30,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(147,39,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,30,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(148,39,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,30,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(149,39,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,30,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(150,39,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2868.00,34416.00,30,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(151,40,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15515.00,186180.00,31,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(152,40,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,31,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(153,40,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,31,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(154,40,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,31,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(155,40,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2993.00,35916.00,31,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(156,41,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15145.00,181740.00,32,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(157,41,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,32,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(158,41,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,32,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(159,41,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,32,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(160,41,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2835.00,34020.00,32,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(161,42,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14930.00,179160.00,33,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(162,42,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,33,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(163,42,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,33,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(164,42,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,33,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(165,42,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3099.00,37188.00,33,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(166,44,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14985.00,179820.00,34,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(167,44,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,34,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(168,44,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,34,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(169,44,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,34,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(170,44,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2755.00,33060.00,34,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(171,45,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15245.00,182940.00,35,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(172,45,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,35,NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(173,45,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,35,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(174,45,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,35,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(175,45,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2842.00,34104.00,35,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(176,48,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13965.00,167580.00,36,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(177,48,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,36,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(178,48,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,36,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(179,48,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,36,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(180,48,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2638.00,31656.00,36,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(181,50,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13770.00,165240.00,37,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(182,50,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,37,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(183,50,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,37,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(184,50,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,37,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(185,50,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1528.00,18336.00,37,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(186,56,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13620.00,163440.00,38,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(187,56,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,38,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(188,56,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,38,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(189,56,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,38,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(190,56,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1554.00,18648.00,38,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(191,66,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13700.00,164400.00,39,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(192,66,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,39,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(193,66,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,39,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(194,66,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,39,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(195,66,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1490.00,17880.00,39,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(196,67,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,40,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(197,67,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,40,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(198,67,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,40,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(199,67,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,40,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(200,67,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1461.00,17532.00,40,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(201,68,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13700.00,164400.00,41,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(202,68,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,41,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(203,68,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,41,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(204,68,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,41,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(205,68,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1425.00,17100.00,41,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(206,72,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,42,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(207,72,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,42,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(208,72,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,42,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(209,72,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,42,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(210,72,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1536.00,18432.00,42,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(211,73,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,43,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(212,73,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,43,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(213,73,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,43,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(214,73,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,43,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(215,73,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1370.00,16440.00,43,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(216,74,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,44,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(217,74,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,44,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(218,74,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,44,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(219,74,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,44,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(220,74,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1356.00,16272.00,44,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(221,75,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,45,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(222,75,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,45,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(223,75,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,45,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(224,75,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,45,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(225,75,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1437.00,17244.00,45,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(226,78,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14470.00,173640.00,46,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(227,78,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,46,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(228,78,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,46,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(229,78,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,46,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(230,78,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1732.00,20784.00,46,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(231,79,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,47,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(232,79,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,47,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(233,79,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,47,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(234,79,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,47,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(235,79,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1421.00,17052.00,47,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(236,80,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,48,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(237,80,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,48,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(238,80,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,48,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(239,80,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,48,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(240,80,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1420.00,17040.00,48,NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(241,81,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13700.00,164400.00,49,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(242,81,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,49,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(243,81,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,49,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(244,81,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,49,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(245,81,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1386.00,16632.00,49,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(246,82,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,50,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(247,82,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,50,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(248,82,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,50,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(249,82,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,50,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(250,82,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363.00,16356.00,50,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(251,83,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,51,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(252,83,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,51,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(253,83,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,51,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(254,83,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,51,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(255,83,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1433.00,17196.00,51,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(256,84,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,52,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(257,84,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,52,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(258,84,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,52,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(259,84,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,52,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(260,84,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1411.00,16932.00,52,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(261,85,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,53,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(262,85,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,53,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(263,85,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,53,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(264,85,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,53,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(265,85,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1394.00,16728.00,53,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(266,86,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13700.00,164400.00,54,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(267,86,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,54,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(268,86,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,54,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(269,86,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,54,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(270,86,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1367.00,16404.00,54,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(271,87,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,55,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(272,87,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,55,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(273,87,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,55,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(274,87,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,55,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(275,87,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1413.00,16956.00,55,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(276,88,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,56,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(277,88,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,56,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(278,88,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,56,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(279,88,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,56,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(280,88,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1318.00,15816.00,56,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(281,89,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,57,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(282,89,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,57,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(283,89,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,57,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(284,89,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,57,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(285,89,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1392.00,16704.00,57,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(286,90,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,58,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(287,90,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,58,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(288,90,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,58,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(289,90,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,58,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(290,90,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1413.00,16956.00,58,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(291,91,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,59,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(292,91,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,59,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(293,91,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,59,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(294,91,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,59,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(295,91,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1418.00,17016.00,59,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(296,92,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13420.00,161040.00,60,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(297,92,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,60,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(298,92,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,60,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(299,92,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,60,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(300,92,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1370.00,16440.00,60,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(301,93,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,61,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(302,93,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,61,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(303,93,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,61,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(304,93,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,61,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(305,93,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1385.00,16620.00,61,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(306,95,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,62,NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(307,95,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,62,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(308,95,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,62,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(309,95,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,62,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(310,95,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1385.00,16620.00,62,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(311,96,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,63,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(312,96,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,63,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(313,96,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,63,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(314,96,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,63,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(315,96,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1349.00,16188.00,63,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(316,98,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13560.00,162720.00,64,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(317,98,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,64,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(318,98,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,64,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(319,98,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,64,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(320,98,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363.00,16356.00,64,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(321,99,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,65,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(322,99,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,65,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(323,99,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,65,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(324,99,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,65,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(325,99,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1385.00,16620.00,65,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(326,100,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490.00,161880.00,66,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(327,100,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,66,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(328,100,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,66,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(329,100,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,66,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(330,100,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1337.00,16044.00,66,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(331,102,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,67,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(332,102,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,67,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(333,102,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,67,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(334,102,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,67,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(335,102,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,67,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(336,104,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,68,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(337,104,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,68,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(338,104,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,68,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(339,104,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,68,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(340,104,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,374.00,4488.00,68,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(341,105,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,69,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(342,105,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,69,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(343,105,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,69,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(344,105,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,69,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(345,105,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,69,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(346,108,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,70,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(347,108,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,70,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(348,108,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,70,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(349,108,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,70,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(350,108,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,431.00,5172.00,70,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(351,109,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,71,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(352,109,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,71,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(353,109,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,71,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(354,109,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,71,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(355,109,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,474.00,5688.00,71,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(356,110,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12775.00,153300.00,72,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(357,110,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,72,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(358,110,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,72,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(359,110,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,72,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(360,110,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,72,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(361,111,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,73,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(362,111,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,73,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(363,111,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,73,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(364,111,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,73,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(365,111,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,374.00,4488.00,73,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(366,113,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,74,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(367,113,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,74,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(368,113,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,74,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(369,113,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,74,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(370,113,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,74,NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(371,114,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,75,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(372,114,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,75,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(373,114,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,75,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(374,114,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,75,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(375,114,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,75,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(376,115,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12905.00,154860.00,76,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(377,115,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,76,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(378,115,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,76,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(379,115,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,76,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(380,115,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,378.00,4536.00,76,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(381,116,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,77,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(382,116,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,77,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(383,116,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,77,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(384,116,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,77,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(385,116,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,77,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(386,117,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,78,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(387,117,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,78,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(388,117,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,78,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(389,117,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,78,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(390,117,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,78,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(391,118,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13000.00,156000.00,79,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(392,118,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,79,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(393,118,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,79,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(394,118,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,79,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(395,118,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,366.00,4392.00,79,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(396,119,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,80,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(397,119,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,80,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(398,119,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,80,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(399,119,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,80,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(400,119,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,374.00,4488.00,80,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(401,120,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,81,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(402,120,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,81,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(403,120,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,81,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(404,120,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,81,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(405,120,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,81,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(406,121,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,82,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(407,121,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,82,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(408,121,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,82,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(409,121,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,82,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(410,121,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,396.00,4752.00,82,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(411,122,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12775.00,153300.00,83,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(412,122,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,83,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(413,122,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,83,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(414,122,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,83,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(415,122,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,386.00,4632.00,83,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(416,123,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12840.00,154080.00,84,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(417,123,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,84,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(418,123,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,84,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(419,123,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,84,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(420,123,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,84,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(421,124,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12775.00,153300.00,85,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(422,124,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,85,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(423,124,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,85,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(424,124,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,85,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(425,124,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,331.00,3972.00,85,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(426,125,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,86,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(427,125,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,86,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(428,125,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,86,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(429,125,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,86,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(430,125,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,374.00,4488.00,86,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(431,128,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,87,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(432,128,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,87,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(433,128,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,87,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(434,128,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,87,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(435,128,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,456.00,5472.00,87,NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(436,129,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,88,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(437,129,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,88,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(438,129,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,88,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(439,129,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,88,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(440,129,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,456.00,5472.00,88,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(441,130,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12860.00,154320.00,89,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(442,130,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,89,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(443,130,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,89,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(444,130,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,89,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(445,130,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,431.00,5172.00,89,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(446,135,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12515.00,150180.00,90,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(447,135,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,90,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(448,135,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,90,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(449,135,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,90,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(450,135,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,648.00,7776.00,90,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(451,136,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12515.00,150180.00,91,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(452,136,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,91,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(453,136,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,91,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(454,136,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,91,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(455,136,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,648.00,7776.00,91,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(456,140,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12645.00,151740.00,92,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(457,140,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,92,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(458,140,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,92,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(459,140,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,92,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(460,140,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,339.00,4068.00,92,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(461,141,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,93,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(462,141,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,93,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(463,141,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,93,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(464,141,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,93,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(465,141,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,432.00,5184.00,93,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(466,143,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12645.00,151740.00,94,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(467,143,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,94,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(468,143,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,94,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(469,143,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,94,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(470,143,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,480.00,5760.00,94,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(471,144,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12720.00,152640.00,95,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(472,144,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,95,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(473,144,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,95,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(474,144,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,95,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(475,144,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,95,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(476,145,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,96,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(477,145,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,96,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(478,145,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,96,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(479,145,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,96,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(480,145,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,480.00,5760.00,96,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(481,146,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,97,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(482,146,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,97,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(483,146,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,97,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(484,146,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,97,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(485,146,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,97,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(486,147,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,98,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(487,147,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,98,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(488,147,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,98,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(489,147,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,98,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(490,147,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,98,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(491,148,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,99,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(492,148,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,99,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(493,148,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,99,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(494,148,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,99,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(495,148,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,99,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(496,149,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,100,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(497,149,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,100,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(498,149,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,100,NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(499,149,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,100,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(500,149,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,100,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(501,150,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,101,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(502,150,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,101,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(503,150,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,101,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(504,150,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,101,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(505,150,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,101,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(506,151,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12645.00,151740.00,102,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(507,151,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,102,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(508,151,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,102,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(509,151,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,102,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(510,151,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,396.00,4752.00,102,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(511,152,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,103,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(512,152,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,103,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(513,152,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,103,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(514,152,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,103,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(515,152,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,103,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(516,153,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,104,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(517,153,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,104,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(518,153,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,104,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(519,153,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,104,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(520,153,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,104,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(521,154,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,105,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(522,154,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,105,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(523,154,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,105,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(524,154,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,105,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(525,154,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,105,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(526,155,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,106,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(527,155,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,106,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(528,155,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,106,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(529,155,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,106,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(530,155,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,438.00,5256.00,106,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(531,156,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,107,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(532,156,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,107,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(533,156,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,107,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(534,156,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,107,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(535,156,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,107,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(536,157,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,108,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(537,157,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,108,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(538,157,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,108,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(539,157,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,108,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(540,157,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,108,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(541,158,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,109,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(542,158,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,109,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(543,158,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,109,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(544,158,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,109,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(545,158,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,109,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(546,159,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,110,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(547,159,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,110,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(548,159,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,110,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(549,159,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,110,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(550,159,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,110,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(551,160,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,111,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(552,160,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,111,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(553,160,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,111,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(554,160,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,111,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(555,160,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,111,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(556,161,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,112,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(557,161,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,112,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(558,161,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,112,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(559,161,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,112,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(560,161,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,112,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(561,162,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,113,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(562,162,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,113,NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(563,162,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,113,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(564,162,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,113,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(565,162,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,113,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(566,163,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,114,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(567,163,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,114,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(568,163,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,114,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(569,163,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,114,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(570,163,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,114,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(571,164,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12580.00,150960.00,115,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(572,164,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,115,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(573,164,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,115,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(574,164,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,115,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(575,164,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,396.00,4752.00,115,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(576,165,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,116,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(577,165,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,116,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(578,165,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,116,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(579,165,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,116,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(580,165,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,116,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(581,166,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,117,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(582,166,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,117,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(583,166,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,117,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(584,166,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,117,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(585,166,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,117,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(586,167,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,118,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(587,167,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,118,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(588,167,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,118,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(589,167,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,118,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(590,167,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,118,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(591,168,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,119,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(592,168,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,119,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(593,168,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,119,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(594,168,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,119,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(595,168,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,119,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(596,169,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12650.00,151800.00,120,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(597,169,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,120,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(598,169,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,120,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(599,169,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,120,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(600,169,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,359.00,4308.00,120,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(601,170,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,121,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(602,170,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,121,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(603,170,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,121,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(604,170,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,121,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(605,170,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,432.00,5184.00,121,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(606,171,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,122,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(607,171,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,122,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(608,171,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,122,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(609,171,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,122,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(610,171,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,122,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(611,172,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,123,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(612,172,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,123,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(613,172,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,123,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(614,172,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,123,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(615,172,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,123,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(616,173,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,124,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(617,173,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,124,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(618,173,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,124,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(619,173,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,124,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(620,173,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,124,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(621,174,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,125,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(622,174,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,125,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(623,174,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,125,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(624,174,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,125,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(625,174,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,480.00,5760.00,125,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(626,175,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,126,NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(627,175,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,126,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(628,175,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,126,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(629,175,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,126,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(630,175,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,480.00,5760.00,126,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(631,176,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9255.00,111060.00,127,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(632,176,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,127,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(633,176,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,127,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(634,176,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,127,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(635,176,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1413.00,16956.00,127,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(636,177,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12645.00,151740.00,128,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(637,177,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,128,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(638,177,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,128,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(639,177,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,128,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(640,177,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,396.00,4752.00,128,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(641,178,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,129,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(642,178,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,129,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(643,178,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,129,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(644,178,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,129,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(645,178,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,129,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(646,179,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12645.00,151740.00,130,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(647,179,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,130,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(648,179,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,130,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(649,179,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,130,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(650,179,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,401.00,4812.00,130,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(651,180,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9095.00,109140.00,131,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(652,180,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4604.00,55248.00,131,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(653,180,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,600.00,131,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(654,180,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,131,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(655,180,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1409.00,16908.00,131,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(656,181,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,132,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(657,181,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,132,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(658,181,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,132,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(659,181,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,132,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(660,181,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,132,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(661,182,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,133,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(662,182,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,133,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(663,182,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,133,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(664,182,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,133,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(665,182,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,133,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(666,183,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,134,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(667,183,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,134,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(668,183,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,134,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(669,183,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,134,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(670,183,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,134,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(671,184,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12580.00,150960.00,135,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(672,184,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,135,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(673,184,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,135,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(674,184,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,135,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(675,184,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,448.00,5376.00,135,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(676,185,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,136,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(677,185,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,136,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(678,185,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,136,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(679,185,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,136,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(680,185,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,136,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(681,186,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,137,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(682,186,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,137,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(683,186,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,137,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(684,186,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,137,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(685,186,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,137,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(686,187,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,138,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(687,187,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,138,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(688,187,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,138,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(689,187,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,138,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(690,187,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,138,NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(691,188,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,139,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(692,188,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,139,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(693,188,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,139,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(694,188,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,139,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(695,188,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,139,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(696,189,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12710.00,152520.00,140,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(697,189,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,140,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(698,189,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,140,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(699,189,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,140,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(700,189,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380.00,4560.00,140,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(701,192,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,141,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(702,192,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,141,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(703,192,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,141,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(704,192,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,141,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(705,192,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2709.00,32508.00,141,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(706,193,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,142,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(707,193,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,142,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(708,193,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,142,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(709,193,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,142,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(710,193,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2769.00,33228.00,142,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(711,194,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,143,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(712,194,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,143,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(713,194,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,143,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(714,194,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,143,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(715,194,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2700.00,32400.00,143,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(716,196,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,144,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(717,196,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,144,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(718,196,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,144,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(719,196,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,144,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(720,196,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3201.00,38412.00,144,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(721,197,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,145,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(722,197,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,145,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(723,197,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,145,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(724,197,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,145,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(725,197,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3270.00,39240.00,145,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(726,198,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,146,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(727,198,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,146,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(728,198,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,146,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(729,198,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,146,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(730,198,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2177.00,26124.00,146,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(731,199,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,147,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(732,199,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,147,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(733,199,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,147,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(734,199,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,147,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(735,199,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3270.00,39240.00,147,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(736,200,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,148,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(737,200,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,148,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(738,200,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,148,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(739,200,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,148,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(740,200,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1607.00,19284.00,148,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(741,201,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,149,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(742,201,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,149,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(743,201,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,149,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(744,201,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,149,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(745,201,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3210.00,38520.00,149,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(746,202,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,150,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(747,202,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,150,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(748,202,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,150,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(749,202,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,150,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(750,202,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2700.00,32400.00,150,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(751,203,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12830.00,153960.00,151,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(752,203,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,151,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(753,203,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,151,NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(754,203,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,151,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(755,203,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2709.00,32508.00,151,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(756,204,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12360.00,148320.00,152,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(757,204,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,152,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(758,204,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,152,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(759,204,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,152,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(760,204,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,534.00,6408.00,152,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(761,205,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,153,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(762,205,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,153,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(763,205,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,153,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(764,205,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,153,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(765,205,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,153,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(766,208,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,154,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(767,208,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,154,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(768,208,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,154,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(769,208,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,154,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(770,208,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,456.00,5472.00,154,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(771,209,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,155,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(772,209,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,155,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(773,209,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,155,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(774,209,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,155,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(775,209,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,456.00,5472.00,155,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(776,211,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12790.00,153480.00,156,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(777,211,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,156,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(778,211,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,156,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(779,211,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,156,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(780,211,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,338.00,4056.00,156,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(781,222,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9465.00,113580.00,157,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(782,222,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,157,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(783,222,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,157,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(784,222,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,157,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(785,222,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3638.00,43656.00,157,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(786,225,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12300.00,147600.00,158,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(787,225,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,158,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(788,225,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,158,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(789,225,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,158,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(790,225,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,498.00,5976.00,158,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(791,233,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9465.00,113580.00,159,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(792,233,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,159,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(793,233,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,159,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(794,233,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,159,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(795,233,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4140.00,49680.00,159,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(796,238,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,160,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(797,238,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,160,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(798,238,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,160,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(799,238,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,160,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(800,238,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3838.00,46056.00,160,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(801,239,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,161,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(802,239,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,161,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(803,239,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,161,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(804,239,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,161,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(805,239,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1201.00,14412.00,161,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(806,240,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,162,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(807,240,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,162,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(808,240,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,162,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(809,240,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,162,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(810,240,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,413.00,4956.00,162,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(811,241,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,163,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(812,241,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,163,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(813,241,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,163,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(814,241,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,163,NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(815,241,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1819.00,21828.00,163,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(816,244,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,164,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(817,244,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,164,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(818,244,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,164,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(819,244,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,164,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(820,244,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1663.00,19956.00,164,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(821,245,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,165,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(822,245,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,165,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(823,245,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,165,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(824,245,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,165,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(825,245,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1785.00,21420.00,165,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(826,246,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,166,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(827,246,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,166,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(828,246,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,166,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(829,246,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,166,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(830,246,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1166.00,13992.00,166,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(831,247,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,167,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(832,247,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,167,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(833,247,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,167,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(834,247,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,167,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(835,247,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1233.00,14796.00,167,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(836,248,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,168,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(837,248,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,168,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(838,248,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,168,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(839,248,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,168,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(840,248,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1379.00,16548.00,168,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(841,249,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,169,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(842,249,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,169,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(843,249,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,169,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(844,249,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,169,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(845,249,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2694.00,32328.00,169,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(846,251,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9465.00,113580.00,170,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(847,251,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,170,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(848,251,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,170,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(849,251,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,170,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(850,251,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5066.00,60792.00,170,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(851,252,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,171,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(852,252,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,171,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(853,252,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,171,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(854,252,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,171,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(855,252,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3120.00,37440.00,171,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(856,253,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,172,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(857,253,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,172,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(858,253,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,172,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(859,253,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,172,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(860,253,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1594.00,19128.00,172,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(861,254,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9465.00,113580.00,173,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(862,254,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,173,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(863,254,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,173,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(864,254,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,173,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(865,254,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3057.00,36684.00,173,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(866,256,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,174,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(867,256,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,174,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(868,256,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,174,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(869,256,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,174,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(870,256,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1409.00,16908.00,174,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(871,257,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,175,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(872,257,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,175,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(873,257,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,175,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(874,257,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,175,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(875,257,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1328.00,15936.00,175,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(876,258,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,176,NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(877,258,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,176,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(878,258,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,176,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(879,258,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,176,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(880,258,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2228.00,26736.00,176,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(881,259,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,177,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(882,259,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,177,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(883,259,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,177,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(884,259,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,177,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(885,259,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1854.00,22248.00,177,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(886,261,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,178,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(887,261,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,178,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(888,261,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,178,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(889,261,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,178,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(890,261,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1467.00,17604.00,178,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(891,262,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,179,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(892,262,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,179,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(893,262,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,179,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(894,262,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,179,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(895,262,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1467.00,17604.00,179,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(896,263,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,180,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(897,263,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,180,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(898,263,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,180,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(899,263,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,180,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(900,263,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1854.00,22248.00,180,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(901,264,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,181,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(902,264,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,181,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(903,264,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,181,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(904,264,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,181,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(905,264,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1854.00,22248.00,181,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(906,265,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,182,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(907,265,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,182,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(908,265,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,182,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(909,265,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,182,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(910,265,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1547.00,18564.00,182,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(911,267,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7470.00,89640.00,183,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(912,267,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,183,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(913,267,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,183,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(914,267,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,183,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(915,267,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3277.00,39324.00,183,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(916,272,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,184,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(917,272,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,184,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(918,272,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,184,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(919,272,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,184,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(920,272,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1500.00,18000.00,184,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(921,273,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,185,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(922,273,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,185,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(923,273,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,185,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(924,273,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,185,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(925,273,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1056.00,12672.00,185,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(926,274,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,186,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(927,274,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,186,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(928,274,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,186,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(929,274,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,186,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(930,274,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3704.00,44448.00,186,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(931,277,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,187,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(932,277,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,187,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(933,277,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,187,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(934,277,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,187,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(935,277,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2773.00,33276.00,187,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(936,278,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,188,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(937,278,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,188,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(938,278,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,188,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(939,278,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,188,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(940,278,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2773.00,33276.00,188,NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(941,279,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,189,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(942,279,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,189,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(943,279,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,189,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(944,279,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,189,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(945,279,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1983.00,23796.00,189,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(946,280,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,190,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(947,280,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,190,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(948,280,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,190,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(949,280,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,190,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(950,280,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,983.00,11796.00,190,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(951,281,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,191,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(952,281,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,191,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(953,281,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,191,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(954,281,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,191,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(955,281,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1983.00,23796.00,191,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(956,282,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,192,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(957,282,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,192,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(958,282,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,192,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(959,282,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,192,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(960,282,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1948.00,23376.00,192,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(961,283,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,193,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(962,283,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,193,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(963,283,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,193,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(964,283,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,193,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(965,283,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1983.00,23796.00,193,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(966,285,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7470.00,89640.00,194,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(967,285,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,194,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(968,285,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,194,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(969,285,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,194,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(970,285,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2963.00,35556.00,194,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(971,288,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,195,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(972,288,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,195,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(973,288,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,195,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(974,288,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,195,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(975,288,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3382.00,40584.00,195,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(976,290,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11235.00,134820.00,196,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(977,290,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,196,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(978,290,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2600.00,31200.00,196,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(979,290,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,196,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(980,290,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4204.00,50448.00,196,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(981,293,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9360.00,112320.00,197,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(982,293,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,197,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(983,293,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,197,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(984,293,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,197,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(985,293,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1318.00,15816.00,197,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(986,294,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,198,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(987,294,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,198,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(988,294,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,198,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(989,294,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,198,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(990,294,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2713.00,32556.00,198,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(991,297,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7650.00,91800.00,199,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(992,297,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,199,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(993,297,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,199,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(994,297,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,199,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(995,297,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2183.00,26196.00,199,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(996,299,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,200,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(997,299,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,200,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(998,299,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,200,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(999,299,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,200,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(1000,299,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2780.00,33360.00,200,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(1001,301,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,201,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(1002,301,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,201,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(1003,301,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,201,NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(1004,301,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,201,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1005,301,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1225.00,14700.00,201,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1006,302,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,202,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1007,302,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,202,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1008,302,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,202,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1009,302,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,202,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1010,302,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1491.00,17892.00,202,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1011,304,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,203,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1012,304,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,203,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1013,304,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,203,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1014,304,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,203,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1015,304,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1983.00,23796.00,203,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1016,305,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,204,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1017,305,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,204,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1018,305,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,204,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1019,305,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,204,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1020,305,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2780.00,33360.00,204,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1021,306,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,205,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1022,306,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,205,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1023,306,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,205,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1024,306,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,205,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1025,306,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1708.00,20496.00,205,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1026,307,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,206,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1027,307,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,206,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1028,307,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,206,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1029,307,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,206,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1030,307,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2687.00,32244.00,206,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1031,308,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,207,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1032,308,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,207,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1033,308,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,207,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1034,308,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,207,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1035,308,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1225.00,14700.00,207,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1036,309,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6075.00,72900.00,208,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1037,309,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,208,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1038,309,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,208,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1039,309,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,208,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1040,309,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1190.00,14280.00,208,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1041,311,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,209,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1042,311,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,209,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1043,311,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,209,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1044,311,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,209,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1045,311,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3121.00,37452.00,209,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1046,312,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,210,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1047,312,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,210,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1048,312,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,210,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1049,312,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,210,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1050,312,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3414.00,40968.00,210,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1051,318,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6150.00,73800.00,211,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1052,318,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,211,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1053,318,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,211,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1054,318,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000.00,36000.00,211,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1055,318,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1660.00,19920.00,211,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1056,344,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000.00,24000.00,212,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1057,344,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1300.00,15600.00,212,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1058,344,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50.00,600.00,212,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1059,344,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,800.00,9600.00,212,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1060,344,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,660.00,7920.00,212,NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(1061,359,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15085.00,181020.00,213,NULL,'2018-11-19 10:17:01','2018-11-19 10:17:01'),(1062,359,1,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6000.00,72000.00,213,NULL,'2018-11-19 10:17:01','2018-11-19 10:17:01'),(1063,359,1,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1600.00,19200.00,213,NULL,'2018-11-19 10:17:01','2018-11-19 10:17:01'),(1064,359,1,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4000.00,48000.00,213,NULL,'2018-11-19 10:17:01','2018-11-19 10:17:01'),(1065,359,1,22,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2872.00,34464.00,213,NULL,'2018-11-19 10:17:01','2018-11-19 10:17:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_templates`
--

LOCK TABLES `employee_templates` WRITE;
/*!40000 ALTER TABLE `employee_templates` DISABLE KEYS */;
INSERT INTO `employee_templates` VALUES (1,1,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(2,2,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(3,3,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(4,4,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(5,6,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(6,8,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(7,9,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(8,10,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:44','2018-11-19 10:16:44'),(9,11,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(10,12,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(11,14,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(12,15,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(13,16,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(14,17,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(15,18,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(16,19,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(17,21,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(18,22,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(19,25,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(20,27,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(21,28,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:45','2018-11-19 10:16:45'),(22,29,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(23,32,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(24,33,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(25,34,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(26,35,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(27,36,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(28,37,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(29,38,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(30,39,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(31,40,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(32,41,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(33,42,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(34,44,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(35,45,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:46','2018-11-19 10:16:46'),(36,48,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(37,50,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(38,56,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(39,66,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(40,67,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(41,68,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(42,72,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(43,73,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(44,74,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(45,75,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(46,78,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(47,79,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(48,80,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:47','2018-11-19 10:16:47'),(49,81,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(50,82,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(51,83,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(52,84,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(53,85,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(54,86,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(55,87,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(56,88,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(57,89,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(58,90,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(59,91,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(60,92,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(61,93,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(62,95,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:48','2018-11-19 10:16:48'),(63,96,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(64,98,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(65,99,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(66,100,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(67,102,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(68,104,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(69,105,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(70,108,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(71,109,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(72,110,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(73,111,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(74,113,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:49','2018-11-19 10:16:49'),(75,114,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(76,115,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(77,116,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(78,117,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(79,118,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(80,119,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(81,120,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(82,121,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(83,122,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(84,123,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(85,124,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(86,125,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(87,128,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:50','2018-11-19 10:16:50'),(88,129,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(89,130,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(90,135,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(91,136,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(92,140,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(93,141,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(94,143,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(95,144,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(96,145,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(97,146,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(98,147,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(99,148,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(100,149,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:51','2018-11-19 10:16:51'),(101,150,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(102,151,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(103,152,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(104,153,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(105,154,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(106,155,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(107,156,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(108,157,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(109,158,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(110,159,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(111,160,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(112,161,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(113,162,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:52','2018-11-19 10:16:52'),(114,163,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(115,164,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(116,165,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(117,166,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(118,167,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(119,168,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(120,169,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(121,170,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(122,171,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(123,172,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(124,173,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(125,174,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(126,175,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:53','2018-11-19 10:16:53'),(127,176,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(128,177,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(129,178,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(130,179,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(131,180,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(132,181,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(133,182,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(134,183,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(135,184,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(136,185,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(137,186,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(138,187,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:54','2018-11-19 10:16:54'),(139,188,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(140,189,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(141,192,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(142,193,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(143,194,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(144,196,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(145,197,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(146,198,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(147,199,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(148,200,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(149,201,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(150,202,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(151,203,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:55','2018-11-19 10:16:55'),(152,204,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(153,205,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(154,208,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(155,209,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(156,211,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(157,222,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(158,225,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(159,233,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(160,238,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(161,239,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(162,240,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(163,241,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:56','2018-11-19 10:16:56'),(164,244,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(165,245,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(166,246,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(167,247,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(168,248,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(169,249,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(170,251,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(171,252,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(172,253,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(173,254,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(174,256,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(175,257,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(176,258,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:57','2018-11-19 10:16:57'),(177,259,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(178,261,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(179,262,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(180,263,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(181,264,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(182,265,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(183,267,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(184,272,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(185,273,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(186,274,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(187,277,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(188,278,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:58','2018-11-19 10:16:58'),(189,279,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(190,280,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(191,281,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(192,282,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(193,283,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(194,285,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(195,288,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(196,290,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(197,293,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(198,294,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(199,297,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(200,299,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(201,301,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:16:59','2018-11-19 10:16:59'),(202,302,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(203,304,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(204,305,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(205,306,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(206,307,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(207,308,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(208,309,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(209,311,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(210,312,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(211,318,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(212,344,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00'),(213,359,1,NULL,1,'2018-01-09',NULL,'2018-11-19 10:17:00','2018-11-19 10:17:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'2207','EMP0000001',NULL,'MR','SHIVAJI','LAXMAN','PARTE','1960-05-28','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','396510178038','AAQPP9426P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(2,'2319','EMP0000002',NULL,'MR','CHANDKANT','BHIMARAO','PATIL','1959-06-01','Male','0','0','0','CHANDKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','227001286319','AAQPP9489A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(3,'2346','EMP0000003',NULL,'MR','DADU','VISHWNATH','JAGTAP','1960-06-01','Male','0','0','0','DADU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','285605969749','AANPJ8539L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(4,'2397','EMP0000004',NULL,'MR','MOHAN','KRUSHNA','BHOSALE','1959-05-05','Male','0','0','0','MOHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','705257474849','AAPPB2892J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(5,'2410','EMP0000005',NULL,'MR','SARANG','CHANDRAKANT','NAIK','1960-10-28','Male','0','0','0','scnaik@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','457737349188','AAHPN0646G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(6,'2461','EMP0000006',NULL,'MR','ROHIDAS','MAHADEV','KUNJIR','1961-06-01','Male','0','0','0','ROHIDAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','692068941760','AAZPK8327R',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',212,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(7,'2525','EMP0000007',NULL,'MR','ASHOK','DODHA','THAKARE','1961-06-01','Male','9326318997','0','0','adthakare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','505966808186','AAGPT3125P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',26,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 06:50:46',NULL,NULL,NULL,NULL,NULL),(8,'2526','EMP0000008',NULL,'MR','SHARADKUMAR','NARAYAN','JADHAV','1963-03-20','Male','0','0','0','SHARADKUMAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','433339852158','AANPJ8567A',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(9,'2527','EMP0000009',NULL,'MR','SHINDE','SHANKAR','BABURAO','1962-01-01','Male','0','0','0','SHINDE@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','260650866796','ABXPS0380F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(10,'2528','EMP0000010',NULL,'MR','PURUSHOTTAM','VINAYK','SONAVANE PATIL','1959-05-05','Male','0','0','0','PURUSHOTTAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','372519243614','AAQPP9485N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(11,'2529','EMP0000011',NULL,'MR','DILIP','BHAGAWAN','AWADE','1960-09-29','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','230456951420','AAMPA8613M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(12,'2530','EMP0000012',NULL,'MR','SUNIL','ANANDRAO','LOKHANDE','1960-11-03','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','977752293951','AAEPL3301M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(13,'2538','EMP0000013',NULL,'MR','PRAFULLKUMAR','JAIKUMAR','PATIL','1960-06-01','Male','9325378741','0','0','pjpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','346207355153','AAQPP9481J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:40',NULL,NULL,NULL,NULL,NULL),(14,'2662','EMP0000014',NULL,'MR','PRAVIN','JAYSING','GANGAWANE','1962-02-10','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','658437291383','AASPG3871B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(15,'2690','EMP0000015',NULL,'MR','CHANDRASHEKHAR','BABURAO','KHYADE','1960-06-08','Male','0','0','0','CHANDRASHEKHAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','709245080459','ABXPK1381J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(16,'2782','EMP0000016',NULL,'MR','JAIRAJ','DEVRAJ','PILLAY','1964-04-09','Male','0','0','0','JAIRAJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','439634172424','AGMPP0267A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(17,'2789','EMP0000017',NULL,'MR','SHRIKRISHNA','BHAGWAN','KULKARNI','1960-07-17','Male','0','0','0','SHRIKRISHNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','990693928014','AAZPK6660K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',52,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(18,'2791','EMP0000018',NULL,'MR','VASANT','EKNATH','RAKSHE','1962-06-01','Male','0','0','0','VASANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','536021183752','ACDPR8368K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(19,'2798','EMP0000019',NULL,'MR','SUNIL','MAHADEO','GHORPADE','1963-02-14','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','971179490297','AASPG2927Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:09','2018-11-19 09:37:40',NULL,NULL,NULL,NULL,NULL),(20,'2867','EMP0000020',NULL,'MR','SITARAM','TUKARAM','KARDILE','1966-07-06','Male','0','0','0','stkardile@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','665922693220','AAZPK6665N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(21,'2934','EMP0000021',NULL,'MR','ASLAM','AKBAR','KAZI','1962-07-25','Male','0','0','0','ASLAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','397399807813','AAZPK6663L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',65,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(22,'2946','EMP0000022',NULL,'MR','GAJANAN','PRABHAKAR','NIPHADKAR','1966-01-14','Male','0','0','0','GAJANAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','250417869369','AAHPN0225H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',51,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(23,'2955','EMP0000023',NULL,'MR','AJIT','HIRALAL','PANDHARE','1968-06-27','Male','0','0','0','ahpandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','308566816603','AAQPP9484P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(24,'2971','EMP0000024',NULL,'MR','PRASANNA','PRABHAKAR','JOSHI','1962-10-25','Male','9371105523','0','0','ppjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','376122506432','AANPJ8566B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(25,'2994','EMP0000025',NULL,'MR','DAYANAND','VISHNU','JADHAV','1971-01-01','Male','0','0','0','DAYANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','664151827757','AAYPJ2517P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(26,'3002','EMP0000026',NULL,'MR','VISHWAJIT','RAJKUMAR','KOTHARI','1964-08-07','Male','8411094712','0','0','vrkothari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','436354396986','AAZPK6670R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(27,'3027','EMP0000027',NULL,'MR','SUNIL','DNYANDEO','BHARAMBE','1967-04-16','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','644114327730','AAPPB2908K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(28,'3062','EMP0000028',NULL,'MR','SACHIN','DINKAR','VICHARE','1967-07-16','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','512509400696','AAIPV1925F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(29,'3068','EMP0000029',NULL,'MR','BALAJI','RANGRAO','BHOSALE','1971-03-05','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','552872469223','AAPPB2907G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(30,'3073','EMP0000030',NULL,'MR','DATTATRAY','LAXMAN','MANDHARE','1971-04-23','Male','9371644581','0','0','dlmandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','391106012453','AVSPM2368N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',103,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(31,'3097','EMP0000031',NULL,'MR','VIJAY','SAMPTRAO','DHANE','1966-11-06','Male','9325332300','0','0','vsdhane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','924753558809','AAMPD6691A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(32,'3109','EMP0000032',NULL,'MR','VASUDEV','MAROTI','HIWARKAR','1964-08-07','Male','0','0','0','VASUDEV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','966677123812','AACPH3456R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(33,'3110','EMP0000033',NULL,'MR','SANJAY','SADU','KANDHARE','1964-08-12','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','898324940822','AAZPK8286D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(34,'3127','EMP0000034',NULL,'MR','SUNIL','MAHADEV','DIXIT','1968-10-31','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','278851647108','AAXPD8204G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(35,'3129','EMP0000035',NULL,'MR','BALASAHEB','SHANKARRAO','BANKAR','1965-07-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','249454988043','AAPPB1839B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(36,'3133','EMP0000036',NULL,'MR','RAMESH','SHANKAR','JAGTAP','1967-07-02','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','424250394673','AANPJ7738F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(37,'3140','EMP0000037',NULL,'MR','MALHARI','SHIVAJI','MALAVE','1967-06-16','Male','0','0','0','MALHARI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','497717765494','AAUPM1614Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(38,'3150','EMP0000038',NULL,'MR','NIRANJAN','BABURAO','DESHMUKH','1966-12-30','Male','0','0','0','NIRANJAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','249036328720','AAMPD5893L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(39,'3152','EMP0000039',NULL,'MR','VASANT','MURLIDHAR','KHAIRE','1966-07-07','Male','0','0','0','VASANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','925255453507','AAZPK6681N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(40,'3170','EMP0000040',NULL,'MR','SHAILESH','BALKRISHNA','KULKARNI','1968-12-13','Male','0','0','0','SHAILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','790782956373','AAZPK6682R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(41,'3171','EMP0000041',NULL,'MR','RAVINDRA','KASHIRAM','ADHAV','1968-08-01','Male','0','0','0','RAVINDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','642667959387','AAMPA7873M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(42,'3173','EMP0000042',NULL,'MR','ANANT','NARAYAN','PASTAY','1959-09-29','Male','0','0','0','ANANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','579336080937','AAQPP8020P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',270,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(43,'3265','EMP0000043',NULL,'MR','SUHAS','DATTATRAY','JOSHI','1965-01-04','Male','8411091634','0','0','sdjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','819028836899','AANPJ8548F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(44,'3288','EMP0000044',NULL,'MR','MOHAN','DNYANADEV','SAPKAL','1971-04-27','Male','0','0','0','MOHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','569175038002','ATIPS0639N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(45,'3289','EMP0000045',NULL,'MR','MAHADEO','LAXMAN','KHEDEKAR','1970-07-07','Male','0','0','0','MAHADEO@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','239203427465','AAZPK8293J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(46,'3524','EMP0000046',NULL,'MR','JAYRAM','BAJIRAO','MANDHARE','1974-02-17','Male','0','0','0','jbmandhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','504579884986','AIGPM1016J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(47,'3638','EMP0000047',NULL,'MR','MAHESH','RAMESH','DEO','1967-04-20','Male','9325378773','0','0','mrdeo@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','928066419781','AAMPD6695E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(48,'3812','EMP0000048',NULL,'MR','PRABHAKAR','KISAN','SAWANT','1962-06-01','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','325075328925','BEUPS7343H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',357,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:43:20',NULL,NULL,NULL,NULL,NULL),(49,'3826','EMP0000049',NULL,'MR','RAVINDRA','SUBHASH','MAHAJAN','1971-12-04','Male','0','0','0','rsmahajan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','730866190740','AGUPM0901G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',69,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(50,'3855','EMP0000050',NULL,'MR','JAYWANT','ARJUN','UTTEKAR','1963-05-04','Male','9325378765','0','0','JAYWANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','696192777322','AARPU4518N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(51,'3878','EMP0000051',NULL,'MR','JYOTIRAM','BHANUDAS','JADHAV','1982-02-14','Male','0','0','0','jbjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','626755422115','AFUPJ4823R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',13,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 06:50:44',NULL,NULL,NULL,NULL,NULL),(52,'3944','EMP0000052',NULL,'MR','ARVIND','BABURAO','SALOKHE','1965-08-15','Male','0','0','0','absalokhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','656639697529','ACJPS3990A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(53,'3945','EMP0000053',NULL,'MR','PRANESH','ARVIND','MUDDAPUR','1964-04-26','Male','8411092312','0','0','pamuddapur@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','436966754346','ABPPM3361G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-17 08:05:10',NULL,NULL,NULL,NULL,NULL),(54,'3948','EMP0000054',NULL,'MR','SADANAND','DATTATRAY','DIGHE','1964-03-06','Male','9325378767','0','0','sddighe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','563041832986','AECPD4150N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(55,'3952','EMP0000055',NULL,'MR','RAJENDRA','TUKARAM','DHURI','1962-07-17','Male','9325635278','0','0','rtdhuri@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','201423044549','AIDPD5515C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(56,'4033','EMP0000056',NULL,'MR','RAJENDRA','DINKAR','PHALKE','1971-01-30','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','589345016193','ANQPP5635D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',357,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:43:20',NULL,NULL,NULL,NULL,NULL),(57,'4153','EMP0000057',NULL,'MR','CHANDRAKANT','RANBA','KAMBLE','1963-01-20','Male','0','0','0','crkamble@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','632021316868','BBCPK7034E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(58,'4169','EMP0000058',NULL,'MR','KUMBHAR','SHANTARAM','SHANKAR','1968-02-15','Male','9326024916','0','0','sskumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','831088734141','AIDPK2314C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:10','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(59,'4191','EMP0000059',NULL,'MR','BAPUSAHEB','BHUJANGRAO','GHORPADE','1975-05-10','Male','9371161241','0','0','bbghorpade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','347944149362','AOGPG4608A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(60,'4202','EMP0000060',NULL,'MR','SUJEET','BIRUJI','MURADE','1975-06-14','Male','9370906497','0','0','sbmurade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','704474079444','AOZPM2133H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(61,'4204','EMP0000061',NULL,'MR','SANTOSH','RAMCHANDRA','KAMBALE','1976-06-01','Male','0','0','0','srkamble@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','806337185751','AXAPK2359M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(62,'4211','EMP0000062',NULL,'MR','SUDAM','BANSILAL','NAVGIRE','1969-01-10','Male','0','0','0','sbnavgire@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','657454284578','ABWPN2560M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(63,'4235','EMP0000063',NULL,'MR','YASHWANT','RAOSAHEB','INGALE','1971-01-05','Male','9325378780','0','0','yringale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','201453424478','AABPI1780L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(64,'4247','EMP0000064',NULL,'MR','VITTHAL','MARUTI','KANTE','1961-01-27','Male','9325635674','0','0','vmkante@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','797537452261','ABKPK3667J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(65,'4248','EMP0000065',NULL,'MR','AMIT','PRASAD','SHINDE','1978-01-22','Male','0','0','0','apshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','501376256702','BGRPS8445M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(66,'4299','EMP0000066',NULL,'MR','KEDAR','GURUNATH','GAVANKAR','1981-11-23','Male','0','0','0','KEDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','414798012426','ALEPG8101F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(67,'4300','EMP0000067',NULL,'MR','RAJU','NARAYAN','BHUJBAL','1969-06-01','Male','9326024825','0','0','RAJU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','243492705510','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(68,'4301','EMP0000068',NULL,'MR','PRAMOD','DILIP','GADHAVE','1981-10-30','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','522050022929','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(69,'4371','EMP0000069',NULL,'MR','ATUL','BALASO','MANE','1984-06-01','Male','8411093268','0','0','abmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','543264759720','ATXPM6063D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',69,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(70,'4382','EMP0000070',NULL,'MR','DATTATRAY','BABURAO','CHIKANE','1965-06-03','Male','0','0','0','dbchikane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','744967600464','AAMPC3961E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(71,'4399','EMP0000071',NULL,'MR','RAJU','CHIMANRAO','RAUT','1971-05-30','Male','9371105516','0','0','rcraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','262657986987','AJJPR8303B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(72,'4524','EMP0000072',NULL,'MR','SUBHASH','BALVANT','PATIL','1984-05-25','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','669104682067','AOYPP6517M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(73,'4525','EMP0000073',NULL,'MR','SANJAY','SIDRAM','PATIL','1981-06-01','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','298193288611','AOZPP4911Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(74,'4526','EMP0000074',NULL,'MR','SACHIN','DATTU','SHINDE','1981-09-20','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','303812823694','CEMPS9264N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(75,'4527','EMP0000075',NULL,'MR','CHANDRAKANT','MAHADEV','MALI','1982-10-15','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','422103180960','AQEPM8869K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:02',NULL,NULL,NULL,NULL,NULL),(76,'4556','EMP0000076',NULL,'MR','JOSHI','UPENDRA','RAMCHANDRA','1976-06-24','Male','9372342130','0','0','urjoshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','391781460816','AKDPJ3511G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(77,'4636','EMP0000077',NULL,'MR','PRAKASH','SITARAM','ADAVADE','1978-06-01','Male','0','0','0','psadavade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','313716166292','ADGPA9349B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(78,'4678','EMP0000078',NULL,'MR','VISHNUPRASAD','SUDAMAPRASAD','MISHRA','1960-06-15','Male','0','0','0','VISHNUPRASAD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','254683440591','AJBPM9442L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(79,'4711','EMP0000079',NULL,'MR','SIDHANATH','LALASAHEB','DESHMUKH','1975-10-01','Male','0','0','0','SIDHANATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','757618725746','AOCPD9791H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(80,'4712','EMP0000080',NULL,'MR','SHIVAJI','NIVRUTTI','KSHIRSAGAR','1983-01-02','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','976168647885','AWQPK3744B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(81,'4720','EMP0000081',NULL,'MR','DINKAR','SHIVAJI','HOLMUKHE','1976-02-29','Male','0','0','0','DINKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','816140851847','ADAPH7867F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(82,'4721','EMP0000082',NULL,'MR','SACHIN','KISHNAJI','MALME','1978-05-31','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','383927173783','APBPM5932P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(83,'4750','EMP0000083',NULL,'MR','NILESH','MANOHAR','KUMBHAVDEKAR','1975-03-24','Male','0','0','0','NILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','321959995387','BAQPK2078H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(84,'4756','EMP0000084',NULL,'MR','MAHESH','NARAYAN','SHINDE','1979-05-13','Male','0','0','0','MAHESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','910574823649','BNXPS8054B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(85,'4859','EMP0000085',NULL,'MR','BIRMAL','BHIVA','KHANDEKAR','1982-06-01','Male','0','0','0','BIRMAL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','361474417728','AUNPK0423G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(86,'4863','EMP0000086',NULL,'MR','BALAJI','RAMRAO','GAWARE','1976-06-04','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','401430558890','ASXPG6910C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(87,'4882','EMP0000087',NULL,'MR','RAVINDRA','MADHUKAR','KAMBLE','1976-06-06','Male','0','0','0','RAVINDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','634073155964','AXPPK0295D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(88,'4883','EMP0000088',NULL,'MR','DINESH','RANGRAO','DESALE','1980-06-01','Male','0','0','0','DINESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','847642735690','ALKPD4281F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',106,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(89,'4885','EMP0000089',NULL,'MR','DEVANAND','LAXMAN','NEMADE','1977-01-05','Male','0','0','0','DEVANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','517124744658','AHLPN3487A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(90,'4886','EMP0000090',NULL,'MR','LICHADE','HEMANTKUMAR','DINDAYAL','1980-06-20','Male','0','0','0','LICHADE@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','676287481423','AEBPL6268G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(91,'4896','EMP0000091',NULL,'MR','KRUSHNAT','SOPAN','DADAS','1980-06-01','Male','0','0','0','KRUSHNAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','690793455367','ANCPD0052E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(92,'4907','EMP0000092',NULL,'MR','RAJIV','PRABHAKAR','SHRISATH','1973-01-26','Male','0','0','0','RAJIV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','666074208763','BIMPS5590N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(93,'4935','EMP0000093',NULL,'MR','RAMESH','ASHOK','SAWANT','1985-09-16','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','276088913355','BNPPS1245G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(94,'4937','EMP0000094',NULL,'MR','GANESH','RAMDAS','NEHARKAR','1978-12-04','Male','0','0','0','grneharkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','846807525104','AFZPN4317F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:11','2018-11-17 08:05:11',NULL,NULL,NULL,NULL,NULL),(95,'4939','EMP0000095',NULL,'MR','ABDUL WARIS','ABDUL ','HAFIS','1977-07-02','Male','0','0','0','ABDUL WARIS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','659898372246','AMLPA4355K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(96,'4940','EMP0000096',NULL,'MR','RAJENDRA','DAGDU','SALUNKHE','1980-06-02','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','204975693444','BWGPS2416H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(97,'4945','EMP0000097',NULL,'MR','NANASAHEB','BHIKAJI','WAGHMARE','1963-06-01','Male','0','0','0','nbwaghmare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','648425610485','AAQPW9129G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(98,'4946','EMP0000098',NULL,'MR','SWAPNIL','BABASAHEB','DESHMUKH','1982-06-12','Male','0','0','0','SWAPNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','278499402952','AKYPD0067E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(99,'4947','EMP0000099',NULL,'MR','AMOL','SUDAM','KONDE','1980-06-03','Male','0','0','0','AMOL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','751637228417','AWTPK2990C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(100,'4948','EMP0000100',NULL,'MR','SHAYMSUNDAR','PANDURANG','SALUNKHE','1977-12-21','Male','0','0','0','SHAYMSUNDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','605437332052','BOYPS5762Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(101,'4950','EMP0000101',NULL,'MR','SAIBANNA','BABURAO','REDDY','1977-04-02','Male','9325635248','0','0','sbreddy@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','583858170198','ASIPB2271L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(102,'4961','EMP0000102',NULL,'MR','RAJESH','MULCHAND','PAWAR','1984-03-22','Male','0','0','0','RAJESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','965242648119','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(103,'4989','EMP0000103',NULL,'MR','KISHOR','BAPURAO','CHAVAN','1983-06-14','Male','0','0','0','kbchavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','641395674870','ALFPC1238C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(104,'5021','EMP0000104',NULL,'MR','SWAPNAJIT','DATTATRAY','BHOSALE','1985-04-11','Male','0','0','0','SWAPNAJIT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','335103674939','ARGPB0222L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(105,'5041','EMP0000105',NULL,'MR','ANIL','LAHUDAS','KUMBHAR','1981-06-30','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','694301840778','BFHPK5905F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(106,'5071','EMP0000106',NULL,'MR','VIJAY','EKNATH','MONE','1962-10-09','Male','9371086750','0','0','vemone@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','519313199257','ABAPM6720E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(107,'5082','EMP0000107',NULL,'MR','KISHOR','RAMKRISHNA','POTNIS','1965-05-12','Male','9371637263','0','0','krpotnis@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','855936491415','AUMPP9095N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(108,'5107','EMP0000108',NULL,'MR','MADAN','SHANKARRAO','PHALKE','1978-04-30','Male','0','0','0','MADAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','834447948442','AUQPP2118L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(109,'5108','EMP0000109',NULL,'MR','BHARAT','VILAS','JADHAV','1985-07-28','Male','0','0','0','BHARAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','900747639796','AIJPJ1132D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(110,'5109','EMP0000110',NULL,'MR','TANAJI','SONABA','KENGAR','1982-06-07','Male','0','0','0','TANAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','605655477584','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(111,'5110','EMP0000111',NULL,'MR','RAJENDRA','GANPAT','SATAV','1981-03-10','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','681993831718','CBLPS7639K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(112,'5120','EMP0000112',NULL,'MR','MAHESH','DAGADU','KUMBHAR','1983-11-01','Male','0','0','0','mdkumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','232245488303','AUMPK6831H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',26,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 06:50:46',NULL,NULL,NULL,NULL,NULL),(113,'5130','EMP0000113',NULL,'MR','DIPAK','MUKUNDA','SHINDE','1981-06-24','Male','0','0','0','DIPAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','541982609922','BHWPS7514K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',106,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(114,'5131','EMP0000114',NULL,'MR','SANDIP','KHASHABA','DESAI','1984-01-15','Male','0','0','0','SANDIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','802643713293','AOGPD2551K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(115,'5132','EMP0000115',NULL,'MR','CHANDRAKANT','ATMARAM','JADHAV','1983-06-19','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','260102430543','AGIPJ5019L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(116,'5140','EMP0000116',NULL,'MR','VIRSINH','SAMBHAJIRAO','MANE','1978-06-21','Male','0','0','0','VIRSINH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','678270599269','AXEPM9178N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(117,'5141','EMP0000117',NULL,'MR','GANESH','KALIDAS','PATIL','1982-09-10','Male','0','0','0','GANESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','521741675384','ASQPP7944Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(118,'5142','EMP0000118',NULL,'MR','BABASAHEB','BHIMRAO','SHINDE','1976-06-01','Male','0','0','0','BABASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','912435000649','BRDPS6944Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(119,'5143','EMP0000119',NULL,'MR','SUBHASH','SADHU','MOHITE','1982-11-13','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','677961417790','ATLPM2195C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(120,'5156','EMP0000120',NULL,'MR','BALU','MADHUKAR','DHAVALE','1979-09-10','Male','0','0','0','BALU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','431208515643','AODPD2943Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(121,'5157','EMP0000121',NULL,'MR','PRASHANT','SUBHASH','SHIRKE','1984-10-01','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','526847992654','BQPPS2214G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:03',NULL,NULL,NULL,NULL,NULL),(122,'5189','EMP0000122',NULL,'MR','AKHILESH','SHRIKRISHNA','BAGADE','1978-07-25','Male','0','0','0','AKHILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','560737063674','AOUPB7803G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(123,'5194','EMP0000123',NULL,'MR','SUNIL','BABRUWAN','PAWAR','1978-06-01','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','936381622918','AWNPP4045P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(124,'5205','EMP0000124',NULL,'MR','ASHOK','PANDURANG','AWARE','1981-06-09','Male','0','0','0','ASHOK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','717464213174','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(125,'5248','EMP0000125',NULL,'MR','ANAND','SHIDDANNA','KITTAD','1980-06-01','Male','0','0','0','ANAND@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','682419870288','BAOPK1793D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(126,'5270','EMP0000126',NULL,'MR','KIRAN','MHASKU','KAMTHE','1981-01-22','Male','0','0','0','kmkamthe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','786651512579','AVCPK8359D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(127,'5339','EMP0000127',NULL,'MR','SHANTARAM','KASHINATH','MAHAJAN','1961-06-03','Male','9326653843','0','0','skmahajan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','736452363266','AATPM8084F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(128,'5380','EMP0000128',NULL,'MR','SANJAY','SHIVAJI','LOHAR','1977-10-07','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','790601753175','ADFPL1929D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(129,'5382','EMP0000129',NULL,'MR','KISHOR','KISANRAO','KHAJONE','1973-10-12','Male','0','0','0','KISHOR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','279228113462','BCIPK7653L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(130,'5434','EMP0000130',NULL,'MR','BHIVA','NAMDEV','WAGHMODE','1963-06-01','Male','0','0','0','BHIVA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','678524820220','ABEPW6209L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(131,'5462','EMP0000131',NULL,'MR','SHRIRAM','BHALCHANDRA','MEHENDALE','1959-07-24','Male','9325378755','0','0','sbmehendale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','844258638026','AAYPM4888L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:12','2018-11-17 08:05:12',NULL,NULL,NULL,NULL,NULL),(132,'5590','EMP0000132',NULL,'MR','SANJAY','SHARAD','CHAVAN','1970-05-27','Male','9325378762','0','0','sschavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','815775871629','AOJPC0353D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(133,'5591','EMP0000133',NULL,'MR','ASHOKKUMAR','SANTANSINGH','MARAVI','1966-05-29','Male','9325378763','0','0','akmaravi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','601061026613','AYHPM6509K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(134,'5598','EMP0000134',NULL,'MR','VIKRAM','DNYANDEO','NARULE','1979-04-17','Male','9326090425','0','0','vdnarule@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','981855391400','AEOPN1414M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(135,'5624','EMP0000135',NULL,'MR','RAMDAS','BALIRAM','JAGTAP','1970-06-01','Male','0','0','0','RAMDAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','639995699223','AJTPJ8178N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',289,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(136,'5625','EMP0000136',NULL,'MR','SURESH','GAJENDRA','MANE','1971-05-07','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','452559491794','AUNPM8689E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',289,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(137,'5635','EMP0000137',NULL,'MR','BHAMRE','PRAKASH','NARHAR','1963-06-30','Male','8411045757','0','0','pnbhamare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','798383183280','AHIPB7394R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(138,'5652','EMP0000138',NULL,'MR','SUNITKUMAR','SUNILKUMAR','DASGUPTA','1962-05-19','Male','9373066247','0','0','ssdasgupta@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','296384923534','AFHPD3124N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(139,'5656','EMP0000139',NULL,'MR','KONDAJI','APPAJI','DUKREPATIL','1968-06-01','Male','9371868953','0','0','kadukarepatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','715653856960','AALPD4056E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(140,'5681','EMP0000140',NULL,'MR','REGHU','P','G','1966-05-10','Male','9381781792','0','0','REGHU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','887295962482','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(141,'5684','EMP0000141',NULL,'MR','PRAKASH','MAHARU','RATHOD','1975-02-20','Male','0','0','0','PRAKASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','598818711549','AOKPR9725F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',270,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(142,'5726','EMP0000142',NULL,'MR','AYAN',NULL,'CHATTOPADHYAY','1970-01-01','Male','9332101342','0','0','anchattopadhyay@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','317615538342','ALAPC1330Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',26,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 06:50:46',NULL,NULL,NULL,NULL,NULL),(143,'5734','EMP0000143',NULL,'MR','SANTOSH','SHRIRANG','JAGDALE','1973-06-28','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','247998666800','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',357,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:43:21',NULL,NULL,NULL,NULL,NULL),(144,'5937','EMP0000144',NULL,'MR','PARWEJ','NOORMAHAMAD','KILLEDAR','1985-07-30','Male','0','0','0','PARWEJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','397967444266','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(145,'5938','EMP0000145',NULL,'MR','PRAVIN','GORAKSHANATH','HAGAVANE','1984-01-08','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','997503336168','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(146,'5939','EMP0000146',NULL,'MR','SOMNATH','RANGNATH','MALEKAR','1980-05-09','Male','0','0','0','SOMNATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','585976352076','AMDPM9987D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(147,'5940','EMP0000147',NULL,'MR','JYOTIRAM','BALBHIM','JADHAV','1978-06-01','Male','0','0','0','JYOTIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','479322045765','AJXPJ4871C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(148,'5941','EMP0000148',NULL,'MR','IMRAN','KHUDBUDDIN','SHAIKH','1984-07-14','Male','0','0','0','IMRAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','712989535383','BWKPS8732E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(149,'5942','EMP0000149',NULL,'MR','TEJABSINGH','AJABSINGH','PATIL','1984-09-01','Male','0','0','0','TEJABSINGH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','495936305567','ARDPP5302L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(150,'5943','EMP0000150',NULL,'MR','DADA','BARKU','SONWAL','1980-02-03','Male','0','0','0','DADA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','267543481113','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(151,'5944','EMP0000151',NULL,'MR','SURAJ','ASHOK','PHALKE','1986-01-26','Male','0','0','0','SURAJ@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','662655890449','ATIPP4855D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(152,'5945','EMP0000152',NULL,'MR','JAKIRULLA','HANIF','KHAN','1977-04-02','Male','8411094477','0','0','JAKIRULLA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','988623869852','BMCPK6579B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',63,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(153,'5948','EMP0000153',NULL,'MR','VILAS','MADHAV','DAITHANKAR','1971-06-01','Male','0','0','0','VILAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','815321421482','AUMPD8881E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(154,'5949','EMP0000154',NULL,'MR','SUNIL','VASANT','DERE','1978-12-02','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','636100877333','AMPPD6647K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(155,'5950','EMP0000155',NULL,'MR','PRADIP','SARJERAO','SHINDE','1983-09-23','Male','0','0','0','PRADIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','202294840458','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(156,'5951','EMP0000156',NULL,'MR','AVINASH','KRUSHNA','CHAUDHARI','1973-11-03','Male','0','0','0','AVINASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','306685434659','AQPPC5966J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(157,'5952','EMP0000157',NULL,'MR','AMOL','BANDU','SALUNKHE','1984-07-12','Male','0','0','0','AMOL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','539344821890','BQYPS2012R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(158,'5954','EMP0000158',NULL,'MR','VISHWANATH','BABURAO','AIRSHINGE','1982-08-01','Male','0','0','0','VISHWANATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','609075707260','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(159,'5955','EMP0000159',NULL,'MR','PRAMOD','MANSING','PATIL','1973-08-29','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','314450047832','AWNPP4011D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(160,'5956','EMP0000160',NULL,'MR','DHANAJI','RAOSAHEB','PALKAR','1982-04-09','Male','0','0','0','DHANAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','499367787118','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(161,'5957','EMP0000161',NULL,'MR','ANIL','SHANKAR','PATEKAR','1984-04-07','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','636893587162','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(162,'5958','EMP0000162',NULL,'MR','DHARMENDRA','POPAT','JADHAV','1984-03-19','Male','0','0','0','DHARMENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','318349895027','AMXPJ2179G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(163,'5959','EMP0000163',NULL,'MR','SAMBHAJI','VISHNU','KOLEKAR','1983-06-04','Male','0','0','0','SAMBHAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','781802589467','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(164,'5960','EMP0000164',NULL,'MR','BALKRISHNA','VISHWANATH','DEVKAR','1981-12-15','Male','0','0','0','BALKRISHNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','938825907563','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(165,'5961','EMP0000165',NULL,'MR','ASHOK','KISAN','KURLEKAR','1982-04-01','Male','0','0','0','ASHOK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','442707219893','AVSPK7319R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(166,'5962','EMP0000166',NULL,'MR','CHANDRKANT','SITARAM','KADAM','1974-01-20','Male','0','0','0','CHANDRKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','431631754085','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(167,'5963','EMP0000167',NULL,'MR','GOVARDHAN','BHAGVAN','CHAVAN','1983-06-25','Male','9371656116','0','0','GOVARDHAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','280098562865','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(168,'5964','EMP0000168',NULL,'MR','BHALCHANDRA','MADHUKAR','MALI','1982-09-28','Male','0','0','0','BHALCHANDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','727066184135','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:13','2018-11-17 08:05:13',NULL,NULL,NULL,NULL,NULL),(169,'5966','EMP0000169',NULL,'MR','JAMADAR','MANSOUR','SHABBIR','1986-04-14','Male','0','0','0','JAMADAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','623213438554','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',51,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(170,'5968','EMP0000170',NULL,'MR','NAGESH','MOHAN','BADDI','1983-08-12','Male','0','0','0','NAGESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','427164164630','PANNOTAVBL',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',106,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(171,'5969','EMP0000171',NULL,'MR','KRISHNAT','TUKARAM','SAPKAL','1987-09-15','Male','0','0','0','KRISHNAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','576431766008','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(172,'5970','EMP0000172',NULL,'MR','DILIP','RAGHUNATH','PALEKAR','1976-01-11','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','734247287642','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(173,'5971','EMP0000173',NULL,'MR','SACHIN','PRABHAKAR','ALAT','1985-01-14','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','889324411777','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(174,'5973','EMP0000174',NULL,'MR','NITIN','VITTHAL','GURAV','1985-01-10','Male','0','0','0','NITIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','593096163688','ANNPG2010N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(175,'5974','EMP0000175',NULL,'MR','AVINASH','NILKANTH','HONDRE','1983-05-11','Male','0','0','0','AVINASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','835154348276','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(176,'5975','EMP0000176',NULL,'MR','SACHIN','DINKAR','JADHAV','1981-08-27','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','447748134912','AUCPJ0743M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(177,'5976','EMP0000177',NULL,'MR','DEEPAK','DATTATRAYA','KUDALE','1983-07-25','Male','0','0','0','DEEPAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','251109365081','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(178,'5977','EMP0000178',NULL,'MR','ASHISH','PRABHAKAR','SHINDE','1983-07-04','Male','0','0','0','ASHISH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','693685586002','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-17 08:05:14',NULL,NULL,NULL,NULL,NULL),(179,'5978','EMP0000179',NULL,'MR','VAIBHAV','PURUSHOTTAM','LINGADE','1983-09-28','Male','0','0','0','VAIBHAV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','784302267972','AHBPL1375M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(180,'5980','EMP0000180',NULL,'MR','SUNIL','ASHOK','SAVARATKAR','1984-01-27','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','888815881481','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(181,'5981','EMP0000181',NULL,'MR','MANIK','GANPATI','PATIL','1985-03-13','Male','0','0','0','MANIK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','323472710693','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(182,'5982','EMP0000182',NULL,'MR','SUBHASH','GENDEV','SURYAVANSHI','1986-10-14','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','466238703592','BQBPS0485D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(183,'5984','EMP0000183',NULL,'MR','SANJAY','MANOHAR','PAWAR','1975-08-05','Male','0','0','0','SANJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','379625738674','BCSPP6842E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(184,'5985','EMP0000184',NULL,'MR','GAJANAN','EKANATH','DUBAL','1981-10-11','Male','0','0','0','GAJANAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','555523835555','AOQPD8584A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(185,'5987','EMP0000185',NULL,'MR','PRASHANT','GULABRAO','RAUT','1981-04-04','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','321045885316','AQHPR2852G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(186,'5988','EMP0000186',NULL,'MR','KAPIL','PREMSUKH','DANGE','1984-08-12','Male','0','0','0','KAPIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','568091130352','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(187,'5989','EMP0000187',NULL,'MR','DASHARATH','SHANKAR','MHALE','1984-05-24','Male','0','0','0','DASHARATH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','466446553040','AZPPM6150R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(188,'5990','EMP0000188',NULL,'MR','SANTOSH','LAXMAN','KUMBHAR','1982-08-26','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','573746830470','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(189,'5991','EMP0000189',NULL,'MR','CHANDRAKANT','MADHUKARRAO','CHAWATKAR','1980-08-08','Male','0','0','0','CHANDRAKANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','421017651465','AHUPC8387M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(190,'6019','EMP0000190',NULL,'MR','SACHIN','SHANKAR','CHAUDHARI','1980-04-05','Male','9326442912','0','0','sachinchaudhari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','798518945965','ALLPC8585G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(191,'6127','EMP0000191',NULL,'MR','SUBHASH','RAMCHANDRA','GAWALI','1964-02-28','Male','0','0','0','srgawali@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','319146256308','AQVPG1155B',NULL,'MARRIED',NULL,1,1,NULL,'YES',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(192,'6128','EMP0000192',NULL,'MR','RAMESH','PANDURANG','BORADE','1975-08-05','Male','0','0','0','RAMESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','273725948532','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(193,'6129','EMP0000193',NULL,'MR','BABASAHEB','GUNDAPPA','BHANDARE','1975-06-25','Male','0','0','0','BABASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','785363611137','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(194,'6130','EMP0000194',NULL,'MR','BHARAT','MAHADEO','RAWAN','1973-10-31','Male','0','0','0','BHARAT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','991329000707','AIVPR8686E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(195,'6131','EMP0000195',NULL,'MR','MIRZA MAZHAR','NAWAB','BAIG','1978-09-13','Male','9371458089','0','0','mnbmirza@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','493689602247','AQSPM8598F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(196,'6142','EMP0000196',NULL,'MR','RAJENDRA','JALINDAR','JADHAV','1979-06-05','Male','0','0','0','RAJENDRA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','333957779964','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(197,'6143','EMP0000197',NULL,'MR','VIJAY','BANDU','SALUNKHE','1980-02-13','Male','0','0','0','VIJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','887258107272','BZIPS0022C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(198,'6144','EMP0000198',NULL,'MR','DNYANU','SHIVAJI','JAGTAP','1979-10-25','Male','0','0','0','DNYANU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','426158037778','AJVPJ1705H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(199,'6145','EMP0000199',NULL,'MR','SUBHASH','ANANDRAO','MORE','1978-02-13','Male','0','0','0','SUBHASH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','652380115416','BAHPM2670N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:51',NULL,NULL,NULL,NULL,NULL),(200,'6146','EMP0000200',NULL,'MR','VIKAS','PANDURANG','SHINDE','1984-07-06','Male','0','0','0','VIKAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','230946426171','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(201,'6147','EMP0000201',NULL,'MR','SURESH','RAGHUNATH','PALEKAR','1970-06-15','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','234560374028','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(202,'6164','EMP0000202',NULL,'MR','SUKHDEV','GHAMAJI','DADAS','1976-06-06','Male','0','0','0','SUKHDEV@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','216125975098','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(203,'6165','EMP0000203',NULL,'MR','TULSHIRAM','KENCHAPPA','KAMBLE','1983-04-21','Male','0','0','0','TULSHIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','330359527586','AXDPK7447D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:14','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(204,'6166','EMP0000204',NULL,'MR','DATTATRAY','RAMCHANDRA','BEBALE','1983-01-13','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','835472127256','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:59',NULL,NULL,NULL,NULL,NULL),(205,'6167','EMP0000205',NULL,'MR','DATTATRAY','JYOTIRAM','SHELKE','1985-02-04','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','873636897306','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(206,'6176','EMP0000206',NULL,'MR','SANTOSH','JAYRAM','TAYADE','1975-06-21','Male','8411899110','0','0','sjtayade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','838207049375','AIIPT0050D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(207,'6177','EMP0000207',NULL,'MR','NAIR','RAJIV','GOPINATHAN','1982-08-08','Male','8411093300','0','0','rgnair@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','399307077772','AGPPN2457B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(208,'6179','EMP0000208',NULL,'MR','SANDIP','SONU','WAGH','1981-03-04','Male','0','0','0','SANDIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','289521508606','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:56',NULL,NULL,NULL,NULL,NULL),(209,'6180','EMP0000209',NULL,'MR','PARESH','TUKARAM','MAHAJAN','1983-02-27','Male','0','0','0','PARESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','740266323421','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(210,'6198','EMP0000210',NULL,'MR','ANKUSH','MARUTI','KARDILE','1965-10-16','Male','9325635247','0','0','amkardile@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','491324851625','BRVPK3443A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(211,'6201','EMP0000211',NULL,'MR','DATTATRAY','LAXMAN','HANDE','1976-06-25','Male','0','0','0','DATTATRAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','302824066739','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(212,'6208','EMP0000212',NULL,'MR','UTTAM','BABJI','NALAWADE','1963-06-17','Male','9372153492','0','0','ubnalawade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','421467274720','AAMPN2166L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(213,'6211','EMP0000213',NULL,'MRS','SHUBHANGI','SANJAY','CHAVAN','1981-02-22','Female','0','0','0','shubhangichavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','442596010370','AIMPC8489M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',13,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 06:50:44',NULL,NULL,NULL,NULL,NULL),(214,'6212','EMP0000214',NULL,'MR','ASHOK','SIDDAPPA','BHAYAGONDI','1978-09-28','Male','0','0','0','asbhayagondi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','549246418338','APYPB2390D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(215,'6238','EMP0000215',NULL,'MR','SUBRATA',NULL,'KONAR','1972-04-15','Male','9332056627','0','0','snkonar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','901430221592','APRPK7807D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(216,'6243','EMP0000216',NULL,'MR','PREMANAND','DILIP','PARDESHI','1983-12-28','Male','9370592539','0','0','pdpardeshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','919898504319','AWVPP8102H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',52,NULL,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(217,'6245','EMP0000217',NULL,'MR','NIKHIL','VIJAY','PALAV','1985-01-21','Male','8411077008','0','0','nvpalav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','560202609617','BDDPP3384B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(218,'6252','EMP0000218',NULL,'MR','ABASAHEB','SHRIKANT','JADHAV','1986-11-07','Male','0','0','0','asjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','459554403764','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',69,NULL,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:43',NULL,NULL,NULL,NULL,NULL),(219,'6254','EMP0000219',NULL,'MRS','JAYSHRI','VIKRAM','DHUMAL','1978-06-30','Female','0','0','0','jvdhumal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','397546030876','ANOPD2586K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(220,'6271','EMP0000220',NULL,'MS','PRANALI','SHAILENDRA','SHINDE','1969-04-04','Female','9373693059','0','0','psshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','444319482917','CUZPS1443N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(221,'6308','EMP0000221',NULL,'MR','SANTOSH','KUMAR','DHANSRHREE','1984-02-13','Male','0','0','0','bsantoshkumar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','861561808517','ASLPD2840G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(222,'6312','EMP0000222',NULL,'MR','SURESH','MALKARI','GHERADE','1985-05-16','Male','0','0','0','SURESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','224905134681','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:04',NULL,NULL,NULL,NULL,NULL),(223,'6313','EMP0000223',NULL,'MR','SOMESHWAR','VIJAY','SARGADE','1985-07-27','Male','9370948627','0','0','svsargade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','423303959526','EBFPS0389E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',210,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(224,'6318','EMP0000224',NULL,'MR','AJIT','VENKATESH','TAVARGERI','1982-12-25','Male','9372912334','0','0','avtavargeri@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','324447371380','AIWPT2183K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(225,'6319','EMP0000225',NULL,'MR','BHIMRAO','PANDIT','MUNDE','1990-01-07','Male','0','0','0','BHIMRAO@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','877497183488','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',289,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(226,'6326','EMP0000226',NULL,'MR','MAHESH','KUMAR','MAHATMAGANDHI','1979-04-24','Male','9381781791','0','0','maheshkumar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','487007807056','ASLPM1716E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(227,'6331','EMP0000227',NULL,'MR','MAHADEV','RAGHUNATH','TAMBE','1984-07-07','Male','0','0','0','mrtambe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','483434026108','AHGPT9849M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',106,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(228,'6340','EMP0000228',NULL,'MR','NAGARAJ','MAHANTAPPA','KUNTOJI','1965-02-06','Male','9325301210','0','0','mknagaraj@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','451277592057','ABRPK3073B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(229,'6345','EMP0000229',NULL,'MR','AMAR','SHRINIVAS','JAGADALE','1981-07-02','Male','9371105524','0','0','asjagdale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','922334798028','AKEPJ7753K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(230,'6347','EMP0000230',NULL,'MRS','BHAKTI','VAIBHAV','MAHASHABDE','1982-12-25','Female','0','0','0','bvmahashabde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','807045994391','BPMPM9512D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',231,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(231,'6371','EMP0000231',NULL,'MR','RAJENDRA','SOMAJI','BORKAR','1967-09-03','Male','9372271248','0','0','rsborkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','212851050159','ABOPB5761C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(232,'6386','EMP0000232',NULL,'MR','RAHULKUMAR','SARJERAO','CHAVAN','1983-12-21','Male','9371637261','0','0','rschavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','219965358042','ANKPC3896R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-17 08:05:15',NULL,NULL,NULL,NULL,NULL),(233,'6387','EMP0000233',NULL,'MR','VISHNU','DNYANOBA','UBALE','1978-06-14','Male','0','0','0','VISHNU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','569135220462','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(234,'6405','EMP0000234',NULL,'MRS','POONAM','AMOL','BHOI','1977-05-28','Female','8411089180','0','0','pabhoi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','824513901015','AMIPB1267C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(235,'6411','EMP0000235',NULL,'MR','BHUSHAN','GANESH','PAWAR','1987-04-18','Male','9371105528','0','0','bgpawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','613118227657','BOHPP6701F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',210,NULL,1,1,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(236,'6436','EMP0000236',NULL,'MR','SHANTINATH','MAHADEV','SUTAR','1986-04-12','Male','0','0','0','smsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','438820626853','BZAPS1523A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(237,'6442','EMP0000237',NULL,'MR','SURESH','NAMDEO','TIKHE','1971-09-08','Male','8411095279','0','0','sntikhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','718205561749','ADNPT0844K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(238,'6452','EMP0000238',NULL,'MR','DILDAR','JAHANGIR','JAHAGIRDAR','1986-06-01','Male','0','0','0','DILDAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','238365091445','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(239,'6453','EMP0000239',NULL,'MR','SHIVAJI','NAMDEV','KARE','1984-06-05','Male','0','0','0','SHIVAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','223813409489','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(240,'6455','EMP0000240',NULL,'MR','VINOD','GENU','BHOSALE','1974-12-10','Male','0','0','0','VINOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','707943405242','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:15','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(241,'6459','EMP0000241',NULL,'MR','DILIP','MOTILAL','SHINDE','1978-11-05','Male','0','0','0','DILIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','841098416645','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',351,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:14',NULL,NULL,NULL,NULL,NULL),(242,'6468','EMP0000242',NULL,'MR','SOURAV',NULL,'DAS','1986-05-08','Male','9386393040','0','0','souravdas@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','460995103782','APQPD7564R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',26,NULL,1,5,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 06:50:46',NULL,NULL,NULL,NULL,NULL),(243,'6471','EMP0000243',NULL,'MR','SURESH','PANDURANG','PADWAL','1964-06-01','Male','9325378749','0','0','sppadwal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','619268426617','ABSPP9597Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(244,'6472','EMP0000244',NULL,'MR','BALASAHEB','SONAJI','WAJE','1968-06-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','243248572281','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(245,'6473','EMP0000245',NULL,'MR','D','S','AWAD','1982-07-02','Male','0','0','0','D@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','0','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(246,'6474','EMP0000246',NULL,'MR','SANTOSH','HANUMANT','KADAM','1989-03-17','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','775675675958','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 08:05:16',NULL,NULL,NULL,NULL,NULL),(247,'6475','EMP0000247',NULL,'MR','PRABHAKAR','NIVRUTTI','JANEKAR','1972-06-02','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','940337763524','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(248,'6480','EMP0000248',NULL,'MR','SANDESH','KONDIRAM','SHIVARKAR','1983-10-29','Male','0','0','0','SANDESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','927491306230','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(249,'6482','EMP0000249',NULL,'MR','DNYANESHWAR','SHANKAR','JADHAV','1977-06-15','Male','0','0','0','DNYANESHWAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','486945542323','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(250,'6483','EMP0000250',NULL,'MR','S','S','CHAVAN','1977-06-06','Male','0','0','0','sureshchavan@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','922749494861','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(251,'6487','EMP0000251',NULL,'MR','SUNIL','JAGANNATH','PATIL','1982-01-30','Male','0','0','0','SUNIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','302139059147','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(252,'6490','EMP0000252',NULL,'MR','SAGAR','MARUTI','SAVANT','1987-05-17','Male','0','0','0','SAGAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','507009225822','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(253,'6492','EMP0000253',NULL,'MR','SAMEER','ASHOK','DAUNDE','1979-02-09','Male','0','0','0','SAMEER@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','400178573329','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(254,'6493','EMP0000254',NULL,'MR','SHALIGRAM','PARASHRAM','NIRMAL','1978-01-24','Male','0','0','0','SHALIGRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','517264996936','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(255,'6501','EMP0000255',NULL,'MR','CHANDRAVADAN','BHAUSAHEB','KALE','1961-02-19','Male','9326024668','0','0','cbkale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','603916011965','AIXPK9652K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-17 10:14:22',NULL,NULL,NULL,NULL,NULL),(256,'6504','EMP0000256',NULL,'MR','DHONDIRAM','SHANKAR','PATIL','1979-07-06','Male','0','0','0','DHONDIRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','752144867212','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',270,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(257,'6515','EMP0000257',NULL,'MR','BALAJI','VAMANRAO','BIRADAR','1988-01-05','Male','0','0','0','BALAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','346156205418','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(258,'6516','EMP0000258',NULL,'MR','SACHIN','GULAB','JADHAV','1977-01-02','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','546468244236','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(259,'6519','EMP0000259',NULL,'MR','BASAVANAPPA','SHANKAR','BANDICHHODE','1976-06-10','Male','0','0','0','BASAVANAPPA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','703052658048','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(260,'6520','EMP0000260',NULL,'MR','SHIVSHARNAPPA','BHIMSHYO','BODHANKAR','1976-01-14','Male','0','0','0','sbbodankar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','841262978719','AOAPB7567B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(261,'6521','EMP0000261',NULL,'MR','DATTATRAYA','LAXMAN','SARAK','1987-06-05','Male','0','0','0','DATTATRAYA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','366804923808','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(262,'6522','EMP0000262',NULL,'MR','WADAR','ARJUN','SHANKAR','1984-02-01','Male','0','0','0','WADAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','670407999855','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:08',NULL,NULL,NULL,NULL,NULL),(263,'6524','EMP0000263',NULL,'MR','BHIMSEN','TANAJI','PANCHAL','1986-06-10','Male','9326024889','0','0','BHIMSEN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','335695864661','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',26,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(264,'6525','EMP0000264',NULL,'MR','LAXMAN','RAOSAHEB','MUGALE','1973-03-03','Male','0','0','0','LAXMAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','934868920373','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(265,'6526','EMP0000265',NULL,'MR','PRAVIN','GOPAL','KARNEKAR','1978-06-05','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','956228831057','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(266,'6529','EMP0000266',NULL,'MR','YOGESH','SHIVAJI','SHINDE','1983-11-15','Male','0','0','0','ysshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','762060925963','BZTPS1195P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',51,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(267,'6530','EMP0000267',NULL,'MR','PRAMOD','MANIKRAO','CHOUGULE','1989-01-01','Male','0','0','0','PRAMOD@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','446447581898','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(268,'6557','EMP0000268',NULL,'MR','PANJAB','SURESH','WANKHEDE','1982-11-09','Male','9373693057','0','0','pswankhade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','785075398415','ABEPW1656M',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',103,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(269,'6565','EMP0000269',NULL,'MR','SAMBHAJI','EKANATH','PATIL','1982-07-05','Male','0','0','0','sepatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','757485449376','ANOPP6376K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',106,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(270,'6566','EMP0000270',NULL,'MR','SHASHIKANT','CHINTAMAN','KOSHTI','1965-01-05','Male','9325378774','0','0','sckoshti@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','216977160817','AAZPK8247N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(271,'6570','EMP0000271',NULL,'MR','ANAND','DILEEP','BHOODHAR','1982-12-15','Male','0','0','0','adbhoodhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','467828496125','AKGPB5324G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(272,'6571','EMP0000272',NULL,'MR','ANIL','RAJENDRA','SURYAWANSHI','1987-07-25','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','233466205013','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(273,'6575','EMP0000273',NULL,'MR','VINAYAK','VITTHAL','PATIL','1987-07-10','Male','0','0','0','VINAYAK@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','919403116782','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(274,'6576','EMP0000274',NULL,'MR','MADHUKAR','SUDHAKAR','SOLANKE','1974-10-04','Male','0','0','0','MADHUKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','458870798683','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:16','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(275,'6577','EMP0000275',NULL,'MR','PRAMOD','SHANKAR','THORAT','1983-05-15','Male','0','0','0','psthorat@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','988445177921','AJMPT0543J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(276,'6585','EMP0000276',NULL,'MR','SHRIKANT','SUDAM','HANDAL','1986-09-27','Male','0','0','0','sshandal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','757279349732','ADRPH8575K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(277,'6596','EMP0000277',NULL,'MR','PRADIP','RAMCHANDRA','PATIL','1986-06-19','Male','0','0','0','PRADIP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','757925538335','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(278,'6598','EMP0000278',NULL,'MR','VIKAS','JAYARAM','PAWAR','1982-06-22','Male','0','0','0','VIKAS@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','766070503269','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(279,'6601','EMP0000279',NULL,'MR','JOHN','SEBASTIAN','MASCARENHAS','1989-02-17','Male','0','0','0','JOHN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','930519308351','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(280,'6602','EMP0000280',NULL,'MR','VIJAY','PRABHAKAR','DHUME','1986-07-24','Male','0','0','0','VIJAY@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','319055592139','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(281,'6603','EMP0000281',NULL,'MR','PRAVIN','VILAS','WAGHAMARE','1987-11-05','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','649160841886','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(282,'6604','EMP0000282',NULL,'MR','SACHIN','KARBHARI','CHAKRANARAYAN','1990-07-13','Male','0','0','0','SACHIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','706586504537','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:49',NULL,NULL,NULL,NULL,NULL),(283,'6605','EMP0000283',NULL,'MR','JAYRAM','VIKRAM','SHINDE','1985-01-25','Male','0','0','0','JAYRAM@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','607867914199','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:47',NULL,NULL,NULL,NULL,NULL),(284,'6606','EMP0000284',NULL,'MR','MAHAMADALI','AYUB','SAYYAD','1977-06-29','Male','9325635672','0','0','masayyad@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','666732122635','BAEPS8991K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:14',NULL,NULL,NULL,NULL,NULL),(285,'6610','EMP0000285',NULL,'MR','YOGESH','GANESH','NALKANDE','1987-01-25','Male','0','0','0','YOGESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','506886872752','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(286,'6612','EMP0000286',NULL,'MR','SHANKAR','SITARAM','GALAVE','1984-06-24','Male','0','0','0','ssgalve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','565559756185','APLPG9001P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(287,'6615','EMP0000287',NULL,'MR','GANESH','BALASAHEB','SALUNKHE','1981-06-14','Male','9325332304','0','0','gbsalunkhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','801911187682','BTDPS2224P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',52,NULL,1,1,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:42',NULL,NULL,NULL,NULL,NULL),(288,'6618','EMP0000288',NULL,'MR','GIRISH','MALLAPPA','HAVALAKOD','1985-07-08','Male','0','0','0','GIRISH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','557254932197','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:05',NULL,NULL,NULL,NULL,NULL),(289,'6623','EMP0000289',NULL,'MR','DEEPAK','RAM','BOHARA','1979-04-26','Male','9325378761','0','0','drbohara@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','307405617432','AWBPB1104D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(290,'6624','EMP0000290',NULL,'MR','SANTOSH','SHASHIKANT','AMBEKAR','1979-01-15','Male','0','0','0','SANTOSH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','210250780633','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(291,'6629','EMP0000291',NULL,'MR','OM','PRAKASH','GUPTA','1961-05-14','Male','7428356679','0','0','opgupta@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','525008060837','ABAPG7308J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,4,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-17 08:05:17',NULL,NULL,NULL,NULL,NULL),(292,'6637','EMP0000292',NULL,'MR','SANJAY','BAPURAO','HIRVE','1971-04-15','Male','9372271247','0','0','sbhirve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','618835562481','ABXPH2722E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(293,'6650','EMP0000293',NULL,'MR','PRABHAKAR','ARJUN','KAMBLE','1977-12-05','Male','0','0','0','PRABHAKAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','412326081351','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',103,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(294,'6652','EMP0000294',NULL,'MR','ABHIMANYU','VISHWANATH','KONDHARE','1976-06-01','Male','0','0','0','ABHIMANYU@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','745032044298','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(295,'6664','EMP0000295',NULL,'MR','RAVINDRA','RAMDAS','JAIN','1963-03-31','Male','9371781885','0','0','rrjain@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','790390835316','AFXPJ6504L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:14',NULL,NULL,NULL,NULL,NULL),(296,'6667','EMP0000296',NULL,'MR','SAHEBRAO','VAIJINATH','LANDGE','1977-02-20','Male','0','0','0','svlandge@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','953960761208','AECPL1695Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',289,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(297,'6695','EMP0000297',NULL,'MR','PRATAP','ATMARAM','RANAWARE','1975-11-20','Male','0','0','0','PRATAP@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','705034965758','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(298,'6696','EMP0000298',NULL,'MR','BANDU','JAYWANT','SURYAWANSHI','1965-06-01','Male','0','0','0','bjsuryawanshi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','385569741318','CHSPS3667J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(299,'6697','EMP0000299',NULL,'MR','SHAHAJI','NATHURAM','SAWANT','1975-06-29','Male','0','0','0','SHAHAJI@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','267454372889','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(300,'6698','EMP0000300',NULL,'MR','DHANAJAY','ARJUN','SHENDKAR','1980-07-14','Male','0','0','0','dashendkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','356122782556','BMKPS0756E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(301,'6699','EMP0000301',NULL,'MR','SUDHIR','MANOHAR','BHOLE','1972-10-27','Male','0','0','0','SUDHIR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','633649964779','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',138,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:48',NULL,NULL,NULL,NULL,NULL),(302,'6700','EMP0000302',NULL,'MR','NIRAJAN','ONKARARAO','DESHMUKH','1979-10-02','Male','0','0','0','NIRAJAN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','650602806398','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(303,'6701','EMP0000303',NULL,'MR','HANUMANT','VISHNU','KURADE','1965-06-01','Male','0','0','0','hvkurade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','613219062815','ABZPK5059R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(304,'6702','EMP0000304',NULL,'MR','BALASAHEB','SHRIRAM','PATIL','1978-06-01','Male','0','0','0','BALASAHEB@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','869046030495','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',270,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(305,'6703','EMP0000305',NULL,'MR','MALLIKARJUN','LAGAMANNA','KATTIMANI','1983-06-01','Male','0','0','0','MALLIKARJUN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','680606970127','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(306,'6704','EMP0000306',NULL,'MR','ANNA','BABAN','NIMBALKAR','1976-07-12','Male','0','0','0','ANNA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','606454638634','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(307,'6706','EMP0000307',NULL,'MR','GANGADHAR','DEVRAOJI','GEDEKAR','1986-03-23','Male','0','0','0','GANGADHAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','385398150022','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',270,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(308,'6707','EMP0000308',NULL,'MR','NILESH','BALAKRISHNA','LOHAR','1981-04-04','Male','0','0','0','NILESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','359614886643','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(309,'6708','EMP0000309',NULL,'MR','PRAVIN','SHRIRANG','LOHAR','1982-11-07','Male','0','0','0','PRAVIN@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','909553058753','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:52',NULL,NULL,NULL,NULL,NULL),(310,'6709','EMP0000310',NULL,'MR','MANE','RAMCHANDRA','BABURAV','1981-04-16','Male','0','0','0','rbmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','581417706714','ANSPM7017J',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:17','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(311,'6711','EMP0000311',NULL,'MR','HEMANT','PRABHAKARRAO','WARHEKAR','1985-06-04','Male','0','0','0','HEMANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','597985196169','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:45',NULL,NULL,NULL,NULL,NULL),(312,'6712','EMP0000312',NULL,'MR','PRASHANT','VILAS','GAVALI','1985-07-02','Male','0','0','0','PRASHANT@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','271435174946','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(313,'6713','EMP0000313',NULL,'MR','SUGRIV','SOMNATH','KAKADE','1978-06-10','Male','0','0','0','sskakade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','842004840057','BSTPK0973Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(314,'6724','EMP0000314',NULL,'MS','PRAJAKTA','NITIN','DHORJE','1987-06-26','Female','9371370167','0','0','pndhorje@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','775972747871','ASYPD6155F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(315,'6729','EMP0000315',NULL,'MR','SAMEER','PURUSHOTTAM','SHIRODKAR','1977-03-06','Male','9372342132','0','0','spshirodkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','636952774225','BDAPS5367Q',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(316,'6735','EMP0000316',NULL,'MR','RAJESH','BABASINGH','GAUTAM','1978-10-05','Male','9372337073','0','0','rbgoutam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','444254126931','AOBPG4665C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:13',NULL,NULL,NULL,NULL,NULL),(317,'6741','EMP0000317',NULL,'MR','CHANDRASHEKHAR','SHANKAR','TISGAONKAR','1962-03-31','Male','9325378742','0','0','cstisgaonkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','572833410848','AAKPT4095N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-17 08:05:18',NULL,NULL,NULL,NULL,NULL),(318,'6770','EMP0000318',NULL,'MR','ANIL','RAJARAM','DHOLE','1977-09-18','Male','0','0','0','ANIL@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','872220485617','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(319,'6771','EMP0000319',NULL,'MR','GANESH','NAMDEO','SHINDE','1973-12-12','Male','0','0','0','gnshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','694653614626','CJXPS4941L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(320,'6774','EMP0000320',NULL,'MR','SHIVAJI','RAMU','HAKE','1975-06-01','Male','0','0','0','srhake@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','206669302188','ADGPH5706B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',289,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:12',NULL,NULL,NULL,NULL,NULL),(321,'6787','EMP0000321',NULL,'MR','BALASAHEB','MARUTI','KUMBHAR','1967-06-12','Male','0','0','0','bmkumbhar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','401600728131','ASZPK2732N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(322,'6810','EMP0000322',NULL,'MR','ARVIND','HARIBHAU','BANSODE','1967-08-01','Male','0','0','0','ahbansode@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','584944302001','BAZPB3404R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:50',NULL,NULL,NULL,NULL,NULL),(323,'6811','EMP0000323',NULL,'MR','MADHUKAR','PRALHAD','CHOUDHARY','1972-03-27','Male','0','0','0','mpchaudhari@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','624445148247','AGRPC1215G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(324,'6812','EMP0000324',NULL,'MR','KAILAS','RATAN','PATIL','1981-11-17','Male','0','0','0','krpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','300353462801','BMCPP4633B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',206,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:57',NULL,NULL,NULL,NULL,NULL),(325,'6813','EMP0000325',NULL,'MR','RUPCHANDRA','SHAMRAO','KADAM','1986-08-15','Male','0','0','0','rskadam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','267615342306','CMLPK5151R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',71,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:44',NULL,NULL,NULL,NULL,NULL),(326,'6814','EMP0000326',NULL,'MR','DATTATRAY','HANMANT','PAWAR','1979-08-15','Male','0','0','0','dhpawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','820323573721','BWJPP7949D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(327,'6817','EMP0000327',NULL,'MR','SUNIL','KUNDALLAL','JAISWAL','1971-08-07','Male','0','0','0','skjaiswal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','360972653157','AMIPJ5876B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:00',NULL,NULL,NULL,NULL,NULL),(328,'6818','EMP0000328',NULL,'MR','NAVNATH','DATTATRAY','SUTAR','1976-07-02','Male','0','0','0','ndsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','959002157073','CAJPS7256K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(329,'6819','EMP0000329',NULL,'MR','MILAN','SUBAL','MANNA','1989-04-17','Male','0','0','0','msmanna@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','820265082037','AXKPM0135B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(330,'6820','EMP0000330',NULL,'MR','JAYRAJ','SANJEEV','SAPALIKA','1983-10-15','Male','0','0','0','jssapalika@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','477846066495','CWSPS7897D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(331,'6821','EMP0000331',NULL,'MR','RANGARAO','PARSU','REDEKAR','1976-06-09','Male','0','0','0','rpredekar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','398535531067','BGQPR3931N',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(332,'6822','EMP0000332',NULL,'MR','RAMKRUSHNA','MADAN','INGOLE','1986-11-29','Male','0','0','0','rmingole@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','389790122032','ABZPJ3438A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:55',NULL,NULL,NULL,NULL,NULL),(333,'6823','EMP0000333',NULL,'MR','SAMBHAJIRAO','VISHVASRAO','DISALE','1966-10-25','Male','0','0','0','svdisale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','299444383592','APIPD8502K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(334,'6824','EMP0000334',NULL,'MR','ABHAY','JAGANNATH','RAUT','1976-12-09','Male','0','0','0','ajraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','829584644604','BFOPR6604B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:58',NULL,NULL,NULL,NULL,NULL),(335,'6825','EMP0000335',NULL,'MR','MAHADVE','JAGANNATH','WAGHMARE','1973-06-02','Male','0','0','0','mjwaghmare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','966812470470','ABNPW4601R',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(336,'6826','EMP0000336',NULL,'MR','SHRINIWAS','TAYAPPA','DAYAL','1969-06-26','Male','0','0','0','stdayal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','200920157932','BDJPD7777E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(337,'6828','EMP0000337',NULL,'MR','RAGHUNATH','MAHADEV','MANE','1962-06-15','Male','0','0','0','rmmane@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','321182762928','BTNPM1387F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:01',NULL,NULL,NULL,NULL,NULL),(338,'6841','EMP0000338',NULL,'MR','AMOL','DATTATRAY','PALKHE','1973-03-27','Male','0','0','0','adpalkhe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','512716433227','APWPP7416E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:53',NULL,NULL,NULL,NULL,NULL),(339,'6868','EMP0000339',NULL,'MR','NARESH','VITTHALSA','SONWAL','1970-09-20','Male','0','0','0','nvsonwal@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','422951768416','BVCPS9482G',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(340,'6880','EMP0000340',NULL,'MR','NISCHAD','ABDUL','SALAM','1972-07-26','Male','8411094368','0','0','nasalam@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','895544061622','ATHPS6225K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',255,NULL,1,1,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:11',NULL,NULL,NULL,NULL,NULL),(341,'6883','EMP0000341',NULL,'MS','SUSHAMA','JAYAWANT','SHIRKE','1971-01-01','Female','0','0','0','sjshirke@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','685952329860','CMSPS3947L',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',131,NULL,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:46',NULL,NULL,NULL,NULL,NULL),(342,'6889','EMP0000342',NULL,'MR','MANDALA','JOHN','PAUL','1991-08-25','Male','9372268434','0','0','johnpaul@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','821813346766','BZFPM7432K',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',47,NULL,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(343,'6890','EMP0000343',NULL,'MR','VASANT','PARBATRAO','NITTURE','1972-07-02','Male','9371105526','0','0','vpnitture@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','735241551567','AAHPN0641B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',228,NULL,1,1,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:09',NULL,NULL,NULL,NULL,NULL),(344,'6894','EMP0000344',NULL,'MR','S','R','BARSE','1989-02-10','Male','0','0','0','S@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','0','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:06',NULL,NULL,NULL,NULL,NULL),(345,'6898','EMP0000345',NULL,'MR','ASHOK','MAHADEV','SUTAR','1965-06-04','Male','9326653845','0','0','amsutar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','281193949309','ADXPS3657F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',343,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:18','2018-11-19 09:38:14',NULL,NULL,NULL,NULL,NULL),(346,'6903','EMP0000346',NULL,'MR','SAHIL','ILAI','MUJAWAR','1995-01-01','Male','0','0','0','simujawar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','442908965210','CVEPM1715P',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',195,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:37:54',NULL,NULL,NULL,NULL,NULL),(347,'6906','EMP0000347',NULL,'MR','ANANT','ASHOK','PATIL','1987-06-13','Male','0','0','0','aapatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','431234069658','BNOPP9009G',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(348,'6908','EMP0000348',NULL,'MR','SUCHIT','CHANDRASHEKHAR','JADHAV','1996-10-22','Male','0','0','0',' scjadhav@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','557488513202','BBUPJ9624H',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',212,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:38:07',NULL,NULL,NULL,NULL,NULL),(349,'6909','EMP0000349',NULL,'MR','SURAJ','ADHIK','JAGDALE','1994-02-15','Male','0','0','0','sajagadale@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','762216764197','BBWPJ2043N',NULL,'UNMARRIED',NULL,1,1,NULL,'NO',NULL,'Active',24,NULL,1,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 06:50:45',NULL,NULL,NULL,NULL,NULL),(350,'6911','EMP0000350',NULL,'MR','AKASH','EKNATH','BARAVE','1994-09-21','Male','0','0','0','aebarve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','203851333406','PANNOTAVBL',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(351,'6916','EMP0000351',NULL,'MR','P','M','SHINDE','1983-09-30','Male','0','0','0','pmshinde@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','471318169224','BMWPS1957B',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(352,'6917','EMP0000352',NULL,'MR','PRATIK','DEEPAK','RAUT','1993-01-15','Male','0','0','0','pdraut@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','980301759834','AVAPR4481P',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',46,NULL,1,1,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:37:41',NULL,NULL,NULL,NULL,NULL),(353,'6920','EMP0000353',NULL,'MS','GEETA','SURESH','MULIK','1993-07-13','Female','0','0','0','GEETA@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','612548733033','BNUPM3042A',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',231,NULL,1,1,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:38:10',NULL,NULL,NULL,NULL,NULL),(354,'7072','EMP0000354',NULL,'MS','NAMRATA','KASHIRAM','KHEDEKAR','1989-07-19','Female','0','0','0','nkkhedekar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','868120373518','DRTPK1149D',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',26,NULL,1,1,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 06:50:46',NULL,NULL,NULL,NULL,NULL),(355,'7108','EMP0000355',NULL,'MR','SAGAR','BHASKAR','THOMBARE','1991-11-09','Male','0','0','0','SAGAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','713793317334','APEPT1059D',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',NULL,NULL,1,1,22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(356,'7110','EMP0000356',NULL,'MR','RAJKUMAR','SADASHIV','SUTAR','1992-08-11','Male','0','0','0','RAJKUMAR@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','632291807471','CJGPS7837A',NULL,'UNMARRIED',NULL,2,1,NULL,'NO',NULL,'Active',43,NULL,1,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:37:40',NULL,NULL,NULL,NULL,NULL),(357,'8607','EMP0000357',NULL,'MR','PRADIP','SHANKARLAL','DAVE','1960-09-21','Male','0','0','0','psdave@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','985840883840','ACCPD1507B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(358,'8610','EMP0000358',NULL,'MR','HEMANT','GAJANAN','SAMANT','1959-08-30','Male','0','0','0','hgsamant@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','429397765913','AFOPS1619A',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(359,'8617','EMP0000359',NULL,'MR','DINESH','HARIBANSH','PATHAK','1959-09-15','Male','0','0','0','DINESH@gmail.com',NULL,'NA',1,1,363,'NA',NULL,'NA','706532893235','ADRPP5776C',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',357,NULL,1,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:43:21',NULL,NULL,NULL,NULL,NULL),(360,'8621','EMP0000360',NULL,'MR','MANGESH','KASHIRAM','DHADVE','1979-05-25','Male','0','0','0','mkdhadve@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','390796616955','AOSPD1660D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(361,'8622','EMP0000361',NULL,'MRS','URMILA','UMESH','NAGARKAR','1962-09-20','Female','0','0','0','urmilanagarkar@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','718271709949','ABUPN0104F',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(362,'8633','EMP0000362',NULL,'MR','MILIND','RAMESH','PATIL','1986-10-30','Male','0','0','0','mrpatil@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','673643008360','BDAPP0569D',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(363,'8647','EMP0000363',NULL,'MR','GANESH','SHRIRANG','PARTHE','1982-08-22','Male','0','0','0','gsparthe@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','785295999974','AZSPP0256E',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(364,'8650','EMP0000364',NULL,'MR','VIJAY','DATTATRAY','GAWADE','1980-10-12','Male','0','0','0','vdgawade@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','443706469030','ALWPG5715B',NULL,'MARRIED',NULL,1,1,NULL,'NO',NULL,'Active',357,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-19 09:43:21',NULL,NULL,NULL,NULL,NULL),(365,'8653','EMP0000365',NULL,'MR','SAURABH','DEEPAK','MHATRE','1991-12-24','Male','0','0','0','sdmhatre@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','0','BCIPM5641L',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(366,'8654','EMP0000366',NULL,'MS','RESHMA','ABDUL','WAHID SHAIKH','1994-09-28','Female','0','0','0','reshmashaikh@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','0','DUVPS3700P',NULL,'UNMARRIED',NULL,3,1,NULL,'NO',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 08:05:19','2018-11-17 08:05:19',NULL,NULL,NULL,NULL,NULL),(367,'1847','EMP0000367',NULL,'MR','KIRAN','GOPIKISAN','RATHI','1950-10-15','Male','9371105519','0','0','kgrathi@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','689239815184','AANPR2557A',NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:36:52','2018-11-20 06:36:52',NULL,NULL,NULL,NULL,NULL),(368,'3939','EMP0000368',NULL,'MR','RAKESH',NULL,'MEHTA','1959-06-25','Male','9371105517','0','0','rakeshmehta@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','847860617544','AAHPM7105K',NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:36:52','2018-11-20 06:36:52',NULL,NULL,NULL,NULL,NULL),(369,'3025','EMP0000369',NULL,'MR','DILIP','SUDHAKAR','TOTRE','1961-08-02','Male','8411089509','0','0','dstotre@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','348436981769','AAGPT3481L',NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:36:52','2018-11-20 06:36:52',NULL,NULL,NULL,NULL,NULL),(370,'8603','EMP0000370',NULL,'MR','RAMESH','MUKTAJI','TAVHARE','1956-06-01','Male','9833815902','0','0','rmtavhare@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','618019814193','AADPT4312P',NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:36:52','2018-11-20 06:36:52',NULL,NULL,NULL,NULL,NULL),(371,'8606','EMP0000371',NULL,'MR','SOMSUNDARAN',NULL,'NAIR','1965-05-08','Male','9833815904','0','0','ksnair@premier.co.in',NULL,'NA',1,1,363,'NA',NULL,'NA','392856572728','ACEPN7694K',NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:36:53','2018-11-20 06:36:53',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `esic_employers` VALUES (1,'1,2,3,4,5,6,7,8,23',12,'2018-09-01','2019-08-31',1,NULL,'2018-11-19 11:55:58','2018-11-19 11:55:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_masters`
--

LOCK TABLES `esic_masters` WRITE;
/*!40000 ALTER TABLE `esic_masters` DISABLE KEYS */;
INSERT INTO `esic_masters` VALUES (1,1,1.75,0.00,'2018-09-01',21000.00,'1,2,3,4,5,6,7,8,23','2018-12-01',1,NULL,'2018-11-19 11:18:12','2018-11-19 11:18:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gratuity_masters`
--

LOCK TABLES `gratuity_masters` WRITE;
/*!40000 ALTER TABLE `gratuity_masters` DISABLE KEYS */;
INSERT INTO `gratuity_masters` VALUES (1,'5','1',26,'15',1,NULL,'2018-11-19 12:08:35','2018-11-19 12:08:35');
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
INSERT INTO `groups` VALUES (1,'premier@gmail.com','$2a$10$g6llLTjfv0lyRWO9Q1pttewhJ.JNpMVkq3Bd1vcvMU74WDEZCgtsG','Premier',NULL,NULL,NULL,6,'2018-11-19 06:20:46','2018-11-19 05:58:32','192.168.13.249','192.168.13.249','2018-11-17 05:36:40','2018-11-19 06:20:46',NULL,NULL,NULL,NULL);
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
  `contact_library` tinyint(1) DEFAULT NULL,
  `gps_track` tinyint(1) DEFAULT NULL,
  `restricted_area` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=372 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'1979-04-01',1,1,NULL,NULL,NULL,NULL,'100268687988','02636','0372964','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1979-04-01',NULL,0,NULL,NULL),(2,2,'1979-12-11',2,2,NULL,NULL,NULL,NULL,'100269794363','02721','0303030','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1979-12-11',NULL,0,NULL,NULL),(3,3,'1980-01-05',3,3,NULL,NULL,NULL,NULL,'100170969237','02463','0393572','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1980-01-05',NULL,0,NULL,NULL),(4,4,'1980-10-01',4,2,NULL,NULL,NULL,NULL,'100112915138','02749','0432803','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,34,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1980-10-01',NULL,0,NULL,NULL),(5,5,'1980-09-15',5,4,NULL,NULL,NULL,NULL,'100248446927','02783','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,35,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1980-09-15',NULL,0,NULL,NULL),(6,6,'1981-07-13',6,5,NULL,NULL,NULL,NULL,'100198882890','02806','0310098','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,36,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-07-13',NULL,0,NULL,NULL),(7,7,'1981-10-21',7,6,NULL,NULL,NULL,NULL,'100390497193','02871','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-10-21',NULL,0,NULL,NULL),(8,8,'1981-10-21',4,1,NULL,NULL,NULL,NULL,'100169692934','02872','0589723','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,34,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-10-21',NULL,0,NULL,NULL),(9,9,'1981-10-23',2,2,NULL,NULL,NULL,NULL,'100350926472','02873','0589724','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-10-23',NULL,0,NULL,NULL),(10,10,'1981-10-25',2,7,NULL,NULL,NULL,NULL,'100360102588','02878','0589838','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-10-25',NULL,0,NULL,NULL),(11,11,'1981-10-30',8,2,NULL,NULL,NULL,NULL,'100096781823','02879','0589839','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-10-30',NULL,0,NULL,NULL),(12,12,'1981-11-06',1,8,NULL,NULL,NULL,NULL,'100206664571','02880','0589924','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1981-11-06',NULL,0,NULL,NULL),(13,13,'1982-01-16',9,9,NULL,NULL,NULL,NULL,'100269874150','02914','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,38,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1982-01-16',NULL,0,NULL,NULL),(14,14,'1983-02-01',8,10,NULL,NULL,NULL,NULL,'100151122183','03048','0492808','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-02-01',NULL,0,NULL,NULL),(15,15,'1983-02-01',2,8,NULL,NULL,NULL,NULL,'100193531188','03073','0493039','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,34,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-02-01',NULL,0,NULL,NULL),(16,16,'1983-07-01',3,3,NULL,NULL,NULL,NULL,'100271631520','02899','0306276','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-07-01',NULL,0,NULL,NULL),(17,17,'1983-08-12',1,11,NULL,NULL,NULL,NULL,'100197823931','03128','0438892','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,40,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-08-12',NULL,0,NULL,NULL),(18,18,'1983-08-31',1,12,NULL,NULL,NULL,NULL,'100300591627','03078','0591650','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-08-31',NULL,0,NULL,NULL),(19,19,'1983-09-25',6,13,NULL,NULL,NULL,NULL,'100153188724','03147','0494353','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,42,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1983-09-25',NULL,0,NULL,NULL),(20,20,'1985-09-25',5,4,NULL,NULL,NULL,NULL,'100189981051','03238','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,35,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1985-09-25',NULL,0,NULL,NULL),(21,21,'1988-08-07',2,14,NULL,NULL,NULL,NULL,'100192079182','03400','0695592','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1988-08-07',NULL,0,NULL,NULL),(22,22,'1988-09-19',8,14,NULL,NULL,NULL,NULL,'100256022165','03420','1146511','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1988-09-19',NULL,0,NULL,NULL),(23,23,'1988-11-04',7,6,NULL,NULL,NULL,NULL,'100265960262','03431','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,35,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1988-11-04',NULL,0,NULL,NULL),(24,24,'1989-03-10',9,15,NULL,NULL,NULL,NULL,'100178272343','03438','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1989-03-10',NULL,0,NULL,NULL),(25,25,'1989-07-01',3,16,NULL,NULL,NULL,NULL,'100169627368','03466','1148839','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,45,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1989-07-01',NULL,0,NULL,NULL),(26,26,'1989-08-29',10,17,NULL,NULL,NULL,NULL,'100195627877','03474','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1989-08-29',NULL,0,NULL,NULL),(27,27,'1989-10-14',2,2,NULL,NULL,NULL,NULL,'100110652940','03441','1170970','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1989-10-14',NULL,0,NULL,NULL),(28,28,'1989-12-18',8,2,NULL,NULL,NULL,NULL,'100402928245','03493','1521718','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1989-12-18',NULL,0,NULL,NULL),(29,29,'1990-01-01',4,2,NULL,NULL,NULL,NULL,'100112906892','03494','1521898','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-01-01',NULL,0,NULL,NULL),(30,30,'1990-02-03',7,6,NULL,NULL,NULL,NULL,'100217535461','03520','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-02-03',NULL,0,NULL,NULL),(31,31,'1990-05-11',9,18,NULL,NULL,NULL,NULL,'100135266171','03532','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,46,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-05-11',NULL,0,NULL,NULL),(32,32,'1990-07-18',2,2,NULL,NULL,NULL,NULL,'100165197797','03561','1526349','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-07-18',NULL,0,NULL,NULL),(33,33,'1990-07-25',11,19,NULL,NULL,NULL,NULL,'100188721580','03455','1148669','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,47,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-07-25',NULL,0,NULL,NULL),(34,34,'1990-10-03',4,20,NULL,NULL,NULL,NULL,'100140768103','03488','1158843','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-10-03',NULL,0,NULL,NULL),(35,35,'1990-10-04',4,20,NULL,NULL,NULL,NULL,'100107593869','03516','1522964','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-10-04',NULL,0,NULL,NULL),(36,36,'1990-10-08',4,20,NULL,NULL,NULL,NULL,'100170979646','03510','1522958','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-10-08',NULL,0,NULL,NULL),(37,37,'1990-11-02',2,20,NULL,NULL,NULL,NULL,'100216092600','03582','1170882','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1990-11-02',NULL,0,NULL,NULL),(38,38,'1991-01-01',4,2,NULL,NULL,NULL,NULL,'100133448195','03625','1156855','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1991-01-01',NULL,0,NULL,NULL),(39,39,'1991-01-10',2,14,NULL,NULL,NULL,NULL,'100192843248','03538','1525338','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1991-01-10',NULL,0,NULL,NULL),(40,40,'1991-04-25',6,21,NULL,NULL,NULL,NULL,'100197823949','03654','1156820','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,48,4,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1991-04-25',NULL,0,NULL,NULL),(41,41,'1991-05-03',4,20,NULL,NULL,NULL,NULL,'100073865428','03576','1525209','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:14','2018-11-17 10:01:14',0,0,NULL,'0','1991-05-03',NULL,0,NULL,NULL),(42,42,'1991-05-07',8,8,NULL,NULL,NULL,NULL,'100269337656','03659','1666136','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1991-05-07',NULL,0,NULL,NULL),(43,43,'1992-07-22',10,22,NULL,NULL,NULL,NULL,'100178279586','03746','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,38,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1992-07-22',NULL,0,NULL,NULL),(44,44,'1992-11-17',4,2,NULL,NULL,NULL,NULL,'100337905468','03717','1666073','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1992-11-17',NULL,0,NULL,NULL),(45,45,'1992-11-17',2,2,NULL,NULL,NULL,NULL,'100193133936','03721','1666137','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1992-11-17',NULL,0,NULL,NULL),(46,46,'1995-09-05',9,23,NULL,NULL,NULL,NULL,'100217535806','03976','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,49,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1995-09-05',NULL,0,NULL,NULL),(47,47,'1996-04-25',5,24,NULL,NULL,NULL,NULL,'100133278526','04099','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,50,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1996-04-25',NULL,0,NULL,NULL),(48,48,'2000-06-05',12,25,NULL,NULL,NULL,NULL,'100343017522','04387','2435469','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2000-06-05',NULL,0,NULL,NULL),(49,49,'2001-02-01',5,26,NULL,NULL,NULL,NULL,'100213178044','04419','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,46,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2001-02-01',NULL,0,NULL,NULL),(50,50,'2002-06-05',14,25,NULL,NULL,NULL,NULL,'100396790066','04486','0591502','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2002-06-05',NULL,0,NULL,NULL),(51,51,'2002-11-07',5,27,NULL,NULL,NULL,NULL,'100169643927','04518','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2002-11-07',NULL,0,NULL,NULL),(52,52,'2000-02-01',10,28,NULL,NULL,NULL,NULL,'100329062583','04586','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,52,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2000-02-01',NULL,0,NULL,NULL),(53,53,'2000-05-02',9,29,NULL,NULL,NULL,NULL,'100236629762','04587','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2000-05-02',NULL,0,NULL,NULL),(54,54,'2000-10-20',5,30,NULL,NULL,NULL,NULL,'100137461392','04590','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,54,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2000-10-20',NULL,0,NULL,NULL),(55,55,'2003-06-01',7,31,NULL,NULL,NULL,NULL,'100137258178','04594','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,55,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2003-06-01',NULL,0,NULL,NULL),(56,56,'2004-02-23',12,32,NULL,NULL,NULL,NULL,'100271381182','04688','2639924','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-02-23',NULL,0,NULL,NULL),(57,57,'2004-07-26',7,6,NULL,NULL,NULL,NULL,'100187653885','04839','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,56,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-07-26',NULL,0,NULL,NULL),(58,58,'2004-08-12',5,30,NULL,NULL,NULL,NULL,'100198517275','04856','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,54,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-08-12',NULL,0,NULL,NULL),(59,59,'2004-09-03',5,33,NULL,NULL,NULL,NULL,'100153185713','04891','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,57,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-09-03',NULL,0,NULL,NULL),(60,60,'2004-09-21',5,34,NULL,NULL,NULL,NULL,'100238799380','04902','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-09-21',NULL,0,NULL,NULL),(61,61,'2004-09-23',7,6,NULL,NULL,NULL,NULL,'100187680898','04692','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-09-23',NULL,0,NULL,NULL),(62,62,'2004-10-05',7,6,NULL,NULL,NULL,NULL,'100252900493','04911','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-10-05',NULL,0,NULL,NULL),(63,63,'2004-10-28',5,35,NULL,NULL,NULL,NULL,'100167605537','04934','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,59,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-10-28',NULL,0,NULL,NULL),(64,64,'2004-11-15',5,36,NULL,NULL,NULL,NULL,'100189220883','04952','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-11-15',NULL,0,NULL,NULL),(65,65,'2004-11-16',5,37,NULL,NULL,NULL,NULL,'100350857822','04953','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2004-11-16',NULL,0,NULL,NULL),(66,66,'2005-01-01',14,8,NULL,NULL,NULL,NULL,'100152064861','04605','2639601','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,60,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-01-01',NULL,0,NULL,NULL),(67,67,'2005-01-01',12,38,NULL,NULL,NULL,NULL,'100113018108','05006','2633295','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,60,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-01-01',NULL,0,NULL,NULL),(68,68,'2005-01-01',14,14,NULL,NULL,NULL,NULL,'100149087005','04608','2639932','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-01-01',NULL,0,NULL,NULL),(69,69,'2005-03-29',5,39,NULL,NULL,NULL,NULL,'100217565889','04907','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,46,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-03-29',NULL,0,NULL,NULL),(70,70,'2000-04-01',9,40,NULL,NULL,NULL,NULL,'100125489056','04720','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2000-04-01',NULL,0,NULL,NULL),(71,71,'2005-05-09',5,41,NULL,NULL,NULL,NULL,'100309660433','05113','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-05-09',NULL,0,NULL,NULL),(72,72,'2005-09-26',12,20,NULL,NULL,NULL,NULL,'100269918592','05025','2866579','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-09-26',NULL,0,NULL,NULL),(73,73,'2005-09-26',14,20,NULL,NULL,NULL,NULL,'100269919394','05027','2728406','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-09-26',NULL,0,NULL,NULL),(74,74,'2005-09-26',14,20,NULL,NULL,NULL,NULL,'100350926625','05028','2866578','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-09-26',NULL,0,NULL,NULL),(75,75,'2005-09-26',12,20,NULL,NULL,NULL,NULL,'100216175553','05026','2722913','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-09-26',NULL,0,NULL,NULL),(76,76,'2005-10-17',5,42,NULL,NULL,NULL,NULL,'100178287690','05021','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-10-17',NULL,0,NULL,NULL),(77,77,'2005-12-01',7,43,NULL,NULL,NULL,NULL,'100073798377','05344','3308124785','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2005-12-01',NULL,0,NULL,NULL),(78,78,'1984-07-25',14,44,NULL,NULL,NULL,NULL,'100228085588','04727','3113258','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','1984-07-25',NULL,0,NULL,NULL),(79,79,'2006-02-01',14,2,NULL,NULL,NULL,NULL,'100133455113','04821','2758783','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,55,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-02-01',NULL,0,NULL,NULL),(80,80,'2006-02-01',14,2,NULL,NULL,NULL,NULL,'100197271598','04773','2721191','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,55,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-02-01',NULL,0,NULL,NULL),(81,81,'2006-02-11',14,45,NULL,NULL,NULL,NULL,'100165219300','04808','2758487','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-02-11',NULL,0,NULL,NULL),(82,82,'2006-02-11',12,46,NULL,NULL,NULL,NULL,'100216613793','04803','2442063','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-02-11',NULL,0,NULL,NULL),(83,83,'2006-03-01',12,2,NULL,NULL,NULL,NULL,'100198528248','04827','2152140','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,63,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-03-01',NULL,0,NULL,NULL),(84,84,'2006-03-03',14,2,NULL,NULL,NULL,NULL,'100350897029','05200','2929711','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-03-03',NULL,0,NULL,NULL),(85,85,'2006-04-14',14,47,NULL,NULL,NULL,NULL,'100193007297','05102','2869318','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-04-14',NULL,0,NULL,NULL),(86,86,'2006-04-18',14,46,NULL,NULL,NULL,NULL,'100152112914','04927','2119755','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:15','2018-11-17 10:01:15',0,0,NULL,'0','2006-04-18',NULL,0,NULL,NULL),(87,87,'2006-04-29',12,46,NULL,NULL,NULL,NULL,'100187675357','04826','2796182','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-04-29',NULL,0,NULL,NULL),(88,88,'2006-04-29',14,47,NULL,NULL,NULL,NULL,'100133391144','04828','2721712','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-04-29',NULL,0,NULL,NULL),(89,89,'2006-05-03',14,47,NULL,NULL,NULL,NULL,'100254462977','05592','1936187','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-05-03',NULL,0,NULL,NULL),(90,90,'2006-05-03',14,47,NULL,NULL,NULL,NULL,'100205858347','05192','2929528','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-05-03',NULL,0,NULL,NULL),(91,91,'2006-05-13',12,2,NULL,NULL,NULL,NULL,'100129170378','05103','2869319','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-05-13',NULL,0,NULL,NULL),(92,92,'2006-05-28',14,2,NULL,NULL,NULL,NULL,'100351126885','04744','2727873','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-05-28',NULL,0,NULL,NULL),(93,93,'2006-06-11',12,45,NULL,NULL,NULL,NULL,'100343020003','05066','2756451','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-11',NULL,0,NULL,NULL),(94,94,'2006-06-12',7,6,NULL,NULL,NULL,NULL,'100254392497','05641','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,65,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-12',NULL,0,NULL,NULL),(95,95,'2006-06-14',12,45,NULL,NULL,NULL,NULL,'100072220917','04955','2436340','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-14',NULL,0,NULL,NULL),(96,96,'2006-06-14',12,47,NULL,NULL,NULL,NULL,'100329107308','05104','2869320','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-14',NULL,0,NULL,NULL),(97,97,'2006-06-23',7,6,NULL,NULL,NULL,NULL,'100413790970','05647','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,54,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-23',NULL,0,NULL,NULL),(98,98,'2006-06-28',14,38,NULL,NULL,NULL,NULL,'100133454993','05053','2642643','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-28',NULL,0,NULL,NULL),(99,99,'2006-06-28',12,8,NULL,NULL,NULL,NULL,'100195409467','05054','2867720','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-28',NULL,0,NULL,NULL),(100,100,'2006-06-28',12,2,NULL,NULL,NULL,NULL,'100329108335','04793','2447867','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-06-28',NULL,0,NULL,NULL),(101,101,'2006-07-01',5,48,NULL,NULL,NULL,NULL,'100311918589','05651','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-07-01',NULL,0,NULL,NULL),(102,102,'2006-07-16',12,47,NULL,NULL,NULL,NULL,'100270901801','05340','2933067','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-07-16',NULL,0,NULL,NULL),(103,103,'2006-08-18',5,49,NULL,NULL,NULL,NULL,'100124569874','05690','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,66,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-08-18',NULL,0,NULL,NULL),(104,104,'2006-09-11',14,8,NULL,NULL,NULL,NULL,'100112924065','05324','2933051','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-11',NULL,0,NULL,NULL),(105,105,'2006-09-16',12,8,NULL,NULL,NULL,NULL,'100198501647','05323','2933050','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-16',NULL,0,NULL,NULL),(106,106,'2006-09-22',9,50,NULL,NULL,NULL,NULL,'100231328739','05730','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-22',NULL,0,NULL,NULL),(107,107,'2006-09-23',7,6,NULL,NULL,NULL,NULL,'100273125906','05740','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,67,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-23',NULL,0,NULL,NULL),(108,108,'2006-09-27',12,14,NULL,NULL,NULL,NULL,'100271380836','05767','3112319','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-27',NULL,0,NULL,NULL),(109,109,'2006-09-27',14,12,NULL,NULL,NULL,NULL,'100169617394','05768','3112320','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-09-27',NULL,0,NULL,NULL),(110,110,'2006-10-01',12,8,NULL,NULL,NULL,NULL,'100192307073','05239','2930999','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-01',NULL,0,NULL,NULL),(111,111,'2006-10-01',14,8,NULL,NULL,NULL,NULL,'100340128743','05238','2930998','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-01',NULL,0,NULL,NULL),(112,112,'2006-10-06',5,51,NULL,NULL,NULL,NULL,'100198510672','05818','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-06',NULL,0,NULL,NULL),(113,113,'2006-10-10',12,46,NULL,NULL,NULL,NULL,'100350876655','05194','2929529','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-10',NULL,0,NULL,NULL),(114,114,'2006-10-10',12,47,NULL,NULL,NULL,NULL,'100133379840','05195','2929530','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-10',NULL,0,NULL,NULL),(115,115,'2006-10-10',8,47,NULL,NULL,NULL,NULL,'100169624970','05177','2928821','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-10',NULL,0,NULL,NULL),(116,116,'2006-10-13',12,47,NULL,NULL,NULL,NULL,'100217598187','05157','2928204','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-13',NULL,0,NULL,NULL),(117,117,'2006-10-13',12,47,NULL,NULL,NULL,NULL,'100269816571','05158','2928203','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-13',NULL,0,NULL,NULL),(118,118,'2006-10-14',14,47,NULL,NULL,NULL,NULL,'100350869200','05205','2930045','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-14',NULL,0,NULL,NULL),(119,119,'2006-10-14',14,46,NULL,NULL,NULL,NULL,'100231011806','05183','2929015','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-14',NULL,0,NULL,NULL),(120,120,'2006-10-26',12,47,NULL,NULL,NULL,NULL,'100136593605','05274','2930997','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-26',NULL,0,NULL,NULL),(121,121,'2006-10-26',14,2,NULL,NULL,NULL,NULL,'100351106770','05273','2930996','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,55,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-10-26',NULL,0,NULL,NULL),(122,122,'2006-11-13',12,38,NULL,NULL,NULL,NULL,'100105215803','05269','2862752','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,54,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-11-13',NULL,0,NULL,NULL),(123,123,'2006-11-17',12,47,NULL,NULL,NULL,NULL,'100270911593','05265','2448759','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-11-17',NULL,0,NULL,NULL),(124,124,'2006-11-21',12,47,NULL,NULL,NULL,NULL,'100096862436','05282','2931867','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-11-21',NULL,0,NULL,NULL),(125,125,'2006-12-20',14,45,NULL,NULL,NULL,NULL,'100194937849','05612','2721718','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2006-12-20',NULL,0,NULL,NULL),(126,126,'2007-01-01',7,43,NULL,NULL,NULL,NULL,'100188345645','05374','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,68,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-01-01',NULL,0,NULL,NULL),(127,127,'2007-02-05',9,52,NULL,NULL,NULL,NULL,'100213179433','06018','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-02-05',NULL,0,NULL,NULL),(128,128,'2007-02-22',14,53,NULL,NULL,NULL,NULL,'100206357788','06058','3056402','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,47,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-02-22',NULL,0,NULL,NULL),(129,129,'2007-02-23',14,7,NULL,NULL,NULL,NULL,'100192891332','06060','2930543','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-02-23',NULL,0,NULL,NULL),(130,130,'2007-03-14',14,8,NULL,NULL,NULL,NULL,'100413770867','06115','3380870','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-03-14',NULL,0,NULL,NULL),(131,131,'2007-03-26',9,54,NULL,NULL,NULL,NULL,'100226863143','06143','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,68,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-03-26',NULL,0,NULL,NULL),(132,132,'2007-05-10',7,55,NULL,NULL,NULL,NULL,'100124593707','06271','3308130129','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-05-10',NULL,0,NULL,NULL),(133,133,'2007-05-10',5,56,NULL,NULL,NULL,NULL,'100223118665','06272','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-05-10',NULL,0,NULL,NULL),(134,134,'2007-05-14',7,55,NULL,NULL,NULL,NULL,'100251876568','06278','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-05-14',NULL,0,NULL,NULL),(135,135,'2007-05-14',13,57,NULL,NULL,NULL,NULL,'100170979520','06304','3301554844','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,69,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:16','2018-11-17 10:01:16',0,0,NULL,'0','2007-05-14',NULL,0,NULL,NULL),(136,136,'2007-05-14',13,57,NULL,NULL,NULL,NULL,'100217588774','06305','3302080950','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,69,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-05-14',NULL,0,NULL,NULL),(137,137,'2007-05-21',7,6,NULL,NULL,NULL,NULL,'100110413202','06317','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,36,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-05-21',NULL,0,NULL,NULL),(138,138,'2007-05-24',5,58,NULL,NULL,NULL,NULL,'100130130217','06334','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-05-24',NULL,0,NULL,NULL),(139,139,'2007-05-25',5,59,NULL,NULL,NULL,NULL,'100141468445','06338','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-05-25',NULL,0,NULL,NULL),(140,140,'2007-06-01',12,60,NULL,NULL,NULL,NULL,'100312134331','06367','3302228884','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-06-01',NULL,0,NULL,NULL),(141,141,'2007-06-11',12,61,NULL,NULL,NULL,NULL,'100309349569','06370','3303385688','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-06-11',NULL,0,NULL,NULL),(142,142,'2007-07-03',5,62,NULL,NULL,NULL,NULL,'100096918481','06415','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,66,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-07-03',NULL,0,NULL,NULL),(143,143,'2007-07-02',12,25,NULL,NULL,NULL,NULL,'100170299668','06479','3303388721','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,33,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-07-02',NULL,0,NULL,NULL),(144,144,'2007-10-19',14,8,NULL,NULL,NULL,NULL,'100193555483','05874','3303114633','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(145,145,'2007-10-19',12,14,NULL,NULL,NULL,NULL,'100160076464','05450','3303102289','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(146,146,'2007-10-19',12,45,NULL,NULL,NULL,NULL,'100216155661','05705','3302720712','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(147,147,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100169643936','05298','3302932250','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(148,148,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100345692189','05549','3303103459','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(149,149,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100269975446','05434','3303102283','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(150,150,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100360613163','05646','3303100924','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(151,151,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100271381336','05462','3303102274','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(152,152,'2007-10-19',12,63,NULL,NULL,NULL,NULL,'100192970386','05752','3302720786','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,55,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(153,153,'2007-10-19',12,8,NULL,NULL,NULL,NULL,'100129277701','05854','3303113557','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(154,154,'2007-10-19',12,45,NULL,NULL,NULL,NULL,'100133337882','05904','3303115505','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(155,155,'2007-10-19',14,64,NULL,NULL,NULL,NULL,'100350909406','05842','3302933059','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,70,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(156,156,'2007-10-19',12,45,NULL,NULL,NULL,NULL,'100124416014','05460','3303102272','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(157,157,'2007-10-19',12,46,NULL,NULL,NULL,NULL,'100329100375','05502','3303102544','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(158,158,'2007-10-19',14,8,NULL,NULL,NULL,NULL,'100074578560','05699','3303111465','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(159,159,'2007-10-19',12,14,NULL,NULL,NULL,NULL,'100269874215','05422','3303102270','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(160,160,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100265531699','05755','3303112308','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(161,161,'2007-10-19',12,2,NULL,NULL,NULL,NULL,'100269395622','05545','3303103455','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(162,162,'2007-10-19',12,16,NULL,NULL,NULL,NULL,'100169627161','05731','3303111901','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(163,163,'2007-10-19',14,8,NULL,NULL,NULL,NULL,'100195156489','05855','3303113558','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(164,164,'2007-10-19',12,16,NULL,NULL,NULL,NULL,'100134616567','05766','3302929523','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(165,165,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100199053062','05833','3303113560','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(166,166,'2007-10-19',12,67,NULL,NULL,NULL,NULL,'100185040804','05470','3303001381','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(167,167,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100124564571','05443','3303102287','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(168,168,'2007-10-19',14,68,NULL,NULL,NULL,NULL,'100216174114','05960','3303117071','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(169,169,'2007-10-19',14,14,NULL,NULL,NULL,NULL,'100171960814','05509','3303103102','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(170,170,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100105097890','04737','3302756162','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(171,171,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100337905241','05757','3303112310','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,71,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(172,172,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100265511431','05524','3302030039','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(173,173,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100077688245','05709','3303111886','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(174,174,'2007-10-19',12,14,NULL,NULL,NULL,NULL,'100157359406','05622','3303106411','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(175,175,'2007-10-19',12,8,NULL,NULL,NULL,NULL,'100165232913','05843','3302933058','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,43,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(176,176,'2007-10-19',15,20,NULL,NULL,NULL,NULL,'100169692492','05517','3308198366','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(177,177,'2007-10-19',12,8,NULL,NULL,NULL,NULL,'100197383014','05595','3303106475','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(178,178,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100350857833','05539','3303103452','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(179,179,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100206049821','05764','3303112317','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(180,180,'2007-10-19',14,8,NULL,NULL,NULL,NULL,'100342637809','05692','3303110525','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(181,181,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100269847022','05890','3303115182','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(182,182,'2007-10-19',14,8,NULL,NULL,NULL,NULL,'100375465130','05748','3303112302','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(183,183,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100270912053','05471','3301944643','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,41,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(184,184,'2007-10-19',12,46,NULL,NULL,NULL,NULL,'100141400968','05802','3303015302','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(185,185,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100309658624','05423','3303100851','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:17','2018-11-17 10:01:17',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(186,186,'2007-10-19',14,47,NULL,NULL,NULL,NULL,'100129722782','05710','3303111887','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(187,187,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100213259478','05758','3303112311','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(188,188,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100198517193','05557','3303104802','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(189,189,'2007-10-19',12,47,NULL,NULL,NULL,NULL,'100124647289','05396','3302449387','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2007-10-19',NULL,0,NULL,NULL),(190,190,'2007-11-03',5,65,NULL,NULL,NULL,NULL,'100124447418','06310','3303383493','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,72,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2007-11-03',NULL,0,NULL,NULL),(191,191,'2008-02-01',7,6,NULL,NULL,NULL,NULL,'100152106052','06925','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,73,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-02-01',NULL,0,NULL,NULL),(192,192,'2008-02-01',8,45,NULL,NULL,NULL,NULL,'100117062173','06087','3380463','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-02-01',NULL,0,NULL,NULL),(193,193,'2008-02-01',8,45,NULL,NULL,NULL,NULL,'100110432995','06094','2162754','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-02-01',NULL,0,NULL,NULL),(194,194,'2008-02-01',14,45,NULL,NULL,NULL,NULL,'100311745499','06088','1713355','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-02-01',NULL,0,NULL,NULL),(195,195,'2008-02-01',9,66,NULL,NULL,NULL,NULL,'100228040308','06089','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-02-01',NULL,0,NULL,NULL),(196,196,'2008-03-01',14,45,NULL,NULL,NULL,NULL,'100169679593','06263','3383941','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(197,197,'2008-03-01',8,45,NULL,NULL,NULL,NULL,'100329112039','06218','3383474','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(198,198,'2008-03-01',14,8,NULL,NULL,NULL,NULL,'100170969180','06340','3384823','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(199,199,'2008-03-01',8,45,NULL,NULL,NULL,NULL,'100231769397','06241','3383923','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(200,200,'2008-03-01',14,45,NULL,NULL,NULL,NULL,'100350954532','06219','3383475','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(201,201,'2008-03-01',8,8,NULL,NULL,NULL,NULL,'100265511703','06251','3383933','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-03-01',NULL,0,NULL,NULL),(202,202,'2008-04-01',14,45,NULL,NULL,NULL,NULL,'100129170456','06240','3383922','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-01',NULL,0,NULL,NULL),(203,203,'2008-04-01',8,16,NULL,NULL,NULL,NULL,'100187693928','06052','3383934','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-01',NULL,0,NULL,NULL),(204,204,'2008-04-01',3,69,NULL,NULL,NULL,NULL,'100109065206','06259','3303383951','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-01',NULL,0,NULL,NULL),(205,205,'2008-04-01',14,8,NULL,NULL,NULL,NULL,'100350093884','06321','3303117047','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-01',NULL,0,NULL,NULL),(206,206,'2008-04-16',5,34,NULL,NULL,NULL,NULL,'100390021353','07033','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-16',NULL,0,NULL,NULL),(207,207,'2008-04-16',5,70,NULL,NULL,NULL,NULL,'100248522977','07034','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,47,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-16',NULL,0,NULL,NULL),(208,208,'2008-04-30',14,47,NULL,NULL,NULL,NULL,'100413762738','07060','3303743688','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-30',NULL,0,NULL,NULL),(209,209,'2008-04-30',14,47,NULL,NULL,NULL,NULL,'100213176560','07061','3303743687','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-04-30',NULL,0,NULL,NULL),(210,210,'2008-06-09',9,71,NULL,NULL,NULL,NULL,'100189980236','07148','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,52,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-06-09',NULL,0,NULL,NULL),(211,211,'2008-06-18',14,7,NULL,NULL,NULL,NULL,'100160342299','07154','3303393937','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,34,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-06-18',NULL,0,NULL,NULL),(212,212,'2008-07-04',10,72,NULL,NULL,NULL,NULL,'100248720407','07165','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-07-04',NULL,0,NULL,NULL),(213,213,'2008-07-14',5,73,NULL,NULL,NULL,NULL,'100124593711','07203','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-07-14',NULL,0,NULL,NULL),(214,214,'2008-07-14',7,6,NULL,NULL,NULL,NULL,'100112203082','07204','3303749101','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,74,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-07-14',NULL,0,NULL,NULL),(215,215,'2008-08-11',5,74,NULL,NULL,NULL,NULL,'100364902325','07283','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,75,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-08-11',NULL,0,NULL,NULL),(216,216,'2008-08-21',7,55,NULL,NULL,NULL,NULL,'100267868933','06553','3303389875','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,40,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-08-21',NULL,0,NULL,NULL),(217,217,'2008-08-21',7,43,NULL,NULL,NULL,NULL,'100265501397','06554','3303389876','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-08-21',NULL,0,NULL,NULL),(218,218,'2008-09-11',7,75,NULL,NULL,NULL,NULL,'100169602238','06575','3303390892','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,46,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-09-11',NULL,0,NULL,NULL),(219,219,'2008-09-15',5,76,NULL,NULL,NULL,NULL,'100137229467','07364','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,65,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2008-09-15',NULL,0,NULL,NULL),(220,220,'2009-02-01',7,77,NULL,NULL,NULL,NULL,'100350909410','07183','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,76,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-02-01',NULL,0,NULL,NULL),(221,221,'2009-05-27',7,6,NULL,NULL,NULL,NULL,'100337702346','07480','3304081678','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,77,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-05-27',NULL,0,NULL,NULL),(222,222,'2009-06-08',15,1,NULL,NULL,NULL,NULL,'100153152434','07486','3304082471','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,78,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-06-08',NULL,0,NULL,NULL),(223,223,'2009-06-10',7,55,NULL,NULL,NULL,NULL,'100338927601','07112','3303745824','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,52,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-06-10',NULL,0,NULL,NULL),(224,224,'2009-06-29',5,78,NULL,NULL,NULL,NULL,'100390004546','07493','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-06-29',NULL,0,NULL,NULL),(225,225,'2009-07-01',3,3,NULL,NULL,NULL,NULL,'100238084844','07494','3303730992','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,79,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-07-01',NULL,0,NULL,NULL),(226,226,'2009-07-22',5,79,NULL,NULL,NULL,NULL,'100208277804','07506','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-07-22',NULL,0,NULL,NULL),(227,227,'2009-08-13',7,55,NULL,NULL,NULL,NULL,'100388559100','07512','3304083863','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-08-13',NULL,0,NULL,NULL),(228,228,'2009-09-01',16,80,NULL,NULL,NULL,NULL,'100198943645','07522','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,52,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-09-01',NULL,0,NULL,NULL),(229,229,'2009-09-17',7,81,NULL,NULL,NULL,NULL,'100169835636','07278','3303751710','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,76,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-09-17',NULL,0,NULL,NULL),(230,230,'2009-09-17',7,43,NULL,NULL,NULL,NULL,'100213454585','07051','3301441325','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-09-17',NULL,0,NULL,NULL),(231,231,'2009-11-21',5,24,NULL,NULL,NULL,NULL,'100117094606','07548','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-11-21',NULL,0,NULL,NULL),(232,232,'2009-12-14',7,6,NULL,NULL,NULL,NULL,'100124586832','07597','3304421673','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,48,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:18','2018-11-17 10:01:18',0,0,NULL,'0','2009-12-14',NULL,0,NULL,NULL),(233,233,'2009-12-14',15,1,NULL,NULL,NULL,NULL,'100393959361','07598','0000000000','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,80,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2009-12-14',NULL,0,NULL,NULL),(234,234,'2010-02-01',7,6,NULL,NULL,NULL,NULL,'100112623805','07631','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,73,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-02-01',NULL,0,NULL,NULL),(235,235,'2010-02-19',7,55,NULL,NULL,NULL,NULL,'100270856595','07637','3304099795','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,52,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-02-19',NULL,0,NULL,NULL),(236,236,'2010-04-01',7,55,NULL,NULL,NULL,NULL,'100376477802','07667','3304421679','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-04-01',NULL,0,NULL,NULL),(237,237,'2010-04-12',5,94,NULL,NULL,NULL,NULL,'100391687902','07674','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-04-12',NULL,0,NULL,NULL),(238,238,'2010-04-26',15,1,NULL,NULL,NULL,NULL,'100171045691','07683','3302980043','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,74,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-04-26',NULL,0,NULL,NULL),(239,239,'2010-04-26',15,1,NULL,NULL,NULL,NULL,'100189983168','07684','3304094865','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,74,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-04-26',NULL,0,NULL,NULL),(240,240,'2010-05-10',15,8,NULL,NULL,NULL,NULL,'100112933668','06988','3302279754','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-05-10',NULL,0,NULL,NULL),(241,241,'2010-05-18',15,8,NULL,NULL,NULL,NULL,'100350876601','07696','3303117674','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-05-18',NULL,0,NULL,NULL),(242,242,'2010-06-14',7,6,NULL,NULL,NULL,NULL,'100130056003','07728','3308130312','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-06-14',NULL,0,NULL,NULL),(243,243,'2010-06-21',7,6,NULL,NULL,NULL,NULL,'100265201141','07733','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,81,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-06-21',NULL,0,NULL,NULL),(244,244,'2010-06-28',15,2,NULL,NULL,NULL,NULL,'100413835453','07734','3302282066','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,74,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-06-28',NULL,0,NULL,NULL),(245,245,'2010-07-01',15,95,NULL,NULL,NULL,NULL,'100096780931','07744','3302931469','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,32,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-01',NULL,0,NULL,NULL),(246,246,'2010-07-01',15,47,NULL,NULL,NULL,NULL,'100185066716','07745','3303753144','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-01',NULL,0,NULL,NULL),(247,247,'2010-07-01',15,47,NULL,NULL,NULL,NULL,'100172503483','07746','3303418201','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-01',NULL,0,NULL,NULL),(248,248,'2010-07-14',15,1,NULL,NULL,NULL,NULL,'100352532479','07750','3304099289','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-14',NULL,0,NULL,NULL),(249,249,'2010-07-02',15,8,NULL,NULL,NULL,NULL,'100169627254','07752','3303106474','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-02',NULL,0,NULL,NULL),(250,250,'2010-07-15',7,6,NULL,NULL,NULL,NULL,'100124593690','07753','3304099287','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,36,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-15',NULL,0,NULL,NULL),(251,251,'2010-07-19',15,1,NULL,NULL,NULL,NULL,'100269918879','07786','0000000000','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-19',NULL,0,NULL,NULL),(252,252,'2010-07-26',15,20,NULL,NULL,NULL,NULL,'100343022863','07789','3303111883','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-26',NULL,0,NULL,NULL),(253,253,'2010-07-26',15,47,NULL,NULL,NULL,NULL,'100130542394','07794','3304099276','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-26',NULL,0,NULL,NULL),(254,254,'2010-07-29',15,96,NULL,NULL,NULL,NULL,'100256540572','07791','3304050636','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-07-29',NULL,0,NULL,NULL),(255,255,'2010-08-11',10,97,NULL,NULL,NULL,NULL,'100186061917','07801','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,76,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-08-11',NULL,0,NULL,NULL),(256,256,'2010-08-21',15,8,NULL,NULL,NULL,NULL,'100269798962','07804','3308150240','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-08-21',NULL,0,NULL,NULL),(257,257,'2010-09-02',15,1,NULL,NULL,NULL,NULL,'100115686907','07827','3304421685','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-02',NULL,0,NULL,NULL),(258,258,'2010-09-03',15,95,NULL,NULL,NULL,NULL,'100169692655','07828','3304421686','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-03',NULL,0,NULL,NULL),(259,259,'2010-09-07',15,47,NULL,NULL,NULL,NULL,'100107494819','07712','3302441874','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(260,260,'2010-09-07',7,55,NULL,NULL,NULL,NULL,'100116793879','07832','3303814657','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(261,261,'2010-09-07',15,68,NULL,NULL,NULL,NULL,'100338091181','07833','3304421688','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(262,262,'2010-09-07',15,98,NULL,NULL,NULL,NULL,'100413732969','07834','3304421689','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(263,263,'2010-09-07',15,2,NULL,NULL,NULL,NULL,'100265787537','07836','3302930876','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,63,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(264,264,'2010-09-07',15,99,NULL,NULL,NULL,NULL,'100236675281','07837','3304301188','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(265,265,'2010-09-07',15,16,NULL,NULL,NULL,NULL,'100190155851','07838','3303974034','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-07',NULL,0,NULL,NULL),(266,266,'2010-09-13',7,6,NULL,NULL,NULL,NULL,'100350962353','07840','3303963424','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,58,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-13',NULL,0,NULL,NULL),(267,267,'2010-09-15',15,8,NULL,NULL,NULL,NULL,'100126503871','07841','3304030450','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-09-15',NULL,0,NULL,NULL),(268,268,'2010-11-01',7,6,NULL,NULL,NULL,NULL,'100413909856','07879','3304609577','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,82,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-11-01',NULL,0,NULL,NULL),(269,269,'2010-11-19',7,55,NULL,NULL,NULL,NULL,'100269918776','07887','3304628532','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,62,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-11-19',NULL,0,NULL,NULL),(270,270,'2010-11-22',9,100,NULL,NULL,NULL,NULL,'100195549279','07888','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-11-22',NULL,0,NULL,NULL),(271,271,'2010-12-01',7,6,NULL,NULL,NULL,NULL,'100112832091','07897','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-01',NULL,0,NULL,NULL),(272,272,'2010-12-01',15,14,NULL,NULL,NULL,NULL,'100375454674','07898','3303169011','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-01',NULL,0,NULL,NULL),(273,273,'2010-12-01',15,14,NULL,NULL,NULL,NULL,'100269983162','07902','3304862237','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-01',NULL,0,NULL,NULL),(274,274,'2010-12-13',15,2,NULL,NULL,NULL,NULL,'100359225833','07903','3304628561','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,80,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-13',NULL,0,NULL,NULL),(275,275,'2010-12-13',7,6,NULL,NULL,NULL,NULL,'100391477947','07904','3304628842','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,58,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-13',NULL,0,NULL,NULL),(276,276,'2010-12-23',7,43,NULL,NULL,NULL,NULL,'100160341533','07911','3304632330','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2010-12-23',NULL,0,NULL,NULL),(277,277,'2011-01-10',15,47,NULL,NULL,NULL,NULL,'100269874291','07925','3304315939','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2011-01-10',NULL,0,NULL,NULL),(278,278,'2011-01-10',15,47,NULL,NULL,NULL,NULL,'100270938413','07927','3304660197','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:19','2018-11-17 10:01:19',0,0,NULL,'0','2011-01-10',NULL,0,NULL,NULL),(279,279,'2011-01-01',15,8,NULL,NULL,NULL,NULL,'100223886821','07552','3304088557','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-01',NULL,0,NULL,NULL),(280,280,'2011-01-01',15,8,NULL,NULL,NULL,NULL,'100137236740','07556','3304088561','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-01',NULL,0,NULL,NULL),(281,281,'2011-01-01',15,8,NULL,NULL,NULL,NULL,'100413791855','07555','3304088560','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-01',NULL,0,NULL,NULL),(282,282,'2011-01-01',15,95,NULL,NULL,NULL,NULL,'100121860539','07557','3304088562','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-01',NULL,0,NULL,NULL),(283,283,'2011-01-01',15,20,NULL,NULL,NULL,NULL,'100350889524','07550','3304022590','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-01',NULL,0,NULL,NULL),(284,284,'2011-01-20',5,101,NULL,NULL,NULL,NULL,'100343220341','07930','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-01-20',NULL,0,NULL,NULL),(285,285,'2011-02-07',15,102,NULL,NULL,NULL,NULL,'100248807040','07936','3304713964','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-02-07',NULL,0,NULL,NULL),(286,286,'2011-02-01',7,6,NULL,NULL,NULL,NULL,'100149692134','07938','3304713943','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,37,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-02-01',NULL,0,NULL,NULL),(287,287,'2011-02-15',7,55,NULL,NULL,NULL,NULL,'100329103661','07941','3303221592','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,72,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-02-15',NULL,0,NULL,NULL),(288,288,'2011-03-01',15,96,NULL,NULL,NULL,NULL,'100163398128','07954','3304975081','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-03-01',NULL,0,NULL,NULL),(289,289,'2011-03-08',5,103,NULL,NULL,NULL,NULL,'100116861037','07957','3304764708','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,83,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-03-08',NULL,0,NULL,NULL),(290,290,'2011-03-08',15,1,NULL,NULL,NULL,NULL,'100079425138','07958','0000000000','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-03-08',NULL,0,NULL,NULL),(291,291,'2011-03-17',9,104,NULL,NULL,NULL,NULL,'100260886997','07963','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-03-17',NULL,0,NULL,NULL),(292,292,'2011-04-18',7,55,NULL,NULL,NULL,NULL,'100164974863','07973','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-04-18',NULL,0,NULL,NULL),(293,293,'2011-06-07',15,8,NULL,NULL,NULL,NULL,'100187672393','07995','3304956827','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,37,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-06-07',NULL,0,NULL,NULL),(294,294,'2011-06-15',15,102,NULL,NULL,NULL,NULL,'100195416256','07996','3304956835','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-06-15',NULL,0,NULL,NULL),(295,295,'2011-07-01',5,105,NULL,NULL,NULL,NULL,'100171557041','08007','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-07-01',NULL,0,NULL,NULL),(296,296,'2011-07-01',7,106,NULL,NULL,NULL,NULL,'100204119712','08010','3303394812','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,83,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-07-01',NULL,0,NULL,NULL),(297,297,'2011-08-01',15,45,NULL,NULL,NULL,NULL,'100307014061','08039','3303123656','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(298,298,'2011-08-01',7,55,NULL,NULL,NULL,NULL,'100375456209','08040','3303385983','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(299,299,'2011-08-01',15,45,NULL,NULL,NULL,NULL,'100343022892','08041','3303748736','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(300,300,'2011-08-01',7,55,NULL,NULL,NULL,NULL,'100350142549','08042','3303344706','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(301,301,'2011-08-01',15,107,NULL,NULL,NULL,NULL,'100112802409','08043','3303117681','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(302,302,'2011-08-01',15,16,NULL,NULL,NULL,NULL,'100133448218','08044','3302934043','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,62,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(303,303,'2011-08-01',7,55,NULL,NULL,NULL,NULL,'100199015520','08045','3303792780','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(304,304,'2011-08-01',15,108,NULL,NULL,NULL,NULL,'100269783925','08046','3305074243','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(305,305,'2011-08-01',15,45,NULL,NULL,NULL,NULL,'100191386610','08047','3303383479','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(306,306,'2011-08-01',15,47,NULL,NULL,NULL,NULL,'100255858575','08048','3302640370','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(307,307,'2011-08-01',15,108,NULL,NULL,NULL,NULL,'100152319692','08050','3303749098','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(308,308,'2011-08-01',15,109,NULL,NULL,NULL,NULL,'100206356330','08051','3303804691','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(309,309,'2011-08-01',15,109,NULL,NULL,NULL,NULL,'100206356655','08052','3303385642','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(310,310,'2011-08-01',7,55,NULL,NULL,NULL,NULL,'100217585680','08053','3303748732','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(311,311,'2011-08-01',15,2,NULL,NULL,NULL,NULL,'100413927941','08055','3308150274','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(312,312,'2011-08-01',15,14,NULL,NULL,NULL,NULL,'100152059513','08056','3304641788','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,44,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(313,313,'2011-08-01',7,55,NULL,NULL,NULL,NULL,'100185684241','08057','3303289286','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,62,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-01',NULL,0,NULL,NULL),(314,314,'2011-08-16',7,6,NULL,NULL,NULL,NULL,'100137118833','08066','3301428535','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,56,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-16',NULL,0,NULL,NULL),(315,315,'2011-08-25',7,43,NULL,NULL,NULL,NULL,'100351116439','08070','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-25',NULL,0,NULL,NULL),(316,316,'2011-08-30',5,110,NULL,NULL,NULL,NULL,'100155835509','08075','3303061433','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,64,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-08-30',NULL,0,NULL,NULL),(317,317,'2011-09-15',5,24,NULL,NULL,NULL,NULL,'100391945607','08080','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,48,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-09-15',NULL,0,NULL,NULL),(318,318,'2011-11-24',15,16,NULL,NULL,NULL,NULL,'100137082097','08133','3305207385','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-11-24',NULL,0,NULL,NULL),(319,319,'2011-11-30',7,6,NULL,NULL,NULL,NULL,'100350884222','08137','3303394487','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,55,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-11-30',NULL,0,NULL,NULL),(320,320,'2011-12-01',7,106,NULL,NULL,NULL,NULL,'100160160826','08139','3302088926','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,83,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2011-12-01',NULL,0,NULL,NULL),(321,321,'2012-01-05',7,55,NULL,NULL,NULL,NULL,'100198503873','08158','3302168555','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-01-05',NULL,0,NULL,NULL),(322,322,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100107704170','08183','3303979031','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,31,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(323,323,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100124434336','08184','3305194511','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(324,324,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100269834689','08185','3303974113','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,31,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(325,325,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100185061660','08186','3304277753','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,31,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(326,326,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100270863498','08187','3303814693','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(327,327,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100171717057','08190','3302866591','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:20','2018-11-17 10:01:20',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(328,328,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100376474306','08191','3304676719','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(329,329,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100220723089','08192','3303805404','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(330,330,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100337863275','08193','3303974025','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,62,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(331,331,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100311928421','08194','3303166662','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,31,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(332,332,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100167615675','08195','3303814594','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,62,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(333,333,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100140390425','08196','3303747523','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(334,334,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100309646227','08197','3302112417','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,31,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(335,335,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100413789456','08198','3301664807','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(336,336,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100130780262','08199','3303974115','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,44,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(337,337,'2012-03-01',7,55,NULL,NULL,NULL,NULL,'100217585740','08201','3305015236','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,39,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-03-01',NULL,0,NULL,NULL),(338,338,'2012-05-05',7,55,NULL,NULL,NULL,NULL,'100265534094','08217','3305472946','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,39,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-05-05',NULL,0,NULL,NULL),(339,339,'2013-02-27',7,6,NULL,NULL,NULL,NULL,'100360613205','08211','3305412404','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,58,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2013-02-27',NULL,0,NULL,NULL),(340,340,'2014-04-08',9,92,NULL,NULL,NULL,NULL,'100000516499','08267','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,76,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2014-04-08',NULL,0,NULL,NULL),(341,341,'2014-08-06',7,43,NULL,NULL,NULL,NULL,'100438289358','08271','3308124334','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,61,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2014-08-06',NULL,0,NULL,NULL),(342,342,'2015-12-01',7,6,NULL,NULL,NULL,NULL,'100217411405','08245','3308122706','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,48,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2015-12-01',NULL,0,NULL,NULL),(343,343,'2016-01-01',9,93,NULL,NULL,NULL,NULL,'101073788222','08280','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,31,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2016-01-01',NULL,0,NULL,NULL),(344,344,'2016-07-22',15,47,NULL,NULL,NULL,NULL,'101073788192','08286','3304094863','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,58,4,NULL,'1.0',1,1,NULL,0,1,1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2016-07-22',NULL,0,NULL,NULL),(345,345,'2016-09-02',5,101,NULL,NULL,NULL,NULL,'100094365606','08288','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,84,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2016-09-02',NULL,0,NULL,NULL),(346,346,'2016-10-07',7,55,NULL,NULL,NULL,NULL,'101186463024','08294','3307654924','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,84,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2016-10-07',NULL,0,NULL,NULL),(347,347,'2017-02-01',7,6,NULL,NULL,NULL,NULL,'101186463048','08304','3308198087','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,35,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-02-01',NULL,0,NULL,NULL),(348,348,'2017-02-03',7,6,NULL,NULL,NULL,NULL,'101186463599','08306','3308198131','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,36,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-02-03',NULL,0,NULL,NULL),(349,349,'2017-02-13',7,55,NULL,NULL,NULL,NULL,'101186463534','08307','3308198156','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,85,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-02-13',NULL,0,NULL,NULL),(350,350,'2017-03-07',7,55,NULL,NULL,NULL,NULL,'101186463069','08309','3308300625','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,35,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-03-07',NULL,0,NULL,NULL),(351,351,'2017-08-08',5,82,NULL,NULL,NULL,NULL,'100350909256','05018','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,51,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-08-08',NULL,0,NULL,NULL),(352,352,'2017-08-09',7,55,NULL,NULL,NULL,NULL,'101186463552','08313','3308855729','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,86,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-08-09',NULL,0,NULL,NULL),(353,353,'2017-12-23',7,6,NULL,NULL,NULL,NULL,'101186463581','18919','3308148260','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,36,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-12-23',NULL,0,NULL,NULL),(354,354,'2015-11-02',17,85,NULL,NULL,NULL,NULL,'100942887544','08279','3309101764','0.0','0.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,87,1,NULL,'0.0',0,1,NULL,0,1,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2015-11-02',NULL,0,NULL,NULL),(355,355,'2017-04-05',17,85,NULL,NULL,NULL,NULL,'101186463105','08311','3308463950','0.0','0.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,88,1,NULL,'0.0',0,1,NULL,0,1,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-04-05',NULL,0,NULL,NULL),(356,356,'2017-08-04',17,85,NULL,NULL,NULL,NULL,'101186463547','08314','3306699109','0.0','0.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,89,1,NULL,'0.0',0,1,NULL,0,1,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-08-04',NULL,0,NULL,NULL),(357,357,'1984-02-13',9,83,NULL,NULL,NULL,NULL,'100130560608','04719','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','1984-02-13',NULL,0,NULL,NULL),(358,358,'1983-07-12',5,84,NULL,NULL,NULL,NULL,'100329215068','04724','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','1983-07-12',NULL,0,NULL,NULL),(359,359,'1982-04-04',12,25,NULL,NULL,NULL,NULL,'100269655573','04723','3114640','0.0','30.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,90,3,NULL,'1.0',1,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','1982-04-04',NULL,0,NULL,NULL),(360,360,'2008-06-01',7,86,NULL,NULL,NULL,NULL,'100134760248','07249','3308130065','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2008-06-01',NULL,0,NULL,NULL),(361,361,'2009-05-12',9,87,NULL,NULL,NULL,NULL,'100247883733','07481','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2009-05-12',NULL,0,NULL,NULL),(362,362,'2010-11-18',5,88,NULL,NULL,NULL,NULL,'100269847235','07896','3308130023','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2010-11-18',NULL,0,NULL,NULL),(363,363,'2012-11-05',7,89,NULL,NULL,NULL,NULL,'100268820079','08244','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2012-11-05',NULL,0,NULL,NULL),(364,364,'2013-04-15',5,90,NULL,NULL,NULL,NULL,'100152098139','08256','0000000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,NULL,'0.0',0,1,NULL,0,1,0,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2013-04-15',NULL,0,NULL,NULL),(365,365,'2017-10-24',7,91,NULL,NULL,NULL,NULL,'101073788214','18896','3307261883','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,53,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2017-10-24',NULL,0,NULL,NULL),(366,366,'2018-02-12',7,86,NULL,NULL,NULL,NULL,'101254504609','18925','3309391699','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,53,2,NULL,'0.0',0,1,NULL,0,1,1,0,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-17 10:01:21','2018-11-17 10:01:21',0,0,NULL,'0','2018-02-12',NULL,0,NULL,NULL),(367,367,'1976-03-01',18,111,NULL,NULL,NULL,NULL,'100309150474','2221.0','0000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,91,2,1,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23',0,0,NULL,'0','1976-03-01',NULL,0,NULL,NULL),(368,368,'1982-03-02',16,112,NULL,NULL,NULL,NULL,'100300127950','6483.0','0000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,57,2,1,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23',0,0,NULL,'0','1982-03-02',NULL,0,NULL,NULL),(369,369,'1989-10-14',16,113,NULL,NULL,NULL,NULL,'100392144510','3469.0','0000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,92,2,1,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23',0,0,NULL,'0','1989-10-14',NULL,0,NULL,NULL),(370,370,'2004-11-01',16,114,NULL,NULL,NULL,NULL,'100390005339','5003.0','0000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,1,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23',0,0,NULL,'0','2004-11-01',NULL,0,NULL,NULL),(371,371,'1998-09-24',16,115,NULL,NULL,NULL,NULL,'100248520743','4721.0','0000000','0.0','90.0',NULL,NULL,'No','No',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,0,53,2,1,'0.0',0,1,NULL,0,1,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-20 06:46:23','2018-11-20 06:46:23',0,0,NULL,'0','1998-09-24',NULL,0,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (1,255,255,NULL,'2018-11-17',NULL,'2018-11-17 10:14:22','2018-11-17 10:14:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'6501',1,'EMP0000255',NULL,'cbkale@premier.co.in','$2a$10$KhVhebEKJkGW9Umoh0AtT.F/BrLgzoy/7.kLocVZnJZ3NsSr/1x7W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'2018-11-20 06:27:35','2018-11-19 11:01:06','127.0.0.1','192.168.13.249','2018-11-17 10:14:22','2018-11-20 06:27:35',1,1,17,255,NULL,NULL,NULL,NULL),(2,'3878',5,NULL,NULL,'3878@xyz.com','$2a$10$nUukoaBPk8XHUUhXlry8s.F/aNboQ8SWv.QDNkRCJGG3FX22/7SsG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:44','2018-11-19 12:40:09',1,1,NULL,51,NULL,NULL,NULL,NULL),(3,'6211',3,NULL,NULL,'6211@xyz.com','$2a$10$Sm9wiEiNii4mfipQ.RtwTOwYlOZVvzRLJVsw6fmW4ZXqDCHDxAQLG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:44','2018-11-19 12:40:09',1,1,NULL,213,NULL,NULL,NULL,NULL),(4,'5938',3,NULL,NULL,'5938@xyz.com','$2a$10$cDmxiKTPNdN4jeIAIrT85.5R6q0rHEKwe20uc026WO1hXdfKxgsRe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:09',1,1,NULL,145,NULL,NULL,NULL,NULL),(5,'5955',3,NULL,NULL,'5955@xyz.com','$2a$10$Z0tqBDt39YXXlhnJ3KUktOfiyx1qYe190CvpLRnyMhKUw4C0AhxZC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:09',1,1,NULL,159,NULL,NULL,NULL,NULL),(6,'5973',3,NULL,NULL,'5973@xyz.com','$2a$10$7lwhV4.ZgvfVCg9Gy1nF8ufnBX4E7OLqwUMQ7BaUmRHSjK8M9YC2W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,174,NULL,NULL,NULL,NULL),(7,'6712',3,NULL,NULL,'6712@xyz.com','$2a$10$GWFw8TIvpXfgl191DAvoXOEU5aHdUkSZ/erncCcY5FD1oWAaYb0v2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,312,NULL,NULL,NULL,NULL),(8,'5598',3,NULL,NULL,'5598@xyz.com','$2a$10$RxQBlpkOykapDzUykHIM7eUXyhA2Z83Zq7yzXwOZedFnmA7LY4WCy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,134,NULL,NULL,NULL,NULL),(9,'6826',3,NULL,NULL,'6826@xyz.com','$2a$10$pADVmv0712fksasLu40/yubMpvw6Hz9mgnMPobi1iofSLnsWzixbK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,336,NULL,NULL,NULL,NULL),(10,'6909',3,NULL,NULL,'6909@xyz.com','$2a$10$cXIvPTCt0WxD0V8qR2.sLupOrhOM42AmwB881CsvCNgbCdD2isb9i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,349,NULL,NULL,NULL,NULL),(11,'3152',3,NULL,NULL,'3152@xyz.com','$2a$10$Xj7wC7Anesj9fBvo/i1Uv.d6of22dpHe0q/OqikFMsO9ZYfJ9wzSe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:45','2018-11-19 12:40:10',1,1,NULL,39,NULL,NULL,NULL,NULL),(12,'6524',3,NULL,NULL,'6524@xyz.com','$2a$10$MKPgYDxmuXMtaBpKPS67NOR/geaCchOCf1NmjyNf8bwYsxjBwzAsi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:10',1,1,NULL,263,NULL,NULL,NULL,NULL),(13,'7072',3,NULL,NULL,'7072@xyz.com','$2a$10$RLj1LiUszDhK52yyJA1vx.eg6vzEkGlPJzwfQdB3YnWc6lf9QFUjW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:10',1,1,NULL,354,NULL,NULL,NULL,NULL),(14,'2525',3,NULL,NULL,'2525@xyz.com','$2a$10$ZRI1LGchKjKLTDqj4rbf.exLes9jqDSGBDLqhAmXSoOj7BB1OqhQe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:10',1,1,NULL,7,NULL,NULL,NULL,NULL),(15,'6468',3,NULL,NULL,'6468@xyz.com','$2a$10$.IJz4GYO5JaJwVQq8Cxv5Oq5QBmmVEUyWCym6pIByPm1Zdf7wH7vm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:10',1,5,NULL,242,NULL,NULL,NULL,NULL),(16,'5120',3,NULL,NULL,'5120@xyz.com','$2a$10$c5j.qt2jCU7Ubr1GHnglHuJ4ordyX63J23.scH7k0p1dT6nuD7I3O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:10',1,1,NULL,112,NULL,NULL,NULL,NULL),(17,'5726',3,NULL,NULL,'5726@xyz.com','$2a$10$v0YKoW1nV9BL8mPMns0GlOvodMuJecpOJ0oKXZ0cbxbyLXl62CQJK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 06:50:46','2018-11-19 12:40:11',1,5,NULL,142,NULL,NULL,NULL,NULL),(18,'7110',3,NULL,NULL,'7110@xyz.com','$2a$10$/Thz68o2.waudHVgYFYBxeTQmFhnUJply6hmPzaaWYXQglVgAIVwy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:40','2018-11-19 12:40:11',1,1,NULL,356,NULL,NULL,NULL,NULL),(19,'2798',3,NULL,NULL,'2798@xyz.com','$2a$10$nnpqeQDc1LMOCStJxvtis.4rdhkJuRk4douGZ6F0B/PPuaYsyOjOW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:40','2018-11-19 12:40:11',1,1,NULL,19,NULL,NULL,NULL,NULL),(20,'2538',5,NULL,NULL,'2538@xyz.com','$2a$10$..ngQV9hSZr/U/6//8das.3YLD/TvAUj3GDjT9RGZiSTKTQMEzr.C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,13,NULL,NULL,NULL,NULL),(21,'2955',3,NULL,NULL,'2955@xyz.com','$2a$10$NRW6y5JeXkaZlHQicxCOseqObewhol1MRC1bIiqZm/5P769zj1ap.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,23,NULL,NULL,NULL,NULL),(22,'6127',3,NULL,NULL,'6127@xyz.com','$2a$10$jW6kBI6GXCbjptC9Tc0vEuH7J9VLo1TWvLgUVAGAceYehUchqXybK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,191,NULL,NULL,NULL,NULL),(23,'6405',3,NULL,NULL,'6405@xyz.com','$2a$10$m95M7SQbMY5jvN0APyoDrOx2s3I4Gy16cJk2h8/kv159DwuCrrvVW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,234,NULL,NULL,NULL,NULL),(24,'6906',3,NULL,NULL,'6906@xyz.com','$2a$10$u6Fjy.guErqpQEc7wX0qAOYxaI/T4qM7Q6e9Krh82nurR/gEnJr8y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,347,NULL,NULL,NULL,NULL),(25,'3265',5,NULL,NULL,'3265@xyz.com','$2a$10$XRGCnEbaddlR4wWsxQxkX.u5htijeljKKN7Y9y52ezIR/7UCfKHG6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,43,NULL,NULL,NULL,NULL),(26,'2410',3,NULL,NULL,'2410@xyz.com','$2a$10$8PlYtaImmYPpHeWoYDlT1OcPh69IAfjSxW1viJkr9oAW.XUHJSOnK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,5,NULL,NULL,NULL,NULL),(27,'2867',3,NULL,NULL,'2867@xyz.com','$2a$10$mlZbinyvDxQqpZV1DDwuTus4gJpIwLogiZPWQ55OFw8E/g4n.Z7oK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:11',1,1,NULL,20,NULL,NULL,NULL,NULL),(28,'6917',3,NULL,NULL,'6917@xyz.com','$2a$10$9wlH4qsm2wUqOExBK4BUEeI3YlGHSzhy9fB05V1qPkDiHpxw/84Gy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:41','2018-11-19 12:40:12',1,1,NULL,352,NULL,NULL,NULL,NULL),(29,'6889',3,NULL,NULL,'6889@xyz.com','$2a$10$ufFdL2wk.UlTBr2Vv97ofuPTBQikwZBfkNWT9ixup4OY9vceHb5oa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,342,NULL,NULL,NULL,NULL),(30,'5966',3,NULL,NULL,'5966@xyz.com','$2a$10$XUWbsLYWztwYIisDVFlPIOz./yUe/zSenmarse/M4scENdpUbeKZW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,169,NULL,NULL,NULL,NULL),(31,'2946',3,NULL,NULL,'2946@xyz.com','$2a$10$eFAQKc1ZDWNYSrZgdQmKRuPCJShm.xJk5kkiCddvvIhrrGcXpWSHS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,22,NULL,NULL,NULL,NULL),(32,'6529',3,NULL,NULL,'6529@xyz.com','$2a$10$vaHjIKXFP335mQQtRKidiOt9TFgkydqEcKvDHy0ZQBP00sXSpBJfa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,266,NULL,NULL,NULL,NULL),(33,'6615',3,NULL,NULL,'6615@xyz.com','$2a$10$CRWcBhsO1z0VeVAsgvwMR.wrI87VR151o7AYYWykklb7Hwas5PmCC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,287,NULL,NULL,NULL,NULL),(34,'2789',3,NULL,NULL,'2789@xyz.com','$2a$10$hdJ6xIN.YFspIeofBrCE5O0ftalWnuFHBlGumvHYkEdXk5iuOOqLa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,17,NULL,NULL,NULL,NULL),(35,'6243',3,NULL,NULL,'6243@xyz.com','$2a$10$73BnR9MnIAyH.WPHLYSXguBw60WraDPp3QmJomk8QFH56mpuKL8hC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,216,NULL,NULL,NULL,NULL),(36,'2346',3,NULL,NULL,'2346@xyz.com','$2a$10$a4rrS6dN8QO/3RFGzbhsBuQ792QBS91uG/e.saA34d6AP7hzk/6fW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,3,NULL,NULL,NULL,NULL),(37,'2782',3,NULL,NULL,'2782@xyz.com','$2a$10$vvsQR1KiSMWKpoW.sZDi7OUqJhIOfFe4Prsgp1ItDYiuOJ3lxBeUa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:42','2018-11-19 12:40:12',1,1,NULL,16,NULL,NULL,NULL,NULL),(38,'3855',3,NULL,NULL,'3855@xyz.com','$2a$10$hyFjre.lua7ujWKbYIZJsO/yDTJaui1JFT2B7fOKVs/g7a3cs5XBm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:12',1,1,NULL,50,NULL,NULL,NULL,NULL),(39,'4300',3,NULL,NULL,'4300@xyz.com','$2a$10$u2Iy43CvZGZOX7JczaINi.AchcxDRszVJCPh2RtzaWxlbiFRruaQu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,67,NULL,NULL,NULL,NULL),(40,'4678',3,NULL,NULL,'4678@xyz.com','$2a$10$Lav0A1XYEquVLrazwfnI4ee43twB6k366.acdYmx1JlNtZn/bP3Gu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,78,NULL,NULL,NULL,NULL),(41,'5945',3,NULL,NULL,'5945@xyz.com','$2a$10$D6U3buvtjcNbkunFxclWougbORmPCx2ckOr0fexkGSpYi.2NcUmG2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,152,NULL,NULL,NULL,NULL),(42,'2934',3,NULL,NULL,'2934@xyz.com','$2a$10$4LETT8cWvPVkYQRc1oRExOFFICId.goZRPbruf9xHEBgNRAFXP.d6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,21,NULL,NULL,NULL,NULL),(43,'6252',2,NULL,NULL,'6252@xyz.com','$2a$10$ut8RxeadKtG1nN97BWqEKOVZP1BvV.b/885OUfVs76FCUT.5EB4w6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2018-11-19 11:31:06','2018-11-19 10:56:32','192.168.13.249','127.0.0.1','2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,218,NULL,NULL,NULL,NULL),(44,'3826',3,NULL,NULL,'3826@xyz.com','$2a$10$WxQcvVqUnQ1znd0xHTsNaueGu6Pb7VppQ.Rbl.GCSSwh0Yo4kVsFy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,49,NULL,NULL,NULL,NULL),(45,'4371',3,NULL,NULL,'4371@xyz.com','$2a$10$TFyQpxq86qkrnbe/9AlF6OGvps6RH.wsiUWiD2MYd2N4gbOC5dqbK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,69,NULL,NULL,NULL,NULL),(46,'4940',3,NULL,NULL,'4940@xyz.com','$2a$10$xJRd.WkD5M9WdmhihQJAB.0BR6gXDcqTEjzcJ7PihZYUGy0BzWeSm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:43','2018-11-19 12:40:13',1,1,NULL,96,NULL,NULL,NULL,NULL),(47,'5140',3,NULL,NULL,'5140@xyz.com','$2a$10$24Z2My9YsAavF9zKZn7cpuJUQQuYc14npxLyTJsoOZrBTjTg1KY0O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:13',1,1,NULL,116,NULL,NULL,NULL,NULL),(48,'5944',3,NULL,NULL,'5944@xyz.com','$2a$10$ITKg4VqOrk7fyQTgjarRYuRmnSKS7h5uxJCNCvFi/MmiMPL6fmDJ2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:13',1,1,NULL,151,NULL,NULL,NULL,NULL),(49,'6519',3,NULL,NULL,'6519@xyz.com','$2a$10$eALNtt1gKshhnSaP0D6Un.blCTCe5zs/bdrDTJj73aLWlS1Xb5PoK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:13',1,1,NULL,259,NULL,NULL,NULL,NULL),(50,'6813',3,NULL,NULL,'6813@xyz.com','$2a$10$NulnsPIk3Ntl7n5p1NWL6.owA4RSaIhUZL5QFRBgpwDtm9fBb0G26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:13',1,1,NULL,325,NULL,NULL,NULL,NULL),(51,'6515',3,NULL,NULL,'6515@xyz.com','$2a$10$xAl.CwbQ1I/DrHtNE6RZ6OBxlCwdVi7KvUcbh8taQldz4xgY4GgUu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:14',1,1,NULL,257,NULL,NULL,NULL,NULL),(52,'5590',3,NULL,NULL,'5590@xyz.com','$2a$10$zgldsh080QPubPxchFj.euKWzjk7reZdZjEIKol64rD3Its5HvaXO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:14',1,1,NULL,132,NULL,NULL,NULL,NULL),(53,'3288',3,NULL,NULL,'3288@xyz.com','$2a$10$RpJclc6WT55OkXidpC05LuXYajtgPHLe5NHkpzKXkZOUUZXQGufra',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:14',1,1,NULL,44,NULL,NULL,NULL,NULL),(54,'6487',3,NULL,NULL,'6487@xyz.com','$2a$10$JXEbQHtxxljYGEH9jbnddeR7wHuNRzAvNK50SRht7XNHbF6O34VHe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:14',1,1,NULL,251,NULL,NULL,NULL,NULL),(55,'6212',3,NULL,NULL,'6212@xyz.com','$2a$10$iHEFjaBKNNa4G7gMq/dJSukZo3n6iyIc6meqMnsUuVygnWexAZYYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:44','2018-11-19 12:40:14',1,1,NULL,214,NULL,NULL,NULL,NULL),(56,'3109',3,NULL,NULL,'3109@xyz.com','$2a$10$GPLZPzdywaSaW3k/5gM9n.pkHhv.MIb1CwO42lmnTS2TtOpoDVlEG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:14',1,1,NULL,32,NULL,NULL,NULL,NULL),(57,'6711',3,NULL,NULL,'6711@xyz.com','$2a$10$TpRIJGplLLmjBbQvYiIe5eWU4AfkTsrFl7dWj/qeDImnTVS61CNO2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:14',1,1,NULL,311,NULL,NULL,NULL,NULL),(58,'6650',3,NULL,NULL,'6650@xyz.com','$2a$10$d922UvYITlq2o8oGESY9NeEm4Gf.dZCAGToua.2FEdOFTVeb87MJq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:14',1,1,NULL,293,NULL,NULL,NULL,NULL),(59,'3073',3,NULL,NULL,'3073@xyz.com','$2a$10$tSJ8VHpslH6ijAB3pT4HguV.L0lgcQFafQ5/9cFVFTCaLL56LphJG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:14',1,1,NULL,30,NULL,NULL,NULL,NULL),(60,'6557',3,NULL,NULL,'6557@xyz.com','$2a$10$SwlUWRJ4yE7OQfwgmdRxgOjKt4kTszVSD8xCcDZGHEzofetHKGb6q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:14',1,1,NULL,268,NULL,NULL,NULL,NULL),(61,'4883',3,NULL,NULL,'4883@xyz.com','$2a$10$eIyiSISEdT4fCgknCsA88e2x/VkWbV4gZPgFC2UBekzIGA.iRtzYi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:15',1,1,NULL,88,NULL,NULL,NULL,NULL),(62,'6331',3,NULL,NULL,'6331@xyz.com','$2a$10$RLPVmOV7uDxZXsictwNIC.YoaboeQ4Mmw.EribJ3.bIAHvpx7rPG.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:15',1,1,NULL,227,NULL,NULL,NULL,NULL),(63,'5968',3,NULL,NULL,'5968@xyz.com','$2a$10$V02ACdvN5D7rqKK8pQy55eaJWl6fxS.irhswRgeSc2pvWMT.T1Tmm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:15',1,1,NULL,170,NULL,NULL,NULL,NULL),(64,'5130',3,NULL,NULL,'5130@xyz.com','$2a$10$J3SXzM1jDJdkA2QFdZ1GDeU1Gyr3uQXieJtO24cQ.7A7tsqNutf0.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:45','2018-11-19 12:40:15',1,1,NULL,113,NULL,NULL,NULL,NULL),(65,'6565',3,NULL,NULL,'6565@xyz.com','$2a$10$JVCgTL8HEt55YGXtfAQ4mOS12ovmBe8O95glkrftiDzd3VJvDxOsa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,269,NULL,NULL,NULL,NULL),(66,'5339',3,NULL,NULL,'5339@xyz.com','$2a$10$svVINZreAhri.oPyymFLYOGoQ3jr7vQ2UC28reqn.I.G636yTf5me',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,127,NULL,NULL,NULL,NULL),(67,'4636',3,NULL,NULL,'4636@xyz.com','$2a$10$Hwq.G1LDt9F8LNghTYlT2OuCVy1gHQBUFKRl9y00y8Eh32LwtPwuC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,77,NULL,NULL,NULL,NULL),(68,'6585',3,NULL,NULL,'6585@xyz.com','$2a$10$KpVJB8F0FRuLUfU49T1oCe.LTpYWxNP3wfFYuLtbKW4WvfgkSaosu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,276,NULL,NULL,NULL,NULL),(69,'6729',3,NULL,NULL,'6729@xyz.com','$2a$10$f7RSgB.kycIMXHIcY.REtONhuRIC0dZhN7WBmwftZVemmOH6AJzGm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,315,NULL,NULL,NULL,NULL),(70,'6883',3,NULL,NULL,'6883@xyz.com','$2a$10$.7SbzdWJpZfDmlDoJgB6t.rW780KFwCNIwctmG7YHXzFmItpMPxzm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,341,NULL,NULL,NULL,NULL),(71,'6442',3,NULL,NULL,'6442@xyz.com','$2a$10$RD6XTDnu7fGVl8CGVWLzO.UyGrgJLDIq2iNyBQUfWi9CXRQBThW06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,237,NULL,NULL,NULL,NULL),(72,'5270',3,NULL,NULL,'5270@xyz.com','$2a$10$1AJCQ9fz/lBw4hfZmpErteACK.ngmH4lvFj9K380nJU9rnD4o.2QG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:15',1,1,NULL,126,NULL,NULL,NULL,NULL),(73,'5156',3,NULL,NULL,'5156@xyz.com','$2a$10$drI.18tCmc86gFsEPSt4vuNPFf91jvU0snT9SHDk9SvNMf59DB3pe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:46','2018-11-19 12:40:16',1,1,NULL,120,NULL,NULL,NULL,NULL),(74,'6475',3,NULL,NULL,'6475@xyz.com','$2a$10$M8NaAoO5FAZ4SIw1NV4KL.T5mpA6FQ6hGxZ5cKf2u1qKy/A0QsSwi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,247,NULL,NULL,NULL,NULL),(75,'3127',3,NULL,NULL,'3127@xyz.com','$2a$10$w4o.obCdy31RrUl6V.qWwODNXV2S9lBmBmdf/s1pbTjeFUyFAenr.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,34,NULL,NULL,NULL,NULL),(76,'4720',3,NULL,NULL,'4720@xyz.com','$2a$10$d9/NLNSUT8yU8Lo63N71d.4Oa810rXFHa6BvKRmwC4tbxBrhif3Ge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,81,NULL,NULL,NULL,NULL),(77,'4947',3,NULL,NULL,'4947@xyz.com','$2a$10$3WSETX6.B0CjEVIU/s54lOafKBiZ1MzHw.xoi4Jr5DVNWoFpBBDKq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,99,NULL,NULL,NULL,NULL),(78,'5954',3,NULL,NULL,'5954@xyz.com','$2a$10$HoaehI8Z4ErXUFl3UyrOmOjWJBD9WIccws7KBdTqrUqZUQHpX2TWW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,158,NULL,NULL,NULL,NULL),(79,'5975',3,NULL,NULL,'5975@xyz.com','$2a$10$TYqsMf3PMYGappfiD8JPwO9f9yorbdqwBUujQhSGOZ31UIJ2QX2nW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,176,NULL,NULL,NULL,NULL),(80,'5976',3,NULL,NULL,'5976@xyz.com','$2a$10$.8HopUCWGCYY/O.zxXZJwejWh2XnSseXMS38Mmw2Vs2zFyzHnrBWC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,177,NULL,NULL,NULL,NULL),(81,'6601',3,NULL,NULL,'6601@xyz.com','$2a$10$x/SR4tK6v4LZtuO1taK1YuwwMManKYBZNqfnh5I33uo9qaogjNKLC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,279,NULL,NULL,NULL,NULL),(82,'6602',3,NULL,NULL,'6602@xyz.com','$2a$10$TtgV.zSDRppqj2BSmhWKEu5nT3ijbWett.rjtXVGRON7WkHbRDAaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:47','2018-11-19 12:40:16',1,1,NULL,280,NULL,NULL,NULL,NULL),(83,'6605',3,NULL,NULL,'6605@xyz.com','$2a$10$8TuACoSrR8i/d64lqsJqeeRSM7yQd1ORAtYjQqHwcamv0lBOWuzZu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:16',1,1,NULL,283,NULL,NULL,NULL,NULL),(84,'6699',3,NULL,NULL,'6699@xyz.com','$2a$10$.Joz.FmCoWck2f96ydLiM.F2XQMp4mPODBEaXPgJI3vnVOobWfWQq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,301,NULL,NULL,NULL,NULL),(85,'2530',3,NULL,NULL,'2530@xyz.com','$2a$10$mQ5ZlNfXU4ShJQox1VnLYeJeYnT.mJtBgRkAkdgKKNr6jvJnEEZtW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,12,NULL,NULL,NULL,NULL),(86,'5109',3,NULL,NULL,'5109@xyz.com','$2a$10$MtYARl/obsTGybscAA1k3OtRr/FI6FqMKQORCODNzr2eDdTuLlKMi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,110,NULL,NULL,NULL,NULL),(87,'5110',3,NULL,NULL,'5110@xyz.com','$2a$10$zbaBp7sfUafNwHGSm.p4du7mdxZ/unY5idosDmKOAuaciyhszBxPy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,111,NULL,NULL,NULL,NULL),(88,'5937',3,NULL,NULL,'5937@xyz.com','$2a$10$7RHv6lGH.cP0jhwLvA1zGOWTgUnvzHhWfcqtNPpeNoqQBi3GiOjC2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,144,NULL,NULL,NULL,NULL),(89,'5962',3,NULL,NULL,'5962@xyz.com','$2a$10$xmp7M6MpwnqfmZNNsagBVut9ALJeWKeUA0Qq4ACVS7IKC0NB6Pwki',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,166,NULL,NULL,NULL,NULL),(90,'5980',3,NULL,NULL,'5980@xyz.com','$2a$10$qV2dXY8pUJV0FFGw.E0P9uYsynqbVYnEJIkKggZUos2bmukYMZowy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,180,NULL,NULL,NULL,NULL),(91,'5982',3,NULL,NULL,'5982@xyz.com','$2a$10$A6oLHtspSpoxQf74hwGlTO65hyVgVE9/5EIWxhkuyw9OGpeANkhRC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:48','2018-11-19 12:40:17',1,1,NULL,182,NULL,NULL,NULL,NULL),(92,'6473',3,NULL,NULL,'6473@xyz.com','$2a$10$pYAdQer2JgsLlFEA6vTKhuvrylVpgfNVShB.ytKRig/GrfimcdZba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:17',1,1,NULL,245,NULL,NULL,NULL,NULL),(93,'6490',3,NULL,NULL,'6490@xyz.com','$2a$10$SpTtYXMbyAedOCqb4NK56.5FlJDxD10DrWBHRlZbCLwRjcwSV.qT.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:17',1,1,NULL,252,NULL,NULL,NULL,NULL),(94,'6530',3,NULL,NULL,'6530@xyz.com','$2a$10$sr80PyZ2CdhiDwCtB17hJ.zss6Lb1numAdvJuBS2ZYfjRvMBrariG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:17',1,1,NULL,267,NULL,NULL,NULL,NULL),(95,'6603',3,NULL,NULL,'6603@xyz.com','$2a$10$L3vcOqw4fuh0OkNL9ZC9Vu3P74XUU.d4SbweFYYPN86lT/AC4XUPG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,281,NULL,NULL,NULL,NULL),(96,'6604',3,NULL,NULL,'6604@xyz.com','$2a$10$5Ukz.7/wWfJUKGcS6JKTt.bfXmaM1iWI4d.sHi74aZq5dH1HIky5i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,282,NULL,NULL,NULL,NULL),(97,'5041',3,NULL,NULL,'5041@xyz.com','$2a$10$HkGI1NjPhoJjOpBtn9GZk.u56.ZooXEel8IfK/e8GAFAzXlQSzsRy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,105,NULL,NULL,NULL,NULL),(98,'2529',3,NULL,NULL,'2529@xyz.com','$2a$10$FnO.Up3F7NJHR4SZIOXoau3axnoMe1C7DVEs12J.4htK7GvwtKfZG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,11,NULL,NULL,NULL,NULL),(99,'4859',3,NULL,NULL,'4859@xyz.com','$2a$10$kMBrweICE9Mea9GnSnJ8deLWJAhxkQ0P0YIWUPCBkxiaTqOP/gLke',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,85,NULL,NULL,NULL,NULL),(100,'5142',3,NULL,NULL,'5142@xyz.com','$2a$10$LKl3DTMnJKgI3gSJXn.xWex0fcK690oXYr3WDDrxXHjBL2CThur3K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:49','2018-11-19 12:40:18',1,1,NULL,118,NULL,NULL,NULL,NULL),(101,'5948',3,NULL,NULL,'5948@xyz.com','$2a$10$1f1fjOk8MZanezNVHlfOpuzHsEamb6dH0QSTqmmee4o/SxCaP/eVu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:18',1,1,NULL,153,NULL,NULL,NULL,NULL),(102,'5959',3,NULL,NULL,'5959@xyz.com','$2a$10$r/e0CO8eRliNwX.XthtwoOGfthLUI6KLKqEgTAs/YP3JZr..sBbxG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:18',1,1,NULL,163,NULL,NULL,NULL,NULL),(103,'5987',3,NULL,NULL,'5987@xyz.com','$2a$10$1mefQkWX2.T208Zv.GuGkuGr.xepn8WhEwlqkD6E1aJiJn4UhEsY2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:18',1,1,NULL,185,NULL,NULL,NULL,NULL),(104,'6810',3,NULL,NULL,'6810@xyz.com','$2a$10$uXlHFUIFxBn2SipYyvGkEuPPnUbBzAJJvyaTLd5jgywa6WB2SaAyK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:18',1,1,NULL,322,NULL,NULL,NULL,NULL),(105,'4301',3,NULL,NULL,'4301@xyz.com','$2a$10$/Kz2pimGayy6ykXhhLQgiu7JG44ZISTPfbmuyuQDQ4jth6cDMEnqm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:18',1,1,NULL,68,NULL,NULL,NULL,NULL),(106,'4935',3,NULL,NULL,'4935@xyz.com','$2a$10$cFVDAeOfx9YEiC.93LJksuV9n7fh82u5dZz3u2Mgk5Qk2/TknpuEy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:19',1,1,NULL,93,NULL,NULL,NULL,NULL),(107,'5248',3,NULL,NULL,'5248@xyz.com','$2a$10$j37RnO1gMv4m2Z1FujuvFu07I3ZBspyGNtnIfIZAfW3/CUc7.DH7y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:19',1,1,NULL,125,NULL,NULL,NULL,NULL),(108,'5434',3,NULL,NULL,'5434@xyz.com','$2a$10$70cKm5F.M5GRa4BYOzfDIucj9kquhgzRIfyPLW5NTIzHIz1wfd77C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:19',1,1,NULL,130,NULL,NULL,NULL,NULL),(109,'5939',3,NULL,NULL,'5939@xyz.com','$2a$10$l.UX5jt.nlI1A2AgojG4Ou0G4iR9aBM.oXkSem3tQ0NaDVa7TQrFm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:50','2018-11-19 12:40:19',1,1,NULL,146,NULL,NULL,NULL,NULL),(110,'5942',3,NULL,NULL,'5942@xyz.com','$2a$10$qQRKlIvMLDfZukA9bANMj.rztS.23a0/Ah3NYjAax3XkRChZd7V7y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,149,NULL,NULL,NULL,NULL),(111,'5949',3,NULL,NULL,'5949@xyz.com','$2a$10$8pdxPuc1aKwiWwQ3nvgZoe0I9xDE1xiSLFVmopm33kssCbR.VpNEC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,154,NULL,NULL,NULL,NULL),(112,'5951',3,NULL,NULL,'5951@xyz.com','$2a$10$Z6ppgs5YGu058JYC9XllpeRO1z4WhQuSXMK8kbLgfK0cyc7AFg.ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,156,NULL,NULL,NULL,NULL),(113,'6128',3,NULL,NULL,'6128@xyz.com','$2a$10$Oc6.ucUSyHzX0SYojKYClur9bT3En1pLQBRLt8AieLjClj/UaU3bC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,192,NULL,NULL,NULL,NULL),(114,'6129',3,NULL,NULL,'6129@xyz.com','$2a$10$fkEZARa8PecPC558/mw0rOrDmsCtjk81VxmeIJFI..hJXGQ3jW.g6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,193,NULL,NULL,NULL,NULL),(115,'6130',3,NULL,NULL,'6130@xyz.com','$2a$10$kGkw4fQIMU81RBuGH.oAm.Gz.OtJ0nt9z8mJ4LlCGAUScgf85E38G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,194,NULL,NULL,NULL,NULL),(116,'6142',3,NULL,NULL,'6142@xyz.com','$2a$10$lhRF0/Zf3NNnr/xBLg7OeOer/jKrBEs9asU2dzoB0wvFwbzIdaJni',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:19',1,1,NULL,196,NULL,NULL,NULL,NULL),(117,'6143',3,NULL,NULL,'6143@xyz.com','$2a$10$tOS/H5Uk180TxPegLyU7L.LxeoA4VoCCNIp2OWn2csCTH0rDtSlte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:20',1,1,NULL,197,NULL,NULL,NULL,NULL),(118,'6144',3,NULL,NULL,'6144@xyz.com','$2a$10$x1kQIVMBbW9OaMHWz76q4.s/RmT3yKMF3NLEMx7wiJRKSY4rN25XG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:51','2018-11-19 12:40:20',1,1,NULL,198,NULL,NULL,NULL,NULL),(119,'6145',3,NULL,NULL,'6145@xyz.com','$2a$10$474NNCb0usndeyn4q.AgYemCqpo9bhYim0PBDksdooKqO5rZXDfUK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,199,NULL,NULL,NULL,NULL),(120,'6146',3,NULL,NULL,'6146@xyz.com','$2a$10$0Xn.yOTXLzap1VP/5T80rudxMerRgbajTOso8PlcpEXStfNsMUzq.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,200,NULL,NULL,NULL,NULL),(121,'6147',3,NULL,NULL,'6147@xyz.com','$2a$10$HZzhcGsgzZ20Q.XBCvUZqe1PAdb9t6JmaxUmFbB/mim30uu.Tf4QS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,201,NULL,NULL,NULL,NULL),(122,'6164',3,NULL,NULL,'6164@xyz.com','$2a$10$VA/WIPmiQMI7GdB5U1V3W.BQYE2hug1ydZgtehLh.cvCf4dkn1wAe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,202,NULL,NULL,NULL,NULL),(123,'6695',3,NULL,NULL,'6695@xyz.com','$2a$10$OghIXfj0CGZfKVZmfOzRy.yNushF.21w11dkj/BZpFtcvonLOPTd6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,297,NULL,NULL,NULL,NULL),(124,'6697',3,NULL,NULL,'6697@xyz.com','$2a$10$ZlPivYUqouqmo4753xd3.eUvN7JEenmN63xWKdaeC2RJeEFdJcF9i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,299,NULL,NULL,NULL,NULL),(125,'6703',3,NULL,NULL,'6703@xyz.com','$2a$10$hBit6WqLZUZwQ8065KdxJe3eCEhLPZT3xNNbXMzLMRaPRQ7yE6JMa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,305,NULL,NULL,NULL,NULL),(126,'6707',3,NULL,NULL,'6707@xyz.com','$2a$10$wjED1l.eap8SO/0lcUnTBOj/39BHrhgaEVewkPtzhF0jbmEME3xOi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,308,NULL,NULL,NULL,NULL),(127,'6708',3,NULL,NULL,'6708@xyz.com','$2a$10$/Epkfh/MJoHG7K7wPCvyxO.2u2lapOpPHDIsRMAofl6PJeciUlaPC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:52','2018-11-19 12:40:20',1,1,NULL,309,NULL,NULL,NULL,NULL),(128,'6436',3,NULL,NULL,'6436@xyz.com','$2a$10$3hJr2SAX6bEfpgAP8AUMZu18.QdbKIWfYelAtJ8FzukqyubJLT6be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,236,NULL,NULL,NULL,NULL),(129,'6696',3,NULL,NULL,'6696@xyz.com','$2a$10$A0N1L16TiS1y.2OFOEY7uOopccFbK4CHMyDhvFthypcj0WjqOMITm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,298,NULL,NULL,NULL,NULL),(130,'6698',3,NULL,NULL,'6698@xyz.com','$2a$10$vl971st6ds/1S1P0HWu2CO9RSM3a8o2Mh6hkdH49aMm2TS5ZLoqJO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,300,NULL,NULL,NULL,NULL),(131,'6701',3,NULL,NULL,'6701@xyz.com','$2a$10$1VAji6vCJUDMMHJvbtPJoub2Rijo80e14sdg3zbZXU0aa5R4h5Yv2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,303,NULL,NULL,NULL,NULL),(132,'6709',3,NULL,NULL,'6709@xyz.com','$2a$10$xdypPif95BEdpu4qqB5Iw.MigzDohhiZMjJelnPcbEfFqeAFVHAzS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,310,NULL,NULL,NULL,NULL),(133,'6811',3,NULL,NULL,'6811@xyz.com','$2a$10$2rgFCk24xXoGVT9QKf0m/ewDf5Rsz04Z2WrQfnanqdIMZuAwbc0su',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,323,NULL,NULL,NULL,NULL),(134,'6818',3,NULL,NULL,'6818@xyz.com','$2a$10$iptdzpKwxtZtXyBR3b3/ZuSn.9.hwtyK6n/.s3byPJFrwSBOh1PiK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,328,NULL,NULL,NULL,NULL),(135,'6819',3,NULL,NULL,'6819@xyz.com','$2a$10$71hgUILJ4BcwToA.7TEqPuVKhxA/bS70N4gaNZzxqjy8lm3fQgdHi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,329,NULL,NULL,NULL,NULL),(136,'6823',3,NULL,NULL,'6823@xyz.com','$2a$10$ebmweXofCJml2.I1ZeYo/eOG6/qjQS5ED6AjxVUhm1w/VqjlnzLPG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:53','2018-11-19 12:40:21',1,1,NULL,333,NULL,NULL,NULL,NULL),(137,'6841',3,NULL,NULL,'6841@xyz.com','$2a$10$H.mkCz72qC.P.HmOwY92ZO0S6Ktt8yWpmGKRn0lCPE.hdeauS4u4y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:21',1,1,NULL,338,NULL,NULL,NULL,NULL),(138,'6903',3,NULL,NULL,'6903@xyz.com','$2a$10$avHe3ZIFB1eBszFfex1WcuCo0xaFhzJ0IAmVL.WkuMak8vnVKw1ya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:21',1,1,NULL,346,NULL,NULL,NULL,NULL),(139,'4721',3,NULL,NULL,'4721@xyz.com','$2a$10$Di.4JZgGpGWQZcBwsce1t.b0Rg4QIChUOHqJNEvbKqCA.anYcX/v.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,82,NULL,NULL,NULL,NULL),(140,'4863',3,NULL,NULL,'4863@xyz.com','$2a$10$OiP12xdnkAC7tvrC55XCEeJmkw9GruzkC8iI4i7dMdXZ0hAS5zPvm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,86,NULL,NULL,NULL,NULL),(141,'4882',3,NULL,NULL,'4882@xyz.com','$2a$10$ACTN7Sn2VcyCjbba1piCZeyhwMHCzZEC5v0v.36aYJxDoYeVFUxJi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,87,NULL,NULL,NULL,NULL),(142,'5143',3,NULL,NULL,'5143@xyz.com','$2a$10$T4Kj.a1/eC8Vt1c1JWCkTOEqsYHi7Be5/fjq7bQu68NSOtrB8orXi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,119,NULL,NULL,NULL,NULL),(143,'5958',3,NULL,NULL,'5958@xyz.com','$2a$10$.suirvfTJZsISqZKK.7O7.7ulCjDdyK4LgKAc5YvU5d7VwNGRrDpW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,162,NULL,NULL,NULL,NULL),(144,'5985',3,NULL,NULL,'5985@xyz.com','$2a$10$fjNI4MikLy1gKedtZTPsiOUdDANPuQJquK48neXDx2NCb0Nz5EH4W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,184,NULL,NULL,NULL,NULL),(145,'6165',3,NULL,NULL,'6165@xyz.com','$2a$10$vogCR5ufEFYRBcxUxD2XJ.jN1wWKyV4xvq8PNvYLixTfCw6P24Dzy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:54','2018-11-19 12:40:22',1,1,NULL,203,NULL,NULL,NULL,NULL),(146,'6700',3,NULL,NULL,'6700@xyz.com','$2a$10$DFHwhwhj9sGcr5XYYibjB.Py73w/MjLxlpymRFoYfcss8oB1xpcnu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:22',1,1,NULL,302,NULL,NULL,NULL,NULL),(147,'6520',3,NULL,NULL,'6520@xyz.com','$2a$10$Iiqb52hGBQjYvrSQzG/aIOTlnXbjm4hD8Sf66WJcOV0CSHwvP2b1K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:22',1,1,NULL,260,NULL,NULL,NULL,NULL),(148,'6713',3,NULL,NULL,'6713@xyz.com','$2a$10$nvJ.ai4mp.nWCJM5mEvyx.fZQVxZoxN/6UeCDTCIFGiBxAYcVzby.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:22',1,1,NULL,313,NULL,NULL,NULL,NULL),(149,'6820',3,NULL,NULL,'6820@xyz.com','$2a$10$Vfgo/sSy/MgGkqJGhAzQ.OP9QZgZj/6Okfp0OgTbeyI2Izpkf3V0C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:22',1,1,NULL,330,NULL,NULL,NULL,NULL),(150,'6822',3,NULL,NULL,'6822@xyz.com','$2a$10$f.AJWYYC/JaFg7U7EWTkeOKF/X2BzXfR799xdGWOeBgfe.Sp9M3x2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:23',1,1,NULL,332,NULL,NULL,NULL,NULL),(151,'2207',3,NULL,NULL,'2207@xyz.com','$2a$10$u7fuf1WolsmvNQhpzdvn0eD/tD7Em.gsf1Vw8reuZyKBuwZiWlIWy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:23',1,1,NULL,1,NULL,NULL,NULL,NULL),(152,'3027',3,NULL,NULL,'3027@xyz.com','$2a$10$q3X4B..fnUb9ddu.5fEa3OvCD0VJkaT1xXzW5d1nw5Pw7gKJaP1a2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:23',1,1,NULL,27,NULL,NULL,NULL,NULL),(153,'4907',3,NULL,NULL,'4907@xyz.com','$2a$10$.i2Yb6bXpD/UZ1LIkiW20.eR701dyzX5W3aJyc.mKFv2mRW4KhMwO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:23',1,1,NULL,92,NULL,NULL,NULL,NULL),(154,'5131',3,NULL,NULL,'5131@xyz.com','$2a$10$n7RUPJs.u9YTIVi/MRstnu5zAsnyEtO/fkYp1YMUpFNHgKuz2QgFW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:55','2018-11-19 12:40:23',1,1,NULL,114,NULL,NULL,NULL,NULL),(155,'5132',3,NULL,NULL,'5132@xyz.com','$2a$10$s6Lh5gbV9RVpl7zyDKexBOT2oTix0i4VmXlhkyYJV677spO7sVYVW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,115,NULL,NULL,NULL,NULL),(156,'5141',3,NULL,NULL,'5141@xyz.com','$2a$10$EnG2FsAknQH1yXP/6zY/TOXqjNpm3FxHLn7ntkWKI1N2hcN2Hu4O.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,117,NULL,NULL,NULL,NULL),(157,'5194',3,NULL,NULL,'5194@xyz.com','$2a$10$pJ.3eI22uo7lz3pqVKhD5u3uXf3gkCLXjxuUPkxC4YqZrXFNjz4/W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,123,NULL,NULL,NULL,NULL),(158,'5940',3,NULL,NULL,'5940@xyz.com','$2a$10$HoqDmnOQ3lPxjbQaznSbrOVpMtjaqQc9Jiv.0w8jGrmZIpjOlTGZS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,147,NULL,NULL,NULL,NULL),(159,'5941',3,NULL,NULL,'5941@xyz.com','$2a$10$e0s.69A6IsR3wIpj2Xdco.mV9Xprn7vKaByWWciPy9oAycXA0UCny',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,148,NULL,NULL,NULL,NULL),(160,'5961',3,NULL,NULL,'5961@xyz.com','$2a$10$feTotTToqwKAwd1V51CHF.TsGeiIx.NlWIr6gmN5HooIc1uTkQmXm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,165,NULL,NULL,NULL,NULL),(161,'5963',3,NULL,NULL,'5963@xyz.com','$2a$10$YBqbq9j.D1nUPiHouJiBZuUyKEwyk2OUibtuVbMZpwyi3OgdW8lRC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:23',1,1,NULL,167,NULL,NULL,NULL,NULL),(162,'5990',3,NULL,NULL,'5990@xyz.com','$2a$10$nJfLDev2htPC0nBBSItYkuVBsLhbRBJ6Y8.oWQu0.7kU8vsNj5TgC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:24',1,1,NULL,188,NULL,NULL,NULL,NULL),(163,'5991',3,NULL,NULL,'5991@xyz.com','$2a$10$vtEjhtLTpT9NuUzqRdD44eWNlX1UxTjo2C5Pjr3PE4FY1O0annGjC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:56','2018-11-19 12:40:24',1,1,NULL,189,NULL,NULL,NULL,NULL),(164,'6179',3,NULL,NULL,'6179@xyz.com','$2a$10$TKVDaiPqP/h8wuqk6.PtTOe5fGajx.4egVg0xGfc4lvnOY5zOcuiy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,208,NULL,NULL,NULL,NULL),(165,'6180',3,NULL,NULL,'6180@xyz.com','$2a$10$R0n2/.tVVvmcm7ylqcGuGeEiPqix1zeg3s22/ubdeUPyjMXewpe8y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,209,NULL,NULL,NULL,NULL),(166,'6521',3,NULL,NULL,'6521@xyz.com','$2a$10$/MD.adC.481Z/T49FJeCyus1D2D90oMmw8DjzW2J.mSHxxQZR125a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,261,NULL,NULL,NULL,NULL),(167,'6596',3,NULL,NULL,'6596@xyz.com','$2a$10$sF4VpCXWSH0n25zf.W3Q9.I08BN49Sm4KxY1EZvoBy5vo90ng5uyq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,277,NULL,NULL,NULL,NULL),(168,'6598',3,NULL,NULL,'6598@xyz.com','$2a$10$jpq87HL3zs.7MUvXzNirEeAcz1BI.vuCERSYlFkr/k2FYNGrAyeOy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,278,NULL,NULL,NULL,NULL),(169,'6637',3,NULL,NULL,'6637@xyz.com','$2a$10$1m9ns5vShpKuezEiVczUHemLDmGbdbP1Ot4q..Ou0DJ4ksZJi34/e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,292,NULL,NULL,NULL,NULL),(170,'6812',3,NULL,NULL,'6812@xyz.com','$2a$10$o4NO.l8OqDJElsbfZQvyCeJT/tR7/q/8ncKX4T8YcaZzDA6rc5eU.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,324,NULL,NULL,NULL,NULL),(171,'3289',3,NULL,NULL,'3289@xyz.com','$2a$10$UpF4o4oKUVCaebVgafCqLeGKL06gFhXMEpP88Bj4clLloQUb8S8YW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,45,NULL,NULL,NULL,NULL),(172,'6313',3,NULL,NULL,'6313@xyz.com','$2a$10$3/gphoOyfOxYbNNXQ7uuoeOGHdVAbK5oxas06rVAfrYnjh75rQ7CS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:57','2018-11-19 12:40:24',1,1,NULL,223,NULL,NULL,NULL,NULL),(173,'6411',3,NULL,NULL,'6411@xyz.com','$2a$10$IXItznEvhjQXKZ/0AAHKLudIorM6d7jd.I7BxvhTu3J/aes1aWzaS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,235,NULL,NULL,NULL,NULL),(174,'4948',3,NULL,NULL,'4948@xyz.com','$2a$10$XQmlIZIqXCXTfSN.Sga.F.5Hcoue2h84RJPveOujWqb6r9YP1inte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,100,NULL,NULL,NULL,NULL),(175,'5943',3,NULL,NULL,'5943@xyz.com','$2a$10$1Bpowdms2CQW/nEWGslD9O/unTYQRA12xt89KxX3GGSFExAOw8pYS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,150,NULL,NULL,NULL,NULL),(176,'5957',3,NULL,NULL,'5957@xyz.com','$2a$10$q8HVZfqaPW/ydVSdgsDCDOYC5ouxTwoAj/sW6/aomuj8WxEaQF1ce',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,161,NULL,NULL,NULL,NULL),(177,'5970',3,NULL,NULL,'5970@xyz.com','$2a$10$SzPV2zCBPWpao9uHrRZ5ZOJFPjLD1NK9.lPNdIZh0/r6zeCXL7Sc.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,172,NULL,NULL,NULL,NULL),(178,'6480',3,NULL,NULL,'6480@xyz.com','$2a$10$9e8lCXU7dVZUmhXl7ifpfedmCVOBHc5KQsMBgicW3iShkYYyED4be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,248,NULL,NULL,NULL,NULL),(179,'6525',3,NULL,NULL,'6525@xyz.com','$2a$10$/FKJfXZ8o1Mhrh6uTQ7UjO1HFxmjDRcwXcwsD82Nl29dFf3Lssywi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,264,NULL,NULL,NULL,NULL),(180,'6704',3,NULL,NULL,'6704@xyz.com','$2a$10$EehcBPs0lCKNw22xt6i9Nu/A8dFrwaaQWPkpTh/AXz3EGnDIwxnYy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,306,NULL,NULL,NULL,NULL),(181,'6821',3,NULL,NULL,'6821@xyz.com','$2a$10$WgFNtpTgXw69frR85rCJ1uL8ME1cJz0093D4H/rWT/LvdTrd8BNTS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:58','2018-11-19 12:40:25',1,1,NULL,331,NULL,NULL,NULL,NULL),(182,'6824',3,NULL,NULL,'6824@xyz.com','$2a$10$Z9sapbEkbwqCzug6j6jokOMublbxvqXm0BTRG/ZHtz9lO9tt0xbp6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:25',1,1,NULL,334,NULL,NULL,NULL,NULL),(183,'5205',3,NULL,NULL,'5205@xyz.com','$2a$10$ilxyKQhzBjyCMvhhwMzxsOlCxN1jWshkjQ4RESmvWSO5awalD6Vp6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:25',1,1,NULL,124,NULL,NULL,NULL,NULL),(184,'2662',3,NULL,NULL,'2662@xyz.com','$2a$10$Ur.dnWIgnwpEPoOg7xXO7uObF8pNrAWYcAYcFWxt.am4/DHGz4kNC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,14,NULL,NULL,NULL,NULL),(185,'3062',3,NULL,NULL,'3062@xyz.com','$2a$10$ZjvZtRY4r/PiaXUlhfB88eF8E3LMMRm160jX6gd/tWJa4RN4oTbk.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,28,NULL,NULL,NULL,NULL),(186,'3133',3,NULL,NULL,'3133@xyz.com','$2a$10$kJELNFMG5NA8HLpoRWijDeadOu9LmGg20rwVv3T3dMPbuze8wOqIa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,36,NULL,NULL,NULL,NULL),(187,'3150',3,NULL,NULL,'3150@xyz.com','$2a$10$psl25weKktvqRdi0OInSb.skPwuxSSBx6Ej8/6y8Bnj6fSMUndX8W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,38,NULL,NULL,NULL,NULL),(188,'4946',3,NULL,NULL,'4946@xyz.com','$2a$10$DI8VFrNuAtvwhY9yZY0ySOxdgTLmsf/6dPeFHf4uns07sj/9VhawG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,98,NULL,NULL,NULL,NULL),(189,'5956',3,NULL,NULL,'5956@xyz.com','$2a$10$JoMiio/kxcCPak3hoMSrsOvCN643QDOHOuXnS.hy0rqaxwqIY/Cxu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,160,NULL,NULL,NULL,NULL),(190,'5989',3,NULL,NULL,'5989@xyz.com','$2a$10$Ciu/b4LvehpZGaN4g0uuE.Fgu1u//fjVCDlrLWZTe2Yb6fG5vyTfa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:37:59','2018-11-19 12:40:26',1,1,NULL,187,NULL,NULL,NULL,NULL),(191,'6166',3,NULL,NULL,'6166@xyz.com','$2a$10$r2k5MImpqNGoJ/3wn7o8/OXJPaZgtemav80MlMD828teflPBXEMqC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:26',1,1,NULL,204,NULL,NULL,NULL,NULL),(192,'6167',3,NULL,NULL,'6167@xyz.com','$2a$10$IvbL3B7TANCsSoSQFmP5/ei..2AP5KBsnZj1cthNP.SdViNnAvD8a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:26',1,1,NULL,205,NULL,NULL,NULL,NULL),(193,'6482',3,NULL,NULL,'6482@xyz.com','$2a$10$ZI91FM.JtEc.1DlWbPVPguoqzjGtXrxwdQdhPq2gFwXe.2gGplIAe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:26',1,1,NULL,249,NULL,NULL,NULL,NULL),(194,'6492',3,NULL,NULL,'6492@xyz.com','$2a$10$G9fcd45BY/qX2PxY6Xg.6uhwv/5cl36hZrpfIndnDGM7jhiJpaXB2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:26',1,1,NULL,253,NULL,NULL,NULL,NULL),(195,'6571',3,NULL,NULL,'6571@xyz.com','$2a$10$QtfQuCAnLaTRiofA6x94R.EwZdmBK93W9nQV5gTTlGby5hhObQPkC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:27',1,1,NULL,272,NULL,NULL,NULL,NULL),(196,'6610',3,NULL,NULL,'6610@xyz.com','$2a$10$/hExiz0D4/Fedft72JrWbuM9B/L2NEP2P3FWPuQuZ30SplazNw3mG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:27',1,1,NULL,285,NULL,NULL,NULL,NULL),(197,'6787',3,NULL,NULL,'6787@xyz.com','$2a$10$fnW5g6QAC/9c8r7GhT7jruILe75TJ60Sk1ZhKu1NesPp3GnQSsQgO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:27',1,1,NULL,321,NULL,NULL,NULL,NULL),(198,'6814',3,NULL,NULL,'6814@xyz.com','$2a$10$2LB4Veg1BYANgCSdKvot4ugAQkaANIH2gZN5NzWIXv4HXnN4e1LpS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:27',1,1,NULL,326,NULL,NULL,NULL,NULL),(199,'6817',3,NULL,NULL,'6817@xyz.com','$2a$10$lH.ySEwKv6kneU8WY2muQOJ8qNZhO5IQy2cQ66jereMNv9J0S4gLS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:00','2018-11-19 12:40:27',1,1,NULL,327,NULL,NULL,NULL,NULL),(200,'6825',3,NULL,NULL,'6825@xyz.com','$2a$10$OhaSr.SO.OCbA5oj3vLhp.GhSd0hVr43sZY6r86qtBSN35dyyFH7e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,335,NULL,NULL,NULL,NULL),(201,'6828',3,NULL,NULL,'6828@xyz.com','$2a$10$0MbJrrWZ5NGsnmLVYJ9/iu8yWa9uv82jSpe5j7nRLrVCvuaR6yLTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,337,NULL,NULL,NULL,NULL),(202,'5952',3,NULL,NULL,'5952@xyz.com','$2a$10$UdNNxSuS1TyaLuHaDT18fOl1TBl0H8YZodGOHLH1ntJCnbA93i/IS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,157,NULL,NULL,NULL,NULL),(203,'6526',3,NULL,NULL,'6526@xyz.com','$2a$10$mnIDZQRiB47mZFaMT1ouX.mbuC5pCmtmkECgDfUv/Y1RGji0voCB.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,265,NULL,NULL,NULL,NULL),(204,'6455',3,NULL,NULL,'6455@xyz.com','$2a$10$MWyjYcP/hgGXWWlggvzo/ethkcStXWAdFoUSwgTTZCWJ6oBPoXTk6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,240,NULL,NULL,NULL,NULL),(205,'4211',3,NULL,NULL,'4211@xyz.com','$2a$10$I19Wsi0CnMnbwvZC4DzS.efaVxrzXbQWi1OhaSDpibrO9nOHUlsG.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:27',1,1,NULL,62,NULL,NULL,NULL,NULL),(206,'2319',3,NULL,NULL,'2319@xyz.com','$2a$10$DFmU9j0AoGO4OMSrdqWyq.TyjHgkAdI1UjBojbGkI7QFiUx8AS4wW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:28',1,1,NULL,2,NULL,NULL,NULL,NULL),(207,'2526',3,NULL,NULL,'2526@xyz.com','$2a$10$EJ5JCNO3g7DNUdbGHfEo.uxii3Y1W0k4v3TeWdcI1dRrBWRo00nta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:28',1,1,NULL,8,NULL,NULL,NULL,NULL),(208,'2527',3,NULL,NULL,'2527@xyz.com','$2a$10$9UC8H1buQ9Dux46QNmzyyOgGMsy2f3WSQyj5xg2DdY/EPPylve7Mi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:01','2018-11-19 12:40:28',1,1,NULL,9,NULL,NULL,NULL,NULL),(209,'2528',3,NULL,NULL,'2528@xyz.com','$2a$10$UIWAqSjv2hGo1Au0ZQSuPemBnXBrTlHM1781vWFp1visGFsrJNYhu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,10,NULL,NULL,NULL,NULL),(210,'2791',3,NULL,NULL,'2791@xyz.com','$2a$10$zfM7DcuGOgu/Sj5PQRBSbeGYOWzGJyGN3FPSyN8Kap8gQvoFs9bDm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,18,NULL,NULL,NULL,NULL),(211,'2994',3,NULL,NULL,'2994@xyz.com','$2a$10$djaJOLzdlLH2ydafAC4SHOUA90d5xa78m0jVXEucyignEtiXVjBni',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,25,NULL,NULL,NULL,NULL),(212,'3068',3,NULL,NULL,'3068@xyz.com','$2a$10$jtr4cJjx2Xi93MIYLS9pmODJ19dE6udCFmUqYg8k.UJa.JFuTpf16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,29,NULL,NULL,NULL,NULL),(213,'3129',3,NULL,NULL,'3129@xyz.com','$2a$10$c/syTYF0uAWZ5.WkzbNe9OS7mqAPUJNXY67YaAqhSOoP1kMr6pnp.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,35,NULL,NULL,NULL,NULL),(214,'3140',3,NULL,NULL,'3140@xyz.com','$2a$10$kA7EL9nEiJ2rNDmefBdWCeegLavuiIIlR0GVpqV7zd9mDm3MgBn02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,37,NULL,NULL,NULL,NULL),(215,'4299',3,NULL,NULL,'4299@xyz.com','$2a$10$Kn1zq.gvohOjDDaAycmvCukFI20PSLWt6cLCqTQhjbR/Ln5f7BnjS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,66,NULL,NULL,NULL,NULL),(216,'4525',3,NULL,NULL,'4525@xyz.com','$2a$10$xrwm1b7FuB126Z5UQqL/Mej9UlADW3oR1whGZS8Q2oPBaeTQMjRF2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:02','2018-11-19 12:40:28',1,1,NULL,73,NULL,NULL,NULL,NULL),(217,'4527',3,NULL,NULL,'4527@xyz.com','$2a$10$AM3mQ07S6S4sne4wev1KdukCR0PLHVsew89qVzgbrOMdsiaFqbrzu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,75,NULL,NULL,NULL,NULL),(218,'4712',3,NULL,NULL,'4712@xyz.com','$2a$10$QmXyN7lQ1hBfWCmn3wgnUerhXYIQPikd7t6bU.dQBN13vnzrEIMCW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,80,NULL,NULL,NULL,NULL),(219,'4756',3,NULL,NULL,'4756@xyz.com','$2a$10$WtWP8V/Ijy/9cTtGJ2fXJ.jbI4s9CXrlcW0RcMrBoHeMWBjeB95JW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,84,NULL,NULL,NULL,NULL),(220,'4885',3,NULL,NULL,'4885@xyz.com','$2a$10$VNETZERUgfFDku/7Zy8/COPGwCZwSL4VIMz0fW7/FopAfvYFReKJS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,89,NULL,NULL,NULL,NULL),(221,'4886',3,NULL,NULL,'4886@xyz.com','$2a$10$VM4o2K7py1yNsoQsty9P7OxIk1wgSfE87bT52dHk5ae9713ednLqm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,90,NULL,NULL,NULL,NULL),(222,'4961',3,NULL,NULL,'4961@xyz.com','$2a$10$CXLzhO1QcyZxU7hL6mccEuLZJ.RE130kFVwWjui7MWIvdYq6IlUoi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,102,NULL,NULL,NULL,NULL),(223,'5021',3,NULL,NULL,'5021@xyz.com','$2a$10$dbQg93KeUsobqeaIJihUIeiMkt5bfn1EBQ3iZPA8sTlhx/RNLpoPm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,104,NULL,NULL,NULL,NULL),(224,'5107',3,NULL,NULL,'5107@xyz.com','$2a$10$ORaetyJFH16PPgzl.bFy1.cmWCcpXHAg3iSXJT.jQiIv1DI6mTQmy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,108,NULL,NULL,NULL,NULL),(225,'5108',3,NULL,NULL,'5108@xyz.com','$2a$10$xwjBWTZ59GZ7T9OtAbaNGe5NxVH3.zCiO.y2yd8qPFGcHvnB/4wvG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:03','2018-11-19 12:40:29',1,1,NULL,109,NULL,NULL,NULL,NULL),(226,'5157',3,NULL,NULL,'5157@xyz.com','$2a$10$DSPzHJpfH07NKxNtSqUYWe08jL4fK3GDC7rksB.oI.j2ha61jlqpq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:29',1,1,NULL,121,NULL,NULL,NULL,NULL),(227,'5382',3,NULL,NULL,'5382@xyz.com','$2a$10$1P3dJadWuBM.Iy5qLi0tGeV0Yn5jxMllk5rGC7kWqcdWfte4.o6WG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:29',1,1,NULL,129,NULL,NULL,NULL,NULL),(228,'5950',3,NULL,NULL,'5950@xyz.com','$2a$10$K2d5RPjHJz0r5Twx8syYVeX2GvRnqfCtKVLbIUYRgR6m579TCG5x.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,155,NULL,NULL,NULL,NULL),(229,'5969',3,NULL,NULL,'5969@xyz.com','$2a$10$M6HD.VMtr13/uUR3wvL2JegdFmSYd3oNDM8JcPH.WxE7r7Ym0FNWe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,171,NULL,NULL,NULL,NULL),(230,'5974',3,NULL,NULL,'5974@xyz.com','$2a$10$m2TMzbD0vmRrbgs1DRGrm.Dd/wjRkVri71H0D3iT0L8sZHmC6zk0O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,175,NULL,NULL,NULL,NULL),(231,'5978',3,NULL,NULL,'5978@xyz.com','$2a$10$zRKCDwyJmU5Way.KgEYIk.Xq4JqtCIF1TXwmX3PAnm95KD/UKcgdC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,179,NULL,NULL,NULL,NULL),(232,'5981',3,NULL,NULL,'5981@xyz.com','$2a$10$oFBSKDROZBSvd539nWGb3OscUaVI4TzgfHkdZuYBjm2Xd2/Z1GYJ6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,181,NULL,NULL,NULL,NULL),(233,'5984',3,NULL,NULL,'5984@xyz.com','$2a$10$RzEsxJc6REgJ.mZb.ERQF.fMTokIHQ72hxFk4zxw4WvAVsJh8V3tG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,183,NULL,NULL,NULL,NULL),(234,'6201',3,NULL,NULL,'6201@xyz.com','$2a$10$vH7srfagZZ3Z7vx4JbuZsOXLxDp7zT.zxDR1FMDxGJp0K/GkyHtDm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:04','2018-11-19 12:40:30',1,1,NULL,211,NULL,NULL,NULL,NULL),(235,'6312',3,NULL,NULL,'6312@xyz.com','$2a$10$x5Z1pC206h2IduL.6Io1fe/IWs9h7xvz5VF2SjoBV8nCbLAD/shHa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:30',1,1,NULL,222,NULL,NULL,NULL,NULL),(236,'6387',3,NULL,NULL,'6387@xyz.com','$2a$10$aDsUVFmxuGOjg19epRbkDO5/TkTleI9Kx0A87tyfTThr9zKUBUkIG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:30',1,1,NULL,233,NULL,NULL,NULL,NULL),(237,'6452',3,NULL,NULL,'6452@xyz.com','$2a$10$WsZeN1rMU7ClNGFE7hOZX.z3R5Rp2uAtPwcCvUVpSz9T7atuqtSXC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:30',1,1,NULL,238,NULL,NULL,NULL,NULL),(238,'6453',3,NULL,NULL,'6453@xyz.com','$2a$10$emEq.xcuS55Ms3Y1Qt.1fOz58kq2apmEdG0I.XprOE6umAbnI6MSS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:30',1,1,NULL,239,NULL,NULL,NULL,NULL),(239,'6472',3,NULL,NULL,'6472@xyz.com','$2a$10$R/ErG4YrBrnDFCzwj9M6AuztAzxvUmqpW/Djg4dgRHrynzNf4a66q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:31',1,1,NULL,244,NULL,NULL,NULL,NULL),(240,'6493',3,NULL,NULL,'6493@xyz.com','$2a$10$VVDvv7aqc6QKqSWnkeE.duvLq5GsiNqgjk.EMYGsAgt2FUIEhoOEC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:31',1,1,NULL,254,NULL,NULL,NULL,NULL),(241,'6516',3,NULL,NULL,'6516@xyz.com','$2a$10$IHpKMgNwxop7Z2shQYKW7.MmwNR9L.mkDAsFYz66szUZq8qnqxjLi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:31',1,1,NULL,258,NULL,NULL,NULL,NULL),(242,'6575',3,NULL,NULL,'6575@xyz.com','$2a$10$R8n1ADQF2PBYeijYxYKwO.q.hnujVPBkSXD5PPKXzVcnvSL84gQvO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:31',1,1,NULL,273,NULL,NULL,NULL,NULL),(243,'6576',3,NULL,NULL,'6576@xyz.com','$2a$10$gZ/gEa2IvW2ZiqJOteqr2OtFmQf4LWiLxZSWYUtoaMmXz0A/NiDAO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:05','2018-11-19 12:40:31',1,1,NULL,274,NULL,NULL,NULL,NULL),(244,'6618',3,NULL,NULL,'6618@xyz.com','$2a$10$N9docL0H.2RMzjoAqfzG3eIxqerCa7xDIj0LtdgaXBWILuoqbF5du',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,288,NULL,NULL,NULL,NULL),(245,'6624',3,NULL,NULL,'6624@xyz.com','$2a$10$VUF1Mp.Abbqn5BaTMENNdOmhjYjoef5xOjrvXwQvbIV3WLdJ1Qt9C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,290,NULL,NULL,NULL,NULL),(246,'6652',3,NULL,NULL,'6652@xyz.com','$2a$10$Rd3sC0LpxD4sJhnjpF5G.OiJgFzUJBXCnF.uuTelYX0p2v3wMGWNy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,294,NULL,NULL,NULL,NULL),(247,'6770',3,NULL,NULL,'6770@xyz.com','$2a$10$jMcSV4ZzsGHCjoz4fcGkqu6AXersmgrqA1BtwxSgORBsCg39yMuVW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,318,NULL,NULL,NULL,NULL),(248,'6894',3,NULL,NULL,'6894@xyz.com','$2a$10$8NFhUc17TT0Nc0weRUyGOOjjdAVHGRRnnS1iKk9G6.j2WdzVjraui',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,344,NULL,NULL,NULL,NULL),(249,'4204',3,NULL,NULL,'4204@xyz.com','$2a$10$9xUKnR57eUHcJUyJEUR75.bWHo0k8iDdS.RalGlrIX8PAvZqiq8Sm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,61,NULL,NULL,NULL,NULL),(250,'6308',3,NULL,NULL,'6308@xyz.com','$2a$10$AJCoLe7fM.l6QViR/BsCAuGYv6ZJQzA4afZOOmqfh18vAe6GUb4rW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:31',1,1,NULL,221,NULL,NULL,NULL,NULL),(251,'6471',3,NULL,NULL,'6471@xyz.com','$2a$10$bE6gZXbeekpTTQJRnCkkJuw79h7hae97RUAVC9F2RpC1fRh8J3GcC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:32',1,1,NULL,243,NULL,NULL,NULL,NULL),(252,'6570',3,NULL,NULL,'6570@xyz.com','$2a$10$6NEDWqpZSfHO8EO7WpfEb.xb/lbbdVQSyoaWakjPLybUAObvDUHqi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:06','2018-11-19 12:40:32',1,1,NULL,271,NULL,NULL,NULL,NULL),(253,'6577',3,NULL,NULL,'6577@xyz.com','$2a$10$zGLYxPKwCl/Vxc3IneiDb.JboxJFlPApzBdtZTU9iIRwu/59gsuYu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,275,NULL,NULL,NULL,NULL),(254,'6771',3,NULL,NULL,'6771@xyz.com','$2a$10$GsBfpj6Pvts./d3Lyb4tY.j0pztwU/V5X.9eHCcZvkFaVaHOtDlYe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,319,NULL,NULL,NULL,NULL),(255,'6868',3,NULL,NULL,'6868@xyz.com','$2a$10$dru4Dd9uqIC5jA0u6UBtKOD16AUHRVZRXe8T39zqwBa9wNQmY/ZWq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,339,NULL,NULL,NULL,NULL),(256,'4248',5,NULL,NULL,'4248@xyz.com','$2a$10$L9tm3rroOVEcmCEJGkZCbuxWKdRB5HtGwImDj43IgAHbn/Pzh/Q.K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,65,NULL,NULL,NULL,NULL),(257,'4950',3,NULL,NULL,'4950@xyz.com','$2a$10$4Ebum7MTpvKK4VZdWT42memla.fTKVTm0clS5eb3jPhe.O111bqNu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,101,NULL,NULL,NULL,NULL),(258,'2461',3,NULL,NULL,'2461@xyz.com','$2a$10$PGB4RqFvQiV16ABsyGWeg.6xNlMNd9SA08/bAZCbd0Z6qOroB2veu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,6,NULL,NULL,NULL,NULL),(259,'5635',3,NULL,NULL,'5635@xyz.com','$2a$10$Prpnp.jWXVs7fNzYU7gm1uEItBgup5O.0CeIfMmdkNJLQQ9aTujW6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,137,NULL,NULL,NULL,NULL),(260,'6483',3,NULL,NULL,'6483@xyz.com','$2a$10$sIpn/4I0m1HJflkwpGjyZuK4m1efnFofvPdSCa7m8j7HqeF6ptBJy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,250,NULL,NULL,NULL,NULL),(261,'6908',3,NULL,NULL,'6908@xyz.com','$2a$10$qAPRNivI4yEMzPQ88dWdfO1qov1HKS7CntzixXsJaq2FDYzdx6plu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:07','2018-11-19 12:40:32',1,1,NULL,348,NULL,NULL,NULL,NULL),(262,'6612',3,NULL,NULL,'6612@xyz.com','$2a$10$vqRWPVj6k95X7lRreW.U4u2OccIdR9mad6uGQKJdS/rO7Sg9.kflm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,286,NULL,NULL,NULL,NULL),(263,'2397',3,NULL,NULL,'2397@xyz.com','$2a$10$PtC6SE9p8.CSQRN9nBvysuDiIxn/HIXcYKc0Fhv/7Z0jLReVgS/YC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,4,NULL,NULL,NULL,NULL),(264,'2690',3,NULL,NULL,'2690@xyz.com','$2a$10$AM53CrbdArMzrTyru5KfJuKv7b/FWIPqhYhDVB4k6AYWmfadpyJTC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,15,NULL,NULL,NULL,NULL),(265,'4711',3,NULL,NULL,'4711@xyz.com','$2a$10$JlKd6unWcYE/JbIsiNHZv.ZO.GAUxsgv3MFPFL7rIaECZwfknXoxe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,79,NULL,NULL,NULL,NULL),(266,'4750',3,NULL,NULL,'4750@xyz.com','$2a$10$7Ig9LuEOKAgNfVzfqIkB6uZgPe12iQZER3GQFcABbxOE5Zd9bPUZy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,83,NULL,NULL,NULL,NULL),(267,'5380',3,NULL,NULL,'5380@xyz.com','$2a$10$pbIoB7kDkCwpsATWmKUYn.tUpbJ4BtAh4zkjckogID/.c1.ttQo4m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,128,NULL,NULL,NULL,NULL),(268,'6177',3,NULL,NULL,'6177@xyz.com','$2a$10$ySJEumT5XYp1qNuq8PwlCulqf6Pop9OaP/mTd3Y8qzZWBn2WtipfS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,207,NULL,NULL,NULL,NULL),(269,'4945',3,NULL,NULL,'4945@xyz.com','$2a$10$mgK7Umkzgd8FfSDIKYAPE.WlirT2rNpdyoKd3TFjGH2t1iUIVa6ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,97,NULL,NULL,NULL,NULL),(270,'6522',3,NULL,NULL,'6522@xyz.com','$2a$10$qzoe.AgoTcwuDImdrerswO1sHMe1RTyeLVu2dj5zvk/TeNHm3rGVa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:08','2018-11-19 12:40:33',1,1,NULL,262,NULL,NULL,NULL,NULL),(271,'3171',3,NULL,NULL,'3171@xyz.com','$2a$10$tttu5MSWmJTvw5h7wbvseOaaj8H7DxTEcSIxjeB8ztaW0WfRj.Wbe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:33',1,1,NULL,41,NULL,NULL,NULL,NULL),(272,'5988',3,NULL,NULL,'5988@xyz.com','$2a$10$V1RgrLoyzzhS5Od76neU8.9K.tSfOc3pnBfCldzRjvQJc4g.mSIQu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:33',1,1,NULL,186,NULL,NULL,NULL,NULL),(273,'5960',3,NULL,NULL,'5960@xyz.com','$2a$10$E6vABF0jmlou9I4aAnxoluaX/ROjjghvE/hIfoyALRTCtcg3NwOVm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,164,NULL,NULL,NULL,NULL),(274,'6198',5,NULL,NULL,'6198@xyz.com','$2a$10$u6HW0Mq2ZIFhgv8ERcHOee932Ye/1N6donjAfssfsA/pI9vRGf2Na',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,210,NULL,NULL,NULL,NULL),(275,'3944',5,NULL,NULL,'3944@xyz.com','$2a$10$pQoOB7C4xeqkLCPR1o861OUA59qrbkj7ftDhjGuoeTNOTuz3tHHRS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,52,NULL,NULL,NULL,NULL),(276,'6890',3,NULL,NULL,'6890@xyz.com','$2a$10$BsI7CSQpgjyrCNpjP7atWeBkw7yQVhxj3eyOZ96n8RDbE3YRcsxqG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,343,NULL,NULL,NULL,NULL),(277,'5071',5,NULL,NULL,'5071@xyz.com','$2a$10$im6kneHkYGw/X2sjHfdP7OsyY9xC1l5JrqGnti/eJCE3NQnbijD3y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,106,NULL,NULL,NULL,NULL),(278,'2971',5,NULL,NULL,'2971@xyz.com','$2a$10$/H2ekX9tRnr87cWcBDOo/ewTdU83Y5j/5Pocd0rlHpBrqKf9DR0u2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,24,NULL,NULL,NULL,NULL),(279,'6566',5,NULL,NULL,'6566@xyz.com','$2a$10$3dsqTKw.i0hmHrF9U5x0KuyghIrU9Qr00wW2zBXgZ0Hi0VDSVrcNK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:09','2018-11-19 12:40:34',1,1,NULL,270,NULL,NULL,NULL,NULL),(280,'3524',5,NULL,NULL,'3524@xyz.com','$2a$10$IdLHOvslN9U3dTY4oPvtdOkyMU1spdS8JV4wMfhOIUO2OLbsfhV1K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:34',1,1,NULL,46,NULL,NULL,NULL,NULL),(281,'6131',5,NULL,NULL,'6131@xyz.com','$2a$10$vD/t54lzkHUsEdRdlIfue.khccWM99rBjcG2w60CkpivDdgUZ.o4G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:34',1,1,NULL,195,NULL,NULL,NULL,NULL),(282,'6347',3,NULL,NULL,'6347@xyz.com','$2a$10$W1LjQlYYIW4LRwTmIcEHq.WapcJ1KC.1rPnDxz7PC0gNRBTxbaK9K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:34',1,1,NULL,230,NULL,NULL,NULL,NULL),(283,'3170',3,NULL,NULL,'3170@xyz.com','$2a$10$O64/2z3LM5l/qScsFE1XVOMwvGVpcYEXXIUk.CLLLOyyjMSlNKp4u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:34',1,1,NULL,40,NULL,NULL,NULL,NULL),(284,'6920',3,NULL,NULL,'6920@xyz.com','$2a$10$X9bQbt0qpijhBBwIIh8.Eu1d6KlNkIPHcuQqL0TYPwunwiGsmbJ6u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:35',1,1,NULL,353,NULL,NULL,NULL,NULL),(285,'3110',3,NULL,NULL,'3110@xyz.com','$2a$10$RaNfGCY7R3lf6QmqEQ49S.Om2qvDND1TlienrYBVKtYbmNe210e4m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:35',1,1,NULL,33,NULL,NULL,NULL,NULL),(286,'5189',3,NULL,NULL,'5189@xyz.com','$2a$10$mjkq7VchoZ41vWLBEw2v1.r7p9n4nGsMjBajnGC6X6QRIzNJu0J66',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:35',1,1,NULL,122,NULL,NULL,NULL,NULL),(287,'4153',3,NULL,NULL,'4153@xyz.com','$2a$10$tizQDJ/nQ/p22Xic.Z7jO.LiDfibDGcRihy9Or5R5ntBd1rQ92piy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:35',1,1,NULL,57,NULL,NULL,NULL,NULL),(288,'3948',3,NULL,NULL,'3948@xyz.com','$2a$10$8S7zd1SBdhgcfQTXWCm8y.s/v2//1mNgMFfBIE4.9GFahubBo7wle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:10','2018-11-19 12:40:35',1,1,NULL,54,NULL,NULL,NULL,NULL),(289,'4169',3,NULL,NULL,'4169@xyz.com','$2a$10$Oc4o2yPsGQ6Tf2d.Q0bo2uiBGRKRdlCw3W484MDQPRVZ3mcbxJvUW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,58,NULL,NULL,NULL,NULL),(290,'6880',2,NULL,NULL,'6880@xyz.com','$2a$10$YSbxaOl0qH44CKnK1yfOJOdZ7WCyYwoGN/URSBZFUq2Jof/A.4f4G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,340,NULL,NULL,NULL,NULL),(291,'6271',3,NULL,NULL,'6271@xyz.com','$2a$10$bGnLmhkidKWj4nBAlwaYO.oBBalBCdepRNaPOY.xtRPbdQy16jtMy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,220,NULL,NULL,NULL,NULL),(292,'6345',3,NULL,NULL,'6345@xyz.com','$2a$10$7UzJHyNK68UTiCrD5DaDzu4BcvzolerFBxNRK0sXvvuG9hEp/4lxq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,229,NULL,NULL,NULL,NULL),(293,'3952',3,NULL,NULL,'3952@xyz.com','$2a$10$hF7.flVCU6CS3sEHu1KSVe2MsgBM7B93FH/n1g7zKNaUREqinfQG.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,55,NULL,NULL,NULL,NULL),(294,'4235',5,NULL,NULL,'4235@xyz.com','$2a$10$YSDe6HkMltjuqJNzM6OT2.oB.3eLgolqarelGCbaleM1em2gxhMVq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:35',1,1,NULL,63,NULL,NULL,NULL,NULL),(295,'6623',5,NULL,NULL,'6623@xyz.com','$2a$10$kyks6sG6/KJo7tTB4Zbm2ORRg7Md3PhoFdaT/qKhowAZJtSxOojCy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:36',1,1,NULL,289,NULL,NULL,NULL,NULL),(296,'6245',3,NULL,NULL,'6245@xyz.com','$2a$10$kGVLoqjrFcNViRXqiz82tuCYISK71aBQhKXLGMQKPC3dxYEmlsp0i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:36',1,1,NULL,217,NULL,NULL,NULL,NULL),(297,'3173',3,NULL,NULL,'3173@xyz.com','$2a$10$4rRVlTYWwiMfBYMKNvZQ2eyavKr5Fc1pMWizIE5iNTK1uJyzET0qa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:11','2018-11-19 12:40:36',1,1,NULL,42,NULL,NULL,NULL,NULL),(298,'5684',3,NULL,NULL,'5684@xyz.com','$2a$10$TXD47ijXMqB1FNWaOlliN.upaoP1oo/PrSS2MZ42gm32MLsWygYN6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,141,NULL,NULL,NULL,NULL),(299,'6702',3,NULL,NULL,'6702@xyz.com','$2a$10$5dKMFl1Xo/ySzaEyuSKrUOlifsF4ugUT3SPze7Uf6uGVd0/v7abnW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,304,NULL,NULL,NULL,NULL),(300,'6706',3,NULL,NULL,'6706@xyz.com','$2a$10$5WlIt73iGHwdTetYSOcuOuqUSahMjcxX0tXwt3oeK3Vsfvk5EjtZC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,307,NULL,NULL,NULL,NULL),(301,'6504',3,NULL,NULL,'6504@xyz.com','$2a$10$1eX36RBWj0utkK684yhZve/qyoY/iVbruoNXq46HGYWnzGT/VHLbK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,256,NULL,NULL,NULL,NULL),(302,'5624',3,NULL,NULL,'5624@xyz.com','$2a$10$lyhAhmxp4ln5pZ.2LCx9lOZYWe0GscyqIQIMTpnZsu1PxrbDB8YIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,135,NULL,NULL,NULL,NULL),(303,'5625',3,NULL,NULL,'5625@xyz.com','$2a$10$09T6NOVRB.JQlrVLZrJAouqCmI2XojR1I1ZSXgWOKxXXQXv3QWpmy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,136,NULL,NULL,NULL,NULL),(304,'6319',3,NULL,NULL,'6319@xyz.com','$2a$10$xkCUQROt.27PDmZSNitLIu9/eIzsMnKqJLo0rdAqS4qDYHeURAarS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,225,NULL,NULL,NULL,NULL),(305,'6667',3,NULL,NULL,'6667@xyz.com','$2a$10$5GF76MnAdZd4HLFWvrOydul0ACowqW.BuzQXdUMaT3SPKvq3dobha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:36',1,1,NULL,296,NULL,NULL,NULL,NULL),(306,'6774',3,NULL,NULL,'6774@xyz.com','$2a$10$zpVJk/9u2Bs9A/edxKPYDuJBy9bq0er0Wp4aR7FoHMBr8l2295kAa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:12','2018-11-19 12:40:37',1,1,NULL,320,NULL,NULL,NULL,NULL),(307,'4202',3,NULL,NULL,'4202@xyz.com','$2a$10$.tRODwyW6OzZg./r3qYFbeBhBedYU0xL2M.gUyXrqdWlTpzDdplPC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,60,NULL,NULL,NULL,NULL),(308,'4247',3,NULL,NULL,'4247@xyz.com','$2a$10$OaZqNyVdNZC0YN2x/5GN4.xtLvHwN29GmxiRhAuhEZKh1hbAR4hG.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,64,NULL,NULL,NULL,NULL),(309,'4399',5,NULL,NULL,'4399@xyz.com','$2a$10$pHSWQeOJZzTBfoBXs3Xr.eCQx6p1wEfubHrouGbmrZF38Uc5/UQWu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,71,NULL,NULL,NULL,NULL),(310,'6176',5,NULL,NULL,'6176@xyz.com','$2a$10$Z2hSoyZtvfwU4FSKd/8UJuW8YsGPIq8Nte9GiT5dZoRNbfR7TpVEm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,206,NULL,NULL,NULL,NULL),(311,'5656',3,NULL,NULL,'5656@xyz.com','$2a$10$bTK46sDPdg.qCMXrbikcxOGbl7rMobtAV76EjjV9fPkKlRned4xWG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,139,NULL,NULL,NULL,NULL),(312,'6735',3,NULL,NULL,'6735@xyz.com','$2a$10$DcKeVm0jP0.j/U2IjdOoyuy6E8KuQrYDp2Y/gnhptZQ6zBZLKAVUi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,316,NULL,NULL,NULL,NULL),(313,'4556',3,NULL,NULL,'4556@xyz.com','$2a$10$82z4KMeXFk6m.yYsd4/o2ui9526kjzpx3wIOB7vG5a/359JC3Hciu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,76,NULL,NULL,NULL,NULL),(314,'6019',3,NULL,NULL,'6019@xyz.com','$2a$10$YKOQaqbAv3VdsnMTYOq3aOWvxLLRKBbbSYzp6EX8dabQ52pCR0ds2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,190,NULL,NULL,NULL,NULL),(315,'5591',3,NULL,NULL,'5591@xyz.com','$2a$10$j5jqPygIH87NsTEm3ZdeMuwUFhwtqdsZ41oz78FS9MCPXFDbpN2q6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:13','2018-11-19 12:40:37',1,1,NULL,133,NULL,NULL,NULL,NULL),(316,'6318',3,NULL,NULL,'6318@xyz.com','$2a$10$.zKtt2Wtxn.DpBAr98Kq3.dj2K.GR0F3WSF1/SfoBDqbKOmnlzPqG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:14','2018-11-19 12:40:37',1,1,NULL,224,NULL,NULL,NULL,NULL),(317,'6606',3,NULL,NULL,'6606@xyz.com','$2a$10$smq12aHn5/h6/9Qsrv.GHOFdkm7eUOAldhwKzGKJy9NG/kK/8LHiC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:14','2018-11-19 12:40:37',1,1,NULL,284,NULL,NULL,NULL,NULL),(318,'6898',3,NULL,NULL,'6898@xyz.com','$2a$10$cVKT63iQgxl6nGkpVU6LpeRMD8aCjO8/18vbADeeg7063rhKDzN3W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:14','2018-11-19 12:40:38',1,1,NULL,345,NULL,NULL,NULL,NULL),(319,'6664',3,NULL,NULL,'6664@xyz.com','$2a$10$tIJ5ase/SOSk2QkcfseYhuRhqG.expJbK5NErF46DD/vMdGcbZzF.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:14','2018-11-19 12:40:38',1,1,NULL,295,NULL,NULL,NULL,NULL),(320,'6459',3,NULL,NULL,'6459@xyz.com','$2a$10$L988S/lNOfjPxz3x5LbDnuYOYjgaBaM32deeLEczoCsC/UFY7Y7.C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:38:14','2018-11-19 12:40:38',1,1,NULL,241,NULL,NULL,NULL,NULL),(321,'3812',3,NULL,NULL,'3812@xyz.com','$2a$10$I0KUni9LdE27.kV6K/zqmutR4b3Cj6LiUgNzd86flgBhkSQ.gPIqi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:43:20','2018-11-19 12:40:38',1,1,NULL,48,NULL,NULL,NULL,NULL),(322,'4033',3,NULL,NULL,'4033@xyz.com','$2a$10$hW3/45O4h1kRhmhhYy6YwOWdxXAWB4yuyjX0EiyXk36UjktKJldsG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:43:21','2018-11-19 12:40:38',1,1,NULL,56,NULL,NULL,NULL,NULL),(323,'5734',3,NULL,NULL,'5734@xyz.com','$2a$10$sUyiPwI0TjPPo2y5hQGqkukcMecmaSRzWH9KvpjlQjafahJ5wX2fy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:43:21','2018-11-19 12:40:38',1,1,NULL,143,NULL,NULL,NULL,NULL),(324,'8617',3,NULL,NULL,'8617@xyz.com','$2a$10$7aVUOtqo1Ukfz0F9ZH/EB.X5VTGer6Pn9n8dhq30e4GXZpy3tVU9a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:43:21','2018-11-19 12:40:38',1,1,NULL,359,NULL,NULL,NULL,NULL),(325,'8650',3,NULL,NULL,'8650@xyz.com','$2a$10$o4UDSQhT0xqrehmGc2cFw.FQD.gpBUM1R5vd1A81nEJlmKjdEdQH.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-11-19 09:43:21','2018-11-19 12:40:38',1,2,NULL,364,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,'101','Bank','',NULL,'2018-11-17 10:02:57','2018-11-17 10:02:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_periods`
--

LOCK TABLES `payroll_periods` WRITE;
/*!40000 ALTER TABLE `payroll_periods` DISABLE KEYS */;
INSERT INTO `payroll_periods` VALUES (1,'2018-11-01','2018-11-30',1,'2018-11-19 12:12:32','2018-11-19 12:12:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_employers`
--

LOCK TABLES `pf_employers` WRITE;
/*!40000 ALTER TABLE `pf_employers` DISABLE KEYS */;
INSERT INTO `pf_employers` VALUES (1,'1',12,'2018-09-01','2019-08-31',1,NULL,'2018-11-19 12:00:09','2018-11-19 12:00:09');
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
INSERT INTO `pf_masters` VALUES (1,1,12.00,'2018-09-01',4500.00,'1,23',1,NULL,'2018-11-19 11:21:37','2018-11-19 11:21:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_tax_masters`
--

LOCK TABLES `professional_tax_masters` WRITE;
/*!40000 ALTER TABLE `professional_tax_masters` DISABLE KEYS */;
INSERT INTO `professional_tax_masters` VALUES (1,'1,2,3,4,5,6,7,8,23',7500,10000,175,175,'2018-09-01',NULL,1,NULL,3,0,'2018-11-19 11:41:04','2018-11-19 11:47:26'),(2,'1,2,3,4,5,6,7,8,23',7500,10000,175,175,'2018-09-01',NULL,1,NULL,1,0,'2018-11-19 11:50:35','2018-11-19 11:50:35'),(3,'1,2,3,4,5,6,7,8,23',7500,10000,175,175,'2018-09-01',NULL,1,NULL,2,0,'2018-11-19 11:52:46','2018-11-19 11:52:46'),(4,'1,2,3,4,5,6,7,8,23',7500,10000,175,175,'2018-09-01',NULL,1,NULL,4,0,'2018-11-19 11:53:19','2018-11-19 11:53:19'),(5,'1,2,3,4,5,6,7,8,23',7500,10000,175,175,'2018-09-01',NULL,1,NULL,5,0,'2018-11-19 11:53:43','2018-11-19 11:53:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,255,1,'2018-11-17 10:13:02','2018-11-17 10:13:02'),(2,NULL,NULL,NULL,13,1,'2018-11-19 06:03:56','2018-11-19 06:03:56'),(3,NULL,NULL,NULL,24,1,'2018-11-19 06:04:07','2018-11-19 06:57:35'),(4,NULL,NULL,NULL,26,1,'2018-11-19 06:04:43','2018-11-19 06:04:43'),(5,NULL,NULL,NULL,43,1,'2018-11-19 06:05:20','2018-11-19 06:05:20'),(6,NULL,NULL,NULL,46,1,'2018-11-19 06:05:35','2018-11-19 06:05:35'),(7,NULL,NULL,NULL,47,1,'2018-11-19 06:05:48','2018-11-19 06:05:52'),(8,NULL,NULL,NULL,51,1,'2018-11-19 06:06:04','2018-11-19 06:06:04'),(9,NULL,NULL,NULL,52,1,'2018-11-19 06:06:32','2018-11-19 06:06:32'),(10,NULL,NULL,NULL,63,1,'2018-11-19 06:06:43','2018-11-19 06:06:43'),(11,NULL,NULL,NULL,65,1,'2018-11-19 06:07:09','2018-11-19 06:07:09'),(12,NULL,NULL,NULL,69,1,'2018-11-19 06:07:20','2018-11-19 06:07:20'),(13,NULL,NULL,NULL,71,1,'2018-11-19 06:08:00','2018-11-19 06:08:00'),(14,NULL,NULL,NULL,103,1,'2018-11-19 06:08:18','2018-11-19 06:08:18'),(15,NULL,NULL,NULL,106,1,'2018-11-19 06:08:26','2018-11-19 06:08:26'),(16,NULL,NULL,NULL,131,1,'2018-11-19 06:08:41','2018-11-19 06:08:41'),(17,NULL,NULL,NULL,138,1,'2018-11-19 06:08:56','2018-11-19 06:08:56'),(18,NULL,NULL,NULL,195,1,'2018-11-19 06:09:22','2018-11-19 06:09:22'),(19,NULL,NULL,NULL,206,1,'2018-11-19 06:09:34','2018-11-19 06:09:34'),(20,NULL,NULL,NULL,210,1,'2018-11-19 06:09:44','2018-11-19 06:09:44'),(21,NULL,NULL,NULL,212,1,'2018-11-19 06:09:55','2018-11-19 06:09:55'),(22,NULL,NULL,NULL,228,1,'2018-11-19 06:10:08','2018-11-19 06:10:08'),(23,NULL,NULL,NULL,231,1,'2018-11-19 06:10:17','2018-11-19 06:10:17'),(24,NULL,NULL,NULL,270,1,'2018-11-19 06:10:46','2018-11-19 06:10:46'),(25,NULL,NULL,NULL,289,1,'2018-11-19 06:10:56','2018-11-19 06:10:56'),(26,NULL,NULL,NULL,343,1,'2018-11-19 06:11:04','2018-11-19 06:11:04'),(27,NULL,NULL,NULL,351,1,'2018-11-19 06:11:13','2018-11-19 06:11:13'),(28,NULL,NULL,NULL,357,1,'2018-11-19 06:11:53','2018-11-19 06:11:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'CODE','GroupAdmin','',NULL,'2018-11-17 10:13:55','2018-11-17 10:13:55'),(2,'UR_1001','Admin','',NULL,'2018-11-19 05:32:52','2018-11-19 05:32:52'),(3,'UR_1002','Employee','',NULL,'2018-11-19 05:33:10','2018-11-19 05:33:10'),(4,'UR_1003','Manager','',NULL,'2018-11-19 05:33:28','2018-11-19 05:33:28'),(5,'UR_1004','Supervisor','',NULL,'2018-11-19 05:33:44','2018-11-19 05:33:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
INSERT INTO `salary_component_templates` VALUES (1,'ST_1001',1,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2018-11-19 08:02:55','2018-11-19 08:02:55'),(3,'ST_1001',1,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2018-11-19 08:03:14','2018-11-19 08:03:14'),(4,'ST_1001',1,3,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2018-11-19 08:03:20','2018-11-19 08:03:20'),(5,'ST_1001',1,5,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2018-11-19 08:03:28','2018-11-19 08:03:28'),(6,'ST_1001',1,22,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2018-11-19 08:03:37','2018-11-19 08:03:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'1001','Basic','',NULL,0,NULL,'No',1,1,'2018-11-19 06:49:04','2018-11-19 07:19:17'),(2,'1002','HRA','',NULL,0,NULL,'No',1,1,'2018-11-19 06:49:04','2018-11-19 07:19:52'),(3,'1003','Conveyance Allowance','',NULL,0,NULL,'No',1,1,'2018-11-19 06:49:04','2018-11-19 07:28:06'),(4,'1004','Medical Allowance',NULL,NULL,0,NULL,'No',0,1,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(5,'1005','Children Education Allowance','',NULL,0,NULL,'No',1,1,'2018-11-19 06:49:04','2018-11-19 07:28:25'),(6,'1006','Other Allowance',NULL,NULL,0,NULL,'No',0,1,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(7,'1007','Washing Allowance',NULL,NULL,0,NULL,'No',0,1,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(8,'1008','Newspaper Allowance',NULL,NULL,0,NULL,'No',0,1,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(9,'1009','Provident Fund','',NULL,0,NULL,'No',1,0,'2018-11-19 06:49:04','2018-11-19 11:16:43'),(10,'1010','ESIC','',NULL,0,NULL,'Yes',1,0,'2018-11-19 06:49:04','2018-11-19 07:34:32'),(11,'1011','Income Tax',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(12,'1012','Other Deduction',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(13,'1013','Professional Tax',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(14,'1014','Welfare',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(15,'1015','Mobile Deduction',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(16,'1016','Monthly Arrear',NULL,NULL,0,NULL,'No',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(17,'1017','Advance',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(18,'1018','Latemark Deduction',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(19,'1019','GMC',NULL,NULL,0,NULL,'Yes',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(20,'1020','Bank Loan',NULL,NULL,0,NULL,'No',0,0,'2018-11-19 06:49:04','2018-11-19 06:49:04'),(21,'1021','Leave Traveling Allowance','',NULL,NULL,NULL,'',1,0,'2018-11-19 07:43:18','2018-11-19 07:46:26'),(22,'1022','Special Allowance','',NULL,NULL,NULL,'',1,0,'2018-11-19 07:46:17','2018-11-19 07:46:17'),(23,'1023','DA','',NULL,NULL,NULL,'',1,1,'2018-11-19 07:51:32','2018-11-19 11:17:04'),(24,'1024','Gratuity','',NULL,NULL,NULL,'',1,0,'2018-11-19 07:52:20','2018-11-19 07:52:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_templates`
--

LOCK TABLES `salary_templates` WRITE;
/*!40000 ALTER TABLE `salary_templates` DISABLE KEYS */;
INSERT INTO `salary_templates` VALUES (1,'ST_1001','','2018-09-01',1,NULL,'2018-11-19 08:00:03','2018-11-19 08:00:03');
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160113091730'),('20160113093434'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092244'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170508142940'),('20170508144515'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170616052732'),('20170617045509'),('20170617062016'),('20170617103654'),('20170619090333'),('20170619093726'),('20170620124404'),('20170621071225'),('20170623073735'),('20170628085423'),('20170803091421'),('20170822073828'),('20170926072224'),('20171015094950'),('20171211112950'),('20171215123749'),('20180101054304'),('20180106055307'),('20180106103351'),('20180111084545'),('20180112043259'),('20180112043926'),('20180112050823'),('20180112051349'),('20180115071109'),('20180117115112'),('20180118052827'),('20180119043105'),('20180120054240'),('20180122063826'),('20180123062737'),('20180123071508'),('20180125061315'),('20180129065031'),('20180130121254'),('20180131045512'),('20180131100047'),('20180131112409'),('20180131125432'),('20180205061421'),('20180205062146'),('20180206044138'),('20180209063251'),('20180219154812'),('20180302070901'),('20180305105413'),('20180306061915'),('20180314091129'),('20180320042856'),('20180327112339'),('20180329130218'),('20180330065333'),('20180330101308'),('20180405110211'),('20180413050118'),('20180413050928'),('20180413051226'),('20180413084503'),('20180413085146'),('20180424052059'),('20180425115559'),('20180502060522'),('20180503061619'),('20180614045158'),('20180614045932'),('20180614060121'),('20180615044220'),('20180615044537'),('20180616065854'),('20180616065955'),('20180618052731'),('20180618095019'),('20180620070911'),('20180705062420'),('20180705110754'),('20180706094527'),('20180707053515'),('20180710102444'),('20180710103031'),('20180725061956'),('20180725064223'),('20180725124208'),('20180725131843'),('20180727054525'),('20180829041504'),('20180829041547'),('20180829041648'),('20180829102000'),('20180903070010'),('20180905073002'),('20180910052338'),('20180910063334'),('20180910081112'),('20180910081735'),('20180910121243'),('20180910121244'),('20180911041233'),('20180911041234'),('20181001121954'),('20181003092326'),('20181004114059'),('20181014094257'),('20181117095625'),('20181117095909'),('20181117100031');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `well_faires`
--

LOCK TABLES `well_faires` WRITE;
/*!40000 ALTER TABLE `well_faires` DISABLE KEYS */;
INSERT INTO `well_faires` VALUES (1,'January',12.00,1,NULL,'2018-11-19 11:37:57','2018-11-19 11:37:57'),(2,'June',12.00,1,NULL,'2018-11-19 11:38:08','2018-11-19 11:38:08');
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

-- Dump completed on 2018-11-20 13:18:13
