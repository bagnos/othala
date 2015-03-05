/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : degortes_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 15:09:23
*/
drop schema if exists degortes_othala;
create schema degortes_othala;
use degortes_othala;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `addresses`
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '0', 'casa');
INSERT INTO `addresses` VALUES ('2', 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aretina 89', 'siena', '53100', 'si', 'ITALIA', '3332965518', '0', 'casa');
INSERT INTO `addresses` VALUES ('3', 'msmcnc@gmail.com', 'Massimiliano', 'Cencioni', 'Loc. La Ripa, via Don Dino Bandini', 'Siena', '53019', 'Si', 'ITALIA', '0577329180', '0', 'Casa');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `idProduct` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `idSize` int(11) DEFAULT NULL,
  `idColor` int(11) DEFAULT NULL,
  `qtStock` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(500) DEFAULT NULL,
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

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('26', '1', '9', '11', '0', 'thumb20141212125853994&056_67e9e8a5-d66d-44cd-a47c-cd3ea09fd7e1.JPG', '100', '111111', '2.00', '1.00', '30');
INSERT INTO `article` VALUES ('26', '2', '10', '11', '0', 'thumb20141212125853994&056_67e9e8a5-d66d-44cd-a47c-cd3ea09fd7e1.JPG', '100', '111111', '2.00', '1.00', '30');
INSERT INTO `article` VALUES ('26', '3', '10', '11', '1', 'thumb20141212125853994&056_67e9e8a5-d66d-44cd-a47c-cd3ea09fd7e1.JPG', '100', '6010000408816', '2.00', '1.00', '30');
INSERT INTO `article` VALUES ('27', '1', '9', '11', '0', 'thumb20141212130310393&126_7d3eddbf-a535-4b73-8fad-d8dcba0417de.JPG', '100', '111112', '1.00', null, '0');
INSERT INTO `article` VALUES ('27', '2', '9', '11', '1', 'thumb20141212130310393&126_7d3eddbf-a535-4b73-8fad-d8dcba0417de.JPG', '100', '6010000375781', '1.00', null, '0');
INSERT INTO `article` VALUES ('28', '1', '26', '13', '0', 'thumb20141212130809331&036_1bbd79c9-88f1-413f-bd28-c62935725194.JPG', '100', '111113', '1.00', null, '0');
INSERT INTO `article` VALUES ('28', '2', '3', '8', '0', 'thumb20141212130818063&033_1eb358a5-5e31-4e96-b8c7-764352cbb62a.JPG', '100', '111113', '1.00', null, '0');
INSERT INTO `article` VALUES ('28', '3', '48', '4', '1', 'thumb20141212130818063&033_1eb358a5-5e31-4e96-b8c7-764352cbb62a.JPG', '100', '6010000375804', '1.00', null, '0');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `txBrand` varchar(200) DEFAULT NULL,
  `idRegione` int(11) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL,
  `idUser` varchar(100) DEFAULT NULL,
  `urlFoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'LANVIN', null, null, null, null);
INSERT INTO `brand` VALUES ('2', 'BALMAIN', null, null, null, null);
INSERT INTO `brand` VALUES ('3', 'DSQUARED', null, null, null, null);
INSERT INTO `brand` VALUES ('4', 'MOSCHINO', null, null, null, null);
INSERT INTO `brand` VALUES ('5', 'DOLCE E GABBANA', null, null, null, null);
INSERT INTO `brand` VALUES ('6', 'STONE ISLAND', null, null, null, null);
INSERT INTO `brand` VALUES ('7', 'BLOCH', null, null, null, null);
INSERT INTO `brand` VALUES ('8', 'ARMANI', null, null, null, null);
INSERT INTO `brand` VALUES ('9', 'DIOR', null, null, null, null);
INSERT INTO `brand` VALUES ('10', 'SAINT LAURENT', null, null, null, null);
INSERT INTO `brand` VALUES ('11', 'ALEXANDER MCQUEEN', null, null, null, null);
INSERT INTO `brand` VALUES ('12', 'UGG AUSTRALIA', null, null, null, null);
INSERT INTO `brand` VALUES ('13', 'GIVENCHY', null, null, null, null);
INSERT INTO `brand` VALUES ('14', 'APRIL 77', null, null, null, null);
INSERT INTO `brand` VALUES ('15', 'VALENTINO', null, null, null, null);
INSERT INTO `brand` VALUES ('16', 'ANN DEMEULEMEESTER', null, null, null, null);
INSERT INTO `brand` VALUES ('17', 'JUST CAVALLI', null, null, null, null);
INSERT INTO `brand` VALUES ('18', 'DIESEL', null, null, null, null);
INSERT INTO `brand` VALUES ('19', 'EACH X OTHER', null, null, null, null);

-- ----------------------------
-- Table structure for `brand_descr`
-- ----------------------------
DROP TABLE IF EXISTS `brand_descr`;
CREATE TABLE `brand_descr` (
  `idBrand` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescrizione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idBrand`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand_descr
-- ----------------------------

-- ----------------------------
-- Table structure for `campaigns`
-- ----------------------------
DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `idCampaign` int(11) NOT NULL AUTO_INCREMENT,
  `txCampaign` varchar(45) DEFAULT NULL,
  `dtInizio` date DEFAULT NULL,
  `dtFine` date DEFAULT NULL,
  `pcSconto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCampaign`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaigns
-- ----------------------------
INSERT INTO `campaigns` VALUES ('1', 'SALDI A/I 2014', '2014-09-18', '2014-12-31', '70');

-- ----------------------------
-- Table structure for `color`
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `idColor` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txColor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idColor`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES ('1', 'en', 'ORANGE');
INSERT INTO `color` VALUES ('1', 'it', 'ARANCIONE');
INSERT INTO `color` VALUES ('2', 'en', 'SILVER');
INSERT INTO `color` VALUES ('2', 'it', 'ARGENTO');
INSERT INTO `color` VALUES ('3', 'en', 'BEIGE');
INSERT INTO `color` VALUES ('3', 'it', 'BEIGE');
INSERT INTO `color` VALUES ('4', 'en', 'WHITE');
INSERT INTO `color` VALUES ('4', 'it', 'BIANCO');
INSERT INTO `color` VALUES ('5', 'en', 'BLUE');
INSERT INTO `color` VALUES ('5', 'it', 'BLU');
INSERT INTO `color` VALUES ('6', 'en', 'LIGHT BLUE');
INSERT INTO `color` VALUES ('6', 'it', 'CELESTE');
INSERT INTO `color` VALUES ('7', 'en', 'DENIM');
INSERT INTO `color` VALUES ('7', 'it', 'DENIM');
INSERT INTO `color` VALUES ('8', 'en', 'YELLOW');
INSERT INTO `color` VALUES ('8', 'it', 'GIALLO');
INSERT INTO `color` VALUES ('9', 'en', 'GREY');
INSERT INTO `color` VALUES ('9', 'it', 'GRIGIO');
INSERT INTO `color` VALUES ('10', 'en', 'BROWN');
INSERT INTO `color` VALUES ('10', 'it', 'MARRONE');
INSERT INTO `color` VALUES ('11', 'en', 'BLACK');
INSERT INTO `color` VALUES ('11', 'it', 'NERO');
INSERT INTO `color` VALUES ('12', 'en', 'GOLD');
INSERT INTO `color` VALUES ('12', 'it', 'ORO');
INSERT INTO `color` VALUES ('13', 'en', 'ROSE');
INSERT INTO `color` VALUES ('13', 'it', 'ROSA');
INSERT INTO `color` VALUES ('14', 'en', 'RED');
INSERT INTO `color` VALUES ('14', 'it', 'ROSSO');
INSERT INTO `color` VALUES ('15', 'en', 'GREEN');
INSERT INTO `color` VALUES ('15', 'it', 'VERDE');
INSERT INTO `color` VALUES ('16', 'en', 'PURPLE');
INSERT INTO `color` VALUES ('16', 'it', 'VIOLA');
INSERT INTO `color` VALUES ('17', 'en', 'LEOPARD');
INSERT INTO `color` VALUES ('17', 'it', 'LEOPARD');

-- ----------------------------
-- Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `idConfiguration` varchar(50) NOT NULL,
  `txConfiguration` varchar(100) DEFAULT NULL,
  `nrConfiguration` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConfiguration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configuration
-- ----------------------------
INSERT INTO `configuration` VALUES ('1', 'Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo', '1');

-- ----------------------------
-- Table structure for `coupons`
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
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

-- ----------------------------
-- Records of coupons
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
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

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com', 'benito79', 'JACOPO', 'FREDIANI', null, '2');
INSERT INTO `customer` VALUES ('msmcnc@gmail.com', 'stocazzo', 'Massimiliano', 'Cencioni', null, '2');
INSERT INTO `customer` VALUES ('shop@degortes.net', 'shop@deg', 'A', 'A', 'A', '1');
INSERT INTO `customer` VALUES ('simone.bagnolesi@gmail.com', 'didone1976', 'simone', 'bagnolesi', null, '2');

-- ----------------------------
-- Table structure for `customer_roles`
-- ----------------------------
DROP TABLE IF EXISTS `customer_roles`;
CREATE TABLE `customer_roles` (
  `idUser` varchar(100) NOT NULL,
  `txRole` varchar(20) NOT NULL,
  PRIMARY KEY (`idUser`,`txRole`),
  KEY `fk_CustomerRoles_Customer1_idx` (`idUser`),
  CONSTRAINT `fk_CustomerRoles_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_roles
-- ----------------------------
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('msmcnc@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('shop@degortes.net', 'AMMINISTRATORE');
INSERT INTO `customer_roles` VALUES ('simone.bagnolesi@gmail.com', 'CUSTOMER');

-- ----------------------------
-- Table structure for `delivery_cost`
-- ----------------------------
DROP TABLE IF EXISTS `delivery_cost`;
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

-- ----------------------------
-- Records of delivery_cost
-- ----------------------------
INSERT INTO `delivery_cost` VALUES ('1', 'SPEDIZIONE GRATUITA', '0.00', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('2', 'GLS Zefiro via aerea', '9.74', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('3', 'GLS Zefiro via aerea', '20.04', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('4', 'GLS Zefiro via aerea', '17.19', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('5', 'GLS Zefiro via aerea', '17.43', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('6', 'GLS Zefiro via aerea', '19.56', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('7', 'GLS Zefiro via aerea', '34.15', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('8', 'GLS Zefiro via aerea', '48.94', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('9', 'GLS Zefiro via aerea', '49.46', '0', 'GLS Zefiro via aerea', null);
INSERT INTO `delivery_cost` VALUES ('10', 'GLS Parcel camionistico', '13.80', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('11', 'GLS Parcel camionistico', '14.05', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('12', 'GLS Parcel camionistico', '15.70', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('13', 'GLS Parcel camionistico', '16.76', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('14', 'GLS Parcel camionistico', '17.25', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('15', 'GLS Parcel camionistico', '18.97', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('16', 'GLS Parcel camionistico', '19.35', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('17', 'GLS Parcel camionistico', '20.45', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('18', 'GLS Parcel camionistico', '21.48', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('19', 'GLS Parcel camionistico', '23.66', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('20', 'GLS Parcel camionistico', '25.88', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('21', 'GLS Parcel camionistico', '27.46', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('22', 'GLS Parcel camionistico', '28.34', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('23', 'GLS Parcel camionistico', '28.59', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('24', 'GLS Parcel camionistico', '30.68', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('25', 'GLS Parcel camionistico', '31.45', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('26', 'GLS Parcel camionistico', '36.73', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('27', 'GLS Parcel camionistico', '40.91', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('28', 'GLS Parcel camionistico', '41.35', '0', 'GLS Parcel camionistico', null);
INSERT INTO `delivery_cost` VALUES ('29', 'GLS Parcel camionistico', '45.30', '0', 'GLS Parcel camionistico', null);

-- ----------------------------
-- Table structure for `delivery_nazioni`
-- ----------------------------
DROP TABLE IF EXISTS `delivery_nazioni`;
CREATE TABLE `delivery_nazioni` (
  `idDeliveryCost` int(11) NOT NULL,
  `idNazione` varchar(100) NOT NULL,
  `idAddress` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDeliveryCost`,`idNazione`),
  KEY `fk_delivery_nazioni_delivery_cost1` (`idDeliveryCost`),
  KEY `fk_delivery_nazioni_nazioni1` (`idNazione`),
  CONSTRAINT `fk_delivery_nazioni_delivery_cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_nazioni_nazioni1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`idNazione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery_nazioni
-- ----------------------------
INSERT INTO `delivery_nazioni` VALUES ('1', 'ITALIA', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Austria', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Belgium', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Denmark', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Finland', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'France', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Germany', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Greece', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Ireland', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Luxembourg', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Monaco', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Netherlands', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Portugal', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Spain', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'Sweden', null);
INSERT INTO `delivery_nazioni` VALUES ('2', 'United Kingdom', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Bulgaria', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Croatia', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Cyprus', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Czech Republic', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Estonia', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Hungary', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Latvia', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Lithuania', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Malta', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Poland', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Romania', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Slovakia', null);
INSERT INTO `delivery_nazioni` VALUES ('3', 'Slovenia', null);
INSERT INTO `delivery_nazioni` VALUES ('4', 'Andorra', null);
INSERT INTO `delivery_nazioni` VALUES ('4', 'Gibraltar', null);
INSERT INTO `delivery_nazioni` VALUES ('4', 'Switzerland', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Canary Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Faroe Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Guernsey', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Iceland', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Jersey', null);
INSERT INTO `delivery_nazioni` VALUES ('5', 'Norway', null);
INSERT INTO `delivery_nazioni` VALUES ('6', 'Canada', null);
INSERT INTO `delivery_nazioni` VALUES ('6', 'United States', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'American Samoa', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Anguilla', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Antigua and Barbuda', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Argentina', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Aruba', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Australia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bahamas', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bahrain', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bangladesh', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Barbados', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Belize', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bermuda', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bolivia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Bonaire', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Brazil', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Brunei Darussalam', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Cameroon', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Cayman Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Chile', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Colombia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Costa Rica', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Curacao', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Dominica', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Dominican Republic', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Ecuador', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Egypt', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'El Salvador', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Equatorial Guinea', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Fiji', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'French Guiana', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Greenland', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Grenada', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Guadeloupe', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Guam', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Guatemala', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Guyana', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Haiti', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Honduras', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Hong Kong', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'India', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Indonesia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Ivory Coast', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Jamaica', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Japan', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Kenya', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Kuwait', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Macao', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Malaysia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Maldives', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Martinique', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Mexico', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Micronesia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Montserrat', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Nevis', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'New Caledonia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'New Zealand', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Nigeria', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Oman', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Pakistan', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Palau', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Panama', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Paraguay', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Peru', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Philippines', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Puerto Rico', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Qatar', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Barthelemy', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Eustatius', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Kitts and Nevis', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Lucia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Maarten', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saint Vincent e Grenadine', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Samoa', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Saudi Arabia', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Senegal', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Singapore', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'South Africa', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'South Korea', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Sri Lanka', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Suriname', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Tahiti', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Taiwan', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Thailand', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Trinidad and Tobago', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Turkey', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'United Arab Emirates', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Uruguay', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Venezuela', null);
INSERT INTO `delivery_nazioni` VALUES ('7', 'Virgin Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Algeria', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Benin', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Bhutan', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Botswana', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Burkina Faso', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Burundi', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Cambodia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Cape Verde', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Center Africa', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Chad', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'China', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Comoros', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Congo', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Cook Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Djibouti', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'East Timor', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Eritrea', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Ethiopia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Gabon', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Gambia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Ghana', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Guinea', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Guinea-Bissau', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Iraq', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Israel', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Jordan', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Lao', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Lebanon', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Lesotho', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Liberia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Libya', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Madagascar', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Malawi', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Mali', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Marshall Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Mauritania', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Mauritius', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Mayotte', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Morocco', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Namibia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Nauru', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Nepal', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Nicaragua', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Niger', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Papua New Guinea', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Reunion Island', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Rwanda', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Saipan', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Seychelles', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Sierra Leone', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Somalia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Swaziland', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Syria', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Tanzania', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Togo', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Tonga', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Tunisia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Turks and Caicos Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Tuvalu', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Uganda', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Vanuatu', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Vietnam', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Yemen', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Zambia', null);
INSERT INTO `delivery_nazioni` VALUES ('8', 'Zimbabwe', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Afghanistan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Albania', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Angola', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Armenia', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Azerbaijan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Belarus', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Bosnia and Herzegovina', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Cuba', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Falkland Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Georgia', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Iran', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Kazakhstan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Kiribati', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Kosovo', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Kyrgyzstan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Macedonia', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Moldova', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Mongolia', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Montenegro', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Mozambique', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Myanmar, Burma', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Niue', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'North Korea', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Russian Federation', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Serbia', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Solomon Islands', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'South Sudan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Sudan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Tajikistan', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Ukraine', null);
INSERT INTO `delivery_nazioni` VALUES ('9', 'Uzbekistan', null);
INSERT INTO `delivery_nazioni` VALUES ('10', 'Austria', null);
INSERT INTO `delivery_nazioni` VALUES ('11', 'Belgium', null);
INSERT INTO `delivery_nazioni` VALUES ('12', 'France', null);
INSERT INTO `delivery_nazioni` VALUES ('12', 'Germany', null);
INSERT INTO `delivery_nazioni` VALUES ('12', 'Luxembourg', null);
INSERT INTO `delivery_nazioni` VALUES ('12', 'Netherlands', null);
INSERT INTO `delivery_nazioni` VALUES ('13', 'Liechtenstein', null);
INSERT INTO `delivery_nazioni` VALUES ('14', 'Switzerland', null);
INSERT INTO `delivery_nazioni` VALUES ('15', 'Denmark', null);
INSERT INTO `delivery_nazioni` VALUES ('15', 'Slovenia', null);
INSERT INTO `delivery_nazioni` VALUES ('16', 'England', null);
INSERT INTO `delivery_nazioni` VALUES ('16', 'Galles', null);
INSERT INTO `delivery_nazioni` VALUES ('16', 'Scotland', null);
INSERT INTO `delivery_nazioni` VALUES ('17', 'Hungary', null);
INSERT INTO `delivery_nazioni` VALUES ('18', 'Croatia', null);
INSERT INTO `delivery_nazioni` VALUES ('18', 'Serbia', null);
INSERT INTO `delivery_nazioni` VALUES ('19', 'Poland', null);
INSERT INTO `delivery_nazioni` VALUES ('20', 'Czech Republic', null);
INSERT INTO `delivery_nazioni` VALUES ('20', 'Spain', null);
INSERT INTO `delivery_nazioni` VALUES ('21', 'Sweden', null);
INSERT INTO `delivery_nazioni` VALUES ('22', 'Slovakia', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Bulgaria', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Estonia', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Latvia', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Lithuania', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Norway', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Portugal', null);
INSERT INTO `delivery_nazioni` VALUES ('23', 'Romania', null);
INSERT INTO `delivery_nazioni` VALUES ('24', 'Ireland', null);
INSERT INTO `delivery_nazioni` VALUES ('25', 'Finland', null);
INSERT INTO `delivery_nazioni` VALUES ('26', 'Turkey', null);
INSERT INTO `delivery_nazioni` VALUES ('27', 'Greece', null);
INSERT INTO `delivery_nazioni` VALUES ('28', 'Nord Ireland', null);
INSERT INTO `delivery_nazioni` VALUES ('29', 'Cyprus', null);
INSERT INTO `delivery_nazioni` VALUES ('29', 'Malta', null);

-- ----------------------------
-- Table structure for `fidelity_customer`
-- ----------------------------
DROP TABLE IF EXISTS `fidelity_customer`;
CREATE TABLE `fidelity_customer` (
  `idUser` varchar(100) NOT NULL,
  `idFidelity` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`,`idFidelity`),
  KEY `fk_fidelity_customer_FidelityCards1_idx` (`idFidelity`),
  CONSTRAINT `fk_fidelity_customer_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fidelity_customer_customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fidelity_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `fidelitycards`
-- ----------------------------
DROP TABLE IF EXISTS `fidelitycards`;
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

-- ----------------------------
-- Records of fidelitycards
-- ----------------------------

-- ----------------------------
-- Table structure for `gender`
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender` (
  `idGender` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txGender` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idGender`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gender
-- ----------------------------
INSERT INTO `gender` VALUES ('1', 'en', 'Man');
INSERT INTO `gender` VALUES ('1', 'it', 'Uomo');
INSERT INTO `gender` VALUES ('2', 'en', 'Woman');
INSERT INTO `gender` VALUES ('2', 'it', 'Donna');
INSERT INTO `gender` VALUES ('3', 'en', 'Boy');
INSERT INTO `gender` VALUES ('3', 'it', 'Bambino');
INSERT INTO `gender` VALUES ('4', 'en', 'Girl');
INSERT INTO `gender` VALUES ('4', 'it', 'Bambina');
INSERT INTO `gender` VALUES ('5', 'en', 'Unisex');
INSERT INTO `gender` VALUES ('5', 'it', 'Unisex');

-- ----------------------------
-- Table structure for `group_images`
-- ----------------------------
DROP TABLE IF EXISTS `group_images`;
CREATE TABLE `group_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `txLibrary` varchar(45) DEFAULT NULL,
  `nrImages` int(11) DEFAULT NULL,
  `maxHeight` int(11) DEFAULT NULL,
  `maxWidth` int(11) DEFAULT NULL,
  `fgGender` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_images
-- ----------------------------
INSERT INTO `group_images` VALUES ('carousel', 'images/home', '20', '761', '1140', '0');
INSERT INTO `group_images` VALUES ('new', 'images/home', '1', '130', '260', '0');
INSERT INTO `group_images` VALUES ('newArrivals', 'images/home', '6', '580', '580', '1');
INSERT INTO `group_images` VALUES ('promo', 'images/home', '1', '130', '260', '0');
INSERT INTO `group_images` VALUES ('tabNav', 'images/home', '6', '130', '260', '1');

-- ----------------------------
-- Table structure for `infaggiuntive`
-- ----------------------------
DROP TABLE IF EXISTS `infaggiuntive`;
CREATE TABLE `infaggiuntive` (
  `idInformazione` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txInformazione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idInformazione`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infaggiuntive
-- ----------------------------

-- ----------------------------
-- Table structure for `ipnmessages`
-- ----------------------------
DROP TABLE IF EXISTS `ipnmessages`;
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

-- ----------------------------
-- Records of ipnmessages
-- ----------------------------
INSERT INTO `ipnmessages` VALUES ('9', '02W82919MC708331G', '2015-02-18 11:46:42', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=cfec0af8896db;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=02W82919MC708331G;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-7PG063803Y110270U;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-18T10:55:30Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-18T10:55:32Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('10', '0B771925NL591810E', '2015-02-18 12:33:44', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=9214054694220;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=0B771925NL591810E;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-39A92510KD102942F;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-18T11:42:32Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-18T11:42:33Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('14', '46M74955YW646283B', '2015-02-19 11:10:47', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=fee01496366ce;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=46M74955YW646283B;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-0D0253351B769172V;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-19T10:19:37Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-19T10:19:38Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('5', '4WD612019W906053C', '2015-01-20 11:36:32', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=YZZM9YT9773JW;PAYMENTINFO_0_FEEAMT=0.49;PAYMENTINFO_0_TRANSACTIONTYPE=cart;CORRELATIONID=ea7deff0428fb;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=4WD612019W906053C;VERSION=112.0;PAYMENTINFO_0_PAYMENTTYPE=instant;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-5NY78471SU856421L;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-20T10:36:32Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_AMT=4.00;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-20T10:36:32Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('7', '5PE72688RR712613J', '2015-02-17 15:25:40', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=9645d394e4fe5;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5PE72688RR712613J;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-53H433995F6153834;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-17T14:34:28Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-17T14:34:29Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('11', '8ED2199727653332Y', '2015-02-18 13:16:14', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=c7d1057393bfd;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8ED2199727653332Y;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-0K246475248463646;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-18T12:25:02Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-18T12:25:04Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('13', '98Y31118H8962731J', '2015-02-18 15:12:22', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=ff31dfb39f46;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=98Y31118H8962731J;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-5P743236D08742721;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-18T14:21:10Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-18T14:21:11Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('12', '9BF289548N5126218', '2015-02-18 13:26:00', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=LVJS3WJDHT5CG;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=a5c6f1f596c54;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=9BF289548N5126218;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-6NG536746M142410U;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-18T12:34:48Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-18T12:34:49Z;', 'Completed', null, '0', null);

-- ----------------------------
-- Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `idMail` int(11) NOT NULL AUTO_INCREMENT,
  `idMailGroup` int(11) DEFAULT NULL,
  `txUser` varchar(100) DEFAULT NULL,
  `txNome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMail`)
) ENGINE=InnoDB AUTO_INCREMENT=6546 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES ('8', '3', 'annamariad@tin.it', 'DEL PRETE ANNAMARIA');
INSERT INTO `mail` VALUES ('9', '3', 'lallabiss@gmail.com', 'MURANA LAURA');
INSERT INTO `mail` VALUES ('10', '3', 'annalisa_vuono@yahoo.it', 'VUONO ANNALISA');
INSERT INTO `mail` VALUES ('11', '3', 'sguimo@libero.it', 'BIANCIARDI SIMONA');
INSERT INTO `mail` VALUES ('12', '3', 'fran.borghi@gmail.com', 'BORGHI FRANCESCA');
INSERT INTO `mail` VALUES ('13', '3', 'petrelena@libero.it', 'PETRICCI ELENA');
INSERT INTO `mail` VALUES ('14', '3', 'gerifra@tiscali.it', 'GERI FRANCESCA');
INSERT INTO `mail` VALUES ('15', '3', 'jurillo@alice.it', 'BOCHICCHIO JURI');
INSERT INTO `mail` VALUES ('16', '3', 'cucca.86@hotmail.it', 'ANTONELLI LUCA');
INSERT INTO `mail` VALUES ('17', '3', 'gino.montemurro@gmail.com', 'MONTEMURRO GINO');
INSERT INTO `mail` VALUES ('18', '3', 'rosanna.esposito91@gmail.com', 'ESPOSITO ROSANNA');
INSERT INTO `mail` VALUES ('19', '3', 'madlen.f@virgilio.it', 'FINESSI MADDALENA');
INSERT INTO `mail` VALUES ('20', '3', 'cucciola.claudina92@hotmail.it', 'BONARI CLAUDIA');
INSERT INTO `mail` VALUES ('21', '3', 'liliana.spano@gmail.com', 'SPANO LILIANA');
INSERT INTO `mail` VALUES ('22', '3', 'amalya_popa09@yahoo.it', 'POPA AMALIA MARIA');
INSERT INTO `mail` VALUES ('23', '3', 'lucrezia@ilagunariluce.it', 'FOSCARINI LUCREZIA');
INSERT INTO `mail` VALUES ('24', '3', 'carla.bertani@libero.it', 'BERTANI CARLA');
INSERT INTO `mail` VALUES ('25', '3', 'technology@gruppoinveco.it', 'GIRELLI ANDREA');
INSERT INTO `mail` VALUES ('26', '3', 'tuttofibra@libero.it', 'CORSI EMANUELA');
INSERT INTO `mail` VALUES ('27', '3', 'pierellasperanza@libero.it', 'SPERANZA MARIA PIA');
INSERT INTO `mail` VALUES ('28', '3', 'letizia.guerri@banca.mps.it', 'GUERRI LETIZIA');
INSERT INTO `mail` VALUES ('29', '3', 'martinaminacci@virgilio.it', 'MINACCI MARTINA');
INSERT INTO `mail` VALUES ('30', '3', 'mariadeblas@virgilio.it', 'BOLGI MARIA TERESA');
INSERT INTO `mail` VALUES ('31', '3', 'eleonora.mele@libero.it', 'MELE ELEONORA');
INSERT INTO `mail` VALUES ('32', '3', 'anty.dec@libero.it', 'DE CAROLIS ANTONIETTA');
INSERT INTO `mail` VALUES ('33', '3', 'pinacolacicco@yahoo.it', 'COLACICCO PINA');
INSERT INTO `mail` VALUES ('34', '3', 'decarolisilvia@yahoo.it', 'DE CAROLIS SILVIA');
INSERT INTO `mail` VALUES ('35', '3', 'annadg08@yahoo.com', 'DI GIULIANO ANNA');
INSERT INTO `mail` VALUES ('36', '3', 'maureenfloresv@gmail.com', 'FLORES MAUREEN');
INSERT INTO `mail` VALUES ('37', '3', 'elipagni66@libero.it', 'PAGNI ELISABETTA');
INSERT INTO `mail` VALUES ('38', '3', 'chiarettapacifico@gmail.com', 'PACIFICO CHIARA');
INSERT INTO `mail` VALUES ('39', '3', 'fzinanni@alice.it', 'ZINANNI FILIPPO');
INSERT INTO `mail` VALUES ('40', '3', 'lalla.lella@hotmail.it', 'SALVINI MARCO');
INSERT INTO `mail` VALUES ('41', '3', 'mondoverdesiena@libero.it', 'GHEZZI MARIAROSA');
INSERT INTO `mail` VALUES ('42', '3', '3388183465@tim.it', 'CAMPI TIZIANA');
INSERT INTO `mail` VALUES ('43', '3', 'annaritaferranti@hotmail.com', 'FERRANTI ANNARITA');
INSERT INTO `mail` VALUES ('44', '3', 'costanza.gambelli@gmail.com', 'GAMBELLI COSTANZA');
INSERT INTO `mail` VALUES ('45', '3', 'mauro.spezia@tin.it', 'TOSELLI BARBARA');
INSERT INTO `mail` VALUES ('46', '3', 'albanosimona@gmail.com', 'ALBANO SIMONA');
INSERT INTO `mail` VALUES ('47', '3', 'adelevai@yahoo.it', 'VAGLIO ADELE');
INSERT INTO `mail` VALUES ('48', '3', 'tchatother@yahoo.fr', 'NGORO SERGE');
INSERT INTO `mail` VALUES ('49', '3', 'jacopomicheletti@interfree.it', 'MICHELETTI JACOPO');
INSERT INTO `mail` VALUES ('50', '3', 'lejdiboss@hotmail.it', 'RUSTANI LEJDI');
INSERT INTO `mail` VALUES ('51', '3', 'gabriele82@yahoo.it', 'FUSO GABRIELE');
INSERT INTO `mail` VALUES ('52', '3', 'alessandra.berti@hotmail.it', 'BERTI ALESSANDRA');
INSERT INTO `mail` VALUES ('53', '3', 'b_lopraino@libero.it', 'LOPRAINO BRUNA');
INSERT INTO `mail` VALUES ('54', '3', 'lauratulip@libero.it', 'TULIPANO LAURA');
INSERT INTO `mail` VALUES ('55', '3', 'ale709@hotmail.it', 'PATELLARO ANDREA');
INSERT INTO `mail` VALUES ('56', '3', 't3a@hotmail.it', 'GUERRI TEA');
INSERT INTO `mail` VALUES ('57', '3', 'caterinasette@yahoo.it', 'SALVETTI CATERINA');
INSERT INTO `mail` VALUES ('58', '3', 'licaridavid@hotmail.com', 'LICARI DAVID');
INSERT INTO `mail` VALUES ('59', '3', 'evalder3@inwind.it', 'CECCARINI EVALDO');
INSERT INTO `mail` VALUES ('60', '3', 'raffaeleconca@hotmail.it', 'CONCA RAFFAELE');
INSERT INTO `mail` VALUES ('61', '3', 'vgalli@teletu.it', 'GALLI VANNA');
INSERT INTO `mail` VALUES ('62', '3', 'ba68@hotmail.it', 'PIPERNO BARBARA');
INSERT INTO `mail` VALUES ('63', '3', 'mabravi@ymail.com', 'BRAVI MARTA');
INSERT INTO `mail` VALUES ('64', '3', 'giorgiadipaola@hotmail.com', 'DI PAOLA GIORGIA');
INSERT INTO `mail` VALUES ('65', '3', 'paternoster.piero@alice.it', 'PATERNOSTER PIERO');
INSERT INTO `mail` VALUES ('66', '3', 'agabar@alice.it', 'SESTINI ALESSANDRA');
INSERT INTO `mail` VALUES ('67', '3', 'camisaska@gmail.com', 'CAMISA FRANCESCO');
INSERT INTO `mail` VALUES ('68', '3', 'calise.piro@hotmail.it', 'CALISEPIRO PAOLA');
INSERT INTO `mail` VALUES ('69', '3', 'sandradelsanto@gmail.com', 'DEL SANTO SANDRA');
INSERT INTO `mail` VALUES ('70', '3', 'manila@farida.it', 'DALBELLO MANILA');
INSERT INTO `mail` VALUES ('71', '3', 'mguerri1985@hotmail.it', 'GUERRI MARCO');
INSERT INTO `mail` VALUES ('72', '3', 'marco.delorenzi@yahoo.it', 'DE LORENZI MARCO');
INSERT INTO `mail` VALUES ('73', '3', 'duniaruffini@libero.it', 'RUFFINI DUNIA');
INSERT INTO `mail` VALUES ('74', '3', 'buonasera86@msn.com', 'CASTRIA DOMENICO');
INSERT INTO `mail` VALUES ('75', '3', 'mariatrap@virgilio.it', 'TRAPANESE MARIA');
INSERT INTO `mail` VALUES ('76', '3', 'pappalardomartina@libero.it', 'PAPPALARDO MARTINA');
INSERT INTO `mail` VALUES ('77', '3', 'ilariacosentino1990@hotmail.it', 'COSENTINO ILARIA');
INSERT INTO `mail` VALUES ('78', '3', 'chiara.santucci@banca.mps.it', 'SANTUCCI CHIARA');
INSERT INTO `mail` VALUES ('79', '3', 'claudiamet@libero.it', 'METZLER CLAUDIA PATRIZIA');
INSERT INTO `mail` VALUES ('80', '3', 'patrica@yahoo.it', 'VICARI PATRIZIA');
INSERT INTO `mail` VALUES ('81', '3', 'granchim@libero.it', 'GRANCHI MONICA');
INSERT INTO `mail` VALUES ('82', '3', 'eleonorapacchierotti@gmail.com', 'PACCHIEROTTI ELEONORA');
INSERT INTO `mail` VALUES ('83', '3', 'carmelatoscano@hotmail.it', 'TOSCANO CARMELA');
INSERT INTO `mail` VALUES ('84', '3', 'lucia.becatti@libero.it', 'BECATTI LUCIA');
INSERT INTO `mail` VALUES ('85', '3', 'moniamachetti@alice.it', 'MACHETTI MONIA');
INSERT INTO `mail` VALUES ('86', '3', 'white_flower_89@hotmail.it', 'CUCINELLA DORA MARIAGRAZIA');
INSERT INTO `mail` VALUES ('87', '3', 'dania.baroni@gmail.com', 'BARONI DANIA');
INSERT INTO `mail` VALUES ('88', '3', 'daniele.peccianti@libero.it', 'PECCIANTI DANIELE');
INSERT INTO `mail` VALUES ('89', '3', 'roserc@libero.it', 'ERCOLI ROSALBA');
INSERT INTO `mail` VALUES ('90', '3', 'paolapeloso@libero.it', 'PELOSO PAOLA');
INSERT INTO `mail` VALUES ('91', '3', 'giuliana.peloso@alice.it', 'PELOSO GIULIANA');
INSERT INTO `mail` VALUES ('92', '3', 'mtnobe@gmail.com', 'NOBERASCO MARIA TERESA');
INSERT INTO `mail` VALUES ('93', '3', 'tiziana.doldo@unisi.it', 'DOLDO TIZIANA');
INSERT INTO `mail` VALUES ('94', '3', 'conticelliabc@libero.it', 'CONTICELLI ANDREA');
INSERT INTO `mail` VALUES ('95', '3', 'silviagattola@libero.it', 'GATTOLA SILVIA');
INSERT INTO `mail` VALUES ('96', '3', 'simo.marsini@gmail.com', 'MARSINI SIMONETTA');
INSERT INTO `mail` VALUES ('97', '3', 'angelarossetti3@gmail.com', 'ROSSETTI ANGELA');
INSERT INTO `mail` VALUES ('98', '3', 'mariaelenaquadarti@yahoo.it', 'QUADARTI MARIA ELENA');
INSERT INTO `mail` VALUES ('99', '3', 'silvia.pelagalli@libero.it', 'PELAGALLI SILVIA');
INSERT INTO `mail` VALUES ('100', '3', 'lombardi.rosanna@libero.it', 'LOMBARDI ROSANNA');
INSERT INTO `mail` VALUES ('101', '3', 'loregando@gmail.com', 'GANDOLFI LORENZO');
INSERT INTO `mail` VALUES ('102', '3', 'tatiana.imperio@gmail.com', 'IMPERIO TATIANA');
INSERT INTO `mail` VALUES ('103', '3', 'marina03@hotmail.it', 'DI CAPO EVA');
INSERT INTO `mail` VALUES ('104', '3', 'fasestini@hotmail.it', 'SESTINI FAUSTA');
INSERT INTO `mail` VALUES ('105', '3', 'sandrofornaciari@hotmail.it', 'FORNACIARI ALESSANDRO');
INSERT INTO `mail` VALUES ('106', '3', 'giulia.mascagni85@gmail.com', 'MASCAGNI GIULIA');
INSERT INTO `mail` VALUES ('107', '3', 'giannialpini@chiantibanca.it', 'ALPINI GIANNI');
INSERT INTO `mail` VALUES ('108', '3', 'ritamascagni@libero.it', 'MASCAGNI RITA');
INSERT INTO `mail` VALUES ('109', '3', 'cortigiani@provincia.siena.it', 'CORTIGIANI STEFANIA');
INSERT INTO `mail` VALUES ('110', '3', 'francescafrosinini@yahoo.it', 'FROSININI FRANCESCA');
INSERT INTO `mail` VALUES ('111', '3', 'miaocinzi@yahoo.it', 'PASSIU CINZIA');
INSERT INTO `mail` VALUES ('112', '3', 'gabriellalazzari@yahoo.it', 'BICHI SAMUELE');
INSERT INTO `mail` VALUES ('113', '3', 'cy.nastro@topmail.co.uk', 'NASTRO CINZIA');
INSERT INTO `mail` VALUES ('114', '3', 'claudia.cannoni@tin.it', 'CANNONI CLAUDIA');
INSERT INTO `mail` VALUES ('115', '3', 'millipulito@hotmail.it', 'PULITO MILENA');
INSERT INTO `mail` VALUES ('116', '3', 'fioreraco@libero.it', 'RACO FIORENTINO');
INSERT INTO `mail` VALUES ('117', '3', 'mariateresafasanaro@yahoo.it', 'FASANARO MARIA TERESA');
INSERT INTO `mail` VALUES ('118', '3', 'calmanti123@gmail.com', 'CALMANTI GIACOMO');
INSERT INTO `mail` VALUES ('119', '3', 'vittoriaval@alice.it', 'VALLETTA VITTORIA');
INSERT INTO `mail` VALUES ('120', '3', 'r.cristian296@virgilio.it', 'RAVAGNI CRISTIAN');
INSERT INTO `mail` VALUES ('121', '3', 'mariablasi@tiscali.it', 'BLASI MARIA');
INSERT INTO `mail` VALUES ('122', '3', 'studiolegale.raho@tiscali.it', 'RAHO ANTONELLA');
INSERT INTO `mail` VALUES ('123', '3', 'p.gallo2010@gmail.com', 'GALLERINI PAOLO');
INSERT INTO `mail` VALUES ('124', '3', 'o.svet.delta@alice.it', 'SVET OLGA');
INSERT INTO `mail` VALUES ('125', '3', 'susannavaleriani@virgilio.it', 'VALERIANI SUSANNA');
INSERT INTO `mail` VALUES ('126', '3', 'rina15@list.ru', 'TOLMACHOVA IRYNA');
INSERT INTO `mail` VALUES ('127', '3', 'fredz_3@msn.com', 'PARRELLA FEDERICO');
INSERT INTO `mail` VALUES ('128', '3', 'secchitarugi@alice.it', 'SECCHITARUGI LUCIA');
INSERT INTO `mail` VALUES ('129', '3', 'alessiamarino93@gmail.com', 'MARINO ALESSIA FRANCESCA');
INSERT INTO `mail` VALUES ('130', '3', 'm.cristinapagnanelli@libero.it', 'PAGNANELLI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('131', '3', 'annita.oggero70@gmail.com', 'OGGERO ANNITA');
INSERT INTO `mail` VALUES ('132', '3', 'giacomobraccagni@live.it', 'BRACCAGNI GIACOMO');
INSERT INTO `mail` VALUES ('133', '3', 'peppinomalandrino@libero.it', 'MAIONE GIUSEPPE');
INSERT INTO `mail` VALUES ('134', '3', 'a.meniconi@libero.it', 'MENICONI ANDREA');
INSERT INTO `mail` VALUES ('135', '3', 'franci.pellegrini79@gmail.com', 'PELLEGRINI FRANCESCA');
INSERT INTO `mail` VALUES ('136', '3', 'chiaraleonini@gmail.com', 'LEONINI CHIARA');
INSERT INTO `mail` VALUES ('137', '3', 'ginevrag@virgilio.it', 'GHELARDI GINEVRA');
INSERT INTO `mail` VALUES ('138', '3', 'ross69.ra@gmail.com', 'ANNUNZIATA SARDONE ROSANGELA');
INSERT INTO `mail` VALUES ('139', '3', 'papipatti@libero.it', 'PAPI PATRIZIA');
INSERT INTO `mail` VALUES ('140', '3', 'fuffa52@yahoo.it', 'MATTEUCCI FULVIA');
INSERT INTO `mail` VALUES ('141', '3', 'anna.guida@email.it', 'GUIDA ANNA');
INSERT INTO `mail` VALUES ('142', '3', 'enza.pipitone@libero.it', 'PIPITONE ENZA');
INSERT INTO `mail` VALUES ('143', '3', 'magicabula.siena@libero.it', 'BERRETTINI CATERINA');
INSERT INTO `mail` VALUES ('144', '3', 'irene.ghini@banca.mps.it', 'GHINI IRENE');
INSERT INTO `mail` VALUES ('145', '3', 'siedoys@virgilio.it', 'SPATARU DOINA');
INSERT INTO `mail` VALUES ('146', '3', 'antonellapicchianti@libero.it', 'PICCHIANTI ANTONELLA');
INSERT INTO `mail` VALUES ('147', '3', 'silvia@condominisiena.it', 'FILIPPONE SILVIA');
INSERT INTO `mail` VALUES ('148', '3', 'cristinacerpi@alice.it', 'CERPI CRISTINA');
INSERT INTO `mail` VALUES ('149', '3', 'rossanalofaso@libero.it', 'LO FASO ROSSANA');
INSERT INTO `mail` VALUES ('150', '3', 'valentinacappuzzo@yahoo.it', 'CAPPUZZO VALENTINA');
INSERT INTO `mail` VALUES ('151', '3', 'f.tarantino@live.it', 'TARANTINO FRANCESCA');
INSERT INTO `mail` VALUES ('152', '3', 'raffaellaromeo2@virgilio.it', 'ROMEO MARIA RAFFAELLA');
INSERT INTO `mail` VALUES ('153', '3', 'roznovatmihaela@hotmail.it', 'ROZNOVAT MIHAELA ANGELICA');
INSERT INTO `mail` VALUES ('154', '3', 'serena.direnzo@comune.siena.it', 'DI RENZO SERENA');
INSERT INTO `mail` VALUES ('155', '3', 'daniosti70@libero.it', 'SEMPLICI SAMANTA');
INSERT INTO `mail` VALUES ('156', '3', 'defrancesco.daniela@libero.it', 'DE FRANCESCO DANIELA');
INSERT INTO `mail` VALUES ('157', '3', 'neri.costanza@gmail.com', 'NERI COSTANZA');
INSERT INTO `mail` VALUES ('158', '3', '77.alessandramilano@gmail.com', 'MILANO ALESSANDRA');
INSERT INTO `mail` VALUES ('159', '3', 'veronicabonifazi@gmail.com', 'BONIFAZI VERONICA');
INSERT INTO `mail` VALUES ('160', '3', 'isemplici74@gmail.com', 'SEMPLICI ILARIA');
INSERT INTO `mail` VALUES ('161', '3', 's.simo40@hotmail.it', 'QUERCI SIMONA');
INSERT INTO `mail` VALUES ('162', '3', 'mic.lb@aruba.it', 'POMPEI GIOVANNA ARIANNA');
INSERT INTO `mail` VALUES ('163', '3', 'lucysegura75@hotmail.it', 'SEGURA LUZ');
INSERT INTO `mail` VALUES ('164', '3', 'zen10@tiscali.it', 'FUCCI FRANCO');
INSERT INTO `mail` VALUES ('165', '3', 'loberto.debora@gmail.com', 'LOBERTO DEBORA');
INSERT INTO `mail` VALUES ('166', '3', 'faclavi@alice.it', 'SCARAMUZZINO CLAUDIA');
INSERT INTO `mail` VALUES ('167', '3', 'elife74@gmail.com', 'FERRO ELISA');
INSERT INTO `mail` VALUES ('168', '3', 's.provenza13@gmail.com', 'PROVENZA STEFANIA');
INSERT INTO `mail` VALUES ('169', '3', 'ghigoegiulia@yahoo.it', 'LUPPOLI GIULIA');
INSERT INTO `mail` VALUES ('170', '3', 'stefibisogno@gmail.com', 'BISOGNO STEFANIA');
INSERT INTO `mail` VALUES ('171', '3', 'paolalamanna2000@gmail.com', 'LAMANNA PAOLA');
INSERT INTO `mail` VALUES ('172', '3', 'silviafgcosta@gmail.com', 'COSTA SILVIA');
INSERT INTO `mail` VALUES ('173', '3', 'federica_fantozzi@yahoo.it', 'FANTOZZI FEDERICA');
INSERT INTO `mail` VALUES ('174', '3', 'goreli@libero.it', 'GORELLI ELISA');
INSERT INTO `mail` VALUES ('175', '3', 'giannilelo@alice.it', 'LORENZINI ELEONORA');
INSERT INTO `mail` VALUES ('176', '3', 'alessandrafontani@gmail.com', 'FONTANI ALESSANDRA');
INSERT INTO `mail` VALUES ('177', '3', 'annalisataccioli@gmail.com', 'TACCIOLI ANNALISA');
INSERT INTO `mail` VALUES ('178', '3', 'antonio.marzi@banca.mps.it', 'MARZI ANTONIO');
INSERT INTO `mail` VALUES ('179', '3', 'alessandra.belardini@poliziadistato.it', 'BELARDINI ALESSANDRA');
INSERT INTO `mail` VALUES ('180', '3', 'ippolitac@tiscali.it', 'CALBI IPPOLITA');
INSERT INTO `mail` VALUES ('181', '3', 'monica.valacchi@istruzione.it', 'VALACCHI MONICA');
INSERT INTO `mail` VALUES ('182', '3', 'sara.debolini@yahoo.it', 'DEBOLINI SARA');
INSERT INTO `mail` VALUES ('183', '3', 'ducciobalestracci@hotmail.it', 'BALESTRACCI DUCCIO');
INSERT INTO `mail` VALUES ('184', '3', 'paganelli.valentina@alice.it', 'PARRI MARZIA');
INSERT INTO `mail` VALUES ('185', '3', 'anna.vanella@libero.it', 'VANELLA ANNA');
INSERT INTO `mail` VALUES ('186', '3', 'advonnolo@hotmail.it', 'DI VONNOLO ANNALISA');
INSERT INTO `mail` VALUES ('187', '3', 'danyans@virgilio.it', 'ANSELMI DANIELA');
INSERT INTO `mail` VALUES ('188', '3', 'rossella.lezzi@email.it', 'LEZZI ROSSELLA');
INSERT INTO `mail` VALUES ('189', '3', 'marialaurasabatini@virgilio.it', 'SABATINI MARIA LAURA');
INSERT INTO `mail` VALUES ('190', '3', 'marchetti@centroufficio.org', 'MARCHETTI MASSIMO');
INSERT INTO `mail` VALUES ('191', '3', 'clara.ietto@tiscali.it', 'IETTO CLARA');
INSERT INTO `mail` VALUES ('192', '3', 'fede_thebest.97@hotmail.it', 'MENICONI MONICA');
INSERT INTO `mail` VALUES ('193', '3', 'ital-pol@virgilio.it', 'ZDYB BEATA ANNA');
INSERT INTO `mail` VALUES ('194', '3', 'patrizia.salaris@hotmail.it', 'SALARIS PATRIZIA');
INSERT INTO `mail` VALUES ('195', '3', 'mariagrazia.alfisi@cbalex.com', 'ALFISI MARIA GRAZIA');
INSERT INTO `mail` VALUES ('196', '3', 'hiro31hiro10@hotmail.co.jp', 'SUZUKI HIROKO');
INSERT INTO `mail` VALUES ('197', '3', 'ncortigiani@yahoo.it', 'CORTIGIANI NICCOLO');
INSERT INTO `mail` VALUES ('198', '3', 'maxfer42@hotmail.com', 'FERRARA MASSIMILIANO');
INSERT INTO `mail` VALUES ('199', '3', 'trullatrulla@hotmail.com', 'MASTROCICCO COSTANZA');
INSERT INTO `mail` VALUES ('200', '3', 'valentinapecci@libero.it', 'PECCI VALENTINA');
INSERT INTO `mail` VALUES ('201', '3', 'marika-r@hotmail.it', 'RANIOLO MARIKA');
INSERT INTO `mail` VALUES ('202', '3', 'stefaniacrisafulli@hotmail.it', 'CRISAFULLI STEFANIA');
INSERT INTO `mail` VALUES ('203', '3', 'nib77@vodafone.it', 'VANNELLI SIMONE');
INSERT INTO `mail` VALUES ('204', '3', 'antonellatodaro59@gmail.com', 'TODARO ANTONELLA');
INSERT INTO `mail` VALUES ('205', '3', 'liberatibuccianti@gmail.com', 'LIBERATI GIOVANNI');
INSERT INTO `mail` VALUES ('206', '3', 'erica_borgogni@yahoo.it', 'BORGOGNI ERICA');
INSERT INTO `mail` VALUES ('207', '3', 'donatella.minucci@libero.it', 'MINUCCI DONATELLA');
INSERT INTO `mail` VALUES ('208', '3', 'beeetta@virgilio.it', 'MARTINI ELISABETTA');
INSERT INTO `mail` VALUES ('209', '3', 'mistero82@inwind.it', 'FAGIOLI MONICA');
INSERT INTO `mail` VALUES ('210', '3', 'susanna.fusi@interno.it', 'FUSI SUSANNA');
INSERT INTO `mail` VALUES ('211', '3', 'ivan.ma@hotmail.it', 'MAZZA IVAN');
INSERT INTO `mail` VALUES ('212', '3', 'gerardo_rescigno@hotmail.com', 'RESCIGNO GERARDO');
INSERT INTO `mail` VALUES ('213', '3', 'barbaravannini.79@gmail.com', 'VANNINI BARBARA');
INSERT INTO `mail` VALUES ('214', '3', 'susanna@meiattini.it', 'MEIATTINI SUSANNA');
INSERT INTO `mail` VALUES ('215', '3', 'bacci.marco@yahoo.it', 'GATTARI ANNA PAOLA');
INSERT INTO `mail` VALUES ('216', '3', 'persa.syrimi@hotmail.com', 'SYRIMI PERSEFONI');
INSERT INTO `mail` VALUES ('217', '3', 'ixcanil@gmail.com', 'ZABALETA LAURA');
INSERT INTO `mail` VALUES ('218', '3', 'mppicchimariani@alice.it', 'MARIANI MARIA PIA');
INSERT INTO `mail` VALUES ('219', '3', 'uvalmori@yahoo.it', 'VALMORI URSULA');
INSERT INTO `mail` VALUES ('220', '3', 'mmartellucci@hotmail.com', 'MARTELLUCCI MAURA');
INSERT INTO `mail` VALUES ('221', '3', 'elisanannicini75@gmail.com', 'NANNICINI ELISA');
INSERT INTO `mail` VALUES ('222', '3', 'saramulinacci@yahoo.it', 'MULINACCI SARA');
INSERT INTO `mail` VALUES ('223', '3', 'lupestre77@libero.it', 'ALBERINI MARTA');
INSERT INTO `mail` VALUES ('224', '3', 'maurizio.caldi@sansedonispa.it', 'CALDI MAURIZIO');
INSERT INTO `mail` VALUES ('225', '3', 'elenamugnaini@gmail.com', 'MUGNAINI ELENA');
INSERT INTO `mail` VALUES ('226', '3', 'giaomino57@libero.it', 'BAGNOLI MAURO');
INSERT INTO `mail` VALUES ('227', '3', 'torifamily@hotmail.it', 'MERRO ROSARIA');
INSERT INTO `mail` VALUES ('228', '3', 'giuliocarob@tiscali.it', 'CAROBELLI GIULIO');
INSERT INTO `mail` VALUES ('229', '3', 'deamolla@yahoo.com', 'MOLLA DEA');
INSERT INTO `mail` VALUES ('230', '3', 'ginalogaldo@libero.it', 'LOGALDO GINA');
INSERT INTO `mail` VALUES ('231', '3', 'als1981@libero.it', 'LA SORTE AGOSTINO');
INSERT INTO `mail` VALUES ('232', '3', 'crestifrancesco@libero.it', 'CRESTI FRANCESCO');
INSERT INTO `mail` VALUES ('233', '3', 'gilli90@libero.it', 'SALVATORI GIANNA');
INSERT INTO `mail` VALUES ('234', '3', 'guida@essedil.net', 'GUIDARELLI STEFANO');
INSERT INTO `mail` VALUES ('235', '3', 'stellinafa@hotmail.it', 'CANCILA FRANCESCA');
INSERT INTO `mail` VALUES ('236', '3', 'silviachiassai@virgilio.it', 'CHIASSAI SILVIA');
INSERT INTO `mail` VALUES ('237', '3', 'v.g.elmo@virgilio.it', 'ELMO VANESSA');
INSERT INTO `mail` VALUES ('238', '3', 'macucci@libero.it', 'MACUCCI ROBERTO');
INSERT INTO `mail` VALUES ('239', '3', 'zatiana@libero.it', 'STAMMEGNA SATIANA');
INSERT INTO `mail` VALUES ('240', '3', 'rossanab_77@yahoo.it', 'BISCOTTI ROSSANA');
INSERT INTO `mail` VALUES ('241', '3', 'c.civici@alice.it', 'CIVICI CINZIA');
INSERT INTO `mail` VALUES ('242', '3', 'danielaspampani@alice.it', 'STAMPANI DANIELA');
INSERT INTO `mail` VALUES ('243', '3', 'gabriele@squareshops.eu', 'THE SQUARE SRL');
INSERT INTO `mail` VALUES ('244', '3', 'malenaa@teletu.it', 'VINDIGNI BARBARA');
INSERT INTO `mail` VALUES ('245', '3', 'conti19@unisi.it', 'CONTI NICOLO');
INSERT INTO `mail` VALUES ('246', '3', 'andrealongo89@tiscali.it', 'LONGO ANDREA');
INSERT INTO `mail` VALUES ('247', '3', 'maribon_1951@libero.it', 'BONFIGLIOLI MARIELLA');
INSERT INTO `mail` VALUES ('248', '3', 'penelope.re@libero.it', 'REDANO GAIA');
INSERT INTO `mail` VALUES ('249', '3', 'marti.rosati@virgilio.it', 'ROSATI MARTINA');
INSERT INTO `mail` VALUES ('250', '3', 'ele.lilla@hotmail.it', 'FABBRINI ELENA');
INSERT INTO `mail` VALUES ('251', '3', 'tiziana.basagni@studiofei.it', 'BASAGNI TIZIANA');
INSERT INTO `mail` VALUES ('252', '3', 'riccardo.rosso.siena@alice.it', 'ROSSO RICCARDO');
INSERT INTO `mail` VALUES ('253', '3', 'caterina.pianigiani@hotmail.it', 'PIANIGIANI CATERINA');
INSERT INTO `mail` VALUES ('254', '3', 'paolacamaiani@yahoo.it', 'CAMAIANI PAOLA');
INSERT INTO `mail` VALUES ('255', '3', 'cuoco.gf@gmail.com', 'CUOCO GIUSEPPINA');
INSERT INTO `mail` VALUES ('256', '3', 'isadoraturchi@msn.com', 'TURCHI ISADORA');
INSERT INTO `mail` VALUES ('257', '3', 'andrea.bruschettini@gmail.com', 'BRUSCHETTINI ANDREA');
INSERT INTO `mail` VALUES ('258', '3', 'giulycappy@gmail.com', 'CAPPIELLO GIULIANA');
INSERT INTO `mail` VALUES ('259', '3', 'minacate@gmail.com', 'CAVALLO CATERINA');
INSERT INTO `mail` VALUES ('260', '3', 'annalisa.cadau@alice.it', 'CADAU ANNALISA');
INSERT INTO `mail` VALUES ('261', '3', 'francescabrocchi@libero.it', 'BROCCHI FRANCESCA');
INSERT INTO `mail` VALUES ('262', '3', 'lallina50@libero.it', 'ROSI LAURA');
INSERT INTO `mail` VALUES ('263', '3', 'ale_tadde@hotmail.com', 'TADDEINI ALESSANDRO');
INSERT INTO `mail` VALUES ('264', '3', 'palfert@supereva.it', 'FERRETTI PAOLA');
INSERT INTO `mail` VALUES ('265', '3', 'catemangia@gmail.com', 'MANGIA CATERINA');
INSERT INTO `mail` VALUES ('266', '3', 'chiccazero@hotmail.it', 'SANDRUCCI FEDERICA');
INSERT INTO `mail` VALUES ('267', '3', 'meri.tafani@libero.it', 'TAFANI MERI');
INSERT INTO `mail` VALUES ('268', '3', 'elisa_pn@hotmail.com', 'PUCCINI NEGRINI ELISA');
INSERT INTO `mail` VALUES ('269', '3', 'ottavio.chiezzi@alice.it', 'CHIEZZI OTTAVIO');
INSERT INTO `mail` VALUES ('270', '3', 'iannucci.marco@gmail.com', 'IANNUCCI MARCO');
INSERT INTO `mail` VALUES ('271', '3', 'lupinasantabenedetta@alice.it', 'SANI DEBORAH');
INSERT INTO `mail` VALUES ('272', '3', 'midosiena@hotmail.it', 'AHMED NAIEM IBRAHIM');
INSERT INTO `mail` VALUES ('273', '3', 'claudiabini@studiolegalebartalinibini.it', 'BINI CLAUDIA');
INSERT INTO `mail` VALUES ('274', '3', 'ceciliabartalini@studiolegalebartalinibini.it', 'BARTALINI CECILIA');
INSERT INTO `mail` VALUES ('275', '3', 'mimmo.laforgia@gmail.com', 'LA FORGIA DOMENICO');
INSERT INTO `mail` VALUES ('276', '3', 'blue04@virgilio.it', 'DI LUCIA EMANUELA');
INSERT INTO `mail` VALUES ('277', '3', 'elisabettaganetti@virgilio.it', 'GANETTI ELISABETTA');
INSERT INTO `mail` VALUES ('278', '3', 'niniko@alice.it', 'CHELISHVILI TAMAR');
INSERT INTO `mail` VALUES ('279', '3', 'parafarmacia.lalizza@libero.it', 'GIOIA DOMENICA');
INSERT INTO `mail` VALUES ('280', '3', 'giovannipellicci@gmail.com', 'PELLICCI GIOVANNI');
INSERT INTO `mail` VALUES ('281', '3', 'margherita.artini@libero.it', 'ARTINI MARGHERITA');
INSERT INTO `mail` VALUES ('282', '3', 'micdona@alice.it', 'DONATIELLO MICHELA');
INSERT INTO `mail` VALUES ('283', '3', 'raffaella.devito@email.it', 'DE VITO RAFFAELLA');
INSERT INTO `mail` VALUES ('284', '3', 'eguarrito1@libero.it', 'GUARINO ELISA');
INSERT INTO `mail` VALUES ('285', '3', 'lara.devito@email.it', 'DE VITO LARA');
INSERT INTO `mail` VALUES ('286', '3', 'donatella.balducci@email.it', 'BALDUCCI DONATELLA');
INSERT INTO `mail` VALUES ('287', '3', 'caterinaarcese@virgilio.it', 'ARCESE CATERINA');
INSERT INTO `mail` VALUES ('288', '3', 'tagliaferrialessio@yahoo.it', 'TAGLIAFERRI ALESSIO');
INSERT INTO `mail` VALUES ('289', '3', 'biribi62@hotmail.it', 'TOSCANO ROSALBA');
INSERT INTO `mail` VALUES ('290', '3', 'wilmer_mostacciuolo@hotmail.com', 'MOSTACCIUOLO WILMER');
INSERT INTO `mail` VALUES ('291', '3', 'adelevai@yahoo.it', 'VAGLIO ADELE');
INSERT INTO `mail` VALUES ('292', '3', 'patrizia.mucciarelli@tin.it', 'MUCCIARELLI PATRIZIA');
INSERT INTO `mail` VALUES ('293', '3', 'laura.gu@hotmail.it', 'GUGLIELMINI LAURA');
INSERT INTO `mail` VALUES ('294', '3', 'ginatripicchio@hotmail.it', 'TRIPICCHIO GINA');
INSERT INTO `mail` VALUES ('295', '3', 'domval86@libero.it', 'VALENTI DOMENICO');
INSERT INTO `mail` VALUES ('296', '3', 'caciara.panti@gmail.com', 'PANTI CHIARA');
INSERT INTO `mail` VALUES ('297', '3', 'aurora.tansini@libero.it', 'TANSINI AURORA');
INSERT INTO `mail` VALUES ('298', '3', 'bmontini1972@libero.it', 'MONTINI BARBARA');
INSERT INTO `mail` VALUES ('299', '3', 'fabiopignattai@virgilio.it', 'CENCIONI BENEDETTA');
INSERT INTO `mail` VALUES ('300', '3', 'chiaracasagli@virgilio.it', 'CASAGLI CHIARA');
INSERT INTO `mail` VALUES ('301', '3', 'luisa_dumbleton@hotmail.com', 'DUMBLETON LOUISA');
INSERT INTO `mail` VALUES ('302', '3', 'rossanaes@libero.it', 'ESPOSITO ROSSANA');
INSERT INTO `mail` VALUES ('303', '3', 'annamarialongo@alice.it', 'LONGO ANNA');
INSERT INTO `mail` VALUES ('304', '3', 'rosariatutino@gmail.com', 'TUTINO ROSARIA');
INSERT INTO `mail` VALUES ('305', '3', 'alice@magellanoviaggi.it', 'DE VIVO ALICE');
INSERT INTO `mail` VALUES ('306', '3', 'carmensalviulo@yahoo.it', 'SALVIULO CARMEN');
INSERT INTO `mail` VALUES ('307', '3', 'sofiavanni@alice.it', 'SALETTI SOFIA');
INSERT INTO `mail` VALUES ('308', '3', 'crogio1@libero.it', 'CROCETTA MASSIMO');
INSERT INTO `mail` VALUES ('309', '3', 'alberto.cammarano@tiscali.it', 'CAMMARANO ALBERTO');
INSERT INTO `mail` VALUES ('310', '3', 'gigiguerrera_87@live.it', 'GUERRERA LUIGI');
INSERT INTO `mail` VALUES ('311', '3', 'giuliabraccagni@live.it', 'BRACCAGNI GIULIA');
INSERT INTO `mail` VALUES ('312', '3', 'sergio731@cheapnet.it', 'BECAGLI ANNARITA');
INSERT INTO `mail` VALUES ('313', '3', 'albway@live.it', 'GHIANDAI ALBERTO');
INSERT INTO `mail` VALUES ('314', '3', 'leo@leomuzzi.com', 'MUZZI LEONARDO');
INSERT INTO `mail` VALUES ('315', '3', 'nicoletta.mencarelli@allianzbank.it', 'MENCARELLI NICOLETTA');
INSERT INTO `mail` VALUES ('316', '3', 'claudia.simoncelli@allianzbank.it', 'SIMONCELLI CLAUDIA');
INSERT INTO `mail` VALUES ('317', '3', 'antonino.trapani@bancaditalia.it', 'TRAPANI ANTONINO');
INSERT INTO `mail` VALUES ('318', '3', 'defrancesco75@libero.it', 'DE FRANCESCO SONIA');
INSERT INTO `mail` VALUES ('319', '3', 'federicalbn@gmail.com', 'ALBANO FEDERICA');
INSERT INTO `mail` VALUES ('320', '3', 'annamaria.giulia@gmail.com', 'MARCHIONI ANNA MARIA');
INSERT INTO `mail` VALUES ('321', '3', 'nbotare@tin.it', 'BOTARELLI NICOLA');
INSERT INTO `mail` VALUES ('322', '3', 'valentiano@unisi.it', 'VALENTIANO LUISA');
INSERT INTO `mail` VALUES ('323', '3', 'emanuele@mobilibianchini.com', 'BIANCHINI EMANUELE');
INSERT INTO `mail` VALUES ('324', '3', 'e.pallucca@ao-siena.toscana.it', 'PALLUCCA ELEONORA');
INSERT INTO `mail` VALUES ('325', '3', 'vegi@vegi.it', 'NANNICINI ILARIA');
INSERT INTO `mail` VALUES ('326', '3', 'giselda.debonis@libero.it', 'DE BONIS GISELDA');
INSERT INTO `mail` VALUES ('327', '3', 'avv.elisabettacarloni@gmail.com', 'CARLONI ELISABETTA');
INSERT INTO `mail` VALUES ('328', '3', 'giarletta.biancamaria@gmail.com', 'GIARLETTA BIANCAMARIA');
INSERT INTO `mail` VALUES ('329', '3', 'nelly.sm@libero.it', 'MAHMOUD HELMY NELLY');
INSERT INTO `mail` VALUES ('330', '3', 'lovablegaia@hotmail.it', 'NANNOTTI GAIA');
INSERT INTO `mail` VALUES ('331', '3', 'mariateresa.albanese@tesoro.it', 'ALBANESE MARIA TERESA');
INSERT INTO `mail` VALUES ('332', '3', 'manuela@piattelli.com', 'CALONACI MANUELA');
INSERT INTO `mail` VALUES ('333', '3', 'albetta_210@hotmail.it', 'CIARPELLA ALBA');
INSERT INTO `mail` VALUES ('334', '3', 'info@immobiliaredelsal.it', 'DEL SAL GIORGIO');
INSERT INTO `mail` VALUES ('335', '3', 'rachelemarini@libero.it', 'MARINI RACHELE');
INSERT INTO `mail` VALUES ('336', '3', 'hbabassana@yahoo.fr', 'BABASSANA HERBERT TANGUY');
INSERT INTO `mail` VALUES ('337', '3', 'mariarachele.arena@banca.mps.it', 'ARENA MARILENA');
INSERT INTO `mail` VALUES ('338', '3', 'mara.muterini@gmail.com', 'MUTERINI MARIA');
INSERT INTO `mail` VALUES ('339', '3', 'selenia.sgarro.110@istruzione.it', 'SGARRO SELENIA');
INSERT INTO `mail` VALUES ('340', '3', 'andrea.pucci@gmail.com', 'PUCCI ANDREA');
INSERT INTO `mail` VALUES ('341', '3', 'a2gucci@yahoo.it', 'ARRIGUCCI ALESSANDRO');
INSERT INTO `mail` VALUES ('342', '3', 'orsola@thenewoxfordschool.it', 'MAIONE ORSOLA');
INSERT INTO `mail` VALUES ('343', '3', 'pasticceriadocedoce@libero.it', 'PALOMBA AURELIA');
INSERT INTO `mail` VALUES ('344', '3', 'info@dalis.it', 'BANDIERA SILVIA');
INSERT INTO `mail` VALUES ('345', '3', 'anita.gonnella@libero.it', 'GONNELLA ANITA');
INSERT INTO `mail` VALUES ('346', '3', 'ericyoukancy@yahoo.it', 'YGUKANTOUDJUI ERIC ARMAND');
INSERT INTO `mail` VALUES ('347', '3', 'batteral@libero.it', 'BENNICI LORETTA');
INSERT INTO `mail` VALUES ('348', '3', 'fbarone@studiolegalebarone.com', 'BARONE BOMBAGLI FEDERICA');
INSERT INTO `mail` VALUES ('349', '3', 'abeyolani@hotmail.com', 'LANI ALMA');
INSERT INTO `mail` VALUES ('350', '3', 'etizy@yahoo.it', 'ESPOSITO TIZIANA');
INSERT INTO `mail` VALUES ('351', '3', 't.anto125@yahoo.it', 'TOZZI ANTONELLA');
INSERT INTO `mail` VALUES ('352', '3', 'djvalentinik@hotmail.it', 'GIOMI VALENTINO');
INSERT INTO `mail` VALUES ('353', '3', 'francaricioppo@libero.it', 'RICIOPPO FRANCA');
INSERT INTO `mail` VALUES ('354', '3', 'michela.b3@virgilio.it', 'BERNARDI MICHELA');
INSERT INTO `mail` VALUES ('355', '3', 'lucgriso@gmail.com', 'GRISOSTOMI LUCIA');
INSERT INTO `mail` VALUES ('356', '3', 'simona.marginesi@hotmail.it', 'MARGINESI SIMONA');
INSERT INTO `mail` VALUES ('357', '3', 'marcyfai@yahoo.it', 'FAI MARCEL');
INSERT INTO `mail` VALUES ('358', '3', 'pintayan@yahoo.fr', 'YANNICK ROLAND PINTA');
INSERT INTO `mail` VALUES ('359', '3', 'cacala72@gmail.com', 'CECCARELLI LAURA');
INSERT INTO `mail` VALUES ('360', '3', 'aras.6@libero.it', 'PAOLUCCI SARA');
INSERT INTO `mail` VALUES ('361', '3', 'aldomiscali@hotmail.it', 'MISCALI ALDO');
INSERT INTO `mail` VALUES ('362', '3', 'baby.piolo@gmail.com', 'SANTONI PAOLO');
INSERT INTO `mail` VALUES ('363', '3', 'daiutomaria@gmail.com', 'D AIUTO MARIA');
INSERT INTO `mail` VALUES ('364', '3', 'rossisall@yahoo.it', 'SALLUCE ROSSANA');
INSERT INTO `mail` VALUES ('365', '3', 's.bartali@usl7.toscana.it', 'BARTALI SILVIA');
INSERT INTO `mail` VALUES ('366', '3', 'secchitarugi@gmail.com', 'SECCHI TARUGI LUCIA');
INSERT INTO `mail` VALUES ('367', '3', 'giorgistefania@alice.it', 'GIORGI STEFANIA');
INSERT INTO `mail` VALUES ('368', '3', 'istrice@tin.it', 'PRUNETI PATRIZIA');
INSERT INTO `mail` VALUES ('369', '3', 'giovianna@hotmail.it', 'SANITA GIOVANNA');
INSERT INTO `mail` VALUES ('370', '3', 'fofackninted29@libero.it', 'FOFACK OLIVE');
INSERT INTO `mail` VALUES ('371', '3', 'chiaramartinelli_@libero.it', 'MARTINELLI CHIARA');
INSERT INTO `mail` VALUES ('372', '3', 'silvia.leoncini@libero.it', 'LEONCINI SILVIA');
INSERT INTO `mail` VALUES ('373', '3', 'cristinaciaccio@hotmail.com', 'CIACCIO CRISTINA');
INSERT INTO `mail` VALUES ('374', '3', 'b.magi@unipolsiena.it', 'MAGI BEATRICE');
INSERT INTO `mail` VALUES ('375', '3', 'grazia.tarquini@alice.it', 'TARQUINI GRAZIA');
INSERT INTO `mail` VALUES ('376', '3', 'info@stanzadellamemoria.it', 'MATTEI LAURA');
INSERT INTO `mail` VALUES ('377', '3', 'carletti_francesca@libero.it', 'CARLETTI FRANCESCA');
INSERT INTO `mail` VALUES ('378', '3', 'marimea@alice.it', 'MEA MARIASSUNTA');
INSERT INTO `mail` VALUES ('379', '3', 'bruno-cristian77@libero.it', 'BRUNO GIOVANNI CRISTIAN');
INSERT INTO `mail` VALUES ('380', '3', 'fabio.fineschi@teletu.it', 'FINESCHI FABIO');
INSERT INTO `mail` VALUES ('381', '3', 'carlanocente@gmail.com', 'NOCENTE CARLA');
INSERT INTO `mail` VALUES ('382', '3', 'diletta1983@hotmail.it', 'GOSI DILETTA');
INSERT INTO `mail` VALUES ('383', '3', 'lorenzobicchi@libero.it', 'BICCHI LORENZO');
INSERT INTO `mail` VALUES ('384', '3', 'montagnani@medicicolle.it', 'MONTAGNANI IULA');
INSERT INTO `mail` VALUES ('385', '3', 'poggiani3@unisi.it', 'POGGIANI M. LETIZIA');
INSERT INTO `mail` VALUES ('386', '3', 'avvraponi@alice.it', 'RAPONI MARIA CONCETTA');
INSERT INTO `mail` VALUES ('387', '3', 'elninho80@hotmail.it', 'FALBO ANDREA');
INSERT INTO `mail` VALUES ('388', '3', 'carmen-bianco@libero.it', 'BIANCO CARMEN');
INSERT INTO `mail` VALUES ('389', '3', 'losa.jnes@yahoo.it', 'SALLAKU ERONA');
INSERT INTO `mail` VALUES ('390', '3', 'lerida_1@hotmail.com', 'ALLKA LERIDA');
INSERT INTO `mail` VALUES ('391', '3', 'sereni.daniele@gmail.com', 'SERENI DANIELE');
INSERT INTO `mail` VALUES ('392', '3', 'montinima@libero.it', 'MONTINI MAURIZIO');
INSERT INTO `mail` VALUES ('393', '3', 'mariaritaferri@libero.it', 'FERRI MARIA RITA');
INSERT INTO `mail` VALUES ('394', '3', 'djmans10@hotmail.it', 'COLAVITA MANUEL');
INSERT INTO `mail` VALUES ('395', '3', 'khrys.7@hotmail.it', 'CITTADONI CRISTOPHER');
INSERT INTO `mail` VALUES ('396', '3', 'antonella.terracina@piuenergiaelettrica.it', 'TERRACINA ANTONELLA');
INSERT INTO `mail` VALUES ('397', '3', 'katiuscia.bompadre@email.it', 'BOMPADRE KATIUSCIA');
INSERT INTO `mail` VALUES ('398', '3', 'cristina.lucantoni@yahoo.it', 'LUCANTONI CRISTINA');
INSERT INTO `mail` VALUES ('399', '3', 'marica023@hotmail.com', 'GASPARRINI MARICA');
INSERT INTO `mail` VALUES ('400', '3', 'barbara_mei@hotmail.it', 'MEI BARBARA');
INSERT INTO `mail` VALUES ('401', '3', 'bettabu3@yahoo.it', 'BAMBU ELISABETTA');
INSERT INTO `mail` VALUES ('402', '3', 'ariannangel79@gmail.com', 'ANGELINI ARIANNA');
INSERT INTO `mail` VALUES ('403', '3', 'wilma.cetra@alice.it', 'CETRA WILMA');
INSERT INTO `mail` VALUES ('404', '3', 'fabrizio.28@tiscali.it', 'MELILLI FABRIZIO');
INSERT INTO `mail` VALUES ('405', '3', 'franc86b@hotmail.it', 'BARBI FRANCESCA');
INSERT INTO `mail` VALUES ('406', '3', 'ale.uni2005@libero.it', 'AVOLIO ALESSIA');
INSERT INTO `mail` VALUES ('407', '3', 'daniele.rinaldi@piuenergiaelettrica.it', 'RINALDI DANIELE');
INSERT INTO `mail` VALUES ('408', '3', 'isabeoru007@virgilio.it', 'DOMINIA ELISA');
INSERT INTO `mail` VALUES ('409', '3', 'noemisargenti@hotmail.it', 'SARGENTI NOEMI');
INSERT INTO `mail` VALUES ('410', '3', 'elisa.bagatti@libero.it', 'BAGATTI ELISA');
INSERT INTO `mail` VALUES ('411', '3', 'n.cerasini@yahoo.it', 'CERASINI NATASHA');
INSERT INTO `mail` VALUES ('412', '3', 'flora.piccini@libero.it', 'PICCINI FLORA');
INSERT INTO `mail` VALUES ('413', '3', 'cri78.lai@live.it', 'LAI CRISTIANA');
INSERT INTO `mail` VALUES ('414', '3', 'ilapiumata@libero.it', 'AVOLIO ILARIA');
INSERT INTO `mail` VALUES ('415', '3', 'france.mancuso@gmail.com', 'MANCUSO FRANCESCO');
INSERT INTO `mail` VALUES ('416', '3', 'moniabonacci08@alice.it', 'BONACCI MONIA');
INSERT INTO `mail` VALUES ('417', '3', 'catia.riboloni@gmail.com', 'RIBOLONI CATIA');
INSERT INTO `mail` VALUES ('418', '3', 'chiara.lumaca@libero.it', 'LUMACA CHIARA');
INSERT INTO `mail` VALUES ('419', '3', 'chiara_cesarini@libero.it', 'CESARINI CHIARA');
INSERT INTO `mail` VALUES ('420', '3', 'barbyvale@tiscali.it', 'MEI VALENTINA');
INSERT INTO `mail` VALUES ('421', '3', 'cristiana.riccetti@libero.it', 'RICCETTI CRISTIANA');
INSERT INTO `mail` VALUES ('422', '3', 'martina.recchioni@libero.it', 'RECCHIONI MARTINA');
INSERT INTO `mail` VALUES ('423', '3', 'enzacres@yahoo.it', 'CRESCIMANNO ENZA');
INSERT INTO `mail` VALUES ('424', '3', 'donatotartamelli@libero.it', 'TARTAMELLI DONATO');
INSERT INTO `mail` VALUES ('425', '3', 'karinb.@live.it', 'BUROVA KARIN');
INSERT INTO `mail` VALUES ('426', '3', 'isaben31@libero.it', 'BENEDETTI ISABELLA');
INSERT INTO `mail` VALUES ('427', '3', 'blanca.23@hotmail.it', 'STANGANINI ANNA');
INSERT INTO `mail` VALUES ('428', '3', 'lauramar@hotmail.it', 'MARONA LAURA');
INSERT INTO `mail` VALUES ('429', '3', 'paola.ax@libero.it', 'SCIARRONI PAOLA');
INSERT INTO `mail` VALUES ('430', '3', 'sassiric@alice.it', 'SASSI RICCARDO');
INSERT INTO `mail` VALUES ('431', '3', '19fra84@alice.it', 'ROSSI FRANCESCO');
INSERT INTO `mail` VALUES ('432', '3', 'bah.bah@libero.it', 'FATTORI STEFANO');
INSERT INTO `mail` VALUES ('433', '3', 'giuli.1999@mail.ru', 'OSMANOVA GIULI');
INSERT INTO `mail` VALUES ('434', '3', 'francescacool@gmail.com', 'TRENTINI FRANCESCA');
INSERT INTO `mail` VALUES ('435', '3', 'almadamato@hotmail.it', 'DAMATO ALMA');
INSERT INTO `mail` VALUES ('436', '3', 'mauroesilvana@alice.it', 'QUAGLIA SILVANA');
INSERT INTO `mail` VALUES ('437', '3', 'grassia@unisi.it', 'GRASSI ANNAMARIA');
INSERT INTO `mail` VALUES ('438', '3', 'dmazzieri@libero.it', 'BURICO MAZZIERI DANIELA');
INSERT INTO `mail` VALUES ('439', '3', 's.morgana2@tiscali.it', 'VALDRIGHI VALENTINA');
INSERT INTO `mail` VALUES ('440', '3', 'luciamromillo@hotmail.it', 'ROMILLO LUCIA MARIA');
INSERT INTO `mail` VALUES ('441', '3', 'ravenni@libero.it', 'AIELLO CHIARA');
INSERT INTO `mail` VALUES ('442', '3', 'cortesi.annalisa@virgilio.it', 'CORTESI ANNALISA');
INSERT INTO `mail` VALUES ('443', '3', 'eco_edil@libero.it', 'SALONE GIUSEPPE');
INSERT INTO `mail` VALUES ('444', '3', 'fede.993@live.it', 'DI FRANCESCO FEDERICO');
INSERT INTO `mail` VALUES ('445', '3', 'serenamiraldi@hotmail.com', 'MIRALDI SERENA');
INSERT INTO `mail` VALUES ('446', '3', 'vbellia@me.com', 'BELLIA VALERIO');
INSERT INTO `mail` VALUES ('447', '3', 'bchmrc@gmail.com', 'BECHI MARCO');
INSERT INTO `mail` VALUES ('448', '3', 'francesca.g90@hotmail.it', 'GIULIANI FRANCESCA');
INSERT INTO `mail` VALUES ('449', '3', 'simo665@hotmail.it', 'TADDEO SIMONE');
INSERT INTO `mail` VALUES ('450', '3', 'federica.pagni@libero.it', 'PAGNI MARIA FEDERICA');
INSERT INTO `mail` VALUES ('451', '3', 'marziabi@gmail.com', 'BINDI MARZIA');
INSERT INTO `mail` VALUES ('452', '3', 'rosigc@yahoo.com.ar', 'GUTIERREZ ROSALIA');
INSERT INTO `mail` VALUES ('453', '3', 'thibault98@hotmail.com', 'TOUAJUI LOUIS THIBAULT LGAROL');
INSERT INTO `mail` VALUES ('454', '3', 'giobrando@tiscali.it', 'BRANDO ANDREA');
INSERT INTO `mail` VALUES ('455', '3', 'chiabenn@tin.it', 'BENNATI CHIARA');
INSERT INTO `mail` VALUES ('456', '3', 'almanten@tin.it', 'PECCIARELLI SANDRA');
INSERT INTO `mail` VALUES ('457', '3', 'robertaresti@libero.it', 'RESTI ROBERTA');
INSERT INTO `mail` VALUES ('458', '3', 'calegiusta@virgilio.it', 'BONUCCI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('459', '3', 'nadia.cacelli@istruzione.it', 'CACELLI NADIA');
INSERT INTO `mail` VALUES ('460', '3', 'swarz29@libero.it', 'FORMICA MARIA ELENA');
INSERT INTO `mail` VALUES ('461', '3', 'sanela72@libero.it', 'LORENZONI SANELA');
INSERT INTO `mail` VALUES ('462', '3', 'milvana.barbato@live.it', 'ALFISI MILVANA');
INSERT INTO `mail` VALUES ('463', '3', 'centrovetmontarioso@live.it', 'FONTANI MICHELA');
INSERT INTO `mail` VALUES ('464', '3', 'gio2006@hotmail.it', 'CALABRESE GIORGIO');
INSERT INTO `mail` VALUES ('465', '3', 'ceciocm@gmail.com', 'CATENI CECILIA');
INSERT INTO `mail` VALUES ('466', '3', 'mariannadelpozzo@hotmail.it', 'DEL POZZO MARIANNA');
INSERT INTO `mail` VALUES ('467', '3', 'katrina.siena@gmail.com', 'OZEROVA EKATERINA');
INSERT INTO `mail` VALUES ('468', '3', 'angelabrunelli@alice.it', 'BRUNELLI ANGELA');
INSERT INTO `mail` VALUES ('469', '3', 'mariapisaneschi@virgilio.it', 'CERVINI MARIA');
INSERT INTO `mail` VALUES ('470', '3', 'nina.m77@hotmail.it', 'MARESCA ANNUNZIATA');
INSERT INTO `mail` VALUES ('471', '3', 'giulia.bernardini@poste.it', 'BERNARDINI GIULIA');
INSERT INTO `mail` VALUES ('472', '3', 'robertomaffei@alice.it', 'MAFFEI ROBERTO');
INSERT INTO `mail` VALUES ('473', '3', 'rosyta92@live.it', 'PELLEGRINO ROSITA');
INSERT INTO `mail` VALUES ('474', '3', 'avvsimonafulceri@alice.it', 'FULCERI SIMONA');
INSERT INTO `mail` VALUES ('475', '3', 'dezdez@hotmail.it', 'CARBONE DARIO');
INSERT INTO `mail` VALUES ('476', '3', 'ag.immobiliare@hotmail.it', 'GHEORGHE CARISA');
INSERT INTO `mail` VALUES ('477', '3', 'carlacappellini@gmail.com', 'CAPPELLINI CARLA');
INSERT INTO `mail` VALUES ('478', '3', 'ben.cenni@gmail.com', 'CENNI BENEDETTA');
INSERT INTO `mail` VALUES ('479', '3', 'nico.87@tiscali.it', 'CAPPELLETTI NICO');
INSERT INTO `mail` VALUES ('480', '3', 'mariolinapalazzo@yahoo.it', 'PALAZZO MARIA');
INSERT INTO `mail` VALUES ('481', '3', 'elioaloia@libero.it', 'ALOIA ELIO');
INSERT INTO `mail` VALUES ('482', '3', 'christianedehmel@yahoo.it', 'DEHEMEL CHRISTIANE');
INSERT INTO `mail` VALUES ('483', '3', 'laphotoflou@virgilio.it', 'AMATRUDA MARCO');
INSERT INTO `mail` VALUES ('484', '3', 'cecilia.viti@unisi.it', 'VITI CECILIA');
INSERT INTO `mail` VALUES ('485', '3', 'sarafanti85@gmail.com', 'FANTI SARA');
INSERT INTO `mail` VALUES ('486', '3', 'nenaotto@hotmail.com', 'DINI ELENA');
INSERT INTO `mail` VALUES ('487', '3', 'pompilio_tosti@libero.it', 'CINOTTI ELENA');
INSERT INTO `mail` VALUES ('488', '3', 'pimulin@libero.it', 'MULINACCI PIETRO');
INSERT INTO `mail` VALUES ('489', '3', 'lucia_bartolomei@virgilio.it', 'BARTOLOMEI LUCIA');
INSERT INTO `mail` VALUES ('490', '3', 'g.casciaro@flcgil.it', 'CASCIARO GILDA');
INSERT INTO `mail` VALUES ('491', '3', 'rbari51@gmail.com', 'BARI ROSANNA');
INSERT INTO `mail` VALUES ('492', '3', 'efromelba@me.com', 'RICCI ELISABETTA');
INSERT INTO `mail` VALUES ('493', '3', 'madonielena@libero.it', 'MADONI ELENA');
INSERT INTO `mail` VALUES ('494', '3', 'carlafioravanti@hotmail.it', 'FIORAVANTI CARLA');
INSERT INTO `mail` VALUES ('495', '3', 'sara91.13@hotmail.it', 'CHEGAI SARA');
INSERT INTO `mail` VALUES ('496', '3', 'valentemonica@yahoo.it', 'VALENTE MONICA');
INSERT INTO `mail` VALUES ('497', '3', 'aganowx@gmail.com', 'NOWAIC AGNESE');
INSERT INTO `mail` VALUES ('498', '3', 'cannavacciuolo2000@gmail.com', 'CANNAVACCIUOLO ROBERTO');
INSERT INTO `mail` VALUES ('499', '3', 'maddalena.dericco@fiora.it', 'DE RICCO MADDALENA');
INSERT INTO `mail` VALUES ('500', '3', 'mgcol@yahoo.it', 'COLLARINO MARIAGRAZIA');
INSERT INTO `mail` VALUES ('501', '3', 'ledasac@gmail.com', 'SACRAMATI LEDA');
INSERT INTO `mail` VALUES ('502', '3', 'info@rosifontana.it', 'FONTANA ROSI');
INSERT INTO `mail` VALUES ('503', '3', 'simona.ghionzoli@virgilio.it', 'GHIONZOLI SIMONA');
INSERT INTO `mail` VALUES ('504', '3', 'toniamartire@libero.it', 'MARTIRE ANTONIA');
INSERT INTO `mail` VALUES ('505', '3', 'meritomassini@virgilio.it', 'TOMASSINI MERI');
INSERT INTO `mail` VALUES ('506', '3', 'francesco_santomauro@hotmail.com', 'SANTOMAURO FRANCESCO');
INSERT INTO `mail` VALUES ('507', '3', 'r.benigni@ao-siena.toscana.it', 'BENIGNI ROSSANA');
INSERT INTO `mail` VALUES ('508', '3', 'lucat1976@hotmail.it', 'TOZZI LUCA');
INSERT INTO `mail` VALUES ('509', '3', 'melenabot@gmail.com', 'BOTTIGLIONI MARIA ELENA');
INSERT INTO `mail` VALUES ('510', '3', 'ng69@hotmail.it', 'SIGILLO LUCIA');
INSERT INTO `mail` VALUES ('511', '3', 'tozzi.veronica@gmail.com', 'TOZZI VERONICA');
INSERT INTO `mail` VALUES ('512', '3', 'sanso19@libero.it', 'SANSONI ANDREA');
INSERT INTO `mail` VALUES ('513', '3', 'carolina.scorzelli@gmail.com', 'SCORZELLI CAROLINA');
INSERT INTO `mail` VALUES ('514', '3', 'linda.aniello@libero.it', 'ANIELLO LINDA');
INSERT INTO `mail` VALUES ('515', '3', 'marilisadefilpo@libero.it', 'DE FILPO MARIA LUISA');
INSERT INTO `mail` VALUES ('516', '3', 'cristina_menicacci@yahoo.it', 'MENICACCI CRISTINA');
INSERT INTO `mail` VALUES ('517', '3', 'vieri_vannoni@yahoo.it', 'VANNONI VIERI');
INSERT INTO `mail` VALUES ('518', '3', 'cennamoa@gmail.com', 'CENNAMO ARMANDO');
INSERT INTO `mail` VALUES ('519', '3', 'eusica212@hotmail.it', 'CABIANCA ENRICA');
INSERT INTO `mail` VALUES ('520', '3', 'melissa.stornaiuolo@gmail.com', 'STORNAIUOLO MELISSA');
INSERT INTO `mail` VALUES ('521', '3', 'pat.60@alice.it', 'BIZZARRI PATRIZIA');
INSERT INTO `mail` VALUES ('522', '3', 'annatizianamasi@gmail.com', 'MASI ANNA TIZIANA');
INSERT INTO `mail` VALUES ('523', '3', 'dimastrochicco_g@libero.it', 'DIMASTROCHICCO GIACINTO');
INSERT INTO `mail` VALUES ('524', '3', 'vica.manshylina@mail.ru', 'MANSHYLINA VICTORIYA');
INSERT INTO `mail` VALUES ('525', '3', 'tvlsvn@gmail.com', 'TAVOLAZZI SILVANA');
INSERT INTO `mail` VALUES ('526', '3', 'isabella.marini@email.it', 'MARINI ISABELLA');
INSERT INTO `mail` VALUES ('527', '3', 'cesareboccini@tiscali.it', 'BOCCINI CESARE');
INSERT INTO `mail` VALUES ('528', '3', 'davidgorelli@gmail.com', 'GORELLI DAVID');
INSERT INTO `mail` VALUES ('529', '3', 'beligni@unistrasi.it', 'BELIGNI ANNAMARIA');
INSERT INTO `mail` VALUES ('530', '3', 'giannicipri@hotmail.it', 'CIPRIANI GIANNI');
INSERT INTO `mail` VALUES ('531', '3', 'najadakazazi@yahoo.com', 'KAZAZI NAJADA');
INSERT INTO `mail` VALUES ('532', '3', 'ale.fanetti@libero.it', 'FANETTI ALESSANDRA');
INSERT INTO `mail` VALUES ('533', '3', 'gavinacherchi@tin.it', 'CHERCHI GAVINA');
INSERT INTO `mail` VALUES ('534', '3', 'faro6670@libero.it', 'SILVESTRI GIOVANNA');
INSERT INTO `mail` VALUES ('535', '3', 'sett60@hotmail.it', 'PASQUINI GIULIANA');
INSERT INTO `mail` VALUES ('536', '3', 'defrancesco@unisi.it', 'FICORILLI ERMINIA');
INSERT INTO `mail` VALUES ('537', '3', 'katia.belardo@libero.it', 'BELARDO CATERINA');
INSERT INTO `mail` VALUES ('538', '3', 'parricinzia@libero.it', 'PARRI CINZIA');
INSERT INTO `mail` VALUES ('539', '3', 'ivadelima@gmail.com', 'DE LIMA IVA');
INSERT INTO `mail` VALUES ('540', '3', 'chiaraferrata@yahoo.it', 'FERRATA CHIARA');
INSERT INTO `mail` VALUES ('541', '3', 'giancarlo.3@hotmail.it', 'ROSA GIOVANNI');
INSERT INTO `mail` VALUES ('542', '3', 'goldnutritionsas@gmail.com', 'ROMANO SIMONE');
INSERT INTO `mail` VALUES ('543', '3', 'davidemarruso@libero.it', 'MARRUSO DAVIDE');
INSERT INTO `mail` VALUES ('544', '3', 'mars.zp@gmail.com', 'ZURA PUNTARONI MARTA');
INSERT INTO `mail` VALUES ('545', '3', 'contegiova@tin.it', 'VIVIANI VIVIANA');
INSERT INTO `mail` VALUES ('546', '3', 'nat.costa@libero.it', 'COSTA NATALINA');
INSERT INTO `mail` VALUES ('547', '3', 'guerriniandrea@hotmail.com', 'GUERRINI ANDREA');
INSERT INTO `mail` VALUES ('548', '3', 'fida.19@libero.it', 'FERRARI IDA');
INSERT INTO `mail` VALUES ('549', '3', 'marcobartali50@gmail.com', 'BARTALI MARCO');
INSERT INTO `mail` VALUES ('550', '3', 'radisnc@virgilio.it', 'MAZZESCHI SABRINA');
INSERT INTO `mail` VALUES ('551', '3', 'nenuccio1@hotmail.it', 'SIGNORIELLO NAZZARENO');
INSERT INTO `mail` VALUES ('552', '3', 'gabriello.sozzi@gmail.com', 'SOZZI GABRIELLO');
INSERT INTO `mail` VALUES ('553', '3', 'marinasmart76@gmail.com', 'ANNUNZIATA MARINA');
INSERT INTO `mail` VALUES ('554', '3', 'jacopo.brizzi@tin.it', 'BRIZZI JACOPO');
INSERT INTO `mail` VALUES ('555', '3', 'filomenaferrara@rocketmail.com', 'FERRARA FILOMENA');
INSERT INTO `mail` VALUES ('556', '3', 'helen.vitell@bredband.net', 'VITELL HELEN');
INSERT INTO `mail` VALUES ('557', '3', 'amira8@alice.it', 'MAKHLOUF AMIRA');
INSERT INTO `mail` VALUES ('558', '3', 'giuliadevuono@libero.it', 'DE VUONO GIULIA');
INSERT INTO `mail` VALUES ('559', '3', 'sandratrapassi@gmail.com', 'TRAPASSI SANDRA');
INSERT INTO `mail` VALUES ('560', '3', 'zonadilucas@yahoo.it', 'PAPI LUCA');
INSERT INTO `mail` VALUES ('561', '3', 'pierangelo89@msn.com', 'CORDISCHI PIERANGELO');
INSERT INTO `mail` VALUES ('562', '3', 'francesco.bellandi85@gmail.com', 'BELLANDI FRANCESCO');
INSERT INTO `mail` VALUES ('563', '3', 'ladieragon17@gmail.it', 'BARTALINI LUCIA');
INSERT INTO `mail` VALUES ('564', '3', 'info@lorenzodirenzone.it', 'DI RENZONE LORENZO');
INSERT INTO `mail` VALUES ('565', '3', 'marcellobucciarelli@alice.it', 'BUCCIARELLI VINCENZO');
INSERT INTO `mail` VALUES ('566', '3', 'nellyihemewola@hotmail.it', 'IHEMEWOLA NELLY');
INSERT INTO `mail` VALUES ('567', '3', 'paolo.camaiti@geopec.it', 'CAMAITI PAOLO');
INSERT INTO `mail` VALUES ('568', '3', 'carmelavita@yahoo.it', 'VITA CARMELA');
INSERT INTO `mail` VALUES ('569', '3', 'naccio91@hotmail.it', 'NACCI CESARE');
INSERT INTO `mail` VALUES ('570', '3', 'eridita7@yahoo.it', 'BALLA ERION');
INSERT INTO `mail` VALUES ('571', '3', 'rob.mart@fastwebnet.it', 'MARTINI ROBERTO');
INSERT INTO `mail` VALUES ('572', '3', 'rosanna.fruschelli@gmail.com', 'FRUSCHELLI ROSANNA');
INSERT INTO `mail` VALUES ('573', '3', 'santa.sara@alice.it', 'MANGANI SARA');
INSERT INTO `mail` VALUES ('574', '3', 'loredana_cu@libero.it', 'CURTI LOREDANA');
INSERT INTO `mail` VALUES ('575', '3', 'disimplicio@gmail.com', 'DI SIMPLICIO FRANCESCA');
INSERT INTO `mail` VALUES ('576', '3', 'rossellamalangone5@gmail.com', 'MALANGONE ROSSELLA');
INSERT INTO `mail` VALUES ('577', '3', 'saponara@unisi.it', 'SAPONARA SIMONA');
INSERT INTO `mail` VALUES ('578', '3', 'clelia.sbrolli@gmail.com', 'SBROLLI CLELIA');
INSERT INTO `mail` VALUES ('579', '3', 'ivajani@gmail.com', 'JANI IVA');
INSERT INTO `mail` VALUES ('580', '3', 'anna.valoriani@gmail.com', 'VALORIANI ANNA MARIA');
INSERT INTO `mail` VALUES ('581', '3', 'chiara.rosini@banca.mps.it', 'ROSINI CHIARA');
INSERT INTO `mail` VALUES ('582', '3', 'sarabaccheschi@alice.it', 'BACCHESCHI SARA');
INSERT INTO `mail` VALUES ('583', '3', 'raffaellaguazzo@tiscali.it', 'GUAZZO RAFFAELLA');
INSERT INTO `mail` VALUES ('584', '3', 'navarrac@hotmail.it', 'NAVARRA CRISTINA');
INSERT INTO `mail` VALUES ('585', '3', 'castefy@hotmail.com', 'CASTELLI STEFANIA');
INSERT INTO `mail` VALUES ('586', '3', 'monica.geloni@novartis.com', 'GELONI MONICA');
INSERT INTO `mail` VALUES ('587', '3', 'chiara.f76@libero.it', 'FRANCIONI CHIARA');
INSERT INTO `mail` VALUES ('588', '3', 'p.bulletti@gmail.com', 'BULLETTI MARIA PAOLA');
INSERT INTO `mail` VALUES ('589', '3', 'boccieva@gmail.com', 'BOCCI EVA');
INSERT INTO `mail` VALUES ('590', '3', 's.adurno@virgilio.it', 'ADURNO SIMONA');
INSERT INTO `mail` VALUES ('591', '3', 'floreslucy45@yahoo.com', 'FLORES LUCY');
INSERT INTO `mail` VALUES ('592', '3', 'ccsjenny@tin.it', 'ANTONELLI EUGENIA');
INSERT INTO `mail` VALUES ('593', '3', 'lisa.bartali@tin.it', 'BARTALI LISA');
INSERT INTO `mail` VALUES ('594', '3', 'a.grasso@ao_siena.toscana.it', 'GRASSO ANNA');
INSERT INTO `mail` VALUES ('595', '3', 'babyluciano@hotmail.it', 'LUCIANO BARBARA');
INSERT INTO `mail` VALUES ('596', '3', 'e.cipressa@libero.it', 'CIPRESSA EMANUELA');
INSERT INTO `mail` VALUES ('597', '3', 'giuliana.senesi@comune.siena.it', 'SENESI GIULIANA');
INSERT INTO `mail` VALUES ('598', '3', 'fra78.s@hotmail.it', 'SANTORO FRANCESCA');
INSERT INTO `mail` VALUES ('599', '3', 'alessandro.scagnetti@gmail.com', 'SCAGNETTI ALESSANDRO');
INSERT INTO `mail` VALUES ('600', '3', 'manuela.pacchiarotti.195@istruzione.it', 'PACCHIAROTTI MANUELA');
INSERT INTO `mail` VALUES ('601', '3', 'scagnetti@tin.it', 'SCAGNETTI ROMEO');
INSERT INTO `mail` VALUES ('602', '3', 'valentina.scagnetti@eng.it', 'SCAGNETTI VALENTINA');
INSERT INTO `mail` VALUES ('603', '3', 'francescaravenni@libero.it', 'RAVENNI FRANCESCA');
INSERT INTO `mail` VALUES ('604', '3', 'vikigtan@gmail.com', 'GIANNUBILO VINCENZO');
INSERT INTO `mail` VALUES ('605', '3', 'e.rossolini@gmail.com', 'ROSSOLINI ELENA');
INSERT INTO `mail` VALUES ('606', '3', 'antonella.gallotta@tin.it', 'GALLOTTA ANTONELLA');
INSERT INTO `mail` VALUES ('607', '3', 'grossiannam@gmail.com', 'GROSSI ANNAMARIA');
INSERT INTO `mail` VALUES ('608', '3', 'c.giustarini@libero.it', 'GIUSTARINI CATERINA');
INSERT INTO `mail` VALUES ('609', '3', 'giuliodelucia@virgilio.it', 'BARRICELLI GRAZIELLA');
INSERT INTO `mail` VALUES ('610', '3', 'abartolomucci76@gmail.com', 'BARTOLOMUCCI ANNAMARIA');
INSERT INTO `mail` VALUES ('611', '3', 'chiara.polvani349@vodafone.it', 'POLVANI CHIARA');
INSERT INTO `mail` VALUES ('612', '3', 'gioia.spataro@libero.it', 'SPATARO GIOIA');
INSERT INTO `mail` VALUES ('613', '3', 'anto.paluffi@libero.it', 'BERARDI ANTONELLA');
INSERT INTO `mail` VALUES ('614', '3', 'lisa.capocci8@gmail.com', 'CAPOCCI LISA');
INSERT INTO `mail` VALUES ('615', '3', 'simone1965@interfree.it', 'VIGNI SIMONE');
INSERT INTO `mail` VALUES ('616', '3', 'yorgos.kordelas@gmail.com', 'KORDELAS GEORGIOS');
INSERT INTO `mail` VALUES ('617', '3', 'lara.bartalucci78@gmail.com', 'BARTALUCCI LARA');
INSERT INTO `mail` VALUES ('618', '3', 'robertascali@virgilio.it', 'SCALI ROBERTA');
INSERT INTO `mail` VALUES ('619', '3', 'cinzia@comeinviaggio.it', 'BOLOGNESI CINZIA');
INSERT INTO `mail` VALUES ('620', '3', 'pedretti.cristina@alice.it', 'PEDRETTI CRISTINA');
INSERT INTO `mail` VALUES ('621', '3', 'eleonoracampi@hotmail.com', 'CAMPI ELEONORA');
INSERT INTO `mail` VALUES ('622', '3', 'mbacconi@yahoo.it', 'BACCONI MICHELA');
INSERT INTO `mail` VALUES ('623', '3', 'giotor78@yahoo.it', 'MANGIA GIOVANNI');
INSERT INTO `mail` VALUES ('624', '3', 'testagiuliana@virgilio.it', 'TESTA GIULIANA');
INSERT INTO `mail` VALUES ('625', '3', 'carmenyellow@hotmail.it', 'SCIARAFFA CARMELA');
INSERT INTO `mail` VALUES ('626', '3', 'gentjan1979@yahoo.com', 'KACI GENTJAN');
INSERT INTO `mail` VALUES ('627', '3', 'isabetty@libero.it', 'GUASCONI ELISABETTA');
INSERT INTO `mail` VALUES ('628', '3', 'roby-fulmine-92@hotmail.it', 'LA ROCCA ROBERTO');
INSERT INTO `mail` VALUES ('629', '3', 'tiziana.castiglione@tin.it', 'CASTIGLIONE TIZIANA');
INSERT INTO `mail` VALUES ('630', '3', 'criser@katamail.com', 'SERAFINI CRISTINA');
INSERT INTO `mail` VALUES ('631', '3', 'anastasia822od@yahoo.it', 'COMIN ALESSANDRA');
INSERT INTO `mail` VALUES ('632', '3', 'ciusca@tin.it', 'SCARPELLI CINZIA');
INSERT INTO `mail` VALUES ('633', '3', 'andrilorifilia@alice.it', 'GIORGI MARTA MARIA');
INSERT INTO `mail` VALUES ('634', '3', 'nannis@unisi.it', 'NANNINI MICHELA');
INSERT INTO `mail` VALUES ('635', '3', 'fra_guido@hotmail.it', 'GUIDO FRANCESCA');
INSERT INTO `mail` VALUES ('636', '3', 'giuliana.ciaffarafa@tin.it', 'CIAFFARAFA GIULIANA');
INSERT INTO `mail` VALUES ('637', '3', 'muraca4@hotmail.com', 'MURACA MARIA CARMELA');
INSERT INTO `mail` VALUES ('638', '3', 'tommarras@me.com', 'MARRAS TOMMASO');
INSERT INTO `mail` VALUES ('639', '3', 'pecoraro@unina.it', 'PECORARO CARMINE');
INSERT INTO `mail` VALUES ('640', '3', 'lucarbonaro@virgilio.it', 'CARBONARO LUCIA');
INSERT INTO `mail` VALUES ('641', '3', 'doriana.deleonardis@libero.it', 'DE LEONARDIS DORIANA');
INSERT INTO `mail` VALUES ('642', '3', 'giulia.vaselli@hotmail.it', 'VASELLI GIULIA');
INSERT INTO `mail` VALUES ('643', '3', 'donatellagabellieri@gmail.com', 'GABELLIERI DONATELLA');
INSERT INTO `mail` VALUES ('644', '3', 'carlorenatopondrelli@gmail.com', 'PONDRELLI CARLO RENATO');
INSERT INTO `mail` VALUES ('645', '3', 'susanna.cammisa@email.it', 'CAMMISA SUSANNA');
INSERT INTO `mail` VALUES ('646', '3', 'donatapierangioli@libero.it', 'PIERANGIOLI DONATA');
INSERT INTO `mail` VALUES ('647', '3', 'sarabacelli@libero.it', 'BACELLI SARA');
INSERT INTO `mail` VALUES ('648', '3', 'diegosebastian@hotmail.it', 'TERZIANI DIEGO SEBASTIAN');
INSERT INTO `mail` VALUES ('649', '3', 'francescapannini@hotmail.it', 'PANNINI FRANCESCA');
INSERT INTO `mail` VALUES ('650', '3', 'emanuela.alvino@me.com', 'ALVINO EMANUELA');
INSERT INTO `mail` VALUES ('651', '3', 'fillyter@libero.it', 'TERMINE FILLY');
INSERT INTO `mail` VALUES ('652', '3', 'andrea.cappelli94@gmail.com', 'CAPPELLI ANDREA');
INSERT INTO `mail` VALUES ('653', '3', 'lisacrestileoncini@alice.it', 'CRESTI LISA');
INSERT INTO `mail` VALUES ('654', '3', 'cardinaliluca1968@yahoo.it', 'CARDINALI LUCA');
INSERT INTO `mail` VALUES ('655', '3', 'hakagentiana@yahoo.it', 'HAKA GENTIANA');
INSERT INTO `mail` VALUES ('656', '3', 'dorina.stringa@gmail.com', 'STRINGA DORINA');
INSERT INTO `mail` VALUES ('657', '3', 'brandini.chiara@gmail.com', 'BRANDINI CHIARA');
INSERT INTO `mail` VALUES ('658', '3', 'danielastringa@gmail.com', 'STRINGA DANIELA');
INSERT INTO `mail` VALUES ('659', '3', 'totta04@yahoo.it', 'SENNI CARLOTTA');
INSERT INTO `mail` VALUES ('660', '3', 'chiarabiagiotti@hotmail.com', 'BIAGIOTTI CHIARA');
INSERT INTO `mail` VALUES ('661', '3', 'kim.chen1974@gmail.com', 'CHEN KIM MUA');
INSERT INTO `mail` VALUES ('662', '3', 'frati.federico@libero.it', 'GAFFORIO CHIARA');
INSERT INTO `mail` VALUES ('663', '3', 'supermerope@virgilio.it', 'FALCONE MARIA');
INSERT INTO `mail` VALUES ('664', '3', 'silviacmp@virgilio.it', 'CAMPOPIANO SILVIA');
INSERT INTO `mail` VALUES ('665', '3', 'loagne@me.com', 'AGNELLI LORENZO');
INSERT INTO `mail` VALUES ('666', '3', 'veronica@pasqualetti.net', 'PASQUALETTI VERONICA');
INSERT INTO `mail` VALUES ('667', '3', 'melachecca@virgilio.it', 'GAGGELLI MONICA');
INSERT INTO `mail` VALUES ('668', '3', 'lu.federica@libero.it', 'LUCCHI FEDERICA');
INSERT INTO `mail` VALUES ('669', '3', 'totirizzo@libero.it', 'RIZZO SALVATORE');
INSERT INTO `mail` VALUES ('670', '3', 'elisabetta.guagnano@email.it', 'GUAGNANO ELISABETTA');
INSERT INTO `mail` VALUES ('671', '3', 'stefano.ferri@gapsiena.it', 'MORICCIANI BARBARA');
INSERT INTO `mail` VALUES ('672', '3', 'mik.san@virgilio.it', 'MICHELI SANDRA');
INSERT INTO `mail` VALUES ('673', '3', 'cocozpaola@gmail.com', 'COCOZZA PAOLA');
INSERT INTO `mail` VALUES ('674', '3', 'serafini.michela@virgilio.it', 'SERAFINI MICHELA');
INSERT INTO `mail` VALUES ('675', '3', 'gemmastecchi@gmail.com', 'STECCHI GEMMA');
INSERT INTO `mail` VALUES ('676', '3', 'cria93xte@hotmail.it', 'ARFELLI CRISTIANA');
INSERT INTO `mail` VALUES ('677', '3', 'dania.coddi@virgilio.it', 'ALLEGRENE ANDREA');
INSERT INTO `mail` VALUES ('678', '3', 'roberto.bozzi@tin.it', 'BOZZI ROBERTO');
INSERT INTO `mail` VALUES ('679', '3', 'amatoalessandr@libero.it', 'AMATO ALESSANDRA');
INSERT INTO `mail` VALUES ('680', '3', 'annatosi45@yahoo.it', 'TOSI ANNA');
INSERT INTO `mail` VALUES ('681', '3', 'claudiococchia@libero.it', 'COCCHIA CLAUDIO');
INSERT INTO `mail` VALUES ('682', '3', 'mteresa.greco@libero.it', 'GRECO MARIA TERESA');
INSERT INTO `mail` VALUES ('683', '3', 'brogi.s@libero.it', 'BROGI SILVIA');
INSERT INTO `mail` VALUES ('684', '3', 'vittoria.baker@libero.it', 'BAKER VITTORIA');
INSERT INTO `mail` VALUES ('685', '3', 'drngoyi@hotmail.com', 'NGOYI KYPA');
INSERT INTO `mail` VALUES ('686', '3', 'angelinisusanna@simail.it', 'ANGELINI SUSANNA');
INSERT INTO `mail` VALUES ('687', '3', 'pasqu8@libero.it', 'GNONI PASQUALE');
INSERT INTO `mail` VALUES ('688', '3', 'f.palmieri@gmail.com', 'PALMIERI FABIO');
INSERT INTO `mail` VALUES ('689', '3', 'sulstini@libero.it', 'ASLLANI SULSANA');
INSERT INTO `mail` VALUES ('690', '3', 'elisabetta.cresti@poggioallerose.com', 'CRESTI ELISABETTA');
INSERT INTO `mail` VALUES ('691', '3', 'claudiocalvino@libero.it', 'CALVINO CLAUDIO');
INSERT INTO `mail` VALUES ('692', '3', 'simonettamensini@gmail.com', 'MENSINI SIMONETTA');
INSERT INTO `mail` VALUES ('693', '3', 'beatrice.grilli@tin.it', 'GRILLI BEATRICE');
INSERT INTO `mail` VALUES ('694', '3', 'ro.morabito@alice.it', 'MORABITO ROSA MARIA');
INSERT INTO `mail` VALUES ('695', '3', 'alexandragreco84@libero.it', 'GRECO ALESSANDRA');
INSERT INTO `mail` VALUES ('696', '3', 'claralopiano@live.it', 'LOPIANO CLARA');
INSERT INTO `mail` VALUES ('697', '3', 'luca.landi@bianchielettronica.com', 'LANDI LUCA');
INSERT INTO `mail` VALUES ('698', '3', 'ng69@hotmail.it', 'SICILLO LUCIA');
INSERT INTO `mail` VALUES ('699', '3', 'stefanobongarzone@hotmail.com', 'BONGARZONE STEFANO');
INSERT INTO `mail` VALUES ('700', '3', 'scoccia.ga@libero.it', 'SCOCCIA GIANNANDREA');
INSERT INTO `mail` VALUES ('701', '3', 'giuseppina.prandi@libero.it', 'PRANDI GIUSEPPINA');
INSERT INTO `mail` VALUES ('702', '3', 'clydereverdy@yahoo.it', 'NANA CLYDE');
INSERT INTO `mail` VALUES ('703', '3', 'rossella.nemo@libero.it', 'TESTI ROSSELLA');
INSERT INTO `mail` VALUES ('704', '3', 'laurenceolivard@alice.it', 'OLIVARD LAURENCE');
INSERT INTO `mail` VALUES ('705', '3', 'ali87@email.it', 'FRANCESCHI ALICE');
INSERT INTO `mail` VALUES ('706', '3', 'raffaellanapolitano@virgilio.it', 'NAPOLITANO RAFFAELLA');
INSERT INTO `mail` VALUES ('707', '3', 'bruna@tenutetoscane.com', 'BARONCINI BRUNA');
INSERT INTO `mail` VALUES ('708', '3', 'sabrina.cioni@gmail.com', 'CIONI SABRINA');
INSERT INTO `mail` VALUES ('709', '3', 'angela.carletti@virgilio.it', 'CARLETTI ANGELA');
INSERT INTO `mail` VALUES ('710', '3', 'simonalenzini@alice.it', 'LENZINI SIMONA');
INSERT INTO `mail` VALUES ('711', '3', 'taniacampagna@hotmail.it', 'CAMPAGNA TANIA');
INSERT INTO `mail` VALUES ('712', '3', 'cgiomini@alice.it', 'GIOMINI CLAUDIO');
INSERT INTO `mail` VALUES ('713', '3', 'maddalenalofiego@yahoo.it', 'LOFIEGO MADDALENA');
INSERT INTO `mail` VALUES ('714', '3', 'jyxi983@iab.com', 'XIAN JIANG');
INSERT INTO `mail` VALUES ('715', '3', 'fcaroni99@libero.it', 'GROPPI FEDERICA');
INSERT INTO `mail` VALUES ('716', '3', 'malikat2013@yahoo.it', 'ZENINE MALIKA');
INSERT INTO `mail` VALUES ('717', '3', 'antorossi3@yahoo.it', 'ROSSI ANTONELLA');
INSERT INTO `mail` VALUES ('718', '3', 'ladyviv@libero.it', 'SANTARSIERE ALESSANDRO');
INSERT INTO `mail` VALUES ('719', '3', 'b.sandretti@vodafone.it', 'SANDRETTI BRUNA');
INSERT INTO `mail` VALUES ('720', '3', 'eleonora.pugliese@studiolegalepugliese.net', 'PUGLIESE ELEONORA');
INSERT INTO `mail` VALUES ('721', '3', 'antoeclaudio@gmail.com', 'TARANTINO ANTONELLA');
INSERT INTO `mail` VALUES ('722', '3', 'guerrini59@libero.it', 'GUERRINI ELISABETTA');
INSERT INTO `mail` VALUES ('723', '3', 'mariella.74@hotmail.it', 'ADRAGNA MARIELLA');
INSERT INTO `mail` VALUES ('724', '3', 'francescolombardi7@gmail.com', 'LOMBARDI FRANCESCO');
INSERT INTO `mail` VALUES ('725', '3', 'alla.but@hotmail.com', 'BUT ALLA');
INSERT INTO `mail` VALUES ('726', '3', 'silvia.bigliazzi@libero.it', 'BIGLIAZZI SILVIA');
INSERT INTO `mail` VALUES ('727', '3', 'sandravannini@tin.it', 'VANNINI SANDRA');
INSERT INTO `mail` VALUES ('728', '3', 'elisabettalberti@gmail.com', 'ALBERTI ELISABETTA');
INSERT INTO `mail` VALUES ('729', '3', 'laura_ponticelli@hotmail.com', 'PONTICELLI LAURA');
INSERT INTO `mail` VALUES ('730', '3', 'anna_vanzo@libero.it', 'GUERRA BARBARA');
INSERT INTO `mail` VALUES ('731', '3', 'mfalchi2008@gmail.com', 'CANTELLI SUSANNA');
INSERT INTO `mail` VALUES ('732', '3', 'francesco_nm@hotmail.it', 'NARNI MANCINELLI FRANCESCO');
INSERT INTO `mail` VALUES ('733', '3', 'sandrarossi54@libero.it', 'ROSSI BARONI SANDRA');
INSERT INTO `mail` VALUES ('734', '3', 'snooooopsss@msn.com', 'MOLINO ANNACHIARA');
INSERT INTO `mail` VALUES ('735', '3', 'elenacavari@yahoo.it', 'CAVARI ELENA');
INSERT INTO `mail` VALUES ('736', '3', 'cinzia.benocci@yahoo.it', 'BENOCCI CINZIA');
INSERT INTO `mail` VALUES ('737', '3', 'bruni.m@live.it', 'BRUNI MANUELA');
INSERT INTO `mail` VALUES ('738', '3', 'cristina.giorgi2260@gmail.com', 'GIORGI CRISTINA');
INSERT INTO `mail` VALUES ('739', '3', 'simona_ludovico@libero.it', 'FABBRI MARIA SIMONA');
INSERT INTO `mail` VALUES ('740', '3', 'gabrivannozzi@gmail.com', 'VANNOZZI GABRIELLA');
INSERT INTO `mail` VALUES ('741', '3', 'manuelaromano1979@libero.it', 'ROMANO MANUELA');
INSERT INTO `mail` VALUES ('742', '3', 'lunam.grazia@libero.it', 'LUNA MARIA GRAZIA');
INSERT INTO `mail` VALUES ('743', '3', 'marzia.dispinseri@hotmail.it', 'DISPINSERI MARZIA');
INSERT INTO `mail` VALUES ('744', '3', 'polimichela@libero.it', 'POLI MICHELA');
INSERT INTO `mail` VALUES ('745', '3', 'jacopo.frediani@gmail.com', 'FREDIANI JACOPO');
INSERT INTO `mail` VALUES ('746', '3', 'fedecorbelli@hotmail.it', 'CORBELLI FEDERICO');
INSERT INTO `mail` VALUES ('747', '3', 'sisaioete@hotmail.it', 'FANTONI SIMONE');
INSERT INTO `mail` VALUES ('748', '3', 'monacoemanuela@tiscali.it', 'MONACO EMANUELA');
INSERT INTO `mail` VALUES ('749', '3', 'edison.omeri@hotmail.it', 'OMERI EDISON');
INSERT INTO `mail` VALUES ('750', '3', 'egizia.cappellini@gmail.com', 'CAPPELLINI EGIZIA');
INSERT INTO `mail` VALUES ('751', '3', 'elenasolari17@gmail.com', 'SOLARI MARIA ELENA');
INSERT INTO `mail` VALUES ('752', '3', 'pietroburroni@alice.it', 'BURRONI PIETRO');
INSERT INTO `mail` VALUES ('753', '3', 'marziamarchetti@alice.it', 'MARCHETTI MARZIA');
INSERT INTO `mail` VALUES ('754', '3', 'sonia.calz@gmail.com', 'CALZERONI SONIA');
INSERT INTO `mail` VALUES ('755', '3', 'maulire@gmail.com', 'CAMMALIRE MAURIZIO');
INSERT INTO `mail` VALUES ('756', '3', 'cati4@hotmail.it', 'BRIGANTI CATERINA');
INSERT INTO `mail` VALUES ('757', '3', 'russo.giulia10@hotmail.it', 'RUSSO GIULIA');
INSERT INTO `mail` VALUES ('758', '3', 'michelemonica92@gmail.com', 'MONICA MICHELE');
INSERT INTO `mail` VALUES ('759', '3', 'carminecompagnone@virgilio.it', 'COMPAGNONE CARMINE');
INSERT INTO `mail` VALUES ('760', '3', 'maggichela@katamail.com', 'MAGGI MICHELA');
INSERT INTO `mail` VALUES ('761', '3', 'margherossi@hotmail.it', 'ROSSI MARGHERITA');
INSERT INTO `mail` VALUES ('762', '3', 'leandrooriglia@yahoo.it', 'ORIGLIA LEANDRO');
INSERT INTO `mail` VALUES ('763', '3', 'nobu.enotecaitaliana@gmail.com', 'SUZUKI NOBUHIKO');
INSERT INTO `mail` VALUES ('764', '3', 'alessandra.benci@gmail.com', 'BENCI ALESSANDRA');
INSERT INTO `mail` VALUES ('765', '3', 'cecilia.cattaneo@tin.it', 'CATTANEO CECILIA');
INSERT INTO `mail` VALUES ('766', '3', 'laurabonelli@hotmail.com', 'BONELLI LAURA');
INSERT INTO `mail` VALUES ('767', '3', 'paolaviviani@yahoo.it', 'VIVIANI PAOLA');
INSERT INTO `mail` VALUES ('768', '3', 'apolzinetti@me.com', 'POLZINETTI ALESSANDRA');
INSERT INTO `mail` VALUES ('769', '3', 'samy19ef@hotmail.it', 'FALCIANI SAMANTHA');
INSERT INTO `mail` VALUES ('770', '3', 'mariacaraceni@inwind.it', 'CARACENI MARIA LAURA');
INSERT INTO `mail` VALUES ('771', '3', 'paolo.grafix@alice.it', 'ROMAGNOLO LAURA');
INSERT INTO `mail` VALUES ('772', '3', 'albataaa@hotmail.it', 'CARTA ALBA');
INSERT INTO `mail` VALUES ('773', '3', 'sere.v87@alice.it', 'VANNONI SERENA');
INSERT INTO `mail` VALUES ('774', '3', 'barbara.giardinovalente@istruzione.it', 'GIARDINO VALENTE BARBARA');
INSERT INTO `mail` VALUES ('775', '3', 'ilariacione@libero.it', 'CIONE GINA ILARIA');
INSERT INTO `mail` VALUES ('776', '3', 'valentina.lupo@hotmail.it', 'LUPO VALENTINA');
INSERT INTO `mail` VALUES ('777', '3', 'samy1234@alice.it', 'MANCINI FEDERICO');
INSERT INTO `mail` VALUES ('778', '3', 'brigittacortigiani@gmail.com', 'CORTIGIANI BRIGITTA');
INSERT INTO `mail` VALUES ('779', '3', 'chicca.2109@libero.it', 'FRANCALANCI DALIA');
INSERT INTO `mail` VALUES ('780', '3', 'gabrycocco16@hotmail.it', 'CUCCURULLO GABRIELE');
INSERT INTO `mail` VALUES ('781', '3', 'pipezza@hotmail.it', 'IOELE GIUSY');
INSERT INTO `mail` VALUES ('782', '3', 'wenjinglu522@hotmail.com', 'LU WEN JMG');
INSERT INTO `mail` VALUES ('783', '3', 'minavalentini@alice.it', 'VALENTINI MINA');
INSERT INTO `mail` VALUES ('784', '3', 'veneziamauro@hotmail.it', 'VENEZIA MAURO');
INSERT INTO `mail` VALUES ('785', '3', 'alessia.berni@gmail.com', 'BERNI ALESSIA');
INSERT INTO `mail` VALUES ('786', '3', 'gpmarroni@libero.it', 'MARRONI GUGLIELMA');
INSERT INTO `mail` VALUES ('787', '3', 'margheoca@hotmail.it', 'MARRI MARGHERITA');
INSERT INTO `mail` VALUES ('788', '3', 'chiarafusi2012@libero.it', 'FUSI CHIARA');
INSERT INTO `mail` VALUES ('789', '3', 'lep95@libero.it', 'SADOWSKA LIDIA');
INSERT INTO `mail` VALUES ('790', '3', 'soldino2001@libero.it', 'SOLDANI FRANCESCO');
INSERT INTO `mail` VALUES ('791', '3', 'g.alessandra89@alice.it', 'GARGIANI ALESSANDRA');
INSERT INTO `mail` VALUES ('792', '3', 'pepperosario@gmail.com', 'PEPPE ROSARIO');
INSERT INTO `mail` VALUES ('793', '3', 'info@danielecasella.com', 'CASELLA DANIELE');
INSERT INTO `mail` VALUES ('794', '3', 's.gianna@email.it', 'SANTARSIERO GIANNA');
INSERT INTO `mail` VALUES ('795', '3', 'deangelisrenzi@hotmail.it', 'RENZI BARBARA');
INSERT INTO `mail` VALUES ('796', '3', 'romina.romi@virgilio.it', 'GIUBBILEI ROMINA');
INSERT INTO `mail` VALUES ('797', '3', 'martavale27@gmail.com', 'VALENTINI MARTA');
INSERT INTO `mail` VALUES ('798', '3', 'ilmuzii@tin.it', 'MUZII ILARIA');
INSERT INTO `mail` VALUES ('799', '3', 'benarme@libero.it', 'ARMELLINI BENEDETTA');
INSERT INTO `mail` VALUES ('800', '3', 'isabella.rossi@banca.mps.it', 'ROSSI ISABELLA');
INSERT INTO `mail` VALUES ('801', '3', 'sonia.bonifacio15@gmail.com', 'BONIFACIO SONIA');
INSERT INTO `mail` VALUES ('802', '3', 'sabrina.libertini@gmail.com', 'LIBERTINI SABRINA');
INSERT INTO `mail` VALUES ('803', '3', 'elisalazzeri@hotmail.it', 'LAZZERI ELISA');
INSERT INTO `mail` VALUES ('804', '3', 'laurasemboli@gmail.com', 'SEMBOLI LAURA');
INSERT INTO `mail` VALUES ('805', '3', 'daria_cos@hotmail.com', 'COSENZA DARIA');
INSERT INTO `mail` VALUES ('806', '3', 'camaiani@alice.it', 'SCALI MANOLA');
INSERT INTO `mail` VALUES ('807', '3', 'claudiagarosi@gmail.com', 'GAROSI CLAUDIA');
INSERT INTO `mail` VALUES ('808', '3', 'stevetall_92@hotmail.com', 'STEVEN TALL');
INSERT INTO `mail` VALUES ('809', '3', 'giulia.riviello@live.it', 'DI MEO ILARIA');
INSERT INTO `mail` VALUES ('810', '3', 'stefania.biagi@sienamotori.it', 'BIAGI STEFANIA');
INSERT INTO `mail` VALUES ('811', '3', 'giorgia.cola@aliceposta.it', 'COLAFRANCESCHI GIORGIA');
INSERT INTO `mail` VALUES ('812', '3', 'prisco.piscitelli@virgilio.it', 'PISCITELLI PRISCO');
INSERT INTO `mail` VALUES ('813', '3', 'teresa.cicero@gmail.com', 'CICERO TERESA');
INSERT INTO `mail` VALUES ('814', '3', 'benedetta.ancarola@gmail.com', 'ANCAROLA BENEDETTA');
INSERT INTO `mail` VALUES ('815', '3', 'carot88@hotmail.it', 'CAROTENUTO MARIO');
INSERT INTO `mail` VALUES ('816', '3', 'mary.9395@hotmail.it', 'ANDRISANO MARIANTONIETTA');
INSERT INTO `mail` VALUES ('817', '3', 'romans@hotmail.it', 'GREGNI FRANCESCA ROMANA');
INSERT INTO `mail` VALUES ('818', '3', 'castellaneta.laura@gmail.com', 'CASTELLANETA LAURA');
INSERT INTO `mail` VALUES ('819', '3', 'aga2004@virgilio.it', 'GIANNETTI GESSICA');
INSERT INTO `mail` VALUES ('820', '3', 'stefaniacirrito@yahoo.it', 'CIRRITO STEFANIA');
INSERT INTO `mail` VALUES ('821', '3', 'elisamanieri@hotmail.it', 'MANIERI ELISA');
INSERT INTO `mail` VALUES ('822', '3', 'info@studioenia.it', 'BELLINI VALENTINA');
INSERT INTO `mail` VALUES ('823', '3', 'ffineschisergardi@yahoo.it', 'FINESCHI SERGARDI FLAMINIA');
INSERT INTO `mail` VALUES ('824', '3', 'isabella_lucentini@hotmail.it', 'LUCENTINI ISABELLA');
INSERT INTO `mail` VALUES ('825', '3', 'patrizia.corradeschi@banca.mps.it', 'CORRADESCHI PATRIZIA');
INSERT INTO `mail` VALUES ('826', '3', 'm.lety@live.it', 'PARETI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('827', '3', 'francaprati@yahoo.it', 'PRATTICHIZZO FRANCESCA');
INSERT INTO `mail` VALUES ('828', '3', 'giampiero.cito@milc.it', 'CITO GIAMPIERO');
INSERT INTO `mail` VALUES ('829', '3', 'criguasta@yahoo.it', 'GUASTAMACCHIA CRISTINA');
INSERT INTO `mail` VALUES ('830', '3', 'giambattista.pepe@email.it', 'PEPE GIAMBATTISTA');
INSERT INTO `mail` VALUES ('831', '3', 'sara-mazza@hotmail.it', 'MAZZA SARA');
INSERT INTO `mail` VALUES ('832', '3', 'irene.bartalucci@gmail.com', 'BARTALUCCI IRENE');
INSERT INTO `mail` VALUES ('833', '3', 'emily.cortigiani@gmail.com', 'CORTIGIANI EMILY');
INSERT INTO `mail` VALUES ('834', '3', 'c.fondelli@tin.it', 'FONDELLI CECILIA');
INSERT INTO `mail` VALUES ('835', '3', 'maura.capezzuoli@alice.it', 'CAPEZZUOLI MAURA');
INSERT INTO `mail` VALUES ('836', '3', 'irenemattei9@gmail.com', 'MATTEI IRENE');
INSERT INTO `mail` VALUES ('837', '3', 'mariannatoth@hotmail.com', 'TOTH MARIANE');
INSERT INTO `mail` VALUES ('838', '3', 'stefaniabonelli@libero.it', 'BONELLI STEFANIA');
INSERT INTO `mail` VALUES ('839', '3', 'clairejolie@hotmail.it', 'SIMONETTI CHIARA');
INSERT INTO `mail` VALUES ('840', '3', 'elisafabbri11@gmail.com', 'FABBRI ELISA');
INSERT INTO `mail` VALUES ('841', '3', 'elisadigoro@virgilio.it', 'DI GORO ELISA');
INSERT INTO `mail` VALUES ('842', '3', 'maria.voltolini@gmail.com', 'VOLTOLINI MARIA');
INSERT INTO `mail` VALUES ('843', '3', 'barbarossa@hotmail.it', 'BARBETTI EMANUELE');
INSERT INTO `mail` VALUES ('844', '3', 'cavicchioli.e@libero.it', 'CAVICCHIOLI ELISA');
INSERT INTO `mail` VALUES ('845', '3', 'ivocostanzo@alice.it', 'COSTANZO IVO');
INSERT INTO `mail` VALUES ('846', '3', 'vchellini@alice.it', 'DONAZZOLO GIUSTINA');
INSERT INTO `mail` VALUES ('847', '3', 'laura_amoroso@yahoo.it', 'AMOROSO LAURA');
INSERT INTO `mail` VALUES ('848', '3', 'graziano1204@hotmail.com', 'BALPINO GRAZIANO');
INSERT INTO `mail` VALUES ('849', '3', 'angelabenelli@alice.it', 'BENELLI ANGELA');
INSERT INTO `mail` VALUES ('850', '3', 'e.mariangelalongo@gmail.com', 'LONGO MARIANGELA');
INSERT INTO `mail` VALUES ('851', '3', 'stefaniacavallini8@gmail.com', 'CAVALLINI STEFANIA');
INSERT INTO `mail` VALUES ('852', '3', 'cavicchiolilaura.la@gmail.com', 'CAVICCHIOLI LAURA');
INSERT INTO `mail` VALUES ('853', '3', 'maria.durante@interno.it', 'DURANTE MARIA');
INSERT INTO `mail` VALUES ('854', '3', 'dndamelio@yahoo.it', 'D AMELIO DANIELE');
INSERT INTO `mail` VALUES ('855', '3', 'max_leoni@libero.it', 'LEONI MASSIMILIANO');
INSERT INTO `mail` VALUES ('856', '3', 'giorgiobotarelli@libero.it', 'PERI GILIALA');
INSERT INTO `mail` VALUES ('857', '3', 'sanfra.bagnai@comune.siena.it', 'BAGNAI SANDRA');
INSERT INTO `mail` VALUES ('858', '3', 'cinzia.der@gmail.it', 'DE ROSSI CINZIA');
INSERT INTO `mail` VALUES ('859', '3', 'luanaticci@hotmail.it', 'TICCI LUANA');
INSERT INTO `mail` VALUES ('860', '3', 'ambratic@hotmail.it', 'TICCI AMBRA');
INSERT INTO `mail` VALUES ('861', '3', 'luana.ruffo@gmail.com', 'RUFFO LUANA');
INSERT INTO `mail` VALUES ('862', '3', 'chiarap._89@hotmail.it', 'PELLEGRINI CHIARA');
INSERT INTO `mail` VALUES ('863', '3', 'luisella.franco@libero.it', 'FRANCO LUISELLA');
INSERT INTO `mail` VALUES ('864', '3', 'fridaseconda@alice.it', 'BINI SANDRO');
INSERT INTO `mail` VALUES ('865', '3', 'saldipuma@hotmail.com', 'DI PUMA SALVATORE');
INSERT INTO `mail` VALUES ('866', '3', 'brunomussari@libero.it', 'MUSSARI BRUNO');
INSERT INTO `mail` VALUES ('867', '3', 'a.battaglia@icloud.com', 'BATTAGLIA ALESSANDRA');
INSERT INTO `mail` VALUES ('868', '3', 'jgagliardi@libero.it', 'GAGLIARDI JANA');
INSERT INTO `mail` VALUES ('869', '3', 'giulia.guadalupi@libero.it', 'GUADALUPI GIULIA');
INSERT INTO `mail` VALUES ('870', '3', 'valle.raff@hotmail.it', 'VALLE RAFFAELLA');
INSERT INTO `mail` VALUES ('871', '3', 'elisatoti@hotmail.com', 'TOTI ELISA');
INSERT INTO `mail` VALUES ('872', '3', 'federica_zizzi@hotmail.it', 'ZIZZI FEDERICA');
INSERT INTO `mail` VALUES ('873', '3', 'l.vagellini@alice.it', 'VAGELLINI LORETTA');
INSERT INTO `mail` VALUES ('874', '3', 'simona.ruggieri@email.it', 'RUGGIERI SIMONA');
INSERT INTO `mail` VALUES ('875', '3', 'lisaokk-@hotmail.it', 'OCCHINI LISA');
INSERT INTO `mail` VALUES ('876', '3', 'ricciarella@hotmail.it', 'SORCE MARTA');
INSERT INTO `mail` VALUES ('877', '3', 'anapul@yahoo.it', 'MALESCI ALESSANDRA');
INSERT INTO `mail` VALUES ('878', '3', 'soniaboldr@gmail.com', 'BOLDRINI SONIA');
INSERT INTO `mail` VALUES ('879', '3', 'favilli.moni14@libero.it', 'FAVILLI MONICA');
INSERT INTO `mail` VALUES ('880', '3', 'criscolucci@libero.it', 'COLUCCIA CRISTINA');
INSERT INTO `mail` VALUES ('881', '3', 'verodicle@hotmail.it', 'DI CLEMENTE VERONICA');
INSERT INTO `mail` VALUES ('882', '3', 'giuliafogli74@yahoo.it', 'FOGLIA GIULIA');
INSERT INTO `mail` VALUES ('883', '3', 'anto.joy94@hotmail.it', 'GIOIA ANTONIO');
INSERT INTO `mail` VALUES ('884', '3', 'bertoldiilaria@libero.it', 'BERTOLDI ILARIA');
INSERT INTO `mail` VALUES ('885', '3', 'giommarelli@libero.it', 'GIOMMARELLI ROSSELLA');
INSERT INTO `mail` VALUES ('886', '3', 'cristina.borgogni@libero.it', 'BORGOGNI CRISTINA');
INSERT INTO `mail` VALUES ('887', '3', 'luca54@virgilio.it', 'MACCHIONI GIANLUCA');
INSERT INTO `mail` VALUES ('888', '3', 'sandra_donati@hotmail.it', 'DONATI SANDRA');
INSERT INTO `mail` VALUES ('889', '3', 'francesca_brunelli@yahoo.it', 'BRUNELLI FRANCESCA');
INSERT INTO `mail` VALUES ('890', '3', 'leonardo.doino@libero.it', 'DOINO LEONARDO');
INSERT INTO `mail` VALUES ('891', '3', 'dogg_style@hotmail.it', 'TENOLLI RED');
INSERT INTO `mail` VALUES ('892', '3', 'valemi2003@libero.it', 'CIONCOLINI VALENTINA');
INSERT INTO `mail` VALUES ('893', '3', 'mariafb@live.it', 'BICCI MARIA FRANCESCA');
INSERT INTO `mail` VALUES ('894', '3', 'cinziavoltolini@gmail.com', 'VOLTOLINI CINZIA');
INSERT INTO `mail` VALUES ('895', '3', 'ester_lillo@yahoo.it', 'LILLO ESTER');
INSERT INTO `mail` VALUES ('896', '3', 'dona18@email.it', 'BARI DONATELLA');
INSERT INTO `mail` VALUES ('897', '3', 'ilberre@libero.it', 'BERRETTINI FRANCESCO');
INSERT INTO `mail` VALUES ('898', '3', 'ilaria.senni@gmail.com', 'SENNI ILARIA');
INSERT INTO `mail` VALUES ('899', '3', 'bpagliai@gmail.com', 'PAGLIAI BEATRICE');
INSERT INTO `mail` VALUES ('900', '3', 'ilariabichi77@libero.it', 'BICHI ILARIA');
INSERT INTO `mail` VALUES ('901', '3', 'marina.lorenzi@alice.it', 'MICHELLI LORENZI MARINA');
INSERT INTO `mail` VALUES ('902', '3', 'stromillo@gmail.com', 'STROMILLO MARIA LAURA');
INSERT INTO `mail` VALUES ('903', '3', 'enzo.1988@hotmail.it', 'TIRALOSI VINCENZO ALDO');
INSERT INTO `mail` VALUES ('904', '3', 'colzaniluca75@gmail.com', 'COIZANI LUCA');
INSERT INTO `mail` VALUES ('905', '3', 'silviamart2000@gmail.com', 'MARTELLI SILVIA');
INSERT INTO `mail` VALUES ('906', '3', 'alina923@libero.it', 'SESTINI ALESSIA');
INSERT INTO `mail` VALUES ('907', '3', 'nicolabaldi@libero.it', 'BALDI NICOLA');
INSERT INTO `mail` VALUES ('908', '3', 'lorelabe@libero.it', 'FORCILLO MARIA LORENA');
INSERT INTO `mail` VALUES ('909', '3', 'birego@teletu.it', 'REGOLI BARBARA');
INSERT INTO `mail` VALUES ('910', '3', 'c.frolla@gmail.com', 'FROLLA CLAUDIA');
INSERT INTO `mail` VALUES ('911', '3', 'vittoria.caruso@hotmail.it', 'CARUSO VITTORIA');
INSERT INTO `mail` VALUES ('912', '3', 'silviapoggialini@hotmail.it', 'POGGIALINI SILVIA');
INSERT INTO `mail` VALUES ('913', '3', 'paola.mariotti@inwind.it', 'MARIOTTI PAOLA');
INSERT INTO `mail` VALUES ('914', '3', 'mariadisarno@gmail.com', 'DI SARNO MARIA');
INSERT INTO `mail` VALUES ('915', '3', 'agnese.magnani@unisi.it', 'MAGNANI AGNESE');
INSERT INTO `mail` VALUES ('916', '3', 'anvernillo@libero.it', 'VERNILLO AMATO NICCOLO');
INSERT INTO `mail` VALUES ('917', '3', 'simonemanganelli@virgilio.it', 'MANGANELLI SIMONE');
INSERT INTO `mail` VALUES ('918', '3', 'carta@studioespositocarta.it', 'CARTA FRANCA');
INSERT INTO `mail` VALUES ('919', '3', 'claudiobenzo@teletu.it', 'BENZO CLAUDIO');
INSERT INTO `mail` VALUES ('920', '3', 'chiaragongguan@gmail.com', 'GONG GUAN');
INSERT INTO `mail` VALUES ('921', '3', 'renzo.cambi@gmail.com', 'CAMBI RENZO');
INSERT INTO `mail` VALUES ('922', '3', 'formoso@hotmail.it', 'FORMOSO LUCA');
INSERT INTO `mail` VALUES ('923', '3', 'vannini.giulia@yahoo.it', 'VANNINI GIULIA');
INSERT INTO `mail` VALUES ('924', '3', 'minucci.roberta@libero.it', 'MINUCCI ROBERTA');
INSERT INTO `mail` VALUES ('925', '3', 'sabina.riccardelli@siae.it', 'RICCARDELLI SABINA');
INSERT INTO `mail` VALUES ('926', '3', 'lorena_ottaviani@virgilio.it', 'OTTAVIANI LORENA');
INSERT INTO `mail` VALUES ('927', '3', 'amato.andrea@virgilio.it', 'AMATO ANDREA');
INSERT INTO `mail` VALUES ('928', '3', 'claama87@hotmail.it', 'ESPOSITO CLAUDIA');
INSERT INTO `mail` VALUES ('929', '3', 'minielisabetta85@yahoo.it', 'MINI ELISABETTA');
INSERT INTO `mail` VALUES ('930', '3', 'idetta.scarpini@gmail.com', 'SCARPINI IDA MARIA');
INSERT INTO `mail` VALUES ('931', '3', 'massimo.fondelli@telenet.be', 'FONDELLI MASSIMO');
INSERT INTO `mail` VALUES ('932', '3', 'alvise.santangelo@gmail.com', 'SANTANGELO ALVISE');
INSERT INTO `mail` VALUES ('933', '3', 'a.fulminis@gmail.com', 'FULMINIS ANTONIETTA');
INSERT INTO `mail` VALUES ('934', '3', 'macinenticristiano@libero.it', 'MACINENTI CRISTIANO');
INSERT INTO `mail` VALUES ('935', '3', 'francesca.mondoinprimopiano@gmail.com', 'BRUNI FRANCESCA');
INSERT INTO `mail` VALUES ('936', '3', 'f.lisinibaldi@gmail.com', 'LISINI BALDI FILIPPO');
INSERT INTO `mail` VALUES ('937', '3', 'ferina9@gmail.com', 'FERI MARIO');
INSERT INTO `mail` VALUES ('938', '3', 'simonepichi@gmail.com', 'PICHI SIMONE');
INSERT INTO `mail` VALUES ('939', '3', 'vince.aronica@gmail.com', 'ARONICA VINCENZO');
INSERT INTO `mail` VALUES ('940', '3', 'riccardogalini@virgilio.it', 'GALINI RICCARDO');
INSERT INTO `mail` VALUES ('941', '3', 'ida.burza@live.it', 'BURZA IDA');
INSERT INTO `mail` VALUES ('942', '3', 'sandra@imballaggibernardi.it', 'PAPACCIVOLI SANDRA');
INSERT INTO `mail` VALUES ('943', '3', 'corrado9@gmail.com', 'MARIANELLI CORRADO');
INSERT INTO `mail` VALUES ('944', '3', 'fateme@inwind.it', 'BANISHOEIB FATEME');
INSERT INTO `mail` VALUES ('945', '3', 'danielaetrusca@gmail.com', 'BUSSAGLI DANIELA');
INSERT INTO `mail` VALUES ('946', '3', 'fantozzicaterina@libero.it', 'FANTOZZI CATERINA');
INSERT INTO `mail` VALUES ('947', '3', 'island8@libero.it', 'ARGILLI ALESSIA');
INSERT INTO `mail` VALUES ('948', '3', 'gnapina@hotmail.it', 'BORDONARO BRUNA');
INSERT INTO `mail` VALUES ('949', '3', 'vanda.amato@yahoo.it', 'AMATO VANDA');
INSERT INTO `mail` VALUES ('950', '3', 'matos0982@hotmail.com', 'MATOS JIMENEZ HECTOR JULIO');
INSERT INTO `mail` VALUES ('951', '3', 'pamelapanu.spinelli@gmail.com', 'SPINELLI PAMELA');
INSERT INTO `mail` VALUES ('952', '3', 'fmanenti2001@yahoo.it', 'MANENTI FEDERICA');
INSERT INTO `mail` VALUES ('953', '3', 'suss.biribissi@gmail.com', 'PANTER SANDRA');
INSERT INTO `mail` VALUES ('954', '3', 'francy.labarbera@yahoo.it', 'LA BARBERA FRANCESCA');
INSERT INTO `mail` VALUES ('955', '3', 'marilena.sansone@gmail.com', 'SANSONE MARILENA');
INSERT INTO `mail` VALUES ('956', '3', 'sergiolandi@libero.it', 'LANDI SERGIO');
INSERT INTO `mail` VALUES ('957', '3', 'lumig2510@hotmail.com', 'FARRO SANTISTEBAN MEDALY');
INSERT INTO `mail` VALUES ('958', '3', 'ilabracconeri@hotmail.com', 'BRACCONERI ILARIA');
INSERT INTO `mail` VALUES ('959', '3', 'latalpessa@hotmail.it', 'GRILLO UMANO');
INSERT INTO `mail` VALUES ('960', '3', 'giuseppebombaci@hotmail.com', 'BOMBACI GIUSEPPE');
INSERT INTO `mail` VALUES ('961', '3', 'am-eagle@live.com', 'BILLA ALBA');
INSERT INTO `mail` VALUES ('962', '3', 'maddy_go@hotmail.it', 'DI PAOLA MADDALENA');
INSERT INTO `mail` VALUES ('963', '3', 'franca.fantacci@libero.it', 'FANTACCI FRANCA');
INSERT INTO `mail` VALUES ('964', '3', 'ccapperucci@hotmail.com', 'CAPPERUCCI CATERINA');
INSERT INTO `mail` VALUES ('965', '3', 'antonellasfondrini@alice.it', 'SFONDRINI ANTONELLA');
INSERT INTO `mail` VALUES ('966', '3', 'marziaciofi@me.it', 'CIOFI MARZIA');
INSERT INTO `mail` VALUES ('967', '3', 'simone_cisco89@yahoo.it', 'ALBANO SIMONE');
INSERT INTO `mail` VALUES ('968', '3', 'anna.raffaelli@libero.it', 'RAFFAELLI ANNA');
INSERT INTO `mail` VALUES ('969', '3', 'joeplay@hotmail.it', 'URSO GIOVANNI');
INSERT INTO `mail` VALUES ('970', '3', 'coemra@yahoo.it', 'COE MAURO');
INSERT INTO `mail` VALUES ('971', '3', 'giudittaelissa@yahoo.it', 'GIUDITTA ELISSA');
INSERT INTO `mail` VALUES ('972', '3', 'gabripica@libero.it', 'PICA GABRIELE');
INSERT INTO `mail` VALUES ('973', '3', 'rossinigianluca1@yahoo.it', 'ROSSINI GIANLUCA');
INSERT INTO `mail` VALUES ('974', '3', 'mariaisabellabecchi@interfree.it', 'BECCHI MARIA ISABELLA');
INSERT INTO `mail` VALUES ('975', '3', 'bassael1@gmail.com', 'BASSANELLI ELISA');
INSERT INTO `mail` VALUES ('976', '3', 'beneventosilvia@libero.it', 'BENEVENTO SILVIA');
INSERT INTO `mail` VALUES ('977', '3', 'antlac@libero.it', 'LACARPIA ANTONIETTA');
INSERT INTO `mail` VALUES ('978', '3', 'letizia.degiorgi@yahoo.it', 'DE GIORGI LETIZIA');
INSERT INTO `mail` VALUES ('979', '3', 'mostardinirosa@gmail.com', 'MOSTARDINI ROSA');
INSERT INTO `mail` VALUES ('980', '3', 'ferrarioc@hotmail.it', 'FERRARIO CRISTIANA');
INSERT INTO `mail` VALUES ('981', '3', 'cyrylla@virgilio.it', 'PICCIONI COSTANZA');
INSERT INTO `mail` VALUES ('982', '3', 'antonella_pappalardo@alice.it', 'REATI ANTONELLA');
INSERT INTO `mail` VALUES ('983', '3', 'elena.rosini.52@alice.it', 'ROSINI ELENA');
INSERT INTO `mail` VALUES ('984', '3', 'marialuisacucci@libero.it', 'CUCCI MARIA LUISA');
INSERT INTO `mail` VALUES ('985', '3', 'paolofi@virgilio.it', 'FINELLI PAOLO');
INSERT INTO `mail` VALUES ('986', '3', 'larapaesano@libero.it', 'PAESANO LARA');
INSERT INTO `mail` VALUES ('987', '3', 'rosanna.di.pasquale@alice.it', 'DI PASQUALE ROSANNA');
INSERT INTO `mail` VALUES ('988', '3', 'davidtaddei@gmail.com', 'TADDEI DAVID');
INSERT INTO `mail` VALUES ('989', '3', 'caponicasa@alice.it', 'GALEAZZI RITA');
INSERT INTO `mail` VALUES ('990', '3', 'alfonsovitiello@gmail.com', 'VITIELLO ALFONSO');
INSERT INTO `mail` VALUES ('991', '3', 'simone357@hotmail.it', 'ESPOSITO SIMONE');
INSERT INTO `mail` VALUES ('992', '3', 'edra_86@yahoo.it', 'HALIT EDRA');
INSERT INTO `mail` VALUES ('993', '3', 'sv.errico@usl11.tos.it', 'ERRICO ENZA');
INSERT INTO `mail` VALUES ('994', '3', 'garosi@martagarosi.it', 'GAROSI MARTA');
INSERT INTO `mail` VALUES ('995', '3', 'info@lavela.it', 'DAPO PIERLUIGI');
INSERT INTO `mail` VALUES ('996', '3', 'giada_riccardi@msn.com', 'RICCARDI GIADA');
INSERT INTO `mail` VALUES ('997', '3', 'antonio.me@teletu.it', 'MESCE ANTONIO');
INSERT INTO `mail` VALUES ('998', '3', 'maria.m59@alice.it', 'MARTINES MARIA');
INSERT INTO `mail` VALUES ('999', '3', 'calygio@virgilio.it', 'CALIENDO GIOVANNA');
INSERT INTO `mail` VALUES ('1000', '3', 'onofri_francesca@libero.it', 'ONOFRI FRANCESCA');
INSERT INTO `mail` VALUES ('1001', '3', 'vicolomorgana@gmail.com', 'BIZZARRI FABIO');
INSERT INTO `mail` VALUES ('1002', '3', 'stefaniamazza85@hotmail.it', 'MAZZA STEFANIA');
INSERT INTO `mail` VALUES ('1003', '3', 'lavinia08@libero.it', 'GUIDO LAVINIA');
INSERT INTO `mail` VALUES ('1004', '3', 'martinacagnazzo1987@libero.it', 'CAGNAZZO MARTINA');
INSERT INTO `mail` VALUES ('1005', '3', 'altera55@libero.it', 'FORZANTI PAOLA');
INSERT INTO `mail` VALUES ('1006', '3', 'amandaniccoli@gmail.com', 'NICCOLI AMANDA');
INSERT INTO `mail` VALUES ('1007', '3', 'monicabarbafiera@hotmail.com', 'BARBAFIERA MONICA');
INSERT INTO `mail` VALUES ('1008', '3', 'mtans19@gmail.com', 'TANSINI MARCO');
INSERT INTO `mail` VALUES ('1009', '3', 'chiara.cifoni@gmail.com', 'CIFONI CHIARA');
INSERT INTO `mail` VALUES ('1010', '3', 'clamar100@gmail.com', 'MARANGON CLAUDIO');
INSERT INTO `mail` VALUES ('1011', '3', 'patmag52@libero.it', 'MAGGIORELLI PATRIZIA');
INSERT INTO `mail` VALUES ('1012', '3', 'info@studiocommercialecastellano.it', 'CASTELLANO GRAZIA PIA');
INSERT INTO `mail` VALUES ('1013', '3', 'gaetano.bonelli85@alice.it', 'BONELLI GAETANO');
INSERT INTO `mail` VALUES ('1014', '3', 'mancio-89@libero.it', 'MANCINI ALESSANDRO');
INSERT INTO `mail` VALUES ('1015', '3', 'barbvalt@gmail.com', 'FUCECCHI VALTER');
INSERT INTO `mail` VALUES ('1016', '3', 'rosangela.grieco@hotmail.it', 'GRIECO ROSANGELA');
INSERT INTO `mail` VALUES ('1017', '3', 'f.capannini@gmail.com', 'CAPANNINI FRANCESCO');
INSERT INTO `mail` VALUES ('1018', '3', 'cencina@alice.it', 'CENCINI ANNA');
INSERT INTO `mail` VALUES ('1019', '3', 'lucaterrosi@libero.it', 'TERROSI LUCA');
INSERT INTO `mail` VALUES ('1020', '3', 'marfilo2005@yahoo.it', 'FRANCINI MARIA FILOMENA');
INSERT INTO `mail` VALUES ('1021', '3', 'romanomonaldi@gmail.com', 'MONALDI ROMANO');
INSERT INTO `mail` VALUES ('1022', '3', 'massipicconi@hotmail.it', 'PICCONI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1023', '3', 'camilla.trapassi@virgilio.it', 'TRAPASSI CAMILLA');
INSERT INTO `mail` VALUES ('1024', '3', 'simoneroatti@hotmail.it', 'ROATTI SIMONE');
INSERT INTO `mail` VALUES ('1025', '3', 'paburron@tin.it', 'BURRONI PAOLO');
INSERT INTO `mail` VALUES ('1026', '3', 'marcellina1987@virgilio.it', 'PROVENZANO MARCELLA');
INSERT INTO `mail` VALUES ('1027', '3', 'info@esserebenessere.com', 'ROMANELLO MARIAROSA');
INSERT INTO `mail` VALUES ('1028', '3', 'tulia72@yahoo.it', 'MARZUCCHI CAMILLA');
INSERT INTO `mail` VALUES ('1029', '3', 'pisanimessina@alice.it', 'MESSINA CECILIA');
INSERT INTO `mail` VALUES ('1030', '3', 'ma.cammelli@gmail.com', 'CAMMELLI MARIA');
INSERT INTO `mail` VALUES ('1031', '3', 'parruccaio@hotmail.it', 'CARNASCIALI DAVID');
INSERT INTO `mail` VALUES ('1032', '3', 'leonardo.becarelli@gmail.com', 'BECARELLI LEONARDO');
INSERT INTO `mail` VALUES ('1033', '3', 'margherita.cuomo@student.unisi.it', 'CUOMO MARGHERITA');
INSERT INTO `mail` VALUES ('1034', '3', 'salvucci.luciana@libero.it', 'SALVUCCI LUCIANA');
INSERT INTO `mail` VALUES ('1035', '3', 'viavetrano@tiscali.it', 'COSENZA MARIANO');
INSERT INTO `mail` VALUES ('1036', '3', 'valentinaiuliana1984@gmail.com', 'PASCARU VALENTINA');
INSERT INTO `mail` VALUES ('1037', '3', 'nnandofernandes@hotmail.com', 'FERNANDES FERNANDO');
INSERT INTO `mail` VALUES ('1038', '3', 'cinzia.marini@aol.it', 'MARINI CINZIA');
INSERT INTO `mail` VALUES ('1039', '3', 'giordanart1@gmail.com', 'GUERCINI GIORDANO');
INSERT INTO `mail` VALUES ('1040', '3', 'tono@cybermarket.it', 'DE SIENA FRANCO');
INSERT INTO `mail` VALUES ('1041', '3', 'lorenzini.michele@yahoo.it', 'LORENZINI MICHELE');
INSERT INTO `mail` VALUES ('1042', '3', 'stefano.bianchi@axa-mps.it', 'BIANCHI STEFANO');
INSERT INTO `mail` VALUES ('1043', '3', 'eliomanfredi@yahoo.it', 'MANFREDI ELIO');
INSERT INTO `mail` VALUES ('1044', '3', 'annalisa.angelini@alice.it', 'ANGELINI ANNALISA');
INSERT INTO `mail` VALUES ('1045', '3', 'mariangela.angel66@alice.it', 'ANGELINI MARIANGELA');
INSERT INTO `mail` VALUES ('1046', '3', 'patrizia@lamannella.it', 'VIGNI PATRIZIA');
INSERT INTO `mail` VALUES ('1047', '3', 'maura.bondi@mps.it', 'BONDI MAURA');
INSERT INTO `mail` VALUES ('1048', '3', 'luisabartolomei@tiscali.it', 'BARTOLOMEI LUISA');
INSERT INTO `mail` VALUES ('1049', '3', 'cristianacampoccia@alice.it', 'CAMPOCCIA CRISTIANA');
INSERT INTO `mail` VALUES ('1050', '3', 'debora.civai@virgilio.it', 'CIVAI DEBORA');
INSERT INTO `mail` VALUES ('1051', '3', 'nora.giordano@gmail.com', 'GIORDANO NORA');
INSERT INTO `mail` VALUES ('1052', '3', 'fausto.rugini@gmail.com', 'RUGINI FAUSTO');
INSERT INTO `mail` VALUES ('1053', '3', 'clary84@hotmail.it', 'PETRI CLARISSA');
INSERT INTO `mail` VALUES ('1054', '3', 'tombuzz@libero.it', 'BUZZEGOLI TOMMASO');
INSERT INTO `mail` VALUES ('1055', '3', 'tizianamoggi@gmail.com', 'MOGGI TIZIANA');
INSERT INTO `mail` VALUES ('1056', '3', 'tabaccheriaguideri@yahoo.it', 'GUIDERI DANIELA');
INSERT INTO `mail` VALUES ('1057', '3', 'giodisanto@hotmail.it', 'DI SANTO GIUSEPPE');
INSERT INTO `mail` VALUES ('1058', '3', 'simnot@hotmail.it', 'NOTA SIMONE');
INSERT INTO `mail` VALUES ('1059', '3', 'chiara.sperti@libero.it', 'SPERTI CHIARA');
INSERT INTO `mail` VALUES ('1060', '3', 'vicosenarum@hotmail.com', 'DI GIOIA CHIARA');
INSERT INTO `mail` VALUES ('1061', '3', 'dr.laura@hotmail.it', 'DRAGONI LAURA');
INSERT INTO `mail` VALUES ('1062', '3', 'violaricci@hotmail.it', 'RICCI VIOLA');
INSERT INTO `mail` VALUES ('1063', '3', 'robertocuomo@outlook.com', 'CUOMO ROBERTO');
INSERT INTO `mail` VALUES ('1064', '3', 'angeluzzo.z@libero.it', 'ZODA ANGELO');
INSERT INTO `mail` VALUES ('1065', '3', 'guernica@hotmail.it', 'BENEDETTINI ANTON FRANCESCO');
INSERT INTO `mail` VALUES ('1066', '3', 'roberto.rettori@unipg.it', 'RETTORI ROBERTO');
INSERT INTO `mail` VALUES ('1067', '3', 'prpmnt@hotmail.it', 'MONTI PIETROPAOLO');
INSERT INTO `mail` VALUES ('1068', '3', 'franchi.p@tin.it', 'FRANCHI PAOLO');
INSERT INTO `mail` VALUES ('1069', '3', 'mulatto.marta@yahoo.it', 'MULATTO MARTA');
INSERT INTO `mail` VALUES ('1070', '3', 'stefaniamargiacchi@hotmail.it', 'MARGIACCHI STEFANIA');
INSERT INTO `mail` VALUES ('1071', '3', 'monica.galassi@yahoo.it', 'GALASSI MONICA');
INSERT INTO `mail` VALUES ('1072', '3', 'francescamarchetti71@yahoo.it', 'MARCHETTI FRANCESCA');
INSERT INTO `mail` VALUES ('1073', '3', 'pesco.ale@libero.it', 'PESCOSOLIDO ALESSANDRO');
INSERT INTO `mail` VALUES ('1074', '3', 'cinziabuccianti@yahoo.it', 'BUCCIANTI CINZIA');
INSERT INTO `mail` VALUES ('1075', '3', 'info@agrituristsiena.com', 'MATERONI FABIOLA');
INSERT INTO `mail` VALUES ('1076', '3', 'ilariabiagi@hotmail.it', 'BIAGI ILARIA');
INSERT INTO `mail` VALUES ('1077', '3', 'danielamercurivet@gmail.com', 'MERCURI DANIELA');
INSERT INTO `mail` VALUES ('1078', '3', 'nesi.ilaria@gmail.com', 'NESI ILARIA');
INSERT INTO `mail` VALUES ('1079', '3', 'info@vivalasposasiena.it', 'TEUCCI ILARIA');
INSERT INTO `mail` VALUES ('1080', '3', 'giuli.lamantia@gmail.com', 'LA MANTIA GIULIA');
INSERT INTO `mail` VALUES ('1081', '3', 'kejda23@yahoo.it', 'DAKA KEJDA');
INSERT INTO `mail` VALUES ('1082', '3', 'gipetruccioli@gmail.com', 'PETRUCCIOLI GIULIA');
INSERT INTO `mail` VALUES ('1083', '3', 'tiganifrancesco@msn.com', 'TIGANI FRANCESCO');
INSERT INTO `mail` VALUES ('1084', '3', 'leonardo.cencioni@alice.it', 'ESPOSITO SABRINA');
INSERT INTO `mail` VALUES ('1085', '3', 'veropoggi@hotmail.it', 'BERNARDINI VERONICA');
INSERT INTO `mail` VALUES ('1086', '3', 'galganifamily@gmail.com', 'FRAGOMENI MARIAVITTORIA');
INSERT INTO `mail` VALUES ('1087', '3', 'f.apolloni@libero.it', 'APOLLONI FRANCESCA');
INSERT INTO `mail` VALUES ('1088', '3', 'alessirene983@gmail.com', 'ALESSI IRENE');
INSERT INTO `mail` VALUES ('1089', '3', 'janetdenardis@gmail.com', 'DE NARDIS JANET');
INSERT INTO `mail` VALUES ('1090', '3', 'filomenagiannotti@gmail.com', 'GIANNOTTI FILOMENA');
INSERT INTO `mail` VALUES ('1091', '3', 'annina99@hotmail.it', 'CICIGAI ANNA');
INSERT INTO `mail` VALUES ('1092', '7', 'giuliasensi@hotmail.it', 'SENSI GIULIA');
INSERT INTO `mail` VALUES ('1093', '7', 'luciano.meoni@alice.it', 'MEONI LUCIANO');
INSERT INTO `mail` VALUES ('1094', '7', 'elfuerte1510@hotmail.com', 'PERATTA VASQUEZ MELVIN MIGUEL');
INSERT INTO `mail` VALUES ('1095', '7', 'michele.casalis@alice.it', 'CASALIS MICHELE');
INSERT INTO `mail` VALUES ('1096', '7', 'g.frosolini@yahoo.it', 'FROSOLINI GIOVANNI');
INSERT INTO `mail` VALUES ('1097', '7', 'daniele.scapigliati@alice.it', 'SCAPIGLIATI DANIELE');
INSERT INTO `mail` VALUES ('1098', '7', 'serena.g1@virgilio.it', 'GUERRI SERENA');
INSERT INTO `mail` VALUES ('1099', '7', 'azzurraferi@alice.it', 'FERI AZZURRA');
INSERT INTO `mail` VALUES ('1100', '7', 'lola.14@hotmail.it', 'GRECO ANNALISA');
INSERT INTO `mail` VALUES ('1101', '7', 'carmensoniamesiano@gmail.com', 'MESIANO CARMEN SONIA');
INSERT INTO `mail` VALUES ('1102', '7', 'renata.pucci@easymarketcrs.it', 'PUCCI RENATA');
INSERT INTO `mail` VALUES ('1103', '7', 'cristiano.sergio@libero.it', 'SERGIO CRISTIANO');
INSERT INTO `mail` VALUES ('1104', '7', 'massi_frascogna@alice.it', 'FRASCOGNA MASSIMILIANO');
INSERT INTO `mail` VALUES ('1105', '7', 'g_frascogna@alice.it', 'FRASCOGNA GIANLUCA');
INSERT INTO `mail` VALUES ('1106', '7', 'facchi.arianna@gmail.com', 'FACCHI ARIANNA');
INSERT INTO `mail` VALUES ('1107', '7', 'mpgiovannetti@alice.it', 'GIOVANNETTI M.PATRIZIA');
INSERT INTO `mail` VALUES ('1108', '7', 'strucheldavide@gmail.com', 'STRUCHEL DAVIDE');
INSERT INTO `mail` VALUES ('1109', '7', 'info@igabbianicastiglione.com', 'MUCCI FRANCESCA');
INSERT INTO `mail` VALUES ('1110', '7', 'fabrizio.tiberi@libero.it', 'TIBERI FABRIZIO');
INSERT INTO `mail` VALUES ('1111', '7', 'papide@libero.it', 'RALLO GIANNINI IDELMA');
INSERT INTO `mail` VALUES ('1112', '7', 'headcutter@virgilio.it', 'ROSSI PAOLA');
INSERT INTO `mail` VALUES ('1113', '7', 'gc.zaratti@libero.it', 'TERRACINA SILVANA');
INSERT INTO `mail` VALUES ('1114', '7', 'felice_giannini@libero.it', 'GIANNINI FELICE');
INSERT INTO `mail` VALUES ('1115', '7', 'renato.salami@gmail.com', 'SALAMI RENATO');
INSERT INTO `mail` VALUES ('1116', '7', 'kiarina21@gmail.com', 'MORONI CHIARA');
INSERT INTO `mail` VALUES ('1117', '7', 'patriziabruni@live.it', 'BRUNI PATRIZIA');
INSERT INTO `mail` VALUES ('1118', '7', 'carlobarsotti@libero.it', 'BARSOTTI CARLO');
INSERT INTO `mail` VALUES ('1119', '7', 'fabrizio.ghiandai@gmail.com', 'GHIANDAI FABRIZIO');
INSERT INTO `mail` VALUES ('1120', '7', 'bernini.ceccarelli@libero.it', 'BERNINI GIULIO');
INSERT INTO `mail` VALUES ('1121', '7', 'dianina2006@hotmail.it', 'DIOFEBI DIANA');
INSERT INTO `mail` VALUES ('1122', '7', 'alessandra.luisi@gmail.com', 'CERASA ALESSANDRA');
INSERT INTO `mail` VALUES ('1123', '7', 'rosaliavallone@gmail.com', 'VALLONE ROSALIA');
INSERT INTO `mail` VALUES ('1124', '7', 'teresa.giani@gmail.com', 'GIANI TERESA');
INSERT INTO `mail` VALUES ('1125', '7', 'lp_cd@hotmail.it', 'PIERINI ENZO');
INSERT INTO `mail` VALUES ('1126', '7', 'vavanno@tin.it', 'GETTATELLI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('1127', '7', 'bajerova@libero.it', 'BAJEROVA ANDREA');
INSERT INTO `mail` VALUES ('1128', '7', 'arianna.mangani@gmail.com', 'MANGANI ARIANNA');
INSERT INTO `mail` VALUES ('1129', '7', 'alovittorio@tiscali.it', 'ALOCCI VITTORIO');
INSERT INTO `mail` VALUES ('1130', '7', 'mastrogep@yahoo.it', 'DI BITONTO CRISTIANA');
INSERT INTO `mail` VALUES ('1131', '7', 'urbanproject@libero.it', 'LOMBARDO TERESA');
INSERT INTO `mail` VALUES ('1132', '7', 'ritatantulli@gmail.com', 'TANTULLI RITA');
INSERT INTO `mail` VALUES ('1133', '7', 'studioveglianti@alice.it', 'VEGLIANTI FRANCESCA');
INSERT INTO `mail` VALUES ('1134', '7', 'trombinimose@alice.it', 'LEONE MICHAELA');
INSERT INTO `mail` VALUES ('1135', '7', 'lr65poste@gmail.com', 'RAFFI LAURA');
INSERT INTO `mail` VALUES ('1136', '7', 'info@parafarmaciamarsili.com', 'MARSILI LAURA');
INSERT INTO `mail` VALUES ('1137', '7', 'mariapia.giuliattini@yahoo.it', 'GIULIATTINI MARIA PIA');
INSERT INTO `mail` VALUES ('1138', '7', 'tringali.81@gmail.com', 'FAMA TRINGALI ELISA');
INSERT INTO `mail` VALUES ('1139', '7', 'g.gabri@me.com', 'GALLI GABRIELLA');
INSERT INTO `mail` VALUES ('1140', '7', 'schianopriscilla@gmail.com', 'SCHIANO PRISCILLA');
INSERT INTO `mail` VALUES ('1141', '7', 'betty1210@virgilio.it', 'FUSI ELISABETTA');
INSERT INTO `mail` VALUES ('1142', '7', 'christinadrews@yahoo.de', 'DREWS CHRISTINA');
INSERT INTO `mail` VALUES ('1143', '7', 'mavicinti@libero.it', 'CINTI M. VIRGINIA');
INSERT INTO `mail` VALUES ('1144', '7', 'lidia.kulesza@rotta.com', 'KULESZA LIDIA');
INSERT INTO `mail` VALUES ('1145', '7', 'beatrice.miliani@libero.it', 'MILIANI BEATRICE');
INSERT INTO `mail` VALUES ('1146', '7', 'testini@alice.it', 'BRONZI MARISA');
INSERT INTO `mail` VALUES ('1147', '7', 'fulvia.orsini@libero.it', 'ORSINI FULVIA');
INSERT INTO `mail` VALUES ('1148', '7', 'avv.stellascarnicci@gmail.com', 'SCARNICCI STELLA');
INSERT INTO `mail` VALUES ('1149', '7', 'ediliagest@tiscali.it', 'PANDOLFI ALLEGRA');
INSERT INTO `mail` VALUES ('1150', '7', 'luciaprovvedi@hotmail.it', 'PROVVEDI LUCIA');
INSERT INTO `mail` VALUES ('1151', '7', 'rlollo@studiolollo.it', 'LOLLO ROSANNA');
INSERT INTO `mail` VALUES ('1152', '7', 'giulianibeatrice@virgilio.it', 'GIULIANI BEATRICE');
INSERT INTO `mail` VALUES ('1153', '7', 'serena.bertaccini@alice.it', 'BERTACCINI SERENA');
INSERT INTO `mail` VALUES ('1154', '7', 'beina95@hotmail.it', 'TAMAGNONE BEATRICE');
INSERT INTO `mail` VALUES ('1155', '7', 'robydav@alice.it', 'DAVERI ROBERTA');
INSERT INTO `mail` VALUES ('1156', '7', 'r.casarelli@alice.it', 'CASARELLI ROBERTO');
INSERT INTO `mail` VALUES ('1157', '7', 'maria.lualdi@alice.it', 'LUALDI MARIA');
INSERT INTO `mail` VALUES ('1158', '7', 'smnbrnd@tiscali.it', 'CHIOSTRINI SIMONA');
INSERT INTO `mail` VALUES ('1159', '7', 'anna.macolino@gmail.com', 'MACOLINO ANNA');
INSERT INTO `mail` VALUES ('1160', '7', 'peckissimo@hotmail.it', 'PERGOLA PAOLO');
INSERT INTO `mail` VALUES ('1161', '7', 'francesco.centamori@me.com', 'CENTAMORI FRANCESCO');
INSERT INTO `mail` VALUES ('1162', '7', 'barbara.falconi@alice.it', 'FALCONI BARBARA');
INSERT INTO `mail` VALUES ('1163', '7', 'losquass@libero.it', 'SQUASSONI LORENZO');
INSERT INTO `mail` VALUES ('1164', '7', 'rossellaficini@gmail.com', 'FICINI ROSSELLA');
INSERT INTO `mail` VALUES ('1165', '7', 'emanuelelucchesi@yahoo.it', 'LUCCHESI EMANUELE');
INSERT INTO `mail` VALUES ('1166', '7', 'gune86@hotmail.com', 'CAPPELLETTI MARTINA');
INSERT INTO `mail` VALUES ('1167', '7', 'bernax3@inwind.it', 'BERNARDI LORETTA');
INSERT INTO `mail` VALUES ('1168', '7', 'benedetta.baciucco@alice.it', 'BACIUCCO BENEDETTA');
INSERT INTO `mail` VALUES ('1169', '7', 'ottavia.gianni@gmail.com', 'GIANNI OTTAVIA');
INSERT INTO `mail` VALUES ('1170', '7', 'guglielmo.montesi@gmail.com', 'MONTESI GUGLIELMO');
INSERT INTO `mail` VALUES ('1171', '7', 'cristina.checcacci@gmail.com', 'CHECCACCI CRISTINA');
INSERT INTO `mail` VALUES ('1172', '7', 'vimifravla@gmail.com', 'IERVOLINO VIVIANA');
INSERT INTO `mail` VALUES ('1173', '7', 'dovrsandra@yahoo.fr', 'SCRIBANO SANDRA');
INSERT INTO `mail` VALUES ('1174', '7', 'vi.virgy@hotmail.it', 'CORSI ALESSANDRA');
INSERT INTO `mail` VALUES ('1175', '7', 'laura.nicolini@iss.it', 'NICOLINI LAURA');
INSERT INTO `mail` VALUES ('1176', '7', 'varenne91@yahoo.it', 'SANTI ALESSANDRO');
INSERT INTO `mail` VALUES ('1177', '7', 'giovanna.abbiati@tiscali.it', 'ABBIATI GIOVANNA');
INSERT INTO `mail` VALUES ('1178', '7', 'mpicchi@virgilio.it', 'PICCHI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1179', '7', 'tello@email.it', 'PRATI DONATELLO');
INSERT INTO `mail` VALUES ('1180', '7', 'clborghi@libero.it', 'BORGHI CLAUDIA');
INSERT INTO `mail` VALUES ('1181', '7', 'valedemu@supereva.it', 'DE MUNARI VALENTINA');
INSERT INTO `mail` VALUES ('1182', '7', 'silvanadericcardis@alice.it', 'DE RICCARDIS SILVANA');
INSERT INTO `mail` VALUES ('1183', '7', 'boricchiri@libero.it', 'RUSTICI GIULIA');
INSERT INTO `mail` VALUES ('1184', '7', 'presnaytak@gmail.com', 'PRESNYAKOVA EKATERINA');
INSERT INTO `mail` VALUES ('1185', '7', 'valeria.borghi@email.it', 'BORGHI VALERIA');
INSERT INTO `mail` VALUES ('1186', '7', 'sara.calcante@crs.lombardia.it', 'CALCANTE SARA');
INSERT INTO `mail` VALUES ('1187', '7', 'tarannataia@gmail.com', 'TARAN NATALIA');
INSERT INTO `mail` VALUES ('1188', '7', 'federica_v@msi.com', 'VALLESE FEDERICA');
INSERT INTO `mail` VALUES ('1189', '7', 'giannoni.roberta@libero.it', 'GIANNONI ROBERTA');
INSERT INTO `mail` VALUES ('1190', '7', 'platania@slvb.it', 'PLATANIA MASSIMO');
INSERT INTO `mail` VALUES ('1191', '7', 'simona@2ci.it', 'CAPOCCHI SIMONA');
INSERT INTO `mail` VALUES ('1192', '7', 'casagrizi@gmail.com', 'VINCIGUERRA FLAVIA');
INSERT INTO `mail` VALUES ('1193', '7', 'leonardo.simeoni@gmail.com', 'SIMEONI LEONARDO');
INSERT INTO `mail` VALUES ('1194', '7', 'agoretti@manzoni.it', 'GORETTI ANTONELLA');
INSERT INTO `mail` VALUES ('1195', '7', 'avv.angelacasini@virgilio.it', 'CASINI ANGELA');
INSERT INTO `mail` VALUES ('1196', '7', 'roberta_rachini@virgilio.it', 'RACHINI ROBERTA');
INSERT INTO `mail` VALUES ('1197', '7', 'chiara@bonocchi.it', 'BONI CHIARA');
INSERT INTO `mail` VALUES ('1198', '7', 'antichissimo@wanadoo.fr', 'CAPPUZZO GIANMARCO');
INSERT INTO `mail` VALUES ('1199', '7', 'margheritamariani@hotmail.it', 'MARTELLI ROSSANA');
INSERT INTO `mail` VALUES ('1200', '7', 'giovannadf@gmail.com', 'DALLA FRANCESCA MARIA GIOVANNA');
INSERT INTO `mail` VALUES ('1201', '7', 'claudiapianigiani@gmail.com', 'PIANIGIANI CLAUDIA');
INSERT INTO `mail` VALUES ('1202', '7', 'vivi_1991@hotmail.it', 'ALESSANDRI VIRGINIA');
INSERT INTO `mail` VALUES ('1203', '7', 'michelebin@alice.it', 'BINDI MICHELE');
INSERT INTO `mail` VALUES ('1204', '7', 'jessica.quadalti@tiscali.it', 'QUADALTI JESSICA');
INSERT INTO `mail` VALUES ('1205', '7', 'castellani.franca@teletu.it', 'CASTELLANI FRANCA');
INSERT INTO `mail` VALUES ('1206', '7', 'glendaghioldi@yahoo.it', 'GHIOLDI GLENDA');
INSERT INTO `mail` VALUES ('1207', '7', 'nicola.negri@gmail.com', 'NEGRI NICOLA');
INSERT INTO `mail` VALUES ('1208', '7', 'titti2306@gmail.com', 'PIERANGELI TIZIANO');
INSERT INTO `mail` VALUES ('1209', '7', 'ideal@hotmail.it', 'LOCARDI CHIARA');
INSERT INTO `mail` VALUES ('1210', '7', 'alsabatini@alice.it', 'SABATINI ANNALUISA');
INSERT INTO `mail` VALUES ('1211', '7', 'canossi.b@gmail.com', 'CANOSSI BARBARA');
INSERT INTO `mail` VALUES ('1212', '7', 'squalomanuel@email.it', 'BARRACO MANUEL');
INSERT INTO `mail` VALUES ('1213', '7', 'cesarinimonica@libero.it', 'CESARINI MONICA');
INSERT INTO `mail` VALUES ('1214', '7', 'louise@madebymade.it', 'FERRAGAMO LOUISE');
INSERT INTO `mail` VALUES ('1215', '7', 'mulifrance@tin.it', 'MULINACCI FRANCESCO');
INSERT INTO `mail` VALUES ('1216', '7', 'silvia.tognazzi@libero.it', 'TOGNAZZI SILVIA');
INSERT INTO `mail` VALUES ('1217', '7', 'ramo1000@libero.it', 'CUCCHI RAMONA GIULIA');
INSERT INTO `mail` VALUES ('1218', '7', 'giuliasantini@hotmail.co.uk', 'SANTINI GIULIA');
INSERT INTO `mail` VALUES ('1219', '7', 'abigaleaddams@yahoo.it', 'LANZI CLAUDIA');
INSERT INTO `mail` VALUES ('1220', '7', 'mauro.nistri@virgilio.it', 'NISTRI MAURO');
INSERT INTO `mail` VALUES ('1221', '7', 'chicca.monti@hotmail.it', 'MONTI FEDERICA');
INSERT INTO `mail` VALUES ('1222', '7', 'roberta.morrocchi@tin.it', 'MORROCCHI ROBERTA');
INSERT INTO `mail` VALUES ('1223', '7', 'pat.termini@libero.it', 'TERMINI PATRIZIA');
INSERT INTO `mail` VALUES ('1224', '7', 'damilli@alice.it', 'CATUCCI MILENA');
INSERT INTO `mail` VALUES ('1225', '7', 'marikafiscaletti@alice.it', 'FISCALETTI MARIKA');
INSERT INTO `mail` VALUES ('1226', '7', 'borz97@libero.it', 'BORZISE LUDOVICA');
INSERT INTO `mail` VALUES ('1227', '7', 'mickey.leni@gmail.com', 'CAPUANO LORIS');
INSERT INTO `mail` VALUES ('1228', '7', 'mariagrazia.paturzo@libero.it', 'PATURZO MARIAGRAZIA');
INSERT INTO `mail` VALUES ('1229', '7', 'edoardotorre@libero.it', 'AVINCOLA FIORELLA');
INSERT INTO `mail` VALUES ('1230', '7', 'camillabartoli@alice.it', 'BARTOLI CAMILLA');
INSERT INTO `mail` VALUES ('1231', '7', 'elenap769@gmail.com', 'PARRONCHI ELENA');
INSERT INTO `mail` VALUES ('1232', '7', 'mazzarello@email.it', 'MAZZARELLO MICHELE');
INSERT INTO `mail` VALUES ('1233', '7', 'antonellabbate@gmail.com', 'ABBATE ANTONELLA');
INSERT INTO `mail` VALUES ('1234', '7', 'nonnagiovi@alice.it', 'VERNI GIOVANNA');
INSERT INTO `mail` VALUES ('1235', '7', 'cristiano.bernasconi@sunrise.ch', 'BERNASCONI CRISTIANO');
INSERT INTO `mail` VALUES ('1236', '7', 'fapet@email.it', 'PETITO FABIOLA');
INSERT INTO `mail` VALUES ('1237', '7', 'giada.lullini@hotmail.it', 'LULLINI GIADA');
INSERT INTO `mail` VALUES ('1238', '7', 'praxis-russ@+-online.de', 'RUSS ANNETTE');
INSERT INTO `mail` VALUES ('1239', '7', 'signoriniangela439@gmail.com', 'SIGNORINI ANGELA');
INSERT INTO `mail` VALUES ('1240', '7', 'onofrifiorella@libero.it', 'ONOFRI FIORELLA');
INSERT INTO `mail` VALUES ('1241', '7', 'andre_oldrini@hotmail.it', 'OLDRINI ANDREA');
INSERT INTO `mail` VALUES ('1242', '7', 'f.gori@iltirreno.it', 'GORI FRANCESCA');
INSERT INTO `mail` VALUES ('1243', '7', 'fpellegrino@gmail.com', 'PELLEGRINO FRANCESCO');
INSERT INTO `mail` VALUES ('1244', '7', 'mm_marilu@katamail.com', 'MORELLINI MARISTELLA');
INSERT INTO `mail` VALUES ('1245', '7', 'marzi1@alice.it', 'LORINI MARZIA');
INSERT INTO `mail` VALUES ('1246', '7', 'bibbi2002_it@yahoo.it', 'CRUCIANI LAURA');
INSERT INTO `mail` VALUES ('1247', '7', 'ale.ciri@alice.it', 'CECCARELLI ALESSANDRO');
INSERT INTO `mail` VALUES ('1248', '7', 'valentina.tosi78@gmail.com', 'TOSI VALENTINA');
INSERT INTO `mail` VALUES ('1249', '7', 'irene.buzzegoli@istruzione.it', 'BUZZEGOLI IRENE');
INSERT INTO `mail` VALUES ('1250', '7', 'valelandia@infinito.it', 'VENTA VALENTINO');
INSERT INTO `mail` VALUES ('1251', '7', 'almalauria@hotmail.com', 'AMENDOLA ALMA');
INSERT INTO `mail` VALUES ('1252', '7', 'marco_ciani89@hotmail.it', 'CIANI MARCO');
INSERT INTO `mail` VALUES ('1253', '7', 'fricci76@gmail.com', 'RICCI FEDERICO');
INSERT INTO `mail` VALUES ('1254', '7', 'delfino_13@libero.it', 'DEL BIANCO ENZO');
INSERT INTO `mail` VALUES ('1255', '7', 'federica.sartini@novartis.com', 'SARTINI FEDERICA');
INSERT INTO `mail` VALUES ('1256', '7', 'cinzia.maestrini@tin.it', 'MAESTRINI CINZIA');
INSERT INTO `mail` VALUES ('1257', '7', 'giacomoalgeri@gmail.com', 'SALVASCO MARIOLINA');
INSERT INTO `mail` VALUES ('1258', '7', 'francescabigagli@libero.it', 'BIGAGLI FRANCESCA');
INSERT INTO `mail` VALUES ('1259', '7', 'furrbo@tiscali.it', 'BERNABEI SIMONA');
INSERT INTO `mail` VALUES ('1260', '7', 'stefano.minocci@alice.it', 'MINOCCI STEFANO');
INSERT INTO `mail` VALUES ('1261', '7', 'ilvotapentole@gmail.com', 'ZOI MONICA');
INSERT INTO `mail` VALUES ('1262', '7', 'ruggero@assistudiolauria.it', 'LAURIA RUGGIERO');
INSERT INTO `mail` VALUES ('1263', '7', 'elenanappi@katamail.com', 'NAPPI ELENA');
INSERT INTO `mail` VALUES ('1264', '7', 'saraciastellardi@gmail.com', 'CIASTELLARDI SARA');
INSERT INTO `mail` VALUES ('1265', '7', 'danielepapi@hotmail.it', 'PAPI DANIELE');
INSERT INTO `mail` VALUES ('1266', '7', 'moravatopollaj@gmail.com', 'TOPOLLAJ MORAVA');
INSERT INTO `mail` VALUES ('1267', '7', 'massimilianomagrini@alice.it', 'MAGRINI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1268', '7', 'roberta57.m@gmail.com', 'MANGIARACINA ROBERTA');
INSERT INTO `mail` VALUES ('1269', '7', 'osben@msn.com', 'BENNATI OSVALDO');
INSERT INTO `mail` VALUES ('1270', '7', 'tiztocco@tin.it', 'TOCCO TIZIANA');
INSERT INTO `mail` VALUES ('1271', '7', 'soniaandrei@alice.it', 'ANDREI SONIA');
INSERT INTO `mail` VALUES ('1272', '7', 'alic1992@hotmail.it', 'VITI ALICE');
INSERT INTO `mail` VALUES ('1273', '7', 'valentina.crepaz@gmail.com', 'CREPAZ VALENTINA');
INSERT INTO `mail` VALUES ('1274', '7', 'gildalondini@libero.it', 'LONDINI GILDA');
INSERT INTO `mail` VALUES ('1275', '7', 'isabellapicciafuochi@virgilio.it', 'PICCIAFUOCHI ISABELLA');
INSERT INTO `mail` VALUES ('1276', '7', 'luanamz@alice.it', 'MAGAZZINI LUANA');
INSERT INTO `mail` VALUES ('1277', '7', 'stefy.maxximo@alice.it', 'TOMAINI STEFANIA');
INSERT INTO `mail` VALUES ('1278', '7', 'rita.damiani62@gmail.com', 'DAMIANI RITA');
INSERT INTO `mail` VALUES ('1279', '7', 'luca@bojola.com', 'BOJOLA LUCA');
INSERT INTO `mail` VALUES ('1280', '7', 'annamarga@email.it', 'MARGARITO ANNA');
INSERT INTO `mail` VALUES ('1281', '7', 'serenella@polverini.cc', 'POLVERINI SERENELLA');
INSERT INTO `mail` VALUES ('1282', '7', 'rita.olmi@hotmail.it', 'OLMI RITA');
INSERT INTO `mail` VALUES ('1283', '7', 'menoni.valentina@libero.it', 'MENONI VALENTINA');
INSERT INTO `mail` VALUES ('1284', '7', 'lausergio49@gmail.com', 'LAURIA SERGIO');
INSERT INTO `mail` VALUES ('1285', '7', 'ginevra.t@libero.it', 'TOMASI GINEVRA');
INSERT INTO `mail` VALUES ('1286', '7', 'gioele1@libero.it', 'MAZZI ALESSANDRA');
INSERT INTO `mail` VALUES ('1287', '7', 'elisapisani.sai@libero.it', 'PISANI ELISA');
INSERT INTO `mail` VALUES ('1288', '7', 'demichele07@gmail.com', 'DEMICHELE LAURA');
INSERT INTO `mail` VALUES ('1289', '7', 'mauro.rullo@alice.it', 'BRILLI MAURIZIA');
INSERT INTO `mail` VALUES ('1290', '7', 'edylm67@alice.it', 'LA MANTIA EDY');
INSERT INTO `mail` VALUES ('1291', '7', 'fabrizio.dezolt@tiscali.it', 'DE ZOLT FABRIZIO');
INSERT INTO `mail` VALUES ('1292', '7', 'modestip@gmail.com', 'MODESTI PATRIZIA');
INSERT INTO `mail` VALUES ('1293', '7', 'livero.jody@libero.it', 'LIVERO JODY');
INSERT INTO `mail` VALUES ('1294', '7', 'amattu@hotmail.it', 'MATTU ANNA');
INSERT INTO `mail` VALUES ('1295', '7', 'pardinidesign@gmail.com', 'PARDINI FRANCO');
INSERT INTO `mail` VALUES ('1296', '7', 'stefirusso@fastwebmail.it', 'RUSSO STEFANIA');
INSERT INTO `mail` VALUES ('1297', '7', 'a.menconi85@gmail.com', 'MANCONI ANDREA');
INSERT INTO `mail` VALUES ('1298', '7', 'ale.pecchioli@gmail.com', 'PECCHIOLI ALESSANDRA');
INSERT INTO `mail` VALUES ('1299', '7', 'susy.71@hotmail.it', 'SALVADORI SUSANNA');
INSERT INTO `mail` VALUES ('1300', '7', 'francescacini@gmail.com', 'CINI FRANCESCA');
INSERT INTO `mail` VALUES ('1301', '7', 's.mechini@libero.it', 'MECHINI SARA');
INSERT INTO `mail` VALUES ('1302', '7', 'laura54m@yahoo.com', 'MATTEUCCI LAURA');
INSERT INTO `mail` VALUES ('1303', '7', 'f.sartor@niceforyou.com', 'LA ROCCA CATERINA');
INSERT INTO `mail` VALUES ('1304', '7', 'rossellasecci@alice.it', 'SECCI ROSSELLA');
INSERT INTO `mail` VALUES ('1305', '7', 'sofiapaoli@hotmail.it', 'PAOLI SOFIA');
INSERT INTO `mail` VALUES ('1306', '7', 'dauria.antonio@hotmail.com', 'DAURIA ANTONIO');
INSERT INTO `mail` VALUES ('1307', '7', 'sol.nuevo@libero.it', 'QUILALEO ISABELLA');
INSERT INTO `mail` VALUES ('1308', '7', 'chiara.salvadori@libero.it', 'SALVADORI CHIARA');
INSERT INTO `mail` VALUES ('1309', '7', 'renatasartori@gmail.it', 'SARTORI RENATA');
INSERT INTO `mail` VALUES ('1310', '7', 'matteopasseri@gmail.com', 'PASSERI MATTEO');
INSERT INTO `mail` VALUES ('1311', '7', 'direzione@cencicostruzioni.it', 'CENCI SIMONE');
INSERT INTO `mail` VALUES ('1312', '7', 'nnmrmn@yahoo.it', 'MEARINI ANNAMARIA');
INSERT INTO `mail` VALUES ('1313', '7', 'dgrisalli@libero.it', 'CRISALLI DANIELE');
INSERT INTO `mail` VALUES ('1314', '7', 'adcastiglione@hotmail.com', 'PETRINI SARAH');
INSERT INTO `mail` VALUES ('1315', '7', 'marianovella.rangoni@email.it', 'RANGONI MARIA NOVELLA');
INSERT INTO `mail` VALUES ('1316', '7', 'gcalgo@gmail.com', 'CALIUMI GUALTIERO');
INSERT INTO `mail` VALUES ('1317', '7', 'bozzilorenzo@libero.it', 'BOZZI LORENZO');
INSERT INTO `mail` VALUES ('1318', '7', 'ladatro@yahoo.com', 'LADATRO NATALIA');
INSERT INTO `mail` VALUES ('1319', '7', 'fattori.david@libero.it', 'FATTORI DAVID');
INSERT INTO `mail` VALUES ('1320', '7', 'cristiana.facco@gmail.com', 'FACCO CRISTIANA');
INSERT INTO `mail` VALUES ('1321', '7', 'babocelli@hotmail.it', 'BOCELLI BARBARA');
INSERT INTO `mail` VALUES ('1322', '7', 'cristinabevilacqua4@virgilio.it', 'BEVILACQUA CRISTINA');
INSERT INTO `mail` VALUES ('1323', '7', 'stefano.divecchio@gmail.com', 'DI VECCHIO STEFANO');
INSERT INTO `mail` VALUES ('1324', '7', 's.etta@tin.it', 'PENNACCHIO SIMONETTA');
INSERT INTO `mail` VALUES ('1325', '7', 'guerrinidebora@alice.it', 'GUERRINI DEBORA');
INSERT INTO `mail` VALUES ('1326', '7', 'warrior845g@libero.it', 'GUARNIERI MARIA');
INSERT INTO `mail` VALUES ('1327', '7', '10873@agenzieunipolassicurazioni.it', 'BALDASSARRI PAOLO');
INSERT INTO `mail` VALUES ('1328', '7', 'brothel@me.com', 'BROTHEL MAURO');
INSERT INTO `mail` VALUES ('1329', '7', 'ceciliaseveri@yahoo.it', 'SEVERI CECILIA');
INSERT INTO `mail` VALUES ('1330', '7', 'fabiosili@alice.it', 'SILI FABIO');
INSERT INTO `mail` VALUES ('1331', '7', 's.passaponti@yahoo.it', 'PASSAPONTI SUSANNA');
INSERT INTO `mail` VALUES ('1332', '7', 'fiulianobacchetta@alice.it', 'BACCHETTA GIULIANO');
INSERT INTO `mail` VALUES ('1333', '7', 'maffeis.natural@libero.it', 'MAFFEIS MATTEO');
INSERT INTO `mail` VALUES ('1334', '7', 'francesca@rotellini.com', 'ROTELLINI FRANCESCA');
INSERT INTO `mail` VALUES ('1335', '7', 'mirko.giovani@hotmail.it', 'GIOVANI MIRKO');
INSERT INTO `mail` VALUES ('1336', '7', 'famigliazarotti@libero.it', 'BOCCACCI MADDALENA');
INSERT INTO `mail` VALUES ('1337', '7', 'simrafan@tin.it', 'RAFANELLI SIMONA');
INSERT INTO `mail` VALUES ('1338', '7', 'virgi.allegra@hotmail.it', 'DONNINI VIRGINIA');
INSERT INTO `mail` VALUES ('1339', '7', 'eli16594@gmail.com', 'BURTSEVA ELIZAVETA');
INSERT INTO `mail` VALUES ('1340', '7', 'filofrancy13@hotmail.it', 'MINUCCI FRANCESCA');
INSERT INTO `mail` VALUES ('1341', '7', 'moniacastiglioni@libero.it', 'CASTIGLIONI MONIA');
INSERT INTO `mail` VALUES ('1342', '7', 'roberto.macconi@virgilio.it', 'MACCONI ROBERTO');
INSERT INTO `mail` VALUES ('1343', '7', 'maletti.milvia@libero.it', 'RUSTICHELLI MILVIA');
INSERT INTO `mail` VALUES ('1344', '7', 'francesca.todaro@gmail.com', 'TODARO FRANCESCA');
INSERT INTO `mail` VALUES ('1345', '7', 'flaviamen@hotmail.it', 'MENICACCI FLAVIA');
INSERT INTO `mail` VALUES ('1346', '7', 'gisalu@infinito.it', 'LUCCHESE GISELLA');
INSERT INTO `mail` VALUES ('1347', '7', 'carl.manc@libero.it', 'MANCINI CARLA');
INSERT INTO `mail` VALUES ('1348', '7', 'c.gregoratti@autolarotonda.it', 'GREGORATTI COSTANZA');
INSERT INTO `mail` VALUES ('1349', '7', 'giu.niccolai@gmail.com', 'NICCOLAI GIULIA');
INSERT INTO `mail` VALUES ('1350', '7', 'claudia.galanti@libero.it', 'GALANTI CLAUDIA');
INSERT INTO `mail` VALUES ('1351', '7', 'elisa.riforgiato93@gmail.com', 'RIFORGIATO ELISA');
INSERT INTO `mail` VALUES ('1352', '7', 'carfora.daniele@gmail.com', 'CARFORA DANIELE');
INSERT INTO `mail` VALUES ('1353', '7', 'casini@usa.net', 'CASINI LEONARDO');
INSERT INTO `mail` VALUES ('1354', '7', 'andreacamici@gmail.com', 'CAMICI ANDREA');
INSERT INTO `mail` VALUES ('1355', '7', 'francesca_zanoboni@hotmail.com', 'ZANOBONI FRANCESCA');
INSERT INTO `mail` VALUES ('1356', '7', 'sandra.mattii@virgilio.it', 'MATTII SANDRA');
INSERT INTO `mail` VALUES ('1357', '7', 'filippo.presenti@alice.it', 'PRESENTI FILIPPO');
INSERT INTO `mail` VALUES ('1358', '7', 'yleniadima@yahoo.it', 'DIMA YLENIA');
INSERT INTO `mail` VALUES ('1359', '7', 'vanessaballoni70@gmail.com', 'BALLONI VANESSA');
INSERT INTO `mail` VALUES ('1360', '7', 'valeria.palminteri@libero.it', 'PALMINTERI VALERIA');
INSERT INTO `mail` VALUES ('1361', '7', 'elenoire80@gmail.com', 'FRANCIA ELEONORA');
INSERT INTO `mail` VALUES ('1362', '7', 'sandra_cozzitorto@yahoo.it', 'CHERUBINI JONNY');
INSERT INTO `mail` VALUES ('1363', '7', 'bcivitelli@gmail.com', 'CIVITELLI BARBARA');
INSERT INTO `mail` VALUES ('1364', '7', 'alessandra.carretta1@alice.it', 'CARRETTA ALESSANDRA');
INSERT INTO `mail` VALUES ('1365', '7', 'ciavam88@gmail.com', 'CIAVARELLA MONICA');
INSERT INTO `mail` VALUES ('1366', '7', 'ilariamincuzzi@gmail.com', 'MINCUZZI ILARIA');
INSERT INTO `mail` VALUES ('1367', '7', 'giosipozzi.pittrice@gmail.com', 'GIULIANI GIOSI');
INSERT INTO `mail` VALUES ('1368', '7', 'ferraroelisa@tiscali.it', 'FERRARO ELISA');
INSERT INTO `mail` VALUES ('1369', '7', 'laralanza@alice.it', 'LANZA LARA');
INSERT INTO `mail` VALUES ('1370', '7', 'finescrivani@yahoo.it', 'FINESCHI SCRIVANI FRANCESCA');
INSERT INTO `mail` VALUES ('1371', '7', 'filippoalessi1984@libero.it', 'ALESSI FILIPPO');
INSERT INTO `mail` VALUES ('1372', '7', 'antonietta.iorio@tiscali.it', 'SPUNTONI ANTONIETTA');
INSERT INTO `mail` VALUES ('1373', '7', 'pacinotti@interfree.it', 'PACINOTTI LORENA');
INSERT INTO `mail` VALUES ('1374', '7', 'valefocard@gmail.com', 'FOCARDI VALENTINA');
INSERT INTO `mail` VALUES ('1375', '7', 'stulrx@virgilio.it', 'TULLI STEFANO');
INSERT INTO `mail` VALUES ('1376', '7', 'buoncristianiangela@me.com', 'BUONCRISTIANI ANGELA');
INSERT INTO `mail` VALUES ('1377', '7', 'giulina.ferri@gmail.com', 'FERRI GIULIA');
INSERT INTO `mail` VALUES ('1378', '7', 'd.albissi@virgilio.it', 'ALBISSI DOMINGA');
INSERT INTO `mail` VALUES ('1379', '7', 'alessia.bonucci@alice.it', 'BONUCCI ALESSIA');
INSERT INTO `mail` VALUES ('1380', '7', 'sabatucci.chiara@tiscali.it', 'SABATUCCI CHIARA');
INSERT INTO `mail` VALUES ('1381', '7', 'alessandroancilli@yahoo.it', 'ANCILLI ALESSANDRO');
INSERT INTO `mail` VALUES ('1382', '7', 'aurora.sodini@tin.it', 'SODINI AURORA');
INSERT INTO `mail` VALUES ('1383', '7', 'sofia.sara@tiscali.it', 'BENCINI SOFIA');
INSERT INTO `mail` VALUES ('1384', '7', 'gballarani@libero.it', 'BALLARANI GIORGIA');
INSERT INTO `mail` VALUES ('1385', '7', 'serele68@gmail.com', 'VOLPI SERENA');
INSERT INTO `mail` VALUES ('1386', '7', 'ioanamusescu@yahoo.com', 'MUSESCU IOANA');
INSERT INTO `mail` VALUES ('1387', '7', 'jessicatisterelli@hotmail.it', 'TISTARELLI JESSICA');
INSERT INTO `mail` VALUES ('1388', '7', 'violagraziosi@ied.edu', 'GRAZIOSI VIOLA');
INSERT INTO `mail` VALUES ('1389', '7', 'carbovaro64@tiscali.it', 'ROSI CLAUDIA');
INSERT INTO `mail` VALUES ('1390', '7', 'barbara.biagini@fiora.it', 'BIAGINI BARBARA');
INSERT INTO `mail` VALUES ('1391', '7', 'michelacavaciocchi@virgilio.it', 'CAVACIOCCHI MICHELA');
INSERT INTO `mail` VALUES ('1392', '7', 'p.benedetta@hotmail.it', 'PACENTI BENEDETTA');
INSERT INTO `mail` VALUES ('1393', '7', 'pierannam@alice.it', 'FRUGGIERO ANNAMARIA');
INSERT INTO `mail` VALUES ('1394', '7', 'igna.p.85@hotmail.it', 'DINOTO GRAZIA');
INSERT INTO `mail` VALUES ('1395', '7', 'r.decamelis@studiolegaledecamelis.it', 'DECAMELIS RAFFAELLA');
INSERT INTO `mail` VALUES ('1396', '7', 'simozac@yahoo.it', 'ZACCHEI SIMONA');
INSERT INTO `mail` VALUES ('1397', '7', 'saveric80@gmail.com', 'RICCUCCI SAVERIO');
INSERT INTO `mail` VALUES ('1398', '7', 'a.buonavia@hotmail.it', 'BUONAVIA ALESSANDRA');
INSERT INTO `mail` VALUES ('1399', '7', 'ele.fommei@gmail.it', 'FOMMEI ELENA');
INSERT INTO `mail` VALUES ('1400', '7', 'sergiangre@virgilio.it', 'GIANGREGORIO GIULIA');
INSERT INTO `mail` VALUES ('1401', '7', 'mantelli_mauro@yahoo.it', 'MANTELLI MAURO');
INSERT INTO `mail` VALUES ('1402', '7', 'afarisei@firenze.cna.it', 'FARISEI ALESSANDRO');
INSERT INTO `mail` VALUES ('1403', '7', 'm_piazzini@libero.it', 'PIAZZINI MARCO');
INSERT INTO `mail` VALUES ('1404', '7', 'l.pacciani@alice.it', 'PACCIANI LEONARDO');
INSERT INTO `mail` VALUES ('1405', '7', 'f.soffici@alice.it', 'SOFFICI FILIPPO');
INSERT INTO `mail` VALUES ('1406', '7', 'gczaratti@libero.it', 'BRUNI SILVANA');
INSERT INTO `mail` VALUES ('1407', '7', 'francesco.bonini@hotmail.it', 'BONINI FRANCESCO');
INSERT INTO `mail` VALUES ('1408', '7', 'laiapier@alice.it', 'PASTORELLI CLAUDIA');
INSERT INTO `mail` VALUES ('1409', '7', 'casabag@alice.it', 'LABONIA OLGA');
INSERT INTO `mail` VALUES ('1410', '7', 'bsgloria@hotmail.com', 'BONACANI GLORI');
INSERT INTO `mail` VALUES ('1411', '7', 'simonaperillo76@hotmail.com', 'PERILLO SIMONA');
INSERT INTO `mail` VALUES ('1412', '7', 'marioanne@alice.it', 'ANNECCHIARICO MARIO');
INSERT INTO `mail` VALUES ('1413', '7', 'perna.antonella@gmail.com', 'PERNA ANTONIETTA');
INSERT INTO `mail` VALUES ('1414', '7', 'martina.bidini@virgilio.it', 'BIDINI MARTINA');
INSERT INTO `mail` VALUES ('1415', '7', 'alfio@ferramentamancini.it', 'LARI ALFIO');
INSERT INTO `mail` VALUES ('1416', '7', 'penelopeulisse@gmail.com', 'LEONCINI LORENZA');
INSERT INTO `mail` VALUES ('1417', '7', 'mirtaserenari@hotmail.it', 'SERENARI MIRTA');
INSERT INTO `mail` VALUES ('1418', '7', 'sforzi.a@libero.it', 'SFORZI ANDREA');
INSERT INTO `mail` VALUES ('1419', '7', 'marcopelletti66@gmail.com', 'PELLETTI MARCO');
INSERT INTO `mail` VALUES ('1420', '7', 'lucia_bellandi@yahoo.it', 'BELLANDI LUCIA');
INSERT INTO `mail` VALUES ('1421', '7', 'sary80@hotmail.it', 'MAGLIOZZI SARA');
INSERT INTO `mail` VALUES ('1422', '7', 'elena83_@hotmail.it', 'BINDI ELENA');
INSERT INTO `mail` VALUES ('1423', '7', 'georgiatornolo@aol.com', 'TORNOLO GIORGIA');
INSERT INTO `mail` VALUES ('1424', '7', 'pamela@serraiola.it', 'LENZI PAMELA');
INSERT INTO `mail` VALUES ('1425', '7', 'rotellini@geacom.com', 'ROTELLINI SANDRA');
INSERT INTO `mail` VALUES ('1426', '7', 'agriturismo@ilpalazzo.toscana.it', 'DE SABBATA ISABELLA');
INSERT INTO `mail` VALUES ('1427', '7', 'anna@toscana.com', 'BORELLI ANNA');
INSERT INTO `mail` VALUES ('1428', '7', 'ferri.francesca@gmail.com', 'FERRI FRANCESCA');
INSERT INTO `mail` VALUES ('1429', '7', 'morenofattoi@inwind.it', 'FATTOI MORENO');
INSERT INTO `mail` VALUES ('1430', '7', 'aletesti02@gmail.com', 'TESTI ALESSANDRA');
INSERT INTO `mail` VALUES ('1431', '7', 'vascobeghetti@hotmail.com', 'BEGHETTI VASCO');
INSERT INTO `mail` VALUES ('1432', '7', 'lucia.senni@hotmail.it', 'SENNI LUCIA');
INSERT INTO `mail` VALUES ('1433', '7', 'gioia.burroni@email.it', 'BURRONI GIOIA');
INSERT INTO `mail` VALUES ('1434', '7', 'jocardeti@gmail.com', 'CARDETI IOLANDA');
INSERT INTO `mail` VALUES ('1435', '7', 'niccoscope@hotmail.it', 'SCOPETANI NICCOLO');
INSERT INTO `mail` VALUES ('1436', '7', 'moda68@alice.it', 'CECCONATI MONICA');
INSERT INTO `mail` VALUES ('1437', '7', 'esigali@libero.it', 'SIGALI EMILIO');
INSERT INTO `mail` VALUES ('1438', '7', 'simone.pistoi@tin.it', 'PISTOI SIMONE');
INSERT INTO `mail` VALUES ('1439', '7', 'simone.banchi@gmail.com', 'BANCHI SIMONE');
INSERT INTO `mail` VALUES ('1440', '7', 'cristina.marrani@yahoo.it', 'MARRANI CRISTINA');
INSERT INTO `mail` VALUES ('1441', '7', 'annabalasco@centropegaso.it', 'BALASCO ANNA');
INSERT INTO `mail` VALUES ('1442', '7', 'lorenzi.letizia@gmail.com', 'LORENZI LETIZIA');
INSERT INTO `mail` VALUES ('1443', '7', 'federico@moscatellistudio.it', 'MOSCATELLI FEDERICO');
INSERT INTO `mail` VALUES ('1444', '7', 'valentinachiappini.ar@gmail.com', 'CHIAPPINI VALENTINA');
INSERT INTO `mail` VALUES ('1445', '7', 'f.ciampi@libero.it', 'CIAMPI FRANCESCA');
INSERT INTO `mail` VALUES ('1446', '7', 'silvana.susini@libero.it', 'SUSINI SILVANA');
INSERT INTO `mail` VALUES ('1447', '7', 'annalisa83@tiscali.it', 'MONTOMOLI ANNALISA');
INSERT INTO `mail` VALUES ('1448', '7', 'fabiorusso@blu.it', 'RUSSO FABIO');
INSERT INTO `mail` VALUES ('1449', '7', 'franco.giuliani@alice.it', 'GIULIANI FRANCO');
INSERT INTO `mail` VALUES ('1450', '7', 'carletta.51@libero.it', 'DE GORACUCHI CARLA');
INSERT INTO `mail` VALUES ('1451', '7', 'luciari2003@libero.it', 'RIGHETTINI LUCIA');
INSERT INTO `mail` VALUES ('1452', '7', 'gavorranonet@gmail.com', 'ROSSI PAOLA');
INSERT INTO `mail` VALUES ('1453', '7', 'ariannaneri81@gmail.com', 'NERI ARIANNA');
INSERT INTO `mail` VALUES ('1454', '7', 'paola.frosinini@gmail.com', 'FROSININI PAOLA');
INSERT INTO `mail` VALUES ('1455', '7', 'daniricci@gmail.com', 'RICCI DANIELA');
INSERT INTO `mail` VALUES ('1456', '7', 'f.ceccarelli@areatecnica1.it', 'PANTOSO MELISSA');
INSERT INTO `mail` VALUES ('1457', '7', 'merola_raffaele@alice.it', 'MEROLA FILIPPO');
INSERT INTO `mail` VALUES ('1458', '7', 'riforgiato@gmail.com', 'RIFORGIATO FEDERICA');
INSERT INTO `mail` VALUES ('1459', '7', 'bettacdp@hotmail.com', 'CHIMENTI ELISABETTA');
INSERT INTO `mail` VALUES ('1460', '7', 'giuseppina.gallo@telecomitalia.it', 'GALLO GIUSEPPINA');
INSERT INTO `mail` VALUES ('1461', '7', 'evabidini@gmail.com', 'BIDINI EVA');
INSERT INTO `mail` VALUES ('1462', '7', 'madame.laura@live.it', 'TOSI LAURA');
INSERT INTO `mail` VALUES ('1463', '7', 'p.bennati@palazzochigi.it', 'BENNATI PAOLA');
INSERT INTO `mail` VALUES ('1464', '7', 'maddalena.grazzini@alice.it', 'GRAZZINI MADDALENA');
INSERT INTO `mail` VALUES ('1465', '7', 'andreapanicini@hotmail.com', 'PANICINI ANDREA');
INSERT INTO `mail` VALUES ('1466', '7', 'silvio.ursini@bulgari.com', 'URSINI SILVIO');
INSERT INTO `mail` VALUES ('1467', '7', 'laurafaiella@libero.it', 'FAIELLA LAURA');
INSERT INTO `mail` VALUES ('1468', '7', 'marco.lari@glconfezioni.com', 'LARI MARCO');
INSERT INTO `mail` VALUES ('1469', '7', 'marta_sili@hotmail.it', 'SILI MARTA');
INSERT INTO `mail` VALUES ('1470', '7', 'rita.dragoni@alice.it', 'SPIRIDIGLIOZZI RITA');
INSERT INTO `mail` VALUES ('1471', '7', 'gabrielepianigiani@alice.it', 'PIANIGIANI GABRIELE');
INSERT INTO `mail` VALUES ('1472', '7', 'luisacini@teletu.it', 'CINI LUISA');
INSERT INTO `mail` VALUES ('1473', '7', 'stepirovano@tiscali.it', 'PIROVANO STEFANO');
INSERT INTO `mail` VALUES ('1474', '7', 'agriturismo@cortedegliulivi.net', 'SAVIO GIULIA');
INSERT INTO `mail` VALUES ('1475', '7', 'valeria.bindi@virgilio.it', 'BINDI VALERIA');
INSERT INTO `mail` VALUES ('1476', '7', 'cateyre@hotmail.it', 'MARCHETTI CATERINA');
INSERT INTO `mail` VALUES ('1477', '7', 'marco.scrivano7@live.it', 'SCRIVANO MARCO');
INSERT INTO `mail` VALUES ('1478', '7', 'barbara.marchi@yahoo.it', 'GRILLI GIANLUIGI');
INSERT INTO `mail` VALUES ('1479', '7', 'fabriziospaghetti@hotmail.it', 'SPAGHETTI FABRIZIO');
INSERT INTO `mail` VALUES ('1480', '7', 't.pieraccini@cstfirenze.it', 'PIERACCINI TIZIANA');
INSERT INTO `mail` VALUES ('1481', '7', 'l.mangiavacchi1@virgilio.it', 'MANGIAVACCHI LAURETTA');
INSERT INTO `mail` VALUES ('1482', '7', 'claudia.ricco09@gmail.com', 'RICCO CLAUDIA');
INSERT INTO `mail` VALUES ('1483', '7', 'federicamaggi89@gmail.com', 'MAGGI FEDERICA');
INSERT INTO `mail` VALUES ('1484', '7', 'kapmar.paolo@alice.it', 'CAPECCHI MARILENA');
INSERT INTO `mail` VALUES ('1485', '7', 'miss@misspaloma.com', 'ROSSETTINI NOVELLA');
INSERT INTO `mail` VALUES ('1486', '7', 'lafayette77@live.it', 'PECCHIOLI ROBERTA');
INSERT INTO `mail` VALUES ('1487', '7', 'dmayer@alice.it', 'MAYER DANIELA');
INSERT INTO `mail` VALUES ('1488', '7', 'eleonoracartocci@hotmail.it', 'CARTOCCI ELEONORA');
INSERT INTO `mail` VALUES ('1489', '7', 'cristinaorlandi80@gmail.com', 'ORLANDI CRISTINA');
INSERT INTO `mail` VALUES ('1490', '7', 'rosella.p@bcc.tin.it', 'PISTELLI ROSELLA');
INSERT INTO `mail` VALUES ('1491', '7', 'archawerbuch@yahoo.it', 'AWERBUCH GABRIELLA');
INSERT INTO `mail` VALUES ('1492', '7', '20.9@tiscali.it', 'FORCI FRANCO');
INSERT INTO `mail` VALUES ('1493', '7', 'mario.sovico@gmail.com', 'SOVICO MARIO');
INSERT INTO `mail` VALUES ('1494', '7', 'mena.cece@alice.it', 'CECE FILOMENA');
INSERT INTO `mail` VALUES ('1495', '7', 'dariacini@libero.it', 'CINI DARIA');
INSERT INTO `mail` VALUES ('1496', '7', 'anitabuchser@virgilio.it', 'BUCHSER ANITA');
INSERT INTO `mail` VALUES ('1497', '7', 'sandragadelotti@alice.it', 'GADELOTTI SANDRA');
INSERT INTO `mail` VALUES ('1498', '7', 'francesca_lelli@hotmail.com', 'LELLI FRANCESCA');
INSERT INTO `mail` VALUES ('1499', '7', 'giadamanciulli@libero.it', 'MANCIULLI GIADA');
INSERT INTO `mail` VALUES ('1500', '7', 'stefy.cianfarelli@libero.it', 'CIANFANELLI STEFANIA');
INSERT INTO `mail` VALUES ('1501', '7', 'lucillamuccichini@gmail.com', 'MUCCICHINI LUCILLA');
INSERT INTO `mail` VALUES ('1502', '7', 'stefanucci.giacomo@gmail.com', 'STEFANUCCI GIACOMO');
INSERT INTO `mail` VALUES ('1503', '7', 'cristina.monteldi@virgilio.it', 'GASTALDI MARCO');
INSERT INTO `mail` VALUES ('1504', '7', 'mclaretta74@gmail.com', 'MARZOLA MARIA CHIARA');
INSERT INTO `mail` VALUES ('1505', '7', 'vannuele@gmail.com', 'VANNUCCINI ELEONORA');
INSERT INTO `mail` VALUES ('1506', '7', 'cristiano.contri@gmail.com', 'CONTRI CRISTIANO');
INSERT INTO `mail` VALUES ('1507', '7', 'avv.cristinamonti@gmail.com', 'FOTI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('1508', '7', 'conti.ele@alice.it', 'CONTI ELENA');
INSERT INTO `mail` VALUES ('1509', '7', 'info@bookseller.it', 'STELLA ROMEO');
INSERT INTO `mail` VALUES ('1510', '7', 'neri.alessio@virgilio.it', 'NERI ALESSIO');
INSERT INTO `mail` VALUES ('1511', '7', 'lucillabernardi@yahoo.it', 'BERNARDI LUCILLA');
INSERT INTO `mail` VALUES ('1512', '7', 'grazianigiulia@yahoo.it', 'GRAZIANI GIULIA');
INSERT INTO `mail` VALUES ('1513', '7', 'e.monti3@gmail.com', 'MONTI ELENA');
INSERT INTO `mail` VALUES ('1514', '7', 'alessandrabianco89@gmail.com', 'BIANCO ALESSANDRA');
INSERT INTO `mail` VALUES ('1515', '7', 'c.inglis@hotmail.it', 'INGLIS CHIARA');
INSERT INTO `mail` VALUES ('1516', '7', 'soniamartini@tin.it', 'MARTINI SONIA');
INSERT INTO `mail` VALUES ('1517', '7', 'simona_fratini@virgilio.it', 'FRATINI SIMONA');
INSERT INTO `mail` VALUES ('1518', '7', 'elenacolombini@gmail.com', 'COLOMBINI ELENA');
INSERT INTO `mail` VALUES ('1519', '7', 'cp.pizzo@libero.it', 'PIZZO CRISTINA');
INSERT INTO `mail` VALUES ('1520', '7', 'stori.fra@gmail.com', 'STORI FRANCESCA');
INSERT INTO `mail` VALUES ('1521', '7', 'iphoneeli@hotmail.it', 'SABBADINI ELISA');
INSERT INTO `mail` VALUES ('1522', '7', 'giovanna.mascheroni@alice.it', 'MASCHERONI GIOVANNA');
INSERT INTO `mail` VALUES ('1523', '7', 'alessandromazzei@alice.it', 'MAZZEI ALESSANDRO');
INSERT INTO `mail` VALUES ('1524', '7', 'antonella.atzeni@alice.it', 'ATZENI ANTONELLA');
INSERT INTO `mail` VALUES ('1525', '7', 'laurog67@gmail.com', 'ROGAI LAURA');
INSERT INTO `mail` VALUES ('1526', '7', 'federicaartini@gmail.com', 'ARTINI FEDERICA');
INSERT INTO `mail` VALUES ('1527', '7', 'paolovignali@hotmail.com', 'VIGNALI PAOLO');
INSERT INTO `mail` VALUES ('1528', '7', 'avv.v.tellini@gmail.com', 'TELLINI VALERIA');
INSERT INTO `mail` VALUES ('1529', '7', 'g.pecchioli@virgilio.it', 'PECCHIOLI CARLA MARIA');
INSERT INTO `mail` VALUES ('1530', '7', 'marconocchi@virgilio.it', 'NOCCHI MARCO');
INSERT INTO `mail` VALUES ('1531', '7', 'fashionsun.m@libero.it', 'GRECO LUIGI');
INSERT INTO `mail` VALUES ('1532', '7', 'cinziadipio@gmail.com', 'DI PIO CINZIA');
INSERT INTO `mail` VALUES ('1533', '7', 'dcoppola@studiotributariosiciliano.it', 'COPPOLA DANIELA');
INSERT INTO `mail` VALUES ('1534', '7', 'patrizia.amolini@libero.it', 'AMOLINI PATRIZIA');
INSERT INTO `mail` VALUES ('1535', '7', 'pieragalli@unisi.it', 'PIERAGALLI DANIELA');
INSERT INTO `mail` VALUES ('1536', '7', 'crys63@libero.it', 'MEZZABOTTA CRISTIANA');
INSERT INTO `mail` VALUES ('1537', '7', 'monica@studiotiberio.net', 'BECAGLI MONICA');
INSERT INTO `mail` VALUES ('1538', '7', 'massimilianomalavasi@libero.it', 'MALAVASI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1539', '7', 'angelafava@hotmail.it', 'FAVA GALLI ANGELA');
INSERT INTO `mail` VALUES ('1540', '7', 'fedefedeli@hotmail.it', 'FEDELI FEDERICA');
INSERT INTO `mail` VALUES ('1541', '7', 'loresatti@libero.it', 'SATTI LORENZO');
INSERT INTO `mail` VALUES ('1542', '7', 'annabianca60@yahoo.it', 'BROGIONI ANNA');
INSERT INTO `mail` VALUES ('1543', '7', 'silvia.stivali@libero.it', 'STIVALI SILVIA');
INSERT INTO `mail` VALUES ('1544', '7', 'pulsini@libero.it', 'BENOCCI PAOLA');
INSERT INTO `mail` VALUES ('1545', '7', 'elisacapacci@hotmail.com', 'CAPACCI ELISA');
INSERT INTO `mail` VALUES ('1546', '7', 'iaia.thebest96@hotmail.it', 'RENIERI ILARIA');
INSERT INTO `mail` VALUES ('1547', '7', 'marghe.rauccio@libero.it', 'RAUCCIO MARGHERITA');
INSERT INTO `mail` VALUES ('1548', '7', 'f.martini75@gmail.com', 'MARTINI FRANCESCO');
INSERT INTO `mail` VALUES ('1549', '7', 'lucillabianchi@fastwebnet.it', 'BIANCHI LUCILLA');
INSERT INTO `mail` VALUES ('1550', '7', 'lidiacasa@tin.it', 'CASA LIDIA');
INSERT INTO `mail` VALUES ('1551', '7', 'dino.paolino888@gmail.com', 'PAOLINO DINO');
INSERT INTO `mail` VALUES ('1552', '7', 'antonella.mugnaini@alice.it', 'MUGNAINI ANTONELLA');
INSERT INTO `mail` VALUES ('1553', '7', 'federicominio@commercialisti.fi.it', 'MINIO FEDERICO');
INSERT INTO `mail` VALUES ('1554', '7', 'stefanomomb@libero.it', 'MOMBELLI STEFANO');
INSERT INTO `mail` VALUES ('1555', '7', 'peggyper@gmail.com', 'LEDDA LAURA');
INSERT INTO `mail` VALUES ('1556', '7', 'marco.ciardi@cirdim.191.it', 'CANDI ROMINA');
INSERT INTO `mail` VALUES ('1557', '7', 'cristina@studio.venezia.it', 'VINCIGUERRA CRISTINA');
INSERT INTO `mail` VALUES ('1558', '7', 'gabri21@virgilio.it', 'FALUGIANI GABRIELLA');
INSERT INTO `mail` VALUES ('1559', '7', 'fiamma48@gmail.com', 'CAVIGLIA EMMA');
INSERT INTO `mail` VALUES ('1560', '7', 'cabi2001@alice.it', 'TORRONI SILVIA');
INSERT INTO `mail` VALUES ('1561', '7', 'enrico.fazio@toscotec.com', 'FAZIO ENRICO');
INSERT INTO `mail` VALUES ('1562', '7', 'federica.targi@gmail.com', 'TARGI FEDERICA');
INSERT INTO `mail` VALUES ('1563', '7', 'elena.conti@bramante.eu', 'CONTI ELENA');
INSERT INTO `mail` VALUES ('1564', '7', 'cerretanimax@virgilio.it', 'CERRETANI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1565', '7', 'alicetrambusti@yahoo.it', 'TRAMBUSTI ALICE');
INSERT INTO `mail` VALUES ('1566', '7', 'patrizia.burgatto@fastwebnet.it', 'BURGATTO PATRIZIA');
INSERT INTO `mail` VALUES ('1567', '7', 'piccolodrago75@gmail.com', 'LARI RICCARDO');
INSERT INTO `mail` VALUES ('1568', '7', 'lc.doc@alice.it', 'CARPENTIERI LAURA');
INSERT INTO `mail` VALUES ('1569', '7', 'aldopatruno83@gmail.com', 'PATRUNO ALDO');
INSERT INTO `mail` VALUES ('1570', '7', 'gabrielladipasquale721@gmail.com', 'DI PASQUALE GABRIELLA');
INSERT INTO `mail` VALUES ('1571', '7', 'saradanti@libero.it', 'DANTI SARA');
INSERT INTO `mail` VALUES ('1572', '7', 'paladiialina@yahoo.it', 'PALADII ALINA');
INSERT INTO `mail` VALUES ('1573', '7', 'zeni.paola64@alice.it', 'ZENI PAOLA');
INSERT INTO `mail` VALUES ('1574', '7', 'mimmiletizia@yahoo.it', 'MARIANI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('1575', '7', 'giovanna131@hotmail.it', 'BARSACCHI GIOVANNA');
INSERT INTO `mail` VALUES ('1576', '7', 'beabiffa@alice.it', 'BIFFONI BEATRICE');
INSERT INTO `mail` VALUES ('1577', '7', 'simone.ricceri@gmail.com', 'RICCERI SIMONE');
INSERT INTO `mail` VALUES ('1578', '7', 'simorucci@libero.it', 'MORUCCI SIMONETTA');
INSERT INTO `mail` VALUES ('1579', '7', 'artegessodi@alice.it', 'LAURETI STEFANO');
INSERT INTO `mail` VALUES ('1580', '7', 'nacchera749@libero.it', 'BUFFI ANNAMARIA');
INSERT INTO `mail` VALUES ('1581', '7', 'virgycasalicchio@libero.it', 'CASALICCHIO VIRGINIA');
INSERT INTO `mail` VALUES ('1582', '7', 'ecipollini@virgilio.it', 'CIPOLLINI ENRICO');
INSERT INTO `mail` VALUES ('1583', '7', 'p.ardenghi@enegan.it', 'ARDENGHI PAOLA LINDA');
INSERT INTO `mail` VALUES ('1584', '7', 'pezzullo.maria@libero.it', 'PEZZULLO MARIA');
INSERT INTO `mail` VALUES ('1585', '7', 'laura_disanto@hotmail.it', 'DI SANTO LAURA');
INSERT INTO `mail` VALUES ('1586', '7', 'sarracino_91@live.it', 'CIAMPA PAOLO');
INSERT INTO `mail` VALUES ('1587', '7', 'kittyska@hotmail.it', 'GUIDONI CATERINA');
INSERT INTO `mail` VALUES ('1588', '7', 'amministrazione@giorgiobandini.it', 'BANDINI GIORGIO');
INSERT INTO `mail` VALUES ('1589', '7', 'alessandra.bianchi74@virgilio.it', 'BIANCHI ALESSANDRA');
INSERT INTO `mail` VALUES ('1590', '7', 'emcola2011@yahoo.it', 'GATTAI CHIARA');
INSERT INTO `mail` VALUES ('1591', '7', 'susannatarsi1@gmail.com', 'TARSI SUSANNA');
INSERT INTO `mail` VALUES ('1592', '7', 'l.cacciari@libero.it', 'CACCIARI LETIZIA');
INSERT INTO `mail` VALUES ('1593', '7', 'ale_avataneo@yahoo.it', 'AVATANEO ALESSANDRA');
INSERT INTO `mail` VALUES ('1594', '7', 'emibarta76@virgilio.it', 'BARTALUCCI EMILIANO');
INSERT INTO `mail` VALUES ('1595', '7', 'michele_mazzetti@yahoo.it', 'MAZZETTI MICHELE');
INSERT INTO `mail` VALUES ('1596', '7', 's.iandelli@alice.it', 'IANDELLI SILVIA');
INSERT INTO `mail` VALUES ('1597', '7', 'simolan@gmail.com', 'LANDOZZI SIMONA');
INSERT INTO `mail` VALUES ('1598', '7', 'lucagerace67@gmail.com', 'GERACE LUCA');
INSERT INTO `mail` VALUES ('1599', '7', 'aleabbate@istat.it', 'ABBATE ALESSIA');
INSERT INTO `mail` VALUES ('1600', '7', 'info@meccanicacambi.it', 'CAMBI ELISABETTA');
INSERT INTO `mail` VALUES ('1601', '7', 'da.nuti@alice.it', 'NUTI DANIELA');
INSERT INTO `mail` VALUES ('1602', '7', 'ace06@katamail.com', 'MARIOTTI CRISTINA');
INSERT INTO `mail` VALUES ('1603', '7', 'beatricecianciolo@tiscali.it', 'CIANCIOLO BEATRICE');
INSERT INTO `mail` VALUES ('1604', '7', 'elisabettaely@libero.it', 'SARTONI ELISABETTA');
INSERT INTO `mail` VALUES ('1605', '7', 'gionnidepirro@hotmail.it', 'DE PIRRO GIONNI');
INSERT INTO `mail` VALUES ('1606', '7', 'sabrinare@me.com', 'PISANI SABRINA');
INSERT INTO `mail` VALUES ('1607', '7', 'paola@saniscope-chimica.it', 'SANI PAOLA');
INSERT INTO `mail` VALUES ('1608', '7', 'ema.savini@alice.it', 'SANI CINZIA');
INSERT INTO `mail` VALUES ('1609', '7', 'alicialubrani@gmail.com', 'LUBRANI ALICIA');
INSERT INTO `mail` VALUES ('1610', '7', 'jonathanallegria90@hotmail.it', 'ALLEGRIA JONATHAN');
INSERT INTO `mail` VALUES ('1611', '7', 'aleshiatsu@tiscali.it', 'NERI ALESSANDRO');
INSERT INTO `mail` VALUES ('1612', '7', 'lorenapizzi@hotmail.com', 'PIZZI LORENA');
INSERT INTO `mail` VALUES ('1613', '7', 'carlo.gaffurini@libero.it', 'GAFFURINI CARLO');
INSERT INTO `mail` VALUES ('1614', '7', 'milena.basciu@gmail.com', 'BASCIU MILENA');
INSERT INTO `mail` VALUES ('1615', '7', 'respcoop@aosiena.toscana.it', 'SEVERI MARCO');
INSERT INTO `mail` VALUES ('1616', '7', 'chiaratofani@alice.it', 'TOFANI CHIARA');
INSERT INTO `mail` VALUES ('1617', '7', 'bronchi.fabrizio@tin.it', 'BRONCHI FABRIZIO');
INSERT INTO `mail` VALUES ('1618', '7', 'silvy.bianchi@gmail.com', 'BIANCHI SILVIA');
INSERT INTO `mail` VALUES ('1619', '7', 'antonellabartoli3@virgilio.it', 'BARTOLI ANTONELLA');
INSERT INTO `mail` VALUES ('1620', '7', 'lollibetti@gmail.com', 'MARTELLI LAURA');
INSERT INTO `mail` VALUES ('1621', '7', 'lmanenti@lavoro.gov.it', 'MANENTI LORETA');
INSERT INTO `mail` VALUES ('1622', '7', 'sandrogromegrosoli@gmail.com', 'GROSOLI SANDRO');
INSERT INTO `mail` VALUES ('1623', '7', 'claudio.ficini@bayer.com', 'FICINI CLAUDIO');
INSERT INTO `mail` VALUES ('1624', '7', 'mauro.bartali@gmail.com', 'BARTALI MAURO');
INSERT INTO `mail` VALUES ('1625', '7', 'chiara51@gmail.com', 'RAGNI CHIARA');
INSERT INTO `mail` VALUES ('1626', '7', 'laura.legrenzi@libero.it', 'LEGRENZI LAURA');
INSERT INTO `mail` VALUES ('1627', '7', 'aletonelli1966@gmail.com', 'TONELLI ALESSANDRA');
INSERT INTO `mail` VALUES ('1628', '7', 'federica.carresi@virgilio.it', 'CARRESI FEDERICA');
INSERT INTO `mail` VALUES ('1629', '7', 'fergosti@nkey.it', 'FERGOSTI SILVIA');
INSERT INTO `mail` VALUES ('1630', '7', 'abgiova@tiscali.it', 'VECCHIOTTI BARBARA');
INSERT INTO `mail` VALUES ('1631', '7', 'paola.trotti@libero.it', 'TROTTI PAOLA');
INSERT INTO `mail` VALUES ('1632', '7', 'msmaddalena@gmail.com', 'SCORRETTI MADDALENA');
INSERT INTO `mail` VALUES ('1633', '7', 'mbalestra77@gmail.com', 'BALESTRA MARIANNA');
INSERT INTO `mail` VALUES ('1634', '7', 'silvia.branzanti@gmail.com', 'BRANZANTI SILVIA');
INSERT INTO `mail` VALUES ('1635', '7', 'renierigianni@email.it', 'RENIERI GIANNI');
INSERT INTO `mail` VALUES ('1636', '7', 'marianagolub@yahoo.it', 'GOLUB MARIANA');
INSERT INTO `mail` VALUES ('1637', '7', 'giuliafraternale@libero.it', 'FRATERNALE GIULIA');
INSERT INTO `mail` VALUES ('1638', '7', 'salazza75@gmail.com', 'LAZZARINI SABRINA');
INSERT INTO `mail` VALUES ('1639', '7', 'fallettimc@yahoo.it', 'FALLETTI MARIA CHIARA');
INSERT INTO `mail` VALUES ('1640', '7', 'mati.chelini@gmail.com', 'CHELINI MATILDE');
INSERT INTO `mail` VALUES ('1641', '7', 'marianeve.vitiello@gmail.com', 'VITIELLO MARIANEVE');
INSERT INTO `mail` VALUES ('1642', '7', 'liana.bizzarri@libero.it', 'BIZZARRI LIANA');
INSERT INTO `mail` VALUES ('1643', '7', 'annalisa.poggialini@unisi.it', 'POGGIALINI ANNALISA');
INSERT INTO `mail` VALUES ('1644', '7', 'pacogiu@libero.it', 'GIUDICE PASQUALE PAOLO');
INSERT INTO `mail` VALUES ('1645', '7', 'buoni.m@libero.it', 'BUONI MARIANNE');
INSERT INTO `mail` VALUES ('1646', '7', 'ceciliamangia@libero.it', 'MANGIAVACCHI CECILIA');
INSERT INTO `mail` VALUES ('1647', '7', 'francescabechini71@gmail.com', 'BECHINI FRANCESCA');
INSERT INTO `mail` VALUES ('1648', '7', 'veronica.fiorentini@alice.com', 'FIORENTINI VERONICA');
INSERT INTO `mail` VALUES ('1649', '7', 'laura.tei@banca.mps.it', 'TEI LAURA');
INSERT INTO `mail` VALUES ('1650', '7', 'ilaecris@yahoo.it', 'CRIVELLONE ILARIA');
INSERT INTO `mail` VALUES ('1651', '7', 'stocchi@gmail.com', 'STOCCHI LORENZO');
INSERT INTO `mail` VALUES ('1652', '7', 'casinist@alice.it', 'CASINI STEFANO');
INSERT INTO `mail` VALUES ('1653', '7', 'symonamartelli@alice.it', 'PIERATTINI SIMONA');
INSERT INTO `mail` VALUES ('1654', '7', 'lucamoresi@libero.it', 'MORESI LUCA');
INSERT INTO `mail` VALUES ('1655', '7', 'a.materozzi@annamaterozzi.it', 'MATEROZZI ANNA');
INSERT INTO `mail` VALUES ('1656', '7', 'veronicamazzei@yahoo.it', 'MAZZEI VERONICA');
INSERT INTO `mail` VALUES ('1657', '7', 'd.tudisca@e-abcitaly.com', 'TUDISCA DOMITILLA');
INSERT INTO `mail` VALUES ('1658', '7', 'rossanacini@gmail.com', 'CINI ROSSANA');
INSERT INTO `mail` VALUES ('1659', '7', 'michelagorla@me.com', 'GORLA MICHELA');
INSERT INTO `mail` VALUES ('1660', '7', 'gianni.grassi@banfi.it', 'GRASSI GIANNI');
INSERT INTO `mail` VALUES ('1661', '7', 'lorinicco@alice.it', 'CONTICELLI CLAUDIO');
INSERT INTO `mail` VALUES ('1662', '7', 'ilariavasarri@gmail.com', 'VASARRI ILARIA');
INSERT INTO `mail` VALUES ('1663', '7', 'caterinancona@hotmail.it', 'ANCONA CATERINA');
INSERT INTO `mail` VALUES ('1664', '7', 'osca1968@interfree.it', 'BRUNI CINZIA');
INSERT INTO `mail` VALUES ('1665', '7', 'claudiadellaverde@hotmail.it', 'DELLA VERDE CLAUDIA');
INSERT INTO `mail` VALUES ('1666', '7', 'amaliasaltarelli@yahoo.it', 'SALTARELLI AMALIA');
INSERT INTO `mail` VALUES ('1667', '7', 'mancianti@libero.it', 'MANCIANTI FILIPPO');
INSERT INTO `mail` VALUES ('1668', '7', 'bruny53@gmail.com', 'MASSARI BRUNELLA');
INSERT INTO `mail` VALUES ('1669', '7', 'stenoservice@virgilio.it', 'ONTANI CINZIA');
INSERT INTO `mail` VALUES ('1670', '7', 'cristianosaverio60@gmail.com', 'CRISTIANO SAVERIO');
INSERT INTO `mail` VALUES ('1671', '7', 'arclva@tiscali.it', 'VALDRIGHI CLAUDIO');
INSERT INTO `mail` VALUES ('1672', '7', 'silvia-severi@tiscali.it', 'SEVERI SILVIA');
INSERT INTO `mail` VALUES ('1673', '7', 'ire_c90@hotmail.it', 'COCCHI IRENE');
INSERT INTO `mail` VALUES ('1674', '7', 'serena.bargellini@hotmail.it', 'BARGELLINI SERENA');
INSERT INTO `mail` VALUES ('1675', '7', 'vferrarav@libero.it', 'FERRARA VALENTINA');
INSERT INTO `mail` VALUES ('1676', '7', 'riccardo.mecheroni@gmail.com', 'MECHERONI RICCARDO');
INSERT INTO `mail` VALUES ('1677', '7', 'valebellucci@virgilio.it', 'BELLUCCI VALENTINA');
INSERT INTO `mail` VALUES ('1678', '7', 'sara.buccelli@libero.it', 'BUCCELLI SARA');
INSERT INTO `mail` VALUES ('1679', '7', 'elolove@hotmail.it', 'TOGNETTI ELOISA');
INSERT INTO `mail` VALUES ('1680', '7', 'riccarelli@cybermarket.it', 'GISTRI ROSSELLA');
INSERT INTO `mail` VALUES ('1681', '7', 'massimo.mazzini@alice.it', 'MAZZINI MASSIMO');
INSERT INTO `mail` VALUES ('1682', '7', 'stefadany@libero.it', 'GIANNI STEFANO');
INSERT INTO `mail` VALUES ('1683', '7', 'fedebat@yahoo.it', 'BATTIGLIA FEDERICO');
INSERT INTO `mail` VALUES ('1684', '7', 'pieralli.c@gmail.com', 'PIERALLI CRISTINA');
INSERT INTO `mail` VALUES ('1685', '7', 'mail@cabiaglia.com', 'CABIAGLIA ELISABETTA');
INSERT INTO `mail` VALUES ('1686', '7', 'v.direnzo@alice.it', 'DIRENZO VINCENZA');
INSERT INTO `mail` VALUES ('1687', '7', 'sandro.tafani@gmail.com', 'TAFANI SANDRO');
INSERT INTO `mail` VALUES ('1688', '7', 'riccardovinc@hotmail.com', 'VINCIGUERRA RICCARDO');
INSERT INTO `mail` VALUES ('1689', '7', 'roberta.vestri.63@gmail.com', 'VESTRI ROBERTA');
INSERT INTO `mail` VALUES ('1690', '7', 'lorycarretta@libero.it', 'CARRETTA LOREDANA');
INSERT INTO `mail` VALUES ('1691', '7', 'francesca.b.li@katamail.com', 'BERTELLI FRANCESCA');
INSERT INTO `mail` VALUES ('1692', '7', 'luigina.carretta@gmail.com', 'CARRETTA LUIGINA');
INSERT INTO `mail` VALUES ('1693', '7', 'margi.signorini@gmail.com', 'SIGNORINI MARIARITA');
INSERT INTO `mail` VALUES ('1694', '7', 'morimonica@virgilio.it', 'MORI MONICA');
INSERT INTO `mail` VALUES ('1695', '7', 'enri1492@gmail.com', 'BERNARDINI ENRICO');
INSERT INTO `mail` VALUES ('1696', '7', 'mariaantonellaferri@gmail.com', 'FERRI MARIA ANTONELLA');
INSERT INTO `mail` VALUES ('1697', '7', 'c.stammati@gmail.com', 'STAMMATI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('1698', '7', 'edilzak@libero.it', 'ANNIBALE CLOTILDE');
INSERT INTO `mail` VALUES ('1699', '7', 'ranierimartina@gmail.com', 'RANIERI MARTINA');
INSERT INTO `mail` VALUES ('1700', '7', 'paolo.brogi1@libero.it', 'BROGI PAOLO');
INSERT INTO `mail` VALUES ('1701', '7', 'barbara.sodi@hotmail.it', 'SODI BARBARA');
INSERT INTO `mail` VALUES ('1702', '7', 'info@gloriacampriani.com', 'CAMPRIANI GLORIA');
INSERT INTO `mail` VALUES ('1703', '7', 'cristina.sanesi@hotmail.it', 'SANESI CRISTINA');
INSERT INTO `mail` VALUES ('1704', '7', 'lucreiz.nik@gmail.com', 'NICCOLI ANNA');
INSERT INTO `mail` VALUES ('1705', '7', 'giu46@hotmail.com', 'ROSSI GIULIA');
INSERT INTO `mail` VALUES ('1706', '7', 'fabry.funaro@gmail.com', 'FUNARO GABRIELLA');
INSERT INTO `mail` VALUES ('1707', '7', 'scali_marco@hotmail.it', 'SCALI MARCO');
INSERT INTO `mail` VALUES ('1708', '7', 'conforti.antonio@yahoo.it', 'CONFORTI ANTONIO');
INSERT INTO `mail` VALUES ('1709', '7', 'euro.blasi@dp2000.it', 'BLASI EURO');
INSERT INTO `mail` VALUES ('1710', '7', 'enrica.marzo@libero.it', 'MARZO ENRICA');
INSERT INTO `mail` VALUES ('1711', '7', 'contisonia67@gmail.com', 'CONTI SONIA');
INSERT INTO `mail` VALUES ('1712', '7', 'riccardo.demeo@copyworld.it', 'MANFRIANI LAURA');
INSERT INTO `mail` VALUES ('1713', '7', 'mf.faenza@gmail.com', 'FAENZA MARIA FRANCESCA');
INSERT INTO `mail` VALUES ('1714', '7', 'ulrico.paolucci@gmail.com', 'PAOLUCCI ULRICO');
INSERT INTO `mail` VALUES ('1715', '7', 'raul.ciulli@gmail.com', 'CIULLI STEFANO');
INSERT INTO `mail` VALUES ('1716', '7', 'carlo@smac-cornici.com', 'BORGHINI CARLO');
INSERT INTO `mail` VALUES ('1717', '7', 'monica.piva@hotmail.it', 'PIVA MONICA');
INSERT INTO `mail` VALUES ('1718', '7', 'giannaagosta@gmail.com', 'AGOSTA GIANNA');
INSERT INTO `mail` VALUES ('1719', '7', 'iacobelli.szego@gmail.com', 'IACOBELLI STEFANO');
INSERT INTO `mail` VALUES ('1720', '7', 'veronica.veneziani@gmail.com', 'VENEZIANI VERONICA');
INSERT INTO `mail` VALUES ('1721', '7', 'alessandracarra@tiscali.it', 'CARRA ALESSANDRA');
INSERT INTO `mail` VALUES ('1722', '7', 'elizabethkoenig@gmail.com', 'KOENIG ELIZABETH');
INSERT INTO `mail` VALUES ('1723', '7', 'a.ghiandai@libero.it', 'GHIANDAI ALESSANDRA');
INSERT INTO `mail` VALUES ('1724', '7', 'ely.bocci@gmail.com', 'BOCCI ELISABETTA');
INSERT INTO `mail` VALUES ('1725', '7', 'info@super-travel.it', 'SOVANI SANDRA');
INSERT INTO `mail` VALUES ('1726', '7', 'avvbrunodini@virgilio.it', 'DINI BRUNO');
INSERT INTO `mail` VALUES ('1727', '7', 'larcierone90@libero.it', 'PALLARI SAMUELE');
INSERT INTO `mail` VALUES ('1728', '7', 'vivacaterina@gmail.com', 'GIUDICI CATERINA');
INSERT INTO `mail` VALUES ('1729', '7', 'gianni@josu.it', 'ACCIAI GIANNI');
INSERT INTO `mail` VALUES ('1730', '7', 'vincenzo.francomano@alice.it', 'FRANCOMANO VINCENZO');
INSERT INTO `mail` VALUES ('1731', '7', 'federicopiccioli50@yahoo.it', 'PICCIOLI FEDERICO');
INSERT INTO `mail` VALUES ('1732', '7', 'costanza.quaratesi@gmail.com', 'QUARATESI COSTANZA');
INSERT INTO `mail` VALUES ('1733', '7', 's.petragli@gmail.com', 'PETRAGLI STEFANIA');
INSERT INTO `mail` VALUES ('1734', '7', 'caterina.fabbiani@mps.it', 'FABBIANI CATERINA');
INSERT INTO `mail` VALUES ('1735', '7', 'deborapieri.20@gmail.com', 'PIERI DEBORA');
INSERT INTO `mail` VALUES ('1736', '7', 'kaima200@yahoo.it', 'ROMANO OTTAVO');
INSERT INTO `mail` VALUES ('1737', '7', 'g.salvini@tin.it', 'FANTONI ANTONELLA');
INSERT INTO `mail` VALUES ('1738', '7', 'robertocosti@virgilio.it', 'COSTI ROBERTO');
INSERT INTO `mail` VALUES ('1739', '7', 'tonellielena@libero.it', 'TONELLI MARIA ELENA');
INSERT INTO `mail` VALUES ('1740', '7', 'maisto.alessandro@tiscali.it', 'MAISTO ALESSANDRO STEFANO');
INSERT INTO `mail` VALUES ('1741', '7', 'francesca.piccardi@gmail.com', 'PICCARDI FRANCESCA');
INSERT INTO `mail` VALUES ('1742', '7', 'alessandro_veneri1@virgilio.it', 'VENERI ALESSANDRO');
INSERT INTO `mail` VALUES ('1743', '7', 'signori.fabio@gmail.com', 'SIGNORI FABIO');
INSERT INTO `mail` VALUES ('1744', '7', 'denisecolicchi@virgilio.it', 'COLICCHI DENISE');
INSERT INTO `mail` VALUES ('1745', '7', 'silvia.tavanti@gmail.com', 'TAVANTI SILVIA');
INSERT INTO `mail` VALUES ('1746', '7', 'giulia.vezzosi@me.com', 'VEZZOSI GIULIA');
INSERT INTO `mail` VALUES ('1747', '7', 'carstabile@hotmail.it', 'STABILE CARMEN');
INSERT INTO `mail` VALUES ('1748', '7', 'ciarpa@hotmail.com', 'CIARPAGLINI RICCARDO');
INSERT INTO `mail` VALUES ('1749', '7', 'carmen_pizzonia@libero.it', 'PIZZONIA CARMEN');
INSERT INTO `mail` VALUES ('1750', '7', 'fabioscardicci@gmail.com', 'SCARDICCI FABIO');
INSERT INTO `mail` VALUES ('1751', '7', 'fedegiova@hotmail.it', 'GIOVANNETTI FEDERICO');
INSERT INTO `mail` VALUES ('1752', '7', 'apaolucci@aliceposta.it', 'PAOLUCCI ANTONELLA');
INSERT INTO `mail` VALUES ('1753', '7', 'francescobarone2013@yahoo.it', 'BARONE FRANCESCO');
INSERT INTO `mail` VALUES ('1754', '7', 'cosmelani@gmail.com', 'MELANI COSTANZA');
INSERT INTO `mail` VALUES ('1755', '7', 'cherubinilorenzo@gmail.com', 'CHERUBINI LORENZO');
INSERT INTO `mail` VALUES ('1756', '7', 'barbara.izzi@inwind.it', 'IZZI BARBARA');
INSERT INTO `mail` VALUES ('1757', '7', 'alessandra.bruni@usl8.toscana.it', 'BRUNI ALESSANDRA');
INSERT INTO `mail` VALUES ('1758', '7', 'sary2981@libero.it', 'ROSATI SARA');
INSERT INTO `mail` VALUES ('1759', '7', 'alberto.pastore@gmail.com', 'PASTORE ALBERTO');
INSERT INTO `mail` VALUES ('1760', '7', 'serena.poggesi@val.it', 'POGGESI SANDRO');
INSERT INTO `mail` VALUES ('1761', '7', 'baldii.adriano@gmail.com', 'BALDI ADRIANO');
INSERT INTO `mail` VALUES ('1762', '7', 'babycico@gmail.com', 'CICOGNANI BARBARA');
INSERT INTO `mail` VALUES ('1763', '7', 'chiesa20@virgilio.it', 'ANICHINI FRANCESCO');
INSERT INTO `mail` VALUES ('1764', '7', 'francesca.santoro@comune.fi.it', 'SANTORO FRANCESCA');
INSERT INTO `mail` VALUES ('1765', '7', 'marco.romoli@it.gucci.com', 'ROMOLI MARCO');
INSERT INTO `mail` VALUES ('1766', '7', 'cristina_mameli@hotmail.com', 'SCRIBANO CRISTINA');
INSERT INTO `mail` VALUES ('1767', '7', 'lisa.lazzeri696@gmail.com', 'LAZZERI LISA');
INSERT INTO `mail` VALUES ('1768', '7', 'fabio.melo@hotmail.it', 'MELONI FABIO');
INSERT INTO `mail` VALUES ('1769', '7', 'lucia.chierici@tin.it', 'CHIERICI LUCIA');
INSERT INTO `mail` VALUES ('1770', '7', 'carolinabonci@gmail.com', 'BONCI CAROLINA');
INSERT INTO `mail` VALUES ('1771', '7', 'massimiliano@masonipietro.it', 'ARNECCHI MASSIMILIANO');
INSERT INTO `mail` VALUES ('1772', '7', 'giancabruni64@hotmail.it', 'BRUNI GIANCARLO');
INSERT INTO `mail` VALUES ('1773', '7', 'monica.coradeschi@live.it', 'TRUSSARDI CORADESCHI MONICA');
INSERT INTO `mail` VALUES ('1774', '7', 'agrechi5@gmail.com', 'GRECHI ALESSANDRA');
INSERT INTO `mail` VALUES ('1775', '7', 'fratecola@yahoo.it', 'FEDELI IGNAZIA');
INSERT INTO `mail` VALUES ('1776', '7', 'livornino@gmail.com', 'MARRAS PAOLA');
INSERT INTO `mail` VALUES ('1777', '7', 'angelicalibretti11@gmail.com', 'LIBRETTI ANGELICA');
INSERT INTO `mail` VALUES ('1778', '7', 'federica.tradexport@gmail.com', 'GHIOMELLI FEDERICA');
INSERT INTO `mail` VALUES ('1779', '7', 'giuliafiorelli@hotmail.it', 'FIORELLI GIULIA');
INSERT INTO `mail` VALUES ('1780', '7', 'e.nannini@icloud.com', 'BIANCHI ELEONORA');
INSERT INTO `mail` VALUES ('1781', '7', 'caty.caty1977@hotmail.it', 'CAZZANIGA CATERINA');
INSERT INTO `mail` VALUES ('1782', '7', 'lubi.lubi@virgilio.it', 'VIVIANI LUCIA');
INSERT INTO `mail` VALUES ('1783', '7', 'samantagabbrielli@icloud.com', 'GABBRIELLI SAMANTA');
INSERT INTO `mail` VALUES ('1784', '7', 'barbarag@biosys.it', 'GREGORI BARBARA');
INSERT INTO `mail` VALUES ('1785', '7', 'crisscant@libero.it', 'CANTAGALLI CRISTIANA');
INSERT INTO `mail` VALUES ('1786', '7', 'linorenzi@alice.it', 'RENZI LINO');
INSERT INTO `mail` VALUES ('1787', '7', 'sandrapancini@hotmail.it', 'PANCINI SANDRA');
INSERT INTO `mail` VALUES ('1788', '7', 'babbomarchino@gmail.com', 'MILESU MARCO');
INSERT INTO `mail` VALUES ('1789', '7', 'carlabiasio@yahoo.it', 'BIASIO CARLA');
INSERT INTO `mail` VALUES ('1790', '7', 'raffaelelobuono@alice.it', 'LO BUONO RAFFAELE');
INSERT INTO `mail` VALUES ('1791', '7', 'igor76@libero.it', 'FINOCCHI ENRICO');
INSERT INTO `mail` VALUES ('1792', '7', 'barbaratamantini@gmail.com', 'TAMANTINI BARBARA');
INSERT INTO `mail` VALUES ('1793', '7', 'om_nefertari@hotmail.com', 'CIMONI SARA');
INSERT INTO `mail` VALUES ('1794', '7', 'fiamma.mazzini@hotmail.it', 'MAZZINI FIAMMA');
INSERT INTO `mail` VALUES ('1795', '7', 'silviarabatti@virgilio.it', 'RABATTI SILVIA');
INSERT INTO `mail` VALUES ('1796', '7', 'marcoserrai@katamail.com', 'SERRAI MARCO');
INSERT INTO `mail` VALUES ('1797', '7', 'paolapi2010@libero.it', 'PIEROTTI PAOLA');
INSERT INTO `mail` VALUES ('1798', '7', 'angelica@guidi.it', 'GUIDI ANGELICA');
INSERT INTO `mail` VALUES ('1799', '7', 'studiotec@dunia.it', 'GUALTIERI PAOLO');
INSERT INTO `mail` VALUES ('1800', '7', 'annalisacentrobenessere@gmail.com', 'BARBAGALLO ANNALISA');
INSERT INTO `mail` VALUES ('1801', '7', 'danielapicchiotti@hotmail.com', 'PICCHIOTTI DANIELA');
INSERT INTO `mail` VALUES ('1802', '7', 'marinacolombo59@gmail.com', 'COLOMBO MARINA');
INSERT INTO `mail` VALUES ('1803', '7', 'stefania.romoli1@banca.mps.it', 'ROMOLI STEFANIA');
INSERT INTO `mail` VALUES ('1804', '7', 'f.michelle@tin.it', 'ARDEMOGNI MICHELLE');
INSERT INTO `mail` VALUES ('1805', '7', 'guglielmo.gaggioli@gmail.com', 'GAGGIOLI GUGLIELMO');
INSERT INTO `mail` VALUES ('1806', '7', 'giachetti.claudia@gmail.com', 'GIACHETTI CLAUDIA');
INSERT INTO `mail` VALUES ('1807', '7', 'senianeri@gmail.com', 'INNOCENTI ELISA');
INSERT INTO `mail` VALUES ('1808', '7', 'psicodramma@yahoo.it', 'FATIGHENTI SILVIA');
INSERT INTO `mail` VALUES ('1809', '7', 'cerrikuadmirim@yahoo.it', 'CERRIKU ADMIRIM');
INSERT INTO `mail` VALUES ('1810', '7', 'pamelacampassi@gmail.com', 'CAMPASSI PAMELA');
INSERT INTO `mail` VALUES ('1811', '7', 'rosa.falchipicchinesi@gmail.com', 'FALCHI PICCHINESI ROSA');
INSERT INTO `mail` VALUES ('1812', '7', 'info@sportflyclub.it', 'BARDI ENRICO');
INSERT INTO `mail` VALUES ('1813', '7', 'vignostefania@gmail.com', 'VIGNOLA STEFANIA');
INSERT INTO `mail` VALUES ('1814', '7', 'cardoni.carloluigi@libero.it', 'CARDONI CARLO LUIGI');
INSERT INTO `mail` VALUES ('1815', '7', 'michelaca.mc@gmail.com', 'CAMORCIA MICHELA');
INSERT INTO `mail` VALUES ('1816', '7', 'gabriponza@libero.it', 'PONZA GABRIELLA');
INSERT INTO `mail` VALUES ('1817', '7', 'lueraxhindole@yahoo.it', 'XHINDOLE LUERA');
INSERT INTO `mail` VALUES ('1818', '7', 'manfredaluca@rocketmail.com', 'MANFREDA LUCA');
INSERT INTO `mail` VALUES ('1819', '7', 'coppola.filomena@gmail.com', 'COPPOLA FILOMENA');
INSERT INTO `mail` VALUES ('1820', '7', 'ccros@tiscali.it', 'CACACE ROSARIA');
INSERT INTO `mail` VALUES ('1821', '7', 'giadagiustini@gmail.com', 'GIUSTINI GIADA');
INSERT INTO `mail` VALUES ('1822', '7', 'gandini.loredana@gmail.com', 'GANDINI LOREDANA');
INSERT INTO `mail` VALUES ('1823', '7', 'criminal90@gmail.com', 'MAZZOLI ENRICO');
INSERT INTO `mail` VALUES ('1824', '7', 'batani57@alice.it', 'BATANI SILVIA');
INSERT INTO `mail` VALUES ('1825', '7', 'camy801@tin.it', 'BERTI CAMILLA');
INSERT INTO `mail` VALUES ('1826', '7', 'jermy@hotmail.it', 'DALMAZIO GILDA');
INSERT INTO `mail` VALUES ('1827', '7', 'brunella@gbcserramenti.it', 'BARONTI BRUNELLA');
INSERT INTO `mail` VALUES ('1828', '7', 'dani.somigli@gmail.com', 'SOMIGLI DANIELA');
INSERT INTO `mail` VALUES ('1829', '7', 'sabrina407@alice.it', 'PONZIO MIMMA');
INSERT INTO `mail` VALUES ('1830', '7', 'robertocipri@gmail.com', 'CIPRIANI ROBERTO');
INSERT INTO `mail` VALUES ('1831', '7', 'elisabetta.ferri@gmail.com', 'FERRI ELISABETTA');
INSERT INTO `mail` VALUES ('1832', '7', 'patrizia.cerizzi@fastwebnet.it', 'CERIZZI PATRIZIA');
INSERT INTO `mail` VALUES ('1833', '7', 'gabriella.ferraro@hotmail.it', 'FERRARO GABRIELLA');
INSERT INTO `mail` VALUES ('1834', '7', 'mariapiafranci@hotmail.it', 'FRANCI MARIA PIA');
INSERT INTO `mail` VALUES ('1835', '7', 'b.vagaggini@alice.it', 'VAGAGGINI BARBARA');
INSERT INTO `mail` VALUES ('1836', '7', 'raffarusso79@libero.it', 'RUSSO RAFFAELLA');
INSERT INTO `mail` VALUES ('1837', '7', 'd.sassorossi@sassorossi.it', 'SASSOROSSI DEBORAH');
INSERT INTO `mail` VALUES ('1838', '7', 'alberto.obert@hotmail.it', 'OBERT ALBERTO');
INSERT INTO `mail` VALUES ('1839', '7', 'paolaricciolo@libero.it', 'AVONA PAOLA');
INSERT INTO `mail` VALUES ('1840', '7', 'flacapp@libero.it', 'BARDINE LEONARDO');
INSERT INTO `mail` VALUES ('1841', '7', 'm.filosomi@gmail.com', 'FILOSOMI MANUELE');
INSERT INTO `mail` VALUES ('1842', '7', 'ameliazanazzo@libero.it', 'ZANAZZO AMELIA');
INSERT INTO `mail` VALUES ('1843', '7', 'marcellavendemiale@alice.it', 'VENDEMIALE MARCELLA');
INSERT INTO `mail` VALUES ('1844', '7', 'mobylally78@hotmail.it', 'MALENTACCHI MICHELA');
INSERT INTO `mail` VALUES ('1845', '7', 'sarettacavalleri@gmail.com', 'CAVALLERI SARA MARIA');
INSERT INTO `mail` VALUES ('1846', '7', 'giuseppe.amapane@alice.it', 'AMAPANE GIUSEPPE');
INSERT INTO `mail` VALUES ('1847', '7', 'info@sordigiuseppe.it', 'ROSSI KATIA');
INSERT INTO `mail` VALUES ('1848', '7', 'elisabetta.puliti@gmail.com', 'PUòITI ELISABETTA');
INSERT INTO `mail` VALUES ('1849', '7', 'andrea.bazzotti@hotmail.com', 'BAZZOTTI ANDREA');
INSERT INTO `mail` VALUES ('1850', '7', 'ritapetrilli@gmail.com', 'PETRILLI RITA');
INSERT INTO `mail` VALUES ('1851', '7', 'alessandra@montanellimpianti.it', 'MONTANELLI ALESSANDRA');
INSERT INTO `mail` VALUES ('1852', '7', 'rosariadigregorio@inwind.it', 'DI GREGORIO ROSARIA');
INSERT INTO `mail` VALUES ('1853', '7', 'idavrbarbetti@gmail.com', 'BARBETTI IDA');
INSERT INTO `mail` VALUES ('1854', '7', 'avvocatovanni@gmail.com', 'VANNI FRANCESCA');
INSERT INTO `mail` VALUES ('1855', '7', 'sonia.quadri@alice.it', 'ROGHI SONIA');
INSERT INTO `mail` VALUES ('1856', '7', 'emanuelabel@gmail.com', 'BELIGNI CRISTINA');
INSERT INTO `mail` VALUES ('1857', '7', 'silviazoffoli@yahoo.it', 'ZOFFOLI SILVIA');
INSERT INTO `mail` VALUES ('1858', '7', 'ilariacdp@gmail.com', 'MORI ILARIA');
INSERT INTO `mail` VALUES ('1859', '7', 'valter.calonaci@gmail.com', 'CALONACI VALTER');
INSERT INTO `mail` VALUES ('1860', '7', 'simonepierini64@gmail.com', 'PIERINI SIMONE');
INSERT INTO `mail` VALUES ('1861', '7', 'costanzasag@yahoo.it', 'SAGRINATI COSTANZA');
INSERT INTO `mail` VALUES ('1862', '7', 'claudio.moscati@libero.it', 'MOSCATI CLAUDIO');
INSERT INTO `mail` VALUES ('1863', '7', 'alessandra.28@hotmail.it', 'MASSAI ALESSANDRA');
INSERT INTO `mail` VALUES ('1864', '7', 'simo.fri77@hotmail.it', 'FRIGENTI SIMONE');
INSERT INTO `mail` VALUES ('1865', '7', 'mami2246@gmail.com', 'MINUCCI MAURIZIO');
INSERT INTO `mail` VALUES ('1866', '7', 'mariofei@alice.it', 'FEI MARIO');
INSERT INTO `mail` VALUES ('1867', '7', 'manuelameier@hotmail.it', 'MEIER MANUELA');
INSERT INTO `mail` VALUES ('1868', '7', 'si.masini@gmail.com', 'MASINI SIMONA');
INSERT INTO `mail` VALUES ('1869', '7', 'ila.deglinnocenti@gmail.com', 'DEGLINNOCENTI ILARIA');
INSERT INTO `mail` VALUES ('1870', '7', 'tondi91@alice.it', 'PIZZETTI ANNALISA');
INSERT INTO `mail` VALUES ('1871', '7', 'mariagloriacardini@alice.it', 'CARDINI MARIA GLORIA');
INSERT INTO `mail` VALUES ('1872', '7', 'paolaporciatti@libero.it', 'PORCIATTI PAOLA');
INSERT INTO `mail` VALUES ('1873', '7', 'rossetti.rob@virgilio.it', 'ROSSETTI ROBERTA');
INSERT INTO `mail` VALUES ('1874', '7', 'monica.pecchioli@virgilio.it', 'PECCHIOLI MONICA');
INSERT INTO `mail` VALUES ('1875', '7', 'donatella.sellari.fr@tiscali.it', 'SELLARI DONATELLA');
INSERT INTO `mail` VALUES ('1876', '7', 'geraldineleardi@gmail.com', 'LEARDI GERALDINE');
INSERT INTO `mail` VALUES ('1877', '7', 'gabriellabetti@alice.it', 'BETTI GABRIELLA');
INSERT INTO `mail` VALUES ('1878', '7', 'mlgioia95@gmail.com', 'GIOIA MARIA LUANA');
INSERT INTO `mail` VALUES ('1879', '7', 'susanna.branca@gmail.com', 'BRANCA SUSANNA');
INSERT INTO `mail` VALUES ('1880', '7', 'gioia.andrea@libero.it', 'LIBERATORI GIOIA');
INSERT INTO `mail` VALUES ('1881', '7', 'francavecchioni@hotmail.com', 'VECCHIONI FRANCA');
INSERT INTO `mail` VALUES ('1882', '7', 'f.brevi@libero.it', 'BREVI FEDERICA');
INSERT INTO `mail` VALUES ('1883', '7', 'giallo.ottouno@gmail.com', 'ORBETTI MANUELA');
INSERT INTO `mail` VALUES ('1884', '7', 'cremonas@libero.it', 'UBALDINO EMILIO');
INSERT INTO `mail` VALUES ('1885', '7', 'paolbara@hotmail.com', 'BARABESI PAOLO');
INSERT INTO `mail` VALUES ('1886', '7', 'luciafornai@libero.it', 'FORNAI LUCIA');
INSERT INTO `mail` VALUES ('1887', '7', 'saudelli1927@gmail.com', 'SAUDELLI GIULIANO');
INSERT INTO `mail` VALUES ('1888', '7', 'mariapia.marsili@gmail.com', 'MARSILI MARIA PIA');
INSERT INTO `mail` VALUES ('1889', '7', 'lorenzoiocca@hotmail.com', 'IOCCA LORENZO');
INSERT INTO `mail` VALUES ('1890', '7', 'consuelobaldini@hotmail.it', 'BALDUINI CONSUELO');
INSERT INTO `mail` VALUES ('1891', '7', 'marydamata@yahoo.it', 'DAMATA MARIA');
INSERT INTO `mail` VALUES ('1892', '7', 'daniela.suero@alice.it', 'SUERO DANIELA');
INSERT INTO `mail` VALUES ('1893', '7', 'federicobigliazzi@gmail.com', 'BIGLIAZZI FEDERICO');
INSERT INTO `mail` VALUES ('1894', '7', 'alinamarinescu73@gmail.com', 'MARINESCU ALINA');
INSERT INTO `mail` VALUES ('1895', '7', 'maria.aiazzi@gmail.it', 'AIAZZI MARIA');
INSERT INTO `mail` VALUES ('1896', '7', 'simogov@libero.it', 'GOVERNI SIMONE');
INSERT INTO `mail` VALUES ('1897', '7', 'carlafioravanti@hotmail.it', 'FIORAVANTI CARLA');
INSERT INTO `mail` VALUES ('1898', '7', 'daninic14@gmail.com', 'BILOTTI DANIELA');
INSERT INTO `mail` VALUES ('1899', '7', 'betta.artuso@tin.it', 'ARTUSO ELISABETTA');
INSERT INTO `mail` VALUES ('1900', '5', 'poli781@gmail.com', 'POLI SIMONE');
INSERT INTO `mail` VALUES ('1901', '5', 'nicoceru@gmail.com', 'CERU PATRIZIA');
INSERT INTO `mail` VALUES ('1902', '5', 'maildilu@me.com', 'DELLA VALLE LUCIA');
INSERT INTO `mail` VALUES ('1903', '5', 'kia1985@live.it', 'TRIVELLI CHIARA');
INSERT INTO `mail` VALUES ('1904', '5', 'mary692@hotmail.it', 'GIANNONI MARIA LUISA');
INSERT INTO `mail` VALUES ('1905', '5', 'giovanni.scribano@popvi.it', 'SCRIBANO GIOVANNI');
INSERT INTO `mail` VALUES ('1906', '5', 'santillogilda@hotmail.com', 'SANTILLO GILDA');
INSERT INTO `mail` VALUES ('1907', '5', 'elisa138@hotmail.it', 'SIMONI ELISA');
INSERT INTO `mail` VALUES ('1908', '5', 'lorenzovettori@libero.it', 'VETTORI LORENZO');
INSERT INTO `mail` VALUES ('1909', '5', 'm.mariantonietta@yahoo.it', 'ROMOLI MARIANTONIETTA');
INSERT INTO `mail` VALUES ('1910', '5', 'ilabe85@live.it', 'BERNARDI ILARIA');
INSERT INTO `mail` VALUES ('1911', '5', 'info@immobiliareilquadrifoglio.net', 'DI LELIO ANNALISA');
INSERT INTO `mail` VALUES ('1912', '5', 'carolina.pastore.219@istruzione.it', 'PASTORE CAROLINA');
INSERT INTO `mail` VALUES ('1913', '5', 'ermanno.petroncini@email.it', 'PETRONCINI ERMANNO');
INSERT INTO `mail` VALUES ('1914', '5', 'chrilucia@yahoo.it', 'MAGNANI CHRISTIANA');
INSERT INTO `mail` VALUES ('1915', '5', 'g_iacolino@virgilio.it', 'IACOLINO GIOVANNI');
INSERT INTO `mail` VALUES ('1916', '5', 'loccal@libero.it', 'LOCCI ALESSANDRA');
INSERT INTO `mail` VALUES ('1917', '5', 'ire.sammartino@gmail.com', 'SAMMARTINO IRENE');
INSERT INTO `mail` VALUES ('1918', '5', 'j.fazio@virgilio.it', 'FAZIO JOHNNY');
INSERT INTO `mail` VALUES ('1919', '5', 'adldirossi@vodafone.it', 'ROSSI ANDREA');
INSERT INTO `mail` VALUES ('1920', '5', 'eliventuri2002@yahoo.it', 'VENTURI ELISA');
INSERT INTO `mail` VALUES ('1921', '5', 'pla980@libero.it', 'GARZIA PAOLA');
INSERT INTO `mail` VALUES ('1922', '5', 'mat83fi@hotmail.com', 'AGLIETTI MARTA');
INSERT INTO `mail` VALUES ('1923', '5', 'massimo@ecoambiente-srl.it', 'MAZZEI MASSIMO');
INSERT INTO `mail` VALUES ('1924', '5', 'martino.ch@hotmail.it', 'CHIARAMONTE MARTINO');
INSERT INTO `mail` VALUES ('1925', '5', 'nary78@libero.it', 'HUAYMACARI NARA');
INSERT INTO `mail` VALUES ('1926', '5', 'eva.nuti@gmail.com', 'NUTI EVA');
INSERT INTO `mail` VALUES ('1927', '5', 'alex.pompilio@libero.it', 'POMPILIO ALESSANDRO');
INSERT INTO `mail` VALUES ('1928', '5', 'nellolucarotti@virgilio.it', 'LUCAROTTI NELLO');
INSERT INTO `mail` VALUES ('1929', '5', 'federica.toschi@pegasorubber.com', 'TOSCHI FEDERICA');
INSERT INTO `mail` VALUES ('1930', '5', 'bruschini.michela@virgilio.it', 'BRUSCHINI MICHELA');
INSERT INTO `mail` VALUES ('1931', '5', 'cotygaga@hotmail.it', 'MORENO MIRZA');
INSERT INTO `mail` VALUES ('1932', '5', 'clarichmond@yahoo.it', 'CLARIZIO STEFANO');
INSERT INTO `mail` VALUES ('1933', '5', 'm.dalessandro@walkin.name', 'DALESSANDRO MAURO');
INSERT INTO `mail` VALUES ('1934', '5', 'enrico.bottazzoli@alice.it', 'BOTTAZZOLI ENRICO');
INSERT INTO `mail` VALUES ('1935', '5', 'sertimar@alice.it', 'SERTI MARCO');
INSERT INTO `mail` VALUES ('1936', '5', 'n.rabiolo@usl2.toscana.it', 'RABIOLO NICOLETTA');
INSERT INTO `mail` VALUES ('1937', '5', 'guglielmo.stefanini@libero.it', 'STEFANINI GUGLIELMO');
INSERT INTO `mail` VALUES ('1938', '5', 'info@haflingermariti.it', 'MARITI SILVIA');
INSERT INTO `mail` VALUES ('1939', '5', 'byannamaria@gmail.com', 'QUILICI ANNA MARIA');
INSERT INTO `mail` VALUES ('1940', '5', 'tvogliobene@hotmail.it', 'GUENZI LUCIA');
INSERT INTO `mail` VALUES ('1941', '5', 'elisa_franceschini81@yahoo.it', 'FRANCESCHINI ELISA');
INSERT INTO `mail` VALUES ('1942', '5', 'cinzia.bimbi@alice.it', 'BIMBI CINZIA');
INSERT INTO `mail` VALUES ('1943', '5', 'm.aspro@hotmail.it', 'ASPRO MARTINA');
INSERT INTO `mail` VALUES ('1944', '5', 'sinicka@me.com', 'BENEDETTI VALENTINA');
INSERT INTO `mail` VALUES ('1945', '5', 'simone.bulleri@lenzitecnologie.it', 'BULLERI SIMONE');
INSERT INTO `mail` VALUES ('1946', '5', 'leonardoromei@gmail.com', 'ROMEI LEONARDO');
INSERT INTO `mail` VALUES ('1947', '5', 'cristiano68@interfree.it', 'CASALINI CRISTIANO');
INSERT INTO `mail` VALUES ('1948', '5', 'cantarovich.diego@gmail.com', 'CANTAROVICH DIEGO');
INSERT INTO `mail` VALUES ('1949', '5', 'alexandra_a@live.it', 'ALDEA ALEXANDRA');
INSERT INTO `mail` VALUES ('1950', '5', 'i.bonuccelli@virgilio.it', 'BONUCCELLI ILARIA');
INSERT INTO `mail` VALUES ('1951', '5', 'guidettiletizia@gmail.com', 'GUIDETTI LETIZIA');
INSERT INTO `mail` VALUES ('1952', '5', 'leonardotaddei@email.it', 'TADDEI LEONARDO');
INSERT INTO `mail` VALUES ('1953', '5', 'stephanie@steen-wetzlar.de', 'STEEN STEPHANIE');
INSERT INTO `mail` VALUES ('1954', '5', 'mart_extreme@hotmail.com', 'URENA MARTIN');
INSERT INTO `mail` VALUES ('1955', '5', 'ing.bianchi.daiana@gmail.com', 'BIANCHI DAIANA');
INSERT INTO `mail` VALUES ('1956', '5', 'cristianaquerci@gmail.com', 'QUERCI CRISTIANA');
INSERT INTO `mail` VALUES ('1957', '5', 'l.ottaviani@areapratese.bcc.it', 'OTTAVIANI LAURA');
INSERT INTO `mail` VALUES ('1958', '5', 'silvy_orange92@hotmail.it', 'RICCO SILVIA');
INSERT INTO `mail` VALUES ('1959', '5', 'maxsim67@gmail.com', 'SIMONETTI MASSIMO');
INSERT INTO `mail` VALUES ('1960', '5', 'antonio.daino@live.it', 'DAINO ANTONIO');
INSERT INTO `mail` VALUES ('1961', '5', 'geraciolimpia@libero.it', 'GERACI OLIMPIA');
INSERT INTO `mail` VALUES ('1962', '5', 'annagio21@tiscali.it', 'GIORGETTI ANNA MARIA');
INSERT INTO `mail` VALUES ('1963', '5', 'grazialavorini@gmail.com', 'LAVORINI GRAZIA RITA MARIA');
INSERT INTO `mail` VALUES ('1964', '5', 'gc.perugini@gmail.com', 'PERUGINI GIULIA');
INSERT INTO `mail` VALUES ('1965', '5', 'rosjmi@hotmail.com', 'MASTRODOMENICO ROSJ');
INSERT INTO `mail` VALUES ('1966', '5', 'gold5bcs@yahoo.it', 'BARANI MARCO');
INSERT INTO `mail` VALUES ('1967', '5', 'tidovi@tin.it', 'BERTELLI ANTONELLA');
INSERT INTO `mail` VALUES ('1968', '5', 'ale.rigo08@libero.it', 'RIGOLINI ALESSANDRA');
INSERT INTO `mail` VALUES ('1969', '5', 'alessia.pepe@ftgm.it', 'PEPE ALESSIA');
INSERT INTO `mail` VALUES ('1970', '5', 'mari-balay@live.it', 'BALAY MARINELLA');
INSERT INTO `mail` VALUES ('1971', '5', 'lucianogallo2007@tiscali.it', 'GALLO LUCIANO');
INSERT INTO `mail` VALUES ('1972', '5', 'mabertinikeeler@gmail.com', 'BERTINI MARY ANN');
INSERT INTO `mail` VALUES ('1973', '5', 'crischel@tin.it', 'CHELUCCI CRISTINA');
INSERT INTO `mail` VALUES ('1974', '5', 'sergio.boldrini@alice.it', 'BOLDRINI SERGIO');
INSERT INTO `mail` VALUES ('1975', '5', 'zanealberto@gmail.com', 'ZANETTI ALBERTO');
INSERT INTO `mail` VALUES ('1976', '5', 'alemarchi2@alice.it', 'MARCHI ALESSANDRO');
INSERT INTO `mail` VALUES ('1977', '5', 'giacomocri@yahoo.it', 'CRIMI GIACOMO');
INSERT INTO `mail` VALUES ('1978', '5', 'luisamalf@gmail.com', 'MALFATTI PASQUINI LUISA');
INSERT INTO `mail` VALUES ('1979', '5', 'nudbia@tin.it', 'BIGI ANDREA');
INSERT INTO `mail` VALUES ('1980', '5', 'arch.luca.paparoni@gmail.com', 'PAPARONI LUCA');
INSERT INTO `mail` VALUES ('1981', '5', 'felicecagnoni@virgilio.it', 'CAGNONI FELICE');
INSERT INTO `mail` VALUES ('1982', '5', 'francesca@toscotec.com', 'CICCHINO FRANCESCA');
INSERT INTO `mail` VALUES ('1983', '5', 'alepardini1978@gmail.com', 'PARDINI ALESSIA');
INSERT INTO `mail` VALUES ('1984', '5', 'sandrapalaggi@hotmail.com', 'PALAGGI SANDRA');
INSERT INTO `mail` VALUES ('1985', '5', 'missclarabella66@hotmail.it', 'NICASTRO LAURA');
INSERT INTO `mail` VALUES ('1986', '5', 'simona@wmail.it', 'GENOVALI SIMONA');
INSERT INTO `mail` VALUES ('1987', '5', 'eleonora.lucchi@welcomeitalia.it', 'LUCCHI ELEONORA');
INSERT INTO `mail` VALUES ('1988', '5', 'anna@wmail.it', 'GIORGETTI ANNA');
INSERT INTO `mail` VALUES ('1989', '5', 'paul.cocks@hotmail.it', 'GIRARDI LIA');
INSERT INTO `mail` VALUES ('1990', '5', 'lorenza.bozzi@sepi-pisa.it', 'BOZZI LORENZA');
INSERT INTO `mail` VALUES ('1991', '5', 'eziarob@hotmail.it', 'ROBUSTELLI EZIA');
INSERT INTO `mail` VALUES ('1992', '5', 'tizianabianconi@libero.it', 'BIANCONI TIZIANA');
INSERT INTO `mail` VALUES ('1993', '5', 'annarita.panelli@yahoo.it', 'PANELLI ANNARITA');
INSERT INTO `mail` VALUES ('1994', '5', 'irmd77@hotmail.com', 'ROLDAN MEDINA IRENE');
INSERT INTO `mail` VALUES ('1995', '5', 'stellina10@live.com', 'MARCHESE JASMIN');
INSERT INTO `mail` VALUES ('1996', '5', 'ubaldoburalli@gmail.com', 'BURALLI UBALDO');
INSERT INTO `mail` VALUES ('1997', '5', 'luigi.battisti@fastwebnet.it', 'BATTISTI LUIGI GIOVANNI');
INSERT INTO `mail` VALUES ('1998', '5', 'gsaraff@alice.it', 'SARAFF GUIDO');
INSERT INTO `mail` VALUES ('1999', '5', 'dimitrovanatalie544@gmail.com', 'DIMITROVA NATALIE');
INSERT INTO `mail` VALUES ('2000', '5', 'avv.valentinacecconi@gmail.com', 'CECCONI VALENTINA');
INSERT INTO `mail` VALUES ('2001', '5', 'lauraegianluca@alice.it', 'GUALTIERI LAURA');
INSERT INTO `mail` VALUES ('2002', '5', 'max379@libero.it', 'CERRAI MARIA GRAZIA');
INSERT INTO `mail` VALUES ('2003', '5', 'beadellamaggiore@libero.it', 'DELLA MAGGIORE BEATRICE');
INSERT INTO `mail` VALUES ('2004', '5', 'info@moda-pel.it', 'BERRETTI ELISABETTA');
INSERT INTO `mail` VALUES ('2005', '5', 'polepole71@libero.it', 'PALLA SIMONA');
INSERT INTO `mail` VALUES ('2006', '5', 'laurag.gl48@com.it', 'BIAGI LAURA');
INSERT INTO `mail` VALUES ('2007', '5', 'biru1982@libero.it', 'BIANCHI MARIA CHIARA');
INSERT INTO `mail` VALUES ('2008', '5', 'stefano64.b@libero.it', 'BRONZINA STEPHANE');
INSERT INTO `mail` VALUES ('2009', '5', 'annapaola@studiogarofalocdl.it', 'GAROFALO ANNA PAOLA');
INSERT INTO `mail` VALUES ('2010', '5', 'm.kokstaite@imtlucca.it', 'KOKSTAITE MONIKA');
INSERT INTO `mail` VALUES ('2011', '5', 'alma.lucarotti@hotmail.it', 'LUCAROTTI ALMA');
INSERT INTO `mail` VALUES ('2012', '5', 'migliorini.a@virgilio.it', 'MIGLIORINI ALESSANDRA');
INSERT INTO `mail` VALUES ('2013', '5', 'liana.ferrari@lifeagency.net', 'FERRARI LIANA');
INSERT INTO `mail` VALUES ('2014', '5', 'elena.ricci@gmail.com', 'RICCI ELENA');
INSERT INTO `mail` VALUES ('2015', '5', 'bergamini.alessia@libero.it', 'BERGAMINI ALESSIA');
INSERT INTO `mail` VALUES ('2016', '5', 'carmen.fasano@alice.it', 'FASANO CARMEN');
INSERT INTO `mail` VALUES ('2017', '5', 'lorenzosatti@gmail.com', 'SATTI LORENZO');
INSERT INTO `mail` VALUES ('2018', '5', 'bepsontheworld@hotmail.it', 'CAMBI GIUSEPPE');
INSERT INTO `mail` VALUES ('2019', '5', 'rickandrock@gmail.com', 'HUTTON RICK');
INSERT INTO `mail` VALUES ('2020', '5', 'colombo_jacopo@virgilio.it', 'COLOMBO IACOPO');
INSERT INTO `mail` VALUES ('2021', '5', 'goich@matecitalia.com', 'GOICH MATTEO');
INSERT INTO `mail` VALUES ('2022', '5', 'giannidemaria63@gmail.com', 'DE MARIA GIOVANNI');
INSERT INTO `mail` VALUES ('2023', '5', 'amdaelisa@gmail.com', 'MENCARONI ANDREA');
INSERT INTO `mail` VALUES ('2024', '5', 'munaspicer@gmail.com', 'SPICER MUNA');
INSERT INTO `mail` VALUES ('2025', '5', 'f.marcheschi@tin.it', 'MARCHESCHI FABIO');
INSERT INTO `mail` VALUES ('2026', '5', 'cocisrl@alice.it', 'CIRCOSTA ANDREA');
INSERT INTO `mail` VALUES ('2027', '5', '17novembre2005@libero.it', 'MARIOTTI FABIO');
INSERT INTO `mail` VALUES ('2028', '5', 'letopino@virgilio.it', 'LETO GIUSEPPE');
INSERT INTO `mail` VALUES ('2029', '5', 'queenelisabetta1@virgilio.it', 'CAPACCI ELISABETTA');
INSERT INTO `mail` VALUES ('2030', '5', 'jonathanpiagentini@gmail.com', 'PIAGENTINI JONATHAN');
INSERT INTO `mail` VALUES ('2031', '5', 'letialedda@gmail.com', 'ALEDDA LETIZIA');
INSERT INTO `mail` VALUES ('2032', '5', 'josiloirinhas@hotmail.com', 'DE SOUZA JOSIANE');
INSERT INTO `mail` VALUES ('2033', '5', 'beatricetdesign@live.it', 'TACCINI BEATRICE');
INSERT INTO `mail` VALUES ('2034', '5', 'a.giagnetich@virgilio.it', 'GIAGNETICH AURA');
INSERT INTO `mail` VALUES ('2035', '5', 'dgfedra@gmail.com', 'GARGARI DANIELA');
INSERT INTO `mail` VALUES ('2036', '5', 'ruganboy@alice.it', 'RUGANI CLAUDIO');
INSERT INTO `mail` VALUES ('2037', '5', 'rosquarta@yahoo.it', 'QUARTA ROSSELLA');
INSERT INTO `mail` VALUES ('2038', '5', 'giacomodellosso@gmail.com', 'DELLOSSO GIACOMO');
INSERT INTO `mail` VALUES ('2039', '5', 'a.iozzo@iol.it', 'IOZZO ALDO');
INSERT INTO `mail` VALUES ('2040', '5', 'n.cinquini@novimpianti.com', 'CINQUINI NICO');
INSERT INTO `mail` VALUES ('2041', '5', 'luilay@alice.it', 'MORETTI ILARIA');
INSERT INTO `mail` VALUES ('2042', '5', 'diatzfabri@tiscali.it', 'DIATZ FABRIZIO');
INSERT INTO `mail` VALUES ('2043', '5', 'rcassettari.marmoteca@gmail.com', 'CASSETTARI RAFFAEL');
INSERT INTO `mail` VALUES ('2044', '5', 'michele.samitate@libero.it', 'SANITATE MICHELE');
INSERT INTO `mail` VALUES ('2045', '5', 'sara.traina@libero.it', 'TRAINA SARA');
INSERT INTO `mail` VALUES ('2046', '5', 'alex-70@hotmail.it', 'FARNESI ALESSANDRO');
INSERT INTO `mail` VALUES ('2047', '5', 'marisabecuzzi@virgilio.it', 'BECUZZI MARISA');
INSERT INTO `mail` VALUES ('2048', '5', 'maltomini@katamail.com', 'MALTOMINI DIEGO');
INSERT INTO `mail` VALUES ('2049', '5', 'fabriziasoli@libero.it', 'SOLI FABRIZIA');
INSERT INTO `mail` VALUES ('2050', '5', 'manuelba@live.it', 'BALESTRA MANUEL');
INSERT INTO `mail` VALUES ('2051', '5', 'alessandra.minutolitegrimi@gmail.com', 'SANDRELLI ALESSANDRA');
INSERT INTO `mail` VALUES ('2052', '5', 'mannyvanel@hotmail.it', 'VANELLI MANUELA');
INSERT INTO `mail` VALUES ('2053', '5', 'dida1991@hotmail.it', 'GALEOTTI ELISA');
INSERT INTO `mail` VALUES ('2054', '5', 'lugcarlo_1965@libero.it', 'SIMONINI CARLO');
INSERT INTO `mail` VALUES ('2055', '5', 'carraa@libero.it', 'CARRO ANTONELLA');
INSERT INTO `mail` VALUES ('2056', '5', 'pattigo@teletu.it', 'GORI PATRIZIA');
INSERT INTO `mail` VALUES ('2057', '5', 'nuovavasi@alice.it', 'FAGIOLINI ANDREA');
INSERT INTO `mail` VALUES ('2058', '5', 'project@danteolicurgo.it', 'CECCOTTI MASSIMO');
INSERT INTO `mail` VALUES ('2059', '5', 'p.merlino@live.it', 'MERLINO PAOLO');
INSERT INTO `mail` VALUES ('2060', '5', 'eziogabbani@yahoo.it', 'GABBANI EZIO');
INSERT INTO `mail` VALUES ('2061', '5', 'luisagresran@libero.it', 'CANDIDA DE MATTEO GENNARO');
INSERT INTO `mail` VALUES ('2062', '5', 'maria.stella.83@alice.it', 'SEMERARO MARIA STELLA');
INSERT INTO `mail` VALUES ('2063', '5', 'giancarlocarmassi@alice.it', 'ANTON GIOVANNI FRANCESCA');
INSERT INTO `mail` VALUES ('2064', '5', 'luciamencacci@inwind.it', 'MENCACCI LUCIA');
INSERT INTO `mail` VALUES ('2065', '5', 'orsilucia@yahoo.it', 'ORSI LUCIA');
INSERT INTO `mail` VALUES ('2066', '5', 'alessiodelgrande@virgilio.it', 'DEL GRANDE ALESSIO');
INSERT INTO `mail` VALUES ('2067', '5', 'saraformicola@yahoo.com', 'FORMICOLA SARA');
INSERT INTO `mail` VALUES ('2068', '5', 'francogabrielli64@virgilio.it', 'BRACALI SONIA');
INSERT INTO `mail` VALUES ('2069', '5', 'signo74@gmail.com', 'SIGNORINI LUCA');
INSERT INTO `mail` VALUES ('2070', '5', 'laurabaglini@virgilio.it', 'BAGLINI LAURA');
INSERT INTO `mail` VALUES ('2071', '5', 'fabrizio.sugarelli@gmail.com', 'SUGARELLI FABRIZIO');
INSERT INTO `mail` VALUES ('2072', '5', 'o.castiglioni@bell-motohelments.com', 'CASTIGLIONI OSVALDO');
INSERT INTO `mail` VALUES ('2073', '5', 'silviaredini@libero.it', 'REDINI SILVIA');
INSERT INTO `mail` VALUES ('2074', '5', 'bertolinisabri@gmail.com', 'BERTOLINI SABRINA');
INSERT INTO `mail` VALUES ('2075', '5', 'carlascardigli@yahoo.it', 'SCARDIGLI CARLA');
INSERT INTO `mail` VALUES ('2076', '5', 'antonella2601@libero.it', 'SERENI ANTONELLA');
INSERT INTO `mail` VALUES ('2077', '5', 'annarosacasella@hotmail.it', 'CASELLA ANNAROSA');
INSERT INTO `mail` VALUES ('2078', '5', 'elisafattore@gmail.com', 'FATTORE ELISA');
INSERT INTO `mail` VALUES ('2079', '5', 'avv.giovannibianchini@gmail.com', 'BIANCIANI GIOVANNI');
INSERT INTO `mail` VALUES ('2080', '5', 'gianni.parrini@gmail.com', 'PARRINI GIANNI');
INSERT INTO `mail` VALUES ('2081', '5', 'milladpio@gmail.com', 'PIO CAMILLA DOROTHEA');
INSERT INTO `mail` VALUES ('2082', '5', 'silvamopiace@gmail.com', 'PIACENTINI ALBERTO SILVANO');
INSERT INTO `mail` VALUES ('2083', '5', 'franci.spina@libero.it', 'SPINA FRANCESCA');
INSERT INTO `mail` VALUES ('2084', '5', 'diletta86@live.it', 'MARIANELLI DILETTA');
INSERT INTO `mail` VALUES ('2085', '5', 'simone.giannetti@omegatech.it', 'GIANNETTI SIMONE');
INSERT INTO `mail` VALUES ('2086', '5', 'alemaas@gmail.com', 'TOZZINI ALESSANDRO');
INSERT INTO `mail` VALUES ('2087', '5', 'battistoni.gm@tin.it', 'BATTISTONI MARCO');
INSERT INTO `mail` VALUES ('2088', '5', 'polialdo@alice.it', 'BATTISTONI MARIA GIUSEPPINA');
INSERT INTO `mail` VALUES ('2089', '5', 'ale.flam@libero.it', 'BARTALINI CATERINA');
INSERT INTO `mail` VALUES ('2090', '5', 'barsantiemanuele@gmail.com', 'BARSANTI EMANUELE');
INSERT INTO `mail` VALUES ('2091', '5', 'miatius88@libero.it', 'MARTINELLI MATILDE');
INSERT INTO `mail` VALUES ('2092', '5', 'monicabaldi61@gmail.com', 'BALDI MONICA');
INSERT INTO `mail` VALUES ('2093', '5', 'cance@mensa.it', 'CANCELLOTTI FRANCESCO');
INSERT INTO `mail` VALUES ('2094', '5', 'davinimax@gmail.com', 'DAVINI MASSIMO');
INSERT INTO `mail` VALUES ('2095', '5', 'mauriziocasini@gmail.com', 'CASINI MAURIZIO');
INSERT INTO `mail` VALUES ('2096', '5', 'brunella@mobileemail.vodafone.it', 'ANDREONI BRUNELLA');
INSERT INTO `mail` VALUES ('2097', '5', 'michela.maielli@virgilio.it', 'MAIELLI MICHELA');
INSERT INTO `mail` VALUES ('2098', '5', 'fioangi@alice.it', 'FIORAVANTI MARIANGELA');
INSERT INTO `mail` VALUES ('2099', '5', 'gianlucaboccia77@gmail.com', 'BOCCIA GIANLUCA');
INSERT INTO `mail` VALUES ('2100', '5', 'johnnyfly@live.it', 'MOSCA JOHN SOSSIO');
INSERT INTO `mail` VALUES ('2101', '5', 'aldothewing@alice.it', 'LO TENERO ALDO');
INSERT INTO `mail` VALUES ('2102', '5', 'claudio1657@alice.it', 'PUCCIARELLI MANUELA');
INSERT INTO `mail` VALUES ('2103', '5', 'simoneg1986@hotmail.com', 'GRANDI SIMONE');
INSERT INTO `mail` VALUES ('2104', '5', 'raoul.nalin@fastwebnet.it', 'NALIN RAOUL');
INSERT INTO `mail` VALUES ('2105', '5', 'martinaalessandri@hotmail.it', 'ALESSANDRI MARTINA');
INSERT INTO `mail` VALUES ('2106', '5', 'angela.bianchini8j5h@alice.it', 'BIANCHINI ANGELA');
INSERT INTO `mail` VALUES ('2107', '5', 'silvia.don@tiscali.it', 'DONADEO SILVIA');
INSERT INTO `mail` VALUES ('2108', '5', 'marco.giometti@gmail.com', 'SERGI MANUELA');
INSERT INTO `mail` VALUES ('2109', '5', 'salvatorebiggi@libero.it', 'BIGGI SALVATORE');
INSERT INTO `mail` VALUES ('2110', '5', 'rembrano62@virgilio.it', 'GUIDI STEFANO');
INSERT INTO `mail` VALUES ('2111', '5', 'crisgroger@libero.it', 'GROGER CRIS');
INSERT INTO `mail` VALUES ('2112', '5', 'squarcio69@hotmail.it', 'SQUARCINI ANDREA');
INSERT INTO `mail` VALUES ('2113', '5', 'sadi72@hotmail.it', 'HAYDARMATAY MERITA');
INSERT INTO `mail` VALUES ('2114', '5', 'giuseppebarachini@yahoo.it', 'BARACHINI GIUSEPPE');
INSERT INTO `mail` VALUES ('2115', '5', 'biagiobuonora@virgilio.it', 'BUONORA BIAGIO');
INSERT INTO `mail` VALUES ('2116', '5', 'stefania.galligani@alice.it', 'GALLIGANI STEFANIA');
INSERT INTO `mail` VALUES ('2117', '5', 'alessandro.becciu@gmail.com', 'BECCIU ALESSANDRO');
INSERT INTO `mail` VALUES ('2118', '5', 'panferova.e@gmail.com', 'PANFEROVA EKATERINA');
INSERT INTO `mail` VALUES ('2119', '5', 'mau.veroni@tin.it', 'VERONI MAURIZIO');
INSERT INTO `mail` VALUES ('2120', '5', 'ccavaceppi@libero.it', 'CAVACEPPI CRISTINA');
INSERT INTO `mail` VALUES ('2121', '5', 'daniele.ferrari@dssmitch.eu', 'FERRARI DANIELE');
INSERT INTO `mail` VALUES ('2122', '5', 'fausto.covelluzzi@gmail.com', 'COVELLUZZI FAUSTO');
INSERT INTO `mail` VALUES ('2123', '5', 'maria.mazzoni@farm.unipi.it', 'MAZZONI MARIA');
INSERT INTO `mail` VALUES ('2124', '5', 'martafontana1967@tiscali.it', 'FONTANA MARTA');
INSERT INTO `mail` VALUES ('2125', '5', 'mpvanini@gmail.com', 'VANINI MARIA PIA');
INSERT INTO `mail` VALUES ('2126', '5', 'paolo.boezi@gmail.com', 'BOEZI PAOLO');
INSERT INTO `mail` VALUES ('2127', '5', 'pardossiromano@gmail.com', 'PARDOSSI ROMANO');
INSERT INTO `mail` VALUES ('2128', '5', 'bengian2002@libero.it', 'BENIGNO GIUSEPPE');
INSERT INTO `mail` VALUES ('2129', '5', 'accia81@yahoo.it', 'ZANNI SILVIA');
INSERT INTO `mail` VALUES ('2130', '5', 'rufus@pratonotizie.it', 'FANTI MARCO');
INSERT INTO `mail` VALUES ('2131', '5', 'gabriele.romb@gmail.com', 'ROMBOLI GABRIELE');
INSERT INTO `mail` VALUES ('2132', '5', 'gianniniantonio66@alice.it', 'GIANNINI ANTONIO');
INSERT INTO `mail` VALUES ('2133', '5', 'aurastamate@libero.it', 'STAMATE AURELIA');
INSERT INTO `mail` VALUES ('2134', '5', 'gfp@firstmind.dk', 'GITTE FINNICH PEDERSEN');
INSERT INTO `mail` VALUES ('2135', '5', 'klasimo@hotmail.com', 'TOMASELLI CLAUDIO');
INSERT INTO `mail` VALUES ('2136', '5', 'simonettielisa@hotmail.it', 'SIMONETTI ELISA');
INSERT INTO `mail` VALUES ('2137', '5', 'dominiquecasa@tiscali.it', 'CASALI DOMINIQUE');
INSERT INTO `mail` VALUES ('2138', '5', 'dylanseventy6@hotmail.it', 'PIERONI MIRKO');
INSERT INTO `mail` VALUES ('2139', '5', 'tolomeo.lt@tin.it', 'TOLOMEO MARIO');
INSERT INTO `mail` VALUES ('2140', '5', 'andrea_nutini@yahoo.it', 'NUTINI ANDREA');
INSERT INTO `mail` VALUES ('2141', '5', 'molinaro.marco@virgilio.it', 'MOLINARO MARCO');
INSERT INTO `mail` VALUES ('2142', '5', 'stef.bonini@gmail.com', 'BONINI STEFANO');
INSERT INTO `mail` VALUES ('2143', '5', 'copuhouse@fastwebnet.it', 'TOMAGRA BARBARA');
INSERT INTO `mail` VALUES ('2144', '5', 'pisapatrizia@hotmail.it', 'PALAGIANO PATRIZIA');
INSERT INTO `mail` VALUES ('2145', '5', 'lu.santoro@trenitalia.it', 'SANTORO LUIGI');
INSERT INTO `mail` VALUES ('2146', '5', 'denise.dalcerro@aliceposta.it', 'DAL CERRO DENISE');
INSERT INTO `mail` VALUES ('2147', '5', 'ceisilvia@yahoo.it', 'CEI SILVIA');
INSERT INTO `mail` VALUES ('2148', '5', 'mariluca@hotmail.it', 'CORBO MARIA CONCETTA');
INSERT INTO `mail` VALUES ('2149', '5', 'g.lazzareschi@virgilio.it', 'LAZZARESCHI GIULIO');
INSERT INTO `mail` VALUES ('2150', '5', 'tiziano.pieretti@gmail.com', 'PIERETTI TIZIANO');
INSERT INTO `mail` VALUES ('2151', '5', 'sara.nottoli@libero.it', 'NOTTOLI SARA');
INSERT INTO `mail` VALUES ('2152', '5', 'adilen@alice.it', 'FERRARO NELIDA');
INSERT INTO `mail` VALUES ('2153', '5', 'matteo_malacarne@libero.it', 'MALACARNE MATTEO');
INSERT INTO `mail` VALUES ('2154', '5', 'maugallo@hotmail.it', 'GALLETTI MAURIZIO');
INSERT INTO `mail` VALUES ('2155', '5', 'mardora@gmail.com', 'MAROTTA DORA');
INSERT INTO `mail` VALUES ('2156', '5', 'raffaelenuzzi6@gmail.com', 'NUZZI RAFFAELE');
INSERT INTO `mail` VALUES ('2157', '5', 'ilducabianco1964@hotmail.it', 'LEONARDI GIOVANNI');
INSERT INTO `mail` VALUES ('2158', '5', 'florianalopresti@virgilio.it', 'LO PRESTI COSTANTINO FLORIANA');
INSERT INTO `mail` VALUES ('2159', '5', 'rosalbaconte@teletu.it', 'CONTE ROSALBA');
INSERT INTO `mail` VALUES ('2160', '5', 'neneducicnati@gmail.com', 'GORI VALENTINA');
INSERT INTO `mail` VALUES ('2161', '5', 'ss4766@libero.it', 'SUCCI STEFANO');
INSERT INTO `mail` VALUES ('2162', '5', 'manuelalupi@email.it', 'LUPI MANUELA');
INSERT INTO `mail` VALUES ('2163', '5', 'lamorali@gmail.com', 'MORALI MONICA');
INSERT INTO `mail` VALUES ('2164', '5', 'pignato.maurizio@generali.it', 'PIGNATO MAURIZIO');
INSERT INTO `mail` VALUES ('2165', '5', 'alessandra-nardone@virgilio.it', 'NARDONE ALESSANDRA');
INSERT INTO `mail` VALUES ('2166', '5', 'balda-ste@libero.it', 'BALDASSINI STEFANO');
INSERT INTO `mail` VALUES ('2167', '5', 'venturinivalentina@ymail.com', 'VENTURINI VALENTINA');
INSERT INTO `mail` VALUES ('2168', '5', 'v.dangelo30@gmail.com', 'DANGELO VANESSA');
INSERT INTO `mail` VALUES ('2169', '5', 'andrea.mariani@gmx.it', 'MARIANI ANDREA');
INSERT INTO `mail` VALUES ('2170', '5', 'dede1986@live.it', 'PELLEGRINI FEDERICA');
INSERT INTO `mail` VALUES ('2171', '5', 'alessandradelfrate@yahoo.it', 'DEL FRATE ALESSANDRA');
INSERT INTO `mail` VALUES ('2172', '5', 'marta_bonetti@hotmail.com', 'BONETTI MARTA');
INSERT INTO `mail` VALUES ('2173', '5', 'deboraliguori@gmail.it', 'LIGUORI DEBORA');
INSERT INTO `mail` VALUES ('2174', '5', 'sidonia77@live.it', 'DI STASIO SIDONIA');
INSERT INTO `mail` VALUES ('2175', '5', 'sereguido@tin.it', 'GUIDOTTI SERENA');
INSERT INTO `mail` VALUES ('2176', '5', 'chimera55@hotmail.it', 'LOMBARDI ERIKA');
INSERT INTO `mail` VALUES ('2177', '5', 'arturoriccardo@gmail.com', 'RICCARDO ARTURO');
INSERT INTO `mail` VALUES ('2178', '5', 'maraceccherelli@virgilio.it', 'CECCHERELLI MARA');
INSERT INTO `mail` VALUES ('2179', '5', 'letizia_bocchi@yahoo.it', 'BOCCHI LETIZIA');
INSERT INTO `mail` VALUES ('2180', '5', 'denia2@hotmail.it', 'BRUNO BRUNELLA');
INSERT INTO `mail` VALUES ('2181', '5', 'morona86@hotmail.it', 'PANTALEONI BARBARA');
INSERT INTO `mail` VALUES ('2182', '5', 'matteo_gori1@hotmail.it', 'GORI MATTEO');
INSERT INTO `mail` VALUES ('2183', '5', 'tonykaja@hotmail.it', 'KAJA AURORA');
INSERT INTO `mail` VALUES ('2184', '5', 'alessandropacenti@gmail.com', 'PACENTI ALESSANDRO');
INSERT INTO `mail` VALUES ('2185', '5', 'remotogna@email.it', 'TOGNA REMO');
INSERT INTO `mail` VALUES ('2186', '5', 'danieled65@gmail.com', 'PAONESSA ANTONELLA');
INSERT INTO `mail` VALUES ('2187', '5', 'rcaprai@virgilio.it', 'CAPRAI REBECCA');
INSERT INTO `mail` VALUES ('2188', '5', 'tridentiserena1@gmail.com', 'TRIDENTI SERENA');
INSERT INTO `mail` VALUES ('2189', '5', 'emarocchino@yahoo.it', 'MAROCCHINO MARIA EMANUELA');
INSERT INTO `mail` VALUES ('2190', '5', 'iacopodibugno@gmail.com', 'DI BUGNO IACOPO');
INSERT INTO `mail` VALUES ('2191', '5', 'fulvio.campodonico@gmail.com', 'RATTI MAIRA');
INSERT INTO `mail` VALUES ('2192', '5', 'lorenzomichelotti@gmail.com', 'MICHELOTTI LORENZO');
INSERT INTO `mail` VALUES ('2193', '5', 'maddalena_m@hotmail.it', 'MACCHIA MADDALENA');
INSERT INTO `mail` VALUES ('2194', '5', 'lucadini84@gmail.com', 'DINI LUCA');
INSERT INTO `mail` VALUES ('2195', '5', 'elena.giuli@yahoo.it', 'GIULI ELENA');
INSERT INTO `mail` VALUES ('2196', '5', 'ogla.vinogradova@aliceposta.it', 'ISOLANI ANASTASIA');
INSERT INTO `mail` VALUES ('2197', '5', 'elvi.se@libero.it', 'SHETA EDLIRA');
INSERT INTO `mail` VALUES ('2198', '5', 'giobar59@gmail.com', 'BARIGLIANO GIOVANNI');
INSERT INTO `mail` VALUES ('2199', '5', 'torri.gabriele@gmail.com', 'TORRI GABRIELE');
INSERT INTO `mail` VALUES ('2200', '5', 'mterconi@tin.it', 'TERCONI MARCO');
INSERT INTO `mail` VALUES ('2201', '5', 'stefano.orsi@hotmail.it', 'ORSI STEFANO');
INSERT INTO `mail` VALUES ('2202', '5', 'sarafilippi10@gmail.com', 'FILIPPI SARA');
INSERT INTO `mail` VALUES ('2203', '5', 'caterinafiorani@gmail.com', 'FIORANI CATIA');
INSERT INTO `mail` VALUES ('2204', '5', 'marcorettori.77@gmail.com', 'RETTORI MARCO');
INSERT INTO `mail` VALUES ('2205', '5', 'rossisere@gmail.com', 'ROSSI SERENA');
INSERT INTO `mail` VALUES ('2206', '5', 'elisalucherini@hotmail.it', 'LUCHERINI ELISA');
INSERT INTO `mail` VALUES ('2207', '5', 'sabrycorsi@libero.it', 'CORSI SABRINA');
INSERT INTO `mail` VALUES ('2208', '5', 'nicolapieri@hotamil.it', 'PIERI NICOLA');
INSERT INTO `mail` VALUES ('2209', '5', 'futurcasa@live.it', 'MONTELEONE CALOGERO');
INSERT INTO `mail` VALUES ('2210', '5', 'dario.delucadl@gmail.com', 'DE LUCA DARIO');
INSERT INTO `mail` VALUES ('2211', '5', 'giampaoloantoni@gmail.com', 'ANTONI GIAMPAOLO');
INSERT INTO `mail` VALUES ('2212', '5', 'elenapoltri@gmail.com', 'POLTRI ELENA');
INSERT INTO `mail` VALUES ('2213', '5', 'michelettiriccardo@hotmail.it', 'MICHELETTI RICCARDO');
INSERT INTO `mail` VALUES ('2214', '5', 'bimbigae@hotmail.it', 'BIMBI GAETANO');
INSERT INTO `mail` VALUES ('2215', '5', 'cecco.andreotti@libero.it', 'ANDREOTTI FRANCESCO');
INSERT INTO `mail` VALUES ('2216', '5', 'vanessa.anto@hotmail.it', 'LO TEMPIO ANTONELLA');
INSERT INTO `mail` VALUES ('2217', '5', 'annalisaf70@gmail.com', 'FERRI ANNALISA');
INSERT INTO `mail` VALUES ('2218', '5', 'robyplay@tin.it', 'GALLETTI ROBERTO');
INSERT INTO `mail` VALUES ('2219', '5', 'info@tomeidesign.com', 'TOMEI LUCA');
INSERT INTO `mail` VALUES ('2220', '5', 'supalak.tim@hotmail.com', 'VONGSUTHEE SUPALAK');
INSERT INTO `mail` VALUES ('2221', '5', 'antoni.s@tiscali.it', 'ANTONI SIMONA');
INSERT INTO `mail` VALUES ('2222', '5', 'alina-iuliana@live.com', 'IACOB IULIANA ALINA');
INSERT INTO `mail` VALUES ('2223', '5', 'elisabetta.stagi@gmail.com', 'STAGI ELISABETTA');
INSERT INTO `mail` VALUES ('2224', '5', 'mmarchino@sephora.fr', 'MARCHINO MARCO');
INSERT INTO `mail` VALUES ('2225', '5', 'dottmasalaangela@alice.it', 'MASALA ANGELA');
INSERT INTO `mail` VALUES ('2226', '5', 'kikkina1978@yahoo.it', 'CARUSO CRISTINA');
INSERT INTO `mail` VALUES ('2227', '5', 'leonefab@gmail.com', 'LEONE FABRIZIO');
INSERT INTO `mail` VALUES ('2228', '5', 'francesca_fini@virgilio.it', 'FINI FRANCESCA');
INSERT INTO `mail` VALUES ('2229', '5', 'dolceforno@hotmail.it', 'PIERETTI STEFANO');
INSERT INTO `mail` VALUES ('2230', '5', 'alice.leonardi86@hotmail.it', 'LEONARDI ALICE');
INSERT INTO `mail` VALUES ('2231', '5', 'lucianacardillo@hotmail.it', 'CARDILLO LUCIANA');
INSERT INTO `mail` VALUES ('2232', '5', 'tizianapedani@gmail.com', 'PEDANI TIZIANA');
INSERT INTO `mail` VALUES ('2233', '5', 'jacopoorlanducci@yahoo.it', 'ORLANDUCCI JACOPO');
INSERT INTO `mail` VALUES ('2234', '5', 'gricci@tiscali.it', 'RICCI GIANLUCA');
INSERT INTO `mail` VALUES ('2235', '5', 'claudiotori@ymail.com', 'TORI CLAUDIO');
INSERT INTO `mail` VALUES ('2236', '5', 'smantovani2@gmail.com', 'MANTOVANI SERENA');
INSERT INTO `mail` VALUES ('2237', '5', 'mpollastrini@virgilio.it', 'POLLASTRINI MANUELA');
INSERT INTO `mail` VALUES ('2238', '5', 'tommasocosta@hotmail.com', 'COSTA TOMMASO');
INSERT INTO `mail` VALUES ('2239', '5', 'marinabrenna@gmail.com', 'BRENNA MARINA');
INSERT INTO `mail` VALUES ('2240', '5', 'emese.gaal@yahoo.it', 'GAAL EMESE ADRIENN');
INSERT INTO `mail` VALUES ('2241', '5', 'masini.donatella@alice.it', 'MASINI DONATELLA');
INSERT INTO `mail` VALUES ('2242', '5', 'mazzitelli.sara@libero.it', 'MAZZITELLI SARA');
INSERT INTO `mail` VALUES ('2243', '5', 'bertini.mt@gmail.com', 'PUCCI ELISA');
INSERT INTO `mail` VALUES ('2244', '5', 'diamantamico01@gmail.com', 'CIOCA DIANA');
INSERT INTO `mail` VALUES ('2245', '5', 'tomad66@gmail.com', 'TOMADINI STEFANO');
INSERT INTO `mail` VALUES ('2246', '5', 'annetta_2@hotmail.it', 'MANFREDINI ANNA');
INSERT INTO `mail` VALUES ('2247', '5', 'annalisacinque@alice.it', 'CINQUE ANNALISA');
INSERT INTO `mail` VALUES ('2248', '5', 'simona65.c@gmail.com', 'CARMIGNANI SIMONA');
INSERT INTO `mail` VALUES ('2249', '5', 'alessiobertoli79@virgilio.it', 'BERTOLI ALESSIO');
INSERT INTO `mail` VALUES ('2250', '5', 'alessandradavini@gmail.com', 'DAVINI ALESSANDRA');
INSERT INTO `mail` VALUES ('2251', '5', 'santonifederico@yahoo.it', 'SANTONI FEDERICO');
INSERT INTO `mail` VALUES ('2252', '5', 'beram16@gmail.com', 'BERARDINELLI MAURO');
INSERT INTO `mail` VALUES ('2253', '5', 'manueladesimoni@libero.it', 'DE SIMONI MANUELA');
INSERT INTO `mail` VALUES ('2254', '5', 'gtazzioli@virgilio.it', 'TAZZIOLI GIUSEPPINA');
INSERT INTO `mail` VALUES ('2255', '5', 'mariasaetta@live.it', 'SAETTA MARIA');
INSERT INTO `mail` VALUES ('2256', '5', 'tesicore2@gmail.com', 'SORRENTINO LISA');
INSERT INTO `mail` VALUES ('2257', '5', 'maddalena.domenici@virgilio.it', 'DOMENICI MADDALENA');
INSERT INTO `mail` VALUES ('2258', '5', 'caverniclaudia@gmail.com', 'CAVERNI CLAUDIA');
INSERT INTO `mail` VALUES ('2259', '5', 'laangel83@yahoo.it', 'ANGELI LAURA');
INSERT INTO `mail` VALUES ('2260', '5', 'info@puntointesa.it', 'PALAGI SIMONE');
INSERT INTO `mail` VALUES ('2261', '5', 'kevincinelli@hotmail.it', 'CINELLI KEVIN');
INSERT INTO `mail` VALUES ('2262', '5', 'stefanoandreuccetti@alice.it', 'ANDREUCCETTI STEFANO');
INSERT INTO `mail` VALUES ('2263', '5', 'ross2000@hotmail.it', 'OPILIO ROSSANA');
INSERT INTO `mail` VALUES ('2264', '5', 'el_tuko@hotmail.it', 'BINI ANDREA');
INSERT INTO `mail` VALUES ('2265', '5', 'm.tambellini@me.com', 'TAMBELLINI MICHELE');
INSERT INTO `mail` VALUES ('2266', '5', 'avv.gaiavolpi@tiscali.it', 'VOLPI GAIA');
INSERT INTO `mail` VALUES ('2267', '5', 'belloria@hotmail.it', 'BALDINI MATILDE');
INSERT INTO `mail` VALUES ('2268', '5', 'omicalizzi@garzelli.it', 'MICALIZZI ORNELLA');
INSERT INTO `mail` VALUES ('2269', '5', 'elena_poli@inwind.it', 'POLI ELENA');
INSERT INTO `mail` VALUES ('2270', '5', 'luisanatucci@hotmail.it', 'NATUCCI LUISA');
INSERT INTO `mail` VALUES ('2271', '5', 'cmanu19@gmail.com', 'CIONI MANUELA');
INSERT INTO `mail` VALUES ('2272', '5', 'elettrobartaloni@hotmail.com', 'BARTALONI NICO');
INSERT INTO `mail` VALUES ('2273', '5', 'tiziana.milani@libero.it', 'MILANI TIZIANA');
INSERT INTO `mail` VALUES ('2274', '5', 'franci.lisa@yahoo.it', 'FRANCI LISA');
INSERT INTO `mail` VALUES ('2275', '5', 'paulinaabber@libero.it', 'ABBER PAULINA');
INSERT INTO `mail` VALUES ('2276', '5', 'beatricegp@gmail.com', 'GONELLA PACCHIOTTI BEATRICE');
INSERT INTO `mail` VALUES ('2277', '5', 'tizianag@virgilio.it', 'CRISCUOLI TIZIANA');
INSERT INTO `mail` VALUES ('2278', '5', 'rossella.robertiello@virgilio.it', 'ROBERTIELLO ROSA');
INSERT INTO `mail` VALUES ('2279', '5', 'ary.poli@libero.it', 'POLI ARIANNA');
INSERT INTO `mail` VALUES ('2280', '5', 'albagi@hotmail.it', 'GIRALDO ALBA');
INSERT INTO `mail` VALUES ('2281', '5', 'paolo.lazzerini@iwalivorno.it', 'LAZZERINI PAOLO');
INSERT INTO `mail` VALUES ('2282', '5', 'aeg.lucchesi@alice.it', 'LUCCHESI ALBERTO');
INSERT INTO `mail` VALUES ('2283', '5', 'costagli@egimmobiliare.it', 'COSTAGLI MAURO');
INSERT INTO `mail` VALUES ('2284', '5', 'francescatolomei@virgilio.it', 'TOLOMEI FRANCESCA');
INSERT INTO `mail` VALUES ('2285', '5', 'debora.dinero@gmail.com', 'DI NERO DEBORA');
INSERT INTO `mail` VALUES ('2286', '5', 'emanuelagaligani@rusticisrl.com', 'GALIGANI EMANUELA');
INSERT INTO `mail` VALUES ('2287', '5', 'armandocolacino@libero.it', 'COLACINO ARMANDO');
INSERT INTO `mail` VALUES ('2288', '5', 'danielenegri@hotmail.com', 'NEGRI DANIELE');
INSERT INTO `mail` VALUES ('2289', '5', 'cinziacapecchi@yahoo.it', 'CAPECCHI CINZIA');
INSERT INTO `mail` VALUES ('2290', '5', 'baritimanuela@libero.it', 'BARITI MANUELA');
INSERT INTO `mail` VALUES ('2291', '5', 'mingaronialessandro@libero.it', 'MINGARONI ALESSANDRO');
INSERT INTO `mail` VALUES ('2292', '5', 'paolo@paolosartini.com', 'SARTINI PAOLO');
INSERT INTO `mail` VALUES ('2293', '5', 'marta2francesconi@gmail.com', 'FRANCESCONI MARTA');
INSERT INTO `mail` VALUES ('2294', '5', 'tilly0309@hotmail.com', 'LENZI SANDRA');
INSERT INTO `mail` VALUES ('2295', '5', 'giacomobaldaccini@hotmail.it', 'BALDACCINI GIACOMO');
INSERT INTO `mail` VALUES ('2296', '5', 'kajena19@gmail.com', 'KADELSKI JACEK');
INSERT INTO `mail` VALUES ('2297', '5', 'moscardinimaria@gmail.com', 'MOSCARDINI MARIA');
INSERT INTO `mail` VALUES ('2298', '5', 'argentinos78@gmail.com', 'OLIVA DONATO');
INSERT INTO `mail` VALUES ('2299', '5', 'raffdina@alice.it', 'RUSSO GIUSEPPINA');
INSERT INTO `mail` VALUES ('2300', '5', 'fabio.venturi@fastwebnet.it', 'VENTURI FABIO');
INSERT INTO `mail` VALUES ('2301', '5', 'erikamandoli@gmail.com', 'MANDOLI ERIKA');
INSERT INTO `mail` VALUES ('2302', '5', 'ilaria87@tin.it', 'PARENTI CARLA');
INSERT INTO `mail` VALUES ('2303', '5', 'antoniofoglia70@yahoo.it', 'FOGLIA ANTONIO');
INSERT INTO `mail` VALUES ('2304', '5', 'ilariasbrana@yahoo.it', 'SBRANA ILARIA');
INSERT INTO `mail` VALUES ('2305', '5', 'larabasili@ymail.com', 'BASILI LARA');
INSERT INTO `mail` VALUES ('2306', '5', 'cornacchiapsicologo@tiscali.it', 'CORNACCHIA VITO MICHELE');
INSERT INTO `mail` VALUES ('2307', '5', 'n.gini1964@gmail.com', 'GINI NADIA');
INSERT INTO `mail` VALUES ('2308', '5', 'fedetalo@gmail.com', 'TALINI FEDERICO');
INSERT INTO `mail` VALUES ('2309', '5', 'filippo@studiopanebianco.com', 'PANEBIANCO FILIPPO');
INSERT INTO `mail` VALUES ('2310', '5', 'racchetta2006@yahoo.it', 'BARTOLOZZI ROBERTO');
INSERT INTO `mail` VALUES ('2311', '5', 'laurapaterni@gmail.com', 'PATERNI LAURA');
INSERT INTO `mail` VALUES ('2312', '5', 'monicacresti@icloud.com', 'RICCI MONICA');
INSERT INTO `mail` VALUES ('2313', '5', 'spirito1965@libero.it', 'DELLAMICO ENRICO');
INSERT INTO `mail` VALUES ('2314', '5', 'c.dolciotti@gmail.com', 'DE SIMONI ANTONIO');
INSERT INTO `mail` VALUES ('2315', '5', 'marta.luchi@hotmail.it', 'PACINI LUCIA');
INSERT INTO `mail` VALUES ('2316', '5', 'silviadionisio8@gmail.com', 'DIONISIO SILVIA');
INSERT INTO `mail` VALUES ('2317', '5', 'enricadelguerra@libero.it', 'DEL GUERRA ENRICA');
INSERT INTO `mail` VALUES ('2318', '5', 'scapecchimaurizio@virgilio.it', 'SCAPECCHI MAURIZIO');
INSERT INTO `mail` VALUES ('2319', '5', 'giustinicolalucca@libero.it', 'GIUSTI NICOLA');
INSERT INTO `mail` VALUES ('2320', '5', 'elisacerof@gmail.com', 'CEROFOLINI ELISA');
INSERT INTO `mail` VALUES ('2321', '5', 'carmen@pieretti.it', 'PIERETTI CARMEN');
INSERT INTO `mail` VALUES ('2322', '5', 'nicolettesluyter@gmail.com', 'SLUYTER NICOLETTE');
INSERT INTO `mail` VALUES ('2323', '5', 'fontana.natalia@yahoo.com', 'FONTANA NATALIA');
INSERT INTO `mail` VALUES ('2324', '5', 'morellialfa@hotmail.com', 'MORELLI ALESSANDRO');
INSERT INTO `mail` VALUES ('2325', '5', 'stefano.giannecchi@tin.it', 'GIANNECCHINI STEFANO');
INSERT INTO `mail` VALUES ('2326', '5', 'andreajuza@gmail.com', 'SIMI ANDREA');
INSERT INTO `mail` VALUES ('2327', '5', 'alessia71@hotmail.it', 'LUCACCINI FABIO');
INSERT INTO `mail` VALUES ('2328', '5', 'vania73@gmail.com', 'FERRARI VANIA');
INSERT INTO `mail` VALUES ('2329', '5', 'leonardo.del.prete@alice.it', 'RIMEDIATI LARA');
INSERT INTO `mail` VALUES ('2330', '5', 'gaetanomezzatesta88@gmail.com', 'MEZZATESTA GAETANO');
INSERT INTO `mail` VALUES ('2331', '5', 'maranatucci@maranatucci.it', 'NATUCCI MARA');
INSERT INTO `mail` VALUES ('2332', '5', 'lorenagrassi18@gmail.com', 'GRASSI LORENA');
INSERT INTO `mail` VALUES ('2333', '5', 'daniele_adamo@yahoo.it', 'ADAMO DANIELE');
INSERT INTO `mail` VALUES ('2334', '5', 'cola76@libero.it', 'COLA RICCARDO');
INSERT INTO `mail` VALUES ('2335', '5', 'eny@iol.it', 'UGOLINI ENY');
INSERT INTO `mail` VALUES ('2336', '5', 'massimosenzatelefono@gmail.com', 'FRASCHI MASSIMO');
INSERT INTO `mail` VALUES ('2337', '5', 'napolitano812003@yahoo.it', 'NAPOLITANO GIOVANNI');
INSERT INTO `mail` VALUES ('2338', '5', 'mangognab@libero.it', 'GALLETTA GIULIANA');
INSERT INTO `mail` VALUES ('2339', '5', 'michela.turri@tin.it', 'TURRI MICHELA');
INSERT INTO `mail` VALUES ('2340', '5', 'claudia.ricci88@gmail.com', 'RICCI CLAUDIA');
INSERT INTO `mail` VALUES ('2341', '5', 'fabianavallone@libero.it', 'VALLONE FABIANA');
INSERT INTO `mail` VALUES ('2342', '5', 'andrea-russo@hotmail.it', 'RUSSO ANDREA');
INSERT INTO `mail` VALUES ('2343', '5', 'orietalazri@gmail.com', 'LAZRI ORIEZA');
INSERT INTO `mail` VALUES ('2344', '5', 'mariannasavonetti@hotmail.it', 'SAVONETTI MARIANNA');
INSERT INTO `mail` VALUES ('2345', '5', 'ribert@iol.it', 'BERTANI RICCARDO');
INSERT INTO `mail` VALUES ('2346', '5', 'umanbeen@gmail.com', 'LOMBARDI DANIELE');
INSERT INTO `mail` VALUES ('2347', '5', 'serenasolda@libero.it', 'SOLDAINI SERENA');
INSERT INTO `mail` VALUES ('2348', '5', 'giulia.albani87@gmail.com', 'ALBANI GIULIA');
INSERT INTO `mail` VALUES ('2349', '5', 'daniel.bozzoli@virgilio.it', 'BOZZOLI DANIEL VICTOR');
INSERT INTO `mail` VALUES ('2350', '5', 'grisu74@inwind.it', 'CODELUPPI ENZO');
INSERT INTO `mail` VALUES ('2351', '5', 'leonardo.guidini@alice.it', 'GUIDINI LEONARDO');
INSERT INTO `mail` VALUES ('2352', '5', 'lucmar6364@alice.it', 'ODDONE MARCO');
INSERT INTO `mail` VALUES ('2353', '5', 'maurizio496@intefree.it', 'ROSONI MAURIZIO');
INSERT INTO `mail` VALUES ('2354', '5', 'chiara.deltessandoro@avanzi.com', 'DEL TESSANDORO CHIARA');
INSERT INTO `mail` VALUES ('2355', '5', 'oliviapasquali@libero.it', 'PASQUALI OLIVIA');
INSERT INTO `mail` VALUES ('2356', '5', 'alan.perugini@gmail.com', 'PERUGINI ALAN');
INSERT INTO `mail` VALUES ('2357', '5', 'duilio.graziani@alice.it', 'SELMI AURORA');
INSERT INTO `mail` VALUES ('2358', '5', 'nadavies@gmail.com', 'VESTRUCCI NADIA');
INSERT INTO `mail` VALUES ('2359', '5', 'mariobanducci@alice.it', 'BANDUCCI MARIO');
INSERT INTO `mail` VALUES ('2360', '5', 'carolinam@live.it', 'MARCHI CAROLINA');
INSERT INTO `mail` VALUES ('2361', '5', 'michele_padrone@yajoo.it', 'PADRONE MICHELE');
INSERT INTO `mail` VALUES ('2362', '5', 'andre_ghela@hotmail.it', 'GHELARDONI ANDREA');
INSERT INTO `mail` VALUES ('2363', '5', 'giannoni35@gmail.com', 'GIANNONI MICHAEL');
INSERT INTO `mail` VALUES ('2364', '5', 'valtercini@gmail.com', 'CINI VALTER');
INSERT INTO `mail` VALUES ('2365', '5', 'simone.borse@gmail.com', 'SALCUNI SIMONE');
INSERT INTO `mail` VALUES ('2366', '5', 'rossanavaccaro2@gmail.com', 'VACCARO ROSSANA');
INSERT INTO `mail` VALUES ('2367', '5', 'incerpia@alice.it', 'INCERPI ALESSANDRO');
INSERT INTO `mail` VALUES ('2368', '5', 'marica.menici@gmail.com', 'MENICI MARICA');
INSERT INTO `mail` VALUES ('2369', '5', 'christinainlucca@aol.com', 'LAVERTA CRISTINA');
INSERT INTO `mail` VALUES ('2370', '5', 'elisabalsamo@tiscali.it', 'BALSAMO ELISA');
INSERT INTO `mail` VALUES ('2371', '5', 'sophie@palm-yachting.com', 'MICALI SOPHIE');
INSERT INTO `mail` VALUES ('2372', '5', 'stefania.pomdi@hotmail.it', 'PONDI STEFANIA');
INSERT INTO `mail` VALUES ('2373', '5', 'eleonoracatarsi@hotmail.com', 'CATARSI ELEONORA');
INSERT INTO `mail` VALUES ('2374', '5', 'robertamastagni@gmail.com', 'MASTAGNI ROBERTA');
INSERT INTO `mail` VALUES ('2375', '5', 'corrada.bolcioni@gmail.com', 'BOLCIONI CORRADA');
INSERT INTO `mail` VALUES ('2376', '5', 'marina.delcoppo@istruzione.it', 'DEL COPPO MARINA');
INSERT INTO `mail` VALUES ('2377', '5', 'mariellace74@hotmail.com', 'CONDORI ESTRADA MARIELLA');
INSERT INTO `mail` VALUES ('2378', '5', 'sabrinabonini972@gmail.com', 'BONINI SABRINA');
INSERT INTO `mail` VALUES ('2379', '5', 'd.pasquini@yahoo.it', 'PASQUINI DILETTA');
INSERT INTO `mail` VALUES ('2380', '5', 'r.dimuro68@gmail.com', 'DI MURO ROBERTO');
INSERT INTO `mail` VALUES ('2381', '5', 'laura@rarilivorno.it', 'PALANDRI LAURA');
INSERT INTO `mail` VALUES ('2382', '5', 'ch.innocenti@libero.it', 'INNOCENTI CHRISTIAN');
INSERT INTO `mail` VALUES ('2383', '5', 'taziojunior@libero.it', 'ROSSI FEDERICA');
INSERT INTO `mail` VALUES ('2384', '5', 'paolodeldebbio1@virgilio.it', 'DEL DEBBIO PAOLO');
INSERT INTO `mail` VALUES ('2385', '5', 'c.sandroni@alice.it', 'SANDRONI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('2386', '5', 'arual.bri@hotmail.it', 'BRISCIANO LAURA');
INSERT INTO `mail` VALUES ('2387', '5', 'sagacross@tiscali.it', 'PALMERINI SANDRO');
INSERT INTO `mail` VALUES ('2388', '5', 'alfio.pelli@tiscali.it', 'PELLI ALFIO');
INSERT INTO `mail` VALUES ('2389', '5', 'marianna.stio@libero.it', 'STIO MARIANNA');
INSERT INTO `mail` VALUES ('2390', '5', 'silvia.doganieri@vodafone.com', 'DOGANIERI SILVIA');
INSERT INTO `mail` VALUES ('2391', '5', 'iacopetti.massimo@libero.it', 'IACOPETTI MASSIMO');
INSERT INTO `mail` VALUES ('2392', '5', 'a_lazzeri@libero.it', 'LAZZERI ALESSANDRA');
INSERT INTO `mail` VALUES ('2393', '5', 'gabriele.baccei@hotmail.it', 'BACCEI GABRIELE');
INSERT INTO `mail` VALUES ('2394', '5', 'svitlana89@hotmail.com', 'POGORILA SVITLANA');
INSERT INTO `mail` VALUES ('2395', '5', 'paola.paoli.57@virgilio.it', 'PAOLI PAOLA');
INSERT INTO `mail` VALUES ('2396', '5', 'avv.tommaso.confortini@gmail.com', 'CONFORTINI TOMMASO');
INSERT INTO `mail` VALUES ('2397', '5', 'giusybarsi@libero.it', 'BARSI MARIA GIUSTINA');
INSERT INTO `mail` VALUES ('2398', '5', 'pialucchesi@gmail.com', 'LUCCHESI PIA');
INSERT INTO `mail` VALUES ('2399', '5', 's.rossignoli@sssup.it', 'ROSSIGNOLI SERENA');
INSERT INTO `mail` VALUES ('2400', '5', 'andrea.ercolini@alice.it', 'ERCOLINI ANDREA');
INSERT INTO `mail` VALUES ('2401', '5', 'marcocambi12@gmail.com', 'CAMBI MARCO');
INSERT INTO `mail` VALUES ('2402', '5', 'daniele.pretini@bassilichi.it', 'PRETINI DANIELE');
INSERT INTO `mail` VALUES ('2403', '5', 'matteo.lazzarini@hotmail.it', 'LAZZARINI MATTEO');
INSERT INTO `mail` VALUES ('2404', '5', 'terrenimassimiliano@gmail.com', 'TERRENI MASSIMILIANO');
INSERT INTO `mail` VALUES ('2405', '5', 'tittina33@virgilio.it', 'DI NASO TECLA');
INSERT INTO `mail` VALUES ('2406', '5', 'batuffolo980@virgilio.it', 'RICCARDO ORSOLA');
INSERT INTO `mail` VALUES ('2407', '5', 'm.giulia.galluzzi@gmail.com', 'GALLUZZI MARIA GIULIA');
INSERT INTO `mail` VALUES ('2408', '5', 'chiara.bartolini19@gmail.com', 'BARTOLINI CHIARA');
INSERT INTO `mail` VALUES ('2409', '5', 'eugenia.suna@virgilio.it', 'SUNA EUGENIA');
INSERT INTO `mail` VALUES ('2410', '5', 'palombapatriziav@gmail.com', 'PALOMBA PATRIZIA VITTORIA');
INSERT INTO `mail` VALUES ('2411', '5', 'giuseppecarrisi@alice.it', 'CARRISI GIUSEPPE');
INSERT INTO `mail` VALUES ('2412', '5', 'andreatommei@alice.it', 'TOMMEI ANDREA');
INSERT INTO `mail` VALUES ('2413', '5', 'emi@tiscali.it', 'ZACCAGNINI EMILIANO');
INSERT INTO `mail` VALUES ('2414', '5', 'lisa.giovannetti@hotmail.it', 'GIOVANNETTI LISA');
INSERT INTO `mail` VALUES ('2415', '5', 'lissimazzilli@gmail.com', 'MAZZILLI LUISELLA');
INSERT INTO `mail` VALUES ('2416', '5', 'carlostraface@alice.it', 'STRAFACE CARLO');
INSERT INTO `mail` VALUES ('2417', '5', 'fabrice@fabricebouverat.com', 'BOUVERAT FABRICE');
INSERT INTO `mail` VALUES ('2418', '5', 'emalembo@virgilio.it', 'LEMBO EMANUELE');
INSERT INTO `mail` VALUES ('2419', '5', 'angelica574@gmail.com', 'RUSU ANGELICA');
INSERT INTO `mail` VALUES ('2420', '5', 'mariani.mauromario@gmail.com', 'MARIANI MAURO MARIO');
INSERT INTO `mail` VALUES ('2421', '5', 'lorenzomasi81@gmail.com', 'MASI LORENZO');
INSERT INTO `mail` VALUES ('2422', '5', 'c.vannas@virgilio.it', 'VANNAS CHRISTOS');
INSERT INTO `mail` VALUES ('2423', '5', 'chiara.cortini.79@gmail.com', 'CORTINI CHIARA');
INSERT INTO `mail` VALUES ('2424', '5', 'piazza.andre@libero.it', 'PIAZZA ANDREA');
INSERT INTO `mail` VALUES ('2425', '5', 'acappelletti70@gmail.com', 'CAPPELLETTI ALESSANDRO');
INSERT INTO `mail` VALUES ('2426', '5', 'roberto_menichetti@libero.it', 'MENICHETTI ROBERTO');
INSERT INTO `mail` VALUES ('2427', '5', 'tronchettig@hotmail.it', 'TRONCHETTI GIULIO');
INSERT INTO `mail` VALUES ('2428', '5', 'serena.matteoli@me.com', 'MATTEOLI SERENA');
INSERT INTO `mail` VALUES ('2429', '5', 'caluri.ilaria@alice.it', 'CALURI ILARIA');
INSERT INTO `mail` VALUES ('2430', '5', 'agnesepasserotti@libero.it', 'PASSEROTTI AGNESE');
INSERT INTO `mail` VALUES ('2431', '5', 'f.panelli@hotmail.it', 'PANELLI FRANCESCO');
INSERT INTO `mail` VALUES ('2432', '5', 'carlo.bazzocchi@yahoo.com', 'BAZZOCCHI CARLO');
INSERT INTO `mail` VALUES ('2433', '5', 'letyricci@yahoo.it', 'RICCI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('2434', '5', 'zingaropietro@gmail.com', 'ZINGARO PIETRO');
INSERT INTO `mail` VALUES ('2435', '5', 'evasolinas@hotmail.it', 'SOLINAS EVA');
INSERT INTO `mail` VALUES ('2436', '5', 'deianaquality@gmail.com', 'DEIANA VINCENZO');
INSERT INTO `mail` VALUES ('2437', '5', 'tommytogni89@gmail.com', 'TOGNI TOMMASO');
INSERT INTO `mail` VALUES ('2438', '5', 'lauramare.lm@libero.it', 'MARE LAURA');
INSERT INTO `mail` VALUES ('2439', '5', 'nadiacarrabs@virgilio.it', 'CARRABS NADIA');
INSERT INTO `mail` VALUES ('2440', '5', 'avv.datofori@libero.it', 'DA TOFORI ORNELLA');
INSERT INTO `mail` VALUES ('2441', '5', 'marilenafiorillo@virgilio.it', 'FIORILLO MARILENA');
INSERT INTO `mail` VALUES ('2442', '5', 'norgeross@libero.it', 'ROSS NORGE');
INSERT INTO `mail` VALUES ('2443', '5', 'ivogar59@gmail.com', 'BIAGINI ALESSANDRO');
INSERT INTO `mail` VALUES ('2444', '5', 'annika60@hotmail.it', 'SIMONELLI MARIA ANNUNZIATA');
INSERT INTO `mail` VALUES ('2445', '5', 'lety_bordoni@hotmail.com', 'BORDONI LETIZIA');
INSERT INTO `mail` VALUES ('2446', '5', 'gabriella.pedonesi@gmail.it', 'PEDONESI GABRIELLA');
INSERT INTO `mail` VALUES ('2447', '5', 'patrizia.lombardelli@libero.it', 'LOMBARDELLI PATRIZIA');
INSERT INTO `mail` VALUES ('2448', '5', 'avvocatobrancoli@gmail.com', 'BRANCOLI PANTERA MARCO');
INSERT INTO `mail` VALUES ('2449', '5', 'alessandrabrega@alice.it', 'BREGA ALESSANDRA');
INSERT INTO `mail` VALUES ('2450', '5', 'cortieli@hotmail.it', 'CORTI ELISABETTA');
INSERT INTO `mail` VALUES ('2451', '5', 'p.deldotto@tin.it', 'DEL DOTTO PAOLO');
INSERT INTO `mail` VALUES ('2452', '5', 'valeria-lustri@libero.it', 'LUSTRI VALERIA');
INSERT INTO `mail` VALUES ('2453', '5', 'ecrosi@tin.it', 'LORENZINI ALESSANDRO');
INSERT INTO `mail` VALUES ('2454', '5', 'chetimartinucci@libero.it', 'MARTINUCCI CHETI');
INSERT INTO `mail` VALUES ('2455', '6', 'sandro.taranghelli@gmail.com', 'TARANGHELLI SANDRO');
INSERT INTO `mail` VALUES ('2456', '6', 'roby.bagnoli@gmail.com', 'CAMPANARI RITA');
INSERT INTO `mail` VALUES ('2457', '6', 'annette_1978@virgilio.it', 'NOCERINO ANNA');
INSERT INTO `mail` VALUES ('2458', '6', 'laryska1970@gmail.com', 'SHEVCHENKO LARYSA');
INSERT INTO `mail` VALUES ('2459', '6', 'brunettifrancesca91@gmail.com', 'BRUNETTI FRANCESCA');
INSERT INTO `mail` VALUES ('2460', '6', 'elenasantagati@yahoo.it', 'SANTAGATI ELENA');
INSERT INTO `mail` VALUES ('2461', '6', 'sama88@internetlibero.it', 'MANTELLASSI STEFANIA');
INSERT INTO `mail` VALUES ('2462', '6', 'alessandro.barsotti@alice.it', 'BARSOTTI ALESSANDRO');
INSERT INTO `mail` VALUES ('2463', '6', 'stefaniavazzano@libero.it', 'VAZZANO STEFANIA');
INSERT INTO `mail` VALUES ('2464', '6', 'laludimare@libero.it', 'DOMENICHINI LAURA');
INSERT INTO `mail` VALUES ('2465', '6', 'maa.follonica@virgilio.it', 'FABBRI GIULIANA');
INSERT INTO `mail` VALUES ('2466', '6', 'angelscricciola@yahoo.it', 'VILLANI ANGELA');
INSERT INTO `mail` VALUES ('2467', '6', 'guido162za@gmail.it', 'SIMONCINI SIMONE');
INSERT INTO `mail` VALUES ('2468', '6', 'jacopo.muratori@yahoo.it', 'MURATORI JACOPO');
INSERT INTO `mail` VALUES ('2469', '6', 'panifederico@virgilio.it', 'PANI FEDERICO');
INSERT INTO `mail` VALUES ('2470', '6', 'eugenialyashuk_2012@libero.it', 'OTTOCHKA OLENA');
INSERT INTO `mail` VALUES ('2471', '6', 'verocap77@libero.it', 'CAPRARO VERONICA');
INSERT INTO `mail` VALUES ('2472', '6', 'arduino21@email.it', 'TRAPANI VINCENZO');
INSERT INTO `mail` VALUES ('2473', '6', 'roberta@fontino.it', 'SCHIAVETTI ROBERTA');
INSERT INTO `mail` VALUES ('2474', '6', 'casseri.rappresentanze@tin.it', 'CASSERI RICCARDO');
INSERT INTO `mail` VALUES ('2475', '6', 'eleonora.negri80@gmail.com', 'NEGRI ELEONORA');
INSERT INTO `mail` VALUES ('2476', '6', 'm.noti@virgilio.it', 'GIUNTINI ELENA');
INSERT INTO `mail` VALUES ('2477', '6', 'domingos_mc@libero.it', 'MARTINI CLAUDIO');
INSERT INTO `mail` VALUES ('2478', '6', 'fabynasp@hotmail.it', 'NASPINI FABIANA');
INSERT INTO `mail` VALUES ('2479', '6', 'elios.bellucci@alice.it', 'BELLUCCI ELIOS');
INSERT INTO `mail` VALUES ('2480', '6', 'pietrinimartinucci@alice.it', 'MARTINUCCI MARIA');
INSERT INTO `mail` VALUES ('2481', '6', 'gondales@live.it', 'RINALDO MARIA');
INSERT INTO `mail` VALUES ('2482', '6', 'alessandra.gattoli@alice.it', 'GATTOLI ALESSANDRA');
INSERT INTO `mail` VALUES ('2483', '6', 'cheghe@hotmail.com', 'LEVANTE FRANCESCO');
INSERT INTO `mail` VALUES ('2484', '6', 'margherita.desanti@gmail.com', 'DE SANTI MARGHERITA');
INSERT INTO `mail` VALUES ('2485', '6', 'a.r.gentili@alice.it', 'GENTILI MARIA LUISA');
INSERT INTO `mail` VALUES ('2486', '6', 'zizzi63@gmail.com', 'GUIDERI SILVIA');
INSERT INTO `mail` VALUES ('2487', '6', 'barby.67@libero.it', 'COCCONCELLI BARBARA');
INSERT INTO `mail` VALUES ('2488', '6', 'bellini_benedetta@yahoo.it', 'BELLINI BENEDETTA');
INSERT INTO `mail` VALUES ('2489', '6', 'romy712008@hotmail.it', 'BIUZZI ROMINA');
INSERT INTO `mail` VALUES ('2490', '6', 'roberto.olianti@libero.it', 'OLIANTI ROBERTO');
INSERT INTO `mail` VALUES ('2491', '6', 'mauro.cozzolino@alice.it', 'COZZOLINO MAURO');
INSERT INTO `mail` VALUES ('2492', '6', 'c.pietrini@tsf.it', 'PIETRINI CRISTINA');
INSERT INTO `mail` VALUES ('2493', '6', 'pbracciali@gmail.com', 'BRACCIALI PAOLO');
INSERT INTO `mail` VALUES ('2494', '6', 'ape37@tiscali.it', 'ROSSI NICCOLO');
INSERT INTO `mail` VALUES ('2495', '6', 'cristina-rocchi@virgilio.it', 'BONGINI DAVID');
INSERT INTO `mail` VALUES ('2496', '6', 'lindacaroti@libero.it', 'CAROTI LINDA');
INSERT INTO `mail` VALUES ('2497', '6', 'lina.marzia@system-data.it', 'MARZIA LINA');
INSERT INTO `mail` VALUES ('2498', '6', 'andrea.neri@mak3.it', 'NERI ANDREA');
INSERT INTO `mail` VALUES ('2499', '6', 'raffaella.buscemi@libero.it', 'BUSCEMI RAFFAELLA');
INSERT INTO `mail` VALUES ('2500', '6', 'alessiogiannini@yahoo.it', 'GIANNINI ALESSIO');
INSERT INTO `mail` VALUES ('2501', '6', 'annapermyakova@yahoo.it', 'PERMYAKOVA ANNA');
INSERT INTO `mail` VALUES ('2502', '6', 'silvia.bicci23@gmail.com', 'BICCI SILVIA');
INSERT INTO `mail` VALUES ('2503', '6', 'info@colomboimmobiliare.it', 'CAPPELLINI ALFREDA');
INSERT INTO `mail` VALUES ('2504', '6', 'caddeoandrea@libero.it', 'CADDEO ANDREA');
INSERT INTO `mail` VALUES ('2505', '6', 'martinaticciati@alice.it', 'TICCIATI MARTINA');
INSERT INTO `mail` VALUES ('2506', '6', 'a.zinali@alice.it', 'SANTINI MARCELLA');
INSERT INTO `mail` VALUES ('2507', '6', 'anna.tolo@alice.it', 'GALATOLO ANNA');
INSERT INTO `mail` VALUES ('2508', '6', 'info@realestatesantini.it', 'SANTINI STEFANO');
INSERT INTO `mail` VALUES ('2509', '6', 'elena.lorenzano@gmail.com', 'LORENZANO ELENA');
INSERT INTO `mail` VALUES ('2510', '6', 'fcalzolari@ymail.com', 'CALZOLARI FEDERICO');
INSERT INTO `mail` VALUES ('2511', '6', 'gabr87@live.com', 'NOCENTI GABRIELE');
INSERT INTO `mail` VALUES ('2512', '6', 'vannini.s@libero.it', 'VANNINI ANGELA');
INSERT INTO `mail` VALUES ('2513', '6', 'carmen65alba@yahoo.it', 'CODREANU CARMEN');
INSERT INTO `mail` VALUES ('2514', '6', 'extrosuvereto@alice.it', 'BASSO MARIANGELA');
INSERT INTO `mail` VALUES ('2515', '6', 'lanuovaforneria@gmail.com', 'VACCARO ROSANNA');
INSERT INTO `mail` VALUES ('2516', '6', 'gasoline23@virgilio.it', 'SETTEMBRETTI BARBARA');
INSERT INTO `mail` VALUES ('2517', '6', 'gasoline23@virgilio.it', 'PAVIN SONIA');
INSERT INTO `mail` VALUES ('2518', '6', 'ata61@live.it', 'RATTI RITA');
INSERT INTO `mail` VALUES ('2519', '6', 'piergiulia@hotmail.it', 'PIERGENTILI GIULIA');
INSERT INTO `mail` VALUES ('2520', '6', 'andre984@live.it', 'BIAGI ANDREA');
INSERT INTO `mail` VALUES ('2521', '6', 'niclagiustarini@virgilio.it', 'GIUSTARINI NICLA');
INSERT INTO `mail` VALUES ('2522', '6', 'elisa.sprugnoli@email.it', 'SPRUGNOLI ELISA');
INSERT INTO `mail` VALUES ('2523', '6', 'apedrottidellacqua@hotmail.com', 'PEDROTTI DELLACQUA ALICE STEFANIA');
INSERT INTO `mail` VALUES ('2524', '6', 'luciafedeli79@libero.it', 'FEDELI LUCIA');
INSERT INTO `mail` VALUES ('2525', '6', 'lostfare@hotmail.it', 'PEVERINI STEFANO');
INSERT INTO `mail` VALUES ('2526', '6', 'bargagli.auro@tiscali.it', 'MOSCHINI SILVANA');
INSERT INTO `mail` VALUES ('2527', '6', 'lo.deb@virgilio.it', 'DEBIDDA ANTONELLA');
INSERT INTO `mail` VALUES ('2528', '6', 'adriana.1949@libero.it', 'NERI ADRIANA');
INSERT INTO `mail` VALUES ('2529', '6', 'luigi@dellamarra.it', 'DELLA MARRA LUIGI');
INSERT INTO `mail` VALUES ('2530', '6', 'bartalini.e@gmail.com', 'BARTALINI ELENA');
INSERT INTO `mail` VALUES ('2531', '6', 'globa55@hotmail.com', 'BARRELLA GLORIA');
INSERT INTO `mail` VALUES ('2532', '6', 'ciani.angiolo@libero.it', 'CIANI ANGIOLO');
INSERT INTO `mail` VALUES ('2533', '6', 'a.parrini@usl9.it', 'PARRINI ALESSANDRA');
INSERT INTO `mail` VALUES ('2534', '6', 'francesca.crecchi@sintecnica.it', 'CRECCHI FRANCESCA');
INSERT INTO `mail` VALUES ('2535', '6', 'julebusch@hotmail.com', 'BUSCH JULIANE');
INSERT INTO `mail` VALUES ('2536', '6', 'giabbani.e@alice.it', 'GIABBANI EMILIANO');
INSERT INTO `mail` VALUES ('2537', '6', 'moira_lecci@libero.it', 'LECCI MOIRA');
INSERT INTO `mail` VALUES ('2538', '6', 'andra_tzutza@yahoo.com', 'TUTUIANU ALEXANDRA');
INSERT INTO `mail` VALUES ('2539', '6', 'longobuccofrancesca@libero.it', 'LONGOBUCCO FRANCESCA');
INSERT INTO `mail` VALUES ('2540', '6', 'agata.gallina@yahoo.it', 'GALLINA AGATA');
INSERT INTO `mail` VALUES ('2541', '6', 'giannadg_86@yahoo.it', 'DEL GAUDIO GIANNA');
INSERT INTO `mail` VALUES ('2542', '6', 'anna.marcovaldi@gmail.com', 'MARCOVALDI ANNA');
INSERT INTO `mail` VALUES ('2543', '6', 'rita.rabissi@libero.it', 'RABISSI RITA');
INSERT INTO `mail` VALUES ('2544', '6', 'donatella.vignali@libero.it', 'VIGNALI DONATELLA');
INSERT INTO `mail` VALUES ('2545', '6', 'deborapastore1969@libero.it', 'PASTORE DEBORA');
INSERT INTO `mail` VALUES ('2546', '6', 'turchi.luciano@gmail.com', 'GIGANTE PIA');
INSERT INTO `mail` VALUES ('2547', '6', 'loretta501950@libero.it', 'GALLI LORETTA');
INSERT INTO `mail` VALUES ('2548', '6', 'saradavitti@hotmail.it', 'DAVITTI SARA');
INSERT INTO `mail` VALUES ('2549', '6', 'danybrum@gmail.com', 'PAPINI DANIELA');
INSERT INTO `mail` VALUES ('2550', '6', 'filippi_barbara@virgilio.it', 'FILIPPI BARBARA');
INSERT INTO `mail` VALUES ('2551', '6', 's.falossi@alice.it', 'FALOSSI SILVIA');
INSERT INTO `mail` VALUES ('2552', '6', 'bdeldottore@libero.it', 'DEL DOTTORE BARBARA');
INSERT INTO `mail` VALUES ('2553', '6', 'mizzy80@live.it', 'CORRIDORI MAURIZIA');
INSERT INTO `mail` VALUES ('2554', '6', 'francescarin74@yahoo.it', 'RINALDO FRANCESCA');
INSERT INTO `mail` VALUES ('2555', '6', 'alberto.calamassi@auroracucine.it', 'CALAMASSI ALBERTO');
INSERT INTO `mail` VALUES ('2556', '6', 'gabriellatanturli@gmail.com', 'TANTURLI GABRIELLA');
INSERT INTO `mail` VALUES ('2557', '6', 'adeantoni@ptagroup.it', 'DE ANTONI ANDREA');
INSERT INTO `mail` VALUES ('2558', '6', 'r.cibelli@email.it', 'CIBELLI GENNARO');
INSERT INTO `mail` VALUES ('2559', '6', 'droghiniazzurra@libero.it', 'DROGHINI AZZURRA');
INSERT INTO `mail` VALUES ('2560', '6', 'caterina.rosi@yahoo.it', 'ROSI CATERINA');
INSERT INTO `mail` VALUES ('2561', '6', 'laura.22@vodafone.it', 'FRANCHI LAURA');
INSERT INTO `mail` VALUES ('2562', '6', 'simona-bardini@virgilio.it', 'BARDINI SIMONA');
INSERT INTO `mail` VALUES ('2563', '6', 'rosypianigiani@hotmail.com', 'PIANIGIANI ROSARIA');
INSERT INTO `mail` VALUES ('2564', '6', 'vdini@libero.it', 'DINI VANESSA');
INSERT INTO `mail` VALUES ('2565', '6', 'pezo14@hotmail.it', 'PEZONE GIULIO');
INSERT INTO `mail` VALUES ('2566', '6', 'gaia.tancredi@gmail.com', 'TANCREDI GAIA');
INSERT INTO `mail` VALUES ('2567', '6', 'lorenzob72@gmail.com', 'BOCCI LORENZO');
INSERT INTO `mail` VALUES ('2568', '6', 'somomimma@msn.com', 'BOLOGNESI SIMONETTA');
INSERT INTO `mail` VALUES ('2569', '6', 'franchi.alida41@gmail.com', 'FRANCHI ALIDA');
INSERT INTO `mail` VALUES ('2570', '6', 'antonellomarceddu@yahoo.it', 'MARCEDDU ANTONELLO');
INSERT INTO `mail` VALUES ('2571', '6', 'cocchi98@gmail.com', 'MONTINI SABINA');
INSERT INTO `mail` VALUES ('2572', '6', 's.capecchi@libero.it', 'RAUGGI LAURA');
INSERT INTO `mail` VALUES ('2573', '6', 'palmierialdo@yahoo.it', 'PALMERI ALDO');
INSERT INTO `mail` VALUES ('2574', '6', 'elenacavari@yahoo.it', 'AVARI ELENA');
INSERT INTO `mail` VALUES ('2575', '6', 'f.cortopash@libero.it', 'CORTOPASH FABIO');
INSERT INTO `mail` VALUES ('2576', '6', 'stefania.pinti@virgilio.it', 'PINTI STEFANIA');
INSERT INTO `mail` VALUES ('2577', '6', 'tamburini.a97@vodafone.it', 'TAMBURINI ANDREA');
INSERT INTO `mail` VALUES ('2578', '6', 'giovanni.corbara@gmail.com', 'MAGNANI PAOLA');
INSERT INTO `mail` VALUES ('2579', '6', 'info@domuspiombino.it', 'PAMPALONI CINZIA');
INSERT INTO `mail` VALUES ('2580', '6', 'gandolfoivan@libero.it', 'GANDOLFO IVAN');
INSERT INTO `mail` VALUES ('2581', '6', 'fulvio_elena@alice.it', 'PROVVEDI FULVIO');
INSERT INTO `mail` VALUES ('2582', '6', 'info@claudiocilemmi.it', 'CILEMMI CLAUDIO');
INSERT INTO `mail` VALUES ('2583', '6', 'lav.quadrifoglio@gmail.com', 'MONACI KATY');
INSERT INTO `mail` VALUES ('2584', '6', 'giutom83@gmail.com', 'TOMMASI GIULIO');
INSERT INTO `mail` VALUES ('2585', '6', 'lunaria17@gmail.com', 'FORTE ANTONELLA');
INSERT INTO `mail` VALUES ('2586', '6', 'avramimario@hotmail.com', 'AVRAMI MARIO');
INSERT INTO `mail` VALUES ('2587', '6', 'bricchimariacristina@gmail.com', 'BRICCHI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('2588', '6', 'guidocarli9@gmail.com', 'CARLI GUIDO');
INSERT INTO `mail` VALUES ('2589', '6', 'fraarg@hotmail.it', 'ARGENTATI FRANCESCA');
INSERT INTO `mail` VALUES ('2590', '6', 'painy@tiscali.it', 'PAINI ANNALISA');
INSERT INTO `mail` VALUES ('2591', '6', 'toma_lucia@libero.it', 'TOMA LUCIA');
INSERT INTO `mail` VALUES ('2592', '6', 'jessica.marilyn@hotmail.it', 'LONGARZO JESSICA');
INSERT INTO `mail` VALUES ('2593', '6', 'luana1828@libero.it', 'TOMAINO LUANA');
INSERT INTO `mail` VALUES ('2594', '6', 'federica.caponi@libero.it', 'ALDERIGHI ANTONIO');
INSERT INTO `mail` VALUES ('2595', '6', 'marco@dp-adv.it', 'CREDI MARCO');
INSERT INTO `mail` VALUES ('2596', '6', 'victoriap@gmail.com', 'CHAPMAN VICTORIA');
INSERT INTO `mail` VALUES ('2597', '6', 'dona.sti@email.it', 'STIGLIANO DONATA');
INSERT INTO `mail` VALUES ('2598', '6', 'cfranci3@hotmail.it', 'CAPPELLI FRANCESCA');
INSERT INTO `mail` VALUES ('2599', '6', 'paolo_fs@hotmail.com', 'FUSI PAOLO');
INSERT INTO `mail` VALUES ('2600', '6', 'c.pescatori@alice.it', 'PESCATORI CARLO');
INSERT INTO `mail` VALUES ('2601', '6', 'nico223@email.it', 'MARTINI NICOLA');
INSERT INTO `mail` VALUES ('2602', '6', 'mappa71@gmail.com', 'BERTACCINI ROBERTO');
INSERT INTO `mail` VALUES ('2603', '6', 'andreascapecchi@libero.it', 'SCAPECCHI ANDREA');
INSERT INTO `mail` VALUES ('2604', '6', 'elenamiche@gmail.com', 'MICHELONI ELENA');
INSERT INTO `mail` VALUES ('2605', '6', 'silviabottai@yahoo.it', 'BOTTAI SILVIA');
INSERT INTO `mail` VALUES ('2606', '6', 'eliopoli@infol.it', 'ADAMI ALESSANDRO');
INSERT INTO `mail` VALUES ('2607', '6', 'leonardo.valentini@alice.it', 'VALENTINI LEONARDO');
INSERT INTO `mail` VALUES ('2608', '6', 'dchicca@interfree.it', 'CORSI DANIELA');
INSERT INTO `mail` VALUES ('2609', '6', 'k.amorico@alice.it', 'AMORICO KATIUSCIA');
INSERT INTO `mail` VALUES ('2610', '6', 'l.sideri@alice.it', 'SIDERI LAURA');
INSERT INTO `mail` VALUES ('2611', '6', 'mbcarapelli@gmail.com', 'CARAPELLI MARIA BRUNA');
INSERT INTO `mail` VALUES ('2612', '6', 'coronamg@teletu.it', 'CORONA MARIA GRAZIA');
INSERT INTO `mail` VALUES ('2613', '6', 'antonellafarnetani@libero.it', 'FARNETANI ANTONELLA');
INSERT INTO `mail` VALUES ('2614', '6', 'bartalucci66@katamail.com', 'BARTALUCCI ANDREA');
INSERT INTO `mail` VALUES ('2615', '6', 'ilaria.car@freepass.it', 'CARANGELO ILARIA');
INSERT INTO `mail` VALUES ('2616', '6', 'info@slceramiche.it', 'PIMPINELLI SIMONE');
INSERT INTO `mail` VALUES ('2617', '6', 'tottipatrizia@gmail.com', 'TOTTI PATRIZIA');
INSERT INTO `mail` VALUES ('2618', '6', 'claudiasommavilla@interfree.it', 'SOMMAVILLA CLAUDIA');
INSERT INTO `mail` VALUES ('2619', '6', 'mercurio67@infinito.it', 'VOLPI ROSITA');
INSERT INTO `mail` VALUES ('2620', '6', 'miki71@libero.it', 'MENICHINI MICHELE');
INSERT INTO `mail` VALUES ('2621', '6', 'martina1387@libero.it', 'PEZZICA MARTINA');
INSERT INTO `mail` VALUES ('2622', '6', 'elena_nasi@libero.it', 'NASI ELENA');
INSERT INTO `mail` VALUES ('2623', '6', 'erykeka@alice.it', 'GALLI ERIKA');
INSERT INTO `mail` VALUES ('2624', '6', 'clara.cala@libero.it', 'CALAMASSI CLARA');
INSERT INTO `mail` VALUES ('2625', '6', 'f.rapezzi@alice.it', 'PLATIA FRANCESCA');
INSERT INTO `mail` VALUES ('2626', '6', 'carmineiacomino@hotmail.it', 'IACOMINO CARMINE');
INSERT INTO `mail` VALUES ('2627', '6', 'stefimania@gmail.com', 'MANIACI STEFANIA');
INSERT INTO `mail` VALUES ('2628', '6', 'emiliodarino@hotmail.it', 'DARINO EMILIO');
INSERT INTO `mail` VALUES ('2629', '6', 'claudio.caselli@gmail.com', 'CASELLI CLAUDIO');
INSERT INTO `mail` VALUES ('2630', '6', 'daniele.semboloni@tiscali.it', 'SEMBOLONI DANIELE');
INSERT INTO `mail` VALUES ('2631', '6', 'david.vannucci@live.it', 'VANNUCCI DAVID');
INSERT INTO `mail` VALUES ('2632', '6', 'paolalorenzetti66@gmail.com', 'LORENZETTI PAOLA');
INSERT INTO `mail` VALUES ('2633', '6', 'sandra.giovani@alice.it', 'GIOVANI SANDRA');
INSERT INTO `mail` VALUES ('2634', '6', 'perticicinzia@yahoo.it', 'PERTICI CINZIA');
INSERT INTO `mail` VALUES ('2635', '6', 'maurocalamassi@gmail.com', 'CALAMASSI MAURO');
INSERT INTO `mail` VALUES ('2636', '6', 'ritagabeg@libero.it', 'GABEGLIERI RITA');
INSERT INTO `mail` VALUES ('2637', '6', 'gufina74@gmail.com', 'COLASANTO MARIA GRAZIA');
INSERT INTO `mail` VALUES ('2638', '6', 'arborelli@alice.it', 'BORELLI ANNARITA');
INSERT INTO `mail` VALUES ('2639', '6', 'ilgave@hotmail.it', 'GAVETTI SANDRO');
INSERT INTO `mail` VALUES ('2640', '6', 'silvia_forziati@yahoo.it', 'FORZIATI SILVIA');
INSERT INTO `mail` VALUES ('2641', '6', 'marta.periti@alice.it', 'PERITI MARTA');
INSERT INTO `mail` VALUES ('2642', '6', 'federicograziosi1@gmail.com', 'GRAZIOSI FEDERICO');
INSERT INTO `mail` VALUES ('2643', '6', 'morband@tin.it', 'BANDIERA MORENO');
INSERT INTO `mail` VALUES ('2644', '6', 'chiara.berretti@gmail.com', 'BERRETTI CHIARA');
INSERT INTO `mail` VALUES ('2645', '6', 'carla.bimbi@virgilio.it', 'BIMBI CARLA');
INSERT INTO `mail` VALUES ('2646', '6', 'cri.cheloni@mail.com', 'CHELONI CRISTIANA');
INSERT INTO `mail` VALUES ('2647', '6', 'cattebarbara@libero.it', 'CATTE BARBARA');
INSERT INTO `mail` VALUES ('2648', '6', 'alessandrodani.77@gmail.com', 'DANI ALESSANDRO');
INSERT INTO `mail` VALUES ('2649', '6', 'marco.medaglini@tin.it', 'MARTINI ELISABETTA');
INSERT INTO `mail` VALUES ('2650', '6', 'rosita.pugliese@libero.it', 'PUGLIESE ROSITA FRANCESCA');
INSERT INTO `mail` VALUES ('2651', '6', 'anna.carli1971@gmail.com', 'CARLI ANNA');
INSERT INTO `mail` VALUES ('2652', '6', 'claudia.tosi@icloud.com', 'TOSI CLAUDIA');
INSERT INTO `mail` VALUES ('2653', '6', 'lucia.giusti@hotmail.it', 'GIUSTI LUCIA');
INSERT INTO `mail` VALUES ('2654', '6', 'elisabennati@hotmail.com', 'BENNATI ELISA');
INSERT INTO `mail` VALUES ('2655', '6', 'maxgamba@inwind.it', 'GAMBINI MASSIMO');
INSERT INTO `mail` VALUES ('2656', '6', 'sere.rio@alice.it', 'LENZI RUDY');
INSERT INTO `mail` VALUES ('2657', '6', 'raffaello.grazzini@gmail.com', 'GRAZZINI RAFFAELLO');
INSERT INTO `mail` VALUES ('2658', '6', 'compa.gc@libero.it', 'COMPARONI GIOVANNI');
INSERT INTO `mail` VALUES ('2659', '6', 'aurorabolioli@yahoo.it', 'BOLIOLI AURORA');
INSERT INTO `mail` VALUES ('2660', '6', 'fillinisandra@libero.it', 'FILLINI SANDRA');
INSERT INTO `mail` VALUES ('2661', '6', 'a.vicerdini@urbanprojects.it', 'VICERDINI ALESSANDRO');
INSERT INTO `mail` VALUES ('2662', '6', 'francesca.marchi81@gmail.com', 'MARCHI FRANCESCA');
INSERT INTO `mail` VALUES ('2663', '6', 'dr.priami@alice.it', 'BRAGLIA ANTONELLA');
INSERT INTO `mail` VALUES ('2664', '6', 'info@elettrofollonica.com', 'FABIANI EMILIANO');
INSERT INTO `mail` VALUES ('2665', '6', 'rpierro@comune.follonica.gr.it', 'PIERRO RICCARDO');
INSERT INTO `mail` VALUES ('2666', '6', 'diodori@libero.it', 'DIODORI RITA');
INSERT INTO `mail` VALUES ('2667', '6', 'enricopiero371@gmail.com', 'PIERACCINI ENRICO');
INSERT INTO `mail` VALUES ('2668', '6', 'ice.rana@hotmail.com', 'ROSSI ALICE');
INSERT INTO `mail` VALUES ('2669', '6', 'annalisa.paolicchi@gmail.com', 'PAOLICCHI ANNALISA');
INSERT INTO `mail` VALUES ('2670', '6', 'silvia.rossetti63@virgilio.it', 'ROSSETTI SILVIA');
INSERT INTO `mail` VALUES ('2671', '6', 'famrossi58@gmail.com', 'ROSSI ETTORE');
INSERT INTO `mail` VALUES ('2672', '6', 'robertaboem@hotmail.com', 'BOEM ROBERTA');
INSERT INTO `mail` VALUES ('2673', '6', 'stellazigrino@libero.it', 'ZIGRINO STELLA');
INSERT INTO `mail` VALUES ('2674', '6', 'laurencecharles1@gmail.com', 'CHARLES LAURENCE');
INSERT INTO `mail` VALUES ('2675', '6', 'mirella.cherubini@libero.it', 'CHERUBINI MIRELLA');
INSERT INTO `mail` VALUES ('2676', '6', 'gemignanimaristella@gmail.com', 'GEMIGNANI MARISTELLA');
INSERT INTO `mail` VALUES ('2677', '6', 'gianni.lippi@alice.it', 'SCATOLINI MARIAGIULIA');
INSERT INTO `mail` VALUES ('2678', '6', 'catia.-folletto@hotmail.it', 'PANTANI CATIA');
INSERT INTO `mail` VALUES ('2679', '6', 'stellaarzilli67@libero.it', 'ARZILLI STELLA');
INSERT INTO `mail` VALUES ('2680', '6', 'alessia.moffa@coldiretti.it', 'MOFFA ALESSIA');
INSERT INTO `mail` VALUES ('2681', '6', 'razzini1@alice.it', 'AZZINI GIANNI');
INSERT INTO `mail` VALUES ('2682', '6', 'francescafusco@inwind.it', 'FUSCO FRANCESCA');
INSERT INTO `mail` VALUES ('2683', '6', 'carlogiraldi@libero.it', 'GIRALDI CARLO');
INSERT INTO `mail` VALUES ('2684', '6', 'federica.capecchi@alice.it', 'CAPECCHI FEDERICA');
INSERT INTO `mail` VALUES ('2685', '6', 'paola.micheli@tin.it', 'MICHELI PAOLA');
INSERT INTO `mail` VALUES ('2686', '6', 'gloria.pesciaroli@gmail.com', 'PESCIAROLI GLORIA');
INSERT INTO `mail` VALUES ('2687', '6', 'alterinasileno@hotmail.com', 'SILENO ALTERINA');
INSERT INTO `mail` VALUES ('2688', '6', 'dbalocco@me.it', 'BALOCCO DANIELA');
INSERT INTO `mail` VALUES ('2689', '6', 'kiara.sissi@gmail.com', 'BARTOLOZZI CHIARA');
INSERT INTO `mail` VALUES ('2690', '6', 'antonellafalorni@libero.it', 'FALORNI ANTONELLA');
INSERT INTO `mail` VALUES ('2691', '6', 'fra.meiners@gmail.com', 'MEINERS FRANCESCA');
INSERT INTO `mail` VALUES ('2692', '6', 'raluca.burla@yahoo.com', 'BURLA RALUCA');
INSERT INTO `mail` VALUES ('2693', '6', 'avvgranchi@alice.it', 'GRANCHI ALESSIA');
INSERT INTO `mail` VALUES ('2694', '6', 'patrizia.alfani@alice.it', 'ALFANI PATRIZIA');
INSERT INTO `mail` VALUES ('2695', '6', 'lunatico@hotmail.it', 'BONGINI ILARIA');
INSERT INTO `mail` VALUES ('2696', '6', 'chiara.guasti@gmail.com', 'GUASTI CHIARA');
INSERT INTO `mail` VALUES ('2697', '6', 'andre.verdiani@libero.it', 'VERDIANI ANDREA');
INSERT INTO `mail` VALUES ('2698', '6', 'calamaim@gmail.com', 'CALAMAI MONICA');
INSERT INTO `mail` VALUES ('2699', '6', 'c.dalloro@gmail.com', 'DALLORO CLAUDIO');
INSERT INTO `mail` VALUES ('2700', '6', 'info@francescaevangelista.it', 'EVANGELISTA FRANCESCA');
INSERT INTO `mail` VALUES ('2701', '6', 'bea.galluzzi@gmail.com', 'GALLUZZI BEATRICE');
INSERT INTO `mail` VALUES ('2702', '6', 'federicacasini@hotmail.it', 'CASINI FEDERICA');
INSERT INTO `mail` VALUES ('2703', '6', 'mirellacianfrocca@gmail.com', 'CIANFROCCA MIRELLA');
INSERT INTO `mail` VALUES ('2704', '6', 'littleredcap@hotmail.it', 'GIANPIERI FRANCESCA');
INSERT INTO `mail` VALUES ('2705', '6', 'barbara.pipparelli@yahoo.it', 'PIPPARELLI BARBARA');
INSERT INTO `mail` VALUES ('2706', '6', 'm.brassi@virgilio.it', 'BRASSI MONICA');
INSERT INTO `mail` VALUES ('2707', '6', 'ylarya79@yahoo.it', 'CORSI ILARIA');
INSERT INTO `mail` VALUES ('2708', '6', 'vntina38@gmail.com', 'MAGINI VALENTINA');
INSERT INTO `mail` VALUES ('2709', '6', 'ales.burgassi@gmail.com', 'BURGASSI ALESSANDRA');
INSERT INTO `mail` VALUES ('2710', '6', 'maximo1973@hotmail.it', 'ARIGANELLO MASSIMO');
INSERT INTO `mail` VALUES ('2711', '6', 'adeleada@hotmail.com', 'BELLE ANTONIO');
INSERT INTO `mail` VALUES ('2712', '6', 'letizia.gentilini@libero.it', 'GENTILINI LETIZIA');
INSERT INTO `mail` VALUES ('2713', '6', 'lara.rigoli@alice.it', 'RIGOLI LARA');
INSERT INTO `mail` VALUES ('2714', '6', 'lucia.boschi@poste.it', 'BOSCHI LUCIA');
INSERT INTO `mail` VALUES ('2715', '6', 'enzagulotta@virgilio.it', 'BARBI ENZA');
INSERT INTO `mail` VALUES ('2716', '6', 'ariannalacche@fiora.it', 'LACCHE ARIANNA');
INSERT INTO `mail` VALUES ('2717', '6', 'silviatozzi@virgilio.it', 'TOZZI SILVIA');
INSERT INTO `mail` VALUES ('2718', '6', 'davcav83@hotmail.it', 'CAVALLARO DAVIDE');
INSERT INTO `mail` VALUES ('2719', '6', 'serena.montedoro@alice.it', 'MONTEDORO SERENA');
INSERT INTO `mail` VALUES ('2720', '6', 'ferrucci.samuele@gmail.com', 'FERRUCCI SAMUELE');
INSERT INTO `mail` VALUES ('2721', '6', 'silviachellini@hotmail.com', 'CHELLINI SILVIA');
INSERT INTO `mail` VALUES ('2722', '6', 'nancy-fanetti@hotmail.it', 'FANETTI NANCY');
INSERT INTO `mail` VALUES ('2723', '6', 'elisa_baldi@yahoo.it', 'BALDI ELISA');
INSERT INTO `mail` VALUES ('2724', '6', 'edoardoefilippo@yahoo.it', 'CENERINI SUSANNA');
INSERT INTO `mail` VALUES ('2725', '6', 'lorely2001@alice.it', 'QUERCI LORENZO');
INSERT INTO `mail` VALUES ('2726', '6', 'l.elena85@virgilio.it', 'LORENZONI ELENA');
INSERT INTO `mail` VALUES ('2727', '6', 'paradisi.romina@gmail.com', 'PARADISI ROMINA');
INSERT INTO `mail` VALUES ('2728', '6', 'sterpinmichele@libero.it', 'STERPIN MICHELE');
INSERT INTO `mail` VALUES ('2729', '6', 'l.pistolesi@email.it', 'PISTOLESI LUCA');
INSERT INTO `mail` VALUES ('2730', '6', 'enricocaruso9@gmail.com', 'CARUSO ENRICO');
INSERT INTO `mail` VALUES ('2731', '6', 'elenabibi@libero.it', 'FROSI ELENA');
INSERT INTO `mail` VALUES ('2732', '6', 'amarrata@gmail.com', 'MARRATA ALESSANDRA');
INSERT INTO `mail` VALUES ('2733', '6', 'mauriziabianchi@inwind.it', 'BIANCHI MAURIZIA');
INSERT INTO `mail` VALUES ('2734', '6', 'c.magagnini@hotmail.it', 'MAGAGNINI CLAUDIA');
INSERT INTO `mail` VALUES ('2735', '6', 'sognoliquido@libero.it', 'BUCCI WALTER');
INSERT INTO `mail` VALUES ('2736', '6', 'c.tardani@gmail.com', 'TARDANI CARLO');
INSERT INTO `mail` VALUES ('2737', '6', 'elena.basile@tiscali.it', 'BASILA ELENA');
INSERT INTO `mail` VALUES ('2738', '6', 'danda_ok@virgilio.it', 'ROSSI ALESSANDRA');
INSERT INTO `mail` VALUES ('2739', '6', 'anto.lombardo3@gmail.com', 'LOMBARDO ANTONELLA');
INSERT INTO `mail` VALUES ('2740', '6', 'info@spazio-verde.net', 'DONATI ANTONELLA');
INSERT INTO `mail` VALUES ('2741', '6', 'sandralazzerini@hotmail.it', 'LAZZERINI SANDRA');
INSERT INTO `mail` VALUES ('2742', '6', 'antonellagreco1966@libero.it', 'GRECO ANTONELLA');
INSERT INTO `mail` VALUES ('2743', '6', 'nicolamazzi@virgilio.it', 'MAZZI NICOLA');
INSERT INTO `mail` VALUES ('2744', '6', 'm.bartolini@yahoo.it', 'BARTOLINI MOIRA');
INSERT INTO `mail` VALUES ('2745', '6', 'orioliroberto@alice.it', 'ORIOLI ROBERTO');
INSERT INTO `mail` VALUES ('2746', '6', 'silvia6060@tiscali.it', 'BIANCUCCI SILVIA');
INSERT INTO `mail` VALUES ('2747', '6', 'stefania.vannini58@alice.it', 'VANNINI STEFANIA');
INSERT INTO `mail` VALUES ('2748', '6', 'lisa.gianifilippini@gmail.com', 'GIANI MARIA ELISA');
INSERT INTO `mail` VALUES ('2749', '6', 'patriziabidasio@virgilio.it', 'BIDASIO PATRIZIA');
INSERT INTO `mail` VALUES ('2750', '6', 'eliferp@yahoo.it', 'FERPOZZI ELISABETTA');
INSERT INTO `mail` VALUES ('2751', '6', 'sabrael@tin.it', 'RAELI SABRINA');
INSERT INTO `mail` VALUES ('2752', '6', 'gmarchi66@alice.it', 'MARCHI GIOVANNA');
INSERT INTO `mail` VALUES ('2753', '6', 'davidecalabri@elenet.it', 'CALABRI DAVIDE');
INSERT INTO `mail` VALUES ('2754', '6', 'andreavanni66@gmail.com', 'VANNI ANDREA');
INSERT INTO `mail` VALUES ('2755', '6', 'florinamihalcea@yahoo.it', 'MIHALCEA FLORINA');
INSERT INTO `mail` VALUES ('2756', '6', 'rsroma2007@libero.it', 'ROSELLI STEFANO');
INSERT INTO `mail` VALUES ('2757', '6', 'gentilinistefano@hotmail.it', 'GENTILINI STEFANO');
INSERT INTO `mail` VALUES ('2758', '6', 'giulio.romagnoli12@gmail.com', 'ROMAGNOLI GIULIO');
INSERT INTO `mail` VALUES ('2759', '6', 'romano65@alice.it', 'SCHILLACI VALENTINA');
INSERT INTO `mail` VALUES ('2760', '6', 'pippi972@libero.it', 'BONCIANI SABRINA');
INSERT INTO `mail` VALUES ('2761', '6', 'roxybarroxy@yahoo.it', 'ROSSI BARBARA');
INSERT INTO `mail` VALUES ('2762', '6', 'luisa.sofia8@gmail.com', 'VATIERO LUISA');
INSERT INTO `mail` VALUES ('2763', '6', 'lagnappetta@hotmail.com', 'FEDELI LISA');
INSERT INTO `mail` VALUES ('2764', '6', 'yurin92@hotmail.it', 'NALDI YURI');
INSERT INTO `mail` VALUES ('2765', '6', 'mugnaienrico@gmail.com', 'MUGNAI ENRICO');
INSERT INTO `mail` VALUES ('2766', '6', 'vanant739@gmail.com', 'VANNUCCI ELISABETTA');
INSERT INTO `mail` VALUES ('2767', '6', 'federica1307@gmail.it', 'ANTONELLI FEDERICA');
INSERT INTO `mail` VALUES ('2768', '6', 'giogiuli@hotmail.com', 'MONTANO GIOVANNA');
INSERT INTO `mail` VALUES ('2769', '6', 'gallettigianluca@yahoo.it', 'GALLETTI GIANLUCA');
INSERT INTO `mail` VALUES ('2770', '6', 'yle71@hotmail.it', 'CASALI FRANCESCO');
INSERT INTO `mail` VALUES ('2771', '6', 'silvano.polvani@virgilio.it', 'ROSSANO ALBERTA');
INSERT INTO `mail` VALUES ('2772', '6', 'nibrao@alice.it', 'TELESIO ANDREA');
INSERT INTO `mail` VALUES ('2773', '6', 'alice.petto@hotmail.it', 'PETTO ALICE');
INSERT INTO `mail` VALUES ('2774', '6', 'silvi801@hotmail.it', 'PAOLI SILVIA');
INSERT INTO `mail` VALUES ('2775', '6', 'porzio.andrea@alice.it', 'PORZIO ANDREA');
INSERT INTO `mail` VALUES ('2776', '6', 'lceccherini@alice.it', 'CECCHERINI LAURA');
INSERT INTO `mail` VALUES ('2777', '6', 'edefirbag@tiscali.it', 'IRACE GIOVANNI');
INSERT INTO `mail` VALUES ('2778', '6', 'giuliagaggioli@virgilio.it', 'GAGGIOLI GIULIA');
INSERT INTO `mail` VALUES ('2779', '6', 'caterina47@hotmail.it', 'GORI BONO CATERINA');
INSERT INTO `mail` VALUES ('2780', '6', 'g.ninci@libero.it', 'NINCI GIORGIO');
INSERT INTO `mail` VALUES ('2781', '6', 'direzione@lameridiana.net', 'CRIPPA PALMIRELLA');
INSERT INTO `mail` VALUES ('2782', '6', 'emilio.paganelli@alice.it', 'PAGANELLI EMILIO');
INSERT INTO `mail` VALUES ('2783', '6', 'svagolata@tiscali.it', 'GUIDI GABRIELLA');
INSERT INTO `mail` VALUES ('2784', '6', 'angela.saba@virgilio.it', 'SABA ANGELA');
INSERT INTO `mail` VALUES ('2785', '6', 'carlotta.gaggioli@alice.it', 'GAGGIOLI CARLOTTA');
INSERT INTO `mail` VALUES ('2786', '6', 'federicanespoli84@gmail.com', 'NESPOLI FEDERICA');
INSERT INTO `mail` VALUES ('2787', '6', 'elisabetta.975@gmail.com', 'PULCINI ELISABETTA');
INSERT INTO `mail` VALUES ('2788', '6', 'alessandra.srasino@gmail.com', 'SARASINO ALESSANDRA');
INSERT INTO `mail` VALUES ('2789', '6', 'info@distram.it', 'VEZZONI MASSIMO');
INSERT INTO `mail` VALUES ('2790', '6', 'cipriami@hotmail.com', 'PRIAMI CHIARA');
INSERT INTO `mail` VALUES ('2791', '6', 'vanessa.agnoletti@hotmail.it', 'AGNOLETTI VANESSA');
INSERT INTO `mail` VALUES ('2792', '6', 'maxcry@gmail.com', 'FANELLI MASSIMILIANO');
INSERT INTO `mail` VALUES ('2793', '6', 'remo.fedi@gmail.com', 'FEDI REMO');
INSERT INTO `mail` VALUES ('2794', '6', 'antonellacrespi@yahoo.it', 'CRESPI ANTONELLA');
INSERT INTO `mail` VALUES ('2795', '6', 'tudinogianni@gmail.com', 'TUDINO GIOVANNI');
INSERT INTO `mail` VALUES ('2796', '6', 'dave3464@libero.it', 'CANNETTI DAVIDE');
INSERT INTO `mail` VALUES ('2797', '6', 'cosetta07@libero.it', 'COLOMBO COSETTA');
INSERT INTO `mail` VALUES ('2798', '6', 'magi2859@gmail.com', 'GINANNESCHI MARZIA');
INSERT INTO `mail` VALUES ('2799', '6', 'torlaicarlo@virgilio.it', 'TORLAI CARLO');
INSERT INTO `mail` VALUES ('2800', '6', 'lamu_29@yahoo.it', 'BASTIANINI EMANUELA');
INSERT INTO `mail` VALUES ('2801', '6', 'l.biancardi@euroflexpad.com', 'BIANCARDI LORENZO');
INSERT INTO `mail` VALUES ('2802', '6', 'prosperigiulia93@gmail.com', 'PROSPERI GIULIA');
INSERT INTO `mail` VALUES ('2803', '6', 'bigcalimero@hotmail.com', 'BARSALI MONICA');
INSERT INTO `mail` VALUES ('2804', '6', 'benedetta.stefanile@libero.it', 'STEFANILE BENEDETTA');
INSERT INTO `mail` VALUES ('2805', '6', 'laservideo.follonica@libero.it', 'SUBASHI BENNARD');
INSERT INTO `mail` VALUES ('2806', '6', 'beneguidoni@yahoo.it', 'GUIDONI BENEDETTA');
INSERT INTO `mail` VALUES ('2807', '6', 'maria_cocca@yahoo.it', 'COCCA MARIA');
INSERT INTO `mail` VALUES ('2808', '6', 'mattia.godani@gmail.com', 'GODANI MATTIA');
INSERT INTO `mail` VALUES ('2809', '6', 'andrea21gianni@gmail.com', 'GIANNELLI ANDREA FERNANDO');
INSERT INTO `mail` VALUES ('2810', '6', 'andreaha@live.it', 'PARADISI ANDREA');
INSERT INTO `mail` VALUES ('2811', '6', 'd.contessa67@gmail.com', 'CONTESSA DANIELA');
INSERT INTO `mail` VALUES ('2812', '6', 'donatella.vannini@gmail.com', 'VANNINI DONATELLA');
INSERT INTO `mail` VALUES ('2813', '6', 'giannini.federica@libero.it', 'GIANNINI FEDERICA');
INSERT INTO `mail` VALUES ('2814', '6', 'alessandro.scarpata@gmail.com', 'SCARPATA ALESSANDRO');
INSERT INTO `mail` VALUES ('2815', '6', 'lucazafarana1976@hotmail.it', 'ZAFARANA LUCA');
INSERT INTO `mail` VALUES ('2816', '6', 'thomas871@supereva.it', 'CHIESA GIOVANNA');
INSERT INTO `mail` VALUES ('2817', '6', 'federica@lafenicestudio.com', 'LORENZI FEDERICA');
INSERT INTO `mail` VALUES ('2818', '6', 'f.boddi@virgilio.it', 'BODDI FRANCESCA');
INSERT INTO `mail` VALUES ('2819', '6', 'alessia.ugolini@enel.com', 'UGOLINI ALESSIA');
INSERT INTO `mail` VALUES ('2820', '6', 'enzoooop86@hotmail.it', 'PETRAZZUOLO VINCENZO');
INSERT INTO `mail` VALUES ('2821', '6', 'papagab@alice.it', 'PAPA GABRIELE');
INSERT INTO `mail` VALUES ('2822', '6', 'stefanobia@hotmail.com', 'BIAGI STEFANO');
INSERT INTO `mail` VALUES ('2823', '6', 'pagliuchi.daniela@libero.it', 'PAGLIUCHI DANIELA');
INSERT INTO `mail` VALUES ('2824', '6', 'barby2205@icloud.com', 'MARTINI BARBARA');
INSERT INTO `mail` VALUES ('2825', '6', 'giovannibertelli@alice.it', 'BARTOLUCCI SABRINA');
INSERT INTO `mail` VALUES ('2826', '6', 'silvana.giambarresi@fastwebnet.it', 'GIAMBARRESI SILVANA');
INSERT INTO `mail` VALUES ('2827', '6', 'sabrinaldi@virgilio.it', 'RINALDI SABRINA');
INSERT INTO `mail` VALUES ('2828', '6', 'mario.procacci@gmail.com', 'PROCACCI MARIO');
INSERT INTO `mail` VALUES ('2829', '6', 'marcobenedetti08@hotmail.it', 'MICHELI MARCO');
INSERT INTO `mail` VALUES ('2830', '6', 'vantil33@gmail.com', 'MARTELLI VALENTINA');
INSERT INTO `mail` VALUES ('2831', '6', 'mantovanimarianna@hotmail.it', 'MANTOVANI MARIANNA');
INSERT INTO `mail` VALUES ('2832', '6', 'g.cerri@hotmail.it', 'CERRI GIACOMO');
INSERT INTO `mail` VALUES ('2833', '6', 'd.passerini@gmail.com', 'PASSERINI DAVIDE');
INSERT INTO `mail` VALUES ('2834', '6', 'silvia.benvenuti@gmail.com', 'BENVENUTI SILVIA');
INSERT INTO `mail` VALUES ('2835', '6', 'alebiondi90@gmail.com', 'BIONDI ALESSIO');
INSERT INTO `mail` VALUES ('2836', '6', 'francescobosche1998@alice.it', 'BOSCHETTI FRANCESCO');
INSERT INTO `mail` VALUES ('2837', '6', 'farmaciadelbottegone@yahoo.it', 'DONNINI GIULIA');
INSERT INTO `mail` VALUES ('2838', '6', 'gm.doc@alice.it', 'DEL VIVA MONICA');
INSERT INTO `mail` VALUES ('2839', '6', 'silviasebastianelli@live.it', 'SEBASTIANELLI SILVIA');
INSERT INTO `mail` VALUES ('2840', '6', 'andreafriscia@hotmail.it', 'FRISCIA ANDREA');
INSERT INTO `mail` VALUES ('2841', '6', 'c.bonacquisto@tiscali.it', 'BONACQUISTO CARLO');
INSERT INTO `mail` VALUES ('2842', '6', 'simone.braccagni@libero.it', 'BRACCAGNI SIMONE');
INSERT INTO `mail` VALUES ('2843', '6', 'giadagrotto@libero.it', 'GROTTO GIADA');
INSERT INTO `mail` VALUES ('2844', '6', 'nicolettaviviani29@gmail.com', 'VIVIANI NICOLETTA');
INSERT INTO `mail` VALUES ('2845', '6', 'beatrice.cs@libero.it', 'CINOTTI BEATRICE');
INSERT INTO `mail` VALUES ('2846', '6', 'rtalpa@libero.it', 'NENCINI ROSANNA');
INSERT INTO `mail` VALUES ('2847', '6', 'sozzi.luca@alice.it', 'SOZZI LUCA');
INSERT INTO `mail` VALUES ('2848', '6', 'lapostadielena@gmail.com', 'PARADISI ELENA');
INSERT INTO `mail` VALUES ('2849', '6', 'ritamello@libero.it', 'MELLO ANNARITA');
INSERT INTO `mail` VALUES ('2850', '6', 'alellada@virgilio.it', 'LAZZERINI ALESSIA');
INSERT INTO `mail` VALUES ('2851', '6', 'giornielis@libero.it', 'GIORNI ELISABETTA');
INSERT INTO `mail` VALUES ('2852', '6', 'info@corydon.com', 'BIAGIOTTI CRISTIANO');
INSERT INTO `mail` VALUES ('2853', '6', 'marketti@gmail.com', 'MARCHETTI SILVIA');
INSERT INTO `mail` VALUES ('2854', '6', 'fedielettra@hotmail.it', 'FEDI ELETTRA');
INSERT INTO `mail` VALUES ('2855', '6', 'danielefioretti7@gmail.com', 'FIORETTI DANIELE');
INSERT INTO `mail` VALUES ('2856', '6', 'johannag.nagy@gmail.com', 'NAGY JOHANNA GEORGETTE');
INSERT INTO `mail` VALUES ('2857', '6', 'paolacostatita@yahoo.it', 'COSTA PAOLA');
INSERT INTO `mail` VALUES ('2858', '6', 'giuseppemilicia@alice.it', 'MILICIA GIUSEPPE');
INSERT INTO `mail` VALUES ('2859', '6', 'elenamonnecchi@hotmail.it', 'MONNECCHI ELENA');
INSERT INTO `mail` VALUES ('2860', '6', 'balbilau@gmail.it', 'BALBI LAURA');
INSERT INTO `mail` VALUES ('2861', '6', 'mletizia58@yahoo.it', 'PARRINI MARIA LETIZIA');
INSERT INTO `mail` VALUES ('2862', '6', 'ily.b@live.it', 'BANTI ILARIA');
INSERT INTO `mail` VALUES ('2863', '6', 'illibato66@gmail.com', 'ILLIBATO GIOVANNI');
INSERT INTO `mail` VALUES ('2864', '6', 'vallinisonia@libero.it', 'VALLINI SONIA');
INSERT INTO `mail` VALUES ('2865', '6', 'girgenti84@gmail.com', 'GIRGENTI VALERIA');
INSERT INTO `mail` VALUES ('2866', '6', 'dibonitop@gmail.com', 'DI BONITO PAOLO');
INSERT INTO `mail` VALUES ('2867', '6', 'gosto991@tiscali.it', 'AGOSTINI MARCO');
INSERT INTO `mail` VALUES ('2868', '6', 'gianlucabugnoli@gmail.com', 'BUGNOLI GIANLUCA');
INSERT INTO `mail` VALUES ('2869', '6', 'luisacartocci@gmail.com', 'CARTOCCI LUISA');
INSERT INTO `mail` VALUES ('2870', '6', 'rosacichez@hotmail.it', 'CICHELLO ROSA');
INSERT INTO `mail` VALUES ('2871', '6', 'g-gentile@hotmail.it', 'GENTILE GIOVANNI');
INSERT INTO `mail` VALUES ('2872', '6', 'bagnopineta@yahoo.it', 'GORACCI VALENTINA');
INSERT INTO `mail` VALUES ('2873', '6', 'mauropatrizia1@virgilio.it', 'CONFORTI PATRIZIA');
INSERT INTO `mail` VALUES ('2874', '6', 'cristinamontomoli@yahoo.it', 'MONTOMOLI CRISTINA');
INSERT INTO `mail` VALUES ('2875', '6', 'andreaprizzi73@yahoo.it', 'PRIZZI ANDREA');
INSERT INTO `mail` VALUES ('2876', '6', 'camilla.forci@libero.it', 'FORCI CAMILLA MARIA');
INSERT INTO `mail` VALUES ('2877', '6', 'niccolotuci@gmail.com', 'TUCI NICCOLO');
INSERT INTO `mail` VALUES ('2878', '6', 'domenico.fimmano@virgilio.it', 'FIMMANO DOMENICO');
INSERT INTO `mail` VALUES ('2879', '6', 'claudio_terranova@teletu.it', 'TERRANOVA CLAUDIO');
INSERT INTO `mail` VALUES ('2880', '6', 'ippolitoannarita@gmail.com', 'IPPOLITO ANNARITA');
INSERT INTO `mail` VALUES ('2881', '6', 'lisa.borelli@alice.it', 'BORELLI LISA');
INSERT INTO `mail` VALUES ('2882', '6', 'gpacinotti@alice.it', 'PACINOTTI GIULIO');
INSERT INTO `mail` VALUES ('2883', '6', 'lauramagnani72@yahoo.it', 'MAGNANI LAURA');
INSERT INTO `mail` VALUES ('2884', '6', 'elena.maestrini@hotmail.it', 'MAESTRINI ELENA');
INSERT INTO `mail` VALUES ('2885', '6', 'rudichellini@alice.it', 'CHELLINI RUDI');
INSERT INTO `mail` VALUES ('2886', '6', 'siberius1971@hotmail.it', 'BIANCHI LEONARDO');
INSERT INTO `mail` VALUES ('2887', '6', 'ricca.r@libero.it', 'ROSSETTI RICCARDO');
INSERT INTO `mail` VALUES ('2888', '6', 'smazzei30@gmail.com', 'MAZZEI SILVIA');
INSERT INTO `mail` VALUES ('2889', '6', 'federica.ldv@hotmail.it', 'LUDOVICO FEDERICA');
INSERT INTO `mail` VALUES ('2890', '6', 'cristianacirillo@gmail.com', 'CIRILLO CRISTIANA');
INSERT INTO `mail` VALUES ('2891', '6', 'rotapinuccia@alice.it', 'ROTA PINUCCIA');
INSERT INTO `mail` VALUES ('2892', '6', 'tizianacirillo1@inwind.it', 'CIRILLO TIZIANA');
INSERT INTO `mail` VALUES ('2893', '6', 'mandellimirco@gmail.com', 'MANDELLI MIRCO');
INSERT INTO `mail` VALUES ('2894', '6', 'claudianiccolini@virgilio.it', 'NICCOLINI CLAUDIA');
INSERT INTO `mail` VALUES ('2895', '6', 's.fra.1978@gmail.com', 'SALVADORI FRANCESCO');
INSERT INTO `mail` VALUES ('2896', '6', 'cecilia.baldi@gmail.com', 'BALDI CECILIA');
INSERT INTO `mail` VALUES ('2897', '6', 'marce@hotmail.it', 'ROMBAI MARCELLA');
INSERT INTO `mail` VALUES ('2898', '6', 'carla.sorini@alice.it', 'SORINI CARLA');
INSERT INTO `mail` VALUES ('2899', '6', 'lucatonini83@libero.it', 'TONINI LUCA');
INSERT INTO `mail` VALUES ('2900', '6', 'fediscilla@gmail.it', 'ALFIERI ANTONIO');
INSERT INTO `mail` VALUES ('2901', '6', 'ester.melis@hotmail.it', 'MELIS ESTER');
INSERT INTO `mail` VALUES ('2902', '6', 'gianni-spa@hotmail.it', 'SPADANUDA GIANNI');
INSERT INTO `mail` VALUES ('2903', '6', 'cinziafr@hotmail.it', 'FRANCINI CINZIA');
INSERT INTO `mail` VALUES ('2904', '6', 'franco.martini.53@alice.it', 'MARTINI FRANCO');
INSERT INTO `mail` VALUES ('2905', '6', 'viviani.fabrizio@libero.it', 'MILINI FIORELLA');
INSERT INTO `mail` VALUES ('2906', '6', 'fulvioinfo@parcodellecalle.it', 'EGIDI FULVIO');
INSERT INTO `mail` VALUES ('2907', '6', 'avv.simonebulleri@gmail.com', 'BULLERI SIMONE');
INSERT INTO `mail` VALUES ('2908', '6', 'carlaasta@hotmail.it', 'ASTA CARLA');
INSERT INTO `mail` VALUES ('2909', '6', 'alessia@overture.it', 'RICCIUTI ALESSIA');
INSERT INTO `mail` VALUES ('2910', '6', 'andysordi@tiscali.it', 'SORDI ANDREA');
INSERT INTO `mail` VALUES ('2911', '6', 'pula@virgilio.it', 'DE ANGELIS MARIA DANIELA');
INSERT INTO `mail` VALUES ('2912', '6', 'petriza@libero.it', 'MODRIC PETRIZZA');
INSERT INTO `mail` VALUES ('2913', '6', 'santorusso@yahoo.it', 'RUSSO SANTO');
INSERT INTO `mail` VALUES ('2914', '6', 'cristozza@libero.it', 'PECORINI CRISTINA');
INSERT INTO `mail` VALUES ('2915', '6', 'parigi.sandro@gmail.com', 'PARIGI SANDRO');
INSERT INTO `mail` VALUES ('2916', '6', 'pellicceria.rolando@alice.it', 'GALLERINI ROSSANA');
INSERT INTO `mail` VALUES ('2917', '6', 'dondoli.luciana@gmail.com', 'DONDOLI LUCIANA');
INSERT INTO `mail` VALUES ('2918', '2', 'personale@lagardenia.com', 'LA GARDENIA BEAUTY S.P.A.');
INSERT INTO `mail` VALUES ('2919', '2', 'marco@dp.adv.it', 'D&P DI PELAGALLI DANIELA');
INSERT INTO `mail` VALUES ('2930', '2', 'elisabetta.pippi@pasqui.it', 'PIPPI ELISABETTA');
INSERT INTO `mail` VALUES ('2931', '2', 'luigia.volpe@libero.it', 'VOLPE LUIGIA');
INSERT INTO `mail` VALUES ('2936', '2', 'olgasmal@libero.it', 'OLGA SMAL');
INSERT INTO `mail` VALUES ('2943', '2', 'manciaupao@unisi.it', 'MANGIAVACCHI PAOLA');
INSERT INTO `mail` VALUES ('2946', '2', 'gigimedina@libero.it', 'MEDINA LUIGI');
INSERT INTO `mail` VALUES ('2956', '2', 'rosdam09@gmail.com', 'DAMATO ROSANNA');
INSERT INTO `mail` VALUES ('2957', '2', 'tabacchimontagni@alice.it', 'MONTAGNI MARCO');
INSERT INTO `mail` VALUES ('2976', '2', 'ranieripisaneschi@gmail.com', 'PISANESCHI RANIERI');
INSERT INTO `mail` VALUES ('2998', '2', 'fedele@liquidweb.it', 'FEDELE PASQUALE');
INSERT INTO `mail` VALUES ('3007', '2', 'elisacivai@libero.it', 'CIVAI ELISA');
INSERT INTO `mail` VALUES ('3049', '2', 'giovannamoretti@inwind.it', 'MORETTI GIOVANNA');
INSERT INTO `mail` VALUES ('3050', '2', 'pianigiani.paola@gmail.com', 'PIANIGIANI PAOLA');
INSERT INTO `mail` VALUES ('3086', '2', 'monica.moc76@gmail.com', 'TATINI MONICA');
INSERT INTO `mail` VALUES ('3087', '2', 'marimam_@alice.it', 'CRISCUOLO MARILENA');
INSERT INTO `mail` VALUES ('3089', '2', 'barbara.pipolo@libero.it', 'PIPOLO BARBARA');
INSERT INTO `mail` VALUES ('3095', '2', 'papiveronica@virgilio.it', 'PAPI VERONICA');
INSERT INTO `mail` VALUES ('3115', '2', 'longo.enrica0@gmail.com', 'LONGO ENRICA');
INSERT INTO `mail` VALUES ('3133', '2', 'gabriellabucciarelli@yahoo.com', 'BUCCIARELLI GABRIELLA');
INSERT INTO `mail` VALUES ('3153', '2', 'grafinoc@gmail.com', 'FINOCCHIARO GRAZIA');
INSERT INTO `mail` VALUES ('3163', '2', 'catiarsignorini@libero.it', 'SIGNORINI CATIA ROBERTA');
INSERT INTO `mail` VALUES ('3170', '2', 'ninarrapaj@yahoo.it', 'RRAPAJ NABILE');
INSERT INTO `mail` VALUES ('3182', '2', 'rosamonaco@tin.it', 'MONACO ROSA');
INSERT INTO `mail` VALUES ('3188', '2', 'maddalena.sanfilippo@gmail.com', 'SANFILIPPO MADDALENA');
INSERT INTO `mail` VALUES ('3190', '2', 'antonellamore@gmail.com', 'MORETTI ANTONELLA');
INSERT INTO `mail` VALUES ('3192', '2', 'claudiafuf@gmail.it', 'CAMILLI CLAUDIA');
INSERT INTO `mail` VALUES ('3209', '2', 'riccilorenzo22@gmail.com', 'RICCI LORENZO');
INSERT INTO `mail` VALUES ('3219', '2', 'silvia@papi.us', 'CICALI SILVIA');
INSERT INTO `mail` VALUES ('3224', '2', 'martina.smarties@hotmail.it', 'MELANI LUISA');
INSERT INTO `mail` VALUES ('3229', '2', 'daniela.giannotti@yahoo.it', 'GIANNOTTI DANIELA');
INSERT INTO `mail` VALUES ('3231', '2', 'ilucionadri@hotmail.com', 'ZAVALA ADRIANA');
INSERT INTO `mail` VALUES ('3234', '2', 'sereisola@gmail.com', 'ISOLA SERENA');
INSERT INTO `mail` VALUES ('3235', '2', 'danie.lap@alice.it', 'PASTORELLI DANIELA');
INSERT INTO `mail` VALUES ('3236', '2', 'misslalybat@hotmail.it', 'BANELLI ALICE');
INSERT INTO `mail` VALUES ('3237', '2', 'nicoletabocu@yahoo.com', 'BOCU NICOLETA');
INSERT INTO `mail` VALUES ('3238', '2', 'roberto.pierini.j16v@alice.it', 'PIERINI SARA');
INSERT INTO `mail` VALUES ('3239', '2', 'margherita.daraio@hotmail.it', 'GIORGI PATRIZIA');
INSERT INTO `mail` VALUES ('3240', '2', 'dani.datt@gonlinet.com', 'DATTERI DANIELA');
INSERT INTO `mail` VALUES ('3241', '2', 'sbruni615@vodafone.it', 'BRUNI SILVIA');
INSERT INTO `mail` VALUES ('3242', '2', 'antonellaburroni@yahoo.it', 'BURRONI ANTONELLA');
INSERT INTO `mail` VALUES ('3243', '2', 'fabri.angiu@hotmail.it', 'ANGIULLI FABRIZIO');
INSERT INTO `mail` VALUES ('3244', '2', 'amanniboletti@gmail.com', 'ANNIBOLETTI ALESSIA MARIA');
INSERT INTO `mail` VALUES ('3245', '2', 'patriziaspena@libero.it', 'SPENA PATRIZIA');
INSERT INTO `mail` VALUES ('3246', '2', 'luisabernardini@yahoo.it', 'BERNARDINI MARIA LUISA');
INSERT INTO `mail` VALUES ('3247', '2', 'mauronoc@libero.it', 'NOCENTINI MAURO');
INSERT INTO `mail` VALUES ('3248', '2', 'valentinaborgogni@yahoo.it', 'BORGOGNI VALENTINA');
INSERT INTO `mail` VALUES ('3249', '2', 'stgial@me.com', 'DALBELLO STEFANIA');
INSERT INTO `mail` VALUES ('3250', '2', 'silvia00088@hotmail.it', 'BIANCHI SILVIA');
INSERT INTO `mail` VALUES ('3251', '2', 'ghelmez.daniela@yahoo.com', 'GHELMEZ DANIELA');
INSERT INTO `mail` VALUES ('3252', '2', 'barbara@nonviolenza.com', 'PERIEI BARBARA');
INSERT INTO `mail` VALUES ('3253', '2', 'studiomomi@tin.it', 'GIANNINI GRAZIELLA');
INSERT INTO `mail` VALUES ('3254', '2', 'delilapalma@hotmail.com', 'NUELLE ANNETTE');
INSERT INTO `mail` VALUES ('3255', '2', 'paolabruschi64@gmail.com', 'BRUSCHI PAOLA');
INSERT INTO `mail` VALUES ('3256', '2', 'paganelli_simona@virgilio.it', 'PAGANELLI SIMONA');
INSERT INTO `mail` VALUES ('3257', '2', 'missyrbag@hotmail.it', 'QUATELA GABRIELLA');
INSERT INTO `mail` VALUES ('3258', '2', 'matteogomitolini@gmail.com', 'GOMITOLINI MATTEO');
INSERT INTO `mail` VALUES ('3259', '2', 'solitos@tiscali.it', 'SOLITO SABRINA');
INSERT INTO `mail` VALUES ('3260', '2', 'chiaraciabucchi@yahoo.it', 'CIABUCCHI CHIARA');
INSERT INTO `mail` VALUES ('3261', '2', 'ra_ki.95@hotmail.it', 'MARTINI RACHELE');
INSERT INTO `mail` VALUES ('3262', '2', 'claudia.cipriani@email.it', 'CIPRIANI CLAUDIA');
INSERT INTO `mail` VALUES ('3263', '2', 'marta.zurli@virgilio.it', 'ZURLI MARTA');
INSERT INTO `mail` VALUES ('3264', '2', 'giarina2881@yahoo.it', 'GRIGORE MADALINA');
INSERT INTO `mail` VALUES ('3265', '2', 'fabio.turchi81@gmail.com', 'TURCHI FABIO');
INSERT INTO `mail` VALUES ('3266', '2', 'gabriellas@yahoo.it', 'SPULBER GABRIELLA');
INSERT INTO `mail` VALUES ('3267', '2', 'crazyflyers7@yahoo.it', 'BANCHI BARBARA');
INSERT INTO `mail` VALUES ('3268', '2', 'ungarilucia@live.it', 'ZURLI LUCIA');
INSERT INTO `mail` VALUES ('3269', '2', 'anna.bartolini@hotmail.it', 'BARTOLINI ANNA');
INSERT INTO `mail` VALUES ('3270', '2', 'vanneschiluca@yahoo.it', 'VANNESCHI LUCA');
INSERT INTO `mail` VALUES ('3271', '2', 'maicol.g@hotmail.it', 'GRATENI MAICOL');
INSERT INTO `mail` VALUES ('3272', '2', 'elit.93@hotmail.it', 'TOMMASINI ELISA');
INSERT INTO `mail` VALUES ('3273', '2', 'valesweet93@hotmail.it', 'BONINI VALENTINA');
INSERT INTO `mail` VALUES ('3274', '2', 'patriziagstn@gmail.com', 'GIUSTINI PATRIZIA');
INSERT INTO `mail` VALUES ('3275', '2', 'tania_tecla@tin.it', 'DI TOMASO TANIA');
INSERT INTO `mail` VALUES ('3276', '2', 'ros.vitale@virgilio.it', 'VITALE ROSSANA');
INSERT INTO `mail` VALUES ('3277', '2', 'lejdi.dervishi@gmail.com', 'DERVISHI LEYDI');
INSERT INTO `mail` VALUES ('3278', '2', 'alessandrini.elisabetta@tin.it', 'ALESSANDRINI ELISABETTA');
INSERT INTO `mail` VALUES ('3279', '2', 'tempera93@hotmail.it', 'TEMPERANI FRANCESCA');
INSERT INTO `mail` VALUES ('3280', '2', 'millacamilla72@gmail.com', 'PIESCHI MICHELA');
INSERT INTO `mail` VALUES ('3281', '2', 'ritaguidotti@teletu.it', 'GUIDOTTI M.RITA');
INSERT INTO `mail` VALUES ('3282', '2', 'dario.galeotti@istruzione.it', 'GALEOTTI DARIO');
INSERT INTO `mail` VALUES ('3283', '2', 'sciao.la@libero.it', 'GIORGI LAURA');
INSERT INTO `mail` VALUES ('3284', '2', 'antonella.c.64@gmail.com', 'CAMPANA ANTONELLA');
INSERT INTO `mail` VALUES ('3285', '2', 'zofiatuchlin@aruba.it', 'TUCHLIN ZOFIA');
INSERT INTO `mail` VALUES ('3286', '2', 'liasuo@gmail.com', 'FIORENTINO OLIMPIA');
INSERT INTO `mail` VALUES ('3287', '2', 'antonelli.s@alice.it', 'ANTONELLI SONIA');
INSERT INTO `mail` VALUES ('3288', '2', 'marinalucioli@live.it', 'LUCIOLI MARINA');
INSERT INTO `mail` VALUES ('3289', '2', 'ca.je@hotmail.it', 'CABONI JESSICA');
INSERT INTO `mail` VALUES ('3290', '2', 'consuela.perugini@alice.it', 'PERUGINI CONSUELA');
INSERT INTO `mail` VALUES ('3291', '2', 'katiabarrella@yahoo.it', 'BARRELLA KATIA');
INSERT INTO `mail` VALUES ('3292', '2', 'annaburroni@fastwebnet.it', 'BURRONI ANNA MARIA');
INSERT INTO `mail` VALUES ('3293', '2', 'robymicheletto@hotmail.it', 'MICHELETTO ROBERTA');
INSERT INTO `mail` VALUES ('3304', '2', 'patriziocanaleparola@libero.it', 'CANALE PAROLA PATRIZIO');
INSERT INTO `mail` VALUES ('3309', '2', 'giunardi@hotmail.it', 'NARDI GIUSY');
INSERT INTO `mail` VALUES ('3313', '2', 'adrymecheri@gmail.com', 'MECHERI ADRIANA');
INSERT INTO `mail` VALUES ('3314', '2', 'w.marci@hotmail.it', 'FRASCHETTI PAOLA');
INSERT INTO `mail` VALUES ('3334', '2', 'giuliapuccininegrini@hotmail.com', 'PUCCINI NEGRINI GIULIA');
INSERT INTO `mail` VALUES ('3337', '2', 'bejenarova@hotmail.it', 'BEJENAROVA KATERINA');
INSERT INTO `mail` VALUES ('3338', '2', 'vdini65@gmail.com', 'DINI VALERIA');
INSERT INTO `mail` VALUES ('3339', '2', 'princess.srl@libero.it', 'CACCIAMANO ANNA');
INSERT INTO `mail` VALUES ('3340', '2', 'elisazito@gmail.com', 'ZITO ELISA');
INSERT INTO `mail` VALUES ('3341', '2', 'miaelena@hotmail.it', 'STROE MIA ELENA');
INSERT INTO `mail` VALUES ('3342', '2', 'elisabetta.forzoni@email.it', 'FORZONI ELISABETTA');
INSERT INTO `mail` VALUES ('3348', '2', 'fabiodelsound@hotmail.com', 'SANTINI FABIO');
INSERT INTO `mail` VALUES ('3357', '2', 'costanza.benvenuti@yahoo.it', 'BENVENUTI COSTANZA');
INSERT INTO `mail` VALUES ('3362', '2', 'gabririva@gmail.com', 'RIVA GABRIELLA');
INSERT INTO `mail` VALUES ('3366', '2', 'alvaro.giorgi@alice.it', 'GIORGI ALVARO');
INSERT INTO `mail` VALUES ('3367', '2', 'mano2812@gmail.com', 'CONTI MANOLA');
INSERT INTO `mail` VALUES ('3368', '2', 'enricocappelli@alice.it', 'BONCOMPAGNI ROSANNA');
INSERT INTO `mail` VALUES ('3386', '2', 'b.etto@hotmail.it', 'GIANNINI FABIO');
INSERT INTO `mail` VALUES ('3387', '2', 'anparado@alice.it', 'DOMENICI DONATELLA');
INSERT INTO `mail` VALUES ('3389', '2', 'canigianithebest@gmail.com', 'CANIGIANI NICOL');
INSERT INTO `mail` VALUES ('3398', '2', 'agnese.nesti@gmail.com', 'NESTI ROBERTO');
INSERT INTO `mail` VALUES ('3401', '2', 'bati@hotmail.it', 'BORUSZKOWSKA BEATA');
INSERT INTO `mail` VALUES ('3405', '2', 'max71@libero.it', 'BIAGIONI MASSIMO');
INSERT INTO `mail` VALUES ('3411', '2', 'paolabozzolini@yahoo.it', 'BOZZOLINI PAOLA');
INSERT INTO `mail` VALUES ('3412', '2', 'b.canaponi@virgilio.it', 'CANAPONI BARBARA');
INSERT INTO `mail` VALUES ('3422', '2', 'fabtang@yahoo.it', 'TANGARO FABIO');
INSERT INTO `mail` VALUES ('3423', '2', 'francesco.giusiani@gmail.com', 'GIUSANI FRANCESCO');
INSERT INTO `mail` VALUES ('3428', '2', 'matteucciclaudia@virgilio.it', 'MATTEUCCI CLAUDIA');
INSERT INTO `mail` VALUES ('3429', '2', 'marju@inwind.it', 'BERTOCCHI MANUELA');
INSERT INTO `mail` VALUES ('3433', '2', 'piera.datorre2@alice.it', 'DA TORRE PIERA');
INSERT INTO `mail` VALUES ('3434', '2', 'agnolie@libero.it', 'CIPRIANI ALESSANDRA');
INSERT INTO `mail` VALUES ('3435', '2', 'carmengiulia@email.it', 'PATEA CARMELA');
INSERT INTO `mail` VALUES ('3436', '2', 'sartinisimona@libero.it', 'SARTINI SIMONA');
INSERT INTO `mail` VALUES ('3437', '2', 'o.bonnefoi@waypress.it', 'BONNEFOI ODILE');
INSERT INTO `mail` VALUES ('3438', '2', 'francesca@ideaevent.it', 'BATORI FRANCESCA');
INSERT INTO `mail` VALUES ('3439', '2', 'stellayi@hotmail.com', 'ZHOU YI');
INSERT INTO `mail` VALUES ('3440', '2', 'stefania.volpone@gmail.com', 'VOLPONE STEFANIA');
INSERT INTO `mail` VALUES ('3441', '2', 'francemill@execite.it', 'MILONI FRANCESCA');
INSERT INTO `mail` VALUES ('3442', '2', 'rossella.ceccherini@libero.it', 'CECCHERINI ROSSELLA');
INSERT INTO `mail` VALUES ('3443', '2', 'laurafantucci63@gmail.com', 'FANTUCCI LAURA');
INSERT INTO `mail` VALUES ('3444', '2', 'biagini.sonia@libero.it', 'BIAGINI SONIA');
INSERT INTO `mail` VALUES ('3448', '2', 'alexapretz@hotmail.it', 'VON PRETZ ALEXA');
INSERT INTO `mail` VALUES ('3449', '2', 'iv97@hotmail.it', 'TROTTA M.GIOVANNA');
INSERT INTO `mail` VALUES ('3450', '2', 'valentinamazzocchetti@hotmail.com', 'MAZZOCCHETTI VALENTINA');
INSERT INTO `mail` VALUES ('3451', '2', 'ilarden@tin.it', 'ARDENTI ILARIA');
INSERT INTO `mail` VALUES ('3456', '2', 'm.zardetto@gmail.com', 'ZARDETTO MICHELE');
INSERT INTO `mail` VALUES ('3457', '2', 'giada1892@hotmail.it', 'DINI GIADA');
INSERT INTO `mail` VALUES ('3463', '2', 'remo.boiardi@fastwebnet.it', 'BOIARDI REMO');
INSERT INTO `mail` VALUES ('3467', '2', 'chiaragiardina@hotmail.com', 'GIARDINA CHIARA');
INSERT INTO `mail` VALUES ('3481', '2', 'giusy.manzione@alice.it', 'MANZIONE GIUSY');
INSERT INTO `mail` VALUES ('3487', '2', 'ginevraprivate@gmail.com', 'RUGANI GINEVRA');
INSERT INTO `mail` VALUES ('3488', '2', 'tommaso.loriga@me.com', 'LORIGA TOMMASO');
INSERT INTO `mail` VALUES ('3499', '2', 'claudio.ulivelli@alice.it', 'ULIVELLI CLAUDIO');
INSERT INTO `mail` VALUES ('3505', '2', 'chiarinagro@libero.it', 'GROSSI CHIARA');
INSERT INTO `mail` VALUES ('3509', '2', 'laurenzi.donatella@gmail.com', 'LAURENZI DONATELLA');
INSERT INTO `mail` VALUES ('3510', '2', 'chiara.giuliattini@katamail.com', 'GIULIATTINI CHIARA');
INSERT INTO `mail` VALUES ('3511', '2', 'claudiateci@libero.it', 'TECI CLAUDIA');
INSERT INTO `mail` VALUES ('3512', '2', 'laura.burroni@hotmail.it', 'BURRONI LAURA');
INSERT INTO `mail` VALUES ('3513', '2', 'andrea.umbertini@alice.it', 'UMBERTINI ANDREA');
INSERT INTO `mail` VALUES ('3514', '2', 'giorgia@farmaciassannunziata.191.it', 'BARTOLI GIORGIA');
INSERT INTO `mail` VALUES ('3515', '2', 'franciraio@hotmail.it', 'RAIOLA FRANCESCA');
INSERT INTO `mail` VALUES ('3516', '2', 'carlofantoni@yahoo.it', 'FANTONI CARLO');
INSERT INTO `mail` VALUES ('3517', '2', 'ricca.regio@gmail.com', 'REGIO RICCARDO');
INSERT INTO `mail` VALUES ('3522', '2', 'lucafossati83@gmail.com', 'FOSSATI LUCA');
INSERT INTO `mail` VALUES ('3529', '2', 'luigizazzaro@gmail.it', 'ZAZZARO LUIGI');
INSERT INTO `mail` VALUES ('3530', '2', 'serenaghe@yahoo.it', 'GHELARDINI SERENA');
INSERT INTO `mail` VALUES ('3538', '2', 'bterrana@tcservice.it', 'BALATA URSULA');
INSERT INTO `mail` VALUES ('3540', '2', 'querci@unisi.it', 'QUERCI GIACOMO');
INSERT INTO `mail` VALUES ('3541', '2', 'a.mansi@solmine.it', 'MANSI ANTONELLA');
INSERT INTO `mail` VALUES ('3542', '2', 'g.milza@virgilio.it', 'MILZA GIORGIA');
INSERT INTO `mail` VALUES ('3545', '2', 'kblewandowski@t-online.de', 'CARONTI CRISTINA');
INSERT INTO `mail` VALUES ('3554', '2', 'giambastiani1@tin.it', 'GIAMBASTIANI MARIA CARLA');
INSERT INTO `mail` VALUES ('3555', '2', 'guadagni@guadagnistudiolegale.it', 'GUADAGNI ANTONELLA');
INSERT INTO `mail` VALUES ('3565', '2', 'serenamaggi@hotmail.it', 'MAGGI SERENA');
INSERT INTO `mail` VALUES ('3574', '2', 'loredana.nunziati@tin.it', 'NUNZIATI LOREDANA');
INSERT INTO `mail` VALUES ('3575', '2', 'sararube77@gmail.com', 'RUBECHINI SARA');
INSERT INTO `mail` VALUES ('3576', '2', 'bubu_cot78@yahoo.com', 'CIMPEANU ECATERINA');
INSERT INTO `mail` VALUES ('3577', '2', 'tommaso.cocci@alice.it', 'BERNARDI SARA');
INSERT INTO `mail` VALUES ('3578', '2', 'stefanyf@tin.it', 'FRASI STEFANIA');
INSERT INTO `mail` VALUES ('3579', '2', 'eloisa81b@libero.it', 'BALDINI ELISA');
INSERT INTO `mail` VALUES ('3580', '2', 'r.anulli@usl8.toscana.it', 'ANULLI ROBERTA');
INSERT INTO `mail` VALUES ('3581', '2', 'silviocavallucci@yahoo.it', 'CAVALLUCCI SILVIO');
INSERT INTO `mail` VALUES ('3582', '2', 'b.bertoni@hotmail.it', 'BERTONI BENEDETTA');
INSERT INTO `mail` VALUES ('3592', '2', 'angeli2005@yandex.ru', 'PICCOLO ANDREA');
INSERT INTO `mail` VALUES ('3601', '2', 'laurachetoni@hotmail.it', 'CHETONI LAURA MARIA');
INSERT INTO `mail` VALUES ('3602', '2', 'kovacsistuanozzi@freemail.hu', 'KOVACS ALEXANDRA');
INSERT INTO `mail` VALUES ('3603', '2', 'cusinfederico@gmail.com', 'CUSIN FEDERICO');
INSERT INTO `mail` VALUES ('3605', '2', 'saragambera@yahoo.it', 'GAMBERA SARA');
INSERT INTO `mail` VALUES ('3610', '2', 'ily_n4@hotmail.it', 'CASELLI ILARIA');
INSERT INTO `mail` VALUES ('3611', '2', 'mdancer84@hotmail.it', 'NAVARRA MICHELA');
INSERT INTO `mail` VALUES ('3615', '2', 'guidi.gianluca@yahoo.it', 'GUIDI GIANLUCA');
INSERT INTO `mail` VALUES ('3616', '2', 'gustavo.cilento@gmail.com', 'CILENTO GUSTAVO');
INSERT INTO `mail` VALUES ('3617', '2', 'giuseppe.terracciano@hotmail.it', 'TERRACCIANO GIUSEPPE');
INSERT INTO `mail` VALUES ('3619', '2', 'marilenamochionory@yahoo.it', 'DE LAZZARI MARILENA');
INSERT INTO `mail` VALUES ('3620', '2', 'nexa@email.it', 'LIONE FRANCESCA');
INSERT INTO `mail` VALUES ('3621', '2', 'giulia.ambrosio@f2n.it', 'AMBROSIO GIULIA');
INSERT INTO `mail` VALUES ('3622', '2', 'flo_aniello@yahoo.it', 'ANIELLO VITTORIA FLORA');
INSERT INTO `mail` VALUES ('3623', '2', 'martasanarelli@libero.it', 'SANARELLI MARTA');
INSERT INTO `mail` VALUES ('3624', '2', 'piezurli@tin.it', 'TARULLI PAMELA');
INSERT INTO `mail` VALUES ('3625', '2', 'chiarini.mc@virgilio.it', 'CHIARINI MARIA CHIARA');
INSERT INTO `mail` VALUES ('3626', '2', 'francescamencaroni@alice.it', 'MENCARONI FRANCESCA');
INSERT INTO `mail` VALUES ('3627', '2', 'michelamencaroni@yahoo.it', 'MENCARONI MICHELA');
INSERT INTO `mail` VALUES ('3628', '2', 'patriziasestini@gmail.com', 'SESTINI PATRIZIA');
INSERT INTO `mail` VALUES ('3629', '2', 'irenear@inwind.it', 'MARIOTTINI IRENE');
INSERT INTO `mail` VALUES ('3630', '2', 'monica.rank@libero.it', 'RANCHICCHIO MONICA');
INSERT INTO `mail` VALUES ('3631', '2', 'laura@immaginelaura.f2n.it', 'FALSINI LAURA');
INSERT INTO `mail` VALUES ('3632', '2', 'beatrice.morini@fastwebnet.it', 'MORINI BEATRICE');
INSERT INTO `mail` VALUES ('3653', '2', 'simonetta.viviani@yahoo.it', 'VIVIANI SIMONETTA');
INSERT INTO `mail` VALUES ('3654', '2', 'palrizzi@gmail.com', 'RIZZI PALMA');
INSERT INTO `mail` VALUES ('3659', '2', 'claudio.gentile73@gmail.com', 'GENTILE CLAUDIO');
INSERT INTO `mail` VALUES ('3660', '2', 'pugliese.sara@yahoo.it', 'PUGLIESE SARA');
INSERT INTO `mail` VALUES ('3663', '2', 'skh7015@hammail.net', 'SEOK KEVH HWA');
INSERT INTO `mail` VALUES ('3666', '2', 'maria_stella_10@mail.ru', 'GORBUNOVA MARIYA');
INSERT INTO `mail` VALUES ('3670', '2', 'martina.pighini@gmail.com', 'PIGHINI MARTINA');
INSERT INTO `mail` VALUES ('3676', '2', 'lisa.cecchini@rotork.com', 'CECCHINI LISA');
INSERT INTO `mail` VALUES ('3677', '2', 'chiara85@virgilio.it', 'VIVIANI CHIARA');
INSERT INTO `mail` VALUES ('3699', '2', 'manuela.fenili@alice.it', 'FENILI MANUELA');
INSERT INTO `mail` VALUES ('3703', '2', 'carla.terrosi@italcode.it', 'TERROSI CARLA');
INSERT INTO `mail` VALUES ('3704', '2', 'isabella.fiumi@gmail.com', 'FIUMI ISABELLA');
INSERT INTO `mail` VALUES ('3710', '2', 'cristina.luchetti@alice.it', 'LUCHETTI CRISTINA');
INSERT INTO `mail` VALUES ('3715', '2', 'jennifer2005@live.it', 'RICCI CHIARA');
INSERT INTO `mail` VALUES ('3762', '2', 'farmaover.srl@tiscali.it', 'FARMA OVER SRL');
INSERT INTO `mail` VALUES ('3763', '2', 'milena.decagna@virgilio.it', 'DE CAGNA MILENA');
INSERT INTO `mail` VALUES ('3764', '2', 'steven.baldini@gmail.com', 'BALDINI STEVEN');
INSERT INTO `mail` VALUES ('3765', '2', 'anna.sergialis@wp.pl', 'SERGIALIS ANNA');
INSERT INTO `mail` VALUES ('3766', '2', 'e.wonderland@katamail.com', 'COCCI ELEONORA');
INSERT INTO `mail` VALUES ('3767', '2', 'yasmineisca@gmail.com', 'ISCARO YASMINE');
INSERT INTO `mail` VALUES ('3768', '2', 'elibardho@gmail.com', 'BARDHO ELIOLA');
INSERT INTO `mail` VALUES ('3769', '2', 'beatrice.march@gmail.com', 'MARCHETTI BEATRICE');
INSERT INTO `mail` VALUES ('3770', '2', 'bpatty23@gmail.com', 'BAUCO PATRIZIA');
INSERT INTO `mail` VALUES ('3771', '2', 'edipucci@libero.it', 'PUCCI EDI');
INSERT INTO `mail` VALUES ('3773', '2', 'serena1970@alice.it', 'BERTI SERENA');
INSERT INTO `mail` VALUES ('3774', '2', 'p.burali@virgilio.it', 'BURALI PAOLO');
INSERT INTO `mail` VALUES ('3775', '2', 'margheritaverdelli@hotmail.it', 'VERDELLI MARGHERITA');
INSERT INTO `mail` VALUES ('3776', '2', 'brokerazienda@gmail.com', 'PIOMBANTI RICCARDO');
INSERT INTO `mail` VALUES ('3777', '2', 'manuelaporcaro@libero.it', 'PORCARO MANUELA');
INSERT INTO `mail` VALUES ('3778', '2', 'ely0089@hotmail.it', 'DONATI ELISA');
INSERT INTO `mail` VALUES ('3779', '2', 'pre.betta@libero.it', 'PRESENTI ELISABETTA');
INSERT INTO `mail` VALUES ('3780', '2', 'luciastocchi@libero.it', 'STOCCHI LUCIA');
INSERT INTO `mail` VALUES ('3781', '2', 'tognazzo_bruno@libero.it', 'TARGA PAOLA');
INSERT INTO `mail` VALUES ('3782', '2', 'natcutini@gmail.com', 'CUTINI NATALIA');
INSERT INTO `mail` VALUES ('3783', '2', 'valentina.vitiello@fastwebmail.it', 'VITIELLO VALENTINA');
INSERT INTO `mail` VALUES ('3784', '2', 'ferrfrancesca@libero.it', 'FERRARO ROBERTO');
INSERT INTO `mail` VALUES ('3788', '2', 'angie12264@hotmail.com', 'VESGA MENESES ANGELICA PATRICIA');
INSERT INTO `mail` VALUES ('3794', '2', 'bianchiquirino@infinito.it', 'BIANCHI SARA');
INSERT INTO `mail` VALUES ('3803', '2', 'saracoletti86@yahoo.it', 'COLETTI SARA');
INSERT INTO `mail` VALUES ('3806', '2', 'ghiberta@virgilio.it', 'GHINASSI ROBERTA');
INSERT INTO `mail` VALUES ('3812', '2', 'cristyfedo@libero.it', 'FEDORONKO KHRYSTYNA');
INSERT INTO `mail` VALUES ('3818', '2', 'elenakiss@katamail.com', 'ROGGI ELENA');
INSERT INTO `mail` VALUES ('3819', '2', 'sofia.rossi@hotmail.it', 'ROSSI SOFIA');
INSERT INTO `mail` VALUES ('3825', '2', 'r.roncaccia@rai.it', 'RONCACCIA RAFFAELLA');
INSERT INTO `mail` VALUES ('3830', '2', 'sterza71@yahoo.it', 'TERZANI ALESSANDRA');
INSERT INTO `mail` VALUES ('3831', '2', 'pubblicherelazioni@libero.it', 'CONFORTI ANDREA');
INSERT INTO `mail` VALUES ('3838', '2', 'claudio.r@laa.it', 'RAJOLA CLAUDIO');
INSERT INTO `mail` VALUES ('3840', '2', 'francescoelement@gmail.com', 'ORLANDI FRANCESCO');
INSERT INTO `mail` VALUES ('3853', '2', 'annamaria.vignuda@ania.it', 'VIGNUDA ANNAMARIA');
INSERT INTO `mail` VALUES ('3856', '2', 'martina.panicucci@hotmail.it', 'PANICUCCI MARTINA');
INSERT INTO `mail` VALUES ('3857', '2', 'stella.katerinova@gmail.com', 'KATERINOVA STELLA');
INSERT INTO `mail` VALUES ('3858', '2', 'francesca.fedini@tin.it', 'FEDINI FRANCESCA');
INSERT INTO `mail` VALUES ('3859', '2', 'gabry.erre@me.com', 'RENZA GABRIELLA');
INSERT INTO `mail` VALUES ('3860', '2', 'axire76@hotmail.it', 'GORI ERIKA');
INSERT INTO `mail` VALUES ('3865', '2', 'danielafamigliulo@gmail.com', 'FANIGLIULO DANIELA');
INSERT INTO `mail` VALUES ('3875', '2', 'eli_soleluna@yahoo.it', 'GIGLI ELISABETTA');
INSERT INTO `mail` VALUES ('3876', '2', 'gr.ar.gio@hotmail.it', 'MARGIACCHI GIORGIO');
INSERT INTO `mail` VALUES ('3877', '2', 'nardo64@alice.it', 'NARDOIANNI ANGELO');
INSERT INTO `mail` VALUES ('3878', '2', 'patriziafailli@libero.it', 'FAILLI PATRIZIA');
INSERT INTO `mail` VALUES ('3879', '2', 'lguidelli@libero.it', 'GUIDELLI LORENZA');
INSERT INTO `mail` VALUES ('3880', '2', 'megu96@live.it', 'MALENTACCHI ELISA');
INSERT INTO `mail` VALUES ('3883', '2', 'sarafalciani@hotmail.it', 'FALCIANI SARA');
INSERT INTO `mail` VALUES ('3891', '2', 'da.nuti@aliceposta.it', 'NUTI DANIELE');
INSERT INTO `mail` VALUES ('3904', '2', 'riolgia@tin.it', 'OLGIATI RICCARDO');
INSERT INTO `mail` VALUES ('3908', '2', 'nicola_giudici@libero.it', 'GIUDICI NICOLA');
INSERT INTO `mail` VALUES ('3916', '2', 'f.sbrilli@virgilio.it', 'SBRILLI FLAVIA');
INSERT INTO `mail` VALUES ('3920', '2', 'ivana.kekezc@libero.it', 'SFINGE SRL');
INSERT INTO `mail` VALUES ('3924', '2', 'patrizia.chericoni@gmail.com', 'FANDANGO SRL');
INSERT INTO `mail` VALUES ('3928', '2', 'federico.saccomaino@gmail.com', 'SACCOMAINO FEDERICO');
INSERT INTO `mail` VALUES ('3931', '2', 'marinettie@live.it', 'MARINETTI ELENA');
INSERT INTO `mail` VALUES ('3935', '2', 'marta.occhini@alice.it', 'OCCHINI MARTA');
INSERT INTO `mail` VALUES ('3936', '2', 'atesta@istitutoagazzi.it', 'TESTA ALESSANDRA');
INSERT INTO `mail` VALUES ('3937', '2', 'ecannelli@alispa.it', 'CANNELLI ELENA');
INSERT INTO `mail` VALUES ('3938', '2', 'spadino.t@hotmail.it', 'TUTI MARCO');
INSERT INTO `mail` VALUES ('3939', '2', 'gottar07@tin.it', 'GOTTARDELLO ELISABETTA');
INSERT INTO `mail` VALUES ('3940', '2', 'cecco1989@libero.it', 'CECCARELLI FEDERICO');
INSERT INTO `mail` VALUES ('3941', '2', 'lorigori@hotmail.com', 'GORI LOREDANA');
INSERT INTO `mail` VALUES ('3942', '2', 'axel_4@email.it', 'MATERAZZI MARISA');
INSERT INTO `mail` VALUES ('3943', '2', 'giorgia.scarpelli@libero.it', 'SCARPELLI GIORGIA');
INSERT INTO `mail` VALUES ('3945', '2', 'elenaldini@alice.it', 'NALDINI ELENA');
INSERT INTO `mail` VALUES ('3956', '2', 'claudiamarianagosman@libero.it', 'GOSMAN CLAUDIA');
INSERT INTO `mail` VALUES ('3957', '2', 'giovapo67@yahoo.it', 'NAPOLITANO GIOVANNI');
INSERT INTO `mail` VALUES ('3963', '2', 'depianoalessandro@gmail.com', 'DE PIANO ALESSANDRO');
INSERT INTO `mail` VALUES ('3964', '2', 'giovannacala@virgilio.it', 'CALA GIOVANNA');
INSERT INTO `mail` VALUES ('3965', '2', 'fragiacomogiuseppe@yahoo.it', 'FRAGIACOMO GIUSEPPE');
INSERT INTO `mail` VALUES ('3975', '2', 'gianni.bicchierai@libero.it', 'BICCHIERAI GIANNI');
INSERT INTO `mail` VALUES ('3978', '2', 'wfattore@yahoo.it', 'FATTORE WALTER');
INSERT INTO `mail` VALUES ('3984', '2', 'martina1981@hotmail.it', 'CAUCCHI MARTINA');
INSERT INTO `mail` VALUES ('3987', '2', 'kinalive@libero.it', 'STORARI LUISA');
INSERT INTO `mail` VALUES ('4004', '2', 'svaleri@interfree.it', 'VALERI SANDRA');
INSERT INTO `mail` VALUES ('4014', '2', 'dashonok88@inbox.in', 'TSYBAN DARIA');
INSERT INTO `mail` VALUES ('4016', '2', 'studiocasasubbiano@alice.it', 'BIDINI GRAZIELLA');
INSERT INTO `mail` VALUES ('4017', '2', 'kiara.tommi@alice.it', 'TOMMASIELLO KIARA');
INSERT INTO `mail` VALUES ('4018', '2', 'francescogianangeli@msn.com', 'GIANANGELI FRANCESCO');
INSERT INTO `mail` VALUES ('4019', '2', 'esmeralda.baci@gmail.com', 'BACI ESMERALDA');
INSERT INTO `mail` VALUES ('4020', '2', 'scolariannalisa@hotmail.it', 'SCOLARI ANNALISA');
INSERT INTO `mail` VALUES ('4021', '2', 'rossellagargini@hotmail.it', 'GARGINI ROSSELLA');
INSERT INTO `mail` VALUES ('4022', '2', 'amascolini@yahoo.com', 'MASCOLINI ANNA');
INSERT INTO `mail` VALUES ('4023', '2', 'alvarobartolini@alice.it', 'BARTOLINI ALVARO');
INSERT INTO `mail` VALUES ('4024', '2', 'whitenicols@hotmail.it', 'TARCHIANI SIMONE');
INSERT INTO `mail` VALUES ('4025', '2', 'lavinia.toscani@gmail.com', 'TOSCANI LAVINIA');
INSERT INTO `mail` VALUES ('4026', '2', 'francesca.evangelisti@gmail.com', 'EVANGELISTI FRANCESCA');
INSERT INTO `mail` VALUES ('4027', '2', 'cristina.corsi75@hotmail.it', 'CORSI CRISTINA');
INSERT INTO `mail` VALUES ('4028', '2', 'sinniabau@yahoo.it', 'BARACCHI SILVIA');
INSERT INTO `mail` VALUES ('4029', '2', 'jessica_cutini@hotmail.it', 'CUTINI JESSICA');
INSERT INTO `mail` VALUES ('4030', '2', 'handan26@hotmail.com', 'MAZZI HANDAN');
INSERT INTO `mail` VALUES ('4032', '2', 'sdunhamangiolini@gmail.com', 'DUNHAM ANGIOLINI SWAN');
INSERT INTO `mail` VALUES ('4045', '2', 'harmarco70@gmail.com', 'GIACINTI MARCO');
INSERT INTO `mail` VALUES ('4046', '2', 'rinnovarte@gmail.com', 'LIBERATORI STEFANIA');
INSERT INTO `mail` VALUES ('4047', '2', 'lisa.paoletti@alice.it', 'PAOLETTI LISA');
INSERT INTO `mail` VALUES ('4048', '2', 'mielealessandro@hotmail.it', 'MIELE ALESSANDRO');
INSERT INTO `mail` VALUES ('4049', '2', 'mfini@inwind.it', 'FINI MASSIMILIANO');
INSERT INTO `mail` VALUES ('4050', '2', 'paolanoferi@libero.it', 'NOFERI PAOLA');
INSERT INTO `mail` VALUES ('4051', '2', 'vale.conticini@hotmail.it', 'CONTICINI VALENTINA');
INSERT INTO `mail` VALUES ('4052', '2', 'loredana.mazzuoli@alice.it', 'MAZZUOLI LOREDANA');
INSERT INTO `mail` VALUES ('4053', '2', 'mluisa.soldo@tiscali.it', 'SOLDO MARIA LUIGIA');
INSERT INTO `mail` VALUES ('4054', '2', 'monika.82@alice.it', 'FABBRINI MONIKA');
INSERT INTO `mail` VALUES ('4055', '2', 'specialk80@libero.it', 'SPECIALE CATERINA');
INSERT INTO `mail` VALUES ('4063', '2', 'giami.montauti@gmail.com', 'CAPPELLI SANDRA');
INSERT INTO `mail` VALUES ('4064', '2', 'frankmerola@libero.it', 'MEROLA FRANCESCO');
INSERT INTO `mail` VALUES ('4071', '2', 'valentina.marcozzi@katamail.com', 'MARCOZZI VALENTINA');
INSERT INTO `mail` VALUES ('4074', '2', 'ifranconi1@gmail.com', 'FRANCONI IRENE');
INSERT INTO `mail` VALUES ('4081', '2', 'sabatoantonella@libero.it', 'SABATO ANTONELLA');
INSERT INTO `mail` VALUES ('4085', '2', 'blixen26@libero.it', 'LEPRI ROBERTA');
INSERT INTO `mail` VALUES ('4097', '2', 'vejta66@hotmail.com', 'ARENA SALVATORE');
INSERT INTO `mail` VALUES ('4109', '2', 'chiara.scaccioni@gmail.com', 'SCACCIONI CHIARA');
INSERT INTO `mail` VALUES ('4110', '2', 'simonero74@gmail.com', 'SORBINI SIMONE');
INSERT INTO `mail` VALUES ('4111', '2', 'rdegiudici@gmail.com', 'DE GIUDICI RICCARDO');
INSERT INTO `mail` VALUES ('4112', '2', 'monicabrandini@virgilio.it', 'BRANDINI MONICA');
INSERT INTO `mail` VALUES ('4113', '2', 'agri.casagrande@alice.it', 'CALAGNA LUCREZIA');
INSERT INTO `mail` VALUES ('4117', '2', 'luciamontomoli@libero.it', 'MONTOMOLI LUCIA');
INSERT INTO `mail` VALUES ('4125', '2', 'andreafabiani@hotmail.it', 'FABIANAI ANDREA');
INSERT INTO `mail` VALUES ('4127', '2', 'anna_papiri@hotmail.it', 'RINALDO ANNA');
INSERT INTO `mail` VALUES ('4130', '2', 'zazzeri.cori@inwind.it', 'ZAZZERI CORINNA');
INSERT INTO `mail` VALUES ('4131', '2', 'gp280763@alice.it', 'PIERINI GERARDO');
INSERT INTO `mail` VALUES ('4132', '2', 'f.damarciaso@gmail.com', 'DA MARCIASO FRANCESCA');
INSERT INTO `mail` VALUES ('4135', '2', 'angela.buzzanca@interno.it', 'BUZZANCA ANGELA');
INSERT INTO `mail` VALUES ('4136', '2', 'roberta.gemmino@med.unipi.it', 'GEMMINO ROBERTA');
INSERT INTO `mail` VALUES ('4137', '2', 'tiziano.decanini@gmail.com', 'DECANINI TIZIANO');
INSERT INTO `mail` VALUES ('4138', '2', 'daniela-fabbri@hotmail.it', 'FABBRI DANIELA');
INSERT INTO `mail` VALUES ('4144', '2', 'domenica.ventre@gmail.com', 'VENTRE DOMENICA');
INSERT INTO `mail` VALUES ('4154', '2', 'asusic1@yahoo.com', 'SUSIC ANA');
INSERT INTO `mail` VALUES ('4155', '2', 'paola.tomassoni@alice.it', 'TOMASSONI PAOLA');
INSERT INTO `mail` VALUES ('4161', '2', '2fedemadia@gmail.com', 'MADIA FEDERICA');
INSERT INTO `mail` VALUES ('4168', '2', 'kemical@hotmail.it', 'TARDELLI MARCO');
INSERT INTO `mail` VALUES ('4173', '2', 'boris@monitin.com', 'GUROUITH BORIS');
INSERT INTO `mail` VALUES ('4174', '2', 'martyf84@libero.it', 'FOGAGNOLO MARTINA');
INSERT INTO `mail` VALUES ('4175', '2', 'aniarybak@hotmail.it', 'RYBAK ANNA KATARZYNA');
INSERT INTO `mail` VALUES ('4178', '2', 'rizzo77@gmail.com', 'RIZZO GIANLUCA');
INSERT INTO `mail` VALUES ('4180', '2', 'info@osteriailrifrullo.it', 'FAGNONI EUGENIO');
INSERT INTO `mail` VALUES ('4181', '2', 'biagini.bruno@yahoo.fr', 'BIAGINI BRUNO');
INSERT INTO `mail` VALUES ('4185', '2', 'antonella.giovannelli@gmail.com', 'MONTEVERDI ANTONELLA');
INSERT INTO `mail` VALUES ('4188', '2', 'tommasomontagna@gmail.com', 'MONTAGNA TOMMASO');
INSERT INTO `mail` VALUES ('4193', '2', 'alesker77@gmail.com', 'JAVANSHIROV ALEX');
INSERT INTO `mail` VALUES ('4231', '2', 'leleonorarossi@hotmail.it', 'ROSSI ELEONORA');
INSERT INTO `mail` VALUES ('4232', '2', 'cinzia.alpini@alice.it', 'ALPINI CINZIA');
INSERT INTO `mail` VALUES ('4233', '2', 'deborinsky@hotmail.it', 'GIANI DEBORA');
INSERT INTO `mail` VALUES ('4234', '2', 'robertademajo@me.com', 'DE MAJO ROBERTA');
INSERT INTO `mail` VALUES ('4235', '2', 'monicaburicchi@libero.it', 'BURICCHI MONICA');
INSERT INTO `mail` VALUES ('4236', '2', 'simonetta.fiorani@hotmail.it', 'FIORANI SIMONETTA');
INSERT INTO `mail` VALUES ('4237', '2', 'sabrina.anziano@yahoo.com', 'ANZIANO BURRONI SABRINA');
INSERT INTO `mail` VALUES ('4238', '2', 'ottonero5@libero.it', 'COCCHI SILVIA');
INSERT INTO `mail` VALUES ('4239', '2', 'antonio.alterini@alterini.it', 'ALTERINI ANTONIO');
INSERT INTO `mail` VALUES ('4240', '2', 'alesbilli@gmail.com', 'BILLI ALESSANDRO');
INSERT INTO `mail` VALUES ('4241', '2', 'giannaefabio@libero.it', 'PEZZUOLI GIANNA');
INSERT INTO `mail` VALUES ('4242', '2', 'coradeschi@ledavvocati.it', 'CORADESCHI MARIA LEDA');
INSERT INTO `mail` VALUES ('4243', '2', 'carlafierli@gmail.com', 'FIERLI CARLA');
INSERT INTO `mail` VALUES ('4244', '2', 'ivanage@live.it', 'GERARDI IVANA');
INSERT INTO `mail` VALUES ('4245', '2', 'cinziavaleriani@live.it', 'VALERIANI CINZIA');
INSERT INTO `mail` VALUES ('4246', '2', 'cortesi.debora@gmail.com', 'CORTESI DEBORA');
INSERT INTO `mail` VALUES ('4247', '2', 'cristina.chierici@libero.it', 'CHERICI MARIA CRISTINA');
INSERT INTO `mail` VALUES ('4248', '2', 'jaki2002@alice.it', 'OMARINI FRANCESCA');
INSERT INTO `mail` VALUES ('4249', '2', 'luanagaudini@alice.it', 'GAUDINI LUANA');
INSERT INTO `mail` VALUES ('4382', '2', 'leila-garzillo@virgilio.it', 'GARZILLO LEILA');
INSERT INTO `mail` VALUES ('4383', '2', 'stefano.mori@eutelia.com', 'MORI STEFANO');
INSERT INTO `mail` VALUES ('4384', '2', 'i.colopi_radiconvento@tin.it', 'COLOPI ISABELLA');
INSERT INTO `mail` VALUES ('4385', '2', 'desy@yahoo.it', 'BARBAGLI DESIRE');
INSERT INTO `mail` VALUES ('4386', '2', 'isa.borrelli@gmail.com', 'BORRELLI ISABELLA');
INSERT INTO `mail` VALUES ('4387', '2', 'calabria.chiara88@gmail.com', 'CALABRIA CHIARA');
INSERT INTO `mail` VALUES ('4388', '2', 'panichi.franc@gmail.com', 'PANICHI FRANCESCA');
INSERT INTO `mail` VALUES ('4389', '2', 'cristianachiericoni@virgilio.it', 'CHIERICONI CRISTIANA');
INSERT INTO `mail` VALUES ('4390', '2', 'serena.nocentini@inwind.it', 'NOCENTINI SERENA');
INSERT INTO `mail` VALUES ('4477', '2', 'costanza.lumini@popvi.it', 'LUMINI COSTANZA');
INSERT INTO `mail` VALUES ('4478', '2', 'nadiam47@libero.it', 'MENABONI NADIA');
INSERT INTO `mail` VALUES ('4479', '2', 'initimere@alice.it', 'MAMMELLI DORETTA');
INSERT INTO `mail` VALUES ('4480', '2', 'massimo.biancucci63@libero.it', 'BIANCUCCI MASSIMO');
INSERT INTO `mail` VALUES ('4481', '2', 'candi@tim.it', 'BORGHINI CANDIDA');
INSERT INTO `mail` VALUES ('4482', '2', 'cioniandrea2@gmail.com', 'CIONI ANDREA');
INSERT INTO `mail` VALUES ('4483', '2', 'lucia.guicciardi@libero.it', 'GUICCIARDI LUCIA');
INSERT INTO `mail` VALUES ('4484', '2', 'julia_06@hotmail.it', 'PAFFETTI ALESSANDRO');
INSERT INTO `mail` VALUES ('4485', '2', 's.parolai@vipcarspa.it', 'PAROLAI SERGIO');
INSERT INTO `mail` VALUES ('4486', '2', 'b.rustici@alice.it', 'RUSTICI BARBARA');
INSERT INTO `mail` VALUES ('4559', '2', 'elisabettafusco@gmail.com', 'FUSCO ELISABETTA');
INSERT INTO `mail` VALUES ('4560', '2', 'md19.84@tiscali.it', 'DUSSO MANUELA');
INSERT INTO `mail` VALUES ('4561', '2', 'g.monn@tin.it', 'BENIGNI SILVIA');
INSERT INTO `mail` VALUES ('4567', '2', 'ciumachella81@hotmail.it', 'MARZIANO FRANCESCA');
INSERT INTO `mail` VALUES ('4568', '2', 'chicchi@alice.it', 'MATERAZZI LUCA');
INSERT INTO `mail` VALUES ('4569', '2', 'cristinanardis@virgilio.it', 'NARDIS MARIA CRISTINA');
INSERT INTO `mail` VALUES ('4570', '2', 'pieraccinimarco@alice.it', 'PIERACCINI MARCO');
INSERT INTO `mail` VALUES ('4571', '2', 'dpetra@live.it', 'DAVID PETRONELA');
INSERT INTO `mail` VALUES ('4572', '2', 'viculia@infinito.it', 'ORYSHICH YULIYA');
INSERT INTO `mail` VALUES ('4573', '2', 'nicolameciani@tiscali.it', 'MECIANI NICOLA');
INSERT INTO `mail` VALUES ('4574', '2', 'lunaesp@hotmail.it', 'ESPOSITO ANNA LUCIA');
INSERT INTO `mail` VALUES ('4575', '2', 's.keienburg@googlemail.com', 'KEIENBURG SUSANNA');
INSERT INTO `mail` VALUES ('4576', '2', 'francesco.carmetti@virgilio.it', 'CARMETTI FRANCESCO');
INSERT INTO `mail` VALUES ('4577', '2', 'riccardo.locantore@yahoo.it', 'LOCANTORE RICCARDO');
INSERT INTO `mail` VALUES ('4578', '2', 'sonia.lomolino@alice.it', 'SIMONELLI RODOLFO');
INSERT INTO `mail` VALUES ('4579', '2', 'fronon@libero.it', 'ALMONTE NANGJ');
INSERT INTO `mail` VALUES ('4580', '2', 'a.polla@alice.it', 'POLLA ALESSANDRA');
INSERT INTO `mail` VALUES ('4581', '2', 'fg.bonci@yahoo.it', 'CORCIAIA ERIKA');
INSERT INTO `mail` VALUES ('4582', '2', 'alerenna@alice.it', 'RENNA ALESSANDRA');
INSERT INTO `mail` VALUES ('4583', '2', 'stefano_ferraresi@libero.it', 'FERRARESI STEFANO');
INSERT INTO `mail` VALUES ('4585', '2', 'cirosmarino@virgilio.it', 'CI.DA.SI SAS DI C.MARINO');
INSERT INTO `mail` VALUES ('4610', '2', 'albicocca3@alice.it', 'GIUSTI CLAUDIO');
INSERT INTO `mail` VALUES ('4627', '2', 'josi@virgilio.it', 'PEROTTI GIUSY');
INSERT INTO `mail` VALUES ('4628', '2', 'd.manichi@virgilio.it', 'MANICHI DANIELA');
INSERT INTO `mail` VALUES ('4629', '2', 'paolapaggini@alice.it', 'PAGGINI PAOLA');
INSERT INTO `mail` VALUES ('4630', '2', 'p.calamati@comune.arezzo.it', 'CALAMATI PAOLA');
INSERT INTO `mail` VALUES ('4631', '2', 'patriziafabiani@hotmail.it', 'FABIANI PATRIZIA');
INSERT INTO `mail` VALUES ('4676', '2', 'vittoriaorlandi@rockemail.com', 'ORLANDI VITTORIA CATERINA');
INSERT INTO `mail` VALUES ('4677', '2', 'monica.grechi@hotmail.it', 'GRECHI MONICA');
INSERT INTO `mail` VALUES ('4678', '2', 'rotter1@cheapnet.it', 'TERRACINA LISA');
INSERT INTO `mail` VALUES ('4679', '2', 'vibabitre@yahoo.it', 'DE SIMONE ROSARIA');
INSERT INTO `mail` VALUES ('4680', '2', 'mara_marzocchi@gmail.com', 'MARZOCCHI MARA');
INSERT INTO `mail` VALUES ('4681', '2', 'maxdraghi@gmail.com', 'DRAGHI MASSIMILIANO');
INSERT INTO `mail` VALUES ('4682', '2', 'angian3@tin.it', 'DE LUCIA ANGELO');
INSERT INTO `mail` VALUES ('4683', '2', 'lelli.paolo@alice.it', 'LELLI PAOLO');
INSERT INTO `mail` VALUES ('4684', '2', 'kent_la4@tiscali.it', 'KENT LAILA');
INSERT INTO `mail` VALUES ('4685', '2', 'reimes@libero.it', 'REINA DANIELA');
INSERT INTO `mail` VALUES ('4686', '2', 'giulia_s20@hotmail.it', 'SABINI GIULIA');
INSERT INTO `mail` VALUES ('4687', '2', 'zedyna@live.it', 'GIANNETTI LAURA');
INSERT INTO `mail` VALUES ('4688', '2', 'flaminia93@hotmail.it', 'VEGNI FLAMINIA');
INSERT INTO `mail` VALUES ('4689', '2', 'barbaracarrozzino@yahoo.it', 'CARROZZINO BARBARA');
INSERT INTO `mail` VALUES ('4690', '2', 'collinedimaremma@gmail.com', 'DONNARUMMA UMBERTO');
INSERT INTO `mail` VALUES ('4696', '2', 'famgal1994@alice.it', 'BIANCUCCI BARBARA');
INSERT INTO `mail` VALUES ('4697', '2', 'roberta.mascalchi@alice.it', 'MASCALCHI ROBERTA');
INSERT INTO `mail` VALUES ('4698', '2', 'luciagiusti13@libero.it', 'GIUSTI LUCIA');
INSERT INTO `mail` VALUES ('4699', '2', 'ely.finzi@gmail.com', 'FINZI ELISA');
INSERT INTO `mail` VALUES ('4724', '2', 'riccardogrosseto@gmail.com', 'VELTRENI RICCARDO');
INSERT INTO `mail` VALUES ('4725', '2', 'pinzutil@libero.it', 'PINZUTI LAURA');
INSERT INTO `mail` VALUES ('4726', '2', 'ceceviola@virgilio.it', 'SALVADORI VIOLA');
INSERT INTO `mail` VALUES ('4727', '2', 'giusiba@gmail.com', 'BADIA GIUSI');
INSERT INTO `mail` VALUES ('4728', '2', 'ariex83@yahoo.it', 'LEONI FRANCESCA');
INSERT INTO `mail` VALUES ('4729', '2', 'hi.anna.niewczas@gmail.com', 'NIEWCZAS ANNA');
INSERT INTO `mail` VALUES ('4730', '2', 'matteo_dandrea@libero.it', 'DANDREA MATTEO');
INSERT INTO `mail` VALUES ('4839', '2', 'maurizio.melzi@finital.it', 'MELZI MAURIZIO');
INSERT INTO `mail` VALUES ('4890', '2', 'manu.sbarde@libero.it', 'SBARDELLATI MANUELA');
INSERT INTO `mail` VALUES ('4891', '2', 'mluisaromanelli@yahoo.it', 'ROMANELLI MARIA LUISA');
INSERT INTO `mail` VALUES ('4892', '2', 'marinaboschi@me.com', 'BOSCHI MARINA');
INSERT INTO `mail` VALUES ('4893', '2', 'fra.ste88@yahoo.it', 'MATINI STEFANO');
INSERT INTO `mail` VALUES ('4894', '2', 'valentinabenina@gmail.com', 'BENINI VALENTINA');
INSERT INTO `mail` VALUES ('4895', '2', 'vamp.ivana@libero.it', 'ALI DANIELE');
INSERT INTO `mail` VALUES ('4896', '2', 'giobiz@katamail.com', 'BIZZELLI GIOVANNI');
INSERT INTO `mail` VALUES ('4897', '2', 'p.arcangioli@studioarcangioli.it', 'ARCANGIOLI PIERANGELO');
INSERT INTO `mail` VALUES ('4930', '2', 'monia.battagliam@libero.it', 'BATTAGLIA MONIA');
INSERT INTO `mail` VALUES ('4931', '2', 'markus1985@live.it', 'GRAMAZIO MARCO');
INSERT INTO `mail` VALUES ('4932', '2', 'ciavattinifrancesca@hotmail.it', 'CIAVATTINI FRANCESCA');
INSERT INTO `mail` VALUES ('4933', '2', 'mimmoaurilio@gmail.com', 'AURILIO DOMENICO');
INSERT INTO `mail` VALUES ('4934', '2', 'amilcara@tiscali.it', 'AVOLI AMILCARA');
INSERT INTO `mail` VALUES ('4935', '2', 'c.ventrone@tiscali.it', 'VENTRONE CARMEN');
INSERT INTO `mail` VALUES ('4936', '2', 'daniele.menale@hotmail.it', 'MENALE DANIELE');
INSERT INTO `mail` VALUES ('4937', '2', 'nunzia.scialpi@libero.it', 'SCIALPI NUNZIA');
INSERT INTO `mail` VALUES ('4938', '2', 'fantimarta@vodafone.it', 'FANTI MARTA');
INSERT INTO `mail` VALUES ('4939', '2', 'conti.pierangela@yahoo.it', 'CONTI PIERANGELA');
INSERT INTO `mail` VALUES ('4961', '2', 'novella.onofri@nextspa.com', 'ONOFRI NOVELLA');
INSERT INTO `mail` VALUES ('5017', '2', 'daniela.mariani@telecomitalia.it', 'MARIANI DANIELA');
INSERT INTO `mail` VALUES ('5051', '2', 'serenaarri@libero.it', 'ARRIGUCCI SERENA');
INSERT INTO `mail` VALUES ('5052', '2', 'francine_bartoli@yahoo.it', 'BARTOLI FRANCINE');
INSERT INTO `mail` VALUES ('5053', '2', 'darittienrico@hotmail.it', 'DARITTI ENRICO');
INSERT INTO `mail` VALUES ('5054', '2', 'igor.giusta@gmail.com', 'GIUSTARINI IGOR');
INSERT INTO `mail` VALUES ('5055', '2', 'matteolandi@hotmail.com', 'LANDI MATTEO');
INSERT INTO `mail` VALUES ('5056', '2', 'monica@isoladelgiglio.net', 'BANCALA MONICA');
INSERT INTO `mail` VALUES ('5057', '2', 'ercolani.sabrina@alice.it', 'ERCOLANI SABRINA');
INSERT INTO `mail` VALUES ('5058', '2', 'elebellucci@gmail.com', 'BELLUCCI ELENA');
INSERT INTO `mail` VALUES ('5059', '2', 'elenasolare79@live.it', 'PREZIOSI ELENA');
INSERT INTO `mail` VALUES ('5060', '2', 'antoniogalluccio75@yahoo.it', 'GALLUCCIO ANTONIO');
INSERT INTO `mail` VALUES ('5061', '2', 'clemefra@live.it', 'CLEMENTINI FRANCESCO');
INSERT INTO `mail` VALUES ('5062', '2', 'ileniain@gmail.com', 'INDIATI ILENIA');
INSERT INTO `mail` VALUES ('5063', '2', 'lippichiara@libero.it', 'LIPPI CHIARA');
INSERT INTO `mail` VALUES ('5087', '2', 'ajmmail@tin.it', 'QUINTA STAGIONE S.r.l. a socio unico');
INSERT INTO `mail` VALUES ('5114', '2', 'laurahp@hotmail.it', 'CROCI LAURA');
INSERT INTO `mail` VALUES ('5115', '2', 'atorklabrusco@yahoo.it', 'LA BRUSCO ATORK NARIA GIOVANNA');
INSERT INTO `mail` VALUES ('5219', '2', 'manu.birba@hotmail.it', 'BURBI MANUELA');
INSERT INTO `mail` VALUES ('5220', '2', 'alessandrosantovito@libero.it', 'SANTOVITO ALESSANDRO');
INSERT INTO `mail` VALUES ('5221', '2', 'sadasats@gmail.com', 'KHALSA SADA SAT');
INSERT INTO `mail` VALUES ('5222', '2', 'mazzonipaola@hotmail.com', 'MAZZONI PAOLA');
INSERT INTO `mail` VALUES ('5223', '2', 'mariagrazia_divirgilio@yahoo.it', 'DI VIRGILIO MARIA GRAZIA');
INSERT INTO `mail` VALUES ('5224', '2', 'piti46@inwind.it', 'PITEO MARCELLO');
INSERT INTO `mail` VALUES ('5225', '2', 'nicolamasci@hotmail.it', 'GALEAZZI NICOLA');
INSERT INTO `mail` VALUES ('5226', '2', 'annamariatraetta@gmail.com', 'TRAETTA ANNAMARIA');
INSERT INTO `mail` VALUES ('5239', '2', 's.cucini@libero.it', 'CUCINI SILVIA');
INSERT INTO `mail` VALUES ('5240', '2', 'sabrina.far@hotmail.it', 'FARSETTI SABRINA');
INSERT INTO `mail` VALUES ('5292', '2', 'alessandroandr@hotmail.it', 'ANDREUCCI ALESSANDRO');
INSERT INTO `mail` VALUES ('5293', '2', 'info.condominio@katamail.com', 'ANDREOLI MARZIA');
INSERT INTO `mail` VALUES ('5294', '2', 'maxfico@inwind.it', 'TIMPANARO MASSIMILIANO');
INSERT INTO `mail` VALUES ('5295', '2', 'chiararotellini@gmail.com', 'ROTELLINI CHIARA');
INSERT INTO `mail` VALUES ('5296', '2', 'claudio.merlini@hotmail.it', 'MERLINI CLAUDIO');
INSERT INTO `mail` VALUES ('5329', '2', 'elenagiannettoni@live.it', 'GIANNETTONI ELENA');
INSERT INTO `mail` VALUES ('5386', '2', 'francesca@teleradiocentrale.it', 'SANTINI FRANCESCA');
INSERT INTO `mail` VALUES ('5387', '2', 'alefratini@hotmail.it', 'FRATINI ALESSANDRA');
INSERT INTO `mail` VALUES ('5388', '2', 'guazzini@unisi.it', 'GUAZZINI FEDERICA');
INSERT INTO `mail` VALUES ('5389', '2', 'riccigiacomomaria@gmail.com', 'RICCI GIACOMO MARIA');
INSERT INTO `mail` VALUES ('5390', '2', 'moma_mokana@hotmail.it', 'BASAGNI MONICA');
INSERT INTO `mail` VALUES ('5391', '2', 'barbaravinerbi@gmail.com', 'VINERBI BARBARA');
INSERT INTO `mail` VALUES ('5392', '2', 'lialabasagni@confcommercio.ar.it', 'BASAGNI LIALA');
INSERT INTO `mail` VALUES ('5399', '2', 'marinapaoletti@yahoo.it', 'PAOLETTI MARINA');
INSERT INTO `mail` VALUES ('5415', '2', 'valentinavolpi2@gmail.com', 'VOLPI VALENTINA');
INSERT INTO `mail` VALUES ('5416', '2', 'edi_gentilini@icloud.com', 'GENTILI EDI');
INSERT INTO `mail` VALUES ('5454', '2', 'barbara.bennati@virgilio.it', 'BENNATI BARBARA');
INSERT INTO `mail` VALUES ('5455', '2', 'gennaro_alfieri@gmail.it', 'TAVALLO GIULIANA');
INSERT INTO `mail` VALUES ('5459', '2', 'paola81@aruba.it', 'IACAPRARO PAOLA');
INSERT INTO `mail` VALUES ('5460', '2', 'alkorta@libero.it', 'MELILLO ANTONIO');
INSERT INTO `mail` VALUES ('5461', '2', 'juliano.cesar.ferreira@usp.br', 'FERREIRA JULIANO CESAR');
INSERT INTO `mail` VALUES ('5462', '2', 'leonardo.stampa@yahoo.it', 'STAMPA LEONARDO');
INSERT INTO `mail` VALUES ('5466', '2', 'becksr2007@libero.it', 'ROSSI SIMONE');
INSERT INTO `mail` VALUES ('5471', '2', 'barocciaio@gmail.com', 'LAZZERONI MICHELE');
INSERT INTO `mail` VALUES ('5472', '2', 'candiveronica@hotmail.it', 'CANDI VERONICA');
INSERT INTO `mail` VALUES ('5505', '2', 'lucya77gr@yahoo.it', 'GOLINI LUCIA');
INSERT INTO `mail` VALUES ('5506', '2', 'jade87@virgilio.it', 'COPPI GIADA');
INSERT INTO `mail` VALUES ('5507', '2', 'biofanna@gmail.com', 'FALCO ANNA');
INSERT INTO `mail` VALUES ('5515', '2', 'giulia.trappoloni@libero.it', 'TRAPPOLONI GIULIA');
INSERT INTO `mail` VALUES ('5517', '2', 'jajda85@gmail.com', 'MILOEVA ANDONOVA MANUELA');
INSERT INTO `mail` VALUES ('5520', '2', 'sarapunto@tiscali.it', 'BETTI SARA');
INSERT INTO `mail` VALUES ('5559', '2', 'sasa.oltremare@hotmail.it', 'PERUGINI SABRINA');
INSERT INTO `mail` VALUES ('5560', '2', 'f.belle@filprato.it', 'BELLE FRANCESCA');
INSERT INTO `mail` VALUES ('5575', '2', 'elisabetta.tosi@hotmail.it', 'TOSI ELISABETTA');
INSERT INTO `mail` VALUES ('5576', '2', 'susizup@gmail.com', 'CIACCI SUSANNA');
INSERT INTO `mail` VALUES ('5577', '2', 'moripatrizia@hotmail.it', 'MORI PATRIZIA');
INSERT INTO `mail` VALUES ('5579', '2', 'zeffirino_13@hotmail.it', 'ZEFFIRI FRANCESCO');
INSERT INTO `mail` VALUES ('5580', '2', 'giuliotiezzi@gmail.com', 'TIEZZI GIULIO');
INSERT INTO `mail` VALUES ('5594', '2', 'p.pacenti@gmail.com', 'PACENTI PAOLA');
INSERT INTO `mail` VALUES ('5595', '2', 'luciafacchielli@yahoo.it', 'FACCHIELLI LUCIA');
INSERT INTO `mail` VALUES ('5596', '2', 'marianovella.p@alice.it', 'PEPE MARIA NOVELLA');
INSERT INTO `mail` VALUES ('5597', '2', 'valentina.fiorenzoni@gmail.com', 'SERAFINI VALENTINA');
INSERT INTO `mail` VALUES ('5598', '2', 'sara.salvadori74@gmail.com', 'SALVADORI SARA');
INSERT INTO `mail` VALUES ('5599', '2', 'sarapierazzi@hotmail.it', 'PIERAZZI SARA');
INSERT INTO `mail` VALUES ('5624', '2', 'blertaereqi@hotmail.com', 'BLERTA EREQI');
INSERT INTO `mail` VALUES ('5626', '2', 'maiorello.catia@gmail.com', 'MAIORELLO CATIA');
INSERT INTO `mail` VALUES ('5633', '2', 'troiano.marco81@gmail.com', 'TROIANO MARCO');
INSERT INTO `mail` VALUES ('5646', '2', 'giuliamencucci@hotmail.it', 'MENCUCCI GIULIA');
INSERT INTO `mail` VALUES ('5647', '2', 'lindabirolo@libero.it', 'BIROLO LINDA');
INSERT INTO `mail` VALUES ('5648', '2', 'cleme_83@libero.it', 'FORNASARI CLEMENTINA');
INSERT INTO `mail` VALUES ('5649', '2', 'mila.massi@simsitaly.it', 'MASSI MILA');
INSERT INTO `mail` VALUES ('5650', '2', 'elettra.abatucci@hotmail.it', 'ABATUCCI ELETTRA');
INSERT INTO `mail` VALUES ('5654', '2', 'frandalf@libero.it', 'SERGIO FRANCESCA');
INSERT INTO `mail` VALUES ('5655', '2', 'tarnatrade@yahoo.it', 'TARNA BACOSCA DANIEL');
INSERT INTO `mail` VALUES ('5656', '2', 'a.signorini@gmail.com', 'SIGNORINI ANNA');
INSERT INTO `mail` VALUES ('5667', '2', 'ricky.vignali@virgilio.it', 'VIGNALI RICCARDO');
INSERT INTO `mail` VALUES ('5681', '2', 'merion81@libero.it', 'FRANCO MARIA');
INSERT INTO `mail` VALUES ('5682', '2', 'debora_71_2013@libero.it', 'DAMICO DEBORA');
INSERT INTO `mail` VALUES ('5683', '2', 'albertoragnini@gmail.com', 'RAGNINI ALBERTO');
INSERT INTO `mail` VALUES ('5684', '2', 'bar.movida@yahoo.it', 'TASSI NICOLA');
INSERT INTO `mail` VALUES ('5685', '2', 'sonni.massimo@libero.it', 'SONNI MASSIMO');
INSERT INTO `mail` VALUES ('5686', '2', 'silvianutini12@gmail.com', 'NUTINI SILVIA');
INSERT INTO `mail` VALUES ('5687', '2', 'stefanoalbini@ymail.com', 'ALBINI STEFANO');
INSERT INTO `mail` VALUES ('5688', '2', 'monicaduccini@hotmail.it', 'DUCCINI MONICA');
INSERT INTO `mail` VALUES ('5689', '2', 'dilebenci89@gmail.com', 'BENCIVENNI DILETTA');
INSERT INTO `mail` VALUES ('5690', '2', 'info@liberiamoci.it', 'FERIPPI VALENTINA');
INSERT INTO `mail` VALUES ('5691', '2', 'laurtava@hotmail.com', 'TAVANTI LAURA');
INSERT INTO `mail` VALUES ('5692', '2', 'alex_ferroni@live.it', 'FERRONI ALESSANDRO');
INSERT INTO `mail` VALUES ('5693', '2', 'robertamerlino@virgilio.it', 'MERLINO ROBERTA');
INSERT INTO `mail` VALUES ('5694', '2', 'patriziapaolini1950@gmail.com', 'PAOLINI PATRIZIA');
INSERT INTO `mail` VALUES ('5695', '2', 'stella1425@hotmail.it', 'RINALDO MARINA');
INSERT INTO `mail` VALUES ('5715', '2', 'elenafanani@hotmail.it', 'FANANI ELENA');
INSERT INTO `mail` VALUES ('5716', '2', 'luca-rigoni@virgilio.it', 'RIGONI LUCA');
INSERT INTO `mail` VALUES ('5743', '2', 'mauramariani@mauramariani.it', 'MARIANI MAURA');
INSERT INTO `mail` VALUES ('5747', '2', 'giardinoricco@gmail.com', 'MAZZANTI FERDERICA');
INSERT INTO `mail` VALUES ('5758', '2', 'francescagrassi@yahoo.it', 'GRASSI FRANCESCA');
INSERT INTO `mail` VALUES ('5759', '2', 'stefaniavanni@me.com', 'VANNI STEFANIA');
INSERT INTO `mail` VALUES ('5792', '2', 'lucia.morucci@gmail.com', 'MORUCCI LUCIA');
INSERT INTO `mail` VALUES ('5793', '2', 'luigia_rinelli@alice.it', 'RINELLI LUIGIA');
INSERT INTO `mail` VALUES ('5794', '2', 'erica.dilda@gmail.com', 'DILDA ERICA');
INSERT INTO `mail` VALUES ('5820', '2', 'vannicelli.giuseppe@gmail.com', 'VANNICELLI GIUSEPPE');
INSERT INTO `mail` VALUES ('5825', '2', 'info@palazzomarzocchi.com', 'MARZOCCHI DONATELLA');
INSERT INTO `mail` VALUES ('5826', '2', 'luisellaorsini@libero.it', 'ORSINI LUISELLA');
INSERT INTO `mail` VALUES ('5827', '2', 'lilianamasieri@hotmail.com', 'MASIERI LILIANA');
INSERT INTO `mail` VALUES ('5828', '2', 'dominati@live.it', 'DOMINATI CARLOTTA');
INSERT INTO `mail` VALUES ('5829', '2', 'naldi.massimiliano@gmail.com', 'NALDI MASSIMILIANO');
INSERT INTO `mail` VALUES ('5830', '2', 'melissa.verdelli@hotmail.it', 'VERDELLI MELISSA');
INSERT INTO `mail` VALUES ('5831', '2', 'marialuisa.lilli@yahoo.it', 'CECCHERINI MARIA LUISA');
INSERT INTO `mail` VALUES ('5856', '2', 'alex.saitta1969@tiscali.it', 'SAITTA ALESSANDRO');
INSERT INTO `mail` VALUES ('5892', '2', 'antonella_violante@libero.it', 'VIOLANTE ANTONELLA');
INSERT INTO `mail` VALUES ('5893', '2', 'paola.agostino89@libero.com', 'DAGOSTINO PAOLA');
INSERT INTO `mail` VALUES ('5894', '2', 'asalvadori071963@libero.it', 'SALVADORI ALESSANDRA');
INSERT INTO `mail` VALUES ('5937', '2', 'beacam76@libero.it', 'CAMILLI BEATRICE');
INSERT INTO `mail` VALUES ('5938', '2', 'madi-madi@alice.it', 'BARTOLINI MARIA GRAZIA');
INSERT INTO `mail` VALUES ('5939', '2', 'fnandapaula@hotmail.com', 'FERNANDA GOMES DE PAULA');
INSERT INTO `mail` VALUES ('5940', '2', 'betelgeuse75@libero.it', 'DE ANGELIS BARBARA');
INSERT INTO `mail` VALUES ('5941', '2', 'caterina.campo@email.it', 'CAMPO CATERINA');
INSERT INTO `mail` VALUES ('5947', '2', 'pietrocavaliere@libero.it', 'CAVALIERE PIETRO');
INSERT INTO `mail` VALUES ('5948', '2', 'sissi.sitra@gmail.com', 'ROSSI SILVIA');
INSERT INTO `mail` VALUES ('5997', '2', 'mar30.marketing@gmail.com', 'TRENTA MARINA');
INSERT INTO `mail` VALUES ('6005', '2', 'francescatenti@yahoo.com', 'TENTI FRANCESCA');
INSERT INTO `mail` VALUES ('6010', '2', 'antonio.brizzi@gmail.com', 'BRIZZI ANTONIO');
INSERT INTO `mail` VALUES ('6026', '2', 'sosa.mcecilia@gmail.com', 'SOSA MARIA CECILIA');
INSERT INTO `mail` VALUES ('6167', '2', 'chiaragabbolini@hotmail.com', 'GABBOLINI CHIARA');
INSERT INTO `mail` VALUES ('6206', '2', 'rosi.uguzzoni@live.it', 'UGUZZONI ROSALIA');
INSERT INTO `mail` VALUES ('6207', '2', 'nenny19@live.it', 'HASSAN JENNIFER');
INSERT INTO `mail` VALUES ('6208', '2', 'boanda@libero.it', 'NORCINI MARIA GRAZIA');
INSERT INTO `mail` VALUES ('6209', '2', 'giovanna.pistelli@gmail.com', 'PISTELLI GIOVANNA');
INSERT INTO `mail` VALUES ('6210', '2', 'maida.salusti@telecomitalia.it', 'SALUSTI MAIDA');
INSERT INTO `mail` VALUES ('6211', '2', 'chiara.andreini@hotmail.it', 'ANDREINI CHIARA');
INSERT INTO `mail` VALUES ('6212', '2', 'saruccia1978@alice.it', 'ANTONI SARA');
INSERT INTO `mail` VALUES ('6213', '2', 'maria.valvano@libero.it', 'VALVANO MARIA');
INSERT INTO `mail` VALUES ('6214', '2', 'alessandro.anglani@yahoo.it', 'ANGLANI ALESSANDRO');
INSERT INTO `mail` VALUES ('6215', '2', 'superpresi@gmail.com', 'GIULIANI MARCO');
INSERT INTO `mail` VALUES ('6216', '2', 'ornella02@gmail.com', 'BAZZECHI ORNELLA');
INSERT INTO `mail` VALUES ('6217', '2', 'mammalela76@yahoo.it', 'NAVARRINI EMANUELA');
INSERT INTO `mail` VALUES ('6218', '2', 'laurettagrada@gmail.com', 'GRADASSI LAURA');
INSERT INTO `mail` VALUES ('6219', '2', 'dbresciani74@hotmail.it', 'BRESCIANI DEBORA');
INSERT INTO `mail` VALUES ('6220', '2', 'simona.penza@gmail.com', 'PENZA SIMONA');
INSERT INTO `mail` VALUES ('6221', '2', 'aricceri@artex.firenze.it', 'RICCERI ALESSANDRO');
INSERT INTO `mail` VALUES ('6222', '2', 'arianna.deldotto@virgilio.it', 'DEL DOTTO ARIANNA');
INSERT INTO `mail` VALUES ('6226', '2', 'giordanadicarlo@virgilio.it', 'DI CARLO GIORDANA');
INSERT INTO `mail` VALUES ('6227', '2', 'info@absystem2000.it ', ' info@toscanabarcode.com');
INSERT INTO `mail` VALUES ('6268', '2', 'emanuela.lembo@libero.it', 'LEMBO EMANUELA');
INSERT INTO `mail` VALUES ('6285', '2', 'annalisa.angeli@yahoo.it', 'ANGELI ANNALISA');
INSERT INTO `mail` VALUES ('6286', '2', 'francescovolapiacenza@virgilio.it', 'VOLA FRANCESCO');
INSERT INTO `mail` VALUES ('6308', '2', 'grazia.donati@yahoo.it', 'DONATI MARIA GRAZIA');
INSERT INTO `mail` VALUES ('6309', '2', 'pista1412@alice.it', 'SANTINON EMANUELA');
INSERT INTO `mail` VALUES ('6310', '2', 'silviaredditi@hotmail.com', 'REDDITI SILVIA');
INSERT INTO `mail` VALUES ('6348', '2', 'pepito66@hotmail.com', 'MUSA OSMAN');
INSERT INTO `mail` VALUES ('6373', '2', 'rossella.chiaroni@alice.it', 'CHIARONI ROSSELLA');
INSERT INTO `mail` VALUES ('6379', '2', 'denimi@alice.it', 'DE NIGRIS MICHELE');
INSERT INTO `mail` VALUES ('6434', '2', 'fabianamirabilio@libero.it', 'MIRABILIO FABIANA');
INSERT INTO `mail` VALUES ('6453', '2', 'stefania.lombardelli@alice.it', 'LOMBARDELLI STEFANIA');
INSERT INTO `mail` VALUES ('6454', '2', 'maria.rosaria.curcio@alice.it', 'CUCRCIO MARIA ROSARIA');
INSERT INTO `mail` VALUES ('6455', '2', 'carlo.bernini1@mps.it', 'BERNINI CARLO');
INSERT INTO `mail` VALUES ('6456', '2', 'ltanzini@eng.it', 'TANZINI LUCIA');
INSERT INTO `mail` VALUES ('6457', '2', 'gianlucavalori@yahoo.it', 'VALORI GIANLUCA');
INSERT INTO `mail` VALUES ('6458', '2', 'francesco.ferrari83@hotmail.it', 'FERRARI FRANCESCO');
INSERT INTO `mail` VALUES ('6459', '2', 'info@pietratonda.com', 'CIPRIANI CHIARA');
INSERT INTO `mail` VALUES ('6460', '2', 'alessandra.tognozzi@alice.it', 'TOGNOZZI ALESSANDRA');
INSERT INTO `mail` VALUES ('6461', '2', 'fralifecafe@gmail.com', 'MALINVERNO FRANCESCO');
INSERT INTO `mail` VALUES ('6462', '2', 'vannaangiolini@gmail.com', 'ANGIOLINI VANNA');
INSERT INTO `mail` VALUES ('6463', '2', 'antoniettapuccinelli@libero.it', 'PUCCINELLI ANTONIETTA');
INSERT INTO `mail` VALUES ('6464', '2', 'g.dainese@madestudiolegale.it', 'DAINESE GIOVANNA');
INSERT INTO `mail` VALUES ('6465', '2', 'stefaniamontinaro70@gmail.com', 'MONTINARO STEFANIA');
INSERT INTO `mail` VALUES ('6466', '2', 'h.dayris@yahoo.it', 'HERNANDEZ DAYRIS');
INSERT INTO `mail` VALUES ('6467', '2', 'robertasardelli@libero.it', 'SARDELLI ROBERTA');
INSERT INTO `mail` VALUES ('6468', '2', 'micutilinda@yahoo.it', 'MORINOIV ELENA LOREDANA');
INSERT INTO `mail` VALUES ('6469', '2', 'annalisa.cancellieri@alice.it', 'CANCELLIERI ANNALISA');
INSERT INTO `mail` VALUES ('6470', '2', 'martini_immobiliare@virgilio.it', 'MARTINI SIMONE');
INSERT INTO `mail` VALUES ('6471', '2', 'armandaaa@libero.it', 'MENIN ARMANDA');
INSERT INTO `mail` VALUES ('6472', '2', 'francesco.atzeni@gmail.com', 'ATZENI FRANCESCO');
INSERT INTO `mail` VALUES ('6473', '2', 'alessiafcantieri@alice.it', 'CANTIERI ALESSIA FRANCA');
INSERT INTO `mail` VALUES ('6474', '2', 'sabrizap.arte@hotmail.it', 'ZAPPALA SABRINA');
INSERT INTO `mail` VALUES ('6475', '2', 'jasmine.induni.92@gmail.com', 'INDUNI JASMINE');
INSERT INTO `mail` VALUES ('6476', '2', 'onlyelena@hotmail.it', 'GRILLO ELENA');
INSERT INTO `mail` VALUES ('6477', '2', 'enricotonelli2013@gmail.com', 'TONELLI ENRICO');
INSERT INTO `mail` VALUES ('6478', '2', 'g.ghioni@dolmen.it', 'GHIONI GERARDO');
INSERT INTO `mail` VALUES ('6479', '2', 'silvia.torrini@inwind.it', 'TORRINI SILVIA');
INSERT INTO `mail` VALUES ('6480', '2', 'm.nardi@pcbox.it', 'NARDI MARIOLINA');
INSERT INTO `mail` VALUES ('6481', '2', 'luciavecoli55@gmail.com', 'VECOLI LUCIA');
INSERT INTO `mail` VALUES ('6482', '2', 'guazzini.francesco@gmail.com', 'GUAZZINI FRANCESCO');
INSERT INTO `mail` VALUES ('6483', '2', 'dangelofran@virgilio.it', 'DANGELO FRANCESCO');
INSERT INTO `mail` VALUES ('6484', '2', 'antonellasaletti@libero.it', 'SALETTI ANTONELLA');
INSERT INTO `mail` VALUES ('6485', '2', 'jamm312@gmail.com', 'PAPPALARDO GIANMARCO');
INSERT INTO `mail` VALUES ('6486', '2', 'sonilamara@yahoo.com', 'MARAJ SONILA');
INSERT INTO `mail` VALUES ('6487', '2', 'antovit@hotmail.it', 'VITULLO ANTONELLA');
INSERT INTO `mail` VALUES ('6488', '2', 'antoniamannina@gmail.com', 'MANNINA ANTONIA');
INSERT INTO `mail` VALUES ('6489', '2', 'sonia.maggi@clicsi.net', 'MAGGI SONIA');
INSERT INTO `mail` VALUES ('6490', '2', 'lordmmg@live.com', 'MICHILE GEORGE MADALI');
INSERT INTO `mail` VALUES ('6491', '2', 'setaro.f@libero.it', 'SETARO FERNANDA');
INSERT INTO `mail` VALUES ('6492', '2', 'jeanlucort@hotmail.com', 'CORTOPASSI GIANLUCA');
INSERT INTO `mail` VALUES ('6493', '2', 'laura.bertuccelli@inwind.it', 'BERTUCCELLI LAURA');
INSERT INTO `mail` VALUES ('6494', '2', 'stefia2000@hotmail.it', 'DE LUCA STEFANIA');
INSERT INTO `mail` VALUES ('6495', '2', 'aleandro.pescia@libero.it', 'PESCIA ALESSANDRO');
INSERT INTO `mail` VALUES ('6496', '2', 'gianni.porciani@gmail.com', 'PORCIANI GIANNI');
INSERT INTO `mail` VALUES ('6497', '2', 'faumazze@alice.it', 'ASTI CRISTINA');
INSERT INTO `mail` VALUES ('6498', '2', 'maricasimo@libero.it', 'SIMONELLI MARICA');
INSERT INTO `mail` VALUES ('6499', '2', 'marcozzi@hotmail.com', 'FANTOZZI MARCO');
INSERT INTO `mail` VALUES ('6500', '2', 'lapo.querci@gmail.com', 'QUERCI LAPO');
INSERT INTO `mail` VALUES ('6501', '2', 'edoardo.lembo@gmail.com', 'LEMBO EDOARDO');
INSERT INTO `mail` VALUES ('6502', '2', 'giuli_87@hotmail.it', 'GOBBI GIULIA');
INSERT INTO `mail` VALUES ('6503', '2', 'claudio@ghericostruzioni.it', 'GHERI CLAUDIO');
INSERT INTO `mail` VALUES ('6504', '2', 'rosanna.fantini@virgiolio.it', 'FANTINI ROSANNA');
INSERT INTO `mail` VALUES ('6505', '2', 'marcoromualdi90@gmail.com', 'ROMUALDI MARCO');
INSERT INTO `mail` VALUES ('6506', '2', 'tognazzi@museisenesi.org', 'TOGNAZZI ANTONELLA');
INSERT INTO `mail` VALUES ('6507', '2', 'luisa.lapucci@libero.it', 'LAPUCCI LUISA');
INSERT INTO `mail` VALUES ('6508', '2', 'annsofiazanda@gmail.com', 'ZANDA ANN SOFIA');
INSERT INTO `mail` VALUES ('6509', '2', 'bucalossi.ginevra@gmail.com', 'BUCALOSSI GINEVRA');
INSERT INTO `mail` VALUES ('6510', '2', 'giulia.gambineri@gmail.com', 'GAMBINERI GIULIA');
INSERT INTO `mail` VALUES ('6511', '2', 'gabriele.birelli@alice.it', 'BIRELLI GABRIELE');
INSERT INTO `mail` VALUES ('6512', '2', 'a.delcorona@gmail.com', 'DEL CORONA ANDREA');
INSERT INTO `mail` VALUES ('6513', '2', 'lorenz-poltri@hotmail.it', 'POLTRI LORENZO');
INSERT INTO `mail` VALUES ('6514', '2', 'beppet76@tiscali.it', 'TRAVERSA GIUSEPPE');
INSERT INTO `mail` VALUES ('6515', '2', 'geom.agonigi@gmail.com', 'AGONIGI FABIO');
INSERT INTO `mail` VALUES ('6516', '2', 'foxyseta@hotmail.com', 'VOLPE MICHELA');
INSERT INTO `mail` VALUES ('6517', '2', 'nicoletta.niccolai@alice.it', 'NICCOLAI NICOLETTA');
INSERT INTO `mail` VALUES ('6518', '2', 'gemma.martini@alice.it', 'MARTINI GEMMA');
INSERT INTO `mail` VALUES ('6519', '2', 'niccolo.romano75@gmail.com', 'ROMANO NICCOLO');
INSERT INTO `mail` VALUES ('6520', '2', 'conchita.zappulla@libero.it', 'ZAPPULLA CONCHITA');
INSERT INTO `mail` VALUES ('6521', '2', 'gianlucadelgrande@gmail.com', 'DEL GRANDE GIANLUCA');
INSERT INTO `mail` VALUES ('6522', '2', 's.tocchini@studiobandecca.it', 'TOCCHINI STEFANO');
INSERT INTO `mail` VALUES ('6523', '2', 'easycasacentro@gmail.com', 'SOLDAINI ELISABETTA');
INSERT INTO `mail` VALUES ('6524', '2', 'belluccini@gmail.com', 'BELLUCCINI FABIO');
INSERT INTO `mail` VALUES ('6525', '2', 'gatti.tami@gmail.com', 'GATTI TAMARA');
INSERT INTO `mail` VALUES ('6526', '2', 'feffasechi@gmail.com', 'SECHI DONATELLA');
INSERT INTO `mail` VALUES ('6527', '2', 'em.carassiti@virgilio.it', 'CARASSITI EMANUELA');
INSERT INTO `mail` VALUES ('6528', '2', 'info@liveranisport.it', 'TAMBRESONI ALIMATA');
INSERT INTO `mail` VALUES ('6529', '2', 'michela.lucherini@gmail.com', 'LUCHERINI MICHELA');
INSERT INTO `mail` VALUES ('6530', '2', 'simone.del.magro@gmail.com', 'DEL MAGRO SIMONE');
INSERT INTO `mail` VALUES ('6531', '2', 'astevanessa@libero.it', 'ASTE VANESSA');
INSERT INTO `mail` VALUES ('6532', '2', 'tania.gsv@gmail.com', 'GUSEVA TANIA');
INSERT INTO `mail` VALUES ('6533', '2', 'lisa.stagi@virgilio.it', 'STAGI LISA');
INSERT INTO `mail` VALUES ('6534', '2', 'spina.silvia@hotmail.it', 'SPINA SILVIA');
INSERT INTO `mail` VALUES ('6535', '2', 'b.binazzi@tin.it', 'BINAZZI BENEDETTA');
INSERT INTO `mail` VALUES ('6536', '2', 'lucillafaver@yahoo.it', 'FAVER LUCILLA');
INSERT INTO `mail` VALUES ('6537', '2', 'chifenti87@gmail.com', 'CHIFENTI ANDREA');
INSERT INTO `mail` VALUES ('6538', '2', 'ti.cento@yahoo.it', 'CENTOMANI TIZIANA');
INSERT INTO `mail` VALUES ('6539', '2', 'stefano-magnani@libero.it', 'MAGNANI STEFANO');
INSERT INTO `mail` VALUES ('6540', '2', 'letizia.rinaldi@tiscali.it', 'RINALDI LETIZIA');
INSERT INTO `mail` VALUES ('6541', '2', 'peva2013@yahoo.com', 'EVANGELISTA PAOLO');
INSERT INTO `mail` VALUES ('6542', '2', 'mario-nasti@virgilio.it', 'NASTI MARIO');
INSERT INTO `mail` VALUES ('6543', '2', 'floriano@studiobenefortiemarchi.it', 'MARCHI FLORIANO');
INSERT INTO `mail` VALUES ('6544', '1', 'simone.bagnolesi@gmail.com', 'bagnolesi simone');
INSERT INTO `mail` VALUES ('6545', '1', 'jacopo.frediani@gmail.com', 'frediani jacopo');

-- ----------------------------
-- Table structure for `mail_group`
-- ----------------------------
DROP TABLE IF EXISTS `mail_group`;
CREATE TABLE `mail_group` (
  `idMailGroup` int(11) NOT NULL AUTO_INCREMENT,
  `txMailGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMailGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_group
-- ----------------------------
INSERT INTO `mail_group` VALUES ('1', 'Online');
INSERT INTO `mail_group` VALUES ('2', 'Altri');
INSERT INTO `mail_group` VALUES ('3', 'Siena');
INSERT INTO `mail_group` VALUES ('4', 'Arezzo');
INSERT INTO `mail_group` VALUES ('5', 'Lucca');
INSERT INTO `mail_group` VALUES ('6', 'Follonica');
INSERT INTO `mail_group` VALUES ('7', 'Castiglione della Pescaia');

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `idMaterial` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txMaterial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', 'en', 'COTTON');
INSERT INTO `material` VALUES ('1', 'it', 'COTONE');
INSERT INTO `material` VALUES ('2', 'en', 'SILK');
INSERT INTO `material` VALUES ('2', 'it', 'SETA');
INSERT INTO `material` VALUES ('3', 'en', 'WOOL');
INSERT INTO `material` VALUES ('3', 'it', 'LANA');
INSERT INTO `material` VALUES ('4', 'en', 'LEATHER');
INSERT INTO `material` VALUES ('4', 'it', 'PELLE');
INSERT INTO `material` VALUES ('5', 'en', 'NEOPRENE');
INSERT INTO `material` VALUES ('5', 'it', 'NEOPRENE');

-- ----------------------------
-- Table structure for `nazioni`
-- ----------------------------
DROP TABLE IF EXISTS `nazioni`;
CREATE TABLE `nazioni` (
  `idNazione` varchar(100) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  PRIMARY KEY (`idNazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nazioni
-- ----------------------------
INSERT INTO `nazioni` VALUES ('Afghanistan', 'en');
INSERT INTO `nazioni` VALUES ('Albania', 'en');
INSERT INTO `nazioni` VALUES ('Algeria', 'en');
INSERT INTO `nazioni` VALUES ('American Samoa', 'en');
INSERT INTO `nazioni` VALUES ('Andorra', 'en');
INSERT INTO `nazioni` VALUES ('Angola', 'en');
INSERT INTO `nazioni` VALUES ('Anguilla', 'en');
INSERT INTO `nazioni` VALUES ('Antigua and Barbuda', 'en');
INSERT INTO `nazioni` VALUES ('Argentina', 'en');
INSERT INTO `nazioni` VALUES ('Armenia', 'en');
INSERT INTO `nazioni` VALUES ('Aruba', 'en');
INSERT INTO `nazioni` VALUES ('Australia', 'en');
INSERT INTO `nazioni` VALUES ('Austria', 'en');
INSERT INTO `nazioni` VALUES ('Azerbaijan', 'en');
INSERT INTO `nazioni` VALUES ('Bahamas', 'en');
INSERT INTO `nazioni` VALUES ('Bahrain', 'en');
INSERT INTO `nazioni` VALUES ('Bangladesh', 'en');
INSERT INTO `nazioni` VALUES ('Barbados', 'en');
INSERT INTO `nazioni` VALUES ('Belarus', 'en');
INSERT INTO `nazioni` VALUES ('Belgium', 'en');
INSERT INTO `nazioni` VALUES ('Belize', 'en');
INSERT INTO `nazioni` VALUES ('Benin', 'en');
INSERT INTO `nazioni` VALUES ('Bermuda', 'en');
INSERT INTO `nazioni` VALUES ('Bhutan', 'en');
INSERT INTO `nazioni` VALUES ('Bolivia', 'en');
INSERT INTO `nazioni` VALUES ('Bonaire', 'en');
INSERT INTO `nazioni` VALUES ('Bosnia and Herzegovina', 'en');
INSERT INTO `nazioni` VALUES ('Botswana', 'en');
INSERT INTO `nazioni` VALUES ('Brazil', 'en');
INSERT INTO `nazioni` VALUES ('Brunei Darussalam', 'en');
INSERT INTO `nazioni` VALUES ('Bulgaria', 'en');
INSERT INTO `nazioni` VALUES ('Burkina Faso', 'en');
INSERT INTO `nazioni` VALUES ('Burundi', 'en');
INSERT INTO `nazioni` VALUES ('Cambodia', 'en');
INSERT INTO `nazioni` VALUES ('Cameroon', 'en');
INSERT INTO `nazioni` VALUES ('Canada', 'en');
INSERT INTO `nazioni` VALUES ('Canary Islands', 'en');
INSERT INTO `nazioni` VALUES ('Cape Verde', 'en');
INSERT INTO `nazioni` VALUES ('Cayman Islands', 'en');
INSERT INTO `nazioni` VALUES ('Center Africa', 'en');
INSERT INTO `nazioni` VALUES ('Chad', 'en');
INSERT INTO `nazioni` VALUES ('Chile', 'en');
INSERT INTO `nazioni` VALUES ('China', 'en');
INSERT INTO `nazioni` VALUES ('Colombia', 'en');
INSERT INTO `nazioni` VALUES ('Comoros', 'en');
INSERT INTO `nazioni` VALUES ('Congo', 'en');
INSERT INTO `nazioni` VALUES ('Cook Islands', 'en');
INSERT INTO `nazioni` VALUES ('Costa Rica', 'en');
INSERT INTO `nazioni` VALUES ('Croatia', 'en');
INSERT INTO `nazioni` VALUES ('Cuba', 'en');
INSERT INTO `nazioni` VALUES ('Curacao', 'en');
INSERT INTO `nazioni` VALUES ('Cyprus', 'en');
INSERT INTO `nazioni` VALUES ('Czech Republic', 'en');
INSERT INTO `nazioni` VALUES ('Denmark', 'en');
INSERT INTO `nazioni` VALUES ('Djibouti', 'en');
INSERT INTO `nazioni` VALUES ('Dominica', 'en');
INSERT INTO `nazioni` VALUES ('Dominican Republic', 'en');
INSERT INTO `nazioni` VALUES ('East Timor', 'en');
INSERT INTO `nazioni` VALUES ('Ecuador', 'en');
INSERT INTO `nazioni` VALUES ('Egypt', 'en');
INSERT INTO `nazioni` VALUES ('El Salvador', 'en');
INSERT INTO `nazioni` VALUES ('England', 'en');
INSERT INTO `nazioni` VALUES ('Equatorial Guinea', 'en');
INSERT INTO `nazioni` VALUES ('Eritrea', 'en');
INSERT INTO `nazioni` VALUES ('Estonia', 'en');
INSERT INTO `nazioni` VALUES ('Ethiopia', 'en');
INSERT INTO `nazioni` VALUES ('Falkland Islands', 'en');
INSERT INTO `nazioni` VALUES ('Faroe Islands', 'en');
INSERT INTO `nazioni` VALUES ('Fiji', 'en');
INSERT INTO `nazioni` VALUES ('Finland', 'en');
INSERT INTO `nazioni` VALUES ('France', 'en');
INSERT INTO `nazioni` VALUES ('French Guiana', 'en');
INSERT INTO `nazioni` VALUES ('Gabon', 'en');
INSERT INTO `nazioni` VALUES ('Galles', 'en');
INSERT INTO `nazioni` VALUES ('Gambia', 'en');
INSERT INTO `nazioni` VALUES ('Georgia', 'en');
INSERT INTO `nazioni` VALUES ('Germany', 'en');
INSERT INTO `nazioni` VALUES ('Ghana', 'en');
INSERT INTO `nazioni` VALUES ('Gibraltar', 'en');
INSERT INTO `nazioni` VALUES ('Greece', 'en');
INSERT INTO `nazioni` VALUES ('Greenland', 'en');
INSERT INTO `nazioni` VALUES ('Grenada', 'en');
INSERT INTO `nazioni` VALUES ('Guadeloupe', 'en');
INSERT INTO `nazioni` VALUES ('Guam', 'en');
INSERT INTO `nazioni` VALUES ('Guatemala', 'en');
INSERT INTO `nazioni` VALUES ('Guernsey', 'en');
INSERT INTO `nazioni` VALUES ('Guinea', 'en');
INSERT INTO `nazioni` VALUES ('Guinea-Bissau', 'en');
INSERT INTO `nazioni` VALUES ('Guyana', 'en');
INSERT INTO `nazioni` VALUES ('Haiti', 'en');
INSERT INTO `nazioni` VALUES ('Honduras', 'en');
INSERT INTO `nazioni` VALUES ('Hong Kong', 'en');
INSERT INTO `nazioni` VALUES ('Hungary', 'en');
INSERT INTO `nazioni` VALUES ('Iceland', 'en');
INSERT INTO `nazioni` VALUES ('India', 'en');
INSERT INTO `nazioni` VALUES ('Indonesia', 'en');
INSERT INTO `nazioni` VALUES ('Iran', 'en');
INSERT INTO `nazioni` VALUES ('Iraq', 'en');
INSERT INTO `nazioni` VALUES ('Ireland', 'en');
INSERT INTO `nazioni` VALUES ('Israel', 'en');
INSERT INTO `nazioni` VALUES ('ITALIA', 'it');
INSERT INTO `nazioni` VALUES ('Ivory Coast', 'en');
INSERT INTO `nazioni` VALUES ('Jamaica', 'en');
INSERT INTO `nazioni` VALUES ('Japan', 'en');
INSERT INTO `nazioni` VALUES ('Jersey', 'en');
INSERT INTO `nazioni` VALUES ('Jordan', 'en');
INSERT INTO `nazioni` VALUES ('Kazakhstan', 'en');
INSERT INTO `nazioni` VALUES ('Kenya', 'en');
INSERT INTO `nazioni` VALUES ('Kiribati', 'en');
INSERT INTO `nazioni` VALUES ('Kosovo', 'en');
INSERT INTO `nazioni` VALUES ('Kuwait', 'en');
INSERT INTO `nazioni` VALUES ('Kyrgyzstan', 'en');
INSERT INTO `nazioni` VALUES ('Lao', 'en');
INSERT INTO `nazioni` VALUES ('Latvia', 'en');
INSERT INTO `nazioni` VALUES ('Lebanon', 'en');
INSERT INTO `nazioni` VALUES ('Lesotho', 'en');
INSERT INTO `nazioni` VALUES ('Liberia', 'en');
INSERT INTO `nazioni` VALUES ('Libya', 'en');
INSERT INTO `nazioni` VALUES ('Liechtenstein', 'en');
INSERT INTO `nazioni` VALUES ('Lithuania', 'en');
INSERT INTO `nazioni` VALUES ('Luxembourg', 'en');
INSERT INTO `nazioni` VALUES ('Macao', 'en');
INSERT INTO `nazioni` VALUES ('Macedonia', 'en');
INSERT INTO `nazioni` VALUES ('Madagascar', 'en');
INSERT INTO `nazioni` VALUES ('Malawi', 'en');
INSERT INTO `nazioni` VALUES ('Malaysia', 'en');
INSERT INTO `nazioni` VALUES ('Maldives', 'en');
INSERT INTO `nazioni` VALUES ('Mali', 'en');
INSERT INTO `nazioni` VALUES ('Malta', 'en');
INSERT INTO `nazioni` VALUES ('Marshall Islands', 'en');
INSERT INTO `nazioni` VALUES ('Martinique', 'en');
INSERT INTO `nazioni` VALUES ('Mauritania', 'en');
INSERT INTO `nazioni` VALUES ('Mauritius', 'en');
INSERT INTO `nazioni` VALUES ('Mayotte', 'en');
INSERT INTO `nazioni` VALUES ('Mexico', 'en');
INSERT INTO `nazioni` VALUES ('Micronesia', 'en');
INSERT INTO `nazioni` VALUES ('Moldova', 'en');
INSERT INTO `nazioni` VALUES ('Monaco', 'en');
INSERT INTO `nazioni` VALUES ('Mongolia', 'en');
INSERT INTO `nazioni` VALUES ('Montenegro', 'en');
INSERT INTO `nazioni` VALUES ('Montserrat', 'en');
INSERT INTO `nazioni` VALUES ('Morocco', 'en');
INSERT INTO `nazioni` VALUES ('Mozambique', 'en');
INSERT INTO `nazioni` VALUES ('Myanmar, Burma', 'en');
INSERT INTO `nazioni` VALUES ('Namibia', 'en');
INSERT INTO `nazioni` VALUES ('Nauru', 'en');
INSERT INTO `nazioni` VALUES ('Nepal', 'en');
INSERT INTO `nazioni` VALUES ('Netherlands', 'en');
INSERT INTO `nazioni` VALUES ('Nevis', 'en');
INSERT INTO `nazioni` VALUES ('New Caledonia', 'en');
INSERT INTO `nazioni` VALUES ('New Zealand', 'en');
INSERT INTO `nazioni` VALUES ('Nicaragua', 'en');
INSERT INTO `nazioni` VALUES ('Niger', 'en');
INSERT INTO `nazioni` VALUES ('Nigeria', 'en');
INSERT INTO `nazioni` VALUES ('Niue', 'en');
INSERT INTO `nazioni` VALUES ('Nord Ireland', 'en');
INSERT INTO `nazioni` VALUES ('North Korea', 'en');
INSERT INTO `nazioni` VALUES ('Norway', 'en');
INSERT INTO `nazioni` VALUES ('Oman', 'en');
INSERT INTO `nazioni` VALUES ('Pakistan', 'en');
INSERT INTO `nazioni` VALUES ('Palau', 'en');
INSERT INTO `nazioni` VALUES ('Panama', 'en');
INSERT INTO `nazioni` VALUES ('Papua New Guinea', 'en');
INSERT INTO `nazioni` VALUES ('Paraguay', 'en');
INSERT INTO `nazioni` VALUES ('Peru', 'en');
INSERT INTO `nazioni` VALUES ('Philippines', 'en');
INSERT INTO `nazioni` VALUES ('Poland', 'en');
INSERT INTO `nazioni` VALUES ('Portugal', 'en');
INSERT INTO `nazioni` VALUES ('Puerto Rico', 'en');
INSERT INTO `nazioni` VALUES ('Qatar', 'en');
INSERT INTO `nazioni` VALUES ('Reunion Island', 'en');
INSERT INTO `nazioni` VALUES ('Romania', 'en');
INSERT INTO `nazioni` VALUES ('Russian Federation', 'en');
INSERT INTO `nazioni` VALUES ('Rwanda', 'en');
INSERT INTO `nazioni` VALUES ('Saint Barthelemy', 'en');
INSERT INTO `nazioni` VALUES ('Saint Eustatius', 'en');
INSERT INTO `nazioni` VALUES ('Saint Kitts and Nevis', 'en');
INSERT INTO `nazioni` VALUES ('Saint Lucia', 'en');
INSERT INTO `nazioni` VALUES ('Saint Maarten', 'en');
INSERT INTO `nazioni` VALUES ('Saint Vincent e Grenadine', 'en');
INSERT INTO `nazioni` VALUES ('Saipan', 'en');
INSERT INTO `nazioni` VALUES ('Samoa', 'en');
INSERT INTO `nazioni` VALUES ('Saudi Arabia', 'en');
INSERT INTO `nazioni` VALUES ('Scotland', 'en');
INSERT INTO `nazioni` VALUES ('Senegal', 'en');
INSERT INTO `nazioni` VALUES ('Serbia', 'en');
INSERT INTO `nazioni` VALUES ('Seychelles', 'en');
INSERT INTO `nazioni` VALUES ('Sierra Leone', 'en');
INSERT INTO `nazioni` VALUES ('Singapore', 'en');
INSERT INTO `nazioni` VALUES ('Slovakia', 'en');
INSERT INTO `nazioni` VALUES ('Slovenia', 'en');
INSERT INTO `nazioni` VALUES ('Solomon Islands', 'en');
INSERT INTO `nazioni` VALUES ('Somalia', 'en');
INSERT INTO `nazioni` VALUES ('South Africa', 'en');
INSERT INTO `nazioni` VALUES ('South Korea', 'en');
INSERT INTO `nazioni` VALUES ('South Sudan', 'en');
INSERT INTO `nazioni` VALUES ('Spain', 'en');
INSERT INTO `nazioni` VALUES ('Sri Lanka', 'en');
INSERT INTO `nazioni` VALUES ('Sudan', 'en');
INSERT INTO `nazioni` VALUES ('Suriname', 'en');
INSERT INTO `nazioni` VALUES ('Swaziland', 'en');
INSERT INTO `nazioni` VALUES ('Sweden', 'en');
INSERT INTO `nazioni` VALUES ('Switzerland', 'en');
INSERT INTO `nazioni` VALUES ('Syria', 'en');
INSERT INTO `nazioni` VALUES ('Tahiti', 'en');
INSERT INTO `nazioni` VALUES ('Taiwan', 'en');
INSERT INTO `nazioni` VALUES ('Tajikistan', 'en');
INSERT INTO `nazioni` VALUES ('Tanzania', 'en');
INSERT INTO `nazioni` VALUES ('Thailand', 'en');
INSERT INTO `nazioni` VALUES ('Togo', 'en');
INSERT INTO `nazioni` VALUES ('Tonga', 'en');
INSERT INTO `nazioni` VALUES ('Trinidad and Tobago', 'en');
INSERT INTO `nazioni` VALUES ('Tunisia', 'en');
INSERT INTO `nazioni` VALUES ('Turkey', 'en');
INSERT INTO `nazioni` VALUES ('Turks and Caicos Islands', 'en');
INSERT INTO `nazioni` VALUES ('Tuvalu', 'en');
INSERT INTO `nazioni` VALUES ('Uganda', 'en');
INSERT INTO `nazioni` VALUES ('Ukraine', 'en');
INSERT INTO `nazioni` VALUES ('United Arab Emirates', 'en');
INSERT INTO `nazioni` VALUES ('United Kingdom', 'en');
INSERT INTO `nazioni` VALUES ('United States', 'en');
INSERT INTO `nazioni` VALUES ('Uruguay', 'en');
INSERT INTO `nazioni` VALUES ('Uzbekistan', 'en');
INSERT INTO `nazioni` VALUES ('Vanuatu', 'en');
INSERT INTO `nazioni` VALUES ('Venezuela', 'en');
INSERT INTO `nazioni` VALUES ('Vietnam', 'en');
INSERT INTO `nazioni` VALUES ('Virgin Islands', 'en');
INSERT INTO `nazioni` VALUES ('Yemen', 'en');
INSERT INTO `nazioni` VALUES ('Zambia', 'en');
INSERT INTO `nazioni` VALUES ('Zimbabwe', 'en');

-- ----------------------------
-- Table structure for `order_refound`
-- ----------------------------
DROP TABLE IF EXISTS `order_refound`;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_refound
-- ----------------------------
INSERT INTO `order_refound` VALUES ('1', '7', 'msmcnc@gmail.com', '5PE72688RR712613J', '1.00', 'fa cagare', 'R', '0');
INSERT INTO `order_refound` VALUES ('2', '9', 'msmcnc@gmail.com', '02W82919MC708331G', '1.00', 'euna merda', 'R', '0');
INSERT INTO `order_refound` VALUES ('10', '13', 'jacopo.frediani@gmail.com', '98Y31118H8962731J', '1.00', 'a', 'R', '0');
INSERT INTO `order_refound` VALUES ('11', '13', 'jacopo.frediani@gmail.com', '98Y31118H8962731J', '1.00', 'prova', 'R', '0');
INSERT INTO `order_refound` VALUES ('12', '14', 'jacopo.frediani@gmail.com', '46M74955YW646283B', '1.00', 'AAA', 'R', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2', 'jacopo.frediani@gmail.com', '2.00', null, '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('3', 'jacopo.frediani@gmail.com', '4.00', null, '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('4', 'jacopo.frediani@gmail.com', '4.00', null, '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('5', 'jacopo.frediani@gmail.com', '4.00', '4WD612019W906053C', '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('6', 'msmcnc@gmail.com', '1.00', null, '3', '3', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('7', 'msmcnc@gmail.com', '1.00', '5PE72688RR712613J', '3', '3', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('8', 'msmcnc@gmail.com', '1.00', null, '3', '3', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('9', 'msmcnc@gmail.com', '1.00', '02W82919MC708331G', '3', '3', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('10', 'jacopo.frediani@gmail.com', '1.00', '0B771925NL591810E', '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('11', 'msmcnc@gmail.com', '1.00', '8ED2199727653332Y', '3', '3', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('12', 'jacopo.frediani@gmail.com', '1.00', '9BF289548N5126218', '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('13', 'jacopo.frediani@gmail.com', '1.00', '98Y31118H8962731J', '1', '1', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('14', 'jacopo.frediani@gmail.com', '1.00', '46M74955YW646283B', '1', '1', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for `orders_articles`
-- ----------------------------
DROP TABLE IF EXISTS `orders_articles`;
CREATE TABLE `orders_articles` (
  `idOrderArticle` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  `imArticle` decimal(15,2) DEFAULT NULL,
  `txOrderArticle` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`idOrderArticle`),
  KEY `fk_OrdersArticles_Article1_idx` (`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Orders1_idx` (`idOrder`),
  CONSTRAINT `fk_OrdersArticles_Article1` FOREIGN KEY (`idProdotto`, `pgArticle`) REFERENCES `article` (`idProduct`, `pgArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdersArticles_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_articles
-- ----------------------------
INSERT INTO `orders_articles` VALUES ('3', '2', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('4', '3', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('5', '3', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('6', '4', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('7', '4', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('8', '5', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('9', '5', '28', '1', '1', '690.00', null);
INSERT INTO `orders_articles` VALUES ('10', '6', '28', '3', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('11', '7', '26', '3', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('12', '8', '28', '3', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('13', '9', '28', '3', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('14', '10', '27', '2', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('15', '11', '28', '3', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('16', '12', '27', '2', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('17', '13', '27', '2', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('18', '14', '27', '2', '1', '1.00', null);

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `idGender` int(11) DEFAULT NULL,
  `idType` int(11) DEFAULT NULL,
  `idBrand` int(11) DEFAULT NULL,
  `imPrice` decimal(15,0) DEFAULT NULL,
  `pcDiscount` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(500) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('26', '1', '5', '13', '2', '30', 'thumb20141212125853994&056_67e9e8a5-d66d-44cd-a47c-cd3ea09fd7e1.JPG', '1', '2015-02-15 12:59:19', null, '3', '1', null);
INSERT INTO `product` VALUES ('27', '1', '5', '3', '1', '0', 'thumb20141212130310393&126_7d3eddbf-a535-4b73-8fad-d8dcba0417de.JPG', '1', '2015-02-15 12:59:19', null, '3', null, null);
INSERT INTO `product` VALUES ('28', '2', '20', '15', '1', '0', 'thumb20141212130818063&033_1eb358a5-5e31-4e96-b8c7-764352cbb62a.JPG', '1', '2015-02-15 12:59:19', '1', '4', null, null);

-- ----------------------------
-- Table structure for `product_description`
-- ----------------------------
DROP TABLE IF EXISTS `product_description`;
CREATE TABLE `product_description` (
  `idProduct` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`idLanguages`),
  KEY `fk_ProductDescription_Product1` (`idProduct`),
  CONSTRAINT `fk_ProductDescription_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_description
-- ----------------------------
INSERT INTO `product_description` VALUES ('26', 'en', 'LIGHT WOOL GABARDINE SUIT');
INSERT INTO `product_description` VALUES ('26', 'it', 'ABITO IN GABARDINA DI LANA LEGGERA');
INSERT INTO `product_description` VALUES ('27', 'en', 'WOOL AND SILK BLEND TOKYO SUIT');
INSERT INTO `product_description` VALUES ('27', 'it', 'ABITO TOKYO IN LANA MISTO SETA');
INSERT INTO `product_description` VALUES ('28', 'en', '65MM ROCKSTUD LEATHER PUMPS');
INSERT INTO `product_description` VALUES ('28', 'it', 'DECOLLET?ê \"ROCKSTUD\" IN PELLE 65MM');

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `idProduct` int(11) NOT NULL,
  `pgImage` int(11) NOT NULL,
  `txImageUrl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`pgImage`),
  KEY `fk_ProductImage_Product1_idx` (`idProduct`),
  CONSTRAINT `fk_ProductImage_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('26', '1', '20141212125853994&056_67e9e8a5-d66d-44cd-a47c-cd3ea09fd7e1.JPG');
INSERT INTO `product_image` VALUES ('26', '2', '20141212125853946&056_62a572b8-fff6-45bb-9fd1-a62e92f36f9a.JPG');
INSERT INTO `product_image` VALUES ('26', '3', '20141212125854176&056_f30d981a-4328-4d9d-90e4-f5d57d8dfb47 (1).JPG');
INSERT INTO `product_image` VALUES ('27', '1', '20141212130310393&126_7d3eddbf-a535-4b73-8fad-d8dcba0417de.JPG');
INSERT INTO `product_image` VALUES ('27', '2', '20141212130317826&126_fd3ec518-e9ac-499f-988c-06f2a2f4288e.JPG');
INSERT INTO `product_image` VALUES ('27', '3', '20141212130317861&126_0433937d-6f71-4eef-b33b-49d7bac974ce.JPG');
INSERT INTO `product_image` VALUES ('28', '1', '20141212130809331&036_1bbd79c9-88f1-413f-bd28-c62935725194.JPG');
INSERT INTO `product_image` VALUES ('28', '2', '20141212130818063&033_1eb358a5-5e31-4e96-b8c7-764352cbb62a.JPG');
INSERT INTO `product_image` VALUES ('28', '3', '20141212130818323&036_c89186f5-812d-42f7-be8c-13030095561b.JPG');
INSERT INTO `product_image` VALUES ('28', '4', '20141212130818290&036_7fab07d1-d8be-4582-bf31-fb485b1ea4b4.JPG');

-- ----------------------------
-- Table structure for `product_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `idProduct` int(11) NOT NULL,
  `idInformazione` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescrizione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`idInformazione`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_info
-- ----------------------------

-- ----------------------------
-- Table structure for `product_state`
-- ----------------------------
DROP TABLE IF EXISTS `product_state`;
CREATE TABLE `product_state` (
  `idProductState` int(11) NOT NULL,
  `txProductState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProductState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_state
-- ----------------------------
INSERT INTO `product_state` VALUES ('0', 'INSERITO');
INSERT INTO `product_state` VALUES ('1', 'PUBBLICATO');
INSERT INTO `product_state` VALUES ('2', 'CANCELLATO');

-- ----------------------------
-- Table structure for `provincia`
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL,
  `txProvincia` varchar(100) DEFAULT NULL,
  `idRegione` int(11) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provincia
-- ----------------------------
INSERT INTO `provincia` VALUES ('1', 'Ancona', '1');
INSERT INTO `provincia` VALUES ('2', 'Macerata', '1');
INSERT INTO `provincia` VALUES ('3', 'Pesaro Urbino', '1');
INSERT INTO `provincia` VALUES ('4', 'Ascoli Piceno', '1');
INSERT INTO `provincia` VALUES ('5', 'Alessandria', '13');
INSERT INTO `provincia` VALUES ('6', 'Asti', '13');
INSERT INTO `provincia` VALUES ('7', 'Biella', '13');
INSERT INTO `provincia` VALUES ('8', 'Cuneo', '13');
INSERT INTO `provincia` VALUES ('9', 'Novara', '13');
INSERT INTO `provincia` VALUES ('10', 'Vercelli', '13');
INSERT INTO `provincia` VALUES ('11', 'Torino', '13');
INSERT INTO `provincia` VALUES ('12', 'Agrigento', '11');
INSERT INTO `provincia` VALUES ('13', 'Caltanissetta', '11');
INSERT INTO `provincia` VALUES ('14', 'Catania', '11');
INSERT INTO `provincia` VALUES ('15', 'Enna', '11');
INSERT INTO `provincia` VALUES ('16', 'Messina', '11');
INSERT INTO `provincia` VALUES ('17', 'Palermo', '11');
INSERT INTO `provincia` VALUES ('18', 'Ragusa', '11');
INSERT INTO `provincia` VALUES ('19', 'Siracusa', '11');
INSERT INTO `provincia` VALUES ('20', 'Trapani', '11');
INSERT INTO `provincia` VALUES ('21', 'Catanzaro', '7');
INSERT INTO `provincia` VALUES ('22', 'Cosenza', '7');
INSERT INTO `provincia` VALUES ('23', 'Crotone', '7');
INSERT INTO `provincia` VALUES ('24', 'Reggio Calabria', '7');
INSERT INTO `provincia` VALUES ('25', 'Vibo Valentia', '7');
INSERT INTO `provincia` VALUES ('27', 'Matera', '3');
INSERT INTO `provincia` VALUES ('28', 'Potenza', '3');
INSERT INTO `provincia` VALUES ('29', 'Bari', '6');
INSERT INTO `provincia` VALUES ('30', 'Brindisi', '6');
INSERT INTO `provincia` VALUES ('31', 'Foggia', '6');
INSERT INTO `provincia` VALUES ('32', 'Lecce', '6');
INSERT INTO `provincia` VALUES ('33', 'Taranto', '6');
INSERT INTO `provincia` VALUES ('34', 'Avellino', '8');
INSERT INTO `provincia` VALUES ('35', 'Benevento', '8');
INSERT INTO `provincia` VALUES ('36', 'Caserta', '8');
INSERT INTO `provincia` VALUES ('37', 'Napoli', '8');
INSERT INTO `provincia` VALUES ('38', 'Salerno', '8');
INSERT INTO `provincia` VALUES ('39', 'Frosinone', '9');
INSERT INTO `provincia` VALUES ('40', 'Latina', '9');
INSERT INTO `provincia` VALUES ('41', 'Rieti', '9');
INSERT INTO `provincia` VALUES ('42', 'Roma', '9');
INSERT INTO `provincia` VALUES ('43', 'Viterbo', '9');
INSERT INTO `provincia` VALUES ('44', 'Chieti', '2');
INSERT INTO `provincia` VALUES ('45', 'L\'Aquila', '2');
INSERT INTO `provincia` VALUES ('46', 'Pescara', '2');
INSERT INTO `provincia` VALUES ('47', 'Teramo', '2');
INSERT INTO `provincia` VALUES ('48', 'Arezzo', '12');
INSERT INTO `provincia` VALUES ('49', 'Firenze', '12');
INSERT INTO `provincia` VALUES ('50', 'Grosseto', '12');
INSERT INTO `provincia` VALUES ('51', 'Livorno', '12');
INSERT INTO `provincia` VALUES ('52', 'Lucca', '12');
INSERT INTO `provincia` VALUES ('53', 'Massa Carrara', '12');
INSERT INTO `provincia` VALUES ('54', 'Pisa', '12');
INSERT INTO `provincia` VALUES ('55', 'Pistoia', '12');
INSERT INTO `provincia` VALUES ('56', 'Siena', '12');
INSERT INTO `provincia` VALUES ('57', 'Bologna', '14');
INSERT INTO `provincia` VALUES ('58', 'Ferrara', '14');
INSERT INTO `provincia` VALUES ('59', 'Forlì Cesena', '14');
INSERT INTO `provincia` VALUES ('60', 'Modena', '14');
INSERT INTO `provincia` VALUES ('61', 'Parma', '14');
INSERT INTO `provincia` VALUES ('62', 'Piacenza', '14');
INSERT INTO `provincia` VALUES ('63', 'Ravenna', '14');
INSERT INTO `provincia` VALUES ('64', 'Reggio Emilia', '14');
INSERT INTO `provincia` VALUES ('65', 'Rimini', '14');
INSERT INTO `provincia` VALUES ('66', 'Belluno', '17');
INSERT INTO `provincia` VALUES ('67', 'Padova', '17');
INSERT INTO `provincia` VALUES ('68', 'Rovigo', '17');
INSERT INTO `provincia` VALUES ('69', 'Treviso', '17');
INSERT INTO `provincia` VALUES ('70', 'Venezia', '17');
INSERT INTO `provincia` VALUES ('71', 'Verona', '17');
INSERT INTO `provincia` VALUES ('72', 'Vicenza', '17');
INSERT INTO `provincia` VALUES ('73', 'Gorizia', '15');
INSERT INTO `provincia` VALUES ('74', 'Pordenone', '15');
INSERT INTO `provincia` VALUES ('75', 'Udine', '15');
INSERT INTO `provincia` VALUES ('76', 'Trieste', '15');
INSERT INTO `provincia` VALUES ('77', 'Aosta', '16');
INSERT INTO `provincia` VALUES ('78', 'Cagliari', '10');
INSERT INTO `provincia` VALUES ('79', 'Nuoro', '10');
INSERT INTO `provincia` VALUES ('80', 'Oristano', '10');
INSERT INTO `provincia` VALUES ('81', 'Sassari', '10');
INSERT INTO `provincia` VALUES ('82', 'Genova', '18');
INSERT INTO `provincia` VALUES ('83', 'Imperia', '18');
INSERT INTO `provincia` VALUES ('84', 'Savona', '18');
INSERT INTO `provincia` VALUES ('85', 'La Spezia', '18');
INSERT INTO `provincia` VALUES ('86', 'Isernia', '4');
INSERT INTO `provincia` VALUES ('87', 'Campobasso', '4');
INSERT INTO `provincia` VALUES ('88', 'Perugia', '20');
INSERT INTO `provincia` VALUES ('89', 'Terni', '20');
INSERT INTO `provincia` VALUES ('90', 'Bergamo', '19');
INSERT INTO `provincia` VALUES ('91', 'Brescia', '19');
INSERT INTO `provincia` VALUES ('92', 'Como', '19');
INSERT INTO `provincia` VALUES ('93', 'Cremona', '19');
INSERT INTO `provincia` VALUES ('94', 'Lecco', '19');
INSERT INTO `provincia` VALUES ('95', 'Lodi', '19');
INSERT INTO `provincia` VALUES ('96', 'Mantova', '19');
INSERT INTO `provincia` VALUES ('97', 'Milano', '19');
INSERT INTO `provincia` VALUES ('98', 'Pavia', '19');
INSERT INTO `provincia` VALUES ('99', 'Sondrio', '19');
INSERT INTO `provincia` VALUES ('100', 'Varese', '19');
INSERT INTO `provincia` VALUES ('101', 'Trento', '5');
INSERT INTO `provincia` VALUES ('102', 'Bolzano', '5');
INSERT INTO `provincia` VALUES ('103', 'Prato', '12');
INSERT INTO `provincia` VALUES ('104', 'Verbania', '13');
INSERT INTO `provincia` VALUES ('105', 'Carbonia Iglesias', '10');
INSERT INTO `provincia` VALUES ('106', 'Medio Campidano', '10');
INSERT INTO `provincia` VALUES ('107', 'Ogliastra', '10');
INSERT INTO `provincia` VALUES ('108', 'Olbia Tempio', '10');

-- ----------------------------
-- Table structure for `refound_articles`
-- ----------------------------
DROP TABLE IF EXISTS `refound_articles`;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refound_articles
-- ----------------------------
INSERT INTO `refound_articles` VALUES ('1', '1', '26', '3', '1', null, null, null, null);
INSERT INTO `refound_articles` VALUES ('2', '2', '28', '3', '1', null, null, null, null);
INSERT INTO `refound_articles` VALUES ('10', '10', '27', '2', '1', null, null, null, null);
INSERT INTO `refound_articles` VALUES ('11', '11', '27', '2', '1', null, null, null, null);
INSERT INTO `refound_articles` VALUES ('12', '12', '27', '2', '1', null, null, null, null);

-- ----------------------------
-- Table structure for `regione`
-- ----------------------------
DROP TABLE IF EXISTS `regione`;
CREATE TABLE `regione` (
  `idregione` int(11) NOT NULL,
  `txRegione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idregione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regione
-- ----------------------------
INSERT INTO `regione` VALUES ('1', 'Marche');
INSERT INTO `regione` VALUES ('2', 'Abruzzo');
INSERT INTO `regione` VALUES ('3', 'Basilicata');
INSERT INTO `regione` VALUES ('4', 'Molise');
INSERT INTO `regione` VALUES ('5', 'Trentino Alto Adige');
INSERT INTO `regione` VALUES ('6', 'Puglia');
INSERT INTO `regione` VALUES ('7', 'Calabria');
INSERT INTO `regione` VALUES ('8', 'Campania');
INSERT INTO `regione` VALUES ('9', 'Lazio');
INSERT INTO `regione` VALUES ('10', 'Sardegna');
INSERT INTO `regione` VALUES ('11', 'Sicilia');
INSERT INTO `regione` VALUES ('12', 'Toscana');
INSERT INTO `regione` VALUES ('13', 'Piemonte');
INSERT INTO `regione` VALUES ('14', 'Emilia Romagna');
INSERT INTO `regione` VALUES ('15', 'Friuli Venezia Giulia');
INSERT INTO `regione` VALUES ('16', 'Valle d\'Aosta');
INSERT INTO `regione` VALUES ('17', 'Veneto');
INSERT INTO `regione` VALUES ('18', 'Liguria');
INSERT INTO `regione` VALUES ('19', 'Lombardia');
INSERT INTO `regione` VALUES ('20', 'Umbria');

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
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

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('100', 'Degortes Sede', 'shop@degortes.net', 'Degortes Outlet', 'Via della Resistenza 117/C', 'Monteriggioni', '53035', 'SI', 'Italia', '0577309334');
INSERT INTO `shops` VALUES ('230', 'Degortes Follonica', 'shop@degortes.net', 'Degortes Outlet', 'Via Roma, 8', 'Follonica', '58022', 'GR', 'Italia', '056642876');
INSERT INTO `shops` VALUES ('240', 'Degortes Castiglione della Pescaia', 'shop@degortes.net', 'Degortes Outlet', 'Corso Della Liberta’, 2', 'Castiglione della Pescaia', '58043', 'GR', 'Italia', '0564939849');
INSERT INTO `shops` VALUES ('260', 'Degortes Lucca', 'shop@degortes.net', 'Degortes Outlet', 'Piazza degli Scalpellini, 1', 'Lucca', '55100', 'LU', 'Italia', '0583492865');
INSERT INTO `shops` VALUES ('300', 'Degortes Siena', 'shop@degortes.net', 'Degortes Outlet', 'Via Banchi di Sotto, 19 - 21', 'Siena', '53100', 'SI', 'Italia', '0577281103 ');

-- ----------------------------
-- Table structure for `site_images`
-- ----------------------------
DROP TABLE IF EXISTS `site_images`;
CREATE TABLE `site_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `pgGroupImages` int(11) NOT NULL,
  `txName` varchar(150) DEFAULT NULL,
  `idGender` int(11) DEFAULT NULL,
  `urlRedirect` varchar(100) DEFAULT NULL,
  `txAlt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`,`pgGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site_images
-- ----------------------------
INSERT INTO `site_images` VALUES ('carousel', '1', '26012015103234776&foto 1 (2).JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '2', '26012015103244631&foto 1.JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '3', '26012015103248885&foto 2 (2).JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '4', '26012015103253448&foto 2.JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '5', '26012015103257495&foto 3 (2).JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '6', '26012015103307196&foto 3.JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '7', '26012015103311767&foto 4 (2).JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('carousel', '8', '26012015103316296&foto 4.JPG', null, null, 'Degortes online shop');
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, null);
INSERT INTO `site_images` VALUES ('newArrivals', '1', 'newuomo2.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('newArrivals', '2', 'newdonna2.jpg', '2', '/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, null);
INSERT INTO `site_images` VALUES ('tabNav', '1', 'uomo.png', '1', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '2', 'donna.png', '2', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '3', 'bambino.png', '3', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '4', 'bambina.png', '4', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '5', 'unisex.png', '5', null, null);

-- ----------------------------
-- Table structure for `size`
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `idSize` int(11) NOT NULL,
  `txSize` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', '34');
INSERT INTO `size` VALUES ('2', '36');
INSERT INTO `size` VALUES ('3', '38');
INSERT INTO `size` VALUES ('4', '40');
INSERT INTO `size` VALUES ('5', '42');
INSERT INTO `size` VALUES ('6', '44');
INSERT INTO `size` VALUES ('7', '46');
INSERT INTO `size` VALUES ('8', '48');
INSERT INTO `size` VALUES ('9', '50');
INSERT INTO `size` VALUES ('10', '52');
INSERT INTO `size` VALUES ('11', '54');
INSERT INTO `size` VALUES ('12', '56');
INSERT INTO `size` VALUES ('13', '58');
INSERT INTO `size` VALUES ('14', '60');
INSERT INTO `size` VALUES ('15', 'XXS');
INSERT INTO `size` VALUES ('16', 'XS');
INSERT INTO `size` VALUES ('17', 'S');
INSERT INTO `size` VALUES ('18', 'M');
INSERT INTO `size` VALUES ('19', 'L');
INSERT INTO `size` VALUES ('20', 'XL');
INSERT INTO `size` VALUES ('21', 'XXL');
INSERT INTO `size` VALUES ('22', 'U');
INSERT INTO `size` VALUES ('24', '35');
INSERT INTO `size` VALUES ('26', '37');
INSERT INTO `size` VALUES ('28', '39');
INSERT INTO `size` VALUES ('30', '41');
INSERT INTO `size` VALUES ('32', '43');
INSERT INTO `size` VALUES ('34', '45');
INSERT INTO `size` VALUES ('36', '47');
INSERT INTO `size` VALUES ('37', '24');
INSERT INTO `size` VALUES ('38', '25');
INSERT INTO `size` VALUES ('39', '26');
INSERT INTO `size` VALUES ('40', '27');
INSERT INTO `size` VALUES ('41', '28');
INSERT INTO `size` VALUES ('42', '29');
INSERT INTO `size` VALUES ('43', '30');
INSERT INTO `size` VALUES ('44', '31');
INSERT INTO `size` VALUES ('45', '32');
INSERT INTO `size` VALUES ('46', '33');
INSERT INTO `size` VALUES ('47', '36 1/2');
INSERT INTO `size` VALUES ('48', '37 1/2');
INSERT INTO `size` VALUES ('49', '38 1/2');
INSERT INTO `size` VALUES ('50', '39 1/2');

-- ----------------------------
-- Table structure for `states`
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `idStato` int(11) NOT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStato`),
  UNIQUE KEY `idStato_UNIQUE` (`idStato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of states
-- ----------------------------
INSERT INTO `states` VALUES ('1', 'INSERITO');
INSERT INTO `states` VALUES ('2', 'CANCELEDREVERSAL');
INSERT INTO `states` VALUES ('3', 'COMPLETED');
INSERT INTO `states` VALUES ('4', 'DENIED');
INSERT INTO `states` VALUES ('5', 'EXPIRED');
INSERT INTO `states` VALUES ('6', 'FAILED');
INSERT INTO `states` VALUES ('7', 'INPROGRESS');
INSERT INTO `states` VALUES ('8', 'PARTIALLYREFUNDED');
INSERT INTO `states` VALUES ('9', 'PENDING');
INSERT INTO `states` VALUES ('10', 'REFUNDED');
INSERT INTO `states` VALUES ('11', 'REVERSED');
INSERT INTO `states` VALUES ('12', 'PROCESSED');
INSERT INTO `states` VALUES ('13', 'VOIDED');
INSERT INTO `states` VALUES ('14', 'COMPLETEDFUNDSHELD');
INSERT INTO `states` VALUES ('15', 'SPEDITO');
INSERT INTO `states` VALUES ('100', 'REQUEST REFOUND');
INSERT INTO `states` VALUES ('101', 'REFOUND COMPLETED');
INSERT INTO `states` VALUES ('102', 'REFOUND REFUSED');
INSERT INTO `states` VALUES ('103', 'REFOUND CANCELED');
INSERT INTO `states` VALUES ('200', 'REQUEST CHANGE');
INSERT INTO `states` VALUES ('201', 'CHANGE COMPLETED');
INSERT INTO `states` VALUES ('202', 'CHANGE REFUSED');
INSERT INTO `states` VALUES ('203', 'CHANGE CANCELED');
INSERT INTO `states` VALUES ('204', 'INSTANT');

-- ----------------------------
-- Table structure for `states_orders`
-- ----------------------------
DROP TABLE IF EXISTS `states_orders`;
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

-- ----------------------------
-- Records of states_orders
-- ----------------------------
INSERT INTO `states_orders` VALUES ('2', '1', '2015-01-20 11:26:24', null);
INSERT INTO `states_orders` VALUES ('3', '1', '2015-01-20 11:27:21', null);
INSERT INTO `states_orders` VALUES ('4', '1', '2015-01-20 11:30:05', null);
INSERT INTO `states_orders` VALUES ('5', '1', '2015-01-20 11:35:40', null);
INSERT INTO `states_orders` VALUES ('5', '3', '2015-01-20 11:36:32', null);
INSERT INTO `states_orders` VALUES ('5', '15', '2015-01-20 11:53:52', null);
INSERT INTO `states_orders` VALUES ('6', '1', '2015-02-17 15:18:52', null);
INSERT INTO `states_orders` VALUES ('7', '1', '2015-02-17 15:25:11', null);
INSERT INTO `states_orders` VALUES ('7', '3', '2015-02-17 15:25:40', null);
INSERT INTO `states_orders` VALUES ('7', '15', '2015-02-17 15:27:16', null);
INSERT INTO `states_orders` VALUES ('8', '1', '2015-02-18 11:39:56', null);
INSERT INTO `states_orders` VALUES ('9', '1', '2015-02-18 11:46:18', null);
INSERT INTO `states_orders` VALUES ('9', '3', '2015-02-18 11:46:42', null);
INSERT INTO `states_orders` VALUES ('9', '15', '2015-02-18 11:50:08', null);
INSERT INTO `states_orders` VALUES ('10', '1', '2015-02-18 12:33:01', null);
INSERT INTO `states_orders` VALUES ('10', '3', '2015-02-18 12:33:44', null);
INSERT INTO `states_orders` VALUES ('10', '15', '2015-02-18 13:10:46', null);
INSERT INTO `states_orders` VALUES ('11', '1', '2015-02-18 13:15:53', null);
INSERT INTO `states_orders` VALUES ('11', '3', '2015-02-18 13:16:14', null);
INSERT INTO `states_orders` VALUES ('11', '15', '2015-02-18 13:16:34', null);
INSERT INTO `states_orders` VALUES ('12', '1', '2015-02-18 13:25:42', null);
INSERT INTO `states_orders` VALUES ('12', '3', '2015-02-18 13:26:00', null);
INSERT INTO `states_orders` VALUES ('12', '15', '2015-02-18 13:26:52', null);
INSERT INTO `states_orders` VALUES ('13', '1', '2015-02-18 15:11:23', null);
INSERT INTO `states_orders` VALUES ('13', '3', '2015-02-18 15:12:22', null);
INSERT INTO `states_orders` VALUES ('13', '15', '2015-02-18 15:16:05', null);
INSERT INTO `states_orders` VALUES ('14', '1', '2015-02-19 11:10:32', null);
INSERT INTO `states_orders` VALUES ('14', '3', '2015-02-19 11:10:47', null);
INSERT INTO `states_orders` VALUES ('14', '15', '2015-02-19 11:12:02', null);

-- ----------------------------
-- Table structure for `states_refound`
-- ----------------------------
DROP TABLE IF EXISTS `states_refound`;
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

-- ----------------------------
-- Records of states_refound
-- ----------------------------
INSERT INTO `states_refound` VALUES ('1', '100', '2015-02-17 15:27:55', null);
INSERT INTO `states_refound` VALUES ('1', '204', '2015-02-17 15:28:24', 'None');
INSERT INTO `states_refound` VALUES ('2', '100', '2015-02-18 12:11:50', null);
INSERT INTO `states_refound` VALUES ('2', '204', '2015-02-18 12:15:34', 'None');
INSERT INTO `states_refound` VALUES ('10', '100', '2015-02-19 10:51:26', null);
INSERT INTO `states_refound` VALUES ('10', '204', '2015-02-19 10:52:32', 'None');
INSERT INTO `states_refound` VALUES ('11', '100', '2015-02-19 10:58:10', null);
INSERT INTO `states_refound` VALUES ('12', '100', '2015-02-19 11:12:29', null);
INSERT INTO `states_refound` VALUES ('12', '204', '2015-02-19 11:12:52', 'None');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `idType` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txType` varchar(200) NOT NULL,
  PRIMARY KEY (`idType`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'en', 'ACCESSORIES');
INSERT INTO `type` VALUES ('1', 'it', 'ACCESSORI');
INSERT INTO `type` VALUES ('2', 'en', 'SHORTS');
INSERT INTO `type` VALUES ('2', 'it', 'BERMUDA');
INSERT INTO `type` VALUES ('3', 'en', 'SHIRTS');
INSERT INTO `type` VALUES ('3', 'it', 'CAMICIE');
INSERT INTO `type` VALUES ('4', 'en', 'COATS');
INSERT INTO `type` VALUES ('4', 'it', 'CAPPOTTI');
INSERT INTO `type` VALUES ('5', 'en', 'SUITS');
INSERT INTO `type` VALUES ('5', 'it', 'COMPLETI');
INSERT INTO `type` VALUES ('6', 'en', 'SWIMWEAR');
INSERT INTO `type` VALUES ('6', 'it', 'COSTUMI DA BAGNO');
INSERT INTO `type` VALUES ('7', 'en', 'SWEATSHIRTS');
INSERT INTO `type` VALUES ('7', 'it', 'FELPE');
INSERT INTO `type` VALUES ('8', 'en', 'JACKETS');
INSERT INTO `type` VALUES ('8', 'it', 'GIACCHE');
INSERT INTO `type` VALUES ('9', 'en', 'LEATHER JACKETS');
INSERT INTO `type` VALUES ('9', 'it', 'GIACCHE DI PELLE');
INSERT INTO `type` VALUES ('10', 'en', 'GILET');
INSERT INTO `type` VALUES ('10', 'it', 'GILET');
INSERT INTO `type` VALUES ('11', 'en', 'CASUAL JACKETS');
INSERT INTO `type` VALUES ('11', 'it', 'GIUBBOTTI');
INSERT INTO `type` VALUES ('12', 'en', 'SKIRTS');
INSERT INTO `type` VALUES ('12', 'it', 'GONNE');
INSERT INTO `type` VALUES ('13', 'en', 'UNDERWEAR');
INSERT INTO `type` VALUES ('13', 'it', 'INTIMO');
INSERT INTO `type` VALUES ('14', 'en', 'JEANS');
INSERT INTO `type` VALUES ('14', 'it', 'JEANS');
INSERT INTO `type` VALUES ('15', 'en', 'KNITWEAR');
INSERT INTO `type` VALUES ('15', 'it', 'MAGLIERIA');
INSERT INTO `type` VALUES ('16', 'en', 'PANTS');
INSERT INTO `type` VALUES ('16', 'it', 'PANTALONI');
INSERT INTO `type` VALUES ('17', 'en', 'FUR AND SHEARLING');
INSERT INTO `type` VALUES ('17', 'it', 'PELLICCE E SHEARLING');
INSERT INTO `type` VALUES ('18', 'en', 'DOWN JACKETS');
INSERT INTO `type` VALUES ('18', 'it', 'PIUMINI');
INSERT INTO `type` VALUES ('19', 'en', 'POLOS');
INSERT INTO `type` VALUES ('19', 'it', 'POLO');
INSERT INTO `type` VALUES ('20', 'en', 'SHOES');
INSERT INTO `type` VALUES ('20', 'it', 'SCARPE');
INSERT INTO `type` VALUES ('21', 'en', 'T-SHIRTS');
INSERT INTO `type` VALUES ('21', 'it', 'T-SHIRTS');
INSERT INTO `type` VALUES ('22', 'en', 'VESTS');
INSERT INTO `type` VALUES ('22', 'it', 'VESTITI');

-- ----------------------------
-- Table structure for `type_state_account`
-- ----------------------------
DROP TABLE IF EXISTS `type_state_account`;
CREATE TABLE `type_state_account` (
  `idTypeState` int(11) NOT NULL,
  `txTypeState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_state_account
-- ----------------------------
INSERT INTO `type_state_account` VALUES ('1', 'DISATTIVATO');
INSERT INTO `type_state_account` VALUES ('2', 'ATTIVATO');
INSERT INTO `type_state_account` VALUES ('3', 'CESSATO');
INSERT INTO `type_state_account` VALUES ('4', 'RESET_PSW');
