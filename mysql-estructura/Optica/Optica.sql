CREATE DATABASE  IF NOT EXISTS `Optica Cul d'Ampolla` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `Optica Cul d'Ampolla`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Optica Cul d'Ampolla
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adreça`
--

DROP TABLE IF EXISTS `Adreça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Adreça` (
  `id_Adreça` int(11) NOT NULL AUTO_INCREMENT,
  `carrer` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `porta` varchar(45) NOT NULL,
  `ciutat` varchar(25) NOT NULL,
  `codi_postal` int(11) NOT NULL,
  `pais` varchar(15) NOT NULL,
  PRIMARY KEY (`id_Adreça`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adreça`
--

LOCK TABLES `Adreça` WRITE;
/*!40000 ALTER TABLE `Adreça` DISABLE KEYS */;
INSERT INTO `Adreça` VALUES (1,'Fontana',43,1,'1','Barcelona',8020,'Espanya'),(2,'Menta',3,1,'baix','La Roca del Vallès',8430,'Espanya'),(3,'Espinal',22,6,'4','El Masnou',8320,'Espanya'),(4,'Enamorats',52,3,'1','SªMªPalautordera',8460,'Espanya'),(5,'Bruc',235,4,'A','Argentona',8310,'Espanya'),(6,'Granados',17,8,'2','Montmeló',8160,'Espanya'),(7,'Aribau',153,5,'C','Premià de Mar',8330,'Espanya');
/*!40000 ALTER TABLE `Adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Client` (
  `id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `data_alta` date NOT NULL,
  `id_Adreça` int(11) NOT NULL,
  `id_Client1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Client`),
  KEY `fk_Client3_idx` (`id_Client1`),
  KEY `fk_Adreça2_idx` (`id_Adreça`),
  CONSTRAINT `fk_Adreça2` FOREIGN KEY (`id_Adreça`) REFERENCES `adreça` (`id_adreça`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Òscar',617888689,'oscar@gmail.com','2022-09-29',1,NULL),(2,'Minerva',662491233,'minerva@hotmai..com','2023-01-12',6,1),(3,'Nerea',664523991,'nerea@yahoo.es','2023-02-14',4,1),(4,'Irune',616892443,'irune@yahoo.es','2022-04-22',5,2),(5,'Toni',602334412,'toni@gmail.com','2023-01-12',6,NULL),(6,'Enrique',600845483,'enric@yahoo.es','2022-03-08',3,3),(7,'Albert',656143653,'albert@hotmail.com','2022-04-22',6,2);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleat`
--

DROP TABLE IF EXISTS `Empleat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Empleat` (
  `id_Empleat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  PRIMARY KEY (`id_Empleat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleat`
--

LOCK TABLES `Empleat` WRITE;
/*!40000 ALTER TABLE `Empleat` DISABLE KEYS */;
INSERT INTO `Empleat` VALUES (1,'Òscar'),(2,'Ana'),(3,'Josep');
/*!40000 ALTER TABLE `Empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Marca` (
  `id_Marca` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `id_Proveidor` int(11) NOT NULL,
  PRIMARY KEY (`id_Marca`),
  KEY `fk_Proveidor1_idx` (`id_Proveidor`),
  CONSTRAINT `fk_Proveidor1` FOREIGN KEY (`id_Proveidor`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'Nike',2),(2,'D&G',1),(3,'Carrera',1),(4,'Ray Ban',2),(5,'Police',2);
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveidor`
--

DROP TABLE IF EXISTS `Proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Proveidor` (
  `id_Proveidor` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(15) NOT NULL,
  `id_Adreça` int(11) NOT NULL,
  PRIMARY KEY (`id_Proveidor`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  KEY `fk_Adreça1_idx` (`id_Adreça`),
  CONSTRAINT `fk_Adreça1` FOREIGN KEY (`id_Adreça`) REFERENCES `adreça` (`id_adreça`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveidor`
--

LOCK TABLES `Proveidor` WRITE;
/*!40000 ALTER TABLE `Proveidor` DISABLE KEYS */;
INSERT INTO `Proveidor` VALUES (1,'Opticalia',934692122,934692123,'J-87834566',2),(2,'Varilux',937517788,937517789,'B-64351832',7);
/*!40000 ALTER TABLE `Proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ulleres`
--

DROP TABLE IF EXISTS `Ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Ulleres` (
  `id_Ulleres` int(11) NOT NULL AUTO_INCREMENT,
  `graduacio_vidre_dret` int(11) NOT NULL,
  `graduacio_vidre_esquerre` int(11) NOT NULL,
  `tipus_muntura` char(1) NOT NULL COMMENT 'Tenia a quests tipus de muntura:\\nF = Flotant\\nP = Pasta\\nM = Metàl·lica',
  `color_muntura` varchar(15) NOT NULL,
  `color_vidre_dret` varchar(15) NOT NULL,
  `color_vidre_esquerre` varchar(45) NOT NULL,
  `preu` double NOT NULL,
  `id_Proveidor` int(11) NOT NULL,
  `id_Marca` varchar(15) NOT NULL,
  PRIMARY KEY (`id_Ulleres`),
  KEY `fk_Proveidor2_idx` (`id_Proveidor`),
  KEY `fk_Marca1_idx` (`id_Marca`),
  CONSTRAINT `fk_Proveidor2` FOREIGN KEY (`id_Proveidor`) REFERENCES `proveidor` (`id_proveidor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ulleres`
--

LOCK TABLES `Ulleres` WRITE;
/*!40000 ALTER TABLE `Ulleres` DISABLE KEYS */;
INSERT INTO `Ulleres` VALUES (1,0,1,'F','vermella','rosa','rosa',125,1,'3'),(2,1,1,'M','alumini','negre','negre',150,1,'3'),(3,0,2,'F','marró','beig','beig',90,2,'4'),(4,1,0,'F','negre','blau','blau',225,1,'2'),(5,0,0,'P','negre','gris','gris',230,2,'5'),(6,0,0,'P','groga','gris','gris',150,2,'1'),(7,0,0,'M','multicolor','negre','negre',105,2,'1');
/*!40000 ALTER TABLE `Ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Venta` (
  `id_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `data_venta` date NOT NULL,
  `id_Client` int(11) NOT NULL,
  `id_Empleat` int(11) NOT NULL,
  `id_Ulleres` int(11) NOT NULL,
  PRIMARY KEY (`id_Venta`),
  KEY `fk_Empleat2_idx` (`id_Empleat`),
  KEY `fk_Client2_idx` (`id_Client`),
  KEY `fk_Ulleres3_idx` (`id_Ulleres`),
  CONSTRAINT `fk_Client2` FOREIGN KEY (`id_Client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleat2` FOREIGN KEY (`id_Empleat`) REFERENCES `empleat` (`id_empleat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Ulleres3` FOREIGN KEY (`id_Ulleres`) REFERENCES `ulleres` (`id_ulleres`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
INSERT INTO `Venta` VALUES (1,'2022-09-29',2,2,3),(2,'2022-03-05',1,2,2),(3,'2022-02-13',5,1,5),(4,'2022-05-23',4,3,6),(5,'2022-07-15',7,3,7);
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-30 21:21:22
