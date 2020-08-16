-- MySQL dump 10.14  Distrib 5.5.65-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dreamfactory
-- ------------------------------------------------------
-- Server version	5.5.65-MariaDB

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
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `path` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `storage_service_id` int(10) unsigned DEFAULT NULL,
  `storage_container` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `requires_fullscreen` tinyint(1) NOT NULL DEFAULT '0',
  `allow_fullscreen_toggle` tinyint(1) NOT NULL DEFAULT '1',
  `toggle_location` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'top',
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_name_unique` (`name`),
  KEY `app_storage_service_id_foreign` (`storage_service_id`),
  KEY `app_role_id_foreign` (`role_id`),
  KEY `app_created_by_id_foreign` (`created_by_id`),
  KEY `app_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `app_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_storage_service_id_foreign` FOREIGN KEY (`storage_service_id`) REFERENCES `service` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (1,'admin','6498a8ad1beb9d84d63035c5d1120c007fad6de706734db9689f8996707e0f7d','An application for administering this instance.',1,3,'dreamfactory/dist/index.html',NULL,NULL,NULL,0,1,'top',NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(2,'api_docs','36fda24fe5588fa4285ac6c6c2fdfbdb6b6bc9834699774c9bf777f706d05a88','A Swagger-base application allowing documentation viewing and testing of the API.',1,3,'df-swagger-ui/dist/index.html',NULL,NULL,NULL,0,1,'top',NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(3,'file_manager','b5cb82af7b5d4130f36149f90aa2746782e59a872ac70454ac188743cb55b0ba','An application for managing file services.',1,3,'filemanager/index.html',NULL,NULL,NULL,0,1,'top',NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(4,'Turismo Usuario','f012acb834b3156092f1b5120e1aafc8b283e4ce81d685c482e540fea7c1b035','Aplicación para usuario Turismo',1,0,NULL,NULL,NULL,NULL,0,1,'top',9,'2020-08-14 09:06:08','2020-08-14 09:06:08',1,NULL),(5,'Turismo Conductor','5c821eb723f2a4c61732dbc0e8eda8b6cda7fd9edb07156eb3a04abbe2908145','App de conductor para Turismo',1,0,NULL,NULL,NULL,NULL,0,1,'top',9,'2020-08-14 09:06:50','2020-08-14 09:06:50',1,NULL),(6,'turismo','d1b18e42b24dc968a640c73bc7b8777384cbe4feaa63b2e839804f3f66a16a90','Turismo',1,0,NULL,NULL,NULL,NULL,0,1,'top',9,'2020-08-14 09:07:16','2020-08-14 09:07:16',1,NULL);
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_group`
--

DROP TABLE IF EXISTS `app_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_group_name_unique` (`name`),
  KEY `app_group_created_by_id_foreign` (`created_by_id`),
  KEY `app_group_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `app_group_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_group_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_group`
--

LOCK TABLES `app_group` WRITE;
/*!40000 ALTER TABLE `app_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_lookup`
--

DROP TABLE IF EXISTS `app_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_lookup_app_id_foreign` (`app_id`),
  KEY `app_lookup_created_by_id_foreign` (`created_by_id`),
  KEY `app_lookup_last_modified_by_id_foreign` (`last_modified_by_id`),
  KEY `app_lookup_name_index` (`name`),
  CONSTRAINT `app_lookup_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_lookup_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE,
  CONSTRAINT `app_lookup_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_lookup`
--

LOCK TABLES `app_lookup` WRITE;
/*!40000 ALTER TABLE `app_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role_map`
--

DROP TABLE IF EXISTS `app_role_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `app_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_role_map_service_id_foreign` (`service_id`),
  KEY `app_role_map_app_id_foreign` (`app_id`),
  KEY `app_role_map_role_id_foreign` (`role_id`),
  CONSTRAINT `app_role_map_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_role_map_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE SET NULL,
  CONSTRAINT `app_role_map_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role_map`
--

LOCK TABLES `app_role_map` WRITE;
/*!40000 ALTER TABLE `app_role_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_role_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_to_app_group`
--

DROP TABLE IF EXISTS `app_to_app_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_to_app_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_to_app_group_app_id_foreign` (`app_id`),
  KEY `app_to_app_group_group_id_foreign` (`group_id`),
  CONSTRAINT `app_to_app_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `app_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `app_to_app_group_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_to_app_group`
--

LOCK TABLES `app_to_app_group` WRITE;
/*!40000 ALTER TABLE `app_to_app_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_to_app_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_config`
--

DROP TABLE IF EXISTS `aws_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_config` (
  `service_id` int(10) unsigned NOT NULL,
  `key` longtext COLLATE utf8_unicode_ci,
  `secret` longtext COLLATE utf8_unicode_ci,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `aws_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_config`
--

LOCK TABLES `aws_config` WRITE;
/*!40000 ALTER TABLE `aws_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `azure_config`
--

DROP TABLE IF EXISTS `azure_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `azure_config` (
  `service_id` int(10) unsigned NOT NULL,
  `account_name` longtext COLLATE utf8_unicode_ci,
  `account_key` longtext COLLATE utf8_unicode_ci,
  `protocol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `azure_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azure_config`
--

LOCK TABLES `azure_config` WRITE;
/*!40000 ALTER TABLE `azure_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `azure_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cassandra_config`
--

DROP TABLE IF EXISTS `cassandra_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cassandra_config` (
  `service_id` int(10) unsigned NOT NULL,
  `hosts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '9042',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` longtext COLLATE utf8_unicode_ci,
  `keyspace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `cassandra_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cassandra_config`
--

LOCK TABLES `cassandra_config` WRITE;
/*!40000 ALTER TABLE `cassandra_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cassandra_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_email_config`
--

DROP TABLE IF EXISTS `cloud_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_email_config` (
  `service_id` int(10) unsigned NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `cloud_email_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_email_config`
--

LOCK TABLES `cloud_email_config` WRITE;
/*!40000 ALTER TABLE `cloud_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cors_config`
--

DROP TABLE IF EXISTS `cors_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cors_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header` text COLLATE utf8_unicode_ci,
  `exposed_header` text COLLATE utf8_unicode_ci,
  `method` int(10) unsigned NOT NULL DEFAULT '0',
  `max_age` int(10) unsigned NOT NULL DEFAULT '0',
  `supports_credentials` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cors_config_path_unique` (`path`),
  KEY `cors_config_created_by_id_foreign` (`created_by_id`),
  KEY `cors_config_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `cors_config_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cors_config_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cors_config`
--

LOCK TABLES `cors_config` WRITE;
/*!40000 ALTER TABLE `cors_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cors_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couchbase_config`
--

DROP TABLE IF EXISTS `couchbase_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couchbase_config` (
  `service_id` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '8091',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `couchbase_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couchbase_config`
--

LOCK TABLES `couchbase_config` WRITE;
/*!40000 ALTER TABLE `couchbase_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `couchbase_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couchdb_config`
--

DROP TABLE IF EXISTS `couchdb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couchdb_config` (
  `service_id` int(10) unsigned NOT NULL,
  `dsn` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `couchdb_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couchdb_config`
--

LOCK TABLES `couchdb_config` WRITE;
/*!40000 ALTER TABLE `couchdb_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `couchdb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_field_extras`
--

DROP TABLE IF EXISTS `db_field_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_field_extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `picklist` text COLLATE utf8_unicode_ci,
  `validation` text COLLATE utf8_unicode_ci,
  `client_info` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_function` text COLLATE utf8_unicode_ci,
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `is_aggregate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `db_field_extras_service_id_foreign` (`service_id`),
  KEY `db_field_extras_created_by_id_foreign` (`created_by_id`),
  KEY `db_field_extras_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `db_field_extras_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_field_extras_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_field_extras_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_field_extras`
--

LOCK TABLES `db_field_extras` WRITE;
/*!40000 ALTER TABLE `db_field_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_field_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_relationship_extras`
--

DROP TABLE IF EXISTS `db_relationship_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_relationship_extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `always_fetch` tinyint(1) NOT NULL DEFAULT '0',
  `flatten` tinyint(1) NOT NULL DEFAULT '0',
  `flatten_drop_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `db_relationship_extras_service_id_foreign` (`service_id`),
  KEY `db_relationship_extras_created_by_id_foreign` (`created_by_id`),
  KEY `db_relationship_extras_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `db_relationship_extras_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_relationship_extras_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_relationship_extras_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_relationship_extras`
--

LOCK TABLES `db_relationship_extras` WRITE;
/*!40000 ALTER TABLE `db_relationship_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_relationship_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_table_extras`
--

DROP TABLE IF EXISTS `db_table_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_table_extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plural` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_field` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `db_table_extras_service_id_foreign` (`service_id`),
  KEY `db_table_extras_created_by_id_foreign` (`created_by_id`),
  KEY `db_table_extras_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `db_table_extras_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_table_extras_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_table_extras_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_table_extras`
--

LOCK TABLES `db_table_extras` WRITE;
/*!40000 ALTER TABLE `db_table_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_table_extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_virtual_relationship`
--

DROP TABLE IF EXISTS `db_virtual_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_virtual_relationship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref_service_id` int(10) unsigned NOT NULL,
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref_on_update` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_on_delete` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `junction_service_id` int(10) unsigned DEFAULT NULL,
  `junction_table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `junction_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `junction_ref_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `db_virtual_relationship_service_id_foreign` (`service_id`),
  KEY `db_virtual_relationship_ref_service_id_foreign` (`ref_service_id`),
  KEY `db_virtual_relationship_junction_service_id_foreign` (`junction_service_id`),
  KEY `db_virtual_relationship_created_by_id_foreign` (`created_by_id`),
  KEY `db_virtual_relationship_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `db_virtual_relationship_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_virtual_relationship_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `db_virtual_relationship_junction_service_id_foreign` FOREIGN KEY (`junction_service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE,
  CONSTRAINT `db_virtual_relationship_ref_service_id_foreign` FOREIGN KEY (`ref_service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE,
  CONSTRAINT `db_virtual_relationship_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_virtual_relationship`
--

LOCK TABLES `db_virtual_relationship` WRITE;
/*!40000 ALTER TABLE `db_virtual_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_virtual_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentdb_config`
--

DROP TABLE IF EXISTS `documentdb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentdb_config` (
  `service_id` int(10) unsigned NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `database` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `documentdb_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentdb_config`
--

LOCK TABLES `documentdb_config` WRITE;
/*!40000 ALTER TABLE `documentdb_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentdb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_parameters_config`
--

DROP TABLE IF EXISTS `email_parameters_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_parameters_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `email_parameters_config_service_id_foreign` (`service_id`),
  CONSTRAINT `email_parameters_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_parameters_config`
--

LOCK TABLES `email_parameters_config` WRITE;
/*!40000 ALTER TABLE `email_parameters_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_parameters_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `subject` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body_text` text COLLATE utf8_unicode_ci,
  `body_html` text COLLATE utf8_unicode_ci,
  `from_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaults` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_template_name_unique` (`name`),
  KEY `email_template_created_by_id_foreign` (`created_by_id`),
  KEY `email_template_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `email_template_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `email_template_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template`
--

LOCK TABLES `email_template` WRITE;
/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES (1,'User Invite Default','Email sent to invite new users to your DreamFactory instance.',NULL,NULL,NULL,'[DF] New User Invitation',NULL,'<div style=\"padding: 10px;\">\n                                <p>\n                                Hi {first_name},\n                                </p>\n                                <p>\n                                    You have been invited to the DreamFactory Instance of {instance_name}. Go to the following url, enter the code below, and set\n                                    your password to confirm your account.\n                                    <br/>\n                                    <br/>\n                                    {link}\n                                    <br/>\n                                    <br/>\n                                    Confirmation Code: {confirm_code}<br/>\n                                </p>\n                                <p>\n                                    <cite>-- The Dream Team</cite>\n                                </p>\n                              </div>','DO NOT REPLY','no-reply@dreamfactory.com',NULL,NULL,NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(2,'User Registration Default','Email sent to new users to complete registration.',NULL,NULL,NULL,'[DF] Registration Confirmation',NULL,'<div style=\"padding: 10px;\">\n                                <p>\n                                    Hi {first_name},\n                                </p>\n                                <p>\n                                    You have registered an user account on the DreamFactory instance of {instance_name}. Go to the following url, enter the\n                                    code below, and set your password to confirm your account.\n                                    <br/>\n                                    <br/>\n                                    {link}\n                                    <br/>\n                                    <br/>\n                                    Confirmation Code: {confirm_code}\n                                    <br/>\n                                </p>\n                                <p>\n                                    <cite>-- The Dream Team</cite>\n                                </p>\n                            </div>','DO NOT REPLY','no-reply@dreamfactory.com',NULL,NULL,NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(3,'Password Reset Default','Email sent to users following a request to reset their password.',NULL,NULL,NULL,'[DF] Password Reset',NULL,'<div style=\"padding: 10px;\">\n                                <p>\n                                    Hi {first_name},\n                                </p>\n                                <p>\n                                    You have requested to reset your password. Go to the following url, enter the code below, and set your new password.\n                                    <br>\n                                    <br>\n                                    {link}\n                                    <br>\n                                    <br>\n                                    Confirmation Code: {confirm_code}\n                                </p>\n                                <p>\n                                    <cite>-- The Dream Team</cite>\n                                </p>\n                            </div>','DO NOT REPLY','no-reply@dreamfactory.com',NULL,NULL,NULL,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL);
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_script`
--

DROP TABLE IF EXISTS `event_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_script` (
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  `allow_event_modification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`),
  KEY `event_script_created_by_id_foreign` (`created_by_id`),
  KEY `event_script_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `event_script_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `event_script_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_script`
--

LOCK TABLES `event_script` WRITE;
/*!40000 ALTER TABLE `event_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_subscriber`
--

DROP TABLE IF EXISTS `event_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_subscriber` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_subscriber_name_unique` (`name`),
  KEY `event_subscriber_created_by_id_foreign` (`created_by_id`),
  KEY `event_subscriber_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `event_subscriber_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `event_subscriber_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_subscriber`
--

LOCK TABLES `event_subscriber` WRITE;
/*!40000 ALTER TABLE `event_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_service_config`
--

DROP TABLE IF EXISTS `file_service_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_service_config` (
  `service_id` int(10) unsigned NOT NULL,
  `public_path` text COLLATE utf8_unicode_ci,
  `container` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `file_service_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_service_config`
--

LOCK TABLES `file_service_config` WRITE;
/*!40000 ALTER TABLE `file_service_config` DISABLE KEYS */;
INSERT INTO `file_service_config` VALUES (4,NULL,'logs');
/*!40000 ALTER TABLE `file_service_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_reserved_at_index` (`queue`,`reserved`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_cache_config`
--

DROP TABLE IF EXISTS `local_cache_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_cache_config` (
  `service_id` int(10) unsigned NOT NULL,
  `store` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_ttl` int(11) NOT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `local_cache_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_cache_config`
--

LOCK TABLES `local_cache_config` WRITE;
/*!40000 ALTER TABLE `local_cache_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `local_cache_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memcached_config`
--

DROP TABLE IF EXISTS `memcached_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memcached_config` (
  `service_id` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '11211',
  `default_ttl` int(11) NOT NULL DEFAULT '300',
  PRIMARY KEY (`service_id`),
  CONSTRAINT `memcached_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memcached_config`
--

LOCK TABLES `memcached_config` WRITE;
/*!40000 ALTER TABLE `memcached_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `memcached_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2015_01_27_190908_create_system_tables',1),('2015_01_27_190909_create_db_extras_tables',1),('2015_01_27_190909_create_email_tables',1),('2015_01_27_190909_create_script_tables',1),('2015_02_03_161456_create_sqldb_tables',1),('2015_02_03_161457_create_couchdb_tables',1),('2015_02_03_161457_create_mongodb_tables',1),('2015_03_10_135522_create_aws_tables',1),('2015_03_10_200756_create_azure_tables',1),('2015_03_11_143913_create_rackspace_tables',1),('2015_03_20_205504_create_remote_web_service_tables',1),('2015_05_02_134911_update_user_table_for_oauth_support',1),('2015_05_21_190727_create_user_config_table',1),('2015_07_10_161839_create_user_custom_table',1),('2015_08_25_202632_db_alias',1),('2015_11_06_155036_db_function',1),('2015_11_10_225902_db_foreign_key',1),('2016_01_21_213101_add_curl_options',1),('2016_03_15_235903_add_username_field_to_user_table',1),('2016_05_11_134231_remove_service_and_script_type',1),('2016_05_17_020359_db_config_add',1),('2016_06_20_195319_event_affects_content',1),('2016_07_11_155716_create_cassandra_config_table',1),('2016_07_25_214132_adding_a_custom_field_for_oauth_config',1),('2016_08_02_153513_create_redis_config_table',1),('2016_08_02_193216_create_local_cache_config',1),('2016_08_04_140705_create_memcached_config_table',1),('2016_08_09_202900_create_jobs_table',1),('2016_08_10_145124_create_failed_jobs_table',1),('2016_08_10_191349_queueable_scripts',1),('2016_08_24_213322_oauth_nullable_role',1),('2016_09_07_154332_create_default_app_role_map_table',1),('2016_09_09_183552_mongodb_dsn_breakout',1),('2016_10_12_175601_upgrade_cors',1),('2016_10_15_001818_db_virtual_relationship',1),('2016_10_25_164338_create_documentdb_config_table',1),('2016_10_25_164752_change_username_password_field_type',1),('2016_11_10_161406_create_couchbase_config_table',1),('2016_11_28_192010_drop_smtp_config_encryption_default',1),('2016_11_28_201938_smtp_auth_optional',1),('2016_12_13_155730_create_service_event_map_table',1),('2016_12_19_183200_db_virtual_field',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mongodb_config`
--

DROP TABLE IF EXISTS `mongodb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mongodb_config` (
  `service_id` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `database` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8_unicode_ci,
  `password` text COLLATE utf8_unicode_ci,
  `dsn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `driver_options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `mongodb_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mongodb_config`
--

LOCK TABLES `mongodb_config` WRITE;
/*!40000 ALTER TABLE `mongodb_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mongodb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_config`
--

DROP TABLE IF EXISTS `oauth_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_config` (
  `service_id` int(10) unsigned NOT NULL,
  `default_role` int(10) unsigned DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` longtext COLLATE utf8_unicode_ci NOT NULL,
  `redirect_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_provider` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`),
  KEY `oauth_config_default_role_foreign` (`default_role`),
  CONSTRAINT `oauth_config_default_role_foreign` FOREIGN KEY (`default_role`) REFERENCES `role` (`id`),
  CONSTRAINT `oauth_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_config`
--

LOCK TABLES `oauth_config` WRITE;
/*!40000 ALTER TABLE `oauth_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_token_map`
--

DROP TABLE IF EXISTS `oauth_token_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_token_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_token_map_user_id_index` (`user_id`),
  KEY `oauth_token_map_service_id_index` (`service_id`),
  CONSTRAINT `oauth_token_map_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_token_map_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_token_map`
--

LOCK TABLES `oauth_token_map` WRITE;
/*!40000 ALTER TABLE `oauth_token_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_token_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rackspace_config`
--

DROP TABLE IF EXISTS `rackspace_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rackspace_config` (
  `service_id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` longtext COLLATE utf8_unicode_ci,
  `tenant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `rackspace_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rackspace_config`
--

LOCK TABLES `rackspace_config` WRITE;
/*!40000 ALTER TABLE `rackspace_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `rackspace_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redis_config`
--

DROP TABLE IF EXISTS `redis_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redis_config` (
  `service_id` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '6379',
  `password` longtext COLLATE utf8_unicode_ci,
  `database_index` int(11) NOT NULL DEFAULT '0',
  `default_ttl` int(11) NOT NULL DEFAULT '300',
  `options` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `redis_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redis_config`
--

LOCK TABLES `redis_config` WRITE;
/*!40000 ALTER TABLE `redis_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `redis_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name_unique` (`name`),
  KEY `role_created_by_id_foreign` (`created_by_id`),
  KEY `role_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `role_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `role_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Prueba',NULL,1,'2020-08-13 20:05:50','2020-08-13 20:05:50',1,NULL),(2,'TURISMO_ADMIN','Administrador de la plataforma Turismo',1,'2020-08-14 09:01:03','2020-08-14 09:01:03',1,NULL),(3,'TURISMO_ADMIN_ENTIDAD','Administrador de Entidad para Turismo',1,'2020-08-14 09:01:41','2020-08-14 09:01:41',1,1),(4,'TURISMO_GERENCIA','Gerencia Turismo',1,'2020-08-14 09:03:37','2020-08-14 09:03:37',1,1),(5,'TURISMO_PROGRAMADOR','Programador de rutas para Turismo',1,'2020-08-14 09:02:37','2020-08-14 09:02:37',1,NULL),(6,'TURISMO_SUPERVISOR','Supervisor de entidad para Turismo',1,'2020-08-14 09:03:26','2020-08-14 09:03:26',1,NULL),(7,'TURISMO_CONDUCTOR','Conductor de Turismo',1,'2020-08-14 09:04:11','2020-08-14 09:04:11',1,NULL),(8,'TURISMO_USUARIO','Usuario de Turismo',1,'2020-08-14 09:04:30','2020-08-14 09:04:30',1,NULL),(9,'TURISMO_ANONIMO','Usuario sin autenticar Turismo',1,'2020-08-14 09:04:52','2020-08-14 09:04:52',1,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_lookup`
--

DROP TABLE IF EXISTS `role_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_lookup_role_id_foreign` (`role_id`),
  KEY `role_lookup_created_by_id_foreign` (`created_by_id`),
  KEY `role_lookup_last_modified_by_id_foreign` (`last_modified_by_id`),
  KEY `role_lookup_name_index` (`name`),
  CONSTRAINT `role_lookup_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `role_lookup_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `role_lookup_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_lookup`
--

LOCK TABLES `role_lookup` WRITE;
/*!40000 ALTER TABLE `role_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_service_access`
--

DROP TABLE IF EXISTS `role_service_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_service_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verb_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `requestor_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `filters` text COLLATE utf8_unicode_ci,
  `filter_op` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'and',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_service_access_role_id_foreign` (`role_id`),
  KEY `role_service_access_service_id_foreign` (`service_id`),
  KEY `role_service_access_created_by_id_foreign` (`created_by_id`),
  KEY `role_service_access_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `role_service_access_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `role_service_access_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `role_service_access_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_service_access_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_service_access`
--

LOCK TABLES `role_service_access` WRITE;
/*!40000 ALTER TABLE `role_service_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_service_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rws_config`
--

DROP TABLE IF EXISTS `rws_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rws_config` (
  `service_id` int(10) unsigned NOT NULL,
  `base_url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `rws_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rws_config`
--

LOCK TABLES `rws_config` WRITE;
/*!40000 ALTER TABLE `rws_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `rws_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rws_headers_config`
--

DROP TABLE IF EXISTS `rws_headers_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rws_headers_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `pass_from_client` tinyint(1) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rws_headers_config_service_id_foreign` (`service_id`),
  CONSTRAINT `rws_headers_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rws_headers_config`
--

LOCK TABLES `rws_headers_config` WRITE;
/*!40000 ALTER TABLE `rws_headers_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `rws_headers_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rws_parameters_config`
--

DROP TABLE IF EXISTS `rws_parameters_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rws_parameters_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  `outbound` tinyint(1) NOT NULL DEFAULT '0',
  `cache_key` tinyint(1) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rws_parameters_config_service_id_foreign` (`service_id`),
  CONSTRAINT `rws_parameters_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rws_parameters_config`
--

LOCK TABLES `rws_parameters_config` WRITE;
/*!40000 ALTER TABLE `rws_parameters_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `rws_parameters_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `script_config`
--

DROP TABLE IF EXISTS `script_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `script_config` (
  `service_id` int(10) unsigned NOT NULL,
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `config` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `script_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `script_config`
--

LOCK TABLES `script_config` WRITE;
/*!40000 ALTER TABLE `script_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `script_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `mutable` tinyint(1) NOT NULL DEFAULT '1',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_name_unique` (`name`),
  KEY `service_created_by_id_foreign` (`created_by_id`),
  KEY `service_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `service_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `service_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'system','System Management','Service for managing system resources.',1,'system',0,0,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(2,'api_docs','Live API Docs','API documenting and testing service.',1,'swagger',0,0,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(3,'files','Local File Storage','Service for accessing local file storage.',1,'local_file',1,1,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(4,'logs','Local Log Storage','Service for accessing local log storage.',1,'local_file',1,1,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(5,'db','Local SQL Database','Service for accessing local SQLite database.',1,'sqlite',1,1,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(6,'email','Local Email Service','Email service used for sending user invites and/or password reset confirmation.',1,'local_email',1,1,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(7,'user','User Management','Service for managing system users.',1,'user',1,0,'2020-08-12 22:02:19','2020-08-12 22:02:19',NULL,NULL),(8,'turismo','turismo','Base de datos Turismo',1,'mysql',1,1,'2020-08-14 19:55:38','2020-08-14 19:55:38',1,1),(10,'neca2','neca2','neca2',1,'mysql',1,1,'2020-08-14 20:16:33','2020-08-14 20:16:33',1,1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_cache_config`
--

DROP TABLE IF EXISTS `service_cache_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_cache_config` (
  `service_id` int(10) unsigned NOT NULL,
  `cache_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `cache_ttl` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`),
  CONSTRAINT `service_cache_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_cache_config`
--

LOCK TABLES `service_cache_config` WRITE;
/*!40000 ALTER TABLE `service_cache_config` DISABLE KEYS */;
INSERT INTO `service_cache_config` VALUES (8,0,0),(10,0,0);
/*!40000 ALTER TABLE `service_cache_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_doc`
--

DROP TABLE IF EXISTS `service_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_doc` (
  `service_id` int(10) unsigned NOT NULL,
  `format` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`service_id`),
  CONSTRAINT `service_doc_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_doc`
--

LOCK TABLES `service_doc` WRITE;
/*!40000 ALTER TABLE `service_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_event_map`
--

DROP TABLE IF EXISTS `service_event_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_event_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `service_event_map_service_id_foreign` (`service_id`),
  CONSTRAINT `service_event_map_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_event_map`
--

LOCK TABLES `service_event_map` WRITE;
/*!40000 ALTER TABLE `service_event_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_event_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smtp_config`
--

DROP TABLE IF EXISTS `smtp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smtp_config` (
  `service_id` int(10) unsigned NOT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '587',
  `encryption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` text COLLATE utf8_unicode_ci,
  `password` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `smtp_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtp_config`
--

LOCK TABLES `smtp_config` WRITE;
/*!40000 ALTER TABLE `smtp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `smtp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_db_config`
--

DROP TABLE IF EXISTS `sql_db_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_db_config` (
  `service_id` int(10) unsigned NOT NULL,
  `connection` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `attributes` text COLLATE utf8_unicode_ci,
  `statements` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `sql_db_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_db_config`
--

LOCK TABLES `sql_db_config` WRITE;
/*!40000 ALTER TABLE `sql_db_config` DISABLE KEYS */;
INSERT INTO `sql_db_config` VALUES (5,'{\"database\":\"db.sqlite\"}',NULL,NULL,NULL),(8,'{\"host\":\"34.66.14.207\",\"port\":3306,\"database\":\"turismo\",\"username\":\"eyJpdiI6InFsZ2dnVXJBb2pqdWNyeDBUUW5veVE9PSIsInZhbHVlIjoiaGt2VW92ZDBSaHJOckh0NjFTNXN3QWtWWFNRSU9ES0hlelhOV0I1YVY0cz0iLCJtYWMiOiI1ODRiMGI4MmVlYjUxM2U3OWVhMmJlZWExODQwZGI3YzcxZDg0NjhiNGU1YmIyYWExM2IzZmIzNjc3ZjgyNmE3In0=\",\"password\":\"eyJpdiI6InZCWUp4cVRoMlBxd0NKek5SOVpzZkE9PSIsInZhbHVlIjoiYWhYY041NnI0Qnk5dytzVk84OGZERWtudTZFWHpVQkZpeFVaMDRhcVlkYz0iLCJtYWMiOiJmOGRkNDQxZGYyMzlhODk2MWIxZWQ4YTNjNDhiYTQ5ZjgyZjFiNmY0MzU1ZDIxMjBmM2Q3YzczYzc5OGU4NjIyIn0=\",\"charset\":\"utf8\",\"collation\":\"utf8_general_ci\",\"schema\":\"turismo\",\"timezone\":null,\"modes\":null,\"strict\":null,\"unix_socket\":null}',NULL,NULL,NULL),(10,'{\"host\":\"ec2-54-151-71-25.us-west-1.compute.amazonaws.com\",\"port\":3306,\"database\":\"dashroute\",\"username\":\"eyJpdiI6IlorN1VPcHhZT2RKTHVxT2dGVkxGcEE9PSIsInZhbHVlIjoib2NIbmk5Nk10NElSOWFcL09iTXVVRUE9PSIsIm1hYyI6ImJkMTc3MDhhYzMzMjkxYTgwMTBkMDk1ODI1MzdjN2QwMzg4ZjZlZWRkYmEyZDVmZTFhMzZiNTY3N2QyY2QzOTEifQ==\",\"password\":\"eyJpdiI6ImxzUGNidVJXMFFmWUhSQlQxcWJBMHc9PSIsInZhbHVlIjoia3BUeXBBekZtcDYxT0psdzlWMkdxTzZXR1Z3VDltMnk0ZnNXakRsa0JRQT0iLCJtYWMiOiJlZDI1NzEzZjgyNzFlZmJkYTk2OTg1M2VhNDI4NDkzZjVjYmQ0YTcyYzg0YWE4NTdkOTdkMzFkM2Y4MDQxZWRhIn0=\",\"schema\":\"dashroute\",\"charset\":null,\"collation\":null,\"timezone\":null,\"modes\":null,\"strict\":null,\"unix_socket\":null}','[]',NULL,NULL);
/*!40000 ALTER TABLE `sql_db_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `db_version` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `login_with_user_name` tinyint(1) NOT NULL DEFAULT '0',
  `default_app_id` int(10) unsigned DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`db_version`),
  KEY `system_config_created_by_id_foreign` (`created_by_id`),
  KEY `system_config_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `system_config_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `system_config_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_custom`
--

DROP TABLE IF EXISTS `system_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_custom` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `system_custom_created_by_id_foreign` (`created_by_id`),
  KEY `system_custom_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `system_custom_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `system_custom_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_custom`
--

LOCK TABLES `system_custom` WRITE;
/*!40000 ALTER TABLE `system_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_lookup`
--

DROP TABLE IF EXISTS `system_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_lookup_name_unique` (`name`),
  KEY `system_lookup_created_by_id_foreign` (`created_by_id`),
  KEY `system_lookup_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `system_lookup_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `system_lookup_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_lookup`
--

LOCK TABLES `system_lookup` WRITE;
/*!40000 ALTER TABLE `system_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_map`
--

DROP TABLE IF EXISTS `token_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_map` (
  `user_id` int(10) unsigned NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `iat` int(10) unsigned NOT NULL,
  `exp` int(10) unsigned NOT NULL,
  KEY `token_map_user_id_foreign` (`user_id`),
  CONSTRAINT `token_map_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_map`
--

LOCK TABLES `token_map` WRITE;
/*!40000 ALTER TABLE `token_map` DISABLE KEYS */;
INSERT INTO `token_map` VALUES (3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMsInVzZXJfaWQiOjMsImVtYWlsIjoic29wb3J0ZUB2YW5hbmEuY29tIiwiZm9yZXZlciI6ZmFsc2UsImlzcyI6Imh0dHA6XC9cLzM1LjIwMi4xMzYuOVwvYXBpXC92Mlwvc3lzdGVtXC9hZG1pblwvc2Vzc2lvbiIsImlhdCI6MTU5NzYxODI5NiwiZXhwIjoxNTk3NjIxODk2LCJuYmYiOjE1OTc2MTgyOTYsImp0aSI6Ijc2YTAxZmI5MjI0MjE3MDRkOWZjNGI0OWMxMjU3M2RjIn0.HpcXDHZhKwbA83H607YCcA12izJiyjtpW97MhOXt5hE',1597618296,1597621896);
/*!40000 ALTER TABLE `token_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci,
  `is_sys_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `security_question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `security_answer` text COLLATE utf8_unicode_ci,
  `confirm_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_app_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`),
  KEY `user_created_by_id_foreign` (`created_by_id`),
  KEY `user_last_modified_by_id_foreign` (`last_modified_by_id`),
  CONSTRAINT `user_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dandraus',NULL,'daniel','andraus','2020-08-14 19:44:01','daniel@vanana.com','$2y$10$GU6mtRJA0FMaUi2QN2yhEOgoTJUZ35AC13ATfQT3ZWliMzZ4hPKzS',1,1,NULL,NULL,NULL,'y',NULL,NULL,NULL,'2020-08-14 19:44:01','2020-08-14 19:44:01',NULL,1),(2,'dandraus',NULL,'Daniel','Andraus',NULL,'dandraus@gmail.com','$2y$10$n3qKtMAk.zmbQnV4B2kO4eKyJoShnM462trtuRnnutrF7R/fu1/7y',0,1,NULL,NULL,NULL,'5T0Q5ULCRLG24D87JD0ZXIXQVIVNI93B',NULL,NULL,NULL,'2020-08-13 20:05:31','2020-08-13 20:05:31',1,NULL),(3,'Soporte Vanana',NULL,'Soporte','Vanana','2020-08-16 22:51:36','soporte@vanana.com','$2y$10$tLSe8NFykxnrKrHblJFsCufLSP9S5H/bCTLs6ivsFRjszDeRsWaKu',1,1,'3015492197',NULL,NULL,'y',NULL,NULL,NULL,'2020-08-16 22:51:36','2020-08-16 22:51:36',1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_config`
--

DROP TABLE IF EXISTS `user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_config` (
  `service_id` int(10) unsigned NOT NULL,
  `allow_open_registration` tinyint(1) NOT NULL DEFAULT '0',
  `open_reg_role_id` int(10) unsigned DEFAULT NULL,
  `open_reg_email_service_id` int(10) unsigned DEFAULT NULL,
  `open_reg_email_template_id` int(10) unsigned DEFAULT NULL,
  `invite_email_service_id` int(10) unsigned DEFAULT NULL,
  `invite_email_template_id` int(10) unsigned DEFAULT NULL,
  `password_email_service_id` int(10) unsigned DEFAULT NULL,
  `password_email_template_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  CONSTRAINT `user_config_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_config`
--

LOCK TABLES `user_config` WRITE;
/*!40000 ALTER TABLE `user_config` DISABLE KEYS */;
INSERT INTO `user_config` VALUES (7,0,NULL,6,2,6,1,6,3);
/*!40000 ALTER TABLE `user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_custom`
--

DROP TABLE IF EXISTS `user_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_custom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_custom_user_id_foreign` (`user_id`),
  CONSTRAINT `user_custom_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_custom`
--

LOCK TABLES `user_custom` WRITE;
/*!40000 ALTER TABLE `user_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lookup`
--

DROP TABLE IF EXISTS `user_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lookup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `last_modified_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_lookup_user_id_foreign` (`user_id`),
  KEY `user_lookup_created_by_id_foreign` (`created_by_id`),
  KEY `user_lookup_last_modified_by_id_foreign` (`last_modified_by_id`),
  KEY `user_lookup_name_index` (`name`),
  CONSTRAINT `user_lookup_last_modified_by_id_foreign` FOREIGN KEY (`last_modified_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_lookup_created_by_id_foreign` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_lookup_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lookup`
--

LOCK TABLES `user_lookup` WRITE;
/*!40000 ALTER TABLE `user_lookup` DISABLE KEYS */;
INSERT INTO `user_lookup` VALUES (1,1,'Llave','eyJpdiI6ImRzaG1meHk5dGF5OHRNV2RsRTBSUnc9PSIsInZhbHVlIjoiaDVlNkc2Q05LTkFhNXE2TGNjb3RmQT09IiwibWFjIjoiMjIzNjBhODNhN2YzYjcxYTY5ZGNkNzE5YTYwODA4ZTViYzM0MGMzZjg2NTJlMDE5ZjZmN2M5OTQyMWI4YTU1YyJ9',1,NULL,'2020-08-13 20:04:46','2020-08-13 20:04:46',NULL,NULL);
/*!40000 ALTER TABLE `user_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_app_to_role`
--

DROP TABLE IF EXISTS `user_to_app_to_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_app_to_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `app_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_to_app_to_role_user_id_foreign` (`user_id`),
  KEY `user_to_app_to_role_app_id_foreign` (`app_id`),
  KEY `user_to_app_to_role_role_id_foreign` (`role_id`),
  CONSTRAINT `user_to_app_to_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_to_app_to_role_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_to_app_to_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_app_to_role`
--

LOCK TABLES `user_to_app_to_role` WRITE;
/*!40000 ALTER TABLE `user_to_app_to_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_to_app_to_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-16 23:17:46
