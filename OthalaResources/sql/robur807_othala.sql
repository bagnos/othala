/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : robur807_othala

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-03-05 15:13:39
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
) ENGINE=InnoDB AUTO_INCREMENT=10103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('1', 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', '53100', 'SI', 'ITALIA', '3392113342', '0', 'casa');
INSERT INTO `addresses` VALUES ('3', 'ile.tama@hotmail.it', 'roberto', 'boccini', 'via pirro maria gabrielli 3/b', 'siena', '53100', 'si', 'ITALIA', '3398424101', '0', 'casa');
INSERT INTO `addresses` VALUES ('4', 'ile.tama@hotmail.it', 'ileana', 'tamagnone', 'via pirro maria gabrielli 3/b', 'siena', '53100', 'si', 'ITALIA', '3313867390', '1', 'casa');
INSERT INTO `addresses` VALUES ('5', 'ile.tama@hotmail.it', 'roberto', 'boccini', 'via pirro maria gabrielli 3/b', 'siena', '53100', 'si', 'ITALIA', '3398424101', '1', 'casa');
INSERT INTO `addresses` VALUES ('6', 'ile.tama@hotmail.it', 'ileana', 'tamagnone', 'via pirro maria gabrielli 3/b', 'siena', '53100', 'si', 'ITALIA', '3398424101', '0', 'casa');
INSERT INTO `addresses` VALUES ('7', 'ffabianelli@alice.it', 'Fausto', 'Fabianelli', 'Strada degli Agostoli, 6', 'Siena', '53100', 'si', 'ITALIA', '3477756834', '0', 'Casa');
INSERT INTO `addresses` VALUES ('8', 'fiogigli@alice.it', 'fiorella', 'gigli', 'loc. suzzara 27', 'civitella paganico', '58045', 'gr', 'ITALIA', '3319649681', '0', 'casa');
INSERT INTO `addresses` VALUES ('9', 'niccoanfo@libero.it', 'Niccolo', 'Anfosso', 'Via di mezzo 22', 'Ortovero ', '17037', 'Sv ', 'ITALIA', '3888225722', '0', 'Casa ');
INSERT INTO `addresses` VALUES ('10', 'iandreaf94@gmail.com', 'Andrea', 'Fretta', 'Via Smeraldi 1', 'Basilicanova', '43022', 'PR', 'ITALIA', '3343735084', '1', 'casa');
INSERT INTO `addresses` VALUES ('11', 'verdy_b@libero.it', 'Gianpaolo', 'Berti', 'via pastrengo 2', 'colle di val d\'elsa', '53034', 'si', 'ITALIA', '3286769969', '0', 'casa');
INSERT INTO `addresses` VALUES ('12', 'verdy_b@libero.it', 'Gianpaolo', 'Berti', 'via pastrengo 2', 'colle di val d\'elsa', '53034', 'si', 'ITALIA', '3286769969', '0', 'casa');
INSERT INTO `addresses` VALUES ('13', 'dtoppini@live.it', 'Donatella', 'Toppini', 'via soccorso saloni 72', 'Montalcino', '53024', 'SI', 'ITALIA', '3472934213', '0', 'Casa');
INSERT INTO `addresses` VALUES ('14', 'giannibonomo@hotmail.it', 'gianni', 'bonomo', 'corso matteotti 118', 'cecina', '57023', 'li', 'ITALIA', '3703069640', '0', 'c/o banca etruria');
INSERT INTO `addresses` VALUES ('15', 'redhotman@hotmail.it', 'Simone', 'Rossi', 'via Val d\'Aosta 20', 'Monteriggioni', '53035', 'SI', 'ITALIA', '3383203180', '0', 'Casa');
INSERT INTO `addresses` VALUES ('16', 'f.samori@gmail.com', 'Federico', 'Samorì', 'vle m.f nobiliore 151 sc.h int 13', 'roma', '175', 'RM', 'ITALIA', '3336344701', '0', 'casa');
INSERT INTO `addresses` VALUES ('17', 'aliotfran@gmail.com', 'Fortunata', 'Provvedi', 'Barone Ricasoli SpA, Loc. Madonna a Brolio', 'Gaiole in Chianti', '53013', 'SI', 'ITALIA', '3389766856', '0', 'Lavoro');
INSERT INTO `addresses` VALUES ('18', 'aliotfran@gmail.com', 'Francesco', 'Alioto', 'Vicolo delle Ginestre 9', 'Sovicille', '53018', 'SI', 'ITALIA', '3356141595', '0', 'Casa');
INSERT INTO `addresses` VALUES ('19', 'sandro.adriana@libero.it', 'graziella', 'fabbri\\bianciardi', 'via della galluzza 35', 'siena', '53100', 'si', 'ITALIA', '0577270602', '0', 'casa');
INSERT INTO `addresses` VALUES ('20', 'giuseppe@studiofancelli.it', 'giuseppe', 'fancelli', 'piazza la lizza 7', 'siena', '53100', 'si', 'ITALIA', '0577285474', '1', 'lavoro');
INSERT INTO `addresses` VALUES ('21', 'ag71si@gmail.com', 'ANDREA', 'GRANAI', 'VIALE MAZZINI 76', 'SIENA', '53100', 'SI', 'ITALIA', '3386237027', '0', 'SIGNOR');
INSERT INTO `addresses` VALUES ('22', 'e.cortonesi@libero.it', 'emiliano', 'cortonesi', 'via annio 13', 'viterbo', '1100', 'vt', 'ITALIA', '3933380001', '0', 'casa');
INSERT INTO `addresses` VALUES ('23', 'vannini@iltributarista.it', 'Carlo', 'Vannini c/o Studio Sampieri', 'Via Toscana 48', 'Monteriggioni', '53035', 'si', 'ITALIA', '337234340', '0', 'Studio Sampieri ');
INSERT INTO `addresses` VALUES ('24', 'pantalonesimona@libero.it', 'Bar Marconi di Pantalone Remo', 'Pantalone', 'V.le G. Marconi, 327', 'Pescara', '65126', 'PE', 'ITALIA', '3474704091', '1', 'Lavoro');
INSERT INTO `addresses` VALUES ('25', 'pantalonesimona@libero.it', 'Bar Marconi di Pantalone Remo', 'Pantalone', 'V.le G. Marconi, 327', 'Pescara', '65126', 'PE', 'ITALIA', '3474704091', '0', 'Lavoro');
INSERT INTO `addresses` VALUES ('26', 'marco.lorenzini87@gmail.com', 'Marco', 'Lorenzini', 'via Giacomo Puccini, 1', 'Siena', '53100', 'SI', 'ITALIA', '3282518847', '0', 'Casa');
INSERT INTO `addresses` VALUES ('27', 'mimmo.liberati@gmail.com', 'emiliano', 'liberati', 'Strada Cassia Sud, 236', 'siena', '53100', 'Sien', 'ITALIA', '3934039284', '0', 'casa');
INSERT INTO `addresses` VALUES ('28', 'jacopo.valenti@hotmail.com', 'Jacopo', 'Valenti', 'Via Simone Martini 89', 'Siena', '53100', 'SI', 'ITALIA', '3276973335', '0', 'casa');
INSERT INTO `addresses` VALUES ('29', 'giuseppe@studiofancelli.it', 'giuseppe', 'fancelli', 'piazza la lizza 7', 'siena', '53100', 'si', 'ITALIA', '0577285474', '1', 'lavoro');
INSERT INTO `addresses` VALUES ('30', 'giuseppe@studiofancelli.it', 'giuseppe', 'fancelli', 'piazza la lizza 7', 'siena', '53100', 'si', 'ITALIA', '3495366102', '0', 'lavoro');
INSERT INTO `addresses` VALUES ('31', 'irenovanta@hotmail.it', 'Irene', 'Marzocchi', 'Via A. Baccarini Crescenzi 19', 'Siena', '53100', 'Sien', 'ITALIA', '3391151787', '0', 'Casa');
INSERT INTO `addresses` VALUES ('32', 'manuelagiomi@hotmail.it', 'MINERVO', 'SCLAVI', 'VIA BOCCACCIO 5', 'SIENA', '53100', 'SI', 'ITALIA', '0577594355', '0', 'SMALL');
INSERT INTO `addresses` VALUES ('33', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '1', 'Corriere');
INSERT INTO `addresses` VALUES ('34', 'alemonti93@gmail.com', 'Alessandro ', 'Monti ', 'via Tommaso pendola 31', 'Siena ', '53100', 'Si', 'ITALIA', '3393383265', '0', 'Casa');
INSERT INTO `addresses` VALUES ('35', 'giacomopetricci1994@gmail.com', 'giacomo', 'petricci', 'via orazio marchi 5 ', 'colle val d\'elsa ', '53034', 'si', 'ITALIA', '3409083854', '0', 'casa');
INSERT INTO `addresses` VALUES ('36', 'vavellis@hotmail.it', 'Vincenzo', 'Avellis', 'Viale Marco Polo 19A', 'Colle di val d\'Elsa', '53034', 'SI', 'ITALIA', '3278812374', '0', 'Casa');
INSERT INTO `addresses` VALUES ('37', 'vavellis@hotmail.it', 'Vittorio', 'Avellis', 'Via Renaldini 4', 'Taverne d\'Arbia ', '53010', 'SI', 'ITALIA', '0577366069', '0', 'Casa');
INSERT INTO `addresses` VALUES ('38', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('39', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('40', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('41', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('42', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('43', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '1', 'Casa');
INSERT INTO `addresses` VALUES ('44', 'marco.santucci68@gmail.com', 'Marco ', 'Santucci', 'Via della Balduina n. 250', 'Roma ', '136', 'Roma', 'ITALIA', '3496493297', '0', 'Casa');
INSERT INTO `addresses` VALUES ('45', 'vit@vitella.it', 'Gabriele', 'Vitella', 'Via Renato Simoni 12', 'Roma', '157', 'RM', 'ITALIA', '3934386200', '0', 'Casa');
INSERT INTO `addresses` VALUES ('46', 'tiapave91@hotmail.it', 'mattia', 'pavesi', 'via don baroni 3', 'carugate', '20061', 'mi', 'ITALIA', '3356387499', '0', 'casa');
INSERT INTO `addresses` VALUES ('9992', 'shop@robursienashop.it', null, null, null, 'Siena', '53100', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9993', 'shop@robursienashop.it', null, null, null, 'Monteriggioni (Montarioso)', '53035', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9994', 'shop@robursienashop.it', null, null, null, 'Monteroni d\'Arbia (Ponte a Tressa)', '53014', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9995', 'shop@robursienashop.it', null, null, null, 'Sovicille (San Rocco)', '53018', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9996', 'shop@robursienashop.it', null, null, null, 'Monteriggioni (Belverde)', '53035', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9997', 'shop@robursienashop.it', null, null, null, 'Castelnuovo Berardenga (Casetta)', '53019', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9998', 'shop@robursienashop.it', null, null, null, 'Asciano (Arbia)', '53041', 'SI', 'ITALIA', null, '0', '');
INSERT INTO `addresses` VALUES ('9999', 'shop@robursienashop.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', '');
INSERT INTO `addresses` VALUES ('10003', 'm.brogiotti@gmail.com', 'Marco', 'Brogiotti', 'via dei Cellari, 1', 'Cellore d\'Illasi', '37031', 'VR', 'ITALIA', '3356371073', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10004', 'm.brogiotti@gmail.com', 'Marco', 'Brogiotti', 'via dei pittori, 11', 'Valeggio sul Mincio', '37067', 'VR', 'ITALIA', '3356371073', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10005', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '1', 'Corriere');
INSERT INTO `addresses` VALUES ('10006', 'r.fontani@yahoo.it', 'Riccardo', 'Fontani', 'Strada dei Tufi 3', 'Siena', '53100', 'SI', 'ITALIA', '3384315126', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10007', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'SiSi', 'ITALIA', '3407606744', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10008', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'SiSi', 'ITALIA', '3407606744', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10009', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10010', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10011', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10012', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34a', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10013', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10014', 'susy.viligiardi@hotmail.it', 'Susanna', 'Viligiardi', 'via Corsignano 34 a', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10016', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '1', 'Corriere');
INSERT INTO `addresses` VALUES ('10017', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '0', 'Abitazione');
INSERT INTO `addresses` VALUES ('10018', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '1', 'Abitazione');
INSERT INTO `addresses` VALUES ('10019', 'luca.pepi@enel.com', 'luca', 'pepi', 'via salvatore scoca 14', 'roma', '139', 'rm', 'ITALIA', '3298646713', '1', 'ritiro presso corriere');
INSERT INTO `addresses` VALUES ('10020', 'emi.giu@libero.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10021', 'emi.giu@libero.it', 'Pinco', 'Pallo', 'Via quella o quellaltra', 'Siena', '53100', 'Si', 'ITALIA', '1234567890', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10022', 'luca.pepi@enel.com', 'luca', 'pepi', 'via salvatore scoca 14', 'roma', '139', 'rm', 'ITALIA', '3298646713', '0', 'ritiro presso corriere');
INSERT INTO `addresses` VALUES ('10023', 'shop@robursienashop.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10024', 'ilaria.ianiri@enel.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10025', 'ilaria.ianiri@enel.com', 'Ilaria', 'Ianiri', 'via salvatore scoca 14', 'roma', '139', 'rm', 'ITALIA', '3333918204', '0', 'casa');
INSERT INTO `addresses` VALUES ('10026', 'simone.bagnolesi@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10027', 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aretina 89', 'siena', '53100', 'si', 'ITALIA', '3332965518', '0', 'casa');
INSERT INTO `addresses` VALUES ('10028', 'vittorio.bari.siena@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10029', 'vittorio.bari.siena@gmail.com', 'vittorio', 'bari', 'via aldo moro 23', 'rapolano terme', '53040', 'si', 'ITALIA', '0577724341', '1', 'casa');
INSERT INTO `addresses` VALUES ('10030', 'Viapiccolomini121@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10031', 'Viapiccolomini121@gmail.com', 'Marco', 'Cheli', 'Via e.s.piccolomini 121', 'Siena', '53100', 'Si', 'ITALIA', '3932579456', '0', 'Lavoro');
INSERT INTO `addresses` VALUES ('10032', 'susy.viligiardi@hotmail.it', 'susanna', 'viligiardi', 'via corsignano 34 a', 'Siena', '53100', 'SI', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10033', 'susy.viligiardi@hotmail.it', 'susanna', 'viligiardi', 'via Corsignano 34 a', 'castelnuovo berardenga ', '53019', 'si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10034', 'elena.valentini3@libero.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10035', 'elena.valentini3@libero.it', 'Elena ', 'Valentini ', 'strada dei fuochi, 43', 'siena', '53100', 'SI', 'ITALIA', '3339580180', '0', 'casa');
INSERT INTO `addresses` VALUES ('10036', 'giulianatalini23@gmail.com', 'Maurizio', 'Natalini', 'Località Piatto Lavato sns - Buriano', 'Castiglione della Pescaia', '58043', 'GR', 'ITALIA', '3406976508', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10037', 'giulianatalini23@gmail.com', 'Maurizio', 'Natalini', 'Località Piatto Lavato sns - Buriano', 'Castiglione della Pescaia', '58043', 'GR', 'ITALIA', '3406976508', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10038', 'giulianatalini23@gmail.com', 'Maurizio', 'Natalini', 'Località Piatto Lavato snc - Buriano', 'Castiglione della Pescaia', '58043', 'GR', 'ITALIA', '3406976508', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10039', 'giulianatalini23@gmail.com', 'Maurizio', 'Natalini', 'Località Piatto Lavato snc - Buriano', 'Castiglione della Pescaia', '58043', 'GR', 'ITALIA', '3406976508', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10040', 'Mauro.Viligiardi@libero.it', 'Mauro', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'SI', 'ITALIA', '3339032536', '0', 'Abitazione');
INSERT INTO `addresses` VALUES ('10041', 'sorre29@yahoo.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '1', 'sede');
INSERT INTO `addresses` VALUES ('10042', 'sorre29@yahoo.com', 'Lorenzo', 'Sorresina', 'Via Dina Ferri, 6', 'Chiusdino', '53012', 'SI', 'ITALIA', '+393383183802', '0', 'Abitazione');
INSERT INTO `addresses` VALUES ('10043', 'giangiobanana@hotmail.it', 'francesco', 'romei', 'via pm gabrielli 92', 'siena', '53100', 'si', 'ITALIA', '3381941513', '1', 'casa');
INSERT INTO `addresses` VALUES ('10044', 'sorre29@yahoo.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10045', 'giangiobanana@hotmail.it', 'francesco', 'romei', 'via pm gabrielli 92', 'siena', '53100', 'si', 'ITALIA', '3381941513', '0', 'casa');
INSERT INTO `addresses` VALUES ('10046', 'domenico.ginese@hotmail.com', 'Susanna', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10047', 'domenico.ginese@hotmail.com', 'Susanna', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10048', 'domenico.ginese@hotmail.com', 'Domenico', 'Ginese', 'Via del Grappolo 28', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3470687150', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10049', 'domenico.ginese@hotmail.com', 'Domenico', 'Ginese', 'Via del Grappolo 28', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3470687150', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10050', 'shop@robursienashop.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10051', 'domeginge@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10052', 'domeginge@gmail.com', 'Susanna', 'Viligiardi', 'Via Corsignano 34/A', 'Castelnuovo Berardenga', '53019', 'Si', 'ITALIA', '3407606744', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10053', 'vittorio.bari.siena@gmail.com', 'vittorio', 'bari', 'via aldo moro 23', 'rapolano terme', '53040', 'si', 'ITALIA', '0577724341', '0', 'casa');
INSERT INTO `addresses` VALUES ('10054', 'niccolo1971@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10055', 'niccolo1971@gmail.com', 'riccardo', 'niccolucci', 'via dell\'artigianato ,1', 'siena', '53100', 'sien', 'ITALIA', '3317317825', '0', 'lavoro');
INSERT INTO `addresses` VALUES ('10056', 'mrosi53@ymail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10057', 'mrosi53@ymail.com', 'Marco', 'Rosi', 'm.k. gandhi 2/B', 'Pianella', '53019', 'Si', 'ITALIA', '345/8868869', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10058', 'iandreaf94@gmail.com', 'Andrea', 'Fretta', 'Via Smeraldi 1', 'Basilicanova', '43022', 'PR', 'ITALIA', '3343735084', '1', 'casa');
INSERT INTO `addresses` VALUES ('10059', 'iandreaf94@gmail.com', 'Andrea', 'Fretta', 'Via Smeraldi 1', 'Basilicanova', '43022', 'PR', 'ITALIA', '3343735084', '0', 'casa');
INSERT INTO `addresses` VALUES ('10060', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10061', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10062', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10063', 'agnelli.federico@gmail.com', 'Federico', 'Agnelli', 'Piazza San Giovanni 11', 'Siena', '53100', 'SI', 'ITALIA', '3404073840', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10064', 'agnelli.federico@gmail.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10065', 'agnelli.federico@gmail.com', 'Federico', 'Agnelli', 'Piazza San Giovanni 11', 'Siena', '53100', 'SI', 'ITALIA', '3404073840', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10066', 'chiara.pace1@libero.it', 'chiara', 'pace', 'strada dei fuochi 45', 'Siena', '53100', 'si', 'ITALIA', '3482534626', '0', 'casa');
INSERT INTO `addresses` VALUES ('10067', 'ciavrom@gmail.com', 'Romolo', 'Ciavarella ', 'Via Duccio di Boninsegna 68', 'Siena', '53100', 'SI', 'ITALIA', '3333533139', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10068', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10069', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10070', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10071', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10072', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10073', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10074', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10075', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10076', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10077', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10078', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10079', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10080', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10081', 'marco.cianfanelli@virgilio.it', 'Marco', 'Cianfanelli ', 'Via Cipressetti, 44', 'Ariccia ', '40', 'Roma', 'ITALIA', '3388907278', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10082', 'marco.cianfanelli@virgilio.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10083', 'marco.cianfanelli@virgilio.it', 'Alfredo', 'VESPIA', 'Piazza della Repubblica, 1', 'Olgiate Molgora', '23887', 'Lc', 'ITALIA', '3388907278', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10084', 'marco.cianfanelli@virgilio.it', 'Alfredo', 'Vespia', 'piazza della Repubblica, 1', 'Olgiate Molgora', '23887', 'LC', 'ITALIA', '3388907278', '0', 'Casa');
INSERT INTO `addresses` VALUES ('10085', 'amanghino@gmail.com', 'alessandro', 'manganelli', 'via R.Franci 2/4 presso bar Angolo delle Dolcezze', 'Siena', '53100', 'SI', 'ITALIA', '3289025665', '0', 'lavoro');
INSERT INTO `addresses` VALUES ('10086', 'Mauro.Viligiardi@libero.it', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10087', 'riccardo.tordini@gmail.com', 'Paolo', 'Bardelli', 'via Sant\'Agata n 36', 'Siena', '53100', 'si', 'ITALIA', '3383290934', '0', 'COFFEE BREAK');
INSERT INTO `addresses` VALUES ('10088', 'riccardo.tordini@gmail.com', 'Riccardo', 'Tordini', 'via di Castelvecchio 6', 'Siena', '53100', 'si', 'ITALIA', '3458244958', '1', 'Casa');
INSERT INTO `addresses` VALUES ('10089', 'riccardo.tordini@gmail.com', 'Paolo', 'Bardelli', 'via Sant\'Agata 36', 'Siena', '53100', 'si', 'ITALIA', '3383290934', '0', 'Coffee break');
INSERT INTO `addresses` VALUES ('10090', 'davilla.cateni@novartis.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10091', 'davilla.cateni@novartis.com', 'davilla', 'cateni', 'via della fornace vecchia 16', 'siena', '53100', 'si', 'ITALIA', '3475324352', '0', 'abitazione');
INSERT INTO `addresses` VALUES ('10092', 'sandromartelli2@virgilio.it', 'SANDRO', 'MARTELLI', 'c/o MPSLF SPA - VIA A.MORO 11/13 STANZA 46', 'SIENA', '53100', 'SI', 'ITALIA', '3496123910', '0', 'ufficio');
INSERT INTO `addresses` VALUES ('10093', 'sandromartelli2@virgilio.it', 'SANDRO', 'MARTELLI', 'VIA S.LAVAGNINI, 291 - FRAZ. PONTE D\'ARBIA', 'MONTERONI D\'ARBIA ', '53014', 'SI', 'ITALIA', '3496123910', '0', 'ABITAZIONE');
INSERT INTO `addresses` VALUES ('10094', 'sandromartelli2@virgilio.it', 'SANDRO', 'MARTELLI', 'c/o MPSLF SPA - VIA A.MORO 11/13 STANZA 46', 'SIENA', '53100', 'SI', 'ITALIA', '3496123910', '0', 'ufficio');
INSERT INTO `addresses` VALUES ('10095', 'sandromartelli2@virgilio.it', 'SANDRO', 'MARTELLI', 'VIA S.LAVAGNINI, 291 - FRAZ. PONTE D\'ARBIA', 'MONTERONI D\'ARBIA ', '53014', 'SI', 'ITALIA', '3496123910', '0', 'ABITAZIONE');
INSERT INTO `addresses` VALUES ('10096', 'GABRIELE.RIGATTI@MPS.IT', 'gabriele', 'rigatti', 'via nazareno orlandi 24', 'siena', '530100', 'si', 'ITALIA', '0577595365', '1', 'abitazione');
INSERT INTO `addresses` VALUES ('10097', 'GABRIELE.RIGATTI@MPS.IT', 'gabriele', 'rigatti', 'via nazareno orlandi 24', 'siena', '530100', 'si', 'ITALIA', '0577595365', '0', 'abitazione');
INSERT INTO `addresses` VALUES ('10098', 'GABRIELE.RIGATTI@MPS.IT', 'gabriele', 'rigatti', 'via nazareno orlandi 24', 'Siena', '53100', 'SI', 'ITALIA', '0577595365', '0', 'abitazione');
INSERT INTO `addresses` VALUES ('10099', 'pietrobernardi@piccolominisiena.it', 'pietro', 'bernardi', 'via sallustio bandini 9', 'siena', '53100', 'Si', 'ITALIA', '3409124045', '0', 'casa');
INSERT INTO `addresses` VALUES ('10100', 'pietrobernardi@piccolominisiena.it', 'pietro', 'bernardi', 'via sallustio bandini 9', 'siena', '53100', 'si', 'ITALIA', '3409124045', '0', 'casa');
INSERT INTO `addresses` VALUES ('10101', 'jegriffiths@deloitte.com', 'Corriere', 'PIU\' POSTE', 'Via Garibaldi, 31 / 33', 'Siena', '53100', 'SI', 'ITALIA', '0577057619', '0', 'sede');
INSERT INTO `addresses` VALUES ('10102', 'jegriffiths@deloitte.com', 'Jeff', 'Griffiths', 'NH Hotel - Piazza la Lizza', 'Siena', '53100', 'SI', 'ITALIA', '3129275617', '0', 'Hotel');

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
INSERT INTO `article` VALUES ('141', '1', '30', '5', '599', 'thumb20150129155955749&_DSC0608.jpg', '1', '1', '7.00', null, '0');
INSERT INTO `article` VALUES ('142', '1', '24', '3', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('142', '2', '25', '3', '41', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('142', '3', '23', '3', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('142', '4', '26', '3', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('142', '5', '27', '3', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('142', '6', '28', '3', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2', '50.00', null, '0');
INSERT INTO `article` VALUES ('143', '1', '22', '3', '13', 'thumb20150129161833536&_DSC0612.jpg', '1', '3', '32.00', null, '0');
INSERT INTO `article` VALUES ('143', '2', '20', '3', '0', 'thumb20150129161833536&_DSC0612.jpg', '1', '3', '32.00', null, '0');
INSERT INTO `article` VALUES ('143', '3', '21', '3', '14', 'thumb20150129161833536&_DSC0612.jpg', '1', '3', '32.00', null, '0');
INSERT INTO `article` VALUES ('144', '1', '30', '5', '137', 'thumb20150129153839092&_DSC0597.jpg', '1', '4', '15.00', null, '0');
INSERT INTO `article` VALUES ('145', '1', '30', '5', '145', 'thumb20150129154736038&_DSC0600.jpg', '1', '6', '12.00', null, '0');
INSERT INTO `article` VALUES ('146', '1', '24', '1', '18', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('146', '2', '25', '1', '44', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('146', '3', '23', '1', '9', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('146', '4', '26', '1', '17', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('146', '5', '27', '1', '7', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('146', '6', '28', '1', '3', 'thumb20150129162037747&_DSC0595.jpg', '1', '7', '15.00', null, '0');
INSERT INTO `article` VALUES ('147', '1', '23', '1', '8', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('147', '2', '24', '1', '18', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('147', '3', '25', '1', '43', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('147', '4', '26', '1', '13', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('147', '5', '27', '1', '7', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('147', '6', '28', '1', '3', 'thumb20150129160248386&_DSC0593.jpg', '1', '8', '35.00', null, '0');
INSERT INTO `article` VALUES ('148', '1', '25', '2', '0', 'thumb20141215223649926&420103_mrp_fr_m2.jpg', '1', '12345678', '1.00', null, '0');
INSERT INTO `article` VALUES ('149', '1', '30', '5', '48', 'thumb20150129155342900&_DSC0604.jpg', '1', '10', '10.00', null, '0');

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
INSERT INTO `brand` VALUES ('20', 'Robur Siena', null, null, null, null);

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
INSERT INTO `color` VALUES ('1', 'en', 'BLACK');
INSERT INTO `color` VALUES ('1', 'it', 'NERO');
INSERT INTO `color` VALUES ('2', 'en', 'WHITE');
INSERT INTO `color` VALUES ('2', 'it', 'BIANCO');
INSERT INTO `color` VALUES ('3', 'en', 'WHITE / BLACK');
INSERT INTO `color` VALUES ('3', 'it', 'BIANCO / NERO');
INSERT INTO `color` VALUES ('4', 'en', 'RED');
INSERT INTO `color` VALUES ('4', 'it', 'ROSSO');
INSERT INTO `color` VALUES ('5', 'en', 'N/A');
INSERT INTO `color` VALUES ('5', 'it', 'N/A');

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
INSERT INTO `configuration` VALUES ('1', 'Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo', '0');

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
INSERT INTO `customer` VALUES ('a.pacciani@alice.it', 'lorenzo', 'andrea', 'pacciani', null, '2');
INSERT INTO `customer` VALUES ('a.palazzi59@gmail.com', 'Catering20', 'alessandro', 'palazzi', null, '2');
INSERT INTO `customer` VALUES ('ag71si@gmail.com', '04031971', 'ANDREA', 'GRANAI', null, '2');
INSERT INTO `customer` VALUES ('agnelli.federico@gmail.com', 'agnelfe1', 'Federico', 'Agnelli', null, '2');
INSERT INTO `customer` VALUES ('alemonti93@gmail.com', 'pippolone', 'Alessandro ', 'Monti ', null, '2');
INSERT INTO `customer` VALUES ('aliotfran@gmail.com', 'muvian76', 'Francesco', 'Alioto', null, '2');
INSERT INTO `customer` VALUES ('amanghino@gmail.com', 'fransesca', 'alessandro', 'manganelli', null, '2');
INSERT INTO `customer` VALUES ('andrea.iacopini82@gmail.com', 'ich28zzz', 'Andrea', 'Iacopini', null, '2');
INSERT INTO `customer` VALUES ('andreas.mara@gmail.com', 'stormwind1', 'Andreas', 'Maggi', null, '2');
INSERT INTO `customer` VALUES ('andrew@edition.com.hk', 'koobayah', 'Andrew', 'Sams', null, '2');
INSERT INTO `customer` VALUES ('baby61bb@gmail.com', 'Federico', 'Barbara', 'Bianciardi', null, '2');
INSERT INTO `customer` VALUES ('cedipiu@yahoo.it', 'bocajunior', 'alexi', 'serpani', null, '2');
INSERT INTO `customer` VALUES ('chiara.pace1@libero.it', 'montone90', 'chiara', 'pace', null, '2');
INSERT INTO `customer` VALUES ('ciavrom@gmail.com', 'nan140200n', 'Romolo', 'Ciavarella ', null, '2');
INSERT INTO `customer` VALUES ('corsfil75@live.it', 'riccardo41', 'filippo', 'corsini', null, '2');
INSERT INTO `customer` VALUES ('davilla.cateni@novartis.com', 'Ludovico70', 'davilla', 'cateni', null, '2');
INSERT INTO `customer` VALUES ('domeginge@gmail.com', 'felpasiena', 'Domenico', 'Ginese', null, '2');
INSERT INTO `customer` VALUES ('domenico.ginese@hotmail.com', 'felpamauro', 'Domenico', 'Ginese', null, '2');
INSERT INTO `customer` VALUES ('dtoppini@live.it', 'montalcino', 'Donatella ', 'Toppini', null, '2');
INSERT INTO `customer` VALUES ('e.cortonesi@libero.it', 'ferragosto', 'EMILIANO', 'CORTONESI', null, '2');
INSERT INTO `customer` VALUES ('e.sicignano@virgilio.it', '8922109', 'Enrico', 'Sicignano', null, '2');
INSERT INTO `customer` VALUES ('ele10697@gmail.com', 'Enricochie', 'eleonora', 'tozzi', null, '2');
INSERT INTO `customer` VALUES ('elena.valentini3@libero.it', 'lupoceco', 'elena', 'valentini', null, '2');
INSERT INTO `customer` VALUES ('emi.giu@libero.it', 'forzarobur', 'Pinco', 'Pallo', null, '2');
INSERT INTO `customer` VALUES ('f.samori@gmail.com', 'roburpepo1', 'Federico', 'Samorì', null, '2');
INSERT INTO `customer` VALUES ('fabiobalocchi@alice.it', 'Roburrone', 'Fabio', 'Balocchi', null, '2');
INSERT INTO `customer` VALUES ('ffabianelli@alice.it', 'vivajuve', 'Fausto', 'Fabianelli', null, '2');
INSERT INTO `customer` VALUES ('fiogigli@alice.it', 'rastrello', 'fiorella', 'gigli', null, '2');
INSERT INTO `customer` VALUES ('GABRIELE.RIGATTI@MPS.IT', 'ghebbe', 'GABRIELE', 'RIGATTI', null, '2');
INSERT INTO `customer` VALUES ('gfalciani@gmail.com', 'baobello45', 'Giovanni', 'Falciani', null, '2');
INSERT INTO `customer` VALUES ('giacomopetricci1994@gmail.com', 'forzarobur', 'giacomo', 'petricci', null, '2');
INSERT INTO `customer` VALUES ('giangiobanana@hotmail.it', 'tintisona', 'francesco', 'romei', null, '2');
INSERT INTO `customer` VALUES ('giannibonomo@hotmail.it', 'robur904', 'Gianni', 'Bonomo', null, '2');
INSERT INTO `customer` VALUES ('giulianatalini23@gmail.com', 'marco91', 'Marco', 'Del Grande', null, '2');
INSERT INTO `customer` VALUES ('giuseppe@studiofancelli.it', 'dade2007', 'giuseppe', 'fancelli', null, '2');
INSERT INTO `customer` VALUES ('iandreaf94@gmail.com', 'wrockmetal', 'Andrea', 'Fretta', null, '2');
INSERT INTO `customer` VALUES ('ilaria.ianiri@enel.com', 'ii919402', 'Ilaria', 'Ianiri', null, '2');
INSERT INTO `customer` VALUES ('ile.tama@hotmail.it', 'ileana85', 'ileana', 'tamagnone', null, '2');
INSERT INTO `customer` VALUES ('irenovanta@hotmail.it', 'yuriirene', 'Irene', 'Marzocchi', null, '2');
INSERT INTO `customer` VALUES ('irepist@yahoo.it', 'irenicco', '1', '1', null, '3');
INSERT INTO `customer` VALUES ('ittanisenomis@libero.it', 'mone1982', 'simone', 'sinatti', null, '2');
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com', 'benito', 'JACOPO', 'FREDIANI', null, '2');
INSERT INTO `customer` VALUES ('jacopo.valenti@hotmail.com', 'Sienaregna', 'Jacopo', 'Valenti', null, '2');
INSERT INTO `customer` VALUES ('jegriffiths@deloitte.com', 'Swank01&01', 'Jeff', 'Griffiths', null, '2');
INSERT INTO `customer` VALUES ('ladidderia@gmail.com', '02072010', 'Marco', 'Di Dio', null, '2');
INSERT INTO `customer` VALUES ('landino9@libero.it', 'paperone', 'emanuele', 'landi', null, '2');
INSERT INTO `customer` VALUES ('leonard.97@hotmail.it', 'briciola', 'Leonardo', 'Gallucci', null, '2');
INSERT INTO `customer` VALUES ('lorenzini_giulio@hotmail.com', 'banana', 'Giulio', 'Lorenzini', null, '2');
INSERT INTO `customer` VALUES ('luca.pepi@enel.com', 'pl919402', 'Luca', 'Pepi', null, '2');
INSERT INTO `customer` VALUES ('m.brogiotti@gmail.com', 'marcogaia', 'Marco', 'Brogiotti', null, '2');
INSERT INTO `customer` VALUES ('manuelagiomi@hotmail.it', 'ELEGUGLI1', 'MANUELA', 'GIOMI', null, '2');
INSERT INTO `customer` VALUES ('marco.cianfanelli@virgilio.it', 'mc12121966', 'Marco', 'Cianfanelli ', null, '2');
INSERT INTO `customer` VALUES ('marco.lorenzini87@gmail.com', '19robur04', 'marco', 'lorenzini', null, '2');
INSERT INTO `customer` VALUES ('marco.santucci68@gmail.com', 'xxyyzz', 'Marco', 'Santucci', null, '2');
INSERT INTO `customer` VALUES ('marco.vukosa@gmail.com', '2002giu08', 'Marco', 'Vukosa', null, '2');
INSERT INTO `customer` VALUES ('Mauro.Viligiardi@libero.it', 'Maviligi', 'Mauro', 'Viligiardi', null, '2');
INSERT INTO `customer` VALUES ('maxmasi@hotmail.it', 'mosca51', 'massimo', 'masi', null, '2');
INSERT INTO `customer` VALUES ('mimmo.liberati@gmail.com', 'cice2007', 'emiliano', 'liberati', null, '2');
INSERT INTO `customer` VALUES ('mrosi53@ymail.com', 'romola', 'Marco', 'Rosi', null, '2');
INSERT INTO `customer` VALUES ('niccoanfo@libero.it', 'Mauro55', 'Niccolo ', 'Anfosso', null, '2');
INSERT INTO `customer` VALUES ('niccolo1971@gmail.com', 'guido2007', 'Riccardo', 'Niccolucci', null, '2');
INSERT INTO `customer` VALUES ('pantalonesimona@libero.it', 'norvegia', 'simona', 'pantalone', null, '2');
INSERT INTO `customer` VALUES ('pietrobernardi@piccolominisiena.it', 'oragallura', 'pietro', 'bernardi', null, '2');
INSERT INTO `customer` VALUES ('p_swierblewski@o2.pl', 'forzasiena', 'Patryk', '?wierblewski', null, '2');
INSERT INTO `customer` VALUES ('r.fontani@yahoo.it', 'fr1809fr', 'Riccardo', 'Fontani', null, '2');
INSERT INTO `customer` VALUES ('redhotman@hotmail.it', 'roburshop', 'Simone', 'Rossi', null, '2');
INSERT INTO `customer` VALUES ('riccardo.tordini@gmail.com', 'riccardo', 'Riccardo', 'Tordini', null, '2');
INSERT INTO `customer` VALUES ('roger@gamelosers.net', 'zelda1', 'Roger', 'Burton', null, '2');
INSERT INTO `customer` VALUES ('sandro.adriana@libero.it', 'cipocipo', 'alessandro', 'bianciardi', null, '2');
INSERT INTO `customer` VALUES ('sandromartelli2@virgilio.it', 'ponte2009', 'SANDRO', 'MARTELLI', null, '2');
INSERT INTO `customer` VALUES ('senesedoc@gmail.com', 'battiecorr', 'Francesco', 'Giusti', null, '2');
INSERT INTO `customer` VALUES ('shop@robursienashop.it', 'shop@robur', 'A', 'A', 'A', '1');
INSERT INTO `customer` VALUES ('simone.bagnolesi@gmail.com', 'didone1976', 'simone', 'bagnolesi', null, '2');
INSERT INTO `customer` VALUES ('sorre29@yahoo.com', 'Sorrevox29', 'Lorenzo', 'Sorresina', null, '2');
INSERT INTO `customer` VALUES ('susy.viligiardi@hotmail.it', 'domenico', 'Susanna', 'Viligiardi', null, '2');
INSERT INTO `customer` VALUES ('tiapave91@hotmail.it', 'silvia92', 'Mattia', 'Pavesi', null, '2');
INSERT INTO `customer` VALUES ('tobiaskoeberle@gmx.de', 'millwall20', 'Tobias', 'Koeberle', null, '2');
INSERT INTO `customer` VALUES ('valentina.mangane@student.unisi.it', 'giorgino', 'Valentina', 'Manganelli', null, '2');
INSERT INTO `customer` VALUES ('vannini.sv@gmail.com', '15dicembre', 'Simone', 'Vannini', null, '2');
INSERT INTO `customer` VALUES ('vannini@iltributarista.it', 'peoro58', 'CARLO', 'VANNINI', null, '2');
INSERT INTO `customer` VALUES ('vavellis@hotmail.it', 'Robur1904', 'Vincenzo', 'Avellis', null, '2');
INSERT INTO `customer` VALUES ('verdy_b@libero.it', 'fonzie13', 'Gianpaolo', 'Berti', null, '2');
INSERT INTO `customer` VALUES ('Viapiccolomini121@gmail.com', 'babayaga', 'Marco', 'Cheli', null, '2');
INSERT INTO `customer` VALUES ('vit@vitella.it', 'erta53fret', 'Gabriele', 'Vitella', null, '2');
INSERT INTO `customer` VALUES ('vittorio.bari.siena@gmail.com', 'rapolanote', 'vittorio', 'bari', null, '2');

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
INSERT INTO `customer_roles` VALUES ('a.pacciani@alice.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('a.palazzi59@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ag71si@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('agnelli.federico@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('alemonti93@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('aliotfran@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('amanghino@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('andrea.iacopini82@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('andreas.mara@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('andrew@edition.com.hk', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('baby61bb@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('cedipiu@yahoo.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('chiara.pace1@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ciavrom@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('corsfil75@live.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('davilla.cateni@novartis.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('domeginge@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('domenico.ginese@hotmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('dtoppini@live.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('e.cortonesi@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('e.sicignano@virgilio.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ele10697@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('elena.valentini3@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('emi.giu@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('f.samori@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('fabiobalocchi@alice.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ffabianelli@alice.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('fiogigli@alice.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('GABRIELE.RIGATTI@MPS.IT', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('gfalciani@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giacomopetricci1994@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giangiobanana@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giannibonomo@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giulianatalini23@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('giuseppe@studiofancelli.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('iandreaf94@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ilaria.ianiri@enel.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ile.tama@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('irenovanta@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('irepist@yahoo.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ittanisenomis@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('jacopo.valenti@hotmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('jegriffiths@deloitte.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('ladidderia@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('landino9@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('leonard.97@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('lorenzini_giulio@hotmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('luca.pepi@enel.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('m.brogiotti@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('manuelagiomi@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('marco.cianfanelli@virgilio.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('marco.lorenzini87@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('marco.santucci68@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('marco.vukosa@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('Mauro.Viligiardi@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('maxmasi@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('mimmo.liberati@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('mrosi53@ymail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('niccoanfo@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('niccolo1971@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('pantalonesimona@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('pietrobernardi@piccolominisiena.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('p_swierblewski@o2.pl', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('r.fontani@yahoo.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('redhotman@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('riccardo.tordini@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('roger@gamelosers.net', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('sandro.adriana@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('sandromartelli2@virgilio.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('senesedoc@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('shop@robursienashop.it', 'AMMINISTRATORE');
INSERT INTO `customer_roles` VALUES ('simone.bagnolesi@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('sorre29@yahoo.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('susy.viligiardi@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('tiapave91@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('tobiaskoeberle@gmx.de', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('valentina.mangane@student.unisi.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('vannini.sv@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('vannini@iltributarista.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('vavellis@hotmail.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('verdy_b@libero.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('Viapiccolomini121@gmail.com', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('vit@vitella.it', 'CUSTOMER');
INSERT INTO `customer_roles` VALUES ('vittorio.bari.siena@gmail.com', 'CUSTOMER');

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
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery_cost
-- ----------------------------
INSERT INTO `delivery_cost` VALUES ('2', 'PIU\' POSTE - Comune di Siena', '3.70', '0', 'PIU\' POSTE - Comune di Siena', null);
INSERT INTO `delivery_cost` VALUES ('3', 'PIU\' POSTE - Frazione Arbia', '3.70', '0', 'PIU\' POSTE - Frazione Arbia', null);
INSERT INTO `delivery_cost` VALUES ('4', 'PIU\' POSTE - Frazione Casetta', '3.70', '0', 'PIU\' POSTE - Frazione Casetta', null);
INSERT INTO `delivery_cost` VALUES ('5', 'PIU\' POSTE - Frazione Belverde', '3.70', '0', 'PIU\' POSTE - Frazione Belverde', null);
INSERT INTO `delivery_cost` VALUES ('6', 'PIU\' POSTE - Frazione San Rocco', '3.70', '0', 'PIU\' POSTE - Frazione San Rocco', null);
INSERT INTO `delivery_cost` VALUES ('7', 'PIU\' POSTE - Frazione Ponte a Tressa', '3.70', '0', 'PIU\' POSTE - Frazione Ponte a Tressa', null);
INSERT INTO `delivery_cost` VALUES ('8', 'PIU\' POSTE - Frazione Montarioso', '3.70', '0', 'PIU\' POSTE - Frazione Montarioso', null);
INSERT INTO `delivery_cost` VALUES ('9', 'PIU\' POSTE - Altro', '9.00', '0', 'PIU\' POSTE - Altro', null);
INSERT INTO `delivery_cost` VALUES ('9999', 'Ritiro presso Corriere', '0.00', '0', 'Ritiro presso Corriere Più Poste', null);

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
INSERT INTO `delivery_nazioni` VALUES ('2', 'ITALIA', '9992');
INSERT INTO `delivery_nazioni` VALUES ('3', 'ITALIA', '9998');
INSERT INTO `delivery_nazioni` VALUES ('4', 'ITALIA', '9997');
INSERT INTO `delivery_nazioni` VALUES ('5', 'ITALIA', '9996');
INSERT INTO `delivery_nazioni` VALUES ('6', 'ITALIA', '9995');
INSERT INTO `delivery_nazioni` VALUES ('7', 'ITALIA', '9994');
INSERT INTO `delivery_nazioni` VALUES ('8', 'ITALIA', '9993');
INSERT INTO `delivery_nazioni` VALUES ('9', 'ITALIA', null);
INSERT INTO `delivery_nazioni` VALUES ('9999', 'ITALIA', '9999');

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
INSERT INTO `gender` VALUES ('2', 'en', 'Match kit');
INSERT INTO `gender` VALUES ('2', 'it', 'Kit gara');
INSERT INTO `gender` VALUES ('3', 'en', 'Fashion');
INSERT INTO `gender` VALUES ('3', 'it', 'Abbigliamento');
INSERT INTO `gender` VALUES ('4', 'en', 'Accessories');
INSERT INTO `gender` VALUES ('4', 'it', 'Accessori');

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
INSERT INTO `ipnmessages` VALUES ('123', '0JY2816011144420A', '2015-02-13 11:02:51', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.56;CORRELATIONID=92f8f8853a8a;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=0JY2816011144420A;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-67A56522KC6924126;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-13T10:11:33Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=35.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-13T10:11:34Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('106', '10G57590862293344', '2015-01-22 17:18:41', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.00;CORRELATIONID=624e9e6a5b2ef;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=10G57590862293344;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-41D85963GK7817604;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-22T16:26:54Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=19.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-22T16:26:55Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('53', '1CD33259239704202', '2014-12-20 12:53:10', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=72433b8ab7aba;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=1CD33259239704202;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1N374367E4539345C;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-20T12:00:37Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-20T12:00:39Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('69', '1D2884534X251673E', '2015-01-09 19:32:47', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.54;CORRELATIONID=fd212024959a8;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=1D2884534X251673E;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-6VR5236217877084W;PAYMENTINFO_0_ERRORCODE=0;BUILD=14726230;PAYMENTINFO_0_ORDERTIME=2015-01-09T18:40:41Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=35.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-09T18:40:43Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('68', '1PC36374JW3166358', '2015-01-09 14:18:19', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.88;CORRELATIONID=3cf11e719560b;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=1PC36374JW3166358;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-99Y34125C1378245D;PAYMENTINFO_0_ERRORCODE=0;BUILD=14726230;PAYMENTINFO_0_ORDERTIME=2015-01-09T13:26:13Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=15.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3288-7847-5986-8181;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-09T13:26:14Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('8', '20A73556X0728015W', '2014-12-16 21:43:09', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=a51c8374253c0;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=20A73556X0728015W;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-7U7839574N4163333;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T20:50:32Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=5623-8404-8316-7784;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T20:50:33Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('16', '21D672569W913524K', '2014-12-17 10:49:29', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=3.37;CORRELATIONID=45c1e238c936d;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=21D672569W913524K;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-2W969335LA589100N;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T09:56:52Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=88.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T09:56:54Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('90', '21Y6068682884922A', '2015-01-20 11:18:46', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.67;CORRELATIONID=63277131afbb0;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=21Y6068682884922A;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-2HR99351DE933632A;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-20T10:26:54Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=38.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-20T10:26:57Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('128', '26527763FD171412P', '2015-02-16 09:31:44', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.69;CORRELATIONID=20c1ef415a8e0;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=26527763FD171412P;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1TK92039BE6506446;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-16T08:40:30Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=68.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-16T08:40:31Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('13', '2B715742CL165492F', '2014-12-16 22:49:07', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.92;CORRELATIONID=6ed3c035e1019;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2B715742CL165492F;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-35X05613SK788670L;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:56:27Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=75.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:56:31Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('12', '2EW0671304010230A', '2014-12-16 22:07:55', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=2fabf1889fb6e;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2EW0671304010230A;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-01S86332D3408773X;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:15:17Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3707-9917-1219-8175;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:15:19Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('4', '2W563408SV880020G', '2014-12-16 18:43:16', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.88;CORRELATIONID=5b435f9e4bff9;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2W563408SV880020G;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4TY04150WE272192J;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T17:50:38Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=15.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=0573-0941-0193-1384;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T17:50:40Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('14', '32W1290255584243D', '2014-12-16 22:41:42', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=85514a3f5168f;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=32W1290255584243D;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-5W408073NG999652J;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:49:05Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:49:06Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('65', '3KH867102B731153S', '2015-01-06 22:03:31', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.36;CORRELATIONID=e258b9743e07f;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=3KH867102B731153S;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-78R89196Y4403271N;PAYMENTINFO_0_ERRORCODE=0;BUILD=14443165;PAYMENTINFO_0_ORDERTIME=2015-01-06T21:11:22Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=59.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-06T21:11:23Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('47', '3R683241PP6844154', '2014-12-18 19:13:33', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=96d3f2d4ebe33;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=3R683241PP6844154;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4BG502604L345781P;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-18T18:20:57Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-18T18:20:59Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('23', '4FD53572JV142114J', '2014-12-17 13:27:07', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=7a12d7578cc44;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=4FD53572JV142114J;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-7F855783HE504180G;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T12:34:30Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=1875-9474-8992-5034;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T12:34:32Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('52', '4GS63174U59538511', '2014-12-19 21:30:59', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=da31ba93f2ccc;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=4GS63174U59538511;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-0FW17552KE493404G;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-19T20:38:26Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3725-7984-9663-9649;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-19T20:38:27Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('62', '5KB42119RF576284K', '2014-12-31 08:49:56', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.44;CORRELATIONID=93fbfbda228;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5KB42119RF576284K;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-9U045982ES1810249;PAYMENTINFO_0_ERRORCODE=0;BUILD=14443165;PAYMENTINFO_0_ORDERTIME=2014-12-31T07:57:38Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=32.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-31T07:57:40Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('44', '5KP57609RF961254D', '2014-12-18 16:37:38', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=40b59a2f37915;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5KP57609RF961254D;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-76M4010829587573H;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-18T15:45:03Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=4315-5532-3502-1755;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-18T15:45:04Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('49', '5ML67753M60634040', '2014-12-18 22:36:58', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=3.26;CORRELATIONID=d85c135c10cd6;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5ML67753M60634040;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4XD46567WS660280E;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-18T21:44:24Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=85.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=2927-3431-6876-4637;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-18T21:44:25Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('74', '5UJ23518FJ4803705', '2015-01-17 18:01:13', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.36;CORRELATIONID=4138878038754;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=5UJ23518FJ4803705;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-55P82615PJ258821F;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-17T17:09:19Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=59.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-17T17:09:20Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('67', '67374676UA890822F', '2015-01-08 23:16:02', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.36;CORRELATIONID=816924898c089;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=67374676UA890822F;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-48545653YX9222927;PAYMENTINFO_0_ERRORCODE=0;BUILD=14443165;PAYMENTINFO_0_ORDERTIME=2015-01-08T22:23:56Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=59.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-08T22:23:57Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('129', '67739167P5215200B', '2015-02-24 13:16:44', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.60;CORRELATIONID=c625052e7c788;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=67739167P5215200B;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-31L76110FE7840452;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-24T12:25:41Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=32.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-24T12:25:42Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('59', '6J579419DB3588457', '2014-12-29 11:06:12', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.44;CORRELATIONID=f52ab38894be5;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=6J579419DB3588457;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-6V4054462F994341G;PAYMENTINFO_0_ERRORCODE=0;BUILD=14443165;PAYMENTINFO_0_ORDERTIME=2014-12-29T10:13:51Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=32.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3952-6588-2994-2074;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-29T10:13:53Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('116', '6UL00904R00589359', '2015-02-11 12:12:24', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.95;CORRELATIONID=adec605ef1206;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=6UL00904R00589359;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4HC75889V5103664N;PAYMENTINFO_0_ERRORCODE=0;BUILD=15295733;PAYMENTINFO_0_ORDERTIME=2015-02-11T11:21:03Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=47.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=2671-7267-0325-1045;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-11T11:21:04Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('108', '788508482C2954011', '2015-01-24 11:14:58', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.56;CORRELATIONID=98abd5b4bff26;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=788508482C2954011;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-81S08839JH8026345;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-24T10:23:12Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=35.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-24T10:23:14Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('3', '78A5116396612400C', '2014-12-16 18:12:33', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.07;CORRELATIONID=ee1eaa799ad50;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=78A5116396612400C;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-9BN01448C3699194C;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T17:19:56Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=50.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T17:19:57Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('11', '7BF57473CK633591C', '2014-12-16 21:58:01', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.56;CORRELATIONID=3fab4bf920f20;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7BF57473CK633591C;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-02X63530T4775283F;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:05:24Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=35.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:05:25Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('107', '7G559325H2346404J', '2015-01-22 17:41:41', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.00;CORRELATIONID=70cdbe7b494d4;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7G559325H2346404J;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-0JM31266A5589784U;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-22T16:49:54Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=19.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-22T16:49:55Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('114', '7JR085744Y4446115', '2015-02-05 17:18:58', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=92b68fc4ce7b1;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7JR085744Y4446115;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-20443891RN953115U;PAYMENTINFO_0_ERRORCODE=0;BUILD=15177679;PAYMENTINFO_0_ORDERTIME=2015-02-05T16:27:29Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-02-05T16:27:31Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('56', '7MH64736MR117874V', '2014-12-22 18:44:20', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.07;CORRELATIONID=c84da8e0c2ffc;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7MH64736MR117874V;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-0MK53971FT148943C;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-22T17:51:51Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=50.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-22T17:51:52Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('28', '7MM719152T053574F', '2014-12-17 21:23:51', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.67;CORRELATIONID=1fd674ed5769;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7MM719152T053574F;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1Y186916LM053824L;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T20:31:15Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=38.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T20:31:16Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('7', '7WN47279029339416', '2014-12-16 21:37:45', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.99;CORRELATIONID=26bb3225ccb21;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7WN47279029339416;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-11187131DR8036446;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T20:45:08Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=18.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3096-4718-5316-1521;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T20:45:09Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('102', '8D035184J2519023H', '2015-01-21 21:39:57', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.67;CORRELATIONID=2e25792e650d2;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8D035184J2519023H;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-33B51270UB073020X;PAYMENTINFO_0_ERRORCODE=0;BUILD=14839371;PAYMENTINFO_0_ORDERTIME=2015-01-21T20:48:08Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=38.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-21T20:48:09Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('15', '8WS47319UU855062U', '2014-12-16 23:36:52', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=d281c446c1ce1;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8WS47319UU855062U;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1J9740298A213884D;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T22:44:15Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T22:44:16Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('29', '96H44923K05703029', '2014-12-18 06:55:22', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=e06bb83a74d79;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=96H44923K05703029;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-8XE658101R484011F;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-18T06:02:47Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-18T06:02:48Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('72', '9E684885NJ037794P', '2015-01-12 21:40:24', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.36;CORRELATIONID=93ef39a7b35f1;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=9E684885NJ037794P;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1C638342S37755530;PAYMENTINFO_0_ERRORCODE=0;BUILD=14726230;PAYMENTINFO_0_ORDERTIME=2015-01-12T20:48:23Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=59.00;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2015-01-12T20:48:24Z;', 'Completed', null, '0', null);
INSERT INTO `ipnmessages` VALUES ('18', '9PU17797WM344110M', '2014-12-17 12:43:20', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=4bd8b7164b8a;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=9PU17797WM344110M;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4ES8928519719303D;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T11:50:43Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T11:50:45Z;', 'Completed', null, '0', null);

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
INSERT INTO `material` VALUES ('2', 'en', 'WOOL');
INSERT INTO `material` VALUES ('2', 'it', 'LANA');
INSERT INTO `material` VALUES ('3', 'en', 'N/A');
INSERT INTO `material` VALUES ('3', 'it', 'N/A');

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
INSERT INTO `nazioni` VALUES ('ITALIA', 'it');

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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('3', 'ile.tama@hotmail.it', '50.70', '78A5116396612400C', '6', '6', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('4', 'ffabianelli@alice.it', '15.70', '2W563408SV880020G', '7', '7', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('5', 'niccoanfo@libero.it', '35.70', null, '9', '9', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('6', 'iandreaf94@gmail.com', '53.70', null, '10', '10', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('7', 'verdy_b@libero.it', '18.70', '7WN47279029339416', '12', '12', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('8', 'dtoppini@live.it', '53.70', '20A73556X0728015W', '13', '13', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('9', 'giannibonomo@hotmail.it', '53.70', null, '14', '14', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('10', 'giannibonomo@hotmail.it', '53.70', null, '14', '14', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('11', 'redhotman@hotmail.it', '35.70', '7BF57473CK633591C', '15', '15', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('12', 'giannibonomo@hotmail.it', '53.70', '2EW0671304010230A', '14', '14', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('13', 'f.samori@gmail.com', '75.70', '2B715742CL165492F', '16', '16', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('14', 'aliotfran@gmail.com', '53.70', '32W1290255584243D', '18', '18', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('15', 'sandro.adriana@libero.it', '53.70', '8WS47319UU855062U', '19', '19', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('16', 'ag71si@gmail.com', '88.70', '21D672569W913524K', '21', '21', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('17', 'e.cortonesi@libero.it', '22.70', null, '22', '22', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('18', 'vannini@iltributarista.it', '53.70', '9PU17797WM344110M', '23', '23', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('22', 'pantalonesimona@libero.it', '53.70', null, '25', '25', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('23', 'pantalonesimona@libero.it', '53.70', '4FD53572JV142114J', '25', '25', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('24', 'marco.lorenzini87@gmail.com', '18.70', null, '26', '26', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('25', 'marco.lorenzini87@gmail.com', '18.70', null, '26', '26', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('26', 'marco.lorenzini87@gmail.com', '18.70', null, '26', '26', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('27', 'marco.lorenzini87@gmail.com', '18.70', null, '26', '26', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('28', 'mimmo.liberati@gmail.com', '38.70', '7MM719152T053574F', '27', '27', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('29', 'jacopo.valenti@hotmail.com', '53.70', '96H44923K05703029', '28', '28', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('30', 'jacopo.valenti@hotmail.com', '53.70', null, '28', '28', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('35', 'marco.lorenzini87@gmail.com', '18.70', null, '26', '26', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('44', 'manuelagiomi@hotmail.it', '53.70', '5KP57609RF961254D', '32', '32', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('45', 'Mauro.Viligiardi@libero.it', '59.00', null, '33', '33', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('46', 'Mauro.Viligiardi@libero.it', '53.70', null, '33', '33', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('47', 'alemonti93@gmail.com', '53.70', '3R683241PP6844154', '34', '34', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('48', 'giacomopetricci1994@gmail.com', '88.70', null, '35', '35', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('49', 'vavellis@hotmail.it', '85.70', '5ML67753M60634040', '37', '37', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('50', 'marco.santucci68@gmail.com', '53.70', null, '39', '39', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('51', 'marco.santucci68@gmail.com', '53.70', null, '39', '39', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('52', 'marco.santucci68@gmail.com', '53.70', '4GS63174U59538511', '40', '40', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('53', 'vit@vitella.it', '53.70', '1CD33259239704202', '45', '45', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('54', 'tiapave91@hotmail.it', '53.70', null, '46', '46', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('55', 'r.fontani@yahoo.it', '50.70', null, '10006', '10006', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('56', 'r.fontani@yahoo.it', '50.70', '7MH64736MR117874V', '10006', '10006', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('58', 'emi.giu@libero.it', '32.00', null, '10021', '10020', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('59', 'ilaria.ianiri@enel.com', '32.00', '6J579419DB3588457', '10025', '10024', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('60', 'vittorio.bari.siena@gmail.com', '35.00', null, '10029', '10028', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('61', 'Viapiccolomini121@gmail.com', '32.00', null, '10031', '10030', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('62', 'Viapiccolomini121@gmail.com', '32.00', '5KB42119RF576284K', '10031', '10030', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('65', 'giulianatalini23@gmail.com', '59.00', '3KH867102B731153S', '10039', '10039', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('66', 'giangiobanana@hotmail.it', '15.70', null, '10043', '10043', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('67', 'sorre29@yahoo.com', '59.00', '67374676UA890822F', '10042', '10042', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('68', 'giangiobanana@hotmail.it', '15.70', '1PC36374JW3166358', '10045', '10045', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('69', 'domeginge@gmail.com', '35.00', '1D2884534X251673E', '10052', '10051', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('70', 'vittorio.bari.siena@gmail.com', '35.00', null, '10053', '10028', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('71', 'elena.valentini3@libero.it', '35.00', null, '10035', '10034', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('72', 'niccolo1971@gmail.com', '59.00', '9E684885NJ037794P', '10055', '10054', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('73', 'mrosi53@ymail.com', '42.00', null, '10057', '10056', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('74', 'iandreaf94@gmail.com', '59.00', '5UJ23518FJ4803705', '10059', '10059', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('75', 'simone.bagnolesi@gmail.com', '15.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('82', 'simone.bagnolesi@gmail.com', '53.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('83', 'agnelli.federico@gmail.com', '53.70', null, '10063', '10063', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('84', 'agnelli.federico@gmail.com', '53.70', null, '10063', '10063', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('85', 'agnelli.federico@gmail.com', '50.00', null, '10065', '10064', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('86', 'simone.bagnolesi@gmail.com', '65.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('87', 'ciavrom@gmail.com', '38.70', null, '10067', '10067', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('88', 'ciavrom@gmail.com', '38.70', null, '10067', '10067', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('89', 'ciavrom@gmail.com', '38.70', null, '10067', '10067', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('90', 'ciavrom@gmail.com', '38.70', '21Y6068682884922A', '10067', '10067', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('91', 'simone.bagnolesi@gmail.com', '13.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('96', 'emi.giu@libero.it', '13.70', null, '10021', '10021', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('99', 'chiara.pace1@libero.it', '38.70', null, '10066', '10066', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('100', 'vittorio.bari.siena@gmail.com', '44.00', null, '10053', '10053', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('102', 'chiara.pace1@libero.it', '38.70', '8D035184J2519023H', '10066', '10066', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('103', 'simone.bagnolesi@gmail.com', '53.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('104', 'simone.bagnolesi@gmail.com', '53.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('105', 'simone.bagnolesi@gmail.com', '103.70', null, '10027', '10027', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('106', 'marco.cianfanelli@virgilio.it', '19.00', '10G57590862293344', '10077', '10081', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('107', 'marco.cianfanelli@virgilio.it', '19.00', '7G559325H2346404J', '10084', '10084', '9', null, null, null, '0');
INSERT INTO `orders` VALUES ('108', 'amanghino@gmail.com', '35.70', '788508482C2954011', '10085', '10085', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('109', 'simone.bagnolesi@gmail.com', '50.00', null, '10027', '10026', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('113', 'riccardo.tordini@gmail.com', '53.70', null, '10088', '10089', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('114', 'riccardo.tordini@gmail.com', '53.70', '7JR085744Y4446115', '10088', '10089', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('115', 'davilla.cateni@novartis.com', '47.00', null, '10091', '10090', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('116', 'davilla.cateni@novartis.com', '47.00', '6UL00904R00589359', '10091', '10090', '9999', null, null, null, '0');
INSERT INTO `orders` VALUES ('123', 'sandromartelli2@virgilio.it', '35.70', '0JY2816011144420A', '10095', '10094', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('128', 'GABRIELE.RIGATTI@MPS.IT', '68.70', '26527763FD171412P', '10097', '10098', '2', null, null, null, '0');
INSERT INTO `orders` VALUES ('129', 'jegriffiths@deloitte.com', '32.00', '67739167P5215200B', '10102', '10101', '9999', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_articles
-- ----------------------------
INSERT INTO `orders_articles` VALUES ('1', '3', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('2', '3', '147', '3', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('3', '4', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('4', '5', '143', '2', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('5', '6', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('6', '7', '146', '6', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('7', '8', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('8', '9', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('9', '10', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('10', '11', '143', '2', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('11', '12', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('12', '13', '141', '1', '1', '7.00', null);
INSERT INTO `orders_articles` VALUES ('13', '13', '142', '4', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('14', '13', '146', '4', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('15', '14', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('16', '14', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('17', '15', '146', '3', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('18', '15', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('19', '16', '142', '3', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('20', '16', '147', '1', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('21', '17', '141', '1', '1', '7.00', null);
INSERT INTO `orders_articles` VALUES ('22', '17', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('23', '18', '146', '5', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('24', '18', '147', '5', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('25', '22', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('26', '23', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('27', '24', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('28', '25', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('29', '26', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('30', '27', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('31', '28', '147', '3', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('32', '29', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('33', '30', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('34', '35', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('35', '44', '142', '3', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('36', '45', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('37', '46', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('38', '47', '142', '4', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('39', '48', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('40', '48', '147', '2', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('41', '49', '142', '3', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('42', '49', '143', '1', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('43', '50', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('44', '51', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('45', '52', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('46', '53', '142', '6', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('47', '54', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('48', '55', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('49', '55', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('50', '56', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('51', '56', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('52', '58', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('53', '59', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('54', '60', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('55', '61', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('56', '62', '143', '3', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('57', '65', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('58', '66', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('59', '67', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('60', '68', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('61', '69', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('62', '70', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('63', '71', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('64', '72', '143', '1', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('65', '72', '144', '1', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('66', '72', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('67', '73', '141', '1', '1', '7.00', null);
INSERT INTO `orders_articles` VALUES ('68', '73', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('69', '74', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('70', '75', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('71', '82', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('72', '83', '142', '4', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('73', '84', '142', '4', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('74', '85', '142', '4', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('75', '86', '142', '1', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('76', '86', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('77', '87', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('78', '88', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('79', '89', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('80', '90', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('81', '91', '149', '1', '1', '10.00', null);
INSERT INTO `orders_articles` VALUES ('82', '96', '149', '1', '1', '10.00', null);
INSERT INTO `orders_articles` VALUES ('83', '99', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('84', '100', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('85', '102', '147', '4', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('86', '103', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('87', '104', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('88', '105', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('89', '105', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('90', '106', '149', '1', '1', '10.00', null);
INSERT INTO `orders_articles` VALUES ('91', '107', '149', '1', '1', '10.00', null);
INSERT INTO `orders_articles` VALUES ('92', '108', '143', '1', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('93', '109', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('97', '113', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('98', '114', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('99', '115', '147', '1', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('100', '115', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('101', '116', '147', '1', '1', '35.00', null);
INSERT INTO `orders_articles` VALUES ('102', '116', '145', '1', '1', '12.00', null);
INSERT INTO `orders_articles` VALUES ('109', '123', '143', '1', '1', '32.00', null);
INSERT INTO `orders_articles` VALUES ('114', '128', '142', '2', '1', '50.00', null);
INSERT INTO `orders_articles` VALUES ('115', '128', '146', '2', '1', '15.00', null);
INSERT INTO `orders_articles` VALUES ('116', '129', '143', '1', '1', '32.00', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('141', '4', '12', '20', '7', '0', 'thumb20150129155955749&_DSC0608.jpg', '1', '2014-12-15 09:22:47', null, '3', null, null);
INSERT INTO `product` VALUES ('142', '2', '9', '20', '50', '0', 'thumb20150129161259134&_DSC0610.jpg', '1', '2014-12-15 09:26:34', null, '1', null, null);
INSERT INTO `product` VALUES ('143', '2', '11', '20', '32', '0', 'thumb20150129161833536&_DSC0612.jpg', '1', '2014-12-15 09:29:53', null, '1', null, null);
INSERT INTO `product` VALUES ('144', '3', '1', '20', '15', '0', 'thumb20150129153839092&_DSC0597.jpg', '1', '2014-12-15 09:32:37', null, '2', null, null);
INSERT INTO `product` VALUES ('145', '3', '8', '20', '12', '0', 'thumb20150129154736038&_DSC0600.jpg', '1', '2014-12-15 09:45:47', null, '2', null, null);
INSERT INTO `product` VALUES ('146', '3', '3', '20', '15', '0', 'thumb20150129162037747&_DSC0595.jpg', '1', '2014-12-15 09:47:59', null, '1', null, null);
INSERT INTO `product` VALUES ('147', '3', '7', '20', '35', '0', 'thumb20150129160248386&_DSC0593.jpg', '1', '2014-12-15 09:49:57', null, '1', null, null);
INSERT INTO `product` VALUES ('148', '1', '8', '20', '1', '0', 'thumb20141215223649926&420103_mrp_fr_m2.jpg', '1', '2014-12-15 22:29:53', null, '1', null, null);
INSERT INTO `product` VALUES ('149', '4', '13', '20', '10', '0', 'thumb20150129155342900&_DSC0604.jpg', '1', '2015-01-19 09:27:34', null, '1', null, null);

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
INSERT INTO `product_description` VALUES ('141', 'en', 'Red wine Robur Siena');
INSERT INTO `product_description` VALUES ('141', 'it', 'Vino rosso Robur Siena');
INSERT INTO `product_description` VALUES ('142', 'en', 'Game shirt Robur Siena');
INSERT INTO `product_description` VALUES ('142', 'it', 'Maglia da gara Robur Siena');
INSERT INTO `product_description` VALUES ('143', 'en', 'Boy game shirt Robur Siena');
INSERT INTO `product_description` VALUES ('143', 'it', 'Maglia da gara bambino Robur Siena');
INSERT INTO `product_description` VALUES ('144', 'en', 'Robur siena scarf');
INSERT INTO `product_description` VALUES ('144', 'it', 'Sciarpa Robur Siena');
INSERT INTO `product_description` VALUES ('145', 'en', 'Caps Robur Siena');
INSERT INTO `product_description` VALUES ('145', 'it', 'Cappellino Robur Siena');
INSERT INTO `product_description` VALUES ('146', 'en', 'T-shirt Robur Siena');
INSERT INTO `product_description` VALUES ('146', 'it', 'T-shirt Robur Siena');
INSERT INTO `product_description` VALUES ('147', 'en', 'Sweatshirt Robur siena');
INSERT INTO `product_description` VALUES ('147', 'it', 'Felpa Robur Siena');
INSERT INTO `product_description` VALUES ('148', 'en', 'Robur Siena		Caps Shop COTTON');
INSERT INTO `product_description` VALUES ('148', 'it', 'prodotto prova');
INSERT INTO `product_description` VALUES ('149', 'en', 'Robur Siena pennant');
INSERT INTO `product_description` VALUES ('149', 'it', 'Gagliardetto Robur Siena');

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
INSERT INTO `product_image` VALUES ('141', '1', '20150129155955749&_DSC0608.jpg');
INSERT INTO `product_image` VALUES ('141', '2', '20150129160136167&_DSC0609.jpg');
INSERT INTO `product_image` VALUES ('142', '1', '20150129161259134&_DSC0610.jpg');
INSERT INTO `product_image` VALUES ('142', '2', '20150129161309479&_DSC0611.jpg');
INSERT INTO `product_image` VALUES ('143', '1', '20150129161833536&_DSC0612.jpg');
INSERT INTO `product_image` VALUES ('143', '2', '20150129161841007&_DSC0613.jpg');
INSERT INTO `product_image` VALUES ('144', '1', '20150129153839092&_DSC0597.jpg');
INSERT INTO `product_image` VALUES ('144', '2', '20150129153852612&_DSC0599.jpg');
INSERT INTO `product_image` VALUES ('144', '3', '20150129154207443&_DSC0598.jpg');
INSERT INTO `product_image` VALUES ('145', '1', '20150129154736038&_DSC0600.jpg');
INSERT INTO `product_image` VALUES ('145', '2', '20150129154744959&_DSC0601.jpg');
INSERT INTO `product_image` VALUES ('146', '1', '20150129162037747&_DSC0595.jpg');
INSERT INTO `product_image` VALUES ('146', '2', '20150129162122084&_DSC0596.jpg');
INSERT INTO `product_image` VALUES ('147', '1', '20150129160248386&_DSC0593.jpg');
INSERT INTO `product_image` VALUES ('147', '2', '20150129160259320&_DSC0594.jpg');
INSERT INTO `product_image` VALUES ('148', '1', '20141215223649926&420103_mrp_fr_m2.jpg');
INSERT INTO `product_image` VALUES ('149', '1', '20150129155342900&_DSC0604.jpg');
INSERT INTO `product_image` VALUES ('149', '2', '20150129155357285&_DSC0605.jpg');

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
INSERT INTO `shops` VALUES ('1', 'Siena', 'shop@robursienashop.it', 'Robur Siena', 'Via dei Mille, 3', 'Siena', '53100', 'SI', 'Italia', '+39 0577 46649');

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
INSERT INTO `site_images` VALUES ('carousel', '1', '19012015100514071&siena.jpg', null, null, 'Official Store');
INSERT INTO `site_images` VALUES ('carousel', '2', '02022015205724983&foto 3.JPG', null, null, 'KIT GARA');
INSERT INTO `site_images` VALUES ('carousel', '3', '02022015205748129&foto 1.JPG', null, null, 'ABBIGLIAMENTO');
INSERT INTO `site_images` VALUES ('carousel', '4', '02022015205807846&foto 2.JPG', null, null, 'ACCESSORI');
INSERT INTO `site_images` VALUES ('new', '1', 'new.png', null, null, 'Robur Siena');
INSERT INTO `site_images` VALUES ('newArrivals', '1', '15122014101902988&foto.JPG', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'Robur Siena');
INSERT INTO `site_images` VALUES ('newArrivals', '2', '15122014101909363&ponsacco 2.JPG', '1', '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0', 'Robur Siena');
INSERT INTO `site_images` VALUES ('promo', '1', 'promo.png', null, null, 'Robur Siena');
INSERT INTO `site_images` VALUES ('tabNav', '1', 'logoTab2.png', '1', null, 'Robur Siena');
INSERT INTO `site_images` VALUES ('tabNav', '2', '19012015100055805&1.png', '3', null, 'Robur Siena');
INSERT INTO `site_images` VALUES ('tabNav', '3', '19012015100102308&1 - Copia (2).png', '4', null, 'Robur Siena');
INSERT INTO `site_images` VALUES ('tabNav', '4', '19012015100112148&1 - Copia (3).png', '2', null, 'Robur Siena');

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
INSERT INTO `size` VALUES ('20', 'XXXS');
INSERT INTO `size` VALUES ('21', 'XXS');
INSERT INTO `size` VALUES ('22', 'XS');
INSERT INTO `size` VALUES ('23', 'S');
INSERT INTO `size` VALUES ('24', 'M');
INSERT INTO `size` VALUES ('25', 'L');
INSERT INTO `size` VALUES ('26', 'XL');
INSERT INTO `size` VALUES ('27', 'XXL');
INSERT INTO `size` VALUES ('28', 'XXXL');
INSERT INTO `size` VALUES ('29', 'U');
INSERT INTO `size` VALUES ('30', 'N/A');

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
INSERT INTO `states_orders` VALUES ('3', '1', '2014-12-16 18:11:46', null);
INSERT INTO `states_orders` VALUES ('3', '3', '2014-12-16 18:12:33', null);
INSERT INTO `states_orders` VALUES ('3', '15', '2014-12-22 10:07:16', null);
INSERT INTO `states_orders` VALUES ('4', '1', '2014-12-16 18:40:12', null);
INSERT INTO `states_orders` VALUES ('4', '3', '2014-12-16 18:43:16', null);
INSERT INTO `states_orders` VALUES ('4', '15', '2014-12-22 10:08:02', null);
INSERT INTO `states_orders` VALUES ('5', '1', '2014-12-16 18:50:38', null);
INSERT INTO `states_orders` VALUES ('6', '1', '2014-12-16 21:09:17', null);
INSERT INTO `states_orders` VALUES ('7', '1', '2014-12-16 21:34:04', null);
INSERT INTO `states_orders` VALUES ('7', '3', '2014-12-16 21:37:45', null);
INSERT INTO `states_orders` VALUES ('7', '15', '2014-12-19 11:02:01', null);
INSERT INTO `states_orders` VALUES ('8', '1', '2014-12-16 21:36:55', null);
INSERT INTO `states_orders` VALUES ('8', '3', '2014-12-16 21:43:09', null);
INSERT INTO `states_orders` VALUES ('8', '15', '2014-12-22 10:09:30', null);
INSERT INTO `states_orders` VALUES ('9', '1', '2014-12-16 21:55:03', null);
INSERT INTO `states_orders` VALUES ('10', '1', '2014-12-16 21:56:30', null);
INSERT INTO `states_orders` VALUES ('11', '1', '2014-12-16 21:57:41', null);
INSERT INTO `states_orders` VALUES ('11', '3', '2014-12-16 21:58:01', null);
INSERT INTO `states_orders` VALUES ('11', '15', '2014-12-22 10:12:20', null);
INSERT INTO `states_orders` VALUES ('12', '1', '2014-12-16 22:05:19', null);
INSERT INTO `states_orders` VALUES ('12', '3', '2014-12-16 22:07:55', null);
INSERT INTO `states_orders` VALUES ('12', '15', '2014-12-22 09:23:15', null);
INSERT INTO `states_orders` VALUES ('13', '1', '2014-12-16 22:33:28', null);
INSERT INTO `states_orders` VALUES ('13', '3', '2014-12-16 22:49:07', null);
INSERT INTO `states_orders` VALUES ('13', '15', '2014-12-22 10:06:28', null);
INSERT INTO `states_orders` VALUES ('14', '1', '2014-12-16 22:40:20', null);
INSERT INTO `states_orders` VALUES ('14', '3', '2014-12-16 22:41:42', null);
INSERT INTO `states_orders` VALUES ('14', '15', '2014-12-22 10:13:05', null);
INSERT INTO `states_orders` VALUES ('15', '1', '2014-12-16 23:36:01', null);
INSERT INTO `states_orders` VALUES ('15', '3', '2014-12-16 23:36:52', null);
INSERT INTO `states_orders` VALUES ('15', '15', '2014-12-22 10:13:20', null);
INSERT INTO `states_orders` VALUES ('16', '1', '2014-12-17 10:47:54', null);
INSERT INTO `states_orders` VALUES ('16', '3', '2014-12-17 10:49:29', null);
INSERT INTO `states_orders` VALUES ('16', '15', '2014-12-22 10:13:55', null);
INSERT INTO `states_orders` VALUES ('17', '1', '2014-12-17 12:03:53', null);
INSERT INTO `states_orders` VALUES ('18', '1', '2014-12-17 12:38:12', null);
INSERT INTO `states_orders` VALUES ('18', '3', '2014-12-17 12:43:20', null);
INSERT INTO `states_orders` VALUES ('18', '15', '2014-12-22 10:14:33', null);
INSERT INTO `states_orders` VALUES ('22', '1', '2014-12-17 13:23:07', null);
INSERT INTO `states_orders` VALUES ('23', '1', '2014-12-17 13:25:18', null);
INSERT INTO `states_orders` VALUES ('23', '3', '2014-12-17 13:27:07', null);
INSERT INTO `states_orders` VALUES ('23', '15', '2014-12-22 10:15:05', null);
INSERT INTO `states_orders` VALUES ('24', '1', '2014-12-17 15:54:28', null);
INSERT INTO `states_orders` VALUES ('25', '1', '2014-12-17 16:02:26', null);
INSERT INTO `states_orders` VALUES ('26', '1', '2014-12-17 16:06:44', null);
INSERT INTO `states_orders` VALUES ('27', '1', '2014-12-17 18:33:37', null);
INSERT INTO `states_orders` VALUES ('28', '1', '2014-12-17 21:22:25', null);
INSERT INTO `states_orders` VALUES ('28', '3', '2014-12-17 21:23:51', null);
INSERT INTO `states_orders` VALUES ('28', '15', '2014-12-22 10:16:07', null);
INSERT INTO `states_orders` VALUES ('29', '1', '2014-12-18 06:54:36', null);
INSERT INTO `states_orders` VALUES ('29', '3', '2014-12-18 06:55:22', null);
INSERT INTO `states_orders` VALUES ('29', '15', '2014-12-22 10:16:31', null);
INSERT INTO `states_orders` VALUES ('30', '1', '2014-12-18 06:55:50', null);
INSERT INTO `states_orders` VALUES ('35', '1', '2014-12-18 11:32:25', null);
INSERT INTO `states_orders` VALUES ('44', '1', '2014-12-18 16:33:41', null);
INSERT INTO `states_orders` VALUES ('44', '3', '2014-12-18 16:37:38', null);
INSERT INTO `states_orders` VALUES ('44', '15', '2014-12-22 10:16:48', null);
INSERT INTO `states_orders` VALUES ('45', '1', '2014-12-18 17:58:28', null);
INSERT INTO `states_orders` VALUES ('46', '1', '2014-12-18 17:59:34', null);
INSERT INTO `states_orders` VALUES ('47', '1', '2014-12-18 19:11:48', null);
INSERT INTO `states_orders` VALUES ('47', '3', '2014-12-18 19:13:33', null);
INSERT INTO `states_orders` VALUES ('47', '15', '2014-12-22 10:17:11', null);
INSERT INTO `states_orders` VALUES ('48', '1', '2014-12-18 21:58:49', null);
INSERT INTO `states_orders` VALUES ('49', '1', '2014-12-18 22:32:27', null);
INSERT INTO `states_orders` VALUES ('49', '3', '2014-12-18 22:36:58', null);
INSERT INTO `states_orders` VALUES ('49', '15', '2014-12-22 10:17:28', null);
INSERT INTO `states_orders` VALUES ('50', '1', '2014-12-19 21:01:44', null);
INSERT INTO `states_orders` VALUES ('51', '1', '2014-12-19 21:05:44', null);
INSERT INTO `states_orders` VALUES ('52', '1', '2014-12-19 21:26:35', null);
INSERT INTO `states_orders` VALUES ('52', '3', '2014-12-19 21:30:59', null);
INSERT INTO `states_orders` VALUES ('52', '15', '2014-12-22 10:17:56', null);
INSERT INTO `states_orders` VALUES ('53', '1', '2014-12-20 12:52:29', null);
INSERT INTO `states_orders` VALUES ('53', '3', '2014-12-20 12:53:10', null);
INSERT INTO `states_orders` VALUES ('53', '15', '2014-12-22 10:18:37', null);
INSERT INTO `states_orders` VALUES ('54', '1', '2014-12-20 15:11:37', null);
INSERT INTO `states_orders` VALUES ('55', '1', '2014-12-22 18:40:51', null);
INSERT INTO `states_orders` VALUES ('56', '1', '2014-12-22 18:43:07', null);
INSERT INTO `states_orders` VALUES ('56', '3', '2014-12-22 18:44:20', null);
INSERT INTO `states_orders` VALUES ('56', '15', '2014-12-24 08:24:58', null);
INSERT INTO `states_orders` VALUES ('58', '1', '2014-12-29 10:58:22', null);
INSERT INTO `states_orders` VALUES ('59', '1', '2014-12-29 11:04:08', null);
INSERT INTO `states_orders` VALUES ('59', '3', '2014-12-29 11:06:12', null);
INSERT INTO `states_orders` VALUES ('59', '15', '2014-12-31 10:51:27', null);
INSERT INTO `states_orders` VALUES ('60', '1', '2014-12-29 15:18:16', null);
INSERT INTO `states_orders` VALUES ('61', '1', '2014-12-31 08:33:49', null);
INSERT INTO `states_orders` VALUES ('62', '1', '2014-12-31 08:43:44', null);
INSERT INTO `states_orders` VALUES ('62', '3', '2014-12-31 08:49:56', null);
INSERT INTO `states_orders` VALUES ('62', '15', '2014-12-31 10:49:24', null);
INSERT INTO `states_orders` VALUES ('65', '1', '2015-01-06 22:02:39', null);
INSERT INTO `states_orders` VALUES ('65', '3', '2015-01-06 22:03:31', null);
INSERT INTO `states_orders` VALUES ('65', '15', '2015-01-07 10:27:37', null);
INSERT INTO `states_orders` VALUES ('66', '1', '2015-01-08 16:20:42', null);
INSERT INTO `states_orders` VALUES ('67', '1', '2015-01-08 23:14:55', null);
INSERT INTO `states_orders` VALUES ('67', '3', '2015-01-08 23:16:02', null);
INSERT INTO `states_orders` VALUES ('67', '15', '2015-01-15 09:21:16', null);
INSERT INTO `states_orders` VALUES ('68', '1', '2015-01-09 14:12:11', null);
INSERT INTO `states_orders` VALUES ('68', '3', '2015-01-09 14:18:19', null);
INSERT INTO `states_orders` VALUES ('68', '15', '2015-01-15 09:38:39', null);
INSERT INTO `states_orders` VALUES ('69', '1', '2015-01-09 19:31:07', null);
INSERT INTO `states_orders` VALUES ('69', '3', '2015-01-09 19:32:47', null);
INSERT INTO `states_orders` VALUES ('69', '15', '2015-01-15 10:04:25', null);
INSERT INTO `states_orders` VALUES ('70', '1', '2015-01-10 15:19:23', null);
INSERT INTO `states_orders` VALUES ('71', '1', '2015-01-11 21:20:18', null);
INSERT INTO `states_orders` VALUES ('72', '1', '2015-01-12 21:39:28', null);
INSERT INTO `states_orders` VALUES ('72', '3', '2015-01-12 21:40:24', null);
INSERT INTO `states_orders` VALUES ('72', '15', '2015-01-15 10:05:12', null);
INSERT INTO `states_orders` VALUES ('73', '1', '2015-01-13 01:44:53', null);
INSERT INTO `states_orders` VALUES ('74', '1', '2015-01-17 17:57:04', null);
INSERT INTO `states_orders` VALUES ('74', '3', '2015-01-17 18:01:13', null);
INSERT INTO `states_orders` VALUES ('74', '15', '2015-01-23 11:02:42', null);
INSERT INTO `states_orders` VALUES ('75', '1', '2015-01-18 22:29:47', null);
INSERT INTO `states_orders` VALUES ('82', '1', '2015-01-19 23:02:01', null);
INSERT INTO `states_orders` VALUES ('83', '1', '2015-01-19 23:19:54', null);
INSERT INTO `states_orders` VALUES ('84', '1', '2015-01-19 23:21:49', null);
INSERT INTO `states_orders` VALUES ('85', '1', '2015-01-19 23:27:19', null);
INSERT INTO `states_orders` VALUES ('86', '1', '2015-01-19 23:40:03', null);
INSERT INTO `states_orders` VALUES ('87', '1', '2015-01-20 10:41:58', null);
INSERT INTO `states_orders` VALUES ('88', '1', '2015-01-20 10:42:51', null);
INSERT INTO `states_orders` VALUES ('89', '1', '2015-01-20 10:45:09', null);
INSERT INTO `states_orders` VALUES ('90', '1', '2015-01-20 11:13:36', null);
INSERT INTO `states_orders` VALUES ('90', '3', '2015-01-20 11:18:46', null);
INSERT INTO `states_orders` VALUES ('90', '15', '2015-01-23 11:13:10', null);
INSERT INTO `states_orders` VALUES ('91', '1', '2015-01-20 14:42:45', null);
INSERT INTO `states_orders` VALUES ('96', '1', '2015-01-20 19:37:35', null);
INSERT INTO `states_orders` VALUES ('99', '1', '2015-01-21 09:09:47', null);
INSERT INTO `states_orders` VALUES ('100', '1', '2015-01-21 17:26:59', null);
INSERT INTO `states_orders` VALUES ('102', '1', '2015-01-21 21:38:52', null);
INSERT INTO `states_orders` VALUES ('102', '3', '2015-01-21 21:39:57', null);
INSERT INTO `states_orders` VALUES ('102', '15', '2015-01-23 11:13:23', null);
INSERT INTO `states_orders` VALUES ('103', '1', '2015-01-21 22:09:43', null);
INSERT INTO `states_orders` VALUES ('104', '1', '2015-01-21 22:35:03', null);
INSERT INTO `states_orders` VALUES ('105', '1', '2015-01-22 11:05:02', null);
INSERT INTO `states_orders` VALUES ('106', '1', '2015-01-22 17:18:07', null);
INSERT INTO `states_orders` VALUES ('106', '3', '2015-01-22 17:18:41', null);
INSERT INTO `states_orders` VALUES ('106', '15', '2015-01-23 11:13:36', null);
INSERT INTO `states_orders` VALUES ('107', '1', '2015-01-22 17:41:16', null);
INSERT INTO `states_orders` VALUES ('107', '3', '2015-01-22 17:41:41', null);
INSERT INTO `states_orders` VALUES ('107', '15', '2015-01-23 11:13:51', null);
INSERT INTO `states_orders` VALUES ('108', '1', '2015-01-24 11:14:13', null);
INSERT INTO `states_orders` VALUES ('108', '3', '2015-01-24 11:14:58', null);
INSERT INTO `states_orders` VALUES ('108', '15', '2015-01-26 09:50:36', null);
INSERT INTO `states_orders` VALUES ('109', '1', '2015-02-01 00:52:35', null);
INSERT INTO `states_orders` VALUES ('113', '1', '2015-02-05 17:08:27', null);
INSERT INTO `states_orders` VALUES ('114', '1', '2015-02-05 17:14:04', null);
INSERT INTO `states_orders` VALUES ('114', '3', '2015-02-05 17:18:58', null);
INSERT INTO `states_orders` VALUES ('114', '15', '2015-02-06 10:22:11', null);
INSERT INTO `states_orders` VALUES ('115', '1', '2015-02-11 11:57:41', null);
INSERT INTO `states_orders` VALUES ('116', '1', '2015-02-11 12:06:58', null);
INSERT INTO `states_orders` VALUES ('116', '3', '2015-02-11 12:12:24', null);
INSERT INTO `states_orders` VALUES ('116', '15', '2015-02-13 08:35:38', null);
INSERT INTO `states_orders` VALUES ('123', '1', '2015-02-13 10:57:58', null);
INSERT INTO `states_orders` VALUES ('123', '3', '2015-02-13 11:02:51', null);
INSERT INTO `states_orders` VALUES ('123', '15', '2015-02-16 09:43:50', null);
INSERT INTO `states_orders` VALUES ('128', '1', '2015-02-16 09:31:02', null);
INSERT INTO `states_orders` VALUES ('128', '3', '2015-02-16 09:31:44', null);
INSERT INTO `states_orders` VALUES ('128', '15', '2015-02-16 09:44:20', null);
INSERT INTO `states_orders` VALUES ('129', '1', '2015-02-24 13:13:31', null);
INSERT INTO `states_orders` VALUES ('129', '3', '2015-02-24 13:16:44', null);
INSERT INTO `states_orders` VALUES ('129', '15', '2015-02-24 15:31:29', null);

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
INSERT INTO `type` VALUES ('1', 'en', 'Scarfs');
INSERT INTO `type` VALUES ('1', 'it', 'Sciarpe');
INSERT INTO `type` VALUES ('3', 'en', 'T-shirts');
INSERT INTO `type` VALUES ('3', 'it', 'T-shirts');
INSERT INTO `type` VALUES ('7', 'en', 'Sweatshirts');
INSERT INTO `type` VALUES ('7', 'it', 'Felpe');
INSERT INTO `type` VALUES ('8', 'en', 'Caps');
INSERT INTO `type` VALUES ('8', 'it', 'Cappellini');
INSERT INTO `type` VALUES ('9', 'en', 'Game shirts');
INSERT INTO `type` VALUES ('9', 'it', 'Maglie da gara');
INSERT INTO `type` VALUES ('11', 'en', 'Boy game shirts');
INSERT INTO `type` VALUES ('11', 'it', 'Maglie da gara bambino');
INSERT INTO `type` VALUES ('12', 'en', 'Wine');
INSERT INTO `type` VALUES ('12', 'it', 'Vino');
INSERT INTO `type` VALUES ('13', 'en', 'Pennant');
INSERT INTO `type` VALUES ('13', 'it', 'Gagliardetto');

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
