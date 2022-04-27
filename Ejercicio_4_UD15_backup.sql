CREATE DATABASE  IF NOT EXISTS `grandes_almacenes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grandes_almacenes`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.48    Database: grandes_almacenes
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
-- Table structure for table `cajeros`
--

DROP TABLE IF EXISTS `cajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajeros` (
  `codigo_cajero` int NOT NULL AUTO_INCREMENT,
  `nom_apels` varchar(255) NOT NULL,
  PRIMARY KEY (`codigo_cajero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajeros`
--

LOCK TABLES `cajeros` WRITE;
/*!40000 ALTER TABLE `cajeros` DISABLE KEYS */;
INSERT INTO `cajeros` VALUES (1,'Maria Mendéz'),(2,'Juan Ochoa'),(3,'Sergio Mesa'),(4,'Trinidad Perez'),(5,'David Abelló'),(6,'Ines Bonet'),(7,'Cristian Imbernon'),(8,'Maria Jose Oporto'),(9,'Cristina Parisi'),(10,'Noa Farik');
/*!40000 ALTER TABLE `cajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina_resgistradora`
--

DROP TABLE IF EXISTS `maquina_resgistradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina_resgistradora` (
  `id_maquina` int NOT NULL AUTO_INCREMENT,
  `piso` int NOT NULL,
  PRIMARY KEY (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina_resgistradora`
--

LOCK TABLES `maquina_resgistradora` WRITE;
/*!40000 ALTER TABLE `maquina_resgistradora` DISABLE KEYS */;
INSERT INTO `maquina_resgistradora` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `maquina_resgistradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`codigo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Americana mujer',100),(2,'Americana hombre',100),(3,'Pantalon Palazzo',50),(4,'Pantalon Skinny',45),(5,'Pantalon Slimfit',45),(6,'Vestido Doots',60),(7,'Vestido Plisado',65),(8,'Camiseta Lurex',25),(9,'Camiseta Basic',24),(10,'Parka blue',70);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `codigo_cajero` int NOT NULL,
  `codigo_producto` int NOT NULL,
  `id_maquina` int NOT NULL,
  PRIMARY KEY (`codigo_cajero`,`codigo_producto`,`id_maquina`),
  KEY `codigo_producto` (`codigo_producto`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`codigo_cajero`) REFERENCES `cajeros` (`codigo_cajero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_maquina`) REFERENCES `maquina_resgistradora` (`id_maquina`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,8),(2,1,3),(2,2,5),(3,2,2),(1,4,4),(5,4,3),(5,4,9),(7,5,1),(4,6,6),(9,7,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 15:57:04
