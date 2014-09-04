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
SET FOREIGN_KEY_CHECKS = 0;
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
INSERT INTO `article` VALUES (1,0,47,11,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'ASDFASHDKJFHSKLFJHSADFH'),(1,1,49,11,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'ASDFASHDKJFHSKLFJHSADFH'),(1,2,51,11,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'ASDFASHDKJFHSKLFJHSADFH'),(2,0,46,5,1,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'WERTWERTWERTEWRT'),(2,1,49,5,1,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'WERTWERTWERTEWRT'),(3,0,37,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'DFGDFSGDSFGDFSG'),(3,1,38,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'DFGDFSGDSFGDFSG'),(3,2,39,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'DFGDFSGDSFGDFSG'),(4,0,8,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'DFSGSDFGSDFGDFS'),(4,1,9,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'DFSGSDFGSDFGDFS'),(4,2,10,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'DFSGSDFGSDFGDFS'),(5,0,9,11,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'WEFGDFGTRTRYTRY'),(5,1,10,11,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'WEFGDFGTRTRYTRY'),(6,0,17,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'XCVZXCGDFGDSFGDFG'),(6,1,18,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'XCVZXCGDFGDSFGDFG'),(6,2,19,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'XCVZXCGDFGDSFGDFG'),(6,3,19,9,1,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'XCVZXCGDFGDSFGDFG'),(6,4,17,9,1,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'XCVZXCGDFGDSFGDFG'),(7,0,15,11,20,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG',1,'WQERQWERWQERWQERWQER'),(8,0,17,17,20,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG',1,'DFGFGSDFGDSFGDFG'),(9,0,26,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'SDRWERWQERQWER'),(9,1,27,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'SDRWERWQERQWER'),(9,2,28,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'SDRWERWQERQWER'),(10,0,22,11,1,'PROVA1.JPG',1,'RWETERTERTERT'),(15,1,37,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'DFGDFGDFGDGDFG'),(15,2,38,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'DFGDFGDFGDGDFG'),(15,3,39,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'DFGDFGDFGDGDFG'),(16,1,37,11,1,'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'SDFGKLJDSFLKGJDFKLGJ'),(16,2,38,11,1,'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'SDFGKLJDSFLKGJDFKLGJ'),(17,1,37,5,1,'thumb003_85230538-e039-4964-aea8-2bbe15b56677.JPG',1,'FGHFGHFGHFDHFGHFD'),(18,1,38,4,1,'thumb055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG',1,'GHJGHJGHJGHJGHJ'),(19,1,37,11,1,'thumb012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG',1,'GFGFFGDHGGFHGFHFGH'),(20,1,38,14,1,'thumb022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG',1,'TYUUUTTURYUTYUTY'),(21,1,37,10,1,'thumb040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG',1,'BHJGHJKJKHJK'),(22,1,37,13,1,'thumb020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG',1,'GFHHFGHGFHFGH'),(23,1,37,4,1,'thumb008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG',1,'GFHFGHFGHFGHFGH'),(24,1,37,5,1,'thumbfca2f34e-4be1-4b67-8000-1a81a2710618.JPG',1,'HJGHJGHJGHJGHJ'),(25,1,37,11,1,'thumb043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG',1,'GHFGHFGHFGH');
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
  `idLanguages` varchar(2) NOT NULL,
  `txBrand` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idBrand`,`idLanguages`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'it','LANVIN'),(2,'it','BALMAIN'),(3,'it','DSQUARED'),(4,'it','MOSCHINO'),(5,'it','DOLCE E GABBANA'),(6,'it','STONE ISLAND'),(7,'it','BLOCH'),(8,'it','ARMANI'),(9,'it','DIOR'),(10,'it','SAINT LAURENT'),(11,'it','ALEXANDER MCQUEEN'),(12,'it','UGG AUSTRALIA'),(13,'it','GIVENCHY'),(14,'it','APRIL 77'),(15,'it','VALENTINO'),(16,'it','ANN DEMEULEMEESTER'),(17,'it','JUST CAVALLI'),(18,'it','DIESEL'),(19,'it','EACH X OTHER');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `idCampaign` int(11) NOT NULL,
  `txCampaign` varchar(45) DEFAULT NULL,
  `dtInizio` date DEFAULT NULL,
  `dtFine` date DEFAULT NULL,
  `pcSconto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCampaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color` (
  `idColor` int(11) NOT NULL AUTO_INCREMENT,
  `idLanguages` varchar(2) NOT NULL,
  `txColor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idColor`,`idLanguages`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'it','ARANCIONE'),(2,'it','ARGENTO'),(3,'it','BEIGE'),(4,'it','BIANCO'),(5,'it','BLU'),(6,'it','CELESTE'),(7,'it','DENIM'),(8,'it','GIALLO'),(9,'it','GRIGIO'),(10,'it','MARRONE'),(11,'it','NERO'),(12,'it','ORO'),(13,'it','ROSA'),(14,'it','ROSSO'),(15,'it','VERDE'),(16,'it','VIOLA'),(17,'it','LEOPARD');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `idCoupon` varchar(45) NOT NULL,
  `idUser` varchar(100) NOT NULL,
  `pcSconto` smallint(6) DEFAULT NULL,
  `dtScadenza` date DEFAULT NULL,
  `dtUtilizzo` date DEFAULT NULL,
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
INSERT INTO `customer` VALUES ('1','ANTANI','A','A','A',1);
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
INSERT INTO `customer_roles` VALUES ('1','AMMINISTRATORE');
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
  `imSpese` decimal(15,0) DEFAULT NULL,
  `fgDeleted` tinyint(4) DEFAULT NULL,
  `txDescrizioneExt` varchar(250) DEFAULT NULL,
  `txLinkTracking` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDeliveryCost`),
  UNIQUE KEY `idDeliveryCost_UNIQUE` (`idDeliveryCost`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_cost`
--

LOCK TABLES `delivery_cost` WRITE;
/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
INSERT INTO `delivery_cost` VALUES (1,'Corriere Espresso Bartolini',5,0,'Corriere Espresso Bartolini','http://Stocazzo'),(2,'Corriere Espresso SDA',5,0,'Corriere Espresso SDA','http://Stocazzo'),(3,'Posta Ordinaria',3,0,'Posta Ordinaria','http://Stocazzo'),(4,'Posta Raccomandata',4,0,'Posta Raccomandata','http://Stocazzo');
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;
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
INSERT INTO `gender` VALUES (1,'it','UOMO'),(2,'it','DONNA'),(3,'it','BAMBINO'),(4,'it','BAMBINA');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipnmessages`
--

DROP TABLE IF EXISTS `ipnmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipnmessages` (
  `idOrder` int(11) NOT NULL,
  `idTransaction` varchar(50) NOT NULL,
  `tsInserimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txMessage` varchar(10000) DEFAULT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  `txNote` varchar(100) DEFAULT NULL,
  `fgElaborato` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idOrder`,`idTransaction`)
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
  PRIMARY KEY (`idOrder`),
  UNIQUE KEY `idOrder_UNIQUE` (`idOrder`),
  KEY `fk_Orders_Customer1_idx` (`idUser`),
  KEY `fk_Orders_Addresses1` (`idAddressFat`),
  KEY `fk_Orders_Addresses2` (`idAddressSpe`),
  KEY `fk_Orders_Delivery_Cost1` (`idDeliveryCost`),
  CONSTRAINT `fk_Orders_Addresses1` FOREIGN KEY (`idAddressFat`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Addresses2` FOREIGN KEY (`idAddressSpe`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  PRIMARY KEY (`idProduct`),
  KEY `idProduct_INDEX1` (`idProduct`),
  KEY `fk_Product_Product_State1` (`idProductState`),
  KEY `fk_Product_Gender1` (`idGender`),
  KEY `fk_Product_Type1` (`idType`),
  KEY `fk_Product_Brand1` (`idBrand`),
  KEY `fk_Product_Campaigns1` (`idCampaign`),
  CONSTRAINT `fk_Product_Brand1` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Campaigns1` FOREIGN KEY (`idCampaign`) REFERENCES `campaigns` (`idCampaign`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Gender1` FOREIGN KEY (`idGender`) REFERENCES `gender` (`idGender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Product_State1` FOREIGN KEY (`idProductState`) REFERENCES `product_state` (`idProductState`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Type1` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,14,1,860,20,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'2014-09-03 10:58:38',NULL),(2,1,14,3,398,20,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'2014-09-03 11:03:02',NULL),(3,1,16,1,1455,50,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'2014-09-03 11:05:14',NULL),(4,1,9,10,4599,50,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'2014-09-03 11:07:35',NULL),(5,1,5,3,975,20,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'2014-09-03 11:09:45',NULL),(6,1,15,11,750,50,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'2014-09-03 11:14:02',NULL),(7,1,21,11,1,0,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG',1,'2014-09-03 11:17:35',NULL),(8,1,21,10,2,50,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG',1,'2014-09-03 11:18:55',NULL),(9,2,20,12,200,20,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'2014-09-03 11:21:16',NULL),(10,2,1,13,1590,10,'PROVA1.JPG',1,'2014-09-03 11:55:19',NULL),(15,1,14,14,169,20,'003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'2014-09-04 11:20:00',NULL),(16,1,14,5,475,30,'025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'2014-09-04 11:34:13',NULL),(17,1,14,15,450,30,'003_85230538-e039-4964-aea8-2bbe15b56677.JPG',1,'2014-09-04 11:40:54',NULL),(18,1,14,3,340,30,'055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG',1,'2014-09-04 11:42:15',NULL),(19,1,14,16,408,50,'012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG',1,'2014-09-04 11:50:26',NULL),(20,1,14,17,250,30,'022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG',1,'2014-09-04 11:51:45',NULL),(21,1,14,18,190,20,'040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG',1,'2014-09-04 11:59:08',NULL),(22,1,14,19,360,60,'020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG',1,'2014-09-04 12:01:28',NULL),(23,1,14,19,371,30,'008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG',1,'2014-09-04 12:03:42',NULL),(24,1,14,9,390,30,'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG',1,'2014-09-04 12:05:59',NULL),(25,1,14,13,510,50,'043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG',1,'2014-09-04 12:10:28',NULL);
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
INSERT INTO `product_description` VALUES (1,'it','JEANS BIKER \"551\" IN COTONE STRETCH 16.5CM'),(2,'it','JEANS SLIM FIT IN DENIM LAVATO STRETCH 18CM'),(3,'it','PANTALONI BIKER IN NAPPA'),(4,'it','GIACCA BIKER IN NAPPA E CAVALLINO STAMPA LEOPARD'),(5,'it','ABITO \"TOKYO\" IN LANA STRETCH'),(6,'it','CARDIGAN IN CASHMERE'),(7,'it','T-SHIRT IN COTONE'),(8,'it','T-SHIRT IN COTONE STAMPA LEOPARD'),(9,'it','STIVALI \"BAILEY BUTTON\" IN SHEARLING'),(10,'it','BORSA MEDIA \"ANTIGONA\" IN PELLE MARTELLATA'),(15,'it','JEANS SKINNY FIT \"JOEY\" IN DENIM STRETCH 16CM'),(16,'it','JEANS GOLD FIT IN DENIM STRETCH 17CM'),(17,'it','JEANS IN DENIM GIAPPONESE 18CM'),(18,'it','JEANS WORKWEAR FIT IN DENIM STRETCH 20CM'),(19,'it','JEANS IN COTONE PETTINATO 18CM'),(20,'it','JEANS BIKER IN DENIM SPALMATO 16.5CM'),(21,'it','JEANS \"THAVAR\" IN DENIM STRETCH 18CM'),(22,'it','JEANS IN DENIM STRETCH STAMPA VICHY'),(23,'it','JEANS IN DENIM STRETCH 18CM'),(24,'it','JEANS IN DENIM STRETCH 18CM'),(25,'it','JEANS SLIM FIT IN DENIM E PELLE 18.5CM');
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
INSERT INTO `product_image` VALUES (1,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84.JPG'),(1,2,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG'),(1,3,'015_697a3f52-f887-4fdc-91ae-d05a504c2e00.JPG'),(1,4,'015_d73b577a-bd5c-4cf3-8bdc-e2eb44873887.JPG'),(2,1,'023_26a20207-914d-4606-85ab-b707fb078a04.JPG'),(2,2,'023_c5306e23-0ab3-4fb7-8ff5-5e7445a83a0e.JPG'),(2,3,'023_efe82016-122b-4068-925d-99991ed8922f.JPG'),(2,4,'023_112b0ff6-f728-4408-9806-e3654bda598c.JPG'),(3,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG'),(3,2,'054_00cba355-d889-49d6-906e-a7b9919aa34a.JPG'),(3,3,'054_92f14550-41b0-493c-88b1-a3c5fd2bd8fc.JPG'),(3,4,'054_c2f6a372-ecba-40df-9699-4b0ff2cf08b2.JPG'),(4,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG'),(4,2,'026_7a3dfec3-2e2d-4fea-be77-acffae8e7133.JPG'),(4,3,'026_3428de0d-1480-4b7c-a34c-50fc6eae7fa8.JPG'),(4,4,'026_6a79d0a9-cb4f-4c6d-bcbd-0ae54f1bd65d.JPG'),(5,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG'),(5,2,'120_3a616744-2764-4b64-9dbe-3384372399dc.JPG'),(5,3,'120_d6a23ed9-26ec-4b99-8893-69c85327a8fe.JPG'),(5,4,'120_e8d7c8a3-6aec-41e8-86db-5fb28fabb3d5.JPG'),(6,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG'),(6,2,'008_4ab0ab04-2f7e-4dbc-9815-fbfcb979c52d.JPG'),(6,3,'008_9bb2e158-4163-4165-bcf5-f5c87dbe24a8.JPG'),(6,4,'008_34e601f1-3a6b-467d-8d64-482e2c7d5b24.JPG'),(6,5,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG'),(6,6,'008_62c79152-c91b-4fc1-a38c-9082914fd049.JPG'),(7,1,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG'),(7,2,'003_801cd143-503b-4f65-935d-82d852ed71c9.JPG'),(7,3,'003_a3b95fd2-eef9-4588-9089-c904177dfb27.JPG'),(7,4,'003_6117ed2a-7d3b-48cd-8a6d-15143f928e83.JPG'),(8,1,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG'),(8,2,'065_9e30560c-0c52-4b16-b839-163534ebcaa1.JPG'),(8,3,'065_953e8ced-163d-4a41-9988-ec636f95962a.JPG'),(8,4,'065_a50bdf29-2c63-4f9c-b2ab-a4d92ff18cc2.JPG'),(9,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG'),(9,2,'011_6ec8a633-85b6-4f20-a4cf-692fcaa338f6.JPG'),(9,3,'011_025afb73-277b-42ba-b99d-09ea4b0caa39.JPG'),(9,4,'011_dcf104bc-3798-4b88-b8d3-a261e2efb4ee.JPG'),(10,1,'PROVA1.JPG'),(10,2,'PROVA2.JPG'),(10,3,'PROVA3.JPG'),(10,4,'PROVA4.JPG'),(15,1,'003_7700b271-6cfc-45be-8b8c-1a89f67f8eba.JPG'),(15,2,'003_83d4e6f9-4fd3-4ce0-ae8f-c93054c33155.JPG'),(15,3,'003_7968da63-605e-4eba-9ffe-325e45935c62.JPG'),(15,4,'003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG'),(16,1,'025_baed240d-2048-4f02-b7fe-fc94831ca511.JPG'),(16,2,'025_1e45bfc0-5e0f-4fee-b604-e2bf082773d3.JPG'),(16,3,'025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG'),(16,4,'025_f1a41787-6ae4-4945-bec7-be3da27396cd.JPG'),(17,1,'003_85230538-e039-4964-aea8-2bbe15b56677.JPG'),(17,2,'003_731bed23-6f4c-4419-84bb-b48cc0dcfce8.JPG'),(17,3,'003_806ff603-8bbb-406f-8232-284bb33bec67.JPG'),(17,4,'003_f1d1ef5b-091a-4f8c-9c1e-923dd5d23a57.JPG'),(18,1,'055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG'),(18,2,'055_46535f29-12a3-40f3-a130-f8e76e37c1e3.JPG'),(18,3,'055_7291a518-cb89-47e9-925a-5196451f1ece.JPG'),(18,4,'055_6e9aa406-ef61-4c55-8f0b-759095a4d57c.JPG'),(19,1,'012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG'),(19,2,'012_c3cf063a-10f8-41b3-b6e9-f14f7f459b46.JPG'),(19,3,'012_23bbd8bf-9a96-461d-b9f4-cf01127bccaf.JPG'),(19,4,'012_e6fefe91-036b-4de5-a9f9-973cfcf1696f.JPG'),(20,1,'022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG'),(20,2,'022_d4cbf502-0ab4-4a2b-acc8-bd3bc0e02c87.JPG'),(20,3,'022_f1ef58d9-596d-4ff7-b6e7-4fffd42f61db.JPG'),(20,4,'022_ffdca271-37d4-4147-80de-ab7721f09f93.JPG'),(21,1,'040_25805c4b-25cc-4dd4-9b30-71dab091b44d.JPG'),(21,2,'040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG'),(21,3,'040_ff2ba8f3-6d71-4f75-9b5b-a262ce1f59a9.JPG'),(21,4,'039_9131e4dc-a8a2-4d92-9cf7-de8a470b222c.JPG'),(22,1,'020_09f82cf0-34e4-4598-816f-29c630287b3a.JPG'),(22,2,'020_a2730963-ee2b-47da-9bb4-1fb145330b9e.JPG'),(22,3,'020_a397657f-babb-48f9-8360-2399eb996cf8.JPG'),(22,4,'020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG'),(23,1,'008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG'),(23,2,'008_235f96a6-3230-401b-84cf-41e439e3aba8.JPG'),(23,3,'029_04310ecd-36de-4b5d-9d3d-7d321965f771.JPG'),(23,4,'008_3771b55c-24a1-4840-b36d-37e86cd88624.JPG'),(24,1,'bbf3d1ae-1a78-4c2b-962a-5500a2e277aa.JPG'),(24,2,'45149579-cc17-4465-9c96-1629f4a76610.JPG'),(24,3,'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG'),(24,4,'597df317-5b60-4cca-93ed-ea8be920e8f2.JPG'),(25,1,'043_304ca69a-78e4-430b-8e79-a1c051d157ca (1).JPG'),(25,2,'043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG'),(25,3,'043_e2ab1d80-424e-4f37-9b78-a5e9e8688cfc.JPG'),(25,4,'043_fcbd7e18-20e4-4cfe-a0cc-aa10907b55b0.JPG');
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
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops` (
  `idShop` int(11) NOT NULL,
  `txShop` varchar(100) DEFAULT NULL,
  `txMail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idShop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Siena - via Banchi di Sotto','siena@degortes.it'),(2,'Magazzino Badesse','magazzino@degortes.it');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_images`
--

DROP TABLE IF EXISTS `site_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_images` (
  `idsiteImages` int(11) NOT NULL,
  `txGroupImages` varchar(45) DEFAULT NULL,
  `pgGroupImages` int(11) DEFAULT NULL,
  `txLibrary` varchar(45) DEFAULT NULL,
  `txName` varchar(45) DEFAULT NULL,
  `urlRedirect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idsiteImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/carousel','A2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(2,'carousel',2,'images/carousel','A1.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(3,'carousel',3,'images/carousel','A3.jpg','/cart/cart-catalog.xhtml?idMenu=3&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(4,'carousel',4,'images/carousel','A4.jpg','/cart/cart-catalog.xhtml?idMenu=4&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(5,'newArrivals',1,'images/newArrivals','newuomo2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(6,'newArrivals',2,'images/newArrivals','newdonna2.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(7,'newArrivals',3,'images/newArrivals','newbambino2.jpg','/cart/cart-catalog.xhtml?idMenu=3&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(8,'newArrivals',4,'images/newArrivals','newbambina2.jpg','/cart/cart-catalog.xhtml?idMenu=4&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(9,'tabNav',1,'images/tabNav','uomo.png',NULL),(10,'tabNav',2,'images/tabNav','donna.png',NULL),(11,'tabNav',3,'images/tabNav','bambino.png',NULL),(12,'tabNav',4,'images/tabNav','bambina.png',NULL);
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
  `idTypeSize` int(11) DEFAULT NULL,
  `txSize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSize`),
  KEY `fk_Size_Type_Size1` (`idTypeSize`),
  CONSTRAINT `fk_Size_Type_Size1` FOREIGN KEY (`idTypeSize`) REFERENCES `type_size` (`idTypeSize`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,2,'34'),(2,2,'36'),(3,2,'38'),(4,2,'40'),(5,2,'42'),(6,2,'44'),(7,2,'46'),(8,2,'48'),(9,2,'50'),(10,2,'52'),(11,2,'54'),(12,2,'56'),(13,2,'58'),(14,2,'60'),(15,1,'XXS'),(16,1,'XS'),(17,1,'S'),(18,1,'M'),(19,1,'L'),(20,1,'XL'),(21,1,'XXL'),(22,1,'U'),(23,3,'34'),(24,3,'35'),(25,3,'36'),(26,3,'37'),(27,3,'38'),(28,3,'39'),(29,3,'40'),(30,3,'41'),(31,3,'42'),(32,3,'43'),(33,3,'44'),(34,3,'45'),(35,3,'46'),(36,3,'47'),(37,4,'24'),(38,4,'25'),(39,4,'26'),(40,4,'27'),(41,4,'28'),(42,4,'29'),(43,4,'30'),(44,4,'31'),(45,4,'32'),(46,4,'33'),(47,4,'34'),(48,4,'35'),(49,4,'36'),(50,4,'37'),(51,4,'38'),(52,4,'39'),(53,4,'40'),(54,4,'41'),(55,4,'42');
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
INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),(3,'COMPLETED'),(4,'DENIED'),(5,'EXPIRED'),(6,'FAILED'),(7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),(9,'PENDING'),(10,'REFUNDED'),(11,'REVERSED'),(12,'PROCESSED'),(13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),(15,'SPEDITO');
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
  `dtStato` date DEFAULT NULL,
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
INSERT INTO `states_orders` VALUES (1,2,'2014-08-29',NULL);
/*!40000 ALTER TABLE `states_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `idLanguages` varchar(2) NOT NULL,
  `txType` varchar(200) NOT NULL,
  `idTypeSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`idType`,`idLanguages`),
  KEY `fk_Type_Type_Size1` (`idTypeSize`),
  CONSTRAINT `fk_Type_Type_Size1` FOREIGN KEY (`idTypeSize`) REFERENCES `type_size` (`idTypeSize`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'it','ACCESSORI',1),(2,'it','BERMUDA',4),(3,'it','CAMICIE',2),(4,'it','CAPPOTTI',2),(5,'it','COMPLETI',2),(6,'it','COSTUMI DA BAGNO',1),(7,'it','FELPE',1),(8,'it','GIACCHE',2),(9,'it','GIACCHE DI PELLE',2),(10,'it','GILET',2),(11,'it','GIUBBOTTI',2),(12,'it','GONNE',2),(13,'it','INTIMO',1),(14,'it','JEANS',4),(15,'it','MAGLIERIA',1),(16,'it','PANTALONI',4),(17,'it','PELLICCE E SHEARLING',2),(18,'it','PIUMINI',2),(19,'it','POLO',1),(20,'it','SCARPE',3),(21,'it','T-SHIRTS',1),(22,'it','VESTITI',2);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_size`
--

DROP TABLE IF EXISTS `type_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_size` (
  `idTypeSize` int(11) NOT NULL,
  `txTypeSize` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_size`
--

LOCK TABLES `type_size` WRITE;
/*!40000 ALTER TABLE `type_size` DISABLE KEYS */;
INSERT INTO `type_size` VALUES (1,'TAGLIE'),(2,'TAGLIE ITA'),(3,'SCARPE EU'),(4,'PANTALONI US');
/*!40000 ALTER TABLE `type_size` ENABLE KEYS */;
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

-- Dump completed on 2014-09-04 12:19:30
