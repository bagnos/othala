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
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (27,1,22,13,3,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'SBMPQ04YN0LV53100C19'),(28,1,17,5,0,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(28,2,18,5,0,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(28,3,19,5,0,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(29,1,17,11,1,'thumb20141028122536802&35226250HX_13P_e.jpg',1,'GOMAQ30A00TP43700N99'),(29,2,18,11,1,'thumb20141028122536802&35226250HX_13P_e.jpg',1,'GOMAQ30A00TP43700N99');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (20,'5 DEPARTMENT'),(21,'ALTO'),(22,'ANDREA INCONTRI'),(23,'ANTIPAST'),(24,'BJORG'),(25,'CARLO CONTRADA'),(26,'COLLECTION PRIVEÈ'),(27,'DAMIR DOMA'),(29,'DIPTYQUE'),(30,'DUSÀN'),(31,'ES’GIVIEN'),(32,'IOSSELLINI'),(33,'JAMIN PUECH'),(34,'JOE’S JEANS'),(35,'LE PRAIRIES DE PARIS'),(36,'LUNA BI'),(37,'MARNI'),(38,'MARIA CALDERARA'),(39,'MSGM'),(40,'ORION LONDON'),(41,'PAULA CADEMARTORI'),(42,'PREMIATA WHITE'),(43,'ROBERTO DEL CARLO'),(44,'SAMANTHA SUNG'),(45,'SOHO DE LUXE'),(46,'SO NICE'),(47,'U’ AVIÙ'),(48,'VOLTA'),(49,'USLUAIRLINES');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'SALDI P/E 2014','2014-10-28','2014-12-31',70);
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
INSERT INTO `customer` VALUES ('1','ANTANI','A','A','A',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `customer_roles`
--

LOCK TABLES `customer_roles` WRITE;
/*!40000 ALTER TABLE `customer_roles` DISABLE KEYS */;
INSERT INTO `customer_roles` VALUES ('1','AMMINISTRATORE');
/*!40000 ALTER TABLE `customer_roles` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `delivery_cost`
--

LOCK TABLES `delivery_cost` WRITE;
/*!40000 ALTER TABLE `delivery_cost` DISABLE KEYS */;
INSERT INTO `delivery_cost` VALUES (1,'SPEDIZIONE GRATUITA',0.00,0,'GLS Parcel camionistico',NULL),(2,'GLS Zefiro via aerea',9.74,0,'GLS Zefiro via aerea',NULL),(3,'GLS Zefiro via aerea',20.04,0,'GLS Zefiro via aerea',NULL),(4,'GLS Zefiro via aerea',17.19,0,'GLS Zefiro via aerea',NULL),(5,'GLS Zefiro via aerea',17.43,0,'GLS Zefiro via aerea',NULL),(6,'GLS Zefiro via aerea',19.56,0,'GLS Zefiro via aerea',NULL),(7,'GLS Zefiro via aerea',34.15,0,'GLS Zefiro via aerea',NULL),(8,'GLS Zefiro via aerea',48.94,0,'GLS Zefiro via aerea',NULL),(9,'GLS Zefiro via aerea',49.46,0,'GLS Zefiro via aerea',NULL),(10,'GLS Parcel camionistico',13.80,0,'GLS Parcel camionistico',NULL),(11,'GLS Parcel camionistico',14.05,0,'GLS Parcel camionistico',NULL),(12,'GLS Parcel camionistico',15.70,0,'GLS Parcel camionistico',NULL),(13,'GLS Parcel camionistico',16.76,0,'GLS Parcel camionistico',NULL),(14,'GLS Parcel camionistico',17.25,0,'GLS Parcel camionistico',NULL),(15,'GLS Parcel camionistico',18.97,0,'GLS Parcel camionistico',NULL),(16,'GLS Parcel camionistico',19.35,0,'GLS Parcel camionistico',NULL),(17,'GLS Parcel camionistico',20.45,0,'GLS Parcel camionistico',NULL),(18,'GLS Parcel camionistico',21.48,0,'GLS Parcel camionistico',NULL),(19,'GLS Parcel camionistico',23.66,0,'GLS Parcel camionistico',NULL),(20,'GLS Parcel camionistico',25.88,0,'GLS Parcel camionistico',NULL),(21,'GLS Parcel camionistico',27.46,0,'GLS Parcel camionistico',NULL),(22,'GLS Parcel camionistico',28.34,0,'GLS Parcel camionistico',NULL),(23,'GLS Parcel camionistico',28.59,0,'GLS Parcel camionistico',NULL),(24,'GLS Parcel camionistico',30.68,0,'GLS Parcel camionistico',NULL),(25,'GLS Parcel camionistico',31.45,0,'GLS Parcel camionistico',NULL),(26,'GLS Parcel camionistico',36.73,0,'GLS Parcel camionistico',NULL),(27,'GLS Parcel camionistico',40.91,0,'GLS Parcel camionistico',NULL),(28,'GLS Parcel camionistico',41.35,0,'GLS Parcel camionistico',NULL),(29,'GLS Parcel camionistico',45.30,0,'GLS Parcel camionistico',NULL);
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
INSERT INTO `gender` VALUES (1,'en','SHOP'),(1,'it','SHOP');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `ipnmessages`
--

LOCK TABLES `ipnmessages` WRITE;
/*!40000 ALTER TABLE `ipnmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipnmessages` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'en','COTTON'),(1,'it','COTONE'),(2,'en','SILK'),(2,'it','SETA'),(3,'en','BRUSHED CALF LEATHER'),(3,'it','VITELLO SPAZZOLATO'),(4,'en','NEOPRENE'),(4,'it','NEOPRENE'),(5,'en','POLIESTERE'),(5,'it','POLIESTERE');
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
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `orders_articles`
--

LOCK TABLES `orders_articles` WRITE;
/*!40000 ALTER TABLE `orders_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_articles` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (27,1,18,37,1250,0,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'2014-10-27 16:18:59',1,3,NULL),(28,1,7,37,350,10,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'2014-10-27 16:27:02',NULL,4,NULL),(29,1,12,37,1090,0,'thumb20141028122536802&35226250HX_13P_e.jpg',1,'2014-10-28 12:26:24',NULL,5,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (27,'en','METAL TRUNK BAG'),(27,'it','BORSA METAL TRUNK'),(28,'en','FELPA DI SFILATA IN JERSEY ACCOPPIATO BICOLORE. '),(28,'it','FELPA DI SFILATA IN JERSEY ACCOPPIATO BICOLORE. '),(29,'en','GONNA IN TESSUTO TECNICO'),(29,'it','GONNA IN TESSUTO TECNICO');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (27,1,'20141027161832764&45239055TE_13P_a.jpg'),(27,2,'20141027161832712&45239055TE_13P_F.jpg'),(27,3,'20141027161832718&45239055TE_13P_e.jpg'),(27,4,'20141027161832744&45239055TE_13P_d.jpg'),(29,1,'20141028122536801&35226250HX_13P_F.jpg'),(29,2,'20141028122536801&35226250HX_13P_d.jpg'),(29,3,'20141028122536802&35226250HX_13P_e.jpg'),(29,4,'20141028122536801&35226250HX_13P_a.jpg');
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
INSERT INTO `shops` VALUES (1,'Siena','jacopo.frediani@banca.mps.it','Mag Boutique','Via dei Termini, 49','Siena',53100,'SI','Italia','+39 0577 41043');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/home','mag01.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(2,'carousel',2,'images/home','mag02.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(3,'carousel',3,'images/home','mag03.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(4,'carousel',4,'images/home','mag04.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(5,'newArrivals',1,'images/home','newMag.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(7,'tabNav',1,'images/home','logoTab2.png',NULL),(12,'carousel',5,'images/home','mag05.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(13,'carousel',6,'images/home','mag06.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(14,'carousel',7,'images/home','mag07.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(15,'carousel',8,'images/home','mag08.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(16,'carousel',9,'images/home','mag09.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(17,'carousel',10,'images/home','mag10.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(18,'carousel',11,'images/home','mag11.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(19,'carousel',12,'images/home','mag12.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(20,'carousel',13,'images/home','mag13.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(21,'carousel',14,'images/home','mag14.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(22,'carousel',15,'images/home','mag15.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(23,'newArrivals',2,'images/home','newMag2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0');
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'34'),(2,'36'),(3,'38'),(4,'40'),(5,'42'),(6,'44'),(7,'46'),(8,'48'),(9,'50'),(10,'52'),(11,'54'),(12,'56'),(13,'58'),(14,'60'),(15,'XXS'),(16,'XS'),(17,'S'),(18,'M'),(19,'L'),(20,'XL'),(21,'XXL'),(22,'U'),(24,'35'),(26,'37'),(28,'39'),(30,'41'),(32,'43'),(34,'45'),(36,'47'),(37,'24'),(38,'25'),(39,'26'),(40,'27'),(41,'28'),(42,'29'),(43,'30'),(44,'31'),(45,'32'),(46,'33');
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
/*!40000 ALTER TABLE `states_orders` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `states_refound`
--

LOCK TABLES `states_refound` WRITE;
/*!40000 ALTER TABLE `states_refound` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_refound` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'en','ACCESSORIES'),(1,'it','ACCESSORI'),(3,'en','SHIRTS'),(3,'it','CAMICIE'),(4,'en','COATS'),(4,'it','CAPPOTTI'),(5,'en','DRESSES'),(5,'it','ABITI'),(7,'en','SWEATSHIRTS'),(7,'it','FELPE'),(8,'en','JACKETS'),(8,'it','GIACCHE'),(9,'en','LEATHER JACKETS'),(9,'it','GIACCHE DI PELLE'),(11,'en','CASUAL JACKETS'),(11,'it','GIUBBOTTI'),(12,'en','SKIRTS'),(12,'it','GONNE'),(15,'en','KNITWEAR'),(15,'it','MAGLIE'),(16,'en','PANTS'),(16,'it','PANTALONI'),(17,'en','CARDIGAN'),(17,'it','CARDIGAN'),(18,'en','BAGS'),(18,'it','BORSE'),(19,'en','TOPS'),(19,'it','CANOTTE'),(20,'en','SHOES'),(20,'it','SCARPE'),(21,'en','T-SHIRTS'),(21,'it','T-SHIRTS');
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

-- Dump completed on 2014-10-29 10:05:06
