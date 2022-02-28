-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: nasa
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_extends'),(22,'Can change user',6,'change_extends'),(23,'Can delete user',6,'delete_extends'),(24,'Can view user',6,'view_extends'),(25,'Can add association',7,'add_association'),(26,'Can change association',7,'change_association'),(27,'Can delete association',7,'delete_association'),(28,'Can view association',7,'view_association'),(29,'Can add code',8,'add_code'),(30,'Can change code',8,'change_code'),(31,'Can delete code',8,'delete_code'),(32,'Can view code',8,'view_code'),(33,'Can add nonce',9,'add_nonce'),(34,'Can change nonce',9,'change_nonce'),(35,'Can delete nonce',9,'delete_nonce'),(36,'Can view nonce',9,'view_nonce'),(37,'Can add user social auth',10,'add_usersocialauth'),(38,'Can change user social auth',10,'change_usersocialauth'),(39,'Can delete user social auth',10,'delete_usersocialauth'),(40,'Can view user social auth',10,'view_usersocialauth'),(41,'Can add partial',11,'add_partial'),(42,'Can change partial',11,'change_partial'),(43,'Can delete partial',11,'delete_partial'),(44,'Can view partial',11,'view_partial'),(45,'Can add theatres',12,'add_theatres'),(46,'Can change theatres',12,'change_theatres'),(47,'Can delete theatres',12,'delete_theatres'),(48,'Can view theatres',12,'view_theatres'),(49,'Can add screens',13,'add_screens'),(50,'Can change screens',13,'change_screens'),(51,'Can delete screens',13,'delete_screens'),(52,'Can view screens',13,'view_screens'),(53,'Can add movies',14,'add_movies'),(54,'Can change movies',14,'change_movies'),(55,'Can delete movies',14,'delete_movies'),(56,'Can view movies',14,'view_movies'),(57,'Can add shows',15,'add_shows'),(58,'Can change shows',15,'change_shows'),(59,'Can delete shows',15,'delete_shows'),(60,'Can view shows',15,'view_shows'),(61,'Can add booked_seats',16,'add_booked_seats'),(62,'Can change booked_seats',16,'change_booked_seats'),(63,'Can delete booked_seats',16,'delete_booked_seats'),(64,'Can view booked_seats',16,'view_booked_seats'),(65,'Can add tickets',17,'add_tickets'),(66,'Can change tickets',17,'change_tickets'),(67,'Can delete tickets',17,'delete_tickets'),(68,'Can view tickets',17,'view_tickets'),(69,'Can add promocodes',18,'add_promocodes'),(70,'Can change promocodes',18,'change_promocodes'),(71,'Can delete promocodes',18,'delete_promocodes'),(72,'Can view promocodes',18,'view_promocodes'),(73,'Can add used_codes',19,'add_used_codes'),(74,'Can change used_codes',19,'change_used_codes'),(75,'Can delete used_codes',19,'delete_used_codes'),(76,'Can view used_codes',19,'view_used_codes');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_userlogin_extends_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_userlogin_extends_id` FOREIGN KEY (`user_id`) REFERENCES `userlogin_extends` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(7,'social_django','association'),(8,'social_django','code'),(9,'social_django','nonce'),(11,'social_django','partial'),(10,'social_django','usersocialauth'),(16,'theatreArea','booked_seats'),(14,'theatreArea','movies'),(18,'theatreArea','promocodes'),(13,'theatreArea','screens'),(15,'theatreArea','shows'),(12,'theatreArea','theatres'),(17,'theatreArea','tickets'),(19,'theatreArea','used_codes'),(6,'userlogin','extends');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-01-09 16:06:53.671590'),(2,'contenttypes','0002_remove_content_type_name','2022-01-09 16:06:53.741720'),(3,'auth','0001_initial','2022-01-09 16:06:54.162802'),(4,'auth','0002_alter_permission_name_max_length','2022-01-09 16:06:54.245198'),(5,'auth','0003_alter_user_email_max_length','2022-01-09 16:06:54.258985'),(6,'auth','0004_alter_user_username_opts','2022-01-09 16:06:54.266749'),(7,'auth','0005_alter_user_last_login_null','2022-01-09 16:06:54.273749'),(8,'auth','0006_require_contenttypes_0002','2022-01-09 16:06:54.278020'),(9,'auth','0007_alter_validators_add_error_messages','2022-01-09 16:06:54.284913'),(10,'auth','0008_alter_user_username_max_length','2022-01-09 16:06:54.291737'),(11,'auth','0009_alter_user_last_name_max_length','2022-01-09 16:06:54.301385'),(12,'auth','0010_alter_group_name_max_length','2022-01-09 16:06:54.316783'),(13,'auth','0011_update_proxy_permissions','2022-01-09 16:06:54.324074'),(14,'auth','0012_alter_user_first_name_max_length','2022-01-09 16:06:54.332160'),(15,'userlogin','0001_initial','2022-01-09 16:06:54.702958'),(16,'admin','0001_initial','2022-01-09 16:06:54.860841'),(17,'admin','0002_logentry_remove_auto_add','2022-01-09 16:06:54.873635'),(18,'admin','0003_logentry_add_action_flag_choices','2022-01-09 16:06:54.883009'),(19,'sessions','0001_initial','2022-01-09 16:06:54.927937'),(20,'userlogin','0002_alter_extends_phonenum','2022-01-10 04:15:32.488803'),(21,'default','0001_initial','2022-01-15 13:11:11.418603'),(22,'social_auth','0001_initial','2022-01-15 13:11:11.421605'),(23,'default','0002_add_related_name','2022-01-15 13:11:11.431088'),(24,'social_auth','0002_add_related_name','2022-01-15 13:11:11.435921'),(25,'default','0003_alter_email_max_length','2022-01-15 13:11:11.449671'),(26,'social_auth','0003_alter_email_max_length','2022-01-15 13:11:11.454460'),(27,'default','0004_auto_20160423_0400','2022-01-15 13:11:11.461994'),(28,'social_auth','0004_auto_20160423_0400','2022-01-15 13:11:11.466479'),(29,'social_auth','0005_auto_20160727_2333','2022-01-15 13:11:11.488467'),(30,'social_django','0006_partial','2022-01-15 13:11:11.536737'),(31,'social_django','0007_code_timestamp','2022-01-15 13:11:11.588347'),(32,'social_django','0008_partial_timestamp','2022-01-15 13:11:11.654533'),(33,'social_django','0009_auto_20191118_0520','2022-01-15 13:11:11.762218'),(34,'social_django','0010_uid_db_index','2022-01-15 13:11:11.801776'),(35,'social_django','0001_initial','2022-01-15 13:11:11.807636'),(36,'social_django','0003_alter_email_max_length','2022-01-15 13:11:11.811455'),(37,'social_django','0005_auto_20160727_2333','2022-01-15 13:11:11.815941'),(38,'social_django','0004_auto_20160423_0400','2022-01-15 13:11:11.821302'),(39,'social_django','0002_add_related_name','2022-01-15 13:11:11.824405'),(40,'theatreArea','0001_initial','2022-01-18 08:30:58.979195'),(41,'userlogin','0003_alter_extends_phonenum','2022-01-18 08:30:59.019920'),(42,'theatreArea','0002_theatres_password','2022-01-18 08:52:20.578174'),(43,'theatreArea','0003_alter_theatres_password','2022-01-18 08:52:20.642536'),(44,'theatreArea','0004_alter_theatres_email_alter_theatres_password_and_more','2022-01-18 11:29:22.344998'),(45,'theatreArea','0005_theatres_toid','2022-01-18 11:38:10.178612'),(46,'theatreArea','0006_remove_theatres_toid','2022-01-18 11:43:16.628827'),(47,'theatreArea','0007_theatres_username','2022-01-18 11:45:07.121732'),(48,'theatreArea','0008_movies_screens','2022-01-19 09:28:48.097551'),(49,'theatreArea','0009_remove_screens_movie_alter_screens_show_1_and_more','2022-01-21 05:18:33.039273'),(50,'theatreArea','0010_rename_movie_1_shows_movie_rename_show_1_shows_show_and_more','2022-01-21 05:27:23.544878'),(51,'theatreArea','0011_remove_screens_g_no_remove_screens_s_no_and_more','2022-01-21 09:26:50.602135'),(52,'theatreArea','0012_rename_theatre_id_screens_theatre','2022-01-21 09:29:26.344201'),(53,'theatreArea','0013_remove_screens_show_1_remove_screens_show_2_and_more','2022-01-21 11:16:17.300129'),(54,'theatreArea','0014_rename_screen_id_shows_screen_and_more','2022-01-21 20:57:41.479109'),(55,'theatreArea','0015_rename_movie_shows_movie_id_and_more','2022-01-21 21:04:53.117752'),(56,'theatreArea','0016_rename_movie_id_shows_movie_and_more','2022-01-21 21:05:59.092738'),(57,'theatreArea','0017_alter_shows_theatre','2022-01-21 21:09:07.661392'),(58,'theatreArea','0018_movies_tmdb','2022-02-02 12:22:19.254684'),(59,'theatreArea','0019_booked_seats','2022-02-10 13:21:08.434005'),(60,'theatreArea','0020_rename_seat_booked_seats_seat_no','2022-02-10 13:45:01.089520'),(61,'theatreArea','0021_remove_booked_seats_screen_and_more','2022-02-13 12:56:09.501541'),(62,'theatreArea','0022_booked_seats_time','2022-02-15 05:51:28.664855'),(63,'theatreArea','0023_booked_seats_g_user_alter_booked_seats_user','2022-02-15 06:10:54.785568'),(64,'theatreArea','0024_alter_booked_seats_g_user','2022-02-15 06:11:41.427582'),(65,'theatreArea','0025_booked_seats_seat_category','2022-02-15 07:25:44.647610'),(66,'theatreArea','0026_shows_exp_date','2022-02-17 05:38:15.122538'),(67,'theatreArea','0027_alter_shows_exp_date','2022-02-17 05:38:31.384019'),(68,'userlogin','0004_alter_extends_phonenum','2022-02-17 07:47:56.316978'),(69,'theatreArea','0002_alter_shows_exp_date','2022-02-17 14:11:08.529798'),(70,'theatreArea','0003_theatres_location_url','2022-02-20 05:21:34.688407'),(71,'theatreArea','0004_tickets','2022-02-21 17:26:08.663142'),(72,'theatreArea','0005_alter_tickets_ticket_uid_alter_tickets_user','2022-02-21 17:26:09.429917'),(73,'theatreArea','0006_alter_tickets_ticket_uid','2022-02-21 17:38:03.199228'),(74,'theatreArea','0007_alter_tickets_ticket_uid','2022-02-21 18:22:42.889444'),(75,'theatreArea','0002_booked_seats_ticket','2022-02-21 19:05:02.503249'),(76,'theatreArea','0003_promocodes','2022-02-22 10:56:52.891611'),(77,'theatreArea','0004_used_codes','2022-02-22 16:02:25.938549'),(78,'theatreArea','0002_alter_tickets_date','2022-02-24 15:08:35.843863'),(79,'theatreArea','0002_tickets_total_price','2022-02-24 15:50:30.006959'),(80,'theatreArea','0002_tickets_date','2022-02-24 16:16:51.508555'),(81,'theatreArea','0003_alter_tickets_date','2022-02-24 16:17:33.830305');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('05m128augeawc30im8rnoz53aa3f0b1y','.eJxVkMsKwjAQRf8lay11mjSJOxEquBFdiZuQppM-jEaaFiniv2vVhV0N3OGcO8yDlN6XDude910FKnS6Q7Ikt6bpe9jnw-HikuzYNOsTz9g2oL1vyuOQkRlRI6H6gK2qizcCdBrm2pzxOm6CN7V2yvgWo18aom9vtPmM3Wpsn_KVDtWoZUWSMuCJ1dwKmiOlyK1GJoEu0FoZp6kwiJDIFKhgBWUgYiliYwsOQr6lv_6P2unQKefL-vp34OQH5PkCePpdCg:1nGK9W:Q-mTbjepZsgZCB2itBsUzZVUE31rv4NqL7isHdULihU','2022-02-19 12:26:54.663862'),('36otz5p0r3bio665pkkr1qbw7nt218wc','eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiSlZJNFk3eW9ubVhoZkxlR1o1TEFqR09Nc0lDa0x2am0ifQ:1nGKdD:0UEo4Xvm1dfPyYdJhBMeUFs3NcY5RC0RKJURuWnOgOs','2022-02-19 12:57:35.326986'),('3jvy3t1xh633jc8fgpzym1xdqzussrim','.eJxVkDFvgzAQhf8LcxPBOWDTLYqUtkPVZunQxTpsAw4mTrGhIVX_ew3JUG456Xt6753uJzJWRI9RY73HEdvoIeqd6rir7TeX6FXQIAZYxbCCNKitHfQE2YZQyAOo-Gxo1BgoOQ4j8cmlzgg5ClZW5-vYJhf5de2d6_QUX1lbGbWy2PsauPO3jjO1znxuXw-Des4Ytof9y54wOez6d__RFIdg5JPjVqbldBZbwgJFo06T4qzQaLiwnVrfqVvfetdP83rbTu1Lf42uDuZChqEslTljiUIBhGZZCmwjVJFRRhDiJMGcpUSWBaWQARYlUoYx5rSEOITe--dog85zYyt9-nfg4gf3lwdstK_1ScTR7x_6Boa9:1nLs8r:HdCRchOuyYlP1NDj3BcfLBb0RQ3-4-JLVsfuxs4Z6CU','2022-03-06 19:45:09.771975'),('503h10m7dqdg06fj12wfzt8nlzi8l75v','eyJsb2MiOiJrYW5udXIifQ:1nMrdO:4YgnBJrnNw7i3b00kmo8C-AeA9_0wY6v8-pHGDALtEI','2022-03-09 13:24:46.455494'),('9bei0swywu8j321n1g45vuqginvuqmq8','.eJwdzMEKhSAQheF3mXWBTUXWy4iVmJVJV00kevemuznwf4tzQ_TqJ_zikphlUDAAMsSSYYktFGDdZT7kTd1hT7C7iXJzIcgsLYEW_4dNZfJ-VIb5lFPka43VUemmveKpzUFrTw7PC7xKJBs:1nLqE3:bSCWw9pXV-Gd51JG-pVS-CV7gno0d4swtBb2L1_ZjpU','2022-03-06 17:42:23.914803'),('aai3tgp8eos4nj8tsk68ayn7vyea3lga','.eJxVkMFOhDAQht-Fs2zKsNDijU2MidFsookmXpqhFIoU6tKyKxrf3XZ3DzKXSb7OP9-kP5FTEt0kuVXmxGt0MrqNgADEBOKERjeRNsKj3jiHCw4eDObYhSm2TSkUHrR8tnLivVw8HQ4fLsmwyUXWVOPnF0xMLid1OAwtHCXdhnljWi1jg7NTwK27SN_n1_JpIncPtE-eqdo3S_74vRvGl_FtV5d77YM8JC6yrg53sjWsUPRyDC_WiA41F2aSmyu1m4t3c39u-zLY13mFVvlwVfuiLKsLxhKJAlKa5xmwrZBVTlmKQJIEC5aldVNRCjlg1SBlSLCgDRC_9Oo_r9ZoHdem7cZ_B67-wAeC32PdOdWNgkS_f_bBhyw:1nKuU4:RqJJXf9NVhfu_B7W_49MRHWFY64O9ugha9G28rIXPKc','2022-03-04 04:03:04.687836'),('ayfukju1tbf6zlh2dypyy6djln3x5qnu','.eJxVkLFuwyAURf-Fubbwsw24W6YOVVWpHSJ1Qc8YG2pspEAapVX_vZB4qFmQDjr3ovtDJu8npwuP52hAhohRk0eC-uP7yNz7C8DEx0_xFufnK7aMBXo5HJeZPBCZDXkO-iTtkBQQe9ijmvWaX4JXFp1U_qTLjYby3ls-3a7XQ27f-waDSXI_pMNFO3RCVBoV1JyxFkSjdM-4qBFoVWEn2noYe86BAfYjcoEUOz4CTaFb_y3aYYjS-cmu_z642yAJuT9hZ6Oxq8oRzqsEZh8jXnFJYPFfNg_FRcMavjkyGH-Rw31CoAAFhaIS5PcP53N1YA:1nKxhM:H4FoFSwpuQIGWXouf3s3oKIBp5YxIJqNG0FUjeIziC4','2022-03-04 07:29:00.728616'),('d2pp9lx0v8co5frkl0ygvudvsmkp0ibp','eyJ0aGVhdHJlIjoiYTEifQ:1nJUyF:TNCnYyCr8E3b59_uGaBRY4dl2bVOylW8Q5BYeT08QZM','2022-02-28 06:36:23.396653'),('d5k5me4c7r05s0c616fz9otwfa90ezce','.eJxVkE9vwjAMxb9LzwOlKfm3G2ISBySYdpjEKXITl1YNeGsCCKZ996XAYfhi6ff8_Cz_FIFc8Vr0lBJcYF-8FMeIg40tna2HhFnjjPMJ4xMusrqnUzdCPasUNxns7M3Q4yVTL3qxx5lTAxOROVnK5moonRswDK8Ox3miXcAJwTG13MZ0z1iHN3NcnfVi-7mQ70vcoPz-IrP-WKz89jRQNtrRcQ_r_HiWfoY1uB4PoxLJdRCsowGnDxqn99zp8tY28zH92d9CbLO59rmUFt5oXSI4XikpBdczh7VUugLOyhKMFpVvaqW45FA3oDQwMKrhLC995N9WB4jJBtp1h38HPv3g8fKMQ5fa7uBY8fsH_duFFw:1nLpgY:auFq_jSCsA3MN5ZlwumVFHvZNPcUuQpc55pI_5Ymavo','2022-03-06 17:07:46.907989'),('eu1ywrm14jny02a4b5ois493tmfztg7c','eyJ1c2VyIjoibGl0aGluIn0:1nGFWa:3dBsxLOOjFxxF4Y9lD1en3q6yhCmiNaH78-itE-xeTo','2022-02-19 07:30:24.665499'),('f2760bg41u7c1hfbtdyd5t4d00u9m18d','.eJxVkEtPwzAQhP9LzjRyNg873BCCXgo9ICHKxVo_YkdxYyl2QC3iv-OkPdC9rPSNZma1P5nzMrvPBgw4Ga-yu2wOeuLB-m-uMOqkAQHYENhAndSj_-oXyKqSQpuA4ath0KdEO6ANEaYqZioL24moTqqOlSJkbo8FW-KN98bpjcc5WuAhXjq658_D07izu-H14Bg5q8f91lhdn99flHiLH8nIF8elrFfLWewWCpSDHhcleNmj49JPOr_SkF968-269g9L-63fYrDJLFQaymrVMlZolFDSpqmBVVKLhrISgRQFtqwuVScohQZQdEgZEmxpBySFXvvXaIchcudNP_478OYH15cn7Ppo-1GS7PcPg9eExQ:1nN8B2:M5-SJmnUjas-MNRAd-JhM-lYXJ6lAIJ5r40bKE2B-JA','2022-03-10 07:04:36.748561'),('fakicnwpjfkir2aubzmnxlooejs544dt','eyJsb2dpbl9ndWVzdF9zaG93X2lkIjoiNTAifQ:1nJIaq:rvDdxnyp9nROawhPGKt0JFZlKUlDnCBD1rWb-eBUS3E','2022-02-27 17:23:24.980982'),('fpdqobqynf5s7tncbpxtefa1vok42lku','eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiNFlaV0NuSmNiQlJkcjhRZ2hXREUyR1hGZGp3bzJyTWcifQ:1nGJiJ:0__u0O-pqQ7btRYN85adwb77eWITjlMhGdhnsMw9W1w','2022-02-19 11:58:47.252364'),('jtmkweey91uya9u87qlgvtthkj9c0qkl','eyJ1c2VyIjoibGl0aGluIn0:1nGCjL:xjznt8tvEUfOiZotZwAABJeBKXg19T1y5vpenrncDPA','2022-02-19 04:31:23.722196'),('mbe6u49jxocdvig2cftqyu9ly8ld30um','.eJxVkLFqwzAQht9Fc2uU80mWuiVLEzpkaqBdhCKfbFFhgSVTSum710oz1NPBf3z_d9w3G1IaIj0mu5QRTC62EHti7zNHDjtxwfPylQ6XY34LtMeXI51eT7L9ZA_MVMIsmWYT-hUB3IZX6z5oqpucXLDRuDRTc09z8-dtnm_jvK_2LT_aPNZa0bdSQNd623mFV0KkzlsSGnBH3msupXJE0GoJqESPAhTXijvfd6D0Wnr336qjzcXENITp34GbH6xA9a9xDGUME_v5BdtQYKw:1nI9b4:-l4_ZBZI9nscugJ0LXVmqNVNyg9BSv_BIqQPeCzdzJk','2022-02-24 13:34:54.150057'),('nmi0n1y734eeonn4usfatucur0udzjz4','eyJ0aGVhdHJlIjoic2FuZ2VlZXRoYSJ9:1nJJBS:cHRiXMhgWDW3ky6c9R8dq2n6VuJ_fq-47zgxXbQPBs0','2022-02-27 18:01:14.952166'),('o3omu0eohz3klvzjg5q9vzzi6op5rckx','eyJtb3ZpZSI6IjY1NzY0NCIsImxvYyI6InRyaXZhbmRydW0ifQ:1nKJBI:PIMv7-W-IA_hwdmpl5LUPWaDm9ormCBxJLJ7QO28fWg','2022-03-02 12:13:12.557844'),('ooe0vo02dlm76117tkw0q1w0ogr6vk9d','.eJyrViotTi2KL87IL49PSSxJVbJSMjIwMtI1MNI1tFDSUcrNL8sECZpbmJiZmAMFSjJSE0uKUnHryMlPBgpl55eUJFYm5irVAgC26B1N:1nLJcz:xZFSFgdmo2OpA4kPztvX3kZDICIonuP9b7QOGHFZRPc','2022-03-05 06:53:57.952074'),('ovm07c2fv7vdqlkat7x403w2rh035zqb','eyJ0aGVhdHJlIjoiam9qaSJ9:1nI2gz:3FaiAjW45lsY6wQT7DwgEvp4u1was29dwHhpn2fmAeI','2022-02-24 06:12:33.996952'),('p7bmdzxbqi6kxx0vg69cw50hmtw7lwy7','.eJx1kMtugzAQRf-FdYOMedh014eaRaO2UVV1aQ3GYMBgip1GpOq_1zwWYdHZjHTu3Lmj-fGU5t6t14CBodS5d-NZKcAOghmpzywHK5yMEcY7hHeYuoGTEcP_aqu_qwkSGiURcaBks6ERo6OXtoj4l2lJl-qatmos-6S1tq5T0qeor6d5rUsldhpOVmJm7JIhL-8fxSOgo3k-lGM_vPVPh-P-_qXWEkUP509nZJNjCavy6Sy6hRnwRnSTYjSvQDGuB-Gv1PhLrr-f2-vdlL71SzDSmbPcFaFxnlIaCOA4JEkSYxpxkSWEhoBREEBK4zAvMkJwgiErgFBAkJICI7d0zZ9XKzCWKV1W3dWBmx-sL3dYVVZWHUfe7x9DjZBl:1nOFqm:FIhoyq_szmz1jtknWGC9hIcAKfcqkhMStSJyD2H1w-o','2022-03-13 09:28:20.288717'),('rqr2zqb1syuyv9blfgf6i7cjrx9a7byl','eyJsb2MiOiJhbHV2YSIsIm1vdmllIjoiNjU3NjQ0In0:1nKPNU:AS_keHi24gxB83W4oaGMXL_29gb2Dx_bPK-BylYhjU4','2022-03-02 18:50:12.778260'),('u5noi9rjfxgm2wgtj6dkhmbfps97j2ck','.eJxVkc1ugzAQhN-FcxORBWzTW1UlaStVaS9VlAtabAMGgxMMTX_Ud68NOSS-WPrGs7O7_g204cF90KDFvjQiuAtGK_vMVuacCRyk0yAEWISwgNiprflUHpIoJnHqQJlNhkZ-OzomnVFpXxdfZQvncqiJaKo2L442pTXwxr83ptRyYXAcKsjsMGfU59N6f9q3DN6T12e9e_mAR7t--jlsx7dDstk4Y-Ydc5gSvi12C3Pkjey8Yg1XqDNuerm8ULucc5fb6do9-PRbf4W2cuZcuENZIlLGVhI5RJSQBFjMZU4oixDC1QpTlkSiyCkFApgXSBmGmNICQlf0kj-V1miHTJtSdVcN3uzgsnKHtRoq1XFfgpvxKLv5G6ZpKQn-_gEpa41D:1nMqbu:YZXw9wvoH3gY8Ch9w3HSnc3qo3a1tdq0fVWAK8J1aJQ','2022-03-09 12:19:10.517797'),('vbo3wfr3h49fpnvzzuu6ifr5mp8m35jj','.eJwdy0kOhCAQQNG71FoTU0g7XIaggiOWYTLa6bs3un0__wsb9dDCSt7LSxrIIDhlhZvoFIP0KjUsEPMCc-SpGorzg3XJKmwSjOIdVnUljR2xU1s2lY0-9njfIXxmbbk5asP4ssDvD_JYJFM:1nLimC:afdcM3lCwzx0uXmUs0xa72vUyKZrA799bLF9XKwcEmY','2022-03-06 09:45:08.837661'),('xbjpkid13o8akubwbuyvi5l9kok4790v','eyJ1c2VyIjoibGl0aGluIn0:1nGFTF:Mp3ubXEmf9SsqaZ4RFl1QwtQMWd9WtiU-AlvJH-Zs78','2022-02-19 07:26:57.340884');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int NOT NULL,
  `lifetime` int NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_nonce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_partial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`),
  CONSTRAINT `social_auth_partial_chk_1` CHECK ((`next_step` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_userlogin` (`user_id`),
  KEY `social_auth_usersocialauth_uid_796e51dc` (`uid`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_userlogin` FOREIGN KEY (`user_id`) REFERENCES `userlogin_extends` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (4,'google-oauth2','lithinc0@gmail.com','{\"auth_time\": 1645954042, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.A0ARrdaM-vYzzDVl3kk5WQidR-dr639jx9oejllZV_IQ9wQ25AJRV1zxy1CBXEHi5ogRGzW2SJm3ykDotVkoJ7gugOKZJNEjGb_0YHP2nWRzDBp2izYSj2MX7QVNHvRuW2Li3LvHMbxvXd_5kO_7wU9rOvEwMwLQ\"}',28,'2022-02-22 08:26:51.487573','2022-02-27 09:27:22.189141');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_booked_seats`
--

DROP TABLE IF EXISTS `theatreArea_booked_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_booked_seats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `seat_no` varchar(20) NOT NULL,
  `show_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `g_user` varchar(250) DEFAULT NULL,
  `seat_category` varchar(50) NOT NULL,
  `ticket_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theatreArea_booked_s_show_id_4f717b11_fk_theatreAr` (`show_id`),
  KEY `theatreArea_booked_s_user_id_c1f5a7ab_fk_userlogin` (`user_id`),
  KEY `theatreArea_booked_s_ticket_id_55c7601c_fk_theatreAr` (`ticket_id`),
  CONSTRAINT `theatreArea_booked_s_show_id_4f717b11_fk_theatreAr` FOREIGN KEY (`show_id`) REFERENCES `theatreArea_shows` (`id`),
  CONSTRAINT `theatreArea_booked_s_ticket_id_55c7601c_fk_theatreAr` FOREIGN KEY (`ticket_id`) REFERENCES `theatreArea_tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_booked_seats`
--

LOCK TABLES `theatreArea_booked_seats` WRITE;
/*!40000 ALTER TABLE `theatreArea_booked_seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `theatreArea_booked_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_movies`
--

DROP TABLE IF EXISTS `theatreArea_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_movies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Movie` varchar(50) NOT NULL,
  `tmdb` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_movies`
--

LOCK TABLES `theatreArea_movies` WRITE;
/*!40000 ALTER TABLE `theatreArea_movies` DISABLE KEYS */;
INSERT INTO `theatreArea_movies` VALUES (35,'The Batman',414906),(36,'Life After You ',881876),(37,'Bheeshma Parvam ',804309),(38,'Aaraattu',784647),(39,'Spider-Man: No Way Home',634649),(40,'Ajagajantharam',843729),(41,'Hridayam',653221),(42,'The King\'s Man',476669),(43,'Archana 31 Not Out',792027),(45,'Jan-e-Man',868882),(46,'Moonfall',406759),(47,'Kallan D\'Souza',864274);
/*!40000 ALTER TABLE `theatreArea_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_promocodes`
--

DROP TABLE IF EXISTS `theatreArea_promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_promocodes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(250) DEFAULT NULL,
  `coupen_offer` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_promocodes`
--

LOCK TABLES `theatreArea_promocodes` WRITE;
/*!40000 ALTER TABLE `theatreArea_promocodes` DISABLE KEYS */;
INSERT INTO `theatreArea_promocodes` VALUES (1,'TRY30',30);
/*!40000 ALTER TABLE `theatreArea_promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_screens`
--

DROP TABLE IF EXISTS `theatreArea_screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_screens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(20) NOT NULL,
  `g_price` int NOT NULL,
  `sp_price` int NOT NULL,
  `s_price` int NOT NULL,
  `theatre_id` bigint NOT NULL,
  `g_c_no` int NOT NULL,
  `g_r_no` int NOT NULL,
  `s_c_no` int NOT NULL,
  `s_r_no` int NOT NULL,
  `sp_c_no` int NOT NULL,
  `sp_r_no` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theatreArea_screens_theatre_id_d511512f_fk_theatreAr` (`theatre_id`),
  CONSTRAINT `theatreArea_screens_theatre_id_d511512f_fk_theatreAr` FOREIGN KEY (`theatre_id`) REFERENCES `theatreArea_theatres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_screens`
--

LOCK TABLES `theatreArea_screens` WRITE;
/*!40000 ALTER TABLE `theatreArea_screens` DISABLE KEYS */;
INSERT INTO `theatreArea_screens` VALUES (15,'screen-1',200,150,100,22,5,5,5,5,5,5),(16,'screen-2',200,150,100,22,5,5,5,5,5,5),(17,'screen-3',200,150,100,22,5,5,5,5,5,5);
/*!40000 ALTER TABLE `theatreArea_screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_shows`
--

DROP TABLE IF EXISTS `theatreArea_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_shows` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` time(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `screen_id` bigint NOT NULL,
  `exp_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theatreArea_shows_movie_id_eefed1c7_fk_theatreArea_movies_id` (`movie_id`),
  KEY `theatreArea_shows_screen_id_e6fe6d2a_fk_theatreArea_screens_id` (`screen_id`),
  CONSTRAINT `theatreArea_shows_movie_id_eefed1c7_fk_theatreArea_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `theatreArea_movies` (`id`),
  CONSTRAINT `theatreArea_shows_screen_id_e6fe6d2a_fk_theatreArea_screens_id` FOREIGN KEY (`screen_id`) REFERENCES `theatreArea_screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_shows`
--

LOCK TABLES `theatreArea_shows` WRITE;
/*!40000 ALTER TABLE `theatreArea_shows` DISABLE KEYS */;
INSERT INTO `theatreArea_shows` VALUES (64,'08:00:00.000000',38,15,'2022-02-24'),(65,'14:00:00.000000',38,15,'2022-02-24'),(66,'20:00:00.000000',38,15,'2022-02-24'),(67,'23:30:00.000000',38,15,'2022-02-24'),(68,'08:00:00.000000',40,15,'2022-02-25'),(69,'14:00:00.000000',40,15,'2022-02-25'),(70,'19:00:00.000000',40,15,'2022-02-25'),(71,'23:00:00.000000',40,15,'2022-02-25'),(72,'08:00:00.000000',40,16,'2022-02-24'),(73,'12:00:00.000000',40,16,'2022-02-24'),(74,'16:00:00.000000',41,16,'2022-02-24'),(75,'22:50:00.000000',41,16,'2022-02-24'),(76,'08:00:00.000000',39,17,'2022-02-24'),(77,'11:00:00.000000',39,17,'2022-02-24'),(78,'17:00:00.000000',39,17,'2022-02-24'),(79,'20:00:00.000000',42,17,'2022-02-24'),(81,'10:00:00.000000',38,16,'2022-02-28'),(82,'15:00:00.000000',38,16,'2022-02-28');
/*!40000 ALTER TABLE `theatreArea_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_theatres`
--

DROP TABLE IF EXISTS `theatreArea_theatres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_theatres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(30) NOT NULL,
  `location` varchar(50) NOT NULL,
  `theatre_name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `location_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theatreArea_theatres_email_a8b6d8c6_uniq` (`email`),
  UNIQUE KEY `theatreArea_theatres_phone_f2fbca89_uniq` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_theatres`
--

LOCK TABLES `theatreArea_theatres` WRITE;
/*!40000 ALTER TABLE `theatreArea_theatres` DISABLE KEYS */;
INSERT INTO `theatreArea_theatres` VALUES (22,'arjun','kasargod','Opera','8078798842','arjun@gmail.com','!Lithin12345','a1','<iframe src=\"https://!1m18!1m12!1m3!1d15592.144612510006!2d75.08194636326415!3d12.313352260640459!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba47c401ccbdf6b%3A0x18f718843e5ad902!2sDeepthi%20Theater!5e0!3m2!1sen!2sin!4v1645518616063!5m2!1sen!2sin'),(24,'shahin','kozhikod','Kairali Sree Theater 4K 3D','8590975267','shahin@gmail.com','!Lithin12345','a3','<iframe src=!1m18!1m12!1m3!1d125232.95183096496!2d75.75046891320687!3d11.222387677478935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba6593795136139%3A0xedd08df774cf3744!2sKairali%20Sree%20Theater%204K%203D!5e0!3m2!1sen!2sin!4v1645519001642!5m2!1sen!2sin');
/*!40000 ALTER TABLE `theatreArea_theatres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_tickets`
--

DROP TABLE IF EXISTS `theatreArea_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_tickets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ticket_uid` varchar(500) NOT NULL,
  `show_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `total_price` int DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theatreArea_tickets_show_id_e2786108_fk_theatreArea_shows_id` (`show_id`),
  KEY `theatreArea_tickets_user_id_e22a5a76_fk_userlogin_extends_id` (`user_id`),
  CONSTRAINT `theatreArea_tickets_show_id_e2786108_fk_theatreArea_shows_id` FOREIGN KEY (`show_id`) REFERENCES `theatreArea_shows` (`id`),
  CONSTRAINT `theatreArea_tickets_user_id_e22a5a76_fk_userlogin_extends_id` FOREIGN KEY (`user_id`) REFERENCES `userlogin_extends` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_tickets`
--

LOCK TABLES `theatreArea_tickets` WRITE;
/*!40000 ALTER TABLE `theatreArea_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `theatreArea_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatreArea_used_codes`
--

DROP TABLE IF EXISTS `theatreArea_used_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatreArea_used_codes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theatreArea_used_cod_code_id_f0eae09e_fk_theatreAr` (`code_id`),
  KEY `theatreArea_used_codes_user_id_5e57b3e0_fk_userlogin_extends_id` (`user_id`),
  CONSTRAINT `theatreArea_used_cod_code_id_f0eae09e_fk_theatreAr` FOREIGN KEY (`code_id`) REFERENCES `theatreArea_promocodes` (`id`),
  CONSTRAINT `theatreArea_used_codes_user_id_5e57b3e0_fk_userlogin_extends_id` FOREIGN KEY (`user_id`) REFERENCES `userlogin_extends` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatreArea_used_codes`
--

LOCK TABLES `theatreArea_used_codes` WRITE;
/*!40000 ALTER TABLE `theatreArea_used_codes` DISABLE KEYS */;
INSERT INTO `theatreArea_used_codes` VALUES (11,1,28);
/*!40000 ALTER TABLE `theatreArea_used_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin_extends`
--

DROP TABLE IF EXISTS `userlogin_extends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin_extends` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phonenum` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `userlogin_extends_phonenum_069d4c97_uniq` (`phonenum`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin_extends`
--

LOCK TABLES `userlogin_extends` WRITE;
/*!40000 ALTER TABLE `userlogin_extends` DISABLE KEYS */;
INSERT INTO `userlogin_extends` VALUES (28,'!hZarYdQ969cWZYeXchq85LIsARaqKx3rtlWMSQPB','2022-02-27 09:27:22.241589',0,'lithinc0','Lithin','CM','lithinc0@gmail.com',0,1,'2022-02-17 07:39:20.289810',''),(30,'pbkdf2_sha256$320000$NQYoenLTnWB6A2ebo7Ao1r$vevzu4BdYBhpJA0NrYC01LnMesXD52wt8nmVCAC6p7U=',NULL,1,'arjun','','','arjun@gmail.com',1,1,'2022-02-17 07:48:40.577126',NULL);
/*!40000 ALTER TABLE `userlogin_extends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin_extends_groups`
--

DROP TABLE IF EXISTS `userlogin_extends_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin_extends_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `extends_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userlogin_extends_groups_extends_id_group_id_e71c9d1a_uniq` (`extends_id`,`group_id`),
  KEY `userlogin_extends_groups_group_id_4b467451_fk_auth_group_id` (`group_id`),
  CONSTRAINT `userlogin_extends_gr_extends_id_ff01b66f_fk_userlogin` FOREIGN KEY (`extends_id`) REFERENCES `userlogin_extends` (`id`),
  CONSTRAINT `userlogin_extends_groups_group_id_4b467451_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin_extends_groups`
--

LOCK TABLES `userlogin_extends_groups` WRITE;
/*!40000 ALTER TABLE `userlogin_extends_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogin_extends_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin_extends_user_permissions`
--

DROP TABLE IF EXISTS `userlogin_extends_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogin_extends_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `extends_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userlogin_extends_user_p_extends_id_permission_id_0fb531c0_uniq` (`extends_id`,`permission_id`),
  KEY `userlogin_extends_us_permission_id_5015a9cd_fk_auth_perm` (`permission_id`),
  CONSTRAINT `userlogin_extends_us_extends_id_9c4c2025_fk_userlogin` FOREIGN KEY (`extends_id`) REFERENCES `userlogin_extends` (`id`),
  CONSTRAINT `userlogin_extends_us_permission_id_5015a9cd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin_extends_user_permissions`
--

LOCK TABLES `userlogin_extends_user_permissions` WRITE;
/*!40000 ALTER TABLE `userlogin_extends_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogin_extends_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 18:41:26
