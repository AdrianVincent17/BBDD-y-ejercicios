-- MySQL dump 10.11
--
-- Host: localhost    Database: museo
-- ------------------------------------------------------
-- Server version	5.0.91-community-nt

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
-- Table structure for table `cuadro`
--

DROP TABLE IF EXISTS `cuadro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuadro` (
  `codCuad` int(11) NOT NULL default '0',
  `nomCuad` char(40) NOT NULL,
  `anho` int(11) default NULL,
  `tecnica` char(20) NOT NULL,
  `codMuseo` int(11) NOT NULL,
  `nomPintor` char(40) NOT NULL,
  PRIMARY KEY  (`codCuad`),
  KEY `codMuseo` (`codMuseo`),
  KEY `nomPintor` (`nomPintor`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codMuseo`) REFERENCES `museo` (`codMuseo`) ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`nomPintor`) REFERENCES `pintor` (`nomPin`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuadro`
--

LOCK TABLES `cuadro` WRITE;
/*!40000 ALTER TABLE `cuadro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuadro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museo`
--

DROP TABLE IF EXISTS `museo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museo` (
  `codMuseo` int(11) NOT NULL default '0',
  `nomMuseo` char(40) NOT NULL,
  `ciudadMuseo` char(20) NOT NULL,
  `direcMuseo` char(50) NOT NULL,
  `metros` int(11) default NULL,
  PRIMARY KEY  (`codMuseo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museo`
--

LOCK TABLES `museo` WRITE;
/*!40000 ALTER TABLE `museo` DISABLE KEYS */;
/*!40000 ALTER TABLE `museo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pintor`
--

DROP TABLE IF EXISTS `pintor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pintor` (
  `nomPin` char(40) NOT NULL default '',
  `paisPin` char(20) NOT NULL,
  `ciudadPin` char(20) NOT NULL,
  `fechaN` date default NULL,
  `fechaF` date default NULL,
  `nomMaestro` char(40) default NULL,
  PRIMARY KEY  (`nomPin`),
  KEY `nomMaestro` (`nomMaestro`),
  CONSTRAINT `pintor_ibfk_1` FOREIGN KEY (`nomMaestro`) REFERENCES `pintor` (`nomPin`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pintor`
--

LOCK TABLES `pintor` WRITE;
/*!40000 ALTER TABLE `pintor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pintor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-22 20:20:35
