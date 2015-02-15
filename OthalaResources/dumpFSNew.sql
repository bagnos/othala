-- MySQL dump 10.13  Distrib 5.6.22, for Win32 (x86)
--
-- Host: localhost    Database: aduna000_othala
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Current Database: `aduna000_othala`
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
  `txNome` varchar(45) DEFAULT NULL,
  `txCognome` varchar(45) DEFAULT NULL,
  `txVia` varchar(100) DEFAULT NULL,
  `txComune` varchar(100) DEFAULT NULL,
  `cdCap` int(11) DEFAULT NULL,
  `txProvincia` varchar(100) DEFAULT NULL,
  `txNazione` varchar(100) DEFAULT NULL,
  `txTel` varchar(45) DEFAULT NULL,
  `fgDeleted` tinyint(4) DEFAULT NULL,
  `txEtichetta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Addresses_Customer1` (`idUser`),
  CONSTRAINT `fk_Addresses_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'jacopo.frediani@gmail.com','JACOPO','FREDIANI','STRADA CASSIA SUD 15/A','SIENA',53100,'SI','ITALIA','3392113342',0,'casa'),(2,'simone.bagnolesi@gmail.com','simone','bagnolesi','via aretina 89','siena',53100,'si','ITALIA','3332965518',0,'casa');
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
  `imPrice` decimal(15,2) DEFAULT NULL,
  `specialPrice` decimal(15,2) DEFAULT NULL,
  `pcDiscount` int(11) DEFAULT NULL,
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
INSERT INTO `article` VALUES (29,1,1,1,10,'thumb20150203170539170&_MG_1887 copia.jpg',1,'000001',8.00,NULL,0),(30,1,1,1,10,'thumb20150204110140873&_MG_1912 copia.jpg',1,'000002',7.00,NULL,0),(30,2,2,1,10,'thumb20150204110140873&_MG_1912 copia.jpg',1,'000003',14.00,NULL,0),(31,1,3,1,20,'thumb20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg',1,'000003',28.50,NULL,0),(32,1,4,1,100,'thumb20150209124810275&geometra.jpg',1,'100000',50.00,NULL,0),(33,1,4,1,100,'thumb20150209124810275&geometra.jpg',1,'100001',100.00,NULL,0),(34,1,4,1,100,'thumb20150209124810275&geometra.jpg',1,'100002',100.00,NULL,0);
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
  `idRegione` int(11) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL,
  `idUser` varchar(100) DEFAULT NULL,
  `urlFoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (20,'LE VIGNE DI SAN PIETRO',17,71,'info@levignedisanpietro.it','levignedisanpietro.jpg'),(21,'LA GENUINA',2,44,'info@lagenuina.it','lagenuina.jpg'),(22,'Geometra',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_descr`
--

DROP TABLE IF EXISTS `brand_descr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_descr` (
  `idBrand` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescrizione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idBrand`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_descr`
--

LOCK TABLES `brand_descr` WRITE;
/*!40000 ALTER TABLE `brand_descr` DISABLE KEYS */;
INSERT INTO `brand_descr` VALUES (20,'en','Le Vigne di San Pietro sono un piccolo paradiso immerso nelle colline moreniche tra Verona e il Garda, a due passi dalla città ma nascosto alla vista dei più. È proprio qui che Sergio Nerozzi, imprenditore e architetto, decise di fermarsi per dedicarsi alla produzione di vino e cambiare la qualità della propria vita. La scelta è immediata e precisa: i vini delle Vigne di San Pietro devono essere altamente pregiati, eleganti e capaci di esprimere il proprio carattere nel tempo. Oggi Carlo, affiancato dalla moglie Regina, gestisce da solo l’azienda con la stessa filosofia ereditata da suo padre e con la stessa attenzione per l’ambiente. Le tecniche colturali sono rispettose dei terreni, orientate ad una bassa resa per ettaro e alla produzione di uve sane che vengono raccolte a mano. Dopo alcuni anni, gli ettari di vigneto passano dai 4 iniziali ai 10 attuali e la produzione di bottiglie arriva a sole 60.000 l’anno.'),(20,'it','Le Vigne di San Pietro sono un piccolo paradiso immerso nelle colline moreniche tra Verona e il Garda, a due passi dalla città ma nascosto alla vista dei più. È proprio qui che Sergio Nerozzi, imprenditore e architetto, decise di fermarsi per dedicarsi alla produzione di vino e cambiare la qualità della propria vita. La scelta è immediata e precisa: i vini delle Vigne di San Pietro devono essere altamente pregiati, eleganti e capaci di esprimere il proprio carattere nel tempo. Oggi Carlo, affiancato dalla moglie Regina, gestisce da solo l’azienda con la stessa filosofia ereditata da suo padre e con la stessa attenzione per l’ambiente. Le tecniche colturali sono rispettose dei terreni, orientate ad una bassa resa per ettaro e alla produzione di uve sane che vengono raccolte a mano. Dopo alcuni anni, gli ettari di vigneto passano dai 4 iniziali ai 10 attuali e la produzione di bottiglie arriva a sole 60.000 l’anno.'),(21,'en','Un antico edificio del XII secolo che a tutto farebbe pensare fuorché a una macelleria, una vera e propria \'\'bottega delle carni\'\' che Luciano Caracciolo e sua moglie Domenica hanno deciso di vestire con un abito che rendesse merito alla qualità e alla tradizionalità delle loro lavorazioni.Il laboratorio - con annessa sala degustazioni - si trova nel cuore del borgo antico di Carunchio, dove ogni giorno è possibile scegliere tra un’eccellente selezione di carni certificate e salumi tipici abruzzesi lavorati artigianalmente con una ritualità e un’attenzione ormai rare.Facendo tesoro del sapere tramandato da chi ha vissuto le colline e le montagne dell’Alto Vastese, La Genuina infonde a ogni suo prodotto lo stesso spirito e la stessa esperienza di un tempo, potendo contare su strutture all’avanguardia e ingredienti locali di primissima scelta.'),(21,'it','Un antico edificio del XII secolo che a tutto farebbe pensare fuorché a una macelleria, una vera e propria \'\'bottega delle carni\'\' che Luciano Caracciolo e sua moglie Domenica hanno deciso di vestire con un abito che rendesse merito alla qualità e alla tradizionalità delle loro lavorazioni.Il laboratorio - con annessa sala degustazioni - si trova nel cuore del borgo antico di Carunchio, dove ogni giorno è possibile scegliere tra un’eccellente selezione di carni certificate e salumi tipici abruzzesi lavorati artigianalmente con una ritualità e un’attenzione ormai rare.Facendo tesoro del sapere tramandato da chi ha vissuto le colline e le montagne dell’Alto Vastese, La Genuina infonde a ogni suo prodotto lo stesso spirito e la stessa esperienza di un tempo, potendo contare su strutture all’avanguardia e ingredienti locali di primissima scelta.'),(22,'en',NULL),(22,'it',NULL);
/*!40000 ALTER TABLE `brand_descr` ENABLE KEYS */;
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
INSERT INTO `color` VALUES (1,'en','N/A'),(1,'it','N/A');
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
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com','benito79','JACOPO','FREDIANI',NULL,2),('shop@foods&services.it','shop@f&s','A','A','A',1),('simone.bagnolesi@gmail.com','didone1976','simone','bagnolesi',NULL,2);
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
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com','CUSTOMER'),('shop@foods&services.it','AMMINISTRATORE'),('simone.bagnolesi@gmail.com','CUSTOMER');
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
  `idAddress` varchar(100) DEFAULT NULL,
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
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA',NULL),(2,'Austria',NULL),(2,'Belgium',NULL),(2,'Denmark',NULL),(2,'Finland',NULL),(2,'France',NULL),(2,'Germany',NULL),(2,'Greece',NULL),(2,'Ireland',NULL),(2,'Luxembourg',NULL),(2,'Monaco',NULL),(2,'Netherlands',NULL),(2,'Portugal',NULL),(2,'Spain',NULL),(2,'Sweden',NULL),(2,'United Kingdom',NULL),(3,'Bulgaria',NULL),(3,'Croatia',NULL),(3,'Cyprus',NULL),(3,'Czech Republic',NULL),(3,'Estonia',NULL),(3,'Hungary',NULL),(3,'Latvia',NULL),(3,'Lithuania',NULL),(3,'Malta',NULL),(3,'Poland',NULL),(3,'Romania',NULL),(3,'Slovakia',NULL),(3,'Slovenia',NULL),(4,'Andorra',NULL),(4,'Gibraltar',NULL),(4,'Switzerland',NULL),(5,'Canary Islands',NULL),(5,'Faroe Islands',NULL),(5,'Guernsey',NULL),(5,'Iceland',NULL),(5,'Jersey',NULL),(5,'Norway',NULL),(6,'Canada',NULL),(6,'United States',NULL),(7,'American Samoa',NULL),(7,'Anguilla',NULL),(7,'Antigua and Barbuda',NULL),(7,'Argentina',NULL),(7,'Aruba',NULL),(7,'Australia',NULL),(7,'Bahamas',NULL),(7,'Bahrain',NULL),(7,'Bangladesh',NULL),(7,'Barbados',NULL),(7,'Belize',NULL),(7,'Bermuda',NULL),(7,'Bolivia',NULL),(7,'Bonaire',NULL),(7,'Brazil',NULL),(7,'Brunei Darussalam',NULL),(7,'Cameroon',NULL),(7,'Cayman Islands',NULL),(7,'Chile',NULL),(7,'Colombia',NULL),(7,'Costa Rica',NULL),(7,'Curacao',NULL),(7,'Dominica',NULL),(7,'Dominican Republic',NULL),(7,'Ecuador',NULL),(7,'Egypt',NULL),(7,'El Salvador',NULL),(7,'Equatorial Guinea',NULL),(7,'Fiji',NULL),(7,'French Guiana',NULL),(7,'Greenland',NULL),(7,'Grenada',NULL),(7,'Guadeloupe',NULL),(7,'Guam',NULL),(7,'Guatemala',NULL),(7,'Guyana',NULL),(7,'Haiti',NULL),(7,'Honduras',NULL),(7,'Hong Kong',NULL),(7,'India',NULL),(7,'Indonesia',NULL),(7,'Ivory Coast',NULL),(7,'Jamaica',NULL),(7,'Japan',NULL),(7,'Kenya',NULL),(7,'Kuwait',NULL),(7,'Macao',NULL),(7,'Malaysia',NULL),(7,'Maldives',NULL),(7,'Martinique',NULL),(7,'Mexico',NULL),(7,'Micronesia',NULL),(7,'Montserrat',NULL),(7,'Nevis',NULL),(7,'New Caledonia',NULL),(7,'New Zealand',NULL),(7,'Nigeria',NULL),(7,'Oman',NULL),(7,'Pakistan',NULL),(7,'Palau',NULL),(7,'Panama',NULL),(7,'Paraguay',NULL),(7,'Peru',NULL),(7,'Philippines',NULL),(7,'Puerto Rico',NULL),(7,'Qatar',NULL),(7,'Saint Barthelemy',NULL),(7,'Saint Eustatius',NULL),(7,'Saint Kitts and Nevis',NULL),(7,'Saint Lucia',NULL),(7,'Saint Maarten',NULL),(7,'Saint Vincent e Grenadine',NULL),(7,'Samoa',NULL),(7,'Saudi Arabia',NULL),(7,'Senegal',NULL),(7,'Singapore',NULL),(7,'South Africa',NULL),(7,'South Korea',NULL),(7,'Sri Lanka',NULL),(7,'Suriname',NULL),(7,'Tahiti',NULL),(7,'Taiwan',NULL),(7,'Thailand',NULL),(7,'Trinidad and Tobago',NULL),(7,'Turkey',NULL),(7,'United Arab Emirates',NULL),(7,'Uruguay',NULL),(7,'Venezuela',NULL),(7,'Virgin Islands',NULL),(8,'Algeria',NULL),(8,'Benin',NULL),(8,'Bhutan',NULL),(8,'Botswana',NULL),(8,'Burkina Faso',NULL),(8,'Burundi',NULL),(8,'Cambodia',NULL),(8,'Cape Verde',NULL),(8,'Center Africa',NULL),(8,'Chad',NULL),(8,'China',NULL),(8,'Comoros',NULL),(8,'Congo',NULL),(8,'Cook Islands',NULL),(8,'Djibouti',NULL),(8,'East Timor',NULL),(8,'Eritrea',NULL),(8,'Ethiopia',NULL),(8,'Gabon',NULL),(8,'Gambia',NULL),(8,'Ghana',NULL),(8,'Guinea',NULL),(8,'Guinea-Bissau',NULL),(8,'Iraq',NULL),(8,'Israel',NULL),(8,'Jordan',NULL),(8,'Lao',NULL),(8,'Lebanon',NULL),(8,'Lesotho',NULL),(8,'Liberia',NULL),(8,'Libya',NULL),(8,'Madagascar',NULL),(8,'Malawi',NULL),(8,'Mali',NULL),(8,'Marshall Islands',NULL),(8,'Mauritania',NULL),(8,'Mauritius',NULL),(8,'Mayotte',NULL),(8,'Morocco',NULL),(8,'Namibia',NULL),(8,'Nauru',NULL),(8,'Nepal',NULL),(8,'Nicaragua',NULL),(8,'Niger',NULL),(8,'Papua New Guinea',NULL),(8,'Reunion Island',NULL),(8,'Rwanda',NULL),(8,'Saipan',NULL),(8,'Seychelles',NULL),(8,'Sierra Leone',NULL),(8,'Somalia',NULL),(8,'Swaziland',NULL),(8,'Syria',NULL),(8,'Tanzania',NULL),(8,'Togo',NULL),(8,'Tonga',NULL),(8,'Tunisia',NULL),(8,'Turks and Caicos Islands',NULL),(8,'Tuvalu',NULL),(8,'Uganda',NULL),(8,'Vanuatu',NULL),(8,'Vietnam',NULL),(8,'Yemen',NULL),(8,'Zambia',NULL),(8,'Zimbabwe',NULL),(9,'Afghanistan',NULL),(9,'Albania',NULL),(9,'Angola',NULL),(9,'Armenia',NULL),(9,'Azerbaijan',NULL),(9,'Belarus',NULL),(9,'Bosnia and Herzegovina',NULL),(9,'Cuba',NULL),(9,'Falkland Islands',NULL),(9,'Georgia',NULL),(9,'Iran',NULL),(9,'Kazakhstan',NULL),(9,'Kiribati',NULL),(9,'Kosovo',NULL),(9,'Kyrgyzstan',NULL),(9,'Macedonia',NULL),(9,'Moldova',NULL),(9,'Mongolia',NULL),(9,'Montenegro',NULL),(9,'Mozambique',NULL),(9,'Myanmar, Burma',NULL),(9,'Niue',NULL),(9,'North Korea',NULL),(9,'Russian Federation',NULL),(9,'Serbia',NULL),(9,'Solomon Islands',NULL),(9,'South Sudan',NULL),(9,'Sudan',NULL),(9,'Tajikistan',NULL),(9,'Ukraine',NULL),(9,'Uzbekistan',NULL),(10,'Austria',NULL),(11,'Belgium',NULL),(12,'France',NULL),(12,'Germany',NULL),(12,'Luxembourg',NULL),(12,'Netherlands',NULL),(13,'Liechtenstein',NULL),(14,'Switzerland',NULL),(15,'Denmark',NULL),(15,'Slovenia',NULL),(16,'England',NULL),(16,'Galles',NULL),(16,'Scotland',NULL),(17,'Hungary',NULL),(18,'Croatia',NULL),(18,'Serbia',NULL),(19,'Poland',NULL),(20,'Czech Republic',NULL),(20,'Spain',NULL),(21,'Sweden',NULL),(22,'Slovakia',NULL),(23,'Bulgaria',NULL),(23,'Estonia',NULL),(23,'Latvia',NULL),(23,'Lithuania',NULL),(23,'Norway',NULL),(23,'Portugal',NULL),(23,'Romania',NULL),(24,'Ireland',NULL),(25,'Finland',NULL),(26,'Turkey',NULL),(27,'Greece',NULL),(28,'Nord Ireland',NULL),(29,'Cyprus',NULL),(29,'Malta',NULL);
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
  CONSTRAINT `fk_fidelity_customer_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fidelity_customer_customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `gender` VALUES (1,'en','Foods'),(1,'it','Foods'),(2,'en','Beverages'),(2,'it','Beverages'),(3,'en','Services'),(3,'it','Services');
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
INSERT INTO `group_images` VALUES ('carousel','images/home',20,761,1140,0),('new','images/home',1,130,260,0),('newArrivals','images/home',6,580,580,1),('promo','images/home',1,130,260,0),('tabNav','images/home',6,130,260,1);
/*!40000 ALTER TABLE `group_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infaggiuntive`
--

DROP TABLE IF EXISTS `infaggiuntive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infaggiuntive` (
  `idInformazione` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txInformazione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInformazione`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infaggiuntive`
--

LOCK TABLES `infaggiuntive` WRITE;
/*!40000 ALTER TABLE `infaggiuntive` DISABLE KEYS */;
INSERT INTO `infaggiuntive` VALUES (1,'en','Dettagli aggiuntivi'),(1,'it','Dettagli aggiuntivi'),(2,'en','Ingredienti'),(2,'it','Ingredienti'),(3,'en','Consigli d\'uso'),(3,'it','Consigli d\'uso'),(4,'en','Descrizione'),(4,'it','Descrizione');
/*!40000 ALTER TABLE `infaggiuntive` ENABLE KEYS */;
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
  `txStato` varchar(45) NOT NULL DEFAULT '',
  `txNote` varchar(100) DEFAULT NULL,
  `fgElaborato` tinyint(1) DEFAULT NULL,
  `idRefund` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransaction`,`txStato`)
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
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `idMail` int(11) NOT NULL AUTO_INCREMENT,
  `idMailGroup` int(11) DEFAULT NULL,
  `txUser` varchar(100) DEFAULT NULL,
  `txNome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (1,1,'jacopo.frediani@gmail.com',NULL);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_group`
--

DROP TABLE IF EXISTS `mail_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_group` (
  `idMailGroup` int(11) NOT NULL AUTO_INCREMENT,
  `txMailGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMailGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_group`
--

LOCK TABLES `mail_group` WRITE;
/*!40000 ALTER TABLE `mail_group` DISABLE KEYS */;
INSERT INTO `mail_group` VALUES (1,'Online');
/*!40000 ALTER TABLE `mail_group` ENABLE KEYS */;
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
INSERT INTO `material` VALUES (1,'en','N/A'),(1,'it','N/A');
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
  `imRefound` decimal(15,2) DEFAULT NULL,
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
  `imOrdine` decimal(15,2) NOT NULL,
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
  CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_coupons1` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `imArticle` decimal(15,2) DEFAULT NULL,
  `txOrderArticle` varchar(10000) DEFAULT NULL,
  `idOrderArticle` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idOrderArticle`,`idOrder`,`idProdotto`,`pgArticle`),
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
  `tyProduct` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (29,2,9,20,8,0,'thumb20150203170539170&_MG_1887 copia.jpg',1,'2015-02-03 17:06:19',NULL,1,NULL,1),(30,2,9,20,7,0,'thumb20150204110140873&_MG_1912 copia.jpg',1,'2015-02-04 11:02:59',NULL,1,NULL,1),(31,1,11,21,29,0,'thumb20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg',1,'2015-02-04 11:50:13',NULL,1,NULL,1),(32,3,16,22,50,0,'thumb20150209124810275&geometra.jpg',1,'2015-02-09 12:48:44',NULL,1,NULL,2),(33,3,16,22,100,0,'thumb20150209124810275&geometra.jpg',1,'2015-02-09 12:48:44',NULL,1,NULL,2),(34,3,17,22,100,0,'thumb20150209124810275&geometra.jpg',1,'2015-02-09 12:48:44',NULL,1,NULL,2);
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
  `txDescription` varchar(1000) DEFAULT NULL,
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
INSERT INTO `product_description` VALUES (29,'en','CUSTOZA DOC'),(29,'it','CUSTOZA DOC'),(30,'en','BARDOLINO DOC'),(30,'it','BARDOLINO DOC'),(31,'en','CAPOCOLLO'),(31,'it','CAPOCOLLO'),(32,'en','Stime Immobiliari'),(32,'it','Stime Immobiliari'),(33,'en','Agevolazioni Fiscali'),(33,'it','Agevolazioni Fiscali'),(34,'en','Confini di Proprietà'),(34,'it','Confini di Proprietà');
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
INSERT INTO `product_image` VALUES (29,1,'20150203170539170&_MG_1887 copia.jpg'),(29,2,'20150203170544981&_MG_1864 copia.jpg'),(29,3,'20150203170545031&_MG_1874 copia.jpg'),(29,4,'20150203170544721&_MG_1854 copia.jpg'),(30,1,'20150204110140873&_MG_1912 copia.jpg'),(30,2,'20150204110147840&_MG_1929 copia.jpg'),(30,3,'20150204110147869&_MG_1939 copia.jpg'),(31,1,'20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg'),(31,2,'20150204114900354&Capocollo_La_Genuina_foodscovery (3).jpg'),(31,3,'20150204114900852&Capocollo_La_Genuina_foodscovery (10).jpg'),(31,4,'20150204114900605&Capocollo_La_Genuina_foodscovery (12).jpg'),(31,5,'20150204114900412&Capocollo_La_Genuina_foodscovery (4).jpg'),(32,1,'20150209124810275&geometra.jpg'),(33,1,'20150209124810275&geometra.jpg'),(34,1,'20150209124810275&geometra.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `idProduct` int(11) NOT NULL,
  `idInformazione` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescrizione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`idInformazione`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (29,1,'en','Alc. 12,5°. Vendemmia: 2013'),(29,1,'it','Alc. 12,5°. Vendemmia: 2013'),(29,2,'en','Uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco.'),(29,2,'it','Uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco.'),(29,3,'en','Abbinamenti: Salumi, Tortellini di Valeggio al burro e salvia, Pesce azzurro alla griglia.'),(29,3,'it','Abbinamenti: Salumi, Tortellini di Valeggio al burro e salvia, Pesce azzurro alla griglia.'),(29,4,'en','Bianco profumato da sentori di mela e altre essenze aromatiche. Con il suo gusto persistente e sapido, in bocca risulta piacevole ed equilibratamente acido. Il Custoza DOC viene realizzato con la vinificazione separata di 5 uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco. Ha una buona capacità di evoluzione nel tempo, con un aumento delle note minerali e un mantenimento dell’acidità anche per diversi anni.'),(29,4,'it','Bianco profumato da sentori di mela e altre essenze aromatiche. Con il suo gusto persistente e sapido, in bocca risulta piacevole ed equilibratamente acido. Il Custoza DOC viene realizzato con la vinificazione separata di 5 uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco. Ha una buona capacità di evoluzione nel tempo, con un aumento delle note minerali e un mantenimento dell’acidità anche per diversi anni.'),(30,1,'en','Alc. 12°'),(30,1,'it','Alc. 12°'),(30,2,'en','Uve: Corvina, Rondinella, Merlot.'),(30,2,'it','Uve: Corvina, Rondinella, Merlot.'),(30,3,'en','Abbinamenti: Piatti mediterranei, zuppe di funghi, carni rosse, pesce in brodetto, carpacci e fritture di pesce.'),(30,3,'it','Abbinamenti: Piatti mediterranei, zuppe di funghi, carni rosse, pesce in brodetto, carpacci e fritture di pesce.'),(30,4,'en','Rosso di buona personalità con note speziate che tendono ad affermarsi con il tempo. I sentori di pepe nero si avvertono tanto all’olfatto quanto al gusto, accompagnati da morbidi tannini e frutti rossi. Le uve utilizzate per la realizzazione del Bardolino DOC sono la Corvina, in quantità preponderante, seguita da Rondinella e Merlot. È il primo Bardolino della storia ad aver ottenuto i Tre Bicchieri del Gambero.'),(30,4,'it','Rosso di buona personalità con note speziate che tendono ad affermarsi con il tempo. I sentori di pepe nero si avvertono tanto all’olfatto quanto al gusto, accompagnati da morbidi tannini e frutti rossi. Le uve utilizzate per la realizzazione del Bardolino DOC sono la Corvina, in quantità preponderante, seguita da Rondinella e Merlot. È il primo Bardolino della storia ad aver ottenuto i Tre Bicchieri del Gambero.'),(31,2,'en','Collo suino, sale, pepe, aromi naturali.'),(31,2,'it','Collo suino, sale, pepe, aromi naturali.'),(31,4,'en','Sapore intenso e avvolgente che, per molti aspetti, risulta affine a quello di un buon prosciutto crudo stagionato. Il Capocollo si ottiene utilizzando l’intero muscolo del collo, porzione a cui deve il suo nome. La carne, piuttosto magra, generalmente si rivela al taglio con una striscia di grasso centrale. Ideale per antipasti all’italiana o misticanze di salumi.'),(31,4,'it','Sapore intenso e avvolgente che, per molti aspetti, risulta affine a quello di un buon prosciutto crudo stagionato. Il Capocollo si ottiene utilizzando l’intero muscolo del collo, porzione a cui deve il suo nome. La carne, piuttosto magra, generalmente si rivela al taglio con una striscia di grasso centrale. Ideale per antipasti all’italiana o misticanze di salumi.');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
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
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL,
  `txProvincia` varchar(100) DEFAULT NULL,
  `idRegione` int(11) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Ancona',1),(2,'Macerata',1),(3,'Pesaro Urbino',1),(4,'Ascoli Piceno',1),(5,'Alessandria',13),(6,'Asti',13),(7,'Biella',13),(8,'Cuneo',13),(9,'Novara',13),(10,'Vercelli',13),(11,'Torino',13),(12,'Agrigento',11),(13,'Caltanissetta',11),(14,'Catania',11),(15,'Enna',11),(16,'Messina',11),(17,'Palermo',11),(18,'Ragusa',11),(19,'Siracusa',11),(20,'Trapani',11),(21,'Catanzaro',7),(22,'Cosenza',7),(23,'Crotone',7),(24,'Reggio Calabria',7),(25,'Vibo Valentia',7),(27,'Matera',3),(28,'Potenza',3),(29,'Bari',6),(30,'Brindisi',6),(31,'Foggia',6),(32,'Lecce',6),(33,'Taranto',6),(34,'Avellino',8),(35,'Benevento',8),(36,'Caserta',8),(37,'Napoli',8),(38,'Salerno',8),(39,'Frosinone',9),(40,'Latina',9),(41,'Rieti',9),(42,'Roma',9),(43,'Viterbo',9),(44,'Chieti',2),(45,'L\'Aquila',2),(46,'Pescara',2),(47,'Teramo',2),(48,'Arezzo',12),(49,'Firenze',12),(50,'Grosseto',12),(51,'Livorno',12),(52,'Lucca',12),(53,'Massa Carrara',12),(54,'Pisa',12),(55,'Pistoia',12),(56,'Siena',12),(57,'Bologna',14),(58,'Ferrara',14),(59,'Forlì Cesena',14),(60,'Modena',14),(61,'Parma',14),(62,'Piacenza',14),(63,'Ravenna',14),(64,'Reggio Emilia',14),(65,'Rimini',14),(66,'Belluno',17),(67,'Padova',17),(68,'Rovigo',17),(69,'Treviso',17),(70,'Venezia',17),(71,'Verona',17),(72,'Vicenza',17),(73,'Gorizia',15),(74,'Pordenone',15),(75,'Udine',15),(76,'Trieste',15),(77,'Aosta',16),(78,'Cagliari',10),(79,'Nuoro',10),(80,'Oristano',10),(81,'Sassari',10),(82,'Genova',18),(83,'Imperia',18),(84,'Savona',18),(85,'La Spezia',18),(86,'Isernia',4),(87,'Campobasso',4),(88,'Perugia',20),(89,'Terni',20),(90,'Bergamo',19),(91,'Brescia',19),(92,'Como',19),(93,'Cremona',19),(94,'Lecco',19),(95,'Lodi',19),(96,'Mantova',19),(97,'Milano',19),(98,'Pavia',19),(99,'Sondrio',19),(100,'Varese',19),(101,'Trento',5),(102,'Bolzano',5),(103,'Prato',12),(104,'Verbania',13),(105,'Carbonia Iglesias',10),(106,'Medio Campidano',10),(107,'Ogliastra',10),(108,'Olbia Tempio',10);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refound_articles`
--

DROP TABLE IF EXISTS `refound_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refound_articles` (
  `idRefoundArticle` int(11) NOT NULL AUTO_INCREMENT,
  `idRefound` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  `fgChangeRefound` char(1) DEFAULT NULL,
  `txChangeRefound` varchar(250) DEFAULT NULL,
  `pgArticleNew` int(11) DEFAULT NULL,
  `imArticle` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`idRefoundArticle`),
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
-- Table structure for table `regione`
--

DROP TABLE IF EXISTS `regione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regione` (
  `idregione` int(11) NOT NULL,
  `txRegione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idregione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regione`
--

LOCK TABLES `regione` WRITE;
/*!40000 ALTER TABLE `regione` DISABLE KEYS */;
INSERT INTO `regione` VALUES (1,'Marche'),(2,'Abruzzo'),(3,'Basilicata'),(4,'Molise'),(5,'Trentino Alto Adige'),(6,'Puglia'),(7,'Calabria'),(8,'Campania'),(9,'Lazio'),(10,'Sardegna'),(11,'Sicilia'),(12,'Toscana'),(13,'Piemonte'),(14,'Emilia Romagna'),(15,'Friuli Venezia Giulia'),(16,'Valle d\'Aosta'),(17,'Veneto'),(18,'Liguria'),(19,'Lombardia'),(20,'Umbria');
/*!40000 ALTER TABLE `regione` ENABLE KEYS */;
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
INSERT INTO `shops` VALUES (1,'Siena','jacopo.frediani@gmail.com','Foods & Services','Piazza del Campo, 1','Siena',53100,'SI','Italia','+390577280000');
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
  `txName` varchar(150) DEFAULT NULL,
  `idGender` int(11) DEFAULT NULL,
  `urlRedirect` varchar(100) DEFAULT NULL,
  `txAlt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`,`pgGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES ('carousel',1,'03022015152332702&foto 1.JPG',NULL,NULL,'Shop Online Foods & Services'),('carousel',2,'03022015152354488&foto 2.JPG',NULL,NULL,'Shop Online Foods & Services'),('carousel',3,'03022015152400237&foto 3.JPG',NULL,NULL,'Shop Online Foods & Services'),('new',1,'new.png',NULL,NULL,'Shop Online Foods & Services'),('newArrivals',1,'newuomo2.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0','Shop Online Foods & Services'),('newArrivals',2,'newdonna2.jpg',2,'/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0','Shop Online Foods & Services'),('promo',1,'promo.png',NULL,NULL,'Shop Online Foods & Services'),('tabNav',1,'03022015170141523&foods1.JPG',1,NULL,'Foods'),('tabNav',2,'03022015170156890&foods.JPG',2,NULL,'Beverages'),('tabNav',3,'09022015130447439&24-professionisti.jpg',3,NULL,'Services');
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
  `txSize` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'750 ml'),(2,'1500 ml'),(3,'1250 GR CIRCA'),(4,'N/A');
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
INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),(3,'COMPLETED'),(4,'DENIED'),(5,'EXPIRED'),(6,'FAILED'),(7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),(9,'PENDING'),(10,'REFUNDED'),(11,'REVERSED'),(12,'PROCESSED'),(13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),(15,'SPEDITO'),(100,'REQUEST REFOUND'),(101,'REFOUND COMPLETED'),(102,'REFOUND REFUSED'),(103,'REFOUND CANCELED'),(200,'REQUEST CHANGE'),(201,'CHANGE COMPLETED'),(202,'CHANGE REFUSED'),(203,'CHANGE CANCELED'),(204,'INSTANT');
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
INSERT INTO `type` VALUES (1,'en','Confetture e Miele'),(1,'it','Confetture e Miele'),(2,'en','Condimenti e Spezie'),(2,'it','Condimenti e Spezie'),(3,'en','Dolci e Golosità'),(3,'it','Dolci e Golosità'),(4,'en','Prodotti da forno'),(4,'it','Prodotti da forno'),(5,'en','Formaggi e latticini'),(5,'it','Formaggi e latticini'),(6,'en','Patè e sott\'oli'),(6,'it','Patè e sott\'oli'),(7,'en','Carne'),(7,'it','Carne'),(8,'en','Bevande'),(8,'it','Bevande'),(9,'en','Vini'),(9,'it','Vini'),(10,'en','Liquori'),(10,'it','Liquori'),(11,'en','Salumi'),(11,'it','Salumi'),(12,'en','Pasta, riso e farina'),(12,'it','Pasta, riso e farina'),(13,'en','Funghi e Tartufi'),(13,'it','Funghi e Tartufi'),(14,'en','Frutta, Verdura e legumi'),(14,'it','Frutta, Verdura e legumi'),(15,'en','Pesce'),(15,'it','Pesce'),(16,'en','Edilizia'),(16,'it','Edilizia'),(17,'en','Catasto'),(17,'it','Catasto');
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

-- Dump completed on 2015-02-09 16:50:09
