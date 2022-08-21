-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: psyco_ease
-- ------------------------------------------------------
-- Server version	5.7.39-0ubuntu0.18.04.2

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
-- Table structure for table `Hospitals`
--

DROP TABLE IF EXISTS `Hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hospitals`
--

LOCK TABLES `Hospitals` WRITE;
/*!40000 ALTER TABLE `Hospitals` DISABLE KEYS */;
INSERT INTO `Hospitals` VALUES (1,'Apollo Hospital','2022-08-20 18:42:38','2022-08-20 18:42:38'),(2,'Jawaharlal Nehru Medical College and Hospital','2022-08-20 18:42:38','2022-08-20 18:42:38'),(3,'Indira Gandhi Institute of Medical Sciences(IGIMS)','2022-08-20 18:42:38','2022-08-20 18:42:38'),(4,'AIIMS-All India Institute of Medical Sciences','2022-08-20 18:42:38','2022-08-20 18:42:38');
/*!40000 ALTER TABLE `Hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psychiatristId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `psychiatristId` (`psychiatristId`),
  CONSTRAINT `Patients_ibfk_1` FOREIGN KEY (`psychiatristId`) REFERENCES `Psychiatrists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES (1,1,'bani das','inda saratpally jafala road','bani.das@gmail.com',NULL,'$2b$10$J36vHI69M8IS..KK0R4UeuHPtMyzd1R9OTTafdHIUvyWe8uOGZ0vO','1661023053223-Screenshot from 2022-08-03 23-29-03.png','2022-08-20 19:17:33','2022-08-20 19:17:33'),(2,2,'bina das','inda saratpally jafala road','bina.das@gmail.com',NULL,'$2b$10$9ZRrGXR6utTSv0/Oj0S8wOlxdcPkRLR9VWSTbRAc6rKhkgHrnboCm','1661076794308-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 10:13:14','2022-08-21 10:13:14'),(3,3,'riya das','inda saratpally jafala road','riya.das@gmail.com',NULL,'$2b$10$c1k8VGKjI7xOuQNH0Jn4gOBw9TJFywYYcLeiGo2TZcy00dwqxnic2','1661082800584-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:53:20','2022-08-21 11:53:20'),(4,4,'rabi das','inda saratpally jafala road','rabi.das@gmail.com',NULL,'$2b$10$bDAIJEUVVTbzpYfPllgmTeLKZW6bu5IlSVgCEQpNFTsrPmi88k.ie','1661082834565-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:53:54','2022-08-21 11:53:54'),(5,5,'rabii das','inda saratpally jafala road','rabii.das@gmail.com',NULL,'$2b$10$tFYyi.5ap6E0YIvOwT.xVOje12zrFNFLhsMeJoIKE62LMBqIY5WTm','1661082848752-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:54:08','2022-08-21 11:54:08'),(6,5,'rubel das','inda saratpally jafala road','rubel.das@gmail.com',NULL,'$2b$10$UuIajdhhCZj8yE1AvyPMwOLWOvNcYh3ApwEfCr3s480WeOBUMiu6y','1661082868002-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:54:28','2022-08-21 11:54:28'),(7,6,'rubel das','inda saratpally jafala road','rubel2.das@gmail.com',NULL,'$2b$10$r2TQRcQJqV1nLNAyRiTyzOqRq5HFHtrfwiZhRXi7VYQvySCkqm3Be','1661082880731-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:54:40','2022-08-21 11:54:40'),(8,7,'sudha das','inda saratpally jafala road','sudha.das@gmail.com',NULL,'$2b$10$lxFrdf32dMDbNP/SSWZkTuQZCYLy2keQOIGV8YmcghGzdbnRN4oCO','1661083082218-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:58:02','2022-08-21 11:58:02'),(9,7,'sudha bera','inda saratpally jafala road','sudha.bera@gmail.com',NULL,'$2b$10$ec0EaCaj4IXGDTolgqtKOe5SMM7g/RqJu89HzMHFZM5jYCfisjM0O','1661083095950-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:58:16','2022-08-21 11:58:16'),(10,8,'sudha biswas','inda saratpally jafala road','sudha.biswas@gmail.com',NULL,'$2b$10$RmyQl7p1h31l92K/vEmgYODKPPsJ5fgiOCiZIRoeXeZekGGoTP1O6','1661083118660-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:58:38','2022-08-21 11:58:38'),(11,9,'sudha biswas','inda saratpally jafala road','sudha.biswa1s@gmail.com',NULL,'$2b$10$HGX9PTe4lAqx.m5MxUGxROMBU6dqLJIW6r7NvF0QCXnNWeFp2.AO2','1661083131486-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:58:51','2022-08-21 11:58:51'),(12,10,'sudha biswas','inda saratpally jafala road','sudha.biswas2@gmail.com',NULL,'$2b$10$UqeYUO165JQQlriEruwBt.uUZaCY6MO7pa.EQ2CezhWPTrHyUHNXW','1661083142992-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:59:03','2022-08-21 11:59:03'),(13,10,'sudha biswas3','inda saratpally jafala road','sudha.biswas3@gmail.com',NULL,'$2b$10$sGN2FIXVgvzrgOa3Uk/CD.fPEaWSqYWkxgcezhUL6m2GDD3l8x2CO','1661083168885-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:59:28','2022-08-21 11:59:28'),(14,11,'sudha biswas4','inda saratpally jafala road','sudha.biswas5@gmail.com',NULL,'$2b$10$UJe8p7.AZel4Gy21.sXzE.915eRn3gpgaSVLBfPyNU6TAtmHMKTrq','1661083199724-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 11:59:59','2022-08-21 11:59:59'),(15,12,'suravi dey','inda saratpally jafala road','suravi.dey@gmail.com',NULL,'$2b$10$8os9jslBTrI8LlTAunUVUenXLZEV8UFe8RTGCLR3BAm09cT9gEJ2G','1661083228870-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:00:28','2022-08-21 12:00:28'),(16,13,'suravi dey1','inda saratpally jafala road','suravi.dey1@gmail.com',NULL,'$2b$10$66Rx8iG2DN42mWpTYJ9UHuOAyHLcICPAi8XMXHdsnB4KWKge51pP.','1661083242335-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:00:42','2022-08-21 12:00:42'),(17,14,'suravi dey2','inda saratpally jafala road','suravi.dey2@gmail.com',NULL,'$2b$10$aY2CK8enEASS6vvq9xJRaOX4KGwwn66ECCgPLll9gimb.JpqV42ma','1661083254457-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:00:54','2022-08-21 12:00:54'),(18,15,'suravi dey3','inda saratpally jafala road','suravi.dey3@gmail.com',NULL,'$2b$10$tZDxvOe4gz4a60sD0ZqsYO2r1kru2kt/xAe9TjagQUhw9cCpwJ6q.','1661083271425-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:01:11','2022-08-21 12:01:11'),(19,16,'suravi ghosh','inda saratpally jafala road','suravi.ghosh@gmail.com',NULL,'$2b$10$c6RsN6ZoDl6Op1w5JTM2/ulzhY1xYEbKSZOEsEXSpj9a4MBLr3RRS','1661083296980-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:01:37','2022-08-21 12:01:37'),(20,16,'suravi ghosh1','inda saratpally jafala road','suravi.ghosh1@gmail.com',NULL,'$2b$10$Yj747dtkx57uJAMgVOpxL.Pm5mQw.g.niDnVGtnoDivfIQuXMs04m','1661083306050-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:01:46','2022-08-21 12:01:46'),(21,17,'suravi ghosh2','inda saratpally jafala road','suravi.ghosh2@gmail.com',NULL,'$2b$10$NOBnThRKFbaK1spQ3cYe5uTszXv6Y8CRD6SG3.5GgBT9zPYZbjSZC','1661083319117-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:01:59','2022-08-21 12:01:59'),(22,18,'suravi ghosh3','inda saratpally jafala road','suravi.ghosh3@gmail.com',NULL,'$2b$10$nL2S8u0PWgruZN4xOlL9l.EC1/rEdcrloQQM4c2ofroLFGGcIPkAq','1661083328941-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:02:09','2022-08-21 12:02:09'),(23,18,'suravi besa','inda saratpally jafala road','suravi.besa4@gmail.com',NULL,'$2b$10$kE/MpuPxYFahwEjnEIwkluhjT5f1fChLyF/8J4.gqVKKsfO3Ha8M2','1661083349662-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:02:29','2022-08-21 12:02:29'),(24,19,'aman kumar','inda saratpally jafala road','aman.kumar@gmail.com',NULL,'$2b$10$C7FQaI6/jf67887jmpaAfeQRSyimua9MKh1.F6zQcknAMeu9Rgzri','1661083376884-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:02:56','2022-08-21 12:02:56'),(25,19,'aman kumar1','inda saratpally jafala road','aman.kumar1@gmail.com',NULL,'$2b$10$4nvYKS/MvnmnCuL9NMDYP.Z4b3ufr7c0U3.jeQibYuy7a5E4x50I6','1661083394366-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:03:14','2022-08-21 12:03:14'),(26,20,'aman kumar2','inda saratpally jafala road','aman.kumar2@gmail.com',NULL,'$2b$10$f7MF2F7V6rI4UpRZrqlWge3vi0HWw2T1FNTwHbSmWMlRDh1TKGou.','1661083404251-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:03:24','2022-08-21 12:03:24'),(27,20,'aman bera','inda saratpally jafala road','aman.bera@gmail.com',NULL,'$2b$10$wNkSZq5QBD9mO5EkBjXqL.AHjMe1kfh9wEvNfSHqUyDcp.q1Bby2G','1661083448061-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:04:08','2022-08-21 12:04:08'),(28,21,'aman bera','inda saratpally jafala road','aman.bera1@gmail.com',NULL,'$2b$10$W4k5p/kCAedP3EzMd1chQeVFXiwXBcA1gFYTn/czjIO3sDABzs0mC','1661083461065-Screenshot from 2022-08-03 23-29-03.png','2022-08-21 12:04:21','2022-08-21 12:04:21');
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Psychiatrists`
--

DROP TABLE IF EXISTS `Psychiatrists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Psychiatrists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `Psychiatrists_ibfk_1` FOREIGN KEY (`hospitalId`) REFERENCES `Hospitals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Psychiatrists`
--

LOCK TABLES `Psychiatrists` WRITE;
/*!40000 ALTER TABLE `Psychiatrists` DISABLE KEYS */;
INSERT INTO `Psychiatrists` VALUES (1,'subham','subham24@gmail.com','$2b$10$CpspYmwSBJ6c0kOTn5zUZuj5AoyCY/U1av6w4mKs1P7/Vi9Yd0LNq',1,'2022-08-20 19:09:56','2022-08-20 19:09:56'),(2,'subhamugal','subhamungal241@gmail.com','$2b$10$RqiyjTygib1ly1THA9pekuU.G8filvAyNaNmrr/w56aI5zWXOo5iW',1,'2022-08-21 10:12:25','2022-08-21 10:12:25'),(3,'Sudeep Bose','sudeep.bose@gmail.com','$2b$10$QaadXmW.dcM.yIF7RH/iU.AyefL5Ivde8lDgCLz0GtmE4hSBj/.pC',1,'2022-08-21 11:40:41','2022-08-21 11:40:41'),(4,'Souvik Bose','souvik.bose@gmail.com','$2b$10$6ZAK.U1KkNDPlkqqfozoUeAiGKj.BNYGr.OPUvVhnKkIlMKreLyUa',1,'2022-08-21 11:41:05','2022-08-21 11:41:05'),(5,'john Doe','john.doe@gmail.com','$2b$10$sba7xnZYQ5nienx8z0.A9.9d6kB0vjVYcE80KXam5kYOYXrMwUYmW',1,'2022-08-21 11:41:41','2022-08-21 11:41:41'),(6,'jey horn','jey.horn@gmail.com','$2b$10$q82pe/s8x8ulqJR903.SrucrqRTGyimq0gM9ri6kbOj5HgPZnn6Be',1,'2022-08-21 11:42:16','2022-08-21 11:42:16'),(7,'subir sen','subir.sen@gmail.com','$2b$10$Q6QUSRH.idYQBHB24xCSPevkxb.1hDhkSewO9XI7HFhbn7RQuhOvS',2,'2022-08-21 11:43:38','2022-08-21 11:43:38'),(8,'sudeep sen','sudeep.sen@gmail.com','$2b$10$6EpmzTHbN8uJhh7/K7DAHe2tj5hsuE/b3/71rHazYdS.IKkpWaV8O',2,'2022-08-21 11:44:16','2022-08-21 11:44:16'),(9,'sneha sen','sneha.sen@gmail.com','$2b$10$2BEO8Dba5tWcwiick7wB2Os6Xl5kHvKp5txtu7teF2ShbD.3KcfTa',2,'2022-08-21 11:44:34','2022-08-21 11:44:34'),(10,'sahil bera','sahil.bera@gmail.com','$2b$10$w/URWVXM8aqQUvyRHT0yy.cwMsQQdr.4vb26HqjCLaG0KSa/keCky',2,'2022-08-21 11:45:04','2022-08-21 11:45:04'),(11,'sounak bera','sounak.bera@gmail.com','$2b$10$Bexc6iWK4ofrwkLrQh2cjeFE7L7DXcltS6xflTcLsyBByJV6EXZQm',2,'2022-08-21 11:45:42','2022-08-21 11:45:42'),(12,'anchit bera','anchit.bera@gmail.com','$2b$10$0fB7KBGfbHboORTwjGO17e5i6UPY5//82kkLvUlEFQM0z81zA1n8O',3,'2022-08-21 11:46:20','2022-08-21 11:46:20'),(13,'avik bera','avik.bera@gmail.com','$2b$10$xWj9g75ly4VNWTwd5vZoKeO77QLdCwTvz3NMakuqFHw8O81zFqX4S',3,'2022-08-21 11:46:37','2022-08-21 11:46:37'),(14,'girish dey','girish.dey@gmail.com','$2b$10$cdgDVclDaBPGt7q4tzc5Se9sS9pgE6LaLUyHJx4xJ0HdIPrZLy1.a',3,'2022-08-21 11:47:22','2022-08-21 11:47:22'),(15,'mousam dey','mousam.dey@gmail.com','$2b$10$MrjunC5OjNUOIxNdIEEtLek2GKDaE4ID6y02dHBh7mGqpQYCPUutG',3,'2022-08-21 11:47:40','2022-08-21 11:47:40'),(16,'mrinal dey','mrinal.dey@gmail.com','$2b$10$ohxgzvrX1s5L6WIycu7F4.mRktNDkCdod9Oj0b21p.Q9as5dnJYie',3,'2022-08-21 11:48:13','2022-08-21 11:48:13'),(17,'souvik bera','souvik.bera@gmail.com','$2b$10$nunXtSC9.i63WaakHHmGZOaD5Yo2VsxAyOJgsDyL4LCoxemq.M9Re',4,'2022-08-21 11:49:09','2022-08-21 11:49:09'),(18,'sudha bea','sudha.bera@gmail.com','$2b$10$DPoTlUYEB.3doPrLFMl4Ceyql.I2K4oIXkMSrzJVHWZEmSVZ57HFe',4,'2022-08-21 11:49:30','2022-08-21 11:49:30'),(19,'sikha das','sikha.das@gmail.com','$2b$10$KVaIM5JS.lW7voaufVfJ1eHpgAVzH1hfoudwYBlNEi/FzOxIcZl.6',4,'2022-08-21 11:50:12','2022-08-21 11:50:12'),(20,'maya das','maya.das@gmail.com','$2b$10$rmydTxkqiH/v0gvE7l9LMeLEgoGDADAJAQxCaEoAyv0dJ0px65dRS',4,'2022-08-21 11:50:28','2022-08-21 11:50:28'),(21,'mayak das','mayak.das@gmail.com','$2b$10$lfZ4GYjxvIc0.FJWeQQQG.3hGqVLRoksBzNeStWLYMkJKK8Xqc4NC',4,'2022-08-21 11:50:45','2022-08-21 11:50:45');
/*!40000 ALTER TABLE `Psychiatrists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20220819074240-create-hospital.js'),('20220819084219-create-psychiatrist.js'),('20220819084532-create-patient.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-21 17:59:07
