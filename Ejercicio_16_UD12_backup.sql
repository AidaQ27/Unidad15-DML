CREATE DATABASE  IF NOT EXISTS `twitter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `twitter`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.171    Database: twitter
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
-- Table structure for table `Cuenta`
--

DROP TABLE IF EXISTS `Cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuenta` (
  `Usuario` varchar(40) NOT NULL,
  `CONTRASEÑA` varchar(20) NOT NULL,
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta`
--

LOCK TABLES `Cuenta` WRITE;
/*!40000 ALTER TABLE `Cuenta` DISABLE KEYS */;
INSERT INTO `Cuenta` VALUES ('JavierElLoco','1234'),('Juanillo12','BootCamp2022'),('Miguel34','miguelito1999'),('Pepito23','Albaricoque'),('Vanesa99','4321');
/*!40000 ALTER TABLE `Cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enviar`
--

DROP TABLE IF EXISTS `Enviar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enviar` (
  `IdEnviar` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(40) NOT NULL,
  `IdMensaje` int DEFAULT NULL,
  PRIMARY KEY (`IdEnviar`),
  KEY `Usuario` (`Usuario`),
  KEY `IdMensaje` (`IdMensaje`),
  CONSTRAINT `Enviar_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`),
  CONSTRAINT `Enviar_ibfk_2` FOREIGN KEY (`IdMensaje`) REFERENCES `Mensaje` (`IdMensaje`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enviar`
--

LOCK TABLES `Enviar` WRITE;
/*!40000 ALTER TABLE `Enviar` DISABLE KEYS */;
INSERT INTO `Enviar` VALUES (1,'Vanesa99',1),(2,'Pepito23',2),(3,'Vanesa99',3);
/*!40000 ALTER TABLE `Enviar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensaje`
--

DROP TABLE IF EXISTS `Mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mensaje` (
  `IdMensaje` int NOT NULL AUTO_INCREMENT,
  `Destinatario` varchar(20) DEFAULT NULL,
  `Texto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdMensaje`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensaje`
--

LOCK TABLES `Mensaje` WRITE;
/*!40000 ALTER TABLE `Mensaje` DISABLE KEYS */;
INSERT INTO `Mensaje` VALUES (1,'Pepito23','Hola Pepe. ¿Que tal estas?'),(2,'Vanesa99','¿Te apetece quedar mañana?'),(3,'JavierElLoco','Muchas gracias por tu ayuda Javier');
/*!40000 ALTER TABLE `Mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificación`
--

DROP TABLE IF EXISTS `Notificación`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Notificación` (
  `IdNotificación` int NOT NULL AUTO_INCREMENT,
  `Comentarios` varchar(255) DEFAULT NULL,
  `TweetsFavoritos` varchar(255) DEFAULT NULL,
  `Retweets` varchar(255) DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`IdNotificación`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Notificación_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificación`
--

LOCK TABLES `Notificación` WRITE;
/*!40000 ALTER TABLE `Notificación` DISABLE KEYS */;
INSERT INTO `Notificación` VALUES (1,'Vanesa99 comentó tu tweet','A Pepito23 le gusta tu tweet','Juanillo12 hizo retweet','JavierElLoco'),(2,'Pepito23 comentó tu tweet','A JavierElLoco le gusta tu tweet','Vanesa99 hizo retweet','Juanillo12'),(3,'Juanillo12 comentó tu tweet','A Pepito23 le gusta tu tweet','JavierElLoco hizo retweet','Vanesa99');
/*!40000 ALTER TABLE `Notificación` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perfil`
--

DROP TABLE IF EXISTS `Perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perfil` (
  `Nick` varchar(20) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Seguidores` int DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`Nick`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Perfil_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perfil`
--

LOCK TABLES `Perfil` WRITE;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
INSERT INTO `Perfil` VALUES ('JavierElLoco','Javier','Martinez',2000,'JavierElLoco'),('Juanillo12','Juan','Martin',400,'Juanillo12'),('Pepito23','Pepe','Garcia',250,'Pepito23'),('Vanesa99','Vanesa','Ramirez',1000,'Vanesa99');
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tweet`
--

DROP TABLE IF EXISTS `Tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tweet` (
  `IdTweet` int NOT NULL AUTO_INCREMENT,
  `Texto` varchar(255) DEFAULT NULL,
  `Comentario` varchar(255) DEFAULT NULL,
  `Usuario` varchar(40) NOT NULL,
  PRIMARY KEY (`IdTweet`),
  KEY `Usuario` (`Usuario`),
  CONSTRAINT `Tweet_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `Cuenta` (`Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tweet`
--

LOCK TABLES `Tweet` WRITE;
/*!40000 ALTER TABLE `Tweet` DISABLE KEYS */;
INSERT INTO `Tweet` VALUES (1,'Hoy he tenido el mejor dia que recuerdo','','Pepito23'),(2,'Buen partido del Valencia, una lastima perder por penaltis','','JavierElLoco'),(3,'He empezado hoy un BootCamp de Programación y estoy muy contenta y animada','','Vanesa99');
/*!40000 ALTER TABLE `Tweet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 10:04:02
