-- MySQL dump 10.13  Distrib 5.5.23, for Win32 (x86)
--
-- Host: localhost    Database: ligafutbol
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `codEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  `ciudad` char(50) NOT NULL,
  `estadio` char(100) DEFAULT NULL,
  PRIMARY KEY (`codEquipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Real Madrid','Madrid','Santiago Bernabeu'),(2,'FC Barcelona','Barcelona','Camp Nou'),(3,'Atl‚tico Madrid','Madrid','Wanda Metropolitano'),(4,'Valencia CF','Valencia','Mestalla'),(5,'Athletic Club','Bilbao','San Mam‚s'),(6,'Real Betis Balompi‚','Sevilla','Benito Villamar¡n');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goles`
--

DROP TABLE IF EXISTS `goles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goles` (
  `partido` int(11) NOT NULL DEFAULT '0',
  `jugador` int(11) NOT NULL DEFAULT '0',
  `minuto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`partido`,`jugador`,`minuto`),
  KEY `jugador` (`jugador`),
  CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`partido`) REFERENCES `partidos` (`codPartido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`jugador`) REFERENCES `jugadores` (`codJugador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goles`
--

LOCK TABLES `goles` WRITE;
/*!40000 ALTER TABLE `goles` DISABLE KEYS */;
INSERT INTO `goles` VALUES (1,2,12),(6,2,78),(7,2,89),(6,4,87),(1,4,89),(7,4,12),(7,4,52),(1,7,50),(1,7,61),(4,7,16),(4,8,31),(4,7,42),(4,7,86),(4,8,89),(2,10,18),(2,12,20),(7,12,19),(2,13,39),(5,13,11),(7,13,32),(3,14,10),(3,15,19),(5,15,22),(3,16,82),(3,16,51),(5,16,62),(5,16,90),(3,18,72);
/*!40000 ALTER TABLE `goles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugadores` (
  `codJugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` char(30) NOT NULL,
  `posicion` char(20) NOT NULL,
  `equipo` int(11) NOT NULL,
  PRIMARY KEY (`codJugador`),
  KEY `equipo` (`equipo`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo`) REFERENCES `equipos` (`codEquipo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Thibaut Courtois','Portero',1),(2,'Jude Bellingham','Centrocampista',1),(3,'Fede Valverde','Centrocampista',1),(4,'Vinicius Junior','Delantero',1),(5,'Pau Cubars¡','Defensa',2),(6,'Dani Olmo','Centrocampista',2),(7,'Lamine Yamal','Delantero',2),(8,'Le Normand','Defensa',3),(9,'Koke','Centrocampista',3),(10,'Antoine Griezmann','Delantero',3),(11,'Domenech','Portero',4),(12,'Pepelu','Centrocampista',4),(13,'Hugo Duro','Delantero',4),(14,'Aitor Paredes','Defensa',5),(15,'Oihan Sancet','Centrocampista',5),(16,'Nico Williams','Delantero',5),(17,'Diego Llorente','Defensa',6),(18,'Sergi Altimira','Centrocampista',6),(19,'Vitor Roque','Delantero',6);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partidos` (
  `codPartido` int(11) NOT NULL AUTO_INCREMENT,
  `eqlocal` int(11) NOT NULL,
  `eqvisit` int(11) NOT NULL,
  `golesL` int(11) NOT NULL,
  `golesV` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`codPartido`),
  KEY `eqlocal` (`eqlocal`),
  KEY `eqvisit` (`eqvisit`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`eqlocal`) REFERENCES `equipos` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`eqvisit`) REFERENCES `equipos` (`codEquipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,1,2,2,2,'2024-10-06'),(2,3,4,1,2,'2024-10-06'),(3,5,6,4,1,'2024-10-06'),(4,2,3,3,2,'2024-11-28'),(5,4,5,1,3,'2024-11-29'),(6,6,1,0,2,'2024-11-29'),(7,1,4,3,2,'2024-12-01'),(8,2,5,0,0,'2024-12-11');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 22:43:26
