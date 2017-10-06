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
-- Table structure for table `approval_processes`
--

DROP TABLE IF EXISTS `approval_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) DEFAULT NULL,
  `from` decimal(15,2) DEFAULT NULL,
  `to` decimal(15,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_approval_processes_on_membership_id` (`membership_id`),
  CONSTRAINT `fk_rails_c4fa317476` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_processes`
--

LOCK TABLES `approval_processes` WRITE;
/*!40000 ALTER TABLE `approval_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_processes` ENABLE KEYS */;
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
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(2,'AB+',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(3,'B+',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(4,'O+',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(5,'A-',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(6,'B-',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(7,'O-',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(8,'AB-',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18');
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
INSERT INTO `companies` VALUES (1,NULL,'1001','COM001','SG Analytics Pvt Limited','SG Analytics',1,'1234567890','ABCDE1234Z','','','Pune',1,20,504,'Pune',123456,'','','www.sg.com',NULL,'2017-08-03 09:41:24','2017-08-03 09:41:24',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'1001','COMLOC001','Pune','pune@gmail.com','','Pune',1,20,504,123456,'9874563201','2017-08-03 09:44:25','2017-08-03 09:44:25'),(2,1,'1002','COMLOC002','Hyderabad','','','Hyderabad',1,31,737,123456,'','2017-08-03 09:59:03','2017-08-03 09:59:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_types`
--

LOCK TABLES `company_types` WRITE;
/*!40000 ALTER TABLE `company_types` DISABLE KEYS */;
INSERT INTO `company_types` VALUES (1,'1001','Private Limited ',NULL,NULL,'2017-08-03 09:34:15','2017-08-03 09:34:15'),(2,'1002','Limited Liability Partnership',NULL,NULL,'2017-08-03 09:34:15','2017-08-03 09:34:15'),(3,'1003','Public Limited',NULL,NULL,'2017-08-03 09:34:15','2017-08-03 09:34:15');
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
INSERT INTO `cost_centers` VALUES (1,NULL,'Pool',NULL,NULL,'2017-08-04 04:13:33','2017-08-04 04:13:33'),(2,NULL,'Research',NULL,NULL,'2017-08-04 04:13:48','2017-08-04 04:13:48'),(3,NULL,'Primary Research',NULL,NULL,'2017-08-04 04:13:58','2017-08-04 04:13:58'),(4,NULL,'Analytics and Technology',NULL,NULL,'2017-08-04 04:14:09','2017-08-04 04:14:09'),(5,NULL,'Corporate',NULL,NULL,'2017-08-04 04:14:20','2017-08-04 04:14:20'),(6,NULL,'Sales and Business Development',NULL,NULL,'2017-08-04 04:14:31','2017-08-04 04:14:31');
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
INSERT INTO `countries` VALUES (1,'IN','India','2017-08-03 09:34:24','2017-08-03 09:34:24');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-08-03 09:41:24','2017-08-03 09:41:24'),(2,'company_location',2,'2017-08-03 09:44:25','2017-08-03 09:59:03'),(3,'employee',439,'2017-08-04 03:41:16','2017-08-04 03:41:44');
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
INSERT INTO `degree_streams` VALUES (1,'1001','Aerospace',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(2,'1002','Archaeology',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(3,'1003','Asian language and culture',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(4,'1004','Automotive ',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(5,'1005','Chemical',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(6,'1006','Civil',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(7,'1007','Commerce',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(8,'1008','Computer Application',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(9,'1009','Computer Architecture',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(10,'1010','Computer Sicence',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(11,'1011','Creative Writing',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(12,'1012','Electrical',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(13,'1013','Electrical & Electronics',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(14,'1014','Human Resource',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(15,'1015',' Informaton Technology  ',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(16,'1016','Marine',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(17,'1017','Mathematics',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(18,'1018','Mechanical',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(19,'1019','Philosophy',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(20,'1020','Psychology',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(21,'1021','Robotics',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(22,'1022','Saftey',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(23,'1023','Science',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(24,'1024','Textile',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21'),(25,'1025','Theater:Design & Production',NULL,NULL,'2017-08-03 09:34:21','2017-08-03 09:34:21');
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
INSERT INTO `degree_types` VALUES (1,'1001','Primary School',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(2,'1002','Middle School ',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(3,'1003','High School ',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(4,'1004','Senior Secondary',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(5,'1005','Diploma',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(6,'1006','Under Graduate',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(7,'1007','Graduate',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(8,'1008','Under Post Graduate',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(9,'1009','Post Graduation ',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(10,'1010','Professional',NULL,NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20');
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
INSERT INTO `degrees` VALUES (1,'1001','BCA ','Bachelor of Computer Application',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(2,'1002','BBA','Bachelor of Business Administration',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(3,'1003','B.Com ','Bachelor of Commerce   ',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(4,'1004',' B.Sc ','Bachelor of Science ',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(5,'1005','BA','Bachelor  of Arts  ',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(6,'1006','BE','Bachelor of Engineering   ',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(7,'1007','B.Tech','Bachelor of Technology',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(8,'1008','DCA','Diploma in Computer Application',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(9,'1009','ITI','Industial Training Institute',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(10,'1010','BSW','Bachelor  of Sociel Work',NULL,'2017-08-03 09:34:18','2017-08-03 09:34:18'),(11,'1011','Polytechnic','Polytechnic',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(12,'1012','LL.B','Bachelor of Laws',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(13,'1013','BCM','Bachelor of computer management',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(14,'1014','BFA','Bachelor  of Fine Arts ',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(15,'1015','BMS','Bachelor  of Management Study',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(16,'1016','BCS','Bachelor  of Computer Science',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(17,'1017','BBM','Bachelor  of Business Management',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(18,'1018','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(19,'1019','BHM','Bachelor  of Hotel Managemnet',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(20,'1020','B.Pharma','Bachachelor of Pharmacy',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(21,'1021','BS','Bachachelor of Science ',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(22,'1022','CS','Compnay Secrectary',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(23,'1023','CA','Chartered Accountant',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(24,'1024','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(25,'1025','MCA','Master of Computer Application',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(26,'1026','MBA','Master of Business Administration',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(27,'1027','M.Com','Master of Commerce',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(28,'1028','M.Sc','Master of Science',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(29,'1029','MA','Master of Arts',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(30,'1030','ME','Master of Engineering',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(31,'1031','M.Tech','Master of Technology ',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(32,'1032','PGDCA','Post Grduate Diploma in computer Application',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(33,'1033','MSW','Master of SocielWork ',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(34,'1034','LL.M ','Master of Laws',NULL,'2017-08-03 09:34:19','2017-08-03 09:34:19'),(35,'1035','MCM','Master of computer management',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(36,'1036','MFA','Master of Fine Arts ',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(37,'1037','MMS','Master of Management Studies',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(38,'1038','MCS','Matser of Computer Science',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(39,'1039','MBM','Master in Business Management',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(40,'1040','MJMC','Master of Journalism and Mass Communication',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(41,'1041','MHM','Master in Hotel Management ',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(42,'1042','M.Pharma',' Master of Pharmacy',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(43,'1043','MS',' Master of Science',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20'),(44,'1044','MD','Medicinae Doctor ',NULL,'2017-08-03 09:34:20','2017-08-03 09:34:20');
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
INSERT INTO `department_types` VALUES (1,'1001','Executive','Executive',NULL,'2017-08-03 09:34:15','2017-08-03 09:34:15'),(2,'1002','Operations','Operation',NULL,'2017-08-03 09:34:15','2017-08-03 10:07:21'),(3,'1003','Support','Support',NULL,'2017-08-03 09:34:15','2017-08-03 09:34:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'D001','1001',NULL,'Equity Research',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(2,1,'D002','1002',NULL,'Quantitative Research',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(3,1,'D003','1003',NULL,'Fixed Income',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(4,1,'D004','1004',NULL,'Investment Banking',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(5,1,'D005','1005',NULL,'Business Research and Consulting',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(6,1,'D006','1006',NULL,'Environment Social Governance',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(7,1,'D007','1007',NULL,'FDAA',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(8,1,'D008','1008',NULL,'Dedicated',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(9,1,'D009','1009',NULL,'General',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(10,1,'D010','1010',NULL,'PR 1',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(11,1,'D011','1011',NULL,'PR 2',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(12,1,'D012','1012',NULL,'Pharma and Life Sciences',2,NULL,NULL,'2017-08-03 10:08:17','2017-08-03 10:08:17'),(14,1,'D014','1014',NULL,'General',2,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(15,1,'D015','1015',NULL,'Social Media',2,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(16,1,'D016','1016',NULL,'Technology',2,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(18,1,'D018','1018',NULL,'General',2,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(19,1,'D019','1019',NULL,'Admin',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(20,1,'D020','1020',NULL,'Human Resources',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(21,1,'D021','1021',NULL,'Information Technology',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(22,1,'D022','1022',NULL,'Operations Efficiency',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(23,1,'D023','1023',NULL,'Finance',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(24,1,'D024','1024',NULL,'Designing & Editorial',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(25,1,'D025','1025',NULL,'Management',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(26,1,'D026','1026',NULL,'General',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(27,1,'D027','1027',NULL,'Pre-sales',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(28,1,'D028','1028',NULL,'Business Development',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(29,2,'D029','1029','','Dedicated',2,'',NULL,'2017-08-03 10:08:18','2017-08-04 04:50:30'),(30,2,'D030','1030',NULL,'Technology',2,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(31,2,'D031','1031',NULL,'Admin',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18'),(32,2,'D032','1032',NULL,'Human Resources',3,NULL,NULL,'2017-08-03 10:08:18','2017-08-03 10:08:18');
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
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-08-03 09:34:26','2017-08-03 09:34:26'),(2,1,NULL,'Port Blair','2017-08-03 09:34:26','2017-08-03 09:34:26'),(3,1,NULL,'Sawi','2017-08-03 09:34:26','2017-08-03 09:34:26'),(4,2,NULL,'Akividu','2017-08-03 09:34:26','2017-08-03 09:34:26'),(5,2,NULL,'Amalapuram','2017-08-03 09:34:26','2017-08-03 09:34:26'),(6,2,NULL,'Anantapur','2017-08-03 09:34:26','2017-08-03 09:34:26'),(7,2,NULL,'Andra','2017-08-03 09:34:26','2017-08-03 09:34:26'),(8,2,NULL,'Avanigadda','2017-08-03 09:34:26','2017-08-03 09:34:26'),(9,2,NULL,'Bapatla','2017-08-03 09:34:27','2017-08-03 09:34:27'),(10,2,NULL,'Bhimavaram','2017-08-03 09:34:27','2017-08-03 09:34:27'),(11,2,NULL,'Bobbili','2017-08-03 09:34:27','2017-08-03 09:34:27'),(12,2,NULL,'Chirala','2017-08-03 09:34:27','2017-08-03 09:34:27'),(13,2,NULL,'Chittoor','2017-08-03 09:34:27','2017-08-03 09:34:27'),(14,2,NULL,'Cumbum','2017-08-03 09:34:27','2017-08-03 09:34:27'),(15,2,NULL,'Darsi','2017-08-03 09:34:27','2017-08-03 09:34:27'),(16,2,NULL,'Dhone','2017-08-03 09:34:27','2017-08-03 09:34:27'),(17,2,NULL,'Eluru','2017-08-03 09:34:27','2017-08-03 09:34:27'),(18,2,NULL,'Gampalagudem','2017-08-03 09:34:27','2017-08-03 09:34:27'),(19,2,NULL,'Gannavaram','2017-08-03 09:34:27','2017-08-03 09:34:27'),(20,2,NULL,'Gorantla','2017-08-03 09:34:27','2017-08-03 09:34:27'),(21,2,NULL,'Gudivada','2017-08-03 09:34:27','2017-08-03 09:34:27'),(22,2,NULL,'Guntur','2017-08-03 09:34:27','2017-08-03 09:34:27'),(23,2,NULL,'Kadapa','2017-08-03 09:34:27','2017-08-03 09:34:27'),(24,2,NULL,'Kakinada','2017-08-03 09:34:27','2017-08-03 09:34:27'),(25,2,NULL,'Kanigiri','2017-08-03 09:34:27','2017-08-03 09:34:27'),(26,2,NULL,'Kavali','2017-08-03 09:34:27','2017-08-03 09:34:27'),(27,2,NULL,'Kovvur','2017-08-03 09:34:27','2017-08-03 09:34:27'),(28,2,NULL,'Kuppam','2017-08-03 09:34:27','2017-08-03 09:34:27'),(29,2,NULL,'Kurnool','2017-08-03 09:34:27','2017-08-03 09:34:27'),(30,2,NULL,'Machilipatnam','2017-08-03 09:34:27','2017-08-03 09:34:27'),(31,2,NULL,'Madanapalle','2017-08-03 09:34:27','2017-08-03 09:34:27'),(32,2,NULL,'Mahal','2017-08-03 09:34:27','2017-08-03 09:34:27'),(33,2,NULL,'Mandapeta','2017-08-03 09:34:28','2017-08-03 09:34:28'),(34,2,NULL,'Mangalagiri','2017-08-03 09:34:28','2017-08-03 09:34:28'),(35,2,NULL,'Markapur','2017-08-03 09:34:28','2017-08-03 09:34:28'),(36,2,NULL,'Medarametla','2017-08-03 09:34:28','2017-08-03 09:34:28'),(37,2,NULL,'Muddanuru','2017-08-03 09:34:28','2017-08-03 09:34:28'),(38,2,NULL,'Nagari','2017-08-03 09:34:28','2017-08-03 09:34:28'),(39,2,NULL,'Nandigama','2017-08-03 09:34:28','2017-08-03 09:34:28'),(40,2,NULL,'Nandyal','2017-08-03 09:34:28','2017-08-03 09:34:28'),(41,2,NULL,'Narasaraopet','2017-08-03 09:34:28','2017-08-03 09:34:28'),(42,2,NULL,'Nellore','2017-08-03 09:34:28','2017-08-03 09:34:28'),(43,2,NULL,'Nuzvid','2017-08-03 09:34:28','2017-08-03 09:34:28'),(44,2,NULL,'Ongole','2017-08-03 09:34:28','2017-08-03 09:34:28'),(45,2,NULL,'Pakala','2017-08-03 09:34:28','2017-08-03 09:34:28'),(46,2,NULL,'Peddapuram','2017-08-03 09:34:28','2017-08-03 09:34:28'),(47,2,NULL,'Piduguralla','2017-08-03 09:34:28','2017-08-03 09:34:28'),(48,2,NULL,'Pileru','2017-08-03 09:34:28','2017-08-03 09:34:28'),(49,2,NULL,'Pithapuram','2017-08-03 09:34:28','2017-08-03 09:34:28'),(50,2,NULL,'Proddatur','2017-08-03 09:34:28','2017-08-03 09:34:28'),(51,2,NULL,'Puttur','2017-08-03 09:34:28','2017-08-03 09:34:28'),(52,2,NULL,'Rajahmundry','2017-08-03 09:34:28','2017-08-03 09:34:28'),(53,2,NULL,'Ramapuram','2017-08-03 09:34:28','2017-08-03 09:34:28'),(54,2,NULL,'Ramavaram','2017-08-03 09:34:28','2017-08-03 09:34:28'),(55,2,NULL,'Singarayakonda','2017-08-03 09:34:28','2017-08-03 09:34:28'),(56,2,NULL,'Srikakulam','2017-08-03 09:34:28','2017-08-03 09:34:28'),(57,2,NULL,'Tadepallegudem','2017-08-03 09:34:28','2017-08-03 09:34:28'),(58,2,NULL,'Tanuku','2017-08-03 09:34:29','2017-08-03 09:34:29'),(59,2,NULL,'Thenali','2017-08-03 09:34:29','2017-08-03 09:34:29'),(60,2,NULL,'Tirumala','2017-08-03 09:34:29','2017-08-03 09:34:29'),(61,2,NULL,'Tirumala - Tirupati','2017-08-03 09:34:29','2017-08-03 09:34:29'),(62,2,NULL,'Vijayawada','2017-08-03 09:34:29','2017-08-03 09:34:29'),(63,2,NULL,'Vinukonda','2017-08-03 09:34:29','2017-08-03 09:34:29'),(64,2,NULL,'Visakhapatnam','2017-08-03 09:34:29','2017-08-03 09:34:29'),(65,2,NULL,'Vizianagaram','2017-08-03 09:34:29','2017-08-03 09:34:29'),(66,2,NULL,'Yanam','2017-08-03 09:34:29','2017-08-03 09:34:29'),(67,3,NULL,'Hong','2017-08-03 09:34:29','2017-08-03 09:34:29'),(68,3,NULL,'Itanagar','2017-08-03 09:34:29','2017-08-03 09:34:29'),(69,4,NULL,'Arunachal','2017-08-03 09:34:29','2017-08-03 09:34:29'),(70,4,NULL,'Barpeta','2017-08-03 09:34:29','2017-08-03 09:34:29'),(71,4,NULL,'Bhandari','2017-08-03 09:34:29','2017-08-03 09:34:29'),(72,4,NULL,'Dhubri','2017-08-03 09:34:29','2017-08-03 09:34:29'),(73,4,NULL,'Dibrugarh','2017-08-03 09:34:29','2017-08-03 09:34:29'),(74,4,NULL,'Golaghat','2017-08-03 09:34:29','2017-08-03 09:34:29'),(75,4,NULL,'Goshaingaon','2017-08-03 09:34:29','2017-08-03 09:34:29'),(76,4,NULL,'Guwahati','2017-08-03 09:34:29','2017-08-03 09:34:29'),(77,4,NULL,'Jorhat','2017-08-03 09:34:29','2017-08-03 09:34:29'),(78,4,NULL,'Karimganj','2017-08-03 09:34:29','2017-08-03 09:34:29'),(79,4,NULL,'Kokrajhar','2017-08-03 09:34:29','2017-08-03 09:34:29'),(80,4,NULL,'Lala','2017-08-03 09:34:29','2017-08-03 09:34:29'),(81,4,NULL,'Nalbari','2017-08-03 09:34:29','2017-08-03 09:34:29'),(82,4,NULL,'Namrup','2017-08-03 09:34:30','2017-08-03 09:34:30'),(83,4,NULL,'Nazira','2017-08-03 09:34:30','2017-08-03 09:34:30'),(84,4,NULL,'North Lakhimpur','2017-08-03 09:34:30','2017-08-03 09:34:30'),(85,4,NULL,'Powai','2017-08-03 09:34:30','2017-08-03 09:34:30'),(86,4,NULL,'Sibsagar','2017-08-03 09:34:30','2017-08-03 09:34:30'),(87,4,NULL,'Silchar','2017-08-03 09:34:30','2017-08-03 09:34:30'),(88,4,NULL,'Tezpur','2017-08-03 09:34:30','2017-08-03 09:34:30'),(89,4,NULL,'Tinsukia','2017-08-03 09:34:30','2017-08-03 09:34:30'),(90,4,NULL,'Ulubari','2017-08-03 09:34:30','2017-08-03 09:34:30'),(91,5,NULL,'Banka','2017-08-03 09:34:30','2017-08-03 09:34:30'),(92,5,NULL,'Begusarai','2017-08-03 09:34:30','2017-08-03 09:34:30'),(93,5,NULL,'Bhagalpur','2017-08-03 09:34:30','2017-08-03 09:34:30'),(94,5,NULL,'Bhawanipur','2017-08-03 09:34:30','2017-08-03 09:34:30'),(95,5,NULL,'Bihar Sharif','2017-08-03 09:34:30','2017-08-03 09:34:30'),(96,5,NULL,'Chandan','2017-08-03 09:34:30','2017-08-03 09:34:30'),(97,5,NULL,'Darbhanga','2017-08-03 09:34:30','2017-08-03 09:34:30'),(98,5,NULL,'Dhaka','2017-08-03 09:34:30','2017-08-03 09:34:30'),(99,5,NULL,'Gaya','2017-08-03 09:34:30','2017-08-03 09:34:30'),(100,5,NULL,'Jaynagar','2017-08-03 09:34:30','2017-08-03 09:34:30'),(101,5,NULL,'Jha Jha','2017-08-03 09:34:30','2017-08-03 09:34:30'),(102,5,NULL,'Kamat','2017-08-03 09:34:30','2017-08-03 09:34:30'),(103,5,NULL,'Motihari','2017-08-03 09:34:30','2017-08-03 09:34:30'),(104,5,NULL,'Munger','2017-08-03 09:34:30','2017-08-03 09:34:30'),(105,5,NULL,'Muzaffarpur','2017-08-03 09:34:30','2017-08-03 09:34:30'),(106,5,NULL,'Patna','2017-08-03 09:34:30','2017-08-03 09:34:30'),(107,5,NULL,'Purnea','2017-08-03 09:34:31','2017-08-03 09:34:31'),(108,5,NULL,'Pusa','2017-08-03 09:34:31','2017-08-03 09:34:31'),(109,5,NULL,'Raxaul','2017-08-03 09:34:31','2017-08-03 09:34:31'),(110,5,NULL,'Sakri','2017-08-03 09:34:31','2017-08-03 09:34:31'),(111,5,NULL,'Samastipur','2017-08-03 09:34:31','2017-08-03 09:34:31'),(112,6,NULL,'Chandigarh','2017-08-03 09:34:31','2017-08-03 09:34:31'),(113,7,NULL,'Ambikapur','2017-08-03 09:34:31','2017-08-03 09:34:31'),(114,7,NULL,'Bemetara','2017-08-03 09:34:31','2017-08-03 09:34:31'),(115,7,NULL,'Bhatapara','2017-08-03 09:34:31','2017-08-03 09:34:31'),(116,7,NULL,'Bhilai','2017-08-03 09:34:31','2017-08-03 09:34:31'),(117,7,NULL,'Bilaspur','2017-08-03 09:34:31','2017-08-03 09:34:31'),(118,7,NULL,'Champa','2017-08-03 09:34:31','2017-08-03 09:34:31'),(119,7,NULL,'Dhamtari','2017-08-03 09:34:31','2017-08-03 09:34:31'),(120,7,NULL,'Durg','2017-08-03 09:34:31','2017-08-03 09:34:31'),(121,7,NULL,'Jagdalpur','2017-08-03 09:34:31','2017-08-03 09:34:31'),(122,7,NULL,'Janjgir','2017-08-03 09:34:31','2017-08-03 09:34:31'),(123,7,NULL,'Koni','2017-08-03 09:34:31','2017-08-03 09:34:31'),(124,7,NULL,'Korba','2017-08-03 09:34:31','2017-08-03 09:34:31'),(125,7,NULL,'Kumhari','2017-08-03 09:34:31','2017-08-03 09:34:31'),(126,7,NULL,'Lanka','2017-08-03 09:34:31','2017-08-03 09:34:31'),(127,7,NULL,'Mohala','2017-08-03 09:34:31','2017-08-03 09:34:31'),(128,7,NULL,'Raigarh','2017-08-03 09:34:31','2017-08-03 09:34:31'),(129,7,NULL,'Raipur','2017-08-03 09:34:31','2017-08-03 09:34:31'),(130,7,NULL,'Sukma','2017-08-03 09:34:31','2017-08-03 09:34:31'),(131,8,NULL,'Daman','2017-08-03 09:34:32','2017-08-03 09:34:32'),(132,9,NULL,'Alipur','2017-08-03 09:34:32','2017-08-03 09:34:32'),(133,9,NULL,'Bawana','2017-08-03 09:34:32','2017-08-03 09:34:32'),(134,9,NULL,'Connaught Place','2017-08-03 09:34:32','2017-08-03 09:34:32'),(135,9,NULL,'Delhi','2017-08-03 09:34:32','2017-08-03 09:34:32'),(136,9,NULL,'Kalkaji Devi','2017-08-03 09:34:32','2017-08-03 09:34:32'),(137,9,NULL,'Narela','2017-08-03 09:34:32','2017-08-03 09:34:32'),(138,9,NULL,'New Delhi','2017-08-03 09:34:32','2017-08-03 09:34:32'),(139,9,NULL,'Shahdara','2017-08-03 09:34:32','2017-08-03 09:34:32'),(140,10,NULL,'Amal','2017-08-03 09:34:32','2017-08-03 09:34:32'),(141,10,NULL,'Silvassa','2017-08-03 09:34:32','2017-08-03 09:34:32'),(142,11,NULL,'Aldona','2017-08-03 09:34:32','2017-08-03 09:34:32'),(143,11,NULL,'Arpora','2017-08-03 09:34:32','2017-08-03 09:34:32'),(144,11,NULL,'Assagao','2017-08-03 09:34:32','2017-08-03 09:34:32'),(145,11,NULL,'Bambolim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(146,11,NULL,'Betalbatim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(147,11,NULL,'Betim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(148,11,NULL,'Calangute','2017-08-03 09:34:32','2017-08-03 09:34:32'),(149,11,NULL,'Candolim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(150,11,NULL,'Caranzalem','2017-08-03 09:34:32','2017-08-03 09:34:32'),(151,11,NULL,'Chicalim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(152,11,NULL,'Cuncolim','2017-08-03 09:34:32','2017-08-03 09:34:32'),(153,11,NULL,'Curchorem','2017-08-03 09:34:32','2017-08-03 09:34:32'),(154,11,NULL,'Dicholi','2017-08-03 09:34:32','2017-08-03 09:34:32'),(155,11,NULL,'Dona Paula','2017-08-03 09:34:32','2017-08-03 09:34:32'),(156,11,NULL,'Goa','2017-08-03 09:34:32','2017-08-03 09:34:32'),(157,11,NULL,'Madgaon','2017-08-03 09:34:33','2017-08-03 09:34:33'),(158,11,NULL,'Marmagao','2017-08-03 09:34:33','2017-08-03 09:34:33'),(159,11,NULL,'Navelim','2017-08-03 09:34:33','2017-08-03 09:34:33'),(160,11,NULL,'Panjim','2017-08-03 09:34:33','2017-08-03 09:34:33'),(161,11,NULL,'Parra','2017-08-03 09:34:33','2017-08-03 09:34:33'),(162,11,NULL,'Ponda','2017-08-03 09:34:33','2017-08-03 09:34:33'),(163,11,NULL,'Quepem','2017-08-03 09:34:33','2017-08-03 09:34:33'),(164,11,NULL,'Saligao','2017-08-03 09:34:33','2017-08-03 09:34:33'),(165,11,NULL,'Sanquelim','2017-08-03 09:34:33','2017-08-03 09:34:33'),(166,11,NULL,'Solim','2017-08-03 09:34:33','2017-08-03 09:34:33'),(167,11,NULL,'Vainguinim','2017-08-03 09:34:33','2017-08-03 09:34:33'),(168,11,NULL,'Vasco','2017-08-03 09:34:33','2017-08-03 09:34:33'),(169,11,NULL,'Verna','2017-08-03 09:34:33','2017-08-03 09:34:33'),(170,12,NULL,'Ahmedabad','2017-08-03 09:34:33','2017-08-03 09:34:33'),(171,12,NULL,'Amreli','2017-08-03 09:34:33','2017-08-03 09:34:33'),(172,12,NULL,'Amroli','2017-08-03 09:34:33','2017-08-03 09:34:33'),(173,12,NULL,'Anand','2017-08-03 09:34:33','2017-08-03 09:34:33'),(174,12,NULL,'Ankleshwar','2017-08-03 09:34:33','2017-08-03 09:34:33'),(175,12,NULL,'Antapur','2017-08-03 09:34:33','2017-08-03 09:34:33'),(176,12,NULL,'Bardoli','2017-08-03 09:34:33','2017-08-03 09:34:33'),(177,12,NULL,'Basu','2017-08-03 09:34:33','2017-08-03 09:34:33'),(178,12,NULL,'Bhadath','2017-08-03 09:34:33','2017-08-03 09:34:33'),(179,12,NULL,'Bharuch','2017-08-03 09:34:33','2017-08-03 09:34:33'),(180,12,NULL,'Bhavnagar','2017-08-03 09:34:33','2017-08-03 09:34:33'),(181,12,NULL,'Bhuj','2017-08-03 09:34:34','2017-08-03 09:34:34'),(182,12,NULL,'Bilimora','2017-08-03 09:34:34','2017-08-03 09:34:34'),(183,12,NULL,'Chhota Udepur','2017-08-03 09:34:34','2017-08-03 09:34:34'),(184,12,NULL,'Dahod','2017-08-03 09:34:34','2017-08-03 09:34:34'),(185,12,NULL,'Dewan','2017-08-03 09:34:34','2017-08-03 09:34:34'),(186,12,NULL,'Dhansura','2017-08-03 09:34:34','2017-08-03 09:34:34'),(187,12,NULL,'Dhrol','2017-08-03 09:34:34','2017-08-03 09:34:34'),(188,12,NULL,'Dwarka','2017-08-03 09:34:34','2017-08-03 09:34:34'),(189,12,NULL,'Gandhidham','2017-08-03 09:34:34','2017-08-03 09:34:34'),(190,12,NULL,'Gandhinagar','2017-08-03 09:34:34','2017-08-03 09:34:34'),(191,12,NULL,'Ghana','2017-08-03 09:34:34','2017-08-03 09:34:34'),(192,12,NULL,'Godhra','2017-08-03 09:34:34','2017-08-03 09:34:34'),(193,12,NULL,'Himatnagar','2017-08-03 09:34:34','2017-08-03 09:34:34'),(194,12,NULL,'Jalalpur','2017-08-03 09:34:34','2017-08-03 09:34:34'),(195,12,NULL,'Jamnagar','2017-08-03 09:34:34','2017-08-03 09:34:34'),(196,12,NULL,'Junagadh','2017-08-03 09:34:34','2017-08-03 09:34:34'),(197,12,NULL,'Kalol','2017-08-03 09:34:34','2017-08-03 09:34:34'),(198,12,NULL,'Karamsad','2017-08-03 09:34:34','2017-08-03 09:34:34'),(199,12,NULL,'Keshod','2017-08-03 09:34:34','2017-08-03 09:34:34'),(200,12,NULL,'Khambhat','2017-08-03 09:34:34','2017-08-03 09:34:34'),(201,12,NULL,'Kheda','2017-08-03 09:34:34','2017-08-03 09:34:34'),(202,12,NULL,'Khergam','2017-08-03 09:34:34','2017-08-03 09:34:34'),(203,12,NULL,'Kosamba','2017-08-03 09:34:34','2017-08-03 09:34:34'),(204,12,NULL,'Mahesana','2017-08-03 09:34:34','2017-08-03 09:34:34'),(205,12,NULL,'Malpur','2017-08-03 09:34:34','2017-08-03 09:34:34'),(206,12,NULL,'Mandvi','2017-08-03 09:34:35','2017-08-03 09:34:35'),(207,12,NULL,'Matar','2017-08-03 09:34:35','2017-08-03 09:34:35'),(208,12,NULL,'Mithapur','2017-08-03 09:34:35','2017-08-03 09:34:35'),(209,12,NULL,'Modasa','2017-08-03 09:34:35','2017-08-03 09:34:35'),(210,12,NULL,'Morvi','2017-08-03 09:34:35','2017-08-03 09:34:35'),(211,12,NULL,'Mundra','2017-08-03 09:34:35','2017-08-03 09:34:35'),(212,12,NULL,'Nadiad','2017-08-03 09:34:35','2017-08-03 09:34:35'),(213,12,NULL,'Nagwa','2017-08-03 09:34:35','2017-08-03 09:34:35'),(214,12,NULL,'Navsari','2017-08-03 09:34:35','2017-08-03 09:34:35'),(215,12,NULL,'Patan','2017-08-03 09:34:35','2017-08-03 09:34:35'),(216,12,NULL,'Petlad','2017-08-03 09:34:35','2017-08-03 09:34:35'),(217,12,NULL,'Porbandar','2017-08-03 09:34:35','2017-08-03 09:34:35'),(218,12,NULL,'Rajkot','2017-08-03 09:34:35','2017-08-03 09:34:35'),(219,12,NULL,'Rander','2017-08-03 09:34:35','2017-08-03 09:34:35'),(220,12,NULL,'Rawal','2017-08-03 09:34:35','2017-08-03 09:34:35'),(221,12,NULL,'Sachin','2017-08-03 09:34:35','2017-08-03 09:34:35'),(222,12,NULL,'Sami','2017-08-03 09:34:35','2017-08-03 09:34:35'),(223,12,NULL,'Sanand','2017-08-03 09:34:35','2017-08-03 09:34:35'),(224,12,NULL,'Somnath','2017-08-03 09:34:35','2017-08-03 09:34:35'),(225,12,NULL,'Surendranagar','2017-08-03 09:34:35','2017-08-03 09:34:35'),(226,12,NULL,'Thasra','2017-08-03 09:34:35','2017-08-03 09:34:35'),(227,12,NULL,'Vadodara','2017-08-03 09:34:35','2017-08-03 09:34:35'),(228,12,NULL,'Vadodra','2017-08-03 09:34:35','2017-08-03 09:34:35'),(229,12,NULL,'Valsad','2017-08-03 09:34:36','2017-08-03 09:34:36'),(230,12,NULL,'Vapi','2017-08-03 09:34:36','2017-08-03 09:34:36'),(231,12,NULL,'Vijapur','2017-08-03 09:34:36','2017-08-03 09:34:36'),(232,12,NULL,'Visnagar','2017-08-03 09:34:36','2017-08-03 09:34:36'),(233,13,NULL,'Bhawan','2017-08-03 09:34:36','2017-08-03 09:34:36'),(234,13,NULL,'Bilaspur','2017-08-03 09:34:36','2017-08-03 09:34:36'),(235,13,NULL,'Chamba','2017-08-03 09:34:36','2017-08-03 09:34:36'),(236,13,NULL,'Dharamsala','2017-08-03 09:34:36','2017-08-03 09:34:36'),(237,13,NULL,'Dharmpur','2017-08-03 09:34:36','2017-08-03 09:34:36'),(238,13,NULL,'Hamirpur','2017-08-03 09:34:36','2017-08-03 09:34:36'),(239,13,NULL,'Hari','2017-08-03 09:34:37','2017-08-03 09:34:37'),(240,13,NULL,'Kalka','2017-08-03 09:34:37','2017-08-03 09:34:37'),(241,13,NULL,'Kangra','2017-08-03 09:34:37','2017-08-03 09:34:37'),(242,13,NULL,'Kumar','2017-08-03 09:34:37','2017-08-03 09:34:37'),(243,13,NULL,'Manali','2017-08-03 09:34:37','2017-08-03 09:34:37'),(244,13,NULL,'Mandi','2017-08-03 09:34:37','2017-08-03 09:34:37'),(245,13,NULL,'Mani','2017-08-03 09:34:37','2017-08-03 09:34:37'),(246,13,NULL,'Mashobra','2017-08-03 09:34:37','2017-08-03 09:34:37'),(247,13,NULL,'Nalagarh','2017-08-03 09:34:37','2017-08-03 09:34:37'),(248,13,NULL,'Nehra','2017-08-03 09:34:37','2017-08-03 09:34:37'),(249,13,NULL,'Nurpur','2017-08-03 09:34:37','2017-08-03 09:34:37'),(250,13,NULL,'Palampur','2017-08-03 09:34:37','2017-08-03 09:34:37'),(251,13,NULL,'Paonta Sahib','2017-08-03 09:34:37','2017-08-03 09:34:37'),(252,13,NULL,'Shimla','2017-08-03 09:34:37','2017-08-03 09:34:37'),(253,13,NULL,'Solan','2017-08-03 09:34:37','2017-08-03 09:34:37'),(254,14,NULL,'Ambala','2017-08-03 09:34:37','2017-08-03 09:34:37'),(255,14,NULL,'Aurangabad','2017-08-03 09:34:37','2017-08-03 09:34:37'),(256,14,NULL,'Bahadurgarh','2017-08-03 09:34:37','2017-08-03 09:34:37'),(257,14,NULL,'Ballabgarh','2017-08-03 09:34:37','2017-08-03 09:34:37'),(258,14,NULL,'Bhiwani','2017-08-03 09:34:37','2017-08-03 09:34:37'),(259,14,NULL,'Budha','2017-08-03 09:34:37','2017-08-03 09:34:37'),(260,14,NULL,'Chhachhrauli','2017-08-03 09:34:37','2017-08-03 09:34:37'),(261,14,NULL,'Faridabad','2017-08-03 09:34:37','2017-08-03 09:34:37'),(262,14,NULL,'Fatehabad','2017-08-03 09:34:37','2017-08-03 09:34:37'),(263,14,NULL,'Ganga','2017-08-03 09:34:37','2017-08-03 09:34:37'),(264,14,NULL,'Gohana','2017-08-03 09:34:38','2017-08-03 09:34:38'),(265,14,NULL,'Gurgaon','2017-08-03 09:34:38','2017-08-03 09:34:38'),(266,14,NULL,'Hansi','2017-08-03 09:34:38','2017-08-03 09:34:38'),(267,14,NULL,'Haryana','2017-08-03 09:34:38','2017-08-03 09:34:38'),(268,14,NULL,'Hisar','2017-08-03 09:34:38','2017-08-03 09:34:38'),(269,14,NULL,'Indraprast','2017-08-03 09:34:38','2017-08-03 09:34:38'),(270,14,NULL,'Jhajjar','2017-08-03 09:34:38','2017-08-03 09:34:38'),(271,14,NULL,'Jind','2017-08-03 09:34:38','2017-08-03 09:34:38'),(272,14,NULL,'Kaithal','2017-08-03 09:34:38','2017-08-03 09:34:38'),(273,14,NULL,'Kalra','2017-08-03 09:34:38','2017-08-03 09:34:38'),(274,14,NULL,'Karnal','2017-08-03 09:34:38','2017-08-03 09:34:38'),(275,14,NULL,'Kaul','2017-08-03 09:34:38','2017-08-03 09:34:38'),(276,14,NULL,'Kotian','2017-08-03 09:34:38','2017-08-03 09:34:38'),(277,14,NULL,'Ladwa','2017-08-03 09:34:38','2017-08-03 09:34:38'),(278,14,NULL,'Narnaul','2017-08-03 09:34:38','2017-08-03 09:34:38'),(279,14,NULL,'Nilokheri','2017-08-03 09:34:38','2017-08-03 09:34:38'),(280,14,NULL,'Odhan','2017-08-03 09:34:38','2017-08-03 09:34:38'),(281,14,NULL,'Palwal','2017-08-03 09:34:38','2017-08-03 09:34:38'),(282,14,NULL,'Panipat','2017-08-03 09:34:38','2017-08-03 09:34:38'),(283,14,NULL,'Pehowa','2017-08-03 09:34:38','2017-08-03 09:34:38'),(284,14,NULL,'Rewari','2017-08-03 09:34:38','2017-08-03 09:34:38'),(285,14,NULL,'Rohtak','2017-08-03 09:34:38','2017-08-03 09:34:38'),(286,14,NULL,'Saha','2017-08-03 09:34:38','2017-08-03 09:34:38'),(287,14,NULL,'Shahabad','2017-08-03 09:34:39','2017-08-03 09:34:39'),(288,14,NULL,'Sirsa','2017-08-03 09:34:39','2017-08-03 09:34:39'),(289,14,NULL,'Sodhi','2017-08-03 09:34:39','2017-08-03 09:34:39'),(290,14,NULL,'Sonipat','2017-08-03 09:34:39','2017-08-03 09:34:39'),(291,14,NULL,'Tohana','2017-08-03 09:34:39','2017-08-03 09:34:39'),(292,14,NULL,'Yamunanagar','2017-08-03 09:34:39','2017-08-03 09:34:39'),(293,15,NULL,'Bokaro','2017-08-03 09:34:39','2017-08-03 09:34:39'),(294,15,NULL,'Dhanbad','2017-08-03 09:34:39','2017-08-03 09:34:39'),(295,15,NULL,'Dumka','2017-08-03 09:34:39','2017-08-03 09:34:39'),(296,15,NULL,'Hazaribagh','2017-08-03 09:34:39','2017-08-03 09:34:39'),(297,15,NULL,'Jamshedpur','2017-08-03 09:34:39','2017-08-03 09:34:39'),(298,15,NULL,'Mahulia','2017-08-03 09:34:39','2017-08-03 09:34:39'),(299,15,NULL,'Ramgarh','2017-08-03 09:34:39','2017-08-03 09:34:39'),(300,15,NULL,'Ranchi','2017-08-03 09:34:39','2017-08-03 09:34:39'),(301,16,NULL,'Anantnag','2017-08-03 09:34:39','2017-08-03 09:34:39'),(302,16,NULL,'Arch','2017-08-03 09:34:39','2017-08-03 09:34:39'),(303,16,NULL,'Bala','2017-08-03 09:34:39','2017-08-03 09:34:39'),(304,16,NULL,'Bawan','2017-08-03 09:34:39','2017-08-03 09:34:39'),(305,16,NULL,'Gold','2017-08-03 09:34:39','2017-08-03 09:34:39'),(306,16,NULL,'Jammu','2017-08-03 09:34:39','2017-08-03 09:34:39'),(307,16,NULL,'Kargil','2017-08-03 09:34:39','2017-08-03 09:34:39'),(308,16,NULL,'Kathua','2017-08-03 09:34:39','2017-08-03 09:34:39'),(309,16,NULL,'Katra','2017-08-03 09:34:39','2017-08-03 09:34:39'),(310,16,NULL,'Kundan','2017-08-03 09:34:39','2017-08-03 09:34:39'),(311,16,NULL,'Markal','2017-08-03 09:34:39','2017-08-03 09:34:39'),(312,16,NULL,'Nila','2017-08-03 09:34:39','2017-08-03 09:34:39'),(313,16,NULL,'Pahalgam','2017-08-03 09:34:40','2017-08-03 09:34:40'),(314,16,NULL,'Patel','2017-08-03 09:34:40','2017-08-03 09:34:40'),(315,16,NULL,'Raju','2017-08-03 09:34:40','2017-08-03 09:34:40'),(316,16,NULL,'Ranjan','2017-08-03 09:34:40','2017-08-03 09:34:40'),(317,16,NULL,'Ring','2017-08-03 09:34:40','2017-08-03 09:34:40'),(318,16,NULL,'Srinagar','2017-08-03 09:34:40','2017-08-03 09:34:40'),(319,16,NULL,'Suman','2017-08-03 09:34:40','2017-08-03 09:34:40'),(320,17,NULL,'Bagalkot','2017-08-03 09:34:40','2017-08-03 09:34:40'),(321,17,NULL,'Bangalore','2017-08-03 09:34:40','2017-08-03 09:34:40'),(322,17,NULL,'Belgaum','2017-08-03 09:34:40','2017-08-03 09:34:40'),(323,17,NULL,'Bellare','2017-08-03 09:34:40','2017-08-03 09:34:40'),(324,17,NULL,'Bellary','2017-08-03 09:34:40','2017-08-03 09:34:40'),(325,17,NULL,'Bhadravati','2017-08-03 09:34:40','2017-08-03 09:34:40'),(326,17,NULL,'Bhatkal','2017-08-03 09:34:40','2017-08-03 09:34:40'),(327,17,NULL,'Bidar','2017-08-03 09:34:40','2017-08-03 09:34:40'),(328,17,NULL,'Bijapur','2017-08-03 09:34:40','2017-08-03 09:34:40'),(329,17,NULL,'Channapatna','2017-08-03 09:34:40','2017-08-03 09:34:40'),(330,17,NULL,'Chikmagalūr','2017-08-03 09:34:40','2017-08-03 09:34:40'),(331,17,NULL,'Chikodi','2017-08-03 09:34:40','2017-08-03 09:34:40'),(332,17,NULL,'Chintamani','2017-08-03 09:34:40','2017-08-03 09:34:40'),(333,17,NULL,'Chitradurga','2017-08-03 09:34:40','2017-08-03 09:34:40'),(334,17,NULL,'Davangere','2017-08-03 09:34:40','2017-08-03 09:34:40'),(335,17,NULL,'Dharwad','2017-08-03 09:34:41','2017-08-03 09:34:41'),(336,17,NULL,'Gadag','2017-08-03 09:34:41','2017-08-03 09:34:41'),(337,17,NULL,'Gulbarga','2017-08-03 09:34:41','2017-08-03 09:34:41'),(338,17,NULL,'Hadadi','2017-08-03 09:34:41','2017-08-03 09:34:41'),(339,17,NULL,'Hassan','2017-08-03 09:34:41','2017-08-03 09:34:41'),(340,17,NULL,'Haveri','2017-08-03 09:34:41','2017-08-03 09:34:41'),(341,17,NULL,'Hira','2017-08-03 09:34:41','2017-08-03 09:34:41'),(342,17,NULL,'Hiriyur','2017-08-03 09:34:41','2017-08-03 09:34:41'),(343,17,NULL,'Honavar','2017-08-03 09:34:41','2017-08-03 09:34:41'),(344,17,NULL,'Hospet','2017-08-03 09:34:41','2017-08-03 09:34:41'),(345,17,NULL,'Hubli','2017-08-03 09:34:41','2017-08-03 09:34:41'),(346,17,NULL,'Karwar','2017-08-03 09:34:41','2017-08-03 09:34:41'),(347,17,NULL,'Kolar','2017-08-03 09:34:41','2017-08-03 09:34:41'),(348,17,NULL,'Kollegal','2017-08-03 09:34:41','2017-08-03 09:34:41'),(349,17,NULL,'Koppal','2017-08-03 09:34:41','2017-08-03 09:34:41'),(350,17,NULL,'Kushalnagar','2017-08-03 09:34:41','2017-08-03 09:34:41'),(351,17,NULL,'Madikeri','2017-08-03 09:34:41','2017-08-03 09:34:41'),(352,17,NULL,'Mandya','2017-08-03 09:34:41','2017-08-03 09:34:41'),(353,17,NULL,'Mangalore','2017-08-03 09:34:41','2017-08-03 09:34:41'),(354,17,NULL,'Manipala','2017-08-03 09:34:41','2017-08-03 09:34:41'),(355,17,NULL,'Mundgod','2017-08-03 09:34:41','2017-08-03 09:34:41'),(356,17,NULL,'Mysore','2017-08-03 09:34:41','2017-08-03 09:34:41'),(357,17,NULL,'Nandi','2017-08-03 09:34:41','2017-08-03 09:34:41'),(358,17,NULL,'Puttur','2017-08-03 09:34:41','2017-08-03 09:34:41'),(359,17,NULL,'Raichur','2017-08-03 09:34:41','2017-08-03 09:34:41'),(360,17,NULL,'Ramanagaram','2017-08-03 09:34:42','2017-08-03 09:34:42'),(361,17,NULL,'Sagar','2017-08-03 09:34:42','2017-08-03 09:34:42'),(362,17,NULL,'Sandur','2017-08-03 09:34:42','2017-08-03 09:34:42'),(363,17,NULL,'Sangam','2017-08-03 09:34:42','2017-08-03 09:34:42'),(364,17,NULL,'Shanti Grama','2017-08-03 09:34:42','2017-08-03 09:34:42'),(365,17,NULL,'Shimoga','2017-08-03 09:34:42','2017-08-03 09:34:42'),(366,17,NULL,'Sirsi','2017-08-03 09:34:42','2017-08-03 09:34:42'),(367,17,NULL,'Siruguppa','2017-08-03 09:34:42','2017-08-03 09:34:42'),(368,17,NULL,'Someshwar','2017-08-03 09:34:42','2017-08-03 09:34:42'),(369,17,NULL,'Tiptur','2017-08-03 09:34:42','2017-08-03 09:34:42'),(370,17,NULL,'Tumkūr','2017-08-03 09:34:42','2017-08-03 09:34:42'),(371,17,NULL,'Udupi','2017-08-03 09:34:42','2017-08-03 09:34:42'),(372,17,NULL,'Yadgir','2017-08-03 09:34:42','2017-08-03 09:34:42'),(373,18,NULL,'Alanallur','2017-08-03 09:34:42','2017-08-03 09:34:42'),(374,18,NULL,'Alappuzha','2017-08-03 09:34:42','2017-08-03 09:34:42'),(375,18,NULL,'Aluva','2017-08-03 09:34:42','2017-08-03 09:34:42'),(376,18,NULL,'Anchal','2017-08-03 09:34:42','2017-08-03 09:34:42'),(377,18,NULL,'Angadipuram','2017-08-03 09:34:42','2017-08-03 09:34:42'),(378,18,NULL,'Aranmula','2017-08-03 09:34:42','2017-08-03 09:34:42'),(379,18,NULL,'Attingal','2017-08-03 09:34:42','2017-08-03 09:34:42'),(380,18,NULL,'Changanacheri','2017-08-03 09:34:42','2017-08-03 09:34:42'),(381,18,NULL,'Chengannur','2017-08-03 09:34:42','2017-08-03 09:34:42'),(382,18,NULL,'Chittur','2017-08-03 09:34:42','2017-08-03 09:34:42'),(383,18,NULL,'Edavanna','2017-08-03 09:34:43','2017-08-03 09:34:43'),(384,18,NULL,'Ernakulam','2017-08-03 09:34:43','2017-08-03 09:34:43'),(385,18,NULL,'Guruvayur','2017-08-03 09:34:43','2017-08-03 09:34:43'),(386,18,NULL,'Idukki','2017-08-03 09:34:43','2017-08-03 09:34:43'),(387,18,NULL,'Irinjalakuda','2017-08-03 09:34:43','2017-08-03 09:34:43'),(388,18,NULL,'Kaladi','2017-08-03 09:34:43','2017-08-03 09:34:43'),(389,18,NULL,'Kalpetta','2017-08-03 09:34:43','2017-08-03 09:34:43'),(390,18,NULL,'Kanhangad','2017-08-03 09:34:43','2017-08-03 09:34:43'),(391,18,NULL,'Kannur','2017-08-03 09:34:43','2017-08-03 09:34:43'),(392,18,NULL,'Kasaragod','2017-08-03 09:34:43','2017-08-03 09:34:43'),(393,18,NULL,'Kayamkulam','2017-08-03 09:34:43','2017-08-03 09:34:43'),(394,18,NULL,'Kochi','2017-08-03 09:34:43','2017-08-03 09:34:43'),(395,18,NULL,'Kodungallur','2017-08-03 09:34:43','2017-08-03 09:34:43'),(396,18,NULL,'Kollam','2017-08-03 09:34:43','2017-08-03 09:34:43'),(397,18,NULL,'Koni','2017-08-03 09:34:43','2017-08-03 09:34:43'),(398,18,NULL,'Kottakkal','2017-08-03 09:34:43','2017-08-03 09:34:43'),(399,18,NULL,'Kottarakara','2017-08-03 09:34:43','2017-08-03 09:34:43'),(400,18,NULL,'Kottayam','2017-08-03 09:34:43','2017-08-03 09:34:43'),(401,18,NULL,'Kozhikode','2017-08-03 09:34:43','2017-08-03 09:34:43'),(402,18,NULL,'Malappuram','2017-08-03 09:34:43','2017-08-03 09:34:43'),(403,18,NULL,'Manjeri','2017-08-03 09:34:43','2017-08-03 09:34:43'),(404,18,NULL,'Mattanur','2017-08-03 09:34:43','2017-08-03 09:34:43'),(405,18,NULL,'Mavelikara','2017-08-03 09:34:43','2017-08-03 09:34:43'),(406,18,NULL,'Nilambur','2017-08-03 09:34:43','2017-08-03 09:34:43'),(407,18,NULL,'Ottappalam','2017-08-03 09:34:44','2017-08-03 09:34:44'),(408,18,NULL,'Palakkad','2017-08-03 09:34:44','2017-08-03 09:34:44'),(409,18,NULL,'Palayam','2017-08-03 09:34:44','2017-08-03 09:34:44'),(410,18,NULL,'Parappanangadi','2017-08-03 09:34:44','2017-08-03 09:34:44'),(411,18,NULL,'Paravur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(412,18,NULL,'Pathanamthitta','2017-08-03 09:34:44','2017-08-03 09:34:44'),(413,18,NULL,'Pattambi','2017-08-03 09:34:44','2017-08-03 09:34:44'),(414,18,NULL,'Payyanur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(415,18,NULL,'Ponnani','2017-08-03 09:34:44','2017-08-03 09:34:44'),(416,18,NULL,'Punalur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(417,18,NULL,'Shoranur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(418,18,NULL,'Sultans Battery','2017-08-03 09:34:44','2017-08-03 09:34:44'),(419,18,NULL,'Thalassery','2017-08-03 09:34:44','2017-08-03 09:34:44'),(420,18,NULL,'Thiruvananthapuram','2017-08-03 09:34:44','2017-08-03 09:34:44'),(421,18,NULL,'Thrissur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(422,18,NULL,'Tirur','2017-08-03 09:34:44','2017-08-03 09:34:44'),(423,18,NULL,'Tiruvalla','2017-08-03 09:34:44','2017-08-03 09:34:44'),(424,18,NULL,'Vaikam','2017-08-03 09:34:44','2017-08-03 09:34:44'),(425,18,NULL,'Vazhakulam','2017-08-03 09:34:44','2017-08-03 09:34:44'),(426,19,NULL,'Kavaratti','2017-08-03 09:34:44','2017-08-03 09:34:44'),(427,20,NULL,'Abdul','2017-08-03 09:34:44','2017-08-03 09:34:44'),(428,20,NULL,'Ahmednagar','2017-08-03 09:34:44','2017-08-03 09:34:44'),(429,20,NULL,'Akola','2017-08-03 09:34:44','2017-08-03 09:34:44'),(430,20,NULL,'Alibag','2017-08-03 09:34:45','2017-08-03 09:34:45'),(431,20,NULL,'Ambad','2017-08-03 09:34:45','2017-08-03 09:34:45'),(432,20,NULL,'Ambarnath','2017-08-03 09:34:45','2017-08-03 09:34:45'),(433,20,NULL,'Amravati','2017-08-03 09:34:45','2017-08-03 09:34:45'),(434,20,NULL,'Andheri','2017-08-03 09:34:45','2017-08-03 09:34:45'),(435,20,NULL,'Arvi','2017-08-03 09:34:45','2017-08-03 09:34:45'),(436,20,NULL,'Aundh','2017-08-03 09:34:45','2017-08-03 09:34:45'),(437,20,NULL,'Aurangabad','2017-08-03 09:34:45','2017-08-03 09:34:45'),(438,20,NULL,'Badlapur','2017-08-03 09:34:45','2017-08-03 09:34:45'),(439,20,NULL,'Bandra','2017-08-03 09:34:45','2017-08-03 09:34:45'),(440,20,NULL,'Baramati','2017-08-03 09:34:45','2017-08-03 09:34:45'),(441,20,NULL,'Belapur','2017-08-03 09:34:45','2017-08-03 09:34:45'),(442,20,NULL,'Bhandup','2017-08-03 09:34:45','2017-08-03 09:34:45'),(443,20,NULL,'Bhiwandi','2017-08-03 09:34:45','2017-08-03 09:34:45'),(444,20,NULL,'Bhusawal','2017-08-03 09:34:45','2017-08-03 09:34:45'),(445,20,NULL,'Boisar','2017-08-03 09:34:45','2017-08-03 09:34:45'),(446,20,NULL,'Chakan','2017-08-03 09:34:45','2017-08-03 09:34:45'),(447,20,NULL,'Chalisgaon','2017-08-03 09:34:45','2017-08-03 09:34:45'),(448,20,NULL,'Chandrapur','2017-08-03 09:34:45','2017-08-03 09:34:45'),(449,20,NULL,'Charan','2017-08-03 09:34:45','2017-08-03 09:34:45'),(450,20,NULL,'Chinchvad','2017-08-03 09:34:45','2017-08-03 09:34:45'),(451,20,NULL,'Chiplun','2017-08-03 09:34:45','2017-08-03 09:34:45'),(452,20,NULL,'Chopda','2017-08-03 09:34:45','2017-08-03 09:34:45'),(453,20,NULL,'Colaba','2017-08-03 09:34:45','2017-08-03 09:34:45'),(454,20,NULL,'Dahanu','2017-08-03 09:34:45','2017-08-03 09:34:45'),(455,20,NULL,'Deolali','2017-08-03 09:34:45','2017-08-03 09:34:45'),(456,20,NULL,'Devgarh','2017-08-03 09:34:45','2017-08-03 09:34:45'),(457,20,NULL,'Dharavi','2017-08-03 09:34:46','2017-08-03 09:34:46'),(458,20,NULL,'Dhule','2017-08-03 09:34:46','2017-08-03 09:34:46'),(459,20,NULL,'Ellora Caves','2017-08-03 09:34:46','2017-08-03 09:34:46'),(460,20,NULL,'Gargoti','2017-08-03 09:34:46','2017-08-03 09:34:46'),(461,20,NULL,'Ghatkopar','2017-08-03 09:34:46','2017-08-03 09:34:46'),(462,20,NULL,'Goregaon','2017-08-03 09:34:46','2017-08-03 09:34:46'),(463,20,NULL,'Hinganghat','2017-08-03 09:34:46','2017-08-03 09:34:46'),(464,20,NULL,'Hingoli','2017-08-03 09:34:46','2017-08-03 09:34:46'),(465,20,NULL,'Ichalkaranji','2017-08-03 09:34:46','2017-08-03 09:34:46'),(466,20,NULL,'Igatpuri','2017-08-03 09:34:46','2017-08-03 09:34:46'),(467,20,NULL,'Jalgaon Jamod','2017-08-03 09:34:46','2017-08-03 09:34:46'),(468,20,NULL,'Jalna','2017-08-03 09:34:46','2017-08-03 09:34:46'),(469,20,NULL,'Kagal','2017-08-03 09:34:46','2017-08-03 09:34:46'),(470,20,NULL,'Kalam','2017-08-03 09:34:46','2017-08-03 09:34:46'),(471,20,NULL,'Kalamboli','2017-08-03 09:34:46','2017-08-03 09:34:46'),(472,20,NULL,'Kalyan','2017-08-03 09:34:46','2017-08-03 09:34:46'),(473,20,NULL,'Kankauli','2017-08-03 09:34:46','2017-08-03 09:34:46'),(474,20,NULL,'Karad','2017-08-03 09:34:46','2017-08-03 09:34:46'),(475,20,NULL,'Karanja','2017-08-03 09:34:46','2017-08-03 09:34:46'),(476,20,NULL,'Karjat','2017-08-03 09:34:46','2017-08-03 09:34:46'),(477,20,NULL,'Khalapur','2017-08-03 09:34:46','2017-08-03 09:34:46'),(478,20,NULL,'Khopoli','2017-08-03 09:34:46','2017-08-03 09:34:46'),(479,20,NULL,'Kolhapur','2017-08-03 09:34:47','2017-08-03 09:34:47'),(480,20,NULL,'Latur','2017-08-03 09:34:47','2017-08-03 09:34:47'),(481,20,NULL,'Mahad','2017-08-03 09:34:47','2017-08-03 09:34:47'),(482,20,NULL,'Mahim','2017-08-03 09:34:47','2017-08-03 09:34:47'),(483,20,NULL,'Mangaon','2017-08-03 09:34:47','2017-08-03 09:34:47'),(484,20,NULL,'Manor','2017-08-03 09:34:47','2017-08-03 09:34:47'),(485,20,NULL,'Miraj','2017-08-03 09:34:47','2017-08-03 09:34:47'),(486,20,NULL,'Mumbai','2017-08-03 09:34:47','2017-08-03 09:34:47'),(487,20,NULL,'Nadgaon','2017-08-03 09:34:48','2017-08-03 09:34:48'),(488,20,NULL,'Nagpur','2017-08-03 09:34:48','2017-08-03 09:34:48'),(489,20,NULL,'Nanded','2017-08-03 09:34:48','2017-08-03 09:34:48'),(490,20,NULL,'Nandurbar','2017-08-03 09:34:48','2017-08-03 09:34:48'),(491,20,NULL,'Narayangaon','2017-08-03 09:34:48','2017-08-03 09:34:48'),(492,20,NULL,'Nashik','2017-08-03 09:34:48','2017-08-03 09:34:48'),(493,20,NULL,'Neral','2017-08-03 09:34:48','2017-08-03 09:34:48'),(494,20,NULL,'Neri','2017-08-03 09:34:48','2017-08-03 09:34:48'),(495,20,NULL,'Osmanabad','2017-08-03 09:34:48','2017-08-03 09:34:48'),(496,20,NULL,'Palghar','2017-08-03 09:34:48','2017-08-03 09:34:48'),(497,20,NULL,'Palus','2017-08-03 09:34:48','2017-08-03 09:34:48'),(498,20,NULL,'Panchgani','2017-08-03 09:34:48','2017-08-03 09:34:48'),(499,20,NULL,'Pandharpur','2017-08-03 09:34:48','2017-08-03 09:34:48'),(500,20,NULL,'Panvel','2017-08-03 09:34:48','2017-08-03 09:34:48'),(501,20,NULL,'Parbhani','2017-08-03 09:34:48','2017-08-03 09:34:48'),(502,20,NULL,'Parel','2017-08-03 09:34:48','2017-08-03 09:34:48'),(503,20,NULL,'Pimpri','2017-08-03 09:34:48','2017-08-03 09:34:48'),(504,20,NULL,'Pune','2017-08-03 09:34:48','2017-08-03 09:34:48'),(505,20,NULL,'Puras','2017-08-03 09:34:48','2017-08-03 09:34:48'),(506,20,NULL,'Ratnagiri','2017-08-03 09:34:48','2017-08-03 09:34:48'),(507,20,NULL,'Sakri','2017-08-03 09:34:48','2017-08-03 09:34:48'),(508,20,NULL,'Sangamner','2017-08-03 09:34:48','2017-08-03 09:34:48'),(509,20,NULL,'Sangli','2017-08-03 09:34:48','2017-08-03 09:34:48'),(510,20,NULL,'Sangola','2017-08-03 09:34:48','2017-08-03 09:34:48'),(511,20,NULL,'Satara','2017-08-03 09:34:48','2017-08-03 09:34:48'),(512,20,NULL,'Shahapur','2017-08-03 09:34:49','2017-08-03 09:34:49'),(513,20,NULL,'Shirgaon','2017-08-03 09:34:49','2017-08-03 09:34:49'),(514,20,NULL,'Shrigonda','2017-08-03 09:34:49','2017-08-03 09:34:49'),(515,20,NULL,'Sinnar','2017-08-03 09:34:49','2017-08-03 09:34:49'),(516,20,NULL,'Sion','2017-08-03 09:34:49','2017-08-03 09:34:49'),(517,20,NULL,'Solapur','2017-08-03 09:34:49','2017-08-03 09:34:49'),(518,20,NULL,'Sopara','2017-08-03 09:34:49','2017-08-03 09:34:49'),(519,20,NULL,'Talegaon Dabhade','2017-08-03 09:34:49','2017-08-03 09:34:49'),(520,20,NULL,'Thane','2017-08-03 09:34:49','2017-08-03 09:34:49'),(521,20,NULL,'Trimbak','2017-08-03 09:34:49','2017-08-03 09:34:49'),(522,20,NULL,'Tuljapur','2017-08-03 09:34:49','2017-08-03 09:34:49'),(523,20,NULL,'Ulhasnagar','2017-08-03 09:34:49','2017-08-03 09:34:49'),(524,20,NULL,'Umred','2017-08-03 09:34:49','2017-08-03 09:34:49'),(525,20,NULL,'Vadner','2017-08-03 09:34:49','2017-08-03 09:34:49'),(526,20,NULL,'Vasai','2017-08-03 09:34:49','2017-08-03 09:34:49'),(527,20,NULL,'Vashi','2017-08-03 09:34:49','2017-08-03 09:34:49'),(528,20,NULL,'Virar','2017-08-03 09:34:49','2017-08-03 09:34:49'),(529,20,NULL,'Wai','2017-08-03 09:34:49','2017-08-03 09:34:49'),(530,20,NULL,'Wardha','2017-08-03 09:34:49','2017-08-03 09:34:49'),(531,20,NULL,'Yavatmal','2017-08-03 09:34:49','2017-08-03 09:34:49'),(532,20,NULL,'Yeola','2017-08-03 09:34:49','2017-08-03 09:34:49'),(533,21,NULL,'Nongpoh','2017-08-03 09:34:49','2017-08-03 09:34:49'),(534,21,NULL,'Nongstoin','2017-08-03 09:34:49','2017-08-03 09:34:49'),(535,21,NULL,'Pala','2017-08-03 09:34:49','2017-08-03 09:34:49'),(536,21,NULL,'Shillong','2017-08-03 09:34:50','2017-08-03 09:34:50'),(537,21,NULL,'Tura','2017-08-03 09:34:50','2017-08-03 09:34:50'),(538,22,NULL,'Churachandpur','2017-08-03 09:34:50','2017-08-03 09:34:50'),(539,22,NULL,'Imphal','2017-08-03 09:34:50','2017-08-03 09:34:50'),(540,23,NULL,'Amarkantak','2017-08-03 09:34:50','2017-08-03 09:34:50'),(541,23,NULL,'Ambah','2017-08-03 09:34:50','2017-08-03 09:34:50'),(542,23,NULL,'Anantpur','2017-08-03 09:34:50','2017-08-03 09:34:50'),(543,23,NULL,'Bagh','2017-08-03 09:34:50','2017-08-03 09:34:50'),(544,23,NULL,'Balaghat','2017-08-03 09:34:50','2017-08-03 09:34:50'),(545,23,NULL,'Baroda','2017-08-03 09:34:50','2017-08-03 09:34:50'),(546,23,NULL,'Berasia','2017-08-03 09:34:50','2017-08-03 09:34:50'),(547,23,NULL,'Betul','2017-08-03 09:34:50','2017-08-03 09:34:50'),(548,23,NULL,'Bhagwan','2017-08-03 09:34:50','2017-08-03 09:34:50'),(549,23,NULL,'Bhartiya','2017-08-03 09:34:50','2017-08-03 09:34:50'),(550,23,NULL,'Bhopal','2017-08-03 09:34:50','2017-08-03 09:34:50'),(551,23,NULL,'Chakra','2017-08-03 09:34:50','2017-08-03 09:34:50'),(552,23,NULL,'Chand','2017-08-03 09:34:50','2017-08-03 09:34:50'),(553,23,NULL,'Chhindwara','2017-08-03 09:34:50','2017-08-03 09:34:50'),(554,23,NULL,'Chopra','2017-08-03 09:34:50','2017-08-03 09:34:50'),(555,23,NULL,'Damoh','2017-08-03 09:34:50','2017-08-03 09:34:50'),(556,23,NULL,'Dewas','2017-08-03 09:34:50','2017-08-03 09:34:50'),(557,23,NULL,'Dhar','2017-08-03 09:34:50','2017-08-03 09:34:50'),(558,23,NULL,'Dindori','2017-08-03 09:34:50','2017-08-03 09:34:50'),(559,23,NULL,'Gandhigram','2017-08-03 09:34:50','2017-08-03 09:34:50'),(560,23,NULL,'Ganpat','2017-08-03 09:34:50','2017-08-03 09:34:50'),(561,23,NULL,'Guna','2017-08-03 09:34:50','2017-08-03 09:34:50'),(562,23,NULL,'Gwalior','2017-08-03 09:34:50','2017-08-03 09:34:50'),(563,23,NULL,'Hoshangabad','2017-08-03 09:34:50','2017-08-03 09:34:50'),(564,23,NULL,'Indore','2017-08-03 09:34:51','2017-08-03 09:34:51'),(565,23,NULL,'Jabalpur','2017-08-03 09:34:51','2017-08-03 09:34:51'),(566,23,NULL,'Kailaras','2017-08-03 09:34:51','2017-08-03 09:34:51'),(567,23,NULL,'Kamalpura','2017-08-03 09:34:51','2017-08-03 09:34:51'),(568,23,NULL,'Kataria','2017-08-03 09:34:51','2017-08-03 09:34:51'),(569,23,NULL,'Katni','2017-08-03 09:34:51','2017-08-03 09:34:51'),(570,23,NULL,'Khajuraho Group of Monuments','2017-08-03 09:34:51','2017-08-03 09:34:51'),(571,23,NULL,'Khargone','2017-08-03 09:34:51','2017-08-03 09:34:51'),(572,23,NULL,'Mandla','2017-08-03 09:34:51','2017-08-03 09:34:51'),(573,23,NULL,'Mandsaur','2017-08-03 09:34:51','2017-08-03 09:34:51'),(574,23,NULL,'Mhow','2017-08-03 09:34:51','2017-08-03 09:34:51'),(575,23,NULL,'Morena','2017-08-03 09:34:51','2017-08-03 09:34:51'),(576,23,NULL,'Nadia','2017-08-03 09:34:51','2017-08-03 09:34:51'),(577,23,NULL,'Nagara','2017-08-03 09:34:51','2017-08-03 09:34:51'),(578,23,NULL,'Pachmarhi','2017-08-03 09:34:51','2017-08-03 09:34:51'),(579,23,NULL,'Raipur','2017-08-03 09:34:51','2017-08-03 09:34:51'),(580,23,NULL,'Rajapur','2017-08-03 09:34:51','2017-08-03 09:34:51'),(581,23,NULL,'Rama','2017-08-03 09:34:51','2017-08-03 09:34:51'),(582,23,NULL,'Ratlam','2017-08-03 09:34:51','2017-08-03 09:34:51'),(583,23,NULL,'Rewa','2017-08-03 09:34:51','2017-08-03 09:34:51'),(584,23,NULL,'Sagar','2017-08-03 09:34:51','2017-08-03 09:34:51'),(585,23,NULL,'Sarangi','2017-08-03 09:34:51','2017-08-03 09:34:51'),(586,23,NULL,'Satna','2017-08-03 09:34:51','2017-08-03 09:34:51'),(587,23,NULL,'Sehore','2017-08-03 09:34:51','2017-08-03 09:34:51'),(588,23,NULL,'Sendhwa','2017-08-03 09:34:51','2017-08-03 09:34:51'),(589,23,NULL,'Shahdol','2017-08-03 09:34:52','2017-08-03 09:34:52'),(590,23,NULL,'Sidhi','2017-08-03 09:34:52','2017-08-03 09:34:52'),(591,23,NULL,'Soni','2017-08-03 09:34:52','2017-08-03 09:34:52'),(592,23,NULL,'Tala','2017-08-03 09:34:52','2017-08-03 09:34:52'),(593,23,NULL,'Ujjain','2017-08-03 09:34:52','2017-08-03 09:34:52'),(594,23,NULL,'Vidisha','2017-08-03 09:34:52','2017-08-03 09:34:52'),(595,24,NULL,'Aizawl','2017-08-03 09:34:52','2017-08-03 09:34:52'),(596,25,NULL,'Chen','2017-08-03 09:34:52','2017-08-03 09:34:52'),(597,25,NULL,'Dimapur','2017-08-03 09:34:52','2017-08-03 09:34:52'),(598,25,NULL,'Kohima','2017-08-03 09:34:52','2017-08-03 09:34:52'),(599,26,NULL,'Angul','2017-08-03 09:34:52','2017-08-03 09:34:52'),(600,26,NULL,'Balangir','2017-08-03 09:34:52','2017-08-03 09:34:52'),(601,26,NULL,'Balasore','2017-08-03 09:34:52','2017-08-03 09:34:52'),(602,26,NULL,'Bargarh','2017-08-03 09:34:52','2017-08-03 09:34:52'),(603,26,NULL,'Barpali','2017-08-03 09:34:52','2017-08-03 09:34:52'),(604,26,NULL,'Bhubaneswar','2017-08-03 09:34:52','2017-08-03 09:34:52'),(605,26,NULL,'Brahmapur','2017-08-03 09:34:52','2017-08-03 09:34:52'),(606,26,NULL,'Cuttack','2017-08-03 09:34:52','2017-08-03 09:34:52'),(607,26,NULL,'Dhenkanal','2017-08-03 09:34:52','2017-08-03 09:34:52'),(608,26,NULL,'Jajpur','2017-08-03 09:34:52','2017-08-03 09:34:52'),(609,26,NULL,'Jatani','2017-08-03 09:34:52','2017-08-03 09:34:52'),(610,26,NULL,'Jaypur','2017-08-03 09:34:52','2017-08-03 09:34:52'),(611,26,NULL,'Jharsuguda','2017-08-03 09:34:52','2017-08-03 09:34:52'),(612,26,NULL,'Kalinga','2017-08-03 09:34:52','2017-08-03 09:34:52'),(613,26,NULL,'Khurda','2017-08-03 09:34:53','2017-08-03 09:34:53'),(614,26,NULL,'Koraput','2017-08-03 09:34:53','2017-08-03 09:34:53'),(615,26,NULL,'Nayagarh','2017-08-03 09:34:53','2017-08-03 09:34:53'),(616,26,NULL,'Puri','2017-08-03 09:34:54','2017-08-03 09:34:54'),(617,26,NULL,'Raurkela','2017-08-03 09:34:55','2017-08-03 09:34:55'),(618,26,NULL,'Rayagada','2017-08-03 09:34:55','2017-08-03 09:34:55'),(619,26,NULL,'Sambalpur','2017-08-03 09:34:55','2017-08-03 09:34:55'),(620,26,NULL,'Sundargarh','2017-08-03 09:34:55','2017-08-03 09:34:55'),(621,26,NULL,'Talcher','2017-08-03 09:34:55','2017-08-03 09:34:55'),(622,26,NULL,'Udaigiri','2017-08-03 09:34:55','2017-08-03 09:34:55'),(623,27,NULL,'Amritsar','2017-08-03 09:34:55','2017-08-03 09:34:55'),(624,27,NULL,'Banga','2017-08-03 09:34:55','2017-08-03 09:34:55'),(625,27,NULL,'Barnala','2017-08-03 09:34:56','2017-08-03 09:34:56'),(626,27,NULL,'Batala','2017-08-03 09:34:56','2017-08-03 09:34:56'),(627,27,NULL,'Bhatinda','2017-08-03 09:34:56','2017-08-03 09:34:56'),(628,27,NULL,'Dasua','2017-08-03 09:34:56','2017-08-03 09:34:56'),(629,27,NULL,'Dhariwal','2017-08-03 09:34:56','2017-08-03 09:34:56'),(630,27,NULL,'Dhuri','2017-08-03 09:34:56','2017-08-03 09:34:56'),(631,27,NULL,'Dinanagar','2017-08-03 09:34:56','2017-08-03 09:34:56'),(632,27,NULL,'Faridkot','2017-08-03 09:34:56','2017-08-03 09:34:56'),(633,27,NULL,'Firozpur','2017-08-03 09:34:56','2017-08-03 09:34:56'),(634,27,NULL,'Garhshankar','2017-08-03 09:34:56','2017-08-03 09:34:56'),(635,27,NULL,'Gurdaspur','2017-08-03 09:34:56','2017-08-03 09:34:56'),(636,27,NULL,'Hoshiarpur','2017-08-03 09:34:56','2017-08-03 09:34:56'),(637,27,NULL,'Jagraon','2017-08-03 09:34:56','2017-08-03 09:34:56'),(638,27,NULL,'Jalalabad','2017-08-03 09:34:56','2017-08-03 09:34:56'),(639,27,NULL,'Jalandhar','2017-08-03 09:34:56','2017-08-03 09:34:56'),(640,27,NULL,'Kapurthala Town','2017-08-03 09:34:56','2017-08-03 09:34:56'),(641,27,NULL,'Khanna','2017-08-03 09:34:56','2017-08-03 09:34:56'),(642,27,NULL,'Kharar','2017-08-03 09:34:56','2017-08-03 09:34:56'),(643,27,NULL,'Kot Isa Khan','2017-08-03 09:34:56','2017-08-03 09:34:56'),(644,27,NULL,'Kurali','2017-08-03 09:34:56','2017-08-03 09:34:56'),(645,27,NULL,'Ludhiana','2017-08-03 09:34:56','2017-08-03 09:34:56'),(646,27,NULL,'Machhiwara','2017-08-03 09:34:56','2017-08-03 09:34:56'),(647,27,NULL,'Maharaj','2017-08-03 09:34:56','2017-08-03 09:34:56'),(648,27,NULL,'Mansa','2017-08-03 09:34:56','2017-08-03 09:34:56'),(649,27,NULL,'Moga','2017-08-03 09:34:56','2017-08-03 09:34:56'),(650,27,NULL,'Mohali','2017-08-03 09:34:56','2017-08-03 09:34:56'),(651,27,NULL,'Morinda','2017-08-03 09:34:56','2017-08-03 09:34:56'),(652,27,NULL,'Mukerian','2017-08-03 09:34:56','2017-08-03 09:34:56'),(653,27,NULL,'Muktsar','2017-08-03 09:34:57','2017-08-03 09:34:57'),(654,27,NULL,'Nabha','2017-08-03 09:34:57','2017-08-03 09:34:57'),(655,27,NULL,'Pathankot','2017-08-03 09:34:57','2017-08-03 09:34:57'),(656,27,NULL,'Patiala','2017-08-03 09:34:57','2017-08-03 09:34:57'),(657,27,NULL,'Phagwara','2017-08-03 09:34:57','2017-08-03 09:34:57'),(658,27,NULL,'Rajpura','2017-08-03 09:34:57','2017-08-03 09:34:57'),(659,27,NULL,'Rupnagar','2017-08-03 09:34:57','2017-08-03 09:34:57'),(660,27,NULL,'Sangrur','2017-08-03 09:34:57','2017-08-03 09:34:57'),(661,27,NULL,'Shahkot','2017-08-03 09:34:57','2017-08-03 09:34:57'),(662,27,NULL,'Sirhind','2017-08-03 09:34:57','2017-08-03 09:34:57'),(663,27,NULL,'Sunam','2017-08-03 09:34:57','2017-08-03 09:34:57'),(664,27,NULL,'Talwandi Sabo','2017-08-03 09:34:57','2017-08-03 09:34:57'),(665,27,NULL,'Tarn Taran','2017-08-03 09:34:57','2017-08-03 09:34:57'),(666,28,NULL,'Karaikal','2017-08-03 09:34:57','2017-08-03 09:34:57'),(667,28,NULL,'Puducherry','2017-08-03 09:34:57','2017-08-03 09:34:57'),(668,29,NULL,'Ajmer','2017-08-03 09:34:57','2017-08-03 09:34:57'),(669,29,NULL,'Alwar','2017-08-03 09:34:57','2017-08-03 09:34:57'),(670,29,NULL,'Amer','2017-08-03 09:34:57','2017-08-03 09:34:57'),(671,29,NULL,'Amet','2017-08-03 09:34:57','2017-08-03 09:34:57'),(672,29,NULL,'Balana','2017-08-03 09:34:57','2017-08-03 09:34:57'),(673,29,NULL,'Bali','2017-08-03 09:34:57','2017-08-03 09:34:57'),(674,29,NULL,'Banswara','2017-08-03 09:34:57','2017-08-03 09:34:57'),(675,29,NULL,'Barmer','2017-08-03 09:34:58','2017-08-03 09:34:58'),(676,29,NULL,'Beawar','2017-08-03 09:34:58','2017-08-03 09:34:58'),(677,29,NULL,'Bharatpur','2017-08-03 09:34:58','2017-08-03 09:34:58'),(678,29,NULL,'Bhilwara','2017-08-03 09:34:58','2017-08-03 09:34:58'),(679,29,NULL,'Bikaner','2017-08-03 09:34:58','2017-08-03 09:34:58'),(680,29,NULL,'Binavas','2017-08-03 09:34:58','2017-08-03 09:34:58'),(681,29,NULL,'Bundi','2017-08-03 09:34:58','2017-08-03 09:34:58'),(682,29,NULL,'Charu','2017-08-03 09:34:58','2017-08-03 09:34:58'),(683,29,NULL,'Chetan','2017-08-03 09:34:58','2017-08-03 09:34:58'),(684,29,NULL,'Chhabra','2017-08-03 09:34:59','2017-08-03 09:34:59'),(685,29,NULL,'Dipas','2017-08-03 09:34:59','2017-08-03 09:34:59'),(686,29,NULL,'Ganganagar','2017-08-03 09:34:59','2017-08-03 09:34:59'),(687,29,NULL,'Gangapur','2017-08-03 09:34:59','2017-08-03 09:34:59'),(688,29,NULL,'Gangrar','2017-08-03 09:34:59','2017-08-03 09:34:59'),(689,29,NULL,'Jaipur','2017-08-03 09:34:59','2017-08-03 09:34:59'),(690,29,NULL,'Jaisalmer','2017-08-03 09:34:59','2017-08-03 09:34:59'),(691,29,NULL,'Jhalawar','2017-08-03 09:34:59','2017-08-03 09:34:59'),(692,29,NULL,'Jhunjhunun','2017-08-03 09:34:59','2017-08-03 09:34:59'),(693,29,NULL,'Jodhpur','2017-08-03 09:34:59','2017-08-03 09:34:59'),(694,29,NULL,'Kalan','2017-08-03 09:34:59','2017-08-03 09:34:59'),(695,29,NULL,'Kanakpura','2017-08-03 09:34:59','2017-08-03 09:34:59'),(696,29,NULL,'Khan','2017-08-03 09:34:59','2017-08-03 09:34:59'),(697,29,NULL,'Khinwara','2017-08-03 09:34:59','2017-08-03 09:34:59'),(698,29,NULL,'Kishangarh','2017-08-03 09:34:59','2017-08-03 09:34:59'),(699,29,NULL,'Kolayat','2017-08-03 09:34:59','2017-08-03 09:34:59'),(700,29,NULL,'Kota','2017-08-03 09:34:59','2017-08-03 09:34:59'),(701,29,NULL,'Lamba Harisingh','2017-08-03 09:34:59','2017-08-03 09:34:59'),(702,29,NULL,'Mahajan','2017-08-03 09:34:59','2017-08-03 09:34:59'),(703,29,NULL,'Mahatma','2017-08-03 09:34:59','2017-08-03 09:34:59'),(704,29,NULL,'Mandal','2017-08-03 09:34:59','2017-08-03 09:34:59'),(705,29,NULL,'Manna','2017-08-03 09:34:59','2017-08-03 09:34:59'),(706,29,NULL,'Mount Abu','2017-08-03 09:34:59','2017-08-03 09:34:59'),(707,29,NULL,'Nagar','2017-08-03 09:34:59','2017-08-03 09:34:59'),(708,29,NULL,'Nagaur','2017-08-03 09:35:00','2017-08-03 09:35:00'),(709,29,NULL,'Nanda','2017-08-03 09:35:00','2017-08-03 09:35:00'),(710,29,NULL,'Naraina','2017-08-03 09:35:00','2017-08-03 09:35:00'),(711,29,NULL,'Nathdwara','2017-08-03 09:35:00','2017-08-03 09:35:00'),(712,29,NULL,'Pali','2017-08-03 09:35:00','2017-08-03 09:35:00'),(713,29,NULL,'Pilani','2017-08-03 09:35:00','2017-08-03 09:35:00'),(714,29,NULL,'Pitampura','2017-08-03 09:35:00','2017-08-03 09:35:00'),(715,29,NULL,'Pushkar','2017-08-03 09:35:00','2017-08-03 09:35:00'),(716,29,NULL,'Rana','2017-08-03 09:35:00','2017-08-03 09:35:00'),(717,29,NULL,'Roshan','2017-08-03 09:35:00','2017-08-03 09:35:00'),(718,29,NULL,'Shiv','2017-08-03 09:35:00','2017-08-03 09:35:00'),(719,29,NULL,'Sikar','2017-08-03 09:35:00','2017-08-03 09:35:00'),(720,29,NULL,'Sirohi','2017-08-03 09:35:00','2017-08-03 09:35:00'),(721,29,NULL,'Sojat','2017-08-03 09:35:00','2017-08-03 09:35:00'),(722,29,NULL,'Sultan','2017-08-03 09:35:00','2017-08-03 09:35:00'),(723,29,NULL,'Surana','2017-08-03 09:35:00','2017-08-03 09:35:00'),(724,29,NULL,'Suratgarh','2017-08-03 09:35:00','2017-08-03 09:35:00'),(725,29,NULL,'Thali','2017-08-03 09:35:00','2017-08-03 09:35:00'),(726,29,NULL,'Tonk','2017-08-03 09:35:00','2017-08-03 09:35:00'),(727,29,NULL,'Udaipur','2017-08-03 09:35:00','2017-08-03 09:35:00'),(728,30,NULL,'Gangtok','2017-08-03 09:35:00','2017-08-03 09:35:00'),(729,30,NULL,'Manu','2017-08-03 09:35:00','2017-08-03 09:35:00'),(730,30,NULL,'Singtam','2017-08-03 09:35:00','2017-08-03 09:35:00'),(731,30,NULL,'Sirwani','2017-08-03 09:35:00','2017-08-03 09:35:00'),(732,31,NULL,'Adilabad','2017-08-03 09:35:01','2017-08-03 09:35:01'),(733,31,NULL,'Balanagar','2017-08-03 09:35:01','2017-08-03 09:35:01'),(734,31,NULL,'Bhongir','2017-08-03 09:35:01','2017-08-03 09:35:01'),(735,31,NULL,'Bodhan','2017-08-03 09:35:01','2017-08-03 09:35:01'),(736,31,NULL,'Gudur','2017-08-03 09:35:01','2017-08-03 09:35:01'),(737,31,NULL,'Hyderabad','2017-08-03 09:35:01','2017-08-03 09:35:01'),(738,31,NULL,'Karimnagar','2017-08-03 09:35:01','2017-08-03 09:35:01'),(739,31,NULL,'Khammam','2017-08-03 09:35:01','2017-08-03 09:35:01'),(740,31,NULL,'Kottagudem','2017-08-03 09:35:01','2017-08-03 09:35:01'),(741,31,NULL,'Mancherial','2017-08-03 09:35:01','2017-08-03 09:35:01'),(742,31,NULL,'Medak','2017-08-03 09:35:01','2017-08-03 09:35:01'),(743,31,NULL,'Medchal','2017-08-03 09:35:01','2017-08-03 09:35:01'),(744,31,NULL,'Nalgonda','2017-08-03 09:35:01','2017-08-03 09:35:01'),(745,31,NULL,'Narsapur','2017-08-03 09:35:01','2017-08-03 09:35:01'),(746,31,NULL,'Nizamabad','2017-08-03 09:35:01','2017-08-03 09:35:01'),(747,31,NULL,'Paloncha','2017-08-03 09:35:01','2017-08-03 09:35:01'),(748,31,NULL,'Patancheru','2017-08-03 09:35:01','2017-08-03 09:35:01'),(749,31,NULL,'Patelguda','2017-08-03 09:35:01','2017-08-03 09:35:01'),(750,31,NULL,'Pochampalli','2017-08-03 09:35:01','2017-08-03 09:35:01'),(751,31,NULL,'Secunderabad','2017-08-03 09:35:01','2017-08-03 09:35:01'),(752,31,NULL,'Shadnagar','2017-08-03 09:35:01','2017-08-03 09:35:01'),(753,31,NULL,'Suriapet','2017-08-03 09:35:01','2017-08-03 09:35:01'),(754,31,NULL,'Uppal','2017-08-03 09:35:01','2017-08-03 09:35:01'),(755,31,NULL,'Vikarabad','2017-08-03 09:35:01','2017-08-03 09:35:01'),(756,31,NULL,'Warangal','2017-08-03 09:35:01','2017-08-03 09:35:01'),(757,32,NULL,'Alangulam','2017-08-03 09:35:02','2017-08-03 09:35:02'),(758,32,NULL,'Ambur','2017-08-03 09:35:02','2017-08-03 09:35:02'),(759,32,NULL,'Annamalainagar','2017-08-03 09:35:02','2017-08-03 09:35:02'),(760,32,NULL,'Arakkonam','2017-08-03 09:35:02','2017-08-03 09:35:02'),(761,32,NULL,'Arani','2017-08-03 09:35:02','2017-08-03 09:35:02'),(762,32,NULL,'Ariyalur','2017-08-03 09:35:02','2017-08-03 09:35:02'),(763,32,NULL,'Attur','2017-08-03 09:35:02','2017-08-03 09:35:02'),(764,32,NULL,'Bodinayakkanur','2017-08-03 09:35:02','2017-08-03 09:35:02'),(765,32,NULL,'Chennai','2017-08-03 09:35:02','2017-08-03 09:35:02'),(766,32,NULL,'Cheyyar','2017-08-03 09:35:02','2017-08-03 09:35:02'),(767,32,NULL,'Chidambaram','2017-08-03 09:35:02','2017-08-03 09:35:02'),(768,32,NULL,'Choolai','2017-08-03 09:35:02','2017-08-03 09:35:02'),(769,32,NULL,'Coimbatore','2017-08-03 09:35:02','2017-08-03 09:35:02'),(770,32,NULL,'Coonoor','2017-08-03 09:35:02','2017-08-03 09:35:02'),(771,32,NULL,'Cuddalore','2017-08-03 09:35:02','2017-08-03 09:35:02'),(772,32,NULL,'Devipattinam','2017-08-03 09:35:02','2017-08-03 09:35:02'),(773,32,NULL,'Dharapuram','2017-08-03 09:35:02','2017-08-03 09:35:02'),(774,32,NULL,'Dharmapuri','2017-08-03 09:35:02','2017-08-03 09:35:02'),(775,32,NULL,'Dindigul','2017-08-03 09:35:02','2017-08-03 09:35:02'),(776,32,NULL,'Ekkattuthangal','2017-08-03 09:35:02','2017-08-03 09:35:02'),(777,32,NULL,'Eral','2017-08-03 09:35:02','2017-08-03 09:35:02'),(778,32,NULL,'Erode','2017-08-03 09:35:02','2017-08-03 09:35:02'),(779,32,NULL,'Fort','2017-08-03 09:35:02','2017-08-03 09:35:02'),(780,32,NULL,'Gobichettipalayam','2017-08-03 09:35:02','2017-08-03 09:35:02'),(781,32,NULL,'Guindy','2017-08-03 09:35:03','2017-08-03 09:35:03'),(782,32,NULL,'Hosur','2017-08-03 09:35:03','2017-08-03 09:35:03'),(783,32,NULL,'Kalpakkam','2017-08-03 09:35:03','2017-08-03 09:35:03'),(784,32,NULL,'Kanchipuram','2017-08-03 09:35:03','2017-08-03 09:35:03'),(785,32,NULL,'Kangayam','2017-08-03 09:35:03','2017-08-03 09:35:03'),(786,32,NULL,'Kaniyambadi','2017-08-03 09:35:03','2017-08-03 09:35:03'),(787,32,NULL,'Kanniyakumari','2017-08-03 09:35:03','2017-08-03 09:35:03'),(788,32,NULL,'Karaikudi','2017-08-03 09:35:03','2017-08-03 09:35:03'),(789,32,NULL,'Karamadai','2017-08-03 09:35:03','2017-08-03 09:35:03'),(790,32,NULL,'Karur','2017-08-03 09:35:03','2017-08-03 09:35:03'),(791,32,NULL,'Kodaikanal','2017-08-03 09:35:03','2017-08-03 09:35:03'),(792,32,NULL,'Koothanallur','2017-08-03 09:35:03','2017-08-03 09:35:03'),(793,32,NULL,'Kovilpatti','2017-08-03 09:35:03','2017-08-03 09:35:03'),(794,32,NULL,'Krishnagiri','2017-08-03 09:35:03','2017-08-03 09:35:03'),(795,32,NULL,'Kumbakonam','2017-08-03 09:35:03','2017-08-03 09:35:03'),(796,32,NULL,'Kuzhithurai','2017-08-03 09:35:03','2017-08-03 09:35:03'),(797,32,NULL,'Lalgudi','2017-08-03 09:35:03','2017-08-03 09:35:03'),(798,32,NULL,'Madurai','2017-08-03 09:35:03','2017-08-03 09:35:03'),(799,32,NULL,'Madurantakam','2017-08-03 09:35:03','2017-08-03 09:35:03'),(800,32,NULL,'Mahabalipuram','2017-08-03 09:35:03','2017-08-03 09:35:03'),(801,32,NULL,'Mannargudi','2017-08-03 09:35:03','2017-08-03 09:35:03'),(802,32,NULL,'Mettur','2017-08-03 09:35:03','2017-08-03 09:35:03'),(803,32,NULL,'Mylapore','2017-08-03 09:35:03','2017-08-03 09:35:03'),(804,32,NULL,'Nagapattinam','2017-08-03 09:35:04','2017-08-03 09:35:04'),(805,32,NULL,'Nagercoil','2017-08-03 09:35:04','2017-08-03 09:35:04'),(806,32,NULL,'Namakkal','2017-08-03 09:35:04','2017-08-03 09:35:04'),(807,32,NULL,'Neyveli','2017-08-03 09:35:04','2017-08-03 09:35:04'),(808,32,NULL,'Omalur','2017-08-03 09:35:04','2017-08-03 09:35:04'),(809,32,NULL,'Ooty','2017-08-03 09:35:04','2017-08-03 09:35:04'),(810,32,NULL,'Palani','2017-08-03 09:35:04','2017-08-03 09:35:04'),(811,32,NULL,'Palladam','2017-08-03 09:35:04','2017-08-03 09:35:04'),(812,32,NULL,'Panruti','2017-08-03 09:35:04','2017-08-03 09:35:04'),(813,32,NULL,'Pattukkottai','2017-08-03 09:35:04','2017-08-03 09:35:04'),(814,32,NULL,'Perambalur','2017-08-03 09:35:04','2017-08-03 09:35:04'),(815,32,NULL,'Peranampattu','2017-08-03 09:35:04','2017-08-03 09:35:04'),(816,32,NULL,'Perundurai','2017-08-03 09:35:04','2017-08-03 09:35:04'),(817,32,NULL,'Pollachi','2017-08-03 09:35:04','2017-08-03 09:35:04'),(818,32,NULL,'Ponneri','2017-08-03 09:35:04','2017-08-03 09:35:04'),(819,32,NULL,'Pudukkottai','2017-08-03 09:35:04','2017-08-03 09:35:04'),(820,32,NULL,'Puliyur','2017-08-03 09:35:04','2017-08-03 09:35:04'),(821,32,NULL,'Rajapalaiyam','2017-08-03 09:35:04','2017-08-03 09:35:04'),(822,32,NULL,'Ramanathapuram','2017-08-03 09:35:04','2017-08-03 09:35:04'),(823,32,NULL,'Ranippettai','2017-08-03 09:35:04','2017-08-03 09:35:04'),(824,32,NULL,'Salem','2017-08-03 09:35:04','2017-08-03 09:35:04'),(825,32,NULL,'Sattur','2017-08-03 09:35:04','2017-08-03 09:35:04'),(826,32,NULL,'Sholavandan','2017-08-03 09:35:05','2017-08-03 09:35:05'),(827,32,NULL,'Sirkazhi','2017-08-03 09:35:05','2017-08-03 09:35:05'),(828,32,NULL,'Siruseri','2017-08-03 09:35:05','2017-08-03 09:35:05'),(829,32,NULL,'Sivaganga','2017-08-03 09:35:05','2017-08-03 09:35:05'),(830,32,NULL,'Sivakasi','2017-08-03 09:35:05','2017-08-03 09:35:05'),(831,32,NULL,'Sriperumbudur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(832,32,NULL,'Srirangam','2017-08-03 09:35:05','2017-08-03 09:35:05'),(833,32,NULL,'Srivilliputhur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(834,32,NULL,'Tambaram','2017-08-03 09:35:05','2017-08-03 09:35:05'),(835,32,NULL,'Thanjavur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(836,32,NULL,'Thenkasi','2017-08-03 09:35:05','2017-08-03 09:35:05'),(837,32,NULL,'Thirumangalam','2017-08-03 09:35:05','2017-08-03 09:35:05'),(838,32,NULL,'Thiruthani','2017-08-03 09:35:05','2017-08-03 09:35:05'),(839,32,NULL,'Thiruvarur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(840,32,NULL,'Thoothukudi','2017-08-03 09:35:05','2017-08-03 09:35:05'),(841,32,NULL,'Tindivanam','2017-08-03 09:35:05','2017-08-03 09:35:05'),(842,32,NULL,'Tiruchchendur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(843,32,NULL,'Tiruchi','2017-08-03 09:35:05','2017-08-03 09:35:05'),(844,32,NULL,'Tirunelveli','2017-08-03 09:35:05','2017-08-03 09:35:05'),(845,32,NULL,'Tiruppur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(846,32,NULL,'Tiruvallur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(847,32,NULL,'Tiruvannamalai','2017-08-03 09:35:05','2017-08-03 09:35:05'),(848,32,NULL,'Turaiyur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(849,32,NULL,'Vadamadurai','2017-08-03 09:35:05','2017-08-03 09:35:05'),(850,32,NULL,'Vandalur','2017-08-03 09:35:05','2017-08-03 09:35:05'),(851,32,NULL,'Vandavasi','2017-08-03 09:35:06','2017-08-03 09:35:06'),(852,32,NULL,'Vaniyambadi','2017-08-03 09:35:06','2017-08-03 09:35:06'),(853,32,NULL,'Vellore','2017-08-03 09:35:06','2017-08-03 09:35:06'),(854,32,NULL,'Villupuram','2017-08-03 09:35:06','2017-08-03 09:35:06'),(855,32,NULL,'Wellington','2017-08-03 09:35:06','2017-08-03 09:35:06'),(856,32,NULL,'Yercaud','2017-08-03 09:35:06','2017-08-03 09:35:06'),(857,33,NULL,'Agartala','2017-08-03 09:35:06','2017-08-03 09:35:06'),(858,33,NULL,'Kamalpur','2017-08-03 09:35:06','2017-08-03 09:35:06'),(859,34,NULL,'Adwani','2017-08-03 09:35:06','2017-08-03 09:35:06'),(860,34,NULL,'Almora','2017-08-03 09:35:06','2017-08-03 09:35:06'),(861,34,NULL,'Dang','2017-08-03 09:35:06','2017-08-03 09:35:06'),(862,34,NULL,'Dangi','2017-08-03 09:35:06','2017-08-03 09:35:06'),(863,34,NULL,'Dehradun','2017-08-03 09:35:06','2017-08-03 09:35:06'),(864,34,NULL,'Dhanaulti','2017-08-03 09:35:06','2017-08-03 09:35:06'),(865,34,NULL,'Dogadda','2017-08-03 09:35:06','2017-08-03 09:35:06'),(866,34,NULL,'Dwarahat','2017-08-03 09:35:06','2017-08-03 09:35:06'),(867,34,NULL,'Haldwani','2017-08-03 09:35:06','2017-08-03 09:35:06'),(868,34,NULL,'Haridwar','2017-08-03 09:35:06','2017-08-03 09:35:06'),(869,34,NULL,'Jamal','2017-08-03 09:35:06','2017-08-03 09:35:06'),(870,34,NULL,'Jaspur','2017-08-03 09:35:06','2017-08-03 09:35:06'),(871,34,NULL,'Kashipur','2017-08-03 09:35:06','2017-08-03 09:35:06'),(872,34,NULL,'Lohaghat','2017-08-03 09:35:06','2017-08-03 09:35:06'),(873,34,NULL,'Mill','2017-08-03 09:35:07','2017-08-03 09:35:07'),(874,34,NULL,'Mussoorie','2017-08-03 09:35:07','2017-08-03 09:35:07'),(875,34,NULL,'Nagal','2017-08-03 09:35:07','2017-08-03 09:35:07'),(876,34,NULL,'Naini','2017-08-03 09:35:07','2017-08-03 09:35:07'),(877,34,NULL,'Pantnagar','2017-08-03 09:35:07','2017-08-03 09:35:07'),(878,34,NULL,'Pauri','2017-08-03 09:35:07','2017-08-03 09:35:07'),(879,34,NULL,'Pithoragarh','2017-08-03 09:35:07','2017-08-03 09:35:07'),(880,34,NULL,'Ramnagar','2017-08-03 09:35:07','2017-08-03 09:35:07'),(881,34,NULL,'Rishikesh','2017-08-03 09:35:07','2017-08-03 09:35:07'),(882,34,NULL,'Roorkee','2017-08-03 09:35:07','2017-08-03 09:35:07'),(883,34,NULL,'Sidhpur','2017-08-03 09:35:07','2017-08-03 09:35:07'),(884,34,NULL,'Uttarkashi','2017-08-03 09:35:07','2017-08-03 09:35:07'),(885,34,NULL,'Vikasnagar','2017-08-03 09:35:07','2017-08-03 09:35:07'),(886,35,NULL,'Agra','2017-08-03 09:35:07','2017-08-03 09:35:07'),(887,35,NULL,'Ajabpur','2017-08-03 09:35:07','2017-08-03 09:35:07'),(888,35,NULL,'Aligarh','2017-08-03 09:35:07','2017-08-03 09:35:07'),(889,35,NULL,'Allahabad','2017-08-03 09:35:07','2017-08-03 09:35:07'),(890,35,NULL,'Anandnagar','2017-08-03 09:35:07','2017-08-03 09:35:07'),(891,35,NULL,'Arora','2017-08-03 09:35:07','2017-08-03 09:35:07'),(892,35,NULL,'Azamgarh','2017-08-03 09:35:07','2017-08-03 09:35:07'),(893,35,NULL,'Bagpat','2017-08-03 09:35:07','2017-08-03 09:35:07'),(894,35,NULL,'Balu','2017-08-03 09:35:07','2017-08-03 09:35:07'),(895,35,NULL,'Banda','2017-08-03 09:35:07','2017-08-03 09:35:07'),(896,35,NULL,'Bank','2017-08-03 09:35:07','2017-08-03 09:35:07'),(897,35,NULL,'Bareilly','2017-08-03 09:35:07','2017-08-03 09:35:07'),(898,35,NULL,'Basti','2017-08-03 09:35:07','2017-08-03 09:35:07'),(899,35,NULL,'Bela','2017-08-03 09:35:07','2017-08-03 09:35:07'),(900,35,NULL,'Bhadohi','2017-08-03 09:35:08','2017-08-03 09:35:08'),(901,35,NULL,'Bichpuri','2017-08-03 09:35:08','2017-08-03 09:35:08'),(902,35,NULL,'Budaun','2017-08-03 09:35:08','2017-08-03 09:35:08'),(903,35,NULL,'Bulandshahr','2017-08-03 09:35:08','2017-08-03 09:35:08'),(904,35,NULL,'Chandauli','2017-08-03 09:35:08','2017-08-03 09:35:08'),(905,35,NULL,'Chandausi','2017-08-03 09:35:08','2017-08-03 09:35:08'),(906,35,NULL,'Chitra','2017-08-03 09:35:08','2017-08-03 09:35:08'),(907,35,NULL,'Dadri','2017-08-03 09:35:08','2017-08-03 09:35:08'),(908,35,NULL,'Dasna','2017-08-03 09:35:08','2017-08-03 09:35:08'),(909,35,NULL,'Deoria','2017-08-03 09:35:08','2017-08-03 09:35:08'),(910,35,NULL,'Etawah','2017-08-03 09:35:08','2017-08-03 09:35:08'),(911,35,NULL,'Faizabad','2017-08-03 09:35:08','2017-08-03 09:35:08'),(912,35,NULL,'Fatehgarh','2017-08-03 09:35:08','2017-08-03 09:35:08'),(913,35,NULL,'Fatehpur','2017-08-03 09:35:08','2017-08-03 09:35:08'),(914,35,NULL,'Firozabad','2017-08-03 09:35:08','2017-08-03 09:35:08'),(915,35,NULL,'Ghaziabad','2017-08-03 09:35:08','2017-08-03 09:35:08'),(916,35,NULL,'Gonda','2017-08-03 09:35:08','2017-08-03 09:35:08'),(917,35,NULL,'Gorakhpur','2017-08-03 09:35:08','2017-08-03 09:35:08'),(918,35,NULL,'Hamirpur','2017-08-03 09:35:08','2017-08-03 09:35:08'),(919,35,NULL,'Hapur','2017-08-03 09:35:08','2017-08-03 09:35:08'),(920,35,NULL,'Iglas','2017-08-03 09:35:09','2017-08-03 09:35:09'),(921,35,NULL,'Jalesar','2017-08-03 09:35:09','2017-08-03 09:35:09'),(922,35,NULL,'Jaunpur','2017-08-03 09:35:09','2017-08-03 09:35:09'),(923,35,NULL,'Jhansi','2017-08-03 09:35:09','2017-08-03 09:35:09'),(924,35,NULL,'Kaimganj','2017-08-03 09:35:09','2017-08-03 09:35:09'),(925,35,NULL,'Kanpur','2017-08-03 09:35:09','2017-08-03 09:35:09'),(926,35,NULL,'Karari','2017-08-03 09:35:09','2017-08-03 09:35:09'),(927,35,NULL,'Kasganj','2017-08-03 09:35:09','2017-08-03 09:35:09'),(928,35,NULL,'Kasia','2017-08-03 09:35:09','2017-08-03 09:35:09'),(929,35,NULL,'Khandar','2017-08-03 09:35:09','2017-08-03 09:35:09'),(930,35,NULL,'Khatauli','2017-08-03 09:35:09','2017-08-03 09:35:09'),(931,35,NULL,'Kheri','2017-08-03 09:35:10','2017-08-03 09:35:10'),(932,35,NULL,'Khurja','2017-08-03 09:35:10','2017-08-03 09:35:10'),(933,35,NULL,'Kunwar','2017-08-03 09:35:10','2017-08-03 09:35:10'),(934,35,NULL,'Lakhimpur','2017-08-03 09:35:10','2017-08-03 09:35:10'),(935,35,NULL,'Lucknow','2017-08-03 09:35:10','2017-08-03 09:35:10'),(936,35,NULL,'Madhoganj','2017-08-03 09:35:10','2017-08-03 09:35:10'),(937,35,NULL,'Mathan','2017-08-03 09:35:10','2017-08-03 09:35:10'),(938,35,NULL,'Mathura','2017-08-03 09:35:10','2017-08-03 09:35:10'),(939,35,NULL,'Mawana','2017-08-03 09:35:10','2017-08-03 09:35:10'),(940,35,NULL,'Meerut','2017-08-03 09:35:10','2017-08-03 09:35:10'),(941,35,NULL,'Mehra','2017-08-03 09:35:10','2017-08-03 09:35:10'),(942,35,NULL,'Mirza Murad','2017-08-03 09:35:10','2017-08-03 09:35:10'),(943,35,NULL,'Mirzapur','2017-08-03 09:35:10','2017-08-03 09:35:10'),(944,35,NULL,'Mohan','2017-08-03 09:35:10','2017-08-03 09:35:10'),(945,35,NULL,'Moradabad','2017-08-03 09:35:10','2017-08-03 09:35:10'),(946,35,NULL,'Muzaffarnagar','2017-08-03 09:35:10','2017-08-03 09:35:10'),(947,35,NULL,'Noida','2017-08-03 09:35:10','2017-08-03 09:35:10'),(948,35,NULL,'Orai','2017-08-03 09:35:10','2017-08-03 09:35:10'),(949,35,NULL,'Padrauna','2017-08-03 09:35:10','2017-08-03 09:35:10'),(950,35,NULL,'Phaphamau','2017-08-03 09:35:10','2017-08-03 09:35:10'),(951,35,NULL,'Pilkhuwa','2017-08-03 09:35:10','2017-08-03 09:35:10'),(952,35,NULL,'Potti','2017-08-03 09:35:10','2017-08-03 09:35:10'),(953,35,NULL,'Rampur','2017-08-03 09:35:10','2017-08-03 09:35:10'),(954,35,NULL,'Saharanpur','2017-08-03 09:35:10','2017-08-03 09:35:10'),(955,35,NULL,'Sahibabad','2017-08-03 09:35:10','2017-08-03 09:35:10'),(956,35,NULL,'Shahjahanpur','2017-08-03 09:35:10','2017-08-03 09:35:10'),(957,35,NULL,'Shamsabad','2017-08-03 09:35:11','2017-08-03 09:35:11'),(958,35,NULL,'Sikka','2017-08-03 09:35:11','2017-08-03 09:35:11'),(959,35,NULL,'Sitapur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(960,35,NULL,'Sultanpur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(961,35,NULL,'Tanda','2017-08-03 09:35:11','2017-08-03 09:35:11'),(962,35,NULL,'Teri','2017-08-03 09:35:11','2017-08-03 09:35:11'),(963,35,NULL,'Tikamgarh','2017-08-03 09:35:11','2017-08-03 09:35:11'),(964,35,NULL,'Unnao','2017-08-03 09:35:11','2017-08-03 09:35:11'),(965,35,NULL,'Varanasi','2017-08-03 09:35:11','2017-08-03 09:35:11'),(966,36,NULL,'Alipur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(967,36,NULL,'Asansol','2017-08-03 09:35:11','2017-08-03 09:35:11'),(968,36,NULL,'Baharampur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(969,36,NULL,'Baidyabati','2017-08-03 09:35:11','2017-08-03 09:35:11'),(970,36,NULL,'Bali','2017-08-03 09:35:11','2017-08-03 09:35:11'),(971,36,NULL,'Balurghat','2017-08-03 09:35:11','2017-08-03 09:35:11'),(972,36,NULL,'Bangaon','2017-08-03 09:35:11','2017-08-03 09:35:11'),(973,36,NULL,'Bankura','2017-08-03 09:35:11','2017-08-03 09:35:11'),(974,36,NULL,'Barakpur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(975,36,NULL,'Barddhaman','2017-08-03 09:35:11','2017-08-03 09:35:11'),(976,36,NULL,'Basirhat','2017-08-03 09:35:11','2017-08-03 09:35:11'),(977,36,NULL,'Behala','2017-08-03 09:35:11','2017-08-03 09:35:11'),(978,36,NULL,'Belgharia','2017-08-03 09:35:11','2017-08-03 09:35:11'),(979,36,NULL,'Binnaguri','2017-08-03 09:35:11','2017-08-03 09:35:11'),(980,36,NULL,'Bishnupur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(981,36,NULL,'Bolpur','2017-08-03 09:35:11','2017-08-03 09:35:11'),(982,36,NULL,'Budbud','2017-08-03 09:35:12','2017-08-03 09:35:12'),(983,36,NULL,'Canning','2017-08-03 09:35:12','2017-08-03 09:35:12'),(984,36,NULL,'Chandannagar','2017-08-03 09:35:12','2017-08-03 09:35:12'),(985,36,NULL,'Dam Dam','2017-08-03 09:35:12','2017-08-03 09:35:12'),(986,36,NULL,'Darjeeling','2017-08-03 09:35:12','2017-08-03 09:35:12'),(987,36,NULL,'Durgapur','2017-08-03 09:35:12','2017-08-03 09:35:12'),(988,36,NULL,'Farakka','2017-08-03 09:35:12','2017-08-03 09:35:12'),(989,36,NULL,'Ghatal','2017-08-03 09:35:12','2017-08-03 09:35:12'),(990,36,NULL,'Gujrat','2017-08-03 09:35:12','2017-08-03 09:35:12'),(991,36,NULL,'Habra','2017-08-03 09:35:12','2017-08-03 09:35:12'),(992,36,NULL,'Haldia','2017-08-03 09:35:12','2017-08-03 09:35:12'),(993,36,NULL,'Haripur','2017-08-03 09:35:12','2017-08-03 09:35:12'),(994,36,NULL,'Howrah','2017-08-03 09:35:12','2017-08-03 09:35:12'),(995,36,NULL,'Hugli','2017-08-03 09:35:12','2017-08-03 09:35:12'),(996,36,NULL,'Jadabpur','2017-08-03 09:35:12','2017-08-03 09:35:12'),(997,36,NULL,'Jalpaiguri','2017-08-03 09:35:12','2017-08-03 09:35:12'),(998,36,NULL,'Jayanti','2017-08-03 09:35:12','2017-08-03 09:35:12'),(999,36,NULL,'Jhargram','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1000,36,NULL,'Kakdwip','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1001,36,NULL,'Kalyani','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1002,36,NULL,'Kanchrapara','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1003,36,NULL,'Kandi','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1004,36,NULL,'Karsiyang','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1005,36,NULL,'Katoya','2017-08-03 09:35:12','2017-08-03 09:35:12'),(1006,36,NULL,'Kharagpur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1007,36,NULL,'Koch Bihar','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1008,36,NULL,'Kolkata','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1009,36,NULL,'Konnagar','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1010,36,NULL,'Kulti','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1011,36,NULL,'Liluah','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1012,36,NULL,'Maldah','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1013,36,NULL,'Manipur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1014,36,NULL,'Mayapur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1015,36,NULL,'Medinipur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1016,36,NULL,'Multi','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1017,36,NULL,'Murshidabad','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1018,36,NULL,'Nabadwip','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1019,36,NULL,'Panchal','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1020,36,NULL,'Puruliya','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1021,36,NULL,'Rajpur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1022,36,NULL,'Ranaghat','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1023,36,NULL,'Raniganj','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1024,36,NULL,'Rudrapur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1025,36,NULL,'Rupnarayanpur','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1026,36,NULL,'Salt Lake City','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1027,36,NULL,'Saranga','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1028,36,NULL,'Serampore','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1029,36,NULL,'Shyamnagar','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1030,36,NULL,'Siliguri','2017-08-03 09:35:13','2017-08-03 09:35:13'),(1031,36,NULL,'Siuri','2017-08-03 09:35:14','2017-08-03 09:35:14'),(1032,23,NULL,'Shajapur','2017-08-03 09:35:14','2017-08-03 09:35:14');
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
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `is_proceed` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  KEY `index_employee_attendances_on_holiday_id` (`holiday_id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_b05fcec060` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_categories`
--

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;
INSERT INTO `employee_categories` VALUES (1,'1001','Director',NULL,NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(2,'1002','Staff',NULL,NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(3,'1003','Worker',NULL,NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16');
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
INSERT INTO `employee_code_masters` VALUES (1,'Pune','01','01',1,NULL,'2017-08-04 03:29:28','2017-08-04 03:29:28'),(2,'Hyderabad','12345','12345',1,NULL,'2017-08-04 03:29:46','2017-08-04 03:29:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,'1001','CEO',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(2,'1002','Associate Vice President ',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(3,'1003','Vice President',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(4,'1004','Senior Manager',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(5,'1005','Analyst',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(6,'1006','Senior System Administrator',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(7,'1007','Manager',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(8,'1008','Office Assistant',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(9,'1009','Project Manager',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(10,'1010','Graphic Designer',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(11,'1011','Senior Analyst',NULL,NULL,'2017-08-04 04:09:51','2017-08-04 04:09:51'),(12,'1012','Senior Editor',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(13,'1013','Associate Project Manager',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(14,'1014','Deputy Manager ',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(15,'1015','Team Lead',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(16,'1016','Assistant Manager ',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(17,'1017','Senior Primary Research Analyst',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(18,'1018','Executive',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(19,'1019','Senior Graphic Designer',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(20,'1020','Junior Graphic Designer',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(21,'1021','Associate Analyst',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(22,'1022','Senior Data Scientist',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(23,'1023','Lead Analyst',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(24,'1024','Associate Director ',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(25,'1025','Office Driver',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(26,'1026','Senior Business Development Executive',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(27,'1027','Inside Sales Consultant: Pharma and Life Science',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(28,'1028','System Administrator',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(29,'1029','Director',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(30,'1030','COO',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(31,'1031','IT Analyst',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(32,'1032','Database Architect',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(33,'1033','Data Scientist',NULL,NULL,'2017-08-04 04:09:52','2017-08-04 04:09:52'),(34,'1034','Front Office Executive',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(35,'1035','Lead Developer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(36,'1036','Senior Vice President - Investment Research',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(37,'1037','Head - Human Resources & Administration',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(38,'1038','Junior Data Scientist',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(39,'1039','Delivery Lead – Data Analytics',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(40,'1040','Senior Content Editor',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(41,'1041','Client Relationship Manager',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(42,'1042','Senior Financial Analyst',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(43,'1043','Head Finance',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(44,'1044','Associate Content Specialist',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(45,'1045','Big Data Engineer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(46,'1046','Reporting Specialist',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(47,'1047','Senior Executive ',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(48,'1048','Web Developer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(49,'1049','Digital Marketing Head',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(50,'1050','BI Engineer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(51,'1051','VBA developer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(52,'1052','Senior Developer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(53,'1053','Senior Vice President - Analytics',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(54,'1054','Data Analyst',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(55,'1055','Senior software Engineer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(56,'1056','Research Manager',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(57,'1057','Software Engineer',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53'),(58,'1058','Lead Data Scientist',NULL,NULL,'2017-08-04 04:09:53','2017-08-04 04:09:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'1001','A',NULL,'2017-08-03 09:34:16','2017-08-04 04:11:44'),(2,NULL,'B',NULL,'2017-08-04 04:11:48','2017-08-04 04:11:48'),(3,NULL,'C',NULL,'2017-08-04 04:11:50','2017-08-04 04:11:50'),(4,NULL,'D',NULL,'2017-08-04 04:11:55','2017-08-04 04:11:55'),(5,NULL,'E',NULL,'2017-08-04 04:11:58','2017-08-04 04:11:58'),(6,NULL,'F',NULL,'2017-08-04 04:12:01','2017-08-04 04:12:01'),(7,NULL,'G',NULL,'2017-08-04 04:12:04','2017-08-04 04:12:04'),(8,NULL,'H',NULL,'2017-08-04 04:12:07','2017-08-04 04:12:07'),(9,NULL,'I',NULL,'2017-08-04 04:12:10','2017-08-04 04:12:10');
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
  `resign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leaving_reason_id` int(11) DEFAULT NULL,
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (1,'1001','Trainee',NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(2,'1002','Permanent',NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(3,'1003','Probation',NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(4,'1004','Resigned',NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16'),(5,'1005','Confirmed',NULL,NULL,'2017-08-03 09:34:16','2017-08-03 09:34:16');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passport_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_photo_file_size` int(11) DEFAULT NULL,
  `passport_photo_updated_at` datetime DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
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
  CONSTRAINT `fk_rails_0025f65a97` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_0e6f1ceeeb` FOREIGN KEY (`employee_code_master_id`) REFERENCES `employee_code_masters` (`id`),
  CONSTRAINT `fk_rails_0f20a81443` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`),
  CONSTRAINT `fk_rails_15ca1438d5` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_3cad0b3f1b` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`id`),
  CONSTRAINT `fk_rails_44cfcfba34` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_6242475258` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`),
  CONSTRAINT `fk_rails_7fb9aac7a3` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  CONSTRAINT `fk_rails_8587c7b912` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_aff313c1b7` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_c3ceaae2da` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  CONSTRAINT `fk_rails_eb26439f43` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','EMP0000001',NULL,NULL,'Sushant',NULL,'Gupta','1967-09-24','Male','7201','9890016447','5001','sushant@sganalytics.com','NA','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AHRPG0717C','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,25,NULL,1,'2017-08-04 03:41:16','2017-08-04 03:41:16',NULL,NULL,NULL,NULL,NULL),(2,'2','EMP0000002',NULL,NULL,'Simran',NULL,'Wadhwa','1983-11-20','Female','7223','9850248555','5023','simran@sganalytics.com','NA','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','AAYPW3067B','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:16','2017-08-04 03:41:16',NULL,NULL,NULL,NULL,NULL),(3,'4','EMP0000003',NULL,NULL,'Rahul',NULL,'Sowani','1982-02-18','Male','7253','9850069823','5053','rahul@sganalytics.com','NA','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','BHRPS9517B','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:16','2017-08-04 03:41:16',NULL,NULL,NULL,NULL,NULL),(4,'5','EMP0000004',NULL,NULL,'Shrikrishna',NULL,'Bawachkar','1981-12-19','Male','7266','9765830856','5066','shrikrishna@sganalytics.com','shrikrishna.bawachkar@gamil.com','Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth',1,20,504,'Pune',411030,'Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth, Pune 30','0','AMTPB5555G','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:16','2017-08-04 03:41:16',NULL,NULL,NULL,NULL,NULL),(5,'33','EMP0000005',NULL,NULL,'Ashok',NULL,'Kumar','1988-03-05','Male','0','9579647553','0','ashok@sganalytics.com','kumar_aa16@yahoo.com','Vill. Kakkar PO. Chandruhi Teh.',1,13,NULL,'Hamirpur',177024,'Willam Nagar Omkar Colony S.No. 9/1 Amrut Apartment Pimple Gurave Pune - 411027','0','AYXPK8982E','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(6,'34','EMP0000006',NULL,NULL,'Suryakant',NULL,'Sutar','1983-05-23','Male','0','9011582323','0','surya@sganalytics.com','NA','S/n 74, New Sangavi, Samarth Nagar, Near TATA Indicom Tower',1,20,504,'Pune',411027,'S/n 74, New Sangavi, Samarth Nagar, Near TATA indicom tower, Pune 27','0','BDGPS7033F','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(7,'37','EMP0000007',NULL,NULL,'Anil',NULL,'Bhote','1984-03-19','Male','0','9604609338','0','anil@sganalytics.com','anilsb2006@rediffmail.com','Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale',1,20,504,'Talegaon Dabhade',410507,'Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale, Talegaon Dabhade - 410507','0','ANHPB3506E','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(8,'40','EMP0000008',NULL,NULL,'Santosh',NULL,'Dhande','1984-08-31','Male','0','9028892681','0','santosh@sganalytics.com','santoshdhande@gmail.com','Radha Krishna Niwas, Shiv Colony, Warale Road, Tal. Mawal',1,20,504,'Talegaon Dhabhade',410507,'Radha Krishna Niwas, Plt. No. 369,  Shiv colony, Warale road, Near Kohinoor Begonia Estate,Talegaon Dabhade, Tal. Maval, Dist. Pune,Pin. 410507.','0','AKDPD6744R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(9,'44','EMP0000009',NULL,NULL,'Umesh',NULL,'Shelar','1985-12-24','Male','0','9960258387','0','umesh@sganalytics.com','uashelar@gmail.com','At – Sherpe (Patilwadi),  Post – Kurangavane',1,20,NULL,'Kankavli',416703,'C/o – Anurath Kisan Sherkhane , Sr. No. 59/2 B 1, Near Raigad Colony,Gulmohar Colony, Rahatani, Pune 411 017','0','BHOPS9509L','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(10,'50','EMP0000010',NULL,NULL,'Pradip',NULL,'Chowdhary','1982-01-08','Male','0','9860484814','0','pradip@sganalytics.com','NA','At Khedi Tal',1,20,NULL,'Jalgaon',0,'B-12,Wagheshwar Nagar,Near Wagheshwar Temple Wagholi, Tal-Haveli, Dist-Pune','0','AHWPC3011G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(11,'51','EMP0000011',NULL,NULL,'Umed','Padghan','(Patil)','1980-12-27','Male','7209','9960641806','5009','umedpatil@sganalytics.com','NA','At Post Mera B.K.',1,20,NULL,'Chikhali',443201,'Flat No- 4, Krushnavel Apt, Plot No 15, Girija Society, Kothrud, Pune-38','0','ARZPP3982E','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(12,'61','EMP0000012',NULL,NULL,'Ravi',NULL,'Vitkar','1989-06-15','Male','0','9923647439','0','NA','NA','101, Lalchal, Kusalkar Putala, Gokhale Nagar',1,20,504,'Pune',411016,'101, Lalchal, Kusalkar Putala, Gokhale Nagar, Pune 411 016.','0','AHYPV4125G','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(13,'139','EMP0000013',NULL,NULL,'Ahmed',NULL,'Hakki','1962-05-27','Male','0','41795761586','0','ahakki@sganalytics.com','wickhakki@bluewin.ch        ','Burain 12, 8803 Rüschlikon',NULL,NULL,NULL,'NA',0,'Burain 12, 8803 Rüschlikon, Switzerland       ','0','NA','NA','Married',1,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(14,'185','EMP0000014',NULL,NULL,'Abhishek',NULL,'Bagrodia','1987-06-13','Male','7264','9823011026','5064','abhishek.bagrodia@sganalytics.com','abhishek.bagrodia@gmail.com','E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilakh',1,20,504,'Pune',411007,'E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilkah, Pune-411007\n','0','AJJPB7169D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,3),(15,'191','EMP0000015',NULL,NULL,'Ashvarya',NULL,'Verma','1985-01-03','Male','7314','9987549821','5130','ashvarya.verma@sganalytics.com','ashvarya.verma@gmail.com','F-1/44 Manas Apartment, Old Ashoka Garden, Behind Prabhat Petrol Pump',1,23,550,'Bhopal',462023,'B-4, Deokar Residency, Near Green Thing Restaurant, Wadgaon Sheri, Pune - 411014','0','AJJPV0966A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,3),(16,'221','EMP0000016',NULL,NULL,'Ashish',NULL,'Tendulkar','1979-08-06','Male','0','9820953312','0','ashish.tendulkar@sganalytics.com','ashishten@gmail.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,486,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','ADKPT0104D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(17,'222','EMP0000017',NULL,NULL,'Sameer',NULL,'Tendulkar','1979-08-06','Male','7220','9820953329','5020','sameer.tendulkar@sganalytics.com','sammytendz@yahoo.co.in','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,486,'Mumbai',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','AEVPT9801R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(18,'265','EMP0000018',NULL,NULL,'Divya',NULL,'Prasad','1982-09-08','Female','7350','9049870545','5136','divya.prasad@sganalytics.com','divya_upadhya@yahoo.com','48/2,Dhanlaxmi Society,Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri',1,20,504,'Pune',411014,'48/2,Dhanlaxmi Society,Ganesh Nagar,Near Anand Park bus stop,Vadgaonsheri, Pune -411014','0','AASPU9653K','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(19,'277','EMP0000019',NULL,NULL,'Roohul',NULL,'Kapadiya','1989-05-28','Male','7277','7798842427','5076','roohul.kapadia@sganalytics.com','roohulkapadia@yahoo.com','2/3076/78, Hidayat Manzil, Sagrampura, Sindhiwaad',1,12,NULL,'Surat',395003,'Jagdamba Society, Nr. Bora Classes, Somnath Nagar, Vadgaon Sheri, Pune-411006, Maharashtra.','0','AUZPK4035C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,1),(20,'281','EMP0000020',NULL,NULL,'Ninad',NULL,'Kadake','1980-11-04','Male','0','9763775428','0','ninad.kadake@sganalytics.com','NA','12 D, Shankar Chhaya Apartment, Near Mhatre Bridge, Erandwane',1,20,504,'Pune',411004,'12 D Shankar Chhaya Apartment Near Mhatre Bridge Erandwane Pune. 411 004.','0','AYBPK7303F','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:17','2017-08-04 03:41:17',NULL,NULL,NULL,NULL,NULL),(21,'282','EMP0000021',NULL,NULL,'Gunjan',NULL,'Bhatt','1980-11-15','Male','0','9561826233','0','gunjan.bhatt@sganalytics.com','NA','78/465 Vijaynagar, Naranpura',1,12,NULL,'Ahmedabad',380013,'G-304, Daffodils, Magarpatta City – 411013','0','AFXPB0304A','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(22,'290','EMP0000022',NULL,NULL,'Krashna',NULL,'Patharakar','1987-05-04','Male','0','9823385435','0','krushna.patharakar@sganalytics.com','cakrushnapatharakar@gmail.com','Priti Niwas, Kranti chowk, Main road',1,20,NULL,'Kille Dharur',0,'Flat no.6, bldg 2, Salokha hsg soc. Near BSNL office, off Satara road, pune 411009','0','BRMPP5843C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(23,'295','EMP0000023',NULL,NULL,'Sonal',NULL,'Mamtora','1981-08-17','Female','7355','9158887753','5144','sonal.mamtora@sganalytics.com','sonalmer17@yahoo.co.in','Flat no. 604, B Wing, Dhavel Windscapess Cooperative Housing Society, Hingle Mala Road, Sasane Nagar, Hadapsar',1,20,504,'Pune',411028,'Flat no. 604, B wing, Dhavel WindscapessCooperative housing society, Hingle Mala Road(Behind New English High School), Sasane Nagar, Hadapsar Pune 411028','0','AKAPM5674N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(24,'296','EMP0000024',NULL,NULL,'Nayanjyoti',NULL,'Das','1981-01-30','Male','7283','9833979018','5082','nayanjyoti.das@sganalytics.com','nayandas30@gmail.com','House No.33, Sandhyachal Nagar, Lalmati, Beltola',1,4,NULL,'Guwahati',781028,'B2/302, Lunkad Gold Coast, Viman Nagar, Pune - 411014, Maharashtra','0','AIFPD0419H','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(25,'298','EMP0000025',NULL,NULL,'Suhrid',NULL,'Barua','1975-11-21','Male','0','9970186748','0','suhrid.barua@sganalytics.com','suhridbarua@gmail.com','KKB Road Chenikuthi \'Rupan\'',1,4,NULL,'Guwahati',781003,'Ganga Kunj Society H Block 201 Kalas Vishrantwadi Alandi Road Pune 411015','0','AIKPB6845Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(26,'304','EMP0000026',NULL,NULL,'Jyoti',NULL,'Huria','1985-02-18','Female','7266','9764571611','5026','jyoti.huria@sganalytics.com','surijyoti85@yahoo.com','13/450, BTI Road',1,23,NULL,'Panna',488001,'H.No-307,48/2,Raj Palace,Dhanalaxmi Society ganesg nagar wadgaon sheri Pune','0','CIXPS6425E','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(27,'305','EMP0000027',NULL,NULL,'Mayuresh',NULL,'Wagh','1982-05-21','Male','7255','9823294888','5055','mayuresh.wagh@sganalytics.com','wagh.mayuresh@gmail.com','53, Mukund Nagar, Shree Ahireshwar Wadi',1,20,504,'Pune',411037,'53, Mukund Nagar, Shree Ahireshwar Wadi, Pune 411037','0','AAPPW7193R','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(28,'310','EMP0000028',NULL,NULL,'Varun',NULL,'Goela','1984-08-20','Male','0','7709378001','0','varun.goela@sganalytics.com','varun.goela@gmail.com','5,B-3, Bhamashah Marg',1,9,135,'Delhi',110009,'Flat 302, 4th Floor, Bhakti Apartments, Viman Nagar, Pune','0','AGWPG5937E','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(29,'335','EMP0000029',NULL,NULL,'Somnath',NULL,'Raut','1984-12-03','Male','7311','9226389306','5100','somnath.raut@sganalytics.com','somr_3@rediffmail.com','A/P: Rautwadi',1,20,504,'Shirur',412208,'B-12 2nd Floor, Anand Shri Hos. Soc., Near to Anand Park bus stop, Ganesh Nagar, Vadgoansheri, Pune 411014.','0','AKCPR7284F','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(30,'351','EMP0000030',NULL,NULL,'Sneha',NULL,'Shinde','1989-01-29','Female','7543','9096867031','0','sneha.shinde@sganalytics.com','sneha.29189@gmail.com','Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada',1,20,504,'Pune',411006,'Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada Pune 411006','0','CHIPS5059Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(31,'371','EMP0000031',NULL,NULL,'Parth',NULL,'Arora','1983-04-25','Male','7270','8390395821','5070','parth.arora@sganalytics.com','parth83@gmail.com','C/103 Gala Swing, South Bopal',1,12,170,'Ahmedabad',0,'E 5 / 605 Rohan Mithila ,Near Symbiosis college ,Viman Nagar, Pune - 411014','0','AFAPA4280P','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(32,'372','EMP0000032',NULL,NULL,'Renuka','Vikram','Vaishnav','1982-08-03','Female','1055','9011086816','0','renuka.vaishnav@sganalytics.com','chrisapu06@gmail.com','Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar, Village Mundhwa',1,20,504,'Pune',411036,'Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar,Village Mundhwa, Pune- 411036','0','AOZPM2520A','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(33,'383','EMP0000033',NULL,NULL,'Shrikant',NULL,'Sawant','1981-12-05','Male','0','9970766699','0','shrikant.sawant@sganalytics.com','shrikantsawant00@gmail.com','C/3 , Pimple Apartments , Kasarwadi ',1,20,504,'Pune',411034,'C/3 , Pimple Apartments , Kasarwadi , Pune - 411034','0','BYJPS8885D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(34,'405','EMP0000034',NULL,NULL,'Prosenjit',NULL,'Ganguly','1981-09-06','Male','0','9833364060','0','prosenjit.ganguly@sganalytics.com','prosenjitganguly@ad.in','930/A , Near P & T Gate no 4 , west Niwarganj, Wright Town',1,23,565,'Jabalpur',482002,'Flat 101, Madhusudan society, Off Lane 5, South Main Road, Near Tertulia’s, Koregaon Park, Pune.','0','AJAPG3716A','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(35,'411','EMP0000035',NULL,NULL,'Chaitanya',NULL,'Kanade','1985-01-27','Male','1044','7385219155','7548','chaitanya.kanade@sganalytics.com','ckanade09@yahoo.com','S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai Gas Agency, Wadgaon Sheri',1,20,504,'Pune',411014,'S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai gas agency, Wadgaonsheri, Pune- 411014.','0','ASTPK1180A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:18','2017-08-04 03:41:18',NULL,NULL,NULL,NULL,NULL),(36,'413','EMP0000036',NULL,NULL,'Mohammed',NULL,'Khan','1986-09-16','Male','0','9823616946','0','mohammed.khan@sganalytics.com','mohammed86khan@gmail.com','38 A ,52, Ashutosh Apartments , Napean Sea Raod',1,20,486,'Mumbai',400006,'Flat 1402, 14th Floor,Tower 12A, Amanora Park Town, Pune - 411028','0','BGXPK5662A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,8),(37,'439','EMP0000037',NULL,NULL,'Khushboo',NULL,'Gupta','1986-01-15','Female','7243','8380078776','5043','khushboo.gupta@sganalytics.com','khush.g3@gmail.com','Flat no 404, Shree Radhey Apartment, opp to MSEB Office, Wardhaman Nagar',1,20,488,'Nagpur',440008,'Wing A3, Flat no. 802, Acolade Society, Opposite Hyundari Showroom, Tukaram Nagar, Kharadi, Pune, Maharashtra 411014','0','AKKPG0871B','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,3),(38,'444','EMP0000038',NULL,NULL,'Sanjay',NULL,'Ujalambkar','1967-11-20','Male','7568','9922918554','0','sanjay.ujalambkar@sganalytics.com','sanjay.ujalambkar@rediffmail.com','Flat no - A - 15, Sukhwani Discover, 3rd Floor, Near Sant Nirankari Satsang Bhavan, Vijaynagar, Kalewadi',1,20,504,'Pune',411017,'Flat no - A - 15, Sukhwani Discover,3rd Floor , Near Sant Nirankari Satsang Bhavan, Vijaynagar,Kalewadi,Pune - 411017','0','AAOPU6003F','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,NULL),(39,'448','EMP0000039',NULL,NULL,'Balaji',NULL,'Khandade','1977-03-01','Male','0','9175000220','0','balaji.khandade@sganalytics.com','balaji.khandade@gmail.com','Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi',1,20,504,'Pune',411017,'Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi , Pune - 411017','0','AWNPK5452B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,NULL),(40,'464','EMP0000040',NULL,NULL,'Chandra','Bhanu','Gembali','1986-08-12','Male','0','8007127868','0','chandra.gembali@sganalytics.com','bhanu.gembly@gmail.com','Pendrani Rise Mills, Jagat Jagani Street',1,26,NULL,'Umerkote',764073,'Pendrani Rise Mills, Jagat Jagani Street, Umerkote 764073, Nabarangapur Dist Odisha','0','AQJPB4244N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(41,'495','EMP0000041',NULL,NULL,'Yogita',NULL,'Wahalkar','1990-01-23','Female','1051','9096809391','0','yogita.wahalkar@sganalytics.com','yogitawahalkar@gmail.com','P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad',1,20,504,'Pune',411033,'P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad, Pune-33','0','ABEPW1646D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,NULL),(42,'499','EMP0000042',NULL,NULL,'Saket',NULL,'Kumar','1981-04-07','Male','0','9049988426','0','saket.kumar@sganalytics.com','sinhasaket@outlook.com','Flat No. 62, Tulip Appt, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'Flat No. 62, Tulip Appt, Neco garden, Viman Nagar, Pune - 411014','0','AYMPK6852E','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,6),(43,'522','EMP0000043',NULL,NULL,'Vartika',NULL,'Deshma','1992-10-16','Female','7335','8087964076','5123','vartika.deshma@sganalytics.com','deshma.vartika5645@gmail.com','H.No.2675, Bairagpura',1,35,938,'Mathura',281001,'Tai niwas, Flat no.204, Opp Zensar, Kharadi, Pune','0','BHFPD4443P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(44,'530','EMP0000044',NULL,NULL,'Shashank',NULL,'Kulkarni','1986-09-10','Male','7546','9823883424','0','shashank.kulkarni@sganalytics.com','shashankkulkarni10@gmail.com','Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari',1,20,504,'Pune',411041,'Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari 411041','0','BMFPK8112B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,NULL),(45,'540','EMP0000045',NULL,NULL,'Shrikant',NULL,'Sankpal','1987-04-23','Male','7284','9822513894','5083','shrikant.sankpal@sganalytics.com','shrikantsankpal@gmail.com','138, Mangalwar Peth, Opp Raj Auto',1,20,504,'Pune',411011,'138, Mangalwar Peth, Opp Raj Auto, Pune - 411011','0','CNNPS4165E','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(46,'542','EMP0000046',NULL,NULL,'Rahil',NULL,'Khan','1981-12-08','Male','7369','9822041473','5148','rahil.khan@sganalytics.com','findrahil@gmail.com','Victoria Mansions,7, Castellino Road',1,20,504,'Pune',411001,'Victoria Mansions, 7, Castellino Road, Pune - 411001','0','APKPK5346N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,6),(47,'546','EMP0000047',NULL,NULL,'Aditya',NULL,'Thard','1988-09-21','Male','5036','9503232902','7236','aditya.thard@sganalytics.com','aditya.thard@gmail.com','700 / C, Block P, New Alipore',1,36,1008,'Kolkata',700053,'Kumar Padmalaya, Flat no A3/2, Aundh, Near Medipoint Hospital, Pune - 411006','0','AGWPT5140Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,NULL),(48,'555','EMP0000048',NULL,NULL,'Chandraprakash',NULL,'Sharma','1988-08-30','Male','0','9673727597','0','chandraprakash.sharma@sganalytics.com','chandra.sharma14@yahoo.com','S.No 79/1 CTS 038, 10 Near Marathi School, Kalewadi',1,20,504,'Pune',411017,'S.No 79/1 CTS 038,10 Near Marathi School,Kalewadi,Pune','0','CIFPS1598N','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(49,'556','EMP0000049',NULL,NULL,'Amit',NULL,'Fartode','1988-11-16','Male','7261','9975708420','5061','amit.fartode@sganalytics.com','fartodeamit@gmail.com','26 Forest Colony, Yashoda Nagar',1,20,433,'Amravati',444602,'201 - B,Seetai Corner, Opposite DSK Toyota Showroom,Mumbai - Bangalore High way, Bavdhan, Pune - 411021','0','ABBPF8738L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(50,'557','EMP0000050',NULL,NULL,'Suchit',NULL,'Nasre','1986-08-21','Male','0','8600634098','0','suchit.nasre@sganalytics.com','suchitnasre@gmail.com','Raghunandan, 24/25Arya Nagar, Koradi Road, Behind Octroi Naka',1,20,488,'Nagpur',440030,'Flat no 105, Wing A, Goodwill Galaxy, Munjaba Wasti, Opposite RK Puram, Tingre Nagar, Pune','0','AHHPN1971D','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(51,'558','EMP0000051',NULL,NULL,'Karuna',NULL,'Ovhal','1985-05-03','Female','7327','8007346267','5116','karuna.ovhal@sganalytics.com','karuna.ovhal@gmail.com','43020, Pratik Nagar, Vishrantwadi, Yerwada',1,20,504,'Pune',411006,'10/12,Pratik Nagar,Vishrantwadi ,Yerwada,Pune-411006.','0','AAQPO6244G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:19','2017-08-04 03:41:19',NULL,NULL,NULL,NULL,1),(52,'563','EMP0000052',NULL,NULL,'Sneha',NULL,'Govindalwar','1989-02-28','Female','0','8055639054','0','sneha.govindalwar@sganalytics.com','snehagovindalwar@gmail.com','Chintamani Nagar-3, A-11/29, Bibwewadi',1,20,504,'Pune',411037,'Chintamani Nagar-3,A-11/29,Bibwewadi,Pune - 411037','0','ARMPG3954C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,1),(53,'566','EMP0000053',NULL,NULL,'Petra',NULL,'Brncalova','1987-03-08','Female','0','7030523632','0','petra.brncalova@sganalytics.com','p.brncalova@gmail.com','Hemmelrather Weg 269, 51377 Leverkusen',NULL,NULL,NULL,'NA',0,'A / F 11, Ganga Park Society, Pingle Vasti, Mundhwa Road, Pune','0','BYJPB4829C','NA','Unmarried',3,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(54,'570','EMP0000054',NULL,NULL,'Pavanprit',NULL,'Singh','1991-05-15','Male','7337','9975207413','5215','pavanprit.singh@sganalytics.com','pavanprit196@gmail.com','Gulzar Singh, House no 11, Village Malmohri, Naurangabad, Tatn Taran',1,27,623,'Amritsar',143401,'Harman House,Ranjeet Nagar,Yerwada, Pune - 411006','0','DSDPS7994K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,1),(55,'572','EMP0000055',NULL,NULL,'Priya',NULL,'Dikhale','1990-01-02','Female','0','9975112721','0','priya.dikhale@sganalytics.com','priya.020190@gmail.com','Shriram Nagar, Bldg - B4, Flat no 9, Aundh',1,20,504,'Pune',411007,'Shriram Nagar, Bldg - B4, Flat no 9, Aundh, Pune - 411007','0','BZEPD4523M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,1),(56,'574','EMP0000056',NULL,NULL,'Gaurav',NULL,'Sharma','1992-04-08','Male','0','9731139271','0','gaurav.sharma@sganalytics.com','gaurav8492@rediffmail.com','1st Floor, Sampat Building, Airport Road, Vijaynagar, Totu',1,13,252,'Shimla',171011,'701, B-3, Oxygen Valley, Near Ravi Garden, Pune-Solapur highway, Manjri BK, PUNE','0','CVWPS3620K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(57,'575','EMP0000057',NULL,NULL,'Srinivasan',NULL,'Venkatesan','1990-06-16','Male','7275','9920349342','5075','srinivasan.venkatesan@sganalytics.com','sri_v@live.com','RDP 1 / 35, Jaiganga CHS, Flat No. 16, Sector 2, Charkop, Kandivali West',1,20,486,'Mumbai',400067,'RDP 1 / 35, Jaiganga CHS, Flat no 16, Sector 2, Charkop, Kandivali West, Mumbai - 400067','0','CEKPS8900K','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,1),(58,'579','EMP0000058',NULL,NULL,'Moses',NULL,'Gaikwad','1986-07-19','Male','1040','8806064076','4001','moses.gaikwad@sganalytics.com','mosessoloman@gmail.com','Phayer Road, Opp Hutchings School, Bungalow No 10',1,20,504,'Pune',411040,'Phayer Road, Opp Hutchings School, Bungalow no 10, Pune - 411040','0','BKZPG9139E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(59,'582','EMP0000059',NULL,NULL,'Savita',NULL,'Kaintura','1982-12-03','Female','1038','9689865298','0','savita.kaintura@sganalytics.com','savita.kaintura@yahoo.com','B - 252, Prodyogiki Apartment, Plot No 11, Sector 03, Dwarka',1,9,135,'New Delhi',110078,'C - 28, Isher Apartment, Near Montvertvirt Prestine, Aundh Road, Khadki Station, Pune - 411020','0','ARRPK1789L','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(60,'593','EMP0000060',NULL,NULL,'Swarangi',NULL,'Pandey','1986-09-01','Female','1023','8237103048','0','swarangi.pandey@sganalytics.com','swarangipande@gmail.com','C2 - 301, Brahma Suncity, Wadgaonsheri',1,20,504,'Pune',411014,'C2 - 301, Brahma Suncity, Wadgaonsheri, Pune - 411014','0','BLSPP1053L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(61,'594','EMP0000061',NULL,NULL,'Satish',NULL,'Shinde','1983-11-24','Male','0','9594321689','0','satish.shinde@sganalytics.com','shinde123satish@gmail.com','Harshada Samartha Society, D/9, Pimple Saudagar',1,20,504,'Pune',411027,'Harshada Samartha Society, D/9, Pimple Saudagar, Pune - 411027','0','BMQPS7340A','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(62,'596','EMP0000062',NULL,NULL,'Pankaj',NULL,'Kumar','1988-11-07','Male','7239','8087600279','5039','pankaj.kumar@sganalytics.com','pankaj.bansal711@gmail.com','H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate',1,27,653,'Giddarbaha',152101,'H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate, Giddarbaha, Punjab - 152101','0','AUEPK1376P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(63,'597','EMP0000063',NULL,NULL,'Avinash',NULL,'Kumar','1988-10-17','Male','7350','9013034003','5136','avinash.kumar@sganalytics.com','akumar4731@gmail.com','S1, Navy Nagar, Naval Station Karanja',1,20,NULL,'Uran',400704,'S1, Navy Nagar, Naval Station Karanja, Uran, Raigadh, Maharashtra - 400704','0','BKPPK9950D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(64,'598','EMP0000064',NULL,NULL,'Pradnya',NULL,'Bathe','1985-02-02','Female','0','9421669922','0','pradnya.bathe@sganalytics.com','pradnya.bathe@gmail.com','RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar',1,20,504,'Pune',411028,'RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar, Pune - 411028','0','BBNPB4806L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,1),(65,'605','EMP0000065',NULL,NULL,'Narendra','Singh','Sidar','1986-02-05','Male','0','7276403856','0','narendra.singh@sganalytics.com','narendra.singh0856@gmail.com','Q. No.175/S/A, Balco Township',1,7,124,'Korba',495634,'Survey no 78/1, Sadguru Niwas, Samarth Nagar, Sai Chowk, navi Sanghvi, Pune - 27','0','FPRPS4688F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(66,'607','EMP0000066',NULL,NULL,'Arvind',NULL,'Kumar','1989-01-03','Male','0','9175116342','0','arvind.kumar@sganalytics.com','arvd.maa@gmail.com','H.no - 25',1,15,NULL,'Bagharayadih',833216,'Flat no 103, Mahalaxmi Complex, Vishal nagar, Pimple - Nilakh, Pune - 411025','0','CSOPK1998K','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(67,'608','EMP0000067',NULL,NULL,'Kamran',NULL,'Ahmad','1980-02-07','Male','0','9762579155','0','kamran.ahmad@sganalytics.com','kamran0780@gmail.com','H. No. 285/332/3, Sector - 3, Chakia',1,35,889,'Allahabad',211016,'Flat 31, B- II, Kamaldeep Gardens, Kondhwa Khurd, Pune - 411048','0','AKTPA5425E','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(68,'609','EMP0000068',NULL,NULL,'Anil',NULL,'Jadhav','1971-01-05','Male','7310','9420861630','5099','anil.jadhav@sganalytics.com','aneeljadhav14@gmail.com','Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi',1,20,504,'Pune',411037,'Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi, Pune - 411037','0','ANLPJ8471G','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(69,'617','EMP0000069',NULL,NULL,'Harshit',NULL,'Tiwari','1985-04-11','Male','0','9415258837','0','harshit.tiwari@sganalytics.com','harxit@gmail.com','D-109,Divya Nagar Colony, Near MMM Engg College',1,35,917,'Gorakhpur',273001,'C - 402, La Goriosa, Wadgaon Sheri, Pune - 411014','0','AJCPT7399G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:20','2017-08-04 03:41:20',NULL,NULL,NULL,NULL,NULL),(70,'620','EMP0000070',NULL,NULL,'Amit',NULL,'Bansal','1987-04-17','Male','0','9168246460','0','amit.bansal@sganalytics.com','bansalamit17@yahoo.com','53,Krishna Kunj, Mittal Colony, Khoda Ganeshji Road, Madanganj-kishangarh',1,29,668,'Ajmer',305801,'E-3, 504, Ganga Constella,Near Eon IT Park, Kharadi,Pune - 411014','0','AWGPB8561K','NA','Married ',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(71,'626','EMP0000071',NULL,NULL,'Jayesh',NULL,'Awaghade','1988-10-09','Male','7521','9096332262','0','jayesh.awaghade@sganalytics.com','jayesh.in09@gmail.com','Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road',1,20,504,'Daund',413801,'Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road,Daund, Pune - 413801','0','APSPA6177P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(72,'631','EMP0000072',NULL,NULL,'Priya',NULL,'Khemani','1989-01-16','Female','7279','9764004350','5078','priya.khemani@sganalytics.com','khemani.priya@gmail.com','B-129, Shivalik Colony, Near Malviya Nagar',1,9,135,'New Delhi',0,'E-7, 201 Ivy Apartments, Ivy Estate, Wagholi, Pune - 412207','0','AUCPK0151C','NA','Married ',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,1),(73,'638','EMP0000073',NULL,NULL,'Omkar',NULL,'Dhavale','1990-10-07','Male','0','9860200960','0','omkar.dhavale@sganalytics.com','omkardhavale7@gmail.com','9, Mangesh-Shree Apartment, 1464, Sadashiv Peth',1,20,504,'Pune',411030,'9, Mangesh-Shree Apartment, 1464, Sadashiv Peth, Pune - 411030','0','AKSPD8810F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(74,'641','EMP0000074',NULL,NULL,'Praveen',NULL,'Gaikwad','1983-06-06','Male','0','9823773324','0','praveen.gaikwad@sganalytics.com','praveen248@gmail.com','Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori, Near Muchmore Society',1,20,504,'Pune',411015,'Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori,Landmark:Near Muchmore Society, Pune - 411015','0','AJCPG8609C','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(75,'652','EMP0000075',NULL,NULL,'Pradeep','Kumar','Gupta','1990-07-20','Male','0','9246630625','0','pradeep.kumar@sganalytics.com','guptakpl@gmail.com','Day & Night Medical Complex Opp Forest Off Srikulam',1,2,56,'Srikakulam',532001,'Day & Night Medical Complex Opp Forest Off Srikulam - 532001','0','CNPPK8310K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(76,'659','EMP0000076',NULL,NULL,'Laxmikant',NULL,'Waghmare','1982-01-26','Male','7341','9867998594','5129','laxmikant.waghmare@sganalytics.com','laxmikant.waghmare@gmail.com','23, Pawanbhumi Layout, Somalwada Wardha Road',1,20,488,'Nagpur',440025,'Flat No-C-803, Etasha Building, S.NO 45/2A, Handewadi Road, Near Ganga Village, Hadapsar - Pune -411028','0','ABAPW7853L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(77,'661','EMP0000077',NULL,NULL,'Lokendra',NULL,'Bhati','1986-05-09','Male','7288','7836095979','5087','lokendra.bhati@sganalytics.com','calbhati@gmail.com','64/16, Pratap Nagar, Sangaver',1,29,689,'Jaipur',302033,'64/16, Pratap Nagar, Sangaver, Jaipur - 302033','0','ALOPB7215K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(78,'670','EMP0000078',NULL,NULL,'Apurv',NULL,'Singh','1989-07-06','Male','7247','9595517568','5047','apurv.singh@sganalytics.com','apurva6789@gmail.com','702, Amber, Nyati Empire, Kharadi',1,20,504,'Pune',411014,'702, Amber, Nyati Empire, Kharadi, Pune -411014','0','BWGPS2911F','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,3),(79,'671','EMP0000079',NULL,NULL,'Vinit',NULL,'Patil','1985-02-09','Male','7251','9890732009','5051','vinit.patil@sganalytics.com','vinit.vitthal.patil@gmail.com','5, Sudarshan Colony, South Vasant Nagar',1,20,509,'Sangli',416416,'904, E2, Solacia, Behind Mose College, Wagholi, Pune - 412207','0','ARIPP7619P','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,3),(80,'676','EMP0000080',NULL,NULL,'Ranjit',NULL,'Pawar','1985-09-02','Male','0','8879846692','0','ranjit.pawar@sganalytics.com','ranjitsingpawar@gmail.com','36, Netaji Subash Marg, Rambaug',1,23,564,'Indore',452004,'36, Netaji Subash Marg, Rambaug, Indore, M.P - 452004','0','BOCPP0288N','NA','Unmarried',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(81,'684','EMP0000081',NULL,NULL,'Biswajit',NULL,'Singh(WFH)','1967-11-20','Male','0','9356277025','0','biswajit.singh@sganalytics.com','bswjtsingh@gmail.com','178, New Defence Colony, S.A.S. Nagar',1,27,650,'Zirakpur',140603,'178, New Defence Colony,Zirakpur Dist, S.A.S. Nagar,Punjab ‐ 140603','0','ARXPS7679D','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(82,'696','EMP0000082',NULL,NULL,'Vijaya',NULL,'Rathod','1985-10-22','Female','0','9561588444','0','vijaya.rathod@sganalytics.com','vjraj22@gmail.com','c/o, R.N.Rathod, Rajapeth, Near Tapar Hostel',1,20,433,'Amravati',444606,'c/o, Subramanyam, Flat No 204 B-Wing, Royal Heights, Bhau Patil Road, Pune - 411020 ','0','AOJPR5526F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,2),(83,'701','EMP0000083',NULL,NULL,'Chaitanya',NULL,'Godbole','1989-02-04','Male','0','9702050257','0','chaitanya.godbole@sganalytics.com','chaitanyagodbole4@gmail.com','OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road',1,20,492,'Nashik',422013,'OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road, Nashik 422013','0','BCFPG7206Q','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,1),(84,'702','EMP0000084',NULL,NULL,'Isabell',NULL,'Jenninger','1990-11-22','Female','7272','9764373667','5072','isabell.jenninger@sganalytics.com','isabell.jenninger@gmail.com','Seestr,22 13353',NULL,NULL,NULL,'Berlin',0,'Seestr,22 13353 Berlin, Germany.','0','BBBPJ2598D','NA','Unmarried',NULL,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(85,'703','EMP0000085',NULL,NULL,'Amrit',NULL,'Sinha','1990-08-09','Male','0','9717544955','0','amrit.sinha@sganalytics.com','ammy.sinha@gmail.com','301 D, Arya Englave, Road No 15, Patel Nagar, Hatia',1,15,300,'Ranchi',834002,'301 D, Arya Englave, Road No 15, Patel Nagar, Hatia, Ranchi - 834002','0','DFIPS3188K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:21','2017-08-04 03:41:21',NULL,NULL,NULL,NULL,NULL),(86,'705','EMP0000086',NULL,NULL,'Mayur',NULL,'Hore','1983-12-06','Male','7318','9620933222','5107','mayur.hore@sganalytics.com','mayurhore@gmail.com','Shagun, Behind Asian Radio House, Opp Market Yard',1,20,509,'Sangli',416416,'Shagun, Behind Asian Radio House, Opp Market Yard, Sangli- 416416','0','ABZPH7447L','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(87,'706','EMP0000087',NULL,NULL,'Alwyn',NULL,'Shirodkar','1987-12-01','Male','0','9665809991','0','alwyn.shirodkar@sganalytics.com','design.allwyn@gmail.com','House No 1554, Malawadi, Mangaon',1,20,NULL,'Kudal',416519,'C/O Degaonkar Sanjay Gangadhar, S.No. 16/3/2, Flat No .B2-102, Shree Apt, Ambegaon Pathar, Pune - 411046','0','BRIPS7131L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(88,'710','EMP0000088',NULL,NULL,'Sambhaji','(Gopi)','Gaikwad','1988-06-12','Male','0','9552127539','0','NA','NA','Pandergaon',1,20,501,'Gangakhed',431714,'Sarve No 22/11, Thite Vasti, Kharadi, Pune-14','0','BGLPG7865H','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(89,'716','EMP0000089',NULL,NULL,'Ancy',NULL,'Johnson','1992-09-18','Female','0','9179762061','0','ancy.johnson@sganalytics.com','ncjohnson384@gmail.com','F - 19, Chinav Appartment, Harishankar Puram, Lashkar',1,23,562,'Gwalior',0,'F - 19, Chinav Appartment, Harishankar Puram, Lashkar, Gwalior, MP','0','ASJPJ0976F','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,1),(90,'729','EMP0000090',NULL,NULL,'Mangesh',NULL,'Dhage','1986-03-05','Male','0','8149010561','0','mangesh.dhage@sganalytics.com','mangeshdhage@gmail.com','AT Post: Sagoda',1,20,NULL,'Shegaon',444203,'C/o Eknath Sadhu Zurange SN 43 Pathare Thube Nagar Behind Balaji Hospital Kharadi - 411014','0','ANOPD2213M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(91,'742','EMP0000091',NULL,NULL,'Siddhartha',NULL,'Dongre','1986-09-17','Male','0','8983333940','0','siddhartha.dongre@sganalytics.com','siddhartha1321@gmail.com','Vishwanath Rajiv Nagar South, Plot No 24, S. No 203/2B, Vimannagar',1,20,504,'Pune',411014,'Vishwanath Rajiv Nagar South, Plot No 24, S.no 203/2B, Vimannagar, Pune - 411014','0','BACPD6306B','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(92,'748','EMP0000092',NULL,NULL,'Adneya',NULL,'Audhi','1989-12-01','Male','0','9922346278','0','adneya.audhi@sganalytics.com','adneya.audhi@yahoo.com','43 Kranti Society, Sahakar Nagar - 2',1,20,504,'Pune',411009,'43 Kranti Society, Sahakar Nagar - 2, Pune - 411009','0','ALLPA6763E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,1),(93,'750','EMP0000093',NULL,NULL,'Chetan',NULL,'Pulgam','1986-10-22','Male','5084','8308429280','7224','chetan.pulgam@sganalytics.com','cpulgam@gmail.com','1448 Daji Peth',1,20,517,'Solapur',413005,'1448 Daji Peth, Solapur - 413005','0','ALSPP1302P','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(94,'751','EMP0000094',NULL,NULL,'Chandra','Mohan','Reddy Gummireddy','1984-07-04','Male','0','9989244573','0','chandramohan.gummi@sganalytics.com','chandramohanreddy.g@gmail.com','F. No. 304, VSR Classic - B, Road No - 6, KTR Colony, Nizampet',1,2,737,'Hyderabad',500090,'F. No. 304, VSR Classic - B, Road no - 6, KTR Colony, Nizampet, Hyderabad - 500090','0','AMXPG5831E','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,1),(95,'759','EMP0000095',NULL,NULL,'Roshan',NULL,'Dhongade','1985-12-06','Male','5033','9096424248','7233','roshan.dhongade@sganalytics.com','roshan.dhongade8@gmail.com','Plot No 56, Adarash Nagar Ranala Colony, Kamptee',1,20,488,'Nagpur',0,'Flat No 101, Bwing spectrum Apartment, Bavdhan','0','ATJPD3237A','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(96,'761','EMP0000096',NULL,NULL,'Ashish',NULL,'Suwarnkar','1988-09-09','Male','5024','9421921091','7224','ashish.suwarnkar@sganalytics.com','suwarnkar.ashish@gmail.com','G-11, Vishwasagar City, Katpur Road',1,20,489,'Latur',413512,'c/o G.P Railkar Flat No 1, Bldg A-2, Khrishna Leela Terrace, Lane - 4 Mahatma Society, Kothrud - 411038','0','DMCPS9217J','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(97,'768','EMP0000097',NULL,NULL,'Steve',NULL,'Salvius','1988-03-04','Male','7271','9701431063','5071','steve.salvius@sganalytics.com','stevesalvius@gmail.com','310, Ajay Park, Najafgarh',1,20,135,'New Delhi',110043,'310, Ajay Park, Najafgarh, New Delhi - 110043','0','CLDPS3830E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(98,'786','EMP0000098',NULL,NULL,'Megha',NULL,'Sharma','1987-04-19','Female','7265','9545591133','5065','megha.sharma@sganalytics.com','meghasharmajain@gmail.com','2223, Sevda Bhawani, Above Shop No 376',1,29,689,'Jaipur',302001,'B-33 Mount N glory, Near Eon it Park, Kharadi, Pune ','0','FDVPS2342E','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,3),(99,'788','EMP0000099',NULL,NULL,'Aakash',NULL,'Singh','1990-11-21','Male','0','8237822534','0','aakash.singh@sganalytics.com','aakash21singh@gmail.com','B-127, D-1, Behind Petrol Pump',1,23,NULL,'Nepanagar',450221,'304, B9, Mangal Bhairav, Nandeo City, Pune -411041','0','DXJPS9947D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(100,'799','EMP0000100',NULL,NULL,'Vijay',NULL,'Baviskar','1985-08-04','Male','0','9764462436','0','vijay.baviskar@sganalytics.com','vjbaviskar@gmail.com','Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar',1,20,504,'Pune',411032,'Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar, Pune - 411032','0','ASJPB7504M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,NULL),(101,'801','EMP0000101',NULL,NULL,'Sagar',NULL,'Kamire','1980-10-10','Male','7250','8087594018','5050','sagar.kamire@sganalytics.com','kamiresagar@gmail.com','Dnyan Laxmi Appartment, Flat No 10, Rajarampuri 8th Lane',1,20,479,'Kolhapur',0,'Shree Laxmi Chaya Apppartment, Flat No 301, A Wing, Malwadi Hadapsar Pune.','0','AVDPK7092A','NA','Married ',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:22','2017-08-04 03:41:22',NULL,NULL,NULL,NULL,3),(102,'802','EMP0000102',NULL,NULL,'Amit',NULL,'Sangewar','1986-03-29','Male','0','9975133344','0','amit.sangewar@sganalytics.com','amitsangewar@rediffmail.com','Pimple Sadan F/1, Near PCMC School, Kasarwadi',1,20,504,'Pune',411034,'Pimple Sadan F/1, Near PCMC School, Kasarwadi Pune - 411034','0','BJRPS9075C','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,3),(103,'803','EMP0000103',NULL,NULL,'Safa',NULL,'Burney','1989-12-26','Female','7312','9960840994','5101','safa.burney@sganalytics.com','safaburney@gmail.com','A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar',1,20,504,'Pune',411013,'A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar, Pune - 411013','0','BKTPB8073Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(104,'806','EMP0000104',NULL,NULL,'Reena',NULL,'Sahu','1985-12-21','Female','7309','8928204300','0','reena.sahu@sganalytics.com','reena.sahu@gmail.com','OM Villa, D/O - Shri I.P.Sahu, Near Jai Public School, Hari Nagar, Katulboard',1,7,120,'Durg',491001,'Malhar Hostel, S.no 11, Rutuja Park, Karve Nagar, Pune - 411052','0','CEIPS1207M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(105,'809','EMP0000105',NULL,NULL,'Prerna',NULL,'Rawal','1991-01-08','Female','0','9922574319','0','prerna.rawal@sganalytics.com','prerna.r1@gmail.com','B1,101, Prasad Nagar, Wadgaon Sheri',1,20,504,'Pune',411014,'B1, 101, Prasad Nagar, Wadgaon Sheri, Pune - 411014','0','BYAPR1750D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(106,'811','EMP0000106',NULL,NULL,'Asad',NULL,'Qureshi','1987-06-28','Male','0','9975386368','0','asad.qureshi@sganalytics.com','asad.asad123@rediffmail.com','493, Kuresh Nagar, Near Ismail Building, Khadki',1,20,504,'Pune',411003,'493, Kuresh Nagar, Near IsmailBuilding, Khadki, Pune - 411003','0','AAIPQ2593E','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(107,'812','EMP0000107',NULL,NULL,'Mahendra',NULL,'Nikam','1986-12-02','Male','7374','9833452265','5152','mahendra.nikam@sganalytics.com','mahindra.nikam@gmail.com','80, Gurudatta Colony, A/P Tal Shirpur',1,20,458,'Dhule',425405,'C/O Nitin Nikam, 27/09, Pratik Society, Paud Road, Pune -  38','0','AKQPN1603G','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(108,'814','EMP0000108',NULL,NULL,'Bhargav',NULL,'Pandya','1991-05-03','Male','0','9673706401','0','bhargav.pandya@sganalytics.com','bhargav.pandya003@gmail.com','61, Shubham Row House, Near Saraswati School, Honey Park Road, Adajan',1,12,NULL,'Surat',395009,'Sr no 48/4, Flat no 303, Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri, Pune - 411014','0','BCWPP1537L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(109,'816','EMP0000109',NULL,NULL,'Jitendra',NULL,'Nikam','1983-05-31','Male','0','9769976005','0','jitendra.nikam@sganalytics.com','jpnikam@yahoo.com','25 - A, Arunoday Colony, Chopda',1,20,NULL,'Jalgaon',425107,'Lane no 4, House no 4, Madhuban Society, Old Sanghavi, Pune - 27','0','AGDPN3585G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(110,'817','EMP0000110',NULL,NULL,'Anas',NULL,'Patel','1989-03-14','Male','7241','9819402080','5041','anas.patel@sganalytics.com','anaspatel89@yahoo.com','22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104',1,20,486,'Mumbai',400008,'22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104, Mumbai - 400008','0','ARTPP7285J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(111,'825','EMP0000111',NULL,NULL,'Parminder',NULL,'Kaur','1969-08-31','Female','0','9921755899','0','parminder@sganalytics.com','parmindersimikaur@gmail.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AMJPK8117B','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,25,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(112,'827','EMP0000112',NULL,NULL,'Yogesh','Kr','Singh','1983-08-01','Male','7218','7387088388','5018','yogesh.singh@sganalytics.com','yksingh567@gmail.com','Vill & Post - Kanta, District - Chandavali',1,35,965,'Varanasi',0,'Vill & Post - Kanta, District - Chandavali, Varanasi - UP','0','BEKPS5421L','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(113,'830','EMP0000113',NULL,NULL,'Dhir',NULL,'Patwa','1990-10-25','Male','7317','9833884531','5106','dhir.patwa@sganalytics.com','patwa.dhir@gmail.com','E/13, Rishikesh CHS, Evershine Nagar, Malad West',1,20,486,'Mumbai',400064,'E/13, Rishikesh CHS, Evershine Nagar, Malad west, Mumbai - 400064','0','BOYPP4836C','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(114,'831','EMP0000114',NULL,NULL,'Tushar','Ranjan','Senapati','1982-06-02','Male','7244','9000543563','5044','tushar.senapati@sganalytics.com','tushar115@gmail.com','AT / PO - Kuha',1,26,613,'Bhubaneswar',751002,'AT / PO - Kuha, Dist - Khurda, Bhubaneswar - 751002','0','BXCPS8772H','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,1),(115,'832','EMP0000115',NULL,NULL,'Tushar',NULL,'Patil','1990-05-22','Male','0','8149605963','0','tushar.patil@sganalytics.com','tusharpatil.98@gmail.com','Flat no 404, Omkar Swaroop Society, Narayangaon, Junnar',1,20,504,'Pune',410504,'B - 19, C Building, kate Residency, Dapodi, Pune - 411012','0','BHYPP9525M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,1),(116,'833','EMP0000116',NULL,NULL,'Harshad',NULL,'Solanki','1991-10-04','Male','7259','8087463665','5059','harshad.solanki@sganalytics.com','harshads74@gmail.com','1680, R.S.Kedari Road, Camp',1,20,504,'Pune',411001,'1680, R.S.Kedari Road, Camp, Pune - 411001','0','EOVPS8725B','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,1),(117,'834','EMP0000117',NULL,NULL,'Jayesh',NULL,'Tare','1989-03-31','Male','7378','9981354260','5155','jayesh.tare@sganalytics.com','jayeshtr@yahoo.com','43-B, Vandana Nagar',1,23,564,'Indore',452001,'43-B, Vandana Nagar, Ext Indore, M.P 452001','0','AQHPT1083B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(118,'835','EMP0000118',NULL,NULL,'Srobon',NULL,'Banerjee','1987-04-06','Male','7287','9590827779','5086','srobon.banerjee@sganalytics.com','srobon@gmail.com','174/10, Netaji Subhas Chandra Bose Road, Kanak Apartment, Flat - A-4',1,36,1008,'Kolkata',700040,'A-104, ND, Ascent Apartment, Singasandra Aecs, Layout - A Block - Bangalore - 560068','0','ARBPB3810D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,NULL),(119,'839','EMP0000119',NULL,NULL,'Vipul',NULL,'Verma','1990-07-18','Male','7314','9867927653','5130','vipul.verma@sganalytics.com','vipulverma18@gmail.com','117/Q/169, Manoram Kunj, near Sardar Patel Public School, Sharda Nagar',1,35,925,'Kanpur',208025,'117/Q/169, Manoram Kunj, near Sardar Patel Public School,Sharda Nagar, Kanpur - 208025','0','AJLPV7155M','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:23','2017-08-04 03:41:23',NULL,NULL,NULL,NULL,3),(120,'841','EMP0000120',NULL,NULL,'Ramanath',NULL,'Mahindrakar','1989-05-05','Male','0','9421151705','0','ramanath.mahindrakar@sganalytics.com','mahindrakarpawan@gmail.com','Laxmi Niwas, Ward No. 4, H.No. 148/52, Durgabhat, Ponde',1,11,156,'Goa',403401,'Brahma Majestic, E-502, near Bakers point, NIBM road, Wanowrie, Pune - Maharashtra','0','BKYPM1873Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(121,'842','EMP0000121',NULL,NULL,'Khushboo',NULL,'Manka','1992-10-20','Female','0','9902524670','0','khushboo.manka@sganalytics.com','khushboomanka3@gmail.com','Bhawani distributors, main road, Jugsalai',1,15,297,'Jamshedpur',831000,'Bhawani distributors, main road, Jugsalai, Jamshedpur, Jharkhand - 831000','0','BYAPM6813N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(122,'843','EMP0000122',NULL,NULL,'Neha',NULL,'Sangtani','1991-05-21','Female','0','9901519909','0','neha.sangtani@sganalytics.com','neha.sangtani@gmail.com','Block NO.13, Kachnar Residency, Napier Town ',1,23,565,'Jabalpur',482001,'Block NO.13, Kachnar Residency, Napier Town , Jabalpur, Madhya Pradesh-482001','0','FPAPS9025B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(123,'844','EMP0000123',NULL,NULL,'Chiranjeevi',NULL,'Choudhary','1993-01-23','Male','0','8308680761','0','chiranjeevi.choudhary@sganalytics.com','chiranjeevi.2301@gmail.com','Rajendra Bhawan, Bose press gali, Puran chand lane, Kalyani chowk',1,5,105,'Muzaffarpur',0,'Rajendra Bhawan, Bose press gali, Puran chand lane,Kalyani chowk, Muzaffarpur, Bihar','0','AZCPC0794J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(124,'845','EMP0000124',NULL,NULL,'Milan',NULL,'Malkiya','1989-08-12','Male','0','9845931521','0','milan.malkiya@sganalytics.com','milanmalkiya07et858@gmail.com','14, Rupam society, Part - 3, Hirabaug, A.K Road',1,12,NULL,'Surat',395008,'14, Rupam society, Part - 3, hirabaug, A.K road, Surat, Gujarat, India - 395008','0','BCBPM7050G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(125,'846','EMP0000125',NULL,NULL,'Anup',NULL,'Kulkarni','1989-09-30','Male','7294','8600500335','5093','anup.kulkarni@sganalytics.com','k.anupkulkarni@gmail.com','Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad',1,20,504,'Pune',411033,'Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad, Pune- 411033','0','BXZPK2725F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(126,'847','EMP0000126',NULL,NULL,'Nivedita',NULL,'Snehi','1991-09-06','Female','0','9739469656','0','nivedita.snehi@sganalytics.com','niveditasnehi@gmail.com','#6/4, 2nd main, 4th cross, Govindnagar',1,17,NULL,'Bengaluru',560040,'#6/4, 2nd main, 4th cross, Govindnagar, Bangalore - 560040','0','EMSPS0469B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(127,'849','EMP0000127',NULL,NULL,'Mayur',NULL,'Deshmukh','1990-05-02','Male','0','7218369496','0','mayur.deshmukh@sganalytics.com','mayurdeshmukh6001@gmail.com','A-605, Elite Homes, Near Akshara International School, Tathwade',1,20,504,'Pune',411033,'A-605, Elite Homes, Near Akshara International School, Tathwade Pune - 411033','0','AVXPD6098D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(128,'852','EMP0000128',NULL,NULL,'Akshay',NULL,'Bhansali','1992-06-03','Male','0','9503629988','0','akshay.bhansali@sganalytics.com','akshaybhansali03@gmail.com','A-98, Satyapuram society, Saswad road, Phursungi',1,20,504,'Pune',412308,'A-98, Satyapuram society, Pune, Saswad road, Phursungi, Pune-412308','0','AZBPB2313F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(129,'854','EMP0000129',NULL,NULL,'Rupali',NULL,'Helambe','1989-07-05','Female','0','9987055182','0','rupali.helambe@sganalytics.com','rupali.helambe5@gmail.com','B/6, Vishaka Apt, Nandanvan Colony',1,20,255,'Aurangabad',0,'B/6, Vishaka Apt, Nandanvan Colony, Aurangabad','0','AFJPH2459A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(130,'856','EMP0000130',NULL,NULL,'Raunak',NULL,'Rathi','1989-07-14','Male','7356','8600273375','5115','raunak.rathi@sganalytics.com','raunakplc@gmail.com','Bus stand road',1,20,429,'Akot',0,'Flat No. 101 , Saptarshi Apartment, DSK Vishwa, Dhayari, Pune','0','BCPPR2284F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(131,'866','EMP0000131',NULL,NULL,'Pritam','Kumar','Sarkar','1988-04-15','Male','7313','9239030788','5102','pritam.sarkar@sganalytics.com','sarkar_pritam2007@yahoo.co.in','Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur',1,36,1008,'Kolkata',700127,'Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur, Kolkata - 700127','0','BLUPS3158K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,3),(132,'872','EMP0000132',NULL,NULL,'Shanu',NULL,'Dhamija','1989-10-30','Male','0','7755901560','0','shanu.dhamija@sganalytics.com','dhamija_shanu@yahoo.com','H.No.- 569, Adarsh Colony, Samadhi road',1,27,645,'Khanna',141401,'H.No.- 569, Adarsh Colony, Samadhi road, Khanna - 141401 (PB)','0','ARXPD0174A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(133,'875','EMP0000133',NULL,NULL,'Pavan','Kumar','Yadav','1992-07-09','Male','0','7045566357','0','pavan.yadav@sganalytics.com','pavank721.ind@gmail.com','40AA/259 Sainik Nagar, Rajpur Chungi',1,35,886,'Agra',282001,'40AA/259 Sainik Nagar, Rajpur Chungi, Agra - 282001','0','ALMPY9011A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(134,'883','EMP0000134',NULL,NULL,'Sameer',NULL,'Inamdar','1989-12-03','Male','0','9921850311','0','sameer.inamdar@sganalytics.com','inamdar.sam17@gmail.com','At Post BIBI, Darphal Tal, North Solapur Dist',1,20,517,'Solapur',413222,'Sr No 14, Shankar Maharaj Vasahat, Chavan nagar, Dhankwadi, Pune - 43','0','ABZPI4316F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(135,'891','EMP0000135',NULL,NULL,'Ritu',NULL,'Singh','1987-08-30','Female','0','7743819118','0','ritu.singh@sganalytics.com','ritu.singh@siib.ac.in','32- Kabir envclave Dayalbagh',1,35,886,'Agra',282005,'32- Kabir envclave Dayalbagh, Agra - 282005, UP','0','CERPS9466R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(136,'892','EMP0000136',NULL,NULL,'Nikita',NULL,'Madan','1992-02-25','Female','7292','7743819116','5091','nikita.madan@sganalytics.com','nikita.madan@siib.ac.in','1404, Sector A, Pocket B and C, Vasant Kunj',1,9,135,'New Delhi',110070,'1404, Sector A, Pocket B and C, Vasant Kunj, New Delhi - 110070','0','BIDPM4258A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,NULL),(137,'895','EMP0000137',NULL,NULL,'Prachi',NULL,'Gandhi','1991-03-29','Female','0','9028796816','0','prachi.gandhi@sganalytics.com','prachigandhi29@gmail.com','A 1/2, Agrasen Society, 8 Koregaon Park',1,20,504,'Pune',411001,'A 1/2, Agrasen Society, 8 Koregaon Park, Pune - 411001','0','AYYPG9090L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:24','2017-08-04 03:41:24',NULL,NULL,NULL,NULL,1),(138,'897','EMP0000138',NULL,NULL,'Radhika',NULL,'Khetan','1991-10-08','Female','0','9405429151','0','radhika.khetan@sganalytics.com','radhikakhetan812@gmail.com','Near Z.P. School, At. Po. Thiloni Ta. Duryapoor',1,20,433,'Amravati',0,'Rakshaknagar phase 2, o/p durgamandir between Radison hotel &Kharadi bypass, Kharadi','0','CKRPK7573B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(139,'901','EMP0000139',NULL,NULL,'Vicky',NULL,'Vidre','1991-05-17','Male','0','8903373711','0','vicky.vidre@sganalytics.com','v.vidre@itm.edu','F11/11 Durga Colony, Vikram Nagar Khor',1,23,NULL,'Neemuch',451470,'F11/11 Durga Colony, Vikram Nagar Khor, Neemuuh, MP - 451470','0','ALXPV7479G','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(140,'902','EMP0000140',NULL,NULL,'Vipul',NULL,'Babbar','1990-06-13','Male','0','9828482572','0','vipul.babbar@sganalytics.com','vipul.excellere@gmail.com','E-42, Ram Nagar Extension, Sodala',1,29,689,'Jaipur',302006,'E-42, Ram Nagar Extension, Sodala, Jaipur 302006','0','ARRPB0444P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,7),(141,'904','EMP0000141',NULL,NULL,'Shweta',NULL,'Gogawale','1987-12-03','Female','0','9766656645','0','shweta.gogawale@sganalytics.com','shwetagogawale@gmail.com','Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri',1,20,504,'Pune',411014,'Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri, Pune - 411014','0','ARYPG6943R','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,2),(142,'909','EMP0000142',NULL,NULL,'P.T. Satya',NULL,'Kishore','1984-08-12','Male','7281','9618436234','5080','satya.pt@sganalytics.com','ptskishore2012@gmail.com','P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla',1,2,NULL,'Indepalligudem',0,'P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla, Indepalligudem, West Godavari (Dist) Andhra Pradesh','0','CZCPS0472F','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(143,'913','EMP0000143',NULL,NULL,'Amit',NULL,'Kathar','1991-10-24','Male','0','9637537515','0','amit.kathar@sganalytics.com','amitkathar24@gmail.com','Rajdurg 3 Mayadevi nagar, Mahabal Road',1,20,NULL,'Jalgaon',425001,'Pritam residency, near Anaod park bus stop, Wadgaon sheri, Pune','0','DUCPK5384N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(144,'915','EMP0000144',NULL,NULL,'Ramesh','Babu','Kopparthi','1988-08-18','Male','0','9702483177','0','ramesh.kopparthi@sganalytics.com','kramesh.finance@gmail.com','D.no: 27-3-71, Nethaji street, Srirampuram',1,2,NULL,'Bhimavaram',534202,'D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2, Andhra Pradesh - 534202','0','CBUPK9760N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(145,'916','EMP0000145',NULL,NULL,'Vijish','Haridasan','Kottarapat','1989-05-23','Male','0','8097178190','0','vijish.kottarapat@sganalytics.com','vijishkh@gmail.com','204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)',1,20,486,'Mumbai',0,'204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)','0','AXGPK9131M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(146,'917','EMP0000146',NULL,NULL,'Samiya',NULL,'Ayaz','1993-11-20','Female','0','7350408883','0','samiya.ayaz@sganalytics.com','samiya_siddiqui@hotmail.com','F- 603, Shefalika Heights, Near Kinara Hotel, Shivtrinagar, Kothrud',1,20,504,'Pune',411038,'F- 603, Shefalika Heights, near Kinara Hotel, Shivtrinagar, Kothrud, Pune, Maharashtra - 411038','0','BBIPA4160P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(147,'918','EMP0000147',NULL,NULL,'Soumya','Prakash','Jena','1993-11-03','Male','0','8087023571','0','soumya.jena@sganalytics.com','sjena44@gmail.com','PWD/LA/55, Industrial Estate',1,26,NULL,'Rourkela',0,'Flat No 11, f wing, Wanjale patil Heritage, Kondhwa dhawade, NDA Road, Pune','0','AXEPJ1959N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,1),(148,'924','EMP0000148',NULL,NULL,'Sourabh',NULL,'Kulkarni','1985-04-21','Male','0','9823990793','0','sourabh.kulkarni@sganalytics.com','sourabh_kul21@yahoo.co.in','E - 6, Rounak Residency, Mayur Colony, Kothrud',1,20,504,'Pune',411038,'E - 6, Rounak Residency, Mayur colony, Kothrud, Pune - 38','0','BHRPK4752L','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,NULL),(149,'925','EMP0000149',NULL,NULL,'Farheen',NULL,'Rahman','1992-06-20','Female','0','9939671927','0','farheen.rahman@sganalytics.com','farheenrahman2008@gmail.com','H. No - A11, Fazal Manzil, New Tiwari Tankroad',1,15,300,'Ranchi',0,'Flat No 16, Building No - 9, Laxmi Narayan nagar society, Opp. Mukherjee udyan, Erandvana, Pune','0','BYAPR7860J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,NULL),(150,'929','EMP0000150',NULL,NULL,'Sunil',NULL,'Dhake','1988-05-10','Male','0','7028263881','0','sunil.dhake@sganalytics.com','dhakesid@gmail.com','Flat No. 18, Prabhu Square, Deepali Nagar, Mumbai Naka',1,20,492,'Nashik',0,'Flat No. 18, Prabhu square, Deepali Nagar, Mumbai Naka, Nashik','0','AKIPD7844B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,3),(151,'931','EMP0000151',NULL,NULL,'Rishabh',NULL,'Nigam','1988-11-15','Male','1006','8793375243','0','rishabh.nigam@sganalytics.com','rishabh.nigam1511@gmail.com','Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad',1,20,504,'Pune',411041,'Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad - 411041','0','AJLPN3876H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,NULL),(152,'933','EMP0000152',NULL,NULL,'Naim',NULL,'Mahipal','1992-06-16','Male','0','9716640166','0','naim.mahipal@sganalytics.com','naimmahipal2012@gmail.com','Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi',1,14,262,'Fatehabad',125053,'Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi, Fatehabad, Harayana - 125053','0','CQBPM2850F','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,2),(153,'936','EMP0000153',NULL,NULL,'Susshruth',NULL,'Apshankar','1971-05-28','Male','7373','8380073727','5167','susshruth.apshankar@sganalytics.com','sapshankar@hotmail.com','303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park',1,20,504,'Pune',411001,'303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park, Pune - 411001','0','AKWPA0122F','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,25,NULL,1,'2017-08-04 03:41:25','2017-08-04 03:41:25',NULL,NULL,NULL,NULL,NULL),(154,'940','EMP0000154',NULL,NULL,'Sneha',NULL,'Deshpande','1988-10-29','Female','0','9822593350','0','sneha.deshpande@sganalytics.com','sneha.a.deshpande@gmail.com','#41, Sunflower Building, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'#41, Sunflower Building, Neco Garden, Viman Nagar, Pune- 411014','0','AOIPD5779B','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(155,'943','EMP0000155',NULL,NULL,'Shakshi',NULL,'Yadav','1991-09-23','Female','0','9845305050','0','shakshi.yadav@sganalytics.com','sakshiyadav23@gmail.com','H/O Sundarkali Yadav, Near Samzhana Hotel',NULL,NULL,NULL,'Birgunj',44301,'BT Kawade Road, Suchandra corner, B-18, Pune','0','AMHPY6293L','NA','Unmarried',3,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,3),(156,'945','EMP0000156',NULL,NULL,'Tripti','Rastogi','Vishnoi','1986-06-19','Female','0','9582218398','0','tripti.vishnoi@sganalytics.com','tripti.rastogi1@gmail.com','C - 79, Nirala Nagar',1,35,935,'Lucknow',226020,'A-205, Nandan Euphora, Near Kumar Samrudhi Housing Society, Vishrantwadi, Pune - 411015','0','AMPPR6894L','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(157,'948','EMP0000157',NULL,NULL,'Ankit',NULL,'Kapila','1991-12-14','Male','7210','9560018039','5010','ankit.kapila@sganalytics.com','akapila01@gmail.com','B4, Lane 3, Sector - 1, New Shimla',1,27,252,'Shimla',171009,'B4, Lane 3, Sector - 1, New Shimla, Shimla - 171009','0','CGNPK8074M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(158,'952','EMP0000158',NULL,NULL,'Salman',NULL,'Khan','1990-12-31','Male','0','8291374292','0','salman.khan@sganalytics.com','samkhan44@yahoo.com','Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west',1,20,486,'Mumbai',400086,'Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west, Mumbai - 400086','0','BEFPK9131N','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,1),(159,'964','EMP0000159',NULL,NULL,'Dharit',NULL,'Chokshi','1991-10-13','Male','0','9945313311','0','dharit.chokshi@sganalytics.com','dharit99@gmail.com','10, Vasupujya Flats, Amul Society, New Sharda Mandir road, Sukhipura, Paldi',1,12,NULL,'Ahemdabad',380007,'10, Vasupujya flats, amul society, New Sharda Mandir road, Sukhipura, Paldi - Ahemdabad 380007','0','NA','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(160,'966','EMP0000160',NULL,NULL,'Chandan',NULL,'Kishore','1987-08-07','Male','0','9958767736','0','chandan.kishore@sganalytics.com','chandankishore1987@yahoo.com','HNO. 63A, Street No. 5, Deepak Vihar, Najafgarh',1,9,135,'New Delhi',110043,'HNO. 63A, Street No. 5, Deepak Vihar,Najafgarh, New Delhi - 110043','0','CIPPK5347D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(161,'967','EMP0000161',NULL,NULL,'Manas','Kumar','Raul','1983-06-05','Male','7225','9890296764','5025','manas.raul@sganalytics.com','manas123raul@yahoo.co.in','LIG 12, S.P.A Colony Chudcos, Bagdhiya, Baripada',1,26,NULL,'Takatpur',757003,'Flat C - 401, Krishna Residency, SUS - Pashan Road , Sai Chowk, Pashan,Pune = 411021','0','ALCPR5933L','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,8),(162,'968','EMP0000162',NULL,NULL,'Nishant',NULL,'Narad','1989-11-01','Male','0','9021310965','0','nishant.narad@sganalytics.com','nishi61755@yahoo.com','Walni, Th - Saoner',1,20,488,'Nagpur',0,'Yash Society, B - Wing, 35#, Behind CNG Pump, Paud Road, Kothrud, Pune','0','AQAPN5796J','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,21,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,NULL),(163,'972','EMP0000163',NULL,NULL,'Sunil','Kumar','Parimi','1985-07-13','Male','7282','9703596999','5081','sunil.parimi@sganalytics.com','sunilkumar_nani@gmail.com','Pedamuthevi (post)',1,2,NULL,'Movva',521136,'Pedamuthevi (post), Movva (MD), Krishna (DT), Pin - 521136','0','BDDPP8794H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,1),(164,'973','EMP0000164',NULL,NULL,'Prasad',NULL,'Jagtap','1989-01-27','Male','7359','7276890909','0','prasad.jagtap@sganalytics.com','jagtap.prasad@outlook.com','55 / 66, Shiv colony',1,20,NULL,'Jalgaon',425001,'B- 905, Umag Premiere, Ivy Estate, Wagholi, Pune - 410227','0','AMGPJ0531P','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:26','2017-08-04 03:41:26',NULL,NULL,NULL,NULL,8),(165,'977','EMP0000165',NULL,NULL,'Apurv',NULL,'Mahajan','1990-01-11','Male','0','8793845745','0','apurva.mahajan@sganalytics.com','apurvmahajan1@gmail.com','Plot No. 189, Flat No. 10, Anant Apt, Jyoti Nagar',1,20,255,'Aurangabad',0,'B- 501, Swaminarayan Apt, Near Suncity, Off Sinhgad road, Vadgaon, Pune - 411041','0','BNWPM5837M','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,1),(166,'978','EMP0000166',NULL,NULL,'Ashish',NULL,'Dongre','1988-01-30','Male','0','8087673282','0','ashish.dongre@sganalytics.com','ashish.dongre88@gmail.com','Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar',1,20,504,'Pune',411028,'Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar, Pune - 411028','0','BEDPD1656R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(167,'979','EMP0000167',NULL,NULL,'Deep',NULL,'Gada','1991-12-16','Male','0','9824207676','0','deep.gada@sganalytics.com','deepgada05@gmail.com','301, Avadhpuri Apt, 80 feet road',1,12,NULL,'Veraval',362266,'301, Avadhpuri Apt, 80 feet road, Veraval - 362266','0','AYIPG3156D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(168,'980','EMP0000168',NULL,NULL,'Kaustubh',NULL,'Joshi','1990-09-11','Male','0','8149966205','0','kaustubh.joshi@sganalytics.com','kautubhjoshi45@gmail.com','Taranjan Bunglow, Abhinavnagar',1,20,428,'Sangamner',422605,'Flat No. 14, Pushpa Apt, Vanaz corner, Kothrud, Pune - 411038','0','ANPPJ5041G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,1),(169,'981','EMP0000169',NULL,NULL,'Mitisha',NULL,'Gupta','1990-04-06','Female','0','9993554500','0','mitisha.gupta@sganalytics.com','mitisha_g@yahoo.com','121, Pandrinath Path Ada Bazar',1,23,564,'Indore',452004,'121, Pandrinath path Ada Bazar, Indore ( M.P.)- 452004','0','AQEPG153Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(170,'982','EMP0000170',NULL,NULL,'Prinkesh','Kumar','Giri','1991-10-27','Male','0','7276496585','0','prinkesh.giri@sganalytics.com','prinkeshgiri@gmail.com','E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Arera Colony',1,23,550,'Bhopal',0,'E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Areracolony Bhopal (MP)','0','BCUPG1337B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(171,'983','EMP0000171',NULL,NULL,'Radhika',NULL,'Bajaj','1993-12-19','Female','0','9960509806','0','radhika.bajaj@sganalytics.com','i.radhika.bajaj@gmail.com','589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury Park',1,20,504,'Pune',411037,'589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury park, Pune - 37','0','BMJPB2481E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,1),(172,'984','EMP0000172',NULL,NULL,'Sakshi',NULL,'Aggarwal','1990-01-16','Female','0','9958916781','0','sakshi.aggarwal@sganalytics.com','aggarwal.sakshi@gmail.com','B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9',1,9,135,'Delhi',110075,'B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9, Delhi - 110075','0','AQXPA4523D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,1),(173,'987','EMP0000173',NULL,NULL,'Shantanu',NULL,'Jana','1988-06-25','Male','0','9434432791','0','shantanu.jana@sganalytics.com','shantanu.jana14@gmail.com','Roypara road govt housing estate, Block - I, Flat No. 5',1,36,1008,'Kolkata',700050,'Roypara road govt housing estate, Block - I, Flat No. 5, Kolkata - 700050','0','AOLPJ9106R','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,2),(174,'989','EMP0000174',NULL,NULL,'Manoj',NULL,'Dhiware','1986-01-12','Male','7551','9096049888','0','manoj.dhiware@sganalytics.com','MNJdhiware@gmail.com','Plot no . 93/94, \'Siddhi\' Niwas, Nivara Nagari, Behind Dongre Hospital, Ldgaon Road',1,20,255,'Vaijapur',423701,'SR No. 253/2/3A/2, Bunglow No. 3, near Kumar Bakery, officers mess, Lohegaon Road, Khere Park, Pune - 411032','0','AYUPD9261C','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(175,'991','EMP0000175',NULL,NULL,'Sumit',NULL,'Lakhina','1989-06-05','Male','0','9971692020','0','sumit.lakhina@sganalytics.com','sumit.tuff@gmail.com','90/25 A, 1st Floor Malviya Nagar',1,9,135,'New Delhi',0,'90/25 A, 1st Floor Malviya Nagar, New Delhi','0','EDWPS5924L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,NULL),(176,'996','EMP0000176',NULL,NULL,'Ganesh',NULL,'Konar','1991-09-12','Male','7319','9768590273','5108','ganesh.konar@sganalytics.com','ganeshkonar18@gmail.com','9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate, Thane',1,20,520,'Thane',400604,'9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate , Thane -n 400604','0','BIKPK9855J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:27','2017-08-04 03:41:27',NULL,NULL,NULL,NULL,1),(177,'1001','EMP0000177',NULL,NULL,'Mitesh',NULL,'Oswal','1983-10-31','Male','0','8698619998','0','mitesh.oswal@sganalytics.com','oswal.mitesh@gmail.com','B- 502/ Eisha Pearl, Kondhwa BK',1,20,504,'Pune',411048,'B- 502/ Eisha Pearl, Kondhwa BK, Pune - 48','0','AAIPO8158K','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(178,'1002','EMP0000178',NULL,NULL,'Ruchi',NULL,'Srivastava','1991-05-23','Female','0','9765453933','0','ruchi.srivastava@sganalytics.com','ruchi.m44@gmail.com','10/517, Khalasi Line',1,35,925,'Kanpur',208001,'Flat - E, 904, Splendour County, Behind Wageshwar Termple, Wagholi, Loh Road, Pune','0','DJKPS8929G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,3),(179,'1003','EMP0000179',NULL,NULL,'Jitesh',NULL,'Rane','1990-04-18','Male','7339','9930735980','5127','jitesh.rane@sganalytics.com','jitesh.rane@hotmail.com','803, 1A Wing, 8th Floor, Swadeshi Mhada Complex, Chunabhatti East Sion',1,20,486,'Mumbai',400022,'803, 1A Wing, 8th Floor,Swadeshi Mhada Complex,Chunabhatti East Sion,Mumbai – 400022','0','AQWPR7839Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,3),(180,'1010','EMP0000180',NULL,NULL,'Pooja',NULL,'Pingale','1993-02-11','Female','1037','9421605512','0','pooja.pingale@sganalytics.com','poojapingale11@gmail.com','Dr. Hedgewar colony, B6, Brahmin Ali',1,20,506,'Khed',0,'B-11,shivsagar co -op Hsg soc. Phase 1, Mauikloaug, Singhad Road, Pune','0','CHHPP3066R','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(181,'1015','EMP0000181',NULL,NULL,'Nayan',NULL,'Rijhwani','1990-03-18','Female','0','9823018644','0','nayan.rijhwani@sganalytics.com','nayanrijhwani26@gmail.com','25, Shukla colony, Veer villa',1,23,573,'Mandsaur',0,'RH - 6, Pillar homes, Viman Nagar, Near Kidzee school, Pune - 411014','0','BJCPR6317K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(182,'1016','EMP0000182',NULL,NULL,'Vasudha',NULL,'Arora','1992-02-13','Female','0','9711412088','0','vasudha.arora@sganalytics.com','vsdha.arora@gmail.com','127, Bank Enclave, Laxmi Nagar',1,9,135,'Delhi',110092,'202, Emperor 1, Supertech Emrald Court, Sector - 93A, Noida - 201301, UP','0','NA','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(183,'1018','EMP0000183',NULL,NULL,'Ammaar',NULL,'Shaikh','1988-11-03','Male','7275','9545093038','5075','ammaar.shaikh@sganalytics.com','ammaar_skl@hotmail.com','815 / 16, Bhawani peth opp ICC, Cable office',1,20,504,'Pune',411042,'Plot No. 5 A, Harmony Society Near gangadhan chowk Pune 411037','0','BRDPS7831L','NA','Married',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,1),(184,'1021','EMP0000184',NULL,NULL,'Shraddha',NULL,'Patel','1986-07-04','Female','1057','8888833674','0','shraddha.patel@sganalytics.com','shraddha.patel86@gmail.com','E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal',1,20,504,'Pune',411028,'E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal, Pune 411028','0','BHSPP8501R','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(185,'1023','EMP0000185',NULL,NULL,'Rohit',NULL,'Kalghatgi','1980-05-28','Male','7539','9370013454','0','rohit.kalghatgi@sganalytics.com','rkalghatgi@gmail.com','A -9,403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud',1,20,504,'Pune',411038,'A -9, 403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud, Pune - 411038','0','AQAPK4267H','NA','Divorced',1,5,1,NULL,'NA','NA','Active',185,NULL,1,1,22,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:45:55',NULL,NULL,NULL,NULL,NULL),(186,'1024','EMP0000186',NULL,NULL,'Narasimha','Achryulu','PTC','1986-07-30','Male','0','9966977477','0','narasimha.tirumala@sganalytics.com','narasimha.palvancha@gmail.com','H.No. 20 - 120 / G-2, Aiswarya Enclave, Dayanand Nagar, Malkajgiri',1,2,737,'Hyderabad',500047,'H.No. 20 - 120 / G-2, Aiswarya Enclave,Dayanand Nagar,Malkajgiri,Hyderabad - 500047','0','ALCPN8063H','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,1),(187,'1025','EMP0000187',NULL,NULL,'Dhankirti',NULL,'Parmar','1989-10-23','Female','7213','9177587666','5013','dhankirti.parmar@sganalytics.com','dhankirtiparmar@yahoo.in','T - 186, Pratap Nagar, INS Shivaji',1,20,504,'Lonavala',410402,'Block S - 204, Madhuvanti, Nanded City, Sinhagad Road, Pune - 411041','0','BZAPP7583B','NA','Unmarried',6,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(188,'1033','EMP0000188',NULL,NULL,'Amit',NULL,'Yerawar','1985-02-01','Male','0','9975028932','0','amit.yerawar@sganalytics.com','amit.yerawar@gmail.com','Near A.C.S. College, Sumitra Nagar, Tukum',1,20,448,'Chandrapur',442401,'Flat No 2, Venkatesh terrace, Near Columbia Asia Hospital, Sainath Nagar Square, Kharadi, Pune-411015     ','0','ACVPY2211L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(189,'1034','EMP0000189',NULL,NULL,'Hitanshu',NULL,'Dhingra','1985-05-26','Male','7380','9582947006','5016','hitanshu.dhingra@sganalytics.com','hitanshu.dhingra@gmail.com','43006, Gali No. 10, Rampur Road',1,34,NULL,'Haldwani',263139,'9/28, Gali No. 10, Rampur Road, Haldwani, Uttarakhand - 263139','0','ATWPD7637D','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(190,'1036','EMP0000190',NULL,NULL,'Paresh',NULL,'Panchal','1989-12-29','Male','0','7760888005','0','paresh.panchal@sganalytics.com','pareshp.iimc13@gmail.com','42739, Shivaji Nagar, RHB Colony',1,29,NULL,'Dungarpur',314001,'1/4, Shivaji Nagar, RHB Colony, Dungarpur, Rajasthan - 314001','0','BFTPP6032C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,7),(191,'1038','EMP0000191',NULL,NULL,'Shweta',NULL,'Navarkar','1987-01-23','Female','0','9892942500','0','shweta.navarkar@sganalytics.com','shweta2301@gmail.com','Neeltej Nagar, B - 17, Rambaug Lane - 4, Kalyan West',1,20,486,'Mumbai',421301,'Sunflower - 604, Park Springs Society, Porwal Road, Near Dhanori Jakat Naka, Lohegaon, Pune - 411032','0','AHWPN6238N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(192,'1040','EMP0000192',NULL,NULL,'Pranav',NULL,'Lohokare','1993-04-10','Male','0','9986555967','0','pranav.lohokare@sganalytics.com','pranavlohokare@gmail.com','Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi',1,20,504,'Pune',411043,'Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi , Pune 411 043','0','AJEPL8791N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(193,'1042','EMP0000193',NULL,NULL,'Avilin',NULL,'Mandal','1993-06-06','Male','0','9830975054','0','avilin.mandal@sganalytics.com','avilin060693@gmail.com','301, Prince Anwar Shah Road',1,36,1008,'Kolkata',700045,'301, Prince Anwar Shah Road , Kolkatta - 700045','0','BVZPM9152N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(194,'1046','EMP0000194',NULL,NULL,'Sabyasachi','Guha','Raja','1980-07-13','Male','7248','9899697608','5048','sabyasachi.guha@sganalytics.com','sabyasachigr@gmail.com','House No 33 , Rajpur Khurd Extension, P.O. IGNOU',1,9,135,'New Delhi',110068,'House No 33 , Rajpur Khurd Extension, P.O. IGNOU, New Delhi 110068','0','AJCPG5778N','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:28','2017-08-04 03:41:28',NULL,NULL,NULL,NULL,NULL),(195,'1050','EMP0000195',NULL,NULL,'Rakesh',NULL,'Hasurkar','1988-01-28','Male','5031','9764404067','7231','rakesh.hasurkar@sganalytics.com','hasurkar28@gmail.com','Sr. No . 27/B, Munjaba Vasti, Dhanori',1,20,504,'Pune',411015,'Sr. No . 27/B, Munjaba Vasti, Dhanori, Pune 15','0','AHIPH8897B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(196,'1053','EMP0000196',NULL,NULL,'Kalyani',NULL,'Bhende','1990-05-26','Female','7506','9503764581','0','kalyani.bhende@sganalytics.com','kalyani.bhende26@gmail.com','50, Rani Bhoslae Vihar, Opp C P Berar College, Tulsibaug',1,20,488,'Nagpur',0,'201 , \'B\' Wing , Karan Rhea Apartment, Sainath nagar, Vadgaonsheri , Pune','0','CDPPB2021Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(197,'1054','EMP0000197',NULL,NULL,'Seema',NULL,'Gurung','1988-09-28','Female','7202','8390146987','5002','seema.gurung@sganalytics.com ','seemagurung88@gmail.com','Youngtong Division, Sasing Matelte',1,36,997,'Jalpaiguri',0,'Star Gaze society, E-203, Dhanori-15, Pune','0','AWBPG0069Q','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(198,'1061','EMP0000198',NULL,NULL,'Rakesh',NULL,'Kakani','1984-10-31','Male','7513','9739068282','0','rakesh.kakani@sganalytics.com','rakeshkakani@gmail.com','53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa Nagar, Nikol Gam Road',1,12,170,'Ahmedabad',382350,'53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa nagar, Nikol Gam Road, Ahmedabad - 382 350','0','ATHPK3885H','NA','Married',8,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(199,'1062','EMP0000199',NULL,NULL,'Rameez',NULL,'Shaikh','1990-02-26','Male','7228','9673959463','5028','rameez.shaikh@sganalytics.com','rameez_shaikh22@yahoo.com','S. No. 48, Sai baba Nagar, Lane No - 5, Behind valley view school, Kondhwa Khurd',1,20,504,'Pune',411048,'S. No. 48, Sai baba Nagar, Lane No - 5,  Behind valley view school, Kondhwa Khurd, Pune 411 048','0','ESRPS1013J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(200,'1067','EMP0000200',NULL,NULL,'Ritwik',NULL,'Dey','1985-03-17','Male','7229','9923370908','5029','ritwik.dey@sganalytics.com','ritwik.s.dey@gmail.com','308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan',1,20,504,'Pune',411021,'308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan, Pune 411 021','0','AIWPD5401A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(201,'1069','EMP0000201',NULL,NULL,'Paridhi',NULL,'Agarwal','1986-10-29','Female','1002','8600017299','0','paridhi.agarwal@sganalytics.com','paridhi.agarwal2910@gmail.com','Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy',1,20,504,'Pune',411014,'Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy, Pune -411014','0','ALZPA4632N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(202,'1070','EMP0000202',NULL,NULL,'Rahul',NULL,'Chakraborti','1986-01-15','Male','1005','9724199690','7565','rahul.chakraborti@sganalytics.com','rahulchakraborti0@gmail.com','45/1, New Tollygunge, P.O  Purba Dutiary',1,36,1008,'Kolkata',700093,'45/1, New Tollygunge, P.O  Purba Dutiary, Kolkata 700093','0','AJAPC1468R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(203,'1071','EMP0000203',NULL,NULL,'Gopi','Chand','Mannem','1985-03-04','Male','0','9052220181','0','gopichand.mannem@sganalytics.com','mannemchand1@gmail.com','H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel )',1,2,NULL,'Vijayawada',521175,'H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel ), Krishna ( Dt ), Andhra Pradesh - 521175','0','ATRPM7848N','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,1),(204,'1072','EMP0000204',NULL,NULL,'Akriti',NULL,'Srivastava','1991-10-06','Female','0','9532881262','0','akriti.srivastava@sganalytics.com','akritisrivastavabbdnitm@gmail.com','438, Old Katra',1,35,889,'Allahabad',211002,'A-403 , Ginni Viviana, Nr. Mitcon Institute, Balewadi, Pune','0','EYIPS8285M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(205,'1074','EMP0000205',NULL,NULL,'Sunidhi',NULL,'Kakkar','1992-02-13','Female','0','7893406262','0','sunidhi.kakkar@sganalytics.com','sunidhikakkar@gmail.com','L-15, Shastri Nagar',1,35,940,'Meerut',250004,'L-15, Shastri Nagar, Meerut, UP - 250004','0','BNRPK1922N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(206,'1075','EMP0000206',NULL,NULL,'Sayli',NULL,'Rathi','1993-06-26','Female','0','9860290830','0','sayli.rathi@sganalytics.com','rathi.sayli@gmail.com','Rathi Pura, AT Post, Yeoda, Tq Daryapur',1,20,433,'Amravati',0,'Prestige Classic Housing, D-1, Dava bazar, Mumbai Pune Highway, Chinchwad','0','CBMPR8848A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,NULL),(207,'1077','EMP0000207',NULL,NULL,'Chiranjeevi',NULL,'Meesam','1986-06-20','Male','0','9573287838','0','chiranjeevi.meesam@sganalytics.com','chirumeesam@gmail.com','B S Peta, P P Agraharam',1,2,64,'Makavarapalem',0,'B S Peta, P P Agraharam, Makavarapalem, Vishaka dist','0','AZAPM1795M','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:29','2017-08-04 03:41:29',NULL,NULL,NULL,NULL,1),(208,'1083','EMP0000208',NULL,NULL,'Sandesh',NULL,'Gade','1968-06-14','Male','7308','9011012452','5097','sandesh.gade@sganalytics.com','sandeshgade123@gmail.com','9, Shahu Nagar, behind Noorani Masjid',1,20,NULL,'Jalgaon',425001,'9, Shahu Nagar, behind Noorani Masjid, Jalgaon,425001','0','AAXPG8252D','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(209,'1084','EMP0000209',NULL,NULL,'Jyoti',NULL,'Wadhwani','1988-01-04','Female','0','7720034188','0','jyoti.wadhwani@sganalytics.com','jyotiwadhwani4@gmail.com','Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar',1,20,504,'Pune',411014,'Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar, Pune 411014','0','ACNPW5545M','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(210,'1090','EMP0000210',NULL,NULL,'Dustin',NULL,'Lichey','1988-09-09','Male','7257','9823776569','5057','dustin.lichey@sganalytics.com','dustin.lichey@gmail.com','Radegaster Street 8, 06842 Dessag',NULL,NULL,NULL,'NA',0,'Radegaster Street 8, 06842 Dessag, Germany','0','AORPL2777A','NA','Unmarried',1,5,NULL,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(211,'1092','EMP0000211',NULL,NULL,'Abhishek',NULL,'Jha','1992-08-16','Male','7347','9711553074','5139','abhishek.jha@sganalytics.com','1992abhishekjha@gmail.com','Kh. No. 1704, New Karhera Colony',1,35,915,'Ghaziabad',201007,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','0','BAMPJ9378P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(212,'1094','EMP0000212',NULL,NULL,'Anand',NULL,'Sangeet','1984-10-15','Male','7332','9717929709','5120','anand.sangeet@sganalytics.com','anand.iet54@gmail.com','HIG,-0.2, VDA Flats, Naria',1,35,965,'Varanasi',221005,'HIG,-1/5, VDA Flats, Naria, Varanasi, Pin 221005','0','DKCPS3515R','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(213,'1095','EMP0000213',NULL,NULL,'Geogy',NULL,'George','1986-12-31','Male','7354','9880228857','7345','geogy.george@sganalytics.com','geogy_86@hotmail.com','Vadakethdahil Bethel, Kudassnad  P.O',1,18,374,'Pandalam',689512,'Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha, Kerala - 689512','0','ANIPG3492M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,7),(214,'1097','EMP0000214',NULL,NULL,'Shariqa',NULL,'Mulla','1991-11-15','Female','0','7795287015','0','shariqa.mulla@sganalytics.com','mshariqa1511@gmail.com','B. No. 76, M.H.B. Colony, Shah Bazar',1,20,255,'Aurangabad',0,'Survey No. 73, Hissa No. 1, Next to EON Free zone, Kharadi, Gera Emerald city','0','BTOPM0290G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(215,'1103','EMP0000215',NULL,NULL,'Rahul','Kumar','Burnwal','1990-12-21','Male','7204','9831036183','5004','rahul.burnwal@sganalytics.com','rahul.burnwal@yahoo.com','2/H/3, Taltala Lane',1,36,1008,'Kolkata',700014,'2/H/3, Taltala Lane Kolkata - 700014','0','BCJPB9778C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(216,'1109','EMP0000216',NULL,NULL,'Roger',NULL,'D\'Souza','1986-08-20','Male','1047','9764158808','0','roger.dsouza@sganalytics.com','roger.dsouza2016@gmail.com','St.Joseph nagar, Next to Ghorpuri Gaon',1,20,504,'Pune',411001,'Flat No. D/403, Viva Sarovar, Jambhulwadi Road, Katraj Ambegaon Budruk, Pune - 411 046','0','AMOPD4686M','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(217,'1120','EMP0000217',NULL,NULL,'Sharayu',NULL,'Jain','1993-03-21','Female','0','8989070779','0','sharayu.jain@sganalytics.com','sharayujain21@gmail.com','306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop',1,23,564,'Indore',0,'306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop, Indore M.P','0','ASOPJ1992N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(218,'1121','EMP0000218',NULL,NULL,'Hem',NULL,'Thaker','1993-08-16','Male','0','7745880007','0','hem.thaker@sganalytics.com','thaker.hem@gmail.com','302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate Bank, 60 Feet Road, Ghatkopar (East)',1,20,486,'Mumbai',400077,'302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate bank, 60 feet road, Ghatkopar ( East ), Mumbai 77','0','ASQPT5375D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,7),(219,'1123','EMP0000219',NULL,NULL,'Vineet',NULL,'Agarwal','1978-07-12','Male','7295','9731313010','5094','vineet.agarwal@sganalytics.com','vineet1207@gmail.com','Flat No. 003, Vijaya Classic, Vijaya Bank layout, Bilekahalli',1,17,NULL,'Bengaluru',560076,'Flat # D1103, Kolte Patil Langston,Kharadi,Pune - 411014','0','AFSPA7399K','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(220,'1124','EMP0000220',NULL,NULL,'Ganesh',NULL,'Kudke','1992-08-31','Male','0','9960981805','0','ganesh.kudke@sganalytics.com','ganesh.kudke@yahoo.in','Trimurti Colony No 2, Datta Nagar',1,20,NULL,'Beed',431122,'Patil Complex, Building -4, B29, Aundh Road, Pune - 411 020','0','DIIPK1791K','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(221,'1125','EMP0000221',NULL,NULL,'Shahab',NULL,'Mitha','1995-02-28','Male','0','9860203921','0','shahab.mitha@sganalytics.com','shahabmitha@gmail.com','P/16, Konark Campus, Viman Nagar',1,20,504,'Pune',411014,'P/16, Konark Campus, Viman Nagar, Pune - 411 014','0','CJWPM4341P','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(222,'1128','EMP0000222',NULL,NULL,'Sandeep',NULL,'Datta','1980-06-15','Male','7215','7767815975','5015','sandeep.datta@sganalytics.com','sandeepdat@gmail.com','2A, Samilton Greens, 159A NSC Bose Road, Tollygaunge, Regent Park',1,36,1008,'Kolkata',700040,'E1 / 401, Bramha SunCity, Vadgaon Sheri , Pune 411 014','0','AIGPD5352E','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:30','2017-08-04 03:41:30',NULL,NULL,NULL,NULL,NULL),(223,'1129','EMP0000223',NULL,NULL,'Geetika',NULL,'Gupta','1988-05-20','Female','0','8087616116','0','geetika.gupta@sganalytics.com','geetika.gupta2122@gmail.com','46, Sanchar Nagar, Damoh Road',1,23,565,'Jabalpur',0,'D/601, Marvel Citrine, Rakshak Nagar, Kharadi, Pune','0','ALIPG1089J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(224,'1134','EMP0000224',NULL,NULL,'Nikhil',NULL,'Sharma','1991-08-25','Male','0','8558985896','0','nikhil.sharma@sganalytics.com','nikhilsharma223656@gmail.com','Main bazar, Ward No 6',1,13,NULL,'Una',174303,'Main bazar, Ward No 6, Una - 174303, Himachal Pradesh','0','DHOPS0503Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,7),(225,'1135','EMP0000225',NULL,NULL,'Rahul',NULL,'Agarwal','1979-02-04','Male','7217','9845063982','5017','rahul.agarwal@sganalytics.com','rahul0402@gmail.com','c/o Dr. O P Agarwal, GP Das Lane, Mahamadia Bazar, Chandni Chowk',1,26,606,'Cuttack',753002,'B3 / 304, Tuscan Estate, Kharadi - Mundhwa Road, Next to Radisson Hotel, Pune 411 014','0','AHGPA8906L','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(226,'1136','EMP0000226',NULL,NULL,'Sakshi',NULL,'Kaushal','1991-07-06','Female','5110','7774095033','7321','sakshi.kaushal@sganalytics.com','sakshikaushal20@yahoo.com','19360, Santosh Bhawan, Vidhya Peeth Marg, Vikas Nagar',1,34,863,'Dehradun',0,'F-801, Roystonea, Magarpatta City, Pune - 411013','0','CQAPK5363E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,27,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(227,'1137','EMP0000227',NULL,NULL,'Nikhil',NULL,'Venkatavelu','1994-03-03','Male','7539','8463842283','0','nikhil.venkatavelu@sganalytics.com','nikhilvenkatavelu@gmail.com','C-202, Kalpataru, Bhagoji Keer Road, Behind Paradise Cinema, Mahim West',1,20,486,'Mumbai',400016,'Guest House currently','0','AZHPV6024F','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,22,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(228,'1138','EMP0000228',NULL,NULL,'Shefali',NULL,'Arora','1993-12-18','Female','0','8435139445','0','shefali.arora@sganalytics.com','shefaliarora18@gmail.com','H-448 , Aadharshila, Essarjee, East block, Awadhpuri',1,23,550,'Bhopal',0,'Guest House currently','0','BQRPA1921J','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(229,'1139','EMP0000229',NULL,NULL,'Vikram',NULL,'Gupta','1995-05-21','Male','0','7839218872','0','vikram.gupta@sganalytics.com','vikramgpt2011@gmail.com','Sr. 704 Block, Saraswati Apartment, River View, Gomti Nagar',1,35,935,'Lucknow',226010,'Guest House currently','0','BQWPG0024P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(230,'1140','EMP0000230',NULL,NULL,'Surabhi',NULL,'Singh','1990-08-16','Female','0','9755233255','0','surabhi.singh@sganalytics.com','surabhitnp16@gmail.com','93-B , Nehru Park colony, Prem Nagar, P.O. Izzatnagar',1,35,897,'Bareilly',0,'Guest House currently','0','EVUPS8926Q','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(231,'1141','EMP0000231',NULL,NULL,'Vishakha',NULL,'Avhad','1991-06-11','Female','0','8928009180','0','vishakha.avhad@sganalytics.com','vishakha_245@rediffmail.com','11, Arya Apartment, Kala Nagar, Jail Road',1,20,492,'Nashik',0,'Guest House currently','0','BKYPA1823N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,3),(232,'1142','EMP0000232',NULL,NULL,'Samaksh',NULL,'Dahiya','1989-07-31','Male','0','7709564863','0','samaksh.dahiya@sganalytics.com','SPACKSAM@gmail.com','A -1 / 261, Paschim Vihar',1,9,135,'New Delhi',63,'C - 902, The Latitude, NIBM, Kondwa','0','BHQPD2391M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(233,'1145','EMP0000233',NULL,NULL,'Anil',NULL,'Kumar','1994-09-23','Male','0','9695406049','0','anil.kumar@sganalytics.com','nlkumar528@gmail.com','H. No. 1581, LIG HBC , Sector 04',1,14,274,'Karnal',0,'Guest House currently','0','CTAPK9522L','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,7),(234,'1153','EMP0000234',NULL,NULL,'Sri Krishna',NULL,'Hasa Yalamanchili','1987-01-26','Female','7333','9000081295','5121','srikrishna.hasa@sganalytics.com','kri.hasa@gmail.com','Flat - 202, Srinivasam , 31-16-18, Bullemma Street, Machavaram down',1,2,62,'Vijayawada',520004,'Flat - 1202, Tower-17, Amanora Township, Hadapsar - 411028','0','CIPPS3976L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(235,'1155','EMP0000235',NULL,NULL,'Supriya',NULL,'Sindkhedkar','1990-12-11','Female','1039','8275411160','0','supriya.sindkhedkar@sganalytics.com','ssupriya011@gmail.com','Aashirwad Niwas, In front of Radha Krishna Theatre, Kawar nagar',1,20,429,'Akola',444001,'Raj Mahal Building, H-18, Nr. Geuba Moses school, Yerawada,Pune','0','EQLPS8645N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(236,'1159','EMP0000236',NULL,NULL,'Shashi',NULL,'Agarwal','1978-10-02','Male','0','9892252700','0','shashi.agarwal@sganalytics.com','shashi21078@gmail.com','LIG - 206, Kotra Sultanabad',1,23,550,'Bhopal',462003,'LIG - 206, Kotra Sultanabad, Bhopal, MP 462003','0','AINPA0752G','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(237,'1163','EMP0000237',NULL,NULL,'Amandeep',NULL,'Chanyal','1994-04-23','Male','0','9800161599','0','amandeep.chanyal@sganalytics.com','amandeepchanyal5@gmail.com','Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road',1,34,NULL,'Haldwani',263139,'Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road, Haldwani, Dist Nainital, Uttarakhand - 263139','0','AVUPC9932A','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(238,'1164','EMP0000238',NULL,NULL,'Shubham',NULL,'Agarwal','1994-08-12','Male','7532','8972318731','0','shubham.agarwal@sganalytics.com','shubhama999@gmail.com','D-4089, 4th Floor, Bima Complex, Kalamboli',1,20,NULL,'Navi Mumbai',410218,'D-4089, 4th Floor, Bima Complex, Kalamboli, Navi Mumbai- 410218','0','BURPA7875H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(239,'1166','EMP0000239',NULL,NULL,'Manas','Ranjan','Sahoo','1994-03-25','Male','0','9932584032','0','manas.sahoo@sganalytics.com','manas7671@gmail.com','B-2181, Narmada Vihar, NTPC Township',1,7,124,'Jamnipali',495450,'B-2181, Narmada Vihar, NTPC Township, Jamnipali, Korba, Chattisgarh-495450','0','FGVPS8484L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(240,'1169','EMP0000240',NULL,NULL,'Chaitanya',NULL,'Bhokare','1988-09-12','Male','5142','9766859441','7353','chaitanya.bhokare@sganalytics.com','chaitanya.bhokare12@gmail.com','Parijat, Nr Phadke hospital, Jatharpeth',1,20,429,'Akola',444005,'\"Parijat\", Nr Phadke hospital, Jatharpeth, Akola - 444005','0','AVNPB2367F','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:31','2017-08-04 03:41:31',NULL,NULL,NULL,NULL,NULL),(241,'1170','EMP0000241',NULL,NULL,'Shalini',NULL,'Sharma','1991-07-26','Female','1017','8888839753','0','shalini.sharma@sganalytics.com','ssshalu2627@gmail.com','13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi',1,16,306,'Jammu',180001,'13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi, Jammu & KASHMIR - 180001','0','ERQPS7103R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,11,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(242,'1171','EMP0000242',NULL,NULL,'Divya',NULL,'Chainani','1993-03-23','Female','1034','88062331345','0','divya.chainani@sganalytics.com','divya.chainani23@gmail.com','118/58,Kaushalpuri',1,35,925,'Kanpur',208012,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','AWBPC3777B','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(243,'1172','EMP0000243',NULL,NULL,'Anshika',NULL,'Gandotra','1991-07-03','Female','1011','9552271494','0','anshika.gandotra@sganalytics.com','anshika.gandotra@gmail.com','13, Sravana, RC Church, Colaba',1,20,486,'Mumbai',400001,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','ASCPG0051B','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(244,'1173','EMP0000244',NULL,NULL,'Vikas',NULL,'Unnikkannan','1992-04-15','Male','0','7387431526','0',' vikas.unnikkannan@sganalytics.com','vikasunnikkannan@gmail.com','Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa',1,20,504,'Pune',411048,'Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa, Pune - 411048','0','ADMPU7281L','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(245,'1174','EMP0000245',NULL,NULL,'Shruti',NULL,'Vidwans','1986-02-01','Female','7053','9881575599','0','shruti.vidwans@sganalytics.com','shruti.vidwans1@gmail.com','400 B, Jaygad Apts., United Western Society, Karve Nagar',1,20,504,'Pune',411052,'400 B, Jaygad Apts., United Western Society, Karve Nagar, Pune - 411052','0','BDUPS7466N','NA','Widow',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(246,'1180','EMP0000246',NULL,NULL,'Jitendra','Kumar','Teli','1986-11-30','Male','7263','9765287154','5063','jitendra.teli@sganalytics.com','jitendrateli.jt@gmail.com','76, Gumasta Nagar',1,23,564,'Indore',452009,'Lunkad Heritage, Viman Nagar, Pune','0','AJKPT1618G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,3),(247,'1181','EMP0000247',NULL,NULL,'Shantanu',NULL,'Maddiwar','1990-05-14','Male','0','7875867656','0','shantanu.maddiwar@sganalytics.com','shantanu-maddy@yahoo.co.in','F2, Gulmohar Plaza, Datala Road',1,20,448,'Ramnagar',442401,'Siddhi Paying Guest, Opp Forest Country lane, Kharadi','0','AVKPM1617N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,1),(248,'1183','EMP0000248',NULL,NULL,'Prachi',NULL,'Jain','1992-11-26','Female','0','8085475799','0','prachi.jain@sganalytics.com','prachijain717@gmail.com','Flat - 203, Inner court, GTB Complex, T T Nagar',1,23,550,'Bhopal',0,'L804, Cosmos Society, Magarpatta,Hadapsar, Pune','0','ATNPJ6287G','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,2),(249,'1184','EMP0000249',NULL,NULL,'Sanaya',NULL,'Shaikh','1988-09-28','Female','0','9923329049','0','sanaya.shaikh@sganalytics.com','sanaya.shaikh28@gmail.com','H No 1-10-48, Juna Bazar',1,20,255,'Aurangabad',0,'Flat 503, B-11, R-Euphoria Society, Kondhwa Budruk, Opp Jalab Farms, Pune - 411048','0','CGEPS1986D','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(250,'1185','EMP0000250',NULL,NULL,'Tushar',NULL,'Chugh','1994-03-29','Male','0','9416039078','0','tushar.chugh@sganalytics.com','tusharchugh078@gmail.com','525, Huda -20',1,14,272,'Kaithal',0,'6 Raja Apartment, Model Colony, Pune','0','BFQPC2888Q','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,3),(251,'1189','EMP0000251',NULL,NULL,'Radheshyam',NULL,'Moholkar','1984-06-07','Male','0','7718899482','0','radheshyam.moholkar@sganalytics.com','radheshyam.moholkar@hotmail.com','102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner',1,20,504,'Pune',411045,'102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner, Pune - 411045','0','ANNPM2934R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(252,'1195','EMP0000252',NULL,NULL,'Radhika',NULL,'Iyer','1994-11-28','Female','7367','8796917089','0','radhika.iyer@sganalytics.com','iyerradhika2811@gmail.com','44,45,46, Rasta Peth, Nr. Lakheri Maruti Chowk, 201, Sumadhan Apt, Jews Street',1,20,504,'Pune',411011,'44,45,46 Rasta Peth, Nr. Lakheri Maruti Chowk,201, Sumadhan Apt, Jews Street, Pune - 411011','0','AEFP12320N','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,8),(253,'1197','EMP0000253',NULL,NULL,'Rajesh',NULL,'Viswanath','1978-12-11','Male','7343','9886160022','5131','rajesh.viswanath@sganalytics.com','rajeshviswanath@hotmail.com','#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya',1,17,NULL,'Bengaluru',0,'#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya, Bengaluru','0','AFGPR9583Q','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(254,'1198','EMP0000254',NULL,NULL,'Priyanka',NULL,'Agrawal','1990-10-24','Female','0','8976683696','0','priyanka.agrawal@sganalytics.com','priyankaagrawal24@gmail.com','A-204, Green Divine, Nr. Amanora, Hadapsar',1,20,504,'Pune',0,'A-204, Green Divine, Nr. Amanora , Hadapsar, Pune','0','AURPA9306N','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(255,'1202','EMP0000255',NULL,NULL,'Ninad',NULL,'Suratkar','1993-03-07','Male','1026','7798634778','0','ninad.suratkar@sganalytics.com','suratkarninad@gmail.com','G/4, Fokhale Vrindavan, Chinchwad',1,20,504,'Pune',411033,'G/4, Fokhale Vrindavan, Chinchwad, Pune-411033','0','DLJPS3590G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,NULL),(256,'1209','EMP0000256',NULL,NULL,'Geetesh',NULL,'Binjhade','1990-05-17','Male','0','9907321095','0','geetesh.binjhade@sganalytics.com','geeteshbinjhade@gmail.com','House No. 1328, Nagpur Road, BSNL Colony, SARRA',1,23,553,'Imlikheda',0,'House No. 1328, Nagpur Road, BSNL Colony, SARRA , Post Imlikheda, Chhindwara, MP','0','BKGPB5919N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,1),(257,'1210','EMP0000257',NULL,NULL,'Heena',NULL,'Phulwani','1993-10-20','Female','0','7879949561','0','heena.phulwani@sganalytics.com','heenaphulwani2014@gmail.com','Ward No. 37,7816, Jamidar Colony, Ramtekri',1,23,573,'Mandsaur',458001,'Ward No. 37, 7816, Jamidar Colony, Ramtekri, Mandsaur, M.P - 458001','0','CVSPP3631B','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:32','2017-08-04 03:41:32',NULL,NULL,NULL,NULL,1),(258,'1211','EMP0000258',NULL,NULL,'Varun',NULL,'Janardhan','1988-07-26','Male','0','9096217076','0','varun.janardhan@sganalytics.com','varun.janardhan26@gmail.com','C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran',1,20,504,'Pune',412114,'C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran, Pune-412114','0','ALGPJ5296E','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(259,'1212','EMP0000259',NULL,NULL,'Satyarshi',NULL,'Mishra','1990-04-26','Male','0','9595331390','0','satyarashi.mishra@sganalytics.com','satyarashi28@gmail.com','H. No 85, Sachcha Kuteer,Laxmanpur Colony, Allahabad Road',1,35,960,'Sultanpur',228001,'Flat No. 307, Matoshri Building, Patil Nagar, Bavdhan, Pune-411021','0','BAUPM9697L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(260,'1213','EMP0000260',NULL,NULL,'Vikas',NULL,'Divate','1990-11-14','Male','0','9028098017','0','vikas.divate@sganalytics.com','divatevikas@gmail.com','Divate Kirana, Abinav Nagar, Navin Nagar Road',1,20,428,'Sangamner',422605,'B - 14, Pushpa Apartment, Kothrud, Pune - 411038','0','ANCPD3009P','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(261,'1214','EMP0000261',NULL,NULL,'Shweta',NULL,'Pandey','1982-03-01','Female','0','9717885757','0','shweta.pandey@sganalytics.com','shwetapandey1982@gmail.com','House No 2542, Coriender Bldg, Vijaya Gardens, Baridih',1,15,297,'Jamshedpur',0,'Guest House currently','0','ARJPP1028P','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(262,'1216','EMP0000262',NULL,NULL,'Jaikishan',NULL,'Dhanwani','1990-10-27','Male','0','9898224111','0','jaikishan.dhanwani@sganalytics.com','jacky.dhanwani@yahoo.com','13/ B-5, Gokul Nagar Society, Makarpura Road, Opp ONGC',1,12,227,'Vadodara',390009,'Flat No. 11, Block No. C, Seetai Park,Opp Kaka Halwai Shop, Aundh, D P Road, Pune-411007','0','AQFPD6017P','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(263,'1217','EMP0000263',NULL,NULL,'Rishi',NULL,'Jayswal','1992-03-09','Male','0','9158053177','0','rishi.jayswal@sganalytics.com','rishi.jayswal92@gmail.com','2/C, d.l Roy Street',1,36,1008,'Kolkata',700006,'Guest House currently','0','APMPJ2844N','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(264,'1218','EMP0000264',NULL,NULL,'A Harish',NULL,'Rao','1983-10-28','Male','7528','9818948028','0','aharish.rao@sganalytics.com','harryl_rao@yahoo.co.in','Holding No.4, Road 4, Contractors Area',1,15,297,'Bistupur',831001,'RH-13, Mahesh Society, Sambhajinagar, Chinchwad, Pune','0','AKWPR2786A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,9),(265,'1219','EMP0000265',NULL,NULL,'Roshan',NULL,'Kumar','1985-04-15','Male','7349','9999595619','5135','roshan.kumar@sganalytics.com','roshan.dreamz@gmail.com','Ward No 09, P.O Brpur',1,5,NULL,'Supaul',854340,'D1-304, Ganga Constella, Kharadi','0','AWCPK1116B','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,7),(266,'1220','EMP0000266',NULL,NULL,'Nishant',NULL,'Mantri','1987-11-21','Male','0','9972098115','0','nishant.mantri@sganalytics.com','mantri13@gmail.com','H No 4118 - 19, Karwa Nagar, Mantha Road ',1,20,468,'Jalna',431203,'F7 / 25, Hermes Heritage, Phase II, Shastri Nagar, Yerwada , Pune 411006','0','APHPM3028E','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(267,'1221','EMP0000267',NULL,NULL,'Mangesh',NULL,'Shinde','1989-01-01','Male','0','9561317990','0','mangesh.shinde@sganalytics.com','mangeshshinde001@gmail.com','S.R. No.4812, Dhanlaxmi Society, Ganesh Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'S.R. No.4812, Dhanlaxmi Society, ganesh Nagar, Wadgaonsheri, Pune 411014','0','CNIPSO730G','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(268,'1222','EMP0000268',NULL,NULL,'Ajay',NULL,'Shekhawat','1992-12-28','Male','0','7566438221','0','ajay.shekhawat@sganalytics.com','ajayshekhawat2812@yahoo.com','689 Road No. 8, Nanda Nagar',1,23,564,'Indore',452011,'689 Road No. 8, Nanda Nagar, Indore, MP 452011','0','FXPPS0254H','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,1),(269,'1227','EMP0000269',NULL,NULL,'Pratiksha',NULL,'Mandhane','1993-10-19','Female','0','9421679907','0','pratiksha.mandhane@sganalytics.com','pratikshamandhane@gmail.com','Kaviraj Vishnu Nagar, Basmat Road',1,20,501,'Parbhani',431401,'Guest House Currently','0','BWRPM2996M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(270,'1228','EMP0000270',NULL,NULL,'Kunal',NULL,'Doshi','1982-12-02','Male','7351','9538034400','5140','kunal.doshi@sganalytics.com','nikur_kunal@yahoo.co.in','45, Rajeshvari Colony, Isanpur Road, Mani Nagar',1,12,NULL,'Ahemdabad',380008,'Vascon Ela, B- 402, Malvadi, Behind Amanora Mall, Hadapsar, Pune - 411028 ','0','AJVPD7527P','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(271,'1231','EMP0000271',NULL,NULL,'Krishna',NULL,'Bamezai','1989-08-15','Male','0','7875790046','0','krishna.bamezai@sganalytics.com','krishnabamezai17@gmail.com','17/4, Pandoka Colony, Paloura',1,16,306,'Jammu',0,'302, Mithila, Shree Siddhivinayak Sankalp, Undri, Pune - 60','0','CKZPB8985N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,7),(272,'1232','EMP0000272',NULL,NULL,'Viveki',NULL,'Singh','1993-02-11','Female','0','7680062851','0','viveki.singh@sganalytics.com','vivekisingh338@gmail.com','Dr no - 403, BGM Patrudu Residency, Coromandel Gate',1,2,NULL,'Vishakapatnam',530011,'Shree Sai PG, Sangharsh Chowk, Chandan Nagar, Pune','0','DGFPS4140M','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,3),(273,'1238','EMP0000273',NULL,NULL,'Chaitanya',NULL,'Nandan','1993-01-30','Male','0','7507985936','0','chaitanya.nandan@sganalytics.com','chaitanyanandan3@gmail.com','Yajurwed Housing Society,Opp Megharaj, Peth Road',1,20,492,'Nashik',0,'Sai Nagari, Lane No. 9, Chandan Nagar, Pune - 411014','0','AXVPN5265A','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,12,NULL,1,'2017-08-04 03:41:33','2017-08-04 03:41:33',NULL,NULL,NULL,NULL,NULL),(274,'1239','EMP0000274',NULL,NULL,'Manasi',NULL,'Das','1983-12-25','Female','0','9731290700','0','manasi.das@sganalytics.com','manasidas802@gmail.com','A-26, Eldeco Green Meadows, Sector P',1,35,NULL,'Greater Noida',0,'F-501, Marvel Ritz, Tupe Road, Behind Amanora Mall,Hadapsar, pune','0','ATWPB8080A','NA','Divorced',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,1),(275,'1240','EMP0000275',NULL,NULL,'Santosh',NULL,'Kurade','1989-05-11','Male','0','9664907175','0','santosh.kurade@sganalytics.com','santosh.kurade50@gmail.com','At/P, Wagharali, Tal Gahinglaj',1,20,479,'Kolhapur',0,'At/P, Wagharali, Tal Gahinglaj, Kolhapur','0','BMMPK0996E','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,1),(276,'1242','EMP0000276',NULL,NULL,'Rohit',NULL,'Jain','1987-06-21','Male','0','9049070088','0','rohit.jain@sganalytics.com','rojain15@gmail.com','240, Jain Nagar',1,23,550,'Bhopal',462030,'B-301, Gokul Crest, Sakore Nagar, Pune-411014','0','AMAPJ4881A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,1),(277,'1243','EMP0000277',NULL,NULL,'Suraj',NULL,'Dudhe','1985-02-24','Male','0','9545088288','0','suraj.dudhe@sganalytics.com','suraj.dudhe@gmail.com','Main Road, At Kelor Saoner',1,20,488,'Nagpur',441112,'B6/302, Phase -II, Tirupati Campus, Road No. 2, Tingre Nagar, Vishrantwadi,Pune - 411015','0','ALZPD6503B','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,7,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(278,'1244','EMP0000278',NULL,NULL,'Priyanka',NULL,'Padhi','1991-06-25','Female','0','8080849736','0','priyanka.padhi@sganalytics.com','priyankapadhi1991@gmail.com','2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill',1,20,486,'Mumbai',400031,'2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill, Mumbai - 400031','0','BQZPP3895A','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(279,'1247','EMP0000279',NULL,NULL,'June',NULL,'Biswas','1987-05-04','Female','0','8698909762','0','june.biswas@sganalytics.com','junebiswas@gmail.com','903, B11, Margosa Heights, Mohammadwadi',1,20,504,'Pune',411060,'903, B11, Margosa Heights, Mohammadwadi, Pune - 411060','0','APDPB4354G','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(280,'1248','EMP0000280',NULL,NULL,'Kishore','Varma','Addepalli','1984-10-02','Male','0','9491571311','0','kishorevarma.addepalli@sganalytics.com','kishore_vrma@yahoo.com','Plot No. 351/ A, Flat No F 4, Om Sai Sudha  Residency, Vandanapuri Colony, Road No 2, Beeramguda',1,2,742,'Patancheru Mandal',0,'Guest House currently','0','AMLPA6854H','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,1),(281,'1249','EMP0000281',NULL,NULL,'Sweta',NULL,'Jaiswal','1991-01-14','Female','7370','7350714214','5149','sweta.jaiswal@sganalytics.com','jaiswalsweta17@gmail.com','Type - 2B / 1712, HAL T/S, Ojar',1,20,492,'Nashik',422207,'318 A & B, Snehsagar Apt, Plot No. 9 & 10, Shukrawar Peth, Pune - 411002','0','ATVPJ3128L','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(282,'1250','EMP0000282',NULL,NULL,'Namrata',NULL,'Jagade','1988-02-08','Female','0','9527778877','0','namrata.jagade@sganalytics.com','namrata-828@yahoo.co.in','Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road',1,20,504,'Pune',411051,'Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road, Pune - 411051','0','ALCPJ5684L','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,8),(283,'1251','EMP0000283',NULL,NULL,'Neha',NULL,'Deshpande','1988-05-04','Female','7361','7378315486','0','neha.deshpande@sganalytics.com','nehadp0488@gmail.com','Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe',1,20,504,'Pune',411041,'Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe, Pune 411 041','0','BVGPD9787B','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,8),(284,'1252','EMP0000284',NULL,NULL,'Gouree',NULL,'Gurjar','1982-08-28','Female','7365','9673992306','0','gouree.gurjar@sganalytics.com','goureeg@gmail.com','F- 701, Maple Woodz, Wagholi',1,20,504,'Pune',0,'F- 701, Maple Woodz, Wagholi, Pune','0','BKWPP7332P','NA','Married',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,8),(285,'1253','EMP0000285',NULL,NULL,'Ashish','Kumar','Jain','1984-12-05','Male','0','9701810370','0','ashish.jain@sganalytics.com','ashish51284@gmail.com','House No. 28, 2nd Floor, Street No. 3, New Krishna Nagar',1,9,135,'Delhi',110051,'House No. 28, 2nd Floor, Street No. 3,  New Krishna Nagar, Delhi - 110051','0','AJXPJ0188J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(286,'1254','EMP0000286',NULL,NULL,'Tony',NULL,'Thomas','1990-01-04','Male','0','7507191303','0','tony.thomas@sganalytics.com','tonythomas4190@gmail.com','C-8/ 72, Century Enka, Col No. 2, Bhosari',1,20,504,'Pune',411039,'A2, Karishma Glory Hsg Society, Ajmera, Morwadi, Pimpri, Pune - 411018','0','AOAPT1539F','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(287,'1255','EMP0000287',NULL,NULL,'Zahoor',NULL,'Hurrah','1989-12-18','Male','7364','8087395066','0','zahoor.hurrah@sganalytics.com','zahoornabii@gmail.com','Nigeen Bagh, Krankshivan Colony',1,16,NULL,'Sopore',0,'Flat No. 504, Cindrella Apartment,  Shivneri Nagar,Kondhwa, Pune','0','AHNPH8794A','NA','Unmarried',5,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,8),(288,'1256','EMP0000288',NULL,NULL,'Akshay',NULL,'Sahani','1992-10-17','Male','1036','9579712663','0','akshay.sahani@sganalytics.com','sahaniakshay@yahoo.com','Flat No. 103, Plot No - 378, Sector-E, N-1, CIDCO',1,20,255,'Aurangabad',431003,'S. No- 22, Pavlina Terrace, Sopan Nagar Road, Wadgaon sheri, Pune - 411014','0','ESXPS1859C','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(289,'1257','EMP0000289',NULL,NULL,'Ritu',NULL,'Sahewalla','1988-11-09','Female','1024','9958121080','0','ritu.sahewalla@sganalytics.com','sahewalla.ritu@gmail.com','Jai Bharat Tubewell store, Begu Road',1,14,288,'Sirsa',725055,'A-503, Downtown Langston, Kolte Patil, Kharadi, Pune - 411014','0','ANKPR8176R','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(290,'1258','EMP0000290',NULL,NULL,'Vikas',NULL,'Dimaniya','1988-01-06','Male','7378','9599927746','5155','vikas.dimaniya@sganalytics.com','vdimaniya@gmail.com','House no. 183/1,New mandi keshru khera',1,35,940,'Meerut',250001,'House no. 183/1,New mandi keshru khera,Meerut cantt – 250001\n','0','BBKPD2052H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:34','2017-08-04 03:41:34',NULL,NULL,NULL,NULL,NULL),(291,'1259','EMP0000291',NULL,NULL,'Digvijay','Kumar','Kashyap','1982-02-09','Male','7368','9920179210','0','digvijay.kashyap@sganalytics.com','digvijay.kashyap@@gmail.com','Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad',1,20,504,'Pune',411057,'Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad,Pune -411057\n','0','AXPPK8711J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,8),(292,'1260','EMP0000292',NULL,NULL,'Vineeth',NULL,'CL','1990-07-01','Male','7290','7066794553','5089','vineeth.cl@sganalytics.com','vineeth1192@gmail.com','Cyrus House, Nr SNDP, Trichambaran, Taliparamba',1,18,391,'Kannur',670141,'Cyrus House, Nr SNDP, Trichambaran, Taliparamba, Kannur, Kerala-670141','0','AQQPC1113N','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(293,'1262','EMP0000293',NULL,NULL,'Ramkrishna',NULL,'Umre','1981-11-01','Male','7299','8451948400','5096','ramkrishna.umre@sganalytics.com','rkumre@gmail.com','Balaji Colony, Behind SBI Agri Development Branch',1,23,563,'Babai',0,'1204, B-8, Park Infinia, Gurudatta Nagar, Fursungi, Pune','0','AMRPR51424','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(294,'1263','EMP0000294',NULL,NULL,'Arti',NULL,'Saproo','1977-09-17','Female','7558','9711497477','0','arti.saproo@sganalytics.com','saproo.arti@gmail.com','No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli',1,17,NULL,'Bengaluru',560097,'No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli,Bangalore - 560097','0','ATBPS7910D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,10,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(295,'1264','EMP0000295',NULL,NULL,'Varun',NULL,'Gupta','1991-06-15','Male','5019','9960732898','7219','varun.gupta@sganalytics.com','varungupta1591@gmail.com','Gupta Flour & Oil Ind, Mohata Mill Road, Naya Jin',1,20,429,'Akola',0,'Flat No 12, Rajyog Heights, Ganpati Chowk, Viman Nagar, Pune','0','ASOPG5576F','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(296,'1265','EMP0000296',NULL,NULL,'Gaurav',NULL,'Shukla','1982-04-18','Male','0','9582898882','0','gaurav.shukla@sganalytics.com','gvshukla@gmail.com','G - 271, 2nd Floor, Sushant, LOK- 2, Sector 57',1,14,265,'Gurgaon',122010,'Flat no. 302, Tower 51,Future Towers, Amanora Park Town,Hadapsar, Pune – 411028','0','BEFPS3078J','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,7),(297,'1266','EMP0000297',NULL,NULL,'Sumeet',NULL,'Ranglani','1992-12-30','Male','5146','7507002106','7298','sumeet.ranglani@sganalytics.com','sumeetranglani3012@hotmail.com','B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh',1,20,504,'Pune',411007,'B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh, Pune - 411007','0','AZPPR0939M','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(298,'1267','EMP0000298',NULL,NULL,'Vicky',NULL,'Lokhande','1989-02-26','Male','0','9130430440','0','NA','NA','Sangamwadi, Near Ram Mandir, Khadki',1,20,504,'Pune',411003,'Sangamwadi, Near Ram Mandir, Khadki, Pune - 411003','0','NA','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,19,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(299,'1268','EMP0000299',NULL,NULL,'Ankit',NULL,'Shankhwalker','1991-03-28','Male','0','9049340293','0','ankit.shankhwalker@sganalytics.com','ankit.shankhwalker@gmail.com','Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar',1,11,NULL,'Panaji',0,'Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar , Panaji, Goa','0','BOYPK5913B','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(300,'1269','EMP0000300',NULL,NULL,'Richa',NULL,'Sharma','1988-11-02','Female','7260','9993959742','5060','richa.sharma@sganalytics.com','0211richa@gmail.com','14, Karariya Farm, Koluvada Bagicha, Khushipura ward 36, Tehsil Huzur',1,23,550,'Bhopal',462010,'Sagar Park  Society, Lane No.3, Samadhan,  Near Sarvodaya hotel,Chandan nagar,  Nagar Road, Pune','0','ECVPS7813A','NA','Unmarried',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,8),(301,'1271','EMP0000301',NULL,NULL,'Rajib',NULL,'Das','1982-04-11','Male','7212','9420410815','5012','rajib.das@sganalytics.com','rajib1d@gmail.com             ','Bandhgara',1,36,NULL,'Bolpur',731204,'B-505, S3,Lifestyle Apt, Kunal Icon Road, Pimple Saudagar, Pune - 411027','0','AOSPD8740G','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,1,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(302,'1272','EMP0000302',NULL,NULL,'Ankit',NULL,'Maheshwari','1978-06-30','Male','7214','9765406615','5151','ankit.maheshwari@sganalytics.com','maheshwariankit@rediffmail.com','G-801, Marvel Zephyr, Kharadi',1,20,504,'Pune',411014,'G-801, Marvel Zephyr, Kharadi, Pune - 411014','0','AJQPM6553M','NA','Married',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(303,'1273','EMP0000303',NULL,NULL,'Imroz',NULL,'Khan','1991-01-10','Male','7511','9319239923','0','imroz.khan@sganalytics.com','imrozkhan111@gmail.com','H No 539, Gali Chobdaran, Mandi Ram Dass ',1,35,938,'Mathura',0,'E-103, Downtown Langston, Fountain Road, Kharadi, Pune','0','DASPK8557D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(304,'1274','EMP0000304',NULL,NULL,'Kunal',NULL,'Pateliya','1988-12-11','Male','7363','8983700369','0','kunal.pateliya@sganalytics.com','kunalpateliya555@gmail.com','S/ No 29, Near R K puram, Munjaba Wasti, Dhanori',1,20,504,'Pune',411015,'S/ No 29, Near R K puram, Munjaba Wasti, Dhanori, Pune - 411015','0','AXYPP5691H','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,8),(305,'1275','EMP0000305',NULL,NULL,'Yogesh',NULL,'Hanse','1990-07-06','Male','7360','9673119987','0','yogesh.hanse@sganalytics.com','yogeshyh@gmail.com','Ganesh Nagar, col No. 9 ,Bppkhel, CME',1,20,504,'Pune',411031,'Ganesh Nagar, col No. 9 ,Bppkhel, CME, Pune -  411 031','0','AGDPH6228A','NA','Unmarried',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,8),(306,'1276','EMP0000306',NULL,NULL,'Prasad',NULL,'Galinde','1989-10-06','Male','5146','9028795550','7298','prasad.galinde@sganalytics.com','galinde.prasad@gmail.com','Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi',1,20,504,'Pune',411014,'Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi, Pune - 411014','0','BKAPG5250K','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(307,'1277','EMP0000307',NULL,NULL,'D',NULL,'Kusuma','1987-05-03','Female','7572','9545466542','0','d.kusuma@sganalytics.com','kusuma.d1987@gmail.com','Flat No. 416, GCN White Palms, Ramagondanahalli, Narayanpura Road',1,17,NULL,'Bengaluru',560066,'# 602B, Anshul Athena Society, Sainath Nagar, Wadgaonsheri, Pune','0','BZPPKOO53G','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,23,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,NULL),(308,'1278','EMP0000308',NULL,NULL,'Sandip',NULL,'Chavan','1983-06-13','Male','7246','9011937481','5046','sandip.chavan@sganalytics.com','sandeepchavan83@yahoo.co.in','A/P Devale, Tal Panhala',1,20,479,'Kolhapur',0,'Mahadev Nagar, Manjri Road, Hadapsar, Pune - 28','0','AJLPC2618Q','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:35','2017-08-04 03:41:35',NULL,NULL,NULL,NULL,3),(309,'1279','EMP0000309',NULL,NULL,'Devi','Prasad','Swain','1991-12-20','Male','0','7873470610','0','devi.swain@sganalytics.com','devi.winanything@gmail.com','Plot No. B2 /128, Lingaraj Vihar, Pokhariput',1,26,NULL,'Bhubaneshwar',0,'Plot No. B2 /128, Lingaraj Vihar, Pokhariput, Bhubaneshwar, Odisha','0','FTIPS6420N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,24,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(310,'1280','EMP0000310',NULL,NULL,'Varun',NULL,'Hatmode','1982-03-03','Male','7272','7507610468','5072','varun.hatmode@sganalytics.com','varun.hatmode@gmail.com','Plot No 24, Asmita Colony, Narendra Nagar',1,20,488,'Nagpur',440015,'C3/1201, Colonnade Society, Kharadi Bypass road, Kharadi, Pune - 411014','0','ACPPH2566R','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,20,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(311,'1281','EMP0000311',NULL,NULL,'Sourish',NULL,'Chatterjee','1994-11-28','Male','0','8390739122','0','sourish.chatterjee@sganalytics.com','sourish.sunny@gmail.com','1, Tilak Road',1,36,1008,'Kolkata',700029,'1, Tilak Road, Kolkata - 700029','0','AZDPC4950H','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(312,'1282','EMP0000312',NULL,NULL,'Dyamaapa','Dummi','Nataraj','1988-01-18','Male','0','9916855568','0','dyamappa.nataraj@sganalytics.com','dyan.natarj@gmail.com','No. 114, Dummi-1, Hollakere',1,17,333,'Chitradurga',0,'Maneesh Neelaya No. 24, 3rd Floor, 11th MAIN, 9TH Cross road, Raghavendra layout, Kammagondanahari - 560015, Bangalore','0','BNBPD4822N','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(313,'1283','EMP0000313',NULL,NULL,'Tarun','Bhargav','Paladugu','1987-05-13','Male','0','9599376349','0','tarun.bhargav@sganalytics.com','tarunbhargav@gmail.com','3, Golden Oak Apartments, Defence Colony, Sainik Puri',1,2,751,'Secunderabad',56,'003, Golden Oak Apartments, Defence Colony, Sainik Puri, Secunderabad - 56','0','ARGPP6515J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(314,'1287','EMP0000314',NULL,NULL,'Anshul',NULL,'Yadav','1988-03-21','Male','7280','9811841346','5079','anshul.yadav@sganalytics.com','anshullyadavv@gmail.com','434/8, Defence Officers Enclave, SP Marg, Chanakyapuri',1,9,135,'New Delhi',110021,'434/8, Defence Officers Enclave, SP Marg, Chanakyapuri, New Delhi - 110021','0','ACRPY2633G','NA','Married',7,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(315,'1289','EMP0000315',NULL,NULL,'Priyanka',NULL,'Thombre','1993-11-13','Female','0','7353125767','0','priyanka.thombre@sganalytics.com','priyankathombre13@gmail.com','H. No. 26, Sainik Nagar, Laxmi Tek',1,17,322,'Belgaum',0,'Flat No. 201, Sainath Nagar, Karan Rhea, Wadgaonsheri','0','AUBPT3103C','NA','Unmarried',2,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,6,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(316,'1290','EMP0000316',NULL,NULL,'Manmeet',NULL,'Singh','1992-03-11','Male','0','8897459307','0','manmeet.singh@sganalytics.com','manmeetsandhu0351@gmail.com','4633/24, Guru Nanak Wara, Putli Ghar, P.O Khalsa College',1,27,623,'Amritsar',143001,'4633/24, Guru Nanak Wara, Putli ghar, P.O Khalsa College, Amritsar 143001','0','FOAPS4251G','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,3,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(317,'1291','EMP0000317',NULL,NULL,'JAMES','T.','De CICCO III','1966-11-19','Male','0','0','0','jim.decicco@sganalytics.com','jdecicco66@gmail.com','23 Hidden Lake Drive',NULL,NULL,NULL,'North Brunswick',8902,'23 Hidden Lake Drive, North Brunswick, NJ 08902','0','NA','NA','Married',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,28,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(318,'1292','EMP0000318',NULL,NULL,'Swapnil',NULL,'Badgire','1993-05-17','Male','0','9422655805','0','swapnil.badgire@sganalytics.com','badgireswapnil@gmail.com','Vyankatesh Nivas, Yerme Nagar, Nr. DED College, Udgir',1,20,480,'Latur',413517,'S. No. 45/ A, Manthan Society, Somnath Nagar, Wadgaon Sheri, Pune 411014','0','BQKPB2258J','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,1),(319,'1293','EMP0000319',NULL,NULL,'Alay',NULL,'Nallulwar','1986-12-19','Male','0','8698982249','0','alay.nallulwar@sganalytics.com','nallulwar.alay@gmail.com','42739, Professor Quarters, Nr. Luft Restaurant, Opp Uni Boys hostel, Navrangpura',1,12,170,'Ahmedabad',0,'D-271, Kumar Priyadarshan, Nr. Balaji Temple, Balaji Chowk, Sus Pashan Road, Pashan, Pune 411021','0','AMJPN9378D','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,1),(320,'1295','EMP0000320',NULL,NULL,'Shwetank',NULL,'Dwivedi','1992-05-25','Male','7345','9811886880','5133','shwetank.dwivedi@sganalytics.com','cashwetank@gmail.com','83, GF2, Gohmuri',1,15,297,'Jamshedpur',0,'Rukminini,Sasanenagar, Hadapsar, Pune','0','BOFPD5272M','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,1),(321,'1296','EMP0000321',NULL,NULL,'Mahesh',NULL,'Nema','1990-09-20','Male','0','9752746160','0','mahesh.nema@sganalytics.com','maheshnema01@gmail.com','42, Naya Bazar 1, Mahatma Gandhi Ward',1,23,555,'Damoh',0,'42, Naya Bazar 1, Mahatma Gandhi Ward, Damoh, UP','0','ALIPN7746H','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,9,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(322,'1297','EMP0000322',NULL,NULL,'Sunayana',NULL,'Girme','1988-09-27','Female','0','9922009078','0','sunayana.girme@sganalytics.com','sunayana.girme@gmail.com','S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud',1,20,504,'Pune',411021,'S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud. Pune - 21','0','AQPPG7637Q','NA','Unmarried',1,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,1),(323,'1299','EMP0000323',NULL,NULL,'Tanushree',NULL,'Das','1988-04-02','Female','0','9985556541','0','tanushree.das@sganalytics.com','tanushreedas02@gmail.com','B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri, Pune - 411014','0','AYKPD6503H','NA','Married',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,6),(324,'1300','EMP0000324',NULL,NULL,'Manoj',NULL,'Kumar','1983-05-29','Male','0','9818093714','0','manoj.kumar@sganalytics.com','soumann@gmail.com','R2H-226, Street-7, Rajnagar-II, Palam',1,9,135,'New Delhi',0,'R2H-226, Street-7, Rajnagar-II, Palam , New Delhi','0','BDKPK27195','NA','Married',3,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:36','2017-08-04 03:41:36',NULL,NULL,NULL,NULL,NULL),(325,'1301','EMP0000325',NULL,NULL,'Vinayak',NULL,'Joshi','1990-01-06','Male','0','9821463765','0','vinayak.joshi@sganalytics.com','joshi.vinayak90@gmail.com','42875, B Wing, Sachin Society, Mithagar Road, Mulund (E)',1,20,486,'Mumbai',81,'5/20, B Wing, Sachin Society, Mithagar Road, Mulund ( E ), Mumbai - 81','0','AJVPJ0960C','NA','Unmarried',NULL,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,4,NULL,1,'2017-08-04 03:41:37','2017-08-04 03:41:37',NULL,NULL,NULL,NULL,NULL),(326,'1302','EMP0000326',NULL,NULL,'Amruta',NULL,'Patil','1989-04-14','Female','0','8805543726','0','amruta.patil@sganalytics.com','amrita_6patil@yahoo.co.in','Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa',1,20,504,'Pune',411036,'Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa, Pune 411036','0','BGJPP7156G','NA','Unmarried',4,5,1,NULL,'NA','NA','Active',NULL,NULL,1,1,8,NULL,1,'2017-08-04 03:41:37','