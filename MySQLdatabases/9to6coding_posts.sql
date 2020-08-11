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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_date` datetime NOT NULL,
  `img_file` varchar(45) DEFAULT 'img.png',
  `meta_title` varchar(255) DEFAULT '9to6coding title',
  `meta_description` varchar(255) DEFAULT '9to6coding description',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'This is my 1st post title-msg','post-1','this is my 1st post. i am happy.In computing, plain text is a loose term for data (e.g. file contents) that represent only characters of readable material but not its graphical representation nor other objects (floating-point numbers, images, etc.). It may also include a limited number of characters that control simple arrangement of text, such as spaces, line breaks, or tabulation characters (although tab characters can \"mean\" many different things, so are hardly \"plain\"). Plain text is different from formatted text, where style information is included; from structured text, where structural parts of the document such as paragraphs, sections, and the like are identified; and from binary files in which some portions must be interpreted as binary objects (encoded integers, real numbers, images, etc.).','2020-08-04 18:20:20','about-bg.jpg','meta title for posr 1','meta description for post 1'),(16,'testing html format','testing-html-format','<h1>Hello</h1>\r\n<h2>Hello</h2>\r\n<h3>Hello</h3>\r\n<h4>Hello</h4>\r\n<h5>Hello</h5>\r\n<h6>Hello</h6>','2020-08-07 23:42:22','img.png','meta title post 3','meta description here'),(17,'new post','new-post','new post for meta title and meta descriptiion','2020-08-08 23:42:22','img.png','meta title post 4','description post 4'),(18,'testing meta title','testing-metas-title','testing meta title testing meta title testing meta title testing meta titletesting meta titletesting meta title ','2020-08-09 19:04:17','','testing metas title',''),(19,'testing meta descriptions testing meta descriptions','testing-meta-descriptions','testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions testing meta descriptions ','2020-08-09 19:05:07','img.png','','testing meta descriptions'),(20,'testing both meta','testing-both-meta','testing both meta testing both meta testing both meta testing both meta testing both meta testing both meta testing both <a href=\"#\">meta testing</a> both meta testing both meta testing both meta testing both meta testing both meta testing both meta testing both meta testing both meta testing both meta ','2020-08-09 19:05:51','','testing both meta','testing both meta'),(21,'no meta','no-meta','no meta no meta  no meta no meta no meta no meta no meta no meta no meta no meta no meta ','2020-08-09 19:14:12','','',''),(22,'testing html','testing-html','<h1>Hello</h1> \r\n<h2>Hello</h2> <br>\r\n<h3>Hello</h3> <br>\r\n<h4>Hello</h4> <br>\r\n<h5>Hello</h5> <br>\r\n<h6>Hello</h6>','2020-08-09 19:41:25','','testing html','testing html');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-11 20:29:55
