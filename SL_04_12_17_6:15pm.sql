-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
  `interest` tinyint(1) DEFAULT NULL,
  `rate` decimal(10,0) DEFAULT NULL,
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
INSERT INTO `banks` VALUES (1,'BANK OF INDIA',NULL,NULL,NULL,'2017-12-02 05:33:33','2017-12-02 05:33:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(2,'AB+',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(3,'B+',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(4,'O+',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(5,'A-',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(6,'B-',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(7,'O-',NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(8,'AB-',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(9,'A1B +VE',NULL,'2017-12-02 05:32:41','2017-12-02 05:32:41'),(10,'0+',NULL,'2017-12-02 05:32:43','2017-12-02 05:32:43');
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
INSERT INTO `companies` VALUES (1,NULL,'C_101','COM001','Sparkline Equipments Pvt.Ltd','Sparkline',1,'1234567890','','','','Pune',1,20,504,'Pune',418520,'','','www.sparklineequip.com',NULL,'2017-11-29 11:23:23','2017-11-29 11:23:23','spark.png','image/png',16132,'2017-11-29 11:23:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'CL_101','COMLOC001','Pune','vishal.h@indibasolutions.com','Pune','Pune',1,20,504,141110,'9874563210','2017-11-29 11:26:21','2017-11-29 11:26:21');
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
INSERT INTO `company_types` VALUES (1,'1001.0','Private Limited ',NULL,NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24'),(2,'1002.0','Limited Liability Partnership',NULL,NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24'),(3,'1003.0','Public Limited',NULL,NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `countries` VALUES (1,'IN','India','2017-11-29 10:31:33','2017-11-29 10:31:33');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-11-29 11:23:23','2017-11-29 11:23:23'),(2,'company_location',1,'2017-11-29 11:26:21','2017-11-29 11:26:21'),(3,'department',14,'2017-12-02 05:32:34','2017-12-02 05:32:42'),(4,'employee',126,'2017-12-02 05:32:34','2017-12-02 05:32:44');
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
INSERT INTO `degree_streams` VALUES (1,'1001.0','Aerospace',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(2,'1002.0','Archaeology',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(3,'1003.0','Asian language and culture',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(4,'1004.0','Automotive ',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(5,'1005.0','Chemical',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(6,'1006.0','Civil',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(7,'1007.0','Commerce',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(8,'1008.0','Computer Application',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(9,'1009.0','Computer Architecture',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(10,'1010.0','Computer Sicence',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(11,'1011.0','Creative Writing',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(12,'1012.0','Electrical',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(13,'1013.0','Electrical & Electronics',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(14,'1014.0','Human Resource',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(15,'1015.0',' Informaton Technology  ',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(16,'1016.0','Marine',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(17,'1017.0','Mathematics',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(18,'1018.0','Mechanical',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(19,'1019.0','Philosophy',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(20,'1020.0','Psychology',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(21,'1021.0','Robotics',NULL,NULL,'2017-11-29 10:31:30','2017-11-29 10:31:30'),(22,'1022.0','Saftey',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(23,'1023.0','Science',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(24,'1024.0','Textile',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(25,'1025.0','Theater:Design & Production',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degrees`
--

LOCK TABLES `degrees` WRITE;
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` VALUES (1,'1001.0','BCA ','Bachelor of Computer Application',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(2,'1002.0','BBA','Bachelor of Business Administration',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(3,'1003.0','B.Com ','Bachelor of Commerce   ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(4,'1004.0',' B.Sc ','Bachelor of Science ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(5,'1005.0','BA','Bachelor  of Arts  ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(6,'1006.0','BE','Bachelor of Engineering   ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(7,'1007.0','B.Tech','Bachelor of Technology',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(8,'1008.0','DCA','Diploma in Computer Application',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(9,'1009.0','ITI','Industial Training Institute',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(10,'1010.0','BSW','Bachelor  of Sociel Work',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(11,'1011.0','Polytechnic','Polytechnic',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(12,'1012.0','LL.B','Bachelor of Laws',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(13,'1013.0','BCM','Bachelor of computer management',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(14,'1014.0','BFA','Bachelor  of Fine Arts ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(15,'1015.0','BMS','Bachelor  of Management Study',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(16,'1016.0','BCS','Bachelor  of Computer Science',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(17,'1017.0','BBM','Bachelor  of Business Management',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(18,'1018.0','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(19,'1019.0','BHM','Bachelor  of Hotel Managemnet',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(20,'1020.0','B.Pharma','Bachachelor of Pharmacy',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(21,'1021.0','BS','Bachachelor of Science ',NULL,'2017-11-29 10:31:28','2017-11-29 10:31:28'),(22,'1022.0','CS','Compnay Secrectary',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(23,'1023.0','CA','Chartered Accountant',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(24,'1024.0','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(25,'1025.0','MCA','Master of Computer Application',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(26,'1026.0','MBA','Master of Business Administration',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(27,'1027.0','M.Com','Master of Commerce',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(28,'1028.0','M.Sc','Master of Science',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(29,'1029.0','MA','Master of Arts',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(30,'1030.0','ME','Master of Engineering',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(31,'1031.0','M.Tech','Master of Technology ',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(32,'1032.0','PGDCA','Post Grduate Diploma in computer Application',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(33,'1033.0','MSW','Master of SocielWork ',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(34,'1034.0','LL.M ','Master of Laws',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(35,'1035.0','MCM','Master of computer management',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(36,'1036.0','MFA','Master of Fine Arts ',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(37,'1037.0','MMS','Master of Management Studies',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(38,'1038.0','MCS','Matser of Computer Science',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(39,'1039.0','MBM','Master in Business Management',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(40,'1040.0','MJMC','Master of Journalism and Mass Communication',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(41,'1041.0','MHM','Master in Hotel Management ',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(42,'1042.0','M.Pharma',' Master of Pharmacy',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(43,'1043.0','MS',' Master of Science',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29'),(44,'1044.0','MD','Medicinae Doctor ',NULL,'2017-11-29 10:31:29','2017-11-29 10:31:29');
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
INSERT INTO `department_types` VALUES (1,'1001.0','Executive','Executive',NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24'),(2,'1002.0','Operation','Operation',NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24'),(3,'1003.0','Support','Support',NULL,'2017-11-29 10:31:24','2017-11-29 10:31:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,NULL,'DEPT001',NULL,'Service',NULL,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 05:32:34'),(2,1,NULL,'DEPT002',NULL,'I & C',NULL,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 05:32:34'),(3,1,NULL,'DEPT003',NULL,'Project',NULL,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 05:32:34'),(4,1,NULL,'DEPT004',NULL,'Commercial',NULL,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 05:32:34'),(5,1,NULL,'DEPT005',NULL,'Sales',NULL,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 05:32:35'),(6,1,NULL,'DEPT006',NULL,'Manufacturing',NULL,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 05:32:35'),(7,1,NULL,'DEPT007',NULL,'SCM',NULL,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 05:32:35'),(8,1,NULL,'DEPT008',NULL,'Design',NULL,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 05:32:35'),(9,1,NULL,'DEPT009',NULL,'IT',NULL,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 05:32:36'),(10,1,NULL,'DEPT010',NULL,'Finance',NULL,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 05:32:36'),(11,1,NULL,'DEPT011',NULL,'Quality',NULL,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 05:32:38'),(12,1,NULL,'DEPT012',NULL,'HR & Admin',NULL,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 05:32:39'),(13,1,NULL,'DEPT013',NULL,'Director',NULL,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 05:32:40'),(14,1,NULL,'DEPT014',NULL,'Safety',NULL,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 05:32:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-11-29 10:31:35','2017-11-29 10:31:35'),(2,1,NULL,'Port Blair','2017-11-29 10:31:35','2017-11-29 10:31:35'),(3,1,NULL,'Sawi','2017-11-29 10:31:35','2017-11-29 10:31:35'),(4,2,NULL,'Akividu','2017-11-29 10:31:35','2017-11-29 10:31:35'),(5,2,NULL,'Amalapuram','2017-11-29 10:31:35','2017-11-29 10:31:35'),(6,2,NULL,'Anantapur','2017-11-29 10:31:35','2017-11-29 10:31:35'),(7,2,NULL,'Andra','2017-11-29 10:31:35','2017-11-29 10:31:35'),(8,2,NULL,'Avanigadda','2017-11-29 10:31:35','2017-11-29 10:31:35'),(9,2,NULL,'Bapatla','2017-11-29 10:31:35','2017-11-29 10:31:35'),(10,2,NULL,'Bhimavaram','2017-11-29 10:31:35','2017-11-29 10:31:35'),(11,2,NULL,'Bobbili','2017-11-29 10:31:35','2017-11-29 10:31:35'),(12,2,NULL,'Chirala','2017-11-29 10:31:35','2017-11-29 10:31:35'),(13,2,NULL,'Chittoor','2017-11-29 10:31:35','2017-11-29 10:31:35'),(14,2,NULL,'Cumbum','2017-11-29 10:31:35','2017-11-29 10:31:35'),(15,2,NULL,'Darsi','2017-11-29 10:31:35','2017-11-29 10:31:35'),(16,2,NULL,'Dhone','2017-11-29 10:31:35','2017-11-29 10:31:35'),(17,2,NULL,'Eluru','2017-11-29 10:31:35','2017-11-29 10:31:35'),(18,2,NULL,'Gampalagudem','2017-11-29 10:31:35','2017-11-29 10:31:35'),(19,2,NULL,'Gannavaram','2017-11-29 10:31:35','2017-11-29 10:31:35'),(20,2,NULL,'Gorantla','2017-11-29 10:31:35','2017-11-29 10:31:35'),(21,2,NULL,'Gudivada','2017-11-29 10:31:35','2017-11-29 10:31:35'),(22,2,NULL,'Guntur','2017-11-29 10:31:35','2017-11-29 10:31:35'),(23,2,NULL,'Kadapa','2017-11-29 10:31:35','2017-11-29 10:31:35'),(24,2,NULL,'Kakinada','2017-11-29 10:31:35','2017-11-29 10:31:35'),(25,2,NULL,'Kanigiri','2017-11-29 10:31:36','2017-11-29 10:31:36'),(26,2,NULL,'Kavali','2017-11-29 10:31:36','2017-11-29 10:31:36'),(27,2,NULL,'Kovvur','2017-11-29 10:31:36','2017-11-29 10:31:36'),(28,2,NULL,'Kuppam','2017-11-29 10:31:36','2017-11-29 10:31:36'),(29,2,NULL,'Kurnool','2017-11-29 10:31:36','2017-11-29 10:31:36'),(30,2,NULL,'Machilipatnam','2017-11-29 10:31:36','2017-11-29 10:31:36'),(31,2,NULL,'Madanapalle','2017-11-29 10:31:36','2017-11-29 10:31:36'),(32,2,NULL,'Mahal','2017-11-29 10:31:36','2017-11-29 10:31:36'),(33,2,NULL,'Mandapeta','2017-11-29 10:31:36','2017-11-29 10:31:36'),(34,2,NULL,'Mangalagiri','2017-11-29 10:31:36','2017-11-29 10:31:36'),(35,2,NULL,'Markapur','2017-11-29 10:31:36','2017-11-29 10:31:36'),(36,2,NULL,'Medarametla','2017-11-29 10:31:36','2017-11-29 10:31:36'),(37,2,NULL,'Muddanuru','2017-11-29 10:31:36','2017-11-29 10:31:36'),(38,2,NULL,'Nagari','2017-11-29 10:31:36','2017-11-29 10:31:36'),(39,2,NULL,'Nandigama','2017-11-29 10:31:36','2017-11-29 10:31:36'),(40,2,NULL,'Nandyal','2017-11-29 10:31:36','2017-11-29 10:31:36'),(41,2,NULL,'Narasaraopet','2017-11-29 10:31:36','2017-11-29 10:31:36'),(42,2,NULL,'Nellore','2017-11-29 10:31:36','2017-11-29 10:31:36'),(43,2,NULL,'Nuzvid','2017-11-29 10:31:36','2017-11-29 10:31:36'),(44,2,NULL,'Ongole','2017-11-29 10:31:36','2017-11-29 10:31:36'),(45,2,NULL,'Pakala','2017-11-29 10:31:36','2017-11-29 10:31:36'),(46,2,NULL,'Peddapuram','2017-11-29 10:31:36','2017-11-29 10:31:36'),(47,2,NULL,'Piduguralla','2017-11-29 10:31:36','2017-11-29 10:31:36'),(48,2,NULL,'Pileru','2017-11-29 10:31:36','2017-11-29 10:31:36'),(49,2,NULL,'Pithapuram','2017-11-29 10:31:36','2017-11-29 10:31:36'),(50,2,NULL,'Proddatur','2017-11-29 10:31:37','2017-11-29 10:31:37'),(51,2,NULL,'Puttur','2017-11-29 10:31:37','2017-11-29 10:31:37'),(52,2,NULL,'Rajahmundry','2017-11-29 10:31:37','2017-11-29 10:31:37'),(53,2,NULL,'Ramapuram','2017-11-29 10:31:37','2017-11-29 10:31:37'),(54,2,NULL,'Ramavaram','2017-11-29 10:31:37','2017-11-29 10:31:37'),(55,2,NULL,'Singarayakonda','2017-11-29 10:31:37','2017-11-29 10:31:37'),(56,2,NULL,'Srikakulam','2017-11-29 10:31:37','2017-11-29 10:31:37'),(57,2,NULL,'Tadepallegudem','2017-11-29 10:31:37','2017-11-29 10:31:37'),(58,2,NULL,'Tanuku','2017-11-29 10:31:37','2017-11-29 10:31:37'),(59,2,NULL,'Thenali','2017-11-29 10:31:37','2017-11-29 10:31:37'),(60,2,NULL,'Tirumala','2017-11-29 10:31:37','2017-11-29 10:31:37'),(61,2,NULL,'Tirumala - Tirupati','2017-11-29 10:31:37','2017-11-29 10:31:37'),(62,2,NULL,'Vijayawada','2017-11-29 10:31:37','2017-11-29 10:31:37'),(63,2,NULL,'Vinukonda','2017-11-29 10:31:37','2017-11-29 10:31:37'),(64,2,NULL,'Visakhapatnam','2017-11-29 10:31:37','2017-11-29 10:31:37'),(65,2,NULL,'Vizianagaram','2017-11-29 10:31:37','2017-11-29 10:31:37'),(66,2,NULL,'Yanam','2017-11-29 10:31:37','2017-11-29 10:31:37'),(67,3,NULL,'Hong','2017-11-29 10:31:37','2017-11-29 10:31:37'),(68,3,NULL,'Itanagar','2017-11-29 10:31:37','2017-11-29 10:31:37'),(69,4,NULL,'Arunachal','2017-11-29 10:31:37','2017-11-29 10:31:37'),(70,4,NULL,'Barpeta','2017-11-29 10:31:37','2017-11-29 10:31:37'),(71,4,NULL,'Bhandari','2017-11-29 10:31:37','2017-11-29 10:31:37'),(72,4,NULL,'Dhubri','2017-11-29 10:31:37','2017-11-29 10:31:37'),(73,4,NULL,'Dibrugarh','2017-11-29 10:31:37','2017-11-29 10:31:37'),(74,4,NULL,'Golaghat','2017-11-29 10:31:37','2017-11-29 10:31:37'),(75,4,NULL,'Goshaingaon','2017-11-29 10:31:38','2017-11-29 10:31:38'),(76,4,NULL,'Guwahati','2017-11-29 10:31:38','2017-11-29 10:31:38'),(77,4,NULL,'Jorhat','2017-11-29 10:31:38','2017-11-29 10:31:38'),(78,4,NULL,'Karimganj','2017-11-29 10:31:38','2017-11-29 10:31:38'),(79,4,NULL,'Kokrajhar','2017-11-29 10:31:38','2017-11-29 10:31:38'),(80,4,NULL,'Lala','2017-11-29 10:31:38','2017-11-29 10:31:38'),(81,4,NULL,'Nalbari','2017-11-29 10:31:38','2017-11-29 10:31:38'),(82,4,NULL,'Namrup','2017-11-29 10:31:38','2017-11-29 10:31:38'),(83,4,NULL,'Nazira','2017-11-29 10:31:38','2017-11-29 10:31:38'),(84,4,NULL,'North Lakhimpur','2017-11-29 10:31:38','2017-11-29 10:31:38'),(85,4,NULL,'Powai','2017-11-29 10:31:38','2017-11-29 10:31:38'),(86,4,NULL,'Sibsagar','2017-11-29 10:31:38','2017-11-29 10:31:38'),(87,4,NULL,'Silchar','2017-11-29 10:31:38','2017-11-29 10:31:38'),(88,4,NULL,'Tezpur','2017-11-29 10:31:38','2017-11-29 10:31:38'),(89,4,NULL,'Tinsukia','2017-11-29 10:31:38','2017-11-29 10:31:38'),(90,4,NULL,'Ulubari','2017-11-29 10:31:38','2017-11-29 10:31:38'),(91,5,NULL,'Banka','2017-11-29 10:31:38','2017-11-29 10:31:38'),(92,5,NULL,'Begusarai','2017-11-29 10:31:38','2017-11-29 10:31:38'),(93,5,NULL,'Bhagalpur','2017-11-29 10:31:38','2017-11-29 10:31:38'),(94,5,NULL,'Bhawanipur','2017-11-29 10:31:38','2017-11-29 10:31:38'),(95,5,NULL,'Bihar Sharif','2017-11-29 10:31:38','2017-11-29 10:31:38'),(96,5,NULL,'Chandan','2017-11-29 10:31:38','2017-11-29 10:31:38'),(97,5,NULL,'Darbhanga','2017-11-29 10:31:38','2017-11-29 10:31:38'),(98,5,NULL,'Dhaka','2017-11-29 10:31:38','2017-11-29 10:31:38'),(99,5,NULL,'Gaya','2017-11-29 10:31:38','2017-11-29 10:31:38'),(100,5,NULL,'Jaynagar','2017-11-29 10:31:38','2017-11-29 10:31:38'),(101,5,NULL,'Jha Jha','2017-11-29 10:31:39','2017-11-29 10:31:39'),(102,5,NULL,'Kamat','2017-11-29 10:31:39','2017-11-29 10:31:39'),(103,5,NULL,'Motihari','2017-11-29 10:31:39','2017-11-29 10:31:39'),(104,5,NULL,'Munger','2017-11-29 10:31:39','2017-11-29 10:31:39'),(105,5,NULL,'Muzaffarpur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(106,5,NULL,'Patna','2017-11-29 10:31:39','2017-11-29 10:31:39'),(107,5,NULL,'Purnea','2017-11-29 10:31:39','2017-11-29 10:31:39'),(108,5,NULL,'Pusa','2017-11-29 10:31:39','2017-11-29 10:31:39'),(109,5,NULL,'Raxaul','2017-11-29 10:31:39','2017-11-29 10:31:39'),(110,5,NULL,'Sakri','2017-11-29 10:31:39','2017-11-29 10:31:39'),(111,5,NULL,'Samastipur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(112,6,NULL,'Chandigarh','2017-11-29 10:31:39','2017-11-29 10:31:39'),(113,7,NULL,'Ambikapur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(114,7,NULL,'Bemetara','2017-11-29 10:31:39','2017-11-29 10:31:39'),(115,7,NULL,'Bhatapara','2017-11-29 10:31:39','2017-11-29 10:31:39'),(116,7,NULL,'Bhilai','2017-11-29 10:31:39','2017-11-29 10:31:39'),(117,7,NULL,'Bilaspur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(118,7,NULL,'Champa','2017-11-29 10:31:39','2017-11-29 10:31:39'),(119,7,NULL,'Dhamtari','2017-11-29 10:31:39','2017-11-29 10:31:39'),(120,7,NULL,'Durg','2017-11-29 10:31:39','2017-11-29 10:31:39'),(121,7,NULL,'Jagdalpur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(122,7,NULL,'Janjgir','2017-11-29 10:31:39','2017-11-29 10:31:39'),(123,7,NULL,'Koni','2017-11-29 10:31:39','2017-11-29 10:31:39'),(124,7,NULL,'Korba','2017-11-29 10:31:39','2017-11-29 10:31:39'),(125,7,NULL,'Kumhari','2017-11-29 10:31:39','2017-11-29 10:31:39'),(126,7,NULL,'Lanka','2017-11-29 10:31:39','2017-11-29 10:31:39'),(127,7,NULL,'Mohala','2017-11-29 10:31:39','2017-11-29 10:31:39'),(128,7,NULL,'Raigarh','2017-11-29 10:31:39','2017-11-29 10:31:39'),(129,7,NULL,'Raipur','2017-11-29 10:31:39','2017-11-29 10:31:39'),(130,7,NULL,'Sukma','2017-11-29 10:31:40','2017-11-29 10:31:40'),(131,8,NULL,'Daman','2017-11-29 10:31:40','2017-11-29 10:31:40'),(132,9,NULL,'Alipur','2017-11-29 10:31:40','2017-11-29 10:31:40'),(133,9,NULL,'Bawana','2017-11-29 10:31:40','2017-11-29 10:31:40'),(134,9,NULL,'Connaught Place','2017-11-29 10:31:40','2017-11-29 10:31:40'),(135,9,NULL,'Delhi','2017-11-29 10:31:40','2017-11-29 10:31:40'),(136,9,NULL,'Kalkaji Devi','2017-11-29 10:31:40','2017-11-29 10:31:40'),(137,9,NULL,'Narela','2017-11-29 10:31:40','2017-11-29 10:31:40'),(138,9,NULL,'New Delhi','2017-11-29 10:31:40','2017-11-29 10:31:40'),(139,9,NULL,'Shahdara','2017-11-29 10:31:40','2017-11-29 10:31:40'),(140,10,NULL,'Amal','2017-11-29 10:31:40','2017-11-29 10:31:40'),(141,10,NULL,'Silvassa','2017-11-29 10:31:40','2017-11-29 10:31:40'),(142,11,NULL,'Aldona','2017-11-29 10:31:40','2017-11-29 10:31:40'),(143,11,NULL,'Arpora','2017-11-29 10:31:40','2017-11-29 10:31:40'),(144,11,NULL,'Assagao','2017-11-29 10:31:40','2017-11-29 10:31:40'),(145,11,NULL,'Bambolim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(146,11,NULL,'Betalbatim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(147,11,NULL,'Betim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(148,11,NULL,'Calangute','2017-11-29 10:31:40','2017-11-29 10:31:40'),(149,11,NULL,'Candolim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(150,11,NULL,'Caranzalem','2017-11-29 10:31:40','2017-11-29 10:31:40'),(151,11,NULL,'Chicalim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(152,11,NULL,'Cuncolim','2017-11-29 10:31:40','2017-11-29 10:31:40'),(153,11,NULL,'Curchorem','2017-11-29 10:31:40','2017-11-29 10:31:40'),(154,11,NULL,'Dicholi','2017-11-29 10:31:40','2017-11-29 10:31:40'),(155,11,NULL,'Dona Paula','2017-11-29 10:31:41','2017-11-29 10:31:41'),(156,11,NULL,'Goa','2017-11-29 10:31:41','2017-11-29 10:31:41'),(157,11,NULL,'Madgaon','2017-11-29 10:31:41','2017-11-29 10:31:41'),(158,11,NULL,'Marmagao','2017-11-29 10:31:41','2017-11-29 10:31:41'),(159,11,NULL,'Navelim','2017-11-29 10:31:41','2017-11-29 10:31:41'),(160,11,NULL,'Panjim','2017-11-29 10:31:41','2017-11-29 10:31:41'),(161,11,NULL,'Parra','2017-11-29 10:31:41','2017-11-29 10:31:41'),(162,11,NULL,'Ponda','2017-11-29 10:31:41','2017-11-29 10:31:41'),(163,11,NULL,'Quepem','2017-11-29 10:31:41','2017-11-29 10:31:41'),(164,11,NULL,'Saligao','2017-11-29 10:31:41','2017-11-29 10:31:41'),(165,11,NULL,'Sanquelim','2017-11-29 10:31:41','2017-11-29 10:31:41'),(166,11,NULL,'Solim','2017-11-29 10:31:41','2017-11-29 10:31:41'),(167,11,NULL,'Vainguinim','2017-11-29 10:31:41','2017-11-29 10:31:41'),(168,11,NULL,'Vasco','2017-11-29 10:31:41','2017-11-29 10:31:41'),(169,11,NULL,'Verna','2017-11-29 10:31:41','2017-11-29 10:31:41'),(170,12,NULL,'Ahmedabad','2017-11-29 10:31:41','2017-11-29 10:31:41'),(171,12,NULL,'Amreli','2017-11-29 10:31:41','2017-11-29 10:31:41'),(172,12,NULL,'Amroli','2017-11-29 10:31:41','2017-11-29 10:31:41'),(173,12,NULL,'Anand','2017-11-29 10:31:41','2017-11-29 10:31:41'),(174,12,NULL,'Ankleshwar','2017-11-29 10:31:41','2017-11-29 10:31:41'),(175,12,NULL,'Antapur','2017-11-29 10:31:41','2017-11-29 10:31:41'),(176,12,NULL,'Bardoli','2017-11-29 10:31:41','2017-11-29 10:31:41'),(177,12,NULL,'Basu','2017-11-29 10:31:41','2017-11-29 10:31:41'),(178,12,NULL,'Bhadath','2017-11-29 10:31:41','2017-11-29 10:31:41'),(179,12,NULL,'Bharuch','2017-11-29 10:31:41','2017-11-29 10:31:41'),(180,12,NULL,'Bhavnagar','2017-11-29 10:31:41','2017-11-29 10:31:41'),(181,12,NULL,'Bhuj','2017-11-29 10:31:42','2017-11-29 10:31:42'),(182,12,NULL,'Bilimora','2017-11-29 10:31:42','2017-11-29 10:31:42'),(183,12,NULL,'Chhota Udepur','2017-11-29 10:31:42','2017-11-29 10:31:42'),(184,12,NULL,'Dahod','2017-11-29 10:31:42','2017-11-29 10:31:42'),(185,12,NULL,'Dewan','2017-11-29 10:31:42','2017-11-29 10:31:42'),(186,12,NULL,'Dhansura','2017-11-29 10:31:42','2017-11-29 10:31:42'),(187,12,NULL,'Dhrol','2017-11-29 10:31:42','2017-11-29 10:31:42'),(188,12,NULL,'Dwarka','2017-11-29 10:31:42','2017-11-29 10:31:42'),(189,12,NULL,'Gandhidham','2017-11-29 10:31:42','2017-11-29 10:31:42'),(190,12,NULL,'Gandhinagar','2017-11-29 10:31:42','2017-11-29 10:31:42'),(191,12,NULL,'Ghana','2017-11-29 10:31:42','2017-11-29 10:31:42'),(192,12,NULL,'Godhra','2017-11-29 10:31:42','2017-11-29 10:31:42'),(193,12,NULL,'Himatnagar','2017-11-29 10:31:42','2017-11-29 10:31:42'),(194,12,NULL,'Jalalpur','2017-11-29 10:31:42','2017-11-29 10:31:42'),(195,12,NULL,'Jamnagar','2017-11-29 10:31:42','2017-11-29 10:31:42'),(196,12,NULL,'Junagadh','2017-11-29 10:31:42','2017-11-29 10:31:42'),(197,12,NULL,'Kalol','2017-11-29 10:31:42','2017-11-29 10:31:42'),(198,12,NULL,'Karamsad','2017-11-29 10:31:42','2017-11-29 10:31:42'),(199,12,NULL,'Keshod','2017-11-29 10:31:42','2017-11-29 10:31:42'),(200,12,NULL,'Khambhat','2017-11-29 10:31:42','2017-11-29 10:31:42'),(201,12,NULL,'Kheda','2017-11-29 10:31:42','2017-11-29 10:31:42'),(202,12,NULL,'Khergam','2017-11-29 10:31:42','2017-11-29 10:31:42'),(203,12,NULL,'Kosamba','2017-11-29 10:31:42','2017-11-29 10:31:42'),(204,12,NULL,'Mahesana','2017-11-29 10:31:42','2017-11-29 10:31:42'),(205,12,NULL,'Malpur','2017-11-29 10:31:42','2017-11-29 10:31:42'),(206,12,NULL,'Mandvi','2017-11-29 10:31:42','2017-11-29 10:31:42'),(207,12,NULL,'Matar','2017-11-29 10:31:42','2017-11-29 10:31:42'),(208,12,NULL,'Mithapur','2017-11-29 10:31:42','2017-11-29 10:31:42'),(209,12,NULL,'Modasa','2017-11-29 10:31:42','2017-11-29 10:31:42'),(210,12,NULL,'Morvi','2017-11-29 10:31:43','2017-11-29 10:31:43'),(211,12,NULL,'Mundra','2017-11-29 10:31:43','2017-11-29 10:31:43'),(212,12,NULL,'Nadiad','2017-11-29 10:31:43','2017-11-29 10:31:43'),(213,12,NULL,'Nagwa','2017-11-29 10:31:43','2017-11-29 10:31:43'),(214,12,NULL,'Navsari','2017-11-29 10:31:43','2017-11-29 10:31:43'),(215,12,NULL,'Patan','2017-11-29 10:31:43','2017-11-29 10:31:43'),(216,12,NULL,'Petlad','2017-11-29 10:31:43','2017-11-29 10:31:43'),(217,12,NULL,'Porbandar','2017-11-29 10:31:43','2017-11-29 10:31:43'),(218,12,NULL,'Rajkot','2017-11-29 10:31:43','2017-11-29 10:31:43'),(219,12,NULL,'Rander','2017-11-29 10:31:43','2017-11-29 10:31:43'),(220,12,NULL,'Rawal','2017-11-29 10:31:43','2017-11-29 10:31:43'),(221,12,NULL,'Sachin','2017-11-29 10:31:43','2017-11-29 10:31:43'),(222,12,NULL,'Sami','2017-11-29 10:31:43','2017-11-29 10:31:43'),(223,12,NULL,'Sanand','2017-11-29 10:31:43','2017-11-29 10:31:43'),(224,12,NULL,'Somnath','2017-11-29 10:31:43','2017-11-29 10:31:43'),(225,12,NULL,'Surendranagar','2017-11-29 10:31:43','2017-11-29 10:31:43'),(226,12,NULL,'Thasra','2017-11-29 10:31:43','2017-11-29 10:31:43'),(227,12,NULL,'Vadodara','2017-11-29 10:31:43','2017-11-29 10:31:43'),(228,12,NULL,'Vadodra','2017-11-29 10:31:43','2017-11-29 10:31:43'),(229,12,NULL,'Valsad','2017-11-29 10:31:43','2017-11-29 10:31:43'),(230,12,NULL,'Vapi','2017-11-29 10:31:43','2017-11-29 10:31:43'),(231,12,NULL,'Vijapur','2017-11-29 10:31:43','2017-11-29 10:31:43'),(232,12,NULL,'Visnagar','2017-11-29 10:31:43','2017-11-29 10:31:43'),(233,13,NULL,'Bhawan','2017-11-29 10:31:43','2017-11-29 10:31:43'),(234,13,NULL,'Bilaspur','2017-11-29 10:31:44','2017-11-29 10:31:44'),(235,13,NULL,'Chamba','2017-11-29 10:31:44','2017-11-29 10:31:44'),(236,13,NULL,'Dharamsala','2017-11-29 10:31:44','2017-11-29 10:31:44'),(237,13,NULL,'Dharmpur','2017-11-29 10:31:44','2017-11-29 10:31:44'),(238,13,NULL,'Hamirpur','2017-11-29 10:31:44','2017-11-29 10:31:44'),(239,13,NULL,'Hari','2017-11-29 10:31:44','2017-11-29 10:31:44'),(240,13,NULL,'Kalka','2017-11-29 10:31:44','2017-11-29 10:31:44'),(241,13,NULL,'Kangra','2017-11-29 10:31:44','2017-11-29 10:31:44'),(242,13,NULL,'Kumar','2017-11-29 10:31:44','2017-11-29 10:31:44'),(243,13,NULL,'Manali','2017-11-29 10:31:44','2017-11-29 10:31:44'),(244,13,NULL,'Mandi','2017-11-29 10:31:44','2017-11-29 10:31:44'),(245,13,NULL,'Mani','2017-11-29 10:31:44','2017-11-29 10:31:44'),(246,13,NULL,'Mashobra','2017-11-29 10:31:44','2017-11-29 10:31:44'),(247,13,NULL,'Nalagarh','2017-11-29 10:31:44','2017-11-29 10:31:44'),(248,13,NULL,'Nehra','2017-11-29 10:31:44','2017-11-29 10:31:44'),(249,13,NULL,'Nurpur','2017-11-29 10:31:44','2017-11-29 10:31:44'),(250,13,NULL,'Palampur','2017-11-29 10:31:44','2017-11-29 10:31:44'),(251,13,NULL,'Paonta Sahib','2017-11-29 10:31:44','2017-11-29 10:31:44'),(252,13,NULL,'Shimla','2017-11-29 10:31:44','2017-11-29 10:31:44'),(253,13,NULL,'Solan','2017-11-29 10:31:44','2017-11-29 10:31:44'),(254,14,NULL,'Ambala','2017-11-29 10:31:44','2017-11-29 10:31:44'),(255,14,NULL,'Aurangabad','2017-11-29 10:31:44','2017-11-29 10:31:44'),(256,14,NULL,'Bahadurgarh','2017-11-29 10:31:44','2017-11-29 10:31:44'),(257,14,NULL,'Ballabgarh','2017-11-29 10:31:44','2017-11-29 10:31:44'),(258,14,NULL,'Bhiwani','2017-11-29 10:31:44','2017-11-29 10:31:44'),(259,14,NULL,'Budha','2017-11-29 10:31:44','2017-11-29 10:31:44'),(260,14,NULL,'Chhachhrauli','2017-11-29 10:31:44','2017-11-29 10:31:44'),(261,14,NULL,'Faridabad','2017-11-29 10:31:45','2017-11-29 10:31:45'),(262,14,NULL,'Fatehabad','2017-11-29 10:31:45','2017-11-29 10:31:45'),(263,14,NULL,'Ganga','2017-11-29 10:31:45','2017-11-29 10:31:45'),(264,14,NULL,'Gohana','2017-11-29 10:31:45','2017-11-29 10:31:45'),(265,14,NULL,'Gurgaon','2017-11-29 10:31:45','2017-11-29 10:31:45'),(266,14,NULL,'Hansi','2017-11-29 10:31:45','2017-11-29 10:31:45'),(267,14,NULL,'Haryana','2017-11-29 10:31:45','2017-11-29 10:31:45'),(268,14,NULL,'Hisar','2017-11-29 10:31:45','2017-11-29 10:31:45'),(269,14,NULL,'Indraprast','2017-11-29 10:31:45','2017-11-29 10:31:45'),(270,14,NULL,'Jhajjar','2017-11-29 10:31:45','2017-11-29 10:31:45'),(271,14,NULL,'Jind','2017-11-29 10:31:45','2017-11-29 10:31:45'),(272,14,NULL,'Kaithal','2017-11-29 10:31:45','2017-11-29 10:31:45'),(273,14,NULL,'Kalra','2017-11-29 10:31:45','2017-11-29 10:31:45'),(274,14,NULL,'Karnal','2017-11-29 10:31:45','2017-11-29 10:31:45'),(275,14,NULL,'Kaul','2017-11-29 10:31:45','2017-11-29 10:31:45'),(276,14,NULL,'Kotian','2017-11-29 10:31:45','2017-11-29 10:31:45'),(277,14,NULL,'Ladwa','2017-11-29 10:31:45','2017-11-29 10:31:45'),(278,14,NULL,'Narnaul','2017-11-29 10:31:45','2017-11-29 10:31:45'),(279,14,NULL,'Nilokheri','2017-11-29 10:31:45','2017-11-29 10:31:45'),(280,14,NULL,'Odhan','2017-11-29 10:31:45','2017-11-29 10:31:45'),(281,14,NULL,'Palwal','2017-11-29 10:31:45','2017-11-29 10:31:45'),(282,14,NULL,'Panipat','2017-11-29 10:31:45','2017-11-29 10:31:45'),(283,14,NULL,'Pehowa','2017-11-29 10:31:45','2017-11-29 10:31:45'),(284,14,NULL,'Rewari','2017-11-29 10:31:45','2017-11-29 10:31:45'),(285,14,NULL,'Rohtak','2017-11-29 10:31:45','2017-11-29 10:31:45'),(286,14,NULL,'Saha','2017-11-29 10:31:46','2017-11-29 10:31:46'),(287,14,NULL,'Shahabad','2017-11-29 10:31:46','2017-11-29 10:31:46'),(288,14,NULL,'Sirsa','2017-11-29 10:31:46','2017-11-29 10:31:46'),(289,14,NULL,'Sodhi','2017-11-29 10:31:46','2017-11-29 10:31:46'),(290,14,NULL,'Sonipat','2017-11-29 10:31:46','2017-11-29 10:31:46'),(291,14,NULL,'Tohana','2017-11-29 10:31:46','2017-11-29 10:31:46'),(292,14,NULL,'Yamunanagar','2017-11-29 10:31:46','2017-11-29 10:31:46'),(293,15,NULL,'Bokaro','2017-11-29 10:31:46','2017-11-29 10:31:46'),(294,15,NULL,'Dhanbad','2017-11-29 10:31:46','2017-11-29 10:31:46'),(295,15,NULL,'Dumka','2017-11-29 10:31:46','2017-11-29 10:31:46'),(296,15,NULL,'Hazaribagh','2017-11-29 10:31:46','2017-11-29 10:31:46'),(297,15,NULL,'Jamshedpur','2017-11-29 10:31:46','2017-11-29 10:31:46'),(298,15,NULL,'Mahulia','2017-11-29 10:31:46','2017-11-29 10:31:46'),(299,15,NULL,'Ramgarh','2017-11-29 10:31:46','2017-11-29 10:31:46'),(300,15,NULL,'Ranchi','2017-11-29 10:31:46','2017-11-29 10:31:46'),(301,16,NULL,'Anantnag','2017-11-29 10:31:46','2017-11-29 10:31:46'),(302,16,NULL,'Arch','2017-11-29 10:31:46','2017-11-29 10:31:46'),(303,16,NULL,'Bala','2017-11-29 10:31:46','2017-11-29 10:31:46'),(304,16,NULL,'Bawan','2017-11-29 10:31:46','2017-11-29 10:31:46'),(305,16,NULL,'Gold','2017-11-29 10:31:46','2017-11-29 10:31:46'),(306,16,NULL,'Jammu','2017-11-29 10:31:46','2017-11-29 10:31:46'),(307,16,NULL,'Kargil','2017-11-29 10:31:46','2017-11-29 10:31:46'),(308,16,NULL,'Kathua','2017-11-29 10:31:46','2017-11-29 10:31:46'),(309,16,NULL,'Katra','2017-11-29 10:31:46','2017-11-29 10:31:46'),(310,16,NULL,'Kundan','2017-11-29 10:31:46','2017-11-29 10:31:46'),(311,16,NULL,'Markal','2017-11-29 10:31:46','2017-11-29 10:31:46'),(312,16,NULL,'Nila','2017-11-29 10:31:47','2017-11-29 10:31:47'),(313,16,NULL,'Pahalgam','2017-11-29 10:31:47','2017-11-29 10:31:47'),(314,16,NULL,'Patel','2017-11-29 10:31:47','2017-11-29 10:31:47'),(315,16,NULL,'Raju','2017-11-29 10:31:47','2017-11-29 10:31:47'),(316,16,NULL,'Ranjan','2017-11-29 10:31:47','2017-11-29 10:31:47'),(317,16,NULL,'Ring','2017-11-29 10:31:47','2017-11-29 10:31:47'),(318,16,NULL,'Srinagar','2017-11-29 10:31:47','2017-11-29 10:31:47'),(319,16,NULL,'Suman','2017-11-29 10:31:47','2017-11-29 10:31:47'),(320,17,NULL,'Bagalkot','2017-11-29 10:31:47','2017-11-29 10:31:47'),(321,17,NULL,'Bangalore','2017-11-29 10:31:47','2017-11-29 10:31:47'),(322,17,NULL,'Belgaum','2017-11-29 10:31:47','2017-11-29 10:31:47'),(323,17,NULL,'Bellare','2017-11-29 10:31:47','2017-11-29 10:31:47'),(324,17,NULL,'Bellary','2017-11-29 10:31:47','2017-11-29 10:31:47'),(325,17,NULL,'Bhadravati','2017-11-29 10:31:47','2017-11-29 10:31:47'),(326,17,NULL,'Bhatkal','2017-11-29 10:31:47','2017-11-29 10:31:47'),(327,17,NULL,'Bidar','2017-11-29 10:31:47','2017-11-29 10:31:47'),(328,17,NULL,'Bijapur','2017-11-29 10:31:47','2017-11-29 10:31:47'),(329,17,NULL,'Channapatna','2017-11-29 10:31:47','2017-11-29 10:31:47'),(330,17,NULL,'Chikmagalūr','2017-11-29 10:31:47','2017-11-29 10:31:47'),(331,17,NULL,'Chikodi','2017-11-29 10:31:47','2017-11-29 10:31:47'),(332,17,NULL,'Chintamani','2017-11-29 10:31:47','2017-11-29 10:31:47'),(333,17,NULL,'Chitradurga','2017-11-29 10:31:47','2017-11-29 10:31:47'),(334,17,NULL,'Davangere','2017-11-29 10:31:47','2017-11-29 10:31:47'),(335,17,NULL,'Dharwad','2017-11-29 10:31:47','2017-11-29 10:31:47'),(336,17,NULL,'Gadag','2017-11-29 10:31:47','2017-11-29 10:31:47'),(337,17,NULL,'Gulbarga','2017-11-29 10:31:47','2017-11-29 10:31:47'),(338,17,NULL,'Hadadi','2017-11-29 10:31:47','2017-11-29 10:31:47'),(339,17,NULL,'Hassan','2017-11-29 10:31:48','2017-11-29 10:31:48'),(340,17,NULL,'Haveri','2017-11-29 10:31:48','2017-11-29 10:31:48'),(341,17,NULL,'Hira','2017-11-29 10:31:48','2017-11-29 10:31:48'),(342,17,NULL,'Hiriyur','2017-11-29 10:31:48','2017-11-29 10:31:48'),(343,17,NULL,'Honavar','2017-11-29 10:31:48','2017-11-29 10:31:48'),(344,17,NULL,'Hospet','2017-11-29 10:31:48','2017-11-29 10:31:48'),(345,17,NULL,'Hubli','2017-11-29 10:31:48','2017-11-29 10:31:48'),(346,17,NULL,'Karwar','2017-11-29 10:31:48','2017-11-29 10:31:48'),(347,17,NULL,'Kolar','2017-11-29 10:31:48','2017-11-29 10:31:48'),(348,17,NULL,'Kollegal','2017-11-29 10:31:48','2017-11-29 10:31:48'),(349,17,NULL,'Koppal','2017-11-29 10:31:48','2017-11-29 10:31:48'),(350,17,NULL,'Kushalnagar','2017-11-29 10:31:48','2017-11-29 10:31:48'),(351,17,NULL,'Madikeri','2017-11-29 10:31:48','2017-11-29 10:31:48'),(352,17,NULL,'Mandya','2017-11-29 10:31:48','2017-11-29 10:31:48'),(353,17,NULL,'Mangalore','2017-11-29 10:31:48','2017-11-29 10:31:48'),(354,17,NULL,'Manipala','2017-11-29 10:31:48','2017-11-29 10:31:48'),(355,17,NULL,'Mundgod','2017-11-29 10:31:48','2017-11-29 10:31:48'),(356,17,NULL,'Mysore','2017-11-29 10:31:48','2017-11-29 10:31:48'),(357,17,NULL,'Nandi','2017-11-29 10:31:48','2017-11-29 10:31:48'),(358,17,NULL,'Puttur','2017-11-29 10:31:48','2017-11-29 10:31:48'),(359,17,NULL,'Raichur','2017-11-29 10:31:48','2017-11-29 10:31:48'),(360,17,NULL,'Ramanagaram','2017-11-29 10:31:48','2017-11-29 10:31:48'),(361,17,NULL,'Sagar','2017-11-29 10:31:48','2017-11-29 10:31:48'),(362,17,NULL,'Sandur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(363,17,NULL,'Sangam','2017-11-29 10:31:49','2017-11-29 10:31:49'),(364,17,NULL,'Shanti Grama','2017-11-29 10:31:49','2017-11-29 10:31:49'),(365,17,NULL,'Shimoga','2017-11-29 10:31:49','2017-11-29 10:31:49'),(366,17,NULL,'Sirsi','2017-11-29 10:31:49','2017-11-29 10:31:49'),(367,17,NULL,'Siruguppa','2017-11-29 10:31:49','2017-11-29 10:31:49'),(368,17,NULL,'Someshwar','2017-11-29 10:31:49','2017-11-29 10:31:49'),(369,17,NULL,'Tiptur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(370,17,NULL,'Tumkūr','2017-11-29 10:31:49','2017-11-29 10:31:49'),(371,17,NULL,'Udupi','2017-11-29 10:31:49','2017-11-29 10:31:49'),(372,17,NULL,'Yadgir','2017-11-29 10:31:49','2017-11-29 10:31:49'),(373,18,NULL,'Alanallur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(374,18,NULL,'Alappuzha','2017-11-29 10:31:49','2017-11-29 10:31:49'),(375,18,NULL,'Aluva','2017-11-29 10:31:49','2017-11-29 10:31:49'),(376,18,NULL,'Anchal','2017-11-29 10:31:49','2017-11-29 10:31:49'),(377,18,NULL,'Angadipuram','2017-11-29 10:31:49','2017-11-29 10:31:49'),(378,18,NULL,'Aranmula','2017-11-29 10:31:49','2017-11-29 10:31:49'),(379,18,NULL,'Attingal','2017-11-29 10:31:49','2017-11-29 10:31:49'),(380,18,NULL,'Changanacheri','2017-11-29 10:31:49','2017-11-29 10:31:49'),(381,18,NULL,'Chengannur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(382,18,NULL,'Chittur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(383,18,NULL,'Edavanna','2017-11-29 10:31:49','2017-11-29 10:31:49'),(384,18,NULL,'Ernakulam','2017-11-29 10:31:49','2017-11-29 10:31:49'),(385,18,NULL,'Guruvayur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(386,18,NULL,'Idukki','2017-11-29 10:31:49','2017-11-29 10:31:49'),(387,18,NULL,'Irinjalakuda','2017-11-29 10:31:49','2017-11-29 10:31:49'),(388,18,NULL,'Kaladi','2017-11-29 10:31:49','2017-11-29 10:31:49'),(389,18,NULL,'Kalpetta','2017-11-29 10:31:49','2017-11-29 10:31:49'),(390,18,NULL,'Kanhangad','2017-11-29 10:31:49','2017-11-29 10:31:49'),(391,18,NULL,'Kannur','2017-11-29 10:31:49','2017-11-29 10:31:49'),(392,18,NULL,'Kasaragod','2017-11-29 10:31:50','2017-11-29 10:31:50'),(393,18,NULL,'Kayamkulam','2017-11-29 10:31:50','2017-11-29 10:31:50'),(394,18,NULL,'Kochi','2017-11-29 10:31:50','2017-11-29 10:31:50'),(395,18,NULL,'Kodungallur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(396,18,NULL,'Kollam','2017-11-29 10:31:50','2017-11-29 10:31:50'),(397,18,NULL,'Koni','2017-11-29 10:31:50','2017-11-29 10:31:50'),(398,18,NULL,'Kottakkal','2017-11-29 10:31:50','2017-11-29 10:31:50'),(399,18,NULL,'Kottarakara','2017-11-29 10:31:50','2017-11-29 10:31:50'),(400,18,NULL,'Kottayam','2017-11-29 10:31:50','2017-11-29 10:31:50'),(401,18,NULL,'Kozhikode','2017-11-29 10:31:50','2017-11-29 10:31:50'),(402,18,NULL,'Malappuram','2017-11-29 10:31:50','2017-11-29 10:31:50'),(403,18,NULL,'Manjeri','2017-11-29 10:31:50','2017-11-29 10:31:50'),(404,18,NULL,'Mattanur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(405,18,NULL,'Mavelikara','2017-11-29 10:31:50','2017-11-29 10:31:50'),(406,18,NULL,'Nilambur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(407,18,NULL,'Ottappalam','2017-11-29 10:31:50','2017-11-29 10:31:50'),(408,18,NULL,'Palakkad','2017-11-29 10:31:50','2017-11-29 10:31:50'),(409,18,NULL,'Palayam','2017-11-29 10:31:50','2017-11-29 10:31:50'),(410,18,NULL,'Parappanangadi','2017-11-29 10:31:50','2017-11-29 10:31:50'),(411,18,NULL,'Paravur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(412,18,NULL,'Pathanamthitta','2017-11-29 10:31:50','2017-11-29 10:31:50'),(413,18,NULL,'Pattambi','2017-11-29 10:31:50','2017-11-29 10:31:50'),(414,18,NULL,'Payyanur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(415,18,NULL,'Ponnani','2017-11-29 10:31:50','2017-11-29 10:31:50'),(416,18,NULL,'Punalur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(417,18,NULL,'Shoranur','2017-11-29 10:31:50','2017-11-29 10:31:50'),(418,18,NULL,'Sultans Battery','2017-11-29 10:31:50','2017-11-29 10:31:50'),(419,18,NULL,'Thalassery','2017-11-29 10:31:51','2017-11-29 10:31:51'),(420,18,NULL,'Thiruvananthapuram','2017-11-29 10:31:51','2017-11-29 10:31:51'),(421,18,NULL,'Thrissur','2017-11-29 10:31:51','2017-11-29 10:31:51'),(422,18,NULL,'Tirur','2017-11-29 10:31:51','2017-11-29 10:31:51'),(423,18,NULL,'Tiruvalla','2017-11-29 10:31:51','2017-11-29 10:31:51'),(424,18,NULL,'Vaikam','2017-11-29 10:31:51','2017-11-29 10:31:51'),(425,18,NULL,'Vazhakulam','2017-11-29 10:31:51','2017-11-29 10:31:51'),(426,19,NULL,'Kavaratti','2017-11-29 10:31:51','2017-11-29 10:31:51'),(427,20,NULL,'Abdul','2017-11-29 10:31:51','2017-11-29 10:31:51'),(428,20,NULL,'Ahmednagar','2017-11-29 10:31:51','2017-11-29 10:31:51'),(429,20,NULL,'Akola','2017-11-29 10:31:51','2017-11-29 10:31:51'),(430,20,NULL,'Alibag','2017-11-29 10:31:51','2017-11-29 10:31:51'),(431,20,NULL,'Ambad','2017-11-29 10:31:51','2017-11-29 10:31:51'),(432,20,NULL,'Ambarnath','2017-11-29 10:31:51','2017-11-29 10:31:51'),(433,20,NULL,'Amravati','2017-11-29 10:31:51','2017-11-29 10:31:51'),(434,20,NULL,'Andheri','2017-11-29 10:31:51','2017-11-29 10:31:51'),(435,20,NULL,'Arvi','2017-11-29 10:31:51','2017-11-29 10:31:51'),(436,20,NULL,'Aundh','2017-11-29 10:31:51','2017-11-29 10:31:51'),(437,20,NULL,'Aurangabad','2017-11-29 10:31:51','2017-11-29 10:31:51'),(438,20,NULL,'Badlapur','2017-11-29 10:31:51','2017-11-29 10:31:51'),(439,20,NULL,'Bandra','2017-11-29 10:31:51','2017-11-29 10:31:51'),(440,20,NULL,'Baramati','2017-11-29 10:31:51','2017-11-29 10:31:51'),(441,20,NULL,'Belapur','2017-11-29 10:31:51','2017-11-29 10:31:51'),(442,20,NULL,'Bhandup','2017-11-29 10:31:51','2017-11-29 10:31:51'),(443,20,NULL,'Bhiwandi','2017-11-29 10:31:51','2017-11-29 10:31:51'),(444,20,NULL,'Bhusawal','2017-11-29 10:31:52','2017-11-29 10:31:52'),(445,20,NULL,'Boisar','2017-11-29 10:31:52','2017-11-29 10:31:52'),(446,20,NULL,'Chakan','2017-11-29 10:31:52','2017-11-29 10:31:52'),(447,20,NULL,'Chalisgaon','2017-11-29 10:31:52','2017-11-29 10:31:52'),(448,20,NULL,'Chandrapur','2017-11-29 10:31:52','2017-11-29 10:31:52'),(449,20,NULL,'Charan','2017-11-29 10:31:52','2017-11-29 10:31:52'),(450,20,NULL,'Chinchvad','2017-11-29 10:31:52','2017-11-29 10:31:52'),(451,20,NULL,'Chiplun','2017-11-29 10:31:52','2017-11-29 10:31:52'),(452,20,NULL,'Chopda','2017-11-29 10:31:52','2017-11-29 10:31:52'),(453,20,NULL,'Colaba','2017-11-29 10:31:52','2017-11-29 10:31:52'),(454,20,NULL,'Dahanu','2017-11-29 10:31:52','2017-11-29 10:31:52'),(455,20,NULL,'Deolali','2017-11-29 10:31:52','2017-11-29 10:31:52'),(456,20,NULL,'Devgarh','2017-11-29 10:31:52','2017-11-29 10:31:52'),(457,20,NULL,'Dharavi','2017-11-29 10:31:52','2017-11-29 10:31:52'),(458,20,NULL,'Dhule','2017-11-29 10:31:52','2017-11-29 10:31:52'),(459,20,NULL,'Ellora Caves','2017-11-29 10:31:52','2017-11-29 10:31:52'),(460,20,NULL,'Gargoti','2017-11-29 10:31:52','2017-11-29 10:31:52'),(461,20,NULL,'Ghatkopar','2017-11-29 10:31:52','2017-11-29 10:31:52'),(462,20,NULL,'Goregaon','2017-11-29 10:31:52','2017-11-29 10:31:52'),(463,20,NULL,'Hinganghat','2017-11-29 10:31:52','2017-11-29 10:31:52'),(464,20,NULL,'Hingoli','2017-11-29 10:31:52','2017-11-29 10:31:52'),(465,20,NULL,'Ichalkaranji','2017-11-29 10:31:52','2017-11-29 10:31:52'),(466,20,NULL,'Igatpuri','2017-11-29 10:31:52','2017-11-29 10:31:52'),(467,20,NULL,'Jalgaon Jamod','2017-11-29 10:31:52','2017-11-29 10:31:52'),(468,20,NULL,'Jalna','2017-11-29 10:31:52','2017-11-29 10:31:52'),(469,20,NULL,'Kagal','2017-11-29 10:31:53','2017-11-29 10:31:53'),(470,20,NULL,'Kalam','2017-11-29 10:31:53','2017-11-29 10:31:53'),(471,20,NULL,'Kalamboli','2017-11-29 10:31:53','2017-11-29 10:31:53'),(472,20,NULL,'Kalyan','2017-11-29 10:31:53','2017-11-29 10:31:53'),(473,20,NULL,'Kankauli','2017-11-29 10:31:53','2017-11-29 10:31:53'),(474,20,NULL,'Karad','2017-11-29 10:31:53','2017-11-29 10:31:53'),(475,20,NULL,'Karanja','2017-11-29 10:31:53','2017-11-29 10:31:53'),(476,20,NULL,'Karjat','2017-11-29 10:31:53','2017-11-29 10:31:53'),(477,20,NULL,'Khalapur','2017-11-29 10:31:53','2017-11-29 10:31:53'),(478,20,NULL,'Khopoli','2017-11-29 10:31:53','2017-11-29 10:31:53'),(479,20,NULL,'Kolhapur','2017-11-29 10:31:53','2017-11-29 10:31:53'),(480,20,NULL,'Latur','2017-11-29 10:31:53','2017-11-29 10:31:53'),(481,20,NULL,'Mahad','2017-11-29 10:31:53','2017-11-29 10:31:53'),(482,20,NULL,'Mahim','2017-11-29 10:31:53','2017-11-29 10:31:53'),(483,20,NULL,'Mangaon','2017-11-29 10:31:53','2017-11-29 10:31:53'),(484,20,NULL,'Manor','2017-11-29 10:31:53','2017-11-29 10:31:53'),(485,20,NULL,'Miraj','2017-11-29 10:31:53','2017-11-29 10:31:53'),(486,20,NULL,'Mumbai','2017-11-29 10:31:53','2017-11-29 10:31:53'),(487,20,NULL,'Nadgaon','2017-11-29 10:31:53','2017-11-29 10:31:53'),(488,20,NULL,'Nagpur','2017-11-29 10:31:53','2017-11-29 10:31:53'),(489,20,NULL,'Nanded','2017-11-29 10:31:53','2017-11-29 10:31:53'),(490,20,NULL,'Nandurbar','2017-11-29 10:31:53','2017-11-29 10:31:53'),(491,20,NULL,'Narayangaon','2017-11-29 10:31:53','2017-11-29 10:31:53'),(492,20,NULL,'Nashik','2017-11-29 10:31:53','2017-11-29 10:31:53'),(493,20,NULL,'Neral','2017-11-29 10:31:53','2017-11-29 10:31:53'),(494,20,NULL,'Neri','2017-11-29 10:31:53','2017-11-29 10:31:53'),(495,20,NULL,'Osmanabad','2017-11-29 10:31:54','2017-11-29 10:31:54'),(496,20,NULL,'Palghar','2017-11-29 10:31:54','2017-11-29 10:31:54'),(497,20,NULL,'Palus','2017-11-29 10:31:54','2017-11-29 10:31:54'),(498,20,NULL,'Panchgani','2017-11-29 10:31:54','2017-11-29 10:31:54'),(499,20,NULL,'Pandharpur','2017-11-29 10:31:54','2017-11-29 10:31:54'),(500,20,NULL,'Panvel','2017-11-29 10:31:54','2017-11-29 10:31:54'),(501,20,NULL,'Parbhani','2017-11-29 10:31:54','2017-11-29 10:31:54'),(502,20,NULL,'Parel','2017-11-29 10:31:54','2017-11-29 10:31:54'),(503,20,NULL,'Pimpri','2017-11-29 10:31:54','2017-11-29 10:31:54'),(504,20,NULL,'Pune','2017-11-29 10:31:54','2017-11-29 10:31:54'),(505,20,NULL,'Puras','2017-11-29 10:31:54','2017-11-29 10:31:54'),(506,20,NULL,'Ratnagiri','2017-11-29 10:31:54','2017-11-29 10:31:54'),(507,20,NULL,'Sakri','2017-11-29 10:31:54','2017-11-29 10:31:54'),(508,20,NULL,'Sangamner','2017-11-29 10:31:54','2017-11-29 10:31:54'),(509,20,NULL,'Sangli','2017-11-29 10:31:54','2017-11-29 10:31:54'),(510,20,NULL,'Sangola','2017-11-29 10:31:54','2017-11-29 10:31:54'),(511,20,NULL,'Satara','2017-11-29 10:31:54','2017-11-29 10:31:54'),(512,20,NULL,'Shahapur','2017-11-29 10:31:54','2017-11-29 10:31:54'),(513,20,NULL,'Shirgaon','2017-11-29 10:31:54','2017-11-29 10:31:54'),(514,20,NULL,'Shrigonda','2017-11-29 10:31:54','2017-11-29 10:31:54'),(515,20,NULL,'Sinnar','2017-11-29 10:31:54','2017-11-29 10:31:54'),(516,20,NULL,'Sion','2017-11-29 10:31:54','2017-11-29 10:31:54'),(517,20,NULL,'Solapur','2017-11-29 10:31:54','2017-11-29 10:31:54'),(518,20,NULL,'Sopara','2017-11-29 10:31:54','2017-11-29 10:31:54'),(519,20,NULL,'Talegaon Dabhade','2017-11-29 10:31:54','2017-11-29 10:31:54'),(520,20,NULL,'Thane','2017-11-29 10:31:54','2017-11-29 10:31:54'),(521,20,NULL,'Trimbak','2017-11-29 10:31:54','2017-11-29 10:31:54'),(522,20,NULL,'Tuljapur','2017-11-29 10:31:55','2017-11-29 10:31:55'),(523,20,NULL,'Ulhasnagar','2017-11-29 10:31:55','2017-11-29 10:31:55'),(524,20,NULL,'Umred','2017-11-29 10:31:55','2017-11-29 10:31:55'),(525,20,NULL,'Vadner','2017-11-29 10:31:55','2017-11-29 10:31:55'),(526,20,NULL,'Vasai','2017-11-29 10:31:55','2017-11-29 10:31:55'),(527,20,NULL,'Vashi','2017-11-29 10:31:55','2017-11-29 10:31:55'),(528,20,NULL,'Virar','2017-11-29 10:31:55','2017-11-29 10:31:55'),(529,20,NULL,'Wai','2017-11-29 10:31:55','2017-11-29 10:31:55'),(530,20,NULL,'Wardha','2017-11-29 10:31:55','2017-11-29 10:31:55'),(531,20,NULL,'Yavatmal','2017-11-29 10:31:55','2017-11-29 10:31:55'),(532,20,NULL,'Yeola','2017-11-29 10:31:55','2017-11-29 10:31:55'),(533,21,NULL,'Nongpoh','2017-11-29 10:31:55','2017-11-29 10:31:55'),(534,21,NULL,'Nongstoin','2017-11-29 10:31:55','2017-11-29 10:31:55'),(535,21,NULL,'Pala','2017-11-29 10:31:55','2017-11-29 10:31:55'),(536,21,NULL,'Shillong','2017-11-29 10:31:55','2017-11-29 10:31:55'),(537,21,NULL,'Tura','2017-11-29 10:31:55','2017-11-29 10:31:55'),(538,22,NULL,'Churachandpur','2017-11-29 10:31:55','2017-11-29 10:31:55'),(539,22,NULL,'Imphal','2017-11-29 10:31:55','2017-11-29 10:31:55'),(540,23,NULL,'Amarkantak','2017-11-29 10:31:55','2017-11-29 10:31:55'),(541,23,NULL,'Ambah','2017-11-29 10:31:55','2017-11-29 10:31:55'),(542,23,NULL,'Anantpur','2017-11-29 10:31:55','2017-11-29 10:31:55'),(543,23,NULL,'Bagh','2017-11-29 10:31:55','2017-11-29 10:31:55'),(544,23,NULL,'Balaghat','2017-11-29 10:31:55','2017-11-29 10:31:55'),(545,23,NULL,'Baroda','2017-11-29 10:31:55','2017-11-29 10:31:55'),(546,23,NULL,'Berasia','2017-11-29 10:31:56','2017-11-29 10:31:56'),(547,23,NULL,'Betul','2017-11-29 10:31:56','2017-11-29 10:31:56'),(548,23,NULL,'Bhagwan','2017-11-29 10:31:56','2017-11-29 10:31:56'),(549,23,NULL,'Bhartiya','2017-11-29 10:31:56','2017-11-29 10:31:56'),(550,23,NULL,'Bhopal','2017-11-29 10:31:56','2017-11-29 10:31:56'),(551,23,NULL,'Chakra','2017-11-29 10:31:56','2017-11-29 10:31:56'),(552,23,NULL,'Chand','2017-11-29 10:31:56','2017-11-29 10:31:56'),(553,23,NULL,'Chhindwara','2017-11-29 10:31:56','2017-11-29 10:31:56'),(554,23,NULL,'Chopra','2017-11-29 10:31:56','2017-11-29 10:31:56'),(555,23,NULL,'Damoh','2017-11-29 10:31:56','2017-11-29 10:31:56'),(556,23,NULL,'Dewas','2017-11-29 10:31:56','2017-11-29 10:31:56'),(557,23,NULL,'Dhar','2017-11-29 10:31:56','2017-11-29 10:31:56'),(558,23,NULL,'Dindori','2017-11-29 10:31:56','2017-11-29 10:31:56'),(559,23,NULL,'Gandhigram','2017-11-29 10:31:56','2017-11-29 10:31:56'),(560,23,NULL,'Ganpat','2017-11-29 10:31:56','2017-11-29 10:31:56'),(561,23,NULL,'Guna','2017-11-29 10:31:56','2017-11-29 10:31:56'),(562,23,NULL,'Gwalior','2017-11-29 10:31:56','2017-11-29 10:31:56'),(563,23,NULL,'Hoshangabad','2017-11-29 10:31:56','2017-11-29 10:31:56'),(564,23,NULL,'Indore','2017-11-29 10:31:56','2017-11-29 10:31:56'),(565,23,NULL,'Jabalpur','2017-11-29 10:31:56','2017-11-29 10:31:56'),(566,23,NULL,'Kailaras','2017-11-29 10:31:56','2017-11-29 10:31:56'),(567,23,NULL,'Kamalpura','2017-11-29 10:31:56','2017-11-29 10:31:56'),(568,23,NULL,'Kataria','2017-11-29 10:31:56','2017-11-29 10:31:56'),(569,23,NULL,'Katni','2017-11-29 10:31:56','2017-11-29 10:31:56'),(570,23,NULL,'Khajuraho Group of Monuments','2017-11-29 10:31:56','2017-11-29 10:31:56'),(571,23,NULL,'Khargone','2017-11-29 10:31:56','2017-11-29 10:31:56'),(572,23,NULL,'Mandla','2017-11-29 10:31:56','2017-11-29 10:31:56'),(573,23,NULL,'Mandsaur','2017-11-29 10:31:56','2017-11-29 10:31:56'),(574,23,NULL,'Mhow','2017-11-29 10:31:57','2017-11-29 10:31:57'),(575,23,NULL,'Morena','2017-11-29 10:31:57','2017-11-29 10:31:57'),(576,23,NULL,'Nadia','2017-11-29 10:31:57','2017-11-29 10:31:57'),(577,23,NULL,'Nagara','2017-11-29 10:31:57','2017-11-29 10:31:57'),(578,23,NULL,'Pachmarhi','2017-11-29 10:31:57','2017-11-29 10:31:57'),(579,23,NULL,'Raipur','2017-11-29 10:31:57','2017-11-29 10:31:57'),(580,23,NULL,'Rajapur','2017-11-29 10:31:57','2017-11-29 10:31:57'),(581,23,NULL,'Rama','2017-11-29 10:31:57','2017-11-29 10:31:57'),(582,23,NULL,'Ratlam','2017-11-29 10:31:57','2017-11-29 10:31:57'),(583,23,NULL,'Rewa','2017-11-29 10:31:57','2017-11-29 10:31:57'),(584,23,NULL,'Sagar','2017-11-29 10:31:57','2017-11-29 10:31:57'),(585,23,NULL,'Sarangi','2017-11-29 10:31:57','2017-11-29 10:31:57'),(586,23,NULL,'Satna','2017-11-29 10:31:57','2017-11-29 10:31:57'),(587,23,NULL,'Sehore','2017-11-29 10:31:57','2017-11-29 10:31:57'),(588,23,NULL,'Sendhwa','2017-11-29 10:31:57','2017-11-29 10:31:57'),(589,23,NULL,'Shahdol','2017-11-29 10:31:57','2017-11-29 10:31:57'),(590,23,NULL,'Sidhi','2017-11-29 10:31:57','2017-11-29 10:31:57'),(591,23,NULL,'Soni','2017-11-29 10:31:57','2017-11-29 10:31:57'),(592,23,NULL,'Tala','2017-11-29 10:31:57','2017-11-29 10:31:57'),(593,23,NULL,'Ujjain','2017-11-29 10:31:57','2017-11-29 10:31:57'),(594,23,NULL,'Vidisha','2017-11-29 10:31:57','2017-11-29 10:31:57'),(595,24,NULL,'Aizawl','2017-11-29 10:31:57','2017-11-29 10:31:57'),(596,25,NULL,'Chen','2017-11-29 10:31:57','2017-11-29 10:31:57'),(597,25,NULL,'Dimapur','2017-11-29 10:31:57','2017-11-29 10:31:57'),(598,25,NULL,'Kohima','2017-11-29 10:31:57','2017-11-29 10:31:57'),(599,26,NULL,'Angul','2017-11-29 10:31:57','2017-11-29 10:31:57'),(600,26,NULL,'Balangir','2017-11-29 10:31:57','2017-11-29 10:31:57'),(601,26,NULL,'Balasore','2017-11-29 10:31:57','2017-11-29 10:31:57'),(602,26,NULL,'Bargarh','2017-11-29 10:31:57','2017-11-29 10:31:57'),(603,26,NULL,'Barpali','2017-11-29 10:31:57','2017-11-29 10:31:57'),(604,26,NULL,'Bhubaneswar','2017-11-29 10:31:57','2017-11-29 10:31:57'),(605,26,NULL,'Brahmapur','2017-11-29 10:31:57','2017-11-29 10:31:57'),(606,26,NULL,'Cuttack','2017-11-29 10:31:57','2017-11-29 10:31:57'),(607,26,NULL,'Dhenkanal','2017-11-29 10:31:58','2017-11-29 10:31:58'),(608,26,NULL,'Jajpur','2017-11-29 10:31:58','2017-11-29 10:31:58'),(609,26,NULL,'Jatani','2017-11-29 10:31:58','2017-11-29 10:31:58'),(610,26,NULL,'Jaypur','2017-11-29 10:31:58','2017-11-29 10:31:58'),(611,26,NULL,'Jharsuguda','2017-11-29 10:31:58','2017-11-29 10:31:58'),(612,26,NULL,'Kalinga','2017-11-29 10:31:58','2017-11-29 10:31:58'),(613,26,NULL,'Khurda','2017-11-29 10:31:58','2017-11-29 10:31:58'),(614,26,NULL,'Koraput','2017-11-29 10:31:58','2017-11-29 10:31:58'),(615,26,NULL,'Nayagarh','2017-11-29 10:31:58','2017-11-29 10:31:58'),(616,26,NULL,'Puri','2017-11-29 10:31:58','2017-11-29 10:31:58'),(617,26,NULL,'Raurkela','2017-11-29 10:31:58','2017-11-29 10:31:58'),(618,26,NULL,'Rayagada','2017-11-29 10:31:58','2017-11-29 10:31:58'),(619,26,NULL,'Sambalpur','2017-11-29 10:31:58','2017-11-29 10:31:58'),(620,26,NULL,'Sundargarh','2017-11-29 10:31:58','2017-11-29 10:31:58'),(621,26,NULL,'Talcher','2017-11-29 10:31:58','2017-11-29 10:31:58'),(622,26,NULL,'Udaigiri','2017-11-29 10:31:58','2017-11-29 10:31:58'),(623,27,NULL,'Amritsar','2017-11-29 10:31:58','2017-11-29 10:31:58'),(624,27,NULL,'Banga','2017-11-29 10:31:58','2017-11-29 10:31:58'),(625,27,NULL,'Barnala','2017-11-29 10:31:58','2017-11-29 10:31:58'),(626,27,NULL,'Batala','2017-11-29 10:31:58','2017-11-29 10:31:58'),(627,27,NULL,'Bhatinda','2017-11-29 10:31:58','2017-11-29 10:31:58'),(628,27,NULL,'Dasua','2017-11-29 10:31:58','2017-11-29 10:31:58'),(629,27,NULL,'Dhariwal','2017-11-29 10:31:58','2017-11-29 10:31:58'),(630,27,NULL,'Dhuri','2017-11-29 10:31:58','2017-11-29 10:31:58'),(631,27,NULL,'Dinanagar','2017-11-29 10:31:58','2017-11-29 10:31:58'),(632,27,NULL,'Faridkot','2017-11-29 10:31:58','2017-11-29 10:31:58'),(633,27,NULL,'Firozpur','2017-11-29 10:31:58','2017-11-29 10:31:58'),(634,27,NULL,'Garhshankar','2017-11-29 10:31:58','2017-11-29 10:31:58'),(635,27,NULL,'Gurdaspur','2017-11-29 10:31:58','2017-11-29 10:31:58'),(636,27,NULL,'Hoshiarpur','2017-11-29 10:31:59','2017-11-29 10:31:59'),(637,27,NULL,'Jagraon','2017-11-29 10:31:59','2017-11-29 10:31:59'),(638,27,NULL,'Jalalabad','2017-11-29 10:31:59','2017-11-29 10:31:59'),(639,27,NULL,'Jalandhar','2017-11-29 10:31:59','2017-11-29 10:31:59'),(640,27,NULL,'Kapurthala Town','2017-11-29 10:31:59','2017-11-29 10:31:59'),(641,27,NULL,'Khanna','2017-11-29 10:31:59','2017-11-29 10:31:59'),(642,27,NULL,'Kharar','2017-11-29 10:31:59','2017-11-29 10:31:59'),(643,27,NULL,'Kot Isa Khan','2017-11-29 10:31:59','2017-11-29 10:31:59'),(644,27,NULL,'Kurali','2017-11-29 10:31:59','2017-11-29 10:31:59'),(645,27,NULL,'Ludhiana','2017-11-29 10:31:59','2017-11-29 10:31:59'),(646,27,NULL,'Machhiwara','2017-11-29 10:31:59','2017-11-29 10:31:59'),(647,27,NULL,'Maharaj','2017-11-29 10:31:59','2017-11-29 10:31:59'),(648,27,NULL,'Mansa','2017-11-29 10:31:59','2017-11-29 10:31:59'),(649,27,NULL,'Moga','2017-11-29 10:31:59','2017-11-29 10:31:59'),(650,27,NULL,'Mohali','2017-11-29 10:31:59','2017-11-29 10:31:59'),(651,27,NULL,'Morinda','2017-11-29 10:31:59','2017-11-29 10:31:59'),(652,27,NULL,'Mukerian','2017-11-29 10:31:59','2017-11-29 10:31:59'),(653,27,NULL,'Muktsar','2017-11-29 10:31:59','2017-11-29 10:31:59'),(654,27,NULL,'Nabha','2017-11-29 10:31:59','2017-11-29 10:31:59'),(655,27,NULL,'Pathankot','2017-11-29 10:31:59','2017-11-29 10:31:59'),(656,27,NULL,'Patiala','2017-11-29 10:31:59','2017-11-29 10:31:59'),(657,27,NULL,'Phagwara','2017-11-29 10:31:59','2017-11-29 10:31:59'),(658,27,NULL,'Rajpura','2017-11-29 10:31:59','2017-11-29 10:31:59'),(659,27,NULL,'Rupnagar','2017-11-29 10:31:59','2017-11-29 10:31:59'),(660,27,NULL,'Sangrur','2017-11-29 10:31:59','2017-11-29 10:31:59'),(661,27,NULL,'Shahkot','2017-11-29 10:31:59','2017-11-29 10:31:59'),(662,27,NULL,'Sirhind','2017-11-29 10:32:00','2017-11-29 10:32:00'),(663,27,NULL,'Sunam','2017-11-29 10:32:00','2017-11-29 10:32:00'),(664,27,NULL,'Talwandi Sabo','2017-11-29 10:32:00','2017-11-29 10:32:00'),(665,27,NULL,'Tarn Taran','2017-11-29 10:32:00','2017-11-29 10:32:00'),(666,28,NULL,'Karaikal','2017-11-29 10:32:00','2017-11-29 10:32:00'),(667,28,NULL,'Puducherry','2017-11-29 10:32:00','2017-11-29 10:32:00'),(668,29,NULL,'Ajmer','2017-11-29 10:32:00','2017-11-29 10:32:00'),(669,29,NULL,'Alwar','2017-11-29 10:32:00','2017-11-29 10:32:00'),(670,29,NULL,'Amer','2017-11-29 10:32:00','2017-11-29 10:32:00'),(671,29,NULL,'Amet','2017-11-29 10:32:00','2017-11-29 10:32:00'),(672,29,NULL,'Balana','2017-11-29 10:32:00','2017-11-29 10:32:00'),(673,29,NULL,'Bali','2017-11-29 10:32:00','2017-11-29 10:32:00'),(674,29,NULL,'Banswara','2017-11-29 10:32:00','2017-11-29 10:32:00'),(675,29,NULL,'Barmer','2017-11-29 10:32:00','2017-11-29 10:32:00'),(676,29,NULL,'Beawar','2017-11-29 10:32:00','2017-11-29 10:32:00'),(677,29,NULL,'Bharatpur','2017-11-29 10:32:00','2017-11-29 10:32:00'),(678,29,NULL,'Bhilwara','2017-11-29 10:32:00','2017-11-29 10:32:00'),(679,29,NULL,'Bikaner','2017-11-29 10:32:00','2017-11-29 10:32:00'),(680,29,NULL,'Binavas','2017-11-29 10:32:00','2017-11-29 10:32:00'),(681,29,NULL,'Bundi','2017-11-29 10:32:00','2017-11-29 10:32:00'),(682,29,NULL,'Charu','2017-11-29 10:32:00','2017-11-29 10:32:00'),(683,29,NULL,'Chetan','2017-11-29 10:32:00','2017-11-29 10:32:00'),(684,29,NULL,'Chhabra','2017-11-29 10:32:00','2017-11-29 10:32:00'),(685,29,NULL,'Dipas','2017-11-29 10:32:00','2017-11-29 10:32:00'),(686,29,NULL,'Ganganagar','2017-11-29 10:32:00','2017-11-29 10:32:00'),(687,29,NULL,'Gangapur','2017-11-29 10:32:00','2017-11-29 10:32:00'),(688,29,NULL,'Gangrar','2017-11-29 10:32:00','2017-11-29 10:32:00'),(689,29,NULL,'Jaipur','2017-11-29 10:32:00','2017-11-29 10:32:00'),(690,29,NULL,'Jaisalmer','2017-11-29 10:32:00','2017-11-29 10:32:00'),(691,29,NULL,'Jhalawar','2017-11-29 10:32:01','2017-11-29 10:32:01'),(692,29,NULL,'Jhunjhunun','2017-11-29 10:32:01','2017-11-29 10:32:01'),(693,29,NULL,'Jodhpur','2017-11-29 10:32:01','2017-11-29 10:32:01'),(694,29,NULL,'Kalan','2017-11-29 10:32:01','2017-11-29 10:32:01'),(695,29,NULL,'Kanakpura','2017-11-29 10:32:01','2017-11-29 10:32:01'),(696,29,NULL,'Khan','2017-11-29 10:32:01','2017-11-29 10:32:01'),(697,29,NULL,'Khinwara','2017-11-29 10:32:01','2017-11-29 10:32:01'),(698,29,NULL,'Kishangarh','2017-11-29 10:32:01','2017-11-29 10:32:01'),(699,29,NULL,'Kolayat','2017-11-29 10:32:01','2017-11-29 10:32:01'),(700,29,NULL,'Kota','2017-11-29 10:32:01','2017-11-29 10:32:01'),(701,29,NULL,'Lamba Harisingh','2017-11-29 10:32:01','2017-11-29 10:32:01'),(702,29,NULL,'Mahajan','2017-11-29 10:32:01','2017-11-29 10:32:01'),(703,29,NULL,'Mahatma','2017-11-29 10:32:01','2017-11-29 10:32:01'),(704,29,NULL,'Mandal','2017-11-29 10:32:01','2017-11-29 10:32:01'),(705,29,NULL,'Manna','2017-11-29 10:32:01','2017-11-29 10:32:01'),(706,29,NULL,'Mount Abu','2017-11-29 10:32:01','2017-11-29 10:32:01'),(707,29,NULL,'Nagar','2017-11-29 10:32:01','2017-11-29 10:32:01'),(708,29,NULL,'Nagaur','2017-11-29 10:32:01','2017-11-29 10:32:01'),(709,29,NULL,'Nanda','2017-11-29 10:32:01','2017-11-29 10:32:01'),(710,29,NULL,'Naraina','2017-11-29 10:32:01','2017-11-29 10:32:01'),(711,29,NULL,'Nathdwara','2017-11-29 10:32:01','2017-11-29 10:32:01'),(712,29,NULL,'Pali','2017-11-29 10:32:01','2017-11-29 10:32:01'),(713,29,NULL,'Pilani','2017-11-29 10:32:01','2017-11-29 10:32:01'),(714,29,NULL,'Pitampura','2017-11-29 10:32:01','2017-11-29 10:32:01'),(715,29,NULL,'Pushkar','2017-11-29 10:32:01','2017-11-29 10:32:01'),(716,29,NULL,'Rana','2017-11-29 10:32:01','2017-11-29 10:32:01'),(717,29,NULL,'Roshan','2017-11-29 10:32:01','2017-11-29 10:32:01'),(718,29,NULL,'Shiv','2017-11-29 10:32:01','2017-11-29 10:32:01'),(719,29,NULL,'Sikar','2017-11-29 10:32:01','2017-11-29 10:32:01'),(720,29,NULL,'Sirohi','2017-11-29 10:32:02','2017-11-29 10:32:02'),(721,29,NULL,'Sojat','2017-11-29 10:32:02','2017-11-29 10:32:02'),(722,29,NULL,'Sultan','2017-11-29 10:32:02','2017-11-29 10:32:02'),(723,29,NULL,'Surana','2017-11-29 10:32:02','2017-11-29 10:32:02'),(724,29,NULL,'Suratgarh','2017-11-29 10:32:02','2017-11-29 10:32:02'),(725,29,NULL,'Thali','2017-11-29 10:32:02','2017-11-29 10:32:02'),(726,29,NULL,'Tonk','2017-11-29 10:32:02','2017-11-29 10:32:02'),(727,29,NULL,'Udaipur','2017-11-29 10:32:02','2017-11-29 10:32:02'),(728,30,NULL,'Gangtok','2017-11-29 10:32:02','2017-11-29 10:32:02'),(729,30,NULL,'Manu','2017-11-29 10:32:02','2017-11-29 10:32:02'),(730,30,NULL,'Singtam','2017-11-29 10:32:02','2017-11-29 10:32:02'),(731,30,NULL,'Sirwani','2017-11-29 10:32:02','2017-11-29 10:32:02'),(732,31,NULL,'Adilabad','2017-11-29 10:32:02','2017-11-29 10:32:02'),(733,31,NULL,'Balanagar','2017-11-29 10:32:02','2017-11-29 10:32:02'),(734,31,NULL,'Bhongir','2017-11-29 10:32:02','2017-11-29 10:32:02'),(735,31,NULL,'Bodhan','2017-11-29 10:32:02','2017-11-29 10:32:02'),(736,31,NULL,'Gudur','2017-11-29 10:32:02','2017-11-29 10:32:02'),(737,31,NULL,'Hyderabad','2017-11-29 10:32:02','2017-11-29 10:32:02'),(738,31,NULL,'Karimnagar','2017-11-29 10:32:02','2017-11-29 10:32:02'),(739,31,NULL,'Khammam','2017-11-29 10:32:02','2017-11-29 10:32:02'),(740,31,NULL,'Kottagudem','2017-11-29 10:32:02','2017-11-29 10:32:02'),(741,31,NULL,'Mancherial','2017-11-29 10:32:02','2017-11-29 10:32:02'),(742,31,NULL,'Medak','2017-11-29 10:32:02','2017-11-29 10:32:02'),(743,31,NULL,'Medchal','2017-11-29 10:32:02','2017-11-29 10:32:02'),(744,31,NULL,'Nalgonda','2017-11-29 10:32:02','2017-11-29 10:32:02'),(745,31,NULL,'Narsapur','2017-11-29 10:32:02','2017-11-29 10:32:02'),(746,31,NULL,'Nizamabad','2017-11-29 10:32:02','2017-11-29 10:32:02'),(747,31,NULL,'Paloncha','2017-11-29 10:32:02','2017-11-29 10:32:02'),(748,31,NULL,'Patancheru','2017-11-29 10:32:03','2017-11-29 10:32:03'),(749,31,NULL,'Patelguda','2017-11-29 10:32:03','2017-11-29 10:32:03'),(750,31,NULL,'Pochampalli','2017-11-29 10:32:03','2017-11-29 10:32:03'),(751,31,NULL,'Secunderabad','2017-11-29 10:32:03','2017-11-29 10:32:03'),(752,31,NULL,'Shadnagar','2017-11-29 10:32:03','2017-11-29 10:32:03'),(753,31,NULL,'Suriapet','2017-11-29 10:32:03','2017-11-29 10:32:03'),(754,31,NULL,'Uppal','2017-11-29 10:32:03','2017-11-29 10:32:03'),(755,31,NULL,'Vikarabad','2017-11-29 10:32:03','2017-11-29 10:32:03'),(756,31,NULL,'Warangal','2017-11-29 10:32:03','2017-11-29 10:32:03'),(757,32,NULL,'Alangulam','2017-11-29 10:32:03','2017-11-29 10:32:03'),(758,32,NULL,'Ambur','2017-11-29 10:32:03','2017-11-29 10:32:03'),(759,32,NULL,'Annamalainagar','2017-11-29 10:32:03','2017-11-29 10:32:03'),(760,32,NULL,'Arakkonam','2017-11-29 10:32:03','2017-11-29 10:32:03'),(761,32,NULL,'Arani','2017-11-29 10:32:03','2017-11-29 10:32:03'),(762,32,NULL,'Ariyalur','2017-11-29 10:32:03','2017-11-29 10:32:03'),(763,32,NULL,'Attur','2017-11-29 10:32:03','2017-11-29 10:32:03'),(764,32,NULL,'Bodinayakkanur','2017-11-29 10:32:03','2017-11-29 10:32:03'),(765,32,NULL,'Chennai','2017-11-29 10:32:03','2017-11-29 10:32:03'),(766,32,NULL,'Cheyyar','2017-11-29 10:32:03','2017-11-29 10:32:03'),(767,32,NULL,'Chidambaram','2017-11-29 10:32:03','2017-11-29 10:32:03'),(768,32,NULL,'Choolai','2017-11-29 10:32:03','2017-11-29 10:32:03'),(769,32,NULL,'Coimbatore','2017-11-29 10:32:03','2017-11-29 10:32:03'),(770,32,NULL,'Coonoor','2017-11-29 10:32:03','2017-11-29 10:32:03'),(771,32,NULL,'Cuddalore','2017-11-29 10:32:03','2017-11-29 10:32:03'),(772,32,NULL,'Devipattinam','2017-11-29 10:32:03','2017-11-29 10:32:03'),(773,32,NULL,'Dharapuram','2017-11-29 10:32:03','2017-11-29 10:32:03'),(774,32,NULL,'Dharmapuri','2017-11-29 10:32:03','2017-11-29 10:32:03'),(775,32,NULL,'Dindigul','2017-11-29 10:32:04','2017-11-29 10:32:04'),(776,32,NULL,'Ekkattuthangal','2017-11-29 10:32:04','2017-11-29 10:32:04'),(777,32,NULL,'Eral','2017-11-29 10:32:04','2017-11-29 10:32:04'),(778,32,NULL,'Erode','2017-11-29 10:32:04','2017-11-29 10:32:04'),(779,32,NULL,'Fort','2017-11-29 10:32:04','2017-11-29 10:32:04'),(780,32,NULL,'Gobichettipalayam','2017-11-29 10:32:04','2017-11-29 10:32:04'),(781,32,NULL,'Guindy','2017-11-29 10:32:04','2017-11-29 10:32:04'),(782,32,NULL,'Hosur','2017-11-29 10:32:04','2017-11-29 10:32:04'),(783,32,NULL,'Kalpakkam','2017-11-29 10:32:04','2017-11-29 10:32:04'),(784,32,NULL,'Kanchipuram','2017-11-29 10:32:04','2017-11-29 10:32:04'),(785,32,NULL,'Kangayam','2017-11-29 10:32:04','2017-11-29 10:32:04'),(786,32,NULL,'Kaniyambadi','2017-11-29 10:32:04','2017-11-29 10:32:04'),(787,32,NULL,'Kanniyakumari','2017-11-29 10:32:04','2017-11-29 10:32:04'),(788,32,NULL,'Karaikudi','2017-11-29 10:32:04','2017-11-29 10:32:04'),(789,32,NULL,'Karamadai','2017-11-29 10:32:04','2017-11-29 10:32:04'),(790,32,NULL,'Karur','2017-11-29 10:32:04','2017-11-29 10:32:04'),(791,32,NULL,'Kodaikanal','2017-11-29 10:32:04','2017-11-29 10:32:04'),(792,32,NULL,'Koothanallur','2017-11-29 10:32:04','2017-11-29 10:32:04'),(793,32,NULL,'Kovilpatti','2017-11-29 10:32:04','2017-11-29 10:32:04'),(794,32,NULL,'Krishnagiri','2017-11-29 10:32:04','2017-11-29 10:32:04'),(795,32,NULL,'Kumbakonam','2017-11-29 10:32:04','2017-11-29 10:32:04'),(796,32,NULL,'Kuzhithurai','2017-11-29 10:32:04','2017-11-29 10:32:04'),(797,32,NULL,'Lalgudi','2017-11-29 10:32:04','2017-11-29 10:32:04'),(798,32,NULL,'Madurai','2017-11-29 10:32:04','2017-11-29 10:32:04'),(799,32,NULL,'Madurantakam','2017-11-29 10:32:04','2017-11-29 10:32:04'),(800,32,NULL,'Mahabalipuram','2017-11-29 10:32:04','2017-11-29 10:32:04'),(801,32,NULL,'Mannargudi','2017-11-29 10:32:04','2017-11-29 10:32:04'),(802,32,NULL,'Mettur','2017-11-29 10:32:05','2017-11-29 10:32:05'),(803,32,NULL,'Mylapore','2017-11-29 10:32:05','2017-11-29 10:32:05'),(804,32,NULL,'Nagapattinam','2017-11-29 10:32:05','2017-11-29 10:32:05'),(805,32,NULL,'Nagercoil','2017-11-29 10:32:05','2017-11-29 10:32:05'),(806,32,NULL,'Namakkal','2017-11-29 10:32:05','2017-11-29 10:32:05'),(807,32,NULL,'Neyveli','2017-11-29 10:32:05','2017-11-29 10:32:05'),(808,32,NULL,'Omalur','2017-11-29 10:32:05','2017-11-29 10:32:05'),(809,32,NULL,'Ooty','2017-11-29 10:32:05','2017-11-29 10:32:05'),(810,32,NULL,'Palani','2017-11-29 10:32:05','2017-11-29 10:32:05'),(811,32,NULL,'Palladam','2017-11-29 10:32:05','2017-11-29 10:32:05'),(812,32,NULL,'Panruti','2017-11-29 10:32:05','2017-11-29 10:32:05'),(813,32,NULL,'Pattukkottai','2017-11-29 10:32:05','2017-11-29 10:32:05'),(814,32,NULL,'Perambalur','2017-11-29 10:32:05','2017-11-29 10:32:05'),(815,32,NULL,'Peranampattu','2017-11-29 10:32:05','2017-11-29 10:32:05'),(816,32,NULL,'Perundurai','2017-11-29 10:32:05','2017-11-29 10:32:05'),(817,32,NULL,'Pollachi','2017-11-29 10:32:05','2017-11-29 10:32:05'),(818,32,NULL,'Ponneri','2017-11-29 10:32:05','2017-11-29 10:32:05'),(819,32,NULL,'Pudukkottai','2017-11-29 10:32:05','2017-11-29 10:32:05'),(820,32,NULL,'Puliyur','2017-11-29 10:32:05','2017-11-29 10:32:05'),(821,32,NULL,'Rajapalaiyam','2017-11-29 10:32:05','2017-11-29 10:32:05'),(822,32,NULL,'Ramanathapuram','2017-11-29 10:32:05','2017-11-29 10:32:05'),(823,32,NULL,'Ranippettai','2017-11-29 10:32:05','2017-11-29 10:32:05'),(824,32,NULL,'Salem','2017-11-29 10:32:05','2017-11-29 10:32:05'),(825,32,NULL,'Sattur','2017-11-29 10:32:05','2017-11-29 10:32:05'),(826,32,NULL,'Sholavandan','2017-11-29 10:32:05','2017-11-29 10:32:05'),(827,32,NULL,'Sirkazhi','2017-11-29 10:32:06','2017-11-29 10:32:06'),(828,32,NULL,'Siruseri','2017-11-29 10:32:06','2017-11-29 10:32:06'),(829,32,NULL,'Sivaganga','2017-11-29 10:32:06','2017-11-29 10:32:06'),(830,32,NULL,'Sivakasi','2017-11-29 10:32:06','2017-11-29 10:32:06'),(831,32,NULL,'Sriperumbudur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(832,32,NULL,'Srirangam','2017-11-29 10:32:06','2017-11-29 10:32:06'),(833,32,NULL,'Srivilliputhur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(834,32,NULL,'Tambaram','2017-11-29 10:32:06','2017-11-29 10:32:06'),(835,32,NULL,'Thanjavur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(836,32,NULL,'Thenkasi','2017-11-29 10:32:06','2017-11-29 10:32:06'),(837,32,NULL,'Thirumangalam','2017-11-29 10:32:06','2017-11-29 10:32:06'),(838,32,NULL,'Thiruthani','2017-11-29 10:32:06','2017-11-29 10:32:06'),(839,32,NULL,'Thiruvarur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(840,32,NULL,'Thoothukudi','2017-11-29 10:32:06','2017-11-29 10:32:06'),(841,32,NULL,'Tindivanam','2017-11-29 10:32:06','2017-11-29 10:32:06'),(842,32,NULL,'Tiruchchendur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(843,32,NULL,'Tiruchi','2017-11-29 10:32:06','2017-11-29 10:32:06'),(844,32,NULL,'Tirunelveli','2017-11-29 10:32:06','2017-11-29 10:32:06'),(845,32,NULL,'Tiruppur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(846,32,NULL,'Tiruvallur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(847,32,NULL,'Tiruvannamalai','2017-11-29 10:32:06','2017-11-29 10:32:06'),(848,32,NULL,'Turaiyur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(849,32,NULL,'Vadamadurai','2017-11-29 10:32:06','2017-11-29 10:32:06'),(850,32,NULL,'Vandalur','2017-11-29 10:32:06','2017-11-29 10:32:06'),(851,32,NULL,'Vandavasi','2017-11-29 10:32:07','2017-11-29 10:32:07'),(852,32,NULL,'Vaniyambadi','2017-11-29 10:32:07','2017-11-29 10:32:07'),(853,32,NULL,'Vellore','2017-11-29 10:32:07','2017-11-29 10:32:07'),(854,32,NULL,'Villupuram','2017-11-29 10:32:07','2017-11-29 10:32:07'),(855,32,NULL,'Wellington','2017-11-29 10:32:07','2017-11-29 10:32:07'),(856,32,NULL,'Yercaud','2017-11-29 10:32:07','2017-11-29 10:32:07'),(857,33,NULL,'Agartala','2017-11-29 10:32:07','2017-11-29 10:32:07'),(858,33,NULL,'Kamalpur','2017-11-29 10:32:07','2017-11-29 10:32:07'),(859,34,NULL,'Adwani','2017-11-29 10:32:07','2017-11-29 10:32:07'),(860,34,NULL,'Almora','2017-11-29 10:32:07','2017-11-29 10:32:07'),(861,34,NULL,'Dang','2017-11-29 10:32:07','2017-11-29 10:32:07'),(862,34,NULL,'Dangi','2017-11-29 10:32:07','2017-11-29 10:32:07'),(863,34,NULL,'Dehradun','2017-11-29 10:32:07','2017-11-29 10:32:07'),(864,34,NULL,'Dhanaulti','2017-11-29 10:32:07','2017-11-29 10:32:07'),(865,34,NULL,'Dogadda','2017-11-29 10:32:07','2017-11-29 10:32:07'),(866,34,NULL,'Dwarahat','2017-11-29 10:32:07','2017-11-29 10:32:07'),(867,34,NULL,'Haldwani','2017-11-29 10:32:07','2017-11-29 10:32:07'),(868,34,NULL,'Haridwar','2017-11-29 10:32:07','2017-11-29 10:32:07'),(869,34,NULL,'Jamal','2017-11-29 10:32:07','2017-11-29 10:32:07'),(870,34,NULL,'Jaspur','2017-11-29 10:32:07','2017-11-29 10:32:07'),(871,34,NULL,'Kashipur','2017-11-29 10:32:07','2017-11-29 10:32:07'),(872,34,NULL,'Lohaghat','2017-11-29 10:32:07','2017-11-29 10:32:07'),(873,34,NULL,'Mill','2017-11-29 10:32:07','2017-11-29 10:32:07'),(874,34,NULL,'Mussoorie','2017-11-29 10:32:07','2017-11-29 10:32:07'),(875,34,NULL,'Nagal','2017-11-29 10:32:07','2017-11-29 10:32:07'),(876,34,NULL,'Naini','2017-11-29 10:32:07','2017-11-29 10:32:07'),(877,34,NULL,'Pantnagar','2017-11-29 10:32:07','2017-11-29 10:32:07'),(878,34,NULL,'Pauri','2017-11-29 10:32:07','2017-11-29 10:32:07'),(879,34,NULL,'Pithoragarh','2017-11-29 10:32:07','2017-11-29 10:32:07'),(880,34,NULL,'Ramnagar','2017-11-29 10:32:07','2017-11-29 10:32:07'),(881,34,NULL,'Rishikesh','2017-11-29 10:32:08','2017-11-29 10:32:08'),(882,34,NULL,'Roorkee','2017-11-29 10:32:08','2017-11-29 10:32:08'),(883,34,NULL,'Sidhpur','2017-11-29 10:32:08','2017-11-29 10:32:08'),(884,34,NULL,'Uttarkashi','2017-11-29 10:32:08','2017-11-29 10:32:08'),(885,34,NULL,'Vikasnagar','2017-11-29 10:32:08','2017-11-29 10:32:08'),(886,35,NULL,'Agra','2017-11-29 10:32:08','2017-11-29 10:32:08'),(887,35,NULL,'Ajabpur','2017-11-29 10:32:08','2017-11-29 10:32:08'),(888,35,NULL,'Aligarh','2017-11-29 10:32:08','2017-11-29 10:32:08'),(889,35,NULL,'Allahabad','2017-11-29 10:32:08','2017-11-29 10:32:08'),(890,35,NULL,'Anandnagar','2017-11-29 10:32:08','2017-11-29 10:32:08'),(891,35,NULL,'Arora','2017-11-29 10:32:08','2017-11-29 10:32:08'),(892,35,NULL,'Azamgarh','2017-11-29 10:32:08','2017-11-29 10:32:08'),(893,35,NULL,'Bagpat','2017-11-29 10:32:08','2017-11-29 10:32:08'),(894,35,NULL,'Balu','2017-11-29 10:32:08','2017-11-29 10:32:08'),(895,35,NULL,'Banda','2017-11-29 10:32:08','2017-11-29 10:32:08'),(896,35,NULL,'Bank','2017-11-29 10:32:08','2017-11-29 10:32:08'),(897,35,NULL,'Bareilly','2017-11-29 10:32:08','2017-11-29 10:32:08'),(898,35,NULL,'Basti','2017-11-29 10:32:08','2017-11-29 10:32:08'),(899,35,NULL,'Bela','2017-11-29 10:32:08','2017-11-29 10:32:08'),(900,35,NULL,'Bhadohi','2017-11-29 10:32:08','2017-11-29 10:32:08'),(901,35,NULL,'Bichpuri','2017-11-29 10:32:08','2017-11-29 10:32:08'),(902,35,NULL,'Budaun','2017-11-29 10:32:08','2017-11-29 10:32:08'),(903,35,NULL,'Bulandshahr','2017-11-29 10:32:08','2017-11-29 10:32:08'),(904,35,NULL,'Chandauli','2017-11-29 10:32:08','2017-11-29 10:32:08'),(905,35,NULL,'Chandausi','2017-11-29 10:32:08','2017-11-29 10:32:08'),(906,35,NULL,'Chitra','2017-11-29 10:32:08','2017-11-29 10:32:08'),(907,35,NULL,'Dadri','2017-11-29 10:32:08','2017-11-29 10:32:08'),(908,35,NULL,'Dasna','2017-11-29 10:32:08','2017-11-29 10:32:08'),(909,35,NULL,'Deoria','2017-11-29 10:32:08','2017-11-29 10:32:08'),(910,35,NULL,'Etawah','2017-11-29 10:32:08','2017-11-29 10:32:08'),(911,35,NULL,'Faizabad','2017-11-29 10:32:09','2017-11-29 10:32:09'),(912,35,NULL,'Fatehgarh','2017-11-29 10:32:09','2017-11-29 10:32:09'),(913,35,NULL,'Fatehpur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(914,35,NULL,'Firozabad','2017-11-29 10:32:09','2017-11-29 10:32:09'),(915,35,NULL,'Ghaziabad','2017-11-29 10:32:09','2017-11-29 10:32:09'),(916,35,NULL,'Gonda','2017-11-29 10:32:09','2017-11-29 10:32:09'),(917,35,NULL,'Gorakhpur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(918,35,NULL,'Hamirpur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(919,35,NULL,'Hapur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(920,35,NULL,'Iglas','2017-11-29 10:32:09','2017-11-29 10:32:09'),(921,35,NULL,'Jalesar','2017-11-29 10:32:09','2017-11-29 10:32:09'),(922,35,NULL,'Jaunpur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(923,35,NULL,'Jhansi','2017-11-29 10:32:09','2017-11-29 10:32:09'),(924,35,NULL,'Kaimganj','2017-11-29 10:32:09','2017-11-29 10:32:09'),(925,35,NULL,'Kanpur','2017-11-29 10:32:09','2017-11-29 10:32:09'),(926,35,NULL,'Karari','2017-11-29 10:32:09','2017-11-29 10:32:09'),(927,35,NULL,'Kasganj','2017-11-29 10:32:09','2017-11-29 10:32:09'),(928,35,NULL,'Kasia','2017-11-29 10:32:09','2017-11-29 10:32:09'),(929,35,NULL,'Khandar','2017-11-29 10:32:09','2017-11-29 10:32:09'),(930,35,NULL,'Khatauli','2017-11-29 10:32:09','2017-11-29 10:32:09'),(931,35,NULL,'Kheri','2017-11-29 10:32:09','2017-11-29 10:32:09'),(932,35,NULL,'Khurja','2017-11-29 10:32:09','2017-11-29 10:32:09'),(933,35,NULL,'Kunwar','2017-11-29 10:32:09','2017-11-29 10:32:09'),(934,35,NULL,'Lakhimpur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(935,35,NULL,'Lucknow','2017-11-29 10:32:10','2017-11-29 10:32:10'),(936,35,NULL,'Madhoganj','2017-11-29 10:32:10','2017-11-29 10:32:10'),(937,35,NULL,'Mathan','2017-11-29 10:32:10','2017-11-29 10:32:10'),(938,35,NULL,'Mathura','2017-11-29 10:32:10','2017-11-29 10:32:10'),(939,35,NULL,'Mawana','2017-11-29 10:32:10','2017-11-29 10:32:10'),(940,35,NULL,'Meerut','2017-11-29 10:32:10','2017-11-29 10:32:10'),(941,35,NULL,'Mehra','2017-11-29 10:32:10','2017-11-29 10:32:10'),(942,35,NULL,'Mirza Murad','2017-11-29 10:32:10','2017-11-29 10:32:10'),(943,35,NULL,'Mirzapur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(944,35,NULL,'Mohan','2017-11-29 10:32:10','2017-11-29 10:32:10'),(945,35,NULL,'Moradabad','2017-11-29 10:32:10','2017-11-29 10:32:10'),(946,35,NULL,'Muzaffarnagar','2017-11-29 10:32:10','2017-11-29 10:32:10'),(947,35,NULL,'Noida','2017-11-29 10:32:10','2017-11-29 10:32:10'),(948,35,NULL,'Orai','2017-11-29 10:32:10','2017-11-29 10:32:10'),(949,35,NULL,'Padrauna','2017-11-29 10:32:10','2017-11-29 10:32:10'),(950,35,NULL,'Phaphamau','2017-11-29 10:32:10','2017-11-29 10:32:10'),(951,35,NULL,'Pilkhuwa','2017-11-29 10:32:10','2017-11-29 10:32:10'),(952,35,NULL,'Potti','2017-11-29 10:32:10','2017-11-29 10:32:10'),(953,35,NULL,'Rampur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(954,35,NULL,'Saharanpur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(955,35,NULL,'Sahibabad','2017-11-29 10:32:10','2017-11-29 10:32:10'),(956,35,NULL,'Shahjahanpur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(957,35,NULL,'Shamsabad','2017-11-29 10:32:10','2017-11-29 10:32:10'),(958,35,NULL,'Sikka','2017-11-29 10:32:10','2017-11-29 10:32:10'),(959,35,NULL,'Sitapur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(960,35,NULL,'Sultanpur','2017-11-29 10:32:10','2017-11-29 10:32:10'),(961,35,NULL,'Tanda','2017-11-29 10:32:10','2017-11-29 10:32:10'),(962,35,NULL,'Teri','2017-11-29 10:32:10','2017-11-29 10:32:10'),(963,35,NULL,'Tikamgarh','2017-11-29 10:32:10','2017-11-29 10:32:10'),(964,35,NULL,'Unnao','2017-11-29 10:32:11','2017-11-29 10:32:11'),(965,35,NULL,'Varanasi','2017-11-29 10:32:11','2017-11-29 10:32:11'),(966,36,NULL,'Alipur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(967,36,NULL,'Asansol','2017-11-29 10:32:11','2017-11-29 10:32:11'),(968,36,NULL,'Baharampur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(969,36,NULL,'Baidyabati','2017-11-29 10:32:11','2017-11-29 10:32:11'),(970,36,NULL,'Bali','2017-11-29 10:32:11','2017-11-29 10:32:11'),(971,36,NULL,'Balurghat','2017-11-29 10:32:11','2017-11-29 10:32:11'),(972,36,NULL,'Bangaon','2017-11-29 10:32:11','2017-11-29 10:32:11'),(973,36,NULL,'Bankura','2017-11-29 10:32:11','2017-11-29 10:32:11'),(974,36,NULL,'Barakpur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(975,36,NULL,'Barddhaman','2017-11-29 10:32:11','2017-11-29 10:32:11'),(976,36,NULL,'Basirhat','2017-11-29 10:32:11','2017-11-29 10:32:11'),(977,36,NULL,'Behala','2017-11-29 10:32:11','2017-11-29 10:32:11'),(978,36,NULL,'Belgharia','2017-11-29 10:32:11','2017-11-29 10:32:11'),(979,36,NULL,'Binnaguri','2017-11-29 10:32:11','2017-11-29 10:32:11'),(980,36,NULL,'Bishnupur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(981,36,NULL,'Bolpur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(982,36,NULL,'Budbud','2017-11-29 10:32:11','2017-11-29 10:32:11'),(983,36,NULL,'Canning','2017-11-29 10:32:11','2017-11-29 10:32:11'),(984,36,NULL,'Chandannagar','2017-11-29 10:32:11','2017-11-29 10:32:11'),(985,36,NULL,'Dam Dam','2017-11-29 10:32:11','2017-11-29 10:32:11'),(986,36,NULL,'Darjeeling','2017-11-29 10:32:11','2017-11-29 10:32:11'),(987,36,NULL,'Durgapur','2017-11-29 10:32:11','2017-11-29 10:32:11'),(988,36,NULL,'Farakka','2017-11-29 10:32:11','2017-11-29 10:32:11'),(989,36,NULL,'Ghatal','2017-11-29 10:32:11','2017-11-29 10:32:11'),(990,36,NULL,'Gujrat','2017-11-29 10:32:12','2017-11-29 10:32:12'),(991,36,NULL,'Habra','2017-11-29 10:32:12','2017-11-29 10:32:12'),(992,36,NULL,'Haldia','2017-11-29 10:32:12','2017-11-29 10:32:12'),(993,36,NULL,'Haripur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(994,36,NULL,'Howrah','2017-11-29 10:32:12','2017-11-29 10:32:12'),(995,36,NULL,'Hugli','2017-11-29 10:32:12','2017-11-29 10:32:12'),(996,36,NULL,'Jadabpur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(997,36,NULL,'Jalpaiguri','2017-11-29 10:32:12','2017-11-29 10:32:12'),(998,36,NULL,'Jayanti','2017-11-29 10:32:12','2017-11-29 10:32:12'),(999,36,NULL,'Jhargram','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1000,36,NULL,'Kakdwip','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1001,36,NULL,'Kalyani','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1002,36,NULL,'Kanchrapara','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1003,36,NULL,'Kandi','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1004,36,NULL,'Karsiyang','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1005,36,NULL,'Katoya','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1006,36,NULL,'Kharagpur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1007,36,NULL,'Koch Bihar','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1008,36,NULL,'Kolkata','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1009,36,NULL,'Konnagar','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1010,36,NULL,'Kulti','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1011,36,NULL,'Liluah','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1012,36,NULL,'Maldah','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1013,36,NULL,'Manipur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1014,36,NULL,'Mayapur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1015,36,NULL,'Medinipur','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1016,36,NULL,'Multi','2017-11-29 10:32:12','2017-11-29 10:32:12'),(1017,36,NULL,'Murshidabad','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1018,36,NULL,'Nabadwip','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1019,36,NULL,'Panchal','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1020,36,NULL,'Puruliya','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1021,36,NULL,'Rajpur','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1022,36,NULL,'Ranaghat','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1023,36,NULL,'Raniganj','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1024,36,NULL,'Rudrapur','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1025,36,NULL,'Rupnarayanpur','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1026,36,NULL,'Salt Lake City','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1027,36,NULL,'Saranga','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1028,36,NULL,'Serampore','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1029,36,NULL,'Shyamnagar','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1030,36,NULL,'Siliguri','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1031,36,NULL,'Siuri','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1032,23,NULL,'Shajapur','2017-11-29 10:32:13','2017-11-29 10:32:13'),(1033,15,NULL,'EAST SINGHBHUM','2017-12-02 05:32:37','2017-12-02 05:32:37'),(1034,37,NULL,'Thiruvannamalai','2017-12-02 05:32:39','2017-12-02 05:32:39'),(1035,37,NULL,'Pondicherry','2017-12-02 05:32:39','2017-12-02 05:32:39'),(1036,37,NULL,'Pudukottai','2017-12-02 05:32:39','2017-12-02 05:32:39'),(1037,37,NULL,'Thiruvallur','2017-12-02 05:32:39','2017-12-02 05:32:39'),(1038,38,NULL,'Uttrakhand','2017-12-02 05:32:40','2017-12-02 05:32:40'),(1039,37,NULL,'KANYAKUMARI','2017-12-02 05:32:42','2017-12-02 05:32:42'),(1040,17,NULL,'Banglore','2017-12-02 05:32:42','2017-12-02 05:32:42'),(1041,2,NULL,'Andhra Pradesh','2017-12-02 05:32:43','2017-12-02 05:32:43'),(1042,2,NULL,'Vizag','2017-12-02 05:32:43','2017-12-02 05:32:43'),(1043,27,NULL,'punjab','2017-12-02 05:32:44','2017-12-02 05:32:44'),(1044,37,NULL,'Ramanadhapuram','2017-12-02 05:32:44','2017-12-02 05:32:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (1,81,'2017-12-04','Paid Leave',NULL,NULL,NULL,0,12,1.00,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-04 05:54:32','2017-12-04 05:54:32'),(2,81,'2017-12-05','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Leave Request Pending','2017-12-04 05:58:26','2017-12-04 05:58:26'),(7,3,'2017-12-05','P/PL',NULL,NULL,NULL,0,NULL,0.50,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-04 07:33:44','2017-12-04 07:33:44'),(10,3,'2017-12-07','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Leave Request Pending','2017-12-04 07:42:16','2017-12-04 07:42:16'),(11,3,'2017-12-11','SL',NULL,NULL,NULL,0,NULL,1.00,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-04 07:43:21','2017-12-04 07:43:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
INSERT INTO `employee_bank_details` VALUES (1,1,1,'50710110002850',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9386727342','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(2,2,1,'50710110002831',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(3,3,1,'50710110002820',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705816','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(4,4,1,'50710110002822',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705901','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(5,5,1,'50710110002851',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9962099178','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(6,6,1,'50710110002829',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(7,7,1,'50710110002824',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705819','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(8,8,1,'50710110006509',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705829','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(9,9,1,'50710110002911',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705906','411013020','000507','BKID0000507','2017-12-02 05:33:33','2017-12-02 05:33:33'),(10,10,1,'50710110002102',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001210','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(11,11,1,'50710110002830',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705806','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(12,12,1,'50710110002415',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(13,13,1,'50710110002823',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7812045457','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(14,14,1,'50710110000292',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705818','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(15,15,1,'50710110002836',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(16,16,1,'50710110002833',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705808','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(17,17,1,'50710110022401',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705905','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(18,18,1,'50710110005142',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(19,19,1,'50710110005143',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(20,20,1,'50710110002838',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705822','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(21,21,1,'50710110006200',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8798083633','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(22,22,1,'50710110006203',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(23,23,1,'50710110006192',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001202','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(24,24,1,'50710110006160',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(25,25,1,'50710110006202',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705831','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(26,26,1,'50710110006201',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(27,27,1,'50710110007600',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9512750013','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(28,28,1,'50710110007488',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(29,29,1,'50710310000903',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224494','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(30,30,1,'50710110007667',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra ','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(31,31,1,'50710110008077',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(32,32,1,'50710110008088',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(33,33,1,'50710110008825',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705902','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(34,34,1,'50710110008827',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705821','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(35,35,1,'50710110009290',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224492','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(36,36,1,'450010110008116',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9386727343','831013002','004500','BKID0004500','2017-12-02 05:33:34','2017-12-02 05:33:34'),(37,37,1,'50710310000154',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705835','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(38,38,1,'50710310000190',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705814','411013020','000507','BKID0000507','2017-12-02 05:33:34','2017-12-02 05:33:34'),(39,39,1,'50710110009666',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(40,40,1,'50710310000209',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(41,41,1,'50710310000208',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705801','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(42,42,1,'670210110005617',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','0','110013051','006702','BKID0006702','2017-12-02 05:33:35','2017-12-02 05:33:35'),(43,43,1,'50710310000206',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9386727341','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(44,44,1,'50710310000213',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(45,45,1,'50710310000204',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(46,46,1,'50710310000212',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705807','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(47,47,1,'50710310000254',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705809','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(48,48,1,'670210110006168',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','8600236295','110013051','006702','BKID0006702','2017-12-02 05:33:35','2017-12-02 05:33:35'),(49,49,1,'50710110013995',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705817','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(50,50,1,'50710110013996',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705810','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(51,51,1,'50710110013982',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705836','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(52,52,1,'50710310000750',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9407851901','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(53,53,1,'50710110007045',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705827','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(54,54,1,'50710310000969',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224497','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(55,55,1,'50710310001230',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9840307220','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(56,56,1,'50710310001229',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705830','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(57,57,1,'670210110009464',NULL,'Ballabgarh','Akash Theatre,mohana Road Ballabgrah','8939645458','110013051','006702','BKID0006702','2017-12-02 05:33:35','2017-12-02 05:33:35'),(58,58,1,'712010110007841',NULL,'Greater Noida','C6-7, F block Beta-II, Greater Noida','9372705904','110013081','007120','BKID0007120','2017-12-02 05:33:35','2017-12-02 05:33:35'),(59,59,1,'50710410000029',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8144645457','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(60,60,1,'50710110006196',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:35','2017-12-02 05:33:35'),(61,61,1,'800410110006534',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','7428224495','600013014','008004','BKID0008004','2017-12-02 05:33:35','2017-12-02 05:33:35'),(62,62,1,'801116510000046',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705826','600013005','008011','BKID0008011','2017-12-02 05:33:35','2017-12-02 05:33:35'),(63,63,1,'801110110009614',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','0','600013005','008011','BKID0008011','2017-12-02 05:33:35','2017-12-02 05:33:35'),(64,64,1,'53610310001008',NULL,'AUNDH-BANER','274/2 HNO594 DONGRE PA, TIL BUNGLOW BANER MAHARASHTRA, PUNE, 411045','9372705913','411013037','000536','BKID0000536','2017-12-02 05:33:36','2017-12-02 05:33:36'),(65,65,1,'50710110019507',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705824','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(66,66,1,'801116510000089',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705811','600013005','008011','BKID0008011','2017-12-02 05:33:36','2017-12-02 05:33:36'),(67,67,1,'50710110020329',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705912','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(68,68,1,'50710110019828',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705828','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(69,69,1,'50710110020942',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9176525459','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(70,70,1,'50710110020243',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(71,71,1,'450010110008876',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9325882324','831013002','004500','BKID0004500','2017-12-02 05:33:36','2017-12-02 05:33:36'),(72,72,1,'963710110002546',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','8939645450','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(73,73,1,'689210110002800',NULL,'Avas Vikas',' A-9, AVAS VIKAS, RUDRAPUR, DIST. UDHAMSINGH NAGAR','7410001204','263013202','006892','BKID0006892','2017-12-02 05:33:36','2017-12-02 05:33:36'),(74,74,1,'50710110007646',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705838','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(75,75,1,'50810100017654',NULL,'Swargate','SWAR GATE,34/35, PARWATI DARSHAN,SWAR GATE,PUNE,411009,MAHARASHTRA','9372705805','411013013','000508','BKID0000508','2017-12-02 05:33:36','2017-12-02 05:33:36'),(76,76,1,'50710110013987',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705911','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(77,77,1,'670210110005619',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(78,78,1,'50710110020781',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(79,79,1,'450010110008113',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','0','831013002','004500','BKID0004500','2017-12-02 05:33:36','2017-12-02 05:33:36'),(80,80,1,'450010110008114',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','0','831013002','004500','BKID0004500','2017-12-02 05:33:36','2017-12-02 05:33:36'),(81,81,1,'50710110021055',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(82,82,1,'50710110021127',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(83,83,1,'50710310000959',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','3972705812','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(84,84,1,'50710110021022',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(85,85,1,'50710110021406',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(86,86,1,'50710110021452',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:36','2017-12-02 05:33:36'),(87,87,1,'801110510000464',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','9372705820','600013005','008011','BKID0008011','2017-12-02 05:33:36','2017-12-02 05:33:36'),(88,88,1,'61210110006949',NULL,'Walchandnagar','At And Post Walchandnagar, City Kalamb, Dist Pune 413114','7406842424','0','000612','BKID0000612','2017-12-02 05:33:36','2017-12-02 05:33:36'),(89,90,1,'801110510000481',NULL,'Guindy','NO. 111,MOUNT VIEW,MOUNT,GUINDY,CHENNAI-600032','7410001203','600013005','008011','BKID0008011','2017-12-02 05:33:36','2017-12-02 05:33:36'),(90,91,1,'50710110021518',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9543845457','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(91,92,1,'50710310000724',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705813','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(92,93,1,'206810110012732',NULL,'Meghaninagar','47, Jyoti Darshan Society, Nr. Pooja & Ashirwad Hospital, Meghaninagar, Ahmedabad - 380 016','9372705802','411013082','002068','BKID0002068','2017-12-02 05:33:37','2017-12-02 05:33:37'),(93,94,1,'274410310000211',NULL,'RAJULA ','LAKHANI CHAMBERS, TOWER ROAD, RAJULA. DIST AMRELI','9372705825','365013503','002744','BKID0002744','2017-12-02 05:33:37','2017-12-02 05:33:37'),(94,95,1,'827510110007947',NULL,'NAGERCOIL','885 KP ROAD,WARD NO 27 R,NAGERCOIL,629001,TAMIL NADU ','9372705815','0','008275','BKID0008275','2017-12-02 05:33:37','2017-12-02 05:33:37'),(95,96,1,'841310110008356',NULL,'JP Nagar','JAYAPRAKASH NAGAR,71,50/2, 15TH CROSS,JP NAGAR, 6TH PHASE,BANGALORE','0','560013022','008413','BKID0008413','2017-12-02 05:33:37','2017-12-02 05:33:37'),(96,97,1,'670010110015463',NULL,'NIT Faridabad','2-A/6, BUNGLOW NIT Faridabad','0','110013053','006700','BKID0006700','2017-12-02 05:33:37','2017-12-02 05:33:37'),(97,98,1,'50710110008445',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(98,99,1,'805710310000938',NULL,'SRIPERUMBADUR','150/ 1 & 151 /1 BY-PASS SRIPERUMBUDUR','9092543481','600013035','008057','BKID0008057','2017-12-02 05:33:37','2017-12-02 05:33:37'),(99,100,1,'50710110022368',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705833','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(100,101,1,'50710110022379',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(101,102,1,'50710410000013',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(102,103,1,'861910110004415',NULL,'Harbour Road','Harbour Road Branch,manganese House,,harbour Road,,vishakapatnam,530001,andhra Pradesh','9372705803','530013003','008619','BKID0008619','2017-12-02 05:33:37','2017-12-02 05:33:37'),(103,104,1,'450010110014015',NULL,'JAMSHEDPUR','BISTUPUR,PO BOX NO.-36,JAMSHDPUR,JHARKHAND-831001','9304066621','831013002','004500','BKID0004500','2017-12-02 05:33:37','2017-12-02 05:33:37'),(104,105,1,'800410110007484',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','0','600013014','008004','BKID0008004','2017-12-02 05:33:37','2017-12-02 05:33:37'),(105,106,1,'50716310000028',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9325609620','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(106,107,1,'50710110022637',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705804','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(107,108,1,'50716310000027',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(108,109,1,'50716310000026',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7428224493','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(109,110,1,'805710110002068',NULL,'Sriperumbudur','150/1 &151/1 BY PASS ,SRIPERUMBUDUR ,TAMIL NADU ,602105','7410001201','600013035','008057','BKID0008057','2017-12-02 05:33:37','2017-12-02 05:33:37'),(110,111,1,'805710110002067',NULL,'Sriperumbudur','150/1 &151/1 BY PASS ,SRIPERUMBUDUR ,TAMIL NADU ,602105','9372705832','600013035','008057','BKID0008057','2017-12-02 05:33:37','2017-12-02 05:33:37'),(111,112,1,'202010110026774',NULL,'GANDHINAGAR','GANDHINAGAR,SECTOR 16, NEAR PATNAG,YOJANA B, GANDHINAGAR,AHMEDABAD,382016,GUJARAT','9372705823','380013044','002020','BKID0002020','2017-12-02 05:33:37','2017-12-02 05:33:37'),(112,113,1,'50710310002693',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(113,114,1,'50710310002692',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(114,115,1,'50710310002696',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(115,116,1,'50710310002560',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9727651695','411013020','000507','BKID0000507','2017-12-02 05:33:37','2017-12-02 05:33:37'),(116,117,1,'50710310002559',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705908','411013020','000507','BKID0000507','2017-12-02 05:33:38','2017-12-02 05:33:38'),(117,118,1,'670010110016215',NULL,'NIT Faridabad','2-A/6, BUNGLOW NIT Faridabad','0','110013053','006700','BKID0006700','2017-12-02 05:33:38','2017-12-02 05:33:38'),(118,119,1,'805710310000979',NULL,'SRIPERUMBUDUR ','SRIPERUMBUDUR (TN)-602105','7410001208','600013035','008057','BKID0008057','2017-12-02 05:33:38','2017-12-02 05:33:38'),(119,120,1,'801110110010078',NULL,'Guindy','Guindy,spic Centre,44-a Mount Road Guindy,chennai,600032,tamil Nadu','7428224498','600013005','008011','BKID0008011','2017-12-02 05:33:38','2017-12-02 05:33:38'),(120,121,1,'800410310001203',NULL,'T-Nagar','T Nagar,104 Sir Theagaroya Rd,t.nagar,chennai,60017,tamil Nadu','0','600013014','008004','BKID0008004','2017-12-02 05:33:38','2017-12-02 05:33:38'),(121,122,1,'50310110019903',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','7410001205','411013020','000507','BKID0000507','2017-12-02 05:33:38','2017-12-02 05:33:38'),(122,123,1,'0',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','9372705910','411013020','000507','BKID0000507','2017-12-02 05:33:38','2017-12-02 05:33:38'),(123,124,1,'50710110023116',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:38','2017-12-02 05:33:38'),(124,125,1,'50810100011954',NULL,'Swargate','SWAR GATE,34/35, PARWATI DARSHAN,SWAR GATE,PUNE,411009,MAHARASHTRA','9371769137','411013013','000508','BKID0000508','2017-12-02 05:33:38','2017-12-02 05:33:38'),(125,126,1,'50710110002860',NULL,'Pimpri','Pimpri,pimpri Pf,pb No 1101,pune,411018,maharashtra','0','411013020','000507','BKID0000507','2017-12-02 05:33:38','2017-12-02 05:33:38');
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
INSERT INTO `employee_categories` VALUES (1,'1001','Director',NULL,NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(2,'1002','Staff',NULL,NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(3,'1003','Worker',NULL,NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,NULL,'Commercial Officer',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(2,NULL,'I & C Manager',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(3,NULL,'Development Head',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(4,NULL,'I&C Technician',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(5,NULL,'OMS & OPD Lead',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(6,NULL,'Service Manager Ops.',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(7,NULL,'I & C Supervisor',NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(8,NULL,'Dispatch Team leader',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(9,NULL,'Fitter operator',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(10,NULL,'Store Incharge',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(11,NULL,'Production Technician(Elect.)',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(12,NULL,'Key Account Manager',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(13,NULL,'TL (Cranes)',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(14,NULL,'Project Engineer',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(15,NULL,'Commercial Head',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(16,NULL,'QA/Dispatch Tech',NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(17,NULL,'I&C Head',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(18,NULL,'IT Manager /Cum Corporate',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(19,NULL,'SCM Head',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(20,NULL,'Design Head',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(21,NULL,'Lead estimator',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(22,NULL,'Account Executive',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(23,NULL,'Regional Manager-Regional Sales',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(24,NULL,'Project Estimator',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(25,NULL,'Service engineer',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(26,NULL,'Buyer (Local & Import)',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(27,NULL,'Head After Sales Service',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(28,NULL,'Buyer (Sub cont.& RM)',NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12'),(29,NULL,'Store Team leader',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(30,NULL,'Project Admin',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(31,NULL,'Electrician',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(32,NULL,'Production technician(Mech.)',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(33,NULL,'Service engineer-North',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(34,NULL,'QA Tech',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(35,NULL,'Production Engineer',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(36,NULL,'Jr.Quality',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(37,NULL,'Commercial Assistant',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(38,NULL,'Project Manager(North) Med Proj',NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13'),(39,NULL,'Head Projects',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(40,NULL,'Expeditor',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(41,NULL,'Maintenance executive',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(42,NULL,'TL (Special projects)',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(43,NULL,'Production TL (Mech)',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(44,NULL,'TL (New product development)',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(45,NULL,'Sales Admin',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(46,NULL,'TL ( Fixtures& Offshore)',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(47,NULL,'Regional Sales Manager-W&S',NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14'),(48,NULL,'Project Manager(South) Med Proj',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(49,NULL,'Sr.Sales Engineer',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(50,NULL,'System Admin',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(51,NULL,'Draughtsman',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(52,NULL,'HR & Admin',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(53,NULL,'Design Engineer',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(54,NULL,'Assistant Manager HR',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(55,NULL,'Service engineer-East',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(56,NULL,'Project Manager',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(57,NULL,'Key Account Head',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(58,NULL,'Director',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(59,NULL,'Service Manager West',NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15'),(60,NULL,'Component Business Manager',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(61,NULL,'I & C Engineer',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(62,NULL,'HR Executive',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(63,NULL,'Site Engineer',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(64,NULL,'ERP Implementation Engineer',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(65,NULL,'GET',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(66,NULL,'Safety officer',NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(67,NULL,'Manufacturing Manager',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(68,NULL,'Sales Engineer',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(69,NULL,'I & C Technician',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(70,NULL,'Senior Engineer Quality',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(71,NULL,'Service & Sales Engineer',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(72,NULL,'Quality Engineer',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(73,NULL,'EA to MD',NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17'),(74,NULL,'GET Sales',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(75,NULL,'GET I & C',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(76,NULL,'GET Manufacturing',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(77,NULL,'GET Projects',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(78,NULL,'Sales & Service engineer',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(79,NULL,'Stores Executive',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(80,NULL,'Sr.Quality Engineer',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(81,NULL,'GET Service',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18'),(82,NULL,'Head INDSTHAL',NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18');
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
INSERT INTO `employee_grades` VALUES (1,'1001.0','G',NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(2,NULL,'JMC4',NULL,'2017-12-02 05:33:09','2017-12-02 05:33:09'),(3,NULL,'MMC1',NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(4,NULL,'JMC1',NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(5,NULL,'JMC3',NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10'),(6,NULL,'MMC2',NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11'),(7,NULL,'JMC2',NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16'),(8,NULL,'JMC 4',NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16');
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
  `carry_forward` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collapse_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `working_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_balances_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_balances_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_258306096f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_42e9a9a920` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (1,1,9,'9.5',NULL,'9.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:18','2017-12-04 04:29:33','9.5','9.5','0.0','0.0'),(2,2,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:18','2017-12-04 04:29:33','30.0','30.0','0.0','0.0'),(3,3,9,'30.5',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:18','2017-12-04 07:39:38','30.0','30.0','0.0','0.0'),(4,4,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:33','30.0','30.0','0.0','0.0'),(5,5,9,'26.0',NULL,'26.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','26.0','26.0','0.0','0.0'),(6,6,9,'27.0',NULL,'27.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','27.0','27.0','0.0','0.0'),(7,7,9,'25.0',NULL,'25.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','25.0','25.0','0.0','0.0'),(8,8,9,'24.5',NULL,'24.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','24.5','24.5','0.0','0.0'),(9,9,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(10,10,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(11,11,9,'8.5',NULL,'8.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','8.5','8.5','0.0','0.0'),(12,12,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(13,13,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','0.0','0.0','0.0','0.0'),(14,14,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(15,15,9,'25.0',NULL,'25.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','25.0','25.0','0.0','0.0'),(16,16,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(17,17,9,'27.0',NULL,'27.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','27.0','27.0','0.0','0.0'),(18,18,9,'21.0',NULL,'21.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','21.0','21.0','0.0','0.0'),(19,19,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','0.0','0.0','0.0','0.0'),(20,20,9,'25.0',NULL,'25.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:19','2017-12-04 04:29:34','25.0','25.0','0.0','0.0'),(21,21,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:34','30.0','30.0','0.0','0.0'),(22,22,9,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','4.0','4.0','0.0','0.0'),(23,23,9,'28.0',NULL,'28.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','28.0','28.0','0.0','0.0'),(24,24,9,'27.0',NULL,'27.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','27.0','27.0','0.0','0.0'),(25,25,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(26,26,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','0.0','0.0','0.0','0.0'),(27,27,9,'28.5',NULL,'28.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','28.5','28.5','0.0','0.0'),(28,28,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(29,29,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(30,30,9,'8.5',NULL,'8.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','8.5','8.5','0.0','0.0'),(31,31,9,'29.0',NULL,'29.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','29.0','29.0','0.0','0.0'),(32,32,9,'14.5',NULL,'14.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','14.5','14.5','0.0','0.0'),(33,33,9,'14.5',NULL,'14.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','14.5','14.5','0.0','0.0'),(34,34,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(35,35,9,'17.0',NULL,'17.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','17.0','17.0','0.0','0.0'),(36,36,9,'20.0',NULL,'20.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','20.0','20.0','0.0','0.0'),(37,37,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(38,38,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:20','2017-12-04 04:29:35','30.0','30.0','0.0','0.0'),(39,39,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','30.0','30.0','0.0','0.0'),(40,40,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','0.0','0.0','0.0','0.0'),(41,41,9,'25.0',NULL,'25.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','25.0','25.0','0.0','0.0'),(42,42,9,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','7.5','7.5','0.0','0.0'),(43,43,9,'26.5',NULL,'26.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','26.5','26.5','0.0','0.0'),(44,44,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','0.0','0.0','0.0','0.0'),(45,45,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','30.0','30.0','0.0','0.0'),(46,46,9,'25.0',NULL,'25.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','25.0','25.0','0.0','0.0'),(47,47,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','30.0','30.0','0.0','0.0'),(48,48,9,'16.0',NULL,'16.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','16.0','16.0','0.0','0.0'),(49,49,9,'13.0',NULL,'13.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','13.0','13.0','0.0','0.0'),(50,50,9,'22.5',NULL,'22.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','22.5','22.5','0.0','0.0'),(51,51,9,'24.0',NULL,'24.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','24.0','24.0','0.0','0.0'),(52,52,9,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','7.5','7.5','0.0','0.0'),(53,53,9,'17.5',NULL,'17.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','17.5','17.5','0.0','0.0'),(54,54,9,'27.5',NULL,'27.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','27.5','27.5','0.0','0.0'),(55,55,9,'10.0',NULL,'10.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','10.0','10.0','0.0','0.0'),(56,56,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:21','2017-12-04 04:29:36','30.0','30.0','0.0','0.0'),(57,57,9,'21.0',NULL,'21.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:36','21.0','21.0','0.0','0.0'),(58,58,9,'14.0',NULL,'14.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','14.0','14.0','0.0','0.0'),(59,59,9,'11.5',NULL,'11.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','11.5','11.5','0.0','0.0'),(60,60,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','30.0','30.0','0.0','0.0'),(61,61,9,'24.0',NULL,'24.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','24.0','24.0','0.0','0.0'),(62,62,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','30.0','30.0','0.0','0.0'),(63,63,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','0.0','0.0','0.0','0.0'),(64,64,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','30.0','30.0','0.0','0.0'),(65,65,9,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','7.5','7.5','0.0','0.0'),(66,66,9,'30.0',NULL,'30.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','30.0','30.0','0.0','0.0'),(67,67,9,'9.0',NULL,'9.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','9.0','9.0','0.0','0.0'),(68,68,9,'16.5',NULL,'16.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','16.5','16.5','0.0','0.0'),(69,69,9,'15.0',NULL,'15.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','15.0','15.0','0.0','0.0'),(70,70,9,'10.0',NULL,'10.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','10.0','10.0','0.0','0.0'),(71,71,9,'11.0',NULL,'11.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','11.0','11.0','0.0','0.0'),(72,72,9,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','8.0','8.0','0.0','0.0'),(73,73,9,'15.0',NULL,'15.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:22','2017-12-04 04:29:37','15.0','15.0','0.0','0.0'),(74,74,9,'15.0',NULL,'15.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:37','15.0','15.0','0.0','0.0'),(75,75,9,'15.0',NULL,'15.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','15.0','15.0','0.0','0.0'),(76,76,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(77,77,9,'2.5',NULL,'2.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','2.5','2.5','0.0','0.0'),(78,78,9,'5.0',NULL,'5.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','5.0','5.0','0.0','0.0'),(79,79,9,'11.0',NULL,'11.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','11.0','11.0','0.0','0.0'),(80,80,9,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','4.0','4.0','0.0','0.0'),(81,81,9,'2.0',NULL,'5.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 07:00:35','5.5','5.5','0.0','0.0'),(82,83,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(83,84,9,'9.0',NULL,'9.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','9.0','9.0','0.0','0.0'),(84,85,9,'9.0',NULL,'9.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','9.0','9.0','0.0','0.0'),(85,86,9,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','3.0','3.0','0.0','0.0'),(86,87,9,'6.0',NULL,'6.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','6.0','6.0','0.0','0.0'),(87,88,9,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','1.0','1.0','0.0','0.0'),(88,90,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(89,91,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(90,92,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(91,93,9,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:23','2017-12-04 04:29:38','4.0','4.0','0.0','0.0'),(92,94,9,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:38','8.0','8.0','0.0','0.0'),(93,95,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:38','0.0','0.0','0.0','0.0'),(94,96,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(95,97,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(96,98,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(97,99,9,'5.0',NULL,'5.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','5.0','5.0','0.0','0.0'),(98,100,9,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','7.5','7.5','0.0','0.0'),(99,101,9,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','7.5','7.5','0.0','0.0'),(100,102,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(101,103,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(102,104,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(103,105,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(104,106,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(105,107,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(106,108,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(107,109,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(108,110,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(109,111,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:24','2017-12-04 04:29:39','0.0','0.0','0.0','0.0'),(110,112,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(111,113,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(112,114,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(113,115,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(114,116,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(115,117,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(116,118,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(117,119,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:40','0.0','0.0','0.0','0.0'),(118,120,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','0.0','0.0','0.0','0.0'),(119,121,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','0.0','0.0','0.0','0.0'),(120,122,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','0.0','0.0','0.0','0.0'),(121,123,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','0.0','0.0','0.0','0.0'),(122,124,9,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','0.0','0.0','0.0','0.0'),(123,125,9,'15.0',NULL,'15.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','15.0','15.0','0.0','0.0'),(124,126,9,'27.0',NULL,'27.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:29:25','2017-12-04 04:29:41','27.0','27.0','0.0','0.0'),(125,1,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','0.0','0.0','0.0','0.0'),(126,2,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','0.0','0.0','0.0','0.0'),(127,3,1,'2.5',NULL,'2.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 07:41:03','2.5','2.5','0.0','0.0'),(128,4,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','0.0','0.0','0.0','0.0'),(129,5,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','3.0','3.0','0.0','0.0'),(130,6,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','0.0','0.0','0.0','0.0'),(131,7,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:37','2017-12-04 04:33:37','0.0','0.0','0.0','0.0'),(132,8,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(133,9,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(134,10,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','3.0','3.0','0.0','0.0'),(135,11,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(136,12,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(137,13,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(138,14,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.5','0.5','0.0','0.0'),(139,15,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','1.0','1.0','0.0','0.0'),(140,16,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(141,17,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','2.0','2.0','0.0','0.0'),(142,18,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','1.0','1.0','0.0','0.0'),(143,19,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','1.0','1.0','0.0','0.0'),(144,20,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(145,21,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(146,22,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(147,23,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:38','2017-12-04 04:33:38','0.0','0.0','0.0','0.0'),(148,24,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','4.0','4.0','0.0','0.0'),(149,25,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','3.0','3.0','0.0','0.0'),(150,26,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','1.0','1.0','0.0','0.0'),(151,27,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(152,28,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(153,29,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','1.0','1.0','0.0','0.0'),(154,30,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(155,31,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(156,32,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(157,33,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','3.0','3.0','0.0','0.0'),(158,34,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','4.0','4.0','0.0','0.0'),(159,35,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(160,36,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','2.0','2.0','0.0','0.0'),(161,37,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','1.0','1.0','0.0','0.0'),(162,38,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(163,39,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','1.0','1.0','0.0','0.0'),(164,40,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(165,41,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:39','2017-12-04 04:33:39','0.0','0.0','0.0','0.0'),(166,42,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(167,43,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(168,44,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','3.0','3.0','0.0','0.0'),(169,45,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(170,46,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(171,47,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(172,48,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.5','0.5','0.0','0.0'),(173,49,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(174,50,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(175,51,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(176,52,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.5','0.5','0.0','0.0'),(177,53,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(178,54,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(179,55,1,'5.5',NULL,'5.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','5.5','5.5','0.0','0.0'),(180,56,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(181,57,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(182,58,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','0.0','0.0','0.0','0.0'),(183,59,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:40','2017-12-04 04:33:40','2.0','2.0','0.0','0.0'),(184,60,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','2.0','2.0','0.0','0.0'),(185,61,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.5','0.5','0.0','0.0'),(186,62,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(187,63,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(188,64,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(189,65,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(190,66,1,'2.5',NULL,'2.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','2.5','2.5','0.0','0.0'),(191,67,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(192,68,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','2.0','2.0','0.0','0.0'),(193,69,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(194,70,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(195,71,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(196,72,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','0.0','0.0','0.0','0.0'),(197,73,1,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','8.0','8.0','0.0','0.0'),(198,74,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','1.0','1.0','0.0','0.0'),(199,75,1,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','8.0','8.0','0.0','0.0'),(200,76,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:41','2017-12-04 04:33:41','4.0','4.0','0.0','0.0'),(201,77,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(202,78,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(203,79,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','1.0','1.0','0.0','0.0'),(204,80,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','1.0','1.0','0.0','0.0'),(205,81,1,'11.0',NULL,'10',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 07:23:16','0.0','0.0','0.0','0.0'),(206,83,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(207,84,1,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','8.0','8.0','0.0','0.0'),(208,85,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','1.0','1.0','0.0','0.0'),(209,86,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(210,87,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','3.0','3.0','0.0','0.0'),(211,88,1,'7.0',NULL,'7.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','7.0','7.0','0.0','0.0'),(212,90,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','4.0','4.0','0.0','0.0'),(213,91,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(214,92,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(215,93,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(216,94,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','0.0','0.0','0.0','0.0'),(217,95,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','2.0','2.0','0.0','0.0'),(218,96,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:42','2017-12-04 04:33:42','2.0','2.0','0.0','0.0'),(219,97,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.5','0.5','0.0','0.0'),(220,98,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(221,99,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','4.0','4.0','0.0','0.0'),(222,100,1,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.5','0.5','0.0','0.0'),(223,101,1,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','4.0','4.0','0.0','0.0'),(224,102,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','1.0','1.0','0.0','0.0'),(225,103,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','2.0','2.0','0.0','0.0'),(226,104,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','2.0','2.0','0.0','0.0'),(227,105,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(228,106,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(229,107,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(230,108,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(231,109,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(232,110,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(233,111,1,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','3.0','3.0','0.0','0.0'),(234,112,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','1.0','1.0','0.0','0.0'),(235,113,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:43','2017-12-04 04:33:43','0.0','0.0','0.0','0.0'),(236,114,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','0.0','0.0','0.0','0.0'),(237,115,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','2.0','2.0','0.0','0.0'),(238,116,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','0.0','0.0','0.0','0.0'),(239,117,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','0.0','0.0','0.0','0.0'),(240,118,1,'1.5',NULL,'1.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','1.5','1.5','0.0','0.0'),(241,119,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','1.0','1.0','0.0','0.0'),(242,120,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','2.0','2.0','0.0','0.0'),(243,121,1,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','1.0','1.0','0.0','0.0'),(244,122,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','2.0','2.0','0.0','0.0'),(245,123,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','2.0','2.0','0.0','0.0'),(246,124,1,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','2.0','2.0','0.0','0.0'),(247,125,1,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','8.0','8.0','0.0','0.0'),(248,126,1,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:44','2017-12-04 04:33:44','0.0','0.0','0.0','0.0'),(249,1,8,'4.5',NULL,'4.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','4.5','4.5','0.0','0.0'),(250,2,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','8.0','8.0','0.0','0.0'),(251,3,8,'6.0',NULL,'7.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 07:55:46','7.0','7.0','0.0','0.0'),(252,4,8,'5.0',NULL,'5.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','5.0','5.0','0.0','0.0'),(253,5,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','4.0','4.0','0.0','0.0'),(254,6,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','0.0','0.0','0.0','0.0'),(255,7,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','0.0','0.0','0.0','0.0'),(256,8,8,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','3.0','3.0','0.0','0.0'),(257,9,8,'3.5',NULL,'3.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','3.5','3.5','0.0','0.0'),(258,10,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','0.0','0.0','0.0','0.0'),(259,11,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','0.0','0.0','0.0','0.0'),(260,12,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','4.0','4.0','0.0','0.0'),(261,13,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','0.0','0.0','0.0','0.0'),(262,14,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','4.0','4.0','0.0','0.0'),(263,15,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:45','2017-12-04 04:33:45','2.0','2.0','0.0','0.0'),(264,16,8,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','3.0','3.0','0.0','0.0'),(265,17,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','8.0','8.0','0.0','0.0'),(266,18,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','2.0','2.0','0.0','0.0'),(267,19,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(268,20,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(269,21,8,'4.5',NULL,'4.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','4.5','4.5','0.0','0.0'),(270,22,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(271,23,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(272,24,8,'5.0',NULL,'5.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','5.0','5.0','0.0','0.0'),(273,25,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(274,26,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','1.0','1.0','0.0','0.0'),(275,27,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(276,28,8,'6.0',NULL,'6.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','6.0','6.0','0.0','0.0'),(277,29,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','2.0','2.0','0.0','0.0'),(278,30,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','1.0','1.0','0.0','0.0'),(279,31,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(280,32,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','0.0','0.0','0.0','0.0'),(281,33,8,'6.5',NULL,'6.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','6.5','6.5','0.0','0.0'),(282,34,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:46','2017-12-04 04:33:46','8.0','8.0','0.0','0.0'),(283,35,8,'5.5',NULL,'5.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','5.5','5.5','0.0','0.0'),(284,36,8,'5.0',NULL,'5.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','5.0','5.0','0.0','0.0'),(285,37,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','8.0','8.0','0.0','0.0'),(286,38,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.0','0.0','0.0','0.0'),(287,39,8,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.5','0.5','0.0','0.0'),(288,40,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.0','0.0','0.0','0.0'),(289,41,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.0','0.0','0.0','0.0'),(290,42,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.0','0.0','0.0','0.0'),(291,43,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','0.0','0.0','0.0','0.0'),(292,44,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:47','2017-12-04 04:33:47','8.0','8.0','0.0','0.0'),(293,45,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','4.0','4.0','0.0','0.0'),(294,46,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(295,47,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','1.0','1.0','0.0','0.0'),(296,48,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(297,49,8,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','7.5','7.5','0.0','0.0'),(298,50,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(299,51,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(300,52,8,'1.5',NULL,'1.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','1.5','1.5','0.0','0.0'),(301,53,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(302,54,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(303,55,8,'5.5',NULL,'5.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','5.5','5.5','0.0','0.0'),(304,56,8,'0.5',NULL,'0.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.5','0.5','0.0','0.0'),(305,57,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(306,58,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:48','2017-12-04 04:33:48','0.0','0.0','0.0','0.0'),(307,59,8,'4.5',NULL,'4.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','4.5','4.5','0.0','0.0'),(308,60,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(309,61,8,'3.0',NULL,'3.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','3.0','3.0','0.0','0.0'),(310,62,8,'7.0',NULL,'7.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','7.0','7.0','0.0','0.0'),(311,63,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(312,64,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(313,65,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(314,66,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','8.0','8.0','0.0','0.0'),(315,67,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(316,68,8,'2.5',NULL,'2.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','2.5','2.5','0.0','0.0'),(317,69,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','1.0','1.0','0.0','0.0'),(318,70,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(319,71,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(320,72,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','0.0','0.0','0.0','0.0'),(321,73,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','8.0','8.0','0.0','0.0'),(322,74,8,'7.5',NULL,'7.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','7.5','7.5','0.0','0.0'),(323,75,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:49','2017-12-04 04:33:49','8.0','8.0','0.0','0.0'),(324,76,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(325,77,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(326,78,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','1.0','1.0','0.0','0.0'),(327,79,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','2.0','2.0','0.0','0.0'),(328,80,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(329,81,8,'12',NULL,'12',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 07:15:57','0.0','0.0','0.0','0.0'),(330,83,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(331,84,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','4.0','4.0','0.0','0.0'),(332,85,8,'4.5',NULL,'4.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','4.5','4.5','0.0','0.0'),(333,86,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','1.0','1.0','0.0','0.0'),(334,87,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','8.0','8.0','0.0','0.0'),(335,88,8,'6.0',NULL,'6.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','6.0','6.0','0.0','0.0'),(336,90,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','4.0','4.0','0.0','0.0'),(337,91,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(338,92,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(339,93,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','2.0','2.0','0.0','0.0'),(340,94,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','0.0','0.0','0.0','0.0'),(341,95,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:50','2017-12-04 04:33:50','2.0','2.0','0.0','0.0'),(342,96,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(343,97,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(344,98,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','1.0','1.0','0.0','0.0'),(345,99,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','4.0','4.0','0.0','0.0'),(346,100,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(347,101,8,'4.0',NULL,'4.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','4.0','4.0','0.0','0.0'),(348,102,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(349,103,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(350,104,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(351,105,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(352,106,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(353,107,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(354,108,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(355,109,8,'1.5',NULL,'1.5',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','1.5','1.5','0.0','0.0'),(356,110,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(357,111,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(358,112,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','2.0','2.0','0.0','0.0'),(359,113,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:51','2017-12-04 04:33:51','0.0','0.0','0.0','0.0'),(360,114,8,'1.0',NULL,'1.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','1.0','1.0','0.0','0.0'),(361,115,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(362,116,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','0.0','0.0','0.0','0.0'),(363,117,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(364,118,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(365,119,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(366,120,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(367,121,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(368,122,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(369,123,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(370,124,8,'2.0',NULL,'2.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','2.0','2.0','0.0','0.0'),(371,125,8,'8.0',NULL,'8.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','8.0','8.0','0.0','0.0'),(372,126,8,'0.0',NULL,'0.0',NULL,'2017-12-01','2017-12-31',1,'2017-12-04 04:33:52','2017-12-04 04:33:52','0.0','0.0','0.0','0.0');
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
  `employee_leav_balance_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_leav_requests_on_employee_id` (`employee_id`),
  KEY `index_employee_leav_requests_on_leav_category_id` (`leav_category_id`),
  KEY `index_employee_leav_requests_on_employee_leav_balance_id` (`employee_leav_balance_id`),
  CONSTRAINT `fk_rails_c1560c30e3` FOREIGN KEY (`employee_leav_balance_id`) REFERENCES `employee_leav_balances` (`id`),
  CONSTRAINT `fk_rails_36b7682875` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_76a71d5b78` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_requests`
--

LOCK TABLES `employee_leav_requests` WRITE;
/*!40000 ALTER TABLE `employee_leav_requests` DISABLE KEYS */;
INSERT INTO `employee_leav_requests` VALUES (1,81,9,'Full Day','2017-12-04 00:00:00','2017-12-04 00:00:00',NULL,NULL,1.0,NULL,NULL,'work at home.',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 05:47:13','2017-12-04 05:54:32',NULL),(2,81,9,'Half Day','2017-12-05 00:00:00','2017-12-05 00:00:00',NULL,NULL,0.5,NULL,NULL,'sss work',1,1,0,0,0,0,1,NULL,1,NULL,NULL,'2017-12-04 05:58:26','2017-12-04 05:58:33',NULL),(3,81,9,'Full Day','2017-12-05 00:00:00','2017-12-05 00:00:00',NULL,NULL,1.0,NULL,NULL,'sss work',1,1,0,0,0,0,1,NULL,1,NULL,NULL,'2017-12-04 05:59:02','2017-12-04 05:59:07',NULL),(4,81,9,'Half Day','2017-12-07 00:00:00','2017-12-07 00:00:00',NULL,NULL,0.5,NULL,NULL,'a',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 06:11:20','2017-12-04 06:11:46',NULL),(5,81,9,'Full Day','2017-12-08 00:00:00','2017-12-08 00:00:00',NULL,NULL,1.0,NULL,NULL,'o',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 06:12:38','2017-12-04 06:13:04',NULL),(6,81,9,'Full Day','2017-12-11 00:00:00','2017-12-11 00:00:00',NULL,NULL,1.0,NULL,NULL,'yyyyy',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 06:54:29','2017-12-04 06:54:39',NULL),(7,81,9,'Full Day','2017-12-12 00:00:00','2017-12-12 00:00:00',NULL,NULL,1.0,NULL,NULL,'huh',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:00:35','2017-12-04 07:00:48',NULL),(8,81,1,'Full Day','2017-12-05 00:00:00','2017-12-05 00:00:00',NULL,NULL,1.0,NULL,NULL,'CL',1,1,0,0,0,0,1,NULL,1,NULL,NULL,'2017-12-04 07:16:32','2017-12-04 07:23:15',NULL),(9,3,9,'Full Day','2017-12-04 00:00:00','2017-12-04 00:00:00',NULL,NULL,1.0,NULL,NULL,'work from home',1,1,0,0,0,0,1,NULL,1,NULL,NULL,'2017-12-04 07:29:08','2017-12-04 07:33:57',NULL),(10,3,9,'Full Day','2017-12-05 00:00:00','2017-12-05 00:00:00',NULL,NULL,1.0,NULL,NULL,'a',1,1,0,0,0,0,1,NULL,1,NULL,NULL,'2017-12-04 07:33:44','2017-12-04 07:34:01',3),(11,3,9,'Full Day','2017-12-04 00:00:00','2017-12-04 00:00:00',NULL,NULL,1.0,NULL,NULL,'sss work',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:37:47','2017-12-04 07:38:02',3),(12,3,9,'Half Day','2017-12-05 00:00:00','2017-12-05 00:00:00',NULL,NULL,0.5,NULL,NULL,'CL',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:39:38','2017-12-04 07:39:50',3),(13,3,1,'Full Day','2017-12-06 00:00:00','2017-12-06 00:00:00',NULL,NULL,1.0,NULL,NULL,'sss work',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:40:32','2017-12-04 07:40:43',127),(14,3,8,'Full Day','2017-12-07 00:00:00','2017-12-07 00:00:00',NULL,NULL,1.0,NULL,NULL,'sss work',1,0,0,0,0,1,4,NULL,1,NULL,NULL,'2017-12-04 07:42:15','2017-12-04 07:42:27',251),(15,3,8,'Full Day','2017-12-11 00:00:00','2017-12-11 00:00:00',NULL,NULL,1.0,NULL,NULL,'00',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:43:20','2017-12-04 07:43:47',251),(16,3,8,'Full Day','2017-12-13 00:00:00','2017-12-13 00:00:00',NULL,NULL,1.0,NULL,NULL,'Slllllllllllll',1,0,0,1,0,0,3,NULL,1,NULL,NULL,'2017-12-04 07:54:35','2017-12-04 07:54:52',251);
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
  `conform` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `plan_reason_master_id` int(11) DEFAULT NULL,
  `feedback` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_employee_plans_on_employee_id` (`employee_id`),
  KEY `index_employee_plans_on_plan_reason_master_id` (`plan_reason_master_id`),
  CONSTRAINT `fk_rails_12a049e0be` FOREIGN KEY (`plan_reason_master_id`) REFERENCES `plan_reason_masters` (`id`),
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `exit_interview_status` tinyint(1) DEFAULT NULL,
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
INSERT INTO `employee_types` VALUES (1,'1001.0','Trainee',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(2,'1002.0','Permanent',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(3,'1003.0','Probation',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(4,'1004.0','Resigned',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(5,'1005.0','Confirmed',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25');
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
  `employee_signature_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_file_size` int(11) DEFAULT NULL,
  `employee_signature_updated_at` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'101','EMP0000001',NULL,'Mr','PRADNYA','Vikrant','THIPASE','1977-02-16','Male','9386727342','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456862','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 06:14:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'102','EMP0000002',NULL,'Mr','RAJU',NULL,'KONDHARE','1967-06-01','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456872','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 06:14:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2101','EMP0000003',NULL,'Mr','SHIVAJI',NULL,'UNDRE','1968-08-15','Male','7410001202','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456885','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',1,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:34','2017-12-04 07:25:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'5101','EMP0000004',NULL,'Mr','VISHNU',NULL,'BHAGWAT','1981-04-02','Male','9372705817','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456909','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'5102','EMP0000005',NULL,'Mr','GAUTAM',NULL,'DURAPHE','1974-08-12','Male','9372705819','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456831','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',21,NULL,1,1,4,NULL,NULL,'2017-12-02 05:32:34','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'5104','EMP0000006',NULL,'Mr','DILIP',NULL,'LONKAR','1980-12-29','Male','9372705811','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456821','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'5106','EMP0000007',NULL,'Mr','GIRIJAPRASAD',NULL,'SETHA','1973-12-03','Male','9372705822','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456832','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'5107','EMP0000008',NULL,'Mr','MADHUKAR',NULL,'SHEDGE','1974-07-04','Male','9372705904','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456848','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'5108','EMP0000009',NULL,'Mr','BALAJI',NULL,'UMATE','1974-06-01','Male','9372705806','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456811','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'5203','EMP0000010',NULL,'Mr','DASHARATH',NULL,'LOANKAR','1979-04-22','Male','9372705814','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456817','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',38,23,1,1,2,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'5205','EMP0000011',NULL,'Mr','BALASAHEB','SHRIHARI','PAVALE','1960-06-02','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456812','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'6202','EMP0000012',NULL,'Mr','HARIRAM','DNYANOBA','BOBADE','1983-05-05','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456834','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',25,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'6203','EMP0000013',NULL,'Mr','ASHOK',NULL,'KADAM','1963-06-01','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456805','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'6204','EMP0000014',NULL,'Mr','GANESH','MARUTI','MANDHARE','1981-01-28','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456829','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'6205','EMP0000015',NULL,'Mr','POPAT','NATHA','SONAWANE','1984-08-30','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456859','ABCDE12345B',NULL,'Married',1,NULL,1,NULL,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'6206','EMP0000016',NULL,'Mr','RAJU','ANANDRAO','SABLE','1973-05-10','Male','9372705808','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456873','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',78,NULL,1,1,6,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'7101','EMP0000017',NULL,'Mr','AJIT','NANDKUMAR','MEDHEKAR','1977-01-19','Male','9372705905','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456793','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'7103','EMP0000018',NULL,'Mr','DILIP','VITHAL','LOHAR','1962-07-25','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456820','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:35','2017-12-02 06:15:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'7104','EMP0000019',NULL,'Mr','SAROJ','ULHAS','PATIL','1966-06-24','Male','9386727341','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456883','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'7202','EMP0000020',NULL,'Mr','GORAKSHNATH','KHANDU','DHAGE','1977-03-15','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456833','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'8101','EMP0000021',NULL,'Mr','CHINTAMANI','SHIVAJIRAO','DHAMAL','1983-06-07','Male','9372705813','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456815','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',81,NULL,1,1,4,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'8102','EMP0000022',NULL,'Mr','PRAVIN','DADASO','JAGTAP','1982-05-31','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456868','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',9,78,1,1,6,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'8103','EMP0000023',NULL,'Mr','SATHISHA',NULL,'M.R','1986-06-08','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456884','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'8104','EMP0000024',NULL,'Mr','VIKAS','CHHABURAO','RANAWARE','1975-07-31','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456903','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',81,NULL,1,1,9,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'8105','EMP0000025',NULL,'Mr','JEEVAN','S',NULL,'1987-04-21','Male','9372705815','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456840','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',81,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'9101','EMP0000026',NULL,'Mr','BALAGOUDA','ANNAGOUDA','PATIL','1981-01-07','Male','9372705906','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456810','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',81,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'9102','EMP0000027',NULL,'Mr','ANKUSH','MOHAN','VEDPATHAK','1984-12-29','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456803','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'9103','EMP0000028',NULL,'Mr','VISHAL','TULSHIDAS','JAMDADE','1983-08-07','Male','9372705824','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456907','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',21,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'9104','EMP0000029',NULL,'Mr','EAKNATH','DATTU','KADAM','1970-05-20','Male','9372705820','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456825','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'9105','EMP0000030',NULL,'Mr','JAYPRAKASH','BHIMRAO','DABHADE','1983-07-23','Male','9372705831','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456839','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'9106','EMP0000031',NULL,'Mr','RAHUL',NULL,'JALKE','1989-11-08','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456870','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:36','2017-12-02 06:15:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'9107','EMP0000032',NULL,'Mr','VINAYAK','ASHOK','KAKADE','1988-02-18','Male','9372705821','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456905','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',25,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'9108','EMP0000033',NULL,'Mr','AMIT','ARUNKUMAR','MISHRA','1985-08-27','Male','9372705902','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456795','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',81,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'9109','EMP0000034',NULL,'Mr','VINAY','LAXMAN','CHAVAN','1982-01-08','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456904','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',21,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'9110','EMP0000035',NULL,'Mr','GANESH','PANDURANG','DHAMAL','1985-09-03','Male','9372705818','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456828','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',25,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'10104','EMP0000036',NULL,'Mr','AMIT',NULL,'SHARMA','1986-03-01','Male','9386727343','0','0','design@indibasolutions.com',NULL,'Q.NO.-18/X,CROSS ROAD NO.-22, SIDHGORA, PO- AGRICO,PS- SIDHGORA',1,15,1033,'JAMSHEDPUR',831009,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456796','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',21,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'10105','EMP0000037',NULL,'Mr','KIRAN','SHIVAJI','JADHAV','1984-10-10','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456845','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',21,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'10106','EMP0000038',NULL,'Mr','DATTA','DINKAR','BIRAMANE','1984-03-16','Male','9372705807','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456818','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'10107','EMP0000039',NULL,'Mr','SANJAY','DATTATRAY','AMALE','1971-01-03','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456879','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'10108','EMP0000040',NULL,'Mr','KEDAR','VISHWAMBAR','CHANDRAJENA','1983-05-02','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456843','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'10109','EMP0000041',NULL,'Mr','TATYABHAU','NIVRUTTI','GUND','1983-06-09','Male','7428224493','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456897','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'10113','EMP0000042',NULL,'Mr','HEMANT','RAMDULARE','KUMAR','1988-03-15','Male','7428224497','0','0','design@indibasolutions.com',NULL,'Village- Balkaranpur, Soraon - Allahabad',1,35,889,'Allahabad',212502,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456835','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'10210','EMP0000043',NULL,'Mr','SANTOSH','MARUTI','MANDHARE','1983-07-03','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456882','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'10211','EMP0000044',NULL,'Mr','AVINASH','KISAN','PAWAR','1984-01-09','Male','9372705836','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456807','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',1,33,1,1,1,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'10212','EMP0000045',NULL,'Mr','NITIN','HARIBHAU','SHITOLE','1984-01-13','Male','9372705908','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456856','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:37','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'10214','EMP0000046',NULL,'Mr','DHARMARAJ','PANDURANG','PAWAR','1985-03-20','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456819','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',25,NULL,1,1,11,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'11101','EMP0000047',NULL,'Mr','VISHNU','POPAT','MEHETRE','1987-10-05','Male','9372705901','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456910','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',21,NULL,1,1,4,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'11110','EMP0000048',NULL,'Mr','SURESH',NULL,'RATHORE','1988-11-15','Male','7410001205','0','0','design@indibasolutions.com',NULL,'H. No 113 Near JCB Chowk,Sanjay Colony , Ballabgarh',1,14,261,'Faridabad',121004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456895','ABCDE12345B',NULL,'Married',5,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'11113','EMP0000049',NULL,'Mr','VISHAL','VASANTLAL','NIMAVAT','1990-06-22','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456908','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'11115','EMP0000050',NULL,'Mr','AJAY','DINESH','RAVAL','1986-10-18','Male','9372705810','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456790','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',81,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'11206','EMP0000051',NULL,'Mr','BABAN','KESHAVRAO','BIRADAR','1983-03-03','Male','9372705911','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456808','ABCDE12345B',NULL,'Married',8,NULL,1,7,'NA','NA','Active',25,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'11208','EMP0000052',NULL,'Mr','VAIBHAV','JAGANNATH','BONDRE','1986-06-01','Male','9372705825','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456899','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'12103','EMP0000053',NULL,'Mr','AMOL','ASHOK','JAGTAP','1983-11-20','Male','9372705827','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456798','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'12104','EMP0000054',NULL,'Mr','JAMIR','CHANDUSMAN','SHAIKH','1982-05-27','Male','9372705823','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456836','ABCDE12345B',NULL,'Married',4,NULL,1,8,'NA','NA','Active',81,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'12105','EMP0000055',NULL,'Mr','NARENDRA','VASANT','MANGAVE','1991-06-06','Male','9372705828','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456851','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',78,NULL,1,1,6,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'12106','EMP0000056',NULL,'Mr','AMOL','NEMINATH','PATIL','1990-08-29','Male','9372705830','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456799','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',54,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'13102','EMP0000057',NULL,'Mr','GAJENDER','SATPAL SINGH','SINGH','1989-05-01','Male','7428224492','0','0','design@indibasolutions.com',NULL,'H. No 182 Villgae Sevli Tehcil Hodal, Distt. Palwal',1,14,281,'Hodal',121105,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456827','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',21,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'13105','EMP0000058',NULL,'Mr','MANOJ','TALAKHU RAM','KUMAR','1983-06-25','Male','7428224498','0','0','design@indibasolutions.com',NULL,'H.No 28 Village-Bakiya Post Office-Sanjarpur- Nizamabad',1,35,892,'Azamgarh',276206,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456849','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'13106','EMP0000059',NULL,'Mr','SUMIT','SURESH','PURI','1993-04-22','Male','7428224495','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456891','ABCDE12345B',NULL,'Married',2,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'13108','EMP0000060',NULL,'Mr','PRAFUL','MURLIDHAR','WALUNJKAR','1983-03-30','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456863','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',54,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'14110','EMP0000061',NULL,'Mr','SUDHARSHAN','MEGANATHAN',NULL,'1988-03-20','Male','0','0','0','design@indibasolutions.com',NULL,'No,308 Mettu Colony Via, Kizhpudhupakkam,Cheyyaru',1,37,1034,'Cheyyaru',604407,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456890','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'14119','EMP0000062',NULL,'Mr','PRASANDH','SANTHAKUMAR',NULL,'1992-08-30','Male','9372705826','0','0','design@indibasolutions.com',NULL,'No 4/569, Kalaivanar Nagar,Gorimedu,Pondicherry',1,37,1035,'Pondicherry',605006,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456865','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'14120','EMP0000063',NULL,'Mr','GANESH KUMAR','ULAGANATHAN',NULL,'1990-09-02','Male','9962099178','0','0','design@indibasolutions.com',NULL,'No.3496 South 2 nd St,Pudhukottai',1,37,1036,'Pudhukottai',622001,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden\n','123456830','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',61,75,1,1,5,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'14121','EMP0000064',NULL,'Mr','AJIT','VILAS','MAHABARE','1986-05-17','Male','9372705913','0','0','design@indibasolutions.com',NULL,'MAHAJAN ALI, RAVIWAR PETH, JUNNAR 410502',1,20,504,'JUNNAR',410502,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456792','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',24,NULL,1,1,9,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'14123','EMP0000065',NULL,'Mr','VINOD','VASANT','SAVARATKAR','1987-01-01','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456906','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'14124','EMP0000066',NULL,'Mr','DILLIGANESH','GURUNATHAN P',NULL,'1991-03-26','Male','9543845457','0','0','design@indibasolutions.com',NULL,'No 73 Natham Vi,Panjetty Po, Ponneri Tk',1,37,1037,'Chennai',601204,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456822','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',126,NULL,1,1,10,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'15104','EMP0000067',NULL,'Mr','VAIBHAV','APPASO','UGARE','1990-06-24','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456900','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'15105','EMP0000068',NULL,'Miss','Neha','Milan','Tank','1992-11-26','Female','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456852','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',54,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:39','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'15106','EMP0000069',NULL,'Mr','PRASHANT','GUNDAPPA','SHABADI','1979-12-08','Male','9376525459','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456866','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',81,NULL,1,1,12,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'15108','EMP0000070',NULL,'Mr','Jaykumar','BHARATH','Chougale','1992-12-03','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456838','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'15117','EMP0000071',NULL,'Mr','BISWAJIT','HEMANTKUMAR','GHOSH','1989-02-21','Male','8798083633','0','0','design@indibasolutions.com',NULL,'VILL-POST OFFICE-CHITRESHWAR,PS- BAHARAGORA, DIST-EAST SINGHBHUM',1,15,1033,'BAHARAGORA',832101,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456814','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'15122','EMP0000072',NULL,'Miss','KAVITA','RAMDAS','HURPADE','1992-08-23','Female','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456842','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',54,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'15123','EMP0000073',NULL,'Mr','Dipendra','RAMESHCHANDRA','Kant','1991-05-05','Male','7428224494','0','0','design@indibasolutions.com',NULL,'H.No 1, Baghani, Sanra Malla, Nainital',1,38,1038,'Uttrakhand',263159,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456824','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'15126','EMP0000074',NULL,'Mr','ABHIJEET',NULL,'TIWARI','1987-06-02','Male','9372705838','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456789','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'15127','EMP0000075',NULL,'Mr','SIDDHARTH','SHITALKUMAR','DOSHI','1992-05-13','Male','9372705816','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456886','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',81,NULL,1,1,13,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'15130','EMP0000076',NULL,'Mr','BAHUBALI','Ashok','GOTURE','1986-01-12','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456809','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'15131','EMP0000077',NULL,'Mr','KUSHAL','MAHENDRA KUMAR','JAIN','1987-11-10','Male','9372705829','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456847','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'15132','EMP0000078',NULL,'Mr','BHAVESH','RAMESH','SHIRODE','1990-04-15','Male','9325882324','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456813','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',81,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'15134','EMP0000079',NULL,'Mr','PRADEEP',NULL,'GUPTA','1988-12-20','Male','0','0','0','design@indibasolutions.com',NULL,'H.NO.-L4/4,ROAD NO.-14,NEAR RAM MANDIR, PO-TELCO',1,15,1033,'JAMSHEDPUR',831004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456861','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'15135','EMP0000080',NULL,'Mr','Santosh','BHARATPRASAD','Kumar','1992-02-02','Male','0','0','0','design@indibasolutions.com',NULL,'K-3/106,ROAD NO -15, TELCO, NEAR RAM MANDIR,PO- TELCO',1,15,1033,'JAMSHEDPUR',831004,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456881','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:40','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'15137','EMP0000081',NULL,'Mrs','Yojana','Ashok','Gaikwad','1990-09-25','Female','7066244785','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456914','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',1,NULL,1,1,12,NULL,NULL,'2017-12-02 05:32:40','2017-12-04 04:58:46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'15138','EMP0000082',NULL,'Mr','KETAN','CHANDRAKANT','KHOMANE','1993-12-23','Male','9372705835','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456844','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'15139','EMP0000083',NULL,'Mr','RAGHAVENDRA','BHEEMARAO','KULKARNI','1987-06-10','Male','3972705812','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456869','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'15143','EMP0000084',NULL,'Mr','SURAJ','R','KONDARE','1993-01-05','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456893','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'15144','EMP0000085',NULL,'Mr','SANDEEP',NULL,'PANSARE','1988-06-18','Male','9372705803','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456878','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',24,NULL,1,1,9,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'15145','EMP0000086',NULL,'Mr','Amit','BHAIRU','Belgaonkar','1994-01-31','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456794','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',21,NULL,1,1,4,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'15148','EMP0000087',NULL,'Mr','Elangovan',NULL,'Boopalan','1991-09-28','Male','8939645458','0','0','design@indibasolutions.com',NULL,'No 8A, Vijayalakshmi Nagar,Kallikuppam,Ambatoore',1,37,1037,'Chennai',600053,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456826','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,'15150','EMP0000088',NULL,'Mr','NILAMKUMAR','VASANTRAO','WAGHMODE','1987-05-08','Male','7410001203','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456854','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'15152','EMP0000089',NULL,'Mr','Anirudh','Vinubhai','Savaliya','1985-06-25','Male','9512750013','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456802','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',78,NULL,1,1,12,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,'15154','EMP0000090',NULL,'Mr','Nirmal kumar',NULL,'Manivannan','1993-12-12','Male','0','0','0','design@indibasolutions.com',NULL,'NO.580,MIG,1ST MAIN ROAD,MATHUR MMDA,CHENNAI',1,32,1037,'CHENNAI',600068,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456855','ABCDE12345B',NULL,'Unmarried',9,NULL,1,7,'NA','NA','Active',95,78,1,1,6,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'15155','EMP0000091',NULL,'Mr','Dipak','Mahadeo','Rajurkar','1990-05-22','Male','7410001204','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456823','ABCDE12345B',NULL,'Married',4,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'15156','EMP0000092',NULL,'Mr','Damodar','GANSING','Patel','1985-03-20','Male','7410001210','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456816','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:41','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'15157','EMP0000093',NULL,'Mr','Yogesh',NULL,'Damor','1991-07-23','Male','9371769137','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456912','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'15159','EMP0000094',NULL,'Mr','UMESH','GOPAL','MALVIYA','1991-10-02','Male','9372705801','0','0','design@indibasolutions.com',NULL,'RBII 330 A, Near Railway hospital,new katni',1,23,569,'katni',483501,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456898','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',95,78,1,1,14,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'15166','EMP0000095',NULL,'Mr','JOSAN PRAJAI PAUL P',NULL,NULL,'1988-10-04','Male','8939645450','0','0','design@indibasolutions.com',NULL,'5/26 , B7, Prakash Street, Manavizhai, Vazhukamparai, Sucindrum Post, Kanyakumari',1,37,1039,'NAGERCOIL',629704,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456841','ABCDE12345B',NULL,'Married',3,NULL,1,9,'NA','NA','Active',55,78,1,1,6,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'15167','EMP0000096',NULL,'Mr','Nikhil','Ramesh','Gowda','1992-03-24','Male','7406842424','0','0','design@indibasolutions.com',NULL,'No 4, Saibaba nilaya, Krishna Moorthy Laayout, Ganigarapalaya',1,17,1040,'Banglore',560062,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456853','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'15168','EMP0000097',NULL,'Mr','SUBOOR',NULL,'PILOT','1994-08-16','Male','7410001208','0','0','design@indibasolutions.com',NULL,'H.No 394 Tauri 13 Biswa, Ghaziabad',1,35,915,'Ghaziabad',254304,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456889','ABCDE12345B',NULL,'Unmarried',3,NULL,1,8,'NA','NA','Active',74,75,1,1,5,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'15169','EMP0000098',NULL,'Mr','Sachin','Baban','Malage','1986-06-01','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456875','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'15170','EMP0000099',NULL,'Mr','Venkatesh','V.',NULL,'1992-10-17','Male','0','0','0','design@indibasolutions.com',NULL,'21/96 3RD STREET ASSISI NAGAR MADHAVARAM',1,37,1037,'CHENNAI',600060,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456902','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',95,78,1,1,12,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,'15171','EMP0000100',NULL,'Mr','Prabhakar','Mahadev','Redekar','1993-11-05','Male','9372705833','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456860','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',26,NULL,1,1,8,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'15172','EMP0000101',NULL,'Mr','Ashvini','Vasant','Nalawade','1992-06-06','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456806','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',53,26,1,1,8,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,'15174','EMP0000102',NULL,'Mr','Anil','Rajkumar','Gosavi','1988-08-17','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456801','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',18,26,1,1,8,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,'15175','EMP0000103',NULL,'Mr','Sai Krishna',NULL,NULL,'1988-02-29','Male','0','0','0','design@indibasolutions.com',NULL,'S/o:Manikeswar rao,Door no-23-7-34,Kurpam market ,Visakhapatnam',1,2,1041,'Visakhapatnam',530001,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456877','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',95,78,1,1,11,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'15177','EMP0000104',NULL,'Mr','Amit Kumar','GOKUL','Nayak','1990-04-19','Male','9304066621','0','0','design@indibasolutions.com',NULL,'K2-6,CROSS ROAD NO.-1,NEAR RING ROAD,TELCO COLONY ,PO- TELCO,PS-TELCO',1,15,1033,'JAMSHEDPUR',831004,'A/2,3rd floor,Gandhi Tower,Ganesh Vatika,Uliyan,Anil sur Path,Kadma','123456797','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,'15178','EMP0000105',NULL,'Mr','Arif','SHARIF','Syed','1989-04-01','Male','7812045457','0','0','design@indibasolutions.com',NULL,'No,58-15/124/3 Sri Sai resedency,Shanthi Nagar,NED Kotha Road',1,2,1042,'Vizag',530009,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456804','ABCDE12345B',NULL,'Unmarried',3,NULL,1,8,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,'15181','EMP0000106',NULL,'Mr','Aniket','Babaso','Patil','1992-06-15','Male','9325609620','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456800','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',123,25,1,1,11,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(107,'15182','EMP0000107',NULL,'Mr','Silachi','ASHOK','Chourasia','1990-06-25','Male','9372705805','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456887','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,'15183','EMP0000108',NULL,'Mr','Roshan','DILIP','Jadhav','1995-02-15','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456874','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',78,NULL,1,1,6,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,'15184','EMP0000109',NULL,'Mr','Tapas','PRAKASH','Kulkarni','1989-09-05','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456896','ABCDE12345B',NULL,'Unmarried',4,NULL,1,7,'NA','NA','Active',81,NULL,1,1,12,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,'15185','EMP0000110',NULL,'Mr','Parthiban','RAJENDRAN',NULL,'1984-08-30','Male','0','0','0','design@indibasolutions.com',NULL,'s/o V.Rajendiran NO:55 pall street ,pennattagaram (post & village) vandavasi(tk) Thiruvannamalai (dt)',1,37,1034,'KANCHIPURAM',604406,'Sparkline Equipments Pvt Ltd, Plot  No. A-21,SIPCOT Industrial Park,Pillaipakkam Village,Sriperumbudur','123456858','ABCDE12345B',NULL,'Unmarried',10,NULL,1,7,'NA','NA','Active',95,78,1,1,11,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(111,'15186','EMP0000111',NULL,'Mr','Praveenkumar','SOMAN',NULL,'1991-04-08','Male','9372705832','0','0','design@indibasolutions.com',NULL,'163, west street, Menangudi',1,37,839,'Nannilam taluk',609608,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456867','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',95,78,1,1,11,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,'15187','EMP0000112',NULL,'Mr','Janantik','PIYUSHBHAI','Trivedi','1984-11-01','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456837','ABCDE12345B',NULL,'Married',7,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,'15188','EMP0000113',NULL,'Mr','Sankalp','VENKATESH','Sarnobat','1994-08-18','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456880','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:43','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,'15189','EMP0000114',NULL,'Mr','Sumog','SANGAM','Patil','1995-03-14','Male','8144645457','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456892','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',75,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(115,'15190','EMP0000115',NULL,'Mr','Yogesh','VENKATESH','Hiremath','1995-08-23','Male','9372705802','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456913','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,'15191','EMP0000116',NULL,'Mr','Rahul','JAGADISH','Raykar','1995-07-01','Male','9727651695','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456871','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',78,NULL,1,1,6,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,'15192','EMP0000117',NULL,'Mr','Omkar','SUNIL','Ravan','1995-04-05','Male','7410001201','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456857','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',50,NULL,1,1,3,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'15193','EMP0000118',NULL,'Mr','Ajaypal','CHARANJIT','Spall','1991-02-22','Male','0','0','0','design@indibasolutions.com',NULL,'H. No 144 Moh. Guru Nanak Pura, Ward no 7 Bassi Pathana, Feteharh Sahib ,Punjab',1,27,1043,'punjab',140412,'Sparkline Equipments Pvt Ltd,MD Plaza,Shop No 38 ,New Sabzi Mandi,Sector – 16','123456791','ABCDE12345B',NULL,'Unmarried',2,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,'15194','EMP0000119',NULL,'Mr','Soundhar','ANNADURAI',NULL,'2017-11-29','Male','9372705804','0','0','design@indibasolutions.com',NULL,'NO.314,Therkumedu village ,Gudalur post,polur taluk',1,37,1034,'Arni',606907,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456888','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',95,78,1,1,6,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'15195','EMP0000120',NULL,'Mr','Mohammed Mubarak','SABIR ALI',NULL,'1993-07-05','Male','0','0','0','design@indibasolutions.com',NULL,'No 271,Ganesh Nagar,Arikkambedu,Chennai',1,37,765,'Chennai',600064,'Sparkline Equipments Pvt Ltd,Old No 83, New No 112,Anna salai,Behind Hotel Zen Garden','123456850','ABCDE12345B',NULL,'Unmarried',8,NULL,1,8,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'15196','EMP0000121',NULL,'Mr','Venkatesh','RAVIKARAN',NULL,'1996-01-03','Male','9372705912','0','0','design@indibasolutions.com',NULL,'No 29, Kaiyakariamman Koil St,Ramanadhapuram',1,37,1044,'Ramanadhapuram',623501,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456901','ABCDE12345B',NULL,'Unmarried',1,NULL,1,7,'NA','NA','Active',23,NULL,1,1,2,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(122,'15197','EMP0000122',NULL,'Mr','Suraj',NULL,'Salunkhe','1996-04-16','Male','0','0','0','design@indibasolutions.com',NULL,'A/P. Bhade ,Tal: khandala,Dist: Satara',1,20,504,'Satara',415526,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456894','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',25,NULL,1,1,7,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,'15199','EMP0000123',NULL,'Mr','Pramod',NULL,'Patil','1991-05-07','Male','9372705910','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456864','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',25,NULL,1,1,11,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,'15200','EMP0000124',NULL,'Mr','Krunal',NULL,'Agarkar','1992-10-28','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456846','ABCDE12345B',NULL,'Unmarried',3,NULL,1,7,'NA','NA','Active',33,NULL,1,1,1,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,'95101','EMP0000125',NULL,'Mr','VRUSHALI','SHITALKUMAR','DOSHI','1966-12-29','Male','9372705809','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456911','ABCDE12345B',NULL,'Married',1,NULL,1,7,'NA','NA','Active',81,NULL,1,1,13,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(126,'95102','EMP0000126',NULL,'Mr','SADANAND',NULL,'BORSE','1966-10-24','Male','0','0','0','design@indibasolutions.com',NULL,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune',1,20,504,'Pune',411018,'Sparkline Equipments Pvt Ltd,Plot no.38, F-II Block,MIDC Pimpri,Pune','123456876','ABCDE12345B',NULL,'Married',3,NULL,1,7,'NA','NA','Active',81,NULL,1,1,5,NULL,NULL,'2017-12-02 05:32:44','2017-12-02 06:15:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `groups` VALUES (1,'sparkline@gmail.com','$2a$10$lYMzRuonJ2v6.Fg633chgu4LQ5VqncjesXbM0Cq5.lZ8DtWVCJKWG','Sparkline',NULL,NULL,NULL,1,'2017-11-29 11:20:59','2017-11-29 11:20:59','127.0.0.1','127.0.0.1','2017-11-29 11:20:59','2017-11-29 11:20:59',NULL,NULL,NULL,NULL);
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
  `holiday_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_off` tinyint(1) DEFAULT NULL,
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `multiple_investment` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (1,1,'2000-04-01',2,1,NULL,NULL,NULL,NULL,'100275043635.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(2,2,'2000-05-01',2,2,NULL,NULL,NULL,NULL,'100298794568.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(3,3,'1999-08-01',3,3,NULL,NULL,NULL,NULL,'100352044041.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(4,4,'2005-02-01',4,4,NULL,NULL,NULL,NULL,'100410260334.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13780.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(5,5,'2005-02-01',2,1,NULL,NULL,NULL,NULL,'100151905926.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(6,6,'2005-02-01',3,5,NULL,NULL,NULL,NULL,'100138062919.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(7,7,'2005-02-01',3,6,NULL,NULL,NULL,NULL,'100153492192.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:10','2017-12-02 05:33:10',NULL,NULL),(8,8,'2005-02-01',5,7,NULL,NULL,NULL,NULL,'100212397907.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11500.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(9,9,'1991-09-09',5,8,NULL,NULL,NULL,NULL,'100105948191.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(10,10,'2005-02-01',5,7,NULL,NULL,NULL,NULL,'100130146765.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11250.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(11,11,'2005-02-01',4,9,NULL,NULL,NULL,NULL,'100106286432.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','14000.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(12,12,'2006-08-01',4,10,NULL,NULL,NULL,NULL,'100162008872.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9555.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(13,13,'2003-07-20',4,9,NULL,NULL,NULL,NULL,'100093486734.0',NULL,'3303752825.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9426.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(14,14,'2003-05-16',5,4,NULL,NULL,NULL,NULL,'100150344899.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11520.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(15,15,'2005-07-19',5,4,NULL,NULL,NULL,NULL,'100273031910.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13750.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(16,16,'2006-09-01',4,11,NULL,NULL,NULL,NULL,'100299057395.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12526.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(17,17,'2007-05-01',3,12,NULL,NULL,NULL,NULL,'100076217036.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(18,18,'2007-09-01',5,13,NULL,NULL,NULL,NULL,'100138062122.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(19,19,'2017-05-06',6,14,NULL,NULL,NULL,NULL,'101080396765.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(20,20,'2007-07-01',4,9,NULL,NULL,NULL,NULL,'100155422533.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10363.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(21,21,'2007-06-08',6,15,NULL,NULL,NULL,NULL,'100125828690.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:11','2017-12-02 05:33:11',NULL,NULL),(22,22,'2007-03-05',5,16,NULL,NULL,NULL,NULL,'100279702313.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11069.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(23,23,'2008-07-01',6,17,NULL,NULL,NULL,NULL,'100340620119.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(24,24,'2008-07-14',6,18,NULL,NULL,NULL,NULL,'100405838604.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(25,25,'2008-07-09',6,19,NULL,NULL,NULL,NULL,'100175394118.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(26,26,'2017-04-01',6,20,NULL,NULL,NULL,NULL,'101080396754.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(27,27,'2009-01-01',5,21,NULL,NULL,NULL,NULL,'100086771489.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8812.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(28,28,'2008-03-01',5,22,NULL,NULL,NULL,NULL,'100409891977.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11531.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(29,29,'2009-04-01',3,23,NULL,NULL,NULL,NULL,'100144728329.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(30,30,'2009-05-01',5,24,NULL,NULL,NULL,NULL,'100175056216.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12500.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(31,31,'2009-07-01',5,25,NULL,NULL,NULL,NULL,'100291192647.0',NULL,'3308698121.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10753.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(32,32,'2009-07-01',5,26,NULL,NULL,NULL,NULL,'100407348886.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11051.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(33,33,'2009-07-01',6,27,NULL,NULL,NULL,NULL,'100080682960.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(34,34,'2009-09-01',5,22,NULL,NULL,NULL,NULL,'100407005387.0',NULL,'3304089661.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:12','2017-12-02 05:33:12',NULL,NULL),(35,35,'2009-10-01',5,28,NULL,NULL,NULL,NULL,'100150143784.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9700.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(36,36,'2010-09-01',5,22,NULL,NULL,NULL,NULL,'100080874632.0',NULL,'3304421623.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8745.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(37,37,'2010-09-20',5,29,NULL,NULL,NULL,NULL,'100193759723.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9207.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(38,38,'2010-10-01',5,30,NULL,NULL,NULL,NULL,'100130321496.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8970.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(39,39,'2010-11-01',4,31,NULL,NULL,NULL,NULL,'100332775300.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10158.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(40,40,'2010-11-01',4,9,NULL,NULL,NULL,NULL,'100192118389.0',NULL,'3304402457.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9484.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(41,41,'2010-11-01',5,32,NULL,NULL,NULL,NULL,'100389977199.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11200.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(42,42,'2010-11-15',5,33,NULL,NULL,NULL,NULL,'100163900665.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8963.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(43,43,'2010-11-01',4,9,NULL,NULL,NULL,NULL,'100337213536.0',NULL,'3304402456.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10473.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(44,44,'2010-11-01',4,34,NULL,NULL,NULL,NULL,'100096555307.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11040.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(45,45,'2010-11-01',5,35,NULL,NULL,NULL,NULL,'100257853384.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10818.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(46,46,'2010-11-22',4,36,NULL,NULL,NULL,NULL,'100135900975.0',NULL,'3304615352.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9484.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(47,47,'2011-01-01',5,37,NULL,NULL,NULL,NULL,'100410412103.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8800.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(48,48,'2011-07-01',3,38,NULL,NULL,NULL,NULL,'100374510968.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10459.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:13','2017-12-02 05:33:13',NULL,NULL),(49,49,'2011-07-20',3,12,NULL,NULL,NULL,NULL,'100409987825.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13932.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(50,50,'2011-07-20',6,39,NULL,NULL,NULL,NULL,'100075521462.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(51,51,'2011-06-01',4,40,NULL,NULL,NULL,NULL,'100103863458.0',NULL,'3304723515.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9240.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(52,52,'2011-06-20',4,41,NULL,NULL,NULL,NULL,'100399234558.0',NULL,'3304960603.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9100.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(53,53,'2012-06-07',5,42,NULL,NULL,NULL,NULL,'100081408941.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(54,54,'2012-06-07',6,20,NULL,NULL,NULL,NULL,'100172130237.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(55,55,'2012-08-01',5,43,NULL,NULL,NULL,NULL,'100250895929.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11218.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(56,56,'2012-08-01',5,44,NULL,NULL,NULL,NULL,'100081468148.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11218.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(57,57,'2013-01-14',5,22,NULL,NULL,NULL,NULL,'100149498574.0',NULL,'1320976605.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8807.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(58,58,'2013-10-08',3,38,NULL,NULL,NULL,NULL,'100221345944.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10459.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(59,59,'2013-09-23',5,45,NULL,NULL,NULL,NULL,'100368947747.0',NULL,'3306036969.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8850.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(60,60,'2013-11-08',5,46,NULL,NULL,NULL,NULL,'100275086062.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12688.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(61,61,'2014-04-07',3,47,NULL,NULL,NULL,NULL,'100584896930.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:14','2017-12-02 05:33:14',NULL,NULL),(62,62,'2014-09-26',2,48,NULL,NULL,NULL,NULL,'100585015007.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9513.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(63,63,'2014-11-26',5,49,NULL,NULL,NULL,NULL,'100585268679.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11880.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(64,64,'2014-12-08',5,50,NULL,NULL,NULL,NULL,'100575411880.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9555.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(65,65,'2014-12-23',5,51,NULL,NULL,NULL,NULL,'100585277910.0',NULL,'3306180945.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9086.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(66,66,'2014-12-02',5,52,NULL,NULL,NULL,NULL,'100584707076.0',NULL,'3306608040.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8845.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(67,67,'2015-02-23',5,53,NULL,NULL,NULL,NULL,'100584525002.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8775.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(68,68,'2015-01-06',5,53,NULL,NULL,NULL,NULL,'100584899112.0',NULL,'3306769568.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8921.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(69,69,'2015-06-12',2,54,NULL,NULL,NULL,NULL,'100631212147.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8989.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(70,70,'2015-06-22',5,53,NULL,NULL,NULL,NULL,'100584582254.0',NULL,'3306767846.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9350.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(71,71,'2015-07-01',5,55,NULL,NULL,NULL,NULL,'100584725731.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9460.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(72,72,'2015-10-05',5,53,NULL,NULL,NULL,NULL,'100629922638.0',NULL,'3306898714.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(73,73,'2015-11-01',2,56,NULL,NULL,NULL,NULL,'100631741377.0',NULL,'1320162564.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(74,74,'2015-11-01',3,57,NULL,NULL,NULL,NULL,'100718661458.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(75,75,'2015-11-01',6,58,NULL,NULL,NULL,NULL,'100630355492.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,1,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(76,76,'2016-01-01',5,53,NULL,NULL,NULL,NULL,'100637434869.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8750.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:15','2017-12-02 05:33:15',NULL,NULL),(77,77,'2016-01-11',3,59,NULL,NULL,NULL,NULL,'100638142153.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','14926.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(78,78,'2016-01-01',6,60,NULL,NULL,NULL,NULL,'100638599511.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(79,79,'2016-01-03',5,61,NULL,NULL,NULL,NULL,'100718328310.0',NULL,'3304979134.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9221.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(80,80,'2016-01-03',4,9,NULL,NULL,NULL,NULL,'100718162484.0',NULL,'3305708415.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8820.0',1,NULL,3,3,NULL,0,1,NULL,0,1,1,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(81,81,'2016-03-28',5,62,NULL,NULL,NULL,NULL,'100442126851.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(82,82,'2016-04-06',7,14,NULL,NULL,NULL,NULL,'100718192365.0',NULL,'3307130440.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8840.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(83,83,'2017-07-25',7,51,NULL,NULL,NULL,NULL,'101143716331.0',NULL,'3308719779.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9310.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(84,84,'2016-05-19',7,63,NULL,NULL,NULL,NULL,'100745881652.0',NULL,'3307177205.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8840.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(85,85,'2016-05-16',7,64,NULL,NULL,NULL,NULL,'100745487205.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','13698.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(86,86,'2016-07-11',4,37,NULL,NULL,NULL,NULL,'100884290383.0',NULL,'3307255026.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9200.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(87,87,'2016-07-07',7,63,NULL,NULL,NULL,NULL,'100884624498.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(88,88,'2016-07-22',7,14,NULL,NULL,NULL,NULL,'100896390435.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11200.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(89,89,'2016-08-01',7,52,NULL,NULL,NULL,NULL,'100930241407.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9250.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(90,90,'2016-08-18',4,65,NULL,NULL,NULL,NULL,'100920850524.0',NULL,'3307346967.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9100.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(91,91,'2016-08-22',7,61,NULL,NULL,NULL,NULL,'100920480825.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9062.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(92,92,'2016-08-26',7,61,NULL,NULL,NULL,NULL,'100916634262.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9065.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(93,93,'2016-08-29',7,61,NULL,NULL,NULL,NULL,'100915444007.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10800.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(94,94,'2016-09-01',7,66,NULL,NULL,NULL,NULL,'100916793545.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10014.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:16','2017-12-02 05:33:16',NULL,NULL),(95,95,'2016-09-20',8,67,NULL,NULL,NULL,NULL,'100923286125.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12030.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(96,96,'2016-11-22',7,68,NULL,NULL,NULL,NULL,'100973265969.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9500.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(97,97,'2016-12-26',5,68,NULL,NULL,NULL,NULL,'100994962575.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','10080.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(98,98,'2017-07-01',4,69,NULL,NULL,NULL,NULL,'101152597725.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9240.0',0,NULL,3,3,NULL,0,1,NULL,0,1,0,1,1,1,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(99,99,'2017-02-10',4,22,NULL,NULL,NULL,NULL,'101027785429.0',NULL,'3308117648.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9349.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(100,100,'2017-02-16',7,53,NULL,NULL,NULL,NULL,'101028623115.0',NULL,'3308122662.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9275.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(101,101,'2017-02-21',5,53,NULL,NULL,NULL,NULL,'101028623104.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9675.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(102,102,'2017-04-14',4,51,NULL,NULL,NULL,NULL,'101088539935.0',NULL,'3308391619.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9400.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(103,103,'2017-04-17',5,70,NULL,NULL,NULL,NULL,'100031984831.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','12000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(104,104,'2017-04-19',4,71,NULL,NULL,NULL,NULL,'101088539942.0',NULL,'3308396892.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9600.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(105,105,'2017-04-17',5,71,NULL,NULL,NULL,NULL,'101088539961.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','11628.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(106,106,'2017-06-02',4,72,NULL,NULL,NULL,NULL,'100883808618.0',NULL,'3307244964.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9185.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(107,107,'2017-06-12',5,49,NULL,NULL,NULL,NULL,'101124624655.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(108,108,'2017-06-15',4,65,NULL,NULL,NULL,NULL,'101124612944.0',NULL,'3308617066.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(109,109,'2017-06-19',5,73,NULL,NULL,NULL,NULL,'101124612937.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9156.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(110,110,'2005-07-19',7,72,NULL,NULL,NULL,NULL,'101124612916.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9030.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(111,111,'2017-06-09',7,72,NULL,NULL,NULL,NULL,'101124612928.0',NULL,'3308617287.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8700.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(112,112,'2017-06-27',5,49,NULL,NULL,NULL,NULL,'101143716349.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9500.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:17','2017-12-02 05:33:17',NULL,NULL),(113,113,'2017-07-10',4,74,NULL,NULL,NULL,NULL,'101142315599.0',NULL,'3308698046.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(114,114,'2017-07-10',4,74,NULL,NULL,NULL,NULL,'101142315620.0',NULL,'3308697922.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(115,115,'2017-07-10',4,75,NULL,NULL,NULL,NULL,'101142308350.0',NULL,'3308697982.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(116,116,'2017-07-10',4,76,NULL,NULL,NULL,NULL,'101142315612.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(117,117,'2017-07-10',4,77,NULL,NULL,NULL,NULL,'101142315608.0',NULL,'3308698010.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(118,118,'2017-07-12',5,78,NULL,NULL,NULL,NULL,'101142315631.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9800.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(119,119,'2017-07-17',4,35,NULL,NULL,NULL,NULL,'101142315649.0',NULL,'3308719716.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9136.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(120,120,'2017-07-17',5,61,NULL,NULL,NULL,NULL,'101146031301.0',NULL,'3308737776.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9250.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(121,121,'2017-07-20',5,61,NULL,NULL,NULL,NULL,'101146237092.0',NULL,'3308737866.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9157.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(122,122,'2017-08-01',7,79,NULL,NULL,NULL,NULL,'101152603147.0',NULL,'3306767400.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','8494.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(123,123,'2017-09-11',5,80,NULL,NULL,NULL,NULL,'100935987181.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9243.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(124,124,'2017-09-01',4,81,NULL,NULL,NULL,NULL,'101157563729.0',NULL,'3308704974.0','6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','9362.0',1,NULL,2,3,NULL,0,1,NULL,0,1,1,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(125,125,'1996-01-01',6,58,NULL,NULL,NULL,NULL,'100411422848.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,1,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL),(126,126,'1995-04-01',6,82,NULL,NULL,NULL,NULL,'100326446633.0',NULL,NULL,'6 Months','30.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'limit','15000.0',0,NULL,2,3,NULL,0,1,NULL,0,1,0,1,1,0,1,NULL,NULL,NULL,'2017-12-02 05:33:18','2017-12-02 05:33:18',NULL,NULL);
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
  `transfer` tinyint(1) DEFAULT NULL,
  `holiday_sandwich` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'CL','Casual Leave','Casual Leave',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,'2017-11-29 10:31:31','2017-12-04 07:22:31',0,0,NULL),(2,'EL','Earned Leave','Earned Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31',NULL,NULL,NULL),(3,'LWP','LWP Leave','LWP Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31',NULL,NULL,NULL),(4,'ESIC','ESIC Leave','ESIC Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31',NULL,NULL,NULL),(5,'AL','Advance Leave','Advance Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-29 10:31:32','2017-11-29 10:31:32',NULL,NULL,NULL),(6,'C.Off','Compensatory Off','Compensatory Off',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-29 10:31:32','2017-11-29 10:31:32',NULL,NULL,NULL),(7,'  Casual Leave','  Casual Leave',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 09:36:02','2017-12-02 09:36:02',NULL,NULL,NULL),(8,'SL','Sick Leave','',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,'2017-12-02 09:40:15','2017-12-04 07:22:54',0,0,NULL),(9,'PL','Paid Leave','',NULL,1,NULL,NULL,1,1,NULL,0,0,1,0,NULL,'2017-12-02 09:40:23','2017-12-04 07:23:04',0,0,NULL);
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `count` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_records_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_leave_records_on_employee_id` (`employee_id`),
  KEY `index_leave_records_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_7084af96c0` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_caa1617fdd` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_eb9a898167` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_records`
--

LOCK TABLES `leave_records` WRITE;
/*!40000 ALTER TABLE `leave_records` DISABLE KEYS */;
INSERT INTO `leave_records` VALUES (1,2,81,9,NULL,'2017-12-05','Cancelled','2017-12-04 05:58:26','2017-12-04 05:58:26',0.5),(2,3,81,9,NULL,'2017-12-05','Cancelled','2017-12-04 05:59:02','2017-12-04 05:59:02',1.0),(3,4,81,9,NULL,'2017-12-07','Cancelled','2017-12-04 06:11:20','2017-12-04 06:11:20',0.5),(4,5,81,9,NULL,'2017-12-08','Cancelled','2017-12-04 06:12:38','2017-12-04 06:12:38',1.0),(5,6,81,9,NULL,'2017-12-11','Cancelled','2017-12-04 06:54:29','2017-12-04 06:54:29',1.0),(6,7,81,9,NULL,'2017-12-12','Cancelled','2017-12-04 07:00:35','2017-12-04 07:00:35',1.0),(7,8,81,1,NULL,'2017-12-05','Cancelled','2017-12-04 07:16:32','2017-12-04 07:16:32',1.0),(8,10,3,9,NULL,'2017-12-05','Cancelled','2017-12-04 07:33:44','2017-12-04 07:33:44',1.0),(9,11,3,9,NULL,'2017-12-04','Cancelled','2017-12-04 07:37:47','2017-12-04 07:37:47',1.0),(10,12,3,9,NULL,'2017-12-05','FinalApproved','2017-12-04 07:39:38','2017-12-04 07:39:38',0.5),(11,13,3,1,NULL,'2017-12-06','Cancelled','2017-12-04 07:40:32','2017-12-04 07:40:32',1.0),(12,14,3,8,NULL,'2017-12-07','Rejected','2017-12-04 07:42:16','2017-12-04 07:42:16',1.0),(13,15,3,8,NULL,'2017-12-11','FinalApproved','2017-12-04 07:43:21','2017-12-04 07:43:21',1.0),(14,16,3,8,NULL,'2017-12-13','Cancelled','2017-12-04 07:54:36','2017-12-04 07:54:36',1.0);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status_records`
--

LOCK TABLES `leave_status_records` WRITE;
/*!40000 ALTER TABLE `leave_status_records` DISABLE KEYS */;
INSERT INTO `leave_status_records` VALUES (17,9,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:29:08','2017-12-04 07:29:08'),(18,10,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:33:44','2017-12-04 07:33:44'),(19,9,3,'Cancelled','2017-12-04 07:33:57','2017-12-04 07:33:57','2017-12-04 07:33:57'),(20,10,3,'Cancelled','2017-12-04 07:34:01','2017-12-04 07:34:01','2017-12-04 07:34:01'),(21,11,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:37:47','2017-12-04 07:37:47'),(22,11,1,'FinalApproved','2017-12-04 07:38:02','2017-12-04 07:38:02','2017-12-04 07:38:02'),(23,12,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:39:38','2017-12-04 07:39:38'),(24,12,1,'FinalApproved','2017-12-04 07:39:50','2017-12-04 07:39:50','2017-12-04 07:39:50'),(25,13,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:40:32','2017-12-04 07:40:32'),(26,13,1,'FinalApproved','2017-12-04 07:40:43','2017-12-04 07:40:43','2017-12-04 07:40:43'),(27,14,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:42:15','2017-12-04 07:42:15'),(28,14,1,'Rejected','2017-12-04 07:42:27','2017-12-04 07:42:27','2017-12-04 07:42:27'),(29,15,3,'Pending','2017-12-04 00:00:00','2017-12-04 07:43:20','2017-12-04 07:43:20'),(30,15,3,'FinalApproved','2017-12-04 07:43:47','2017-12-04 07:43:47','2017-12-04 07:43:47'),(31,16,1,'Pending','2017-12-04 00:00:00','2017-12-04 07:54:35','2017-12-04 07:54:35'),(32,16,1,'FinalApproved','2017-12-04 07:54:52','2017-12-04 07:54:52','2017-12-04 07:54:52');
/*!40000 ALTER TABLE `leave_status_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_transfers`
--

DROP TABLE IF EXISTS `leave_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `transfer_to_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `no_of_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `employee_leav_balance_id` int(11) DEFAULT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_transfers_on_employee_id` (`employee_id`),
  KEY `index_leave_transfers_on_employee_leav_balance_id` (`employee_leav_balance_id`),
  KEY `index_leave_transfers_on_leav_category_id` (`leav_category_id`),
  CONSTRAINT `fk_rails_1836b6122f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_8266fae4aa` FOREIGN KEY (`employee_leav_balance_id`) REFERENCES `employee_leav_balances` (`id`),
  CONSTRAINT `fk_rails_fb59613823` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_transfers`
--

LOCK TABLES `leave_transfers` WRITE;
/*!40000 ALTER TABLE `leave_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_transfers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (1,81,1,NULL,'2017-12-04','2017-12-04','2017-12-04 04:58:46','2017-12-04 04:58:46'),(2,3,1,NULL,'2017-12-04','2017-12-04','2017-12-04 07:25:56','2017-12-04 07:25:56');
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
  `login_count` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'101',1,NULL,NULL,'sheela@sparkline.co.in','$2a$10$T4U9l3Mt/h8gpNaZVx3XRuBcaSXyIg7boh/SYAjdihwetJvmh/rJm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2017-12-04 05:53:59','2017-12-04 05:53:59','127.0.0.1','127.0.0.1','2017-12-02 06:14:58','2017-12-04 05:53:59',1,1,NULL,1,NULL,NULL,NULL,NULL,0,0),(2,'102',1,NULL,NULL,'rajendra.k@sparkline.co.in','$2a$10$DS9gJ7mn6ci8f0gBO/4zyOt2Y7tSsJOALBRw95RZZhKMCAE76XvDC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:14:59','2017-12-02 09:41:23',1,1,NULL,2,NULL,NULL,NULL,NULL,0,0),(3,'2101',1,NULL,NULL,'shivaji@sparkline.co.in','$2a$10$Vcz3Kv51wWU47.yVu85cgurQsmIIsiPIlFLLZ8Lv036l/4fvfVpy6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2017-12-04 07:26:18','2017-12-04 07:26:18','127.0.0.1','127.0.0.1','2017-12-02 06:14:59','2017-12-04 07:26:18',1,1,NULL,3,NULL,NULL,NULL,NULL,0,0),(4,'5102',6,NULL,NULL,'gautam@sparkline.co.in','$2a$10$BpWx2A4EqN7sU7XHZLQiruMvVOsy3QSLlltAT1hTlgNIIB74IshVK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:14:59','2017-12-02 06:42:15',1,1,NULL,5,NULL,NULL,NULL,NULL,0,0),(5,'5104',6,NULL,NULL,'dilip@sparkline.co.in','$2a$10$krMiGNRi7GNTInu5PSf46e0XFeoOkOiyW2j9pndJM/JgCevepCHae',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:14:59','2017-12-02 06:42:15',1,1,NULL,6,NULL,NULL,NULL,NULL,0,0),(6,'5106',6,NULL,NULL,'girija.p@sparkline.co.in','$2a$10$FzARod2F5BYubouiw8sZD.Gm0MkY0mV629C4dL0GjwviwZ0zlcTcu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:14:59','2017-12-02 06:42:15',1,1,NULL,7,NULL,NULL,NULL,NULL,0,0),(7,'5107',6,NULL,NULL,'datta.b@sparkline.co.in','$2a$10$VOxl2hFJsEHyRYc4DcgT.eUSWEh4St5lZSHb61hS2m3MEb4S7p6ae',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:14:59','2017-12-02 06:42:16',1,1,NULL,8,NULL,NULL,NULL,NULL,0,0),(8,'5108',6,NULL,NULL,'balaji.u@sparkline.co.in','$2a$10$wY2alq8o5AW1XAlHxhD97OdKTqMgDthDRbPcg907gqSgTVA0LTk5O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:00','2017-12-02 06:42:16',1,1,NULL,9,NULL,NULL,NULL,NULL,0,0),(9,'5205',6,NULL,NULL,'narendra.m@sparkline.co.in','$2a$10$pyXi/tINI1YeorC0kknd9.U5qvHMKtTJB050oEGZt29dOZ/KWIY2K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:00','2017-12-02 06:42:16',1,1,NULL,11,NULL,NULL,NULL,NULL,0,0),(10,'6202',6,NULL,NULL,'harish.b@sparkline.co.in','$2a$10$s4RlRF9fgcMYzLylkJoHuuHkw.EgSz/ivYp4kQhVIzYnTdtGmOUci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:00','2017-12-02 06:42:16',1,1,NULL,12,NULL,NULL,NULL,NULL,0,0),(11,'7101',6,NULL,NULL,'ajit@sparkline.co.in','$2a$10$DuzC.1gfTKeTncBiLjiZJ.z9L6huJdo1JxvIDZMi/nSo7JlyLT0zy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:00','2017-12-02 06:42:16',1,1,NULL,17,NULL,NULL,NULL,NULL,0,0),(12,'7103',6,NULL,NULL,'lohar@sparkline.co.in','$2a$10$Rucy6NAS8YWLTn70z.rmLuW3z7hj40AAdzDX5gcZ31g7U42QSnpya',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:16',1,1,NULL,18,NULL,NULL,NULL,NULL,0,0),(13,'7104',6,NULL,NULL,'saroj@sparkline.co.in','$2a$10$XfLYYThwZNSWoRc5at1D4OMNG.j6nsRZ1nT4BAvOMhO8GyA4ArR92',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:16',1,1,NULL,19,NULL,NULL,NULL,NULL,0,0),(14,'8101',4,NULL,NULL,'chintamani@sparkline.co.in','$2a$10$dq9nCb0RJBbjr7lMreO0tOxMtFjqq4jsdYSh7QLxhU.PI7lJ6IKhS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:16',1,1,NULL,21,NULL,NULL,NULL,NULL,0,0),(15,'8102',6,NULL,NULL,'pravin@sparkline.co.in','$2a$10$j2lyq9IKIwxI/4O7HqTKEOcfT06cvzNpmwcm3FxkImlZUg6AhE62i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:17',1,1,NULL,22,NULL,NULL,NULL,NULL,0,0),(16,'8103',4,NULL,NULL,'sathisha@sparkline.co.in','$2a$10$xy2XHfMFwp.0qzDzMzQSNunhutNWgPagnHeDFUKu7J.JC3mAI0Dq.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:17',1,1,NULL,23,NULL,NULL,NULL,NULL,0,0),(17,'8104',4,NULL,NULL,'vikas@sparkline.co.in','$2a$10$iYhuG7jS3VegCq28fNMPieJy5gKDPxOUWnFfxRgh8ttYAatQcpwVm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:01','2017-12-02 06:42:17',1,1,NULL,24,NULL,NULL,NULL,NULL,0,0),(18,'8105',4,NULL,NULL,'jeevan@sparkline.co.in','$2a$10$5q1cLAqPuDEB18Mr6spW5.e8X4VZQL20HHNA1mBvXEnu2A/7/fpcm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:17',1,1,NULL,25,NULL,NULL,NULL,NULL,0,0),(19,'9101',4,NULL,NULL,'b.patil@sparkline.co.in','$2a$10$qeQvW3trmMC76vwaCk7SGeTYgoZ3NjKxWMH1hZPAWGAEZo67JHuX2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:17',1,1,NULL,26,NULL,NULL,NULL,NULL,0,0),(20,'9102',6,NULL,NULL,'ankush.v@sparkline.co.in','$2a$10$FJ.iurZZfoUNt5MBAYe35OQEGawXIHzhRxoaUmAZ53t6HzyzrdUoq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:17',1,1,NULL,27,NULL,NULL,NULL,NULL,0,0),(21,'9103',6,NULL,NULL,'vishal@sparkline.co.in','$2a$10$aG4UFVTSAbbpuNA9OssAOuycD4YGy7aZos6B4xT5UEALcMfcBgc1e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:17',1,1,NULL,28,NULL,NULL,NULL,NULL,0,0),(22,'9104',6,NULL,NULL,'kadam@sparkline.co.in','$2a$10$iPzSvw0PSD/FUoIoR9D2HuT8pB/IW12WYhyUK48fdg2vGPDq663sG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:18',1,1,NULL,29,NULL,NULL,NULL,NULL,0,0),(23,'9105',6,NULL,NULL,'jayprakash@sparkline.co.in','$2a$10$ZBYPBNYzhJ1hC3eacDw8G.xwhKw7ptp0eNmwYgN7wmm6MLM5ol6Q2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:18',1,1,NULL,30,NULL,NULL,NULL,NULL,0,0),(24,'9106',6,NULL,NULL,'rahul.j@sparkerp.co.in','$2a$10$CMtR7XrZIXTthCJEQoj2dOLKFb43dOggiBSmYlwXD87MGxywlxJoy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:02','2017-12-02 06:42:18',1,1,NULL,31,NULL,NULL,NULL,NULL,0,0),(25,'9107',6,NULL,NULL,'vinayak.k@sparkline.co.in','$2a$10$rtktvRDpn9H0SchzCCBgPu3v/Z4haaCcVY39mMG2lnEOLOtxVOgEO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:18',1,1,NULL,32,NULL,NULL,NULL,NULL,0,0),(26,'9108',4,NULL,NULL,'amit.mishra@sparkline.co.in','$2a$10$2yP.eIGd2QQx.hNaOuSAdOCTW5qbDoNDY1q068WcNuX8/z2HWI1Qe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:18',1,1,NULL,33,NULL,NULL,NULL,NULL,0,0),(27,'9109',6,NULL,NULL,'vinay.c@sparkline.co.in','$2a$10$q/NlxO.vDPSpJeaYxULOTuJlWqxcAesX9iJ5SvTy/RjC38TK5GxsC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:18',1,1,NULL,34,NULL,NULL,NULL,NULL,0,0),(28,'9110',6,NULL,NULL,'ganesh.d@sparkline.co.in','$2a$10$mP2DE4QYF5pfTt94y9TD7u1OUv6pNS8KLMw6kVyxBTT5VHTSuNvAO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:18',1,1,NULL,35,NULL,NULL,NULL,NULL,0,0),(29,'10104',6,NULL,NULL,'account.jsr@sparkline.co.in','$2a$10$oaLoYxgVvVLhfi1FtLuF/.dAmzegiQrXriwunzbyFpJj9Y1jcWs/y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:18',1,1,NULL,36,NULL,NULL,NULL,NULL,0,0),(30,'10105',6,NULL,NULL,'kiran.j@sparkline.co.in','$2a$10$i5EfraOCmsbnOWCBSyuf.ueuHRTdcTStKHtFRbRLbc1MyFG9p0SNO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:03','2017-12-02 06:42:19',1,1,NULL,37,NULL,NULL,NULL,NULL,0,0),(31,'10109',6,NULL,NULL,'gund.t@sparkline.co.in','$2a$10$9NLxbjbaoPUvsC74M3KBhO9ptt.gRYAQkA2bYKlfKUKtUhMdpZxw.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:04','2017-12-02 06:42:19',1,1,NULL,41,NULL,NULL,NULL,NULL,0,0),(32,'10113',6,NULL,NULL,'hemant.k@sparkline.co.in','$2a$10$pdECVH9d4mwFLhOX1oYlfulFDDrnpwlcD9Uep1mLfmrp8F/Qcdxam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:04','2017-12-02 06:42:19',1,1,NULL,42,NULL,NULL,NULL,NULL,0,0),(33,'10212',6,NULL,NULL,'nitin.s@sparkline.co.in','$2a$10$ZKt0syCrlqPiZcovP.MACuzTR/WY2ywXTg3sHKnzaM3Qr7Mcjek0G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:04','2017-12-02 06:42:19',1,1,NULL,45,NULL,NULL,NULL,NULL,0,0),(34,'11101',6,NULL,NULL,'vishnu.s@sparkline.co.in','$2a$10$pLayXQLL5xFo3MoRdgSwIOIRFoo/ZON7esiQSE9QBY10.kH7YMz5.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:19',1,1,NULL,47,NULL,NULL,NULL,NULL,0,0),(35,'11110',6,NULL,NULL,'suresh.r@sparkline.co.in','$2a$10$EVZwoZA9eq3CyhV9sGwzReVp8jvLLTsiTvbhMGm7zrYQtoF/fV4/.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:19',1,1,NULL,48,NULL,NULL,NULL,NULL,0,0),(36,'11113',6,NULL,NULL,'vishal.n@sparkline.co.in','$2a$10$DtO2VdMDCAvnDotYGG3pRuBNIDYObAsLWO92hpMHkDZCPB6BnPdcq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:19',1,1,NULL,49,NULL,NULL,NULL,NULL,0,0),(37,'11115',4,NULL,NULL,'ajay.r@sparkline.co.in','$2a$10$7weFvNe9u7RDv4OgEwaQNOFPhuGA2MplnSf3VnbgB4wwVVsyP/DU2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:19',1,1,NULL,50,NULL,NULL,NULL,NULL,0,0),(38,'11208',6,NULL,NULL,'vaibhav.b@sparkline.co.in','$2a$10$nwiEQ.BnChvjTh6lC3jNL.Q/DLmI.pbHuE.tucH4SGliomiCsrwxK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:20',1,1,NULL,52,NULL,NULL,NULL,NULL,0,0),(39,'12103',6,NULL,NULL,'amol.j@sparkline.co.in','$2a$10$GCTSZ77J9pYyBrfORfdcJ.6j5ATNVy.JJHF8tFFDOo1sqLzhLDHye',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:05','2017-12-02 06:42:20',1,1,NULL,53,NULL,NULL,NULL,NULL,0,0),(40,'12104',4,NULL,NULL,'jamir.s@sparkline.co.in','$2a$10$.poFyvp/mlkv6cbH5w5u3OkmZjQ8OEiVMYPQpsRZal1mCU8eQ8.BS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:20',1,1,NULL,54,NULL,NULL,NULL,NULL,0,0),(41,'12106',6,NULL,NULL,'amol.p@sparkline.co.in','$2a$10$nPmrO4zR9ePf2XPkLUdP.OGx/pptYsehaUBt2TcnMbJ/mmoXIcInO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:20',1,1,NULL,56,NULL,NULL,NULL,NULL,0,0),(42,'13102',6,NULL,NULL,'account.delhi@sparkline.co.in','$2a$10$f5Kc/EN4KECBsLY0IRM2oOlpjYiHqVK0A9j0sZZUIY6HolyCOlw6S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:20',1,1,NULL,57,NULL,NULL,NULL,NULL,0,0),(43,'13105',6,NULL,NULL,'manoj.kumar@sparkline.co.in','$2a$10$BcMXkac3vMktrUbV0gxR0OggFCB5R/cRr/Houot87SHFTjbMntHEW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:20',1,1,NULL,58,NULL,NULL,NULL,NULL,0,0),(44,'13106',6,NULL,NULL,'sumit.p@sparkline.co.in','$2a$10$xr/hhEtFlxc11n/exZqba.Qhxrqt0sTmQZKSOCY4ZRkEA6KABUVrG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:20',1,1,NULL,59,NULL,NULL,NULL,NULL,0,0),(45,'13108',6,NULL,NULL,'praful.w@sparkline.co.in','$2a$10$/AtcUPLlM7XCUzP3gDM4XOnKOa4BKq/OBpanVnZKH1EcERIH8XFeu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:21',1,1,NULL,60,NULL,NULL,NULL,NULL,0,0),(46,'14110',6,NULL,NULL,'sudharshan.m@sparkline.co.in','$2a$10$ljVp9fLyxXDzAKrz7lc4WO2PasD3rOJ2BrtBhZ7oF23PZ7uhOBeFW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:06','2017-12-02 06:42:21',1,1,NULL,61,NULL,NULL,NULL,NULL,0,0),(47,'14119',6,NULL,NULL,'prasandh.s@sparkline.co.in','$2a$10$3MT3fzVLUuDxqiq3EyHLuuub0eHejSuat11z9EvtHSsXROcg71aFq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,62,NULL,NULL,NULL,NULL,0,0),(48,'14120',6,NULL,NULL,'ganesh.k@sparkline.co.in','$2a$10$Ei5fzCtyKlWXnj5EpuOfpOYEXVO0EsqWLgulvC0/WyrcrGN3068Pm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,63,NULL,NULL,NULL,NULL,0,0),(49,'14121',6,NULL,NULL,'ajit.m@sparkline.co.in','$2a$10$RDvfTqFy12Au9g/Xw6aRAOKDwboXvIqVbEl5mADTWQXr1pMllpIry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,64,NULL,NULL,NULL,NULL,0,0),(50,'14123',6,NULL,NULL,'vinod.s@sparkline.co.in','$2a$10$4Y9xIhPXkeD5xDUUfM1po.HH3aHvS07MZsf4HWqkV1f9McrRevb8K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,65,NULL,NULL,NULL,NULL,0,0),(51,'14124',6,NULL,NULL,'ganesh.g@sparkline.co.in','$2a$10$eueuRgNmNQppnXBZHHGdIOI1liIfs6peauMbqXYvy6gq2VyUJyuDS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,66,NULL,NULL,NULL,NULL,0,0),(52,'15104',6,NULL,NULL,'vaibhav.u@sparkline.co.in','$2a$10$R.4oX7SbjbGvPFhsOVCNPeW/BqIBQc3Z0gLQ2.J8i8o4bH61W40R2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:21',1,1,NULL,67,NULL,NULL,NULL,NULL,0,0),(53,'15105',6,NULL,NULL,'neha.t@sparkline.co.in','$2a$10$rp9Fob.5Z/JlMzjPJVADpu/2Wybl11rx1Amo8k5Er361KfqH5xe.m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:07','2017-12-02 06:42:22',1,1,NULL,68,NULL,NULL,NULL,NULL,0,0),(54,'15106',6,NULL,NULL,'prashant.shabadi@sparkline.co.in','$2a$10$7.YUQw2rr9Y0uR.WmY0OoOwgk5hArsArTm4I7Lx6l7Hcx3ziyRtme',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,69,NULL,NULL,NULL,NULL,0,0),(55,'15108',6,NULL,NULL,'jaykumar.c@sparkline.co.in','$2a$10$EEXQUTpducPDi4cg/v2NjOWE7qLbSvNv88.kNj1fwz1gW6HjGPnAq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,70,NULL,NULL,NULL,NULL,0,0),(56,'15117',6,NULL,NULL,'biswajit.g@sparkline.co.in','$2a$10$WClWc4jRFPSGvs9jR/fUVOYrTtCTtSQ2x9hisG/WtOwy0YrqhTZH2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,71,NULL,NULL,NULL,NULL,0,0),(57,'15122',6,NULL,NULL,'kavita.h@sparkline.co.in','$2a$10$izTLXpmZG6qYWHEqqUP2ZedGCWsW3zXRAvGwY7zANvS5rascx5YuK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,72,NULL,NULL,NULL,NULL,0,0),(58,'15123',6,NULL,NULL,'dipendra.k@sparkline.co.in','$2a$10$pCy1nzxWMVOgcomWR6N32.kdSZct8jJtbW6u6cgxvzHZDAugz.9GS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,73,NULL,NULL,NULL,NULL,0,0),(59,'15126',6,NULL,NULL,'abhijeet@sparkline.co.in','$2a$10$hyhYiVAG8eBgYVT1tWhRhOcZedxT9U.e7RwmXM39ysQpXRtBUuBjK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,74,NULL,NULL,NULL,NULL,0,0),(60,'15127',4,NULL,NULL,'siddharth@sparkline.co.in','$2a$10$8jbS/vegq8wRq.Kn77Gmi.6C1qcEA/Hqy4pbSG1QIv/c2ZWKQTywa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:08','2017-12-02 06:42:22',1,1,NULL,75,NULL,NULL,NULL,NULL,0,0),(61,'15130',6,NULL,NULL,'bahubali.g@sparkline.co.in','$2a$10$OTop/Lo7F2lQyNmZd3Ie9.OVcvcKsvcrT5U5RUg2s5imP9m.Akmz.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:09','2017-12-02 06:42:23',1,1,NULL,76,NULL,NULL,NULL,NULL,0,0),(62,'15131',6,NULL,NULL,'kushal.j@sparkline.co.in','$2a$10$mYVo/qUMMuTD9n/ECAlUr.RgrLhL30UL5ayDG0wAPIm0TJbj2DvLK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:09','2017-12-02 06:42:23',1,1,NULL,77,NULL,NULL,NULL,NULL,0,0),(63,'15132',4,NULL,NULL,'bhavesh@sparkline.co.in','$2a$10$bw4YAZrICoKtiXym/4rnT.ksMG3enuk00ZecQ8BmmwIQ9VqRhYFcq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:09','2017-12-02 06:42:23',1,1,NULL,78,NULL,NULL,NULL,NULL,0,0),(64,'15137',1,NULL,NULL,'yojana.g@sparkline.co.in','$2a$10$otKJZ6CtJ1pcthWfCsrNt.ofMlt/RT2p58.1eAa/LjRIEVk7D.XF.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2017-12-04 05:45:17','2017-12-04 04:28:56','127.0.0.1','127.0.0.1','2017-12-02 06:15:09','2017-12-04 05:45:17',1,1,NULL,81,NULL,NULL,NULL,NULL,0,0),(65,'15138',6,NULL,NULL,'ketan.k@sparkline.co.in','$2a$10$1c/FNno1v4RH6K1vl02vYOw22LL69KcPqYTUr.MieCwh1UvouT9PS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:09','2017-12-02 06:42:23',1,1,NULL,82,NULL,NULL,NULL,NULL,0,0),(66,'15139',6,NULL,NULL,'raghavendra.k@sparkline.co.in','$2a$10$J4FcOm0pUQn4nHwWsWzRuOnbOsMZsj5waSfv8kKu8CvJ25GRncZjq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:23',1,1,NULL,83,NULL,NULL,NULL,NULL,0,0),(67,'15143',6,NULL,NULL,'suraj.k@sparkline.co.in','$2a$10$1zrNPZikOZ3J2O51Hz3cPuKsc9ecCb3uzmPWxowd45Ny4f2Ul2zFO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:23',1,1,NULL,84,NULL,NULL,NULL,NULL,0,0),(68,'15144',6,NULL,NULL,'sandeep@sparkline.co.in','$2a$10$xEe38g73wjrdJWuoFmdwuu7sf1fr3V8waoWbaRRDeIVayWNsbQHwC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,85,NULL,NULL,NULL,NULL,0,0),(69,'15145',6,NULL,NULL,'amit.b@sparkline.co.in','$2a$10$OIJtRgZoM9h8r51z0Lw.qu3kr1UukisQPviiPTjf7WHxIJjA.YMai',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,86,NULL,NULL,NULL,NULL,0,0),(70,'15148',6,NULL,NULL,'elangovan.b@sparkline.co.in','$2a$10$bCm2VaaI5dzQcEnYJv.vleExpKRZKswV.7MvSSgaYXHuoz8hWYqWO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,87,NULL,NULL,NULL,NULL,0,0),(71,'15150',6,NULL,NULL,'nilamkumar.w@sparkline.co.in','$2a$10$b0Y/LoRpbskezwc49xnPqOGh8OC36qdCvrdNEWqS.H4hq27nuoGlW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,88,NULL,NULL,NULL,NULL,0,0),(72,'15152',6,NULL,NULL,'anirudh.s@sparkline.co.in','$2a$10$29LyGsHJbY/znBKcdoEkeuxv8iMxHjPSYm1LP1Wto37BTSt99cMDO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,89,NULL,NULL,NULL,NULL,0,0),(73,'15154',6,NULL,NULL,'nirmal.m@sparkline.co.in','$2a$10$UEpC74IUODV.r.CL/.kBaeYEjNMCnIrJuOTClJNqXM2c6yuO9ISDO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:10','2017-12-02 06:42:24',1,1,NULL,90,NULL,NULL,NULL,NULL,0,0),(74,'15155',6,NULL,NULL,'dipak.r@sparkline.co.in','$2a$10$r9UzVj5LX98hKLPd28HqCuv8XFgp8uvx7Bbpk8KbIWi5DkircAHi6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:24',1,1,NULL,91,NULL,NULL,NULL,NULL,0,0),(75,'15156',6,NULL,NULL,'damodar.p@sparkline.co.in','$2a$10$WnBhQptt17V1vD7YdHQP3ewhhajxfK4dGS5EHPSNJhk4KH4c1vbOy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:25',1,1,NULL,92,NULL,NULL,NULL,NULL,0,0),(76,'15159',6,NULL,NULL,'pipavav@sparkline.co.in','$2a$10$5yyq947FdHcahiT5SFbx9ubE33UJhNU./rLm3HpJPRsXdQlW3bJyS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:25',1,1,NULL,94,NULL,NULL,NULL,NULL,0,0),(77,'15166',6,NULL,NULL,'josan.p@sparkline.co.in','$2a$10$n3pvlkGxvdEkQRgpEMzK4Omd1VDBIW0ugFyWiiPIcAzv9.BUXlWeW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:25',1,1,NULL,95,NULL,NULL,NULL,NULL,0,0),(78,'15167',6,NULL,NULL,'nikhil.g@sparkline.co.in','$2a$10$orqdeIrbqOUYxJsXq6OANebjV8ReyjhA2GLF2IStpXwVGGIf1DcwW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:25',1,1,NULL,96,NULL,NULL,NULL,NULL,0,0),(79,'15168',6,NULL,NULL,'suboor.p@sparkline.co.in','$2a$10$3WENKwaN6a7fIVhS.r8SoOU0jdSej.CODcL2i6gVk/h0Esjmtk96i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:11','2017-12-02 06:42:25',1,1,NULL,97,NULL,NULL,NULL,NULL,0,0),(80,'15170',6,NULL,NULL,'venkatesh.v@sparkline.co.in','$2a$10$0.r4OT5EYlX60NSMMSbqq.Ii2lPKozkzjqo/v2CWsgrbSZ4elWWR2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,99,NULL,NULL,NULL,NULL,0,0),(81,'15171',6,NULL,NULL,'prabhakar.r@sparkline.co.in','$2a$10$v.brXJN.bXbhVFzkzbJct.nkEEApFjW/UBjjAhIz/YzfPv0MfiTcm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,100,NULL,NULL,NULL,NULL,0,0),(82,'15172',6,NULL,NULL,'ashvini.n@sparkline.co.in','$2a$10$PcjJ24IVxvIQLXMlAa8yqO0lc/zlkOTL.MsbnxoiqxM7SGCyLuq/e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,101,NULL,NULL,NULL,NULL,0,0),(83,'15174',6,NULL,NULL,'anil.g@sparkline.co.in','$2a$10$n1ElP.piixpx5W7uOkuB3ehdFuvynsC9LyPQq2X3DQluNeK.X.h9q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,102,NULL,NULL,NULL,NULL,0,0),(84,'15175',6,NULL,NULL,'sai.krishna@sparkline.co.in','$2a$10$JmLgf9KpHP2.6NA0hlHwguYpsTVGeEt6kVzmxQGmBwipe7g5fbZ..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,103,NULL,NULL,NULL,NULL,0,0),(85,'15177',6,NULL,NULL,'amit.nayak@sparkline.co.in','$2a$10$y9d0df3.y88cThYeitOJpe2AaKYGjIBTLEhHlbofvoXQayfdX1cEm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:12','2017-12-02 06:42:26',1,1,NULL,104,NULL,NULL,NULL,NULL,0,0),(86,'15178',6,NULL,NULL,'arif.s@sparkline.co.in','$2a$10$kWnEzF0v.AN4dRRIf0t98eCauSkUttacwwOKQciRS.QshBJfS69fC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:26',1,1,NULL,105,NULL,NULL,NULL,NULL,0,0),(87,'15181',6,NULL,NULL,'aniket.patil@sparkline.co.in','$2a$10$cWPxMSpO3J72/d/hQ5XAde5tx571cAjSUbFhEzuN.vKqCTNJjrqYu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,106,NULL,NULL,NULL,NULL,0,0),(88,'15182',6,NULL,NULL,'silachi.c@sparkline.co.in','$2a$10$USTVZ4cU50rZlv1Mf06Wk.XP09WS3jrXacnd8TAHrylvNpPHscZxO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,107,NULL,NULL,NULL,NULL,0,0),(89,'15184',6,NULL,NULL,'tapas.k@sparkline.co.in','$2a$10$Ejw6Zwdqh5CPHN6PefEEWO42A2Vv6hxeV0u5fW0NbT5QOtMjQpKq6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,109,NULL,NULL,NULL,NULL,0,0),(90,'15185',6,NULL,NULL,'parthiban.r@sparkline.co.in','$2a$10$urPKEgGhpD15V0TFCOgWIetPylbaPQiP5km0IJuFqkViB4gJVsNNu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,110,NULL,NULL,NULL,NULL,0,0),(91,'15186',6,NULL,NULL,'pravinkumar.s@sparkline.co.in','$2a$10$0blEczZ27T0cWv1X0ZkCe.ZH3QtpQDNIwdCbPwTmRTwrXCyraQFpq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,111,NULL,NULL,NULL,NULL,0,0),(92,'15187',6,NULL,NULL,'janantik.t@sparkline.co.in','$2a$10$XJBP2pzWKoK68fgeBYPP2uQkWZC7Hrp1Tf35txLG1kN9Qn9g7mBDW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:13','2017-12-02 06:42:27',1,1,NULL,112,NULL,NULL,NULL,NULL,0,0),(93,'15188',6,NULL,NULL,'sankalp.s@sparkline.co.in','$2a$10$roI/ExdYeS91zwK.Qj9CvebYh4pJqYKuPp.HYIXr/J.yXoPJZmvAy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:14','2017-12-02 06:42:27',1,1,NULL,113,NULL,NULL,NULL,NULL,0,0),(94,'15189',6,NULL,NULL,'sumog.p@sparkline.co.in','$2a$10$tavPfO1j9J.iUtUiV9xfkezin/UdBAhdV6AsOESIyr6ZZM0tGWCL.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:14','2017-12-02 06:42:28',1,1,NULL,114,NULL,NULL,NULL,NULL,0,0),(95,'15192',6,NULL,NULL,'omkar.r@sparkline.co.in','$2a$10$gOKVSR7huicsKMVJ0cd7fODH5kcG6Hi1U/HoN5rJr66/aYpH/wiIy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:14','2017-12-02 06:42:28',1,1,NULL,117,NULL,NULL,NULL,NULL,0,0),(96,'15193',6,NULL,NULL,'ajay.spall@sparkline.co.in','$2a$10$4pBN/al6Mdh1CZzulyQcVea6BEP7t8gwBP4JeH7B2Yv8mAgR3C40q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:14','2017-12-02 06:42:28',1,1,NULL,118,NULL,NULL,NULL,NULL,0,0),(97,'15197',6,NULL,NULL,'suraj.salunkhe@sparkline.co.in','$2a$10$jNbNhO/FOuo/4I3df8Qb0uus7azpDbXH16XK3oDHwE31N92q6/c3.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:15','2017-12-02 06:42:28',1,1,NULL,122,NULL,NULL,NULL,NULL,0,0),(98,'15199',6,NULL,NULL,'pramod.p@sparkline.co.in','$2a$10$DLBnszyd4D1eiGhXwYkVhezXWXONY8x4z2zrRev/hHlpimutQPVje',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:15','2017-12-02 06:42:28',1,1,NULL,123,NULL,NULL,NULL,NULL,0,0),(99,'15200',6,NULL,NULL,'krunal.a@sparkline.co.in','$2a$10$lR6GpnNsy5DjIkWEASCSguUDF.zOoJCsBxDdCf3f6OERTrBxsGvv6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:15','2017-12-02 06:42:28',1,1,NULL,124,NULL,NULL,NULL,NULL,0,0),(100,'95101',6,NULL,NULL,'vrushali@sparkline.co.in','$2a$10$xmrmmHk2PtVtXGYAajrBz.VkoWmrxOE99KJm3MNmmfU.2gJtKs5R6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:15','2017-12-02 06:42:28',1,1,NULL,125,NULL,NULL,NULL,NULL,0,0),(101,'95102',4,NULL,NULL,'sadanand@sparkline.co.in','$2a$10$ko/LdDFMbF4uEqWOQ1d4hOIVpxFf4UD4P5nDSF68SSLU1FGSht7ee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-12-02 06:15:15','2017-12-02 06:42:28',1,1,NULL,126,NULL,NULL,NULL,NULL,0,0);
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
INSERT INTO `nationalities` VALUES (1,'1001.0','Indian',NULL,NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_leave_records`
--

LOCK TABLES `particular_leave_records` WRITE;
/*!40000 ALTER TABLE `particular_leave_records` DISABLE KEYS */;
INSERT INTO `particular_leave_records` VALUES (1,81,4,9,'2017-12-07 00:00:00',0,1,'2017-12-04 06:11:46','2017-12-04 06:52:45'),(2,81,5,9,'2017-12-08 00:00:00',1,1,'2017-12-04 06:13:04','2017-12-04 06:53:25'),(3,81,6,9,'2017-12-11 00:00:00',1,1,'2017-12-04 06:54:39','2017-12-04 06:55:09'),(4,81,7,9,'2017-12-12 00:00:00',1,1,'2017-12-04 07:00:48','2017-12-04 07:02:35'),(5,3,11,9,'2017-12-04 00:00:00',1,1,'2017-12-04 07:38:02','2017-12-04 07:38:25'),(6,3,12,9,'2017-12-05 00:00:00',0,NULL,'2017-12-04 07:39:50','2017-12-04 07:39:50'),(7,3,13,1,'2017-12-06 00:00:00',1,1,'2017-12-04 07:40:43','2017-12-04 07:41:03'),(8,3,15,8,'2017-12-11 00:00:00',1,NULL,'2017-12-04 07:43:47','2017-12-04 07:43:47'),(9,3,16,8,'2017-12-13 00:00:00',1,1,'2017-12-04 07:54:52','2017-12-04 07:55:46');
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
INSERT INTO `payment_modes` VALUES (1,'1001','Cheque',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(2,'1002','Cash',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(3,'1003','Bank',NULL,NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(4,'1004','DD','Demand Draft',NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25'),(5,'1005','NEFT','National Electronic Funds Transfer',NULL,'2017-11-29 10:31:25','2017-11-29 10:31:25');
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
INSERT INTO `payroll_periods` VALUES (1,'2017-01-01','2018-01-31',1,'2017-12-04 05:46:40','2017-12-04 05:46:40');
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
-- Table structure for table `plan_reason_masters`
--

DROP TABLE IF EXISTS `plan_reason_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_reason_masters` (
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
-- Dumping data for table `plan_reason_masters`
--

LOCK TABLES `plan_reason_masters` WRITE;
/*!40000 ALTER TABLE `plan_reason_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_reason_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_details`
--

DROP TABLE IF EXISTS `policy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `investment_declaration_id` int(11) DEFAULT NULL,
  `insurer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `premium_amount` decimal(10,0) DEFAULT NULL,
  `estimated_annual_amount` decimal(10,0) DEFAULT NULL,
  `actual_annual_amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_policy_details_on_investment_declaration_id` (`investment_declaration_id`),
  CONSTRAINT `fk_rails_70dbc33919` FOREIGN KEY (`investment_declaration_id`) REFERENCES `investment_declarations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_details`
--

LOCK TABLES `policy_details` WRITE;
/*!40000 ALTER TABLE `policy_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_details` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_masters`
--

LOCK TABLES `relation_masters` WRITE;
/*!40000 ALTER TABLE `relation_masters` DISABLE KEYS */;
INSERT INTO `relation_masters` VALUES (1,'1001.0','Father',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(2,'1002.0','Mother',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(3,'1003.0','Daughter',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(4,'1004.0','Son',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(5,'1005.0','Brother',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(6,'1006.0','Wife',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(7,'1007.0','Husband',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(8,'1008.0','Sister',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'Hinduism','1001.0',NULL,NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(2,'Jainism','1002.0',NULL,NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(3,'Islam','1003.0',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(4,'Christianity','1004.0',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(5,'Sikhism','1005.0',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(6,'Buddhism','1006.0',NULL,NULL,'2017-11-29 10:31:27','2017-11-29 10:31:27'),(7,'HINDU',NULL,NULL,NULL,'2017-12-02 05:32:33','2017-12-02 05:32:33'),(8,'Muslim',NULL,NULL,NULL,'2017-12-02 05:32:38','2017-12-02 05:32:38'),(9,'CHRISTIAN',NULL,NULL,NULL,'2017-12-02 05:32:42','2017-12-02 05:32:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,1,1,'2017-12-04 04:57:26','2017-12-04 04:57:26'),(2,NULL,NULL,NULL,2,1,'2017-12-04 04:57:31','2017-12-04 04:57:31'),(3,NULL,NULL,NULL,81,1,'2017-12-04 04:57:48','2017-12-04 04:57:48');
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
INSERT INTO `reserved_categories` VALUES (1,'1001','GENERAL','GENERAL',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(2,'1002','OBC','OTHER BACKWARD CLASSES',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(3,'1003','SC','SCHEDULED CASTE',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(4,'1004','ST','SCHEDULED TRIBE',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(5,'1005','NT','Nomadic Tribes',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1001.0','GroupAdmin','All Access of the system',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(2,'1002.0','Admin','Company Level All Access',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(3,'1003.0','Branch','Branch level all access',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(4,'1004.0','HOD','Employee Self Service and Manager Self Service Access',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(5,'1005.0','Supervisor','Employee Self Service and Manager Self Service Access',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(6,'1006.0','Employee','Employee Self Service  ',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(7,'1007.0','GroupRecruiter','All Recruitement acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(8,'1008.0','AdminRecruiter','Company Level Recruitement acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(9,'1009.0','Recruiter','Branch Level Recruitement acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(10,'1010.0','GroupTimeManagement','All Time Management acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(11,'1011.0','AdminTimeManagement','All Time Management acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26'),(12,'1012.0','TimeManagement','All Time Management acess, Employee Self Service and Manager Self Service',NULL,'2017-11-29 10:31:26','2017-11-29 10:31:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'101','Basic','Basic',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(2,'102','HRA','HRA',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(3,'103','DA','Dearness Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(4,'104','Special Allowance','Special Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(5,'105','Convenience Allowance','Convenience Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(6,'106','Other Allowance','Other Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(7,'107','Washing Allowance','Washing Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(8,'108','Driver Allowance','Driver Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(9,'109','Medical Allowance','Medical Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(10,'110','Children Education Allowance','Children Education Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(11,'111','Provident Fund','Provident Fund',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(12,'112','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:32','2017-11-29 10:31:32'),(13,'113','Income Tax','Income Tax',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(14,'114','Food Deduction','Food Deduction',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(15,'115','Other Deduction','Other Deduction',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(16,'116','Professional Tax','Professional Tax',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(17,'117','Society','Society',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(18,'118','Retaintion','Retaintion',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(19,'119','Welfair','Welfair',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(20,'120','Mobile Deduction','Mobile Deduction',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(21,'121','Medical Reimbursment','Medical Reimbursment',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(22,'122','Leave Travel Allowance ','Leave Travel Allowance ',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(23,'123','Transport Allowance ','Transport Allowance ',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33'),(24,'124','Program Allowance','Program Allowance',NULL,0,NULL,NULL,0,0,'2017-11-29 10:31:33','2017-11-29 10:31:33');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `other_component_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106052750'),('20160106132935'),('20160107054936'),('20160113064755'),('20160113093434'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092244'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170508142940'),('20170508144515'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170616052732'),('20170617045509'),('20170617062016'),('20170617103654'),('20170617122323'),('20170619090333'),('20170619093726'),('20170620124404'),('20170621071225'),('20170623073735'),('20170628085423'),('20170803091421'),('20170804114606'),('20170804125658'),('20170808095750'),('20170814100958'),('20170822073828'),('20170918092704'),('20170922092726'),('20170924042052'),('20170926072224'),('20171003051607'),('20171003052752'),('20171003053247'),('20171003053534'),('20171003062911'),('20171003105555'),('20171005070443'),('20171005071250'),('20171005071558'),('20171005071807'),('20171005170040'),('20171015094950'),('20171023064715'),('20171024130150'),('20171103091229'),('20171103105847'),('20171107095442'),('20171109104835'),('20171113060311'),('20171117112456'),('20171117113251'),('20171120051504'),('20171120051757'),('20171202070044'),('20171202070252'),('20171202073314'),('20171202074026'),('20171202074231'),('20171202074828'),('20171202081651'),('20171202081857'),('20171202082219'),('20171202082729'),('20171202082943'),('20171204054949'),('20171204073223');
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
  `current_ctc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `states` VALUES (1,1,'AN','Andaman and Nicobar Islands','2017-11-29 10:31:33','2017-11-29 10:31:33'),(2,1,'AP','Andhra Pradesh','2017-11-29 10:31:33','2017-11-29 10:31:33'),(3,1,'AR','Arunachal Pradesh','2017-11-29 10:31:33','2017-11-29 10:31:33'),(4,1,'AS','Assam','2017-11-29 10:31:33','2017-11-29 10:31:33'),(5,1,'BR','Bihar','2017-11-29 10:31:33','2017-11-29 10:31:33'),(6,1,'CH','Chandigarh','2017-11-29 10:31:33','2017-11-29 10:31:33'),(7,1,'CT','Chhattisgarh','2017-11-29 10:31:33','2017-11-29 10:31:33'),(8,1,'DD','Daman and Diu','2017-11-29 10:31:33','2017-11-29 10:31:33'),(9,1,'DL','Delhi','2017-11-29 10:31:34','2017-11-29 10:31:34'),(10,1,'DN','Dadra and Nagar Haveli','2017-11-29 10:31:34','2017-11-29 10:31:34'),(11,1,'GA','Goa','2017-11-29 10:31:34','2017-11-29 10:31:34'),(12,1,'GJ','Gujarat','2017-11-29 10:31:34','2017-11-29 10:31:34'),(13,1,'HP','Himachal Pradesh','2017-11-29 10:31:34','2017-11-29 10:31:34'),(14,1,'HR','Haryana','2017-11-29 10:31:34','2017-11-29 10:31:34'),(15,1,'JH','Jharkhand','2017-11-29 10:31:34','2017-11-29 10:31:34'),(16,1,'JK','Kashmir','2017-11-29 10:31:34','2017-11-29 10:31:34'),(17,1,'KA','Karnataka','2017-11-29 10:31:34','2017-11-29 10:31:34'),(18,1,'KL','Kerala','2017-11-29 10:31:34','2017-11-29 10:31:34'),(19,1,'LD','Laccadives','2017-11-29 10:31:34','2017-11-29 10:31:34'),(20,1,'MH','Maharashtra','2017-11-29 10:31:34','2017-11-29 10:31:34'),(21,1,'ML','Meghalaya','2017-11-29 10:31:34','2017-11-29 10:31:34'),(22,1,'MN','Manipur','2017-11-29 10:31:34','2017-11-29 10:31:34'),(23,1,'MP','Madhya Pradesh','2017-11-29 10:31:34','2017-11-29 10:31:34'),(24,1,'MZ','Mizoram','2017-11-29 10:31:34','2017-11-29 10:31:34'),(25,1,'NL','Nagaland','2017-11-29 10:31:34','2017-11-29 10:31:34'),(26,1,'OR','Odisha','2017-11-29 10:31:34','2017-11-29 10:31:34'),(27,1,'PB','Punjab','2017-11-29 10:31:34','2017-11-29 10:31:34'),(28,1,'PY','Puducherry','2017-11-29 10:31:34','2017-11-29 10:31:34'),(29,1,'RJ','Rajasthan','2017-11-29 10:31:34','2017-11-29 10:31:34'),(30,1,'SK','Sikkim','2017-11-29 10:31:34','2017-11-29 10:31:34'),(31,1,'TG','Telangana','2017-11-29 10:31:34','2017-11-29 10:31:34'),(32,1,'TN','Tamil Nadu','2017-11-29 10:31:34','2017-11-29 10:31:34'),(33,1,'TR','Tripura','2017-11-29 10:31:34','2017-11-29 10:31:34'),(34,1,'UL','Uttarakhand','2017-11-29 10:31:34','2017-11-29 10:31:34'),(35,1,'UP','Uttar Pradesh','2017-11-29 10:31:34','2017-11-29 10:31:34'),(36,1,'WB','West Bengal','2017-11-29 10:31:34','2017-11-29 10:31:34'),(37,1,NULL,'Tamilnadu','2017-12-02 05:32:39','2017-12-02 05:32:39'),(38,1,NULL,'Uttrakhand','2017-12-02 05:32:40','2017-12-02 05:32:40');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
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
INSERT INTO `travel_expence_types` VALUES (1,'1001','Travel Expence',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(2,'1002','Food Expence',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(3,'1003','Lodgging Expence',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(4,'1004','Other Expence',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31');
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
INSERT INTO `travel_modes` VALUES (1,'1001','By Bus',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(2,'1002','By Train',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(3,'1003','By Plan',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(4,'1004','By Ship',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31');
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
INSERT INTO `travel_options` VALUES (1,'1001','Domestic',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(2,'1002','National',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31'),(3,'1003','International',NULL,NULL,'2017-11-29 10:31:31','2017-11-29 10:31:31');
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
  `experince_max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budget_max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `notice_period` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_company_id` int(11) DEFAULT NULL,
  `replacement_id` int(11) DEFAULT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  `relocation_rerimbursement` tinyint(1) DEFAULT NULL,
  `notice_period_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  KEY `index_vacancy_masters_on_target_company_id` (`target_company_id`),
  CONSTRAINT `fk_rails_35ed6efe66` FOREIGN KEY (`target_company_id`) REFERENCES `target_companies` (`id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_c007c5e793` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_d3ad0c0ad4` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`)
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
  `month_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day_in_month` int(11) DEFAULT NULL,
  `present_day` decimal(10,0) DEFAULT NULL,
  `total_leave` decimal(10,0) DEFAULT NULL,
  `holiday_in_month` decimal(10,0) DEFAULT NULL,
  `week_off_day` decimal(10,0) DEFAULT NULL,
  `absent_day` decimal(10,0) DEFAULT NULL,
  `payable_day` decimal(10,0) DEFAULT NULL,
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
INSERT INTO `years` VALUES (1,1960,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(2,1961,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(3,1962,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(4,1963,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(5,1964,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(6,1965,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(7,1966,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(8,1967,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(9,1968,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(10,1969,NULL,'2017-11-29 10:32:13','2017-11-29 10:32:13'),(11,1970,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(12,1971,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(13,1972,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(14,1973,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(15,1974,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(16,1975,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(17,1976,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(18,1977,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(19,1978,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(20,1979,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(21,1980,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(22,1981,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(23,1982,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(24,1983,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(25,1984,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(26,1985,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(27,1986,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(28,1987,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(29,1988,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(30,1989,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(31,1990,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(32,1991,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(33,1992,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(34,1993,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(35,1994,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(36,1995,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(37,1996,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(38,1997,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(39,1998,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(40,1999,NULL,'2017-11-29 10:32:14','2017-11-29 10:32:14'),(41,2000,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(42,2001,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(43,2002,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(44,2003,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(45,2004,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(46,2005,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(47,2006,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(48,2007,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(49,2008,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(50,2009,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(51,2010,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(52,2011,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(53,2012,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(54,2013,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(55,2014,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(56,2015,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(57,2016,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(58,2017,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(59,2018,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(60,2019,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(61,2020,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(62,2021,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(63,2022,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(64,2023,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(65,2024,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15'),(66,2025,NULL,'2017-11-29 10:32:15','2017-11-29 10:32:15');
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

-- Dump completed on 2017-12-04 18:15:43
