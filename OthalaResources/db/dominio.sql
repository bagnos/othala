INSERT INTO `othala`.`shops` (`idShop`, `txShop`, `txMail`) VALUES (1, 'Magazzino Badesse', 'magazzino@degortes.it');

INSERT INTO `othala`.`shops` (`idShop`, `txShop`, `txMail`) VALUES (2, 'Siena piazza della Posta', 'siena@degortes.it');


INSERT INTO gender VALUES    
(1,'it','UOMO'),(2,'it','DONNA'),(3,'it','BAMBINO'),(4,'it','BAMBINA');
INSERT INTO brand VALUES    
(1,'it','LANVIN'),(2,'it','BALMAIN'),(3,'it','DSQUARED'),(4,'it','MOSCHINO'),(5,'it','DOLCE E GABBANA'),(6,'it','STONE ISLAND');

INSERT INTO `type_size`
VALUES
(1,'TAGLIE'),(2,'TAGLIE ITA'),(3,'SCARPE EU'),(4,'PANTALONI US');

INSERT INTO `othala`.`size_type_size`
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
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/carousel','2.jpg'),(2,'carousel',2,'images/carousel','3.jpg'),(3,'carousel',3,'images/carousel','2.jpg'),(4,'carousel',4,'images/carousel','3.jpg'),(5,'newArrivals',1,'images/newArrivals','uomo.png'),(6,'newArrivals',2,'images/newArrivals','donna.png'),(7,'newArrivals',3,'images/newArrivals','bambino.png'),(8,'newArrivals',4,'images/newArrivals','bambina.png');
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (9, 'tabNav', 1, 'images/tabNav', 'uomo.png');
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (10, 'tabNav', 2, 'images/tabNav', 'donna.png');
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (11, 'tabNav', 3, 'images/tabNav', 'bambino.png');
INSERT INTO `site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (12, 'tabNav', 4, 'images/tabNav', 'bambina.png');

INSERT INTO `product` VALUES (1,1,8,1, 1200,50,'000001_01.JPG',1,'2014-03-18 00:00:00');
INSERT INTO `product` VALUES (2,1,8,2, 1345,50,'000002_01.JPG',1,'2014-03-01 00:00:00');
INSERT INTO `product` VALUES (3,1,11,3,463,40,'000003_01.JPG',1,'2014-03-19 00:00:00');
INSERT INTO `product` VALUES (4,1,21,4,795,30,'A1.JPG',1,'2014-03-26 12:12:51');

INSERT INTO `product_description` VALUES (1,'it','GIACCA SMOKING \"BEVERLY HILLS\" IN VELLUTO'),(2,'it','GIACCA MISTO LANA'),(3,'it','GIACCHETTO IN MUSSOLA DI COTONE GOMMATA TINTA IN CAPO'),(4,'it','T-SHIRT IN MISTO VISCOSA E SETA');

INSERT INTO `product_image` VALUES (1,1,'000001_01.JPG'),(1,2,'000001_02.JPG'),(1,3,'000001_03.JPG'),(1,4,'000001_04.JPG'),(2,1,'000002_01.JPG'),(2,2,'000002_02.JPG'),(2,3,'000002_03.JPG'),(2,4,'000002_04.JPG'),(3,1,'000003_01.JPG'),(3,2,'000003_02.JPG'),(3,3,'000003_03.JPG'),(3,4,'000003_04.JPG'),(4,1,'A1.JPG'),(4,2,'A2.JPG'),(4,3,'A3.JPG'),(4,4,'A4.JPG');

INSERT INTO `article` VALUES (1,1,9,11,1,null,1),(1,2,10,11,2,null,1),(1,3,11,11,1,null,1),(2,1,9,11,1,null,1),(2,2,10,11,2,null,1),(2,3,11,11,1,null,1),(3,1,17,6,1,null,1),(3,2,18,6,2,null,1),(3,3,19,6,1,null,1),(4,1,17,4,1,null,1),(4,2,18,4,2,null,1),(4,3,19,4,1,null,1);


INSERT INTO `product` VALUES (881,1,14,6,800,50,'A881.JPG',1,'2014-03-26 00:00:00');
INSERT INTO `product_description` VALUES (881,'it','JEANS IN COTONE STRETCH 16.5CM');
INSERT INTO `product_image` VALUES (881,1,'A881.JPG'),(881,2,'A882.JPG'),(881,3,'C881.JPG'),(881,4,'C882.JPG');
INSERT INTO `article` VALUES (881,1,17,3,1,'A882.JPG',1),(881,2,18,3,2,'A882.JPG',1),(881,3,19,3,1,'A882.JPG',1),(881,4,20,6,1,'A881.JPG',1),(881,5,21,6,2,'A881.JPG',1),(881,6,22,6,1,'A881.JPG',1);

INSERT INTO `states` VALUES (1,'INSERITO'),(2,'IN LAVORAZIONE'),(3,'PAGATO'),(4,'SPEDITO'),(5,'ANNULLATO'),(6,'RECESSO');

INSERT INTO `type_state_account`
VALUES
(1,'DISATTIVATO'),(2,'ATTIVATO'),(3,'CESSATO'),(4,'RESET_PSW');


INSERT INTO `othala`.`customer` (`idUser`, `txPassword`, `txNome`, `txCognome`, `txFiscale`, `idTypeState`) VALUES ('1', 'ANTANI', 'JACOPO', 'FREDIANI', 'FRDJCP79A28I726A', 2);
INSERT INTO `othala`.`addresses` (`idAddress`, `idUser`, `txNome`, `txCognome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`, `fgDeleted`, `txEtichetta`) VALUES (1, '1', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', 53100, 'SI', 'ITALIA', '3392113342', 0, 'CASA');
INSERT INTO `othala`.`orders` (`idOrder`, `idUser`, `imOrdine`, `imSpeseSpedizione`, `idTransaction`, `idAddressFat`, `idAddressSpe`) VALUES (1, '1', 1000.00, 5.00, '1', 1, 1);
INSERT INTO `othala`.`orders_articles` (`idOrder`, `idProdotto`, `pgArticle`, `qtArticle`) VALUES (1, 1, 1, 1);

INSERT INTO `othala`.`orders_articles` (`idOrder`, `idProdotto`, `pgArticle`, `qtArticle`) VALUES (1, 881, 1, 1);

INSERT INTO `othala`.`states_orders` (`idOrder`, `idStato`, `dtStato`) VALUES (1, 2, '2014-05-02');


INSERT INTO `othala`.`delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`) VALUES (1, 'Corriere Espresso Bartolini', 5.00);

INSERT INTO `othala`.`delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`) VALUES (2, 'Corriere Espresso SDA', 5.00);

INSERT INTO `othala`.`delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`) VALUES (3, 'Posta Ordinaria', 3.00);

INSERT INTO `othala`.`delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`) VALUES (4, 'Posta Raccomandata', 4.00);


