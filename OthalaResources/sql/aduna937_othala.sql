/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : aduna937_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 15:31:47
*/

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
INSERT INTO `addresses` VALUES ('1', 'massimiliano_cencioni@tin.it', 'Massimiliano', 'Cencioni', 'Loc. La Ripa, via Don Dino Bandini', 'Siena', '53019', 'SI', 'ITALIA', '0577329180', '1', 'casa');
INSERT INTO `addresses` VALUES ('3', 'massimiliano_cencioni@tin.it', 'Massimiliano', 'Cencioni', 'Strada Cassia Sud, 15/A', 'Siena', '53100', 'SI', 'FRANCIA', '0577329180', '1', 'Lavoro');
INSERT INTO `addresses` VALUES ('4', 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aerea', 'siena', '53100', 'si', 'ITALIA', '3332965518', '0', 'casa');
INSERT INTO `addresses` VALUES ('20', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '0', 'CASA');
INSERT INTO `addresses` VALUES ('21', 'massimiliano_cencioni@tin.it', 'Massimiliano', ' Cencioni', 'Loc. La Ripa, via Don Dino Bandini', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '0577329180', '0', 'Home');

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
INSERT INTO `article` VALUES ('1', '0', '47', '11', '2', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG', '1', '0000000000000001', null, null, null);
INSERT INTO `article` VALUES ('1', '1', '49', '11', '0', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG', '1', '0000000000000002', null, null, null);
INSERT INTO `article` VALUES ('1', '2', '51', '11', '1', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG', '1', '0000000000000003', null, null, null);
INSERT INTO `article` VALUES ('2', '0', '46', '5', '1', '023_efe82016-122b-4068-925d-99991ed8922f.JPG', '1', '0000000000000004', null, null, null);
INSERT INTO `article` VALUES ('2', '1', '49', '5', '1', '023_efe82016-122b-4068-925d-99991ed8922f.JPG', '1', '0000000000000005', null, null, null);
INSERT INTO `article` VALUES ('3', '0', '37', '11', '1', '054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG', '1', '0000000000000006', null, null, null);
INSERT INTO `article` VALUES ('3', '1', '38', '11', '1', '054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG', '1', '0000000000000007', null, null, null);
INSERT INTO `article` VALUES ('3', '2', '39', '11', '1', '054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG', '1', '0000000000000008', null, null, null);
INSERT INTO `article` VALUES ('4', '0', '8', '11', '1', '026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG', '1', '0000000000000009', null, null, null);
INSERT INTO `article` VALUES ('4', '1', '9', '11', '1', '026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG', '1', '0000000000000010', null, null, null);
INSERT INTO `article` VALUES ('4', '2', '10', '11', '1', '026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG', '1', '0000000000000011', null, null, null);
INSERT INTO `article` VALUES ('5', '0', '9', '11', '1', '120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG', '1', '0000000000000012', null, null, null);
INSERT INTO `article` VALUES ('5', '1', '10', '11', '1', '120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG', '1', '0000000000000013', null, null, null);
INSERT INTO `article` VALUES ('6', '0', '17', '14', '1', '008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG', '1', '0000000000000014', null, null, null);
INSERT INTO `article` VALUES ('6', '1', '18', '14', '1', '008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG', '1', '0000000000000015', null, null, null);
INSERT INTO `article` VALUES ('6', '2', '19', '14', '1', '008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG', '1', '0000000000000016', null, null, null);
INSERT INTO `article` VALUES ('6', '3', '19', '9', '1', '008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG', '1', '0000000000000017', null, null, null);
INSERT INTO `article` VALUES ('6', '4', '17', '9', '1', '008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG', '1', '0000000000000018', null, null, null);
INSERT INTO `article` VALUES ('7', '0', '15', '11', '16', '003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG', '1', '0000000000000019', null, null, null);
INSERT INTO `article` VALUES ('8', '0', '17', '17', '17', '065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG', '1', '0000000000000020', null, null, null);
INSERT INTO `article` VALUES ('9', '0', '26', '10', '1', '011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG', '1', '0000000000000021', null, null, null);
INSERT INTO `article` VALUES ('9', '1', '27', '10', '1', '011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG', '1', '0000000000000022', null, null, null);
INSERT INTO `article` VALUES ('9', '2', '28', '10', '1', '011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG', '1', '0000000000000023', null, null, null);
INSERT INTO `article` VALUES ('10', '0', '22', '11', '1', 'PROVA1.JPG', '1', '0000000000000024', null, null, null);
INSERT INTO `article` VALUES ('15', '1', '37', '11', '1', 'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG', '1', '0000000000000025', null, null, null);
INSERT INTO `article` VALUES ('15', '2', '38', '11', '1', 'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG', '1', '0000000000000026', null, null, null);
INSERT INTO `article` VALUES ('15', '3', '39', '11', '1', 'thumb003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG', '1', '0000000000000027', null, null, null);
INSERT INTO `article` VALUES ('16', '1', '37', '11', '1', 'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG', '1', '0000000000000028', null, null, null);
INSERT INTO `article` VALUES ('16', '2', '38', '11', '1', 'thumb025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG', '1', '0000000000000029', null, null, null);
INSERT INTO `article` VALUES ('17', '1', '37', '5', '1', 'thumb003_85230538-e039-4964-aea8-2bbe15b56677.JPG', '1', '0000000000000030', null, null, null);
INSERT INTO `article` VALUES ('18', '1', '38', '4', '1', 'thumb055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG', '1', '0000000000000031', null, null, null);
INSERT INTO `article` VALUES ('19', '1', '37', '11', '1', 'thumb012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG', '1', '0000000000000032', null, null, null);
INSERT INTO `article` VALUES ('20', '1', '38', '14', '0', 'thumb022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG', '1', '0000000000000033', null, null, null);
INSERT INTO `article` VALUES ('21', '1', '37', '10', '1', 'thumb040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG', '1', '0000000000000034', null, null, null);
INSERT INTO `article` VALUES ('22', '1', '37', '13', '1', 'thumb020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG', '1', '0000000000000035', null, null, null);
INSERT INTO `article` VALUES ('23', '1', '37', '4', '1', 'thumb008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG', '1', '0000000000000036', null, null, null);
INSERT INTO `article` VALUES ('24', '1', '37', '5', '1', 'thumbfca2f34e-4be1-4b67-8000-1a81a2710618.JPG', '1', '0000000000000037', null, null, null);
INSERT INTO `article` VALUES ('25', '1', '37', '11', '1', 'thumb043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG', '1', '0000000000000038', null, null, null);

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
INSERT INTO `campaigns` VALUES ('1', 'SUPER SALE', '2014-09-18', '2014-12-31', '50');

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
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com', 'benito', 'JACOPO', 'FREDIANI', null, '2');
INSERT INTO `customer` VALUES ('massimiliano_cencioni@tin.it', 'stocazzo', 'Massimiliano', 'Cencioni', null, '2');
INSERT INTO `customer` VALUES ('simone.bagnolesi@gmail.com', 'didone', 'simone', 'bagnolesi', null, '2');

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
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('massimiliano_cencioni@tin.it', 'CUSTOMER');
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
INSERT INTO `delivery_cost` VALUES ('1', 'GLS Parcel camionistico', '7.90', '0', 'GLS Parcel camionistico', null);
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
INSERT INTO `gender` VALUES ('1', 'en', 'MAN');
INSERT INTO `gender` VALUES ('1', 'it', 'UOMO');
INSERT INTO `gender` VALUES ('2', 'en', 'WOMAN');
INSERT INTO `gender` VALUES ('2', 'it', 'DONNA');
INSERT INTO `gender` VALUES ('3', 'en', 'BOY');
INSERT INTO `gender` VALUES ('3', 'it', 'BAMBINO');
INSERT INTO `gender` VALUES ('4', 'en', 'GIRL');
INSERT INTO `gender` VALUES ('4', 'it', 'BAMBINA');
INSERT INTO `gender` VALUES ('5', 'en', 'UNISEX');
INSERT INTO `gender` VALUES ('5', 'it', 'UNISEX');

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
INSERT INTO `product` VALUES ('1', '1', '14', '1', '860', '20', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG', '1', '2014-12-14 16:00:00', '1', '1', '100', null);
INSERT INTO `product` VALUES ('2', '1', '14', '3', '398', '20', '023_efe82016-122b-4068-925d-99991ed8922f.JPG', '1', '2014-12-14 16:00:00', '1', '1', null, null);
INSERT INTO `product` VALUES ('3', '1', '16', '1', '1455', '50', '054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('4', '1', '9', '10', '4599', '50', '026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('5', '1', '5', '3', '975', '20', '120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('6', '1', '15', '11', '750', '50', '008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('7', '1', '21', '11', '1', '0', '003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('8', '1', '21', '10', '2', '50', '065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('9', '2', '20', '12', '200', '20', '011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('10', '2', '1', '13', '1590', '10', 'PROVA1.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('15', '1', '14', '14', '169', '20', '003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('16', '1', '14', '5', '475', '30', '025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('17', '1', '14', '15', '450', '30', '003_85230538-e039-4964-aea8-2bbe15b56677.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('18', '1', '14', '3', '340', '30', '055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('19', '1', '14', '16', '408', '50', '012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('20', '1', '14', '17', '250', '30', '022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('21', '1', '14', '18', '190', '20', '040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('22', '1', '14', '19', '360', '60', '020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('23', '1', '14', '19', '371', '30', '008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('24', '1', '14', '9', '390', '30', 'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('25', '1', '14', '13', '510', '50', '043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG', '1', '2014-12-14 16:00:00', null, '1', null, null);

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
INSERT INTO `product_description` VALUES ('1', 'en', 'JEANS BIKER \"551\" IN COTONE STRETCH 16.5CM');
INSERT INTO `product_description` VALUES ('1', 'it', 'JEANS BIKER \"551\" IN COTONE STRETCH 16.5CM');
INSERT INTO `product_description` VALUES ('2', 'en', 'JEANS SLIM FIT IN DENIM LAVATO STRETCH 18CM');
INSERT INTO `product_description` VALUES ('2', 'it', 'JEANS SLIM FIT IN DENIM LAVATO STRETCH 18CM');
INSERT INTO `product_description` VALUES ('3', 'en', 'PANTALONI BIKER IN NAPPA');
INSERT INTO `product_description` VALUES ('3', 'it', 'PANTALONI BIKER IN NAPPA');
INSERT INTO `product_description` VALUES ('4', 'en', 'GIACCA BIKER IN NAPPA E CAVALLINO STAMPA LEOPARD');
INSERT INTO `product_description` VALUES ('4', 'it', 'GIACCA BIKER IN NAPPA E CAVALLINO STAMPA LEOPARD');
INSERT INTO `product_description` VALUES ('5', 'en', 'ABITO \"TOKYO\" IN LANA STRETCH');
INSERT INTO `product_description` VALUES ('5', 'it', 'ABITO \"TOKYO\" IN LANA STRETCH');
INSERT INTO `product_description` VALUES ('6', 'en', 'CARDIGAN IN CASHMERE');
INSERT INTO `product_description` VALUES ('6', 'it', 'CARDIGAN IN CASHMERE');
INSERT INTO `product_description` VALUES ('7', 'en', 'T-SHIRT IN COTONE');
INSERT INTO `product_description` VALUES ('7', 'it', 'T-SHIRT IN COTONE');
INSERT INTO `product_description` VALUES ('8', 'en', 'T-SHIRT IN COTONE STAMPA LEOPARD');
INSERT INTO `product_description` VALUES ('8', 'it', 'T-SHIRT IN COTONE STAMPA LEOPARD');
INSERT INTO `product_description` VALUES ('9', 'en', 'STIVALI \"BAILEY BUTTON\" IN SHEARLING');
INSERT INTO `product_description` VALUES ('9', 'it', 'STIVALI \"BAILEY BUTTON\" IN SHEARLING');
INSERT INTO `product_description` VALUES ('10', 'en', 'BORSA MEDIA \"ANTIGONA\" IN PELLE MARTELLATA');
INSERT INTO `product_description` VALUES ('10', 'it', 'BORSA MEDIA \"ANTIGONA\" IN PELLE MARTELLATA');
INSERT INTO `product_description` VALUES ('15', 'en', 'JEANS SKINNY FIT \"JOEY\" IN DENIM STRETCH 16CM');
INSERT INTO `product_description` VALUES ('15', 'it', 'JEANS SKINNY FIT \"JOEY\" IN DENIM STRETCH 16CM');
INSERT INTO `product_description` VALUES ('16', 'en', 'JEANS GOLD FIT IN DENIM STRETCH 17CM');
INSERT INTO `product_description` VALUES ('16', 'it', 'JEANS GOLD FIT IN DENIM STRETCH 17CM');
INSERT INTO `product_description` VALUES ('17', 'en', 'JEANS IN DENIM GIAPPONESE 18CM');
INSERT INTO `product_description` VALUES ('17', 'it', 'JEANS IN DENIM GIAPPONESE 18CM');
INSERT INTO `product_description` VALUES ('18', 'en', 'JEANS WORKWEAR FIT IN DENIM STRETCH 20CM');
INSERT INTO `product_description` VALUES ('18', 'it', 'JEANS WORKWEAR FIT IN DENIM STRETCH 20CM');
INSERT INTO `product_description` VALUES ('19', 'en', 'JEANS IN COTONE PETTINATO 18CM');
INSERT INTO `product_description` VALUES ('19', 'it', 'JEANS IN COTONE PETTINATO 18CM');
INSERT INTO `product_description` VALUES ('20', 'en', 'JEANS BIKER IN DENIM SPALMATO 16.5CM');
INSERT INTO `product_description` VALUES ('20', 'it', 'JEANS BIKER IN DENIM SPALMATO 16.5CM');
INSERT INTO `product_description` VALUES ('21', 'en', 'JEANS \"THAVAR\" IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('21', 'it', 'JEANS \"THAVAR\" IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('22', 'en', 'JEANS IN DENIM STRETCH STAMPA VICHY');
INSERT INTO `product_description` VALUES ('22', 'it', 'JEANS IN DENIM STRETCH STAMPA VICHY');
INSERT INTO `product_description` VALUES ('23', 'en', 'JEANS IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('23', 'it', 'JEANS IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('24', 'en', 'JEANS IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('24', 'it', 'JEANS IN DENIM STRETCH 18CM');
INSERT INTO `product_description` VALUES ('25', 'en', 'JEANS SLIM FIT IN DENIM E PELLE 18.5CM');
INSERT INTO `product_description` VALUES ('25', 'it', 'JEANS SLIM FIT IN DENIM E PELLE 18.5CM');

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
INSERT INTO `product_image` VALUES ('1', '1', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84.JPG');
INSERT INTO `product_image` VALUES ('1', '2', '015_342e483b-1f2a-4c4c-8fe6-9eaaa3f34d84 (1).JPG');
INSERT INTO `product_image` VALUES ('1', '3', '015_697a3f52-f887-4fdc-91ae-d05a504c2e00.JPG');
INSERT INTO `product_image` VALUES ('1', '4', '015_d73b577a-bd5c-4cf3-8bdc-e2eb44873887.JPG');
INSERT INTO `product_image` VALUES ('2', '1', '023_26a20207-914d-4606-85ab-b707fb078a04.JPG');
INSERT INTO `product_image` VALUES ('2', '2', '023_c5306e23-0ab3-4fb7-8ff5-5e7445a83a0e.JPG');
INSERT INTO `product_image` VALUES ('2', '3', '023_efe82016-122b-4068-925d-99991ed8922f.JPG');
INSERT INTO `product_image` VALUES ('2', '4', '023_112b0ff6-f728-4408-9806-e3654bda598c.JPG');
INSERT INTO `product_image` VALUES ('3', '1', '054_d261c3d5-5a7b-4f8e-8539-0e43c8d8e3a9.JPG');
INSERT INTO `product_image` VALUES ('3', '2', '054_00cba355-d889-49d6-906e-a7b9919aa34a.JPG');
INSERT INTO `product_image` VALUES ('3', '3', '054_92f14550-41b0-493c-88b1-a3c5fd2bd8fc.JPG');
INSERT INTO `product_image` VALUES ('3', '4', '054_c2f6a372-ecba-40df-9699-4b0ff2cf08b2.JPG');
INSERT INTO `product_image` VALUES ('4', '1', '026_fced865f-1c7b-4488-a7c4-33738ab38430.JPG');
INSERT INTO `product_image` VALUES ('4', '2', '026_7a3dfec3-2e2d-4fea-be77-acffae8e7133.JPG');
INSERT INTO `product_image` VALUES ('4', '3', '026_3428de0d-1480-4b7c-a34c-50fc6eae7fa8.JPG');
INSERT INTO `product_image` VALUES ('4', '4', '026_6a79d0a9-cb4f-4c6d-bcbd-0ae54f1bd65d.JPG');
INSERT INTO `product_image` VALUES ('5', '1', '120_4089452a-2b9a-4aa8-b1fd-f79fa26d0618.JPG');
INSERT INTO `product_image` VALUES ('5', '2', '120_3a616744-2764-4b64-9dbe-3384372399dc.JPG');
INSERT INTO `product_image` VALUES ('5', '3', '120_d6a23ed9-26ec-4b99-8893-69c85327a8fe.JPG');
INSERT INTO `product_image` VALUES ('5', '4', '120_e8d7c8a3-6aec-41e8-86db-5fb28fabb3d5.JPG');
INSERT INTO `product_image` VALUES ('6', '1', '008_2ec8b628-6a31-41cb-936b-3cc0632c8fd9.JPG');
INSERT INTO `product_image` VALUES ('6', '2', '008_4ab0ab04-2f7e-4dbc-9815-fbfcb979c52d.JPG');
INSERT INTO `product_image` VALUES ('6', '3', '008_9bb2e158-4163-4165-bcf5-f5c87dbe24a8.JPG');
INSERT INTO `product_image` VALUES ('6', '4', '008_34e601f1-3a6b-467d-8d64-482e2c7d5b24.JPG');
INSERT INTO `product_image` VALUES ('6', '5', '008_7390c5c8-1e1e-47ce-bdf5-d7565e597640.JPG');
INSERT INTO `product_image` VALUES ('6', '6', '008_62c79152-c91b-4fc1-a38c-9082914fd049.JPG');
INSERT INTO `product_image` VALUES ('7', '1', '003_f3b3b7d3-9a6d-4803-baf1-15231f462f5c.JPG');
INSERT INTO `product_image` VALUES ('7', '2', '003_801cd143-503b-4f65-935d-82d852ed71c9.JPG');
INSERT INTO `product_image` VALUES ('7', '3', '003_a3b95fd2-eef9-4588-9089-c904177dfb27.JPG');
INSERT INTO `product_image` VALUES ('7', '4', '003_6117ed2a-7d3b-48cd-8a6d-15143f928e83.JPG');
INSERT INTO `product_image` VALUES ('8', '1', '065_5b5310ef-6f71-4a88-8bc6-f21d7fc71296.JPG');
INSERT INTO `product_image` VALUES ('8', '2', '065_9e30560c-0c52-4b16-b839-163534ebcaa1.JPG');
INSERT INTO `product_image` VALUES ('8', '3', '065_953e8ced-163d-4a41-9988-ec636f95962a.JPG');
INSERT INTO `product_image` VALUES ('8', '4', '065_a50bdf29-2c63-4f9c-b2ab-a4d92ff18cc2.JPG');
INSERT INTO `product_image` VALUES ('9', '1', '011_7f6ea013-4654-4246-93c4-378a56e5271f.JPG');
INSERT INTO `product_image` VALUES ('9', '2', '011_6ec8a633-85b6-4f20-a4cf-692fcaa338f6.JPG');
INSERT INTO `product_image` VALUES ('9', '3', '011_025afb73-277b-42ba-b99d-09ea4b0caa39.JPG');
INSERT INTO `product_image` VALUES ('9', '4', '011_dcf104bc-3798-4b88-b8d3-a261e2efb4ee.JPG');
INSERT INTO `product_image` VALUES ('10', '1', 'PROVA1.JPG');
INSERT INTO `product_image` VALUES ('10', '2', 'PROVA2.JPG');
INSERT INTO `product_image` VALUES ('10', '3', 'PROVA3.JPG');
INSERT INTO `product_image` VALUES ('10', '4', 'PROVA4.JPG');
INSERT INTO `product_image` VALUES ('15', '1', '003_7700b271-6cfc-45be-8b8c-1a89f67f8eba.JPG');
INSERT INTO `product_image` VALUES ('15', '2', '003_83d4e6f9-4fd3-4ce0-ae8f-c93054c33155.JPG');
INSERT INTO `product_image` VALUES ('15', '3', '003_7968da63-605e-4eba-9ffe-325e45935c62.JPG');
INSERT INTO `product_image` VALUES ('15', '4', '003_ed654a8f-0000-4efe-bfdb-ab2a9416af67.JPG');
INSERT INTO `product_image` VALUES ('16', '1', '025_baed240d-2048-4f02-b7fe-fc94831ca511.JPG');
INSERT INTO `product_image` VALUES ('16', '2', '025_1e45bfc0-5e0f-4fee-b604-e2bf082773d3.JPG');
INSERT INTO `product_image` VALUES ('16', '3', '025_81cd6a43-f5e1-4a9f-bfa0-7159ec31a307.JPG');
INSERT INTO `product_image` VALUES ('16', '4', '025_f1a41787-6ae4-4945-bec7-be3da27396cd.JPG');
INSERT INTO `product_image` VALUES ('17', '1', '003_85230538-e039-4964-aea8-2bbe15b56677.JPG');
INSERT INTO `product_image` VALUES ('17', '2', '003_731bed23-6f4c-4419-84bb-b48cc0dcfce8.JPG');
INSERT INTO `product_image` VALUES ('17', '3', '003_806ff603-8bbb-406f-8232-284bb33bec67.JPG');
INSERT INTO `product_image` VALUES ('17', '4', '003_f1d1ef5b-091a-4f8c-9c1e-923dd5d23a57.JPG');
INSERT INTO `product_image` VALUES ('18', '1', '055_854b165c-4b47-4e24-96ec-2a68a21daf10.JPG');
INSERT INTO `product_image` VALUES ('18', '2', '055_46535f29-12a3-40f3-a130-f8e76e37c1e3.JPG');
INSERT INTO `product_image` VALUES ('18', '3', '055_7291a518-cb89-47e9-925a-5196451f1ece.JPG');
INSERT INTO `product_image` VALUES ('18', '4', '055_6e9aa406-ef61-4c55-8f0b-759095a4d57c.JPG');
INSERT INTO `product_image` VALUES ('19', '1', '012_d46534ad-1ea2-4ef2-b4af-0d317891645b.JPG');
INSERT INTO `product_image` VALUES ('19', '2', '012_c3cf063a-10f8-41b3-b6e9-f14f7f459b46.JPG');
INSERT INTO `product_image` VALUES ('19', '3', '012_23bbd8bf-9a96-461d-b9f4-cf01127bccaf.JPG');
INSERT INTO `product_image` VALUES ('19', '4', '012_e6fefe91-036b-4de5-a9f9-973cfcf1696f.JPG');
INSERT INTO `product_image` VALUES ('20', '1', '022_b26ba042-3f5a-4600-8af9-bce69781ed98.JPG');
INSERT INTO `product_image` VALUES ('20', '2', '022_d4cbf502-0ab4-4a2b-acc8-bd3bc0e02c87.JPG');
INSERT INTO `product_image` VALUES ('20', '3', '022_f1ef58d9-596d-4ff7-b6e7-4fffd42f61db.JPG');
INSERT INTO `product_image` VALUES ('20', '4', '022_ffdca271-37d4-4147-80de-ab7721f09f93.JPG');
INSERT INTO `product_image` VALUES ('21', '1', '040_25805c4b-25cc-4dd4-9b30-71dab091b44d.JPG');
INSERT INTO `product_image` VALUES ('21', '2', '040_f00f530e-c8d2-42c6-b0c1-b6dd9338c0c7.JPG');
INSERT INTO `product_image` VALUES ('21', '3', '040_ff2ba8f3-6d71-4f75-9b5b-a262ce1f59a9.JPG');
INSERT INTO `product_image` VALUES ('21', '4', '039_9131e4dc-a8a2-4d92-9cf7-de8a470b222c.JPG');
INSERT INTO `product_image` VALUES ('22', '1', '020_09f82cf0-34e4-4598-816f-29c630287b3a.JPG');
INSERT INTO `product_image` VALUES ('22', '2', '020_a2730963-ee2b-47da-9bb4-1fb145330b9e.JPG');
INSERT INTO `product_image` VALUES ('22', '3', '020_a397657f-babb-48f9-8360-2399eb996cf8.JPG');
INSERT INTO `product_image` VALUES ('22', '4', '020_7d08e0d4-7de7-4506-b267-d688bb2cb2c3.JPG');
INSERT INTO `product_image` VALUES ('23', '1', '008_66e7749a-5124-4d40-b43a-15b119f5649a.JPG');
INSERT INTO `product_image` VALUES ('23', '2', '008_235f96a6-3230-401b-84cf-41e439e3aba8.JPG');
INSERT INTO `product_image` VALUES ('23', '3', '029_04310ecd-36de-4b5d-9d3d-7d321965f771.JPG');
INSERT INTO `product_image` VALUES ('23', '4', '008_3771b55c-24a1-4840-b36d-37e86cd88624.JPG');
INSERT INTO `product_image` VALUES ('24', '1', 'bbf3d1ae-1a78-4c2b-962a-5500a2e277aa.JPG');
INSERT INTO `product_image` VALUES ('24', '2', '45149579-cc17-4465-9c96-1629f4a76610.JPG');
INSERT INTO `product_image` VALUES ('24', '3', 'fca2f34e-4be1-4b67-8000-1a81a2710618.JPG');
INSERT INTO `product_image` VALUES ('24', '4', '597df317-5b60-4cca-93ed-ea8be920e8f2.JPG');
INSERT INTO `product_image` VALUES ('25', '1', '043_304ca69a-78e4-430b-8e79-a1c051d157ca (1).JPG');
INSERT INTO `product_image` VALUES ('25', '2', '043_304ca69a-78e4-430b-8e79-a1c051d157ca.JPG');
INSERT INTO `product_image` VALUES ('25', '3', '043_e2ab1d80-424e-4f37-9b78-a5e9e8688cfc.JPG');
INSERT INTO `product_image` VALUES ('25', '4', '043_fcbd7e18-20e4-4cfe-a0cc-aa10907b55b0.JPG');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `shops` VALUES ('1', 'Siena - negozio1', 'adunatasoftware@gmail.com', 'NomeNegozio1', 'IndirizzoNegozio1', 'Siena', '53100', 'SI', 'Italia', 'TelNegozio1');
INSERT INTO `shops` VALUES ('2', 'Siena - negozio2', 'adunatasoftware@gmail.com', 'NomeNegozio2', 'IndirizzoNegozio2', 'Siena', '53100', 'SI', 'Italia', 'TelNegozio2');

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
INSERT INTO `site_images` VALUES ('carousel', '1', 'A2.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '2', 'A1.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '3', 'A3.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('carousel', '4', 'A4.jpg', null, null, null);
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, null);
INSERT INTO `site_images` VALUES ('newArrivals', '1', 'newuomo2.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('newArrivals', '2', 'newdonna2.jpg', '2', '/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0', null);
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, null);
INSERT INTO `site_images` VALUES ('tabNav', '1', 'logoTab2.png', '1', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '2', 'logoTab2.png', '2', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '3', 'logoTab2.png', '3', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '4', 'logoTab2.png', '4', null, null);
INSERT INTO `site_images` VALUES ('tabNav', '5', 'logoTab2.png', '5', null, null);

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
INSERT INTO `size` VALUES ('23', '34');
INSERT INTO `size` VALUES ('24', '35');
INSERT INTO `size` VALUES ('25', '36');
INSERT INTO `size` VALUES ('26', '37');
INSERT INTO `size` VALUES ('27', '38');
INSERT INTO `size` VALUES ('28', '39');
INSERT INTO `size` VALUES ('29', '40');
INSERT INTO `size` VALUES ('30', '41');
INSERT INTO `size` VALUES ('31', '42');
INSERT INTO `size` VALUES ('32', '43');
INSERT INTO `size` VALUES ('33', '44');
INSERT INTO `size` VALUES ('34', '45');
INSERT INTO `size` VALUES ('35', '46');
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
INSERT INTO `size` VALUES ('47', '34');
INSERT INTO `size` VALUES ('48', '35');
INSERT INTO `size` VALUES ('49', '36');
INSERT INTO `size` VALUES ('50', '37');
INSERT INTO `size` VALUES ('51', '38');
INSERT INTO `size` VALUES ('52', '39');
INSERT INTO `size` VALUES ('53', '40');
INSERT INTO `size` VALUES ('54', '41');
INSERT INTO `size` VALUES ('55', '42');

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
