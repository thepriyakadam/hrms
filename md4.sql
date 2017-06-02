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
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'AB+',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'B+',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'O+',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'A-',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'B-',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'O-',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'AB-',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `companies` VALUES (1,NULL,'1','COM001','ACB Ltd.','ABC',1,'7896541230','','','','Pune',1,20,504,'Pune',145879,'','9632587410','www.mdindia.com','2000-01-01','2017-05-26 21:16:16','2017-05-26 21:16:16',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'1','COMLOC001','Pune','','','Pune',1,20,504,987456,'','2017-05-26 21:17:00','2017-05-26 21:17:00'),(2,1,'2','COMLOC002','Mumbai','','','123654',1,20,486,963258,'','2017-05-26 21:17:55','2017-05-26 21:17:55'),(3,1,'3','COMLOC003','Surat','','','Surat',1,12,1033,987456,'','2017-05-26 21:19:45','2017-05-26 21:19:45'),(4,1,'4','COMLOC004','Hyderabad','','','Hyderabad',1,31,737,852147,'','2017-05-26 21:20:51','2017-05-26 21:20:51');
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
INSERT INTO `company_types` VALUES (1,'1.0','Private Limited ',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Limited Liability Partnership',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Public Limited',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
INSERT INTO `countries` VALUES (1,'IN','India','2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-05-26 21:16:16','2017-05-26 21:16:16'),(2,'company_location',4,'2017-05-26 21:17:00','2017-05-26 21:20:51'),(3,'employee',9496,'2017-05-26 23:20:04','2017-05-26 23:31:36');
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
INSERT INTO `degree_streams` VALUES (1,'1.0','Aerospace',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','Archaeology',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','Asian language and culture',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','Automotive ',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'5.0','Chemical',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'6.0','Civil',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'7.0','Commerce',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'8.0','Computer Application',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(9,'9.0','Computer Architecture',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,'10.0','Computer Sicence',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(11,'11.0','Creative Writing',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(12,'12.0','Electrical',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(13,'13.0','Electrical & Electronics',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(14,'14.0','Human Resource',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(15,'15.0',' Informaton Technology  ',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(16,'16.0','Marine',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(17,'17.0','Mathematics',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(18,'18.0','Mechanical',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(19,'19.0','Philosophy',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(20,'20.0','Psychology',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(21,'21.0','Robotics',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(22,'22.0','Saftey',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(23,'23.0','Science',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(24,'24.0','Textile',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(25,'25.0','Theater:Design & Production',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `degree_types` VALUES (1,'1.0','Primary School',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0',' Middle School ',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0',' High School ',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','Senior Secondary',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'5.0','Diploma',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'6.0','Under Graduate',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'7.0','Graduate',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'8.0','Under Post Graduate',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(9,'9.0','Post Graduation ',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,'10.0','Professional',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `degrees` VALUES (1,'1.0','BCA ','Bachelor of Computer Application',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','BBA','Bachelor of Business Administration',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','B.Com ','Bachelor of Commerce   ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0',' B.Sc ','Bachelor of Science ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'5.0','BA','Bachelor  of Arts  ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'6.0','BE','Bachelor of Engineering   ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'7.0','B.Tech','Bachelor of Technology',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'8.0','DCA','Diploma in Computer Application',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(9,'9.0','ITI','Industial Training Institute',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,'10.0','BSW','Bachelor  of Sociel Work',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(11,'11.0','Polytechnic','Polytechnic',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(12,'12.0','LL.B','Bachelor of Laws',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(13,'13.0','BCM','Bachelor of computer management',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(14,'14.0','BFA','Bachelor  of Fine Arts ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(15,'15.0','BMS','Bachelor  of Management Study',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(16,'16.0','BCS','Bachelor  of Computer Science',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(17,'17.0','BBM','Bachelor  of Business Management',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(18,'18.0','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(19,'19.0','BHM','Bachelor  of Hotel Managemnet',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(20,'20.0','B.Pharma','Bachachelor of Pharmacy',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(21,'21.0','BS','Bachachelor of Science ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(22,'22.0','CS','Compnay Secrectary',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(23,'23.0','CA','Chartered Accountant',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(24,'24.0','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(25,'25.0','MCA','Master of Computer Application',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(26,'26.0','MBA','Master of Business Administration',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(27,'27.0','M.Com','Master of Commerce',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(28,'28.0','M.Sc','Master of Science',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(29,'29.0','MA','Master of Arts',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(30,'30.0','ME','Master of Engineering',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(31,'31.0','M.Tech','Master of Technology ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(32,'32.0','PGDCA','Post Grduate Diploma in computer Application',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(33,'33.0','MSW','Master of SocielWork ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(34,'34.0','LL.M ','Master of Laws',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(35,'35.0','MCM','Master of computer management',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(36,'36.0','MFA','Master of Fine Arts ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(37,'37.0','MMS','Master of Management Studies',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(38,'38.0','MCS','Matser of Computer Science',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(39,'39.0','MBM','Master in Business Management',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(40,'40.0','MJMC','Master of Journalism and Mass Communication',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(41,'41.0','MHM','Master in Hotel Management ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(42,'42.0','M.Pharma',' Master of Pharmacy',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(43,'43.0','MS',' Master of Science',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(44,'44.0','MD','Medicinae Doctor ',NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `department_types` VALUES (1,'1.0','Executive','Executive',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Operation','Operation',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Support','Support',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'1.0','DEP1',NULL,'Production',1,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(2,1,'2.0','DEP2',NULL,'358 Section',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(3,1,'3.0','DEP3',NULL,'Finishing',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(4,1,'4.0','DEP4',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(5,1,'5.0','DEP5',NULL,'Safety',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(6,1,'6.0','DEP6',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(7,1,'7.0','DEP7',NULL,'Marketing',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(8,1,'8.0','DEP8',NULL,'Electrical',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(9,1,'9.0','DEP9',NULL,'Seamless',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(10,1,'10.0','DEP10',NULL,'TMD',2,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(11,1,'11.0','DEP11',NULL,'CRD',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(12,1,'12.0','DEP12',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(13,1,'13.0','DEP13',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 23:19:43','2017-05-26 23:19:43'),(14,1,'14.0','DEP14',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(15,1,'15.0','DEP15',NULL,'Purchase',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(16,1,'16.0','DEP16',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(17,1,'17.0','DEP17',NULL,'Utility',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(18,1,'18.0','DEP18',NULL,'Stores',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(19,1,'19.0','DEP19',NULL,'Security',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(20,1,'20.0','DEP20',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(21,1,'21.0','DEP21',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(22,1,'22.0','DEP22',NULL,'Workshop',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(23,1,'23.0','DEP23',NULL,'IT',3,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(24,1,'24.0','DEP24',NULL,'Project',3,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(25,1,'25.0','DEP25',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(26,1,'26.0','DEP26',NULL,'Planning',1,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(27,1,'27.0','DEP27',NULL,'Research',3,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(28,1,'28.0','DEP28',NULL,'Administration',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(29,1,'29.0','DEP29',NULL,'Accounts',2,NULL,NULL,'2017-05-26 23:19:44','2017-05-26 23:19:44'),(30,1,'30.0','DEP30',NULL,'Store',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(31,1,'31.0','DEP31',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(32,1,'32.0','DEP32',NULL,'Analytics',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(33,1,'33.0','DEP33',NULL,'PLS',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(34,1,'34.0','DEP34',NULL,'Finance',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(35,1,'35.0','DEP35',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(36,1,'36.0','DEP36',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(37,1,'37.0','DEP37',NULL,'Business Development',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(38,1,'38.0','DEP38',NULL,'Admin',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(39,1,'39.0','DEP39',NULL,'COE',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(40,1,'40.0','DEP40',NULL,'Management',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(41,1,'41.0','DEP41',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(42,1,'42.0','DEP42',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(43,1,'43.0','DEP43',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(44,1,'44.0','DEP44',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(45,1,'45.0','DEP45',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(46,1,'46.0','DEP46',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(47,1,'47.0','DEP47',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(48,1,'48.0','DEP48',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(49,1,'49.0','DEP49',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(50,1,'50.0','DEP50',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(51,1,'51.0','DEP51',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(52,1,'52.0','DEP52',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(53,1,'53.0','DEP53',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(54,1,'54.0','DEP54',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 23:19:45','2017-05-26 23:19:45'),(55,1,'55.0','DEP55',NULL,'Sales',1,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(56,2,'56.0','DEP56',NULL,'Production',1,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(57,2,'57.0','DEP57',NULL,'358 Section',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(58,2,'58.0','DEP58',NULL,'Finishing',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(59,2,'59.0','DEP59',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(60,2,'60.0','DEP60',NULL,'Safety',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(61,2,'61.0','DEP61',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(62,2,'62.0','DEP62',NULL,'Marketing',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(63,2,'63.0','DEP63',NULL,'Electrical',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(64,2,'64.0','DEP64',NULL,'Seamless',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(65,2,'65.0','DEP65',NULL,'TMD',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(66,2,'66.0','DEP66',NULL,'CRD',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(67,2,'67.0','DEP67',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(68,2,'68.0','DEP68',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(69,2,'69.0','DEP69',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(70,2,'70.0','DEP70',NULL,'Purchase',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(71,2,'71.0','DEP71',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(72,2,'72.0','DEP72',NULL,'Utility',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(73,2,'73.0','DEP73',NULL,'Stores',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(74,2,'74.0','DEP74',NULL,'Security',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(75,2,'75.0','DEP75',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(76,2,'76.0','DEP76',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(77,2,'77.0','DEP77',NULL,'Workshop',2,NULL,NULL,'2017-05-26 23:19:46','2017-05-26 23:19:46'),(78,2,'78.0','DEP78',NULL,'IT',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(79,2,'79.0','DEP79',NULL,'Project',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(80,2,'80.0','DEP80',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(81,2,'81.0','DEP81',NULL,'Planning',1,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(82,2,'82.0','DEP82',NULL,'Research',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(83,2,'83.0','DEP83',NULL,'Administration',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(84,2,'84.0','DEP84',NULL,'Accounts',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(85,2,'85.0','DEP85',NULL,'Store',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(86,2,'86.0','DEP86',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(87,2,'87.0','DEP87',NULL,'Analytics',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(88,2,'88.0','DEP88',NULL,'PLS',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(89,2,'89.0','DEP89',NULL,'Finance',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(90,2,'90.0','DEP90',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(91,2,'91.0','DEP91',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(92,2,'92.0','DEP92',NULL,'Business Development',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(93,2,'93.0','DEP93',NULL,'Admin',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(94,2,'94.0','DEP94',NULL,'COE',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(95,2,'95.0','DEP95',NULL,'Management',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(96,2,'96.0','DEP96',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(97,2,'97.0','DEP97',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(98,2,'98.0','DEP98',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(99,2,'99.0','DEP99',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(100,2,'100.0','DEP100',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(101,2,'101.0','DEP101',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(102,2,'102.0','DEP102',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(103,2,'103.0','DEP103',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 23:19:47','2017-05-26 23:19:47'),(104,2,'104.0','DEP104',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(105,2,'105.0','DEP105',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(106,2,'106.0','DEP106',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(107,2,'107.0','DEP107',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(108,2,'108.0','DEP108',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(109,2,'109.0','DEP109',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(110,2,'110.0','DEP110',NULL,'Sales',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(111,3,'111.0','DEP111',NULL,'Production',1,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(112,3,'112.0','DEP112',NULL,'358 Section',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(113,3,'113.0','DEP113',NULL,'Finishing',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(114,3,'114.0','DEP114',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(115,3,'115.0','DEP115',NULL,'Safety',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(116,3,'116.0','DEP116',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(117,3,'117.0','DEP117',NULL,'Marketing',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(118,3,'118.0','DEP118',NULL,'Electrical',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(119,3,'119.0','DEP119',NULL,'Seamless',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(120,3,'120.0','DEP120',NULL,'TMD',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(121,3,'121.0','DEP121',NULL,'CRD',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(122,3,'122.0','DEP122',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(123,3,'123.0','DEP123',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(124,3,'124.0','DEP124',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(125,3,'125.0','DEP125',NULL,'Purchase',2,NULL,NULL,'2017-05-26 23:19:48','2017-05-26 23:19:48'),(126,3,'126.0','DEP126',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(127,3,'127.0','DEP127',NULL,'Utility',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(128,3,'128.0','DEP128',NULL,'Stores',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(129,3,'129.0','DEP129',NULL,'Security',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(130,3,'130.0','DEP130',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(131,3,'131.0','DEP131',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(132,3,'132.0','DEP132',NULL,'Workshop',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(133,3,'133.0','DEP133',NULL,'IT',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(134,3,'134.0','DEP134',NULL,'Project',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(135,3,'135.0','DEP135',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(136,3,'136.0','DEP136',NULL,'Planning',1,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(137,3,'137.0','DEP137',NULL,'Research',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(138,3,'138.0','DEP138',NULL,'Administration',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(139,3,'139.0','DEP139',NULL,'Accounts',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(140,3,'140.0','DEP140',NULL,'Store',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(141,3,'141.0','DEP141',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(142,3,'142.0','DEP142',NULL,'Analytics',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(143,3,'143.0','DEP143',NULL,'PLS',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(144,3,'144.0','DEP144',NULL,'Finance',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(145,3,'145.0','DEP145',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(146,3,'146.0','DEP146',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(147,3,'147.0','DEP147',NULL,'Business Development',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(148,3,'148.0','DEP148',NULL,'Admin',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(149,3,'149.0','DEP149',NULL,'COE',3,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(150,3,'150.0','DEP150',NULL,'Management',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(151,3,'151.0','DEP151',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 23:19:49','2017-05-26 23:19:49'),(152,3,'152.0','DEP152',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(153,3,'153.0','DEP153',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(154,3,'154.0','DEP154',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(155,3,'155.0','DEP155',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(156,3,'156.0','DEP156',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(157,3,'157.0','DEP157',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(158,3,'158.0','DEP158',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(159,3,'159.0','DEP159',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(160,3,'160.0','DEP160',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(161,3,'161.0','DEP161',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(162,3,'162.0','DEP162',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(163,3,'163.0','DEP163',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(164,3,'164.0','DEP164',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50'),(165,3,'165.0','DEP165',NULL,'Sales',1,NULL,NULL,'2017-05-26 23:19:50','2017-05-26 23:19:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=1034 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-05-26 20:53:42','2017-05-26 20:53:42'),(2,1,NULL,'Port Blair','2017-05-26 20:53:42','2017-05-26 20:53:42'),(3,1,NULL,'Sawi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(4,2,NULL,'Akividu','2017-05-26 20:53:42','2017-05-26 20:53:42'),(5,2,NULL,'Amalapuram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(6,2,NULL,'Anantapur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(7,2,NULL,'Andra','2017-05-26 20:53:42','2017-05-26 20:53:42'),(8,2,NULL,'Avanigadda','2017-05-26 20:53:42','2017-05-26 20:53:42'),(9,2,NULL,'Bapatla','2017-05-26 20:53:42','2017-05-26 20:53:42'),(10,2,NULL,'Bhimavaram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(11,2,NULL,'Bobbili','2017-05-26 20:53:42','2017-05-26 20:53:42'),(12,2,NULL,'Chirala','2017-05-26 20:53:42','2017-05-26 20:53:42'),(13,2,NULL,'Chittoor','2017-05-26 20:53:42','2017-05-26 20:53:42'),(14,2,NULL,'Cumbum','2017-05-26 20:53:42','2017-05-26 20:53:42'),(15,2,NULL,'Darsi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(16,2,NULL,'Dhone','2017-05-26 20:53:42','2017-05-26 20:53:42'),(17,2,NULL,'Eluru','2017-05-26 20:53:42','2017-05-26 20:53:42'),(18,2,NULL,'Gampalagudem','2017-05-26 20:53:42','2017-05-26 20:53:42'),(19,2,NULL,'Gannavaram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(20,2,NULL,'Gorantla','2017-05-26 20:53:42','2017-05-26 20:53:42'),(21,2,NULL,'Gudivada','2017-05-26 20:53:42','2017-05-26 20:53:42'),(22,2,NULL,'Guntur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(23,2,NULL,'Kadapa','2017-05-26 20:53:42','2017-05-26 20:53:42'),(24,2,NULL,'Kakinada','2017-05-26 20:53:42','2017-05-26 20:53:42'),(25,2,NULL,'Kanigiri','2017-05-26 20:53:42','2017-05-26 20:53:42'),(26,2,NULL,'Kavali','2017-05-26 20:53:42','2017-05-26 20:53:42'),(27,2,NULL,'Kovvur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(28,2,NULL,'Kuppam','2017-05-26 20:53:42','2017-05-26 20:53:42'),(29,2,NULL,'Kurnool','2017-05-26 20:53:42','2017-05-26 20:53:42'),(30,2,NULL,'Machilipatnam','2017-05-26 20:53:42','2017-05-26 20:53:42'),(31,2,NULL,'Madanapalle','2017-05-26 20:53:42','2017-05-26 20:53:42'),(32,2,NULL,'Mahal','2017-05-26 20:53:42','2017-05-26 20:53:42'),(33,2,NULL,'Mandapeta','2017-05-26 20:53:42','2017-05-26 20:53:42'),(34,2,NULL,'Mangalagiri','2017-05-26 20:53:42','2017-05-26 20:53:42'),(35,2,NULL,'Markapur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(36,2,NULL,'Medarametla','2017-05-26 20:53:42','2017-05-26 20:53:42'),(37,2,NULL,'Muddanuru','2017-05-26 20:53:42','2017-05-26 20:53:42'),(38,2,NULL,'Nagari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(39,2,NULL,'Nandigama','2017-05-26 20:53:42','2017-05-26 20:53:42'),(40,2,NULL,'Nandyal','2017-05-26 20:53:42','2017-05-26 20:53:42'),(41,2,NULL,'Narasaraopet','2017-05-26 20:53:42','2017-05-26 20:53:42'),(42,2,NULL,'Nellore','2017-05-26 20:53:42','2017-05-26 20:53:42'),(43,2,NULL,'Nuzvid','2017-05-26 20:53:42','2017-05-26 20:53:42'),(44,2,NULL,'Ongole','2017-05-26 20:53:42','2017-05-26 20:53:42'),(45,2,NULL,'Pakala','2017-05-26 20:53:42','2017-05-26 20:53:42'),(46,2,NULL,'Peddapuram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(47,2,NULL,'Piduguralla','2017-05-26 20:53:42','2017-05-26 20:53:42'),(48,2,NULL,'Pileru','2017-05-26 20:53:42','2017-05-26 20:53:42'),(49,2,NULL,'Pithapuram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(50,2,NULL,'Proddatur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(51,2,NULL,'Puttur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(52,2,NULL,'Rajahmundry','2017-05-26 20:53:42','2017-05-26 20:53:42'),(53,2,NULL,'Ramapuram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(54,2,NULL,'Ramavaram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(55,2,NULL,'Singarayakonda','2017-05-26 20:53:42','2017-05-26 20:53:42'),(56,2,NULL,'Srikakulam','2017-05-26 20:53:42','2017-05-26 20:53:42'),(57,2,NULL,'Tadepallegudem','2017-05-26 20:53:42','2017-05-26 20:53:42'),(58,2,NULL,'Tanuku','2017-05-26 20:53:42','2017-05-26 20:53:42'),(59,2,NULL,'Thenali','2017-05-26 20:53:42','2017-05-26 20:53:42'),(60,2,NULL,'Tirumala','2017-05-26 20:53:42','2017-05-26 20:53:42'),(61,2,NULL,'Tirumala - Tirupati','2017-05-26 20:53:42','2017-05-26 20:53:42'),(62,2,NULL,'Vijayawada','2017-05-26 20:53:42','2017-05-26 20:53:42'),(63,2,NULL,'Vinukonda','2017-05-26 20:53:42','2017-05-26 20:53:42'),(64,2,NULL,'Visakhapatnam','2017-05-26 20:53:42','2017-05-26 20:53:42'),(65,2,NULL,'Vizianagaram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(66,2,NULL,'Yanam','2017-05-26 20:53:42','2017-05-26 20:53:42'),(67,3,NULL,'Hong','2017-05-26 20:53:42','2017-05-26 20:53:42'),(68,3,NULL,'Itanagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(69,4,NULL,'Arunachal','2017-05-26 20:53:42','2017-05-26 20:53:42'),(70,4,NULL,'Barpeta','2017-05-26 20:53:42','2017-05-26 20:53:42'),(71,4,NULL,'Bhandari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(72,4,NULL,'Dhubri','2017-05-26 20:53:42','2017-05-26 20:53:42'),(73,4,NULL,'Dibrugarh','2017-05-26 20:53:42','2017-05-26 20:53:42'),(74,4,NULL,'Golaghat','2017-05-26 20:53:42','2017-05-26 20:53:42'),(75,4,NULL,'Goshaingaon','2017-05-26 20:53:42','2017-05-26 20:53:42'),(76,4,NULL,'Guwahati','2017-05-26 20:53:42','2017-05-26 20:53:42'),(77,4,NULL,'Jorhat','2017-05-26 20:53:42','2017-05-26 20:53:42'),(78,4,NULL,'Karimganj','2017-05-26 20:53:42','2017-05-26 20:53:42'),(79,4,NULL,'Kokrajhar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(80,4,NULL,'Lala','2017-05-26 20:53:42','2017-05-26 20:53:42'),(81,4,NULL,'Nalbari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(82,4,NULL,'Namrup','2017-05-26 20:53:42','2017-05-26 20:53:42'),(83,4,NULL,'Nazira','2017-05-26 20:53:42','2017-05-26 20:53:42'),(84,4,NULL,'North Lakhimpur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(85,4,NULL,'Powai','2017-05-26 20:53:42','2017-05-26 20:53:42'),(86,4,NULL,'Sibsagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(87,4,NULL,'Silchar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(88,4,NULL,'Tezpur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(89,4,NULL,'Tinsukia','2017-05-26 20:53:42','2017-05-26 20:53:42'),(90,4,NULL,'Ulubari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(91,5,NULL,'Banka','2017-05-26 20:53:42','2017-05-26 20:53:42'),(92,5,NULL,'Begusarai','2017-05-26 20:53:42','2017-05-26 20:53:42'),(93,5,NULL,'Bhagalpur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(94,5,NULL,'Bhawanipur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(95,5,NULL,'Bihar Sharif','2017-05-26 20:53:42','2017-05-26 20:53:42'),(96,5,NULL,'Chandan','2017-05-26 20:53:42','2017-05-26 20:53:42'),(97,5,NULL,'Darbhanga','2017-05-26 20:53:42','2017-05-26 20:53:42'),(98,5,NULL,'Dhaka','2017-05-26 20:53:42','2017-05-26 20:53:42'),(99,5,NULL,'Gaya','2017-05-26 20:53:42','2017-05-26 20:53:42'),(100,5,NULL,'Jaynagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(101,5,NULL,'Jha Jha','2017-05-26 20:53:42','2017-05-26 20:53:42'),(102,5,NULL,'Kamat','2017-05-26 20:53:42','2017-05-26 20:53:42'),(103,5,NULL,'Motihari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(104,5,NULL,'Munger','2017-05-26 20:53:42','2017-05-26 20:53:42'),(105,5,NULL,'Muzaffarpur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(106,5,NULL,'Patna','2017-05-26 20:53:42','2017-05-26 20:53:42'),(107,5,NULL,'Purnea','2017-05-26 20:53:42','2017-05-26 20:53:42'),(108,5,NULL,'Pusa','2017-05-26 20:53:42','2017-05-26 20:53:42'),(109,5,NULL,'Raxaul','2017-05-26 20:53:42','2017-05-26 20:53:42'),(110,5,NULL,'Sakri','2017-05-26 20:53:42','2017-05-26 20:53:42'),(111,5,NULL,'Samastipur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(112,6,NULL,'Chandigarh','2017-05-26 20:53:42','2017-05-26 20:53:42'),(113,7,NULL,'Ambikapur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(114,7,NULL,'Bemetara','2017-05-26 20:53:42','2017-05-26 20:53:42'),(115,7,NULL,'Bhatapara','2017-05-26 20:53:42','2017-05-26 20:53:42'),(116,7,NULL,'Bhilai','2017-05-26 20:53:42','2017-05-26 20:53:42'),(117,7,NULL,'Bilaspur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(118,7,NULL,'Champa','2017-05-26 20:53:42','2017-05-26 20:53:42'),(119,7,NULL,'Dhamtari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(120,7,NULL,'Durg','2017-05-26 20:53:42','2017-05-26 20:53:42'),(121,7,NULL,'Jagdalpur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(122,7,NULL,'Janjgir','2017-05-26 20:53:42','2017-05-26 20:53:42'),(123,7,NULL,'Koni','2017-05-26 20:53:42','2017-05-26 20:53:42'),(124,7,NULL,'Korba','2017-05-26 20:53:42','2017-05-26 20:53:42'),(125,7,NULL,'Kumhari','2017-05-26 20:53:42','2017-05-26 20:53:42'),(126,7,NULL,'Lanka','2017-05-26 20:53:42','2017-05-26 20:53:42'),(127,7,NULL,'Mohala','2017-05-26 20:53:42','2017-05-26 20:53:42'),(128,7,NULL,'Raigarh','2017-05-26 20:53:42','2017-05-26 20:53:42'),(129,7,NULL,'Raipur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(130,7,NULL,'Sukma','2017-05-26 20:53:42','2017-05-26 20:53:42'),(131,8,NULL,'Daman','2017-05-26 20:53:42','2017-05-26 20:53:42'),(132,9,NULL,'Alipur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(133,9,NULL,'Bawana','2017-05-26 20:53:42','2017-05-26 20:53:42'),(134,9,NULL,'Connaught Place','2017-05-26 20:53:42','2017-05-26 20:53:42'),(135,9,NULL,'Delhi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(136,9,NULL,'Kalkaji Devi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(137,9,NULL,'Narela','2017-05-26 20:53:42','2017-05-26 20:53:42'),(138,9,NULL,'New Delhi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(139,9,NULL,'Shahdara','2017-05-26 20:53:42','2017-05-26 20:53:42'),(140,10,NULL,'Amal','2017-05-26 20:53:42','2017-05-26 20:53:42'),(141,10,NULL,'Silvassa','2017-05-26 20:53:42','2017-05-26 20:53:42'),(142,11,NULL,'Aldona','2017-05-26 20:53:42','2017-05-26 20:53:42'),(143,11,NULL,'Arpora','2017-05-26 20:53:42','2017-05-26 20:53:42'),(144,11,NULL,'Assagao','2017-05-26 20:53:42','2017-05-26 20:53:42'),(145,11,NULL,'Bambolim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(146,11,NULL,'Betalbatim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(147,11,NULL,'Betim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(148,11,NULL,'Calangute','2017-05-26 20:53:42','2017-05-26 20:53:42'),(149,11,NULL,'Candolim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(150,11,NULL,'Caranzalem','2017-05-26 20:53:42','2017-05-26 20:53:42'),(151,11,NULL,'Chicalim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(152,11,NULL,'Cuncolim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(153,11,NULL,'Curchorem','2017-05-26 20:53:42','2017-05-26 20:53:42'),(154,11,NULL,'Dicholi','2017-05-26 20:53:42','2017-05-26 20:53:42'),(155,11,NULL,'Dona Paula','2017-05-26 20:53:42','2017-05-26 20:53:42'),(156,11,NULL,'Goa','2017-05-26 20:53:42','2017-05-26 20:53:42'),(157,11,NULL,'Madgaon','2017-05-26 20:53:42','2017-05-26 20:53:42'),(158,11,NULL,'Marmagao','2017-05-26 20:53:42','2017-05-26 20:53:42'),(159,11,NULL,'Navelim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(160,11,NULL,'Panjim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(161,11,NULL,'Parra','2017-05-26 20:53:42','2017-05-26 20:53:42'),(162,11,NULL,'Ponda','2017-05-26 20:53:42','2017-05-26 20:53:42'),(163,11,NULL,'Quepem','2017-05-26 20:53:42','2017-05-26 20:53:42'),(164,11,NULL,'Saligao','2017-05-26 20:53:42','2017-05-26 20:53:42'),(165,11,NULL,'Sanquelim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(166,11,NULL,'Solim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(167,11,NULL,'Vainguinim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(168,11,NULL,'Vasco','2017-05-26 20:53:42','2017-05-26 20:53:42'),(169,11,NULL,'Verna','2017-05-26 20:53:42','2017-05-26 20:53:42'),(170,12,NULL,'Ahmedabad','2017-05-26 20:53:42','2017-05-26 20:53:42'),(171,12,NULL,'Amreli','2017-05-26 20:53:42','2017-05-26 20:53:42'),(172,12,NULL,'Amroli','2017-05-26 20:53:42','2017-05-26 20:53:42'),(173,12,NULL,'Anand','2017-05-26 20:53:42','2017-05-26 20:53:42'),(174,12,NULL,'Ankleshwar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(175,12,NULL,'Antapur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(176,12,NULL,'Bardoli','2017-05-26 20:53:42','2017-05-26 20:53:42'),(177,12,NULL,'Basu','2017-05-26 20:53:42','2017-05-26 20:53:42'),(178,12,NULL,'Bhadath','2017-05-26 20:53:42','2017-05-26 20:53:42'),(179,12,NULL,'Bharuch','2017-05-26 20:53:42','2017-05-26 20:53:42'),(180,12,NULL,'Bhavnagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(181,12,NULL,'Bhuj','2017-05-26 20:53:42','2017-05-26 20:53:42'),(182,12,NULL,'Bilimora','2017-05-26 20:53:42','2017-05-26 20:53:42'),(183,12,NULL,'Chhota Udepur','2017-05-26 20:53:42','2017-05-26 20:53:42'),(184,12,NULL,'Dahod','2017-05-26 20:53:42','2017-05-26 20:53:42'),(185,12,NULL,'Dewan','2017-05-26 20:53:42','2017-05-26 20:53:42'),(186,12,NULL,'Dhansura','2017-05-26 20:53:42','2017-05-26 20:53:42'),(187,12,NULL,'Dhrol','2017-05-26 20:53:42','2017-05-26 20:53:42'),(188,12,NULL,'Dwarka','2017-05-26 20:53:42','2017-05-26 20:53:42'),(189,12,NULL,'Gandhidham','2017-05-26 20:53:42','2017-05-26 20:53:42'),(190,12,NULL,'Gandhinagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(191,12,NULL,'Ghana','2017-05-26 20:53:42','2017-05-26 20:53:42'),(192,12,NULL,'Godhra','2017-05-26 20:53:42','2017-05-26 20:53:42'),(193,12,NULL,'Himatnagar','2017-05-26 20:53:42','2017-05-26 20:53:42'),(194,12,NULL,'Jalalpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(195,12,NULL,'Jamnagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(196,12,NULL,'Junagadh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(197,12,NULL,'Kalol','2017-05-26 20:53:43','2017-05-26 20:53:43'),(198,12,NULL,'Karamsad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(199,12,NULL,'Keshod','2017-05-26 20:53:43','2017-05-26 20:53:43'),(200,12,NULL,'Khambhat','2017-05-26 20:53:43','2017-05-26 20:53:43'),(201,12,NULL,'Kheda','2017-05-26 20:53:43','2017-05-26 20:53:43'),(202,12,NULL,'Khergam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(203,12,NULL,'Kosamba','2017-05-26 20:53:43','2017-05-26 20:53:43'),(204,12,NULL,'Mahesana','2017-05-26 20:53:43','2017-05-26 20:53:43'),(205,12,NULL,'Malpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(206,12,NULL,'Mandvi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(207,12,NULL,'Matar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(208,12,NULL,'Mithapur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(209,12,NULL,'Modasa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(210,12,NULL,'Morvi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(211,12,NULL,'Mundra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(212,12,NULL,'Nadiad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(213,12,NULL,'Nagwa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(214,12,NULL,'Navsari','2017-05-26 20:53:43','2017-05-26 20:53:43'),(215,12,NULL,'Patan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(216,12,NULL,'Petlad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(217,12,NULL,'Porbandar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(218,12,NULL,'Rajkot','2017-05-26 20:53:43','2017-05-26 20:53:43'),(219,12,NULL,'Rander','2017-05-26 20:53:43','2017-05-26 20:53:43'),(220,12,NULL,'Rawal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(221,12,NULL,'Sachin','2017-05-26 20:53:43','2017-05-26 20:53:43'),(222,12,NULL,'Sami','2017-05-26 20:53:43','2017-05-26 20:53:43'),(223,12,NULL,'Sanand','2017-05-26 20:53:43','2017-05-26 20:53:43'),(224,12,NULL,'Somnath','2017-05-26 20:53:43','2017-05-26 20:53:43'),(225,12,NULL,'Surendranagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(226,12,NULL,'Thasra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(227,12,NULL,'Vadodara','2017-05-26 20:53:43','2017-05-26 20:53:43'),(228,12,NULL,'Vadodra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(229,12,NULL,'Valsad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(230,12,NULL,'Vapi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(231,12,NULL,'Vijapur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(232,12,NULL,'Visnagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(233,13,NULL,'Bhawan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(234,13,NULL,'Bilaspur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(235,13,NULL,'Chamba','2017-05-26 20:53:43','2017-05-26 20:53:43'),(236,13,NULL,'Dharamsala','2017-05-26 20:53:43','2017-05-26 20:53:43'),(237,13,NULL,'Dharmpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(238,13,NULL,'Hamirpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(239,13,NULL,'Hari','2017-05-26 20:53:43','2017-05-26 20:53:43'),(240,13,NULL,'Kalka','2017-05-26 20:53:43','2017-05-26 20:53:43'),(241,13,NULL,'Kangra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(242,13,NULL,'Kumar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(243,13,NULL,'Manali','2017-05-26 20:53:43','2017-05-26 20:53:43'),(244,13,NULL,'Mandi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(245,13,NULL,'Mani','2017-05-26 20:53:43','2017-05-26 20:53:43'),(246,13,NULL,'Mashobra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(247,13,NULL,'Nalagarh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(248,13,NULL,'Nehra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(249,13,NULL,'Nurpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(250,13,NULL,'Palampur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(251,13,NULL,'Paonta Sahib','2017-05-26 20:53:43','2017-05-26 20:53:43'),(252,13,NULL,'Shimla','2017-05-26 20:53:43','2017-05-26 20:53:43'),(253,13,NULL,'Solan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(254,14,NULL,'Ambala','2017-05-26 20:53:43','2017-05-26 20:53:43'),(255,14,NULL,'Aurangabad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(256,14,NULL,'Bahadurgarh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(257,14,NULL,'Ballabgarh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(258,14,NULL,'Bhiwani','2017-05-26 20:53:43','2017-05-26 20:53:43'),(259,14,NULL,'Budha','2017-05-26 20:53:43','2017-05-26 20:53:43'),(260,14,NULL,'Chhachhrauli','2017-05-26 20:53:43','2017-05-26 20:53:43'),(261,14,NULL,'Faridabad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(262,14,NULL,'Fatehabad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(263,14,NULL,'Ganga','2017-05-26 20:53:43','2017-05-26 20:53:43'),(264,14,NULL,'Gohana','2017-05-26 20:53:43','2017-05-26 20:53:43'),(265,14,NULL,'Gurgaon','2017-05-26 20:53:43','2017-05-26 20:53:43'),(266,14,NULL,'Hansi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(267,14,NULL,'Haryana','2017-05-26 20:53:43','2017-05-26 20:53:43'),(268,14,NULL,'Hisar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(269,14,NULL,'Indraprast','2017-05-26 20:53:43','2017-05-26 20:53:43'),(270,14,NULL,'Jhajjar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(271,14,NULL,'Jind','2017-05-26 20:53:43','2017-05-26 20:53:43'),(272,14,NULL,'Kaithal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(273,14,NULL,'Kalra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(274,14,NULL,'Karnal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(275,14,NULL,'Kaul','2017-05-26 20:53:43','2017-05-26 20:53:43'),(276,14,NULL,'Kotian','2017-05-26 20:53:43','2017-05-26 20:53:43'),(277,14,NULL,'Ladwa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(278,14,NULL,'Narnaul','2017-05-26 20:53:43','2017-05-26 20:53:43'),(279,14,NULL,'Nilokheri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(280,14,NULL,'Odhan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(281,14,NULL,'Palwal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(282,14,NULL,'Panipat','2017-05-26 20:53:43','2017-05-26 20:53:43'),(283,14,NULL,'Pehowa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(284,14,NULL,'Rewari','2017-05-26 20:53:43','2017-05-26 20:53:43'),(285,14,NULL,'Rohtak','2017-05-26 20:53:43','2017-05-26 20:53:43'),(286,14,NULL,'Saha','2017-05-26 20:53:43','2017-05-26 20:53:43'),(287,14,NULL,'Shahabad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(288,14,NULL,'Sirsa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(289,14,NULL,'Sodhi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(290,14,NULL,'Sonipat','2017-05-26 20:53:43','2017-05-26 20:53:43'),(291,14,NULL,'Tohana','2017-05-26 20:53:43','2017-05-26 20:53:43'),(292,14,NULL,'Yamunanagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(293,15,NULL,'Bokaro','2017-05-26 20:53:43','2017-05-26 20:53:43'),(294,15,NULL,'Dhanbad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(295,15,NULL,'Dumka','2017-05-26 20:53:43','2017-05-26 20:53:43'),(296,15,NULL,'Hazaribagh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(297,15,NULL,'Jamshedpur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(298,15,NULL,'Mahulia','2017-05-26 20:53:43','2017-05-26 20:53:43'),(299,15,NULL,'Ramgarh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(300,15,NULL,'Ranchi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(301,16,NULL,'Anantnag','2017-05-26 20:53:43','2017-05-26 20:53:43'),(302,16,NULL,'Arch','2017-05-26 20:53:43','2017-05-26 20:53:43'),(303,16,NULL,'Bala','2017-05-26 20:53:43','2017-05-26 20:53:43'),(304,16,NULL,'Bawan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(305,16,NULL,'Gold','2017-05-26 20:53:43','2017-05-26 20:53:43'),(306,16,NULL,'Jammu','2017-05-26 20:53:43','2017-05-26 20:53:43'),(307,16,NULL,'Kargil','2017-05-26 20:53:43','2017-05-26 20:53:43'),(308,16,NULL,'Kathua','2017-05-26 20:53:43','2017-05-26 20:53:43'),(309,16,NULL,'Katra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(310,16,NULL,'Kundan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(311,16,NULL,'Markal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(312,16,NULL,'Nila','2017-05-26 20:53:43','2017-05-26 20:53:43'),(313,16,NULL,'Pahalgam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(314,16,NULL,'Patel','2017-05-26 20:53:43','2017-05-26 20:53:43'),(315,16,NULL,'Raju','2017-05-26 20:53:43','2017-05-26 20:53:43'),(316,16,NULL,'Ranjan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(317,16,NULL,'Ring','2017-05-26 20:53:43','2017-05-26 20:53:43'),(318,16,NULL,'Srinagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(319,16,NULL,'Suman','2017-05-26 20:53:43','2017-05-26 20:53:43'),(320,17,NULL,'Bagalkot','2017-05-26 20:53:43','2017-05-26 20:53:43'),(321,17,NULL,'Bangalore','2017-05-26 20:53:43','2017-05-26 20:53:43'),(322,17,NULL,'Belgaum','2017-05-26 20:53:43','2017-05-26 20:53:43'),(323,17,NULL,'Bellare','2017-05-26 20:53:43','2017-05-26 20:53:43'),(324,17,NULL,'Bellary','2017-05-26 20:53:43','2017-05-26 20:53:43'),(325,17,NULL,'Bhadravati','2017-05-26 20:53:43','2017-05-26 20:53:43'),(326,17,NULL,'Bhatkal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(327,17,NULL,'Bidar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(328,17,NULL,'Bijapur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(329,17,NULL,'Channapatna','2017-05-26 20:53:43','2017-05-26 20:53:43'),(330,17,NULL,'Chikmagalūr','2017-05-26 20:53:43','2017-05-26 20:53:43'),(331,17,NULL,'Chikodi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(332,17,NULL,'Chintamani','2017-05-26 20:53:43','2017-05-26 20:53:43'),(333,17,NULL,'Chitradurga','2017-05-26 20:53:43','2017-05-26 20:53:43'),(334,17,NULL,'Davangere','2017-05-26 20:53:43','2017-05-26 20:53:43'),(335,17,NULL,'Dharwad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(336,17,NULL,'Gadag','2017-05-26 20:53:43','2017-05-26 20:53:43'),(337,17,NULL,'Gulbarga','2017-05-26 20:53:43','2017-05-26 20:53:43'),(338,17,NULL,'Hadadi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(339,17,NULL,'Hassan','2017-05-26 20:53:43','2017-05-26 20:53:43'),(340,17,NULL,'Haveri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(341,17,NULL,'Hira','2017-05-26 20:53:43','2017-05-26 20:53:43'),(342,17,NULL,'Hiriyur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(343,17,NULL,'Honavar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(344,17,NULL,'Hospet','2017-05-26 20:53:43','2017-05-26 20:53:43'),(345,17,NULL,'Hubli','2017-05-26 20:53:43','2017-05-26 20:53:43'),(346,17,NULL,'Karwar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(347,17,NULL,'Kolar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(348,17,NULL,'Kollegal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(349,17,NULL,'Koppal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(350,17,NULL,'Kushalnagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(351,17,NULL,'Madikeri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(352,17,NULL,'Mandya','2017-05-26 20:53:43','2017-05-26 20:53:43'),(353,17,NULL,'Mangalore','2017-05-26 20:53:43','2017-05-26 20:53:43'),(354,17,NULL,'Manipala','2017-05-26 20:53:43','2017-05-26 20:53:43'),(355,17,NULL,'Mundgod','2017-05-26 20:53:43','2017-05-26 20:53:43'),(356,17,NULL,'Mysore','2017-05-26 20:53:43','2017-05-26 20:53:43'),(357,17,NULL,'Nandi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(358,17,NULL,'Puttur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(359,17,NULL,'Raichur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(360,17,NULL,'Ramanagaram','2017-05-26 20:53:43','2017-05-26 20:53:43'),(361,17,NULL,'Sagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(362,17,NULL,'Sandur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(363,17,NULL,'Sangam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(364,17,NULL,'Shanti Grama','2017-05-26 20:53:43','2017-05-26 20:53:43'),(365,17,NULL,'Shimoga','2017-05-26 20:53:43','2017-05-26 20:53:43'),(366,17,NULL,'Sirsi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(367,17,NULL,'Siruguppa','2017-05-26 20:53:43','2017-05-26 20:53:43'),(368,17,NULL,'Someshwar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(369,17,NULL,'Tiptur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(370,17,NULL,'Tumkūr','2017-05-26 20:53:43','2017-05-26 20:53:43'),(371,17,NULL,'Udupi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(372,17,NULL,'Yadgir','2017-05-26 20:53:43','2017-05-26 20:53:43'),(373,18,NULL,'Alanallur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(374,18,NULL,'Alappuzha','2017-05-26 20:53:43','2017-05-26 20:53:43'),(375,18,NULL,'Aluva','2017-05-26 20:53:43','2017-05-26 20:53:43'),(376,18,NULL,'Anchal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(377,18,NULL,'Angadipuram','2017-05-26 20:53:43','2017-05-26 20:53:43'),(378,18,NULL,'Aranmula','2017-05-26 20:53:43','2017-05-26 20:53:43'),(379,18,NULL,'Attingal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(380,18,NULL,'Changanacheri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(381,18,NULL,'Chengannur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(382,18,NULL,'Chittur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(383,18,NULL,'Edavanna','2017-05-26 20:53:43','2017-05-26 20:53:43'),(384,18,NULL,'Ernakulam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(385,18,NULL,'Guruvayur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(386,18,NULL,'Idukki','2017-05-26 20:53:43','2017-05-26 20:53:43'),(387,18,NULL,'Irinjalakuda','2017-05-26 20:53:43','2017-05-26 20:53:43'),(388,18,NULL,'Kaladi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(389,18,NULL,'Kalpetta','2017-05-26 20:53:43','2017-05-26 20:53:43'),(390,18,NULL,'Kanhangad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(391,18,NULL,'Kannur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(392,18,NULL,'Kasaragod','2017-05-26 20:53:43','2017-05-26 20:53:43'),(393,18,NULL,'Kayamkulam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(394,18,NULL,'Kochi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(395,18,NULL,'Kodungallur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(396,18,NULL,'Kollam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(397,18,NULL,'Koni','2017-05-26 20:53:43','2017-05-26 20:53:43'),(398,18,NULL,'Kottakkal','2017-05-26 20:53:43','2017-05-26 20:53:43'),(399,18,NULL,'Kottarakara','2017-05-26 20:53:43','2017-05-26 20:53:43'),(400,18,NULL,'Kottayam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(401,18,NULL,'Kozhikode','2017-05-26 20:53:43','2017-05-26 20:53:43'),(402,18,NULL,'Malappuram','2017-05-26 20:53:43','2017-05-26 20:53:43'),(403,18,NULL,'Manjeri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(404,18,NULL,'Mattanur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(405,18,NULL,'Mavelikara','2017-05-26 20:53:43','2017-05-26 20:53:43'),(406,18,NULL,'Nilambur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(407,18,NULL,'Ottappalam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(408,18,NULL,'Palakkad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(409,18,NULL,'Palayam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(410,18,NULL,'Parappanangadi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(411,18,NULL,'Paravur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(412,18,NULL,'Pathanamthitta','2017-05-26 20:53:43','2017-05-26 20:53:43'),(413,18,NULL,'Pattambi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(414,18,NULL,'Payyanur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(415,18,NULL,'Ponnani','2017-05-26 20:53:43','2017-05-26 20:53:43'),(416,18,NULL,'Punalur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(417,18,NULL,'Shoranur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(418,18,NULL,'Sultans Battery','2017-05-26 20:53:43','2017-05-26 20:53:43'),(419,18,NULL,'Thalassery','2017-05-26 20:53:43','2017-05-26 20:53:43'),(420,18,NULL,'Thiruvananthapuram','2017-05-26 20:53:43','2017-05-26 20:53:43'),(421,18,NULL,'Thrissur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(422,18,NULL,'Tirur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(423,18,NULL,'Tiruvalla','2017-05-26 20:53:43','2017-05-26 20:53:43'),(424,18,NULL,'Vaikam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(425,18,NULL,'Vazhakulam','2017-05-26 20:53:43','2017-05-26 20:53:43'),(426,19,NULL,'Kavaratti','2017-05-26 20:53:43','2017-05-26 20:53:43'),(427,20,NULL,'Abdul','2017-05-26 20:53:43','2017-05-26 20:53:43'),(428,20,NULL,'Ahmednagar','2017-05-26 20:53:43','2017-05-26 20:53:43'),(429,20,NULL,'Akola','2017-05-26 20:53:43','2017-05-26 20:53:43'),(430,20,NULL,'Alibag','2017-05-26 20:53:43','2017-05-26 20:53:43'),(431,20,NULL,'Ambad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(432,20,NULL,'Ambarnath','2017-05-26 20:53:43','2017-05-26 20:53:43'),(433,20,NULL,'Amravati','2017-05-26 20:53:43','2017-05-26 20:53:43'),(434,20,NULL,'Andheri','2017-05-26 20:53:43','2017-05-26 20:53:43'),(435,20,NULL,'Arvi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(436,20,NULL,'Aundh','2017-05-26 20:53:43','2017-05-26 20:53:43'),(437,20,NULL,'Aurangabad','2017-05-26 20:53:43','2017-05-26 20:53:43'),(438,20,NULL,'Badlapur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(439,20,NULL,'Bandra','2017-05-26 20:53:43','2017-05-26 20:53:43'),(440,20,NULL,'Baramati','2017-05-26 20:53:43','2017-05-26 20:53:43'),(441,20,NULL,'Belapur','2017-05-26 20:53:43','2017-05-26 20:53:43'),(442,20,NULL,'Bhandup','2017-05-26 20:53:43','2017-05-26 20:53:43'),(443,20,NULL,'Bhiwandi','2017-05-26 20:53:43','2017-05-26 20:53:43'),(444,20,NULL,'Bhusawal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(445,20,NULL,'Boisar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(446,20,NULL,'Chakan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(447,20,NULL,'Chalisgaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(448,20,NULL,'Chandrapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(449,20,NULL,'Charan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(450,20,NULL,'Chinchvad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(451,20,NULL,'Chiplun','2017-05-26 20:53:44','2017-05-26 20:53:44'),(452,20,NULL,'Chopda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(453,20,NULL,'Colaba','2017-05-26 20:53:44','2017-05-26 20:53:44'),(454,20,NULL,'Dahanu','2017-05-26 20:53:44','2017-05-26 20:53:44'),(455,20,NULL,'Deolali','2017-05-26 20:53:44','2017-05-26 20:53:44'),(456,20,NULL,'Devgarh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(457,20,NULL,'Dharavi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(458,20,NULL,'Dhule','2017-05-26 20:53:44','2017-05-26 20:53:44'),(459,20,NULL,'Ellora Caves','2017-05-26 20:53:44','2017-05-26 20:53:44'),(460,20,NULL,'Gargoti','2017-05-26 20:53:44','2017-05-26 20:53:44'),(461,20,NULL,'Ghatkopar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(462,20,NULL,'Goregaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(463,20,NULL,'Hinganghat','2017-05-26 20:53:44','2017-05-26 20:53:44'),(464,20,NULL,'Hingoli','2017-05-26 20:53:44','2017-05-26 20:53:44'),(465,20,NULL,'Ichalkaranji','2017-05-26 20:53:44','2017-05-26 20:53:44'),(466,20,NULL,'Igatpuri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(467,20,NULL,'Jalgaon Jamod','2017-05-26 20:53:44','2017-05-26 20:53:44'),(468,20,NULL,'Jalna','2017-05-26 20:53:44','2017-05-26 20:53:44'),(469,20,NULL,'Kagal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(470,20,NULL,'Kalam','2017-05-26 20:53:44','2017-05-26 20:53:44'),(471,20,NULL,'Kalamboli','2017-05-26 20:53:44','2017-05-26 20:53:44'),(472,20,NULL,'Kalyan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(473,20,NULL,'Kankauli','2017-05-26 20:53:44','2017-05-26 20:53:44'),(474,20,NULL,'Karad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(475,20,NULL,'Karanja','2017-05-26 20:53:44','2017-05-26 20:53:44'),(476,20,NULL,'Karjat','2017-05-26 20:53:44','2017-05-26 20:53:44'),(477,20,NULL,'Khalapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(478,20,NULL,'Khopoli','2017-05-26 20:53:44','2017-05-26 20:53:44'),(479,20,NULL,'Kolhapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(480,20,NULL,'Latur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(481,20,NULL,'Mahad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(482,20,NULL,'Mahim','2017-05-26 20:53:44','2017-05-26 20:53:44'),(483,20,NULL,'Mangaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(484,20,NULL,'Manor','2017-05-26 20:53:44','2017-05-26 20:53:44'),(485,20,NULL,'Miraj','2017-05-26 20:53:44','2017-05-26 20:53:44'),(486,20,NULL,'Mumbai','2017-05-26 20:53:44','2017-05-26 20:53:44'),(487,20,NULL,'Nadgaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(488,20,NULL,'Nagpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(489,20,NULL,'Nanded','2017-05-26 20:53:44','2017-05-26 20:53:44'),(490,20,NULL,'Nandurbar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(491,20,NULL,'Narayangaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(492,20,NULL,'Nashik','2017-05-26 20:53:44','2017-05-26 20:53:44'),(493,20,NULL,'Neral','2017-05-26 20:53:44','2017-05-26 20:53:44'),(494,20,NULL,'Neri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(495,20,NULL,'Osmanabad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(496,20,NULL,'Palghar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(497,20,NULL,'Palus','2017-05-26 20:53:44','2017-05-26 20:53:44'),(498,20,NULL,'Panchgani','2017-05-26 20:53:44','2017-05-26 20:53:44'),(499,20,NULL,'Pandharpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(500,20,NULL,'Panvel','2017-05-26 20:53:44','2017-05-26 20:53:44'),(501,20,NULL,'Parbhani','2017-05-26 20:53:44','2017-05-26 20:53:44'),(502,20,NULL,'Parel','2017-05-26 20:53:44','2017-05-26 20:53:44'),(503,20,NULL,'Pimpri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(504,20,NULL,'Pune','2017-05-26 20:53:44','2017-05-26 20:53:44'),(505,20,NULL,'Puras','2017-05-26 20:53:44','2017-05-26 20:53:44'),(506,20,NULL,'Ratnagiri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(507,20,NULL,'Sakri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(508,20,NULL,'Sangamner','2017-05-26 20:53:44','2017-05-26 20:53:44'),(509,20,NULL,'Sangli','2017-05-26 20:53:44','2017-05-26 20:53:44'),(510,20,NULL,'Sangola','2017-05-26 20:53:44','2017-05-26 20:53:44'),(511,20,NULL,'Satara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(512,20,NULL,'Shahapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(513,20,NULL,'Shirgaon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(514,20,NULL,'Shrigonda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(515,20,NULL,'Sinnar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(516,20,NULL,'Sion','2017-05-26 20:53:44','2017-05-26 20:53:44'),(517,20,NULL,'Solapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(518,20,NULL,'Sopara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(519,20,NULL,'Talegaon Dabhade','2017-05-26 20:53:44','2017-05-26 20:53:44'),(520,20,NULL,'Thane','2017-05-26 20:53:44','2017-05-26 20:53:44'),(521,20,NULL,'Trimbak','2017-05-26 20:53:44','2017-05-26 20:53:44'),(522,20,NULL,'Tuljapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(523,20,NULL,'Ulhasnagar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(524,20,NULL,'Umred','2017-05-26 20:53:44','2017-05-26 20:53:44'),(525,20,NULL,'Vadner','2017-05-26 20:53:44','2017-05-26 20:53:44'),(526,20,NULL,'Vasai','2017-05-26 20:53:44','2017-05-26 20:53:44'),(527,20,NULL,'Vashi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(528,20,NULL,'Virar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(529,20,NULL,'Wai','2017-05-26 20:53:44','2017-05-26 20:53:44'),(530,20,NULL,'Wardha','2017-05-26 20:53:44','2017-05-26 20:53:44'),(531,20,NULL,'Yavatmal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(532,20,NULL,'Yeola','2017-05-26 20:53:44','2017-05-26 20:53:44'),(533,21,NULL,'Nongpoh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(534,21,NULL,'Nongstoin','2017-05-26 20:53:44','2017-05-26 20:53:44'),(535,21,NULL,'Pala','2017-05-26 20:53:44','2017-05-26 20:53:44'),(536,21,NULL,'Shillong','2017-05-26 20:53:44','2017-05-26 20:53:44'),(537,21,NULL,'Tura','2017-05-26 20:53:44','2017-05-26 20:53:44'),(538,22,NULL,'Churachandpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(539,22,NULL,'Imphal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(540,23,NULL,'Amarkantak','2017-05-26 20:53:44','2017-05-26 20:53:44'),(541,23,NULL,'Ambah','2017-05-26 20:53:44','2017-05-26 20:53:44'),(542,23,NULL,'Anantpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(543,23,NULL,'Bagh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(544,23,NULL,'Balaghat','2017-05-26 20:53:44','2017-05-26 20:53:44'),(545,23,NULL,'Baroda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(546,23,NULL,'Berasia','2017-05-26 20:53:44','2017-05-26 20:53:44'),(547,23,NULL,'Betul','2017-05-26 20:53:44','2017-05-26 20:53:44'),(548,23,NULL,'Bhagwan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(549,23,NULL,'Bhartiya','2017-05-26 20:53:44','2017-05-26 20:53:44'),(550,23,NULL,'Bhopal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(551,23,NULL,'Chakra','2017-05-26 20:53:44','2017-05-26 20:53:44'),(552,23,NULL,'Chand','2017-05-26 20:53:44','2017-05-26 20:53:44'),(553,23,NULL,'Chhindwara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(554,23,NULL,'Chopra','2017-05-26 20:53:44','2017-05-26 20:53:44'),(555,23,NULL,'Damoh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(556,23,NULL,'Dewas','2017-05-26 20:53:44','2017-05-26 20:53:44'),(557,23,NULL,'Dhar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(558,23,NULL,'Dindori','2017-05-26 20:53:44','2017-05-26 20:53:44'),(559,23,NULL,'Gandhigram','2017-05-26 20:53:44','2017-05-26 20:53:44'),(560,23,NULL,'Ganpat','2017-05-26 20:53:44','2017-05-26 20:53:44'),(561,23,NULL,'Guna','2017-05-26 20:53:44','2017-05-26 20:53:44'),(562,23,NULL,'Gwalior','2017-05-26 20:53:44','2017-05-26 20:53:44'),(563,23,NULL,'Hoshangabad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(564,23,NULL,'Indore','2017-05-26 20:53:44','2017-05-26 20:53:44'),(565,23,NULL,'Jabalpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(566,23,NULL,'Kailaras','2017-05-26 20:53:44','2017-05-26 20:53:44'),(567,23,NULL,'Kamalpura','2017-05-26 20:53:44','2017-05-26 20:53:44'),(568,23,NULL,'Kataria','2017-05-26 20:53:44','2017-05-26 20:53:44'),(569,23,NULL,'Katni','2017-05-26 20:53:44','2017-05-26 20:53:44'),(570,23,NULL,'Khajuraho Group of Monuments','2017-05-26 20:53:44','2017-05-26 20:53:44'),(571,23,NULL,'Khargone','2017-05-26 20:53:44','2017-05-26 20:53:44'),(572,23,NULL,'Mandla','2017-05-26 20:53:44','2017-05-26 20:53:44'),(573,23,NULL,'Mandsaur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(574,23,NULL,'Mhow','2017-05-26 20:53:44','2017-05-26 20:53:44'),(575,23,NULL,'Morena','2017-05-26 20:53:44','2017-05-26 20:53:44'),(576,23,NULL,'Nadia','2017-05-26 20:53:44','2017-05-26 20:53:44'),(577,23,NULL,'Nagara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(578,23,NULL,'Pachmarhi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(579,23,NULL,'Raipur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(580,23,NULL,'Rajapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(581,23,NULL,'Rama','2017-05-26 20:53:44','2017-05-26 20:53:44'),(582,23,NULL,'Ratlam','2017-05-26 20:53:44','2017-05-26 20:53:44'),(583,23,NULL,'Rewa','2017-05-26 20:53:44','2017-05-26 20:53:44'),(584,23,NULL,'Sagar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(585,23,NULL,'Sarangi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(586,23,NULL,'Satna','2017-05-26 20:53:44','2017-05-26 20:53:44'),(587,23,NULL,'Sehore','2017-05-26 20:53:44','2017-05-26 20:53:44'),(588,23,NULL,'Sendhwa','2017-05-26 20:53:44','2017-05-26 20:53:44'),(589,23,NULL,'Shahdol','2017-05-26 20:53:44','2017-05-26 20:53:44'),(590,23,NULL,'Sidhi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(591,23,NULL,'Soni','2017-05-26 20:53:44','2017-05-26 20:53:44'),(592,23,NULL,'Tala','2017-05-26 20:53:44','2017-05-26 20:53:44'),(593,23,NULL,'Ujjain','2017-05-26 20:53:44','2017-05-26 20:53:44'),(594,23,NULL,'Vidisha','2017-05-26 20:53:44','2017-05-26 20:53:44'),(595,24,NULL,'Aizawl','2017-05-26 20:53:44','2017-05-26 20:53:44'),(596,25,NULL,'Chen','2017-05-26 20:53:44','2017-05-26 20:53:44'),(597,25,NULL,'Dimapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(598,25,NULL,'Kohima','2017-05-26 20:53:44','2017-05-26 20:53:44'),(599,26,NULL,'Angul','2017-05-26 20:53:44','2017-05-26 20:53:44'),(600,26,NULL,'Balangir','2017-05-26 20:53:44','2017-05-26 20:53:44'),(601,26,NULL,'Balasore','2017-05-26 20:53:44','2017-05-26 20:53:44'),(602,26,NULL,'Bargarh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(603,26,NULL,'Barpali','2017-05-26 20:53:44','2017-05-26 20:53:44'),(604,26,NULL,'Bhubaneswar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(605,26,NULL,'Brahmapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(606,26,NULL,'Cuttack','2017-05-26 20:53:44','2017-05-26 20:53:44'),(607,26,NULL,'Dhenkanal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(608,26,NULL,'Jajpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(609,26,NULL,'Jatani','2017-05-26 20:53:44','2017-05-26 20:53:44'),(610,26,NULL,'Jaypur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(611,26,NULL,'Jharsuguda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(612,26,NULL,'Kalinga','2017-05-26 20:53:44','2017-05-26 20:53:44'),(613,26,NULL,'Khurda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(614,26,NULL,'Koraput','2017-05-26 20:53:44','2017-05-26 20:53:44'),(615,26,NULL,'Nayagarh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(616,26,NULL,'Puri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(617,26,NULL,'Raurkela','2017-05-26 20:53:44','2017-05-26 20:53:44'),(618,26,NULL,'Rayagada','2017-05-26 20:53:44','2017-05-26 20:53:44'),(619,26,NULL,'Sambalpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(620,26,NULL,'Sundargarh','2017-05-26 20:53:44','2017-05-26 20:53:44'),(621,26,NULL,'Talcher','2017-05-26 20:53:44','2017-05-26 20:53:44'),(622,26,NULL,'Udaigiri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(623,27,NULL,'Amritsar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(624,27,NULL,'Banga','2017-05-26 20:53:44','2017-05-26 20:53:44'),(625,27,NULL,'Barnala','2017-05-26 20:53:44','2017-05-26 20:53:44'),(626,27,NULL,'Batala','2017-05-26 20:53:44','2017-05-26 20:53:44'),(627,27,NULL,'Bhatinda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(628,27,NULL,'Dasua','2017-05-26 20:53:44','2017-05-26 20:53:44'),(629,27,NULL,'Dhariwal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(630,27,NULL,'Dhuri','2017-05-26 20:53:44','2017-05-26 20:53:44'),(631,27,NULL,'Dinanagar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(632,27,NULL,'Faridkot','2017-05-26 20:53:44','2017-05-26 20:53:44'),(633,27,NULL,'Firozpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(634,27,NULL,'Garhshankar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(635,27,NULL,'Gurdaspur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(636,27,NULL,'Hoshiarpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(637,27,NULL,'Jagraon','2017-05-26 20:53:44','2017-05-26 20:53:44'),(638,27,NULL,'Jalalabad','2017-05-26 20:53:44','2017-05-26 20:53:44'),(639,27,NULL,'Jalandhar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(640,27,NULL,'Kapurthala Town','2017-05-26 20:53:44','2017-05-26 20:53:44'),(641,27,NULL,'Khanna','2017-05-26 20:53:44','2017-05-26 20:53:44'),(642,27,NULL,'Kharar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(643,27,NULL,'Kot Isa Khan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(644,27,NULL,'Kurali','2017-05-26 20:53:44','2017-05-26 20:53:44'),(645,27,NULL,'Ludhiana','2017-05-26 20:53:44','2017-05-26 20:53:44'),(646,27,NULL,'Machhiwara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(647,27,NULL,'Maharaj','2017-05-26 20:53:44','2017-05-26 20:53:44'),(648,27,NULL,'Mansa','2017-05-26 20:53:44','2017-05-26 20:53:44'),(649,27,NULL,'Moga','2017-05-26 20:53:44','2017-05-26 20:53:44'),(650,27,NULL,'Mohali','2017-05-26 20:53:44','2017-05-26 20:53:44'),(651,27,NULL,'Morinda','2017-05-26 20:53:44','2017-05-26 20:53:44'),(652,27,NULL,'Mukerian','2017-05-26 20:53:44','2017-05-26 20:53:44'),(653,27,NULL,'Muktsar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(654,27,NULL,'Nabha','2017-05-26 20:53:44','2017-05-26 20:53:44'),(655,27,NULL,'Pathankot','2017-05-26 20:53:44','2017-05-26 20:53:44'),(656,27,NULL,'Patiala','2017-05-26 20:53:44','2017-05-26 20:53:44'),(657,27,NULL,'Phagwara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(658,27,NULL,'Rajpura','2017-05-26 20:53:44','2017-05-26 20:53:44'),(659,27,NULL,'Rupnagar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(660,27,NULL,'Sangrur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(661,27,NULL,'Shahkot','2017-05-26 20:53:44','2017-05-26 20:53:44'),(662,27,NULL,'Sirhind','2017-05-26 20:53:44','2017-05-26 20:53:44'),(663,27,NULL,'Sunam','2017-05-26 20:53:44','2017-05-26 20:53:44'),(664,27,NULL,'Talwandi Sabo','2017-05-26 20:53:44','2017-05-26 20:53:44'),(665,27,NULL,'Tarn Taran','2017-05-26 20:53:44','2017-05-26 20:53:44'),(666,28,NULL,'Karaikal','2017-05-26 20:53:44','2017-05-26 20:53:44'),(667,28,NULL,'Puducherry','2017-05-26 20:53:44','2017-05-26 20:53:44'),(668,29,NULL,'Ajmer','2017-05-26 20:53:44','2017-05-26 20:53:44'),(669,29,NULL,'Alwar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(670,29,NULL,'Amer','2017-05-26 20:53:44','2017-05-26 20:53:44'),(671,29,NULL,'Amet','2017-05-26 20:53:44','2017-05-26 20:53:44'),(672,29,NULL,'Balana','2017-05-26 20:53:44','2017-05-26 20:53:44'),(673,29,NULL,'Bali','2017-05-26 20:53:44','2017-05-26 20:53:44'),(674,29,NULL,'Banswara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(675,29,NULL,'Barmer','2017-05-26 20:53:44','2017-05-26 20:53:44'),(676,29,NULL,'Beawar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(677,29,NULL,'Bharatpur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(678,29,NULL,'Bhilwara','2017-05-26 20:53:44','2017-05-26 20:53:44'),(679,29,NULL,'Bikaner','2017-05-26 20:53:44','2017-05-26 20:53:44'),(680,29,NULL,'Binavas','2017-05-26 20:53:44','2017-05-26 20:53:44'),(681,29,NULL,'Bundi','2017-05-26 20:53:44','2017-05-26 20:53:44'),(682,29,NULL,'Charu','2017-05-26 20:53:44','2017-05-26 20:53:44'),(683,29,NULL,'Chetan','2017-05-26 20:53:44','2017-05-26 20:53:44'),(684,29,NULL,'Chhabra','2017-05-26 20:53:44','2017-05-26 20:53:44'),(685,29,NULL,'Dipas','2017-05-26 20:53:44','2017-05-26 20:53:44'),(686,29,NULL,'Ganganagar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(687,29,NULL,'Gangapur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(688,29,NULL,'Gangrar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(689,29,NULL,'Jaipur','2017-05-26 20:53:44','2017-05-26 20:53:44'),(690,29,NULL,'Jaisalmer','2017-05-26 20:53:44','2017-05-26 20:53:44'),(691,29,NULL,'Jhalawar','2017-05-26 20:53:44','2017-05-26 20:53:44'),(692,29,NULL,'Jhunjhunun','2017-05-26 20:53:45','2017-05-26 20:53:45'),(693,29,NULL,'Jodhpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(694,29,NULL,'Kalan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(695,29,NULL,'Kanakpura','2017-05-26 20:53:45','2017-05-26 20:53:45'),(696,29,NULL,'Khan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(697,29,NULL,'Khinwara','2017-05-26 20:53:45','2017-05-26 20:53:45'),(698,29,NULL,'Kishangarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(699,29,NULL,'Kolayat','2017-05-26 20:53:45','2017-05-26 20:53:45'),(700,29,NULL,'Kota','2017-05-26 20:53:45','2017-05-26 20:53:45'),(701,29,NULL,'Lamba Harisingh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(702,29,NULL,'Mahajan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(703,29,NULL,'Mahatma','2017-05-26 20:53:45','2017-05-26 20:53:45'),(704,29,NULL,'Mandal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(705,29,NULL,'Manna','2017-05-26 20:53:45','2017-05-26 20:53:45'),(706,29,NULL,'Mount Abu','2017-05-26 20:53:45','2017-05-26 20:53:45'),(707,29,NULL,'Nagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(708,29,NULL,'Nagaur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(709,29,NULL,'Nanda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(710,29,NULL,'Naraina','2017-05-26 20:53:45','2017-05-26 20:53:45'),(711,29,NULL,'Nathdwara','2017-05-26 20:53:45','2017-05-26 20:53:45'),(712,29,NULL,'Pali','2017-05-26 20:53:45','2017-05-26 20:53:45'),(713,29,NULL,'Pilani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(714,29,NULL,'Pitampura','2017-05-26 20:53:45','2017-05-26 20:53:45'),(715,29,NULL,'Pushkar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(716,29,NULL,'Rana','2017-05-26 20:53:45','2017-05-26 20:53:45'),(717,29,NULL,'Roshan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(718,29,NULL,'Shiv','2017-05-26 20:53:45','2017-05-26 20:53:45'),(719,29,NULL,'Sikar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(720,29,NULL,'Sirohi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(721,29,NULL,'Sojat','2017-05-26 20:53:45','2017-05-26 20:53:45'),(722,29,NULL,'Sultan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(723,29,NULL,'Surana','2017-05-26 20:53:45','2017-05-26 20:53:45'),(724,29,NULL,'Suratgarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(725,29,NULL,'Thali','2017-05-26 20:53:45','2017-05-26 20:53:45'),(726,29,NULL,'Tonk','2017-05-26 20:53:45','2017-05-26 20:53:45'),(727,29,NULL,'Udaipur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(728,30,NULL,'Gangtok','2017-05-26 20:53:45','2017-05-26 20:53:45'),(729,30,NULL,'Manu','2017-05-26 20:53:45','2017-05-26 20:53:45'),(730,30,NULL,'Singtam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(731,30,NULL,'Sirwani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(732,31,NULL,'Adilabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(733,31,NULL,'Balanagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(734,31,NULL,'Bhongir','2017-05-26 20:53:45','2017-05-26 20:53:45'),(735,31,NULL,'Bodhan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(736,31,NULL,'Gudur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(737,31,NULL,'Hyderabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(738,31,NULL,'Karimnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(739,31,NULL,'Khammam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(740,31,NULL,'Kottagudem','2017-05-26 20:53:45','2017-05-26 20:53:45'),(741,31,NULL,'Mancherial','2017-05-26 20:53:45','2017-05-26 20:53:45'),(742,31,NULL,'Medak','2017-05-26 20:53:45','2017-05-26 20:53:45'),(743,31,NULL,'Medchal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(744,31,NULL,'Nalgonda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(745,31,NULL,'Narsapur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(746,31,NULL,'Nizamabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(747,31,NULL,'Paloncha','2017-05-26 20:53:45','2017-05-26 20:53:45'),(748,31,NULL,'Patancheru','2017-05-26 20:53:45','2017-05-26 20:53:45'),(749,31,NULL,'Patelguda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(750,31,NULL,'Pochampalli','2017-05-26 20:53:45','2017-05-26 20:53:45'),(751,31,NULL,'Secunderabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(752,31,NULL,'Shadnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(753,31,NULL,'Suriapet','2017-05-26 20:53:45','2017-05-26 20:53:45'),(754,31,NULL,'Uppal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(755,31,NULL,'Vikarabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(756,31,NULL,'Warangal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(757,32,NULL,'Alangulam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(758,32,NULL,'Ambur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(759,32,NULL,'Annamalainagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(760,32,NULL,'Arakkonam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(761,32,NULL,'Arani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(762,32,NULL,'Ariyalur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(763,32,NULL,'Attur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(764,32,NULL,'Bodinayakkanur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(765,32,NULL,'Chennai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(766,32,NULL,'Cheyyar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(767,32,NULL,'Chidambaram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(768,32,NULL,'Choolai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(769,32,NULL,'Coimbatore','2017-05-26 20:53:45','2017-05-26 20:53:45'),(770,32,NULL,'Coonoor','2017-05-26 20:53:45','2017-05-26 20:53:45'),(771,32,NULL,'Cuddalore','2017-05-26 20:53:45','2017-05-26 20:53:45'),(772,32,NULL,'Devipattinam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(773,32,NULL,'Dharapuram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(774,32,NULL,'Dharmapuri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(775,32,NULL,'Dindigul','2017-05-26 20:53:45','2017-05-26 20:53:45'),(776,32,NULL,'Ekkattuthangal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(777,32,NULL,'Eral','2017-05-26 20:53:45','2017-05-26 20:53:45'),(778,32,NULL,'Erode','2017-05-26 20:53:45','2017-05-26 20:53:45'),(779,32,NULL,'Fort','2017-05-26 20:53:45','2017-05-26 20:53:45'),(780,32,NULL,'Gobichettipalayam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(781,32,NULL,'Guindy','2017-05-26 20:53:45','2017-05-26 20:53:45'),(782,32,NULL,'Hosur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(783,32,NULL,'Kalpakkam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(784,32,NULL,'Kanchipuram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(785,32,NULL,'Kangayam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(786,32,NULL,'Kaniyambadi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(787,32,NULL,'Kanniyakumari','2017-05-26 20:53:45','2017-05-26 20:53:45'),(788,32,NULL,'Karaikudi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(789,32,NULL,'Karamadai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(790,32,NULL,'Karur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(791,32,NULL,'Kodaikanal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(792,32,NULL,'Koothanallur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(793,32,NULL,'Kovilpatti','2017-05-26 20:53:45','2017-05-26 20:53:45'),(794,32,NULL,'Krishnagiri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(795,32,NULL,'Kumbakonam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(796,32,NULL,'Kuzhithurai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(797,32,NULL,'Lalgudi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(798,32,NULL,'Madurai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(799,32,NULL,'Madurantakam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(800,32,NULL,'Mahabalipuram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(801,32,NULL,'Mannargudi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(802,32,NULL,'Mettur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(803,32,NULL,'Mylapore','2017-05-26 20:53:45','2017-05-26 20:53:45'),(804,32,NULL,'Nagapattinam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(805,32,NULL,'Nagercoil','2017-05-26 20:53:45','2017-05-26 20:53:45'),(806,32,NULL,'Namakkal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(807,32,NULL,'Neyveli','2017-05-26 20:53:45','2017-05-26 20:53:45'),(808,32,NULL,'Omalur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(809,32,NULL,'Ooty','2017-05-26 20:53:45','2017-05-26 20:53:45'),(810,32,NULL,'Palani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(811,32,NULL,'Palladam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(812,32,NULL,'Panruti','2017-05-26 20:53:45','2017-05-26 20:53:45'),(813,32,NULL,'Pattukkottai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(814,32,NULL,'Perambalur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(815,32,NULL,'Peranampattu','2017-05-26 20:53:45','2017-05-26 20:53:45'),(816,32,NULL,'Perundurai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(817,32,NULL,'Pollachi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(818,32,NULL,'Ponneri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(819,32,NULL,'Pudukkottai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(820,32,NULL,'Puliyur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(821,32,NULL,'Rajapalaiyam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(822,32,NULL,'Ramanathapuram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(823,32,NULL,'Ranippettai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(824,32,NULL,'Salem','2017-05-26 20:53:45','2017-05-26 20:53:45'),(825,32,NULL,'Sattur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(826,32,NULL,'Sholavandan','2017-05-26 20:53:45','2017-05-26 20:53:45'),(827,32,NULL,'Sirkazhi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(828,32,NULL,'Siruseri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(829,32,NULL,'Sivaganga','2017-05-26 20:53:45','2017-05-26 20:53:45'),(830,32,NULL,'Sivakasi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(831,32,NULL,'Sriperumbudur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(832,32,NULL,'Srirangam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(833,32,NULL,'Srivilliputhur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(834,32,NULL,'Tambaram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(835,32,NULL,'Thanjavur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(836,32,NULL,'Thenkasi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(837,32,NULL,'Thirumangalam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(838,32,NULL,'Thiruthani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(839,32,NULL,'Thiruvarur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(840,32,NULL,'Thoothukudi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(841,32,NULL,'Tindivanam','2017-05-26 20:53:45','2017-05-26 20:53:45'),(842,32,NULL,'Tiruchchendur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(843,32,NULL,'Tiruchi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(844,32,NULL,'Tirunelveli','2017-05-26 20:53:45','2017-05-26 20:53:45'),(845,32,NULL,'Tiruppur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(846,32,NULL,'Tiruvallur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(847,32,NULL,'Tiruvannamalai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(848,32,NULL,'Turaiyur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(849,32,NULL,'Vadamadurai','2017-05-26 20:53:45','2017-05-26 20:53:45'),(850,32,NULL,'Vandalur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(851,32,NULL,'Vandavasi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(852,32,NULL,'Vaniyambadi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(853,32,NULL,'Vellore','2017-05-26 20:53:45','2017-05-26 20:53:45'),(854,32,NULL,'Villupuram','2017-05-26 20:53:45','2017-05-26 20:53:45'),(855,32,NULL,'Wellington','2017-05-26 20:53:45','2017-05-26 20:53:45'),(856,32,NULL,'Yercaud','2017-05-26 20:53:45','2017-05-26 20:53:45'),(857,33,NULL,'Agartala','2017-05-26 20:53:45','2017-05-26 20:53:45'),(858,33,NULL,'Kamalpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(859,34,NULL,'Adwani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(860,34,NULL,'Almora','2017-05-26 20:53:45','2017-05-26 20:53:45'),(861,34,NULL,'Dang','2017-05-26 20:53:45','2017-05-26 20:53:45'),(862,34,NULL,'Dangi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(863,34,NULL,'Dehradun','2017-05-26 20:53:45','2017-05-26 20:53:45'),(864,34,NULL,'Dhanaulti','2017-05-26 20:53:45','2017-05-26 20:53:45'),(865,34,NULL,'Dogadda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(866,34,NULL,'Dwarahat','2017-05-26 20:53:45','2017-05-26 20:53:45'),(867,34,NULL,'Haldwani','2017-05-26 20:53:45','2017-05-26 20:53:45'),(868,34,NULL,'Haridwar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(869,34,NULL,'Jamal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(870,34,NULL,'Jaspur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(871,34,NULL,'Kashipur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(872,34,NULL,'Lohaghat','2017-05-26 20:53:45','2017-05-26 20:53:45'),(873,34,NULL,'Mill','2017-05-26 20:53:45','2017-05-26 20:53:45'),(874,34,NULL,'Mussoorie','2017-05-26 20:53:45','2017-05-26 20:53:45'),(875,34,NULL,'Nagal','2017-05-26 20:53:45','2017-05-26 20:53:45'),(876,34,NULL,'Naini','2017-05-26 20:53:45','2017-05-26 20:53:45'),(877,34,NULL,'Pantnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(878,34,NULL,'Pauri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(879,34,NULL,'Pithoragarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(880,34,NULL,'Ramnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(881,34,NULL,'Rishikesh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(882,34,NULL,'Roorkee','2017-05-26 20:53:45','2017-05-26 20:53:45'),(883,34,NULL,'Sidhpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(884,34,NULL,'Uttarkashi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(885,34,NULL,'Vikasnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(886,35,NULL,'Agra','2017-05-26 20:53:45','2017-05-26 20:53:45'),(887,35,NULL,'Ajabpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(888,35,NULL,'Aligarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(889,35,NULL,'Allahabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(890,35,NULL,'Anandnagar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(891,35,NULL,'Arora','2017-05-26 20:53:45','2017-05-26 20:53:45'),(892,35,NULL,'Azamgarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(893,35,NULL,'Bagpat','2017-05-26 20:53:45','2017-05-26 20:53:45'),(894,35,NULL,'Balu','2017-05-26 20:53:45','2017-05-26 20:53:45'),(895,35,NULL,'Banda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(896,35,NULL,'Bank','2017-05-26 20:53:45','2017-05-26 20:53:45'),(897,35,NULL,'Bareilly','2017-05-26 20:53:45','2017-05-26 20:53:45'),(898,35,NULL,'Basti','2017-05-26 20:53:45','2017-05-26 20:53:45'),(899,35,NULL,'Bela','2017-05-26 20:53:45','2017-05-26 20:53:45'),(900,35,NULL,'Bhadohi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(901,35,NULL,'Bichpuri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(902,35,NULL,'Budaun','2017-05-26 20:53:45','2017-05-26 20:53:45'),(903,35,NULL,'Bulandshahr','2017-05-26 20:53:45','2017-05-26 20:53:45'),(904,35,NULL,'Chandauli','2017-05-26 20:53:45','2017-05-26 20:53:45'),(905,35,NULL,'Chandausi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(906,35,NULL,'Chitra','2017-05-26 20:53:45','2017-05-26 20:53:45'),(907,35,NULL,'Dadri','2017-05-26 20:53:45','2017-05-26 20:53:45'),(908,35,NULL,'Dasna','2017-05-26 20:53:45','2017-05-26 20:53:45'),(909,35,NULL,'Deoria','2017-05-26 20:53:45','2017-05-26 20:53:45'),(910,35,NULL,'Etawah','2017-05-26 20:53:45','2017-05-26 20:53:45'),(911,35,NULL,'Faizabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(912,35,NULL,'Fatehgarh','2017-05-26 20:53:45','2017-05-26 20:53:45'),(913,35,NULL,'Fatehpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(914,35,NULL,'Firozabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(915,35,NULL,'Ghaziabad','2017-05-26 20:53:45','2017-05-26 20:53:45'),(916,35,NULL,'Gonda','2017-05-26 20:53:45','2017-05-26 20:53:45'),(917,35,NULL,'Gorakhpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(918,35,NULL,'Hamirpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(919,35,NULL,'Hapur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(920,35,NULL,'Iglas','2017-05-26 20:53:45','2017-05-26 20:53:45'),(921,35,NULL,'Jalesar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(922,35,NULL,'Jaunpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(923,35,NULL,'Jhansi','2017-05-26 20:53:45','2017-05-26 20:53:45'),(924,35,NULL,'Kaimganj','2017-05-26 20:53:45','2017-05-26 20:53:45'),(925,35,NULL,'Kanpur','2017-05-26 20:53:45','2017-05-26 20:53:45'),(926,35,NULL,'Karari','2017-05-26 20:53:45','2017-05-26 20:53:45'),(927,35,NULL,'Kasganj','2017-05-26 20:53:45','2017-05-26 20:53:45'),(928,35,NULL,'Kasia','2017-05-26 20:53:45','2017-05-26 20:53:45'),(929,35,NULL,'Khandar','2017-05-26 20:53:45','2017-05-26 20:53:45'),(930,35,NULL,'Khatauli','2017-05-26 20:53:45','2017-05-26 20:53:45'),(931,35,NULL,'Kheri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(932,35,NULL,'Khurja','2017-05-26 20:53:46','2017-05-26 20:53:46'),(933,35,NULL,'Kunwar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(934,35,NULL,'Lakhimpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(935,35,NULL,'Lucknow','2017-05-26 20:53:46','2017-05-26 20:53:46'),(936,35,NULL,'Madhoganj','2017-05-26 20:53:46','2017-05-26 20:53:46'),(937,35,NULL,'Mathan','2017-05-26 20:53:46','2017-05-26 20:53:46'),(938,35,NULL,'Mathura','2017-05-26 20:53:46','2017-05-26 20:53:46'),(939,35,NULL,'Mawana','2017-05-26 20:53:46','2017-05-26 20:53:46'),(940,35,NULL,'Meerut','2017-05-26 20:53:46','2017-05-26 20:53:46'),(941,35,NULL,'Mehra','2017-05-26 20:53:46','2017-05-26 20:53:46'),(942,35,NULL,'Mirza Murad','2017-05-26 20:53:46','2017-05-26 20:53:46'),(943,35,NULL,'Mirzapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(944,35,NULL,'Mohan','2017-05-26 20:53:46','2017-05-26 20:53:46'),(945,35,NULL,'Moradabad','2017-05-26 20:53:46','2017-05-26 20:53:46'),(946,35,NULL,'Muzaffarnagar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(947,35,NULL,'Noida','2017-05-26 20:53:46','2017-05-26 20:53:46'),(948,35,NULL,'Orai','2017-05-26 20:53:46','2017-05-26 20:53:46'),(949,35,NULL,'Padrauna','2017-05-26 20:53:46','2017-05-26 20:53:46'),(950,35,NULL,'Phaphamau','2017-05-26 20:53:46','2017-05-26 20:53:46'),(951,35,NULL,'Pilkhuwa','2017-05-26 20:53:46','2017-05-26 20:53:46'),(952,35,NULL,'Potti','2017-05-26 20:53:46','2017-05-26 20:53:46'),(953,35,NULL,'Rampur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(954,35,NULL,'Saharanpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(955,35,NULL,'Sahibabad','2017-05-26 20:53:46','2017-05-26 20:53:46'),(956,35,NULL,'Shahjahanpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(957,35,NULL,'Shamsabad','2017-05-26 20:53:46','2017-05-26 20:53:46'),(958,35,NULL,'Sikka','2017-05-26 20:53:46','2017-05-26 20:53:46'),(959,35,NULL,'Sitapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(960,35,NULL,'Sultanpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(961,35,NULL,'Tanda','2017-05-26 20:53:46','2017-05-26 20:53:46'),(962,35,NULL,'Teri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(963,35,NULL,'Tikamgarh','2017-05-26 20:53:46','2017-05-26 20:53:46'),(964,35,NULL,'Unnao','2017-05-26 20:53:46','2017-05-26 20:53:46'),(965,35,NULL,'Varanasi','2017-05-26 20:53:46','2017-05-26 20:53:46'),(966,36,NULL,'Alipur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(967,36,NULL,'Asansol','2017-05-26 20:53:46','2017-05-26 20:53:46'),(968,36,NULL,'Baharampur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(969,36,NULL,'Baidyabati','2017-05-26 20:53:46','2017-05-26 20:53:46'),(970,36,NULL,'Bali','2017-05-26 20:53:46','2017-05-26 20:53:46'),(971,36,NULL,'Balurghat','2017-05-26 20:53:46','2017-05-26 20:53:46'),(972,36,NULL,'Bangaon','2017-05-26 20:53:46','2017-05-26 20:53:46'),(973,36,NULL,'Bankura','2017-05-26 20:53:46','2017-05-26 20:53:46'),(974,36,NULL,'Barakpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(975,36,NULL,'Barddhaman','2017-05-26 20:53:46','2017-05-26 20:53:46'),(976,36,NULL,'Basirhat','2017-05-26 20:53:46','2017-05-26 20:53:46'),(977,36,NULL,'Behala','2017-05-26 20:53:46','2017-05-26 20:53:46'),(978,36,NULL,'Belgharia','2017-05-26 20:53:46','2017-05-26 20:53:46'),(979,36,NULL,'Binnaguri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(980,36,NULL,'Bishnupur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(981,36,NULL,'Bolpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(982,36,NULL,'Budbud','2017-05-26 20:53:46','2017-05-26 20:53:46'),(983,36,NULL,'Canning','2017-05-26 20:53:46','2017-05-26 20:53:46'),(984,36,NULL,'Chandannagar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(985,36,NULL,'Dam Dam','2017-05-26 20:53:46','2017-05-26 20:53:46'),(986,36,NULL,'Darjeeling','2017-05-26 20:53:46','2017-05-26 20:53:46'),(987,36,NULL,'Durgapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(988,36,NULL,'Farakka','2017-05-26 20:53:46','2017-05-26 20:53:46'),(989,36,NULL,'Ghatal','2017-05-26 20:53:46','2017-05-26 20:53:46'),(990,36,NULL,'Gujrat','2017-05-26 20:53:46','2017-05-26 20:53:46'),(991,36,NULL,'Habra','2017-05-26 20:53:46','2017-05-26 20:53:46'),(992,36,NULL,'Haldia','2017-05-26 20:53:46','2017-05-26 20:53:46'),(993,36,NULL,'Haripur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(994,36,NULL,'Howrah','2017-05-26 20:53:46','2017-05-26 20:53:46'),(995,36,NULL,'Hugli','2017-05-26 20:53:46','2017-05-26 20:53:46'),(996,36,NULL,'Jadabpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(997,36,NULL,'Jalpaiguri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(998,36,NULL,'Jayanti','2017-05-26 20:53:46','2017-05-26 20:53:46'),(999,36,NULL,'Jhargram','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1000,36,NULL,'Kakdwip','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1001,36,NULL,'Kalyani','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1002,36,NULL,'Kanchrapara','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1003,36,NULL,'Kandi','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1004,36,NULL,'Karsiyang','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1005,36,NULL,'Katoya','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1006,36,NULL,'Kharagpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1007,36,NULL,'Koch Bihar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1008,36,NULL,'Kolkata','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1009,36,NULL,'Konnagar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1010,36,NULL,'Kulti','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1011,36,NULL,'Liluah','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1012,36,NULL,'Maldah','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1013,36,NULL,'Manipur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1014,36,NULL,'Mayapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1015,36,NULL,'Medinipur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1016,36,NULL,'Multi','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1017,36,NULL,'Murshidabad','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1018,36,NULL,'Nabadwip','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1019,36,NULL,'Panchal','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1020,36,NULL,'Puruliya','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1021,36,NULL,'Rajpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1022,36,NULL,'Ranaghat','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1023,36,NULL,'Raniganj','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1024,36,NULL,'Rudrapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1025,36,NULL,'Rupnarayanpur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1026,36,NULL,'Salt Lake City','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1027,36,NULL,'Saranga','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1028,36,NULL,'Serampore','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1029,36,NULL,'Shyamnagar','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1030,36,NULL,'Siliguri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1031,36,NULL,'Siuri','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1032,23,NULL,'Shajapur','2017-05-26 20:53:46','2017-05-26 20:53:46'),(1033,12,'JG','Surat','2017-05-26 21:19:15','2017-05-26 21:19:15');
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
  CONSTRAINT `fk_rails_e4cbdb3410` FOREIGN KEY (`due_template_id`) REFERENCES `due_templates` (`id`),
  CONSTRAINT `fk_rails_beeb90dcd2` FOREIGN KEY (`due_employee_template_id`) REFERENCES `due_employee_templates` (`id`),
  CONSTRAINT `fk_rails_c52bde175a` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  CONSTRAINT `fk_rails_d537a3e83d` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
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
INSERT INTO `employee_categories` VALUES (1,'1.0','Director',NULL,NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Staff',NULL,NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Worker',NULL,NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'1.0','G',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
  CONSTRAINT `fk_rails_42e9a9a920` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_258306096f` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  KEY `index_employee_resignations_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_f852fce031` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
INSERT INTO `employee_types` VALUES (1,'1.0','Trainee',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Permanent',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Probation',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'4.0','Resigned',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'5.0','Confirmed',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
  `employee_code_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9497 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (8119,'1008119','EMP0008119',NULL,NULL,'Surabhi',NULL,'Singh','1988-03-23','Female','9876542404',NULL,'abc@gmail.com','93-B , Nehru Park colony, Prem Nagar, P.O. Izzatnagar',1,20,NULL,NULL,0,'Guest House currently','0','EVUPS8926Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8120,'1008120','EMP0008120',NULL,NULL,'Viksha',NULL,'Upadhyay','1989-06-30','Female','9876542405',NULL,'abc@gmail.com','Govt Quarter 2, Kedarpur Ambikapur, Surguja',1,20,NULL,NULL,0,'Silver Leaf 4A, Ramnagar colony, Bavdhan, Pune','0','ACRPU2719F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8121,'1008121','EMP0008121',NULL,NULL,'Shalini',NULL,'Sharma','1989-02-22','Female','9876542406',NULL,'abc@gmail.com','13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi',1,20,NULL,NULL,180001,'13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi, Jammu & KASHMIR - 180001','0','ERQPS7103R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8122,'1008122','EMP0008122',NULL,NULL,'Tushar',NULL,'Chugh','1990-10-15','Male','9876542407',NULL,'abc@gmail.com','525, Huda -20, Kaithal',1,20,NULL,NULL,0,'6 Raja Apartment, Model Colony, Pune','0','BFQPC2888Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8123,'1008123','EMP0008123',NULL,NULL,'Varad',NULL,'Sharma','1987-03-05','Male','9876542408',NULL,'abc@gmail.com','H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu(Tawi)',1,20,NULL,NULL,180002,'H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu( Tawi)- 180002','0','BSLPS6922F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8124,'1008124','EMP0008124',NULL,NULL,'Geetesh',NULL,'Binjhade','1987-12-02','Male','9876542409',NULL,'abc@gmail.com','House No. 1328, Nagpur Road, BSNL Colony, SARRA, Post Imlikheda',1,20,553,NULL,0,'House No. 1328, Nagpur Road, BSNL Colony, SARRA , Post Imlikheda, Chhindwara, MP','0','BKGPB5919N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8125,'1008125','EMP0008125',NULL,NULL,'Roshan',NULL,'Kumar','1983-12-23','Male','9876542410',NULL,'abc@gmail.com','Ward No 09, P.O Brpur',1,20,NULL,NULL,854340,'D1-304, Ganga Constella, Kharadi','0','AWCPK1116B',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8126,'1008126','EMP0008126',NULL,NULL,'Kishore','Varma','Addepalli','1983-08-09','Male','9876542411',NULL,'abc@gmail.com','Plot No. 351/ A, Flat No F 4, Om Sai Sudha  Residency, Vandanapuri Colony, Road No 2, Beeramguda, Patancheru Mandal',1,20,NULL,NULL,0,'Guest House currently','0','AMLPA6854H',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:50','2017-05-26 23:29:50',NULL,NULL,NULL,NULL),(8127,'1008127','EMP0008127',NULL,NULL,'Sweekar',NULL,'TM','1988-04-08','Male','9876542412',NULL,'abc@gmail.com','Venkateshwara general stores, Soraba Road, Sagar',1,20,NULL,NULL,577401,'Venkateshwara general stores, Soraba Road, Sagar- 577401, Shivamogga Dist, Karnataka','0','BAYPM4645L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8128,'1008128','EMP0008128',NULL,NULL,'Kalyani',NULL,'Deshpande','1981-01-11','Female','9876542413',NULL,'abc@gmail.com','11,Gayatri Bunglow, Shivaji Nagar, Opp. Deval Dairy, Miraj, Sangli',1,20,NULL,NULL,416410,'11,Gayatri Bunglow, Shivajinagar, opp Deval Dairy, Miraj, Sangli- 416410','0','BZLPD9061K',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8129,'1008129','EMP0008129',NULL,NULL,'Alok',NULL,'Bharti','1984-02-17','Male','9876542414',NULL,'abc@gmail.com','New road, Above old Bata, Sahibgunj',1,20,NULL,NULL,816109,'New road, Above old Bata, Sahibgunj, Jharkhand, 816109','0','AJZPB6555H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8130,'1008130','EMP0008130',NULL,NULL,'Sujitsingh',NULL,'Deore','1989-12-07','Male','9876542415',NULL,'abc@gmail.com','Santoshi Mata Colony Karanja (Lad)',1,20,NULL,NULL,444105,'Harshni 12,Rambug Colony,Kothrud Pune','0','CMEPD5870M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8131,'1008131','EMP0008131',NULL,NULL,'Rachit',NULL,'Huria','1990-06-09','Male','9876542416',NULL,'abc@gmail.com','136, Prannath ward No 6, Pana',1,20,NULL,NULL,488001,'Lane No 2, Regaram Patil Nagar, Kharadi, pune - 411014','0','AHSPH5048J',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8132,'1008132','EMP0008132',NULL,NULL,'LOKESH',NULL,'LOKHANDE','1986-07-28','Male','9876541234',NULL,'abc@gmail.com','PRATAP NAGAR',1,20,556,NULL,0,NULL,'0','ALAPL3215H',NULL,'UnMarried',4,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8133,'1008133','EMP0008133',NULL,NULL,'SATISH ','KUMAR','JATAV','1986-02-01','Male','9876541235',NULL,'abc@gmail.com','BHOUSLE COLONY DEWAS',1,20,556,NULL,455001,'BHOUSLE COLONY DEWAS','720234029796','ELFPK5225P','MP39N20160092137','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8134,'1008134','EMP0008134',NULL,NULL,'ASHOK','RAM NIHORE','SHARMA','1983-08-29','Male','9876541277',NULL,'abc@gmail.com','32-C/63  Bhavapur  Khuldabad  Allahabad',1,20,889,'Allahabad   ',455001,'32-C/63  Bhavapur  Khuldabad  Allahabad','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8135,'1008135','EMP0008135',NULL,NULL,'LAXMAN','ASHOK KUMAR','PATEL','1990-02-21','Male','9876541313',NULL,'abc@gmail.com','80  Nirja Nagar J.K.Road  Bhopal',1,20,550,'Bhopal',0,'280, LIG VIKAS NAGAR DEWAS','317554893404','ARBPP9452F','MP0420070107726','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8136,'1008136','EMP0008136',NULL,NULL,'DEEPAK ','MADHUKAR','UGALMUGALE','1983-01-08','Male','9876541351',NULL,'abc@gmail.com','128 Bhagat Singh Marg Dewas',1,20,486,'Mumbai',455001,'128 Bhagat Singh Marg Dewas','731404027120',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8137,'1008137','EMP0008137',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-27','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8138,'1008138','EMP0008138',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-24','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8139,'1008139','EMP0008139',NULL,NULL,'RAHUL','OMPRAKASH','PATIDAR','1981-11-29','Male','9876541354',NULL,'abc@gmail.com','Pooja Niwas Mewad Kothi Hatpiplya Dist Dewas',1,20,486,'Mumbai',455223,'Itawa Dews','963366544127','CYEPP7304J',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8140,'1008140','EMP0008140',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-28','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:51','2017-05-26 23:29:51',NULL,NULL,NULL,NULL),(8141,'1008141','EMP0008141',NULL,NULL,'DINESH','SHANKARLAL','GARI','1981-08-12','Male','9876541356',NULL,'abc@gmail.com','Ward No. 10 Garee Siya ',1,20,486,'Mumbai',455001,'Ward No. 10 Garee Siya ','823619727521',NULL,NULL,'Married',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8142,'1008142','EMP0008142',NULL,NULL,'PIYUSH ','MANOHAR','PANDIT','1989-07-26','Male','9876541361',NULL,'abc@gmail.com','C4/64 AWAS NAGAR DEWASDewas',1,20,486,'Mumbai',455001,'C4/64 AWAS NAGAR DEWASDewas','474110055702','CZFPP6677N',NULL,'UnMarried',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8143,'1008143','EMP0008143',NULL,NULL,'AKASH',NULL,'GAWLANE','1982-05-13','Male','9876541367',NULL,'abc@gmail.com','A2/52 AWAS NAGAR ',1,20,486,'Mumbai',455001,'A2/52 AWAS NAGAR ','0',NULL,NULL,'UnMarried',4,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8144,'1008144','EMP0008144',NULL,NULL,'ABHISHEK ','SINGH','CHOUHAN','1989-07-27','Male','9876541368',NULL,'abc@gmail.com','350/B SHIV SHAKTI NAGAR',1,20,486,'Mumbai',455001,'350/B SHIV SHAKTI NAGAR','0',NULL,NULL,'UnMarried',NULL,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8145,'1008145','EMP0008145',NULL,NULL,'DURGESH','BANSHIDHAR','NAGAR','1982-03-13','Male','9876541371',NULL,'abc@gmail.com','34 ARJUN NAGAR',1,20,486,'Mumbai',0,'34 ARJUN NAGAR','716866797256','CHDPD3123M',NULL,'Married',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8146,'1008146','EMP0008146',NULL,NULL,'AMIT',NULL,'BHOWMICK','1984-09-14','Male','9876541377',NULL,'abc@gmail.com','10, RAMNAGAR EXT. DEWAS ',1,20,486,'Mumbai',455001,'10, RAMNAGAR EXT. DEWAS ','434914790802',NULL,NULL,'UnMarried',3,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8147,'1008147','EMP0008147',NULL,NULL,'RAVINDRA',NULL,'RATHORE','1990-03-09','Male','9876541379',NULL,'abc@gmail.com','141,PACHUNKAR COLONY, DEWAS (M.P.)',1,20,486,'Mumbai',455001,'141,PACHUNKAR COLONY, DEWAS (M.P.)','283120079765','CBDPR7783K','MP41N20150000591','UnMarried',2,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8148,'1008148','EMP0008148',NULL,NULL,'KAMAL',NULL,'DIWAN','1987-12-04','Male','9876541396',NULL,'abc@gmail.com','GRAM JAMGOD RANI , DISST. DEWAS',1,20,486,'Mumbai',455001,'GRAM JAMGOD RANI , DISST. DEWAS','225528404861','CQRPD5542F',NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8149,'1008149','EMP0008149',NULL,NULL,'KISHANLAL','DEVISINGH','YADAV','1982-07-06','Male','9876541397',NULL,'abc@gmail.com','GRAM GARDI , JHABRIYA TEH. STAWAS , DISST. DEWAS',1,20,486,'Mumbai',455001,'40 KOUSHALYA PURI INDORE','556098941754',NULL,'MP41R2015-0075910','Married',NULL,2,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8150,'1008150','EMP0008150',NULL,NULL,'DHEERAJ',NULL,'PATEL','1986-08-29','Male','9876541398',NULL,'abc@gmail.com','291 LOHAR PIPLIYA DEWAS',1,20,486,'Mumbai',455001,'291 LOHAR PIPLIYA DEWAS','294455028348',NULL,'MP41R20140096065','UnMarried',3,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8151,'1008151','EMP0008151',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-03','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8152,'1008152','EMP0008152',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-23','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8153,'1008153','EMP0008153',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-04','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8154,'1008154','EMP0008154',NULL,NULL,'PRAKASH','GANGA BISHAN ','YADAV','1990-01-04','Male','9876541494',NULL,'abc@gmail.com','157  Sardar Patel Ward Near Bhagwati Nhome',1,20,486,'Mumbai',455001,'157  Sardar Patel Ward Near Bhagwati Nhome','0','ACSPY3548F','MP47R20100018867','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:29:52','2017-05-26 23:29:52',NULL,NULL,NULL,NULL),(8155,'1008155','EMP0008155',NULL,NULL,'PRAMOD','KUMAR','PATEL','1985-05-22','Male','9876541496',NULL,'abc@gmail.com','138  Ews Mukhargee Nagar',1,20,486,'Mumbai',455001,'138  Ews Mukhargee Nagar','821949393294','BRHPP5333E','MP41N20080091924','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8156,'1008156','EMP0008156',NULL,NULL,'SATISH','SATYANARAYAN','SHARMA','1981-12-12','Male','9876541507',NULL,'abc@gmail.com','Singavada  Dewas    Madhya Pradesh',1,20,486,'Mumbai',455001,'Singavada  Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8157,'1008157','EMP0008157',NULL,NULL,'SUNIL','OMPRAKASH','PATEL','1984-01-11','Male','9876541537',NULL,'abc@gmail.com','4  Chamunda Dham Anex Maxi Road',1,20,486,'Mumbai',455001,'4  Chamunda Dham Anex Maxi Road','223574369120',NULL,'MP41N20130054004','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8158,'1008158','EMP0008158',NULL,NULL,'MAKHAN','RAY SINGH','MALVIYA','1984-02-29','Male','9876541550',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8159,'1008159','EMP0008159',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-28','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8160,'1008160','EMP0008160',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-21','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8161,'1008161','EMP0008161',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-19','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8162,'1008162','EMP0008162',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-06','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8163,'1008163','EMP0008163',NULL,NULL,'RAMDAYAL','SINGH','CHANDEL','1982-09-11','Male','9876541576',NULL,'abc@gmail.com','117  Patha Surakhi Sagar',1,20,486,'Mumbai',455001,'OM SAI VIHAR COLONY DEWAS','882059418018','AURPC15385',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8164,'1008164','EMP0008164',NULL,NULL,'RAKESH','PANNA LAL','MALVIYA','1982-10-05','Male','9876541584',NULL,'abc@gmail.com','Updi TEH TARAN DIST DEWAS',1,20,486,'Mumbai',455001,'Updi TEH TARAN DIST DEWAS','433117182065',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8165,'1008165','EMP0008165',NULL,NULL,'JEEVAN','SINGH','NAYAK','1985-03-19','Male','9876541586',NULL,'abc@gmail.com','196 Arjun Nagar ITAWA DEWAS',1,20,486,'Mumbai',455001,'196 Arjun Nagar ITAWA DEWAS','979522241967','BCQPC1426H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8166,'1008166','EMP0008166',NULL,NULL,'PRADEEP','KUMAR','SINGH','1988-03-19','Male','9876541587',NULL,'abc@gmail.com','Bavdiya A.B.Road Dewas',1,20,486,'Mumbai',455001,'Bavdiya A.B.Road Dewas','0','FOYPS0460F',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8167,'1008167','EMP0008167',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-14','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:53','2017-05-26 23:29:53',NULL,NULL,NULL,NULL),(8168,'1008168','EMP0008168',NULL,NULL,'SACHIN','BHERULAL','PANCHAL','1985-01-12','Male','9876541590',NULL,'abc@gmail.com','352  Shiv Shakti Nagar Rani Bag Ujjain Road',1,20,486,'Mumbai',455001,'352  Shiv Shakti Nagar Rani Bag Ujjain Road','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8169,'1008169','EMP0008169',NULL,NULL,'ISHWAR','LAL','PRAJAPATI','1990-11-27','Male','9876541595',NULL,'abc@gmail.com','130  Gopal Nagar Itawa',1,20,486,'Mumbai',456001,'130  Gopal Nagar Itawa','518596346009',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8170,'1008170','EMP0008170',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-19','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8171,'1008171','EMP0008171',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-04-01','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8172,'1008172','EMP0008172',NULL,NULL,'SANTOSH','HARINARAYAN ','SHARMA','1988-03-11','Male','9876541606',NULL,'abc@gmail.com','Vill- Akaliya Psot- Agroad Dewas',1,20,486,'Mumbai',455001,'62 B JAISHRI NAGAR DEWAS','994669909689',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8173,'1008173','EMP0008173',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-28','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8174,'1008174','EMP0008174',NULL,NULL,'AMIT','ALOK','BHOWMICK','1984-09-15','Male','9876541610',NULL,'abc@gmail.com','10 Ramnagar Extension A.B. Road',1,20,486,'Mumbai',455001,'10 Ramnagar Extension A.B. Road','434914790802',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8175,'1008175','EMP0008175',NULL,NULL,'KAMLESH','BADEDEEN','YADAV','1989-09-06','Male','9876541618',NULL,'abc@gmail.com','162 CHAKAMAN DHATA GOPEEGANJ UP',1,20,486,'Mumbai',455001,'32 BAJRANG NAGAR DEWAS','293498871054','AJNPY4744M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8176,'1008176','EMP0008176',NULL,NULL,'JITENDRA','RAMCHANDAR','PRAJAPATI','1982-08-26','Male','9876541621',NULL,'abc@gmail.com','Wn. 07 Puspkanj Colony Itawa',1,20,486,'Mumbai',455001,'Wn. 07 Puspkanj Colony Itawa','966699386898','CYPPP3569Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8177,'1008177','EMP0008177',NULL,NULL,'DINESH','BHERULAL','SONI','1987-01-20','Male','9876541624',NULL,'abc@gmail.com','248  Navada Tonk Khurd',1,20,486,'Mumbai',455001,'248  Navada Tonk Khurd','359956942870',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8178,'1008178','EMP0008178',NULL,NULL,'MAHENDRA','MANOHARLAL ','YADAV','1982-08-04','Male','9876541625',NULL,'abc@gmail.com','158  Lala Lajpat Rai Marg',1,20,486,'Mumbai',455001,'158  Lala Lajpat Rai Marg','900226315181','ACTPY6582E','MP41N-2012-0063837','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8179,'1008179','EMP0008179',NULL,NULL,'OMPRAKASH','SAMANDHAR SINGH','CHOUDHRY','1988-01-06','Male','9876541626',NULL,'abc@gmail.com','536  Vill-Siya',1,20,486,'Mumbai',455001,'536  Vill-Siya','527189679928',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8180,'1008180','EMP0008180',NULL,NULL,'RAJA','SIDDIQUE','SHAH','1983-02-16','Male','9876541627',NULL,'abc@gmail.com','116  Vill Siyapura',1,20,486,'Mumbai',455001,'116  Vill Siyapura','708706322651',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:54','2017-05-26 23:29:54',NULL,NULL,NULL,NULL),(8181,'1008181','EMP0008181',NULL,NULL,'HARIKISHORE','SINGH','SENGAR','1988-12-08','Male','9876541630',NULL,'abc@gmail.com','5-Eco Center Nursury',1,20,486,'Mumbai',455001,'25 Chankya Puri Dewas','783869992818','NA','NA','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8182,'1008182','EMP0008182',NULL,NULL,'JITENDRA','BABULAL','MALVIYA','1986-06-26','Male','9876541637',NULL,'abc@gmail.com','Railway Station Binjana Dewas',1,20,486,'Mumbai',455001,'Railway Station Binjana Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8183,'1008183','EMP0008183',NULL,NULL,'ARIF',' ','SHAIKH','1987-08-08','Male','9876541640',NULL,'abc@gmail.com','Vill-Siya',1,20,486,'Mumbai',456001,'Vill-Siya','269981567401',NULL,'MP41R20120138619','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8184,'1008184','EMP0008184',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-27','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8185,'1008185','EMP0008185',NULL,NULL,'ANSAR',' ','KHAN','1987-07-23','Male','9876541649',NULL,'abc@gmail.com','Vill-Siya DIST DEWAS',1,20,486,'Mumbai',455001,'Vill-Siya DIST DEWAS','323040840154',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8186,'1008186','EMP0008186',NULL,NULL,'KISHAN','DWARKADAS','MAHAJAN','1987-02-21','Male','9876541651',NULL,'abc@gmail.com','89 VITHAL MANDIR PATH KHARGONE',1,20,486,'Mumbai',0,'VIKAS NAGAR DEWAS','488293630590',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8187,'1008187','EMP0008187',NULL,NULL,'KAMAL','RATANLAL ','DIWAN','1987-12-05','Male','9876541652',NULL,'abc@gmail.com','Jaamgoad Rani Dist-',1,20,486,'Mumbai',455001,'Jaamgoad Rani Dist-','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8188,'1008188','EMP0008188',NULL,NULL,'SANDEEP','JAGDISH','SINGH','1983-03-13','Male','9876541659',NULL,'abc@gmail.com','Vill-Post -Bhirakhand Sit -Bhind',1,20,486,'Mumbai',455001,'TARANI COLONY DEWAS','423355533662','DDJPS9893C',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8189,'1008189','EMP0008189',NULL,NULL,'MAHESH','RAMLAL G','CHOUHAN','1985-01-30','Male','9876541660',NULL,'abc@gmail.com','472  Amnedkar Nagar Siya',1,20,486,'Mumbai',455001,'472  Amnedkar Nagar Siya','691782241668',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8190,'1008190','EMP0008190',NULL,NULL,'MURARI','PRABHU','CHADAR','1988-04-04','Male','9876541661',NULL,'abc@gmail.com','117   Vill- Patha  Th- Sagar  Dist. Sagar',1,20,486,'Mumbai',455001,'117   Vill- Patha  Th- Sagar  Dist. Sagar','282922544787',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8191,'1008191','EMP0008191',NULL,NULL,'UMESH','BANESINGH','SOLANKI','1988-10-12','Male','9876541669',NULL,'abc@gmail.com','Vill- Fathepur Kheda Post Nadel Th- Tok Khurd',1,20,486,'Mumbai',455001,'Vill- Fathepur Kheda Post Nadel Th- Tok Khurd','607533224601',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8192,'1008192','EMP0008192',NULL,NULL,'BHUPENDRA','SUBHASH CHANDRA','CHOUHAN','1984-09-24','Male','9876541670',NULL,'abc@gmail.com','114 B-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'114 B-Kalani Bag Dewas','662341664812','ANYPC8573F','MP41N20060046958','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8193,'1008193','EMP0008193',NULL,NULL,'JAGDISH','RANCHODH LAL','SUNANIYA','1981-08-13','Male','9876541671',NULL,'abc@gmail.com','VILL BDA MALSA PURA POST SIYA TEH+DIST. DEWAS',1,20,486,'Mumbai',0,'ABCVILL BDA MALSA PURA POST SIYA TEH+DIST. DEWAS','808455361104',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:55','2017-05-26 23:29:55',NULL,NULL,NULL,NULL),(8194,'1008194','EMP0008194',NULL,NULL,'RAMAN','LT.GOPAL DAS ','SHARMA','1989-08-21','Male','9876541676',NULL,'abc@gmail.com','19  Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'19  Panchsheel Nagar Dewas','0','DIHPS1237R','MP-41N-2013-0169379','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8195,'1008195','EMP0008195',NULL,NULL,'RAJESH',' ','PANDIAN','1983-10-08','Male','9876541677',NULL,'abc@gmail.com','4C Sector Adarsh Nagar Bnp Road',1,20,486,'Mumbai',455001,'4C Sector Adarsh Nagar Bnp Road','834050163182',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8196,'1008196','EMP0008196',NULL,NULL,'RAKESH','BANESHING','CHOUHAN','1983-04-06','Male','9876541684',NULL,'abc@gmail.com','ADARSH NAGAR VILL SIYA DEWAS',1,20,486,'Mumbai',0,'ADARSH NAGAR VILL SIYA DEWAS','961477533277',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8197,'1008197','EMP0008197',NULL,NULL,'RAJENDRA','BADRILAL','KUMAWAT','1988-04-12','Male','9876541695',NULL,'abc@gmail.com','Ab Road Siya Th- Dewas',1,20,486,'Mumbai',455001,'Ab Road Siya Th- Dewas','226568376795',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8198,'1008198','EMP0008198',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-11','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8199,'1008199','EMP0008199',NULL,NULL,'HAIDER','GULAM MOHD','KHAN','1982-07-27','Male','9876541704',NULL,'abc@gmail.com','71  Bhosle Colony',1,20,486,'Mumbai',455001,'71  Bhosle Colony','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8200,'1008200','EMP0008200',NULL,NULL,'GOPAL','SINGH','PANWAR','1981-01-29','Male','9876541705',NULL,'abc@gmail.com','Bajar Chock Vill-Siya',1,20,486,'Mumbai',455001,'Bajar Chock Vill-Siya','628712791221','CEIPP2264K','MP41N20070016400','Married',5,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8201,'1008201','EMP0008201',NULL,NULL,'SHRIRAM','MADAN SINGH','SURYAWANSHI','1986-01-01','Male','9876541714',NULL,'abc@gmail.com','2 Mendhki Dhakad Post Patlawda  Dewas',1,20,486,'Mumbai',455001,'2 Mendhki Dhakad Post Patlawda  Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8202,'1008202','EMP0008202',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-05','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8203,'1008203','EMP0008203',NULL,NULL,'RAHUL','KAILASH CHANDRA','KULTHIYA','1990-03-25','Male','9876541728',NULL,'abc@gmail.com','Ganjpura Sonkatch  Dewas',1,20,486,'Mumbai',0,'Shankar Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8204,'1008204','EMP0008204',NULL,NULL,'PAPPU','MANSHING','BILALA','1981-08-30','Male','9876541732',NULL,'abc@gmail.com','Vill-Post Siya Dewas',1,20,486,'Mumbai',455001,'Vill-Post Siya Dewas','795367547645',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8205,'1008205','EMP0008205',NULL,NULL,'RIYAZ',' ','KHAN','1982-02-05','Male','9876541744',NULL,'abc@gmail.com','SUNDARSI DIST SHAHJAPUR',1,20,486,'Mumbai',465001,'SIYA PURA DEWAS','0',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:29:56','2017-05-26 23:29:56',NULL,NULL,NULL,NULL),(8206,'1008206','EMP0008206',NULL,NULL,'RAHUL','SITARAM','VAISHNAV','1990-09-01','Male','9876541750',NULL,'abc@gmail.com','Hn 440  Post-Siya Wn.12 Near To Ganesh Temple Ambedkar Nagar Siya Dewas',1,20,486,'Mumbai',455001,'Hn 440  Post-Siya Wn.12 Near To Ganesh Temple Ambedkar Nagar Siya Dewas','570678099355','AQMPV3451G',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8207,'1008207','EMP0008207',NULL,NULL,'HARSHAL','ANAND KUMAR','CHOUHAN','1989-07-04','Male','9876541751',NULL,'abc@gmail.com','233/B  Sadashiv Nagar  Moti Banglow',1,20,486,'Mumbai',455001,'233/B  Sadashiv Nagar  Moti Banglow','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8208,'1008208','EMP0008208',NULL,NULL,'MAHIPAL','M.S.','SENDALKAR','1990-04-02','Male','9876541757',NULL,'abc@gmail.com','280 Lig Vikash Nagar Dewas',1,20,486,'Mumbai',0,'280 Lig Vikash Nagar Dewas','430171959271','BJBPS4991K','MP41N201280228314','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8209,'1008209','EMP0008209',NULL,NULL,'BHARAT','KUMAR','PANCHAL','1984-04-17','Male','9876541758',NULL,'abc@gmail.com','C-11 Tulip Bulding Bhushan Gardn Savroli I Samba Phata Khopoli',1,20,486,'Mumbai',455001,'C-11 Tulip Bulding Bhushan Gardn Savroli I Samba Phata Khopoli','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8210,'1008210','EMP0008210',NULL,NULL,'RAHUL','SURESH','GOSWAMI','1986-07-20','Male','9876541761',NULL,'abc@gmail.com','Anjani Electrical Multanpura Biaora',1,20,486,'Mumbai',465674,'Anjani Electrical Multanpura Biaora','825841294923',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8211,'1008211','EMP0008211',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-26','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8212,'1008212','EMP0008212',NULL,NULL,'RAJKUMAR',' ','PARASNIYA','1983-08-13','Male','9876541768',NULL,'abc@gmail.com','VILL KANERIYA POST+ TEH TOKKHURDE ',1,20,486,'Mumbai',0,'VILL KANERIYA POST+ TEH TOKKHURDE ','492566510776',NULL,'MP41N20110024013','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8213,'1008213','EMP0008213',NULL,NULL,'PRAVEEN','LAXMINARAYAN','JHALA','1986-12-10','Male','9876541769',NULL,'abc@gmail.com','9  Vivekanan Colony  Moti Banglow',1,20,486,'Mumbai',455001,'9  Vivekanan Colony  Moti Banglow','351737723034','BAJPJ0108C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8214,'1008214','EMP0008214',NULL,NULL,'MITHILESH','MOTIRAM','PATEL','1989-06-10','Male','9876541771',NULL,'abc@gmail.com','KHANDWA',1,20,486,'Mumbai',0,'MRDUL VUHAR DEWAS','321470308698','BYNPP1376C',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:57','2017-05-26 23:29:57',NULL,NULL,NULL,NULL),(8215,'1008215','EMP0008215',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-17','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8216,'1008216','EMP0008216',NULL,NULL,'RAHUL','GANESH','DOBLE','1984-02-13','Male','9876541776',NULL,'abc@gmail.com','ABC',1,20,486,'Mumbai',456001,'ABC','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8217,'1008217','EMP0008217',NULL,NULL,'VIKRAM','BALARAM','RATHORE','1988-11-30','Male','9876541777',NULL,'abc@gmail.com','379  Alkapuri',1,20,486,'Mumbai',455001,'379  Alkapuri','556704272917','AJOPR3632C',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8218,'1008218','EMP0008218',NULL,NULL,'ANUJ','PUSPENDRA SINGH','SINGH','1988-07-17','Male','9876541778',NULL,'abc@gmail.com','21  Upadhyay Nagar',1,20,486,'Mumbai',455001,'21  Upadhyay Nagar','699362930023',NULL,NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8219,'1008219','EMP0008219',NULL,NULL,'ASHOK','HARINANDAN','SHAH','1981-10-01','Male','9876541806',NULL,'abc@gmail.com','BHAGIBATTI JHIL GOPALGANJ BIHAR ',1,20,504,'Pune',841428,'SIYA PURA DEWAS','423100709867',NULL,NULL,'Married',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8220,'1008220','EMP0008220',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-08','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8221,'1008221','EMP0008221',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-16','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8222,'1008222','EMP0008222',NULL,NULL,'NARENDRA','RAMESHWAR ','BIRLE','1983-02-26','Male','9876541866',NULL,'abc@gmail.com','VILL BHATYAN BUJURG TEH KASRWAD DIST KHARGONE',1,20,504,'Pune',0,'312 ALKAPURI DEWAS','561692105434','BKWPB3703N',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8223,'1008223','EMP0008223',NULL,NULL,'ANKIT','PAWAN','PATEL','1989-01-09','Male','9876541867',NULL,'abc@gmail.com','Vill-Attaheda Th.-Depalpur ',1,20,504,'Pune',0,'Vill.-Rajoda Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8224,'1008224','EMP0008224',NULL,NULL,'YOGESH','SINGH','PANWAR','1987-10-03','Male','9876541868',NULL,'abc@gmail.com','270  Mig Vijay Nagar',1,20,504,'Pune',455001,'270  Mig Vijay Nagar','699908596103','BTAPP1648F','MP41N20080108599','UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8225,'1008225','EMP0008225',NULL,NULL,'KISHAN','LAL','YADAV','1982-07-07','Male','9876541869',NULL,'abc@gmail.com','25-C  St No.15-A  Mayur Nagar Musha Khedi',1,20,504,'Pune',452001,'25-C  St No.15-A  Mayur Nagar Musha Khedi','556098941754',NULL,'MP41R2015-0075910','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8226,'1008226','EMP0008226',NULL,NULL,'RAMADHAR','SINGH','GURZAR','1981-10-24','Male','9876541870',NULL,'abc@gmail.com','Hn. 240  Street No. 18 Mayur Colony Musha Khedi',1,20,504,'Pune',452001,'Hn. 240  Street No. 18 Mayur Colony Musha Khedi','256236053520','BCLPG6716M','MP09R20150758209','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8227,'1008227','EMP0008227',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-12-30','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8228,'1008228','EMP0008228',NULL,NULL,'OMPAL','SINGH','RANA','1984-08-01','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8229,'1008229','EMP0008229',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-03','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:58','2017-05-26 23:29:58',NULL,NULL,NULL,NULL),(8230,'1008230','EMP0008230',NULL,NULL,'AMIT','KUMAR','SHARMA','1984-06-28','Male','9876541907',NULL,'abc@gmail.com','VILLAGE+POST+DADA-FATEHPURA, KHETRI JHUNJHUNU',1,20,504,'Pune',0,NULL,'0','BQZPS0616J',NULL,'Married',4,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8231,'1008231','EMP0008231',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-20','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8232,'1008232','EMP0008232',NULL,NULL,'NIKHIL','MADAN GOPAL','SHARMA','1982-01-24','Male','9876542025',NULL,'abc@gmail.com','58 WARD NO 11, SCHOOL AREA NILOKHERI KARNAL , HARIYANA',1,20,504,'Pune',0,'79, SHREE BALAJI NAGAR BALGARH DEWAS','212446145405',NULL,'HR05201100799963','UnMarried',3,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8233,'1008233','EMP0008233',NULL,NULL,'SANTOSH','KUMAR','PAL','1989-05-07','Male','9876542229',NULL,'abc@gmail.com','C/o Ganesh Pal House No. 42, Near to New Charch, Ward No 1 Sarani Betul M.P.',1,20,547,'sarani',460447,'MYH Staff nurse Hostal Indore','642028802671',NULL,'MP1100130505','Married',1,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8234,'1008234','EMP0008234',NULL,NULL,'SANTOSH','KUMAR','PAL','1989-05-08','Male','9876542230',NULL,'abc@gmail.com','C/o Ganesh Pal House No. 42, Near to New Charch, Ward No 1 Sarani Betul M.P.',1,20,547,'sarani',460447,'MYH Staff nurse Hostal Indore','642028802671','BJHPP3708B','MP1100130505','Married',NULL,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8235,'1008235','EMP0008235',NULL,NULL,'ABHISHEK','SANJAY','PALIWAL','1981-08-25','Male','9876542247',NULL,'abc@gmail.com','Sagar Vill- Dupad Raod Shajapur',1,20,1032,'Shajapur',465001,'Sagar Vill- Dupad Raod Shajapur','0','BWHPP6381F','MP42N20130139795','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8236,'1008236','EMP0008236',NULL,NULL,'MEHARBAN','JASMANT SINGH','CHOUHAN','1990-09-17','Male','9876542249',NULL,'abc@gmail.com','Vill-Nipaniya Post-Amlai Shujalpur',1,20,1032,'Shajapur',0,'Nimad Nagar Dewas ','581032859291',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8237,'1008237','EMP0008237',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-31','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8238,'1008238','EMP0008238',NULL,NULL,'RAMBABU','SATYANARAYAN','PATIDAR','1982-02-06','Male','9876542254',NULL,'abc@gmail.com','74/1  Dashara Maidan Wn. 03 Vll- Siya Sajapur',1,20,1032,'Shajapur',0,'VILL SIYA OIST SIYA TEH + DIST DEWAS','0',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8239,'1008239','EMP0008239',NULL,NULL,'HARISH','MOHAN SINGH ','PARMAR','1982-09-04','Male','9876542259',NULL,'abc@gmail.com','363 Guapura Wala Kalapipal  Village 56  Kalapipal Th- Kalapipal Dist- Shajapur M.P.',1,20,1032,'Shajapur',0,'363 Guapura Wala Kalapipal  Village 56  Kalapipal Th- Kalapipal Dist- Shajapur M.P.','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8240,'1008240','EMP0008240',NULL,NULL,'RAMPREET','PRASHAD','KUMHAR','1981-04-25','Male','9876542275',NULL,'abc@gmail.com','VILL+POST NIKHATI KALA RAGHUNATHPUR SIWAN',1,20,95,'SIWAN',455001,'162/4  Bavdiya A.B.Road','327827052078','BVVPP4184R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8241,'1008241','EMP0008241',NULL,NULL,'HIRALAL','MOTILAL','PRAJAPATI','1983-12-03','Male','9876542329',NULL,'abc@gmail.com','Vill-Updi Post Khajuriya  Th- Tarana',1,20,593,'Ujjain',456001,'Vill-Updi Post Khajuriya  Th- Tarana','334329547341',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8242,'1008242','EMP0008242',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-05','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:29:59','2017-05-26 23:29:59',NULL,NULL,NULL,NULL),(8243,'1008243','EMP0008243',NULL,NULL,'JAGDISH','PARBHAT SINGH','MALVIYA','1986-12-27','Male','9876542335',NULL,'abc@gmail.com','Near Murlidhar Kripa Hospital   Ujjain Road Maksi',1,20,593,'Ujjain',0,'Near Murlidhar Kripa Hospital   Ujjain Road Maksi','937074724182',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8244,'1008244','EMP0008244',NULL,NULL,'BANSHI','LAL','PANCHAL','1990-01-12','Male','9876542336',NULL,'abc@gmail.com','Vill-Updi Po- Khajuriya Tarana',1,20,593,'Ujjain',455001,'Vill-Updi Po- Khajuriya Tarana','578566122327','CNOPB5777Q','NOT AVAILABLE','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8245,'1008245','EMP0008245',NULL,NULL,'GHANSHYAM','LAXMINARAYAN','CHOUHAN','1982-08-18','Male','9876542340',NULL,'abc@gmail.com','Vill-Fhatehabad Chandrawatiganj Dist-Ujjain  Ujjain    Madhya Pradesh',1,20,593,'Ujjain',0,'Vill-Fhatehabad Chandrawatiganj   Dist-Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8246,'1008246','EMP0008246',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-10','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8247,'1008247','EMP0008247',NULL,NULL,'SONU',' ','RATHORE','1982-01-08','Male','9876542344',NULL,'abc@gmail.com','Gram Tobri Khedi Post Chidawad Teh Tarana Ujjain',1,20,593,'Ujjain',456001,'Gram Tobri Khedi Post Chidawad Teh Tarana Ujjain','269889093232',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8248,'1008248','EMP0008248',NULL,NULL,'JITENDRA','JAGDISH CHANDRA','PRAJAPATI','1987-11-04','Male','9876542346',NULL,'abc@gmail.com','Vill- Upadi Rao Psot Khajuriya Th- Taran Dist Ujjain',1,20,593,'Ujjain',455006,'Vill- Upadi Rao Psot Khajuriya Th- Taran Dist Ujjain','281944461321','CXAPP6896E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8249,'1008249','EMP0008249',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-07','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8250,'1008250','EMP0008250',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-17','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8251,'1008251','EMP0008251',NULL,NULL,'BHAUMIK','BIPINCHANDRA','TRIVEDI','1989-12-19','Male','9876542287',NULL,'abc@gmail.com','G-2/4, FLAT NO-701, GREEN CITY, NR. GALAXY CIRCLE, PAL BHATA ROAD',1,NULL,1033,'Surat',395009,NULL,'8019','AGRPT8488Q','GJ05-20060051565','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8252,'1008252','EMP0008252',NULL,NULL,'BHAVIK','RAMESHCHANDRA','PANWALA','1981-12-23','Male','9876542289',NULL,'abc@gmail.com','39,SHANTIVAN SOC, OPP.GAIL TOWER, ANAND MAHEL ROAD, PALANPUR PATIA',1,NULL,1033,'Surat',395009,NULL,'8034','AQBPP0144P','069420/02/GJ05','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8253,'1008253','EMP0008253',NULL,NULL,'KAJAL ','GHANSHYAMABHAI','DHANANI','1987-09-01','Female','9876542293',NULL,'abc@gmail.com','102,RACHNA SOC, KAPODRA,VARACHHA ROAD,',1,NULL,1033,'Surat',395006,NULL,'0','AUYPD1168N',NULL,'Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8254,'1008254','EMP0008254',NULL,NULL,'SHIVANI','HERMESHSINGH','RANA','1984-01-28','Female','9876542298',NULL,'abc@gmail.com','FLAT NI-1101, BUILDING NO-15, S-F/4, GREEN CITY, ADAJAN',1,NULL,1033,'Surat',395009,'FLAT NI-1101, BUILDING NO-15, S-F/4, GREEN CITY, ADAJAN','0','ATDPR1621E',NULL,'Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,7,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8255,'1008255','EMP0008255',NULL,NULL,'SANJAY','NARENDRABHAI','PATEL','1982-11-16','Male','9876541263',NULL,'abc@gmail.com','BRAHMAN FALIYU, ADADRA,ONGC COLONY ,ANKLESHWAR,',1,NULL,135,'Ahmedabad',393010,'124, JALARAM NAGAR SOCIETY, NR. INDIAN PETROL PUMP, JAHANGIR PURA, SURAT.','5113','AUVPP4493K','GJ16-19970055318','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:00','2017-05-26 23:30:00',NULL,NULL,NULL,NULL),(8256,'1008256','EMP0008256',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-08','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8257,'1008257','EMP0008257',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-30','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8258,'1008258','EMP0008258',NULL,NULL,'MURLIDHARAN',NULL,'RAMAKRISHNAN','1985-04-20','Male','9876541794',NULL,'abc@gmail.com','KOTTAPPURATHU PUTHENPURA, RANDAR P.O, MUVATTUPUZHA, ',1,NULL,504,'Pune',686673,'BLDG NO 1, FLAT NO. 303, GREEN CITY, BHATHA, ','913023486824','APKPM 2065G','17/4302/2007','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8259,'1008259','EMP0008259',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-17','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8260,'1008260','EMP0008260',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-12','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8261,'1008261','EMP0008261',NULL,NULL,'HARSHIL ','RANCHODBHAI','GALANI','1981-10-12','Male','9876541899',NULL,'abc@gmail.com','KHAN KOTDA,KALAVAD, KHANKOTDA, JAMNAGAR',1,NULL,504,'Pune',361013,NULL,'4677',NULL,'GJ10-20150006367',NULL,1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8262,'1008262','EMP0008262',NULL,NULL,'SANKET','MANSUKHBHAI','DOMADIYA','1988-11-06','Male','9876541908',NULL,'abc@gmail.com','MURLIDHAR, DAYANAND PURV, UNA',1,NULL,504,'Pune',362560,'136-137, RAM NAGAR SOCIETY, NR. MINI BAZAR CHAR RASTA, SURAT.','7966','AZKPD7903J','GJ11-20110015259',NULL,5,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8263,'1008263','EMP0008263',NULL,NULL,'NITHISH MOHAN','K.N.MOHAN',NULL,'1988-10-29','Male','9876541918',NULL,'abc@gmail.com','ERATTAPADATH PUTHANPURACKAL,PATTIMATTAOM P.O, CHENGARA',1,NULL,504,'Pune',683562,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0',NULL,NULL,'Unmarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8264,'1008264','EMP0008264',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-07','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8265,'1008265','EMP0008265',NULL,NULL,'BINDIYA','ANILBHAI','BAVARAVA','1982-10-07','Female','9876542011',NULL,'abc@gmail.com','1357-SUNDRAM BUNGLOW, RADHESHYAM SOC, JAMALPORE',1,NULL,504,'Pune',396445,NULL,'8688',NULL,NULL,'Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8266,'1008266','EMP0008266',NULL,NULL,'SURESHBHAI','SUKHABHAI','PATEL','1986-03-30','Male','9876542012',NULL,'abc@gmail.com','14/2, KOLA FALIYA,JALALPORE, KANERA,JALALPORE',1,NULL,504,'Pune',396460,NULL,'7922','AUSPP1534A',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8267,'1008267','EMP0008267',NULL,NULL,'PRAKASH','MANUBHAI','PANDYA','1986-04-07','Male','9876542272',NULL,'abc@gmail.com','76,NICHLI GALI, PHULERA,SIROHI',1,NULL,720,'Sirohi',307022,'402, NAG-MANI APPT, GANESH NAGAR, SATYA-NARAYAN FURNITURE KI GALLY, PARVAT PATIYA, SURAT.','4201','AGDPP5339G','GJ07-20110001427','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8268,'1008268','EMP0008268',NULL,NULL,'DHARMESH','DAHYABHAI','PATEL','1989-03-30','Male','9876542280',NULL,'abc@gmail.com','A-87, SHRI NATH SOCIETY, ADAJAN GAM',1,NULL,1033,'Surat',395009,NULL,'749275478329','ALOPP482F','GJ05-200003','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8269,'1008269','EMP0008269',NULL,NULL,'MUKESHKUMAR','MOHANBHAI','MOVALIYA','1986-09-06','Male','9876542281',NULL,'abc@gmail.com','A-201,RAJHANS WINGS-1, CANAL ROAD, NEAR NEW L.P SAVANI ROAD, PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3101','AOCPM8998M',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:01','2017-05-26 23:30:01',NULL,NULL,NULL,NULL),(8270,'1008270','EMP0008270',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-09','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8271,'1008271','EMP0008271',NULL,NULL,'DIVYANG ','RAMESHCHANDRA','SHAH','1983-09-06','Male','9876542283',NULL,'abc@gmail.com','B-7, SAHYOH APT, SNEH SANKUL WADI, ANAND MAHEL ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9250','ANDPS7889M',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8272,'1008272','EMP0008272',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-19','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8273,'1008273','EMP0008273',NULL,NULL,'HARDIK','VAIKUNTHKUMAR','VAIDYA','1987-05-12','Male','9876542285',NULL,'abc@gmail.com','PLOT NO-316, RAJESHRI, BRAHMIN FALIYU,FULPADA GRAM PANCHAYAT',1,NULL,1033,'Surat',395008,NULL,'0',NULL,'GJ05-20040078868','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8274,'1008274','EMP0008274',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-12-31','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8275,'1008275','EMP0008275',NULL,NULL,'JENISH','NALINBHAI','TAILOR','1982-05-24','Male','9876542288',NULL,'abc@gmail.com','KOSAMBA,KAMREJ',1,NULL,1033,'Surat',395006,NULL,'6850','AOCPT8697J','GJ05-20130039229','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8276,'1008276','EMP0008276',NULL,NULL,'MEENAKSHI','ANILKUMAR','DARDA','1989-04-07','Female','9876542290',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'0','BFDPD8559L','GJ05-20120030760','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8277,'1008277','EMP0008277',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-11','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8278,'1008278','EMP0008278',NULL,NULL,'MITALI','SURESHBHAI','KATIRA','1983-01-03','Female','9876542292',NULL,'abc@gmail.com','C-103,RAJHANS WINGS,NR NEW L.P SAVANI SCHOOL,ADAJAN',1,NULL,1033,'Surat',395009,NULL,'0','DJAPK1815B','GJ05-20080143657','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8279,'1008279','EMP0008279',NULL,NULL,'SHAMIM','MOHSIN','POTHIYAWALA','1982-06-25','Female','9876542294',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8087','CBJPP8031L','GJ05-20060018928','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8280,'1008280','EMP0008280',NULL,NULL,'KANAIYA','DINESHBHAI','PATEL','1986-11-25','Male','9876542295',NULL,'abc@gmail.com','B NO-7,R-3HIMGIRI APT,PALANPURPATIA,RANDER ROAD',1,NULL,1033,'Surat',395005,NULL,'0','AZQPP2189J','GJ05-20130041691','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8281,'1008281','EMP0008281',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-25','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8282,'1008282','EMP0008282',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-24','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8283,'1008283','EMP0008283',NULL,NULL,'SHREYAS','SHAILESHKUMAR','VADI','1983-11-09','Male','9876542299',NULL,'abc@gmail.com','7/14222-DHASTIPURA VARIYAVI BAZAR,',1,NULL,1033,'Surat',395003,NULL,'9485','AWZPV3757C','GJ05-20140013388','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:02','2017-05-26 23:30:02',NULL,NULL,NULL,NULL),(8284,'1008284','EMP0008284',NULL,NULL,'ADITYA','HITESHBHAI','DESAI','1982-09-13','Male','9876542300',NULL,'abc@gmail.com','23,NAVYUG SOCIETY, B/H NAVYUG COLLEGE, RANDER ROAD',1,NULL,1033,'Surat',395009,NULL,'0','BTHPD3337C',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,54,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8285,'1008285','EMP0008285',NULL,NULL,'JAY','RAMESHBHAI','PATEL','1990-04-10','Male','9876542301',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100285674','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8286,'1008286','EMP0008286',NULL,NULL,'RANNA','PRAMODBHAI','PUROHIT','1986-04-15','Female','9876542302',NULL,'abc@gmail.com','MIG-B 1301, BUILDING NAME-TAPI, VIR NARMAD NAGAR,AMROLI KOSAD, ROAD, AMROLI',1,NULL,1033,'Surat',394107,NULL,'7064','BRVPP7359E','GJ05-20100011004','Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8287,'1008287','EMP0008287',NULL,NULL,'BHAVIKA','AMRUTBHAI','UMRIGAR','1987-10-11','Female','9876542303',NULL,'abc@gmail.com','302,KESHAVJYOT APT, DOCTOR FALIYU,UMRAGAM,',1,NULL,1033,'Surat',395007,NULL,'7206','AEBPU4127M','GJ05-20120027613','Unmarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8288,'1008288','EMP0008288',NULL,NULL,'ARCHANA','JITENDRABHAI','SAPARIYA','1981-03-10','Female','9876542304',NULL,'abc@gmail.com','324,KRISHNA KUNJ SOC,PALANPUR PATIA,RANDER ROAD',1,NULL,1033,'Surat',395009,NULL,'0','GLAPS5292H','GJ05-20100026258','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8289,'1008289','EMP0008289',NULL,NULL,'KRUNAL ','HARISHKUMAR','SADRANI','1986-08-13','Male','9876542305',NULL,'abc@gmail.com','202,SWAGAT APT, SAHNIP PARK, ANAND MAHEL ROAD',1,NULL,1033,'Surat',395009,NULL,'4551','EXNPS 9099R','GJ05-20110049973','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8290,'1008290','EMP0008290',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-28','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8291,'1008291','EMP0008291',NULL,NULL,'BHAVIN','NATVARLAL','KANTHARIYA','1983-11-25','Male','9876542307',NULL,'abc@gmail.com','A-31,NAGINA WADI SOC,S.D ROAD,',1,NULL,1033,'Surat',395004,NULL,'8657','AZOPK5620K','GJ05-20100094348','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8292,'1008292','EMP0008292',NULL,NULL,'SIMRANJEET KAUR','SHIVKUMAR','DHARIWAL','1981-05-29','Female','9876542308',NULL,'abc@gmail.com','26/104,SUDA AWAS, OPP RELIANCE MARKET, VESU',1,NULL,1033,'Surat',395007,NULL,'0','BXQPD3105H',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8293,'1008293','EMP0008293',NULL,NULL,'RISHI','TULSHIBHAI','GUMASANA','1983-07-12','Male','9876542309',NULL,'abc@gmail.com','302,DHANLAXMI APT, 29/A SAMARPAN SOC, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20130003499','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8294,'1008294','EMP0008294',NULL,NULL,'VAIBHAVI','MAYUR','JHAVERI','1982-05-16','Female','9876542310',NULL,'abc@gmail.com','2ND FLOOR, TOWER-D, FLAT NO-203,INDRAPRASTH, CITYLIGHT ROAD',1,NULL,1033,'Surat',395007,NULL,'9675','AXXPJ2132J','GJ05-20110026634','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8295,'1008295','EMP0008295',NULL,NULL,'PRATIK','DHARMENDRA','PAREKH','1981-09-26','Male','9876542311',NULL,'abc@gmail.com','FLAT NO-E/202, VASUPUJYA RESIDENCY,OPP RAJ CORNER, B/H LP SAVANI SCHOOL',1,NULL,1033,'Surat',395009,NULL,'0','BGNPP3298M','GJ05-20080083242','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8296,'1008296','EMP0008296',NULL,NULL,'KRUSHNA','GHANSHYAMABHAI','DHANANI','1982-10-15','Male','9876542312',NULL,'abc@gmail.com','102,RACHNA SOC, KAPODRA,VARACHHA ROAD,',1,NULL,1033,'Surat',395006,NULL,'3172','AWEPD6378E','GJ05-20100018338','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:30:03','2017-05-26 23:30:03',NULL,NULL,NULL,NULL),(8297,'1008297','EMP0008297',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-22','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8298,'1008298','EMP0008298',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-06','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8299,'1008299','EMP0008299',NULL,NULL,'NILESH ','KHIMAJIBHAI','KAKADIYA','1986-06-02','Male','9876542315',NULL,'abc@gmail.com','E/2,501, KRISHNA PARK SOC, NR SUDAMA CHOWK, MOTA VARACHA,',1,NULL,1033,'Surat',394101,NULL,'8700','DZOPK5758M','GJ-0420160005632','Unmarried',2,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8300,'1008300','EMP0008300',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-20','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8301,'1008301','EMP0008301',NULL,NULL,'DEBALOY','DEBI PRASAD','MITRA','1985-05-30','Male','9876542317',NULL,'abc@gmail.com','A-402, GEETANJALI BUILDING,PLOT-162,SECTOR-2, ULWE, NAVI MUMBAI',1,NULL,1033,'Surat',400707,NULL,'4769','APWPM1478F','MH46-20140014703','Married',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8302,'1008302','EMP0008302',NULL,NULL,'PRASANNA ','RAMESH','GARGAVA','1981-05-21','Male','9876542357',NULL,'abc@gmail.com','1,2- ALIITE RESIDENCY, NUTAN BHARAT SOCIETY, ALKAPURI',1,NULL,228,'Vadodra',390007,NULL,'0',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8303,'1008303','EMP0008303',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1987-01-01','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8304,'1008304','EMP0008304',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1987-01-02','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8305,'1008305','EMP0008305',NULL,NULL,'RUTU',NULL,'MOVALIYA','1987-01-03','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8306,'1008306','EMP0008306',NULL,NULL,'PURVANGKUMAR','MANUBHAI','PATEL','1984-10-26','Male','9876542373',NULL,'abc@gmail.com','GANSHYAM VIHAR SOCIETY, GANDEVI ROAD, NEAR CNG STATION, BEHIND PRIMARY ROAD, JAMALPORE',1,NULL,214,NULL,396445,NULL,'634298657725','AIQPP0033J','77722/99/VL','Married',NULL,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8307,'1008307','EMP0008307',NULL,NULL,'VICKY','NITINBHAI','SORATHIYA','1987-12-22','Male','9876542374',NULL,'abc@gmail.com','OM, MAHADEV VADI-4 ,GONDAL',1,NULL,218,NULL,360311,NULL,'206020233087','GOAPS8490Q',NULL,'UnMarried',4,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8308,'1008308','EMP0008308',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-15','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8309,'1008309','EMP0008309',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-29','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 23:30:04','2017-05-26 23:30:04',NULL,NULL,NULL,NULL),(8310,'1008310','EMP0008310',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-16','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8311,'1008311','EMP0008311',NULL,NULL,'PRASAD','RAVINDRA','ANAOKAR','1986-08-06','Male','9876541231',NULL,'abc@gmail.com','D1 203,GRAND SQUARE CHS G B ROAD THANE (MH)',1,20,486,'Mumbai',0,'41,PAGNISPAGA INDORE','832068489341',NULL,NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8312,'1008312','EMP0008312',NULL,NULL,'SURESH','SUHAGMAL','MAHESHWARI','1986-11-17','Male','9876541232',NULL,'abc@gmail.com','H.NO.515,SUN CITY 2 DEWAS',1,20,486,'Mumbai',0,'H.NO.515,SUN CITY 2 DEWAS','454999652891','CFUPM7459E',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8313,'1008313','EMP0008313',NULL,NULL,'RAMCHARAN','PUNAJI','CHOUDHARY','1983-02-17','Male','9876541233',NULL,'abc@gmail.com','7,LIG II JAIPRAKASH NAGAR DEWAS',1,20,486,'Mumbai',0,'7,LIG II JAIPRAKASH NAGAR DEWAS','233374686426',NULL,NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8314,'1008314','EMP0008314',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-24','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8315,'1008315','EMP0008315',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-30','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8316,'1008316','EMP0008316',NULL,NULL,'RUPESH ','PANDHARI','YADAV','1983-04-30','Male','9876541238',NULL,'abc@gmail.com','VILL,POST SEGWAL,TEH-THIKARI',1,20,486,'Mumbai',0,'VILL,POST SEGWAL,TEH-THIKARI','403360573269',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8317,'1008317','EMP0008317',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-07-04','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8318,'1008318','EMP0008318',NULL,NULL,'RUPESH','PANDHARI NATH','YADAV','1983-05-01','Male','9876541240',NULL,'abc@gmail.com','VII,POST SENGWAL,TEH-THIKARI DIST. BARWANI',1,20,486,'Mumbai',0,'VII,POST SENGWAL,TEH-THIKARI DIST. BARWANI','403360573269',NULL,NULL,'UnMarried',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8319,'1008319','EMP0008319',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-17','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8320,'1008320','EMP0008320',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1987-01-04','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8321,'1008321','EMP0008321',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-06-02','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8322,'1008322','EMP0008322',NULL,NULL,'CHETAN ','PANDIT KESHAV','PATIL','1985-03-04','Male','9876541244',NULL,'abc@gmail.com','BHUDHAJI BHAU NAGAR  KHETIA',1,20,486,'Mumbai',0,'BHUDHAJI BHAU NAGAR  KHETIA','736308036523',NULL,NULL,'UnMarried',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:05','2017-05-26 23:30:05',NULL,NULL,NULL,NULL),(8323,'1008323','EMP0008323',NULL,NULL,'ATUL','KUMAR','SINGH','1987-01-05','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8324,'1008324','EMP0008324',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1987-01-06','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8325,'1008325','EMP0008325',NULL,NULL,'JITENDRA ',NULL,'JAISWAL','1981-09-10','Male','9876541247',NULL,'abc@gmail.com','ARJUN NAGAR ITAWA',1,20,486,'Mumbai',0,NULL,'772076273684',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8326,'1008326','EMP0008326',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1987-01-07','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8327,'1008327','EMP0008327',NULL,NULL,'sunil',NULL,'malviy','1987-01-08','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8328,'1008328','EMP0008328',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1987-01-09',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8329,'1008329','EMP0008329',NULL,NULL,'KAMLESH',NULL,'TIWARI','1987-01-10','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8330,'1008330','EMP0008330',NULL,NULL,'ramlal',NULL,'jaiswal','1987-01-11','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8331,'1008331','EMP0008331',NULL,NULL,'RAHUL',NULL,'MALVIY','1983-05-18','Male','9876541253',NULL,'abc@gmail.com','HARIJAN MHOLLA GLI NO 02 DEWAS',1,20,486,'Mumbai',0,NULL,'740935283807',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8332,'1008332','EMP0008332',NULL,NULL,'Vishnu ',NULL,'Patidar','1987-01-12','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8333,'1008333','EMP0008333',NULL,NULL,'NEERAJ ',NULL,'MALVIY','1984-03-25','Male','9876541255',NULL,'abc@gmail.com','145 MANDKI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'438169678933',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8334,'1008334','EMP0008334',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1987-01-13','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8335,'1008335','EMP0008335',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1987-01-14','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:06','2017-05-26 23:30:06',NULL,NULL,NULL,NULL),(8336,'1008336','EMP0008336',NULL,NULL,'GAURIJ ',NULL,'TARE','1987-01-15','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8337,'1008337','EMP0008337',NULL,NULL,'MADANLAL','MANGILAL','MALVIYA','1982-11-06','Male','9876541259',NULL,'abc@gmail.com','Vill-Ramgardh Post-Salam Khedi Dist-Dewas',1,20,486,'Mumbai',455001,'Vill-Ramgardh Post-Salam Khedi Dist-Dewas','538519962736',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8338,'1008338','EMP0008338',NULL,NULL,'NILESH KUMAR','MANNULAL','SONI','1985-05-07','Male','9876541264',NULL,'abc@gmail.com','A 302, ANURANG RECIDANCE, NEAR IOC PETROL PUMP, AHMEDABAD',1,20,486,'Mumbai',455001,'kALANI BAUG ,DEWAS','676709014966','ARPPS8457H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8339,'1008339','EMP0008339',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-14','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8340,'1008340','EMP0008340',NULL,NULL,'VINAY','MAHAVIR','KAUSHIK','1987-08-25','Male','9876541289',NULL,'abc@gmail.com','HISAR',1,20,486,'Mumbai',125042,'DEWAS','496710367597','CUXPK3649G',NULL,'UnMarried',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8341,'1008341','EMP0008341',NULL,NULL,'NIKHLESH','H.L.','UDAYPURE','1990-01-21','Male','9876541292',NULL,'abc@gmail.com','Ward No.32 Moti Nagar Balaghat ',1,20,486,'Mumbai',0,'Ward No.32 Moti Nagar Balaghat Dewas ','642811451893','ACUPU9424A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8342,'1008342','EMP0008342',NULL,NULL,'APURVA','HARSHADROY L','BHATT','1985-04-05','Male','9876541295',NULL,'abc@gmail.com','A/18  Ambicaanagr Society Harni Warisiya Ring Road',1,20,486,'Mumbai',455001,'A/18  Ambicaanagr Society Harni Warisiya Ring Road','0',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8343,'1008343','EMP0008343',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-12','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8344,'1008344','EMP0008344',NULL,NULL,'PAWAN ','GULAB RAO','KUMAR','1987-06-22','Male','9876541307',NULL,'abc@gmail.com','MUKAM POST BASNER KALA',1,20,486,'Mumbai',0,'226 B RANI BAAG DEWAS M.P','305512275998','BSEPD2400E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8345,'1008345','EMP0008345',NULL,NULL,'SUBHODH','SAHIB RAO','DHOTE','1983-12-12','Male','9876541308',NULL,'abc@gmail.com','Vill-Dalora Multai Betul',1,20,486,'Mumbai',0,'41 Ews- Vikas Nagar Dewas','781855237750',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:07','2017-05-26 23:30:07',NULL,NULL,NULL,NULL),(8346,'1008346','EMP0008346',NULL,NULL,'SURESH','RAGHUNATH','WAGADRE','1984-02-22','Male','9876541309',NULL,'abc@gmail.com','Vill+Post-Dhaman Ganv',1,20,486,'Mumbai',0,'72 Nutan Nagar Dewas','711610486337','FNGPS6503A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8347,'1008347','EMP0008347',NULL,NULL,'GYAN RAO','KACHARU',' ','1985-11-23','Male','9876541310',NULL,'abc@gmail.com','30 Valani Th-Multai Dist-Betul',1,20,486,'Mumbai',0,'87-B NIMAD NAGAR ITAWA DEWAS ','777617125812',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8348,'1008348','EMP0008348',NULL,NULL,'RAJESH','RAMRAJ','YADAV','1988-05-22','Male','9876541311',NULL,'abc@gmail.com','VILL-BHORI,THANA-SURIYAVA',1,20,486,'Mumbai',0,'33,NEW BAJRAG NAGAR KELA DEVI DEWAS','758358256873','AEYP6858E',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8349,'1008349','EMP0008349',NULL,NULL,'RAVI','SHANKAR','PANDEY','1982-01-22','Male','9876541312',NULL,'abc@gmail.com','B/79  Manglam Houshing Society    Nandelver Road',1,20,486,'Mumbai',455001,'B/79  Manglam Houshing Society    Nandelver Road','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8350,'1008350','EMP0008350',NULL,NULL,'KAILASH','CHANDRA','RAGHUWANSHI','1990-12-07','Male','9876541314',NULL,'abc@gmail.com','H.S.200 Naya Basera Bhopal',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','575465668546',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8351,'1008351','EMP0008351',NULL,NULL,'SURENDRA','SINGH','SOLANKI','1988-09-12','Male','9876541315',NULL,'abc@gmail.com','Vill.-Singhod Post.-Najirabad',1,20,486,'Mumbai',0,'Mukharji Nagar Dewas','266708092799','ENEPS5302E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8352,'1008352','EMP0008352',NULL,NULL,'GOURAV','SINGH','CHANDRAVANSHI','1986-07-05','Male','9876541316',NULL,'abc@gmail.com','B-70,NEW ASHOK GARDEN, BHOPAL',1,20,486,'Mumbai',0,'B-70,NEW ASHOK GARDEN, BHOPAL','960271139829',NULL,NULL,'UnMarried',1,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8353,'1008353','EMP0008353',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-19','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8354,'1008354','EMP0008354',NULL,NULL,'LAKHANLAL','PYARELAL','VISHWAKARMA','1983-03-23','Male','9876541334',NULL,'abc@gmail.com','Vill.-Bilhari Post.-Nowgong',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','542006506728',NULL,NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8355,'1008355','EMP0008355',NULL,NULL,'DIWAKAR','BHAGWATDEEN','BINDUA','1985-08-19','Male','9876541335',NULL,'abc@gmail.com','Naya Panna Naka Kamla Colony Chhatarpur',1,20,486,'Mumbai',0,'C-163 Sonagiri Bhopal','752243825811',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8356,'1008356','EMP0008356',NULL,NULL,'PRAVEEN','PRASANNA KUMAR','NAIR','1988-08-03','Male','9876541350',NULL,'abc@gmail.com','100,BAJRANG NAGAR DEWAS',1,20,486,'Mumbai',455001,'1/8 Gayatri Nagar Shajapur','393080338468','BNAPK5234Q','MP42R-2010-067204','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8357,'1008357','EMP0008357',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-12','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8358,'1008358','EMP0008358',NULL,NULL,'SAJAN ','SHANKER','MALVIYA','1981-04-10','Female','9876541358',NULL,'abc@gmail.com','PRAHLAD NAGAR BAWADIYA DEWAS M.P.',1,20,486,'Mumbai',0,'284 BAWADIYA DEWAS M.P.','291316366838',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:08','2017-05-26 23:30:08',NULL,NULL,NULL,NULL),(8359,'1008359','EMP0008359',NULL,NULL,'LEELA','DEVISINGH','BANJARA','1981-05-27','Female','9876541359',NULL,'abc@gmail.com','56, PATEL NAGAR NAIBASTI WARD 16 DEWAS M.P',1,20,486,'Mumbai',0,'BANJARA COLONY GANDHI CHOUK BAVADIYA DEWAS M.P','596595411389',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8360,'1008360','EMP0008360',NULL,NULL,'YOGENDRA ','LALSHAHEB','SINGH','1988-05-23','Male','9876541360',NULL,'abc@gmail.com','VELLAGE MANIPUR POST BARSATHI JONPUR',1,20,486,'Mumbai',0,'VELLAGE MANIPUR POST BARSATHI JONPUR','703312080227',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8361,'1008361','EMP0008361',NULL,NULL,'SONAL','MANOHARSINGH','RAJPUT','1986-01-10','Female','9876541362',NULL,'abc@gmail.com','208,RAJARAM NAGAR,DEWAS',1,20,486,'Mumbai',455001,'208,RAJARAM NAGAR,DEWAS','831357506812',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8362,'1008362','EMP0008362',NULL,NULL,'GORAKHNATH',NULL,'YOGI','1981-12-16','Male','9876541363',NULL,'abc@gmail.com','JAYSINGH NAGAR,INDUSTRIAL AREA, DEWAS',1,20,486,'Mumbai',455001,'JAYSINGH NAGAR,INDUSTRIAL AREA, DEWAS','562190006743',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8363,'1008363','EMP0008363',NULL,NULL,'GOURAV','UDAYSINGH','PACHUNKAR','1986-12-11','Male','9876541364',NULL,'abc@gmail.com','25,PACHUNKAR COLONY DEWAS',1,20,486,'Mumbai',0,'25,PACHUNKAR COLONY DEWAS','749076633835',NULL,NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8364,'1008364','EMP0008364',NULL,NULL,'PAWAN','RADHESHYAM','PARMAR','1982-09-30','Male','9876541365',NULL,'abc@gmail.com','236/8,MAHANKAL COLONY DEWAS',1,20,486,'Mumbai',0,'236/8,MAHANKAL COLONY DEWAS','874142831015','BURPP6765R',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8365,'1008365','EMP0008365',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-06','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8366,'1008366','EMP0008366',NULL,NULL,'ANIL','KUMAR','SONI','1981-01-13','Male','9876541369',NULL,'abc@gmail.com','JAMNA NAGAR MAKSI ROAD DEWAS',1,20,486,'Mumbai',455001,'JAMNA NAGAR MAKSI ROAD DEWAS','986064703619','DSBPS3451K',NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8367,'1008367','EMP0008367',NULL,NULL,'RAKESH ','RAMCHANDRA','JOSHI','1982-07-08','Male','9876541370',NULL,'abc@gmail.com','TONK KHURD DIST-DEWAS',1,20,486,'Mumbai',0,'TONK KHURD DIST-DEWAS','0',NULL,NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8368,'1008368','EMP0008368',NULL,NULL,'ANKIT','CHATURNARAYAN','SHARMA','1989-06-19','Male','9876541372',NULL,'abc@gmail.com','VILL-BAWARIYA HAT,TH-ASHTA SEHORE',1,20,486,'Mumbai',0,'VILL-BILAWALI DEWAS','0',NULL,NULL,'UnMarried',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8369,'1008369','EMP0008369',NULL,NULL,'BALKRISHNA','RAM SINGH','KACHNARIYA','1984-07-23','Male','9876541373',NULL,'abc@gmail.com','181,LIG-MUKHARJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'181,LIG-MUKHARJI NAGAR DEWAS','508229506806',NULL,NULL,'Married',NULL,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8370,'1008370','EMP0008370',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-26','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8371,'1008371','EMP0008371',NULL,NULL,'MEHARBAN','DHULJI ','SOLANKI','1988-11-22','Male','9876541375',NULL,'abc@gmail.com','D1/52 Awash Nagar Dewas',1,20,486,'Mumbai',455001,'D1/52 Awash Nagar Dewas','363897491995',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8372,'1008372','EMP0008372',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-25','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:09','2017-05-26 23:30:09',NULL,NULL,NULL,NULL),(8373,'1008373','EMP0008373',NULL,NULL,'ANKIT',NULL,'GURJAR','1987-10-28','Male','9876541378',NULL,'abc@gmail.com','VILLAGE TONKKALA ',1,20,486,'Mumbai',455001,'VILLAGE TONKKALA','285203901022',NULL,NULL,'Married',4,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8374,'1008374','EMP0008374',NULL,NULL,'RAHISH','NAMADAR','KHAN','1981-05-12','Male','9876541380',NULL,'abc@gmail.com','BIRAKHEDI,DEWAS',1,20,486,'Mumbai',0,'BIRAKHEDI,DEWAS','569584198219',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8375,'1008375','EMP0008375',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-12','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8376,'1008376','EMP0008376',NULL,NULL,'BHAGWAN','SINGH','GOYAL','1986-09-15','Male','9876541382',NULL,'abc@gmail.com','WARD 15,IMLI CHOK AMONA DEWAS',1,20,486,'Mumbai',0,'WARD 15,IMLI CHOK AMONA DEWAS','799034032852','brwpg6837p',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8377,'1008377','EMP0008377',NULL,NULL,'SANDEEP',NULL,'CHANDEL','1983-06-19','Male','9876541383',NULL,'abc@gmail.com','MAHANKAL COLONY DEWAS',1,20,486,'Mumbai',0,'MAHANKAL COLONY DEWAS','523349919550',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8378,'1008378','EMP0008378',NULL,NULL,'JITENDRA','SINGH','PANWAR','1982-06-02','Male','9876541384',NULL,'abc@gmail.com','GANDHI CHOUK SIYA DEWAS',1,20,486,'Mumbai',455001,'GANDHI CHOUK SIYA DEWAS','0',NULL,NULL,'UnMarried',4,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8379,'1008379','EMP0008379',NULL,NULL,'NITIN',NULL,'PARIHAR','1982-03-28','Male','9876541385',NULL,'abc@gmail.com','240 A-RANI BAG DEWAS',1,20,486,'Mumbai',0,'240 A-RANI BAG DEWAS','636034342946','DCWPP1882G',NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8380,'1008380','EMP0008380',NULL,NULL,'SOBHAG ','SINGH','PARMAR','1987-03-02','Male','9876541386',NULL,'abc@gmail.com','SANJAY NAGAR DEWAS',1,20,486,'Mumbai',0,'SANJAY NAGAR DEWAS','713402298509',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8381,'1008381','EMP0008381',NULL,NULL,'LAKHAN','SINGH','SOLANKI','1990-02-14','Male','9876541387',NULL,'abc@gmail.com','61,II LIG DHANCHA BHAVAN DEWAS',1,20,486,'Mumbai',0,'61,II LIG DHANCHA BHAVAN DEWAS','353123822598',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8382,'1008382','EMP0008382',NULL,NULL,'SAHEBLAL','NANDANI PRASAD','SEN','1986-02-27','Male','9876541388',NULL,'abc@gmail.com','326,EWS JAY PRAKASH NAGAR DHANCHA BHAVAN DEWAS',1,20,486,'Mumbai',0,'326,EWS JAY PRAKASH NAGAR DHANCHA BHAVAN DEWAS','694143467408',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8383,'1008383','EMP0008383',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1986-01-04','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8384,'1008384','EMP0008384',NULL,NULL,'VISHAL ','DULICHAND','CHOUHAN','1985-11-14','Male','9876541390',NULL,'abc@gmail.com','WARD NO 24 BIHARI GUNJ DEWAS',1,20,486,'Mumbai',0,'WARD NO 24 BIHARI GUNJ DEWAS','339562786313',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8385,'1008385','EMP0008385',NULL,NULL,'SUNIL',NULL,'ROJWAL','1982-01-05','Male','9876541391',NULL,'abc@gmail.com','KANCHAN COLONY BAWADIYA DEWAS ',1,20,486,'Mumbai',0,'KANCHAN COLONY BAWADIYA DEWAS ','0',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:10','2017-05-26 23:30:10',NULL,NULL,NULL,NULL),(8386,'1008386','EMP0008386',NULL,NULL,'SUMIT',NULL,'GIRI','1982-01-23','Male','9876541392',NULL,'abc@gmail.com','415,SHANTI NAGAR AMONA DEWAS',1,20,486,'Mumbai',455001,'415,SHANTI NAGAR AMONA DEWAS','395672023261',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8387,'1008387','EMP0008387',NULL,NULL,'MANISH','MADANLAL','CHOUDHARY','1983-01-19','Male','9876541393',NULL,'abc@gmail.com','21,KAMALA KUNJ DEWAS',1,20,486,'Mumbai',0,'21,KAMALA KUNJ DEWAS','0',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8388,'1008388','EMP0008388',NULL,NULL,'VIVEK ','VASANT','GANDHE','1985-02-08','Male','9876541394',NULL,'abc@gmail.com','10,ASHISH VIHAR INDORE',1,20,486,'Mumbai',0,'10,ASHISH VIHAR INDORE','956841786778',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8389,'1008389','EMP0008389',NULL,NULL,'PAVAN',NULL,'SHRIVASTAVA','1985-07-02','Male','9876541395',NULL,'abc@gmail.com','316/B,RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',0,'316/B,RAJARAM NAGAR DEWAS','233143871412','cmvps8307k','mp41/004102/05','Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8390,'1008390','EMP0008390',NULL,NULL,'SURENDRA','DHARU SINGH','DANGI','1982-04-13','Male','9876541399',NULL,'abc@gmail.com','198,SHIV SHAKTI NAGAR UJJAIN ROAD DEWAS',1,20,486,'Mumbai',455001,'198,SHIV SHAKTI NAGAR UJJAIN ROAD DEWAS','0',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8391,'1008391','EMP0008391',NULL,NULL,'DEEPAK','GANESH','JANOLIYA','1985-08-27','Male','9876541400',NULL,'abc@gmail.com','VILL-NAGPUR,POST-AJNOD-TH-SAWER',1,20,486,'Mumbai',0,'VILL-NAGPUR,POST-AJNOD-TH-SAWER','621051130656',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8392,'1008392','EMP0008392',NULL,NULL,'DINESH','RAMAJI','KALMI','1987-01-16','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8393,'1008393','EMP0008393',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-16','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8394,'1008394','EMP0008394',NULL,NULL,'PRATEEK ','BABULAL','SANWALIYA','1990-02-06','Male','9876541403',NULL,'abc@gmail.com','43 RAJENDRA MARG SONKATCH DIS DEWAS',1,20,486,'Mumbai',0,'43 RAJENDRA MARG SONKATCH DIS DEWAS','503645072824',NULL,NULL,'Married',2,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8395,'1008395','EMP0008395',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-17','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8396,'1008396','EMP0008396',NULL,NULL,'DINESH ','DAYARAM','SHAHITE','1985-09-11','Male','9876541405',NULL,'abc@gmail.com','DURGA COLONY, AMONA ,DEWAS',1,20,486,'Mumbai',455001,'DURGA COLONY, AMONA ,DEWAS','971732031568','0',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8397,'1008397','EMP0008397',NULL,NULL,'NISHANT','ANANT','KHALADKAR','1982-07-04','Male','9876541408',NULL,'abc@gmail.com','530 E.W.S VIJAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'530 E.W.S VIJAY NAGAR DEWAS','484274585905','CLEPK9210R',NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8398,'1008398','EMP0008398',NULL,NULL,'AMIT ','SURENDRA','GIRI','1981-03-27','Male','9876541409',NULL,'abc@gmail.com','415 GALI NO 2 SHANTI NAGAR AMONA DEWAS',1,20,486,'Mumbai',0,'415 GALI NO 2 SHANTI NAGAR AMONA DEWAS','810206815282',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8399,'1008399','EMP0008399',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-18','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:11','2017-05-26 23:30:11',NULL,NULL,NULL,NULL),(8400,'1008400','EMP0008400',NULL,NULL,'SURENDRA','DUDHESHWER','YADAV','1984-08-16','Male','9876541411',NULL,'abc@gmail.com','5 KARTIK NAGAR DEWAS',1,20,486,'Mumbai',455001,'5 KARTIK NAGAR DEWAS','202496197376',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8401,'1008401','EMP0008401',NULL,NULL,'PRADEEP ','DEVENDRA SINGH','BHAGHEL','1989-11-18','Male','9876541412',NULL,'abc@gmail.com','394 VIKAS NAGAR DEWAS',1,20,486,'Mumbai',455001,'394 VIKAS NAGAR DEWAS','573516105478','BHJPB5724R',NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8402,'1008402','EMP0008402',NULL,NULL,'VIKAS ','RAMESHVAR','JAGADLE','1982-05-14','Male','9876541413',NULL,'abc@gmail.com','99 AWAS NAGAR DEWAS',1,20,486,'Mumbai',455001,'99 AWAS NAGAR DEWAS','895606820421','AZFPJ0709D',NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8403,'1008403','EMP0008403',NULL,NULL,'jugal ',NULL,'choudhary','1985-09-27','Male','9876541414',NULL,'abc@gmail.com','21 KAMLA KUNJ DEWAS NEAR ANUKAL  NAGAR DEWAS MP',1,20,486,'Mumbai',455001,'21 KAMLA KUNJ DEWAS NEAR ANUKAL  NAGAR DEWAS MP','933474715647','AWLPJ4386P',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8404,'1008404','EMP0008404',NULL,NULL,'ASHISH ',NULL,'SONI','1983-08-22','Male','9876541415',NULL,'abc@gmail.com','EWS- 484, MUKHERJEE NAGAR DEWAS',1,20,486,'Mumbai',455001,'EWS- 484, MUKHERJEE NAGAR DEWAS','588643432130','FYQPS7000R',NULL,'UnMarried',3,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8405,'1008405','EMP0008405',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-26','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8406,'1008406','EMP0008406',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-06-06','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8407,'1008407','EMP0008407',NULL,NULL,'PAWAN ',NULL,'KUMAR','1981-07-17','Male','9876541418',NULL,'abc@gmail.com','MAKAN NO 106 WARD NO. 8, GRAM KARARIYA RAJGARH REWA',1,20,486,'Mumbai',0,NULL,'264195659220',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8408,'1008408','EMP0008408',NULL,NULL,'RAY','SINGH','CHOUHAN','1989-06-27','Male','9876541419',NULL,'abc@gmail.com','S/O VIKRAM CHOUHAN WARD KR. 16 PATEL NAGAR BAVADIYA DEWAS',1,20,486,'Mumbai',455001,'S/O VIKRAM CHOUHAN WARD KR. 16 PATEL NAGAR BAVADIYA DEWAS','230372861436',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8409,'1008409','EMP0008409',NULL,NULL,'RAKESH ',NULL,'CHOUDHARY','1981-06-15','Male','9876541420',NULL,'abc@gmail.com','32, GRAM- AKHAJURIYA JAGEER',1,20,486,'Mumbai',455,'32, GRAM- AKHAJURIYA JAGEER','727139980573',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8410,'1008410','EMP0008410',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-02-02','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8411,'1008411','EMP0008411',NULL,NULL,'DHARMENDRA',NULL,'VERMA','1984-07-15','Male','9876541422',NULL,'abc@gmail.com','TEH SONKACH WARD 4 BERAKHEDI GANDHARVPURI DEWAS',1,20,486,'Mumbai',455001,'TEH SONKACH WARD 4 BERAKHEDI GANDHARVPURI DEWAS','325240403669',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8412,'1008412','EMP0008412',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-14','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8413,'1008413','EMP0008413',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-11','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:12','2017-05-26 23:30:12',NULL,NULL,NULL,NULL),(8414,'1008414','EMP0008414',NULL,NULL,'PRAHLAD','LALJIRAM','GOYAL','1985-10-06','Male','9876541425',NULL,'abc@gmail.com','Mendhki Chak Nai Abadi Dewas',1,20,486,'Mumbai',455001,'Mendhki Chak Nai Abadi Dewas','790357232177','BHUPG6055M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8415,'1008415','EMP0008415',NULL,NULL,'JAGDISH','RAMKARAN','TEKAM','1986-10-25','Male','9876541426',NULL,'abc@gmail.com','H.N.131 Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'H.N.131 Dhacha Bhavan Dewas','439378938608',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8416,'1008416','EMP0008416',NULL,NULL,'BHANWAR','SINGH','AGARWAL','1986-06-11','Male','9876541427',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas','967188927054','ensps4872p',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8417,'1008417','EMP0008417',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-25','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8418,'1008418','EMP0008418',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-20','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8419,'1008419','EMP0008419',NULL,NULL,'BANE SINGH','MANGILAL',' ','1982-12-08','Male','9876541430',NULL,'abc@gmail.com','Vill-Jamgod',1,20,486,'Mumbai',455001,'Vill-Jamgod Dist-Dewas','374171613660',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8420,'1008420','EMP0008420',NULL,NULL,'RAJMAL','MOHANLAL',' ','1986-05-10','Male','9876541431',NULL,'abc@gmail.com','Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Mendhki Chakk Dewas','244703234412',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8421,'1008421','EMP0008421',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-03-03','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8422,'1008422','EMP0008422',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-31','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8423,'1008423','EMP0008423',NULL,NULL,'DEEPAK','HARISHANKAR','SHROTRIYA','1986-10-09','Male','9876541434',NULL,'abc@gmail.com','305 Shivaji Bal Mandir Ke Pass Bawadiya  Dewas',1,20,486,'Mumbai',455001,'305 Shivaji Bal Mandir Ke Pass Bawadiya  Dewas','222295976275',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8424,'1008424','EMP0008424',NULL,NULL,'TILAK CHAND','MANGILAL',' ','1982-10-21','Male','9876541435',NULL,'abc@gmail.com','70 Vikas Nagar Dewas',1,20,486,'Mumbai',455001,'70 Vikas Nagar Dewas','912881999502',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8425,'1008425','EMP0008425',NULL,NULL,'SHAILENDRA','KASHINATH ','CHOUREY','1988-01-16','Male','9876541436',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','596646110825',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8426,'1008426','EMP0008426',NULL,NULL,'VINOD','BALKRISHAN','PATEL','1982-09-04','Male','9876541437',NULL,'abc@gmail.com','624 Ews-Vikas Nagar A.B.Road Dewas',1,20,486,'Mumbai',455001,'624 Ews-Vikas Nagar A.B.Road Dewas','829605289282','cnepp2716f',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8427,'1008427','EMP0008427',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-28','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:13','2017-05-26 23:30:13',NULL,NULL,NULL,NULL),(8428,'1008428','EMP0008428',NULL,NULL,'SANTOSH','ATMARAM','MALVIYA','1982-11-25','Male','9876541439',NULL,'abc@gmail.com','269 Prahladnagar Dewas',1,20,486,'Mumbai',455001,'269 Prahladnagar Dewas','749402221309','CSUPTA 7132D',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8429,'1008429','EMP0008429',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-12','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8430,'1008430','EMP0008430',NULL,NULL,'RAJARAM','GANPAT',' ','1990-08-17','Male','9876541441',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','786176275533','BIPPR03780J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8431,'1008431','EMP0008431',NULL,NULL,'BHAGWAN','DHOLJI','DEVDA','1988-12-25','Male','9876541442',NULL,'abc@gmail.com','Vill-Beerakhedi',1,20,486,'Mumbai',455001,'Vill-Beerakhedi Dist-Dewas','517578615960','GPJPS7902M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8432,'1008432','EMP0008432',NULL,NULL,'VISHNU','NIRBHAY ','SINGH','1987-06-06','Male','9876541443',NULL,'abc@gmail.com','Plasiya Dkachchiya Ke Pass Dewas  Dewas',1,20,486,'Mumbai',455001,'Shanti Nagar Dewas','852610309489',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8433,'1008433','EMP0008433',NULL,NULL,'SANDEEP','ONKARLAL','YADAV','1987-08-17','Male','9876541444',NULL,'abc@gmail.com','109/2 Laxmi Bai Marg Gawli Mohall Dewas',1,20,486,'Mumbai',455001,'109/2 Laxmi Bai Marg Gawli Mohall Dewas','220257789015','ADDPY0906M',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8434,'1008434','EMP0008434',NULL,NULL,'OMPRAKASH','MANGILAL','AHIRWAL','1988-07-26','Male','9876541445',NULL,'abc@gmail.com','Vill-Jamgod Post-Jamgod  Dewas',1,20,486,'Mumbai',455001,'Vill-Jamgod Post-Jamgod  Dewas','954262248870','BOLPA0575G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8435,'1008435','EMP0008435',NULL,NULL,'SURESH','RAMESH ','CHOUDHARY','1987-01-05','Male','9876541446',NULL,'abc@gmail.com','Vill.-Puvalda Th.+Dist.-Dewas',1,20,486,'Mumbai',455001,'Vill.-Puvalda Th.+Dist.-Dewas','344575278627',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8436,'1008436','EMP0008436',NULL,NULL,'SANTOSH','RAMPAL','singh','1985-10-22','Male','9876541447',NULL,'abc@gmail.com','Jamala Pur Patti      ',1,20,486,'Mumbai',455001,'497 Ews-Vikas Nagar Dewas      ','301440345210','ETEPS4314C',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8437,'1008437','EMP0008437',NULL,NULL,'RADHESHYAM','HEERALAL','SHARMA','1985-12-01','Male','9876541448',NULL,'abc@gmail.com','22 Indra Nagar Dewas',1,20,486,'Mumbai',455001,'22 Indra Nagar Dewas ','451667598391',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8438,'1008438','EMP0008438',NULL,NULL,'MINI',' ','SABU','1982-02-10','Female','9876541449',NULL,'abc@gmail.com','39  Lig Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'39  Lig Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8439,'1008439','EMP0008439',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-17','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8440,'1008440','EMP0008440',NULL,NULL,'JAGAN','SINGH','AHIRWAR','1986-02-19','Male','9876541451',NULL,'abc@gmail.com','GRAM- SUMRERIPOST GADOLA JAGIR TEHSIL- KHURAI JILA- SAGAR',1,20,486,'Mumbai',455001,'36/2 NUTAN NAGAR BNP ROAD DEWAS','928964166850','AGNPA7510J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:14','2017-05-26 23:30:14',NULL,NULL,NULL,NULL),(8441,'1008441','EMP0008441',NULL,NULL,'RAM KISHAN','SHIV SINGH','CHOUDHARY','1989-01-18','Male','9876541452',NULL,'abc@gmail.com','Vill-Khajuriya Jagir',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','922703311045',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8442,'1008442','EMP0008442',NULL,NULL,'GAJENDRA','RAMLAL','PARMAR','1990-07-24','Male','9876541453',NULL,'abc@gmail.com','Vill-Jamgod Rani  Dewas ',1,20,486,'Mumbai',455001,'Vill-Jamgod Rani  Dewas','909166432552','CUKPP1192C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8443,'1008443','EMP0008443',NULL,NULL,'BHARAT BHUSHAN','YADAVRAO','DUSANE','1982-07-20','Male','9876541454',NULL,'abc@gmail.com','15 Malhar Kothi Road Shivaji Nagar Dewas',1,20,486,'Mumbai',455001,'15 Malhar Kothi Road Shivaji Nagar Dewas','481981056151',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8444,'1008444','EMP0008444',NULL,NULL,'RAJENDRA','SOBHARAM','MUKATI','1985-10-30','Male','9876541455',NULL,'abc@gmail.com','45,Vijay Shri Nagar Dewas',1,20,486,'Mumbai',455001,'45 Vijay Shri Nagar Dewas','982718234011','azkpm9208h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8445,'1008445','EMP0008445',NULL,NULL,'DUNGAR','SINGH','CHOUHAN','1989-02-27','Male','9876541456',NULL,'abc@gmail.com','Vill - Yashvantnagar Dewas',1,20,486,'Mumbai',455001,'Vill - Yashvantnagar Dewas','751193746090','DUTP56971Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8446,'1008446','EMP0008446',NULL,NULL,'DILIP','KAILASH CHANDRA','KASHYAP','1983-08-06','Male','9876541457',NULL,'abc@gmail.com','2/8 Laxmi Nagar Dewas',1,20,486,'Mumbai',455001,'2/8 Laxmi Nagar Dewas','348983265953',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8447,'1008447','EMP0008447',NULL,NULL,'DULICHAND','KUMBHARAM','PRAJAPATI','1981-06-26','Male','9876541458',NULL,'abc@gmail.com','Bhandari Colony Dewas',1,20,486,'Mumbai',0,'Bhandari Colony Dewas','225688657841',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8448,'1008448','EMP0008448',NULL,NULL,'KAILASH','NAND RAM','PARIHAR','1981-09-17','Male','9876541459',NULL,'abc@gmail.com','Vill-Sunwani Post-Kashipura',1,20,486,'Mumbai',455001,'Vill-Sunwani Post-Kashipura Dist-Dewas','511366809427',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8449,'1008449','EMP0008449',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-07','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8450,'1008450','EMP0008450',NULL,NULL,'SHANTILAL','AMBARAM','PARMAR','1987-01-13','Male','9876541461',NULL,'abc@gmail.com','121 Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'121 Shankar Nagar Dewas','944134034764',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8451,'1008451','EMP0008451',NULL,NULL,'SAIYAD SHAHID','SYED SHARAFAT','ALI','1987-08-01','Male','9876541462',NULL,'abc@gmail.com','29, LAXMI BAI MARG NAHAR GET DEWAS M.P.',1,20,486,'Mumbai',455001,'29, LAXMI BAI MARG NAHAR GET DEWAS M.P.','987262626713','AQJPA4537B',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8452,'1008452','EMP0008452',NULL,NULL,'TARA','CHAND ','YADAV','1988-04-21','Male','9876541463',NULL,'abc@gmail.com','479/480 SUN CITY A,B ROAD DEWAS M.P.',1,20,486,'Mumbai',455001,'479/480 SUN CITY A,B ROAD DEWAS M.P.','475340089918','ACJPY0731H',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8453,'1008453','EMP0008453',NULL,NULL,'PRADEEP','S.K.','WAGDE','1988-08-27','Male','9876541464',NULL,'abc@gmail.com','26/2 Hatesingh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'26/2 Hatesingh Goyal Colony Dewas','678193063292','aaypw5405b',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8454,'1008454','EMP0008454',NULL,NULL,'PRASHANT','B.S.','JADHAV','1983-06-27','Male','9876541465',NULL,'abc@gmail.com','44-A  Karolinagar  Dewas',1,20,486,'Mumbai',455001,'44-A  Karolinagar  Dewas','758593299833','AKDPJ8897M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:15','2017-05-26 23:30:15',NULL,NULL,NULL,NULL),(8455,'1008455','EMP0008455',NULL,NULL,'RAKESH','K.N.','KICHOLIYA','1987-05-29','Male','9876541466',NULL,'abc@gmail.com','Awas Nagar Dewas',1,20,486,'Mumbai',455001,'A1-17- Awas Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8456,'1008456','EMP0008456',NULL,NULL,'CHETAN','DEVI PRASAD','SINGH','1984-08-24','Male','9876541467',NULL,'abc@gmail.com','131,SAVODAY NAGAR NEAR KHATU SHYAM MANDIR  DEWAS ',1,20,486,'Mumbai',455001,'131,SAVODAY NAGAR NEAR KHATU SHYAM MANDIR  DEWAS ','542677595096','CSMPS7421R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8457,'1008457','EMP0008457',NULL,NULL,'GAURAV','K.K.','DHARMA','1986-09-23','Male','9876541469',NULL,'abc@gmail.com','89 Shivaji Nagar Dewas',1,20,486,'Mumbai',455001,'89 Shivaji Nagar Dewas ','468896288897','CHVPD6602B',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8458,'1008458','EMP0008458',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-22','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8459,'1008459','EMP0008459',NULL,NULL,'MANISH','MADANLAL','CHOUDHARY','1983-01-20','Male','9876541471',NULL,'abc@gmail.com','Bajarang Nagar A.B.Road Dewas ',1,20,486,'Mumbai',455001,'Bajarang Nagar A.B.Road Dewas','891196124054','bevpc1198h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8460,'1008460','EMP0008460',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-08','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8461,'1008461','EMP0008461',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-19','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8462,'1008462','EMP0008462',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-27','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8463,'1008463','EMP0008463',NULL,NULL,'MUKESH','SARDAR SINGH','CHOUDHARY','1981-09-09','Male','9876541475',NULL,'abc@gmail.com','Vill-Nayata Bawai Post-Singawda  Dewas',1,20,486,'Mumbai',455001,'Vill-Nayata Bawai Post-Singawda  Dewas','541220518428',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8464,'1008464','EMP0008464',NULL,NULL,'BALWANT','SINGH','TOMAR','1982-06-10','Male','9876541476',NULL,'abc@gmail.com','Q.No.2063 Bnp Colony Dewas',1,20,486,'Mumbai',455001,'Q.No.2063 Bnp Colony Dewas','607327787228',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8465,'1008465','EMP0008465',NULL,NULL,'MADAN LAL','MANGILAL','MALVIYA','1982-11-07','Male','9876541477',NULL,'abc@gmail.com','Vill-Ramgardh  Post-Salam Khedi Dist-Dewas',1,20,486,'Mumbai',0,'149 Mahankal Colony Dewas ','538519962736',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8466,'1008466','EMP0008466',NULL,NULL,'NANDAN','DEEWAN SINGH','PALNI','1990-05-29','Male','9876541478',NULL,'abc@gmail.com','VILL - PALNI KOT ( BADET)',1,20,486,'Mumbai',0,'Bhandari Colony Dewas','375334309060','BKBPP8127M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8467,'1008467','EMP0008467',NULL,NULL,'DINESH','DAYARAM','SHAHITE','1985-09-12','Male','9876541479',NULL,'abc@gmail.com','DURGA COLONY, AMONA ,DEWAS',1,20,486,'Mumbai',455001,'DURGA COLONY, AMONA ,DEWAS','971732031568',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8468,'1008468','EMP0008468',NULL,NULL,'SANTOSH','bheru lal solanki','SOLANKI','1986-06-19','Male','9876541480',NULL,'abc@gmail.com','Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Mendhki Chakk Dewas','461121041675',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:16','2017-05-26 23:30:16',NULL,NULL,NULL,NULL),(8469,'1008469','EMP0008469',NULL,NULL,'BADRILAL','RAJARAM','PRAJAPATI','1981-08-10','Male','9876541481',NULL,'abc@gmail.com','Durga Colony  Amona  Dewas ',1,20,486,'Mumbai',455001,'Durga Colony  Amona  Dewas  455001  Madhya Pradesh','338663209961',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8470,'1008470','EMP0008470',NULL,NULL,'JAY PRAKASH','NANDKESHWAR','TIWARI','1985-06-24','Male','9876541482',NULL,'abc@gmail.com','74/A  Chandralok Nagar Balgarh Road Dewas',1,20,486,'Mumbai',455001,'74/A Chandralok Nagar Balgarh Road Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8471,'1008471','EMP0008471',NULL,NULL,'VIJAY','KUMAR','SINGH','1982-10-24','Male','9876541483',NULL,'abc@gmail.com','Lig-118  Vikas Nagar  Dewas',1,20,486,'Mumbai',455001,'Lig-118  Vikas Nagar  Dewas','951297571945',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8472,'1008472','EMP0008472',NULL,NULL,'SUNITA',' ','RATHORE','1983-01-26','Female','9876541484',NULL,'abc@gmail.com','32 Radhaganj Dewas   ',1,20,486,'Mumbai',455001,'32 Radhaganj Dewas   ','791015906588','CBTPR4513D',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8473,'1008473','EMP0008473',NULL,NULL,'MANOHAR','ANTAR SINGH','MANDLOI','1982-06-16','Male','9876541485',NULL,'abc@gmail.com','37 Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'37 Pratap Nagar Dewas','639179123748',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8474,'1008474','EMP0008474',NULL,NULL,'ROHIT','SHIVPRASAD','PRAJAPATI','1983-03-14','Male','9876541486',NULL,'abc@gmail.com','VILLAGE GAMBHIR TEH.NEW HARSUD CHANERA DISTT. KHANDWA.',1,20,486,'Mumbai',455001,'434 CWS Vikas Nagar Dewas M.P.','742321566992','BCWPP0309L',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8475,'1008475','EMP0008475',NULL,NULL,'ASHOK','RAMKISHAN','SHARMA','1986-03-23','Male','9876541487',NULL,'abc@gmail.com','98/2 Gajanand Colony Bnp Road Dewas',1,20,486,'Mumbai',455001,'98/2 Gajanand Colony Bnp Road Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8476,'1008476','EMP0008476',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-21','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8477,'1008477','EMP0008477',NULL,NULL,'RAMCHARAN','PUNAJI','CHOUDHARY','1983-02-18','Male','9876541489',NULL,'abc@gmail.com','7-Lig-Ii  Jaiprakash Nagar  Dewas',1,20,486,'Mumbai',455001,'7-Lig-Ii  Jaiprakash Nagar  Dewas ','233374686426','agcpc2015k',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8478,'1008478','EMP0008478',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-10','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8479,'1008479','EMP0008479',NULL,NULL,'DINESH','PREMSINGH','PRAJAPATI','1988-01-07','Male','9876541491',NULL,'abc@gmail.com','Parihar Colony  Bawadiya  Dewas ',1,20,486,'Mumbai',455001,'Parihar Colony  Bawadiya  Dewas ','940799006121','cqipp39800a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8480,'1008480','EMP0008480',NULL,NULL,'RAJENDRA','Devidas','TAYADE','1986-11-02','Male','9876541492',NULL,'abc@gmail.com','Patel Nagar, Bawadiya,  Dewas',1,20,486,'Mumbai',455001,'Patel Nagar, Bawadiya,  Dewas ','519075104084','BLXPR6821B',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8481,'1008481','EMP0008481',NULL,NULL,'MEHARBAN','DHULJI','SOLANKI','1988-11-23','Male','9876541493',NULL,'abc@gmail.com','D1/52 Awash Nagar Dewas',1,20,486,'Mumbai',0,'D1/52 Awash Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8482,'1008482','EMP0008482',NULL,NULL,'RAMNIWAS','JAGESHWAR ','YADAV','1985-01-13','Male','9876541495',NULL,'abc@gmail.com','Vill.-Jhabua Th.-Kannod',1,20,486,'Mumbai',455001,'42 Karoli Nagar Dewas ','469251995466',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:17','2017-05-26 23:30:17',NULL,NULL,NULL,NULL),(8483,'1008483','EMP0008483',NULL,NULL,'SANDEEP','Singaram','PATEL','1982-12-19','Male','9876541497',NULL,'abc@gmail.com','Vill.-Barkheda Kotapai Post.Rajoda',1,20,486,'Mumbai',455001,'Vill.-Barkheda Kotapai Post.Rajoda Dist.-Dewas','896237775589',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8484,'1008484','EMP0008484',NULL,NULL,'RITESH',NULL,'GUPTA','1989-03-15','Male','9876541498',NULL,'abc@gmail.com','40 Mahaveer Nagar Dewas',1,20,486,'Mumbai',455001,'40 Mahaveer Nagar Dewas','360940393569',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8485,'1008485','EMP0008485',NULL,NULL,'KHALIL','AJMERI','SHAIKH','1989-05-26','Male','9876541499',NULL,'abc@gmail.com','SHALIMAR COLONY ITAVA DEWAS M.P.',1,20,486,'Mumbai',455001,'SHALIMAR COLONY ITAVA DEWAS M.P.','229013071632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8486,'1008486','EMP0008486',NULL,NULL,'SUNIL','RADHESHYAM','HARODE','1981-10-21','Male','9876541500',NULL,'abc@gmail.com','37/2 Mukti Marg  Dewas',1,20,486,'Mumbai',455001,'37/2 Mukti Marg  Dewas','454850922795',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8487,'1008487','EMP0008487',NULL,NULL,'SHIV','KUMAR','GOUTAM','1988-05-31','Male','9876541501',NULL,'abc@gmail.com','350 Durga Colony Amona Dewas',1,20,486,'Mumbai',455001,'350 Durga Colony Amona Dewas','491406850960',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8488,'1008488','EMP0008488',NULL,NULL,'DEVASHISH','OMPRAKASH','MALVIYA','1990-03-02','Male','9876541502',NULL,'abc@gmail.com','Ews-209 Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'Ews-209 Mukharji Nagar Dewas','854278964521','BPGPM2892L',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8489,'1008489','EMP0008489',NULL,NULL,'BHIM','SINGH','RATHORE','1984-01-21','Male','9876541503',NULL,'abc@gmail.com','240 Amona Dewas  Dewas ',1,20,486,'Mumbai',455001,'240 Amona Dewas  Dewas ','249493848449','BXQPB9999F',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8490,'1008490','EMP0008490',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-07','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:18','2017-05-26 23:30:18',NULL,NULL,NULL,NULL),(8491,'1008491','EMP0008491',NULL,NULL,'SACHIN','HANUMANT RAO','SHIKHRE','1987-03-10','Male','9876541505',NULL,'abc@gmail.com','65 LALA LAJPAT RAI MARG DEWAS ',1,20,486,'Mumbai',455001,'Choti Panthi Rajwada Madan Deri Dewas','262507267656',NULL,'MP41R-2016-182204','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8492,'1008492','EMP0008492',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-12-02','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8493,'1008493','EMP0008493',NULL,NULL,'PRAVEEN','MADANLAL','SOLANKI','1990-08-01','Male','9876541508',NULL,'abc@gmail.com','23 Rewa Bagh  Dewas',1,20,486,'Mumbai',455001,'23 Rewa Bagh  Dewas','846390021772',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8494,'1008494','EMP0008494',NULL,NULL,'ASHGAR','HUSAIN','ALI','1981-07-21','Male','9876541509',NULL,'abc@gmail.com','Mukti Marg Gali No.3 H.N.38 Bherugardh Dewas',1,20,486,'Mumbai',455001,'Mukti Marg Gali No.3 H.N.38 Bherugardh Dewas','634031355672',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8495,'1008495','EMP0008495',NULL,NULL,'DEVENDRA','BALMUKUND','VERMA','1984-12-22','Male','9876541510',NULL,'abc@gmail.com','36 Rani Bag Dewas',1,20,486,'Mumbai',455001,'36 Rani Bag Dewas','805146721252','AVWPV8620N',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8496,'1008496','EMP0008496',NULL,NULL,'RAVINDRA','LAL JI SINGH','PATEL','1989-01-26','Male','9876541511',NULL,'abc@gmail.com','Ews 37 Jai Prakash Nagar  Dewas',1,20,486,'Mumbai',455001,'Ews 37 Jai Prakash Nagar  Dewas','390002564500','CFLPP3231G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8497,'1008497','EMP0008497',NULL,NULL,'PANKAJ','RAKESH','PRABHAKAR','1982-09-22','Male','9876541512',NULL,'abc@gmail.com','67/A,ADARSH NAGAR B.N.P. ROAD DEWAS',1,20,486,'Mumbai',455001,'67/A,ADARSH NAGAR B.N.P. ROAD DEWAS','413186353147','BVGPP2292B',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8498,'1008498','EMP0008498',NULL,NULL,'ALKESH','RADHESHYAM','NAYAK','1990-09-26','Male','9876541513',NULL,'abc@gmail.com','Vill.-Choubara Dhira ',1,20,486,'Mumbai',0,'Vill.-Choubara Dhira Dist.-Dewas','799947172596','aqppn3889f',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8499,'1008499','EMP0008499',NULL,NULL,'BADRILAL','RATANLAL','SHARMA','1983-09-23','Male','9876541514',NULL,'abc@gmail.com','354 Trilok Nagar Near Holi Angan School Ujjain Roa  Dewas',1,20,486,'Mumbai',0,'354 Trilok Nagar Near Holi Angan School Ujjain Roa  Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8500,'1008500','EMP0008500',NULL,NULL,'AJAY','Baijnath','KATIYAR','1982-12-17','Male','9876541515',NULL,'abc@gmail.com','79-A Gomti Nagar A.B.Road Dewas',1,20,486,'Mumbai',455001,'79-A Gomti Nagar A.B.Road Dewas ','784535467861','DOYPK4791B',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8501,'1008501','EMP0008501',NULL,NULL,'BHARAT','ANUP SINGH','THAKUR','1981-02-23','Male','9876541516',NULL,'abc@gmail.com','C-4/28 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'C-4/28 Awas Nagar Dewas','569250834280',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8502,'1008502','EMP0008502',NULL,NULL,'VINOD','RADHESHYAM','PATEL','1985-12-25','Male','9876541517',NULL,'abc@gmail.com','417 Mendhki Chaak Dewas',1,20,486,'Mumbai',455001,'417 Mendhki Chaak Dewas','772509781988',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8503,'1008503','EMP0008503',NULL,NULL,'RAKESH','ONKARLAL','CHOUDHARY','1988-10-22','Male','9876541518',NULL,'abc@gmail.com','Gandhi Chook Siya Dewas',1,20,486,'Mumbai',455001,'Gandhi Chook Siya Dewas','600320475558',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8504,'1008504','EMP0008504',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-21','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:19','2017-05-26 23:30:19',NULL,NULL,NULL,NULL),(8505,'1008505','EMP0008505',NULL,NULL,'RAMESHWAR','SUKHRAM','PARMAR','1981-04-18','Male','9876541520',NULL,'abc@gmail.com','94A Sita Ram Nagar Mendhaki Road Dewas',1,20,486,'Mumbai',455001,'94A Sita Ram Nagar Mendhaki Road Dewas ','33353986372',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8506,'1008506','EMP0008506',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-26','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8507,'1008507','EMP0008507',NULL,NULL,'MUKESH','NANURAM','PATEL','1989-02-19','Male','9876541522',NULL,'abc@gmail.com','Vill.-Behri Post.-Bagli Dist.-Dewas',1,20,486,'Mumbai',455001,'4 Shanti Pura Dewas  Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8508,'1008508','EMP0008508',NULL,NULL,'ANOKHILAL','BABULAL','PARMAR','1989-03-07','Male','9876541523',NULL,'abc@gmail.com','Vill. Mudka Post Patlawda  Dewas',1,20,486,'Mumbai',0,'Vill. Mudka Post Patlawda  Dewas','680892846544',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8509,'1008509','EMP0008509',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-10','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8510,'1008510','EMP0008510',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-22','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8511,'1008511','EMP0008511',NULL,NULL,'RAJARAM','BONDAJI','GOKHLE','1982-04-29','Male','9876541526',NULL,'abc@gmail.com','station Road Geeta Bhavan Dewas',1,20,486,'Mumbai',455001,'station Road Geeta Bhavan Dewas','736907160573',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8512,'1008512','EMP0008512',NULL,NULL,'SHEKHAR','PREM NARAYAN','SUNANIYA','1987-07-08','Male','9876541527',NULL,'abc@gmail.com','Bada Malsapura Siya Dist-Dewas',1,20,486,'Mumbai',0,'Bada Malsapura Siya Dist-Dewas','220569671012',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8513,'1008513','EMP0008513',NULL,NULL,'DEVKARAN','DARIYAV SINGH','MALVIYA','1981-11-11','Male','9876541528',NULL,'abc@gmail.com','Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Mendhki Chakk Dewas','660803389533',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8514,'1008514','EMP0008514',NULL,NULL,'GANESH','GULAB SINGH','YADAV','1981-10-25','Male','9876541529',NULL,'abc@gmail.com','160 Lig.-Vikas Nagar Dewas',1,20,486,'Mumbai',455001,'160 Lig.-Vikas Nagar Dewas','764756318670',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8515,'1008515','EMP0008515',NULL,NULL,'RAKESH','BASANT','SONI','1981-01-22','Male','9876541530',NULL,'abc@gmail.com','31 Jamuna Nagar Dewas',1,20,486,'Mumbai',455001,'31 Jamuna Nagar Dewas','470523350805',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8516,'1008516','EMP0008516',NULL,NULL,'KALU','KARAN SINGH','PANWAR','1990-05-21','Male','9876541531',NULL,'abc@gmail.com','Barkheda Potapai Dist.-Dewas ',1,20,486,'Mumbai',455001,'Barkheda Potapai Dist.-Dewas','602271995955',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8517,'1008517','EMP0008517',NULL,NULL,'HUKUM','SINGH','BHATI','1990-11-05','Male','9876541532',NULL,'abc@gmail.com','62 Karoli Nagar Dewas',1,20,486,'Mumbai',455001,'62 Karoli Nagar Dewas','248428107010',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8518,'1008518','EMP0008518',NULL,NULL,'ANIL','BASANT','SONI','1981-01-14','Male','9876541533',NULL,'abc@gmail.com','Jamna Nagar Maksi Road Dewas',1,20,486,'Mumbai',455001,'Jamna Nagar Maksi Road Dewas','986064703619','DSBPS3451K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:20','2017-05-26 23:30:20',NULL,NULL,NULL,NULL),(8519,'1008519','EMP0008519',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-30','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8520,'1008520','EMP0008520',NULL,NULL,'SHIVSHANKAR','JAGATPATI','SINGH','1981-11-14','Male','9876541535',NULL,'abc@gmail.com','VILL-BHATWARA  POST-GAWANDRI DIST- CHHAPRA BIHAR',1,20,486,'Mumbai',455001,'2/3 G.K. CHOHAN SHIVAJI NAGAR MOTI BUNGLAW DEWAS','0','CDCPS2773M',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8521,'1008521','EMP0008521',NULL,NULL,'GYAN','SINGH','CHANDRAWANSHI','1984-06-21','Male','9876541536',NULL,'abc@gmail.com','97 Nimad Nagar B-Sector Itawa Dewas',1,20,486,'Mumbai',455001,'97 Nimad Nagar B-Sector Itawa Dewas  ','727659074051',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8522,'1008522','EMP0008522',NULL,NULL,'PINKESH','SOHAN','PATEL','1984-07-07','Male','9876541538',NULL,'abc@gmail.com','9  Arjun Nagar Dewas  Dewas',1,20,486,'Mumbai',455001,'9  Arjun Nagar Dewas','823565386645',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8523,'1008523','EMP0008523',NULL,NULL,'SOMEN','CHITRANJAN','DEY','1989-10-09','Male','9876541539',NULL,'abc@gmail.com','50 Nimad Nagar Itawa Dewas ',1,20,486,'Mumbai',455001,'50 Nimad Nagar Itawa Dewas  Dewas ','460554800073','AJXPD8719K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8524,'1008524','EMP0008524',NULL,NULL,'HEMCHANDRA','LT.N.M','LOKRE','1984-05-20','Male','9876541540',NULL,'abc@gmail.com','9 Anand Bag Behaind Kothari Narsing Home Dewas',1,20,486,'Mumbai',455001,'9 Anand Bag Behaind Kothari Narsing Home Dewas','680287892172','AHJPL5435A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8525,'1008525','EMP0008525',NULL,NULL,'DILEESH','SADHULAL','PATEL','1982-11-23','Male','9876541541',NULL,'abc@gmail.com','733 Lig-Vikas Nagar Dewas',1,20,486,'Mumbai',455001,'733 Lig-Vikas Nagar Dewas','975198281107','DCEPP0002C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8526,'1008526','EMP0008526',NULL,NULL,'JAIPAL','ANTAR SINGH','MANDLOI','1984-12-14','Male','9876541542',NULL,'abc@gmail.com','37/A Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'37/A Pratap Nagar Dewas','622609247154','clypm5074k',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8527,'1008527','EMP0008527',NULL,NULL,'MANOHAR','Tulsiram','MALVIYA','1990-10-28','Male','9876541543',NULL,'abc@gmail.com','120 Mendhki Chaak Harijan Muholla Dewas',1,20,486,'Mumbai',0,'120 Mendhki Chaak Harijan Muholla Dewas','937180790505','CKCPM2486G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8528,'1008528','EMP0008528',NULL,NULL,'VIKAS','Dilip','TRIVEDI','1982-05-09','Male','9876541544',NULL,'abc@gmail.com','Mig-I/9 Trilok Nagar Itawa Dewas',1,20,486,'Mumbai',455001,'Mig-I/9 Trilok Nagar Itawa Dewas','678701792672','AIYPT2942G',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8529,'1008529','EMP0008529',NULL,NULL,'MANOJ','NAGULAL','JANOLIYA','1986-05-02','Male','9876541545',NULL,'abc@gmail.com','Pratap Nagar Dewas',1,20,486,'Mumbai',0,'Pratap Nagar Dewas','894646775456','CBWPM2368G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8530,'1008530','EMP0008530',NULL,NULL,'KAMAL','RAGHUNATH SINGH','GAUD','1988-05-07','Male','9876541546',NULL,'abc@gmail.com','20 Kalu Khedi  Dewas',1,20,486,'Mumbai',455001,'20 Kalu Khedi  Dewas ','285459109786',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8531,'1008531','EMP0008531',NULL,NULL,'SATISH','KUMAR','JATAV','1986-02-02','Male','9876541547',NULL,'abc@gmail.com','Ward No.5  Shivalaya Road Jatav Mohalla',1,20,486,'Mumbai',455001,'Ward No.5  Shivalaya Road Jatav Mohalla','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8532,'1008532','EMP0008532',NULL,NULL,'BILAM','SINGH','PARMAR','1981-04-04','Male','9876541548',NULL,'abc@gmail.com','Vill.-Rajoda Dist.-Dewas',1,20,486,'Mumbai',455001,'Vill.-Rajoda Dist.-Dewas','977459188456','DDGPP2170A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:21','2017-05-26 23:30:21',NULL,NULL,NULL,NULL),(8533,'1008533','EMP0008533',NULL,NULL,'RAJENDRA','RAMCHANDRA','JULWANIYA','1987-07-16','Male','9876541549',NULL,'abc@gmail.com','Vill Nandel  Dewas',1,20,486,'Mumbai',0,'Vill Nandel  Dewas ','640838456739','AUBPJ2882J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8534,'1008534','EMP0008534',NULL,NULL,'PRAKASH','KAILASH','GOYAL','1982-05-01','Male','9876541551',NULL,'abc@gmail.com','106 Durga Nagar Near Jawahar Nagar Dewas',1,20,486,'Mumbai',0,'106 Durga Nagar Near Jawahar Nagar Dewas','794877372077',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8535,'1008535','EMP0008535',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-12','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8536,'1008536','EMP0008536',NULL,NULL,'DARIYAV','SINGH','LODHI','1989-12-11','Male','9876541553',NULL,'abc@gmail.com','Imli Chock Bakliya Dewas',1,20,486,'Mumbai',455001,'Imli Chock Bakliya Dewas','387816310966',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8537,'1008537','EMP0008537',NULL,NULL,'DILIP','NARAYAN','GIRI','1985-01-14','Male','9876541555',NULL,'abc@gmail.com','Mendhki Chakk Dewas ',1,20,486,'Mumbai',455001,'Mendhki Chakk Dewas ','584445038570',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8538,'1008538','EMP0008538',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-06','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8539,'1008539','EMP0008539',NULL,NULL,'BALWANT','OMPRAKASH','MOURYA','1983-04-07','Male','9876541557',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'350/2 Patel Nagar Bawadiya Dewas','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8540,'1008540','EMP0008540',NULL,NULL,'LAKHAN','ANTAR ','SINGH','1987-12-15','Male','9876541558',NULL,'abc@gmail.com','Vill Panda Jagir  Dewas',1,20,486,'Mumbai',455001,'Vill Panda Jagir  Dewas','324849147419','FVJPS3796G',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8541,'1008541','EMP0008541',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-28','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8542,'1008542','EMP0008542',NULL,NULL,'YOGESH','VISHNU PRASAD','BINJONIYA','1982-06-18','Male','9876541560',NULL,'abc@gmail.com','Vill.-Nevri Dist.-Dewas',1,20,486,'Mumbai',0,'Vill.-Nevri Dist.-Dewas','786345345556','BQZPB4935P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8543,'1008543','EMP0008543',NULL,NULL,'SANJAY','AMBARAM','CHAWDA','1988-07-10','Male','9876541561',NULL,'abc@gmail.com','D/4 131, AWAS NAGAR DEWAS',1,20,486,'Mumbai',455001,'D/4 131, AWAS NAGAR DEWAS','620794974216',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8544,'1008544','EMP0008544',NULL,NULL,'RAJKUMAR','BALU PRASAD','PATEL','1983-05-02','Male','9876541562',NULL,'abc@gmail.com','VILLAGE POST JAMONIYA TAHSIL TONKKURD DIST. DEWAS ',1,20,486,'Mumbai',455001,'112 Bajrang Bali Nagar Dewas M.P.','650785570740','CIPPP3813F',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8545,'1008545','EMP0008545',NULL,NULL,'INDAR','SINGH','PANWAR','1982-09-28','Male','9876541563',NULL,'abc@gmail.com','Vill.-Bakhedakotapai Post.-Rajoda Dist.-Dewas ',1,20,486,'Mumbai',455001,'Vill.-Bakhedakotapai Post.-Rajoda Dist.-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:22','2017-05-26 23:30:22',NULL,NULL,NULL,NULL),(8546,'1008546','EMP0008546',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-22','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8547,'1008547','EMP0008547',NULL,NULL,'DHANNALAL','BABULAL','KUMAWAT','1985-02-23','Male','9876541566',NULL,'abc@gmail.com','Bada Malsapura Post-Siya Dist-Dewas',1,20,486,'Mumbai',0,'Bada Malsapura Post-Siya Dist-Dewas','605009933284',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8548,'1008548','EMP0008548',NULL,NULL,'JAIPAL','INDER SINGH','RAJPUT','1981-06-27','Male','9876541567',NULL,'abc@gmail.com','88 Patel Nagar Bawadiya  Dewas',1,20,486,'Mumbai',455001,'88 Patel Nagar Bawadiya  Dewas ','693625769670',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8549,'1008549','EMP0008549',NULL,NULL,'DILIP','SHYAM SUNDAR','KATIYAR','1982-02-23','Male','9876541569',NULL,'abc@gmail.com','79 Gomti Nagar A.B.Road Dewas',1,20,486,'Mumbai',455001,'79 Gomti Nagar A.B.Road Dewas','256783002838',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8550,'1008550','EMP0008550',NULL,NULL,'HIMANSHU','LT. CHANDRAKANT','MISTRY','1987-09-18','Male','9876541570',NULL,'abc@gmail.com','29 B Amrat Nagar Behind Jawahar Nagar',1,20,486,'Mumbai',455001,'29 B Amrat Nagar Behind Jawahar Nagar','368678753828','BQSPM3951K',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8551,'1008551','EMP0008551',NULL,NULL,'NEERAJ','RAGHUNANDAN','PAINTER','1987-11-21','Male','9876541571',NULL,'abc@gmail.com','Nath Mohalla Bhawani Sagar Dewas',1,20,486,'Mumbai',455001,'Nath Mohalla Bhawani Sagar Dewas','556395866853',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8552,'1008552','EMP0008552',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-09','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8553,'1008553','EMP0008553',NULL,NULL,'RAJESH','DARIYAV SINGH','GOUD','1983-01-18','Male','9876541573',NULL,'abc@gmail.com','Kalu Khedi Dewas ',1,20,486,'Mumbai',455001,'Kalu Khedi Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8554,'1008554','EMP0008554',NULL,NULL,'MAHENDRA','LALJI','CHOUDHARY','1985-12-16','Male','9876541575',NULL,'abc@gmail.com','Vill-Puvalda Post-Singawda Dist-Dewas',1,20,486,'Mumbai',455001,'Vill-Puvalda Post-Singawda Dist-Dewas','982749748289',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8555,'1008555','EMP0008555',NULL,NULL,'VIKRAM','PRAKASH','SINGH','1989-08-06','Male','9876541577',NULL,'abc@gmail.com','212 Behind Ajay Restaurent Bawdiya  Dewas',1,20,486,'Mumbai',455001,'212 Behind Ajay Restaurent Bawdiya  Dewas','983749992707','CEUPS0602G',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8556,'1008556','EMP0008556',NULL,NULL,'RAM PRASAD','MADAN LAL','CHOUHAN','1990-08-09','Male','9876541578',NULL,'abc@gmail.com','36/3 Rewa Bag Dewas',1,20,486,'Mumbai',455001,'36/3 Rewa Bag Dewas','298673422257',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8557,'1008557','EMP0008557',NULL,NULL,'BADRILAL','NAGIRAM ','MALVIYA','1989-02-11','Male','9876541579',NULL,'abc@gmail.com','118/B,Pratap Nagar  Dewas    ',1,20,486,'Mumbai',455001,'118/B,Pratap Nagar  Dewas    ','732815569292',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8558,'1008558','EMP0008558',NULL,NULL,'SANDEEP','DINESH CHAND','VERMA','1984-03-17','Male','9876541580',NULL,'abc@gmail.com','Vill-Pipliya Sadak Dist.-Dewas',1,20,486,'Mumbai',455001,'Vill-Pipliya Sadak Dist.-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8559,'1008559','EMP0008559',NULL,NULL,'VINOD','RAM LAL','JAMLE','1982-11-01','Male','9876541581',NULL,'abc@gmail.com','Q.No.3392 Bnp Colony Dewas ',1,20,486,'Mumbai',455001,'Q.No.3392 Bnp Colony Dewas','985434925268','AQYPJ6293J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:23','2017-05-26 23:30:23',NULL,NULL,NULL,NULL),(8560,'1008560','EMP0008560',NULL,NULL,'SURESH','RAM KARAN','GOUTAM','1981-11-27','Male','9876541582',NULL,'abc@gmail.com','51 Chamunda Nagar Dewas',1,20,486,'Mumbai',455001,'51 Chamunda Nagar Dewas','308297272274','AYNPG5216B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8561,'1008561','EMP0008561',NULL,NULL,'RAKESH','MANGILAL','AGARWAL','1986-12-20','Male','9876541583',NULL,'abc@gmail.com','H.No.-56 Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'H.No.-56 Shankar Nagar Dewas','776313131105','BTWPR3735B',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8562,'1008562','EMP0008562',NULL,NULL,'VINOD','BANSILAL','PATEL','1985-12-17','Male','9876541585',NULL,'abc@gmail.com','Vill+Po-Rajoda Dist-Dewas',1,20,486,'Mumbai',0,'Vill+Po-Rajoda Dist-Dewas  Dewas  455001  Madhya Pradesh','555234375201','bippp0175b',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8563,'1008563','EMP0008563',NULL,NULL,'DHARMENDRA','BADRILAL','PATIDAR','1985-02-24','Male','9876541589',NULL,'abc@gmail.com','198 Vill.-Nayapura Th.-Bagli Dist.-Dewas',1,20,486,'Mumbai',455001,'146,LIG-VIKAS NAGAR DEWAS','561885267830',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8564,'1008564','EMP0008564',NULL,NULL,'BHAGWAN','SINGH','CHANDRAWAT','1984-04-02','Male','9876541591',NULL,'abc@gmail.com','24 Kartik Nagar Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'24 Kartik Nagar Dhacha Bhavan Dewas','473376192237','BWEPS6820D',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8565,'1008565','EMP0008565',NULL,NULL,'MOHANLAL','BHERULAL','NAGESH','1985-07-18','Male','9876541592',NULL,'abc@gmail.com','H.No. Medki Chack  Dewas ',1,20,486,'Mumbai',455001,'H.No. Medki Chack  Dewas','888651209414',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8566,'1008566','EMP0008566',NULL,NULL,'NEERAJ','RAMESHWAR','DUBEY','1982-01-17','Male','9876541593',NULL,'abc@gmail.com','31,B-Samrat Puri Colony Dewas',1,20,486,'Mumbai',455001,'31 B-Samrat Puri Colony Dewas','765805423034',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8567,'1008567','EMP0008567',NULL,NULL,'SURESH','MOHANLAL','VISHWAKARMA','1983-11-18','Male','9876541594',NULL,'abc@gmail.com','Jai Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'Jai Bajrang Nagar Dewas','803586954796',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8568,'1008568','EMP0008568',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-24','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8569,'1008569','EMP0008569',NULL,NULL,'MEHARBAN','MOHAN SINGH','SOLANKI','1983-07-05','Male','9876541597',NULL,'abc@gmail.com','Vill Khantaba  Dewas',1,20,486,'Mumbai',0,'Vill Khantaba  Dewas','273363617340',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8570,'1008570','EMP0008570',NULL,NULL,'JAWAHAR','MANOHARLAL ','SHARMA','1984-11-12','Male','9876541598',NULL,'abc@gmail.com','131 Shalini Road  Dewas',1,20,486,'Mumbai',455001,'11/2 AYODHYA KUTIR JEL ROAD DEWAS ','735100881688','DIRPS4618J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8571,'1008571','EMP0008571',NULL,NULL,'VISHAL','SHASHIKANT','KASHTURE','1981-10-29','Male','9876541599',NULL,'abc@gmail.com','41 C-Adarsh Nagar Dewas',1,20,486,'Mumbai',455001,'41 C-Adarsh Nagar Dewas','772884647760',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8572,'1008572','EMP0008572',NULL,NULL,'RAMESH','KANHAIYALAL','MALVIYA','1985-06-16','Male','9876541600',NULL,'abc@gmail.com','Vikas Nagar Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'Vikas Nagar Shankar Nagar Dewas','792337974607','BJTPB6312B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8573,'1008573','EMP0008573',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-11','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:24','2017-05-26 23:30:24',NULL,NULL,NULL,NULL),(8574,'1008574','EMP0008574',NULL,NULL,'SATISH','RAMNATH ','OKTE','1982-12-25','Male','9876541602',NULL,'abc@gmail.com','18-B Sayog Colony B.N.P. Road Dewas ',1,20,486,'Mumbai',0,'18-B Sayog Colony B.N.P. Road Dewas ','261795564184',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8575,'1008575','EMP0008575',NULL,NULL,'RANJEET','RAM CHANDRA','MOURYA','1984-11-20','Male','9876541603',NULL,'abc@gmail.com','C-5/117 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'C-5/117 Awas Nagar Dewas','0','CBDPM8590B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8576,'1008576','EMP0008576',NULL,NULL,'KALU','BANE','SINGH','1988-02-16','Male','9876541608',NULL,'abc@gmail.com','Barkheda Kotapai Post-Rajoda',1,20,486,'Mumbai',455001,'Barkheda Kotapai Post-Rajoda Dist-Dewas','278246972481',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8577,'1008577','EMP0008577',NULL,NULL,'MAJID','ABDUL ','KHAN','1982-10-22','Male','9876541609',NULL,'abc@gmail.com','7 Tilik Nagar Near Of Karmachari Colony Dewas',1,20,486,'Mumbai',0,'7 Tilik Nagar Near Of Karmachari Colony Dewas','545489327283','BCSPK3128E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8578,'1008578','EMP0008578',NULL,NULL,'RAJBABU','DHARU SINGH ','DANGI','1987-10-20','Male','9876541611',NULL,'abc@gmail.com','197 Shive Shakti Nagar Ujjain Road Dewas',1,20,486,'Mumbai',455001,'197 Shive Shakti Nagar Ujjain Road Dewas','501033430366',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8579,'1008579','EMP0008579',NULL,NULL,'NAMRATA','JAYWANT','GHARGE','1989-08-14','Female','9876541612',NULL,'abc@gmail.com','115  Anand Pura Mukti Marge Dewas',1,20,486,'Mumbai',0,'115  Anand Pura Mukti Marge Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8580,'1008580','EMP0008580',NULL,NULL,'PAWAN','CHHITARMAL','SHUKLA','1984-11-28','Male','9876541613',NULL,'abc@gmail.com','35-A Raja Bag Colony Ujjain Road Dewas',1,20,486,'Mumbai',0,'35-A Raja Bag Colony Ujjain Road Dewas','936686999126','DSRPS8059H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8581,'1008581','EMP0008581',NULL,NULL,'RAJENDRA','JAGDISH CHANDRA','RANAVAT','1985-01-23','Male','9876541614',NULL,'abc@gmail.com','205/16 E.W.S JAI PRAKASH NAGER DEWAS M.P.',1,20,486,'Mumbai',455001,'205/16 E.W.S JAI PRAKASH NAGER DEWAS M.P.','282245208621','AYVPR1314F',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8582,'1008582','EMP0008582',NULL,NULL,'PANKAJ','GULAB RAO','DHARSE','1983-06-11','Male','9876541615',NULL,'abc@gmail.com','226 B Rani Bag Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'226 B Rani Bag Dewas','735508133297','BRWPD8276K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8583,'1008583','EMP0008583',NULL,NULL,'MEHARBAN','NAGJIRAM','MALVIYA','1988-08-19','Male','9876541616',NULL,'abc@gmail.com','118/B-Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'118/B-Pratap Nagar Dewas','524678658833','DFPPS8042H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8584,'1008584','EMP0008584',NULL,NULL,'RAMASHANKAR','BHIKHARI','YADAV','1988-09-04','Male','9876541617',NULL,'abc@gmail.com','14 Panchshil Nagar Vanmandal Dewas',1,20,486,'Mumbai',455001,'14 Panchshil Nagar Vanmandal Dewas ','750041898420','ACLPY6016H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8585,'1008585','EMP0008585',NULL,NULL,'SANJAY','GOPAL ','PANCHAL','1990-01-29','Male','9876541619',NULL,'abc@gmail.com','307 Mendhaki Chakk Dewas',1,20,486,'Mumbai',455001,'307 Mendhaki Chakk Dewas','853217911527','BUPPP1454H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:25','2017-05-26 23:30:25',NULL,NULL,NULL,NULL),(8586,'1008586','EMP0008586',NULL,NULL,'JUGAL','MADANLAL','CHOUDHARY','1985-09-28','Male','9876541620',NULL,'abc@gmail.com','21 Kamla Kunj Colony Dewas',1,20,486,'Mumbai',455001,'21 Kamla Kunj Colony Dewas','933474715647','awlpj4386p',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8587,'1008587','EMP0008587',NULL,NULL,'RAHUL','GHANSHYAM ','MOURYA','1990-11-13','Male','9876541622',NULL,'abc@gmail.com','51 Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'51 Pratap Nagar Dewas ','594997856509','BPGPM2896Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8588,'1008588','EMP0008588',NULL,NULL,'HARIOM','MAHESH','SONI','1982-03-04','Male','9876541623',NULL,'abc@gmail.com','09- Suraj Nagar Near Kela Devi Temple',1,20,486,'Mumbai',0,'09- Suraj Nagar Near Kela Devi Temple','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8589,'1008589','EMP0008589',NULL,NULL,'IRFAN','RAFIK','ABBASI','1983-11-02','Male','9876541628',NULL,'abc@gmail.com','Bawadi Khet Colony Dewas',1,20,486,'Mumbai',455001,'Bawadi Khet Colony Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8590,'1008590','EMP0008590',NULL,NULL,'HANSRAJ','FHEKU','SHARMA','1983-12-28','Male','9876541629',NULL,'abc@gmail.com','Vikas Nagar Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8591,'1008591','EMP0008591',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-15','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8592,'1008592','EMP0008592',NULL,NULL,'SACHIN','PARMANAND','PATEL','1988-02-17','Male','9876541632',NULL,'abc@gmail.com','336 Trilok Nagar Dewas',1,20,486,'Mumbai',0,'336 Trilok Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8593,'1008593','EMP0008593',NULL,NULL,'SANTOSH','GOPAL KRISHNA','SHRIVASTAVA','1989-12-12','Male','9876541633',NULL,'abc@gmail.com','Mendhki Road Civil Line Dewas ',1,20,486,'Mumbai',0,'Mendhki Road Civil Line Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8594,'1008594','EMP0008594',NULL,NULL,'RAKESH','SARDAR SINGH','CHOUDHARY','1981-02-07','Male','9876541634',NULL,'abc@gmail.com','Vll-Puwalda Post-Singawda  Dewas',1,20,486,'Mumbai',0,'Vll-Puwalda Post-Singawda  Dewas','388667456699',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8595,'1008595','EMP0008595',NULL,NULL,'KAMAL','AMBARAMJI','PANCHAL','1989-05-18','Male','9876541635',NULL,'abc@gmail.com','39-A-Kalani Bagh A.B.Road Dewas ',1,20,486,'Mumbai',455001,'39-A-Kalani Bagh A.B.Road Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8596,'1008596','EMP0008596',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-27','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8597,'1008597','EMP0008597',NULL,NULL,'GORISHANKAR','LT.JAGANNATH','PRAJAPATI','1990-06-06','Male','9876541638',NULL,'abc@gmail.com','Vill-Barotha Th-Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas ','778551506011','DCMPP3852G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:26','2017-05-26 23:30:26',NULL,NULL,NULL,NULL),(8598,'1008598','EMP0008598',NULL,NULL,'KUNAL','ASHOK','WANKHEDE','1990-04-19','Male','9876541639',NULL,'abc@gmail.com','24-B Kalani Bag Dewas',1,20,486,'Mumbai',455001,'24-B Kalani Bag Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8599,'1008599','EMP0008599',NULL,NULL,'JAGDISH','DARIYAV SINGH','CHOUDHARY','1981-05-28','Male','9876541641',NULL,'abc@gmail.com','H.No.-4,Jay Shri Nagar Dewas',1,20,486,'Mumbai',455001,'H.No.-4 Jay Shri Nagar Dewas','703229303004',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8600,'1008600','EMP0008600',NULL,NULL,'SUNIL','RAM CHANDRA JI','CHOUHAN','1989-10-17','Male','9876541642',NULL,'abc@gmail.com','418 Bherugardh Dewas',1,20,486,'Mumbai',455001,'Bherugardh Dewas','373936313037',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8601,'1008601','EMP0008601',NULL,NULL,'MANISH','SUNDAR LAL ','JOSHI','1986-03-07','Male','9876541643',NULL,'abc@gmail.com','Vill-Nipaniya Hur Hur Th-Sonkachh',1,20,486,'Mumbai',0,'76 B JAI SHRI NAGER DEWAS M.P.','315567313857',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8602,'1008602','EMP0008602',NULL,NULL,'PANKAJ','SATYANARAYAN','MALVIYA','1988-08-11','Male','9876541645',NULL,'abc@gmail.com','57/1 Malipura Dewas',1,20,486,'Mumbai',455001,'57/1 Malipura Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8603,'1008603','EMP0008603',NULL,NULL,'DEEPAK','RAM CHANDRA','CHOUHAN','1989-09-15','Male','9876541646',NULL,'abc@gmail.com','25 Bada Bajar Dewas',1,20,486,'Mumbai',455001,'25 Bada Bajar Dewas','31483500896',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8604,'1008604','EMP0008604',NULL,NULL,'PANKAJ','DEVI SINGH','YADAV','1989-10-25','Male','9876541647',NULL,'abc@gmail.com','23 Subhargi Marg Bhawrasa  Dewas',1,20,486,'Mumbai',455001,'23 Subhargi Marg Bhawrasa  Dewas','668606029851',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8605,'1008605','EMP0008605',NULL,NULL,'SNEHAL','SUNIL','DESAI','1987-03-18','Male','9876541648',NULL,'abc@gmail.com','D1/64 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D1/64 Awas Nagar Dewas','490684236894',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8606,'1008606','EMP0008606',NULL,NULL,'DEEP','PREM SINGH','JADONE','1982-12-27','Male','9876541650',NULL,'abc@gmail.com','172 Nipaniya Hur Hur Th-Sonkatch  Dewas',1,20,486,'Mumbai',455001,'258 Dhancha Bhavan Sun City -2 Dewas','885135147405','AZXPJ9445N',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8607,'1008607','EMP0008607',NULL,NULL,'SADIK','HUSSEN ','KHAN','1989-12-28','Male','9876541653',NULL,'abc@gmail.com','290 Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'290 Pushpkunj Colony Itawa Dewas','509726792925','CKWPK7530F',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8608,'1008608','EMP0008608',NULL,NULL,'JITENDRA','JAWAHARLAL','SHARMA','1981-12-13','Male','9876541654',NULL,'abc@gmail.com','59 A/2 Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'59 A/2 Pratap Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8609,'1008609','EMP0008609',NULL,NULL,'NARENDRA','LAKHAN LAL','YADAV','1984-10-11','Male','9876541655',NULL,'abc@gmail.com','223 Ganga Nagar A.B.Road Dewas ',1,20,486,'Mumbai',455001,'223,Ganga Nagar A.B.Road Dewas','323279391061',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8610,'1008610','EMP0008610',NULL,NULL,'SACHIN','RAJENDRA','PATEL','1981-06-07','Male','9876541656',NULL,'abc@gmail.com','Vill-Rabadiya Post-Siya  Dewas ',1,20,486,'Mumbai',455001,'Vill-Rabadiya Post-Siya  Dewas','968172292768',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8611,'1008611','EMP0008611',NULL,NULL,'PRADEEP','SHARAD','KUMAR','1981-12-08','Male','9876541657',NULL,'abc@gmail.com','Ews-439  Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'Ews-439  Vikasnagar  Dewas','542596520739',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8612,'1008612','EMP0008612',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-10','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 23:30:27','2017-05-26 23:30:27',NULL,NULL,NULL,NULL),(8613,'1008613','EMP0008613',NULL,NULL,'SHIVNARAYAN','SIDDUJI','PANWAR','1987-03-26','Male','9876541662',NULL,'abc@gmail.com','Vill-Mudka Post-Patlawda Th-Dewas',1,20,486,'Mumbai',0,'Vill-Mudka Post-Patlawda Th-Dewas ','598144240671',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8614,'1008614','EMP0008614',NULL,NULL,'GANESH','VAMAN RAO','PATIL','1988-06-08','Male','9876541663',NULL,'abc@gmail.com','614-Ews Vikas Nagar Dewas',1,20,486,'Mumbai',455001,'614-Ews Vikas Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8615,'1008615','EMP0008615',NULL,NULL,'RAJESH','MANGILAL','SUNARTIYA','1990-08-25','Male','9876541664',NULL,'abc@gmail.com','Lig-133 Mukharji Nagar Dewas  ',1,20,486,'Mumbai',455001,'Lig-133 Mukharji Nagar Dewas','984298135716',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8616,'1008616','EMP0008616',NULL,NULL,'AMIT','RAMPREET','PRASAD','1982-02-02','Male','9876541665',NULL,'abc@gmail.com','81 Ram Chandra Nagar Dewas ',1,20,486,'Mumbai',455001,'81 Ram Chandra Nagar Dewas','372752931455',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8617,'1008617','EMP0008617',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-05','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8618,'1008618','EMP0008618',NULL,NULL,'LOKENDRA','GHANSHYAM','SONI','1984-04-26','Male','9876541667',NULL,'abc@gmail.com','B-26 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'B-26 Awas Nagar Dewas','737171807327','GMBPS1510N',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8619,'1008619','EMP0008619',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-26','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8620,'1008620','EMP0008620',NULL,NULL,'SANJAY','BALDEV SINGH','PARMAR','1982-05-23','Male','9876541672',NULL,'abc@gmail.com','C4/58 Awas Nagar Dewas ',1,20,486,'Mumbai',455001,'C4/58 Awas Nagar Dewas ','864388605416',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8621,'1008621','EMP0008621',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-28','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8622,'1008622','EMP0008622',NULL,NULL,'AJAY','MURLIDHAR','JOSHI','1988-03-28','Male','9876541674',NULL,'abc@gmail.com','99 Madhuban Colony Dewas',1,20,486,'Mumbai',455001,'99 Madhuban Colony Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8623,'1008623','EMP0008623',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-29','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8624,'1008624','EMP0008624',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-04-04','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8625,'1008625','EMP0008625',NULL,NULL,'TARKESHWAR','MAHANT','SINGH','1990-06-30','Male','9876541679',NULL,'abc@gmail.com','Ews-509 Jai Prakash Nagar Dhancha Bhavan Dewas',1,20,486,'Mumbai',455001,'Ews-509 Jai Prakash Nagar Dhancha Dewas','688359226864',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:28','2017-05-26 23:30:28',NULL,NULL,NULL,NULL),(8626,'1008626','EMP0008626',NULL,NULL,'MUKESH','KESHARAM','HARODE','1981-07-22','Male','9876541680',NULL,'abc@gmail.com','40 Khari Bawadi Ke Paas Dewas',1,20,486,'Mumbai',455001,'40 Khari Bawadi Ke Paas Dewas','245356900117','ABQPH9990P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8627,'1008627','EMP0008627',NULL,NULL,'RAM ','CHANDRA','VERMA','1981-10-26','Male','9876541681',NULL,'abc@gmail.com','Bawadiya Patel Nagar Dewas',1,20,486,'Mumbai',0,'Bawadiya Patel Nagar Dewas ','945290539641',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8628,'1008628','EMP0008628',NULL,NULL,'MAHESH','DAS','BAIRAGI','1981-08-14','Male','9876541682',NULL,'abc@gmail.com','Pratap Nagar Dewas ',1,20,486,'Mumbai',455001,'Pratap Nagar Dewas ','928912280573','CJOPB1304B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8629,'1008629','EMP0008629',NULL,NULL,'SURESH','SUHAGMAL','MAHESHVARI','1986-11-18','Male','9876541683',NULL,'abc@gmail.com','Amona Dewas',1,20,486,'Mumbai',455001,'Amona Dewas  ','454999652891',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8630,'1008630','EMP0008630',NULL,NULL,'GAJRAJ','MAAN SINGH','DODIYA','1982-01-06','Male','9876541685',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas',1,20,486,'Mumbai',0,'Vill-Khajuriya Jagir Dist-Dewas','996960259988',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8631,'1008631','EMP0008631',NULL,NULL,'ARPIT','AKHILESH','JOSHI','1981-04-12','Male','9876541686',NULL,'abc@gmail.com','114 Gotam Nagar Dewas',1,20,486,'Mumbai',455001,'114 Gotam Nagar Dewas','498206284161','alwpj6297p',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8632,'1008632','EMP0008632',NULL,NULL,'RAVJEE','MAAN SINGH','RATHORE','1983-07-29','Male','9876541687',NULL,'abc@gmail.com','229 Pratap Nagar Dewas ',1,20,486,'Mumbai',455001,'229 Pratap Nagar Dewas','384974484501',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8633,'1008633','EMP0008633',NULL,NULL,'GOPAL','LAXMAN','MAHTO','1982-02-24','Male','9876541688',NULL,'abc@gmail.com','Moti Banglow Dewas',1,20,486,'Mumbai',0,'Moti Banglow Dewas','945820910895','CNCPK2430B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8634,'1008634','EMP0008634',NULL,NULL,'AMARLAL','BAL CHAND','RAJORIYA','1981-11-28','Male','9876541689',NULL,'abc@gmail.com','Vill-Birakhedi Dist-Dewas ',1,20,486,'Mumbai',455001,'Vill-Birakhedi Dist-Dewas','951763566084',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:29','2017-05-26 23:30:29',NULL,NULL,NULL,NULL),(8635,'1008635','EMP0008635',NULL,NULL,'RAJESH','RAM CHANDRA','VERMA','1989-04-24','Male','9876541690',NULL,'abc@gmail.com','375 Patel Nagar Dewas ',1,20,486,'Mumbai',455001,'375 Patel Nagar Dewas','590136092744',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8636,'1008636','EMP0008636',NULL,NULL,'SURENDRA','DEVI PRASAD','YADAV','1982-03-19','Male','9876541691',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8637,'1008637','EMP0008637',NULL,NULL,'RAJESH','RAMESH CHANDRA','BAROD','1989-10-01','Male','9876541692',NULL,'abc@gmail.com','293 Durga Colony Amona Dewas',1,20,486,'Mumbai',0,'293 Durga Colony Amona Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8638,'1008638','EMP0008638',NULL,NULL,'MUNNALAL','DHANNALAL',' ','1981-10-02','Male','9876541693',NULL,'abc@gmail.com','Vill-Singawda Dist-Dewas ',1,20,486,'Mumbai',0,'Vill-Singawda Dist-Dewas','32075735284',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8639,'1008639','EMP0008639',NULL,NULL,'MUKESH','HEERASINGH','TAVAR','1985-07-26','Male','9876541694',NULL,'abc@gmail.com','Baman Kheda Dist-Dewas',1,20,486,'Mumbai',0,'Baman Kheda Dist-Dewas','690814324505',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8640,'1008640','EMP0008640',NULL,NULL,'ANAND','KACHRULAL','CHOUHAN','1982-12-09','Male','9876541696',NULL,'abc@gmail.com','Vill-Gorkhedi Th-Dewas',1,20,486,'Mumbai',455001,'Jaishiv Colony Bhopal Road Dewas ','593198032257',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8641,'1008641','EMP0008641',NULL,NULL,'JITENDRA','JAGDISH','JAISWAL','1981-09-11','Male','9876541698',NULL,'abc@gmail.com','229 Arjun Nagar Itawa  Dewas  ',1,20,486,'Mumbai',455001,'229 Arjun Nagar Itawa  Dewas','772076273684','AJLPJ1551H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8642,'1008642','EMP0008642',NULL,NULL,'AJAY','RAM KISHAN','SHARMA','1986-07-13','Male','9876541699',NULL,'abc@gmail.com','38 Bajrang Colony Kalu Khedi Dewas',1,20,486,'Mumbai',455001,'38 Bajrang Colony Kalu Khedi Dewas','312175456937',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8643,'1008643','EMP0008643',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-14','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8644,'1008644','EMP0008644',NULL,NULL,'BABULAL','BHAGIRATH ','SHARMA','1983-12-20','Male','9876541701',NULL,'abc@gmail.com','Patel Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Patel Nagar Bawadiya Dewas  ','951408667962',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8645,'1008645','EMP0008645',NULL,NULL,'MAHESH','BALUJI','RAJORIYA','1981-04-20','Male','9876541702',NULL,'abc@gmail.com','Vill-Borkhedi Th-Dewas',1,20,486,'Mumbai',455001,'Vill-Borkhedi Th-Dewas','850684841265',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,NULL,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8646,'1008646','EMP0008646',NULL,NULL,'GAJENDRA','INDAR SINGH','TANWAR','1985-07-10','Male','9876541703',NULL,'abc@gmail.com','94 Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'94 Pratap Nagar Dewas','595674640218','FOBPS9146M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8647,'1008647','EMP0008647',NULL,NULL,'RISHABH','MADAN','DODIYA','1984-06-13','Male','9876541706',NULL,'abc@gmail.com','BADABAZAR MALI GALI DEWAS M P',1,20,486,'Mumbai',455001,'BADABAZAR MALI GALI DEWAS M P','541110585259','CDMPD9797A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:30','2017-05-26 23:30:30',NULL,NULL,NULL,NULL),(8648,'1008648','EMP0008648',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-09','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8649,'1008649','EMP0008649',NULL,NULL,'JEEVAN','JAGDISH','JAISWAL','1982-11-09','Male','9876541708',NULL,'abc@gmail.com','Arjun Nagar Itawa Dewas',1,20,486,'Mumbai',455001,'Arjun Nagar Itawa Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8650,'1008650','EMP0008650',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-22','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8651,'1008651','EMP0008651',NULL,NULL,'JITENDRA','DIWAKAR','VIKHAR','1982-01-07','Male','9876541710',NULL,'abc@gmail.com','Hate Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'Hate Singh Goyal Colony Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8652,'1008652','EMP0008652',NULL,NULL,'RAHUL','NAGULAL JI','JANOLIYA','1986-08-22','Male','9876541711',NULL,'abc@gmail.com','8 Hariom Nagar Pratap Nagar Dewas',1,20,486,'Mumbai',455001,'8 Hariom Nagar Pratap Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8653,'1008653','EMP0008653',NULL,NULL,'YOGESH','DATTATRAY','JOSHI','1990-04-27','Male','9876541712',NULL,'abc@gmail.com','5 Agrasen Nagar Dewas  Dewas ',1,20,486,'Mumbai',455001,'5 Agrasen Nagar Dewas','972418012319',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8654,'1008654','EMP0008654',NULL,NULL,'YOGESH','MARTANDRAV','CHOUHAN','1987-02-06','Male','9876541713',NULL,'abc@gmail.com','47 Indra Nagar Bnp Road Dewas',1,20,486,'Mumbai',455001,'47 Indra Nagar Bnp Road Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8655,'1008655','EMP0008655',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-11','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8656,'1008656','EMP0008656',NULL,NULL,'SATISH','SUNDAR LAL','YADAV','1982-09-05','Male','9876541716',NULL,'abc@gmail.com','Ews-131 Jawahar Nagar Dewas',1,20,486,'Mumbai',455001,'Ews-131 Jawahar Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8657,'1008657','EMP0008657',NULL,NULL,'MOHAN','LAXMAN SINGH','THAKUR','1981-06-28','Male','9876541717',NULL,'abc@gmail.com','Vill-Tonk Kala Th-Tonk Khurd Dist-Dewas',1,20,486,'Mumbai',0,'Vill-Tonk Kala Th-Tonk Khurd Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8658,'1008658','EMP0008658',NULL,NULL,'JEEVAN','RATANLAL','SURYAWANSHI','1982-04-05','Male','9876541719',NULL,'abc@gmail.com','158 Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'158 Mendhki Chakk Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8659,'1008659','EMP0008659',NULL,NULL,'KAMAL','CHHATAR SINGH','KUMAWAT','1983-10-17','Male','9876541720',NULL,'abc@gmail.com','126,Mendhki Chak Dewas',1,20,486,'Mumbai',455001,'126,Mendhki Chak Dewas','416004508419',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8660,'1008660','EMP0008660',NULL,NULL,'BHARAT','RAY SINGH','LODHI','1990-11-28','Male','9876541721',NULL,'abc@gmail.com','409 Tonk Kala Th-Tonk Khurd Dist-Dewas',1,20,486,'Mumbai',455001,'409 Tonk Kala Th-Tonk Khurd Dist-Dewas','614411230264',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8661,'1008661','EMP0008661',NULL,NULL,'RAHUL','RAMESH CHANDRA ','PATEL','1984-03-09','Male','9876541722',NULL,'abc@gmail.com','Vill-Barkheda Post-Chidawad Th-Tonk Khurd  Dewas',1,20,486,'Mumbai',0,'Vill-Barkheda Post-Chidawad Th-Tonk Khurd  Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8662,'1008662','EMP0008662',NULL,NULL,'SHOBHARAM','DAYARAM','DABI','1981-03-19','Male','9876541723',NULL,'abc@gmail.com','Nanda Nagar Mendhki Chak Dewas',1,20,486,'Mumbai',455001,'Nanda Nagar Mendhki Chak Dewas','586334178005','ASTPP9663M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:31','2017-05-26 23:30:31',NULL,NULL,NULL,NULL),(8663,'1008663','EMP0008663',NULL,NULL,'JITENDRA GANGARAM','GANGARAM','CHOUHAN','1990-07-08','Male','9876541724',NULL,'abc@gmail.com','H.No-12 Sajjan Singh Dewas',1,20,486,'Mumbai',455001,'H.No-12 Sajjan Singh Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8664,'1008664','EMP0008664',NULL,NULL,'YOGESH','SHYAMLAL','SONI','1990-03-18','Male','9876541725',NULL,'abc@gmail.com','Vill-Bagana Post-Agrod Th-Dewas',1,20,486,'Mumbai',0,'Vill-Bagana Post-Agrod Th-Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8665,'1008665','EMP0008665',NULL,NULL,'GYAN','SINGH','PATEL','1981-07-23','Male','9876541726',NULL,'abc@gmail.com','H.No-80 Dewas ',1,20,486,'Mumbai',0,'H.No-80 Dewas  Dewas','290618024077',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8666,'1008666','EMP0008666',NULL,NULL,'BHUVNESH','SUDHIR ','MULEY','1981-08-18','Male','9876541727',NULL,'abc@gmail.com','Lig-98 Jawahar Nagar Dewas',1,20,486,'Mumbai',455001,'Lig-98 Jawahar Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8667,'1008667','EMP0008667',NULL,NULL,'MANGESH','ISHWAR LAL','JHALAYA','1988-02-01','Male','9876541729',NULL,'abc@gmail.com','Vill-Devli Th-Tonk Khurd Post-Ranayal Kala  Dewas',1,20,486,'Mumbai',0,'Vill-Devli Th-Tonk Khurd Post-Ranayal Kala  Dewas','440830051317',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8668,'1008668','EMP0008668',NULL,NULL,'SUNIL ','JAGDISH','GURJAR','1987-05-21','Male','9876541730',NULL,'abc@gmail.com','131 Ews-Jawahar Nagar Dewas',1,20,486,'Mumbai',455001,'131 Ews-Jawahar Nagar Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8669,'1008669','EMP0008669',NULL,NULL,'YOGESHWAR','RAMBHAJAN SINGH','PRASAD','1982-08-21','Male','9876541731',NULL,'abc@gmail.com','217 Seth Mishrilal Nagar Ab Road Dewas',1,20,486,'Mumbai',455001,'217 Seth Mishrilal Nagar Ab Road Dewas','440350078389','citpp4591c',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8670,'1008670','EMP0008670',NULL,NULL,'SANJAY','CHANDRA SINGH','PARMAR','1981-03-03','Male','9876541733',NULL,'abc@gmail.com','4 B-Arjun Nagar Bnp Dewas',1,20,486,'Mumbai',455001,'4 B-Arjun Nagar Bnp Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8671,'1008671','EMP0008671',NULL,NULL,'MUKESH','GALYA','SINGARE','1986-04-24','Male','9876541734',NULL,'abc@gmail.com','28 Hariom Nagar, Pratap Nagar Dewas',1,20,486,'Mumbai',0,'28 Hariom Nagar, Pratap Nagar Dewas','356281588900',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8672,'1008672','EMP0008672',NULL,NULL,'KHUMAN','SINGH','NAGAR','1982-05-31','Male','9876541735',NULL,'abc@gmail.com','181 Mishrilal Nagar Ext.Dewas',1,20,486,'Mumbai',0,'181 Mishrilal Nagar Ext.Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8673,'1008673','EMP0008673',NULL,NULL,'SATISH','SATYANARAYAN','SHARMA','1986-01-18','Male','9876541736',NULL,'abc@gmail.com','Vill-Singawda Th-Dewas  Dewas',1,20,486,'Mumbai',0,'Vill-Singawda Th-Dewas','225819266441','GMBPS1917K',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8674,'1008674','EMP0008674',NULL,NULL,'ISHWAR','RATANLAL','HARAD','1982-02-18','Male','9876541737',NULL,'abc@gmail.com','17 Vill-Patlawda Dist-Dewas',1,20,486,'Mumbai',0,'17 Vill-Patlawda Dist-Dewas','495073778560',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:32','2017-05-26 23:30:32',NULL,NULL,NULL,NULL),(8675,'1008675','EMP0008675',NULL,NULL,'SUNIL','CHHAGANLAL ','TAKIYA','1981-07-25','Male','9876541738',NULL,'abc@gmail.com','Balgardh Chuna Khadan Dewas ',1,20,486,'Mumbai',455001,'Balgardh Chuna Khadan Dewas','654768885672',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8676,'1008676','EMP0008676',NULL,NULL,'BALRAM','BHANWAR ','SINGH','1984-02-06','Male','9876541739',NULL,'abc@gmail.com','726 Darji Mohalla Bolai Th-Gulana  Shajapur ',1,20,486,'Mumbai',455001,'EWS-476,VIKAS NAGAR DEWAS','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8677,'1008677','EMP0008677',NULL,NULL,'MAHENDRA','RAM SINGH','CHOUDHARY','1984-09-01','Male','9876541740',NULL,'abc@gmail.com','Vill-Puvalda Post-Singawda  Dewas',1,20,486,'Mumbai',455001,'Vill-Puvalda Post-Singawda  Dewas','982749748289',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8678,'1008678','EMP0008678',NULL,NULL,'MOHANLAL','MADANLAL','LAKHA','1984-06-05','Male','9876541741',NULL,'abc@gmail.com','Vill-Amona Dewas',1,20,486,'Mumbai',0,'Vill-Amona Dewas','639220476285',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8679,'1008679','EMP0008679',NULL,NULL,'NARENDRA','BANE SINGH','JADON','1984-11-04','Male','9876541742',NULL,'abc@gmail.com','Vikas Nagar Dewas',1,20,486,'Mumbai',455001,'Vikas Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8680,'1008680','EMP0008680',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-13','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8681,'1008681','EMP0008681',NULL,NULL,'HUKUM','SINGH','PATEL','1985-08-03','Male','9876541745',NULL,'abc@gmail.com','Mendhki Chakk Dewas ',1,20,486,'Mumbai',455001,'Mendhki Chakk Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8682,'1008682','EMP0008682',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-18','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8683,'1008683','EMP0008683',NULL,NULL,'SATISH','SANTOSH ','PARMAR','1987-04-19','Male','9876541747',NULL,'abc@gmail.com','Vill-Nosrabad Colony Dewas ',1,20,486,'Mumbai',455001,'Vill-Nosrabad Colony Dewas','289127900839',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8684,'1008684','EMP0008684',NULL,NULL,'RUHUL AMIN','BABBU','SHAIKH','1988-10-13','Male','9876541748',NULL,'abc@gmail.com','22 B.N.P Road Amir Compound Dewas',1,20,486,'Mumbai',455001,'22 B.N.P Road Amir Compound Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8685,'1008685','EMP0008685',NULL,NULL,'ATUL','LT.RADHESHYAM','SONI','1984-08-08','Male','9876541749',NULL,'abc@gmail.com','42/B Nimad Nagar Colony Dewas',1,20,486,'Mumbai',455001,'42/B Nimad Nagar Colony Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8686,'1008686','EMP0008686',NULL,NULL,'SANJAY ','RAGHUNATHSINGH','MALVIYA','1989-02-03','Male','9876541752',NULL,'abc@gmail.com','17 New Housing Bord Colony Dhancha Bhavan Dewas',1,20,486,'Mumbai',455001,'17 New Housing Bord Colony Dhancha Bhavan Dewas','420640037951','CUSPM8112K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8687,'1008687','EMP0008687',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-10','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:33','2017-05-26 23:30:33',NULL,NULL,NULL,NULL),(8688,'1008688','EMP0008688',NULL,NULL,'VISHAL','DULUCHAND','CHOUHAN','1985-11-15','Male','9876541754',NULL,'abc@gmail.com','H.No 1 Mataji Ki Pedhi Ke Pass Dewas',1,20,486,'Mumbai',455001,'H.No 1 Mataji Ki Pedhi Ke Pass Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8689,'1008689','EMP0008689',NULL,NULL,'NIKHIL','OMPRKASH','KHATWA','1984-07-31','Male','9876541755',NULL,'abc@gmail.com','165 Laxman Nagar Dewas  Dewas',1,20,486,'Mumbai',0,'165 Laxman Nagar Dewas','798788635675','DDTPK6489L',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8690,'1008690','EMP0008690',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-04-02','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8691,'1008691','EMP0008691',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-06','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8692,'1008692','EMP0008692',NULL,NULL,'VAMAN','NAMDEV','RAO','1988-06-24','Male','9876541760',NULL,'abc@gmail.com','Gopal Nagar Itawa Dewas',1,20,486,'Mumbai',455001,'Gopal Nagar Itawa Dewas ','722825553072',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8693,'1008693','EMP0008693',NULL,NULL,'NARENDRA','RAMCHANDRA',' ','1981-06-29','Male','9876541762',NULL,'abc@gmail.com','Laxmi Bai Marg Bhagwati Saray Dewas',1,20,486,'Mumbai',455001,'Laxmi Bai Marg Bhagwati Saray Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8694,'1008694','EMP0008694',NULL,NULL,'VIJAY','KISHNAJI RAUT','RAUT','1984-05-28','Male','9876541763',NULL,'abc@gmail.com','298 Shiv Shakti Nagar Dewas',1,20,486,'Mumbai',455001,'298 Shiv Shakti Nagar Dewas','622332716917','BKGPR1239H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8695,'1008695','EMP0008695',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-12-03','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8696,'1008696','EMP0008696',NULL,NULL,'RAJESH','SUKHDEV','RAJPUT','1990-07-16','Male','9876541765',NULL,'abc@gmail.com','47 Jitmal Nagar Dewas',1,20,486,'Mumbai',455001,'47 Jitmal Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8697,'1008697','EMP0008697',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-15','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8698,'1008698','EMP0008698',NULL,NULL,'PRABHULAL','SHANKARLAL','JHALA','1985-04-29','Male','9876541770',NULL,'abc@gmail.com','1 Hariom Nagar Pratap Nagar Ke Pass Dewas',1,20,486,'Mumbai',455001,'1 Hariom Nagar Pratap Nagar Ke Pass Dewas','328371135416','CYSPP4719H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8699,'1008699','EMP0008699',NULL,NULL,'VISHVANATH','SANTRAM',' ','1986-02-11','Male','9876541772',NULL,'abc@gmail.com','24/9 Malhar Road Gali No-1  Dewas ',1,20,486,'Mumbai',455001,'24/9 Malhar Road Gali No-1  Dewas','279889090389',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8700,'1008700','EMP0008700',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-20','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8701,'1008701','EMP0008701',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-11-01','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:34','2017-05-26 23:30:34',NULL,NULL,NULL,NULL),(8702,'1008702','EMP0008702',NULL,NULL,'ROHIT','HEMANT','SHALIGRAM','1982-08-03','Male','9876541779',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas M.P.',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','0','FDZPS7320N',NULL,'UnMarried',5,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8703,'1008703','EMP0008703',NULL,NULL,'SANDEEP',NULL,'PATIDAR','1983-05-10','Male','9876541780',NULL,'abc@gmail.com','198,Ganga Nagar Dewas ',1,20,486,'Mumbai',455001,'198,Ganga Nagar Dewas  Dewas  455001  Madhya Pradesh','688402932831',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8704,'1008704','EMP0008704',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-09-03','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8705,'1008705','EMP0008705',NULL,NULL,'SHYAM',NULL,'CHOUHAN','1982-07-12','Male','9876541782',NULL,'abc@gmail.com','Puspakunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Puspakunj Colony Itawa Dewas','918287925710',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8706,'1008706','EMP0008706',NULL,NULL,'YOGESH',NULL,'PARMAR','1990-06-22','Male','9876541783',NULL,'abc@gmail.com','C-6/96,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'C-6/96,Awas Nagar Dewas','559927834741',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8707,'1008707','EMP0008707',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-13','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8708,'1008708','EMP0008708',NULL,NULL,'RAHUL','KUMAR','VERMA','1982-04-21','Male','9876541785',NULL,'abc@gmail.com','Vill-Pipliya Baskus Dist-Dewas',1,20,486,'Mumbai',455001,'Vill-Pipliya Baskus Dist-Dewas','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8709,'1008709','EMP0008709',NULL,NULL,'NIRALA','SINGH',NULL,'1985-05-15','Male','9876541786',NULL,'abc@gmail.com','2,Mig-Jay Prakash Nagar Dewas',1,20,486,'Mumbai',455001,'2,Mig-Jay Prakash Nagar Dewas','398229468765',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8710,'1008710','EMP0008710',NULL,NULL,'DINESH','RAMAJI','PATEL','1982-11-15','Male','9876541787',NULL,'abc@gmail.com','Vill-Chalani Th-Sardar Pur ',1,20,486,'Mumbai',0,'DURGA COLONY AMONA DEWAS','227455837333',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8711,'1008711','EMP0008711',NULL,NULL,'DILAWAR','DARIYAV','SINGH','1989-04-16','Male','9876541788',NULL,'abc@gmail.com','Lodhi Mohalla Pithampur  Dhar M.P',1,20,486,'Mumbai',0,'Bhandari Hospital Madhumilan Dewas','290591296482',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8712,'1008712','EMP0008712',NULL,NULL,'GABBAR','DOULAT','SOLANKI','1981-07-01','Male','9876541789',NULL,'abc@gmail.com','Sulangaw Th-Dharampuri  Dhar',1,20,486,'Mumbai',0,'Sulangaw Th-Dharampuri  Dhar','0','fzzps4403l',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8713,'1008713','EMP0008713',NULL,NULL,'JAWAHAR SINGH','RAMPYARE',NULL,'1985-10-14','Male','9876541808',NULL,'abc@gmail.com','Vill.-Gorsera Post.-Gorsera',1,20,486,'Mumbai',0,'17 Laxman Nagar Dewas','617900524975',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8714,'1008714','EMP0008714',NULL,NULL,'SAKET','ISHWAR LAL','SAHU','1981-10-05','Male','9876541810',NULL,'abc@gmail.com','Vidhyarti Nagar By Pass Road Guna',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','741717491963','DOSPS6179P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8715,'1008715','EMP0008715',NULL,NULL,'PIYUSH','SHIVNATH','SHARMA','1981-04-28','Male','9876541819',NULL,'abc@gmail.com','Gour Colony Malakhedi Hoshangabad',1,20,486,'Mumbai',0,'Gour Colony Malakhedi Hoshangabad Madhya Pradesh','410678048130',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:35','2017-05-26 23:30:35',NULL,NULL,NULL,NULL),(8716,'1008716','EMP0008716',NULL,NULL,'AMIT','DINKAR','PACHADE','1982-07-18','Male','9876541820',NULL,'abc@gmail.com','Rb Ii 360 Id Azad Nagar New Yard Itarsi  Hoshangabad',1,20,486,'Mumbai',0,'MIG 19, VIKAS NAGAR ,DEWAS','925585197541',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8717,'1008717','EMP0008717',NULL,NULL,'AKHILESH','RAJDEV ','SINGH','1988-04-29','Male','9876541843',NULL,'abc@gmail.com','95 C Vaishali Nagar  INDORE',1,20,486,'Mumbai',0,'95 C Vaishali Nagar INDORE','501440884534','clcps0957h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8718,'1008718','EMP0008718',NULL,NULL,'PRAFULLA','KUMAR','NILOSEY','1981-06-23','Male','9876541844',NULL,'abc@gmail.com','ABC',1,20,486,'Mumbai',0,'205 ALMAS SOLITAIRE 576 MG ROAD INDORE ','997614968177','AAQPN5804K',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8719,'1008719','EMP0008719',NULL,NULL,'ROHIT','HUKUM','DHAKETA','1987-04-27','Male','9876541845',NULL,'abc@gmail.com','989 dwarakapuri colony indore m.p.',1,20,486,'Mumbai',0,'989,dawrakapuri colony indore m.p','296358064627',NULL,'5311310000173500','UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8720,'1008720','EMP0008720',NULL,NULL,'SANCHIT','SANJAY','BAWEJA','1981-11-22','Male','9876541846',NULL,'abc@gmail.com','114,RAVINDRA NAGAR INDORE',1,20,486,'Mumbai',0,'114,RAVINDRA NAGAR INDORE','300503291411','BBLPB5124R',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8721,'1008721','EMP0008721',NULL,NULL,'D','S','Sreenivas','1987-02-14','Male','9876541847',NULL,'abc@gmail.com','Indore',1,20,486,'Mumbai',0,NULL,'880648065635','AHUPD8496J',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8722,'1008722','EMP0008722',NULL,NULL,'GAURAV ','GORDHAN ','KHANDELWAL','1982-07-26','Male','9876541849',NULL,'abc@gmail.com','42 parichayika nagar tilak nagar indore',1,20,486,'Mumbai',0,'42 parichayika nagar tilak nagar indore','283684697866','BJWPK9334F',NULL,'Married',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8723,'1008723','EMP0008723',NULL,NULL,'LAKHAN','GANGARAM','YADAV','1987-09-26','Male','9876541850',NULL,'abc@gmail.com','DHAR ROAD BETMA, INDORE',1,20,486,'Mumbai',453001,'DHAR ROAD BETMA, INDORE','807519238408',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8724,'1008724','EMP0008724',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-05','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8725,'1008725','EMP0008725',NULL,NULL,'VINOD','MANOHARLAL','JAIN','1982-04-23','Male','9876541860',NULL,'abc@gmail.com','219 Goyal Nagar Indore ',1,20,486,'Mumbai',0,'219 Goyal Nagar Indore ','897037415772','ABGPJ2858J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8726,'1008726','EMP0008726',NULL,NULL,'RANJEET','SINGH','MANDLOI','1989-11-26','Male','9876541861',NULL,'abc@gmail.com','7/50 Sagoar Road Betma Indore M.P.',1,20,486,'Mumbai',0,'7/50 Sagoar Road Betma Indore ','644353573475','AOSPM4240C',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8727,'1008727','EMP0008727',NULL,NULL,'PRABHULAL','PREM SINGH','BAROD','1985-06-08','Male','9876541862',NULL,'abc@gmail.com','Vill-Sunala Th-Depal Pur Dist-Indore',1,20,486,'Mumbai',0,'NIRMAN NAGAR ITAWA Dewas  455001  Madhya Pradesh','954621407299',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8728,'1008728','EMP0008728',NULL,NULL,'DARIYAV','RAMAJI','SINGH','1982-12-11','Male','9876541863',NULL,'abc@gmail.com','Pithampur Dhar',1,20,486,'Mumbai',0,'Bhandari Colony Dewas','740729983963',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8729,'1008729','EMP0008729',NULL,NULL,'KISHORE','GENDALAL ','PANCHAL','1988-07-02','Male','9876541865',NULL,'abc@gmail.com','93 Mehta Garden Mhow Indore',1,20,486,'Mumbai',0,'93 Mehta Garden Mhow Indore','201497615638','ANRPP1146T',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:36','2017-05-26 23:30:36',NULL,NULL,NULL,NULL),(8730,'1008730','EMP0008730',NULL,NULL,'MUKESH','MURLIDHAR','KAMLE','1988-02-25','Male','9876541871',NULL,'abc@gmail.com','215  Roshanpura  Maho  Mehkar (m.p)',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','583575812974','0','0','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8731,'1008731','EMP0008731',NULL,NULL,'PRADEEP','ABHAY KUMAR','JAIN','1987-11-13','Male','9876541874',NULL,'abc@gmail.com','33,Kalyan Mill Main Road Indore',1,20,486,'Mumbai',0,'33 Kalyan Mill Main Road Indore','0',NULL,'MP09R-2012-0629053','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8732,'1008732','EMP0008732',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-13','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8733,'1008733','EMP0008733',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-23','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8734,'1008734','EMP0008734',NULL,NULL,'KARTIK','MUKESH LAAD','LAAD','1987-04-10','Male','9876541877',NULL,'abc@gmail.com','1167 Scheme 114 Part A Indore',1,20,486,'Mumbai',455001,'1167 Scheme 114 Part A Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8735,'1008735','EMP0008735',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-21','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8736,'1008736','EMP0008736',NULL,NULL,'RAJESH',' ','NILOSEY','1983-10-03','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8737,'1008737','EMP0008737',NULL,NULL,'CHANDRA','SINGH','BABEL','1988-03-04','Male','9876541880',NULL,'abc@gmail.com','Indore',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8738,'1008738','EMP0008738',NULL,NULL,'KAUSHIK','NARAYAN','GHOSH','1982-09-20','Male','9876541882',NULL,'abc@gmail.com','7/A Hig Behind Dena Bank Bapat Chouraha Sukhliya  Indore',1,20,486,'Mumbai',0,'7/A Hig Behind Dena Bank Bapat Chouraha Sukhliya  Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8739,'1008739','EMP0008739',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-13','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8740,'1008740','EMP0008740',NULL,NULL,' DEEPAK','OMPRAKASH','MULEWA','1982-02-26','Male','9876541906',NULL,'abc@gmail.com','132,SUBHASH MARG PETLAWAD JHABUA',1,20,486,'Mumbai',0,'132,SUBHASH MARG PETLAWAD JHABUA','712331542862',NULL,NULL,'Married',4,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8741,'1008741','EMP0008741',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-23','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8742,'1008742','EMP0008742',NULL,NULL,'NARPAT','KESHAR ','SINGH','1984-05-04','Male','9876541920',NULL,'abc@gmail.com','Ward No 13 Onkareshwar',1,20,486,'Mumbai',0,'IMLI CHOK BAWADIYA DEWAS','566111140694',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8743,'1008743','EMP0008743',NULL,NULL,'ASHOK','ABAJI RAO','GAIKWAD','1981-11-12','Male','9876541921',NULL,'abc@gmail.com','Vill-Kodiya Kheda Th-Harsud Dist-Khandwa ',1,20,486,'Mumbai',0,'207/8 MAHANKAL COLONY STI KAPARO ROAD DEWAS M.P.','487568975986','BGLPR8900G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:37','2017-05-26 23:30:37',NULL,NULL,NULL,NULL),(8744,'1008744','EMP0008744',NULL,NULL,'ASHUTOSH','DINKAR','GEETE','1981-07-09','Male','9876541923',NULL,'abc@gmail.com','MIG/A-184,RAM NAGAR KHANDWA',1,20,486,'Mumbai',0,'MIG/A-184,RAM NAGAR KHANDWA','878942465096','AQPG8828E',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8745,'1008745','EMP0008745',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-28','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8746,'1008746','EMP0008746',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-03-01','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8747,'1008747','EMP0008747',NULL,NULL,'GANESH','BABU SINGH','THAKUR','1983-10-25','Male','9876541927',NULL,'abc@gmail.com','Vill.-Keli Th.-Segav ',1,20,486,'Mumbai',0,'52 Mangal Murti Nagar Dewas','771626383015',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8748,'1008748','EMP0008748',NULL,NULL,'PRAKASH','GULAB CHAND','MEHRA','1983-01-09','Male','9876541928',NULL,'abc@gmail.com','Vill - Kodlakheri  Teh. - Maheshwar',1,20,486,'Mumbai',0,'Vill - Kodlakheri  Teh. - Maheshwar  Dist - Khargone','599020910265','BUAPM6448P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8749,'1008749','EMP0008749',NULL,NULL,'AZAL','SUBHODH','JOSHI','1981-11-06','Male','9876541929',NULL,'abc@gmail.com','36 Jain Mandir Path baki mata temple ke piche Khargone ',1,20,486,'Mumbai',451001,'MIG 19, VIKAS NAGAR ,DEWAS','541702800092',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8750,'1008750','EMP0008750',NULL,NULL,'MANSHARAM','DEVRAM','CHOUHAN','1985-03-12','Male','9876541930',NULL,'abc@gmail.com','41,PITMALI KHARGONE, PITAMALI',1,20,486,'Mumbai',0,'Jitmal Nagar Dewas  Dewas    Madhya Pradesh','483014458250',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8751,'1008751','EMP0008751',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-20','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8752,'1008752','EMP0008752',NULL,NULL,'MIHIR',NULL,'BARCHE','1985-03-28','Male','9876541932',NULL,'abc@gmail.com','85 SARASWATI NAGAR ',1,20,486,'Mumbai',451001,NULL,'0','BJRPB4018C',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8753,'1008753','EMP0008753',NULL,NULL,'THOMAS JOSEPH',NULL,NULL,'1988-09-28','Male','9876541953',NULL,'abc@gmail.com','Korandi Thara House Madappally Chry  (Via)Kottagan  ',1,20,486,'Mumbai',0,'A/150,KALANIBAG A.B.ROAD DEWAS','736732098270','ACRPJ8618G',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8754,'1008754','EMP0008754',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-26','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8755,'1008755','EMP0008755',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-05','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8756,'1008756','EMP0008756',NULL,NULL,'SAYAJI','BABU SAYAJI','VALUJ','1982-06-08','Male','9876541988',NULL,'abc@gmail.com','72 Ashok Samrat Chauk, Ghatkopar Mumbai ',1,20,486,'Mumbai',0,'72  Ashok Samrat Chauk Ghatkopar Mumbai','515375809097',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:38','2017-05-26 23:30:38',NULL,NULL,NULL,NULL),(8757,'1008757','EMP0008757',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-19','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8758,'1008758','EMP0008758',NULL,NULL,'NARBADI','PRASAD','VERMA','1990-09-10','Male','9876542001',NULL,'abc@gmail.com','Vill-Amganv Th-Gadarwara',1,20,486,'Mumbai',0,'Vill-Siya Dist-Dewas ','441907631041',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8759,'1008759','EMP0008759',NULL,NULL,'RAJARAM','HALKE','MEHRA','1989-03-23','Male','9876542002',NULL,'abc@gmail.com','3 Atathayasa Th-Gadaravara  Narsinghpur ',1,20,486,'Mumbai',0,'Sarvoday Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8760,'1008760','EMP0008760',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-14','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8761,'1008761','EMP0008761',NULL,NULL,'PUNIT',' KUMAR ','SINGH','1989-07-13','Male','9876542027',NULL,'abc@gmail.com','Vill-Dangavar Ps-Hussinabad Japla Palamu Jharkhand  Palamu   ',1,20,486,'Mumbai',0,'BHANDARI FOILS & TUBES LTD. DEWAS','511077020677','ERCPS0029C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8762,'1008762','EMP0008762',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-23','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8763,'1008763','EMP0008763',NULL,NULL,'VIRENDRA','SOWHAN SINGH','YADAV','1983-10-01','Male','9876542031',NULL,'abc@gmail.com','Vill-Katona Thana-Khushrupur Patna  ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  Dewas','616231713163',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8764,'1008764','EMP0008764',NULL,NULL,'RAJAVALLABH','CHANDRIKA','YADAV','1981-05-04','Male','9876542032',NULL,'abc@gmail.com','Vill-Jawar Pur Koriya Post-Jamui   ',1,20,486,'Mumbai',0,'Bawadiya Dewas  Dewas  455001  Madhya Pradesh','443925734728','ANPPY8296A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8765,'1008765','EMP0008765',NULL,NULL,'AKASH','BHARAT BHUSHAN ','MANDLOI','1981-05-14','Male','9876542033',NULL,'abc@gmail.com','69 kailash printing press ashok ward sandiya road pipariya',1,20,486,'Mumbai',461775,NULL,'558514642565',NULL,NULL,'UnMarried',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8766,'1008766','EMP0008766',NULL,NULL,'LAXMI CHAND','SHAMBHU SINGH','BHILALA','1988-06-16','Male','9876542212',NULL,'abc@gmail.com','Vill-Jai Nagar Modhana Th-Sharangpur  Rajgarh',1,20,486,'Mumbai',0,'612 EWS Vikas Nagar Dewas  Dewas','848764207721',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8767,'1008767','EMP0008767',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-30','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:39','2017-05-26 23:30:39',NULL,NULL,NULL,NULL),(8768,'1008768','EMP0008768',NULL,NULL,'BANE','SINGH','SOLANKI','1983-09-15','Male','9876542216',NULL,'abc@gmail.com','Viill-Mundlaram Th-Jawra',1,20,486,'Mumbai',0,'D2/23,AWAS NAGAR DEWAS','540659050676',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8769,'1008769','EMP0008769',NULL,NULL,'UDAYPRATAP','RAM JI','SINGH','1987-06-14','Male','9876542217',NULL,'abc@gmail.com','Vill-Khamhariya Post-Barhula    ',1,20,486,'Mumbai',0,'7,SAHYOG COLONY DEWAS','0','DSZPS5924K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8770,'1008770','EMP0008770',NULL,NULL,'SHYAM SUNDAR','BESAKHU PRASAD','RAWAT','1990-10-20','Male','9876542218',NULL,'abc@gmail.com','Vill-+Muri- Kaschuli Yag  Thana-Raipur',1,20,486,'Mumbai',0,'64-B Pratap Nagar Colony Dewas','733032855050',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8771,'1008771','EMP0008771',NULL,NULL,'DHANJAY','DADAN SINGH','KUMAR','1984-04-10','Male','9876542220',NULL,'abc@gmail.com','Vill-Ramyas Vigaha Post-Kanchan Prar Sasaram Rohatas  Bihar',1,20,486,'Mumbai',0,'Vill-Ramyas Vigaha Post-Kanchan Prar Sasaram  Rohatas    Bihar','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8772,'1008772','EMP0008772',NULL,NULL,'ALPESHKUMAR','POONAMCHAND','PRAJAPATI','1989-06-03','Male','9876542222',NULL,'abc@gmail.com','Andharivadi At+Post-Malpur Sabarkantha      ',1,20,486,'Mumbai',0,'Andharivadi At+Post-Malpur Sabarkantha','723068114274',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8773,'1008773','EMP0008773',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-15','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8774,'1008774','EMP0008774',NULL,NULL,'YASHPAL','BHAWANIRAM','KARODA','1982-12-03','Male','9876542225',NULL,'abc@gmail.com','RAM MANDIR CHOCK BADUD',1,20,486,'Mumbai',0,'RAM MANDIR CHOCK BADUD','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8775,'1008775','EMP0008775',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-27','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8776,'1008776','EMP0008776',NULL,NULL,'SHAILENDRA ','RATANLAL','THAKUR','1987-01-29','Male','9876542232',NULL,'abc@gmail.com','644 BUDI BARLAI JAGIR SAWER ROAD INDORE',1,20,486,'Mumbai',453771,'644 BUDI BARLAI JAGIR SAWER ROAD INDORE','416029254172','FRDPS9715M',NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8777,'1008777','EMP0008777',NULL,NULL,'VIKRAM','BHAGIRATH SINGH ','MALVIYA','1987-09-10','Male','9876542234',NULL,'abc@gmail.com','Vill+Post-Kuravar Th-Ashta',1,20,486,'Mumbai',0,'Vill-Bira Khedi Dewas','290680356978',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8778,'1008778','EMP0008778',NULL,NULL,'PREMNARAYAN','RAMLAL','SEN','1986-05-18','Male','9876542235',NULL,'abc@gmail.com','Vill-Kundya Nathu Th-Ashta',1,20,486,'Mumbai',0,'Nath Mohalla Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:40','2017-05-26 23:30:40',NULL,NULL,NULL,NULL),(8779,'1008779','EMP0008779',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-28','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8780,'1008780','EMP0008780',NULL,NULL,'RAGHUVEER','MATRULAL ','RAI','1990-10-04','Male','9876542237',NULL,'abc@gmail.com','Sch.No.78 246 Indore ',1,20,486,'Mumbai',0,'Sch.No.78 246 Indore ','0','ATUPR7599E',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8781,'1008781','EMP0008781',NULL,NULL,'AKASH','MEGHRAJ','ARYA','1984-12-06','Male','9876542238',NULL,'abc@gmail.com','Vill-Chaninouta Th-Ashta',1,20,486,'Mumbai',0,'Shankar Gardh Balgardh Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8782,'1008782','EMP0008782',NULL,NULL,'PAPPU','LAD SINGH','DHANGAR','1984-10-03','Male','9876542239',NULL,'abc@gmail.com','Vill-Chachrsi Th-Ashta',1,20,486,'Mumbai',0,'H.N.82 Karoli Nagar Dewas','672787801537',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8783,'1008783','EMP0008783',NULL,NULL,'DEVENDRA',' ','JOMAR','1990-05-05','Male','9876542240',NULL,'abc@gmail.com','Vill-Khadi Hat Th-Ashta',1,20,486,'Mumbai',0,'Vill-Khadi Hat Th-Ashta Dist-Sehore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8784,'1008784','EMP0008784',NULL,NULL,'PRAMOD','RAMDAYAL RAI','RAI','1988-12-17','Male','9876542241',NULL,'abc@gmail.com','Vrandavan Colony Sehore',1,20,486,'Mumbai',0,'Lib-24 Arvind Nagar Ujjain ','211745503354','BVJPR75184',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8785,'1008785','EMP0008785',NULL,NULL,'MANOHARLAL ','BALMUKUND','SHARMA','1982-03-20','Male','9876542242',NULL,'abc@gmail.com','Vill-Amla Manju Post-Khajuniya  Sehore',1,20,486,'Mumbai',0,'39/1 BHAWANI SAGAR DEWAS','880202251289',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8786,'1008786','EMP0008786',NULL,NULL,'SANTOSH','SHANKARLAL','DAHERWAL','1987-05-05','Male','9876542243',NULL,'abc@gmail.com','Near Rest House Vill-Ari ',1,20,486,'Mumbai',0,'18/B-Panchsheel Nagar Dewas ','691631494324','CHFDD9774E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8787,'1008787','EMP0008787',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-23','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8788,'1008788','EMP0008788',NULL,NULL,'BHAGWAN','LAXMAN SINGH','SONGARA','1986-03-15','Male','9876542245',NULL,'abc@gmail.com','Vill-Dodiya Khedi Shajapur',1,20,486,'Mumbai',0,'Shankar Nagar Dewas','721877009478','gplps2296a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8789,'1008789','EMP0008789',NULL,NULL,'GOVERDHAN','NARBE SINGH','MALVIYA','1981-08-31','Male','9876542246',NULL,'abc@gmail.com','Vill-Kisoni Th-Shajapur   ',1,20,486,'Mumbai',0,'Shanti Nagar A.B.Road Dewas ','795459309960','8462845874',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8790,'1008790','EMP0008790',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-17','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8791,'1008791','EMP0008791',NULL,NULL,'JITENDRA','RAMESH CHANDRA','SOURASTRIYA','1986-10-01','Male','9876542251',NULL,'abc@gmail.com','Naya Samaj Kheda Shajapur',1,20,486,'Mumbai',0,'Chanakyapuri Dewas ','612200577180',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8792,'1008792','EMP0008792',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-25','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:41','2017-05-26 23:30:41',NULL,NULL,NULL,NULL),(8793,'1008793','EMP0008793',NULL,NULL,'VIKRAM','BANE','SINGH','1989-09-23','Male','9876542253',NULL,'abc@gmail.com','Vill-Gundikala Th-Agar Malwa',1,20,486,'Mumbai',0,'Vill-Gundikala Th-Agar Malwa Dist-Shajapur','328868055486',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8794,'1008794','EMP0008794',NULL,NULL,'LAKHAN','BANE SINGH','RAJPUT','1987-04-11','Male','9876542255',NULL,'abc@gmail.com','Vill-Chitoni Post Mangrola Th Shujalpur  Shajapur',1,20,486,'Mumbai',0,'Sajjan Singh Colony Bawadiya Dewas','346901731231','CCCPR2933R',NULL,'Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8795,'1008795','EMP0008795',NULL,NULL,'RAJPAL ','ANTAR','SINGH','1984-10-19','Male','9876542256',NULL,'abc@gmail.com','341 Patidar Mohalla Vill-Khadi Th-Shujalpur  Shajapur',1,20,486,'Mumbai',0,'341 Patidar Mohalla Vill-Khadi Th-Shujalpur  Shajapur ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8796,'1008796','EMP0008796',NULL,NULL,'GAJENDRA','GOVIND SINGH','KELWA','1988-01-24','Male','9876542257',NULL,'abc@gmail.com','Vill-Bolai Dist-Shajapur  Shajapur    Madhya Pradesh',1,20,486,'Mumbai',0,'Vill-Bolai Dist-Shajapur','260007951028',NULL,NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8797,'1008797','EMP0008797',NULL,NULL,'BALRAM','VIKRAM SINGH','JADONE','1984-05-12','Male','9876542258',NULL,'abc@gmail.com','Vill=Bolai Th-Gulana  Shajapur',1,20,486,'Mumbai',0,'Vill=Bolai Th-Gulana  Shajapur','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8798,'1008798','EMP0008798',NULL,NULL,'LAL','SINGH','DODIYA','1981-02-15','Male','9876542260',NULL,'abc@gmail.com','Vill-Khadi Dodiya   Shajapur    Madhya Pradesh',1,20,486,'Mumbai',0,'Vill-Khadi Dodiya   Shajapur Madhya Pradesh','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8799,'1008799','EMP0008799',NULL,NULL,'TOLARAM',NULL,'LODHI','1990-10-12','Male','9876542261',NULL,'abc@gmail.com','Gali No 2 Ward No 2 Nai Colony Makshi ',1,20,486,'Mumbai',0,'Gali No 2 Ward No 2 Nai Colony Makshi  Shajapur ','844493189499',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8800,'1008800','EMP0008800',NULL,NULL,'BHAGWAN','SINGH','KELWA','1986-10-17','Male','9876542262',NULL,'abc@gmail.com','Vill-Bolai Dist-Shajapur',1,20,486,'Mumbai',0,'Vill-Bolai Dist-Shajapur','472591397740',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8801,'1008801','EMP0008801',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-17','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8802,'1008802','EMP0008802',NULL,NULL,'RAHEES',NULL,'KHAN','1986-05-26','Male','9876542264',NULL,'abc@gmail.com','TEH-GULANA, WARD N-19, KALI SINDH,PADLI,KALISINDH,SHAHJAPUR,',1,20,486,'Mumbai',465220,'TEH-GULANA, WARD N-19, KALI SINDH,PADLI,KALISINDH,SHAHJAPUR,','329034796871',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8803,'1008803','EMP0008803',NULL,NULL,'PAPPU','SINGH','RATHORE','1990-12-15','Male','9876542265',NULL,'abc@gmail.com','Vill-Rupapura,Post-Bhusi',1,20,486,'Mumbai',0,'586 EWS VIKAS NAGAR DEWAS','646470539683',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8804,'1008804','EMP0008804',NULL,NULL,'DHARMENDRA','B.P.','SANWALIA','1983-05-26','Male','9876542266',NULL,'abc@gmail.com','Bhavsar Mohalla Shajapur',1,20,486,'Mumbai',0,'Bhavsar Mohalla Shajapur','319282505658','CSZPS6114G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8805,'1008805','EMP0008805',NULL,NULL,'GOVIND','SINGH','PARIHAR','1983-07-21','Male','9876542267',NULL,'abc@gmail.com','Vill: Borsali  Po: Polai Khurd',1,20,486,'Mumbai',0,'57 MIG Jai Prakash Nagar  Dhacha Bhawan  Dewas','434237875151',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8806,'1008806','EMP0008806',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-07-01','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:42','2017-05-26 23:30:42',NULL,NULL,NULL,NULL),(8807,'1008807','EMP0008807',NULL,NULL,'Vikas ',NULL,'Mogra','1987-06-30','Male','9876542327',NULL,'abc@gmail.com','Sneham, 36-Mayur Van Colony, Paneriyon Ki Madri, Udaipur,Rajasthan',1,20,486,'Mumbai',313002,'301, BCM Heights, Vijaynagar, Indore - 452010','684505718440','AKBPM2805L',NULL,'Married',8,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8808,'1008808','EMP0008808',NULL,NULL,'ZAKEER','RAMJAN','HUSAIN','1985-04-13','Male','9876542328',NULL,'abc@gmail.com','Vill-Nogaon  Ujjain',1,20,486,'Mumbai',0,'Raghunath Pura Dewas','663175821047',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8809,'1008809','EMP0008809',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-21','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8810,'1008810','EMP0008810',NULL,NULL,'FIROZ','IQUBAL','KHAN','1989-11-02','Male','9876542331',NULL,'abc@gmail.com','305/3 Chambal Marg Nagda Jn.  Nagda',1,20,486,'Mumbai',0,'305/3 Chambal Marg Nagda Jn.  Nagda','943610487720',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8811,'1008811','EMP0008811',NULL,NULL,'SONU','RAI SINGH','CHOUDHARY','1990-06-14','Male','9876542332',NULL,'abc@gmail.com','Vill.-Jethal Tek Agar Road Ujjain   Th-Ghatiya',1,20,486,'Mumbai',0,'352,Gopal Nagar Itawa Dewas','899711177890','BAYPC3489C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8812,'1008812','EMP0008812',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-15','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8813,'1008813','EMP0008813',NULL,NULL,'JANKILAL','KANHAIYALAL',' ','1989-08-30','Male','9876542337',NULL,'abc@gmail.com','Vill-Malikhedi Th-Tarana Dist-Ujjain',1,20,486,'Mumbai',0,'Trilok Nagar Dewas ','911536315934',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8814,'1008814','EMP0008814',NULL,NULL,'SANJAY','DEVNARAYAN','PURI','1982-08-11','Male','9876542338',NULL,'abc@gmail.com','44 Hatiyakhedi Th-Tarana Dist-Ujjain',1,20,486,'Mumbai',0,'Patel Nagar Bawadiya Dewas','972303196952',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8815,'1008815','EMP0008815',NULL,NULL,'LAKHAN','BANSILAL ','PARMAR','1989-01-02','Male','9876542339',NULL,'abc@gmail.com','Vill-Khokri Th-Nagda ',1,20,486,'Mumbai',0,'Vill-Khokri Th-Nagda Dist-Ujjain ','922237472265',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8816,'1008816','EMP0008816',NULL,NULL,'DHARMENDRA','ANTAR SINGH','PANWAR','1984-01-12','Male','9876542341',NULL,'abc@gmail.com','Vill-Palsoda Makdawan Th-Bad Nagar  Ujjain',1,20,486,'Mumbai',0,'Vill-Palsoda Makdawan Th-Bad Nagar  Ujjain','510222587525',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8817,'1008817','EMP0008817',NULL,NULL,'DEEPAK','VIJAY SINGH','MEENA','1981-08-02','Male','9876542342',NULL,'abc@gmail.com','40/6 Indore Gate Ujjain',1,20,486,'Mumbai',0,'40/6 Indore Gate Ujjain','594719032926',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8818,'1008818','EMP0008818',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-05-01','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8819,'1008819','EMP0008819',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-06-07','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 23:30:43','2017-05-26 23:30:43',NULL,NULL,NULL,NULL),(8820,'1008820','EMP0008820',NULL,NULL,'GOVIND','GIRIRAJ','KUMAR','1982-03-06','Male','9876542349',NULL,'abc@gmail.com','Mahesh Nagar Ujjain',1,20,486,'Mumbai',0,'Mahesh Nagar Ujjain','0','egqpk0532r',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8821,'1008821','EMP0008821',NULL,NULL,'YOGESH','DILIP','SOLANKI','1982-01-01','Male','9876542351',NULL,'abc@gmail.com','15,SANAJY NAGAR AGAR ROAD UJJAIN',1,20,486,'Mumbai',456001,'15,SANAJY NAGAR AGAR ROAD UJJAIN','603312060910','FWBPS0347L',NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8822,'1008822','EMP0008822',NULL,NULL,'RAJESH','SURENDRA ','CHOUDHARY','1985-08-11','Male','9876542359',NULL,'abc@gmail.com','Vill.-Loma BIHAR',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','975790879468','AQIPC7965L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8823,'1008823','EMP0008823',NULL,NULL,'AMBIKA','PRASAD','VERMA','1983-06-03','Male','9876542362',NULL,'abc@gmail.com','Vill.-Hittapur Post.-Raggupur',1,20,486,'Mumbai',0,'80 LIG Vikas Nagar Dewas  ','517610559343','AUXPV4787G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8824,'1008824','EMP0008824',NULL,NULL,'PREM KUMAR','DURJAN PRASAD','MAURYA','1988-09-20','Male','9876542363',NULL,'abc@gmail.com','Vill-Banket Post-Banket',1,20,486,'Mumbai',0,'80 Lig-Vikas Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8825,'1008825','EMP0008825',NULL,NULL,'Apoorv',NULL,'Gupta','1988-09-24','Male ','9876541326',NULL,'abc@gmail.com','RV-10, Indus Gradens, E-8 Extension, Gulmohar Colony',1,NULL,1033,'Surat',462039,'A2B-105, KUMAR Paradise, Mundhwa Road, Hadapsar Road, Pin -411028','443145230834','BGFPG4313Q','MP04D-2010-0067675','Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8826,'1008826','EMP0008826',NULL,NULL,'Manisha',NULL,'Kuthari','1986-11-06','Female ','9876541343',NULL,'abc@gmail.com','House No-17, Nehru Enclave, G.M.S Road, Ballupur',1,NULL,1033,'Surat',248001,'Flat No -301, SVGK Residency , Plot No 53, Megha Hills, Madhapur, Hyderabad ','0','BDUPK3619M',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8827,'1008827','EMP0008827',NULL,NULL,'Bhaskar ','Phani Shankar ','Thatavarti ','1985-05-11','Male ','9876541793',NULL,'abc@gmail.com','D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada',1,NULL,1033,'Surat',533002,'D/No -56-6-11, Gopivari Street, Jaganamaickpur, Kakinanada, 533002','624295395791','AGNPT0391G',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8828,'1008828','EMP0008828',NULL,NULL,'Anupkumar',NULL,'Gangadharan','1982-05-19','Male ','9876541825',NULL,'abc@gmail.com','MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally',1,NULL,1033,'Surat',500038,'MIG-II 36 (GF), Phase 9, KPHB Colony, Kukatpally, Hyderabad.','358356821931','AOBPG6594G',NULL,'Married ',1,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8829,'1008829','EMP0008829',NULL,NULL,'Vinay ','Kumar ','R','1981-09-29','Male ','9876541826',NULL,'abc@gmail.com','H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad',1,NULL,1033,'Surat',500015,'H - 24 - 309 , Indira Nagar Colony , Lothkunta , Trimulgherry PO , Secunderabad - 500015','898799967864','AHCPR7736F',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8830,'1008830','EMP0008830',NULL,NULL,'Vinay ',NULL,'Gupta ','1982-04-17','Male ','9876541827',NULL,'abc@gmail.com','Flat No-B1, 8th Floor, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar',1,NULL,1033,'Surat',500050,'Flat No-B1, 8TH FLOOR, Luxor Heights, Madhapuri Hills, Behind RS Brothers, PJR Enclave, Chandanagar-500050','979495750198','AJEPG8899E','MH1420080019215','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8831,'1008831','EMP0008831',NULL,NULL,'Subramanian',NULL,'Venkatraman','1983-05-30','Male ','9876541828',NULL,'abc@gmail.com','1-4-879/80, SBI Officers Colony, New bakaram, Gandhi Nagar',1,NULL,1033,'Surat',500080,'Flat 102 , Jyothi lakeview apartment, Kavuri Hills , Madhapur ','0','AEVPV9120R','DLFAP009302082000','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8832,'1008832','EMP0008832',NULL,NULL,'Arunasree',NULL,'Cheparthi','1981-07-11','Female ','9876541829',NULL,'abc@gmail.com','Plot No -70, SBH Colony, Mohan Nagar, Kothapet',1,NULL,1033,'Surat',5000035,'Plot No -70, SBH Colony, Mohan Nagar, Kothapet, Hyderabad - 5000035 ','455516529799','AFQPC2682H',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8833,'1008833','EMP0008833',NULL,NULL,'Anushree',NULL,'Agarwal','1985-04-17','Female ','9876541830',NULL,'abc@gmail.com','21-6-500, Ghansi Bazar, Near High Court',1,NULL,1033,'Surat',500002,'Sai Sharan Chabaria\'s, 2nd Floor, 1-8-264/4, Sindhi Colony, SP Road, Secunderabad','0','ASVPB5803D',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:44','2017-05-26 23:30:44',NULL,NULL,NULL,NULL),(8834,'1008834','EMP0008834',NULL,NULL,'Kiran','Raj','Lokala','1983-05-22','Male ','9876541831',NULL,'abc@gmail.com','Flat 401, Hallmark Ridge, Block - D, Sector - 1, Alkapur Township, \nCyberabad',1,NULL,1033,'Surat',500089,'Flat 401, Hallmark Ridge, Block - D, Sector - 1, \nAlkapur Township, \nCyberabad - 500089','0','AEUPL2146N',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8835,'1008835','EMP0008835',NULL,NULL,'Benny','Paul Prajeev','Mashapari','1982-05-27','Male ','9876541832',NULL,'abc@gmail.com','BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi',1,NULL,1033,'Surat',500047,'BN 293, Balram Nagar, Safilguda,Hyderabad, Rangareddi, Andhra Pradesh, Pin -500047','523556327179','BRVPM6697L',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8836,'1008836','EMP0008836',NULL,NULL,'Kranthi Kumar',NULL,'Buddharaju','1984-05-08','Male ','9876541833',NULL,'abc@gmail.com','H-No: 334,MIG, Balaji Nagar,Kukatpally',1,NULL,1033,'Surat',500072,'H-No: 334,MIG, Balaji Nagar,Kukatpally, Hyderabad -72 ','370219290273','AWQPB8153R','DLFAP010295062006','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8837,'1008837','EMP0008837',NULL,NULL,'Gajender','Satyanarayana ','Bachula','1983-03-11','Male ','9876541834',NULL,'abc@gmail.com','H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy',1,NULL,1033,'Surat',500047,'H-No-24-6/27, Beside Anusneha Apartments Lane, Vishnupuri Colony, Malkajgiri, Hyderabad , Ranga Reddy District -Pin -500047','9059','AOJPB9485R',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8838,'1008838','EMP0008838',NULL,NULL,'Sandeep',NULL,'Sukhavasi','1983-06-07','Male ','9876541835',NULL,'abc@gmail.com','12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad',1,NULL,1033,'Surat',500017,'12-13-569, Nagarjuna Nagar Colony, Tarnaka, Secunderabad, 500017','235945348844','CHKPS4943R',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8839,'1008839','EMP0008839',NULL,NULL,'Vinita',NULL,'Mungikar','1988-05-19','Female ','9876541836',NULL,'abc@gmail.com','2-1-467, Street No 6,Nallakunta',1,NULL,1033,'Surat',500044,'2-1-467, Street No 6,Nallakunta, Hyderbad , Pin : 500044','367150730270','BOTPM1901E','DLFAP0111344910','Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8840,'1008840','EMP0008840',NULL,NULL,'Bharath','Kumar','Badavathu','1982-11-27','Male ','9876541837',NULL,'abc@gmail.com','H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal',1,NULL,1033,'Surat',0,'H-No-3-92/55/D,Plot No 28,Beside Nimishambika Devi Temple, Penta Reddy Colony,Boduppal,Ghatkesar Mandal, RR Dist, ','0','BAXPK1706R','DLDAP03600653462012','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8841,'1008841','EMP0008841',NULL,NULL,'Venkata Nagamalleshwari',NULL,'Pallapothu','1986-04-20','Female ','9876541838',NULL,'abc@gmail.com','H-No -1-3-176/35/4/3, Ground Floor, Padmashali Colony, Gandhi Nagar',1,NULL,1033,'Surat',500029,'H.No:1-3-176/35/4/3, Padmashali colony, Gandhi nagar, Hyderabad','780765305032','BJIPP1450P','AP02320120011087','Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8842,'1008842','EMP0008842',NULL,NULL,'Sai Vivek',NULL,'Kammari','1985-04-25','Male ','9876541839',NULL,'abc@gmail.com','1-49/2/D , Shankar Nagar, Chandanangar',1,NULL,1033,'Surat',500050,'1-49/2/D , Shankar Nagar, Chandanangar, Hyderbad , Pin 500050','274805977014','AMYPV2916Q','AMYPV2916Q','Unmarried',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8843,'1008843','EMP0008843',NULL,NULL,'Sishir Cheela',NULL,'Naren','1987-03-14','Male ','9876541840',NULL,'abc@gmail.com','T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet',1,NULL,1033,'Surat',500016,'T5, Brindavan Appaertment A, Chikoti Gardens, Begumpet, Hyderabad, Pin : 500016','0','AKHPC1026B',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8844,'1008844','EMP0008844',NULL,NULL,'Bhupa','Prashanth',NULL,'1987-08-05','Male ','9876541841',NULL,'abc@gmail.com','H-No-9-94/5, Laxmi Nagar Colony, Boduppal',1,NULL,1033,'Surat',500092,'H.no 9-94/5, Lakshmi nagar colony, Boduppal, Hyd-92','557270199547','BKIPB8121N',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8845,'1008845','EMP0008845',NULL,NULL,'Dasgupta ',NULL,'Archi ','1981-05-24','Male ','9876541897',NULL,'abc@gmail.com','C/o. Ila Dasgupta, Race Course',1,NULL,1033,'Surat',735101,'509, Prajapati Elite 3, HUDA Mayuri Nagar, Miyapur, Hyderabad - 500 049','306109511325','AHAPD7345L',NULL,'Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8846,'1008846','EMP0008846',NULL,NULL,'Shubham ',NULL,'Pandey ','1987-12-11','Male ','9876541914',NULL,'abc@gmail.com','ME-59, Mini MIG Hemant Vihar, Barra -II',1,NULL,1033,'Surat',208027,'ME-59, Mini MIG Hemant Vihar, Barra -II, Kanpur, Pin 208027','0','BUOPP3326D',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8847,'1008847','EMP0008847',NULL,NULL,'Praveen ',' Kumar','Vadicharla ','1988-05-02','Male ','9876541915',NULL,'abc@gmail.com','ST2-1031, Centenary Colony, Rangagiri, Peddapalli',1,NULL,1033,'Surat',505212,'Plot No-525, HMT Hills, Kukatpally, Hyderabad','466156172556','AMEPV9241L',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:45','2017-05-26 23:30:45',NULL,NULL,NULL,NULL),(8848,'1008848','EMP0008848',NULL,NULL,'Dwaipayan ',NULL,'Bose','1986-08-25','Male ','9876541951',NULL,'abc@gmail.com','22/1/1A, Monohar Pukur Road',1,NULL,1033,'Surat',700029,'Royal PG, Sr. No 63, Lane 4, Rajaram Patil Nagar, EON IT Park, Khardi, Pune-411014 ','0','BHEPB6799R',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8849,'1008849','EMP0008849',NULL,NULL,'N V Chalam',NULL,'Lakkapragada','1988-03-08','Male ','9876541954',NULL,'abc@gmail.com','S/O , LLV Prasad, Near Venugopala Swamy Temple, Movva',1,NULL,1033,'Surat',521135,'Flat No- 53, Gulmohar Park Colony, Near Dominos Pizza, Sri Lingampalli, Hyderabad, 500019','589957438576','AHUPL8865B',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8850,'1008850','EMP0008850',NULL,NULL,'Sangeetika ',NULL,'Srivastava ','1987-08-13','Female ','9876541963',NULL,'abc@gmail.com','\"Shivpuri\" Mall Road, Sitapur',1,NULL,1033,'Surat',0,'Plot 121, Phase 3, Kamlapuri Colony, Srinagar Colony, Banjara Hills, Hyderabad, Telangana -500073 ','0','CZWPS0239J',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8851,'1008851','EMP0008851',NULL,NULL,'Laxmi Reddy',NULL,'Vittalapuram','1985-03-08','Male ','9876541964',NULL,'abc@gmail.com','1-13,Vittalapuram,Maldakal,Gadwal',1,NULL,1033,'Surat',509132,'5-639/302,Sri Krishna Residency,Secretariat Colony, Manikonda, Hyderabad,Pin: 500089','359944400451','AHXPV5186G',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8852,'1008852','EMP0008852',NULL,NULL,'Neha','Vijay','Dharia','1983-07-16','Female ','9876541987',NULL,'abc@gmail.com','House No. 7, Franconia, 3rd Pasta Lane, Colaba',1,NULL,1033,'Surat',400005,'Neha Dharia and Shailesh Bhojak\n306 Royal Castle,\nKodihalli Village, HAL Sanitary Board Area, 229/33, \nHAL Airport Rd, Bangalore-560017','0','BBAPD4042B ',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8853,'1008853','EMP0008853',NULL,NULL,'Kedar ','Umesh ','Mohite ','1981-12-18','Male ','9876542000',NULL,'abc@gmail.com',' 4-c nawab layout, Nirmala Apts, Tilak Nagar, Amravati Road',1,NULL,1033,'Surat',440010,'502, Prajapati Elite III, huda Layout, Mayuri Nagar, Miyapur','853164601947','APOPM9466P','J2993891','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8854,'1008854','EMP0008854',NULL,NULL,'Dhiraj','Pramod','Badgujar','1986-06-23','Male ','9876542008',NULL,'abc@gmail.com','05, Triveni Darshan Appartments, Bhabha Nagar',1,NULL,1033,'Surat',422011,'Kaveri Guest House, near post office, Madhapur, Secunderabad','283247865516','BMLPB1982J',NULL,'Married ',3,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8855,'1008855','EMP0008855',NULL,NULL,'Chaitanya','Sundara','Pasupuleti','1982-01-27','Male ','9876542034',NULL,'abc@gmail.com','Opposite Andhra Bank, Main Road ,Singaraya Konda',1,NULL,1033,'Surat',523101,'Plot No 1129, Opp Pragathi Nagar Church, Pragathi Nagar, Kukatpally, Hyderbad Pin -500090','8184452425490','BBUPP9237Q','DLFAP024114342009','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8856,'1008856','EMP0008856',NULL,NULL,'Inderpreet',NULL,'Kaur','1984-02-02','Female ','9876542210',NULL,'abc@gmail.com','House No. 561 B/B, Ashoka Nagar, Near Kharadi',1,NULL,1033,'Surat',411014,'561 B/B ASHOKA NAGAR, KHARADI','0','BLOPS6167G',NULL,'Unmarried',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8857,'1008857','EMP0008857',NULL,NULL,'Sirish','Kumar','Pammi','1982-07-29','Male ','9876542211',NULL,'abc@gmail.com','D.No. 2-36-36, Trivedi Nagar, AC Gardens',1,NULL,1033,'Surat',533101,'Ho-No 1-2-33/59/102, Flat #102,Samhitha’s Saraswati Nilayam,Plot #59, Prasanth Nagar,Nizampet Road,Kukatpally 500072','617641873362','AOFPP6118M',NULL,'Married ',NULL,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8858,'1008858','EMP0008858',NULL,NULL,'Srinivasa','Rao','Mantha','1988-04-01','Male ','9876542368',NULL,'abc@gmail.com','7-37/2, Seethampeta,Kothavalsa (Mandalam)',1,NULL,1033,'Surat',535183,'Flat no 7353, 7th Block, Jana priya metroplos, Mothi Nagar, Hyderabad','993245246447','BDEPR3291L','KA5320120002120','Unmarried',7,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8859,'1008859','EMP0008859',NULL,NULL,'Naga Sukumar',NULL,'Gattu','1983-09-19','Male ','9876542369',NULL,'abc@gmail.com','H-No-2-11-44, Ganesh Street, Jangaon',1,NULL,1033,'Surat',506167,'Flat No- 402. H-No-4-10/3, Plot No 139, Abinay Residency, Budha Nagar,Peerzadiguda, Pin 500039, Ranga Reddy District - AP ','938362397865','AMYPG7752M','DLFAP1363562009','Married ',4,2,1,NULL,'NA ','NA ','Active',NULL,NULL,1,3,27,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8860,'1008860','EMP0008860',NULL,NULL,'Raman ',NULL,'Dashottar','1985-01-01','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8861,'1008861','EMP0008861',NULL,NULL,'Sibananda ',NULL,'Mishra','1981-04-06','Male','9876542036',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 23:30:46','2017-05-26 23:30:46',NULL,NULL,NULL,NULL),(8862,'1008862','EMP0008862',NULL,NULL,'Ujjwal ',NULL,'Panot','1982-03-22','Male','9876542037',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8863,'1008863','EMP0008863',NULL,NULL,'Jitendra ',NULL,'Patel','1982-04-07','Male','9876542038',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8864,'1008864','EMP0008864',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-12','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8865,'1008865','EMP0008865',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-16','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8866,'1008866','EMP0008866',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-14','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8867,'1008867','EMP0008867',NULL,NULL,'Sandeep ',NULL,'Rawat','1981-03-09','Male','9876542042',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8868,'1008868','EMP0008868',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-16','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8869,'1008869','EMP0008869',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-31','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8870,'1008870','EMP0008870',NULL,NULL,'Sukhdev ',NULL,'Javne','1981-02-09','Male','9876542045',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8871,'1008871','EMP0008871',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-16','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8872,'1008872','EMP0008872',NULL,NULL,'Vikram ','Singh ','Dhanger','1982-08-13','Male','9876542047',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8873,'1008873','EMP0008873',NULL,NULL,'Ravi ',NULL,'Kale','1981-07-03','Male','9876542048',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8874,'1008874','EMP0008874',NULL,NULL,'Rakesh ',NULL,'Sharma','1981-06-25','Male','9876542049',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:47','2017-05-26 23:30:47',NULL,NULL,NULL,NULL),(8875,'1008875','EMP0008875',NULL,NULL,'Rakesh ',NULL,'Rajoria','1981-01-15','Male','9876542050',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8876,'1008876','EMP0008876',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-08','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8877,'1008877','EMP0008877',NULL,NULL,'Piyush ',NULL,'Batham','1981-08-28','Male','9876542052',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8878,'1008878','EMP0008878',NULL,NULL,'Radheshyam ',NULL,'Anand','1982-03-30','Male','9876542053',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8879,'1008879','EMP0008879',NULL,NULL,'Anil  ','Kumar','Chouhan','1981-09-21','Male','9876542054',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8880,'1008880','EMP0008880',NULL,NULL,'Suner ','Singh','Yadav','1981-12-10','Male','9876542055',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8881,'1008881','EMP0008881',NULL,NULL,'Lakhan ',NULL,'Chouhan','1990-11-09','Male','9876542056',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8882,'1008882','EMP0008882',NULL,NULL,'Dilip ',NULL,'Vagul','1983-03-27','Male','9876542057',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8883,'1008883','EMP0008883',NULL,NULL,'Lakhan ',NULL,'Yadav','1990-10-24','Male','9876542058',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8884,'1008884','EMP0008884',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-12','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8885,'1008885','EMP0008885',NULL,NULL,'Anil ',NULL,'Malviya','1981-01-16','Male','9876542060',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8886,'1008886','EMP0008886',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-09','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8887,'1008887','EMP0008887',NULL,NULL,'Kamal ',NULL,'Nayak','1989-11-10','Male','9876542062',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8888,'1008888','EMP0008888',NULL,NULL,'Ashok ',NULL,'Rawat ','1981-03-01','Male','9876542063',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:48','2017-05-26 23:30:48',NULL,NULL,NULL,NULL),(8889,'1008889','EMP0008889',NULL,NULL,'Vishnu ',NULL,'Bodana','1981-03-17','Male','9876542064',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8890,'1008890','EMP0008890',NULL,NULL,'Prabhulal ',NULL,'Singh','1982-10-10','Male','9876542065',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8891,'1008891','EMP0008891',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-25','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8892,'1008892','EMP0008892',NULL,NULL,'Ravi ',NULL,'Athwale','1981-07-27','Male','9876542067',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8893,'1008893','EMP0008893',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-17','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8894,'1008894','EMP0008894',NULL,NULL,'Bhupendra ',NULL,'Kale','1981-08-12','Male','9876542069',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8895,'1008895','EMP0008895',NULL,NULL,'Sunil ',NULL,'Sironja','1981-08-04','Male','9876542070',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8896,'1008896','EMP0008896',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-09','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8897,'1008897','EMP0008897',NULL,NULL,'Dilip ',NULL,'Bodana ','1987-11-08','Male','9876542072',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8898,'1008898','EMP0008898',NULL,NULL,'Suresh ',NULL,'Pawar','1981-09-05','Male','9876542073',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8899,'1008899','EMP0008899',NULL,NULL,'Devendra  ','Kumar','Gujre ','1984-03-04','Male','9876542074',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8900,'1008900','EMP0008900',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-08','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8901,'1008901','EMP0008901',NULL,NULL,'Sanjay ',NULL,'Chouhan ','1982-04-15','Male','9876542076',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:49','2017-05-26 23:30:49',NULL,NULL,NULL,NULL),(8902,'1008902','EMP0008902',NULL,NULL,'Lal ','Singh ','Parmar ','1981-11-08','Male','9876542077',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8903,'1008903','EMP0008903',NULL,NULL,'Mukesh ',NULL,'Morvi ','1990-05-13','Male','9876542078',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8904,'1008904','EMP0008904',NULL,NULL,'Mahesh',' kumar ','Liloria ','1981-04-02','Male','9876542079',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8905,'1008905','EMP0008905',NULL,NULL,'Vinod  ','Kumar','Mitwal ','1987-11-09','Male','9876542080',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8906,'1008906','EMP0008906',NULL,NULL,'Madan','Lal ','Patel ','1981-01-24','Male','9876542081',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8907,'1008907','EMP0008907',NULL,NULL,'Ramdas ',NULL,'Ganvande ','1981-02-17','Male','9876542082',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8908,'1008908','EMP0008908',NULL,NULL,'Suresh  ',NULL,'Prasad','1981-03-21','Male','9876542083',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8909,'1008909','EMP0008909',NULL,NULL,'Jagdish ',NULL,'Mandsore ','1987-09-29','Male','9876542084',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8910,'1008910','EMP0008910',NULL,NULL,'Kalu  ','Singh ','Yadav','1981-05-06','Male','9876542085',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:50','2017-05-26 23:30:50',NULL,NULL,NULL,NULL),(8911,'1008911','EMP0008911',NULL,NULL,'Sanjeet',NULL,' Chaudhary ','1984-11-16','Male','9876542086',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8912,'1008912','EMP0008912',NULL,NULL,'Sunil  ','Kumar','Chouhan ','1981-12-26','Male','9876542087',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8913,'1008913','EMP0008913',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-11-04','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8914,'1008914','EMP0008914',NULL,NULL,'Yogesh ',NULL,'Wagh ','1987-04-15','Male','9876542089',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8915,'1008915','EMP0008915',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1987-01-17','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8916,'1008916','EMP0008916',NULL,NULL,'Moh.Parwez ',NULL,'Qureshi ','1981-06-17','Male','9876542091',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8917,'1008917','EMP0008917',NULL,NULL,'Laxmi Bai',NULL,NULL,'1987-01-18','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8918,'1008918','EMP0008918',NULL,NULL,'Vishnu ',NULL,'Songara ','1981-09-19','Male','9876542093',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8919,'1008919','EMP0008919',NULL,NULL,'Dinesh ',NULL,'Chouhan ','1990-04-07','Male','9876542094',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8920,'1008920','EMP0008920',NULL,NULL,'Shivkumar ',NULL,'Sharma ','1983-09-27','Male','9876542095',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8921,'1008921','EMP0008921',NULL,NULL,'Suresh ',NULL,'JADAM','1984-07-11','Male','9876542096',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8922,'1008922','EMP0008922',NULL,NULL,'Umashankar ',NULL,'Chaturved','1981-04-30','Male','9876542097',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8923,'1008923','EMP0008923',NULL,NULL,'Vikash ',NULL,'Rawat','1981-02-20','Male','9876542098',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:51','2017-05-26 23:30:51',NULL,NULL,NULL,NULL),(8924,'1008924','EMP0008924',NULL,NULL,'Narendra ',NULL,'Sonawane','1987-08-29','Male','9876542099',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8925,'1008925','EMP0008925',NULL,NULL,'Dinesh ',NULL,'Malaviya','1981-02-21','Male','9876542100',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8926,'1008926','EMP0008926',NULL,NULL,'Choutelal ',NULL,NULL,'1986-07-25','Male','9876542101',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8927,'1008927','EMP0008927',NULL,NULL,'Sandeep ',NULL,'Patel','1990-07-28','Male','9876542102',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8928,'1008928','EMP0008928',NULL,NULL,'Krishna ',NULL,'Malviya','1981-03-25','Male','9876542103',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8929,'1008929','EMP0008929',NULL,NULL,'Ajay',NULL,'Sahi','1981-01-20','Male','9876542104',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8930,'1008930','EMP0008930',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-24','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8931,'1008931','EMP0008931',NULL,NULL,'Pavan','Kumar','Yadav','1989-11-14','Male','9876541260',NULL,'abc@gmail.com','40AA/259 Sainik Nagar, Rajpur Chungi',1,20,886,'Agra',282001,'40AA/259 Sainik Nagar, Rajpur Chungi, Agra - 282001','0','ALMPY9011A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8932,'1008932','EMP0008932',NULL,NULL,'Ritu',NULL,'Singh','1985-06-12','Female','9876541261',NULL,'abc@gmail.com','32- Kabir envclave Dayalbagh',1,20,886,'Agra',282005,'32- Kabir envclave Dayalbagh, Agra - 282005, UP','0','CERPS9466R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8933,'1008933','EMP0008933',NULL,NULL,'Kunal',NULL,'Doshi','1982-12-29','Male','9876541262',NULL,'abc@gmail.com','45, Rajeshvari Colony, Isanpur Road, Mani Nagar',1,20,NULL,'Ahemdabad',380008,'Vascon Ela, B- 402, Malvadi, Behind Amanora Mall, Hadapsar, Pune - 411028 ','0','AJVPD7527P',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8934,'1008934','EMP0008934',NULL,NULL,'Gunjan',NULL,'Bhatt','1982-02-28','Male','9876541265',NULL,'abc@gmail.com','78/465 Vijaynagar, Naranpura',1,20,NULL,'Ahmedabad',380013,'G-304, Daffodils, Magarpatta City – 411013','0','AFXPB0304A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8935,'1008935','EMP0008935',NULL,NULL,'Parth',NULL,'Arora','1983-01-14','Male','9876541266',NULL,'abc@gmail.com','C/103 Gala Swing, South Bopal',1,20,170,'Ahmedabad',0,'E 5 / 605 Rohan Mithila ,Near Symbiosis college ,Viman Nagar, Pune - 411014','0','AFAPA4280P',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8936,'1008936','EMP0008936',NULL,NULL,'Rakesh',NULL,'Kakani','1983-08-26','Male','9876541267',NULL,'abc@gmail.com','53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa Nagar, Nikol Gam Road',1,20,170,'Ahmedabad',382350,'53, Suradhara Society , Near Sardar Mall, Post Thakkar Bapa nagar, Nikol Gam Road, Ahmedabad - 382 350','0','ATHPK3885H',NULL,'Married',8,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8937,'1008937','EMP0008937',NULL,NULL,'Alay',NULL,'Nallulwar','1984-12-18','Male','9876541268',NULL,'abc@gmail.com','42739, Professor Quarters, Nr. Luft Restaurant, Opp Uni Boys hostel, Navrangpura',1,20,170,'Ahmedabad',0,'D-271, Kumar Priyadarshan, Nr. Balaji Temple, Balaji Chowk, Sus Pashan Road, Pashan, Pune 411021','0','AMJPN9378D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:52','2017-05-26 23:30:52',NULL,NULL,NULL,NULL),(8938,'1008938','EMP0008938',NULL,NULL,'Amit',NULL,'Bansal','1985-02-12','Male','9876541269',NULL,'abc@gmail.com','53,Krishna Kunj, Mittal Colony, Khoda Ganeshji Road, Madanganj-kishangarh',1,20,668,'Ajmer',305801,'E-3, 504, Ganga Constella,Near Eon IT Park, Kharadi,Pune - 411014','0','AWGPB8561K',NULL,'Married ',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8939,'1008939','EMP0008939',NULL,NULL,'Supriya',NULL,'Sindkhedkar','1988-08-07','Female','9876541270',NULL,'abc@gmail.com','Aashirwad Niwas, In front of Radha Krishna theatre, Kawar nagar',1,20,429,'Akola',444001,'Raj Mahal Building, H-18, Nr. Geuba Moses school, Yerawada,Pune','0','EQLPS8645N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8940,'1008940','EMP0008940',NULL,NULL,'Chaitanya',NULL,'Bhokare','1986-01-30','Male','9876541271',NULL,'abc@gmail.com','Parijat, Nr Phadke hospital, Jatharpeth',1,20,429,'Akola',444005,'\"Parijat\", Nr Phadke hospital, Jatharpeth, Akola - 444005','0','AVNPB2367F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8941,'1008941','EMP0008941',NULL,NULL,'Varun',NULL,'Gupta','1989-01-13','Male','9876541272',NULL,'abc@gmail.com','Gupta Flour & Oil Ind, Mohata Mill Road, Naya Jin',1,20,429,'Akola',0,'Flat No 12, Rajyog Heights, Ganpati Chowk, Viman Nagar, Pune','0','ASOPG5576F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8942,'1008942','EMP0008942',NULL,NULL,'Kamran',NULL,'Ahmad','1982-01-03','Male','9876541274',NULL,'abc@gmail.com','H. No. 285/332/3, Sector - 3, Chakia',1,20,889,'Allahabad',211016,'Flat 31, B- II, Kamaldeep Gardens, Kondhwa Khurd, Pune - 411048','0','AKTPA5425E',NULL,'Married',6,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8943,'1008943','EMP0008943',NULL,NULL,'Akriti',NULL,'Srivastava','1989-04-28','Female','9876541275',NULL,'abc@gmail.com','438, Old Katra',1,20,889,'Allahabad',211002,'A-403 , Ginni Viviana, Nr. Mitcon Institute, Balewadi, Pune','0','EYIPS8285M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8944,'1008944','EMP0008944',NULL,NULL,'Amit',NULL,'Fartode','1986-06-07','Male','9876541278',NULL,'abc@gmail.com','26 Forest Colony, Yashoda Nagar',1,20,433,'Amravati',444602,'201 - B,Seetai Corner, Opposite DSK Toyota Showroom,Mumbai - Bangalore High way, Bavdhan, Pune - 411021','0','ABBPF8738L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8945,'1008945','EMP0008945',NULL,NULL,'Vijaya',NULL,'Rathod','1984-03-21','Female','9876541279',NULL,'abc@gmail.com','c/o, R.N.Rathod, Rajapeth, Near Tapar Hostel',1,20,433,'Amravati',444606,'c/o, Subramanyam, Flat No 204 B-Wing, Royal Heights, Bhau Patil Road, Pune - 411020 ','0','AOJPR5526F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8946,'1008946','EMP0008946',NULL,NULL,'Sayli',NULL,'Rathi','1990-07-12','Female','9876541280',NULL,'abc@gmail.com','Rathi Pura, AT Post, Yeoda, Tq Daryapur',1,20,433,'Amravati',0,'Prestige Classic Housing, D-1, Dava bazar, Mumbai Pune Highway, Chinchwad','0','CBMPR8848A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8947,'1008947','EMP0008947',NULL,NULL,'Akshay',NULL,'Metkar','1990-01-16','Male','9876541281',NULL,'abc@gmail.com','AT Chhoriya Colony, Nandgaon Khomdeshwar',1,20,433,'Amravati',444708,'Bramhachaitanya Bunglow, Kalpataru Colony, Karve Nagar, Pune- 411052','0','BOYPM6767F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8948,'1008948','EMP0008948',NULL,NULL,'Pavanprit',NULL,'Singh','1988-11-19','Male','9876541282',NULL,'abc@gmail.com','Gulzar Singh, House no 11, Village Malmohri, Naurangabad, Tatn Taran',1,20,623,'Amritsar',143401,'Harman House,Ranjeet Nagar,Yerwada, Pune - 411006','0','DSDPS7994K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8949,'1008949','EMP0008949',NULL,NULL,'Manmeet',NULL,'Singh','1989-08-26','Male','9876541283',NULL,'abc@gmail.com','4633/24, Guru Nanak Wara, Putli Ghar, P.O Khalsa College',1,20,623,'Amritsar',143001,'4633/24, Guru Nanak Wara, Putli ghar, P.O Khalsa College, Amritsar 143001','0','FOAPS4251G',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8950,'1008950','EMP0008950',NULL,NULL,'Rupali',NULL,'Helambe','1987-01-01','Female','9876541284',NULL,'abc@gmail.com','B/6, Vishaka Apt, Nandanvan Colony',1,20,255,'Aurangabad',0,'B/6, Vishaka Apt, Nandanvan Colony, Aurangabad','0','AFJPH2459A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:53','2017-05-26 23:30:53',NULL,NULL,NULL,NULL),(8951,'1008951','EMP0008951',NULL,NULL,'Apurv',NULL,'Mahajan','1987-07-04','Male','9876541285',NULL,'abc@gmail.com','Plot No. 189, Flat No. 10, Anant Apt, Jyoti Nagar',1,20,255,'Aurangabad',0,'B- 501, Swaminarayan Apt, Near Suncity, Off Sinhgad road, Vadgaon, Pune - 411041','0','BNWPM5837M',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8952,'1008952','EMP0008952',NULL,NULL,'Shariqa',NULL,'Mulla','1989-05-30','Female','9876541286',NULL,'abc@gmail.com','B. No. 76, M.H.B. Colony, Shah Bazar',1,20,255,'Aurangabad',0,'Survey No. 73, Hissa No. 1, Next to EON Free zone, Kharadi, Gera Emerald city','0','BTOPM0290G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8953,'1008953','EMP0008953',NULL,NULL,'Sanaya',NULL,'Shaikh','1986-03-10','Female','9876541287',NULL,'abc@gmail.com','H No 1-10-48, Juna Bazar',1,20,255,'Aurangabad',0,'Flat 503, B-11, R-Euphoria Society, Kondhwa Budruk, Opp Jalab Farms, Pune - 411048','0','CGEPS1986D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8954,'1008954','EMP0008954',NULL,NULL,'Akshay',NULL,'Sahani','1990-01-01','Male','9876541288',NULL,'abc@gmail.com','Flat No. 103, Plot No - 378, Sector-E, N-1, CIDCO',1,20,255,'Aurangabad',431003,'S. No- 22, Pavlina Terrace, Sopan Nagar Road, Wadgaon sheri, Pune - 411014','0','ESXPS1859C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8955,'1008955','EMP0008955',NULL,NULL,'Ramkrishna',NULL,'Umre','1982-06-04','Male','9876541290',NULL,'abc@gmail.com','Balaji Colony, Behind SBI Agri Development Branch',1,20,563,'Babai',0,'1204, B-8, Park Infinia, Gurudatta Nagar, Fursungi, Pune','0','AMRPR51424',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8956,'1008956','EMP0008956',NULL,NULL,'Arvind',NULL,'Kumar','1986-07-17','Male','9876541291',NULL,'abc@gmail.com','H.no - 25',1,20,NULL,'Bagharayadih',833216,'Flat no 103, Mahalaxmi Complex, Vishal nagar, Pimple - Nilakh, Pune - 411025','0','CSOPK1998K',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8957,'1008957','EMP0008957',NULL,NULL,'Mahesh',NULL,'Thengane','1988-05-03','Male','9876541293',NULL,'abc@gmail.com','Shri Sai Apt, Flat No. T-4, Ganpati ward',1,20,NULL,'Ballarpur',442701,'Om Sai bldg, Rajaram Patil Nagar, Lane no.2, nr. Forest County, Kharadi, Pune','0','AMOPT1337P',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8958,'1008958','EMP0008958',NULL,NULL,'Nivedita',NULL,'Snehi','1989-03-19','Female','9876541294',NULL,'abc@gmail.com','#6/4, 2nd main, 4th cross, Govindnagar',1,20,321,'Bangalore',560040,'#6/4, 2nd main, 4th cross, Govindnagar, Bangalore - 560040','0',' EMSPS0469B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8959,'1008959','EMP0008959',NULL,NULL,'Rohan',NULL,'Walavalkar','1982-09-16','Male','9876541297',NULL,'abc@gmail.com','828, Vaccine Depot Road, Pawar Compund, Tilakwadi',1,20,322,'Belgaum',590006,'C - 2, Building no 3, 1st Floor, Flat no 2, Vashi, Navi Mumbai','0','AAMPW4244Q',NULL,'Married',5,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8960,'1008960','EMP0008960',NULL,NULL,'Priyanka',NULL,'Thombre','1990-08-29','Female','9876541298',NULL,'abc@gmail.com','H. No. 26, Sainik Nagar, Laxmi Tek',1,20,322,'Belgaum',0,'Flat No. 201, Sainath Nagar, Karan Rhea, Wadgaonsheri','0','AUBPT3103C',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8961,'1008961','EMP0008961',NULL,NULL,'Sneha',NULL,'Joshi','1989-03-11','Female','9876541299',NULL,'abc@gmail.com','Flat no 566, Scheme No 40, Murlidhar Colony, Hanuman Nagar',1,20,NULL,'Belguam',9,'33 Keshav Kunj, Hanuman Nagar, Keshav Nagar, Mundhwa, Pune','0','APTPJ4186Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8962,'1008962','EMP0008962',NULL,NULL,'Vineet',NULL,'Agarwal','1981-10-15','Male','9876541300',NULL,'abc@gmail.com','Flat No. 003, Vijaya Classic, Vijaya Bank layout, Bilekahalli',1,20,NULL,'Bengaluru',560076,'Flat # D1103, Kolte Patil Langston,Kharadi,Pune - 411014','0','AFSPA7399K',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8963,'1008963','EMP0008963',NULL,NULL,'Rajesh',NULL,'Viswanath','1981-10-31','Male','9876541301',NULL,'abc@gmail.com','#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya',1,20,NULL,'Bengaluru',0,'#201, Innovative Raga, 9th Cross, 1st Main Devappa Layout, Krishnaiahna Palya, Bengaluru','0','AFGPR9583Q',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:54','2017-05-26 23:30:54',NULL,NULL,NULL,NULL),(8964,'1008964','EMP0008964',NULL,NULL,'Arti',NULL,'Saproo','1981-09-13','Female','9876541302',NULL,'abc@gmail.com','No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli',1,20,NULL,'Bengaluru',560097,'No.15 , Survey No.187/B, Indian Express Layout, Kodigehalli,Bangalore - 560097','0','ATBPS7910D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8965,'1008965','EMP0008965',NULL,NULL,'D',NULL,'Kusuma','1985-03-16','Female','9876541303',NULL,'abc@gmail.com','Flat No. 416, GCN White Palms, Ramagondanahalli, Narayanpura Road',1,20,NULL,'Bengaluru',560066,'# 602B, Anshul Athena Society, Sainath Nagar, Wadgaonsheri, Pune','0','BZPPKOO53G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8966,'1008966','EMP0008966',NULL,NULL,'Jayaprakash',NULL,'Mallikarjuna','1982-08-15','Male','9876541304',NULL,'abc@gmail.com','Devagiri Divine, #3, 30th Main, Banashankari III Stage',1,20,NULL,'Bengaluru',85,'Devagiri Divine, #3, 30th Main, Banashankari III Stage, Bangalore – 85','0','AEMPJ5353H',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8967,'1008967','EMP0008967',NULL,NULL,'Siddharth',NULL,'Pant','1981-06-09','Male','9876541305',NULL,'abc@gmail.com','9-203, Mantri Residency, Kalena Agrahara, Bannerghatta Road',1,20,NULL,'Bengaluru',6076,'9-203, Mantri Residency, Kalena Agrahara, Bannerghatta road, Bangalore - 6076','0','AGBPP2852N',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8968,'1008968','EMP0008968',NULL,NULL,'Isabell',NULL,'Jenninger','1988-07-30','Female','9876541306',NULL,'abc@gmail.com','Seestr,22 13353',NULL,20,NULL,'Berlin',0,'Seestr,22 13353 Berlin, Germany.','0','BBBPJ2598D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8969,'1008969','EMP0008969',NULL,NULL,'Ashvarya',NULL,'Verma','1983-10-05','Male','9876541318',NULL,'abc@gmail.com','F-1/44 Manas Apartment, Old Ashoka Garden, Behind Prabhat Petrol Pump',1,20,550,'Bhopal',462023,'B-4, Deokar Residency, Near Green Thing Restaurant, Wadgaon Sheri, Pune - 411014','0','AJJPV0966A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8970,'1008970','EMP0008970',NULL,NULL,'Prinkesh','Kumar','Giri','1989-05-22','Male','9876541319',NULL,'abc@gmail.com','E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Arera Colony',1,20,550,'Bhopal',0,'E-8, H.No. 152, Ishwar Nagar, Near Bharat Nagar, Areracolony Bhopal (MP)','0','BCUPG1337B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8971,'1008971','EMP0008971',NULL,NULL,'Shefali',NULL,'Arora','1990-09-14','Female','9876541320',NULL,'abc@gmail.com','H-448 , Aadharshila, Essarjee, East block, Awadhpuri',1,20,550,'Bhopal',0,'Guest House currently','0','BQRPA1921J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8972,'1008972','EMP0008972',NULL,NULL,'Shashi',NULL,'Agarwal','1981-10-23','Male','9876541321',NULL,'abc@gmail.com','LIG - 206, Kotra Sultanabad',1,20,550,'Bhopal',462003,'LIG - 206, Kotra Sultanabad, Bhopal, MP 462003','0','AINPA0752G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8973,'1008973','EMP0008973',NULL,NULL,'Prachi',NULL,'Jain','1990-01-25','Female','9876541322',NULL,'abc@gmail.com','Flat - 203, Inner court, GTB Complex, T T Nagar',1,20,550,'Bhopal',0,'L804, Cosmos Society, Magarpatta,Hadapsar, Pune','0','ATNPJ6287G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8974,'1008974','EMP0008974',NULL,NULL,'Rohit',NULL,'Jain','1985-05-19','Male','9876541323',NULL,'abc@gmail.com','240, Jain Nagar',1,20,550,'Bhopal',462030,'B-301, Gokul Crest, Sakore Nagar, Pune-411014','0','AMAPJ4881A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8975,'1008975','EMP0008975',NULL,NULL,'Richa',NULL,'Sharma','1986-04-28','Female','9876541324',NULL,'abc@gmail.com','14, Karariya Farm, Koluvada Bagicha, Khushipura ward 36, Tehsil Huzur',1,20,550,'Bhopal',462010,'Sagar Park  Society, Lane No.3, Samadhan,  Near Sarvodaya hotel,Chandan nagar,  Nagar Road, Pune','0','ECVPS7813A',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8976,'1008976','EMP0008976',NULL,NULL,'Dushyant',NULL,'Chourey','1988-06-12','Male','9876541325',NULL,'abc@gmail.com','363-B-Sector Saruadharm Colony Kolar Road Exclusive Apt-2 Flat no-4-1',1,20,550,'Bhopal',0,'Shubshree Woods Society Row House A1/2 Pimple Saudagar Pune','0','AKSPC3603R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8977,'1008977','EMP0008977',NULL,NULL,'Devi','Prasad','Swain','1989-06-23','Male','9876541327',NULL,'abc@gmail.com','Plot No. B2 /128, Lingaraj Vihar, Pokhariput',1,20,NULL,'Bhubaneshwar',0,'Plot No. B2 /128, Lingaraj Vihar, Pokhariput, Bhubaneshwar, Odisha','0','FTIPS6420N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:30:55','2017-05-26 23:30:55',NULL,NULL,NULL,NULL),(8978,'1008978','EMP0008978',NULL,NULL,'Tushar','Ranjan','Senapati','1982-10-26','Male','9876541328',NULL,'abc@gmail.com','AT / PO - Kuha, Dist - Khurda',1,20,604,'Bhubaneswar',751002,'AT / PO - Kuha, Dist - Khurda, Bhubaneswar - 751002','0','BXCPS8772H',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8979,'1008979','EMP0008979',NULL,NULL,'Subhrajyoti',NULL,'Ray','1986-02-15','Male','9876541329',NULL,'abc@gmail.com','LIV - 446, 4th Phase, Dumduma, H.B Colony',1,20,NULL,'Bhubaneswar',751019,'Guest House currently','0','BASPR6810A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8980,'1008980','EMP0008980',NULL,NULL,'Rajib',NULL,'Das','1982-09-24','Male','9876541330',NULL,'abc@gmail.com','Bandhgara, Bolpur',1,20,NULL,'Birbhum',731204,'B-505, S3,Lifestyle Apt, Kunal Icon Road, Pimple Saudagar, Pune - 411027','0','AOSPD8740G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8981,'1008981','EMP0008981',NULL,NULL,'A','Harish','Rao','1983-04-04','Male','9876541331',NULL,'abc@gmail.com','Holding No.4, Road 4, Contractors Area',1,20,297,'Bistupur',831001,'RH-13, Mahesh Society, Sambhajinagar, Chinchwad, Pune','0','AKWPR2786A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8982,'1008982','EMP0008982',NULL,NULL,'Amit',NULL,'Yerawar','1983-10-21','Male','9876541332',NULL,'abc@gmail.com','Near A.C.S. College, Sumitra Nagar,Tukum',1,20,NULL,'Chandrapur',442401,'Flat No 2, Venkatesh terrace, Near Columbia Asia Hospital, Sainath Nagar Square, Kharadi, Pune-411015     ','0','ACVPY2211L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8983,'1008983','EMP0008983',NULL,NULL,'Shantanu',NULL,'Maddiwar','1987-11-25','Male','9876541333',NULL,'abc@gmail.com','F2, Gulmohar Plaza, Datala Road, Ramnagar',1,20,NULL,'Chandrapur',442401,'Siddhi Paying Guest, Opp Forest Country lane, Kharadi','0','AVKPM1617N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8984,'1008984','EMP0008984',NULL,NULL,'Umed',NULL,'Padghan (Patil)','1982-03-08','Male','9876541336',NULL,'abc@gmail.com','At Post Mera B.K.',1,20,NULL,'Chikhali',443201,'Flat No- 4, Krushnavel Apt, Plot No 15, Girija Society, Kothrud, Pune-38','0','ARZPP3982E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8985,'1008985','EMP0008985',NULL,NULL,'Dyamaapa','Dummi','Nataraj','1985-08-15','Male','9876541337',NULL,'abc@gmail.com','No. 114, Dummi-1, Hollakere',1,20,NULL,'Chitradurga',0,'Maneesh Neelaya No. 24, 3rd Floor, 11th MAIN, 9TH Cross road, Raghavendra layout, Kammagondanahari - 560015, Bangalore','0','BNBPD4822N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8986,'1008986','EMP0008986',NULL,NULL,'Rahul',NULL,'Agarwal','1981-11-16','Male','9876541338',NULL,'abc@gmail.com','c/o Dr. O P Agarwal, GP Das Lane, Mahamadia Bazar, Chandni Chowk',1,20,606,'Cuttack',753002,'B3 / 304, Tuscan Estate, Kharadi - Mundhwa Road, Next to Radisson Hotel, Pune 411 014','0','AHGPA8906L',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8987,'1008987','EMP0008987',NULL,NULL,'Mahesh',NULL,'Nema','1988-05-11','Male','9876541339',NULL,'abc@gmail.com','42, Naya Bazar 1, Mahatma Gandhi Ward',1,20,NULL,'Damoh',0,'42, Naya Bazar 1, Mahatma Gandhi Ward, Damoh, UP','0','ALIPN7746H',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8988,'1008988','EMP0008988',NULL,NULL,'Jayesh',NULL,'Awaghade','1986-03-27','Male','9876541340',NULL,'abc@gmail.com','Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road',1,20,504,'Daund',413801,'Near Nagar Mori Chowk, Behind Hotel Shantai, Daund Patas Road,Daund, Pune - 413801','0','APSPA6177P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8989,'1008989','EMP0008989',NULL,NULL,'Sakshi',NULL,'Kaushal','1989-02-07','Female','9876541341',NULL,'abc@gmail.com','19360, Santosh Bhawan, Vidhya Peeth Marg, Vikas Nagar',1,20,863,'Dehradun',0,'F-801, Roystonea, Magarpatta City, Pune - 411013','0','CQAPK5363E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8990,'1008990','EMP0008990',NULL,NULL,'Saurabh',NULL,'Goyal','1984-04-14','Male','9876541342',NULL,'abc@gmail.com','3-Devlok Colony, Shimla Bypass, Majra',1,20,NULL,'Dehradun',248171,'3-Devlok Colony, Shimla Bypass, Majra, Dehradun, Uttarakhand - 248171','0','APTPG1071P',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:56','2017-05-26 23:30:56',NULL,NULL,NULL,NULL),(8991,'1008991','EMP0008991',NULL,NULL,'Varun',NULL,'Goela','1983-07-25','Male','9876541345',NULL,'abc@gmail.com','5,B-3, Bhamashah Marg',1,20,NULL,'Delhi',110009,'Flat 302, 4th Floor, Bhakti Apartments, Viman Nagar, Pune','0','AGWPG5937E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8992,'1008992','EMP0008992',NULL,NULL,'Sakshi',NULL,'Aggarwal','1987-07-20','Female','9876541346',NULL,'abc@gmail.com','B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9',1,20,NULL,'Delhi',110075,'B-206, Bhrigu Apartments, Plot no. 4, Dwarka Sec - 9, Delhi - 110075','0','AQXPA4523D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8993,'1008993','EMP0008993',NULL,NULL,'Vasudha',NULL,'Arora','1989-07-24','Female','9876541347',NULL,'abc@gmail.com','127, Bank Enclave, Laxmi Nagar',1,20,NULL,'Delhi',110092,'202, Emperor 1, Supertech Emrald Court, Sector - 93A, Noida - 201301, UP','0','NA',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8994,'1008994','EMP0008994',NULL,NULL,'Himanshu',NULL,'Thukral','1990-03-14','Male','9876541348',NULL,'abc@gmail.com','E-19, Jhilmil Colony, Shahdara',1,20,NULL,'Delhi',110095,'E-19, Jhilmil Colony, Shahdara, Delhi - 95','0','APVPT0686F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8995,'1008995','EMP0008995',NULL,NULL,'Ashish','Kumar','Jain','1983-09-11','Male','9876541349',NULL,'abc@gmail.com','House No. 28, 2nd Floor, Street No. 3, New Krishna Nagar',1,20,NULL,'Delhi',110051,'House No. 28, 2nd Floor, Street No. 3,  New Krishna Nagar, Delhi - 110051','0','AJXPJ0188J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8996,'1008996','EMP0008996',NULL,NULL,'Mahendra',NULL,'Nikam','1984-12-02','Male','9876541790',NULL,'abc@gmail.com','80, Gurudatta Colony, A/P Tal Shirpur',1,20,504,'Pune',425405,'C/O Nitin Nikam, 27/09, Pratik Society, Paud Road, Pune -  38','0','AKQPN1603G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8997,'1008997','EMP0008997',NULL,NULL,'Paresh',NULL,'Panchal','1987-06-02','Male','9876541791',NULL,'abc@gmail.com','42739, Shivaji Nagar, RHB Colony',1,20,504,'Pune',314001,'1/4, Shivaji Nagar, RHB Colony, Dungarpur, Rajasthan - 314001','0','BFTPP6032C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8998,'1008998','EMP0008998',NULL,NULL,'Reena',NULL,'Sahu','1984-04-06','Female','9876541792',NULL,'abc@gmail.com','OM Villa, D/O - Shri I.P.Sahu, Near Jai Public School, Hari Nagar, Katulboard',1,20,504,'Pune',491001,'Malhar Hostel, S.no 11, Rutuja Park, Karve Nagar, Pune - 411052','0','CEIPS1207M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(8999,'1008999','EMP0008999',NULL,NULL,'Harshita',NULL,'Gupta','1990-06-18','Female','9876541797',NULL,'abc@gmail.com','402, Parvana Apartment, Sector 21D',1,20,504,'Pune',0,'402, Parvana Apartment, Sector 21D, Faridabad, Delhi NCR','0','Applied',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(9000,'1009000','EMP0009000',NULL,NULL,'Naim',NULL,'Mahipal','1989-10-21','Male','9876541798',NULL,'abc@gmail.com','Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi',1,20,504,'Pune',125053,'Booth No B, Mahipal Kiryana Store, Near Railway Phatak, Bhattu Mandi, Fatehabad, Harayana - 125053','0','CQBPM2850F',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(9001,'1009001','EMP0009001',NULL,NULL,'Sambhaji','(Gopi)','Gaikwad','1985-11-27','Male','9876541799',NULL,'abc@gmail.com','Pandergaon',1,20,504,'Pune',431714,'Sarve No 22/11, Thite Vasti, Kharadi, Pune-14','0','BGLPG7865H',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,38,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(9002,'1009002','EMP0009002',NULL,NULL,'Abid',NULL,'Khan','1987-07-12','Male','9876541800',NULL,'abc@gmail.com','Village Manjhauli, PO + PS - Dumariya',1,20,504,'Pune',0,'Village Bhekrai, Nagar Mohalla, Dhamal Vadi, Behind Little Flower School, Sunjnda Complex, Hadapsar, Pune - 411028','0','CCHPK2098B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(9003,'1009003','EMP0009003',NULL,NULL,'Abhishek',NULL,'Jha','1989-11-22','Male','9876541801',NULL,'abc@gmail.com','Kh. No. 1704, New Karhera Colony',1,20,504,'Pune',201007,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','0','BAMPJ9378P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:57','2017-05-26 23:30:57',NULL,NULL,NULL,NULL),(9004,'1009004','EMP0009004',NULL,NULL,'Himanshu',NULL,'Khatri','1986-03-19','Male','9876541802',NULL,'abc@gmail.com','D-58, Swarna Jayanti Puram, Nr. Govind, Puram',1,20,504,'Pune',201013,'D-58, Swarna Jayanti Puram, Nr. Govind, Puram, Ghaziabad, UP 201013','0','ATYPK9191R',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9005,'1009005','EMP0009005',NULL,NULL,'Pankaj',NULL,'Kumar','1986-05-14','Male','9876541803',NULL,'abc@gmail.com','H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate',1,20,504,'Pune',152101,'H.no. 2460, Ward no 16, Baraf Wali Gali, Near Bharu Gate, Giddarbaha, Punjab - 152101','0','AUEPK1376P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9006,'1009006','EMP0009006',NULL,NULL,'Ramanath',NULL,'Mahindrakar','1986-10-21','Male','9876541804',NULL,'abc@gmail.com','Laxmi Niwas, Ward No. 4, H.No. 148/52, Durgabhat, Ponde',1,20,504,'Pune',403401,'Brahma Majestic, E-502, near Bakers point, NIBM road, Wanowrie, Pune - Maharashtra','0','BKYPM1873Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9007,'1009007','EMP0009007',NULL,NULL,'Ankit',NULL,'Shankhwalker','1988-10-02','Male','9876541805',NULL,'abc@gmail.com','Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar, Panaji',1,20,504,'Pune',0,'Srinivas Building, Dr. Pissurlekar Road, Nr. Kondaikar Nagar , Panaji, Goa','0','BOYPK5913B',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9008,'1009008','EMP0009008',NULL,NULL,'Harshit',NULL,'Tiwari','1983-12-16','Male','9876541807',NULL,'abc@gmail.com','D-109,Divya Nagar Colony, Near MMM Engg College',1,20,504,'Pune',273001,'C - 402, La Goriosa, Wadgaon Sheri, Pune - 411014','0','AJCPT7399G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9009,'1009009','EMP0009009',NULL,NULL,'Manasi',NULL,'Das','1983-05-14','Female','9876541809',NULL,'abc@gmail.com','A-26, Eldeco Green Meadows, Sector P',1,20,504,'Pune',0,'F-501, Marvel Ritz, Tupe Road, Behind Amanora Mall,Hadapsar, pune','0','ATWPB8080A',NULL,'Divorced',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9010,'1009010','EMP0009010',NULL,NULL,'Venkatrao',NULL,'Para','1989-01-14','Male','9876541811',NULL,'abc@gmail.com','25659,Kotha Cheruvukommupalem (V),Nuzendla (m)',1,20,504,'Pune',522659,'28/4/9,Galande Patil,Industrial Estate Near Bollywood Multiplex Pune-41101','0','BLEPP0215L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9011,'1009011','EMP0009011',NULL,NULL,'Gaurav',NULL,'Shukla','1982-10-02','Male','9876541812',NULL,'abc@gmail.com','G - 271, 2nd Floor, Sushant, LOK- 2, Sector 57',1,20,504,'Pune',122010,'Flat no. 302, Tower 51,Future Towers, Amanora Park Town,Hadapsar, Pune – 411028','0','BEFPS3078J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9012,'1009012','EMP0009012',NULL,NULL,'Nayanjyoti',NULL,'Das','1982-03-24','Male','9876541813',NULL,'abc@gmail.com','House No.33, Sandhyachal Nagar, Lalmati, Beltola',1,20,504,'Pune',781028,'B2/302, Lunkad Gold Coast, Viman Nagar, Pune - 411014, Maharashtra','0','AIFPD0419H',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9013,'1009013','EMP0009013',NULL,NULL,'Suhrid',NULL,'Barua','1981-07-19','Male','9876541814',NULL,'abc@gmail.com','KKB Road Chenikuthi \'Rupan\'',1,20,504,'Pune',781003,'Ganga Kunj Society H Block 201 Kalas Vishrantwadi Alandi Road Pune 411015','0','AIKPB6845Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9014,'1009014','EMP0009014',NULL,NULL,'Ancy',NULL,'Johnson','1989-12-16','Female','9876541815',NULL,'abc@gmail.com','F - 19, Chinav Appartment, Harishankar Puram, Lashkar',1,20,504,'Pune',0,'F - 19, Chinav Appartment, Harishankar Puram, Lashkar, Gwalior, MP','0','ASJPJ0976F',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9015,'1009015','EMP0009015',NULL,NULL,'Amandeep',NULL,'Chanyal','1990-11-01','Male','9876541816',NULL,'abc@gmail.com','Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road',1,20,504,'Pune',263139,'Uday Bhavani Vihar, Badi Mukhani, Pilikothi Road, Haldwani, Dist Nainital, Uttarakhand - 263139','0','AVUPC9932A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9016,'1009016','EMP0009016',NULL,NULL,'Ashok',NULL,'Kumar','1985-09-24','Male','9876541817',NULL,'abc@gmail.com','Vill. Kakkar PO. Chandruhi Teh.',1,20,504,'Pune',177024,'Willam Nagar Omkar Colony S.No. 9/1 Amrut Apartment Pimple Gurave Pune - 411027','0','AYXPK8982E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9017,'1009017','EMP0009017',NULL,NULL,'Atul',NULL,'Kumar','1989-08-10','Male','9876541818',NULL,'abc@gmail.com','C/o Keshav Kumar, Masipirhi, Viu - Babhankay Naman Vidya Road',1,20,504,'Pune',825301,'Jaiwant apartment, 3rd Floor, Mohan Nagar, Katraj, Pune - 411046','0','BQIPK6491A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:30:58','2017-05-26 23:30:58',NULL,NULL,NULL,NULL),(9018,'1009018','EMP0009018',NULL,NULL,'Chandra','Mohan','Reddy Gummireddy','1983-07-01','Male','9876541821',NULL,'abc@gmail.com','F. No. 304, VSR Classic - B, Road No - 6, KTR Colony, Nizampet',1,20,504,'Pune',500090,'F. No. 304, VSR Classic - B, Road no - 6, KTR Colony, Nizampet, Hyderabad - 500090','0','AMXPG5831E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9019,'1009019','EMP0009019',NULL,NULL,'Narasimha','Achryulu','PTC','1984-08-20','Male','9876541822',NULL,'abc@gmail.com','H.No. 20 - 120 / G-2, Aiswarya Enclave, Dayanand Nagar, Malkajgiri',1,20,504,'Pune',500047,'H.No. 20 - 120 / G-2, Aiswarya Enclave,Dayanand Nagar,Malkajgiri,Hyderabad - 500047','0','ALCPN8063H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9020,'1009020','EMP0009020',NULL,NULL,'Aparna',NULL,'Desai','1990-02-18','Female','9876541823',NULL,'abc@gmail.com','Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar Hospital, Tilak Nagar, New Nallakunta',1,20,504,'Pune',500044,'Flat no. 303, NAGARATNA Residency, Nr. Tilak nagar hospital, Tilak Nagar, New Nallakunta, Hyderabad, Telangana- 500044','0','BZEPD3548J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9021,'1009021','EMP0009021',NULL,NULL,'Raghavendra','Rao','Pattaswamy','1982-11-03','Male','9876541824',NULL,'abc@gmail.com','1-39/2, Prabhath nagar, Chaitanyapuri',1,20,504,'Pune',500060,'1-39/2, Prabhath nagar, Chaitanyapuri, Hyderabad - 500060','0','AQSPP0431C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9022,'1009022','EMP0009022',NULL,NULL,'P.T.','Satya','Kishore','1983-07-17','Male','9876541842',NULL,'abc@gmail.com','P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla',1,20,504,'Pune',0,'P. T Venkateswar-Lu, Near Gogulamma Temple, Ramalayan Street, Kadakatla, Indepalligudem, West Godavari (Dist) Andhra Pradesh','0','CZCPS0472F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9023,'1009023','EMP0009023',NULL,NULL,'Ranjit',NULL,'Pawar','1984-03-13','Male','9876541852',NULL,'abc@gmail.com','36, Netaji Subash Marg, Rambaug',1,20,504,'Pune',452004,'36, Netaji Subash Marg, Rambaug, Indore, M.P - 452004','0','BOCPP0288N',NULL,'Unmarried',6,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9024,'1009024','EMP0009024',NULL,NULL,'Jayesh',NULL,'Tare','1986-10-05','Male','9876541853',NULL,'abc@gmail.com','43-B, Vandana Nagar',1,20,504,'Pune',452001,'43-B, Vandana Nagar, Ext Indore, M.P 452001','0','AQHPT1083B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9025,'1009025','EMP0009025',NULL,NULL,'Mitisha',NULL,'Gupta','1987-09-30','Female','9876541854',NULL,'abc@gmail.com','121, Pandrinath Path Ada Bazar',1,20,504,'Pune',452004,'121, Pandrinath path Ada Bazar, Indore ( M.P.)- 452004','0','AQEPG153Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9026,'1009026','EMP0009026',NULL,NULL,'Sharayu',NULL,'Jain','1990-05-09','Female','9876541855',NULL,'abc@gmail.com','306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop',1,20,504,'Pune',0,'306, Chandana Apartment, 585/2-C.M.G. Road, Opp 56 Shop, Indore M.P','0','ASOPJ1992N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9027,'1009027','EMP0009027',NULL,NULL,'Jitendra','Kumar','Teli','1984-11-24','Male','9876541856',NULL,'abc@gmail.com','76, Gumasta Nagar',1,20,504,'Pune',452009,'Lunkad Heritage, Viman Nagar, Pune','0','AJKPT1618G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9028,'1009028','EMP0009028',NULL,NULL,'Ajay',NULL,'Shekhawat','1990-02-26','Male','9876541857',NULL,'abc@gmail.com','689 Road No. 8, Nanda Nagar',1,20,504,'Pune',452011,'689 Road No. 8, Nanda Nagar, Indore, MP 452011','0','FXPPS0254H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9029,'1009029','EMP0009029',NULL,NULL,'Himanshu',NULL,'Porwal','1988-12-05','Male','9876541858',NULL,'abc@gmail.com','65,(1-260) Sudama Nagar,Near Annapurna Mandir',1,20,504,'Pune',452009,'Flat no 1101,11th Floor,Platinum CL-3 Buliding,Bramha Suncity Vadgaonsheri Pune','0','CCLPP7208N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9030,'1009030','EMP0009030',NULL,NULL,'Purnima',NULL,'Verma','1990-06-26','Female ','9876541859',NULL,'abc@gmail.com','C/W-210, Shalimar Bunglow, Main Road, Sukhliya',1,20,504,'Pune',0,'Raj building, Borate Wasti, Chandan Nagar, Near Old Sai Mandir, Pune','0','AQNPV6801F',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9031,'1009031','EMP0009031',NULL,NULL,'Sheetanshu',NULL,'Mishra','1985-06-20','Male','9876541884',NULL,'abc@gmail.com','LIG-4 Teacher\'s Colony, Near Nyas Colony',1,20,504,'Pune',0,'LIG-4 Teacher\'s Colony, Near Nyas Colony, Itarsi (M.P)','0','AZBPM4383Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:30:59','2017-05-26 23:30:59',NULL,NULL,NULL,NULL),(9032,'1009032','EMP0009032',NULL,NULL,'Prosenjit',NULL,'Ganguly','1982-05-11','Male','9876541885',NULL,'abc@gmail.com','930/A , Near P & T Gate no 4 , west Niwarganj, Wright Town',1,20,504,'Pune',482002,'Flat 101, Madhusudan society, Off Lane 5, South Main Road, Near Tertulia’s, Koregaon Park, Pune.','0','AJAPG3716A',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9033,'1009033','EMP0009033',NULL,NULL,'Neha',NULL,'Sangtani','1988-12-13','Female','9876541886',NULL,'abc@gmail.com','Block NO.13, Kachnar Residency, Napier Town ',1,20,504,'Pune',482001,'Block NO.13, Kachnar Residency, Napier Town , Jabalpur, Madhya Pradesh-482001','0','FPAPS9025B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9034,'1009034','EMP0009034',NULL,NULL,'Geetika',NULL,'Gupta','1985-11-19','Female','9876541887',NULL,'abc@gmail.com','46, Sanchar Nagar, Damoh Road',1,20,504,'Pune',0,'D/601, Marvel Citrine, Rakshak Nagar, Kharadi, Pune','0','ALIPG1089J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9035,'1009035','EMP0009035',NULL,NULL,'Lokendra',NULL,'Bhati','1984-07-03','Male','9876541888',NULL,'abc@gmail.com','64/16, Pratap Nagar, Sangaver',1,20,504,'Pune',302033,'64/16, Pratap Nagar, Sangaver, Jaipur - 302033','0','ALOPB7215K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9036,'1009036','EMP0009036',NULL,NULL,'Megha',NULL,'Sharma','1985-02-20','Female','9876541889',NULL,'abc@gmail.com','2223, Sevda Bhawani, Above Shop No 376',1,20,504,'Pune',302001,'B-33 Mount N glory, Near Eon it Park, Kharadi, Pune ','0','FDVPS2342E',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9037,'1009037','EMP0009037',NULL,NULL,'Vipul',NULL,'Babbar','1988-01-12','Male','9876541890',NULL,'abc@gmail.com','E-42, Ram Nagar Extension, Sodala',1,20,504,'Pune',302006,'E-42, Ram Nagar Extension, Sodala, Jaipur 302006','0','ARRPB0444P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9038,'1009038','EMP0009038',NULL,NULL,'Ankit',NULL,'Gangwal','1985-01-19','Male','9876541891',NULL,'abc@gmail.com','4/25Jawahar Nagar',1,20,504,'Pune',0,'4/25Jawahar Nagar,Jaipur','0','AKVPG3010H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9039,'1009039','EMP0009039',NULL,NULL,'Jitendra',NULL,'Nikam','1983-02-07','Male','9876541892',NULL,'abc@gmail.com','25 - A, Arunoday Colony, Chopda',1,20,504,'Pune',425107,'Lane no 4, House no 4, Madhuban Society, Old Sanghavi, Pune - 27','0','AGDPN3585G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9040,'1009040','EMP0009040',NULL,NULL,'Amit',NULL,'Kathar','1989-05-14','Male','9876541893',NULL,'abc@gmail.com','Rajdurg 3 Mayadevi nagar, Mahabal Road',1,20,504,'Pune',425001,'Pritam residency, near Anaod park bus stop, Wadgaon sheri, Pune','0','DUCPK5384N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9041,'1009041','EMP0009041',NULL,NULL,'Prasad',NULL,'Jagtap','1986-08-10','Male','9876541894',NULL,'abc@gmail.com','55 / 66, Shiv colony',1,20,504,'Pune',425001,'B- 905, Umag Premiere, Ivy Estate, Wagholi, Pune - 410227','0',' AMGPJ0531P',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9042,'1009042','EMP0009042',NULL,NULL,'Sandesh',NULL,'Gade','1981-03-29','Male','9876541895',NULL,'abc@gmail.com','9, Shahu Nagar, behind Noorani Masjid',1,20,504,'Pune',425001,'9, Shahu Nagar, behind Noorani Masjid, Jalgaon,425001','0','AAXPG8252D',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9043,'1009043','EMP0009043',NULL,NULL,'Nishant',NULL,'Mantri','1985-07-06','Male','9876541896',NULL,'abc@gmail.com','H No 4118 - 19, Karwa Nagar, Mantha Road ',1,20,504,'Pune',431203,'F7 / 25, Hermes Heritage, Phase II, Shastri Nagar, Yerwada , Pune 411006','0','APHPM3028E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:00','2017-05-26 23:31:00',NULL,NULL,NULL,NULL),(9044,'1009044','EMP0009044',NULL,NULL,'Krishna',NULL,'Bamezai','1987-02-10','Male','9876541898',NULL,'abc@gmail.com','17/4, Pandoka Colony, Paloura',1,20,504,'Pune',0,'302, Mithila, Shree Siddhivinayak Sankalp, Undri, Pune - 60','0','CKZPB8985N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9045,'1009045','EMP0009045',NULL,NULL,'Manas','Ranjan','Sahoo','1990-10-08','Male','9876541900',NULL,'abc@gmail.com','B-2181, Narmada Vihar, NTPC Township',1,20,504,'Pune',495450,'B-2181, Narmada Vihar, NTPC Township, Jamnipali, Korba, Chattisgarh-495450','0','FGVPS8484L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9046,'1009046','EMP0009046',NULL,NULL,'Khushboo',NULL,'Manka','1990-01-17','Female','9876541901',NULL,'abc@gmail.com','Bhawani distributors, main road, Jugsalai',1,20,504,'Pune',831000,'Bhawani distributors, main road, Jugsalai, Jamshedpur, Jharkhand - 831000','0','BYAPM6813N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9047,'1009047','EMP0009047',NULL,NULL,'Adrita',NULL,'Das','1989-09-03','Female','9876541902',NULL,'abc@gmail.com','Q.No.598/2, Bagbera Railway Colony Near T.O.P',1,20,504,'Pune',831002,'Q.No.598/2, Bagbera Railway Colony Near T.O.P, Jamshedpur, Jharkhand - 831002','0','BMMPD4307A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9048,'1009048','EMP0009048',NULL,NULL,'Shweta',NULL,'Pandey','1982-08-23','Female','9876541903',NULL,'abc@gmail.com','House No 2542, Coriender Bldg, Vijaya Gardens, Baridih',1,20,504,'Pune',0,'Guest House currently','0','ARJPP1028P',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9049,'1009049','EMP0009049',NULL,NULL,'Abhijeet',NULL,'Kumar','1985-11-11','Male','9876541904',NULL,'abc@gmail.com','N - 58/7, Near Plaza Market, Telco Colony',1,20,504,'Pune',831004,'A - 204, Sri Ram Residency, Wagholi, Pune - 412207','0','AXMPK0670K',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9050,'1009050','EMP0009050',NULL,NULL,'Shwetank',NULL,'Dwivedi','1989-10-05','Male','9876541905',NULL,'abc@gmail.com','83, GF2, Gohmuri',1,20,504,'Pune',0,'Rukminini,Sasanenagar, Hadapsar, Pune','0','BOFPD5272M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9051,'1009051','EMP0009051',NULL,NULL,'Shraddha',NULL,'Patel','1984-08-04','Female','9876541909',NULL,'abc@gmail.com','E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01',1,20,504,'Pune',411028,'E1 801, Dreams Aakruti, Sr. No - 52, Plot - 01, Kalapadal, Pune 411028','0','BHSPP8501R',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:01','2017-05-26 23:31:01',NULL,NULL,NULL,NULL),(9052,'1009052','EMP0009052',NULL,NULL,'Umesh',NULL,'Shelar','1984-04-22','Male','9876541910',NULL,'abc@gmail.com','At – Sherpe (Patilwadi),  Post – Kurangavane',1,20,504,'Pune',416703,'C/o – Anurath Kisan Sherkhane , Sr. No. 59/2 B 1, Near Raigad Colony,Gulmohar Colony, Rahatani, Pune 411 017','0','BHOPS9509L',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9053,'1009053','EMP0009053',NULL,NULL,'Vineeth',NULL,'CL','1988-01-28','Male','9876541911',NULL,'abc@gmail.com','Cyrus House, Nr SNDP, Trichambaran, Taliparamba',1,20,504,'Pune',670141,'Cyrus House, Nr SNDP, Trichambaran, Taliparamba, Kannur, Kerala-670141','0','AQQPC1113N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9054,'1009054','EMP0009054',NULL,NULL,'Vipul',NULL,'Verma','1988-02-21','Male','9876541912',NULL,'abc@gmail.com','117/Q/169, Manoram Kunj, near Sardar Patel Public School, Sharda Nagar',1,20,504,'Pune',208025,'117/Q/169, Manoram Kunj, near Sardar Patel Public School,Sharda Nagar, Kanpur - 208025','0','AJLPV7155M',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9055,'1009055','EMP0009055',NULL,NULL,'Divya',NULL,'Chainani','1990-05-17','Female','9876541913',NULL,'abc@gmail.com','118/58,Kaushalpuri',1,20,504,'Pune',208012,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','AWBPC3777B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9056,'1009056','EMP0009056',NULL,NULL,'Anil',NULL,'Kumar','1990-12-03','Male','9876541916',NULL,'abc@gmail.com','H. No. 1581, LIG HBC , Sector 04',1,20,504,'Pune',0,'Guest House currently','0','CTAPK9522L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9057,'1009057','EMP0009057',NULL,NULL,'Zahoor',NULL,'Hurrah','1987-05-17','Male','9876541917',NULL,'abc@gmail.com','Nigeen Bagh, Krankshivan Colony, Sopore',1,20,504,'Pune',0,'Flat No. 504, Cindrella Apartment,  Shivneri Nagar,Kondhwa, Pune','0','AHNPHQ794A',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9058,'1009058','EMP0009058',NULL,NULL,'Shanu',NULL,'Dhamija','1987-03-30','Male','9876541925',NULL,'abc@gmail.com','H.No.- 569, Adarsh Colony, Samadhi road',1,20,504,'Pune',141401,'H.No.- 569, Adarsh Colony, Samadhi road, Khanna - 141401 (PB)','0','ARXPD0174A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9059,'1009059','EMP0009059',NULL,NULL,'Pooja',NULL,'Pingale','1990-04-22','Female','9876541933',NULL,'abc@gmail.com','Dr. Hedgewar colony, B6, Brahmin Ali',1,20,504,'Pune',0,'B-11,shivsagar co -op Hsg soc. Phase 1, Mauikloaug, Singhad Road, Pune','0','CHHPP3066R',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9060,'1009060','EMP0009060',NULL,NULL,'Krashna',NULL,'Patharakar','1985-03-31','Male','9876541934',NULL,'abc@gmail.com','Priti Niwas, Kranti chowk, Main road',1,20,504,'Pune',0,'Flat no.6, bldg 2, Salokha hsg soc. Near BSNL office, off Satara road, pune 411009','0','BRMPP5843C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9061,'1009061','EMP0009061',NULL,NULL,'Eswarareddy',NULL,'Osuri','1988-01-04','Male','9876541935',NULL,'abc@gmail.com','1-51A, Narapureddypalli Village, Kotcherla Kota, Prakasam',1,20,504,'Pune',523315,'Venky PG, Lane no 9, Sathyanagar Colony, Swami Smarta, Tukai Darson, Opp SP infocity, Fursungi - 412308','0','AAVPO0160E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9062,'1009062','EMP0009062',NULL,NULL,'Sagar',NULL,'Kamire','1982-02-12','Male','9876541936',NULL,'abc@gmail.com','Dnyan Laxmi Appartment, Flat No 10, Rajarampuri 8th Lane',1,20,504,'Pune',0,'Shree Laxmi Chaya Apppartment, Flat No 301, A Wing, Malwadi Hadapsar Pune.','0','AVDPK7092A',NULL,'Married ',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9063,'1009063','EMP0009063',NULL,NULL,'Santosh',NULL,'Kurade','1986-10-29','Male','9876541937',NULL,'abc@gmail.com','At/P, Wagharali, Tal Gahinglaj',1,20,504,'Pune',0,'At/P, Wagharali, Tal Gahinglaj, Kolhapur','0','BMMPK0996C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9064,'1009064','EMP0009064',NULL,NULL,'Sandip',NULL,'Chavan','1983-03-03','Male','9876541938',NULL,'abc@gmail.com','A/P Devale, Tal Panhala',1,20,504,'Pune',0,'Mahadev Nagar, Manjri Road, Hadapsar, Pune - 28','0','AJLPC2618Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9065,'1009065','EMP0009065',NULL,NULL,'Tejaswini',NULL,'Lohar','1982-12-13','Female','9876541939',NULL,'abc@gmail.com','122/A Rajopadhye Nagar, Sane Guruji Vashashat, Radha Nagari Road',1,20,504,'Pune',416012,'122/A Rajopadhye Nagar,Sane Guruji Vashashat,Radha nagari road,Kolhapur-416012','0','AFPPT6427E',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:02','2017-05-26 23:31:02',NULL,NULL,NULL,NULL),(9066,'1009066','EMP0009066',NULL,NULL,'Prasad',NULL,'Chougule','1989-04-04','Male','9876541940',NULL,'abc@gmail.com','Flat no 185, Dnyanhans, Soc No 1, R.K. Nagar, Marewadi',1,20,504,'Pune',0,'15/6 vishwesh Building, Snehankit Colony, Warje Naka, Kothrud, Pune','0','ATEPC8598A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9067,'1009067','EMP0009067',NULL,NULL,'Aditya',NULL,'Thard','1986-02-07','Male','9876541941',NULL,'abc@gmail.com','700 / C, Block P, New Alipore',1,20,504,'Pune',700053,'Kumar Padmalaya, Flat no A3/2, Aundh, Near Medipoint Hospital, Pune - 411006','0','AGWPT5140Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9068,'1009068','EMP0009068',NULL,NULL,'Srobon',NULL,'Banerjee','1985-02-04','Male','9876541942',NULL,'abc@gmail.com','174/10, Netaji Subhas Chandra Bose Road, Kanak Apartment, Flat - A-4',1,20,504,'Pune',700040,'A-104, ND, Ascent Apartment, Singasandra Aecs, Layout - A Block - Bangalore - 560068','0','ARBPB3810D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9069,'1009069','EMP0009069',NULL,NULL,'Pritam','Kumar','Sarkar','1985-10-18','Male','9876541943',NULL,'abc@gmail.com','Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur',1,20,504,'Pune',700127,'Azadnagar, vivekananda sarami (near hridaypur rikshaw stand) (n) 24 pgs, Post - Hridaypur, Kolkata - 700127','0','BLUPS3158K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9070,'1009070','EMP0009070',NULL,NULL,'Shantanu',NULL,'Jana','1985-12-05','Male','9876541944',NULL,'abc@gmail.com','Roypara road govt housing estate, Block - I, Flat No. 5',1,20,504,'Pune',700050,'Roypara road govt housing estate, Block - I, Flat No. 5, Kolkata - 700050','0','AOLPJ9106R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9071,'1009071','EMP0009071',NULL,NULL,'Avilin',NULL,'Mandal','1990-07-04','Male','9876541945',NULL,'abc@gmail.com','301, Prince Anwar Shah Road',1,20,504,'Pune',700045,'301, Prince Anwar Shah Road , Kolkatta - 700045','0','BVZPM9152N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9072,'1009072','EMP0009072',NULL,NULL,'Rahul',NULL,'Chakraborti','1984-05-23','Male','9876541946',NULL,'abc@gmail.com','45/1, New Tollygunge, P.O  Purba Dutiary',1,20,504,'Pune',700093,'45/1, New Tollygunge, P.O  Purba Dutiary, Kolkata 700093','0','AJAPC1468R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9073,'1009073','EMP0009073',NULL,NULL,'Rahul','Kumar','Burnwal','1988-08-15','Male','9876541947',NULL,'abc@gmail.com','2/H/3, Taltala Lane',1,20,504,'Pune',700014,'2/H/3, Taltala Lane Kolkata - 700014','0','BCJPB9778C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9074,'1009074','EMP0009074',NULL,NULL,'Sandeep',NULL,'Datta','1982-01-19','Male','9876541948',NULL,'abc@gmail.com','2A, Samilton Greens, 159A NSC Bose Road, Tollygaunge, Regent Park',1,20,504,'Pune',700040,'E1 / 401, Bramha SunCity, Vadgaon Sheri , Pune 411 014','0','AIGPD5352E',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9075,'1009075','EMP0009075',NULL,NULL,'Rishi',NULL,'Jayswal','1989-08-18','Male','9876541949',NULL,'abc@gmail.com','2/C, d.l Roy Street',1,20,504,'Pune',700006,'Guest House currently','0','APMPJ2844N',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9076,'1009076','EMP0009076',NULL,NULL,'Sourish',NULL,'Chatterjee','1981-01-03','Male','9876541950',NULL,'abc@gmail.com','1, Tilak Road',1,20,504,'Pune',700029,'1, Tilak Road, Kolkata - 700029','0','AZDPC4950H',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9077,'1009077','EMP0009077',NULL,NULL,'Narendra','Singh','Sidar','1984-06-09','Male','9876541952',NULL,'abc@gmail.com','Q. No.175/S/A, Balco Township',1,20,504,'Pune',495634,'Survey no 78/1, Sadguru Niwas, Samarth Nagar, Sai Chowk, navi Sanghvi, Pune - 27','0','FPRPS4688F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9078,'1009078','EMP0009078',NULL,NULL,'Alwyn',NULL,'Shirodkar','1985-07-14','Male','9876541955',NULL,'abc@gmail.com','House No 1554, Malawadi, Mangaon',1,20,504,'Pune',416519,'C/O Degaonkar Sanjay Gangadhar, S.No. 16/3/2, Flat No .B2-102, Shree Apt, Ambegaon Pathar, Pune - 411046','0','BRIPS7131L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:31:03','2017-05-26 23:31:03',NULL,NULL,NULL,NULL),(9079,'1009079','EMP0009079',NULL,NULL,'Ashish',NULL,'Suwarnkar','1986-01-21','Male','9876541958',NULL,'abc@gmail.com','G-11, Vishwasagar City, Katpur Road',1,20,504,'Pune',413512,'c/o G.P Railkar Flat No 1, Bldg A-2, Khrishna Leela Terrace, Lane - 4 Mahatma Society, Kothrud - 411038','0','DMCPS9217J',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9080,'1009080','EMP0009080',NULL,NULL,'Swapnil',NULL,'Badgire','1990-06-02','Male','9876541959',NULL,'abc@gmail.com','Vyankatesh Nivas, Yerme Nagar, Nr. DED College, Udgir',1,20,504,'Pune',413517,'S. No. 45/ A, Manthan Society, Somnath Nagar, Wadgaon Sheri, Pune 411014','0','BQKPB2258J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9081,'1009081','EMP0009081',NULL,NULL,'Dhankirti',NULL,'Parmar','1987-03-22','Female','9876541960',NULL,'abc@gmail.com','T - 186, Pratap Nagar, INS Shivaji',1,20,504,'Pune',410402,'Block S - 204, Madhuvanti, Nanded City, Sinhagad Road, Pune - 411041','0','BZAPP7583B',NULL,'Unmarried',6,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9082,'1009082','EMP0009082',NULL,NULL,'Aditya',NULL,'Bhadoriya','1987-04-23','Male','9876541961',NULL,'abc@gmail.com','628/SH/21/B, Shakti Nangar, Behind Harshita Complex',1,20,504,'Pune',226016,'628/SH/21/B, Shakti Nangar, Behind Harshita Complex, Lucknow - 226016','0','BFIPB3455A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9083,'1009083','EMP0009083',NULL,NULL,'Tripti','Rastogi','Vishnoi','1984-07-19','Female','9876541962',NULL,'abc@gmail.com','C - 79, Nirala Nagar',1,20,504,'Pune',226020,'A-205, Nandan Euphora, Near Kumar Samrudhi Housing Society, Vishrantwadi, Pune - 411015','0','AMPPR6894L',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9084,'1009084','EMP0009084',NULL,NULL,'Nayan',NULL,'Rijhwani','1987-09-13','Female','9876541965',NULL,'abc@gmail.com','25, Shukla colony, Veer villa',1,20,504,'Pune',0,'RH - 6, Pillar homes, Viman Nagar, Near Kidzee school, Pune - 411014','0','BJCPR6317K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9085,'1009085','EMP0009085',NULL,NULL,'Heena',NULL,'Phulwani','1990-08-13','Female','9876541966',NULL,'abc@gmail.com','Ward No. 37,7816, Jamidar Colony, Ramtekri',1,20,504,'Pune',458001,'Ward No. 37, 7816, Jamidar Colony, Ramtekri, Mandsaur, M.P - 458001','0','CVSPP3631B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9086,'1009086','EMP0009086',NULL,NULL,'Vartika',NULL,'Deshma','1989-12-24','Female','9876541967',NULL,'abc@gmail.com','H.No.2675, Bairagpura',1,20,504,'Pune',281001,'Tai niwas, Flat no.204, Opp Zensar, Kharadi, Pune','0','BHFPD4443P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9087,'1009087','EMP0009087',NULL,NULL,'Imroz',NULL,'Khan','1988-09-08','Male','9876541968',NULL,'abc@gmail.com','H No 539, Gali Chobdaran, Mandi Ram Dass ',1,20,504,'Pune',0,'E-103, Downtown Langston, Fountain Road, Kharadi, Pune','0','DASPK8557D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9088,'1009088','EMP0009088',NULL,NULL,'Sunidhi',NULL,'Kakkar','1989-07-25','Female','9876541969',NULL,'abc@gmail.com','L-15, Shastri Nagar',1,20,504,'Pune',250004,'L-15, Shastri Nagar, Meerut, UP - 250004','0','BNRPK1922N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9089,'1009089','EMP0009089',NULL,NULL,'Vikas',NULL,'Dimaniya','1985-08-07','Male','9876541970',NULL,'abc@gmail.com','House no. 183/1,New mandi keshru khera',1,20,504,'Pune',250001,'House no. 183/1,New mandi keshru khera,Meerut cantt – 250001\n','0','BBKPD2052H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9090,'1009090','EMP0009090',NULL,NULL,'Ashish',NULL,'Tendulkar','1981-12-01','Male','9876541971',NULL,'abc@gmail.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,504,'Pune',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','ADKPT0104D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9091,'1009091','EMP0009091',NULL,NULL,'Sameer',NULL,'Tendulkar','1981-12-02','Male','9876541972',NULL,'abc@gmail.com','5 Snehawardhini, Sonawala Road, Goregaon (East)',1,20,504,'Pune',400063,'B-304, Konark Meadows, BAIF Road, Behind Moze College, Wagholi, Pune - 412207','0','AEVPT9801R',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9092,'1009092','EMP0009092',NULL,NULL,'Mohammed',NULL,'Khan','1984-10-15','Male','9876541973',NULL,'abc@gmail.com','38 A ,52, Ashutosh Apartments , Napean Sea Raod',1,20,504,'Pune',400006,'Flat 1402, 14th Floor,Tower 12A, Amanora Park Town, Pune - 411028','0','BGXPK5662A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:04','2017-05-26 23:31:04',NULL,NULL,NULL,NULL),(9093,'1009093','EMP0009093',NULL,NULL,'Srinivasan',NULL,'Venkatesan','1988-01-20','Male','9876541974',NULL,'abc@gmail.com','RDP 1 / 35, Jaiganga CHS, Flat No. 16, Sector 2, Charkop, Kandivali West',1,20,504,'Pune',400067,'RDP 1 / 35, Jaiganga CHS, Flat no 16, Sector 2, Charkop, Kandivali West, Mumbai - 400067','0','CEKPS8900K',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9094,'1009094','EMP0009094',NULL,NULL,'Anas',NULL,'Patel','1986-09-27','Male','9876541975',NULL,'abc@gmail.com','22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104',1,20,504,'Pune',400008,'22, Aashiyana CHS, Maratha Mandir Marg, Mumbai Central, 1st Floor 104, Mumbai - 400008','0','ARTPP7285J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9095,'1009095','EMP0009095',NULL,NULL,'Dhir',NULL,'Patwa','1988-06-28','Male','9876541976',NULL,'abc@gmail.com','E/13, Rishikesh CHS, Evershine Nagar, Malad West',1,20,504,'Pune',400064,'E/13, Rishikesh CHS, Evershine Nagar, Malad west, Mumbai - 400064','0','BOYPP4836C',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9096,'1009096','EMP0009096',NULL,NULL,'Vijish','Haridasan','Kottarapat','1986-11-22','Male','9876541977',NULL,'abc@gmail.com','204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)',1,20,504,'Pune',0,'204 Navgokuldham CHS F cabin Katemanevali Kalyan (E)','0','AXGPK9131M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9097,'1009097','EMP0009097',NULL,NULL,'Salman',NULL,'Khan','1988-08-23','Male','9876541978',NULL,'abc@gmail.com','Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west',1,20,504,'Pune',400086,'Flat No-904, 1 - B, Pankhesha Baba Co-op Society, Ghatkopar west, Mumbai - 400086','0','BEFPK9131N',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9098,'1009098','EMP0009098',NULL,NULL,'Jitesh',NULL,'Rane','1987-10-08','Male','9876541979',NULL,'abc@gmail.com','803, 1A Wing, 8th Floor, Swadeshi Mhada Complex, Chunabhatti East Sion',1,20,504,'Pune',400022,'803, 1A Wing, 8th Floor,Swadeshi Mhada Complex,Chunabhatti East Sion,Mumbai – 400022','0','AQWPR7839Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9099,'1009099','EMP0009099',NULL,NULL,'Shweta',NULL,'Navarkar','1985-01-03','Female','9876541980',NULL,'abc@gmail.com','Neeltej Nagar, B - 17, Rambaug Lane - 4, Kalyan West',1,20,504,'Pune',421301,'Sunflower - 604, Park Springs Society, Porwal Road, Near Dhanori Jakat Naka, Lohegaon, Pune - 411032','0','AHWPN6238N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9100,'1009100','EMP0009100',NULL,NULL,'Hem',NULL,'Thaker','1990-07-20','Male','9876541981',NULL,'abc@gmail.com','302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate Bank, 60 Feet Road, Ghatkopar (East)',1,20,504,'Pune',400077,'302, Shree Shubh Apartment, M.P Vaidya Marg, Opp Syndicate bank, 60 feet road, Ghatkopar ( East ), Mumbai 77','0','ASQPT5375D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9101,'1009101','EMP0009101',NULL,NULL,'Nikhil',NULL,'Venkatavelu','1990-09-30','Male','9876541982',NULL,'abc@gmail.com','C-202, Kalpataru, Bhagoji Keer Road, Behind Paradise Cinema, Mahim West',1,20,504,'Pune',400016,'Guest House currently','0','AZHPV6024F',NULL,'Unmarried',5,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,39,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9102,'1009102','EMP0009102',NULL,NULL,'Anshika',NULL,'Gandotra','1989-01-30','Female','9876541983',NULL,'abc@gmail.com','13, Sravana, RC Church, Colaba',1,20,504,'Pune',400001,'Flat No. - 12, D Wing, Konark Campus, Viman Nagar, 411014','0','ASCPG0051B',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9103,'1009103','EMP0009103',NULL,NULL,'Priyanka',NULL,'Padhi','1989-01-22','Female','9876541984',NULL,'abc@gmail.com','2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill',1,20,504,'Pune',400031,'2258 / 198, Sector - 6, Kane Nagar, CGS Colony, Antop Hill, Mumbai - 400031','0','BQZPP3895A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9104,'1009104','EMP0009104',NULL,NULL,'Vinayak',NULL,'Joshi','1987-06-26','Male','9876541985',NULL,'abc@gmail.com','42875, B Wing, Sachin Society, Mithagar Road, Mulund (E)',1,20,504,'Pune',81,'5/20, B Wing, Sachin Society, Mithagar Road, Mulund ( E ), Mumbai - 81','0','AJVPJ0960C',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:05','2017-05-26 23:31:05',NULL,NULL,NULL,NULL),(9105,'1009105','EMP0009105',NULL,NULL,'Deepak',NULL,'Abhale','1984-12-10','Male','9876541986',NULL,'abc@gmail.com','B-404, Gopi Krishna Nagar, SN Dubey Road, Rawalpada, Dahisar(E)',1,20,504,'Pune',400068,'Swapna, S.No.6/2 , Lane No. 4, Nr. Reliance Mart, Charcoal Rest Lane, Kharadi, Pune-14','0','AKEPA8399J',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9106,'1009106','EMP0009106',NULL,NULL,'Chiranjeevi',NULL,'Choudhary','1990-03-22','Male','9876541990',NULL,'abc@gmail.com','Rajendra Bhawan, Bose press gali, Puran chand lane, Kalyani chowk',1,20,504,'Pune',0,'Rajendra Bhawan, Bose press gali, Puran chand lane,Kalyani chowk, Muzaffarpur, Bihar','0','AZCPC0794J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9107,'1009107','EMP0009107',NULL,NULL,'Sulaiman',NULL,'Islam','1982-09-08','Male','9876541991',NULL,'abc@gmail.com','VPO, Puranigudam, Na-Alimore',1,20,504,'Pune',782141,'Flat 306, Heritage, Bldg-3, NIBM , Undri road, Pune - 411060','0','AASP18414L',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9108,'1009108','EMP0009108',NULL,NULL,'Khushboo',NULL,'Gupta','1984-05-24','Female','9876541992',NULL,'abc@gmail.com','Flat no 404, Shree Radhey Apartment, opp to MSEB Office, Wardhaman Nagar',1,20,504,'Pune',440008,'Wing A3, Flat no. 802, Acolade Society, Opposite Hyundari Showroom, Tukaram Nagar, Kharadi, Pune, Maharashtra 411014','0','AKKPG0871B',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9109,'1009109','EMP0009109',NULL,NULL,'Suchit',NULL,'Nasre','1984-09-21','Male','9876541993',NULL,'abc@gmail.com','Raghunandan, 24/25Arya Nagar, Koradi Road, Behind Octroi Naka',1,20,504,'Pune',440030,'Flat no 105, Wing A, Goodwill Galaxy, Munjaba Wasti, Opposite RK Puram, Tingre Nagar, Pune','0','AHHPN1971D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9110,'1009110','EMP0009110',NULL,NULL,'Laxmikant',NULL,'Waghmare','1982-07-14','Male','9876541994',NULL,'abc@gmail.com','23, Pawanbhumi Layout, Somalwada Wardha Road',1,20,504,'Pune',440025,'Flat No-C-803, Etasha Building, S.NO 45/2A, Handewadi Road, Near Ganga Village, Hadapsar - Pune -411028','0','ABAPW7853L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9111,'1009111','EMP0009111',NULL,NULL,'Roshan',NULL,'Dhongade','1984-03-29','Male','9876541995',NULL,'abc@gmail.com','Plot No 56, Adarash Nagar Ranala Colony, Kamptee',1,20,504,'Pune',0,'Flat No 101, Bwing spectrum Apartment, Bavdhan','0','ATJPD3237A',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9112,'1009112','EMP0009112',NULL,NULL,'Kalyani',NULL,'Bhende','1987-12-27','Female','9876541996',NULL,'abc@gmail.com','50, Rani Bhoslae Vihar, Opp C P Berar College, Tulsibaug',1,20,504,'Pune',0,'201 , \'B\' Wing , Karan Rhea Apartment, Sainath nagar, Vadgaonsheri , Pune','0','CDPPB2021Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9113,'1009113','EMP0009113',NULL,NULL,'Suraj',NULL,'Dudhe','1983-11-22','Male','9876541997',NULL,'abc@gmail.com','Main Road, At    Kelor Saoner',1,20,504,'Pune',441112,'B6/302, Phase -II, Tirupati Campus, Road No. 2, Tingre Nagar, Vishrantwadi,Pune - 411015','0','ALZPD6503B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9114,'1009114','EMP0009114',NULL,NULL,'Varun',NULL,'Hatmode','1982-08-31','Male','9876541998',NULL,'abc@gmail.com','Plot No 24, Asmita Colony, Narendra Nagar',1,20,504,'Pune',440015,'C3/1201, Colonnade Society, Kharadi Bypass road, Kharadi, Pune - 411014','0','ACPPH2566R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9115,'1009115','EMP0009115',NULL,NULL,'Anshul',NULL,'Lavatre','1985-12-21','Female','9876541999',NULL,'abc@gmail.com','Uday Apartment,Raj Nagar, Chhaoni',1,20,504,'Pune',13,'Flat no9,Vijayraj Apartment,Famous Chowk New Sangvi','0','AKLPL5875H',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9116,'1009116','EMP0009116',NULL,NULL,'Chaitanya',NULL,'Godbole','1986-09-03','Male','9876542003',NULL,'abc@gmail.com','OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road',1,20,504,'Pune',422013,'OM, 7 Chitrangan, Savarkar Nagar, Gangapur Road, Nashik 422013','0','BCFPG7206Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9117,'1009117','EMP0009117',NULL,NULL,'Sunil',NULL,'Dhake','1985-11-03','Male','9876542004',NULL,'abc@gmail.com','Flat No. 18, Prabhu Square, Deepali Nagar, Mumbai Naka',1,20,504,'Pune',0,'Flat No. 18, Prabhu square, Deepali Nagar, Mumbai Naka, Nashik','0','AKIPD7844B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:06','2017-05-26 23:31:06',NULL,NULL,NULL,NULL),(9118,'1009118','EMP0009118',NULL,NULL,'Vishakha',NULL,'Avhad','1988-12-29','Female','9876542005',NULL,'abc@gmail.com','11, Arya Apartment, Kala Nagar, Jail Road',1,20,504,'Pune',0,'Guest House currently','0','BKYPA1823N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9119,'1009119','EMP0009119',NULL,NULL,'Chaitanya',NULL,'Nandan','1990-03-30','Male','9876542006',NULL,'abc@gmail.com','Yajurwed Housing Society,Opp Megharaj, Peth Road',1,20,504,'Pune',0,'Sai Nagari, Lane No. 9, Chandan Nagar, Pune - 411014','0','AXVPN5265A',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9120,'1009120','EMP0009120',NULL,NULL,'Sweta',NULL,'Jaiswal','1988-09-16','Female','9876542007',NULL,'abc@gmail.com','Type - 2B / 1712, HAL T/S, Ojar',1,20,504,'Pune',422207,'318 A & B, Snehsagar Apt, Plot No. 9 & 10, Shukrawar Peth, Pune - 411002','0','ATVPJ3128L',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9121,'1009121','EMP0009121',NULL,NULL,'Shubham',NULL,'Agarwal','1990-11-17','Male','9876542009',NULL,'abc@gmail.com','D-4089, 4th Floor, Bima Complex, Kalamboli',1,20,504,'Pune',410218,'D-4089, 4th Floor, Bima Complex, Kalamboli, Navi Mumbai- 410218','0','BURPA7875H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9122,'1009122','EMP0009122',NULL,NULL,'Savita',NULL,'Kaintura','1983-01-06','Female','9876542014',NULL,'abc@gmail.com','B - 252, Prodyogiki Apartment, Plot No 11, Sector 03, Dwarka',1,20,504,'Pune',110078,'C - 28, Isher Apartment, Near Montvertvirt Prestine, Aundh Road, Khadki Station, Pune - 411020','0','ARRPK1789L',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9123,'1009123','EMP0009123',NULL,NULL,'Priya',NULL,'Khemani','1986-08-02','Female','9876542015',NULL,'abc@gmail.com','B-129, Shivalik Colony, Near Malviya Nagar',1,20,504,'Pune',0,'E-7, 201 Ivy Apartments, Ivy Estate, Wagholi, Pune - 412207','0','AUCPK0151C',NULL,'Married ',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9124,'1009124','EMP0009124',NULL,NULL,'Steve',NULL,'Salvius','1985-09-16','Male','9876542016',NULL,'abc@gmail.com','310, Ajay Park, Najafgarh',1,20,504,'Pune',110043,'310, Ajay Park, Najafgarh, New Delhi - 110043','0','CLDPS3830E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9125,'1009125','EMP0009125',NULL,NULL,'Nikita',NULL,'Madan','1989-08-02','Female','9876542017',NULL,'abc@gmail.com','1404, Sector A, Pocket B and C, Vasant Kunj',1,20,504,'Pune',110070,'1404, Sector A, Pocket B and C, Vasant Kunj, New Delhi - 110070','0','BIDPM4258A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9126,'1009126','EMP0009126',NULL,NULL,'Chandan',NULL,'Kishore','1985-06-04','Male','9876542018',NULL,'abc@gmail.com','HNO. 63A, Street No. 5, Deepak Vihar, Najafgarh',1,20,504,'Pune',110043,'HNO. 63A, Street No. 5, Deepak Vihar,Najafgarh, New Delhi - 110043','0','CIPPK5347D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9127,'1009127','EMP0009127',NULL,NULL,'Sumit',NULL,'Lakhina','1986-12-08','Male','9876542019',NULL,'abc@gmail.com','90/25 A, 1st Floor Malviya Nagar',1,20,504,'Pune',0,'90/25 A, 1st Floor Malviya Nagar, New Delhi','0','EDWPS5924L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9128,'1009128','EMP0009128',NULL,NULL,'Sabyasachi','Guha','Raja','1982-02-04','Male','9876542020',NULL,'abc@gmail.com','House No 33 , Rajpur Khurd Extension, P.O. IGNOU',1,20,504,'Pune',110068,'House No 33 , Rajpur Khurd Extension, P.O. IGNOU, New Delhi 110068','0','AJCPG5778N',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9129,'1009129','EMP0009129',NULL,NULL,'Samaksh',NULL,'Dahiya','1987-01-25','Male','9876542021',NULL,'abc@gmail.com','A -1 / 261, Paschim Vihar',1,20,504,'Pune',63,'C - 902, The Latitude, NIBM, Kondwa','0','BHQPD2391M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9130,'1009130','EMP0009130',NULL,NULL,'Anshul',NULL,'Yadav','1985-10-02','Male','9876542022',NULL,'abc@gmail.com','434/8, Defence Officers Enclave, SP Marg, Chanakyapuri',1,20,504,'Pune',110021,'434/8, Defence Officers Enclave, SP Marg, Chanakyapuri, New Delhi - 110021','0','ACRPY2633G',NULL,'Married',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9131,'1009131','EMP0009131',NULL,NULL,'Manoj',NULL,'Kumar','1983-01-30','Male','9876542023',NULL,'abc@gmail.com','R2H-226, Street-7, Rajnagar-II, Palam',1,20,504,'Pune',0,'R2H-226, Street-7, Rajnagar-II, Palam , New Delhi','0','BDKPK27195',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:07','2017-05-26 23:31:07',NULL,NULL,NULL,NULL),(9132,'1009132','EMP0009132',NULL,NULL,'Gaurav',NULL,'Sharma','1982-04-01','Male','9876542024',NULL,'abc@gmail.com','D- 20 A , South Extension Part 2',1,20,504,'Pune',110049,'D- 20 A , South Extension Part 2 ,New Delhi – 110049','0','BHXP5944Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9133,'1009133','EMP0009133',NULL,NULL,'Harshal',NULL,'Patil','1988-10-26','Male','9876542026',NULL,'abc@gmail.com','Plot No. 36, Vivekanand Nagar, Bhadgaon road',1,20,504,'Pune',0,'House No 57, Pimple Gurav, Pune - 411061','0','DFIPP7319D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9134,'1009134','EMP0009134',NULL,NULL,'Jyoti',NULL,'Huria','1983-11-14','Female','9876542028',NULL,'abc@gmail.com','13/450, BTI Road',1,20,504,'Pune',488001,'H.No-307,48/2,Raj Palace,Dhanalaxmi Society ganesg nagar wadgaon sheri Pune','0','CIXPS6425E',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9135,'1009135','EMP0009135',NULL,NULL,'Pratiksha',NULL,'Mandhane','1990-08-05','Female','9876542029',NULL,'abc@gmail.com','Kaviraj Vishnu Nagar, Basmat Road',1,20,504,'Pune',431401,'Guest House Currently','0','BWRPM2996M',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9136,'1009136','EMP0009136',NULL,NULL,'Sushant',NULL,'Gupta','1981-02-25','Male','9876542106',NULL,'abc@gmail.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AHRPG0717C',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,40,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9137,'1009137','EMP0009137',NULL,NULL,'Simran',NULL,'Wadhwa','1983-04-20','Female','9876542107',NULL,'abc@gmail.com','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','AAYPW3067B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9138,'1009138','EMP0009138',NULL,NULL,'Rahul',NULL,'Sowani','1982-08-07','Male','9876542108',NULL,'abc@gmail.com','D 802, Mystique Moods, Viman Nagar',1,20,504,'Pune',411014,'D 802, Mystique Moods, Viman Nagar, Pune - 14','0','BHRPS9517B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9139,'1009139','EMP0009139',NULL,NULL,'Shrikrishna',NULL,'Bawachkar','1982-06-28','Male','9876542109',NULL,'abc@gmail.com','Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth',1,20,504,'Pune',411030,'Flat no. 24, 3rd Floor, Rama Vishnu Apartments, Off Tilak Road, Sadashiv Peth, Pune 30','0','AMTPB5555G',NULL,'Married',6,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9140,'1009140','EMP0009140',NULL,NULL,'Suryakant',NULL,'Sutar','1983-01-22','Male','9876542110',NULL,'abc@gmail.com','S/n 74, New Sangavi, Samarth Nagar, Near TATA Indicom Tower',1,20,504,'Pune',411027,'S/n 74, New Sangavi, Samarth Nagar, Near TATA indicom tower, Pune 27','0','BDGPS7033F',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9141,'1009141','EMP0009141',NULL,NULL,'Ravi',NULL,'Vitkar','1986-12-16','Male','9876542111',NULL,'abc@gmail.com','101, Lalchal, Kusalkar Putala, Gokhale Nagar',1,20,NULL,'Pune',411016,'101, Lalchal, Kusalkar Putala, Gokhale Nagar, Pune 411 016.','0','AHYPV4125G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,38,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9142,'1009142','EMP0009142',NULL,NULL,'Abhishek',NULL,'Bagrodia','1985-05-03','Male','9876542112',NULL,'abc@gmail.com','E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilakh',1,20,504,'Pune',411007,'E-702, 24K Glitterati Apts, Near Naandgude School, Vishal Nagar, Pimple Nilkah, Pune-411007\n','0','AJJPB7169D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9143,'1009143','EMP0009143',NULL,NULL,'Divya',NULL,'Prasad','1982-12-21','Female','9876542113',NULL,'abc@gmail.com','48/2,Dhanlaxmi Society,Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri',1,20,504,'Pune',411014,'48/2,Dhanlaxmi Society,Ganesh Nagar,Near Anand Park bus stop,Vadgaonsheri, Pune -411014','0','AASPU9653K',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9144,'1009144','EMP0009144',NULL,NULL,'Ninad',NULL,'Kadake','1982-02-20','Male','9876542114',NULL,'abc@gmail.com','12 D, Shankar Chhaya Apartment, Near Mhatre Bridge, Erandwane',1,20,504,'Pune',411004,'12 D Shankar Chhaya Apartment Near Mhatre Bridge Erandwane Pune. 411 004.','0','AYBPK7303F',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9145,'1009145','EMP0009145',NULL,NULL,'Mayuresh',NULL,'Wagh','1982-10-18','Male','9876542115',NULL,'abc@gmail.com','53, Mukund Nagar, Shree Ahireshwar Wadi',1,20,504,'Pune',411037,'53, Mukund Nagar, Shree Ahireshwar Wadi, Pune 411037','0','AAPPW7193R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:08','2017-05-26 23:31:08',NULL,NULL,NULL,NULL),(9146,'1009146','EMP0009146',NULL,NULL,'Sneha',NULL,'Shinde','1986-08-26','Female','9876542116',NULL,'abc@gmail.com','Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada',1,20,504,'Pune',411006,'Fl no: 1656 Bldg no: M/9 Maharashtra Housing Board Yerwada Pune 411006','0','CHIPS5059Q',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9147,'1009147','EMP0009147',NULL,NULL,'Renuka','Vikram','Vaishnav','1982-11-19','Female','9876542117',NULL,'abc@gmail.com','Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar, Village Mundhwa',1,20,504,'Pune',411036,'Flat no 106, First Floor, Survey No. 36, Hissa No 1/2, New Survey No 36, Keshavnagar,Village Mundhwa, Pune- 411036','0','AOZPM2520A',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9148,'1009148','EMP0009148',NULL,NULL,'Bharat',NULL,'Pethe','1982-03-16','Male','9876542118',NULL,'abc@gmail.com','432 B Narayan Peth, Amit Prerana Appt, Flat no 302',1,20,504,'Pune',411030,'432 B Narayan Peth, Amit Prerana Appt, Flat no 302, Pune\n-30\n','0','ATBPP9676P',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9149,'1009149','EMP0009149',NULL,NULL,'Chaitanya',NULL,'Kanade','1983-10-13','Male','9876542119',NULL,'abc@gmail.com','S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai Gas Agency, Wadgaon Sheri',1,20,504,'Pune',411014,'S.No.41/4D,Plot no 16, Shri Nagar Housing Society, Near Jai gas agency, Wadgaonsheri, Pune- 411014.','0','ASTPK1180A',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9150,'1009150','EMP0009150',NULL,NULL,'Sanjay',NULL,'Ujalambkar','1981-03-12','Male','9876542120',NULL,'abc@gmail.com','Flat no - A - 15, Sukhwani Discover, 3rd Floor, Near Sant Nirankari Satsang Bhavan, Vijaynagar, Kalewadi',1,20,504,'Pune',411017,'Flat no - A - 15, Sukhwani Discover,3rd Floor , Near Sant Nirankari Satsang Bhavan, Vijaynagar,Kalewadi,Pune - 411017','0','AAOPU6003F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9151,'1009151','EMP0009151',NULL,NULL,'Balaji',NULL,'Khandade','1981-08-20','Male','9876542121',NULL,'abc@gmail.com','Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi',1,20,504,'Pune',411017,'Shri Sai Complex, Flat - 201, S.No.48/13/2, Opp Sajjangad Transformer, Link Road, Kalewadi , Pune - 411017','0','AWNPK5452B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9152,'1009152','EMP0009152',NULL,NULL,'Yogita',NULL,'Wahalkar','1987-07-28','Female','9876542122',NULL,'abc@gmail.com','P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad',1,20,504,'Pune',411033,'P/3, swapnamanjusha Soc, Giriraj Housing Complex, Bijalinagar, Chinchwad, Pune-33','0','ABEPW1646D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9153,'1009153','EMP0009153',NULL,NULL,'Saket',NULL,'Kumar','1982-04-09','Male','9876542123',NULL,'abc@gmail.com','Flat No. 62, Tulip Appt, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'Flat No. 62, Tulip Appt, Neco garden, Viman Nagar, Pune - 411014','0','AYMPK6852E',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9154,'1009154','EMP0009154',NULL,NULL,'Shashank',NULL,'Kulkarni','1984-10-07','Male','9876542124',NULL,'abc@gmail.com','Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari',1,20,504,'Pune',411041,'Row Hose No. 4 High Bliss, Near Kailas Jeevan Factory, Dhayari 411041','0','BMFPK8112B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9155,'1009155','EMP0009155',NULL,NULL,'Shrikant',NULL,'Sankpal','1985-02-28','Male','9876542125',NULL,'abc@gmail.com','138, Mangalwar Peth, Opp Raj Auto',1,20,504,'Pune',411011,'138, Mangalwar Peth, Opp Raj Auto, Pune - 411011','0','CNNPS4165E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9156,'1009156','EMP0009156',NULL,NULL,'Rahil',NULL,'Khan','1982-06-20','Male','9876542126',NULL,'abc@gmail.com','Victoria Mansions,7, Castellino Road',1,20,504,'Pune',411001,'Victoria Mansions, 7, Castellino Road, Pune - 411001','0','APKPK5346N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9157,'1009157','EMP0009157',NULL,NULL,'Chandraprakash',NULL,'Sharma','1986-01-06','Male','9876542127',NULL,'abc@gmail.com','S.No 79/1 CTS 038, 10 Near Marathi School, Kalewadi',1,20,504,'Pune',411017,'S.No 79/1 CTS 038,10 Near Marathi School,Kalewadi,Pune','0','CIFPS1598N',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9158,'1009158','EMP0009158',NULL,NULL,'Karuna',NULL,'Ovhal','1984-01-17','Female','9876542128',NULL,'abc@gmail.com','43020, Pratik Nagar, Vishrantwadi, Yerwada',1,20,504,'Pune',411006,'10/12,Pratik Nagar,Vishrantwadi ,Yerwada,Pune-411006.','0','AAQPO6244G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:09','2017-05-26 23:31:09',NULL,NULL,NULL,NULL),(9159,'1009159','EMP0009159',NULL,NULL,'Sneha',NULL,'Govindalwar','1986-09-19','Female','9876542129',NULL,'abc@gmail.com','Chintamani Nagar-3, A-11/29, Bibwewadi',1,20,504,'Pune',411037,'Chintamani Nagar-3,A-11/29,Bibwewadi,Pune - 411037','0','ARMPG3954C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9160,'1009160','EMP0009160',NULL,NULL,'Priya',NULL,'Dikhale','1987-06-10','Female','9876542130',NULL,'abc@gmail.com','Shriram Nagar, Bldg - B4, Flat no 9, Aundh',1,20,504,'Pune',411007,'Shriram Nagar, Bldg - B4, Flat no 9, Aundh, Pune - 411007','0','BZEPD4523M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9161,'1009161','EMP0009161',NULL,NULL,'Moses',NULL,'Gaikwad','1984-08-12','Male','9876542131',NULL,'abc@gmail.com','Phayer Road, Opp Hutchings School, Bungalow No 10',1,20,504,'Pune',411040,'Phayer Road, Opp Hutchings School, Bungalow no 10, Pune - 411040','0','BKZPG9139E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9162,'1009162','EMP0009162',NULL,NULL,'Swarangi',NULL,'Pandey','1984-09-29','Female','9876542132',NULL,'abc@gmail.com','C2 - 301, Brahma Suncity, Wadgaonsheri',1,20,504,'Pune',411014,'C2 - 301, Brahma Suncity, Wadgaonsheri, Pune - 411014','0','BLSPP1053L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9163,'1009163','EMP0009163',NULL,NULL,'Satish',NULL,'Shinde','1983-04-28','Male','9876542133',NULL,'abc@gmail.com','Harshada Samartha Society, D/9, Pimple Saudagar',1,20,504,'Pune',411027,'Harshada Samartha Society, D/9, Pimple Saudagar, Pune - 411027','0','BMQPS7340A',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,36,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9164,'1009164','EMP0009164',NULL,NULL,'Pradnya',NULL,'Bathe','1983-10-29','Female','9876542134',NULL,'abc@gmail.com','RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar',1,20,504,'Pune',411028,'RH 42, Swarvihar Co - op Society, Sasane Nagar, Hadapsar, Pune - 411028','0','BBNPB4806L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9165,'1009165','EMP0009165',NULL,NULL,'Anil',NULL,'Jadhav','1981-05-08','Male','9876542135',NULL,'abc@gmail.com','Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi',1,20,504,'Pune',411037,'Flat no D - 34, Bhagyanagari - II, Behind Chintamaninagar Phase III, Bibewadi, Pune - 411037','0','ANLPJ8471G',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9166,'1009166','EMP0009166',NULL,NULL,'Omkar',NULL,'Dhavale','1988-06-04','Male','9876542136',NULL,'abc@gmail.com','9, Mangesh-Shree Apartment, 1464, Sadashiv Peth',1,20,504,'Pune',411030,'9, Mangesh-Shree Apartment, 1464, Sadashiv Peth, Pune - 411030','0','AKSPD8810F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9167,'1009167','EMP0009167',NULL,NULL,'Praveen',NULL,'Gaikwad','1983-02-23','Male','9876542137',NULL,'abc@gmail.com','Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori, Near Muchmore Society',1,20,504,'Pune',411015,'Guru Krupa, SR.NO.31/6, Chaudhary Nagar Dhanori,Landmark:Near Muchmore Society, Pune - 411015','0','AJCPG8609C',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9168,'1009168','EMP0009168',NULL,NULL,'Apurv',NULL,'Singh','1987-01-09','Male','9876542138',NULL,'abc@gmail.com','702, Amber, Nyati Empire, Kharadi',1,20,504,'Pune',411014,'702, Amber, Nyati Empire, Kharadi, Pune -411014','0','BWGPS2911F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9169,'1009169','EMP0009169',NULL,NULL,'Siddhartha',NULL,'Dongre','1984-10-23','Male','9876542139',NULL,'abc@gmail.com','Vishwanath Rajiv Nagar South, Plot No 24, S. No 203/2B, Vimannagar',1,20,504,'Pune',411014,'Vishwanath Rajiv Nagar South, Plot No 24, S.no 203/2B, Vimannagar, Pune - 411014','0','BACPD6306B',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9170,'1009170','EMP0009170',NULL,NULL,'Adneya',NULL,'Audhi','1987-05-01','Male','9876542140',NULL,'abc@gmail.com','43 Kranti Society, Sahakar Nagar - 2',1,20,504,'Pune',411009,'43 Kranti Society, Sahakar Nagar - 2, Pune - 411009','0','ALLPA6763E',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:10','2017-05-26 23:31:10',NULL,NULL,NULL,NULL),(9171,'1009171','EMP0009171',NULL,NULL,'Prashant',NULL,'Chothe','1982-04-25','Male','9876542141',NULL,'abc@gmail.com','A2 - 303, Tirupati Campus-Ph II, Lane-2, Adarsh Col, Tingre Nagar Rd, Vishrantwadi',1,20,504,'Pune',411015,'A2 - 303, Tirupati Campus-Ph II, Lane-2, Adarsh Col, Tingre Nagar Rd, Vishrantwadi, Pune - 411015','0','AGMPC3282G',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9172,'1009172','EMP0009172',NULL,NULL,'Vijay',NULL,'Baviskar','1984-03-05','Male','9876542142',NULL,'abc@gmail.com','Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar',1,20,504,'Pune',411032,'Silver Avenue, F-8, P-61, S NO 34/1, MR Kekan Gas, Tingre Nagar, Pune - 411032','0','ASJPB7504M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9173,'1009173','EMP0009173',NULL,NULL,'Amit',NULL,'Sangewar','1984-06-25','Male','9876542143',NULL,'abc@gmail.com','Pimple Sadan F/1, Near PCMC School, Kasarwadi',1,20,504,'Pune',411034,'Pimple Sadan F/1, Near PCMC School, Kasarwadi Pune - 411034','0','BJRPS9075C',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9174,'1009174','EMP0009174',NULL,NULL,'Safa',NULL,'Burney','1987-05-25','Female','9876542144',NULL,'abc@gmail.com','A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar',1,20,504,'Pune',411013,'A-403, Sukhwani Emerald, Magarpatta Road, Hadapsar, Pune - 411013','0','BKTPB8073Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9175,'1009175','EMP0009175',NULL,NULL,'Prerna',NULL,'Rawal','1988-08-31','Female','9876542145',NULL,'abc@gmail.com','B1,101, Prasad Nagar, Wadgaon Sheri',1,20,504,'Pune',411014,'B1, 101, Prasad Nagar, Wadgaon Sheri, Pune - 411014','0','BYAPR1750D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9176,'1009176','EMP0009176',NULL,NULL,'Asad',NULL,'Qureshi','1985-05-27','Male','9876542146',NULL,'abc@gmail.com','493, Kuresh Nagar, Near Ismail Building, Khadki',1,20,504,'Pune',411003,'493, Kuresh Nagar, Near IsmailBuilding, Khadki, Pune - 411003','0','AAIPQ2593E',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9177,'1009177','EMP0009177',NULL,NULL,'Parminder',NULL,'Kaur','1981-04-22','Female','9876542147',NULL,'abc@gmail.com','A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park',1,20,504,'Pune',411001,'A-41/42, The Wood Society, Lane E, North Main Road, Koregaon Park, Pune -  411001.','0','AMJPK8117B',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,40,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9178,'1009178','EMP0009178',NULL,NULL,'Tushar',NULL,'Patil','1987-12-19','Male','9876542148',NULL,'abc@gmail.com','Flat no 404, Omkar Swaroop Society, Narayangaon, Junnar',1,20,504,'Pune',410504,'B - 19, C Building, kate Residency, Dapodi, Pune - 411012','0','BHYPP9525M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9179,'1009179','EMP0009179',NULL,NULL,'Harshad',NULL,'Solanki','1989-04-20','Male','9876542149',NULL,'abc@gmail.com','1680, R.S.Kedari Road, Camp',1,20,504,'Pune',411001,'1680, R.S.Kedari Road, Camp, Pune - 411001','0','EOVPS8725B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9180,'1009180','EMP0009180',NULL,NULL,'Anup',NULL,'Kulkarni','1987-02-18','Male','9876542150',NULL,'abc@gmail.com','Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad',1,20,504,'Pune',411033,'Flat No. 102, 17/5 Vikhai House, opp of Mejwani Hotel, Chinchwad, Pune- 411033','0','BXZPK2725F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9181,'1009181','EMP0009181',NULL,NULL,'Mayur',NULL,'Deshmukh','1987-10-24','Male','9876542151',NULL,'abc@gmail.com','A-605, Elite Homes, Near Akshara International School, Tathwade',1,20,504,'Pune',411033,'A-605, Elite Homes, Near Akshara International School, Tathwade Pune - 411033','0','AVXPD6098D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9182,'1009182','EMP0009182',NULL,NULL,'Akshay',NULL,'Bhansali','1989-10-13','Male','9876542152',NULL,'abc@gmail.com','A-98, Satyapuram society, Saswad road, Phursungi',1,20,504,'Pune',412308,'A-98, Satyapuram society, Pune, Saswad road, Phursungi, Pune-412308','0','AZBPB2313F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:11','2017-05-26 23:31:11',NULL,NULL,NULL,NULL),(9183,'1009183','EMP0009183',NULL,NULL,'Prachi',NULL,'Gandhi','1988-10-10','Female','9876542153',NULL,'abc@gmail.com','A 1/2, Agrasen Society, 8 Koregaon Park',1,20,504,'Pune',411001,'A 1/2, Agrasen Society, 8 Koregaon Park, Pune - 411001','0','AYYPG9090L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9184,'1009184','EMP0009184',NULL,NULL,'Shweta',NULL,'Gogawale','1985-07-22','Female','9876542154',NULL,'abc@gmail.com','Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri',1,20,504,'Pune',411014,'Sr. No. 48/4, Shreekunj, behind Kuba Mazid, Old Mundwa Road, Ganeshnagar, Vadgaonsheri, Pune - 411014','0','ARYPG6943R',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9185,'1009185','EMP0009185',NULL,NULL,'Samiya',NULL,'Ayaz','1990-09-06','Female','9876542155',NULL,'abc@gmail.com','F- 603, Shefalika Heights, Near Kinara Hotel, Shivtrinagar, Kothrud',1,20,504,'Pune',411038,'F- 603, Shefalika Heights, near Kinara Hotel, Shivtrinagar, Kothrud, Pune, Maharashtra - 411038','0','BBIPA4160P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9186,'1009186','EMP0009186',NULL,NULL,'Sourabh',NULL,'Kulkarni','1984-01-01','Male','9876542156',NULL,'abc@gmail.com','E - 6, Rounak Residency, Mayur Colony, Kothrud',1,20,504,'Pune',411038,'E - 6, Rounak Residency, Mayur colony, Kothrud, Pune - 38','0','BHRPK4752L',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9187,'1009187','EMP0009187',NULL,NULL,'Rishabh',NULL,'Nigam','1986-05-30','Male','9876542157',NULL,'abc@gmail.com','Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad',1,20,504,'Pune',411041,'Flat no 13, Wing AB, Swarnagri Society, Vadgaon Budruk, Singhad - 411041','0','AJLPN3876H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9188,'1009188','EMP0009188',NULL,NULL,'Susshruth',NULL,'Apshankar','1981-05-16','Male','9876542158',NULL,'abc@gmail.com','303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park',1,20,504,'Pune',411001,'303, Garnet Lapis Lazuli Appartment, Lane 5, South Main Road, Koregaon Park, Pune - 411001','0','AKWPA0122F',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,40,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9189,'1009189','EMP0009189',NULL,NULL,'Sneha',NULL,'Deshpande','1986-04-12','Female','9876542159',NULL,'abc@gmail.com','#41, Sunflower Building, Neco Garden, Viman Nagar',1,20,504,'Pune',411014,'#41, Sunflower Building, Neco Garden, Viman Nagar, Pune- 411014','0','AOIPD5779B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9190,'1009190','EMP0009190',NULL,NULL,'Ashish',NULL,'Dongre','1985-08-31','Male','9876542160',NULL,'abc@gmail.com','Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar',1,20,504,'Pune',411028,'Plot No. 80, Shahajiraje Bhosale CHS, Behind Amar cottage, Bhosale Nagar, Hadapsar, Pune - 411028','0','BEDPD1656R',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9191,'1009191','EMP0009191',NULL,NULL,'Radhika',NULL,'Bajaj','1990-09-22','Female','9876542161',NULL,'abc@gmail.com','589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury Park',1,20,504,'Pune',411037,'589/B, Sai Ram Apt, Flat No. 4, Vidyasagar Colony Salisbury park, Pune - 37','0','BMJPB2481E',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9192,'1009192','EMP0009192',NULL,NULL,'Mitesh',NULL,'Oswal','1983-04-12','Male','9876542162',NULL,'abc@gmail.com','B- 502/ Eisha Pearl, Kondhwa BK',1,20,504,'Pune',411048,'B- 502/ Eisha Pearl, Kondhwa BK, Pune - 48','0','AAIPO8158K',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9193,'1009193','EMP0009193',NULL,NULL,'Ammaar',NULL,'Shaikh','1986-05-06','Male','9876542163',NULL,'abc@gmail.com','815 / 16, Bhawani peth opp ICC, Cable office',1,20,504,'Pune',411042,'Plot No. 5 A, Harmony Society Near gangadhan chowk Pune 411037','0','BRDPS7831L',NULL,'Married',6,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9194,'1009194','EMP0009194',NULL,NULL,'Rohit',NULL,'Kalghatgi','1982-01-11','Male','9876542164',NULL,'abc@gmail.com','A -9,403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud',1,20,504,'Pune',411038,'A -9, 403, Karishma Housing Society, Survey No - 17/2, G.A. Kulkarni Road, Near Sangam Press, Kothrud, Pune - 411038','0','AQAPK4267H',NULL,'Divorced',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,39,NULL,NULL,'2017-05-26 23:31:12','2017-05-26 23:31:12',NULL,NULL,NULL,NULL),(9195,'1009195','EMP0009195',NULL,NULL,'Pranav',NULL,'Lohokare','1990-05-25','Male','9876542165',NULL,'abc@gmail.com','Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi',1,20,504,'Pune',411043,'Pushpak Bunglow, Plot no. 9, Giri Nagar Society , Dhankawadi , Pune 411 043','0','AJEPL8791N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9196,'1009196','EMP0009196',NULL,NULL,'Siddharth',NULL,'Singhvi','1990-02-02','Male','9876542166',NULL,'abc@gmail.com','A - 8 , Kumar Aashiyana , Panmala, Sinhagad Road',1,20,504,'Pune',411030,'A - 8 , Kumar Aashiyana , Panmala, Sinhagad Road , Pune - 30','0','DDMPS2138K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9197,'1009197','EMP0009197',NULL,NULL,'Rakesh',NULL,'Hasurkar','1985-08-23','Male','9876542167',NULL,'abc@gmail.com','Sr. No . 27/B, Munjaba Vasti, Dhanori',1,20,504,'Pune',411015,'Sr. No . 27/B, Munjaba Vasti, Dhanori, Pune 15','0','AHIPH8897B',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9198,'1009198','EMP0009198',NULL,NULL,'Rameez',NULL,'Shaikh','1987-08-21','Male','9876542168',NULL,'abc@gmail.com','S. No. 48, Sai baba Nagar, Lane No - 5, Behind valley view school, Kondhwa Khurd',1,20,504,'Pune',411048,'S. No. 48, Sai baba Nagar, Lane No - 5,  Behind valley view school, Kondhwa Khurd, Pune 411 048','0','ESRPS1013J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9199,'1009199','EMP0009199',NULL,NULL,'Shekhar',NULL,'Lanke','1981-04-14','Male','9876542169',NULL,'abc@gmail.com','A4/ 18 , Potnis Parisar, Karve Nagar ',1,20,504,'Pune',0,'A4/ 18 , Potnis Parisar, Karve Nagar , Pune','0','AAMPL9888R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,39,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9200,'1009200','EMP0009200',NULL,NULL,'Ritwik',NULL,'Dey','1983-12-08','Male','9876542170',NULL,'abc@gmail.com','308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan',1,20,504,'Pune',411021,'308, A-Wing, Bhatwati Ashiyana, Jai Bhavani Nagar, Pashan, Pune 411 021','0','AIWPD54014',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9201,'1009201','EMP0009201',NULL,NULL,'Paridhi',NULL,'Agarwal','1984-11-08','Female','9876542171',NULL,'abc@gmail.com','Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy',1,20,504,'Pune',411014,'Flat no 303, Shalimar Triumph, Viman Nagar, Opp Khalsa Dairy, Pune -411014','0','ALZPA4632N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9202,'1009202','EMP0009202',NULL,NULL,'Ankur',NULL,'Dixit','1982-11-11','Male','9876542172',NULL,'abc@gmail.com','Amarnath Apt, Phase III, Flat No. 1, 1st floor, Adarsh Nagar, New Sanghvi',1,20,504,'Pune',411027,'Amarnath Apt, Phase III, Flat No. 1, 1st floor,Adarsh Nagar,New Sanghvi , Pune 27','0','BCTPD5708G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9203,'1009203','EMP0009203',NULL,NULL,'Roger',NULL,'D\'Souza','1984-09-13','Male','9876542173',NULL,'abc@gmail.com','St.Joseph nagar, Next to Ghorpuri Gaon',1,20,504,'Pune',411001,'Flat No. D/403, Viva Sarovar, Jambhulwadi Road, Katraj Ambegaon Budruk, Pune - 411 046','0','AMOPD4686M',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9204,'1009204','EMP0009204',NULL,NULL,'Shahab',NULL,'Mitha','1981-01-28','Male','9876542174',NULL,'abc@gmail.com','P/16, Konark Campus, Viman Nagar',1,20,504,'Pune',411014,'P/16, Konark Campus, Viman Nagar, Pune - 411 014','0','CJWPM4341P',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9205,'1009205','EMP0009205',NULL,NULL,'Siddharth',NULL,'Babani','1989-07-09','Male','9876542175',NULL,'abc@gmail.com','D-3 , Hermes Heights, ST. Vincents street , Camp, 4th Floor',1,20,504,'Pune',411001,'D-3 , Hermes Heights, ST. Vincents street , Camp, 4th Floor, Pune -1','0','BSPPB1209N',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9206,'1009206','EMP0009206',NULL,NULL,'Vikas',NULL,'Unnikkannan','1989-09-19','Male','9876542176',NULL,'abc@gmail.com','Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa',1,20,504,'Pune',411048,'Flat - 202, Sunshree Phase- F, Main NIBM Road, Kondhwa, Pune - 411048','0','ADMPU7281L',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:13','2017-05-26 23:31:13',NULL,NULL,NULL,NULL),(9207,'1009207','EMP0009207',NULL,NULL,'Shruti',NULL,'Vidwans','1984-06-01','Female','9876542177',NULL,'abc@gmail.com','400 B, Jaygad Apts., United Western Society, Karve Nagar',1,20,504,'Pune',411052,'400 B, Jaygad Apts., United Western Society, Karve Nagar, Pune - 411052','0','BDUPS7466N',NULL,'Widow',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9208,'1009208','EMP0009208',NULL,NULL,'Poonam',NULL,'Raskar','1988-05-27','Female','9876542178',NULL,'abc@gmail.com','A/702, Sukhwani Emerald, Near Sundar Sankul, Magarpatta',1,20,504,'Pune',411028,'A/702, Sukhwani Emerald, Near Sundar Sankul, Magarpatta, Pune - 411028','0','AYFPR4905G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9209,'1009209','EMP0009209',NULL,NULL,'Radheshyam',NULL,'Moholkar','1983-06-23','Male','9876542179',NULL,'abc@gmail.com','102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner',1,20,504,'Pune',411045,'102, Awani Elegance, Veerbhadra Nagar, Near Yutika Society, Baner, Pune - 411045','0','ANNPM2934R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9210,'1009210','EMP0009210',NULL,NULL,'Radhika',NULL,'Iyer','1981-01-04','Female','9876542180',NULL,'abc@gmail.com','44,45,46, Rasta Peth, Nr. Lakheri Maruti Chowk, 201, Sumadhan Apt, Jews Street',1,20,504,'Pune',411011,'44,45,46 Rasta Peth, Nr. Lakheri Maruti Chowk,201, Sumadhan Apt, Jews Street, Pune - 411011','0','AEFP12320N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9211,'1009211','EMP0009211',NULL,NULL,'Priyanka',NULL,'Agrawal','1988-06-20','Female','9876542181',NULL,'abc@gmail.com','A-204, Green Divine, Nr. Amanora, Hadapsar',1,20,504,'Pune',0,'A-204, Green Divine, Nr. Amanora , Hadapsar, Pune','0','AURPA9306N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9212,'1009212','EMP0009212',NULL,NULL,'Ninad',NULL,'Suratkar','1990-05-01','Male','9876542182',NULL,'abc@gmail.com','G/4, Fokhale Vrindavan, Chinchwad',1,20,504,'Pune',411033,'G/4, Fokhale Vrindavan, Chinchwad, Pune-411033','0','DLJPS3590G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9213,'1009213','EMP0009213',NULL,NULL,'Varun',NULL,'Janardhan','1985-12-13','Male','9876542183',NULL,'abc@gmail.com','C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran',1,20,504,'Pune',412114,'C-1/305, Celesta, Spine Road, Chikhali, New Pradhikaran, Pune-412114','0','ALGPJ5296E',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9214,'1009214','EMP0009214',NULL,NULL,'Mangesh',NULL,'Shinde','1986-07-09','Male','9876542184',NULL,'abc@gmail.com','S.R. No.4812, Dhanlaxmi Society, Ganesh Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'S.R. No.4812, Dhanlaxmi Society, ganesh Nagar, Wadgaonsheri, Pune 411014','0','CNIPSO730G',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9215,'1009215','EMP0009215',NULL,NULL,'June',NULL,'Biswas','1985-04-01','Female','9876542185',NULL,'abc@gmail.com','903, B11, Margosa Heights, Mohammadwadi',1,20,504,'Pune',411060,'903, B11, Margosa Heights, Mohammadwadi, Pune - 411060','0','APDPB4354G',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9216,'1009216','EMP0009216',NULL,NULL,'Namrata',NULL,'Jagade','1985-09-08','Female','9876542186',NULL,'abc@gmail.com','Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road',1,20,504,'Pune',411051,'Sr. No. \" Swapna Shilp \" Bunglow, Vishranti Nagar, Vitthalwadi, Sinhagad Road, Pune - 411051','0','ALCPJ5684L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9217,'1009217','EMP0009217',NULL,NULL,'Neha',NULL,'Deshpande','1985-10-26','Female','9876542187',NULL,'abc@gmail.com','Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe',1,20,504,'Pune',411041,'Flat No. 202, A Wing, Moksha Villa, Manaji Nagar, Narhe, Pune 411 041','0','BVGPD9787B',NULL,'Unmarried',7,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9218,'1009218','EMP0009218',NULL,NULL,'Gouree',NULL,'Gurjar','1982-12-05','Female','9876542188',NULL,'abc@gmail.com','F- 701, Maple Woodz, Wagholi',1,20,504,'Pune',0,'F- 701, Maple Woodz, Wagholi, Pune','0','BKWPP7332P',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9219,'1009219','EMP0009219',NULL,NULL,'Tony',NULL,'Thomas','1987-06-18','Male','9876542189',NULL,'abc@gmail.com','C-8/ 72, Century Enka, Col No. 2, Bhosari',1,20,504,'Pune',411039,'A2, Karishma Glory Hsg Society, Ajmera, Morwadi, Pimpri, Pune - 411018','0','AOAPT1539F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9220,'1009220','EMP0009220',NULL,NULL,'Digvijay','Kumar','Kashyap','1982-07-30','Male','9876542190',NULL,'abc@gmail.com','Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad',1,20,504,'Pune',411057,'Flat No. 702, Building D1 Costa Rica,Off Wakad Dange Chowk Road, Ahead of Dutta Mandir, Wakad,Pune -411057\n','0','AXPPK8711J',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:14','2017-05-26 23:31:14',NULL,NULL,NULL,NULL),(9221,'1009221','EMP0009221',NULL,NULL,'Sumeet',NULL,'Ranglani','1990-03-06','Male','9876542191',NULL,'abc@gmail.com','B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh',1,20,504,'Pune',411007,'B - 11, Sai Heritage, Opp Medipoint Hospital, DP Road, Aundh, Pune - 411007','0','AZPPR0939M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9222,'1009222','EMP0009222',NULL,NULL,'Vicky',NULL,'Lokhande','1986-09-11','Male','9876542192',NULL,'abc@gmail.com','Sangamwadi, Near Ram Mandir, Khadki',1,20,504,'Pune',411003,'Sangamwadi, Near Ram Mandir, Khadki, Pune - 411003','0','Not Available',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,38,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9223,'1009223','EMP0009223',NULL,NULL,'Ankit',NULL,'Maheshwari','1981-10-07','Male','9876542193',NULL,'abc@gmail.com','G-801, Marvel Zephyr, Kharadi',1,20,504,'Pune',411014,'G-801, Marvel Zephyr, Kharadi, Pune - 411014','0','AJQPM6553M',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9224,'1009224','EMP0009224',NULL,NULL,'Kunal',NULL,'Pateliya','1986-07-01','Male','9876542194',NULL,'abc@gmail.com','S/ No 29, Near R K puram, Munjaba Wasti, Dhanori',1,20,504,'Pune',411015,'S/ No 29, Near R K puram, Munjaba Wasti, Dhanori, Pune - 411015','0','AXYPP5691H',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9225,'1009225','EMP0009225',NULL,NULL,'Yogesh',NULL,'Hanse','1988-02-05','Male','9876542195',NULL,'abc@gmail.com','Ganesh Nagar, col No. 9 ,Bppkhel, CME',1,20,504,'Pune',411031,'Ganesh Nagar, col No. 9 ,Bppkhel, CME, Pune -  411 031','0','AGDPH6228A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9226,'1009226','EMP0009226',NULL,NULL,'Prasad',NULL,'Galinde','1987-02-26','Male','9876542196',NULL,'abc@gmail.com','Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi',1,20,504,'Pune',411014,'Karan Gharownda Society, Flat No. A-8, Wadgaosheri, Sainikwadi, Pune - 411014','0','BKAPG5250K',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9227,'1009227','EMP0009227',NULL,NULL,'Dhananjay',NULL,'Ramkrishnan','1988-11-03','Male','9876542197',NULL,'abc@gmail.com','B-303, Ramrajya Planet, Near Datta Mandir, Old Mumbai Pune Highway 2, Kasarwadi',1,20,504,'Pune',411034,'B-303, Ramrajya Planet, Near Datta Mandir, Old Mumbai Pune Highway, Kasarwadi, Pune - 411034','0','ATPPR5212F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9228,'1009228','EMP0009228',NULL,NULL,'Sunayana',NULL,'Girme','1986-02-23','Female','9876542198',NULL,'abc@gmail.com','S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud',1,20,504,'Pune',411021,'S.No 19/12/B1, Krishnakunj Apt, Flat No 2 Bavdhan Khrud. Pune - 21','0','AQPPG7637Q',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9229,'1009229','EMP0009229',NULL,NULL,'Tanushree',NULL,'Das','1985-10-10','Female','9876542199',NULL,'abc@gmail.com','B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri',1,20,504,'Pune',411014,'B-4/701, Kumar Primavera, Sainath Nagar, Wadgaonsheri, Pune - 411014','0','AYKPD6503H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9230,'1009230','EMP0009230',NULL,NULL,'Amruta',NULL,'Patil','1986-10-13','Female','9876542200',NULL,'abc@gmail.com','Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa',1,20,504,'Pune',411036,'Opp. Renuka mata mandir, Zoa apartment, Flat no. 501, Keshav Nagar Mundhwa, Pune 411036','0','BGJPP7156G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9231,'1009231','EMP0009231',NULL,NULL,'Namrata',NULL,'Kakade','1989-02-15','Female','9876542201',NULL,'abc@gmail.com','208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar',1,20,504,'Pune',411020,'208/209, Flat No. 7, Bldg No. 3, Sinchan Nagar, Shivaji Nagar, Pune - 411020','0','CAWPK2642E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9232,'1009232','EMP0009232',NULL,NULL,'Yogesh',NULL,'Ghare','1986-12-24','Male','9876542202',NULL,'abc@gmail.com','255, Navi Sadashiv Peth, Nr LBS Road',1,20,504,'Pune',411030,'Someshwar apt, Wing B, Flat No. 29, Sinhagad road, Nr. Trimurti hospital, Pune','0','AQEPG4057B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9233,'1009233','EMP0009233',NULL,NULL,'Jisha',NULL,'Venugopal','1986-06-15','Female','9876542203',NULL,'abc@gmail.com','7, Keshav Chaya Apts. Bhav Patil Road, Bopodi',1,20,504,'Pune',411020,'7, Keshav Chaya Apts. Bhav Patil Road, Bopodi, Pune - 411020','0','ANDPV9872H',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9234,'1009234','EMP0009234',NULL,NULL,'Manjinder','Kaur','Bhullar','1984-08-28','Female','9876542204',NULL,'abc@gmail.com','B1/G2, Tolani Maritime Institute, Induri, Talegaon',1,20,504,'Pune',410507,'B1/G2, Tolani Maritime Institute, Induri, Talegaon, Pune - 410507','0','AVJPB4269Q',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9235,'1009235','EMP0009235',NULL,NULL,'Vaibhav',NULL,'Agarwal','1988-02-13','Male','9876542205',NULL,'abc@gmail.com','E/1, Radhika Residency, Opp. Atlas Copco, Dapodi',1,20,504,'Pune',411012,'E/1, Radhika Residency, opp Atlas Copco, Dapodi - Pune - 12','0','AMVPA4578N',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:15','2017-05-26 23:31:15',NULL,NULL,NULL,NULL),(9236,'1009236','EMP0009236',NULL,NULL,'Marlesh',NULL,'Patil','1986-11-14','Male','9876542206',NULL,'abc@gmail.com','706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar',1,20,504,'Pune',411027,'706, A4/A, Ginger Society, Aundh Annexe, Pimple Saudagar, Pune - 411027','0','BJEPP2810D',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9237,'1009237','EMP0009237',NULL,NULL,'Pooja',NULL,'Upadhyay','1985-06-28','Female','9876542207',NULL,'abc@gmail.com','Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road, Market Yard',1,20,504,'Pune',411037,'Flat No 10,Plot 8A,588/2B New Era Society Bivewadi-Kondwa Road,Market Yard Pune-411037','0','ABTPU5853B',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9238,'1009238','EMP0009238',NULL,NULL,'Nitish',NULL,'Joshi','1988-10-18','Male','9876542208',NULL,'abc@gmail.com','Patwardhan Baug, Central Bank Colony, Rama-Gopal, 6A, Erondwane',1,20,504,'Pune',411004,'Patwardhan Baug, Central Bank Colony, Rama-Gopal, 6A, Erondwane, Pune - 04','0','ANVPJ0756E',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9239,'1009239','EMP0009239',NULL,NULL,'Basudeb',NULL,'Iyer','1981-06-01','Male','9876542209',NULL,'abc@gmail.com','Flat A502, Flying Heights, Near DY Patil School, Lohegaon',1,20,504,'Pune',0,'Flat A502, Flying Heights, Near DY Patil School, Lohegaon, Pune','0','AAFPI0391F',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9240,'1009240','EMP0009240',NULL,NULL,'Amrit',NULL,'Sinha','1988-03-16','Male','9876542213',NULL,'abc@gmail.com','301 D, Arya Englave, Road No 15, Patel Nagar, Hatia',1,20,300,'Ranchi',834002,'301 D, Arya Englave, Road No 15, Patel Nagar, Hatia, Ranchi - 834002','0','DFIPS3188K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9241,'1009241','EMP0009241',NULL,NULL,'Farheen',NULL,'Rahman','1989-11-06','Female','9876542214',NULL,'abc@gmail.com','H. No - A11, Fazal Manzil, New Tiwari Tankroad',1,20,NULL,'Ranchi',0,'Flat No 16, Building No - 9, Laxmi Narayan nagar society, Opp. Mukherjee udyan, Erandvana, Pune','0','BYAPR7860J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9242,'1009242','EMP0009242',NULL,NULL,'Mradula',NULL,'Kotwani','1987-11-17','Female','9876542219',NULL,'abc@gmail.com','Roopmilan, New Market, Pilikothi Road',1,20,583,'Rewa',486001,'K 202, Ruby Park, Parkstreet, Wakad, Pune','0','CRCPK6278F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9243,'1009243','EMP0009243',NULL,NULL,'Soumya','Prakash','Jena','1990-08-21','Male','9876542221',NULL,'abc@gmail.com','PWD/LA/55, Industrial Estate',1,20,NULL,'Rourkela',0,'Flat No 11, f wing, Wanjale patil Heritage, Kondhwa dhawade, NDA Road, Pune','0','AXEPJ1959N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9244,'1009244','EMP0009244',NULL,NULL,'Paras',NULL,'Sachdeva','1990-12-11','Male','9876542223',NULL,'abc@gmail.com','H. No. 45,Mohalla Peerzadgan, Nr Juma Masjid, Rampur Maniharan',1,20,NULL,'Saharanpur',0,'D-501, Gera Emerald City South, Behind EON IT Park, Kharadi, Pune 411 014','0','FQUPS4040B',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9245,'1009245','EMP0009245',NULL,NULL,'Vikas',NULL,'Divate','1988-07-14','Male','9876542226',NULL,'abc@gmail.com','Divate Kirana, Abinav Nagar, Navin Nagar Road',1,20,NULL,'Sangamner',422605,'B - 14, Pushpa Apartment, Kothrud, Pune - 411038','0','ANCPD3009P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9246,'1009246','EMP0009246',NULL,NULL,'Vinit',NULL,'Patil','1983-11-06','Male','9876542227',NULL,'abc@gmail.com','5, Sudarshan Colony, South Vasant Nagar',1,20,509,'Sangli',416416,'904, E2, Solacia, Behind Mose College, Wagholi, Pune - 412207','0','ARIPP7619P',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9247,'1009247','EMP0009247',NULL,NULL,'Mayur',NULL,'Hore','1983-05-06','Male','9876542228',NULL,'abc@gmail.com','Shagun, Behind Asian Radio House, Opp Market Yard',1,20,509,'Sangli',416416,'Shagun, Behind Asian Radio House, Opp Market Yard, Sangli- 416416','0','ABZPH7447L',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9248,'1009248','EMP0009248',NULL,NULL,'Tarun','Bhargav','Paladugu','1985-04-09','Male','9876542233',NULL,'abc@gmail.com','3, Golden Oak Apartments, Defence Colony, Sainik Puri',1,20,NULL,'Secunderabad',56,'003, Golden Oak Apartments, Defence Colony, Sainik Puri, Secunderabad - 56','0','ARGPP6515J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:16','2017-05-26 23:31:16',NULL,NULL,NULL,NULL),(9249,'1009249','EMP0009249',NULL,NULL,'Mangesh',NULL,'Dhage','1984-06-17','Male','9876542268',NULL,'abc@gmail.com','AT Post: Sagoda',1,20,NULL,'Shegaon',444203,'C/o Eknath Sadhu Zurange SN 43 Pathare Thube Nagar Behind Balaji Hospital Kharadi - 411014','0','ANOPD2213M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9250,'1009250','EMP0009250',NULL,NULL,'Gaurav',NULL,'Sharma','1989-09-11','Male','9876542269',NULL,'abc@gmail.com','1st Floor, Sampat Building, Airport Road, Vijaynagar, Totu',1,20,252,'Shimla',171011,'701, B-3, Oxygen Valley, Near Ravi Garden, Pune-Solapur highway, Manjri BK, PUNE','0','CVWPS3620K',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9251,'1009251','EMP0009251',NULL,NULL,'Ankit',NULL,'Kapila','1989-06-07','Male','9876542270',NULL,'abc@gmail.com','B4, Lane 3, Sector - 1, New Shimla',1,20,252,'Shimla',171009,'B4, Lane 3, Sector - 1, New Shimla, Shimla - 171009','0','CGNPK8074M',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9252,'1009252','EMP0009252',NULL,NULL,'Somnath',NULL,'Raut','1983-09-03','Male','9876542271',NULL,'abc@gmail.com','A/P: Rautwadi',1,20,504,'Shirur',412208,'B-12 2nd Floor, Anand Shri Hos. Soc., Near to Anand Park bus stop, Ganesh Nagar, Vadgoansheri, Pune 411014.','0','AKCPR7284F',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,34,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9253,'1009253','EMP0009253',NULL,NULL,'Ritu',NULL,'Sahewalla','1986-05-22','Female','9876542273',NULL,'abc@gmail.com','Jai Bharat Tubewell store, Begu Road',1,20,NULL,'Sirsa',725055,'A-503, Downtown Langston, Kolte Patil, Kharadi, Pune - 411014','0','ANKPR8176R',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9254,'1009254','EMP0009254',NULL,NULL,'Chetan',NULL,'Pulgam','1984-10-31','Male','9876542276',NULL,'abc@gmail.com','1448 Daji Peth',1,20,NULL,'Solapur',413005,'1448 Daji Peth, Solapur - 413005','0','ALSPP1302P',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9255,'1009255','EMP0009255',NULL,NULL,'Sameer',NULL,'Inamdar','1987-05-09','Male','9876542277',NULL,'abc@gmail.com','At Post BIBI, Darphal Tal, North Solapur Dist',1,20,517,'Solapur',413222,'Sr No 14, Shankar Maharaj Vasahat, Chavan nagar, Dhankwadi, Pune - 43','0','ABZPI4316F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9256,'1009256','EMP0009256',NULL,NULL,'Pradeep','Kumar','Gupta','1988-02-29','Male','9876542278',NULL,'abc@gmail.com','Day & Night Medical Complex Opp Forest Off Srikulam',1,20,NULL,'Srikakulam',532001,'Day & Night Medical Complex Opp Forest Off Srikulam - 532001','0','CNPPK8310K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9257,'1009257','EMP0009257',NULL,NULL,'Satyarshi',NULL,'Mishra','1987-10-16','Male','9876542279',NULL,'abc@gmail.com','H. No 85, Sachcha Kuteer,Laxmanpur Colony, Allahabad Road',1,20,NULL,'Sultanpur',228001,'Flat No. 307, Matoshri Building, Patil Nagar, Bavdhan, Pune-411021','0','BAUPM9697L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9258,'1009258','EMP0009258',NULL,NULL,'Roohul',NULL,'Kapadiya','1986-11-30','Male','9876542318',NULL,'abc@gmail.com','2/3076/78, Hidayat Manzil, Sagrampura, Sindhiwaad',1,20,1033,'Surat',395003,'Jagdamba Society, Nr. Bora Classes, Somnath Nagar, Vadgaon Sheri, Pune-411006, Maharashtra.','0','AUZPK4035C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9259,'1009259','EMP0009259',NULL,NULL,'Bhargav',NULL,'Pandya','1988-11-11','Male','9876542319',NULL,'abc@gmail.com','61, Shubham Row House, Near Saraswati School, Honey Park Road, Adajan',1,20,1033,'Surat',395009,'Sr no 48/4, Flat no 303, Ganesh Nagar, Near Anand Park Bus Stop, Wadgaon Sheri, Pune - 411014','0','BCWPP1537L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9260,'1009260','EMP0009260',NULL,NULL,'Milan',NULL,'Malkiya','1987-02-02','Male','9876542320',NULL,'abc@gmail.com','14, Rupam society, Part - 3, Hirabaug, A.K Road',1,20,1033,'Surat',395008,'14, Rupam society, Part - 3, hirabaug, A.K road, Surat, Gujarat, India - 395008','0','BCBPM7050G',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9261,'1009261','EMP0009261',NULL,NULL,'Manas','Kumar','Raul','1983-02-15','Male','9876542321',NULL,'abc@gmail.com','LIG 12, S.P.A Colony Chudcos, Bagdhiya, Baripada',1,20,NULL,'Takatpur',757003,'Flat C - 401, Krishna Residency, SUS - Pashan Road , Sai Chowk, Pashan,Pune = 411021','0',' ALCPR5933L',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:17','2017-05-26 23:31:17',NULL,NULL,NULL,NULL),(9262,'1009262','EMP0009262',NULL,NULL,'Anil',NULL,'Bhote','1983-06-15','Male','9876542322',NULL,'abc@gmail.com','Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale',1,20,504,'Talegaon Dabhade',410507,'Shri Ambika Niwas, Shiv Colony, Ambi MIDC Road, Warale, Talegaon Dabhade - 410507','0','ANHPB3506E',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9263,'1009263','EMP0009263',NULL,NULL,'Santosh',NULL,'Dhande','1983-08-02','Male','9876542323',NULL,'abc@gmail.com','Radha Krishna Niwas, Shiv Colony, Warale Road, Tal. Mawal',1,20,504,'Talegaon Dhabhade',410507,'Radha Krishna Niwas, Plt. No. 369,  Shiv colony, Warale road, Near Kohinoor Begonia Estate,Talegaon Dabhade, Tal. Maval, Dist. Pune,Pin. 410507.','0','AKDPD6744R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9264,'1009264','EMP0009264',NULL,NULL,'Ganesh',NULL,'Konar','1989-03-27','Male','9876542324',NULL,'abc@gmail.com','9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate, Thane',1,20,520,'Thane',400604,'9, Vanitha Niwas, Kisan Nagar - 2, Wagale estate , Thane -n 400604','0','BIKPK9855J',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9265,'1009265','EMP0009265',NULL,NULL,'Nilam',NULL,'Dhok','1987-09-14','Female','9876542325',NULL,'abc@gmail.com','401,Panchpermeshwar Apt,Kisan Nagar No-3, Wagle Estate',1,20,520,'Thane',400604,'LX8/u4/13,A who tucker enclave,Near Hemant Karkare Udyan,15 no bus stop,Gondhale Nagar,Hadapsar-411028','0','BHUPD1617A',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9266,'1009266','EMP0009266',NULL,NULL,'Gavini',NULL,'Tharun','1990-11-25','Male','9876542326',NULL,'abc@gmail.com','15-22, Padmavathi Nagar, Kamala Sadanan upstairs',1,20,NULL,'Tirupathi',517502,'15-22, Padmavathi Nagar, Kamala Sadanan upstairs, Tirupathi, 517502, Chitoor dist, Andhra Pradesh','0','ASYPT5751D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9267,'1009267','EMP0009267',NULL,NULL,'Surbhi',NULL,'Jain','1989-10-29','Female','9876542352',NULL,'abc@gmail.com','1,Parshavnath Parisar,Surajnagar',1,20,593,'Ujjain',0,'Amanora Park Town,Tower 18,Flat No-702,Hadapsar,Pune','0','BCFPJ4716C',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9268,'1009268','EMP0009268',NULL,NULL,'Chandra','Bhanu','Gembali','1984-09-05','Male','9876542353',NULL,'abc@gmail.com','Pendrani Rise Mills, Jagat Jagani Street',1,20,NULL,'Umerkote',764073,'Pendrani Rise Mills, Jagat Jagani Street, Umerkote 764073, Nabarangapur Dist Odisha','0','AQJPB4244N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9269,'1009269','EMP0009269',NULL,NULL,'Nikhil',NULL,'Sharma','1989-03-03','Male','9876542354',NULL,'abc@gmail.com','Main bazar, Ward No 6',1,20,NULL,'Una',174303,'Main bazar, Ward No 6, Una - 174303, Himachal Pradesh','0','DHOPS0503Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9270,'1009270','EMP0009270',NULL,NULL,'Avinash',NULL,'Kumar','1986-04-04','Male','9876542355',NULL,'abc@gmail.com','S1, Navy Nagar, Naval Station Karanja',1,20,NULL,'Uran',400704,'S1, Navy Nagar, Naval Station Karanja, Uran, Raigadh, Maharashtra - 400704','0','BKPPK9950D',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9271,'1009271','EMP0009271',NULL,NULL,'Jaikishan',NULL,'Dhanwani','1988-07-06','Male','9876542356',NULL,'abc@gmail.com','13/ B-5, Gokul Nagar Society, Makarpura Road, Opp ONGC',1,20,227,'Vadodara',390009,'Flat No. 11, Block No. C, Seetai Park,Opp Kaka Halwai Shop, Aundh, D P Road, Pune-411007','0','AQFPD6017P',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9272,'1009272','EMP0009272',NULL,NULL,'Manoj',NULL,'Dhiware','1984-04-30','Male','9876542358',NULL,'abc@gmail.com','Plot no . 93/94, \'Siddhi\' Niwas, Nivara Nagari, Behind Dongre Hospital, Ldgaon Road',1,20,255,'Vaijapur',423701,'SR No. 253/2/3A/2, Bunglow No. 3, near Kumar Bakery, officers mess, Lohegaon Road, Khere Park, Pune - 411032','0','AYUPD9261C',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,38,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9273,'1009273','EMP0009273',NULL,NULL,'Yogesh','Kr','Singh','1983-03-19','Male','9876542360',NULL,'abc@gmail.com','Vill & Post - Kanta, District - Chandavali',1,20,965,'Varanasi',0,'Vill & Post - Kanta, District - Chandavali, Varanasi - UP','0','BEKPS5421L',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9274,'1009274','EMP0009274',NULL,NULL,'Anand',NULL,'Sangeet','1983-08-18','Male','9876542361',NULL,'abc@gmail.com','HIG,-0.2, VDA Flats, Naria',1,20,965,'Varanasi',221005,'HIG,-1/5, VDA Flats, Naria, Varanasi, Pin 221005','0','DKCPS3515R',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:18','2017-05-26 23:31:18',NULL,NULL,NULL,NULL),(9275,'1009275','EMP0009275',NULL,NULL,'Deep',NULL,'Gada','1989-06-15','Male','9876542364',NULL,'abc@gmail.com','301, Avadhpuri Apt, 80 feet road',1,20,NULL,'Veraval',362266,'301, Avadhpuri Apt, 80 feet road, Veraval - 362266','0','AYIPG3156D',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9276,'1009276','EMP0009276',NULL,NULL,'Sri','Krishna','Hasa Yalamanchili','1985-01-11','Female','9876542365',NULL,'abc@gmail.com','Flat - 202, Srinivasam , 31-16-18, Bullemma Street, Machavaram down',1,20,62,'Vijayawada',520004,'Flat - 1202, Tower-17, Amanora Township, Hadapsar - 411028','0','CIPPS3976L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9277,'1009277','EMP0009277',NULL,NULL,'Teja','Srinivas','Sathuluri','1989-09-27','Male','9876542366',NULL,'abc@gmail.com','Door number: 1-2/3, F-F-1, Sri Sai Milayam, Tadigadapa Road, Pedapulipaka (V), Penamaluru (MDC)',1,20,NULL,'Vijayawada',521137,'Flat -301, Building number 6, Rakshak Nagar, Phase 2, Kharadi Bypass, Pune-411014','0','EGMPS8262Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,41,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9278,'1009278','EMP0009278',NULL,NULL,'Viveki',NULL,'Singh','1990-04-23','Female','9876542367',NULL,'abc@gmail.com','Dr no - 403, BGM Patrudu Residency, Coromandel Gate',1,20,NULL,'Vishakapatnam',530011,'Shree Sai PG, Sangharsh Chowk, Chandan Nagar, Pune','0','DGFPS4140M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9279,'1009279','EMP0009279',NULL,NULL,'Ahmed',NULL,'Hakki','1981-02-01','Male','9876542377',NULL,'abc@gmail.com','Burain 12, 8803 Rüschlikon',NULL,20,NULL,NULL,0,'Burain 12, 8803 Rüschlikon, Switzerland       ','0','NA',NULL,'Married',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9280,'1009280','EMP0009280',NULL,NULL,'Pradip',NULL,'Chowdhary','1982-07-06','Male','9876542378',NULL,'abc@gmail.com','At Khedi Tal',1,20,NULL,NULL,0,'B-12,Wagheshwar Nagar,Near Wagheshwar Temple Wagholi, Tal-Haveli, Dist-Pune','0','AHWPC3011G',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9281,'1009281','EMP0009281',NULL,NULL,'Sonal',NULL,'Mamtora','1982-05-03','Female','9876542379',NULL,'abc@gmail.com','Flat no. 604, B Wing, Dhavel Windscapess Cooperative Housing Society, Hingle Mala Road, Sasane Nagar, Hadapsar',1,20,504,NULL,411028,'Flat no. 604, B wing, Dhavel WindscapessCooperative housing society, Hingle Mala Road(Behind New English High School), Sasane Nagar, Hadapsar Pune 411028','0','AKAPM5674N',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,35,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9282,'1009282','EMP0009282',NULL,NULL,'Shrikant',NULL,'Sawant','1982-06-12','Male','9876542380',NULL,'abc@gmail.com','C/3 , Pimple Apartments , Kasarwadi ',1,20,504,NULL,411034,'C/3 , Pimple Apartments , Kasarwadi , Pune - 411034','0','BYJPS8885D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9283,'1009283','EMP0009283',NULL,NULL,'Petra',NULL,'Brncalova','1985-01-27','Female','9876542381',NULL,'abc@gmail.com','Hemmelrather Weg 269, 51377 Leverkusen',NULL,20,NULL,NULL,0,'A / F 11, Ganga Park Society, Pingle Vasti, Mundhwa Road, Pune','0','BYJPB4829C',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9284,'1009284','EMP0009284',NULL,NULL,'Biswajit',NULL,'Singh(WFH)','1981-03-13','Male','9876542382',NULL,'abc@gmail.com','178, New Defence Colony, S.A.S. Nagar',1,20,NULL,NULL,140603,'178, New Defence Colony,Zirakpur Dist, S.A.S. Nagar,Punjab ‐ 140603','0','ARXPS7679D',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9285,'1009285','EMP0009285',NULL,NULL,'Aakash',NULL,'Singh','1988-07-22','Male','9876542383',NULL,'abc@gmail.com','B-127, D-1, Behind Petrol Pump Nepanagar',1,20,NULL,NULL,450221,'304, B9, Mangal Bhairav, Nandeo City, Pune -411041','0','DXJPS9947D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9286,'1009286','EMP0009286',NULL,NULL,'Raunak',NULL,'Rathi','1987-01-17','Male','9876542384',NULL,'abc@gmail.com','Bus stand road, Akot',1,20,NULL,NULL,0,'Flat No. 101 , Saptarshi Apartment, DSK Vishwa, Dhayari, Pune','0','BCPPR2284F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9287,'1009287','EMP0009287',NULL,NULL,'Radhika',NULL,'Khetan','1989-05-06','Female','9876542385',NULL,'abc@gmail.com','Near Z.P. School, At. Po. Thiloni Ta. Duryapoor',1,20,433,NULL,0,'Rakshaknagar phase 2, o/p durgamandir between Radison hotel &Kharadi bypass, Kharadi','0','CKRPK7573B',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9288,'1009288','EMP0009288',NULL,NULL,'Raj',NULL,'Kumar','1990-02-10','Male','9876542386',NULL,'abc@gmail.com','Vill + P.O: Bhadouns',1,20,NULL,NULL,0,'Vill + P.O: Bhadouns dist: Sheikhpura, Bihar','0','BWWPK4217J',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9289,'1009289','EMP0009289',NULL,NULL,'Vicky',NULL,'Vidre','1988-11-27','Male','9876542387',NULL,'abc@gmail.com','F11/11 Durga Colony, Vikram Nagar Khor, Neemuch',1,20,NULL,NULL,451470,'F11/11 Durga Colony, Vikram Nagar Khor, Neemuuh, MP - 451470','0','ALXPV7479G',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:19','2017-05-26 23:31:19',NULL,NULL,NULL,NULL),(9290,'1009290','EMP0009290',NULL,NULL,'Ramesh','Babu','Kopparthi','1985-12-29','Male','9876542388',NULL,'abc@gmail.com','D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2',1,20,NULL,NULL,534202,'D.no: 27-3-71, Nethaji street, Srirampuram, Bhimavaram - 2, Andhra Pradesh - 534202','0','CBUPK9760N',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9291,'1009291','EMP0009291',NULL,NULL,'Shakshi',NULL,'Yadav','1989-04-12','Female','9876542389',NULL,'abc@gmail.com','H/O Sundarkali Yadav, Near Samzhana Hotel, Birgunj - 16',NULL,20,NULL,NULL,44301,'BT Kawade Road, Suchandra corner, B-18, Pune','0','AMHPY6293L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9292,'1009292','EMP0009292',NULL,NULL,'Nishant',NULL,'Narad','1987-04-07','Male','9876542390',NULL,'abc@gmail.com','Walni, Th - Saoner',1,20,488,NULL,0,'Yash Society, B - Wing, 35#, Behind CNG Pump, Paud Road, Kothrud, Pune','0','AQAPN5796J',NULL,'Unmarried',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,23,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9293,'1009293','EMP0009293',NULL,NULL,'Sunil','Kumar','Parimi','1984-02-10','Male','9876542391',NULL,'abc@gmail.com','Pedamuthevi (post), Movva (MD), Krishna (DT)',1,20,NULL,NULL,521136,'Pedamuthevi (post), Movva (MD), Krishna (DT), Pin - 521136','0','BDDPP8794H',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9294,'1009294','EMP0009294',NULL,NULL,'Kaustubh',NULL,'Joshi','1988-04-17','Male','9876542392',NULL,'abc@gmail.com','Taranjan Bunglow, Abhinavnagar, sangamner',1,20,NULL,NULL,422605,'Flat No. 14, Pushpa Apt, Vanaz corner, Kothrud, Pune - 411038','0','ANPPJ5041G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9295,'1009295','EMP0009295',NULL,NULL,'Ruchi',NULL,'Srivastava','1988-12-21','Female','9876542393',NULL,'abc@gmail.com','10/517, Khalasi Line, Kanpur',1,20,NULL,NULL,208001,'Flat - E, 904, Splendour County, Behind Wageshwar Termple, Wagholi, Loh Road, Pune','0','DJKPS8929G',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9296,'1009296','EMP0009296',NULL,NULL,'Hitanshu',NULL,'Dhingra','1984-01-25','Male','9876542394',NULL,'abc@gmail.com','43006, Gali No. 10, Rampur Road, Haldwani',1,20,NULL,NULL,263139,'9/28, Gali No. 10, Rampur Road, Haldwani, Uttarakhand - 263139','0','ATWPD7637D',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9297,'1009297','EMP0009297',NULL,NULL,'Seema',NULL,'Gurung','1986-03-11','Female','9876542395',NULL,'abc@gmail.com','Youngtong Division, Sasing Matelte',1,20,997,NULL,0,'Star Gaze society, E-203, Dhanori-15, Pune','0','AWBPG0069Q',NULL,'Married',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,38,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9298,'1009298','EMP0009298',NULL,NULL,'Gopi','Chand','Mannem','1983-11-30','Male','9876542396',NULL,'abc@gmail.com','H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel )',1,20,NULL,NULL,521175,'H. No 1 - C48-1, Gandrai(V), Jaggayyapet ( Mandel ), Krishna ( Dt ), Andhra Pradesh - 521175','0','ATRPM7848N',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9299,'1009299','EMP0009299',NULL,NULL,'Chiranjeevi',NULL,'Meesam','1984-07-27','Male','9876542397',NULL,'abc@gmail.com','B S Peta, P P Agraharam, Makavarapalem',1,20,NULL,NULL,0,'B S Peta, P P Agraharam, Makavarapalem, Vishaka dist','0','AZAPM1795M',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9300,'1009300','EMP0009300',NULL,NULL,'Keith',NULL,'Lobo','1984-01-09','Male','9876542398',NULL,'abc@gmail.com','Shubhashree Residency, C-1, 506, Akurdi',1,20,504,NULL,411035,'Padmachaya Housing Society , Kharadi, Pune 411 014','0','ADLPL1342G',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9301,'1009301','EMP0009301',NULL,NULL,'Jyoti',NULL,'Wadhwani','1985-07-30','Female','9876542399',NULL,'abc@gmail.com','Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar',1,20,504,NULL,411014,'Flat No 1, Konark Arcade, Nr. Dutta Mandir Chowk, Viman Nagar, Pune 411014','0','ACNPW5545M',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9302,'1009302','EMP0009302',NULL,NULL,'Dustin',NULL,'Lichey','1986-01-22','Male','9876542400',NULL,'abc@gmail.com','Radegaster Street 8, 06842 Dessag',NULL,20,NULL,NULL,0,'Radegaster Street 8, 06842 Dessag, Germany','0','AORPL2777A',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:20','2017-05-26 23:31:20',NULL,NULL,NULL,NULL),(9303,'1009303','EMP0009303',NULL,NULL,'Geogy',NULL,'George','1984-12-26','Male','9876542401',NULL,'abc@gmail.com','Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha',1,20,NULL,NULL,689512,'Vadakethdahil Bethel, Kudassnad  P.O, Pandalam Alappuzha, Kerala - 689512','0','ANIPG3492M',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9304,'1009304','EMP0009304',NULL,NULL,'Ganesh',NULL,'Kudke','1989-11-30','Male','9876542402',NULL,'abc@gmail.com','Trimurti Colony No 2, Datta Nagar',1,20,NULL,NULL,431122,'Patil Complex, Building -4, B29, Aundh Road, Pune - 411 020','0','DIIPK1791K',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,33,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9305,'1009305','EMP0009305',NULL,NULL,'Vikram',NULL,'Gupta','1981-02-05','Male','9876542403',NULL,'abc@gmail.com','Sr. 704 Block, Saraswati Apartment, River View, Gomti Nagar',1,20,NULL,NULL,226010,'Guest House currently','0','BQWPG0024P',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9306,'1009306','EMP0009306',NULL,NULL,'Surabhi',NULL,'Singh','1988-03-24','Female','9876542404',NULL,'abc@gmail.com','93-B , Nehru Park colony, Prem Nagar, P.O. Izzatnagar',1,20,NULL,NULL,0,'Guest House currently','0','EVUPS8926Q',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9307,'1009307','EMP0009307',NULL,NULL,'Viksha',NULL,'Upadhyay','1989-07-01','Female','9876542405',NULL,'abc@gmail.com','Govt Quarter 2, Kedarpur Ambikapur, Surguja',1,20,NULL,NULL,0,'Silver Leaf 4A, Ramnagar colony, Bavdhan, Pune','0','ACRPU2719F',NULL,'Unmarried',1,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9308,'1009308','EMP0009308',NULL,NULL,'Shalini',NULL,'Sharma','1989-02-23','Female','9876542406',NULL,'abc@gmail.com','13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi',1,20,NULL,NULL,180001,'13-Kucha Nahar Singh, Panjtirthi, Jammu Tawi, Jammu & KASHMIR - 180001','0','ERQPS7103R',NULL,'Married',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,31,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9309,'1009309','EMP0009309',NULL,NULL,'Tushar',NULL,'Chugh','1990-10-16','Male','9876542407',NULL,'abc@gmail.com','525, Huda -20, Kaithal',1,20,NULL,NULL,0,'6 Raja Apartment, Model Colony, Pune','0','BFQPC2888Q',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9310,'1009310','EMP0009310',NULL,NULL,'Varad',NULL,'Sharma','1987-03-06','Male','9876542408',NULL,'abc@gmail.com','H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu(Tawi)',1,20,NULL,NULL,180002,'H. No. 8, Ajit Colony, Gole Gujral, Talab Tillo, Jammu( Tawi)- 180002','0','BSLPS6922F',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9311,'1009311','EMP0009311',NULL,NULL,'Geetesh',NULL,'Binjhade','1987-12-03','Male','9876542409',NULL,'abc@gmail.com','House No. 1328, Nagpur Road, BSNL Colony, SARRA, Post Imlikheda',1,20,553,NULL,0,'House No. 1328, Nagpur Road, BSNL Colony, SARRA , Post Imlikheda, Chhindwara, MP','0','BKGPB5919N',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9312,'1009312','EMP0009312',NULL,NULL,'Roshan',NULL,'Kumar','1983-12-24','Male','9876542410',NULL,'abc@gmail.com','Ward No 09, P.O Brpur',1,20,NULL,NULL,854340,'D1-304, Ganga Constella, Kharadi','0','AWCPK1116B',NULL,'Married',2,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9313,'1009313','EMP0009313',NULL,NULL,'Kishore','Varma','Addepalli','1983-08-10','Male','9876542411',NULL,'abc@gmail.com','Plot No. 351/ A, Flat No F 4, Om Sai Sudha  Residency, Vandanapuri Colony, Road No 2, Beeramguda, Patancheru Mandal',1,20,NULL,NULL,0,'Guest House currently','0','AMLPA6854H',NULL,'Married',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9314,'1009314','EMP0009314',NULL,NULL,'Sweekar',NULL,'TM','1988-04-09','Male','9876542412',NULL,'abc@gmail.com','Venkateshwara general stores, Soraba Road, Sagar',1,20,NULL,NULL,577401,'Venkateshwara general stores, Soraba Road, Sagar- 577401, Shivamogga Dist, Karnataka','0','BAYPM4645L',NULL,'Unmarried',3,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9315,'1009315','EMP0009315',NULL,NULL,'Kalyani',NULL,'Deshpande','1981-01-12','Female','9876542413',NULL,'abc@gmail.com','11,Gayatri Bunglow, Shivaji Nagar, Opp. Deval Dairy, Miraj, Sangli',1,20,NULL,NULL,416410,'11,Gayatri Bunglow, Shivajinagar, opp Deval Dairy, Miraj, Sangli- 416410','0','BZLPD9061K',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9316,'1009316','EMP0009316',NULL,NULL,'Alok',NULL,'Bharti','1984-02-18','Male','9876542414',NULL,'abc@gmail.com','New road, Above old Bata, Sahibgunj',1,20,NULL,NULL,816109,'New road, Above old Bata, Sahibgunj, Jharkhand, 816109','0','AJZPB6555H',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,37,NULL,NULL,'2017-05-26 23:31:21','2017-05-26 23:31:21',NULL,NULL,NULL,NULL),(9317,'1009317','EMP0009317',NULL,NULL,'Sujitsingh',NULL,'Deore','1989-12-08','Male','9876542415',NULL,'abc@gmail.com','Santoshi Mata Colony Karanja (Lad)',1,20,NULL,NULL,444105,'Harshni 12,Rambug Colony,Kothrud Pune','0','CMEPD5870M',NULL,'Unmarried',4,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,27,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9318,'1009318','EMP0009318',NULL,NULL,'Rachit',NULL,'Huria','1990-06-10','Male','9876542416',NULL,'abc@gmail.com','136, Prannath ward No 6, Pana',1,20,NULL,NULL,488001,'Lane No 2, Regaram Patil Nagar, Kharadi, pune - 411014','0','AHSPH5048J',NULL,'Unmarried',NULL,2,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,1,32,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9319,'1009319','EMP0009319',NULL,NULL,'LOKESH',NULL,'LOKHANDE','1986-07-29','Male','9876541234',NULL,'abc@gmail.com','PRATAP NAGAR',1,20,556,NULL,0,NULL,'0','ALAPL3215H',NULL,'UnMarried',4,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9320,'1009320','EMP0009320',NULL,NULL,'SATISH ','KUMAR','JATAV','1986-02-03','Male','9876541235',NULL,'abc@gmail.com','BHOUSLE COLONY DEWAS',1,20,556,NULL,455001,'BHOUSLE COLONY DEWAS','720234029796','ELFPK5225P','MP39N20160092137','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9321,'1009321','EMP0009321',NULL,NULL,'ASHOK','RAM NIHORE','SHARMA','1983-08-30','Male','9876541277',NULL,'abc@gmail.com','32-C/63  Bhavapur  Khuldabad  Allahabad',1,20,889,'Allahabad   ',455001,'32-C/63  Bhavapur  Khuldabad  Allahabad','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9322,'1009322','EMP0009322',NULL,NULL,'LAXMAN','ASHOK KUMAR','PATEL','1990-02-22','Male','9876541313',NULL,'abc@gmail.com','80  Nirja Nagar J.K.Road  Bhopal',1,20,550,'Bhopal',0,'280, LIG VIKAS NAGAR DEWAS','317554893404','ARBPP9452F','MP0420070107726','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9323,'1009323','EMP0009323',NULL,NULL,'DEEPAK ','MADHUKAR','UGALMUGALE','1983-01-10','Male','9876541351',NULL,'abc@gmail.com','128 Bhagat Singh Marg Dewas',1,20,486,'Mumbai',455001,'128 Bhagat Singh Marg Dewas','731404027120',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:22','2017-05-26 23:31:22',NULL,NULL,NULL,NULL),(9324,'1009324','EMP0009324',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-28','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9325,'1009325','EMP0009325',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-25','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9326,'1009326','EMP0009326',NULL,NULL,'RAHUL','OMPRAKASH','PATIDAR','1981-11-30','Male','9876541354',NULL,'abc@gmail.com','Pooja Niwas Mewad Kothi Hatpiplya Dist Dewas',1,20,486,'Mumbai',455223,'Itawa Dews','963366544127','CYEPP7304J',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9327,'1009327','EMP0009327',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-29','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9328,'1009328','EMP0009328',NULL,NULL,'DINESH','SHANKARLAL','GARI','1981-08-15','Male','9876541356',NULL,'abc@gmail.com','Ward No. 10 Garee Siya ',1,20,486,'Mumbai',455001,'Ward No. 10 Garee Siya ','823619727521',NULL,NULL,'Married',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9329,'1009329','EMP0009329',NULL,NULL,'PIYUSH ','MANOHAR','PANDIT','1989-07-28','Male','9876541361',NULL,'abc@gmail.com','C4/64 AWAS NAGAR DEWASDewas',1,20,486,'Mumbai',455001,'C4/64 AWAS NAGAR DEWASDewas','474110055702','CZFPP6677N',NULL,'UnMarried',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9330,'1009330','EMP0009330',NULL,NULL,'AKASH',NULL,'GAWLANE','1982-05-15','Male','9876541367',NULL,'abc@gmail.com','A2/52 AWAS NAGAR ',1,20,486,'Mumbai',455001,'A2/52 AWAS NAGAR ','0',NULL,NULL,'UnMarried',4,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9331,'1009331','EMP0009331',NULL,NULL,'ABHISHEK ','SINGH','CHOUHAN','1989-07-29','Male','9876541368',NULL,'abc@gmail.com','350/B SHIV SHAKTI NAGAR',1,20,486,'Mumbai',455001,'350/B SHIV SHAKTI NAGAR','0',NULL,NULL,'UnMarried',NULL,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9332,'1009332','EMP0009332',NULL,NULL,'DURGESH','BANSHIDHAR','NAGAR','1982-03-14','Male','9876541371',NULL,'abc@gmail.com','34 ARJUN NAGAR',1,20,486,'Mumbai',0,'34 ARJUN NAGAR','716866797256','CHDPD3123M',NULL,'Married',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9333,'1009333','EMP0009333',NULL,NULL,'AMIT',NULL,'BHOWMICK','1984-09-16','Male','9876541377',NULL,'abc@gmail.com','10, RAMNAGAR EXT. DEWAS ',1,20,486,'Mumbai',455001,'10, RAMNAGAR EXT. DEWAS ','434914790802',NULL,NULL,'UnMarried',3,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9334,'1009334','EMP0009334',NULL,NULL,'RAVINDRA',NULL,'RATHORE','1990-03-10','Male','9876541379',NULL,'abc@gmail.com','141,PACHUNKAR COLONY, DEWAS (M.P.)',1,20,486,'Mumbai',455001,'141,PACHUNKAR COLONY, DEWAS (M.P.)','283120079765','CBDPR7783K','MP41N20150000591','UnMarried',2,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9335,'1009335','EMP0009335',NULL,NULL,'KAMAL',NULL,'DIWAN','1987-12-06','Male','9876541396',NULL,'abc@gmail.com','GRAM JAMGOD RANI , DISST. DEWAS',1,20,486,'Mumbai',455001,'GRAM JAMGOD RANI , DISST. DEWAS','225528404861','CQRPD5542F',NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9336,'1009336','EMP0009336',NULL,NULL,'KISHANLAL','DEVISINGH','YADAV','1982-07-09','Male','9876541397',NULL,'abc@gmail.com','GRAM GARDI , JHABRIYA TEH. STAWAS , DISST. DEWAS',1,20,486,'Mumbai',455001,'40 KOUSHALYA PURI INDORE','556098941754',NULL,'MP41R2015-0075910','Married',NULL,2,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9337,'1009337','EMP0009337',NULL,NULL,'DHEERAJ',NULL,'PATEL','1986-08-30','Male','9876541398',NULL,'abc@gmail.com','291 LOHAR PIPLIYA DEWAS',1,20,486,'Mumbai',455001,'291 LOHAR PIPLIYA DEWAS','294455028348',NULL,'MP41R20140096065','UnMarried',3,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9338,'1009338','EMP0009338',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-04','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:23','2017-05-26 23:31:23',NULL,NULL,NULL,NULL),(9339,'1009339','EMP0009339',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-24','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9340,'1009340','EMP0009340',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-05','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9341,'1009341','EMP0009341',NULL,NULL,'PRAKASH','GANGA BISHAN ','YADAV','1990-01-05','Male','9876541494',NULL,'abc@gmail.com','157  Sardar Patel Ward Near Bhagwati Nhome',1,20,486,'Mumbai',455001,'157  Sardar Patel Ward Near Bhagwati Nhome','0','ACSPY3548F','MP47R20100018867','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9342,'1009342','EMP0009342',NULL,NULL,'PRAMOD','KUMAR','PATEL','1985-05-23','Male','9876541496',NULL,'abc@gmail.com','138  Ews Mukhargee Nagar',1,20,486,'Mumbai',455001,'138  Ews Mukhargee Nagar','821949393294','BRHPP5333E','MP41N20080091924','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9343,'1009343','EMP0009343',NULL,NULL,'SATISH','SATYANARAYAN','SHARMA','1981-12-14','Male','9876541507',NULL,'abc@gmail.com','Singavada  Dewas    Madhya Pradesh',1,20,486,'Mumbai',455001,'Singavada  Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9344,'1009344','EMP0009344',NULL,NULL,'SUNIL','OMPRAKASH','PATEL','1984-01-13','Male','9876541537',NULL,'abc@gmail.com','4  Chamunda Dham Anex Maxi Road',1,20,486,'Mumbai',455001,'4  Chamunda Dham Anex Maxi Road','223574369120',NULL,'MP41N20130054004','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9345,'1009345','EMP0009345',NULL,NULL,'MAKHAN','RAY SINGH','MALVIYA','1984-03-01','Male','9876541550',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9346,'1009346','EMP0009346',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-29','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9347,'1009347','EMP0009347',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-22','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9348,'1009348','EMP0009348',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-20','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9349,'1009349','EMP0009349',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-07','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9350,'1009350','EMP0009350',NULL,NULL,'RAMDAYAL','SINGH','CHANDEL','1982-09-12','Male','9876541576',NULL,'abc@gmail.com','117  Patha Surakhi Sagar',1,20,486,'Mumbai',455001,'OM SAI VIHAR COLONY DEWAS','882059418018','AURPC15385',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9351,'1009351','EMP0009351',NULL,NULL,'RAKESH','PANNA LAL','MALVIYA','1982-10-06','Male','9876541584',NULL,'abc@gmail.com','Updi TEH TARAN DIST DEWAS',1,20,486,'Mumbai',455001,'Updi TEH TARAN DIST DEWAS','433117182065',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9352,'1009352','EMP0009352',NULL,NULL,'JEEVAN','SINGH','NAYAK','1985-03-20','Male','9876541586',NULL,'abc@gmail.com','196 Arjun Nagar ITAWA DEWAS',1,20,486,'Mumbai',455001,'196 Arjun Nagar ITAWA DEWAS','979522241967','BCQPC1426H',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:24','2017-05-26 23:31:24',NULL,NULL,NULL,NULL),(9353,'1009353','EMP0009353',NULL,NULL,'PRADEEP','KUMAR','SINGH','1988-03-20','Male','9876541587',NULL,'abc@gmail.com','Bavdiya A.B.Road Dewas',1,20,486,'Mumbai',455001,'Bavdiya A.B.Road Dewas','0','FOYPS0460F',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9354,'1009354','EMP0009354',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-15','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9355,'1009355','EMP0009355',NULL,NULL,'SACHIN','BHERULAL','PANCHAL','1985-01-15','Male','9876541590',NULL,'abc@gmail.com','352  Shiv Shakti Nagar Rani Bag Ujjain Road',1,20,486,'Mumbai',455001,'352  Shiv Shakti Nagar Rani Bag Ujjain Road','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9356,'1009356','EMP0009356',NULL,NULL,'ISHWAR','LAL','PRAJAPATI','1990-11-29','Male','9876541595',NULL,'abc@gmail.com','130  Gopal Nagar Itawa',1,20,486,'Mumbai',456001,'130  Gopal Nagar Itawa','518596346009',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9357,'1009357','EMP0009357',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-20','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9358,'1009358','EMP0009358',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-04-02','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9359,'1009359','EMP0009359',NULL,NULL,'SANTOSH','HARINARAYAN ','SHARMA','1988-03-12','Male','9876541606',NULL,'abc@gmail.com','Vill- Akaliya Psot- Agroad Dewas',1,20,486,'Mumbai',455001,'62 B JAISHRI NAGAR DEWAS','994669909689',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9360,'1009360','EMP0009360',NULL,NULL,'ADITYA','SINGH','RANA','1983-03-01','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9361,'1009361','EMP0009361',NULL,NULL,'AMIT','ALOK','BHOWMICK','1984-09-17','Male','9876541610',NULL,'abc@gmail.com','10 Ramnagar Extension A.B. Road',1,20,486,'Mumbai',455001,'10 Ramnagar Extension A.B. Road','434914790802',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9362,'1009362','EMP0009362',NULL,NULL,'KAMLESH','BADEDEEN','YADAV','1989-09-07','Male','9876541618',NULL,'abc@gmail.com','162 CHAKAMAN DHATA GOPEEGANJ UP',1,20,486,'Mumbai',455001,'32 BAJRANG NAGAR DEWAS','293498871054','AJNPY4744M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9363,'1009363','EMP0009363',NULL,NULL,'JITENDRA','RAMCHANDAR','PRAJAPATI','1982-08-27','Male','9876541621',NULL,'abc@gmail.com','Wn. 07 Puspkanj Colony Itawa',1,20,486,'Mumbai',455001,'Wn. 07 Puspkanj Colony Itawa','966699386898','CYPPP3569Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:25','2017-05-26 23:31:25',NULL,NULL,NULL,NULL),(9364,'1009364','EMP0009364',NULL,NULL,'DINESH','BHERULAL','SONI','1987-01-21','Male','9876541624',NULL,'abc@gmail.com','248  Navada Tonk Khurd',1,20,486,'Mumbai',455001,'248  Navada Tonk Khurd','359956942870',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9365,'1009365','EMP0009365',NULL,NULL,'MAHENDRA','MANOHARLAL ','YADAV','1982-08-05','Male','9876541625',NULL,'abc@gmail.com','158  Lala Lajpat Rai Marg',1,20,486,'Mumbai',455001,'158  Lala Lajpat Rai Marg','900226315181','ACTPY6582E','MP41N-2012-0063837','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9366,'1009366','EMP0009366',NULL,NULL,'OMPRAKASH','SAMANDHAR SINGH','CHOUDHRY','1988-01-08','Male','9876541626',NULL,'abc@gmail.com','536  Vill-Siya',1,20,486,'Mumbai',455001,'536  Vill-Siya','527189679928',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9367,'1009367','EMP0009367',NULL,NULL,'RAJA','SIDDIQUE','SHAH','1983-02-19','Male','9876541627',NULL,'abc@gmail.com','116  Vill Siyapura',1,20,486,'Mumbai',455001,'116  Vill Siyapura','708706322651',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9368,'1009368','EMP0009368',NULL,NULL,'HARIKISHORE','SINGH','SENGAR','1988-12-09','Male','9876541630',NULL,'abc@gmail.com','5-Eco Center Nursury',1,20,486,'Mumbai',455001,'25 Chankya Puri Dewas','783869992818','NA','NA','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9369,'1009369','EMP0009369',NULL,NULL,'JITENDRA','BABULAL','MALVIYA','1986-06-27','Male','9876541637',NULL,'abc@gmail.com','Railway Station Binjana Dewas',1,20,486,'Mumbai',455001,'Railway Station Binjana Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9370,'1009370','EMP0009370',NULL,NULL,'ARIF',' ','SHAIKH','1987-08-09','Male','9876541640',NULL,'abc@gmail.com','Vill-Siya',1,20,486,'Mumbai',456001,'Vill-Siya','269981567401',NULL,'MP41R20120138619','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9371,'1009371','EMP0009371',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-28','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9372,'1009372','EMP0009372',NULL,NULL,'ANSAR',' ','KHAN','1987-07-24','Male','9876541649',NULL,'abc@gmail.com','Vill-Siya DIST DEWAS',1,20,486,'Mumbai',455001,'Vill-Siya DIST DEWAS','323040840154',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9373,'1009373','EMP0009373',NULL,NULL,'KISHAN','DWARKADAS','MAHAJAN','1987-02-22','Male','9876541651',NULL,'abc@gmail.com','89 VITHAL MANDIR PATH KHARGONE',1,20,486,'Mumbai',0,'VIKAS NAGAR DEWAS','488293630590',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9374,'1009374','EMP0009374',NULL,NULL,'KAMAL','RATANLAL ','DIWAN','1987-12-07','Male','9876541652',NULL,'abc@gmail.com','Jaamgoad Rani Dist-',1,20,486,'Mumbai',455001,'Jaamgoad Rani Dist-','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9375,'1009375','EMP0009375',NULL,NULL,'SANDEEP','JAGDISH','SINGH','1983-03-15','Male','9876541659',NULL,'abc@gmail.com','Vill-Post -Bhirakhand Sit -Bhind',1,20,486,'Mumbai',455001,'TARANI COLONY DEWAS','423355533662','DDJPS9893C',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9376,'1009376','EMP0009376',NULL,NULL,'MAHESH','RAMLAL G','CHOUHAN','1985-01-31','Male','9876541660',NULL,'abc@gmail.com','472  Amnedkar Nagar Siya',1,20,486,'Mumbai',455001,'472  Amnedkar Nagar Siya','691782241668',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9377,'1009377','EMP0009377',NULL,NULL,'MURARI','PRABHU','CHADAR','1988-04-05','Male','9876541661',NULL,'abc@gmail.com','117   Vill- Patha  Th- Sagar  Dist. Sagar',1,20,486,'Mumbai',455001,'117   Vill- Patha  Th- Sagar  Dist. Sagar','282922544787',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:31:26','2017-05-26 23:31:26',NULL,NULL,NULL,NULL),(9378,'1009378','EMP0009378',NULL,NULL,'UMESH','BANESINGH','SOLANKI','1988-10-14','Male','9876541669',NULL,'abc@gmail.com','Vill- Fathepur Kheda Post Nadel Th- Tok Khurd',1,20,486,'Mumbai',455001,'Vill- Fathepur Kheda Post Nadel Th- Tok Khurd','607533224601',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9379,'1009379','EMP0009379',NULL,NULL,'BHUPENDRA','SUBHASH CHANDRA','CHOUHAN','1984-09-25','Male','9876541670',NULL,'abc@gmail.com','114 B-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'114 B-Kalani Bag Dewas','662341664812','ANYPC8573F','MP41N20060046958','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9380,'1009380','EMP0009380',NULL,NULL,'JAGDISH','RANCHODH LAL','SUNANIYA','1981-08-16','Male','9876541671',NULL,'abc@gmail.com','VILL BDA MALSA PURA POST SIYA TEH+DIST. DEWAS',1,20,486,'Mumbai',0,'ABCVILL BDA MALSA PURA POST SIYA TEH+DIST. DEWAS','808455361104',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9381,'1009381','EMP0009381',NULL,NULL,'RAMAN','LT.GOPAL DAS ','SHARMA','1989-08-22','Male','9876541676',NULL,'abc@gmail.com','19  Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'19  Panchsheel Nagar Dewas','0','DIHPS1237R','MP-41N-2013-0169379','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9382,'1009382','EMP0009382',NULL,NULL,'RAJESH',' ','PANDIAN','1983-10-09','Male','9876541677',NULL,'abc@gmail.com','4C Sector Adarsh Nagar Bnp Road',1,20,486,'Mumbai',455001,'4C Sector Adarsh Nagar Bnp Road','834050163182',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9383,'1009383','EMP0009383',NULL,NULL,'RAKESH','BANESHING','CHOUHAN','1983-04-08','Male','9876541684',NULL,'abc@gmail.com','ADARSH NAGAR VILL SIYA DEWAS',1,20,486,'Mumbai',0,'ADARSH NAGAR VILL SIYA DEWAS','961477533277',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9384,'1009384','EMP0009384',NULL,NULL,'RAJENDRA','BADRILAL','KUMAWAT','1988-04-13','Male','9876541695',NULL,'abc@gmail.com','Ab Road Siya Th- Dewas',1,20,486,'Mumbai',455001,'Ab Road Siya Th- Dewas','226568376795',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9385,'1009385','EMP0009385',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-12','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9386,'1009386','EMP0009386',NULL,NULL,'HAIDER','GULAM MOHD','KHAN','1982-07-28','Male','9876541704',NULL,'abc@gmail.com','71  Bhosle Colony',1,20,486,'Mumbai',455001,'71  Bhosle Colony','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9387,'1009387','EMP0009387',NULL,NULL,'GOPAL','SINGH','PANWAR','1981-01-30','Male','9876541705',NULL,'abc@gmail.com','Bajar Chock Vill-Siya',1,20,486,'Mumbai',455001,'Bajar Chock Vill-Siya','628712791221','CEIPP2264K','MP41N20070016400','Married',5,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9388,'1009388','EMP0009388',NULL,NULL,'SHRIRAM','MADAN SINGH','SURYAWANSHI','1986-01-02','Male','9876541714',NULL,'abc@gmail.com','2 Mendhki Dhakad Post Patlawda  Dewas',1,20,486,'Mumbai',455001,'2 Mendhki Dhakad Post Patlawda  Dewas ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9389,'1009389','EMP0009389',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-06','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9390,'1009390','EMP0009390',NULL,NULL,'RAHUL','KAILASH CHANDRA','KULTHIYA','1990-03-26','Male','9876541728',NULL,'abc@gmail.com','Ganjpura Sonkatch  Dewas',1,20,486,'Mumbai',0,'Shankar Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9391,'1009391','EMP0009391',NULL,NULL,'PAPPU','MANSHING','BILALA','1981-09-01','Male','9876541732',NULL,'abc@gmail.com','Vill-Post Siya Dewas',1,20,486,'Mumbai',455001,'Vill-Post Siya Dewas','795367547645',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9392,'1009392','EMP0009392',NULL,NULL,'RIYAZ',' ','KHAN','1982-02-07','Male','9876541744',NULL,'abc@gmail.com','SUNDARSI DIST SHAHJAPUR',1,20,486,'Mumbai',465001,'SIYA PURA DEWAS','0',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 23:31:27','2017-05-26 23:31:27',NULL,NULL,NULL,NULL),(9393,'1009393','EMP0009393',NULL,NULL,'RAHUL','SITARAM','VAISHNAV','1990-09-02','Male','9876541750',NULL,'abc@gmail.com','Hn 440  Post-Siya Wn.12 Near To Ganesh Temple Ambedkar Nagar Siya Dewas',1,20,486,'Mumbai',455001,'Hn 440  Post-Siya Wn.12 Near To Ganesh Temple Ambedkar Nagar Siya Dewas','570678099355','AQMPV3451G',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9394,'1009394','EMP0009394',NULL,NULL,'HARSHAL','ANAND KUMAR','CHOUHAN','1989-07-05','Male','9876541751',NULL,'abc@gmail.com','233/B  Sadashiv Nagar  Moti Banglow',1,20,486,'Mumbai',455001,'233/B  Sadashiv Nagar  Moti Banglow','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9395,'1009395','EMP0009395',NULL,NULL,'MAHIPAL','M.S.','SENDALKAR','1990-04-03','Male','9876541757',NULL,'abc@gmail.com','280 Lig Vikash Nagar Dewas',1,20,486,'Mumbai',0,'280 Lig Vikash Nagar Dewas','430171959271','BJBPS4991K','MP41N201280228314','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9396,'1009396','EMP0009396',NULL,NULL,'BHARAT','KUMAR','PANCHAL','1984-04-18','Male','9876541758',NULL,'abc@gmail.com','C-11 Tulip Bulding Bhushan Gardn Savroli I Samba Phata Khopoli',1,20,486,'Mumbai',455001,'C-11 Tulip Bulding Bhushan Gardn Savroli I Samba Phata Khopoli','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9397,'1009397','EMP0009397',NULL,NULL,'RAHUL','SURESH','GOSWAMI','1986-07-21','Male','9876541761',NULL,'abc@gmail.com','Anjani Electrical Multanpura Biaora',1,20,486,'Mumbai',465674,'Anjani Electrical Multanpura Biaora','825841294923',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9398,'1009398','EMP0009398',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-27','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9399,'1009399','EMP0009399',NULL,NULL,'RAJKUMAR',' ','PARASNIYA','1983-08-14','Male','9876541768',NULL,'abc@gmail.com','VILL KANERIYA POST+ TEH TOKKHURDE ',1,20,486,'Mumbai',0,'VILL KANERIYA POST+ TEH TOKKHURDE ','492566510776',NULL,'MP41N20110024013','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9400,'1009400','EMP0009400',NULL,NULL,'PRAVEEN','LAXMINARAYAN','JHALA','1986-12-12','Male','9876541769',NULL,'abc@gmail.com','9  Vivekanan Colony  Moti Banglow',1,20,486,'Mumbai',455001,'9  Vivekanan Colony  Moti Banglow','351737723034','BAJPJ0108C',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9401,'1009401','EMP0009401',NULL,NULL,'MITHILESH','MOTIRAM','PATEL','1989-06-11','Male','9876541771',NULL,'abc@gmail.com','KHANDWA',1,20,486,'Mumbai',0,'MRDUL VUHAR DEWAS','321470308698','BYNPP1376C',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9402,'1009402','EMP0009402',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-18','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9403,'1009403','EMP0009403',NULL,NULL,'RAHUL','GANESH','DOBLE','1984-02-14','Male','9876541776',NULL,'abc@gmail.com','ABC',1,20,486,'Mumbai',456001,'ABC','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9404,'1009404','EMP0009404',NULL,NULL,'VIKRAM','BALARAM','RATHORE','1988-12-01','Male','9876541777',NULL,'abc@gmail.com','379  Alkapuri',1,20,486,'Mumbai',455001,'379  Alkapuri','556704272917','AJOPR3632C',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9405,'1009405','EMP0009405',NULL,NULL,'ANUJ','PUSPENDRA SINGH','SINGH','1988-07-18','Male','9876541778',NULL,'abc@gmail.com','21  Upadhyay Nagar',1,20,486,'Mumbai',455001,'21  Upadhyay Nagar','699362930023',NULL,NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:28','2017-05-26 23:31:28',NULL,NULL,NULL,NULL),(9406,'1009406','EMP0009406',NULL,NULL,'ASHOK','HARINANDAN','SHAH','1981-10-03','Male','9876541806',NULL,'abc@gmail.com','BHAGIBATTI JHIL GOPALGANJ BIHAR ',1,20,504,'Pune',841428,'SIYA PURA DEWAS','423100709867',NULL,NULL,'Married',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9407,'1009407','EMP0009407',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-09','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9408,'1009408','EMP0009408',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-17','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9409,'1009409','EMP0009409',NULL,NULL,'NARENDRA','RAMESHWAR ','BIRLE','1983-02-27','Male','9876541866',NULL,'abc@gmail.com','VILL BHATYAN BUJURG TEH KASRWAD DIST KHARGONE',1,20,504,'Pune',0,'312 ALKAPURI DEWAS','561692105434','BKWPB3703N',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9410,'1009410','EMP0009410',NULL,NULL,'ANKIT','PAWAN','PATEL','1989-01-10','Male','9876541867',NULL,'abc@gmail.com','Vill-Attaheda Th.-Depalpur ',1,20,504,'Pune',0,'Vill.-Rajoda Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9411,'1009411','EMP0009411',NULL,NULL,'YOGESH','SINGH','PANWAR','1987-10-04','Male','9876541868',NULL,'abc@gmail.com','270  Mig Vijay Nagar',1,20,504,'Pune',455001,'270  Mig Vijay Nagar','699908596103','BTAPP1648F','MP41N20080108599','UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9412,'1009412','EMP0009412',NULL,NULL,'KISHAN','LAL','YADAV','1982-07-10','Male','9876541869',NULL,'abc@gmail.com','25-C  St No.15-A  Mayur Nagar Musha Khedi',1,20,504,'Pune',452001,'25-C  St No.15-A  Mayur Nagar Musha Khedi','556098941754',NULL,'MP41R2015-0075910','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9413,'1009413','EMP0009413',NULL,NULL,'RAMADHAR','SINGH','GURZAR','1981-10-27','Male','9876541870',NULL,'abc@gmail.com','Hn. 240  Street No. 18 Mayur Colony Musha Khedi',1,20,504,'Pune',452001,'Hn. 240  Street No. 18 Mayur Colony Musha Khedi','256236053520','BCLPG6716M','MP09R20150758209','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9414,'1009414','EMP0009414',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1987-01-19','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9415,'1009415','EMP0009415',NULL,NULL,'OMPAL','SINGH','RANA','1984-08-02','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9416,'1009416','EMP0009416',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-04','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9417,'1009417','EMP0009417',NULL,NULL,'AMIT','KUMAR','SHARMA','1984-06-29','Male','9876541907',NULL,'abc@gmail.com','VILLAGE+POST+DADA-FATEHPURA, KHETRI JHUNJHUNU',1,20,504,'Pune',0,NULL,'0','BQZPS0616J',NULL,'Married',4,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9418,'1009418','EMP0009418',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-21','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9419,'1009419','EMP0009419',NULL,NULL,'NIKHIL','MADAN GOPAL','SHARMA','1982-01-25','Male','9876542025',NULL,'abc@gmail.com','58 WARD NO 11, SCHOOL AREA NILOKHERI KARNAL , HARIYANA',1,20,504,'Pune',0,'79, SHREE BALAJI NAGAR BALGARH DEWAS','212446145405',NULL,'HR05201100799963','UnMarried',3,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:29','2017-05-26 23:31:29',NULL,NULL,NULL,NULL),(9420,'1009420','EMP0009420',NULL,NULL,'SANTOSH','KUMAR','PAL','1989-05-09','Male','9876542229',NULL,'abc@gmail.com','C/o Ganesh Pal House No. 42, Near to New Charch, Ward No 1 Sarani Betul M.P.',1,20,547,'sarani',460447,'MYH Staff nurse Hostal Indore','642028802671',NULL,'MP1100130505','Married',1,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9421,'1009421','EMP0009421',NULL,NULL,'SANTOSH','KUMAR','PAL','1989-05-10','Male','9876542230',NULL,'abc@gmail.com','C/o Ganesh Pal House No. 42, Near to New Charch, Ward No 1 Sarani Betul M.P.',1,20,547,'sarani',460447,'MYH Staff nurse Hostal Indore','642028802671','BJHPP3708B','MP1100130505','Married',NULL,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9422,'1009422','EMP0009422',NULL,NULL,'ABHISHEK','SANJAY','PALIWAL','1981-08-26','Male','9876542247',NULL,'abc@gmail.com','Sagar Vill- Dupad Raod Shajapur',1,20,1032,'Shajapur',465001,'Sagar Vill- Dupad Raod Shajapur','0','BWHPP6381F','MP42N20130139795','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9423,'1009423','EMP0009423',NULL,NULL,'MEHARBAN','JASMANT SINGH','CHOUHAN','1990-09-18','Male','9876542249',NULL,'abc@gmail.com','Vill-Nipaniya Post-Amlai Shujalpur',1,20,1032,'Shajapur',0,'Nimad Nagar Dewas ','581032859291',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9424,'1009424','EMP0009424',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-09-01','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9425,'1009425','EMP0009425',NULL,NULL,'RAMBABU','SATYANARAYAN','PATIDAR','1982-02-08','Male','9876542254',NULL,'abc@gmail.com','74/1  Dashara Maidan Wn. 03 Vll- Siya Sajapur',1,20,1032,'Shajapur',0,'VILL SIYA OIST SIYA TEH + DIST DEWAS','0',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9426,'1009426','EMP0009426',NULL,NULL,'HARISH','MOHAN SINGH ','PARMAR','1982-09-06','Male','9876542259',NULL,'abc@gmail.com','363 Guapura Wala Kalapipal  Village 56  Kalapipal Th- Kalapipal Dist- Shajapur M.P.',1,20,1032,'Shajapur',0,'363 Guapura Wala Kalapipal  Village 56  Kalapipal Th- Kalapipal Dist- Shajapur M.P.','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9427,'1009427','EMP0009427',NULL,NULL,'RAMPREET','PRASHAD','KUMHAR','1981-04-26','Male','9876542275',NULL,'abc@gmail.com','VILL+POST NIKHATI KALA RAGHUNATHPUR SIWAN',1,20,95,'SIWAN',455001,'162/4  Bavdiya A.B.Road','327827052078','BVVPP4184R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9428,'1009428','EMP0009428',NULL,NULL,'HIRALAL','MOTILAL','PRAJAPATI','1983-12-04','Male','9876542329',NULL,'abc@gmail.com','Vill-Updi Post Khajuriya  Th- Tarana',1,20,593,'Ujjain',456001,'Vill-Updi Post Khajuriya  Th- Tarana','334329547341',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9429,'1009429','EMP0009429',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-06','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9430,'1009430','EMP0009430',NULL,NULL,'JAGDISH','PARBHAT SINGH','MALVIYA','1986-12-28','Male','9876542335',NULL,'abc@gmail.com','Near Murlidhar Kripa Hospital   Ujjain Road Maksi',1,20,593,'Ujjain',0,'Near Murlidhar Kripa Hospital   Ujjain Road Maksi','937074724182',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9431,'1009431','EMP0009431',NULL,NULL,'BANSHI','LAL','PANCHAL','1990-01-13','Male','9876542336',NULL,'abc@gmail.com','Vill-Updi Po- Khajuriya Tarana',1,20,593,'Ujjain',455001,'Vill-Updi Po- Khajuriya Tarana','578566122327','CNOPB5777Q','NOT AVAILABLE','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9432,'1009432','EMP0009432',NULL,NULL,'GHANSHYAM','LAXMINARAYAN','CHOUHAN','1982-08-19','Male','9876542340',NULL,'abc@gmail.com','Vill-Fhatehabad Chandrawatiganj Dist-Ujjain  Ujjain    Madhya Pradesh',1,20,593,'Ujjain',0,'Vill-Fhatehabad Chandrawatiganj   Dist-Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:30','2017-05-26 23:31:30',NULL,NULL,NULL,NULL),(9433,'1009433','EMP0009433',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-11','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9434,'1009434','EMP0009434',NULL,NULL,'SONU',' ','RATHORE','1982-01-09','Male','9876542344',NULL,'abc@gmail.com','Gram Tobri Khedi Post Chidawad Teh Tarana Ujjain',1,20,593,'Ujjain',456001,'Gram Tobri Khedi Post Chidawad Teh Tarana Ujjain','269889093232',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9435,'1009435','EMP0009435',NULL,NULL,'JITENDRA','JAGDISH CHANDRA','PRAJAPATI','1987-11-05','Male','9876542346',NULL,'abc@gmail.com','Vill- Upadi Rao Psot Khajuriya Th- Taran Dist Ujjain',1,20,593,'Ujjain',455006,'Vill- Upadi Rao Psot Khajuriya Th- Taran Dist Ujjain','281944461321','CXAPP6896E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9436,'1009436','EMP0009436',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-08','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9437,'1009437','EMP0009437',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-18','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9438,'1009438','EMP0009438',NULL,NULL,'BHAUMIK','BIPINCHANDRA','TRIVEDI','1989-12-20','Male','9876542287',NULL,'abc@gmail.com','G-2/4, FLAT NO-701, GREEN CITY, NR. GALAXY CIRCLE, PAL BHATA ROAD',1,NULL,1033,'Surat',395009,NULL,'8019','AGRPT8488Q','GJ05-20060051565','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9439,'1009439','EMP0009439',NULL,NULL,'BHAVIK','RAMESHCHANDRA','PANWALA','1981-12-24','Male','9876542289',NULL,'abc@gmail.com','39,SHANTIVAN SOC, OPP.GAIL TOWER, ANAND MAHEL ROAD, PALANPUR PATIA',1,NULL,1033,'Surat',395009,NULL,'8034','AQBPP0144P','069420/02/GJ05','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9440,'1009440','EMP0009440',NULL,NULL,'KAJAL ','GHANSHYAMABHAI','DHANANI','1987-09-02','Female','9876542293',NULL,'abc@gmail.com','102,RACHNA SOC, KAPODRA,VARACHHA ROAD,',1,NULL,1033,'Surat',395006,NULL,'0','AUYPD1168N',NULL,'Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9441,'1009441','EMP0009441',NULL,NULL,'SHIVANI','HERMESHSINGH','RANA','1984-01-29','Female','9876542298',NULL,'abc@gmail.com','FLAT NI-1101, BUILDING NO-15, S-F/4, GREEN CITY, ADAJAN',1,NULL,1033,'Surat',395009,'FLAT NI-1101, BUILDING NO-15, S-F/4, GREEN CITY, ADAJAN','0','ATDPR1621E',NULL,'Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,7,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9442,'1009442','EMP0009442',NULL,NULL,'SANJAY','NARENDRABHAI','PATEL','1982-11-17','Male','9876541263',NULL,'abc@gmail.com','BRAHMAN FALIYU, ADADRA,ONGC COLONY ,ANKLESHWAR,',1,NULL,135,'Ahmedabad',393010,'124, JALARAM NAGAR SOCIETY, NR. INDIAN PETROL PUMP, JAHANGIR PURA, SURAT.','5113','AUVPP4493K','GJ16-19970055318','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9443,'1009443','EMP0009443',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-09','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9444,'1009444','EMP0009444',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-31','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9445,'1009445','EMP0009445',NULL,NULL,'MURLIDHARAN',NULL,'RAMAKRISHNAN','1985-04-21','Male','9876541794',NULL,'abc@gmail.com','KOTTAPPURATHU PUTHENPURA, RANDAR P.O, MUVATTUPUZHA, ',1,NULL,504,'Pune',686673,'BLDG NO 1, FLAT NO. 303, GREEN CITY, BHATHA, ','913023486824','APKPM 2065G','17/4302/2007','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9446,'1009446','EMP0009446',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-18','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:31:31','2017-05-26 23:31:31',NULL,NULL,NULL,NULL),(9447,'1009447','EMP0009447',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-13','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9448,'1009448','EMP0009448',NULL,NULL,'HARSHIL ','RANCHODBHAI','GALANI','1981-10-13','Male','9876541899',NULL,'abc@gmail.com','KHAN KOTDA,KALAVAD, KHANKOTDA, JAMNAGAR',1,NULL,504,'Pune',361013,NULL,'4677',NULL,'GJ10-20150006367',NULL,1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9449,'1009449','EMP0009449',NULL,NULL,'SANKET','MANSUKHBHAI','DOMADIYA','1988-11-07','Male','9876541908',NULL,'abc@gmail.com','MURLIDHAR, DAYANAND PURV, UNA',1,NULL,504,'Pune',362560,'136-137, RAM NAGAR SOCIETY, NR. MINI BAZAR CHAR RASTA, SURAT.','7966','AZKPD7903J','GJ11-20110015259',NULL,5,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9450,'1009450','EMP0009450',NULL,NULL,'NITHISH MOHAN','K.N.MOHAN',NULL,'1988-10-30','Male','9876541918',NULL,'abc@gmail.com','ERATTAPADATH PUTHANPURACKAL,PATTIMATTAOM P.O, CHENGARA',1,NULL,504,'Pune',683562,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0',NULL,NULL,'Unmarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9451,'1009451','EMP0009451',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-08','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9452,'1009452','EMP0009452',NULL,NULL,'BINDIYA','ANILBHAI','BAVARAVA','1982-10-08','Female','9876542011',NULL,'abc@gmail.com','1357-SUNDRAM BUNGLOW, RADHESHYAM SOC, JAMALPORE',1,NULL,504,'Pune',396445,NULL,'8688',NULL,NULL,'Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9453,'1009453','EMP0009453',NULL,NULL,'SURESHBHAI','SUKHABHAI','PATEL','1986-03-31','Male','9876542012',NULL,'abc@gmail.com','14/2, KOLA FALIYA,JALALPORE, KANERA,JALALPORE',1,NULL,504,'Pune',396460,NULL,'7922','AUSPP1534A',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9454,'1009454','EMP0009454',NULL,NULL,'PRAKASH','MANUBHAI','PANDYA','1986-04-08','Male','9876542272',NULL,'abc@gmail.com','76,NICHLI GALI, PHULERA,SIROHI',1,NULL,720,'Sirohi',307022,'402, NAG-MANI APPT, GANESH NAGAR, SATYA-NARAYAN FURNITURE KI GALLY, PARVAT PATIYA, SURAT.','4201','AGDPP5339G','GJ07-20110001427','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9455,'1009455','EMP0009455',NULL,NULL,'DHARMESH','DAHYABHAI','PATEL','1989-03-31','Male','9876542280',NULL,'abc@gmail.com','A-87, SHRI NATH SOCIETY, ADAJAN GAM',1,NULL,1033,'Surat',395009,NULL,'749275478329','ALOPP482F','GJ05-200003','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9456,'1009456','EMP0009456',NULL,NULL,'MUKESHKUMAR','MOHANBHAI','MOVALIYA','1986-09-07','Male','9876542281',NULL,'abc@gmail.com','A-201,RAJHANS WINGS-1, CANAL ROAD, NEAR NEW L.P SAVANI ROAD, PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3101','AOCPM8998M',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9457,'1009457','EMP0009457',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-10','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9458,'1009458','EMP0009458',NULL,NULL,'DIVYANG ','RAMESHCHANDRA','SHAH','1983-09-07','Male','9876542283',NULL,'abc@gmail.com','B-7, SAHYOH APT, SNEH SANKUL WADI, ANAND MAHEL ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9250','ANDPS7889M',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9459,'1009459','EMP0009459',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-20','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9460,'1009460','EMP0009460',NULL,NULL,'HARDIK','VAIKUNTHKUMAR','VAIDYA','1987-05-13','Male','9876542285',NULL,'abc@gmail.com','PLOT NO-316, RAJESHRI, BRAHMIN FALIYU,FULPADA GRAM PANCHAYAT',1,NULL,1033,'Surat',395008,NULL,'0',NULL,'GJ05-20040078868','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:32','2017-05-26 23:31:32',NULL,NULL,NULL,NULL),(9461,'1009461','EMP0009461',NULL,NULL,'RAJESH',NULL,'TAILOR','1987-01-20','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9462,'1009462','EMP0009462',NULL,NULL,'JENISH','NALINBHAI','TAILOR','1982-05-25','Male','9876542288',NULL,'abc@gmail.com','KOSAMBA,KAMREJ',1,NULL,1033,'Surat',395006,NULL,'6850','AOCPT8697J','GJ05-20130039229','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9463,'1009463','EMP0009463',NULL,NULL,'MEENAKSHI','ANILKUMAR','DARDA','1989-04-08','Female','9876542290',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'0','BFDPD8559L','GJ05-20120030760','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9464,'1009464','EMP0009464',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-13','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9465,'1009465','EMP0009465',NULL,NULL,'MITALI','SURESHBHAI','KATIRA','1983-01-04','Female','9876542292',NULL,'abc@gmail.com','C-103,RAJHANS WINGS,NR NEW L.P SAVANI SCHOOL,ADAJAN',1,NULL,1033,'Surat',395009,NULL,'0','DJAPK1815B','GJ05-20080143657','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9466,'1009466','EMP0009466',NULL,NULL,'SHAMIM','MOHSIN','POTHIYAWALA','1982-06-26','Female','9876542294',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8087','CBJPP8031L','GJ05-20060018928','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9467,'1009467','EMP0009467',NULL,NULL,'KANAIYA','DINESHBHAI','PATEL','1986-11-26','Male','9876542295',NULL,'abc@gmail.com','B NO-7,R-3HIMGIRI APT,PALANPURPATIA,RANDER ROAD',1,NULL,1033,'Surat',395005,NULL,'0','AZQPP2189J','GJ05-20130041691','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9468,'1009468','EMP0009468',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-26','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9469,'1009469','EMP0009469',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-25','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:33','2017-05-26 23:31:33',NULL,NULL,NULL,NULL),(9470,'1009470','EMP0009470',NULL,NULL,'SHREYAS','SHAILESHKUMAR','VADI','1983-11-10','Male','9876542299',NULL,'abc@gmail.com','7/14222-DHASTIPURA VARIYAVI BAZAR,',1,NULL,1033,'Surat',395003,NULL,'9485','AWZPV3757C','GJ05-20140013388','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9471,'1009471','EMP0009471',NULL,NULL,'ADITYA','HITESHBHAI','DESAI','1982-09-14','Male','9876542300',NULL,'abc@gmail.com','23,NAVYUG SOCIETY, B/H NAVYUG COLLEGE, RANDER ROAD',1,NULL,1033,'Surat',395009,NULL,'0','BTHPD3337C',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,54,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9472,'1009472','EMP0009472',NULL,NULL,'JAY','RAMESHBHAI','PATEL','1990-04-11','Male','9876542301',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100285674','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9473,'1009473','EMP0009473',NULL,NULL,'RANNA','PRAMODBHAI','PUROHIT','1986-04-16','Female','9876542302',NULL,'abc@gmail.com','MIG-B 1301, BUILDING NAME-TAPI, VIR NARMAD NAGAR,AMROLI KOSAD, ROAD, AMROLI',1,NULL,1033,'Surat',394107,NULL,'7064','BRVPP7359E','GJ05-20100011004','Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9474,'1009474','EMP0009474',NULL,NULL,'BHAVIKA','AMRUTBHAI','UMRIGAR','1987-10-12','Female','9876542303',NULL,'abc@gmail.com','302,KESHAVJYOT APT, DOCTOR FALIYU,UMRAGAM,',1,NULL,1033,'Surat',395007,NULL,'7206','AEBPU4127M','GJ05-20120027613','Unmarried',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9475,'1009475','EMP0009475',NULL,NULL,'ARCHANA','JITENDRABHAI','SAPARIYA','1981-03-11','Female','9876542304',NULL,'abc@gmail.com','324,KRISHNA KUNJ SOC,PALANPUR PATIA,RANDER ROAD',1,NULL,1033,'Surat',395009,NULL,'0','GLAPS5292H','GJ05-20100026258','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9476,'1009476','EMP0009476',NULL,NULL,'KRUNAL ','HARISHKUMAR','SADRANI','1986-08-14','Male','9876542305',NULL,'abc@gmail.com','202,SWAGAT APT, SAHNIP PARK, ANAND MAHEL ROAD',1,NULL,1033,'Surat',395009,NULL,'4551','EXNPS 9099R','GJ05-20110049973','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9477,'1009477','EMP0009477',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-29','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9478,'1009478','EMP0009478',NULL,NULL,'BHAVIN','NATVARLAL','KANTHARIYA','1983-11-26','Male','9876542307',NULL,'abc@gmail.com','A-31,NAGINA WADI SOC,S.D ROAD,',1,NULL,1033,'Surat',395004,NULL,'8657','AZOPK5620K','GJ05-20100094348','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9479,'1009479','EMP0009479',NULL,NULL,'SIMRANJEET KAUR','SHIVKUMAR','DHARIWAL','1981-05-30','Female','9876542308',NULL,'abc@gmail.com','26/104,SUDA AWAS, OPP RELIANCE MARKET, VESU',1,NULL,1033,'Surat',395007,NULL,'0','BXQPD3105H',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9480,'1009480','EMP0009480',NULL,NULL,'RISHI','TULSHIBHAI','GUMASANA','1983-07-13','Male','9876542309',NULL,'abc@gmail.com','302,DHANLAXMI APT, 29/A SAMARPAN SOC, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20130003499','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9481,'1009481','EMP0009481',NULL,NULL,'VAIBHAVI','MAYUR','JHAVERI','1982-05-17','Female','9876542310',NULL,'abc@gmail.com','2ND FLOOR, TOWER-D, FLAT NO-203,INDRAPRASTH, CITYLIGHT ROAD',1,NULL,1033,'Surat',395007,NULL,'9675','AXXPJ2132J','GJ05-20110026634','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9482,'1009482','EMP0009482',NULL,NULL,'PRATIK','DHARMENDRA','PAREKH','1981-09-27','Male','9876542311',NULL,'abc@gmail.com','FLAT NO-E/202, VASUPUJYA RESIDENCY,OPP RAJ CORNER, B/H LP SAVANI SCHOOL',1,NULL,1033,'Surat',395009,NULL,'0','BGNPP3298M','GJ05-20080083242','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:31:34','2017-05-26 23:31:34',NULL,NULL,NULL,NULL),(9483,'1009483','EMP0009483',NULL,NULL,'KRUSHNA','GHANSHYAMABHAI','DHANANI','1982-10-16','Male','9876542312',NULL,'abc@gmail.com','102,RACHNA SOC, KAPODRA,VARACHHA ROAD,',1,NULL,1033,'Surat',395006,NULL,'3172','AWEPD6378E','GJ05-20100018338','Unmarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9484,'1009484','EMP0009484',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-23','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9485,'1009485','EMP0009485',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-07','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9486,'1009486','EMP0009486',NULL,NULL,'NILESH ','KHIMAJIBHAI','KAKADIYA','1986-06-03','Male','9876542315',NULL,'abc@gmail.com','E/2,501, KRISHNA PARK SOC, NR SUDAMA CHOWK, MOTA VARACHA,',1,NULL,1033,'Surat',394101,NULL,'8700','DZOPK5758M','GJ-0420160005632','Unmarried',2,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9487,'1009487','EMP0009487',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-21','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9488,'1009488','EMP0009488',NULL,NULL,'DEBALOY','DEBI PRASAD','MITRA','1985-05-31','Male','9876542317',NULL,'abc@gmail.com','A-402, GEETANJALI BUILDING,PLOT-162,SECTOR-2, ULWE, NAVI MUMBAI',1,NULL,1033,'Surat',400707,NULL,'4769','APWPM1478F','MH46-20140014703','Married',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9489,'1009489','EMP0009489',NULL,NULL,'PRASANNA ','RAMESH','GARGAVA','1981-05-22','Male','9876542357',NULL,'abc@gmail.com','1,2- ALIITE RESIDENCY, NUTAN BHARAT SOCIETY, ALKAPURI',1,NULL,228,'Vadodra',390007,NULL,'0',NULL,NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9490,'1009490','EMP0009490',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1987-01-21','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9491,'1009491','EMP0009491',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1987-01-22','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9492,'1009492','EMP0009492',NULL,NULL,'RUTU',NULL,'MOVALIYA','1987-01-23','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9493,'1009493','EMP0009493',NULL,NULL,'PURVANGKUMAR','MANUBHAI','PATEL','1984-10-27','Male','9876542373',NULL,'abc@gmail.com','GANSHYAM VIHAR SOCIETY, GANDEVI ROAD, NEAR CNG STATION, BEHIND PRIMARY ROAD, JAMALPORE',1,NULL,214,NULL,396445,NULL,'634298657725','AIQPP0033J','77722/99/VL','Married',NULL,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9494,'1009494','EMP0009494',NULL,NULL,'VICKY','NITINBHAI','SORATHIYA','1987-12-23','Male','9876542374',NULL,'abc@gmail.com','OM, MAHADEV VADI-4 ,GONDAL',1,NULL,218,NULL,360311,NULL,'206020233087','GOAPS8490Q',NULL,'UnMarried',4,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9495,'1009495','EMP0009495',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-16','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 23:31:35','2017-05-26 23:31:35',NULL,NULL,NULL,NULL),(9496,'1009496','EMP0009496',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-30','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 23:31:36','2017-05-26 23:31:36',NULL,NULL,NULL,NULL);
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
  KEY `index_goal_bunches_on_performance_calendar_id` (`performance_calendar_id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
INSERT INTO `groups` VALUES (1,'mdindia@gmail.com','$2a$10$GfpNV0orbEwVpbDc2q8mzeFHJqPK//03o2AH0ywYIrs7KVtJ8WqDO','MD India',NULL,NULL,NULL,3,'2017-05-27 00:17:09','2017-05-26 21:07:36','127.0.0.1','114.143.205.226','2017-05-26 21:04:33','2017-05-27 00:17:09',NULL,NULL,NULL,NULL);
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
  `activity_date` date DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `program_agenda` text COLLATE utf8_unicode_ci,
  `start_date` date DEFAULT NULL,
  `induction_completed` tinyint(1) DEFAULT NULL,
  `facilitator_1` text COLLATE utf8_unicode_ci,
  `facilitator_2` text COLLATE utf8_unicode_ci,
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
  PRIMARY KEY (`id`),
  KEY `index_joining_details_on_employee_id` (`employee_id`),
  KEY `index_joining_details_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_joining_details_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_joining_details_on_reserved_category_id` (`reserved_category_id`),
  KEY `index_joining_details_on_cost_center_id` (`cost_center_id`),
  KEY `index_joining_details_on_employee_category_id` (`employee_category_id`),
  KEY `index_joining_details_on_payment_mode_id` (`payment_mode_id`),
  CONSTRAINT `fk_rails_2399bfef36` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`),
  CONSTRAINT `fk_rails_214c8daf87` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leav_categories`
--

LOCK TABLES `leav_categories` WRITE;
/*!40000 ALTER TABLE `leav_categories` DISABLE KEYS */;
INSERT INTO `leav_categories` VALUES (1,'1.0','CL','Casual Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','EL','Earned Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','LWP','LWP Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','ESIC','ESIC Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'5.0','AL','Advance Leave',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'6.0','C.Off','Compensatory Off',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (1,1,2,4,'2017-05-27',NULL,'2017-05-26 23:38:19','2017-05-26 23:38:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'1000001',1,'EMP0000001',NULL,'abc@gmail.com','$2a$10$ZjGuliD96gx4.MbsM4BpR.UfMBIfy1mQ1jd91/FSYyBs4hgA7yyYG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2017-05-27 00:21:41','2017-05-27 00:16:34','127.0.0.1','127.0.0.1','2017-05-26 23:38:19','2017-05-27 00:21:41',1,2,1,1,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationalities`
--

LOCK TABLES `nationalities` WRITE;
/*!40000 ALTER TABLE `nationalities` DISABLE KEYS */;
INSERT INTO `nationalities` VALUES (1,'1.0','Indian',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES (1,'1.0','Cheque',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Cash',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Bank',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'4.0','DD','Demand Draft',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'5.0','NEFT','National Electronic Funds Transfer',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
INSERT INTO `relation_masters` VALUES (1,'1.0','Father',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Mother',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Daughter',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'4.0','Son',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'5.0','Brother',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(6,'6.0','Wife',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(7,'7.0','Husband',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(8,'8.0','Sister',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
INSERT INTO `religions` VALUES (1,'Hinduism','1.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'Jainism','2.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'Islam','3.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'Christianity','4.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'Sikhism','5.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(6,'Buddhism','6.0',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_d6a54407d7` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,2,'2017-05-26 23:33:11','2017-05-26 23:33:11',1),(2,NULL,NULL,NULL,4,'2017-05-26 23:33:44','2017-05-26 23:33:44',1);
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
  `employee_training` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
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
  `travel_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `daily_bill_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_masters_travel_requests_on_travel_request_id` (`travel_request_id`),
  KEY `index_reporting_masters_travel_requests_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_e52f190f66` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_categories`
--

LOCK TABLES `reserved_categories` WRITE;
/*!40000 ALTER TABLE `reserved_categories` DISABLE KEYS */;
INSERT INTO `reserved_categories` VALUES (1,'1.0','GENERAL','GENERAL',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','OBC','OTHER BACKWARD CLASSES',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','SC','SCHEDULED CASTE',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'4.0','ST','SCHEDULED TRIBE',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'5.0','NT','Nomadic Tribes',NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
  KEY `index_resignation_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_resignation_histories_on_leaving_reason_id` (`leaving_reason_id`),
  KEY `index_resignation_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_834cfeb746` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ccbad3903` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1.0','GroupAdmin',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(2,'2.0','Admin',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(3,'3.0','Branch',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(4,'4.0','HOD',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40'),(5,'5.0','Supervisor',NULL,NULL,'2017-05-26 20:53:40','2017-05-26 20:53:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
INSERT INTO `salary_component_templates` VALUES (1,'1',1,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:23:49','2017-05-27 00:23:49'),(2,'1',1,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:23:53','2017-05-27 00:23:53'),(3,'1',1,3,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:23:57','2017-05-27 00:23:57'),(4,'1',1,4,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:24:02','2017-05-27 00:24:02'),(5,'1',1,5,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:24:07','2017-05-27 00:24:07'),(6,'1',1,8,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-05-27 00:24:12','2017-05-27 00:24:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'1.0','Basic','Basic',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:22:24'),(2,'2.0','HRA','HRA',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:22:30'),(3,'3.0','Special Allowance','Special Allowance',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:22:44'),(4,'4.0','Convenience Allowance','Convenience Allowance',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:22:52'),(5,'5.0','Other Allowance','Other Allowance',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:22:59'),(6,'6.0','Washing Allowance','Washing Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'7.0','Driver Allowance','Driver Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'8.0','Medical Allowance','Medical Allowance',NULL,0,NULL,'',1,1,'2017-05-26 20:53:41','2017-05-27 00:23:13'),(9,'9.0','Children Education Allowance','Children Education Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,'10.0','PF','PF',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(12,'12.0','Income Tax','Income Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(13,'13.0','Food Deduction','Food Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(14,'14.0','Other Deduction','Other Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(15,'15.0','Prof. Tax','Prof. Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(16,'16.0','Society','Deposit',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(17,'17.0','Society Loan','Society',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(18,'18.0','Retaintion','Retaintion',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(19,'19.0','DA','Dearness Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(20,'20.0','Welfair','Welfair',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(21,'21.0','Mobile Deduction','Mobile Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_templates`
--

LOCK TABLES `salary_templates` WRITE;
/*!40000 ALTER TABLE `salary_templates` DISABLE KEYS */;
INSERT INTO `salary_templates` VALUES (1,'1','Salary Template','2017-05-27',1,NULL,'2017-05-27 00:23:37','2017-05-27 00:23:37');
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712'),('20170526223740');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'AN','Union Territory of Andaman and Nicobar Islands','2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,1,'AP','Andhra Pradesh','2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,1,'AR','Arunachal Pradesh','2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,1,'AS','Assam','2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,1,'BR','Bihar','2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,1,'CH','Chandigarh','2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,1,'CT','State of Chhattisgarh','2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,1,'DD','Daman and Diu','2017-05-26 20:53:41','2017-05-26 20:53:41'),(9,1,'DL','National Capital Territory of Delhi','2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,1,'DN','Dadra and Nagar Haveli','2017-05-26 20:53:41','2017-05-26 20:53:41'),(11,1,'GA','Goa','2017-05-26 20:53:41','2017-05-26 20:53:41'),(12,1,'GJ','Gujarat','2017-05-26 20:53:41','2017-05-26 20:53:41'),(13,1,'HP','State of Himachal Pradesh','2017-05-26 20:53:41','2017-05-26 20:53:41'),(14,1,'HR','Haryana','2017-05-26 20:53:41','2017-05-26 20:53:41'),(15,1,'JH','State of Jharkhand','2017-05-26 20:53:41','2017-05-26 20:53:41'),(16,1,'JK','Kashmir','2017-05-26 20:53:41','2017-05-26 20:53:41'),(17,1,'KA','Karnataka','2017-05-26 20:53:41','2017-05-26 20:53:41'),(18,1,'KL','Kerala','2017-05-26 20:53:41','2017-05-26 20:53:41'),(19,1,'LD','Laccadives','2017-05-26 20:53:41','2017-05-26 20:53:41'),(20,1,'MH','Maharashtra','2017-05-26 20:53:41','2017-05-26 20:53:41'),(21,1,'ML','Meghalaya','2017-05-26 20:53:41','2017-05-26 20:53:41'),(22,1,'MN','Manipur','2017-05-26 20:53:41','2017-05-26 20:53:41'),(23,1,'MP','Madhya Pradesh','2017-05-26 20:53:42','2017-05-26 20:53:42'),(24,1,'MZ','Mizoram','2017-05-26 20:53:42','2017-05-26 20:53:42'),(25,1,'NL','Nagaland','2017-05-26 20:53:42','2017-05-26 20:53:42'),(26,1,'OR','Odisha','2017-05-26 20:53:42','2017-05-26 20:53:42'),(27,1,'PB','State of Punjab','2017-05-26 20:53:42','2017-05-26 20:53:42'),(28,1,'PY','Union Territory of Puducherry','2017-05-26 20:53:42','2017-05-26 20:53:42'),(29,1,'RJ','Rajasthan','2017-05-26 20:53:42','2017-05-26 20:53:42'),(30,1,'SK','Sikkim','2017-05-26 20:53:42','2017-05-26 20:53:42'),(31,1,'TG','Telangana','2017-05-26 20:53:42','2017-05-26 20:53:42'),(32,1,'TN','Tamil Nadu','2017-05-26 20:53:42','2017-05-26 20:53:42'),(33,1,'TR','Tripura','2017-05-26 20:53:42','2017-05-26 20:53:42'),(34,1,'UL','Uttarakhand','2017-05-26 20:53:42','2017-05-26 20:53:42'),(35,1,'UP','Uttar Pradesh','2017-05-26 20:53:42','2017-05-26 20:53:42'),(36,1,'WB','West Bengal','2017-05-26 20:53:42','2017-05-26 20:53:42');
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
  KEY `index_trainee_requests_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_trainee_requests_on_training_topic_master_id` (`training_topic_master_id`),
  CONSTRAINT `fk_rails_aec79e9d4b` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_66e80626aa` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
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
  KEY `index_transfer_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_transfer_histories_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_transfer_histories_on_employee_category_id` (`employee_category_id`),
  KEY `index_transfer_histories_on_company_id` (`company_id`),
  KEY `index_transfer_histories_on_company_location_id` (`company_location_id`),
  KEY `index_transfer_histories_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_6e8f518b5f` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_17bac9f9ec` FOREIGN KEY (`employee_transfer_id`) REFERENCES `employee_transfers` (`id`),
  CONSTRAINT `fk_rails_287f420d1d` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_2d8030b775` FOREIGN KEY (`company_location_id`) REFERENCES `company_locations` (`id`),
  CONSTRAINT `fk_rails_3719557a62` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_4c70840e16` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_54886f5039` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
INSERT INTO `travel_expence_types` VALUES (1,'1.0','Travel Expence',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','Food Expence',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','Lodgging Expence',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','Other Expence',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `travel_modes` VALUES (1,'1.0','By Bus',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','By Train',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','By Plan',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','By Ship',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `travel_options` VALUES (1,'1.0','Domestic',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','National',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','International',NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
  KEY `index_travel_request_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_travel_request_histories_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_request_histories_on_travel_mode_id` (`travel_mode_id`),
  KEY `index_travel_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_c0ebfca129` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_2f199330b2` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_b07d84a89f` FOREIGN KEY (`travel_request_id`) REFERENCES `travel_requests` (`id`),
  CONSTRAINT `fk_rails_bd36e7cbd9` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
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
  `traveling_advance` decimal(15,2) DEFAULT '0.00',
  `reporting_master_id` int(11) DEFAULT NULL,
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `daily_bill_status` text COLLATE utf8_unicode_ci,
  `to` date DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense` decimal(10,0) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
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
  `vacancy_fullfillment_date` date DEFAULT NULL,
  `is_confirmed` tinyint(1) DEFAULT NULL,
  `vacancy_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
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
  KEY `index_vacancy_request_histories_on_reporting_master_id` (`reporting_master_id`),
  KEY `index_vacancy_request_histories_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_a3ee9c0997` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_0990a86378` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2007d583f0` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`),
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
  `present_day` decimal(5,1) DEFAULT NULL,
  `holiday_in_month` decimal(5,1) DEFAULT NULL,
  `week_off_day` decimal(5,1) DEFAULT NULL,
  `absent_day` decimal(5,1) DEFAULT NULL,
  `payable_day` decimal(5,1) DEFAULT NULL,
  `calculated_payable_days` decimal(5,1) DEFAULT NULL,
  `pay_leave` decimal(5,1) DEFAULT NULL,
  `nonpay_leave` decimal(5,1) DEFAULT NULL,
  `od_day` decimal(5,1) DEFAULT NULL,
  `ot_hours` decimal(5,1) DEFAULT NULL,
  `total_leave` decimal(5,1) DEFAULT NULL,
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

-- Dump completed on 2017-05-27  5:56:19