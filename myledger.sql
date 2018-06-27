-- MySQL dump 10.13  Distrib 5.7.22, for osx10.13 (x86_64)
--
-- Host: localhost    Database: myledger
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `api_account`
--

DROP TABLE IF EXISTS `api_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `accounttype_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_account_user_id_67bf2e58_fk_auth_user_id` (`user_id`),
  KEY `api_account_accounttype_id_950b0e7d_fk_api_accounttype_id` (`accounttype_id`),
  CONSTRAINT `api_account_accounttype_id_950b0e7d_fk_api_accounttype_id` FOREIGN KEY (`accounttype_id`) REFERENCES `api_accounttype` (`id`),
  CONSTRAINT `api_account_user_id_67bf2e58_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_account`
--

LOCK TABLES `api_account` WRITE;
/*!40000 ALTER TABLE `api_account` DISABLE KEYS */;
INSERT INTO `api_account` VALUES (1,'Salary month 1 for Django project',8000.00,'2018-06-27 07:53:17.957196','2018-06-27 07:53:17.957230',NULL,2,2),(2,'Clothes from Myer',435.78,'2018-06-27 07:54:13.679886','2018-06-27 07:54:13.679917',NULL,1,2),(3,'New tires',284.00,'2018-06-27 07:55:02.688926','2018-06-27 07:55:02.688959',NULL,3,2);
/*!40000 ALTER TABLE `api_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_accounttype`
--

DROP TABLE IF EXISTS `api_accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_accounttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_accounttype_user_id_0d241355_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_accounttype_user_id_0d241355_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_accounttype`
--

LOCK TABLES `api_accounttype` WRITE;
/*!40000 ALTER TABLE `api_accounttype` DISABLE KEYS */;
INSERT INTO `api_accounttype` VALUES (1,'Shopping',2,'2018-06-27 07:51:41.410555','2018-06-27 07:51:41.410589',NULL,2),(2,'Salary',1,'2018-06-27 07:51:58.304233','2018-06-27 07:51:58.304263',NULL,2),(3,'Car repair',2,'2018-06-27 07:52:16.033527','2018-06-27 07:52:16.033554',NULL,2);
/*!40000 ALTER TABLE `api_accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add account',7,'add_account'),(20,'Can change account',7,'change_account'),(21,'Can delete account',7,'delete_account'),(22,'Can add accounttype',8,'add_accounttype'),(23,'Can change accounttype',8,'change_accounttype'),(24,'Can delete accounttype',8,'delete_accounttype'),(25,'Can add Token',9,'add_token'),(26,'Can change Token',9,'change_token'),(27,'Can delete Token',9,'delete_token'),(28,'Can add user profile',10,'add_userprofile'),(29,'Can change user profile',10,'change_userprofile'),(30,'Can delete user profile',10,'delete_userprofile'),(31,'Can add social user',11,'add_socialuser'),(32,'Can change social user',11,'change_socialuser'),(33,'Can delete social user',11,'delete_socialuser'),(34,'Can add phone user',12,'add_phoneuser'),(35,'Can change phone user',12,'change_phoneuser'),(36,'Can delete phone user',12,'delete_phoneuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$DyUovE8TwwkT$bHhNgBC8/2J/oupHPF+DPIS1eQTzlBXSrvmzkbD2MLo=','2018-06-27 04:52:32.452831',1,'admin','','','moinku07@gmail.com',1,1,'2018-06-27 02:48:28.857895'),(2,'pbkdf2_sha256$100000$koXL2ILQ1LwU$iFWD0+4zaNIB27xg8usGpzzgSwii8hT1nDRYzlDcbOk=','2018-06-27 04:53:25.000000',0,'testuser','Test','User','test@user.com',1,1,'2018-06-27 04:45:49.000000'),(7,'pbkdf2_sha256$100000$VCFKwKDqNt15$IlKxZsl4JzmAk8F7hiOO488Y9uv2dpR303SsTLdu6vc=',NULL,0,'facebook_1560790550651507','Test','User3','test3@user.com',0,1,'2018-06-27 11:58:48.866742'),(8,'pbkdf2_sha256$100000$woJ6bdtuFihc$JGovLNNKSgD95rxz5Q1EZuDOyMshOdro35d4skFcO08=',NULL,0,'testuser2','Test','User 2','test2@user.com',0,1,'2018-06-27 12:01:49.248133');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (16,2,1),(17,2,2),(18,2,3),(12,2,15),(13,2,16),(14,2,17),(15,2,18),(4,2,19),(5,2,20),(6,2,21),(7,2,22),(8,2,23),(9,2,24);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('3abbe54f28a4c555b93f20410520f2cf063c6af5','2018-06-27 11:58:51.999244',7),('6d7cbab4698a87f46ee4bcad63c2776a4e9e4667','2018-06-27 08:50:17.126370',2),('bf5b04da5b8c19db3440bb6c05cff714516e9362','2018-06-27 12:01:49.340123',8);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-27 04:45:49.614737','2','testuser',1,'[{\"added\": {}}]',4,1),(2,'2018-06-27 04:46:40.567360','2','testuser',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"user_permissions\"]}}]',4,1),(3,'2018-06-27 04:47:59.116466','2','testuser',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),(4,'2018-06-27 04:48:48.788848','2','testuser',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(5,'2018-06-27 04:53:08.017416','2','testuser',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"user_permissions\"]}}]',4,1),(6,'2018-06-27 04:54:05.652608','2','testuser',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),(7,'2018-06-27 06:07:39.453757','917e261100bdd090756d49e3026d38048b0cef1c','917e261100bdd090756d49e3026d38048b0cef1c',1,'[{\"added\": {}}]',9,1),(8,'2018-06-27 06:07:51.094247','917e261100bdd090756d49e3026d38048b0cef1c','917e261100bdd090756d49e3026d38048b0cef1c',3,'',9,1),(9,'2018-06-27 08:50:17.126871','6d7cbab4698a87f46ee4bcad63c2776a4e9e4667','6d7cbab4698a87f46ee4bcad63c2776a4e9e4667',1,'[{\"added\": {}}]',9,1),(10,'2018-06-27 11:22:12.725122','1','testuser - 0469893062',1,'[{\"added\": {}}]',12,1),(11,'2018-06-27 11:22:48.422223','1','testuser2 - 3',2,'[{\"changed\": {\"fields\": [\"profile_photo\"]}}]',10,1),(12,'2018-06-27 11:22:54.545643','1','testuser2 - 3',2,'[{\"changed\": {\"fields\": [\"gender\"]}}]',10,1),(13,'2018-06-27 11:27:04.352697','2','testuser',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',4,1),(14,'2018-06-27 11:48:12.311426','4','N/A',3,'',4,1),(15,'2018-06-27 11:56:02.361956','5','N/A',3,'',4,1),(16,'2018-06-27 11:58:45.058018','6','N/A',3,'',4,1),(17,'2018-06-27 12:00:18.909825','1','testuser - 2',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',10,1),(18,'2018-06-27 12:00:32.637327','3','testuser2',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','account'),(8,'api','accounttype'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'authtoken','token'),(5,'contenttypes','contenttype'),(12,'drf_auth','phoneuser'),(11,'drf_auth','socialuser'),(10,'drf_auth','userprofile'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-27 02:43:31.512742'),(2,'auth','0001_initial','2018-06-27 02:43:31.826103'),(3,'admin','0001_initial','2018-06-27 02:43:31.894624'),(4,'admin','0002_logentry_remove_auto_add','2018-06-27 02:43:31.905071'),(5,'contenttypes','0002_remove_content_type_name','2018-06-27 02:43:31.970788'),(6,'auth','0002_alter_permission_name_max_length','2018-06-27 02:43:31.995622'),(7,'auth','0003_alter_user_email_max_length','2018-06-27 02:43:32.023179'),(8,'auth','0004_alter_user_username_opts','2018-06-27 02:43:32.033506'),(9,'auth','0005_alter_user_last_login_null','2018-06-27 02:43:32.059350'),(10,'auth','0006_require_contenttypes_0002','2018-06-27 02:43:32.061352'),(11,'auth','0007_alter_validators_add_error_messages','2018-06-27 02:43:32.069674'),(12,'auth','0008_alter_user_username_max_length','2018-06-27 02:43:32.101292'),(13,'auth','0009_alter_user_last_name_max_length','2018-06-27 02:43:32.128981'),(14,'sessions','0001_initial','2018-06-27 02:43:32.159830'),(15,'api','0001_initial','2018-06-27 04:39:29.793954'),(16,'api','0002_auto_20180627_0444','2018-06-27 04:44:58.341925'),(17,'api','0003_auto_20180627_0527','2018-06-27 05:27:44.339547'),(18,'authtoken','0001_initial','2018-06-27 06:03:10.125515'),(19,'authtoken','0002_auto_20160226_1747','2018-06-27 06:03:10.192144'),(20,'api','0004_auto_20180627_0630','2018-06-27 06:30:58.390778'),(21,'api','0005_auto_20180627_0630','2018-06-27 06:30:58.444620'),(22,'api','0006_auto_20180627_0630','2018-06-27 06:30:58.504506'),(23,'api','0007_auto_20180627_0633','2018-06-27 06:33:28.210696'),(24,'drf_auth','0001_initial','2018-06-27 06:33:28.361525');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('okcyrwtubvs9z7aasdzur4ob7f39yikv','N2ZkODRmN2NiNzU0NzZiNzY2NDM0NGNjODVkNDkxNzQzZDBhZmQ5MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MTAzYjZiM2MwOGYxOTY0NDIxZGY1ZmI4MGUxNzkwNzg4ZjU4ZTVhIn0=','2018-07-11 04:52:32.454651');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_phoneuser`
--

DROP TABLE IF EXISTS `drf_auth_phoneuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_phoneuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `drf_auth_phoneuser_user_id_77742d89_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_phoneuser_user_id_77742d89_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_phoneuser`
--

LOCK TABLES `drf_auth_phoneuser` WRITE;
/*!40000 ALTER TABLE `drf_auth_phoneuser` DISABLE KEYS */;
INSERT INTO `drf_auth_phoneuser` VALUES (1,'0469893062',2);
/*!40000 ALTER TABLE `drf_auth_phoneuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_socialuser`
--

DROP TABLE IF EXISTS `drf_auth_socialuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_socialuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network` varchar(30) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `token` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drf_auth_socialuser_user_id_84eb61f4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_socialuser_user_id_84eb61f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_socialuser`
--

LOCK TABLES `drf_auth_socialuser` WRITE;
/*!40000 ALTER TABLE `drf_auth_socialuser` DISABLE KEYS */;
INSERT INTO `drf_auth_socialuser` VALUES (4,'facebook','1560790550651507','EAAcCYkG4048BAGxqTjg1TP6PXcTZCakFFUS1SnouHUaZBlawuCS3EPTogkhTEMWHtacf17KMs2gbiPoRZAqkRoXZBC4VTq6LNstZBZCSQZBDRZCmhd1YZCmtPdQI0alQPIZCqguQqBIMvpD7GM79cQpm0o6jNlpZCUPSunMuYgkOzDEKGgWbzBfpsGMqxucCdHiflHBrCUTZACBEMaorMIGaLehJRNgUAcPCk1MUOXeOvDvI7AZDZD',7);
/*!40000 ALTER TABLE `drf_auth_socialuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drf_auth_userprofile`
--

DROP TABLE IF EXISTS `drf_auth_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drf_auth_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_photo` varchar(100) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drf_auth_userprofile_user_id_84655080_fk_auth_user_id` (`user_id`),
  CONSTRAINT `drf_auth_userprofile_user_id_84655080_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drf_auth_userprofile`
--

LOCK TABLES `drf_auth_userprofile` WRITE;
/*!40000 ALTER TABLE `drf_auth_userprofile` DISABLE KEYS */;
INSERT INTO `drf_auth_userprofile` VALUES (1,'users/profile-photos/tshirt.png','M',0,2),(5,'users/profile-photos/asid1560790550651507height200width200ext1530359929hashAeSN3hH3LaaHAKWZ.jpg',NULL,0,7),(6,'',NULL,0,8);
/*!40000 ALTER TABLE `drf_auth_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-27 23:43:07
