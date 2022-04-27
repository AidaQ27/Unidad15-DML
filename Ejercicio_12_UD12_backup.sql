CREATE DATABASE  IF NOT EXISTS `software` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `software`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.145    Database: software
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
-- Table structure for table `ejercer`
--

DROP TABLE IF EXISTS `ejercer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_profesion` varchar(40) NOT NULL,
  `codigo_trabajador` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_profesion` (`codigo_profesion`),
  KEY `codigo_trabajador` (`codigo_trabajador`),
  CONSTRAINT `ejercer_ibfk_1` FOREIGN KEY (`codigo_profesion`) REFERENCES `profesion` (`codigo_profesion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ejercer_ibfk_2` FOREIGN KEY (`codigo_trabajador`) REFERENCES `trabajador` (`codigo_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercer`
--

LOCK TABLES `ejercer` WRITE;
/*!40000 ALTER TABLE `ejercer` DISABLE KEYS */;
INSERT INTO `ejercer` VALUES (1,'P1','t229'),(2,'P1','t230'),(3,'P2','t230'),(4,'P3','t231');
/*!40000 ALTER TABLE `ejercer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `codigo_interno_empresa` varchar(40) NOT NULL,
  `cif` varchar(15) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_interno_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('250E','02132682F','KopEro','Calle:/Bertr nr 2','648747512'),('350A','24508352N','CochesPesla','Calle:/ABC nr 32','+3458585858'),('450A','76958039Q','LIOEP','Calle:/Abcde nr 12','+3458599958'),('700B','93305740F','IonJuanAsociados','Calle:/Aper nr 2','625254512');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion` (
  `codigo_profesion` varchar(5) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_profesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES ('P1','Programador',NULL),('P2','Diseñador',NULL),('P3','Jefe Equipo',NULL);
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `codigo_interno_empresa` varchar(40) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_provisional` date NOT NULL,
  `fecha_finalizado` date DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `codigo_interno_empresa` (`codigo_interno_empresa`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`codigo_interno_empresa`) REFERENCES `empresa` (`codigo_interno_empresa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (1,'250E','2022-07-26','2022-09-01',NULL),(2,'350A','2022-04-26','2022-05-26',NULL),(3,'350A','2022-05-26','2022-06-26',NULL);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `codigo_trabajador` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `dni` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_trabajador`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES ('t229','Juan','El trabajador Juan','88278774J'),('t230','Antonio','El trabajador Antonio','86260157Z'),('t231','Pepe','El trabajador Pepe','04278667T');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajar`
--

DROP TABLE IF EXISTS `trabajar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `codigo_trabajador` varchar(40) NOT NULL,
  `horas_trabajadas` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `codigo_trabajador` (`codigo_trabajador`),
  CONSTRAINT `trabajar_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trabajar_ibfk_2` FOREIGN KEY (`codigo_trabajador`) REFERENCES `trabajador` (`codigo_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajar`
--

LOCK TABLES `trabajar` WRITE;
/*!40000 ALTER TABLE `trabajar` DISABLE KEYS */;
INSERT INTO `trabajar` VALUES (1,1,'t229',0),(2,2,'t230',0),(3,3,'t231',20);
/*!40000 ALTER TABLE `trabajar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 15:54:07
