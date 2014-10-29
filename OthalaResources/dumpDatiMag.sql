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
INSERT INTO `article` VALUES (27,1,22,13,3,'thumb20141027161832712&45239055TE_13P_F.jpg',1,'SBMPQ04YN0LV53100C19'),(28,1,17,5,1,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(28,2,18,5,1,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(28,3,19,5,1,'thumb20141027162532826&37585351NL_13P_e.jpg',1,'FLMAQ15Y00TV359V1B80'),(29,1,17,11,1,'thumb20141028122536802&35226250HX_13P_e.jpg',1,'GOMAQ30A00TP43700N99'),(29,2,18,11,1,'thumb20141028122536802&35226250HX_13P_e.jpg',1,'GOMAQ30A00TP43700N99');
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
INSERT INTO `delivery_cost` VALUES (1,'Corriere GLS',5,0,'Corriere espresso GLS',NULL),(2,'Corriere GLS Europa',10,0,'Corriere espresso GLS Europa',NULL);
/*!40000 ALTER TABLE `delivery_cost` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `delivery_nazioni`
--

LOCK TABLES `delivery_nazioni` WRITE;
/*!40000 ALTER TABLE `delivery_nazioni` DISABLE KEYS */;
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA'),(2,'FRANCIA');
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
INSERT INTO `nazioni` VALUES ('FRANCIA','fr'),('ITALIA','it');
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
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/carousel','mag01.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(2,'carousel',2,'images/carousel','mag02.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(3,'carousel',3,'images/carousel','mag03.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(4,'carousel',4,'images/carousel','mag04.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(5,'newArrivals',1,'images/newArrivals','newMag.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),(7,'tabNav',1,'images/tabNav','logoTab2.png',NULL),(12,'carousel',5,'images/carousel','mag05.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(13,'carousel',6,'images/carousel','mag06.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(14,'carousel',7,'images/carousel','mag07.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(15,'carousel',8,'images/carousel','mag08.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(16,'carousel',9,'images/carousel','mag09.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(17,'carousel',10,'images/carousel','mag10.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(18,'carousel',11,'images/carousel','mag11.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(19,'carousel',12,'images/carousel','mag12.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(20,'carousel',13,'images/carousel','mag13.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(21,'carousel',14,'images/carousel','mag14.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(22,'carousel',15,'images/carousel','mag15.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),(23,'newArrivals',2,'images/newArrivals','newMag2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0');
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
