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



USE `aduna937_othala`;


--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'massimiliano_cencioni@tin.it','Massimiliano','Cencioni','Loc. La Ripa, via Don Dino Bandini','Siena',53019,'SI','ITALIA','0577329180',1,'casa'),(3,'massimiliano_cencioni@tin.it','Massimiliano','Cencioni','Strada Cassia Sud, 15/A','Siena',53100,'SI','FRANCIA','0577329180',1,'Lavoro'),(4,'simone.bagnolesi@gmail.com','simone','bagnolesi','via aerea','siena',53100,'si','ITALIA','3332965518',0,'casa'),(20,'jacopo.frediani@gmail.com','JACOPO','FREDIANI','STRADA CASSIA SUD 15/A','SIENA',53100,'SI','ITALIA','3392113342',0,'CASA'),(21,'massimiliano_cencioni@tin.it','Massimiliano',' Cencioni','Loc. La Ripa, via Don Dino Bandini','Castelnuovo Berardenga',53019,'SI','ITALIA','0577329180',0,'Home');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,0,47,11,2,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'0000000000000001'),(1,1,49,11,0,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'0000000000000002'),(1,2,51,11,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'0000000000000003'),(2,0,46,5,1,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'0000000000000004'),(2,1,49,5,1,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'0000000000000005'),(3,0,37,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'0000000000000006'),(3,1,38,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'0000000000000007'),(3,2,39,11,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'0000000000000008'),(4,0,8,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'0000000000000009'),(4,1,9,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'0000000000000010'),(4,2,10,11,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'0000000000000011'),(5,0,9,11,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'0000000000000012'),(5,1,10,11,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'0000000000000013'),(6,0,17,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'0000000000000014'),(6,1,18,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'0000000000000015'),(6,2,19,14,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG',1,'0000000000000016'),(6,3,19,9,1,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'0000000000000017'),(6,4,17,9,1,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'0000000000000018'),(7,0,15,11,16,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG',1,'0000000000000019'),(8,0,17,17,17,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG',1,'0000000000000020'),(9,0,26,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'0000000000000021'),(9,1,27,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'0000000000000022'),(9,2,28,10,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'0000000000000023'),(10,0,22,11,1,'PROVA1.JPG',1,'0000000000000024'),(15,1,37,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'0000000000000025'),(15,2,38,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'0000000000000026'),(15,3,39,11,1,'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'0000000000000027'),(16,1,37,11,1,'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'0000000000000028'),(16,2,38,11,1,'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'0000000000000029'),(17,1,37,5,1,'thumb003_85230538-e039-4964-aea8-2bbe15b56677.JPG',1,'0000000000000030'),(18,1,38,4,1,'thumb055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG',1,'0000000000000031'),(19,1,37,11,1,'thumb012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG',1,'0000000000000032'),(20,1,38,14,0,'thumb022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG',1,'0000000000000033'),(21,1,37,10,1,'thumb040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG',1,'0000000000000034'),(22,1,37,13,1,'thumb020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG',1,'0000000000000035'),(23,1,37,4,1,'thumb008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG',1,'0000000000000036'),(24,1,37,5,1,'thumbfca2f34e-4be1-4b67-8000-1a81a2710618.JPG',1,'0000000000000037'),(25,1,37,11,1,'thumb043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG',1,'0000000000000038');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'LANVIN'),(2,'BALMAIN'),(3,'DSQUARED'),(4,'MOSCHINO'),(5,'DOLCE E GABBANA'),(6,'STONE ISLAND'),(7,'BLOCH'),(8,'ARMANI'),(9,'DIOR'),(10,'SAINT LAURENT'),(11,'ALEXANDER MCQUEEN'),(12,'UGG AUSTRALIA'),(13,'GIVENCHY'),(14,'APRIL 77'),(15,'VALENTINO'),(16,'ANN DEMEULEMEESTER'),(17,'JUST CAVALLI'),(18,'DIESEL'),(19,'EACH X OTHER');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'SUPER SALE','2014-09-18','2014-12-31',50);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'en','ORANGE'),(1,'it','ARANCIONE'),(2,'en','SILVER'),(2,'it','ARGENTO'),(3,'en','BEIGE'),(3,'it','BEIGE'),(4,'en','WHITE'),(4,'it','BIANCO'),(5,'en','BLUE'),(5,'it','BLU'),(6,'en','LIGHT BLUE'),(6,'it','CELESTE'),(7,'en','DENIM'),(7,'it','DENIM'),(8,'en','YELLOW'),(8,'it','GIALLO'),(9,'en','GREY'),(9,'it','GRIGIO'),(10,'en','BROWN'),(10,'it','MARRONE'),(11,'en','BLACK'),(11,'it','NERO'),(12,'en','GOLD'),(12,'it','ORO'),(13,'en','ROSE'),(13,'it','ROSA'),(14,'en','RED'),(14,'it','ROSSO'),(15,'en','GREEN'),(15,'it','VERDE'),(16,'en','PURPLE'),(16,'it','VIOLA'),(17,'en','LEOPARD'),(17,'it','LEOPARD');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES ('1','Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo',1);
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','ANTANI','A','A','A',1),('jacopo.frediani@gmail.com','benito','JACOPO','FREDIANI',NULL,2),('massimiliano_cencioni@tin.it','stocazzo','Massimiliano','Cencioni',NULL,2),('simone.bagnolesi@gmail.com','didone','simone','bagnolesi',NULL,2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_roles`
--

LOCK TABLES `customer_roles` WRITE;
/*!40000 ALTER TABLE `customer_roles` DISABLE KEYS */;
INSERT INTO `customer_roles` VALUES ('1','AMMINISTRATORE'),('jacopo.frediani@gmail.com','CUSTOMER'),('massimiliano_cencioni@tin.it','CUSTOMER'),('simone.bagnolesi@gmail.com','CUSTOMER');
/*!40000 ALTER TABLE `customer_roles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `delivery_cost`
--

LOCK TABLES `delivery_cost` WRITE;
/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
INSERT INTO `delivery_cost` VALUES (1,'GLS Parcel camionistico',7.90,0,'GLS Parcel camionistico',NULL),(2,'GLS Zefiro via aerea',9.74,0,'GLS Zefiro via aerea',NULL),(3,'GLS Zefiro via aerea',20.04,0,'GLS Zefiro via aerea',NULL),(4,'GLS Zefiro via aerea',17.19,0,'GLS Zefiro via aerea',NULL),(5,'GLS Zefiro via aerea',17.43,0,'GLS Zefiro via aerea',NULL),(6,'GLS Zefiro via aerea',19.56,0,'GLS Zefiro via aerea',NULL),(7,'GLS Zefiro via aerea',34.15,0,'GLS Zefiro via aerea',NULL),(8,'GLS Zefiro via aerea',48.94,0,'GLS Zefiro via aerea',NULL),(9,'GLS Zefiro via aerea',49.46,0,'GLS Zefiro via aerea',NULL),(10,'GLS Parcel camionistico',13.80,0,'GLS Parcel camionistico',NULL),(11,'GLS Parcel camionistico',14.05,0,'GLS Parcel camionistico',NULL),(12,'GLS Parcel camionistico',15.70,0,'GLS Parcel camionistico',NULL),(13,'GLS Parcel camionistico',16.76,0,'GLS Parcel camionistico',NULL),(14,'GLS Parcel camionistico',17.25,0,'GLS Parcel camionistico',NULL),(15,'GLS Parcel camionistico',18.97,0,'GLS Parcel camionistico',NULL),(16,'GLS Parcel camionistico',19.35,0,'GLS Parcel camionistico',NULL),(17,'GLS Parcel camionistico',20.45,0,'GLS Parcel camionistico',NULL),(18,'GLS Parcel camionistico',21.48,0,'GLS Parcel camionistico',NULL),(19,'GLS Parcel camionistico',23.66,0,'GLS Parcel camionistico',NULL),(20,'GLS Parcel camionistico',25.88,0,'GLS Parcel camionistico',NULL),(21,'GLS Parcel camionistico',27.46,0,'GLS Parcel camionistico',NULL),(22,'GLS Parcel camionistico',28.34,0,'GLS Parcel camionistico',NULL),(23,'GLS Parcel camionistico',28.59,0,'GLS Parcel camionistico',NULL),(24,'GLS Parcel camionistico',30.68,0,'GLS Parcel camionistico',NULL),(25,'GLS Parcel camionistico',31.45,0,'GLS Parcel camionistico',NULL),(26,'GLS Parcel camionistico',36.73,0,'GLS Parcel camionistico',NULL),(27,'GLS Parcel camionistico',40.91,0,'GLS Parcel camionistico',NULL),(28,'GLS Parcel camionistico',41.35,0,'GLS Parcel camionistico',NULL),(29,'GLS Parcel camionistico',45.30,0,'GLS Parcel camionistico',NULL);
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `delivery_nazioni`
--

LOCK TABLES `delivery_nazioni` WRITE;
/*!40000 ALTER TABLE `delivery_nazioni` DISABLE KEYS */;
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA'),(2,'Austria'),(2,'Belgium'),(2,'Denmark'),(2,'Finland'),(2,'France'),(2,'Germany'),(2,'Greece'),(2,'Ireland'),(2,'Luxembourg'),(2,'Monaco'),(2,'Netherlands'),(2,'Portugal'),(2,'Spain'),(2,'Sweden'),(2,'United Kingdom'),(3,'Bulgaria'),(3,'Croatia'),(3,'Cyprus'),(3,'Czech Republic'),(3,'Estonia'),(3,'Hungary'),(3,'Latvia'),(3,'Lithuania'),(3,'Malta'),(3,'Poland'),(3,'Romania'),(3,'Slovakia'),(3,'Slovenia'),(4,'Andorra'),(4,'Gibraltar'),(4,'Switzerland'),(5,'Canary Islands'),(5,'Faroe Islands'),(5,'Guernsey'),(5,'Iceland'),(5,'Jersey'),(5,'Norway'),(6,'Canada'),(6,'United States'),(7,'American Samoa'),(7,'Anguilla'),(7,'Antigua and Barbuda'),(7,'Argentina'),(7,'Aruba'),(7,'Australia'),(7,'Bahamas'),(7,'Bahrain'),(7,'Bangladesh'),(7,'Barbados'),(7,'Belize'),(7,'Bermuda'),(7,'Bolivia'),(7,'Bonaire'),(7,'Brazil'),(7,'Brunei Darussalam'),(7,'Cameroon'),(7,'Cayman Islands'),(7,'Chile'),(7,'Colombia'),(7,'Costa Rica'),(7,'Curacao'),(7,'Dominica'),(7,'Dominican Republic'),(7,'Ecuador'),(7,'Egypt'),(7,'El Salvador'),(7,'Equatorial Guinea'),(7,'Fiji'),(7,'French Guiana'),(7,'Greenland'),(7,'Grenada'),(7,'Guadeloupe'),(7,'Guam'),(7,'Guatemala'),(7,'Guyana'),(7,'Haiti'),(7,'Honduras'),(7,'Hong Kong'),(7,'India'),(7,'Indonesia'),(7,'Ivory Coast'),(7,'Jamaica'),(7,'Japan'),(7,'Kenya'),(7,'Kuwait'),(7,'Macao'),(7,'Malaysia'),(7,'Maldives'),(7,'Martinique'),(7,'Mexico'),(7,'Micronesia'),(7,'Montserrat'),(7,'Nevis'),(7,'New Caledonia'),(7,'New Zealand'),(7,'Nigeria'),(7,'Oman'),(7,'Pakistan'),(7,'Palau'),(7,'Panama'),(7,'Paraguay'),(7,'Peru'),(7,'Philippines'),(7,'Puerto Rico'),(7,'Qatar'),(7,'Saint Barthelemy'),(7,'Saint Eustatius'),(7,'Saint Kitts and Nevis'),(7,'Saint Lucia'),(7,'Saint Maarten'),(7,'Saint Vincent e Grenadine'),(7,'Samoa'),(7,'Saudi Arabia'),(7,'Senegal'),(7,'Singapore'),(7,'South Africa'),(7,'South Korea'),(7,'Sri Lanka'),(7,'Suriname'),(7,'Tahiti'),(7,'Taiwan'),(7,'Thailand'),(7,'Trinidad and Tobago'),(7,'Turkey'),(7,'United Arab Emirates'),(7,'Uruguay'),(7,'Venezuela'),(7,'Virgin Islands'),(8,'Algeria'),(8,'Benin'),(8,'Bhutan'),(8,'Botswana'),(8,'Burkina Faso'),(8,'Burundi'),(8,'Cambodia'),(8,'Cape Verde'),(8,'Center Africa'),(8,'Chad'),(8,'China'),(8,'Comoros'),(8,'Congo'),(8,'Cook Islands'),(8,'Djibouti'),(8,'East Timor'),(8,'Eritrea'),(8,'Ethiopia'),(8,'Gabon'),(8,'Gambia'),(8,'Ghana'),(8,'Guinea'),(8,'Guinea-Bissau'),(8,'Iraq'),(8,'Israel'),(8,'Jordan'),(8,'Lao'),(8,'Lebanon'),(8,'Lesotho'),(8,'Liberia'),(8,'Libya'),(8,'Madagascar'),(8,'Malawi'),(8,'Mali'),(8,'Marshall Islands'),(8,'Mauritania'),(8,'Mauritius'),(8,'Mayotte'),(8,'Morocco'),(8,'Namibia'),(8,'Nauru'),(8,'Nepal'),(8,'Nicaragua'),(8,'Niger'),(8,'Papua New Guinea'),(8,'Reunion Island'),(8,'Rwanda'),(8,'Saipan'),(8,'Seychelles'),(8,'Sierra Leone'),(8,'Somalia'),(8,'Swaziland'),(8,'Syria'),(8,'Tanzania'),(8,'Togo'),(8,'Tonga'),(8,'Tunisia'),(8,'Turks and Caicos Islands'),(8,'Tuvalu'),(8,'Uganda'),(8,'Vanuatu'),(8,'Vietnam'),(8,'Yemen'),(8,'Zambia'),(8,'Zimbabwe'),(9,'Afghanistan'),(9,'Albania'),(9,'Angola'),(9,'Armenia'),(9,'Azerbaijan'),(9,'Belarus'),(9,'Bosnia and Herzegovina'),(9,'Cuba'),(9,'Falkland Islands'),(9,'Georgia'),(9,'Iran'),(9,'Kazakhstan'),(9,'Kiribati'),(9,'Kosovo'),(9,'Kyrgyzstan'),(9,'Macedonia'),(9,'Moldova'),(9,'Mongolia'),(9,'Montenegro'),(9,'Mozambique'),(9,'Myanmar, Burma'),(9,'Niue'),(9,'North Korea'),(9,'Russian Federation'),(9,'Serbia'),(9,'Solomon Islands'),(9,'South Sudan'),(9,'Sudan'),(9,'Tajikistan'),(9,'Ukraine'),(9,'Uzbekistan'),(10,'Austria'),(11,'Belgium'),(12,'France'),(12,'Germany'),(12,'Luxembourg'),(12,'Netherlands'),(13,'Liechtenstein'),(14,'Switzerland'),(15,'Denmark'),(15,'Slovenia'),(16,'England'),(16,'Galles'),(16,'Scotland'),(17,'Hungary'),(18,'Croatia'),(18,'Serbia'),(19,'Poland'),(20,'Czech Republic'),(20,'Spain'),(21,'Sweden'),(22,'Slovakia'),(23,'Bulgaria'),(23,'Estonia'),(23,'Latvia'),(23,'Lithuania'),(23,'Norway'),(23,'Portugal'),(23,'Romania'),(24,'Ireland'),(25,'Finland'),(26,'Turkey'),(27,'Greece'),(28,'Nord Ireland'),(29,'Cyprus'),(29,'Malta');
/*!40000 ALTER TABLE `delivery_nazioni` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `fidelity_customer`
--

LOCK TABLES `fidelity_customer` WRITE;
/*!40000 ALTER TABLE `fidelity_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelity_customer` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `fidelitycards`
--

LOCK TABLES `fidelitycards` WRITE;
/*!40000 ALTER TABLE `fidelitycards` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelitycards` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'en','MAN'),(1,'it','UOMO'),(2,'en','WOMAN'),(2,'it','DONNA'),(3,'en','BOY'),(3,'it','BAMBINO'),(4,'en','GIRL'),(4,'it','BAMBINA'),(5,'en','UNISEX'),(5,'it','UNISEX');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `ipnmessages`
--

LOCK TABLES `ipnmessages` WRITE;
/*!40000 ALTER TABLE `ipnmessages` DISABLE KEYS */;
INSERT INTO `ipnmessages` VALUES (16,'0AT65243A5872070E','2014-09-10 13:08:01','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=e11502287b4c8;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=0AT65243A5872070E;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-6DL05030W4689712C;PAYMENTINFO_0_ERRORCODE=0;BUILD=12709182;PAYMENTINFO_0_ORDERTIME=2014-09-10T13:13:14Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-09-10T13:13:15Z;','Completed',NULL,0,NULL),(17,'3YG12356DX364992M','2014-09-23 10:46:29','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=ee01b432d11d6;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=3YG12356DX364992M;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-8SM46264S5241260E;PAYMENTINFO_0_ERRORCODE=0;BUILD=12932421;PAYMENTINFO_0_ORDERTIME=2014-09-23T10:52:00Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-09-23T10:52:01Z;','Completed',NULL,0,NULL),(13,'740883259','2014-09-05 14:07:15','mc_gross=6.00;mc_currency=EUR;payment_status=Completed;txn_id=740883259;custom=13;receiver_email=othalaBusines2@othala.it','Completed','',1,NULL),(14,'8R320163AH790424T','2014-09-08 09:26:10','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=25f4a181e4e34;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8R320163AH790424T;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=paymentreview;ACK=Success;TOKEN=EC-98C68867F9166431E;PAYMENTINFO_0_ERRORCODE=0;BUILD=12658619;PAYMENTINFO_0_ORDERTIME=2014-09-08T09:31:20Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Pending;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-09-08T09:31:21Z;','Pending','paymentreview',0,NULL),(15,'8UG7210115471620E','2014-09-09 14:18:03','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=5a55fad841759;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8UG7210115471620E;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=paymentreview;ACK=Success;TOKEN=EC-17W79005W00069005;PAYMENTINFO_0_ERRORCODE=0;BUILD=12709182;PAYMENTINFO_0_ORDERTIME=2014-09-09T14:23:15Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Pending;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-09-09T14:23:16Z;','Pending','paymentreview',0,NULL),(13,'8X841761TA296845M','2014-09-04 14:47:15','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=6460e75475be;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8X841761TA296845M;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=paymentreview;ACK=Success;TOKEN=EC-7LV53009F8732862C;PAYMENTINFO_0_ERRORCODE=0;BUILD=12658619;PAYMENTINFO_0_ORDERTIME=2014-09-04T14:52:21Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Pending;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-09-04T14:52:21Z;','Pending','paymentreview',0,NULL),(2,'9DP331212R144774Y','2014-10-07 09:44:48','PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.55;CORRELATIONID=6b39b02b6025f;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=9DP331212R144774Y;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-2KP31877AA447325K;PAYMENTINFO_0_ERRORCODE=0;BUILD=13243702;PAYMENTINFO_0_ORDERTIME=2014-10-07T09:50:38Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=6.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-10-07T09:50:38Z;','Completed',NULL,0,NULL);
/*!40000 ALTER TABLE `ipnmessages` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'en','COTTON'),(1,'it','COTONE'),(2,'en','SILK'),(2,'it','SETA');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES ('Afghanistan','en'),('Albania','en'),('Algeria','en'),('American Samoa','en'),('Andorra','en'),('Angola','en'),('Anguilla','en'),('Antigua and Barbuda','en'),('Argentina','en'),('Armenia','en'),('Aruba','en'),('Australia','en'),('Austria','en'),('Azerbaijan','en'),('Bahamas','en'),('Bahrain','en'),('Bangladesh','en'),('Barbados','en'),('Belarus','en'),('Belgium','en'),('Belize','en'),('Benin','en'),('Bermuda','en'),('Bhutan','en'),('Bolivia','en'),('Bonaire','en'),('Bosnia and Herzegovina','en'),('Botswana','en'),('Brazil','en'),('Brunei Darussalam','en'),('Bulgaria','en'),('Burkina Faso','en'),('Burundi','en'),('Cambodia','en'),('Cameroon','en'),('Canada','en'),('Canary Islands','en'),('Cape Verde','en'),('Cayman Islands','en'),('Center Africa','en'),('Chad','en'),('Chile','en'),('China','en'),('Colombia','en'),('Comoros','en'),('Congo','en'),('Cook Islands','en'),('Costa Rica','en'),('Croatia','en'),('Cuba','en'),('Curacao','en'),('Cyprus','en'),('Czech Republic','en'),('Denmark','en'),('Djibouti','en'),('Dominica','en'),('Dominican Republic','en'),('East Timor','en'),('Ecuador','en'),('Egypt','en'),('El Salvador','en'),('England','en'),('Equatorial Guinea','en'),('Eritrea','en'),('Estonia','en'),('Ethiopia','en'),('Falkland Islands','en'),('Faroe Islands','en'),('Fiji','en'),('Finland','en'),('France','en'),('French Guiana','en'),('Gabon','en'),('Galles','en'),('Gambia','en'),('Georgia','en'),('Germany','en'),('Ghana','en'),('Gibraltar','en'),('Greece','en'),('Greenland','en'),('Grenada','en'),('Guadeloupe','en'),('Guam','en'),('Guatemala','en'),('Guernsey','en'),('Guinea','en'),('Guinea-Bissau','en'),('Guyana','en'),('Haiti','en'),('Honduras','en'),('Hong Kong','en'),('Hungary','en'),('Iceland','en'),('India','en'),('Indonesia','en'),('Iran','en'),('Iraq','en'),('Ireland','en'),('Israel','en'),('ITALIA','it'),('Ivory Coast','en'),('Jamaica','en'),('Japan','en'),('Jersey','en'),('Jordan','en'),('Kazakhstan','en'),('Kenya','en'),('Kiribati','en'),('Kosovo','en'),('Kuwait','en'),('Kyrgyzstan','en'),('Lao','en'),('Latvia','en'),('Lebanon','en'),('Lesotho','en'),('Liberia','en'),('Libya','en'),('Liechtenstein','en'),('Lithuania','en'),('Luxembourg','en'),('Macao','en'),('Macedonia','en'),('Madagascar','en'),('Malawi','en'),('Malaysia','en'),('Maldives','en'),('Mali','en'),('Malta','en'),('Marshall Islands','en'),('Martinique','en'),('Mauritania','en'),('Mauritius','en'),('Mayotte','en'),('Mexico','en'),('Micronesia','en'),('Moldova','en'),('Monaco','en'),('Mongolia','en'),('Montenegro','en'),('Montserrat','en'),('Morocco','en'),('Mozambique','en'),('Myanmar, Burma','en'),('Namibia','en'),('Nauru','en'),('Nepal','en'),('Netherlands','en'),('Nevis','en'),('New Caledonia','en'),('New Zealand','en'),('Nicaragua','en'),('Niger','en'),('Nigeria','en'),('Niue','en'),('Nord Ireland','en'),('North Korea','en'),('Norway','en'),('Oman','en'),('Pakistan','en'),('Palau','en'),('Panama','en'),('Papua New Guinea','en'),('Paraguay','en'),('Peru','en'),('Philippines','en'),('Poland','en'),('Portugal','en'),('Puerto Rico','en'),('Qatar','en'),('Reunion Island','en'),('Romania','en'),('Russian Federation','en'),('Rwanda','en'),('Saint Barthelemy','en'),('Saint Eustatius','en'),('Saint Kitts and Nevis','en'),('Saint Lucia','en'),('Saint Maarten','en'),('Saint Vincent e Grenadine','en'),('Saipan','en'),('Samoa','en'),('Saudi Arabia','en'),('Scotland','en'),('Senegal','en'),('Serbia','en'),('Seychelles','en'),('Sierra Leone','en'),('Singapore','en'),('Slovakia','en'),('Slovenia','en'),('Solomon Islands','en'),('Somalia','en'),('South Africa','en'),('South Korea','en'),('South Sudan','en'),('Spain','en'),('Sri Lanka','en'),('Sudan','en'),('Suriname','en'),('Swaziland','en'),('Sweden','en'),('Switzerland','en'),('Syria','en'),('Tahiti','en'),('Taiwan','en'),('Tajikistan','en'),('Tanzania','en'),('Thailand','en'),('Togo','en'),('Tonga','en'),('Trinidad and Tobago','en'),('Tunisia','en'),('Turkey','en'),('Turks and Caicos Islands','en'),('Tuvalu','en'),('Uganda','en'),('Ukraine','en'),('United Arab Emirates','en'),('United Kingdom','en'),('United States','en'),('Uruguay','en'),('Uzbekistan','en'),('Vanuatu','en'),('Venezuela','en'),('Vietnam','en'),('Virgin Islands','en'),('Yemen','en'),('Zambia','en'),('Zimbabwe','en');
/*!40000 ALTER TABLE `nazioni` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `order_refound`
--

LOCK TABLES `order_refound` WRITE;
/*!40000 ALTER TABLE `order_refound` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_refound` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'massimiliano_cencioni@tin.it',6,'9DP331212R144774Y',21,21,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `orders_articles`
--

LOCK TABLES `orders_articles` WRITE;
/*!40000 ALTER TABLE `orders_articles` DISABLE KEYS */;
INSERT INTO `orders_articles` VALUES (2,8,0,1),(13,8,0,1),(14,7,0,1),(15,7,0,1),(16,8,0,1),(17,7,0,1);
/*!40000 ALTER TABLE `orders_articles` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,14,1,860,20,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG',1,'2014-09-03 10:58:38',1,1,100),(2,1,14,3,398,20,'023_efe82016-122b-4068-925d-99991ed8922f.JPG',1,'2014-09-03 11:03:02',1,1,NULL),(3,1,16,1,1455,50,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG',1,'2014-09-03 11:05:14',NULL,1,NULL),(4,1,9,10,4599,50,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG',1,'2014-09-19 11:07:35',NULL,1,NULL),(5,1,5,3,975,20,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG',1,'2014-09-03 11:09:45',NULL,1,NULL),(6,1,15,11,750,50,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG',1,'2014-09-03 11:14:02',NULL,1,NULL),(7,1,21,11,1,0,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG',1,'2014-09-03 11:17:35',NULL,1,NULL),(8,1,21,10,2,50,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG',1,'2014-09-03 11:18:55',NULL,1,NULL),(9,2,20,12,200,20,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG',1,'2014-09-03 11:21:16',NULL,1,NULL),(10,2,1,13,1590,10,'PROVA1.JPG',1,'2014-09-03 11:55:19',NULL,1,NULL),(15,1,14,14,169,20,'003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG',1,'2014-09-04 11:20:00',NULL,1,NULL),(16,1,14,5,475,30,'025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG',1,'2014-09-04 11:34:13',NULL,1,NULL),(17,1,14,15,450,30,'003_85230538-e039-4964-aea8-2bbe15b56677.JPG',1,'2014-09-04 11:40:54',NULL,1,NULL),(18,1,14,3,340,30,'055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG',1,'2014-09-04 11:42:15',NULL,1,NULL),(19,1,14,16,408,50,'012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG',1,'2014-09-04 11:50:26',NULL,1,NULL),(20,1,14,17,250,30,'022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG',1,'2014-09-04 11:51:45',NULL,1,NULL),(21,1,14,18,190,20,'040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG',1,'2014-09-04 11:59:08',NULL,1,NULL),(22,1,14,19,360,60,'020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG',1,'2014-09-04 12:01:28',NULL,1,NULL),(23,1,14,19,371,30,'008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG',1,'2014-09-04 12:03:42',NULL,1,NULL),(24,1,14,9,390,30,'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG',1,'2014-09-04 12:05:59',NULL,1,NULL),(25,1,14,13,510,50,'043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG',1,'2014-09-04 12:10:28',NULL,1,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,'en','JEANS BIKER \"551\" IN COTONE STRETCH 16.5CM'),(1,'it','JEANS BIKER \"551\" IN COTONE STRETCH 16.5CM'),(2,'en','JEANS SLIM FIT IN DENIM LAVATO STRETCH 18CM'),(2,'it','JEANS SLIM FIT IN DENIM LAVATO STRETCH 18CM'),(3,'en','PANTALONI BIKER IN NAPPA'),(3,'it','PANTALONI BIKER IN NAPPA'),(4,'en','GIACCA BIKER IN NAPPA E CAVALLINO STAMPA LEOPARD'),(4,'it','GIACCA BIKER IN NAPPA E CAVALLINO STAMPA LEOPARD'),(5,'en','ABITO \"TOKYO\" IN LANA STRETCH'),(5,'it','ABITO \"TOKYO\" IN LANA STRETCH'),(6,'en','CARDIGAN IN CASHMERE'),(6,'it','CARDIGAN IN CASHMERE'),(7,'en','T-SHIRT IN COTONE'),(7,'it','T-SHIRT IN COTONE'),(8,'en','T-SHIRT IN COTONE STAMPA LEOPARD'),(8,'it','T-SHIRT IN COTONE STAMPA LEOPARD'),(9,'en','STIVALI \"BAILEY BUTTON\" IN SHEARLING'),(9,'it','STIVALI \"BAILEY BUTTON\" IN SHEARLING'),(10,'en','BORSA MEDIA \"ANTIGONA\" IN PELLE MARTELLATA'),(10,'it','BORSA MEDIA \"ANTIGONA\" IN PELLE MARTELLATA'),(15,'en','JEANS SKINNY FIT \"JOEY\" IN DENIM STRETCH 16CM'),(15,'it','JEANS SKINNY FIT \"JOEY\" IN DENIM STRETCH 16CM'),(16,'en','JEANS GOLD FIT IN DENIM STRETCH 17CM'),(16,'it','JEANS GOLD FIT IN DENIM STRETCH 17CM'),(17,'en','JEANS IN DENIM GIAPPONESE 18CM'),(17,'it','JEANS IN DENIM GIAPPONESE 18CM'),(18,'en','JEANS WORKWEAR FIT IN DENIM STRETCH 20CM'),(18,'it','JEANS WORKWEAR FIT IN DENIM STRETCH 20CM'),(19,'en','JEANS IN COTONE PETTINATO 18CM'),(19,'it','JEANS IN COTONE PETTINATO 18CM'),(20,'en','JEANS BIKER IN DENIM SPALMATO 16.5CM'),(20,'it','JEANS BIKER IN DENIM SPALMATO 16.5CM'),(21,'en','JEANS \"THAVAR\" IN DENIM STRETCH 18CM'),(21,'it','JEANS \"THAVAR\" IN DENIM STRETCH 18CM'),(22,'en','JEANS IN DENIM STRETCH STAMPA VICHY'),(22,'it','JEANS IN DENIM STRETCH STAMPA VICHY'),(23,'en','JEANS IN DENIM STRETCH 18CM'),(23,'it','JEANS IN DENIM STRETCH 18CM'),(24,'en','JEANS IN DENIM STRETCH 18CM'),(24,'it','JEANS IN DENIM STRETCH 18CM'),(25,'en','JEANS SLIM FIT IN DENIM E PELLE 18.5CM'),(25,'it','JEANS SLIM FIT IN DENIM E PELLE 18.5CM');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84.JPG'),(1,2,'015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG'),(1,3,'015_697a3f52-f887-4fdc-91ae-d05a504c2e00.JPG'),(1,4,'015_d73b577a-bd5c-4cf3-8bdc-e2eb44873887.JPG'),(2,1,'023_26a20207-914d-4606-85ab-b707fb078a04.JPG'),(2,2,'023_c5306e23-0ab3-4fb7-8ff5-5e7445a83a0e.JPG'),(2,3,'023_efe82016-122b-4068-925d-99991ed8922f.JPG'),(2,4,'023_112b0ff6-f728-4408-9806-e3654bda598c.JPG'),(3,1,'054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG'),(3,2,'054_00cba355-d889-49d6-906e-a7b9919aa34a.JPG'),(3,3,'054_92f14550-41b0-493c-88b1-a3c5fd2bd8fc.JPG'),(3,4,'054_c2f6a372-ecba-40df-9699-4b0ff2cf08b2.JPG'),(4,1,'026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG'),(4,2,'026_7a3dfec3-2e2d-4fea-be77-acffae8e7133.JPG'),(4,3,'026_3428de0d-1480-4b7c-a34c-50fc6eae7fa8.JPG'),(4,4,'026_6a79d0a9-cb4f-4c6d-bcbd-0ae54f1bd65d.JPG'),(5,1,'120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG'),(5,2,'120_3a616744-2764-4b64-9dbe-3384372399dc.JPG'),(5,3,'120_d6a23ed9-26ec-4b99-8893-69c85327a8fe.JPG'),(5,4,'120_e8d7c8a3-6aec-41e8-86db-5fb28fabb3d5.JPG'),(6,1,'008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG'),(6,2,'008_4ab0ab04-2f7e-4dbc-9815-fbfcb979c52d.JPG'),(6,3,'008_9bb2e158-4163-4165-bcf5-f5c87dbe24a8.JPG'),(6,4,'008_34e601f1-3a6b-467d-8d64-482e2c7d5b24.JPG'),(6,5,'008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG'),(6,6,'008_62c79152-c91b-4fc1-a38c-9082914fd049.JPG'),(7,1,'003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG'),(7,2,'003_801cd143-503b-4f65-935d-82d852ed71c9.JPG'),(7,3,'003_a3b95fd2-eef9-4588-9089-c904177dfb27.JPG'),(7,4,'003_6117ed2a-7d3b-48cd-8a6d-15143f928e83.JPG'),(8,1,'065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG'),(8,2,'065_9e30560c-0c52-4b16-b839-163534ebcaa1.JPG'),(8,3,'065_953e8ced-163d-4a41-9988-ec636f95962a.JPG'),(8,4,'065_a50bdf29-2c63-4f9c-b2ab-a4d92ff18cc2.JPG'),(9,1,'011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG'),(9,2,'011_6ec8a633-85b6-4f20-a4cf-692fcaa338f6.JPG'),(9,3,'011_025afb73-277b-42ba-b99d-09ea4b0caa39.JPG'),(9,4,'011_dcf104bc-3798-4b88-b8d3-a261e2efb4ee.JPG'),(10,1,'PROVA1.JPG'),(10,2,'PROVA2.JPG'),(10,3,'PROVA3.JPG'),(10,4,'PROVA4.JPG'),(15,1,'003_7700b271-6cfc-45be-8b8c-1a89f67f8eba.JPG'),(15,2,'003_83d4e6f9-4fd3-4ce0-ae8f-c93054c33155.JPG'),(15,3,'003_7968da63-605e-4eba-9ffe-325e45935c62.JPG'),(15,4,'003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG'),(16,1,'025_baed240d-2048-4f02-b7fe-fc94831ca511.JPG'),(16,2,'025_1e45bfc0-5e0f-4fee-b604-e2bf082773d3.JPG'),(16,3,'025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG'),(16,4,'025_f1a41787-6ae4-4945-bec7-be3da27396cd.JPG'),(17,1,'003_85230538-e039-4964-aea8-2bbe15b56677.JPG'),(17,2,'003_731bed23-6f4c-4419-84bb-b48cc0dcfce8.JPG'),(17,3,'003_806ff603-8bbb-406f-8232-284bb33bec67.JPG'),(17,4,'003_f1d1ef5b-091a-4f8c-9c1e-923dd5d23a57.JPG'),(18,1,'055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG'),(18,2,'055_46535f29-12a3-40f3-a130-f8e76e37c1e3.JPG'),(18,3,'055_7291a518-cb89-47e9-925a-5196451f1ece.JPG'),(18,4,'055_6e9aa406-ef61-4c55-8f0b-759095a4d57c.JPG'),(19,1,'012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG'),(19,2,'012_c3cf063a-10f8-41b3-b6e9-f14f7f459b46.JPG'),(19,3,'012_23bbd8bf-9a96-461d-b9f4-cf01127bccaf.JPG'),(19,4,'012_e6fefe91-036b-4de5-a9f9-973cfcf1696f.JPG'),(20,1,'022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG'),(20,2,'022_d4cbf502-0ab4-4a2b-acc8-bd3bc0e02c87.JPG'),(20,3,'022_f1ef58d9-596d-4ff7-b6e7-4fffd42f61db.JPG'),(20,4,'022_ffdca271-37d4-4147-80de-ab7721f09f93.JPG'),(21,1,'040_25805c4b-25cc-4dd4-9b30-71dab091b44d.JPG'),(21,2,'040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG'),(21,3,'040_ff2ba8f3-6d71-4f75-9b5b-a262ce1f59a9.JPG'),(21,4,'039_9131e4dc-a8a2-4d92-9cf7-de8a470b222c.JPG'),(22,1,'020_09f82cf0-34e4-4598-816f-29c630287b3a.JPG'),(22,2,'020_a2730963-ee2b-47da-9bb4-1fb145330b9e.JPG'),(22,3,'020_a397657f-babb-48f9-8360-2399eb996cf8.JPG'),(22,4,'020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG'),(23,1,'008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG'),(23,2,'008_235f96a6-3230-401b-84cf-41e439e3aba8.JPG'),(23,3,'029_04310ecd-36de-4b5d-9d3d-7d321965f771.JPG'),(23,4,'008_3771b55c-24a1-4840-b36d-37e86cd88624.JPG'),(24,1,'bbf3d1ae-1a78-4c2b-962a-5500a2e277aa.JPG'),(24,2,'45149579-cc17-4465-9c96-1629f4a76610.JPG'),(24,3,'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG'),(24,4,'597df317-5b60-4cca-93ed-ea8be920e8f2.JPG'),(25,1,'043_304ca69a-78e4-430b-8e79-a1c051d157ca (1).JPG'),(25,2,'043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG'),(25,3,'043_e2ab1d80-424e-4f37-9b78-a5e9e8688cfc.JPG'),(25,4,'043_fcbd7e18-20e4-4cfe-a0cc-aa10907b55b0.JPG');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_state`
--

LOCK TABLES `product_state` WRITE;
/*!40000 ALTER TABLE `product_state` DISABLE KEYS */;
INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO'),(2,'CANCELLATO');
/*!40000 ALTER TABLE `product_state` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `refound_articles`
--

LOCK TABLES `refound_articles` WRITE;
/*!40000 ALTER TABLE `refound_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `refound_articles` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,'Siena - negozio1','adunatasoftware@gmail.com','NomeNegozio1','IndirizzoNegozio1','Siena',53100,'SI','Italia','TelNegozio1'),(2,'Siena - negozio2','adunatasoftware@gmail.com','NomeNegozio2','IndirizzoNegozio2','Siena',53100,'SI','Italia','TelNegozio2');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/carousel','A2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(2,'carousel',2,'images/carousel','A1.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(3,'carousel',3,'images/carousel','A3.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(4,'carousel',4,'images/carousel','A4.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(5,'newArrivals',1,'images/newArrivals','newuomo2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(6,'newArrivals',2,'images/newArrivals','newdonna2.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(9,'tabNav',1,'images/tabNav','logoTab2.png',NULL),(10,'tabNav',2,'images/tabNav','logoTab2.png',NULL),(11,'tabNav',3,'images/tabNav','logoTab2.png',NULL),(12,'tabNav',4,'images/tabNav','logoTab2.png',NULL),(13,'tabNav',5,'images/tabNav','logoTab2.png',NULL);
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'34'),(2,'36'),(3,'38'),(4,'40'),(5,'42'),(6,'44'),(7,'46'),(8,'48'),(9,'50'),(10,'52'),(11,'54'),(12,'56'),(13,'58'),(14,'60'),(15,'XXS'),(16,'XS'),(17,'S'),(18,'M'),(19,'L'),(20,'XL'),(21,'XXL'),(22,'U'),(23,'34'),(24,'35'),(25,'36'),(26,'37'),(27,'38'),(28,'39'),(29,'40'),(30,'41'),(31,'42'),(32,'43'),(33,'44'),(34,'45'),(35,'46'),(36,'47'),(37,'24'),(38,'25'),(39,'26'),(40,'27'),(41,'28'),(42,'29'),(43,'30'),(44,'31'),(45,'32'),(46,'33'),(47,'34'),(48,'35'),(49,'36'),(50,'37'),(51,'38'),(52,'39'),(53,'40'),(54,'41'),(55,'42');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),(3,'COMPLETED'),(4,'DENIED'),(5,'EXPIRED'),(6,'FAILED'),(7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),(9,'PENDING'),(10,'REFUNDED'),(11,'REVERSED'),(12,'PROCESSED'),(13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),(15,'SPEDITO'),(100,'REQUEST REFOUND'),(101,'REFOUND COMPLETED'),(102,'REFOUND REFUSED'),(103,'REFOUND CANCELED'),(200,'REQUEST CHANGE'),(201,'CHANGE COMPLETED'),(202,'CHANGE REFUSED'),(203,'CHANGE CANCELED');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `states_orders`
--

LOCK TABLES `states_orders` WRITE;
/*!40000 ALTER TABLE `states_orders` DISABLE KEYS */;
INSERT INTO `states_orders` VALUES (1,1,'2014-09-04 14:42:09',NULL),(2,1,'2014-10-07 09:43:52',NULL),(2,3,'2014-10-07 09:44:48',NULL),(6,1,'2014-09-04 14:42:09',NULL),(7,1,'2014-09-04 14:42:09',NULL),(8,1,'2014-09-04 14:42:09',NULL),(9,1,'2014-09-04 14:42:09',NULL),(10,1,'2014-09-04 14:42:09',NULL),(13,1,'2014-09-04 14:46:17',NULL),(13,3,'2014-09-05 14:07:15',NULL),(13,9,'2014-09-04 14:47:15',NULL),(13,15,'2014-09-05 14:17:44',NULL),(14,1,'2014-09-08 09:24:41',NULL),(14,9,'2014-09-08 09:26:10',NULL),(15,1,'2014-09-09 14:17:08',NULL),(15,9,'2014-09-09 14:18:03',NULL),(16,1,'2014-09-10 13:07:17',NULL),(16,3,'2014-09-10 13:08:01',NULL),(17,1,'2014-09-23 10:45:43',NULL),(17,3,'2014-09-23 10:46:29',NULL),(17,15,'2014-09-23 10:47:09',NULL);
/*!40000 ALTER TABLE `states_orders` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `states_refound`
--

LOCK TABLES `states_refound` WRITE;
/*!40000 ALTER TABLE `states_refound` DISABLE KEYS */;
INSERT INTO `states_refound` VALUES (1,100,'2014-09-24 21:43:18',NULL);
/*!40000 ALTER TABLE `states_refound` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'en','ACCESSORIES'),(1,'it','ACCESSORI'),(2,'en','SHORTS'),(2,'it','BERMUDA'),(3,'en','SHIRTS'),(3,'it','CAMICIE'),(4,'en','COATS'),(4,'it','CAPPOTTI'),(5,'en','SUITS'),(5,'it','COMPLETI'),(6,'en','SWIMWEAR'),(6,'it','COSTUMI DA BAGNO'),(7,'en','SWEATSHIRTS'),(7,'it','FELPE'),(8,'en','JACKETS'),(8,'it','GIACCHE'),(9,'en','LEATHER JACKETS'),(9,'it','GIACCHE DI PELLE'),(10,'en','GILET'),(10,'it','GILET'),(11,'en','CASUAL JACKETS'),(11,'it','GIUBBOTTI'),(12,'en','SKIRTS'),(12,'it','GONNE'),(13,'en','UNDERWEAR'),(13,'it','INTIMO'),(14,'en','JEANS'),(14,'it','JEANS'),(15,'en','KNITWEAR'),(15,'it','MAGLIERIA'),(16,'en','PANTS'),(16,'it','PANTALONI'),(17,'en','FUR AND SHEARLING'),(17,'it','PELLICCE E SHEARLING'),(18,'en','DOWN JACKETS'),(18,'it','PIUMINI'),(19,'en','POLOS'),(19,'it','POLO'),(20,'en','SHOES'),(20,'it','SCARPE'),(21,'en','T-SHIRTS'),(21,'it','T-SHIRTS'),(22,'en','VESTS'),(22,'it','VESTITI');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;



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

-- Dump completed on 2014-10-31 13:06:32