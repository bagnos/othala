/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : magbo647_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 13:05:47
*/

drop schema if exists magbo647_othala;
create schema magbo647_othala;
use magbo647_othala;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '1', 'casa');
INSERT INTO `addresses` VALUES ('2', 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aretina 89', 'siena', '53100', 'si', 'ITALIA', '3332965518', '0', 'casa');
INSERT INTO `addresses` VALUES ('3', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'Guadeloupe', '3392113342', '1', 'casa');
INSERT INTO `addresses` VALUES ('4', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '0', 'casa');
INSERT INTO `addresses` VALUES ('5', 'giuliagalotta@hotmail.it', 'Giulia', 'Galotta', 'Enrico Mattei 33', 'Asciano', '53041', 'SSi', 'ITALIA', '3391411088', '1', 'Casa');
INSERT INTO `addresses` VALUES ('6', 'giuliagalotta@hotmail.it', 'Giulia', 'Galotta', 'Enrico Mattei 33', 'Asciano', '53041', 'SISi', 'ITALIA', '3391411088', '1', 'Casa');
INSERT INTO `addresses` VALUES ('7', 'giuliagalotta@hotmail.it', 'Giulia', 'Galotta', 'Enrico Mattei 33', 'Asciano', '53041', 'ISi', 'ITALIA', '3391411088', '1', 'Casa');
INSERT INTO `addresses` VALUES ('8', 'giuliagalotta@hotmail.it', 'Giulia', 'Galotta', 'Enrico Mattei 33', 'Asciano', '53041', 'S', 'ITALIA', '3391411088', '1', 'Casa');
INSERT INTO `addresses` VALUES ('9', 'giuliagalotta@hotmail.it', 'Giulia', 'Galotta', 'Enrico Mattei 33', 'Asciano', '53041', 'SI', 'ITALIA', '3391411088', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10', 'nancysqn@gmail.com', 'Qinan Shen', 'nancy', '4940 126th Avenue SE', 'Bellevue', '98006', 'WA', 'United States', '4257376317', '0', 'home');
INSERT INTO `addresses` VALUES ('11', 'dott.marinomartini@alice.it', 'marino', 'martini', 'località campo sacro 15', 'sgonico', '34151', 'ts', 'ITALIA', '3389565488', '0', 'casa');

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
INSERT INTO `article` VALUES ('27', '1', '22', '13', '0', 'thumb20141027161832712&45239055TE_13P_F.jpg', '1', 'SBMPQ04YN0LV53100C19', '1.00', null, '30');
INSERT INTO `article` VALUES ('30', '1', '22', '18', '1', 'thumb20141110145915895&IMG_5244.JPG', '1', '121212', '120.00', null, '0');
INSERT INTO `article` VALUES ('31', '5', '4', '5', '0', 'thumb20141202123227110&IMG_1577.jpg', '1', '101112', '745.00', null, '0');
INSERT INTO `article` VALUES ('31', '6', '5', '5', '1', 'thumb20141202123227110&IMG_1577.jpg', '1', '101112', '745.00', null, '0');
INSERT INTO `article` VALUES ('33', '1', '5', '21', '1', 'thumb20141202123438452&IMG_1586.jpg', '1', '101113', '840.00', null, '0');
INSERT INTO `article` VALUES ('34', '1', '38', '20', '0', 'thumb20141202123558626&IMG_1582.jpg', '1', '101114', '650.00', null, '0');
INSERT INTO `article` VALUES ('35', '1', '4', '11', '1', 'thumb20141202130425171&IMG_1565.JPG', '1', '101115', '485.00', null, '0');
INSERT INTO `article` VALUES ('35', '2', '5', '11', '1', 'thumb20141202130425171&IMG_1565.JPG', '1', '101115', '485.00', null, '0');
INSERT INTO `article` VALUES ('36', '1', '5', '22', '0', 'thumb20141202130955055&IMG_1588.jpg', '1', '101116', '1080.00', null, '0');
INSERT INTO `article` VALUES ('37', '1', '4', '5', '1', 'thumb20141127125558413&IMG_1571.jpg', '1', '101117', '510.00', null, '0');
INSERT INTO `article` VALUES ('37', '2', '5', '5', '1', 'thumb20141127125558413&IMG_1571.jpg', '1', '101117', '510.00', null, '0');
INSERT INTO `article` VALUES ('38', '1', '5', '11', '0', 'thumb20141202131037758&IMG_1569.JPG', '1', '101118', '465.00', null, '0');
INSERT INTO `article` VALUES ('39', '1', '42', '5', '1', 'thumb20141202151027733&IMG_1563.jpg', '1', '101119', '645.00', null, '0');
INSERT INTO `article` VALUES ('40', '1', '17', '11', '1', 'thumb20141202130553258&IMG_1520.jpg', '1', '111110', '140.00', null, '0');
INSERT INTO `article` VALUES ('40', '2', '19', '11', '1', 'thumb20141202130553258&IMG_1520.jpg', '1', '111110', '140.00', null, '0');
INSERT INTO `article` VALUES ('41', '2', '5', '3', '1', 'thumb20141206192714324&IMG_1552.jpg', '1', '111111', '1270.00', null, '0');
INSERT INTO `article` VALUES ('42', '2', '4', '9', '1', 'thumb20141206192525431&IMG_1561.jpg', '1', '111112', '660.00', null, '0');
INSERT INTO `article` VALUES ('43', '1', '6', '2', '0', 'thumb20141202123656922&IMG_1540.jpg', '1', '111113', '545.00', null, '0');
INSERT INTO `article` VALUES ('44', '1', '5', '10', '1', 'thumb20141202131809015&IMG_1544.jpg', '1', '111121', '180.00', null, '0');
INSERT INTO `article` VALUES ('45', '1', '5', '11', '1', 'thumb20141202123833980&IMG_1546.jpg', '1', '111115', '370.00', null, '0');
INSERT INTO `article` VALUES ('45', '2', '6', '11', '1', 'thumb20141202123833980&IMG_1546.jpg', '1', '111115', '370.00', null, '0');
INSERT INTO `article` VALUES ('46', '1', '4', '2', '0', 'thumb20141202131611968&IMG_1530.jpg', '1', '111117', '245.00', null, '0');
INSERT INTO `article` VALUES ('47', '2', '17', '9', '0', 'thumb20141206192850317&IMG_1600.jpg', '1', '111210', '1620.00', null, '0');
INSERT INTO `article` VALUES ('48', '1', '17', '11', '1', 'thumb20141202131911122&IMG_1598.jpg', '1', '111211', '715.00', null, '0');
INSERT INTO `article` VALUES ('49', '1', '4', '11', '1', 'thumb20141202131951185&IMG_1592.jpg', '1', '101120', '445.00', null, '0');
INSERT INTO `article` VALUES ('49', '2', '5', '11', '2', 'thumb20141202131951185&IMG_1592.jpg', '1', '101120', '445.00', null, '0');
INSERT INTO `article` VALUES ('50', '2', '5', '11', '0', 'thumb20141202132026576&IMG_1548.jpg', '1', '111118', '380.00', null, '0');
INSERT INTO `article` VALUES ('51', '1', '4', '4', '1', 'thumb20141202151118594&IMG_1505.jpg', '1', '111119', '270.00', null, '0');
INSERT INTO `article` VALUES ('51', '2', '5', '4', '1', 'thumb20141202151118594&IMG_1505.jpg', '1', '111119', '270.00', null, '0');
INSERT INTO `article` VALUES ('52', '1', '19', '4', '1', 'thumb20141202132537186&IMG_1506.JPG', '1', '111120', '230.00', null, '0');
INSERT INTO `article` VALUES ('53', '1', '16', '11', '0', 'thumb20141202130654886&IMG_1518.JPG', '1', '111121v', '355.00', null, '0');
INSERT INTO `article` VALUES ('53', '2', '17', '11', '0', 'thumb20141202130654886&IMG_1518.JPG', '1', '111121v', '355.00', null, '0');
INSERT INTO `article` VALUES ('54', '1', '7', '11', '2', 'thumb20141202132105618&IMG_1603.jpg', '1', '111310', '325.00', null, '30');
INSERT INTO `article` VALUES ('54', '2', '6', '11', '0', 'thumb20141202132105618&IMG_1603.jpg', '1', '111310', '325.00', null, '30');
INSERT INTO `article` VALUES ('55', '1', '5', '4', '1', 'thumb20141202151317124&IMG_1611.jpg', '1', '111311', '275.00', null, '0');
INSERT INTO `article` VALUES ('56', '1', '5', '14', '1', 'thumb20141202151353554&IMG_1619.jpg', '1', '111312', '200.00', null, '0');
INSERT INTO `article` VALUES ('56', '2', '6', '14', '1', 'thumb20141202151353554&IMG_1619.jpg', '1', '111312', '200.00', null, '0');
INSERT INTO `article` VALUES ('56', '3', '6', '11', '0', 'thumb20141202151353554&IMG_1619.jpg', '1', '111312', '200.00', null, '0');
INSERT INTO `article` VALUES ('56', '5', '4', '5', '1', 'thumb20141202151353554&IMG_1619.jpg', '1', '111312', '200.00', null, '0');
INSERT INTO `article` VALUES ('56', '6', '5', '5', '1', 'thumb20141202151353554&IMG_1619.jpg', '1', '111312', '200.00', null, '0');
INSERT INTO `article` VALUES ('57', '1', '5', '23', '1', 'thumb20141202124007840&IMG_1637.jpg', '1', '121110', '450.00', null, '0');
INSERT INTO `article` VALUES ('58', '1', '5', '22', '1', 'thumb20141202124107859&IMG_1651.jpg', '1', '121111', '500.00', null, '0');
INSERT INTO `article` VALUES ('58', '2', '6', '22', '1', 'thumb20141202124107859&IMG_1651.jpg', '1', '121111', '500.00', null, '0');
INSERT INTO `article` VALUES ('59', '3', '5', '8', '0', 'thumb20141206192337282&IMG_1656.jpg', '1', '121112', '375.00', null, '0');
INSERT INTO `article` VALUES ('59', '4', '6', '8', '1', 'thumb20141206192337282&IMG_1656.jpg', '1', '121112', '375.00', null, '0');
INSERT INTO `article` VALUES ('60', '3', '5', '5', '1', 'thumb20141206192140447&IMG_1643.jpg', '1', '121113', '375.00', null, '0');
INSERT INTO `article` VALUES ('60', '4', '6', '5', '1', 'thumb20141206192140447&IMG_1643.jpg', '1', '121113', '375.00', null, '0');
INSERT INTO `article` VALUES ('61', '1', '5', '5', '1', 'thumb20141202131652487&IMG_1647.jpg', '1', '121114', '340.00', null, '0');
INSERT INTO `article` VALUES ('62', '2', '6', '4', '1', 'thumb20141206192010583&IMG_1642.JPG', '1', '111313', '338.00', null, '0');
INSERT INTO `article` VALUES ('63', '1', '22', '24', '1', 'thumb20141118170740089&anbjorg1.jpg', '1', '141110', '240.00', null, '0');
INSERT INTO `article` VALUES ('64', '1', '22', '2', '1', 'thumb20141118170858601&annellobjorg.jpg', '1', '141110', '240.00', null, '0');
INSERT INTO `article` VALUES ('66', '1', '22', '5', '1', 'thumb20141119135625261&bjorgneck1.jpg', '1', '141113', '250.00', null, '0');
INSERT INTO `article` VALUES ('67', '1', '22', '2', '0', 'thumb20141119135905749&bjorgringbracelet.jpg', '1', '141114', '160.00', null, '0');
INSERT INTO `article` VALUES ('68', '1', '22', '14', '1', 'thumb20141119140237932&calderaranecklace1.jpg', '1', '111314', '325.00', null, '0');
INSERT INTO `article` VALUES ('69', '1', '22', '11', '0', 'thumb20141119140628953&calderaranecklace3.jpg', '1', '111315', '315.00', null, '0');
INSERT INTO `article` VALUES ('70', '1', '22', '11', '1', 'thumb20141119140944080&calderaranecklace2.jpg', '1', '111316', '300.00', null, '0');
INSERT INTO `article` VALUES ('71', '1', '22', '11', '0', 'thumb20141119141205598&calderaranecklace5.jpg', '1', '111317', '220.00', null, '0');
INSERT INTO `article` VALUES ('72', '1', '22', '25', '1', 'thumb20141119141432529&orrechinicalderara.jpg', '1', '111318', '110.00', null, '0');
INSERT INTO `article` VALUES ('72', '2', '22', '11', '1', 'thumb20141119141432529&orrechinicalderara.jpg', '1', '111318', '110.00', null, '0');
INSERT INTO `article` VALUES ('73', '1', '22', '2', '1', 'thumb20141119141945710&heartbjorgnecklace.jpg', '1', '141115', '365.00', null, '0');
INSERT INTO `article` VALUES ('74', '1', '22', '26', '1', 'thumb20141119145037054&jaminbag1.jpg', '1', '151110', '190.00', null, '0');
INSERT INTO `article` VALUES ('74', '2', '22', '11', '0', 'thumb20141119145037054&jaminbag1.jpg', '1', '151110', '190.00', null, '0');
INSERT INTO `article` VALUES ('75', '1', '22', '27', '0', 'thumb20141119145647130&jaminbag2.jpg', '1', '151111', '435.00', null, '0');
INSERT INTO `article` VALUES ('76', '1', '22', '27', '0', 'thumb20141119150901584&jaminbig2.jpg', '1', '151112', '695.00', null, '0');
INSERT INTO `article` VALUES ('77', '1', '22', '28', '1', 'thumb20141119151056744&marnibag.jpg', '1', '101121', '220.00', null, '20');
INSERT INTO `article` VALUES ('78', '1', '22', '27', '1', 'thumb20141119151650739&paula3.jpg', '1', '161110', '830.00', null, '0');
INSERT INTO `article` VALUES ('79', '1', '22', '29', '0', 'thumb20141119152416360&paulapink.jpg', '1', '161111', '1450.00', null, '0');
INSERT INTO `article` VALUES ('80', '1', '22', '27', '1', 'thumb20141119152906558&cademartori2.jpg', '1', '161112', '1500.00', null, '0');
INSERT INTO `article` VALUES ('81', '1', '22', '27', '0', 'thumb20141119153653554&marnipochette.jpg', '1', '101122', '710.00', null, '0');
INSERT INTO `article` VALUES ('82', '1', '26', '30', '0', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('82', '2', '3', '30', '0', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('82', '3', '28', '30', '0', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('82', '4', '4', '30', '1', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('82', '5', '49', '30', '0', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('82', '6', '48', '30', '0', 'thumb20141119155500168&aranthsilver.jpg', '1', '171110', '300.00', null, '30');
INSERT INTO `article` VALUES ('83', '1', '28', '25', '1', 'thumb20141119155745902&marniboots1.jpg', '1', '101123', '470.00', null, '0');
INSERT INTO `article` VALUES ('83', '2', '3', '25', '1', 'thumb20141119155745902&marniboots1.jpg', '1', '101123', '470.00', null, '0');
INSERT INTO `article` VALUES ('83', '3', '49', '25', '1', 'thumb20141119155745902&marniboots1.jpg', '1', '101123', '470.00', null, '0');
INSERT INTO `article` VALUES ('84', '1', '49', '25', '1', 'thumb20141119165156903&marniborde1.jpg', '1', '101124', '590.00', null, '0');
INSERT INTO `article` VALUES ('85', '1', '49', '14', '1', 'thumb20141119165444186&marnimaryjane1.jpg', '1', '101125', '470.00', null, '30');
INSERT INTO `article` VALUES ('85', '2', '28', '14', '1', 'thumb20141119165444186&marnimaryjane1.jpg', '1', '101125', '470.00', null, '30');
INSERT INTO `article` VALUES ('86', '1', '26', '20', '1', 'thumb20141119170343778&marnisandals.jpg', '1', '101126', '290.00', null, '30');
INSERT INTO `article` VALUES ('86', '2', '48', '20', '0', 'thumb20141119170343778&marnisandals.jpg', '1', '101126', '290.00', null, '30');
INSERT INTO `article` VALUES ('86', '3', '3', '20', '0', 'thumb20141119170343778&marnisandals.jpg', '1', '101126', '290.00', null, '30');
INSERT INTO `article` VALUES ('87', '1', '22', '31', '1', 'thumb20141119170640438&marninecklace1.jpg', '1', '101127', '385.00', null, '0');
INSERT INTO `article` VALUES ('87', '2', '22', '32', '1', 'thumb20141119170640438&marninecklace1.jpg', '1', '101127', '385.00', null, '0');
INSERT INTO `article` VALUES ('88', '4', '22', '32', '1', 'thumb20141202152248681&marninecklace2.jpg', '1', '101127', '385.00', null, '20');
INSERT INTO `article` VALUES ('88', '5', '22', '31', '0', 'thumb20141202152306015&marninecklace1.jpg', '1', '101127', '385.00', null, '20');
INSERT INTO `article` VALUES ('89', '1', '22', '33', '1', 'thumb20141119171820051&marninecklace3.jpg', '1', '101128', '380.00', null, '20');
INSERT INTO `article` VALUES ('90', '3', '22', '9', '0', 'thumb20141202152512868&capbern1.jpg', '1', '181110', '130.00', null, '0');
INSERT INTO `article` VALUES ('90', '4', '22', '5', '0', 'thumb20141202152453731&capbernstock2.jpg', '1', '181110', '130.00', null, '0');
INSERT INTO `article` VALUES ('91', '3', '22', '14', '1', 'thumb20141120143357071&capbernstock6.jpg', '1', '181111', '130.00', null, '20');
INSERT INTO `article` VALUES ('91', '4', '22', '9', '0', 'thumb20141202152608141&capbernstock3.jpg', '1', '181111', '130.00', null, '20');
INSERT INTO `article` VALUES ('91', '5', '22', '5', '0', 'thumb20141202152608394&capbern4.jpg', '1', '181111', '130.00', null, '20');
INSERT INTO `article` VALUES ('92', '3', '22', '11', '1', 'thumb20141122115607198&capbernstock8.jpg', '1', '181112', '130.00', null, '20');
INSERT INTO `article` VALUES ('92', '5', '22', '9', '1', 'thumb20141202152737972&capbernstock7.jpg', '1', '181112', '130.00', null, '20');
INSERT INTO `article` VALUES ('93', '1', '22', '5', '2', 'thumb20141120144217526&capbernstock9.jpg', '1', '181113', '130.00', null, '20');
INSERT INTO `article` VALUES ('94', '1', '22', '27', '0', 'thumb20141120144339085&pdbrac.jpg', '1', '191110', '350.00', null, '0');
INSERT INTO `article` VALUES ('95', '1', '22', '27', '1', 'thumb20141120145158723&pdbracel2.jpg', '1', '181111', '325.00', null, '0');
INSERT INTO `article` VALUES ('96', '1', '26', '11', '1', 'thumb20141120145300937&peternon1.jpg', '1', '201110', '330.00', null, '0');
INSERT INTO `article` VALUES ('96', '2', '3', '11', '2', 'thumb20141120145300937&peternon1.jpg', '1', '201110', '330.00', null, '0');
INSERT INTO `article` VALUES ('96', '3', '28', '11', '2', 'thumb20141120145300937&peternon1.jpg', '1', '201110', '330.00', null, '0');
INSERT INTO `article` VALUES ('96', '4', '4', '11', '1', 'thumb20141120145300937&peternon1.jpg', '1', '201110', '330.00', null, '0');
INSERT INTO `article` VALUES ('97', '1', '3', '11', '2', 'thumb20141120145928835&peternonfur1.jpg', '1', '201111', '395.00', null, '0');
INSERT INTO `article` VALUES ('97', '2', '26', '11', '1', 'thumb20141120145928835&peternonfur1.jpg', '1', '201111', '395.00', null, '0');
INSERT INTO `article` VALUES ('98', '1', '26', '11', '0', 'thumb20141120150610887&peternon1.jpg', '1', '201110', '330.00', null, '30');
INSERT INTO `article` VALUES ('98', '2', '3', '11', '0', 'thumb20141120150610887&peternon1.jpg', '1', '201110', '330.00', null, '30');
INSERT INTO `article` VALUES ('98', '3', '28', '11', '1', 'thumb20141120150610887&peternon1.jpg', '1', '201110', '330.00', null, '30');
INSERT INTO `article` VALUES ('98', '4', '4', '11', '1', 'thumb20141120150610887&peternon1.jpg', '1', '201110', '330.00', null, '30');
INSERT INTO `article` VALUES ('99', '1', '26', '11', '0', 'thumb20141121162040246&premiatafur.jpg', '1', '211110', '260.00', null, '0');
INSERT INTO `article` VALUES ('99', '2', '3', '11', '0', 'thumb20141121162040246&premiatafur.jpg', '1', '211110', '260.00', null, '0');
INSERT INTO `article` VALUES ('99', '3', '28', '11', '2', 'thumb20141121162040246&premiatafur.jpg', '1', '211110', '260.00', null, '0');
INSERT INTO `article` VALUES ('99', '4', '4', '11', '1', 'thumb20141121162040246&premiatafur.jpg', '1', '211110', '260.00', null, '0');
INSERT INTO `article` VALUES ('100', '1', '5', '34', '1', 'thumb20141202151441584&IMG_1626.jpg', '1', '221110', '325.00', null, '0');
INSERT INTO `article` VALUES ('101', '3', '51', '48', '2', 'thumb20141202112331383&edt_new_color_resize_eau_de_lierre.jpg', '1', '231110', '98.00', null, '0');
INSERT INTO `article` VALUES ('102', '3', '51', '48', '2', 'thumb20141202112438343&edt_new_color_resize_oyedo_1.jpg', '1', '231111', '98.00', null, '0');
INSERT INTO `article` VALUES ('103', '3', '51', '48', '2', 'thumb20141202112523760&edt_new_color_resize_eau_duelle.jpg', '1', '231112', '98.00', null, '0');
INSERT INTO `article` VALUES ('104', '3', '51', '48', '2', 'thumb20141202112601322&edt_new_color_resize_philosykos.jpg', '1', '231113', '98.00', null, '0');
INSERT INTO `article` VALUES ('105', '3', '51', '48', '2', 'thumb20141202112633185&edt_new_color_resize_doson.jpg', '1', '231114', '98.00', null, '0');
INSERT INTO `article` VALUES ('106', '4', '51', '48', '2', 'thumb20141202112715827&lombre_dans_resize.jpg', '1', '231115', '108.00', null, '0');
INSERT INTO `article` VALUES ('107', '3', '51', '48', '2', 'thumb20141202112754652&philosykos_resize-1.jpg', '1', '231116', '108.00', null, '0');
INSERT INTO `article` VALUES ('108', '3', '51', '48', '2', 'thumb20141202112855644&volutesp75.jpg', '1', '231117', '108.00', null, '0');
INSERT INTO `article` VALUES ('109', '2', '51', '48', '2', 'thumb20141202112209376&tamdao100v1.jpg', '1', '231118', '98.00', null, '0');
INSERT INTO `article` VALUES ('110', '2', '51', '48', '2', 'thumb20141202112943080&vetyverio-flacon-dos.jpg', '1', '231119', '98.00', null, '0');
INSERT INTO `article` VALUES ('111', '2', '51', '48', '2', 'thumb20141202113028908&volute100v1_1.jpg', '1', '231120', '98.00', null, '0');
INSERT INTO `article` VALUES ('112', '2', '51', '48', '2', 'thumb20141202113440235&aobc_freshlotion.jpg', '1', '231121', '45.00', null, '0');
INSERT INTO `article` VALUES ('113', '2', '51', '48', '2', 'thumb20141202113844846&bc_pommade_exfoliante-pot_q.jpg', '1', '231122', '55.00', null, '0');
INSERT INTO `article` VALUES ('114', '2', '51', '48', '2', 'thumb20141202113528673&abc_creme_riche_1.jpg', '1', '231124', '67.00', null, '0');
INSERT INTO `article` VALUES ('115', '2', '51', '48', '2', 'thumb20141202113615259&abc_baume_genereux.jpg', '1', '231123', '35.00', null, '0');
INSERT INTO `article` VALUES ('116', '2', '51', '48', '2', 'thumb20141202113344716&bc_emulsion_velours-pot_q.jpg', '1', '231125', '38.00', null, '0');
INSERT INTO `article` VALUES ('124', '1', '22', '37', '1', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('124', '2', '22', '38', '2', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('124', '3', '22', '39', '2', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('124', '4', '22', '40', '0', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('124', '5', '22', '41', '2', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('124', '6', '22', '42', '1', 'thumb20141122165608381&bagsdesign2.jpg', '1', '241110', '120.00', null, '20');
INSERT INTO `article` VALUES ('125', '1', '22', '43', '0', 'thumb20141122170514127&designinverso1.jpg', '1', '241111', '130.00', null, '0');
INSERT INTO `article` VALUES ('125', '2', '22', '44', '0', 'thumb20141122170514127&designinverso1.jpg', '1', '241111', '130.00', null, '0');
INSERT INTO `article` VALUES ('125', '3', '22', '45', '1', 'thumb20141122170514127&designinverso1.jpg', '1', '241111', '130.00', null, '0');
INSERT INTO `article` VALUES ('125', '4', '22', '47', '2', 'thumb20141202153314420&designinverso1.jpg', '1', '241111', '130.00', null, '0');
INSERT INTO `article` VALUES ('132', '2', '51', '48', '1', 'thumb20141202113709727&bc_revitalizing-shower-gel_q.jpg', '1', '261126', '60.00', null, '0');
INSERT INTO `article` VALUES ('140', '1', '51', '48', '2', 'thumb20141211162509107&34collection_essences-insensees_edp100.jpg', '1', '231126', '125.00', null, '0');
INSERT INTO `article` VALUES ('143', '1', '22', '12', '1', 'thumb20141212155904883&meteor-necklace_1412244678_1.jpg', '1', '232001', '195.00', null, '0');
INSERT INTO `article` VALUES ('144', '1', '17', '4', '1', 'thumb20141216121556705&msgmfelpa.jpg', '1', '111114', '138.00', null, '0');
INSERT INTO `article` VALUES ('145', '1', '51', '27', '1', 'thumb20141216162913536&paula3.jpg', '1', '161110', '830.00', null, '0');
INSERT INTO `article` VALUES ('146', '1', '18', '4', '2', 'thumb20141217115923929&msgmtshirt.jpg', '1', '111122', '70.00', null, '0');
INSERT INTO `article` VALUES ('146', '2', '19', '4', '1', 'thumb20141217115923929&msgmtshirt.jpg', '1', '111122', '70.00', null, '0');
INSERT INTO `article` VALUES ('147', '1', '51', '48', '2', 'thumb20141223141224857&winter14_coffret_l27art_du_soin_rvb_resized_1.jpg', '1', '231127', '75.00', null, '0');
INSERT INTO `article` VALUES ('148', '1', '52', '12', '1', 'thumb20141223142939003&cabin2wheels-bright-gold.jpg', '1', '251010', '189.00', null, '0');
INSERT INTO `article` VALUES ('149', '1', '51', '11', '1', 'thumb20141229173329066&tumblr_nhcqr9xd7R1rvje7uo1_1280.jpg', '1', '261000', '120.00', null, '0');
INSERT INTO `article` VALUES ('150', '1', '51', '14', '0', 'thumb20141229173954428&tumblr_nhcr0lQrD11rvje7uo1_1280.jpg', '1', '261002', '120.00', null, '0');
INSERT INTO `article` VALUES ('151', '1', '51', '1', '0', 'thumb20141229174412545&tumblr_nhcr27ZX4u1rvje7uo1_1280.jpg', '1', '261001', '120.00', null, '0');
INSERT INTO `article` VALUES ('152', '1', '51', '14', '1', 'thumb20141229174737659&tumblr_nhcquyJbkC1rvje7uo1_1280.jpg', '1', '261003', '90.00', null, '0');
INSERT INTO `article` VALUES ('153', '1', '51', '10', '1', 'thumb20141229181241410&004_4f896e20-8403-4c35-9bc6-d8a9c92f4839.JPG', '1', '261004', '90.00', null, '0');
INSERT INTO `article` VALUES ('154', '2', '3', '49', '1', 'thumb20141231105108080&tumblr_nhelok6twK1rvje7uo1_1280.jpg', '1', '111117', '880.00', null, '0');
INSERT INTO `article` VALUES ('155', '1', '6', '6', '1', 'thumb20150108150505522&m-193-286511-2-gWO6PlkHA67e.jpg', '1', '111120', '495.00', null, '30');
INSERT INTO `article` VALUES ('155', '2', '5', '6', '1', 'thumb20150108150505522&m-193-286511-2-gWO6PlkHA67e.jpg', '1', '111121', '495.00', null, '30');
INSERT INTO `article` VALUES ('156', '2', '3', '11', '2', 'thumb20150108152121511&44717922gs_11_a.jpg', '1', '221111', '420.00', null, '30');
INSERT INTO `article` VALUES ('156', '3', '28', '11', '1', 'thumb20150108152121511&44717922gs_11_a.jpg', '1', '221111', '420.00', null, '30');
INSERT INTO `article` VALUES ('157', '1', '37', '11', '0', 'thumb20150108152416203&44732642cb_11_a.jpg', '1', '221112', '249.00', null, '30');
INSERT INTO `article` VALUES ('157', '2', '3', '11', '2', 'thumb20150108152416203&44732642cb_11_a.jpg', '1', '221112', '249.00', null, '30');
INSERT INTO `article` VALUES ('157', '3', '28', '11', '2', 'thumb20150108152416203&44732642cb_11_a.jpg', '1', '221112', '249.00', null, '30');
INSERT INTO `article` VALUES ('157', '4', '4', '11', '2', 'thumb20150108152416203&44732642cb_11_a.jpg', '1', '221112', '249.00', null, '30');
INSERT INTO `article` VALUES ('158', '1', '4', '8', '0', 'thumb20150121120920473&marniabito1.jpg', '1', '301010', '930.00', null, '0');
INSERT INTO `article` VALUES ('158', '2', '5', '8', '0', 'thumb20150121120920473&marniabito1.jpg', '1', '301010', '930.00', null, '0');
INSERT INTO `article` VALUES ('159', '1', '5', '8', '1', 'thumb20150121140840915&marnitop1.jpg', '1', '301011', '440.00', null, '0');
INSERT INTO `article` VALUES ('160', '1', '4', '4', '1', 'thumb20150121141333763&marnicamicia2.jpg', '1', '301012', '550.00', null, '0');
INSERT INTO `article` VALUES ('160', '2', '5', '4', '1', 'thumb20150121141333763&marnicamicia2.jpg', '1', '301012', '550.00', null, '0');
INSERT INTO `article` VALUES ('161', '1', '4', '10', '1', 'thumb20150121141512907&marnidress1.jpg', '1', '301013', '930.00', null, '0');
INSERT INTO `article` VALUES ('161', '2', '5', '10', '1', 'thumb20150121141512907&marnidress1.jpg', '1', '301013', '930.00', null, '0');
INSERT INTO `article` VALUES ('162', '1', '40', '50', '1', 'thumb20150121142247660&marnigiaccapelle1.jpg', '1', '301015', '2900.00', null, '0');
INSERT INTO `article` VALUES ('163', '1', '26', '14', '1', 'thumb20150121143641185&marnisneakers1.jpg', '1', '301016', '370.00', null, '0');
INSERT INTO `article` VALUES ('163', '2', '3', '14', '2', 'thumb20150121143641185&marnisneakers1.jpg', '1', '301016', '370.00', null, '0');
INSERT INTO `article` VALUES ('163', '3', '28', '14', '2', 'thumb20150121143641185&marnisneakers1.jpg', '1', '301016', '370.00', null, '0');
INSERT INTO `article` VALUES ('163', '4', '4', '14', '1', 'thumb20150121143641185&marnisneakers1.jpg', '1', '301016', '370.00', null, '0');
INSERT INTO `article` VALUES ('164', '1', '26', '20', '1', 'thumb20150121144210953&marnisandali1.jpg', '1', '301017', '470.00', null, '0');
INSERT INTO `article` VALUES ('164', '2', '3', '20', '2', 'thumb20150121144210953&marnisandali1.jpg', '1', '301017', '470.00', null, '0');
INSERT INTO `article` VALUES ('164', '3', '28', '20', '2', 'thumb20150121144210953&marnisandali1.jpg', '1', '301017', '470.00', null, '0');
INSERT INTO `article` VALUES ('164', '4', '4', '20', '1', 'thumb20150121144210953&marnisandali1.jpg', '1', '301017', '470.00', null, '0');
INSERT INTO `article` VALUES ('164', '5', '30', '20', '1', 'thumb20150121144210953&marnisandali1.jpg', '1', '301017', '470.00', null, '0');
INSERT INTO `article` VALUES ('165', '1', '22', '51', '1', 'thumb20150121144814631&dusantop2.jpg', '1', '311012', '500.00', null, '0');
INSERT INTO `article` VALUES ('165', '2', '22', '51', '2', 'thumb20150121144814631&dusantop2.jpg', '1', '311012', '500.00', null, '0');
INSERT INTO `article` VALUES ('166', '1', '22', '15', '1', 'thumb20150121145616247&topdusan1.jpg', '1', '311012', '500.00', null, '0');
INSERT INTO `article` VALUES ('167', '1', '3', '52', '1', 'thumb20150124160724431&marniabito2.jpg', '1', '301018', '750.00', null, '0');
INSERT INTO `article` VALUES ('167', '2', '4', '52', '1', 'thumb20150124160724431&marniabito2.jpg', '1', '301018', '750.00', null, '0');
INSERT INTO `article` VALUES ('168', '1', '22', '53', '3', 'thumb20150124161128388&marnitotebag1.jpg', '1', '301019', '220.00', null, '0');
INSERT INTO `article` VALUES ('169', '1', '4', '54', '1', 'thumb20150128181652655&marnigiaccapelle2.jpg', '1', '301020', '2900.00', null, '0');
INSERT INTO `article` VALUES ('170', '1', '22', '27', '2', 'thumb20150129165554706&borsajamin1.jpg', '1', '321010', '520.00', null, '0');
INSERT INTO `article` VALUES ('171', '1', '22', '16', '1', 'thumb20150129171012087&borsajamin2-1.jpg', '1', '321011', '520.00', null, '0');
INSERT INTO `article` VALUES ('172', '1', '22', '13', '1', 'thumb20150129171616099&borsajamin3-1.jpg', '1', '321012', '520.00', null, '0');
INSERT INTO `article` VALUES ('173', '1', '22', '55', '1', 'thumb20150129172845803&borsajamin4-1.jpg', '1', '321013', '210.00', null, '0');
INSERT INTO `article` VALUES ('174', '1', '4', '8', '1', 'thumb20150129173718742&marniabitogiallo1.jpg', '1', '301010', '930.00', null, '0');
INSERT INTO `article` VALUES ('174', '2', '5', '8', '1', 'thumb20150129173718742&marniabitogiallo1.jpg', '1', '301010', '930.00', null, '0');
INSERT INTO `article` VALUES ('175', '1', '22', '56', '1', 'thumb20150130142725823&collanadopdaliana2.jpg', '1', '331010', '275.00', null, '0');
INSERT INTO `article` VALUES ('176', '1', '22', '56', '1', 'thumb20150130143305733&patiziasciarpa.jpg', '1', '331011', '390.00', null, '0');
INSERT INTO `article` VALUES ('177', '1', '22', '56', '1', 'thumb20150130143904185&patriziabrac3.jpg', '1', '331012', '200.00', null, '0');
INSERT INTO `article` VALUES ('178', '1', '22', '56', '1', 'thumb20150130144339297&patriziabraccharms1.jpg', '1', '331013', '260.00', null, '0');
INSERT INTO `article` VALUES ('179', '1', '22', '56', '1', 'thumb20150130144852379&patriziaorrecchini.jpg', '1', '331014', '120.00', null, '0');
INSERT INTO `article` VALUES ('180', '1', '51', '48', '3', 'thumb20150130152329012&eau_plurielle_limited_72_1.jpg', '1', '231128', '72.00', null, '0');
INSERT INTO `article` VALUES ('181', '1', '51', '48', '3', 'thumb20150130153027343&rosafolia_candlepack_72.jpg', '1', '231129', '55.00', null, '0');
INSERT INTO `article` VALUES ('182', '1', '5', '11', '1', 'thumb20150204143452805&virginiabizzicapotto.jpg', '1', '341010', '500.00', null, '0');
INSERT INTO `article` VALUES ('183', '1', '4', '57', '1', 'thumb20150204144236952&virginiabizzigiacca.jpg', '1', '341011', '800.00', null, '0');
INSERT INTO `article` VALUES ('183', '2', '5', '57', '1', 'thumb20150204144236952&virginiabizzigiacca.jpg', '1', '341011', '800.00', null, '0');
INSERT INTO `article` VALUES ('184', '1', '5', '11', '1', 'thumb20150204144904317&virginiabizzigonna1.jpg', '1', '341012', '260.00', null, '0');
INSERT INTO `article` VALUES ('184', '2', '6', '11', '1', 'thumb20150204144904317&virginiabizzigonna1.jpg', '1', '341012', '260.00', null, '0');
INSERT INTO `article` VALUES ('185', '1', '5', '11', '1', 'thumb20150204145236181&virginiabizzipantdavanti.jpg', '1', '341013', '250.00', null, '0');
INSERT INTO `article` VALUES ('185', '2', '6', '11', '1', 'thumb20150204145236181&virginiabizzipantdavanti.jpg', '1', '341013', '250.00', null, '0');
INSERT INTO `article` VALUES ('186', '1', '4', '11', '1', 'thumb20150204145749701&virginiabizzitop1.jpg', '1', '341014', '190.00', null, '0');
INSERT INTO `article` VALUES ('186', '2', '5', '11', '1', 'thumb20150204145749701&virginiabizzitop1.jpg', '1', '341014', '190.00', null, '0');
INSERT INTO `article` VALUES ('187', '1', '4', '4', '1', 'thumb20150204150702342&virginiabizzitop2-2.jpg', '1', '341015', '230.00', null, '0');
INSERT INTO `article` VALUES ('187', '2', '5', '4', '1', 'thumb20150204150702342&virginiabizzitop2-2.jpg', '1', '341015', '230.00', null, '0');
INSERT INTO `article` VALUES ('188', '1', '53', '36', '1', 'thumb20150207164441800&carlocontradacamicia1.jpg', '1', '351010', '350.00', null, '0');
INSERT INTO `article` VALUES ('188', '2', '54', '36', '1', 'thumb20150207164441800&carlocontradacamicia1.jpg', '1', '351010', '350.00', null, '0');
INSERT INTO `article` VALUES ('189', '1', '55', '11', '1', 'thumb20150207171212758&carlocontradagiaccadavanti1.jpg', '1', '351011', '525.00', null, '0');
INSERT INTO `article` VALUES ('189', '2', '53', '11', '1', 'thumb20150207171212758&carlocontradagiaccadavanti1.jpg', '1', '351011', '525.00', null, '0');
INSERT INTO `article` VALUES ('190', '1', '53', '4', '1', 'thumb20150207174604519&carlocontradapant1.jpg', '1', '351012', '340.00', null, '0');
INSERT INTO `article` VALUES ('190', '2', '54', '4', '1', 'thumb20150207174604519&carlocontradapant1.jpg', '1', '351012', '340.00', null, '0');
INSERT INTO `article` VALUES ('191', '1', '55', '4', '1', 'thumb20150207175235314&carlocontradateshirt.jpg', '1', '351013', '365.00', null, '0');
INSERT INTO `article` VALUES ('191', '2', '53', '4', '1', 'thumb20150207175235314&carlocontradateshirt.jpg', '1', '351013', '365.00', null, '0');
INSERT INTO `article` VALUES ('192', '1', '53', '11', '1', 'thumb20150207175530591&carlocontradagonna1.jpg', '1', '351014', '385.00', null, '0');
INSERT INTO `article` VALUES ('192', '2', '54', '11', '1', 'thumb20150207175530591&carlocontradagonna1.jpg', '1', '351014', '385.00', null, '0');
INSERT INTO `article` VALUES ('193', '1', '53', '4', '1', 'thumb20150207180654876&carlocontradatop1.jpg', '1', '351015', '350.00', null, '0');
INSERT INTO `article` VALUES ('193', '2', '54', '4', '1', 'thumb20150207180654876&carlocontradatop1.jpg', '1', '351015', '350.00', null, '0');
INSERT INTO `article` VALUES ('194', '1', '51', '49', '1', 'thumb20150213170303915&infracolanapinkandwhite.jpg', '1', '361001', '135.00', null, '0');
INSERT INTO `article` VALUES ('195', '1', '51', '5', '2', 'thumb20150213170542549&infracollanabluerossobianco.jpg', '1', '361002', '135.00', null, '0');
INSERT INTO `article` VALUES ('196', '1', '51', '58', '2', 'thumb20150213170846554&infracollanafrica4.jpg', '1', '361003', '135.00', null, '0');
INSERT INTO `article` VALUES ('197', '1', '51', '11', '2', 'thumb20150213171134116&infacollanaafricabw.jpg', '1', '361004', '135.00', null, '0');
INSERT INTO `article` VALUES ('198', '1', '51', '15', '1', 'thumb20150213171310670&infracoralloverde.jpg', '1', '361007', '145.00', null, '0');
INSERT INTO `article` VALUES ('199', '1', '51', '49', '1', 'thumb20150213171440463&infacollanacorallorosa.jpg', '1', '361008', '145.00', null, '0');
INSERT INTO `article` VALUES ('200', '1', '51', '5', '1', 'thumb20150213171650989&infraorecchini1.jpg', '1', '361009', '60.00', null, '0');
INSERT INTO `article` VALUES ('201', '1', '51', '49', '1', 'thumb20150213172335740&infraorecchini2.jpg', '1', '361010', '60.00', null, '0');
INSERT INTO `article` VALUES ('202', '1', '51', '60', '3', 'thumb20150217165351582&stl_made_in_italy_bracelet_folk_collectioncyclamin_red_finaest.jpg', '1', '371010', '30.00', null, '0');
INSERT INTO `article` VALUES ('203', '1', '51', '4', '3', 'thumb20150217173439082&stl_made_in_italy_.jpg', '1', '371011', '30.00', null, '0');
INSERT INTO `article` VALUES ('204', '1', '51', '61', '3', 'thumb20150217173626231&share_the_love_braccialetto.jpg', '1', '371012', '30.00', null, '0');
INSERT INTO `article` VALUES ('205', '1', '51', '62', '3', 'thumb20150217173830312&stl_made_in_italy.jpg', '1', '371013', '30.00', null, '0');
INSERT INTO `article` VALUES ('206', '1', '51', '63', '3', 'thumb20150217174016111&stl_share_the_love1.jpg', '1', '371014', '30.00', null, '0');
INSERT INTO `article` VALUES ('207', '1', '51', '64', '3', 'thumb20150217174814734&stl_share_the_love2.jpg', '1', '371015', '30.00', null, '0');
INSERT INTO `article` VALUES ('208', '1', '51', '27', '3', 'thumb20150217174955383&stl_share_the_love_.jpg', '1', '371016', '30.00', null, '0');
INSERT INTO `article` VALUES ('209', '1', '51', '27', '3', 'thumb20150217175137497&stl_share_the_love3.jpg', '1', '371017', '30.00', null, '0');
INSERT INTO `article` VALUES ('210', '1', '51', '65', '3', 'thumb20150217175332839&stl_share_the_love.jpg', '1', '371018', '30.00', null, '0');
INSERT INTO `article` VALUES ('211', '1', '51', '58', '3', 'thumb20150217175533376&stl_share_the_love4.jpg', '1', '371019', '30.00', null, '0');
INSERT INTO `article` VALUES ('212', '1', '51', '5', '1', 'thumb20150220152208031&pb0110blulunga1.jpg', '1', '381010', '700.00', null, '0');
INSERT INTO `article` VALUES ('213', '1', '51', '9', '1', 'thumb20150220152747791&pb0110grigrio.jpg', '1', '381011', '520.00', null, '0');
INSERT INTO `article` VALUES ('214', '1', '51', '66', '1', 'thumb20150221161730262&pb0110cognac.jpg', '1', '381012', '400.00', null, '0');
INSERT INTO `article` VALUES ('214', '2', '51', '8', '1', 'thumb20150221161825612&pb0110yellow.jpg', '1', '381012', '400.00', null, '0');
INSERT INTO `article` VALUES ('215', '1', '51', '67', '0', 'thumb20150221162202176&pb0110_ab16_1_01_web.jpg', '1', '381013', '660.00', null, '0');
INSERT INTO `article` VALUES ('216', '1', '51', '13', '1', 'thumb20150221162757674&pb0110zaino1.jpg', '1', '381014', '425.00', null, '0');
INSERT INTO `article` VALUES ('217', '1', '51', '67', '1', 'thumb20150221162927709&pb0110secchiello2.jpg', '1', '381013', '660.00', null, '0');
INSERT INTO `article` VALUES ('228', '1', '2', '9', '1', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('228', '2', '26', '9', '2', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('228', '3', '3', '9', '3', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('228', '4', '28', '9', '3', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('228', '5', '4', '9', '2', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('228', '7', '30', '9', '1', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '411001', '200.00', null, '0');
INSERT INTO `article` VALUES ('229', '1', '2', '4', '1', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('229', '2', '26', '4', '2', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('229', '3', '3', '4', '3', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('229', '4', '28', '4', '3', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('229', '5', '4', '4', '2', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('229', '6', '30', '4', '1', 'thumb20150228122935890&premiatafrida999.jpg', '1', '411002', '185.00', null, '0');
INSERT INTO `article` VALUES ('230', '1', '26', '65', '2', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('230', '2', '2', '65', '1', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('230', '3', '3', '65', '3', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('230', '4', '28', '65', '3', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('230', '5', '4', '65', '2', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('230', '6', '30', '65', '1', 'thumb20150228123238966&premiatafrida.jpg', '1', '411003', '180.00', null, '0');
INSERT INTO `article` VALUES ('231', '1', '2', '15', '1', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '411004', '175.00', null, '0');
INSERT INTO `article` VALUES ('231', '2', '26', '15', '2', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '411004', '175.00', null, '0');
INSERT INTO `article` VALUES ('231', '3', '3', '15', '1', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '411004', '175.00', null, '0');
INSERT INTO `article` VALUES ('231', '4', '28', '15', '1', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '411004', '175.00', null, '0');
INSERT INTO `article` VALUES ('231', '5', '4', '15', '1', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '411004', '175.00', null, '0');
INSERT INTO `article` VALUES ('232', '1', '2', '14', '1', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '411005', '190.00', null, '0');
INSERT INTO `article` VALUES ('232', '2', '26', '14', '2', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '411005', '190.00', null, '0');
INSERT INTO `article` VALUES ('232', '3', '3', '14', '3', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '411005', '190.00', null, '0');
INSERT INTO `article` VALUES ('232', '4', '28', '14', '1', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '411005', '190.00', null, '0');
INSERT INTO `article` VALUES ('232', '5', '4', '14', '1', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '411005', '190.00', null, '0');
INSERT INTO `article` VALUES ('233', '1', '2', '1', '1', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '1206', '190.00', null, '0');
INSERT INTO `article` VALUES ('233', '2', '26', '1', '2', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '1206', '190.00', null, '0');
INSERT INTO `article` VALUES ('233', '3', '3', '1', '3', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '1206', '190.00', null, '0');
INSERT INTO `article` VALUES ('233', '4', '28', '1', '1', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '1206', '190.00', null, '0');
INSERT INTO `article` VALUES ('233', '5', '4', '1', '1', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '1206', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '1', '2', '11', '1', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '2', '26', '11', '2', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '3', '3', '11', '3', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '4', '28', '11', '3', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '5', '4', '11', '2', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('234', '6', '30', '11', '1', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '411008', '190.00', null, '0');
INSERT INTO `article` VALUES ('235', '1', '17', '9', '1', 'thumb20150228180129691&msgmfelpasenzamaniche.jpg', '1', '401001', '190.00', null, '0');
INSERT INTO `article` VALUES ('235', '2', '18', '9', '1', 'thumb20150228180129691&msgmfelpasenzamaniche.jpg', '1', '401001', '190.00', null, '0');
INSERT INTO `article` VALUES ('236', '1', '17', '11', '2', 'thumb20150228180424655&msgmtanktopnero.jpg', '1', '401002', '80.00', null, '0');
INSERT INTO `article` VALUES ('236', '2', '18', '11', '2', 'thumb20150228180424655&msgmtanktopnero.jpg', '1', '401002', '80.00', null, '0');
INSERT INTO `article` VALUES ('237', '1', '17', '68', '1', 'thumb20150228180642108&msgmpolomaglietta.jpg', '1', '401003', '160.00', null, '0');
INSERT INTO `article` VALUES ('237', '2', '18', '68', '1', 'thumb20150228180642108&msgmpolomaglietta.jpg', '1', '401003', '160.00', null, '0');
INSERT INTO `article` VALUES ('238', '1', '4', '13', '1', 'thumb20150228181052696&msgmcamicarosaegiallo.jpg', '1', '401004', '400.00', null, '0');
INSERT INTO `article` VALUES ('238', '2', '5', '13', '1', 'thumb20150228181052696&msgmcamicarosaegiallo.jpg', '1', '401004', '400.00', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('20', '5 Department', null, null, null, null);
INSERT INTO `brand` VALUES ('21', 'Alto', null, null, null, null);
INSERT INTO `brand` VALUES ('22', 'Andrea Incontr', null, null, null, null);
INSERT INTO `brand` VALUES ('23', 'Antipast', null, null, null, null);
INSERT INTO `brand` VALUES ('24', 'Bjorg', null, null, null, null);
INSERT INTO `brand` VALUES ('25', 'Carlo Contrada', null, null, null, null);
INSERT INTO `brand` VALUES ('26', 'Collection Privée', null, null, null, null);
INSERT INTO `brand` VALUES ('27', 'Damir Doma', null, null, null, null);
INSERT INTO `brand` VALUES ('29', 'Diptyque', null, null, null, null);
INSERT INTO `brand` VALUES ('30', 'Dusan', null, null, null, null);
INSERT INTO `brand` VALUES ('31', 'ES', null, null, null, null);
INSERT INTO `brand` VALUES ('32', 'Iossellini', null, null, null, null);
INSERT INTO `brand` VALUES ('33', 'Jamin Puech', null, null, null, null);
INSERT INTO `brand` VALUES ('34', 'Joe', null, null, null, null);
INSERT INTO `brand` VALUES ('35', 'Le prairies de Paris', null, null, null, null);
INSERT INTO `brand` VALUES ('36', 'Luna Bi', null, null, null, null);
INSERT INTO `brand` VALUES ('37', 'Marni', null, null, null, null);
INSERT INTO `brand` VALUES ('39', 'MSGM', null, null, null, null);
INSERT INTO `brand` VALUES ('40', 'Orion London', null, null, null, null);
INSERT INTO `brand` VALUES ('41', 'Paula Cademartori', null, null, null, null);
INSERT INTO `brand` VALUES ('42', 'Premiata White', null, null, null, null);
INSERT INTO `brand` VALUES ('43', 'Roberto del Carlo', null, null, null, null);
INSERT INTO `brand` VALUES ('44', 'Samantha Sung', null, null, null, null);
INSERT INTO `brand` VALUES ('45', 'Soho de Luxe', null, null, null, null);
INSERT INTO `brand` VALUES ('46', 'So nice', null, null, null, null);
INSERT INTO `brand` VALUES ('48', 'Volta', null, null, null, null);
INSERT INTO `brand` VALUES ('49', 'Usluaairlines', null, null, null, null);
INSERT INTO `brand` VALUES ('50', 'DesignInverso', null, null, null, null);
INSERT INTO `brand` VALUES ('51', 'Maria Calderara', null, null, null, null);
INSERT INTO `brand` VALUES ('52', 'Aranth', null, null, null, null);
INSERT INTO `brand` VALUES ('53', 'Bernstock Spiers', null, null, null, null);
INSERT INTO `brand` VALUES ('54', 'Patrizia Daliana', null, null, null, null);
INSERT INTO `brand` VALUES ('55', 'Peter Non', null, null, null, null);
INSERT INTO `brand` VALUES ('56', 'John & Pearl', null, null, null, null);
INSERT INTO `brand` VALUES ('57', 'Crash Baggage', null, null, null, null);
INSERT INTO `brand` VALUES ('58', 'Supe', null, null, null, null);
INSERT INTO `brand` VALUES ('59', 'Infra', null, null, null, null);
INSERT INTO `brand` VALUES ('60', 'STL Italy', null, null, null, null);
INSERT INTO `brand` VALUES ('61', 'PB 0110', null, null, null, null);

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
INSERT INTO `brand_descr` VALUES ('59', 'en', null);
INSERT INTO `brand_descr` VALUES ('59', 'it', null);
INSERT INTO `brand_descr` VALUES ('60', 'en', null);
INSERT INTO `brand_descr` VALUES ('60', 'it', null);
INSERT INTO `brand_descr` VALUES ('61', 'en', null);
INSERT INTO `brand_descr` VALUES ('61', 'it', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaigns
-- ----------------------------
INSERT INTO `campaigns` VALUES ('3', 'saldi 2015', '2015-01-02', '2015-03-18', '30');
INSERT INTO `campaigns` VALUES ('4', 'saldi 2015 inverno', '2015-01-02', '2015-03-18', '30');
INSERT INTO `campaigns` VALUES ('5', 'saldi accessori', '2015-01-02', '2015-03-17', '20');

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
INSERT INTO `color` VALUES ('18', 'en', 'TURQUASE');
INSERT INTO `color` VALUES ('18', 'it', 'TURCHESE');
INSERT INTO `color` VALUES ('19', 'en', 'OCEAN');
INSERT INTO `color` VALUES ('19', 'it', 'OCEANO');
INSERT INTO `color` VALUES ('20', 'en', 'CARBON');
INSERT INTO `color` VALUES ('20', 'it', 'CARBONE');
INSERT INTO `color` VALUES ('21', 'en', 'CINNAMON BROWN');
INSERT INTO `color` VALUES ('21', 'it', 'CANNELLA');
INSERT INTO `color` VALUES ('22', 'en', 'BLUE/BLACK');
INSERT INTO `color` VALUES ('22', 'it', 'BLU/BLACK');
INSERT INTO `color` VALUES ('23', 'en', 'copper ');
INSERT INTO `color` VALUES ('23', 'it', 'rame');
INSERT INTO `color` VALUES ('24', 'en', 'PINK GOLD');
INSERT INTO `color` VALUES ('24', 'it', 'ORO ROSA');
INSERT INTO `color` VALUES ('25', 'en', 'BORDAUX');
INSERT INTO `color` VALUES ('25', 'it', 'BORDAUX');
INSERT INTO `color` VALUES ('26', 'en', 'LILAC');
INSERT INTO `color` VALUES ('26', 'it', 'LILLA');
INSERT INTO `color` VALUES ('27', 'en', 'MULTICOLOR');
INSERT INTO `color` VALUES ('27', 'it', 'MULTICOLOR');
INSERT INTO `color` VALUES ('28', 'en', 'CYPRESS');
INSERT INTO `color` VALUES ('28', 'it', 'CIPRESSO');
INSERT INTO `color` VALUES ('29', 'en', 'CANDY');
INSERT INTO `color` VALUES ('29', 'it', 'CANDY');
INSERT INTO `color` VALUES ('30', 'en', 'SILVER/BLACK');
INSERT INTO `color` VALUES ('30', 'it', 'ARGENTO/NERO');
INSERT INTO `color` VALUES ('31', 'en', 'DARK RED');
INSERT INTO `color` VALUES ('31', 'it', 'ROSSO SCURO');
INSERT INTO `color` VALUES ('32', 'en', 'EMERALD-GREEN');
INSERT INTO `color` VALUES ('32', 'it', 'SMERALDO');
INSERT INTO `color` VALUES ('33', 'en', 'SAVANNAH');
INSERT INTO `color` VALUES ('33', 'it', 'SAVANA');
INSERT INTO `color` VALUES ('34', 'en', 'WATER');
INSERT INTO `color` VALUES ('34', 'it', 'ACQUA');
INSERT INTO `color` VALUES ('36', 'en', 'FLUORESCENT YELLOW');
INSERT INTO `color` VALUES ('36', 'it', 'GIALLO FLUO');
INSERT INTO `color` VALUES ('37', 'en', 'BLUE/GOLD');
INSERT INTO `color` VALUES ('37', 'it', 'BLU/ORO');
INSERT INTO `color` VALUES ('38', 'en', 'FLUORESCENT YELLOW/GOLD');
INSERT INTO `color` VALUES ('38', 'it', 'GIALLO FLUO/ORO');
INSERT INTO `color` VALUES ('39', 'en', 'DARK GREEN/GOLD');
INSERT INTO `color` VALUES ('39', 'it', 'VERDE BOTTIGLIA/ORO');
INSERT INTO `color` VALUES ('40', 'en', 'FUXSIA/GOLD');
INSERT INTO `color` VALUES ('40', 'it', 'FUXSIA/ORO');
INSERT INTO `color` VALUES ('41', 'en', 'TURQUOISE/GOLD');
INSERT INTO `color` VALUES ('41', 'it', 'TURCHESE/ORO');
INSERT INTO `color` VALUES ('42', 'en', 'BLACK/GOLD');
INSERT INTO `color` VALUES ('42', 'it', 'NERO/ORO');
INSERT INTO `color` VALUES ('43', 'en', 'METAL GOLD/GOLD');
INSERT INTO `color` VALUES ('43', 'it', 'ORO METAL/ORO');
INSERT INTO `color` VALUES ('44', 'en', 'METAL LEAD/GOLD');
INSERT INTO `color` VALUES ('44', 'it', 'PIOMBO METAL/ORO');
INSERT INTO `color` VALUES ('45', 'en', 'SILVER/SILVER');
INSERT INTO `color` VALUES ('45', 'it', 'ARGENTO/ARGENTO');
INSERT INTO `color` VALUES ('46', 'en', 'AMBER');
INSERT INTO `color` VALUES ('46', 'it', 'AMBRA');
INSERT INTO `color` VALUES ('47', 'en', 'bordaux/gold');
INSERT INTO `color` VALUES ('47', 'it', 'bordaux/oro');
INSERT INTO `color` VALUES ('48', 'en', 'N/A');
INSERT INTO `color` VALUES ('48', 'it', 'N/A');
INSERT INTO `color` VALUES ('49', 'en', 'PINK');
INSERT INTO `color` VALUES ('49', 'it', 'CIPOLLA');
INSERT INTO `color` VALUES ('50', 'en', 'APRICOT');
INSERT INTO `color` VALUES ('50', 'it', 'ALBICOCCA');
INSERT INTO `color` VALUES ('51', 'en', 'SANDY');
INSERT INTO `color` VALUES ('51', 'it', 'SABBIA');
INSERT INTO `color` VALUES ('52', 'en', 'CURRY');
INSERT INTO `color` VALUES ('52', 'it', 'CURRY');
INSERT INTO `color` VALUES ('53', 'en', 'LIGHT PEACH');
INSERT INTO `color` VALUES ('53', 'it', 'PESCA ');
INSERT INTO `color` VALUES ('54', 'en', 'mint green');
INSERT INTO `color` VALUES ('54', 'it', 'mint green');
INSERT INTO `color` VALUES ('55', 'en', 'GIRAF');
INSERT INTO `color` VALUES ('55', 'it', 'GIRAFFA');
INSERT INTO `color` VALUES ('56', 'en', 'bronze');
INSERT INTO `color` VALUES ('56', 'it', 'bronzo');
INSERT INTO `color` VALUES ('57', 'en', 'LEATHER');
INSERT INTO `color` VALUES ('57', 'it', 'PELLE');
INSERT INTO `color` VALUES ('58', 'en', 'brown and yellow');
INSERT INTO `color` VALUES ('58', 'it', 'biscotto');
INSERT INTO `color` VALUES ('59', 'en', 'RED/PINK');
INSERT INTO `color` VALUES ('59', 'it', 'ROSSO/FUXSIA');
INSERT INTO `color` VALUES ('60', 'en', 'RED/FUCSIA');
INSERT INTO `color` VALUES ('60', 'it', 'ROSSO/FUCSIA');
INSERT INTO `color` VALUES ('61', 'en', 'PINK/LIGHT BLU');
INSERT INTO `color` VALUES ('61', 'it', 'ROSA/CELESTE');
INSERT INTO `color` VALUES ('62', 'en', 'PINK/GREEN');
INSERT INTO `color` VALUES ('62', 'it', 'ROSA/VERDE');
INSERT INTO `color` VALUES ('63', 'en', 'WHITE/LIGHT BLU');
INSERT INTO `color` VALUES ('63', 'it', 'BIANCO/CELESTE');
INSERT INTO `color` VALUES ('64', 'en', 'PINK/WHITE');
INSERT INTO `color` VALUES ('64', 'it', 'ROSA/BIANCO');
INSERT INTO `color` VALUES ('65', 'en', 'BLACK/WHITE');
INSERT INTO `color` VALUES ('65', 'it', 'NERO/BIANCO');
INSERT INTO `color` VALUES ('66', 'en', 'COGNAC');
INSERT INTO `color` VALUES ('66', 'it', 'COGNAC');
INSERT INTO `color` VALUES ('67', 'en', 'NATURAL');
INSERT INTO `color` VALUES ('67', 'it', 'NATURALE');
INSERT INTO `color` VALUES ('68', 'en', 'BLUE/PINK/BROWN');
INSERT INTO `color` VALUES ('68', 'it', 'BLU/ROSA/MARRONE');

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
INSERT INTO `customer` VALUES ('carin.vandeostijne@eesc.europa.eu', 'Cvdo9322', 'Carin', 'Vande Ostijne', null, '2');
INSERT INTO `customer` VALUES ('dott.marinomartini@alice.it', 'scierba', 'marino', 'martini', null, '2');
INSERT INTO `customer` VALUES ('giuliagalotta@hotmail.it', 'stazione', 'Giulia', 'Galotta', null, '2');
INSERT INTO `customer` VALUES ('guidiantonella@gmail.com', 'fiorentina', 'Guidi', 'Antonella ', null, '2');
INSERT INTO `customer` VALUES ('guoyuhan1990@hotmail.com', '19901001', 'Yuhan', 'Guo', null, '2');
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com', 'benito79', 'JACOPO', 'FREDIANI', null, '2');
INSERT INTO `customer` VALUES ('nancysqn@gmail.com', '123456', 'Qinan Shen', 'nancy', null, '2');
INSERT INTO `customer` VALUES ('shop@magboutique.it', 'shop@mag', 'A', 'A', 'A', '1');
INSERT INTO `customer` VALUES ('simone.bagnolesi@gmail.com', 'didone1976', 'simone', 'bagnolesi', null, '2');
INSERT INTO `customer` VALUES ('Solveig.pfefferkorn@arcor.de', 'Peace108!', 'Solveig ', 'Pfefferkorn ', null, '2');

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
INSERT INTO `customer_roles` VALUES ('carin.vandeostijne@eesc.europa.eu', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('dott.marinomartini@alice.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giuliagalotta@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('guidiantonella@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('guoyuhan1990@hotmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('nancysqn@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('shop@magboutique.it', 'AMMINISTRATORE');
INSERT INTO `customer_roles` VALUES ('simone.bagnolesi@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('Solveig.pfefferkorn@arcor.de', 'CUSTOMER');

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
INSERT INTO `gender` VALUES ('1', 'en', 'Shop');
INSERT INTO `gender` VALUES ('1', 'it', 'Shop');

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
INSERT INTO `ipnmessages` VALUES ('41', '51X15420GB234672R', '2015-01-29 15:09:28', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=HBXBLDBX2FL82;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=3.61;CORRELATIONID=3c0378847c240;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=51X15420GB234672R;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-45E561315M5255930;PAYMENTINFO_0_ERRORCODE=0;BUILD=15009693;PAYMENTINFO_0_ORDERTIME=2015-01-29T14:17:50Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=96.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-29T14:17:51Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('38', '5DU01821FH5415014', '2015-01-21 13:01:56', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=HBXBLDBX2FL82;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.38;CORRELATIONID=52c93e211b50f;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5DU01821FH5415014;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-80D89864YH6877847;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-21T12:10:07Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=1.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=2417-4830-1923-2942;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-21T12:10:08Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('38', '9W302998BL521464S', '2015-01-21 13:03:46', 'mc_gross=-1.00;mc_currency=EUR;payment_status=Refunded;txn_id=9W302998BL521464S;parent_txn_id=5DU01821FH5415014;custom=38;receiver_email=info@magboutique.it;reason_code=refund', 'Refunded', '', '1', null);

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
INSERT INTO `material` VALUES ('6', 'en', 'PLASTIC');
INSERT INTO `material` VALUES ('6', 'it', 'PLASTICA');
INSERT INTO `material` VALUES ('7', 'en', 'VISCOSE');
INSERT INTO `material` VALUES ('7', 'it', 'VISCOSA');
INSERT INTO `material` VALUES ('8', 'en', 'ALPACA WOOL');
INSERT INTO `material` VALUES ('8', 'it', 'ALPACA');
INSERT INTO `material` VALUES ('9', 'en', 'VIRGIN WOOL');
INSERT INTO `material` VALUES ('9', 'it', 'LANA VERGINE');
INSERT INTO `material` VALUES ('10', 'en', 'WOOL');
INSERT INTO `material` VALUES ('10', 'it', 'LANA');
INSERT INTO `material` VALUES ('11', 'en', 'CASHEMERE');
INSERT INTO `material` VALUES ('11', 'it', 'CASHEMERE');
INSERT INTO `material` VALUES ('12', 'en', 'MOHAIR WOOL');
INSERT INTO `material` VALUES ('12', 'it', 'LANA MOHAIR');
INSERT INTO `material` VALUES ('13', 'en', 'SILVER');
INSERT INTO `material` VALUES ('13', 'it', 'ARGENTO');
INSERT INTO `material` VALUES ('14', 'en', 'ORO');
INSERT INTO `material` VALUES ('14', 'it', 'ORO');
INSERT INTO `material` VALUES ('15', 'en', 'METAL');
INSERT INTO `material` VALUES ('15', 'it', 'METALLO');
INSERT INTO `material` VALUES ('16', 'en', 'RESIN');
INSERT INTO `material` VALUES ('16', 'it', 'RESINA');
INSERT INTO `material` VALUES ('17', 'en', 'TAFFETA');
INSERT INTO `material` VALUES ('17', 'it', 'TAFFETA');
INSERT INTO `material` VALUES ('18', 'en', 'OSTRICH');
INSERT INTO `material` VALUES ('18', 'it', 'STRUZZO');
INSERT INTO `material` VALUES ('19', 'en', 'PONY HORSE');
INSERT INTO `material` VALUES ('19', 'it', 'CAVALLINO');
INSERT INTO `material` VALUES ('20', 'en', 'PVC');
INSERT INTO `material` VALUES ('20', 'it', 'PVC');
INSERT INTO `material` VALUES ('21', 'en', 'NAPPA LEATHER');
INSERT INTO `material` VALUES ('21', 'it', 'NAPPA');
INSERT INTO `material` VALUES ('22', 'en', 'SATIN');
INSERT INTO `material` VALUES ('22', 'it', 'RASO');
INSERT INTO `material` VALUES ('23', 'en', 'FELT');
INSERT INTO `material` VALUES ('23', 'it', 'FELTRO');
INSERT INTO `material` VALUES ('24', 'en', 'LEATHER');
INSERT INTO `material` VALUES ('24', 'it', 'PELLE');
INSERT INTO `material` VALUES ('25', 'en', 'HORN');
INSERT INTO `material` VALUES ('25', 'it', 'CORNO');
INSERT INTO `material` VALUES ('26', 'en', 'ECO-FUR');
INSERT INTO `material` VALUES ('26', 'it', 'ECO-PELLICCIA');
INSERT INTO `material` VALUES ('27', 'en', 'WATER');
INSERT INTO `material` VALUES ('27', 'it', 'ACQUA');
INSERT INTO `material` VALUES ('28', 'en', 'ESSENCE');
INSERT INTO `material` VALUES ('28', 'it', 'ESSENZA');
INSERT INTO `material` VALUES ('29', 'en', 'CREAM');
INSERT INTO `material` VALUES ('29', 'it', 'CREMA');
INSERT INTO `material` VALUES ('30', 'en', 'SOAP');
INSERT INTO `material` VALUES ('30', 'it', 'SAPONE');
INSERT INTO `material` VALUES ('31', 'en', 'OIL');
INSERT INTO `material` VALUES ('31', 'it', 'OLIO');
INSERT INTO `material` VALUES ('32', 'en', 'brass');
INSERT INTO `material` VALUES ('32', 'it', 'ottone');
INSERT INTO `material` VALUES ('33', 'en', 'Polycarbonate');
INSERT INTO `material` VALUES ('33', 'it', 'Policarbonato');
INSERT INTO `material` VALUES ('34', 'en', 'TECHNICAL FABRIC');
INSERT INTO `material` VALUES ('34', 'it', 'TESSUTO TECNICO');
INSERT INTO `material` VALUES ('35', 'en', 'RAPHIA');
INSERT INTO `material` VALUES ('35', 'it', 'RAFIA');
INSERT INTO `material` VALUES ('36', 'en', 'BRONZE');
INSERT INTO `material` VALUES ('36', 'it', 'BRONZO');
INSERT INTO `material` VALUES ('37', 'en', 'WAX');
INSERT INTO `material` VALUES ('37', 'it', 'CERA');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_refound
-- ----------------------------
INSERT INTO `order_refound` VALUES ('18', '38', 'jacopo.frediani@gmail.com', '5DU01821FH5415014', '1.00', 'prova', 'R', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('23', 'simone.bagnolesi@gmail.com', '678.00', null, '2', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('24', 'simone.bagnolesi@gmail.com', '260.00', null, '2', '2', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('29', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('30', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('31', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('32', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('33', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('36', 'jacopo.frediani@gmail.com', '156.00', null, '4', '4', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('37', 'jacopo.frediani@gmail.com', '49.00', null, '4', '4', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('38', 'jacopo.frediani@gmail.com', '1.00', '5DU01821FH5415014', '4', '4', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('39', 'giuliagalotta@hotmail.it', '49.00', null, '9', '9', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('40', 'jacopo.frediani@gmail.com', '156.00', null, '4', '4', '1', null, null, null, '0');
INSERT INTO `orders` VALUES ('41', 'dott.marinomartini@alice.it', '96.00', '51X15420GB234672R', '11', '11', '1', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_articles
-- ----------------------------
INSERT INTO `orders_articles` VALUES ('1', '23', '61', '1', '1', '340.00', null);
INSERT INTO `orders_articles` VALUES ('2', '23', '62', '2', '1', '338.00', null);
INSERT INTO `orders_articles` VALUES ('3', '24', '99', '1', '1', '260.00', null);
INSERT INTO `orders_articles` VALUES ('4', '29', '146', '1', '1', '70.00', null);
INSERT INTO `orders_articles` VALUES ('5', '30', '146', '1', '1', '70.00', null);
INSERT INTO `orders_articles` VALUES ('6', '31', '146', '1', '1', '70.00', null);
INSERT INTO `orders_articles` VALUES ('7', '32', '146', '1', '1', '70.00', null);
INSERT INTO `orders_articles` VALUES ('8', '33', '146', '1', '1', '70.00', null);
INSERT INTO `orders_articles` VALUES ('9', '36', '143', '1', '1', '156.00', null);
INSERT INTO `orders_articles` VALUES ('10', '37', '146', '1', '1', '49.00', null);
INSERT INTO `orders_articles` VALUES ('11', '38', '27', '1', '1', '1.00', null);
INSERT INTO `orders_articles` VALUES ('12', '39', '146', '1', '1', '49.00', null);
INSERT INTO `orders_articles` VALUES ('13', '40', '143', '1', '1', '156.00', null);
INSERT INTO `orders_articles` VALUES ('14', '41', '124', '4', '1', '96.00', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('27', '1', '18', '37', '1', '30', 'thumb20141027161832712&45239055TE_13P_F.jpg', '1', '2014-12-14 16:00:00', '3', '3', null, null);
INSERT INTO `product` VALUES ('30', '1', '18', '50', '120', '0', 'thumb20141110145915895&IMG_5244.JPG', '2', '2014-12-14 16:00:00', null, '6', null, null);
INSERT INTO `product` VALUES ('31', '1', '5', '37', '745', '0', 'thumb20141202123227110&IMG_1577.jpg', '1', '2014-12-14 16:00:00', '3', '2', null, null);
INSERT INTO `product` VALUES ('33', '1', '5', '37', '840', '0', 'thumb20141202123438452&IMG_1586.jpg', '1', '2014-12-14 16:00:00', '3', '2', null, null);
INSERT INTO `product` VALUES ('34', '1', '5', '37', '650', '0', 'thumb20141202123558626&IMG_1582.jpg', '1', '2014-12-14 16:00:00', '3', '7', null, null);
INSERT INTO `product` VALUES ('35', '1', '7', '37', '485', '0', 'thumb20141202130425171&IMG_1565.JPG', '1', '2014-12-14 16:00:00', '3', '7', null, null);
INSERT INTO `product` VALUES ('36', '1', '8', '37', '1080', '0', 'thumb20141202130955055&IMG_1588.jpg', '1', '2014-12-14 16:00:00', '3', '8', null, null);
INSERT INTO `product` VALUES ('37', '1', '12', '37', '510', '0', 'thumb20141127125558413&IMG_1571.jpg', '1', '2014-12-14 16:00:00', '3', '2', null, null);
INSERT INTO `product` VALUES ('38', '1', '15', '37', '465', '0', 'thumb20141202131037758&IMG_1569.JPG', '1', '2014-12-14 16:00:00', '3', '9', null, null);
INSERT INTO `product` VALUES ('39', '1', '22', '37', '645', '0', 'thumb20141202151027733&IMG_1563.jpg', '1', '2014-12-14 16:00:00', '3', '2', null, null);
INSERT INTO `product` VALUES ('40', '1', '7', '39', '140', '0', 'thumb20141202130553258&IMG_1520.jpg', '1', '2014-12-14 16:00:00', '3', '1', null, null);
INSERT INTO `product` VALUES ('41', '1', '4', '39', '1270', '0', 'thumb20141206192714324&IMG_1552.jpg', '1', '2014-12-14 16:00:00', '3', '10', null, null);
INSERT INTO `product` VALUES ('42', '1', '4', '39', '660', '0', 'thumb20141206192525431&IMG_1561.jpg', '1', '2014-12-14 16:00:00', '3', '10', null, null);
INSERT INTO `product` VALUES ('43', '1', '5', '39', '545', '0', 'thumb20141202123656922&IMG_1540.jpg', '1', '2014-12-14 16:00:00', '3', '5', null, null);
INSERT INTO `product` VALUES ('44', '1', '16', '39', '180', '0', 'thumb20141202131809015&IMG_1544.jpg', '1', '2014-12-14 16:00:00', '3', '5', null, null);
INSERT INTO `product` VALUES ('45', '1', '5', '39', '370', '0', 'thumb20141202123833980&IMG_1546.jpg', '1', '2014-12-14 16:00:00', '3', '5', null, null);
INSERT INTO `product` VALUES ('46', '1', '12', '39', '245', '0', 'thumb20141202131611968&IMG_1530.jpg', '2', '2015-02-24 00:00:00', '3', '5', null, null);
INSERT INTO `product` VALUES ('47', '1', '4', '30', '1620', '0', 'thumb20141206192850317&IMG_1600.jpg', '1', '2014-12-14 16:00:00', '3', '8', null, null);
INSERT INTO `product` VALUES ('48', '1', '16', '30', '715', '0', 'thumb20141202131911122&IMG_1598.jpg', '1', '2014-12-14 16:00:00', '3', '11', null, null);
INSERT INTO `product` VALUES ('49', '1', '16', '37', '445', '0', 'thumb20141202131951185&IMG_1592.jpg', '1', '2014-12-14 16:00:00', '3', '9', null, null);
INSERT INTO `product` VALUES ('50', '1', '16', '39', '380', '0', 'thumb20141202132026576&IMG_1548.jpg', '1', '2014-12-14 16:00:00', '3', '10', null, null);
INSERT INTO `product` VALUES ('51', '1', '22', '39', '270', '0', 'thumb20141202151118594&IMG_1505.jpg', '2', '2015-01-24 00:00:00', '4', '7', null, null);
INSERT INTO `product` VALUES ('52', '1', '15', '39', '230', '0', 'thumb20141202132537186&IMG_1506.JPG', '1', '2014-12-14 16:00:00', '4', '9', null, null);
INSERT INTO `product` VALUES ('53', '1', '7', '39', '355', '0', 'thumb20141202130654886&IMG_1518.JPG', '1', '2014-12-14 16:00:00', '4', '1', null, null);
INSERT INTO `product` VALUES ('54', '1', '16', '51', '325', '30', 'thumb20141202132105618&IMG_1603.jpg', '1', '2014-12-14 16:00:00', '4', '5', null, null);
INSERT INTO `product` VALUES ('55', '1', '22', '51', '275', '0', 'thumb20141202151317124&IMG_1611.jpg', '1', '2014-12-14 16:00:00', '4', '5', null, null);
INSERT INTO `product` VALUES ('56', '1', '22', '51', '200', '0', 'thumb20141202151353554&IMG_1619.jpg', '1', '2014-12-14 16:00:00', '4', '5', null, null);
INSERT INTO `product` VALUES ('57', '1', '5', '25', '450', '0', 'thumb20141202124007840&IMG_1637.jpg', '1', '2014-12-14 16:00:00', '4', '5', null, null);
INSERT INTO `product` VALUES ('58', '1', '5', '25', '500', '0', 'thumb20141202124107859&IMG_1651.jpg', '1', '2014-12-14 16:00:00', '4', '12', null, null);
INSERT INTO `product` VALUES ('59', '1', '3', '25', '375', '0', 'thumb20141206192337282&IMG_1656.jpg', '1', '2014-12-14 16:00:00', '4', '2', null, null);
INSERT INTO `product` VALUES ('60', '1', '3', '25', '375', '0', 'thumb20141206192140447&IMG_1643.jpg', '1', '2014-12-14 16:00:00', '4', '2', null, null);
INSERT INTO `product` VALUES ('61', '1', '12', '25', '340', '0', 'thumb20141202131652487&IMG_1647.jpg', '1', '2014-12-14 16:00:00', '4', '10', null, null);
INSERT INTO `product` VALUES ('62', '1', '3', '51', '338', '0', 'thumb20141206192010583&IMG_1642.JPG', '1', '2014-12-14 16:00:00', '4', '5', null, null);
INSERT INTO `product` VALUES ('63', '1', '1', '24', '240', '0', 'thumb20141202151919904&anbjorg1.jpg', '1', '2014-12-14 16:00:00', '5', '13', null, null);
INSERT INTO `product` VALUES ('64', '1', '1', '24', '240', '0', 'thumb20141202151945773&annellobjorg.jpg', '2', '2015-02-24 00:00:00', '5', '13', null, null);
INSERT INTO `product` VALUES ('66', '1', '1', '24', '250', '0', 'thumb20141202152004107&bjorgneck1.jpg', '1', '2014-12-14 16:00:00', '5', '13', null, null);
INSERT INTO `product` VALUES ('67', '1', '1', '24', '160', '0', 'thumb20141202152021261&bjorgringbracelet.jpg', '1', '2014-12-14 16:00:00', '5', '13', null, null);
INSERT INTO `product` VALUES ('68', '1', '1', '51', '325', '0', 'thumb20141202152046981&calderaranecklace1.jpg', '2', '2015-01-21 00:00:00', '5', '16', null, null);
INSERT INTO `product` VALUES ('69', '1', '1', '51', '315', '0', 'thumb20141202152105344&calderaranecklace3.jpg', '1', '2014-12-14 16:00:00', '5', '2', null, null);
INSERT INTO `product` VALUES ('70', '1', '1', '51', '300', '0', 'thumb20141202152121476&calderaranecklace2.jpg', '2', '2015-01-26 00:00:00', '5', '1', null, null);
INSERT INTO `product` VALUES ('71', '1', '1', '51', '220', '0', 'thumb20141202152139351&calderaranecklace5.jpg', '1', '2014-12-14 16:00:00', '5', '1', null, null);
INSERT INTO `product` VALUES ('72', '1', '1', '51', '110', '0', 'thumb20141202152158886&orrechinicalderara.jpg', '1', '2014-12-14 16:00:00', '5', '17', null, null);
INSERT INTO `product` VALUES ('73', '1', '1', '24', '365', '0', 'thumb20141202152220159&heartbjorgnecklace.jpg', '1', '2014-12-14 16:00:00', '5', '13', null, null);
INSERT INTO `product` VALUES ('74', '1', '18', '33', '190', '0', 'thumb20141202153028751&jaminbag1.jpg', '1', '2014-12-14 16:00:00', '5', '18', null, null);
INSERT INTO `product` VALUES ('75', '1', '18', '33', '435', '0', 'thumb20141202153049081&jaminbag2.jpg', '1', '2014-12-14 16:00:00', '5', '19', null, null);
INSERT INTO `product` VALUES ('76', '1', '18', '33', '695', '0', 'thumb20141202153106520&jaminbig2.jpg', '2', '2015-02-04 00:00:00', '5', '19', null, null);
INSERT INTO `product` VALUES ('77', '1', '18', '37', '220', '20', 'thumb20141202153124945&marnibag.jpg', '1', '2014-12-14 16:00:00', '5', '20', null, null);
INSERT INTO `product` VALUES ('78', '1', '18', '41', '830', '0', 'thumb20141202153145383&paula3.jpg', '2', '2014-12-23 00:00:00', null, '22', null, null);
INSERT INTO `product` VALUES ('79', '1', '18', '41', '1450', '0', 'thumb20141202153201310&paulapink.jpg', '1', '2014-12-14 16:00:00', '5', '21', null, null);
INSERT INTO `product` VALUES ('80', '1', '18', '41', '1500', '0', 'thumb20141202153218767&cademartori2.jpg', '1', '2014-12-14 16:00:00', '5', '21', null, null);
INSERT INTO `product` VALUES ('81', '1', '18', '37', '710', '0', 'thumb20141202153239692&marnipochette.jpg', '1', '2014-12-14 16:00:00', '5', '23', null, null);
INSERT INTO `product` VALUES ('82', '1', '20', '52', '300', '30', 'thumb20141202153342718&aranthsilver.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('83', '1', '20', '37', '470', '0', 'thumb20141202153400698&marniboots1.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('84', '1', '20', '37', '590', '0', 'thumb20141202153428962&marniborde1.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('85', '1', '20', '37', '470', '30', 'thumb20141202153448965&marnimaryjane2.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('86', '1', '20', '37', '290', '30', 'thumb20141202153509312&marnisandals.jpg', '1', '2014-12-14 16:00:00', '4', '19', null, null);
INSERT INTO `product` VALUES ('87', '1', '1', '37', '385', '0', 'thumb20141119170640438&marninecklace1.jpg', '2', '2014-12-14 16:00:00', null, '16', null, null);
INSERT INTO `product` VALUES ('88', '1', '1', '37', '385', '20', null, '1', '2014-12-14 16:00:00', '5', '16', null, null);
INSERT INTO `product` VALUES ('89', '1', '1', '37', '380', '20', 'thumb20141202152431774&marninecklace3.jpg', '1', '2014-12-14 16:00:00', '5', '25', null, null);
INSERT INTO `product` VALUES ('90', '1', '1', '53', '130', '0', 'thumb20141202152453731&capbernstock2.jpg', '2', '2015-02-05 00:00:00', '5', '9', null, null);
INSERT INTO `product` VALUES ('91', '1', '1', '53', '130', '20', null, '1', '2014-12-14 16:00:00', '5', '9', null, null);
INSERT INTO `product` VALUES ('92', '1', '1', '53', '130', '20', 'thumb20141202152737972&capbernstock7.jpg', '1', '2014-12-14 16:00:00', '5', '9', null, null);
INSERT INTO `product` VALUES ('93', '1', '1', '53', '130', '20', 'thumb20141202152814492&capbernstock9.jpg', '1', '2014-12-14 16:00:00', '5', '1', null, null);
INSERT INTO `product` VALUES ('94', '1', '1', '54', '350', '0', 'thumb20141202152838307&pdbrac.jpg', '2', '2015-01-28 00:00:00', '5', '14', null, null);
INSERT INTO `product` VALUES ('95', '1', '1', '54', '325', '0', 'thumb20141202152859068&pdbracel2.jpg', '2', '2015-01-28 00:00:00', '5', '14', null, null);
INSERT INTO `product` VALUES ('96', '1', '1', '55', '330', '0', 'thumb20141120145300937&peternon1.jpg', '2', '2014-12-14 16:00:00', null, '24', null, null);
INSERT INTO `product` VALUES ('97', '1', '20', '55', '395', '0', 'thumb20141202153531948&peternonfront.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('98', '1', '20', '55', '330', '30', 'thumb20141202153558877&peternon1.jpg', '1', '2014-12-14 16:00:00', '4', '24', null, null);
INSERT INTO `product` VALUES ('99', '1', '20', '42', '260', '0', 'thumb20141202153624436&premiatafur.jpg', '1', '2014-12-14 16:00:00', '4', '26', null, null);
INSERT INTO `product` VALUES ('100', '1', '22', '26', '325', '0', 'thumb20141202151441584&IMG_1626.jpg', '1', '2014-12-14 16:00:00', '4', '12', null, null);
INSERT INTO `product` VALUES ('101', '1', '24', '29', '98', '0', 'thumb20141202112331383&edt_new_color_resize_eau_de_lierre.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('102', '1', '24', '29', '98', '0', 'thumb20141202112438343&edt_new_color_resize_oyedo_1.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('103', '1', '24', '29', '98', '0', 'thumb20141202112523760&edt_new_color_resize_eau_duelle.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('104', '1', '24', '29', '98', '0', 'thumb20141202112601322&edt_new_color_resize_philosykos.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('105', '1', '24', '29', '98', '0', 'thumb20141202112633185&edt_new_color_resize_doson.jpg', '1', '2014-12-14 16:00:00', null, '28', null, null);
INSERT INTO `product` VALUES ('106', '1', '24', '29', '108', '0', 'thumb20141202112715827&lombre_dans_resize.jpg', '1', '2014-12-14 16:00:00', null, '28', null, null);
INSERT INTO `product` VALUES ('107', '1', '24', '29', '108', '0', 'thumb20141202112754652&philosykos_resize-1.jpg', '1', '2014-12-14 16:00:00', null, '28', null, null);
INSERT INTO `product` VALUES ('108', '1', '24', '29', '108', '0', 'thumb20141202112855644&volutesp75.jpg', '1', '2014-12-14 16:00:00', null, '28', null, null);
INSERT INTO `product` VALUES ('109', '1', '24', '29', '98', '0', 'thumb20141202112209376&tamdao100v1.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('110', '1', '24', '29', '98', '0', 'thumb20141202112943080&vetyverio-flacon-dos.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('111', '1', '24', '29', '98', '0', 'thumb20141202113028908&volute100v1_1.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('112', '1', '25', '29', '45', '0', 'thumb20141202113440235&aobc_freshlotion.jpg', '1', '2014-12-14 16:00:00', null, '29', null, null);
INSERT INTO `product` VALUES ('113', '1', '25', '29', '55', '0', 'thumb20141202113844846&bc_pommade_exfoliante-pot_q.jpg', '1', '2014-12-14 16:00:00', null, '29', null, null);
INSERT INTO `product` VALUES ('114', '1', '25', '29', '67', '0', 'thumb20141202113528673&abc_creme_riche_1.jpg', '1', '2014-12-14 16:00:00', null, '29', null, null);
INSERT INTO `product` VALUES ('115', '1', '25', '29', '35', '0', 'thumb20141202113615259&abc_baume_genereux.jpg', '1', '2014-12-14 16:00:00', null, '29', null, null);
INSERT INTO `product` VALUES ('116', '1', '25', '29', '38', '0', 'thumb20141202113344716&bc_emulsion_velours-pot_q.jpg', '1', '2014-12-14 16:00:00', null, '29', null, null);
INSERT INTO `product` VALUES ('124', '1', '18', '50', '120', '20', 'thumb20141202153253583&bagsdesign2.jpg', '1', '2014-12-14 16:00:00', '5', '20', null, null);
INSERT INTO `product` VALUES ('125', '1', '18', '50', '130', '0', 'thumb20141202153314420&designinverso1.jpg', '1', '2014-12-14 16:00:00', '5', '20', null, null);
INSERT INTO `product` VALUES ('132', '1', '25', '29', '60', '0', 'thumb20141202113709727&bc_revitalizing-shower-gel_q.jpg', '1', '2014-12-14 16:00:00', null, '31', null, null);
INSERT INTO `product` VALUES ('140', '1', '24', '29', '125', '0', 'thumb20141211162509107&34collection_essences-insensees_edp100.jpg', '1', '2014-12-14 16:00:00', null, '27', null, null);
INSERT INTO `product` VALUES ('143', '1', '1', '56', '195', '0', 'thumb20141212155904883&meteor-necklace_1412244678_1.jpg', '1', '2014-12-14 16:00:00', '5', '32', null, null);
INSERT INTO `product` VALUES ('144', '1', '7', '39', '138', '0', 'thumb20141216121556705&msgmfelpa.jpg', '1', '2014-12-16 12:12:06', '4', '1', null, null);
INSERT INTO `product` VALUES ('145', '1', '18', '41', '830', '0', 'thumb20141216162913536&paula3.jpg', '1', '2014-12-16 16:27:08', '5', '24', null, null);
INSERT INTO `product` VALUES ('146', '1', '21', '39', '70', '0', 'thumb20141217115923929&msgmtshirt.jpg', '1', '2014-12-17 11:56:08', '4', '1', null, null);
INSERT INTO `product` VALUES ('147', '1', '25', '29', '75', '0', 'thumb20141223141224857&winter14_coffret_l27art_du_soin_rvb_resized_1.jpg', '1', '2014-12-23 14:06:25', null, '29', null, null);
INSERT INTO `product` VALUES ('148', '1', '26', '57', '189', '0', 'thumb20141223142939003&cabin2wheels-bright-gold.jpg', '1', '2014-12-23 14:28:06', null, '33', null, null);
INSERT INTO `product` VALUES ('149', '1', '18', '58', '120', '0', 'thumb20141229173329066&tumblr_nhcqr9xd7R1rvje7uo1_1280.jpg', '1', '2014-12-29 17:29:32', null, '5', null, null);
INSERT INTO `product` VALUES ('150', '1', '18', '58', '120', '0', 'thumb20141229173954428&tumblr_nhcr0lQrD11rvje7uo1_1280.jpg', '1', '2014-12-29 17:35:52', null, '5', null, null);
INSERT INTO `product` VALUES ('151', '1', '18', '58', '120', '0', 'thumb20141229174412545&tumblr_nhcr27ZX4u1rvje7uo1_1280.jpg', '1', '2014-12-29 17:37:48', null, '5', null, null);
INSERT INTO `product` VALUES ('152', '1', '18', '58', '90', '0', 'thumb20141229174737659&tumblr_nhcquyJbkC1rvje7uo1_1280.jpg', '1', '2014-12-29 17:41:03', null, '5', null, null);
INSERT INTO `product` VALUES ('153', '1', '18', '58', '90', '0', 'thumb20141229181241410&004_4f896e20-8403-4c35-9bc6-d8a9c92f4839.JPG', '1', '2014-12-29 18:05:40', null, '5', null, null);
INSERT INTO `product` VALUES ('154', '1', '4', '39', '880', '0', 'thumb20141231105108080&tumblr_nhelok6twK1rvje7uo1_1280.jpg', '1', '2014-12-31 10:47:02', '4', '26', null, null);
INSERT INTO `product` VALUES ('155', '1', '4', '39', '495', '30', 'thumb20150108150505522&m-193-286511-2-gWO6PlkHA67e.jpg', '2', '2015-01-15 00:00:00', null, '10', null, null);
INSERT INTO `product` VALUES ('156', '1', '20', '26', '420', '30', 'thumb20150108152121511&44717922gs_11_a.jpg', '1', '2015-01-08 15:14:11', null, '24', null, null);
INSERT INTO `product` VALUES ('157', '1', '20', '26', '249', '30', 'thumb20150108152416203&44732642cb_11_a.jpg', '1', '2015-01-08 15:17:27', null, '19', null, null);
INSERT INTO `product` VALUES ('158', '1', '5', '37', '930', '0', 'thumb20150121120920473&marniabito1.jpg', '1', '2015-01-21 12:02:19', null, '1', null, null);
INSERT INTO `product` VALUES ('159', '1', '22', '37', '440', '0', 'thumb20150121140840915&marnitop1.jpg', '1', '2015-01-21 14:02:59', null, '1', null, null);
INSERT INTO `product` VALUES ('160', '1', '3', '37', '550', '0', 'thumb20150121141333763&marnicamicia2.jpg', '1', '2015-01-21 14:05:55', null, '1', null, null);
INSERT INTO `product` VALUES ('161', '1', '5', '37', '930', '0', 'thumb20150121141512907&marnidress1.jpg', '1', '2015-01-21 14:11:16', null, '1', null, null);
INSERT INTO `product` VALUES ('162', '1', '8', '37', '2900', '0', 'thumb20150121142247660&marnigiaccapelle1.jpg', '1', '2015-01-21 14:16:01', null, '24', null, null);
INSERT INTO `product` VALUES ('163', '1', '20', '37', '370', '0', 'thumb20150121143641185&marnisneakers1.jpg', '1', '2015-01-21 14:30:02', null, '34', null, null);
INSERT INTO `product` VALUES ('164', '1', '20', '37', '470', '0', 'thumb20150121144210953&marnisandali1.jpg', '1', '2015-01-21 14:35:10', null, '24', null, null);
INSERT INTO `product` VALUES ('165', '1', '3', '30', '500', '0', 'thumb20150121144814631&dusantop2.jpg', '2', '2015-01-21 00:00:00', null, '2', null, null);
INSERT INTO `product` VALUES ('166', '1', '22', '30', '500', '0', 'thumb20150121145616247&topdusan1.jpg', '1', '2015-01-21 14:48:43', null, '2', null, null);
INSERT INTO `product` VALUES ('167', '1', '5', '37', '750', '0', 'thumb20150124160724431&marniabito2.jpg', '1', '2015-01-24 16:02:56', null, '1', null, null);
INSERT INTO `product` VALUES ('168', '1', '18', '37', '220', '0', 'thumb20150124161128388&marnitotebag1.jpg', '1', '2015-01-24 16:06:16', null, '20', null, null);
INSERT INTO `product` VALUES ('169', '1', '8', '37', '2900', '0', 'thumb20150128181652655&marnigiaccapelle2.jpg', '1', '2015-01-28 18:11:07', null, '24', null, null);
INSERT INTO `product` VALUES ('170', '1', '18', '33', '520', '0', 'thumb20150129165554706&borsajamin1.jpg', '1', '2015-01-29 17:00:58', null, '1', null, null);
INSERT INTO `product` VALUES ('171', '1', '18', '33', '520', '0', 'thumb20150129171012087&borsajamin2-1.jpg', '1', '2015-01-29 17:06:32', null, '1', null, null);
INSERT INTO `product` VALUES ('172', '1', '18', '33', '520', '0', 'thumb20150129171616099&borsajamin3-1.jpg', '1', '2015-01-29 17:14:55', null, '1', null, null);
INSERT INTO `product` VALUES ('173', '1', '18', '33', '210', '0', 'thumb20150129172845803&borsajamin4-1.jpg', '1', '2015-01-29 17:22:05', null, '35', null, null);
INSERT INTO `product` VALUES ('174', '1', '5', '37', '930', '0', 'thumb20150129173718742&marniabitogiallo1.jpg', '2', '2015-02-24 00:00:00', null, '1', null, null);
INSERT INTO `product` VALUES ('175', '1', '23', '54', '275', '0', 'thumb20150130142725823&collanadopdaliana2.jpg', '1', '2015-01-30 14:23:45', null, '36', null, null);
INSERT INTO `product` VALUES ('176', '1', '23', '54', '390', '0', 'thumb20150130143305733&patiziasciarpa.jpg', '1', '2015-01-30 14:29:41', null, '36', null, null);
INSERT INTO `product` VALUES ('177', '1', '23', '54', '200', '0', 'thumb20150130143904185&patriziabrac3.jpg', '1', '2015-01-30 14:34:22', null, '36', null, null);
INSERT INTO `product` VALUES ('178', '1', '23', '54', '260', '0', 'thumb20150130144339297&patriziabraccharms1.jpg', '1', '2015-01-30 14:38:32', null, '36', null, null);
INSERT INTO `product` VALUES ('179', '1', '23', '54', '120', '0', 'thumb20150130144852379&patriziaorrecchini.jpg', '1', '2015-01-30 14:40:51', null, '36', null, null);
INSERT INTO `product` VALUES ('180', '1', '24', '29', '72', '0', 'thumb20150130152329012&eau_plurielle_limited_72_1.jpg', '1', '2015-01-30 15:16:06', null, '27', null, null);
INSERT INTO `product` VALUES ('181', '1', '27', '29', '55', '0', 'thumb20150130153027343&rosafolia_candlepack_72.jpg', '1', '2015-01-30 15:22:58', null, '37', null, null);
INSERT INTO `product` VALUES ('182', '1', '4', '26', '500', '0', 'thumb20150204143452805&virginiabizzicapotto.jpg', '1', '2015-02-04 14:33:43', null, '24', null, null);
INSERT INTO `product` VALUES ('183', '1', '9', '26', '800', '0', 'thumb20150204144236952&virginiabizzigiacca.jpg', '1', '2015-02-04 14:40:03', null, '24', null, null);
INSERT INTO `product` VALUES ('184', '1', '12', '26', '260', '0', 'thumb20150204144904317&virginiabizzigonna1.jpg', '1', '2015-02-04 14:43:35', null, '34', null, null);
INSERT INTO `product` VALUES ('185', '1', '16', '26', '250', '0', 'thumb20150204145236181&virginiabizzipantdavanti.jpg', '1', '2015-02-04 14:47:59', null, '5', null, null);
INSERT INTO `product` VALUES ('186', '1', '21', '26', '190', '0', 'thumb20150204145749701&virginiabizzitop1.jpg', '1', '2015-02-04 14:55:53', null, '5', null, null);
INSERT INTO `product` VALUES ('187', '1', '22', '26', '230', '0', 'thumb20150204150702342&virginiabizzitop2-2.jpg', '1', '2015-02-04 14:59:09', null, '5', null, null);
INSERT INTO `product` VALUES ('188', '1', '3', '25', '350', '0', 'thumb20150207164441800&carlocontradacamicia1.jpg', '1', '2015-02-07 16:37:58', null, '2', null, null);
INSERT INTO `product` VALUES ('189', '1', '8', '25', '525', '0', 'thumb20150207171212758&carlocontradagiaccadavanti1.jpg', '1', '2015-02-07 17:36:18', null, '1', null, null);
INSERT INTO `product` VALUES ('190', '1', '16', '25', '340', '0', 'thumb20150207174604519&carlocontradapant1.jpg', '1', '2015-02-07 17:43:29', null, '1', null, null);
INSERT INTO `product` VALUES ('191', '1', '21', '25', '365', '0', 'thumb20150207175235314&carlocontradateshirt.jpg', '1', '2015-02-07 17:46:28', null, '1', null, null);
INSERT INTO `product` VALUES ('192', '1', '12', '25', '385', '0', 'thumb20150207175530591&carlocontradagonna1.jpg', '1', '2015-02-07 17:52:35', null, '1', null, null);
INSERT INTO `product` VALUES ('193', '1', '22', '25', '350', '0', 'thumb20150207180654876&carlocontradatop1.jpg', '1', '2015-02-07 18:00:40', null, '1', null, null);
INSERT INTO `product` VALUES ('194', '1', '1', '59', '135', '0', 'thumb20150213170303915&infracolanapinkandwhite.jpg', '1', '2015-02-13 16:55:38', null, '6', null, null);
INSERT INTO `product` VALUES ('195', '1', '1', '59', '135', '0', 'thumb20150213170542549&infracollanabluerossobianco.jpg', '1', '2015-02-13 16:58:09', null, '6', null, null);
INSERT INTO `product` VALUES ('196', '1', '1', '59', '135', '0', 'thumb20150213170846554&infracollanafrica4.jpg', '1', '2015-02-13 17:01:56', null, '6', null, null);
INSERT INTO `product` VALUES ('197', '1', '1', '59', '135', '0', 'thumb20150213171134116&infacollanaafricabw.jpg', '1', '2015-02-13 17:03:29', null, '6', null, null);
INSERT INTO `product` VALUES ('198', '1', '1', '59', '145', '0', 'thumb20150213171310670&infracoralloverde.jpg', '1', '2015-02-13 17:04:56', null, '6', null, null);
INSERT INTO `product` VALUES ('199', '1', '1', '59', '145', '0', 'thumb20150213171440463&infacollanacorallorosa.jpg', '1', '2015-02-13 17:06:26', null, '6', null, null);
INSERT INTO `product` VALUES ('200', '1', '1', '59', '60', '0', 'thumb20150213171650989&infraorecchini1.jpg', '1', '2015-02-13 17:08:52', null, '6', null, null);
INSERT INTO `product` VALUES ('201', '1', '1', '59', '60', '0', 'thumb20150213172335740&infraorecchini2.jpg', '1', '2015-02-13 17:15:05', null, '6', null, null);
INSERT INTO `product` VALUES ('202', '1', '23', '60', '30', '0', 'thumb20150217165351582&stl_made_in_italy_bracelet_folk_collectioncyclamin_red_finaest.jpg', '1', '2015-02-17 16:46:37', null, '32', null, null);
INSERT INTO `product` VALUES ('203', '1', '23', '60', '30', '0', 'thumb20150217173439082&stl_made_in_italy_.jpg', '1', '2015-02-17 17:26:38', null, '32', null, null);
INSERT INTO `product` VALUES ('204', '1', '23', '60', '30', '0', 'thumb20150217173626231&share_the_love_braccialetto.jpg', '1', '2015-02-17 17:28:58', null, '32', null, null);
INSERT INTO `product` VALUES ('205', '1', '23', '60', '30', '0', 'thumb20150217173830312&stl_made_in_italy.jpg', '1', '2015-02-17 17:30:29', null, '32', null, null);
INSERT INTO `product` VALUES ('206', '1', '23', '60', '30', '0', 'thumb20150217174016111&stl_share_the_love1.jpg', '1', '2015-02-17 17:36:41', null, '32', null, null);
INSERT INTO `product` VALUES ('207', '1', '23', '60', '30', '0', 'thumb20150217174814734&stl_share_the_love2.jpg', '1', '2015-02-17 17:40:26', null, '32', null, null);
INSERT INTO `product` VALUES ('208', '1', '23', '60', '30', '0', 'thumb20150217174955383&stl_share_the_love_.jpg', '1', '2015-02-17 17:41:29', null, '32', null, null);
INSERT INTO `product` VALUES ('209', '1', '23', '60', '30', '0', 'thumb20150217175137497&stl_share_the_love3.jpg', '1', '2015-02-17 17:43:20', null, '32', null, null);
INSERT INTO `product` VALUES ('210', '1', '23', '60', '30', '0', 'thumb20150217175332839&stl_share_the_love.jpg', '1', '2015-02-17 17:45:39', null, '32', null, null);
INSERT INTO `product` VALUES ('211', '1', '23', '60', '30', '0', 'thumb20150217175533376&stl_share_the_love4.jpg', '1', '2015-02-17 17:47:29', null, '32', null, null);
INSERT INTO `product` VALUES ('212', '1', '18', '61', '700', '0', 'thumb20150220152208031&pb0110blulunga1.jpg', '1', '2015-02-20 15:14:38', null, '24', null, null);
INSERT INTO `product` VALUES ('213', '1', '18', '61', '520', '0', 'thumb20150220152747791&pb0110grigrio.jpg', '1', '2015-02-20 15:19:25', null, '24', null, null);
INSERT INTO `product` VALUES ('214', '1', '18', '61', '400', '0', 'thumb20150221161825612&pb0110yellow.jpg', '1', '2015-02-21 16:09:48', null, '24', null, null);
INSERT INTO `product` VALUES ('215', '1', '18', '61', '660', '0', 'thumb20150221162927709&pb0110secchiello2.jpg', '2', '2015-02-21 00:00:00', null, '24', null, null);
INSERT INTO `product` VALUES ('216', '1', '18', '61', '425', '0', 'thumb20150221162757674&pb0110zaino1.jpg', '2', '2015-02-21 00:00:00', null, '24', null, null);
INSERT INTO `product` VALUES ('217', '1', '18', '61', '660', '0', 'thumb20150221162927709&pb0110secchiello2.jpg', '2', '2015-02-21 00:00:00', null, '24', null, null);
INSERT INTO `product` VALUES ('228', '1', '20', '42', '200', '0', 'thumb20150228122706650&premiatadiane1271.jpg', '1', '2015-02-28 12:19:34', null, '34', null, null);
INSERT INTO `product` VALUES ('229', '1', '20', '42', '185', '0', 'thumb20150228122935890&premiatafrida999.jpg', '1', '2015-02-28 12:21:52', null, '34', null, null);
INSERT INTO `product` VALUES ('230', '1', '20', '42', '180', '0', 'thumb20150228123238966&premiatafrida.jpg', '1', '2015-02-28 12:24:48', null, '34', null, null);
INSERT INTO `product` VALUES ('231', '1', '20', '42', '175', '0', 'thumb20150228123511233&premitatalucy-d1232.jpg', '1', '2015-02-28 12:27:00', null, '34', null, null);
INSERT INTO `product` VALUES ('232', '1', '20', '42', '190', '0', 'thumb20150228123707866&premiataredlucy-d1232.jpg', '1', '2015-02-28 12:33:20', null, '34', null, null);
INSERT INTO `product` VALUES ('233', '1', '20', '42', '190', '0', 'thumb20150228124316988&premiatadiane1206.jpg', '1', '2015-02-28 12:35:51', null, '34', null, null);
INSERT INTO `product` VALUES ('234', '1', '20', '42', '190', '0', 'thumb20150228124609303&premiatalucy1229.jpg', '1', '2015-02-28 12:38:15', null, '34', null, null);
INSERT INTO `product` VALUES ('235', '1', '7', '39', '190', '0', 'thumb20150228180129691&msgmfelpasenzamaniche.jpg', '1', '2015-02-28 17:54:15', null, '1', null, null);
INSERT INTO `product` VALUES ('236', '1', '19', '39', '80', '0', 'thumb20150228180424655&msgmtanktopnero.jpg', '1', '2015-02-28 17:55:57', null, '1', null, null);
INSERT INTO `product` VALUES ('237', '1', '22', '39', '160', '0', 'thumb20150228180642108&msgmpolomaglietta.jpg', '1', '2015-02-28 17:59:25', null, '7', null, null);
INSERT INTO `product` VALUES ('238', '1', '3', '39', '400', '0', 'thumb20150228181052696&msgmcamicarosaegiallo.jpg', '1', '2015-02-28 18:04:30', null, '2', null, null);

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
INSERT INTO `product_description` VALUES ('27', 'en', 'Prodotto di prova');
INSERT INTO `product_description` VALUES ('27', 'it', 'Prodotto di prova');
INSERT INTO `product_description` VALUES ('30', 'en', 'Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp');
INSERT INTO `product_description` VALUES ('30', 'it', 'Pvc milano borsa, effetto pelle trapuntata, catena a tracolla, chiusura a calamita ');
INSERT INTO `product_description` VALUES ('31', 'en', 'Crew neck tunic in compact cady crepe');
INSERT INTO `product_description` VALUES ('31', 'it', 'Tunica girocollo in crepe cady compatto ');
INSERT INTO `product_description` VALUES ('33', 'en', 'Fashion show\'s dress in radzimr, with ');
INSERT INTO `product_description` VALUES ('33', 'it', 'Abito girocollo di sfilata in radzimr, con stampa magnus plessen 2.');
INSERT INTO `product_description` VALUES ('34', 'en', 'Crew neck dress in bicolor bonded jersey ');
INSERT INTO `product_description` VALUES ('34', 'it', 'Abito girocollo in doppio jersey bicolore ');
INSERT INTO `product_description` VALUES ('35', 'en', 'Crew neck sweatshirt in bonded jersey, with \"dripping\" drawing');
INSERT INTO `product_description` VALUES ('35', 'it', 'Felpa girocollo di sfilata in jersey accoppiato, stampa ');
INSERT INTO `product_description` VALUES ('36', 'en', 'Fashion show\'s coat in bonded plush alpaca');
INSERT INTO `product_description` VALUES ('36', 'it', 'Giacca di sfilata in felpa e alpaca accoppiata ');
INSERT INTO `product_description` VALUES ('37', 'en', 'Fashion show\'s skirt in cotton and double silk, with \"bright\" stamp');
INSERT INTO `product_description` VALUES ('37', 'it', 'Gonna di  sfilata in cotone e seta double con stampa \"bright\"');
INSERT INTO `product_description` VALUES ('38', 'en', 'Fashion show\'s crew neck sweater in jacquard check');
INSERT INTO `product_description` VALUES ('38', 'it', 'Maglia girocollo di sfilata con jacquard check');
INSERT INTO `product_description` VALUES ('39', 'en', 'Crew neck shirt with \"bright\" stamp');
INSERT INTO `product_description` VALUES ('39', 'it', 'Blusa girocollo con stampa \"bright\" blu');
INSERT INTO `product_description` VALUES ('40', 'en', 'Sweatshirt with truth beauty');
INSERT INTO `product_description` VALUES ('40', 'it', 'Felpa con scritta truth beauty');
INSERT INTO `product_description` VALUES ('41', 'en', 'Double breasted coat in wool with coyote\'s neck');
INSERT INTO `product_description` VALUES ('41', 'it', 'Cappotto doppio petto in panno di lana con colletto di coyote');
INSERT INTO `product_description` VALUES ('42', 'en', 'Coat with flower fantasy');
INSERT INTO `product_description` VALUES ('42', 'it', 'Cappotto fantasia fiori ');
INSERT INTO `product_description` VALUES ('43', 'en', 'Crew neck dress with jacquard lurex roses');
INSERT INTO `product_description` VALUES ('43', 'it', 'Abito girocollo broccato lurex rose jacquard');
INSERT INTO `product_description` VALUES ('44', 'en', 'Bermuda shorts in eco nappa leather pliss');
INSERT INTO `product_description` VALUES ('44', 'it', 'Bermuda in eco nappa pliss');
INSERT INTO `product_description` VALUES ('45', 'en', 'Dress with latex top and cool wool skirt');
INSERT INTO `product_description` VALUES ('45', 'it', 'Abito con top in latex e gonna in fresco lana');
INSERT INTO `product_description` VALUES ('46', 'en', 'Skirt in silver laminated canvas');
INSERT INTO `product_description` VALUES ('46', 'it', 'Gonna a ruota in tela laminata argento');
INSERT INTO `product_description` VALUES ('47', 'en', 'Alpaca wool coat');
INSERT INTO `product_description` VALUES ('47', 'it', 'Cappotto in alpaca grigio');
INSERT INTO `product_description` VALUES ('48', 'en', 'Gray strips trouser in cashemere, lin and silk');
INSERT INTO `product_description` VALUES ('48', 'it', 'Pantalone a righe grigie in cashemere, lino e seta');
INSERT INTO `product_description` VALUES ('49', 'en', 'Trousers in high twisted wool');
INSERT INTO `product_description` VALUES ('49', 'it', 'Pantalone in gabardine stretch, modello sopra la caviglia.');
INSERT INTO `product_description` VALUES ('50', 'en', 'Bermuda shorts in wool and silk with fur effect');
INSERT INTO `product_description` VALUES ('50', 'it', 'Bermuda in lana e seta effetto pelliccia');
INSERT INTO `product_description` VALUES ('51', 'en', 'Crew neck shirt in china crepe with written phrases');
INSERT INTO `product_description` VALUES ('51', 'it', 'Blusa girocollo in crepe de china con stampa scritte');
INSERT INTO `product_description` VALUES ('52', 'en', 'Crew neck sweater with check fantasy');
INSERT INTO `product_description` VALUES ('52', 'it', 'Maglia girocollo con fantasia check sul davanti');
INSERT INTO `product_description` VALUES ('53', 'en', 'Sweatshirt with roses\'s drawing');
INSERT INTO `product_description` VALUES ('53', 'it', 'Felpa con stampa rose graffiate');
INSERT INTO `product_description` VALUES ('54', 'en', '3/4 length wide pants in eco leather');
INSERT INTO `product_description` VALUES ('54', 'it', 'Pantalone 3/4 largo in eco pelle');
INSERT INTO `product_description` VALUES ('55', 'en', 'Quilted over teen top');
INSERT INTO `product_description` VALUES ('55', 'it', 'Top over trapuntato ');
INSERT INTO `product_description` VALUES ('56', 'en', 'Net over dress');
INSERT INTO `product_description` VALUES ('56', 'it', 'Top lungo a rete ');
INSERT INTO `product_description` VALUES ('57', 'en', 'Dress copper colored with a black bow');
INSERT INTO `product_description` VALUES ('57', 'it', 'Abito rame con fiocco nero sul davanti');
INSERT INTO `product_description` VALUES ('58', 'en', 'Stripes dress blue/black in stretch wool');
INSERT INTO `product_description` VALUES ('58', 'it', 'Abito a righe blu/black in lana stretch');
INSERT INTO `product_description` VALUES ('59', 'en', 'Stripes shirt with paillettes');
INSERT INTO `product_description` VALUES ('59', 'it', 'Camicia a righe con applicazioni');
INSERT INTO `product_description` VALUES ('60', 'en', 'Stripes shirt with paillettes');
INSERT INTO `product_description` VALUES ('60', 'it', 'Camicia a righe con applicazioni');
INSERT INTO `product_description` VALUES ('61', 'en', 'Blu and golden stripes skirt above the knee.');
INSERT INTO `product_description` VALUES ('61', 'it', 'Gonna sopra il ginocchio a righe blu e oro.');
INSERT INTO `product_description` VALUES ('62', 'en', 'Shirt with puffball on the shoulder');
INSERT INTO `product_description` VALUES ('62', 'it', 'Camicia con spalle a sbuffo di taffettà');
INSERT INTO `product_description` VALUES ('63', 'en', 'Ring in silver plated pink gold.');
INSERT INTO `product_description` VALUES ('63', 'it', 'Anello in argento placcato oro rosa.');
INSERT INTO `product_description` VALUES ('64', 'en', 'Full finger ring moon texture.');
INSERT INTO `product_description` VALUES ('64', 'it', 'Anello copridito superficie lunare.');
INSERT INTO `product_description` VALUES ('66', 'en', 'Necklace with moon stone');
INSERT INTO `product_description` VALUES ('66', 'it', 'Collana con pietra di luna');
INSERT INTO `product_description` VALUES ('67', 'en', 'Bracelet/ring silver plated pink golden');
INSERT INTO `product_description` VALUES ('67', 'it', 'Bracciale anello argento placcato oro rosa');
INSERT INTO `product_description` VALUES ('68', 'en', 'Balls necklace in fumé resin');
INSERT INTO `product_description` VALUES ('68', 'it', 'Collana a palle in resina fumé');
INSERT INTO `product_description` VALUES ('69', 'en', 'Embroided necklace with glass bead');
INSERT INTO `product_description` VALUES ('69', 'it', 'Collana ricamata con perline di vetro');
INSERT INTO `product_description` VALUES ('70', 'en', 'Necklace with a big resin fumé pearl ');
INSERT INTO `product_description` VALUES ('70', 'it', 'Collana mille fili con perla in resina rosso fumé');
INSERT INTO `product_description` VALUES ('71', 'en', 'Necklace with pearls');
INSERT INTO `product_description` VALUES ('71', 'it', 'Collana mille fili con perle ');
INSERT INTO `product_description` VALUES ('72', 'en', 'Silver earings and taffeta roses');
INSERT INTO `product_description` VALUES ('72', 'it', 'Orecchini in argento e rosa in taffetà');
INSERT INTO `product_description` VALUES ('73', 'en', 'Necklace with a heart \"the heart has reasons, that reason cannot know\".');
INSERT INTO `product_description` VALUES ('73', 'it', 'Collana con un cuore \" the heart has reasons, that reason cannot know\".');
INSERT INTO `product_description` VALUES ('74', 'en', 'Ostrich bag with magnetic closure');
INSERT INTO `product_description` VALUES ('74', 'it', 'Borsa in struzzo con chiusura a calamita');
INSERT INTO `product_description` VALUES ('75', 'en', 'Small patchwork bag');
INSERT INTO `product_description` VALUES ('75', 'it', 'Borsa di piccola dimensione patchwork');
INSERT INTO `product_description` VALUES ('76', 'en', 'Patchwork shopping bag');
INSERT INTO `product_description` VALUES ('76', 'it', 'Shopping bag patchwork');
INSERT INTO `product_description` VALUES ('77', 'en', 'Pvc \" bright\" shopping bag.');
INSERT INTO `product_description` VALUES ('77', 'it', 'Shopping bag stampa \"bright\".');
INSERT INTO `product_description` VALUES ('78', 'en', 'Kate rstv pierced satin and mirrored calf, multicolor base rasberry.');
INSERT INTO `product_description` VALUES ('78', 'it', 'Kate rsvt raso traforato e vitello specchiato multicolor con base rasberry.');
INSERT INTO `product_description` VALUES ('79', 'en', 'Petit faye na nola in nappa leather, with horn details ');
INSERT INTO `product_description` VALUES ('79', 'it', 'Petit faye na nola di nappa laserata e dettagli in corno');
INSERT INTO `product_description` VALUES ('80', 'en', 'Faye na piwa in nappa leather and chamois in multicolor base black');
INSERT INTO `product_description` VALUES ('80', 'it', 'Faye na piwa in nappa e camoscio in multicolor con base nero');
INSERT INTO `product_description` VALUES ('81', 'en', 'Fashion show plumes pochette, cory bag in felt.');
INSERT INTO `product_description` VALUES ('81', 'it', 'Pochette di piume di sfilata, cory bag in feltro ossediana.');
INSERT INTO `product_description` VALUES ('82', 'en', 'Leather lace-up shoe with silver tip and crepe.');
INSERT INTO `product_description` VALUES ('82', 'it', 'Scarpa stringata di pelle lucida con punta argento e suola di para');
INSERT INTO `product_description` VALUES ('83', 'en', 'Fashion show calf ankleboot bordaux with black tip, golden zip and 5 cm heel.');
INSERT INTO `product_description` VALUES ('83', 'it', 'Tronchetto di sfilata bordaux con punta nera in vitello, zip in metallo dorato e tacco 5 cm');
INSERT INTO `product_description` VALUES ('84', 'en', 'Fashion show lace-up shoes in domesticated calf. removable flap with golden plate.');
INSERT INTO `product_description` VALUES ('84', 'it', 'Allacciata di sfilata in vitello spazzolato. linguetta staccabile con placca di metallo dorato.');
INSERT INTO `product_description` VALUES ('85', 'en', 'Maryjane in domasticated calf with 7 cm heel.');
INSERT INTO `product_description` VALUES ('85', 'it', 'Maryjane in vitello spazzolato con tacco di 7 cm.');
INSERT INTO `product_description` VALUES ('86', 'en', 'Calfskin criss-cross sandals with square and round cabochon and leather sole.');
INSERT INTO `product_description` VALUES ('86', 'it', 'Sandalo in cavallino incrociato impreziosito con applicazioni cabochon e fondo cuoio.');
INSERT INTO `product_description` VALUES ('87', 'en', 'Fashion show necklace in resin with length-adjustable leather string.');
INSERT INTO `product_description` VALUES ('87', 'it', 'Collana di sfilata in resina con laccio regolabile di cuoio.');
INSERT INTO `product_description` VALUES ('88', 'en', 'Fashion show necklace in resin with length-adjustable leather string.');
INSERT INTO `product_description` VALUES ('88', 'it', 'Collana di sfilata in resina con laccio regolabile di cuoio.');
INSERT INTO `product_description` VALUES ('89', 'en', 'Horn necklace with technic ribbon.');
INSERT INTO `product_description` VALUES ('89', 'it', 'Collana di corno con nastro tecnico.');
INSERT INTO `product_description` VALUES ('90', 'en', 'Wool hat with ostrich\'s plumes');
INSERT INTO `product_description` VALUES ('90', 'it', 'Cappello di lana con piume di struzzo davanti');
INSERT INTO `product_description` VALUES ('91', 'en', 'Wool hat with pin-pon and veil');
INSERT INTO `product_description` VALUES ('91', 'it', 'Cappello di lana con pon-pon e veletta');
INSERT INTO `product_description` VALUES ('92', 'en', 'Wool stripes hat with pon-pon and veil');
INSERT INTO `product_description` VALUES ('92', 'it', 'Cappello di lana a righe con pon pon e veletta');
INSERT INTO `product_description` VALUES ('93', 'en', 'Peaked cap with wool rabbit ears');
INSERT INTO `product_description` VALUES ('93', 'it', 'Cappello con visiera e orecchie da coniglio in lana');
INSERT INTO `product_description` VALUES ('94', 'en', 'Gold bracelet with piece of chinese porcelain.');
INSERT INTO `product_description` VALUES ('94', 'it', 'Bracciale d\'oro e di porcellana cinese.');
INSERT INTO `product_description` VALUES ('95', 'en', 'Gold bracelet with piece of porcelain plate.');
INSERT INTO `product_description` VALUES ('95', 'it', 'Bracciale d\'oro e di frammenti di piatti di porcellana. ');
INSERT INTO `product_description` VALUES ('96', 'en', 'Cris cros leather wedge shoes with chamois tip');
INSERT INTO `product_description` VALUES ('96', 'it', 'Zeppa incrociata di pelle con punta in camoscio');
INSERT INTO `product_description` VALUES ('97', 'en', 'Lace-up shoes with sheepskin inside');
INSERT INTO `product_description` VALUES ('97', 'it', 'Scarpa stringata con pelliccia di montone interna');
INSERT INTO `product_description` VALUES ('98', 'en', 'Cris cros leather wedge shoes with chamois tip');
INSERT INTO `product_description` VALUES ('98', 'it', 'Zeppa incrociata di pelle con punta in camoscio');
INSERT INTO `product_description` VALUES ('99', 'en', 'Eco-fur wedge shoes sneaker ');
INSERT INTO `product_description` VALUES ('99', 'it', 'Sneaker in eco-pelliccia con la zeppa');
INSERT INTO `product_description` VALUES ('100', 'en', 'Mohair top');
INSERT INTO `product_description` VALUES ('100', 'it', 'Gilet di pelliccia mohair');
INSERT INTO `product_description` VALUES ('101', 'en', 'Eau de lierre (edt 100). eau de toilette based on leafs of ivy with notes of cyclamen, green pepper, amber and depths of rosewood. ');
INSERT INTO `product_description` VALUES ('101', 'it', 'Eau de lierre (edt 100). eau de toilette con prevalenza di foglie d\'edera, accompagnata a note di ciclamino, geranio, pepe verde, ambra, legno di palissandro e muschio.');
INSERT INTO `product_description` VALUES ('102', 'en', 'Oyedo (edt 100). eau de toilette based on lemon, green mandarin, tangy orange, tamarind, grapefruit and thyme.');
INSERT INTO `product_description` VALUES ('102', 'it', 'Oyedo (edt 100). eau de toilette a base di pompelmo, mandarino verde, arancio della florida, limone italiano, tamarindo, timo e cedro');
INSERT INTO `product_description` VALUES ('103', 'en', 'Eau duelle (edt 100). eau de toilette based on vanilla combined with juniper berries, black tea, cardamom and vetiver.');
INSERT INTO `product_description` VALUES ('103', 'it', 'Eau duelle (edt 100). eau de toilette con prevalenza di vaniglia accompagnata da note di bacche di ginepro, bacche di rosa, cardamomo, thè nero, vetiver.');
INSERT INTO `product_description` VALUES ('104', 'en', 'Philosykos (edt 100). eau de toilette based on fig leaves and wood, white cedar.');
INSERT INTO `product_description` VALUES ('104', 'it', 'Philosykos (edt 100). eau de toilette a base di foglie di fico, legno di fico e cedro bianco.');
INSERT INTO `product_description` VALUES ('105', 'en', 'Do son (edt 75). eau de perfum based on tuberose, orange leaves, pink peppercorn, musk.');
INSERT INTO `product_description` VALUES ('105', 'it', 'Do son (edt 75). eau de perfum a base di foglie d\'arancio, tuberosa, pepe rosa, muschio.');
INSERT INTO `product_description` VALUES ('106', 'en', 'L\'ombre dans l\'eau (edt 75). eau de perfum based on blackcurrant leaves e bulgarian roses. ');
INSERT INTO `product_description` VALUES ('106', 'it', 'L\'ombre dans l\'eau (edt 75). eau de perfum a bsa di foglie di ribes nero e rosa bulgara.');
INSERT INTO `product_description` VALUES ('107', 'en', 'Philosykos (edt 75). eau de parfum fig leaves and wood, white cedar.');
INSERT INTO `product_description` VALUES ('107', 'it', 'Philosykos (edt 75). eau de parfum a base di foglie di fico, legno di fico e cedro bianco.');
INSERT INTO `product_description` VALUES ('108', 'en', 'Volutes (edt 75). eau de parfum based on spices, tobacco, honey, iris e styrax.');
INSERT INTO `product_description` VALUES ('108', 'it', 'Volutes (edt 75). eau de parfum a base di spezie, tabacco, miele e iris.');
INSERT INTO `product_description` VALUES ('109', 'en', 'Tam dao (edt 100). eau de toilette based on sandalwood, rosewood, cypress e ambergris.');
INSERT INTO `product_description` VALUES ('109', 'it', 'Tam dao (edt 100). eau de toilette a base di legno di sandalo, palissandro, cipresso e ambra grigia.');
INSERT INTO `product_description` VALUES ('110', 'en', 'Vetyverio (edt 100). eau de toilette based on vetiver');
INSERT INTO `product_description` VALUES ('110', 'it', 'Vetyverio (edt 100). eau de toilette a base di vetiverio.');
INSERT INTO `product_description` VALUES ('111', 'en', 'Volutes (edt 100). eau de toilette based on spices, tobacco, honey, iris e styrax.');
INSERT INTO `product_description` VALUES ('111', 'it', 'Volutes (edt 100). eau de toilette a base di spezie, tabacco, miele e iris.');
INSERT INTO `product_description` VALUES ('112', 'en', 'Lait frais. this fresh lotion for the body makes softens skin for the property of orange flowers and the almond oil. ');
INSERT INTO `product_description` VALUES ('112', 'it', 'Lait frais. questo latte fresco per il corpo lascia la pelle morbida e lenita grazie alle proprietà dei fiori d\'arancia e dell\'olio di mandorla.');
INSERT INTO `product_description` VALUES ('113', 'en', 'Pommade exfoliante. rich and regenerant smoothing body polish for the body for emollient pomegranate oil.');
INSERT INTO `product_description` VALUES ('113', 'it', 'Pommade exfoliante. crema esfoliante per il corpo ricca, cremosa e rigenerante grazie all\'olio di melograno che rende la pelle elastica e setosa.');
INSERT INTO `product_description` VALUES ('114', 'en', 'Créme riche. rich butter for the body makes dry and sensitive skin with the delicious fragrance of a byzantine rose.');
INSERT INTO `product_description` VALUES ('114', 'it', 'Créme riche. crema ricca per il corpo  che lascia la pelle luminosa e delicatamente profumata grazie all\'acqua di rose che rinfresca, idrata e lenisce.');
INSERT INTO `product_description` VALUES ('115', 'en', 'Baume genéreux. this hand cream revitalizes the skin for the karité butter, the argan oil and the apricot oil.');
INSERT INTO `product_description` VALUES ('115', 'it', 'Baume genéreux. questa crema mani rivitalizza la pelle grazie al burro di karité, all\'olio di argan e all\'olio di nocciolo di albicocca.');
INSERT INTO `product_description` VALUES ('116', 'en', 'Emultion veluors pour les mains. this silky hand lotion made from the everlasting \"golden flower\" with regenerating, repairing, moisturizing and anti-oxidant properties');
INSERT INTO `product_description` VALUES ('116', 'it', 'Emultion veluors pour les mains. questa emulsione mani le avvolge in un velo leggero e vellutato e in più l\'acqua floreale di semprevivo le ripara e protegge.');
INSERT INTO `product_description` VALUES ('124', 'en', 'Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp');
INSERT INTO `product_description` VALUES ('124', 'it', 'Pvc borsa milano, effetto pelle trapuntata, catena a tracolla, chiusura a calamita ');
INSERT INTO `product_description` VALUES ('125', 'en', 'Pvc milano bag, foldover top with snap closure, a quilted leather effect, a chain shoulder strap, gold-tone hardware and an internal logo stamp');
INSERT INTO `product_description` VALUES ('125', 'it', 'Pvc borsa milano, effetto pelle trapuntata, catena a tracolla, chiusura a calamita ');
INSERT INTO `product_description` VALUES ('132', 'en', 'Revitalizing shower gel for body and hair. this gel combines bergamot scent with the floral scent of peppermint and with extract of almond.');
INSERT INTO `product_description` VALUES ('132', 'it', 'Gel lavant revigorant. gel per il corpo e i capelli a base di bergamotto, foglie di menta ed estratti di mandorla');
INSERT INTO `product_description` VALUES ('140', 'en', 'Essences Insensées, inspired by “a thousand flowers” . Is the result of the cohesion of mimosa, rose and heliotrope.');
INSERT INTO `product_description` VALUES ('140', 'it', 'Essences Insensées, inspirato alla tradizione del \'millefiori\'. A base di mimosa, di rosa e di valeriana. ');
INSERT INTO `product_description` VALUES ('143', 'en', '50 cm length with adjustable extender chain ( 5 cm)');
INSERT INTO `product_description` VALUES ('143', 'it', 'Lunghezza 50 cm, catena della carica regolabile ( di 5 cm)');
INSERT INTO `product_description` VALUES ('144', 'en', 'white sweatshirt with MSGM logo written in black. 100 % cotton');
INSERT INTO `product_description` VALUES ('144', 'it', 'felpa girocollo in cotone bianco con stampa logata a contrasto. Composizione: 100 % cotone');
INSERT INTO `product_description` VALUES ('145', 'en', 'Kate RSVT. Perforated satin and iridescent effect mirrored calfskin.');
INSERT INTO `product_description` VALUES ('145', 'it', 'Kate RSVT. Raso perforato e vitello con effetto specchiato e iridescente.');
INSERT INTO `product_description` VALUES ('146', 'en', 'MSGM t-shirt with rounded neckline in white cotton with logo printed and short sleeves.');
INSERT INTO `product_description` VALUES ('146', 'it', 'MSGM t-shirt bianco girocollo ');
INSERT INTO `product_description` VALUES ('147', 'en', 'Le Art du soin. Travel set with Créme Riche, Gel Lavant Revigorant, Baume Genéreux e Huilés Precieuses');
INSERT INTO `product_description` VALUES ('147', 'it', 'Le Art du soin. Set da viaggio con Créme Riche, Gel Lavant Revigorant, Baume Genéreux e Huilés Precieuses');
INSERT INTO `product_description` VALUES ('148', 'en', 'Suitcase handle without care. Cabin size 50 x 33 x 20 cm, capacity 40 lt and weight 2,1 kg.');
INSERT INTO `product_description` VALUES ('148', 'it', 'Valigia handle without care. Dimensione da cabina 50 x 33 x 20 cm, capacità 40 lt e peso 2,1 kg');
INSERT INTO `product_description` VALUES ('149', 'en', 'Backpack in polyester with eco-pelle insert');
INSERT INTO `product_description` VALUES ('149', 'it', ' Zaino in poliestere tinta unita con inserto di tessuto e fondo in ecopelle scamosciata a contrasto');
INSERT INTO `product_description` VALUES ('150', 'en', 'backpack in polyester with eco-pelle insert');
INSERT INTO `product_description` VALUES ('150', 'it', 'Zaino in poliestere tinta unita con inserto di tessuto e fondo in ecopelle scamosciata a contrasto');
INSERT INTO `product_description` VALUES ('151', 'en', 'backpack in polyester with eco-pelle insert');
INSERT INTO `product_description` VALUES ('151', 'it', 'Zaino in poliestere tinta unita con inserto di tessuto e fondo in ecopelle scamosciata a contrasto');
INSERT INTO `product_description` VALUES ('152', 'en', 'Supe Design backpack with big zipper ');
INSERT INTO `product_description` VALUES ('152', 'it', 'Zaino Supe Design dotato di apertura anteriore con megazip. Pratica chiusura superiore con doppio cursore.');
INSERT INTO `product_description` VALUES ('153', 'en', 'Supe Design backpack with large zip ');
INSERT INTO `product_description` VALUES ('153', 'it', 'Zaino Supe Design dotato di apertura anteriore con megazip. Pratica chiusura superiore con doppio cursore.');
INSERT INTO `product_description` VALUES ('154', 'en', 'Pink faux fur coat from MSGM');
INSERT INTO `product_description` VALUES ('154', 'it', 'eco-peliccia MSGM');
INSERT INTO `product_description` VALUES ('155', 'en', 'doubled breasted wool coat by MSGM. 3/4 sleeves and a large fit ');
INSERT INTO `product_description` VALUES ('155', 'it', 'doppio petto cappotto di lana da MSGM. maniche a tre quarti e una silhouette comodamente grandi dimensioni');
INSERT INTO `product_description` VALUES ('156', 'en', 'black leather ankle boots with strap at the ankle and rubber sole ');
INSERT INTO `product_description` VALUES ('156', 'it', 'Cinturino alla caviglia punta tonda suola di gomma yacco rivestito');
INSERT INTO `product_description` VALUES ('157', 'en', 'slip on shoes with open back ');
INSERT INTO `product_description` VALUES ('157', 'it', 'collection privee slip-on suola di gomma');
INSERT INTO `product_description` VALUES ('158', 'en', 'Sleeveless dress light yellow in cady cotton.');
INSERT INTO `product_description` VALUES ('158', 'it', 'Abito senza maniche light yellow in cotone cady.');
INSERT INTO `product_description` VALUES ('159', 'en', 'Sleeveless top light yellow in cotton.');
INSERT INTO `product_description` VALUES ('159', 'it', 'Top senza maniche light yellow in cotone.');
INSERT INTO `product_description` VALUES ('160', 'en', 'Polo M.L. shirt, color snow, in popeline.');
INSERT INTO `product_description` VALUES ('160', 'it', 'Camicia polo M.L., colore snow, in popeline.');
INSERT INTO `product_description` VALUES ('161', 'en', 'M.M. dress, color dark resin, in cotton and silk honan st. kew.');
INSERT INTO `product_description` VALUES ('161', 'it', 'Abito M.M., color resina scura, in cotone e seta honan st. kew.');
INSERT INTO `product_description` VALUES ('162', 'en', 'Leather jacket, in apricot color, with a flower on the back.');
INSERT INTO `product_description` VALUES ('162', 'it', 'Giacca in pelle, color albicocca, con fiore stilizzato dietro.');
INSERT INTO `product_description` VALUES ('163', 'en', 'Red sneaker shoes, selva on drill.');
INSERT INTO `product_description` VALUES ('163', 'it', 'Scarpa speaker rossa, selva on drill.');
INSERT INTO `product_description` VALUES ('164', 'en', 'Fussbett sandals with a flower in napa leather and camois leather.');
INSERT INTO `product_description` VALUES ('164', 'it', 'Sandalo fussbett con fiore applicato in pelle e camoscio.');
INSERT INTO `product_description` VALUES ('165', 'en', 'Top in silk.');
INSERT INTO `product_description` VALUES ('165', 'it', 'Top in seta.');
INSERT INTO `product_description` VALUES ('166', 'en', 'Silk top darkslate.');
INSERT INTO `product_description` VALUES ('166', 'it', 'Top in seta darkslate.');
INSERT INTO `product_description` VALUES ('167', 'en', 'Curry M.C. dress in sablé kapfu pr.');
INSERT INTO `product_description` VALUES ('167', 'it', 'Abito M.C curry in sablé st. kapfu.');
INSERT INTO `product_description` VALUES ('168', 'en', 'Shopping bag in PVC st. fostering SM, light peach color.');
INSERT INTO `product_description` VALUES ('168', 'it', 'Borsa shopping in PVC st. fosteriana SM, color pesca.');
INSERT INTO `product_description` VALUES ('169', 'en', '100% lambskin leather jacket. Two front pockets, button closure, and leather application flower detail. ');
INSERT INTO `product_description` VALUES ('169', 'it', 'Marni giacca in nappa. 100% lambskin. Due tasche frontali. Chiusura con un bottone. Applicazioni floreali in nappa');
INSERT INTO `product_description` VALUES ('170', 'en', '\"Le Panoramique\" cotton bag with leather trimming, side pockets, closure with button and sequin embellished. ');
INSERT INTO `product_description` VALUES ('170', 'it', 'Borsa \"Le Panoramique\" con manici corti, chiusura con bottone e due tasche laterali in cotone, pelle e paillettes.');
INSERT INTO `product_description` VALUES ('171', 'en', '\"Oscar\" fish bag in cotton, cow leather and embellished with sequins.');
INSERT INTO `product_description` VALUES ('171', 'it', 'Borsa \"Oscar\" a forma di pesce in cotone, paillettes e pelle.');
INSERT INTO `product_description` VALUES ('172', 'en', '\"Beausoleil\" small bag in cotton and sequins embellished.');
INSERT INTO `product_description` VALUES ('172', 'it', 'Mini borsa \"Beausoleil\" in cotone e paillettes');
INSERT INTO `product_description` VALUES ('173', 'en', 'Savane PM bag with handle in raphia and cow leather.');
INSERT INTO `product_description` VALUES ('173', 'it', 'Borsa Savane PM con manici corti in rafia e pelle.');
INSERT INTO `product_description` VALUES ('174', 'en', 'Sleeveless dress light yellow in cady cotton.');
INSERT INTO `product_description` VALUES ('174', 'it', 'Abito senza maniche light yellow in cotone cady.');
INSERT INTO `product_description` VALUES ('175', 'en', 'Necklace with double pendant in bronze and cutting precious stone');
INSERT INTO `product_description` VALUES ('175', 'it', 'Collana con doppio pendente in bronzo e pietre intagliate');
INSERT INTO `product_description` VALUES ('176', 'en', 'Scarf necklace in bronze and cutting precious stone');
INSERT INTO `product_description` VALUES ('176', 'it', 'Collana sciarpa in bronzo e pietre intagliate');
INSERT INTO `product_description` VALUES ('177', 'en', 'Double bracelet in bronze and cutting precious stone');
INSERT INTO `product_description` VALUES ('177', 'it', 'Bracciale doppio rigido in bronzo e pietra intagliata');
INSERT INTO `product_description` VALUES ('178', 'en', 'Charm bracelet in bronze and cutting precious stone, pot piece and pearl');
INSERT INTO `product_description` VALUES ('178', 'it', 'Bracciale con pendenti in bronzo e pietra intagliata, ceramica e perla');
INSERT INTO `product_description` VALUES ('179', 'en', 'Earrings in bronze, cutting precious stone and pearl.');
INSERT INTO `product_description` VALUES ('179', 'it', 'Orecchini in bronzo, pietra intagliata e perla.');
INSERT INTO `product_description` VALUES ('180', 'en', 'Eau Plurielle (200ml), Saint Valentine edition. This fragrance is ideal for people who don\'t use perfume and is ideal for spray on the clothes. Is based of ivy, galbanum, Turkish rose and Egyptian geranium.  ');
INSERT INTO `product_description` VALUES ('180', 'it', 'Eau Plurielle (200ml)., edizione di san Valentino. Una fragranza sottile da spruzzare sugli abiti, ideale per chi non usa il profumo con regolarità. E\' a basa di edera, galbano, rosa turca e geranio d\'Egitto.');
INSERT INTO `product_description` VALUES ('181', 'en', 'Rosafolia candle, Saint Valentine edition. The fragrance is based on ivy, galbanium, Turkish rose and Egyphtian geranium.');
INSERT INTO `product_description` VALUES ('181', 'it', 'Candela Rosafolia, edizione di san Valentino. La fragranza è a basa di edera, galbano, rosa turca e geranio d\'Egitto.');
INSERT INTO `product_description` VALUES ('182', 'en', 'Virginia Bizzi clothing brand. Openwork coat with leather details: collar, sleeves and pockets.');
INSERT INTO `product_description` VALUES ('182', 'it', 'Linea Virginia Bizzi. Cappotto traforato con dettagli in pelle bovina: colletto, maniche e tasche.');
INSERT INTO `product_description` VALUES ('183', 'en', 'Virginia Bizzi clothing brand. Calf and lamb leather jacket with openwork sleeves.');
INSERT INTO `product_description` VALUES ('183', 'it', 'Linea Virginia Bizzi. Giacca di pelle di agnello e vitello con maniche traforate.');
INSERT INTO `product_description` VALUES ('184', 'en', 'Virginia Bizzi clothing brand. Openwork skirt with lateral zip.');
INSERT INTO `product_description` VALUES ('184', 'it', 'Linea Virginia Bizzi. Gonna traforata con zip laterale.');
INSERT INTO `product_description` VALUES ('185', 'en', 'Virginia Bizzi clothing brand. Eco leather pants with white stripes behind and a lateral zip.');
INSERT INTO `product_description` VALUES ('185', 'it', 'Linea Virginia Bizzi. Pantalone in eco pelle con strisce bianche dietro e zip laterale.');
INSERT INTO `product_description` VALUES ('186', 'en', 'Virginia Bizzi clothing brand. Openwork t-shirt with calf leather pocket');
INSERT INTO `product_description` VALUES ('186', 'it', 'Linea Virginia Bizzi. T-shirt traforata con tasca in pelle bovina.');
INSERT INTO `product_description` VALUES ('187', 'en', 'Virginia Bizzi clothing brand. maxi top with openwork strip.');
INSERT INTO `product_description` VALUES ('187', 'it', 'Linea Virginia Bizzi. Maxi top con banda traforata.');
INSERT INTO `product_description` VALUES ('188', 'en', 'Silk shirt.');
INSERT INTO `product_description` VALUES ('188', 'it', 'Camicia in seta.');
INSERT INTO `product_description` VALUES ('189', 'en', 'Jacket with voile behind ');
INSERT INTO `product_description` VALUES ('189', 'it', 'Giacca con voile dietro');
INSERT INTO `product_description` VALUES ('190', 'en', 'Trouser with black raphia details and with elastic band behind.');
INSERT INTO `product_description` VALUES ('190', 'it', 'Pantalone con dettagli in rafia nera e con elastico dietro.');
INSERT INTO `product_description` VALUES ('191', 'en', 'White squared t-shirt.');
INSERT INTO `product_description` VALUES ('191', 'it', 'T-shirt bianca quadrata.');
INSERT INTO `product_description` VALUES ('192', 'en', 'Skirt with embroided motif.');
INSERT INTO `product_description` VALUES ('192', 'it', 'Gonna ampia con disegno ricamato.');
INSERT INTO `product_description` VALUES ('193', 'en', 'Top with lace trimming and with raphia details.');
INSERT INTO `product_description` VALUES ('193', 'it', 'Top con gala e con dettagli in rafia.');
INSERT INTO `product_description` VALUES ('194', 'en', 'silicone necklace, ties in back ');
INSERT INTO `product_description` VALUES ('194', 'it', 'collana di silicone ');
INSERT INTO `product_description` VALUES ('195', 'en', 'silicone necklace');
INSERT INTO `product_description` VALUES ('195', 'it', 'collana silicone');
INSERT INTO `product_description` VALUES ('196', 'en', 'silicone necklace');
INSERT INTO `product_description` VALUES ('196', 'it', 'Collana silicone');
INSERT INTO `product_description` VALUES ('197', 'en', 'silicone necklace');
INSERT INTO `product_description` VALUES ('197', 'it', 'collana silicone');
INSERT INTO `product_description` VALUES ('198', 'en', 'silicone necklace');
INSERT INTO `product_description` VALUES ('198', 'it', 'Collana silicone');
INSERT INTO `product_description` VALUES ('199', 'en', 'silicone necklace');
INSERT INTO `product_description` VALUES ('199', 'it', 'collana silicone');
INSERT INTO `product_description` VALUES ('200', 'en', 'earrings in silicone');
INSERT INTO `product_description` VALUES ('200', 'it', 'orecchini silicone');
INSERT INTO `product_description` VALUES ('201', 'en', 'silicone earrings');
INSERT INTO `product_description` VALUES ('201', 'it', 'orecchini silicone ');
INSERT INTO `product_description` VALUES ('202', 'en', 'Folk plated brass bracelet and wool and polyester pom pon.');
INSERT INTO `product_description` VALUES ('202', 'it', 'Bracciale Folk placcato in ottone con pom pon in lana e poliestere.');
INSERT INTO `product_description` VALUES ('203', 'en', 'Folk plated brass bracelet and wool and polyester pom pon.');
INSERT INTO `product_description` VALUES ('203', 'it', ' Bracciale Folk placcato in ottone con pom pon in lana e poliestere.');
INSERT INTO `product_description` VALUES ('204', 'en', 'Folk plated brass bracelet and wool and polyester pom pon.');
INSERT INTO `product_description` VALUES ('204', 'it', ' Bracciale Folk placcato in ottone con pom pon in lana e poliestere.');
INSERT INTO `product_description` VALUES ('205', 'en', 'Folk plated brass bracelet and wool and polyester pom pon.');
INSERT INTO `product_description` VALUES ('205', 'it', 'Bracciale Folk placcato in ottone con pom pon in lana e poliestere.');
INSERT INTO `product_description` VALUES ('206', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose.');
INSERT INTO `product_description` VALUES ('206', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('207', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose  .');
INSERT INTO `product_description` VALUES ('207', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('208', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose.');
INSERT INTO `product_description` VALUES ('208', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('209', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose  .');
INSERT INTO `product_description` VALUES ('209', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('210', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose.');
INSERT INTO `product_description` VALUES ('210', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('211', 'en', 'Aloha plated brass bracelet and raffia tassels in 100% viscose.');
INSERT INTO `product_description` VALUES ('211', 'it', 'Bracciale Aloha in ottone placcato e nappine di rafia in 100% viscosa.');
INSERT INTO `product_description` VALUES ('212', 'en', 'Handbag with three compartment interior and a shoulder belt.');
INSERT INTO `product_description` VALUES ('212', 'it', 'Borsa a mano con tre compartimenti interni e tracolla.');
INSERT INTO `product_description` VALUES ('213', 'en', 'Tote bag with adjustable straps. ');
INSERT INTO `product_description` VALUES ('213', 'it', 'Borsa lunga con manici aggiustabili.');
INSERT INTO `product_description` VALUES ('214', 'en', 'Small shoulder bag with adjustable strap, with main compartment, zippered compartment, and card case');
INSERT INTO `product_description` VALUES ('214', 'it', 'Piccola borsa a tracolla con comparti e portacarte.');
INSERT INTO `product_description` VALUES ('215', 'en', 'Classic bucket bag.');
INSERT INTO `product_description` VALUES ('215', 'it', 'Borsa a secchiello con tracolla.');
INSERT INTO `product_description` VALUES ('216', 'en', 'Backpack with big front pocket.');
INSERT INTO `product_description` VALUES ('216', 'it', 'Zaino con ampia tasca davanti');
INSERT INTO `product_description` VALUES ('217', 'en', 'Classic bucket bag.');
INSERT INTO `product_description` VALUES ('217', 'it', 'Borsa a secchiello con tracolla.');
INSERT INTO `product_description` VALUES ('228', 'en', 'Premiata Sneakers White Diane 1721');
INSERT INTO `product_description` VALUES ('228', 'it', 'Scarpe Premiata White Diane 1271');
INSERT INTO `product_description` VALUES ('229', 'en', 'Premiata sneakers Frida 999');
INSERT INTO `product_description` VALUES ('229', 'it', 'Scarpe Premiata Frida 999');
INSERT INTO `product_description` VALUES ('230', 'en', 'Premiata sneakers Conny 1212');
INSERT INTO `product_description` VALUES ('230', 'it', 'Scarpe Premiata White Conny 1212');
INSERT INTO `product_description` VALUES ('231', 'en', 'Premiata Sneakers Lucy-D 946');
INSERT INTO `product_description` VALUES ('231', 'it', 'Scarpe Premiata White Lucy-D 946');
INSERT INTO `product_description` VALUES ('232', 'en', 'Premiata Sneakers Lucy-D 1232');
INSERT INTO `product_description` VALUES ('232', 'it', 'Scarpe Premiata White Lucy-D 1232');
INSERT INTO `product_description` VALUES ('233', 'en', 'Premiata Sneakers Diane 1206');
INSERT INTO `product_description` VALUES ('233', 'it', 'Scarpe Premiata White Diane 1206');
INSERT INTO `product_description` VALUES ('234', 'en', 'Premiata Sneakers Lucy-D 1229');
INSERT INTO `product_description` VALUES ('234', 'it', 'Scarpe Premiata White Lucy-D 1229');
INSERT INTO `product_description` VALUES ('235', 'en', 'Sleeveless sweatshirt . MSGM embroidered with beads ');
INSERT INTO `product_description` VALUES ('235', 'it', 'Felpa MSGM senza maniche');
INSERT INTO `product_description` VALUES ('236', 'en', 'MSGM black tank top');
INSERT INTO `product_description` VALUES ('236', 'it', 'Canotta MSGM');
INSERT INTO `product_description` VALUES ('237', 'en', 'sparkly polo top MSGM');
INSERT INTO `product_description` VALUES ('237', 'it', 'polo a righe MSGM');
INSERT INTO `product_description` VALUES ('238', 'en', 'pink and yellow blouse MSGM');
INSERT INTO `product_description` VALUES ('238', 'it', 'Camicia seta MSGM rosa e gialla');

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
INSERT INTO `product_image` VALUES ('27', '1', '20150121130733475&logoTab.png');
INSERT INTO `product_image` VALUES ('30', '1', '20141110145915895&IMG_5244.JPG');
INSERT INTO `product_image` VALUES ('30', '3', '20141110152118223&IMG_5246.jpg');
INSERT INTO `product_image` VALUES ('31', '1', '20141202123227110&IMG_1577.jpg');
INSERT INTO `product_image` VALUES ('33', '1', '20141202123438452&IMG_1586.jpg');
INSERT INTO `product_image` VALUES ('34', '1', '20141202123558626&IMG_1582.jpg');
INSERT INTO `product_image` VALUES ('35', '1', '20141202130425171&IMG_1565.JPG');
INSERT INTO `product_image` VALUES ('37', '1', '20141127125558413&IMG_1571.jpg');
INSERT INTO `product_image` VALUES ('38', '1', '20141202131037758&IMG_1569.JPG');
INSERT INTO `product_image` VALUES ('39', '1', '20141202151027733&IMG_1563.jpg');
INSERT INTO `product_image` VALUES ('40', '1', '20141202130553258&IMG_1520.jpg');
INSERT INTO `product_image` VALUES ('41', '1', '20141206192714324&IMG_1552.jpg');
INSERT INTO `product_image` VALUES ('42', '1', '20141206192525431&IMG_1561.jpg');
INSERT INTO `product_image` VALUES ('44', '1', '20141202131809015&IMG_1544.jpg');
INSERT INTO `product_image` VALUES ('45', '1', '20141202123833980&IMG_1546.jpg');
INSERT INTO `product_image` VALUES ('47', '1', '20141206192850317&IMG_1600.jpg');
INSERT INTO `product_image` VALUES ('48', '1', '20141202131911122&IMG_1598.jpg');
INSERT INTO `product_image` VALUES ('49', '1', '20141202131951185&IMG_1592.jpg');
INSERT INTO `product_image` VALUES ('51', '1', '20141202151118594&IMG_1505.jpg');
INSERT INTO `product_image` VALUES ('52', '1', '20141202132537186&IMG_1506.JPG');
INSERT INTO `product_image` VALUES ('53', '1', '20141202130654886&IMG_1518.JPG');
INSERT INTO `product_image` VALUES ('54', '1', '20141202132105618&IMG_1603.jpg');
INSERT INTO `product_image` VALUES ('55', '1', '20141202151317124&IMG_1611.jpg');
INSERT INTO `product_image` VALUES ('56', '1', '20141202151353554&IMG_1619.jpg');
INSERT INTO `product_image` VALUES ('57', '1', '20141202124007840&IMG_1637.jpg');
INSERT INTO `product_image` VALUES ('58', '1', '20141202124107859&IMG_1651.jpg');
INSERT INTO `product_image` VALUES ('59', '1', '20141206192337282&IMG_1656.jpg');
INSERT INTO `product_image` VALUES ('60', '1', '20141206192140447&IMG_1643.jpg');
INSERT INTO `product_image` VALUES ('61', '1', '20141202131652487&IMG_1647.jpg');
INSERT INTO `product_image` VALUES ('62', '1', '20141206192010583&IMG_1642.JPG');
INSERT INTO `product_image` VALUES ('63', '1', '20141202151919904&anbjorg1.jpg');
INSERT INTO `product_image` VALUES ('63', '2', '20141202151919887&anbjorg2.jpg');
INSERT INTO `product_image` VALUES ('64', '1', '20141202151945773&annellobjorg.jpg');
INSERT INTO `product_image` VALUES ('66', '1', '20141202152004107&bjorgneck1.jpg');
INSERT INTO `product_image` VALUES ('67', '1', '20141202152021261&bjorgringbracelet.jpg');
INSERT INTO `product_image` VALUES ('68', '1', '20141202152046981&calderaranecklace1.jpg');
INSERT INTO `product_image` VALUES ('69', '1', '20141202152105344&calderaranecklace3.jpg');
INSERT INTO `product_image` VALUES ('70', '1', '20141202152121476&calderaranecklace2.jpg');
INSERT INTO `product_image` VALUES ('72', '1', '20141202152158886&orrechinicalderara.jpg');
INSERT INTO `product_image` VALUES ('73', '1', '20141202152220159&heartbjorgnecklace.jpg');
INSERT INTO `product_image` VALUES ('74', '1', '20141202153028751&jaminbag1.jpg');
INSERT INTO `product_image` VALUES ('75', '1', '20141202153049081&jaminbag2.jpg');
INSERT INTO `product_image` VALUES ('76', '1', '20141202153106520&jaminbig2.jpg');
INSERT INTO `product_image` VALUES ('77', '1', '20141202153124945&marnibag.jpg');
INSERT INTO `product_image` VALUES ('78', '1', '20141202153145383&paula3.jpg');
INSERT INTO `product_image` VALUES ('80', '1', '20141202153218767&cademartori2.jpg');
INSERT INTO `product_image` VALUES ('81', '1', '20141202153239692&marnipochette.jpg');
INSERT INTO `product_image` VALUES ('82', '1', '20141202153342718&aranthsilver.jpg');
INSERT INTO `product_image` VALUES ('83', '1', '20141202153400698&marniboots1.jpg');
INSERT INTO `product_image` VALUES ('83', '2', '20141202153400774&marniboots2.jpg');
INSERT INTO `product_image` VALUES ('84', '1', '20141202153428962&marniborde1.jpg');
INSERT INTO `product_image` VALUES ('85', '1', '20141202153448965&marnimaryjane2.jpg');
INSERT INTO `product_image` VALUES ('85', '2', '20141202153448899&marnimaryjane1.jpg');
INSERT INTO `product_image` VALUES ('86', '1', '20141202153509312&marnisandals.jpg');
INSERT INTO `product_image` VALUES ('87', '1', '20141119170640438&marninecklace1.jpg');
INSERT INTO `product_image` VALUES ('88', '1', '20141202152248681&marninecklace2.jpg');
INSERT INTO `product_image` VALUES ('89', '1', '20141202152431774&marninecklace3.jpg');
INSERT INTO `product_image` VALUES ('90', '1', '20141202152453731&capbernstock2.jpg');
INSERT INTO `product_image` VALUES ('90', '2', '20141202152512868&capbern1.jpg');
INSERT INTO `product_image` VALUES ('91', '1', '20141202152608165&capbernstock6.jpg');
INSERT INTO `product_image` VALUES ('92', '1', '20141202152729884&capbernstock8.jpg');
INSERT INTO `product_image` VALUES ('92', '2', '20141202152737972&capbernstock7.jpg');
INSERT INTO `product_image` VALUES ('93', '1', '20141202152814492&capbernstock9.jpg');
INSERT INTO `product_image` VALUES ('94', '1', '20141202152838307&pdbrac.jpg');
INSERT INTO `product_image` VALUES ('95', '1', '20141202152859068&pdbracel2.jpg');
INSERT INTO `product_image` VALUES ('96', '1', '20141120145300937&peternon1.jpg');
INSERT INTO `product_image` VALUES ('97', '1', '20141202153531948&peternonfront.jpg');
INSERT INTO `product_image` VALUES ('97', '2', '20141202153531955&peternonfur1.jpg');
INSERT INTO `product_image` VALUES ('98', '1', '20141202153558877&peternon1.jpg');
INSERT INTO `product_image` VALUES ('98', '2', '20141202153558988&peternon2.jpg');
INSERT INTO `product_image` VALUES ('98', '3', '20141202153559286&peternon3.jpg');
INSERT INTO `product_image` VALUES ('99', '1', '20141202153624436&premiatafur.jpg');
INSERT INTO `product_image` VALUES ('99', '2', '20141202153624441&premiatafur2.jpg');
INSERT INTO `product_image` VALUES ('100', '1', '20141202151441584&IMG_1626.jpg');
INSERT INTO `product_image` VALUES ('101', '1', '20141202112331383&edt_new_color_resize_eau_de_lierre.jpg');
INSERT INTO `product_image` VALUES ('102', '1', '20141202112438343&edt_new_color_resize_oyedo_1.jpg');
INSERT INTO `product_image` VALUES ('103', '1', '20141202112523760&edt_new_color_resize_eau_duelle.jpg');
INSERT INTO `product_image` VALUES ('104', '1', '20141202112601322&edt_new_color_resize_philosykos.jpg');
INSERT INTO `product_image` VALUES ('105', '1', '20141202112633185&edt_new_color_resize_doson.jpg');
INSERT INTO `product_image` VALUES ('106', '1', '20141202112715827&lombre_dans_resize.jpg');
INSERT INTO `product_image` VALUES ('107', '1', '20141202112754652&philosykos_resize-1.jpg');
INSERT INTO `product_image` VALUES ('108', '1', '20141202112855644&volutesp75.jpg');
INSERT INTO `product_image` VALUES ('109', '1', '20141202112209376&tamdao100v1.jpg');
INSERT INTO `product_image` VALUES ('110', '1', '20141202112943080&vetyverio-flacon-dos.jpg');
INSERT INTO `product_image` VALUES ('111', '1', '20141202113028908&volute100v1_1.jpg');
INSERT INTO `product_image` VALUES ('112', '1', '20141202113440235&aobc_freshlotion.jpg');
INSERT INTO `product_image` VALUES ('113', '1', '20141202113844846&bc_pommade_exfoliante-pot_q.jpg');
INSERT INTO `product_image` VALUES ('114', '1', '20141202113528673&abc_creme_riche_1.jpg');
INSERT INTO `product_image` VALUES ('115', '1', '20141202113615259&abc_baume_genereux.jpg');
INSERT INTO `product_image` VALUES ('116', '1', '20141202113344716&bc_emulsion_velours-pot_q.jpg');
INSERT INTO `product_image` VALUES ('124', '1', '20141202153253583&bagsdesign2.jpg');
INSERT INTO `product_image` VALUES ('125', '1', '20141202153314420&designinverso1.jpg');
INSERT INTO `product_image` VALUES ('132', '1', '20141202113709727&bc_revitalizing-shower-gel_q.jpg');
INSERT INTO `product_image` VALUES ('140', '1', '20141211162509107&34collection_essences-insensees_edp100.jpg');
INSERT INTO `product_image` VALUES ('143', '1', '20141212155904883&meteor-necklace_1412244678_1.jpg');
INSERT INTO `product_image` VALUES ('144', '1', '20141216121556705&msgmfelpa.jpg');
INSERT INTO `product_image` VALUES ('145', '1', '20141216162913536&paula3.jpg');
INSERT INTO `product_image` VALUES ('146', '1', '20141217115923929&msgmtshirt.jpg');
INSERT INTO `product_image` VALUES ('147', '1', '20141223141224857&winter14_coffret_l27art_du_soin_rvb_resized_1.jpg');
INSERT INTO `product_image` VALUES ('148', '1', '20141223142939003&cabin2wheels-bright-gold.jpg');
INSERT INTO `product_image` VALUES ('149', '1', '20141229173329066&tumblr_nhcqr9xd7R1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('149', '2', '20141229173344340&tumblr_nhcqtmFOcg1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('150', '1', '20141229173954428&tumblr_nhcr0lQrD11rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('150', '2', '20141229174140186&tumblr_nhcqyjuNCZ1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('151', '1', '20141229174412545&tumblr_nhcr27ZX4u1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('151', '2', '20141229174457032&tumblr_nhcr3bKshO1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('152', '1', '20141229174737659&tumblr_nhcquyJbkC1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('152', '2', '20141229174749778&tumblr_nhcqwhfMp41rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('153', '1', '20141229181241410&004_4f896e20-8403-4c35-9bc6-d8a9c92f4839.JPG');
INSERT INTO `product_image` VALUES ('153', '2', '20141229181259882&004_1c947639-504b-42d7-9e90-20ae036091c8.JPG');
INSERT INTO `product_image` VALUES ('154', '1', '20141231105108080&tumblr_nhelok6twK1rvje7uo1_1280.jpg');
INSERT INTO `product_image` VALUES ('155', '1', '20150108150505522&m-193-286511-2-gWO6PlkHA67e.jpg');
INSERT INTO `product_image` VALUES ('156', '1', '20150108152121511&44717922gs_11_a.jpg');
INSERT INTO `product_image` VALUES ('157', '1', '20150108152416203&44732642cb_11_a.jpg');
INSERT INTO `product_image` VALUES ('158', '1', '20150121120920473&marniabito1.jpg');
INSERT INTO `product_image` VALUES ('159', '1', '20150121140840915&marnitop1.jpg');
INSERT INTO `product_image` VALUES ('160', '1', '20150121141333763&marnicamicia2.jpg');
INSERT INTO `product_image` VALUES ('161', '1', '20150121141512907&marnidress1.jpg');
INSERT INTO `product_image` VALUES ('162', '1', '20150121142247660&marnigiaccapelle1.jpg');
INSERT INTO `product_image` VALUES ('162', '2', '20150121142319873&marnigiaccapelle2.jpg');
INSERT INTO `product_image` VALUES ('163', '1', '20150121143641185&marnisneakers1.jpg');
INSERT INTO `product_image` VALUES ('163', '2', '20150121143701292&marnisneakers2.jpg');
INSERT INTO `product_image` VALUES ('163', '3', '20150121143730311&marnisneakers3.jpg');
INSERT INTO `product_image` VALUES ('164', '1', '20150121144210953&marnisandali1.jpg');
INSERT INTO `product_image` VALUES ('165', '1', '20150121144814631&dusantop2.jpg');
INSERT INTO `product_image` VALUES ('166', '1', '20150121145616247&topdusan1.jpg');
INSERT INTO `product_image` VALUES ('167', '1', '20150124160724431&marniabito2.jpg');
INSERT INTO `product_image` VALUES ('168', '1', '20150124161128388&marnitotebag1.jpg');
INSERT INTO `product_image` VALUES ('169', '1', '20150128181652655&marnigiaccapelle2.jpg');
INSERT INTO `product_image` VALUES ('170', '1', '20150129165554706&borsajamin1.jpg');
INSERT INTO `product_image` VALUES ('170', '2', '20150129165622140&borsajamin1-3.jpg');
INSERT INTO `product_image` VALUES ('170', '3', '20150129165644779&borsajamin1-2.jpg');
INSERT INTO `product_image` VALUES ('171', '1', '20150129171012087&borsajamin2-1.jpg');
INSERT INTO `product_image` VALUES ('171', '2', '20150129171411893&borsajamin2-2.jpg');
INSERT INTO `product_image` VALUES ('172', '1', '20150129171616099&borsajamin3-1.jpg');
INSERT INTO `product_image` VALUES ('172', '2', '20150129172122633&borsajamin3-2.jpg');
INSERT INTO `product_image` VALUES ('172', '3', '20150129172156541&borsajamin3-3.jpg');
INSERT INTO `product_image` VALUES ('173', '1', '20150129172845803&borsajamin4-1.jpg');
INSERT INTO `product_image` VALUES ('173', '2', '20150129172907396&borsajamin4-2.jpg');
INSERT INTO `product_image` VALUES ('173', '3', '20150129172940868&borsajamin4-3.jpg');
INSERT INTO `product_image` VALUES ('174', '1', '20150129173718742&marniabitogiallo1.jpg');
INSERT INTO `product_image` VALUES ('175', '1', '20150130142725823&collanadopdaliana2.jpg');
INSERT INTO `product_image` VALUES ('176', '1', '20150130143305733&patiziasciarpa.jpg');
INSERT INTO `product_image` VALUES ('177', '1', '20150130143904185&patriziabrac3.jpg');
INSERT INTO `product_image` VALUES ('177', '2', '20150130144215692&patriziabrac3-3detail.jpg');
INSERT INTO `product_image` VALUES ('178', '1', '20150130144339297&patriziabraccharms1.jpg');
INSERT INTO `product_image` VALUES ('179', '1', '20150130144852379&patriziaorrecchini.jpg');
INSERT INTO `product_image` VALUES ('180', '1', '20150130152329012&eau_plurielle_limited_72_1.jpg');
INSERT INTO `product_image` VALUES ('181', '1', '20150130153027343&rosafolia_candlepack_72.jpg');
INSERT INTO `product_image` VALUES ('182', '1', '20150204143452805&virginiabizzicapotto.jpg');
INSERT INTO `product_image` VALUES ('183', '1', '20150204144236952&virginiabizzigiacca.jpg');
INSERT INTO `product_image` VALUES ('184', '1', '20150204144904317&virginiabizzigonna1.jpg');
INSERT INTO `product_image` VALUES ('185', '1', '20150204145236181&virginiabizzipantdavanti.jpg');
INSERT INTO `product_image` VALUES ('185', '2', '20150204145540135&virginiabizzipantdietro.jpg');
INSERT INTO `product_image` VALUES ('186', '1', '20150204145749701&virginiabizzitop1.jpg');
INSERT INTO `product_image` VALUES ('187', '1', '20150204150702342&virginiabizzitop2-2.jpg');
INSERT INTO `product_image` VALUES ('188', '1', '20150207164441800&carlocontradacamicia1.jpg');
INSERT INTO `product_image` VALUES ('189', '1', '20150207171212758&carlocontradagiaccadavanti1.jpg');
INSERT INTO `product_image` VALUES ('190', '1', '20150207174604519&carlocontradapant1.jpg');
INSERT INTO `product_image` VALUES ('191', '1', '20150207175235314&carlocontradateshirt.jpg');
INSERT INTO `product_image` VALUES ('192', '1', '20150207175530591&carlocontradagonna1.jpg');
INSERT INTO `product_image` VALUES ('193', '1', '20150207180654876&carlocontradatop1.jpg');
INSERT INTO `product_image` VALUES ('194', '1', '20150213170303915&infracolanapinkandwhite.jpg');
INSERT INTO `product_image` VALUES ('195', '1', '20150213170542549&infracollanabluerossobianco.jpg');
INSERT INTO `product_image` VALUES ('196', '1', '20150213170846554&infracollanafrica4.jpg');
INSERT INTO `product_image` VALUES ('197', '1', '20150213171134116&infacollanaafricabw.jpg');
INSERT INTO `product_image` VALUES ('198', '1', '20150213171310670&infracoralloverde.jpg');
INSERT INTO `product_image` VALUES ('199', '1', '20150213171440463&infacollanacorallorosa.jpg');
INSERT INTO `product_image` VALUES ('200', '1', '20150213171650989&infraorecchini1.jpg');
INSERT INTO `product_image` VALUES ('201', '1', '20150213172335740&infraorecchini2.jpg');
INSERT INTO `product_image` VALUES ('202', '1', '20150217165351582&stl_made_in_italy_bracelet_folk_collectioncyclamin_red_finaest.jpg');
INSERT INTO `product_image` VALUES ('203', '1', '20150217173439082&stl_made_in_italy_.jpg');
INSERT INTO `product_image` VALUES ('204', '1', '20150217173626231&share_the_love_braccialetto.jpg');
INSERT INTO `product_image` VALUES ('205', '1', '20150217173830312&stl_made_in_italy.jpg');
INSERT INTO `product_image` VALUES ('206', '1', '20150217174016111&stl_share_the_love1.jpg');
INSERT INTO `product_image` VALUES ('207', '1', '20150217174814734&stl_share_the_love2.jpg');
INSERT INTO `product_image` VALUES ('208', '1', '20150217174955383&stl_share_the_love_.jpg');
INSERT INTO `product_image` VALUES ('209', '1', '20150217175137497&stl_share_the_love3.jpg');
INSERT INTO `product_image` VALUES ('210', '1', '20150217175332839&stl_share_the_love.jpg');
INSERT INTO `product_image` VALUES ('211', '1', '20150217175533376&stl_share_the_love4.jpg');
INSERT INTO `product_image` VALUES ('212', '1', '20150220152208031&pb0110blulunga1.jpg');
INSERT INTO `product_image` VALUES ('212', '2', '20150220152258095&pb0110borsablu2.jpg');
INSERT INTO `product_image` VALUES ('213', '1', '20150220152747791&pb0110grigrio.jpg');
INSERT INTO `product_image` VALUES ('214', '1', '20150221161825612&pb0110yellow.jpg');
INSERT INTO `product_image` VALUES ('215', '1', '20150221162436747&pb secchiello.jpg');
INSERT INTO `product_image` VALUES ('216', '1', '20150221162757674&pb0110zaino1.jpg');
INSERT INTO `product_image` VALUES ('216', '2', '20150221162813550&pb0110zaino2.jpg');
INSERT INTO `product_image` VALUES ('217', '1', '20150221162927709&pb0110secchiello2.jpg');
INSERT INTO `product_image` VALUES ('217', '2', '20150221162950028&pb0110secchiello1.jpg');
INSERT INTO `product_image` VALUES ('228', '1', '20150228122706650&premiatadiane1271.jpg');
INSERT INTO `product_image` VALUES ('229', '1', '20150228122935890&premiatafrida999.jpg');
INSERT INTO `product_image` VALUES ('230', '1', '20150228123238966&premiatafrida.jpg');
INSERT INTO `product_image` VALUES ('231', '1', '20150228123511233&premitatalucy-d1232.jpg');
INSERT INTO `product_image` VALUES ('232', '1', '20150228123707866&premiataredlucy-d1232.jpg');
INSERT INTO `product_image` VALUES ('233', '1', '20150228124316988&premiatadiane1206.jpg');
INSERT INTO `product_image` VALUES ('234', '1', '20150228124609303&premiatalucy1229.jpg');
INSERT INTO `product_image` VALUES ('235', '1', '20150228180129691&msgmfelpasenzamaniche.jpg');
INSERT INTO `product_image` VALUES ('236', '1', '20150228180424655&msgmtanktopnero.jpg');
INSERT INTO `product_image` VALUES ('237', '1', '20150228180642108&msgmpolomaglietta.jpg');
INSERT INTO `product_image` VALUES ('238', '1', '20150228181052696&msgmcamicarosaegiallo.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refound_articles
-- ----------------------------
INSERT INTO `refound_articles` VALUES ('1', '18', '27', '1', '1', null, null, null, null);

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
INSERT INTO `shops` VALUES ('1', 'Siena', 'shop@magboutique.it', 'Mag Boutique', 'Via dei Termini, 49', 'Siena', '53100', 'SI', 'Italia', '+39 0577 41043');

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
INSERT INTO `site_images` VALUES ('carousel', '1', '19022015173319594&dalianabw.png', null, null, 'patriziadalliana');
INSERT INTO `site_images` VALUES ('carousel', '2', '28012015174103574&resort.png', null, null, 'marnires');
INSERT INTO `site_images` VALUES ('carousel', '3', '05022015184144854&marnicp.png', null, null, 'marnisneakers');
INSERT INTO `site_images` VALUES ('carousel', '4', '19022015174851809&jaminmarni.png', null, null, 'jamin');
INSERT INTO `site_images` VALUES ('carousel', '5', '24022015182915655&ping.png', null, null, 'mati');
INSERT INTO `site_images` VALUES ('carousel', '6', '05012015094851004&saldi.jpg', null, null, 'paula cademartori');
INSERT INTO `site_images` VALUES ('carousel', '7', 'DSC_1486 copia.jpg', null, null, 'Carlo Contrada');
INSERT INTO `site_images` VALUES ('carousel', '8', 'DSC_1741.JPG', null, null, 'Marni');
INSERT INTO `site_images` VALUES ('carousel', '9', 'DSC_1739.JPG', null, null, 'Marni');
INSERT INTO `site_images` VALUES ('carousel', '10', 'DSC_1962.JPG', null, null, 'Dyptique');
INSERT INTO `site_images` VALUES ('carousel', '11', 'DSC_1568.JPG', null, null, 'paula cademartori');
INSERT INTO `site_images` VALUES ('carousel', '12', 'DSC_1653.JPG', null, null, 'MSGM');
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, 'new');
INSERT INTO `site_images` VALUES ('newArrivals', '1', '22012015122745525&tumblr_niksyb7Lq91rvje7uo1_540.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'marnishoes');
INSERT INTO `site_images` VALUES ('newArrivals', '2', '22012015122809632&tumblr_nikssse6G11rvje7uo1_540.jpg', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'marnishoes');
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, 'promo');
INSERT INTO `site_images` VALUES ('tabNav', '1', 'logoTab2.png', '1', null, 'logo');

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
INSERT INTO `size` VALUES ('51', 'N/A');
INSERT INTO `size` VALUES ('52', 'CABIN SIZE');
INSERT INTO `size` VALUES ('53', '2');
INSERT INTO `size` VALUES ('54', '3');
INSERT INTO `size` VALUES ('55', '1');

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
INSERT INTO `states_orders` VALUES ('23', '1', '2014-12-29 12:49:42', null);
INSERT INTO `states_orders` VALUES ('24', '1', '2015-01-03 16:37:45', null);
INSERT INTO `states_orders` VALUES ('29', '1', '2015-01-19 17:13:25', null);
INSERT INTO `states_orders` VALUES ('30', '1', '2015-01-21 10:58:23', null);
INSERT INTO `states_orders` VALUES ('31', '1', '2015-01-21 10:58:54', null);
INSERT INTO `states_orders` VALUES ('32', '1', '2015-01-21 10:59:13', null);
INSERT INTO `states_orders` VALUES ('33', '1', '2015-01-21 11:02:37', null);
INSERT INTO `states_orders` VALUES ('36', '1', '2015-01-21 12:45:30', null);
INSERT INTO `states_orders` VALUES ('37', '1', '2015-01-21 12:46:35', null);
INSERT INTO `states_orders` VALUES ('38', '1', '2015-01-21 13:00:04', null);
INSERT INTO `states_orders` VALUES ('38', '3', '2015-01-21 13:01:56', null);
INSERT INTO `states_orders` VALUES ('38', '15', '2015-01-21 13:02:52', null);
INSERT INTO `states_orders` VALUES ('39', '1', '2015-01-24 17:36:39', null);
INSERT INTO `states_orders` VALUES ('40', '1', '2015-01-25 23:00:02', null);
INSERT INTO `states_orders` VALUES ('41', '1', '2015-01-29 14:59:24', null);
INSERT INTO `states_orders` VALUES ('41', '3', '2015-01-29 15:09:28', null);
INSERT INTO `states_orders` VALUES ('41', '15', '2015-01-29 16:34:36', null);

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
INSERT INTO `states_refound` VALUES ('18', '100', '2015-01-21 13:03:19', null);
INSERT INTO `states_refound` VALUES ('18', '101', '2015-01-21 13:03:46', null);
INSERT INTO `states_refound` VALUES ('18', '204', '2015-01-21 13:03:40', 'None');

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
INSERT INTO `type` VALUES ('3', 'en', 'Shirts');
INSERT INTO `type` VALUES ('3', 'it', 'Camicie');
INSERT INTO `type` VALUES ('4', 'en', 'Coats');
INSERT INTO `type` VALUES ('4', 'it', 'Cappotti');
INSERT INTO `type` VALUES ('5', 'en', 'Dresses');
INSERT INTO `type` VALUES ('5', 'it', 'Abiti');
INSERT INTO `type` VALUES ('7', 'en', 'Sweatshirts');
INSERT INTO `type` VALUES ('7', 'it', 'Felpe');
INSERT INTO `type` VALUES ('8', 'en', 'Jackets');
INSERT INTO `type` VALUES ('8', 'it', 'Giacche');
INSERT INTO `type` VALUES ('9', 'en', 'Leather jackets');
INSERT INTO `type` VALUES ('9', 'it', 'Giacche di pelle');
INSERT INTO `type` VALUES ('11', 'en', 'Casual jackets');
INSERT INTO `type` VALUES ('11', 'it', 'Giubbotti');
INSERT INTO `type` VALUES ('12', 'en', 'Skirts');
INSERT INTO `type` VALUES ('12', 'it', 'Gonne');
INSERT INTO `type` VALUES ('15', 'en', 'Knitwear');
INSERT INTO `type` VALUES ('15', 'it', 'Maglie');
INSERT INTO `type` VALUES ('16', 'en', 'Pants');
INSERT INTO `type` VALUES ('16', 'it', 'Pantaloni');
INSERT INTO `type` VALUES ('17', 'en', 'Cardigan');
INSERT INTO `type` VALUES ('17', 'it', 'Cardigan');
INSERT INTO `type` VALUES ('18', 'en', 'Bags');
INSERT INTO `type` VALUES ('18', 'it', 'Borse');
INSERT INTO `type` VALUES ('19', 'en', 'Tops');
INSERT INTO `type` VALUES ('19', 'it', 'Canotte');
INSERT INTO `type` VALUES ('20', 'en', 'Shoes');
INSERT INTO `type` VALUES ('20', 'it', 'Scarpe');
INSERT INTO `type` VALUES ('21', 'en', 'T-shirts');
INSERT INTO `type` VALUES ('21', 'it', 'T-shirts');
INSERT INTO `type` VALUES ('22', 'en', 'Top');
INSERT INTO `type` VALUES ('22', 'it', 'Top');
INSERT INTO `type` VALUES ('23', 'en', 'Bijoux');
INSERT INTO `type` VALUES ('23', 'it', 'Bijoux');
INSERT INTO `type` VALUES ('24', 'en', 'Perfume');
INSERT INTO `type` VALUES ('24', 'it', 'Profumi');
INSERT INTO `type` VALUES ('25', 'en', 'Body care');
INSERT INTO `type` VALUES ('25', 'it', 'Linea corpo');
INSERT INTO `type` VALUES ('26', 'en', 'Suitcase');
INSERT INTO `type` VALUES ('26', 'it', 'Valige');
INSERT INTO `type` VALUES ('27', 'en', 'Candle');
INSERT INTO `type` VALUES ('27', 'it', 'Candele');

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
