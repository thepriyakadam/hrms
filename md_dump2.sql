-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hrms_development
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-05-26 21:16:16','2017-05-26 21:16:16'),(2,'company_location',4,'2017-05-26 21:17:00','2017-05-26 21:20:51'),(3,'employee',9496,'2017-05-26 21:48:57','2017-05-26 21:51:15');
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
INSERT INTO `departments` VALUES (1,1,'1.0','DEP1',NULL,'Production',1,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(2,1,'2.0','DEP2',NULL,'358 Section',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(3,1,'3.0','DEP3',NULL,'Finishing',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(4,1,'4.0','DEP4',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(5,1,'5.0','DEP5',NULL,'Safety',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(6,1,'6.0','DEP6',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(7,1,'7.0','DEP7',NULL,'Marketing',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(8,1,'8.0','DEP8',NULL,'Electrical',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(9,1,'9.0','DEP9',NULL,'Seamless',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(10,1,'10.0','DEP10',NULL,'TMD',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(11,1,'11.0','DEP11',NULL,'CRD',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(12,1,'12.0','DEP12',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(13,1,'13.0','DEP13',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(14,1,'14.0','DEP14',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(15,1,'15.0','DEP15',NULL,'Purchase',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(16,1,'16.0','DEP16',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(17,1,'17.0','DEP17',NULL,'Utility',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(18,1,'18.0','DEP18',NULL,'Stores',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(19,1,'19.0','DEP19',NULL,'Security',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(20,1,'20.0','DEP20',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(21,1,'21.0','DEP21',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(22,1,'22.0','DEP22',NULL,'Workshop',2,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(23,1,'23.0','DEP23',NULL,'IT',3,NULL,NULL,'2017-05-26 21:48:48','2017-05-26 21:48:48'),(24,1,'24.0','DEP24',NULL,'Project',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(25,1,'25.0','DEP25',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(26,1,'26.0','DEP26',NULL,'Planning',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(27,1,'27.0','DEP27',NULL,'Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(28,1,'28.0','DEP28',NULL,'Administration',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(29,1,'29.0','DEP29',NULL,'Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(30,1,'30.0','DEP30',NULL,'Store',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(31,1,'31.0','DEP31',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(32,1,'32.0','DEP32',NULL,'Analytics',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(33,1,'33.0','DEP33',NULL,'PLS',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(34,1,'34.0','DEP34',NULL,'Finance',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(35,1,'35.0','DEP35',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(36,1,'36.0','DEP36',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(37,1,'37.0','DEP37',NULL,'Business Development',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(38,1,'38.0','DEP38',NULL,'Admin',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(39,1,'39.0','DEP39',NULL,'COE',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(40,1,'40.0','DEP40',NULL,'Management',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(41,1,'41.0','DEP41',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(42,1,'42.0','DEP42',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(43,1,'43.0','DEP43',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(44,1,'44.0','DEP44',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(45,1,'45.0','DEP45',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(46,1,'46.0','DEP46',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(47,1,'47.0','DEP47',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(48,1,'48.0','DEP48',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(49,1,'49.0','DEP49',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(50,1,'50.0','DEP50',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(51,1,'51.0','DEP51',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(52,1,'52.0','DEP52',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(53,1,'53.0','DEP53',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(54,1,'54.0','DEP54',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(55,1,'55.0','DEP55',NULL,'Sales',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(56,2,'56.0','DEP56',NULL,'Production',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(57,2,'57.0','DEP57',NULL,'358 Section',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(58,2,'58.0','DEP58',NULL,'Finishing',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(59,2,'59.0','DEP59',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(60,2,'60.0','DEP60',NULL,'Safety',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(61,2,'61.0','DEP61',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(62,2,'62.0','DEP62',NULL,'Marketing',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(63,2,'63.0','DEP63',NULL,'Electrical',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(64,2,'64.0','DEP64',NULL,'Seamless',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(65,2,'65.0','DEP65',NULL,'TMD',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(66,2,'66.0','DEP66',NULL,'CRD',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(67,2,'67.0','DEP67',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(68,2,'68.0','DEP68',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(69,2,'69.0','DEP69',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(70,2,'70.0','DEP70',NULL,'Purchase',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(71,2,'71.0','DEP71',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(72,2,'72.0','DEP72',NULL,'Utility',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(73,2,'73.0','DEP73',NULL,'Stores',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(74,2,'74.0','DEP74',NULL,'Security',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(75,2,'75.0','DEP75',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(76,2,'76.0','DEP76',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(77,2,'77.0','DEP77',NULL,'Workshop',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(78,2,'78.0','DEP78',NULL,'IT',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(79,2,'79.0','DEP79',NULL,'Project',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(80,2,'80.0','DEP80',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(81,2,'81.0','DEP81',NULL,'Planning',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(82,2,'82.0','DEP82',NULL,'Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(83,2,'83.0','DEP83',NULL,'Administration',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(84,2,'84.0','DEP84',NULL,'Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(85,2,'85.0','DEP85',NULL,'Store',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(86,2,'86.0','DEP86',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(87,2,'87.0','DEP87',NULL,'Analytics',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(88,2,'88.0','DEP88',NULL,'PLS',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(89,2,'89.0','DEP89',NULL,'Finance',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(90,2,'90.0','DEP90',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(91,2,'91.0','DEP91',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(92,2,'92.0','DEP92',NULL,'Business Development',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(93,2,'93.0','DEP93',NULL,'Admin',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(94,2,'94.0','DEP94',NULL,'COE',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(95,2,'95.0','DEP95',NULL,'Management',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(96,2,'96.0','DEP96',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(97,2,'97.0','DEP97',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(98,2,'98.0','DEP98',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(99,2,'99.0','DEP99',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(100,2,'100.0','DEP100',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(101,2,'101.0','DEP101',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(102,2,'102.0','DEP102',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(103,2,'103.0','DEP103',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(104,2,'104.0','DEP104',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(105,2,'105.0','DEP105',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(106,2,'106.0','DEP106',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(107,2,'107.0','DEP107',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(108,2,'108.0','DEP108',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(109,2,'109.0','DEP109',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(110,2,'110.0','DEP110',NULL,'Sales',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(111,3,'111.0','DEP111',NULL,'Production',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(112,3,'112.0','DEP112',NULL,'358 Section',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(113,3,'113.0','DEP113',NULL,'Finishing',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(114,3,'114.0','DEP114',NULL,'Accounts / Finance',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(115,3,'115.0','DEP115',NULL,'Safety',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(116,3,'116.0','DEP116',NULL,'Quality Control',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(117,3,'117.0','DEP117',NULL,'Marketing',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(118,3,'118.0','DEP118',NULL,'Electrical',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(119,3,'119.0','DEP119',NULL,'Seamless',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(120,3,'120.0','DEP120',NULL,'TMD',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(121,3,'121.0','DEP121',NULL,'CRD',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(122,3,'122.0','DEP122',NULL,'Packing & Despatch',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(123,3,'123.0','DEP123',NULL,'Tubemill',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(124,3,'124.0','DEP124',NULL,'Maintainence',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(125,3,'125.0','DEP125',NULL,'Purchase',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(126,3,'126.0','DEP126',NULL,'HR/Administration',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(127,3,'127.0','DEP127',NULL,'Utility',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(128,3,'128.0','DEP128',NULL,'Stores',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(129,3,'129.0','DEP129',NULL,'Security',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(130,3,'130.0','DEP130',NULL,'Foil Division',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(131,3,'131.0','DEP131',NULL,'Fitting Plant',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(132,3,'132.0','DEP132',NULL,'Workshop',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(133,3,'133.0','DEP133',NULL,'IT',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(134,3,'134.0','DEP134',NULL,'Project',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(135,3,'135.0','DEP135',NULL,'M.D. Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(136,3,'136.0','DEP136',NULL,'Planning',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(137,3,'137.0','DEP137',NULL,'Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(138,3,'138.0','DEP138',NULL,'Administration',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(139,3,'139.0','DEP139',NULL,'Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(140,3,'140.0','DEP140',NULL,'Store',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(141,3,'141.0','DEP141',NULL,'Primary Research',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(142,3,'142.0','DEP142',NULL,'Analytics',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(143,3,'143.0','DEP143',NULL,'PLS',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(144,3,'144.0','DEP144',NULL,'Finance',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(145,3,'145.0','DEP145',NULL,'Human Resources',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(146,3,'146.0','DEP146',NULL,'Designing & Editorial',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(147,3,'147.0','DEP147',NULL,'Business Development',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(148,3,'148.0','DEP148',NULL,'Admin',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(149,3,'149.0','DEP149',NULL,'COE',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(150,3,'150.0','DEP150',NULL,'Management',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(151,3,'151.0','DEP151',NULL,'CEO\'s Office',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(152,3,'152.0','DEP152',NULL,'Small Dia Tubes',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(153,3,'153.0','DEP153',NULL,'L&T Production',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(154,3,'154.0','DEP154',NULL,'Fabrication',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(155,3,'155.0','DEP155',NULL,'Large Dia Tubes',3,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(156,3,'156.0','DEP156',NULL,'Finance & Accounts',2,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(157,3,'157.0','DEP157',NULL,'Business & Development',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(158,3,'158.0','DEP158',NULL,'Construction & Project Management',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(159,3,'159.0','DEP159',NULL,'Engineering & Maintainence',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(160,3,'160.0','DEP160',NULL,'Human Resource',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(161,3,'161.0','DEP161',NULL,'Information Technology',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(162,3,'162.0','DEP162',NULL,'Director\'s Office',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(163,3,'163.0','DEP163',NULL,'Media & Communication',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(164,3,'164.0','DEP164',NULL,'Avian,Breeding & Care',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49'),(165,3,'165.0','DEP165',NULL,'Sales',1,NULL,NULL,'2017-05-26 21:48:49','2017-05-26 21:48:49');
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
INSERT INTO `employees` VALUES (8031,'1008387','EMP0008031',NULL,NULL,'MANISH','MADANLAL','CHOUDHARY','1983-01-19','Male','9876541393',NULL,'abc@gmail.com','21,KAMALA KUNJ DEWAS',1,20,486,'Mumbai',0,'21,KAMALA KUNJ DEWAS','0',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8032,'1008459','EMP0008032',NULL,NULL,'MANISH','MADANLAL','CHOUDHARY','1983-01-20','Male','9876541471',NULL,'abc@gmail.com','Bajarang Nagar A.B.Road Dewas ',1,20,486,'Mumbai',455001,'Bajarang Nagar A.B.Road Dewas','891196124054','bevpc1198h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8033,'1000232','EMP0008033',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-21','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8034,'1001419','EMP0008034',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-22','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8035,'1002606','EMP0008035',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-23','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8036,'1003793','EMP0008036',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-24','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8037,'1004980','EMP0008037',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-25','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8038,'1006167','EMP0008038',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-26','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8039,'1007354','EMP0008039',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-27','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8040,'1008541','EMP0008040',NULL,NULL,'PRAVEEN','SUNIL','CHOUHAN','1983-01-28','Male','9876541559',NULL,'abc@gmail.com','43 Kumhar Gali Dewas',1,20,486,'Mumbai',455001,'43 Kumhar Gali Dewas','897832759002','AXPPC9865R',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8041,'1000066','EMP0008041',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-01-29','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8042,'1000423','EMP0008042',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-01-30','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8043,'1001253','EMP0008043',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-01-31','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8044,'1001610','EMP0008044',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-01','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8045,'1002440','EMP0008045',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-02','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8046,'1002797','EMP0008046',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-03','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8047,'1003627','EMP0008047',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-04','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8048,'1003984','EMP0008048',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-05','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8049,'1004814','EMP0008049',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-06','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8050,'1005171','EMP0008050',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-07','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8051,'1006001','EMP0008051',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-08','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8052,'1006358','EMP0008052',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-09','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8053,'1007188','EMP0008053',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-10','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8054,'1007545','EMP0008054',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-11','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8055,'1008375','EMP0008055',NULL,NULL,'NIKHLESH','RAMESH','PINDOLIYA','1983-02-12','Male','9876541381',NULL,'abc@gmail.com','140,EWS MUNI NAGR UJJAIN',1,20,486,'Mumbai',0,'140,EWS MUNI NAGR UJJAIN','696241403850','BLSPP9526N',NULL,'UnMarried',6,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8056,'1008732','EMP0008056',NULL,NULL,'SHASHANK','BRIJESH KUMAR','SHRIVASTAVA','1983-02-13','Male','9876541875',NULL,'abc@gmail.com','89 Vishnupura Nx Bhanwarkua Indore',1,20,486,'Mumbai',0,'89 Vishnupura Nx Bhanwarkua Indore','91495320038','dvwps7435h',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:52','2017-05-26 21:50:52',NULL,NULL,NULL,NULL),(8057,'1000500','EMP0008057',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-14','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8058,'1001687','EMP0008058',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-15','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8059,'1002874','EMP0008059',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-16','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8060,'1004061','EMP0008060',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-17','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8061,'1005248','EMP0008061',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-18','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8062,'1006435','EMP0008062',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-19','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8063,'1007622','EMP0008063',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-20','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8064,'1008809','EMP0008064',NULL,NULL,'SANJAY','SINGH','PANCHMANI','1983-02-21','Male','9876542330',NULL,'abc@gmail.com','210/3 Dayanand Colony  Nagda ',1,20,486,'Mumbai',0,'210/3 Dayanand Colony  Nagda','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8065,'1001051','EMP0008065',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-22','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8066,'1002238','EMP0008066',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-23','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8067,'1003425','EMP0008067',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-24','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8068,'1004612','EMP0008068',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-25','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8069,'1005799','EMP0008069',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-26','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8070,'1006986','EMP0008070',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-27','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8071,'1008173','EMP0008071',NULL,NULL,'ADITYA','SINGH','RANA','1983-02-28','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8072,'1009360','EMP0008072',NULL,NULL,'ADITYA','SINGH','RANA','1983-03-01','Male','9876541607',NULL,'abc@gmail.com','234-Lig  Jawahar Nagar',1,20,486,'Mumbai',455001,'234-Lig  Jawahar Nagar','324609288916',NULL,'MP41N20110076626','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8073,'1000587','EMP0008073',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-02','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8074,'1001774','EMP0008074',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-03','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8075,'1002961','EMP0008075',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-04','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8076,'1004148','EMP0008076',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-05','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8077,'1005335','EMP0008077',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-06','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8078,'1006522','EMP0008078',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-07','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8079,'1007709','EMP0008079',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-08','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8080,'1008896','EMP0008080',NULL,NULL,'Mohan ',NULL,'Pawar','1983-03-09','Male','9876542071',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8081,'1000584','EMP0008081',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-10','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8082,'1001771','EMP0008082',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-11','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8083,'1002958','EMP0008083',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-12','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8084,'1004145','EMP0008084',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-13','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8085,'1005332','EMP0008085',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-14','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8086,'1006519','EMP0008086',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-15','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8087,'1007706','EMP0008087',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-16','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8088,'1008893','EMP0008088',NULL,NULL,'Chetan ',NULL,'Airwal','1983-03-17','Male','9876542068',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8089,'1000582','EMP0008089',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-18','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8090,'1001769','EMP0008090',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-19','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8091,'1002956','EMP0008091',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-20','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8092,'1004143','EMP0008092',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-21','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8093,'1005330','EMP0008093',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-22','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8094,'1006517','EMP0008094',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-23','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8095,'1007704','EMP0008095',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-24','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8096,'1008891','EMP0008096',NULL,NULL,'Shyam Rav ',NULL,'Deshmukh','1983-03-25','Male','9876542066',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,30,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8097,'1000381','EMP0008097',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-26','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8098,'1001568','EMP0008098',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-27','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8099,'1002755','EMP0008099',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-28','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8100,'1003942','EMP0008100',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-29','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8101,'1005129','EMP0008101',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-30','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8102,'1006316','EMP0008102',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-03-31','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8103,'1007503','EMP0008103',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-04-01','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8104,'1008690','EMP0008104',NULL,NULL,'DINESH','LT. K.S.','YADAV','1983-04-02','Male','9876541756',NULL,'abc@gmail.com','33/21  Laxmi Bai Marg Dewas',1,20,486,'Mumbai',455001,'33/21  Laxmi Bai Marg Dewas','243075199865','ABRPY9170B','MP41/003332/04','Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,23,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8105,'1000378','EMP0008105',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-03','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8106,'1001565','EMP0008106',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-04','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8107,'1002752','EMP0008107',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-05','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8108,'1003939','EMP0008108',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-06','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8109,'1005126','EMP0008109',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-07','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8110,'1006313','EMP0008110',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-08','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8111,'1007500','EMP0008111',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-09','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8112,'1008687','EMP0008112',NULL,NULL,'POONAM','GANESH KUNDAR','KUNDAR','1983-04-10','Female','9876541753',NULL,'abc@gmail.com','501 Lig-Mukharjee Nagar Dewas ',1,20,486,'Mumbai',455001,'501 Lig-Mukharjee Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8113,'1000373','EMP0008113',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-11','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8114,'1001560','EMP0008114',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-12','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8115,'1002747','EMP0008115',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-13','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8116,'1003934','EMP0008116',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-14','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8117,'1005121','EMP0008117',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-15','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8118,'1006308','EMP0008118',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-16','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8119,'1007495','EMP0008119',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-17','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8120,'1008682','EMP0008120',NULL,NULL,'SANJAY','SHIVJIRAM','CHOUDHARY','1983-04-18','Male','9876541746',NULL,'abc@gmail.com','Vill-Mendhki Chakk Dewas',1,20,486,'Mumbai',455001,'Vill-Mendhki Chakk Dewas','0','AKPPC1736L',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8121,'1000096','EMP0008121',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-19','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8122,'1001283','EMP0008122',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-20','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:53','2017-05-26 21:50:53',NULL,NULL,NULL,NULL),(8123,'1002470','EMP0008123',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-21','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8124,'1003657','EMP0008124',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-22','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8125,'1004844','EMP0008125',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-23','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8126,'1006031','EMP0008126',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-24','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8127,'1007218','EMP0008127',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-25','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8128,'1008405','EMP0008128',NULL,NULL,'JITENDRA ',NULL,'JALKHEDIA','1983-04-26','Male','9876541416',NULL,'abc@gmail.com','S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS',1,20,486,'Mumbai',455001,'S/O: KAMAL SINGH, 77, MENDKI CHAK, DEWAS','921544988032',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8129,'1001029','EMP0008129',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-04-27','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8130,'1002216','EMP0008130',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-04-28','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8131,'1003403','EMP0008131',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-04-29','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8132,'1004590','EMP0008132',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-04-30','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8133,'1005777','EMP0008133',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-01','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8134,'1006964','EMP0008134',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-02','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8135,'1008151','EMP0008135',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-03','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8136,'1009338','EMP0008136',NULL,NULL,'RAKESH','ATMARAM','PARMAR','1983-05-04','Male','9876541406',NULL,'abc@gmail.com','05, Annapurna Nagar Station Road Dewas',1,20,486,'Mumbai',0,'05, Annapurna Nagar Station Road Dewas','0',NULL,'MP41N20130217406','UnMarried',7,1,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8137,'1000048','EMP0008137',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-05','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8138,'1001235','EMP0008138',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-06','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8139,'1002422','EMP0008139',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-07','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8140,'1003609','EMP0008140',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-08','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8141,'1004796','EMP0008141',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-09','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8142,'1005983','EMP0008142',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-10','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8143,'1007170','EMP0008143',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-11','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8144,'1008357','EMP0008144',NULL,NULL,'SUDHIR ','RAJENDRA','SINGH','1983-05-12','Male','9876541357',NULL,'abc@gmail.com','327/g,chandrashekhar marg ward no.5 rajgarh (dhar)',1,20,486,'Mumbai',0,'3/1 PARDESIPURA INDORE','932224158777',NULL,NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8145,'1001150','EMP0008145',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-13','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8146,'1002337','EMP0008146',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-14','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8147,'1003524','EMP0008147',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-15','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8148,'1004711','EMP0008148',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-16','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8149,'1005898','EMP0008149',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-17','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8150,'1007085','EMP0008150',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-18','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8151,'1008272','EMP0008151',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-19','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8152,'1009459','EMP0008152',NULL,NULL,'PRADIP','AMRATLAL','MEHTA','1983-05-20','Male','9876542284',NULL,'abc@gmail.com','FLAT NO-303,BUILDING NUMBER-1, C.M RESIDENCY, HONEY PARK ROAD, ADAJAN',1,NULL,1033,'Surat',395009,NULL,'9025','ACSPM1293P','GJ05-20091031827','Married',7,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8153,'1000118','EMP0008153',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-21','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8154,'1001305','EMP0008154',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-22','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8155,'1002492','EMP0008155',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-23','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8156,'1003679','EMP0008156',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-24','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8157,'1004866','EMP0008157',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-25','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8158,'1006053','EMP0008158',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-26','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8159,'1007240','EMP0008159',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-27','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8160,'1008427','EMP0008160',NULL,NULL,'ADITYA','SINGH','RATHOD','1983-05-28','Male','9876541438',NULL,'abc@gmail.com','16/2 Hathe Singh Goyal Colony Dewas',1,20,486,'Mumbai',455001,'16/2 Hathe Singh Goyal Colony Dewas','850114610161',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8161,'1000034','EMP0008161',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-05-29','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8162,'1001155','EMP0008162',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-05-30','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8163,'1001221','EMP0008163',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-05-31','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8164,'1002342','EMP0008164',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-01','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8165,'1002408','EMP0008165',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-02','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8166,'1003529','EMP0008166',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-03','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8167,'1003595','EMP0008167',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-04','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8168,'1004716','EMP0008168',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-05','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8169,'1004782','EMP0008169',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-06','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8170,'1005903','EMP0008170',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-07','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8171,'1005969','EMP0008171',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-08','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8172,'1007090','EMP0008172',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-09','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8173,'1007156','EMP0008173',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-10','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8174,'1008277','EMP0008174',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-11','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8175,'1008343','EMP0008175',NULL,NULL,'NIKHIL','SHAMBHU','RAJ','1983-06-12','Male','9876541296',NULL,'abc@gmail.com','BEGUSARAI BHIHAR',1,20,486,'Mumbai',0,'BHAGWATI HOTAL NEAR INDORE ','831698101776','BITPR7245E',NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8176,'1009464','EMP0008176',NULL,NULL,'DIVYANG ','BHAVIKBHAI','JOSHI','1983-06-13','Male','9876542291',NULL,'abc@gmail.com','6/1825,MAHIDHARPURA,HIRA BAZAAR, OPP POLICE CHOWKEY,',1,NULL,1033,'Surat',395003,NULL,'6854','AUHPJ1045P','GJ05-20120016443','Unmarried',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8177,'1001109','EMP0008177',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-14','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8178,'1002296','EMP0008178',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-15','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8179,'1003483','EMP0008179',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-16','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8180,'1004670','EMP0008180',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-17','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8181,'1005857','EMP0008181',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-18','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8182,'1007044','EMP0008182',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-19','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8183,'1008231','EMP0008183',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-20','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8184,'1009418','EMP0008184',NULL,NULL,'ANKIT','KUMAR','DASHORE','1983-06-21','Male','9876541922',NULL,'abc@gmail.com','Vill- Amalpura Post- Bhamgarh Dist Khndwa',1,20,504,'Pune',455001,'4/5 NAI ABADI STATION ROAD DEWAS','790640837478','CITPD6751Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8185,'1000314','EMP0008185',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-22','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8186,'1001501','EMP0008186',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-23','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8187,'1002688','EMP0008187',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-24','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8188,'1003875','EMP0008188',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-25','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8189,'1005062','EMP0008189',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-26','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:54','2017-05-26 21:50:54',NULL,NULL,NULL,NULL),(8190,'1006249','EMP0008190',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-27','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8191,'1007436','EMP0008191',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-28','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8192,'1008623','EMP0008192',NULL,NULL,'JAGDISH','CHANDRA','RAJBHATT','1983-06-29','Male','9876541675',NULL,'abc@gmail.com','21 Pachunkar Colony Civil Line Dewas',1,20,486,'Mumbai',455001,'21 Pachunkar Colony Civil Line Dewas','314073486935',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8193,'1000140','EMP0008193',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-06-30','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8194,'1001327','EMP0008194',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-01','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8195,'1002514','EMP0008195',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-02','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8196,'1003701','EMP0008196',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-03','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8197,'1004888','EMP0008197',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-04','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8198,'1006075','EMP0008198',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-05','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8199,'1007262','EMP0008199',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-06','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8200,'1008449','EMP0008200',NULL,NULL,'RAMAN','KUMAR','SHRIMAL','1983-07-07','Male','9876541460',NULL,'abc@gmail.com','50 Ram Nagar A.B.Road Dewas ',1,20,486,'Mumbai',0,'50 Ram Nagar A.B.Road Dewas','973758368039','BZFPS1289A',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8201,'1000282','EMP0008201',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-08','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8202,'1001469','EMP0008202',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-09','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8203,'1002656','EMP0008203',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-10','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8204,'1003843','EMP0008204',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-11','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8205,'1005030','EMP0008205',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-12','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8206,'1006217','EMP0008206',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-13','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8207,'1007404','EMP0008207',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-14','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8208,'1008591','EMP0008208',NULL,NULL,'SHAILESH ','MANSUKHLAL','VISHWAKARMA','1983-07-15','Male','9876541631',NULL,'abc@gmail.com','507 Ews-Mukharjee Nagar Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',0,'507 Ews-Mukharjee Nagar Dewas','312208301441','ATJPV2596A',NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8209,'1001175','EMP0008209',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-16','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8210,'1002362','EMP0008210',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-17','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8211,'1003549','EMP0008211',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-18','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8212,'1004736','EMP0008212',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-19','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8213,'1005923','EMP0008213',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-20','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8214,'1007110','EMP0008214',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-21','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8215,'1008297','EMP0008215',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-22','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8216,'1009484','EMP0008216',NULL,NULL,'NITI ','PARESHKUMAR','JOGANI','1983-07-23','Female','9876542313',NULL,'abc@gmail.com','7/D, SAUMYA APT, NR GOKUL ROW HOUSE, BH SARGAM SHOPPING CENTRE, PARLE POINT',1,NULL,1033,'Surat',395007,NULL,'0',NULL,'GJ05-20110020501','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8217,'1000560','EMP0008217',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-24','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8218,'1001747','EMP0008218',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-25','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8219,'1002934','EMP0008219',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-26','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8220,'1004121','EMP0008220',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-27','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8221,'1005308','EMP0008221',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-28','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8222,'1006495','EMP0008222',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-29','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8223,'1007682','EMP0008223',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-30','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8224,'1008869','EMP0008224',NULL,NULL,'Anoop ','Kumar ','Dwivedi','1983-07-31','Male','9876542044',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8225,'1000591','EMP0008225',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-01','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8226,'1001778','EMP0008226',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-02','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8227,'1002965','EMP0008227',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-03','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8228,'1004152','EMP0008228',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-04','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8229,'1005339','EMP0008229',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-05','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8230,'1006526','EMP0008230',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-06','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8231,'1007713','EMP0008231',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-07','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8232,'1008900','EMP0008232',NULL,NULL,'Kamal ',NULL,'Malviya','1983-08-08','Male','9876542075',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8233,'1000562','EMP0008233',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-09','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8234,'1001749','EMP0008234',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-10','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8235,'1002936','EMP0008235',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-11','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8236,'1004123','EMP0008236',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-12','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8237,'1005310','EMP0008237',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-13','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8238,'1006497','EMP0008238',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-14','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8239,'1007684','EMP0008239',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-15','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8240,'1008871','EMP0008240',NULL,NULL,'Satendra  ','Singh','Bais','1983-08-16','Male','9876542046',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8241,'1000259','EMP0008241',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-17','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8242,'1001446','EMP0008242',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-18','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8243,'1002633','EMP0008243',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-19','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8244,'1003820','EMP0008244',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-20','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8245,'1005007','EMP0008245',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-21','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8246,'1006194','EMP0008246',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-22','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8247,'1007381','EMP0008247',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-23','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8248,'1008568','EMP0008248',NULL,NULL,'SHAKIL','SADIK','SHAIKH','1983-08-24','Male','9876541596',NULL,'abc@gmail.com','bajoor bag colony nil ganga haro katal ke pas gali 14.15',1,20,486,'Mumbai',455001,'99 Indra Nagar Colony Dewas  Dewas  455001  Madhya Pradesh','702038394442',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8249,'1001115','EMP0008249',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-25','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8250,'1002302','EMP0008250',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-26','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8251,'1003489','EMP0008251',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-27','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:55','2017-05-26 21:50:55',NULL,NULL,NULL,NULL),(8252,'1004676','EMP0008252',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-28','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8253,'1005863','EMP0008253',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-29','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8254,'1007050','EMP0008254',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-30','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8255,'1008237','EMP0008255',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-08-31','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8256,'1009424','EMP0008256',NULL,NULL,'RAKESH','GANESH','KUMAR','1983-09-01','Male','9876542250',NULL,'abc@gmail.com','Samsha Khedi AWANTIPUR BDODIYA SHAJAPUR',1,20,1032,'SHAJAPUR',455001,'VIKAS NAGAR DEWAS','444724168483','DWEPS0032M',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8257,'1000243','EMP0008257',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-02','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8258,'1001430','EMP0008258',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-03','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8259,'1002617','EMP0008259',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-04','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8260,'1003804','EMP0008260',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-05','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8261,'1004991','EMP0008261',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-06','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8262,'1006178','EMP0008262',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-07','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8263,'1007365','EMP0008263',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-08','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8264,'1008552','EMP0008264',NULL,NULL,'SHAM','SHRIPAD ','DIKSHIT','1983-09-09','Male','9876541572',NULL,'abc@gmail.com','54 Pachunkar Colony Dewas',1,20,486,'Mumbai',455001,'54 Pachunkar Colony Dewas','0','AEMPD1656M','MP41N-20110063776','Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8265,'1000010','EMP0008265',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-10','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8266,'1001197','EMP0008266',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-11','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8267,'1002384','EMP0008267',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-12','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8268,'1003571','EMP0008268',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-13','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8269,'1004758','EMP0008269',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-14','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8270,'1005945','EMP0008270',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-15','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8271,'1007132','EMP0008271',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-16','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8272,'1008319','EMP0008272',NULL,NULL,'HIMANSHU','ASHOK ','GUPTA','1983-09-17','Male','9876541241',NULL,'abc@gmail.com','100,MR-4 MAHALAXMI NAGAR INDORE M.P',1,20,486,'Mumbai',452001,'100,MR-4 MAHALAXMI NAGAR INDORE M.P','753690942088','BNXPG1565R','MP09R-20130019905','Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8273,'1001016','EMP0008273',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-18','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8274,'1002203','EMP0008274',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-19','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8275,'1003390','EMP0008275',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-20','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8276,'1004577','EMP0008276',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-21','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8277,'1005764','EMP0008277',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-22','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8278,'1006951','EMP0008278',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-23','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8279,'1008138','EMP0008279',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-24','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8280,'1009325','EMP0008280',NULL,NULL,'BHANU ','PRATAP ','SINGH','1983-09-25','Male','9876541353',NULL,'abc@gmail.com','203 Mishrilal Nagar Dewas',1,20,486,'Mumbai',455001,'203 Mishrilal Nagar Dewas','0',NULL,NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8281,'1000427','EMP0008281',NULL,NULL,'RAJESH',' ','NILOSEY','1983-09-26','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8282,'1001614','EMP0008282',NULL,NULL,'RAJESH',' ','NILOSEY','1983-09-27','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8283,'1002801','EMP0008283',NULL,NULL,'RAJESH',' ','NILOSEY','1983-09-28','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8284,'1003988','EMP0008284',NULL,NULL,'RAJESH',' ','NILOSEY','1983-09-29','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8285,'1005175','EMP0008285',NULL,NULL,'RAJESH',' ','NILOSEY','1983-09-30','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8286,'1006362','EMP0008286',NULL,NULL,'RAJESH',' ','NILOSEY','1983-10-01','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8287,'1007549','EMP0008287',NULL,NULL,'RAJESH',' ','NILOSEY','1983-10-02','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8288,'1008736','EMP0008288',NULL,NULL,'RAJESH',' ','NILOSEY','1983-10-03','Male','9876541879',NULL,'abc@gmail.com','62 Anup Nagar Indore',1,20,486,'Mumbai',452010,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,25,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8289,'1000346','EMP0008289',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-04','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8290,'1001533','EMP0008290',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-05','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8291,'1002720','EMP0008291',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-06','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8292,'1003907','EMP0008292',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-07','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8293,'1005094','EMP0008293',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-08','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8294,'1006281','EMP0008294',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-09','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8295,'1007468','EMP0008295',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-10','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8296,'1008655','EMP0008296',NULL,NULL,'SHAHRUKH','ESRAIL','SHEKH','1983-10-11','Male','9876541715',NULL,'abc@gmail.com','344 Lig Iii Mukharji Nagar Dewas',1,20,486,'Mumbai',455001,'344 Lig Iii Mukharji Nagar Dewas','325088631886','FDCRS7376P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8297,'1000445','EMP0008297',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-12','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8298,'1000466','EMP0008298',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-13','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8299,'1001632','EMP0008299',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-14','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8300,'1001653','EMP0008300',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-15','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8301,'1002819','EMP0008301',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-16','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8302,'1002840','EMP0008302',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-17','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8303,'1004006','EMP0008303',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-18','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8304,'1004027','EMP0008304',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-19','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8305,'1005193','EMP0008305',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-20','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8306,'1005214','EMP0008306',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-21','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8307,'1006380','EMP0008307',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-22','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8308,'1006401','EMP0008308',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-23','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8309,'1007567','EMP0008309',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-24','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8310,'1007588','EMP0008310',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-25','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8311,'1008754','EMP0008311',NULL,NULL,'HARENDRA GOVIND','ANIRUDH GOVIND','RAO','1983-10-26','Male','9876541956',NULL,'abc@gmail.com','Vill-Bhoni Bujurg Post-Amwabazar',1,20,486,'Mumbai',0,'33,NEW BAJRANG NAGAR KAILA DEVI DEWAS','401046895652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8312,'1008775','EMP0008312',NULL,NULL,'CHANDRASHEKHAR','GAYARAM ','SINGH','1983-10-27','Male','9876542231',NULL,'abc@gmail.com','Vill-Hardaspur Maihar  Satna',1,20,486,'Mumbai',485772,'Mahalaxmi Nagar Indore ','286516689423','DPGPS3022L',NULL,'Married',4,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8313,'1000604','EMP0008313',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-10-28','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8314,'1001791','EMP0008314',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-10-29','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8315,'1002978','EMP0008315',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-10-30','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8316,'1004165','EMP0008316',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-10-31','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8317,'1005352','EMP0008317',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-11-01','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:56','2017-05-26 21:50:56',NULL,NULL,NULL,NULL),(8318,'1006539','EMP0008318',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-11-02','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8319,'1007726','EMP0008319',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-11-03','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8320,'1008913','EMP0008320',NULL,NULL,'Sunil ',NULL,'Bodana ','1983-11-04','Male','9876542088',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8321,'1001076','EMP0008321',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-05','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8322,'1002263','EMP0008322',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-06','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8323,'1003450','EMP0008323',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-07','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8324,'1004637','EMP0008324',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-08','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8325,'1005824','EMP0008325',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-09','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8326,'1007011','EMP0008326',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-10','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8327,'1008198','EMP0008327',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-11','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8328,'1009385','EMP0008328',NULL,NULL,'ARUN','MADAN LAL','SHARMA','1983-11-12','Male','9876541697',NULL,'abc@gmail.com','JOSHI GALI ANTRIMATA TH. MANASA DIST NEEMUCH',1,20,486,'Mumbai',455001,'TARANY COLONY DEWAS','0','EXJPS3993C','MP44N-2013-006321','UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8329,'1000391','EMP0008329',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-13','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8330,'1001578','EMP0008330',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-14','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8331,'1002765','EMP0008331',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-15','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8332,'1003952','EMP0008332',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-16','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8333,'1005139','EMP0008333',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-17','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8334,'1006326','EMP0008334',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-18','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8335,'1007513','EMP0008335',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-19','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8336,'1008700','EMP0008336',NULL,NULL,'SHUSHIL','SURENDRA','TAILAR','1983-11-20','Male','9876541773',NULL,'abc@gmail.com','102,Shankar Nagar Dewas',1,20,486,'Mumbai',455001,'102,Shankar Nagar Dewas','453917334632',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8337,'1000470','EMP0008337',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-21','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8338,'1001657','EMP0008338',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-22','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8339,'1002844','EMP0008339',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-23','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8340,'1004031','EMP0008340',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-24','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8341,'1005218','EMP0008341',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-25','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8342,'1006405','EMP0008342',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-26','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8343,'1007592','EMP0008343',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-27','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8344,'1008779','EMP0008344',NULL,NULL,'NATWAR','VIRENDRA SINGH','SISODIYA','1983-11-28','Male','9876542236',NULL,'abc@gmail.com','228  Lakherapura  Vill-Dauraha',1,20,486,'Mumbai',0,'51 B JAY SHREE NAGAR DEWAS','295705408899',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8345,'1001120','EMP0008345',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-11-29','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8346,'1002307','EMP0008346',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-11-30','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8347,'1003494','EMP0008347',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-01','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8348,'1004681','EMP0008348',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-02','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8349,'1005868','EMP0008349',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-03','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8350,'1007055','EMP0008350',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-04','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8351,'1008242','EMP0008351',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-05','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8352,'1009429','EMP0008352',NULL,NULL,'SHAEENA','MEHABOOB','SHAH','1983-12-06','Female','9876542333',NULL,'abc@gmail.com','1/3  Nazar Ali Marg Milkipura Ujjain',1,20,593,'Ujjain',456001,'1/3  Nazar Ali Marg Milkipura Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8353,'1000334','EMP0008353',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-07','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8354,'1001521','EMP0008354',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-08','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8355,'1002708','EMP0008355',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-09','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8356,'1003895','EMP0008356',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-10','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8357,'1005082','EMP0008357',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-11','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8358,'1006269','EMP0008358',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-12','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8359,'1007456','EMP0008359',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-13','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8360,'1008643','EMP0008360',NULL,NULL,'DEEPAK','GOKUL ','MALVIYA','1983-12-14','Male','9876541700',NULL,'abc@gmail.com','D3/36 Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D3/36 Awas Nagar Dewas','818549895220','cxvpm5208g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8361,'1000341','EMP0008361',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-15','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8362,'1001528','EMP0008362',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-16','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8363,'1002715','EMP0008363',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-17','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8364,'1003902','EMP0008364',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-18','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8365,'1005089','EMP0008365',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-19','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8366,'1006276','EMP0008366',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-20','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8367,'1007463','EMP0008367',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-21','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8368,'1008650','EMP0008368',NULL,NULL,'AISHWARYA','ANIL','RAIGAONKAR','1983-12-22','Male','9876541709',NULL,'abc@gmail.com','16-B Panchsheel Nagar Dewas',1,20,486,'Mumbai',455001,'16-B Panchsheel Nagar Dewas','545666035031','AMCPR1440F',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8369,'1001187','EMP0008369',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-23','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8370,'1002374','EMP0008370',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-24','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8371,'1003561','EMP0008371',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-25','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8372,'1004748','EMP0008372',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-26','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8373,'1005935','EMP0008373',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-27','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8374,'1007122','EMP0008374',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-28','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8375,'1008309','EMP0008375',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-29','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8376,'1009496','EMP0008376',NULL,NULL,'RAJIV','RANJAN','SINGH','1983-12-30','Male','9876542376',NULL,'abc@gmail.com','BLOCK-F, HOUSE NUMBER-43, GROUND FLOOR, NEAR BOOM PLAZA, SECTOR-57, SHUSHANT LOK-3, GURGAON',1,NULL,265,NULL,122002,NULL,'665394489142','ASNPS9482P',NULL,'Married',5,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,55,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8377,'1000181','EMP0008377',NULL,NULL,'RAJESH','SADASHIV','YADAV','1983-12-31','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8378,'1001368','EMP0008378',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-01','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8379,'1002555','EMP0008379',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-02','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8380,'1003742','EMP0008380',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-03','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8381,'1004929','EMP0008381',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-04','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:57','2017-05-26 21:50:57',NULL,NULL,NULL,NULL),(8382,'1006116','EMP0008382',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-05','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8383,'1007303','EMP0008383',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-06','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8384,'1008490','EMP0008384',NULL,NULL,'RAJESH','SADASHIV','YADAV','1984-01-07','Male','9876541504',NULL,'abc@gmail.com','55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.',1,20,486,'Mumbai',455001,'55/5 UPPADHYAY NAGER MENDAKI ROAD NEAR RAM TEMPAL DEWAS M.P.','614923323999','ADVPY9761C','MO-41 R-2015-0111164','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8385,'1000503','EMP0008385',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-08','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8386,'1001690','EMP0008386',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-09','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8387,'1002877','EMP0008387',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-10','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8388,'1004064','EMP0008388',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-11','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8389,'1005251','EMP0008389',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-12','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8390,'1006438','EMP0008390',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-13','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8391,'1007625','EMP0008391',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-14','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8392,'1008812','EMP0008392',NULL,NULL,'SACHIN','SURESH','BORANA','1984-01-15','Male','9876542334',NULL,'abc@gmail.com','8/7  Kanchan Pura Maxiroad Ujjain',1,20,486,'Mumbai',456001,'8/7  Kanchan Pura Maxiroad Ujjain','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,24,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8393,'1000453','EMP0008393',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-16','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8394,'1001640','EMP0008394',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-17','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8395,'1002827','EMP0008395',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-18','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8396,'1004014','EMP0008396',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-19','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8397,'1005201','EMP0008397',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-20','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8398,'1006388','EMP0008398',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-21','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8399,'1007575','EMP0008399',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-22','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8400,'1008762','EMP0008400',NULL,NULL,'SATYAPRAKASH','JATASHANKAR','TIWARI','1984-01-23','Male','9876542030',NULL,'abc@gmail.com','Vill-Belwa Post-Dhobni Dist-Paschimi Chammparan  Paschimi',1,20,486,'Mumbai',0,'238, PRAHLAD NAGAR BAVDIYA DEWAS ','321116686652',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8401,'1000113','EMP0008401',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-24','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8402,'1001300','EMP0008402',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-25','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8403,'1002487','EMP0008403',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-26','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8404,'1003674','EMP0008404',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-27','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8405,'1004861','EMP0008405',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-28','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8406,'1006048','EMP0008406',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-29','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8407,'1007235','EMP0008407',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-30','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8408,'1008422','EMP0008408',NULL,NULL,'HARRIRAM','BHAGIRATH',' ','1984-01-31','Male','9876541433',NULL,'abc@gmail.com','Beerakhedi Dewas',1,20,486,'Mumbai',455001,'Beerakhedi Dewas ','622877208240',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8409,'1000151','EMP0008409',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-01','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8410,'1001338','EMP0008410',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-02','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8411,'1002525','EMP0008411',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-03','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8412,'1003712','EMP0008412',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-04','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8413,'1004899','EMP0008413',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-05','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8414,'1006086','EMP0008414',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-06','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8415,'1007273','EMP0008415',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-07','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8416,'1008460','EMP0008416',NULL,NULL,'NITESH','DHARMAANAND ','MALI','1984-02-08','Male','9876541472',NULL,'abc@gmail.com','Vill & Post Bhourasa  Dewas',1,20,486,'Mumbai',0,'Vill & Post Bhourasa  Dewas','364258869225',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8417,'1001186','EMP0008417',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-09','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8418,'1002373','EMP0008418',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-10','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8419,'1003560','EMP0008419',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-11','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8420,'1004747','EMP0008420',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-12','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8421,'1005934','EMP0008421',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-13','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8422,'1007121','EMP0008422',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-14','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8423,'1008308','EMP0008423',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-15','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8424,'1009495','EMP0008424',NULL,NULL,'KISHAN','VIRENDRAKUMAR','CHEVLI','1984-02-16','Male','9876542375',NULL,'abc@gmail.com','30,BALAJI NAGAR, NEAR BHIMRAD CHECKPOST,BEHIND WHITE TEMPLE, BHIMRAD',1,NULL,1033,NULL,395017,NULL,'772678171754','APXPC0013F','GJ05-20110026768','UnMarried',8,3,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8425,'1000005','EMP0008425',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-17','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8426,'1001192','EMP0008426',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-18','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8427,'1002379','EMP0008427',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-19','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8428,'1003566','EMP0008428',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-20','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8429,'1004753','EMP0008429',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-21','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8430,'1005940','EMP0008430',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-22','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8431,'1007127','EMP0008431',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-23','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8432,'1008314','EMP0008432',NULL,NULL,'SHIVAM','ANIL','GUPTA','1984-02-24','Male','9876541236',NULL,'abc@gmail.com','14,SATYAM VIHAR INDORE',1,20,486,'Mumbai',0,'14,SATYAM VIHAR INDORE','388043738448',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,5,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8433,'1000112','EMP0008433',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-02-25','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8434,'1001299','EMP0008434',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-02-26','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8435,'1002486','EMP0008435',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-02-27','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8436,'1003673','EMP0008436',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-02-28','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8437,'1004860','EMP0008437',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-02-29','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8438,'1006047','EMP0008438',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-03-01','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8439,'1007234','EMP0008439',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-03-02','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8440,'1008421','EMP0008440',NULL,NULL,'ASHOK','SHESHRAO','KENE','1984-03-03','Male','9876541432',NULL,'abc@gmail.com','H.NO.103,PRATAP NAGAR  Dewas',1,20,486,'Mumbai',455001,'H.NO.103,PRATAP NAGAR  Dewas','214657211974','CRNPK2969N',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8441,'1000264','EMP0008441',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-04','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8442,'1001451','EMP0008442',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-05','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8443,'1002638','EMP0008443',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-06','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8444,'1003825','EMP0008444',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-07','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8445,'1005012','EMP0008445',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-08','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:58','2017-05-26 21:50:58',NULL,NULL,NULL,NULL),(8446,'1006199','EMP0008446',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-09','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8447,'1007386','EMP0008447',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-10','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8448,'1008573','EMP0008448',NULL,NULL,'SATYANARAYAN','BALU JI','DHOBI','1984-03-11','Male','9876541601',NULL,'abc@gmail.com','Shanti Pura  Dewas',1,20,486,'Mumbai',455001,'Shanti Pura  Dewas    Madhya Pradesh','356975231127',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8449,'1000044','EMP0008449',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-12','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8450,'1001231','EMP0008450',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-13','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8451,'1002418','EMP0008451',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-14','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8452,'1003605','EMP0008452',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-15','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8453,'1004792','EMP0008453',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-16','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8454,'1005979','EMP0008454',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-17','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8455,'1007166','EMP0008455',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-18','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8456,'1008353','EMP0008456',NULL,NULL,'SIDDHARTH','SHAILENDRA','VYAS','1984-03-19','Male','9876541317',NULL,'abc@gmail.com','mig 4/8 NEW SUBHASH NAGAR BHOPAL',1,20,486,'Mumbai',462023,'mig 4/8 NEW SUBHASH NAGAR BHOPAL','870394323898',NULL,NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,15,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8457,'1001089','EMP0008457',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-20','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8458,'1002276','EMP0008458',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-21','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8459,'1003463','EMP0008459',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-22','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8460,'1004650','EMP0008460',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-23','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8461,'1005837','EMP0008461',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-24','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8462,'1007024','EMP0008462',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-25','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8463,'1008211','EMP0008463',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-26','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8464,'1009398','EMP0008464',NULL,NULL,'RAVI','A.K.','JOSHI','1984-03-27','Male','9876541766',NULL,'abc@gmail.com','175  Jai Shree Nagar',1,20,486,'Mumbai',455001,'175  Jai Shree Nagar','936323542022','APGPJ0643D','MP41N20100099622','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8465,'1000315','EMP0008465',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-03-28','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8466,'1001502','EMP0008466',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-03-29','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8467,'1002689','EMP0008467',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-03-30','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8468,'1003876','EMP0008468',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-03-31','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8469,'1005063','EMP0008469',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-04-01','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8470,'1006250','EMP0008470',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-04-02','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8471,'1007437','EMP0008471',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-04-03','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8472,'1008624','EMP0008472',NULL,NULL,'RITESH','SATYANARAYAN','KUMAWAT','1984-04-04','Male','9876541678',NULL,'abc@gmail.com','49 C-Kalani Bag Dewas',1,20,486,'Mumbai',455001,'49 C-Kalani Bag Dewas ','297845887111',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8473,'1000226','EMP0008473',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-05','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8474,'1001413','EMP0008474',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-06','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8475,'1002600','EMP0008475',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-07','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8476,'1003787','EMP0008476',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-08','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8477,'1004974','EMP0008477',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-09','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8478,'1006161','EMP0008478',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-10','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8479,'1007348','EMP0008479',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-11','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8480,'1008535','EMP0008480',NULL,NULL,'TARUN','SINGH','THAKUR','1984-04-12','Male','9876541552',NULL,'abc@gmail.com','30 Laxmipura Dewas ',1,20,486,'Mumbai',455001,'30 Laxmipura Dewas  Dewas','678324868093','APXPT9157P',NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,12,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8481,'1000442','EMP0008481',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-13','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8482,'1001629','EMP0008482',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-14','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8483,'1002816','EMP0008483',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-15','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8484,'1004003','EMP0008484',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-16','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8485,'1005190','EMP0008485',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-17','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8486,'1006377','EMP0008486',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-18','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8487,'1007564','EMP0008487',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-19','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8488,'1008751','EMP0008488',NULL,NULL,'AKSHAY','DINESH','KHATORE','1984-04-20','Male','9876541931',NULL,'abc@gmail.com','PAHADSINGH PURA KHARGONE',1,20,486,'Mumbai',0,'PAHADSINGH PURA KHARGONE','409128062181',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8489,'1000312','EMP0008489',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-21','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8490,'1001499','EMP0008490',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-22','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8491,'1002686','EMP0008491',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-23','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8492,'1003873','EMP0008492',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-24','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8493,'1005060','EMP0008493',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-25','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8494,'1006247','EMP0008494',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-26','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8495,'1007434','EMP0008495',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-27','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8496,'1008621','EMP0008496',NULL,NULL,'PANKAJ','BHAL CHAND','DESHMUKH','1984-04-28','Male','9876541673',NULL,'abc@gmail.com','3 H.No-Ram Nagar Ext.Dewas ',1,20,486,'Mumbai',455001,'3 H.No-Ram Nagar Ext.Dewas','465805430550','BGWPD3501J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8497,'1000229','EMP0008497',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-04-29','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8498,'1001416','EMP0008498',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-04-30','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8499,'1002603','EMP0008499',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-01','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8500,'1003790','EMP0008500',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-02','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8501,'1004977','EMP0008501',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-03','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8502,'1006164','EMP0008502',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-04','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8503,'1007351','EMP0008503',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-05','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8504,'1008538','EMP0008504',NULL,NULL,'DEEPAK','RAM KRISHNA','JHA','1984-05-06','Male','9876541556',NULL,'abc@gmail.com','Dewas',1,20,486,'Mumbai',0,'Vikas Nagar Dewas','986082002792','anxp3705h',NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8505,'1000030','EMP0008505',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-07','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8506,'1001217','EMP0008506',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-08','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8507,'1002404','EMP0008507',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-09','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8508,'1003591','EMP0008508',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-10','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:50:59','2017-05-26 21:50:59',NULL,NULL,NULL,NULL),(8509,'1004778','EMP0008509',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-11','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8510,'1005965','EMP0008510',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-12','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8511,'1007152','EMP0008511',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-13','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8512,'1008339','EMP0008512',NULL,NULL,'NARESH','TEJ SINGH','YADAV','1984-05-14','Male','9876541276',NULL,'abc@gmail.com','Vill & Post - Ajuha',1,20,486,'Mumbai',0,'Bawadiya Dewas','465103046642',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8513,'1000149','EMP0008513',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-15','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8514,'1001336','EMP0008514',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-16','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8515,'1002523','EMP0008515',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-17','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8516,'1003710','EMP0008516',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-18','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8517,'1004897','EMP0008517',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-19','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8518,'1006084','EMP0008518',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-20','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8519,'1007271','EMP0008519',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-21','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8520,'1008458','EMP0008520',NULL,NULL,'GANESH','LT.BHABHUTE','CHOUDHARY','1984-05-22','Male','9876541470',NULL,'abc@gmail.com','117 Ews-Dhacha Bhavan Dewas',1,20,486,'Mumbai',455001,'117 Ews-Dhacha Bhavan Dewas','915923314731',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8521,'1000097','EMP0008521',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-05-23','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8522,'1000510','EMP0008522',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-05-24','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8523,'1001284','EMP0008523',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-05-25','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8524,'1001697','EMP0008524',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-05-26','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8525,'1002471','EMP0008525',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-05-27','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8526,'1002884','EMP0008526',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-05-28','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8527,'1003658','EMP0008527',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-05-29','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8528,'1004071','EMP0008528',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-05-30','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8529,'1004845','EMP0008529',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-05-31','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8530,'1005258','EMP0008530',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-06-01','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8531,'1006032','EMP0008531',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-06-02','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8532,'1006445','EMP0008532',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-06-03','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8533,'1007219','EMP0008533',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-06-04','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8534,'1007632','EMP0008534',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-06-05','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8535,'1008406','EMP0008535',NULL,NULL,'JEEVAN',NULL,'KOSHAL','1984-06-06','Male','9876541417',NULL,'abc@gmail.com','S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS',1,20,486,'Mumbai',455001,'S/O SHIVNARAYAN KOSHAL, GRAM PEEPRI DEWAS','517008755662',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8536,'1008819','EMP0008536',NULL,NULL,'YOGESH','KUMAR','REVADIYA','1984-06-07','Male','9876542347',NULL,'abc@gmail.com','231 Bijasan Colony Hamukhedi Dewas Road Ujjain',1,20,486,'Mumbai',0,'231 Bijasan Colony Hamukhedi Dewas Road Ujjain  ','931981940788','BIZPR6846K',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8537,'1000464','EMP0008537',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-08','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8538,'1001651','EMP0008538',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-09','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8539,'1002838','EMP0008539',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-10','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8540,'1004025','EMP0008540',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-11','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8541,'1005212','EMP0008541',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-12','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8542,'1006399','EMP0008542',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-13','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8543,'1007586','EMP0008543',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-14','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8544,'1008773','EMP0008544',NULL,NULL,'PINTU','KRISHNA ','KUMAR','1984-06-15','Male','9876542224',NULL,'abc@gmail.com','Vill Atalkha Post Mangwar ',1,20,486,'Mumbai',0,'     ','0',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8545,'1000478','EMP0008545',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-16','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8546,'1001665','EMP0008546',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-17','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8547,'1002852','EMP0008547',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-18','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8548,'1004039','EMP0008548',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-19','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8549,'1005226','EMP0008549',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-20','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8550,'1006413','EMP0008550',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-21','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8551,'1007600','EMP0008551',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-22','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8552,'1008787','EMP0008552',NULL,NULL,'RAMESH','GOKUL SINGH','MARU','1984-06-23','Male','9876542244',NULL,'abc@gmail.com','Vill-Sadgaon  Gopipur   ',1,20,486,'Mumbai',0,'58,Birakhedi Dewas','510572807369','AXUPC1735A',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8553,'1000497','EMP0008553',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-24','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8554,'1001684','EMP0008554',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-25','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8555,'1002871','EMP0008555',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-26','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8556,'1004058','EMP0008556',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-27','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8557,'1005245','EMP0008557',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-28','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8558,'1006432','EMP0008558',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-29','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8559,'1007619','EMP0008559',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-06-30','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8560,'1008806','EMP0008560',NULL,NULL,'NAND ','SHIVMANGAL','KUMAR','1984-07-01','Male','9876542274',NULL,'abc@gmail.com','Kasila Siwan Bihar   ',1,20,486,'Mumbai',0,'E.W.S VIKAS NAGER DEWAS M.P','783997121929','AMSPY5660J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,20,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8561,'1000084','EMP0008561',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-02','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8562,'1000086','EMP0008562',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-03','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8563,'1001271','EMP0008563',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-04','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8564,'1001273','EMP0008564',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-05','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8565,'1002458','EMP0008565',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-06','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8566,'1002460','EMP0008566',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-07','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8567,'1003645','EMP0008567',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-08','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8568,'1003647','EMP0008568',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-09','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8569,'1004832','EMP0008569',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-10','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8570,'1004834','EMP0008570',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-11','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:00','2017-05-26 21:51:00',NULL,NULL,NULL,NULL),(8571,'1006019','EMP0008571',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-12','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8572,'1006021','EMP0008572',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-13','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8573,'1007206','EMP0008573',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-14','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8574,'1007208','EMP0008574',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-15','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8575,'1008393','EMP0008575',NULL,NULL,'ANIL','RAMDEV','BAURASI','1984-07-16','Male','9876541402',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS ',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS ','0',NULL,NULL,'UnMarried',NULL,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8576,'1008395','EMP0008576',NULL,NULL,'ANIL ','RAMDEV','BAIRASI','1984-07-17','Male','9876541404',NULL,'abc@gmail.com','SARVIDAI NAGAR DEWAS M.P',1,20,486,'Mumbai',455001,'SARVIDAI NAGAR DEWAS M.P','976977929499',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8577,'1001160','EMP0008577',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-18','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8578,'1002347','EMP0008578',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-19','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8579,'1003534','EMP0008579',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-20','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8580,'1004721','EMP0008580',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-21','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8581,'1005908','EMP0008581',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-22','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8582,'1007095','EMP0008582',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-23','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8583,'1008282','EMP0008583',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-24','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8584,'1009469','EMP0008584',NULL,NULL,'APURVA','BHAICHANDBHAI','PATEL','1984-07-25','Male','9876542297',NULL,'abc@gmail.com','C-11, SUMANGAL APARTMENT, NR VARACHHA POLICE STATION, VARACHHA ROAD',1,NULL,1033,'Surat',395006,NULL,'4770','DCAPP2337E','GJ05-20140024617',NULL,3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,48,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8585,'1001106','EMP0008585',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-26','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8586,'1002293','EMP0008586',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-27','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8587,'1003480','EMP0008587',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-28','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8588,'1004667','EMP0008588',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-29','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8589,'1005854','EMP0008589',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-30','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8590,'1007041','EMP0008590',NULL,NULL,'OMPAL','SINGH','RANA','1984-07-31','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8591,'1008228','EMP0008591',NULL,NULL,'OMPAL','SINGH','RANA','1984-08-01','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8592,'1009415','EMP0008592',NULL,NULL,'OMPAL','SINGH','RANA','1984-08-02','Male','9876541873',NULL,'abc@gmail.com','81 Mangal Nagar Sukhaliya Indore',1,20,504,'Pune',0,'81 Mangal Nagar Sukhaliya Indore','563878001691','AZNPS2276A','MP09D-2009-0727378','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8593,'1000169','EMP0008593',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-03','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8594,'1001356','EMP0008594',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-04','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8595,'1002543','EMP0008595',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-05','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8596,'1003730','EMP0008596',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-06','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8597,'1004917','EMP0008597',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-07','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8598,'1006104','EMP0008598',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-08','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8599,'1007291','EMP0008599',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-09','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8600,'1008478','EMP0008600',NULL,NULL,'AKHILESH','SUBEDAR SINGH','CHOUDHARY','1984-08-10','Male','9876541490',NULL,'abc@gmail.com','Niwadi Kurd Po-Aheripur Itawa  ',1,20,486,'Mumbai',0,'Bhandari Hospital Dewas','971389252194','BFSPC6056G',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8601,'1001093','EMP0008601',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-11','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8602,'1002280','EMP0008602',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-12','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8603,'1003467','EMP0008603',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-13','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8604,'1004654','EMP0008604',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-14','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8605,'1005841','EMP0008605',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-15','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8606,'1007028','EMP0008606',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-16','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8607,'1008215','EMP0008607',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-17','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8608,'1009402','EMP0008608',NULL,NULL,'GYANCHAND','SURENDRA ','SHAH','1984-08-18','Male','9876541775',NULL,'abc@gmail.com','PATEL COLONY BAWDIYA DEWAS',1,20,486,'Mumbai',0,'PATEL COLONY BAWDIYA DEWAS','301493367061',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8609,'1001159','EMP0008609',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-19','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8610,'1002346','EMP0008610',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-20','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8611,'1003533','EMP0008611',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-21','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8612,'1004720','EMP0008612',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-22','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8613,'1005907','EMP0008613',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-23','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8614,'1007094','EMP0008614',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-24','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8615,'1008281','EMP0008615',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-25','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8616,'1009468','EMP0008616',NULL,NULL,'SMRUTI','AJAYKUMAR','PATEL','1984-08-26','Female','9876542296',NULL,'abc@gmail.com','5,ANAND VATIKA,UNDER SARDAR BRIDGE, ADAJAN ROAD',1,NULL,1033,'Surat',395009,NULL,'0',NULL,'GJ05-20100449735','Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8617,'1000395','EMP0008617',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-08-27','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8618,'1001582','EMP0008618',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-08-28','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8619,'1002769','EMP0008619',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-08-29','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8620,'1003956','EMP0008620',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-08-30','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8621,'1005143','EMP0008621',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-08-31','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8622,'1006330','EMP0008622',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-09-01','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8623,'1007517','EMP0008623',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-09-02','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8624,'1008704','EMP0008624',NULL,NULL,'PRABHAT','SINGH',NULL,'1984-09-03','Male','9876541781',NULL,'abc@gmail.com','141,Hariom Nagar Dewas',1,20,486,'Mumbai',455001,'141,Hariom Nagar Dewas','302345434473','FHSPS1167Q',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8625,'1001124','EMP0008625',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-04','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8626,'1002311','EMP0008626',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-05','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8627,'1003498','EMP0008627',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-06','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8628,'1004685','EMP0008628',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-07','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8629,'1005872','EMP0008629',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-08','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8630,'1007059','EMP0008630',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-09','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8631,'1008246','EMP0008631',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-10','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8632,'1009433','EMP0008632',NULL,NULL,'ABDUL','ABDUR REHMAN','KAREEM','1984-09-11','Male','9876542343',NULL,'abc@gmail.com','5/2 Nagari Mohla Ujjain',1,20,593,'Ujjain',0,'5/2 Nagari Mohla Ujjain','0',NULL,NULL,'Married',NULL,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8633,'1000152','EMP0008633',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-12','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8634,'1001339','EMP0008634',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-13','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:01','2017-05-26 21:51:01',NULL,NULL,NULL,NULL),(8635,'1002526','EMP0008635',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-14','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8636,'1003713','EMP0008636',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-15','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8637,'1004900','EMP0008637',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-16','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8638,'1006087','EMP0008638',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-17','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8639,'1007274','EMP0008639',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-18','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8640,'1008461','EMP0008640',NULL,NULL,'NIRMAL','SINGH','CHANDRAWAT','1984-09-19','Male','9876541473',NULL,'abc@gmail.com','23 Ujjain Road Near Railway Crossing Dewas',1,20,486,'Mumbai',455001,'23 Ujjain Road Near Railway Crossing Dewas','783925667590','AFAPC8915M',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,18,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8641,'1000287','EMP0008641',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-20','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8642,'1001474','EMP0008642',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-21','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8643,'1002661','EMP0008643',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-22','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8644,'1003848','EMP0008644',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-23','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8645,'1005035','EMP0008645',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-24','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8646,'1006222','EMP0008646',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-25','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8647,'1007409','EMP0008647',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-26','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8648,'1008596','EMP0008648',NULL,NULL,'ASHUTOSH','ASHOK','SHARMA','1984-09-27','Male','9876541636',NULL,'abc@gmail.com','220 B-Bajrang Nagar Dewas',1,20,486,'Mumbai',455001,'220 B-Bajrang Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8649,'1001031','EMP0008649',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-09-28','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8650,'1002218','EMP0008650',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-09-29','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8651,'1003405','EMP0008651',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-09-30','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8652,'1004592','EMP0008652',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-01','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8653,'1005779','EMP0008653',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-02','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8654,'1006966','EMP0008654',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-03','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8655,'1008153','EMP0008655',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-04','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8656,'1009340','EMP0008656',NULL,NULL,'ANIL','RMAPRATAP','VERMA','1984-10-05','Male','9876541468',NULL,'abc@gmail.com','54  Karmchari Colony',1,20,486,'Mumbai',455001,'54  Karmchari Colony','323627207052','AXXPV2053Q',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8657,'1000398','EMP0008657',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-06','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8658,'1001585','EMP0008658',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-07','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8659,'1002772','EMP0008659',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-08','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8660,'1003959','EMP0008660',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-09','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8661,'1005146','EMP0008661',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-10','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8662,'1006333','EMP0008662',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-11','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8663,'1007520','EMP0008663',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-12','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8664,'1008707','EMP0008664',NULL,NULL,'GOURAV',NULL,'SHARMA','1984-10-13','Male','9876541784',NULL,'abc@gmail.com','D4/110,Awas Nagar Dewas',1,20,486,'Mumbai',455001,'D4/110,Awas Nagar Dewas','251932587150','EWHPS6580Q',NULL,'UnMarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8665,'1000426','EMP0008665',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-14','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8666,'1001613','EMP0008666',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-15','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8667,'1002800','EMP0008667',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-16','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8668,'1003987','EMP0008668',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-17','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8669,'1005174','EMP0008669',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-18','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8670,'1006361','EMP0008670',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-19','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8671,'1007548','EMP0008671',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-20','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8672,'1008735','EMP0008672',NULL,NULL,'SOURABH','RAJENDRA KUMAR','PARASHAR','1984-10-21','Male','9876541878',NULL,'abc@gmail.com','C-80 ,Shivadham Colony ,Indore',1,20,486,'Mumbai',0,'C-80 Shivasham Colony Indore','705807578687','ATUPP8612N',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8673,'1001018','EMP0008673',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-22','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8674,'1002205','EMP0008674',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-23','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8675,'1003392','EMP0008675',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-24','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8676,'1004579','EMP0008676',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-25','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8677,'1005766','EMP0008677',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-26','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8678,'1006953','EMP0008678',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-27','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8679,'1008140','EMP0008679',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-28','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8680,'1009327','EMP0008680',NULL,NULL,'ABHISHEK','GHANSYAM','LODHI','1984-10-29','Male','9876541355',NULL,'abc@gmail.com','181,Alkapuri Dewas ',1,20,486,'Mumbai',455001,'181,Alkapuri Dewas ','722908759362','AGMPL1878M',NULL,'UnMarried',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8681,'1000382','EMP0008681',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-10-30','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8682,'1001569','EMP0008682',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-10-31','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8683,'1002756','EMP0008683',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-01','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8684,'1003943','EMP0008684',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-02','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8685,'1005130','EMP0008685',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-03','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8686,'1006317','EMP0008686',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-04','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8687,'1007504','EMP0008687',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-05','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8688,'1008691','EMP0008688',NULL,NULL,'KAILASH','LAL CHANDRA','GOUD','1984-11-06','Male','9876541759',NULL,'abc@gmail.com','Pushpkunj Colony Itawa Dewas',1,20,486,'Mumbai',455001,'Pushpkunj Colony Itawa Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8689,'1000451','EMP0008689',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-07','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8690,'1001638','EMP0008690',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-08','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8691,'1002825','EMP0008691',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-09','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8692,'1004012','EMP0008692',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-10','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8693,'1005199','EMP0008693',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-11','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8694,'1006386','EMP0008694',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-12','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8695,'1007573','EMP0008695',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-13','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8696,'1008760','EMP0008696',NULL,NULL,'SAMBODH','KUMAR','DAS','1984-11-14','Male','9876542013',NULL,'abc@gmail.com','27/818 Ddaflats Kalkaji New Delhi',1,20,486,'Mumbai',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8697,'1000237','EMP0008697',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-15','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8698,'1001424','EMP0008698',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-16','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:02','2017-05-26 21:51:02',NULL,NULL,NULL,NULL),(8699,'1002611','EMP0008699',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-17','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8700,'1003798','EMP0008700',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-18','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8701,'1004985','EMP0008701',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-19','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8702,'1006172','EMP0008702',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-20','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8703,'1007359','EMP0008703',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-21','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8704,'1008546','EMP0008704',NULL,NULL,'GENDALAL','MANGILAL','PRAJAPATI','1984-11-22','Male','9876541565',NULL,'abc@gmail.com','68 B-Ram Chandra Nagar Dewas',1,20,486,'Mumbai',0,'3 MIG NEW HOUSING BOARD DHACHA BHAWAN DEWAS','946419676150','BFDPP2215R',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8705,'1000458','EMP0008705',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-23','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8706,'1001645','EMP0008706',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-24','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8707,'1002832','EMP0008707',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-25','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8708,'1004019','EMP0008708',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-26','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8709,'1005206','EMP0008709',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-27','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8710,'1006393','EMP0008710',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-28','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8711,'1007580','EMP0008711',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-29','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8712,'1008767','EMP0008712',NULL,NULL,'SURESH','CHANDRA','KOT','1984-11-30','Male','9876542215',NULL,'abc@gmail.com','Village Tajkheda  Ratlam ',1,20,486,'Mumbai',0,'B 2/13 Mahakal Vanijya Kendra Nanakheda  Ujjain ','378333627539',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8713,'1000567','EMP0008713',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-01','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8714,'1001754','EMP0008714',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-02','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8715,'1002941','EMP0008715',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-03','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8716,'1004128','EMP0008716',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-04','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8717,'1005315','EMP0008717',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-05','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8718,'1006502','EMP0008718',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-06','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8719,'1007689','EMP0008719',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-07','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8720,'1008876','EMP0008720',NULL,NULL,'Jagdish ',NULL,'Rathore','1984-12-08','Male','9876542051',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8721,'1000556','EMP0008721',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-09','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8722,'1001743','EMP0008722',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-10','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8723,'1002930','EMP0008723',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-11','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8724,'1004117','EMP0008724',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-12','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8725,'1005304','EMP0008725',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-13','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8726,'1006491','EMP0008726',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-14','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8727,'1007678','EMP0008727',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-15','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8728,'1008865','EMP0008728',NULL,NULL,'Rajendra  ','Singh','Thakur','1984-12-16','Male','9876542040',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8729,'1000621','EMP0008729',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-17','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8730,'1001808','EMP0008730',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-18','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8731,'1002995','EMP0008731',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-19','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8732,'1004182','EMP0008732',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-20','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8733,'1005369','EMP0008733',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-21','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8734,'1006556','EMP0008734',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-22','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8735,'1007743','EMP0008735',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-23','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8736,'1008930','EMP0008736',NULL,NULL,'LOVESH  ',NULL,'Oswal','1984-12-24','Male','9876542105',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8737,'1000551','EMP0008737',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-25','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8738,'1001738','EMP0008738',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-26','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8739,'1002925','EMP0008739',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-27','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8740,'1004112','EMP0008740',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-28','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8741,'1005299','EMP0008741',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-29','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8742,'1006486','EMP0008742',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-30','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8743,'1007673','EMP0008743',NULL,NULL,'Raman ',NULL,'Dashottar','1984-12-31','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8744,'1008860','EMP0008744',NULL,NULL,'Raman ',NULL,'Dashottar','1985-01-01','Male','9876542035',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8745,'1000577','EMP0008745',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-02','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8746,'1001764','EMP0008746',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-03','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8747,'1002951','EMP0008747',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-04','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8748,'1004138','EMP0008748',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-05','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8749,'1005325','EMP0008749',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-06','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8750,'1006512','EMP0008750',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-07','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8751,'1007699','EMP0008751',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-08','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8752,'1008886','EMP0008752',NULL,NULL,'Sakti ','Singh ','Sironja','1985-01-09','Male','9876542061',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8753,'1000481','EMP0008753',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-10','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8754,'1001668','EMP0008754',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-11','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8755,'1002855','EMP0008755',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-12','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8756,'1004042','EMP0008756',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-13','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8757,'1005229','EMP0008757',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-14','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8758,'1006416','EMP0008758',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-15','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8759,'1007603','EMP0008759',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-16','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8760,'1008790','EMP0008760',NULL,NULL,'RAJESH','NIRMAL KUMAR','JAIN','1985-01-17','Male','9876542248',NULL,'abc@gmail.com','Adishcharya Kachhipura Shajapur',1,20,486,'Mumbai',0,'15 B ANIL SHREE NAGAR DEWAS','290634254597','AGFPJ2845K',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8761,'1000063','EMP0008761',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-18','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:03','2017-05-26 21:51:03',NULL,NULL,NULL,NULL),(8762,'1001250','EMP0008762',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-19','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8763,'1002437','EMP0008763',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-20','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8764,'1003624','EMP0008764',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-21','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8765,'1004811','EMP0008765',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-22','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8766,'1005998','EMP0008766',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-23','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8767,'1007185','EMP0008767',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-24','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8768,'1008372','EMP0008768',NULL,NULL,'KRISHNAKANT','PRATAP','SONI','1985-01-25','Male','9876541376',NULL,'abc@gmail.com','JAY SINGH NAGAR BIRAKHEDI DEWAS',1,20,486,'Mumbai',455001,'JAY SINGH NAGAR BIRAKHEDI DEWAS','0',NULL,'MP41N20130141108','Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8769,'1000101','EMP0008769',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-26','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8770,'1001288','EMP0008770',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-27','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8771,'1002475','EMP0008771',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-28','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8772,'1003662','EMP0008772',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-29','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8773,'1004849','EMP0008773',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-30','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8774,'1006036','EMP0008774',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-01-31','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8775,'1007223','EMP0008775',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-02-01','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8776,'1008410','EMP0008776',NULL,NULL,'ROHIT',NULL,'MALVIYA','1985-02-02','Male','9876541421',NULL,'abc@gmail.com','190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS',1,20,486,'Mumbai',455001,'190 WARD NO 10 SHIV MANDIR KE PASS RAJARAM NAGAR DEWAS','597311937609',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8777,'1001148','EMP0008777',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-03','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8778,'1002335','EMP0008778',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-04','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8779,'1003522','EMP0008779',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-05','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8780,'1004709','EMP0008780',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-06','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8781,'1005896','EMP0008781',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-07','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8782,'1007083','EMP0008782',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-08','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8783,'1008270','EMP0008783',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-09','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8784,'1009457','EMP0008784',NULL,NULL,'PRAKASHCHANDRA','DHARNIDHAR','SWAIN','1985-02-10','Male','9876542282',NULL,'abc@gmail.com','2134,GANESHNAGAR,GUJARAT HOUSING BOARD, NR.SWAMINARAYAN TEMPLE,SACHIN',1,NULL,1033,'Surat',394230,NULL,'0',NULL,'GJ05-20000296689','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,46,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8785,'1000090','EMP0008785',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-11','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8786,'1001277','EMP0008786',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-12','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8787,'1002464','EMP0008787',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-13','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8788,'1003651','EMP0008788',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-14','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8789,'1004838','EMP0008789',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-15','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8790,'1006025','EMP0008790',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-16','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8791,'1007212','EMP0008791',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-17','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8792,'1008399','EMP0008792',NULL,NULL,'SANDEEP','RAMESH CHANDRA','BILLORE','1985-02-18','Male','9876541410',NULL,'abc@gmail.com','MISHRILAL NAGAR DEWAS',1,20,486,'Mumbai',455001,'MISHRILAL NAGAR DEWAS','0',NULL,NULL,'Married',1,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8793,'1000061','EMP0008793',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-19','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8794,'1001248','EMP0008794',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-20','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8795,'1002435','EMP0008795',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-21','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8796,'1003622','EMP0008796',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-22','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8797,'1004809','EMP0008797',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-23','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8798,'1005996','EMP0008798',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-24','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8799,'1007183','EMP0008799',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-25','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8800,'1008370','EMP0008800',NULL,NULL,'JITENDRA','SATYANARAYAN','PANCHAL','1985-02-26','Male','9876541374',NULL,'abc@gmail.com','83/11,SAJJAN NAGAR HATPIPLIYA',1,20,486,'Mumbai',0,'113/A,CHANAKYA PURI DEWAS','904612986604','CRCPP3691R',NULL,'Married',1,3,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8801,'1001080','EMP0008801',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-02-27','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8802,'1002267','EMP0008802',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-02-28','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8803,'1003454','EMP0008803',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-01','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8804,'1004641','EMP0008804',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-02','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8805,'1005828','EMP0008805',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-03','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8806,'1007015','EMP0008806',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-04','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8807,'1008202','EMP0008807',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-05','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8808,'1009389','EMP0008808',NULL,NULL,'RAHUL','BHOLASHANKAR','YADAV','1985-03-06','Male','9876541718',NULL,'abc@gmail.com','187 Lig-Second Mukharjee Nagar Dewas',1,20,486,'Mumbai',455001,'187 Lig-Second Mukharjee Nagar Dewas','413482202524','ALSPY2682F','MP41N20100103809','UnMarried',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8809,'1000103','EMP0008809',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-07','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8810,'1001290','EMP0008810',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-08','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8811,'1002477','EMP0008811',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-09','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8812,'1003664','EMP0008812',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-10','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8813,'1004851','EMP0008813',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-11','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8814,'1006038','EMP0008814',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-12','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8815,'1007225','EMP0008815',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-13','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8816,'1008412','EMP0008816',NULL,NULL,'JAMAT','KALLU SHAH','ALI','1985-03-14','Male','9876541423',NULL,'abc@gmail.com','Vill-Jetpura Dist- Dewa',1,20,486,'Mumbai',455001,'Vill-Jetpura Dist- Dewas','967834889044','fwmps5555r',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8817,'1001038','EMP0008817',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-15','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8818,'1002225','EMP0008818',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-16','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8819,'1003412','EMP0008819',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-17','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8820,'1004599','EMP0008820',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-18','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8821,'1005786','EMP0008821',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-19','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8822,'1006973','EMP0008822',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-20','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8823,'1008160','EMP0008823',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-21','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8824,'1009347','EMP0008824',NULL,NULL,'KRISHNA','KUMAR','RAJAK','1985-03-22','Male','9876541564',NULL,'abc@gmail.com','New Ram Nagar Near Gurudwara Adhartal',1,20,486,'Mumbai',455001,'New Ram Nagar Near Gurudwara Adhartal','700251717688',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:04','2017-05-26 21:51:04',NULL,NULL,NULL,NULL),(8825,'1000210','EMP0008825',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-23','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8826,'1001397','EMP0008826',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-24','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8827,'1002584','EMP0008827',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-25','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8828,'1003771','EMP0008828',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-26','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8829,'1004958','EMP0008829',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-27','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8830,'1006145','EMP0008830',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-28','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8831,'1007332','EMP0008831',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-29','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8832,'1008519','EMP0008832',NULL,NULL,'JUZAR','SINGH','PARMAR','1985-03-30','Male','9876541534',NULL,'abc@gmail.com','32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas ',1,20,486,'Mumbai',455001,'32 Idu Bhai Colony Dhacha Bhawan Ward 16  Dewas','416914065385','FXYPS9944B',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8833,'1001040','EMP0008833',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-03-31','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8834,'1002227','EMP0008834',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-01','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8835,'1003414','EMP0008835',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-02','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8836,'1004601','EMP0008836',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-03','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8837,'1005788','EMP0008837',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-04','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8838,'1006975','EMP0008838',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-05','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8839,'1008162','EMP0008839',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-06','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8840,'1009349','EMP0008840',NULL,NULL,'PRAVEEN','SINGH','JAT','1985-04-07','Male','9876541574',NULL,'abc@gmail.com','D Village And Jalandar The  Rahatgar',1,20,486,'Mumbai',455001,'D Village And Jalandar The  Rahatgar','964784396885',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8841,'1001045','EMP0008841',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-08','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8842,'1002232','EMP0008842',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-09','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8843,'1003419','EMP0008843',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-10','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8844,'1004606','EMP0008844',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-11','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8845,'1005793','EMP0008845',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-12','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8846,'1006980','EMP0008846',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-13','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8847,'1008167','EMP0008847',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-14','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8848,'1009354','EMP0008848',NULL,NULL,'VISHNU','FULCHAND','MODI','1985-04-15','Male','9876541588',NULL,'abc@gmail.com','Balgarh   Hanuman Road',1,20,486,'Mumbai',455001,'Balgarh   Hanuman Road','462350305325',NULL,NULL,'Married',3,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8849,'1000424','EMP0008849',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-16','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8850,'1001611','EMP0008850',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-17','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8851,'1002798','EMP0008851',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-18','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8852,'1003985','EMP0008852',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-19','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8853,'1005172','EMP0008853',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-20','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8854,'1006359','EMP0008854',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-21','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8855,'1007546','EMP0008855',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-22','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8856,'1008733','EMP0008856',NULL,NULL,'RUPESH','MUKESH','BARCHE','1985-04-23','Male','9876541876',NULL,'abc@gmail.com','254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore',1,20,486,'Mumbai',0,'254  Sec-A  Shivdham Colony  Vill Limbodi  Khandwa Road Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8857,'1000509','EMP0008857',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-24','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8858,'1001696','EMP0008858',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-25','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8859,'1002883','EMP0008859',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-26','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8860,'1004070','EMP0008860',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-27','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8861,'1005257','EMP0008861',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-28','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8862,'1006444','EMP0008862',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-29','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8863,'1007631','EMP0008863',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-04-30','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8864,'1008818','EMP0008864',NULL,NULL,'RUPESH','CHHOGALAL','SOLANKI','1985-05-01','Male','9876542345',NULL,'abc@gmail.com','136 kaji pura anpat marg ujjain',1,20,486,'Mumbai',456010,'136 kaji pura anpat marg ujjain','989932713735','CFHPS5977L','N/A','Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,26,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8865,'1001098','EMP0008865',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-02','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8866,'1002285','EMP0008866',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-03','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8867,'1003472','EMP0008867',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-04','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8868,'1004659','EMP0008868',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-05','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8869,'1005846','EMP0008869',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-06','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8870,'1007033','EMP0008870',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-07','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8871,'1008220','EMP0008871',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-08','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8872,'1009407','EMP0008872',NULL,NULL,'PARAG',NULL,'BAJAJ','1985-05-09','Male','9876541848',NULL,'abc@gmail.com','6/1 TILAK NAGAR, MAIN ROAD ',1,20,504,'Pune',452018,'AWAS NAGAR','866808626422',NULL,NULL,'UnMarried',1,1,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8873,'1000130','EMP0008873',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-10','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8874,'1001317','EMP0008874',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-11','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8875,'1002504','EMP0008875',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-12','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8876,'1003691','EMP0008876',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-13','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8877,'1004878','EMP0008877',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-14','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8878,'1006065','EMP0008878',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-15','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8879,'1007252','EMP0008879',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-16','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8880,'1008439','EMP0008880',NULL,NULL,'CHAITANYA','MADHUSUDAN ','JOSHI','1985-05-17','Male','9876541450',NULL,'abc@gmail.com','131 Shalini Road Dewas ',1,20,486,'Mumbai',455001,'131 Shalini Road Dewas','856718943643','altpj9308a',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8881,'1000483','EMP0008881',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-18','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8882,'1001670','EMP0008882',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-19','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8883,'1002857','EMP0008883',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-20','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8884,'1004044','EMP0008884',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-21','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8885,'1005231','EMP0008885',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-22','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8886,'1006418','EMP0008886',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-23','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8887,'1007605','EMP0008887',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-24','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:05','2017-05-26 21:51:05',NULL,NULL,NULL,NULL),(8888,'1008792','EMP0008888',NULL,NULL,'SHEKHAR','DARIYAV SINGH','DANGI','1985-05-25','Male','9876542252',NULL,'abc@gmail.com','48 Jhokar Th-Shajapur',1,20,486,'Mumbai',0,'Bawadiya Sajjan Singh Colony Dewas ','835631519579','CDSPD8437P',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,21,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8889,'1000012','EMP0008889',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-26','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8890,'1001199','EMP0008890',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-27','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8891,'1002386','EMP0008891',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-28','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8892,'1003573','EMP0008892',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-29','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8893,'1004760','EMP0008893',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-30','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8894,'1005947','EMP0008894',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-05-31','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8895,'1007134','EMP0008895',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-06-01','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8896,'1008321','EMP0008896',NULL,NULL,'SATYAM ','VE RAW','GHONGDE','1985-06-02','Male','9876541243',NULL,'abc@gmail.com','E.W.S MUKHRJI NAGAR DEWAS',1,20,486,'Mumbai',455001,'E.W.S MUKHRJI NAGAR DEWAS','934396150787',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8897,'1000200','EMP0008897',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-03','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8898,'1001387','EMP0008898',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-04','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8899,'1002574','EMP0008899',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-05','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8900,'1003761','EMP0008900',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-06','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8901,'1004948','EMP0008901',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-07','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8902,'1006135','EMP0008902',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-08','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8903,'1007322','EMP0008903',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-09','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8904,'1008509','EMP0008904',NULL,NULL,'ANANT','SINGH','THAKUR','1985-06-10','Male','9876541524',NULL,'abc@gmail.com','31 Lig Nagar Nigam Colony Dewas ',1,20,486,'Mumbai',455001,'31 Lig Nagar Nigam Colony Dewas ','0','AHXPT9292P','MP13/003643/05','Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8905,'1001137','EMP0008905',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-11','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8906,'1002324','EMP0008906',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-12','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8907,'1003511','EMP0008907',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-13','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8908,'1004698','EMP0008908',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-14','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8909,'1005885','EMP0008909',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-15','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8910,'1007072','EMP0008910',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-16','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8911,'1008259','EMP0008911',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-17','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8912,'1009446','EMP0008912',NULL,NULL,'VISHNU','CHANDRABABU',NULL,'1985-06-18','Male','9876541795',NULL,'abc@gmail.com','VISHNUPRIYA,WARD VII,PERUMBAVOOR,',1,NULL,504,'Pune',683542,NULL,'0','ARTPC2410J','40/2976/2007','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8913,'1000197','EMP0008913',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-19','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8914,'1001384','EMP0008914',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-20','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8915,'1002571','EMP0008915',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-21','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8916,'1003758','EMP0008916',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-22','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8917,'1004945','EMP0008917',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-23','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8918,'1006132','EMP0008918',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-24','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8919,'1007319','EMP0008919',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-25','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8920,'1008506','EMP0008920',NULL,NULL,'SUNIL','Lt.Motilal Ji','BODANE','1985-06-26','Male','9876541521',NULL,'abc@gmail.com','366 Alkapuri Dewas',1,20,486,'Mumbai',455001,'366 Alkapuri Dewas','990784696316',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8921,'1000008','EMP0008921',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-06-27','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8922,'1001195','EMP0008922',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-06-28','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8923,'1002382','EMP0008923',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-06-29','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8924,'1003569','EMP0008924',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-06-30','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8925,'1004756','EMP0008925',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-07-01','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8926,'1005943','EMP0008926',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-07-02','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8927,'1007130','EMP0008927',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-07-03','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8928,'1008317','EMP0008928',NULL,NULL,'NEERAJ','BRAJKISHOR','VERMA','1985-07-04','Male','9876541239',NULL,'abc@gmail.com','302,YAMUNA NAGAR KELA MANDIR ROAD DEWAS M.P.',1,20,486,'Mumbai',0,'MQ -44 RAJENDRA NAGAR PATHAKHERA BETUL M.P','210966794045','ANAPV9635M','MP48N-20120075973','UnMarried',3,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8929,'1000555','EMP0008929',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-05','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8930,'1001742','EMP0008930',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-06','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8931,'1002929','EMP0008931',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-07','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8932,'1004116','EMP0008932',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-08','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8933,'1005303','EMP0008933',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-09','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8934,'1006490','EMP0008934',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-10','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8935,'1007677','EMP0008935',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-11','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8936,'1008864','EMP0008936',NULL,NULL,'Bhupendra ','Singh ','Yadav','1985-07-12','Male','9876542039',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,7,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8937,'1000109','EMP0008937',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-13','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8938,'1001296','EMP0008938',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-14','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8939,'1002483','EMP0008939',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-15','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8940,'1003670','EMP0008940',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-16','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8941,'1004857','EMP0008941',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-17','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8942,'1006044','EMP0008942',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-18','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8943,'1007231','EMP0008943',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-19','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8944,'1008418','EMP0008944',NULL,NULL,'DHANNALAL','MISHRILAL','LOWANSHI','1985-07-20','Male','9876541429',NULL,'abc@gmail.com','389/B,Mishrilalnagar Dewas ',1,20,486,'Mumbai',455001,'389/B,Mishrilalnagar Dewas ','339878652011','AGCPL2538E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8945,'1000436','EMP0008945',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-21','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8946,'1001623','EMP0008946',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-22','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8947,'1002810','EMP0008947',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-23','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8948,'1003997','EMP0008948',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-24','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8949,'1005184','EMP0008949',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-25','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:06','2017-05-26 21:51:06',NULL,NULL,NULL,NULL),(8950,'1006371','EMP0008950',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-26','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8951,'1007558','EMP0008951',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-27','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8952,'1008745','EMP0008952',NULL,NULL,'DILIP','KOMAL','DHAKSAY','1985-07-28','Male','9876541924',NULL,'abc@gmail.com','52,BEHIND SANT THOMAS HOSTAL GANESH TALAI KHANDWA',1,20,486,'Mumbai',450001,'VIKAS NAGAR DEWAS M.P. ','759178239887','BRUPD6702Q',NULL,'Married',1,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8953,'1000308','EMP0008953',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-07-29','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8954,'1001495','EMP0008954',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-07-30','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8955,'1002682','EMP0008955',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-07-31','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8956,'1003869','EMP0008956',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-01','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8957,'1005056','EMP0008957',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-02','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8958,'1006243','EMP0008958',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-03','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8959,'1007430','EMP0008959',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-04','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8960,'1008617','EMP0008960',NULL,NULL,'JEEVAN','HARJI','CHOUDHARY','1985-08-05','Male','9876541666',NULL,'abc@gmail.com','Vill-Khajuriya Jagir Dist-Dewas  Dewas  455001  Madhya Pradesh',1,20,486,'Mumbai',455001,'Vill-Khajuriya Jagir Dist-Dewas','610632567416','HBAPS9955J',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,22,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8961,'1000430','EMP0008961',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-06','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8962,'1001617','EMP0008962',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-07','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8963,'1002804','EMP0008963',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-08','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8964,'1003991','EMP0008964',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-09','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8965,'1005178','EMP0008965',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-10','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8966,'1006365','EMP0008966',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-11','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8967,'1007552','EMP0008967',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-12','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8968,'1008739','EMP0008968',NULL,NULL,'VIPIN ','RAVISHANKAR','TAMOLI','1985-08-13','Male','9876541883',NULL,'abc@gmail.com','RBI 312A MAIN ROAD NEW YARD ITARSI',1,20,486,'Mumbai',461115,'LAXMI CHALL BALGAR DEWAS','567304615824','AXGPT5260N',NULL,'UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8969,'1000195','EMP0008969',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-14','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8970,'1001382','EMP0008970',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-15','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8971,'1002569','EMP0008971',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-16','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8972,'1003756','EMP0008972',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-17','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8973,'1004943','EMP0008973',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-18','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8974,'1006130','EMP0008974',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-19','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8975,'1007317','EMP0008975',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-20','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8976,'1008504','EMP0008976',NULL,NULL,'MAHENDRA','BALRAM','BARODE','1985-08-21','Male','9876541519',NULL,'abc@gmail.com','53/2 Durga Mandir Sanjay Nagar Dewas',1,20,486,'Mumbai',455001,'53/2 Durga Mandir Sanjay Nagar Dewas','28514715113',NULL,NULL,NULL,NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8977,'1001168','EMP0008977',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-22','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8978,'1002355','EMP0008978',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-23','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8979,'1003542','EMP0008979',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-24','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8980,'1004729','EMP0008980',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-25','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8981,'1005916','EMP0008981',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-26','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8982,'1007103','EMP0008982',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-27','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8983,'1008290','EMP0008983',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-28','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8984,'1009477','EMP0008984',NULL,NULL,'RAHUL ','YUVRAJ','BHIRUD','1985-08-29','Male','9876542306',NULL,'abc@gmail.com','B/4, SANT GYANESHWAR SOC,PALANPUR JAKATNAKA',1,NULL,1033,'Surat',395009,NULL,'3461','BEFPB2076H',NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,47,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8985,'1000056','EMP0008985',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-08-30','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8986,'1001243','EMP0008986',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-08-31','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8987,'1002430','EMP0008987',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-01','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8988,'1003617','EMP0008988',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-02','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8989,'1004804','EMP0008989',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-03','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8990,'1005991','EMP0008990',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-04','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8991,'1007178','EMP0008991',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-05','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8992,'1008365','EMP0008992',NULL,NULL,'DHARMENDRA','RADHESHYAM','PATEL','1985-09-06','Male','9876541366',NULL,'abc@gmail.com','417,MENDHKI CHAKK DEWAS',1,20,486,'Mumbai',0,'417,MENDHKI CHAKK DEWAS','0',NULL,'MP41N-2012-22987','UnMarried',NULL,NULL,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8993,'1000557','EMP0008993',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-07','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8994,'1001744','EMP0008994',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-08','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8995,'1002931','EMP0008995',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-09','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8996,'1004118','EMP0008996',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-10','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8997,'1005305','EMP0008997',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-11','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8998,'1006492','EMP0008998',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-12','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(8999,'1007679','EMP0008999',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-13','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9000,'1008866','EMP0009000',NULL,NULL,'Sanjay ',NULL,'Vaisya','1985-09-14','Male','9876542041',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,15,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9001,'1000201','EMP0009001',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-15','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9002,'1001388','EMP0009002',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-16','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9003,'1002575','EMP0009003',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-17','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9004,'1003762','EMP0009004',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-18','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9005,'1004949','EMP0009005',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-19','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9006,'1006136','EMP0009006',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-20','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9007,'1007323','EMP0009007',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-21','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9008,'1008510','EMP0009008',NULL,NULL,'KAMLESH','BHAURAO','ADLAK','1985-09-22','Male','9876541525',NULL,'abc@gmail.com','188 Lig-Jawahar Nagar  Dewas',1,20,486,'Mumbai',455001,'188 Lig-Jawahar Nagar Dewas','262992245184',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,6,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9009,'1000006','EMP0009009',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-23','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9010,'1001193','EMP0009010',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-24','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9011,'1002380','EMP0009011',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-25','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9012,'1003567','EMP0009012',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-26','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9013,'1004754','EMP0009013',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-27','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:07','2017-05-26 21:51:07',NULL,NULL,NULL,NULL),(9014,'1005941','EMP0009014',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-28','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9015,'1007128','EMP0009015',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-29','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9016,'1008315','EMP0009016',NULL,NULL,'SUMIT',NULL,'PIPLODIYA','1985-09-30','Male','9876541237',NULL,'abc@gmail.com','450/3,YADAV NAND NAGAR INDORE',1,20,486,'Mumbai',0,'450/3,YADAV NAND NAGAR INDORE','57076284022',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9017,'1001142','EMP0009017',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-01','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9018,'1002329','EMP0009018',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-02','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9019,'1003516','EMP0009019',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-03','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9020,'1004703','EMP0009020',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-04','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9021,'1005890','EMP0009021',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-05','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9022,'1007077','EMP0009022',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-06','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9023,'1008264','EMP0009023',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-07','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9024,'1009451','EMP0009024',NULL,NULL,'VATSAL ','BHUPENDRABHAI ','MEHTA','1985-10-08','Male','9876542010',NULL,'abc@gmail.com','2723-K,DEV DARSHAN SOC,SAMROLI,CHIKHLI,',1,NULL,504,'Pune',396521,NULL,'6633','CIVPM3824P',NULL,'Unmarried',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,53,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9025,'1000001','EMP0009025',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-09','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9026,'1001188','EMP0009026',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-10','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9027,'1002375','EMP0009027',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-11','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9028,'1003562','EMP0009028',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-12','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9029,'1004749','EMP0009029',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-13','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9030,'1005936','EMP0009030',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-14','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9031,'1007123','EMP0009031',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-15','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9032,'1008310','EMP0009032',NULL,NULL,'VIKAS ','KUMAR','SINGH','1985-10-16','Male','9876541230',NULL,'abc@gmail.com','162,CTULSI NAGAR INDORE',1,20,486,'Mumbai',0,'162,CTULSI NAGAR INDORE','626305922738','DCEPP0002C',NULL,'UnMarried',3,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9033,'1001030','EMP0009033',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-17','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9034,'1002217','EMP0009034',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-18','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9035,'1003404','EMP0009035',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-19','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9036,'1004591','EMP0009036',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-20','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9037,'1005778','EMP0009037',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-21','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9038,'1006965','EMP0009038',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-22','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9039,'1008152','EMP0009039',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-23','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9040,'1009339','EMP0009040',NULL,NULL,'SACHIN','MOHAN','SHARMA','1985-10-24','Male','9876541407',NULL,'abc@gmail.com','07, GEETA SHREE DREAM CITY DEWAS',1,20,486,'Mumbai',455001,'07 GEETA SHREE DREAM CITY DEWAS','0',NULL,NULL,'Married',NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,2,42,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9041,'1000392','EMP0009041',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-25','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9042,'1001579','EMP0009042',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-26','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9043,'1002766','EMP0009043',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-27','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9044,'1003953','EMP0009044',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-28','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9045,'1005140','EMP0009045',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-29','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9046,'1006327','EMP0009046',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-30','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9047,'1007514','EMP0009047',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-10-31','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9048,'1008701','EMP0009048',NULL,NULL,'MANOJ','RADHESHYAM','VISHVAKARMA','1985-11-01','Male','9876541774',NULL,'abc@gmail.com','Vill-Amona ',1,20,486,'Mumbai',455001,'Vill-Amona Dist-Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9049,'1000339','EMP0009049',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-02','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9050,'1001526','EMP0009050',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-03','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9051,'1002713','EMP0009051',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-04','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9052,'1003900','EMP0009052',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-05','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9053,'1005087','EMP0009053',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-06','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9054,'1006274','EMP0009054',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-07','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9055,'1007461','EMP0009055',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-08','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9056,'1008648','EMP0009056',NULL,NULL,'ISHWAR','NIRBHAY SINGH','CHOUDHARY','1985-11-09','Male','9876541707',NULL,'abc@gmail.com','19 A-Arjun Nagar Radhaganj Dewas',1,20,486,'Mumbai',455001,'19 A-Arjun Nagar Radhaganj Dewas  Dewas  455001  Madhya Pradesh','611353285006',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9057,'1000492','EMP0009057',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-10','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9058,'1001679','EMP0009058',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-11','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9059,'1002866','EMP0009059',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-12','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9060,'1004053','EMP0009060',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-13','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9061,'1005240','EMP0009061',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-14','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9062,'1006427','EMP0009062',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-15','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9063,'1007614','EMP0009063',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-16','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9064,'1008801','EMP0009064',NULL,NULL,'MUKESH','KUMAR','VERMA','1985-11-17','Male','9876542263',NULL,'abc@gmail.com','415/27,ADITYA NAGAR,SHAJAPUR,',1,20,486,'Mumbai',450001,'415/27,ADITYA NAGAR,SHAJAPUR,','254804635935','AEGPV6490P',NULL,'Married',4,2,1,NULL,NULL,NULL,'Inactive',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9065,'1000183','EMP0009065',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-18','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9066,'1000386','EMP0009066',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-19','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9067,'1001370','EMP0009067',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-20','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9068,'1001573','EMP0009068',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-21','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9069,'1002557','EMP0009069',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-22','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9070,'1002760','EMP0009070',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-23','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9071,'1003744','EMP0009071',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-24','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9072,'1003947','EMP0009072',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-25','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9073,'1004931','EMP0009073',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-26','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9074,'1005134','EMP0009074',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-27','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9075,'1006118','EMP0009075',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-28','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:08','2017-05-26 21:51:08',NULL,NULL,NULL,NULL),(9076,'1006321','EMP0009076',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-11-29','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9077,'1007305','EMP0009077',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-11-30','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9078,'1007508','EMP0009078',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-12-01','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9079,'1008492','EMP0009079',NULL,NULL,'RADHESHYAM','GANGARAM','BADANA','1985-12-02','Male','9876541506',NULL,'abc@gmail.com','Prahalad Nagar Bawadiya Dewas',1,20,486,'Mumbai',455001,'Prahalad Nagar Bawadiya Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9080,'1008695','EMP0009080',NULL,NULL,'RADHESHYAM','GANGARAM','BODANA','1985-12-03','Male','9876541764',NULL,'abc@gmail.com','29 Bawadiya Dewas ',1,20,486,'Mumbai',455001,'29 Bawadiya Dewas  ','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9081,'1000104','EMP0009081',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-04','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9082,'1001291','EMP0009082',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-05','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9083,'1002478','EMP0009083',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-06','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9084,'1003665','EMP0009084',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-07','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9085,'1004852','EMP0009085',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-08','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9086,'1006039','EMP0009086',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-09','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9087,'1007226','EMP0009087',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-10','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9088,'1008413','EMP0009088',NULL,NULL,'MEHARBAN','BABULAL','SINGH','1985-12-11','Male','9876541424',NULL,'abc@gmail.com','SARVODAY NAGAR DEWAS',1,20,486,'Mumbai',455001,'SARVODAY NAGAR DEWAS','858196069177',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,17,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9089,'1000448','EMP0009089',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-12','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9090,'1001635','EMP0009090',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-13','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9091,'1002822','EMP0009091',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-14','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9092,'1004009','EMP0009092',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-15','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9093,'1005196','EMP0009093',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-16','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9094,'1006383','EMP0009094',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-17','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9095,'1007570','EMP0009095',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-18','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9096,'1008757','EMP0009096',NULL,NULL,'MANOJ','MADHUKAR G.','BANKAR','1985-12-19','Male','9876541989',NULL,'abc@gmail.com','C-401 Sewood Goraj Iii Plot No 6 Borivali    ',1,20,486,'Mumbai',0,'F.No.304 Shekhar Residency Opp.Vijay Nagar Indore','314095837110','AIBP1863F',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9097,'1000153','EMP0009097',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-20','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9098,'1001340','EMP0009098',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-21','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9099,'1002527','EMP0009099',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-22','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9100,'1003714','EMP0009100',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-23','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9101,'1004901','EMP0009101',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-24','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9102,'1006088','EMP0009102',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-25','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9103,'1007275','EMP0009103',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-26','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9104,'1008462','EMP0009104',NULL,NULL,'KISHANLAL','SHANKAR LAL','DODIYA','1985-12-27','Male','9876541474',NULL,'abc@gmail.com','24,AKHADA ROAD (MAJEJET KE SAMNE)',1,20,486,'Mumbai',455001,'24,AKHADA ROAD (MAJEJET KE SAMNE)  ','416662887799','BVXPD3880J',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9105,'1000074','EMP0009105',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1985-12-28','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9106,'1001261','EMP0009106',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1985-12-29','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9107,'1002448','EMP0009107',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1985-12-30','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9108,'1003635','EMP0009108',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1985-12-31','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9109,'1004822','EMP0009109',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1986-01-01','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9110,'1006009','EMP0009110',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1986-01-02','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9111,'1007196','EMP0009111',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1986-01-03','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9112,'1008383','EMP0009112',NULL,NULL,'VIJAY','KUMAR','GUNJAL','1986-01-04','Male','9876541389',NULL,'abc@gmail.com','G5,HIG-VIKAS NAGAR DEWAS',1,20,486,'Mumbai',0,'G5,HIG-VIKAS NAGAR DEWAS','717269934712',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9113,'1000120','EMP0009113',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-05','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9114,'1001307','EMP0009114',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-06','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9115,'1002494','EMP0009115',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-07','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9116,'1003681','EMP0009116',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-08','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9117,'1004868','EMP0009117',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-09','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9118,'1006055','EMP0009118',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-10','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9119,'1007242','EMP0009119',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-11','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9120,'1008429','EMP0009120',NULL,NULL,'SUKHDEV','RAJARAM','PATIDAR','1986-01-12','Male','9876541440',NULL,'abc@gmail.com','597,EWS Vikasnagar  Dewas',1,20,486,'Mumbai',455001,'597,EWS Vikasnagar  Dewas','969301975027','GJWPS4960J',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9121,'1001039','EMP0009121',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-13','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9122,'1002226','EMP0009122',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-14','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9123,'1003413','EMP0009123',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-15','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9124,'1004600','EMP0009124',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-16','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9125,'1005787','EMP0009125',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-17','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9126,'1006974','EMP0009126',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-18','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9127,'1008161','EMP0009127',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-19','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9128,'1009348','EMP0009128',NULL,NULL,'MUKESH','SINGH','TOMAR','1986-01-20','Male','9876541568',NULL,'abc@gmail.com','47 Jitmal Nagar',1,20,486,'Mumbai',455001,'47  Jitmal Nagar','963645855765','AMRPT00626','MP41N20070068724','Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9129,'1001062','EMP0009129',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-21','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9130,'1002249','EMP0009130',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-22','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9131,'1003436','EMP0009131',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-23','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9132,'1004623','EMP0009132',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-24','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9133,'1005810','EMP0009133',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-25','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9134,'1006997','EMP0009134',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-26','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9135,'1008184','EMP0009135',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-27','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9136,'1009371','EMP0009136',NULL,NULL,'RAJESH','SUNDAR LAL','JOSHI','1986-01-28','Male','9876541644',NULL,'abc@gmail.com','VILL. NIPANIYA HUR HUR JILA DEWAS M.P.',1,20,486,'Mumbai',455001,'JAI SHRI NAGER DEWAS M.P','624977717518',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9137,'1000446','EMP0009137',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-01-29','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9138,'1001633','EMP0009138',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-01-30','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:09','2017-05-26 21:51:09',NULL,NULL,NULL,NULL),(9139,'1002820','EMP0009139',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-01-31','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9140,'1004007','EMP0009140',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-01','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9141,'1005194','EMP0009141',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-02','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9142,'1006381','EMP0009142',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-03','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9143,'1007568','EMP0009143',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-04','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9144,'1008755','EMP0009144',NULL,NULL,'RAM PRAKASH','MANULAL','YADAV','1986-02-05','Male','9876541957',NULL,'abc@gmail.com','Vill-Kadesrakala Th-Talbehta JILA LALITPUR U.P.',1,20,486,'Mumbai',0,'09 Lig-Vikas Nagar Dewas ','952130196111',NULL,NULL,'UnMarried',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9145,'1000371','EMP0009145',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-06','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9146,'1001558','EMP0009146',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-07','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9147,'1002745','EMP0009147',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-08','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9148,'1003932','EMP0009148',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-09','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9149,'1005119','EMP0009149',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-10','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9150,'1006306','EMP0009150',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-11','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9151,'1007493','EMP0009151',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-12','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9152,'1008680','EMP0009152',NULL,NULL,'NITESH','DINESH ','KUMAWAT','1986-02-13','Male','9876541743',NULL,'abc@gmail.com','80 Nav Durga Nagar Dewas',1,20,486,'Mumbai',455001,'80 Nav Durga Nagar Dewas','965911394612',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9153,'1001178','EMP0009153',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-14','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9154,'1002365','EMP0009154',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-15','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9155,'1003552','EMP0009155',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-16','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9156,'1004739','EMP0009156',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-17','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9157,'1005926','EMP0009157',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-18','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9158,'1007113','EMP0009158',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-19','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9159,'1008300','EMP0009159',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-20','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9160,'1009487','EMP0009160',NULL,NULL,'NIDHI','ANILKUMAR ','DARDA','1986-02-21','Female','9876542316',NULL,'abc@gmail.com','B-102,SWAPNASRUSTI,PARVATPATIYA,SURAT',1,NULL,1033,'Surat',395010,NULL,'9395','CCLPD4039B',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,51,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9161,'1000437','EMP0009161',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-22','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9162,'1001624','EMP0009162',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-23','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9163,'1002811','EMP0009163',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-24','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9164,'1003998','EMP0009164',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-25','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9165,'1005185','EMP0009165',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-26','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9166,'1006372','EMP0009166',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-27','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9167,'1007559','EMP0009167',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-02-28','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9168,'1008746','EMP0009168',NULL,NULL,'RADHESHYAM','DHYAN SINGH','CHOUHAN','1986-03-01','Male','9876541926',NULL,'abc@gmail.com','Vill-Agarwada Post-Naya Th-Barwah ',1,20,486,'Mumbai',0,'Vikas Nagar Dewas  ','443848135197',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9169,'1001134','EMP0009169',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-02','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9170,'1002321','EMP0009170',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-03','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9171,'1003508','EMP0009171',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-04','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9172,'1004695','EMP0009172',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-05','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9173,'1005882','EMP0009173',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-06','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9174,'1007069','EMP0009174',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-07','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9175,'1008256','EMP0009175',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-08','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9176,'1009443','EMP0009176',NULL,NULL,'SUJITHMON','KAMPOLATH','SUGUNAN','1986-03-09','Male','9876541273',NULL,'abc@gmail.com','KAMPOLATH HOUSE, CHETTY,P.O CHERTHALA,ALAPUZHA',1,NULL,374,'alappuzha',688530,'BLDG NO 10, FLAT NO. 1003, GREEN CITY, BHATHA, ','0','DQVPS8218E',NULL,'Married',2,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,49,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9177,'1001099','EMP0009177',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-10','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9178,'1002286','EMP0009178',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-11','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9179,'1003473','EMP0009179',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-12','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9180,'1004660','EMP0009180',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-13','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9181,'1005847','EMP0009181',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-14','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9182,'1007034','EMP0009182',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-15','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9183,'1008221','EMP0009183',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-16','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9184,'1009408','EMP0009184',NULL,NULL,'ABHINAV','GIRISH','JOSHI','1986-03-17','Male','9876541864',NULL,'abc@gmail.com','466 Sirpur Dhar Road Indore  ',1,20,504,'Pune',0,'452 Seth Mishrilal Nagar Dewas  ','255691835637','AVUPJ2984M','MP41N-2014-0022194','UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9185,'1000108','EMP0009185',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-18','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9186,'1001295','EMP0009186',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-19','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9187,'1002482','EMP0009187',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-20','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9188,'1003669','EMP0009188',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-21','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9189,'1004856','EMP0009189',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-22','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9190,'1006043','EMP0009190',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-23','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9191,'1007230','EMP0009191',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-24','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9192,'1008417','EMP0009192',NULL,NULL,'VINAY','P.C.','JAIN','1986-03-25','Male','9876541428',NULL,'abc@gmail.com','Ram Nagar Extenssion Dewas',1,20,486,'Mumbai',455001,'Ram Nagar Extenssion Dewas','416889454776','afqpj7038g',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9193,'1001049','EMP0009193',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-26','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9194,'1002236','EMP0009194',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-27','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9195,'1003423','EMP0009195',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-28','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9196,'1004610','EMP0009196',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-29','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9197,'1005797','EMP0009197',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-30','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9198,'1006984','EMP0009198',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-03-31','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9199,'1008171','EMP0009199',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-04-01','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9200,'1009358','EMP0009200',NULL,NULL,'RAJENDRA','SHIVNARAYAN','PARIHAR','1986-04-02','Male','9876541605',NULL,'abc@gmail.com','Jain Mandir K Pas Maksi',1,20,486,'Mumbai',0,'Jain Mandir K Pas Maksi','473986044682',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,45,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9201,'1000303','EMP0009201',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-03','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9202,'1001490','EMP0009202',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-04','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9203,'1002677','EMP0009203',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-05','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:10','2017-05-26 21:51:10',NULL,NULL,NULL,NULL),(9204,'1003864','EMP0009204',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-06','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9205,'1005051','EMP0009205',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-07','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9206,'1006238','EMP0009206',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-08','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9207,'1007425','EMP0009207',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-09','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9208,'1008612','EMP0009208',NULL,NULL,'JAGDISH','NARAYAN','BHATI','1986-04-10','Male','9876541658',NULL,'abc@gmail.com','Bawadiya Dewas',1,20,486,'Mumbai',455001,'Bawadiya Dewas','728194914412',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,19,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9209,'1001128','EMP0009209',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-11','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9210,'1002315','EMP0009210',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-12','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9211,'1003502','EMP0009211',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-13','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9212,'1004689','EMP0009212',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-14','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9213,'1005876','EMP0009213',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-15','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9214,'1007063','EMP0009214',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-16','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9215,'1008250','EMP0009215',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-17','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9216,'1009437','EMP0009216',NULL,NULL,'MANISH','KUMAR','MALVIYA','1986-04-18','Male','9876542350',NULL,'abc@gmail.com','24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)',1,20,593,'UJJAIN',456001,'24/1,AARADHYA SADAN, CHHOTI KAML COLONY, UJJAIN (M.P.)','821686086616','BFGPM5349E',NULL,'Married',4,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,44,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9217,'1000310','EMP0009217',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-19','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9218,'1001497','EMP0009218',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-20','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9219,'1002684','EMP0009219',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-21','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9220,'1003871','EMP0009220',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-22','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9221,'1005058','EMP0009221',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-23','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9222,'1006245','EMP0009222',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-24','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9223,'1007432','EMP0009223',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-25','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9224,'1008619','EMP0009224',NULL,NULL,'RADHAKISHAN','JAGDISH','RALOTI','1986-04-26','Male','9876541668',NULL,'abc@gmail.com','Nevri Bagli Marg Hatpipliya',1,20,486,'Mumbai',0,'Vikas Nagar Dewas ','639269917047','BOWPR0825R',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9225,'1001107','EMP0009225',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-04-27','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9226,'1002294','EMP0009226',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-04-28','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9227,'1003481','EMP0009227',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-04-29','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9228,'1004668','EMP0009228',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-04-30','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9229,'1005855','EMP0009229',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-01','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9230,'1007042','EMP0009230',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-02','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9231,'1008229','EMP0009231',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-03','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9232,'1009416','EMP0009232',NULL,NULL,'HARSHIT','ANAND','BHARADWAJ','1986-05-04','Male','9876541881',NULL,'abc@gmail.com','51  Dwarkapuri  20*40 Patti  Near Phooti Khothi',1,20,504,'Pune',452009,'4/5 NAYI ABADI STATION ROAD DEWAS','840429113618','BPDPB0871D',NULL,'UnMarried',1,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9233,'1000575','EMP0009233',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-05','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9234,'1001762','EMP0009234',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-06','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9235,'1002949','EMP0009235',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-07','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9236,'1004136','EMP0009236',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-08','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9237,'1005323','EMP0009237',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-09','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9238,'1006510','EMP0009238',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-10','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9239,'1007697','EMP0009239',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-11','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9240,'1008884','EMP0009240',NULL,NULL,'Mithun ',NULL,'Yadav','1986-05-12','Male','9876542059',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9241,'1001048','EMP0009241',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-13','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9242,'1002235','EMP0009242',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-14','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9243,'1003422','EMP0009243',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-15','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9244,'1004609','EMP0009244',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-16','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9245,'1005796','EMP0009245',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-17','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9246,'1006983','EMP0009246',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-18','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9247,'1008170','EMP0009247',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-19','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9248,'1009357','EMP0009248',NULL,NULL,'BAJRANGI','KUMAR','YADAV','1986-05-20','Male','9876541604',NULL,'abc@gmail.com','Hn 08   Tola Baramsiya Vill- Mothiledha Thana Bengaad Dist Giridh',1,20,486,'Mumbai',456001,'KANCHAN COLONY BAWDIYA DEWAS','288605642321',NULL,NULL,'Married',1,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9249,'1001015','EMP0009249',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-21','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9250,'1002202','EMP0009250',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-22','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9251,'1003389','EMP0009251',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-23','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9252,'1004576','EMP0009252',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-24','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9253,'1005763','EMP0009253',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-25','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9254,'1006950','EMP0009254',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-26','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9255,'1008137','EMP0009255',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-27','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9256,'1009324','EMP0009256',NULL,NULL,'ABHIJEET ','SINGH','BAIS','1986-05-28','Male','9876541352',NULL,'abc@gmail.com','115 Shalini Road Dewas',1,20,486,'Mumbai',455001,'115 Shalini Road Dewas','0','BUPPB56875',NULL,'UnMarried',6,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,14,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9257,'1000415','EMP0009257',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-05-29','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9258,'1001602','EMP0009258',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-05-30','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9259,'1002789','EMP0009259',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-05-31','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9260,'1003976','EMP0009260',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-01','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9261,'1005163','EMP0009261',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-02','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9262,'1006350','EMP0009262',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-03','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9263,'1007537','EMP0009263',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-04','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9264,'1008724','EMP0009264',NULL,NULL,'NAYAN ',NULL,'SHARMA','1986-06-05','Male','9876541851',NULL,'abc@gmail.com','S/O SATISH MOHALLA GAUTAMPURA INDORE',1,20,486,'Mumbai',453220,'S/O SATISH MOHALLA GAUTAMPURA INDORE','885887676109',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9265,'1001138','EMP0009265',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-06','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:11','2017-05-26 21:51:11',NULL,NULL,NULL,NULL),(9266,'1002325','EMP0009266',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-07','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9267,'1003512','EMP0009267',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-08','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9268,'1004699','EMP0009268',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-09','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9269,'1005886','EMP0009269',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-10','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9270,'1007073','EMP0009270',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-11','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9271,'1008260','EMP0009271',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-12','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9272,'1009447','EMP0009272',NULL,NULL,'RAKHESH ','SHYAMKUMAR KRISHNANNAIK',NULL,'1986-06-13','Male','9876541796',NULL,'abc@gmail.com','RISHYA SREE, POOCHAKUZHI ROAD, WEST ERUVELY,CHOTTAMIKKARA',1,NULL,504,'Pune',683102,'BLDG NO 19, FLAT NO. 105, GREEN CITY, BHATHA, ','0','AKMPR7500E',NULL,'Married',3,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9273,'1000167','EMP0009273',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-14','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9274,'1001354','EMP0009274',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-15','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9275,'1002541','EMP0009275',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-16','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9276,'1003728','EMP0009276',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-17','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9277,'1004915','EMP0009277',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-18','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9278,'1006102','EMP0009278',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-19','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9279,'1007289','EMP0009279',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-20','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9280,'1008476','EMP0009280',NULL,NULL,'HEMANT ','ANANTRAO','SHALIGRAM','1986-06-21','Male','9876541488',NULL,'abc@gmail.com','92 Hebat Rao Marg Dewas ',1,20,486,'Mumbai',455001,'92 Hebat Rao Marg Dewas','266238283782',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,16,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9281,'1001037','EMP0009281',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-22','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9282,'1002224','EMP0009282',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-23','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9283,'1003411','EMP0009283',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-24','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9284,'1004598','EMP0009284',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-25','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9285,'1005785','EMP0009285',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-26','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9286,'1006972','EMP0009286',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-27','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9287,'1008159','EMP0009287',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-28','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9288,'1009346','EMP0009288',NULL,NULL,'JAGDISH','LT.KANHAYALAL','GHURAWAL','1986-06-29','Male','9876541554',NULL,'abc@gmail.com','Hn 36  Ward No.4 Kundi K Pas Kalukhedi',1,20,486,'Mumbai',455001,'Hn 36  Ward No.4 Kundi K Pas Kalukhedi','244130416849',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,43,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9289,'1001176','EMP0009289',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-06-30','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9290,'1002363','EMP0009290',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-01','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9291,'1003550','EMP0009291',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-02','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9292,'1004737','EMP0009292',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-03','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9293,'1005924','EMP0009293',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-04','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9294,'1007111','EMP0009294',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-05','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9295,'1008298','EMP0009295',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-06','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9296,'1009485','EMP0009296',NULL,NULL,'MOHAMMED SOAB','MOHAMMED HANIF','RANDERI','1986-07-07','Male','9876542314',NULL,'abc@gmail.com','FLAT NO-302, NAJRANA APT, HAZAMWAD, RANDER',1,NULL,1033,'Surat',395005,NULL,'8792','BDVPR6635M','GJ05-05892809','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,28,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9297,'1000388','EMP0009297',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-08','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9298,'1001575','EMP0009298',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-09','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9299,'1002762','EMP0009299',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-10','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9300,'1003949','EMP0009300',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-11','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9301,'1005136','EMP0009301',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-12','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9302,'1006323','EMP0009302',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-13','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9303,'1007510','EMP0009303',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-14','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9304,'1008697','EMP0009304',NULL,NULL,'SATYASHEEL','DILIP ','TAPKIR','1986-07-15','Male','9876541767',NULL,'abc@gmail.com','108 Ram Nagar Dewas',1,20,486,'Mumbai',455001,'108 Ram Nagar Dewas','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,7,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9305,'1000432','EMP0009305',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-16','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9306,'1001619','EMP0009306',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-17','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9307,'1002806','EMP0009307',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-18','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9308,'1003993','EMP0009308',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-19','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9309,'1005180','EMP0009309',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-20','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9310,'1006367','EMP0009310',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-21','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9311,'1007554','EMP0009311',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-22','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9312,'1008741','EMP0009312',NULL,NULL,'DHARMENDRA','BHEEMAJI','JAMLIYA','1986-07-23','Male','9876541919',NULL,'abc@gmail.com','Vill-22 Nimad  Khandwa',1,20,486,'Mumbai',0,'21 Sarvoday Nagar Shanti Nagar Ke Pass Dewas','946579339478',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,1,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9313,'1001135','EMP0009313',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-24','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9314,'1002322','EMP0009314',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-25','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9315,'1003509','EMP0009315',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-26','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9316,'1004696','EMP0009316',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-27','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9317,'1005883','EMP0009317',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-28','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9318,'1007070','EMP0009318',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-29','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9319,'1008257','EMP0009319',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-30','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9320,'1009444','EMP0009320',NULL,NULL,'RAKESH KUMAR','RAM SAGAR SINGH',NULL,'1986-07-31','Male','9876541344',NULL,'abc@gmail.com','HOUSE NO,131, 1ST FLOOR, RIGHT SIDE,HARINAGAR ASHRAM, JUNGPURA, SOUTH DELHI',1,NULL,135,'Delhi',110014,NULL,'6341','AUGPK5738D',NULL,'Married',4,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,50,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9321,'1001127','EMP0009321',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-01','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9322,'1002314','EMP0009322',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-02','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9323,'1003501','EMP0009323',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-03','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9324,'1004688','EMP0009324',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-04','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9325,'1005875','EMP0009325',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-05','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9326,'1007062','EMP0009326',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-06','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9327,'1008249','EMP0009327',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-07','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9328,'1009436','EMP0009328',NULL,NULL,'VINAY','K.V.','MAKWANA','1986-08-08','Male','9876542348',NULL,'abc@gmail.com','39 Ews Indra Nagar Agar Road Ujjan',1,20,593,'Ujjain',456010,'39 Ews Indra Nagar Agar Road Ujjan','839180420257','ASUPM4725E',NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,2,8,NULL,NULL,'2017-05-26 21:51:12','2017-05-26 21:51:12',NULL,NULL,NULL,NULL),(9329,'1000559','EMP0009329',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-09','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9330,'1001746','EMP0009330',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-10','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9331,'1002933','EMP0009331',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-11','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9332,'1004120','EMP0009332',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-12','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9333,'1005307','EMP0009333',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-13','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9334,'1006494','EMP0009334',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-14','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9335,'1007681','EMP0009335',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-15','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9336,'1008868','EMP0009336',NULL,NULL,'Shailesh ',NULL,'Gujrati','1986-08-16','Male','9876542043',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,29,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9337,'1000011','EMP0009337',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-08-17','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9338,'1000014','EMP0009338',NULL,NULL,'ATUL','KUMAR','SINGH','1986-08-18','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9339,'1000015','EMP0009339',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-08-19','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9340,'1000017','EMP0009340',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-08-20','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9341,'1000018','EMP0009341',NULL,NULL,'sunil',NULL,'malviy','1986-08-21','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9342,'1000019','EMP0009342',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-08-22',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9343,'1000020','EMP0009343',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-08-23','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9344,'1000021','EMP0009344',NULL,NULL,'ramlal',NULL,'jaiswal','1986-08-24','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9345,'1000023','EMP0009345',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-08-25','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9346,'1000025','EMP0009346',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-08-26','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9347,'1000026','EMP0009347',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-08-27','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9348,'1000027','EMP0009348',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-08-28','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9349,'1000083','EMP0009349',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-08-29','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9350,'1000606','EMP0009350',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-08-30','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9351,'1000608','EMP0009351',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-08-31','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9352,'1001105','EMP0009352',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-09-01','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9353,'1001152','EMP0009353',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-09-02','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9354,'1001181','EMP0009354',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-09-03','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9355,'1001182','EMP0009355',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-09-04','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9356,'1001183','EMP0009356',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-09-05','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9357,'1001198','EMP0009357',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-09-06','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9358,'1001201','EMP0009358',NULL,NULL,'ATUL','KUMAR','SINGH','1986-09-07','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9359,'1001202','EMP0009359',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-09-08','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9360,'1001204','EMP0009360',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-09-09','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9361,'1001205','EMP0009361',NULL,NULL,'sunil',NULL,'malviy','1986-09-10','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9362,'1001206','EMP0009362',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-09-11',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9363,'1001207','EMP0009363',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-09-12','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9364,'1001208','EMP0009364',NULL,NULL,'ramlal',NULL,'jaiswal','1986-09-13','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9365,'1001210','EMP0009365',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-09-14','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9366,'1001212','EMP0009366',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-09-15','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9367,'1001213','EMP0009367',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-09-16','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9368,'1001214','EMP0009368',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-09-17','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9369,'1001270','EMP0009369',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-09-18','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9370,'1001793','EMP0009370',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-09-19','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9371,'1001795','EMP0009371',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-09-20','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9372,'1002292','EMP0009372',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-09-21','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9373,'1002339','EMP0009373',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-09-22','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9374,'1002368','EMP0009374',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-09-23','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9375,'1002369','EMP0009375',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-09-24','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9376,'1002370','EMP0009376',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-09-25','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9377,'1002385','EMP0009377',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-09-26','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9378,'1002388','EMP0009378',NULL,NULL,'ATUL','KUMAR','SINGH','1986-09-27','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9379,'1002389','EMP0009379',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-09-28','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9380,'1002391','EMP0009380',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-09-29','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9381,'1002392','EMP0009381',NULL,NULL,'sunil',NULL,'malviy','1986-09-30','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9382,'1002393','EMP0009382',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-10-01',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9383,'1002394','EMP0009383',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-10-02','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9384,'1002395','EMP0009384',NULL,NULL,'ramlal',NULL,'jaiswal','1986-10-03','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9385,'1002397','EMP0009385',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-10-04','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9386,'1002399','EMP0009386',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-10-05','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9387,'1002400','EMP0009387',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-10-06','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9388,'1002401','EMP0009388',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-10-07','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9389,'1002457','EMP0009389',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-10-08','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9390,'1002980','EMP0009390',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-10-09','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9391,'1002982','EMP0009391',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-10-10','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:13','2017-05-26 21:51:13',NULL,NULL,NULL,NULL),(9392,'1003479','EMP0009392',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-10-11','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9393,'1003526','EMP0009393',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-10-12','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9394,'1003555','EMP0009394',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-10-13','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9395,'1003556','EMP0009395',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-10-14','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9396,'1003557','EMP0009396',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-10-15','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9397,'1003572','EMP0009397',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-10-16','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9398,'1003575','EMP0009398',NULL,NULL,'ATUL','KUMAR','SINGH','1986-10-17','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9399,'1003576','EMP0009399',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-10-18','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9400,'1003578','EMP0009400',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-10-19','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9401,'1003579','EMP0009401',NULL,NULL,'sunil',NULL,'malviy','1986-10-20','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9402,'1003580','EMP0009402',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-10-21',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9403,'1003581','EMP0009403',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-10-22','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9404,'1003582','EMP0009404',NULL,NULL,'ramlal',NULL,'jaiswal','1986-10-23','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9405,'1003584','EMP0009405',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-10-24','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9406,'1003586','EMP0009406',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-10-25','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9407,'1003587','EMP0009407',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-10-26','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9408,'1003588','EMP0009408',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-10-27','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9409,'1003644','EMP0009409',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-10-28','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9410,'1004167','EMP0009410',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-10-29','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9411,'1004169','EMP0009411',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-10-30','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9412,'1004666','EMP0009412',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-10-31','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9413,'1004713','EMP0009413',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-11-01','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9414,'1004742','EMP0009414',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-11-02','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9415,'1004743','EMP0009415',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-11-03','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9416,'1004744','EMP0009416',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-11-04','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9417,'1004759','EMP0009417',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-11-05','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9418,'1004762','EMP0009418',NULL,NULL,'ATUL','KUMAR','SINGH','1986-11-06','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9419,'1004763','EMP0009419',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-11-07','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9420,'1004765','EMP0009420',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-11-08','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9421,'1004766','EMP0009421',NULL,NULL,'sunil',NULL,'malviy','1986-11-09','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9422,'1004767','EMP0009422',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-11-10',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9423,'1004768','EMP0009423',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-11-11','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9424,'1004769','EMP0009424',NULL,NULL,'ramlal',NULL,'jaiswal','1986-11-12','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9425,'1004771','EMP0009425',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-11-13','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9426,'1004773','EMP0009426',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-11-14','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9427,'1004774','EMP0009427',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-11-15','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9428,'1004775','EMP0009428',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-11-16','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9429,'1004831','EMP0009429',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-11-17','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9430,'1005354','EMP0009430',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-11-18','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9431,'1005356','EMP0009431',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-11-19','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9432,'1005853','EMP0009432',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-11-20','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9433,'1005900','EMP0009433',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-11-21','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9434,'1005929','EMP0009434',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-11-22','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9435,'1005930','EMP0009435',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-11-23','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9436,'1005931','EMP0009436',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-11-24','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9437,'1005946','EMP0009437',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-11-25','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9438,'1005949','EMP0009438',NULL,NULL,'ATUL','KUMAR','SINGH','1986-11-26','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9439,'1005950','EMP0009439',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-11-27','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9440,'1005952','EMP0009440',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-11-28','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9441,'1005953','EMP0009441',NULL,NULL,'sunil',NULL,'malviy','1986-11-29','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9442,'1005954','EMP0009442',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-11-30',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9443,'1005955','EMP0009443',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-12-01','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9444,'1005956','EMP0009444',NULL,NULL,'ramlal',NULL,'jaiswal','1986-12-02','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9445,'1005958','EMP0009445',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-12-03','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9446,'1005960','EMP0009446',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-12-04','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9447,'1005961','EMP0009447',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-12-05','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9448,'1005962','EMP0009448',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-12-06','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9449,'1006018','EMP0009449',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-12-07','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9450,'1006541','EMP0009450',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-12-08','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9451,'1006543','EMP0009451',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-12-09','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9452,'1007040','EMP0009452',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-12-10','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9453,'1007087','EMP0009453',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-12-11','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9454,'1007116','EMP0009454',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1986-12-12','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:14','2017-05-26 21:51:14',NULL,NULL,NULL,NULL),(9455,'1007117','EMP0009455',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1986-12-13','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9456,'1007118','EMP0009456',NULL,NULL,'RUTU',NULL,'MOVALIYA','1986-12-14','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9457,'1007133','EMP0009457',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1986-12-15','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9458,'1007136','EMP0009458',NULL,NULL,'ATUL','KUMAR','SINGH','1986-12-16','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9459,'1007137','EMP0009459',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1986-12-17','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9460,'1007139','EMP0009460',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1986-12-18','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9461,'1007140','EMP0009461',NULL,NULL,'sunil',NULL,'malviy','1986-12-19','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9462,'1007141','EMP0009462',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1986-12-20',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9463,'1007142','EMP0009463',NULL,NULL,'KAMLESH',NULL,'TIWARI','1986-12-21','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9464,'1007143','EMP0009464',NULL,NULL,'ramlal',NULL,'jaiswal','1986-12-22','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9465,'1007145','EMP0009465',NULL,NULL,'Vishnu ',NULL,'Patidar','1986-12-23','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9466,'1007147','EMP0009466',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1986-12-24','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9467,'1007148','EMP0009467',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1986-12-25','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9468,'1007149','EMP0009468',NULL,NULL,'GAURIJ ',NULL,'TARE','1986-12-26','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9469,'1007205','EMP0009469',NULL,NULL,'DINESH','RAMAJI','KALMI','1986-12-27','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9470,'1007728','EMP0009470',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1986-12-28','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9471,'1007730','EMP0009471',NULL,NULL,'Laxmi Bai',NULL,NULL,'1986-12-29','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9472,'1008227','EMP0009472',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1986-12-30','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9473,'1008274','EMP0009473',NULL,NULL,'RAJESH',NULL,'TAILOR','1986-12-31','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9474,'1008303','EMP0009474',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1987-01-01','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9475,'1008304','EMP0009475',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1987-01-02','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9476,'1008305','EMP0009476',NULL,NULL,'RUTU',NULL,'MOVALIYA','1987-01-03','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9477,'1008320','EMP0009477',NULL,NULL,'DINESH','VISHWESHWAR DATT','THAPLIYAL','1987-01-04','Male','9876541242',NULL,'abc@gmail.com','G-61 MAHINDRA PARK NARAYAN NAGAR L.B.S.MARG GHATKOPAR WEST MUMBAI',1,20,486,'Mumbai',400086,NULL,'416608174576','AANPT5352K',NULL,'Married',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9478,'1008323','EMP0009478',NULL,NULL,'ATUL','KUMAR','SINGH','1987-01-05','Male','9876541245',NULL,'abc@gmail.com','9,M.I.G TRILOK NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'0','BLFPR1419H',NULL,'UnMarried',3,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9479,'1008324','EMP0009479',NULL,NULL,'JITENDRA ','PREM SINGH','RAJPUT','1987-01-06','Male','9876541246',NULL,'abc@gmail.com','nipaniya hur hur',1,20,486,'Mumbai',0,'sun city dewas','238063701530',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9480,'1008326','EMP0009480',NULL,NULL,'SHIVNARAYAN',NULL,'PANWAR','1987-01-07','Male','9876541248',NULL,'abc@gmail.com','V.MUDKA POST. PATLAVDA',1,20,486,'Mumbai',0,NULL,'598144240671',NULL,NULL,'Married',NULL,2,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,9,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9481,'1008327','EMP0009481',NULL,NULL,'sunil',NULL,'malviy','1987-01-08','Male','9876541249',NULL,'abc@gmail.com','mandi chuk dewas ',1,20,486,'Mumbai',0,NULL,'759258380642',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9482,'1008328','EMP0009482',NULL,NULL,'VIJAY',NULL,'CHOUDHARY','1987-01-09',NULL,'9876541250',NULL,'abc@gmail.com','DewasV,KJURIYA JAGIR DEWAS',1,20,486,'Mumbai',0,NULL,'408400599913',NULL,NULL,'UnMarried',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,2,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9483,'1008329','EMP0009483',NULL,NULL,'KAMLESH',NULL,'TIWARI','1987-01-10','Male','9876541251',NULL,'abc@gmail.com','62,LAXMAN NAGAR DEWAS',1,20,486,'Mumbai',0,NULL,'260638321286',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9484,'1008330','EMP0009484',NULL,NULL,'ramlal',NULL,'jaiswal','1987-01-11','Male','9876541252',NULL,'abc@gmail.com','40,Arjun Nagar dewas',1,20,486,'Mumbai',0,NULL,'363574462074',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9485,'1008332','EMP0009485',NULL,NULL,'Vishnu ',NULL,'Patidar','1987-01-12','Male','9876541254',NULL,'abc@gmail.com','arjun nagar itawa DEWAS',1,20,486,'Mumbai',0,NULL,'705527118326',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,10,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9486,'1008334','EMP0009486',NULL,NULL,'RAVINDRA ',NULL,'SOLANKI','1987-01-13','Male','9876541256',NULL,'abc@gmail.com','JAMGOD RANI KTAMBA DEWAS',1,20,486,'Mumbai',0,NULL,'652014753310',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9487,'1008335','EMP0009487',NULL,NULL,'MAKHAN',NULL,'CHILLORIYA','1987-01-14','Male','9876541257',NULL,'abc@gmail.com','MANDI CHUK DEWAS',1,20,486,'Mumbai',0,NULL,'905670081274',NULL,NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,3,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9488,'1008336','EMP0009488',NULL,NULL,'GAURIJ ',NULL,'TARE','1987-01-15','Male','9876541258',NULL,'abc@gmail.com','VAISHNAVI COLONY KHARGONE',1,20,486,'Mumbai',0,NULL,'305270137735',NULL,NULL,'Married',NULL,3,NULL,NULL,NULL,NULL,'Active',NULL,NULL,1,2,11,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9489,'1008392','EMP0009489',NULL,NULL,'DINESH','RAMAJI','KALMI','1987-01-16','Male','9876541401',NULL,'abc@gmail.com','V.CHALNI DIS.DHAR TEH.SARDARPUR',1,20,486,'Mumbai',0,'DURGA COLONI AMONA DEWAS','227455837333','EQJPK9999F',NULL,'Married',NULL,3,1,NULL,NULL,NULL,'Active',NULL,NULL,1,2,13,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9490,'1008915','EMP0009490',NULL,NULL,'Ramratan  ',NULL,'Rawat ','1987-01-17','Male','9876542090',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,1,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9491,'1008917','EMP0009491',NULL,NULL,'Laxmi Bai',NULL,NULL,'1987-01-18','Female','9876542092',NULL,'abc@gmail.com','Pune',1,20,504,'Pune',411002,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',NULL,NULL,1,1,28,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9492,'1009414','EMP0009492',NULL,NULL,'NARESH','JAVANTRAJ','BHANDARI','1987-01-19','Male','9876541872',NULL,'abc@gmail.com','Indore',1,20,504,'Pune',0,'Indore','0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Inactive',NULL,NULL,1,2,4,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9493,'1009461','EMP0009493',NULL,NULL,'RAJESH',NULL,'TAILOR','1987-01-20','Male','9876542286',NULL,'abc@gmail.com',NULL,NULL,NULL,NULL,'SURAT',0,NULL,'0',NULL,NULL,'Married',NULL,2,1,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9494,'1009490','EMP0009494',NULL,NULL,'MANOJ ',NULL,'MOVALIYA','1987-01-21','Male','9876542370',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9495,'1009491','EMP0009495',NULL,NULL,'SANJAY ',NULL,'MOVALIYA','1987-01-22','Male','9876542371',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL),(9496,'1009492','EMP0009496',NULL,NULL,'RUTU',NULL,'MOVALIYA','1987-01-23','Male','9876542372',NULL,'abc@gmail.com','10TH FLOOR, ROYAL TRADE CENTRE, OPP. STAR BAZAAR, ADAJAN',1,NULL,1033,NULL,395009,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,3,52,NULL,NULL,'2017-05-26 21:51:15','2017-05-26 21:51:15',NULL,NULL,NULL,NULL);
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
INSERT INTO `groups` VALUES (1,'mdindia@gmail.com','$2a$10$GfpNV0orbEwVpbDc2q8mzeFHJqPK//03o2AH0ywYIrs7KVtJ8WqDO','MD India',NULL,NULL,NULL,2,'2017-05-26 21:07:36','2017-05-26 21:04:33','114.143.205.226','207.244.83.123','2017-05-26 21:04:33','2017-05-26 21:07:36',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'1.0','Basic','Basic',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(2,'2.0','HRA','HRA',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(3,'3.0','Special Allowance','Special Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(4,'4.0','Convenience Allowance','Convenience Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(5,'5.0','Other Allowance','Other Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(6,'6.0','Washing Allowance','Washing Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(7,'7.0','Driver Allowance','Driver Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(8,'8.0','Medical Allowance','Medical Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(9,'9.0','Children Education Allowance','Children Education Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(10,'10.0','PF','PF',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(12,'12.0','Income Tax','Income Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(13,'13.0','Food Deduction','Food Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(14,'14.0','Other Deduction','Other Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(15,'15.0','Prof. Tax','Prof. Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(16,'16.0','Society','Deposit',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(17,'17.0','Society Loan','Society',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(18,'18.0','Retaintion','Retaintion',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(19,'19.0','DA','Dearness Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(20,'20.0','Welfair','Welfair',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41'),(21,'21.0','Mobile Deduction','Mobile Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 20:53:41','2017-05-26 20:53:41');
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525123712');
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

-- Dump completed on 2017-05-26 22:39:10