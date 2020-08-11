CREATE DATABASE  IF NOT EXISTS `9to6coding` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `9to6coding`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 9to6coding
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_num` varchar(45) NOT NULL,
  `msg` longtext NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`sno`),
  UNIQUE KEY `time_UNIQUE` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'kumar','kumar@yahoo.com','78963214563','Hi',NULL),(2,'sanjit','sanjit.mtmt@gmail.com','7532145698745','hi..testing',NULL),(3,'hi','hi@gmail.com','74125896325','testing date and time column','2020-08-04 18:20:20'),(4,'anjali','anjali@gmail.com','789654123123','Hi','2020-08-04 18:41:44'),(5,'kumari','anjali','anjali@gmail.com','testing mail for Gmail.','2020-08-04 20:52:29'),(6,'sanjit kumar','sanjit@gmail.com','4563258789','testing','2020-08-04 20:54:56'),(7,'sanjit kumar','sanjit@gmail.com','7896355412','test','2020-08-04 20:55:50'),(8,'sanjit kumar','sanjit@gmail.com','7896355412','test','2020-08-04 20:58:15'),(9,'anjali','anjali@gmail.com','7896355412','testing','2020-08-04 21:00:06'),(10,'sanjit kumar','myselfsanjit@gmail.com','08800338245','this ia fdsndskjn','2020-08-04 21:02:01'),(11,'aarush','pihu','yush','mail testing','2020-08-04 21:05:01'),(12,'name','email@gmail.com','789654','testing mail ','2020-08-04 21:06:49'),(13,'sanjit kumar','myselfsanjit@gmail.com','08800338245','testing mail','2020-08-04 21:42:41'),(14,'yush','yush@gmail.com','9752656556','hi','2020-08-08 17:22:38'),(15,'sanjit kumar','myselfsanjit@gmail.com','08800338245','fgfdgd','2020-08-08 18:50:49'),(16,'sanjit kumar','myselfsanjit@gmail.com','08800338245','ghtyht','2020-08-08 18:55:29');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 20:29:56
