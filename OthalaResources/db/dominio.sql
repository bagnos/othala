
INSERT INTO gender VALUES    
(1,'it','UOMO'),(2,'it','DONNA'),(3,'it','BAMBINO'),(4,'it','BAMBINA');
INSERT INTO brand VALUES    
(1,'it','LANVIN'),(2,'it','BALMAIN'),(3,'it','DSQUARED'),(4,'it','MOSCHINO'),(5,'it','DOLCE E GABBANA'),(6,'it','STONE ISLAND');




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
(1, '34'),  (2,'36'),  (3,'38'), (4,'40'),
(5, '42'),  (6,'44'),  (7,'46'), (8,'48'), (9,'50'),
(10,'52'), (11,'54'), (12,'56'),(13,'58'),(14,'60'),
(15,'XXS'),(16,'XS'), (17,'S'), (18,'M'), (19,'L'),
(20,'XL') ,(21,'XXL'),(22,'U');

INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO');
INSERT INTO `site_images` VALUES (1,'carousel',1,'images/carousel','2.jpg'),(2,'carousel',2,'images/carousel','3.jpg'),(3,'carousel',3,'images/carousel','2.jpg'),(4,'carousel',4,'images/carousel','3.jpg'),(5,'newArrivals',1,'images/newArrivals','men.gif'),(6,'newArrivals',2,'images/newArrivals','woman.gif'),(7,'newArrivals',3,'images/newArrivals','boys.gif'),(8,'newArrivals',4,'images/newArrivals','girls.gif');


INSERT INTO `product` VALUES (1,1,8,1, 1200,50,'000001_01.JPG',1,'2014-03-18 00:00:00');
INSERT INTO `product` VALUES (2,1,8,2, 1345,50,'000002_01.JPG',1,'2014-03-01 00:00:00');
INSERT INTO `product` VALUES (3,1,11,3,463,40,'000003_01.JPG',1,'2014-03-19 00:00:00');
INSERT INTO `product` VALUES (4,1,21,4,795,30,'A1.JPG',1,'2014-03-26 12:12:51');

INSERT INTO `product_description` VALUES (1,'it','GIACCA SMOKING \"BEVERLY HILLS\" IN VELLUTO'),(2,'it','GIACCA MISTO LANA'),(3,'it','GIACCHETTO IN MUSSOLA DI COTONE GOMMATA TINTA IN CAPO'),(4,'it','T-SHIRT IN MISTO VISCOSA E SETA');

INSERT INTO `product_image` VALUES (1,1,'000001_01.JPG'),(1,2,'000001_02.JPG'),(1,3,'000001_03.JPG'),(1,4,'000001_04.JPG'),(2,1,'000002_01.JPG'),(2,2,'000002_02.JPG'),(2,3,'000002_03.JPG'),(2,4,'000002_04.JPG'),(3,1,'000003_01.JPG'),(3,2,'000003_02.JPG'),(3,3,'000003_03.JPG'),(3,4,'000003_04.JPG'),(4,1,'A1.JPG'),(4,2,'A2.JPG'),(4,3,'A3.JPG'),(4,4,'A4.JPG');

INSERT INTO `article` VALUES (1,1,9,11,1),(1,2,10,11,2),(1,3,11,11,1),(2,1,9,11,1),(2,2,10,11,2),(2,3,11,11,1),(3,1,17,6,1),(3,2,18,6,2),(3,3,19,6,1),(4,1,17,4,1),(4,2,18,4,2),(4,3,19,4,1);


INSERT INTO `product` VALUES (881,1,14,6,800,50,'A881.JPG',1,'2014-03-26 00:00:00');
INSERT INTO `product_description` VALUES (881,'it','JEANS IN COTONE STRETCH 16.5CM');
INSERT INTO `product_image` VALUES (881,1,'A881.JPG'),(881,2,'A882.JPG'),(881,3,'C881.JPG'),(881,4,'C882.JPG');
INSERT INTO `article` VALUES (881,1,17,3,1),(881,2,18,3,2),(881,3,19,3,1),(881,4,17,6,1),(881,5,18,6,2),(881,6,19,6,1);



