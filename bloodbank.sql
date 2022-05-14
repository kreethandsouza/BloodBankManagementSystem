CREATE DATABASE  IF NOT EXISTS `bbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bbms`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bbms
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bloodbank`
--

DROP TABLE IF EXISTS `bloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodbank` (
  `bbid` int NOT NULL,
  `bblocation` varchar(20) DEFAULT NULL,
  `bbphno` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`bbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank`
--

LOCK TABLES `bloodbank` WRITE;
/*!40000 ALTER TABLE `bloodbank` DISABLE KEYS */;
INSERT INTO `bloodbank` VALUES (100,'bangalore',9652314524),(200,'mangalore',9458231256),(300,'karwar',9564523258),(400,'mulki',9564258754),(500,'hampi',9458652356),(600,'manipal',5624896321),(700,'karkala',5846321892),(800,'juhu',951235784),(900,'moodbidri',8563214567),(1000,'mumbai',7521489321);
/*!40000 ALTER TABLE `bloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodrequired`
--

DROP TABLE IF EXISTS `bloodrequired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodrequired` (
  `brid` int NOT NULL,
  `patientid` int DEFAULT NULL,
  `bloodtype` varchar(10) DEFAULT NULL,
  `units` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`brid`),
  KEY `bloodtype` (`bloodtype`),
  CONSTRAINT `bloodrequired_ibfk_1` FOREIGN KEY (`bloodtype`) REFERENCES `stockdetails` (`bloodtype`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodrequired`
--

LOCK TABLES `bloodrequired` WRITE;
/*!40000 ALTER TABLE `bloodrequired` DISABLE KEYS */;
INSERT INTO `bloodrequired` VALUES (100,4,'A-',2,'2021-01-25'),(200,4,'A-',6,'2021-09-15'),(300,7,'AB+',3,'2021-04-19'),(400,10,'AB+',4,'2021-05-11'),(500,8,'A+',7,'2021-09-05');
/*!40000 ALTER TABLE `bloodrequired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donorid` int NOT NULL,
  `donorname` varchar(20) DEFAULT NULL,
  `donormobile` decimal(10,0) DEFAULT NULL,
  `donoraddress` varchar(50) DEFAULT NULL,
  `bloodtype` varchar(10) DEFAULT NULL,
  `units` int DEFAULT NULL,
  PRIMARY KEY (`donorid`),
  KEY `bloodtype` (`bloodtype`),
  CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`bloodtype`) REFERENCES `stockdetails` (`bloodtype`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (10,'Akansha',8956428756,'hassan','A+',5),(20,'Balan',7548694852,'kavoor','B+',4),(30,'Charishma',9985647854,'Alangar','A-',5),(40,'Dhruv',5641238596,'Kundapur','A-',8),(50,'elina',7562489652,'Yeshwanthpur','B+',6);
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientid` int NOT NULL,
  `patientname` varchar(20) DEFAULT NULL,
  `patientmobile` decimal(10,0) DEFAULT NULL,
  `patientaddress` varchar(50) DEFAULT NULL,
  `bloodtype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`patientid`),
  KEY `bloodtype` (`bloodtype`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`bloodtype`) REFERENCES `stockdetails` (`bloodtype`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Ashish',8954562312,'mangalore','A+'),(2,'Bunty',6523254789,'manipal','B+'),(3,'Chagan',5623145962,'karwar','AB+'),(4,'Darshan',9874562458,'bangalore','A-'),(5,'Ellen',6321147852,'Hubli,','AB-');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockdetails`
--

DROP TABLE IF EXISTS `stockdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockdetails` (
  `bloodtype` varchar(10) NOT NULL,
  `units` int DEFAULT NULL,
  `bbid` int DEFAULT NULL,
  PRIMARY KEY (`bloodtype`),
  KEY `bbid` (`bbid`),
  CONSTRAINT `stockdetails_ibfk_1` FOREIGN KEY (`bbid`) REFERENCES `bloodbank` (`bbid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockdetails`
--

LOCK TABLES `stockdetails` WRITE;
/*!40000 ALTER TABLE `stockdetails` DISABLE KEYS */;
INSERT INTO `stockdetails` VALUES ('A-',591,300),('A+',487,100),('AB-',440,500),('AB+',429,500),('B-',786,200),('B+',745,200),('O-',700,100),('O+',400,400);
/*!40000 ALTER TABLE `stockdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bbms'
--

--
-- Dumping routines for database 'bbms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 13:54:02
