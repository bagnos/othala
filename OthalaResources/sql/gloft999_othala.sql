/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : gloft999_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 14:41:16
*/

drop schema if exists gloft999_othala;
create schema gloft999_othala;
use gloft999_othala;

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
INSERT INTO `article` VALUES ('27', '1', '22', '13', '3', 'thumb20141027161832712&45239055TE_13P_F.jpg', '1', 'SBMPQ04YN0LV53100C19', '1250.00', null, '0');
INSERT INTO `article` VALUES ('28', '1', '17', '5', '1', 'thumb20141027162532826&37585351NL_13P_e.jpg', '1', 'FLMAQ15Y00TV359V1B80', '350.00', null, '10');
INSERT INTO `article` VALUES ('28', '2', '18', '5', '1', 'thumb20141027162532826&37585351NL_13P_e.jpg', '1', 'FLMAQ15Y00TV359V1B80', '350.00', null, '10');
INSERT INTO `article` VALUES ('28', '3', '19', '5', '1', 'thumb20141027162532826&37585351NL_13P_e.jpg', '1', 'FLMAQ15Y00TV359V1B80', '350.00', null, '10');
INSERT INTO `article` VALUES ('29', '1', '17', '11', '1', 'thumb20141028122536802&35226250HX_13P_e.jpg', '1', 'GOMAQ30A00TP43700N99', '1090.00', null, '0');
INSERT INTO `article` VALUES ('29', '2', '18', '11', '1', 'thumb20141028122536802&35226250HX_13P_e.jpg', '1', 'GOMAQ30A00TP43700N99', '1090.00', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('20', '5 DEPARTMENT', null, null, null, null);
INSERT INTO `brand` VALUES ('21', 'ALTO', null, null, null, null);
INSERT INTO `brand` VALUES ('22', 'ANDREA INCONTRI', null, null, null, null);
INSERT INTO `brand` VALUES ('23', 'ANTIPAST', null, null, null, null);
INSERT INTO `brand` VALUES ('24', 'BJORG', null, null, null, null);
INSERT INTO `brand` VALUES ('25', 'CARLO CONTRADA', null, null, null, null);
INSERT INTO `brand` VALUES ('26', 'COLLECTION PRIVEÈ', null, null, null, null);
INSERT INTO `brand` VALUES ('27', 'DAMIR DOMA', null, null, null, null);
INSERT INTO `brand` VALUES ('29', 'DIPTYQUE', null, null, null, null);
INSERT INTO `brand` VALUES ('30', 'DUSÀN', null, null, null, null);
INSERT INTO `brand` VALUES ('31', 'ES’GIVIEN', null, null, null, null);
INSERT INTO `brand` VALUES ('32', 'IOSSELLINI', null, null, null, null);
INSERT INTO `brand` VALUES ('33', 'JAMIN PUECH', null, null, null, null);
INSERT INTO `brand` VALUES ('34', 'JOE’S JEANS', null, null, null, null);
INSERT INTO `brand` VALUES ('35', 'LE PRAIRIES DE PARIS', null, null, null, null);
INSERT INTO `brand` VALUES ('36', 'LUNA BI', null, null, null, null);
INSERT INTO `brand` VALUES ('37', 'MARNI', null, null, null, null);
INSERT INTO `brand` VALUES ('38', 'MARIA CALDERARA', null, null, null, null);
INSERT INTO `brand` VALUES ('39', 'MSGM', null, null, null, null);
INSERT INTO `brand` VALUES ('40', 'ORION LONDON', null, null, null, null);
INSERT INTO `brand` VALUES ('41', 'PAULA CADEMARTORI', null, null, null, null);
INSERT INTO `brand` VALUES ('42', 'PREMIATA WHITE', null, null, null, null);
INSERT INTO `brand` VALUES ('43', 'ROBERTO DEL CARLO', null, null, null, null);
INSERT INTO `brand` VALUES ('44', 'SAMANTHA SUNG', null, null, null, null);
INSERT INTO `brand` VALUES ('45', 'SOHO DE LUXE', null, null, null, null);
INSERT INTO `brand` VALUES ('46', 'SO NICE', null, null, null, null);
INSERT INTO `brand` VALUES ('47', 'U’ AVIÙ', null, null, null, null);
INSERT INTO `brand` VALUES ('48', 'VOLTA', null, null, null, null);
INSERT INTO `brand` VALUES ('49', 'USLUAIRLINES', null, null, null, null);

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
INSERT INTO `campaigns` VALUES ('1', 'SALDI P/E 2014', '2014-10-28', '2014-12-31', '70');

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
INSERT INTO `customer` VALUES ('1', 'ANTANI', 'A', 'A', 'A', '1');

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
INSERT INTO `customer_roles` VALUES ('1', 'AMMINISTRATORE');

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
INSERT INTO `gender` VALUES ('1', 'en', 'SHOP');
INSERT INTO `gender` VALUES ('1', 'it', 'SHOP');

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
INSERT INTO `group_images` VALUES ('carousel', 'images/home', '20', '1080', '1560', '0');
INSERT INTO `group_images` VALUES ('new', 'images/home', '1', '130', '260', '0');
INSERT INTO `group_images` VALUES ('newArrivals', 'images/home', '6', '960', '960', '1');
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
INSERT INTO `material` VALUES ('1', 'en', 'COTTON');
INSERT INTO `material` VALUES ('1', 'it', 'COTONE');
INSERT INTO `material` VALUES ('2', 'en', 'SILK');
INSERT INTO `material` VALUES ('2', 'it', 'SETA');
INSERT INTO `material` VALUES ('3', 'en', 'BRUSHED CALF LEATHER');
INSERT INTO `material` VALUES ('3', 'it', 'VITELLO SPAZZOLATO');
INSERT INTO `material` VALUES ('4', 'en', 'NEOPRENE');
INSERT INTO `material` VALUES ('4', 'it', 'NEOPRENE');
INSERT INTO `material` VALUES ('5', 'en', 'POLIESTERE');
INSERT INTO `material` VALUES ('5', 'it', 'POLIESTERE');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('27', '1', '18', '37', '1250', '0', 'thumb20141027161832712&45239055TE_13P_F.jpg', '1', '2014-10-27 16:18:59', '1', '3', null, null);
INSERT INTO `product` VALUES ('28', '1', '7', '37', '350', '10', 'thumb20141027162532826&37585351NL_13P_e.jpg', '1', '2014-10-27 16:27:02', null, '4', null, null);
INSERT INTO `product` VALUES ('29', '1', '12', '37', '1090', '0', 'thumb20141028122536802&35226250HX_13P_e.jpg', '1', '2014-10-28 12:26:24', null, '5', null, null);

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
INSERT INTO `product_description` VALUES ('27', 'en', 'METAL TRUNK BAG');
INSERT INTO `product_description` VALUES ('27', 'it', 'BORSA METAL TRUNK');
INSERT INTO `product_description` VALUES ('28', 'en', 'FELPA DI SFILATA IN JERSEY ACCOPPIATO BICOLORE. ');
INSERT INTO `product_description` VALUES ('28', 'it', 'FELPA DI SFILATA IN JERSEY ACCOPPIATO BICOLORE. ');
INSERT INTO `product_description` VALUES ('29', 'en', 'GONNA IN TESSUTO TECNICO');
INSERT INTO `product_description` VALUES ('29', 'it', 'GONNA IN TESSUTO TECNICO');

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
INSERT INTO `product_image` VALUES ('27', '1', '20141027161832764&45239055TE_13P_a.jpg');
INSERT INTO `product_image` VALUES ('27', '2', '20141027161832712&45239055TE_13P_F.jpg');
INSERT INTO `product_image` VALUES ('27', '3', '20141027161832718&45239055TE_13P_e.jpg');
INSERT INTO `product_image` VALUES ('27', '4', '20141027161832744&45239055TE_13P_d.jpg');
INSERT INTO `product_image` VALUES ('29', '1', '20141028122536801&35226250HX_13P_F.jpg');
INSERT INTO `product_image` VALUES ('29', '2', '20141028122536801&35226250HX_13P_d.jpg');
INSERT INTO `product_image` VALUES ('29', '3', '20141028122536802&35226250HX_13P_e.jpg');
INSERT INTO `product_image` VALUES ('29', '4', '20141028122536801&35226250HX_13P_a.jpg');

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
INSERT INTO `shops` VALUES ('1', 'Siena', 'jacopo.frediani@banca.mps.it', 'Mag Boutique', 'Via dei Termini, 49', 'Siena', '53100', 'SI', 'Italia', '+39 0577 41043');

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
INSERT INTO `site_images` VALUES ('carousel', '1', 'carousel1.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '2', 'carousel2.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '3', 'carousel3.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '4', 'carousel4.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '5', 'carousel5.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '6', 'carousel6.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, null);
INSERT INTO `site_images` VALUES ('newArrivals', '1', 'new1.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('newArrivals', '2', 'new2.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, null);
INSERT INTO `site_images` VALUES ('tabNav', '1', 'logoTab2.png', '1', null, null);

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
INSERT INTO `type` VALUES ('1', 'en', 'ACCESSORIES');
INSERT INTO `type` VALUES ('1', 'it', 'ACCESSORI');
INSERT INTO `type` VALUES ('3', 'en', 'SHIRTS');
INSERT INTO `type` VALUES ('3', 'it', 'CAMICIE');
INSERT INTO `type` VALUES ('4', 'en', 'COATS');
INSERT INTO `type` VALUES ('4', 'it', 'CAPPOTTI');
INSERT INTO `type` VALUES ('5', 'en', 'DRESSES');
INSERT INTO `type` VALUES ('5', 'it', 'ABITI');
INSERT INTO `type` VALUES ('7', 'en', 'SWEATSHIRTS');
INSERT INTO `type` VALUES ('7', 'it', 'FELPE');
INSERT INTO `type` VALUES ('8', 'en', 'JACKETS');
INSERT INTO `type` VALUES ('8', 'it', 'GIACCHE');
INSERT INTO `type` VALUES ('9', 'en', 'LEATHER JACKETS');
INSERT INTO `type` VALUES ('9', 'it', 'GIACCHE DI PELLE');
INSERT INTO `type` VALUES ('11', 'en', 'CASUAL JACKETS');
INSERT INTO `type` VALUES ('11', 'it', 'GIUBBOTTI');
INSERT INTO `type` VALUES ('12', 'en', 'SKIRTS');
INSERT INTO `type` VALUES ('12', 'it', 'GONNE');
INSERT INTO `type` VALUES ('15', 'en', 'KNITWEAR');
INSERT INTO `type` VALUES ('15', 'it', 'MAGLIE');
INSERT INTO `type` VALUES ('16', 'en', 'PANTS');
INSERT INTO `type` VALUES ('16', 'it', 'PANTALONI');
INSERT INTO `type` VALUES ('17', 'en', 'CARDIGAN');
INSERT INTO `type` VALUES ('17', 'it', 'CARDIGAN');
INSERT INTO `type` VALUES ('18', 'en', 'BAGS');
INSERT INTO `type` VALUES ('18', 'it', 'BORSE');
INSERT INTO `type` VALUES ('19', 'en', 'TOPS');
INSERT INTO `type` VALUES ('19', 'it', 'CANOTTE');
INSERT INTO `type` VALUES ('20', 'en', 'SHOES');
INSERT INTO `type` VALUES ('20', 'it', 'SCARPE');
INSERT INTO `type` VALUES ('21', 'en', 'T-SHIRTS');
INSERT INTO `type` VALUES ('21', 'it', 'T-SHIRTS');

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
