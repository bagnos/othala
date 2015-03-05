/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : fands000_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 15:04:58
*/
drop schema if exists fands000_othala;
create schema fands000_othala;
use fands000_othala;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
INSERT INTO `article` VALUES ('29', '1', '1', '1', '10', 'thumb20150203170539170&_MG_1887 copia.jpg', '1', '000001', '8.00', null, '0');
INSERT INTO `article` VALUES ('30', '1', '1', '1', '10', 'thumb20150204110140873&_MG_1912 copia.jpg', '1', '000002', '7.00', null, '0');
INSERT INTO `article` VALUES ('30', '2', '2', '1', '10', 'thumb20150204110140873&_MG_1912 copia.jpg', '1', '000003', '14.00', null, '0');
INSERT INTO `article` VALUES ('31', '1', '3', '1', '20', 'thumb20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg', '1', '000003', '28.50', null, '0');
INSERT INTO `article` VALUES ('32', '1', '4', '1', '100', 'thumb20150209124810275&geometra.jpg', '1', '100000', '50.00', null, '0');
INSERT INTO `article` VALUES ('33', '1', '4', '1', '100', 'thumb20150209124810275&geometra.jpg', '1', '100001', '100.00', null, '0');
INSERT INTO `article` VALUES ('34', '1', '4', '1', '100', 'thumb20150209124810275&geometra.jpg', '1', '100002', '100.00', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('20', 'LE VIGNE DI SAN PIETRO', '17', '71', 'info@levignedisanpietro.it', 'levignedisanpietro.jpg');
INSERT INTO `brand` VALUES ('21', 'LA GENUINA', '2', '44', 'info@lagenuina.it', 'lagenuina.jpg');
INSERT INTO `brand` VALUES ('22', 'Geometra', null, null, null, null);

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
INSERT INTO `brand_descr` VALUES ('20', 'en', 'Le Vigne di San Pietro sono un piccolo paradiso immerso nelle colline moreniche tra Verona e il Garda, a due passi dalla città ma nascosto alla vista dei più. È proprio qui che Sergio Nerozzi, imprenditore e architetto, decise di fermarsi per dedicarsi alla produzione di vino e cambiare la qualità della propria vita. La scelta è immediata e precisa: i vini delle Vigne di San Pietro devono essere altamente pregiati, eleganti e capaci di esprimere il proprio carattere nel tempo. Oggi Carlo, affiancato dalla moglie Regina, gestisce da solo l’azienda con la stessa filosofia ereditata da suo padre e con la stessa attenzione per l’ambiente. Le tecniche colturali sono rispettose dei terreni, orientate ad una bassa resa per ettaro e alla produzione di uve sane che vengono raccolte a mano. Dopo alcuni anni, gli ettari di vigneto passano dai 4 iniziali ai 10 attuali e la produzione di bottiglie arriva a sole 60.000 l’anno.');
INSERT INTO `brand_descr` VALUES ('20', 'it', 'Le Vigne di San Pietro sono un piccolo paradiso immerso nelle colline moreniche tra Verona e il Garda, a due passi dalla città ma nascosto alla vista dei più. È proprio qui che Sergio Nerozzi, imprenditore e architetto, decise di fermarsi per dedicarsi alla produzione di vino e cambiare la qualità della propria vita. La scelta è immediata e precisa: i vini delle Vigne di San Pietro devono essere altamente pregiati, eleganti e capaci di esprimere il proprio carattere nel tempo. Oggi Carlo, affiancato dalla moglie Regina, gestisce da solo l’azienda con la stessa filosofia ereditata da suo padre e con la stessa attenzione per l’ambiente. Le tecniche colturali sono rispettose dei terreni, orientate ad una bassa resa per ettaro e alla produzione di uve sane che vengono raccolte a mano. Dopo alcuni anni, gli ettari di vigneto passano dai 4 iniziali ai 10 attuali e la produzione di bottiglie arriva a sole 60.000 l’anno.');
INSERT INTO `brand_descr` VALUES ('21', 'en', 'Un antico edificio del XII secolo che a tutto farebbe pensare fuorché a una macelleria, una vera e propria \'\'bottega delle carni\'\' che Luciano Caracciolo e sua moglie Domenica hanno deciso di vestire con un abito che rendesse merito alla qualità e alla tradizionalità delle loro lavorazioni.Il laboratorio - con annessa sala degustazioni - si trova nel cuore del borgo antico di Carunchio, dove ogni giorno è possibile scegliere tra un’eccellente selezione di carni certificate e salumi tipici abruzzesi lavorati artigianalmente con una ritualità e un’attenzione ormai rare.Facendo tesoro del sapere tramandato da chi ha vissuto le colline e le montagne dell’Alto Vastese, La Genuina infonde a ogni suo prodotto lo stesso spirito e la stessa esperienza di un tempo, potendo contare su strutture all’avanguardia e ingredienti locali di primissima scelta.');
INSERT INTO `brand_descr` VALUES ('21', 'it', 'Un antico edificio del XII secolo che a tutto farebbe pensare fuorché a una macelleria, una vera e propria \'\'bottega delle carni\'\' che Luciano Caracciolo e sua moglie Domenica hanno deciso di vestire con un abito che rendesse merito alla qualità e alla tradizionalità delle loro lavorazioni.Il laboratorio - con annessa sala degustazioni - si trova nel cuore del borgo antico di Carunchio, dove ogni giorno è possibile scegliere tra un’eccellente selezione di carni certificate e salumi tipici abruzzesi lavorati artigianalmente con una ritualità e un’attenzione ormai rare.Facendo tesoro del sapere tramandato da chi ha vissuto le colline e le montagne dell’Alto Vastese, La Genuina infonde a ogni suo prodotto lo stesso spirito e la stessa esperienza di un tempo, potendo contare su strutture all’avanguardia e ingredienti locali di primissima scelta.');
INSERT INTO `brand_descr` VALUES ('22', 'en', null);
INSERT INTO `brand_descr` VALUES ('22', 'it', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `color` VALUES ('1', 'en', 'N/A');
INSERT INTO `color` VALUES ('1', 'it', 'N/A');

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
INSERT INTO `customer` VALUES ('shop@foods&services.it', 'shop@f&s', 'A', 'A', 'A', '1');
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
INSERT INTO `customer_roles` VALUES ('shop@foods&services.it', 'AMMINISTRATORE');
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
INSERT INTO `gender` VALUES ('1', 'en', 'Foods');
INSERT INTO `gender` VALUES ('1', 'it', 'Foods');
INSERT INTO `gender` VALUES ('2', 'en', 'Beverages');
INSERT INTO `gender` VALUES ('2', 'it', 'Beverages');
INSERT INTO `gender` VALUES ('3', 'en', 'Services');
INSERT INTO `gender` VALUES ('3', 'it', 'Services');

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
INSERT INTO `infaggiuntive` VALUES ('1', 'en', 'Dettagli aggiuntivi');
INSERT INTO `infaggiuntive` VALUES ('1', 'it', 'Dettagli aggiuntivi');
INSERT INTO `infaggiuntive` VALUES ('2', 'en', 'Ingredienti');
INSERT INTO `infaggiuntive` VALUES ('2', 'it', 'Ingredienti');
INSERT INTO `infaggiuntive` VALUES ('3', 'en', 'Consigli d\'uso');
INSERT INTO `infaggiuntive` VALUES ('3', 'it', 'Consigli d\'uso');
INSERT INTO `infaggiuntive` VALUES ('4', 'en', 'Descrizione');
INSERT INTO `infaggiuntive` VALUES ('4', 'it', 'Descrizione');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------
INSERT INTO `mail` VALUES ('1', '1', 'jacopo.frediani@gmail.com', null);

-- ----------------------------
-- Table structure for `mail_group`
-- ----------------------------
DROP TABLE IF EXISTS `mail_group`;
CREATE TABLE `mail_group` (
  `idMailGroup` int(11) NOT NULL AUTO_INCREMENT,
  `txMailGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idMailGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_group
-- ----------------------------
INSERT INTO `mail_group` VALUES ('1', 'Online');

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
INSERT INTO `material` VALUES ('1', 'en', 'N/A');
INSERT INTO `material` VALUES ('1', 'it', 'N/A');

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
  CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_coupons1` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('29', '2', '9', '20', '8', '0', 'thumb20150203170539170&_MG_1887 copia.jpg', '1', '2015-02-03 17:06:19', null, '1', null, '1');
INSERT INTO `product` VALUES ('30', '2', '9', '20', '7', '0', 'thumb20150204110140873&_MG_1912 copia.jpg', '1', '2015-02-04 11:02:59', null, '1', null, '1');
INSERT INTO `product` VALUES ('31', '1', '11', '21', '29', '0', 'thumb20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg', '1', '2015-02-04 11:50:13', null, '1', null, '1');
INSERT INTO `product` VALUES ('32', '3', '16', '22', '50', '0', 'thumb20150209124810275&geometra.jpg', '1', '2015-02-09 12:48:44', null, '1', null, '2');
INSERT INTO `product` VALUES ('33', '3', '16', '22', '100', '0', 'thumb20150209124810275&geometra.jpg', '1', '2015-02-09 12:48:44', null, '1', null, '2');
INSERT INTO `product` VALUES ('34', '3', '17', '22', '100', '0', 'thumb20150209124810275&geometra.jpg', '1', '2015-02-09 12:48:44', null, '1', null, '2');

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
INSERT INTO `product_description` VALUES ('29', 'en', 'CUSTOZA DOC');
INSERT INTO `product_description` VALUES ('29', 'it', 'CUSTOZA DOC');
INSERT INTO `product_description` VALUES ('30', 'en', 'BARDOLINO DOC');
INSERT INTO `product_description` VALUES ('30', 'it', 'BARDOLINO DOC');
INSERT INTO `product_description` VALUES ('31', 'en', 'CAPOCOLLO');
INSERT INTO `product_description` VALUES ('31', 'it', 'CAPOCOLLO');
INSERT INTO `product_description` VALUES ('32', 'en', 'Stime Immobiliari');
INSERT INTO `product_description` VALUES ('32', 'it', 'Stime Immobiliari');
INSERT INTO `product_description` VALUES ('33', 'en', 'Agevolazioni Fiscali');
INSERT INTO `product_description` VALUES ('33', 'it', 'Agevolazioni Fiscali');
INSERT INTO `product_description` VALUES ('34', 'en', 'Confini di Proprietà');
INSERT INTO `product_description` VALUES ('34', 'it', 'Confini di Proprietà');

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
INSERT INTO `product_image` VALUES ('29', '1', '20150203170539170&_MG_1887 copia.jpg');
INSERT INTO `product_image` VALUES ('29', '2', '20150203170544981&_MG_1864 copia.jpg');
INSERT INTO `product_image` VALUES ('29', '3', '20150203170545031&_MG_1874 copia.jpg');
INSERT INTO `product_image` VALUES ('29', '4', '20150203170544721&_MG_1854 copia.jpg');
INSERT INTO `product_image` VALUES ('30', '1', '20150204110140873&_MG_1912 copia.jpg');
INSERT INTO `product_image` VALUES ('30', '2', '20150204110147840&_MG_1929 copia.jpg');
INSERT INTO `product_image` VALUES ('30', '3', '20150204110147869&_MG_1939 copia.jpg');
INSERT INTO `product_image` VALUES ('31', '1', '20150204114851271&Capocollo_La_Genuina_foodscovery (1).jpg');
INSERT INTO `product_image` VALUES ('31', '2', '20150204114900354&Capocollo_La_Genuina_foodscovery (3).jpg');
INSERT INTO `product_image` VALUES ('31', '3', '20150204114900852&Capocollo_La_Genuina_foodscovery (10).jpg');
INSERT INTO `product_image` VALUES ('31', '4', '20150204114900605&Capocollo_La_Genuina_foodscovery (12).jpg');
INSERT INTO `product_image` VALUES ('31', '5', '20150204114900412&Capocollo_La_Genuina_foodscovery (4).jpg');
INSERT INTO `product_image` VALUES ('32', '1', '20150209124810275&geometra.jpg');
INSERT INTO `product_image` VALUES ('33', '1', '20150209124810275&geometra.jpg');
INSERT INTO `product_image` VALUES ('34', '1', '20150209124810275&geometra.jpg');

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
INSERT INTO `product_info` VALUES ('29', '1', 'en', 'Alc. 12,5°. Vendemmia: 2013');
INSERT INTO `product_info` VALUES ('29', '1', 'it', 'Alc. 12,5°. Vendemmia: 2013');
INSERT INTO `product_info` VALUES ('29', '2', 'en', 'Uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco.');
INSERT INTO `product_info` VALUES ('29', '2', 'it', 'Uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco.');
INSERT INTO `product_info` VALUES ('29', '3', 'en', 'Abbinamenti: Salumi, Tortellini di Valeggio al burro e salvia, Pesce azzurro alla griglia.');
INSERT INTO `product_info` VALUES ('29', '3', 'it', 'Abbinamenti: Salumi, Tortellini di Valeggio al burro e salvia, Pesce azzurro alla griglia.');
INSERT INTO `product_info` VALUES ('29', '4', 'en', 'Bianco profumato da sentori di mela e altre essenze aromatiche. Con il suo gusto persistente e sapido, in bocca risulta piacevole ed equilibratamente acido. Il Custoza DOC viene realizzato con la vinificazione separata di 5 uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco. Ha una buona capacità di evoluzione nel tempo, con un aumento delle note minerali e un mantenimento dell’acidità anche per diversi anni.');
INSERT INTO `product_info` VALUES ('29', '4', 'it', 'Bianco profumato da sentori di mela e altre essenze aromatiche. Con il suo gusto persistente e sapido, in bocca risulta piacevole ed equilibratamente acido. Il Custoza DOC viene realizzato con la vinificazione separata di 5 uve: Garganega, Trebbiano, Trebbianello, Cortese e Canzoni Bianco. Ha una buona capacità di evoluzione nel tempo, con un aumento delle note minerali e un mantenimento dell’acidità anche per diversi anni.');
INSERT INTO `product_info` VALUES ('30', '1', 'en', 'Alc. 12°');
INSERT INTO `product_info` VALUES ('30', '1', 'it', 'Alc. 12°');
INSERT INTO `product_info` VALUES ('30', '2', 'en', 'Uve: Corvina, Rondinella, Merlot.');
INSERT INTO `product_info` VALUES ('30', '2', 'it', 'Uve: Corvina, Rondinella, Merlot.');
INSERT INTO `product_info` VALUES ('30', '3', 'en', 'Abbinamenti: Piatti mediterranei, zuppe di funghi, carni rosse, pesce in brodetto, carpacci e fritture di pesce.');
INSERT INTO `product_info` VALUES ('30', '3', 'it', 'Abbinamenti: Piatti mediterranei, zuppe di funghi, carni rosse, pesce in brodetto, carpacci e fritture di pesce.');
INSERT INTO `product_info` VALUES ('30', '4', 'en', 'Rosso di buona personalità con note speziate che tendono ad affermarsi con il tempo. I sentori di pepe nero si avvertono tanto all’olfatto quanto al gusto, accompagnati da morbidi tannini e frutti rossi. Le uve utilizzate per la realizzazione del Bardolino DOC sono la Corvina, in quantità preponderante, seguita da Rondinella e Merlot. È il primo Bardolino della storia ad aver ottenuto i Tre Bicchieri del Gambero.');
INSERT INTO `product_info` VALUES ('30', '4', 'it', 'Rosso di buona personalità con note speziate che tendono ad affermarsi con il tempo. I sentori di pepe nero si avvertono tanto all’olfatto quanto al gusto, accompagnati da morbidi tannini e frutti rossi. Le uve utilizzate per la realizzazione del Bardolino DOC sono la Corvina, in quantità preponderante, seguita da Rondinella e Merlot. È il primo Bardolino della storia ad aver ottenuto i Tre Bicchieri del Gambero.');
INSERT INTO `product_info` VALUES ('31', '2', 'en', 'Collo suino, sale, pepe, aromi naturali.');
INSERT INTO `product_info` VALUES ('31', '2', 'it', 'Collo suino, sale, pepe, aromi naturali.');
INSERT INTO `product_info` VALUES ('31', '4', 'en', 'Sapore intenso e avvolgente che, per molti aspetti, risulta affine a quello di un buon prosciutto crudo stagionato. Il Capocollo si ottiene utilizzando l’intero muscolo del collo, porzione a cui deve il suo nome. La carne, piuttosto magra, generalmente si rivela al taglio con una striscia di grasso centrale. Ideale per antipasti all’italiana o misticanze di salumi.');
INSERT INTO `product_info` VALUES ('31', '4', 'it', 'Sapore intenso e avvolgente che, per molti aspetti, risulta affine a quello di un buon prosciutto crudo stagionato. Il Capocollo si ottiene utilizzando l’intero muscolo del collo, porzione a cui deve il suo nome. La carne, piuttosto magra, generalmente si rivela al taglio con una striscia di grasso centrale. Ideale per antipasti all’italiana o misticanze di salumi.');

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
INSERT INTO `shops` VALUES ('1', 'Siena', 'jacopo.frediani@gmail.com', 'Foods & Services', 'Piazza del Campo, 1', 'Siena', '53100', 'SI', 'Italia', '+390577280000');

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
INSERT INTO `site_images` VALUES ('carousel', '1', '03022015152332702&foto 1.JPG', null, null, 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('carousel', '2', '03022015152354488&foto 2.JPG', null, null, 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('carousel', '3', '03022015152400237&foto 3.JPG', null, null, 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('newArrivals', '1', 'newuomo2.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('newArrivals', '2', 'newdonna2.jpg', '2', '/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, 'Shop Online Foods & Services');
INSERT INTO `site_images` VALUES ('tabNav', '1', '03022015170141523&foods1.JPG', '1', null, 'Foods');
INSERT INTO `site_images` VALUES ('tabNav', '2', '03022015170156890&foods.JPG', '2', null, 'Beverages');
INSERT INTO `site_images` VALUES ('tabNav', '3', '09022015130447439&24-professionisti.jpg', '3', null, 'Services');

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
INSERT INTO `size` VALUES ('1', '750 ml');
INSERT INTO `size` VALUES ('2', '1500 ml');
INSERT INTO `size` VALUES ('3', '1250 GR CIRCA');
INSERT INTO `size` VALUES ('4', 'N/A');

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
INSERT INTO `type` VALUES ('1', 'en', 'Confetture e Miele');
INSERT INTO `type` VALUES ('1', 'it', 'Confetture e Miele');
INSERT INTO `type` VALUES ('2', 'en', 'Condimenti e Spezie');
INSERT INTO `type` VALUES ('2', 'it', 'Condimenti e Spezie');
INSERT INTO `type` VALUES ('3', 'en', 'Dolci e Golosità');
INSERT INTO `type` VALUES ('3', 'it', 'Dolci e Golosità');
INSERT INTO `type` VALUES ('4', 'en', 'Prodotti da forno');
INSERT INTO `type` VALUES ('4', 'it', 'Prodotti da forno');
INSERT INTO `type` VALUES ('5', 'en', 'Formaggi e latticini');
INSERT INTO `type` VALUES ('5', 'it', 'Formaggi e latticini');
INSERT INTO `type` VALUES ('6', 'en', 'Patè e sott\'oli');
INSERT INTO `type` VALUES ('6', 'it', 'Patè e sott\'oli');
INSERT INTO `type` VALUES ('7', 'en', 'Carne');
INSERT INTO `type` VALUES ('7', 'it', 'Carne');
INSERT INTO `type` VALUES ('8', 'en', 'Bevande');
INSERT INTO `type` VALUES ('8', 'it', 'Bevande');
INSERT INTO `type` VALUES ('9', 'en', 'Vini');
INSERT INTO `type` VALUES ('9', 'it', 'Vini');
INSERT INTO `type` VALUES ('10', 'en', 'Liquori');
INSERT INTO `type` VALUES ('10', 'it', 'Liquori');
INSERT INTO `type` VALUES ('11', 'en', 'Salumi');
INSERT INTO `type` VALUES ('11', 'it', 'Salumi');
INSERT INTO `type` VALUES ('12', 'en', 'Pasta, riso e farina');
INSERT INTO `type` VALUES ('12', 'it', 'Pasta, riso e farina');
INSERT INTO `type` VALUES ('13', 'en', 'Funghi e Tartufi');
INSERT INTO `type` VALUES ('13', 'it', 'Funghi e Tartufi');
INSERT INTO `type` VALUES ('14', 'en', 'Frutta, Verdura e legumi');
INSERT INTO `type` VALUES ('14', 'it', 'Frutta, Verdura e legumi');
INSERT INTO `type` VALUES ('15', 'en', 'Pesce');
INSERT INTO `type` VALUES ('15', 'it', 'Pesce');
INSERT INTO `type` VALUES ('16', 'en', 'Edilizia');
INSERT INTO `type` VALUES ('16', 'it', 'Edilizia');
INSERT INTO `type` VALUES ('17', 'en', 'Catasto');
INSERT INTO `type` VALUES ('17', 'it', 'Catasto');

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
