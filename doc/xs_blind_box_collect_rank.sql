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
-- Table structure for table `xs_blind_box_collect_rank`
--

DROP TABLE IF EXISTS `xs_blind_box_collect_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_blind_box_collect_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `area_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'area',
  `period` int(11) NOT NULL DEFAULT '1' COMMENT '周期',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `glist` varchar(64) NOT NULL COMMENT '收到的礼物ID，逗号隔开',
  `collect_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收集数量',
  `is_hit_hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否命中隐藏款: 0 没有，1命中',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `collect_full_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首次收集齐的时间',
  `collect_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收集总数量',
  PRIMARY KEY (`id`),
  KEY `uk_user` (`area_id`,`period`,`uid`),
  KEY `idx_rank` (`area_id`,`period`,`collect_num`,`collect_full_time`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='盲盒收集榜';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xs_blind_box_collect_rank`
--

LOCK TABLES `xs_blind_box_collect_rank` WRITE;
/*!40000 ALTER TABLE `xs_blind_box_collect_rank` DISABLE KEYS */;
INSERT INTO `xs_blind_box_collect_rank` VALUES (1,2,1,1000220,'110422,110420',2,0,1675332589,0,6),(2,2,1,112890,'110421',1,0,1675332738,0,1),(3,2,1,111948,'110420',1,0,1675334206,0,1),(4,2,1,111949,'110421',1,0,1675334263,0,1),(5,2,1,111976,'110420,110419',2,0,1675334325,0,2),(6,2,1,113358,'110419',1,0,1675334993,0,1),(7,2,2,1000220,'100123,110254,110449,110448,110443',5,1,1675336385,1675336831,17),(8,2,2,111527,'100123,110449,110448,110443',4,1,1675336415,0,9),(9,2,1,111119,'110422',1,0,1675339944,0,1),(10,2,2,111283,'110448,110254,110443,110449,100123',5,1,1675656649,1675656649,2211);
/*!40000 ALTER TABLE `xs_blind_box_collect_rank` ENABLE KEYS */;
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

-- Dump completed on 2023-02-06 15:44:18
