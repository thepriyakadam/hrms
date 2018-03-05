-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (i686)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_bosses`
--

LOCK TABLES `about_bosses` WRITE;
/*!40000 ALTER TABLE `about_bosses` DISABLE KEYS */;
INSERT INTO `about_bosses` VALUES (1,'AB1','Anything related to manager ?','',1,NULL,'2017-12-30 08:14:52','2017-12-30 08:14:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_companies`
--

LOCK TABLES `about_companies` WRITE;
/*!40000 ALTER TABLE `about_companies` DISABLE KEYS */;
INSERT INTO `about_companies` VALUES (1,'AC1','Something about company ?','',1,NULL,'2017-12-30 08:13:50','2017-12-30 08:13:50');
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
-- Table structure for table `accesses`
--

DROP TABLE IF EXISTS `accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesses`
--

LOCK TABLES `accesses` WRITE;
/*!40000 ALTER TABLE `accesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesses` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
INSERT INTO `advance_salaries` VALUES (1,280,232.00,'1',232.00,'2017-06-02','2017-08-01 07:42:48','2017-08-01 07:42:48',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_types`
--

LOCK TABLES `asset_types` WRITE;
/*!40000 ALTER TABLE `asset_types` DISABLE KEYS */;
INSERT INTO `asset_types` VALUES (1,'1001','Laptop','',NULL,'2017-08-22 07:06:05','2017-08-22 07:06:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_assets`
--

LOCK TABLES `assigned_assets` WRITE;
/*!40000 ALTER TABLE `assigned_assets` DISABLE KEYS */;
INSERT INTO `assigned_assets` VALUES (1,332,1,'HP','1200',35000,'Active','2017-08-30',NULL,NULL,'','2017-08-22 07:07:07','2017-08-22 07:07:07'),(2,307,1,'Lenovo ideapad 320','',NULL,'Active','2017-09-15',NULL,NULL,'','2017-10-31 06:35:54','2017-10-31 06:35:54'),(3,307,1,'Lenovo ideapad 320','',NULL,'Active','2017-09-15',NULL,NULL,'','2017-10-31 06:36:01','2017-10-31 06:36:01'),(4,307,1,'Lenovo ideapad 320','',NULL,'Active','2017-09-15',NULL,NULL,'','2017-10-31 06:36:07','2017-10-31 06:36:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'State Bank of India',NULL,NULL,NULL,'2017-07-27 10:42:17','2017-07-27 10:42:17'),(2,'HDFC Bank Ltd',NULL,NULL,NULL,'2017-07-27 10:42:40','2017-07-27 10:42:40'),(3,'ICICI Bank Ltd',NULL,NULL,NULL,'2017-07-27 10:42:53','2017-07-27 10:42:53'),(4,'Cosmos Bank',NULL,NULL,NULL,'2017-07-27 10:43:05','2017-07-27 10:43:05'),(5,'Saraswat co. op. bank',NULL,NULL,NULL,'2017-07-27 10:43:17','2017-07-27 10:43:17'),(6,'Axis Bank Ltd',NULL,NULL,NULL,'2017-07-27 10:43:27','2017-07-27 10:43:27'),(7,'Bank of Maharashtra',NULL,NULL,NULL,'2017-07-27 10:43:38','2017-07-27 11:00:33'),(8,'The Federal Bank',NULL,NULL,NULL,'2017-07-27 10:43:50','2017-07-27 10:43:50'),(9,'Central Bank of India',NULL,NULL,NULL,'2017-07-27 10:44:02','2017-07-27 10:44:02'),(10,'IDBI Bank',NULL,NULL,NULL,'2017-07-27 10:44:12','2017-07-27 10:44:12'),(11,'Union Bank of India',NULL,NULL,NULL,'2017-07-27 10:44:24','2017-07-27 10:44:24'),(12,'Kotak Mahindra Bank',NULL,NULL,NULL,'2017-07-27 10:44:36','2017-07-27 10:44:36'),(13,'Bank of Baroda',NULL,NULL,NULL,'2017-07-27 10:44:46','2017-07-27 10:44:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_employers`
--

LOCK TABLES `bonus_employers` WRITE;
/*!40000 ALTER TABLE `bonus_employers` DISABLE KEYS */;
INSERT INTO `bonus_employers` VALUES (1,'1',7000,8,'2016-11-01','2017-10-31',1,NULL,'2017-09-25 07:35:57','2017-09-25 07:35:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_designations`
--

LOCK TABLES `change_designations` WRITE;
/*!40000 ALTER TABLE `change_designations` DISABLE KEYS */;
INSERT INTO `change_designations` VALUES (1,332,10,'2017-06-15','2017-08-31',0,250,'2017-08-22 06:54:15','2017-08-22 06:54:15'),(2,307,4,'2017-08-31',NULL,1,250,'2017-08-22 11:15:25','2017-08-22 11:15:25'),(3,332,9,'2017-08-31',NULL,1,250,'2017-08-22 11:17:13','2017-08-22 11:17:13'),(4,424,8,'2017-11-20',NULL,1,307,'2017-11-21 09:48:13','2017-11-21 09:48:13'),(5,359,8,'2014-03-07',NULL,1,307,'2017-12-26 07:15:00','2017-12-26 07:15:00');
/*!40000 ALTER TABLE `change_designations` ENABLE KEYS */;
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
-- Table structure for table `checkinouts`
--

DROP TABLE IF EXISTS `checkinouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkinouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkinouts`
--

LOCK TABLES `checkinouts` WRITE;
/*!40000 ALTER TABLE `checkinouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkinouts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,NULL,'C001','COM001','SPAN PUMPS PVT LTD','SPAN PUMPS ',1,'123456789','','','','Office  address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.',1,20,504,'Pune',411045,' hrassistant2@spanpump.com','12345678','www.spanpumpsindia.com','2017-05-01','2017-05-26 21:42:32','2017-11-14 07:31:09','span_pumps_logo.jpg','image/jpeg',6426,'2017-11-14 07:31:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_events`
--

LOCK TABLES `company_events` WRITE;
/*!40000 ALTER TABLE `company_events` DISABLE KEYS */;
INSERT INTO `company_events` VALUES (1,'Indepedance day','2017-08-14','Baner',0,'4PM','NA','2017-08-01 11:18:05','2017-11-12 21:07:53','vish.hake04@gmail.com',NULL),(2,'Independence day','2017-08-14','Baner',0,'4PM','NA','2017-08-01 11:18:05','2017-11-12 21:08:45','',NULL),(3,'Ganesh Festival','2017-08-25','Pune',0,'10','Ganesh Sthapana','2017-08-22 07:41:15','2017-09-11 13:20:41','',NULL),(4,'Christmas','2017-12-25','Green Park,Baner',1,'7PM','ABC','2017-12-30 08:03:30','2017-12-30 08:04:29','vishal.h@indibasolutions.com',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_locations`
--

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;
INSERT INTO `company_locations` VALUES (1,1,'L001','COMLOC001','Pune','vish.hake04@gmail.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Pune',1,20,504,411045,'12345678','2017-05-26 21:48:55','2017-09-15 07:56:23'),(2,1,'L002','COMLOC002','Andhra Pradesh','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Andra',1,2,7,411045,'12345678','2017-05-26 21:53:06','2017-05-26 21:53:06'),(3,1,'L003','COMLOC003','Chhattisgarh','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Durg',1,7,120,411045,'12345678','2017-05-26 21:55:01','2017-05-26 21:55:01'),(4,1,'L004','COMLOC004','Odisha','hrassistant2@spanpump.com','	Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Puri',1,26,616,411045,'12345678','2017-05-26 21:56:52','2017-05-26 21:56:52'),(5,1,'L005','COMLOC005','Rajasthan','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Bhilwara',1,29,678,411045,'12345678','2017-05-26 21:58:49','2017-05-26 21:58:49'),(6,1,'L006','COMLOC006','Sanaswadi','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Pune',1,20,504,411045,'12345678','2017-05-26 22:00:36','2017-06-07 08:46:53'),(7,1,'L007','COMLOC007','Telangana','hrassistant2@spanpump.com','Office address : Office No. 1001, Tower No 2, Montreal Business Centre, Baner Road, Baner, Pune- 411045.','Hyderabad',1,31,737,411045,'12345678','2017-05-26 22:02:39','2017-05-26 22:02:39'),(8,1,'CL08','COMLOC008','Bihar','Bihar@gmail.com','','Patna',1,5,106,321456,'','2017-06-07 08:53:43','2017-06-07 08:53:43'),(9,1,'CL09','COMLOC009','Bhubaneswar','vish.hake04@gmail.com','','Bhubaneswar',1,26,604,123456,'','2017-10-31 10:31:16','2017-10-31 10:31:16'),(10,1,'CL10','COMLOC010','Sambalpur','vish.hake04@gmail.com','','Sambalpur',1,26,619,123456,'','2017-10-31 10:33:17','2017-10-31 10:33:17');
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
  `policy_type_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_email` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_company_policies_on_policy_type_id` (`policy_type_id`),
  CONSTRAINT `fk_rails_d3230c8d05` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_policies`
--

LOCK TABLES `company_policies` WRITE;
/*!40000 ALTER TABLE `company_policies` DISABLE KEYS */;
INSERT INTO `company_policies` VALUES (1,'Leave Policy',NULL,NULL,'',1,'2017-08-22 09:29:23','2017-08-22 09:29:23','Transfer_letter.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',11284,'2017-08-22 09:29:23',1,NULL,NULL),(2,'fff',NULL,NULL,'',1,'2017-08-22 09:32:04','2017-08-22 09:32:04','2957_1.doc','application/msword',46592,'2017-08-22 09:32:04',2,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_time_masters`
--

LOCK TABLES `company_time_masters` WRITE;
/*!40000 ALTER TABLE `company_time_masters` DISABLE KEYS */;
INSERT INTO `company_time_masters` VALUES (1,'2017-12-30 11:00:00','2017-12-30 17:00:00','2017-12-30 20:00:00','09:00',1,1,'2017-12-30 09:30:00','2017-12-30 18:30:00','2017-12-30 08:00:00','',1,1,'2017-09-18 04:28:26','2017-12-30 08:34:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
INSERT INTO `contact_details` VALUES (1,251,'Swarali Nikhil Pitre','',1,'HR','Payroll','Management','','','','','','2017-12-30 08:17:49','2017-12-30 08:17:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_centers`
--

LOCK TABLES `cost_centers` WRITE;
/*!40000 ALTER TABLE `cost_centers` DISABLE KEYS */;
INSERT INTO `cost_centers` VALUES (1,NULL,'Pool',NULL,NULL,'2017-09-12 06:12:21','2017-09-12 06:12:21'),(4,NULL,'Research',NULL,NULL,'2017-12-30 08:07:21','2017-12-30 08:07:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_auto_increments`
--

LOCK TABLES `custom_auto_increments` WRITE;
/*!40000 ALTER TABLE `custom_auto_increments` DISABLE KEYS */;
INSERT INTO `custom_auto_increments` VALUES (1,'company',1,'2017-05-26 21:42:32','2017-05-26 21:42:32'),(2,'company_location',10,'2017-05-26 21:48:55','2017-10-31 10:33:17'),(3,'department',60,'2017-05-26 22:07:40','2017-11-01 11:53:17'),(4,'employee',459,'2017-06-06 22:09:45','2017-11-21 07:48:50'),(6,'salaryslip',65,'2017-08-01 07:59:38','2017-08-01 10:34:38');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `place` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144408 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_attendances`
--

LOCK TABLES `daily_attendances` WRITE;
/*!40000 ALTER TABLE `daily_attendances` DISABLE KEYS */;
INSERT INTO `daily_attendances` VALUES (144345,NULL,'2017-12-16','2017-12-16 09:48:53','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144346,NULL,'2017-12-16','2017-12-16 09:48:57','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144347,NULL,'2017-12-18','2017-12-18 18:59:39','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144348,NULL,'2017-12-18','2017-12-18 18:59:43','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144349,NULL,'2017-12-16','2017-12-16 09:31:54','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144350,NULL,'2017-12-16','2017-12-16 09:32:06','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144351,NULL,'2017-12-18','2017-12-18 18:37:44','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144352,NULL,'2017-12-19','2017-12-19 09:29:59','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144353,NULL,'2017-12-19','2017-12-19 09:30:02','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144354,NULL,'2017-12-16','2017-12-16 18:57:18','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144355,NULL,'2017-12-16','2017-12-16 10:18:24','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144356,NULL,'2017-12-18','2017-12-18 18:29:54','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144357,NULL,'2017-12-19','2017-12-19 09:57:16','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144358,NULL,'2017-12-16','2017-12-16 09:51:28','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144359,NULL,'2017-12-16','2017-12-16 18:57:46','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144360,NULL,'2017-12-18','2017-12-18 10:40:08','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144361,NULL,'2017-12-19','2017-12-19 10:08:52','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(144362,NULL,'2017-12-19','2017-12-19 16:04:09','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 11:00:17','2017-12-19 11:00:17',NULL,NULL,NULL),(144363,NULL,'2017-12-19','2017-12-19 18:52:00','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-19 14:00:16','2017-12-19 14:00:16',NULL,NULL,NULL),(144364,NULL,'2017-12-19','2017-12-19 18:52:15','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-19 14:00:17','2017-12-19 14:00:17',NULL,NULL,NULL),(144365,NULL,'2017-12-19','2017-12-19 18:39:23','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-19 14:00:17','2017-12-19 14:00:17',NULL,NULL,NULL),(144366,NULL,'2017-12-19','2017-12-19 18:47:59','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-19 14:00:17','2017-12-19 14:00:17',NULL,NULL,NULL),(144367,NULL,'2017-12-20','2017-12-20 09:42:10','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-20 05:00:17','2017-12-20 05:00:17',NULL,NULL,NULL),(144368,NULL,'2017-12-20','2017-12-20 09:42:14','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-20 05:00:17','2017-12-20 05:00:17',NULL,NULL,NULL),(144369,NULL,'2017-12-20','2017-12-20 10:16:12','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-20 05:00:17','2017-12-20 05:00:17',NULL,NULL,NULL),(144370,NULL,'2017-12-21','2017-12-21 16:52:39','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:16','2017-12-21 12:00:16',NULL,NULL,NULL),(144371,NULL,'2017-12-20','2017-12-20 18:28:06','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:16','2017-12-21 12:00:16',NULL,NULL,NULL),(144372,NULL,'2017-12-20','2017-12-20 18:59:43','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:16','2017-12-21 12:00:16',NULL,NULL,NULL),(144373,NULL,'2017-12-20','2017-12-20 19:12:18','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:16','2017-12-21 12:00:16',NULL,NULL,NULL),(144374,NULL,'2017-12-21','2017-12-21 09:23:31','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:17','2017-12-21 12:00:17',NULL,NULL,NULL),(144375,NULL,'2017-12-21','2017-12-21 09:59:31','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:17','2017-12-21 12:00:17',NULL,NULL,NULL),(144376,NULL,'2017-12-21','2017-12-21 10:10:56','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-21 12:00:17','2017-12-21 12:00:17',NULL,NULL,NULL),(144377,NULL,'2017-12-21','2017-12-21 18:30:37','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(144378,NULL,'2017-12-21','2017-12-21 18:41:14','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(144379,NULL,'2017-12-22','2017-12-22 09:58:52','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(144380,NULL,'2017-12-22','2017-12-22 10:07:19','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(144381,NULL,'2017-12-22','2017-12-22 10:16:07','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(144382,NULL,'2017-12-22','2017-12-22 18:35:07','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-22 14:00:17','2017-12-22 14:00:17',NULL,NULL,NULL),(144383,NULL,'2017-12-22','2017-12-22 18:45:24','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-22 14:00:17','2017-12-22 14:00:17',NULL,NULL,NULL),(144384,NULL,'2017-12-22','2017-12-22 18:51:30','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-22 14:00:17','2017-12-22 14:00:17',NULL,NULL,NULL),(144385,NULL,'2017-12-23','2017-12-23 08:03:51','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-23 03:00:17','2017-12-23 03:00:17',NULL,NULL,NULL),(144386,NULL,'2017-12-23','2017-12-23 08:14:44','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-23 03:00:17','2017-12-23 03:00:17',NULL,NULL,NULL),(144387,NULL,'2017-12-23','2017-12-23 10:09:32','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-23 05:00:18','2017-12-23 05:00:18',NULL,NULL,NULL),(144388,NULL,'2017-12-23','2017-12-23 17:47:35','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-23 13:00:17','2017-12-23 13:00:17',NULL,NULL,NULL),(144389,NULL,'2017-12-23','2017-12-23 18:10:06','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-23 13:00:17','2017-12-23 13:00:17',NULL,NULL,NULL),(144390,NULL,'2017-12-23','2017-12-23 18:32:47','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-23 14:00:16','2017-12-23 14:00:16',NULL,NULL,NULL),(144391,NULL,'2017-12-23','2017-12-23 18:33:33','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-23 14:00:16','2017-12-23 14:00:16',NULL,NULL,NULL),(144392,NULL,'2017-12-23','2017-12-23 18:48:31','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-23 14:00:16','2017-12-23 14:00:16',NULL,NULL,NULL),(144393,NULL,'2017-12-25','2017-12-25 09:44:23','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(144394,NULL,'2017-12-25','2017-12-25 10:06:24','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(144395,NULL,'2017-12-25','2017-12-25 10:10:09','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(144396,NULL,'2017-12-25','2017-12-25 18:15:47','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(144397,NULL,'2017-12-25','2017-12-25 18:20:41','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(144398,NULL,'2017-12-25','2017-12-25 18:25:48','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(144399,NULL,'2017-12-25','2017-12-25 18:26:34','100016',NULL,NULL,NULL,NULL,NULL,'2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(144400,NULL,'2017-12-26','2017-12-26 09:36:29','100033',NULL,NULL,NULL,NULL,NULL,'2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(144401,NULL,'2017-12-26','2017-12-26 10:00:08','100056',NULL,NULL,NULL,NULL,NULL,'2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(144402,NULL,'2017-12-26','2017-12-26 10:02:44','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(144403,NULL,'2017-12-26','2017-12-26 10:30:45','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-26 06:00:16','2017-12-26 06:00:16',NULL,NULL,NULL),(144404,NULL,'2017-12-26','2017-12-26 18:17:45','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-26 13:00:16','2017-12-26 13:00:16',NULL,NULL,NULL),(144405,NULL,'2017-12-26','2017-12-26 18:57:15','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-26 14:00:16','2017-12-26 14:00:16',NULL,NULL,NULL),(144406,NULL,'2017-12-27','2017-12-27 10:14:00','100058',NULL,NULL,NULL,NULL,NULL,'2017-12-27 05:00:18','2017-12-27 05:00:18',NULL,NULL,NULL),(144407,NULL,'2017-12-27','2017-12-27 10:23:38','100055',NULL,NULL,NULL,NULL,NULL,'2017-12-27 05:00:18','2017-12-27 05:00:18',NULL,NULL,NULL);
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,2,'D01','DEPT001','','Account',3,'',NULL,'2017-05-26 22:07:40','2017-06-05 05:09:20'),(2,2,'D02','DEPT002','','Material Management',3,'',NULL,'2017-05-26 22:08:14','2017-06-05 05:03:48'),(3,2,'D03','DEPT003','','Projects Operations',2,'',NULL,'2017-05-26 22:08:39','2017-05-26 22:08:39'),(4,2,'D04','DEPT004','','Project MIS',3,'',NULL,'2017-05-26 22:09:17','2017-05-26 22:09:17'),(5,2,'D05','DEPT005','','Sales & Marketing',2,'',NULL,'2017-05-26 22:09:43','2017-05-26 22:09:43'),(6,3,'D06','DEPT006','','Account',3,'',NULL,'2017-05-26 22:10:22','2017-06-05 05:09:28'),(7,3,'D07','DEPT007','','Human Resource Management',3,'',NULL,'2017-05-26 22:10:43','2017-06-05 05:10:59'),(8,3,'D08','DEPT008','','Material Management',3,'',NULL,'2017-05-26 22:11:08','2017-06-05 05:04:01'),(9,3,'D09','DEPT009','','Projects Operations',2,'',NULL,'2017-05-26 22:11:34','2017-05-26 22:11:34'),(10,3,'D10','DEPT010','','Project MIS',3,'',NULL,'2017-05-26 22:12:07','2017-05-26 22:12:07'),(11,3,'D11','DEPT011','','Sales & Marketing',2,'',NULL,'2017-05-26 22:12:39','2017-05-26 22:12:39'),(12,4,'D12','DEPT012','','Account',3,'',NULL,'2017-05-26 22:13:07','2017-06-05 05:09:39'),(13,4,'D13','DEPT013','','Human Resource Management',3,'',NULL,'2017-05-26 22:13:26','2017-06-05 05:11:09'),(14,4,'D14','DEPT014','','Material Management',3,'',NULL,'2017-05-26 22:13:54','2017-06-05 05:04:14'),(15,4,'D15','DEPT015','','Projects Operations',2,'',NULL,'2017-05-26 22:15:13','2017-05-26 22:15:13'),(16,4,'D16','DEPT016','','Project MIS',3,'',NULL,'2017-05-26 22:15:49','2017-05-26 22:15:49'),(17,4,'D17','DEPT017','','Sales & Marketing',2,'',NULL,'2017-05-26 22:16:25','2017-05-26 22:16:25'),(18,4,'D18','DEPT018','','Sales & Marketing',2,'',NULL,'2017-05-26 22:17:54','2017-05-26 22:17:54'),(19,4,'D19','DEPT019','','Production Water Tank  Unit',2,'',NULL,'2017-05-26 22:18:26','2017-05-26 22:18:26'),(20,1,'D20','DEPT020','','Account',3,'',NULL,'2017-05-26 22:19:09','2017-06-05 05:09:50'),(21,1,'D21','DEPT021','','Admin',3,'',NULL,'2017-05-26 22:19:31','2017-05-26 22:19:31'),(22,1,'D22','DEPT022','','Production Electronic Assembly',2,'',NULL,'2017-05-26 22:20:00','2017-05-26 22:20:00'),(23,1,'D23','DEPT023','','Engineering',3,'',NULL,'2017-05-26 22:22:16','2017-05-26 22:22:16'),(24,1,'D24','DEPT024','','Human Resource Management',3,'',NULL,'2017-05-26 22:22:45','2017-06-05 05:11:20'),(25,1,'D25','DEPT025','','IT',3,'',NULL,'2017-05-26 22:23:06','2017-05-26 22:23:06'),(26,1,'D26','DEPT026','','Purchase',3,'',NULL,'2017-05-26 22:23:55','2017-05-26 22:23:55'),(27,1,'D27','DEPT027','','Projects Operations',2,'',NULL,'2017-05-26 22:24:50','2017-05-26 22:24:50'),(28,1,'D28','DEPT028','','Project MIS',3,'',NULL,'2017-05-26 22:25:23','2017-05-26 22:25:23'),(29,1,'D29','DEPT029','','R & D',2,'',NULL,'2017-05-26 22:25:55','2017-06-05 05:09:07'),(30,1,'D30','DEPT030','','Sales & Marketing',2,'',NULL,'2017-05-26 22:26:14','2017-05-26 22:26:14'),(31,1,'D31','DEPT031','','Material Management',3,'',NULL,'2017-05-26 22:26:44','2017-06-05 05:04:25'),(32,5,'D32','DEPT032','','Account',3,'',NULL,'2017-05-26 22:27:13','2017-06-05 05:09:58'),(33,5,'D33','DEPT033','','Material Management',3,'',NULL,'2017-05-26 22:27:36','2017-06-05 05:04:37'),(34,5,'D34','DEPT034','','Projects Operations',2,'',NULL,'2017-05-26 22:27:53','2017-05-26 22:27:53'),(35,5,'D35','DEPT035','','Project MIS',3,'',NULL,'2017-05-26 22:28:16','2017-05-26 22:28:16'),(36,5,'D36','DEPT036','','Sales & Marketing',2,'',NULL,'2017-05-26 22:28:42','2017-05-26 22:28:42'),(37,6,'D37','DEPT037','','Production Fabrication',3,'',NULL,'2017-05-26 22:29:14','2017-05-26 22:29:14'),(38,6,'D38','DEPT038','','Admin',3,'',NULL,'2017-05-26 22:29:33','2017-05-26 22:29:33'),(39,6,'D39','DEPT039','','Human Resource Management',3,'',NULL,'2017-05-26 22:29:56','2017-06-05 05:11:30'),(40,6,'D40','DEPT040','','Material Management',3,'',NULL,'2017-05-26 22:30:12','2017-06-05 05:04:45'),(41,7,'D41','DEPT041','','Account',3,'',NULL,'2017-05-26 22:30:30','2017-06-05 05:10:14'),(42,7,'D42','DEPT042','','Material Management',3,'',NULL,'2017-05-26 22:30:56','2017-06-05 05:04:54'),(43,1,'D43','DEPT043','','Pump Division',2,'',NULL,'2017-05-26 22:31:14','2017-06-05 05:08:06'),(44,7,'D44','DEPT044','','Project MIS',3,'',NULL,'2017-05-26 22:31:36','2017-05-26 22:31:36'),(45,7,'D45','DEPT045','','Sales & Marketing',2,'',NULL,'2017-05-26 22:31:58','2017-05-26 22:31:58'),(46,8,'D46','DEPT046','','Projects Operations',2,'',NULL,'2017-06-07 09:14:50','2017-06-07 09:14:50'),(47,7,'D47','DEPT047','','Projects Operations',2,'',NULL,'2017-06-07 09:17:31','2017-06-07 09:17:31'),(48,3,'D48','DEPT048','','Back Office',3,'',NULL,'2017-10-31 10:35:25','2017-10-31 10:35:25'),(49,10,'D49','DEPT049','','Factory',2,'',NULL,'2017-10-31 10:36:10','2017-10-31 10:36:10'),(50,9,'D50','DEPT050','','Human Resource Management',2,'',NULL,'2017-10-31 10:37:08','2017-10-31 10:37:08'),(51,3,'D51','DEPT051','','Logistic',2,'',NULL,'2017-10-31 10:38:07','2017-10-31 10:38:07'),(52,3,'D52','DEPT052','','Maintainance',2,'',NULL,'2017-10-31 10:39:06','2017-10-31 10:39:06'),(53,9,'D53','DEPT053','','Project',2,'',NULL,'2017-10-31 10:39:54','2017-10-31 10:39:54'),(54,3,'D54','DEPT054','','Project',2,'',NULL,'2017-10-31 10:41:07','2017-10-31 10:41:07'),(55,2,'D55','DEPT055','','Project',2,'',NULL,'2017-10-31 10:41:48','2017-10-31 10:41:48'),(56,7,'D56','DEPT056','','Project',2,'',NULL,'2017-10-31 10:42:29','2017-10-31 10:42:29'),(57,5,'D57','DEPT057','','Project',2,'',NULL,'2017-10-31 10:43:14','2017-10-31 10:43:14'),(58,8,'D58','DEPT058','','Project',2,'',NULL,'2017-10-31 10:43:48','2017-10-31 10:43:48'),(59,9,'D59','DEPT059','','Account',2,'',NULL,'2017-11-01 11:52:31','2017-11-01 11:52:31'),(60,10,'D60','DEPT060','','Account',2,'',NULL,'2017-11-01 11:53:17','2017-11-01 11:53:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=1134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,1,NULL,'Maru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(2,1,NULL,'Port Blair','2017-05-26 21:09:52','2017-05-26 21:09:52'),(3,1,NULL,'Sawi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(4,2,NULL,'Akividu','2017-05-26 21:09:52','2017-05-26 21:09:52'),(5,2,NULL,'Amalapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(6,2,NULL,'Anantapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(7,2,NULL,'Andra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(8,2,NULL,'Avanigadda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(9,2,NULL,'Bapatla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(10,2,NULL,'Bhimavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(11,2,NULL,'Bobbili','2017-05-26 21:09:52','2017-05-26 21:09:52'),(12,2,NULL,'Chirala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(13,2,NULL,'Chittoor','2017-05-26 21:09:52','2017-05-26 21:09:52'),(14,2,NULL,'Cumbum','2017-05-26 21:09:52','2017-05-26 21:09:52'),(15,2,NULL,'Darsi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(16,2,NULL,'Dhone','2017-05-26 21:09:52','2017-05-26 21:09:52'),(17,2,NULL,'Eluru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(18,2,NULL,'Gampalagudem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(19,2,NULL,'Gannavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(20,2,NULL,'Gorantla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(21,2,NULL,'Gudivada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(22,2,NULL,'Guntur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(23,2,NULL,'Kadapa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(24,2,NULL,'Kakinada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(25,2,NULL,'Kanigiri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(26,2,NULL,'Kavali','2017-05-26 21:09:52','2017-05-26 21:09:52'),(27,2,NULL,'Kovvur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(28,2,NULL,'Kuppam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(29,2,NULL,'Kurnool','2017-05-26 21:09:52','2017-05-26 21:09:52'),(30,2,NULL,'Machilipatnam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(31,2,NULL,'Madanapalle','2017-05-26 21:09:52','2017-05-26 21:09:52'),(32,2,NULL,'Mahal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(33,2,NULL,'Mandapeta','2017-05-26 21:09:52','2017-05-26 21:09:52'),(34,2,NULL,'Mangalagiri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(35,2,NULL,'Markapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(36,2,NULL,'Medarametla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(37,2,NULL,'Muddanuru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(38,2,NULL,'Nagari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(39,2,NULL,'Nandigama','2017-05-26 21:09:52','2017-05-26 21:09:52'),(40,2,NULL,'Nandyal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(41,2,NULL,'Narasaraopet','2017-05-26 21:09:52','2017-05-26 21:09:52'),(42,2,NULL,'Nellore','2017-05-26 21:09:52','2017-05-26 21:09:52'),(43,2,NULL,'Nuzvid','2017-05-26 21:09:52','2017-05-26 21:09:52'),(44,2,NULL,'Ongole','2017-05-26 21:09:52','2017-05-26 21:09:52'),(45,2,NULL,'Pakala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(46,2,NULL,'Peddapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(47,2,NULL,'Piduguralla','2017-05-26 21:09:52','2017-05-26 21:09:52'),(48,2,NULL,'Pileru','2017-05-26 21:09:52','2017-05-26 21:09:52'),(49,2,NULL,'Pithapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(50,2,NULL,'Proddatur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(51,2,NULL,'Puttur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(52,2,NULL,'Rajahmundry','2017-05-26 21:09:52','2017-05-26 21:09:52'),(53,2,NULL,'Ramapuram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(54,2,NULL,'Ramavaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(55,2,NULL,'Singarayakonda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(56,2,NULL,'Srikakulam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(57,2,NULL,'Tadepallegudem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(58,2,NULL,'Tanuku','2017-05-26 21:09:52','2017-05-26 21:09:52'),(59,2,NULL,'Thenali','2017-05-26 21:09:52','2017-05-26 21:09:52'),(60,2,NULL,'Tirumala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(61,2,NULL,'Tirumala - Tirupati','2017-05-26 21:09:52','2017-05-26 21:09:52'),(62,2,NULL,'Vijayawada','2017-05-26 21:09:52','2017-05-26 21:09:52'),(63,2,NULL,'Vinukonda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(64,2,NULL,'Visakhapatnam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(65,2,NULL,'Vizianagaram','2017-05-26 21:09:52','2017-05-26 21:09:52'),(66,2,NULL,'Yanam','2017-05-26 21:09:52','2017-05-26 21:09:52'),(67,3,NULL,'Hong','2017-05-26 21:09:52','2017-05-26 21:09:52'),(68,3,NULL,'Itanagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(69,4,NULL,'Arunachal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(70,4,NULL,'Barpeta','2017-05-26 21:09:52','2017-05-26 21:09:52'),(71,4,NULL,'Bhandari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(72,4,NULL,'Dhubri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(73,4,NULL,'Dibrugarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(74,4,NULL,'Golaghat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(75,4,NULL,'Goshaingaon','2017-05-26 21:09:52','2017-05-26 21:09:52'),(76,4,NULL,'Guwahati','2017-05-26 21:09:52','2017-05-26 21:09:52'),(77,4,NULL,'Jorhat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(78,4,NULL,'Karimganj','2017-05-26 21:09:52','2017-05-26 21:09:52'),(79,4,NULL,'Kokrajhar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(80,4,NULL,'Lala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(81,4,NULL,'Nalbari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(82,4,NULL,'Namrup','2017-05-26 21:09:52','2017-05-26 21:09:52'),(83,4,NULL,'Nazira','2017-05-26 21:09:52','2017-05-26 21:09:52'),(84,4,NULL,'North Lakhimpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(85,4,NULL,'Powai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(86,4,NULL,'Sibsagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(87,4,NULL,'Silchar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(88,4,NULL,'Tezpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(89,4,NULL,'Tinsukia','2017-05-26 21:09:52','2017-05-26 21:09:52'),(90,4,NULL,'Ulubari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(91,5,NULL,'Banka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(92,5,NULL,'Begusarai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(93,5,NULL,'Bhagalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(94,5,NULL,'Bhawanipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(95,5,NULL,'Bihar Sharif','2017-05-26 21:09:52','2017-05-26 21:09:52'),(96,5,NULL,'Chandan','2017-05-26 21:09:52','2017-05-26 21:09:52'),(97,5,NULL,'Darbhanga','2017-05-26 21:09:52','2017-05-26 21:09:52'),(98,5,NULL,'Dhaka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(99,5,NULL,'Gaya','2017-05-26 21:09:52','2017-05-26 21:09:52'),(100,5,NULL,'Jaynagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(101,5,NULL,'Jha Jha','2017-05-26 21:09:52','2017-05-26 21:09:52'),(102,5,NULL,'Kamat','2017-05-26 21:09:52','2017-05-26 21:09:52'),(103,5,NULL,'Motihari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(104,5,NULL,'Munger','2017-05-26 21:09:52','2017-05-26 21:09:52'),(105,5,NULL,'Muzaffarpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(106,5,NULL,'Patna','2017-05-26 21:09:52','2017-05-26 21:09:52'),(107,5,NULL,'Purnea','2017-05-26 21:09:52','2017-05-26 21:09:52'),(108,5,NULL,'Pusa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(109,5,NULL,'Raxaul','2017-05-26 21:09:52','2017-05-26 21:09:52'),(110,5,NULL,'Sakri','2017-05-26 21:09:52','2017-05-26 21:09:52'),(111,5,NULL,'Samastipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(112,6,NULL,'Chandigarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(113,7,NULL,'Ambikapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(114,7,NULL,'Bemetara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(115,7,NULL,'Bhatapara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(116,7,NULL,'Bhilai','2017-05-26 21:09:52','2017-05-26 21:09:52'),(117,7,NULL,'Bilaspur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(118,7,NULL,'Champa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(119,7,NULL,'Dhamtari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(120,7,NULL,'Durg','2017-05-26 21:09:52','2017-05-26 21:09:52'),(121,7,NULL,'Jagdalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(122,7,NULL,'Janjgir','2017-05-26 21:09:52','2017-05-26 21:09:52'),(123,7,NULL,'Koni','2017-05-26 21:09:52','2017-05-26 21:09:52'),(124,7,NULL,'Korba','2017-05-26 21:09:52','2017-05-26 21:09:52'),(125,7,NULL,'Kumhari','2017-05-26 21:09:52','2017-05-26 21:09:52'),(126,7,NULL,'Lanka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(127,7,NULL,'Mohala','2017-05-26 21:09:52','2017-05-26 21:09:52'),(128,7,NULL,'Raigarh','2017-05-26 21:09:52','2017-05-26 21:09:52'),(129,7,NULL,'Raipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(130,7,NULL,'Sukma','2017-05-26 21:09:52','2017-05-26 21:09:52'),(131,8,NULL,'Daman','2017-05-26 21:09:52','2017-05-26 21:09:52'),(132,9,NULL,'Alipur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(133,9,NULL,'Bawana','2017-05-26 21:09:52','2017-05-26 21:09:52'),(134,9,NULL,'Connaught Place','2017-05-26 21:09:52','2017-05-26 21:09:52'),(135,9,NULL,'Delhi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(136,9,NULL,'Kalkaji Devi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(137,9,NULL,'Narela','2017-05-26 21:09:52','2017-05-26 21:09:52'),(138,9,NULL,'New Delhi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(139,9,NULL,'Shahdara','2017-05-26 21:09:52','2017-05-26 21:09:52'),(140,10,NULL,'Amal','2017-05-26 21:09:52','2017-05-26 21:09:52'),(141,10,NULL,'Silvassa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(142,11,NULL,'Aldona','2017-05-26 21:09:52','2017-05-26 21:09:52'),(143,11,NULL,'Arpora','2017-05-26 21:09:52','2017-05-26 21:09:52'),(144,11,NULL,'Assagao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(145,11,NULL,'Bambolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(146,11,NULL,'Betalbatim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(147,11,NULL,'Betim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(148,11,NULL,'Calangute','2017-05-26 21:09:52','2017-05-26 21:09:52'),(149,11,NULL,'Candolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(150,11,NULL,'Caranzalem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(151,11,NULL,'Chicalim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(152,11,NULL,'Cuncolim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(153,11,NULL,'Curchorem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(154,11,NULL,'Dicholi','2017-05-26 21:09:52','2017-05-26 21:09:52'),(155,11,NULL,'Dona Paula','2017-05-26 21:09:52','2017-05-26 21:09:52'),(156,11,NULL,'Goa','2017-05-26 21:09:52','2017-05-26 21:09:52'),(157,11,NULL,'Madgaon','2017-05-26 21:09:52','2017-05-26 21:09:52'),(158,11,NULL,'Marmagao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(159,11,NULL,'Navelim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(160,11,NULL,'Panjim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(161,11,NULL,'Parra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(162,11,NULL,'Ponda','2017-05-26 21:09:52','2017-05-26 21:09:52'),(163,11,NULL,'Quepem','2017-05-26 21:09:52','2017-05-26 21:09:52'),(164,11,NULL,'Saligao','2017-05-26 21:09:52','2017-05-26 21:09:52'),(165,11,NULL,'Sanquelim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(166,11,NULL,'Solim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(167,11,NULL,'Vainguinim','2017-05-26 21:09:52','2017-05-26 21:09:52'),(168,11,NULL,'Vasco','2017-05-26 21:09:52','2017-05-26 21:09:52'),(169,11,NULL,'Verna','2017-05-26 21:09:52','2017-05-26 21:09:52'),(170,12,NULL,'Ahmedabad','2017-05-26 21:09:52','2017-05-26 21:09:52'),(171,12,NULL,'Amreli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(172,12,NULL,'Amroli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(173,12,NULL,'Anand','2017-05-26 21:09:52','2017-05-26 21:09:52'),(174,12,NULL,'Ankleshwar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(175,12,NULL,'Antapur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(176,12,NULL,'Bardoli','2017-05-26 21:09:52','2017-05-26 21:09:52'),(177,12,NULL,'Basu','2017-05-26 21:09:52','2017-05-26 21:09:52'),(178,12,NULL,'Bhadath','2017-05-26 21:09:52','2017-05-26 21:09:52'),(179,12,NULL,'Bharuch','2017-05-26 21:09:52','2017-05-26 21:09:52'),(180,12,NULL,'Bhavnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(181,12,NULL,'Bhuj','2017-05-26 21:09:52','2017-05-26 21:09:52'),(182,12,NULL,'Bilimora','2017-05-26 21:09:52','2017-05-26 21:09:52'),(183,12,NULL,'Chhota Udepur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(184,12,NULL,'Dahod','2017-05-26 21:09:52','2017-05-26 21:09:52'),(185,12,NULL,'Dewan','2017-05-26 21:09:52','2017-05-26 21:09:52'),(186,12,NULL,'Dhansura','2017-05-26 21:09:52','2017-05-26 21:09:52'),(187,12,NULL,'Dhrol','2017-05-26 21:09:52','2017-05-26 21:09:52'),(188,12,NULL,'Dwarka','2017-05-26 21:09:52','2017-05-26 21:09:52'),(189,12,NULL,'Gandhidham','2017-05-26 21:09:52','2017-05-26 21:09:52'),(190,12,NULL,'Gandhinagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(191,12,NULL,'Ghana','2017-05-26 21:09:52','2017-05-26 21:09:52'),(192,12,NULL,'Godhra','2017-05-26 21:09:52','2017-05-26 21:09:52'),(193,12,NULL,'Himatnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(194,12,NULL,'Jalalpur','2017-05-26 21:09:52','2017-05-26 21:09:52'),(195,12,NULL,'Jamnagar','2017-05-26 21:09:52','2017-05-26 21:09:52'),(196,12,NULL,'Junagadh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(197,12,NULL,'Kalol','2017-05-26 21:09:53','2017-05-26 21:09:53'),(198,12,NULL,'Karamsad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(199,12,NULL,'Keshod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(200,12,NULL,'Khambhat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(201,12,NULL,'Kheda','2017-05-26 21:09:53','2017-05-26 21:09:53'),(202,12,NULL,'Khergam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(203,12,NULL,'Kosamba','2017-05-26 21:09:53','2017-05-26 21:09:53'),(204,12,NULL,'Mahesana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(205,12,NULL,'Malpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(206,12,NULL,'Mandvi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(207,12,NULL,'Matar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(208,12,NULL,'Mithapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(209,12,NULL,'Modasa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(210,12,NULL,'Morvi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(211,12,NULL,'Mundra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(212,12,NULL,'Nadiad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(213,12,NULL,'Nagwa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(214,12,NULL,'Navsari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(215,12,NULL,'Patan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(216,12,NULL,'Petlad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(217,12,NULL,'Porbandar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(218,12,NULL,'Rajkot','2017-05-26 21:09:53','2017-05-26 21:09:53'),(219,12,NULL,'Rander','2017-05-26 21:09:53','2017-05-26 21:09:53'),(220,12,NULL,'Rawal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(221,12,NULL,'Sachin','2017-05-26 21:09:53','2017-05-26 21:09:53'),(222,12,NULL,'Sami','2017-05-26 21:09:53','2017-05-26 21:09:53'),(223,12,NULL,'Sanand','2017-05-26 21:09:53','2017-05-26 21:09:53'),(224,12,NULL,'Somnath','2017-05-26 21:09:53','2017-05-26 21:09:53'),(225,12,NULL,'Surendranagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(226,12,NULL,'Thasra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(227,12,NULL,'Vadodara','2017-05-26 21:09:53','2017-05-26 21:09:53'),(228,12,NULL,'Vadodra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(229,12,NULL,'Valsad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(230,12,NULL,'Vapi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(231,12,NULL,'Vijapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(232,12,NULL,'Visnagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(233,13,NULL,'Bhawan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(234,13,NULL,'Bilaspur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(235,13,NULL,'Chamba','2017-05-26 21:09:53','2017-05-26 21:09:53'),(236,13,NULL,'Dharamsala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(237,13,NULL,'Dharmpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(238,13,NULL,'Hamirpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(239,13,NULL,'Hari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(240,13,NULL,'Kalka','2017-05-26 21:09:53','2017-05-26 21:09:53'),(241,13,NULL,'Kangra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(242,13,NULL,'Kumar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(243,13,NULL,'Manali','2017-05-26 21:09:53','2017-05-26 21:09:53'),(244,13,NULL,'Mandi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(245,13,NULL,'Mani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(246,13,NULL,'Mashobra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(247,13,NULL,'Nalagarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(248,13,NULL,'Nehra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(249,13,NULL,'Nurpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(250,13,NULL,'Palampur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(251,13,NULL,'Paonta Sahib','2017-05-26 21:09:53','2017-05-26 21:09:53'),(252,13,NULL,'Shimla','2017-05-26 21:09:53','2017-05-26 21:09:53'),(253,13,NULL,'Solan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(254,14,NULL,'Ambala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(255,14,NULL,'Aurangabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(256,14,NULL,'Bahadurgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(257,14,NULL,'Ballabgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(258,14,NULL,'Bhiwani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(259,14,NULL,'Budha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(260,14,NULL,'Chhachhrauli','2017-05-26 21:09:53','2017-05-26 21:09:53'),(261,14,NULL,'Faridabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(262,14,NULL,'Fatehabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(263,14,NULL,'Ganga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(264,14,NULL,'Gohana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(265,14,NULL,'Gurgaon','2017-05-26 21:09:53','2017-05-26 21:09:53'),(266,14,NULL,'Hansi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(267,14,NULL,'Haryana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(268,14,NULL,'Hisar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(269,14,NULL,'Indraprast','2017-05-26 21:09:53','2017-05-26 21:09:53'),(270,14,NULL,'Jhajjar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(271,14,NULL,'Jind','2017-05-26 21:09:53','2017-05-26 21:09:53'),(272,14,NULL,'Kaithal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(273,14,NULL,'Kalra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(274,14,NULL,'Karnal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(275,14,NULL,'Kaul','2017-05-26 21:09:53','2017-05-26 21:09:53'),(276,14,NULL,'Kotian','2017-05-26 21:09:53','2017-05-26 21:09:53'),(277,14,NULL,'Ladwa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(278,14,NULL,'Narnaul','2017-05-26 21:09:53','2017-05-26 21:09:53'),(279,14,NULL,'Nilokheri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(280,14,NULL,'Odhan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(281,14,NULL,'Palwal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(282,14,NULL,'Panipat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(283,14,NULL,'Pehowa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(284,14,NULL,'Rewari','2017-05-26 21:09:53','2017-05-26 21:09:53'),(285,14,NULL,'Rohtak','2017-05-26 21:09:53','2017-05-26 21:09:53'),(286,14,NULL,'Saha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(287,14,NULL,'Shahabad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(288,14,NULL,'Sirsa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(289,14,NULL,'Sodhi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(290,14,NULL,'Sonipat','2017-05-26 21:09:53','2017-05-26 21:09:53'),(291,14,NULL,'Tohana','2017-05-26 21:09:53','2017-05-26 21:09:53'),(292,14,NULL,'Yamunanagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(293,15,NULL,'Bokaro','2017-05-26 21:09:53','2017-05-26 21:09:53'),(294,15,NULL,'Dhanbad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(295,15,NULL,'Dumka','2017-05-26 21:09:53','2017-05-26 21:09:53'),(296,15,NULL,'Hazaribagh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(297,15,NULL,'Jamshedpur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(298,15,NULL,'Mahulia','2017-05-26 21:09:53','2017-05-26 21:09:53'),(299,15,NULL,'Ramgarh','2017-05-26 21:09:53','2017-05-26 21:09:53'),(300,15,NULL,'Ranchi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(301,16,NULL,'Anantnag','2017-05-26 21:09:53','2017-05-26 21:09:53'),(302,16,NULL,'Arch','2017-05-26 21:09:53','2017-05-26 21:09:53'),(303,16,NULL,'Bala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(304,16,NULL,'Bawan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(305,16,NULL,'Gold','2017-05-26 21:09:53','2017-05-26 21:09:53'),(306,16,NULL,'Jammu','2017-05-26 21:09:53','2017-05-26 21:09:53'),(307,16,NULL,'Kargil','2017-05-26 21:09:53','2017-05-26 21:09:53'),(308,16,NULL,'Kathua','2017-05-26 21:09:53','2017-05-26 21:09:53'),(309,16,NULL,'Katra','2017-05-26 21:09:53','2017-05-26 21:09:53'),(310,16,NULL,'Kundan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(311,16,NULL,'Markal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(312,16,NULL,'Nila','2017-05-26 21:09:53','2017-05-26 21:09:53'),(313,16,NULL,'Pahalgam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(314,16,NULL,'Patel','2017-05-26 21:09:53','2017-05-26 21:09:53'),(315,16,NULL,'Raju','2017-05-26 21:09:53','2017-05-26 21:09:53'),(316,16,NULL,'Ranjan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(317,16,NULL,'Ring','2017-05-26 21:09:53','2017-05-26 21:09:53'),(318,16,NULL,'Srinagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(319,16,NULL,'Suman','2017-05-26 21:09:53','2017-05-26 21:09:53'),(320,17,NULL,'Bagalkot','2017-05-26 21:09:53','2017-05-26 21:09:53'),(321,17,NULL,'Bangalore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(322,17,NULL,'Belgaum','2017-05-26 21:09:53','2017-05-26 21:09:53'),(323,17,NULL,'Bellare','2017-05-26 21:09:53','2017-05-26 21:09:53'),(324,17,NULL,'Bellary','2017-05-26 21:09:53','2017-05-26 21:09:53'),(325,17,NULL,'Bhadravati','2017-05-26 21:09:53','2017-05-26 21:09:53'),(326,17,NULL,'Bhatkal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(327,17,NULL,'Bidar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(328,17,NULL,'Bijapur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(329,17,NULL,'Channapatna','2017-05-26 21:09:53','2017-05-26 21:09:53'),(330,17,NULL,'Chikmagalūr','2017-05-26 21:09:53','2017-05-26 21:09:53'),(331,17,NULL,'Chikodi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(332,17,NULL,'Chintamani','2017-05-26 21:09:53','2017-05-26 21:09:53'),(333,17,NULL,'Chitradurga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(334,17,NULL,'Davangere','2017-05-26 21:09:53','2017-05-26 21:09:53'),(335,17,NULL,'Dharwad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(336,17,NULL,'Gadag','2017-05-26 21:09:53','2017-05-26 21:09:53'),(337,17,NULL,'Gulbarga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(338,17,NULL,'Hadadi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(339,17,NULL,'Hassan','2017-05-26 21:09:53','2017-05-26 21:09:53'),(340,17,NULL,'Haveri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(341,17,NULL,'Hira','2017-05-26 21:09:53','2017-05-26 21:09:53'),(342,17,NULL,'Hiriyur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(343,17,NULL,'Honavar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(344,17,NULL,'Hospet','2017-05-26 21:09:53','2017-05-26 21:09:53'),(345,17,NULL,'Hubli','2017-05-26 21:09:53','2017-05-26 21:09:53'),(346,17,NULL,'Karwar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(347,17,NULL,'Kolar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(348,17,NULL,'Kollegal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(349,17,NULL,'Koppal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(350,17,NULL,'Kushalnagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(351,17,NULL,'Madikeri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(352,17,NULL,'Mandya','2017-05-26 21:09:53','2017-05-26 21:09:53'),(353,17,NULL,'Mangalore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(354,17,NULL,'Manipala','2017-05-26 21:09:53','2017-05-26 21:09:53'),(355,17,NULL,'Mundgod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(356,17,NULL,'Mysore','2017-05-26 21:09:53','2017-05-26 21:09:53'),(357,17,NULL,'Nandi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(358,17,NULL,'Puttur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(359,17,NULL,'Raichur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(360,17,NULL,'Ramanagaram','2017-05-26 21:09:53','2017-05-26 21:09:53'),(361,17,NULL,'Sagar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(362,17,NULL,'Sandur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(363,17,NULL,'Sangam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(364,17,NULL,'Shanti Grama','2017-05-26 21:09:53','2017-05-26 21:09:53'),(365,17,NULL,'Shimoga','2017-05-26 21:09:53','2017-05-26 21:09:53'),(366,17,NULL,'Sirsi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(367,17,NULL,'Siruguppa','2017-05-26 21:09:53','2017-05-26 21:09:53'),(368,17,NULL,'Someshwar','2017-05-26 21:09:53','2017-05-26 21:09:53'),(369,17,NULL,'Tiptur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(370,17,NULL,'Tumkūr','2017-05-26 21:09:53','2017-05-26 21:09:53'),(371,17,NULL,'Udupi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(372,17,NULL,'Yadgir','2017-05-26 21:09:53','2017-05-26 21:09:53'),(373,18,NULL,'Alanallur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(374,18,NULL,'Alappuzha','2017-05-26 21:09:53','2017-05-26 21:09:53'),(375,18,NULL,'Aluva','2017-05-26 21:09:53','2017-05-26 21:09:53'),(376,18,NULL,'Anchal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(377,18,NULL,'Angadipuram','2017-05-26 21:09:53','2017-05-26 21:09:53'),(378,18,NULL,'Aranmula','2017-05-26 21:09:53','2017-05-26 21:09:53'),(379,18,NULL,'Attingal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(380,18,NULL,'Changanacheri','2017-05-26 21:09:53','2017-05-26 21:09:53'),(381,18,NULL,'Chengannur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(382,18,NULL,'Chittur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(383,18,NULL,'Edavanna','2017-05-26 21:09:53','2017-05-26 21:09:53'),(384,18,NULL,'Ernakulam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(385,18,NULL,'Guruvayur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(386,18,NULL,'Idukki','2017-05-26 21:09:53','2017-05-26 21:09:53'),(387,18,NULL,'Irinjalakuda','2017-05-26 21:09:53','2017-05-26 21:09:53'),(388,18,NULL,'Kaladi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(389,18,NULL,'Kalpetta','2017-05-26 21:09:53','2017-05-26 21:09:53'),(390,18,NULL,'Kanhangad','2017-05-26 21:09:53','2017-05-26 21:09:53'),(391,18,NULL,'Kannur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(392,18,NULL,'Kasaragod','2017-05-26 21:09:53','2017-05-26 21:09:53'),(393,18,NULL,'Kayamkulam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(394,18,NULL,'Kochi','2017-05-26 21:09:53','2017-05-26 21:09:53'),(395,18,NULL,'Kodungallur','2017-05-26 21:09:53','2017-05-26 21:09:53'),(396,18,NULL,'Kollam','2017-05-26 21:09:53','2017-05-26 21:09:53'),(397,18,NULL,'Koni','2017-05-26 21:09:53','2017-05-26 21:09:53'),(398,18,NULL,'Kottakkal','2017-05-26 21:09:53','2017-05-26 21:09:53'),(399,18,NULL,'Kottarakara','2017-05-26 21:09:53','2017-05-26 21:09:53'),(400,18,NULL,'Kottayam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(401,18,NULL,'Kozhikode','2017-05-26 21:09:54','2017-05-26 21:09:54'),(402,18,NULL,'Malappuram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(403,18,NULL,'Manjeri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(404,18,NULL,'Mattanur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(405,18,NULL,'Mavelikara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(406,18,NULL,'Nilambur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(407,18,NULL,'Ottappalam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(408,18,NULL,'Palakkad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(409,18,NULL,'Palayam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(410,18,NULL,'Parappanangadi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(411,18,NULL,'Paravur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(412,18,NULL,'Pathanamthitta','2017-05-26 21:09:54','2017-05-26 21:09:54'),(413,18,NULL,'Pattambi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(414,18,NULL,'Payyanur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(415,18,NULL,'Ponnani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(416,18,NULL,'Punalur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(417,18,NULL,'Shoranur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(418,18,NULL,'Sultans Battery','2017-05-26 21:09:54','2017-05-26 21:09:54'),(419,18,NULL,'Thalassery','2017-05-26 21:09:54','2017-05-26 21:09:54'),(420,18,NULL,'Thiruvananthapuram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(421,18,NULL,'Thrissur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(422,18,NULL,'Tirur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(423,18,NULL,'Tiruvalla','2017-05-26 21:09:54','2017-05-26 21:09:54'),(424,18,NULL,'Vaikam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(425,18,NULL,'Vazhakulam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(426,19,NULL,'Kavaratti','2017-05-26 21:09:54','2017-05-26 21:09:54'),(427,20,NULL,'Abdul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(428,20,NULL,'Ahmednagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(429,20,NULL,'Akola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(430,20,NULL,'Alibag','2017-05-26 21:09:54','2017-05-26 21:09:54'),(431,20,NULL,'Ambad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(432,20,NULL,'Ambarnath','2017-05-26 21:09:54','2017-05-26 21:09:54'),(433,20,NULL,'Amravati','2017-05-26 21:09:54','2017-05-26 21:09:54'),(434,20,NULL,'Andheri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(435,20,NULL,'Arvi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(436,20,NULL,'Aundh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(437,20,NULL,'Aurangabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(438,20,NULL,'Badlapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(439,20,NULL,'Bandra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(440,20,NULL,'Baramati','2017-05-26 21:09:54','2017-05-26 21:09:54'),(441,20,NULL,'Belapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(442,20,NULL,'Bhandup','2017-05-26 21:09:54','2017-05-26 21:09:54'),(443,20,NULL,'Bhiwandi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(444,20,NULL,'Bhusawal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(445,20,NULL,'Boisar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(446,20,NULL,'Chakan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(447,20,NULL,'Chalisgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(448,20,NULL,'Chandrapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(449,20,NULL,'Charan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(450,20,NULL,'Chinchvad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(451,20,NULL,'Chiplun','2017-05-26 21:09:54','2017-05-26 21:09:54'),(452,20,NULL,'Chopda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(453,20,NULL,'Colaba','2017-05-26 21:09:54','2017-05-26 21:09:54'),(454,20,NULL,'Dahanu','2017-05-26 21:09:54','2017-05-26 21:09:54'),(455,20,NULL,'Deolali','2017-05-26 21:09:54','2017-05-26 21:09:54'),(456,20,NULL,'Devgarh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(457,20,NULL,'Dharavi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(458,20,NULL,'Dhule','2017-05-26 21:09:54','2017-05-26 21:09:54'),(459,20,NULL,'Ellora Caves','2017-05-26 21:09:54','2017-05-26 21:09:54'),(460,20,NULL,'Gargoti','2017-05-26 21:09:54','2017-05-26 21:09:54'),(461,20,NULL,'Ghatkopar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(462,20,NULL,'Goregaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(463,20,NULL,'Hinganghat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(464,20,NULL,'Hingoli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(465,20,NULL,'Ichalkaranji','2017-05-26 21:09:54','2017-05-26 21:09:54'),(466,20,NULL,'Igatpuri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(467,20,NULL,'Jalgaon Jamod','2017-05-26 21:09:54','2017-05-26 21:09:54'),(468,20,NULL,'Jalna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(469,20,NULL,'Kagal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(470,20,NULL,'Kalam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(471,20,NULL,'Kalamboli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(472,20,NULL,'Kalyan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(473,20,NULL,'Kankauli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(474,20,NULL,'Karad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(475,20,NULL,'Karanja','2017-05-26 21:09:54','2017-05-26 21:09:54'),(476,20,NULL,'Karjat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(477,20,NULL,'Khalapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(478,20,NULL,'Khopoli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(479,20,NULL,'Kolhapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(480,20,NULL,'Latur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(481,20,NULL,'Mahad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(482,20,NULL,'Mahim','2017-05-26 21:09:54','2017-05-26 21:09:54'),(483,20,NULL,'Mangaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(484,20,NULL,'Manor','2017-05-26 21:09:54','2017-05-26 21:09:54'),(485,20,NULL,'Miraj','2017-05-26 21:09:54','2017-05-26 21:09:54'),(486,20,NULL,'Mumbai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(487,20,NULL,'Nadgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(488,20,NULL,'Nagpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(489,20,NULL,'Nanded','2017-05-26 21:09:54','2017-05-26 21:09:54'),(490,20,NULL,'Nandurbar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(491,20,NULL,'Narayangaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(492,20,NULL,'Nashik','2017-05-26 21:09:54','2017-05-26 21:09:54'),(493,20,NULL,'Neral','2017-05-26 21:09:54','2017-05-26 21:09:54'),(494,20,NULL,'Neri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(495,20,NULL,'Osmanabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(496,20,NULL,'Palghar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(497,20,NULL,'Palus','2017-05-26 21:09:54','2017-05-26 21:09:54'),(498,20,NULL,'Panchgani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(499,20,NULL,'Pandharpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(500,20,NULL,'Panvel','2017-05-26 21:09:54','2017-05-26 21:09:54'),(501,20,NULL,'Parbhani','2017-05-26 21:09:54','2017-05-26 21:09:54'),(502,20,NULL,'Parel','2017-05-26 21:09:54','2017-05-26 21:09:54'),(503,20,NULL,'Pimpri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(504,20,NULL,'Pune','2017-05-26 21:09:54','2017-05-26 21:09:54'),(505,20,NULL,'Puras','2017-05-26 21:09:54','2017-05-26 21:09:54'),(506,20,NULL,'Ratnagiri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(507,20,NULL,'Sakri','2017-05-26 21:09:54','2017-05-26 21:09:54'),(508,20,NULL,'Sangamner','2017-05-26 21:09:54','2017-05-26 21:09:54'),(509,20,NULL,'Sangli','2017-05-26 21:09:54','2017-05-26 21:09:54'),(510,20,NULL,'Sangola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(511,20,NULL,'Satara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(512,20,NULL,'Shahapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(513,20,NULL,'Shirgaon','2017-05-26 21:09:54','2017-05-26 21:09:54'),(514,20,NULL,'Shrigonda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(515,20,NULL,'Sinnar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(516,20,NULL,'Sion','2017-05-26 21:09:54','2017-05-26 21:09:54'),(517,20,NULL,'Solapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(518,20,NULL,'Sopara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(519,20,NULL,'Talegaon Dabhade','2017-05-26 21:09:54','2017-05-26 21:09:54'),(520,20,NULL,'Thane','2017-05-26 21:09:54','2017-05-26 21:09:54'),(521,20,NULL,'Trimbak','2017-05-26 21:09:54','2017-05-26 21:09:54'),(522,20,NULL,'Tuljapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(523,20,NULL,'Ulhasnagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(524,20,NULL,'Umred','2017-05-26 21:09:54','2017-05-26 21:09:54'),(525,20,NULL,'Vadner','2017-05-26 21:09:54','2017-05-26 21:09:54'),(526,20,NULL,'Vasai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(527,20,NULL,'Vashi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(528,20,NULL,'Virar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(529,20,NULL,'Wai','2017-05-26 21:09:54','2017-05-26 21:09:54'),(530,20,NULL,'Wardha','2017-05-26 21:09:54','2017-05-26 21:09:54'),(531,20,NULL,'Yavatmal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(532,20,NULL,'Yeola','2017-05-26 21:09:54','2017-05-26 21:09:54'),(533,21,NULL,'Nongpoh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(534,21,NULL,'Nongstoin','2017-05-26 21:09:54','2017-05-26 21:09:54'),(535,21,NULL,'Pala','2017-05-26 21:09:54','2017-05-26 21:09:54'),(536,21,NULL,'Shillong','2017-05-26 21:09:54','2017-05-26 21:09:54'),(537,21,NULL,'Tura','2017-05-26 21:09:54','2017-05-26 21:09:54'),(538,22,NULL,'Churachandpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(539,22,NULL,'Imphal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(540,23,NULL,'Amarkantak','2017-05-26 21:09:54','2017-05-26 21:09:54'),(541,23,NULL,'Ambah','2017-05-26 21:09:54','2017-05-26 21:09:54'),(542,23,NULL,'Anantpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(543,23,NULL,'Bagh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(544,23,NULL,'Balaghat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(545,23,NULL,'Baroda','2017-05-26 21:09:54','2017-05-26 21:09:54'),(546,23,NULL,'Berasia','2017-05-26 21:09:54','2017-05-26 21:09:54'),(547,23,NULL,'Betul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(548,23,NULL,'Bhagwan','2017-05-26 21:09:54','2017-05-26 21:09:54'),(549,23,NULL,'Bhartiya','2017-05-26 21:09:54','2017-05-26 21:09:54'),(550,23,NULL,'Bhopal','2017-05-26 21:09:54','2017-05-26 21:09:54'),(551,23,NULL,'Chakra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(552,23,NULL,'Chand','2017-05-26 21:09:54','2017-05-26 21:09:54'),(553,23,NULL,'Chhindwara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(554,23,NULL,'Chopra','2017-05-26 21:09:54','2017-05-26 21:09:54'),(555,23,NULL,'Damoh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(556,23,NULL,'Dewas','2017-05-26 21:09:54','2017-05-26 21:09:54'),(557,23,NULL,'Dhar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(558,23,NULL,'Dindori','2017-05-26 21:09:54','2017-05-26 21:09:54'),(559,23,NULL,'Gandhigram','2017-05-26 21:09:54','2017-05-26 21:09:54'),(560,23,NULL,'Ganpat','2017-05-26 21:09:54','2017-05-26 21:09:54'),(561,23,NULL,'Guna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(562,23,NULL,'Gwalior','2017-05-26 21:09:54','2017-05-26 21:09:54'),(563,23,NULL,'Hoshangabad','2017-05-26 21:09:54','2017-05-26 21:09:54'),(564,23,NULL,'Indore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(565,23,NULL,'Jabalpur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(566,23,NULL,'Kailaras','2017-05-26 21:09:54','2017-05-26 21:09:54'),(567,23,NULL,'Kamalpura','2017-05-26 21:09:54','2017-05-26 21:09:54'),(568,23,NULL,'Kataria','2017-05-26 21:09:54','2017-05-26 21:09:54'),(569,23,NULL,'Katni','2017-05-26 21:09:54','2017-05-26 21:09:54'),(570,23,NULL,'Khajuraho Group of Monuments','2017-05-26 21:09:54','2017-05-26 21:09:54'),(571,23,NULL,'Khargone','2017-05-26 21:09:54','2017-05-26 21:09:54'),(572,23,NULL,'Mandla','2017-05-26 21:09:54','2017-05-26 21:09:54'),(573,23,NULL,'Mandsaur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(574,23,NULL,'Mhow','2017-05-26 21:09:54','2017-05-26 21:09:54'),(575,23,NULL,'Morena','2017-05-26 21:09:54','2017-05-26 21:09:54'),(576,23,NULL,'Nadia','2017-05-26 21:09:54','2017-05-26 21:09:54'),(577,23,NULL,'Nagara','2017-05-26 21:09:54','2017-05-26 21:09:54'),(578,23,NULL,'Pachmarhi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(579,23,NULL,'Raipur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(580,23,NULL,'Rajapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(581,23,NULL,'Rama','2017-05-26 21:09:54','2017-05-26 21:09:54'),(582,23,NULL,'Ratlam','2017-05-26 21:09:54','2017-05-26 21:09:54'),(583,23,NULL,'Rewa','2017-05-26 21:09:54','2017-05-26 21:09:54'),(584,23,NULL,'Sagar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(585,23,NULL,'Sarangi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(586,23,NULL,'Satna','2017-05-26 21:09:54','2017-05-26 21:09:54'),(587,23,NULL,'Sehore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(588,23,NULL,'Sendhwa','2017-05-26 21:09:54','2017-05-26 21:09:54'),(589,23,NULL,'Shahdol','2017-05-26 21:09:54','2017-05-26 21:09:54'),(590,23,NULL,'Sidhi','2017-05-26 21:09:54','2017-05-26 21:09:54'),(591,23,NULL,'Soni','2017-05-26 21:09:54','2017-05-26 21:09:54'),(592,23,NULL,'Tala','2017-05-26 21:09:54','2017-05-26 21:09:54'),(593,23,NULL,'Ujjain','2017-05-26 21:09:54','2017-05-26 21:09:54'),(594,23,NULL,'Vidisha','2017-05-26 21:09:54','2017-05-26 21:09:54'),(595,24,NULL,'Aizawl','2017-05-26 21:09:54','2017-05-26 21:09:54'),(596,25,NULL,'Chen','2017-05-26 21:09:54','2017-05-26 21:09:54'),(597,25,NULL,'Dimapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(598,25,NULL,'Kohima','2017-05-26 21:09:54','2017-05-26 21:09:54'),(599,26,NULL,'Angul','2017-05-26 21:09:54','2017-05-26 21:09:54'),(600,26,NULL,'Balangir','2017-05-26 21:09:54','2017-05-26 21:09:54'),(601,26,NULL,'Balasore','2017-05-26 21:09:54','2017-05-26 21:09:54'),(602,26,NULL,'Bargarh','2017-05-26 21:09:54','2017-05-26 21:09:54'),(603,26,NULL,'Barpali','2017-05-26 21:09:54','2017-05-26 21:09:54'),(604,26,NULL,'Bhubaneswar','2017-05-26 21:09:54','2017-05-26 21:09:54'),(605,26,NULL,'Brahmapur','2017-05-26 21:09:54','2017-05-26 21:09:54'),(606,26,NULL,'Cuttack','2017-05-26 21:09:55','2017-05-26 21:09:55'),(607,26,NULL,'Dhenkanal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(608,26,NULL,'Jajpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(609,26,NULL,'Jatani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(610,26,NULL,'Jaypur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(611,26,NULL,'Jharsuguda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(612,26,NULL,'Kalinga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(613,26,NULL,'Khurda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(614,26,NULL,'Koraput','2017-05-26 21:09:55','2017-05-26 21:09:55'),(615,26,NULL,'Nayagarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(616,26,NULL,'Puri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(617,26,NULL,'Raurkela','2017-05-26 21:09:55','2017-05-26 21:09:55'),(618,26,NULL,'Rayagada','2017-05-26 21:09:55','2017-05-26 21:09:55'),(619,26,NULL,'Sambalpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(620,26,NULL,'Sundargarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(621,26,NULL,'Talcher','2017-05-26 21:09:55','2017-05-26 21:09:55'),(622,26,NULL,'Udaigiri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(623,27,NULL,'Amritsar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(624,27,NULL,'Banga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(625,27,NULL,'Barnala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(626,27,NULL,'Batala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(627,27,NULL,'Bhatinda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(628,27,NULL,'Dasua','2017-05-26 21:09:55','2017-05-26 21:09:55'),(629,27,NULL,'Dhariwal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(630,27,NULL,'Dhuri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(631,27,NULL,'Dinanagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(632,27,NULL,'Faridkot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(633,27,NULL,'Firozpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(634,27,NULL,'Garhshankar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(635,27,NULL,'Gurdaspur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(636,27,NULL,'Hoshiarpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(637,27,NULL,'Jagraon','2017-05-26 21:09:55','2017-05-26 21:09:55'),(638,27,NULL,'Jalalabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(639,27,NULL,'Jalandhar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(640,27,NULL,'Kapurthala Town','2017-05-26 21:09:55','2017-05-26 21:09:55'),(641,27,NULL,'Khanna','2017-05-26 21:09:55','2017-05-26 21:09:55'),(642,27,NULL,'Kharar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(643,27,NULL,'Kot Isa Khan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(644,27,NULL,'Kurali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(645,27,NULL,'Ludhiana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(646,27,NULL,'Machhiwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(647,27,NULL,'Maharaj','2017-05-26 21:09:55','2017-05-26 21:09:55'),(648,27,NULL,'Mansa','2017-05-26 21:09:55','2017-05-26 21:09:55'),(649,27,NULL,'Moga','2017-05-26 21:09:55','2017-05-26 21:09:55'),(650,27,NULL,'Mohali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(651,27,NULL,'Morinda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(652,27,NULL,'Mukerian','2017-05-26 21:09:55','2017-05-26 21:09:55'),(653,27,NULL,'Muktsar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(654,27,NULL,'Nabha','2017-05-26 21:09:55','2017-05-26 21:09:55'),(655,27,NULL,'Pathankot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(656,27,NULL,'Patiala','2017-05-26 21:09:55','2017-05-26 21:09:55'),(657,27,NULL,'Phagwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(658,27,NULL,'Rajpura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(659,27,NULL,'Rupnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(660,27,NULL,'Sangrur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(661,27,NULL,'Shahkot','2017-05-26 21:09:55','2017-05-26 21:09:55'),(662,27,NULL,'Sirhind','2017-05-26 21:09:55','2017-05-26 21:09:55'),(663,27,NULL,'Sunam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(664,27,NULL,'Talwandi Sabo','2017-05-26 21:09:55','2017-05-26 21:09:55'),(665,27,NULL,'Tarn Taran','2017-05-26 21:09:55','2017-05-26 21:09:55'),(666,28,NULL,'Karaikal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(667,28,NULL,'Puducherry','2017-05-26 21:09:55','2017-05-26 21:09:55'),(668,29,NULL,'Ajmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(669,29,NULL,'Alwar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(670,29,NULL,'Amer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(671,29,NULL,'Amet','2017-05-26 21:09:55','2017-05-26 21:09:55'),(672,29,NULL,'Balana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(673,29,NULL,'Bali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(674,29,NULL,'Banswara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(675,29,NULL,'Barmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(676,29,NULL,'Beawar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(677,29,NULL,'Bharatpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(678,29,NULL,'Bhilwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(679,29,NULL,'Bikaner','2017-05-26 21:09:55','2017-05-26 21:09:55'),(680,29,NULL,'Binavas','2017-05-26 21:09:55','2017-05-26 21:09:55'),(681,29,NULL,'Bundi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(682,29,NULL,'Charu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(683,29,NULL,'Chetan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(684,29,NULL,'Chhabra','2017-05-26 21:09:55','2017-05-26 21:09:55'),(685,29,NULL,'Dipas','2017-05-26 21:09:55','2017-05-26 21:09:55'),(686,29,NULL,'Ganganagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(687,29,NULL,'Gangapur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(688,29,NULL,'Gangrar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(689,29,NULL,'Jaipur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(690,29,NULL,'Jaisalmer','2017-05-26 21:09:55','2017-05-26 21:09:55'),(691,29,NULL,'Jhalawar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(692,29,NULL,'Jhunjhunun','2017-05-26 21:09:55','2017-05-26 21:09:55'),(693,29,NULL,'Jodhpur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(694,29,NULL,'Kalan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(695,29,NULL,'Kanakpura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(696,29,NULL,'Khan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(697,29,NULL,'Khinwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(698,29,NULL,'Kishangarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(699,29,NULL,'Kolayat','2017-05-26 21:09:55','2017-05-26 21:09:55'),(700,29,NULL,'Kota','2017-05-26 21:09:55','2017-05-26 21:09:55'),(701,29,NULL,'Lamba Harisingh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(702,29,NULL,'Mahajan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(703,29,NULL,'Mahatma','2017-05-26 21:09:55','2017-05-26 21:09:55'),(704,29,NULL,'Mandal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(705,29,NULL,'Manna','2017-05-26 21:09:55','2017-05-26 21:09:55'),(706,29,NULL,'Mount Abu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(707,29,NULL,'Nagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(708,29,NULL,'Nagaur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(709,29,NULL,'Nanda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(710,29,NULL,'Naraina','2017-05-26 21:09:55','2017-05-26 21:09:55'),(711,29,NULL,'Nathdwara','2017-05-26 21:09:55','2017-05-26 21:09:55'),(712,29,NULL,'Pali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(713,29,NULL,'Pilani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(714,29,NULL,'Pitampura','2017-05-26 21:09:55','2017-05-26 21:09:55'),(715,29,NULL,'Pushkar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(716,29,NULL,'Rana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(717,29,NULL,'Roshan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(718,29,NULL,'Shiv','2017-05-26 21:09:55','2017-05-26 21:09:55'),(719,29,NULL,'Sikar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(720,29,NULL,'Sirohi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(721,29,NULL,'Sojat','2017-05-26 21:09:55','2017-05-26 21:09:55'),(722,29,NULL,'Sultan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(723,29,NULL,'Surana','2017-05-26 21:09:55','2017-05-26 21:09:55'),(724,29,NULL,'Suratgarh','2017-05-26 21:09:55','2017-05-26 21:09:55'),(725,29,NULL,'Thali','2017-05-26 21:09:55','2017-05-26 21:09:55'),(726,29,NULL,'Tonk','2017-05-26 21:09:55','2017-05-26 21:09:55'),(727,29,NULL,'Udaipur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(728,30,NULL,'Gangtok','2017-05-26 21:09:55','2017-05-26 21:09:55'),(729,30,NULL,'Manu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(730,30,NULL,'Singtam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(731,30,NULL,'Sirwani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(732,31,NULL,'Adilabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(733,31,NULL,'Balanagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(734,31,NULL,'Bhongir','2017-05-26 21:09:55','2017-05-26 21:09:55'),(735,31,NULL,'Bodhan','2017-05-26 21:09:55','2017-05-26 21:09:55'),(736,31,NULL,'Gudur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(737,31,NULL,'Hyderabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(738,31,NULL,'Karimnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(739,31,NULL,'Khammam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(740,31,NULL,'Kottagudem','2017-05-26 21:09:55','2017-05-26 21:09:55'),(741,31,NULL,'Mancherial','2017-05-26 21:09:55','2017-05-26 21:09:55'),(742,31,NULL,'Medak','2017-05-26 21:09:55','2017-05-26 21:09:55'),(743,31,NULL,'Medchal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(744,31,NULL,'Nalgonda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(745,31,NULL,'Narsapur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(746,31,NULL,'Nizamabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(747,31,NULL,'Paloncha','2017-05-26 21:09:55','2017-05-26 21:09:55'),(748,31,NULL,'Patancheru','2017-05-26 21:09:55','2017-05-26 21:09:55'),(749,31,NULL,'Patelguda','2017-05-26 21:09:55','2017-05-26 21:09:55'),(750,31,NULL,'Pochampalli','2017-05-26 21:09:55','2017-05-26 21:09:55'),(751,31,NULL,'Secunderabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(752,31,NULL,'Shadnagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(753,31,NULL,'Suriapet','2017-05-26 21:09:55','2017-05-26 21:09:55'),(754,31,NULL,'Uppal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(755,31,NULL,'Vikarabad','2017-05-26 21:09:55','2017-05-26 21:09:55'),(756,31,NULL,'Warangal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(757,32,NULL,'Alangulam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(758,32,NULL,'Ambur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(759,32,NULL,'Annamalainagar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(760,32,NULL,'Arakkonam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(761,32,NULL,'Arani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(762,32,NULL,'Ariyalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(763,32,NULL,'Attur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(764,32,NULL,'Bodinayakkanur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(765,32,NULL,'Chennai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(766,32,NULL,'Cheyyar','2017-05-26 21:09:55','2017-05-26 21:09:55'),(767,32,NULL,'Chidambaram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(768,32,NULL,'Choolai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(769,32,NULL,'Coimbatore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(770,32,NULL,'Coonoor','2017-05-26 21:09:55','2017-05-26 21:09:55'),(771,32,NULL,'Cuddalore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(772,32,NULL,'Devipattinam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(773,32,NULL,'Dharapuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(774,32,NULL,'Dharmapuri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(775,32,NULL,'Dindigul','2017-05-26 21:09:55','2017-05-26 21:09:55'),(776,32,NULL,'Ekkattuthangal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(777,32,NULL,'Eral','2017-05-26 21:09:55','2017-05-26 21:09:55'),(778,32,NULL,'Erode','2017-05-26 21:09:55','2017-05-26 21:09:55'),(779,32,NULL,'Fort','2017-05-26 21:09:55','2017-05-26 21:09:55'),(780,32,NULL,'Gobichettipalayam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(781,32,NULL,'Guindy','2017-05-26 21:09:55','2017-05-26 21:09:55'),(782,32,NULL,'Hosur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(783,32,NULL,'Kalpakkam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(784,32,NULL,'Kanchipuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(785,32,NULL,'Kangayam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(786,32,NULL,'Kaniyambadi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(787,32,NULL,'Kanniyakumari','2017-05-26 21:09:55','2017-05-26 21:09:55'),(788,32,NULL,'Karaikudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(789,32,NULL,'Karamadai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(790,32,NULL,'Karur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(791,32,NULL,'Kodaikanal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(792,32,NULL,'Koothanallur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(793,32,NULL,'Kovilpatti','2017-05-26 21:09:55','2017-05-26 21:09:55'),(794,32,NULL,'Krishnagiri','2017-05-26 21:09:55','2017-05-26 21:09:55'),(795,32,NULL,'Kumbakonam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(796,32,NULL,'Kuzhithurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(797,32,NULL,'Lalgudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(798,32,NULL,'Madurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(799,32,NULL,'Madurantakam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(800,32,NULL,'Mahabalipuram','2017-05-26 21:09:55','2017-05-26 21:09:55'),(801,32,NULL,'Mannargudi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(802,32,NULL,'Mettur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(803,32,NULL,'Mylapore','2017-05-26 21:09:55','2017-05-26 21:09:55'),(804,32,NULL,'Nagapattinam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(805,32,NULL,'Nagercoil','2017-05-26 21:09:55','2017-05-26 21:09:55'),(806,32,NULL,'Namakkal','2017-05-26 21:09:55','2017-05-26 21:09:55'),(807,32,NULL,'Neyveli','2017-05-26 21:09:55','2017-05-26 21:09:55'),(808,32,NULL,'Omalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(809,32,NULL,'Ooty','2017-05-26 21:09:55','2017-05-26 21:09:55'),(810,32,NULL,'Palani','2017-05-26 21:09:55','2017-05-26 21:09:55'),(811,32,NULL,'Palladam','2017-05-26 21:09:55','2017-05-26 21:09:55'),(812,32,NULL,'Panruti','2017-05-26 21:09:55','2017-05-26 21:09:55'),(813,32,NULL,'Pattukkottai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(814,32,NULL,'Perambalur','2017-05-26 21:09:55','2017-05-26 21:09:55'),(815,32,NULL,'Peranampattu','2017-05-26 21:09:55','2017-05-26 21:09:55'),(816,32,NULL,'Perundurai','2017-05-26 21:09:55','2017-05-26 21:09:55'),(817,32,NULL,'Pollachi','2017-05-26 21:09:55','2017-05-26 21:09:55'),(818,32,NULL,'Ponneri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(819,32,NULL,'Pudukkottai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(820,32,NULL,'Puliyur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(821,32,NULL,'Rajapalaiyam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(822,32,NULL,'Ramanathapuram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(823,32,NULL,'Ranippettai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(824,32,NULL,'Salem','2017-05-26 21:09:56','2017-05-26 21:09:56'),(825,32,NULL,'Sattur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(826,32,NULL,'Sholavandan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(827,32,NULL,'Sirkazhi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(828,32,NULL,'Siruseri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(829,32,NULL,'Sivaganga','2017-05-26 21:09:56','2017-05-26 21:09:56'),(830,32,NULL,'Sivakasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(831,32,NULL,'Sriperumbudur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(832,32,NULL,'Srirangam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(833,32,NULL,'Srivilliputhur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(834,32,NULL,'Tambaram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(835,32,NULL,'Thanjavur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(836,32,NULL,'Thenkasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(837,32,NULL,'Thirumangalam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(838,32,NULL,'Thiruthani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(839,32,NULL,'Thiruvarur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(840,32,NULL,'Thoothukudi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(841,32,NULL,'Tindivanam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(842,32,NULL,'Tiruchchendur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(843,32,NULL,'Tiruchi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(844,32,NULL,'Tirunelveli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(845,32,NULL,'Tiruppur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(846,32,NULL,'Tiruvallur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(847,32,NULL,'Tiruvannamalai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(848,32,NULL,'Turaiyur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(849,32,NULL,'Vadamadurai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(850,32,NULL,'Vandalur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(851,32,NULL,'Vandavasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(852,32,NULL,'Vaniyambadi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(853,32,NULL,'Vellore','2017-05-26 21:09:56','2017-05-26 21:09:56'),(854,32,NULL,'Villupuram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(855,32,NULL,'Wellington','2017-05-26 21:09:56','2017-05-26 21:09:56'),(856,32,NULL,'Yercaud','2017-05-26 21:09:56','2017-05-26 21:09:56'),(857,33,NULL,'Agartala','2017-05-26 21:09:56','2017-05-26 21:09:56'),(858,33,NULL,'Kamalpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(859,34,NULL,'Adwani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(860,34,NULL,'Almora','2017-05-26 21:09:56','2017-05-26 21:09:56'),(861,34,NULL,'Dang','2017-05-26 21:09:56','2017-05-26 21:09:56'),(862,34,NULL,'Dangi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(863,34,NULL,'Dehradun','2017-05-26 21:09:56','2017-05-26 21:09:56'),(864,34,NULL,'Dhanaulti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(865,34,NULL,'Dogadda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(866,34,NULL,'Dwarahat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(867,34,NULL,'Haldwani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(868,34,NULL,'Haridwar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(869,34,NULL,'Jamal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(870,34,NULL,'Jaspur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(871,34,NULL,'Kashipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(872,34,NULL,'Lohaghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(873,34,NULL,'Mill','2017-05-26 21:09:56','2017-05-26 21:09:56'),(874,34,NULL,'Mussoorie','2017-05-26 21:09:56','2017-05-26 21:09:56'),(875,34,NULL,'Nagal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(876,34,NULL,'Naini','2017-05-26 21:09:56','2017-05-26 21:09:56'),(877,34,NULL,'Pantnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(878,34,NULL,'Pauri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(879,34,NULL,'Pithoragarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(880,34,NULL,'Ramnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(881,34,NULL,'Rishikesh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(882,34,NULL,'Roorkee','2017-05-26 21:09:56','2017-05-26 21:09:56'),(883,34,NULL,'Sidhpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(884,34,NULL,'Uttarkashi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(885,34,NULL,'Vikasnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(886,35,NULL,'Agra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(887,35,NULL,'Ajabpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(888,35,NULL,'Aligarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(889,35,NULL,'Allahabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(890,35,NULL,'Anandnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(891,35,NULL,'Arora','2017-05-26 21:09:56','2017-05-26 21:09:56'),(892,35,NULL,'Azamgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(893,35,NULL,'Bagpat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(894,35,NULL,'Balu','2017-05-26 21:09:56','2017-05-26 21:09:56'),(895,35,NULL,'Banda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(896,35,NULL,'Bank','2017-05-26 21:09:56','2017-05-26 21:09:56'),(897,35,NULL,'Bareilly','2017-05-26 21:09:56','2017-05-26 21:09:56'),(898,35,NULL,'Basti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(899,35,NULL,'Bela','2017-05-26 21:09:56','2017-05-26 21:09:56'),(900,35,NULL,'Bhadohi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(901,35,NULL,'Bichpuri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(902,35,NULL,'Budaun','2017-05-26 21:09:56','2017-05-26 21:09:56'),(903,35,NULL,'Bulandshahr','2017-05-26 21:09:56','2017-05-26 21:09:56'),(904,35,NULL,'Chandauli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(905,35,NULL,'Chandausi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(906,35,NULL,'Chitra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(907,35,NULL,'Dadri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(908,35,NULL,'Dasna','2017-05-26 21:09:56','2017-05-26 21:09:56'),(909,35,NULL,'Deoria','2017-05-26 21:09:56','2017-05-26 21:09:56'),(910,35,NULL,'Etawah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(911,35,NULL,'Faizabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(912,35,NULL,'Fatehgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(913,35,NULL,'Fatehpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(914,35,NULL,'Firozabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(915,35,NULL,'Ghaziabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(916,35,NULL,'Gonda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(917,35,NULL,'Gorakhpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(918,35,NULL,'Hamirpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(919,35,NULL,'Hapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(920,35,NULL,'Iglas','2017-05-26 21:09:56','2017-05-26 21:09:56'),(921,35,NULL,'Jalesar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(922,35,NULL,'Jaunpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(923,35,NULL,'Jhansi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(924,35,NULL,'Kaimganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(925,35,NULL,'Kanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(926,35,NULL,'Karari','2017-05-26 21:09:56','2017-05-26 21:09:56'),(927,35,NULL,'Kasganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(928,35,NULL,'Kasia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(929,35,NULL,'Khandar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(930,35,NULL,'Khatauli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(931,35,NULL,'Kheri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(932,35,NULL,'Khurja','2017-05-26 21:09:56','2017-05-26 21:09:56'),(933,35,NULL,'Kunwar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(934,35,NULL,'Lakhimpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(935,35,NULL,'Lucknow','2017-05-26 21:09:56','2017-05-26 21:09:56'),(936,35,NULL,'Madhoganj','2017-05-26 21:09:56','2017-05-26 21:09:56'),(937,35,NULL,'Mathan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(938,35,NULL,'Mathura','2017-05-26 21:09:56','2017-05-26 21:09:56'),(939,35,NULL,'Mawana','2017-05-26 21:09:56','2017-05-26 21:09:56'),(940,35,NULL,'Meerut','2017-05-26 21:09:56','2017-05-26 21:09:56'),(941,35,NULL,'Mehra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(942,35,NULL,'Mirza Murad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(943,35,NULL,'Mirzapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(944,35,NULL,'Mohan','2017-05-26 21:09:56','2017-05-26 21:09:56'),(945,35,NULL,'Moradabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(946,35,NULL,'Muzaffarnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(947,35,NULL,'Noida','2017-05-26 21:09:56','2017-05-26 21:09:56'),(948,35,NULL,'Orai','2017-05-26 21:09:56','2017-05-26 21:09:56'),(949,35,NULL,'Padrauna','2017-05-26 21:09:56','2017-05-26 21:09:56'),(950,35,NULL,'Phaphamau','2017-05-26 21:09:56','2017-05-26 21:09:56'),(951,35,NULL,'Pilkhuwa','2017-05-26 21:09:56','2017-05-26 21:09:56'),(952,35,NULL,'Potti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(953,35,NULL,'Rampur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(954,35,NULL,'Saharanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(955,35,NULL,'Sahibabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(956,35,NULL,'Shahjahanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(957,35,NULL,'Shamsabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(958,35,NULL,'Sikka','2017-05-26 21:09:56','2017-05-26 21:09:56'),(959,35,NULL,'Sitapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(960,35,NULL,'Sultanpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(961,35,NULL,'Tanda','2017-05-26 21:09:56','2017-05-26 21:09:56'),(962,35,NULL,'Teri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(963,35,NULL,'Tikamgarh','2017-05-26 21:09:56','2017-05-26 21:09:56'),(964,35,NULL,'Unnao','2017-05-26 21:09:56','2017-05-26 21:09:56'),(965,35,NULL,'Varanasi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(966,36,NULL,'Alipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(967,36,NULL,'Asansol','2017-05-26 21:09:56','2017-05-26 21:09:56'),(968,36,NULL,'Baharampur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(969,36,NULL,'Baidyabati','2017-05-26 21:09:56','2017-05-26 21:09:56'),(970,36,NULL,'Bali','2017-05-26 21:09:56','2017-05-26 21:09:56'),(971,36,NULL,'Balurghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(972,36,NULL,'Bangaon','2017-05-26 21:09:56','2017-05-26 21:09:56'),(973,36,NULL,'Bankura','2017-05-26 21:09:56','2017-05-26 21:09:56'),(974,36,NULL,'Barakpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(975,36,NULL,'Barddhaman','2017-05-26 21:09:56','2017-05-26 21:09:56'),(976,36,NULL,'Basirhat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(977,36,NULL,'Behala','2017-05-26 21:09:56','2017-05-26 21:09:56'),(978,36,NULL,'Belgharia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(979,36,NULL,'Binnaguri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(980,36,NULL,'Bishnupur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(981,36,NULL,'Bolpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(982,36,NULL,'Budbud','2017-05-26 21:09:56','2017-05-26 21:09:56'),(983,36,NULL,'Canning','2017-05-26 21:09:56','2017-05-26 21:09:56'),(984,36,NULL,'Chandannagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(985,36,NULL,'Dam Dam','2017-05-26 21:09:56','2017-05-26 21:09:56'),(986,36,NULL,'Darjeeling','2017-05-26 21:09:56','2017-05-26 21:09:56'),(987,36,NULL,'Durgapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(988,36,NULL,'Farakka','2017-05-26 21:09:56','2017-05-26 21:09:56'),(989,36,NULL,'Ghatal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(990,36,NULL,'Gujrat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(991,36,NULL,'Habra','2017-05-26 21:09:56','2017-05-26 21:09:56'),(992,36,NULL,'Haldia','2017-05-26 21:09:56','2017-05-26 21:09:56'),(993,36,NULL,'Haripur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(994,36,NULL,'Howrah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(995,36,NULL,'Hugli','2017-05-26 21:09:56','2017-05-26 21:09:56'),(996,36,NULL,'Jadabpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(997,36,NULL,'Jalpaiguri','2017-05-26 21:09:56','2017-05-26 21:09:56'),(998,36,NULL,'Jayanti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(999,36,NULL,'Jhargram','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1000,36,NULL,'Kakdwip','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1001,36,NULL,'Kalyani','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1002,36,NULL,'Kanchrapara','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1003,36,NULL,'Kandi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1004,36,NULL,'Karsiyang','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1005,36,NULL,'Katoya','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1006,36,NULL,'Kharagpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1007,36,NULL,'Koch Bihar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1008,36,NULL,'Kolkata','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1009,36,NULL,'Konnagar','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1010,36,NULL,'Kulti','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1011,36,NULL,'Liluah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1012,36,NULL,'Maldah','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1013,36,NULL,'Manipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1014,36,NULL,'Mayapur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1015,36,NULL,'Medinipur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1016,36,NULL,'Multi','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1017,36,NULL,'Murshidabad','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1018,36,NULL,'Nabadwip','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1019,36,NULL,'Panchal','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1020,36,NULL,'Puruliya','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1021,36,NULL,'Rajpur','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1022,36,NULL,'Ranaghat','2017-05-26 21:09:56','2017-05-26 21:09:56'),(1023,36,NULL,'Raniganj','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1024,36,NULL,'Rudrapur','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1025,36,NULL,'Rupnarayanpur','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1026,36,NULL,'Salt Lake City','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1027,36,NULL,'Saranga','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1028,36,NULL,'Serampore','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1029,36,NULL,'Shyamnagar','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1030,36,NULL,'Siliguri','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1031,36,NULL,'Siuri','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1032,23,NULL,'Shajapur','2017-05-26 21:09:57','2017-05-26 21:09:57'),(1033,20,'0257','Jalgaon','2017-08-11 12:12:07','2017-08-11 12:12:07'),(1034,23,'MP','Anuppur','2017-10-30 07:20:42','2017-10-30 07:20:42'),(1035,7,'CH','Baloda','2017-10-30 07:23:39','2017-10-30 07:23:39'),(1036,7,'','Baloda Bazar','2017-10-30 07:24:37','2017-10-30 07:24:37'),(1037,7,'','Bastar','2017-10-30 07:26:20','2017-10-30 07:26:20'),(1038,26,'','Bhadrak','2017-10-30 07:30:27','2017-10-30 07:30:27'),(1039,5,'','Bhojpur','2017-10-30 07:31:48','2017-10-30 07:31:48'),(1040,5,'','Buxar','2017-10-30 10:06:10','2017-10-30 10:06:10'),(1041,2,'','Chittor','2017-10-30 10:07:16','2017-10-30 10:07:16'),(1042,2,NULL,'Nellore','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1043,2,NULL,'Kadapa','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1044,2,NULL,'Visakhapatnam','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1045,2,NULL,'Chittor','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1046,2,NULL,'Kurnool','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1047,2,NULL,'West Godavari','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1048,2,NULL,'Kurnool','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1049,2,NULL,'Banka','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1050,2,NULL,'Nellore','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1051,5,NULL,'Mouger','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1052,5,NULL,'Mouger','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1053,5,NULL,'Buxar','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1054,5,NULL,'West Champaran','2017-11-01 12:03:33','2017-11-01 12:03:33'),(1055,5,NULL,'Bhojpur','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1056,7,NULL,'Raipur','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1057,7,NULL,'Rajnandgaon','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1058,7,NULL,'Durg','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1059,7,NULL,'Durg','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1060,7,NULL,'Baloda Bazar','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1061,7,NULL,NULL,'2017-11-01 12:03:34','2017-11-01 12:03:34'),(1062,7,NULL,NULL,'2017-11-01 12:03:34','2017-11-01 12:03:34'),(1063,7,NULL,'Durg','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1064,7,NULL,'kanker','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1065,7,NULL,'Rajnandgaon','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1066,7,NULL,'Bilaspur','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1067,7,NULL,'kanker','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1068,7,NULL,'Durga','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1069,7,NULL,'Durga','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1070,7,NULL,'Durga','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1071,7,NULL,'Bilaspur','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1072,7,NULL,'Dhamtari','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1073,7,NULL,'kanker','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1074,7,NULL,'kanker','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1075,7,NULL,'Dhamtari','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1076,7,NULL,'Bijapur','2017-11-01 12:03:34','2017-11-01 12:03:34'),(1077,7,NULL,'kanker','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1078,7,NULL,'Durga','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1079,7,NULL,'Baloda ','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1080,7,NULL,'Baloda ','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1081,7,NULL,'Mahasamund','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1082,7,NULL,'Rajnandgaon','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1083,7,NULL,'Durga','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1084,7,NULL,'Kanker','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1085,7,NULL,'kanker','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1086,7,NULL,'kanker','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1087,7,NULL,'Dhamtari','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1088,7,NULL,'kanker','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1089,7,NULL,'Bijapur','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1090,7,NULL,'Bastar','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1091,7,NULL,'Dantewada','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1092,23,NULL,'Balaghat','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1093,23,NULL,'Umaria','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1094,23,NULL,'Anuppur','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1095,23,NULL,'Lanji','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1096,23,NULL,'Balaghat','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1097,23,NULL,'Jabalpur','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1098,23,NULL,'Anuppur','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1099,20,NULL,'Pune','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1100,20,NULL,'Pune','2017-11-01 12:03:35','2017-11-01 12:03:35'),(1101,20,NULL,'Pune','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1102,20,NULL,'Pune','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1103,26,NULL,'Jagatsinghpur','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1104,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1105,26,NULL,'Gajapati','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1106,26,NULL,'Ganjam','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1107,26,NULL,'Balasore','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1108,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1109,26,NULL,'Balasore','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1110,26,NULL,'Bhadrak','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1111,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1112,26,NULL,'Balasore','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1113,26,NULL,'Jagatsinghpur','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1114,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1115,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1116,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1117,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1118,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1119,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1120,26,NULL,'Mayurbhanj','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1121,26,NULL,'Balasore','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1122,26,NULL,'Khurda','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1123,26,NULL,'Balasore','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1124,26,NULL,'Ganjam','2017-11-01 12:03:36','2017-11-01 12:03:36'),(1125,26,NULL,'Ganjam','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1126,26,NULL,'Mayurbhanj','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1127,26,NULL,'Balasore','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1128,26,NULL,'Balasore','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1129,26,NULL,'Dhenkanal','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1130,26,NULL,'Cuttack','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1131,26,NULL,'Ganjam','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1132,29,NULL,'Alwar','2017-11-01 12:03:37','2017-11-01 12:03:37'),(1133,31,NULL,'Mahaboob','2017-11-01 12:03:37','2017-11-01 12:03:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_details`
--

LOCK TABLES `due_details` WRITE;
/*!40000 ALTER TABLE `due_details` DISABLE KEYS */;
INSERT INTO `due_details` VALUES (1,NULL,1,1,NULL,1,'2017-12-30 08:29:38','2017-12-30 08:29:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_templates`
--

LOCK TABLES `due_templates` WRITE;
/*!40000 ALTER TABLE `due_templates` DISABLE KEYS */;
INSERT INTO `due_templates` VALUES (1,'CC1','Due Clearance',1,'2017-12-30 08:28:03','2017-12-30 08:28:03',NULL,NULL,NULL,NULL);
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
  `holiday_id` int(11) DEFAULT NULL,
  `employee_week_off_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_attendances_on_employee_id` (`employee_id`),
  KEY `index_employee_attendances_on_machine_attendance_id` (`machine_attendance_id`),
  KEY `index_employee_attendances_on_department_id` (`department_id`),
  KEY `index_employee_attendances_on_employee_leav_request_id` (`employee_leav_request_id`),
  KEY `index_employee_attendances_on_on_duty_request_id` (`on_duty_request_id`),
  KEY `index_employee_attendances_on_company_time_master_id` (`company_time_master_id`),
  KEY `index_employee_attendances_on_holiday_id` (`holiday_id`),
  KEY `index_employee_attendances_on_employee_week_off_id` (`employee_week_off_id`),
  CONSTRAINT `fk_rails_4ba11eda7e` FOREIGN KEY (`employee_week_off_id`) REFERENCES `employee_week_offs` (`id`),
  CONSTRAINT `fk_rails_7492f28f99` FOREIGN KEY (`on_duty_request_id`) REFERENCES `on_duty_requests` (`id`),
  CONSTRAINT `fk_rails_752ec87627` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_rails_a47dd08b41` FOREIGN KEY (`company_time_master_id`) REFERENCES `company_time_masters` (`id`),
  CONSTRAINT `fk_rails_b05fcec060` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`),
  CONSTRAINT `fk_rails_cccb9f7b46` FOREIGN KEY (`employee_leav_request_id`) REFERENCES `employee_leav_requests` (`id`),
  CONSTRAINT `fk_rails_dd1af2be7a` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_e1778f034d` FOREIGN KEY (`machine_attendance_id`) REFERENCES `machine_attendances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
INSERT INTO `employee_attendances` VALUES (789,265,'2017-12-16','HD','2017-12-16 09:48:53','2017-12-16 09:48:57',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(790,265,'2017-12-18','HD','2017-12-19 18:59:00','2017-12-18 18:59:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'00:00',NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-19 06:00:17','2017-12-19 08:10:59',NULL,NULL,'User Updated'),(791,282,'2017-12-16','HD','2017-12-16 09:31:54','2017-12-16 09:32:06',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(792,282,'2017-12-18','HD','2017-12-18 18:37:44',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(793,282,'2017-12-19','P','2017-12-19 09:29:59','2017-12-19 18:52:15',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:22',NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(794,304,'2017-12-16','HD','2017-12-16 18:57:18',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100055,'Subal Siddharth','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(795,305,'2017-12-16','HD','2017-12-16 10:18:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(796,305,'2017-12-18','HD','2017-12-18 18:29:54',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(797,305,'2017-12-19','P','2017-12-19 09:57:16','2017-12-19 18:39:23',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:42',NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(798,307,'2017-12-16','P','2017-12-16 09:51:28','2017-12-16 18:57:46',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:06',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(799,307,'2017-12-18','HD','2017-12-18 10:40:08',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(800,307,'2017-12-19','P','2017-12-19 10:08:52','2017-12-19 18:47:59',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:39',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-19 06:00:17','2017-12-19 06:00:17',NULL,NULL,NULL),(801,265,'2017-12-19','HD','2017-12-19 16:04:09','2017-12-19 18:52:00',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-19 11:00:17','2017-12-19 11:00:17',NULL,NULL,NULL),(802,282,'2017-12-20','P','2017-12-20 09:42:10','2017-12-20 18:59:43',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:17',NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-20 05:00:17','2017-12-20 05:00:17',NULL,NULL,NULL),(803,305,'2017-12-20','A','2017-12-20 10:16:12','2017-12-20 18:28:06',NULL,0,NULL,1.00,NULL,10,NULL,'08:11',NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-20 05:00:17','2018-01-04 11:45:24',NULL,NULL,'Leave Request Pending'),(804,307,'2017-12-21','P','2017-12-21 10:02:00','2017-12-21 09:59:31',NULL,0,NULL,NULL,NULL,NULL,NULL,'23:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-21 04:32:54','2017-12-21 04:32:54',NULL,NULL,NULL),(805,282,'2017-12-21','HD','2017-12-21 16:52:39','2017-12-21 18:41:14',NULL,0,NULL,NULL,NULL,NULL,NULL,'16:30',NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-21 12:00:16','2017-12-21 12:00:16',NULL,NULL,NULL),(806,265,'2017-12-20','HD','2017-12-20 19:12:18',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-21 12:00:17','2017-12-21 12:00:17',NULL,NULL,NULL),(807,265,'2017-12-21','HD','2017-12-21 10:10:56',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-21 12:00:17','2017-12-21 12:00:17',NULL,NULL,NULL),(808,305,'2017-12-22','A','2017-12-22 09:58:52','2017-12-22 18:35:07',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:36',NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-22 05:00:16','2017-12-30 08:08:01',NULL,NULL,'Leave Request Pending'),(809,307,'2017-12-22','P','2017-12-22 10:07:19','2017-12-22 18:51:30',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:44',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(810,265,'2017-12-22','P','2017-12-22 10:16:07','2017-12-22 18:45:24',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:29',NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-22 05:00:16','2017-12-22 05:00:16',NULL,NULL,NULL),(811,308,'2017-12-22','HD','2017-12-22 13:21:00','2017-12-22 18:48:00',NULL,0,NULL,NULL,NULL,NULL,NULL,'05:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-22 07:51:14','2017-12-22 13:18:25',NULL,NULL,NULL),(812,265,'2017-12-23','P','2017-12-23 08:03:51','2017-12-23 18:48:31',NULL,0,NULL,NULL,NULL,NULL,NULL,'10:44',NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-23 03:00:17','2017-12-23 03:00:17',NULL,NULL,NULL),(813,282,'2017-12-23','P','2017-12-23 08:14:44','2017-12-23 18:10:06',NULL,0,NULL,NULL,NULL,NULL,NULL,'09:55',NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-23 03:00:17','2017-12-23 03:00:17',NULL,NULL,NULL),(814,307,'2017-12-23','P','2017-12-23 10:09:32','2017-12-23 18:32:47',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:23',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-23 05:00:18','2017-12-23 05:00:18',NULL,NULL,NULL),(815,308,'2017-12-23','HD','2017-12-23 11:35:00','2017-12-23 18:28:00',NULL,0,NULL,NULL,NULL,NULL,NULL,'06:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-23 06:05:14','2017-12-23 12:58:19',NULL,NULL,NULL),(816,305,'2017-12-23','HD','2017-12-23 17:47:35',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-23 13:00:17','2017-12-23 13:00:17',NULL,NULL,NULL),(817,304,'2017-12-23','HD','2017-12-23 18:33:33',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100055,'Subal Siddharth','2017-12-23 14:00:16','2017-12-23 14:00:16',NULL,NULL,NULL),(818,282,'2017-12-25','P','2017-12-25 09:44:23','2017-12-25 18:25:48',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:41',NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(819,305,'2017-12-25','HD','2017-12-25 10:06:24',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(820,307,'2017-12-25','P','2017-12-25 10:10:09','2017-12-25 18:20:41',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:10',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-25 05:00:16','2017-12-25 05:00:16',NULL,NULL,NULL),(821,304,'2017-12-25','HD','2017-12-25 18:15:47',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100055,'Subal Siddharth','2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(822,265,'2017-12-25','HD','2017-12-25 18:26:34',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100016,'Ishwar Badgujar','2017-12-25 13:00:16','2017-12-25 13:00:16',NULL,NULL,NULL),(823,282,'2017-12-26','HD','2017-12-26 09:36:29',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100033,'Ganesh Bhosale','2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(824,305,'2017-12-26','HD','2017-12-26 10:00:08',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100056,'Vrushali Patade','2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(825,307,'2017-12-26','P','2017-12-26 10:02:44','2017-12-26 18:57:15',NULL,0,NULL,NULL,NULL,NULL,NULL,'08:54',NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-26 05:00:16','2017-12-26 05:00:16',NULL,NULL,NULL),(826,304,'2017-12-26','P','2017-12-26 10:30:45','2017-12-26 18:17:45',NULL,0,NULL,NULL,NULL,NULL,NULL,'07:47',NULL,NULL,NULL,NULL,'December',100055,'Subal Siddharth','2017-12-26 06:00:16','2017-12-26 06:00:16',NULL,NULL,NULL),(827,307,'2017-12-27','HD','2017-12-27 10:14:00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100058,'Parag Kirange','2017-12-27 05:00:18','2017-12-27 05:00:18',NULL,NULL,NULL),(828,304,'2017-12-27','HD','2017-12-27 10:23:38',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'December',100055,'Subal Siddharth','2017-12-27 05:00:18','2017-12-27 05:00:18',NULL,NULL,NULL),(829,305,'2017-12-21','LWP',NULL,NULL,NULL,0,NULL,1.00,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-30 08:04:45','2017-12-30 08:04:45',NULL,NULL,NULL),(830,305,'2017-12-29','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 11:39:40','2018-01-04 11:39:40',NULL,NULL,'Leave Request Pending'),(831,305,'2017-12-30','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 11:42:00','2018-01-04 11:42:00',NULL,NULL,'Leave Request Pending'),(832,305,'2017-12-27','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 11:43:25','2018-01-04 11:43:25',NULL,NULL,'Leave Request Pending'),(833,305,'2017-12-13','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 12:46:16','2018-01-04 12:46:16',NULL,NULL,'Leave Request Pending'),(834,305,'2017-12-01','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 12:58:15','2018-01-04 12:58:15',NULL,NULL,'Leave Request Pending'),(835,305,'2017-12-06','A',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-01-04 13:01:30','2018-01-04 13:01:30',NULL,NULL,'Leave Request Pending');
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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_bank_details`
--

LOCK TABLES `employee_bank_details` WRITE;
/*!40000 ALTER TABLE `employee_bank_details` DISABLE KEYS */;
INSERT INTO `employee_bank_details` VALUES (155,309,1,'10324172162','State Bank of India','KOREGAON BHIMA','GRADUATE','0','411002070.0','11647.0','SBIN0011647','2017-07-27 11:00:53','2017-07-27 11:00:53'),(156,310,1,'30451421182','State Bank of India','KOREGAON BHIMA','12 TH','0','411002070.0','11647.0','SBIN0011647 ','2017-07-27 11:00:53','2017-07-27 11:00:53'),(157,311,1,'31232187813','State Bank of India','Koregaon Bhima','11 TH','0','411002070.0','11647.0','SBIN0011647','2017-07-27 11:00:53','2017-07-27 11:00:53'),(158,250,1,'30684432166','State Bank of India','Talegaon ',NULL,'223025','411002062.0','Kadolkar Colony, Talegaon','SBIN0011129','2017-07-27 11:00:53','2017-07-27 11:00:53'),(159,251,1,'33446795198','State Bank of India','Deccan Gymkhana','B.com','20','411002003.0','1110.0','SBIN0001110','2017-07-27 11:00:53','2017-07-27 11:00:53'),(160,312,1,'34357787420','State Bank of India','KOREGAON BHIMA','12.0','0',NULL,NULL,'SBIN0011647','2017-07-27 11:00:53','2017-07-27 11:00:53'),(161,326,1,'10167190177','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0007237','2017-07-27 11:00:53','2017-07-27 11:00:53'),(162,252,1,'20206710804','State Bank of India','Deccan Gymkhana','MBA','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:53','2017-07-27 11:00:53'),(163,253,2,'5121140076269','HDFC Bank Ltd','Raj Bhavan Road Branch','B-Tech, MBA','61606161','Option 1','512.0','HDFC0000512','2017-07-27 11:00:53','2017-07-27 11:00:53'),(164,254,1,'20206713883','State Bank of India','Deccan Gymkhana','B.E','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:53','2017-07-27 11:00:53'),(165,255,1,'20258012231','State Bank of India','Vitthalwadi','DTL','0',NULL,NULL,'SBIN0007159','2017-07-27 11:00:53','2017-07-27 11:00:53'),(166,256,1,'20179895011','State Bank of India','Paud Road Pune','BBA','0','411002039.0',NULL,'SBIN0009061','2017-07-27 11:00:53','2017-07-27 11:00:53'),(167,257,1,'20206714333','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:53','2017-07-27 11:00:53'),(168,327,1,'11168743863','State Bank of India','SBI hill cart road',NULL,'0',NULL,NULL,'SBIN0017374','2017-07-27 11:00:53','2017-07-27 11:00:53'),(169,328,3,'71901505064','ICICI Bank Ltd','Preet Vihar','M.Com','0',NULL,NULL,'ICIC0000037','2017-07-27 11:00:53','2017-07-27 11:00:53'),(170,313,1,'30924677843','State Bank of India','INDAPUR','D.AGRRE.','0','413002821.0','6793.0','SBIN0006793','2017-07-27 11:00:53','2017-07-27 11:00:53'),(171,258,1,'31023581964','State Bank of India','Uruli Kanchan','BE','0',NULL,'7762.0','SBIN0007762','2017-07-27 11:00:53','2017-07-27 11:00:53'),(172,314,1,'31953977924','State Bank of India','Ahmednagar','B>E','0',NULL,NULL,'SBIN0000303','2017-07-27 11:00:53','2017-07-27 11:00:53'),(173,315,4,'320501054287','Cosmos Bank','VARJEMALWADI','HSC','25476748',NULL,NULL,' 	COSB0000032','2017-07-27 11:00:53','2017-07-27 11:00:53'),(174,259,1,'31285946133','State Bank of India','SBI - MAIN BRANCH AMRAVATI','MBA','0','444002971.0','311.0','SBIN0000311','2017-07-27 11:00:53','2017-07-27 11:00:53'),(175,316,1,'35627198320','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0015849','2017-07-27 11:00:53','2017-07-27 11:00:53'),(176,260,2,'50100122618700','HDFC Bank Ltd','NANA PETH','M.Sc','0',NULL,NULL,'HDFC0000633','2017-07-27 11:00:54','2017-07-27 11:00:54'),(177,261,5,'38203100001513','Saraswat co. op. bank','Tilak Road, Pune','M.B.A.','20','411088003.0','38.0','SRCB0000038','2017-07-27 11:00:54','2017-07-27 11:00:54'),(178,262,2,'50100055527350','HDFC Bank Ltd',NULL,'CMA','0',NULL,NULL,'HDFC0000825','2017-07-27 11:00:54','2017-07-27 11:00:54'),(179,263,1,'20035175336','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0007489','2017-07-27 11:00:54','2017-07-27 11:00:54'),(180,264,1,'11220818729','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0006443','2017-07-27 11:00:54','2017-07-27 11:00:54'),(181,265,1,'31946322648','State Bank of India','PBB PIMPLE NILAKH, PUNE','B.C.S. (B.Sc. Comp. Sci.)','0','Option 1',NULL,'SBIN0017125','2017-07-27 11:00:54','2017-07-27 11:00:54'),(182,266,1,'35838721125','State Bank of India','J M ROAD ','B.COM','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(183,317,1,'32130522283','State Bank of India',NULL,'B.E Mechanical','0',NULL,'6756.0','SBIN0006756','2017-07-27 11:00:54','2017-07-27 11:00:54'),(184,267,1,'35899076931','State Bank of India','Deccan Gymkhana','B.E.','0','411002003.0','1110.0','SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(185,268,1,'35899121320','State Bank of India','Deccan Gymkhana','BE(E&TC)','0',NULL,'1110.0','SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(186,318,3,'645501515946','ICICI Bank Ltd',NULL,NULL,'0',NULL,NULL,'ICIC0006455','2017-07-27 11:00:54','2017-07-27 11:00:54'),(187,269,1,'33434243232','State Bank of India','Khopoli','BE','0',NULL,NULL,'SBIN0005551','2017-07-27 11:00:54','2017-07-27 11:00:54'),(188,270,1,'20375585028','State Bank of India','Deccan Gymkhana','M Com','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(189,271,1,'20375584830','State Bank of India','j m road ','ITI','0','411002003.0','1110.0','SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(190,272,1,'20245817548','State Bank of India','Erandwane','GPME','0',NULL,NULL,'SBIN0004618','2017-07-27 11:00:54','2017-07-27 11:00:54'),(191,273,1,'31924180878','State Bank of India',NULL,'B.E.','0',NULL,NULL,'SBIN0005413','2017-07-27 11:00:54','2017-07-27 11:00:54'),(192,274,1,'10198716818','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0007339','2017-07-27 11:00:54','2017-07-27 11:00:54'),(193,275,1,'20375585095','State Bank of India','Deccan Gymkhana','Distance MBA- Marketing, Diploma in Mechanical Engg.','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:54','2017-07-27 11:00:54'),(194,329,1,'20201076176','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0003313','2017-07-27 11:00:54','2017-07-27 11:00:54'),(195,330,6,'912010039215942','Axis Bank Ltd',NULL,NULL,'0',NULL,NULL,'UTIB0000008','2017-07-27 11:00:54','2017-07-27 11:00:54'),(196,276,1,'20242834180','State Bank of India','College of Engineering, Pune, Shivaji nagar','M. Tech','0',NULL,'10431.0','SBIN0010431','2017-07-27 11:00:54','2017-07-27 11:00:54'),(197,277,1,'31992443476','State Bank of India','R&DE Dighi','BE ','0',NULL,NULL,'SBIN0010473','2017-07-27 11:00:54','2017-07-27 11:00:54'),(198,278,2,'4861050048019','HDFC Bank Ltd','Magarpatta City','Commerce','0',NULL,NULL,'HDFC0000486','2017-07-27 11:00:55','2017-07-27 11:00:55'),(199,279,1,'20375585200','State Bank of India','Deccan Gymkhana','MS Mechanical Enigneering','0',NULL,'1110.0','SBIN0001110','2017-07-27 11:00:55','2017-07-27 11:00:55'),(200,280,2,'601610020140','HDFC Bank Ltd','Fort, Mumbai','B. Tech','0',NULL,NULL,'HDFC0000060','2017-07-27 11:00:55','2017-07-27 11:00:55'),(201,281,NULL,'147710110004605','Bank of India','pali','B.Com','0',NULL,NULL,'BKID0001477','2017-07-27 11:00:55','2017-07-27 11:00:55'),(202,282,1,'30938449083','State Bank of India','Pandharpur','DCE','0',NULL,'446.0','SBIN0000446','2017-07-27 11:00:55','2017-07-27 11:00:55'),(203,283,1,'20311287367','State Bank of India','NARAYANGAON','ITI ELECTRICIAN','243111','410002555.0','11130.0','SBIN0011130 ','2017-07-27 11:00:55','2017-07-27 11:00:55'),(204,284,7,'60242855839','Bank of Maharashtra','Otur','MCVC, ITI','264127','410214020.0','130.0','MAHB0000130','2017-07-27 11:00:55','2017-07-27 11:00:55'),(205,285,7,'60243954850','Bank of Maharashtra','Otur','ITI ELE','264127','412014020.0','130.0','MAHB0000130','2017-07-27 11:00:55','2017-07-27 11:00:55'),(206,319,6,'915010041179608','Axis Bank Ltd','Shikrapur','B.COM','0',NULL,NULL,'UTIB0000862','2017-07-27 11:00:55','2017-07-27 11:00:55'),(207,286,1,'20161601102','State Bank of India','Hinjewadi','M.B.A','0',NULL,NULL,'SBIN0010203','2017-07-27 11:00:55','2017-07-27 11:00:55'),(208,331,1,'31959625310','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0002397','2017-07-27 11:00:55','2017-07-27 11:00:55'),(209,287,3,'501670325','ICICI Bank Ltd',' Pune - Bund Garden Branch','M.Sc Electronics','22','411229002.0','5.0',' ICIC0000005','2017-07-27 11:00:55','2017-07-27 11:00:55'),(210,288,1,'20206714151','State Bank of India','Deccan Gymkhana','B.E.','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:55','2017-07-27 11:00:55'),(211,289,8,'15020100053397','The Federal Bank','Dhankawadi, Pune','MBA','20','411049004.0','PUNE DHANKAWADI','FDRL0001502 ','2017-07-27 11:00:55','2017-07-27 11:00:55'),(212,290,1,'31926372412','State Bank of India',NULL,'BE','0',NULL,NULL,'SBIN0012488','2017-07-27 11:00:55','2017-07-27 11:00:55'),(213,291,9,'3320355889','Central Bank of India','Deccan Gymkhana','M.COM','0',NULL,'280655.0','CBIN0280655','2017-07-27 11:00:55','2017-07-27 11:00:55'),(214,292,10,'102104000209427','IDBI Bank','Hadapsar','HSC','20','411259005.0','102.0','IBKL0000102','2017-07-27 11:00:55','2017-07-27 11:00:55'),(215,293,1,'33054723477','State Bank of India','Yermala','B.E','2473','413002402.0','5425.0','SBIN0005425','2017-07-27 11:00:55','2017-07-27 11:00:55'),(216,294,3,'109001504260','ICICI Bank Ltd','SHOP NO 3-4 AND 5 ROOPMAYA CHS-SECTOR-6- AIROLI,NAVI MUMBAI 400708 ','B.E.','0','Option 1',NULL,'ICIC0001090','2017-07-27 11:00:55','2017-07-27 11:00:55'),(217,320,11,'583902010002836','Union Bank of India','Talegaon Dabhade','B.E.','0',NULL,NULL,'UBIN0558397','2017-07-27 11:00:55','2017-07-27 11:00:55'),(218,295,1,'20211312149','State Bank of India','HINJEWADI','CNC DIPLOMA , ITI','0',NULL,'10203.0','SBIN0010203','2017-07-27 11:00:55','2017-07-27 11:00:55'),(219,321,1,'31385627136','State Bank of India','Koregaon Bhima',NULL,'0',NULL,'11647.0','SBIN0011647','2017-07-27 11:00:55','2017-07-27 11:00:55'),(220,322,1,'35598605427','State Bank of India',NULL,NULL,'0',NULL,NULL,'SBIN0015849','2017-07-27 11:00:55','2017-07-27 11:00:55'),(221,296,3,'8801523922','ICICI Bank Ltd',NULL,NULL,'0',NULL,NULL,'ICIC0000088','2017-07-27 11:00:56','2017-07-27 11:00:56'),(222,297,7,'60054940068','Bank of Maharashtra',NULL,'MBA','0',NULL,NULL,'MAHB0001431','2017-07-27 11:00:56','2017-07-27 11:00:56'),(223,298,1,'20111688901','State Bank of India','Paud Road (Pune)','B.E.','0',NULL,NULL,'SBIN0009061','2017-07-27 11:00:56','2017-07-27 11:00:56'),(224,323,1,'31053189108','State Bank of India','RMY Pochampalli','BE','0',NULL,'7494.0','SBIN0007494','2017-07-27 11:00:56','2017-07-27 11:00:56'),(225,299,1,'31454303655','State Bank of India','Kothrud','BE','20',NULL,NULL,'SBIN0030456','2017-07-27 11:00:56','2017-07-27 11:00:56'),(226,300,7,'68018970724','Bank of Maharashtra','Kasarwadi','I.T.I','18001022636','411014047.0',NULL,'MAHB0000170','2017-07-27 11:00:56','2017-07-27 11:00:56'),(227,301,2,'50100178845026','HDFC Bank Ltd','Technopark,Trivandrum,Kerala','M.Tech','0','Option 1',NULL,'HDFC0000683','2017-07-27 11:00:56','2017-07-27 11:00:56'),(228,302,1,'20375583439','State Bank of India','Deccan Gymkhana','PGDBM','0',NULL,NULL,'SBIN0001110','2017-07-27 11:00:56','2017-07-27 11:00:56'),(229,324,13,'41250100001513','Bank of Baroda','Rajgurunagar','BE ','0','411012042.0',NULL,'BARBORAJGUR','2017-07-27 11:00:56','2017-07-27 11:00:56'),(230,303,3,'501670358','ICICI Bank Ltd','Rose Valley, Aundh ave Pimple Saudagar, Pune 411027. ','B.E','0',NULL,NULL,'ICIC0001697','2017-07-27 11:00:56','2017-07-27 11:00:56'),(231,304,3,'32101634516','ICICI Bank Ltd','Chinchwad','Chinchwad, Pune','','Option 1','321.0','ICIC0000321','2017-07-27 11:00:56','2017-09-15 09:32:13'),(232,305,12,'1212269858','Kotak Mahindra Bank','Pune','MBA - HR','0',NULL,'1753.0','KKBK0001753','2017-07-27 11:00:56','2017-07-27 11:00:56'),(233,306,4,'110501054630','Cosmos Bank','Alandi','B.E.','0',NULL,NULL,'COSB0000011','2017-07-27 11:00:56','2017-07-27 11:00:56'),(234,325,NULL,'0',NULL,NULL,NULL,'0',NULL,NULL,NULL,'2017-07-27 11:00:56','2017-07-27 11:00:56'),(235,307,2,'04861050035887','HDFC Bank Ltd','Magarpatta','Magarpatta City','2061606161','411240015.0','486.0','HDFC0000486','2017-07-27 11:00:56','2017-11-13 05:41:29'),(236,308,2,'50100020544760','HDFC Bank Ltd','FC Road, Pune.','M.B.A','0',NULL,NULL,'HDFC000103','2017-07-27 11:00:56','2017-07-27 11:00:56'),(237,332,1,'9632587410',NULL,'Banner','Banner','630258741','','','','2017-08-22 06:55:49','2017-08-22 06:55:49'),(238,424,1,'20056049259',NULL,'Dwarakapuri, Punjagutta','	 6- 3- 347/22/2, Aishwarya Nilayam, Adjacent To Model House Lane, Dwarakapuri Colony, Punjagutta, Dist,hyderabad, Hyderabad - 500082','','500002120','11661','SBIN0011661','2017-11-21 09:53:07','2017-11-21 09:53:07');
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
INSERT INTO `employee_categories` VALUES (1,'1.0','Director',NULL,NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Staff','',NULL,1,'2017-05-26 21:09:50','2017-08-01 08:17:52'),(3,'3.0','Worker',NULL,NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_code_masters`
--

LOCK TABLES `employee_code_masters` WRITE;
/*!40000 ALTER TABLE `employee_code_masters` DISABLE KEYS */;
INSERT INTO `employee_code_masters` VALUES (1,'HO','100001','100061',1,NULL,'2017-06-06 22:11:35','2017-08-01 11:20:43'),(2,'Factory','200001','200021',1,NULL,'2017-07-27 09:01:57','2017-11-21 07:41:52'),(3,'Sales & Marketing','300001','300005',1,NULL,'2017-07-27 09:02:49','2017-08-23 11:27:54'),(4,'Project','400001','400001',1,NULL,'2017-11-14 06:47:03','2017-11-14 06:47:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_designations`
--

LOCK TABLES `employee_designations` WRITE;
/*!40000 ALTER TABLE `employee_designations` DISABLE KEYS */;
INSERT INTO `employee_designations` VALUES (1,NULL,'Leader','',NULL,'2017-05-29 04:52:25','2017-05-29 04:52:25'),(2,NULL,'Senior Manager','',NULL,'2017-05-29 04:52:34','2017-05-29 04:52:34'),(3,NULL,'Manager','',NULL,'2017-05-29 04:52:41','2017-05-29 04:52:41'),(4,NULL,'Assistant Manager','',NULL,'2017-05-29 04:52:49','2017-05-29 04:52:49'),(5,NULL,'Senior Engineer','',NULL,'2017-05-29 04:52:57','2017-05-29 04:52:57'),(6,NULL,'Engineer','',NULL,'2017-05-29 04:53:05','2017-05-29 04:53:05'),(7,NULL,'Junior Engineer','',NULL,'2017-05-29 04:53:15','2017-05-29 04:53:15'),(8,NULL,'Site Engineer','',NULL,'2017-05-29 04:53:24','2017-05-29 04:53:24'),(9,NULL,'Senior Executive','',NULL,'2017-05-29 04:53:33','2017-05-29 04:53:33'),(10,NULL,'Executive','',NULL,'2017-05-29 04:53:42','2017-05-29 04:53:42'),(11,NULL,'Coordinator','',NULL,'2017-05-29 04:53:49','2017-05-29 04:53:49'),(12,NULL,'Office assistant','',NULL,'2017-05-29 04:53:58','2017-05-29 04:53:58'),(13,NULL,'Supervisor','',NULL,'2017-05-29 04:54:05','2017-05-29 04:54:05'),(14,NULL,'Technician','',NULL,'2017-05-29 04:54:14','2017-05-29 04:54:14'),(15,NULL,'Trainee','',NULL,'2017-05-29 04:54:21','2017-05-29 04:54:21'),(16,NULL,'Expert','',NULL,'2017-06-06 22:19:51','2017-06-06 22:19:51'),(17,NULL,'Accounts Executive','',NULL,'2017-08-01 08:33:44','2017-08-01 08:33:44'),(18,NULL,'Accounts Trainee','',NULL,'2017-08-01 08:34:15','2017-08-01 08:34:15'),(19,NULL,'Admin Executive','',NULL,'2017-08-01 08:34:34','2017-08-01 08:34:34'),(20,NULL,'Assembly Supervisor','',NULL,'2017-08-01 08:35:19','2017-08-01 08:35:19'),(21,NULL,'Assistant Manager - Filtration','',NULL,'2017-08-01 08:36:12','2017-08-01 09:08:03'),(22,NULL,'Assistant Manager-Exim','',NULL,'2017-08-01 08:36:33','2017-08-01 08:36:33'),(23,NULL,'Branch Manager','',NULL,'2017-08-01 08:36:42','2017-08-01 08:36:42'),(24,NULL,'Business Development Executive','',NULL,'2017-08-01 08:37:08','2017-08-01 08:37:08'),(25,NULL,'Business Development Officer Asia Pacific','',NULL,'2017-08-01 08:37:31','2017-08-01 09:07:06'),(26,NULL,'Coordination Executive','',NULL,'2017-08-01 08:38:01','2017-08-01 08:38:01'),(27,NULL,'Design Engineer','',NULL,'2017-08-01 08:38:13','2017-08-01 08:38:13'),(28,NULL,'Development Head (Technical)','',NULL,'2017-08-01 08:38:25','2017-08-01 09:08:57'),(29,NULL,'Director','',NULL,'2017-08-01 08:39:05','2017-08-01 08:39:05'),(30,NULL,'Dispatch Executive','',NULL,'2017-08-01 08:39:16','2017-08-01 08:39:16'),(31,NULL,'Draughtsman','',NULL,'2017-08-01 08:39:31','2017-08-01 08:39:31'),(32,NULL,'Electrical Purchase Engineer','',NULL,'2017-08-01 08:40:07','2017-08-01 08:40:07'),(33,NULL,'Embedded Software Engineer','',NULL,'2017-08-01 08:40:49','2017-08-01 08:40:49'),(34,NULL,'Exim Executive','',NULL,'2017-08-01 08:41:27','2017-08-01 08:41:27'),(35,NULL,'Front Office Executive','',NULL,'2017-08-01 08:41:40','2017-08-01 08:41:40'),(36,NULL,'Galvanizing Inch','',NULL,'2017-08-01 08:42:16','2017-08-01 08:42:16'),(37,NULL,'HR Manager','',NULL,'2017-08-01 08:42:25','2017-08-01 08:42:25'),(38,NULL,'IOT Engineer','',NULL,'2017-08-01 08:42:35','2017-08-01 08:42:35'),(39,NULL,'IT Support','',NULL,'2017-08-01 08:42:45','2017-08-01 08:42:45'),(40,NULL,'IT System Administrator','',NULL,'2017-08-01 08:43:12','2017-08-01 08:43:12'),(41,NULL,'ITI Lab Technician','',NULL,'2017-08-01 08:43:39','2017-08-01 08:43:39'),(42,NULL,'JUNIOR TESTING ENGG.','',NULL,'2017-08-01 08:44:16','2017-08-01 08:44:16'),(43,NULL,'Leader Finance & Accounts','',NULL,'2017-08-01 08:44:36','2017-08-01 08:44:36'),(44,NULL,'Leader Material Management','',NULL,'2017-08-01 08:45:03','2017-08-01 08:45:03'),(45,NULL,'Manager HR','',NULL,'2017-08-01 08:45:13','2017-08-01 08:45:13'),(46,NULL,'Manager Liaisoning & Sales','',NULL,'2017-08-01 08:45:37','2017-08-01 08:45:37'),(47,NULL,'Marketing Executive','',NULL,'2017-08-01 08:45:52','2017-08-01 08:45:52'),(48,NULL,'Mechanical Design Engineer','',NULL,'2017-08-01 08:46:41','2017-08-01 08:46:41'),(49,NULL,'PCB Design Engineer','',NULL,'2017-08-01 08:46:53','2017-08-01 08:46:53'),(50,NULL,'Production Engineer','',NULL,'2017-08-01 08:47:03','2017-08-01 08:47:03'),(51,NULL,'Production Executive','',NULL,'2017-08-01 08:47:24','2017-08-01 08:47:24'),(52,NULL,'Production Head','',NULL,'2017-08-01 08:47:37','2017-08-01 08:47:37'),(53,NULL,'Production Manager','',NULL,'2017-08-01 08:47:57','2017-08-01 08:47:57'),(54,NULL,'Production Supervisor','',NULL,'2017-08-01 08:48:24','2017-08-01 08:48:24'),(55,NULL,'Projects Manager','',NULL,'2017-08-01 08:48:47','2017-08-01 08:48:47'),(56,NULL,'Purchase Executive','',NULL,'2017-08-01 08:49:05','2017-08-01 08:49:05'),(57,NULL,'Quality Executive','',NULL,'2017-08-01 08:49:17','2017-08-01 08:49:17'),(58,NULL,'R&D Engineer','',NULL,'2017-08-01 08:49:27','2017-08-01 08:49:27'),(59,NULL,'R&D Leader','',NULL,'2017-08-01 08:49:38','2017-08-01 08:49:38'),(60,NULL,'R&D Purchase Engineer','',NULL,'2017-08-01 08:49:51','2017-08-01 08:49:51'),(61,NULL,'Sales Manager','',NULL,'2017-08-01 08:49:59','2017-08-01 08:49:59'),(62,NULL,'SCM Executive','',NULL,'2017-08-01 08:50:12','2017-08-01 08:50:12'),(63,NULL,'Security Guard','',NULL,'2017-08-01 08:50:38','2017-08-01 08:50:38'),(64,NULL,'Senior Accounts Executive','',NULL,'2017-08-01 08:50:56','2017-08-01 08:50:56'),(65,NULL,'Senior Engineer Projects','',NULL,'2017-08-01 08:51:16','2017-08-01 08:51:16'),(66,NULL,'Senior Hardware Engineer','',NULL,'2017-08-01 08:51:42','2017-08-01 08:51:42'),(67,NULL,'Sr. R&D Engineer','',NULL,'2017-08-01 08:52:00','2017-08-01 08:52:00'),(68,NULL,'Stores Executive','',NULL,'2017-08-01 08:52:15','2017-08-01 08:52:15'),(69,NULL,'Tender Executive','',NULL,'2017-08-01 08:52:57','2017-08-01 08:52:57'),(70,NULL,'Testing Engineer','',NULL,'2017-08-01 08:53:22','2017-08-01 08:53:22'),(71,NULL,'Senior Manager - Operation','Projects',NULL,'2017-09-14 13:18:45','2017-09-14 13:18:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_documents`
--

LOCK TABLES `employee_documents` WRITE;
/*!40000 ALTER TABLE `employee_documents` DISABLE KEYS */;
INSERT INTO `employee_documents` VALUES (1,332,'Experince',1,'2017-08-22 07:08:23','2017-08-22 07:08:23','Mumbai_To_Dewas_redBus_Ticket(1).pdf','application/pdf',224206,'2017-08-22 07:08:23',NULL,NULL,NULL,NULL);
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
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_employee_gps_histories_on_employee_id` (`employee_id`),
  KEY `index_employee_gps_histories_on_employee_gp_id` (`employee_gp_id`),
  KEY `index_employee_gps_histories_on_member_id` (`member_id`),
  CONSTRAINT `fk_rails_13b4974483` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_850c70a5fd` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`),
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
INSERT INTO `employee_grades` VALUES (1,'1.0','Blue',NULL,'2017-05-26 21:09:50','2017-06-06 22:21:54'),(2,NULL,'Employee',NULL,'2017-06-06 22:22:02','2017-08-01 08:15:57'),(3,NULL,'Orange',NULL,'2017-06-06 22:22:15','2017-06-06 22:22:15'),(4,NULL,'Red',NULL,'2017-06-06 22:22:22','2017-06-06 22:22:22'),(5,NULL,'White',NULL,'2017-06-06 22:22:32','2017-06-06 22:22:32'),(6,NULL,'Yellow',NULL,'2017-06-06 22:22:46','2017-06-06 22:22:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=1737 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_balances`
--

LOCK TABLES `employee_leav_balances` WRITE;
/*!40000 ALTER TABLE `employee_leav_balances` DISABLE KEYS */;
INSERT INTO `employee_leav_balances` VALUES (1571,255,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:22','2017-09-13 06:29:22',NULL,NULL,NULL,NULL),(1572,262,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:22','2017-09-13 06:29:22',NULL,NULL,NULL,NULL),(1573,251,1,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:22','2017-09-13 06:29:22',NULL,NULL,NULL,NULL),(1574,250,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:22','2017-09-13 06:29:22',NULL,NULL,NULL,NULL),(1575,291,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1576,256,1,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1577,270,1,'4.0',NULL,'4.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1578,281,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1579,261,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1580,278,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1581,289,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-19 11:13:40',NULL,NULL,NULL,NULL),(1582,274,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1583,271,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1584,277,1,'3.5',NULL,'3.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1585,306,1,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1586,304,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1587,305,1,'0.0',NULL,'1.0',1,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-18 04:24:12',NULL,NULL,NULL,NULL),(1588,307,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1589,308,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1590,252,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1591,265,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1592,282,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1593,257,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1594,263,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1595,272,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1596,253,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1597,279,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:23','2017-09-13 06:29:23',NULL,NULL,NULL,NULL),(1598,254,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-22 06:13:55',NULL,NULL,NULL,NULL),(1599,258,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1600,259,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-18 14:00:54',NULL,NULL,NULL,NULL),(1601,268,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1602,267,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1603,264,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1604,269,1,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1605,273,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1606,276,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-22 08:57:49',NULL,NULL,NULL,NULL),(1607,280,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1608,288,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-18 05:47:00',NULL,NULL,NULL,NULL),(1609,287,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-15 07:27:15',NULL,NULL,NULL,NULL),(1610,296,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1611,298,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1612,301,1,'0.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-22 13:49:19',NULL,NULL,NULL,NULL),(1613,303,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1614,266,1,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1615,275,1,'3.0',NULL,'4.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-15 13:09:42',NULL,NULL,NULL,NULL),(1616,327,1,'9.0',NULL,'9.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1617,328,1,'7.0',NULL,'7.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1618,326,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:24','2017-09-13 06:29:24',NULL,NULL,NULL,NULL),(1619,330,1,'8.0',NULL,'8.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1620,329,1,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1621,331,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1622,286,1,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1623,297,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1624,302,1,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1625,315,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1626,283,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1627,284,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1628,285,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1629,292,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1630,293,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1631,260,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1632,294,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1633,295,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1634,299,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1635,300,1,'4.0',NULL,'4.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1636,290,1,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1637,332,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1638,309,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1639,311,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1640,310,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1641,319,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 06:29:25','2017-09-13 06:29:25',NULL,NULL,NULL,NULL),(1642,312,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1643,313,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1644,314,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1645,317,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1646,318,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1647,320,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1648,323,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1649,321,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1650,322,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1651,316,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1652,324,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1653,325,1,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1654,255,2,'0.75',NULL,'0.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1655,262,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:57','2017-09-13 07:02:57',NULL,NULL,NULL,NULL),(1656,251,2,'4.25',NULL,'4.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1657,250,2,'0.25',NULL,'0.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1658,291,2,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1659,256,2,'6.75',NULL,'6.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1660,270,2,'1.25',NULL,'1.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1661,281,2,'4.5',NULL,'4.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1662,261,2,'1.25',NULL,'1.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1663,278,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1664,289,2,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1665,274,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1666,271,2,'0.25',NULL,'0.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1667,277,2,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1668,306,2,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1669,304,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1670,305,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1671,307,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-20 06:22:45',NULL,NULL,NULL,NULL),(1672,308,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1673,252,2,'15.75',NULL,'15.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1674,265,2,'3.0',NULL,'4.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-26 13:03:47',NULL,NULL,NULL,NULL),(1675,282,2,'0.25',NULL,'0.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1676,257,2,'1.75',NULL,'1.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1677,263,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:58','2017-09-13 07:02:58',NULL,NULL,NULL,NULL),(1678,272,2,'1.5',NULL,'1.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1679,253,2,'4.75',NULL,'4.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1680,279,2,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1681,254,2,'0.25',NULL,'0.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1682,258,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1683,259,2,'6.5',NULL,'7.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-19 13:51:26',NULL,NULL,NULL,NULL),(1684,268,2,'2.0',NULL,'2.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1685,267,2,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1686,264,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1687,269,2,'0.75',NULL,'0.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1688,273,2,'4.75',NULL,'4.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1689,276,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1690,280,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1691,288,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1692,287,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1693,296,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1694,298,2,'3.5',NULL,'3.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1695,301,2,'2.75',NULL,'2.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1696,303,2,'1.25',NULL,'1.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1697,266,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1698,275,2,'4.75',NULL,'4.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1699,327,2,'21.75',NULL,'21.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1700,328,2,'2.25',NULL,'2.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:02:59','2017-09-13 07:02:59',NULL,NULL,NULL,NULL),(1701,326,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1702,330,2,'5.25',NULL,'5.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1703,329,2,'6.5',NULL,'6.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1704,331,2,'0.75',NULL,'0.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1705,286,2,'1.0',NULL,'1.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1706,297,2,'2.5',NULL,'2.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1707,302,2,'2.75',NULL,'2.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1708,315,2,'33.75',NULL,'33.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1709,283,2,'5.0',NULL,'5.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:00','2017-09-13 07:03:00',NULL,NULL,NULL,NULL),(1710,284,2,'7.0',NULL,'7.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:01','2017-09-13 07:03:01',NULL,NULL,NULL,NULL),(1711,285,2,'7.0',NULL,'7.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1712,292,2,'3.5',NULL,'3.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1713,293,2,'1.5',NULL,'1.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1714,260,2,'0.25',NULL,'0.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1715,294,2,'3.25',NULL,'3.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1716,295,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1717,299,2,'0.5',NULL,'0.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1718,300,2,'2.75',NULL,'2.75',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1719,290,2,'1.5',NULL,'1.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1720,332,2,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1721,309,2,'33.0',NULL,'33.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1722,311,2,'34.0',NULL,'34.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1723,310,2,'25.0',NULL,'25.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1724,319,2,'6.0',NULL,'6.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1725,312,2,'40.0',NULL,'40.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1726,313,2,'36.0',NULL,'36.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1727,314,2,'36.0',NULL,'36.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:03','2017-09-13 07:03:03',NULL,NULL,NULL,NULL),(1728,317,2,'18.25',NULL,'18.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1729,318,2,'26.25',NULL,'26.25',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1730,320,2,'2.5',NULL,'2.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1731,323,2,'3.0',NULL,'3.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1732,321,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1733,322,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1734,316,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1735,324,2,'0.0',NULL,'0.0',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL),(1736,325,2,'3.5',NULL,'3.5',NULL,'2017-09-01','2017-09-30',1,'2017-09-13 07:03:04','2017-09-13 07:03:04',NULL,NULL,NULL,NULL);
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
  CONSTRAINT `fk_rails_36b7682875` FOREIGN KEY (`leav_category_id`) REFERENCES `leav_categories` (`id`),
  CONSTRAINT `fk_rails_76a71d5b78` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_c1560c30e3` FOREIGN KEY (`employee_leav_balance_id`) REFERENCES `employee_leav_balances` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leav_requests`
--

LOCK TABLES `employee_leav_requests` WRITE;
/*!40000 ALTER TABLE `employee_leav_requests` DISABLE KEYS */;
INSERT INTO `employee_leav_requests` VALUES (1,287,1,'Full Day','2017-09-16 00:00:00','2017-09-16 00:00:00',NULL,NULL,1.0,NULL,NULL,'Monthly Saturday Leave',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-15 07:27:15','2017-09-20 05:10:22',1609),(2,275,1,'Full Day','2017-09-14 00:00:00','2017-09-14 00:00:00',NULL,NULL,1.0,NULL,NULL,'Dear Sir',1,0,1,0,0,0,3,NULL,304,NULL,NULL,'2017-09-15 13:09:42','2017-09-20 03:29:49',1615),(3,305,1,'Full Day','2017-09-16 00:00:00','2017-09-16 00:00:00',NULL,NULL,1.0,NULL,NULL,'was not well',1,0,1,0,0,0,3,NULL,304,NULL,NULL,'2017-09-18 04:24:11','2017-09-20 03:26:52',1587),(4,288,1,'Full Day','2017-09-23 00:00:00','2017-09-23 00:00:00',NULL,NULL,1.0,NULL,NULL,'ML',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-18 05:46:59','2017-09-20 05:10:36',1608),(5,259,1,'Full Day','2017-10-21 00:00:00','2017-10-21 00:00:00',NULL,NULL,1.0,NULL,NULL,'Monthly Leave for Month oct-2017 ',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-18 14:00:53','2017-09-20 05:10:07',1600),(6,289,1,'Full Day','2017-09-12 00:00:00','2017-09-12 00:00:00',NULL,NULL,1.0,NULL,NULL,'Not well',1,0,1,0,0,0,3,NULL,307,NULL,NULL,'2017-09-19 11:13:40','2017-09-20 06:15:24',1581),(7,259,2,'Full Day','2017-10-16 00:00:00','2017-10-16 00:00:00',NULL,NULL,1.0,NULL,NULL,'going to home town ',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-19 13:51:26','2017-09-20 05:10:47',1683),(8,254,1,'Full Day','2017-09-23 00:00:00','2017-09-23 00:00:00',NULL,NULL,1.0,NULL,NULL,'ML for personal work',1,0,1,0,0,0,3,NULL,304,NULL,NULL,'2017-09-20 05:12:52','2017-09-20 05:28:25',1598),(9,307,2,'Full Day','2017-09-22 00:00:00','2017-09-22 00:00:00',NULL,NULL,1.0,NULL,NULL,'Personal work',1,1,0,0,0,0,1,NULL,304,NULL,NULL,'2017-09-20 05:53:19','2017-09-20 06:22:45',1671),(10,276,1,'Full Day','2017-09-23 00:00:00','2017-09-23 00:00:00',NULL,NULL,1.0,NULL,NULL,'Monthly leave',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-22 08:57:49','2017-09-22 12:57:38',1606),(11,301,1,'Full Day','2017-09-22 00:00:00','2017-09-22 00:00:00',NULL,NULL,1.0,NULL,NULL,'Monthly Saturday Leave',1,1,0,0,0,0,1,NULL,254,NULL,NULL,'2017-09-22 11:10:28','2017-09-22 13:48:42',1612),(12,301,1,'Full Day','2017-09-23 00:00:00','2017-09-23 00:00:00',NULL,NULL,1.0,NULL,NULL,'Monthly Saturday Leave',1,0,1,0,0,0,3,NULL,254,NULL,NULL,'2017-09-22 13:49:19','2017-09-22 13:54:04',1612),(13,265,2,'','2017-09-29 00:00:00','2017-09-29 00:00:00',NULL,NULL,1.0,NULL,NULL,'Personal',1,0,1,0,0,0,3,NULL,307,NULL,NULL,'2017-09-26 13:03:47','2017-09-28 06:10:29',1674),(14,305,6,'Full Day','2017-12-21 00:00:00','2017-12-21 00:00:00',NULL,NULL,1.0,NULL,NULL,'Leave',1,0,0,1,0,0,3,NULL,304,NULL,NULL,'2017-12-30 08:04:45','2017-12-30 08:05:56',NULL),(15,305,6,'Full Day','2017-12-22 00:00:00','2017-12-22 00:00:00',NULL,NULL,1.0,NULL,NULL,'leave',1,1,0,0,0,0,1,NULL,304,NULL,NULL,'2017-12-30 08:08:01','2017-12-30 08:09:02',NULL),(16,305,6,'Full Day','2017-12-29 00:00:00','2017-12-29 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,1,0,0,0,0,1,NULL,304,NULL,NULL,'2018-01-04 11:39:40','2018-01-04 11:41:32',NULL),(17,305,6,'Full Day','2017-12-30 00:00:00','2017-12-30 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 11:41:59','2018-01-04 11:41:59',NULL),(18,305,6,'Full Day','2017-12-27 00:00:00','2017-12-27 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 11:43:25','2018-01-04 11:43:25',NULL),(19,305,6,'Full Day','2017-12-20 00:00:00','2017-12-20 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 11:45:24','2018-01-04 11:45:24',NULL),(20,305,6,'Full Day','2017-12-29 00:00:00','2017-12-29 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 12:26:07','2018-01-04 12:26:07',NULL),(21,305,6,'Full Day','2017-12-13 00:00:00','2017-12-13 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 12:46:16','2018-01-04 12:46:16',NULL),(22,305,6,'Full Day','2017-12-01 00:00:00','2017-12-01 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 12:58:15','2018-01-04 12:58:15',NULL),(23,305,6,'Full Day','2017-12-06 00:00:00','2017-12-06 00:00:00',NULL,NULL,1.0,NULL,NULL,'Demo',1,0,0,0,0,0,0,NULL,304,NULL,NULL,'2018-01-04 13:01:29','2018-01-04 13:01:29',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_physicals`
--

LOCK TABLES `employee_physicals` WRITE;
/*!40000 ALTER TABLE `employee_physicals` DISABLE KEYS */;
INSERT INTO `employee_physicals` VALUES (1,307,'180','72','L','32','2017-08-01 11:31:26','2017-08-01 11:31:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_plans`
--

LOCK TABLES `employee_plans` WRITE;
/*!40000 ALTER TABLE `employee_plans` DISABLE KEYS */;
INSERT INTO `employee_plans` VALUES (1,305,'2017-12-30','2017-12-30','13:30:00','14:00:00','Surbhi','Cafe Good Luck','sadas',0,0,'Cancelled',304,31.7737,-106.447,NULL,NULL,'2017-12-30 08:12:07','2018-01-09 10:24:53'),(2,305,'2017-12-30','2017-12-30','13:30:00','14:00:00','Surbhi','Cafe Good Luck','sadasdaAaA',NULL,NULL,'Pending',304,31.7737,-106.447,NULL,NULL,'2017-12-30 08:12:23','2017-12-30 08:12:23'),(3,305,'2017-12-30','2017-12-30','13:30:00','14:00:00','Surbhi','Cafe Good Luck','sadasdaAaADaDa',NULL,NULL,'Pending',304,31.7737,-106.447,NULL,NULL,'2017-12-30 08:12:34','2017-12-30 08:12:34'),(4,305,'2017-12-30','2017-12-30','13:30:00','14:00:00','Surbhi','Cafe Good Luck','ssssssssssssssssss',0,0,'Cancelled',304,31.7737,-106.447,NULL,NULL,'2017-12-30 08:26:17','2018-01-09 10:24:44'),(5,305,'2017-12-30','2017-12-30','14:15:00','18:15:00','rohit','Cafe Good Luck','sdadszfsdfads',0,0,'Cancelled',304,31.7737,-106.447,NULL,NULL,'2017-12-30 08:57:16','2017-12-30 09:02:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_promotions`
--

LOCK TABLES `employee_promotions` WRITE;
/*!40000 ALTER TABLE `employee_promotions` DISABLE KEYS */;
INSERT INTO `employee_promotions` VALUES (1,NULL,NULL,NULL,NULL,NULL,332,24,10,3,'2','','','2017-06-30',NULL,'2017-08-22 06:54:15','2017-08-22 11:13:02'),(2,NULL,NULL,NULL,NULL,NULL,424,53,8,2,'2',NULL,NULL,'2017-11-20',NULL,'2017-11-21 09:48:13','2017-11-21 09:48:13'),(3,NULL,NULL,NULL,NULL,NULL,359,53,8,2,'2',NULL,NULL,'2014-03-07',NULL,'2017-12-26 07:15:00','2017-12-26 07:15:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_resignations`
--

LOCK TABLES `employee_resignations` WRITE;
/*!40000 ALTER TABLE `employee_resignations` DISABLE KEYS */;
INSERT INTO `employee_resignations` VALUES (1,298,'2017-12-31','Personal',NULL,'','0','2017-12-31',NULL,'2017-12-31','NA','2017-12-31',NULL,NULL,NULL,NULL,'FinalApproved',1,NULL,NULL,305,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2017-12-30 00:00:00','2017-12-30 08:17:15','2017-12-30 08:17:15',254);
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
) ENGINE=InnoDB AUTO_INCREMENT=13088 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_transfers`
--

LOCK TABLES `employee_transfers` WRITE;
/*!40000 ALTER TABLE `employee_transfers` DISABLE KEYS */;
INSERT INTO `employee_transfers` VALUES (2,250,2,2,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-08-23 07:35:37','2017-08-23 07:35:37','2017-08-01','2017-08-01',250),(3,250,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-08-23 07:47:13','2017-08-23 07:47:13','2017-08-01','2017-08-23',250),(4,250,2,2,1,1,20,NULL,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-08-23 08:00:00','2017-08-23 08:00:00','2017-08-23','2017-12-01',250),(5,373,NULL,NULL,NULL,NULL,NULL,'Site Engineer',NULL,'Employee','Span Pumps Pvt Ltd','Rajasthan','Project','Pending','','2017-12-16 11:49:04','2017-12-16 11:49:04',NULL,NULL,358),(6,359,8,2,1,4,15,NULL,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-12-26 07:15:58','2017-12-26 07:15:58','2017-12-26',NULL,307),(7,250,3,2,1,1,27,NULL,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-12-30 09:04:23','2017-12-30 09:04:23','2017-12-01',NULL,305);
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
  `optional_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
  `employee_signature_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_signature_file_size` int(11) DEFAULT NULL,
  `employee_signature_updated_at` datetime DEFAULT NULL,
  `emergency_contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optinal_contact_no1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (250,'100001','EMP0000250',NULL,'Mr.','Shriniwas','Achyut','Marathe','1952-08-05','Male','9623723880','44','design@indibasolutions.com','Plot No.60,Bhide Niwara Co-Operative Housing Society Limited,Block No.6, 1St Floor, Yeshwant Nagar,Talegaon Dabhade, Taluka-Maval,Dist.Pune-410 507 (Maharashtra)',1,20,504,'Talegaon Dabhade',410507,'Plot No.60,Bhide Niwara Co-operative Housing Society Limited,Block No.6, 1st Floor, Yeshwant Nagar,Talegaon Dabhade, Taluka-Maval,Dist.Pune-410 507 (Maharashtra)','210156619907','AAVPM8394A','Nil','Married',4,2,1,1,'No','','Active',250,NULL,1,1,27,NULL,1,'2017-07-27 08:54:47','2017-12-30 09:04:23',NULL,NULL,NULL,NULL,'',1,NULL,NULL,NULL,NULL,'',''),(251,'100002','EMP0000251',NULL,NULL,'Swarali','Nikhil','Pitre','1989-03-27','Female','9767530161',NULL,'design@indibasolutions.com','41/1/2 , Sumeru Developers ,Sushrut Residency , Wing K-2 , 3Rd Floor , Flat No.10 Narhe , Pune',1,20,504,'Pune',411041,'41/1/2 , Sumeru Developers ,Sushrut Residency , Wing K-2 , 3rd Floor , Flat No.10 Narhe , Pune','614720325506','CKSPP7542L','NA','Married',1,NULL,1,NULL,'No',NULL,'Active',453,NULL,1,1,1,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:27:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,'100003','EMP0000252',NULL,'Mr.','Suyash','Sanjay','Tambe','1981-06-13','Male','7774060034','36','design@indibasolutions.com','A 101 Karan Paradise Pimple Gurav Behind Bank Of Maharashtra',1,20,504,'Pune',411061,'As per Above','879741722164','AFOPT0994F','MH/05/360172','Married',3,2,1,1,'No','','Active',304,NULL,1,1,27,NULL,1,'2017-07-27 08:54:47','2017-09-15 04:19:27',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','7757017188'),(253,'100004','EMP0000253',NULL,NULL,'Guntur',NULL,'Sreekanth','1988-06-12','Male','7032455535',NULL,'design@indibasolutions.com','8/36. Kapu Street, Near Rama Mandiram, Narayan Reddy Pet, Nellore Rural Mandal, Nellore District, Andhra Pradesh',1,2,42,'Nellore',524314,'Plot No-132&147,  Bala Krishna Nagar, Sri Ramlakshman Residency, Flat No-302, Near Chittaramma temple, Vivekananda Nagar Colony, Kukatpally, Hyderabad.','245799257093','AUUPG6221H','DLFAP02633502008','Married',2,NULL,1,NULL,'No',NULL,'Active',252,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:44:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,'100005','EMP0000254',NULL,NULL,'Shrikant','Dattatraya','Varpe','1978-04-26','Male','7722016051',NULL,'design@indibasolutions.com','H.No 1026, Samarth Colony, Vijay Nagar Kalewadi Pune - 17',1,NULL,504,'Pune',411017,NULL,'475260105169',NULL,NULL,'Married',4,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,29,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:32:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,'100006','EMP0000255',NULL,'','Chintamani','Prakash','Dandekaar','1979-01-21','Male','9850965248','','design@indibasolutions.com','Fl No C2 602, Shivsagar Society Ph-1, Anandnagar, Sinhagad Road, Pune',1,20,504,'Pune',411051,'','254735213526','','','Married',3,NULL,1,NULL,'No','','Inactive',304,NULL,1,1,20,NULL,1,'2017-07-27 08:54:47','2017-11-06 09:04:55',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(256,'100007','EMP0000256',NULL,NULL,'Pravinsinh','Ishwara','Chougule','1986-10-14','Male','9763229298',NULL,'design@indibasolutions.com','Ap- Karambali,Tal- Gadhinglaj,Dist-Kolhapur',1,20,479,'Gadhinglaj',416526,'C/o- Tushar Choudhari,Room No-2, Vivekanada Colony ,Kothrud ,Pune- 411038','759549216992',NULL,NULL,'Unmarried',4,NULL,1,NULL,'No',NULL,'Inactive',453,NULL,1,1,1,NULL,1,'2017-07-27 08:54:47','2017-11-06 09:05:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,'100008','EMP0000257',NULL,NULL,'Sandeep',NULL,'Gawde',NULL,'Male','9689941523',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'730768775742',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,2,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:45:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,'100009','EMP0000258',NULL,NULL,'Suhas','Bapu','Kopnar','1988-03-21','Male','7722079134',NULL,'design@indibasolutions.com','A/P - Kopnar Wasti, Yevat, Tal - Daund',1,20,504,'Pune',412214,'Same as above','216320901268','BRIPK9429H','MH-42/3/B/1002','Married',2,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:46:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,'100010','EMP0000259',NULL,NULL,'Pavan','Laxman','Choudhary','1989-07-29','Male','9370904680',NULL,'design@indibasolutions.com','S/O  Laxman D. Choudhary , Patvipura Insde Ambagate , Matakhidki Road , Opp Suresh Pawar House Amravti-44601',1,NULL,433,'Amravati',444601,'C/O PRAJAKTA A. GUJRATHI F-15 , 5TH FLOOR  SOBA SAVERA APRATMENT , BEHIND CHINTAMANI HOSPITAL , OPP TO YASHWANT HIGHSCHOOL ,BIBEWADIGAO PUNE-411037','6013','AOSPC2732H','MH27-20090012893','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:46:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,'100011','EMP0000260',NULL,NULL,'Supriya','Rajendra','Chaudhari','1985-04-03','Female','9665391344',NULL,'design@indibasolutions.com','Sukhwani Heritage,Flat No 3 ,C Wing Akurdi Pune 411035',1,20,504,'Pune',411035,'SUKHWANI HERITAGE,FLAT NO 3 ,C WING AKURDI PUNE 411035','906757990889','ALOPC8945K','MH 17 20120001756','Married',4,NULL,1,NULL,'No',NULL,'Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:46:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,'100012','EMP0000261',NULL,NULL,'Tejas','Nandkishor','Sawant','1991-12-31','Male','8855951715',NULL,'design@indibasolutions.com','Sr. No. 34/1/2 Plot No 570/5 Torna App. Behind Bharti Vidyapith Dhankawadi Pune',1,20,NULL,'Pune',411043,'Sr. No. 34/1/2 Plot no 570/5 Torna app. Behind Bharti Vidyapith Dhankawadi Pune','426341034196','DDOPS8496A',NULL,'Married',3,NULL,1,NULL,'No',NULL,'Active',307,NULL,1,1,21,NULL,1,'2017-07-27 08:54:47','2017-09-11 11:47:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,'100013','EMP0000262',NULL,NULL,'Avani','Chintamani','Dandekar','1979-12-07','Female','9604862157',NULL,'design@indibasolutions.com','C2 602, Shivsagar City, Phase-1, Anandnagar, Sinhagad Road',1,20,504,'Pune',411051,NULL,'3172',NULL,NULL,'Married',NULL,NULL,1,NULL,'No',NULL,'Inactive',453,NULL,1,1,1,NULL,1,'2017-07-27 08:54:48','2017-11-06 09:04:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(263,'100014','EMP0000263',NULL,'','Shrikant','','Chavan','1990-12-13','Male','8087061949','','design@indibasolutions.com','Pune',1,20,504,'Pune',411001,'','799186394818','','','',NULL,NULL,1,NULL,'No','','Active',257,NULL,1,1,31,NULL,1,'2017-07-27 08:54:48','2017-12-13 04:53:30',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(264,'100015','EMP0000264',NULL,'','Madhura','','Varpe',NULL,'Female','0','','design@indibasolutions.com','Pune',1,20,504,'Pune',411001,'','514375981813','','','',NULL,NULL,1,NULL,'No','','Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:53:48',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(265,'100016','EMP0000265',NULL,NULL,'Ishwar','Yashwant','Badgujar','1991-10-27','Male','9028014323',NULL,'design@indibasolutions.com','C-402, Gurukunj Apt., Dagdu Patil Nagar, Thergaon, Pune ',1,20,504,'Pune',411033,'C-402, GURUKUNJ APT., DAGDU PATIL NAGAR, THERGAON, PUNE , ','2846','AYIPB0485A','MH20 20100009364','Married',2,NULL,1,NULL,'No',NULL,'Active',307,NULL,1,1,25,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:48:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,'100017','EMP0000266',NULL,NULL,'Ashish','Baldev','Patel','1987-09-25','Male','9921401351',NULL,'design@indibasolutions.com','Golden Bells Wing B Flat No 105, Ganesh Nagar Bopkhel Pune ',1,20,504,'Pune',411031,'Golden Bells Wing B Flat No 105, Ganesh Nagar Bopkhel Pune ','490094157459','ASHPP8314K','MH1220090040638','Married',1,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,5,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:49:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(267,'100018','EMP0000267',NULL,NULL,'Yogita','Gulabrao','Jadhav','1992-03-07','Female','8796689812',NULL,'design@indibasolutions.com','At Post- Bota, Tal-Sangamner, Dist-Ahmednagar',1,20,428,'Sangamner',422602,'Yogiraj Sadan, Flat no 4, Bhelkenagar, Kothrud, Pune','861224630702','ATIPJ9922F',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:50:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,'100019','EMP0000268',NULL,NULL,'Nitin','Dipak','Aher','1990-10-11','Male','8888474847',NULL,'design@indibasolutions.com','Flat No.305,C2 Building,Umang Primo,Ivy Estate ,Wagholi',1,20,504,'Pune',412207,NULL,'729400515320','AQGPA0158D','MH16 20090010913','Married',NULL,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:49:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,'100020','EMP0000269',NULL,NULL,'Amit','Haribhau','Jagtap','1989-03-08','Male','7410091246',NULL,'design@indibasolutions.com','404,Saburi Park, Shree Ram Nagar, Lawjee, Khopoli',1,20,NULL,'Khopoli',410203,'Laxmi Prassana PG, Vidhate colony, Aundh-411007','395510574705','ALPPJ4945B',NULL,'Unmarried',NULL,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:50:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,'100021','EMP0000270',NULL,NULL,'Sachin','Narsingrao','Bellewar','1992-06-02','Male','9011168680',NULL,'design@indibasolutions.com','At Post Karkyal ',1,17,327,'Karkyal',585443,'Baner ','580975210311','FBUPS0373E','MH14 20130048216','Unmarried',4,NULL,1,NULL,'No',NULL,'Inactive',453,NULL,1,1,1,NULL,1,'2017-07-27 08:54:48','2017-12-14 10:18:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(271,'100022','EMP0000271',NULL,NULL,'Balaji','Shankarrao','Kadam','1992-06-25','Male','9823643346',NULL,'design@indibasolutions.com','Sawleshwar Ta.Kandhar Dist.Nanded ',1,20,504,'Nanded',431714,'Near sai Mandir Wadmukhwadi Charoli bk pune 412105','926828772621','DJVPK0344E',NULL,'Married',NULL,NULL,1,NULL,'No',NULL,'Active',274,NULL,1,1,23,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:51:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,'100023','EMP0000272',NULL,NULL,'Prashant','Ganpatrao','Pawar','1988-09-25','Male','8975730979',NULL,'design@indibasolutions.com','A/P- Goundwadi, Tal- Valva, Dist- Sangli',1,20,NULL,'Sangli',415413,'Mahesh Sankul, wadhgaon-sheri, pune-411014','3948',NULL,NULL,'Married',2,NULL,1,NULL,'No',NULL,'Active',257,NULL,1,1,2,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:52:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,'100024','EMP0000273',NULL,NULL,'Pankaj','Diwanji','Pasalkar','1988-06-10','Male','9762436878',NULL,'design@indibasolutions.com','Sr. No. 20/1 Punyai Nagar Pune- Satara Road Pune ',1,20,NULL,'Pune',411043,'Same as above','867770368318',NULL,NULL,'Unmarried',3,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:52:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(274,'100025','EMP0000274',NULL,NULL,'Narendra',NULL,'Purankar',NULL,'Male','9922940781',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'270493222427',NULL,NULL,NULL,NULL,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,23,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:53:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(275,'100026','EMP0000275',NULL,NULL,'Girish','Kishor','Ghodekar','1986-05-03','Male','8793263141',NULL,'design@indibasolutions.com','798, Sr. No. 10/11, Lane No. 07, Sukhsagar Nagar, Katraj, Pune.',1,20,504,'Pune',411046,'798, Sr. No. 10/11, Lane No. 07, Sukhsagar Nagar, Katraj, Pune.','4905','ATIPG9143M',NULL,'Married',4,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,5,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:53:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(276,'100027','EMP0000276',NULL,NULL,'Minal','Vijay','Dhabarde','1993-04-19','Female','9561660183',NULL,'design@indibasolutions.com','Plot No. 95, Jagdamba Apartment, Indraprastha Nagar,',1,20,488,'Nagpur',440022,'C/o Shri Kazi Hayatbi Aadam, Shivaji Park, Lane no.3, Sai chowk, New sangvi, Pune','685822883055','BXPPD3735C',NULL,'Unmarried',4,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:55:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(277,'100028','EMP0000277',NULL,NULL,'Deepakkumar','Shivkumar','Mishra',NULL,'Male','9762309747',NULL,'design@indibasolutions.com','Sr. No-24/6 B Munjabawasti Dhanori, Pune-411015',1,20,504,'Pune',411015,'Sr. No-24/6 B Munjabawasti Dhanori, Pune-411015','8820',NULL,NULL,'Married',4,NULL,1,NULL,'No',NULL,'Active',274,NULL,1,1,23,NULL,1,'2017-07-27 08:54:48','2017-09-11 11:54:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(278,'100029','EMP0000278',NULL,NULL,'Dipali','Kishor','Barge','1989-10-07','Female','7507667711',NULL,'design@indibasolutions.com','At Pst Tal - Koregaon Dist - Satara',1,20,511,'Koregaon',415501,'Soallana Soc. A Wing , Bus Stop - 16 , Thergaon','469767379194','BGFPB9152C',NULL,'Unmarried',NULL,NULL,1,NULL,'No',NULL,'Active',307,NULL,1,1,21,NULL,1,'2017-07-27 08:54:49','2017-09-11 11:55:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(279,'100030','EMP0000279',NULL,'','Amit','Subhash','Dhamdhame','1983-03-24','Male','9172229853','','design@indibasolutions.com','Sankalpa, Akshay Colony, N.D.A. Road, Warje, Pune',1,20,504,'Pune',411058,'C/o Harshal Gaikwad, Sr. No. 116/10/1 Balaji colony, House No. 2, 2nd Floor, Sus Road, Pashan, Pune 411021','6484','','','Married',4,NULL,1,NULL,'No','','Active',252,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:49','2017-09-14 04:20:57',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(280,'100031','EMP0000280',NULL,NULL,'Rashmi','Ghansham','Jethwani','1988-11-12','Female','9819833076',NULL,'design@indibasolutions.com','H B 34/1, Near Durga Mata Temple, Pimpri Pune',1,20,504,'Pimpri',411017,'same as permanent address','856407820505','AIHPJ6553A',NULL,'Unmarried',3,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:49','2017-09-11 11:56:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(281,'100032','EMP0000281',NULL,'','Atul','Ramesh','Tendulkar','1995-10-26','Male','9767534269','','design@indibasolutions.com','645\', Vrundavan, Devtale At Post Pali, Dist- Ratnagiri',1,20,506,'Ratnagiri',415803,'','204882442248','','','',4,NULL,1,NULL,'No','','Active',453,NULL,1,1,20,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:35:29',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(282,'100033','EMP0000282',NULL,NULL,'Ganesh','Jagannath','Bhosale','1986-11-06','Male','7219850626',NULL,'design@indibasolutions.com','A9,Left Bhusari Colony , Vishvesh Society , Behind Pmt Depo , Kothrud Depo Pune.',1,NULL,504,'Pune',411038,'A9,Left Bhusari colony , Vishvesh society , Behind PMT Depo , Kothrud depo pune.','515132070985','cjzpb2046m','-','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',307,NULL,1,1,25,NULL,1,'2017-07-27 08:54:49','2017-09-11 11:59:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(283,'100034','EMP0000283',NULL,NULL,'Tejas','Dilip','Shinde','1996-09-17','Male','9766953848',NULL,'design@indibasolutions.com','A/P Gunjalwadi \nTel Junner Dist Pune\n 412401',1,20,504,'Pune',412401,NULL,'557183471263','GLHPS5728F','MH1420140046816','Unmarried',2,NULL,1,NULL,'No',NULL,'Inactive',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:49','2017-09-25 07:39:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(284,'100035','EMP0000284',NULL,'','Akshay','Gorakshanath','Shinde','1995-08-01','Male','7776002708','','design@indibasolutions.com','A/P Udapur Tel Junner Dist Pune 412409',1,20,504,'Pune',412409,'ABHINAV NAGAR, OLD SANGVI PUNE 412029','484769808688','GJWPS0258F','','',NULL,NULL,1,NULL,'No','','Active',294,NULL,1,1,22,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:35:42',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(285,'100036','EMP0000285',NULL,'','Omkar','Nandaram','Pande','1995-05-02','Male','7741827881','','design@indibasolutions.com','Tejewadi Shiroli Bk . Tal Junner Dist Pune 410511 .',1,20,504,'Pune',410511,'S NO 06/1 ABHINAV NAGAR OLD SANGAVI 411027','808688247992','','','',NULL,NULL,1,NULL,'No','','Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:35:50',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(286,'100037','EMP0000286',NULL,NULL,'Amol','Mohan','Bhosale','1986-05-03','Male','9730811942',NULL,'design@indibasolutions.com','F. No 202, 2Nd Floor, Creative Complex, Ganesh Nagar, Pimple Nilakh, ',1,20,504,'Pune',411027,'Same as above','679413735305','ANBPB6507H',NULL,'Married',NULL,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,5,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:01:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,'100038','EMP0000287',NULL,NULL,'Rahul','Namdev','Kadlag','1991-05-14','Male','9096499057',NULL,'design@indibasolutions.com','At: Sadatpur',1,NULL,NULL,'Sangamner',413736,NULL,'928327281502','CDDPK7014A','MH17 20150008822','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:02:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,'100039','EMP0000288',NULL,NULL,'Abhijeet','Munjaba','Kumbhar','1990-10-23','Male','8087680316',NULL,'design@indibasolutions.com','Omkar Colony, Lane Number 2, Warje Malwadi',1,20,NULL,'Pune',411058,NULL,'5642',' CRGPK3905H',NULL,'Unmarried',NULL,NULL,1,NULL,'No',NULL,'Inactive',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:49','2017-12-14 10:18:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,'100040','EMP0000289',NULL,NULL,'Aniket','Bhagwan','Mande','1990-10-02','Male','7757833122',NULL,'design@indibasolutions.com','253/1,Devmala,Water Tank,Madhewadgaon,Tal-Shrigonda, Dist.-Ahmadnagar',1,20,NULL,'Shrigonda',413726,'Flat no-19,Dhanlaxmi Complex,Opp. Tulja Bhawani Mandir, near zeal college,Narhe , Pune','581620762388','BVCPM7749E','MH1620120001222','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',307,NULL,1,1,21,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:02:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,'100041','EMP0000290',NULL,NULL,'Balasaheb','Subhash','Yandayat','1991-07-20','Male','9762484605',NULL,'design@indibasolutions.com','At : Karjat, Post: Hastpokhari, Tq: Ambad, Dist : Jalna',1,20,468,'Ambad',431204,NULL,'264957970152','AHQPY5229G',NULL,'Married',3,NULL,1,NULL,'No',NULL,'Active',257,NULL,1,1,2,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:04:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,'100042','EMP0000291',NULL,NULL,'Yuvraj','Mohan','Pawar','1987-05-20','Male','9503232020',NULL,'design@indibasolutions.com','A/P Maloli, Tal-Malshiras, Dist- Solapur',1,20,517,'Akluj',413113,'\"“Vighnaharta Tower“   6  Floor Flat No.42, Sr No.15/20/21B/8, Ambegaon Pathar, Pune-411043.','4094','BFHPP0523C','MH4520130011751','Married',4,NULL,1,NULL,'No',NULL,'Active',453,NULL,1,1,1,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:04:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(292,'100043','EMP0000292',NULL,NULL,'Sagar','Ravasaheb','Patil',NULL,'Male','9970125087',NULL,'design@indibasolutions.com','280B, At Post - Hitani, Tal- Hukkeri, Dist-Belgaum',1,NULL,322,'Hukkeri',591225,'H. No. 3542/5 Dhamalwadi, Phursungi, Pune','549854772490','BCOPP2166H','KA2320140014727','Married',4,NULL,1,NULL,'No',NULL,'Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:05:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(293,'100044','EMP0000293',NULL,NULL,'Vivek','Vinayak','Dhalgade','1991-07-17','Male','8308432376',NULL,'design@indibasolutions.com','Hall No 102,Sanjay Niwas,Villege-Kadaknathwadi.',1,20,495,'Tal-Washi',413503,'Jay maharashtra chowk,Bhosari,pune.','4101','CQXPD6225R',NULL,'Married',3,NULL,1,NULL,'No',NULL,'Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:49','2017-09-11 12:05:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,'100045','EMP0000294',NULL,NULL,'Nikhil','Rajendra','Patankar','1988-12-07','Male','8452800752',NULL,'design@indibasolutions.com','B/36, Shree Shaktidham, Chs, Shreenagar , Thane (West)',1,20,520,'Thane',400604,'Flat No-16, Building No.2, Pratik Nagar, Sector-2, Yerawada, Pune','915126010517','BCYPP1379Q','MH0420080024629','Married',3,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:05:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(295,'100046','EMP0000295',NULL,'','Bhushan','Manohar','Nemade',NULL,'Male','9730833096','','design@indibasolutions.com','A/P Rozoda, Tel Raver Dist Jalgaon 425504',1,20,NULL,'Jalgaon',425504,'RAJNIGANDHA HOUSEING SOC WALHEKARWADI CHINCHWAD PUNE 411033','725655774910','AOMPN0985P','MH1920120029798','',4,NULL,1,NULL,'No','','Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:35:58',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(296,'100047','EMP0000296',NULL,'','Mahesh','','Kenche',NULL,'Male','9764537239','','design@indibasolutions.com','Pune',1,20,504,'Pune',411001,'','0','','','',NULL,NULL,1,NULL,'No','','Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:36:57',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(297,'100048','EMP0000297',NULL,'','Gaurav','Vilas','Tadwalkar','1986-02-09','Male','9960388655','','design@indibasolutions.com','160 B Rastapeth Near Kem Hospital',1,20,NULL,'Pune',411011,'AS PER ABOVE','450592910824','AEUPT3668M','','',3,NULL,1,NULL,'No','','Active',304,NULL,1,1,20,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:36:07',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(298,'100049','EMP0000298',NULL,NULL,'Pooja','Mohan','Kulkarni','1989-07-18','Female','8975972254',NULL,'design@indibasolutions.com','Orchid, Fl No 5, Pl No 79, Rambaug Col. Paud Road Pune',1,20,504,'Pune',411038,'As above','468978579554',NULL,NULL,'Unmarried',4,3,1,NULL,'No',NULL,'Inactive',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:50','2017-12-30 08:17:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(299,'100050','EMP0000299',NULL,NULL,'Kalyani','Sham','Navale','1990-12-20','Female','8956248394',NULL,'design@indibasolutions.com','301, Sai Vihar(A), Near Naik Hospital, Kathelane, Dwarka, Nashik.',1,20,492,'Nashik',422011,'B-102, Kamdhenu Riddhhi, Mahatma Ho. Soc., Near Eklavya Engg. College, Kothrud, Pune.','642390880043','AIOPN7828B','MH15-20110037995','Married',5,NULL,1,NULL,'No',NULL,'Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:06:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,'100051','EMP0000300',NULL,'','Dhanesh','Ashok','Bankhile','1994-05-27','Male','8482939243','','design@indibasolutions.com','Pardeshpura,Ajuman Stop,Samrudhi Arcade Flat-2,Tal-Junnar,Dist-Pune',1,20,504,'Junner',410502,'AKURDI,DALVINAGAR,MANISHA APP FLT-2,TAL-HAVELI,DIST-PUNE','592711328914','CBRPB3068B','PROSESS','',2,NULL,1,NULL,'No','','Active',294,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:40:57',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(301,'100052','EMP0000301',NULL,NULL,'Shubham','Rajaram','Patel','1993-01-01','Male','7588735857',NULL,'design@indibasolutions.com','At Post Bhade Tal Shahada Dist Nandurbar',1,20,490,'Shahada',425409,'G204 Ruby Park Park Street Wakad Pune','983707828588','CWHPP4972K','MH39 20130004521','Unmarried',4,NULL,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:07:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,'100053','EMP0000302',NULL,NULL,'Kiran','Vijay','Mohol','1989-07-29','Male','9637319479',NULL,'design@indibasolutions.com','2 B Jai Bhavani Nagar, Paud Road, Kothrud, Pune ',1,NULL,504,'Pune',411038,'2 B Jai Bhavani Nagar, Paud Road, Kothrud, Pune 411038','415333979207',NULL,NULL,'Unmarried',NULL,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,5,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:07:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(303,'100054','EMP0000303',NULL,NULL,'Raviraj','Madhukar','Karale','1991-02-05','Male','9503786805',NULL,'design@indibasolutions.com','\"Sarvadnya\", Vidya Colony, Opp. Huduko, Pipe Line Road, Savedi',1,20,428,'Ahmednagar',414003,'\"Yashada Nakshtra \", Galli no.4 Vishwashanti, PimpleSaudagar , Pune 411027','384720931074','CAVPK4329P',NULL,'Unmarried',3,3,1,NULL,'No',NULL,'Active',254,NULL,1,1,29,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:07:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,'100055','EMP0000304',NULL,'','Subal','Shivanand','Siddharth','1981-01-05','Male','9146003710','34','design@indibasolutions.com','\"Shivanand Villa\", Row House No D1,Morning Dew,Undri,Pune ',1,20,504,'Pune',411060,'Flat No B1- 901,Akshar Elementa,Bhumkar Chowk,Wakad Pune','831654320147','BLQPS1739A','','Married',3,3,1,1,'No','','Active',252,NULL,1,1,24,NULL,1,'2017-07-27 08:54:50','2017-09-15 09:30:17','Subal_Photo.JPG','image/jpeg',10807,'2017-09-12 12:04:24','',NULL,NULL,NULL,NULL,NULL,'','7387624242'),(305,'100056','EMP0000305',NULL,NULL,'Vrushali','Daulatrao','Patade','1988-02-29','Female','9665490261',NULL,'design@indibasolutions.com','Plot No 5 Radha Nagar, Chaudhari Mala, Hanumanwadi, Panchavati, Nashik',1,20,492,'Nashik',422003,'602, Rakshak Nagar Gold, Kharadi, Pune - 42214','595592322534','CHMPP7671K',NULL,'Married',4,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,NULL,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:09:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,'100057','EMP0000306',NULL,NULL,'Nikhil','Nivrutti','Jadhav','1990-04-23','Male','9922573099',NULL,'design@indibasolutions.com','Sr.No.108/1,Kate Wasti No-1,Kale Colony,Alandi,Tal-Haveli, Dist-Pune',1,20,NULL,'Pune',412105,'Same as above','485495216140','ANAPJ1216C',NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Active',274,NULL,1,1,23,NULL,1,'2017-07-27 08:54:50','2017-09-11 12:10:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(307,'100058','EMP0000307',NULL,'Mr.','Parag','Bhagwan','Kirange','1987-08-01','Male','9767916662','33','design@indibasolutions.com','H No 26, Main Road Savkheda Sim Opp Sbi Post - Dahigaon Tal - Yawal Dist - Jalgaon',1,20,1033,'Yawal',425301,'Lane no 01 Yashwant Nagar Kharadi Pune','360009253648','BYXPK3588D','MH1920080002851','UnMarried',5,3,1,1,'No','','Active',304,NULL,1,1,24,NULL,1,'2017-07-27 08:54:50','2017-09-16 10:41:13','PP.jpg','image/jpeg',71170,'2017-09-16 10:41:13','',NULL,'vishal_signature.jpg','image/jpeg',17638,'2017-09-11 09:14:28','',''),(308,'100059','EMP0000308',NULL,'Mr.','Kiran','Dadasaheb','Shinde','1987-10-28','Male','','','design@indibasolutions.com','Rajlaxmi Appartment, Bhavani Nagar, Market Yard Road, Ahmednagar',1,20,428,'Ahmednagar',414001,'205 Sky Height, Opposite Sunshree Gold, NIBM Road, Kondhwa.','988274386867','BOTPS4024L','','',NULL,NULL,1,NULL,'No','','Active',304,NULL,1,1,24,NULL,1,'2017-07-27 08:54:50','2017-09-15 05:52:43',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','9404282828'),(309,'200001','EMP0000309',NULL,NULL,'Arun','Sukhadev','Hire','1971-01-06','Male','9881495955',NULL,'design@indibasolutions.com','Sanswadi',1,20,504,'Pune',412208,'SANASWADI','256246946004','ABBPH0269E',NULL,'Married',1,NULL,1,NULL,'No',NULL,'Active',252,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:50','2017-09-11 12:10:36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,'200002','EMP0000310',NULL,'','Vaijinath','Bhimrao','Gore','1978-08-10','Male','9823814175','','design@indibasolutions.com','Paranda',1,20,495,'Paranda',413502,'SANASWADI','493753234171','','','Married',1,NULL,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:50','2017-09-11 12:37:18',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(311,'200003','EMP0000311',NULL,'','Uttam','Shrimant','Jagdale','1959-06-01','Male','9922416654','','design@indibasolutions.com','Kalewadi,Pimpri,Pune',1,20,504,'Pune',411017,'KALEWADI,PIMPRI,PUNE','907274870102','','','Married',NULL,NULL,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:37:27',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(312,'200004','EMP0000312',NULL,'','Sambhaji','Shivaji','Galande','1983-03-05','Male','9921347051','','design@indibasolutions.com','A/P-Ban Pimpri',1,20,NULL,'Ahamadnagar',414101,'SANASWADI','640825056469','ALHPG0059M','MH1420090025813','Married',2,NULL,1,NULL,'No','','Active',309,NULL,1,1,20,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:39:32',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(313,'200005','EMP0000313',NULL,'','Anil','Laxman','Hajare','1984-05-23','Male','8605009982','','design@indibasolutions.com','At Post. Kati, Tel.Indapur, Pune.',1,20,504,'Indapur',413106,'SANSWADI','743076659830','ACPPH8455D','','Married',3,NULL,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:41:47',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(314,'200006','EMP0000314',NULL,'','Chakradhar','Tatyaso','Divekar','1990-08-20','Male','9503805611','','design@indibasolutions.com','A/P-Varvand Tal-Daund,Dist-Pune.',1,20,504,'Pune',412215,'','604482996085','','','',NULL,NULL,1,NULL,'No','','Active',309,NULL,1,1,29,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:34:50',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(315,'200007','EMP0000315',NULL,'','Ashok','Ganpat','Uttekar',NULL,'Male','9075008684','','design@indibasolutions.com','Sai Tej Apts Pimple Gurav Sr No- 31/2Navacha Road',1,20,504,'Pune',411027,'SAI TEJ APTS PIMPLE GURAV SR NO- 31/2NAVACHA ROAD','0','ABRPU6855B','MH1220030446736','Married',4,NULL,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:39:52',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(316,'200008','EMP0000316',NULL,'','Pandey','','D.P',NULL,'Male','0','','design@indibasolutions.com','Pune',1,20,504,'Pune',411001,'','0','','','',NULL,NULL,1,NULL,'','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:40:02',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(317,'200009','EMP0000317',NULL,NULL,'Satish','Shrikantrao','Kulkarni','1992-01-13','Male','9561917585',NULL,'design@indibasolutions.com','At/Post:Chikhurda,',1,20,480,'Latur',413511,'Pune','252216780960',NULL,NULL,'Unmarried',1,NULL,1,NULL,'No',NULL,'Inactive',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-15 10:20:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(318,'200010','EMP0000318',NULL,NULL,'Atmaram',NULL,'Pharate',NULL,'Male','9579341641',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'933392382622',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:12:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(319,'200011','EMP0000319',NULL,NULL,'Manohar','Laxman','Sandbhor','1987-08-16','Male','9657707074',NULL,'design@indibasolutions.com','A/P- Shikrapur,Tal-Shirur',1,20,504,'Pune',412208,'A/P-SHIKRAPUR TAL-SHIRUR,DIST-PUNE','866414803770','DXGPS7964R',NULL,'Married',2,NULL,1,NULL,'No',NULL,'Active',309,NULL,1,1,2,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:13:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(320,'200012','EMP0000320',NULL,NULL,'Pankaj','Sadashiv','Jadhav','1989-04-27','Male','9881317136',NULL,'design@indibasolutions.com','At-Jadhavwadi,Post-Ranjani,Tal-Ambegaon,Dist-Pune',1,20,504,'Pune',410504,'-','917628309450',NULL,NULL,'Married',3,NULL,1,NULL,'No',NULL,'Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:13:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(321,'200013','EMP0000321',NULL,'','Anil','Devidas','Jamgade','1967-12-09','Male','9049228450','','design@indibasolutions.com','At Post. Chairman Vasti Sanaswadi Tal. Shirur Dist. Pune',1,20,504,'Shirur',412210,'At Post. Chairman vasti Sanaswadi Tal. Shirur Dist. Pune','550483446139','','','',NULL,2,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:40:11',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(322,'200014','EMP0000322',NULL,'','Samirkumar','Nareshchandra','Saha','1960-10-15','Male','8786857942','','design@indibasolutions.com','At Post. Gajanan Mangal Karyalaya Shikrapur Tal. Shirur Dist. Pune',1,20,504,'Shirur',412210,'At Post. Gajanan Mangal Karyalaya Shikrapur Tal. Shirur Dist. Pune','468255761806','','','',NULL,2,1,NULL,'No','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:40:21',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(323,'200015','EMP0000323',NULL,NULL,'M','Bharath','Mahendran','1992-06-15','Male','9763904508',NULL,'design@indibasolutions.com','3/263 Mahadevagollahalli, (Post & Village), Pochampalli(Tk)',1,NULL,794,'Krishnagiri',635206,'No 12, Ganesh appartment , Opp Sachine Forge , Sanaswadi 412208, Pune Maharastra,','386774416291','BOSPB9846J','TN2420120005804','Unmarried',3,NULL,1,NULL,'No',NULL,'Active',309,NULL,1,1,43,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:14:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(324,'200016','EMP0000324',NULL,NULL,'Amol','Dattatray','Dhokare','1991-05-22','Male','8805731319',NULL,'design@indibasolutions.com','At/Po - Sakurdi ,Tel - Khed, Dist -Pune.',1,20,504,'Rajgurunagar',410505,NULL,'787260701894',NULL,NULL,'Unmarried',NULL,3,1,NULL,'No',NULL,'Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:14:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,'200017','EMP0000325',NULL,'','Sachin','','Bhandgar',NULL,'Male','0','','design@indibasolutions.com','Pune',1,20,504,'Pune',411001,'','403071313210','','','',NULL,NULL,1,NULL,'','','Active',309,NULL,1,1,NULL,NULL,2,'2017-07-27 08:54:51','2017-09-11 12:40:33',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(326,'300001','EMP0000326',NULL,NULL,'Ksheer',NULL,'Patel',NULL,'Male','9039998650',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'0',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',304,NULL,1,1,5,NULL,3,'2017-07-27 08:54:51','2017-09-11 12:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(327,'300002','EMP0000327',NULL,NULL,'Anik',NULL,'Chanda','1982-09-24','Male','9474370053',NULL,'design@indibasolutions.com','28, Ananda Mohan Basu Road, Babu Para',1,36,986,'Siliguri',734004,NULL,'303308896196','AGTPC0128Q','WB7320120067161','Single',3,NULL,1,NULL,'No',NULL,'Active',304,NULL,1,1,5,NULL,3,'2017-07-27 08:54:52','2017-09-11 12:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(328,'300003','EMP0000328',NULL,'','Sanjay','','Chaudhary','1986-12-15','Male','8882846398','','design@indibasolutions.com','Karwan',1,5,NULL,'Arrah',802312,'124 A , Boring Road, Patna, Bihar, 800001','897666837517','AJFPC9993C','DL-1320130161568','Married',1,NULL,1,NULL,'No','','Active',304,NULL,1,8,46,NULL,3,'2017-07-27 08:54:52','2017-09-11 12:18:01',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(329,'300004','EMP0000329',NULL,NULL,'Pintu',NULL,'Badajena',NULL,'Male','9692546014',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'314122217503',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',304,NULL,1,1,5,NULL,3,'2017-07-27 08:54:52','2017-09-11 12:18:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(330,'300005','EMP0000330',NULL,NULL,'Raghunath',NULL,'Pillari',NULL,'Male','9642671129',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'4621',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',304,NULL,1,1,5,NULL,3,'2017-07-27 08:54:52','2017-09-11 12:18:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,'300006','EMP0000331',NULL,NULL,'Narendra',NULL,'Bhardwaj',NULL,'Male','0',NULL,'design@indibasolutions.com','Pune',1,20,504,'Pune',411001,NULL,'876850453383',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Active',304,NULL,1,1,5,NULL,3,'2017-07-27 08:54:52','2017-09-11 12:19:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,'100073','EMP0000332',NULL,'Mrs.','Shobhana','','Mahajan','1988-02-29','Female','9665490261','','design@indibasolutions.com','Pune',1,20,504,'Pune',411021,'Pune','','','','Married',4,3,1,1,'No','','Active',304,NULL,1,1,20,NULL,1,'2017-08-22 06:40:22','2017-11-28 08:59:22',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',''),(333,'400112','EMP0000333',NULL,'Mrs.','AABC','','','2017-08-23','','','','design@indibasolutions.com','Pune',1,2,5,'',NULL,'','','','','',NULL,NULL,NULL,NULL,'',NULL,'Active',NULL,NULL,1,3,10,NULL,3,'2017-08-23 11:29:26','2017-08-23 11:29:26',NULL,NULL,NULL,NULL,'',1,NULL,NULL,NULL,NULL,NULL,NULL),(334,'400001','EMP0000334',NULL,'Mr.','Bhagbat',NULL,'Behera','1987-07-11','Male','8280430103','0','design@indibasolutions.com','At-New Balanda, Po-Handiduha,Talcher, Anugul-759100',1,26,599,'New Balanda',759100,'At-New Balanda, Po-Handiduha,Talcher, Anugul-759100','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:34:41',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(335,'400002','EMP0000335',NULL,'Mr.','Anil',NULL,'Parasar','1981-06-18','Male','8594999251','0','design@indibasolutions.com','Mantri Chak, Hanuman Mandir Gali, Baripada, Mayurbhanj',1,26,1104,'Baripada',757003,'Mantri Chak, Hanuman Mandir Gali, Baripada, Mayurbhanj','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:35:26',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8594999385','0'),(336,'400003','EMP0000336',NULL,'Mr.','Anjan','Kumar','Behera','1987-04-07','Male','8280340092','0','design@indibasolutions.com','At- Sadanandapur Pur,Po-Amarda Roed, Dist-Balasore-756030',1,26,601,'Balasore',756030,'At- Sadanandapur Pur,Po-Amarda Roed, Dist-Balasore-756030','0',NULL,NULL,'Unmarried',5,2,1,1,NULL,NULL,'Active',329,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:35:25',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'7381569425','0'),(337,'400004','EMP0000337',NULL,'Mr.','Amar','Kumar','Das','1991-01-24','Male','8280340102','0','design@indibasolutions.com','At-Tulasichoura,Po-Takatpur, Via-Baripada,Dist-Mayurbhanj,Pin-757003',1,26,1104,'Baripada',757003,'At-Tulasichoura,Po-Takatpur, Via-Baripada,Dist-Mayurbhanj,Pin-757003','0',NULL,NULL,'Unmarried',1,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:36:02',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9853150033','0'),(338,'400005','EMP0000338',NULL,'Mr.','Ranjan','Kumar','Parida','1990-07-04','Male','8280340105','0','design@indibasolutions.com','At-Tentulia, Po-Ranibandh, Via-Badasahi, Ps-Khunta, Dist-Mayurbhanj',1,26,1104,'Baripada',757003,'At-Tentulia, Po-Ranibandh, Via-Badasahi, Ps-Khunta, Dist-Mayurbhanj','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:36:02',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9938690990','0'),(339,'400006','EMP0000339',NULL,'Mr.','Sairam',NULL,'Sethi','1993-03-20','Male','8280340104','0','design@indibasolutions.com','C/O-Laxmidhar Sethi, At-Takadida, Po-Patagadia, Ps-Rasgovindpur, Dist-Mayurbhanj, Pin-757016',1,26,1104,'Rasgovindpur',100000,'C/O-Laxmidhar Sethi, At-Takadida, Po-Patagadia, Ps-Rasgovindpur, Dist-Mayurbhanj, Pin-757016','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:36:41',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9938971314','0'),(340,'400007','EMP0000340',NULL,'Mr.','Safalya','Kumar','Sahoo','1993-08-31','Male','8280340107','0','design@indibasolutions.com','At-Murgabadi,Bijayra Mchandrapur, Po-Bhanjpur, Dist-Baripada, Pin-757001',1,26,1104,'Bhanjpur',757001,'At-Murgabadi,Bijayra Mchandrapur, Po-Bhanjpur, Dist-Baripada, Pin-757001','0',NULL,NULL,'Unmarried',1,2,1,1,NULL,NULL,'Active',342,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:36:42',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9090800964','0'),(341,'400008','EMP0000341',NULL,'Mr.','Santanu','Kumar','Sahoo','1985-05-25','Male','8280340112','0','design@indibasolutions.com','At-Dagarasahi,Po-Charampa, Dist-Bhadrak, Pin-756101',1,26,1038,'Bhadrak',756101,'At-Dagarasahi,Po-Charampa, Dist-Bhadrak, Pin-756101','0',NULL,NULL,'Married',4,2,1,1,NULL,NULL,'Active',NULL,NULL,1,9,1,NULL,4,'2017-11-02 05:32:38','2017-11-02 05:32:38',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9337668010','0'),(342,'400009','EMP0000342',NULL,'Mr.','Santanu','Kumar','Jena','1989-03-03','Male','8280340109','0','design@indibasolutions.com','At-Railway Colony, Qt No.El/57, Unit-B, Balasore, Pin-756001',1,26,601,'Balasore',753001,'At-Railway Colony, Qt No.El/57, Unit-B, Balasore, Pin-756001','0',NULL,NULL,'Married',1,2,1,1,NULL,NULL,'Active',253,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:37:10',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'6782','0'),(343,'400010','EMP0000343',NULL,'Mr.','Bibhudatta',NULL,'Bhatta','1986-03-03','Male','8280340091','0','design@indibasolutions.com','At-Bisarpur, Po-Prataparudrapur, Ps-Balianta, Dist-Khurda, Pin-753001',1,26,613,'Bhubaneswar',753001,'At-Bisarpur, Po-Prataparudrapur, Ps-Balianta, Dist-Khurda, Pin-753001','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',304,NULL,1,9,7,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:37:34',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9439954290','0'),(344,'400011','EMP0000344',NULL,'Mr.','Jagannath',NULL,'Samantaray','1986-10-20','Male','8280340096','0','design@indibasolutions.com','At-Narayabnpur Panta, Po- Narayanpur, Via-Pratppur,Dist- Balasore, Pin-756083',1,26,601,'Narayanpur',756083,'At-Narayabnpur Panta, Po- Narayanpur, Via-Pratppur,Dist- Balasore, Pin-756083','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',329,NULL,1,9,53,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:37:56',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'7064279069','0'),(345,'400013','EMP0000345',NULL,'Mr.','Kedar','Nath','Pradhan','1987-05-10','Male','8280340114','0','design@indibasolutions.com','At/Po-Katisahi, Via-Kamarda, Balasore-756035',1,26,601,'Balasore',756035,'At/Po-Katisahi, Via-Kamarda, Balasore-756035','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',NULL,NULL,1,10,1,NULL,4,'2017-11-02 05:32:38','2017-11-02 05:32:38',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(346,'400014','EMP0000346',NULL,'Mr.','Brajanarayan',NULL,'Sahoo','1988-06-17','Male','8280340115','0','design@indibasolutions.com','At-Bikasnagar,Annagagadia,Dist-Balesore-756001',1,26,601,'Annagagadia',756001,'At-Bikasnagar,Annagagadia,Dist-Balesore-756001','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',347,NULL,1,10,49,NULL,4,'2017-11-02 05:32:38','2017-11-15 04:39:19',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(347,'400015','EMP0000347',NULL,'Mr.','Ajay','Kumar','Sahoo',NULL,'Male','9692546014','0','design@indibasolutions.com','Kadammal, Rameed, Ps-Khetrarajpur, Sambalpur-768006',1,26,607,'Bhuban ',759017,'Kadammal, Rameed, Ps-Khetrarajpur, Sambalpur-768006','0',NULL,NULL,NULL,NULL,2,1,1,NULL,NULL,'Active',253,NULL,1,10,49,NULL,4,'2017-11-02 05:32:38','2017-11-15 09:51:18',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(348,'400016','EMP0000348',NULL,'Mr.','Trusar','Ranjan','Mishra','1990-05-19','Male','8280340118','0','design@indibasolutions.com','At-Gopinathpur,Ps-Baramba, Cuttack-754031',1,26,606,'Baramba',754031,'At-Gopinathpur,Ps-Baramba, Cuttack-754031','0',NULL,NULL,'Unmarried',1,2,1,1,NULL,NULL,'Active',347,NULL,1,10,49,NULL,4,'2017-11-02 05:32:39','2017-11-15 04:39:20',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(349,'400017','EMP0000349',NULL,'Mr.','Gobinda','Ballava','Behera','1986-06-10','Male','8280340095','0','design@indibasolutions.com','Infront Of Bidutor Colony, Berhampur, Ganjam-751006',1,26,1106,'Berhampur',751006,'Infront Of Bidutor Colony, Berhampur, Ganjam-751006','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',425,NULL,1,9,1,NULL,4,'2017-11-02 05:32:39','2017-11-15 06:37:57',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(350,'400018','EMP0000350',NULL,'Mr.','Anand',NULL,'Meshram','1987-12-15','Male','8236012156','0','design@indibasolutions.com','Rajnandgaon, Rajnandgaon,Cg-517234',1,7,1057,'Rajnandgaon',517234,'Rajnandgaon, Rajnandgaon,Cg-517234','0',NULL,NULL,'Married',NULL,2,1,1,NULL,NULL,'Active',NULL,NULL,1,3,1,NULL,4,'2017-11-02 05:32:39','2017-11-02 05:32:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(351,'400019','EMP0000351',NULL,'Mr.','Mahnedra',NULL,'Sindhare','1970-10-16','Male','9826118839','0','design@indibasolutions.com','Raipur, Raipur, Chhattisgarh-492001',1,7,129,'Raipur',492001,'Raipur, Raipur, Chhattisgarh-492001','0',NULL,NULL,'Married',3,2,1,1,NULL,NULL,'Active',253,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 04:48:06',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(352,'400020','EMP0000352',NULL,'Mr.','Rajkumar',NULL,'Singh',NULL,'Male','9111700217','0','design@indibasolutions.com','Bilaspur, Bilaspur,Chhattisgarh-495001',1,7,117,'Bilaspur',495001,'Bilaspur, Bilaspur,Chhattisgarh-495001','0',NULL,NULL,'Married',NULL,2,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 04:48:43',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(353,'400021','EMP0000353',NULL,'Mr.','Divendra',NULL,'Soni','1987-06-11','Male','7008246273','0','design@indibasolutions.com','Tulshipur Sangam Chowk Ward No-18 Dist-Rajnandgaon,Pin-491441',1,7,1057,'Rajnandgaon',491441,'Tulshipur Sangam Chowk Ward No-18 Dist-Rajnandgaon,Pin-491441','0',NULL,NULL,'Unmarried',1,2,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 04:49:25',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9329811420','0'),(354,'400022','EMP0000354',NULL,'Mr.','Vishwanath',NULL,'G',NULL,'Male','0','0','design@indibasolutions.com',NULL,1,7,1061,NULL,100000,NULL,'0',NULL,NULL,'Married',NULL,2,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-02 05:32:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(355,'400023','EMP0000355',NULL,'Mr.','Devendra ',NULL,'Kundhalkar','1988-06-30','Male','9691817466','0','design@indibasolutions.com','Linji, Balghat, Madhya Pradesh-481222',1,23,544,'Lanji',481222,'Linji, Balghat, Madhya Pradesh-481222','741235622502',NULL,NULL,'Married',4,2,1,1,NULL,NULL,'Active',351,NULL,1,3,48,NULL,4,'2017-11-02 05:32:39','2017-11-15 04:50:07',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(356,'400024','EMP0000356',NULL,'Mr.','Rath','Ram','Karsh','1981-09-03','Male','7828227425','0','design@indibasolutions.com','Baloda Bazar, Balod Bazar,Chhattisgarg-493344',1,7,1036,'Baloda Bazar',493344,'Baloda Bazar, Balod Bazar,Chhattisgarg-493344','0',NULL,NULL,'Married',1,2,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-02 05:32:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(357,'400025','EMP0000357',NULL,'Mr.','Ashish',NULL,'Satpute','1988-03-26','Male','7828806124','0','design@indibasolutions.com','Surbhi Nagar W. No. 24 Balaghat Madhya Pradesh',1,23,544,'Balaghat',481001,'Surbhi Nagar W. No. 24 Balaghat Madhya Pradesh','0',NULL,NULL,'Married',4,2,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-02 05:32:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9584758906','0'),(358,'400026','EMP0000358',NULL,'Mr.','Anirudha',NULL,'Singh','1990-01-20','Male','7331171604','0','design@indibasolutions.com','Hatikholia Post, Soro Via, Balasore Dist., Odissa, Pin-756045',1,26,601,'Balasore',756045,'Hatikholia Post, Soro Via, Balasore Dist., Odissa, Pin-756045','0',NULL,NULL,'Married',1,2,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 05:06:30',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9777515018','0'),(359,'400027','EMP0000359',NULL,'Mr.','Prakash','Prasad','Saha','1988-07-05','Male','8280340126','0','design@indibasolutions.com','At-Dargadahi, Word No-19, Po-Baripada, Dist-Mayurbhanj, Pin-757001',1,26,1104,'Bhanjpur',757001,'At-Dargadahi, Word No-19, Po-Baripada, Dist-Mayurbhanj, Pin-757001','0',NULL,NULL,'Married',4,2,1,1,NULL,NULL,'Active',391,NULL,1,4,15,NULL,4,'2017-11-02 05:32:39','2017-12-26 07:15:58',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8270672871','0'),(360,'400028','EMP0000360',NULL,'Mr.','Md.',NULL,'Azhar','1992-12-15','Male','8280340127','0','design@indibasolutions.com','At-Kalikapur, W No-24, Dist-Mayurbhanj,Pin-757001',1,26,1104,'Baripada',757001,'At-Kalikapur, W No-24, Dist-Mayurbhanj,Pin-757001','0',NULL,NULL,'Unmarried',4,2,1,NULL,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 05:09:19',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9439891750','0'),(361,'400029','EMP0000361',NULL,'Mr.','Navneet',NULL,'Mishra','1987-03-19','Male','9407945088','0','design@indibasolutions.com','Durg, Durg, Chhattisgarh-491001',1,7,120,'Durg',491001,'Durg, Durg, Chhattisgarh-491001','0',NULL,NULL,'Married',NULL,2,1,1,NULL,NULL,'Active',253,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 05:20:49',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(362,'400030','EMP0000362',NULL,'Mr.','Basant','Kumar','Das','1995-03-05','Male','8658860450','0','design@indibasolutions.com','At/Po-Naranpur, Ps-Barhampur, Dist-Balasore, Pin-756001',1,26,601,'Balasore',756001,'At/Po-Naranpur, Ps-Barhampur, Dist-Balasore, Pin-756001','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',401,NULL,1,3,51,NULL,4,'2017-11-02 05:32:39','2017-11-15 05:24:27',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9668273413','0'),(363,'400031','EMP0000363',NULL,'Mr.','Chandra','Kanta','Pradhan','1992-05-28','Male','8280340121','0','design@indibasolutions.com','At-Patada, Po-Jugpura, Dist-Mayurbhanj',1,26,1104,'Baripada',757003,'At-Patada, Po-Jugpura, Dist-Mayurbhanj','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:39','2017-11-15 05:25:53',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9778453658','0'),(364,'400032','EMP0000364',NULL,'Mr.','Premanand',NULL,'Swain','1993-07-14','Male','7008220189','0','design@indibasolutions.com','At- Parudi,Po- Pandua, Dist-Jagatsinghpur, Pin-754103',1,26,1103,'Jagatsinghpur',754103,'At- Parudi,Po- Pandua, Dist-Jagatsinghpur, Pin-754103','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:25:54',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9438280732','0'),(365,'400033','EMP0000365',NULL,'Mr.','Pratap','Kumar','Maharana','1988-07-10','Male','9040195628','0','design@indibasolutions.com','At- Balarampur, Ward No-3, ,Po-Bhanjpur, Baripada-757002',1,26,1104,'Baripada',757002,'At- Balarampur, Ward No-3, ,Po-Bhanjpur, Baripada-757002','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:25:56',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(366,'400034','EMP0000366',NULL,'Mr.','Abir','Kumar','Kundu','1989-05-31','Male','9630474717','0','design@indibasolutions.com','Bhilai, Durg. Chhaattisgarh-490006',1,7,120,'Bhilai',490006,'Bhilai, Durg. Chhaattisgarh-490006','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:25:57',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(367,'400035','EMP0000367',NULL,'Mr.','Atul','Mekal','Minj','1988-07-31','Male','9407943672','0','design@indibasolutions.com','Plot No-303/1, Vandanta Nagar, Umerpoti, Bhilai, Durg-491107',1,7,120,'Bhilai',491107,'Plot No-303/1, Vandanta Nagar, Umerpoti, Bhilai, Durg-491107','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:25:58',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(368,'400036','EMP0000368',NULL,'Mr.','Ranjeet',NULL,'Behara',NULL,'Male','9178865513','0','design@indibasolutions.com','Jagnath Bihar, Bagdevi Road, Bhanjnagar, Dist-Ganjam, Pin-761126',1,26,1106,'Bhanjanagar',761126,'Jagnath Bihar, Bagdevi Road, Bhanjnagar, Dist-Ganjam, Pin-761126','0',NULL,NULL,'Unmarried',NULL,2,1,1,NULL,NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:34:52',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(369,'400037','EMP0000369',NULL,'Mr.','Suresh',NULL,'P',NULL,'Male','0','0','design@indibasolutions.com',NULL,1,2,1061,NULL,100000,NULL,'0',NULL,NULL,'Unmarried',NULL,2,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-02 05:32:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(370,'400038','EMP0000370',NULL,'Mr.','Suraj',NULL,'Agrawal',NULL,'Male','9406416480','0','design@indibasolutions.com',NULL,1,7,1061,NULL,100000,NULL,'0',NULL,NULL,'Unmarried',NULL,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 05:35:10',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(371,'400039','EMP0000371',NULL,'Mr.','Ashok','Kumar','Dewangan','1992-06-20','Male','9174633757','0','design@indibasolutions.com','Ara Jagriti Chowk Camp-2. Santoshi,City-: Bhilai, Dist.-: Durg,Pin Code-: 490001                          ',1,7,120,'Bhilai',490001,'Ara Jagriti Chowk Camp-2. Santoshi,City-: Bhilai, Dist.-: Durg,Pin Code-: 490001                          ','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:39:41',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8120690549','0'),(372,'400040','EMP0000372',NULL,'Mr.','Ronitson',NULL,'Lima','1992-04-20','Male','8280340117','0','design@indibasolutions.com','At/Po-Ashrayagada, P.S-Seranga,Dist-Gajapati, Odisha, India Pin-761207',1,26,1105,'Gajapati',761207,'At/Po-Ashrayagada, P.S-Seranga,Dist-Gajapati, Odisha, India Pin-761207','0',NULL,NULL,'Unmarried',1,2,1,1,NULL,NULL,'Active',401,NULL,1,3,48,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:41:25',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(373,'400041','EMP0000373',NULL,'Mr.','Sumant',NULL,'Pathak','1994-07-01','Male','7879693797','0','design@indibasolutions.com','C/O Varsha Jayant Agrwal, Near  Banjari Mandir, Addiwasi Colony Pin-484116   ',1,23,1093,'Umaria',484116,'C/O Varsha Jayant Agrwal, Near  Banjari Mandir, Addiwasi Colony Pin-484116   ','0',NULL,NULL,'Unmarried',NULL,2,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:44:27',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(374,'400042','EMP0000374',NULL,'Mr.','Manish',NULL,'Sahu','1992-01-25','Male','8103596858','0','design@indibasolutions.com','Shanti Nagar, Near Gila Panchayat, Kanker, Pin-494334',1,7,1064,'kanker',494334,'Shanti Nagar, Near Gila Panchayat, Kanker, Pin-494334','500165173295',NULL,NULL,'Married',6,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:46:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9907045830','0'),(375,'400043','EMP0000375',NULL,'Mr.','Kedarnath',NULL,'Yadav','1992-04-27','Male','8463893750','0','design@indibasolutions.com','Barpara, Badal H. No. 16,\nThe-Nerharpur, Kanker-494333',1,7,1064,'kanker',494333,'Barpara, Badal H. No. 16,\nThe-Nerharpur, Kanker-494333','3846',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',353,NULL,1,3,48,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:47:16',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8461864258','0'),(376,'400044','EMP0000376',NULL,'Mr.','Anil','Kumar','Ratre','1991-07-22','Male','7828247854','0','design@indibasolutions.com','Ram Nagar, Rajeev Nagar  H.No.122 Behind Durga Temple,  Bhilai-490023',1,7,1068,'Bhilai',490023,'Ram Nagar, Rajeev Nagar  H.No.122 Behind Durga Temple,  Bhilai-490023','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',353,NULL,1,3,48,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:47:17',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(377,'400045','EMP0000377',NULL,'Mr.','Ravi','Kumar','Koshre','1992-02-15','Male','7587366169','0','design@indibasolutions.com','23/D, H Pocke,Maroda, Bhilai Nagar, Durga, Chhattisgarh-490006',1,7,1068,'Bhilai nagar',490006,'23/D, H Pocke,Maroda, Bhilai Nagar, Durga, Chhattisgarh-490006','0',NULL,NULL,NULL,NULL,2,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:40','2017-11-15 06:47:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(378,'400046','EMP0000378',NULL,'Mr.','Deepak',NULL,'Singh','1987-10-23','Male','9981208236','0','design@indibasolutions.com','Q.No.19/4 Amlai Colliery, Anuppur, Madhya Pradesh.(484116)',1,23,1034,'Anuppur',484116,'Q.No.19/4 Amlai Colliery, Anuppur, Madhya Pradesh.(484116)','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',401,NULL,1,3,48,NULL,4,'2017-11-02 05:32:41','2017-11-15 06:48:13',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(379,'400047','EMP0000379',NULL,'Mr.','P.','Ramesh','Kumar','1993-05-13','Male','7587392636','0','design@indibasolutions.com','Qr.No-21/D, Street-04, Sector-4, Bhilai,Dist: - Durg, (C.G).Pin: - 490001.',1,7,1068,'Durg',490001,'Qr.No-21/D, Street-04, Sector-4, Bhilai,Dist: - Durg, (C.G).Pin: - 490001.','0',NULL,NULL,'Unmarried',2,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 06:49:03',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(380,'400048','EMP0000380',NULL,'Mr.','Rajeev',NULL,'Koushik','1992-07-01','Male','8889729407','0','design@indibasolutions.com','Bajrang Chauk Kaya  Post Senwar Dist Bilaspur Block Bilha Chhattisgarh Pin No. 495224',1,7,117,'Bilaspur',495224,'Bajrang Chauk Kaya  Post Senwar Dist Bilaspur Block Bilha Chhattisgarh Pin No. 495224','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 06:49:04',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(381,'400049','EMP0000381',NULL,'Mr.','Likesh','Kumar','Sahu','1990-06-29','Male','9424251518','0','design@indibasolutions.com','Civili Colony, Q. No-62, At-Gangral, Dhamtari, Cg-493773',1,7,119,'Dhamtari',493773,'Civili Colony, Q. No-62, At-Gangral, Dhamtari, Cg-493773','0',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 06:49:06',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(382,'400050','EMP0000382',NULL,'Mr.','Abhisekh',NULL,'Markam','1994-03-07','Male','9669644008','0','design@indibasolutions.com','At-Annpurnapara, Po-Kanker, Chhattisgarh,Pin-494334',1,7,1064,'kanker',494334,'At-Annpurnapara, Po-Kanker, Chhattisgarh,Pin-494334','0',NULL,NULL,'Unmarried',1,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:21:43',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9424273811','0'),(383,'400051','EMP0000383',NULL,'Mr.','Roman',NULL,'Sahu',NULL,'Male','9406473808','0','design@indibasolutions.com','At-Girhola,Po/Ps-Charama, Kanker,Cg, Pin-494337',1,7,1064,'kanker',494334,'At-Girhola,Po/Ps-Charama, Kanker,Cg, Pin-494337','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:21:41',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(384,'400052','EMP0000384',NULL,'Mr.','Chetan','Lal','Gavde','1993-09-06','Male','8827214456','0','design@indibasolutions.com','Village-Umargaon,Thashil  Nagri . Dist -Dhamtari,Chhattisgarh - 493778',1,7,119,'Dhamtari',493778,'Village-Umargaon,Thashil  Nagri . Dist -Dhamtari,Chhattisgarh - 493778','4352',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',353,NULL,1,3,48,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:21:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(385,'400053','EMP0000385',NULL,'Mr.','Manoj','Kumar','Jhadi','1985-05-26','Male','9407759026','0','design@indibasolutions.com','C/O. Sunti Bendke,Tashel Para, Ward No.10,Bijapur, C.G',1,7,328,'Bijapur',494450,'C/O. Sunti Bendke,Tashel Para, Ward No.10,Bijapur, C.G','0',NULL,NULL,'MARRIED',4,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:23:00',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(386,'400054','EMP0000386',NULL,'Mr.','Bhartendra','Prasad','Yadu','1989-07-16','Male','9424116371','0','design@indibasolutions.com','At-Girhola,Po/Ps-Charama, Kanker,Cg, Pin-494337',1,7,1064,'kanker',494337,'At-Girhola,Po/Ps-Charama, Kanker,Cg, Pin-494337','3592',NULL,NULL,'MARRIED',3,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:23:01',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9039963371','0'),(387,'400055','EMP0000387',NULL,'Mr.','Satish','Kumar','Mandavi','1989-07-11','Male','7089880611','0','design@indibasolutions.com','C/90, New Police Line, Annaand Nagar, Durg, Cg-491001',1,7,1068,'Annand Nagar',491001,'C/90, New Police Line, Annaand Nagar, Durg, Cg-491001','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:28:44',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9993602272','0'),(388,'400056','EMP0000388',NULL,'Mr.','Naveen','Kumar','Sahu','1990-10-23','Male','9165082373','0','design@indibasolutions.com','Village& Po.- Latabod, Dist.-Balod, Cg- 491226',1,7,1035,'Baloda Bazar',491226,'Village& Po.- Latabod, Dist.-Balod, Cg- 491226','0',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:28:58',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9755138098','0'),(389,'400057','EMP0000389',NULL,'Mr.','Pradeep','Kumar','Adil','1994-12-30','Male','7646815851','0','design@indibasolutions.com','At- Chhediya,Po-Tarri,Dist- Balod,Chhattisgarh,Pin-491227.',1,7,1035,'Baloda Bazar',491227,'At- Chhediya,Po-Tarri,Dist- Balod,Chhattisgarh,Pin-491227.','0',NULL,NULL,'Unmarried',2,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:29:17',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'7771868467','0'),(390,'400058','EMP0000390',NULL,'Mr.','Sagar',NULL,'Soni','1989-08-22','Male','9424187104','0','design@indibasolutions.com','At/Po-Besonda, Dist-Mahasamund, Cg-493450',1,7,1081,'Mahasamund',491441,'At/Po-Besonda, Dist-Mahasamund, Cg-493450','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:29:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9770986762','0'),(391,'400059','EMP0000391',NULL,'Mr.','Saswata','Kumar','Nayak','1990-05-01','Male','7646868266','0','design@indibasolutions.com','At-Bahadasahi,Po-Barkand,Via-Morada, Mayurbhanj-757020',1,26,1104,'Baripada',757020,'At-Bahadasahi,Po-Barkand,Via-Morada, Mayurbhanj-757020','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:41','2017-11-15 09:30:12',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(392,'400060','EMP0000392',NULL,'Mr.','Kuldeep',NULL,'Sahu','1996-08-31','Male','8871804705','0','design@indibasolutions.com','Vill-Kusmi,Post-Bhharregaon,Dist-Rajnandgaon,Chhattishgarh-491441 ',1,7,1057,'Rajnandgaon',491441,'Vill-Kusmi,Post-Bhharregaon,Dist-Rajnandgaon,Chhattishgarh-491441 ','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',253,NULL,1,3,52,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:30:31',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(393,'400061','EMP0000393',NULL,'Mr.','Hemant','Kumar','Awari','1986-09-19','Male','9039096237','0','design@indibasolutions.com','Santoshi Para Camp – 2,Bhilai-Durg (Chhattisgarh),Pin Code -490001',1,7,1068,'Bhilai',490001,'Santoshi Para Camp – 2,Bhilai-Durg (Chhattisgarh),Pin Code -490001','0',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:31:03',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(394,'400062','EMP0000394',NULL,'Mr.','Rajat',NULL,'Kothare','1995-02-19','Male','9424769490','0','design@indibasolutions.com','At – Ward No.15, Bhilai Road, Lanji, Madhya Pradesh- 481222',1,23,1095,'Bhilai',481222,'At – Ward No.15, Bhilai Road, Lanji, Madhya Pradesh- 481222','0',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:31:04',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9424370829','0'),(395,'400063','EMP0000395',NULL,'Mr.','Md.','Faizan','Raza','1991-12-17','Male','7000690565','0','design@indibasolutions.com','Forest Colony, Subash Ward,Kanker, Cg Pin-494334',1,7,1064,'Kanker',494334,'Forest Colony, Subash Ward,Kanker, Cg Pin-494334','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',353,NULL,1,3,1,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:32:08',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9407645786','0'),(396,'400064','EMP0000396',NULL,'Mr.','Vicky',NULL,'Jain','1995-02-26','Male','7415471114','0','design@indibasolutions.com','H. No-39, Chauhan Gali 2 Shitlapara, Kanker Pin-494334',1,7,1064,'kanker',494334,'H. No-39, Chauhan Gali 2 Shitlapara, Kanker Pin-494334','3904',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:32:07',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'7587285886','0'),(397,'400065','EMP0000397',NULL,'Mr.','Vasudev',NULL,'Sahu','1989-11-15','Male','7089109953','0','design@indibasolutions.com','150,Koshta Para Azad Chok, Koshta Para, Word-26, Dhamtari-493773',1,7,119,'Dhamtari',493773,'150,Koshta Para Azad Chok, Koshta Para, Word-26, Dhamtari-493773','2105',NULL,NULL,'Unmarried',2,2,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:32:06',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9644653351','0'),(398,'400066','EMP0000398',NULL,'Mr.','Yuraj',NULL,'Mandavi','1989-06-15','Male','9407943349','0','design@indibasolutions.com','Vill – Mahud,Po /Tahsil – Charama,Dist – Kanker,Pin – 494337 ( Cg )',1,7,1064,'Charama',494337,'Vill – Mahud,Po /Tahsil – Charama,Dist – Kanker,Pin – 494337 ( Cg )','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:32:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'7587288004','0'),(399,'400067','EMP0000399',NULL,'Mr.','Brajen','Kumar','Biswas','1993-07-20','Male','9479077646','0','design@indibasolutions.com','Add. – School Para Nelasnar,Post  –Nelasnar,Dist    - Bijapur (C.G)494001',1,7,328,'Bijapur',494221,'Add. – School Para Nelasnar,Post  –Nelasnar,Dist    - Bijapur (C.G)494001','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:33:08',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(400,'400068','EMP0000400',NULL,'Mr.','Amarjeet ',NULL,'Chauhan','1988-10-22','Male','7999418819','0','design@indibasolutions.com','14,Behind Krishna Temple ,Shyam Nagar, Telibandha ,Raipur (C.G)-491006',1,7,129,'Raipur',491006,'14,Behind Krishna Temple ,Shyam Nagar, Telibandha ,Raipur (C.G)-491006','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',257,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:33:24',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(401,'400069','EMP0000401',NULL,'Mr.','Padma ',NULL,'Parashar','1987-12-31','Female','8280340130','0','design@indibasolutions.com','R. Agraharam,D-No: 25-1-141, Guntur, Andhra Pradesh-522003',1,2,22,'Guntur',522003,'R. Agraharam,D-No: 25-1-141, Guntur, Andhra Pradesh-522003','0',NULL,NULL,'Married',NULL,3,1,1,NULL,NULL,'Active',253,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:33:43',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(402,'400070','EMP0000402',NULL,'Mr.','Lavsingh ',NULL,'Loniya','1993-07-01','Male','9407942610','0','design@indibasolutions.com','Near Padhi Talab Banjari Nagar, Advasi Colony, Kushalpur, Raipur',1,7,129,'Raipur',491006,'Near Padhi Talab Banjari Nagar, Advasi Colony, Kushalpur, Raipur','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:34:09',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(403,'400071','EMP0000403',NULL,'Mr.','Manish ','Kumar','Kemro','1990-09-24','Male','8109517323','0','design@indibasolutions.com','House No-10, Word No-9, Po-Jaisakrra, Kanker-494337',1,7,1064,'kanker',494337,'House No-10, Word No-9, Po-Jaisakrra, Kanker-494337','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:34:59',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(404,'400072','EMP0000404',NULL,'Mr.','Sandip',NULL,'Meshram','1995-04-07','Male','8871810607','0','design@indibasolutions.com','House No-17, Word No-9, Po-Jaisakrra, Kanker-494337',1,7,1064,'kanker',494337,'House No-17, Word No-9, Po-Jaisakrra, Kanker-494337','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-02 05:32:42',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(405,'400073','EMP0000405',NULL,'Mr.','Mukesh ',NULL,'Kumar','1991-01-04','Male','9752022046','0','design@indibasolutions.com','House No. – 1245, Bhatapara, Ward No. - 15, Charama',1,7,NULL,'Charama',494337,'House No. – 1245, Bhatapara, Ward No. - 15, Charama','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',NULL,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-02 05:32:42',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(406,'400074','EMP0000406',NULL,'Mr.','Kush ',NULL,'Kumar','1996-11-28','Male','9424199822','0','design@indibasolutions.com','House N0-136,Bajronja Choka,Word No-3, Bolda Bazar',1,7,NULL,' Bolda Bazar',493196,'House N0-136,Bajronja Choka,Word No-3, Bolda Bazar','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',392,NULL,1,3,53,NULL,4,'2017-11-02 05:32:42','2017-11-15 09:35:50',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(407,'400075','EMP0000407',NULL,'Mr.','Sandeep ',NULL,'Ablam','1988-07-02','Male','9407683911','0','design@indibasolutions.com','Tashel Para, Ward No.10,Bijapur, C.G',1,7,328,'Bijapur',494450,'Tashel Para, Ward No.10,Bijapur, C.G','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',400,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:36:17',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(408,'400076','EMP0000408',NULL,'Mr.','Kamlesh ',NULL,'Patel','1996-06-28','Male','9109253040','0','design@indibasolutions.com','Jangrichappa, Jangrichhpa, Chhattisgarh-495557',1,7,NULL,'Jangrichapa',495557,'Jangrichappa, Jangrichhpa, Chhattisgarh-495557','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',400,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:36:18',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(409,'400077','EMP0000409',NULL,'Mr.','Pankaj ','Kumar','Giri','1990-06-12','Male','7647006564','0','design@indibasolutions.com','Kamarda, Balasore, Odisha-756035',1,26,601,'Balasore',756035,'Kamarda, Balasore, Odisha-756035','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:36:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(410,'400078','EMP0000410',NULL,'Mr.','Deepak ',NULL,'Panjwani','1997-12-08','Male','7773873435','0','design@indibasolutions.com','H. No-24, Chauhan Gali 2 Shitlapara, Kanker Pin-494334',1,7,1064,'kanker',494334,'H. No-24, Chauhan Gali 2 Shitlapara, Kanker Pin-494334','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:37:24',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(411,'400079','EMP0000411',NULL,'Mr.','Roshna ','Kumar','Sahu','1992-11-22','Male','9669996659','0','design@indibasolutions.com','Plot No-40. Word No-13, Nayapara, Durga',1,7,1068,'Durga',491107,'Plot No-40. Word No-13, Nayapara, Durga','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',351,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:37:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(412,'400080','EMP0000412',NULL,'Mr.','Chandra',NULL,'Kant','1995-11-06','Male','9893511904','0','design@indibasolutions.com','Rengakathera,Po-Ranitarai, Patna, Durga-491223',1,7,1068,'Patna',491223,'Rengakathera,Po-Ranitarai, Patna, Durga-491223','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',401,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:38:40',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(413,'400081','EMP0000413',NULL,'Mr.','Kamal ','Lochan','Jena','1992-06-18','Male','9583444818','0','design@indibasolutions.com','Halupatana, Nuapadhi, Remuna, Balasore-756020',1,26,601,'Balasore',756020,'Halupatana, Nuapadhi, Remuna, Balasore-756020','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:38:53',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(414,'400082','EMP0000414',NULL,'Mr.','Pankaj ','Kumar','Chandra ','1991-07-20','Male','9713927117','0','design@indibasolutions.com','Village  Jasra P.O.-Bade Gantuli  Th.  Sarangarh  Dist- Raigarh ',1,7,129,'Raigarh',496445,'Village  Jasra P.O.-Bade Gantuli  Th.  Sarangarh  Dist- Raigarh ','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',400,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:39:20',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(415,'400083','EMP0000415',NULL,'Mr.','Mahesh',NULL,'Pathak','1992-09-25','Male','7647062536','0','design@indibasolutions.com','C/O Varsha Jayant Agrwal, Near  Banjari Mandir, Addiwasi Colony Pin-484116   ',1,23,1093,'Umaria',484116,'C/O Varsha Jayant Agrwal, Near  Banjari Mandir, Addiwasi Colony Pin-484116   ','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:39:43',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(416,'400084','EMP0000416',NULL,'Mr.','Shrikant','Ram','Soni','1993-10-26','Male','9479238812','0','design@indibasolutions.com','Word No-2, Thakur Para, Nakulnar, Dantewada-494552',1,7,1091,'Dantewada',494552,'Word No-2, Thakur Para, Nakulnar, Dantewada-494552','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:40:05',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(417,'400085','EMP0000417',NULL,'Mr.','Nitesh ','Kumar','Chanderbanshi','1994-01-08','Male','9479124330','0','design@indibasolutions.com','Halbarassh, Chalkipara, Kuakonda, Nakulnar, Dantewada',1,7,1091,'Dantewada',494449,'Halbarassh, Chalkipara, Kuakonda, Nakulnar, Dantewada','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:40:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(418,'400086','EMP0000418',NULL,'Mr.','Mohit ',NULL,'Prasad','1995-07-05','Male','7587056659','0','design@indibasolutions.com','Word No-3, Thakur Para, Nakulnar, Dantewada-494552',1,7,1091,'Dantewada',494552,'Word No-3, Thakur Para, Nakulnar, Dantewada-494552','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:40:56',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(419,'400087','EMP0000419',NULL,'Mr.','Ajay ',NULL,'Thakur','1993-07-05','Male','7587806197','0','design@indibasolutions.com','Word No-07, Gandhi Nagar, Sukma-494111',1,7,130,'Sukma',494111,'Word No-07, Gandhi Nagar, Sukma-494111','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:41:57',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(420,'400088','EMP0000420',NULL,'Mr.','Nitesh ',NULL,'Manikpuri','1993-10-08','Male','9406338736','0','design@indibasolutions.com','Word No-09, Gandhi Nagar, Sukma-494111',1,7,130,'Sukma',494111,'Word No-09, Gandhi Nagar, Sukma-494111','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:42:10',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(421,'400089','EMP0000421',NULL,'Mr.','Ramsingh ',NULL,'Yadav','1996-05-26','Male','9406269817','0','design@indibasolutions.com','Jalibadi Para, Ward No-01, Sukma, Chhattisgarh-494111',1,7,130,'Sukma',494111,'Jalibadi Para, Ward No-01, Sukma, Chhattisgarh-494111','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-02 05:32:43','2017-11-15 09:42:24',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(422,'400090','EMP0000422',NULL,'Mr.','Ravikant ',NULL,'Gannarap','1993-11-02','Male','9406245','0','design@indibasolutions.com','Dhanora, Bijapur, Chhattisgarh-494444',1,7,328,'Bijapur',494444,'Dhanora, Bijapur, Chhattisgarh-494444','0',NULL,NULL,'Unmarried',NULL,3,1,1,NULL,NULL,'Active',392,NULL,1,3,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 09:42:41',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(423,'400091','EMP0000423',NULL,'Mr.','G Dinesh',NULL,'Kumar','1997-05-15','Male','7331171608','0','design@indibasolutions.com','D.No.3-23, Diguvapalli Village, Murarichintala Post, Lingal Mandal, Kadapa Dist.Pin-516390',1,2,23,'Kadapa',516390,'D.No.3-23, Diguvapalli Village, Murarichintala Post, Lingal Mandal, Kadapa Dist.Pin-516390','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',424,NULL,1,2,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:26:50',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9963061145','0'),(424,'400092','EMP0000424',NULL,'Mr.','Sreenivasulu',NULL,'Anantharaju','1982-06-01','Male','7331171607','0','design@indibasolutions.com','D.No.1-126, BC Colony, GC Palli Village & Post, Udayagiri Mandal, Nellore Dist.AP-524230',1,2,42,'Udayagari',524230,'D.No.1-126, BC Colony, GC Palli Village & Post, Udayagiri Mandal, Nellore Dist.AP-524230','0',NULL,NULL,'Married',NULL,2,1,1,NULL,NULL,'Active',424,NULL,1,2,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:27:30',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(425,'400093','EMP0000425',NULL,'Mr.','P.',NULL,'Rajshekhar','1989-03-09','Male','7331171602','0','design@indibasolutions.com','D.No.1-44, Kondalaraopalem, Rayannapalem, Pedavegi, West Godavari,AP-534475',1,2,1047,'Pedavegi',534475,'D.No.1-44, Kondalaraopalem, Rayannapalem, Pedavegi, West Godavari,AP-534475','0',NULL,NULL,'Married',4,2,1,1,NULL,NULL,'Active',253,NULL,1,7,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:27:58',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9618157691','0'),(426,'400094','EMP0000426',NULL,'Mr.','Shiakh',NULL,'Firoz','1992-05-10','Male','7331171606','0','design@indibasolutions.com','D.No.6-225, Amaranath Reddy Colony, Kalikiri, Chittoor, Andhra Pradesh-517234',1,2,1041,'Chittoor',517234,'D.No.6-225, Amaranath Reddy Colony, Kalikiri, Chittoor, Andhra Pradesh-517234','0',NULL,NULL,'Married',1,2,1,1,NULL,NULL,'Active',424,NULL,1,2,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:28:38',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9581881941','0'),(427,'400095','EMP0000427',NULL,'Mr.','N',NULL,'Mallesh',NULL,'Male','9553988761','0','design@indibasolutions.com','Arikera Viilage, Alur Mandal, Kurnool Dist.,Pin-518395',1,2,29,'Kurnool',518395,'Arikera Viilage, Alur Mandal, Kurnool Dist.,Pin-518395','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',425,NULL,1,7,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:29:16',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8886287759','0'),(428,'400096','EMP0000428',NULL,'Mr.','D.',NULL,'Naresh','1993-01-04','Male','7331171601','0','design@indibasolutions.com','Mohammadabad Village, Mahaboob Nagar Dist, Telangana, Pin- 509337',1,NULL,1133,'Mahaboob',509337,'Mohammadabad Village, Mahaboob Nagar Dist, Telangana, Pin- 509337','0',NULL,NULL,'Unmarried',3,2,1,1,NULL,NULL,'Active',425,NULL,1,7,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:29:18',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9959239471','0'),(429,'400097','EMP0000429',NULL,'Mr.','Ravindra',NULL,'Tiwari','1992-02-27','Male','9771121212','0','design@indibasolutions.com','Adarsh Nagar, Collectoriate Road, Dist-Buxar,Pin-802101',1,5,1040,'Buxar',802101,'Adarsh Nagar, Collectoriate Road, Dist-Buxar,Pin-802101','0',NULL,NULL,'Unmarried',5,2,1,1,NULL,NULL,'Active',NULL,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-02 05:32:44',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8539065363','0'),(430,'400098','EMP0000430',NULL,'Mr.','Rajkumar',NULL,'Singh','1990-12-06','Male','8678086814','0','design@indibasolutions.com','At-Hastinapur, Po-Bhalua, Dist-Banka,Pin-8123007',1,2,42,'Mellorural',524001,'At-Hastinapur, Po-Bhalua, Dist-Banka,Pin-8123007','0',NULL,NULL,'Unmarried',4,2,1,1,NULL,NULL,'Active',NULL,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-02 05:32:44',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9199055115','0'),(431,'400099','EMP0000431',NULL,'Mr.','Choppa',NULL,'Karthik','1994-04-19','Male','9602864654','0','design@indibasolutions.com','House no-915, Narayanrebdyped, Mellorural,Nelllore, AP,Pin-524314',1,23,565,'Jabalpur',482001,'House no-915, Narayanrebdyped, Mellorural,Nelllore, AP,Pin-524314','0',NULL,NULL,'Unmarried',7,3,1,1,NULL,NULL,'Active',253,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:40:32',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9700678595','0'),(432,'400100','EMP0000432',NULL,'Mr.','Ajay',NULL,'Kanojiya','1994-07-15','Male','7415222857','0','design@indibasolutions.com','Lalmati, Sidh Baba Road, Jabalpur, Madhya Pradesh-482001',1,5,1051,'Sanrampur',811213,'Lalmati, Sidh Baba Road, Jabalpur, Madhya Pradesh-482001','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',347,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 09:51:04',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'9407020914','0'),(433,'400101','EMP0000433',NULL,'Mr.','Rupesh','Kumar','Singh','1985-12-14','Male','9602908658','0','design@indibasolutions.com','AT-Mougoura, Po-Lagma, Ps-Sanrampur,Dis-Mouger,Biha-811213',1,5,1051,'Sanrampur',811213,'AT-Mougoura, Po-Lagma, Ps-Sanrampur,Dis-Mouger,Biha-811213','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',253,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:41:15',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(434,'400102','EMP0000434',NULL,'Mr.','Sourabh',NULL,'Kumar','1990-06-14','Male','9602626977','0','design@indibasolutions.com','AT-Mougoura, Po-Lagma, Ps-Sanrampur,Dis-Mouger,Biha-811213',1,5,1051,'Sanrampur',811213,'AT-Mougoura, Po-Lagma, Ps-Sanrampur,Dis-Mouger,Biha-811213','0',NULL,NULL,'Unmarried',3,3,1,1,NULL,NULL,'Active',NULL,NULL,1,5,53,NULL,4,'2017-11-02 05:32:44','2017-11-02 05:32:44',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'8877071351','0'),(435,'400103','EMP0000435',NULL,'Mr.','Chandan','Kumar','Patel','1994-04-04','Male','9113789041','0','design@indibasolutions.com','At-Majhaliya, Po/Dist-Majhaliya, Dist-West Champaran, Bihar-845454',1,5,1054,'West Champaran',845454,'At-Majhaliya, Po/Dist-Majhaliya, Dist-West Champaran, Bihar-845454','0',NULL,NULL,'Unmarried',NULL,2,1,1,NULL,NULL,'Active',253,NULL,1,8,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:31:05',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(436,'400104','EMP0000436',NULL,'Mr.','Dheeraj ','Kumar','Singh','1995-05-14','Male','9523430379','0','design@indibasolutions.com','At/Po-Gidip, Dist-Hajaribag, Ramgada,Jharkhand',1,NULL,NULL,'Ramgada',829109,'At/Po-Gidip, Dist-Hajaribag, Ramgada,Jharkhand','0',NULL,NULL,'Unmarried',4,3,1,1,NULL,NULL,'Active',253,NULL,1,8,53,NULL,4,'2017-11-02 05:32:44','2017-11-15 04:31:06',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0','0'),(437,'400105','EMP0000437',NULL,'Mr.','Santosh ',NULL,'Made','1998-09-07','Male','9479232770','0','design@indibasolutions.com','Bijapur, Bijapur, Chhattisgarh-494444',1,7,328,'Bijapur',494444,'Bijapur, Bijapur, Chhattisgarh-494444','0',NULL,NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:42:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(438,'400106','EMP0000438',NULL,'Mr.','Soman',NULL,'Manjhi','1993-09-12','Male','7587047315','0','design@indibasolutions.com','Ward No 12 At Nakapara Post Kalimati Tehsil Lanji Dist Balaghat M.P.494111',1,23,544,'Balaghat',494111,'Ward No 12 At Nakapara Post Kalimati Tehsil Lanji Dist Balaghat M.P.494111','0',NULL,NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',358,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:43:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(439,'400107','EMP0000439',NULL,'Mr.','Arun ',NULL,'Chaturvedi','1995-01-07','Male','8964058925','0','design@indibasolutions.com','S/o-Rajkumar Chatruvedi, Bhejripadar, Rajnagar, Bastar 494222',1,7,1037,'Rajnagar',494222,'S/o-Rajkumar Chatruvedi, Bhejripadar, Rajnagar, Bastar 494222','0',NULL,NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',353,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:43:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(440,'400108','EMP0000440',NULL,'Mr.','Kudiyam',NULL,'Waleram','1987-09-15','Male','9479172796','0','design@indibasolutions.com','Bijapur, Bijapur, Chhattisgarh-494444',1,7,328,'Bijapur',494444,'Bijapur, Bijapur, Chhattisgarh-494444','0',NULL,NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',391,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:43:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(441,'400109','EMP0000441',NULL,'Mr.','Debasisa',NULL,'Mishra','1990-10-10','Male','9522964830','0','design@indibasolutions.com','At- Padmadeipur, Po-  Padmadeipur, Ps-  Sarankul ,Dist-Nayagaarh, Odisha-752070                                                                        ',1,26,615,'Nayagarh',752070,'At- Padmadeipur, Po-  Padmadeipur, Ps-  Sarankul ,Dist-Nayagaarh, Odisha-752070                                                                        ','0',NULL,NULL,'Unmarried',4,3,1,1,'No',NULL,'Resigned',342,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:48:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7504893026','0'),(442,'400110','EMP0000442',NULL,'Mr.','Amit','Kumar','Verma','1991-07-01','Male','9926818578','0','design@indibasolutions.com','s/o shri Krishna Kumar verma C/o Narendra Kumar verma,village-kirna,po.-tandwa,block-tilda,Distt.-raipur(c.g.) ,pin-493116',1,26,129,'Raipur',493116,'s/o shri Krishna Kumar verma C/o Narendra Kumar verma,village-kirna,po.-tandwa,block-tilda,Distt.-raipur(c.g.) ,pin-493116','0',NULL,NULL,'Unmarried',3,3,1,1,'No',NULL,'Active',392,NULL,1,3,53,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:44:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9926818578','0'),(443,'400111','EMP0000443',NULL,'Mr.','Manoj','Kumar','Peda','1984-05-22','Male','8895557564','0','design@indibasolutions.com','At- Bhubaneswarpursasna, Po-Bamgaropadi, Bhadrak, Odisha-756114',1,26,1038,'Bhadrak',756114,'At- Bhubaneswarpursasna, Po-Bamgaropadi, Bhadrak, Odisha-756114','0',NULL,NULL,'Unmarried',1,3,1,1,'No',NULL,'Active',392,NULL,1,3,52,NULL,4,'2017-11-14 06:40:54','2017-11-15 09:44:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8763951264','0'),(444,'100068','EMP0000444',NULL,'Mr.','Yasar','Rashied','Qureshi','1988-04-18','Male','7828230618','0','design@indibasolutions.com','Near RDA Colony, Nikhil Vihar, Raipur-492001',1,7,129,'Raipur',492001,'Near RDA Colony, Nikhil Vihar, Raipur-492001','0',NULL,NULL,'Married',4,3,1,NULL,'No',NULL,'Active',304,NULL,1,3,NULL,NULL,1,'2017-11-14 06:40:54','2017-11-15 09:44:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'810125316','0'),(445,'100060','EMP0000445',NULL,'Mr.','Prathmesh ','Ganpat ','Jumare','1996-07-30','Male','7385577139','0','design@indibasolutions.com','at-post-kharavli , tal -mangaon, dist- raigad,maharashtra 402104',1,20,NULL,'Raigad',402104,'Tirupati Hostel, Balajinagar, Dhankavdi, pune','9723',NULL,NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',294,NULL,NULL,1,NULL,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:48:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9552942207','0'),(446,'100061','EMP0000446',NULL,'Mr.','Amar','Padmakar','Potdar','1990-07-14','Male','9860200223','0','design@indibasolutions.com','S.No. 144, House No 3708, Shivganga Society, Warje, Pune',1,20,504,'Pune',411004,'S.No. 144, House No 3708, Shivganga Society, Warje, Pune','575605123848','BBUPP4211N',NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',254,NULL,NULL,1,29,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:47:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9767949429','0'),(447,'100062','EMP0000447',NULL,'Mr.','Prathamesh ','Ramesh','Devi','1994-04-06','Male','8605517237','0','design@indibasolutions.com','A-11 , Damodar Prasad, Vitthlwadi, Sinhgad Road,Pune 51',1,20,504,'Pune',411051,'A-11 , Damodar Prasad, Vitthlwadi, Sinhgad Road,Pune 51','927610701311','BOWPD0738K',NULL,'Unmarried',1,3,1,1,'No',NULL,'Active',254,NULL,NULL,1,29,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:47:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9011923618','0'),(448,'100064','EMP0000448',NULL,'Mr.','Rohit ','Shivaji','Deshmukh','1991-03-16','Male','9767491481','0','design@indibasolutions.com','Sr. No. 38, House no. 365 Shankar Nagar, Keshav Nagar, Mundhva Pune 411036',1,20,504,'Pune',411036,'Sr. No. 38, House no. 365 Shankar Nagar, Keshav Nagar, Mundhva Pune 411036','404122010981','BCLPD0561R',NULL,'Unmarried',NULL,3,1,1,'No',NULL,'Active',261,NULL,NULL,1,21,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:50:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(449,'100065','EMP0000449',NULL,'Mr.','Ashish ','Mahadeo','Wakode','1980-07-03','Male','8378893969','0','design@indibasolutions.com','c/o mahadeo wakode Panchatara nagar shramic niwas sno 179 akurdi pune 35',1,20,504,'Pune',411035,'c/o mahadeo wakode Panchatara nagar shramic niwas sno 179 akurdi pune 35','440328650622','ABEPW5309B',NULL,'Married',3,3,1,1,'No',NULL,'Active',304,NULL,NULL,1,5,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:50:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9119443508','0'),(450,'100066','EMP0000450',NULL,'Mr.','Ravi','Satish','Bahanwal','1995-05-21','Male','9921782734','0','design@indibasolutions.com','H.No. 552, Indra Vasahat, Ganesh Khind Road,Near Ambedkar Chowk, Aundh, Pune city pune 411007',1,20,504,'Pune',411007,'H.No. 552, Indra Vasahat, Ganesh Khind Road,Near Ambedkar Chowk, Aundh, Pune city pune 411007','911945711252','BUFPB1940L',NULL,'Married',1,3,1,1,'No',NULL,'Active',261,NULL,NULL,1,21,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:50:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0'),(451,'100067','EMP0000451',NULL,'Mr.','Hitesh','Ramesh','Pimpalshende','1985-03-04','Male','8369891942','0','design@indibasolutions.com','Plot no. 43, Bhavanath Society, Near Gajanan Mandir, Chandrapur 442401',1,20,504,'Pune',442401,'Plot no. 43, Bhavanath Society, Near Gajanan Mandir, Chandrapur 442401','405772570192','AWZPP5664N',NULL,'Married',1,3,1,1,'No',NULL,'Active',304,NULL,NULL,1,5,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:47:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9422837905','0'),(452,'100069','EMP0000452',NULL,'Mr.','Koushik','Uttam Kumar','Khan','1994-02-26','Male','9854085175','0','design@indibasolutions.com','Deshbandhu Park, P.O - Hindhusthan Cables, Dist- West Burdwan, Pin- 713335',1,NULL,NULL,NULL,713335,NULL,'881832601742','CSHPK0386E',NULL,'Unmarried',3,3,1,1,'No',NULL,'Active',304,NULL,NULL,1,5,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:50:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9434585671','0'),(453,'100070','EMP0000453',NULL,'Mr.','Narayan','Keshavrao','Mahajan','1973-05-17','Male','9765284522','0','design@indibasolutions.com','D-504,Jayanti Nagari-IV, Purti Super Bazar Bldg, Besa Road, Manish Nagar, Nagpur-34',1,20,488,'Nagpur',0,NULL,'268585997268','AJDMPM9907A',NULL,'Married',3,3,1,1,'No',NULL,'Active',304,NULL,NULL,1,NULL,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:46:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9860428081','0'),(454,'100071','EMP0000454',NULL,'Miss.','Jayashri','Mangesh','Dighe','1989-09-14','Female','9960542184','0','design@indibasolutions.com','At Post Jorve, Tal-Sangamner, Dist-Ahmednager',1,20,428,'Ahmednagar',414001,'Sector no-1,Plot No-83,R-11, Chaitanya park, Indrayni Nager, Bhosari, Pune','411123975564','DNWPS5319Q',NULL,'Married',3,3,1,1,'No',NULL,'Active',254,NULL,NULL,1,29,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:46:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9665122595','0'),(455,'100072','EMP0000455',NULL,'Mr.','Nitin ','Kashinath','Nikam','1979-12-25','Male','9922702843','0','design@indibasolutions.com','H.No.364, Yelwande Chal,Near Aditya Birla Hospital, Dattanagar,Thergaon,Chinchwadgaon, Pune-411033',1,20,504,'Pune',411033,'H.No.364, Yelwande Chal,Near Aditya Birla Hospital, Dattanagar,Thergaon,Chinchwadgaon, Pune-411033','812959230700','ALEPN0693F',NULL,'Married',3,3,1,1,'No',NULL,'Active',261,NULL,NULL,1,21,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:50:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9920462950','0'),(456,'200018','EMP0000456',NULL,'Mr.','Parwej','Shabbir','Attar','1994-07-15','Male','9011322789','0','design@indibasolutions.com','Sr.No.:167/168, Edenn Tower, Flat No: C1-404, Wakad, Pune, Pincod No: 411057',1,20,504,'Pune',411057,'Sr.No.:167/168, Edenn Tower, Flat No: C1-404, Wakad, Pune, Pincod No: 411057','757918816162','BRVPA4447A',NULL,NULL,NULL,3,1,NULL,'No',NULL,'Active',309,NULL,NULL,6,NULL,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:45:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9881496370','0'),(457,'200019','EMP0000457',NULL,'Mr.','Atul','Vishwas','Pawar','1990-03-24','Male','9975592369','0','design@indibasolutions.com','In Front Of Sangamner College Nirmal Nagar Sangamner 422608',1,20,428,'Sangamner',422608,'C/O- Shri Sanas Nandkumar Anant, Alandi RD,S NO12/B/2 Ram San Socy M Bldg 14 Fl 322 Yerwada Pune 411006','533955867178','CFJPP1859L',NULL,'Unmarried',6,3,1,1,'No',NULL,'Active',309,NULL,NULL,6,NULL,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:45:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9975592369','0'),(458,'200020','EMP0000458',NULL,'Mr.','Bhushan','Sampat','Kadu','1993-10-13','Male','8793572494','0','design@indibasolutions.com','C1-17 Sanjiani Engg Collage Cappus Sahajanadnagar',1,20,1061,NULL,0,NULL,'553210153541','DFPPk1991P',NULL,'Unmarried',1,3,1,1,'No',NULL,'Active',309,NULL,NULL,6,NULL,NULL,1,'2017-11-15 08:55:48','2017-11-15 09:45:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9730727604','0'),(459,'200021','EMP0000459',NULL,'Mr.','Govind','','Pawar','1990-11-01','','','','design@indibasolutions.com','99,Swarget, Pune',1,20,504,'Pune',411045,'Pune','','','','Married',NULL,2,NULL,NULL,'No',NULL,'Active',NULL,NULL,1,1,31,NULL,2,'2017-11-21 07:48:50','2017-11-21 07:48:50',NULL,NULL,NULL,NULL,'',1,NULL,NULL,NULL,NULL,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_contributions`
--

LOCK TABLES `employer_contributions` WRITE;
/*!40000 ALTER TABLE `employer_contributions` DISABLE KEYS */;
INSERT INTO `employer_contributions` VALUES (40,251,'2017-06-01',840,840,361,361,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:36','2017-08-01 10:34:36'),(41,254,'2017-06-01',3782,3656,563,544,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:36','2017-08-01 10:34:36'),(42,256,'2017-06-01',774,774,405,405,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:36','2017-08-01 10:34:36'),(43,261,'2017-06-01',840,840,312,312,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(44,269,'2017-06-01',871,871,658,658,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(45,271,'2017-06-01',471,455,324,313,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(46,280,'2017-06-01',2496,2164,764,663,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(47,281,'2017-06-01',NULL,NULL,84,84,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(48,287,'2017-06-01',1271,1271,356,356,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(49,288,'2017-06-01',924,863,350,327,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:37','2017-08-01 10:34:37'),(50,289,'2017-06-01',711,711,254,254,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:38','2017-08-01 10:34:38'),(51,296,'2017-06-01',550,531,116,112,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:38','2017-08-01 10:34:38'),(52,301,'2017-06-01',1668,1668,489,489,NULL,NULL,NULL,NULL,NULL,NULL,'2017-08-01 10:34:38','2017-08-01 10:34:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_employers`
--

LOCK TABLES `esic_employers` WRITE;
/*!40000 ALTER TABLE `esic_employers` DISABLE KEYS */;
INSERT INTO `esic_employers` VALUES (1,'',4,'2017-07-01','2017-07-31',1,NULL,'2017-07-27 11:57:20','2017-09-25 07:33:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esic_masters`
--

LOCK TABLES `esic_masters` WRITE;
/*!40000 ALTER TABLE `esic_masters` DISABLE KEYS */;
INSERT INTO `esic_masters` VALUES (1,1,1.50,0.00,'2017-07-01',20000.00,'2','2017-12-31',1,NULL,'2017-07-27 11:49:21','2017-12-30 09:09:20'),(2,1,1.75,0.00,'2017-12-01',10000.00,'4','2017-12-31',1,NULL,'2017-12-30 09:09:58','2017-12-30 09:09:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exit_interviews`
--

LOCK TABLES `exit_interviews` WRITE;
/*!40000 ALTER TABLE `exit_interviews` DISABLE KEYS */;
INSERT INTO `exit_interviews` VALUES (1,NULL,1,'Personal','2017-12-30 08:26:09','2017-12-30 08:26:33',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expencess_types`
--

LOCK TABLES `expencess_types` WRITE;
/*!40000 ALTER TABLE `expencess_types` DISABLE KEYS */;
INSERT INTO `expencess_types` VALUES (1,'1','Income Tax','',NULL,'2017-08-01 07:38:10','2017-08-01 07:38:10'),(2,'2','Mobile Deduction','',NULL,'2017-08-01 07:38:27','2017-08-01 07:38:27'),(4,'3','Pantry Deduction','',NULL,'2017-11-06 08:45:25','2017-11-06 08:45:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` VALUES (1,307,'Reliance ADA Group','HR Executive','4.11','',NULL,NULL,NULL,'2017-08-01 11:28:29','2017-08-01 11:28:29'),(2,307,'Aditya Birla Group','HR Executive','1.6','',NULL,NULL,NULL,'2017-08-01 11:29:05','2017-08-01 11:29:05'),(3,332,'KSP Pumps','HR Officer','1','',NULL,NULL,NULL,'2017-08-22 06:58:21','2017-08-22 06:58:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
INSERT INTO `families` VALUES (1,332,NULL,'Atish','','Gawale','',NULL,NULL,'','','Pune','',NULL,'','','',NULL,'',NULL,NULL,'',7,'',NULL,NULL,'2017-08-22 07:05:11','2017-08-22 07:05:11',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_coupan_masters`
--

LOCK TABLES `food_coupan_masters` WRITE;
/*!40000 ALTER TABLE `food_coupan_masters` DISABLE KEYS */;
INSERT INTO `food_coupan_masters` VALUES (1,'1','Pantry',NULL,10.00,NULL,'2017-08-01 07:51:30','2017-11-28 09:41:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_deductions`
--

LOCK TABLES `food_deductions` WRITE;
/*!40000 ALTER TABLE `food_deductions` DISABLE KEYS */;
INSERT INTO `food_deductions` VALUES (1,'2017-06-01',0,1,90.00,251,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:36'),(2,'2017-06-01',0,1,40.00,256,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:36'),(3,'2017-06-01',0,1,30.00,281,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(4,'2017-06-01',0,1,60.00,261,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:36'),(5,'2017-06-01',0,1,40.00,289,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:38'),(6,'2017-06-01',0,1,40.00,271,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(7,'2017-06-01',0,1,105.00,254,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:36'),(8,'2017-06-01',0,1,30.00,269,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(9,'2017-06-01',0,1,45.00,280,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(10,'2017-06-01',0,1,125.00,288,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(11,'2017-06-01',0,1,60.00,287,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:37'),(12,'2017-06-01',0,1,65.00,296,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:38'),(13,'2017-06-01',0,1,50.00,301,0,0,1,'2017-08-01 07:52:30','2017-08-01 10:34:38');
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
  `appraisee_rating_id` int(11) DEFAULT NULL,
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
-- Table structure for table `gps_dailies`
--

DROP TABLE IF EXISTS `gps_dailies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps_dailies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `employee_gp_id` int(11) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gps_dailies_on_employee_id` (`employee_id`),
  KEY `index_gps_dailies_on_employee_gp_id` (`employee_gp_id`),
  CONSTRAINT `fk_rails_47f0ea6563` FOREIGN KEY (`employee_gp_id`) REFERENCES `employee_gps` (`id`),
  CONSTRAINT `fk_rails_a2e116146c` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gps_dailies`
--

LOCK TABLES `gps_dailies` WRITE;
/*!40000 ALTER TABLE `gps_dailies` DISABLE KEYS */;
/*!40000 ALTER TABLE `gps_dailies` ENABLE KEYS */;
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
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `greeting_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday_image_file_size` int(11) DEFAULT NULL,
  `birthday_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greetings`
--

LOCK TABLES `greetings` WRITE;
/*!40000 ALTER TABLE `greetings` DISABLE KEYS */;
INSERT INTO `greetings` VALUES (1,'2017-06-22',1,1,'Happy Work Anniversary...',1,'2017-06-22 04:56:46','2017-06-22 04:56:46',NULL,NULL,NULL,NULL,NULL),(2,'2017-06-22',2,1,'best wishes',1,'2017-06-22 11:14:39','2017-06-22 11:14:39','Anniversary',NULL,NULL,NULL,NULL),(3,'2017-06-22',3,1,'Congo :)',1,'2017-06-22 12:24:40','2017-06-22 12:24:40','Anniversary',NULL,NULL,NULL,NULL),(4,'2017-08-01',250,307,'HBD',1,'2017-08-01 11:52:33','2017-08-01 11:52:33','Birthday',NULL,NULL,NULL,NULL),(5,'2017-08-01',250,307,'HBD',1,'2017-08-01 11:52:39','2017-08-01 11:52:39','Birthday',NULL,NULL,NULL,NULL),(6,'2017-09-15',307,254,'Congratulations Sir....',1,'2017-09-15 04:20:25','2017-09-15 04:20:25','Anniversary',NULL,NULL,NULL,NULL),(7,'2017-09-15',307,254,'Congratulations Sir...',1,'2017-09-15 04:21:13','2017-09-15 04:21:13','Anniversary',NULL,NULL,NULL,NULL),(8,'2017-09-15',258,254,'Happy Work Anniversary.... ',1,'2017-09-15 13:59:00','2017-09-15 13:59:00','Anniversary',NULL,NULL,NULL,NULL),(9,'2017-09-15',258,254,'Happy Work Anniversary.... ',1,'2017-09-15 14:03:32','2017-09-15 14:03:32','Anniversary',NULL,NULL,NULL,NULL),(10,'2017-09-25',307,266,'Happy Bday Ashish',1,'2017-09-25 04:50:59','2017-09-25 04:50:59','Birthday',NULL,NULL,NULL,NULL),(11,'2017-09-25',307,272,'Happy Bday Prashant',1,'2017-09-25 04:51:23','2017-09-25 04:51:23','Birthday',NULL,NULL,NULL,NULL),(12,'2017-09-25',265,266,'Happu Birthday\r\n',1,'2017-09-25 09:38:00','2017-09-25 09:38:00','Birthday',NULL,NULL,NULL,NULL),(13,'2017-09-25',265,272,'Pershya Laga Vadhdivshyachya Hardik Subhechyya ',1,'2017-09-25 09:45:28','2017-09-25 09:45:28','Birthday',NULL,NULL,NULL,NULL),(14,'2017-10-03',307,329,'Congratulations.....',1,'2017-10-03 09:35:36','2017-10-03 09:35:36','Anniversary',NULL,NULL,NULL,NULL),(15,'2017-10-07',258,278,'wish u happy birthday.....\r\n',1,'2017-10-07 10:06:05','2017-10-07 10:06:05','Birthday',NULL,NULL,NULL,NULL),(16,'2017-10-11',307,268,'Happy Bday Nitin',1,'2017-10-11 07:34:59','2017-10-11 07:34:59','Birthday',NULL,NULL,NULL,NULL),(17,'2017-10-11',307,268,'Happy Bday Nitin',1,'2017-10-11 07:35:07','2017-10-11 07:35:07','Birthday',NULL,NULL,NULL,NULL),(18,'2017-10-26',307,281,'Wish you many many happy returns of the day....',1,'2017-10-26 05:30:29','2017-10-26 05:30:29','Birthday',NULL,NULL,NULL,NULL),(19,'2017-10-26',301,281,'Happy Birthday!',1,'2017-10-26 12:59:54','2017-10-26 12:59:54','Birthday',NULL,NULL,NULL,NULL),(20,'2017-10-26',301,281,'Happy Birthday!',1,'2017-10-26 13:00:05','2017-10-26 13:00:05','Birthday',NULL,NULL,NULL,NULL),(21,'2017-10-27',307,265,'Happy bday Ishwar',1,'2017-10-27 04:20:25','2017-10-27 04:20:25','Birthday',NULL,NULL,NULL,NULL),(22,'2017-10-27',301,265,'Happy Birthday!',1,'2017-10-27 08:01:56','2017-10-27 08:01:56','Birthday',NULL,NULL,NULL,NULL),(23,'2017-10-28',307,308,'Wish you many many happy returns of the day....Happy bday brother...',1,'2017-10-28 04:31:29','2017-10-28 04:31:29','Birthday',NULL,NULL,NULL,NULL),(24,'2017-10-28',305,308,'Happy Birthday dear',1,'2017-10-28 05:36:09','2017-10-28 05:36:09','Birthday',NULL,NULL,NULL,NULL),(25,'2017-11-06',307,282,'Happy Bday Ganesh',1,'2017-11-06 07:21:57','2017-11-06 07:21:57','Birthday',NULL,NULL,NULL,NULL),(26,'2017-11-06',307,282,'Happy Bday Ganesh',1,'2017-11-06 07:22:27','2017-11-06 07:22:27','Birthday',NULL,NULL,NULL,NULL),(27,'2017-11-06',307,412,'Happy Bday Chandrakant, Enjoy your day',1,'2017-11-06 07:23:26','2017-11-06 07:23:26','Birthday',NULL,NULL,NULL,NULL),(28,'2017-11-15',307,397,'Happy bday....',1,'2017-11-15 06:52:19','2017-11-15 06:52:19','Birthday',NULL,NULL,NULL,NULL),(29,'2017-11-17',307,312,'Happy bday',1,'2017-11-17 06:19:30','2017-11-17 06:19:30','Anniversary',NULL,NULL,NULL,NULL),(30,'2017-11-27',307,310,'Congratulations...',1,'2017-11-27 04:48:06','2017-11-27 04:48:06','Anniversary',NULL,NULL,NULL,NULL),(31,'2017-11-28',307,276,'Congratulations....and Wishing you very best of luck for coming years....',1,'2017-11-28 04:31:14','2017-11-28 04:31:14','Anniversary',NULL,NULL,NULL,NULL),(32,'2017-11-28',307,277,'Congratulations....and Wishing you very best of luck for coming years....',1,'2017-11-28 04:31:26','2017-11-28 04:31:26','Anniversary',NULL,NULL,NULL,NULL),(33,'2017-11-28',307,406,'Happy birthday Kush..Enjoy your day.',1,'2017-11-28 04:31:54','2017-11-28 04:31:54','Birthday',NULL,NULL,NULL,NULL),(34,'2017-12-06',307,309,'Congratulation...',1,'2017-12-06 08:25:32','2017-12-06 08:25:32','Anniversary',NULL,NULL,NULL,NULL),(35,'2017-12-06',307,278,'Congratulations...',1,'2017-12-06 08:25:55','2017-12-06 08:25:55','Anniversary',NULL,NULL,NULL,NULL),(36,'2017-12-06',307,430,'Happy birthday Rajkumar...',1,'2017-12-06 08:26:25','2017-12-06 08:26:25','Birthday',NULL,NULL,NULL,NULL),(37,'2017-12-07',307,279,'Congratulations....',1,'2017-12-07 08:34:01','2017-12-07 08:34:01','Anniversary',NULL,NULL,NULL,NULL),(38,'2017-12-07',307,259,'Congratulations....',1,'2017-12-07 08:34:14','2017-12-07 08:34:14','Anniversary',NULL,NULL,NULL,NULL),(39,'2017-12-07',307,294,'Happy Bday',1,'2017-12-07 08:34:31','2017-12-07 08:34:31','Birthday',NULL,NULL,NULL,NULL),(40,'2017-12-12',307,280,'Congratulations....',1,'2017-12-12 06:28:31','2017-12-12 06:28:31','Anniversary',NULL,NULL,NULL,NULL),(41,'2017-12-13',307,263,'Happy birthday Shrikant...',1,'2017-12-13 04:50:45','2017-12-13 04:50:45','Birthday',NULL,NULL,NULL,NULL),(42,'2017-12-14',307,433,'Happy birthday Rupesh...',1,'2017-12-14 04:47:30','2017-12-14 04:47:30','Birthday',NULL,NULL,NULL,NULL),(43,'2017-12-15',307,328,'Happy Birthday',1,'2017-12-15 05:48:32','2017-12-15 05:48:32','Birthday',NULL,NULL,NULL,NULL),(44,'2017-12-15',307,350,'Happy Birthday',1,'2017-12-15 05:48:56','2017-12-15 05:48:56','Birthday',NULL,NULL,NULL,NULL),(45,'2017-12-15',307,350,'Happy Birthday',1,'2017-12-15 05:49:12','2017-12-15 05:49:12','Birthday',NULL,NULL,NULL,NULL),(46,'2017-12-19',307,282,'Hardik Abhinandan....',1,'2017-12-19 05:13:30','2017-12-19 05:13:30','Anniversary',NULL,NULL,NULL,NULL),(47,'2017-12-19',307,284,'Congratulations...',1,'2017-12-19 05:14:26','2017-12-19 05:14:26','Anniversary',NULL,NULL,NULL,NULL),(48,'2017-12-19',307,285,'Congratulations...',1,'2017-12-19 05:14:37','2017-12-19 05:14:37','Anniversary',NULL,NULL,NULL,NULL),(49,'2018-01-01',305,328,'Happy Birthday',1,'2018-01-01 06:44:52','2018-01-01 06:44:52','Anniversary',NULL,NULL,NULL,NULL),(53,'2018-01-04',305,428,'Happy Birthday !!!',1,'2018-01-04 11:37:08','2018-01-04 11:37:08','Birthday',NULL,NULL,NULL,NULL);
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
INSERT INTO `groups` VALUES (1,'spanpump@gmail.com','$2a$10$LOcqxOV7qd7WJg7bgXNXbubJxUX0ZefhQDjdPEbMjvFD7RoH4Z0jm','Span Pump ',NULL,NULL,NULL,9,'2017-07-27 08:50:11','2017-06-07 05:24:27','127.0.0.1','127.0.0.1','2017-05-26 21:11:38','2017-07-27 08:50:11',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'15','Independence day','','2017-08-15',NULL,0,'2017-08-11 11:23:31','2017-12-30 08:39:43',0,'National');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_activities`
--

LOCK TABLES `induction_activities` WRITE;
/*!40000 ALTER TABLE `induction_activities` DISABLE KEYS */;
INSERT INTO `induction_activities` VALUES (1,NULL,NULL,'00:00',NULL,1,'2017-08-12','15:45:00','15:45:00','',NULL,NULL,'Subal','','2017-08-11 10:20:48','2017-08-11 10:20:48',NULL,NULL,NULL,NULL,1),(2,NULL,NULL,'02:00',NULL,2,'2017-08-22','11:00:00','13:00:00','Meeting with subal for next plan',NULL,NULL,'Subal','','2017-08-22 07:33:15','2017-08-22 07:33:15',NULL,NULL,NULL,NULL,1),(3,NULL,NULL,'02:00',NULL,2,'2017-08-22','13:00:00','15:00:00','For Setup and Hrms aceess',NULL,NULL,'Vrushali','','2017-08-22 07:33:51','2017-08-22 07:33:51',NULL,NULL,NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_details`
--

LOCK TABLES `induction_details` WRITE;
/*!40000 ALTER TABLE `induction_details` DISABLE KEYS */;
INSERT INTO `induction_details` VALUES (1,307,NULL,1,1,'2017-08-11','2017-08-11 10:21:17','2017-08-11 10:22:38'),(2,307,NULL,1,0,NULL,'2017-08-11 10:21:37','2017-08-11 10:21:37'),(3,332,NULL,1,1,'2017-08-22','2017-08-22 07:20:08','2017-08-22 07:35:38'),(4,304,NULL,2,0,NULL,'2017-08-22 07:34:54','2017-08-22 07:34:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `induction_masters`
--

LOCK TABLES `induction_masters` WRITE;
/*!40000 ALTER TABLE `induction_masters` DISABLE KEYS */;
INSERT INTO `induction_masters` VALUES (1,'1','Labour Laws','2017-08-11 10:18:54','2017-08-11 10:19:16','Best_Regards.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',18235,'2017-08-11 10:19:16'),(2,'2','New','2017-08-22 07:31:08','2017-08-22 07:31:08',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalments`
--

LOCK TABLES `instalments` WRITE;
/*!40000 ALTER TABLE `instalments` DISABLE KEYS */;
INSERT INTO `instalments` VALUES (1,1,'2017-06-02',232.00,'2017-08-01 07:42:48','2017-08-01 10:34:37',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tracker_groups`
--

LOCK TABLES `issue_tracker_groups` WRITE;
/*!40000 ALTER TABLE `issue_tracker_groups` DISABLE KEYS */;
INSERT INTO `issue_tracker_groups` VALUES (1,'HR',NULL,'Extension 33',1,NULL,'2017-09-16 05:16:05','2017-09-16 05:16:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tracker_members`
--

LOCK TABLES `issue_tracker_members` WRITE;
/*!40000 ALTER TABLE `issue_tracker_members` DISABLE KEYS */;
INSERT INTO `issue_tracker_members` VALUES (1,1,307,1,NULL,'2017-09-16 05:17:21','2017-09-16 05:17:21','Admin'),(2,1,305,1,NULL,'2017-09-16 05:27:01','2017-09-16 05:27:01','Admin'),(3,1,308,1,NULL,'2017-09-16 05:27:27','2017-09-16 05:27:27','Admin'),(4,1,304,1,NULL,'2017-09-16 05:28:19','2017-09-16 05:28:19','Admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joining_details`
--

LOCK TABLES `joining_details` WRITE;
/*!40000 ALTER TABLE `joining_details` DISABLE KEYS */;
INSERT INTO `joining_details` VALUES (258,309,'1992-12-06',2,52,NULL,NULL,'0','','','0','1',NULL,'','Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:40:57',NULL,NULL),(259,310,'1997-11-27',2,57,NULL,NULL,'100798962427',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(260,311,'2001-01-05',2,53,NULL,NULL,'0','','','0','1',NULL,'','Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:41:35',NULL,NULL),(261,250,'2007-09-01',2,3,'2007-09-01',NULL,'100354303022','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','',1,NULL,2,3,'',0,1,NULL,NULL,1,1,1,NULL,1,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-12-30 09:04:24',NULL,0),(262,251,'2012-08-23',2,17,'2012-08-23',NULL,'100399445629',NULL,NULL,'0','1',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(263,312,'2012-11-17',2,30,NULL,NULL,'100529485341',NULL,NULL,'0','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(264,326,'2013-01-10',2,23,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:39:03',NULL,NULL),(265,252,'2013-12-01',2,71,NULL,NULL,'0','','','0','0',NULL,'','Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',0,NULL,2,3,'',NULL,1,NULL,NULL,0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-09-14 13:19:41',NULL,0),(266,253,'2014-04-10',2,55,'2014-10-10',NULL,'100059367632','','','6','3',NULL,'','Yes','0','2012-09-12','2022-09-11',NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:37:52',NULL,NULL),(267,254,'2014-09-15',2,59,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(268,255,'2014-10-27',2,43,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:30:35',NULL,NULL),(269,256,'2014-11-26',2,17,NULL,NULL,'100528902787',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(270,257,'2014-12-01',2,44,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:37:11',NULL,NULL),(271,327,'2014-12-01',2,25,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'yes','0','2015-04-17','2025-04-16',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(272,328,'2015-01-01',2,46,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:35:05',NULL,NULL),(273,313,'2015-02-17',2,36,NULL,NULL,'0',NULL,NULL,'0','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(274,258,'2015-03-02',2,21,NULL,NULL,'100528695268',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(275,314,'2015-09-01',2,70,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(276,315,'2015-11-20',2,54,NULL,NULL,'100664872968',NULL,NULL,'6','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(277,259,'2015-12-07',2,60,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(278,316,'2016-02-01',2,63,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(279,260,'2016-03-04',2,66,NULL,NULL,'100372172790',NULL,NULL,'0','3',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(280,261,'2016-03-09',2,19,NULL,NULL,'100987907523',NULL,NULL,'0','1',NULL,NULL,'Yes','0','2016-03-10','2026-03-09',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(281,262,'2016-04-01',2,17,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:31:28',NULL,NULL),(282,263,'2016-04-25',2,56,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(283,264,'2016-05-01',2,58,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(284,265,'2016-05-16',2,40,NULL,NULL,'100987907547',NULL,NULL,'0','0',NULL,NULL,'No','0','2016-11-21','2026-11-20',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(285,266,'2016-05-17',2,4,'2016-11-16',NULL,'100884018205',NULL,NULL,'0','0',NULL,NULL,'Yes','0','2010-12-30','2020-12-29',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(286,317,'2016-06-01',2,51,'2017-01-01',NULL,'100893490785',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(287,267,'2016-06-06',2,7,'2016-12-05',NULL,'100886459905',NULL,NULL,'0','3',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(288,268,'2016-06-06',2,7,'2016-12-05',NULL,'0',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(289,318,'2016-06-15',2,51,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(290,269,'2016-07-04',2,67,NULL,NULL,'100886733921',NULL,NULL,'6','3',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(291,270,'2016-07-04',2,17,NULL,NULL,'100890740169',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(292,271,'2016-07-23',2,31,'2017-01-11',NULL,'0',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(293,272,'2016-08-04',2,56,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(294,273,'2016-08-16',2,48,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(295,274,'2016-09-01',2,28,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:33:43',NULL,NULL),(296,275,'2016-09-12',2,69,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(297,329,'2016-10-03',2,26,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(298,330,'2016-11-02',2,61,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:39:42',NULL,NULL),(299,276,'2016-11-28',2,58,NULL,NULL,'0',NULL,NULL,'6','0',NULL,NULL,'Yes','0','2011-11-25','2021-11-24',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(300,277,'2016-11-28',2,5,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(301,278,'2016-12-06',2,35,'2017-06-06',NULL,'0','','','6','1',NULL,'','No','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:33:03',NULL,NULL),(302,279,'2016-12-07',2,65,NULL,NULL,'100987907484',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(303,280,'2016-12-12',2,24,'2017-06-12',NULL,'100308712891','','','6','3',NULL,'','Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:38:30',NULL,NULL),(304,281,'2016-12-15',2,18,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'No','',1,NULL,2,NULL,'',NULL,1,NULL,NULL,0,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-08-01 09:32:16',NULL,NULL),(305,282,'2016-12-19',2,39,'2016-12-19',NULL,'0',NULL,NULL,'6','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:46','2017-07-27 10:20:46',NULL,NULL),(306,283,'2016-12-19',2,14,'2017-06-19',NULL,'100987907506',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(307,284,'2016-12-19',2,14,'2017-06-19',NULL,'100752927302',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(308,285,'2016-12-19',2,14,'2017-06-19',NULL,'100987907478',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(309,319,'2016-12-20',2,68,NULL,NULL,'100241472509',NULL,NULL,'0','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(310,286,'2017-01-02',2,22,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(311,331,'2017-01-08',2,61,NULL,NULL,'0','','','0','0',NULL,'','','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',1,NULL,2,NULL,'',NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-08-01 09:40:16',NULL,NULL),(312,287,'2017-01-16',2,49,NULL,NULL,'100317374154',NULL,NULL,'6','0',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(313,288,'2017-01-20',2,27,NULL,NULL,'100529143822',NULL,NULL,'0','3',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(314,289,'2017-01-24',2,19,'2017-01-20',NULL,'0',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(315,290,'2017-02-01',2,32,NULL,NULL,'101044159372',NULL,NULL,'6','0',NULL,NULL,'Yes','0','2017-03-09','2027-03-08',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(316,291,'2017-02-14',2,64,NULL,NULL,'100989270154',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(317,292,'2017-02-17',2,68,'2017-08-16',NULL,'0',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(318,293,'2017-02-17',2,70,NULL,NULL,'0',NULL,NULL,'6','2',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(319,294,'2017-02-20',2,4,'2017-08-20',NULL,'100259907142',NULL,NULL,'6','1',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(320,320,'2017-03-01',2,70,NULL,NULL,'0',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(321,295,'2017-03-01',2,14,'2017-09-01',NULL,'101068913388',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(322,321,'2017-03-01',2,63,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(323,322,'2017-03-01',2,63,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(324,296,'2017-03-06',2,41,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(325,297,'2017-03-20',2,34,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(326,298,'2017-04-08',2,38,NULL,NULL,'0',NULL,NULL,'6','3',NULL,NULL,'Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,'2017-12-31','2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(327,323,'2017-04-12',2,4,NULL,NULL,'100111186302',NULL,NULL,'6','3',NULL,NULL,'Yes','0','2014-10-24','2024-10-23',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(328,299,'2017-04-13',2,70,'2017-10-12',NULL,'0',NULL,NULL,'6','1',NULL,NULL,'Yes','0','2015-05-28','2025-05-27',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(329,300,'2017-04-25',2,20,NULL,NULL,'100719072898',NULL,NULL,'6','6',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(330,301,'2017-05-04',2,33,NULL,NULL,'0',NULL,NULL,'6','0',NULL,NULL,'Yes','0','2016-03-03','2016-03-02',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(331,302,'2017-05-08',2,47,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(332,324,'2017-05-25',2,62,NULL,NULL,'0',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(333,303,'2017-05-29',2,38,NULL,NULL,'100514360459',NULL,NULL,'6','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(334,304,'2017-06-09',2,37,'2017-12-09',NULL,'101033185320','','','6','1',NULL,'','Yes','0',NULL,NULL,NULL,NULL,NULL,NULL,'Limit','15000',0,NULL,2,3,'',0,1,NULL,NULL,1,0,1,NULL,1,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-09-15 09:31:41',NULL,1),(335,305,'2017-06-15',2,10,'2017-12-14',NULL,'100624078194',NULL,NULL,'0','0',NULL,NULL,'Yes','0','2013-07-29','2023-07-28',NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(336,306,'2017-06-15',2,6,NULL,NULL,'100626539579',NULL,NULL,'3','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(337,325,'2017-06-27',2,50,NULL,NULL,'0',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(338,307,'2017-07-11',2,4,'2018-01-10',NULL,'0',NULL,NULL,'6','1',NULL,NULL,'No','0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-08-22 11:15:25',NULL,NULL),(339,308,'2017-07-13',2,4,NULL,NULL,'100613156673',NULL,NULL,'0','0',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'Yes',NULL,1,NULL,2,NULL,NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-07-27 10:20:47','2017-07-27 10:20:47',NULL,NULL),(340,332,'2017-06-15',3,9,NULL,NULL,'','','','184','1 month',NULL,'','No','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','',0,NULL,2,3,'',0,1,NULL,1,1,0,1,1,1,0,NULL,NULL,NULL,'2017-08-22 06:54:15','2017-08-22 11:17:13',NULL,0),(341,424,'2015-11-20',2,8,NULL,NULL,'','','','6','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,'Yes','',0,1,2,3,'',0,1,NULL,0,1,0,1,1,1,0,NULL,NULL,NULL,'2017-11-21 09:48:13','2017-11-21 09:59:37',NULL,0),(342,359,'2014-03-07',2,8,NULL,NULL,'','','','6','',NULL,'','','',NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,2,NULL,'',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-12-26 07:15:00','2017-12-26 07:15:00',NULL,0);
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
INSERT INTO `leav_categories` VALUES (1,'ML','ML','Casual Leave',1,1,NULL,NULL,1,1,NULL,0,1,1,0,1,'2017-05-26 21:09:51','2017-12-30 08:45:58',0,NULL,0),(2,'PL','PL','Earned Leave',NULL,1,NULL,NULL,1,1,NULL,0,1,1,0,NULL,'2017-05-26 21:09:51','2017-12-30 08:46:21',0,NULL,0),(3,'CL','CL','CL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:01:15',NULL,NULL,NULL),(4,'PPL','PPL','PPL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:02:03',NULL,NULL,NULL),(5,'FPL','FPL','FPL',NULL,1,NULL,NULL,1,1,NULL,NULL,0,1,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:02:56',NULL,NULL,NULL),(6,'LWP','LWP','LWP',NULL,0,NULL,NULL,1,0,NULL,NULL,0,0,0,NULL,'2017-05-26 21:09:51','2017-06-07 08:03:19',NULL,NULL,NULL),(7,'C.Off','Compensatory Off','',NULL,0,NULL,NULL,0,0,NULL,0,0,0,0,NULL,'2017-08-11 10:38:55','2017-08-11 10:38:55',NULL,NULL,NULL),(8,'MTL','Maternity Leave','',NULL,1,1,180,1,0,NULL,0,0,0,0,NULL,'2017-08-11 11:19:51','2017-08-11 11:20:06',NULL,NULL,NULL),(9,'PTL','Paternity Leave','Paternity Leave',NULL,1,0,3,1,0,NULL,0,0,0,0,NULL,'2017-08-22 09:19:27','2017-08-22 09:19:27',NULL,NULL,NULL),(10,'MRL','Marriage Leave','Marriage Leave',NULL,1,0,10,1,0,NULL,1,0,0,1,NULL,'2017-08-22 09:20:52','2017-11-13 08:46:56',NULL,NULL,0),(11,'AB','AB','xyz',NULL,1,NULL,NULL,1,1,NULL,1,1,1,1,NULL,'2017-12-30 07:57:59','2017-12-30 07:57:59',1,NULL,1);
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
  `comment` text COLLATE utf8_unicode_ci,
  `taken_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_leave_c_offs_on_employee_id` (`employee_id`),
  CONSTRAINT `fk_rails_9c0707de08` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_c_offs`
--

LOCK TABLES `leave_c_offs` WRITE;
/*!40000 ALTER TABLE `leave_c_offs` DISABLE KEYS */;
INSERT INTO `leave_c_offs` VALUES (1,332,'2017-08-26','Full Day',30,1,0,'2017-09-25',1.0,NULL,NULL,'FinalApproved','2017-08-22 09:52:17','2017-12-30 08:57:34',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_cash_masters`
--

LOCK TABLES `leave_cash_masters` WRITE;
/*!40000 ALTER TABLE `leave_cash_masters` DISABLE KEYS */;
INSERT INTO `leave_cash_masters` VALUES (1,'9','1',1,1,'2017-08-22 09:53:11','2017-12-30 08:06:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_cashables`
--

LOCK TABLES `leave_cashables` WRITE;
/*!40000 ALTER TABLE `leave_cashables` DISABLE KEYS */;
INSERT INTO `leave_cashables` VALUES (1,332,1,'2017-08-22','1','1',NULL,1,'2017-08-22 09:54:35','2017-08-22 09:54:35'),(2,250,2,'2017-08-22','3.0','2',1459,1,'2017-08-22 09:56:37','2017-08-22 09:56:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_masters`
--

LOCK TABLES `leave_masters` WRITE;
/*!40000 ALTER TABLE `leave_masters` DISABLE KEYS */;
INSERT INTO `leave_masters` VALUES (1,1,'Quarterly',NULL,'3',0,'',NULL,'2017-08-11 11:21:35','2017-12-04 11:21:30'),(2,2,'Quarterly',NULL,'3',1,'21',NULL,'2017-08-22 09:47:51','2017-08-22 09:47:51'),(3,11,'Monthly',120,'20',1,'20',150,'2017-12-30 07:59:01','2017-12-30 07:59:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_records`
--

LOCK TABLES `leave_records` WRITE;
/*!40000 ALTER TABLE `leave_records` DISABLE KEYS */;
INSERT INTO `leave_records` VALUES (1,1,287,1,NULL,'2017-09-16','FinalApproved',1,'2017-09-15 07:27:15','2017-09-15 07:27:15'),(2,2,275,1,NULL,'2017-09-14','FinalApproved',1,'2017-09-15 13:09:42','2017-09-15 13:09:42'),(3,3,305,1,NULL,'2017-09-16','FinalApproved',1,'2017-09-18 04:24:11','2017-09-18 04:24:11'),(4,4,288,1,NULL,'2017-09-23','FinalApproved',1,'2017-09-18 05:46:59','2017-09-18 05:46:59'),(5,5,259,1,NULL,'2017-10-21','FinalApproved',1,'2017-09-18 14:00:54','2017-09-18 14:00:54'),(6,6,289,1,NULL,'2017-09-12','FinalApproved',1,'2017-09-19 11:13:40','2017-09-19 11:13:40'),(7,7,259,2,NULL,'2017-10-16','FinalApproved',1,'2017-09-19 13:51:26','2017-09-19 13:51:26'),(8,8,254,1,NULL,'2017-09-23','Cancelled',1,'2017-09-20 05:12:52','2017-09-20 05:12:52'),(9,9,307,2,NULL,'2017-09-22','Cancelled',1,'2017-09-20 05:53:19','2017-09-20 05:53:19'),(10,10,276,1,NULL,'2017-09-23','FinalApproved',1,'2017-09-22 08:57:49','2017-09-22 08:57:49'),(11,11,301,1,NULL,'2017-09-22','Cancelled',1,'2017-09-22 11:10:28','2017-09-22 11:10:28'),(12,12,301,1,NULL,'2017-09-23','FinalApproved',1,'2017-09-22 13:49:19','2017-09-22 13:49:19'),(13,13,265,2,NULL,'2017-09-29','FinalApproved',1,'2017-09-26 13:03:47','2017-09-26 13:03:47'),(14,14,305,6,NULL,'2017-12-21','FinalApproved',1,'2017-12-30 08:04:45','2017-12-30 08:04:45'),(15,15,305,6,NULL,'2017-12-22','Cancelled',1,'2017-12-30 08:08:01','2017-12-30 08:08:01'),(16,16,305,6,NULL,'2017-12-29','Cancelled',1,'2018-01-04 11:39:40','2018-01-04 11:39:40'),(17,17,305,6,NULL,'2017-12-30','Pending',1,'2018-01-04 11:42:00','2018-01-04 11:42:00'),(18,18,305,6,NULL,'2017-12-27','Pending',1,'2018-01-04 11:43:25','2018-01-04 11:43:25'),(19,19,305,6,NULL,'2017-12-20','Pending',1,'2018-01-04 11:45:24','2018-01-04 11:45:24'),(20,20,305,6,NULL,'2017-12-29','Pending',1,'2018-01-04 12:26:07','2018-01-04 12:26:07'),(21,21,305,6,NULL,'2017-12-13','Pending',1,'2018-01-04 12:46:16','2018-01-04 12:46:16'),(22,22,305,6,NULL,'2017-12-01','Pending',1,'2018-01-04 12:58:15','2018-01-04 12:58:15'),(23,23,305,6,NULL,'2017-12-06','Pending',1,'2018-01-04 13:01:30','2018-01-04 13:01:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_status_records`
--

LOCK TABLES `leave_status_records` WRITE;
/*!40000 ALTER TABLE `leave_status_records` DISABLE KEYS */;
INSERT INTO `leave_status_records` VALUES (1,1,287,'Pending','2017-09-15 00:00:00','2017-09-15 07:27:15','2017-09-15 07:27:15'),(5,2,275,'Pending','2017-09-15 00:00:00','2017-09-15 13:09:42','2017-09-15 13:09:42'),(25,3,305,'Pending','2017-09-18 00:00:00','2017-09-18 04:24:11','2017-09-18 04:24:11'),(26,4,288,'Pending','2017-09-18 00:00:00','2017-09-18 05:46:59','2017-09-18 05:46:59'),(30,5,259,'Pending','2017-09-18 00:00:00','2017-09-18 14:00:54','2017-09-18 14:00:54'),(33,6,289,'Pending','2017-09-19 00:00:00','2017-09-19 11:13:40','2017-09-19 11:13:40'),(34,7,259,'Pending','2017-09-19 00:00:00','2017-09-19 13:51:26','2017-09-19 13:51:26'),(35,3,332,'FinalApproved','2017-09-20 03:26:52','2017-09-20 03:26:52','2017-09-20 03:26:52'),(37,2,332,'FinalApproved','2017-09-20 03:29:49','2017-09-20 03:29:49','2017-09-20 03:29:49'),(38,5,254,'FinalApproved','2017-09-20 05:10:07','2017-09-20 05:10:07','2017-09-20 05:10:07'),(39,1,254,'FinalApproved','2017-09-20 05:10:22','2017-09-20 05:10:22','2017-09-20 05:10:22'),(40,4,254,'FinalApproved','2017-09-20 05:10:36','2017-09-20 05:10:36','2017-09-20 05:10:36'),(41,7,254,'FinalApproved','2017-09-20 05:10:47','2017-09-20 05:10:47','2017-09-20 05:10:47'),(42,8,254,'Pending','2017-09-20 00:00:00','2017-09-20 05:12:52','2017-09-20 05:12:52'),(44,8,332,'FinalApproved','2017-09-20 05:28:25','2017-09-20 05:28:25','2017-09-20 05:28:25'),(45,9,307,'Pending','2017-09-20 00:00:00','2017-09-20 05:53:19','2017-09-20 05:53:19'),(47,6,307,'FinalApproved','2017-09-20 06:15:24','2017-09-20 06:15:24','2017-09-20 06:15:24'),(49,9,307,'Cancelled','2017-09-20 06:22:45','2017-09-20 06:22:45','2017-09-20 06:22:45'),(50,10,276,'Pending','2017-09-22 00:00:00','2017-09-22 08:57:49','2017-09-22 08:57:49'),(51,11,301,'Pending','2017-09-22 00:00:00','2017-09-22 11:10:28','2017-09-22 11:10:28'),(52,10,254,'FinalApproved','2017-09-22 12:57:38','2017-09-22 12:57:38','2017-09-22 12:57:38'),(53,11,301,'Cancelled','2017-09-22 13:48:42','2017-09-22 13:48:42','2017-09-22 13:48:42'),(54,12,301,'Pending','2017-09-22 00:00:00','2017-09-22 13:49:19','2017-09-22 13:49:19'),(55,12,254,'FinalApproved','2017-09-22 13:54:04','2017-09-22 13:54:04','2017-09-22 13:54:04'),(56,13,265,'Pending','2017-09-26 00:00:00','2017-09-26 13:03:47','2017-09-26 13:03:47'),(57,13,307,'FinalApproved','2017-09-28 06:10:29','2017-09-28 06:10:29','2017-09-28 06:10:29'),(58,14,305,'Pending','2017-12-30 00:00:00','2017-12-30 08:04:45','2017-12-30 08:04:45'),(59,14,304,'FinalApproved','2017-12-30 08:05:56','2017-12-30 08:05:56','2017-12-30 08:05:56'),(60,15,305,'Pending','2017-12-30 00:00:00','2017-12-30 08:08:01','2017-12-30 08:08:01'),(61,15,305,'Cancelled','2017-12-30 08:09:02','2017-12-30 08:09:02','2017-12-30 08:09:02'),(62,16,305,'Pending','2018-01-04 00:00:00','2018-01-04 11:39:40','2018-01-04 11:39:40'),(63,16,305,'Cancelled','2018-01-04 11:41:32','2018-01-04 11:41:32','2018-01-04 11:41:32'),(64,17,305,'Pending','2018-01-04 00:00:00','2018-01-04 11:42:00','2018-01-04 11:42:00'),(65,18,305,'Pending','2018-01-04 00:00:00','2018-01-04 11:43:25','2018-01-04 11:43:25'),(66,19,305,'Pending','2018-01-04 00:00:00','2018-01-04 11:45:24','2018-01-04 11:45:24'),(67,20,305,'Pending','2018-01-04 00:00:00','2018-01-04 12:26:07','2018-01-04 12:26:07'),(68,21,305,'Pending','2018-01-04 00:00:00','2018-01-04 12:46:16','2018-01-04 12:46:16'),(69,22,305,'Pending','2018-01-04 00:00:00','2018-01-04 12:58:15','2018-01-04 12:58:15'),(70,23,305,'Pending','2018-01-04 00:00:00','2018-01-04 13:01:30','2018-01-04 13:01:30');
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
  `employee_leav_balance_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `leav_category_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaving_reasons`
--

LOCK TABLES `leaving_reasons` WRITE;
/*!40000 ALTER TABLE `leaving_reasons` DISABLE KEYS */;
INSERT INTO `leaving_reasons` VALUES (1,'L1','Personal','',1,'2017-12-30 08:12:33','2017-12-30 08:12:33');
/*!40000 ALTER TABLE `leaving_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_approvals`
--

DROP TABLE IF EXISTS `loan_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_request_id` int(11) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `loan_type_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `no_of_emi` int(11) DEFAULT NULL,
  `emi` decimal(15,2) DEFAULT NULL,
  `loan_request_date` date DEFAULT NULL,
  `loan_approval_date` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_loan_approvals_on_loan_request_id` (`loan_request_id`),
  KEY `index_loan_approvals_on_membership_id` (`membership_id`),
  KEY `index_loan_approvals_on_loan_type_id` (`loan_type_id`),
  CONSTRAINT `fk_rails_2d99d43d95` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`),
  CONSTRAINT `fk_rails_b5e5bda6b5` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`),
  CONSTRAINT `fk_rails_d1ce721a4d` FOREIGN KEY (`loan_request_id`) REFERENCES `loan_requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_approvals`
--

LOCK TABLES `loan_approvals` WRITE;
/*!40000 ALTER TABLE `loan_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_emis`
--

DROP TABLE IF EXISTS `loan_emis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_emis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_approval_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `emi_amount` decimal(15,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_loan_emis_on_loan_approval_id` (`loan_approval_id`),
  CONSTRAINT `fk_rails_51e9ddb678` FOREIGN KEY (`loan_approval_id`) REFERENCES `loan_approvals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_emis`
--

LOCK TABLES `loan_emis` WRITE;
/*!40000 ALTER TABLE `loan_emis` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_emis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_requests`
--

DROP TABLE IF EXISTS `loan_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `loan_type_id` int(11) DEFAULT NULL,
  `request_to_id` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `no_of_emi` int(11) DEFAULT NULL,
  `emi` decimal(15,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_loan_requests_on_membership_id` (`membership_id`),
  KEY `index_loan_requests_on_loan_type_id` (`loan_type_id`),
  CONSTRAINT `fk_rails_3dc4034f30` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`),
  CONSTRAINT `fk_rails_e509cb2775` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_requests`
--

LOCK TABLES `loan_requests` WRITE;
/*!40000 ALTER TABLE `loan_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_types`
--

DROP TABLE IF EXISTS `loan_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `from` decimal(10,0) DEFAULT NULL,
  `to` decimal(10,0) DEFAULT NULL,
  `interest_rate` decimal(10,0) DEFAULT NULL,
  `interest_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_types`
--

LOCK TABLES `loan_types` WRITE;
/*!40000 ALTER TABLE `loan_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_histories`
--

LOCK TABLES `manager_histories` WRITE;
/*!40000 ALTER TABLE `manager_histories` DISABLE KEYS */;
INSERT INTO `manager_histories` VALUES (3,250,250,NULL,'2017-07-27',NULL,'2017-07-27 09:03:41','2017-07-27 09:03:41'),(4,307,304,NULL,'2017-08-01',NULL,'2017-08-01 11:40:09','2017-08-01 11:40:09'),(5,332,304,NULL,'2017-08-22',NULL,'2017-08-22 07:00:59','2017-08-22 07:00:59'),(6,251,255,NULL,'2017-09-11',NULL,'2017-09-11 11:27:51','2017-09-11 11:27:51'),(7,254,304,NULL,'2017-09-11',NULL,'2017-09-11 11:32:42','2017-09-11 11:32:42'),(8,252,304,NULL,'2017-09-11',NULL,'2017-09-11 11:42:04','2017-09-11 11:42:04'),(9,255,304,NULL,'2017-09-11',NULL,'2017-09-11 11:43:46','2017-09-11 11:43:46'),(10,253,252,NULL,'2017-09-11',NULL,'2017-09-11 11:44:41','2017-09-11 11:44:41'),(11,256,255,NULL,'2017-09-11',NULL,'2017-09-11 11:45:18','2017-09-11 11:45:18'),(12,257,304,NULL,'2017-09-11',NULL,'2017-09-11 11:45:40','2017-09-11 11:45:40'),(13,258,254,NULL,'2017-09-11',NULL,'2017-09-11 11:46:01','2017-09-11 11:46:01'),(14,259,254,NULL,'2017-09-11',NULL,'2017-09-11 11:46:37','2017-09-11 11:46:37'),(15,260,294,NULL,'2017-09-11',NULL,'2017-09-11 11:46:52','2017-09-11 11:46:52'),(16,261,307,NULL,'2017-09-11',NULL,'2017-09-11 11:47:09','2017-09-11 11:47:09'),(17,262,255,NULL,'2017-09-11',NULL,'2017-09-11 11:47:21','2017-09-11 11:47:21'),(18,263,257,NULL,'2017-09-11',NULL,'2017-09-11 11:47:36','2017-09-11 11:47:36'),(19,265,307,NULL,'2017-09-11',NULL,'2017-09-11 11:48:36','2017-09-11 11:48:36'),(20,266,304,NULL,'2017-09-11',NULL,'2017-09-11 11:49:02','2017-09-11 11:49:02'),(21,268,254,NULL,'2017-09-11',NULL,'2017-09-11 11:49:54','2017-09-11 11:49:54'),(22,267,254,NULL,'2017-09-11',NULL,'2017-09-11 11:50:12','2017-09-11 11:50:12'),(23,269,254,NULL,'2017-09-11',NULL,'2017-09-11 11:50:34','2017-09-11 11:50:34'),(24,270,255,NULL,'2017-09-11',NULL,'2017-09-11 11:50:49','2017-09-11 11:50:49'),(25,271,274,NULL,'2017-09-11',NULL,'2017-09-11 11:51:14','2017-09-11 11:51:14'),(26,272,257,NULL,'2017-09-11',NULL,'2017-09-11 11:52:25','2017-09-11 11:52:25'),(27,273,254,NULL,'2017-09-11',NULL,'2017-09-11 11:52:59','2017-09-11 11:52:59'),(28,274,304,NULL,'2017-09-11',NULL,'2017-09-11 11:53:21','2017-09-11 11:53:21'),(29,264,254,NULL,'2017-09-11',NULL,'2017-09-11 11:53:48','2017-09-11 11:53:48'),(30,275,304,NULL,'2017-09-11',NULL,'2017-09-11 11:53:52','2017-09-11 11:53:52'),(31,277,274,NULL,'2017-09-11',NULL,'2017-09-11 11:54:17','2017-09-11 11:54:17'),(32,276,254,NULL,'2017-09-11',NULL,'2017-09-11 11:55:24','2017-09-11 11:55:24'),(33,278,307,NULL,'2017-09-11',NULL,'2017-09-11 11:55:45','2017-09-11 11:55:45'),(34,279,252,NULL,'2017-09-11',NULL,'2017-09-11 11:56:12','2017-09-11 11:56:12'),(35,280,254,NULL,'2017-09-11',NULL,'2017-09-11 11:56:21','2017-09-11 11:56:21'),(36,282,307,NULL,'2017-09-11',NULL,'2017-09-11 11:59:04','2017-09-11 11:59:04'),(37,283,294,NULL,'2017-09-11',NULL,'2017-09-11 11:59:42','2017-09-11 11:59:42'),(38,286,304,NULL,'2017-09-11',NULL,'2017-09-11 12:01:41','2017-09-11 12:01:41'),(39,287,254,NULL,'2017-09-11',NULL,'2017-09-11 12:02:01','2017-09-11 12:02:01'),(40,288,254,NULL,'2017-09-11',NULL,'2017-09-11 12:02:23','2017-09-11 12:02:23'),(41,289,307,NULL,'2017-09-11',NULL,'2017-09-11 12:02:58','2017-09-11 12:02:58'),(42,290,257,NULL,'2017-09-11',NULL,'2017-09-11 12:04:34','2017-09-11 12:04:34'),(43,291,255,NULL,'2017-09-11',NULL,'2017-09-11 12:04:53','2017-09-11 12:04:53'),(44,292,294,NULL,'2017-09-11',NULL,'2017-09-11 12:05:15','2017-09-11 12:05:15'),(45,293,294,NULL,'2017-09-11',NULL,'2017-09-11 12:05:25','2017-09-11 12:05:25'),(46,294,304,NULL,'2017-09-11',NULL,'2017-09-11 12:05:49','2017-09-11 12:05:49'),(47,298,254,NULL,'2017-09-11',NULL,'2017-09-11 12:06:43','2017-09-11 12:06:43'),(48,299,294,NULL,'2017-09-11',NULL,'2017-09-11 12:06:56','2017-09-11 12:06:56'),(49,301,254,NULL,'2017-09-11',NULL,'2017-09-11 12:07:22','2017-09-11 12:07:22'),(50,302,304,NULL,'2017-09-11',NULL,'2017-09-11 12:07:34','2017-09-11 12:07:34'),(51,303,254,NULL,'2017-09-11',NULL,'2017-09-11 12:07:48','2017-09-11 12:07:48'),(52,304,252,NULL,'2017-09-11',NULL,'2017-09-11 12:08:24','2017-09-11 12:08:24'),(53,305,304,NULL,'2017-09-11',NULL,'2017-09-11 12:09:42','2017-09-11 12:09:42'),(54,306,274,NULL,'2017-09-11',NULL,'2017-09-11 12:10:05','2017-09-11 12:10:05'),(55,308,304,NULL,'2017-09-11',NULL,'2017-09-11 12:10:20','2017-09-11 12:10:20'),(56,309,252,NULL,'2017-09-11',NULL,'2017-09-11 12:10:36','2017-09-11 12:10:36'),(57,317,309,NULL,'2017-09-11',NULL,'2017-09-11 12:11:55','2017-09-11 12:11:55'),(58,318,309,NULL,'2017-09-11',NULL,'2017-09-11 12:12:17','2017-09-11 12:12:17'),(59,314,309,NULL,'2017-09-11',NULL,'2017-09-11 12:12:49','2017-09-11 12:12:49'),(60,319,309,NULL,'2017-09-11',NULL,'2017-09-11 12:13:04','2017-09-11 12:13:04'),(61,320,309,NULL,'2017-09-11',NULL,'2017-09-11 12:13:30','2017-09-11 12:13:30'),(62,323,309,NULL,'2017-09-11',NULL,'2017-09-11 12:14:01','2017-09-11 12:14:01'),(63,324,309,NULL,'2017-09-11',NULL,'2017-09-11 12:14:28','2017-09-11 12:14:28'),(64,326,304,NULL,'2017-09-11',NULL,'2017-09-11 12:14:59','2017-09-11 12:14:59'),(65,327,304,NULL,'2017-09-11',NULL,'2017-09-11 12:15:12','2017-09-11 12:15:12'),(66,328,304,NULL,'2017-09-11',NULL,'2017-09-11 12:18:01','2017-09-11 12:18:01'),(67,329,304,NULL,'2017-09-11',NULL,'2017-09-11 12:18:25','2017-09-11 12:18:25'),(68,330,304,NULL,'2017-09-11',NULL,'2017-09-11 12:18:48','2017-09-11 12:18:48'),(69,331,304,NULL,'2017-09-11',NULL,'2017-09-11 12:19:02','2017-09-11 12:19:02'),(70,281,255,NULL,'2017-09-11',NULL,'2017-09-11 12:35:29','2017-09-11 12:35:29'),(71,284,294,NULL,'2017-09-11',NULL,'2017-09-11 12:35:42','2017-09-11 12:35:42'),(72,285,294,NULL,'2017-09-11',NULL,'2017-09-11 12:35:50','2017-09-11 12:35:50'),(73,295,294,NULL,'2017-09-11',NULL,'2017-09-11 12:35:58','2017-09-11 12:35:58'),(74,297,304,NULL,'2017-09-11',NULL,'2017-09-11 12:36:07','2017-09-11 12:36:07'),(75,296,254,NULL,'2017-09-11',NULL,'2017-09-11 12:36:57','2017-09-11 12:36:57'),(76,310,309,NULL,'2017-09-11',NULL,'2017-09-11 12:37:18','2017-09-11 12:37:18'),(77,311,309,NULL,'2017-09-11',NULL,'2017-09-11 12:37:27','2017-09-11 12:37:27'),(78,312,309,NULL,'2017-09-11',NULL,'2017-09-11 12:39:32','2017-09-11 12:39:32'),(79,315,309,NULL,'2017-09-11',NULL,'2017-09-11 12:39:52','2017-09-11 12:39:52'),(80,316,309,NULL,'2017-09-11',NULL,'2017-09-11 12:40:02','2017-09-11 12:40:02'),(81,321,309,NULL,'2017-09-11',NULL,'2017-09-11 12:40:11','2017-09-11 12:40:11'),(82,322,309,NULL,'2017-09-11',NULL,'2017-09-11 12:40:21','2017-09-11 12:40:21'),(83,325,309,NULL,'2017-09-11',NULL,'2017-09-11 12:40:33','2017-09-11 12:40:33'),(84,300,294,NULL,'2017-09-11',NULL,'2017-09-11 12:40:57','2017-09-11 12:40:57'),(85,313,309,NULL,'2017-09-11',NULL,'2017-09-11 12:41:47','2017-09-11 12:41:47'),(86,423,424,NULL,'2017-11-15',NULL,'2017-11-15 04:26:50','2017-11-15 04:26:50'),(87,424,424,NULL,'2017-11-15',NULL,'2017-11-15 04:27:30','2017-11-15 04:27:30'),(88,425,253,NULL,'2017-11-15',NULL,'2017-11-15 04:27:58','2017-11-15 04:27:58'),(89,426,424,NULL,'2017-11-15',NULL,'2017-11-15 04:28:38','2017-11-15 04:28:38'),(90,427,425,NULL,'2017-11-15',NULL,'2017-11-15 04:29:16','2017-11-15 04:29:16'),(91,428,425,NULL,'2017-11-15',NULL,'2017-11-15 04:29:18','2017-11-15 04:29:18'),(92,435,253,NULL,'2017-11-15',NULL,'2017-11-15 04:31:05','2017-11-15 04:31:05'),(93,436,253,NULL,'2017-11-15',NULL,'2017-11-15 04:31:06','2017-11-15 04:31:06'),(94,334,342,NULL,'2017-11-15',NULL,'2017-11-15 04:34:41','2017-11-15 04:34:41'),(95,336,329,NULL,'2017-11-15',NULL,'2017-11-15 04:35:25','2017-11-15 04:35:25'),(96,335,342,NULL,'2017-11-15',NULL,'2017-11-15 04:35:26','2017-11-15 04:35:26'),(97,338,342,NULL,'2017-11-15',NULL,'2017-11-15 04:36:02','2017-11-15 04:36:02'),(98,337,342,NULL,'2017-11-15',NULL,'2017-11-15 04:36:02','2017-11-15 04:36:02'),(99,339,342,NULL,'2017-11-15',NULL,'2017-11-15 04:36:41','2017-11-15 04:36:41'),(100,340,342,NULL,'2017-11-15',NULL,'2017-11-15 04:36:42','2017-11-15 04:36:42'),(101,342,253,NULL,'2017-11-15',NULL,'2017-11-15 04:37:10','2017-11-15 04:37:10'),(102,343,304,NULL,'2017-11-15',NULL,'2017-11-15 04:37:34','2017-11-15 04:37:34'),(103,344,329,NULL,'2017-11-15',NULL,'2017-11-15 04:37:56','2017-11-15 04:37:56'),(104,346,347,NULL,'2017-11-15',NULL,'2017-11-15 04:39:19','2017-11-15 04:39:19'),(105,348,347,NULL,'2017-11-15',NULL,'2017-11-15 04:39:20','2017-11-15 04:39:20'),(106,431,253,NULL,'2017-11-15',NULL,'2017-11-15 04:40:32','2017-11-15 04:40:32'),(107,433,253,NULL,'2017-11-15',NULL,'2017-11-15 04:41:15','2017-11-15 04:41:15'),(108,351,253,NULL,'2017-11-15',NULL,'2017-11-15 04:48:06','2017-11-15 04:48:06'),(109,352,401,NULL,'2017-11-15',NULL,'2017-11-15 04:48:43','2017-11-15 04:48:43'),(110,353,401,NULL,'2017-11-15',NULL,'2017-11-15 04:49:25','2017-11-15 04:49:25'),(111,355,351,NULL,'2017-11-15',NULL,'2017-11-15 04:50:07','2017-11-15 04:50:07'),(112,358,401,NULL,'2017-11-15',NULL,'2017-11-15 05:06:30','2017-11-15 05:06:30'),(113,359,391,NULL,'2017-11-15',NULL,'2017-11-15 05:08:26','2017-11-15 05:08:26'),(114,360,353,NULL,'2017-11-15',NULL,'2017-11-15 05:09:19','2017-11-15 05:09:19'),(115,361,253,NULL,'2017-11-15',NULL,'2017-11-15 05:20:49','2017-11-15 05:20:49'),(116,362,401,NULL,'2017-11-15',NULL,'2017-11-15 05:24:27','2017-11-15 05:24:27'),(117,363,353,NULL,'2017-11-15',NULL,'2017-11-15 05:25:53','2017-11-15 05:25:53'),(118,364,353,NULL,'2017-11-15',NULL,'2017-11-15 05:25:54','2017-11-15 05:25:54'),(119,365,391,NULL,'2017-11-15',NULL,'2017-11-15 05:25:56','2017-11-15 05:25:56'),(120,366,351,NULL,'2017-11-15',NULL,'2017-11-15 05:25:57','2017-11-15 05:25:57'),(121,367,351,NULL,'2017-11-15',NULL,'2017-11-15 05:25:58','2017-11-15 05:25:58'),(122,368,391,NULL,'2017-11-15',NULL,'2017-11-15 05:34:52','2017-11-15 05:34:52'),(123,370,351,NULL,'2017-11-15',NULL,'2017-11-15 05:35:10','2017-11-15 05:35:10'),(124,349,425,NULL,'2017-11-15',NULL,'2017-11-15 06:37:57','2017-11-15 06:37:57'),(125,371,351,NULL,'2017-11-15',NULL,'2017-11-15 06:39:41','2017-11-15 06:39:41'),(126,372,401,NULL,'2017-11-15',NULL,'2017-11-15 06:41:25','2017-11-15 06:41:25'),(127,373,358,NULL,'2017-11-15',NULL,'2017-11-15 06:44:27','2017-11-15 06:44:27'),(128,374,351,NULL,'2017-11-15',NULL,'2017-11-15 06:46:48','2017-11-15 06:46:48'),(129,375,353,NULL,'2017-11-15',NULL,'2017-11-15 06:47:16','2017-11-15 06:47:16'),(130,376,353,NULL,'2017-11-15',NULL,'2017-11-15 06:47:17','2017-11-15 06:47:17'),(131,377,351,NULL,'2017-11-15',NULL,'2017-11-15 06:47:48','2017-11-15 06:47:48'),(132,378,401,NULL,'2017-11-15',NULL,'2017-11-15 06:48:13','2017-11-15 06:48:13'),(133,379,353,NULL,'2017-11-15',NULL,'2017-11-15 06:49:03','2017-11-15 06:49:03'),(134,380,353,NULL,'2017-11-15',NULL,'2017-11-15 06:49:04','2017-11-15 06:49:04'),(135,381,353,NULL,'2017-11-15',NULL,'2017-11-15 06:49:06','2017-11-15 06:49:06'),(144,384,353,NULL,'2017-11-15',NULL,'2017-11-15 09:21:40','2017-11-15 09:21:40'),(145,383,353,NULL,'2017-11-15',NULL,'2017-11-15 09:21:41','2017-11-15 09:21:41'),(146,382,353,NULL,'2017-11-15',NULL,'2017-11-15 09:21:43','2017-11-15 09:21:43'),(147,385,353,NULL,'2017-11-15',NULL,'2017-11-15 09:23:00','2017-11-15 09:23:00'),(148,386,353,NULL,'2017-11-15',NULL,'2017-11-15 09:23:01','2017-11-15 09:23:01'),(149,387,391,NULL,'2017-11-15',NULL,'2017-11-15 09:28:44','2017-11-15 09:28:44'),(150,388,391,NULL,'2017-11-15',NULL,'2017-11-15 09:28:58','2017-11-15 09:28:58'),(151,389,353,NULL,'2017-11-15',NULL,'2017-11-15 09:29:17','2017-11-15 09:29:17'),(152,390,351,NULL,'2017-11-15',NULL,'2017-11-15 09:29:48','2017-11-15 09:29:48'),(153,391,401,NULL,'2017-11-15',NULL,'2017-11-15 09:30:12','2017-11-15 09:30:12'),(154,392,253,NULL,'2017-11-15',NULL,'2017-11-15 09:30:31','2017-11-15 09:30:31'),(155,393,353,NULL,'2017-11-15',NULL,'2017-11-15 09:31:03','2017-11-15 09:31:03'),(156,394,353,NULL,'2017-11-15',NULL,'2017-11-15 09:31:04','2017-11-15 09:31:04'),(157,397,353,NULL,'2017-11-15',NULL,'2017-11-15 09:32:06','2017-11-15 09:32:06'),(158,396,353,NULL,'2017-11-15',NULL,'2017-11-15 09:32:07','2017-11-15 09:32:07'),(159,395,353,NULL,'2017-11-15',NULL,'2017-11-15 09:32:08','2017-11-15 09:32:08'),(160,398,401,NULL,'2017-11-15',NULL,'2017-11-15 09:32:48','2017-11-15 09:32:48'),(161,399,351,NULL,'2017-11-15',NULL,'2017-11-15 09:33:08','2017-11-15 09:33:08'),(162,400,257,NULL,'2017-11-15',NULL,'2017-11-15 09:33:24','2017-11-15 09:33:24'),(163,401,253,NULL,'2017-11-15',NULL,'2017-11-15 09:33:43','2017-11-15 09:33:43'),(164,402,358,NULL,'2017-11-15',NULL,'2017-11-15 09:34:09','2017-11-15 09:34:09'),(165,403,353,NULL,'2017-11-15',NULL,'2017-11-15 09:34:59','2017-11-15 09:34:59'),(166,406,392,NULL,'2017-11-15',NULL,'2017-11-15 09:35:50','2017-11-15 09:35:50'),(167,407,400,NULL,'2017-11-15',NULL,'2017-11-15 09:36:17','2017-11-15 09:36:17'),(168,408,400,NULL,'2017-11-15',NULL,'2017-11-15 09:36:18','2017-11-15 09:36:18'),(169,409,358,NULL,'2017-11-15',NULL,'2017-11-15 09:36:40','2017-11-15 09:36:40'),(170,410,353,NULL,'2017-11-15',NULL,'2017-11-15 09:37:24','2017-11-15 09:37:24'),(171,411,351,NULL,'2017-11-15',NULL,'2017-11-15 09:37:39','2017-11-15 09:37:39'),(172,412,401,NULL,'2017-11-15',NULL,'2017-11-15 09:38:40','2017-11-15 09:38:40'),(173,413,391,NULL,'2017-11-15',NULL,'2017-11-15 09:38:53','2017-11-15 09:38:53'),(174,414,400,NULL,'2017-11-15',NULL,'2017-11-15 09:39:20','2017-11-15 09:39:20'),(175,415,358,NULL,'2017-11-15',NULL,'2017-11-15 09:39:43','2017-11-15 09:39:43'),(176,416,358,NULL,'2017-11-15',NULL,'2017-11-15 09:40:05','2017-11-15 09:40:05'),(177,417,358,NULL,'2017-11-15',NULL,'2017-11-15 09:40:39','2017-11-15 09:40:39'),(178,418,358,NULL,'2017-11-15',NULL,'2017-11-15 09:40:56','2017-11-15 09:40:56'),(179,419,358,NULL,'2017-11-15',NULL,'2017-11-15 09:41:57','2017-11-15 09:41:57'),(180,420,358,NULL,'2017-11-15',NULL,'2017-11-15 09:42:10','2017-11-15 09:42:10'),(181,421,358,NULL,'2017-11-15',NULL,'2017-11-15 09:42:24','2017-11-15 09:42:24'),(182,422,392,NULL,'2017-11-15',NULL,'2017-11-15 09:42:41','2017-11-15 09:42:41'),(183,437,391,NULL,'2017-11-15',NULL,'2017-11-15 09:42:59','2017-11-15 09:42:59'),(184,438,358,NULL,'2017-11-15',NULL,'2017-11-15 09:43:12','2017-11-15 09:43:12'),(185,439,353,NULL,'2017-11-15',NULL,'2017-11-15 09:43:33','2017-11-15 09:43:33'),(186,440,391,NULL,'2017-11-15',NULL,'2017-11-15 09:43:51','2017-11-15 09:43:51'),(187,442,392,NULL,'2017-11-15',NULL,'2017-11-15 09:44:09','2017-11-15 09:44:09'),(188,443,392,NULL,'2017-11-15',NULL,'2017-11-15 09:44:31','2017-11-15 09:44:31'),(189,444,304,NULL,'2017-11-15',NULL,'2017-11-15 09:44:54','2017-11-15 09:44:54'),(190,457,309,NULL,'2017-11-15',NULL,'2017-11-15 09:45:30','2017-11-15 09:45:30'),(191,456,309,NULL,'2017-11-15',NULL,'2017-11-15 09:45:42','2017-11-15 09:45:42'),(192,458,309,NULL,'2017-11-15',NULL,'2017-11-15 09:45:55','2017-11-15 09:45:55'),(193,454,254,NULL,'2017-11-15',NULL,'2017-11-15 09:46:18','2017-11-15 09:46:18'),(194,453,304,NULL,'2017-11-15',NULL,'2017-11-15 09:46:39','2017-11-15 09:46:39'),(195,447,254,NULL,'2017-11-15',NULL,'2017-11-15 09:47:06','2017-11-15 09:47:06'),(196,451,304,NULL,'2017-11-15',NULL,'2017-11-15 09:47:24','2017-11-15 09:47:24'),(197,446,254,NULL,'2017-11-15',NULL,'2017-11-15 09:47:37','2017-11-15 09:47:37'),(198,445,294,NULL,'2017-11-15',NULL,'2017-11-15 09:48:10','2017-11-15 09:48:10'),(199,441,342,NULL,'2017-11-15',NULL,'2017-11-15 09:48:44','2017-11-15 09:48:44'),(200,448,261,NULL,'2017-11-15',NULL,'2017-11-15 09:50:01','2017-11-15 09:50:01'),(201,450,261,NULL,'2017-11-15',NULL,'2017-11-15 09:50:18','2017-11-15 09:50:18'),(202,455,261,NULL,'2017-11-15',NULL,'2017-11-15 09:50:30','2017-11-15 09:50:30'),(203,449,304,NULL,'2017-11-15',NULL,'2017-11-15 09:50:49','2017-11-15 09:50:49'),(204,452,304,NULL,'2017-11-15',NULL,'2017-11-15 09:50:49','2017-11-15 09:50:49'),(205,432,347,NULL,'2017-11-15',NULL,'2017-11-15 09:51:04','2017-11-15 09:51:04'),(206,347,253,NULL,'2017-11-15',NULL,'2017-11-15 09:51:18','2017-11-15 09:51:18'),(207,251,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22'),(208,256,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22'),(209,262,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22'),(210,270,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22'),(211,281,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22'),(212,291,453,NULL,'2017-11-15',NULL,'2017-11-15 09:56:22','2017-11-15 09:56:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (3,'100001',6,'EMP0000250',NULL,'smarathe@spanpump.com','$2a$10$UTYsUQHY7C2CuvjlnvBZ.uREYw91BGufr/8ZxGuuJ0yqy/e/sxidO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,'2018-01-09 07:42:14','2018-01-08 04:06:54','127.0.0.1','127.0.0.1','2017-07-27 09:03:41','2018-01-09 07:42:14',1,1,20,250,NULL,NULL,NULL,NULL),(4,'100058',1,'EMP0000307',NULL,'parag@spanpump.com','$2a$10$WHrf/bdmzHiUe4iOE4esSerNj7ZgzjL36s.snSB3E8/ww.Rr3mGNC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,'2017-12-27 11:15:01','2017-12-27 04:51:39','123.201.119.62','219.91.210.208','2017-08-01 11:40:09','2018-01-05 10:48:52',1,1,24,307,NULL,'image/jpeg',528590,'2017-09-16 10:42:10'),(5,'100060',1,'EMP0000332',NULL,'vrushalipatade@gmail.com','$2a$10$TO3biR8.YYTzlLjXRfNDje8v5u9n7uFD7ngbGm.KF2He9OU8g0aJq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,'2017-12-15 07:22:05','2017-09-14 07:10:38','114.143.205.226','127.0.0.1','2017-08-22 07:00:59','2018-01-05 10:48:52',1,1,20,332,NULL,NULL,NULL,NULL),(6,'100002',6,'EMP0000251',NULL,'hoacc2@spanpump.com','$2a$10$5ZlRyBsrAdiJulA3THj1puC0JjSHUUJz6Uh/KIRMG4zyakLu8bQpq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,'2017-10-05 04:03:53','2017-10-04 03:52:53','192.168.1.112','192.168.1.112','2017-09-11 11:27:51','2018-01-05 10:48:52',1,1,1,251,NULL,NULL,NULL,NULL),(7,'100005',4,'EMP0000254',NULL,'shrikant.varpe@spanpump.com','$2a$10$8ggmyImguMKf/2MQcJAtuexBKsMc/d/3vA9bFTT/zLgOhoLPFf4p2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,43,'2017-10-13 09:35:15','2017-10-05 03:41:31','192.168.1.155','192.168.1.155','2017-09-11 11:32:42','2018-01-05 10:48:53',1,1,29,254,NULL,NULL,NULL,NULL),(8,'100003',4,'EMP0000252',NULL,'suyash@spanpump.com','$2a$10$iYOnVQ4e.3o6hPe6KAAsaeoWcZl7aNZW2v95NJpSBIWZQGNgZk1rK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'2017-09-14 12:55:00','2017-09-14 04:46:21','192.168.0.112','192.168.0.112','2017-09-11 11:42:04','2018-01-05 10:48:53',1,1,27,252,NULL,NULL,NULL,NULL),(9,'100006',4,'EMP0000255',NULL,'vishal.h@indibasolutions.com','$2a$10$6nlakWC8Q3YyqrEsKnVFke4nd4J.BDjxBs3xt3XubiuM5QtvXgiIG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:43:46','2018-01-05 10:48:53',1,1,20,255,NULL,NULL,NULL,NULL),(10,'100004',4,'EMP0000253',NULL,'sreekanth@spanpump.com','$2a$10$fYvJA7uInZojgY59XRQq/ei0mgNk4/.X3MFne50Hf6MVV0DHNhn7i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:44:41','2018-01-05 10:48:53',1,1,NULL,253,NULL,NULL,NULL,NULL),(11,'100007',6,'EMP0000256',NULL,'hoacc3@spanpump.com','$2a$10$onigZHA96tnBWQrWlMf3.ezNOsOxqNr0XewmdG6hyONv6j2l8YDwG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'2017-10-05 05:12:33','2017-10-03 04:50:07','192.168.0.111','192.168.0.111','2017-09-11 11:45:18','2018-01-05 10:48:53',1,1,1,256,NULL,NULL,NULL,NULL),(12,'100008',4,'EMP0000257',NULL,'sandeep.gawde@spanpump.com','$2a$10$eLKnxQdNxGACNGNWnhfO2ONJk9F4ioFefelhXyccsvct11.CjcU/u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,'2017-10-14 05:13:04','2017-09-28 12:15:21','192.168.1.134','192.168.1.134','2017-09-11 11:45:40','2018-01-05 10:48:53',1,1,2,257,NULL,NULL,NULL,NULL),(13,'100009',6,'EMP0000258',NULL,'suhas.kopnar@spanpump.com','$2a$10$iBXMcSgcfh9ike10gNYZsuiTCoYTl/0Eb5RwBxQ9piMtFg9w42MTO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-03 04:41:51',24,'2017-10-28 04:53:24','2017-10-26 05:17:29','192.168.0.123','192.168.0.123','2017-09-11 11:46:01','2018-01-05 10:48:54',1,1,29,258,NULL,'image/jpeg',5860715,'2017-09-13 09:03:01'),(14,'100010',6,'EMP0000259',NULL,'pavan@spanpump.com','$2a$10$l2ytd/UHdxDm7tNRKftwIOk9w0I9kVP41vOVbrwX/XBVgi68lcTdq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,'2017-10-26 05:21:04','2017-10-13 06:23:30','192.168.1.144','192.168.1.144','2017-09-11 11:46:37','2018-01-05 10:48:54',1,1,29,259,NULL,NULL,NULL,NULL),(15,'100011',6,'EMP0000260',NULL,'supriya@spanpump.com','$2a$10$LBFshTTKkeFL49DoLhCUV.cNdAvFEcFYg2Ea17YKiYpW89js.CKSK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:46:52','2018-01-05 10:48:54',1,1,NULL,260,NULL,NULL,NULL,NULL),(16,'100012',6,'EMP0000261',NULL,'hoadmin@spanpump.com','$2a$10$ICU.7Et787l.apMGFCvTO.O3FfvkLPsL1phuhMHXDWGCKpLrus4ky',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'2017-09-28 04:07:40','2017-09-22 06:51:06','192.168.1.107','192.168.1.107','2017-09-11 11:47:09','2018-01-05 10:48:54',1,1,21,261,NULL,NULL,NULL,NULL),(17,'100013',6,'EMP0000262',NULL,'dandekarcp@gmail.com','$2a$10$Us9l0KhIM/67sYeIk.OXVewO3QierYmiTlycUHqAXWF5Va9Y2KRJW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:47:21','2018-01-05 10:48:54',1,1,1,262,NULL,NULL,NULL,NULL),(18,'100014',6,'EMP0000263',NULL,'shrikant.c@spanpump.com','$2a$10$goPrMMCbZOJYUfuRrOb12u1xyGfRJm1JTa2r1GU2RdWN3PuyYdw/2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'2017-09-14 04:45:02','2017-09-13 11:53:08','192.168.1.141','192.168.1.141','2017-09-11 11:47:36','2018-01-05 10:48:54',1,1,31,263,NULL,'image/jpeg',20600,'2017-09-13 06:39:19'),(19,'100016',6,'EMP0000265',NULL,'itadmin@spanpump.com','$2a$10$Qras.6kflccuNd4vmsA68.5Gj7lfycMuDhCKrHYi2O22uAuA62plm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-25 09:36:05',22,'2017-10-30 06:45:48','2017-10-27 04:21:11','192.168.1.109','192.168.1.109','2017-09-11 11:48:36','2018-01-05 10:48:55',1,1,25,265,NULL,'image/jpeg',73939,'2017-09-13 06:24:58'),(20,'100017',6,'EMP0000266',NULL,'tenders_am@spanpump.com','$2a$10$CDkT9efR62.6MHfHjLr2C.mce8jYAKZ7qXI3eY4/92vEpEvZ3sckq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,'2017-09-23 04:01:20','2017-09-22 13:27:50','192.168.1.110','192.168.1.110','2017-09-11 11:49:02','2018-01-05 10:48:55',1,1,5,266,NULL,NULL,NULL,NULL),(21,'100019',6,'EMP0000268',NULL,'nitin.aher@spanpump.com','$2a$10$kdmRMQqOocMIkU50wI8Tqexu//DTZppuoGjjnJ7/VeZ4Syw9fKlWq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-27 03:05:58',42,'2017-10-30 04:38:19','2017-10-27 03:05:58','192.168.0.124','192.168.0.124','2017-09-11 11:49:54','2018-01-05 10:48:55',1,1,29,268,NULL,NULL,NULL,NULL),(22,'100018',6,'EMP0000267',NULL,'yogita.jadhav@spanpump.com','$2a$10$6Se4DrN6NMCHVN0JPhekrOsInQKmrp3EdM40v8p/nDkaTAJtp8PTG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42,'2017-10-28 04:36:10','2017-10-14 05:40:13','192.168.0.120','192.168.0.124','2017-09-11 11:50:12','2018-01-05 10:48:55',1,1,29,267,NULL,NULL,NULL,NULL),(23,'100020',6,'EMP0000269',NULL,'amit.jagtap@spanpump.com','$2a$10$xbXna.5/P7nnyXukU6GjjehZ9uAkvtZOQah5qJ00b9Huo0UbXVE8C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46,'2017-10-30 04:25:57','2017-10-27 14:02:59','192.168.0.126','192.168.0.126','2017-09-11 11:50:34','2018-01-05 10:48:55',1,1,29,269,NULL,NULL,NULL,NULL),(24,'100021',6,'EMP0000270',NULL,'hoacc1@spanpump.com','$2a$10$yKXD5bnkhRHPMoZLBa88muRQRAKTtohHhp8Da1WH69uf0ib3mP4C2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,'2017-10-04 04:13:19','2017-10-03 05:55:05','192.168.1.103','192.168.1.103','2017-09-11 11:50:49','2018-01-05 10:48:55',1,1,1,270,NULL,NULL,NULL,NULL),(25,'100022',6,'EMP0000271',NULL,'designexec@spanpump.com','$2a$10$hPJ.dU13J3KPTZuYQvfSEegCv1JbH9Z/b0dx1MKtJPfm6iTr/Q.3u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,'2017-10-05 13:25:04','2017-10-05 04:42:03','192.168.1.122','192.168.1.122','2017-09-11 11:51:14','2018-01-05 10:48:56',1,1,23,271,NULL,NULL,NULL,NULL),(26,'100023',6,'EMP0000272',NULL,'prashant.pawar@spanpump.com','$2a$10$gwsI.W2mtSTdsbyTgwsOz.cASaDeGoOM/fGP.vewP.7nYqzujh/fe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,'2017-09-28 13:02:15','2017-09-28 12:01:41','192.168.1.140','192.168.1.140','2017-09-11 11:52:25','2018-01-05 10:48:56',1,1,2,272,NULL,NULL,NULL,NULL),(27,'100024',6,'EMP0000273',NULL,'pankaj.pasalkar@spanpump.com','$2a$10$A45WLOrm4nDldXzG1pprJ.DziAY.b7CWTAxKTEpi6E.Iyo28jblsK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48,'2017-10-17 03:50:13','2017-10-16 06:26:29','192.168.1.143','192.168.1.143','2017-09-11 11:52:59','2018-01-05 10:48:56',1,1,29,273,NULL,'image/png',2535528,'2017-09-13 08:55:50'),(28,'100025',4,'EMP0000274',NULL,'npurankar@spanpump.com','$2a$10$HTY/i7qzwUA2gRW97ZgnRuhaf8kbz87/pBtcWMBnGvGrtJJTyUfg2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:53:21','2018-01-05 10:48:56',1,1,23,274,NULL,NULL,NULL,NULL),(29,'100015',6,'EMP0000264',NULL,'100015@spanpump.com','$2a$10$wh2Ixb0y80T.Z..8ePjp5e81Sxu.Oc3IYMISXlk7N/FDPDnFu5TXq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:53:48','2018-01-05 10:48:56',1,1,29,264,NULL,NULL,NULL,NULL),(30,'100026',6,'EMP0000275',NULL,'tenderexecutive@spanpump.com','$2a$10$G2nYo25atu2SIa5qrC6va.jQLbN7eKAu0E7iyY6zPwIJ794JQCoXy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,'2017-10-05 14:12:44','2017-10-05 04:20:02','192.168.1.111','192.168.1.111','2017-09-11 11:53:52','2018-01-05 10:48:56',1,1,5,275,NULL,'image/jpeg',225026,'2017-09-13 06:54:32'),(31,'100028',6,'EMP0000277',NULL,'engineering@spanpump.com','$2a$10$Y2nGKRhUFl9TAS6Mn8r8We5cIzBtL10qzdVDJ9JzSUL2DRBl3fCba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,'2017-10-17 04:55:47','2017-10-12 04:52:34','192.168.1.124','192.168.1.124','2017-09-11 11:54:17','2018-01-05 10:48:57',1,1,23,277,NULL,NULL,NULL,NULL),(32,'100027',6,'EMP0000276',NULL,'minal.dhabarde@spanpump.com','$2a$10$oKwAFxo0b49kaJ/D.PX5Kuy4UfQqzZZeS8gUwWk1CGrkT3DP/WGKa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,'2017-10-28 04:34:43','2017-10-27 04:01:43','192.168.0.128','192.168.0.128','2017-09-11 11:55:24','2018-01-05 10:48:57',1,1,29,276,NULL,NULL,NULL,NULL),(33,'100029',6,'EMP0000278',NULL,'officereception@spanpump.com','$2a$10$kYaR2dNYkDjAXOxSt4c6R.tKnTfVRVlkSpIboyyOlTWgdIou2Iqqq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,'2017-09-28 04:05:10','2017-09-27 03:54:40','192.168.1.105','192.168.1.105','2017-09-11 11:55:45','2018-01-05 10:48:57',1,1,21,278,NULL,NULL,NULL,NULL),(34,'100030',6,'EMP0000279',NULL,'amit.d@spanpump.com','$2a$10$UJc8EcDEfPJ/g7sr2XRE6.5hRJyoRhrXE5FxbECW5TDpIxJxZPOPa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2017-10-04 13:59:42','2017-09-28 05:11:03','192.168.1.115','192.168.1.115','2017-09-11 11:56:12','2018-01-05 10:48:57',1,1,NULL,279,NULL,'image/jpeg',164277,'2017-09-13 06:21:54'),(35,'100031',6,'EMP0000280',NULL,'rashmi.j@spanpump.com','$2a$10$8XxVPP/UpuR3OoIA6sN3GeyNbajRX99zJrTZP18O3QOAytmzRzS9C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'2017-10-05 04:28:45','2017-10-04 04:28:40','192.168.0.127','192.168.0.127','2017-09-11 11:56:21','2018-01-05 10:48:57',1,1,29,280,NULL,NULL,NULL,NULL),(36,'100033',6,'EMP0000282',NULL,'itsupport@spanpump.com','$2a$10$XWh5qN1DQHoRP78NX4N4Ru4ksdhXao3kT9zylADA9Qcn66EaV0v3y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-13 06:21:24',4,'2017-09-27 13:36:39','2017-09-19 05:01:06','192.168.1.108','192.168.1.108','2017-09-11 11:59:04','2018-01-05 10:48:57',1,1,25,282,NULL,'image/jpeg',31866,'2017-09-15 04:45:11'),(37,'100034',6,'EMP0000283',NULL,'ashok.uttekar@spanpump.com','$2a$10$31JW/HdM/4NK/NPT4fZSw.6sjJDmAeFiYQzGT8sExo9RaQed4FjYi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 11:59:42','2018-01-05 10:48:57',1,1,NULL,283,NULL,NULL,NULL,NULL),(38,'100037',6,'EMP0000286',NULL,'exim@spanpump.com','$2a$10$c.x2cOzG/R1PNQ7QBn7rFe7JdIoshFDflGQKlvGk5TnlplnVcnMBq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'2017-10-03 04:15:20','2017-09-28 04:09:28','192.168.1.182','192.168.1.182','2017-09-11 12:01:41','2018-01-05 10:48:58',1,1,5,286,NULL,NULL,NULL,NULL),(39,'100038',5,'EMP0000287',NULL,'rahul.kadlag@spanpump.com','$2a$10$.Ig8PB136mHfrckoMTvv.uC29zOsmDT3ZFbtTfOQNMmG9RzcaYP3a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,'2017-10-05 04:28:58','2017-10-04 04:29:45','192.168.1.157','192.168.1.157','2017-09-11 12:02:01','2018-01-05 10:48:58',1,1,29,287,NULL,NULL,NULL,NULL),(40,'100039',6,'EMP0000288',NULL,'abhijeet.kumbhar@spanpump.com','$2a$10$CuR1mcHjfo1a/yJbuK1T2uEQ3cPoZ1aTOdLbHlArQ95Y0GwwMGj0y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-18 06:27:11',2,'2017-09-18 06:27:11','2017-09-13 07:36:29','192.168.1.189','192.168.1.189','2017-09-11 12:02:23','2018-01-05 10:48:58',1,1,29,288,NULL,NULL,NULL,NULL),(41,'100040',6,'EMP0000289',NULL,'adminexec@spanpump.com','$2a$10$IPuuKbw59.hk9tugB088MOyS2WMwrOyIuUJe90OqgbmIa4dwvs6fK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'2017-09-19 13:04:00','2017-09-19 04:52:49','192.168.1.106','192.168.1.106','2017-09-11 12:02:58','2018-01-05 10:48:58',1,1,21,289,NULL,'image/jpeg',1336357,'2017-09-16 07:11:00'),(42,'100041',6,'EMP0000290',NULL,'balasaheb@spanpump.com','$2a$10$Hdnide2PjpRRQeU7Xc6s3OIsRgTbYvldp2pq0mTfCWPkfqmkRfMym',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2017-09-16 06:20:07','2017-09-16 06:13:02','192.168.1.134','192.168.1.134','2017-09-11 12:04:34','2018-01-05 10:48:58',1,1,2,290,NULL,NULL,NULL,NULL),(43,'100042',6,'EMP0000291',NULL,'hoacc4@spanpump.com','$2a$10$6l3FckjZniW1jHpWe4fkxOP9LYHYTo9XzCSW5hL9dSFLD5S0U8u4e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,'2017-10-05 04:30:55','2017-10-04 13:16:47','192.168.0.163','192.168.0.163','2017-09-11 12:04:53','2018-01-05 10:48:59',1,1,1,291,NULL,NULL,NULL,NULL),(44,'100043',6,'EMP0000292',NULL,'electricalstores@spanpump.com','$2a$10$OgKFwK/d/Cg9yA.MYEq97.xrEr8Ps42cx8qOmQfIzrnbsHaZnNELC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:05:15','2018-01-05 10:48:59',1,1,NULL,292,NULL,NULL,NULL,NULL),(45,'100044',6,'EMP0000293',NULL,'vivek.d@spanpump.com','$2a$10$7uA6yRP6Rg5/.PSltBchiOetW1hErR0wPAPAa2Qv9lXkFY2HT6aiC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:05:25','2018-01-05 10:48:59',1,1,NULL,293,NULL,NULL,NULL,NULL),(46,'100045',4,'EMP0000294',NULL,'nikhil.patankar@spanpump.com','$2a$10$6E4.VGv/UDHbuL1ajdn.gewdkSZEQ2ZPqGwwCMIUMy/EP4ZRizZ/K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2017-09-22 06:54:24','2017-09-22 06:54:24','192.168.0.165','192.168.0.165','2017-09-11 12:05:49','2018-01-05 10:48:59',1,1,NULL,294,NULL,NULL,NULL,NULL),(47,'100049',6,'EMP0000298',NULL,'pooja@spanpump.com','$2a$10$iq0w2KWMHnlDZtOdebvIW.ZasvKFBeWF74AKPaNSNJKCIEsVdgAVK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'2017-10-05 13:48:11','2017-10-05 04:45:00','192.168.0.125','192.168.0.125','2017-09-11 12:06:43','2018-01-05 10:48:59',1,1,29,298,NULL,NULL,NULL,NULL),(48,'100050',6,'EMP0000299',NULL,'kalyani.gaikwad@spanpump.com','$2a$10$bFe8ZId.lKuFdK7BZ2AhjO492SpwOfcVkM.hGgxtarMmrG0sZUv72',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2017-11-11 09:26:29','2017-11-11 09:26:29','1.39.98.20','1.39.98.20','2017-09-11 12:06:56','2018-01-05 10:48:59',1,1,NULL,299,NULL,NULL,NULL,NULL),(49,'100052',6,'EMP0000301',NULL,'shubham.patel@spanpump.com','$2a$10$Yv5sEqbeLPN/ZzvkMtICW.a5w.mpnsXMKGs6PPfUbQ.KVQU4T55My',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,'2017-10-27 08:01:20','2017-10-26 12:58:50','192.168.0.162','192.168.0.162','2017-09-11 12:07:22','2018-01-05 10:49:00',1,1,29,301,NULL,NULL,NULL,NULL),(50,'100053',6,'EMP0000302',NULL,'marketingexecutive1@spanpump.com','$2a$10$a7q64IRBLT0kQ/hf7o2WeeJC3VDrCIPh1CmukIwVfvXE/tUmYIl3C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'2017-10-04 04:24:52','2017-09-22 04:08:32','192.168.0.129','192.168.1.159','2017-09-11 12:07:34','2018-01-05 10:49:00',1,1,5,302,NULL,NULL,NULL,NULL),(51,'100054',6,'EMP0000303',NULL,'raviraj.karale@spanpump.com','$2a$10$fGCsNG.vTkcxwo2cj0Giaurjoz7/d4.B2nxzEwYDMf/NIAKGyJBGG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56,'2017-10-27 08:02:38','2017-10-16 09:01:33','192.168.0.130','192.168.0.130','2017-09-11 12:07:48','2018-01-05 10:49:00',1,1,29,303,NULL,NULL,NULL,NULL),(52,'100055',1,'EMP0000304',NULL,'subal-subal@spanpump.com','$2a$10$C6.ic6a1u.M4s37FGHtrGezHkmEhKHDeEvY9yDrc5.IK1xiTqdVIK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,'2017-12-30 07:58:51','2017-09-26 04:43:58','192.168.100.97','192.168.1.166','2017-09-11 12:08:24','2018-01-05 10:49:00',1,1,24,304,NULL,NULL,NULL,NULL),(53,'100056',1,'EMP0000305',NULL,'hrassistant1@spanpump.com','$2a$10$CdWNhbS3dK3BKL4pEbbZnOalYUB5EFqAO372lf6AS5UL465dkHwYW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,'2018-01-09 09:14:36','2018-01-09 05:02:54','127.0.0.1','192.168.14.135','2017-09-11 12:09:42','2018-01-09 09:14:36',1,1,NULL,305,NULL,'image/jpeg',21628,'2017-09-13 06:41:08'),(54,'100057',6,'EMP0000306',NULL,'officeexecutive@spanpump.com','$2a$10$7jCpEF9GcWpvFybZqUK8JObdNpCKvbFHJZM0.bjxEZIYh.eTfpekK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'2017-10-12 04:28:01','2017-10-05 04:20:51','192.168.1.121','192.168.1.121','2017-09-11 12:10:05','2018-01-05 10:49:00',1,1,23,306,NULL,NULL,NULL,NULL),(55,'100059',1,'EMP0000308',NULL,'hrassistant2@spanpump.com','$2a$10$odT47rtKnilo0dncsbmzN.bGym7yhYqu0lsQhowxz6kQ0U8kNXF3i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-31 04:48:59',72,'2017-12-26 05:18:20','2017-12-23 06:04:56','123.201.193.105','219.91.210.211','2017-09-11 12:10:20','2018-01-05 10:49:01',1,1,24,308,NULL,'image/jpeg',146844,'2017-09-12 12:26:31'),(56,'200001',6,'EMP0000309',NULL,'ahire@spanpump.com','$2a$10$qbHUwsSfDkJHsa4l9eHWK.qibfYvHWktlNW3Xus47u4VLYIeT4c5G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:10:36','2018-01-05 10:49:01',1,1,NULL,309,NULL,NULL,NULL,NULL),(57,'200009',6,'EMP0000317',NULL,'production@spanpump.com','$2a$10$z2LWOdEDQai35nabLBx1VOznu51izl0Nqu/k4OEqTe/RoUwjaLzci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:11:55','2018-01-05 10:49:01',1,1,NULL,317,NULL,NULL,NULL,NULL),(58,'200010',6,'EMP0000318',NULL,'atmaram.pharate@gmail.com','$2a$10$70SrG1ZPkhqiblyxQn/2iOOLNK91vsvL9UZmTLmbiUhHV3s1rCsUm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:12:17','2018-01-05 10:49:01',1,1,NULL,318,NULL,NULL,NULL,NULL),(59,'200006',6,'EMP0000314',NULL,'divekar@spanpump.com','$2a$10$BQYqeEwoLuX6k82btvUSI.V4Rfrb.FLo1.bKZV5TKoIPu9vyHA5Ly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:12:49','2018-01-05 10:49:01',1,1,29,314,NULL,NULL,NULL,NULL),(60,'200011',6,'EMP0000319',NULL,'storesexecutive@spanpump.com','$2a$10$TDHGiFWf50jxkrdyanOqderLEWz8FU8FvW1ZWt6m3hZ3NwS2723tS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:13:04','2018-01-05 10:49:01',1,1,2,319,NULL,NULL,NULL,NULL),(61,'200012',6,'EMP0000320',NULL,'testing@spanpump.com','$2a$10$iT1gCvInqAD1oKHJGgWVi.eOUVrT06NnFnv4z.H29kyyC8.OMiQ/e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:13:30','2018-01-05 10:49:02',1,1,NULL,320,NULL,NULL,NULL,NULL),(62,'200015',6,'EMP0000323',NULL,'bharat@spanpump.com','$2a$10$A3l5mqLZ.X6Waavzq4TmWeic.TpfN66rLhroMGB7E4Y9N8sPdUldq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:14:01','2018-01-05 10:49:02',1,1,43,323,NULL,NULL,NULL,NULL),(63,'200016',6,'EMP0000324',NULL,'amol.d@spanpump.com','$2a$10$wL9Mhuhhh3XbMWtYYzkn8.KzlzImEbOJPOLGgb65prePFGToD2.Q6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:14:28','2018-01-05 10:49:02',1,1,NULL,324,NULL,NULL,NULL,NULL),(64,'300001',6,'EMP0000326',NULL,'cgbm@spanpump.com','$2a$10$VG8P8YLwyWnAtne3I3ePZe/VrUbHRrsjcjNDbqGpNhFAE.5HvTbPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:14:59','2018-01-05 10:49:02',1,1,5,326,NULL,NULL,NULL,NULL),(65,'300002',6,'EMP0000327',NULL,'anik@spanpump.com','$2a$10$LxuSZVedEsi7Fa2IvAkAg.8f91Ta.gFR8Un8eAT/7b/xvwNk.yqQW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:15:12','2018-01-05 10:49:03',1,1,5,327,NULL,NULL,NULL,NULL),(66,'300003',6,'EMP0000328',NULL,'sanjay.choudhary@spanpump.com','$2a$10$WcNwwgnUAcN4ong5UDqeg.h7zeYcSPDGuuelW6wCYkk3wKDWM87De',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:18:01','2018-01-05 10:49:03',1,8,46,328,NULL,NULL,NULL,NULL),(67,'300004',6,'EMP0000329',NULL,'pintu@spanpump.com','$2a$10$2/CGVoR4OOQw9cZ6d/zjaOcxiumxC1OXhezUQu4gxpk3gwHUlrp0y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:18:25','2018-01-05 10:49:03',1,1,5,329,NULL,NULL,NULL,NULL),(68,'300005',6,'EMP0000330',NULL,'raghunath@spanpump.com','$2a$10$BB3LDHkNmg7EZmPniEuoMei7bFF5V6ehOlbdnBjKiP25BXFmCdkA.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:18:48','2018-01-05 10:49:03',1,1,5,330,NULL,NULL,NULL,NULL),(69,'300006',6,'EMP0000331',NULL,'narendra@spanpump.com','$2a$10$w9IcS8l4YPmW8Gfw7MJ7DOhKJIjKgjRtuoMmF6dV6IP9P9bJL.EHy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:19:02','2018-01-05 10:49:03',1,1,5,331,NULL,NULL,NULL,NULL),(70,'100032',6,'EMP0000281',NULL,'100032@spanpump.com','$2a$10$YZ0xI6M.J4GaHBXjF8X9ceh3ngx0uWs7f.QTw/D.yJde63FonlIzi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'2017-10-07 08:16:15','2017-10-05 13:43:34','192.168.1.101','192.168.1.101','2017-09-11 12:35:29','2018-01-05 10:49:03',1,1,20,281,NULL,NULL,NULL,NULL),(71,'100035',6,'EMP0000284',NULL,'100035@spanpump.com','$2a$10$0kUbiCfLbfLjfV/SVvBT0OrOcIx3txeHclBCWnwB3wM4fVeRGRcGe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:35:42','2018-01-05 10:49:04',1,1,22,284,NULL,NULL,NULL,NULL),(72,'100036',6,'EMP0000285',NULL,'100036@spanpump.com','$2a$10$HLFmVn5HA7uEjlLhxZZryeDpqqLt732MFpRsCw7UfTwaqp/JFzJHm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:35:50','2018-01-05 10:49:04',1,1,NULL,285,NULL,NULL,NULL,NULL),(73,'100046',6,'EMP0000295',NULL,'100046@spanpump.com','$2a$10$ovfzSWx/UsCSYa52Jm6HrO6JF8.d8.tfqo0UJmxUUZzhaAAJAe/gG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:35:58','2018-01-05 10:49:04',1,1,NULL,295,NULL,NULL,NULL,NULL),(74,'100048',6,'EMP0000297',NULL,'100048@spanpump.com','$2a$10$EbMCL0aPC8YI0daN9z3wJO8WQuHIxcrrntwTbQzjmsoNtYtw.4Jmu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,'2017-10-05 14:19:06','2017-10-05 04:20:17','192.168.1.111','192.168.1.127','2017-09-11 12:36:07','2018-01-05 10:49:04',1,1,20,297,NULL,'image/jpeg',129869,'2017-09-15 12:09:51'),(75,'100047',6,'EMP0000296',NULL,'100047@spanpump.com','$2a$10$k0iel/uKbZ.EkLkwhU12Lus8mvpvHiIi8jVYpo9oX5Oa5KjdQ04G2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:36:57','2018-01-05 10:49:04',1,1,29,296,NULL,NULL,NULL,NULL),(76,'200002',6,'EMP0000310',NULL,'200002@spanpump.com','$2a$10$YRuGuzJpyffSFqtiYluKhu5.uYC5ZZ4jBsQGSfJqDgr/okbq27swq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:37:18','2018-01-05 10:49:04',1,1,NULL,310,NULL,NULL,NULL,NULL),(77,'200003',6,'EMP0000311',NULL,'200003@spanpump.com','$2a$10$OqJf9QFXYYImvKIH7mvyoehEWsJjWaGj5xItze0GsE9fpL4PsQu2u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:37:27','2018-01-05 10:49:05',1,1,NULL,311,NULL,NULL,NULL,NULL),(78,'200004',6,'EMP0000312',NULL,'200004@spanpump.com','$2a$10$O64rkAz33BWBLxqHq/yJZ.chkx8FePvA.UNsCQOlRU32sNM0TbUWO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:39:32','2018-01-05 10:49:05',1,1,20,312,NULL,NULL,NULL,NULL),(79,'200007',6,'EMP0000315',NULL,'200007@spanpump.com','$2a$10$gDz3xuhH3vxZYcMBCeT/BOI6lPI3n6naal38YgUVVFs7THrjiOkvC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:39:52','2018-01-05 10:49:05',1,1,NULL,315,NULL,NULL,NULL,NULL),(80,'200008',6,'EMP0000316',NULL,'200008@spanpump.com','$2a$10$lw1z9voUs5oq2vydH9biAOQYOjv6i0bWEtsjMdQ07GqGFTfkGcDTq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:40:02','2018-01-05 10:49:05',1,1,NULL,316,NULL,NULL,NULL,NULL),(81,'200013',6,'EMP0000321',NULL,'200013@spanpump.com','$2a$10$IWHNQ2f49tkrkcipCGNXPumsmMdFKzjRTVRridKifXQ6mPRUN4tFm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:40:11','2018-01-05 10:49:05',1,1,NULL,321,NULL,NULL,NULL,NULL),(82,'200014',6,'EMP0000322',NULL,'200014@spanpump.com','$2a$10$bD8q/d8VsrJUxmaEpPllD.I/UPg1fqo3BXYyoyoVCaSjEsy13Qcpa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:40:21','2018-01-05 10:49:05',1,1,NULL,322,NULL,NULL,NULL,NULL),(83,'200017',6,'EMP0000325',NULL,'200017@spanpump.com','$2a$10$pCJjzXNd3UQoqLiqdislleaW1hqJsZ2gq9ktJ3upatxWHu.Sv8UJ6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:40:32','2018-01-05 10:49:06',1,1,NULL,325,NULL,NULL,NULL,NULL),(84,'100051',6,'EMP0000300',NULL,'100051@spanpump.com','$2a$10$P.DnI5dggcSaOz2q1d./ROtCF0ugK2hz7fZyYzvpiePGqI58AsJ6m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:40:57','2018-01-05 10:49:06',1,1,NULL,300,NULL,NULL,NULL,NULL),(85,'200005',6,'EMP0000313',NULL,'20005@spanpump.com','$2a$10$4hdjhGns/oO9fB8aQg2DGOpedFIaepRPt7wF7ZljDqxRjuYhKKNkG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-09-11 12:41:47','2018-01-05 10:49:06',1,1,NULL,313,NULL,NULL,NULL,NULL),(86,'400091',6,'EMP0000423',NULL,'400091@spanpump.com','$2a$10$.bj277mMhSsgGC5sOa5P3uk47etG98JkLaDQwPh.GGg4CkO2uOzSK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:26:50','2018-01-05 10:49:06',1,2,53,423,NULL,NULL,NULL,NULL),(87,'400092',5,'EMP0000424',NULL,'apfm1@spanpump.com','$2a$10$Ox1.kARCn8xHuPu1zKnsNuVxp4NNDCDBAm/7Ph4yJ1ejfXTQpOvie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:27:30','2018-01-05 10:49:06',1,2,53,424,NULL,NULL,NULL,NULL),(88,'400093',5,'EMP0000425',NULL,'apfm2@spanpump.com','$2a$10$LjBIyO4Yf.AIUl4vWYQnXOggFBVpsi7BA1JIk6dZszSXkI52Pdd/S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:27:58','2018-01-05 10:49:06',1,7,53,425,NULL,NULL,NULL,NULL),(89,'400094',6,'EMP0000426',NULL,'400094@spanpump.com','$2a$10$us.BmgIvffGmipygN2Vse.11jdm/aytBdL9qXbChoURc42YJqE/u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:28:38','2018-01-05 10:49:06',1,2,53,426,NULL,NULL,NULL,NULL),(90,'400095',6,'EMP0000427',NULL,'400095@spanpump.com','$2a$10$XRmVC84W/k6Y/zD2nq9ttORrP.mBpAo/Z.MvYX4Z.cgD3A.5Va7Pe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:29:16','2018-01-05 10:49:07',1,7,53,427,NULL,NULL,NULL,NULL),(91,'400096',6,'EMP0000428',NULL,'400096@spanpump.com','$2a$10$UHQz8nhZLhGzHzdn4LvFn.qXlhd5WlSA5i0wks3w2tS1cXXjI0DSy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:29:18','2018-01-05 10:49:07',1,7,53,428,NULL,NULL,NULL,NULL),(92,'400103',6,'EMP0000435',NULL,'400103@spanpump.com','$2a$10$oxyEzOUXW0bhAv71sgxw2OvshkMblqHmRuW0ouf9tDajSUuyDFJoK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:31:05','2018-01-05 10:49:07',1,8,53,435,NULL,NULL,NULL,NULL),(93,'400104',6,'EMP0000436',NULL,'biharfto1@spanpump.com','$2a$10$uZ2IEqaqKqpSPSGpSpb/YOL48gIy9/xdoreWRzHtfFr7Kj21Kta0.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:31:06','2018-01-05 10:49:07',1,8,53,436,NULL,NULL,NULL,NULL),(94,'400001',6,'EMP0000334',NULL,'400001@spanpump.com','$2a$10$JvZXDmsljzoNFEnj7Yp/sOU4FQRA.fubQ1.trLmR6Dz665h6OhJW.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:34:41','2018-01-05 10:49:07',1,9,53,334,NULL,NULL,NULL,NULL),(95,'400003',6,'EMP0000336',NULL,'400003@spanpump.com','$2a$10$Dea2Uza5yr8Hr/7ExMGCq.wfH2olCB5dKxr1Bq8hv/CSWtu9yJll6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:35:25','2018-01-05 10:49:07',1,9,53,336,NULL,NULL,NULL,NULL),(96,'400002',6,'EMP0000335',NULL,'400002@spanpump.com','$2a$10$J.NIH5c08Z4CWIXpRdzGXeBGPxlLW3Gir9SdZQMkzJ9Si5zsI56yu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:35:26','2018-01-05 10:49:08',1,9,53,335,NULL,NULL,NULL,NULL),(97,'400005',6,'EMP0000338',NULL,'ranjanparida.spanpump@gmail.com','$2a$10$mgMXN8GXRATNXMChaIVgAO9dKLqv1zPjZt81noOe0wy6kxkqqU0Z.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:36:02','2018-01-05 10:49:08',1,9,53,338,NULL,NULL,NULL,NULL),(98,'400004',6,'EMP0000337',NULL,'odbackofice1@spanpump.com','$2a$10$Crek1NoOhw6w70J9iORl4.XDal5uOQ/NThAQZTsbEULhxxPVTj666',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:36:02','2018-01-05 10:49:08',1,9,53,337,NULL,NULL,NULL,NULL),(99,'400006',6,'EMP0000339',NULL,'400006@spanpump.com','$2a$10$heszjdQG5GjcpnK/axUfWuP2yHhbMCl2HyOv1yHTDKpQKYNSA3ydu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:36:41','2018-01-05 10:49:08',1,9,53,339,NULL,NULL,NULL,NULL),(100,'400007',6,'EMP0000340',NULL,'400007@spanpump.com','$2a$10$yyTmO4wuX3niymPLCAB5/OnY1LZDX93eURnOJFFAC31mLqdZ/B1jC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:36:42','2018-01-05 10:49:08',1,9,53,340,NULL,NULL,NULL,NULL),(101,'400009',5,'EMP0000342',NULL,'odfm1@spanpump.com','$2a$10$CjkrBR70SiIo3hWgsTJmC.0n91oeseZ/.vug6RbQENNbuMObHr7C2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:37:10','2018-01-05 10:49:08',1,9,53,342,NULL,NULL,NULL,NULL),(102,'400010',6,'EMP0000343',NULL,'odhr1@spanpump.com','$2a$10$CE4XBEnZe5Z.MIOurqpNEeK3Boz9xDoVFC2GuHO1OBCVMViQw1dRO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:37:34','2018-01-05 10:49:09',1,9,7,343,NULL,NULL,NULL,NULL),(103,'400011',6,'EMP0000344',NULL,'400011@spanpump.com','$2a$10$u8CTh/qh09V6XB.qmVUmvOzUErj6klur2xrMQ50kkxdk5UplH/GDq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:37:56','2018-01-05 10:49:09',1,9,53,344,NULL,NULL,NULL,NULL),(104,'400014',6,'EMP0000346',NULL,'400014@spanpump.com','$2a$10$5zRg5Zt5UjWOVqGRMRTYyO3CIPe/784uU8J8cvRLKDAgXYpjf4P9W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:39:19','2018-01-05 10:49:09',1,10,49,346,NULL,NULL,NULL,NULL),(105,'400016',6,'EMP0000348',NULL,'400016@spanpump.com','$2a$10$vM4NSJXbwtj/FUiaXD6vgeyPtTJOTg1RrSvg.jA7tL9zM0basdynS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:39:20','2018-01-05 10:49:09',1,10,49,348,NULL,NULL,NULL,NULL),(106,'400099',6,'EMP0000431',NULL,'400099@spanpump.com','$2a$10$i7I4I0Wd6EcObPGnrp0t4.rBxkgs/biKunwLHzNwTYJpeYG1LxfUi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:40:32','2018-01-05 10:49:09',1,5,53,431,NULL,NULL,NULL,NULL),(107,'400101',6,'EMP0000433',NULL,'400101@spanpump.com','$2a$10$B/BwD9hYT7jfD/YLjN64XerHLNgkV5s08fON0v6WCgCVXKc7/wAL6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:41:15','2018-01-05 10:49:09',1,5,53,433,NULL,NULL,NULL,NULL),(108,'400019',5,'EMP0000351',NULL,'msindhare@spanpump.com','$2a$10$rHVkvy/fiHNXn.RQ0Gx9XOHxLulftSKOHHu1RxbbwrMTPdtm6x2zy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:48:06','2018-01-05 10:49:09',1,3,53,351,NULL,NULL,NULL,NULL),(109,'400020',6,'EMP0000352',NULL,'cgfto3@spanpump.com','$2a$10$YprFWrWJ9qkL1Asu0QK1seVKS.uT7hAA25o2tjCNxdqhhRGxOKA7S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:48:43','2018-01-05 10:49:10',1,3,53,352,NULL,NULL,NULL,NULL),(110,'400021',5,'EMP0000353',NULL,'divendra@spanpump.com','$2a$10$Cl9Gq2U0nIncQmaUE.bRcex/MLaGMqatC6uuh4f/Pc8XMZzhuOfKu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:49:25','2018-01-05 10:49:10',1,3,53,353,NULL,NULL,NULL,NULL),(111,'400023',6,'EMP0000355',NULL,'cgbackoffice4@spanpump.com','$2a$10$RrLrJeCjc47xz7Oc1qoLpuKm2vqj9a19Ha2cVshWrOCE5aNyy0FQm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 04:50:07','2018-01-05 10:49:10',1,3,48,355,NULL,NULL,NULL,NULL),(112,'400026',5,'EMP0000358',NULL,'400026@spanpump.com','$2a$10$2O9mSbgh40jL0idDJYUpZuu2WjAwnMBsOc6vSANZo.LBJmeztAaiu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:06:30','2018-01-05 10:49:10',1,3,53,358,NULL,NULL,NULL,NULL),(113,'400027',6,'EMP0000359',NULL,'400027@spanpump.com','$2a$10$Wg.WsmHQakKducWvBgSupuNU2N15C7Otyu7bTogSnZ4sGCn7PZ6eu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:08:26','2018-01-05 10:49:10',1,3,53,359,NULL,NULL,NULL,NULL),(114,'400028',6,'EMP0000360',NULL,'400028@spanpump.com','$2a$10$PP3uFq722refDs3R/WOW6eA944NsokiMglvCl.SLfhswU0/tMU0D.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:09:19','2018-01-05 10:49:11',1,3,53,360,NULL,NULL,NULL,NULL),(115,'400029',6,'EMP0000361',NULL,'cgnavneet@spanpump.com','$2a$10$9LUFZJpNo6aGV9Cb0s8IiukjMAhuUVPDbhEFulICd3cOJN8FOFOxW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:20:49','2018-01-05 10:49:11',1,3,53,361,NULL,NULL,NULL,NULL),(116,'400030',6,'EMP0000362',NULL,'400030@spanpump.com','$2a$10$.yWITzjhzwiezbklgaHEmuPX1UgsneDXVXAYYpsm8zjbPTg5KY/4y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:24:27','2018-01-05 10:49:11',1,3,51,362,NULL,NULL,NULL,NULL),(117,'400031',6,'EMP0000363',NULL,'400031@spanpump.com','$2a$10$qWtkG.OcW0oC8zTUfCq3HuEMmkJSbSbUV4PcTRCV.HI5T9odNl7Gy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:25:53','2018-01-05 10:49:11',1,3,53,363,NULL,NULL,NULL,NULL),(118,'400032',6,'EMP0000364',NULL,'400032@spanpump.com','$2a$10$Ml9pNy9xPyPlxHxJuKyhx.HxiS8OfCxGVLFNFB.Dc/OGOE5nMQulG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:25:54','2018-01-05 10:49:11',1,3,53,364,NULL,NULL,NULL,NULL),(119,'400033',6,'EMP0000365',NULL,'400033@spanpump.com','$2a$10$3RJ//vATd8p0uWtb2NRumeCvd03SSQFjlJD/822itz6DvhuNdh6LS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:25:56','2018-01-05 10:49:11',1,3,53,365,NULL,NULL,NULL,NULL),(120,'400034',6,'EMP0000366',NULL,'cgabir@spanpump.com','$2a$10$XXhM1.KP9spVa59uVQ6Z7u0L2v6lqT0FM7COpSzbDB6oR3sZUCZMC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:25:57','2018-01-05 10:49:12',1,3,53,366,NULL,NULL,NULL,NULL),(121,'400035',6,'EMP0000367',NULL,'400035@spanpump.com','$2a$10$635PyGYYpnw5cASr0xJgoubC3BQHG6PcDnNjDaZ5oXDaMQjFPEUDC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:25:58','2018-01-05 10:49:12',1,3,53,367,NULL,NULL,NULL,NULL),(122,'400036',6,'EMP0000368',NULL,'400036@spanpump.com','$2a$10$4yMa8wgZEWeMRe2tDlTc1O3tbcEfDHWj.6O2t5SzSCnoWBwv9IQ6G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:34:52','2018-01-05 10:49:12',1,3,53,368,NULL,NULL,NULL,NULL),(123,'400038',6,'EMP0000370',NULL,'400038@spanpump.com','$2a$10$YIU9APWCWQUA/4QUwX0Joer.vmH9N8tivv9dH89ccyF0Z0GEOEayG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 05:35:10','2018-01-05 10:49:12',1,3,53,370,NULL,NULL,NULL,NULL),(124,'400017',6,'EMP0000349',NULL,'400017@spanpump.com','$2a$10$pK7VQFcMyD607sJgmDueGu5KAW9P0mwH507U5CnHHB2hlk24ivt1i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:37:57','2018-01-05 10:49:12',1,9,1,349,NULL,NULL,NULL,NULL),(125,'400039',6,'EMP0000371',NULL,'400039@spanpump.com','$2a$10$u5OaEARf1ZgY/h21Mf3QweYJGMUU35rBfNr3K0Wi4XG/2.QOXFGS.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:39:41','2018-01-05 10:49:12',1,3,53,371,NULL,NULL,NULL,NULL),(126,'400040',6,'EMP0000372',NULL,'400040@spanpump.com','$2a$10$3DnMtKa6d0k6m8QTnKBd9eVgJF8RTMN8cMQek8nkN4xkbpQe0goVq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:41:25','2018-01-05 10:49:13',1,3,48,372,NULL,NULL,NULL,NULL),(127,'400041',6,'EMP0000373',NULL,'400041@spanpump.com','$2a$10$EqpuB03ITLUzlB/cI64N5OC69XYA3d8I1PZf7oEwGn36tIxv8BxUe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:44:27','2018-01-05 10:49:13',1,3,53,373,NULL,NULL,NULL,NULL),(128,'400042',6,'EMP0000374',NULL,'400042@spanpump.com','$2a$10$RjtCI8CUQDrJE44fKoj.UOkQyNWS7moba6mP/BCxb96e4oUFSEv0G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:46:48','2018-01-05 10:49:13',1,3,53,374,NULL,NULL,NULL,NULL),(129,'400043',6,'EMP0000375',NULL,'400043@spanpump.com','$2a$10$1qBJx4shQeQn6Aqz2R/M2eI5KBNMrV8EOiD76Aqwn84brSb3F4Iye',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:47:16','2018-01-05 10:49:13',1,3,48,375,NULL,NULL,NULL,NULL),(130,'400044',6,'EMP0000376',NULL,'400044@spanpump.com','$2a$10$ZPoaUPaO0LIXkuh.vtKrtehESzOuiWR5O93IuXo94qkPowFoc6j4m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:47:17','2018-01-05 10:49:14',1,3,48,376,NULL,NULL,NULL,NULL),(131,'400045',6,'EMP0000377',NULL,'400045@spanpump.com','$2a$10$U1o/rTmP4GYx4uCEpdzMle0wMYybs81pL0jubEZWHHj5py4iDH.DC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:47:48','2018-01-05 10:49:14',1,3,53,377,NULL,NULL,NULL,NULL),(132,'400046',6,'EMP0000378',NULL,'400046@spanpump.com','$2a$10$qLhUvKNH9S.Y3wJWqgWkLezGAwkaDWq7VCMloGMyBrocYQHl/Yh0S',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:48:13','2018-01-05 10:49:14',1,3,48,378,NULL,NULL,NULL,NULL),(133,'400047',6,'EMP0000379',NULL,'400047@spanpump.com','$2a$10$vIqddQqQR21ScylbRQUEgeJwv8hcP2N9nMoURcMrr/W7yzydxwiOy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:49:03','2018-01-05 10:49:14',1,3,53,379,NULL,NULL,NULL,NULL),(134,'400048',6,'EMP0000380',NULL,'400048@spanpump.com','$2a$10$viujQfvXs4mn8lkw8i/./.9.rnFCjS3Z1vq.NOalMY8olP6.6zS.e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:49:04','2018-01-05 10:49:14',1,3,53,380,NULL,NULL,NULL,NULL),(135,'400049',6,'EMP0000381',NULL,'400049@spanpump.com','$2a$10$yO7HlPrQWSAQgNWeBK4xGuX6h943ZTGlGkF77tKlENNe182MJwBC6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 06:49:06','2018-01-05 10:49:14',1,3,53,381,NULL,NULL,NULL,NULL),(144,'400052',6,'EMP0000384',NULL,'400052@spanpump.com','$2a$10$vEM8rDl6nwEaie0FtIHZwOXu7npgBqaMOyHCnlUO2tTGdom/385Mi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:21:40','2018-01-05 10:49:15',1,3,48,384,NULL,NULL,NULL,NULL),(145,'400051',6,'EMP0000383',NULL,'400051@spanpump.com','$2a$10$GLkh.hSzAbj4f/fQGi28/OvzpOPPgDoFOe04uXfOWsYXfQztz0.vq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:21:41','2018-01-05 10:49:15',1,3,53,383,NULL,NULL,NULL,NULL),(146,'400050',6,'EMP0000382',NULL,'400050@spanpump.com','$2a$10$ll42sv7uEGRyB83492aSWOeO6bRUzSAFqWV1nC2vDTrLpYQXF5FHq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:21:43','2018-01-05 10:49:15',1,3,53,382,NULL,NULL,NULL,NULL),(147,'400053',6,'EMP0000385',NULL,'400053@spanpump.com','$2a$10$8XyVz56kT4GXBpZBhq1DI.mMph7kGm/HjSNPHQQPS2s5FCNgmGFU.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:23:00','2018-01-05 10:49:15',1,3,53,385,NULL,NULL,NULL,NULL),(148,'400054',6,'EMP0000386',NULL,'400054@spanpump.com','$2a$10$b2rZvJPRQKJOLaioqZtpmetOhTlpWPw25L2DC9RKBQ4cxNHg7wFAS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:23:01','2018-01-05 10:49:15',1,3,53,386,NULL,NULL,NULL,NULL),(149,'400055',6,'EMP0000387',NULL,'400055@spanpump.com','$2a$10$GZwM/nktYxXBpjhTpltXfOqL.mBMYT9HBLYPildbTeBIb/dTLv5VW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:28:44','2018-01-05 10:49:15',1,3,53,387,NULL,NULL,NULL,NULL),(150,'400056',6,'EMP0000388',NULL,'400056@spanpump.com','$2a$10$naKVyubfwiHoMkGMORdzNO55ulCyS6nhnSVabfRuvD077riVW9.FS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:28:58','2018-01-05 10:49:16',1,3,53,388,NULL,NULL,NULL,NULL),(151,'400057',6,'EMP0000389',NULL,'400057@spanpump.com','$2a$10$c2anJ6NznUSOReqNYDjZM.L58KLCrfK/8RwbORLxGMv08DSRH8jPC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:29:17','2018-01-05 10:49:16',1,3,53,389,NULL,NULL,NULL,NULL),(152,'400058',6,'EMP0000390',NULL,'400058@spanpump.com','$2a$10$mm6j95exefsezcM9L.74oOf9x8C/yCjYTnXJPMCThlJ/M6UfIRKrW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:29:48','2018-01-05 10:49:16',1,3,53,390,NULL,NULL,NULL,NULL),(153,'400059',5,'EMP0000391',NULL,'400059@spanpump.com','$2a$10$ow3LQvlmTApc/tqbBHlfjOG886kMKUtU4Qf98huqE6tkTocGyZygW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:30:12','2018-01-05 10:49:16',1,3,53,391,NULL,NULL,NULL,NULL),(154,'400060',5,'EMP0000392',NULL,'400060@spanpump.com','$2a$10$5c.HE/mF5p0UJ0K9G.JrWebJebkS6CKxBG1hQ7TO6kvdcHcWtZlyu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:30:31','2018-01-05 10:49:16',1,3,52,392,NULL,NULL,NULL,NULL),(155,'400061',6,'EMP0000393',NULL,'400061@spanpump.com','$2a$10$/ACi.NrphJZUWBSo6w.63.DtfurRNL1Oaeb.488ruzIbd61L7ozKO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:31:03','2018-01-05 10:49:17',1,3,53,393,NULL,NULL,NULL,NULL),(156,'400062',6,'EMP0000394',NULL,'400062@spanpump.com','$2a$10$4rVOVUfy9iSUQ/0okQLiAuJ3dL7edaH6O7PBVDSFYhkSXcpa30Kba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:31:04','2018-01-05 10:49:17',1,3,53,394,NULL,NULL,NULL,NULL),(157,'400065',6,'EMP0000397',NULL,'400065@spanpump.com','$2a$10$sl8pBRhncTC7t9QFbycRCeBOuRMp1hX.3AUOHO10PjVoKvJp9edcO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:32:06','2018-01-05 10:49:17',1,3,53,397,NULL,NULL,NULL,NULL),(158,'400064',6,'EMP0000396',NULL,'400064@spanpump.com','$2a$10$U3.VcBATzvOLwrcLlQgK4ew9Ql16H1rZIAoR.qEQlGHQhmrGVjhvC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:32:07','2018-01-05 10:49:17',1,3,53,396,NULL,NULL,NULL,NULL),(159,'400063',6,'EMP0000395',NULL,'400063@spanpump.com','$2a$10$zhWtOJwtvuH4LbV7tsRuxunUVHr4f9UVVQNxk81RIyEd0yfwHnpCu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:32:08','2018-01-05 10:49:17',1,3,1,395,NULL,NULL,NULL,NULL),(160,'400066',6,'EMP0000398',NULL,'400066@spanpump.com','$2a$10$u7AbYSPejJYP/aetTvKLH.VZgdTOZISA5xJto4/Mx5TC9CyVeg69m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:32:48','2018-01-05 10:49:17',1,3,53,398,NULL,NULL,NULL,NULL),(161,'400067',6,'EMP0000399',NULL,'400067@spanpump.com','$2a$10$nloOdn9NFVGUPsLsh2VTte8iuo59hHM9qaPtiOeNKg4Mv9fhK/Pau',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:33:08','2018-01-05 10:49:17',1,3,53,399,NULL,NULL,NULL,NULL),(162,'400068',6,'EMP0000400',NULL,'cglogistics@spanpump.com','$2a$10$gXf4p2Csqzxil1gMpsq0B.uqRDygLnhj3vPxaOqtkNYjRLwjM0SAq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:33:24','2018-01-05 10:49:18',1,3,53,400,NULL,NULL,NULL,NULL),(163,'400069',5,'EMP0000401',NULL,'cgprojectmanager@spanpump.com','$2a$10$KiIj/R5wx.o/EMmFyUCCBeEsqMje5XdqTdX1GZiyLXYOXMvCqElxy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:33:43','2018-01-05 10:49:18',1,3,53,401,NULL,NULL,NULL,NULL),(164,'400070',6,'EMP0000402',NULL,'400070@spanpump.com','$2a$10$DSGa6CSkTews/wKAlhFVVOgESPO6bHgHpvfg0NJfidx6poQz/40xW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:34:09','2018-01-05 10:49:18',1,3,53,402,NULL,NULL,NULL,NULL),(165,'400071',6,'EMP0000403',NULL,'400071@spanpump.com','$2a$10$rbqtV.Lkz473pcEpohaFRu4nd9VRWG02rSsgocGfXMbDd7Na0.amq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:34:59','2018-01-05 10:49:18',1,3,53,403,NULL,NULL,NULL,NULL),(166,'400074',6,'EMP0000406',NULL,'400074@spanpump.com','$2a$10$h0SgdcUBkkyezn1vg1cMFOMsemCmYoGkKgZQ/.tgiO52FkIBfU50C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:35:50','2018-01-05 10:49:18',1,3,53,406,NULL,NULL,NULL,NULL),(167,'400075',6,'EMP0000407',NULL,'400075@spanpump.com','$2a$10$d0CL/JKA3WvtNi/F9KmAfOhN3CUuW02vb/xlJLfNjSab35ZPL21K6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:36:17','2018-01-05 10:49:18',1,3,53,407,NULL,NULL,NULL,NULL),(168,'400076',6,'EMP0000408',NULL,'400076@spanpump.com','$2a$10$dq9txk8YHoVk0sLJJpRrneX/BypBw41oCv2Kj6w3NbMHQC7oxPIiO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:36:18','2018-01-05 10:49:19',1,3,53,408,NULL,NULL,NULL,NULL),(169,'400077',6,'EMP0000409',NULL,'400077@spanpump.com','$2a$10$aU9iq5N/gla/EiCUIK3j5.q7j/c5i76ceKjC0IN./jx2smX04VOOq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:36:40','2018-01-05 10:49:19',1,3,53,409,NULL,NULL,NULL,NULL),(170,'400078',6,'EMP0000410',NULL,'400078@spanpump.com','$2a$10$lmia1AjDSNKp9/rjCV7ADO6Ha5YZ3naFkuqCJ4gEXTbThaec1JiLO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:37:24','2018-01-05 10:49:19',1,3,53,410,NULL,NULL,NULL,NULL),(171,'400079',6,'EMP0000411',NULL,'400079@spanpump.com','$2a$10$m1vt2oJ2f/UxwBklNtQMPOPNxG3KtN8q6lJIF2E1RTm34o/HkDtsW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:37:39','2018-01-05 10:49:19',1,3,53,411,NULL,NULL,NULL,NULL),(172,'400080',6,'EMP0000412',NULL,'400080@spanpump.com','$2a$10$rpzVYSp2BjjynzxhIroT6.J1IOUXtyFnGpMF31PRt3.HnxaL3hbDy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:38:40','2018-01-05 10:49:19',1,3,53,412,NULL,NULL,NULL,NULL),(173,'400081',6,'EMP0000413',NULL,'400081@spanpump.com','$2a$10$UdTEQpfOmotRQJwtVLQY5uHKGVuGTbGcXvbQOQkdxKDbtgSVFMwvC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:38:53','2018-01-05 10:49:19',1,3,53,413,NULL,NULL,NULL,NULL),(174,'400082',6,'EMP0000414',NULL,'400082@spanpump.com','$2a$10$XloYLmmhr53EKBbT0yc7e.X1ZmwwMB59iHoI2Lc7QHkvxnIT3Ylgu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:39:20','2018-01-05 10:49:20',1,3,53,414,NULL,NULL,NULL,NULL),(175,'400083',6,'EMP0000415',NULL,'400083@spanpump.com','$2a$10$X2HngfggoBta0ZPlY/MA2eYFd2FaS.pwl5.n7ekAUjiLkCtXMKWFG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:39:43','2018-01-05 10:49:20',1,3,53,415,NULL,NULL,NULL,NULL),(176,'400084',6,'EMP0000416',NULL,'400084@spanpump.com','$2a$10$MOvwzCvYshZ4ExxMFy7FIuck0kcp4R0Fqd/Xr4qIPV8loZFNhLXAa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:40:05','2018-01-05 10:49:20',1,3,53,416,NULL,NULL,NULL,NULL),(177,'400085',6,'EMP0000417',NULL,'400085@spanpump.com','$2a$10$fv3dCUEaULsfTBU4XgohsOA5GUg3wYlUTE2mCjG.cJm1WpHpz6Z3e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:40:39','2018-01-05 10:49:20',1,3,53,417,NULL,NULL,NULL,NULL),(178,'400086',6,'EMP0000418',NULL,'400086@spanpump.com','$2a$10$NwgHj7QgIMn9F886c797q.bqed/1wjWySpQNpZBaZu3fEoiWR0weW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:40:56','2018-01-05 10:49:20',1,3,53,418,NULL,NULL,NULL,NULL),(179,'400087',6,'EMP0000419',NULL,'400087@spanpump.com','$2a$10$sfANP3C2TKOjY.AYwvzPX.Rca2THL/oMZHlRw364rUmOlTnzXqTy2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:41:57','2018-01-05 10:49:20',1,3,53,419,NULL,NULL,NULL,NULL),(180,'400088',6,'EMP0000420',NULL,'400088@spanpump.com','$2a$10$HgsLbQ0S.uwwbqP0blJMlewopxcOqSoshGiEZYt3kvCHMQUIa3L0.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:42:10','2018-01-05 10:49:21',1,3,53,420,NULL,NULL,NULL,NULL),(181,'400089',6,'EMP0000421',NULL,'400089@spanpump.com','$2a$10$dQSo9ALINdWg32/hMaA6CenH.CRJs1NUo4EjAJf1rWatPx1E1HINu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:42:24','2018-01-05 10:49:21',1,3,53,421,NULL,NULL,NULL,NULL),(182,'400090',6,'EMP0000422',NULL,'400090@spanpump.com','$2a$10$JlaYkehXuAE.r7.fj7KEzuzBGGXAo87/m0GwFWIaI3nW/gAaebZsC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:42:41','2018-01-05 10:49:21',1,3,53,422,NULL,NULL,NULL,NULL),(183,'400105',6,'EMP0000437',NULL,'100105@spanpump.com','$2a$10$bSXWYpr7QDYVgR.zk808fu7lA1Ttag4FpDnGmrFoqfcMYmdb5jF1e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:42:59','2018-01-05 10:49:21',1,3,53,437,NULL,NULL,NULL,NULL),(184,'400106',6,'EMP0000438',NULL,'somanmanjhi123@gmail.com','$2a$10$T5Oycitwct0AZhD69/Xnr.tiCmepVltiAayakqw2o8/z30ngVAxxq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:43:12','2018-01-05 10:49:21',1,3,53,438,NULL,NULL,NULL,NULL),(185,'400107',6,'EMP0000439',NULL,'arunkumarkgn95@gmail.com','$2a$10$CIKSZWVauCH61JSaUwvRCeWhBi4CAGIH575USdNcEH4v4ZKHX6tH2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:43:33','2018-01-05 10:49:21',1,3,53,439,NULL,NULL,NULL,NULL),(186,'400108',6,'EMP0000440',NULL,'100108@spanpump.com','$2a$10$2vSLNZmd/jojD2F3RPFPoeqoAcCsrVPfEFTMP/S8.8TdrSQA9v.ci',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:43:51','2018-01-05 10:49:22',1,3,53,440,NULL,NULL,NULL,NULL),(187,'400110',6,'EMP0000442',NULL,'amit1999verma36@gmail.com','$2a$10$a5E25TQA5H5sQggCft4jCeCFML0QLR/rKsZjBuhTE.7unr4Jn9Zea',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:44:09','2018-01-05 10:49:22',1,3,53,442,NULL,NULL,NULL,NULL),(188,'400111',6,'EMP0000443',NULL,'manojpeda@gmail.com','$2a$10$mE.9hFc2F5hOKEQibtNJAe.JQjVyUklhfIfAaQ3OoPFmPxlF.cv3i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:44:31','2018-01-05 10:49:22',1,3,52,443,NULL,NULL,NULL,NULL),(189,'100068',6,'EMP0000444',NULL,'cgsales9@spanpump.com','$2a$10$Ck3b/o52c/oAVJW4x0IR0.XKijB/vomMA8onFtkce40URkVB2VFPy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:44:54','2018-01-05 10:49:22',1,3,NULL,444,NULL,NULL,NULL,NULL),(190,'200019',6,'EMP0000457',NULL,'atul.pawar@spanpump.com','$2a$10$91UYjoM7wckv2nEmXZ18f.JxmjXkKjLyQyR49JXNnrhG5G3ludkT.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:45:30','2018-01-05 10:49:22',1,6,NULL,457,NULL,NULL,NULL,NULL),(191,'200018',6,'EMP0000456',NULL,'100073@spanpump.com','$2a$10$moafG2itGTx/gJ9NJt8udeIkfUnFGkJ1WIvfzDNullWjSX7PjVsT6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:45:42','2018-01-05 10:49:22',1,6,NULL,456,NULL,NULL,NULL,NULL),(192,'200020',6,'EMP0000458',NULL,'qualityexecutive@spanpump.com','$2a$10$7D2QzDQrQhitH4NjjSyz2eS37IHVCyTMiHO76s7KWZC4XmayBP7PW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:45:55','2018-01-05 10:49:22',1,6,NULL,458,NULL,NULL,NULL,NULL),(193,'100071',6,'EMP0000454',NULL,'jayashri.dighe@spanpump.com','$2a$10$nkjUktl/mStRYQgwqGbnD.W3.laekJ6WA1iheyrOkoqual/ULVOoW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:46:18','2018-01-05 10:49:23',1,1,29,454,NULL,NULL,NULL,NULL),(194,'100070',4,'EMP0000453',NULL,'narayan@spanpump.com','$2a$10$bBAdFiWOx04xz/HVNNoMz.syvmVKRECWbtRf8VgbU0seI87rGsS82',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:46:39','2018-01-05 10:49:23',1,1,NULL,453,NULL,NULL,NULL,NULL),(195,'100062',6,'EMP0000447',NULL,'marcomexecutive1@spanpump.com','$2a$10$2d5E12Yo2u1j7qqDySap3eLMf0EYdgGM5Ev7eXjijrr7eDVW78DOK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:47:06','2018-01-05 10:49:23',1,1,29,447,NULL,NULL,NULL,NULL),(196,'100067',6,'EMP0000451',NULL,'salesafrica15@spanpump.com','$2a$10$J2ilxuP/anWoDzddGabDM.e39cJdyBj2mVXz2gdpB9f8BBz.LPhPG',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:47:24','2018-01-05 10:49:23',1,1,5,451,NULL,NULL,NULL,NULL),(197,'100061',6,'EMP0000446',NULL,'amar.potdar@spanpump.com','$2a$10$tj1zka/bJ9ny/J3T5dDsTutCvDiq7KG9vcppkArfr.FM.LXIMjrjS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:47:37','2018-01-05 10:49:24',1,1,29,446,NULL,NULL,NULL,NULL),(198,'100060',6,'EMP0000445',NULL,'100060@spanpump.com','$2a$10$Z0FBEvNNQbaEb.ng5daHqezkYw/e79AiT3XnFyflBgJ5tp7etWDvO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:48:10','2018-01-05 10:49:24',1,1,NULL,445,NULL,NULL,NULL,NULL),(199,'400109',6,'EMP0000441',NULL,'debasisamishra@ymail.com','$2a$10$tcAa0BdHDsjrZf8.1j5gdOvr29TWrM5Cetdx6GL8qqpg90c4.Du7e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:48:44','2018-01-05 10:49:24',1,3,53,441,NULL,NULL,NULL,NULL),(200,'100064',5,'EMP0000448',NULL,'100064@spanpump.com','$2a$10$yOpKAkvQMc3RIyVzhRgFW.YAsu3mFI58kL4ubo7ufuDMC77zVpOQ6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:50:01','2018-01-05 10:49:24',1,1,21,448,NULL,NULL,NULL,NULL),(201,'100066',6,'EMP0000450',NULL,'100066@spanpump.com','$2a$10$7.P8VRIQkHKPxFIZYS2TRuaqNk2E/eS49Q0J6iB7fOt0jVJtF7vpa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:50:18','2018-01-05 10:49:24',1,1,21,450,NULL,NULL,NULL,NULL),(202,'100072',6,'EMP0000455',NULL,'100072@spanpump.com','$2a$10$Pk7pQvCP.7R6B3ItNuJxHulNOvwuI7LKzVItxXIIspQj4no9lIScm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:50:30','2018-01-05 10:49:24',1,1,21,455,NULL,NULL,NULL,NULL),(203,'100065',6,'EMP0000449',NULL,'salesafrica9@spanpump.com','$2a$10$AodXwKINi4Iu3os7Fa3.3OnsI.lu7EDbYYRtphq.rtE0ipuoLehMu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:50:49','2018-01-05 10:49:25',1,1,5,449,NULL,NULL,NULL,NULL),(204,'100069',6,'EMP0000452',NULL,'k.khan@spanpump.com','$2a$10$j97poMMIuix.MR5gaLjiz.xOuxFDubImeCs.bAGe6rZ/nE1quqTLK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:50:49','2018-01-05 10:49:25',1,1,5,452,NULL,NULL,NULL,NULL),(205,'400100',6,'EMP0000432',NULL,'400100@spanpump.com','$2a$10$NyyRNr6kMtTUMUt5j7N/FOfprSwLw6x5nNoO7A4ScxvWvzPTU/8V2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:51:04','2018-01-05 10:49:25',1,5,53,432,NULL,NULL,NULL,NULL),(206,'400015',5,'EMP0000347',NULL,'spantanks@spanpump.com','$2a$10$iQWjlDA9RNrDLC/jt1PPT.5POIcM7D0rIn5TNK3fQkxnLogaxXUYC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-11-15 09:51:18','2018-01-05 10:49:25',1,10,49,347,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_balances`
--

DROP TABLE IF EXISTS `membership_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_membership_balances_on_membership_id` (`membership_id`),
  CONSTRAINT `fk_rails_f012b6c0e2` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_balances`
--

LOCK TABLES `membership_balances` WRITE;
/*!40000 ALTER TABLE `membership_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_contributions`
--

DROP TABLE IF EXISTS `membership_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_membership_contributions_on_membership_id` (`membership_id`),
  CONSTRAINT `fk_rails_c0e30ded3c` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_contributions`
--

LOCK TABLES `membership_contributions` WRITE;
/*!40000 ALTER TABLE `membership_contributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_types`
--

DROP TABLE IF EXISTS `membership_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_types`
--

LOCK TABLES `membership_types` WRITE;
/*!40000 ALTER TABLE `membership_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `membership_type_id` int(11) DEFAULT NULL,
  `contribution` decimal(10,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_memberships_on_employee_id` (`employee_id`),
  KEY `index_memberships_on_membership_type_id` (`membership_type_id`),
  CONSTRAINT `fk_rails_90ea0fec9e` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_a570700f17` FOREIGN KEY (`membership_type_id`) REFERENCES `membership_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_expences`
--

LOCK TABLES `monthly_expences` WRITE;
/*!40000 ALTER TABLE `monthly_expences` DISABLE KEYS */;
INSERT INTO `monthly_expences` VALUES (1,'2017-06-01',1023.00,254,1,1,'','2017-08-01 07:40:07','2017-08-01 10:34:36'),(2,'2017-06-01',834.00,280,1,1,'','2017-08-01 07:40:57','2017-08-01 10:34:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_records`
--

LOCK TABLES `od_records` WRITE;
/*!40000 ALTER TABLE `od_records` DISABLE KEYS */;
INSERT INTO `od_records` VALUES (1,307,1,'2017-08-12','Rejected','2017-08-14 07:31:16','2017-08-14 07:31:16'),(2,307,2,'2017-09-12','FinalApproved','2017-09-11 10:23:45','2017-09-11 10:23:45'),(3,279,3,'2017-09-16','Cancelled','2017-09-13 06:48:41','2017-09-13 06:48:41'),(4,279,3,'2017-09-17','Cancelled','2017-09-13 06:48:41','2017-09-13 06:48:41'),(5,263,4,'2017-09-15','FinalApproved','2017-09-14 07:08:13','2017-09-14 07:08:13'),(6,272,5,'2017-09-16','FinalApproved','2017-09-14 07:18:32','2017-09-14 07:18:32'),(7,254,6,'2017-09-16','FinalApproved','2017-09-16 05:04:12','2017-09-16 05:04:12'),(8,290,7,'2017-09-18','Cancelled','2017-09-16 06:15:20','2017-09-16 06:15:20'),(9,254,8,'2017-09-18','FinalApproved','2017-09-16 09:09:59','2017-09-16 09:09:59'),(10,286,9,'2017-09-22','FinalApproved','2017-09-22 10:59:16','2017-09-22 10:59:16'),(11,305,10,'2017-12-20','FinalApproved','2017-12-30 08:06:55','2017-12-30 08:06:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `od_status_records`
--

LOCK TABLES `od_status_records` WRITE;
/*!40000 ALTER TABLE `od_status_records` DISABLE KEYS */;
INSERT INTO `od_status_records` VALUES (1,1,307,'Pending','2017-08-14 00:00:00','2017-08-14 07:31:16','2017-08-14 07:31:16'),(2,2,307,'Pending','2017-09-11 00:00:00','2017-09-11 10:23:45','2017-09-11 10:23:45'),(3,3,279,'Pending','2017-09-13 00:00:00','2017-09-13 06:48:41','2017-09-13 06:48:41'),(4,3,279,'Cancelled','2017-09-13 00:00:00','2017-09-13 06:49:44','2017-09-13 06:49:44'),(5,4,263,'Pending','2017-09-14 00:00:00','2017-09-14 07:08:14','2017-09-14 07:08:14'),(6,5,272,'Pending','2017-09-14 00:00:00','2017-09-14 07:18:32','2017-09-14 07:18:32'),(7,4,257,'FinalApproved','2017-09-14 00:00:00','2017-09-14 07:24:27','2017-09-14 07:24:27'),(8,5,257,'FinalApproved','2017-09-14 00:00:00','2017-09-14 12:54:30','2017-09-14 12:54:30'),(9,6,254,'Pending','2017-09-16 00:00:00','2017-09-16 05:04:12','2017-09-16 05:04:12'),(10,7,290,'Pending','2017-09-16 00:00:00','2017-09-16 06:15:20','2017-09-16 06:15:20'),(11,7,257,'FinalApproved','2017-09-16 00:00:00','2017-09-16 06:19:14','2017-09-16 06:19:14'),(12,8,254,'Pending','2017-09-16 00:00:00','2017-09-16 09:09:59','2017-09-16 09:09:59'),(13,9,286,'Pending','2017-09-22 00:00:00','2017-09-22 10:59:16','2017-09-22 10:59:16'),(14,6,304,'FinalApproved','2017-09-22 00:00:00','2017-09-22 12:18:33','2017-09-22 12:18:33'),(15,8,304,'FinalApproved','2017-09-22 00:00:00','2017-09-22 12:18:39','2017-09-22 12:18:39'),(16,9,304,'FinalApproved','2017-09-22 00:00:00','2017-09-22 12:18:47','2017-09-22 12:18:47'),(17,10,305,'Pending','2017-12-30 00:00:00','2017-12-30 08:06:55','2017-12-30 08:06:55'),(18,10,304,'FinalApproved','2017-12-30 00:00:00','2017-12-30 08:11:13','2017-12-30 08:11:13'),(19,1,305,'Rejected','2017-12-30 00:00:00','2017-12-30 09:02:49','2017-12-30 09:02:49'),(20,2,305,'FinalApproved','2017-12-30 00:00:00','2017-12-30 09:03:22','2017-12-30 09:03:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_duty_requests`
--

LOCK TABLES `on_duty_requests` WRITE;
/*!40000 ALTER TABLE `on_duty_requests` DISABLE KEYS */;
INSERT INTO `on_duty_requests` VALUES (1,307,'Full Day','2017-08-12 00:00:00','2017-08-12 00:00:00','1.0','Factory Visit',0,0,NULL,304,NULL,4,1,0,0,0,0,1,'2017-08-14 07:31:16','2017-12-30 09:02:49'),(2,307,'Full Day','2017-09-12 00:00:00','2017-09-12 00:00:00','1.0','',NULL,NULL,NULL,304,NULL,3,1,0,0,1,0,0,'2017-09-11 10:23:45','2017-12-30 09:03:21'),(3,279,'Full Day','2017-09-16 00:00:00','2017-09-17 00:00:00','2.0','',NULL,NULL,NULL,252,NULL,1,1,1,0,0,0,0,'2017-09-13 06:48:41','2017-09-13 06:49:44'),(4,263,'Half Day','2017-09-15 00:00:00','2017-09-15 00:00:00','0.5','Vendor development visit in Bhosari MIDC',0,1,1,257,NULL,3,1,0,1,0,0,0,'2017-09-14 07:08:13','2017-09-14 07:24:27'),(5,272,'Full Day','2017-09-16 00:00:00','2017-09-16 00:00:00','1.0','Supllier visit to Karad (Shree Ref.)',NULL,NULL,NULL,257,NULL,3,1,0,1,0,0,0,'2017-09-14 07:18:32','2017-09-14 12:54:30'),(6,254,'Full/Half','2017-09-16 00:00:00','2017-09-16 00:00:00','0.5','from 9:30 to 10:30 Li ion Battery welding ',1,0,NULL,304,NULL,3,1,0,1,0,0,0,'2017-09-16 05:04:12','2017-09-22 12:18:33'),(7,290,'Full Day','2017-09-18 00:00:00','2017-09-18 00:00:00','1.0','Full day Seminar of Nichicon at Novotel viman nagar',NULL,NULL,NULL,257,NULL,3,1,0,1,0,0,0,'2017-09-16 06:15:20','2017-09-16 06:19:14'),(8,254,'Half Day','2017-09-18 00:00:00','2017-09-18 00:00:00','0.5','Seminar Nichicon Capacitor Manufacturer ',1,0,NULL,304,NULL,3,1,0,1,0,0,0,'2017-09-16 09:09:59','2017-09-22 12:18:39'),(9,286,'Half Day','2017-09-22 00:00:00','2017-09-22 00:00:00','0.5','Visit in GST office for Rebate purpose',0,1,1,304,NULL,3,1,0,1,0,0,0,'2017-09-22 10:59:16','2017-09-22 12:18:47'),(10,305,'Full Day','2017-12-20 00:00:00','2017-12-20 00:00:00','1','OD leave',NULL,NULL,NULL,304,NULL,3,1,0,0,1,0,0,'2017-12-30 08:06:55','2017-12-30 08:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_leave_records`
--

LOCK TABLES `particular_leave_records` WRITE;
/*!40000 ALTER TABLE `particular_leave_records` DISABLE KEYS */;
INSERT INTO `particular_leave_records` VALUES (6,305,3,1,'2017-09-16 00:00:00',1,NULL,'2017-09-20 03:26:52','2017-09-20 03:26:52'),(8,275,2,1,'2017-09-14 00:00:00',1,NULL,'2017-09-20 03:29:49','2017-09-20 03:29:49'),(9,259,5,1,'2017-10-21 00:00:00',1,NULL,'2017-09-20 05:10:07','2017-09-20 05:10:07'),(10,287,1,1,'2017-09-16 00:00:00',1,NULL,'2017-09-20 05:10:22','2017-09-20 05:10:22'),(11,288,4,1,'2017-09-23 00:00:00',1,NULL,'2017-09-20 05:10:36','2017-09-20 05:10:36'),(12,259,7,2,'2017-10-16 00:00:00',1,NULL,'2017-09-20 05:10:47','2017-09-20 05:10:47'),(14,254,8,1,'2017-09-23 00:00:00',1,1,'2017-09-20 05:28:25','2017-09-22 06:13:55'),(15,289,6,1,'2017-09-12 00:00:00',1,NULL,'2017-09-20 06:15:24','2017-09-20 06:15:24'),(16,276,10,1,'2017-09-23 00:00:00',1,NULL,'2017-09-22 12:57:38','2017-09-22 12:57:38'),(17,301,12,1,'2017-09-23 00:00:00',1,NULL,'2017-09-22 13:54:04','2017-09-22 13:54:04'),(18,265,13,2,'2017-09-29 00:00:00',1,NULL,'2017-09-28 06:10:29','2017-09-28 06:10:29'),(19,305,14,6,'2017-12-21 00:00:00',1,NULL,'2017-12-30 08:05:56','2017-12-30 08:05:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular_od_records`
--

LOCK TABLES `particular_od_records` WRITE;
/*!40000 ALTER TABLE `particular_od_records` DISABLE KEYS */;
INSERT INTO `particular_od_records` VALUES (1,263,4,'2017-09-15 00:00:00',0,NULL,'2017-09-14 07:24:27','2017-09-14 07:24:27'),(2,263,4,'2017-09-15 00:00:00',0,NULL,'2017-09-14 07:25:13','2017-09-14 07:25:13'),(3,272,5,'2017-09-16 00:00:00',1,NULL,'2017-09-14 12:54:30','2017-09-14 12:54:30'),(4,290,7,'2017-09-18 00:00:00',1,1,'2017-09-16 06:19:14','2017-09-16 06:21:13'),(5,254,6,'2017-09-16 00:00:00',0,NULL,'2017-09-22 12:18:33','2017-09-22 12:18:33'),(6,254,8,'2017-09-18 00:00:00',0,NULL,'2017-09-22 12:18:39','2017-09-22 12:18:39'),(7,286,9,'2017-09-22 00:00:00',0,NULL,'2017-09-22 12:18:47','2017-09-22 12:18:47'),(8,305,10,'2017-12-20 00:00:00',1,NULL,'2017-12-30 08:11:13','2017-12-30 08:11:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_periods`
--

LOCK TABLES `payroll_periods` WRITE;
/*!40000 ALTER TABLE `payroll_periods` DISABLE KEYS */;
INSERT INTO `payroll_periods` VALUES (1,'2017-06-01','2017-12-31',1,'2017-06-29 11:30:35','2017-08-11 10:42:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_employers`
--

LOCK TABLES `pf_employers` WRITE;
/*!40000 ALTER TABLE `pf_employers` DISABLE KEYS */;
INSERT INTO `pf_employers` VALUES (1,'1',12,'2017-01-01','2017-12-31',1,NULL,'2017-08-01 07:55:48','2017-08-01 10:19:05');
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
INSERT INTO `pf_masters` VALUES (1,1,12.00,'2017-07-01',15000.00,'1',1,NULL,'2017-07-27 11:50:23','2017-08-01 10:18:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_reason_masters`
--

LOCK TABLES `plan_reason_masters` WRITE;
/*!40000 ALTER TABLE `plan_reason_masters` DISABLE KEYS */;
INSERT INTO `plan_reason_masters` VALUES (1,'','','',0,'2017-12-30 08:53:41','2017-12-30 08:53:41');
/*!40000 ALTER TABLE `plan_reason_masters` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_types`
--

LOCK TABLES `policy_types` WRITE;
/*!40000 ALTER TABLE `policy_types` DISABLE KEYS */;
INSERT INTO `policy_types` VALUES (1,'1','HR Polices','',1,'2017-06-19 10:34:02','2017-08-22 09:28:11'),(2,'2','Admin Polices','Admin Polices',1,'2017-06-19 12:53:37','2017-08-22 09:28:36');
/*!40000 ALTER TABLE `policy_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_onboardings`
--

DROP TABLE IF EXISTS `pre_onboardings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_onboardings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selected_resume_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fathers_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `pin_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8_unicode_ci,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optional_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adhar_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pre_onboardings_on_selected_resume_id` (`selected_resume_id`),
  KEY `index_pre_onboardings_on_country_id` (`country_id`),
  KEY `index_pre_onboardings_on_state_id` (`state_id`),
  KEY `index_pre_onboardings_on_district_id` (`district_id`),
  CONSTRAINT `fk_rails_562b36ef68` FOREIGN KEY (`selected_resume_id`) REFERENCES `selected_resumes` (`id`),
  CONSTRAINT `fk_rails_5f27ff8d73` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `fk_rails_736666d0a4` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_c964301a9c` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_onboardings`
--

LOCK TABLES `pre_onboardings` WRITE;
/*!40000 ALTER TABLE `pre_onboardings` DISABLE KEYS */;
INSERT INTO `pre_onboardings` VALUES (2,NULL,'ff','','','2017-07-05','','','','','fff','',1,NULL,NULL,'453221','','','','tanu@gmail.com','BACDC12687','123456789524','2017-07-27 07:20:58','2017-07-27 07:20:58'),(5,NULL,'Tanu','.','Chourey','1993-07-01','Female','UnMarried','Mr. Anil Chourey','1','Hoshangabad','Hoshangabad',1,NULL,NULL,'400421','Mumbai','7455268955','8865411236','tanu@gmail.com','BACDC12687','123456789524','2017-07-27 07:49:09','2017-07-27 07:49:09');
/*!40000 ALTER TABLE `pre_onboardings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_tax_masters`
--

LOCK TABLES `professional_tax_masters` WRITE;
/*!40000 ALTER TABLE `professional_tax_masters` DISABLE KEYS */;
INSERT INTO `professional_tax_masters` VALUES (1,'1,2,4,9,10,15,22,23,24,25',7500,10000,175,300,'2017-07-01','2017-06-30',1,NULL,1,1,'2017-07-27 11:53:43','2017-07-27 11:54:49'),(2,'1,2,4,9,10,15,22,23,24',10001,2000000,200,300,'2017-07-01','2017-12-31',1,NULL,1,1,'2017-07-27 11:56:04','2017-08-01 07:54:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_histories`
--

LOCK TABLES `promotion_histories` WRITE;
/*!40000 ALTER TABLE `promotion_histories` DISABLE KEYS */;
INSERT INTO `promotion_histories` VALUES (1,1,332,24,10,3,2,'','','2017-06-30',NULL,'2017-08-22 11:13:02','2017-08-22 11:13:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punch_masters`
--

LOCK TABLES `punch_masters` WRITE;
/*!40000 ALTER TABLE `punch_masters` DISABLE KEYS */;
INSERT INTO `punch_masters` VALUES (4,'04:30:00','23:45:00','Main Door IN','Main Door Out',7,4,1,'2017-07-04 06:10:30','2017-07-05 06:18:54'),(6,'00:15:00','04:30:00','Main Door IN','Main Door Out',7,4,0,'2017-07-05 06:14:50','2017-07-05 07:02:47');
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
INSERT INTO `qualifications` VALUES (1,332,26,9,14,NULL,NULL,'',NULL,'75','2017-08-22 06:57:25','2017-08-22 06:57:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_masters`
--

LOCK TABLES `question_masters` WRITE;
/*!40000 ALTER TABLE `question_masters` DISABLE KEYS */;
INSERT INTO `question_masters` VALUES (1,'1','Why do you leave ?',NULL,NULL,'2017-12-30 08:13:11','2017-12-30 08:13:11');
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
INSERT INTO `religions` VALUES (1,'Hindu','1.0',NULL,NULL,'2017-05-26 21:09:50','2017-08-22 06:31:47'),(2,'Jain','2.0',NULL,NULL,'2017-05-26 21:09:50','2017-08-22 06:31:53'),(3,'Islam','3.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'Christianity','4.0',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'Sikh','5.0',NULL,NULL,'2017-05-26 21:09:50','2017-08-22 06:32:02'),(6,'Buddh','6.0',NULL,NULL,'2017-05-26 21:09:50','2017-08-22 06:32:21');
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
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reporting_employee_transfers_on_employee_transfer_id` (`employee_transfer_id`),
  CONSTRAINT `fk_rails_4b58f99d0a` FOREIGN KEY (`employee_transfer_id`) REFERENCES `employee_transfers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_employee_transfers`
--

LOCK TABLES `reporting_employee_transfers` WRITE;
/*!40000 ALTER TABLE `reporting_employee_transfers` DISABLE KEYS */;
INSERT INTO `reporting_employee_transfers` VALUES (2,3,'FinalApproved','2017-08-23 07:47:14','2017-08-23 07:47:14',250),(3,4,'FinalApproved','2017-08-23 08:00:01','2017-08-23 08:00:01',250),(4,5,'Pending','2017-12-16 11:49:04','2017-12-16 11:49:04',307),(5,6,'FinalApproved','2017-12-26 07:15:58','2017-12-26 07:15:58',307),(6,7,'FinalApproved','2017-12-30 09:04:24','2017-12-30 09:04:24',305);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporting_masters`
--

LOCK TABLES `reporting_masters` WRITE;
/*!40000 ALTER TABLE `reporting_masters` DISABLE KEYS */;
INSERT INTO `reporting_masters` VALUES (1,NULL,NULL,NULL,252,'2017-06-07 05:24:56','2017-07-27 08:57:01',1),(2,NULL,NULL,NULL,255,'2017-07-27 08:56:38','2017-09-11 11:07:25',1),(3,NULL,NULL,NULL,304,'2017-08-01 11:39:19','2017-08-01 11:39:19',1),(4,NULL,NULL,NULL,307,'2017-08-11 10:31:50','2017-08-11 10:31:50',1),(5,NULL,NULL,NULL,254,'2017-09-11 11:07:02','2017-09-11 11:07:02',1),(6,NULL,NULL,NULL,274,'2017-09-11 11:09:58','2017-09-11 11:09:58',1),(7,NULL,NULL,NULL,257,'2017-09-11 11:10:22','2017-09-11 11:10:22',1),(8,NULL,NULL,NULL,294,'2017-09-11 11:10:41','2017-09-11 11:10:41',1),(9,NULL,NULL,NULL,309,'2017-09-11 11:10:51','2017-09-11 11:10:51',1),(10,NULL,NULL,NULL,253,'2017-11-15 04:24:33','2017-11-15 04:24:33',1),(11,NULL,NULL,NULL,425,'2017-11-15 04:25:11','2017-11-15 04:25:11',1),(12,NULL,NULL,NULL,424,'2017-11-15 04:25:29','2017-11-15 04:25:29',1),(13,NULL,NULL,NULL,342,'2017-11-15 04:33:33','2017-11-15 04:33:33',1),(14,NULL,NULL,NULL,329,'2017-11-15 04:33:50','2017-11-15 04:33:50',1),(15,NULL,NULL,NULL,347,'2017-11-15 04:34:15','2017-11-15 04:34:15',1),(16,NULL,NULL,NULL,401,'2017-11-15 04:45:16','2017-11-15 04:45:16',1),(17,NULL,NULL,NULL,351,'2017-11-15 04:45:42','2017-11-15 04:45:42',1),(18,NULL,NULL,NULL,391,'2017-11-15 04:45:59','2017-11-15 04:45:59',1),(19,NULL,NULL,NULL,353,'2017-11-15 04:46:09','2017-11-15 04:46:09',0),(20,NULL,NULL,NULL,358,'2017-11-15 04:46:41','2017-11-15 04:46:41',1),(21,NULL,NULL,NULL,392,'2017-11-15 04:47:05','2017-11-15 04:47:05',1),(22,NULL,NULL,NULL,400,'2017-11-15 04:47:17','2017-11-15 04:47:17',1),(23,NULL,NULL,NULL,261,'2017-11-15 09:49:44','2017-11-15 09:49:44',1),(24,NULL,NULL,NULL,453,'2017-11-15 09:55:48','2017-11-15 09:55:48',1);
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
  `travel_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `daily_bill_comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
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
  `vacancy_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resignation_histories`
--

LOCK TABLES `resignation_histories` WRITE;
/*!40000 ALTER TABLE `resignation_histories` DISABLE KEYS */;
INSERT INTO `resignation_histories` VALUES (1,1,NULL,'2017-12-31','Personal',NULL,'','','2017-12-31',NULL,'2017-12-31','NA','2017-12-31',NULL,NULL,NULL,NULL,1,298,NULL,'2017-12-30 08:17:15','2017-12-30 08:17:15');
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
INSERT INTO `resignation_status_records` VALUES (1,1,305,'FinalApproved','2017-12-30 00:00:00','2017-12-30 08:17:15','2017-12-30 08:17:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1.0','GroupAdmin',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(2,'2.0','Admin',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(3,'3.0','Branch',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(4,'4.0','HOD',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(5,'5.0','Supervisor',NULL,NULL,'2017-05-26 21:09:50','2017-05-26 21:09:50'),(6,'6.0','Employee','',NULL,'2017-08-11 10:32:39','2017-08-11 10:32:39'),(7,'7.0','NewEmployee','',NULL,'2017-09-13 05:19:27','2017-09-13 05:19:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_component_templates`
--

LOCK TABLES `salary_component_templates` WRITE;
/*!40000 ALTER TABLE `salary_component_templates` DISABLE KEYS */;
INSERT INTO `salary_component_templates` VALUES (9,'Salary Template',2,1,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:39:21','2017-08-01 06:39:21'),(10,'Salary Template',2,2,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:39:33','2017-08-01 06:39:33'),(11,'Salary Template',2,4,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:39:44','2017-08-01 06:39:44'),(12,'Salary Template',2,8,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:39:55','2017-08-01 06:39:55'),(13,'Salary Template',2,23,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:40:09','2017-08-01 06:40:09'),(14,'Salary Template',2,9,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:40:30','2017-08-01 06:40:30'),(15,'Salary Template',2,24,0,NULL,NULL,NULL,NULL,NULL,'Monthly',NULL,NULL,NULL,NULL,'2017-08-01 06:40:45','2017-08-01 06:40:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_components`
--

LOCK TABLES `salary_components` WRITE;
/*!40000 ALTER TABLE `salary_components` DISABLE KEYS */;
INSERT INTO `salary_components` VALUES (1,'001','Basic','Basic',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:02:16'),(2,'002','HRA','HRA',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:02:24'),(3,'003','Special Allowance','Special Allowance',NULL,0,NULL,'',0,0,'2017-05-26 21:09:51','2017-06-07 06:03:27'),(4,'004','Convenience Allowance','Convenience Allowance',NULL,0,NULL,'',1,1,'2017-05-26 21:09:51','2017-06-07 06:03:16'),(5,'5.0','Other Allowance','Other Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(6,'6.0','Washing Allowance','Washing Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(7,'7.0','Driver Allowance','Driver Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(8,'8.0','Medical Allowance','Medical Allowance',NULL,0,NULL,'',1,0,'2017-05-26 21:09:51','2018-01-09 05:04:54'),(9,'009','Children Education Allowance','Children Education Allowance',NULL,0,NULL,'',0,1,'2017-05-26 21:09:51','2018-01-09 05:08:28'),(10,'010','Provident Fund','Provident Fund',NULL,0,NULL,'',0,1,'2017-05-26 21:09:51','2018-01-09 05:08:07'),(11,'11.0','ESIC','Employee\'s State Insurance Corporation',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(12,'12.0','Income Tax','Income Tax',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(13,'13.0','Food Deduction','Food Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(14,'14.0','Other Deduction','Other Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(15,'015','Professional Tax','Professional Tax',NULL,0,NULL,'',0,1,'2017-05-26 21:09:51','2018-01-09 05:09:35'),(16,'16.0','Society','Deposit',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(17,'17.0','Society Loan','Society',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(18,'18.0','Retaintion','Retaintion',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(19,'19.0','DA','Dearness Allowance',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(20,'20.0','Welfair','Welfair',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(21,'21.0','Mobile Deduction','Mobile Deduction',NULL,0,NULL,NULL,NULL,NULL,'2017-05-26 21:09:51','2017-05-26 21:09:51'),(22,'022','Medical Reimbursement','Medical Reimbursement',NULL,0,NULL,'',0,1,'2017-06-07 06:04:15','2018-01-09 05:10:38'),(23,'023','Leave Travel Allowance','Leave Travel Allowance',NULL,0,NULL,'',0,1,'2017-06-07 06:05:02','2018-01-09 05:06:42'),(24,'024','Progressive Allowance','Progressive Allowance',NULL,0,NULL,'',1,1,'2017-06-07 06:07:21','2017-08-01 06:36:03'),(25,'025','Transport Allowance','Transport Allowance',NULL,0,NULL,'',0,1,'2017-06-07 06:08:11','2018-01-09 05:07:11'),(26,'26','Advance','Advance',NULL,1,NULL,'',0,0,'2017-08-01 07:59:07','2018-01-09 05:07:36'),(27,'11','LTA','',NULL,0,NULL,'',1,1,'2018-01-09 05:05:41','2018-01-09 05:05:41'),(28,'12','Education Allowance','',NULL,0,NULL,'',1,1,'2018-01-09 05:08:50','2018-01-09 05:08:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_templates`
--

LOCK TABLES `salary_templates` WRITE;
/*!40000 ALTER TABLE `salary_templates` DISABLE KEYS */;
INSERT INTO `salary_templates` VALUES (2,'Salary Template','','2017-01-01',1,NULL,'2017-08-01 06:39:07','2017-08-01 06:39:07'),(3,'Salary Template1','','2017-01-01',1,NULL,'2017-10-26 10:18:46','2017-10-26 10:18:46');
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
INSERT INTO `schema_migrations` VALUES ('20150506130010'),('20150702064751'),('20151101151405'),('20151101151440'),('20151101151509'),('20151104135710'),('20151104142922'),('20151105940400'),('20151105940411'),('20151109142336'),('20151109142424'),('20151111633931'),('20151114065322'),('20151114065502'),('20151114132206'),('20151115070825'),('20151115152647'),('20151116052910'),('20151116055601'),('20151116055602'),('20151116055603'),('20151116090720'),('20151116115740'),('20151116120220'),('20151116123229'),('20151116123242'),('20151116123308'),('20151116132430'),('20151116132432'),('20151117053656'),('20151117064042'),('20151117083635'),('20151117084033'),('20151117084419'),('20151117084508'),('20151117085244'),('20151117085356'),('20151117103754'),('20151124060539'),('20151124060648'),('20151124060834'),('20151128095514'),('20151128104625'),('20151128104626'),('20151201114019'),('20151201114139'),('20151201114150'),('20151201114901'),('20151218133731'),('20151229082112'),('20151229101851'),('20160102053620'),('20160102053629'),('20160104131256'),('20160106052749'),('20160106132935'),('20160107054936'),('20160113064755'),('20160115071059'),('20160115073043'),('20160118052507'),('20160127112049'),('20160204114151'),('20160209093643'),('20160209093844'),('20160215105326'),('20160218060839'),('20160218090752'),('20160218151055'),('20160219071732'),('20160219084953'),('20160219085336'),('20160219105414'),('20160219121055'),('20160229093149'),('20160229130415'),('20160308052720'),('20160308054055'),('20160308110458'),('20160309072652'),('20160309115846'),('20160312115859'),('20160315100744'),('20160315140347'),('20160315145447'),('20160315145448'),('20160316052708'),('20160316094100'),('20160331045039'),('20160331045040'),('20160404140512'),('20160420061134'),('20160425125831'),('20160425125832'),('20160425125834'),('20160425130116'),('20160425130117'),('20160425130430'),('20160427065407'),('20160429092014'),('20160506132700'),('20160507041031'),('20160507041032'),('20160507091410'),('20160507093658'),('20160512064602'),('20160512064603'),('20160512104400'),('20160512104401'),('20160519044003'),('20160519044004'),('20160519052729'),('20160519095917'),('20160521091802'),('20160521092156'),('20160521092424'),('20160521102303'),('20160521102304'),('20160521102305'),('20160521134145'),('20160523054527'),('20160523060506'),('20160523121643'),('20160524135053'),('20160525051631'),('20160525072424'),('20160525073459'),('20160525080157'),('20160525094450'),('20160525095455'),('20160525095858'),('20160525100159'),('20160525151304'),('20160526052421'),('20160526052958'),('20160527141004'),('20160527141144'),('20160527142913'),('20160527142914'),('20160527142915'),('20160528063329'),('20160528063330'),('20160601110412'),('20160603070019'),('20160611124310'),('20160611124311'),('20160611124312'),('20160611124313'),('20160611124314'),('20160615092744'),('20160616065812'),('20160616095752'),('20160616133220'),('20160617092902'),('20160620121046'),('20160623041219'),('20160623041859'),('20160702120512'),('20160705193212'),('20160709092245'),('20160714110530'),('20160714150355'),('20160714151407'),('20160714152316'),('20160715031312'),('20160715031442'),('20160715032659'),('20160715034115'),('20160715035845'),('20160715042318'),('20160716054447'),('20160716101049'),('20160716101536'),('20160716102118'),('20160718060157'),('20160718064620'),('20160718065930'),('20160719060334'),('20160719060335'),('20160721085732'),('20160819054051'),('20160903102803'),('20160903102804'),('20160903102911'),('20160903103023'),('20160903103123'),('20160903103215'),('20160903104257'),('20160903104352'),('20160903104437'),('20160903104600'),('20160903104933'),('20160926063141'),('20161112100549'),('20161112100614'),('20161112100638'),('20161112102835'),('20161112121755'),('20161113054541'),('20161113054556'),('20161113062727'),('20161123105419'),('20161124091647'),('20161124091725'),('20161124112153'),('20161220121946'),('20161220124243'),('20170102092744'),('20170109125507'),('20170203131348'),('20170209052940'),('20170209064013'),('20170209103531'),('20170213063011'),('20170215060325'),('20170218053643'),('20170224044647'),('20170224062827'),('20170321071816'),('20170321071817'),('20170321084647'),('20170404101934'),('20170405090450'),('20170405090451'),('20170407050053'),('20170407094809'),('20170427043450'),('20170516101636'),('20170516131303'),('20170516132052'),('20170525071934'),('20170525123712'),('20170529115353'),('20170531092320'),('20170531092703'),('20170531114045'),('20170531125126'),('20170602065242'),('20170604072528'),('20170604073538'),('20170607052133'),('20170609074403'),('20170609123339'),('20170610051252'),('20170616113933'),('20170714052201'),('20170715071436'),('20170717054356'),('20170717060309'),('20170717082759'),('20170717110342'),('20170717131343'),('20170717133825'),('20170718055633'),('20170718060135'),('20170719112629'),('20170719123601'),('20170720090004'),('20170721053749'),('20170721092158'),('20170724071545'),('20170724105724'),('20170724115749'),('20170727090804'),('20170729093743'),('20170729093918'),('20170802054021'),('20170803091421'),('20170803091530'),('20170804042541'),('20170804114606'),('20170804125658'),('20170805045810'),('20170808095750'),('20170809114810'),('20170812084726'),('20170814060527'),('20170814075623'),('20170817113018'),('20170817113725'),('20170817121331'),('20170817121910'),('20170817122856'),('20170818051544'),('20170818095147'),('20170818114745'),('20170818121249'),('20170822065908'),('20170822080917'),('20170822081704'),('20170822113535'),('20170823073429'),('20170823073915'),('20170823075025'),('20170823081914'),('20170824110622'),('20170824113357'),('20170830055758'),('20170831060542'),('20170904051202'),('20170904052225'),('20170904052510'),('20170904052901'),('20170904054444'),('20170905074326'),('20170906103333'),('20170907051748'),('20170908033746'),('20170920061829'),('20171117112456'),('20171125073126'),('20171128073429'),('20171211112950'),('20171215123749'),('20180102042535');
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
  `add_by_id` int(11) DEFAULT NULL,
  `current_ctc` decimal(10,0) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_masters`
--

LOCK TABLES `shift_masters` WRITE;
/*!40000 ALTER TABLE `shift_masters` DISABLE KEYS */;
INSERT INTO `shift_masters` VALUES (1,100000,'Office','',NULL,1,'2017-09-18 04:26:03','2017-09-18 04:26:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skillsets`
--

LOCK TABLES `skillsets` WRITE;
/*!40000 ALTER TABLE `skillsets` DISABLE KEYS */;
INSERT INTO `skillsets` VALUES (1,332,'HR','Expertise',NULL,'2017-08-22 06:58:35','2017-08-22 06:58:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_c_offs`
--

LOCK TABLES `status_c_offs` WRITE;
/*!40000 ALTER TABLE `status_c_offs` DISABLE KEYS */;
INSERT INTO `status_c_offs` VALUES (1,1,332,'FinalApproved','2017-08-22 09:52:17','2017-08-22 09:52:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_departments`
--

LOCK TABLES `sub_departments` WRITE;
/*!40000 ALTER TABLE `sub_departments` DISABLE KEYS */;
INSERT INTO `sub_departments` VALUES (1,1,'NA','NA',1,'2017-08-23 11:20:14','2017-08-23 11:20:14'),(2,2,'NA','NA',1,'2017-08-23 11:20:29','2017-08-23 11:20:29'),(3,31,'Pune','Material Management',1,'2017-11-21 07:48:06','2017-11-21 07:48:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoughts`
--

LOCK TABLES `thoughts` WRITE;
/*!40000 ALTER TABLE `thoughts` DISABLE KEYS */;
INSERT INTO `thoughts` VALUES (1,'2018-01-09','Early to Sleep','tanuja','2017-06-20 12:48:41','2018-01-09 07:20:09');
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
  `trainer_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_trainer` text COLLATE utf8_unicode_ci,
  `period_id` int(11) DEFAULT NULL,
  `trainer_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `training_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_training_plans_on_training_topic_master_id` (`training_topic_master_id`),
  KEY `index_training_plans_on_period_id` (`period_id`),
  CONSTRAINT `fk_rails_722231f687` FOREIGN KEY (`training_topic_master_id`) REFERENCES `training_topic_masters` (`id`),
  CONSTRAINT `fk_rails_a90174f6bf` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`)
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
  `reporting_master_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_histories`
--

LOCK TABLES `transfer_histories` WRITE;
/*!40000 ALTER TABLE `transfer_histories` DISABLE KEYS */;
INSERT INTO `transfer_histories` VALUES (2,4,250,2,2,1,1,20,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-08-23 08:00:01','2017-08-23 08:00:01',NULL,NULL,250),(3,6,359,8,2,1,4,15,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-12-26 07:15:58','2017-12-26 07:15:58',NULL,NULL,307),(4,7,250,3,2,1,1,27,NULL,NULL,NULL,NULL,NULL,'FinalApproved',NULL,'2017-12-30 09:04:24','2017-12-30 09:04:24',NULL,NULL,305);
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
  `current_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `travel_option_id` int(11) DEFAULT NULL,
  `travel_mode_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_bill_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reporting_master_id` int(11) DEFAULT NULL,
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
  `tour_purpose` text COLLATE utf8_unicode_ci,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traveling_advance` decimal(15,2) DEFAULT '0.00',
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
  `reporting_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_travel_requests_on_employee_id` (`employee_id`),
  KEY `index_travel_requests_on_travel_option_id` (`travel_option_id`),
  KEY `index_travel_requests_on_travel_mode_id` (`travel_mode_id`),
  CONSTRAINT `fk_rails_50acc33858` FOREIGN KEY (`travel_mode_id`) REFERENCES `travel_modes` (`id`),
  CONSTRAINT `fk_rails_5b96fe9977` FOREIGN KEY (`travel_option_id`) REFERENCES `travel_options` (`id`),
  CONSTRAINT `fk_rails_985cfe5831` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
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
  `recruiter_id` int(11) DEFAULT NULL,
  `target_date` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `vacancy_of` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `reporting_master_id` int(11) DEFAULT NULL,
  `sub_department_id` int(11) DEFAULT NULL,
  `cost_center_id` int(11) DEFAULT NULL,
  `target_company_id` int(11) DEFAULT NULL,
  `secondary_skill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_masters_on_department_id` (`department_id`),
  KEY `index_vacancy_masters_on_company_location_id` (`company_location_id`),
  KEY `index_vacancy_masters_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_masters_on_degree_id` (`degree_id`),
  KEY `index_vacancy_masters_on_employee_id` (`employee_id`),
  KEY `index_vacancy_masters_on_recruiter_id` (`recruiter_id`),
  KEY `index_vacancy_masters_on_company_id` (`company_id`),
  KEY `index_vacancy_masters_on_sub_department_id` (`sub_department_id`),
  KEY `index_vacancy_masters_on_cost_center_id` (`cost_center_id`),
  KEY `index_vacancy_masters_on_target_company_id` (`target_company_id`),
  CONSTRAINT `fk_rails_026a45f54e` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_35ed6efe66` FOREIGN KEY (`target_company_id`) REFERENCES `target_companies` (`id`),
  CONSTRAINT `fk_rails_367d29b4c1` FOREIGN KEY (`degree_id`) REFERENCES `degrees` (`id`),
  CONSTRAINT `fk_rails_6d72afd19d` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_96332426ca` FOREIGN KEY (`cost_center_id`) REFERENCES `cost_centers` (`id`),
  CONSTRAINT `fk_rails_9794a48164` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_rails_b3b3eb60a4` FOREIGN KEY (`sub_department_id`) REFERENCES `sub_departments` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_request_statuses`
--

LOCK TABLES `vacancy_request_statuses` WRITE;
/*!40000 ALTER TABLE `vacancy_request_statuses` DISABLE KEYS */;
INSERT INTO `vacancy_request_statuses` VALUES (50,20,1,'Pending','2017-06-23','2017-06-23 11:15:19','2017-06-23 11:15:19'),(51,20,2,'Approved','2017-06-23','2017-06-23 11:15:31','2017-06-23 11:15:31'),(52,20,2,'FinalApproved','2017-06-23','2017-06-23 11:15:47','2017-06-23 11:15:47'),(53,21,2,'Pending','2017-06-23','2017-06-23 11:17:46','2017-06-23 11:17:46'),(54,21,2,'FinalApproved','2017-06-23','2017-06-23 11:18:04','2017-06-23 11:18:04');
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vacancy_requests_on_employee_designation_id` (`employee_designation_id`),
  KEY `index_vacancy_requests_on_department_id` (`department_id`),
  CONSTRAINT `fk_rails_303f7c28a8` FOREIGN KEY (`employee_designation_id`) REFERENCES `employee_designations` (`id`),
  CONSTRAINT `fk_rails_cf7bd63395` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_requests`
--

LOCK TABLES `vacancy_requests` WRITE;
/*!40000 ALTER TABLE `vacancy_requests` DISABLE KEYS */;
INSERT INTO `vacancy_requests` VALUES (20,'c',1,'',1,2,'2017-06-23','be','',63,2,'3','FinalApproved','','2017-06-23 11:15:19','2017-06-23 11:15:47',5),(21,'pppp',8,'',2,2,'2017-06-23','ma','',67,2,'','FinalApproved','','2017-06-23 11:17:46','2017-06-23 11:18:04',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `well_faires`
--

LOCK TABLES `well_faires` WRITE;
/*!40000 ALTER TABLE `well_faires` DISABLE KEYS */;
INSERT INTO `well_faires` VALUES (1,'June',12.00,1,NULL,'2017-07-27 11:50:49','2017-07-27 11:50:49'),(2,'December',12.00,1,NULL,'2017-07-27 11:51:00','2017-07-27 11:51:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingdays`
--

LOCK TABLES `workingdays` WRITE;
/*!40000 ALTER TABLE `workingdays` DISABLE KEYS */;
INSERT INTO `workingdays` VALUES (53,251,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,3.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(54,256,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,0.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(55,281,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,1.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(56,261,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,1.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(57,289,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,2.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(58,271,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,29.0,NULL,2.0,1.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(59,254,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,29.0,NULL,2.0,1.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(60,269,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,0.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(61,280,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,26.0,NULL,8.0,4.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(62,288,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,28.0,NULL,3.0,2.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(63,287,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,1.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(64,296,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,29.0,NULL,6.0,1.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(65,301,NULL,'June','2017',NULL,NULL,30,NULL,0.0,4.0,NULL,30.0,NULL,0.0,0.0,NULL,NULL,NULL,1,NULL,NULL,'2017-08-01 10:34:15','2017-08-01 10:34:15',NULL,NULL,NULL),(66,250,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(67,251,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(68,252,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(69,253,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(70,254,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(71,257,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(72,258,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,27.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:23','2018-01-09 14:40:23',NULL,NULL,NULL),(73,259,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(74,260,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,24.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(75,261,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(76,263,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(77,264,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(78,265,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(79,266,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(80,267,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(81,268,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(82,269,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(83,271,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(84,272,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(85,273,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(86,274,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(87,275,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(88,276,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(89,277,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,20.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(90,278,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(91,279,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(92,280,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,17.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(93,281,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,2.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:24','2018-01-09 14:40:24',NULL,NULL,NULL),(94,282,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(95,284,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(96,285,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(97,286,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(98,287,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(99,289,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(100,290,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(101,291,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(102,292,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(103,293,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(104,294,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(105,295,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(106,296,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(107,297,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(108,298,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(109,299,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(110,300,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(111,301,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(112,302,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(113,303,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(114,304,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:25','2018-01-09 14:40:25',NULL,NULL,NULL),(115,305,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(116,306,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(117,307,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(118,308,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(119,445,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(120,446,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(121,447,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(122,448,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(123,449,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(124,450,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(125,451,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(126,444,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(127,452,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(128,453,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(129,454,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(130,455,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(131,332,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(132,309,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(133,310,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(134,311,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(135,312,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(136,313,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:26','2018-01-09 14:40:26',NULL,NULL,NULL),(137,314,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(138,315,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(139,316,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(140,318,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(141,319,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(142,320,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(143,321,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,22.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(144,322,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(145,323,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(146,324,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(147,325,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(148,456,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(149,457,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(150,458,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,5.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(151,326,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(152,327,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(153,328,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(154,329,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(155,330,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(156,331,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(157,334,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:27','2018-01-09 14:40:27',NULL,NULL,NULL),(158,335,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,28.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(159,336,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(160,337,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(161,338,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(162,339,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(163,340,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(164,341,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(165,342,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(166,343,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(167,344,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(168,345,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(169,346,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(170,347,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(171,348,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(172,351,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(173,352,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(174,353,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(175,354,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(176,355,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(177,357,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(178,358,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:28','2018-01-09 14:40:28',NULL,NULL,NULL),(179,359,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(180,360,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(181,361,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(182,362,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,23.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(183,363,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(184,364,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(185,365,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(186,366,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(187,367,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(188,368,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(189,369,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(190,370,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(191,371,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(192,372,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(193,373,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(194,374,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(195,375,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(196,376,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(197,377,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(198,378,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(199,379,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(200,380,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(201,381,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,27.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:29','2018-01-09 14:40:29',NULL,NULL,NULL),(202,382,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(203,383,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(204,384,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(205,385,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(206,386,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,26.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(207,387,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(208,388,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(209,389,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(210,390,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,28.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(211,391,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,9.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(212,392,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(213,394,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,15.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(214,395,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(215,396,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(216,397,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(217,398,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(218,399,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(219,400,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(220,402,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(221,403,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:30','2018-01-09 14:40:30',NULL,NULL,NULL),(222,406,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(223,407,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(224,408,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(225,409,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(226,410,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,28.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(227,411,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(228,412,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,23.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(229,413,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(230,414,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(231,415,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(232,417,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(233,418,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(234,419,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(235,420,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(236,421,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(237,423,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(238,424,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(239,425,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,9.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(240,426,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:31','2018-01-09 14:40:31',NULL,NULL,NULL),(241,427,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(242,428,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,8.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(243,430,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(244,431,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,28.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(245,433,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(246,434,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(247,435,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(248,436,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,29.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(249,439,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,26.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(250,440,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.5,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(251,441,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,31.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(252,442,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,9.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL),(253,443,NULL,'December','2017',NULL,NULL,31,0.0,0.0,0.0,NULL,30.0,NULL,0.0,NULL,0.0,NULL,NULL,NULL,NULL,NULL,'2018-01-09 14:40:32','2018-01-09 14:40:32',NULL,NULL,NULL);
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

-- Dump completed on 2018-01-09 21:04:03
