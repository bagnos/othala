/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : benha999_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 13:34:38
*/
drop schema if exists benha999_othala;
create schema benha999_othala;
use benha999_othala;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '0', 'casa');
INSERT INTO `addresses` VALUES ('2', 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aretina 89', 'siena', '53100', 'si', 'ITALIA', '3332965518', '0', 'casa');

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
INSERT INTO `article` VALUES ('2', '1', '9', '2', '1', '08012015113633855&20150108113632775BENHEART1.jpg', '1', '1', '460.00', null, '0');
INSERT INTO `article` VALUES ('4', '1', '9', '1', '1', 'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg', '1', '2', '450.00', null, '0');
INSERT INTO `article` VALUES ('4', '2', '10', '1', '1', 'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg', '1', '2', '450.00', null, '0');
INSERT INTO `article` VALUES ('5', '1', '7', '1', '1', 'thumb20150108153201461&SILVIA--STROPICCIATO-BenHeart_9229_zoom.jpg', '1', '3', '380.00', null, '0');
INSERT INTO `article` VALUES ('5', '2', '6', '2', '1', 'thumb20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg', '1', '3', '380.00', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('20', 'Benheart', null, null, null, null);

-- ----------------------------
-- Table structure for `brand_descr`
-- ----------------------------
DROP TABLE IF EXISTS `brand_descr`;
CREATE TABLE `brand_descr` (
  `idBrand` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescrizione` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idBrand`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `color` VALUES ('1', 'en', 'BLACK');
INSERT INTO `color` VALUES ('1', 'it', 'NERO');
INSERT INTO `color` VALUES ('2', 'en', 'DARK BROWN');
INSERT INTO `color` VALUES ('2', 'it', 'TESTA DI MORO');
INSERT INTO `color` VALUES ('3', 'en', 'LEATHER BROWN');
INSERT INTO `color` VALUES ('3', 'it', 'CUOIO');

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
INSERT INTO `customer` VALUES ('shop@benheart.it', 'shop@ben', 'A', 'A', 'A', '1');
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
INSERT INTO `customer_roles` VALUES ('shop@benheart.it', 'AMMINISTRATORE');
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
  CONSTRAINT `fk_fidelity_customer_customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fidelity_customer_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `gender` VALUES ('3', 'en', 'Unisex');
INSERT INTO `gender` VALUES ('3', 'it', 'Unisex');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for `mail_group`
-- ----------------------------
DROP TABLE IF EXISTS `mail_group`;
CREATE TABLE `mail_group` (
  `idMailGroup` int(11) NOT NULL AUTO_INCREMENT,
  `txMailGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMailGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mail_group
-- ----------------------------

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
INSERT INTO `material` VALUES ('1', 'en', 'SHEEPSKIN LEATHER');
INSERT INTO `material` VALUES ('1', 'it', 'PELLE DI MONTONE');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_refound
-- ----------------------------

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
  CONSTRAINT `fk_orders_coupons1` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_articles
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('2', '1', '9', '20', '460', '0', '08012015113633855&20150108113632775BENHEART1.jpg', '1', '2015-01-08 11:36:48', null, '1', null, null);
INSERT INTO `product` VALUES ('4', '1', '9', '20', '450', '0', 'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg', '1', '2015-01-08 15:23:11', null, '1', null, null);
INSERT INTO `product` VALUES ('5', '2', '9', '20', '380', '0', 'thumb20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg', '1', '2015-01-08 15:34:37', null, '1', null, null);

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
INSERT INTO `product_description` VALUES ('2', 'en', 'LEATHER JACKET');
INSERT INTO `product_description` VALUES ('2', 'it', 'GIUBBOTTO IN PELLE DI MONTONE TRAFORATO E TRATTATO IN CAPO,CON DUE TASHE E ZIP CENTRALE IN METALLO.COMPOSIZIONE 100% PELLE  100% FODERA VISCOSA.IL NOSTRO MODELLO INDOSSA UNA TG 50 è ALTO 1,80 m E PESA 70 Kg.');
INSERT INTO `product_description` VALUES ('4', 'en', 'NELSON');
INSERT INTO `product_description` VALUES ('4', 'it', 'NELSON');
INSERT INTO `product_description` VALUES ('5', 'en', 'LEATHER JACKET');
INSERT INTO `product_description` VALUES ('5', 'it', 'GIUBBOTTO IN PELLE DI MONTONE, CON CAPPUCCIO E ZIP ASIMETRICA IN METALLO TRATTATO IN CAPO.COMPOSIZIONE 100% PELLE  100% FODERA VISCOSA.');

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
INSERT INTO `product_image` VALUES ('2', '1', '08012015113633855&20150108113632775BENHEART1.jpg');
INSERT INTO `product_image` VALUES ('2', '2', '08012015113634285&20150108113632965BENHEART3.jpg');
INSERT INTO `product_image` VALUES ('2', '3', '08012015113634203&20150108113632957BENHEART2.jpg');
INSERT INTO `product_image` VALUES ('2', '4', '08012015113635019&20150108113632933BENHEART4.jpg');
INSERT INTO `product_image` VALUES ('4', '1', '20150108152239116&NELSON-LAVATO-BenHeart_626.jpg');
INSERT INTO `product_image` VALUES ('4', '2', '20150108152246038&NELSON-LAVATO-BenHeart_6752_zoom.jpg');
INSERT INTO `product_image` VALUES ('4', '3', '20150108152250281&NELSON-LAVATO-BenHeart_6753_zoom.jpg');
INSERT INTO `product_image` VALUES ('5', '1', '20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg');
INSERT INTO `product_image` VALUES ('5', '2', '20150108153201461&SILVIA--STROPICCIATO-BenHeart_9229_zoom.jpg');
INSERT INTO `product_image` VALUES ('5', '3', '20150108153201247&SILVIA--STROPICCIATO-BenHeart_393.jpg');
INSERT INTO `product_image` VALUES ('5', '4', '20150108153201324&SILVIA--STROPICCIATO-BenHeart_9224_zoom.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of provincia
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refound_articles
-- ----------------------------

-- ----------------------------
-- Table structure for `regione`
-- ----------------------------
DROP TABLE IF EXISTS `regione`;
CREATE TABLE `regione` (
  `idregione` int(11) NOT NULL,
  `txRegione` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idregione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of regione
-- ----------------------------

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
INSERT INTO `shops` VALUES ('1', 'Firenze', 'jacopo.frediani@gmail.com', 'Benheart', 'Via il Prato, 25/R', 'Firenze', '53100', 'FI', 'Italia', '+39 055 2808625');

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
INSERT INTO `site_images` VALUES ('carousel', '1', '08012015113732041&2.jpg', null, null, 'BENHEART');
INSERT INTO `site_images` VALUES ('carousel', '2', '08012015113732015&3.jpg', null, null, 'BENHEART');
INSERT INTO `site_images` VALUES ('carousel', '3', '08012015113731971&1.jpg', null, null, 'BENHEART');
INSERT INTO `site_images` VALUES ('carousel', '4', '08012015113732089&4.jpg', null, null, 'BENHEART');
INSERT INTO `site_images` VALUES ('new', '1', '08012015120648232&10325518_814516745236786_7806860005336622871_n.jpg', null, null, 'benheart');
INSERT INTO `site_images` VALUES ('newArrivals', '1', '07012015200754320&new2.jpg', '2', '/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'woman leather jacker');
INSERT INTO `site_images` VALUES ('newArrivals', '2', '07012015200813081&new1.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'man leather shoes');
INSERT INTO `site_images` VALUES ('promo', '1', '08012015120718485&2.jpg', null, null, 'benheart');
INSERT INTO `site_images` VALUES ('tabNav', '1', '08012015113907607&1157713_822616991093428_3203441439479633186_n.jpg', '1', null, 'benheart');
INSERT INTO `site_images` VALUES ('tabNav', '2', '08012015114111643&10014606_731760920179036_288184332859304600_n.jpg', '2', null, 'BENHEART');
INSERT INTO `site_images` VALUES ('tabNav', '3', '08012015114200860&car1.jpg', '3', null, 'benheart');

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
INSERT INTO `type` VALUES ('1', 'en', 'Accessories');
INSERT INTO `type` VALUES ('1', 'it', 'Accessori');
INSERT INTO `type` VALUES ('9', 'en', 'Leather jackets');
INSERT INTO `type` VALUES ('9', 'it', 'Giacche di pelle');
INSERT INTO `type` VALUES ('15', 'en', 'Knitwear');
INSERT INTO `type` VALUES ('15', 'it', 'Maglieria');
INSERT INTO `type` VALUES ('18', 'en', 'Bags');
INSERT INTO `type` VALUES ('18', 'it', 'Borse');
INSERT INTO `type` VALUES ('20', 'en', 'Shoes');
INSERT INTO `type` VALUES ('20', 'it', 'Scarpe');
INSERT INTO `type` VALUES ('21', 'en', 'Belts');
INSERT INTO `type` VALUES ('21', 'it', 'Cinture');
INSERT INTO `type` VALUES ('22', 'en', 'T-shirt');
INSERT INTO `type` VALUES ('22', 'it', 'T-shirt');

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
