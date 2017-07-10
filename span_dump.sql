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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_types`
--

LOCK TABLES `advance_types` WRITE;
/*!40000 ALTER TABLE `advance_types` DISABLE KEYS */;
INSERT INTO `advance_types` VALUES (1,'Salary Advance ','Salary Advance','',NULL,'2017-06-20 09:29:55','2017-06-20 09:29:55'),(2,'TDS Deduction','TDS Deduction','',NULL,'2017-06-20 09:30:09','2017-06-20 09:30:09');
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
-- Table structure for table `attribute_rating_sheets`
--

DROP TABLE IF EXISTS `attribute_rating_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_rating_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `employee_attribute_id` int(11) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_confirm_appraiser` tinyint(1) DEFAULT NULL,
  `is_confirm_appraisee` tinyint(1) DEFAULT NULL,
  `appraiser2_comment` text COLLATE utf8_unicode_ci,
  `final_comment` text COLLATE utf8_unicode_ci,
  `final_id_id` int(11) DEFAULT NULL,
  `appraiser_2_id` int(11) DEFAULT NULL,
  `is_confirm_final` tinyint(1) DEFAULT NULL,
  `is_confirm_appraiser2` tinyint(1) DEFAULT NULL,
  `appraisee_rating_id` int(11) DEFAULT NULL,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `appraiser2_rating_id` int(11) DEFAULT NULL,
  `final_rating_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attribute_rating_sheets_on_appraisee_id` (`appraisee_id`),
  KEY `index_attribute_rating_sheets_on_appraisee_rating_id` (`appraisee_rating_id`),
  KEY `index_attribute_rating_sheets_on_appraiser2_rating_id` (`appraiser2_rating_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_2_id` (`appraiser_2_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_id` (`appraiser_id`),
  KEY `index_attribute_rating_sheets_on_appraiser_rating_id` (`appraiser_rating_id`),
  KEY `index_attribute_rating_sheets_on_employee_attribute_id` (`employee_attribute_id`),
  KEY `index_attribute_rating_sheets_on_final_id_id` (`final_id_id`),
  KEY `index_attribute_rating_sheets_on_final_rating_id` (`final_rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_rating_sheets`
--

LOCK TABLES `attribute_rating_sheets` WRITE;
/*!40000 ALTER TABLE `attribute_rating_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_rating_sheets` ENABLE KEYS */;
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
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'AB+',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'B+',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'O+',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'A-',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(6,'B-',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(7,'O-',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(8,'AB-',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `bonus_amount` decimal(15,2) DEFAULT '0.00',
  `bouns_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bonus_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
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
INSERT INTO `companies` VALUES (1,NULL,'C001','COM001','SPAN PUMPS PVT LTD','SPAN PUMPS ',1,'123456789','','','','Office  address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.',1,20,504,'Pune',411045,' hrassistant2@spanpump.com','12345678','www.spanpumpsindia.com','2017-05-01','2017-05-26 21:42:32','2017-05-26 21:43:58','span-pumps-pvt-ltd-logo-120x120.jpg','image/jpeg',6426,'2017-05-26 21:43:58');
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
  KEY `index_company_leavs_on_leav_category_id` (`leav_category_id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'L001','COMLOC001','Pune','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Pune',1,20,504,411045,'12345678','2017-05-26 21:48:55','2017-05-26 21:48:55'),(2,1,'L002','COMLOC002','Andhra Pradesh','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Andra',1,2,7,411045,'12345678','2017-05-26 21:53:06','2017-05-26 21:53:06'),(3,1,'L003','COMLOC003','Chhattisgarh','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Durg',1,7,120,411045,'12345678','2017-05-26 21:55:01','2017-05-26 21:55:01'),(4,1,'L004','COMLOC004','Odisha','hrassistant2@spanpump.com','	Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Puri',1,26,616,411045,'12345678','2017-05-26 21:56:52','2017-05-26 21:56:52'),(5,1,'L005','COMLOC005','Rajasthan','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Bhilwara',1,29,678,411045,'12345678','2017-05-26 21:58:49','2017-05-26 21:58:49'),(6,1,'L006','COMLOC006','Sanaswadi','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Pune',1,20,504,411045,'12345678','2017-05-26 22:00:36','2017-06-07 08:46:53'),(7,1,'L007','COMLOC007','Telangana','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Hyderabad',1,31,737,411045,'12345678','2017-05-26 22:02:39','2017-05-26 22:02:39'),(8,1,'CL08','COMLOC008','Bihar','Bihar@gmail.com','','Patna',1,5,106,321456,'','2017-06-07 08:53:43','2017-06-07 08:53:43');
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
INSERT INTO `company_types` VALUES (1,'1.0','Private Limited ',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Limited Liability Partnership',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Public Limited',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
INSERT INTO `countries` VALUES (1,'IN','India','2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-05-26 21:42:32','2017-05-26 21:42:32'),(2,'company_location',8,'2017-05-26 21:48:55','2017-06-07 08:53:43'),(3,'department',47,'2017-05-26 22:07:40','2017-06-07 09:17:31'),(4,'employee',167,'2017-06-06 22:09:45','2017-06-06 22:12:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_streams`
--

LOCK TABLES `degree_streams` WRITE;
/*!40000 ALTER TABLE `degree_streams` DISABLE KEYS */;
INSERT INTO `degree_streams` VALUES (1,'1.0','Aerospace',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,'2.0','Archaeology',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,'3.0','Asian language and culture',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(4,'4.0','Automotive ',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(5,'5.0','Chemical',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(6,'6.0','Civil',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(7,'7.0','Commerce',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(8,'8.0','Computer Application',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(9,'9.0','Computer Architecture',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(10,'10.0','Computer Sicence',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(11,'11.0','Creative Writing',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(12,'12.0','Electrical',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(13,'13.0','Electrical & Electronics',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(14,'14.0','Human Resource',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(15,'15.0',' Informaton Technology  ',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(16,'16.0','Marine',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(17,'17.0','Mathematics',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(18,'18.0','Mechanical',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(19,'19.0','Philosophy',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(20,'20.0','Psychology',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(21,'21.0','Robotics',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(22,'22.0','Saftey',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(23,'23.0','Science',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(24,'24.0','Textile',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(25,'25.0','Theater:Design & Production',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `degree_types` VALUES (1,'1.0','Primary School',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,'2.0',' Middle School ',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,'3.0',' High School ',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(4,'4.0','Senior Secondary',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(5,'5.0','Diploma',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(6,'6.0','Under Graduate',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(7,'7.0','Graduate',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(8,'8.0','Under Post Graduate',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(9,'9.0','Post Graduation ',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(10,'10.0','Professional',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `degrees` VALUES (1,'1.0','BCA ','Bachelor of Computer Application',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','BBA','Bachelor of Business Administration',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','B.Com ','Bachelor of Commerce   ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0',' B.Sc ','Bachelor of Science ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','BA','Bachelor  of Arts  ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(6,'6.0','BE','Bachelor of Engineering   ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(7,'7.0','B.Tech','Bachelor of Technology',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(8,'8.0','DCA','Diploma in Computer Application',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(9,'9.0','ITI','Industial Training Institute',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(10,'10.0','BSW','Bachelor  of Sociel Work',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(11,'11.0','Polytechnic','Polytechnic',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(12,'12.0','LL.B','Bachelor of Laws',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(13,'13.0','BCM','Bachelor of computer management',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(14,'14.0','BFA','Bachelor  of Fine Arts ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(15,'15.0','BMS','Bachelor  of Management Study',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(16,'16.0','BCS','Bachelor  of Computer Science',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(17,'17.0','BBM','Bachelor  of Business Management',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(18,'18.0','BJMC','Bachelor  of Journalism and Mass Communication',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(19,'19.0','BHM','Bachelor  of Hotel Managemnet',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(20,'20.0','B.Pharma','Bachachelor of Pharmacy',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(21,'21.0','BS','Bachachelor of Science ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(22,'22.0','CS','Compnay Secrectary',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(23,'23.0','CA','Chartered Accountant',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(24,'24.0','MBBS','Bachelor of Medicine and Bachelor of Surgery',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(25,'25.0','MCA','Master of Computer Application',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(26,'26.0','MBA','Master of Business Administration',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(27,'27.0','M.Com','Master of Commerce',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(28,'28.0','M.Sc','Master of Science',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(29,'29.0','MA','Master of Arts',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(30,'30.0','ME','Master of Engineering',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(31,'31.0','M.Tech','Master of Technology ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(32,'32.0','PGDCA','Post Grduate Diploma in computer Application',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(33,'33.0','MSW','Master of SocielWork ',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(34,'34.0','LL.M ','Master of Laws',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(35,'35.0','MCM','Master of computer management',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(36,'36.0','MFA','Master of Fine Arts ',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(37,'37.0','MMS','Master of Management Studies',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(38,'38.0','MCS','Matser of Computer Science',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(39,'39.0','MBM','Master in Business Management',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(40,'40.0','MJMC','Master of Journalism and Mass Communication',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(41,'41.0','MHM','Master in Hotel Management ',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(42,'42.0','M.Pharma',' Master of Pharmacy',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(43,'43.0','MS',' Master of Science',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(44,'44.0','MD','Medicinae Doctor ',NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `department_types` VALUES (1,'1.0','Executive','Executive',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Operation','Operation',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Support','Support',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,2,'D01','DEPT001','','Account',3,'',NULL,'2017-05-26 22:07:40','2017-06-05 05:09:20'),(2,2,'D02','DEPT002','','Material Management',3,'',NULL,'2017-05-26 22:08:14','2017-06-05 05:03:48'),(3,2,'D03','DEPT003','','Projects Operations',2,'',NULL,'2017-05-26 22:08:39','2017-05-26 22:08:39'),(4,2,'D04','DEPT004','','Project MIS',3,'',NULL,'2017-05-26 22:09:17','2017-05-26 22:09:17'),(5,2,'D05','DEPT005','','Sales & Marketing',2,'',NULL,'2017-05-26 22:09:43','2017-05-26 22:09:43'),(6,3,'D06','DEPT006','','Account',3,'',NULL,'2017-05-26 22:10:22','2017-06-05 05:09:28'),(7,3,'D07','DEPT007','','Human Resource Management',3,'',NULL,'2017-05-26 22:10:43','2017-06-05 05:10:59'),(8,3,'D08','DEPT008','','Material Management',3,'',NULL,'2017-05-26 22:11:08','2017-06-05 05:04:01'),(9,3,'D09','DEPT009','','Projects Operations',2,'',NULL,'2017-05-26 22:11:34','2017-05-26 22:11:34'),(10,3,'D10','DEPT010','','Project MIS',3,'',NULL,'2017-05-26 22:12:07','2017-05-26 22:12:07'),(11,3,'D11','DEPT011','','Sales & Marketing',2,'',NULL,'2017-05-26 22:12:39','2017-05-26 22:12:39'),(12,4,'D12','DEPT012','','Account',3,'',NULL,'2017-05-26 22:13:07','2017-06-05 05:09:39'),(13,4,'D13','DEPT013','','Human Resource Management',3,'',NULL,'2017-05-26 22:13:26','2017-06-05 05:11:09'),(14,4,'D14','DEPT014','','Material Management',3,'',NULL,'2017-05-26 22:13:54','2017-06-05 05:04:14'),(15,4,'D15','DEPT015','','Projects Operations',2,'',NULL,'2017-05-26 22:15:13','2017-05-26 22:15:13'),(16,4,'D16','DEPT016','','Project MIS',3,'',NULL,'2017-05-26 22:15:49','2017-05-26 22:15:49'),(17,4,'D17','DEPT017','','Sales & Marketing',2,'',NULL,'2017-05-26 22:16:25','2017-05-26 22:16:25'),(18,4,'D18','DEPT018','','Sales & Marketing',2,'',NULL,'2017-05-26 22:17:54','2017-05-26 22:17:54'),(19,4,'D19','DEPT019','','Production Water Tank  Unit',2,'',NULL,'2017-05-26 22:18:26','2017-05-26 22:18:26'),(20,1,'D20','DEPT020','','Account',3,'',NULL,'2017-05-26 22:19:09','2017-06-05 05:09:50'),(21,1,'D21','DEPT021','','Admin',3,'',NULL,'2017-05-26 22:19:31','2017-05-26 22:19:31'),(22,1,'D22','DEPT022','','Production Electronic Assembly',2,'',NULL,'2017-05-26 22:20:00','2017-05-26 22:20:00'),(23,1,'D23','DEPT023','','Engineering',3,'',NULL,'2017-05-26 22:22:16','2017-05-26 22:22:16'),(24,1,'D24','DEPT024','','Human Resource Management',3,'',NULL,'2017-05-26 22:22:45','2017-06-05 05:11:20'),(25,1,'D25','DEPT025','','IT',3,'',NULL,'2017-05-26 22:23:06','2017-05-26 22:23:06'),(26,1,'D26','DEPT026','','Purchase',3,'',NULL,'2017-05-26 22:23:55','2017-05-26 22:23:55'),(27,1,'D27','DEPT027','','Projects Operations',2,'',NULL,'2017-05-26 22:24:50','2017-05-26 22:24:50'),(28,1,'D28','DEPT028','','Project MIS',3,'',NULL,'2017-05-26 22:25:23','2017-05-26 22:25:23'),(29,1,'D29','DEPT029','','R & D',2,'',NULL,'2017-05-26 22:25:55','2017-06-05 05:09:07'),(30,1,'D30','DEPT030','','Sales & Marketing',2,'',NULL,'2017-05-26 22:26:14','2017-05-26 22:26:14'),(31,1,'D31','DEPT031','','Material Management',3,'',NULL,'2017-05-26 22:26:44','2017-06-05 05:04:25'),(32,5,'D32','DEPT032','','Account',3,'',NULL,'2017-05-26 22:27:13','2017-06-05 05:09:58'),(33,5,'D33','DEPT033','','Material Management',3,'',NULL,'2017-05-26 22:27:36','2017-06-05 05:04:37'),(34,5,'D34','DEPT034','','Projects Operations',2,'',NULL,'2017-05-26 22:27:53','2017-05-26 22:27:53'),(35,5,'D35','DEPT035','','Project MIS',3,'',NULL,'2017-05-26 22:28:16','2017-05-26 22:28:16'),(36,5,'D36','DEPT036','','Sales & Marketing',2,'',NULL,'2017-05-26 22:28:42','2017-05-26 22:28:42'),(37,6,'D37','DEPT037','','Production Fabrication',3,'',NULL,'2017-05-26 22:29:14','2017-05-26 22:29:14'),(38,6,'D38','DEPT038','','Admin',3,'',NULL,'2017-05-26 22:29:33','2017-05-26 22:29:33'),(39,6,'D39','DEPT039','','Human Resource Management',3,'',NULL,'2017-05-26 22:29:56','2017-06-05 05:11:30'),(40,6,'D40','DEPT040','','Material Management',3,'',NULL,'2017-05-26 22:30:12','2017-06-05 05:04:45'),(41,7,'D41','DEPT041','','Account',3,'',NULL,'2017-05-26 22:30:30','2017-06-05 05:10:14'),(42,7,'D42','DEPT042','','Material Management',3,'',NULL,'2017-05-26 22:30:56','2017-06-05 05:04:54'),(43,1,'D43','DEPT043','','Pump Division',2,'',NULL,'2017-05-26 22:31:14','2017-06-05 05:08:06'),(44,7,'D44','DEPT044','','Project MIS',3,'',NULL,'2017-05-26 22:31:36','2017-05-26 22:31:36'),(45,7,'D45','DEPT045','','Sales & Marketing',2,'',NULL,'2017-05-26 22:31:58','2017-05-26 22:31:58'),(46,8,'D46','DEPT046','','Projects Operations',2,'',NULL,'2017-06-07 09:14:50','2017-06-07 09:14:50'),(47,7,'D47','DEPT047','','Projects Operations',2,'',NULL,'2017-06-07 09:17:31','2017-06-07 09:17:31');
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
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(2,1,NULL,'Port Blair','2017-05-26 21:09:52','2017-05-26 21:09:52'),(3,1,NULL,'Sawi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(4,2,NULL,'Akividu','2017-05-26 21:09:52','2017-05-26 21:09:52'),(5,2,NULL,'Amalapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(6,2,NULL,'Anantapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(7,2,NULL,'Andra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(8,2,NULL,'Avanigadda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(9,2,NULL,'Bapatla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(10,2,NULL,'Bhimavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(11,2,NULL,'Bobbili','2017-05-26 21:09:52','2017-05-26 21:09:52'),(12,2,NULL,'Chirala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(13,2,NULL,'Chittoor','2017-05-26 21:09:52','2017-05-26 21:09:52'),(14,2,NULL,'Cumbum','2017-05-26 21:09:52','2017-05-26 21:09:52'),(15,2,NULL,'Darsi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(16,2,NULL,'Dhone','2017-05-26 21:09:52','2017-05-26 21:09:52'),(17,2,NULL,'Eluru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(18,2,NULL,'Gampalagudem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(19,2,NULL,'Gannavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(20,2,NULL,'Gorantla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(21,2,NULL,'Gudivada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(22,2,NULL,'Guntur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(23,2,NULL,'Kadapa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(24,2,NULL,'Kakinada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(25,2,NULL,'Kanigiri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(26,2,NULL,'Kavali','2017-05-26 21:09:52','2017-05-26 21:09:52'),(27,2,NULL,'Kovvur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(28,2,NULL,'Kuppam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(29,2,NULL,'Kurnool','2017-05-26 21:09:52','2017-05-26 21:09:52'),(30,2,NULL,'Machilipatnam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(31,2,NULL,'Madanapalle','2017-05-26 21:09:52','2017-05-26 21:09:52'),(32,2,NULL,'Mahal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(33,2,NULL,'Mandapeta','2017-05-26 21:09:52','2017-05-26 21:09:52'),(34,2,NULL,'Mangalagiri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(35,2,NULL,'Markapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(36,2,NULL,'Medarametla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(37,2,NULL,'Muddanuru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(38,2,NULL,'Nagari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(39,2,NULL,'Nandigama','2017-05-26 21:09:52','2017-05-26 21:09:52'),(40,2,NULL,'Nandyal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(41,2,NULL,'Narasaraopet','2017-05-26 21:09:52','2017-05-26 21:09:52'),(42,2,NULL,'Nellore','2017-05-26 21:09:52','2017-05-26 21:09:52'),(43,2,NULL,'Nuzvid','2017-05-26 21:09:52','2017-05-26 21:09:52'),(44,2,NULL,'Ongole','2017-05-26 21:09:52','2017-05-26 21:09:52'),(45,2,NULL,'Pakala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(46,2,NULL,'Peddapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(47,2,NULL,'Piduguralla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(48,2,NULL,'Pileru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(49,2,NULL,'Pithapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(50,2,NULL,'Proddatur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(51,2,NULL,'Puttur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(52,2,NULL,'Rajahmundry','2017-05-26 21:09:52','2017-05-26 21:09:52'),(53,2,NULL,'Ramapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(54,2,NULL,'Ramavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(55,2,NULL,'Singarayakonda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(56,2,NULL,'Srikakulam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(57,2,NULL,'Tadepallegudem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(58,2,NULL,'Tanuku','2017-05-26 21:09:52','2017-05-26 21:09:52'),(59,2,NULL,'Thenali','2017-05-26 21:09:52','2017-05-26 21:09:52'),(60,2,NULL,'Tirumala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(61,2,NULL,'Tirumala - Tirupati','2017-05-26 21:09:52','2017-05-26 21:09:52'),(62,2,NULL,'Vijayawada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(63,2,NULL,'Vinukonda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(64,2,NULL,'Visakhapatnam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(65,2,NULL,'Vizianagaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(66,2,NULL,'Yanam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(67,3,NULL,'Hong','2017-05-26 21:09:52','2017-05-26 21:09:52'),(68,3,NULL,'Itanagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(69,4,NULL,'Arunachal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(70,4,NULL,'Barpeta','2017-05-26 21:09:52','2017-05-26 21:09:52'),(71,4,NULL,'Bhandari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(72,4,NULL,'Dhubri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(73,4,NULL,'Dibrugarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(74,4,NULL,'Golaghat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(75,4,NULL,'Goshaingaon','2017-05-26 21:09:52','2017-05-26 21:09:52'),(76,4,NULL,'Guwahati','2017-05-26 21:09:52','2017-05-26 21:09:52'),(77,4,NULL,'Jorhat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(78,4,NULL,'Karimganj','2017-05-26 21:09:52','2017-05-26 21:09:52'),(79,4,NULL,'Kokrajhar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(80,4,NULL,'Lala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(81,4,NULL,'Nalbari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(82,4,NULL,'Namrup','2017-05-26 21:09:52','2017-05-26 21:09:52'),(83,4,NULL,'Nazira','2017-05-26 21:09:52','2017-05-26 21:09:52'),(84,4,NULL,'North Lakhimpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(85,4,NULL,'Powai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(86,4,NULL,'Sibsagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(87,4,NULL,'Silchar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(88,4,NULL,'Tezpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(89,4,NULL,'Tinsukia','2017-05-26 21:09:52','2017-05-26 21:09:52'),(90,4,NULL,'Ulubari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(91,5,NULL,'Banka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(92,5,NULL,'Begusarai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(93,5,NULL,'Bhagalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(94,5,NULL,'Bhawanipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(95,5,NULL,'Bihar Sharif','2017-05-26 21:09:52','2017-05-26 21:09:52'),(96,5,NULL,'Chandan','2017-05-26 21:09:52','2017-05-26 21:09:52'),(97,5,NULL,'Darbhanga','2017-05-26 21:09:52','2017-05-26 21:09:52'),(98,5,NULL,'Dhaka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(99,5,NULL,'Gaya','2017-05-26 21:09:52','2017-05-26 21:09:52'),(100,5,NULL,'Jaynagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(101,5,NULL,'Jha Jha','2017-05-26 21:09:52','2017-05-26 21:09:52'),(102,5,NULL,'Kamat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(103,5,NULL,'Motihari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(104,5,NULL,'Munger','2017-05-26 21:09:52','2017-05-26 21:09:52'),(105,5,NULL,'Muzaffarpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(106,5,NULL,'Patna','2017-05-26 21:09:52','2017-05-26 21:09:52'),(107,5,NULL,'Purnea','2017-05-26 21:09:52','2017-05-26 21:09:52'),(108,5,NULL,'Pusa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(109,5,NULL,'Raxaul','2017-05-26 21:09:52','2017-05-26 21:09:52'),(110,5,NULL,'Sakri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(111,5,NULL,'Samastipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(112,6,NULL,'Chandigarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(113,7,NULL,'Ambikapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(114,7,NULL,'Bemetara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(115,7,NULL,'Bhatapara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(116,7,NULL,'Bhilai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(117,7,NULL,'Bilaspur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(118,7,NULL,'Champa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(119,7,NULL,'Dhamtari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(120,7,NULL,'Durg','2017-05-26 21:09:52','2017-05-26 21:09:52'),(121,7,NULL,'Jagdalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(122,7,NULL,'Janjgir','2017-05-26 21:09:52','2017-05-26 21:09:52'),(123,7,NULL,'Koni','2017-05-26 21:09:52','2017-05-26 21:09:52'),(124,7,NULL,'Korba','2017-05-26 21:09:52','2017-05-26 21:09:52'),(125,7,NULL,'Kumhari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(126,7,NULL,'Lanka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(127,7,NULL,'Mohala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(128,7,NULL,'Raigarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(129,7,NULL,'Raipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(130,7,NULL,'Sukma','2017-05-26 21:09:52','2017-05-26 21:09:52'),(131,8,NULL,'Daman','2017-05-26 21:09:52','2017-05-26 21:09:52'),(132,9,NULL,'Alipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(133,9,NULL,'Bawana','2017-05-26 21:09:52','2017-05-26 21:09:52'),(134,9,NULL,'Connaught Place','2017-05-26 21:09:52','2017-05-26 21:09:52'),(135,9,NULL,'Delhi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(136,9,NULL,'Kalkaji Devi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(137,9,NULL,'Narela','2017-05-26 21:09:52','2017-05-26 21:09:52'),(138,9,NULL,'New Delhi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(139,9,NULL,'Shahdara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(140,10,NULL,'Amal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(141,10,NULL,'Silvassa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(142,11,NULL,'Aldona','2017-05-26 21:09:52','2017-05-26 21:09:52'),(143,11,NULL,'Arpora','2017-05-26 21:09:52','2017-05-26 21:09:52'),(144,11,NULL,'Assagao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(145,11,NULL,'Bambolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(146,11,NULL,'Betalbatim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(147,11,NULL,'Betim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(148,11,NULL,'Calangute','2017-05-26 21:09:52','2017-05-26 21:09:52'),(149,11,NULL,'Candolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(150,11,NULL,'Caranzalem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(151,11,NULL,'Chicalim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(152,11,NULL,'Cuncolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(153,11,NULL,'Curchorem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(154,11,NULL,'Dicholi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(155,11,NULL,'Dona Paula','2017-05-26 21:09:52','2017-05-26 21:09:52'),(156,11,NULL,'Goa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(157,11,NULL,'Madgaon','2017-05-26 21:09:52','2017-05-26 21:09:52'),(158,11,NULL,'Marmagao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(159,11,NULL,'Navelim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(160,11,NULL,'Panjim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(161,11,NULL,'Parra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(162,11,NULL,'Ponda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(163,11,NULL,'Quepem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(164,11,NULL,'Saligao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(165,11,NULL,'Sanquelim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(166,11,NULL,'Solim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(167,11,NULL,'Vainguinim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(168,11,NULL,'Vasco','2017-05-26 21:09:52','2017-05-26 21:09:52'),(169,11,NULL,'Verna','2017-05-26 21:09:52','2017-05-26 21:09:52'),(170,12,NULL,'Ahmedabad','2017-05-26 21:09:52','2017-05-26 21:09:52'),(171,12,NULL,'Amreli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(172,12,NULL,'Amroli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(173,12,NULL,'Anand','2017-05-26 21:09:52','2017-05-26 21:09:52'),(174,12,NULL,'Ankleshwar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(175,12,NULL,'Antapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(176,12,NULL,'Bardoli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(177,12,NULL,'Basu','2017-05-26 21:09:52','2017-05-26 21:09:52'),(178,12,NULL,'Bhadath','2017-05-26 21:09:52','2017-05-26 21:09:52'),(179,12,NULL,'Bharuch','2017-05-26 21:09:52','2017-05-26 21:09:52'),(180,12,NULL,'Bhavnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(181,12,NULL,'Bhuj','2017-05-26 21:09:52','2017-05-26 21:09:52'),(182,12,NULL,'Bilimora','2017-05-26 21:09:52','2017-05-26 21:09:52'),(183,12,NULL,'Chhota Udepur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(184,12,NULL,'Dahod','2017-05-26 21:09:52','2017-05-26 21:09:52'),(185,12,NULL,'Dewan','2017-05-26 21:09:52','2017-05-26 21:09:52'),(186,12,NULL,'Dhansura','2017-05-26 21:09:52','2017-05-26 21:09:52'),(187,12,NULL,'Dhrol','2017-05-26 21:09:52','2017-05-26 21:09:52'),(188,12,NULL,'Dwarka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(189,12,NULL,'Gandhidham','2017-05-26 21:09:52','2017-05-26 21:09:52'),(190,12,NULL,'Gandhinagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(191,12,NULL,'Ghana','2017-05-26 21:09:52','2017-05-26 21:09:52'),(192,12,NULL,'Godhra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(193,12,NULL,'Himatnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(194,12,NULL,'Jalalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(195,12,NULL,'Jamnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(196,12,NULL,'Junagadh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(197,12,NULL,'Kalol','2017-05-26 21:09:53','2017-05-26 21:09:53'),(198,12,NULL,'Karamsad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(199,12,NULL,'Keshod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(200,12,NULL,'Khambhat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(201,12,NULL,'Kheda','2017-05-26 21:09:53','2017-05-26 21:09:53'),(202,12,NULL,'Khergam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(203,12,NULL,'Kosamba','2017-05-26 21:09:53','2017-05-26 21:09:53'),(204,12,NULL,'Mahesana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(205,12,NULL,'Malpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(206,12,NULL,'Mandvi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(207,12,NULL,'Matar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(208,12,NULL,'Mithapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(209,12,NULL,'Modasa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(210,12,NULL,'Morvi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(211,12,NULL,'Mundra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(212,12,NULL,'Nadiad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(213,12,NULL,'Nagwa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(214,12,NULL,'Navsari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(215,12,NULL,'Patan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(216,12,NULL,'Petlad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(217,12,NULL,'Porbandar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(218,12,NULL,'Rajkot','2017-05-26 21:09:53','2017-05-26 21:09:53'),(219,12,NULL,'Rander','2017-05-26 21:09:53','2017-05-26 21:09:53'),(220,12,NULL,'Rawal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(221,12,NULL,'Sachin','2017-05-26 21:09:53','2017-05-26 21:09:53'),(222,12,NULL,'Sami','2017-05-26 21:09:53','2017-05-26 21:09:53'),(223,12,NULL,'Sanand','2017-05-26 21:09:53','2017-05-26 21:09:53'),(224,12,NULL,'Somnath','2017-05-26 21:09:53','2017-05-26 21:09:53'),(225,12,NULL,'Surendranagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(226,12,NULL,'Thasra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(227,12,NULL,'Vadodara','2017-05-26 21:09:53','2017-05-26 21:09:53'),(228,12,NULL,'Vadodra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(229,12,NULL,'Valsad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(230,12,NULL,'Vapi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(231,12,NULL,'Vijapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(232,12,NULL,'Visnagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(233,13,NULL,'Bhawan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(234,13,NULL,'Bilaspur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(235,13,NULL,'Chamba','2017-05-26 21:09:53','2017-05-26 21:09:53'),(236,13,NULL,'Dharamsala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(237,13,NULL,'Dharmpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(238,13,NULL,'Hamirpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(239,13,NULL,'Hari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(240,13,NULL,'Kalka','2017-05-26 21:09:53','2017-05-26 21:09:53'),(241,13,NULL,'Kangra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(242,13,NULL,'Kumar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(243,13,NULL,'Manali','2017-05-26 21:09:53','2017-05-26 21:09:53'),(244,13,NULL,'Mandi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(245,13,NULL,'Mani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(246,13,NULL,'Mashobra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(247,13,NULL,'Nalagarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(248,13,NULL,'Nehra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(249,13,NULL,'Nurpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(250,13,NULL,'Palampur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(251,13,NULL,'Paonta Sahib','2017-05-26 21:09:53','2017-05-26 21:09:53'),(252,13,NULL,'Shimla','2017-05-26 21:09:53','2017-05-26 21:09:53'),(253,13,NULL,'Solan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(254,14,NULL,'Ambala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(255,14,NULL,'Aurangabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(256,14,NULL,'Bahadurgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(257,14,NULL,'Ballabgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(258,14,NULL,'Bhiwani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(259,14,NULL,'Budha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(260,14,NULL,'Chhachhrauli','2017-05-26 21:09:53','2017-05-26 21:09:53'),(261,14,NULL,'Faridabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(262,14,NULL,'Fatehabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(263,14,NULL,'Ganga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(264,14,NULL,'Gohana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(265,14,NULL,'Gurgaon','2017-05-26 21:09:53','2017-05-26 21:09:53'),(266,14,NULL,'Hansi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(267,14,NULL,'Haryana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(268,14,NULL,'Hisar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(269,14,NULL,'Indraprast','2017-05-26 21:09:53','2017-05-26 21:09:53'),(270,14,NULL,'Jhajjar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(271,14,NULL,'Jind','2017-05-26 21:09:53','2017-05-26 21:09:53'),(272,14,NULL,'Kaithal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(273,14,NULL,'Kalra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(274,14,NULL,'Karnal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(275,14,NULL,'Kaul','2017-05-26 21:09:53','2017-05-26 21:09:53'),(276,14,NULL,'Kotian','2017-05-26 21:09:53','2017-05-26 21:09:53'),(277,14,NULL,'Ladwa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(278,14,NULL,'Narnaul','2017-05-26 21:09:53','2017-05-26 21:09:53'),(279,14,NULL,'Nilokheri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(280,14,NULL,'Odhan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(281,14,NULL,'Palwal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(282,14,NULL,'Panipat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(283,14,NULL,'Pehowa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(284,14,NULL,'Rewari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(285,14,NULL,'Rohtak','2017-05-26 21:09:53','2017-05-26 21:09:53'),(286,14,NULL,'Saha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(287,14,NULL,'Shahabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(288,14,NULL,'Sirsa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(289,14,NULL,'Sodhi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(290,14,NULL,'Sonipat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(291,14,NULL,'Tohana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(292,14,NULL,'Yamunanagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(293,15,NULL,'Bokaro','2017-05-26 21:09:53','2017-05-26 21:09:53'),(294,15,NULL,'Dhanbad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(295,15,NULL,'Dumka','2017-05-26 21:09:53','2017-05-26 21:09:53'),(296,15,NULL,'Hazaribagh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(297,15,NULL,'Jamshedpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(298,15,NULL,'Mahulia','2017-05-26 21:09:53','2017-05-26 21:09:53'),(299,15,NULL,'Ramgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(300,15,NULL,'Ranchi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(301,16,NULL,'Anantnag','2017-05-26 21:09:53','2017-05-26 21:09:53'),(302,16,NULL,'Arch','2017-05-26 21:09:53','2017-05-26 21:09:53'),(303,16,NULL,'Bala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(304,16,NULL,'Bawan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(305,16,NULL,'Gold','2017-05-26 21:09:53','2017-05-26 21:09:53'),(306,16,NULL,'Jammu','2017-05-26 21:09:53','2017-05-26 21:09:53'),(307,16,NULL,'Kargil','2017-05-26 21:09:53','2017-05-26 21:09:53'),(308,16,NULL,'Kathua','2017-05-26 21:09:53','2017-05-26 21:09:53'),(309,16,NULL,'Katra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(310,16,NULL,'Kundan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(311,16,NULL,'Markal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(312,16,NULL,'Nila','2017-05-26 21:09:53','2017-05-26 21:09:53'),(313,16,NULL,'Pahalgam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(314,16,NULL,'Patel','2017-05-26 21:09:53','2017-05-26 21:09:53'),(315,16,NULL,'Raju','2017-05-26 21:09:53','2017-05-26 21:09:53'),(316,16,NULL,'Ranjan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(317,16,NULL,'Ring','2017-05-26 21:09:53','2017-05-26 21:09:53'),(318,16,NULL,'Srinagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(319,16,NULL,'Suman','2017-05-26 21:09:53','2017-05-26 21:09:53'),(320,17,NULL,'Bagalkot','2017-05-26 21:09:53','2017-05-26 21:09:53'),(321,17,NULL,'Bangalore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(322,17,NULL,'Belgaum','2017-05-26 21:09:53','2017-05-26 21:09:53'),(323,17,NULL,'Bellare','2017-05-26 21:09:53','2017-05-26 21:09:53'),(324,17,NULL,'Bellary','2017-05-26 21:09:53','2017-05-26 21:09:53'),(325,17,NULL,'Bhadravati','2017-05-26 21:09:53','2017-05-26 21:09:53'),(326,17,NULL,'Bhatkal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(327,17,NULL,'Bidar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(328,17,NULL,'Bijapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(329,17,NULL,'Channapatna','2017-05-26 21:09:53','2017-05-26 21:09:53'),(330,17,NULL,'Chikmagalūr','2017-05-26 21:09:53','2017-05-26 21:09:53'),(331,17,NULL,'Chikodi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(332,17,NULL,'Chintamani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(333,17,NULL,'Chitradurga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(334,17,NULL,'Davangere','2017-05-26 21:09:53','2017-05-26 21:09:53'),(335,17,NULL,'Dharwad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(336,17,NULL,'Gadag','2017-05-26 21:09:53','2017-05-26 21:09:53'),(337,17,NULL,'Gulbarga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(338,17,NULL,'Hadadi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(339,17,NULL,'Hassan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(340,17,NULL,'Haveri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(341,17,NULL,'Hira','2017-05-26 21:09:53','2017-05-26 21:09:53'),(342,17,NULL,'Hiriyur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(343,17,NULL,'Honavar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(344,17,NULL,'Hospet','2017-05-26 21:09:53','2017-05-26 21:09:53'),(345,17,NULL,'Hubli','2017-05-26 21:09:53','2017-05-26 21:09:53'),(346,17,NULL,'Karwar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(347,17,NULL,'Kolar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(348,17,NULL,'Kollegal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(349,17,NULL,'Koppal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(350,17,NULL,'Kushalnagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(351,17,NULL,'Madikeri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(352,17,NULL,'Mandya','2017-05-26 21:09:53','2017-05-26 21:09:53'),(353,17,NULL,'Mangalore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(354,17,NULL,'Manipala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(355,17,NULL,'Mundgod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(356,17,NULL,'Mysore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(357,17,NULL,'Nandi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(358,17,NULL,'Puttur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(359,17,NULL,'Raichur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(360,17,NULL,'Ramanagaram','2017-05-26 21:09:53','2017-05-26 21:09:53'),(361,17,NULL,'Sagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(362,17,NULL,'Sandur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(363,17,NULL,'Sangam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(364,17,NULL,'Shanti Grama','2017-05-26 21:09:53','2017-05-26 21:09:53'),(365,17,NULL,'Shimoga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(366,17,NULL,'Sirsi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(367,17,NULL,'Siruguppa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(368,17,NULL,'Someshwar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(369,17,NULL,'Tiptur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(370,17,NULL,'Tumkūr','2017-05-26 21:09:53','2017-05-26 21:09:53'),(371,17,NULL,'Udupi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(372,17,NULL,'Yadgir','2017-05-26 21:09:53','2017-05-26 21:09:53'),(373,18,NULL,'Alanallur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(374,18,NULL,'Alappuzha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(375,18,NULL,'Aluva','2017-05-26 21:09:53','2017-05-26 21:09:53'),(376,18,NULL,'Anchal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(377,18,NULL,'Angadipuram','2017-05-26 21:09:53','2017-05-26 21:09:53'),(378,18,NULL,'Aranmula','2017-05-26 21:09:53','2017-05-26 21:09:53'),(379,18,NULL,'Attingal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(380,18,NULL,'Changanacheri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(381,18,NULL,'Chengannur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(382,18,NULL,'Chittur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(383,18,NULL,'Edavanna','2017-05-26 21:09:53','2017-05-26 21:09:53'),(384,18,NULL,'Ernakulam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(385,18,NULL,'Guruvayur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(386,18,NULL,'Idukki','2017-05-26 21:09:53','2017-05-26 21:09:53'),(387,18,NULL,'Irinjalakuda','2017-05-26 21:09:53','2017-05-26 21:09:53'),(388,18,NULL,'Kaladi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(389,18,NULL,'Kalpetta','2017-05-26 21:09:53','2017-05-26 21:09:53'),(390,18,NULL,'Kanhangad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(391,18,NULL,'Kannur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(392,18,NULL,'Kasaragod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(393,18,NULL,'Kayamkulam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(394,18,NULL,'Kochi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(395,18,NULL,'Kodungallur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(396,18,NULL,'Kollam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(397,18,NULL,'Koni','2017-05-26 21:09:53','2017-05-26 21:09:53'),(398,18,NULL,'Kottakkal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(399,18,NULL,'Kottarakara','2017-05-26 21:09:53','2017-05-26 21:09:53'),(400,18,NULL,'Kottayam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(401,18,NULL,'Kozhikode','2017-05-26 21:09:54','2017-05-26 21:09:54'),(402,18,NULL,'Malappuram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(403,18,NULL,'Manjeri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(404,18,NULL,'Mattanur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(405,18,NULL,'Mavelikara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(406,18,NULL,'Nilambur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(407,18,NULL,'Ottappalam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(408,18,NULL,'Palakkad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(409,18,NULL,'Palayam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(410,18,NULL,'Parappanangadi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(411,18,NULL,'Paravur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(412,18,NULL,'Pathanamthitta','2017-05-26 21:09:54','2017-05-26 21:09:54'),(413,18,NULL,'Pattambi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(414,18,NULL,'Payyanur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(415,18,NULL,'Ponnani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(416,18,NULL,'Punalur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(417,18,NULL,'Shoranur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(418,18,NULL,'Sultans Battery','2017-05-26 21:09:54','2017-05-26 21:09:54'),(419,18,NULL,'Thalassery','2017-05-26 21:09:54','2017-05-26 21:09:54'),(420,18,NULL,'Thiruvananthapuram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(421,18,NULL,'Thrissur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(422,18,NULL,'Tirur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(423,18,NULL,'Tiruvalla','2017-05-26 21:09:54','2017-05-26 21:09:54'),(424,18,NULL,'Vaikam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(425,18,NULL,'Vazhakulam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(426,19,NULL,'Kavaratti','2017-05-26 21:09:54','2017-05-26 21:09:54'),(427,20,NULL,'Abdul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(428,20,NULL,'Ahmednagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(429,20,NULL,'Akola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(430,20,NULL,'Alibag','2017-05-26 21:09:54','2017-05-26 21:09:54'),(431,20,NULL,'Ambad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(432,20,NULL,'Ambarnath','2017-05-26 21:09:54','2017-05-26 21:09:54'),(433,20,NULL,'Amravati','2017-05-26 21:09:54','2017-05-26 21:09:54'),(434,20,NULL,'Andheri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(435,20,NULL,'Arvi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(436,20,NULL,'Aundh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(437,20,NULL,'Aurangabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(438,20,NULL,'Badlapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(439,20,NULL,'Bandra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(440,20,NULL,'Baramati','2017-05-26 21:09:54','2017-05-26 21:09:54'),(441,20,NULL,'Belapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(442,20,NULL,'Bhandup','2017-05-26 21:09:54','2017-05-26 21:09:54'),(443,20,NULL,'Bhiwandi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(444,20,NULL,'Bhusawal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(445,20,NULL,'Boisar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(446,20,NULL,'Chakan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(447,20,NULL,'Chalisgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(448,20,NULL,'Chandrapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(449,20,NULL,'Charan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(450,20,NULL,'Chinchvad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(451,20,NULL,'Chiplun','2017-05-26 21:09:54','2017-05-26 21:09:54'),(452,20,NULL,'Chopda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(453,20,NULL,'Colaba','2017-05-26 21:09:54','2017-05-26 21:09:54'),(454,20,NULL,'Dahanu','2017-05-26 21:09:54','2017-05-26 21:09:54'),(455,20,NULL,'Deolali','2017-05-26 21:09:54','2017-05-26 21:09:54'),(456,20,NULL,'Devgarh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(457,20,NULL,'Dharavi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(458,20,NULL,'Dhule','2017-05-26 21:09:54','2017-05-26 21:09:54'),(459,20,NULL,'Ellora Caves','2017-05-26 21:09:54','2017-05-26 21:09:54'),(460,20,NULL,'Gargoti','2017-05-26 21:09:54','2017-05-26 21:09:54'),(461,20,NULL,'Ghatkopar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(462,20,NULL,'Goregaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(463,20,NULL,'Hinganghat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(464,20,NULL,'Hingoli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(465,20,NULL,'Ichalkaranji','2017-05-26 21:09:54','2017-05-26 21:09:54'),(466,20,NULL,'Igatpuri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(467,20,NULL,'Jalgaon Jamod','2017-05-26 21:09:54','2017-05-26 21:09:54'),(468,20,NULL,'Jalna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(469,20,NULL,'Kagal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(470,20,NULL,'Kalam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(471,20,NULL,'Kalamboli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(472,20,NULL,'Kalyan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(473,20,NULL,'Kankauli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(474,20,NULL,'Karad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(475,20,NULL,'Karanja','2017-05-26 21:09:54','2017-05-26 21:09:54'),(476,20,NULL,'Karjat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(477,20,NULL,'Khalapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(478,20,NULL,'Khopoli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(479,20,NULL,'Kolhapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(480,20,NULL,'Latur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(481,20,NULL,'Mahad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(482,20,NULL,'Mahim','2017-05-26 21:09:54','2017-05-26 21:09:54'),(483,20,NULL,'Mangaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(484,20,NULL,'Manor','2017-05-26 21:09:54','2017-05-26 21:09:54'),(485,20,NULL,'Miraj','2017-05-26 21:09:54','2017-05-26 21:09:54'),(486,20,NULL,'Mumbai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(487,20,NULL,'Nadgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(488,20,NULL,'Nagpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(489,20,NULL,'Nanded','2017-05-26 21:09:54','2017-05-26 21:09:54'),(490,20,NULL,'Nandurbar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(491,20,NULL,'Narayangaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(492,20,NULL,'Nashik','2017-05-26 21:09:54','2017-05-26 21:09:54'),(493,20,NULL,'Neral','2017-05-26 21:09:54','2017-05-26 21:09:54'),(494,20,NULL,'Neri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(495,20,NULL,'Osmanabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(496,20,NULL,'Palghar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(497,20,NULL,'Palus','2017-05-26 21:09:54','2017-05-26 21:09:54'),(498,20,NULL,'Panchgani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(499,20,NULL,'Pandharpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(500,20,NULL,'Panvel','2017-05-26 21:09:54','2017-05-26 21:09:54'),(501,20,NULL,'Parbhani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(502,20,NULL,'Parel','2017-05-26 21:09:54','2017-05-26 21:09:54'),(503,20,NULL,'Pimpri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(504,20,NULL,'Pune','2017-05-26 21:09:54','2017-05-26 21:09:54'),(505,20,NULL,'Puras','2017-05-26 21:09:54','2017-05-26 21:09:54'),(506,20,NULL,'Ratnagiri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(507,20,NULL,'Sakri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(508,20,NULL,'Sangamner','2017-05-26 21:09:54','2017-05-26 21:09:54'),(509,20,NULL,'Sangli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(510,20,NULL,'Sangola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(511,20,NULL,'Satara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(512,20,NULL,'Shahapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(513,20,NULL,'Shirgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(514,20,NULL,'Shrigonda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(515,20,NULL,'Sinnar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(516,20,NULL,'Sion','2017-05-26 21:09:54','2017-05-26 21:09:54'),(517,20,NULL,'Solapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(518,20,NULL,'Sopara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(519,20,NULL,'Talegaon Dabhade','2017-05-26 21:09:54','2017-05-26 21:09:54'),(520,20,NULL,'Thane','2017-05-26 21:09:54','2017-05-26 21:09:54'),(521,20,NULL,'Trimbak','2017-05-26 21:09:54','2017-05-26 21:09:54'),(522,20,NULL,'Tuljapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(523,20,NULL,'Ulhasnagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(524,20,NULL,'Umred','2017-05-26 21:09:54','2017-05-26 21:09:54'),(525,20,NULL,'Vadner','2017-05-26 21:09:54','2017-05-26 21:09:54'),(526,20,NULL,'Vasai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(527,20,NULL,'Vashi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(528,20,NULL,'Virar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(529,20,NULL,'Wai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(530,20,NULL,'Wardha','2017-05-26 21:09:54','2017-05-26 21:09:54'),(531,20,NULL,'Yavatmal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(532,20,NULL,'Yeola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(533,21,NULL,'Nongpoh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(534,21,NULL,'Nongstoin','2017-05-26 21:09:54','2017-05-26 21:09:54'),(535,21,NULL,'Pala','2017-05-26 21:09:54','2017-05-26 21:09:54'),(536,21,NULL,'Shillong','2017-05-26 21:09:54','2017-05-26 21:09:54'),(537,21,NULL,'Tura','2017-05-26 21:09:54','2017-05-26 21:09:54'),(538,22,NULL,'Churachandpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(539,22,NULL,'Imphal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(540,23,NULL,'Amarkantak','2017-05-26 21:09:54','2017-05-26 21:09:54'),(541,23,NULL,'Ambah','2017-05-26 21:09:54','2017-05-26 21:09:54'),(542,23,NULL,'Anantpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(543,23,NULL,'Bagh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(544,23,NULL,'Balaghat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(545,23,NULL,'Baroda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(546,23,NULL,'Berasia','2017-05-26 21:09:54','2017-05-26 21:09:54'),(547,23,NULL,'Betul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(548,23,NULL,'Bhagwan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(549,23,NULL,'Bhartiya','2017-05-26 21:09:54','2017-05-26 21:09:54'),(550,23,NULL,'Bhopal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(551,23,NULL,'Chakra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(552,23,NULL,'Chand','2017-05-26 21:09:54','2017-05-26 21:09:54'),(553,23,NULL,'Chhindwara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(554,23,NULL,'Chopra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(555,23,NULL,'Damoh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(556,23,NULL,'Dewas','2017-05-26 21:09:54','2017-05-26 21:09:54'),(557,23,NULL,'Dhar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(558,23,NULL,'Dindori','2017-05-26 21:09:54','2017-05-26 21:09:54'),(559,23,NULL,'Gandhigram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(560,23,NULL,'Ganpat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(561,23,NULL,'Guna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(562,23,NULL,'Gwalior','2017-05-26 21:09:54','2017-05-26 21:09:54'),(563,23,NULL,'Hoshangabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(564,23,NULL,'Indore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(565,23,NULL,'Jabalpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(566,23,NULL,'Kailaras','2017-05-26 21:09:54','2017-05-26 21:09:54'),(567,23,NULL,'Kamalpura','2017-05-26 21:09:54','2017-05-26 21:09:54'),(568,23,NULL,'Kataria','2017-05-26 21:09:54','2017-05-26 21:09:54'),(569,23,NULL,'Katni','2017-05-26 21:09:54','2017-05-26 21:09:54'),(570,23,NULL,'Khajuraho Group of Monuments','2017-05-26 21:09:54','2017-05-26 21:09:54'),(571,23,NULL,'Khargone','2017-05-26 21:09:54','2017-05-26 21:09:54'),(572,23,NULL,'Mandla','2017-05-26 21:09:54','2017-05-26 21:09:54'),(573,23,NULL,'Mandsaur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(574,23,NULL,'Mhow','2017-05-26 21:09:54','2017-05-26 21:09:54'),(575,23,NULL,'Morena','2017-05-26 21:09:54','2017-05-26 21:09:54'),(576,23,NULL,'Nadia','2017-05-26 21:09:54','2017-05-26 21:09:54'),(577,23,NULL,'Nagara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(578,23,NULL,'Pachmarhi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(579,23,NULL,'Raipur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(580,23,NULL,'Rajapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(581,23,NULL,'Rama','2017-05-26 21:09:54','2017-05-26 21:09:54'),(582,23,NULL,'Ratlam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(583,23,NULL,'Rewa','2017-05-26 21:09:54','2017-05-26 21:09:54'),(584,23,NULL,'Sagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(585,23,NULL,'Sarangi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(586,23,NULL,'Satna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(587,23,NULL,'Sehore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(588,23,NULL,'Sendhwa','2017-05-26 21:09:54','2017-05-26 21:09:54'),(589,23,NULL,'Shahdol','2017-05-26 21:09:54','2017-05-26 21:09:54'),(590,23,NULL,'Sidhi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(591,23,NULL,'Soni','2017-05-26 21:09:54','2017-05-26 21:09:54'),(592,23,NULL,'Tala','2017-05-26 21:09:54','2017-05-26 21:09:54'),(593,23,NULL,'Ujjain','2017-05-26 21:09:54','2017-05-26 21:09:54'),(594,23,NULL,'Vidisha','2017-05-26 21:09:54','2017-05-26 21:09:54'),(595,24,NULL,'Aizawl','2017-05-26 21:09:54','2017-05-26 21:09:54'),(596,25,NULL,'Chen','2017-05-26 21:09:54','2017-05-26 21:09:54'),(597,25,NULL,'Dimapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(598,25,NULL,'Kohima','2017-05-26 21:09:54','2017-05-26 21:09:54'),(599,26,NULL,'Angul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(600,26,NULL,'Balangir','2017-05-26 21:09:54','2017-05-26 21:09:54'),(601,26,NULL,'Balasore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(602,26,NULL,'Bargarh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(603,26,NULL,'Barpali','2017-05-26 21:09:54','2017-05-26 21:09:54'),(604,26,NULL,'Bhubaneswar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(605,26,NULL,'Brahmapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(606,26,NULL,'Cuttack','2017-05-26 21:09:55','2017-05-26 21:09:55'),(607,26,NULL,'Dhenkanal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(608,26,NULL,'Jajpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(609,26,NULL,'Jatani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(610,26,NULL,'Jaypur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(611,26,NULL,'Jharsuguda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(612,26,NULL,'Kalinga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(613,26,NULL,'Khurda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(614,26,NULL,'Koraput','2017-05-26 21:09:55','2017-05-26 21:09:55'),(615,26,NULL,'Nayagarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(616,26,NULL,'Puri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(617,26,NULL,'Raurkela','2017-05-26 21:09:55','2017-05-26 21:09:55'),(618,26,NULL,'Rayagada','2017-05-26 21:09:55','2017-05-26 21:09:55'),(619,26,NULL,'Sambalpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(620,26,NULL,'Sundargarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(621,26,NULL,'Talcher','2017-05-26 21:09:55','2017-05-26 21:09:55'),(622,26,NULL,'Udaigiri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(623,27,NULL,'Amritsar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(624,27,NULL,'Banga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(625,27,NULL,'Barnala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(626,27,NULL,'Batala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(627,27,NULL,'Bhatinda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(628,27,NULL,'Dasua','2017-05-26 21:09:55','2017-05-26 21:09:55'),(629,27,NULL,'Dhariwal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(630,27,NULL,'Dhuri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(631,27,NULL,'Dinanagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(632,27,NULL,'Faridkot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(633,27,NULL,'Firozpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(634,27,NULL,'Garhshankar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(635,27,NULL,'Gurdaspur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(636,27,NULL,'Hoshiarpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(637,27,NULL,'Jagraon','2017-05-26 21:09:55','2017-05-26 21:09:55'),(638,27,NULL,'Jalalabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(639,27,NULL,'Jalandhar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(640,27,NULL,'Kapurthala Town','2017-05-26 21:09:55','2017-05-26 21:09:55'),(641,27,NULL,'Khanna','2017-05-26 21:09:55','2017-05-26 21:09:55'),(642,27,NULL,'Kharar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(643,27,NULL,'Kot Isa Khan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(644,27,NULL,'Kurali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(645,27,NULL,'Ludhiana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(646,27,NULL,'Machhiwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(647,27,NULL,'Maharaj','2017-05-26 21:09:55','2017-05-26 21:09:55'),(648,27,NULL,'Mansa','2017-05-26 21:09:55','2017-05-26 21:09:55'),(649,27,NULL,'Moga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(650,27,NULL,'Mohali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(651,27,NULL,'Morinda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(652,27,NULL,'Mukerian','2017-05-26 21:09:55','2017-05-26 21:09:55'),(653,27,NULL,'Muktsar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(654,27,NULL,'Nabha','2017-05-26 21:09:55','2017-05-26 21:09:55'),(655,27,NULL,'Pathankot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(656,27,NULL,'Patiala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(657,27,NULL,'Phagwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(658,27,NULL,'Rajpura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(659,27,NULL,'Rupnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(660,27,NULL,'Sangrur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(661,27,NULL,'Shahkot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(662,27,NULL,'Sirhind','2017-05-26 21:09:55','2017-05-26 21:09:55'),(663,27,NULL,'Sunam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(664,27,NULL,'Talwandi Sabo','2017-05-26 21:09:55','2017-05-26 21:09:55'),(665,27,NULL,'Tarn Taran','2017-05-26 21:09:55','2017-05-26 21:09:55'),(666,28,NULL,'Karaikal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(667,28,NULL,'Puducherry','2017-05-26 21:09:55','2017-05-26 21:09:55'),(668,29,NULL,'Ajmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(669,29,NULL,'Alwar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(670,29,NULL,'Amer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(671,29,NULL,'Amet','2017-05-26 21:09:55','2017-05-26 21:09:55'),(672,29,NULL,'Balana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(673,29,NULL,'Bali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(674,29,NULL,'Banswara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(675,29,NULL,'Barmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(676,29,NULL,'Beawar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(677,29,NULL,'Bharatpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(678,29,NULL,'Bhilwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(679,29,NULL,'Bikaner','2017-05-26 21:09:55','2017-05-26 21:09:55'),(680,29,NULL,'Binavas','2017-05-26 21:09:55','2017-05-26 21:09:55'),(681,29,NULL,'Bundi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(682,29,NULL,'Charu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(683,29,NULL,'Chetan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(684,29,NULL,'Chhabra','2017-05-26 21:09:55','2017-05-26 21:09:55'),(685,29,NULL,'Dipas','2017-05-26 21:09:55','2017-05-26 21:09:55'),(686,29,NULL,'Ganganagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(687,29,NULL,'Gangapur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(688,29,NULL,'Gangrar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(689,29,NULL,'Jaipur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(690,29,NULL,'Jaisalmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(691,29,NULL,'Jhalawar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(692,29,NULL,'Jhunjhunun','2017-05-26 21:09:55','2017-05-26 21:09:55'),(693,29,NULL,'Jodhpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(694,29,NULL,'Kalan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(695,29,NULL,'Kanakpura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(696,29,NULL,'Khan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(697,29,NULL,'Khinwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(698,29,NULL,'Kishangarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(699,29,NULL,'Kolayat','2017-05-26 21:09:55','2017-05-26 21:09:55'),(700,29,NULL,'Kota','2017-05-26 21:09:55','2017-05-26 21:09:55'),(701,29,NULL,'Lamba Harisingh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(702,29,NULL,'Mahajan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(703,29,NULL,'Mahatma','2017-05-26 21:09:55','2017-05-26 21:09:55'),(704,29,NULL,'Mandal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(705,29,NULL,'Manna','2017-05-26 21:09:55','2017-05-26 21:09:55'),(706,29,NULL,'Mount Abu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(707,29,NULL,'Nagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(708,29,NULL,'Nagaur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(709,29,NULL,'Nanda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(710,29,NULL,'Naraina','2017-05-26 21:09:55','2017-05-26 21:09:55'),(711,29,NULL,'Nathdwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(712,29,NULL,'Pali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(713,29,NULL,'Pilani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(714,29,NULL,'Pitampura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(715,29,NULL,'Pushkar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(716,29,NULL,'Rana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(717,29,NULL,'Roshan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(718,29,NULL,'Shiv','2017-05-26 21:09:55','2017-05-26 21:09:55'),(719,29,NULL,'Sikar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(720,29,NULL,'Sirohi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(721,29,NULL,'Sojat','2017-05-26 21:09:55','2017-05-26 21:09:55'),(722,29,NULL,'Sultan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(723,29,NULL,'Surana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(724,29,NULL,'Suratgarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(725,29,NULL,'Thali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(726,29,NULL,'Tonk','2017-05-26 21:09:55','2017-05-26 21:09:55'),(727,29,NULL,'Udaipur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(728,30,NULL,'Gangtok','2017-05-26 21:09:55','2017-05-26 21:09:55'),(729,30,NULL,'Manu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(730,30,NULL,'Singtam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(731,30,NULL,'Sirwani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(732,31,NULL,'Adilabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(733,31,NULL,'Balanagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(734,31,NULL,'Bhongir','2017-05-26 21:09:55','2017-05-26 21:09:55'),(735,31,NULL,'Bodhan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(736,31,NULL,'Gudur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(737,31,NULL,'Hyderabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(738,31,NULL,'Karimnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(739,31,NULL,'Khammam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(740,31,NULL,'Kottagudem','2017-05-26 21:09:55','2017-05-26 21:09:55'),(741,31,NULL,'Mancherial','2017-05-26 21:09:55','2017-05-26 21:09:55'),(742,31,NULL,'Medak','2017-05-26 21:09:55','2017-05-26 21:09:55'),(743,31,NULL,'Medchal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(744,31,NULL,'Nalgonda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(745,31,NULL,'Narsapur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(746,31,NULL,'Nizamabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(747,31,NULL,'Paloncha','2017-05-26 21:09:55','2017-05-26 21:09:55'),(748,31,NULL,'Patancheru','2017-05-26 21:09:55','2017-05-26 21:09:55'),(749,31,NULL,'Patelguda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(750,31,NULL,'Pochampalli','2017-05-26 21:09:55','2017-05-26 21:09:55'),(751,31,NULL,'Secunderabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(752,31,NULL,'Shadnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(753,31,NULL,'Suriapet','2017-05-26 21:09:55','2017-05-26 21:09:55'),(754,31,NULL,'Uppal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(755,31,NULL,'Vikarabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(756,31,NULL,'Warangal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(757,32,NULL,'Alangulam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(758,32,NULL,'Ambur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(759,32,NULL,'Annamalainagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(760,32,NULL,'Arakkonam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(761,32,NULL,'Arani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(762,32,NULL,'Ariyalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(763,32,NULL,'Attur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(764,32,NULL,'Bodinayakkanur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(765,32,NULL,'Chennai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(766,32,NULL,'Cheyyar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(767,32,NULL,'Chidambaram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(768,32,NULL,'Choolai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(769,32,NULL,'Coimbatore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(770,32,NULL,'Coonoor','2017-05-26 21:09:55','2017-05-26 21:09:55'),(771,32,NULL,'Cuddalore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(772,32,NULL,'Devipattinam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(773,32,NULL,'Dharapuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(774,32,NULL,'Dharmapuri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(775,32,NULL,'Dindigul','2017-05-26 21:09:55','2017-05-26 21:09:55'),(776,32,NULL,'Ekkattuthangal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(777,32,NULL,'Eral','2017-05-26 21:09:55','2017-05-26 21:09:55'),(778,32,NULL,'Erode','2017-05-26 21:09:55','2017-05-26 21:09:55'),(779,32,NULL,'Fort','2017-05-26 21:09:55','2017-05-26 21:09:55'),(780,32,NULL,'Gobichettipalayam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(781,32,NULL,'Guindy','2017-05-26 21:09:55','2017-05-26 21:09:55'),(782,32,NULL,'Hosur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(783,32,NULL,'Kalpakkam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(784,32,NULL,'Kanchipuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(785,32,NULL,'Kangayam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(786,32,NULL,'Kaniyambadi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(787,32,NULL,'Kanniyakumari','2017-05-26 21:09:55','2017-05-26 21:09:55'),(788,32,NULL,'Karaikudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(789,32,NULL,'Karamadai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(790,32,NULL,'Karur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(791,32,NULL,'Kodaikanal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(792,32,NULL,'Koothanallur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(793,32,NULL,'Kovilpatti','2017-05-26 21:09:55','2017-05-26 21:09:55'),(794,32,NULL,'Krishnagiri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(795,32,NULL,'Kumbakonam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(796,32,NULL,'Kuzhithurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(797,32,NULL,'Lalgudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(798,32,NULL,'Madurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(799,32,NULL,'Madurantakam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(800,32,NULL,'Mahabalipuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(801,32,NULL,'Mannargudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(802,32,NULL,'Mettur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(803,32,NULL,'Mylapore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(804,32,NULL,'Nagapattinam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(805,32,NULL,'Nagercoil','2017-05-26 21:09:55','2017-05-26 21:09:55'),(806,32,NULL,'Namakkal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(807,32,NULL,'Neyveli','2017-05-26 21:09:55','2017-05-26 21:09:55'),(808,32,NULL,'Omalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(809,32,NULL,'Ooty','2017-05-26 21:09:55','2017-05-26 21:09:55'),(810,32,NULL,'Palani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(811,32,NULL,'Palladam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(812,32,NULL,'Panruti','2017-05-26 21:09:55','2017-05-26 21:09:55'),(813,32,NULL,'Pattukkottai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(814,32,NULL,'Perambalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(815,32,NULL,'Peranampattu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(816,32,NULL,'Perundurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(817,32,NULL,'Pollachi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(818,32,NULL,'Ponneri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(819,32,NULL,'Pudukkottai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(820,32,NULL,'Puliyur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(821,32,NULL,'Rajapalaiyam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(822,32,NULL,'Ramanathapuram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(823,32,NULL,'Ranippettai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(824,32,NULL,'Salem','2017-05-26 21:09:56','2017-05-26 21:09:56'),(825,32,NULL,'Sattur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(826,32,NULL,'Sholavandan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(827,32,NULL,'Sirkazhi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(828,32,NULL,'Siruseri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(829,32,NULL,'Sivaganga','2017-05-26 21:09:56','2017-05-26 21:09:56'),(830,32,NULL,'Sivakasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(831,32,NULL,'Sriperumbudur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(832,32,NULL,'Srirangam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(833,32,NULL,'Srivilliputhur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(834,32,NULL,'Tambaram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(835,32,NULL,'Thanjavur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(836,32,NULL,'Thenkasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(837,32,NULL,'Thirumangalam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(838,32,NULL,'Thiruthani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(839,32,NULL,'Thiruvarur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(840,32,NULL,'Thoothukudi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(841,32,NULL,'Tindivanam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(842,32,NULL,'Tiruchchendur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(843,32,NULL,'Tiruchi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(844,32,NULL,'Tirunelveli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(845,32,NULL,'Tiruppur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(846,32,NULL,'Tiruvallur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(847,32,NULL,'Tiruvannamalai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(848,32,NULL,'Turaiyur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(849,32,NULL,'Vadamadurai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(850,32,NULL,'Vandalur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(851,32,NULL,'Vandavasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(852,32,NULL,'Vaniyambadi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(853,32,NULL,'Vellore','2017-05-26 21:09:56','2017-05-26 21:09:56'),(854,32,NULL,'Villupuram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(855,32,NULL,'Wellington','2017-05-26 21:09:56','2017-05-26 21:09:56'),(856,32,NULL,'Yercaud','2017-05-26 21:09:56','2017-05-26 21:09:56'),(857,33,NULL,'Agartala','2017-05-26 21:09:56','2017-05-26 21:09:56'),(858,33,NULL,'Kamalpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(859,34,NULL,'Adwani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(860,34,NULL,'Almora','2017-05-26 21:09:56','2017-05-26 21:09:56'),(861,34,NULL,'Dang','2017-05-26 21:09:56','2017-05-26 21:09:56'),(862,34,NULL,'Dangi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(863,34,NULL,'Dehradun','2017-05-26 21:09:56','2017-05-26 21:09:56'),(864,34,NULL,'Dhanaulti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(865,34,NULL,'Dogadda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(866,34,NULL,'Dwarahat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(867,34,NULL,'Haldwani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(868,34,NULL,'Haridwar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(869,34,NULL,'Jamal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(870,34,NULL,'Jaspur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(871,34,NULL,'Kashipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(872,34,NULL,'Lohaghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(873,34,NULL,'Mill','2017-05-26 21:09:56','2017-05-26 21:09:56'),(874,34,NULL,'Mussoorie','2017-05-26 21:09:56','2017-05-26 21:09:56'),(875,34,NULL,'Nagal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(876,34,NULL,'Naini','2017-05-26 21:09:56','2017-05-26 21:09:56'),(877,34,NULL,'Pantnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(878,34,NULL,'Pauri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(879,34,NULL,'Pithoragarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(880,34,NULL,'Ramnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(881,34,NULL,'Rishikesh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(882,34,NULL,'Roorkee','2017-05-26 21:09:56','2017-05-26 21:09:56'),(883,34,NULL,'Sidhpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(884,34,NULL,'Uttarkashi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(885,34,NULL,'Vikasnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(886,35,NULL,'Agra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(887,35,NULL,'Ajabpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(888,35,NULL,'Aligarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(889,35,NULL,'Allahabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(890,35,NULL,'Anandnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(891,35,NULL,'Arora','2017-05-26 21:09:56','2017-05-26 21:09:56'),(892,35,NULL,'Azamgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(893,35,NULL,'Bagpat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(894,35,NULL,'Balu','2017-05-26 21:09:56','2017-05-26 21:09:56'),(895,35,NULL,'Banda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(896,35,NULL,'Bank','2017-05-26 21:09:56','2017-05-26 21:09:56'),(897,35,NULL,'Bareilly','2017-05-26 21:09:56','2017-05-26 21:09:56'),(898,35,NULL,'Basti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(899,35,NULL,'Bela','2017-05-26 21:09:56','2017-05-26 21:09:56'),(900,35,NULL,'Bhadohi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(901,35,NULL,'Bichpuri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(902,35,NULL,'Budaun','2017-05-26 21:09:56','2017-05-26 21:09:56'),(903,35,NULL,'Bulandshahr','2017-05-26 21:09:56','2017-05-26 21:09:56'),(904,35,NULL,'Chandauli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(905,35,NULL,'Chandausi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(906,35,NULL,'Chitra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(907,35,NULL,'Dadri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(908,35,NULL,'Dasna','2017-05-26 21:09:56','2017-05-26 21:09:56'),(909,35,NULL,'Deoria','2017-05-26 21:09:56','2017-05-26 21:09:56'),(910,35,NULL,'Etawah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(911,35,NULL,'Faizabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(912,35,NULL,'Fatehgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(913,35,NULL,'Fatehpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(914,35,NULL,'Firozabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(915,35,NULL,'Ghaziabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(916,35,NULL,'Gonda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(917,35,NULL,'Gorakhpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(918,35,NULL,'Hamirpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(919,35,NULL,'Hapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(920,35,NULL,'Iglas','2017-05-26 21:09:56','2017-05-26 21:09:56'),(921,35,NULL,'Jalesar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(922,35,NULL,'Jaunpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(923,35,NULL,'Jhansi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(924,35,NULL,'Kaimganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(925,35,NULL,'Kanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(926,35,NULL,'Karari','2017-05-26 21:09:56','2017-05-26 21:09:56'),(927,35,NULL,'Kasganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(928,35,NULL,'Kasia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(929,35,NULL,'Khandar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(930,35,NULL,'Khatauli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(931,35,NULL,'Kheri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(932,35,NULL,'Khurja','2017-05-26 21:09:56','2017-05-26 21:09:56'),(933,35,NULL,'Kunwar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(934,35,NULL,'Lakhimpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(935,35,NULL,'Lucknow','2017-05-26 21:09:56','2017-05-26 21:09:56'),(936,35,NULL,'Madhoganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(937,35,NULL,'Mathan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(938,35,NULL,'Mathura','2017-05-26 21:09:56','2017-05-26 21:09:56'),(939,35,NULL,'Mawana','2017-05-26 21:09:56','2017-05-26 21:09:56'),(940,35,NULL,'Meerut','2017-05-26 21:09:56','2017-05-26 21:09:56'),(941,35,NULL,'Mehra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(942,35,NULL,'Mirza Murad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(943,35,NULL,'Mirzapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(944,35,NULL,'Mohan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(945,35,NULL,'Moradabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(946,35,NULL,'Muzaffarnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(947,35,NULL,'Noida','2017-05-26 21:09:56','2017-05-26 21:09:56'),(948,35,NULL,'Orai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(949,35,NULL,'Padrauna','2017-05-26 21:09:56','2017-05-26 21:09:56'),(950,35,NULL,'Phaphamau','2017-05-26 21:09:56','2017-05-26 21:09:56'),(951,35,NULL,'Pilkhuwa','2017-05-26 21:09:56','2017-05-26 21:09:56'),(952,35,NULL,'Potti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(953,35,NULL,'Rampur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(954,35,NULL,'Saharanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(955,35,NULL,'Sahibabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(956,35,NULL,'Shahjahanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(957,35,NULL,'Shamsabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(958,35,NULL,'Sikka','2017-05-26 21:09:56','2017-05-26 21:09:56'),(959,35,NULL,'Sitapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(960,35,NULL,'Sultanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(961,35,NULL,'Tanda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(962,35,NULL,'Teri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(963,35,NULL,'Tikamgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(964,35,NULL,'Unnao','2017-05-26 21:09:56','2017-05-26 21:09:56'),(965,35,NULL,'Varanasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(966,36,NULL,'Alipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(967,36,NULL,'Asansol','2017-05-26 21:09:56','2017-05-26 21:09:56'),(968,36,NULL,'Baharampur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(969,36,NULL,'Baidyabati','2017-05-26 21:09:56','2017-05-26 21:09:56'),(970,36,NULL,'Bali','2017-05-26 21:09:56','2017-05-26 21:09:56'),(971,36,NULL,'Balurghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(972,36,NULL,'Bangaon','2017-05-26 21:09:56','2017-05-26 21:09:56'),(973,36,NULL,'Bankura','2017-05-26 21:09:56','2017-05-26 21:09:56'),(974,36,NULL,'Barakpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(975,36,NULL,'Barddhaman','2017-05-26 21:09:56','2017-05-26 21:09:56'),(976,36,NULL,'Basirhat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(977,36,NULL,'Behala','2017-05-26 21:09:56','2017-05-26 21:09:56'),(978,36,NULL,'Belgharia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(979,36,NULL,'Binnaguri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(980,36,NULL,'Bishnupur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(981,36,NULL,'Bolpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(982,36,NULL,'Budbud','2017-05-26 21:09:56','2017-05-26 21:09:56'),(983,36,NULL,'Canning','2017-05-26 21:09:56','2017-05-26 21:09:56'),(984,36,NULL,'Chandannagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(985,36,NULL,'Dam Dam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(986,36,NULL,'Darjeeling','2017-05-26 21:09:56','2017-05-26 21:09:56'),(987,36,NULL,'Durgapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(988,36,NULL,'Farakka','2017-05-26 21:09:56','2017-05-26 21:09:56'),(989,36,NULL,'Ghatal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(990,36,NULL,'Gujrat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(991,36,NULL,'Habra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(992,36,NULL,'Haldia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(993,36,NULL,'Haripur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(994,36,NULL,'Howrah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(995,36,NULL,'Hugli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(996,36,NULL,'Jadabpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(997,36,NULL,'Jalpaiguri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(998,36,NULL,'Jayanti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(999,36,NULL,'Jhargram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1000,36,NULL,'Kakdwip','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1001,36,NULL,'Kalyani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1002,36,NULL,'Kanchrapara','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1003,36,NULL,'Kandi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1004,36,NULL,'Karsiyang','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1005,36,NULL,'Katoya','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1006,36,NULL,'Kharagpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1007,36,NULL,'Koch Bihar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1008,36,NULL,'Kolkata','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1009,36,NULL,'Konnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1010,36,NULL,'Kulti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1011,36,NULL,'Liluah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1012,36,NULL,'Maldah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1013,36,NULL,'Manipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1014,36,NULL,'Mayapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1015,36,NULL,'Medinipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1016,36,NULL,'Multi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1017,36,NULL,'Murshidabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1018,36,NULL,'Nabadwip','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1019,36,NULL,'Panchal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1020,36,NULL,'Puruliya','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1021,36,NULL,'Rajpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1022,36,NULL,'Ranaghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1023,36,NULL,'Raniganj','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1024,36,NULL,'Rudrapur','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1025,36,NULL,'Rupnarayanpur','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1026,36,NULL,'Salt Lake City','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1027,36,NULL,'Saranga','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1028,36,NULL,'Serampore','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1029,36,NULL,'Shyamnagar','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1030,36,NULL,'Siliguri','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1031,36,NULL,'Siuri','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1032,23,NULL,'Shajapur','2017-05-26 21:09:57','2017-05-26 21:09:57');
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
-- Table structure for table `employee_annual_salaries`
--

DROP TABLE IF EXISTS `employee_annual_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_annual_salaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `salary_component_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `parent_salary_component_id` int(11) DEFAULT NULL,
  `is_deducted` tinyint(1) DEFAULT NULL,
  `to_be_paid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_amount` decimal(15,2) DEFAULT NULL,
  `monthly_amount` decimal(15,2) DEFAULT NULL,
  `annual_amount` decimal(15,2) DEFAULT NULL,
  `is_taxable` tinyint(1) DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `base` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_annual_salaries_on_employee_id` (`employee_id`),
  KEY `index_employee_annual_salaries_on_salary_component_id` (`salary_component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_annual_salaries`
--

LOCK TABLES `employee_annual_salaries` WRITE;
/*!40000 ALTER TABLE `employee_annual_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_annual_salaries` ENABLE KEYS */;
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
-- Table structure for table `employee_attributes`
--

DROP TABLE IF EXISTS `employee_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_master_id` int(11) DEFAULT NULL,
  `weightage` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_period_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `emp_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attributes_on_attribute_master_id` (`attribute_master_id`),
  KEY `index_employee_attributes_on_employee_id` (`employee_id`),
  KEY `index_employee_attributes_on_performance_period_id` (`performance_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attributes`
--

LOCK TABLES `employee_attributes` WRITE;
/*!40000 ALTER TABLE `employee_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attributes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
INSERT INTO `employee_bank_details` VALUES (1,NULL,NULL,'20258012231','SBI','Hingne Khurd',NULL,'20','411002017.0','7159.0','SBIN0007159','2017-06-07 05:20:02','2017-06-07 05:20:02'),(2,NULL,NULL,'50100100000000','HDFC',NULL,NULL,'0',NULL,NULL,'HDFC0000825','2017-06-07 05:20:02','2017-06-07 05:20:02'),(3,NULL,NULL,'33446795198','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(4,NULL,NULL,'30684432166','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0011129','2017-06-07 05:20:02','2017-06-07 05:20:02'),(5,NULL,NULL,'20179895011','SBI','Paud Road',NULL,'0',NULL,'9061.0','SBIN0009061','2017-06-07 05:20:02','2017-06-07 05:20:02'),(6,NULL,NULL,'20375585028','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(7,NULL,NULL,'147710110004605','Bank Of India','Palli Branch, Ratanagiri ',NULL,'0','415013561.0','001477','BKID0001477','2017-06-07 05:20:02','2017-06-07 05:20:02'),(8,NULL,NULL,'20206710804','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(9,NULL,NULL,'20206710156','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(10,NULL,NULL,'35833073132','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(11,NULL,NULL,'20206714333','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:02','2017-06-07 05:20:02'),(12,NULL,NULL,'20035175336','SBI','Aravali',NULL,'22','415002789.0','7489.0','SBIN0007489','2017-06-07 05:20:03','2017-06-07 05:20:03'),(13,NULL,NULL,'20245817548','SBI','Erandwana-Pune',NULL,'20',' 411002010','04618','SBIN0004618','2017-06-07 05:20:03','2017-06-07 05:20:03'),(14,NULL,NULL,'10198716818','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0007339','2017-06-07 05:20:03','2017-06-07 05:20:03'),(15,NULL,NULL,'20375584830','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(16,NULL,NULL,'31992443476','SBI','Dighi',NULL,'0',NULL,'10473.0','SBIN0010473','2017-06-07 05:20:03','2017-06-07 05:20:03'),(17,NULL,NULL,'5121140076269','HDFC',NULL,NULL,'0',NULL,NULL,'HDFC0000512','2017-06-07 05:20:03','2017-06-07 05:20:03'),(18,NULL,NULL,'20375585200','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(19,NULL,NULL,'20206713883','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(20,NULL,NULL,'20067281610','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0004317','2017-06-07 05:20:03','2017-06-07 05:20:03'),(21,NULL,NULL,'31023581964','SBI','Uralikanchan',NULL,'22','411002043.0','\'07762','SBIN0007762','2017-06-07 05:20:03','2017-06-07 05:20:03'),(22,NULL,NULL,'31285946133','SBI','Amravati',NULL,'0','444002971.0','311.0','SBIN0000311','2017-06-07 05:20:03','2017-06-07 05:20:03'),(23,NULL,NULL,'35899121320','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(24,NULL,NULL,'35899076931','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(25,NULL,NULL,'11220818729','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0006443','2017-06-07 05:20:03','2017-06-07 05:20:03'),(26,NULL,NULL,'33434243232','SBI','Khopoli ',NULL,'2192','400002152.0',' 005551','SBIN0005551','2017-06-07 05:20:03','2017-06-07 05:20:03'),(27,NULL,NULL,'31924180878','SBI','Dhankawadi',NULL,'20','411002048.0',' 005413','SBIN0005413','2017-06-07 05:20:03','2017-06-07 05:20:03'),(28,NULL,NULL,'20242834180','SBI','College Of Engineering, Shivaji Nagar',NULL,'0','411002060.0','10431.0','SBIN0010431','2017-06-07 05:20:03','2017-06-07 05:20:03'),(29,NULL,NULL,'601610020140','HDFC','Fort, Mumbai',NULL,'0','400240015.0','000060','HDFC0000060','2017-06-07 05:20:03','2017-06-07 05:20:03'),(30,NULL,NULL,'31946322648','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0017125','2017-06-07 05:20:03','2017-06-07 05:20:03'),(31,NULL,NULL,'30938449083','SBI','Pandharpur',NULL,'2186','413002927.0','00446','SBIN0000446','2017-06-07 05:20:03','2017-06-07 05:20:03'),(32,NULL,NULL,'38203100001513','Saraswat Bank',NULL,NULL,'0',NULL,NULL,'SRCB0000038','2017-06-07 05:20:03','2017-06-07 05:20:03'),(33,NULL,NULL,'4861050048019','HDFC',NULL,NULL,'0',NULL,NULL,'HDFC0000486','2017-06-07 05:20:03','2017-06-07 05:20:03'),(34,NULL,NULL,'20206714151','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:03','2017-06-07 05:20:03'),(35,NULL,NULL,'501670325','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0000005','2017-06-07 05:20:04','2017-06-07 05:20:04'),(36,NULL,NULL,'15020100053397','Federal Bank',NULL,NULL,'0',NULL,NULL,'FDRL0001502','2017-06-07 05:20:04','2017-06-07 05:20:04'),(37,NULL,NULL,'3320355889',NULL,NULL,NULL,'0',NULL,NULL,'CBIN0280655','2017-06-07 05:20:04','2017-06-07 05:20:04'),(38,NULL,NULL,'8801523922','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0000088','2017-06-07 05:20:04','2017-06-07 05:20:04'),(39,NULL,NULL,'20111688901','SBI','Paud Road',NULL,'0',NULL,'9061.0','SBIN0009061','2017-06-07 05:20:04','2017-06-07 05:20:04'),(40,NULL,NULL,'60020826967','Bank of Maharashtra',NULL,NULL,'0',NULL,NULL,'MAHB0001124','2017-06-07 05:20:04','2017-06-07 05:20:04'),(41,NULL,NULL,'35838721125','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:04','2017-06-07 05:20:04'),(42,NULL,NULL,'34898994665','SBI','Deccan Gymkhana',NULL,'20','411002003.0','001110','SBIN0001110','2017-06-07 05:20:04','2017-06-07 05:20:04'),(43,NULL,NULL,'20375585095','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-06-07 05:20:04','2017-06-07 05:20:04'),(44,NULL,NULL,'11168743863','SBI','Siliguri,Darjeeling',NULL,'353','734002001.0','\'00184','SBIN0000184','2017-06-07 05:20:04','2017-06-07 05:20:04'),(45,NULL,NULL,'71901505064','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0000037','2017-06-07 05:20:04','2017-06-07 05:20:04'),(46,NULL,NULL,'10167190177','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0007237','2017-06-07 05:20:04','2017-06-07 05:20:04'),(47,NULL,NULL,'912010039215942','UTIB',NULL,NULL,'0',NULL,NULL,'UTIB0000008','2017-06-07 05:20:04','2017-06-07 05:20:04'),(48,NULL,NULL,'242601500374','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0002426','2017-06-07 05:20:04','2017-06-07 05:20:04'),(49,NULL,NULL,'33952347683','SBI','Baripada',NULL,'0',NULL,' \'00027','SBIN0000027','2017-06-07 05:20:04','2017-06-07 05:20:04'),(50,NULL,NULL,'20201076176','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003313','2017-06-07 05:20:04','2017-06-07 05:20:04'),(51,NULL,NULL,'31959625310','SBI','Kotkasim',NULL,'1460','301002015.0','2397.0','SBIN0002397','2017-06-07 05:20:04','2017-06-07 05:20:04'),(52,NULL,NULL,'624201516936','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0003491','2017-06-07 05:20:04','2017-06-07 05:20:04'),(53,NULL,NULL,'20161601102','SBI','Midc Hinjewadi',NULL,'0','411002055.0','10203','SBIN0010203','2017-06-07 05:20:04','2017-06-07 05:20:04'),(54,NULL,NULL,'60054940068','Bank of Maharashtra',NULL,NULL,'0',NULL,NULL,'MAHB0001431','2017-06-07 05:20:04','2017-06-07 05:20:04'),(55,NULL,NULL,'320501054287',NULL,NULL,NULL,'0',NULL,NULL,'COSB0000032','2017-06-07 05:20:04','2017-06-07 05:20:04'),(56,NULL,NULL,'20311287367','SBI','Narayangaon',NULL,'0','410002555.0','11130.0','SBIN0011130','2017-06-07 05:20:04','2017-06-07 05:20:04'),(57,NULL,NULL,'60242855839','Bank of Maharashtra',NULL,NULL,'0',NULL,NULL,'MAHB0000130','2017-06-07 05:20:04','2017-06-07 05:20:04'),(58,NULL,NULL,'60243954850','Bank of Maharashtra',NULL,NULL,'0',NULL,NULL,'MAHB0000130','2017-06-07 05:20:04','2017-06-07 05:20:04'),(59,NULL,NULL,'102104000209427',NULL,NULL,NULL,'0',NULL,NULL,'IBKL0000102','2017-06-07 05:20:04','2017-06-07 05:20:04'),(60,NULL,NULL,'33054723477','SBI','Yermala',NULL,'2473',' 413002402',' 005425','SBIN0005425','2017-06-07 05:20:05','2017-06-07 05:20:05'),(61,NULL,NULL,'50100122618700',NULL,NULL,NULL,'0',NULL,NULL,'HDFC0000633','2017-06-07 05:20:05','2017-06-07 05:20:05'),(62,NULL,NULL,'109001504260','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0001090','2017-06-07 05:20:05','2017-06-07 05:20:05'),(63,NULL,NULL,'20211312149','SBI','Midc Hinjewadi',NULL,'0','411002055.0','10203','SBIN0010203','2017-06-07 05:20:05','2017-06-07 05:20:05'),(64,NULL,NULL,'31454303655','SBI','Kothrud, Pune',NULL,'20',' 411005002',' 030456','SBIN0030456','2017-06-07 05:20:05','2017-06-07 05:20:05'),(65,NULL,NULL,'68018970724','Bank of Maharashtra',NULL,NULL,'0',NULL,NULL,'MAHB0000170','2017-06-07 05:20:05','2017-06-07 05:20:05'),(66,NULL,NULL,'31926372412','SBI','Ambad',NULL,'2483','431002999.0','12488.0','SBIN0012488','2017-06-07 05:20:05','2017-06-07 05:20:05'),(67,NULL,NULL,'10324172162','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0011647','2017-06-07 05:20:05','2017-06-07 05:20:05'),(68,NULL,NULL,'31232187813','SBI','Koregaon Bhima',NULL,'9922311330',' 411002070','11647','SBIN0011647','2017-06-07 05:20:05','2017-06-07 05:20:05'),(69,NULL,NULL,'30451421182','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0011647','2017-06-07 05:20:05','2017-06-07 05:20:05'),(70,NULL,NULL,'915010041179608','UTIB',NULL,NULL,'0',NULL,NULL,'UTIB0000862','2017-06-07 05:20:05','2017-06-07 05:20:05'),(71,NULL,NULL,'32802349044','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0002483','2017-06-07 05:20:05','2017-06-07 05:20:05'),(72,NULL,NULL,'34357787420','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0011647','2017-06-07 05:20:05','2017-06-07 05:20:05'),(73,NULL,NULL,'30924677843','SBI','ADB Indapur',NULL,'2111',' 413002821',' \'06793','SBIN0006793','2017-06-07 05:20:05','2017-06-07 05:20:05'),(74,NULL,NULL,'31953977924','SBI','Ahmednagar',NULL,'0',NULL,NULL,'SBIN0000303','2017-06-07 05:20:05','2017-06-07 05:20:05'),(75,NULL,NULL,'32130522283','SBI','Latur',NULL,'2382',' 431002956','006756','SBIN0006756','2017-06-07 05:20:05','2017-06-07 05:20:05'),(76,NULL,NULL,'645501515946','ICICI',NULL,NULL,'0',NULL,NULL,'ICIC0006455','2017-06-07 05:20:05','2017-06-07 05:20:05'),(77,NULL,NULL,'583902010002836','Union Bank of India',NULL,NULL,'0',NULL,NULL,'UBIN0558397','2017-06-07 05:20:05','2017-06-07 05:20:05'),(78,NULL,NULL,'31053189108','SBI','RMY Pochampalli',NULL,'4341','635002020.0','007494','SBIN0007494','2017-06-07 05:20:05','2017-06-07 05:20:05'),(79,NULL,NULL,'31385627136','SBI','Koregaon Bhima',NULL,'9922311330',' 411002070','11647.0','SBIN0011647','2017-06-07 05:20:05','2017-06-07 05:20:05'),(80,NULL,NULL,'35598605427','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0015849','2017-06-07 05:20:05','2017-06-07 05:20:05'),(81,NULL,NULL,'35627198320','SBI','Shikrapur',NULL,'0',NULL,NULL,'SBIN0015849','2017-06-07 05:20:05','2017-06-07 05:20:05'),(82,NULL,NULL,'33901541931','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:05','2017-06-07 05:20:05'),(83,NULL,NULL,'20170657813','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(84,NULL,NULL,'31900593905','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(85,NULL,NULL,'33952337743','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(86,NULL,NULL,'31247806010','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(87,NULL,NULL,'30729123160','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(88,NULL,NULL,'34007273650','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(89,NULL,NULL,'33016144781','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(90,NULL,NULL,'20212337649','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(91,NULL,NULL,'31833147209','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(92,NULL,NULL,'20189233780','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(93,NULL,NULL,'33952190129','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(94,NULL,NULL,'33952344659','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(95,NULL,NULL,'30903727120','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(96,NULL,NULL,'30779155966','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(97,NULL,NULL,'30597026832','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(98,NULL,NULL,'11043606066','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(99,NULL,NULL,'20201076052','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(100,NULL,NULL,'20201076176','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(101,NULL,NULL,'30895739797','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(102,NULL,NULL,'34048636437','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(103,NULL,NULL,'20202689150','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(104,NULL,NULL,'33997383812','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(105,NULL,NULL,'20192020641','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(106,NULL,NULL,'30786807856','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(107,NULL,NULL,'20248848620','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(108,NULL,NULL,'34793728669','SBI','0.0',NULL,'0','812002017.0','18101.0','0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(109,NULL,NULL,'34860022932','SBI','0.0',NULL,'0','812002017.0','18101.0','0.0','2017-06-07 05:20:06','2017-06-07 05:20:06'),(110,NULL,NULL,'31258979658','SBI','0.0',NULL,'0','301002015.0','2397.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(111,NULL,NULL,'20395824439','SBI','0.0',NULL,'0','524002023.0','18816.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(112,NULL,NULL,'20172963782','SBI','0.0',NULL,'0','0.0','14456.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(113,NULL,NULL,'34656220371','SBI','0.0',NULL,'0','0.0','12161.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(114,NULL,NULL,'20044342285','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(115,NULL,NULL,'33617261073','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(116,NULL,NULL,'20117239266','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(117,NULL,NULL,'62310054883','SBH','Mahammadabad',NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(118,NULL,NULL,'31081148465','SBI','ADB Narasampet',NULL,'0',NULL,NULL,'SBIN0005876','2017-06-07 05:20:07','2017-06-07 05:20:07'),(119,NULL,NULL,'20056049259','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(120,NULL,NULL,'30822618362','SBI','Simhachalam',NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(121,NULL,NULL,'20156384716','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(122,NULL,NULL,'31018251263','SBI','Vayalpad',NULL,'0',NULL,NULL,'SBIN0000781','2017-06-07 05:20:07','2017-06-07 05:20:07'),(123,NULL,NULL,'32036584689','SBI',NULL,NULL,'0',NULL,NULL,'0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(124,NULL,NULL,'34859107864','SBI','0.0',NULL,'0','802002002.0','51.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(125,NULL,NULL,'35424512000','SBI','0.0',NULL,'0','0.0','12570.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(126,NULL,NULL,'20313619993','SBI','0.0',NULL,'0','829002502.0','12815.0','0.0','2017-06-07 05:20:07','2017-06-07 05:20:07'),(127,NULL,NULL,'31559433755','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003510','2017-06-07 05:20:07','2017-06-07 05:20:07'),(128,NULL,NULL,'32935893674','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0005221 ','2017-06-07 05:20:07','2017-06-07 05:20:07'),(129,NULL,NULL,'33534744904','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0013108','2017-06-07 05:20:07','2017-06-07 05:20:07'),(130,NULL,NULL,'31738693155','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0005721','2017-06-07 05:20:07','2017-06-07 05:20:07'),(131,NULL,NULL,'31936765241','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0004617','2017-06-07 05:20:07','2017-06-07 05:20:07'),(132,NULL,NULL,'32148357977','SBI',NULL,NULL,'0',NULL,NULL,'SBIN 0000574','2017-06-07 05:20:07','2017-06-07 05:20:07'),(133,NULL,NULL,'31398644248','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000330','2017-06-07 05:20:08','2017-06-07 05:20:08'),(134,NULL,NULL,'32617956232','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003236','2017-06-07 05:20:08','2017-06-07 05:20:08'),(135,NULL,NULL,'35243495906','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0010908','2017-06-07 05:20:08','2017-06-07 05:20:08'),(136,NULL,NULL,'32020957344','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000361','2017-06-07 05:20:08','2017-06-07 05:20:08'),(137,NULL,NULL,'33881407053','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000038','2017-06-07 05:20:08','2017-06-07 05:20:08'),(138,NULL,NULL,'32568538784','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001640','2017-06-07 05:20:08','2017-06-07 05:20:08'),(139,NULL,NULL,'32568538784','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001640','2017-06-07 05:20:08','2017-06-07 05:20:08'),(140,NULL,NULL,'32995075556','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0002887','2017-06-07 05:20:08','2017-06-07 05:20:08'),(141,NULL,NULL,'33992614972','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003313','2017-06-07 05:20:08','2017-06-07 05:20:08'),(142,NULL,NULL,'20043674277','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003183','2017-06-07 05:20:08','2017-06-07 05:20:08'),(143,NULL,NULL,'33534744904','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0013108','2017-06-07 05:20:08','2017-06-07 05:20:08'),(144,NULL,NULL,'31742958628','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000320','2017-06-07 05:20:08','2017-06-07 05:20:08'),(145,NULL,NULL,'33837025442','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0010148','2017-06-07 05:20:08','2017-06-07 05:20:08'),(146,NULL,NULL,'31717356114','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000416','2017-06-07 05:20:08','2017-06-07 05:20:08'),(147,NULL,NULL,'20256844386','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0006068','2017-06-07 05:20:08','2017-06-07 05:20:08'),(148,NULL,NULL,'3605875498','CBIN',NULL,NULL,'0',NULL,NULL,'CBIN0281372','2017-06-07 05:20:08','2017-06-07 05:20:08'),(149,NULL,NULL,'34088947887','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0013579','2017-06-07 05:20:08','2017-06-07 05:20:08'),(150,NULL,NULL,'11600072541','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0000192','2017-06-07 05:20:08','2017-06-07 05:20:08'),(151,NULL,NULL,'32070427840','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0003510','2017-06-07 05:20:08','2017-06-07 05:20:08'),(152,NULL,NULL,'33160241449','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0002872','2017-06-07 05:20:08','2017-06-07 05:20:08'),(153,NULL,NULL,'33534744904','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0013108','2017-06-07 05:20:08','2017-06-07 05:20:08'),(154,NULL,NULL,'33611262914','SBI',NULL,NULL,'0',NULL,NULL,'SBIN0001640','2017-06-07 05:20:08','2017-06-07 05:20:08');
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
INSERT INTO `employee_categories` VALUES (1,'1.0','Director',NULL,NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Staff',NULL,NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Worker',NULL,NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
INSERT INTO `employee_code_masters` VALUES (1,'m','1','1',0,NULL,'2017-06-06 22:11:35','2017-06-06 22:11:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,NULL,'Leader','',NULL,'2017-05-29 04:52:25','2017-05-29 04:52:25'),(2,NULL,'Senior Manager','',NULL,'2017-05-29 04:52:34','2017-05-29 04:52:34'),(3,NULL,'Manager','',NULL,'2017-05-29 04:52:41','2017-05-29 04:52:41'),(4,NULL,'Assistant Manager','',NULL,'2017-05-29 04:52:49','2017-05-29 04:52:49'),(5,NULL,'Senior Engineer','',NULL,'2017-05-29 04:52:57','2017-05-29 04:52:57'),(6,NULL,'Engineer','',NULL,'2017-05-29 04:53:05','2017-05-29 04:53:05'),(7,NULL,'Junior Engineer','',NULL,'2017-05-29 04:53:15','2017-05-29 04:53:15'),(8,NULL,'Site Engineer','',NULL,'2017-05-29 04:53:24','2017-05-29 04:53:24'),(9,NULL,'Senior Executive','',NULL,'2017-05-29 04:53:33','2017-05-29 04:53:33'),(10,NULL,'Executive','',NULL,'2017-05-29 04:53:42','2017-05-29 04:53:42'),(11,NULL,'Coordinator','',NULL,'2017-05-29 04:53:49','2017-05-29 04:53:49'),(12,NULL,'Office assistant','',NULL,'2017-05-29 04:53:58','2017-05-29 04:53:58'),(13,NULL,'Supervisor','',NULL,'2017-05-29 04:54:05','2017-05-29 04:54:05'),(14,NULL,'Technician','',NULL,'2017-05-29 04:54:14','2017-05-29 04:54:14'),(15,NULL,'Trainee','',NULL,'2017-05-29 04:54:21','2017-05-29 04:54:21'),(16,NULL,'Expert','',NULL,'2017-06-06 22:19:51','2017-06-06 22:19:51');
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
-- Table structure for table `employee_goals`
--

DROP TABLE IF EXISTS `employee_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_perspective_id` int(11) DEFAULT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goal_weightage` int(11) DEFAULT NULL,
  `difficulty_level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `goal_measure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `period_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `allign_to_supervisor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `emp_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_goals_on_employee_id` (`employee_id`),
  KEY `index_employee_goals_on_goal_perspective_id` (`goal_perspective_id`),
  KEY `index_employee_goals_on_period_id` (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_goals`
--

LOCK TABLES `employee_goals` WRITE;
/*!40000 ALTER TABLE `employee_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_goals` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_grades`
--

LOCK TABLES `employee_grades` WRITE;
/*!40000 ALTER TABLE `employee_grades` DISABLE KEYS */;
INSERT INTO `employee_grades` VALUES (1,'1.0','Blue',NULL,'2017-05-26 21:09:50','2017-06-06 22:21:54'),(2,NULL,'Green',NULL,'2017-06-06 22:22:02','2017-06-06 22:22:02'),(3,NULL,'Orange',NULL,'2017-06-06 22:22:15','2017-06-06 22:22:15'),(4,NULL,'Red',NULL,'2017-06-06 22:22:22','2017-06-06 22:22:22'),(5,NULL,'White',NULL,'2017-06-06 22:22:32','2017-06-06 22:22:32'),(6,NULL,'Yellow',NULL,'2017-06-06 22:22:46','2017-06-06 22:22:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=1417 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (1117,1,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:47','2017-06-07 08:22:47'),(1118,2,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:47','2017-06-07 08:22:47'),(1119,3,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:47','2017-06-07 08:22:47'),(1120,4,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1121,5,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1122,6,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1123,7,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1124,8,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1125,9,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1126,10,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1127,11,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1128,12,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1129,13,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1130,14,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1131,15,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1132,16,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1133,17,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1134,18,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1135,19,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1136,20,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1137,21,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1138,22,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1139,23,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1140,24,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1141,25,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1142,26,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1143,27,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1144,28,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1145,29,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:48','2017-06-07 08:22:48'),(1146,30,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1147,31,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1148,32,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1149,33,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1150,34,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1151,35,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1152,36,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1153,37,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1154,41,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1155,42,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1156,43,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1157,45,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1158,49,1,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1159,51,1,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1160,52,1,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1161,53,1,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1162,54,1,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1163,56,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1164,87,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-01',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1165,88,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1166,114,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1167,115,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:49','2017-06-07 08:22:49'),(1168,120,1,'1.0',NULL,'1.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1169,1,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1170,2,2,'5.0',NULL,'5.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1171,3,2,'13.5',NULL,'13.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1172,4,2,'2.25',NULL,'2.25',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1173,5,2,'7.5',NULL,'7.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1174,6,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1175,7,2,'4.0',NULL,'4.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1176,8,2,'7.5',NULL,'7.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1177,9,2,'5.5',NULL,'5.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1178,10,2,'2.5',NULL,'2.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1179,11,2,'1.5',NULL,'1.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1180,12,2,'2.75',NULL,'2.75',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1181,13,2,'10.75',NULL,'10.75',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1182,14,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1183,15,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1184,16,2,'4.0',NULL,'4.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1185,17,2,'2.0',NULL,'2.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1186,18,2,'2.5',NULL,'2.5',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1187,19,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-02',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1188,20,2,'2.75',NULL,'2.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1189,21,2,'4.25',NULL,'4.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1190,22,2,'4.75',NULL,'4.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1191,23,2,'4.75',NULL,'4.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1192,24,2,'5.5',NULL,'5.5',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1193,25,2,'2.5',NULL,'2.5',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:50','2017-06-07 08:22:50'),(1194,26,2,'2.5',NULL,'2.5',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1195,27,2,'2.25',NULL,'2.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1196,28,2,'7.5',NULL,'7.5',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1197,29,2,'2.75',NULL,'2.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1198,30,2,'4.5',NULL,'4.5',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1199,31,2,'3.75',NULL,'3.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1200,32,2,'2.25',NULL,'2.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1201,33,2,'0.25',NULL,'0.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1202,34,2,'3.75',NULL,'3.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1203,35,2,'3.75',NULL,'3.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1204,36,2,'3.25',NULL,'3.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1205,37,2,'3.0',NULL,'3.0',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1206,41,2,'1.75',NULL,'1.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1207,42,2,'1.75',NULL,'1.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1208,43,2,'2.25',NULL,'2.25',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1209,45,2,'1.75',NULL,'1.75',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1210,49,2,'3.0',NULL,'3.0',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1211,51,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-03',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1212,52,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1213,53,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1214,54,2,'0.0',NULL,'0.0',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1215,56,2,'1.75',NULL,'1.75',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1216,87,2,'19.5',NULL,'19.5',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1217,88,2,'6.5',NULL,'6.5',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:51','2017-06-07 08:22:51'),(1218,114,2,'3.0',NULL,'3.0',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:52','2017-06-07 08:22:52'),(1219,115,2,'6.0',NULL,'6.0',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:52','2017-06-07 08:22:52'),(1220,120,2,'1.5',NULL,'1.5',NULL,'2017-01-01','2018-01-04',1,'2017-06-07 08:22:52','2017-06-07 08:22:52'),(1221,58,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1222,59,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1223,60,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1224,61,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1225,62,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1226,63,3,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1227,64,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1228,65,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1229,66,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1230,67,3,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1231,68,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1232,69,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1233,70,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1234,71,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1235,72,3,'0.51',NULL,'0.51',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:41:57'),(1236,73,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1237,74,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1238,75,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1239,76,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1240,77,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1241,78,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1242,79,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1243,80,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:48','2017-06-07 08:23:48'),(1244,81,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1245,82,3,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1246,83,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1247,84,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1248,85,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1249,86,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1250,89,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1251,90,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1252,91,3,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1253,92,3,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1254,93,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1255,94,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1256,95,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1257,96,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1258,97,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1259,98,3,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1260,99,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1261,100,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1262,101,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1263,102,3,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1264,103,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1265,104,3,'6.5',NULL,'6.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1266,105,3,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1267,106,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1268,107,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:49','2017-06-07 08:23:49'),(1269,108,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:50','2017-06-07 08:23:50'),(1270,109,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:50','2017-06-07 08:23:50'),(1271,110,3,'4.0',NULL,'4.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:50','2017-06-07 08:23:50'),(1272,111,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:23:50','2017-06-07 08:23:50'),(1273,112,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1274,113,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1275,116,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1276,117,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1277,118,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1278,119,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1279,121,3,'2.5',NULL,'2.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1280,122,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1281,123,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1282,124,3,'1.5',NULL,'1.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1283,125,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1284,126,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1285,127,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1286,128,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1287,129,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1288,130,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1289,131,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:57','2017-06-07 08:26:57'),(1290,132,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1291,133,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1292,134,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1293,135,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1294,136,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1295,137,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1296,138,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1297,139,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1298,140,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1299,141,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1300,142,3,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1301,143,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1302,144,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1303,145,3,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1304,146,3,'0.5',NULL,'0.5',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1305,147,3,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1306,58,4,'6.04',NULL,'6.04',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:26:58'),(1307,59,4,'0.89',NULL,'0.89',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:36:17'),(1308,60,4,'1.39',NULL,'1.39',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:36:54'),(1309,61,4,'3.34',NULL,'3.34',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:37:25'),(1310,62,4,'21',NULL,'21',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:35:57'),(1311,63,4,'8.88',NULL,'8.88',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:58','2017-06-07 08:37:59'),(1312,64,4,'19.39',NULL,'19.39',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:38:32'),(1313,65,4,'9.38',NULL,'9.38',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:39:36'),(1314,66,4,'3.18',NULL,'3.18',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:40:30'),(1315,67,4,'2.35',NULL,'2.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1316,68,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1317,69,4,'17.52',NULL,'17.52',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1318,70,4,'19.44',NULL,'19.44',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:39:05'),(1319,71,4,'0.15',NULL,'0.15',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:34:41'),(1320,72,4,'6.04',NULL,'6.04',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:42:25'),(1321,73,4,'7.28',NULL,'7.28',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1322,74,4,'1.39',NULL,'1.39',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:41:02'),(1323,75,4,'1.16',NULL,'1.16',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1324,76,4,'23.62',NULL,'23.62',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:33:37'),(1325,77,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1326,78,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1327,79,4,'7.48',NULL,'7.48',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:40:04'),(1328,80,4,'2.26',NULL,'2.26',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:43:26'),(1329,81,4,'19.46',NULL,'19.46',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1330,82,4,'5.89',NULL,'5.89',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1331,83,4,'2.68',NULL,'2.68',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:42:53'),(1332,84,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1333,85,4,'4.28',NULL,'4.28',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1334,86,4,'19.18',NULL,'19.18',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1335,89,4,'1.31',NULL,'1.31',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:59:41'),(1336,90,4,'12.88',NULL,'12.88',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1337,91,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:26:59','2017-06-07 08:26:59'),(1338,92,4,'1.51',NULL,'1.51',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:59:19'),(1339,93,4,'1.20',NULL,'1.20',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:43:58'),(1340,94,4,'23.20',NULL,'23.20',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:33:55'),(1341,95,4,'4.85',NULL,'4.85',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1342,96,4,'1.31',NULL,'1.31',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:58:55'),(1343,97,4,'3.35',NULL,'3.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1344,98,4,'4.54',NULL,'4.54',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1345,99,4,'1.04',NULL,'1.04',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1346,100,4,'4.54',NULL,'4.54',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1347,101,4,'0.67',NULL,'0.67',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 09:00:07'),(1348,102,4,'3.35',NULL,'3.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1349,103,4,'3.35',NULL,'3.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1350,104,4,'3.35',NULL,'3.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1351,105,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1352,106,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1353,107,4,'0.85',NULL,'0.85',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 09:00:33'),(1354,108,4,'1.01',NULL,'1.01',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 09:01:05'),(1355,109,4,'1.01',NULL,'1.01',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 09:01:35'),(1356,110,4,'3.35',NULL,'3.35',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1357,111,4,'1.66',NULL,'1.66',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1358,112,4,'1.85',NULL,'1.85',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1359,113,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:00','2017-06-07 08:27:00'),(1360,116,4,'2.0',NULL,'2.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1361,117,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1362,118,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1363,119,4,'0.67',NULL,'0.67',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1364,121,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1365,122,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1366,123,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1367,124,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1368,125,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1369,126,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1370,127,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1371,128,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1372,129,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1373,130,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1374,131,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1375,132,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1376,133,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1377,134,4,'1.0',NULL,'1.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1378,135,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1379,136,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1380,137,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1381,138,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1382,139,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1383,140,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1384,141,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:01','2017-06-07 08:27:01'),(1385,142,4,'13.88',NULL,'13.88',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:41:28'),(1386,143,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:27:02'),(1387,144,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:27:02'),(1388,145,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:27:02'),(1389,146,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:27:02'),(1390,147,4,'0.0',NULL,'0.0',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:27:02','2017-06-07 08:27:02'),(1391,148,5,'28.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1392,149,5,'26.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1393,150,5,'32.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1394,151,5,'37.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1395,152,5,'23.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1396,154,5,'35.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1397,157,5,'30.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1398,158,5,'32.25',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1399,159,5,'0',NULL,'',NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-20 09:46:33'),(1400,160,5,'0.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:14','2017-06-07 08:28:14'),(1401,161,5,'0.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:15','2017-06-07 08:28:15'),(1402,163,5,'13.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:15','2017-06-07 08:28:15'),(1403,164,5,'21.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:28:15','2017-06-07 08:28:15'),(1404,165,5,'5.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1405,166,5,'4.25',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1406,167,5,'1.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1407,48,5,'3.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1408,50,5,'1.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1409,55,5,'3.5',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1410,57,5,'1.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1411,38,5,'3.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1412,39,5,'1.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1413,40,5,'1.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1414,46,5,'3.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1415,44,5,'3.75',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54'),(1416,47,5,'2.0',NULL,NULL,NULL,'2017-01-01','2017-12-31',1,'2017-06-07 08:29:54','2017-06-07 08:29:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=4849 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_templates`
--

LOCK TABLES `employee_salary_templates` WRITE;
/*!40000 ALTER TABLE `employee_salary_templates` DISABLE KEYS */;
INSERT INTO `employee_salary_templates` VALUES (3513,1,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3514,1,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3515,1,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3516,1,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3517,1,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,750.00,9000.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3518,1,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3519,1,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5425.00,65100.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3520,1,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1000.00,12000.00,444,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3521,2,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7000.00,84000.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3522,2,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3523,2,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3524,2,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3525,2,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,583.00,6996.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3526,2,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3527,2,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7192.00,86304.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3528,2,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1000.00,12000.00,445,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3529,3,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,28700.00,344400.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3530,3,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14350.00,172200.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3531,3,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3532,3,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3533,3,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2392.00,28704.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3534,3,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3535,3,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9008.00,108096.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3536,3,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5000.00,60000.00,446,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3537,4,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,19100.00,229200.00,447,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3538,4,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9550.00,114600.00,447,NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(3539,4,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3540,4,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3541,4,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1592.00,19104.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3542,4,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3543,4,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5008.00,60096.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3544,4,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,447,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3545,5,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,24198.00,290376.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3546,5,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12099.00,145188.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3547,5,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3548,5,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3549,5,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2017.00,24204.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3550,5,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3551,5,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7132.00,85584.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3552,5,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,448,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3553,6,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,31512.00,378144.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3554,6,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15756.00,189072.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3555,6,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3556,6,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3557,6,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2626.00,31512.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3558,6,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3559,6,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10179.00,122148.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3560,6,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10000.00,120000.00,449,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3561,7,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,29701.00,356412.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3562,7,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14851.00,178212.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3563,7,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3564,7,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3565,7,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2475.00,29700.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3566,7,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3567,7,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9424.00,113088.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3568,7,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8000.00,96000.00,450,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3569,8,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6450.00,77400.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3570,8,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3225.00,38700.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3571,8,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3572,8,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3573,8,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,538.00,6456.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3574,8,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3575,8,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8337.00,100044.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3576,8,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1000.00,12000.00,451,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3577,9,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,33098.00,397176.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3578,9,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,16549.00,198588.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3579,9,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3580,9,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3581,9,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2758.00,33096.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3582,9,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3583,9,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10841.00,130092.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3584,9,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,452,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3585,10,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12106.00,145272.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3586,10,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6053.00,72636.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3587,10,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3588,10,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3589,10,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1009.00,12108.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3590,10,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3591,10,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18234.00,218808.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3592,10,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,453,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3593,11,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7737.00,92844.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3594,11,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3869.00,46428.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3595,11,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3596,11,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3597,11,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,645.00,7740.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3598,11,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3599,11,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15746.00,188952.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3600,11,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,454,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3601,12,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7116.75,85392.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3602,12,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2861.00,34332.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3603,12,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3604,12,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3605,12,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,477.00,5724.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3606,12,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3607,12,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15062.00,180744.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3608,12,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,455,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3609,13,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6467.00,77604.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3610,13,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3234.00,38808.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3611,13,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3612,13,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3613,13,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,539.00,6468.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3614,13,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3615,13,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12677.00,152124.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3616,13,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,456,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3617,14,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8468.00,101616.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3618,14,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4234.00,50808.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3619,14,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3620,14,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3621,14,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,706.00,8472.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3622,14,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3623,14,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11868.00,142416.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3624,14,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,457,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3625,15,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7000.00,84000.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3626,15,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3627,15,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3628,15,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3629,15,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,583.00,6996.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3630,15,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3631,15,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5967.00,71604.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3632,15,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,458,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3633,16,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,21500.00,258000.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3634,16,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8600.00,103200.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3635,16,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3636,16,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3637,16,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1792.00,21504.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3638,16,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3639,16,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1619.00,19428.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3640,16,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,459,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3641,17,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3642,17,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2250.00,27000.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3643,17,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3644,17,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3645,17,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,375.00,4500.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3646,17,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3647,17,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4925.00,59100.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3648,17,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,460,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3649,18,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8000.00,96000.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3650,18,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4000.00,48000.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3651,18,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3652,18,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3653,18,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,667.00,8004.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3654,18,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3655,18,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7878.00,94536.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3656,18,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,461,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3657,19,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13600.00,163200.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3658,19,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6800.00,81600.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3659,19,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3660,19,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3661,19,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1133.00,13596.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3662,19,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3663,19,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15517.00,186204.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3664,19,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,462,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3665,20,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8750.00,105000.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3666,20,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4375.00,52500.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3667,20,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3668,20,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3669,20,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,729.00,8748.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3670,20,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3671,20,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8196.00,98352.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3672,20,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,463,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3673,21,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10332.00,123984.00,464,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3674,21,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5166.00,61992.00,464,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3675,21,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,464,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3676,21,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,464,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3677,21,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,861.00,10332.00,464,NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(3678,21,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,464,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3679,21,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15931.00,191172.00,464,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3680,21,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,464,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3681,22,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3797.00,45564.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3682,22,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1899.00,22788.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3683,22,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3684,22,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3685,22,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,316.00,3792.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3686,22,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3687,22,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3694.00,44328.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3688,22,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,465,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3689,23,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3797.00,45564.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3690,23,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1899.00,22788.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3691,23,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3692,23,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3693,23,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,316.00,3792.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3694,23,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3695,23,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3694.00,44328.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3696,23,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,466,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3697,24,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4175.00,50100.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3698,24,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2088.00,25056.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3699,24,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3700,24,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3701,24,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,348.00,4176.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3702,24,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3703,24,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7140.00,85680.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3704,24,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1000.00,12000.00,467,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3705,25,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7253.00,87036.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3706,25,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3627.00,43524.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3707,25,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3708,25,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3709,25,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,604.00,7248.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3710,25,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3711,25,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14579.00,174948.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3712,25,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,468,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3713,26,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3918.00,47016.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3714,26,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1959.00,23508.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3715,26,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3716,26,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3717,26,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,327.00,3924.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3718,26,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3719,26,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6516.00,78192.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3720,26,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,469,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3721,27,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8154.00,97848.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3722,27,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4077.00,48924.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3723,27,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3724,27,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3725,27,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,680.00,8160.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3726,27,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3727,27,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11318.00,135816.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3728,27,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,470,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3729,28,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7700.00,92400.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3730,28,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3850.00,46200.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3731,28,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3732,28,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3733,28,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,642.00,7704.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3734,28,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3735,28,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6858.00,82296.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3736,28,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,471,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3737,29,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,28000.00,336000.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3738,29,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14000.00,168000.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3739,29,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3740,29,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3741,29,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2333.00,27996.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3742,29,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3743,29,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,22717.00,272604.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3744,29,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,472,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3745,30,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7700.00,92400.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3746,30,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2861.00,34332.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3747,30,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3748,30,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3749,30,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,477.00,5724.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3750,30,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3751,30,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8012.00,96144.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3752,30,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,473,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3753,31,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12440.00,149280.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3754,31,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6220.00,74640.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3755,31,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3756,31,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3757,31,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1037.00,12444.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3758,31,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3759,31,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8453.00,101436.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3760,31,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,474,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3761,32,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11600.00,139200.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3762,32,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5800.00,69600.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3763,32,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3764,32,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3765,32,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,967.00,11604.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3766,32,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3767,32,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7683.00,92196.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3768,32,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,475,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3769,33,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6650.00,79800.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3770,33,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3325.00,39900.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3771,33,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3772,33,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3773,33,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,554.00,6648.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3774,33,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3775,33,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5521.00,66252.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3776,33,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,476,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3777,34,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,19200.00,230400.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3778,34,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9600.00,115200.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3779,34,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3780,34,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3781,34,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3782,34,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3783,34,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,14650.00,175800.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3784,34,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,477,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3785,35,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,20800.00,249600.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3786,35,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10400.00,124800.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3787,35,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3788,35,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3789,35,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1733.00,20796.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3790,35,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3791,35,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,16117.00,193404.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3792,35,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,478,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3793,36,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2800.00,33600.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3794,36,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3795,36,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3796,36,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3797,36,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,233.33,2796.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3798,36,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3799,36,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,616.67,7392.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3800,36,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,479,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3801,37,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5775.00,69300.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3802,37,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2888.00,34656.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3803,37,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3804,37,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3805,37,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,481.00,5772.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3806,37,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3807,37,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4406.00,52872.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3808,37,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,480,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3809,38,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3300.00,39600.00,481,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3810,38,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,481,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3811,38,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,481,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3812,38,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,481,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3813,38,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,481,NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(3814,38,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,481,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3815,38,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2825.00,33900.00,481,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3816,38,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,481,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3817,39,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3300.00,39600.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3818,39,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3819,39,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3820,39,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3821,39,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3822,39,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3823,39,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2825.00,33900.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3824,39,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,482,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3825,40,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3300.00,39600.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3826,40,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3827,40,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3828,40,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3829,40,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3830,40,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3831,40,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2825.00,33900.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3832,40,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,483,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3833,41,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10589.00,127068.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3834,41,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5295.00,63540.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3835,41,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3836,41,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3837,41,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,882.00,10584.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3838,41,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3839,41,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6756.00,81072.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3840,41,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,484,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3841,42,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5919.00,71028.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3842,42,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2960.00,35520.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3843,42,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3844,42,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3845,42,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,493.00,5916.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3846,42,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3847,42,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4588.00,55056.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3848,42,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,485,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3849,43,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15600.00,187200.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3850,43,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7800.00,93600.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3851,43,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3852,43,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3853,43,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1300.00,15600.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3854,43,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3855,43,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11350.00,136200.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3856,43,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,486,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3857,44,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7795.00,93540.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3858,44,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3898.00,46776.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3859,44,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3860,44,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3861,44,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3862,44,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3863,44,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6977.00,83724.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3864,44,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,487,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3865,45,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10588.00,127056.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3866,45,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5294.00,63528.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3867,45,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3868,45,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3869,45,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,882.00,10584.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3870,45,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3871,45,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6757.00,81084.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3872,45,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,488,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3873,46,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6300.00,75600.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3874,46,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3150.00,37800.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3875,46,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3876,46,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3877,46,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,525.00,6300.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3878,46,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3879,46,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5075.00,60900.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3880,46,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,489,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3881,47,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7175.00,86100.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3882,47,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3588.00,43056.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3883,47,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3884,47,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3885,47,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,598.00,7176.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3886,47,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3887,47,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6739.00,80868.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3888,47,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,490,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3889,48,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18000.00,216000.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3890,48,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9000.00,108000.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3891,48,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3892,48,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3893,48,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1500.00,18000.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3894,48,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3895,48,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13550.00,162600.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3896,48,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,491,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3897,49,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,26000.00,312000.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3898,49,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13000.00,156000.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3899,49,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3900,49,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3901,49,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2167.00,26004.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3902,49,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3903,49,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,71433.00,857196.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3904,49,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,492,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3905,50,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3300.00,39600.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3906,50,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1650.00,19800.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3907,50,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3908,50,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3909,50,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,275.00,3300.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3910,50,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3911,50,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2825.00,33900.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3912,50,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,493,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3913,51,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4576.00,54912.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3914,51,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2288.00,27456.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3915,51,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3916,51,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3917,51,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,381.00,4572.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3918,51,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3919,51,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1246.00,14952.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3920,51,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,494,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3921,52,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8645.00,103740.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3922,52,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4323.00,51876.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3923,52,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3924,52,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3925,52,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,720.00,8640.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3926,52,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,101.00,1212.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3927,52,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8061.00,96732.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3928,52,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,495,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3929,53,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8400.00,100800.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3930,53,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4200.00,50400.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3931,53,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3932,53,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3933,53,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,700.00,8400.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3934,53,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3935,53,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7750.00,93000.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3936,53,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,496,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3937,54,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13900.00,166800.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3938,54,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6950.00,83400.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3939,54,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3940,54,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3941,54,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1158.00,13896.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3942,54,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3943,54,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9792.00,117504.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3944,54,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,497,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3945,55,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5684.00,68208.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3946,55,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2842.00,34104.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3947,55,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3948,55,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3949,55,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,473.67,5676.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3950,55,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3951,55,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4290.33,51480.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3952,55,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,498,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3953,56,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7700.00,92400.00,499,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3954,56,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3850.00,46200.00,499,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3955,56,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,499,NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(3956,56,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,499,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3957,56,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,642.00,7704.00,499,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3958,56,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,499,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3959,56,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6858.00,82296.00,499,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3960,56,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,499,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3961,57,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6125.00,73500.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3962,57,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3062.50,36744.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3963,57,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3964,57,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3965,57,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,510.42,6120.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3966,57,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3967,57,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4852.08,58224.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3968,57,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,500,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3969,58,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3800.00,45600.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3970,58,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1900.00,22800.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3971,58,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3972,58,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3973,58,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,317.00,3804.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3974,58,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3975,58,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1333.00,15996.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3976,58,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,501,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3977,59,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8673.00,104076.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3978,59,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4337.00,52044.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3979,59,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3980,59,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3981,59,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,723.00,8676.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3982,59,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3983,59,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,662.00,7944.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3984,59,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,502,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3985,60,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9575.00,114900.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3986,60,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4788.00,57456.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3987,60,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3988,60,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3989,60,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,798.00,9576.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3990,60,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3991,60,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4072.00,48864.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3992,60,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,503,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3993,61,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13000.00,156000.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3994,61,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6500.00,78000.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3995,61,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3996,61,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3997,61,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1083.00,12996.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3998,61,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(3999,61,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5277.00,63324.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4000,61,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,504,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4001,62,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7063.20,84756.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4002,62,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3532.00,42384.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4003,62,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4004,62,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4005,62,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,589.00,7068.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4006,62,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4007,62,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9410.00,112920.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4008,62,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,505,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4009,63,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12000.00,144000.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4010,63,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6000.00,72000.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4011,63,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4012,63,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4013,63,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1000.00,12000.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4014,63,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4015,63,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2050.00,24600.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4016,63,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,506,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4017,64,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,37498.00,449976.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4018,64,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,18749.00,224988.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4019,64,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4020,64,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4021,64,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3124.83,37488.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4022,64,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4023,64,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13474.17,161688.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4024,64,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,507,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4025,65,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3566.00,42792.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4026,65,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1783.00,21396.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4027,65,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4028,65,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4029,65,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,297.00,3564.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4030,65,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4031,65,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5666.00,67992.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4032,65,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,508,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4033,66,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4041.00,48492.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4034,66,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2021.00,24252.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4035,66,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4036,66,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4037,66,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,337.00,4044.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4038,66,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4039,66,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6815.00,81780.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4040,66,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,509,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4041,67,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3600.00,43200.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4042,67,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1800.00,21600.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4043,67,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4044,67,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4045,67,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,300.00,3600.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4046,67,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4047,67,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4048,67,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,510,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4049,68,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4050,68,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4051,68,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4052,68,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1233.33,14796.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4053,68,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,266.67,3192.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4054,68,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4055,68,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4056,68,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,511,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4057,69,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3672.30,44064.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4058,69,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1836.15,22032.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4059,69,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4060,69,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4061,69,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,306.03,3672.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4062,69,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4063,69,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3476.53,41712.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4064,69,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,512,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4065,70,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11014.00,132168.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4066,70,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5507.00,66084.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4067,70,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4068,70,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4069,70,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,917.83,11004.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4070,70,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4071,70,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,23667.17,284004.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4072,70,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,513,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4073,71,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3150.00,37800.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4074,71,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1575.00,18900.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4075,71,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4076,71,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4077,71,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,263.00,3156.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4078,71,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4079,71,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4062.00,48744.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4080,71,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,514,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4081,72,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3955.00,47460.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4082,72,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1978.00,23736.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4083,72,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4084,72,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4085,72,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,330.00,3960.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4086,72,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4087,72,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3969.00,47628.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4088,72,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,515,NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(4089,73,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4090,73,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4091,73,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4092,73,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4093,73,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.17,2448.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4094,73,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4095,73,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,170.83,2040.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4096,73,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,516,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4097,74,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9575.00,114900.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4098,74,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4788.00,57456.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4099,74,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4100,74,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4101,74,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,798.00,9576.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4102,74,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4103,74,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4072.00,48864.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4104,74,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,517,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4105,75,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3916.85,46992.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4106,75,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1958.43,23496.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4107,75,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4108,75,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4109,75,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,326.40,3912.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4110,75,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4111,75,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2039.32,24468.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4112,75,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,518,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4113,76,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3389.70,40668.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4114,76,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1694.85,20328.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4115,76,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4116,76,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4117,76,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,282.48,3384.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4118,76,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4119,76,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2981.98,35772.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4120,76,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,519,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4121,77,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3248.70,38976.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4122,77,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1624.35,19488.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4123,77,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4124,77,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4125,77,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,270.73,3240.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4126,77,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4127,77,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2735.23,32820.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4128,77,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,520,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4129,78,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3916.85,46992.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4130,78,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1958.43,23496.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4131,78,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4132,78,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4133,78,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,326.40,3912.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4134,78,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4135,78,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2039.32,24468.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4136,78,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,521,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4137,79,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3590.30,43080.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4138,79,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1795.15,21540.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4139,79,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4140,79,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4141,79,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,299.19,3588.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4142,79,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4143,79,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1623.36,19476.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4144,79,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,522,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4145,80,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3426.85,41112.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4146,80,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1713.00,20556.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4147,80,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4148,80,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4149,80,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,286.00,3432.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4150,80,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4151,80,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1415.00,16980.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4152,80,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,523,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4153,81,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3389.70,40668.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4154,81,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1694.85,20328.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4155,81,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4156,81,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4157,81,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,282.48,3384.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4158,81,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4159,81,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2981.98,35772.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4160,81,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,524,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4161,82,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6225.00,74700.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4162,82,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3113.00,37356.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4163,82,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4164,82,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4165,82,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,519.00,6228.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4166,82,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4167,82,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7943.00,95316.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4168,82,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,525,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4169,83,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4873.25,58476.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4170,83,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2436.63,29232.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4171,83,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4172,83,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4173,83,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,406.10,4872.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4174,83,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4175,83,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8827.02,105924.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4176,83,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,526,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4177,84,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2780.70,33360.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4178,84,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1390.35,16680.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4179,84,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4180,84,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4181,84,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,231.73,2772.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4182,84,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4183,84,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1916.23,22992.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4184,84,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,527,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4185,85,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5942.50,71304.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4186,85,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2971.25,35652.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4187,85,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4188,85,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4189,85,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,495.21,5940.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4190,85,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4191,85,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11411.04,136932.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4192,85,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,528,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4193,86,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4660.80,55920.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4194,86,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2330.40,27960.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4195,86,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4196,86,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4197,86,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,388.40,4656.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4198,86,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4199,86,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5206.40,62472.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4200,86,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,529,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4201,87,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12096.00,145152.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4202,87,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6048.00,72576.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4203,87,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4204,87,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4205,87,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1008.00,12096.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4206,87,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4207,87,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,26282.00,315384.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4208,87,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,530,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4209,88,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13500.00,162000.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4210,88,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5850.00,70200.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4211,88,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4212,88,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4213,88,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1125.00,13500.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4214,88,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4215,88,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,21575.00,258900.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4216,88,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,531,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4217,89,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3741.15,44892.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4218,89,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1870.58,22440.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4219,89,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4220,89,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4221,89,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,311.76,3732.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4222,89,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4223,89,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1815.51,21780.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4224,89,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,532,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4225,90,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3400.95,40800.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4226,90,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1700.48,20400.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4227,90,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4228,90,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4229,90,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,283.41,3396.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4230,90,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,533,NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(4231,90,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1382.16,16584.00,533,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4232,90,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,533,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4233,91,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3960.50,47520.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4234,91,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1980.00,23760.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4235,91,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4236,91,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4237,91,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,330.00,3960.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4238,91,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4239,91,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,101.00,1212.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4240,91,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,534,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4241,92,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3960.50,47520.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4242,92,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1980.00,23760.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4243,92,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4244,92,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4245,92,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,330.00,3960.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4246,92,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4247,92,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,101.00,1212.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4248,92,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,535,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4249,93,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3960.50,47520.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4250,93,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1980.25,23760.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4251,93,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4252,93,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4253,93,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,330.04,3960.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4254,93,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4255,93,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.21,1200.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4256,93,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,536,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4257,94,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4080.50,48960.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4258,94,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2040.25,24480.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4259,94,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4260,94,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4261,94,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,340.04,4080.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4262,94,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4263,94,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,150.21,1800.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4264,94,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,537,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4265,95,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4635.00,55620.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4266,95,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2318.00,27816.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4267,95,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4268,95,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4269,95,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,386.00,4632.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4270,95,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4271,95,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8252.00,99024.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4272,95,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,538,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4273,96,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2939.00,35268.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4274,96,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1469.50,17628.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4275,96,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4276,96,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4277,96,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,244.92,2928.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4278,96,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4279,96,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4152.58,49824.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4280,96,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,539,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4281,97,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3061.00,36732.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4282,97,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1531.00,18372.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4283,97,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4284,97,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4285,97,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,255.00,3060.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4286,97,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4287,97,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1749.00,20988.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4288,97,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,540,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4289,98,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11620.00,139440.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4290,98,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5810.00,69720.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4291,98,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4292,98,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4293,98,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,968.00,11616.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4294,98,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4295,98,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,25133.00,301596.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4296,98,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,541,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4297,99,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8103.75,97236.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4298,99,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4052.00,48624.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4299,99,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4300,99,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4301,99,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,675.00,8100.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4302,99,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4303,99,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,16634.00,199608.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4304,99,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,542,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4305,100,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5705.00,68460.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4306,100,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2853.00,34236.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4307,100,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4308,100,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4309,100,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,475.00,5700.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4310,100,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4311,100,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10837.00,130044.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4312,100,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,543,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4313,101,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4314,101,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1750.00,21000.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4315,101,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4316,101,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,558.00,6696.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4317,101,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,292.00,3504.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4318,101,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4319,101,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4320,101,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,544,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4321,102,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4322,102,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4323,102,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4324,102,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1233.33,14796.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4325,102,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,266.67,3192.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4326,102,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4327,102,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4328,102,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,545,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4329,103,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4330,103,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4331,103,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4332,103,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4333,103,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,267.00,3204.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4334,103,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4335,103,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,783.00,9396.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4336,103,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,546,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4337,104,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4338,104,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4339,104,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4340,104,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4341,104,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,267.00,3204.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4342,104,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4343,104,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,783.00,9396.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4344,104,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,547,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4345,105,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2400.00,28800.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4346,105,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1200.00,14400.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4347,105,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4348,105,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4349,105,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4350,105,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4351,105,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2050.00,24600.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4352,105,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,548,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4353,106,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4354,106,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1750.00,21000.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4355,106,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4356,106,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,558.00,6696.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4357,106,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,292.00,3504.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4358,106,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4359,106,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4360,106,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,549,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4361,107,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,550,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4362,107,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,550,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4363,107,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,550,NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(4364,107,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,550,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4365,107,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,267.00,3204.00,550,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4366,107,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,550,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4367,107,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,783.00,9396.00,550,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4368,107,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,550,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4369,108,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4370,108,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1750.00,21000.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4371,108,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4372,108,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,558.00,6696.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4373,108,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,292.00,3504.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4374,108,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4375,108,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4376,108,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,551,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4377,109,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4800.00,57600.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4378,109,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2400.00,28800.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4379,109,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4380,109,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4381,109,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,400.00,4800.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4382,109,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4383,109,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2250.00,27000.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4384,109,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,552,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4385,110,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2400.00,28800.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4386,110,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1200.00,14400.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4387,110,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4388,110,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4389,110,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4390,110,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,101.00,1212.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4391,110,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2049.00,24588.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4392,110,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,553,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4393,111,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5721.75,68652.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4394,111,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2860.88,34320.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4395,111,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4396,111,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4397,111,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,476.81,5712.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4398,111,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4399,111,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10877.56,130524.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4400,111,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,554,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4401,112,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2400.00,28800.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4402,112,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1200.00,14400.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4403,112,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4404,112,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4405,112,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4406,112,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,102.00,1224.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4407,112,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2048.00,24576.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4408,112,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,555,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4409,113,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3600.00,43200.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4410,113,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1800.00,21600.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4411,113,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4412,113,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4413,113,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,300.00,3600.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4414,113,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4415,113,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4150.00,49800.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4416,113,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,556,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4417,114,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,26500.00,318000.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4418,114,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13250.00,159000.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4419,114,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4420,114,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4421,114,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2208.33,26496.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4422,114,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4423,114,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8091.67,97092.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4424,114,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,557,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4425,115,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,32123.00,385476.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4426,115,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,16061.50,192732.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4427,115,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4428,115,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4429,115,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2676.92,32112.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4430,115,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4431,115,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10434.58,125208.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4432,115,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,558,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4433,116,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,10252.00,123024.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4434,116,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5126.00,61512.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4435,116,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4436,116,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4437,116,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,854.00,10248.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4438,116,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4439,116,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6448.00,77376.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4440,116,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,559,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4441,117,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4442,117,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4443,117,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4444,117,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4445,117,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4446,117,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4447,117,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4448,117,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,560,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4449,118,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4450,118,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4451,118,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4452,118,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4453,118,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4454,118,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4455,118,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4456,118,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,561,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4457,119,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4200.00,50400.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4458,119,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4459,119,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4460,119,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4461,119,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,350.00,4200.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4462,119,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4463,119,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3200.00,38400.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4464,119,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,562,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4465,120,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,24241.00,290892.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4466,120,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12120.50,145440.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4467,120,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4468,120,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4469,120,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2020.08,24240.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4470,120,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4471,120,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5462.42,65544.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4472,120,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,563,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4473,121,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4474,121,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4475,121,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4476,121,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4477,121,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4478,121,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4479,121,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4480,121,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,564,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4481,122,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4800.00,57600.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4482,122,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2400.00,28800.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4483,122,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4484,122,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4485,122,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,400.00,4800.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4486,122,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4487,122,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2250.00,27000.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4488,122,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,565,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4489,123,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4490,123,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4491,123,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4492,123,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4493,123,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4494,123,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4495,123,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4496,123,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,566,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4497,124,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,567,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4498,124,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,567,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4499,124,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,567,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4500,124,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,567,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4501,124,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,567,NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(4502,124,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,567,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4503,124,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,567,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4504,124,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,567,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4505,125,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4506,125,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4507,125,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4508,125,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4509,125,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4510,125,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4511,125,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4512,125,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,568,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4513,126,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4514,126,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4515,126,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4516,126,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4517,126,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4518,126,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4519,126,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4520,126,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,569,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4521,127,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4522,127,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4523,127,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4524,127,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4525,127,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4526,127,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4527,127,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4528,127,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,570,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4529,128,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4530,128,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4531,128,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4532,128,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4533,128,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4534,128,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4535,128,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4536,128,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,571,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4537,129,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2800.00,33600.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4538,129,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4539,129,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4540,129,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4541,129,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,233.00,2796.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4542,129,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4543,129,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1417.00,17004.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4544,129,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,572,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4545,130,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4546,130,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4547,130,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4548,130,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4549,130,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4550,130,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4551,130,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4552,130,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,573,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4553,131,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4554,131,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4555,131,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4556,131,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4557,131,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4558,131,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4559,131,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4560,131,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,574,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4561,132,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4562,132,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4563,132,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4564,132,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4565,132,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4566,132,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4567,132,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,971.00,11652.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4568,132,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,575,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4569,133,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5250.00,63000.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4570,133,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2625.00,31500.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4571,133,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4572,133,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4573,133,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,438.00,5256.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4574,133,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4575,133,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4537.00,54444.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4576,133,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,576,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4577,134,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3750.00,45000.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4578,134,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1875.00,22500.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4579,134,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4580,134,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4581,134,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,313.00,3756.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4582,134,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4583,134,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12.00,144.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4584,134,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,577,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4585,135,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8120.00,97440.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4586,135,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4060.00,48720.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4587,135,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4588,135,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4589,135,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,677.00,8124.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4590,135,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4591,135,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7393.00,88716.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4592,135,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,578,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4593,136,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7455.00,89460.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4594,136,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3728.00,44736.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4595,136,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4596,136,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4597,136,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,621.00,7452.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4598,136,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4599,136,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7346.00,88152.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4600,136,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,579,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4601,137,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3159.00,37908.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4602,137,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1580.00,18960.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4603,137,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4604,137,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4605,137,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,263.00,3156.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4606,137,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4607,137,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1873.00,22476.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4608,137,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,580,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4609,138,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2800.00,33600.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4610,138,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4611,138,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4612,138,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4613,138,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4614,138,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4615,138,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4616,138,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,581,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4617,139,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4618,139,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4619,139,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4620,139,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4621,139,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4622,139,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4623,139,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4624,139,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,582,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4625,140,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2800.00,33600.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4626,140,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1400.00,16800.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4627,140,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4628,140,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4629,140,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4630,140,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4631,140,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4632,140,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,583,NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(4633,141,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4634,141,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4635,141,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4636,141,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4637,141,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,200.00,2400.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4638,141,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4639,141,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4640,141,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,584,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4641,142,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4614.00,55368.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4642,142,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2307.00,27684.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4643,142,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4644,142,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4645,142,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,385.00,4620.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4646,142,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4647,142,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3726.00,44712.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4648,142,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,585,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4649,143,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5250.00,63000.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4650,143,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2625.00,31500.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4651,143,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4652,143,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4653,143,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,438.00,5256.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4654,143,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,101.00,1212.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4655,143,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4536.00,54432.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4656,143,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,586,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4657,144,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4658,144,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4659,144,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4660,144,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4661,144,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4662,144,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,102.00,1224.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4663,144,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,969.00,11628.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4664,144,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,587,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4665,145,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2450.00,29400.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4666,145,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1225.00,14700.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4667,145,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4668,145,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4669,145,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,204.00,2448.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4670,145,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,103.00,1236.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4671,145,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,968.00,11616.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4672,145,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,588,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4673,146,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5250.00,63000.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4674,146,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2625.00,31500.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4675,146,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4676,146,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4677,146,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,438.00,5256.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4678,146,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4679,146,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4537.00,54444.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4680,146,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,589,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4681,147,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2100.00,25200.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4682,147,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1050.00,12600.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4683,147,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4684,147,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4685,147,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,175.00,2100.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4686,147,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4687,147,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1525.00,18300.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4688,147,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,590,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4689,148,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4690,148,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7750.00,93000.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4691,148,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4692,148,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4693,148,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4694,148,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4695,148,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,13050.00,156600.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4696,148,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,591,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4697,149,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8250.00,99000.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4698,149,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5125.00,61500.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4699,149,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4700,149,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4701,149,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,687.50,8244.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4702,149,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4703,149,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3487.50,41844.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4704,149,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,592,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4705,150,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15000.00,180000.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4706,150,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,9250.00,111000.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4707,150,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4708,150,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4709,150,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4710,150,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4711,150,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,8550.00,102600.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4712,150,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,593,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4713,151,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6300.00,75600.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4714,151,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5250.00,63000.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4715,151,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4716,151,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4717,151,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,525.00,6300.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4718,151,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4719,151,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5975.00,71700.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4720,151,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,594,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4721,152,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5400.00,64800.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4722,152,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4723,152,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4724,152,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4725,152,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,450.00,5400.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4726,152,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4727,152,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5300.00,63600.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4728,152,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,595,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4729,153,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3267.60,39204.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4730,153,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1633.80,19596.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4731,153,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4732,153,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4733,153,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,272.30,3264.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4734,153,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4735,153,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1212.30,14544.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4736,153,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,596,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4737,154,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4738,154,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3750.00,45000.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4739,154,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4740,154,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4741,154,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,625.00,7500.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4742,154,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4743,154,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15175.00,182100.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4744,154,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,597,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4745,155,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3400.95,40800.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4746,155,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1701.00,20412.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4747,155,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4748,155,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4749,155,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,283.41,3396.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4750,155,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4751,155,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1381.64,16572.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4752,155,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,598,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4753,156,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7500.00,90000.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4754,156,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3750.00,45000.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4755,156,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4756,156,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4757,156,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,625.00,7500.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4758,156,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4759,156,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,23692.00,284304.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4760,156,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,599,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4761,157,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6044.25,72528.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4762,157,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3022.13,36264.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4763,157,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4764,157,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4765,157,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,503.69,6036.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4766,157,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4767,157,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11656.94,139872.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4768,157,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,600,NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(4769,158,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7000.00,84000.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4770,158,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3500.00,42000.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4771,158,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4772,158,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4773,158,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,583.00,6996.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4774,158,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4775,158,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,12770.00,153240.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4776,158,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,601,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4777,159,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2829.00,33948.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4778,159,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1414.50,16968.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4779,159,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4780,159,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4781,159,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4782,159,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4783,159,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1106.50,13272.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4784,159,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,602,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4785,160,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3010.00,36120.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4786,160,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1505.00,18060.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4787,160,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4788,160,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4789,160,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,250.83,3000.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4790,160,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4791,160,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1684.17,20208.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4792,160,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,603,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4793,161,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2829.00,33948.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4794,161,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1414.50,16968.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4795,161,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4796,161,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,650.00,7800.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4797,161,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4798,161,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4799,161,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1106.50,13272.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4800,161,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,604,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4801,162,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4500.00,54000.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4802,162,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2250.00,27000.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4803,162,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,800.00,9600.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4804,162,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,975.00,11700.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4805,162,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,375.00,4500.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4806,162,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4807,162,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4808,162,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,605,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4809,163,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5070.00,60840.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4810,163,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2535.00,30420.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4811,163,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4812,163,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4813,163,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,423.00,5076.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4814,163,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4815,163,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5922.00,71064.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4816,163,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,606,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4817,164,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,4904.00,58848.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4818,164,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,2452.00,29424.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4819,164,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4820,164,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4821,164,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,409.00,4908.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4822,164,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4823,164,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5630.00,67560.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4824,164,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,607,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4825,165,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7560.00,90720.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4826,165,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5400.00,64800.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4827,165,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4828,165,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4829,165,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,630.00,7560.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4830,165,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4831,165,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,5060.00,60720.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4832,165,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,608,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4833,166,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7700.00,92400.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4834,166,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,3850.00,46200.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4835,166,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4836,166,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4837,166,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,642.00,7704.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4838,166,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4839,166,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,6858.00,82296.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4840,166,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,609,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4841,167,1,1,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,15760.00,189120.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4842,167,1,2,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,7880.00,94560.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4843,167,1,4,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1600.00,19200.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4844,167,1,22,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1250.00,15000.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4845,167,1,23,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,1313.00,15756.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4846,167,1,9,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,100.00,1200.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4847,167,1,24,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,11497.00,137964.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(4848,167,1,25,0,NULL,0.00,NULL,NULL,NULL,'Monthly',NULL,0.00,0.00,610,NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_templates`
--

LOCK TABLES `employee_templates` WRITE;
/*!40000 ALTER TABLE `employee_templates` DISABLE KEYS */;
INSERT INTO `employee_templates` VALUES (444,1,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(445,2,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(446,3,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(447,4,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:06','2017-06-07 06:47:06'),(448,5,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(449,6,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(450,7,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(451,8,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(452,9,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(453,10,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(454,11,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(455,12,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(456,13,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(457,14,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(458,15,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(459,16,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(460,17,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(461,18,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(462,19,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(463,20,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(464,21,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:07','2017-06-07 06:47:07'),(465,22,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(466,23,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(467,24,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(468,25,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(469,26,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(470,27,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(471,28,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(472,29,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(473,30,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(474,31,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(475,32,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(476,33,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(477,34,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(478,35,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(479,36,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(480,37,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(481,38,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:08','2017-06-07 06:47:08'),(482,39,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(483,40,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(484,41,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(485,42,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(486,43,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(487,44,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(488,45,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(489,46,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(490,47,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(491,48,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(492,49,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(493,50,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(494,51,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(495,52,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(496,53,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(497,54,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(498,55,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(499,56,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:09','2017-06-07 06:47:09'),(500,57,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(501,58,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(502,59,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(503,60,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(504,61,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(505,62,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(506,63,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(507,64,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(508,65,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(509,66,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(510,67,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(511,68,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(512,69,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(513,70,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(514,71,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(515,72,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(516,73,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:10','2017-06-07 06:47:10'),(517,74,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(518,75,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(519,76,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(520,77,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(521,78,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(522,79,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(523,80,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(524,81,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(525,82,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(526,83,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(527,84,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(528,85,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(529,86,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(530,87,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(531,88,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(532,89,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(533,90,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:11','2017-06-07 06:47:11'),(534,91,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(535,92,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(536,93,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(537,94,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(538,95,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(539,96,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(540,97,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(541,98,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(542,99,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(543,100,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(544,101,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(545,102,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(546,103,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(547,104,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(548,105,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(549,106,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(550,107,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:12','2017-06-07 06:47:12'),(551,108,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(552,109,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(553,110,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(554,111,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(555,112,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(556,113,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(557,114,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(558,115,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(559,116,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(560,117,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(561,118,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(562,119,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(563,120,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(564,121,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(565,122,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(566,123,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(567,124,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:13','2017-06-07 06:47:13'),(568,125,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(569,126,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(570,127,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(571,128,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(572,129,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(573,130,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(574,131,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(575,132,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(576,133,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(577,134,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(578,135,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(579,136,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(580,137,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(581,138,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(582,139,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(583,140,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(584,141,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:14','2017-06-07 06:47:14'),(585,142,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(586,143,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(587,144,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(588,145,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(589,146,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(590,147,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(591,148,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(592,149,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(593,150,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(594,151,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(595,152,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(596,153,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(597,154,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(598,155,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(599,156,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(600,157,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:15','2017-06-07 06:47:15'),(601,158,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(602,159,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(603,160,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(604,161,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(605,162,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(606,163,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(607,164,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(608,165,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(609,166,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16'),(610,167,1,NULL,1,'2017-06-07',NULL,'2017-06-07 06:47:16','2017-06-07 06:47:16');
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
INSERT INTO `employee_types` VALUES (1,'1.0','Trainee',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Permanent',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Probation',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','Resigned',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','Confirmed',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
-- Table structure for table `employeer_esics`
--

DROP TABLE IF EXISTS `employeer_esics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeer_esics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esic_date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `actual_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employeer_esics_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeer_esics`
--

LOCK TABLES `employeer_esics` WRITE;
/*!40000 ALTER TABLE `employeer_esics` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeer_esics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeer_pfs`
--

DROP TABLE IF EXISTS `employeer_pfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeer_pfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `pf_date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actual_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employeer_pfs_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeer_pfs`
--

LOCK TABLES `employeer_pfs` WRITE;
/*!40000 ALTER TABLE `employeer_pfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeer_pfs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'SPHO001','EMP0000001',NULL,NULL,'Shriniwas','A','Marathe','1958-08-05','Male','9623723880',NULL,'smarathe@spanpump.com','Plot No.60, Block No.6, 1st Floor, Bhide Niwara Co-operative Housing Society Ltd., Yeshwant Nagar, Opp. Balaji Mandir,Talegaon Dabhade, Taluka : Maval, Dist. Pune - 410507',1,20,504,'Pune',410507,'Plot No.60, Block No.6, 1st Floor, Bhide Niwara Co-operative Housing Society Ltd., Yeshwant Nagar, Opp. Balaji Mandir,Talegaon Dabhade, Taluka : Maval, Dist. Pune - 410507','0','AAVPM8394E',NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:09:45','2017-06-06 22:41:04',NULL,NULL,NULL,NULL),(2,'SPHO002','EMP0000002',NULL,NULL,'Vaishali',NULL,'Paradkar','1989-03-27','Female','9767530161',NULL,'hoacc3@spanpump.com','713 Budhwar Peth , 05 Om ganesh Co.op Housing Society Pune',1,20,504,'Pune',411002,'Ab-15 , Suvarn Nagari , Manikbaug , Sinhgad Road Pune - 411 041','0','CKSPP7542L',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:18','2017-06-06 22:12:18',NULL,NULL,NULL,NULL),(3,'SPHO003','EMP0000003',NULL,NULL,'Suyash ',NULL,'Tambe','1981-06-13','Male','7774060034',NULL,'hrmanager@spanpump.com','A-101,Karan Paradise,Pimple Gurav,Pune,411061',1,20,504,'Pune',411061,'A-101,Karan Paradise,Pimple Gurav,Pune,411061','0','0.0',NULL,'Married',3,NULL,1,NULL,'No','No','Active',3,NULL,1,1,7,NULL,NULL,'2017-06-06 22:12:18','2017-06-07 05:25:14',NULL,NULL,NULL,NULL),(4,'SPHO004','EMP0000004',NULL,NULL,'Divya ',NULL,'Mandare','1988-09-20','Female','9767916662',NULL,'hrassistant2@spanpump.com','2398 C Ward, Shaniwar Peth, Kolhapur -416002',1,20,479,'Kolhapur',416002,'Shriniwas,Near Shristi Lawn, Back to JRD Tata Bridge, Pimple Gurav','0','0.0',NULL,'UnMarried',1,NULL,1,NULL,'No','No','Active',3,NULL,1,1,7,NULL,NULL,'2017-06-06 22:12:18','2017-06-13 10:44:12',NULL,NULL,NULL,NULL),(5,'SPHO005','EMP0000005',NULL,NULL,'Sreekanth',NULL,'Guntur','1988-06-12','Male','7774060036',NULL,'sreekanth@spanpump.com','Dr. No-8/36, Kapu Street, Via- Rama Mandiram, Narayana Reddy Pet, \n Nellore Rural Mandal, Nellore-524314, Andhra Pradesh.',1,2,42,'Nellore',524314,'G.Sreekanth,Flat No-4, 2nd floor,Mantri Apartments,D-Block,Shivalayam street,Sai chowk, Sus-Pashan Road, Pune-411021,Maharashtra','0','0.0',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,27,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(6,'SPHO006','EMP0000006',NULL,NULL,'Shrikanth ',NULL,'Varpe','1978-04-26','Male','7722016051',NULL,'shrikant.varpe@spanpump.com','H.No. 1026 Samarth colony,Vijay Nagar, Kalewadi, Pune – 17',1,20,504,'Pune',411017,'H.No. 1026 Samarth colony,Vijay Nagar, Kalewadi, Pune – 17','0','ADYPV1563E',NULL,'Married',2,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(7,'SPHO007','EMP0000007',NULL,NULL,'Chintamani ',NULL,'Dandekar','1979-01-21','Male','9850965248',NULL,'chetan@spanpump.com','FL. NO-15, Kaustubh Appt, Mahalaxmi Soct. ,Lane no-4, AnandNagar, Sinhagad Road, Pune-411051',1,20,504,'Pune',411051,'FL. NO-15, Kaustubh Appt, Mahalaxmi Soct. ,Lane no-4, AnandNagar, Sinhagad Road, Pune-411051','0','0.0',NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(8,'SPHO008','EMP0000008',NULL,NULL,'Pravinsinh ',NULL,'Chougule','1986-10-14','Male','9763229298',NULL,'hoacc3@spanpump.com','C/o - Tushar Choudhari,S.N 36, Near Dr. Nene, Vivekananda Colony. Kothrud Pune',1,20,504,'Pune',411038,'C/o - Tushar Choudhari,S.N 36, Near Dr. Nene, Vivekananda Colony. Kothrud Pune','0','0.0',NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(9,'SPHO009','EMP0000009',NULL,NULL,'Sandeep ',NULL,'Gawde','1969-03-09','Male','9689941523',NULL,'sandeep.gawde@spanpump.com','Flat No 5, Block No 3,Gopinath Nagar A Co Socity, Kothrud',1,20,504,'Pune',411038,'Flat No 5, Block No 3,Gopinath Nagar A Co Socity, Kothrud','0','0.0',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(10,'SPHO010','EMP0000010',NULL,NULL,'Pravin ',NULL,'Gadekar','1987-06-21','Male','8378988035',NULL,'pravin@spanpump.com','Manku - baba mala, ranjangaon road,rahata, Tal - Rahata, Dist A Nagar',1,NULL,707,'Pune',413719,'Sno 15/6,snehakit colony,behind kakde city,karvenagar, pune 411052','0','0.0',NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(11,'SPHO011','EMP0000011',NULL,NULL,'Suhas ','Bapu','Kopnar','1988-03-21','Male','8264215816',NULL,'suhas.kopnar@spanpump.com','A/P: Kopnar Wasti, Yawat, Tal: Daund, Dist: Pune, Maharashtra – 412214.',1,20,504,'Pune',412214,'A/P: Kopnar Wasti, Yawat, Tal: Daund, Dist: Pune, Maharashtra – 412214.','0','0.0',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(12,'SPHO012','EMP0000012',NULL,NULL,'Shriniwas','S','Mandlekar','1987-06-17','Male','8600032098',NULL,'shriniwas@spanpump.com','Shrimai, New Shukrawari Road, Near Gandhi Gate,Mahal Nagpur',1,20,488,NULL,440032,'H-1 404, Swiss County, Thergao, Chinchwad, Pune 411033','0','ASBPM5058P',NULL,'Married',5,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(13,'SPHO013','EMP0000013',NULL,NULL,'Pavan ',NULL,'Choudhary','1989-07-29','Male','9370904680',NULL,'pavan@spanpump.com','S/O Laxman D. Choudhary , Patvipura inside , Ambagte Amravati-444601',1,20,433,NULL,444601,'C/o Abhishek V. Gujarathi, F-15 Soba Savera Apartment,opp to Yashwant highschool , Bibewadigao pune-411037','0','0.0',NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(14,'SPHO014','EMP0000014',NULL,NULL,'Supriya ',NULL,'Chaudhary','1985-04-03','Female','9665391344',NULL,'supriya@spanpump.com','Pravaranagar,Tal Rahata A\'nagar 413712',1,20,707,NULL,413712,'Mayur Colony,Kothrud ,pune 038','0','0.0',NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(15,'SPHO015','EMP0000015',NULL,NULL,'Tejas ',NULL,'Sawant','1991-12-31','Male','8855951715',NULL,'hoadmin@spanpump.com','Sr. no. 34/1/2, plot no 570/5 Torna app. Behind bharti vidyapith. Near RK Hostel, Dhankawadi, Pune 411043',1,20,504,'Pune',411043,'Sr. no. 34/1/2, plot no 570/5 Torna app. Behind bharti vidyapith. Near RK Hostel, Dhankawadi, Pune 411043','0','0.0',NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,21,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(16,'SPHO016','EMP0000016',NULL,NULL,'Avani',NULL,'Dandekar',NULL,'Female','0',NULL,'acb@gmail.com','FL. NO-15, Kaustubh Appt, Mahalaxmi Soct. ,Lane no-4, AnandNagar, Sinhagad Road, Pune-411051',1,20,504,'Pune',411051,NULL,'0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(17,'SPHO017','EMP0000017',NULL,NULL,'Manisha ',NULL,'Miraje','1992-06-30','Female','9604080574',NULL,'careers@spanpump.com','2101/2, E Ward, Sachin Bunglow, Laxmi Nagar, kolhapur',1,20,479,'Kolhapur',416005,'Bhairavnath  Appartment, Near to Bitwise company, Pune','7267','0.0',NULL,'UnMarried',8,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,7,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(18,'SPHO018','EMP0000018',NULL,NULL,'Shrikant  ',NULL,'Chavan','1990-12-13','Male','8087061949',NULL,'shrikant.c@spanpump.com','At.P.Sawarda,Tal-Chiplun,Dist -Ratnagiri',1,20,506,NULL,415110,'Ashwarya Laxmi Apartment,Wagohli Pune','0','AVZPC9022E',NULL,'UnMarried',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(19,'SPHO019','EMP0000019',NULL,NULL,'Madhura',NULL,'Varpe',NULL,'Female','0',NULL,'acb@gmail.com','H.No. 1026 Samarth colony,Vijay Nagar, Kalewadi, Pune – 17',1,20,504,'Pune',411017,NULL,'0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(20,'SPHO020','EMP0000020',NULL,NULL,'Ishwar ',NULL,'Badgujar','1991-10-27','Male','9028014323',NULL,'itadmin@spanpump.com','C-402, Gurukunj, Dagdu Patil Nagar, Thergaon, Pune - 411033',1,20,504,'Pune',411033,'C-402, Gurukunj, Dagdu Patil Nagar, Thergaon, Pune - 411033','0','0.0',NULL,'UnMarried',2,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,25,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(21,'SPHO021','EMP0000021',NULL,NULL,'Ashish ',NULL,'Patel','1987-09-25','Male','9921401351',NULL,'tenders_am@spanpump.com','43, Mumbai Pune Road,Behind Jasraj Complex Khadkhi Pune 411003',1,20,504,'Pune',411003,'SR,NO.24 PAWALE CHAWL, BOPODI PUNE 411020','0','0.0',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:19','2017-06-06 22:12:19',NULL,NULL,NULL,NULL),(22,'SPHO022','EMP0000022',NULL,NULL,'Nitin ',NULL,'Aher','1990-10-11','Male','8888474847',NULL,'nitin.aher@spanpump.com','Room no 12, Renavikar colony,Pipeline Road, Savedi,Ahmednagar-414003Maharashtra (India)',1,20,428,NULL,414003,'Flat No.305,C2 Wing,Umang Primo,LVY Estate,Wagholi,Pune-412207','7294','0.0',NULL,'UnMarried',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(23,'SPHO023','EMP0000023',NULL,NULL,'Yogita ',NULL,'Jadhav','1992-03-07','Female','8796689812',NULL,'yogita.jadhav@spanpump.com','At Post - Bota, Tal - Sangamner, Dist - Ahmednagar',1,20,428,NULL,422605,'Flat no 4, Yogiraj Sadan, Bhelkenagar, Kothrud, Pune 38.','8612','0.0',NULL,'UnMarried',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(24,'SPHO024','EMP0000024',NULL,NULL,'Sachin ',NULL,'Bellewar','1992-06-02','Male','9011168680',NULL,'hoacc1@spanpump.com','At Post Karkyal Taluka-Aurad(B),Dist-Bidar (Karnataka)',1,17,327,NULL,585328,'Block No-10, Falke Niwas Mahadev Keasv Housing Socity Phugewadi','5809','0.0',NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(25,'SPHO025','EMP0000025',NULL,NULL,'Amit ',NULL,'Jagtap','1989-03-08','Male','7276563239',NULL,'amit.jagtap@spanpump.com','404,Saburi Park,Shriram Nagar, Lawjee, Khopoli-410203. ',1,20,478,NULL,410203,'flat no:8, Smruti CHS, Mahaganesh Colony, Pune-411038','0','ALPPJ4945B',NULL,'UnMarried',8,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(26,'SPHO026','EMP0000026',NULL,NULL,'Balaji ',NULL,'Kadam','1992-06-25','Male','797',NULL,'designexec@spanpump.com','At.Post Sawaleshwar ta.Kandhar Dist Nanded ',1,20,489,NULL,431714,'Near Sai Mandir  Aalandi Bhosari Rode Wadamukhwadi ','0','0.0',NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(27,'SPHO027','EMP0000027',NULL,NULL,'Prashant ',NULL,'Pawar','1988-09-25','Male','8975730979',NULL,'prashant.pawar@spanpump.com','Prashant Pawar, Ramtek Nivas, A/p- Goundwadi, Tal- Walwa, Dist- Sangali.',1,20,NULL,'Sangali',416313,'prashant pawar, C/o-Shri. S S Chinchkar, H. No. 538, Post. Nasrapur, Tal. Bhor, Pune-412213','0','0.0',NULL,'Married',2,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,2,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(28,'SPHO028','EMP0000028',NULL,NULL,'Pankaj ',NULL,'Pasalkar','1988-06-10','Male','9762436878',NULL,'pankaj.pasalkar@spanpump.com','Sr. No. 20/1 Punyainagar Pune-Satara road Dhankawadi Pune 411043',1,20,504,'Pune',411043,'Sr. No. 20/1 Punyainagar Pune-Satara road Dhankawadi Pune 411043','0','BAGPP1627M',NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(29,'SPHO029','EMP0000029',NULL,NULL,'Narendra ',NULL,NULL,'1987-07-02','Male','7737471214',NULL,'narendra@spanpump.com','H.no. 105, Vpo & The Kotkasim Dist - \nAlwar Rajasthan -301702',1,29,669,NULL,301702,'D1706 Lalit Nanded City Sinhgad Road Pune 411041','0','0.0',NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(30,'SPHO030','EMP0000030',NULL,NULL,'Girish ',NULL,'Ghodekar','1986-05-03','Male','8793263141',NULL,'tenderexecutive@spanpump.com','Room No. 798, Sr. No.10/11, Sukhsagar Nagar, Katraj, Pune - 411046',1,20,504,NULL,411046,'At-Jadhavwadi,Post-Ranjani,Tal-Ambegaon,Dist-Pune','0','0.0',NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(31,'SPHO031','EMP0000031',NULL,NULL,'Minal ',NULL,'Dhabarde','1993-04-09','Female','9561660183',NULL,'minal.dhabarde@spanpump.com','Plot No. 95, T1 Jagdamba Apartment, Indraprastha Nagar, Vinoba gram society, Nagpur-440022',1,20,488,NULL,440022,NULL,'0','0.0',NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(32,'SPHO032','EMP0000032',NULL,NULL,'Deepak ',NULL,'Mishra','1989-07-10','Male','9762309747',NULL,'engineering@spanpump.com','Sr. 24/6 B Munjabawasti Dhanori , Pune 411015. Near  Dhaneshwar School.',1,20,504,NULL,411015,'Sr. 24/6 B Munjabawasti Dhanori , Pune 411015. Near  Dhaneshwar School.','0','0.0',NULL,'Married',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,23,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(33,'SPHO033','EMP0000033',NULL,NULL,'Dipali ',NULL,'Barge','1985-07-10','Female','7038944386',NULL,'officereception@spanpump.com','At Post / Tal- Koregaon , Dist-Satara',1,20,511,NULL,415501,'Sollana Aprt - E - 506 , Opp Mc. Downolds , Thergaon','4697','0.0',NULL,'UnMarried',2,3,1,NULL,'No','No','Active',NULL,NULL,1,1,21,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(34,'SPHO034','EMP0000034',NULL,NULL,'Amit ',NULL,'Dhamdhame','1983-03-24','Male','797',NULL,'amit.d@spanpump.com','c/o Harshal Bhagwan Gaikwad  ,2nd floor, Sr. No. 116/10/1 , Balaji Colony, House No. 2, Near Balaji Temple, Sus Road, Pashan, Pune 411021',1,20,504,'Pune',411021,'c/o Harshal Bhagwan Gaikwad  ,2nd floor, Sr. No. 116/10/1 , Balaji Colony, House No. 2, Near Balaji Temple, Sus Road, Pashan, Pune 411021','0','ANQPD6175N',NULL,'Married',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,4,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(35,'SPHO035','EMP0000035',NULL,NULL,'Rashmi ',NULL,'Jethwani','1988-11-12','Female','9819833076',NULL,'rashmi.j@spanpump.com','H B 34/1, Near Durga Mata Temple,Pimpri Pune 411017',1,20,504,NULL,411017,'H B 34/1, Near Durga Mata Temple,Pimpri Pune 411017','0','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(36,'SPHO036','EMP0000036',NULL,NULL,'Atul ',NULL,'Tendulkar','1995-10-26','Male','9767534269',NULL,'NA','At post pali, devtale,tel & dist. Ratnagiri, 415803',1,20,506,NULL,415803,'Anjana niwas,\'102\",near mahadev mandir,mahalunge , tel. mulashi, dist. pune','2048','0.0',NULL,'UnMarried',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(37,'SPHO037','EMP0000037',NULL,NULL,'Ganesh ',NULL,'Bhosale','1986-11-06','Male','9766550090',NULL,'itsupport@spanpump.com','A/P- Ropale B.K, Tal -Pandharpur , Dist- Solapur,Maharastra.',1,20,517,NULL,413001,'Vishesh society, kothrude depo ,pune .','5151','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(38,'SPHO038','EMP0000038',NULL,NULL,'Tejas',NULL,'Shinde','1996-09-17','Male','0',NULL,'acb@gmail.com','At post- Gunjalwadi Tal. Junner Dist Pune-412401',1,20,504,'Gunjalwadi',412401,NULL,'577183471263',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:20','2017-06-06 22:12:20',NULL,NULL,NULL,NULL),(39,'SPHO039','EMP0000039',NULL,NULL,'Akshay',NULL,'Shinde','1995-08-01','Male','0',NULL,'acb@gmail.com','At Post- Bhairvanath nagar Udapur Dist-Pune',1,20,504,'Udapur',412409,NULL,'484769808688',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(40,'SPHO040','EMP0000040',NULL,NULL,'Omkar',NULL,'Pande','1995-05-02','Male','0',NULL,'acb@gmail.com','At Post- Tejewadi shiroli tal. Junner Dist-Pune',1,20,504,'Tejewadi Shiroli',412409,NULL,'808688247992',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(41,'SPHO041','EMP0000041',NULL,NULL,'Rahul ',NULL,'Kadlag','1991-05-14','Male','9096499057',NULL,'rahul.kadlag@spanpump.com','At:Sadatapur Post: Gogalgaon Sangamner,\nAhmadnagar, Loni Bk,413736',1,20,428,NULL,413736,'P250,Near Bashu Hotel,Pingle Wasti, koregaon Park Annexe,Mundhwa 411036','0','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(42,'SPHO042','EMP0000042',NULL,NULL,'Aniket ',NULL,'Mande','1990-10-02','Male','9168022780',NULL,'adminexec@spanpump.com','251/1,Devmala, At-Madhewadgaon, Tal-Shrigonda, Dist.-Ahmednagar-413726',1,20,428,NULL,413726,'Flat no-19,Dhanlaxmi complex,opp.Tulja Bhavani Mandir,Near Zeal College, Narhe, Pune-411041','5816','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,21,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(43,'SPHO043','EMP0000043',NULL,NULL,'Amol ',NULL,'Bhosale','1986-05-03','Male','9730811942',NULL,'exim@spanpump.com','F. No. 202, 2nd floor, Creative complex, Ganesh Nagar, Pimple Nilakh, Pune',1,20,504,'Pune',411027,'F. No. 202, 2nd floor, Creative complex, Ganesh Nagar, Pimple Nilakh, Pune','0','0.0',NULL,'Married',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(44,'SPHO044','EMP0000044',NULL,NULL,'Balasaheb ',NULL,'Yandayat','1991-07-20','Male','9762484605',NULL,'balasaheb@spanpump.com','At : Karjat, Post Hast Pokhari, Tal : Ambad, Dist : Jalna 431204 ',1,20,468,NULL,431204,NULL,'0','0.0',NULL,'Married',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(45,'SPHO045','EMP0000045',NULL,NULL,'Yuvraj ',NULL,'Pawar','1986-05-20','Male','9767048969',NULL,'hoacc4@spanpump.com','A/p Maloli Tal:-Malshiras Dist:- Solapur Pin No.413113',1,20,517,NULL,413113,'Mr.Yuvraj M Pawar, S No.15/20/21B/8, Flat No.42 \"Vighartha Tower\" Ambegaon BK, Pune-411043','0','0.0',NULL,'Married',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,1,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(46,'SPHO046','EMP0000046',NULL,NULL,'Sagar ',NULL,'Patil','1989-07-31','Male','9970125087',NULL,'electricalstores@spanpump.com','A/P- Hittani, Tal- Hukkeri, Dist- Belgaum, Pin- 591225',1,17,322,NULL,591225,'Flat No.202, Shriram Heights, Near Sanjuda Complex, Papade Wasti, Bhekarainagar, Hadapsar','549854772490','0.0',NULL,'UnMarried',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(47,'SPHO047','EMP0000047',NULL,NULL,'Vivek ',NULL,'Dhalgade','1991-07-17','Male','8308432376',NULL,'vivek.d@spanpump.com','A/p-Kadaknathwadi  Tal-washi  Dist-Osmanabad  Pin-413525',1,20,495,NULL,413525,'Akash Nagar Warje,Pune','0','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(48,'SPHO048','EMP0000048',NULL,NULL,'Nikhil ',NULL,'Patankar','1988-12-07','Male','8452800752',NULL,'nikhil.patankar@spanpump.com','B/36,Shree Shaktidham, CHS, Shree Nagar, Thane West-400604',1,20,520,NULL,400604,'Flat No:-16, Bldg No:-2, Pratik Nagar,Near Vishranthwadi, Yerawada,Pune -411006','0','0.0',NULL,'Married',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(49,'SPHO049','EMP0000049',NULL,NULL,'Pankaj ',NULL,'Nandgaonkar','1979-10-29','Male','9372304007',NULL,'pankaj@spanpump.com','D1706 Lalit Nanded City Sinhgad Road Pune 411041',1,20,504,'Pune',411043,'D1706 Lalit Nanded City Sinhgad Road Pune 411041','0','AEWPN6435N',NULL,'Married',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(50,'SPHO050','EMP0000050',NULL,NULL,'Bhushan',NULL,'Nemade','1990-02-21','Male','9730833096',NULL,'acb@gmail.com','A/P, 739-A, Rozade, Tal-Raver, Dist. Jalgaon-425504',1,20,NULL,NULL,425504,NULL,'725655774910',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(51,'SPHO051','EMP0000051',NULL,NULL,'Mahesh  ',NULL,'Kenche','1993-09-19','Male','9764537239',NULL,'NA','At Post-Dhoki Ta&Dist.-Osmanabad 413508',1,20,495,NULL,413508,'Lakshmi Niwas, Jambhulkar Nagar, Hinjewadi 411057','0','0.0',NULL,'UnMarried',1,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(52,'SPHO052','EMP0000052',NULL,NULL,'Gaurav',NULL,'Tadwalkar','1986-09-20','Male','9960388655',NULL,'exim@spanpump.com','160 B Rastapeth Shiralseth Chowk Pune 411011',1,20,504,'Pune',411011,'160 B Rastapeth Shiralseth Chowk Pune 411011','0','0.0',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,1,5,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(53,'SPHO053','EMP0000053',NULL,NULL,'Pooja ',NULL,'Kulkarni','1989-07-18','Female','8975972254',NULL,'pooja@spanpump.com','Orchid\'s FL no 5, Pl no 79, Rambuag Col, Paud Road Kothrud Pune',1,20,504,'Pune',411038,'Orchid\'s FL no 5, Pl no 79, Rambuag Col, Paud Road Kothrud Pune','0','0.0',NULL,'UnMarried',7,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(54,'SPHO054','EMP0000054',NULL,NULL,'Shoaib ',NULL,'Shaikh','1989-07-11','Male','9764124878',NULL,'shoaib.shaikh@spanpump.com','B/12, Kumar Homes, NIBM Road, Kondhwa, Pune – 48',1,20,504,'Pune',141048,'B/12, Kumar Homes, NIBM Road, Kondhwa, Pune – 48','0','0.0',NULL,'UnMarried',4,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:21','2017-06-06 22:12:21',NULL,NULL,NULL,NULL),(55,'SPHO055','EMP0000055',NULL,NULL,'Kalyani ',NULL,'Gaikwad','1990-12-20','Female','8956248394',NULL,'kalyani.gaikwad@spanpump.com','301, Sai Vihar(A), Near Naik Hospital, Kathelane, Dwarka, Nashik-422011',1,20,NULL,NULL,422011,'B-2, Kamdhenu Riddhi, Mahatma Ho. Soc., Kothrud, Pune-411038','642390880043','0.0',NULL,'Married',5,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(56,'SPHO056','EMP0000056',NULL,NULL,'Abhijeet ',NULL,'Kumbhar','1990-10-23','Male','8087680316',NULL,'abhijeet.kumbhar@spanpump.com','Omkar colony, lane number -2, warje malwadi, Pune',1,20,504,'Pune',411058,'Omkar colony, lane number -2, warje malwadi, Pune','0','0.0',NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,1,29,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(57,'SPHO057','EMP0000057',NULL,NULL,'Dhanesh',NULL,'Bankhile','1994-05-27','Male','8482939243',NULL,'NA','A/P-Barva,(Anjuman Stop) Samrudhi Arcade Flat No.2,Junnar ,Tal-Junnar Dist-pune Pin Code-410502',1,20,504,'Pune',410502,'A/P-Akurdi,Dalvinagar,Manisha Apporment Flat No-2 Tal:Haveli,Dist:pune','592711328914','0.0',NULL,'UnMarried',2,3,1,NULL,'No','No','Active',NULL,NULL,1,1,22,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(58,'SPPR001','EMP0000058',NULL,NULL,'G',NULL,'Dinesh','1997-05-15','Male','7331171608',NULL,'dk90770@gmail.com','D.No.3-23, Diguvapalli Village, Murarichintala Post, Lingal Mandal, Kadapa Dist.',1,2,23,'Kadapa',516390,NULL,'252327735314',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,2,3,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(59,'SPPR002','EMP0000059',NULL,NULL,'Anand',NULL,'Meshram','1987-12-15','Male','8236011156',NULL,'cgacc@spanpump.com','CSEB Colony, Rajnandgaon',1,7,129,NULL,491441,NULL,'0','BBWPM8762R',NULL,NULL,3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,1,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(60,'SPPR003','EMP0000060',NULL,NULL,'Rajkumar',NULL,'Singh','1978-07-23','Male','7587097843',NULL,'cgfto3@spanpump.com','1/84,Mahamaya Vihar,Kuldevi ,Rachna,Near CCN,Warehouse Road,Bilaspur, CG',1,7,129,NULL,495001,NULL,'0','BHTPR5087F',NULL,'Married',2,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(61,'SPPR004','EMP0000061',NULL,NULL,'Mahendra',NULL,'Sindhare','1976-10-16','Male','9826118839',NULL,'msindhare@spanpump.com','H.N-51/31,Near Banjari Temple,Banjari Nagar,Kushalpur,Raipur',1,7,129,'Raipur',492002,NULL,'0','AXCPS5262M',NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(62,'SPPR005','EMP0000062',NULL,NULL,'Divendra',NULL,'Soni','1987-06-11','Male','8280340108',NULL,'sonidivendra@gmail.com','Chhattisgarh',1,7,NULL,'Rajnandgaon',491441,'Ram Nagar, Rajeev Nagar  H.no.122 Behind Durga Temple  ','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(63,'SPPR006','EMP0000063',NULL,NULL,'G.',NULL,'Vishwanath','1953-11-23','Male','9039103139',NULL,'vishwanath@spanpump.com','Plot Nos-5,Jayanti Nagar,Near Verma Atta Chakki,Durg',1,7,113,NULL,491441,NULL,'0','ADAPG2457Q',NULL,'Married',5,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(64,'SPPR007','EMP0000064',NULL,NULL,'Ksheer',NULL,'Patel','1976-01-10','Male','9039998650',NULL,'cgbm@spanpump.com',' C/O Mrs Ck Patel,Plot No 369/7,Near Srishti Blocks,Avanti Vihar,Sector-2,Telibhandha,Raipur,CG\n\n',1,7,113,NULL,492002,NULL,'0','ARKPP9674L',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,5,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(65,'SPPR008','EMP0000065',NULL,NULL,'Devendra',NULL,'Kunghadkar','1988-06-30','Male','9691817466',NULL,'cgbackoffice4@spanpump.com','HN-839,Lanji-5, Village& Tahsil-Lanji,Distt- Balaghat, M.P.',1,23,544,NULL,481001,NULL,'0','BULPD6528G',NULL,NULL,4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(66,'SPPR009','EMP0000066',NULL,NULL,'Rath',NULL,'Ram','1984-11-27','Male','7828227425',NULL,'cglogistics1@spanpump.com','Vill+ Po- Jhabdi,Via-Katgi,Tah-Kasdol,Baloda Bazar',1,7,129,NULL,493335,NULL,'0','DJVPK5724A',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(67,'SPPR010','EMP0000067',NULL,NULL,'Ravindra','Kumar',NULL,'1992-02-27','Male','0',NULL,'kumarrabindra120@gmail.com','Adarsh Nagar,Gajodharganj',1,5,NULL,'Buxar',802103,'Patna','481035371038',NULL,NULL,'UnMarried',5,NULL,1,NULL,'No','No','Active',NULL,NULL,1,8,46,NULL,NULL,'2017-06-06 22:12:22','2017-06-07 08:57:15',NULL,NULL,NULL,NULL),(68,'SPPR011','EMP0000068',NULL,NULL,'Prasant Samal',NULL,'Samal','1993-04-04','Male','8280340131',NULL,'kumarprasant93@gmail.com ','AT/PO-Gopiakuda, Via/Ps-Kunjaga,',1,26,NULL,'JAGATSINGHPUR',754141,'AT/PO-GOPIAKUDA, VIA/PS-KUNJAGA','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(69,'SPPR012','EMP0000069',NULL,NULL,'Bhagbat',NULL,'Behera','1987-07-11','Male','8280340103',NULL,'pintu.behera007@gmail.com ','AT-New Balanda,Po-Handidhua,Va-Talcher, Angul',1,26,599,'ANGUL',759100,'AT-NEW BALANDA,PO-HANDIDHUA,VA-TALCHER, ANGUL','0',NULL,NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(70,'SPPR013','EMP0000070',NULL,NULL,'Srikanth',NULL,'Kondradunda',NULL,'Male','0',NULL,'acb@gmail.com','D No-19-11-5, Boyapativari Street,Lanchester Road,Sangadigunta',1,2,22,'Guntur',522003,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(71,'SPPR014','EMP0000071',NULL,NULL,'Anil',NULL,'Parashar','1981-06-18','Male','8594999251',NULL,'kumarnirmal170@gmail.com ','Mantri Chak, Hanuman Mandir Gali, Baripada',1,26,NULL,'BARIPADA',757003,'Mantri Chak, Hanuman Mandir Gali, Baripada','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(72,'SPPR015','EMP0000072',NULL,NULL,'Anirudha',NULL,'Singh','1990-01-20','Male','7331171604',NULL,'singhanirudha0@gmail.com','Hatikholia Post, Soro Via, Balasore Dist., Odissa',1,26,601,'Balasore',756045,NULL,'814335589220',NULL,NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,7,47,NULL,NULL,'2017-06-06 22:12:22','2017-06-06 22:12:22',NULL,NULL,NULL,NULL),(73,'SPPR016','EMP0000073',NULL,NULL,'Anjan','Kumar','Behera','1987-04-07','Male','8280340092',NULL,'beheraanjan2004@gmail.com ','AT- SADANANDAPUR PUR,PO-AMARDA ROED',1,26,NULL,'AMARDA',756030,'AT- SADANANDAPUR PUR,PO-AMARDA ROED','0',NULL,NULL,'Married',5,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(74,'SPPR017','EMP0000074',NULL,NULL,'Rajkumar',NULL,'Singh','1990-12-06','Male','8678086814',NULL,'rjAccount@spanpump.com','Vill-Hastinapur,Po-Bhalua,Ps-Shambhuganj',1,5,91,'Banka',813207,'vashali nagar jaipur','715690447311','FVNPS7759R',NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,5,1,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(75,'SPPR018','EMP0000075',NULL,NULL,'Bikram',NULL,'Senapati','1992-06-18','Male','7077020570',NULL,'senapati99bikram@gmail.com ','AT/PO-MANDIA,VIA-MORADA, BLOCK-RASGOVINDPUR, ',1,26,NULL,'BARIPADA',757003,'AT/PO-MANDIA,VIA-MORADA, BLOCK-RASGOVINDPUR, ','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(76,'SPPR019','EMP0000076',NULL,NULL,'Amar','Kumar','Das','1991-01-24','Male','8280340102',NULL,'amarkumardas465@gmail.com','AT-TULASICHOURA,PO-TAKATPUR, VIA-BARIPADA',1,26,NULL,'BARIPADA',757003,'AT-TULASICHOURA,PO-TAKATPUR, VIA-BARIPADA','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(77,'SPPR020','EMP0000077',NULL,NULL,'Ranjan','Kumar','Parida','1990-07-04','Male','8280340105',NULL,'ranjanparida.spanpump@gmail.com ','AT-TENTULIA, PO-RANIBANDH, VIA-BADASAHI, PS-KHUNTA',1,26,NULL,'BARIPADA',757003,'AT-TENTULIA, PO-RANIBANDH, VIA-BADASAHI, PS-KHUNTA','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(78,'SPPR021','EMP0000078',NULL,NULL,'Sairam',NULL,'Sethi','1993-03-20','Male','8280340104',NULL,'sairamsethi.111@gmail.com ','C/O-LAXMIDHAR SETHI, AT-TAKADIDA, PO-PATAGADIA, PS-RASGOVINDPUR',1,26,NULL,'BARIPADA',757016,'C/O-LAXMIDHAR SETHI, AT-TAKADIDA, PO-PATAGADIA, PS-RASGOVINDPUR','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(79,'SPPR022','EMP0000079',NULL,NULL,'Prakash','Prasad','Saha','1988-07-05','Male','8280340126',NULL,'88prakashsaha@gmail.com ','AT-DARGADAHI, WORD NO-19, PO-BARIPADA, DIST-MAYURBHANJ',1,26,NULL,'BARIPADA',757001,'AT-DARGADAHI, WORD NO-19, PO-BARIPADA, DIST-MAYURBHANJ','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(80,'SPPR023','EMP0000080',NULL,NULL,'Md.',NULL,'Azhar','1992-12-15','Male','8280340127',NULL,'sk.azharsiddique@gmail.com','AT-KALIKAPUR, W NO-24,',1,26,NULL,'Baripada',757001,'AT-KALIKAPUR, W NO-24,','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(81,'SPPR024','EMP0000081',NULL,NULL,'Safalya','Kumar','Sahoo','1993-08-31','Male','8280340107',NULL,'safalyasahoo10@gmail.com','AT-MURGABADI,BIJAYRA MCHANDRAPUR, PO-BHANJPUR',1,26,NULL,'BARIPADA',757001,'AT-MURGABADI,BIJAYRA MCHANDRAPUR, PO-BHANJPUR','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(82,'SPPR025','EMP0000082',NULL,NULL,'Navneet',NULL,'Mishra','1987-03-19','Male','9407945088',NULL,'cgnavneet@spanpump.com','New Adarsh Nagar, Street Nos -6, Durg',1,7,113,NULL,491441,NULL,'0',NULL,NULL,NULL,4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(83,'SPPR026','EMP0000083',NULL,NULL,'Santanu','Kumar','Sahoo','1985-05-25','Male','8280340112',NULL,'sntn.sahoo@gmail.com','AT-DAGARASAHI,PO-CHARAMPA, DIST-BHADRAK',1,26,NULL,'BHADRAK',756101,'AT-DAGARASAHI,PO-CHARAMPA, DIST-BHADRAK','0',NULL,NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(84,'SPPR027','EMP0000084',NULL,NULL,'Chandra','Kanta','Pradhan','1992-05-28','Male','9776794992',NULL,'ckpradhan2@gmail.com','AT-PATADA, PO-JUGPURA, DIST-MAYURBHANJ',1,26,NULL,'BAISINGHA',757052,'AT-PATADA, PO-JUGPURA, DIST-MAYURBHANJ','0',NULL,NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(85,'SPPR028','EMP0000085',NULL,NULL,'Santanu','Kumar','Jena','1989-03-03','Male','8280340109',NULL,'jksantanu@gmail.com ','AT-RAILWAY COLONY, QT NO.EL/57, UNIT-B',1,26,NULL,'BALESORE',756001,'AT-RAILWAY COLONY, QT NO.EL/57, UNIT-B','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(86,'SPPR029','EMP0000086',NULL,NULL,'Bibhudatta',NULL,'Bhatta','1986-03-03','Male','8280340091',NULL,'bhatta.bibhudatta@gmail.com','AT-BISARPUR, PO-PRATAPARUDRAPUR, PS-BALIANTA,',1,26,613,'BHUBANESWAR',751001,'AT-BISARPUR, PO-PRATAPARUDRAPUR, PS-BALIANTA,','0',NULL,NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(87,'SPPR030','EMP0000087',NULL,NULL,'Anik',NULL,'Chanda','1982-09-24','Male','9163495444',NULL,'anik@spanpump.com','C/O - Bina Ghosh, Panshur Road, Near Kishor Sangha Club, Santoshpur, Kolkata - 700066',1,36,1008,NULL,700066,NULL,'0','AGTPC0128Q',NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,5,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(88,'SPPR031','EMP0000088',NULL,NULL,'Sanjay',NULL,'Chaudhary','1986-12-15','Male','8882846398',NULL,'sanjay.choudhary@spanpump.com','Vill+Post-Karrwan, P.S-Arrah Mufasil,Dist. Bhojpur CityArrah Mufasil',1,5,NULL,'Arrah Mufasil',802301,NULL,'0','AJFPC9993C',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,8,5,NULL,NULL,'2017-06-06 22:12:23','2017-06-07 08:57:33',NULL,NULL,NULL,NULL),(89,'SPPR032','EMP0000089',NULL,NULL,'Jagannath',NULL,'Samantaray','1986-10-20','Male','8280340096',NULL,'jagannathsamantaray@gmail.com ','AT-NARAYABNPUR PANTA, PO- NARAYANPUR, VIA-PRATPPUR',1,26,601,'BALASORE',756083,'AT-NARAYABNPUR PANTA, PO- NARAYANPUR, VIA-PRATPPUR','0',NULL,NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:23','2017-06-06 22:12:23',NULL,NULL,NULL,NULL),(90,'SPPR033','EMP0000090',NULL,NULL,'Krutibash',NULL,'Rath','1985-01-10','Male','8280340116',NULL,'krutibash82@gmail.com ','SRIKRISHNA NAGAR, IIIRD LINE, LANJIPALLI, BERHAMPUR',1,26,NULL,'BERHAMPUR',760008,'SRIKRISHNA NAGAR, IIIRD LINE, LANJIPALLI, BERHAMPUR','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(91,'SPPR034','EMP0000091',NULL,NULL,'Ranjeet',NULL,'Behara',NULL,'Male','0',NULL,'ranjit.behera10@gmail.com','Jagannath Bihar, Bagradevi Road, At/po-Bhanjanagar',1,26,NULL,'Bhanjanagar',761126,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(92,'SPPR035','EMP0000092',NULL,NULL,'Premanand',NULL,'Swain','1993-07-14','Male','7008220189',NULL,'premanandaswain99@gmail.com','At- PARUDI,Po- PANDUA',1,26,NULL,'JAGATSINGHPUR',754103,'At- PARUDI,Po- PANDUA','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(93,'SPPR036','EMP0000093',NULL,NULL,'Dambarudhar',NULL,'Swain','1986-05-20','Male','8280340097',NULL,'dambaruswain888@gmail.com ','C/O- UDAYANATH SWAIN, AT-MAKARPALLI,PO-KULANGA,',1,26,NULL,'BERHAMPUR',761124,'C/O- UDAYANATH SWAIN, AT-MAKARPALLI,PO-KULANGA,','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(94,'SPPR037','EMP0000094',NULL,NULL,'Pratap','Kumar','Maharana','1978-02-15','Male','9040195628',NULL,'pratap.maharana1234@gmail.com ','AT- BALARAMPUR, WARD NO-3,PO-BHANJPUR,PS-BARIPADA',1,26,NULL,'BARIPADA',757002,'AT- BALARAMPUR, WARD NO-3,PO-BHANJPUR,PS-BARIPADA','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(95,'SPPR038','EMP0000095',NULL,NULL,'Abir','Kumar','Kundu',NULL,'Male','0',NULL,'abirkkundu@gmail.com','26/2, Street No-12, Gandhi Nagar, Maitri Kunj',1,7,120,'Villai',490006,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(96,'SPPR039','EMP0000096',NULL,NULL,'Kedar','Nath','Pradhan','1987-05-10','Male','8280340114',NULL,'kedarpradhan5006@gmail.com ','C/o- SRIKANTA PRADHAN, AT/PO-KATISAHI, Via-KAMARDA',1,26,601,'BALASORE',756035,'C/o- SRIKANTA PRADHAN, AT/PO-KATISAHI, Via-KAMARDA','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(97,'SPPR040','EMP0000097',NULL,NULL,'Atul','Mekal','Minj',NULL,'Male','0',NULL,'acb@gmail.com','Pune',1,20,504,NULL,410140,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(98,'SPPR041','EMP0000098',NULL,NULL,'Sreenivasulu',NULL,'Anantharaju','1982-06-01','Male','7331171607',NULL,'apfm1@spanpump.com','D.No.1-126, BC Colony, GC Palli Village & Post, Udayagiri Mandal, Nellore Dist.',1,2,42,'Nellore',524230,NULL,'0','BRFPS8506Q',NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,2,4,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(99,'SPPR042','EMP0000099',NULL,NULL,'P.',NULL,'Rajshekhar','1989-03-09','Male','7331171602',NULL,'apfm2@spanpump.com','D.No.1-44, Kondalaraopalem, Rayannapalem, Pedavegi, West Godavari',1,2,NULL,'West Godavari',534475,NULL,'424883804518','BWFPP6425A','AP03720160006132','Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,7,4,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(100,'SPPR043','EMP0000100',NULL,NULL,'P',NULL,'Suresh','1988-06-23','Male','7331171615',NULL,'apacc1@spanpump.com','D.No.6-329, Opp.Bangaramma Talli Temple, Simhachalam, Visakhapatnam Dist.',1,2,64,'Visakhapatnam',530028,NULL,'787825504871','BRBPP4028G','DLFAP03160792009','UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,2,1,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(101,'SPPR044','EMP0000101',NULL,NULL,'Suraj',NULL,'Agrawal',NULL,'Male','0',NULL,'acb@gmail.com','Pune',1,20,504,NULL,410141,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(102,'SPPR045','EMP0000102',NULL,NULL,'Chandan','Kumar','Patel','1994-04-03','Male','9525776208',NULL,'cshing138@gmail.com','Ward No-7 ,Mjhaulia',1,5,NULL,'Bettiah',845454,'Patna','482387762469',NULL,NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,8,46,NULL,NULL,'2017-06-06 22:12:24','2017-06-07 08:57:49',NULL,NULL,NULL,NULL),(103,'SPPR046','EMP0000103',NULL,NULL,'Shiakh',NULL,'Firoz','1992-05-10','Male','7331171606',NULL,'firojismail786@gmail.com','D.No.6-225, Amaranath Reddy Colony, Kalikiri, Chittoor, Andhra Pradesh',1,2,13,'Chittoor',517234,NULL,'0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,2,3,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(104,'SPPR047','EMP0000104',NULL,NULL,'N',NULL,'Mallesh',NULL,'Male','9553988761',NULL,'maa06666@gmail.com','Arikera Viilage, Alur Mandal, Kurnool Dist.,',1,2,29,'Kurnool',518395,NULL,'0',NULL,NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,7,47,NULL,NULL,'2017-06-06 22:12:24','2017-06-06 22:12:24',NULL,NULL,NULL,NULL),(105,'SPPR048','EMP0000105',NULL,NULL,'Ronitson',NULL,'Lima','1992-04-20','Male','8280340117',NULL,'lronitson50@gmail.com ','At/Po-Ashrayagada, P.S-Seranga, \n',1,26,NULL,'Gajapati',761207,'At/Po-Ashrayagada, P.S-Seranga, \n','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(106,'SPPR049','EMP0000106',NULL,NULL,'Ashok',NULL,'Kumar','1992-06-20','Male','9174633757',NULL,'ashokdewangan515@gmail.com','Santoshi para jagriti chowk, camp-2,',1,7,120,'Bhilai',490001,'Santoshi para jagriti chowk, camp-2,','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(107,'SPPR050','EMP0000107',NULL,NULL,'John',NULL,'Raju',NULL,'Male','8919816556',NULL,'mjraju777@gmail.com','D.No.5-21, SC Colony, Pamulapadu Village, Kurnool Dist.',1,2,29,'Kurnool',518442,NULL,'344201256798',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,2,3,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(108,'SPPR051','EMP0000108',NULL,NULL,'Sumant',NULL,'Pathak','1994-07-01','Male','7879693797',NULL,'sumantpathak22@gmail.com','C/O Varsha Jayant Agrwal, near  Banjari Mandir, Addiwasi Colony    ',1,7,129,'Raipur',484116,'C/O Varsha Jayant Agrwal, near  Banjari Mandir, Addiwasi Colony    ','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(109,'SPPR052','EMP0000109',NULL,NULL,'Dheeraj','Kumar','Singh','1995-05-14','Male','9523430379',NULL,'biharfto1@spanpump.com ','Qtr No- 251 \'c\' Colony ,Giddi\'C\' ,Ramgarh',1,NULL,296,'Ramgarh',829109,'Sihauta Bazar, Near Shivshakti Automobile,\nMaharajganj,Siwan','327242848141','GGMPS8653B',NULL,'UnMarried',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,8,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-07 08:58:07',NULL,NULL,NULL,NULL),(110,'SPPR053','EMP0000110',NULL,NULL,'D.',NULL,'Naresh','1993-01-04','Male','7331171601',NULL,'nareshmudhiraj211@gmail.com','Mohammadabad Village, Mahaboob Nagar Dist, Telangana ',1,31,NULL,'Gandeed',509337,NULL,'0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,7,47,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(111,'SPPR054','EMP0000111',NULL,NULL,'Pintu',NULL,'Badajena','1980-04-16','Male','9692546014',NULL,'aju15feb@gmail.com','AT-JAYAPUR, PO-CHANDIPAL, PS-BHUBAN',1,26,607,'DHENKANAL',759017,'AT-SUDHIKATENI, BAGHAMARI','0',NULL,NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(112,'SPPR056','EMP0000112',NULL,NULL,'Shoban',NULL,'Kumar','1997-07-04','Male','9010167372',NULL,'acb@gmail.com','D.No.3-53, Chennaraopet Village & Mandal, Warangal Dist.',1,31,756,'Warangal',506332,NULL,'821047610282',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,7,47,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(113,'SPPR057','EMP0000113',NULL,NULL,'Manish',NULL,'Sahu',NULL,'Male','0',NULL,'msahu4629@gmail.com','Shantinagar, Near-Gila Panchayat, New Buststand',1,7,NULL,'Kanker',494334,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(114,'SPPR058','EMP0000114',NULL,NULL,'Shelesh',NULL,'Mishra','1985-11-11','Male','9826688793',NULL,'shelesh@spanpump.com','118 Police Line Sonkatch Dewas , Madhya Pradesh , 455118',1,23,556,NULL,455118,NULL,'0','BPVPM6599B',NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(115,'SPPR059','EMP0000115',NULL,NULL,'Raghunath',NULL,'Pillari','1978-03-27','Male','9642671129',NULL,'raghunath@spanpump.com','Plot No 91 Road No3, Vayushakti Nagar, Dammaiguda, Hyderabad',1,2,737,'Hyderabad',500083,NULL,'0','AMXPP2682C',NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,2,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(116,'SPPR060','EMP0000116',NULL,NULL,'Gobinda','Ballava','Behera','1986-06-10','Male','8280340095',NULL,'gobinda.ballav@gmail.com ','AT-PATULI, PO-JAMUJHADI, VIA-SIMULIA',1,26,601,'BALASORE',756126,'AT-PATULI, PO-JAMUJHADI, VIA-SIMULIA','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(117,'SPPR061','EMP0000117',NULL,NULL,'Kedarnath',NULL,'Yadav','1992-04-27','Male','8463893750',NULL,'kedarnathboss.750@gmail.com','Barpara, Badal H. NO. 16,\nThe-Nerharpur',1,7,NULL,'Kanker',494333,'Barpara, Badal H. NO. 16,\nThe-Nerharpur','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(118,'SPPR062','EMP0000118',NULL,NULL,'Anil','Kumar','Ratre','1991-07-22','Male','7987647439',NULL,'cgbackoffice1@gmail.com','Ram Nagar, Rajeev Nagar  H.no.122 Behind Durga Temple  ',1,7,120,'Bhilai',490023,'Ram Nagar, Rajeev Nagar  H.no.122 Behind Durga Temple  ','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(119,'SPPR063','EMP0000119',NULL,NULL,'Saurabh','Kumar','Singh','1990-06-14','Male','8877071351',NULL,'sks23654@gmail.com','Vill-Manjura,Po-Lagma,Ps-Sangrampur',1,5,104,'Munger',811213,'vashali nagar jaipur','853256819356','DWTPK0748D',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,5,34,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(120,'SPPR064','EMP0000120',NULL,NULL,'Narendra','Kumar','Bhardwaj',NULL,'Male','0',NULL,'acb@gmail.com','45,Baba nagar,ward no. - 16,khairthal',1,29,669,'Alwar',301404,'vashali nagar jaipur','876850453383','CEKPK8868J','RJ02 ','Married',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,5,5,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(121,'SPPR065','EMP0000121',NULL,NULL,'Ravi','Kumar','Koshre','1992-02-15','Male','7587366169',NULL,'dcrk11@gmail.com ','23/d, H Pocke,Maroda, Bhilai Nagar',1,7,120,'Bhilai',490006,'23/d, H Pocke,Maroda, Bhilai Nagar','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(122,'SPPR066','EMP0000122',NULL,NULL,'Deepak',NULL,'Singh','1987-10-23','Male','9981208236',NULL,'Deepu23singh@gmail.com','Q No-G/2, Shyam Nagar,Infront of Gurudwar Chouk',1,7,129,'Raipur',484116,'Q No-G/2, Shyam Nagar,Infront of Gurudwar Chouk','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:25','2017-06-06 22:12:25',NULL,NULL,NULL,NULL),(123,'SPPR067','EMP0000123',NULL,NULL,'P.','Ramesh','Kumar',NULL,'Male','0',NULL,'acb@gmail.com','Qr no-21/D, Street no-4, Sector-4',1,7,120,'Villai',490001,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(124,'SPPR068','EMP0000124',NULL,NULL,'Rajeev',NULL,'Koushik','1992-07-01','Male','8889729407',NULL,'rkaushik2800@gmail.com','Bajrang chauk kaya,  post-senwar,Block-Bilha  ',1,7,117,'Bilaspur',495224,'Bajrang chauk kaya,  post-senwar,Block-Bilha  ','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(125,'SPPR069','EMP0000125',NULL,NULL,'Basant','Kumar','Das','1995-03-05','Male','8280340136',NULL,'basantadas450@gmail.com','Dist-Gajapati',1,26,601,'Balasore',756001,'AT/PO-NARANPUR, PS-BARHAMPUR','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,4,4,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(126,'SPPR070','EMP0000126',NULL,NULL,'Abhisekh',NULL,'Markam','1994-03-07','Male','9669644008',NULL,'sonidivendra@gmail.com','At-Annpurnapara, Po-Kanker',1,7,NULL,'Kanker',494334,'At-Annpurnapara, Po-Kanker','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(127,'SPPR071','EMP0000127',NULL,NULL,'Roman',NULL,'Sahu',NULL,'Male','0',NULL,'sagarsoni198z@gmail.com ','Annpurnapora, Kanker',1,7,NULL,'Kanker',494334,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(128,'SPPR072','EMP0000128',NULL,NULL,'Manoj','Kumar','Jhadi',NULL,'Male','0',NULL,'jhadimanoj1985@gmail.com','Tashel Para, Word No-10',1,7,328,'Bijapur',494444,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(129,'SPPR073','EMP0000129',NULL,NULL,'Chetan','Lal','Gavde','1985-05-25','Male','8827214456',NULL,'electronicengg1277@gmail.com','At-Ghotiya, Ps-Dondi, ',1,7,NULL,'Dallyradhar',491228,'At-Ghotiya, Ps-Dondi, ','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(130,'SPPR074','EMP0000130',NULL,NULL,'Bhartendra','Prasad','Yadu','1989-07-16','Male','9424116371',NULL,'bhartendra.yadu5@gmail.com','At-girhola,Po/Ps-charama,',1,7,NULL,'Charama',494337,'At-girhola,Po/Ps-charama,','0',NULL,NULL,'Married',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(131,'SPPR075','EMP0000131',NULL,NULL,'Naveen','Kumar','Sahu','1990-10-23','Male','9165082373',NULL,'naveensahu4g@gmail.com','Village& PO.- Latabod, Dist.-Balod,',1,7,NULL,'Balod',491226,'Village& PO.- Latabod, Dist.-Balod,','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(132,'SPPR076','EMP0000132',NULL,NULL,'Pradeep','Kumar','Adil',NULL,'Male','0',NULL,'acb@gmail.com','At-Chhediya post tarri,Po-Gurur',1,7,NULL,'Baloda',491227,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(133,'SPPR077','EMP0000133',NULL,NULL,'Sagar',NULL,'Soni','1989-08-22','Male','9040345340',NULL,'sagarsoni198z@gmail.com ','At/po-Belsonda',1,7,NULL,'Mahasamund',4934450,'At/po-Belsonda','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(134,'SPPR078','EMP0000134',NULL,NULL,'Subrat',NULL,'Tarai','1991-09-19','Male','7609804878',NULL,'subratdx96@gmail.com ','AT-RAGHUNATHPU, WRD NO-19, PO/PS-BARIPADA',1,26,NULL,'BARIPADA',757001,'AT-RAGHUNATHPU, WRD NO-19, PO/PS-BARIPADA','0',NULL,NULL,'UnMarried',4,3,1,NULL,'No','No','Active',NULL,NULL,1,4,15,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(135,'SPPR079','EMP0000135',NULL,NULL,'Saswata','Kumar','Nayak','1990-05-01','Male','7646868266',NULL,'sknayak631@gmail.com','AT-BAHADASAHI,PO-BARKAND,VIA-MORADA,',1,26,NULL,'MORADA',757020,'AT-BAHADASAHI,PO-BARKAND,VIA-MORADA,','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(136,'SPPR080','EMP0000136',NULL,NULL,'Kuldeep',NULL,'Sahu',NULL,'Male','7646868266',NULL,'kshao786@gmail.com','VILL-KUSMI,POST-BHHARREGAON,',1,7,NULL,'Rajnandgaon',491441,'VILL-KUSMI,POST-BHHARREGAON,','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(137,'SPPR081','EMP0000137',NULL,NULL,'Binod',NULL,'Behera',NULL,'Male','7873602008',NULL,'binodbehera.spanpump@gmail.com ','C/O-KALICHARAN BEHERA, AT-AMBASIKADA, PO-SIRISHBANI',1,26,NULL,'Baripada',757049,'C/O-KALICHARAN BEHERA, AT-AMBASIKADA, PO-SIRISHBANI','0',NULL,NULL,'Married',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(138,'SPPR082','EMP0000138',NULL,NULL,'Hemant','Kumar','Awari',NULL,'Male','9039096237',NULL,'hemankumar8855@gmail.com','Santoshi Para Camp – 2,Near – Indian convent school  ',1,7,120,'Bhilai',490001,'Santoshi Para Camp – 2,Near – Indian convent school  ','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(139,'SPPR083','EMP0000139',NULL,NULL,'Jainarayan',NULL,NULL,NULL,'Male','0',NULL,'acb@gmail.com','Pune',1,20,504,NULL,410142,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:26','2017-06-06 22:12:26',NULL,NULL,NULL,NULL),(140,'SPPR084','EMP0000140',NULL,NULL,'Rajat','Kothare',NULL,NULL,'Male','9424769490',NULL,'kotharerajat332@gmail.com','At – Ward no.15, Bhilai Road, Lanji',1,23,NULL,'Balghat',481222,'At – Ward no.15, Bhilai Road, Lanji','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(141,'SPPR085','EMP0000141',NULL,NULL,'Md.','Faizan','Raza',NULL,'Male','7000690565',NULL,'faizank31@gmail.com','Forest Colony, Subash Ward',1,7,NULL,'Kanker',494334,'Forest Colony, Subash Ward','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(142,'SPPR086','EMP0000142',NULL,NULL,'Vinod',NULL,'Thakur',NULL,'Male','0',NULL,'acb@gmail.com','Pune',1,20,504,NULL,410143,NULL,'0',NULL,NULL,NULL,NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,4,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(143,'SPPR087','EMP0000143',NULL,NULL,'Choppa',NULL,'Karthik','1994-04-19','Male','9602864654',NULL,'choppakarthik19@gmail.com','9/123 narayana reddy pet',1,2,42,'Nellore',524314,'vashali nagar jaipur','258087957237','AWTPC5867G','AP02620160001256','UnMarried',7,3,1,NULL,'No','No','Active',NULL,NULL,1,5,4,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(144,'SPPR088','EMP0000144',NULL,NULL,'Ajay',NULL,'Kanojiya','1994-07-15','Male','9660454614',NULL,'ajaykanojiya158@gmail.com','1249,Siddh Bus Road,Near Ganesh Chowk,Jabalpur',1,23,565,'Jabalpur',482001,'Sikar,Rajsthan ','366507069450',NULL,'MP20N-2014-0406430','UnMarried',4,3,1,NULL,'No','No','Active',NULL,NULL,1,5,34,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(145,'SPPR089','EMP0000145',NULL,NULL,'Ashish',NULL,'Srivastava','1986-08-25','Male','7974774996',NULL,'ashishshrivastavaet@gmail.com','Ambedkar nagar,bangaliya,ward 7,itarsi',1,23,563,'Itarsi',461111,'vashali nagar jaipur','258077350577',NULL,'MP05D-2014-0037059','UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,5,34,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(146,'SPPR090','EMP0000146',NULL,NULL,'Gaurav',NULL,'Kumar','1990-06-23','Male','7737472005',NULL,'kr.gauravkumar90@gamil.com','45,Baba nagar,ward no. - 16,khairthal',1,29,669,'Alwar',301404,'vashali nagar jaipur','662257428255','BHBPB6562K','RJ02/DLC/09/227099','UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,5,34,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(147,'SPPR091','EMP0000147',NULL,NULL,'Likesh','Kumar','Sahu','1990-06-29','Male','9424251518',NULL,'likkusahu@gmail.com ','Civili Colony, Q. No-62, At-Gangral,',1,7,NULL,'Dhamari',493776,'Civili Colony, Q. No-62, At-Gangral,','0',NULL,NULL,'UnMarried',NULL,3,1,NULL,'No','No','Active',NULL,NULL,1,3,9,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(148,'SPFC001','EMP0000148',NULL,NULL,'Arun','S.','Hiray','1971-06-01','Male','9881495955',NULL,'ahire@spanpump.com','Home no 1420,survey no 827,Nagar Puna road,Sanaswadi,Near punam traders',1,20,504,NULL,412208,NULL,'256246946004','ABBPH0269E',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(149,'SPFC002','EMP0000149',NULL,NULL,'V','B','Gore','1978-08-10','Male','9823814175',NULL,'vaijinathgore51@gmail.com','At post- varje malwadi chaitanya chowk Dist. Pune',1,20,504,NULL,411058,NULL,'493753234171','APCPG8931K',NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(150,'SPFC003','EMP0000150',NULL,NULL,'U','S','Jagdale','1959-06-01','Male','9922416654',NULL,'acb@gmail.com','715/A1 Nade nagar,Kalewadi,Pimpri Pune - 17',1,20,504,'Pune',411017,NULL,'907274870102','ADCPJ1053F',NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(151,'SPFC004','EMP0000151',NULL,NULL,'Sambhaji',NULL,'Galande','1983-03-05','Male','9921347051',NULL,'sambhajigalande83@gmail.com','At Banpimpri, Post Mandangoan,Taluka Trigonda,Dist - Ahmednagar Pin 414101',1,20,428,NULL,414101,NULL,'640825056469',NULL,NULL,'Married',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(152,'SPFC005','EMP0000152',NULL,NULL,'Govind',NULL,'Pawar','1984-11-16','Male','9975868097',NULL,'govindpawar5454@gmail.com','At Post Kada, Taluka Ashti, Dist Beed',1,20,NULL,NULL,414203,NULL,'426231762547',NULL,NULL,NULL,1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(153,'SPFC006','EMP0000153',NULL,NULL,'Ashish',NULL,'Satpate','1988-03-26','Male','7828806124',NULL,'ashish.spanpump@gmail.com','SURBHI NAGAR W. NO. 24 BALAGHAT MADHYA PRADESH',1,23,NULL,'Balghat',481222,'SURBHI NAGAR W. NO. 24 BALAGHAT MADHYA PRADESH','0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(154,'SPFC007','EMP0000154',NULL,NULL,'Anil',NULL,'Hazare','1984-05-23','Male','8605009982',NULL,'alhajare007@gmail.com','At Post Kati,Indapur, Pune Maharashtra ,413106',1,20,504,'Pune',413106,NULL,'743076659830','ACPPH8455D',NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(155,'SPFC008','EMP0000155',NULL,NULL,'Brajanarayan',NULL,'Sahoo','1988-06-17','Male','8338977946',NULL,'brajanrn7@gmail.com ','AT-BIKAS NAGAR, ANGARGADIA, PO-BALASORE       ',1,26,601,'Balasore',756001,'AT-BIKAS NAGAR, ANGARGADIA, PO-BALASORE       ','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,19,NULL,NULL,'2017-06-06 22:12:27','2017-06-06 22:12:27',NULL,NULL,NULL,NULL),(156,'SPFC009','EMP0000156',NULL,NULL,'Ajaya','Kumar','Sahoo','1980-04-16','Male','9692546014',NULL,'aju15feb@gmail.com','AT-JAYAPUR, PO-CHANDIPAL, PS-BHUBAN',1,26,607,'Dhenkanal',759017,'AT-SUDHIKATENI, BAGHAMARI','0',NULL,NULL,'Married',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,19,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(157,'SPFC010','EMP0000157',NULL,NULL,'Chakradhar','T','Divekar','1990-08-20','Male','9130079937',NULL,'divekar@spanpump.com','A.P- Varvand,Tal - Daund,Dist Pune 4112215',1,20,504,NULL,4112215,NULL,'0',NULL,NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(158,'SPFC011','EMP0000158',NULL,NULL,'Ashok',NULL,'Uttekar','1968-06-29','Male','9822919923',NULL,'acb@gmail.com','Saitej Appartment.SR NO31/1/2,Pimple gaurav,Shivram Nagar,Pune - 411027',1,20,504,'Pune',411027,NULL,'0',NULL,NULL,'Married',4,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,22,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(159,'SPFC012','EMP0000159',NULL,NULL,'Samir',NULL,'Saha','1960-10-15','Male','0',NULL,'acb@gmail.com','samir kumar saha, post &dist.alipurduar, ward no.16.',1,36,NULL,NULL,736121,NULL,'0',NULL,NULL,'Married',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,21,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(160,'SPFC013','EMP0000160',NULL,NULL,'Anil',NULL,'Jamgade','1967-12-19','Male','0',NULL,'acb@gmail.com','S/O: Devidas Jamgade, AT. Waltur, Post.Bhojal, Tal.Pusad, Waltur®, Bhojal, Yavatmal.',1,20,531,NULL,445204,NULL,'550483446139','ANRPJ5542J',NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,21,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(161,'SPFC014','EMP0000161',NULL,NULL,'Pandey',NULL,'D.P','1990-01-01','Male','0',NULL,'acb@gmail.com','Gram-Tihara, Post-Kakrava Bazar, Zilla Siddharth Nagar,UP',1,NULL,NULL,NULL,272206,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,21,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(162,'SPFC015','EMP0000162',NULL,NULL,'Tusar','Ranjan','Mishra','1990-05-19','Male','8280340118',NULL,'tusarranjanmishra195@gmail.com','AT-GOPINATHPUR,PO-SINGHANATHPITHA,PS-BARAMBA',1,26,606,'Cuttack',754031,'AT-GOPINATHPUR,PO-SINGHANATHPITHA,PS-BARAMBA','0',NULL,NULL,'UnMarried',NULL,NULL,1,NULL,'No','No','Active',NULL,NULL,1,4,19,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(163,'SPFC016','EMP0000163',NULL,NULL,'Satish',NULL,'Kulkarni','1992-01-13','Male','9561917585',NULL,'satish.kulkarni32@gmail.com','At/post:chikhurda,Taluka dist:Latur,Vai:borgaon.',1,20,480,NULL,413511,NULL,'252216780960',NULL,NULL,'UnMarried',1,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(164,'SPFC017','EMP0000164',NULL,NULL,'Atmaram',NULL,'Pharate','1990-09-02','Male','9579341641',NULL,'atmaram.pharate@gmail.com','A/P- Mandavgan Pharata tal- shirur dist- pune 412211',1,20,504,NULL,412211,NULL,'933392382622','BIHPP6103R',NULL,'UnMarried',3,NULL,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(165,'SPFC019','EMP0000165',NULL,NULL,'Manohar',NULL,'Sandbhor','1987-08-16','Male','9657707074',NULL,'storesexecutive@spanpump.com','At Post - Shikrapur Tal - Shirur Dist - Pune',1,20,504,NULL,412210,NULL,'866414803770','DXGPS7964R',NULL,'Married',2,3,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(166,'SPFC020','EMP0000166',NULL,NULL,'Pankaj',NULL,'Jadhav','1989-04-27','Male','9096745962',NULL,'testing@spanpump.com','At-Jadhavwadi,Post-Ranjani,Tal-Ambegaon,Dist-Pune',1,20,504,NULL,410503,'At-Jadhavwadi,Post-Ranjani,Tal-Ambegaon,Dist-Pune','0','AVQPJ7311Q',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,6,37,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL),(167,'SPFC021','EMP0000167',NULL,NULL,'Bharath',NULL,'Mahendran','1992-06-15','Male','9130838724',NULL,'bharat@spanpump.com','3/263 Mahadevgollahalli(Post & Village), Pochampalli (Tk), Krishnagiri (Dt), PIN- 635206',1,32,794,NULL,635206,NULL,'0','BOSPB9846J',NULL,'UnMarried',3,3,1,NULL,'No','No','Active',NULL,NULL,1,6,43,NULL,NULL,'2017-06-06 22:12:28','2017-06-06 22:12:28',NULL,NULL,NULL,NULL);
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
-- Table structure for table `esic_employer_masters`
--

DROP TABLE IF EXISTS `esic_employer_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esic_employer_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `esic` tinyint(1) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `max_limit` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_employer_masters`
--

LOCK TABLES `esic_employer_masters` WRITE;
/*!40000 ALTER TABLE `esic_employer_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `esic_employer_masters` ENABLE KEYS */;
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
  `employee_resignation_id` int(11) DEFAULT NULL,
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
-- Table structure for table `fp_masters`
--

DROP TABLE IF EXISTS `fp_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_fp` tinyint(1) DEFAULT NULL,
  `min_limit` decimal(10,0) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `fp_masters`
--

LOCK TABLES `fp_masters` WRITE;
/*!40000 ALTER TABLE `fp_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_masters` ENABLE KEYS */;
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
  `period_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_bunches_on_employee_id` (`employee_id`),
  KEY `index_goal_bunches_on_performance_calendar_id` (`performance_calendar_id`),
  KEY `index_goal_bunches_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_5c40ebfbdd` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`),
  CONSTRAINT `fk_rails_2bbdf9459a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_4ad9ac120e` FOREIGN KEY (`performance_calendar_id`) REFERENCES `performance_calendars` (`id`)
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
-- Table structure for table `goal_measures`
--

DROP TABLE IF EXISTS `goal_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_measures`
--

LOCK TABLES `goal_measures` WRITE;
/*!40000 ALTER TABLE `goal_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_measures` ENABLE KEYS */;
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
-- Table structure for table `goal_rating_sheets`
--

DROP TABLE IF EXISTS `goal_rating_sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_rating_sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisee_id` int(11) DEFAULT NULL,
  `appraiser_id` int(11) DEFAULT NULL,
  `employee_goal_id` int(11) DEFAULT NULL,
  `allign_to_supervisor` tinyint(1) DEFAULT NULL,
  `appraisee_comment` text COLLATE utf8_unicode_ci,
  `appraiser_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `performance_period_id` int(11) DEFAULT NULL,
  `is_confirm_appraiser` tinyint(1) DEFAULT NULL,
  `is_confirm_appraisee` tinyint(1) DEFAULT NULL,
  `appraiser2_comment` text COLLATE utf8_unicode_ci,
  `final_comment` text COLLATE utf8_unicode_ci,
  `appraiser_2_id` int(11) DEFAULT NULL,
  `final_id_id` int(11) DEFAULT NULL,
  `is_confirm_final` tinyint(1) DEFAULT NULL,
  `is_confirm_appraiser2` tinyint(1) DEFAULT NULL,
  `appraisee_rating_id` int(11) DEFAULT NULL,
  `appraiser_rating_id` int(11) DEFAULT NULL,
  `appraiser2_rating_id` int(11) DEFAULT NULL,
  `final_rating_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_goal_rating_sheets_on_appraisee_id` (`appraisee_id`),
  KEY `index_goal_rating_sheets_on_appraisee_rating_id` (`appraisee_rating_id`),
  KEY `index_goal_rating_sheets_on_appraiser2_rating_id` (`appraiser2_rating_id`),
  KEY `index_goal_rating_sheets_on_appraiser_2_id` (`appraiser_2_id`),
  KEY `index_goal_rating_sheets_on_appraiser_id` (`appraiser_id`),
  KEY `index_goal_rating_sheets_on_appraiser_rating_id` (`appraiser_rating_id`),
  KEY `index_goal_rating_sheets_on_employee_goal_id` (`employee_goal_id`),
  KEY `index_goal_rating_sheets_on_final_id_id` (`final_id_id`),
  KEY `index_goal_rating_sheets_on_final_rating_id` (`final_rating_id`),
  KEY `index_goal_rating_sheets_on_performance_period_id` (`performance_period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_rating_sheets`
--

LOCK TABLES `goal_rating_sheets` WRITE;
/*!40000 ALTER TABLE `goal_rating_sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_rating_sheets` ENABLE KEYS */;
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
INSERT INTO `groups` VALUES (1,'spanpump@gmail.com','$2a$10$LOcqxOV7qd7WJg7bgXNXbubJxUX0ZefhQDjdPEbMjvFD7RoH4Z0jm','Span Pump ',NULL,NULL,NULL,8,'2017-06-07 05:24:27','2017-06-06 22:02:54','127.0.0.1','127.0.0.1','2017-05-26 21:11:38','2017-06-07 05:24:27',NULL,NULL,NULL,NULL);
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
-- Table structure for table `insurance_masters`
--

DROP TABLE IF EXISTS `insurance_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_insurance` tinyint(1) DEFAULT NULL,
  `percentage` decimal(10,0) DEFAULT NULL,
  `base_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
-- Dumping data for table `insurance_masters`
--

LOCK TABLES `insurance_masters` WRITE;
/*!40000 ALTER TABLE `insurance_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_masters` ENABLE KEYS */;
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
  `status` tinyint(1) DEFAULT NULL,
  `is_confirm` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  CONSTRAINT `fk_rails_214c8daf87` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_2399bfef36` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`),
  CONSTRAINT `fk_rails_393577d02f` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_62455f7dcc` FOREIGN KEY (`reserved_category_id`) REFERENCES `reserved_categories` (`id`),
  CONSTRAINT `fk_rails_7dd6739c2a` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `fk_rails_92efff7a56` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`),
  CONSTRAINT `fk_rails_bd93cb7284` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (94,1,'2007-09-01',6,10,'2008-03-01',NULL,'100354303022',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2016-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(95,2,'2012-08-23',6,10,'2013-02-21',NULL,'100399445629',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(96,3,'2013-12-02',3,3,'2014-06-02',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2039-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(97,4,'2014-01-15',3,4,'2014-07-16',NULL,'0',NULL,NULL,'6','1',NULL,NULL,'Yes','0','2009-10-07','2019-10-06',NULL,'2046-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(98,5,'2014-04-10',3,3,'2014-10-09',NULL,'100059367632',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2046-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(99,6,'2014-09-15',4,1,'2015-03-16',NULL,'100382979339',NULL,NULL,'6','3',NULL,NULL,'Yes','0','2006-07-20','2016-07-19',NULL,'2036-04-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(100,7,'2014-10-27',4,1,'2015-04-27',NULL,'0',NULL,NULL,'6','3',NULL,NULL,'Yes','0','2011-09-05','2021-09-04',NULL,'2037-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(101,8,'2014-11-26',6,10,'2015-05-27',NULL,'100528902787',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2044-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(102,9,'2014-12-01',4,1,'2015-06-01',NULL,'100528982394',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2027-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(103,10,'2014-12-15',6,6,'2015-06-15',NULL,'100529362432',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2045-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(104,11,'2015-03-02',3,4,'2015-08-31',NULL,'100528695268',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2046-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(105,12,'2015-05-06',6,10,'2015-11-04',NULL,'100529526990',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2016-08-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(106,13,'2015-12-07',6,6,'2016-06-06',NULL,'100665222350',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(107,14,'2016-03-04',6,6,'2016-09-02',NULL,'100372172790',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2043-04-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(108,15,'2016-03-09',6,10,'2016-09-07',NULL,'100987907523',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2049-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(109,16,'2016-04-01',6,10,'2016-09-30',NULL,'0',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1958-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(110,17,'2016-04-18',6,10,'2016-10-17',NULL,'100987907534',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2050-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(111,19,'2016-05-01',6,6,'2016-10-30',NULL,'100894810106',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'1958-01-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(112,20,'2016-05-16',6,10,'2016-11-14',NULL,'100987907547',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2049-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(113,21,'2016-05-17',3,4,'2016-11-15',NULL,'100884018205',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2045-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(114,22,'2016-06-06',2,7,'2016-12-05',NULL,'100885686655',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2048-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(115,23,'2016-06-06',2,7,'2016-12-05',NULL,'100886459905',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2050-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(116,24,'2016-07-04',6,10,'2017-01-02',NULL,'100890740169',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2050-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(117,25,'2016-07-04',6,5,'2017-01-02',NULL,'100886733921',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(118,26,'2016-07-13',6,10,'2017-01-11',NULL,'100894489082',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2050-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(119,27,'2016-08-04',6,10,'2017-02-02',NULL,'100916632725',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2046-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(120,28,'2016-08-16',6,6,'2017-02-14',NULL,'100915993390',NULL,NULL,'6','3',NULL,NULL,'Yes','0','2015-09-24','2025-09-23',NULL,'2046-06-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(121,29,'2016-09-01',4,1,'2017-03-02',NULL,'0',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2045-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(122,30,'2016-09-12',6,10,'2017-03-13',NULL,'100919183053',NULL,NULL,'6','3',NULL,NULL,'Yes','0',NULL,NULL,NULL,'2044-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(123,31,'2016-11-28',6,6,'2017-05-29',NULL,'100973327715',NULL,NULL,'6','3',NULL,NULL,NULL,'0','2011-11-25','2021-11-24',NULL,'2051-04-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(124,32,'2016-11-28',6,6,'2017-05-29',NULL,'100973436840',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(125,33,'2016-12-07',6,10,'2017-06-07',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2043-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(126,34,'2016-12-07',6,5,'2017-06-07',NULL,'100987907484',NULL,NULL,'6','3',NULL,NULL,'Yes','0','2007-05-31','2017-05-30',NULL,'2041-03-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(127,35,'2016-12-12',5,16,'2017-06-12',NULL,'100308712891',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2046-11-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(128,36,'2016-12-15',2,15,'2017-06-15',NULL,'0',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2053-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(129,37,'2016-12-19',6,10,'2017-06-19',NULL,'100987907510',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2044-11-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(130,38,'2016-12-19',6,14,'2017-06-19',NULL,'100987907506',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2054-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(131,39,'2016-12-19',6,14,'2017-06-19',NULL,'100752927302',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2053-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(132,40,'2016-12-19',6,14,'2017-06-19',NULL,'100987907478',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2053-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(133,41,'2017-01-16',6,6,'2017-07-17',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2049-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(134,42,'2017-01-24',6,10,'2017-07-25',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2048-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(135,43,'2017-02-01',3,4,'2017-08-02',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2044-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(136,44,'2017-02-01',6,6,'2017-08-02',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2049-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(137,45,'2017-02-13',6,10,'2017-08-14',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2044-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(138,46,'2017-02-17',6,10,'2017-08-18',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(139,47,'2017-02-17',6,6,'2017-08-18',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2049-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(140,48,'2017-02-20',3,4,'2017-08-21',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2046-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(141,49,'2017-02-24',4,2,'2017-08-25',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2037-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(142,50,'2017-03-01',6,14,'2017-08-30',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2048-02-29',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(143,51,'2017-03-06',6,14,'2017-09-04',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2051-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(144,52,'2017-03-20',6,10,'2017-09-18',NULL,'0',NULL,NULL,'6','2',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2044-09-30',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(145,53,'2017-04-08',6,6,'2017-10-07',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(146,54,'2017-04-24',6,6,'2017-10-23',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2047-07-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(147,55,'2017-04-13',6,6,'2017-10-12',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2048-12-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(148,56,'2017-01-20',6,6,'2017-07-21',NULL,'0',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2048-10-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(149,57,'2017-04-25',6,13,'2017-10-24',NULL,'0',NULL,NULL,'6','1',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2052-05-31',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(150,148,'1992-06-05',4,1,'1992-12-04',NULL,'100529538159',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(151,149,'1997-11-27',3,9,'1998-05-28',NULL,'100798962427',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(152,150,'2000-05-02',3,3,'2000-10-31',NULL,'100396781655',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(153,151,'2012-11-17',6,10,'2013-05-18',NULL,'100529485341',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(154,152,'2013-08-12',6,10,'2014-02-10',NULL,'100528695487',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(155,153,'2013-10-23',6,6,'2014-04-23',NULL,'100529419545',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(156,154,'2015-02-17',6,6,'2015-08-18',NULL,'100529034816',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(157,155,'2015-07-01',6,6,'2015-12-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(158,156,'2015-08-10',3,3,'2016-02-08',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(159,157,'2015-09-01',6,6,'2016-03-01',NULL,'100641053825',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(160,158,'2015-11-20',6,13,'2016-05-20',NULL,'100664872968',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(161,159,'2016-01-01',1,12,'2016-07-01',NULL,'100665488749',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(162,160,'2016-01-01',1,12,'2016-07-01',NULL,'100664777690',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(163,161,'2016-02-01',1,12,'2016-08-01',NULL,'100665532244',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(164,162,'2016-03-21',6,13,'2016-09-19',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(165,163,'2016-06-01',6,10,'2016-11-30',NULL,'100893490785',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(166,164,'2016-06-15',6,10,'2016-12-14',NULL,'100883729163',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(167,165,'2016-12-19',6,10,'2017-06-19',NULL,'100241472509',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(168,166,'2017-03-01',6,6,'2017-08-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(169,167,'2017-04-12',3,4,'2017-10-11',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(170,58,'2011-11-01',6,6,'2012-05-01',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(171,59,'2012-05-14',6,10,'2012-11-12',NULL,'100082370931',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(172,60,'2012-05-15',3,3,'2012-11-13',NULL,'100297999970',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(173,61,'2012-05-15',3,3,'2012-11-13',NULL,'100214045463',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(174,62,'2012-07-16',3,3,'2013-01-14',NULL,'100140452364',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(175,63,'2012-12-11',6,10,'2013-06-11',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(176,64,'2013-01-10',3,3,'2013-07-11',NULL,'100529602536',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(177,65,'2013-05-01',6,10,'2013-10-30',NULL,'100665244944',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(178,66,'2013-07-08',6,10,'2014-01-06',NULL,'100893653305',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(179,67,'2013-10-21',6,6,'2014-04-21',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:33','2017-06-06 22:44:33'),(180,68,'2013-12-05',6,6,'2014-06-05',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(181,69,'2013-12-06',6,6,'2014-06-06',NULL,'100529346375',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(182,70,'2013-12-10',3,3,'2014-06-10',NULL,'100037317588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(183,71,'2013-12-13',6,6,'2014-06-13',NULL,'100529329155',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(184,72,'2013-12-26',6,6,'2014-06-26',NULL,'100529549874',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(185,75,'2014-02-16',6,6,'2014-08-17',NULL,'100529147527',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(186,76,'2014-02-17',6,10,'2014-08-18',NULL,'100529413113',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(187,77,'2014-02-18',6,6,'2014-08-19',NULL,'100528838672',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(188,78,'2014-03-03',6,6,'2014-09-01',NULL,'100529038701',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(189,79,'2014-03-07',6,6,'2014-09-05',NULL,'100529248588',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(190,80,'2014-03-14',6,6,'2014-09-12',NULL,'100529066038',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(191,81,'2014-03-18',6,6,'2014-09-16',NULL,'100529381206',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(192,82,'2014-04-21',3,3,'2014-10-20',NULL,'100529375285',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(193,83,'2014-05-12',6,10,'2014-11-10',NULL,'100529178494',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(194,84,'2014-05-16',6,6,'2014-11-14',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(195,85,'2014-07-01',3,3,'2014-12-30',NULL,'100640688377',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(196,86,'2014-07-03',6,10,'2015-01-01',NULL,'100640681066',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(197,87,'2014-12-01',3,3,'2015-06-01',NULL,'100528612059',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(198,88,'2015-01-01',3,3,'2015-07-02',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(199,89,'2015-02-06',6,10,'2015-08-07',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(200,90,'2015-02-20',6,10,'2015-08-21',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(201,91,'2015-03-03',6,6,'2015-09-01',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(202,92,'2015-03-20',6,6,'2015-09-18',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(203,93,'2015-03-21',6,6,'2015-09-19',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(204,94,'2015-03-26',6,6,'2015-09-24',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(205,95,'2015-04-06',3,4,'2015-10-05',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(206,96,'2015-04-14',6,10,'2015-10-13',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(207,97,'2015-08-01',6,6,'2016-01-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(208,98,'2015-11-20',3,3,'2016-05-20',NULL,'100664428361',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(209,99,'2015-11-23',3,3,'2016-05-23',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(210,100,'2016-01-04',6,10,'2016-07-04',NULL,'100674748321',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(211,101,'2016-01-21',6,6,'2016-07-21',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(212,102,'2016-04-16',6,6,'2016-10-15',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(213,103,'2016-04-25',6,6,'2016-10-24',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(214,104,'2016-04-29',6,6,'2016-10-28',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(215,105,'2016-05-02',6,10,'2016-10-31',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(216,106,'2016-05-02',6,6,'2016-10-31',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(217,107,'2016-05-21',6,6,'2016-11-19',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(218,108,'2016-05-25',6,6,'2016-11-23',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(219,109,'2016-09-11',2,15,'2017-03-12',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(220,110,'2016-10-01',6,6,'2017-04-01',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(221,111,'2016-10-03',6,10,'2017-04-03',NULL,'100949021380',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(222,112,'2016-10-03',6,6,'2017-04-03',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(223,113,'2016-10-28',6,6,'2017-04-28',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(224,114,'2016-11-02',3,3,'2017-05-03',NULL,'100973241212',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(225,115,'2016-11-02',3,3,'2017-05-03',NULL,'100973241208',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(226,116,'2016-11-02',6,10,'2017-05-03',NULL,'100973241220',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(227,117,'2016-11-15',6,10,'2017-05-16',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(228,118,'2016-12-12',6,10,'2017-06-12',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(229,119,'2017-01-03',6,6,'2017-07-04',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(230,120,'2017-01-08',3,3,'2017-07-09',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(231,121,'2017-01-09',6,6,'2017-07-10',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(232,122,'2017-01-23',6,10,'2017-07-24',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(233,123,'2017-01-28',6,6,'2017-07-29',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(234,124,'2017-02-01',6,6,'2017-08-02',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(235,125,'2017-03-04',6,10,'2017-09-02',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(236,126,'2017-03-06',6,6,'2017-09-04',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(237,127,'2017-03-06',6,6,'2017-09-04',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(238,128,'2017-03-09',6,10,'2017-09-07',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(239,129,'2017-03-09',6,10,'2017-09-07',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(240,130,'2017-03-10',6,10,'2017-09-08',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(241,131,'2017-03-11',6,10,'2017-09-09',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(242,132,'2017-03-14',6,6,'2017-09-12',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(243,133,'2017-03-15',6,6,'2017-09-13',NULL,'100528641565',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(244,134,'2017-03-22',6,6,'2017-09-20',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(245,135,'2017-04-01',3,3,'2017-09-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(246,136,'2017-04-03',6,6,'2017-10-02',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(247,137,'2017-04-07',6,6,'2017-10-06',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(248,138,'2017-04-08',6,6,'2017-10-07',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(249,139,'2017-04-10',6,6,'2017-10-09',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(250,140,'2017-04-11',6,6,'2017-10-10',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(251,141,'2017-04-26',6,10,'2017-10-25',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(252,142,'2017-03-01',6,10,'2017-08-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(253,143,'2017-03-01',6,11,'2017-08-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(254,144,'2017-03-01',6,6,'2017-08-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(255,145,'2017-03-01',6,6,'2017-08-30',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(256,146,'2017-02-06',6,6,'2017-08-07',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34'),(257,147,'2017-02-09',6,6,'2017-08-10',NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-06-06 22:44:34','2017-06-06 22:44:34');
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
INSERT INTO `leav_categories` VALUES (1,'ML','ML','Casual Leave',1,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-20 09:45:17'),(2,'HPL','HPL','Earned Leave',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:00:24'),(3,'CL','CL','CL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:01:15'),(4,'PPL','PPL','PPL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:02:03'),(5,'FPL','FPL','FPL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:02:56'),(6,'LWP','LWP','LWP',NULL,0,NULL,NULL,1,0,NULL,NULL,0,0,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:03:19');
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
INSERT INTO `manager_histories` VALUES (1,3,3,NULL,'2017-06-07',NULL,'2017-06-07 05:25:15','2017-06-07 05:25:15'),(2,4,3,NULL,'2017-06-13',NULL,'2017-06-13 10:44:12','2017-06-13 10:44:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'SPHO003',1,'EMP0000003',NULL,'hrmanager@spanpump.com','$2a$10$gXh2kNNIMUSCpNvaY1zW7OjI.h4bVHR.F4TVeyDfS78qMoWvh7Ze2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,'2017-06-26 04:54:31','2017-06-16 06:12:37','114.143.205.226','175.100.138.143','2017-06-07 05:25:14','2017-06-26 04:54:31',1,1,7,3,NULL,NULL,NULL,NULL),(2,'SPHO004',1,'EMP0000004',NULL,'hrassistant2@spanpump.com','$2a$10$HZePIXIZac/4IcMxmZxww.a0B9fjmwrWtZjQwxNQQSsNBSAlBPzne',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'2017-06-21 12:37:30','2017-06-20 09:28:17','123.201.35.198','123.201.35.198','2017-06-13 10:44:12','2017-06-21 12:37:30',1,1,7,4,NULL,NULL,NULL,NULL);
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
INSERT INTO `nationalities` VALUES (1,'1.0','Indian',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
-- Table structure for table `overtimes`
--

DROP TABLE IF EXISTS `overtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `overtimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `ot_date` date DEFAULT NULL,
  `ot_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_total_hrs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_production` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `normal_wages_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_wages_rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ot_earning` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_on_date` date DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_overtimes_on_employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtimes`
--

LOCK TABLES `overtimes` WRITE;
/*!40000 ALTER TABLE `overtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtimes` ENABLE KEYS */;
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
INSERT INTO `payment_modes` VALUES (1,'1.0','Cheque',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Cash',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Bank',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','DD','Demand Draft',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','NEFT','National Electronic Funds Transfer',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
-- Table structure for table `performance_periods`
--

DROP TABLE IF EXISTS `performance_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_periods`
--

LOCK TABLES `performance_periods` WRITE;
/*!40000 ALTER TABLE `performance_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_periods` ENABLE KEYS */;
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
-- Table structure for table `rating_masters`
--

DROP TABLE IF EXISTS `rating_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_masters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_masters`
--

LOCK TABLES `rating_masters` WRITE;
/*!40000 ALTER TABLE `rating_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_masters` ENABLE KEYS */;
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
-- Table structure for table `reimbursement_heads`
--

DROP TABLE IF EXISTS `reimbursement_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reimbursement_heads` (
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
-- Dumping data for table `reimbursement_heads`
--

LOCK TABLES `reimbursement_heads` WRITE;
/*!40000 ALTER TABLE `reimbursement_heads` DISABLE KEYS */;
/*!40000 ALTER TABLE `reimbursement_heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reimbursement_requests`
--

DROP TABLE IF EXISTS `reimbursement_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reimbursement_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `reimbursement_head_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reimbursement_requests_on_employee_id` (`employee_id`),
  KEY `index_reimbursement_requests_on_reimbursement_head_id` (`reimbursement_head_id`),
  CONSTRAINT `fk_rails_7d8ca1e0b7` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_f66017dfc9` FOREIGN KEY (`reimbursement_head_id`) REFERENCES `reimbursement_heads` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimbursement_requests`
--

LOCK TABLES `reimbursement_requests` WRITE;
/*!40000 ALTER TABLE `reimbursement_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reimbursement_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reimbursement_slabs`
--

DROP TABLE IF EXISTS `reimbursement_slabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reimbursement_slabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reimbursement_head_id` int(11) DEFAULT NULL,
  `employee_grade_id` int(11) DEFAULT NULL,
  `employee_designation_id` int(11) DEFAULT NULL,
  `from` decimal(10,2) DEFAULT '0.00',
  `to` decimal(10,2) DEFAULT '0.00',
  `monthly_amount` decimal(10,2) DEFAULT '0.00',
  `yearly_amount` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reimbursement_slabs_on_reimbursement_head_id` (`reimbursement_head_id`),
  KEY `index_reimbursement_slabs_on_employee_grade_id` (`employee_grade_id`),
  KEY `index_reimbursement_slabs_on_employee_designation_id` (`employee_designation_id`),
  CONSTRAINT `fk_rails_32b4eb1307` FOREIGN KEY (`employee_grade_id`) REFERENCES `employee_grades` (`id`),
  CONSTRAINT `fk_rails_b227f82ffe` FOREIGN KEY (`reimbursement_head_id`) REFERENCES `reimbursement_heads` (`id`),
  CONSTRAINT `fk_rails_dbfc3ea449` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reimbursement_slabs`
--

LOCK TABLES `reimbursement_slabs` WRITE;
/*!40000 ALTER TABLE `reimbursement_slabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `reimbursement_slabs` ENABLE KEYS */;
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
INSERT INTO `relation_masters` VALUES (1,'1.0','Father',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Mother',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Daughter',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','Son',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','Brother',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(6,'6.0','Wife',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(7,'7.0','Husband',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(8,'8.0','Sister',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
INSERT INTO `religions` VALUES (1,'Hinduism','1.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'Jainism','2.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'Islam','3.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'Christianity','4.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'Sikhism','5.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(6,'Buddhism','6.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  CONSTRAINT `fk_rails_4b58f99d0a` FOREIGN KEY (`employee_transfer_id`) REFERENCES `employee_transfers` (`id`),
  CONSTRAINT `fk_rails_7824eb06c2` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,3,'2017-06-07 05:24:56','2017-06-07 05:24:56',1);
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
  CONSTRAINT `fk_rails_a39169356b` FOREIGN KEY (`employee_resignation_id`) REFERENCES `employee_resignations` (`id`),
  CONSTRAINT `fk_rails_eb1ee47b3d` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
INSERT INTO `reserved_categories` VALUES (1,'1.0','GENERAL','GENERAL',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','OBC','OTHER BACKWARD CLASSES',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','SC','SCHEDULED CASTE',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','ST','SCHEDULED TRIBE',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','NT','Nomadic Tribes',NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
  CONSTRAINT `fk_rails_4ccbad3903` FOREIGN KEY (`leaving_reason_id`) REFERENCES `leaving_reasons` (`id`),
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
-- Table structure for table `reward_allocations`
--

DROP TABLE IF EXISTS `reward_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward_allocations` (
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
-- Dumping data for table `reward_allocations`
--

LOCK TABLES `reward_allocations` WRITE;
/*!40000 ALTER TABLE `reward_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_allocations` ENABLE KEYS */;
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
  KEY `index_rewards_allocations_on_reporting_master_id` (`reporting_master_id`),
  CONSTRAINT `fk_rails_4857fcccb2` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_b3a76cc850` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_c2d3410490` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
  CONSTRAINT `fk_rails_0ea1a76c59` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_9f0c2a73fb` FOREIGN KEY (`reward_type_id`) REFERENCES `reward_types` (`id`),
  CONSTRAINT `fk_rails_cf947cf32f` FOREIGN KEY (`reporting_master_id`) REFERENCES `reporting_masters` (`id`)
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
INSERT INTO `roles` VALUES (1,'1.0','GroupAdmin',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Admin',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Branch',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','HOD',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','Supervisor',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
INSERT INTO `salary_component_templates` VALUES (1,'T001',1,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:29:34','2017-06-07 06:29:34'),(2,'T001',1,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:29:41','2017-06-07 06:29:41'),(3,'T001',1,4,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:30:19','2017-06-07 06:30:19'),(4,'T001',1,22,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:30:39','2017-06-07 06:30:39'),(5,'T001',1,23,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:30:56','2017-06-07 06:30:56'),(6,'T001',1,9,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:31:04','2017-06-07 06:31:04'),(7,'T001',1,24,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:31:18','2017-06-07 06:31:18'),(8,'T001',1,25,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-06-07 06:31:24','2017-06-07 06:31:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'001','Basic','Basic',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:02:16'),(2,'002','HRA','HRA',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:02:24'),(3,'003','Special Allowance','Special Allowance',NULL,0,NULL,'',0,0,'2017-05-26 21:09:51','2017-06-07 06:03:27'),(4,'004','Convenience Allowance','Convenience Allowance',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:03:16'),(5,'5.0','Other Allowance','Other Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(6,'6.0','Washing Allowance','Washing Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(7,'7.0','Driver Allowance','Driver Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(8,'8.0','Medical Allowance','Medical Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(9,'009','Children Education Allowance','Children Education Allowance',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:05:40'),(10,'010','Provident Fund','Provident Fund',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:10:17'),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(12,'12.0','Income Tax','Income Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(13,'13.0','Food Deduction','Food Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(14,'14.0','Other Deduction','Other Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(15,'015','Professional Tax','Professional Tax',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:10:54'),(16,'16.0','Society','Deposit',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(17,'17.0','Society Loan','Society',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(18,'18.0','Retaintion','Retaintion',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(19,'19.0','DA','Dearness Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(20,'20.0','Welfair','Welfair',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(21,'21.0','Mobile Deduction','Mobile Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(22,'022','Medical Reimbursement','Medical Reimbursement',NULL,0,NULL,'',1,1,'2017-06-07 06:04:15','2017-06-07 06:06:11'),(23,'023','Leave Travel Allowance','Leave Travel Allowance',NULL,0,NULL,'',1,1,'2017-06-07 06:05:02','2017-06-07 06:09:40'),(24,'024','Program Allowance','Program Allowance',NULL,0,NULL,'',1,1,'2017-06-07 06:07:21','2017-06-07 06:07:21'),(25,'025','Transport Allowance','Transport Allowance',NULL,0,NULL,'',1,1,'2017-06-07 06:08:11','2017-06-07 06:08:11');
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
INSERT INTO `salary_templates` VALUES (1,'T001','Employee Template','2017-06-01',1,NULL,'2017-06-07 06:28:50','2017-06-07 06:28:50');
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525071934'),('20170525123712'),('20170529115353'),('20170531092320'),('20170531092703'),('20170531114045'),('20170531125126'),('20170602065242'),('20170604072528'),('20170604073538'),('20170607052133'),('20170609074403'),('20170609123339'),('20170610051252');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,1,'AN','Union Territory of Andaman and Nicobar Islands','2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,1,'AP','Andhra Pradesh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,1,'AR','Arunachal Pradesh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(4,1,'AS','Assam','2017-05-26 21:09:51','2017-05-26 21:09:51'),(5,1,'BR','Bihar','2017-05-26 21:09:51','2017-05-26 21:09:51'),(6,1,'CH','Chandigarh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(7,1,'CT','Chhattisgarh','2017-05-26 21:09:51','2017-06-05 05:27:24'),(8,1,'DD','Daman and Diu','2017-05-26 21:09:51','2017-05-26 21:09:51'),(9,1,'DL','National Capital Territory of Delhi','2017-05-26 21:09:51','2017-05-26 21:09:51'),(10,1,'DN','Dadra and Nagar Haveli','2017-05-26 21:09:51','2017-05-26 21:09:51'),(11,1,'GA','Goa','2017-05-26 21:09:51','2017-05-26 21:09:51'),(12,1,'GJ','Gujarat','2017-05-26 21:09:51','2017-05-26 21:09:51'),(13,1,'HP','State of Himachal Pradesh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(14,1,'HR','Haryana','2017-05-26 21:09:51','2017-05-26 21:09:51'),(15,1,'JH','State of Jharkhand','2017-05-26 21:09:51','2017-05-26 21:09:51'),(16,1,'JK','Kashmir','2017-05-26 21:09:51','2017-05-26 21:09:51'),(17,1,'KA','Karnataka','2017-05-26 21:09:51','2017-05-26 21:09:51'),(18,1,'KL','Kerala','2017-05-26 21:09:51','2017-05-26 21:09:51'),(19,1,'LD','Laccadives','2017-05-26 21:09:51','2017-05-26 21:09:51'),(20,1,'MH','Maharashtra','2017-05-26 21:09:51','2017-05-26 21:09:51'),(21,1,'ML','Meghalaya','2017-05-26 21:09:51','2017-05-26 21:09:51'),(22,1,'MN','Manipur','2017-05-26 21:09:51','2017-05-26 21:09:51'),(23,1,'MP','Madhya Pradesh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(24,1,'MZ','Mizoram','2017-05-26 21:09:51','2017-05-26 21:09:51'),(25,1,'NL','Nagaland','2017-05-26 21:09:51','2017-05-26 21:09:51'),(26,1,'OR','Odisha','2017-05-26 21:09:51','2017-05-26 21:09:51'),(27,1,'PB','State of Punjab','2017-05-26 21:09:51','2017-05-26 21:09:51'),(28,1,'PY','Union Territory of Puducherry','2017-05-26 21:09:51','2017-05-26 21:09:51'),(29,1,'RJ','Rajasthan','2017-05-26 21:09:51','2017-05-26 21:09:51'),(30,1,'SK','Sikkim','2017-05-26 21:09:51','2017-05-26 21:09:51'),(31,1,'TG','Telangana','2017-05-26 21:09:51','2017-05-26 21:09:51'),(32,1,'TN','Tamil Nadu','2017-05-26 21:09:51','2017-05-26 21:09:51'),(33,1,'TR','Tripura','2017-05-26 21:09:51','2017-05-26 21:09:51'),(34,1,'UL','Uttarakhand','2017-05-26 21:09:51','2017-05-26 21:09:51'),(35,1,'UP','Uttar Pradesh','2017-05-26 21:09:51','2017-05-26 21:09:51'),(36,1,'WB','West Bengal','2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `travel_expence_types` VALUES (1,'1.0','Travel Expence',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,'2.0','Food Expence',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,'3.0','Lodgging Expence',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(4,'4.0','Other Expence',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `travel_modes` VALUES (1,'1.0','By Bus',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,'2.0','By Train',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,'3.0','By Plan',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(4,'4.0','By Ship',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
INSERT INTO `travel_options` VALUES (1,'1.0','Domestic',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(2,'2.0','National',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(3,'3.0','International',NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51');
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
  `total_advance` decimal(10,0) DEFAULT NULL,
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
  `gatepass` decimal(10,0) DEFAULT NULL,
  `nonpayble_day` decimal(10,0) DEFAULT NULL,
  `nonpayable_day` decimal(10,0) DEFAULT NULL,
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

-- Dump completed on 2017-06-26  4:58:55
