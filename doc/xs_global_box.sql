-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: xianshi
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='08be22fb-065e-11ec-9289-00163e19f1f8:1-1787145,
300ca9ea-4369-11eb-a19a-00163e0879f0:1-164159,
7aa46203-1a6a-11eb-99c7-6c92bf475839:1-1927333,
83c7f43f-c667-11ea-b5f3-b8599f497888:1-2303169,
83fec48d-c667-11ea-b5f3-6c92bf28f407:1-11';

--
-- Table structure for table `xs_global_box`
--

DROP TABLE IF EXISTS `xs_global_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_global_box` (
  `type` enum('copper','silver','gold','white') NOT NULL,
  `money_type` varchar(25) NOT NULL DEFAULT 'gold_bean' COMMENT '货币类型: gold_bean 金豆, family_diamond 家族钻',
  `last_refresh_cid` int(11) NOT NULL DEFAULT '0' COMMENT 'Main cid that was refreshed',
  `last_refresh_sub_cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The same price cid of main cid that was refresh',
  `last_refresh_dateline` int(11) NOT NULL DEFAULT '0' COMMENT 'Last refresh timing',
  `bigarea_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Big area of this global box group',
  PRIMARY KEY (`type`,`money_type`,`bigarea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the refresh logic of global(gift) box';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xs_global_box`
--

LOCK TABLES `xs_global_box` WRITE;
/*!40000 ALTER TABLE `xs_global_box` DISABLE KEYS */;
INSERT INTO `xs_global_box` VALUES ('copper','family_diamond',3208,3208,1662107865,1),('copper','family_diamond',3208,3208,1662107865,2),('copper','family_diamond',3217,3217,1662107865,3),('copper','family_diamond',3208,3208,1662107865,4),('copper','family_diamond',3208,3208,1662107865,5),('copper','family_diamond',3217,3217,1662107865,6),('copper','family_diamond',3209,3209,1662107865,7),('copper','family_diamond',3210,3210,1662107865,8),('copper','family_diamond',3217,3217,1662107865,9),('copper','family_diamond',3209,3209,1662107865,10),('copper','family_diamond',3208,3208,1662107865,11),('copper','family_diamond',3217,3217,1662107865,12),('copper','gold_bean',3192,3192,1668399407,1),('copper','gold_bean',3193,3193,1668399295,2),('copper','gold_bean',3199,3199,1662107865,3),('copper','gold_bean',3190,3190,1662107865,4),('copper','gold_bean',3193,3193,1662107865,5),('copper','gold_bean',3193,3193,1662107865,6),('copper','gold_bean',3190,3190,1662107865,7),('copper','gold_bean',3193,3193,1662107865,8),('copper','gold_bean',3193,3193,1662107865,9),('copper','gold_bean',3192,3192,1662107865,10),('copper','gold_bean',3190,3190,1662107865,11),('copper','gold_bean',3192,3192,1662107865,12),('silver','family_diamond',3216,3216,1662107865,1),('silver','family_diamond',3216,3216,1662107865,2),('silver','family_diamond',3208,3208,1662107865,3),('silver','family_diamond',3215,3215,1662107865,4),('silver','family_diamond',3215,3215,1662107865,5),('silver','family_diamond',3215,3215,1662107865,6),('silver','family_diamond',3216,3216,1662107865,7),('silver','family_diamond',3216,3216,1662107865,8),('silver','family_diamond',3215,3215,1662107865,9),('silver','family_diamond',3208,3208,1662107865,10),('silver','family_diamond',3216,3216,1662107865,11),('silver','family_diamond',3216,3216,1662107865,12),('silver','gold_bean',3192,3192,1662107865,1),('silver','gold_bean',3190,3190,1662107865,2),('silver','gold_bean',3192,3192,1662107865,3),('silver','gold_bean',3198,3198,1662107865,4),('silver','gold_bean',3190,3190,1662107865,5),('silver','gold_bean',3192,3192,1662107865,6),('silver','gold_bean',3190,3190,1662107865,7),('silver','gold_bean',3190,3190,1662107865,8),('silver','gold_bean',3192,3192,1662107865,9),('silver','gold_bean',3190,3190,1662107865,10),('silver','gold_bean',3192,3192,1662107865,11),('silver','gold_bean',3190,3190,1662107865,12),('gold','family_diamond',3216,3216,1662107865,1),('gold','family_diamond',3207,3207,1662107865,2),('gold','family_diamond',3207,3207,1662107865,3),('gold','family_diamond',3208,3208,1662107865,4),('gold','family_diamond',3207,3207,1662107865,5),('gold','family_diamond',3208,3208,1662107865,6),('gold','family_diamond',3216,3216,1662107865,7),('gold','family_diamond',3208,3208,1662107865,8),('gold','family_diamond',3216,3216,1662107865,9),('gold','family_diamond',3208,3208,1662107865,10),('gold','family_diamond',3207,3207,1662107865,11),('gold','family_diamond',3207,3207,1662107865,12),('gold','gold_bean',3198,3198,1662107865,1),('gold','gold_bean',3198,3198,1662107865,2),('gold','gold_bean',3198,3198,1662107865,3),('gold','gold_bean',3198,3198,1662107865,4),('gold','gold_bean',3191,3191,1662107865,5),('gold','gold_bean',3191,3191,1662107865,6),('gold','gold_bean',3191,3191,1662107865,7),('gold','gold_bean',3198,3198,1662107865,8),('gold','gold_bean',3198,3198,1662107865,9),('gold','gold_bean',3198,3198,1662107865,10),('gold','gold_bean',3191,3191,1662107865,11),('gold','gold_bean',3191,3191,1662107865,12),('white','gold_bean',3269,3269,1668395181,1),('white','gold_bean',3269,3269,1668397896,2),('white','gold_bean',3269,3269,1662107865,3),('white','gold_bean',3269,3269,1662107865,4),('white','gold_bean',3269,3269,1662107865,5),('white','gold_bean',3269,3269,1662107865,6),('white','gold_bean',3269,3269,1662107865,7),('white','gold_bean',3269,3269,1662107865,8),('white','gold_bean',3269,3269,1662107865,9),('white','gold_bean',3269,3269,1662107865,10),('white','gold_bean',3269,3269,1662107865,11),('white','gold_bean',3269,3269,1662107865,12);
/*!40000 ALTER TABLE `xs_global_box` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 17:57:29
