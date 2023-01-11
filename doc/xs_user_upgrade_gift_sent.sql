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
-- Table structure for table `xs_user_upgrade_gift_sent`
--

DROP TABLE IF EXISTS `xs_user_upgrade_gift_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_user_upgrade_gift_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'User id ',
  `gid` int(11) NOT NULL COMMENT 'The id of the gift that user have sent.',
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_gid` (`uid`,`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xs_user_upgrade_gift_sent`
--

LOCK TABLES `xs_user_upgrade_gift_sent` WRITE;
/*!40000 ALTER TABLE `xs_user_upgrade_gift_sent` DISABLE KEYS */;
INSERT INTO `xs_user_upgrade_gift_sent` VALUES (1,113268,110252,103),(2,113327,110126,378),(3,111721,100058,1),(4,113374,110126,1),(5,113380,110126,5),(6,111178,110252,1),(7,112064,100058,1),(8,111721,110254,1),(9,112890,100058,2),(10,112890,110252,2),(11,112890,110254,1),(12,113375,110126,1),(13,113268,110126,1),(14,113327,110252,260),(15,113327,110254,49),(16,113479,100058,1),(17,113398,110252,151),(18,113268,100058,2),(20,113374,110254,14),(21,111309,110252,1),(22,113398,110254,33),(23,111322,100058,2),(26,113389,110323,20),(27,112033,110126,1003),(31,113327,100058,210),(32,111113,100058,211),(33,111113,110252,204),(34,111288,100058,2),(35,111113,110254,9),(36,111113,110126,14),(37,113083,110252,1),(38,113376,110126,10),(39,1000071,110254,1),(40,113268,110254,1),(41,113378,110252,6),(42,113378,110126,4),(43,111936,100058,2),(44,113376,110254,6),(45,113376,100058,99),(46,113398,100058,8),(47,113321,110252,1),(48,113430,110254,1),(49,111852,110126,2),(50,111149,110252,1),(51,111142,100058,2),(52,111142,110252,3),(53,112780,110126,27),(54,111119,110126,136),(55,111907,110126,8),(56,111910,110126,4),(57,113398,110126,36),(58,113435,100058,100),(59,111246,100058,2),(60,111182,100058,4),(61,111182,110254,2),(62,111246,110126,1),(63,111182,110126,2),(64,111748,110254,1),(65,111283,110126,2),(66,1000063,110126,1),(67,113374,110252,100),(68,111325,110126,39),(69,113415,110126,5),(70,1000152,110126,1),(71,1000069,110254,1),(72,111911,110252,1),(73,113378,110254,2),(74,112033,110252,1),(75,112064,110252,1),(76,111245,110126,107),(77,111245,100058,17),(78,1000075,110126,3),(79,111142,110254,1),(80,112588,110254,1),(81,111695,110252,47),(82,111695,110254,47),(83,1000075,110252,1),(84,113416,110252,1),(85,1000029,110252,3),(86,113387,110126,1),(87,113387,110252,1),(88,113435,110126,10),(89,113267,110126,10),(90,111729,110252,2),(91,112043,110126,1),(92,1000250,100058,1),(93,113374,100058,1),(94,1000267,100058,1),(95,1000282,100058,1),(96,1000318,110126,1),(97,1000327,110126,1),(98,1000178,110126,16),(99,111750,110254,1),(100,111852,100058,1),(101,1000363,100058,2),(102,1000042,100058,5),(103,1000146,110126,1),(104,1000131,100058,1),(105,1000379,110126,1),(106,111658,110252,2),(107,1000374,110252,1),(108,1000402,110126,1),(109,111913,110126,2),(110,112783,110252,6),(111,1000220,100058,12),(112,111288,110252,2),(113,111288,110254,4),(114,113079,110126,62),(115,1000043,100058,295),(116,1000442,110252,1),(117,1000442,110126,1),(118,1000438,100058,56),(119,111695,100058,341),(120,111696,100058,802),(121,1000442,100058,90),(122,111696,110252,38),(123,111696,110254,22),(124,1000153,100058,50),(125,1000174,110126,139),(126,1000188,110126,1),(127,111119,110252,4),(128,111729,110126,34),(129,111893,110126,9),(130,111893,100058,5),(131,113430,100058,445),(132,1000014,100058,21),(133,113265,100058,5),(134,111574,110126,5),(135,113430,110252,3),(136,111729,100058,1),(137,111721,110126,1),(138,112695,110126,1),(139,1000467,110126,2),(140,1000178,110254,2),(141,112702,110126,1),(142,1000190,100058,1),(143,112694,110252,1),(144,112694,110126,4),(145,112694,110254,1),(146,1000241,110126,8),(147,111182,110252,2),(148,111786,110126,5),(149,111918,110126,4),(150,111784,110126,2),(151,112805,110254,5),(152,111246,110303,1),(153,111245,110252,1),(154,1000190,110126,4),(155,1000544,110252,2),(156,111784,100058,1),(157,113301,110126,1),(158,1000190,110252,3),(159,1000190,110254,1),(160,1000174,110252,10),(161,1000174,110254,4),(162,1000621,100058,1),(163,1000626,100058,1),(164,113301,110252,8),(165,1000673,100058,6);
/*!40000 ALTER TABLE `xs_user_upgrade_gift_sent` ENABLE KEYS */;
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

-- Dump completed on 2023-01-11 17:30:19