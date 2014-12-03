-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: aduna937_othala
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Current Database: `aduna937_othala`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `aduna937_othala` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `aduna937_othala`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` varchar(100) NOT NULL,
  `txNome` varchar(45) NOT NULL,
  `txCognome` varchar(45) NOT NULL,
  `txVia` varchar(100) NOT NULL,
  `txComune` varchar(100) NOT NULL,
  `cdCap` int(11) NOT NULL,
  `txProvincia` varchar(100) NOT NULL,
  `txNazione` varchar(100) NOT NULL,
  `txTel` varchar(45) NOT NULL,
  `fgDeleted` tinyint(4) NOT NULL,
  `txEtichetta` varchar(100) NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Addresses_Customer1` (`idUser`),
  CONSTRAINT `fk_Addresses_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `idProduct` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `idSize` int(11) DEFAULT NULL,
  `idColor` int(11) DEFAULT NULL,
  `qtStock` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(100) DEFAULT NULL,
  `idShop` int(11) DEFAULT NULL,
  `txBarCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`pgArticle`),
  KEY `fk_Article_Size1` (`idSize`),
  KEY `fk_Article_Color1` (`idColor`),
  KEY `fk_Article_Product1_idx` (`idProduct`),
  KEY `fk_Article_Shops1` (`idShop`),
  CONSTRAINT `fk_Article_Color1` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Shops1` FOREIGN KEY (`idShop`) REFERENCES `shops` (`idShop`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Size1` FOREIGN KEY (`idSize`) REFERENCES `size` (`idSize`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (27,1,22,13,1,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'SBMPQ04YN0LV53100C19'),(30,1,22,18,1,'thumb20141110145915895&IMG_5244.JPG',1,'121212'),(31,5,4,5,1,'thumb20141202123227110&IMG_1577.jpg',1,'101112'),(31,6,5,5,1,'thumb20141202123227110&IMG_1577.jpg',1,'101112'),(33,1,5,21,1,'thumb20141202123438452&IMG_1586.jpg',1,'101113'),(34,1,38,20,1,'thumb20141202123558626&IMG_1582.jpg',1,'101114'),(35,1,4,11,1,'thumb20141202130425171&IMG_1565.JPG',1,'101115'),(35,2,5,11,1,'thumb20141202130425171&IMG_1565.JPG',1,'101115'),(36,1,5,22,1,'thumb20141202130955055&IMG_1588.jpg',1,'101116'),(37,1,4,5,1,'thumb20141127125558413&IMG_1571.jpg',1,'101117'),(37,2,5,5,1,'thumb20141127125558413&IMG_1571.jpg',1,'101117'),(38,1,5,11,1,'thumb20141202131037758&IMG_1569.JPG',1,'101118'),(39,1,42,5,1,'thumb20141202151027733&IMG_1563.jpg',1,'101119'),(40,1,17,11,1,'thumb20141202130553258&IMG_1520.jpg',1,'111110'),(40,2,19,11,1,'thumb20141202130553258&IMG_1520.jpg',1,'111110'),(41,1,5,3,1,'thumb20141202125703934&IMG_1552.jpg',1,'111111'),(42,1,4,9,1,'thumb20141202125743567&IMG_1561.jpg',1,'111112'),(43,1,6,2,1,'thumb20141202123656922&IMG_1540.jpg',1,'111113'),(44,1,5,10,1,'thumb20141202131809015&IMG_1544.jpg',1,'111114'),(45,1,5,11,1,'thumb20141202123833980&IMG_1546.jpg',1,'111115'),(45,2,6,11,1,'thumb20141202123833980&IMG_1546.jpg',1,'111115'),(46,1,4,2,1,'thumb20141202131611968&IMG_1530.jpg',1,'111117'),(47,1,17,9,1,'thumb20141202125846627&IMG_1600.jpg',1,'111210'),(48,1,17,11,2,'thumb20141202131911122&IMG_1598.jpg',1,'111211'),(49,1,4,11,1,'thumb20141202131951185&IMG_1592.jpg',1,'101120'),(49,2,5,11,2,'thumb20141202131951185&IMG_1592.jpg',1,'101120'),(50,2,5,11,1,'thumb20141202132026576&IMG_1548.jpg',1,'111118'),(51,1,4,4,1,'thumb20141202151118594&IMG_1505.jpg',1,'111119'),(51,2,5,4,1,'thumb20141202151118594&IMG_1505.jpg',1,'111119'),(52,1,19,4,1,'thumb20141202132537186&IMG_1506.JPG',1,'111120'),(53,1,16,11,1,'thumb20141202130654886&IMG_1518.JPG',1,'111121'),(53,2,17,11,1,'thumb20141202130654886&IMG_1518.JPG',1,'111121'),(54,1,7,11,2,'thumb20141202132105618&IMG_1603.jpg',1,'111310'),(54,2,6,11,1,'thumb20141202132105618&IMG_1603.jpg',1,'111310'),(55,1,5,4,1,'thumb20141202151317124&IMG_1611.jpg',1,'111311'),(56,1,5,14,1,'thumb20141202151353554&IMG_1619.jpg',1,'111312'),(56,2,6,14,1,'thumb20141202151353554&IMG_1619.jpg',1,'111312'),(56,3,6,11,1,'thumb20141202151353554&IMG_1619.jpg',1,'111312'),(56,5,4,5,1,'thumb20141202151353554&IMG_1619.jpg',1,'111312'),(56,6,5,5,1,'thumb20141202151353554&IMG_1619.jpg',1,'111312'),(57,1,5,23,1,'thumb20141202124007840&IMG_1637.jpg',1,'121110'),(58,1,5,22,1,'thumb20141202124107859&IMG_1651.jpg',1,'121111'),(58,2,6,22,1,'thumb20141202124107859&IMG_1651.jpg',1,'121111'),(59,1,5,8,1,'thumb20141202125237906&IMG_1656.jpg',1,'121112'),(59,2,6,8,1,'thumb20141202125237906&IMG_1656.jpg',1,'121112'),(60,1,5,5,1,'thumb20141202125424168&IMG_1643.jpg',1,'121113'),(60,2,6,5,1,'thumb20141202125424168&IMG_1643.jpg',1,'121113'),(61,1,5,5,1,'thumb20141202131652487&IMG_1647.jpg',1,'121114'),(62,1,6,4,1,'thumb20141202125514352&IMG_1642.JPG',1,'111313'),(63,1,22,24,1,'thumb20141118170740089&anbjorg1.jpg',1,'141110'),(64,1,22,2,1,'thumb20141118170858601&annellobjorg.jpg',1,'141110'),(66,1,22,5,1,'thumb20141119135625261&bjorgneck1.jpg',1,'141113'),(67,1,22,2,1,'thumb20141119135905749&bjorgringbracelet.jpg',1,'141114'),(68,1,22,14,1,'thumb20141119140237932&calderaranecklace1.jpg',1,'111314'),(69,1,22,11,1,'thumb20141119140628953&calderaranecklace3.jpg',1,'111315'),(70,1,22,11,1,'thumb20141119140944080&calderaranecklace2.jpg',1,'111316'),(71,1,22,11,1,'thumb20141119141205598&calderaranecklace5.jpg',1,'111317'),(72,1,22,25,1,'thumb20141119141432529&orrechinicalderara.jpg',1,'111318'),(72,2,22,11,1,'thumb20141119141432529&orrechinicalderara.jpg',1,'111318'),(73,1,22,2,1,'thumb20141119141945710&heartbjorgnecklace.jpg',1,'141115'),(74,1,22,26,1,'thumb20141119145037054&jaminbag1.jpg',1,'151110'),(74,2,22,11,1,'thumb20141119145037054&jaminbag1.jpg',1,'151110'),(75,1,22,27,1,'thumb20141119145647130&jaminbag2.jpg',1,'151111'),(76,1,22,27,1,'thumb20141119150901584&jaminbig2.jpg',1,'151112'),(77,1,22,28,2,'thumb20141119151056744&marnibag.jpg',1,'101121'),(78,1,22,27,1,'thumb20141119151650739&paula3.jpg',1,'161110'),(79,1,22,29,1,'thumb20141119152416360&paulapink.jpg',1,'161111'),(80,1,22,27,1,'thumb20141119152906558&cademartori2.jpg',1,'161112'),(81,1,22,27,1,'thumb20141119153653554&marnipochette.jpg',1,'101122'),(82,1,26,30,1,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(82,2,3,30,2,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(82,3,28,30,1,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(82,4,4,30,1,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(82,5,49,30,1,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(82,6,48,30,1,'thumb20141119155500168&aranthsilver.jpg',1,'171110'),(83,1,28,25,1,'thumb20141119155745902&marniboots1.jpg',1,'101123'),(83,2,3,25,1,'thumb20141119155745902&marniboots1.jpg',1,'101123'),(83,3,49,25,1,'thumb20141119155745902&marniboots1.jpg',1,'101123'),(84,1,49,25,1,'thumb20141119165156903&marniborde1.jpg',1,'101124'),(85,1,49,14,1,'thumb20141119165444186&marnimaryjane1.jpg',1,'101125'),(85,2,28,14,1,'thumb20141119165444186&marnimaryjane1.jpg',1,'101125'),(86,1,26,20,1,'thumb20141119170343778&marnisandals.jpg',1,'101126'),(86,2,48,20,1,'thumb20141119170343778&marnisandals.jpg',1,'101126'),(86,3,3,20,1,'thumb20141119170343778&marnisandals.jpg',1,'101126'),(87,1,22,31,1,'thumb20141119170640438&marninecklace1.jpg',1,'101127'),(87,2,22,32,1,'thumb20141119170640438&marninecklace1.jpg',1,'101127'),(88,4,22,32,1,'thumb20141202152248681&marninecklace2.jpg',1,'101127'),(88,5,22,31,1,'thumb20141202152306015&marninecklace1.jpg',1,'101127'),(89,1,22,33,2,'thumb20141119171820051&marninecklace3.jpg',1,'101128'),(90,3,22,9,1,'thumb20141202152512868&capbern1.jpg',1,'181110'),(90,4,22,5,1,'thumb20141202152453731&capbernstock2.jpg',1,'181110'),(91,3,22,14,1,'thumb20141120143357071&capbernstock6.jpg',1,'181111'),(91,4,22,9,1,'thumb20141202152608141&capbernstock3.jpg',1,'181111'),(91,5,22,5,1,'thumb20141202152608394&capbern4.jpg',1,'181111'),(92,3,22,11,1,'thumb20141122115607198&capbernstock8.jpg',1,'181112'),(92,5,22,9,1,'thumb20141202152737972&capbernstock7.jpg',1,'181112'),(93,1,22,5,2,'thumb20141120144217526&capbernstock9.jpg',1,'181113'),(94,1,22,27,1,'thumb20141120144339085&pdbrac.jpg',1,'191110'),(95,1,22,27,1,'thumb20141120145158723&pdbracel2.jpg',1,'181111'),(96,1,26,11,1,'thumb20141120145300937&peternon1.jpg',1,'201110'),(96,2,3,11,2,'thumb20141120145300937&peternon1.jpg',1,'201110'),(96,3,28,11,2,'thumb20141120145300937&peternon1.jpg',1,'201110'),(96,4,4,11,1,'thumb20141120145300937&peternon1.jpg',1,'201110'),(97,1,3,11,2,'thumb20141120145928835&peternonfur1.jpg',1,'201111'),(97,2,26,11,1,'thumb20141120145928835&peternonfur1.jpg',1,'201111'),(98,1,26,11,1,'thumb20141120150610887&peternon1.jpg',1,'201110'),(98,2,3,11,2,'thumb20141120150610887&peternon1.jpg',1,'201110'),(98,3,28,11,2,'thumb20141120150610887&peternon1.jpg',1,'201110'),(98,4,4,11,1,'thumb20141120150610887&peternon1.jpg',1,'201110'),(99,1,26,11,1,'thumb20141121162040246&premiatafur.jpg',1,'211110'),(99,2,3,11,2,'thumb20141121162040246&premiatafur.jpg',1,'211110'),(99,3,28,11,2,'thumb20141121162040246&premiatafur.jpg',1,'211110'),(99,4,4,11,1,'thumb20141121162040246&premiatafur.jpg',1,'211110'),(100,1,5,34,1,'thumb20141202151441584&IMG_1626.jpg',1,'221110'),(101,3,22,35,2,'thumb20141202112331383&edt_new_color_resize_eau_de_lierre.jpg',1,'231110'),(102,3,22,35,2,'thumb20141202112438343&edt_new_color_resize_oyedo_1.jpg',1,'231111'),(103,3,22,35,2,'thumb20141202112523760&edt_new_color_resize_eau_duelle.jpg',1,'231112'),(104,3,22,35,2,'thumb20141202112601322&edt_new_color_resize_philosykos.jpg',1,'231113'),(105,3,22,35,2,'thumb20141202112633185&edt_new_color_resize_doson.jpg',1,'231114'),(106,4,22,35,2,'thumb20141202112715827&lombre_dans_resize.jpg',1,'231115'),(107,3,22,35,2,'thumb20141202112754652&philosykos_resize-1.jpg',1,'231116'),(108,3,22,35,2,'thumb20141202112855644&volutesp75.jpg',1,'231117'),(109,2,22,35,2,'thumb20141202112209376&tamdao100v1.jpg',1,'231118'),(110,2,22,35,2,'thumb20141202112943080&vetyverio-flacon-dos.jpg',1,'231119'),(111,2,22,35,2,'thumb20141202113028908&volute100v1_1.jpg',1,'231120'),(112,2,22,35,2,'thumb20141202113440235&aobc_freshlotion.jpg',1,'231121'),(113,2,22,35,2,'thumb20141202113844846&bc_pommade_exfoliante-pot_q.jpg',1,'231122'),(114,2,22,35,2,'thumb20141202113528673&abc_creme_riche_1.jpg',1,'231124'),(115,2,22,35,2,'thumb20141202113615259&abc_baume_genereux.jpg',1,'231123'),(116,2,22,35,2,'thumb20141202113344716&bc_emulsion_velours-pot_q.jpg',1,'231125'),(124,1,22,37,1,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(124,2,22,38,3,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(124,3,22,39,2,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(124,4,22,40,1,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(124,5,22,41,2,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(124,6,22,42,1,'thumb20141122165608381&bagsdesign2.jpg',1,'241110'),(125,1,22,43,2,'thumb20141122170514127&designinverso1.jpg',1,'241111'),(125,2,22,44,1,'thumb20141122170514127&designinverso1.jpg',1,'241111'),(125,3,22,45,3,'thumb20141122170514127&designinverso1.jpg',1,'241111'),(132,2,22,35,1,'thumb20141202113709727&bc_revitalizing-shower-gel_q.jpg',1,'261126');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `txBrand` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (20,'5 Department'),(21,'Alto'),(22,'Andrea Incontr'),(23,'Antipast'),(24,'Bjorg'),(25,'Carlo Contrada'),(26,'Collection Prive'),(27,'Damir Doma'),(29,'Diptyque'),(30,'Dusan'),(31,'ES'),(32,'Iossellini'),(33,'Jamin Puech'),(34,'Joe'),(35,'Le prairies de Paris'),(36,'Luna Bi'),(37,'Marni'),(39,'MSGM'),(40,'Orion London'),(41,'Paula Cademartori'),(42,'Premiata White'),(43,'Roberto del Carlo'),(44,'Samantha Sung'),(45,'Soho de Luxe'),(46,'So nice'),(48,'Volta'),(49,'Usluaairlines'),(50,'DesignInverso'),(51,'Calderara'),(52,'Aranth'),(53,'Bernstock Spiers'),(54,'Paola Daliani'),(55,'Peter Non');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `idCampaign` int(11) NOT NULL AUTO_INCREMENT,
  `txCampaign` varchar(45) DEFAULT NULL,
  `dtInizio` date DEFAULT NULL,
  `dtFine` date DEFAULT NULL,
  `pcSconto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCampaign`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'SALDI P/E 2014','2014-10-28','2014-12-31',70);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `idColor` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txColor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idColor`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'en','ORANGE'),(1,'it','ARANCIONE'),(2,'en','SILVER'),(2,'it','ARGENTO'),(3,'en','BEIGE'),(3,'it','BEIGE'),(4,'en','WHITE'),(4,'it','BIANCO'),(5,'en','BLUE'),(5,'it','BLU'),(6,'en','LIGHT BLUE'),(6,'it','CELESTE'),(7,'en','DENIM'),(7,'it','DENIM'),(8,'en','YELLOW'),(8,'it','GIALLO'),(9,'en','GREY'),(9,'it','GRIGIO'),(10,'en','BROWN'),(10,'it','MARRONE'),(11,'en','BLACK'),(11,'it','NERO'),(12,'en','GOLD'),(12,'it','ORO'),(13,'en','ROSE'),(13,'it','ROSA'),(14,'en','RED'),(14,'it','ROSSO'),(15,'en','GREEN'),(15,'it','VERDE'),(16,'en','PURPLE'),(16,'it','VIOLA'),(17,'en','LEOPARD'),(17,'it','LEOPARD'),(18,'en','TURQUASE'),(18,'it','TURCHESE'),(19,'en','OCEAN'),(19,'it','OCEANO'),(20,'en','CARBON'),(20,'it','CARBONE'),(21,'en','CINNAMON BROWN'),(21,'it','CANNELLA'),(22,'en','BLUE/BLACK'),(22,'it','BLU/BLACK'),(23,'en','copper '),(23,'it','rame'),(24,'en','PINK GOLD'),(24,'it','ORO ROSA'),(25,'en','BORDAUX'),(25,'it','BORDAUX'),(26,'en','LILAC'),(26,'it','LILLA'),(27,'en','MULTICOLOR'),(27,'it','MULTICOLOR'),(28,'en','CYPRESS'),(28,'it','CIPRESSO'),(29,'en','CANDY'),(29,'it','CANDY'),(30,'en','SILVER/BLACK'),(30,'it','ARGENTO/NERO'),(31,'en','DARK RED'),(31,'it','ROSSO SCURO'),(32,'en','EMERALD-GREEN'),(32,'it','SMERALDO'),(33,'en','SAVANNAH'),(33,'it','SAVANA'),(34,'en','WATER'),(34,'it','ACQUA'),(35,'en','NO'),(35,'it','NO'),(36,'en','FLUORESCENT YELLOW'),(36,'it','GIALLO FLUO'),(37,'en','BLUE/GOLD'),(37,'it','BLU/ORO'),(38,'en','FLUORESCENT YELLOW/GOLD'),(38,'it','GIALLO FLUO/ORO'),(39,'en','DARK GREEN/GOLD'),(39,'it','VERDE BOTTIGLIA/ORO'),(40,'en','FUXSIA/GOLD'),(40,'it','FUXSIA/ORO'),(41,'en','TURQUOISE/GOLD'),(41,'it','TURCHESE/ORO'),(42,'en','BLACK/GOLD'),(42,'it','NERO/ORO'),(43,'en','METAL GOLD/GOLD'),(43,'it','ORO METAL/ORO'),(44,'en','METAL LEAD/GOLD'),(44,'it','PIOMBO METAL/ORO'),(45,'en','SILVER/SILVER'),(45,'it','ARGENTO/ARGENTO'),(46,'en','AMBER'),(46,'it','AMBRA');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `idConfiguration` varchar(50) NOT NULL,
  `txConfiguration` varchar(100) DEFAULT NULL,
  `nrConfiguration` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConfiguration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES ('1','Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo',1);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `idCoupon` varchar(45) NOT NULL,
  `idUser` varchar(100) DEFAULT NULL,
  `pcSconto` smallint(6) DEFAULT NULL,
  `dtScadenza` date DEFAULT NULL,
  `qtUtilizzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCoupon`),
  KEY `fk_Coupons_Customer1` (`idUser`),
  CONSTRAINT `fk_Coupons_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idUser` varchar(100) NOT NULL,
  `txPassword` varchar(20) NOT NULL,
  `txNome` varchar(30) NOT NULL,
  `txCognome` varchar(30) NOT NULL,
  `txFiscale` varchar(100) DEFAULT NULL,
  `idTypeState` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_Customer_Type_State_Account1` (`idTypeState`),
  CONSTRAINT `fk_Customer_Type_State_Account1` FOREIGN KEY (`idTypeState`) REFERENCES `type_state_account` (`idTypeState`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('shop@magboutique.it','shop@mag','A','A','A',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_roles`
--

DROP TABLE IF EXISTS `customer_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_roles` (
  `idUser` varchar(100) NOT NULL,
  `txRole` varchar(20) NOT NULL,
  PRIMARY KEY (`idUser`,`txRole`),
  KEY `fk_CustomerRoles_Customer1_idx` (`idUser`),
  CONSTRAINT `fk_CustomerRoles_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_roles`
--

LOCK TABLES `customer_roles` WRITE;
/*!40000 ALTER TABLE `customer_roles` DISABLE KEYS */;
INSERT INTO `customer_roles` VALUES ('shop@magboutique.it','AMMINISTRATORE');
/*!40000 ALTER TABLE `customer_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_cost`
--

DROP TABLE IF EXISTS `delivery_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_cost` (
  `idDeliveryCost` int(11) NOT NULL AUTO_INCREMENT,
  `txDescrizione` varchar(45) DEFAULT NULL,
  `imSpese` decimal(15,2) DEFAULT NULL,
  `fgDeleted` tinyint(4) DEFAULT NULL,
  `txDescrizioneExt` varchar(250) DEFAULT NULL,
  `txLinkTracking` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDeliveryCost`),
  UNIQUE KEY `idDeliveryCost_UNIQUE` (`idDeliveryCost`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_cost`
--

LOCK TABLES `delivery_cost` WRITE;
/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
INSERT INTO `delivery_cost` VALUES (1,'SPEDIZIONE GRATUITA',0.00,0,'GLS Parcel camionistico',NULL),(2,'GLS Zefiro via aerea',9.74,0,'GLS Zefiro via aerea',NULL),(3,'GLS Zefiro via aerea',20.04,0,'GLS Zefiro via aerea',NULL),(4,'GLS Zefiro via aerea',17.19,0,'GLS Zefiro via aerea',NULL),(5,'GLS Zefiro via aerea',17.43,0,'GLS Zefiro via aerea',NULL),(6,'GLS Zefiro via aerea',19.56,0,'GLS Zefiro via aerea',NULL),(7,'GLS Zefiro via aerea',34.15,0,'GLS Zefiro via aerea',NULL),(8,'GLS Zefiro via aerea',48.94,0,'GLS Zefiro via aerea',NULL),(9,'GLS Zefiro via aerea',49.46,0,'GLS Zefiro via aerea',NULL),(10,'GLS Parcel camionistico',13.80,0,'GLS Parcel camionistico',NULL),(11,'GLS Parcel camionistico',14.05,0,'GLS Parcel camionistico',NULL),(12,'GLS Parcel camionistico',15.70,0,'GLS Parcel camionistico',NULL),(13,'GLS Parcel camionistico',16.76,0,'GLS Parcel camionistico',NULL),(14,'GLS Parcel camionistico',17.25,0,'GLS Parcel camionistico',NULL),(15,'GLS Parcel camionistico',18.97,0,'GLS Parcel camionistico',NULL),(16,'GLS Parcel camionistico',19.35,0,'GLS Parcel camionistico',NULL),(17,'GLS Parcel camionistico',20.45,0,'GLS Parcel camionistico',NULL),(18,'GLS Parcel camionistico',21.48,0,'GLS Parcel camionistico',NULL),(19,'GLS Parcel camionistico',23.66,0,'GLS Parcel camionistico',NULL),(20,'GLS Parcel camionistico',25.88,0,'GLS Parcel camionistico',NULL),(21,'GLS Parcel camionistico',27.46,0,'GLS Parcel camionistico',NULL),(22,'GLS Parcel camionistico',28.34,0,'GLS Parcel camionistico',NULL),(23,'GLS Parcel camionistico',28.59,0,'GLS Parcel camionistico',NULL),(24,'GLS Parcel camionistico',30.68,0,'GLS Parcel camionistico',NULL),(25,'GLS Parcel camionistico',31.45,0,'GLS Parcel camionistico',NULL),(26,'GLS Parcel camionistico',36.73,0,'GLS Parcel camionistico',NULL),(27,'GLS Parcel camionistico',40.91,0,'GLS Parcel camionistico',NULL),(28,'GLS Parcel camionistico',41.35,0,'GLS Parcel camionistico',NULL),(29,'GLS Parcel camionistico',45.30,0,'GLS Parcel camionistico',NULL);
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_nazioni`
--

DROP TABLE IF EXISTS `delivery_nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_nazioni` (
  `idDeliveryCost` int(11) NOT NULL,
  `idNazione` varchar(100) NOT NULL,
  PRIMARY KEY (`idDeliveryCost`,`idNazione`),
  KEY `fk_delivery_nazioni_delivery_cost1` (`idDeliveryCost`),
  KEY `fk_delivery_nazioni_nazioni1` (`idNazione`),
  CONSTRAINT `fk_delivery_nazioni_delivery_cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_nazioni_nazioni1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`idNazione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_nazioni`
--

LOCK TABLES `delivery_nazioni` WRITE;
/*!40000 ALTER TABLE `delivery_nazioni` DISABLE KEYS */;
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA'),(2,'Austria'),(2,'Belgium'),(2,'Denmark'),(2,'Finland'),(2,'France'),(2,'Germany'),(2,'Greece'),(2,'Ireland'),(2,'Luxembourg'),(2,'Monaco'),(2,'Netherlands'),(2,'Portugal'),(2,'Spain'),(2,'Sweden'),(2,'United Kingdom'),(3,'Bulgaria'),(3,'Croatia'),(3,'Cyprus'),(3,'Czech Republic'),(3,'Estonia'),(3,'Hungary'),(3,'Latvia'),(3,'Lithuania'),(3,'Malta'),(3,'Poland'),(3,'Romania'),(3,'Slovakia'),(3,'Slovenia'),(4,'Andorra'),(4,'Gibraltar'),(4,'Switzerland'),(5,'Canary Islands'),(5,'Faroe Islands'),(5,'Guernsey'),(5,'Iceland'),(5,'Jersey'),(5,'Norway'),(6,'Canada'),(6,'United States'),(7,'American Samoa'),(7,'Anguilla'),(7,'Antigua and Barbuda'),(7,'Argentina'),(7,'Aruba'),(7,'Australia'),(7,'Bahamas'),(7,'Bahrain'),(7,'Bangladesh'),(7,'Barbados'),(7,'Belize'),(7,'Bermuda'),(7,'Bolivia'),(7,'Bonaire'),(7,'Brazil'),(7,'Brunei Darussalam'),(7,'Cameroon'),(7,'Cayman Islands'),(7,'Chile'),(7,'Colombia'),(7,'Costa Rica'),(7,'Curacao'),(7,'Dominica'),(7,'Dominican Republic'),(7,'Ecuador'),(7,'Egypt'),(7,'El Salvador'),(7,'Equatorial Guinea'),(7,'Fiji'),(7,'French Guiana'),(7,'Greenland'),(7,'Grenada'),(7,'Guadeloupe'),(7,'Guam'),(7,'Guatemala'),(7,'Guyana'),(7,'Haiti'),(7,'Honduras'),(7,'Hong Kong'),(7,'India'),(7,'Indonesia'),(7,'Ivory Coast'),(7,'Jamaica'),(7,'Japan'),(7,'Kenya'),(7,'Kuwait'),(7,'Macao'),(7,'Malaysia'),(7,'Maldives'),(7,'Martinique'),(7,'Mexico'),(7,'Micronesia'),(7,'Montserrat'),(7,'Nevis'),(7,'New Caledonia'),(7,'New Zealand'),(7,'Nigeria'),(7,'Oman'),(7,'Pakistan'),(7,'Palau'),(7,'Panama'),(7,'Paraguay'),(7,'Peru'),(7,'Philippines'),(7,'Puerto Rico'),(7,'Qatar'),(7,'Saint Barthelemy'),(7,'Saint Eustatius'),(7,'Saint Kitts and Nevis'),(7,'Saint Lucia'),(7,'Saint Maarten'),(7,'Saint Vincent e Grenadine'),(7,'Samoa'),(7,'Saudi Arabia'),(7,'Senegal'),(7,'Singapore'),(7,'South Africa'),(7,'South Korea'),(7,'Sri Lanka'),(7,'Suriname'),(7,'Tahiti'),(7,'Taiwan'),(7,'Thailand'),(7,'Trinidad and Tobago'),(7,'Turkey'),(7,'United Arab Emirates'),(7,'Uruguay'),(7,'Venezuela'),(7,'Virgin Islands'),(8,'Algeria'),(8,'Benin'),(8,'Bhutan'),(8,'Botswana'),(8,'Burkina Faso'),(8,'Burundi'),(8,'Cambodia'),(8,'Cape Verde'),(8,'Center Africa'),(8,'Chad'),(8,'China'),(8,'Comoros'),(8,'Congo'),(8,'Cook Islands'),(8,'Djibouti'),(8,'East Timor'),(8,'Eritrea'),(8,'Ethiopia'),(8,'Gabon'),(8,'Gambia'),(8,'Ghana'),(8,'Guinea'),(8,'Guinea-Bissau'),(8,'Iraq'),(8,'Israel'),(8,'Jordan'),(8,'Lao'),(8,'Lebanon'),(8,'Lesotho'),(8,'Liberia'),(8,'Libya'),(8,'Madagascar'),(8,'Malawi'),(8,'Mali'),(8,'Marshall Islands'),(8,'Mauritania'),(8,'Mauritius'),(8,'Mayotte'),(8,'Morocco'),(8,'Namibia'),(8,'Nauru'),(8,'Nepal'),(8,'Nicaragua'),(8,'Niger'),(8,'Papua New Guinea'),(8,'Reunion Island'),(8,'Rwanda'),(8,'Saipan'),(8,'Seychelles'),(8,'Sierra Leone'),(8,'Somalia'),(8,'Swaziland'),(8,'Syria'),(8,'Tanzania'),(8,'Togo'),(8,'Tonga'),(8,'Tunisia'),(8,'Turks and Caicos Islands'),(8,'Tuvalu'),(8,'Uganda'),(8,'Vanuatu'),(8,'Vietnam'),(8,'Yemen'),(8,'Zambia'),(8,'Zimbabwe'),(9,'Afghanistan'),(9,'Albania'),(9,'Angola'),(9,'Armenia'),(9,'Azerbaijan'),(9,'Belarus'),(9,'Bosnia and Herzegovina'),(9,'Cuba'),(9,'Falkland Islands'),(9,'Georgia'),(9,'Iran'),(9,'Kazakhstan'),(9,'Kiribati'),(9,'Kosovo'),(9,'Kyrgyzstan'),(9,'Macedonia'),(9,'Moldova'),(9,'Mongolia'),(9,'Montenegro'),(9,'Mozambique'),(9,'Myanmar, Burma'),(9,'Niue'),(9,'North Korea'),(9,'Russian Federation'),(9,'Serbia'),(9,'Solomon Islands'),(9,'South Sudan'),(9,'Sudan'),(9,'Tajikistan'),(9,'Ukraine'),(9,'Uzbekistan'),(10,'Austria'),(11,'Belgium'),(12,'France'),(12,'Germany'),(12,'Luxembourg'),(12,'Netherlands'),(13,'Liechtenstein'),(14,'Switzerland'),(15,'Denmark'),(15,'Slovenia'),(16,'England'),(16,'Galles'),(16,'Scotland'),(17,'Hungary'),(18,'Croatia'),(18,'Serbia'),(19,'Poland'),(20,'Czech Republic'),(20,'Spain'),(21,'Sweden'),(22,'Slovakia'),(23,'Bulgaria'),(23,'Estonia'),(23,'Latvia'),(23,'Lithuania'),(23,'Norway'),(23,'Portugal'),(23,'Romania'),(24,'Ireland'),(25,'Finland'),(26,'Turkey'),(27,'Greece'),(28,'Nord Ireland'),(29,'Cyprus'),(29,'Malta');
/*!40000 ALTER TABLE `delivery_nazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelity_customer`
--

DROP TABLE IF EXISTS `fidelity_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fidelity_customer` (
  `idUser` varchar(100) NOT NULL,
  `idFidelity` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`,`idFidelity`),
  KEY `fk_fidelity_customer_FidelityCards1_idx` (`idFidelity`),
  CONSTRAINT `fk_fidelity_customer_customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fidelity_customer_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelity_customer`
--

LOCK TABLES `fidelity_customer` WRITE;
/*!40000 ALTER TABLE `fidelity_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelity_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelitycards`
--

DROP TABLE IF EXISTS `fidelitycards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fidelitycards` (
  `idFidelity` varchar(45) NOT NULL,
  `txNome` varchar(45) DEFAULT NULL,
  `txCognome` varchar(45) DEFAULT NULL,
  `dtRilascio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txEmail` varchar(45) DEFAULT NULL,
  `txTel` varchar(45) DEFAULT NULL,
  `pcSconto` int(11) NOT NULL,
  PRIMARY KEY (`idFidelity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelitycards`
--

LOCK TABLES `fidelitycards` WRITE;
/*!40000 ALTER TABLE `fidelitycards` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelitycards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `idGender` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txGender` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idGender`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'en','Shop'),(1,'it','Shop');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_images`
--

DROP TABLE IF EXISTS `group_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `txLibrary` varchar(45) DEFAULT NULL,
  `nrImages` int(11) DEFAULT NULL,
  `maxHeight` int(11) DEFAULT NULL,
  `maxWidth` int(11) DEFAULT NULL,
  `fgGender` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_images`
--

LOCK TABLES `group_images` WRITE;
/*!40000 ALTER TABLE `group_images` DISABLE KEYS */;
INSERT INTO `group_images` VALUES ('carousel','images/home',20,1080,1560,0),('new','images/home',1,130,260,0),('newArrivals','images/home',6,960,960,1),('promo','images/home',1,130,260,0),('tabNav','images/home',6,130,260,1);
/*!40000 ALTER TABLE `group_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipnmessages`
--

DROP TABLE IF EXISTS `ipnmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipnmessages` (
  `idOrder` int(11) DEFAULT NULL,
  `idTransaction` varchar(50) NOT NULL,
  `tsInserimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txMessage` varchar(10000) DEFAULT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  `txNote` varchar(100) DEFAULT NULL,
  `fgElaborato` tinyint(1) DEFAULT NULL,
  `idRefund` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipnmessages`
--

LOCK TABLES `ipnmessages` WRITE;
/*!40000 ALTER TABLE `ipnmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipnmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `idMaterial` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txMaterial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'en','COTTON'),(1,'it','COTONE'),(2,'en','SILK'),(2,'it','SETA'),(3,'en','BRUSHED CALF LEATHER'),(3,'it','VITELLO SPAZZOLATO'),(4,'en','NEOPRENE'),(4,'it','NEOPRENE'),(5,'en','POLIESTERE'),(5,'it','POLIESTERE'),(6,'en','PLASTIC'),(6,'it','PLASTICA'),(7,'en','VISCOSE'),(7,'it','VISCOSA'),(8,'en','ALPACA WOOL'),(8,'it','ALPACA'),(9,'en','VIRGIN WOOL'),(9,'it','LANA VERGINE'),(10,'en','WOOL'),(10,'it','LANA'),(11,'en','CASHEMERE'),(11,'it','CASHEMERE'),(12,'en','MOHAIR WOOL'),(12,'it','LANA MOHAIR'),(13,'en','SILVER'),(13,'it','ARGENTO'),(14,'en','ORO'),(14,'it','ORO'),(15,'en','METAL'),(15,'it','METALLO'),(16,'en','RESIN'),(16,'it','RESINA'),(17,'en','TAFFETA'),(17,'it','TAFFETA'),(18,'en','OSTRICH'),(18,'it','STRUZZO'),(19,'en','PONY HORSE'),(19,'it','CAVALLINO'),(20,'en','PVC'),(20,'it','PVC'),(21,'en','NAPPA LEATHER'),(21,'it','NAPPA'),(22,'en','SATIN'),(22,'it','RASO'),(23,'en','FELT'),(23,'it','FELTRO'),(24,'en','LEATHER'),(24,'it','PELLE'),(25,'en','HORN'),(25,'it','CORNO'),(26,'en','ECO-FUR'),(26,'it','ECO-PELLICCIA'),(27,'en','WATER'),(27,'it','ACQUA'),(28,'en','ESSENCE'),(28,'it','ESSENZA'),(29,'en','CREAM'),(29,'it','CREMA'),(30,'en','SOAP'),(30,'it','SAPONE'),(31,'en','OIL'),(31,'it','OLIO');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nazioni` (
  `idNazione` varchar(100) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  PRIMARY KEY (`idNazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES ('Afghanistan','en'),('Albania','en'),('Algeria','en'),('American Samoa','en'),('Andorra','en'),('Angola','en'),('Anguilla','en'),('Antigua and Barbuda','en'),('Argentina','en'),('Armenia','en'),('Aruba','en'),('Australia','en'),('Austria','en'),('Azerbaijan','en'),('Bahamas','en'),('Bahrain','en'),('Bangladesh','en'),('Barbados','en'),('Belarus','en'),('Belgium','en'),('Belize','en'),('Benin','en'),('Bermuda','en'),('Bhutan','en'),('Bolivia','en'),('Bonaire','en'),('Bosnia and Herzegovina','en'),('Botswana','en'),('Brazil','en'),('Brunei Darussalam','en'),('Bulgaria','en'),('Burkina Faso','en'),('Burundi','en'),('Cambodia','en'),('Cameroon','en'),('Canada','en'),('Canary Islands','en'),('Cape Verde','en'),('Cayman Islands','en'),('Center Africa','en'),('Chad','en'),('Chile','en'),('China','en'),('Colombia','en'),('Comoros','en'),('Congo','en'),('Cook Islands','en'),('Costa Rica','en'),('Croatia','en'),('Cuba','en'),('Curacao','en'),('Cyprus','en'),('Czech Republic','en'),('Denmark','en'),('Djibouti','en'),('Dominica','en'),('Dominican Republic','en'),('East Timor','en'),('Ecuador','en'),('Egypt','en'),('El Salvador','en'),('England','en'),('Equatorial Guinea','en'),('Eritrea','en'),('Estonia','en'),('Ethiopia','en'),('Falkland Islands','en'),('Faroe Islands','en'),('Fiji','en'),('Finland','en'),('France','en'),('French Guiana','en'),('Gabon','en'),('Galles','en'),('Gambia','en'),('Georgia','en'),('Germany','en'),('Ghana','en'),('Gibraltar','en'),('Greece','en'),('Greenland','en'),('Grenada','en'),('Guadeloupe','en'),('Guam','en'),('Guatemala','en'),('Guernsey','en'),('Guinea','en'),('Guinea-Bissau','en'),('Guyana','en'),('Haiti','en'),('Honduras','en'),('Hong Kong','en'),('Hungary','en'),('Iceland','en'),('India','en'),('Indonesia','en'),('Iran','en'),('Iraq','en'),('Ireland','en'),('Israel','en'),('ITALIA','it'),('Ivory Coast','en'),('Jamaica','en'),('Japan','en'),('Jersey','en'),('Jordan','en'),('Kazakhstan','en'),('Kenya','en'),('Kiribati','en'),('Kosovo','en'),('Kuwait','en'),('Kyrgyzstan','en'),('Lao','en'),('Latvia','en'),('Lebanon','en'),('Lesotho','en'),('Liberia','en'),('Libya','en'),('Liechtenstein','en'),('Lithuania','en'),('Luxembourg','en'),('Macao','en'),('Macedonia','en'),('Madagascar','en'),('Malawi','en'),('Malaysia','en'),('Maldives','en'),('Mali','en'),('Malta','en'),('Marshall Islands','en'),('Martinique','en'),('Mauritania','en'),('Mauritius','en'),('Mayotte','en'),('Mexico','en'),('Micronesia','en'),('Moldova','en'),('Monaco','en'),('Mongolia','en'),('Montenegro','en'),('Montserrat','en'),('Morocco','en'),('Mozambique','en'),('Myanmar, Burma','en'),('Namibia','en'),('Nauru','en'),('Nepal','en'),('Netherlands','en'),('Nevis','en'),('New Caledonia','en'),('New Zealand','en'),('Nicaragua','en'),('Niger','en'),('Nigeria','en'),('Niue','en'),('Nord Ireland','en'),('North Korea','en'),('Norway','en'),('Oman','en'),('Pakistan','en'),('Palau','en'),('Panama','en'),('Papua New Guinea','en'),('Paraguay','en'),('Peru','en'),('Philippines','en'),('Poland','en'),('Portugal','en'),('Puerto Rico','en'),('Qatar','en'),('Reunion Island','en'),('Romania','en'),('Russian Federation','en'),('Rwanda','en'),('Saint Barthelemy','en'),('Saint Eustatius','en'),('Saint Kitts and Nevis','en'),('Saint Lucia','en'),('Saint Maarten','en'),('Saint Vincent e Grenadine','en'),('Saipan','en'),('Samoa','en'),('Saudi Arabia','en'),('Scotland','en'),('Senegal','en'),('Serbia','en'),('Seychelles','en'),('Sierra Leone','en'),('Singapore','en'),('Slovakia','en'),('Slovenia','en'),('Solomon Islands','en'),('Somalia','en'),('South Africa','en'),('South Korea','en'),('South Sudan','en'),('Spain','en'),('Sri Lanka','en'),('Sudan','en'),('Suriname','en'),('Swaziland','en'),('Sweden','en'),('Switzerland','en'),('Syria','en'),('Tahiti','en'),('Taiwan','en'),('Tajikistan','en'),('Tanzania','en'),('Thailand','en'),('Togo','en'),('Tonga','en'),('Trinidad and Tobago','en'),('Tunisia','en'),('Turkey','en'),('Turks and Caicos Islands','en'),('Tuvalu','en'),('Uganda','en'),('Ukraine','en'),('United Arab Emirates','en'),('United Kingdom','en'),('United States','en'),('Uruguay','en'),('Uzbekistan','en'),('Vanuatu','en'),('Venezuela','en'),('Vietnam','en'),('Virgin Islands','en'),('Yemen','en'),('Zambia','en'),('Zimbabwe','en');
/*!40000 ALTER TABLE `nazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_refound`
--

DROP TABLE IF EXISTS `order_refound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_refound` (
  `idRefound` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `idUser` varchar(100) NOT NULL,
  `idTransaction` varchar(45) DEFAULT NULL,
  `imRefound` int(11) DEFAULT NULL,
  `txChangeRefound` varchar(250) DEFAULT NULL,
  `fgChangeRefound` char(1) DEFAULT NULL,
  `fgPartialRefound` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idRefound`),
  KEY `fk_Order_Refound_Orders1_idx` (`idOrder`),
  KEY `fk_Order_Refound_Customer1_idx` (`idUser`),
  CONSTRAINT `fk_Order_Refound_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Refound_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_refound`
--

LOCK TABLES `order_refound` WRITE;
/*!40000 ALTER TABLE `order_refound` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_refound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` varchar(100) NOT NULL,
  `imOrdine` int(11) NOT NULL,
  `idTransaction` varchar(45) DEFAULT NULL,
  `idAddressFat` int(11) NOT NULL,
  `idAddressSpe` int(11) NOT NULL,
  `idDeliveryCost` int(11) NOT NULL,
  `idTrackingNumber` varchar(100) DEFAULT NULL,
  `idFidelity` varchar(45) DEFAULT NULL,
  `idCoupon` varchar(45) DEFAULT NULL,
  `pcSconto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  UNIQUE KEY `idOrder_UNIQUE` (`idOrder`),
  KEY `fk_Orders_Customer1_idx` (`idUser`),
  KEY `fk_Orders_Addresses1` (`idAddressFat`),
  KEY `fk_Orders_Addresses2` (`idAddressSpe`),
  KEY `fk_Orders_Delivery_Cost1` (`idDeliveryCost`),
  KEY `fk_orders_FidelityCards1_idx` (`idFidelity`),
  KEY `fk_orders_coupons1_idx` (`idCoupon`),
  CONSTRAINT `fk_Orders_Addresses1` FOREIGN KEY (`idAddressFat`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Addresses2` FOREIGN KEY (`idAddressSpe`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_coupons1` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_articles`
--

DROP TABLE IF EXISTS `orders_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_articles` (
  `idOrder` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  PRIMARY KEY (`idOrder`,`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Article1_idx` (`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Orders1_idx` (`idOrder`),
  CONSTRAINT `fk_OrdersArticles_Article1` FOREIGN KEY (`idProdotto`, `pgArticle`) REFERENCES `article` (`idProduct`, `pgArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdersArticles_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_articles`
--

LOCK TABLES `orders_articles` WRITE;
/*!40000 ALTER TABLE `orders_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `idGender` int(11) DEFAULT NULL,
  `idType` int(11) DEFAULT NULL,
  `idBrand` int(11) DEFAULT NULL,
  `imPrice` decimal(15,0) DEFAULT NULL,
  `pcDiscount` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(100) DEFAULT NULL,
  `idProductState` int(11) DEFAULT NULL,
  `dtProductState` datetime DEFAULT NULL,
  `idCampaign` int(11) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  `specialPrice` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idProduct_INDEX1` (`idProduct`),
  KEY `fk_Product_Product_State1` (`idProductState`),
  KEY `fk_Product_Gender1` (`idGender`),
  KEY `fk_Product_Type1` (`idType`),
  KEY `fk_Product_Brand1` (`idBrand`),
  KEY `fk_Product_Campaigns1` (`idCampaign`),
  KEY `fk_Product_Material1` (`idMaterial`),
  CONSTRAINT `fk_Product_Brand1` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Campaigns1` FOREIGN KEY (`idCampaign`) REFERENCES `campaigns` (`idCampaign`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Gender1` FOREIGN KEY (`idGender`) REFERENCES `gender` (`idGender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Material1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Product_State1` FOREIGN KEY (`idProductState`) REFERENCES `product_state` (`idProductState`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Type1` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (27,1,18,37,2,70,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'2014-10-27 16:18:59',1,3,NULL),(30,1,18,50,120,0,'thumb20141110145915895&IMG_5244.JPG',2,'2014-11-18 00:00:00',NULL,6,NULL),(31,1,5,37,745,0,'thumb20141202123227110&IMG_1577.jpg',1,'2014-11-17 14:50:49',NULL,2,NULL),(33,1,5,37,840,0,'thumb20141202123438452&IMG_1586.jpg',1,'2014-11-17 14:57:20',NULL,2,NULL),(34,1,5,37,650,0,'thumb20141202123558626&IMG_1582.jpg',1,'2014-11-17 15:01:00',NULL,7,NULL),(35,1,7,37,485,0,'thumb20141202130425171&IMG_1565.JPG',1,'2014-11-17 15:04:44',NULL,7,NULL),(36,1,8,37,1080,0,'thumb20141202130955055&IMG_1588.jpg',1,'2014-11-17 15:07:45',NULL,8,NULL),(37,1,12,37,510,0,'thumb20141127125558413&IMG_1571.jpg',1,'2014-11-17 15:13:26',NULL,2,NULL),(38,1,15,37,465,0,'thumb20141202131037758&IMG_1569.JPG',1,'2014-11-17 15:16:23',NULL,9,NULL),(39,1,22,37,645,0,'thumb20141202151027733&IMG_1563.jpg',1,'2014-11-17 15:20:00',NULL,2,NULL),(40,1,7,39,140,0,'thumb20141202130553258&IMG_1520.jpg',1,'2014-11-17 15:23:22',NULL,1,NULL),(41,1,4,39,1270,0,'thumb20141202125703934&IMG_1552.jpg',1,'2014-11-17 15:26:31',NULL,10,NULL),(42,1,4,39,660,0,'thumb20141202125743567&IMG_1561.jpg',1,'2014-11-17 15:31:15',NULL,10,NULL),(43,1,5,39,545,0,'thumb20141202123656922&IMG_1540.jpg',1,'2014-11-17 15:34:58',NULL,5,NULL),(44,1,16,39,180,0,'thumb20141202131809015&IMG_1544.jpg',1,'2014-11-17 15:38:09',NULL,5,NULL),(45,1,5,39,370,0,'thumb20141202123833980&IMG_1546.jpg',1,'2014-11-17 15:40:48',NULL,5,NULL),(46,1,12,39,245,0,'thumb20141202131611968&IMG_1530.jpg',1,'2014-11-17 15:45:39',NULL,5,NULL),(47,1,4,30,1620,0,'thumb20141202125846627&IMG_1600.jpg',1,'2014-11-17 15:47:35',NULL,8,NULL),(48,1,16,30,715,0,'thumb20141202131911122&IMG_1598.jpg',1,'2014-11-17 15:51:02',NULL,11,NULL),(49,1,16,37,445,0,'thumb20141202131951185&IMG_1592.jpg',1,'2014-11-17 15:56:50',NULL,9,NULL),(50,1,16,39,380,0,'thumb20141202132026576&IMG_1548.jpg',1,'2014-11-17 16:00:17',NULL,10,NULL),(51,1,22,39,270,0,'thumb20141202151118594&IMG_1505.jpg',1,'2014-11-17 16:05:14',NULL,7,NULL),(52,1,15,39,230,0,'thumb20141202132537186&IMG_1506.JPG',1,'2014-11-17 16:09:05',NULL,9,NULL),(53,1,7,39,355,0,'thumb20141202130654886&IMG_1518.JPG',1,'2014-11-17 16:13:10',NULL,1,NULL),(54,1,16,51,325,0,'thumb20141202132105618&IMG_1603.jpg',1,'2014-11-17 16:17:41',NULL,5,NULL),(55,1,22,51,275,0,'thumb20141202151317124&IMG_1611.jpg',1,'2014-11-17 16:20:25',NULL,5,NULL),(56,1,22,51,200,0,'thumb20141202151353554&IMG_1619.jpg',1,'2014-11-17 16:23:40',NULL,5,NULL),(57,1,5,25,450,0,'thumb20141202124007840&IMG_1637.jpg',1,'2014-11-18 16:15:29',NULL,5,NULL),(58,1,5,25,500,0,'thumb20141202124107859&IMG_1651.jpg',1,'2014-11-18 16:21:57',NULL,12,NULL),(59,1,3,25,375,0,'thumb20141202125237906&IMG_1656.jpg',1,'2014-11-18 16:24:53',NULL,2,NULL),(60,1,3,25,375,0,'thumb20141202125424168&IMG_1643.jpg',1,'2014-11-18 16:26:24',NULL,2,NULL),(61,1,12,25,340,0,'thumb20141202131652487&IMG_1647.jpg',1,'2014-11-18 16:29:57',NULL,10,NULL),(62,1,3,51,338,0,'thumb20141202125514352&IMG_1642.JPG',1,'2014-11-18 16:39:32',NULL,5,NULL),(63,1,1,24,240,0,'thumb20141202151919904&anbjorg1.jpg',1,'2014-11-18 17:01:35',NULL,13,NULL),(64,1,1,24,240,0,'thumb20141202151945773&annellobjorg.jpg',1,'2014-11-18 17:05:09',NULL,13,NULL),(66,1,1,24,250,0,'thumb20141202152004107&bjorgneck1.jpg',1,'2014-11-19 13:51:46',NULL,13,NULL),(67,1,1,24,160,0,'thumb20141202152021261&bjorgringbracelet.jpg',1,'2014-11-19 13:54:51',NULL,13,NULL),(68,1,1,51,325,0,'thumb20141202152046981&calderaranecklace1.jpg',1,'2014-11-19 13:58:47',NULL,16,NULL),(69,1,1,51,315,0,'thumb20141202152105344&calderaranecklace3.jpg',1,'2014-11-19 14:02:29',NULL,2,NULL),(70,1,1,51,300,0,'thumb20141202152121476&calderaranecklace2.jpg',1,'2014-11-19 14:04:45',NULL,1,NULL),(71,1,1,51,220,0,'thumb20141202152139351&calderaranecklace5.jpg',1,'2014-11-19 14:06:42',NULL,1,NULL),(72,1,1,51,110,0,'thumb20141202152158886&orrechinicalderara.jpg',1,'2014-11-19 14:12:18',NULL,17,NULL),(73,1,1,24,365,0,'thumb20141202152220159&heartbjorgnecklace.jpg',1,'2014-11-19 14:14:58',NULL,13,NULL),(74,1,18,33,190,0,'thumb20141202153028751&jaminbag1.jpg',1,'2014-11-19 14:48:58',NULL,18,NULL),(75,1,18,33,435,0,'thumb20141202153049081&jaminbag2.jpg',1,'2014-11-19 15:00:43',NULL,19,NULL),(76,1,18,33,695,0,'thumb20141202153106520&jaminbig2.jpg',1,'2014-11-19 15:03:05',NULL,19,NULL),(77,1,18,37,220,0,'thumb20141202153124945&marnibag.jpg',1,'2014-11-19 15:08:56',NULL,20,NULL),(78,1,18,41,830,0,'thumb20141202153145383&paula3.jpg',1,'2014-11-19 15:16:00',NULL,22,NULL),(79,1,18,41,1450,0,'thumb20141202153201310&paulapink.jpg',1,'2014-11-19 15:21:35',NULL,21,NULL),(80,1,18,41,1500,0,'thumb20141202153218767&cademartori2.jpg',1,'2014-11-19 15:24:34',NULL,21,NULL),(81,1,18,37,710,0,'thumb20141202153239692&marnipochette.jpg',1,'2014-11-19 15:30:50',NULL,23,NULL),(82,1,20,52,300,0,'thumb20141202153342718&aranthsilver.jpg',1,'2014-11-19 15:50:35',NULL,24,NULL),(83,1,20,37,470,0,'thumb20141202153400698&marniboots1.jpg',1,'2014-11-19 16:33:11',NULL,24,NULL),(84,1,20,37,590,0,'thumb20141202153428962&marniborde1.jpg',1,'2014-11-19 16:46:00',NULL,24,NULL),(85,1,20,37,470,0,'thumb20141202153448965&marnimaryjane2.jpg',1,'2014-11-19 16:49:05',NULL,24,NULL),(86,1,20,37,290,0,'thumb20141202153509312&marnisandals.jpg',1,'2014-11-19 16:57:57',NULL,19,NULL),(87,1,1,37,385,0,'thumb20141119170640438&marninecklace1.jpg',2,'2014-11-19 00:00:00',NULL,16,NULL),(88,1,1,37,385,0,'thumb20141202152306015&marninecklace1.jpg',1,'2014-11-19 17:11:03',NULL,16,NULL),(89,1,1,37,380,0,'thumb20141202152431774&marninecklace3.jpg',1,'2014-11-19 17:16:43',NULL,25,NULL),(90,1,1,53,130,0,'thumb20141202152453731&capbernstock2.jpg',1,'2014-11-20 14:23:23',NULL,9,NULL),(91,1,1,53,130,0,'thumb20141202152608394&capbern4.jpg',1,'2014-11-20 14:27:42',NULL,9,NULL),(92,1,1,53,130,0,'thumb20141202152737972&capbernstock7.jpg',1,'2014-11-20 14:31:31',NULL,9,NULL),(93,1,1,53,130,0,'thumb20141202152814492&capbernstock9.jpg',1,'2014-11-20 14:36:00',NULL,1,NULL),(94,1,1,54,350,0,'thumb20141202152838307&pdbrac.jpg',1,'2014-11-20 14:42:30',NULL,14,NULL),(95,1,1,54,325,0,'thumb20141202152859068&pdbracel2.jpg',1,'2014-11-20 14:45:31',NULL,14,NULL),(96,1,1,55,330,0,'thumb20141120145300937&peternon1.jpg',2,'2014-11-20 00:00:00',NULL,24,NULL),(97,1,20,55,395,0,'thumb20141202153531948&peternonfront.jpg',1,'2014-11-20 14:57:05',NULL,24,NULL),(98,1,20,55,330,0,'thumb20141202153558877&peternon1.jpg',1,'2014-11-20 15:00:59',NULL,24,NULL),(99,1,20,42,260,0,'thumb20141202153624436&premiatafur.jpg',1,'2014-11-21 16:17:15',NULL,26,NULL),(100,1,22,26,325,0,'thumb20141202151441584&IMG_1626.jpg',1,'2014-11-21 16:23:58',NULL,12,NULL),(101,1,24,29,105,0,'thumb20141202112331383&edt_new_color_resize_eau_de_lierre.jpg',1,'2014-11-21 16:39:54',NULL,27,NULL),(102,1,24,29,95,0,'thumb20141202112438343&edt_new_color_resize_oyedo_1.jpg',1,'2014-11-21 16:45:36',NULL,27,NULL),(103,1,24,29,95,0,'thumb20141202112523760&edt_new_color_resize_eau_duelle.jpg',1,'2014-11-21 16:53:33',NULL,27,NULL),(104,1,24,29,95,0,'thumb20141202112601322&edt_new_color_resize_philosykos.jpg',1,'2014-11-21 16:57:42',NULL,27,NULL),(105,1,24,29,95,0,'thumb20141202112633185&edt_new_color_resize_doson.jpg',1,'2014-11-21 17:02:51',NULL,28,NULL),(106,1,24,29,105,0,'thumb20141202112715827&lombre_dans_resize.jpg',1,'2014-11-21 17:06:33',NULL,28,NULL),(107,1,24,29,105,0,'thumb20141202112754652&philosykos_resize-1.jpg',1,'2014-11-21 17:09:27',NULL,28,NULL),(108,1,24,29,105,0,'thumb20141202112855644&volutesp75.jpg',1,'2014-11-21 17:13:43',NULL,28,NULL),(109,1,24,29,95,0,'thumb20141202112209376&tamdao100v1.jpg',1,'2014-11-21 17:16:49',NULL,27,NULL),(110,1,24,29,95,0,'thumb20141202112943080&vetyverio-flacon-dos.jpg',1,'2014-11-21 17:19:37',NULL,27,NULL),(111,1,24,29,95,0,'thumb20141202113028908&volute100v1_1.jpg',1,'2014-11-21 17:21:35',NULL,27,NULL),(112,1,25,29,45,0,'thumb20141202113440235&aobc_freshlotion.jpg',1,'2014-11-21 17:39:17',NULL,29,NULL),(113,1,25,29,55,0,'thumb20141202113844846&bc_pommade_exfoliante-pot_q.jpg',1,'2014-11-21 17:46:57',NULL,29,NULL),(114,1,25,29,67,0,'thumb20141202113528673&abc_creme_riche_1.jpg',1,'2014-11-21 17:52:53',NULL,29,NULL),(115,1,25,29,35,0,'thumb20141202113615259&abc_baume_genereux.jpg',1,'2014-11-21 17:58:38',NULL,29,NULL),(116,1,25,29,35,0,'thumb20141202113344716&bc_emulsion_velours-pot_q.jpg',1,'2014-11-21 18:03:35',NULL,29,NULL),(124,1,18,50,120,0,'thumb20141202153253583&bagsdesign2.jpg',1,'2014-11-22 16:57:16',NULL,20,NULL),(125,1,18,50,130,0,'thumb20141202153314420&designinverso1.jpg',1,'2014-11-22 17:00:40',NULL,20,NULL),(132,1,25,29,60,0,'thumb20141202113709727&bc_revitalizing-shower-gel_q.jpg',1,'2014-11-24 18:25:23',NULL,31,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_description` (
  `idProduct` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`idLanguages`),
  KEY `fk_ProductDescription_Product1` (`idProduct`),
  CONSTRAINT `fk_ProductDescription_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (27,'en','Prodotto di prova'),(27,'it','Prodotto di prova'),(30,'en','Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp'),(30,'it','Pvc milano borsa, effetto pelle trapuntata, catena a tracolla, chiusura a calamita '),(31,'en','Crew neck tunic in compact cady crepe'),(31,'it','Tunica girocollo in crepe cady compatto '),(33,'en','Fashion show\'s dress in radzimr, with '),(33,'it','Abito girocollo di sfilata in radzimr, con stampa magnus plessen 2.'),(34,'en','Crew neck dress in bicolor bonded jersey '),(34,'it','Abito girocollo in doppio jersey bicolore '),(35,'en','Crew neck sweatshirt in bonded jersey, with \"dripping\" drawing'),(35,'it','Felpa girocollo di sfilata in jersey accoppiato, stampa '),(36,'en','Fashion show\'s coat in bonded plush alpaca'),(36,'it','Giacca di sfilata in felpa e alpaca accoppiata '),(37,'en','Fashion show\'s skirt in cotton and double silk, with \"bright\" stamp'),(37,'it','Gonna di  sfilata in cotone e seta double con stampa \"bright\"'),(38,'en','Fashion show\'s crew neck sweater in jacquard check'),(38,'it','Maglia girocollo di sfilata con jacquard check'),(39,'en','Crew neck shirt with \"bright\" stamp'),(39,'it','Blusa girocollo con stampa \"bright\" blu'),(40,'en','Sweatshirt with truth beauty'),(40,'it','Felpa con scritta truth beauty'),(41,'en','Double breasted coat in wool with coyote\'s neck'),(41,'it','Cappotto doppio petto in panno di lana con colletto di coyote'),(42,'en','Coat with flower fantasy'),(42,'it','Cappotto fantasia fiori '),(43,'en','Crew neck dress with jacquard lurex roses'),(43,'it','Abito girocollo broccato lurex rose jacquard'),(44,'en','Bermuda shorts in eco nappa leather pliss'),(44,'it','Bermuda in eco nappa pliss'),(45,'en','Dress with latex top and cool wool skirt'),(45,'it','Abito con top in latex e gonna in fresco lana'),(46,'en','Skirt in silver laminated canvas'),(46,'it','Gonna a ruota in tela laminata argento'),(47,'en','Alpaca wool coat'),(47,'it','Cappotto in alpaca grigio'),(48,'en','Gray strips trouser in cashemere, lin and silk'),(48,'it','Pantalone a righe grigie in cashemere, lino e seta'),(49,'en','Trousers in high twisted wool'),(49,'it','Pantalone in gabardine stretch, modello sopra la caviglia.'),(50,'en','Bermuda shorts in wool and silk with fur effect'),(50,'it','Bermuda in lana e seta effetto pelliccia'),(51,'en','Crew neck shirt in china crepe with written phrases'),(51,'it','Blusa girocollo in crepe de china con stampa scritte'),(52,'en','Crew neck sweater with check fantasy'),(52,'it','Maglia girocollo con fantasia check sul davanti'),(53,'en','Sweatshirt with roses\'s drawing'),(53,'it','Felpa con stampa rose graffiate'),(54,'en','3/4 length wide pants in eco leather'),(54,'it','Pantalone 3/4 largo in eco pelle'),(55,'en','Quilted over teen top'),(55,'it','Top over trapuntato '),(56,'en','Net over dress'),(56,'it','Top lungo a rete '),(57,'en','Dress copper colored with a black bow'),(57,'it','Abito rame con fiocco nero sul davanti'),(58,'en','Stripes dress blue/black in stretch wool'),(58,'it','Abito a righe blu/black in lana stretch'),(59,'en','Stripes shirt with paillettes'),(59,'it','Camicia a righe con applicazioni'),(60,'en','Stripes shirt with paillettes'),(60,'it','Camicia a righe con applicazioni'),(61,'en','Blu and golden stripes skirt above the knee.'),(61,'it','Gonna sopra il ginocchio a righe blu e oro.'),(62,'en','Shirt with puffball on the shoulder'),(62,'it','Camicia con spalle a sbuffo di taffettà'),(63,'en','Ring in silver plated pink gold.'),(63,'it','Anello in argento placcato oro rosa.'),(64,'en','Full finger ring moon texture.'),(64,'it','Anello copridito superficie lunare.'),(66,'en','Necklace with moon stone'),(66,'it','Collana con pietra di luna'),(67,'en','Bracelet/ring silver plated pink golden'),(67,'it','Bracciale anello argento placcato oro rosa'),(68,'en','Balls necklace in fumé resin'),(68,'it','Collana a palle in resina fumé'),(69,'en','Embroided necklace with glass bead'),(69,'it','Collana ricamata con perline di vetro'),(70,'en','Necklace with a big resin fumé pearl '),(70,'it','Collana mille fili con perla in resina rosso fumé'),(71,'en','Necklace with pearls'),(71,'it','Collana mille fili con perle '),(72,'en','Silver earings and taffeta roses'),(72,'it','Orecchini in argento e rosa in taffetà'),(73,'en','Necklace with a heart \"the heart has reasons, that reason cannot know\".'),(73,'it','Collana con un cuore \" the heart has reasons, that reason cannot know\".'),(74,'en','Ostrich bag with magnetic closure'),(74,'it','Borsa in struzzo con chiusura a calamita'),(75,'en','Small patchwork bag'),(75,'it','Borsa di piccola dimensione patchwork'),(76,'en','Patchwork shopping bag'),(76,'it','Shopping bag patchwork'),(77,'en','Pvc \" bright\" shopping bag.'),(77,'it','Shopping bag stampa \"bright\".'),(78,'en','Kate rstv pierced satin and mirrored calf, multicolor base rasberry.'),(78,'it','Kate rsvt raso traforato e vitello specchiato multicolor con base rasberry.'),(79,'en','Petit faye na nola in nappa leather, with horn details '),(79,'it','Petit faye na nola di nappa laserata e dettagli in corno'),(80,'en','Faye na piwa in nappa leather and chamois in multicolor base black'),(80,'it','Faye na piwa in nappa e camoscio in multicolor con base nero'),(81,'en','Fashion show plumes pochette, cory bag in felt.'),(81,'it','Pochette di piume di sfilata, cory bag in feltro ossediana.'),(82,'en','Leather lace-up shoe with silver tip and crepe.'),(82,'it','Scarpa stringata di pelle lucida con punta argento e suola di para'),(83,'en','Fashion show calf ankleboot bordaux with black tip, golden zip and 5 cm heel.'),(83,'it','Tronchetto di sfilata bordaux con punta nera in vitello, zip in metallo dorato e tacco 5 cm'),(84,'en','Fashion show lace-up shoes in domesticated calf. removable flap with golden plate.'),(84,'it','Allacciata di sfilata in vitello spazzolato. linguetta staccabile con placca di metallo dorato.'),(85,'en','Maryjane in domasticated calf with 7 cm heel.'),(85,'it','Maryjane in vitello spazzolato con tacco di 7 cm.'),(86,'en','Calfskin criss-cross sandals with square and round cabochon and leather sole.'),(86,'it','Sandalo in cavallino incrociato impreziosito con applicazioni cabochon e fondo cuoio.'),(87,'en','Fashion show necklace in resin with length-adjustable leather string.'),(87,'it','Collana di sfilata in resina con laccio regolabile di cuoio.'),(88,'en','Fashion show necklace in resin with length-adjustable leather string.'),(88,'it','Collana di sfilata in resina con laccio regolabile di cuoio.'),(89,'en','Horn necklace with technic ribbon.'),(89,'it','Collana di corno con nastro tecnico.'),(90,'en','Wool hat with ostrich\'s plumes'),(90,'it','Cappello di lana con piume di struzzo davanti'),(91,'en','Wool hat with pin-pon and veil'),(91,'it','Cappello di lana con pon-pon e veletta'),(92,'en','Wool stripes hat with pon-pon and veil'),(92,'it','Cappello di lana a righe con pon pon e veletta'),(93,'en','Peaked cap with wool rabbit ears'),(93,'it','Cappello con visiera e orecchie da coniglio in lana'),(94,'en','Gold bracelet with piece of chinese porcelain.'),(94,'it','Bracciale d\'oro e di porcellana cinese.'),(95,'en','Gold bracelet with piece of porcelain plate.'),(95,'it','Bracciale d\'oro e di frammenti di piatti di porcellana. '),(96,'en','Cris cros leather wedge shoes with chamois tip'),(96,'it','Zeppa incrociata di pelle con punta in camoscio'),(97,'en','Lace-up shoes with sheepskin inside'),(97,'it','Scarpa stringata con pelliccia di montone interna'),(98,'en','Cris cros leather wedge shoes with chamois tip'),(98,'it','Zeppa incrociata di pelle con punta in camoscio'),(99,'en','Eco-fur wedge shoes sneaker '),(99,'it','Sneaker in eco-pelliccia con la zeppa'),(100,'en','Mohair top'),(100,'it','Gilet di pelliccia mohair'),(101,'en','Eau de lierre (edt 100). eau de toilette based on leafs of ivy with notes of cyclamen, green pepper, amber and depths of rosewood. '),(101,'it','Eau de lierre (edt 100). eau de toilette con prevalenza di foglie d\'edera, accompagnata a note di ciclamino, geranio, pepe verde, ambra, legno di palissandro e muschio.'),(102,'en','Oyedo (edt 100). eau de toilette based on lemon, green mandarin, tangy orange, tamarind, grapefruit and thyme.'),(102,'it','Oyedo (edt 100). eau de toilette a base di pompelmo, mandarino verde, arancio della florida, limone italiano, tamarindo, timo e cedro'),(103,'en','Eau duelle (edt 100). eau de toilette based on vanilla combined with juniper berries, black tea, cardamom and vetiver.'),(103,'it','Eau duelle (edt 100). eau de toilette con prevalenza di vaniglia accompagnata da note di bacche di ginepro, bacche di rosa, cardamomo, thè nero, vetiver.'),(104,'en','Philosykos (edt 100). eau de toilette based on fig leaves and wood, white cedar.'),(104,'it','Philosykos (edt 100). eau de toilette a base di foglie di fico, legno di fico e cedro bianco.'),(105,'en','Do son (edt 75). eau de perfum based on tuberose, orange leaves, pink peppercorn, musk.'),(105,'it','Do son (edt 75). eau de perfum a base di foglie d\'arancio, tuberosa, pepe rosa, muschio.'),(106,'en','L\'ombre dans l\'eau (edt 75). eau de perfum based on blackcurrant leaves e bulgarian roses. '),(106,'it','L\'ombre dans l\'eau (edt 75). eau de perfum a bsa di foglie di ribes nero e rosa bulgara.'),(107,'en','Philosykos (edt 75). eau de parfum fig leaves and wood, white cedar.'),(107,'it','Philosykos (edt 75). eau de parfum a base di foglie di fico, legno di fico e cedro bianco.'),(108,'en','Volutes (edt 75). eau de parfum based on spices, tobacco, honey, iris e styrax.'),(108,'it','Volutes (edt 75). eau de parfum a base di spezie, tabacco, miele e iris.'),(109,'en','Tam dao (edt 100). eau de toilette based on sandalwood, rosewood, cypress e ambergris.'),(109,'it','Tam dao (edt 100). eau de toilette a base di legno di sandalo, palissandro, cipresso e ambra grigia.'),(110,'en','Vetyverio (edt 100). eau de toilette based on vetiver'),(110,'it','Vetyverio (edt 100). eau de toilette a base di vetiverio.'),(111,'en','Volutes (edt 100). eau de toilette based on spices, tobacco, honey, iris e styrax.'),(111,'it','Volutes (edt 100). eau de toilette a base di spezie, tabacco, miele e iris.'),(112,'en','Lait frais. this fresh lotion for the body makes softens skin for the property of orange flowers and the almond oil. '),(112,'it','Lait frais. questo latte fresco per il corpo lascia la pelle morbida e lenita grazie alle proprietà dei fiori d\'arancia e dell\'olio di mandorla.'),(113,'en','Pommade exfoliante. rich and regenerant smoothing body polish for the body for emollient pomegranate oil.'),(113,'it','Pommade exfoliante. crema esfoliante per il corpo ricca, cremosa e rigenerante grazie all\'olio di melograno che rende la pelle elastica e setosa.'),(114,'en','Créme riche. rich butter for the body makes dry and sensitive skin with the delicious fragrance of a byzantine rose.'),(114,'it','Créme riche. crema ricca per il corpo  che lascia la pelle luminosa e delicatamente profumata grazie all\'acqua di rose che rinfresca, idrata e lenisce.'),(115,'en','Baume genéreux. this hand cream revitalizes the skin for the karité butter, the argan oil and the apricot oil.'),(115,'it','Baume genéreux. questa crema mani rivitalizza la pelle grazie al burro di karité, all\'olio di argan e all\'olio di nocciolo di albicocca.'),(116,'en','Emultion veluors pour les mains. this silky hand lotion made from the everlasting \"golden flower\" with regenerating, repairing, moisturizing and anti-oxidant properties'),(116,'it','Emultion veluors pour les mains. questa emulsione mani le avvolge in un velo leggero e vellutato e in più l\'acqua floreale di semprevivo le ripara e protegge.'),(124,'en','Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp'),(124,'it','Pvc borsa milano, effetto pelle trapuntata, catena a tracolla, chiusura a calamita '),(125,'en','Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp'),(125,'it','Pvc borsa milano, effetto pelle trapuntata, catena a tracolla, chiusura a calamita '),(132,'en','Revitalizing shower gel for body and hair. this gel combines bergamot scent with the floral scent of peppermint and with extract of almond.'),(132,'it','Gel lavant revigorant. gel per il corpo e i capelli a base di bergamotto, foglie di menta ed estratti di mandorla');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_image` (
  `idProduct` int(11) NOT NULL,
  `pgImage` int(11) NOT NULL,
  `txImageUrl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`pgImage`),
  KEY `fk_ProductImage_Product1_idx` (`idProduct`),
  CONSTRAINT `fk_ProductImage_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (27,1,'20141027161832712&45239055TE_13P_F.jpg'),(30,1,'20141110145915895&IMG_5244.JPG'),(30,3,'20141110152118223&IMG_5246.jpg'),(31,1,'20141202123227110&IMG_1577.jpg'),(33,1,'20141202123438452&IMG_1586.jpg'),(34,1,'20141202123558626&IMG_1582.jpg'),(35,1,'20141202130425171&IMG_1565.JPG'),(36,1,'20141202130955055&IMG_1588.jpg'),(37,1,'20141127125558413&IMG_1571.jpg'),(38,1,'20141202131037758&IMG_1569.JPG'),(39,1,'20141202151027733&IMG_1563.jpg'),(40,1,'20141202130553258&IMG_1520.jpg'),(41,1,'20141202125703934&IMG_1552.jpg'),(42,1,'20141202125743567&IMG_1561.jpg'),(43,1,'20141202123656922&IMG_1540.jpg'),(44,1,'20141202131809015&IMG_1544.jpg'),(45,1,'20141202123833980&IMG_1546.jpg'),(46,1,'20141202131611968&IMG_1530.jpg'),(47,1,'20141202125846627&IMG_1600.jpg'),(48,1,'20141202131911122&IMG_1598.jpg'),(49,1,'20141202131951185&IMG_1592.jpg'),(50,1,'20141202132026576&IMG_1548.jpg'),(51,1,'20141202151118594&IMG_1505.jpg'),(52,1,'20141202132537186&IMG_1506.JPG'),(53,1,'20141202130654886&IMG_1518.JPG'),(54,1,'20141202132105618&IMG_1603.jpg'),(55,1,'20141202151317124&IMG_1611.jpg'),(56,1,'20141202151353554&IMG_1619.jpg'),(57,1,'20141202124007840&IMG_1637.jpg'),(58,1,'20141202124107859&IMG_1651.jpg'),(59,1,'20141202125237906&IMG_1656.jpg'),(60,1,'20141202125424168&IMG_1643.jpg'),(61,1,'20141202131652487&IMG_1647.jpg'),(62,1,'20141202125514352&IMG_1642.JPG'),(63,1,'20141202151919904&anbjorg1.jpg'),(63,2,'20141202151919887&anbjorg2.jpg'),(64,1,'20141202151945773&annellobjorg.jpg'),(66,1,'20141202152004107&bjorgneck1.jpg'),(67,1,'20141202152021261&bjorgringbracelet.jpg'),(68,1,'20141202152046981&calderaranecklace1.jpg'),(69,1,'20141202152105344&calderaranecklace3.jpg'),(70,1,'20141202152121476&calderaranecklace2.jpg'),(71,1,'20141202152139351&calderaranecklace5.jpg'),(72,1,'20141202152158886&orrechinicalderara.jpg'),(73,1,'20141202152220159&heartbjorgnecklace.jpg'),(74,1,'20141202153028751&jaminbag1.jpg'),(75,1,'20141202153049081&jaminbag2.jpg'),(76,1,'20141202153106520&jaminbig2.jpg'),(77,1,'20141202153124945&marnibag.jpg'),(78,1,'20141202153145383&paula3.jpg'),(79,1,'20141202153201310&paulapink.jpg'),(80,1,'20141202153218767&cademartori2.jpg'),(81,1,'20141202153239692&marnipochette.jpg'),(82,1,'20141202153342718&aranthsilver.jpg'),(83,1,'20141202153400698&marniboots1.jpg'),(83,2,'20141202153400774&marniboots2.jpg'),(84,1,'20141202153428962&marniborde1.jpg'),(85,1,'20141202153448965&marnimaryjane2.jpg'),(85,2,'20141202153448899&marnimaryjane1.jpg'),(86,1,'20141202153509312&marnisandals.jpg'),(87,1,'20141119170640438&marninecklace1.jpg'),(88,1,'20141202152248681&marninecklace2.jpg'),(88,2,'20141202152306015&marninecklace1.jpg'),(89,1,'20141202152431774&marninecklace3.jpg'),(90,1,'20141202152453731&capbernstock2.jpg'),(90,2,'20141202152512868&capbern1.jpg'),(91,1,'20141202152608141&capbernstock3.jpg'),(91,2,'20141202152608165&capbernstock6.jpg'),(91,3,'20141202152608394&capbern4.jpg'),(92,1,'20141202152729884&capbernstock8.jpg'),(92,2,'20141202152737972&capbernstock7.jpg'),(93,1,'20141202152814492&capbernstock9.jpg'),(94,1,'20141202152838307&pdbrac.jpg'),(95,1,'20141202152859068&pdbracel2.jpg'),(96,1,'20141120145300937&peternon1.jpg'),(97,1,'20141202153531948&peternonfront.jpg'),(97,2,'20141202153531955&peternonfur1.jpg'),(98,1,'20141202153558877&peternon1.jpg'),(98,2,'20141202153558988&peternon2.jpg'),(98,3,'20141202153559286&peternon3.jpg'),(99,1,'20141202153624436&premiatafur.jpg'),(99,2,'20141202153624441&premiatafur2.jpg'),(100,1,'20141202151441584&IMG_1626.jpg'),(101,1,'20141202112331383&edt_new_color_resize_eau_de_lierre.jpg'),(102,1,'20141202112438343&edt_new_color_resize_oyedo_1.jpg'),(103,1,'20141202112523760&edt_new_color_resize_eau_duelle.jpg'),(104,1,'20141202112601322&edt_new_color_resize_philosykos.jpg'),(105,1,'20141202112633185&edt_new_color_resize_doson.jpg'),(106,1,'20141202112715827&lombre_dans_resize.jpg'),(107,1,'20141202112754652&philosykos_resize-1.jpg'),(108,1,'20141202112855644&volutesp75.jpg'),(109,1,'20141202112209376&tamdao100v1.jpg'),(110,1,'20141202112943080&vetyverio-flacon-dos.jpg'),(111,1,'20141202113028908&volute100v1_1.jpg'),(112,1,'20141202113440235&aobc_freshlotion.jpg'),(113,1,'20141202113844846&bc_pommade_exfoliante-pot_q.jpg'),(114,1,'20141202113528673&abc_creme_riche_1.jpg'),(115,1,'20141202113615259&abc_baume_genereux.jpg'),(116,1,'20141202113344716&bc_emulsion_velours-pot_q.jpg'),(124,1,'20141202153253583&bagsdesign2.jpg'),(125,1,'20141202153314420&designinverso1.jpg'),(132,1,'20141202113709727&bc_revitalizing-shower-gel_q.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_state`
--

DROP TABLE IF EXISTS `product_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_state` (
  `idProductState` int(11) NOT NULL,
  `txProductState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProductState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_state`
--

LOCK TABLES `product_state` WRITE;
/*!40000 ALTER TABLE `product_state` DISABLE KEYS */;
INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO'),(2,'CANCELLATO');
/*!40000 ALTER TABLE `product_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refound_articles`
--

DROP TABLE IF EXISTS `refound_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refound_articles` (
  `idRefound` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  `fgChangeRefound` char(1) DEFAULT NULL,
  `txChangeRefound` varchar(250) DEFAULT NULL,
  `pgArticleNew` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRefound`,`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Article1_idx` (`idProdotto`,`pgArticle`),
  KEY `fk_Refound_Articles_Order_Refound1_idx` (`idRefound`),
  CONSTRAINT `fk_OrdersArticles_Article10` FOREIGN KEY (`idProdotto`, `pgArticle`) REFERENCES `article` (`idProduct`, `pgArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Refound_Articles_Order_Refound1` FOREIGN KEY (`idRefound`) REFERENCES `order_refound` (`idRefound`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refound_articles`
--

LOCK TABLES `refound_articles` WRITE;
/*!40000 ALTER TABLE `refound_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `refound_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `idShop` int(11) NOT NULL,
  `txShop` varchar(100) DEFAULT NULL,
  `txMail` varchar(100) DEFAULT NULL,
  `txNome` varchar(45) DEFAULT NULL,
  `txVia` varchar(100) DEFAULT NULL,
  `txComune` varchar(100) DEFAULT NULL,
  `cdCap` int(11) DEFAULT NULL,
  `txProvincia` varchar(100) DEFAULT NULL,
  `txNazione` varchar(100) DEFAULT NULL,
  `txTel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idShop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Siena','shop@magboutique.it','Mag Boutique','Via dei Termini, 49','Siena',53100,'SI','Italia','+39 0577 41043');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_images`
--

DROP TABLE IF EXISTS `site_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `pgGroupImages` int(11) NOT NULL,
  `txName` varchar(100) DEFAULT NULL,
  `idGender` int(11) DEFAULT NULL,
  `urlRedirect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`,`pgGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES ('carousel',1,'DSC_1336.JPG',NULL,NULL),('carousel',2,'DSC_1486 copia.jpg',NULL,NULL),('carousel',3,'DSC_1393.JPG',NULL,NULL),('carousel',4,'DSC_1524.JPG',NULL,NULL),('carousel',5,'DSC_1345.JPG',NULL,NULL),('carousel',6,'DSC_1477 copia.jpg',NULL,NULL),('carousel',7,'DSC_1537.JPG',NULL,NULL),('carousel',8,'DSC_1670.JPG',NULL,NULL),('carousel',9,'DSC_1599 copia 2.jpg',NULL,NULL),('carousel',10,'DSC_1568.JPG',NULL,NULL),('carousel',11,'DSC_1618 copia.jpg',NULL,NULL),('carousel',12,'DSC_1653.JPG',NULL,NULL),('carousel',13,'DSC_1739.JPG',NULL,NULL),('carousel',14,'DSC_1741.JPG',NULL,NULL),('carousel',15,'DSC_1770.JPG',NULL,NULL),('carousel',16,'DSC_1766.JPG',NULL,NULL),('carousel',17,'DSC_1838.JPG',NULL,NULL),('carousel',18,'DSC_1908.JPG',NULL,NULL),('carousel',19,'DSC_2000.JPG',NULL,NULL),('carousel',20,'DSC_2003.JPG',NULL,NULL),('carousel',21,'DSC_1962.JPG',NULL,NULL),('carousel',22,'DSC_1998.JPG',NULL,NULL),('new',1,'new.png',NULL,NULL),('newArrivals',1,'22112014185308903&Set 2.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),('newArrivals',2,'22112014185328289&tumblr_nfaoele6AC1rvje7uo1_1280.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),('promo',1,'promo.png',NULL,NULL),('tabNav',1,'logoTab2.png',1,NULL);
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `idSize` int(11) NOT NULL,
  `txSize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'34'),(2,'36'),(3,'38'),(4,'40'),(5,'42'),(6,'44'),(7,'46'),(8,'48'),(9,'50'),(10,'52'),(11,'54'),(12,'56'),(13,'58'),(14,'60'),(15,'XXS'),(16,'XS'),(17,'S'),(18,'M'),(19,'L'),(20,'XL'),(21,'XXL'),(22,'U'),(24,'35'),(26,'37'),(28,'39'),(30,'41'),(32,'43'),(34,'45'),(36,'47'),(37,'24'),(38,'25'),(39,'26'),(40,'27'),(41,'28'),(42,'29'),(43,'30'),(44,'31'),(45,'32'),(46,'33'),(47,'36 1/2'),(48,'37 1/2'),(49,'38 1/2'),(50,'39 1/2');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `idStato` int(11) NOT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStato`),
  UNIQUE KEY `idStato_UNIQUE` (`idStato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),(3,'COMPLETED'),(4,'DENIED'),(5,'EXPIRED'),(6,'FAILED'),(7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),(9,'PENDING'),(10,'REFUNDED'),(11,'REVERSED'),(12,'PROCESSED'),(13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),(15,'SPEDITO'),(100,'REQUEST REFOUND'),(101,'REFOUND COMPLETED'),(102,'REFOUND REFUSED'),(103,'REFOUND CANCELED'),(200,'REQUEST CHANGE'),(201,'CHANGE COMPLETED'),(202,'CHANGE REFUSED'),(203,'CHANGE CANCELED');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_orders`
--

DROP TABLE IF EXISTS `states_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_orders` (
  `idOrder` int(11) NOT NULL,
  `idStato` int(11) NOT NULL,
  `dtStato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txNote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idOrder`,`idStato`),
  KEY `fk_StatesOrders_States1_idx` (`idStato`),
  KEY `fk_StatesOrders_Orders1_idx` (`idOrder`),
  CONSTRAINT `fk_StatesOrders_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_StatesOrders_States1` FOREIGN KEY (`idStato`) REFERENCES `states` (`idStato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_orders`
--

LOCK TABLES `states_orders` WRITE;
/*!40000 ALTER TABLE `states_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_refound`
--

DROP TABLE IF EXISTS `states_refound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_refound` (
  `idRefound` int(11) NOT NULL,
  `idStato` int(11) NOT NULL,
  `dtStato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txNote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idRefound`,`idStato`),
  KEY `fk_StatesOrders_States1_idx` (`idStato`),
  KEY `fk_States_Orders_copy1_Order_Refound1_idx` (`idRefound`),
  CONSTRAINT `fk_StatesOrders_States10` FOREIGN KEY (`idStato`) REFERENCES `states` (`idStato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_States_Orders_copy1_Order_Refound1` FOREIGN KEY (`idRefound`) REFERENCES `order_refound` (`idRefound`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_refound`
--

LOCK TABLES `states_refound` WRITE;
/*!40000 ALTER TABLE `states_refound` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_refound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `idType` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txType` varchar(200) NOT NULL,
  PRIMARY KEY (`idType`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'en','Accessories'),(1,'it','Accessori'),(3,'en','Shirts'),(3,'it','Camicie'),(4,'en','Coats'),(4,'it','Cappotti'),(5,'en','Dresses'),(5,'it','Abiti'),(7,'en','Sweatshirts'),(7,'it','Felpe'),(8,'en','Jackets'),(8,'it','Giacche'),(9,'en','Leather jackets'),(9,'it','Giacche di pelle'),(11,'en','Casual jackets'),(11,'it','Giubbotti'),(12,'en','Skirts'),(12,'it','Gonne'),(15,'en','Knitwear'),(15,'it','Maglie'),(16,'en','Pants'),(16,'it','Pantaloni'),(17,'en','Cardigan'),(17,'it','Cardigan'),(18,'en','Bags'),(18,'it','Borse'),(19,'en','Tops'),(19,'it','Canotte'),(20,'en','Shoes'),(20,'it','Scarpe'),(21,'en','T-shirts'),(21,'it','T-shirts'),(22,'en','Top'),(22,'it','Top'),(23,'en','Bijoux'),(23,'it','Bijoux'),(24,'en','Perfume'),(24,'it','Profumi'),(25,'en','Body care'),(25,'it','Linea corpo');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_state_account`
--

DROP TABLE IF EXISTS `type_state_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_state_account` (
  `idTypeState` int(11) NOT NULL,
  `txTypeState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_state_account`
--

LOCK TABLES `type_state_account` WRITE;
/*!40000 ALTER TABLE `type_state_account` DISABLE KEYS */;
INSERT INTO `type_state_account` VALUES (1,'DISATTIVATO'),(2,'ATTIVATO'),(3,'CESSATO'),(4,'RESET_PSW');
/*!40000 ALTER TABLE `type_state_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-03  9:43:51
