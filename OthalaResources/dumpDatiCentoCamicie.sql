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
INSERT INTO `article` VALUES (1,1,8,5,1,'thumb20141105110020651&PATREGDENJEATUUO_1_ori.jpeg',1,'PATREGDENJEATUUO'),(1,2,9,5,1,'thumb20141105110020651&PATREGDENJEATUUO_1_ori.jpeg',1,'PATREGDENJEATUUO'),(1,3,10,5,1,'thumb20141105110020651&PATREGDENJEATUUO_1_ori.jpeg',1,'PATREGDENJEATUUO'),(2,1,16,5,1,'thumb20141105110245170&ABTSMABLUVISTUDO_1_ori.jpeg',1,'ABTSMABLUVISTUDO'),(2,2,18,5,1,'thumb20141105110245170&ABTSMABLUVISTUDO_1_ori.jpeg',1,'ABTSMABLUVISTUDO'),(2,3,17,13,1,'thumb20141105110246509&ABTSMAROSVISTUDO_1_ori.jpeg',1,'ABTSMABLUVISTUDO'),(2,4,19,13,1,'thumb20141105110246509&ABTSMAROSVISTUDO_1_ori.jpeg',1,'ABTSMABLUVISTUDO');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (20,'KEATON'),(21,'SWAROVSKI COMPONENTS'),(22,'BURLINGTON'),(23,'PAOLO DA PONTE'),(24,'NENETTE'),(25,'ANDERSON\'S'),(26,'IL CENTIMETRO'),(27,'GERMANO'),(29,'AVIREX'),(30,'RICHARD J. BROWN'),(31,'SPIN'),(32,'HAVANA & CO.'),(33,'LEIDIRO\'');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'SALDI P/E 2014','2014-11-04','2014-12-31',50);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'en','ORANGE'),(1,'it','ARANCIONE'),(2,'en','SILVER'),(2,'it','ARGENTO'),(3,'en','BEIGE'),(3,'it','BEIGE'),(4,'en','WHITE'),(4,'it','BIANCO'),(5,'en','BLUE'),(5,'it','BLU'),(6,'en','LIGHT BLUE'),(6,'it','CELESTE'),(7,'en','DENIM'),(7,'it','DENIM'),(8,'en','YELLOW'),(8,'it','GIALLO'),(9,'en','GREY'),(9,'it','GRIGIO'),(10,'en','BROWN'),(10,'it','MARRONE'),(11,'en','BLACK'),(11,'it','NERO'),(12,'en','GOLD'),(12,'it','ORO'),(13,'en','ROSE'),(13,'it','ROSA'),(14,'en','RED'),(14,'it','ROSSO'),(15,'en','GREEN'),(15,'it','VERDE'),(16,'en','PURPLE'),(16,'it','VIOLA'),(17,'en','LEOPARD'),(17,'it','LEOPARD'),(18,'en','MULTICOLOR'),(18,'it','MULTICOLOR');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES ('1','Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo',0);
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
INSERT INTO `delivery_cost` VALUES (1,'GLS Parcel camionistico',7.90,0,'GLS Parcel camionistico',NULL),(2,'GLS Zefiro via aerea',9.74,0,'GLS Zefiro via aerea',NULL),(3,'GLS Zefiro via aerea',20.04,0,'GLS Zefiro via aerea',NULL),(4,'GLS Zefiro via aerea',17.19,0,'GLS Zefiro via aerea',NULL),(5,'GLS Zefiro via aerea',17.43,0,'GLS Zefiro via aerea',NULL),(6,'GLS Zefiro via aerea',19.56,0,'GLS Zefiro via aerea',NULL),(7,'GLS Zefiro via aerea',34.15,0,'GLS Zefiro via aerea',NULL),(8,'GLS Zefiro via aerea',48.94,0,'GLS Zefiro via aerea',NULL),(9,'GLS Zefiro via aerea',49.46,0,'GLS Zefiro via aerea',NULL),(10,'GLS Parcel camionistico',13.80,0,'GLS Parcel camionistico',NULL),(11,'GLS Parcel camionistico',14.05,0,'GLS Parcel camionistico',NULL),(12,'GLS Parcel camionistico',15.70,0,'GLS Parcel camionistico',NULL),(13,'GLS Parcel camionistico',16.76,0,'GLS Parcel camionistico',NULL),(14,'GLS Parcel camionistico',17.25,0,'GLS Parcel camionistico',NULL),(15,'GLS Parcel camionistico',18.97,0,'GLS Parcel camionistico',NULL),(16,'GLS Parcel camionistico',19.35,0,'GLS Parcel camionistico',NULL),(17,'GLS Parcel camionistico',20.45,0,'GLS Parcel camionistico',NULL),(18,'GLS Parcel camionistico',21.48,0,'GLS Parcel camionistico',NULL),(19,'GLS Parcel camionistico',23.66,0,'GLS Parcel camionistico',NULL),(20,'GLS Parcel camionistico',25.88,0,'GLS Parcel camionistico',NULL),(21,'GLS Parcel camionistico',27.46,0,'GLS Parcel camionistico',NULL),(22,'GLS Parcel camionistico',28.34,0,'GLS Parcel camionistico',NULL),(23,'GLS Parcel camionistico',28.59,0,'GLS Parcel camionistico',NULL),(24,'GLS Parcel camionistico',30.68,0,'GLS Parcel camionistico',NULL),(25,'GLS Parcel camionistico',31.45,0,'GLS Parcel camionistico',NULL),(26,'GLS Parcel camionistico',36.73,0,'GLS Parcel camionistico',NULL),(27,'GLS Parcel camionistico',40.91,0,'GLS Parcel camionistico',NULL),(28,'GLS Parcel camionistico',41.35,0,'GLS Parcel camionistico',NULL),(29,'GLS Parcel camionistico',45.30,0,'GLS Parcel camionistico',NULL);
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `delivery_nazioni`
--

LOCK TABLES `delivery_nazioni` WRITE;
/*!40000 ALTER TABLE `delivery_nazioni` DISABLE KEYS */;
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA',NULL),(2,'Austria',NULL),(2,'Belgium',NULL),(2,'Denmark',NULL),(2,'Finland',NULL),(2,'France',NULL),(2,'Germany',NULL),(2,'Greece',NULL),(2,'Ireland',NULL),(2,'Luxembourg',NULL),(2,'Monaco',NULL),(2,'Netherlands',NULL),(2,'Portugal',NULL),(2,'Spain',NULL),(2,'Sweden',NULL),(2,'United Kingdom',NULL),(3,'Bulgaria',NULL),(3,'Croatia',NULL),(3,'Cyprus',NULL),(3,'Czech Republic',NULL),(3,'Estonia',NULL),(3,'Hungary',NULL),(3,'Latvia',NULL),(3,'Lithuania',NULL),(3,'Malta',NULL),(3,'Poland',NULL),(3,'Romania',NULL),(3,'Slovakia',NULL),(3,'Slovenia',NULL),(4,'Andorra',NULL),(4,'Gibraltar',NULL),(4,'Switzerland',NULL),(5,'Canary Islands',NULL),(5,'Faroe Islands',NULL),(5,'Guernsey',NULL),(5,'Iceland',NULL),(5,'Jersey',NULL),(5,'Norway',NULL),(6,'Canada',NULL),(6,'United States',NULL),(7,'American Samoa',NULL),(7,'Anguilla',NULL),(7,'Antigua and Barbuda',NULL),(7,'Argentina',NULL),(7,'Aruba',NULL),(7,'Australia',NULL),(7,'Bahamas',NULL),(7,'Bahrain',NULL),(7,'Bangladesh',NULL),(7,'Barbados',NULL),(7,'Belize',NULL),(7,'Bermuda',NULL),(7,'Bolivia',NULL),(7,'Bonaire',NULL),(7,'Brazil',NULL),(7,'Brunei Darussalam',NULL),(7,'Cameroon',NULL),(7,'Cayman Islands',NULL),(7,'Chile',NULL),(7,'Colombia',NULL),(7,'Costa Rica',NULL),(7,'Curacao',NULL),(7,'Dominica',NULL),(7,'Dominican Republic',NULL),(7,'Ecuador',NULL),(7,'Egypt',NULL),(7,'El Salvador',NULL),(7,'Equatorial Guinea',NULL),(7,'Fiji',NULL),(7,'French Guiana',NULL),(7,'Greenland',NULL),(7,'Grenada',NULL),(7,'Guadeloupe',NULL),(7,'Guam',NULL),(7,'Guatemala',NULL),(7,'Guyana',NULL),(7,'Haiti',NULL),(7,'Honduras',NULL),(7,'Hong Kong',NULL),(7,'India',NULL),(7,'Indonesia',NULL),(7,'Ivory Coast',NULL),(7,'Jamaica',NULL),(7,'Japan',NULL),(7,'Kenya',NULL),(7,'Kuwait',NULL),(7,'Macao',NULL),(7,'Malaysia',NULL),(7,'Maldives',NULL),(7,'Martinique',NULL),(7,'Mexico',NULL),(7,'Micronesia',NULL),(7,'Montserrat',NULL),(7,'Nevis',NULL),(7,'New Caledonia',NULL),(7,'New Zealand',NULL),(7,'Nigeria',NULL),(7,'Oman',NULL),(7,'Pakistan',NULL),(7,'Palau',NULL),(7,'Panama',NULL),(7,'Paraguay',NULL),(7,'Peru',NULL),(7,'Philippines',NULL),(7,'Puerto Rico',NULL),(7,'Qatar',NULL),(7,'Saint Barthelemy',NULL),(7,'Saint Eustatius',NULL),(7,'Saint Kitts and Nevis',NULL),(7,'Saint Lucia',NULL),(7,'Saint Maarten',NULL),(7,'Saint Vincent e Grenadine',NULL),(7,'Samoa',NULL),(7,'Saudi Arabia',NULL),(7,'Senegal',NULL),(7,'Singapore',NULL),(7,'South Africa',NULL),(7,'South Korea',NULL),(7,'Sri Lanka',NULL),(7,'Suriname',NULL),(7,'Tahiti',NULL),(7,'Taiwan',NULL),(7,'Thailand',NULL),(7,'Trinidad and Tobago',NULL),(7,'Turkey',NULL),(7,'United Arab Emirates',NULL),(7,'Uruguay',NULL),(7,'Venezuela',NULL),(7,'Virgin Islands',NULL),(8,'Algeria',NULL),(8,'Benin',NULL),(8,'Bhutan',NULL),(8,'Botswana',NULL),(8,'Burkina Faso',NULL),(8,'Burundi',NULL),(8,'Cambodia',NULL),(8,'Cape Verde',NULL),(8,'Center Africa',NULL),(8,'Chad',NULL),(8,'China',NULL),(8,'Comoros',NULL),(8,'Congo',NULL),(8,'Cook Islands',NULL),(8,'Djibouti',NULL),(8,'East Timor',NULL),(8,'Eritrea',NULL),(8,'Ethiopia',NULL),(8,'Gabon',NULL),(8,'Gambia',NULL),(8,'Ghana',NULL),(8,'Guinea',NULL),(8,'Guinea-Bissau',NULL),(8,'Iraq',NULL),(8,'Israel',NULL),(8,'Jordan',NULL),(8,'Lao',NULL),(8,'Lebanon',NULL),(8,'Lesotho',NULL),(8,'Liberia',NULL),(8,'Libya',NULL),(8,'Madagascar',NULL),(8,'Malawi',NULL),(8,'Mali',NULL),(8,'Marshall Islands',NULL),(8,'Mauritania',NULL),(8,'Mauritius',NULL),(8,'Mayotte',NULL),(8,'Morocco',NULL),(8,'Namibia',NULL),(8,'Nauru',NULL),(8,'Nepal',NULL),(8,'Nicaragua',NULL),(8,'Niger',NULL),(8,'Papua New Guinea',NULL),(8,'Reunion Island',NULL),(8,'Rwanda',NULL),(8,'Saipan',NULL),(8,'Seychelles',NULL),(8,'Sierra Leone',NULL),(8,'Somalia',NULL),(8,'Swaziland',NULL),(8,'Syria',NULL),(8,'Tanzania',NULL),(8,'Togo',NULL),(8,'Tonga',NULL),(8,'Tunisia',NULL),(8,'Turks and Caicos Islands',NULL),(8,'Tuvalu',NULL),(8,'Uganda',NULL),(8,'Vanuatu',NULL),(8,'Vietnam',NULL),(8,'Yemen',NULL),(8,'Zambia',NULL),(8,'Zimbabwe',NULL),(9,'Afghanistan',NULL),(9,'Albania',NULL),(9,'Angola',NULL),(9,'Armenia',NULL),(9,'Azerbaijan',NULL),(9,'Belarus',NULL),(9,'Bosnia and Herzegovina',NULL),(9,'Cuba',NULL),(9,'Falkland Islands',NULL),(9,'Georgia',NULL),(9,'Iran',NULL),(9,'Kazakhstan',NULL),(9,'Kiribati',NULL),(9,'Kosovo',NULL),(9,'Kyrgyzstan',NULL),(9,'Macedonia',NULL),(9,'Moldova',NULL),(9,'Mongolia',NULL),(9,'Montenegro',NULL),(9,'Mozambique',NULL),(9,'Myanmar, Burma',NULL),(9,'Niue',NULL),(9,'North Korea',NULL),(9,'Russian Federation',NULL),(9,'Serbia',NULL),(9,'Solomon Islands',NULL),(9,'South Sudan',NULL),(9,'Sudan',NULL),(9,'Tajikistan',NULL),(9,'Ukraine',NULL),(9,'Uzbekistan',NULL),(10,'Austria',NULL),(11,'Belgium',NULL),(12,'France',NULL),(12,'Germany',NULL),(12,'Luxembourg',NULL),(12,'Netherlands',NULL),(13,'Liechtenstein',NULL),(14,'Switzerland',NULL),(15,'Denmark',NULL),(15,'Slovenia',NULL),(16,'England',NULL),(16,'Galles',NULL),(16,'Scotland',NULL),(17,'Hungary',NULL),(18,'Croatia',NULL),(18,'Serbia',NULL),(19,'Poland',NULL),(20,'Czech Republic',NULL),(20,'Spain',NULL),(21,'Sweden',NULL),(22,'Slovakia',NULL),(23,'Bulgaria',NULL),(23,'Estonia',NULL),(23,'Latvia',NULL),(23,'Lithuania',NULL),(23,'Norway',NULL),(23,'Portugal',NULL),(23,'Romania',NULL),(24,'Ireland',NULL),(25,'Finland',NULL),(26,'Turkey',NULL),(27,'Greece',NULL),(28,'Nord Ireland',NULL),(29,'Cyprus',NULL),(29,'Malta',NULL);
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
INSERT INTO `gender` VALUES (1,'en','MAN'),(1,'it','UOMO'),(2,'en','WOMAN'),(2,'it','DONNA');
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
INSERT INTO `material` VALUES (1,'en','COTTON'),(1,'it','COTONE'),(2,'en','SILK'),(2,'it','SETA'),(3,'en','BRUSHED CALF LEATHER'),(3,'it','VITELLO SPAZZOLATO'),(4,'en','NEOPRENE'),(4,'it','NEOPRENE'),(5,'en','POLIESTERE'),(5,'it','POLIESTERE'),(6,'en','ELASTAM'),(6,'it','ELASTAM'),(7,'en','VISCOSE'),(7,'it','VISCOSA');
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
INSERT INTO `product` VALUES (1,1,16,27,109,0,'thumb20141105110020651&PATREGDENJEATUUO_1_ori.jpeg',1,'2014-11-05 11:00:51',1,1,NULL),(2,2,19,24,109,20,'thumb20141105110246509&ABTSMAROSVISTUDO_1_ori.jpeg',1,'2014-11-05 11:03:44',NULL,7,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
INSERT INTO `product_description` VALUES (1,'en','JEANS GERMANO REGULAR MADE IN ITALY SARTORIALE'),(1,'it','JEANS GERMANO REGULAR MADE IN ITALY SARTORIALE'),(2,'en','ABITO NENETTE BLU NAVY CON GEORGETTE'),(2,'it','ABITO NENETTE BLU NAVY CON GEORGETTE');
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'20141105110020497&PATREGDENJEATUUO_4_ori (1).jpeg'),(1,2,'20141105110020592&PATREGDENJEATUUO_3_ori.jpeg'),(1,3,'20141105110020523&PATREGDENJEATUUO_4_ori.jpeg'),(1,4,'20141105110020651&PATREGDENJEATUUO_1_ori.jpeg'),(2,1,'20141105110245170&ABTSMABLUVISTUDO_1_ori.jpeg'),(2,2,'20141105110246001&ABTSMABLUVISTUDO_2_ori.jpeg'),(2,3,'20141105110246509&ABTSMAROSVISTUDO_1_ori.jpeg'),(2,4,'20141105110246536&ABTSMAROSVISTUDO_2_ori.jpeg'),(2,5,'20141105110246766&ABTSMAROSVISTUDO_3_ori.jpeg');
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
INSERT INTO `shops` VALUES (1,'Siena','jacopo.frediani@banca.mps.it','100% Camicie','Via Camollia, 82-84','Siena',53100,'SI','Italia','+39 0577 221311');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES 
( 'new', 1,  'new.png',null,null,null), 
( 'promo', 1,  'promo.png',null,null,null),
('carousel',1,'carousel1.jpg',null,null,null),
('carousel',2,'carousel2.jpg',null,null,null),
('carousel',3,'carousel3.jpg',null,null,null),
('carousel',4,'carousel4.jpg',null,null,null),
('newArrivals',1,'newuomo2.png',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0',null),
('tabNav',1,'logoUomoOK.png',1,NULL,null),
('carousel',5,'carousel5.jpg',null,null,null),
('carousel',6,'carousel6.jpg',null,null,null),
('newArrivals',2,'newdonna2.png',2,'/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0',null),
('tabNav',2,'logoDonnaOK.png',2,NULL,null);
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
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'en','CUFFLINKS'),(1,'it','GEMELLI'),(3,'en','SHIRTS'),(3,'it','CAMICIE'),(4,'en','SLINGS'),(4,'it','BRETELLE'),(5,'en','SCARFS & FOULARDS'),(5,'it','SCIARPE E FOULARDS'),(7,'en','POCHETTES'),(7,'it','POCHETTES'),(8,'en','TIES'),(8,'it','CRAVATTE'),(9,'en','BELTS'),(9,'it','CINTURE'),(11,'en','SOCKS'),(11,'it','CALZINI'),(12,'en','HANDMADE JEWELRY'),(12,'it','BIGIOTTERIA ARTIGIANALE'),(15,'en','HANDMADE SHOES'),(15,'it','SCARPE ARTIGIANALI'),(16,'en','PANTS'),(16,'it','PANTALONI'),(17,'en','KNITWEAR'),(17,'it','MAGLIERIA'),(18,'en','JACKETS'),(18,'it','GIACCHE'),(19,'en','SUITS'),(19,'it','ABITI'),(20,'en','SKIRTS'),(20,'it','GONNE');
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

-- Dump completed on 2014-11-05 16:34:50
