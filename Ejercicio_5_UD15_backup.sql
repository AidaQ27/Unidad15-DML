CREATE DATABASE  IF NOT EXISTS `Investigadores` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Investigadores`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.171    Database: Investigadores
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `Equipos`
--

DROP TABLE IF EXISTS `Equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipos` (
  `NumSerie` char(4) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `CodigoFacultad` int DEFAULT NULL,
  PRIMARY KEY (`NumSerie`),
  KEY `CodigoFacultad` (`CodigoFacultad`),
  CONSTRAINT `Equipos_ibfk_1` FOREIGN KEY (`CodigoFacultad`) REFERENCES `Facultad` (`CodigoFacultad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipos`
--

LOCK TABLES `Equipos` WRITE;
/*!40000 ALTER TABLE `Equipos` DISABLE KEYS */;
INSERT INTO `Equipos` VALUES ('1A','Medicos',1),('1B','Artistas',5),('1C','Ingeniero',9),('2A','Economistas',2),('2B','Arquitectos',6),('2C','Filosofo',10),('3A','Abogados',3),('3B','Administrativos',7),('4A','Cientificos',4),('4B','Políticos',8);
/*!40000 ALTER TABLE `Equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facultad`
--

DROP TABLE IF EXISTS `Facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facultad` (
  `CodigoFacultad` int NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodigoFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facultad`
--

LOCK TABLES `Facultad` WRITE;
/*!40000 ALTER TABLE `Facultad` DISABLE KEYS */;
INSERT INTO `Facultad` VALUES (1,'Facultad Medicina'),(2,'Facultad Economica'),(3,'Facultad Derecho'),(4,'Facultad Ciencias'),(5,'Facultad Artes y Diseño'),(6,'Facultad Arquitectura'),(7,'Facultad Contaduría y Administración'),(8,'Facultad Ciencias Políticas y Sociales'),(9,'Facultad Ingenieria'),(10,'Filosofía y Letras');
/*!40000 ALTER TABLE `Facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Investigadores`
--

DROP TABLE IF EXISTS `Investigadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Investigadores` (
  `DNI` varchar(10) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `CodigoFacultad` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `CodigoFacultad` (`CodigoFacultad`),
  CONSTRAINT `Investigadores_ibfk_1` FOREIGN KEY (`CodigoFacultad`) REFERENCES `Facultad` (`CodigoFacultad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Investigadores`
--

LOCK TABLES `Investigadores` WRITE;
/*!40000 ALTER TABLE `Investigadores` DISABLE KEYS */;
INSERT INTO `Investigadores` VALUES ('35066781A','Carmen Rodriguez',2),('35837362V','Mariano Sánchez',1),('35877246I','Nuria Porras',3),('35982744Y','Pilar Frutos',4),('39546238L','Manolo Lama',4),('39654327V','Aida Queralt',5),('39862634K','Juanjo Garcia',2),('39886724J','Laia Montero',3),('39947367P','Maria Jimeno',1),('41948855E','Jose Trigueros',5);
/*!40000 ALTER TABLE `Investigadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `IdReserva` int NOT NULL,
  `DNI` varchar(10) DEFAULT NULL,
  `NumSerie` char(4) DEFAULT NULL,
  `Comienzo` date DEFAULT NULL,
  `Fin` date DEFAULT NULL,
  PRIMARY KEY (`IdReserva`),
  KEY `DNI` (`DNI`),
  KEY `NumSerie` (`NumSerie`),
  CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `Investigadores` (`DNI`),
  CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`NumSerie`) REFERENCES `Equipos` (`NumSerie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
INSERT INTO `Reserva` VALUES (1,'39947367P','1A','2021-09-12','2022-05-20'),(2,'39862634K','2A','2021-09-10','2022-05-22'),(3,'39886724J','3A','2021-09-07','2022-05-15'),(4,'39546238L','4A','2021-09-01','2022-06-20'),(5,'39654327V','1B','2021-10-02','2022-04-22'),(6,'35837362V','2B','2021-09-05','2022-04-27'),(7,'35877246I','3A','2021-08-02','2022-06-21'),(8,'41948855E','4A','2021-09-08','2022-05-05'),(9,'35982744Y','1C','2021-09-10','2022-05-10'),(10,'35066781A','2C','2021-09-12','2022-05-13');
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 14:23:17
