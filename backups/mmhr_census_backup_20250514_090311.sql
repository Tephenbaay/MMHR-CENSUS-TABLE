-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mmhr_census
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_notes`
--

DROP TABLE IF EXISTS `admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notes`
--

LOCK TABLES `admin_notes` WRITE;
/*!40000 ALTER TABLE `admin_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leading_causes`
--

DROP TABLE IF EXISTS `leading_causes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leading_causes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `icd_10` varchar(255) DEFAULT NULL,
  `sheet_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `leading_causes_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leading_causes`
--

LOCK TABLES `leading_causes` WRITE;
/*!40000 ALTER TABLE `leading_causes` DISABLE KEYS */;
/*!40000 ALTER TABLE `leading_causes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_logs`
--

DROP TABLE IF EXISTS `maintenance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_logs`
--

LOCK TABLES `maintenance_logs` WRITE;
/*!40000 ALTER TABLE `maintenance_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_records`
--

DROP TABLE IF EXISTS `patient_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `sheet_name` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `member_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `patient_records_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_records`
--

LOCK TABLES `patient_records` WRITE;
/*!40000 ALTER TABLE `patient_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_records_2`
--

DROP TABLE IF EXISTS `patient_records_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_records_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) DEFAULT NULL,
  `sheet_name_2` varchar(255) DEFAULT NULL,
  `admission_date_2` date DEFAULT NULL,
  `patient_name_2` varchar(255) DEFAULT NULL,
  `category_2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `patient_records_2_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_records_2`
--

LOCK TABLES `patient_records_2` WRITE;
/*!40000 ALTER TABLE `patient_records_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_records_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_records_3`
--

DROP TABLE IF EXISTS `patient_records_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_records_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `sheet_name_3` varchar(255) NOT NULL,
  `patient_name_3` varchar(255) NOT NULL,
  `date_admitted` date NOT NULL,
  `date_discharge` date NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `patient_records_3_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `uploaded_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_records_3`
--

LOCK TABLES `patient_records_3` WRITE;
/*!40000 ALTER TABLE `patient_records_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_records_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `retention_days` int(11) DEFAULT 30,
  `enable_auto_delete` tinyint(1) DEFAULT 0,
  `max_upload_files` int(11) DEFAULT 5,
  `max_file_size_mb` int(11) DEFAULT 10,
  `allowed_file_extensions` varchar(255) DEFAULT 'xls,xlsx',
  `theme_mode` varchar(20) DEFAULT 'light',
  `font_size` varchar(20) DEFAULT 'medium',
  `layout_spacing` varchar(20) DEFAULT 'comfortable',
  `site_title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `default_role` varchar(50) DEFAULT NULL,
  `smtp_server` varchar(255) DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `audit_logging` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,30,1,100,100,'xls,xlsx','light','medium','comfortable',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_settings`
--

DROP TABLE IF EXISTS `storage_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_mb` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_settings`
--

LOCK TABLES `storage_settings` WRITE;
/*!40000 ALTER TABLE `storage_settings` DISABLE KEYS */;
INSERT INTO `storage_settings` VALUES (1,100);
/*!40000 ALTER TABLE `storage_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_logs`
--

DROP TABLE IF EXISTS `system_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` text NOT NULL,
  `performed_by` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_logs`
--

LOCK TABLES `system_logs` WRITE;
/*!40000 ALTER TABLE `system_logs` DISABLE KEYS */;
INSERT INTO `system_logs` VALUES (1,'Deleted all uploads','admin','2025-05-14 14:59:53'),(2,'Database backup created','admin','2025-05-14 15:00:56'),(3,'System reset','admin','2025-05-14 15:01:49'),(4,'Database backup created','admin','2025-05-14 15:02:52');
/*!40000 ALTER TABLE `system_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) DEFAULT NULL,
  `setting_value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (10,'max_upload_files','15'),(11,'max_file_size_mb','200'),(12,'allowed_file_extensions','xlsx,xls');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_files`
--

DROP TABLE IF EXISTS `uploaded_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_files`
--

LOCK TABLES `uploaded_files` WRITE;
/*!40000 ALTER TABLE `uploaded_files` DISABLE KEYS */;
INSERT INTO `uploaded_files` VALUES (64,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 01:52:11'),(65,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 01:53:09'),(66,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 01:55:32'),(67,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:02:24'),(68,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:05:01'),(69,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:08:07'),(70,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:13:32'),(71,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:17:14'),(72,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:22:08'),(73,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:22:59'),(74,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:27:07'),(75,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:28:05'),(76,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:29:06'),(77,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-06 02:32:35'),(78,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-08 01:53:54'),(79,'EECL-Summary-Form-ver2_1.xlsx','2025-05-08 03:41:43'),(80,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-08 03:41:50'),(81,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-09 06:26:56'),(82,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-09 06:28:00'),(83,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-09 06:57:50'),(84,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-13 01:24:51'),(85,'2025 DISCHARGE_TRANSMITTAL MONITORING  (13).xlsx','2025-05-14 03:40:05');
/*!40000 ALTER TABLE `uploaded_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@gmail.com','test','$2y$10$cnIHSauuGjuiE5wBZIXw9uKkx5w8BYpsNkDM4D/9RyXTrrZaEIZ9i','user'),(3,'admin_mmhr@gmail.com','admin_mmhr','$2y$10$fKGGhz0GR6dEIf6vBDgjBuQNv/yBpe.v5FPpaoZ36uAiNsKXh/Bju','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 15:03:11
