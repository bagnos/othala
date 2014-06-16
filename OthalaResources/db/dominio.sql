INSERT INTO `aduna937_othala`.`shops` (`idShop`, `txShop`, `txMail`) VALUES (1, 'Magazzino Badesse', 'magazzino@degortes.it');

INSERT INTO `aduna937_othala`.`shops` (`idShop`, `txShop`, `txMail`) VALUES (2, 'Siena piazza della Posta', 'siena@degortes.it');
INSERT INTO `aduna937_othala`.`delivery_cost` VALUES (1, 'Corriere Espresso Bartolini', 5.00,0,'Corriere Espresso Bartolini','http://Stocazzo');

INSERT INTO `aduna937_othala`.`delivery_cost`  VALUES (2, 'Corriere Espresso SDA', 5.00,0,'Corriere Espresso SDA','http://Stocazzo');

INSERT INTO `aduna937_othala`.`delivery_cost`  VALUES (3, 'Posta Ordinaria', 3.00,0,'Posta Ordinaria','http://Stocazzo');

INSERT INTO `aduna937_othala`.`delivery_cost` VALUES (4, 'Posta Raccomandata', 4.00,0,'Posta Raccomandata','http://Stocazzo');


INSERT INTO gender VALUES    
(1,'it','UOMO'),(2,'it','DONNA'),(3,'it','BAMBINO'),(4,'it','BAMBINA');
INSERT INTO brand VALUES    
(1,'it','LANVIN'),(2,'it','BALMAIN'),(3,'it','DSQUARED'),(4,'it','MOSCHINO'),(5,'it','DOLCE E GABBANA'),(6,'it','STONE ISLAND');
INSERT INTO `aduna937_othala`.`brand` (`idBrand`, `idLanguages`, `txBrand`) VALUES (7, 'it', 'BLOCH');
INSERT INTO `aduna937_othala`.`brand` (`idBrand`, `idLanguages`, `txBrand`) VALUES (8, 'it', 'ARMANI');

INSERT INTO `type_size`
VALUES
(1,'TAGLIE'),(2,'TAGLIE ITA'),(3,'SCARPE EU'),(4,'PANTALONI US');

INSERT INTO `aduna937_othala`.`size_type_size`
VALUES
(1,1),(2,4),(3,2),(4,2),(5,2),(6,1),(7,1),(8,2),(9,2),(10,2),(11,2),
(12,2),(13,1),(14,4),(15,1),(16,4),(17,2),(18,2),(19,1),(20,3),(21,1),(22,2);



INSERT INTO type VALUES    
(1,'it','ACCESSORI'),(2,'it','BERMUDA'),
(3,'it','CAMICIE'),(4,'it','CAPPOTTI'),(5,'it','COMPLETI'),(6,'it','COSTUMI DA BAGNO'),
(7,'it','FELPE'),(8,'it','GIACCHE'),(9,'it','GIACCHE DI PELLE'),(10,'it','GILET'),
(11,'it','GIUBBOTTI'),(12,'it','GONNE'),(13,'it','INTIMO'),(14,'it','JEANS'),
(15,'it','MAGLIERIA'),(16,'it','PANTALONI'),(17,'it','PELLICCE E SHEARLING'),
(18,'it','PIUMINI'),(19,'it','POLO'),(20,'it','SCARPE'),(21,'it','T-SHIRTS'),
(22,'it','VESTITI');


INSERT INTO `color` VALUES    
(1,'it','ARANCIONE'),(2,'it','ARGENTO'),(3,'it','BEIGE'),
(4,'it','BIANCO'),(5,'it','BLU'),(6,'it','CELESTE'),(7,'it','DENIM'),
(8,'it','GIALLO'),(9,'it','GRIGIO'),(10,'it','MARRONE'),(11,'it','NERO'),
(12,'it','ORO'),(13,'it','ROSA'),(14,'it','ROSSO'),(15,'it','VERDE'),
(16,'it','VIOLA');

INSERT INTO size VALUES    
(1, 2,'34'),  (2,2,'36'),  (3,2,'38'), (4,2,'40'),
(5,2, '42'),  (6,2,'44'),  (7,2,'46'), (8,2,'48'), (9,2,'50'),
(10,2,'52'), (11,2,'54'), (12,2,'56'),(13,2,'58'),(14,2,'60'),
(15,1,'XXS'),(16,1,'XS'), (17,1,'S'), (18,1,'M'), (19,1,'L'),
(20,1,'XL') ,(21,1,'XXL'),(22,1,'U'),
(23, 3,'34'),  (24,3,'35'),  (25,3,'36'), (26,3,'37'),
(27,3, '38'),  (28,3,'39'),  (29,3,'40'), (30,3,'41'), (31,3,'42'),
(32,3,'43'), (33,3,'44'), (34,3,'45'),(35,3,'46'),(36,3,'47'),
(37, 4,'24'),  (38,4,'25'),  (39,4,'26'), (40,4,'27'),
(41,4, '28'),  (42,4,'29'),  (43,4,'30'), (44,4,'31'), (45,4,'32'),
(46,4,'33'), (47,4,'34'), (48,4,'35'),(49,4,'36'),(50,4,'37'),
(51,4,'38'), (52,4,'39'), (53,4,'40'),(54,4,'41'),(55,4,'42')
;

INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO');

INSERT INTO `site_images` VALUES 
(1,'carousel',1,'images/carousel','A2.jpg','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),
(2,'carousel',2,'images/carousel','A1.jpg','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),
(3,'carousel',3,'images/carousel','A3.jpg','/cart/cart-catalog.xhtml?idMenu=3&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),
(4,'carousel',4,'images/carousel','A4.jpg','/cart/cart-catalog.xhtml?idMenu=4&fgNewArrivals=false&idSubMenu=0&idCampaign=0'),
(5,'newArrivals',1,'images/newArrivals','newuomo2.png','/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
(6,'newArrivals',2,'images/newArrivals','newdonna2.png','/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
(7,'newArrivals',3,'images/newArrivals','newbambino2.png','/cart/cart-catalog.xhtml?idMenu=3&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
(8,'newArrivals',4,'images/newArrivals','newbambina2.png','/cart/cart-catalog.xhtml?idMenu=4&fgNewArrivals=true&idSubMenu=0&idCampaign=0');
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`,`urlRedirect`) 
VALUES (9, 'tabNav', 1, 'images/tabNav', 'uomo.png',null);
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`,`urlRedirect`) 
VALUES (10, 'tabNav', 2, 'images/tabNav', 'donna.png',null);
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`,`urlRedirect`) 
VALUES (11, 'tabNav', 3, 'images/tabNav', 'bambino.png',null);
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`,`urlRedirect`) 
VALUES (12, 'tabNav', 4, 'images/tabNav', 'bambina.png',null);


INSERT INTO `aduna937_othala`.`campaigns` (`idCampaign`, `txCampaign`, `dtInizio`, `dtFine`, `pcSconto`) VALUES (1, 'SUMMER SALES', '2014-05-26', '2014-06-15', 75);



INSERT INTO `product` VALUES (1,1,8,1,1200,50,'000001_01.JPG',1,'2014-03-18 00:00:00',1),(2,1,8,2,1345,50,'000002_01.JPG',1,'2014-03-01 00:00:00',NULL),(3,1,11,3,463,40,'000003_01.JPG',1,'2014-03-19 00:00:00',NULL),(4,1,21,4,795,30,'A1.JPG',1,'2014-03-26 12:12:51',NULL),(881,1,14,6,800,50,'A881.JPG',1,'2014-03-26 00:00:00',NULL),(882,2,20,5,395,30,'991a.jpg',1,'2014-05-27 16:10:16',NULL),(883,4,20,7,85,30,'992a.jpg',1,'2014-05-28 10:29:04',NULL),(885,3,20,8,113,30,'993a.jpg',1,'2014-05-28 10:34:02',NULL);
INSERT INTO `product_description` VALUES (1,'it','GIACCA SMOKING \"BEVERLY HILLS\" IN VELLUTO'),(2,'it','GIACCA MISTO LANA'),(3,'it','GIACCHETTO IN MUSSOLA DI COTONE GOMMATA TINTA IN CAPO'),(4,'it','T-SHIRT IN MISTO VISCOSA E SETA'),(881,'it','JEANS IN COTONE STRETCH 16.5CM'),(882,'it','DECOLLETÈ IN BROCCATO FLOREALE 105MM'),(883,'it','BALLERINE IN VERNICE'),(885,'it','SNEAKERS IN CAMOSCIO');
INSERT INTO `product_image` VALUES (1,1,'000001_01.JPG'),(1,2,'000001_02.JPG'),(1,3,'000001_03.JPG'),(1,4,'000001_04.JPG'),(2,1,'000002_01.JPG'),(2,2,'000002_02.JPG'),(2,3,'000002_03.JPG'),(2,4,'000002_04.JPG'),(3,1,'000003_01.JPG'),(3,2,'000003_02.JPG'),(3,3,'000003_03.JPG'),(3,4,'000003_04.JPG'),(4,1,'A1.JPG'),(4,2,'A2.JPG'),(4,3,'A3.JPG'),(4,4,'A4.JPG'),(881,1,'A881.JPG'),(881,2,'A882.JPG'),(881,3,'C881.JPG'),(881,4,'C882.JPG'),(882,1,'991a.jpg'),(882,2,'991b.jpg'),(882,3,'991c.jpg'),(882,4,'991d.jpg'),(883,1,'992a.jpg'),(883,2,'992b.jpg'),(883,3,'992c.jpg'),(883,4,'992d.jpg'),(885,1,'993a.jpg'),(885,2,'993b.jpg'),(885,3,'993c.jpg'),(885,4,'993d.jpg');
INSERT INTO `article` VALUES (1,1,9,11,1,NULL,1,'1111111111'),(1,2,10,11,2,NULL,1,'1111111111'),(1,3,11,11,1,NULL,1,'1111111111'),(2,1,9,11,1,NULL,1,'1111111111'),(2,2,10,11,2,NULL,1,'1111111111'),(2,3,11,11,1,NULL,1,'1111111111'),(3,1,17,6,1,NULL,1,'1111111111'),(3,2,18,6,2,NULL,1,'1111111111'),(3,3,19,6,1,NULL,1,'1111111111'),(4,1,17,4,1,NULL,1,'1111111111'),(4,2,18,4,2,NULL,1,'1111111111'),(4,3,19,4,1,NULL,1,'1111111111'),(881,1,17,3,1,'A882.JPG',1,'1111111111'),(881,2,18,3,2,'A882.JPG',1,'1111111111'),(881,3,19,3,1,'A882.JPG',1,'1111111111'),(881,4,20,6,1,'A881.JPG',1,'1111111111'),(881,5,21,6,2,'A881.JPG',1,'1111111111'),(881,6,22,6,1,'A881.JPG',1,'1111111111'),(882,1,24,13,2,NULL,1,'aaaa'),(882,2,25,13,2,NULL,1,'bbbbb'),(883,1,24,13,2,NULL,1,'aaaa'),(883,2,25,13,2,NULL,1,'bbbbb'),(885,1,24,11,2,NULL,1,'aaaa'),(885,2,25,11,2,NULL,1,'bbbbb');




INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),
                            (3,'COMPLETED'),(4,'DENIED'),
                            (5,'EXPIRED'),(6,'FAILED'),
                            (7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),
                            (9,'PENDING'),(10,'REFUNDED'),
                            (11,'REVERSED'),(12,'PROCESSED'),
                            (13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),
                            (15,'SPEDITO');

INSERT INTO `type_state_account`
VALUES
(1,'DISATTIVATO'),(2,'ATTIVATO'),(3,'CESSATO'),(4,'RESET_PSW');




INSERT INTO `aduna937_othala`.`customer` (`idUser`, `txPassword`, `txNome`, `txCognome`, `txFiscale`, `idTypeState`) VALUES ('1', 'ANTANI', 'JACOPO', 'FREDIANI', 'FRDJCP79A28I726A', 2);
INSERT INTO `aduna937_othala`.`customer_roles` (`idUser`,`txRole`) VALUES (1,'AMMINISTRATORE');
INSERT INTO `aduna937_othala`.`addresses` (`idAddress`, `idUser`, `txNome`, `txCognome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`, `fgDeleted`, `txEtichetta`) VALUES (1, '1', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', 53100, 'SI', 'ITALIA', '3392113342', 0, 'CASA');
INSERT INTO `aduna937_othala`.`orders` VALUES (1, '1', 1000.00, '1', 1, 1, 1,'ASDF323454');
INSERT INTO `aduna937_othala`.`orders_articles` (`idOrder`, `idProdotto`, `pgArticle`, `qtArticle`) VALUES (1, 1, 1, 1);

INSERT INTO `aduna937_othala`.`orders_articles` (`idOrder`, `idProdotto`, `pgArticle`, `qtArticle`) VALUES (1, 881, 1, 1);

INSERT INTO `aduna937_othala`.`states_orders` (`idOrder`, `idStato`) VALUES (1, 2);

