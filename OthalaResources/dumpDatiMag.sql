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
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'SALDI P/E 2014','2014-10-28','2014-12-31',70);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
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
INSERT INTO `site_images` VALUES ('carousel',1,'DSC_1336.JPG',NULL,NULL),('carousel',2,'DSC_1486 copia.jpg',NULL,NULL),('carousel',3,'DSC_1393.JPG',NULL,NULL),('carousel',4,'DSC_1524.JPG',NULL,NULL),('carousel',5,'DSC_1345.JPG',NULL,NULL),('carousel',6,'DSC_1477 copia.jpg',NULL,NULL),('carousel',7,'DSC_1537.JPG',NULL,NULL),('carousel',8,'DSC_1670.JPG',NULL,NULL),('carousel',9,'DSC_1599 copia 2.jpg',NULL,NULL),('carousel',10,'DSC_1568.JPG',NULL,NULL),('carousel',11,'DSC_1618 copia.jpg',NULL,NULL),('carousel',12,'DSC_1653.JPG',NULL,NULL),('carousel',13,'DSC_1739.JPG',NULL,NULL),('carousel',14,'DSC_1741.JPG',NULL,NULL),('carousel',15,'DSC_1770.JPG',NULL,NULL),('carousel',16,'DSC_1766.JPG',NULL,NULL),('carousel',17,'DSC_1838.JPG',NULL,NULL),('carousel',18,'DSC_1908.JPG',NULL,NULL),('carousel',19,'DSC_2000.JPG',NULL,NULL),('carousel',20,'DSC_2003.JPG',NULL,NULL),('carousel',21,'DSC_1962.JPG',NULL,NULL),('carousel',22,'DSC_1998.JPG',NULL,NULL),('new',1,'new.png',NULL,NULL),('newArrivals',1,'newMag.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),('newArrivals',2,'newMag2.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),('promo',1,'promo.png',NULL,NULL),('tabNav',1,'logoTab2.png',1,NULL);
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `group_images`
--

LOCK TABLES `group_images` WRITE;
/*!40000 ALTER TABLE `group_images` DISABLE KEYS */;
INSERT INTO `group_images` VALUES ('carousel','images/home',20,1080,1560,0),('new','images/home',1,130,260,0),('newArrivals','images/home',6,960,960,1),('promo','images/home',1,130,260,0),('tabNav','images/home',6,130,260,1);
/*!40000 ALTER TABLE `group_images` ENABLE KEYS */;
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
-- Dumping data for table `type_state_account`
--

LOCK TABLES `type_state_account` WRITE;
/*!40000 ALTER TABLE `type_state_account` DISABLE KEYS */;
INSERT INTO `type_state_account` VALUES (1,'DISATTIVATO'),(2,'ATTIVATO'),(3,'CESSATO'),(4,'RESET_PSW');
/*!40000 ALTER TABLE `type_state_account` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (27,1,18,37,1250,0,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'2014-10-27 16:18:59',1,3,NULL),(30,1,18,50,120,0,'thumb20141110145915895&IMG_5244.JPG',1,'2014-11-10 15:10:41',NULL,6,NULL),(31,1,5,37,745,0,'thumb20141117145236567&marnidress.jpg',1,'2014-11-17 14:50:49',NULL,2,NULL),(33,1,5,37,840,0,'thumb20141117150330714&marnidress2.jpg',1,'2014-11-17 14:57:20',NULL,2,NULL),(34,1,5,37,650,0,'thumb20141117150649764&marnidress3.jpg',1,'2014-11-17 15:01:00',NULL,7,NULL),(35,1,7,37,485,0,'thumb20141117151037361&marnifelpa1.jpg',1,'2014-11-17 15:04:44',NULL,7,NULL),(36,1,8,37,1080,0,'thumb20141117151402445&marnigiacca.jpg',1,'2014-11-17 15:07:45',NULL,8,NULL),(37,1,12,37,510,0,'thumb20141117151903324&marniskirt1.jpg',1,'2014-11-17 15:13:26',NULL,2,NULL),(38,1,15,37,465,0,'thumb20141117152242340&marnisweater.jpg',1,'2014-11-17 15:16:23',NULL,9,NULL),(39,1,22,37,645,0,'thumb20141117152618174&marnitop1.jpg',1,'2014-11-17 15:20:00',NULL,2,NULL),(40,1,7,39,140,0,'thumb20141117152935991&msgm4.jpg',1,'2014-11-17 15:23:22',NULL,1,NULL),(41,1,4,39,1270,0,'thumb20141117153225513&msgmcoat1.jpg',1,'2014-11-17 15:26:31',NULL,10,NULL),(42,1,4,39,660,0,'thumb20141117153632036&msgmcoat2.jpg',1,'2014-11-17 15:31:15',NULL,10,NULL),(43,1,5,39,545,0,'thumb20141117154100230&msgmdress1.jpg',1,'2014-11-17 15:34:58',NULL,5,NULL),(44,1,16,39,180,0,'thumb20141117154358571&msgmshorts1.jpg',1,'2014-11-17 15:38:09',NULL,5,NULL),(45,1,5,39,370,0,'thumb20141117154652304&msgmdress3.jpg',1,'2014-11-17 15:40:48',NULL,5,NULL),(46,1,12,39,245,0,'thumb20141117154924381&msgmskirt2.jpg',1,'2014-11-17 15:45:39',NULL,5,NULL),(47,1,4,30,1620,0,'thumb20141117155305066&cappottodusan.jpg',1,'2014-11-17 15:47:35',NULL,8,NULL),(48,1,16,30,715,0,'thumb20141117155623037&pantdusan1.jpg',1,'2014-11-17 15:51:02',NULL,11,NULL),(49,1,16,37,445,0,'thumb20141117155809616&pantmarni1.jpg',1,'2014-11-17 15:56:50',NULL,9,NULL),(50,1,16,39,380,0,'thumb20141117160407739&pantsmsgm1.jpg',1,'2014-11-17 16:00:17',NULL,10,NULL),(51,1,22,39,270,0,'thumb20141117160852870&topmsgm.jpg',1,'2014-11-17 16:05:14',NULL,7,NULL),(52,1,15,39,230,0,'thumb20141117161232874&topmsgm1.jpg',1,'2014-11-17 16:09:05',NULL,9,NULL),(53,1,7,39,355,0,'thumb20141117161654164&topmsgm3.jpg',1,'2014-11-17 16:13:10',NULL,1,NULL),(54,1,16,51,325,0,'thumb20141117162021276&pantcalderara.jpg',1,'2014-11-17 16:17:41',NULL,5,NULL),(55,1,22,51,275,0,'thumb20141117162511277&topcalderara.jpg',1,'2014-11-17 16:20:25',NULL,5,NULL),(56,1,22,51,200,0,'thumb20141117162732943&topcalderara3.jpg',1,'2014-11-17 16:23:40',NULL,5,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'en','ORANGE'),(1,'it','ARANCIONE'),(2,'en','SILVER'),(2,'it','ARGENTO'),(3,'en','BEIGE'),(3,'it','BEIGE'),(4,'en','WHITE'),(4,'it','BIANCO'),(5,'en','BLUE'),(5,'it','BLU'),(6,'en','LIGHT BLUE'),(6,'it','CELESTE'),(7,'en','DENIM'),(7,'it','DENIM'),(8,'en','YELLOW'),(8,'it','GIALLO'),(9,'en','GREY'),(9,'it','GRIGIO'),(10,'en','BROWN'),(10,'it','MARRONE'),(11,'en','BLACK'),(11,'it','NERO'),(12,'en','GOLD'),(12,'it','ORO'),(13,'en','ROSE'),(13,'it','ROSA'),(14,'en','RED'),(14,'it','ROSSO'),(15,'en','GREEN'),(15,'it','VERDE'),(16,'en','PURPLE'),(16,'it','VIOLA'),(17,'en','LEOPARD'),(17,'it','LEOPARD'),(18,'en','TURQUASE'),(18,'it','TURCHESE'),(19,'en','OCEAN'),(19,'it','OCEANO'),(20,'en','CARBON'),(20,'it','CARBONE'),(21,'en','CINNAMON BROWN'),(21,'it','CANNELLA'),(22,'en','BLUE/BLACK'),(22,'it','BLU/BLACK');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (20,'5 DEPARTMENT'),(21,'ALTO'),(22,'ANDREA INCONTRI'),(23,'ANTIPAST'),(24,'BJORG'),(25,'CARLO CONTRADA'),(26,'COLLECTION PRIVEÈ'),(27,'DAMIR DOMA'),(29,'DIPTYQUE'),(30,'DUSÀN'),(31,'ES’GIVIEN'),(32,'IOSSELLINI'),(33,'JAMIN PUECH'),(34,'JOE’S JEANS'),(35,'LE PRAIRIES DE PARIS'),(36,'LUNA BI'),(37,'MARNI'),(39,'MSGM'),(40,'ORION LONDON'),(41,'PAULA CADEMARTORI'),(42,'PREMIATA WHITE'),(43,'ROBERTO DEL CARLO'),(44,'SAMANTHA SUNG'),(45,'SOHO DE LUXE'),(46,'SO NICE'),(47,'U’ AVIÙ'),(48,'VOLTA'),(49,'USLUAIRLINES'),(50,'DESIGNINVERSO'),(51,'CALDERARA');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'en','COTTON'),(1,'it','COTONE'),(2,'en','SILK'),(2,'it','SETA'),(3,'en','BRUSHED CALF LEATHER'),(3,'it','VITELLO SPAZZOLATO'),(4,'en','NEOPRENE'),(4,'it','NEOPRENE'),(5,'en','POLIESTERE'),(5,'it','POLIESTERE'),(6,'en','PLASTIC'),(6,'it','PLASTICA'),(7,'en','VISCOSE'),(7,'it','VISCOSA'),(8,'en','ALPACA WOOL'),(8,'it','ALPACA'),(9,'en','VIRGIN WOOL'),(9,'it','LANA VERGINE'),(10,'en','WOOL'),(10,'it','LANA'),(11,'en','CASHEMERE'),(11,'it','CASHEMERE');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (27,'en','METAL TRUNK BAG'),(27,'it','BORSA METAL TRUNK'),(30,'en','PVC MILANO BAG, FOLDOVER TOP WITH SNAP CLOSURE, A QUILTED LEATHER EFFECT, A CHAIN SHOULDER STRAP, GOLD-TONE HARDWARE AND AN INTERNAL LOGO STAMP'),(30,'it','PVC MILANO BORSA, EFFETTO PELLE TRAPUNTATA, CATENA A TRACOLLA, CHIUSURA A CALAMITA '),(31,'en','CREW NECK TUNIC IN COMPACT CADY CREPE'),(31,'it','TUNICA GIROCOLLO IN CREPE CADY COMPATTO '),(33,'en','FASHION SHOW\'S DRESS IN RADZIMR, WITH “MAGNUS PLESSEN 2” DRAWING.'),(33,'it','ABITO GIROCOLLO DI SFILATA IN RADZIMR, CON STAMPA MAGNUS PLESSEN 2.'),(34,'en','CREW NECK DRESS IN BICOLOR BONDED JERSEY '),(34,'it','ABITO GIROCOLLO IN DOPPIO JERSEY BICOLORE '),(35,'en','CREW NECK SWEATSHIRT IN BONDED JERSEY, WITH \"DRIPPING\" DRAWING'),(35,'it','FELPA GIROCOLLO DI SFILATA IN JERSEY ACCOPPIATO, STAMPA “DRIPPING”. '),(36,'en','FASHION SHOW\'S COAT IN BONDED PLUSH ALPACA'),(36,'it','GIACCA DI SFILATA IN FELPA E ALPACA ACCOPPIATA '),(37,'en','FASHION SHOW\'S SKIRT IN COTTON AND DOUBLE SILK, WITH \"BRIGHT\" STAMP'),(37,'it','GONNA DI  SFILATA IN COTONE E SETA DOUBLE CON STAMPA \"BRIGHT\"'),(38,'en','FASHION SHOW\'S CREW NECK SWEATER IN JACQUARD CHECK'),(38,'it','MAGLIA GIROCOLLO DI SFILATA CON JACQUARD CHECK'),(39,'en','CREW NECK SHIRT WITH \"BRIGHT\" STAMP'),(39,'it','BLUSA GIROCOLLO CON STAMPA \"BRIGHT\" BLU'),(40,'en','SWEATSHIRT WITH TRUTH BEAUTY'),(40,'it','FELPA CON SCRITTA TRUTH BEAUTY'),(41,'en','DOUBLE BREASTED COAT IN WOOL WITH COYOTE\'S NECK'),(41,'it','CAPPOTTO DOPPIO PETTO IN PANNO DI LANA CON COLLETTO DI COYOTE'),(42,'en','COAT WITH FLOWER FANTASY'),(42,'it','CAPPOTTO FANTASIA FIORI '),(43,'en','CREW NECK DRESS WITH JACQUARD LUREX ROSES'),(43,'it','ABITO GIROCOLLO BROCCATO LUREX ROSE JACQUARD'),(44,'en','BERMUDA SHORTS IN ECO NAPPA LEATHER PLISSÉ'),(44,'it','BERMUDA IN ECO NAPPA PLISSÉ'),(45,'en','DRESS WITH LATEX TOP AND COOL WOOL SKIRT'),(45,'it','ABITO CON TOP IN LATEX E GONNA IN FRESCO LANA'),(46,'en','SKIRT IN SILVER LAMINATED CANVAS'),(46,'it','GONNA A RUOTA IN TELA LAMINATA ARGENTO'),(47,'en','ALPACA WOOL COAT'),(47,'it','CAPPOTTO IN ALPACA GRIGIO'),(48,'en','GRAY STRIPS TROUSER IN CASHEMERE, LIN AND SILK'),(48,'it','PANTALONE A RIGHE GRIGIE IN CASHEMERE, LINO E SETA'),(49,'en','TROUSERS IN HIGH TWISTED WOOL'),(49,'it','PANTALONE IN GABARDINE STRETCH, MODELLO SOPRA LA CAVIGLIA.'),(50,'en','BERMUDA SHORTS IN WOOL AND SILK WITH FUR EFFECT'),(50,'it','BERMUDA IN LANA E SETA EFFETTO PELLICCIA'),(51,'en','CREW NECK SHIRT IN CHINA CREPE WITH WRITTEN PHRASES'),(51,'it','BLUSA GIROCOLLO IN CREPE DE CHINA CON STAMPA SCRITTE'),(52,'en','CREW NECK SWEATER WITH CHECK FANTASY'),(52,'it','MAGLIA GIROCOLLO CON FANTASIA CHECK SUL DAVANTI'),(53,'en','SWEATSHIRT WITH ROSES\'S DRAWING'),(53,'it','FELPA CON STAMPA ROSE GRAFFIATE'),(54,'en','3/4 LENGTH WIDE PANTS IN ECO LEATHER'),(54,'it','PANTALONE 3/4 LARGO IN ECO PELLE'),(55,'en','QUILTED OVER TEEN TOP'),(55,'it','TOP OVER TRAPUNTATO '),(56,'en','NET OVER DRESS'),(56,'it','TOP LUNGO A RETE ');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (27,1,'20141027161832764&45239055TE_13P_a.jpg'),(27,2,'20141027161832712&45239055TE_13P_F.jpg'),(27,3,'20141027161832718&45239055TE_13P_e.jpg'),(27,4,'20141027161832744&45239055TE_13P_d.jpg'),(30,1,'20141110145915895&IMG_5244.JPG'),(30,3,'20141110152118223&IMG_5246.jpg'),(31,1,'20141117145236567&marnidress.jpg'),(33,1,'20141117150330714&marnidress2.jpg'),(34,1,'20141117150649764&marnidress3.jpg'),(35,1,'20141117151037361&marnifelpa1.jpg'),(36,1,'20141117151402445&marnigiacca.jpg'),(37,1,'20141117151903324&marniskirt1.jpg'),(37,2,'20141117151927212&marniskirt1back.jpg'),(38,1,'20141117152242340&marnisweater.jpg'),(39,1,'20141117152618174&marnitop1.jpg'),(40,1,'20141117152935991&msgm4.jpg'),(41,1,'20141117153225513&msgmcoat1.jpg'),(42,1,'20141117153632036&msgmcoat2.jpg'),(43,1,'20141117154100230&msgmdress1.jpg'),(44,1,'20141117154358571&msgmshorts1.jpg'),(45,1,'20141117154652304&msgmdress3.jpg'),(46,1,'20141117154924381&msgmskirt2.jpg'),(47,1,'20141117155305066&cappottodusan.jpg'),(48,1,'20141117155623037&pantdusan1.jpg'),(49,1,'20141117155809616&pantmarni1.jpg'),(50,1,'20141117160407739&pantsmsgm1.jpg'),(51,1,'20141117160852870&topmsgm.jpg'),(52,1,'20141117161232874&topmsgm1.jpg'),(53,1,'20141117161654164&topmsgm3.jpg'),(54,1,'20141117162021276&pantcalderara.jpg'),(55,1,'20141117162511277&topcalderara.jpg'),(56,1,'20141117162732943&topcalderara3.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (27,1,22,13,3,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'SBMPQ04YN0LV53100C19'),(30,1,22,18,1,'thumb20141110145915895&IMG_5244.JPG',1,'121212'),(31,1,4,5,1,'thumb20141117145236567&marnidress.jpg',1,'101112'),(31,2,5,5,1,'thumb20141117145917778&marnidress.jpg',1,'101112'),(33,1,5,21,1,'thumb20141117150330714&marnidress2.jpg',1,'101113'),(34,1,38,20,1,'thumb20141117150649764&marnidress3.jpg',1,'101114'),(35,1,4,11,1,'thumb20141117151037361&marnifelpa1.jpg',1,'101115'),(35,2,5,11,1,'thumb20141117151037361&marnifelpa1.jpg',1,'101115'),(36,1,5,22,1,'thumb20141117151402445&marnigiacca.jpg',1,'101116'),(37,1,4,5,1,'thumb20141117151903324&marniskirt1.jpg',1,'101117'),(37,2,5,5,1,'thumb20141117151903324&marniskirt1.jpg',1,'101117'),(38,1,5,11,1,'thumb20141117152242340&marnisweater.jpg',1,'101118'),(39,1,42,5,1,'thumb20141117152618174&marnitop1.jpg',1,'101119'),(40,1,17,11,1,'thumb20141117152935991&msgm4.jpg',1,'111110'),(40,2,19,11,1,'thumb20141117152935991&msgm4.jpg',1,'111110'),(41,1,5,3,1,'thumb20141117153225513&msgmcoat1.jpg',1,'111111'),(42,1,4,9,1,'thumb20141117153632036&msgmcoat2.jpg',1,'111112'),(43,1,6,2,1,'thumb20141117154100230&msgmdress1.jpg',1,'111113'),(44,1,5,10,1,'thumb20141117154358571&msgmshorts1.jpg',1,'111114'),(45,1,5,11,1,'thumb20141117154652304&msgmdress3.jpg',1,'111115'),(45,2,6,11,1,'thumb20141117154652304&msgmdress3.jpg',1,'111115'),(46,1,4,2,1,'thumb20141117154924381&msgmskirt2.jpg',1,'111117'),(47,1,17,9,1,'thumb20141117155305066&cappottodusan.jpg',1,'111210'),(48,1,17,11,2,'thumb20141117155623037&pantdusan1.jpg',1,'111211'),(49,1,4,11,1,'thumb20141117155809616&pantmarni1.jpg',1,'101120'),(49,2,5,11,2,'thumb20141117155809616&pantmarni1.jpg',1,'101120'),(50,1,4,11,1,'thumb20141117160407739&pantsmsgm1.jpg',1,'111118'),(50,2,5,11,1,'thumb20141117160407739&pantsmsgm1.jpg',1,'111118'),(51,1,4,4,1,'thumb20141117160852870&topmsgm.jpg',1,'111119'),(51,2,5,4,1,'thumb20141117160852870&topmsgm.jpg',1,'111119'),(52,1,19,4,1,'thumb20141117161232874&topmsgm1.jpg',1,'111120'),(53,1,16,11,1,'thumb20141117161654164&topmsgm3.jpg',1,'111121'),(53,2,17,11,1,'thumb20141117161654164&topmsgm3.jpg',1,'111121'),(54,1,7,11,2,'thumb20141117162021276&pantcalderara.jpg',1,'111310'),(54,2,6,11,1,'thumb20141117162021276&pantcalderara.jpg',1,'111310'),(55,1,5,4,1,'thumb20141117162511277&topcalderara.jpg',1,'111311'),(56,1,5,14,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312'),(56,2,6,14,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312'),(56,3,6,11,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312'),(56,4,5,11,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312'),(56,5,4,5,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312'),(56,6,5,5,1,'thumb20141117162732943&topcalderara3.jpg',1,'111312');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'en','ACCESSORIES'),(1,'it','ACCESSORI'),(3,'en','SHIRTS'),(3,'it','CAMICIE'),(4,'en','COATS'),(4,'it','CAPPOTTI'),(5,'en','DRESSES'),(5,'it','ABITI'),(7,'en','SWEATSHIRTS'),(7,'it','FELPE'),(8,'en','JACKETS'),(8,'it','GIACCHE'),(9,'en','LEATHER JACKETS'),(9,'it','GIACCHE DI PELLE'),(11,'en','CASUAL JACKETS'),(11,'it','GIUBBOTTI'),(12,'en','SKIRTS'),(12,'it','GONNE'),(15,'en','KNITWEAR'),(15,'it','MAGLIE'),(16,'en','PANTS'),(16,'it','PANTALONI'),(17,'en','CARDIGAN'),(17,'it','CARDIGAN'),(18,'en','BAGS'),(18,'it','BORSE'),(19,'en','TOPS'),(19,'it','CANOTTE'),(20,'en','SHOES'),(20,'it','SCARPE'),(21,'en','T-SHIRTS'),(21,'it','T-SHIRTS'),(22,'en','TOP'),(22,'it','TOP');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
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
