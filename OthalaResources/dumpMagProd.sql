-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: wc1mysql2.mondoserver.com
-- Generato il: Nov 28, 2014 alle 06:40
-- Versione del server: 5.1.71
-- Versione PHP: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

use aduna937_othala;
set foreign_key_checks = 0;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aduna937_othala`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` varchar(100) NOT NULL,
  `txNome` varchar(45) NOT NULL,
  `txCognome` varchar(45) NOT NULL,
  `txVia` varchar(100) NOT NULL,
  `txComune` varchar(100) NOT NULL,
  `cdCap` int(11) NOT NULL,
  `txProvincia` varchar(100) NOT NULL,
  `txNazione` varchar(100) NOT NULL,
  `txTel` varchar(45) NOT NULL,
  `fgDeleted` tinyint(4) NOT NULL,
  `txEtichetta` varchar(100) NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Addresses_Customer1` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dump dei dati per la tabella `addresses`
--

INSERT INTO `addresses` (`idAddress`, `idUser`, `txNome`, `txCognome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`, `fgDeleted`, `txEtichetta`) VALUES
(22, 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'rttg', 'rrtrf', 53100, 'si', 'ITALIA', '445', 0, 'casa');

-- --------------------------------------------------------

--
-- Struttura della tabella `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idProduct` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `idSize` int(11) DEFAULT NULL,
  `idColor` int(11) DEFAULT NULL,
  `qtStock` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(100) DEFAULT NULL,
  `idShop` int(11) DEFAULT NULL,
  `txBarCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`pgArticle`),
  KEY `fk_Article_Size1` (`idSize`),
  KEY `fk_Article_Color1` (`idColor`),
  KEY `fk_Article_Product1_idx` (`idProduct`),
  KEY `fk_Article_Shops1` (`idShop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `article`
--

INSERT INTO `article` (`idProduct`, `pgArticle`, `idSize`, `idColor`, `qtStock`, `txThumbnailsUrl`, `idShop`, `txBarCode`) VALUES
(27, 1, 22, 13, 3, 'thumb20141027161832712&45239055TE_13P_F.jpg', 1, 'SBMPQ04YN0LV53100C19'),
(30, 1, 22, 18, 1, 'thumb20141110145915895&IMG_5244.JPG', 1, '121212'),
(31, 3, 4, 5, 1, '20141122200715312&20141117145236567marnidress.jpg', 1, '101112'),
(31, 4, 5, 5, 1, '20141122200715312&20141117145236567marnidress.jpg', 1, '101112'),
(33, 1, 5, 21, 1, 'thumb20141117150330714&marnidress2.jpg', 1, '101113'),
(34, 1, 38, 20, 1, 'thumb20141117150649764&marnidress3.jpg', 1, '101114'),
(35, 1, 4, 11, 1, 'thumb20141117151037361&marnifelpa1.jpg', 1, '101115'),
(35, 2, 5, 11, 1, 'thumb20141117151037361&marnifelpa1.jpg', 1, '101115'),
(36, 1, 5, 22, 1, 'thumb20141117151402445&marnigiacca.jpg', 1, '101116'),
(37, 1, 4, 5, 1, 'thumb20141117151903324&marniskirt1.jpg', 1, '101117'),
(37, 2, 5, 5, 1, 'thumb20141117151903324&marniskirt1.jpg', 1, '101117'),
(38, 1, 5, 11, 1, 'thumb20141117152242340&marnisweater.jpg', 1, '101118'),
(39, 1, 42, 5, 1, 'thumb20141117152618174&marnitop1.jpg', 1, '101119'),
(40, 1, 17, 11, 1, 'thumb20141117152935991&msgm4.jpg', 1, '111110'),
(40, 2, 19, 11, 1, 'thumb20141117152935991&msgm4.jpg', 1, '111110'),
(41, 1, 5, 3, 1, 'thumb20141117153225513&msgmcoat1.jpg', 1, '111111'),
(42, 1, 4, 9, 1, 'thumb20141117153632036&msgmcoat2.jpg', 1, '111112'),
(43, 1, 6, 2, 1, 'thumb20141117154100230&msgmdress1.jpg', 1, '111113'),
(44, 1, 5, 10, 1, 'thumb20141117154358571&msgmshorts1.jpg', 1, '111114'),
(45, 1, 5, 11, 1, 'thumb20141117154652304&msgmdress3.jpg', 1, '111115'),
(45, 2, 6, 11, 1, 'thumb20141117154652304&msgmdress3.jpg', 1, '111115'),
(46, 1, 4, 2, 1, 'thumb20141117154924381&msgmskirt2.jpg', 1, '111117'),
(47, 1, 17, 9, 1, 'thumb20141117155305066&cappottodusan.jpg', 1, '111210'),
(48, 1, 17, 11, 2, 'thumb20141117155623037&pantdusan1.jpg', 1, '111211'),
(49, 1, 4, 11, 1, 'thumb20141117155809616&pantmarni1.jpg', 1, '101120'),
(49, 2, 5, 11, 2, 'thumb20141117155809616&pantmarni1.jpg', 1, '101120'),
(50, 1, 4, 11, 0, 'thumb20141117160407739&pantsmsgm1.jpg', 1, '111118'),
(50, 2, 5, 11, 1, 'thumb20141117160407739&pantsmsgm1.jpg', 1, '111118'),
(51, 1, 4, 4, 1, 'thumb20141117160852870&topmsgm.jpg', 1, '111119'),
(51, 2, 5, 4, 1, 'thumb20141117160852870&topmsgm.jpg', 1, '111119'),
(52, 1, 19, 4, 1, 'thumb20141117161232874&topmsgm1.jpg', 1, '111120'),
(53, 1, 16, 11, 1, 'thumb20141117161654164&topmsgm3.jpg', 1, '111121'),
(53, 2, 17, 11, 1, 'thumb20141117161654164&topmsgm3.jpg', 1, '111121'),
(54, 1, 7, 11, 2, 'thumb20141117162021276&pantcalderara.jpg', 1, '111310'),
(54, 2, 6, 11, 1, 'thumb20141117162021276&pantcalderara.jpg', 1, '111310'),
(55, 1, 5, 4, 1, 'thumb20141117162511277&topcalderara.jpg', 1, '111311'),
(56, 1, 5, 14, 1, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(56, 2, 6, 14, 1, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(56, 3, 6, 11, 1, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(56, 4, 5, 11, 0, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(56, 5, 4, 5, 1, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(56, 6, 5, 5, 1, 'thumb20141117162732943&topcalderara3.jpg', 1, '111312'),
(57, 1, 5, 23, 1, 'thumb20141118161838432&abitocc.jpg', 1, '121110'),
(58, 1, 5, 22, 1, 'thumb20141118162243596&abitoccc.jpg', 1, '121111'),
(58, 2, 6, 22, 1, 'thumb20141118162243596&abitoccc.jpg', 1, '121111'),
(59, 1, 5, 8, 1, 'thumb20141118162937070&camicacc.jpg', 1, '121112'),
(59, 2, 6, 8, 1, 'thumb20141118162937070&camicacc.jpg', 1, '121112'),
(60, 1, 5, 5, 1, 'thumb20141118163232366&camiciacc.jpg', 1, '121113'),
(60, 2, 6, 5, 1, 'thumb20141118163232366&camiciacc.jpg', 1, '121113'),
(61, 1, 5, 5, 1, 'thumb20141118163346493&gonnacc.jpg', 1, '121114'),
(62, 1, 6, 4, 1, 'thumb20141118163723090&calderaratop.jpg', 1, '111313'),
(63, 1, 22, 24, 1, 'thumb20141118170740089&anbjorg1.jpg', 1, '141110'),
(64, 1, 22, 2, 1, 'thumb20141118170858601&annellobjorg.jpg', 1, '141110'),
(65, 1, 22, 12, 1, 'thumb20141118171223478&collanaheartbjorg.jpg', 1, '141112'),
(66, 1, 22, 5, 1, 'thumb20141119135625261&bjorgneck1.jpg', 1, '141113'),
(67, 1, 22, 2, 1, 'thumb20141119135905749&bjorgringbracelet.jpg', 1, '141114'),
(68, 1, 22, 14, 1, 'thumb20141119140237932&calderaranecklace1.jpg', 1, '111314'),
(69, 1, 22, 11, 1, 'thumb20141119140628953&calderaranecklace3.jpg', 1, '111315'),
(70, 1, 22, 11, 1, 'thumb20141119140944080&calderaranecklace2.jpg', 1, '111316'),
(71, 1, 22, 11, 1, 'thumb20141119141205598&calderaranecklace5.jpg', 1, '111317'),
(72, 1, 22, 25, 1, 'thumb20141119141432529&orrechinicalderara.jpg', 1, '111318'),
(72, 2, 22, 11, 1, 'thumb20141119141432529&orrechinicalderara.jpg', 1, '111318'),
(73, 1, 22, 2, 1, 'thumb20141119141945710&heartbjorgnecklace.jpg', 1, '141115'),
(74, 1, 22, 26, 1, 'thumb20141119145037054&jaminbag1.jpg', 1, '151110'),
(74, 2, 22, 11, 1, 'thumb20141119145037054&jaminbag1.jpg', 1, '151110'),
(75, 1, 22, 27, 1, 'thumb20141119145647130&jaminbag2.jpg', 1, '151111'),
(76, 1, 22, 27, 1, 'thumb20141119150901584&jaminbig2.jpg', 1, '151112'),
(77, 1, 22, 28, 2, 'thumb20141119151056744&marnibag.jpg', 1, '101121'),
(78, 1, 22, 27, 1, 'thumb20141119151650739&paula3.jpg', 1, '161110'),
(79, 1, 22, 29, 1, 'thumb20141119152416360&paulapink.jpg', 1, '161111'),
(80, 1, 22, 27, 1, 'thumb20141119152906558&cademartori2.jpg', 1, '161112'),
(81, 1, 22, 27, 1, 'thumb20141119153653554&marnipochette.jpg', 1, '101122'),
(82, 1, 26, 30, 1, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(82, 2, 3, 30, 2, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(82, 3, 28, 30, 1, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(82, 4, 4, 30, 1, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(82, 5, 49, 30, 1, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(82, 6, 48, 30, 1, 'thumb20141119155500168&aranthsilver.jpg', 1, '171110'),
(83, 1, 28, 25, 1, 'thumb20141119155745902&marniboots1.jpg', 1, '101123'),
(83, 2, 3, 25, 1, 'thumb20141119155745902&marniboots1.jpg', 1, '101123'),
(83, 3, 49, 25, 1, 'thumb20141119155745902&marniboots1.jpg', 1, '101123'),
(84, 1, 49, 25, 1, 'thumb20141119165156903&marniborde1.jpg', 1, '101124'),
(85, 1, 49, 14, 1, 'thumb20141119165444186&marnimaryjane1.jpg', 1, '101125'),
(85, 2, 28, 14, 1, 'thumb20141119165444186&marnimaryjane1.jpg', 1, '101125'),
(86, 1, 26, 20, 1, 'thumb20141119170343778&marnisandals.jpg', 1, '101126'),
(86, 2, 48, 20, 1, 'thumb20141119170343778&marnisandals.jpg', 1, '101126'),
(86, 3, 3, 20, 1, 'thumb20141119170343778&marnisandals.jpg', 1, '101126'),
(87, 1, 22, 31, 1, 'thumb20141119170640438&marninecklace1.jpg', 1, '101127'),
(87, 2, 22, 32, 1, 'thumb20141119170640438&marninecklace1.jpg', 1, '101127'),
(88, 1, 22, 31, 1, 'thumb20141119171634410&marninecklace1.jpg', 1, '101127'),
(88, 2, 22, 32, 1, 'thumb20141119171712031&marninecklace2.jpg', 1, '101127'),
(89, 1, 22, 33, 2, 'thumb20141119171820051&marninecklace3.jpg', 1, '101128'),
(90, 1, 22, 9, 1, 'thumb20141120142558763&capbern1.jpg', 1, '181110'),
(90, 2, 22, 9, 1, 'thumb20141120142951798&capbernstock2.jpg', 1, '181110'),
(91, 1, 22, 5, 1, 'thumb20141120143107291&capbern4.jpg', 1, '181111'),
(91, 2, 22, 9, 1, 'thumb20141120143316885&capbernstock3.jpg', 1, '181111'),
(91, 3, 22, 14, 1, 'thumb20141120143357071&capbernstock6.jpg', 1, '181111'),
(92, 3, 22, 11, 1, 'thumb20141122115607198&capbernstock8.jpg', 1, '181112'),
(92, 4, 22, 9, 1, 'thumb20141122115607198&capbernstock8.jpg', 1, '181112'),
(93, 1, 22, 5, 2, 'thumb20141120144217526&capbernstock9.jpg', 1, '181113'),
(94, 1, 22, 27, 1, 'thumb20141120144339085&pdbrac.jpg', 1, '191110'),
(95, 1, 22, 27, 1, 'thumb20141120145158723&pdbracel2.jpg', 1, '181111'),
(96, 1, 26, 11, 1, 'thumb20141120145300937&peternon1.jpg', 1, '201110'),
(96, 2, 3, 11, 2, 'thumb20141120145300937&peternon1.jpg', 1, '201110'),
(96, 3, 28, 11, 2, 'thumb20141120145300937&peternon1.jpg', 1, '201110'),
(96, 4, 4, 11, 1, 'thumb20141120145300937&peternon1.jpg', 1, '201110'),
(97, 1, 3, 11, 2, 'thumb20141120145928835&peternonfur1.jpg', 1, '201111'),
(97, 2, 26, 11, 1, 'thumb20141120145928835&peternonfur1.jpg', 1, '201111'),
(98, 1, 26, 11, 1, 'thumb20141120150610887&peternon1.jpg', 1, '201110'),
(98, 2, 3, 11, 2, 'thumb20141120150610887&peternon1.jpg', 1, '201110'),
(98, 3, 28, 11, 2, 'thumb20141120150610887&peternon1.jpg', 1, '201110'),
(98, 4, 4, 11, 1, 'thumb20141120150610887&peternon1.jpg', 1, '201110'),
(99, 1, 26, 11, 1, 'thumb20141121162040246&premiatafur.jpg', 1, '211110'),
(99, 2, 3, 11, 2, 'thumb20141121162040246&premiatafur.jpg', 1, '211110'),
(99, 3, 28, 11, 2, 'thumb20141121162040246&premiatafur.jpg', 1, '211110'),
(99, 4, 4, 11, 1, 'thumb20141121162040246&premiatafur.jpg', 1, '211110'),
(100, 1, 5, 34, 1, 'thumb20141121162500815&topcp.jpg', 1, '221110'),
(101, 1, 22, 35, 2, 'thumb20141121163425150&edt_new_color_resize_eau_de_lierre.jpg', 1, '231110'),
(102, 1, 22, 35, 2, 'thumb20141121165200947&edt_new_color_resize_oyedo_1.jpg', 1, '231111'),
(103, 1, 22, 35, 2, 'thumb20141121165245855&edt_new_color_resize_eau_duelle.jpg', 1, '231112'),
(104, 1, 22, 35, 2, 'thumb20141121170041558&edt_new_color_resize_philosykos.jpg', 1, '231113'),
(105, 1, 22, 35, 2, 'thumb20141121170528474&do_son_resize.jpg', 1, '231114'),
(106, 2, 22, 35, 2, '20141122203206693&lombre_edp.jpg', 1, '231115'),
(107, 1, 22, 35, 2, 'thumb20141121171357446&philosykos_resize.jpg', 1, '231116'),
(108, 1, 22, 35, 2, 'thumb20141121171641669&volutesp75.jpg', 1, '231117'),
(109, 1, 22, 35, 2, 'thumb20141121172056642&tamdao100v1.jpg', 1, '231118'),
(110, 1, 22, 35, 2, 'thumb20141121172410657&vetyverio-flacon-dos.jpg', 1, '231119'),
(111, 1, 22, 35, 2, 'thumb20141121172806029&volute100v1_1.jpg', 1, '231120'),
(112, 1, 22, 35, 2, 'thumb20141121173136371&carousel_image_3.png', 1, '231121'),
(113, 1, 22, 35, 2, 'thumb20141121174631564&carousel_image_1.png', 1, '231122'),
(114, 1, 22, 35, 2, 'thumb20141121175425303&carousel_image_4.png', 1, '231124'),
(115, 1, 22, 35, 2, 'thumb20141121180029414&carousel_image_9.png', 1, '231123'),
(116, 1, 22, 35, 2, 'thumb20141121180613056&carsousel_image_8.png', 1, '231125'),
(124, 1, 22, 37, 1, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(124, 2, 22, 38, 3, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(124, 3, 22, 39, 2, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(124, 4, 22, 40, 1, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(124, 5, 22, 41, 2, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(124, 6, 22, 42, 1, 'thumb20141122165608381&bagsdesign2.jpg', 1, '241110'),
(125, 1, 22, 43, 2, 'thumb20141122170514127&designinverso1.jpg', 1, '241111'),
(125, 2, 22, 44, 1, 'thumb20141122170514127&designinverso1.jpg', 1, '241111'),
(125, 3, 22, 45, 3, 'thumb20141122170514127&designinverso1.jpg', 1, '241111'),
(132, 1, 22, 35, 1, 'thumb20141124183151099&carousel_image_2.png', 1, '261126');

-- --------------------------------------------------------

--
-- Struttura della tabella `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `txBrand` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dump dei dati per la tabella `brand`
--

INSERT INTO `brand` (`idBrand`, `txBrand`) VALUES
(20, '5 DEPARTMENT'),
(21, 'ALTO'),
(22, 'ANDREA INCONTRI'),
(23, 'ANTIPAST'),
(24, 'BJORG'),
(25, 'CARLO CONTRADA'),
(26, 'COLLECTION PRIVE'),
(27, 'DAMIR DOMA'),
(29, 'DIPTYQUE'),
(30, 'DUS'),
(31, 'ES'),
(32, 'IOSSELLINI'),
(33, 'JAMIN PUECH'),
(34, 'JOE'),
(35, 'LE PRAIRIES DE PARIS'),
(36, 'LUNA BI'),
(37, 'MARNI'),
(39, 'MSGM'),
(40, 'ORION LONDON'),
(41, 'PAULA CADEMARTORI'),
(42, 'PREMIATA WHITE'),
(43, 'ROBERTO DEL CARLO'),
(44, 'SAMANTHA SUNG'),
(45, 'SOHO DE LUXE'),
(46, 'SO NICE'),
(47, 'U'),
(48, 'VOLTA'),
(49, 'USLUAIRLINES'),
(50, 'DESIGNINVERSO'),
(51, 'CALDERARA'),
(52, 'ARANTH'),
(53, 'BERNSTOCK SPIERS'),
(54, 'PAOLA DALIANI'),
(55, 'PETER NON');

-- --------------------------------------------------------

--
-- Struttura della tabella `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE IF NOT EXISTS `campaigns` (
  `idCampaign` int(11) NOT NULL AUTO_INCREMENT,
  `txCampaign` varchar(45) DEFAULT NULL,
  `dtInizio` date DEFAULT NULL,
  `dtFine` date DEFAULT NULL,
  `pcSconto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCampaign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `campaigns`
--

INSERT INTO `campaigns` (`idCampaign`, `txCampaign`, `dtInizio`, `dtFine`, `pcSconto`) VALUES
(1, 'SALDI P/E 2014', '2014-10-28', '2014-12-31', 70);

-- --------------------------------------------------------

--
-- Struttura della tabella `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `idColor` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txColor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idColor`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `color`
--

INSERT INTO `color` (`idColor`, `idLanguages`, `txColor`) VALUES
(1, 'en', 'ORANGE'),
(1, 'it', 'ARANCIONE'),
(2, 'en', 'SILVER'),
(2, 'it', 'ARGENTO'),
(3, 'en', 'BEIGE'),
(3, 'it', 'BEIGE'),
(4, 'en', 'WHITE'),
(4, 'it', 'BIANCO'),
(5, 'en', 'BLUE'),
(5, 'it', 'BLU'),
(6, 'en', 'LIGHT BLUE'),
(6, 'it', 'CELESTE'),
(7, 'en', 'DENIM'),
(7, 'it', 'DENIM'),
(8, 'en', 'YELLOW'),
(8, 'it', 'GIALLO'),
(9, 'en', 'GREY'),
(9, 'it', 'GRIGIO'),
(10, 'en', 'BROWN'),
(10, 'it', 'MARRONE'),
(11, 'en', 'BLACK'),
(11, 'it', 'NERO'),
(12, 'en', 'GOLD'),
(12, 'it', 'ORO'),
(13, 'en', 'ROSE'),
(13, 'it', 'ROSA'),
(14, 'en', 'RED'),
(14, 'it', 'ROSSO'),
(15, 'en', 'GREEN'),
(15, 'it', 'VERDE'),
(16, 'en', 'PURPLE'),
(16, 'it', 'VIOLA'),
(17, 'en', 'LEOPARD'),
(17, 'it', 'LEOPARD'),
(18, 'en', 'TURQUASE'),
(18, 'it', 'TURCHESE'),
(19, 'en', 'OCEAN'),
(19, 'it', 'OCEANO'),
(20, 'en', 'CARBON'),
(20, 'it', 'CARBONE'),
(21, 'en', 'CINNAMON BROWN'),
(21, 'it', 'CANNELLA'),
(22, 'en', 'BLUE/BLACK'),
(22, 'it', 'BLU/BLACK'),
(23, 'en', 'copper '),
(23, 'it', 'rame'),
(24, 'en', 'PINK GOLD'),
(24, 'it', 'ORO ROSA'),
(25, 'en', 'BORDAUX'),
(25, 'it', 'BORDAUX'),
(26, 'en', 'LILAC'),
(26, 'it', 'LILLA'),
(27, 'en', 'MULTICOLOR'),
(27, 'it', 'MULTICOLOR'),
(28, 'en', 'CYPRESS'),
(28, 'it', 'CIPRESSO'),
(29, 'en', 'CANDY'),
(29, 'it', 'CANDY'),
(30, 'en', 'SILVER/BLACK'),
(30, 'it', 'ARGENTO/NERO'),
(31, 'en', 'DARK RED'),
(31, 'it', 'ROSSO SCURO'),
(32, 'en', 'EMERALD-GREEN'),
(32, 'it', 'SMERALDO'),
(33, 'en', 'SAVANNAH'),
(33, 'it', 'SAVANA'),
(34, 'en', 'WATER'),
(34, 'it', 'ACQUA'),
(35, 'en', 'NO'),
(35, 'it', 'NO'),
(36, 'en', 'FLUORESCENT YELLOW'),
(36, 'it', 'GIALLO FLUO'),
(37, 'en', 'BLUE/GOLD'),
(37, 'it', 'BLU/ORO'),
(38, 'en', 'FLUORESCENT YELLOW/GOLD'),
(38, 'it', 'GIALLO FLUO/ORO'),
(39, 'en', 'DARK GREEN/GOLD'),
(39, 'it', 'VERDE BOTTIGLIA/ORO'),
(40, 'en', 'FUXSIA/GOLD'),
(40, 'it', 'FUXSIA/ORO'),
(41, 'en', 'TURQUOISE/GOLD'),
(41, 'it', 'TURCHESE/ORO'),
(42, 'en', 'BLACK/GOLD'),
(42, 'it', 'NERO/ORO'),
(43, 'en', 'METAL GOLD/GOLD'),
(43, 'it', 'ORO METAL/ORO'),
(44, 'en', 'METAL LEAD/GOLD'),
(44, 'it', 'PIOMBO METAL/ORO'),
(45, 'en', 'SILVER/SILVER'),
(45, 'it', 'ARGENTO/ARGENTO'),
(46, 'en', 'AMBER'),
(46, 'it', 'AMBRA');

-- --------------------------------------------------------

--
-- Struttura della tabella `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `idConfiguration` varchar(50) NOT NULL,
  `txConfiguration` varchar(100) DEFAULT NULL,
  `nrConfiguration` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConfiguration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `configuration`
--

INSERT INTO `configuration` (`idConfiguration`, `txConfiguration`, `nrConfiguration`) VALUES
('1', 'Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `idCoupon` varchar(45) NOT NULL,
  `idUser` varchar(100) DEFAULT NULL,
  `pcSconto` smallint(6) DEFAULT NULL,
  `dtScadenza` date DEFAULT NULL,
  `qtUtilizzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCoupon`),
  KEY `fk_Coupons_Customer1` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `idUser` varchar(100) NOT NULL,
  `txPassword` varchar(20) NOT NULL,
  `txNome` varchar(30) NOT NULL,
  `txCognome` varchar(30) NOT NULL,
  `txFiscale` varchar(100) DEFAULT NULL,
  `idTypeState` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_Customer_Type_State_Account1` (`idTypeState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `customer`
--

INSERT INTO `customer` (`idUser`, `txPassword`, `txNome`, `txCognome`, `txFiscale`, `idTypeState`) VALUES
('1', 'ANTANI', 'A', 'A', 'A', 1),
('simone.bagnolesi@gmail.com', 'didone', 'simone', 'bagnolesi', NULL, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `customer_roles`
--

DROP TABLE IF EXISTS `customer_roles`;
CREATE TABLE IF NOT EXISTS `customer_roles` (
  `idUser` varchar(100) NOT NULL,
  `txRole` varchar(20) NOT NULL,
  PRIMARY KEY (`idUser`,`txRole`),
  KEY `fk_CustomerRoles_Customer1_idx` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `customer_roles`
--

INSERT INTO `customer_roles` (`idUser`, `txRole`) VALUES
('1', 'AMMINISTRATORE'),
('simone.bagnolesi@gmail.com', 'CUSTOMER');

-- --------------------------------------------------------

--
-- Struttura della tabella `delivery_cost`
--

DROP TABLE IF EXISTS `delivery_cost`;
CREATE TABLE IF NOT EXISTS `delivery_cost` (
  `idDeliveryCost` int(11) NOT NULL AUTO_INCREMENT,
  `txDescrizione` varchar(45) DEFAULT NULL,
  `imSpese` decimal(15,2) DEFAULT NULL,
  `fgDeleted` tinyint(4) DEFAULT NULL,
  `txDescrizioneExt` varchar(250) DEFAULT NULL,
  `txLinkTracking` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDeliveryCost`),
  UNIQUE KEY `idDeliveryCost_UNIQUE` (`idDeliveryCost`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dump dei dati per la tabella `delivery_cost`
--

INSERT INTO `delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`, `fgDeleted`, `txDescrizioneExt`, `txLinkTracking`) VALUES
(1, 'SPEDIZIONE GRATUITA', '0.00', 0, 'GLS Parcel camionistico', NULL),
(2, 'GLS Zefiro via aerea', '9.74', 0, 'GLS Zefiro via aerea', NULL),
(3, 'GLS Zefiro via aerea', '20.04', 0, 'GLS Zefiro via aerea', NULL),
(4, 'GLS Zefiro via aerea', '17.19', 0, 'GLS Zefiro via aerea', NULL),
(5, 'GLS Zefiro via aerea', '17.43', 0, 'GLS Zefiro via aerea', NULL),
(6, 'GLS Zefiro via aerea', '19.56', 0, 'GLS Zefiro via aerea', NULL),
(7, 'GLS Zefiro via aerea', '34.15', 0, 'GLS Zefiro via aerea', NULL),
(8, 'GLS Zefiro via aerea', '48.94', 0, 'GLS Zefiro via aerea', NULL),
(9, 'GLS Zefiro via aerea', '49.46', 0, 'GLS Zefiro via aerea', NULL),
(10, 'GLS Parcel camionistico', '13.80', 0, 'GLS Parcel camionistico', NULL),
(11, 'GLS Parcel camionistico', '14.05', 0, 'GLS Parcel camionistico', NULL),
(12, 'GLS Parcel camionistico', '15.70', 0, 'GLS Parcel camionistico', NULL),
(13, 'GLS Parcel camionistico', '16.76', 0, 'GLS Parcel camionistico', NULL),
(14, 'GLS Parcel camionistico', '17.25', 0, 'GLS Parcel camionistico', NULL),
(15, 'GLS Parcel camionistico', '18.97', 0, 'GLS Parcel camionistico', NULL),
(16, 'GLS Parcel camionistico', '19.35', 0, 'GLS Parcel camionistico', NULL),
(17, 'GLS Parcel camionistico', '20.45', 0, 'GLS Parcel camionistico', NULL),
(18, 'GLS Parcel camionistico', '21.48', 0, 'GLS Parcel camionistico', NULL),
(19, 'GLS Parcel camionistico', '23.66', 0, 'GLS Parcel camionistico', NULL),
(20, 'GLS Parcel camionistico', '25.88', 0, 'GLS Parcel camionistico', NULL),
(21, 'GLS Parcel camionistico', '27.46', 0, 'GLS Parcel camionistico', NULL),
(22, 'GLS Parcel camionistico', '28.34', 0, 'GLS Parcel camionistico', NULL),
(23, 'GLS Parcel camionistico', '28.59', 0, 'GLS Parcel camionistico', NULL),
(24, 'GLS Parcel camionistico', '30.68', 0, 'GLS Parcel camionistico', NULL),
(25, 'GLS Parcel camionistico', '31.45', 0, 'GLS Parcel camionistico', NULL),
(26, 'GLS Parcel camionistico', '36.73', 0, 'GLS Parcel camionistico', NULL),
(27, 'GLS Parcel camionistico', '40.91', 0, 'GLS Parcel camionistico', NULL),
(28, 'GLS Parcel camionistico', '41.35', 0, 'GLS Parcel camionistico', NULL),
(29, 'GLS Parcel camionistico', '45.30', 0, 'GLS Parcel camionistico', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `delivery_nazioni`
--

DROP TABLE IF EXISTS `delivery_nazioni`;
CREATE TABLE IF NOT EXISTS `delivery_nazioni` (
  `idDeliveryCost` int(11) NOT NULL,
  `idNazione` varchar(100) NOT NULL,
  PRIMARY KEY (`idDeliveryCost`,`idNazione`),
  KEY `fk_delivery_nazioni_delivery_cost1` (`idDeliveryCost`),
  KEY `fk_delivery_nazioni_nazioni1` (`idNazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `delivery_nazioni`
--

INSERT INTO `delivery_nazioni` (`idDeliveryCost`, `idNazione`) VALUES
(1, 'ITALIA'),
(2, 'Austria'),
(2, 'Belgium'),
(2, 'Denmark'),
(2, 'Finland'),
(2, 'France'),
(2, 'Germany'),
(2, 'Greece'),
(2, 'Ireland'),
(2, 'Luxembourg'),
(2, 'Monaco'),
(2, 'Netherlands'),
(2, 'Portugal'),
(2, 'Spain'),
(2, 'Sweden'),
(2, 'United Kingdom'),
(3, 'Bulgaria'),
(3, 'Croatia'),
(3, 'Cyprus'),
(3, 'Czech Republic'),
(3, 'Estonia'),
(3, 'Hungary'),
(3, 'Latvia'),
(3, 'Lithuania'),
(3, 'Malta'),
(3, 'Poland'),
(3, 'Romania'),
(3, 'Slovakia'),
(3, 'Slovenia'),
(4, 'Andorra'),
(4, 'Gibraltar'),
(4, 'Switzerland'),
(5, 'Canary Islands'),
(5, 'Faroe Islands'),
(5, 'Guernsey'),
(5, 'Iceland'),
(5, 'Jersey'),
(5, 'Norway'),
(6, 'Canada'),
(6, 'United States'),
(7, 'American Samoa'),
(7, 'Anguilla'),
(7, 'Antigua and Barbuda'),
(7, 'Argentina'),
(7, 'Aruba'),
(7, 'Australia'),
(7, 'Bahamas'),
(7, 'Bahrain'),
(7, 'Bangladesh'),
(7, 'Barbados'),
(7, 'Belize'),
(7, 'Bermuda'),
(7, 'Bolivia'),
(7, 'Bonaire'),
(7, 'Brazil'),
(7, 'Brunei Darussalam'),
(7, 'Cameroon'),
(7, 'Cayman Islands'),
(7, 'Chile'),
(7, 'Colombia'),
(7, 'Costa Rica'),
(7, 'Curacao'),
(7, 'Dominica'),
(7, 'Dominican Republic'),
(7, 'Ecuador'),
(7, 'Egypt'),
(7, 'El Salvador'),
(7, 'Equatorial Guinea'),
(7, 'Fiji'),
(7, 'French Guiana'),
(7, 'Greenland'),
(7, 'Grenada'),
(7, 'Guadeloupe'),
(7, 'Guam'),
(7, 'Guatemala'),
(7, 'Guyana'),
(7, 'Haiti'),
(7, 'Honduras'),
(7, 'Hong Kong'),
(7, 'India'),
(7, 'Indonesia'),
(7, 'Ivory Coast'),
(7, 'Jamaica'),
(7, 'Japan'),
(7, 'Kenya'),
(7, 'Kuwait'),
(7, 'Macao'),
(7, 'Malaysia'),
(7, 'Maldives'),
(7, 'Martinique'),
(7, 'Mexico'),
(7, 'Micronesia'),
(7, 'Montserrat'),
(7, 'Nevis'),
(7, 'New Caledonia'),
(7, 'New Zealand'),
(7, 'Nigeria'),
(7, 'Oman'),
(7, 'Pakistan'),
(7, 'Palau'),
(7, 'Panama'),
(7, 'Paraguay'),
(7, 'Peru'),
(7, 'Philippines'),
(7, 'Puerto Rico'),
(7, 'Qatar'),
(7, 'Saint Barthelemy'),
(7, 'Saint Eustatius'),
(7, 'Saint Kitts and Nevis'),
(7, 'Saint Lucia'),
(7, 'Saint Maarten'),
(7, 'Saint Vincent e Grenadine'),
(7, 'Samoa'),
(7, 'Saudi Arabia'),
(7, 'Senegal'),
(7, 'Singapore'),
(7, 'South Africa'),
(7, 'South Korea'),
(7, 'Sri Lanka'),
(7, 'Suriname'),
(7, 'Tahiti'),
(7, 'Taiwan'),
(7, 'Thailand'),
(7, 'Trinidad and Tobago'),
(7, 'Turkey'),
(7, 'United Arab Emirates'),
(7, 'Uruguay'),
(7, 'Venezuela'),
(7, 'Virgin Islands'),
(8, 'Algeria'),
(8, 'Benin'),
(8, 'Bhutan'),
(8, 'Botswana'),
(8, 'Burkina Faso'),
(8, 'Burundi'),
(8, 'Cambodia'),
(8, 'Cape Verde'),
(8, 'Center Africa'),
(8, 'Chad'),
(8, 'China'),
(8, 'Comoros'),
(8, 'Congo'),
(8, 'Cook Islands'),
(8, 'Djibouti'),
(8, 'East Timor'),
(8, 'Eritrea'),
(8, 'Ethiopia'),
(8, 'Gabon'),
(8, 'Gambia'),
(8, 'Ghana'),
(8, 'Guinea'),
(8, 'Guinea-Bissau'),
(8, 'Iraq'),
(8, 'Israel'),
(8, 'Jordan'),
(8, 'Lao'),
(8, 'Lebanon'),
(8, 'Lesotho'),
(8, 'Liberia'),
(8, 'Libya'),
(8, 'Madagascar'),
(8, 'Malawi'),
(8, 'Mali'),
(8, 'Marshall Islands'),
(8, 'Mauritania'),
(8, 'Mauritius'),
(8, 'Mayotte'),
(8, 'Morocco'),
(8, 'Namibia'),
(8, 'Nauru'),
(8, 'Nepal'),
(8, 'Nicaragua'),
(8, 'Niger'),
(8, 'Papua New Guinea'),
(8, 'Reunion Island'),
(8, 'Rwanda'),
(8, 'Saipan'),
(8, 'Seychelles'),
(8, 'Sierra Leone'),
(8, 'Somalia'),
(8, 'Swaziland'),
(8, 'Syria'),
(8, 'Tanzania'),
(8, 'Togo'),
(8, 'Tonga'),
(8, 'Tunisia'),
(8, 'Turks and Caicos Islands'),
(8, 'Tuvalu'),
(8, 'Uganda'),
(8, 'Vanuatu'),
(8, 'Vietnam'),
(8, 'Yemen'),
(8, 'Zambia'),
(8, 'Zimbabwe'),
(9, 'Afghanistan'),
(9, 'Albania'),
(9, 'Angola'),
(9, 'Armenia'),
(9, 'Azerbaijan'),
(9, 'Belarus'),
(9, 'Bosnia and Herzegovina'),
(9, 'Cuba'),
(9, 'Falkland Islands'),
(9, 'Georgia'),
(9, 'Iran'),
(9, 'Kazakhstan'),
(9, 'Kiribati'),
(9, 'Kosovo'),
(9, 'Kyrgyzstan'),
(9, 'Macedonia'),
(9, 'Moldova'),
(9, 'Mongolia'),
(9, 'Montenegro'),
(9, 'Mozambique'),
(9, 'Myanmar, Burma'),
(9, 'Niue'),
(9, 'North Korea'),
(9, 'Russian Federation'),
(9, 'Serbia'),
(9, 'Solomon Islands'),
(9, 'South Sudan'),
(9, 'Sudan'),
(9, 'Tajikistan'),
(9, 'Ukraine'),
(9, 'Uzbekistan'),
(10, 'Austria'),
(11, 'Belgium'),
(12, 'France'),
(12, 'Germany'),
(12, 'Luxembourg'),
(12, 'Netherlands'),
(13, 'Liechtenstein'),
(14, 'Switzerland'),
(15, 'Denmark'),
(15, 'Slovenia'),
(16, 'England'),
(16, 'Galles'),
(16, 'Scotland'),
(17, 'Hungary'),
(18, 'Croatia'),
(18, 'Serbia'),
(19, 'Poland'),
(20, 'Czech Republic'),
(20, 'Spain'),
(21, 'Sweden'),
(22, 'Slovakia'),
(23, 'Bulgaria'),
(23, 'Estonia'),
(23, 'Latvia'),
(23, 'Lithuania'),
(23, 'Norway'),
(23, 'Portugal'),
(23, 'Romania'),
(24, 'Ireland'),
(25, 'Finland'),
(26, 'Turkey'),
(27, 'Greece'),
(28, 'Nord Ireland'),
(29, 'Cyprus'),
(29, 'Malta');

-- --------------------------------------------------------

--
-- Struttura della tabella `fidelitycards`
--

DROP TABLE IF EXISTS `fidelitycards`;
CREATE TABLE IF NOT EXISTS `fidelitycards` (
  `idFidelity` varchar(45) NOT NULL,
  `txNome` varchar(45) DEFAULT NULL,
  `txCognome` varchar(45) DEFAULT NULL,
  `dtRilascio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txEmail` varchar(45) DEFAULT NULL,
  `txTel` varchar(45) DEFAULT NULL,
  `pcSconto` int(11) NOT NULL,
  PRIMARY KEY (`idFidelity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `fidelity_customer`
--

DROP TABLE IF EXISTS `fidelity_customer`;
CREATE TABLE IF NOT EXISTS `fidelity_customer` (
  `idUser` varchar(100) NOT NULL,
  `idFidelity` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`,`idFidelity`),
  KEY `fk_fidelity_customer_FidelityCards1_idx` (`idFidelity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `idGender` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txGender` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idGender`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `gender`
--

INSERT INTO `gender` (`idGender`, `idLanguages`, `txGender`) VALUES
(1, 'en', 'SHOP'),
(1, 'it', 'SHOP');

-- --------------------------------------------------------

--
-- Struttura della tabella `group_images`
--

DROP TABLE IF EXISTS `group_images`;
CREATE TABLE IF NOT EXISTS `group_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `txLibrary` varchar(45) DEFAULT NULL,
  `nrImages` int(11) DEFAULT NULL,
  `maxHeight` int(11) DEFAULT NULL,
  `maxWidth` int(11) DEFAULT NULL,
  `fgGender` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `group_images`
--

INSERT INTO `group_images` (`txGroupImages`, `txLibrary`, `nrImages`, `maxHeight`, `maxWidth`, `fgGender`) VALUES
('carousel', 'images/home', 20, 1080, 1560, 0),
('new', 'images/home', 1, 130, 260, 0),
('newArrivals', 'images/home', 6, 960, 960, 1),
('promo', 'images/home', 1, 130, 260, 0),
('tabNav', 'images/home', 6, 130, 260, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `ipnmessages`
--

DROP TABLE IF EXISTS `ipnmessages`;
CREATE TABLE IF NOT EXISTS `ipnmessages` (
  `idOrder` int(11) DEFAULT NULL,
  `idTransaction` varchar(50) NOT NULL,
  `tsInserimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txMessage` varchar(10000) DEFAULT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  `txNote` varchar(100) DEFAULT NULL,
  `fgElaborato` tinyint(1) DEFAULT NULL,
  `idRefund` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txMaterial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idMaterial`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `material`
--

INSERT INTO `material` (`idMaterial`, `idLanguages`, `txMaterial`) VALUES
(1, 'en', 'COTTON'),
(1, 'it', 'COTONE'),
(2, 'en', 'SILK'),
(2, 'it', 'SETA'),
(3, 'en', 'BRUSHED CALF LEATHER'),
(3, 'it', 'VITELLO SPAZZOLATO'),
(4, 'en', 'NEOPRENE'),
(4, 'it', 'NEOPRENE'),
(5, 'en', 'POLIESTERE'),
(5, 'it', 'POLIESTERE'),
(6, 'en', 'PLASTIC'),
(6, 'it', 'PLASTICA'),
(7, 'en', 'VISCOSE'),
(7, 'it', 'VISCOSA'),
(8, 'en', 'ALPACA WOOL'),
(8, 'it', 'ALPACA'),
(9, 'en', 'VIRGIN WOOL'),
(9, 'it', 'LANA VERGINE'),
(10, 'en', 'WOOL'),
(10, 'it', 'LANA'),
(11, 'en', 'CASHEMERE'),
(11, 'it', 'CASHEMERE'),
(12, 'en', 'MOHAIR WOOL'),
(12, 'it', 'LANA MOHAIR'),
(13, 'en', 'SILVER'),
(13, 'it', 'ARGENTO'),
(14, 'en', 'ORO'),
(14, 'it', 'ORO'),
(15, 'en', 'METAL'),
(15, 'it', 'METALLO'),
(16, 'en', 'RESIN'),
(16, 'it', 'RESINA'),
(17, 'en', 'TAFFETA'),
(17, 'it', 'TAFFETA'),
(18, 'en', 'OSTRICH'),
(18, 'it', 'STRUZZO'),
(19, 'en', 'PONY HORSE'),
(19, 'it', 'CAVALLINO'),
(20, 'en', 'PVC'),
(20, 'it', 'PVC'),
(21, 'en', 'NAPPA LEATHER'),
(21, 'it', 'NAPPA'),
(22, 'en', 'SATIN'),
(22, 'it', 'RASO'),
(23, 'en', 'FELT'),
(23, 'it', 'FELTRO'),
(24, 'en', 'LEATHER'),
(24, 'it', 'PELLE'),
(25, 'en', 'HORN'),
(25, 'it', 'CORNO'),
(26, 'en', 'ECO-FUR'),
(26, 'it', 'ECO-PELLICCIA'),
(27, 'en', 'WATER'),
(27, 'it', 'ACQUA'),
(28, 'en', 'ESSENCE'),
(28, 'it', 'ESSENZA'),
(29, 'en', 'CREAM'),
(29, 'it', 'CREMA'),
(30, 'en', 'SOAP'),
(30, 'it', 'SAPONE'),
(31, 'en', 'OIL'),
(31, 'it', 'OLIO');

-- --------------------------------------------------------

--
-- Struttura della tabella `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
CREATE TABLE IF NOT EXISTS `nazioni` (
  `idNazione` varchar(100) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  PRIMARY KEY (`idNazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `nazioni`
--

INSERT INTO `nazioni` (`idNazione`, `idLanguages`) VALUES
('Afghanistan', 'en'),
('Albania', 'en'),
('Algeria', 'en'),
('American Samoa', 'en'),
('Andorra', 'en'),
('Angola', 'en'),
('Anguilla', 'en'),
('Antigua and Barbuda', 'en'),
('Argentina', 'en'),
('Armenia', 'en'),
('Aruba', 'en'),
('Australia', 'en'),
('Austria', 'en'),
('Azerbaijan', 'en'),
('Bahamas', 'en'),
('Bahrain', 'en'),
('Bangladesh', 'en'),
('Barbados', 'en'),
('Belarus', 'en'),
('Belgium', 'en'),
('Belize', 'en'),
('Benin', 'en'),
('Bermuda', 'en'),
('Bhutan', 'en'),
('Bolivia', 'en'),
('Bonaire', 'en'),
('Bosnia and Herzegovina', 'en'),
('Botswana', 'en'),
('Brazil', 'en'),
('Brunei Darussalam', 'en'),
('Bulgaria', 'en'),
('Burkina Faso', 'en'),
('Burundi', 'en'),
('Cambodia', 'en'),
('Cameroon', 'en'),
('Canada', 'en'),
('Canary Islands', 'en'),
('Cape Verde', 'en'),
('Cayman Islands', 'en'),
('Center Africa', 'en'),
('Chad', 'en'),
('Chile', 'en'),
('China', 'en'),
('Colombia', 'en'),
('Comoros', 'en'),
('Congo', 'en'),
('Cook Islands', 'en'),
('Costa Rica', 'en'),
('Croatia', 'en'),
('Cuba', 'en'),
('Curacao', 'en'),
('Cyprus', 'en'),
('Czech Republic', 'en'),
('Denmark', 'en'),
('Djibouti', 'en'),
('Dominica', 'en'),
('Dominican Republic', 'en'),
('East Timor', 'en'),
('Ecuador', 'en'),
('Egypt', 'en'),
('El Salvador', 'en'),
('England', 'en'),
('Equatorial Guinea', 'en'),
('Eritrea', 'en'),
('Estonia', 'en'),
('Ethiopia', 'en'),
('Falkland Islands', 'en'),
('Faroe Islands', 'en'),
('Fiji', 'en'),
('Finland', 'en'),
('France', 'en'),
('French Guiana', 'en'),
('Gabon', 'en'),
('Galles', 'en'),
('Gambia', 'en'),
('Georgia', 'en'),
('Germany', 'en'),
('Ghana', 'en'),
('Gibraltar', 'en'),
('Greece', 'en'),
('Greenland', 'en'),
('Grenada', 'en'),
('Guadeloupe', 'en'),
('Guam', 'en'),
('Guatemala', 'en'),
('Guernsey', 'en'),
('Guinea', 'en'),
('Guinea-Bissau', 'en'),
('Guyana', 'en'),
('Haiti', 'en'),
('Honduras', 'en'),
('Hong Kong', 'en'),
('Hungary', 'en'),
('Iceland', 'en'),
('India', 'en'),
('Indonesia', 'en'),
('Iran', 'en'),
('Iraq', 'en'),
('Ireland', 'en'),
('Israel', 'en'),
('ITALIA', 'it'),
('Ivory Coast', 'en'),
('Jamaica', 'en'),
('Japan', 'en'),
('Jersey', 'en'),
('Jordan', 'en'),
('Kazakhstan', 'en'),
('Kenya', 'en'),
('Kiribati', 'en'),
('Kosovo', 'en'),
('Kuwait', 'en'),
('Kyrgyzstan', 'en'),
('Lao', 'en'),
('Latvia', 'en'),
('Lebanon', 'en'),
('Lesotho', 'en'),
('Liberia', 'en'),
('Libya', 'en'),
('Liechtenstein', 'en'),
('Lithuania', 'en'),
('Luxembourg', 'en'),
('Macao', 'en'),
('Macedonia', 'en'),
('Madagascar', 'en'),
('Malawi', 'en'),
('Malaysia', 'en'),
('Maldives', 'en'),
('Mali', 'en'),
('Malta', 'en'),
('Marshall Islands', 'en'),
('Martinique', 'en'),
('Mauritania', 'en'),
('Mauritius', 'en'),
('Mayotte', 'en'),
('Mexico', 'en'),
('Micronesia', 'en'),
('Moldova', 'en'),
('Monaco', 'en'),
('Mongolia', 'en'),
('Montenegro', 'en'),
('Montserrat', 'en'),
('Morocco', 'en'),
('Mozambique', 'en'),
('Myanmar, Burma', 'en'),
('Namibia', 'en'),
('Nauru', 'en'),
('Nepal', 'en'),
('Netherlands', 'en'),
('Nevis', 'en'),
('New Caledonia', 'en'),
('New Zealand', 'en'),
('Nicaragua', 'en'),
('Niger', 'en'),
('Nigeria', 'en'),
('Niue', 'en'),
('Nord Ireland', 'en'),
('North Korea', 'en'),
('Norway', 'en'),
('Oman', 'en'),
('Pakistan', 'en'),
('Palau', 'en'),
('Panama', 'en'),
('Papua New Guinea', 'en'),
('Paraguay', 'en'),
('Peru', 'en'),
('Philippines', 'en'),
('Poland', 'en'),
('Portugal', 'en'),
('Puerto Rico', 'en'),
('Qatar', 'en'),
('Reunion Island', 'en'),
('Romania', 'en'),
('Russian Federation', 'en'),
('Rwanda', 'en'),
('Saint Barthelemy', 'en'),
('Saint Eustatius', 'en'),
('Saint Kitts and Nevis', 'en'),
('Saint Lucia', 'en'),
('Saint Maarten', 'en'),
('Saint Vincent e Grenadine', 'en'),
('Saipan', 'en'),
('Samoa', 'en'),
('Saudi Arabia', 'en'),
('Scotland', 'en'),
('Senegal', 'en'),
('Serbia', 'en'),
('Seychelles', 'en'),
('Sierra Leone', 'en'),
('Singapore', 'en'),
('Slovakia', 'en'),
('Slovenia', 'en'),
('Solomon Islands', 'en'),
('Somalia', 'en'),
('South Africa', 'en'),
('South Korea', 'en'),
('South Sudan', 'en'),
('Spain', 'en'),
('Sri Lanka', 'en'),
('Sudan', 'en'),
('Suriname', 'en'),
('Swaziland', 'en'),
('Sweden', 'en'),
('Switzerland', 'en'),
('Syria', 'en'),
('Tahiti', 'en'),
('Taiwan', 'en'),
('Tajikistan', 'en'),
('Tanzania', 'en'),
('Thailand', 'en'),
('Togo', 'en'),
('Tonga', 'en'),
('Trinidad and Tobago', 'en'),
('Tunisia', 'en'),
('Turkey', 'en'),
('Turks and Caicos Islands', 'en'),
('Tuvalu', 'en'),
('Uganda', 'en'),
('Ukraine', 'en'),
('United Arab Emirates', 'en'),
('United Kingdom', 'en'),
('United States', 'en'),
('Uruguay', 'en'),
('Uzbekistan', 'en'),
('Vanuatu', 'en'),
('Venezuela', 'en'),
('Vietnam', 'en'),
('Virgin Islands', 'en'),
('Yemen', 'en'),
('Zambia', 'en'),
('Zimbabwe', 'en');

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` varchar(100) NOT NULL,
  `imOrdine` int(11) NOT NULL,
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
  KEY `fk_orders_coupons1_idx` (`idCoupon`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `orders_articles`
--

DROP TABLE IF EXISTS `orders_articles`;
CREATE TABLE IF NOT EXISTS `orders_articles` (
  `idOrder` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  PRIMARY KEY (`idOrder`,`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Article1_idx` (`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Orders1_idx` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `order_refound`
--

DROP TABLE IF EXISTS `order_refound`;
CREATE TABLE IF NOT EXISTS `order_refound` (
  `idRefound` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `idUser` varchar(100) NOT NULL,
  `idTransaction` varchar(45) DEFAULT NULL,
  `imRefound` int(11) DEFAULT NULL,
  `txChangeRefound` varchar(250) DEFAULT NULL,
  `fgChangeRefound` char(1) DEFAULT NULL,
  `fgPartialRefound` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idRefound`),
  KEY `fk_Order_Refound_Orders1_idx` (`idOrder`),
  KEY `fk_Order_Refound_Customer1_idx` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `idGender` int(11) DEFAULT NULL,
  `idType` int(11) DEFAULT NULL,
  `idBrand` int(11) DEFAULT NULL,
  `imPrice` decimal(15,0) DEFAULT NULL,
  `pcDiscount` int(11) DEFAULT NULL,
  `txThumbnailsUrl` varchar(100) DEFAULT NULL,
  `idProductState` int(11) DEFAULT NULL,
  `dtProductState` datetime DEFAULT NULL,
  `idCampaign` int(11) DEFAULT NULL,
  `idMaterial` int(11) DEFAULT NULL,
  `specialPrice` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idProduct_INDEX1` (`idProduct`),
  KEY `fk_Product_Product_State1` (`idProductState`),
  KEY `fk_Product_Gender1` (`idGender`),
  KEY `fk_Product_Type1` (`idType`),
  KEY `fk_Product_Brand1` (`idBrand`),
  KEY `fk_Product_Campaigns1` (`idCampaign`),
  KEY `fk_Product_Material1` (`idMaterial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=134 ;

--
-- Dump dei dati per la tabella `product`
--

INSERT INTO `product` (`idProduct`, `idGender`, `idType`, `idBrand`, `imPrice`, `pcDiscount`, `txThumbnailsUrl`, `idProductState`, `dtProductState`, `idCampaign`, `idMaterial`, `specialPrice`) VALUES
(27, 1, 18, 37, '1250', 0, 'thumb20141027161832712&45239055TE_13P_F.jpg', 1, '2014-10-27 16:18:59', 1, 3, NULL),
(30, 1, 18, 50, '120', 0, 'thumb20141110145915895&IMG_5244.JPG', 2, '2014-11-18 00:00:00', NULL, 6, NULL),
(31, 1, 5, 37, '745', 0, '20141122200715312&20141117145236567marnidress.jpg', 1, '2014-11-17 14:50:49', NULL, 2, NULL),
(33, 1, 5, 37, '840', 0, 'thumb20141117150330714&marnidress2.jpg', 1, '2014-11-17 14:57:20', NULL, 2, NULL),
(34, 1, 5, 37, '650', 0, 'thumb20141117150649764&marnidress3.jpg', 1, '2014-11-17 15:01:00', NULL, 7, NULL),
(35, 1, 7, 37, '485', 0, 'thumb20141117151037361&marnifelpa1.jpg', 1, '2014-11-17 15:04:44', NULL, 7, NULL),
(36, 1, 8, 37, '1080', 0, 'thumb20141117151402445&marnigiacca.jpg', 1, '2014-11-17 15:07:45', NULL, 8, NULL),
(37, 1, 12, 37, '510', 0, 'thumb20141117151903324&marniskirt1.jpg', 1, '2014-11-17 15:13:26', NULL, 2, NULL),
(38, 1, 15, 37, '465', 0, 'thumb20141117152242340&marnisweater.jpg', 1, '2014-11-17 15:16:23', NULL, 9, NULL),
(39, 1, 22, 37, '645', 0, 'thumb20141117152618174&marnitop1.jpg', 1, '2014-11-17 15:20:00', NULL, 2, NULL),
(40, 1, 7, 39, '140', 0, 'thumb20141117152935991&msgm4.jpg', 1, '2014-11-17 15:23:22', NULL, 1, NULL),
(41, 1, 4, 39, '1270', 0, 'thumb20141117153225513&msgmcoat1.jpg', 1, '2014-11-17 15:26:31', NULL, 10, NULL),
(42, 1, 4, 39, '660', 0, 'thumb20141117153632036&msgmcoat2.jpg', 1, '2014-11-17 15:31:15', NULL, 10, NULL),
(43, 1, 5, 39, '545', 0, 'thumb20141117154100230&msgmdress1.jpg', 1, '2014-11-17 15:34:58', NULL, 5, NULL),
(44, 1, 16, 39, '180', 0, 'thumb20141117154358571&msgmshorts1.jpg', 1, '2014-11-17 15:38:09', NULL, 5, NULL),
(45, 1, 5, 39, '370', 0, 'thumb20141117154652304&msgmdress3.jpg', 1, '2014-11-17 15:40:48', NULL, 5, NULL),
(46, 1, 12, 39, '245', 0, 'thumb20141117154924381&msgmskirt2.jpg', 1, '2014-11-17 15:45:39', NULL, 5, NULL),
(47, 1, 4, 30, '1620', 0, 'thumb20141117155305066&cappottodusan.jpg', 1, '2014-11-17 15:47:35', NULL, 8, NULL),
(48, 1, 16, 30, '715', 0, 'thumb20141117155623037&pantdusan1.jpg', 1, '2014-11-17 15:51:02', NULL, 11, NULL),
(49, 1, 16, 37, '445', 0, 'thumb20141117155809616&pantmarni1.jpg', 1, '2014-11-17 15:56:50', NULL, 9, NULL),
(50, 1, 16, 39, '380', 0, 'thumb20141117160407739&pantsmsgm1.jpg', 1, '2014-11-17 16:00:17', NULL, 10, NULL),
(51, 1, 22, 39, '270', 0, 'thumb20141117160852870&topmsgm.jpg', 1, '2014-11-17 16:05:14', NULL, 7, NULL),
(52, 1, 15, 39, '230', 0, 'thumb20141117161232874&topmsgm1.jpg', 1, '2014-11-17 16:09:05', NULL, 9, NULL),
(53, 1, 7, 39, '355', 0, 'thumb20141117161654164&topmsgm3.jpg', 1, '2014-11-17 16:13:10', NULL, 1, NULL),
(54, 1, 16, 51, '325', 0, 'thumb20141117162021276&pantcalderara.jpg', 1, '2014-11-17 16:17:41', NULL, 5, NULL),
(55, 1, 22, 51, '275', 0, 'thumb20141117162511277&topcalderara.jpg', 1, '2014-11-17 16:20:25', NULL, 5, NULL),
(56, 1, 22, 51, '200', 0, 'thumb20141117162732943&topcalderara3.jpg', 1, '2014-11-17 16:23:40', NULL, 5, NULL),
(57, 1, 5, 25, '450', 0, 'thumb20141118161838432&abitocc.jpg', 1, '2014-11-18 16:15:29', NULL, 5, NULL),
(58, 1, 5, 25, '500', 0, 'thumb20141118162243596&abitoccc.jpg', 1, '2014-11-18 16:21:57', NULL, 12, NULL),
(59, 1, 3, 25, '375', 0, 'thumb20141118162937070&camicacc.jpg', 1, '2014-11-18 16:24:53', NULL, 2, NULL),
(60, 1, 3, 25, '375', 0, 'thumb20141118163232366&camiciacc.jpg', 1, '2014-11-18 16:26:24', NULL, 2, NULL),
(61, 1, 12, 25, '340', 0, 'thumb20141118163346493&gonnacc.jpg', 1, '2014-11-18 16:29:57', NULL, 10, NULL),
(62, 1, 3, 51, '338', 0, 'thumb20141118163723090&calderaratop.jpg', 1, '2014-11-18 16:39:32', NULL, 5, NULL),
(63, 1, 1, 24, '240', 0, 'thumb20141118170740089&anbjorg1.jpg', 1, '2014-11-18 17:01:35', NULL, 13, NULL),
(64, 1, 1, 24, '240', 0, 'thumb20141118170858601&annellobjorg.jpg', 1, '2014-11-18 17:05:09', NULL, 13, NULL),
(65, 1, 1, 24, '365', 0, 'thumb20141122115854400&collanaheartbjorg.jpg', 1, '2014-11-18 17:07:50', NULL, 13, NULL),
(66, 1, 1, 24, '250', 0, 'thumb20141119135625261&bjorgneck1.jpg', 1, '2014-11-19 13:51:46', NULL, 13, NULL),
(67, 1, 1, 24, '160', 0, 'thumb20141119135905749&bjorgringbracelet.jpg', 1, '2014-11-19 13:54:51', NULL, 13, NULL),
(68, 1, 1, 51, '325', 0, 'thumb20141119140237932&calderaranecklace1.jpg', 1, '2014-11-19 13:58:47', NULL, 16, NULL),
(69, 1, 1, 51, '315', 0, 'thumb20141119140628953&calderaranecklace3.jpg', 1, '2014-11-19 14:02:29', NULL, 2, NULL),
(70, 1, 1, 51, '300', 0, 'thumb20141119140944080&calderaranecklace2.jpg', 1, '2014-11-19 14:04:45', NULL, 1, NULL),
(71, 1, 1, 51, '220', 0, 'thumb20141119141205598&calderaranecklace5.jpg', 1, '2014-11-19 14:06:42', NULL, 1, NULL),
(72, 1, 1, 51, '110', 0, 'thumb20141119141432529&orrechinicalderara.jpg', 1, '2014-11-19 14:12:18', NULL, 17, NULL),
(73, 1, 1, 24, '365', 0, 'thumb20141119141945710&heartbjorgnecklace.jpg', 1, '2014-11-19 14:14:58', NULL, 13, NULL),
(74, 1, 18, 33, '190', 0, 'thumb20141119145037054&jaminbag1.jpg', 1, '2014-11-19 14:48:58', NULL, 18, NULL),
(75, 1, 18, 33, '435', 0, 'thumb20141119145647130&jaminbag2.jpg', 1, '2014-11-19 15:00:43', NULL, 19, NULL),
(76, 1, 18, 33, '695', 0, 'thumb20141119150901584&jaminbig2.jpg', 1, '2014-11-19 15:03:05', NULL, 19, NULL),
(77, 1, 18, 37, '220', 0, 'thumb20141119151056744&marnibag.jpg', 1, '2014-11-19 15:08:56', NULL, 20, NULL),
(78, 1, 18, 41, '830', 0, 'thumb20141119151650739&paula3.jpg', 1, '2014-11-19 15:16:00', NULL, 22, NULL),
(79, 1, 18, 41, '1450', 0, 'thumb20141119152416360&paulapink.jpg', 1, '2014-11-19 15:21:35', NULL, 21, NULL),
(80, 1, 18, 41, '1500', 0, 'thumb20141119152906558&cademartori2.jpg', 1, '2014-11-19 15:24:34', NULL, 21, NULL),
(81, 1, 18, 37, '710', 0, 'thumb20141119153653554&marnipochette.jpg', 1, '2014-11-19 15:30:50', NULL, 23, NULL),
(82, 1, 20, 52, '300', 0, 'thumb20141119155500168&aranthsilver.jpg', 1, '2014-11-19 15:50:35', NULL, 24, NULL),
(83, 1, 20, 37, '470', 0, 'thumb20141119155745902&marniboots1.jpg', 1, '2014-11-19 16:33:11', NULL, 24, NULL),
(84, 1, 20, 37, '590', 0, 'thumb20141119165156903&marniborde1.jpg', 1, '2014-11-19 16:46:00', NULL, 24, NULL),
(85, 1, 20, 37, '470', 0, 'thumb20141119165444186&marnimaryjane1.jpg', 1, '2014-11-19 16:49:05', NULL, 24, NULL),
(86, 1, 20, 37, '290', 0, 'thumb20141119170343778&marnisandals.jpg', 1, '2014-11-19 16:57:57', NULL, 19, NULL),
(87, 1, 1, 37, '385', 0, 'thumb20141119170640438&marninecklace1.jpg', 2, '2014-11-19 00:00:00', NULL, 16, NULL),
(88, 1, 1, 37, '385', 0, 'thumb20141119171712031&marninecklace2.jpg', 1, '2014-11-19 17:11:03', NULL, 16, NULL),
(89, 1, 1, 37, '380', 0, 'thumb20141119171820051&marninecklace3.jpg', 1, '2014-11-19 17:16:43', NULL, 25, NULL),
(90, 1, 1, 53, '130', 0, 'thumb20141120142951798&capbernstock2.jpg', 1, '2014-11-20 14:23:23', NULL, 9, NULL),
(91, 1, 1, 53, '130', 0, 'thumb20141120143357071&capbernstock6.jpg', 1, '2014-11-20 14:27:42', NULL, 9, NULL),
(92, 1, 1, 53, '130', 0, 'thumb20141122115607198&capbernstock8.jpg', 1, '2014-11-20 14:31:31', NULL, 9, NULL),
(93, 1, 1, 53, '130', 0, 'thumb20141120144217526&capbernstock9.jpg', 1, '2014-11-20 14:36:00', NULL, 1, NULL),
(94, 1, 1, 54, '350', 0, 'thumb20141120144339085&pdbrac.jpg', 1, '2014-11-20 14:42:30', NULL, 14, NULL),
(95, 1, 1, 54, '325', 0, 'thumb20141120145158723&pdbracel2.jpg', 1, '2014-11-20 14:45:31', NULL, 14, NULL),
(96, 1, 1, 55, '330', 0, 'thumb20141120145300937&peternon1.jpg', 2, '2014-11-20 00:00:00', NULL, 24, NULL),
(97, 1, 20, 55, '395', 0, 'thumb20141120145928835&peternonfur1.jpg', 1, '2014-11-20 14:57:05', NULL, 24, NULL),
(98, 1, 20, 55, '330', 0, 'thumb20141120150610887&peternon1.jpg', 1, '2014-11-20 15:00:59', NULL, 24, NULL),
(99, 1, 20, 42, '260', 0, 'thumb20141121162040246&premiatafur.jpg', 1, '2014-11-21 16:17:15', NULL, 26, NULL),
(100, 1, 22, 26, '325', 0, 'thumb20141121162500815&topcp.jpg', 1, '2014-11-21 16:23:58', NULL, 12, NULL),
(101, 1, 24, 29, '105', 0, 'thumb20141121163425150&edt_new_color_resize_eau_de_lierre.jpg', 1, '2014-11-21 16:39:54', NULL, 27, NULL),
(102, 1, 24, 29, '95', 0, 'thumb20141124163513532&edt_new_color_resize_oyedo_1.jpg', 1, '2014-11-21 16:45:36', NULL, 27, NULL),
(103, 1, 24, 29, '95', 0, 'thumb20141121165245855&edt_new_color_resize_eau_duelle.jpg', 1, '2014-11-21 16:53:33', NULL, 27, NULL),
(104, 1, 24, 29, '95', 0, 'thumb20141121170041558&edt_new_color_resize_philosykos.jpg', 1, '2014-11-21 16:57:42', NULL, 27, NULL),
(105, 1, 24, 29, '95', 0, 'thumb20141121170528474&do_son_resize.jpg', 1, '2014-11-21 17:02:51', NULL, 28, NULL),
(106, 1, 24, 29, '105', 0, 'thumb20141124163426294&lombre_dans_resize.jpg', 1, '2014-11-21 17:06:33', NULL, 28, NULL),
(107, 1, 24, 29, '105', 0, 'thumb20141124163650879&philosykos_resize.jpg', 1, '2014-11-21 17:09:27', NULL, 28, NULL),
(108, 1, 24, 29, '105', 0, 'thumb20141124163621826&volutesp75.jpg', 1, '2014-11-21 17:13:43', NULL, 28, NULL),
(109, 1, 24, 29, '95', 0, 'thumb20141121172056642&tamdao100v1.jpg', 1, '2014-11-21 17:16:49', NULL, 27, NULL),
(110, 1, 24, 29, '95', 0, 'thumb20141121172410657&vetyverio-flacon-dos.jpg', 1, '2014-11-21 17:19:37', NULL, 27, NULL),
(111, 1, 24, 29, '95', 0, 'thumb20141121172806029&volute100v1_1.jpg', 1, '2014-11-21 17:21:35', NULL, 27, NULL),
(112, 1, 25, 29, '45', 0, 'thumb20141121173136371&carousel_image_3.png', 1, '2014-11-21 17:39:17', NULL, 29, NULL),
(113, 1, 25, 29, '55', 0, 'thumb20141121174631564&carousel_image_1.png', 1, '2014-11-21 17:46:57', NULL, 29, NULL),
(114, 1, 25, 29, '67', 0, 'thumb20141121175425303&carousel_image_4.png', 1, '2014-11-21 17:52:53', NULL, 29, NULL),
(115, 1, 25, 29, '35', 0, 'thumb20141121180029414&carousel_image_9.png', 1, '2014-11-21 17:58:38', NULL, 29, NULL),
(116, 1, 25, 29, '35', 0, 'thumb20141121180613056&carsousel_image_8.png', 1, '2014-11-21 18:03:35', NULL, 29, NULL),
(124, 1, 18, 50, '120', 0, 'thumb20141122165608381&bagsdesign2.jpg', 1, '2014-11-22 16:57:16', NULL, 20, NULL),
(125, 1, 18, 50, '130', 0, 'thumb20141122170514127&designinverso1.jpg', 1, '2014-11-22 17:00:40', NULL, 20, NULL),
(132, 1, 25, 29, '60', 0, 'thumb20141124183151099&carousel_image_2.png', 1, '2014-11-24 18:25:23', NULL, 31, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `product_description`
--

DROP TABLE IF EXISTS `product_description`;
CREATE TABLE IF NOT EXISTS `product_description` (
  `idProduct` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`idLanguages`),
  KEY `fk_ProductDescription_Product1` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `product_description`
--

INSERT INTO `product_description` (`idProduct`, `idLanguages`, `txDescription`) VALUES
(27, 'en', 'METAL TRUNK BAG'),
(27, 'it', 'BORSA METAL TRUNK'),
(30, 'en', 'PVC MILANO BAG, FOLDOVER TOP WITH SNAP CLOSURE, A QUILTED LEATHER EFFECT, A CHAIN SHOULDER STRAP, GOLD-TONE HARDWARE AND AN INTERNAL LOGO STAMP'),
(30, 'it', 'PVC MILANO BORSA, EFFETTO PELLE TRAPUNTATA, CATENA A TRACOLLA, CHIUSURA A CALAMITA '),
(31, 'en', 'CREW NECK TUNIC IN COMPACT CADY CREPE'),
(31, 'it', 'TUNICA GIROCOLLO IN CREPE CADY COMPATTO '),
(33, 'en', 'FASHION SHOW''S DRESS IN RADZIMR, WITH '),
(33, 'it', 'ABITO GIROCOLLO DI SFILATA IN RADZIMR, CON STAMPA MAGNUS PLESSEN 2.'),
(34, 'en', 'CREW NECK DRESS IN BICOLOR BONDED JERSEY '),
(34, 'it', 'ABITO GIROCOLLO IN DOPPIO JERSEY BICOLORE '),
(35, 'en', 'CREW NECK SWEATSHIRT IN BONDED JERSEY, WITH "DRIPPING" DRAWING'),
(35, 'it', 'FELPA GIROCOLLO DI SFILATA IN JERSEY ACCOPPIATO, STAMPA '),
(36, 'en', 'FASHION SHOW''S COAT IN BONDED PLUSH ALPACA'),
(36, 'it', 'GIACCA DI SFILATA IN FELPA E ALPACA ACCOPPIATA '),
(37, 'en', 'FASHION SHOW''S SKIRT IN COTTON AND DOUBLE SILK, WITH "BRIGHT" STAMP'),
(37, 'it', 'GONNA DI  SFILATA IN COTONE E SETA DOUBLE CON STAMPA "BRIGHT"'),
(38, 'en', 'FASHION SHOW''S CREW NECK SWEATER IN JACQUARD CHECK'),
(38, 'it', 'MAGLIA GIROCOLLO DI SFILATA CON JACQUARD CHECK'),
(39, 'en', 'CREW NECK SHIRT WITH "BRIGHT" STAMP'),
(39, 'it', 'BLUSA GIROCOLLO CON STAMPA "BRIGHT" BLU'),
(40, 'en', 'SWEATSHIRT WITH TRUTH BEAUTY'),
(40, 'it', 'FELPA CON SCRITTA TRUTH BEAUTY'),
(41, 'en', 'DOUBLE BREASTED COAT IN WOOL WITH COYOTE''S NECK'),
(41, 'it', 'CAPPOTTO DOPPIO PETTO IN PANNO DI LANA CON COLLETTO DI COYOTE'),
(42, 'en', 'COAT WITH FLOWER FANTASY'),
(42, 'it', 'CAPPOTTO FANTASIA FIORI '),
(43, 'en', 'CREW NECK DRESS WITH JACQUARD LUREX ROSES'),
(43, 'it', 'ABITO GIROCOLLO BROCCATO LUREX ROSE JACQUARD'),
(44, 'en', 'BERMUDA SHORTS IN ECO NAPPA LEATHER PLISS'),
(44, 'it', 'BERMUDA IN ECO NAPPA PLISS'),
(45, 'en', 'DRESS WITH LATEX TOP AND COOL WOOL SKIRT'),
(45, 'it', 'ABITO CON TOP IN LATEX E GONNA IN FRESCO LANA'),
(46, 'en', 'SKIRT IN SILVER LAMINATED CANVAS'),
(46, 'it', 'GONNA A RUOTA IN TELA LAMINATA ARGENTO'),
(47, 'en', 'ALPACA WOOL COAT'),
(47, 'it', 'CAPPOTTO IN ALPACA GRIGIO'),
(48, 'en', 'GRAY STRIPS TROUSER IN CASHEMERE, LIN AND SILK'),
(48, 'it', 'PANTALONE A RIGHE GRIGIE IN CASHEMERE, LINO E SETA'),
(49, 'en', 'TROUSERS IN HIGH TWISTED WOOL'),
(49, 'it', 'PANTALONE IN GABARDINE STRETCH, MODELLO SOPRA LA CAVIGLIA.'),
(50, 'en', 'BERMUDA SHORTS IN WOOL AND SILK WITH FUR EFFECT'),
(50, 'it', 'BERMUDA IN LANA E SETA EFFETTO PELLICCIA'),
(51, 'en', 'CREW NECK SHIRT IN CHINA CREPE WITH WRITTEN PHRASES'),
(51, 'it', 'BLUSA GIROCOLLO IN CREPE DE CHINA CON STAMPA SCRITTE'),
(52, 'en', 'CREW NECK SWEATER WITH CHECK FANTASY'),
(52, 'it', 'MAGLIA GIROCOLLO CON FANTASIA CHECK SUL DAVANTI'),
(53, 'en', 'SWEATSHIRT WITH ROSES''S DRAWING'),
(53, 'it', 'FELPA CON STAMPA ROSE GRAFFIATE'),
(54, 'en', '3/4 LENGTH WIDE PANTS IN ECO LEATHER'),
(54, 'it', 'PANTALONE 3/4 LARGO IN ECO PELLE'),
(55, 'en', 'QUILTED OVER TEEN TOP'),
(55, 'it', 'TOP OVER TRAPUNTATO '),
(56, 'en', 'NET OVER DRESS'),
(56, 'it', 'TOP LUNGO A RETE '),
(57, 'en', 'DRESS COPPER COLORED WITH A BLACK BOW'),
(57, 'it', 'ABITO RAME CON FIOCCO NERO SUL DAVANTI'),
(58, 'en', 'STRIPES DRESS BLUE/BLACK IN STRETCH WOOL'),
(58, 'it', 'ABITO A RIGHE BLU/BLACK IN LANA STRETCH'),
(59, 'en', 'STRIPES SHIRT WITH PAILLETTES'),
(59, 'it', 'CAMICIA A RIGHE CON APPLICAZIONI'),
(60, 'en', 'STRIPES SHIRT WITH PAILLETTES'),
(60, 'it', 'CAMICIA A RIGHE CON APPLICAZIONI'),
(61, 'en', 'BLU AND GOLDEN STRIPES SKIRT ABOVE THE KNEE.'),
(61, 'it', 'GONNA SOPRA IL GINOCCHIO A RIGHE BLU E ORO.'),
(62, 'en', 'SHIRT WITH PUFFBALL ON THE SHOULDER'),
(62, 'it', 'CAMICIA CON SPALLE A SBUFFO DI TAFFETTÀ'),
(63, 'en', 'RING IN SILVER PLATED PINK GOLD.'),
(63, 'it', 'ANELLO IN ARGENTO PLACCATO ORO ROSA.'),
(64, 'en', 'FULL FINGER RING MOON TEXTURE.'),
(64, 'it', 'ANELLO COPRIDITO SUPERFICIE LUNARE.'),
(65, 'en', 'NECKLACE WITH ANATOMIC SILVER HEART WITH GOLD PLATING.'),
(65, 'it', 'COLLANA CON CUORE ANATOMICO IN ARGENTO PLACCATO ORO.'),
(66, 'en', 'NECKLACE WITH MOON STONE'),
(66, 'it', 'COLLANA CON PIETRA DI LUNA'),
(67, 'en', 'BRACELET/RING SILVER PLATED PINK GOLDEN'),
(67, 'it', 'BRACCIALE ANELLO ARGENTO PLACCATO ORO ROSA'),
(68, 'en', 'BALLS NECKLACE IN FUMÉ RESIN'),
(68, 'it', 'COLLANA A PALLE IN RESINA FUMÉ'),
(69, 'en', 'EMBROIDED NECKLACE WITH GLASS BEAD'),
(69, 'it', 'COLLANA RICAMATA CON PERLINE DI VETRO'),
(70, 'en', 'NECKLACE WITH A BIG RESIN FUMÉ PEARL '),
(70, 'it', 'COLLANA MILLE FILI CON PERLA IN RESINA ROSSO FUMÉ'),
(71, 'en', 'NECKLACE WITH PEARLS'),
(71, 'it', 'COLLANA MILLE FILI CON PERLE '),
(72, 'en', 'SILVER EARINGS AND TAFFETA ROSES'),
(72, 'it', 'ORECCHINI IN ARGENTO E ROSA IN TAFFETÀ'),
(73, 'en', 'NECKLACE WITH A HEART "THE HEART HAS REASONS, THAT REASON CANNOT KNOW".'),
(73, 'it', 'COLLANA CON UN CUORE " THE HEART HAS REASONS, THAT REASON CANNOT KNOW".'),
(74, 'en', 'OSTRICH BAG WITH MAGNETIC CLOSURE'),
(74, 'it', 'BORSA IN STRUZZO CON CHIUSURA A CALAMITA'),
(75, 'en', 'SMALL PATCHWORK BAG'),
(75, 'it', 'BORSA DI PICCOLA DIMENSIONE PATCHWORK'),
(76, 'en', 'PATCHWORK SHOPPING BAG'),
(76, 'it', 'SHOPPING BAG PATCHWORK'),
(77, 'en', 'PVC " BRIGHT" SHOPPING BAG.'),
(77, 'it', 'SHOPPING BAG STAMPA "BRIGHT".'),
(78, 'en', 'KATE RSTV PIERCED SATIN AND MIRRORED CALF, MULTICOLOR BASE RASBERRY.'),
(78, 'it', 'KATE RSVT RASO TRAFORATO E VITELLO SPECCHIATO MULTICOLOR CON BASE RASBERRY.'),
(79, 'en', 'PETIT FAYE NA NOLA IN NAPPA LEATHER, WITH HORN DETAILS '),
(79, 'it', 'PETIT FAYE NA NOLA DI NAPPA LASERATA E DETTAGLI IN CORNO'),
(80, 'en', 'FAYE NA PIWA IN NAPPA LEATHER AND CHAMOIS IN MULTICOLOR BASE BLACK'),
(80, 'it', 'FAYE NA PIWA IN NAPPA E CAMOSCIO IN MULTICOLOR CON BASE NERO'),
(81, 'en', 'FASHION SHOW PLUMES POCHETTE, CORY BAG IN FELT.'),
(81, 'it', 'POCHETTE DI PIUME DI SFILATA, CORY BAG IN FELTRO OSSEDIANA.'),
(82, 'en', 'LEATHER LACE-UP SHOE WITH SILVER TIP AND CREPE.'),
(82, 'it', 'SCARPA STRINGATA DI PELLE LUCIDA CON PUNTA ARGENTO E SUOLA DI PARA'),
(83, 'en', 'FASHION SHOW CALF ANKLEBOOT BORDAUX WITH BLACK TIP, GOLDEN ZIP AND 5 CM HEEL.'),
(83, 'it', 'TRONCHETTO DI SFILATA BORDAUX CON PUNTA NERA IN VITELLO, ZIP IN METALLO DORATO E TACCO 5 CM'),
(84, 'en', 'FASHION SHOW LACE-UP SHOES IN DOMESTICATED CALF. REMOVABLE FLAP WITH GOLDEN PLATE.'),
(84, 'it', 'ALLACCIATA DI SFILATA IN VITELLO SPAZZOLATO. LINGUETTA STACCABILE CON PLACCA DI METALLO DORATO.'),
(85, 'en', 'MARYJANE IN DOMASTICATED CALF WITH 7 CM HEEL.'),
(85, 'it', 'MARYJANE IN VITELLO SPAZZOLATO CON TACCO DI 7 CM.'),
(86, 'en', 'CALFSKIN CRISS-CROSS SANDALS WITH SQUARE AND ROUND CABOCHON AND LEATHER SOLE.'),
(86, 'it', 'SANDALO IN CAVALLINO INCROCIATO IMPREZIOSITO CON APPLICAZIONI CABOCHON E FONDO CUOIO.'),
(87, 'en', 'FASHION SHOW NECKLACE IN RESIN WITH LENGTH-ADJUSTABLE LEATHER STRING.'),
(87, 'it', 'COLLANA DI SFILATA IN RESINA CON LACCIO REGOLABILE DI CUOIO.'),
(88, 'en', 'FASHION SHOW NECKLACE IN RESIN WITH LENGTH-ADJUSTABLE LEATHER STRING.'),
(88, 'it', 'COLLANA DI SFILATA IN RESINA CON LACCIO REGOLABILE DI CUOIO.'),
(89, 'en', 'HORN NECKLACE WITH TECHNIC RIBBON.'),
(89, 'it', 'COLLANA DI CORNO CON NASTRO TECNICO.'),
(90, 'en', 'WOOL HAT WITH OSTRICH''S PLUMES'),
(90, 'it', 'CAPPELLO DI LANA CON PIUME DI STRUZZO DAVANTI'),
(91, 'en', 'WOOL HAT WITH PIN-PON AND VEIL'),
(91, 'it', 'CAPPELLO DI LANA CON PON-PON E VELETTA'),
(92, 'en', 'WOOL STRIPES HAT WITH PON-PON AND VEIL'),
(92, 'it', 'CAPPELLO DI LANA A RIGHE CON PON PON E VELETTA'),
(93, 'en', 'PEAKED CAP WITH WOOL RABBIT EARS'),
(93, 'it', 'CAPPELLO CON VISIERA E ORECCHIE DA CONIGLIO IN LANA'),
(94, 'en', 'GOLD BRACELET WITH PIECE OF CHINESE PORCELAIN.'),
(94, 'it', 'BRACCIALE D''ORO E DI PORCELLANA CINESE.'),
(95, 'en', 'GOLD BRACELET WITH PIECE OF PORCELAIN PLATE.'),
(95, 'it', 'BRACCIALE D''ORO E DI FRAMMENTI DI PIATTI DI PORCELLANA. '),
(96, 'en', 'CRIS CROS LEATHER WEDGE SHOES WITH CHAMOIS TIP'),
(96, 'it', 'ZEPPA INCROCIATA DI PELLE CON PUNTA IN CAMOSCIO'),
(97, 'en', 'LACE-UP SHOES WITH SHEEPSKIN INSIDE'),
(97, 'it', 'SCARPA STRINGATA CON PELLICCIA DI MONTONE INTERNA'),
(98, 'en', 'CRIS CROS LEATHER WEDGE SHOES WITH CHAMOIS TIP'),
(98, 'it', 'ZEPPA INCROCIATA DI PELLE CON PUNTA IN CAMOSCIO'),
(99, 'en', 'ECO-FUR WEDGE SHOES SNEAKER '),
(99, 'it', 'SNEAKER IN ECO-PELLICCIA CON LA ZEPPA'),
(100, 'en', 'MOHAIR TOP'),
(100, 'it', 'GILET DI PELLICCIA MOHAIR'),
(101, 'en', 'EAU DE LIERRE (EDT 100). EAU DE TOILETTE BASED ON LEAFS OF IVY WITH NOTES OF CYCLAMEN, GREEN PEPPER, AMBER AND DEPTHS OF ROSEWOOD. '),
(101, 'it', 'EAU DE LIERRE (EDT 100). EAU DE TOILETTE CON PREVALENZA DI FOGLIE D''EDERA, ACCOMPAGNATA A NOTE DI CICLAMINO, GERANIO, PEPE VERDE, AMBRA, LEGNO DI PALISSANDRO E MUSCHIO.'),
(102, 'en', 'OYEDO (EDT 100). EAU DE TOILETTE BASED ON LEMON, GREEN MANDARIN, TANGY ORANGE, TAMARIND, GRAPEFRUIT AND THYME.'),
(102, 'it', 'OYEDO (EDT 100). EAU DE TOILETTE A BASE DI POMPELMO, MANDARINO VERDE, ARANCIO DELLA FLORIDA, LIMONE ITALIANO, TAMARINDO, TIMO E CEDRO'),
(103, 'en', 'EAU DUELLE (EDT 100). EAU DE TOILETTE BASED ON VANILLA COMBINED WITH JUNIPER BERRIES, BLACK TEA, CARDAMOM AND VETIVER.'),
(103, 'it', 'EAU DUELLE (EDT 100). EAU DE TOILETTE CON PREVALENZA DI VANIGLIA ACCOMPAGNATA DA NOTE DI BACCHE DI GINEPRO, BACCHE DI ROSA, CARDAMOMO, THÈ NERO, VETIVER.'),
(104, 'en', 'PHILOSYKOS (EDT 100). EAU DE TOILETTE BASED ON FIG LEAVES AND WOOD, WHITE CEDAR.'),
(104, 'it', 'PHILOSYKOS (EDT 100). EAU DE TOILETTE A BASE DI FOGLIE DI FICO, LEGNO DI FICO E CEDRO BIANCO.'),
(105, 'en', 'DO SON (EDT 75). EAU DE PERFUM BASED ON TUBEROSE, ORANGE LEAVES, PINK PEPPERCORN, MUSK.'),
(105, 'it', 'DO SON (EDT 75). EAU DE PERFUM A BASE DI FOGLIE D''ARANCIO, TUBEROSA, PEPE ROSA, MUSCHIO.'),
(106, 'en', 'L''OMBRE DANS L''EAU (EDT 75). EAU DE PERFUM BASED ON BLACKCURRANT LEAVES E BULGARIAN ROSES. '),
(106, 'it', 'L''OMBRE DANS L''EAU (EDT 75). EAU DE PERFUM A BSA DI FOGLIE DI RIBES NERO E ROSA BULGARA.'),
(107, 'en', 'PHILOSYKOS (EDT 75). EAU DE PARFUM FIG LEAVES AND WOOD, WHITE CEDAR.'),
(107, 'it', 'PHILOSYKOS (EDT 75). EAU DE PARFUM A BASE DI FOGLIE DI FICO, LEGNO DI FICO E CEDRO BIANCO.'),
(108, 'en', 'VOLUTES (EDT 75). EAU DE PARFUM BASED ON SPICES, TOBACCO, HONEY, IRIS E STYRAX.'),
(108, 'it', 'VOLUTES (EDT 75). EAU DE PARFUM A BASE DI SPEZIE, TABACCO, MIELE E IRIS.'),
(109, 'en', 'TAM DAO (EDT 100). EAU DE TOILETTE BASED ON SANDALWOOD, ROSEWOOD, CYPRESS E AMBERGRIS.'),
(109, 'it', 'TAM DAO (EDT 100). EAU DE TOILETTE A BASE DI LEGNO DI SANDALO, PALISSANDRO, CIPRESSO E AMBRA GRIGIA.'),
(110, 'en', 'VETYVERIO (EDT 100). EAU DE TOILETTE BASED ON VETIVER'),
(110, 'it', 'VETYVERIO (EDT 100). EAU DE TOILETTE A BASE DI VETIVERIO.'),
(111, 'en', 'VOLUTES (EDT 100). EAU DE TOILETTE BASED ON SPICES, TOBACCO, HONEY, IRIS E STYRAX.'),
(111, 'it', 'VOLUTES (EDT 100). EAU DE TOILETTE A BASE DI SPEZIE, TABACCO, MIELE E IRIS.'),
(112, 'en', 'LAIT FRAIS. THIS FRESH LOTION FOR THE BODY MAKES SOFTENS SKIN FOR THE PROPERTY OF ORANGE FLOWERS AND THE ALMOND OIL. '),
(112, 'it', 'LAIT FRAIS. QUESTO LATTE FRESCO PER IL CORPO LASCIA LA PELLE MORBIDA E LENITA GRAZIE ALLE PROPRIETÀ DEI FIORI D''ARANCIA E DELL''OLIO DI MANDORLA.'),
(113, 'en', 'POMMADE EXFOLIANTE. RICH AND REGENERANT SMOOTHING BODY POLISH FOR THE BODY FOR EMOLLIENT POMEGRANATE OIL.'),
(113, 'it', 'POMMADE EXFOLIANTE. CREMA ESFOLIANTE PER IL CORPO RICCA, CREMOSA E RIGENERANTE GRAZIE ALL''OLIO DI MELOGRANO CHE RENDE LA PELLE ELASTICA E SETOSA.'),
(114, 'en', 'CRÉME RICHE. RICH BUTTER FOR THE BODY MAKES DRY AND SENSITIVE SKIN WITH THE DELICIOUS FRAGRANCE OF A BYZANTINE ROSE.'),
(114, 'it', 'CRÉME RICHE. CREMA RICCA PER IL CORPO  CHE LASCIA LA PELLE LUMINOSA E DELICATAMENTE PROFUMATA GRAZIE ALL''ACQUA DI ROSE CHE RINFRESCA, IDRATA E LENISCE.'),
(115, 'en', 'BAUME GENÉREUX. THIS HAND CREAM REVITALIZES THE SKIN FOR THE KARITÉ BUTTER, THE ARGAN OIL AND THE APRICOT OIL.'),
(115, 'it', 'BAUME GENÉREUX. QUESTA CREMA MANI RIVITALIZZA LA PELLE GRAZIE AL BURRO DI KARITÉ, ALL''OLIO DI ARGAN E ALL''OLIO DI NOCCIOLO DI ALBICOCCA.'),
(116, 'en', 'EMULTION VELUORS POUR LES MAINS. THIS SILKY HAND LOTION MADE FROM THE EVERLASTING "GOLDEN FLOWER" WITH REGENERATING, REPAIRING, MOISTURIZING AND ANTI-OXIDANT PROPERTIES'),
(116, 'it', 'EMULTION VELUORS POUR LES MAINS. QUESTA EMULSIONE MANI LE AVVOLGE IN UN VELO LEGGERO E VELLUTATO E IN PIÙ L''ACQUA FLOREALE DI SEMPREVIVO LE RIPARA E PROTEGGE.'),
(124, 'en', 'PVC MILANO BAG, FOLDOVER TOP WITH SNAP CLOSURE, A QUILTED LEATHER EFFECT, A CHAIN SHOULDER STRAP, GOLD-TONE HARDWARE AND AN INTERNAL LOGO STAMP'),
(124, 'it', 'PVC BORSA MILANO, EFFETTO PELLE TRAPUNTATA, CATENA A TRACOLLA, CHIUSURA A CALAMITA '),
(125, 'en', 'PVC MILANO BAG, FOLDOVER TOP WITH SNAP CLOSURE, A QUILTED LEATHER EFFECT, A CHAIN SHOULDER STRAP, GOLD-TONE HARDWARE AND AN INTERNAL LOGO STAMP'),
(125, 'it', 'PVC BORSA MILANO, EFFETTO PELLE TRAPUNTATA, CATENA A TRACOLLA, CHIUSURA A CALAMITA '),
(132, 'en', 'REVITALIZING SHOWER GEL FOR BODY AND HAIR. THIS GEL COMBINES BERGAMOT SCENT WITH THE FLORAL SCENT OF PEPPERMINT AND WITH EXTRACT OF ALMOND.'),
(132, 'it', 'GEL LAVANT REVIGORANT. GEL PER IL CORPO E I CAPELLI A BASE DI BERGAMOTTO, FOGLIE DI MENTA ED ESTRATTI DI MANDORLA');

-- --------------------------------------------------------

--
-- Struttura della tabella `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `idProduct` int(11) NOT NULL,
  `pgImage` int(11) NOT NULL,
  `txImageUrl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProduct`,`pgImage`),
  KEY `fk_ProductImage_Product1_idx` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `product_image`
--

INSERT INTO `product_image` (`idProduct`, `pgImage`, `txImageUrl`) VALUES
(27, 1, '20141027161832764&45239055TE_13P_a.jpg'),
(27, 2, '20141027161832712&45239055TE_13P_F.jpg'),
(27, 3, '20141027161832718&45239055TE_13P_e.jpg'),
(27, 4, '20141027161832744&45239055TE_13P_d.jpg'),
(30, 1, '20141110145915895&IMG_5244.JPG'),
(30, 3, '20141110152118223&IMG_5246.jpg'),
(31, 2, '20141122200715312&20141117145236567marnidress.jpg'),
(33, 1, '20141117150330714&marnidress2.jpg'),
(34, 1, '20141117150649764&marnidress3.jpg'),
(35, 1, '20141117151037361&marnifelpa1.jpg'),
(36, 1, '20141117151402445&marnigiacca.jpg'),
(37, 1, '20141117151903324&marniskirt1.jpg'),
(37, 2, '20141127125558413&IMG_1571.jpg'),
(38, 1, '20141117152242340&marnisweater.jpg'),
(39, 1, '20141117152618174&marnitop1.jpg'),
(40, 1, '20141117152935991&msgm4.jpg'),
(41, 1, '20141117153225513&msgmcoat1.jpg'),
(42, 1, '20141117153632036&msgmcoat2.jpg'),
(43, 1, '20141117154100230&msgmdress1.jpg'),
(44, 1, '20141117154358571&msgmshorts1.jpg'),
(45, 1, '20141117154652304&msgmdress3.jpg'),
(46, 1, '20141117154924381&msgmskirt2.jpg'),
(47, 1, '20141117155305066&cappottodusan.jpg'),
(48, 1, '20141117155623037&pantdusan1.jpg'),
(49, 1, '20141117155809616&pantmarni1.jpg'),
(50, 1, '20141117160407739&pantsmsgm1.jpg'),
(51, 1, '20141117160852870&topmsgm.jpg'),
(52, 1, '20141117161232874&topmsgm1.jpg'),
(53, 1, '20141117161654164&topmsgm3.jpg'),
(54, 1, '20141117162021276&pantcalderara.jpg'),
(55, 1, '20141117162511277&topcalderara.jpg'),
(56, 1, '20141117162732943&topcalderara3.jpg'),
(57, 1, '20141118161838432&abitocc.jpg'),
(58, 1, '20141118162243596&abitoccc.jpg'),
(59, 1, '20141118162937070&camicacc.jpg'),
(60, 1, '20141118163232366&camiciacc.jpg'),
(61, 1, '20141118163346493&gonnacc.jpg'),
(62, 1, '20141118163723090&calderaratop.jpg'),
(63, 1, '20141118170740089&anbjorg1.jpg'),
(63, 2, '20141118170754060&anbjorg2.jpg'),
(64, 1, '20141118170858601&annellobjorg.jpg'),
(65, 1, 'collanaheartbjorg.jpg'),
(65, 2, '20141122115854400&collanaheartbjorg.jpg'),
(66, 1, '20141119135625261&bjorgneck1.jpg'),
(67, 1, '20141119135905749&bjorgringbracelet.jpg'),
(68, 1, '20141119140237932&calderaranecklace1.jpg'),
(69, 1, '20141119140628953&calderaranecklace3.jpg'),
(70, 1, '20141119140944080&calderaranecklace2.jpg'),
(71, 1, '20141119141205598&calderaranecklace5.jpg'),
(72, 1, '20141119141432529&orrechinicalderara.jpg'),
(73, 1, '20141119141945710&heartbjorgnecklace.jpg'),
(74, 1, '20141119145037054&jaminbag1.jpg'),
(75, 1, '20141119145647130&jaminbag2.jpg'),
(76, 1, '20141119150901584&jaminbig2.jpg'),
(77, 1, '20141119151056744&marnibag.jpg'),
(78, 1, '20141119151650739&paula3.jpg'),
(79, 1, '20141119152416360&paulapink.jpg'),
(80, 1, '20141119152906558&cademartori2.jpg'),
(81, 1, '20141119153653554&marnipochette.jpg'),
(82, 1, '20141119155500168&aranthsilver.jpg'),
(83, 1, '20141119155745902&marniboots1.jpg'),
(83, 2, '20141119160540919&marniboots2.jpg'),
(84, 1, '20141119165156903&marniborde1.jpg'),
(85, 1, '20141119165444186&marnimaryjane1.jpg'),
(85, 2, '20141119165533740&marnimaryjane2.jpg'),
(86, 1, '20141119170343778&marnisandals.jpg'),
(87, 1, '20141119170640438&marninecklace1.jpg'),
(88, 1, '20141119171712031&marninecklace2.jpg'),
(89, 1, '20141119171820051&marninecklace3.jpg'),
(90, 1, '20141120142951798&capbernstock2.jpg'),
(91, 1, '20141120143357071&capbernstock6.jpg'),
(92, 2, '20141122115607198&capbernstock8.jpg'),
(93, 1, '20141120144217526&capbernstock9.jpg'),
(94, 1, '20141120144339085&pdbrac.jpg'),
(95, 1, '20141120145158723&pdbracel2.jpg'),
(96, 1, '20141120145300937&peternon1.jpg'),
(97, 1, '20141120145928835&peternonfur1.jpg'),
(97, 2, '20141120150305623&peternonfront.jpg'),
(98, 1, '20141120150610887&peternon1.jpg'),
(98, 2, '20141120150630095&peternon2.jpg'),
(98, 3, '20141120150655777&peternon3.jpg'),
(99, 1, '20141121162040246&premiatafur.jpg'),
(100, 1, '20141121162500815&topcp.jpg'),
(101, 1, '20141121163425150&edt_new_color_resize_eau_de_lierre.jpg'),
(102, 1, '20141124163513532&edt_new_color_resize_oyedo_1.jpg'),
(103, 1, '20141121165245855&edt_new_color_resize_eau_duelle.jpg'),
(104, 1, '20141121170041558&edt_new_color_resize_philosykos.jpg'),
(105, 1, '20141121170528474&do_son_resize.jpg'),
(106, 1, '20141124163426294&lombre_dans_resize.jpg'),
(107, 1, '20141124163650879&philosykos_resize.jpg'),
(108, 1, '20141124163621826&volutesp75.jpg'),
(109, 1, '20141121172056642&tamdao100v1.jpg'),
(110, 1, '20141121172410657&vetyverio-flacon-dos.jpg'),
(111, 1, '20141121172806029&volute100v1_1.jpg'),
(112, 1, '20141121173136371&carousel_image_3.png'),
(113, 1, '20141121174631564&carousel_image_1.png'),
(114, 1, '20141121175425303&carousel_image_4.png'),
(115, 1, '20141121180029414&carousel_image_9.png'),
(116, 1, '20141121180613056&carsousel_image_8.png'),
(124, 1, '20141122165608381&bagsdesign2.jpg'),
(125, 1, '20141122170514127&designinverso1.jpg'),
(132, 1, '20141124183151099&carousel_image_2.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `product_state`
--

DROP TABLE IF EXISTS `product_state`;
CREATE TABLE IF NOT EXISTS `product_state` (
  `idProductState` int(11) NOT NULL,
  `txProductState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProductState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `product_state`
--

INSERT INTO `product_state` (`idProductState`, `txProductState`) VALUES
(0, 'INSERITO'),
(1, 'PUBBLICATO'),
(2, 'CANCELLATO');

-- --------------------------------------------------------

--
-- Struttura della tabella `refound_articles`
--

DROP TABLE IF EXISTS `refound_articles`;
CREATE TABLE IF NOT EXISTS `refound_articles` (
  `idRefound` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  `pgArticle` int(11) NOT NULL,
  `qtArticle` int(11) NOT NULL,
  `fgChangeRefound` char(1) DEFAULT NULL,
  `txChangeRefound` varchar(250) DEFAULT NULL,
  `pgArticleNew` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRefound`,`idProdotto`,`pgArticle`),
  KEY `fk_OrdersArticles_Article1_idx` (`idProdotto`,`pgArticle`),
  KEY `fk_Refound_Articles_Order_Refound1_idx` (`idRefound`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
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

--
-- Dump dei dati per la tabella `shops`
--

INSERT INTO `shops` (`idShop`, `txShop`, `txMail`, `txNome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`) VALUES
(1, 'Siena', 'jacopo.frediani@banca.mps.it', 'Mag Boutique', 'Via dei Termini, 49', 'Siena', 53100, 'SI', 'Italia', '+39 0577 41043');

-- --------------------------------------------------------

--
-- Struttura della tabella `site_images`
--

DROP TABLE IF EXISTS `site_images`;
CREATE TABLE IF NOT EXISTS `site_images` (
  `txGroupImages` varchar(45) NOT NULL,
  `pgGroupImages` int(11) NOT NULL,
  `txName` varchar(100) DEFAULT NULL,
  `idGender` int(11) DEFAULT NULL,
  `urlRedirect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`txGroupImages`,`pgGroupImages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `site_images`
--

INSERT INTO `site_images` (`txGroupImages`, `pgGroupImages`, `txName`, `idGender`, `urlRedirect`) VALUES
('carousel', 1, 'DSC_1336.JPG', NULL, NULL),
('carousel', 2, 'DSC_1486 copia.jpg', NULL, NULL),
('carousel', 3, 'DSC_1393.JPG', NULL, NULL),
('carousel', 4, 'DSC_1524.JPG', NULL, NULL),
('carousel', 5, 'DSC_1345.JPG', NULL, NULL),
('carousel', 6, 'DSC_1477 copia.jpg', NULL, NULL),
('carousel', 7, 'DSC_1537.JPG', NULL, NULL),
('carousel', 8, 'DSC_1670.JPG', NULL, NULL),
('carousel', 9, 'DSC_1599 copia 2.jpg', NULL, NULL),
('carousel', 10, 'DSC_1568.JPG', NULL, NULL),
('carousel', 11, 'DSC_1618 copia.jpg', NULL, NULL),
('carousel', 12, 'DSC_1653.JPG', NULL, NULL),
('carousel', 13, 'DSC_1739.JPG', NULL, NULL),
('carousel', 14, 'DSC_1741.JPG', NULL, NULL),
('carousel', 15, 'DSC_1770.JPG', NULL, NULL),
('carousel', 16, 'DSC_1766.JPG', NULL, NULL),
('carousel', 17, 'DSC_1838.JPG', NULL, NULL),
('carousel', 18, 'DSC_1908.JPG', NULL, NULL),
('carousel', 19, 'DSC_2000.JPG', NULL, NULL),
('carousel', 20, 'DSC_2003.JPG', NULL, NULL),
('carousel', 21, 'DSC_1962.JPG', NULL, NULL),
('carousel', 22, 'DSC_1998.JPG', NULL, NULL),
('new', 1, 'new.png', NULL, NULL),
('newArrivals', 1, '22112014185308903&Set 2.jpg', 1, '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
('newArrivals', 2, '22112014185328289&tumblr_nfaoele6AC1rvje7uo1_1280.jpg', 1, '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
('promo', 1, 'promo.png', NULL, NULL),
('tabNav', 1, 'logoTab2.png', 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `idSize` int(11) NOT NULL,
  `txSize` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `size`
--

INSERT INTO `size` (`idSize`, `txSize`) VALUES
(1, '34'),
(2, '36'),
(3, '38'),
(4, '40'),
(5, '42'),
(6, '44'),
(7, '46'),
(8, '48'),
(9, '50'),
(10, '52'),
(11, '54'),
(12, '56'),
(13, '58'),
(14, '60'),
(15, 'XXS'),
(16, 'XS'),
(17, 'S'),
(18, 'M'),
(19, 'L'),
(20, 'XL'),
(21, 'XXL'),
(22, 'U'),
(24, '35'),
(26, '37'),
(28, '39'),
(30, '41'),
(32, '43'),
(34, '45'),
(36, '47'),
(37, '24'),
(38, '25'),
(39, '26'),
(40, '27'),
(41, '28'),
(42, '29'),
(43, '30'),
(44, '31'),
(45, '32'),
(46, '33'),
(47, '36 1/2'),
(48, '37 1/2'),
(49, '38 1/2'),
(50, '39 1/2');

-- --------------------------------------------------------

--
-- Struttura della tabella `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `idStato` int(11) NOT NULL,
  `txStato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idStato`),
  UNIQUE KEY `idStato_UNIQUE` (`idStato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `states`
--

INSERT INTO `states` (`idStato`, `txStato`) VALUES
(1, 'INSERITO'),
(2, 'CANCELEDREVERSAL'),
(3, 'COMPLETED'),
(4, 'DENIED'),
(5, 'EXPIRED'),
(6, 'FAILED'),
(7, 'INPROGRESS'),
(8, 'PARTIALLYREFUNDED'),
(9, 'PENDING'),
(10, 'REFUNDED'),
(11, 'REVERSED'),
(12, 'PROCESSED'),
(13, 'VOIDED'),
(14, 'COMPLETEDFUNDSHELD'),
(15, 'SPEDITO'),
(100, 'REQUEST REFOUND'),
(101, 'REFOUND COMPLETED'),
(102, 'REFOUND REFUSED'),
(103, 'REFOUND CANCELED'),
(200, 'REQUEST CHANGE'),
(201, 'CHANGE COMPLETED'),
(202, 'CHANGE REFUSED'),
(203, 'CHANGE CANCELED');

-- --------------------------------------------------------

--
-- Struttura della tabella `states_orders`
--

DROP TABLE IF EXISTS `states_orders`;
CREATE TABLE IF NOT EXISTS `states_orders` (
  `idOrder` int(11) NOT NULL,
  `idStato` int(11) NOT NULL,
  `dtStato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txNote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idOrder`,`idStato`),
  KEY `fk_StatesOrders_States1_idx` (`idStato`),
  KEY `fk_StatesOrders_Orders1_idx` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `states_refound`
--

DROP TABLE IF EXISTS `states_refound`;
CREATE TABLE IF NOT EXISTS `states_refound` (
  `idRefound` int(11) NOT NULL,
  `idStato` int(11) NOT NULL,
  `dtStato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txNote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idRefound`,`idStato`),
  KEY `fk_StatesOrders_States1_idx` (`idStato`),
  KEY `fk_States_Orders_copy1_Order_Refound1_idx` (`idRefound`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `idType` int(11) NOT NULL,
  `idLanguages` varchar(2) NOT NULL,
  `txType` varchar(200) NOT NULL,
  PRIMARY KEY (`idType`,`idLanguages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `type`
--

INSERT INTO `type` (`idType`, `idLanguages`, `txType`) VALUES
(1, 'en', 'ACCESSORIES'),
(1, 'it', 'ACCESSORI'),
(3, 'en', 'SHIRTS'),
(3, 'it', 'CAMICIE'),
(4, 'en', 'COATS'),
(4, 'it', 'CAPPOTTI'),
(5, 'en', 'DRESSES'),
(5, 'it', 'ABITI'),
(7, 'en', 'SWEATSHIRTS'),
(7, 'it', 'FELPE'),
(8, 'en', 'JACKETS'),
(8, 'it', 'GIACCHE'),
(9, 'en', 'LEATHER JACKETS'),
(9, 'it', 'GIACCHE DI PELLE'),
(11, 'en', 'CASUAL JACKETS'),
(11, 'it', 'GIUBBOTTI'),
(12, 'en', 'SKIRTS'),
(12, 'it', 'GONNE'),
(15, 'en', 'KNITWEAR'),
(15, 'it', 'MAGLIE'),
(16, 'en', 'PANTS'),
(16, 'it', 'PANTALONI'),
(17, 'en', 'CARDIGAN'),
(17, 'it', 'CARDIGAN'),
(18, 'en', 'BAGS'),
(18, 'it', 'BORSE'),
(19, 'en', 'TOPS'),
(19, 'it', 'CANOTTE'),
(20, 'en', 'SHOES'),
(20, 'it', 'SCARPE'),
(21, 'en', 'T-SHIRTS'),
(21, 'it', 'T-SHIRTS'),
(22, 'en', 'TOP'),
(22, 'it', 'TOP'),
(23, 'en', 'BIJOUX'),
(23, 'it', 'BIJOUX'),
(24, 'en', 'PERFUME'),
(24, 'it', 'PROFUMI'),
(25, 'en', 'BODY CARE'),
(25, 'it', 'LINEA CORPO');

-- --------------------------------------------------------

--
-- Struttura della tabella `type_state_account`
--

DROP TABLE IF EXISTS `type_state_account`;
CREATE TABLE IF NOT EXISTS `type_state_account` (
  `idTypeState` int(11) NOT NULL,
  `txTypeState` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTypeState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `type_state_account`
--

INSERT INTO `type_state_account` (`idTypeState`, `txTypeState`) VALUES
(1, 'DISATTIVATO'),
(2, 'ATTIVATO'),
(3, 'CESSATO'),
(4, 'RESET_PSW');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_Addresses_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_Article_Color1` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Article_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Article_Shops1` FOREIGN KEY (`idShop`) REFERENCES `shops` (`idShop`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Article_Size1` FOREIGN KEY (`idSize`) REFERENCES `size` (`idSize`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `fk_Coupons_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Customer_Type_State_Account1` FOREIGN KEY (`idTypeState`) REFERENCES `type_state_account` (`idTypeState`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `customer_roles`
--
ALTER TABLE `customer_roles`
  ADD CONSTRAINT `fk_CustomerRoles_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `delivery_nazioni`
--
ALTER TABLE `delivery_nazioni`
  ADD CONSTRAINT `fk_delivery_nazioni_delivery_cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_delivery_nazioni_nazioni1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`idNazione`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `fidelity_customer`
--
ALTER TABLE `fidelity_customer`
  ADD CONSTRAINT `fk_fidelity_customer_customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fidelity_customer_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_Orders_Addresses1` FOREIGN KEY (`idAddressFat`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_Addresses2` FOREIGN KEY (`idAddressSpe`) REFERENCES `addresses` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_coupons1` FOREIGN KEY (`idCoupon`) REFERENCES `coupons` (`idCoupon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orders_Delivery_Cost1` FOREIGN KEY (`idDeliveryCost`) REFERENCES `delivery_cost` (`idDeliveryCost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_FidelityCards1` FOREIGN KEY (`idFidelity`) REFERENCES `fidelitycards` (`idFidelity`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `orders_articles`
--
ALTER TABLE `orders_articles`
  ADD CONSTRAINT `fk_OrdersArticles_Article1` FOREIGN KEY (`idProdotto`, `pgArticle`) REFERENCES `article` (`idProduct`, `pgArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_OrdersArticles_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `order_refound`
--
ALTER TABLE `order_refound`
  ADD CONSTRAINT `fk_Order_Refound_Customer1` FOREIGN KEY (`idUser`) REFERENCES `customer` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_Refound_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_Product_Brand1` FOREIGN KEY (`idBrand`) REFERENCES `brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Campaigns1` FOREIGN KEY (`idCampaign`) REFERENCES `campaigns` (`idCampaign`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Gender1` FOREIGN KEY (`idGender`) REFERENCES `gender` (`idGender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Material1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Product_State1` FOREIGN KEY (`idProductState`) REFERENCES `product_state` (`idProductState`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Type1` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `product_description`
--
ALTER TABLE `product_description`
  ADD CONSTRAINT `fk_ProductDescription_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_ProductImage_Product1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `refound_articles`
--
ALTER TABLE `refound_articles`
  ADD CONSTRAINT `fk_OrdersArticles_Article10` FOREIGN KEY (`idProdotto`, `pgArticle`) REFERENCES `article` (`idProduct`, `pgArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Refound_Articles_Order_Refound1` FOREIGN KEY (`idRefound`) REFERENCES `order_refound` (`idRefound`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `states_orders`
--
ALTER TABLE `states_orders`
  ADD CONSTRAINT `fk_StatesOrders_Orders1` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_StatesOrders_States1` FOREIGN KEY (`idStato`) REFERENCES `states` (`idStato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `states_refound`
--
ALTER TABLE `states_refound`
  ADD CONSTRAINT `fk_StatesOrders_States10` FOREIGN KEY (`idStato`) REFERENCES `states` (`idStato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_States_Orders_copy1_Order_Refound1` FOREIGN KEY (`idRefound`) REFERENCES `order_refound` (`idRefound`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
