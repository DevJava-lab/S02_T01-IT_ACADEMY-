CREATE DATABASE  IF NOT EXISTS `Pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `Pizzeria`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Pizzeria
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
  `carrer` varchar(15) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pis` varchar(3) DEFAULT NULL,
  `codi_postal` int(11) NOT NULL,
  `localitat` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Adreça`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adreça`
--

LOCK TABLES `Adreça` WRITE;
/*!40000 ALTER TABLE `Adreça` DISABLE KEYS */;
INSERT INTO `Adreça` VALUES (1,'Fontana',43,'1',8020,'Barcelona','Barcelona'),(2,'Menta',3,'5',8430,'La Roca del Vallès','Barcelona'),(3,'Espinal',22,'4',8320,'El Masnou','Barcelona'),(4,'Enamorats',52,'1',8460,'SªMªPalautordera','Barcelona'),(5,'Bruc',235,'6',8310,'Argentona','Barcelona'),(6,'Granados',17,'2',8160,'Montmeló','Barcelona'),(7,'Aribau',153,'4',8330,'Premià de Mar','Barcelona');
/*!40000 ALTER TABLE `Adreça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Beguda`
--

DROP TABLE IF EXISTS `Beguda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Beguda` (
  `id_Beguda` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `descripcio` varchar(20) NOT NULL,
  `imatge` blob,
  `preu` double NOT NULL,
  PRIMARY KEY (`id_Beguda`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beguda`
--

LOCK TABLES `Beguda` WRITE;
/*!40000 ALTER TABLE `Beguda` DISABLE KEYS */;
INSERT INTO `Beguda` VALUES (1,'Coca-cola','refresc','',1.5),(2,'Pepsi-cola','refresc','',1.4),(3,'Sprite','refresc','',1.45),(4,'Cervessa','alcohol','',1.75),(5,'Aigua','refresc','',0.5),(6,'Sweppes','refresc','',1.2);
/*!40000 ALTER TABLE `Beguda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Botiga`
--

DROP TABLE IF EXISTS `Botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Botiga` (
  `id_Botiga` int(11) NOT NULL AUTO_INCREMENT,
  `carrer` varchar(45) NOT NULL,
  `codi_postal` int(11) NOT NULL,
  `localitat` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Botiga`),
  UNIQUE KEY `carrer_UNIQUE` (`carrer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Botiga`
--

LOCK TABLES `Botiga` WRITE;
/*!40000 ALTER TABLE `Botiga` DISABLE KEYS */;
INSERT INTO `Botiga` VALUES (1,'Nàpols',8020,'Barcelona','Barcelona'),(2,'Menta',8430,'La Roca del Vallès','Barcelona'),(3,'Milano',8320,'El Masnou','Barcelona');
/*!40000 ALTER TABLE `Botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria_Pizza`
--

DROP TABLE IF EXISTS `Categoria_Pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Categoria_Pizza` (
  `id_Categoria_Pizza` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `id_Pizza` int(11) NOT NULL,
  PRIMARY KEY (`id_Categoria_Pizza`),
  KEY `fk_Pizza1_idx` (`id_Pizza`),
  CONSTRAINT `fk_Pizza1` FOREIGN KEY (`id_Pizza`) REFERENCES `pizza` (`id_pizza`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria_Pizza`
--

LOCK TABLES `Categoria_Pizza` WRITE;
/*!40000 ALTER TABLE `Categoria_Pizza` DISABLE KEYS */;
INSERT INTO `Categoria_Pizza` VALUES (1,'Vegetal',1),(2,'Vegetal',5),(3,'Carn',2),(4,'Carn',3),(5,'Carn',6),(6,'Peix',4);
/*!40000 ALTER TABLE `Categoria_Pizza` ENABLE KEYS */;
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
  `cognom_1` varchar(15) NOT NULL COMMENT 'Primer cognom',
  `cognom_2` varchar(15) NOT NULL COMMENT 'Segon cognom',
  `telefon` int(11) NOT NULL,
  `id_Adreça` int(11) NOT NULL,
  PRIMARY KEY (`id_Client`),
  KEY `fk_Adreça1_idx` (`id_Adreça`),
  CONSTRAINT `fk_Adreça1` FOREIGN KEY (`id_Adreça`) REFERENCES `adreça` (`id_adreça`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Òscar','Barbero','Prieto',617888689,1),(2,'Minerva','Navarro','Pérez',662491233,2),(3,'Nerea','González','Herrera',664523991,3),(4,'Irune','López','Sánchez',616892443,4),(5,'Toni','Alcantara','Paez',602334412,5),(6,'Enrique','Jordà','Basols',600845483,6),(7,'Albert','Muñoz','Vilalt',656143653,7);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comanda`
--

DROP TABLE IF EXISTS `Comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Comanda` (
  `id_Comanda` int(11) NOT NULL AUTO_INCREMENT,
  `dia_hora` datetime NOT NULL,
  `entrega` char(1) NOT NULL COMMENT 'Tipo de repartiment:\\\\\\\\nB = Botiga\\\\\\\\nD = Domicili',
  `id_Client` int(11) NOT NULL,
  `id_Botiga` int(11) NOT NULL,
  `id_Empleat` int(11) NOT NULL,
  PRIMARY KEY (`id_Comanda`),
  KEY `fk_Client1_idx` (`id_Client`),
  KEY `fk_Botiga2_idx` (`id_Botiga`),
  KEY `fk_Empleat3_idx` (`id_Empleat`),
  CONSTRAINT `fk_Botiga2` FOREIGN KEY (`id_Botiga`) REFERENCES `botiga` (`id_botiga`) ON DELETE CASCADE,
  CONSTRAINT `fk_Client1` FOREIGN KEY (`id_Client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE,
  CONSTRAINT `fk_Empleat3` FOREIGN KEY (`id_Empleat`) REFERENCES `empleat` (`id_empleat`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comanda`
--

LOCK TABLES `Comanda` WRITE;
/*!40000 ALTER TABLE `Comanda` DISABLE KEYS */;
INSERT INTO `Comanda` VALUES (1,'2022-03-22 19:30:00','B',7,1,2),(2,'2020-03-22 18:45:00','D',2,2,5),(3,'2019-03-22 22:00:00','B',3,1,3),(4,'2022-03-22 21:50:00','D',5,3,2),(5,'2021-03-22 21:15:00','D',2,1,1);
/*!40000 ALTER TABLE `Comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuiner`
--

DROP TABLE IF EXISTS `Cuiner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Cuiner` (
  `id_Cuiner` int(11) NOT NULL AUTO_INCREMENT,
  `id_Empleat` int(11) NOT NULL,
  PRIMARY KEY (`id_Cuiner`),
  KEY `fk_Empleat1_idx` (`id_Empleat`),
  CONSTRAINT `fk_Empleat1` FOREIGN KEY (`id_Empleat`) REFERENCES `empleat` (`id_empleat`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuiner`
--

LOCK TABLES `Cuiner` WRITE;
/*!40000 ALTER TABLE `Cuiner` DISABLE KEYS */;
INSERT INTO `Cuiner` VALUES (1,2),(2,5);
/*!40000 ALTER TABLE `Cuiner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallBeguda`
--

DROP TABLE IF EXISTS `detallBeguda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detallBeguda` (
  `id_Comanda` int(11) NOT NULL,
  `id_Beguda` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL,
  KEY `fk_Comanda4_idx` (`id_Comanda`),
  KEY `fk_Beguda1_idx` (`id_Beguda`),
  CONSTRAINT `fk_Beguda1` FOREIGN KEY (`id_Beguda`) REFERENCES `beguda` (`id_beguda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda4` FOREIGN KEY (`id_Comanda`) REFERENCES `comanda` (`id_comanda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallBeguda`
--

LOCK TABLES `detallBeguda` WRITE;
/*!40000 ALTER TABLE `detallBeguda` DISABLE KEYS */;
INSERT INTO `detallBeguda` VALUES (1,2,4),(2,3,2),(3,2,2),(4,1,2),(5,3,3);
/*!40000 ALTER TABLE `detallBeguda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallHamburguesa`
--

DROP TABLE IF EXISTS `detallHamburguesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detallHamburguesa` (
  `id_Comanda` int(11) NOT NULL,
  `id_Hamburguesa` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL,
  KEY `fk_Comanda3_idx` (`id_Comanda`),
  KEY `fk_Hamburguesa1_idx` (`id_Hamburguesa`),
  CONSTRAINT `fk_Comanda3` FOREIGN KEY (`id_Comanda`) REFERENCES `comanda` (`id_comanda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Hamburguesa1` FOREIGN KEY (`id_Hamburguesa`) REFERENCES `hamburguesa` (`id_hamburguesa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallHamburguesa`
--

LOCK TABLES `detallHamburguesa` WRITE;
/*!40000 ALTER TABLE `detallHamburguesa` DISABLE KEYS */;
INSERT INTO `detallHamburguesa` VALUES (1,4,4),(2,3,2),(3,4,2),(4,5,2),(5,2,3);
/*!40000 ALTER TABLE `detallHamburguesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallPizza`
--

DROP TABLE IF EXISTS `detallPizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detallPizza` (
  `id_Comanda` int(11) NOT NULL,
  `id_Pizza` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL,
  KEY `fk_Comanda2_idx` (`id_Comanda`),
  KEY `fk_Pizza2_idx` (`id_Pizza`),
  CONSTRAINT `fk_Comanda2` FOREIGN KEY (`id_Comanda`) REFERENCES `comanda` (`id_comanda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Pizza2` FOREIGN KEY (`id_Pizza`) REFERENCES `pizza` (`id_pizza`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallPizza`
--

LOCK TABLES `detallPizza` WRITE;
/*!40000 ALTER TABLE `detallPizza` DISABLE KEYS */;
INSERT INTO `detallPizza` VALUES (1,4,4),(1,6,4),(2,5,1),(2,3,2),(3,6,2),(4,5,2),(4,5,2),(5,1,2);
/*!40000 ALTER TABLE `detallPizza` ENABLE KEYS */;
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
  `cognom_1` varchar(15) NOT NULL COMMENT 'Primer cognom',
  `cognom_2` varchar(15) NOT NULL COMMENT 'Segon cognom',
  `telefon` int(11) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `id_Botiga` int(11) NOT NULL,
  PRIMARY KEY (`id_Empleat`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  KEY `fk_Botiga1_idx` (`id_Botiga`),
  CONSTRAINT `fk_Botiga1` FOREIGN KEY (`id_Botiga`) REFERENCES `botiga` (`id_botiga`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleat`
--

LOCK TABLES `Empleat` WRITE;
/*!40000 ALTER TABLE `Empleat` DISABLE KEYS */;
INSERT INTO `Empleat` VALUES (1,'Òscar','Barbero','Prieto',617888689,'43523424H',1),(2,'Ana','García','Pérez',662491233,'38806560V',2),(3,'Josep','Gimenez','Maisa',664523991,'52139756F',2),(4,'Enrique','Pallols','Mas',600845483,'44672341A',3),(5,'Albert','Marimon','Recuesta',656143653,'38916472J',3);
/*!40000 ALTER TABLE `Empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrega`
--

DROP TABLE IF EXISTS `Entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Entrega` (
  `id_Entrega` int(11) NOT NULL AUTO_INCREMENT,
  `hora_entrega` datetime NOT NULL,
  `id_Comanda` int(11) NOT NULL,
  `id_Repartidor` int(11) NOT NULL,
  PRIMARY KEY (`id_Entrega`),
  KEY `fk_Comanda1_idx` (`id_Comanda`),
  KEY `fk_Repartidor1_idx` (`id_Repartidor`),
  CONSTRAINT `fk_Comanda1` FOREIGN KEY (`id_Comanda`) REFERENCES `comanda` (`id_comanda`) ON DELETE CASCADE,
  CONSTRAINT `fk_Repartidor1` FOREIGN KEY (`id_Repartidor`) REFERENCES `repartidor` (`id_repartidor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrega`
--

LOCK TABLES `Entrega` WRITE;
/*!40000 ALTER TABLE `Entrega` DISABLE KEYS */;
INSERT INTO `Entrega` VALUES (1,'2020-03-22 19:20:00',2,1),(2,'2022-03-22 22:25:00',4,2),(3,'2021-03-22 21:35:00',5,2);
/*!40000 ALTER TABLE `Entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hamburguesa`
--

DROP TABLE IF EXISTS `Hamburguesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Hamburguesa` (
  `id_Hamburguesa` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `descripcio` varchar(20) NOT NULL,
  `imatge` blob,
  `preu` double NOT NULL,
  PRIMARY KEY (`id_Hamburguesa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hamburguesa`
--

LOCK TABLES `Hamburguesa` WRITE;
/*!40000 ALTER TABLE `Hamburguesa` DISABLE KEYS */;
INSERT INTO `Hamburguesa` VALUES (1,'Ceba','vegetariana','',1.5),(2,'Bolonyesa','normal','',3.4),(3,'Bolonyesa','picantl','',4.4),(4,'Marinera','normal','',5.75),(5,'Duplex','extra','',7.5),(6,'Triplex','extra','',10.2);
/*!40000 ALTER TABLE `Hamburguesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pizza`
--

DROP TABLE IF EXISTS `Pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Pizza` (
  `id_Pizza` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `descripcio` varchar(20) NOT NULL,
  `imatge` blob,
  `preu` double NOT NULL,
  PRIMARY KEY (`id_Pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizza`
--

LOCK TABLES `Pizza` WRITE;
/*!40000 ALTER TABLE `Pizza` DISABLE KEYS */;
INSERT INTO `Pizza` VALUES (1,'Montanya','vegetariana','',2.5),(2,'Carbonara','normal','',3.4),(3,'Bolonyesa','normal','',4.4),(4,'Marinera','normal','',5.75),(5,'Hawaiana','normal','',5.5),(6,'Kebab','normal','',6.2);
/*!40000 ALTER TABLE `Pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repartidor`
--

DROP TABLE IF EXISTS `Repartidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Repartidor` (
  `id_Repartidor` int(11) NOT NULL AUTO_INCREMENT,
  `id_Empleat` int(11) NOT NULL,
  PRIMARY KEY (`id_Repartidor`),
  KEY `fk_Empleat2_idx` (`id_Empleat`),
  CONSTRAINT `fk_Empleat2` FOREIGN KEY (`id_Empleat`) REFERENCES `empleat` (`id_empleat`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repartidor`
--

LOCK TABLES `Repartidor` WRITE;
/*!40000 ALTER TABLE `Repartidor` DISABLE KEYS */;
INSERT INTO `Repartidor` VALUES (1,1),(2,3),(3,4);
/*!40000 ALTER TABLE `Repartidor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02  8:55:01
