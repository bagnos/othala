INSERT INTO `attribute` VALUES (1,'it','GENERE'),(2,'it','TIPOLOGIA'),(3,'it','COLORI'),(4,'it','TAGLIE'),(5,'it','DESIGNER');
INSERT INTO `valori_attributo` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(2,5),(3,5),(4,5),(5,5),(2,6),(3,6),(4,6),(2,7),(3,7),(4,7),(2,8),(3,8),(4,8),(2,9),(3,9),(4,9),(2,10),(3,10),(4,10),(2,11),(3,11),(4,11),(2,12),(3,12),(4,12),(2,13),(3,13),(4,13),(2,14),(3,14),(4,14),(2,15),(3,15),(4,15),(2,16),(3,16),(4,16),(2,17),(4,17),(2,18),(4,18),(2,19),(4,19),(2,20),(4,20),(2,21),(4,21),(2,22),(4,22),(5,6);
INSERT INTO `valori_attributo_languages` VALUES (1,1,'it','UOMO'),(2,1,'it','ACCESSORI'),(3,1,'it','ARANCIONE'),(4,1,'it','34'),(5,1,'it','LANVIN'),(1,2,'it','DONNA'),(2,2,'it','BERMUDA'),(3,2,'it','ARGENTO'),(4,2,'it','36'),(5,2,'it','BALMAIN'),(1,3,'it','BAMBINO'),(2,3,'it','CAMICIE'),(3,3,'it','BEIGE'),(4,3,'it','38'),(5,3,'it','DSQUARED'),(1,4,'it','BAMBINA'),(2,4,'it','CAPPOTTI'),(3,4,'it','BIANCO'),(4,4,'it','40'),(5,4,'it','MOSCHINO'),(2,5,'it','COMPLETI'),(3,5,'it','BLU'),(4,5,'it','42'),
(5,5,'it','DOLCE E GABBANA'),(5,6,'it','STONE ISLAND'),(2,6,'it','COSTUMI DA BAGNO'),(3,6,'it','CELESTE'),(4,6,'it','44'),
(2,7,'it','FELPE'),(3,7,'it','DENIM'),(4,7,'it','46'),(2,8,'it','GIACCHE'),(3,8,'it','GIALLO'),
(4,8,'it','48'),(2,9,'it','GIACCHE DI PELLE'),(3,9,'it','GRIGIO'),(4,9,'it','50'),
(2,10,'it','GILET'),(3,10,'it','MARRONE'),(4,10,'it','52'),(2,11,'it','GIUBBOTTI'),
(3,11,'it','NERO'),(4,11,'it','54'),(2,12,'it','GONNE'),(3,12,'it','ORO'),(4,12,'it','56'),(2,13,'it','INTIMO'),
(3,13,'it','ROSA'),(4,13,'it','58'),(2,14,'it','JEANS'),(3,14,'it','ROSSO'),(4,14,'it','60'),(2,15,'it','MAGLIERIA'),
(3,15,'it','VERDE'),(4,15,'it','XXS'),(2,16,'it','PANTALONI'),(3,16,'it','VIOLA'),(4,16,'it','XS'),
(2,17,'it','PELLICCE E SHEARLING'),(4,17,'it','S'),(2,18,'it','PIUMINI'),(4,18,'it','M'),(2,19,'it','POLO'),
(4,19,'it','L'),(2,20,'it','SCARPE'),(4,20,'it','XL'),(2,21,'it','T-SHIRTS'),(4,21,'it','XXL'),(2,22,'it','VESTITI'),
(4,22,'it','U');
INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO');

INSERT INTO `product` VALUES (1,1200,50,1,'2014-03-18','000001_01.JPG'),(2,1345,50,1,'2014-03-01','000002_01.JPG');
INSERT INTO `product_description` VALUES (1,'it','GIACCA SMOKING \"BEVERLY HILLS\" IN VELLUTO'),(2,'it','GIACCA MISTO LANA');
INSERT INTO `product_attribute` VALUES (1,1,1),(2,1,1),(1,2,8),(2,2,8),(1,5,1),(2,5,2);

INSERT INTO `article` VALUES (1,1,1),(1,2,2),(1,3,1),(2,1,1),(2,2,1),(2,3,1);
INSERT INTO `article_attribute` VALUES (1,1,3,11),(1,2,3,11),(1,3,3,11),(2,1,3,11),(2,2,3,11),(2,3,3,11),(1,1,4,8),(1,2,4,9),(1,3,4,10),(2,1,4,17),(2,2,4,18),(2,3,4,19);

INSERT INTO `product_image` VALUES (1,1,'000001_01.JPG'),(1,2,'000001_02.JPG'),(1,3,'000001_03.JPG'),(1,4,'000001_04.JPG'),(2,1,'000002_01.JPG'),(2,2,'000002_02.JPG'),(2,3,'000002_03.JPG'),(2,4,'000002_04.JPG');


INSERT INTO `product` VALUES (3,463,40,1,'2014-03-19','000003_01.JPG');
INSERT INTO `product_description` VALUES (3,'it','GIACCHETTO IN MUSSOLA DI COTONE GOMMATA TINTA IN CAPO');
INSERT INTO `product_attribute` VALUES (3,1,1),(3,2,11),(3,5,6);

INSERT INTO `article` VALUES (3,1,1),(3,2,2);
INSERT INTO `article_attribute` VALUES (3,1,3,9),(3,1,4,9),(3,2,3,6),(3,2,4,6);

INSERT INTO `product_image` VALUES (3,1,'000003_01.JPG'),(3,2,'000003_02.JPG'),(3,3,'000003_03.JPG'),(3,4,'000003_04.JPG');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (1, 'carousel', 1, 'images/carousel', '2.jpg');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (2, 'carousel', 2, 'images/carousel', '3.jpg');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (3, 'carousel', 3, 'images/carousel', '2.jpg');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (4, 'carousel', 4, 'images/carousel', '3.jpg');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (5, 'newArrivals', 1, 'images/newArrivals', 'men.gif');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (6, 'newArrivals', 2, 'images/newArrivals', 'woman.gif');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (7, 'newArrivals', 3, 'images/newArrivals', 'boys.gif');

INSERT INTO `othala`.`site_images` (`idsiteImages`, `txGroupImages`, `pgGroupImages`, `txLibrary`, `txName`) VALUES (8, 'newArrivals', 4, 'images/newArrivals', 'girls.gif');

