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
-- Table structure for table `xs_gift_upgraded`
--

DROP TABLE IF EXISTS `xs_gift_upgraded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_gift_upgraded` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned NOT NULL COMMENT 'the gid of the upgraded gift',
  `basic_gid` int(11) unsigned NOT NULL COMMENT 'the gid of the basic gift',
  `level` tinyint(3) unsigned NOT NULL COMMENT 'the level of the gift',
  `unlock_num` mediumint(6) unsigned NOT NULL COMMENT 'the num of basic gifts to send to unlock the upgraded gift',
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_level` (`basic_gid`,`level`),
  KEY `basic_gid` (`basic_gid`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xs_gift_upgraded`
--

LOCK TABLES `xs_gift_upgraded` WRITE;
/*!40000 ALTER TABLE `xs_gift_upgraded` DISABLE KEYS */;
INSERT INTO `xs_gift_upgraded` VALUES (3,1101705,1101702,2,22,1667210204),(4,1101706,1101704,2,50,1667210435),(5,1101707,1101702,3,33,1667210481),(7,110253,110252,2,99,1667211751),(9,110324,110323,2,99,1667295483),(10,110304,110303,2,50,1667295620),(12,110126,110126,1,0,1667296033),(13,100122,110126,2,10,1667296169),(14,110223,110126,3,30,1667296465),(15,110245,110126,4,60,1667296518),(16,110255,100058,2,10,1667366458),(19,110222,110254,2,6,1667366763),(24,110256,100058,3,50,1667389846),(25,100069,100058,4,100,1667389999),(26,110221,100058,5,200,1667389999);
/*!40000 ALTER TABLE `xs_gift_upgraded` ENABLE KEYS */;
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

-- Dump completed on 2023-01-11 17:24:29