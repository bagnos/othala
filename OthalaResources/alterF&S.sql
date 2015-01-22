SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE `article` 
	ADD COLUMN `imPrice` decimal(15,2)   NULL after `txBarCode` , 
	ADD COLUMN `specialPrice` decimal(15,2)   NULL after `imPrice` , 
	ADD COLUMN `pcDiscount` int(11)   NULL after `specialPrice` ;

ALTER TABLE `brand` 
	ADD COLUMN `idRegione` int(11)   NULL after `txBrand` , 
	ADD COLUMN `idProvincia` int(11)   NULL after `idRegione` , 
	ADD COLUMN `idUser` varchar(100)  NULL after `idProvincia` , 
	ADD COLUMN `urlFoto` varchar(100)  NULL after `idUser` ;


CREATE TABLE `brand_descr`(
	`idBrand` int(11) NOT NULL  , 
	`idLanguages` varchar(2) COLLATE utf8_general_ci NOT NULL  , 
	`txDescrizione` varchar(1000) COLLATE utf8_general_ci NULL  , 
	PRIMARY KEY (`idBrand`,`idLanguages`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';



CREATE TABLE `infaggiuntive`(
	`idInformazione` int(11) NOT NULL  , 
	`idLanguages` varchar(2) NOT NULL  , 
	`txInformazione` varchar(45) NULL  , 
	PRIMARY KEY (`idInformazione`,`idLanguages`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';



ALTER TABLE `orders_articles` 
	ADD COLUMN `imArticle` decimal(15,2)   NULL after `qtArticle` ;

ALTER TABLE `refound_articles` 
	ADD COLUMN `imArticle` decimal(15,2)   NULL after `pgArticleNew` ;


ALTER TABLE `product` 
	ADD COLUMN `tyProduct` int(11)   NULL after `specialPrice` ;


CREATE TABLE `product_info`(
	`idProduct` int(11) NOT NULL  , 
	`idInformazione` int(11) NOT NULL  , 
	`idLanguages` varchar(2) NOT NULL  , 
	`txDescrizione` varchar(100) NULL  , 
	PRIMARY KEY (`idProduct`,`idInformazione`,`idLanguages`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';



CREATE TABLE `provincia`(
	`idProvincia` int(11) NOT NULL  , 
	`txProvincia` varchar(100) NULL  , 
	`idRegione` int(11) NOT NULL  , 
	PRIMARY KEY (`idProvincia`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';



CREATE TABLE `regione`(
	`idregione` int(11) NOT NULL  , 
	`txRegione` varchar(45) NULL  , 
	PRIMARY KEY (`idregione`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8' ;

ALTER TABLE `orders_articles` ADD COLUMN `txOrderArticle` VARCHAR(10000) NULL DEFAULT NULL  AFTER `imArticle` ;



INSERT INTO `provincia` VALUES (1,'Ancona',1),(2,'Macerata',1),(3,'Pesaro Urbino',1),(4,'Ascoli Piceno',1),(5,'Alessandria',13),(6,'Asti',13),(7,'Biella',13),(8,'Cuneo',13),(9,'Novara',13),(10,'Vercelli',13),(11,'Torino',13),(12,'Agrigento',11),(13,'Caltanissetta',11),(14,'Catania',11),(15,'Enna',11),(16,'Messina',11),(17,'Palermo',11),(18,'Ragusa',11),(19,'Siracusa',11),(20,'Trapani',11),(21,'Catanzaro',7),(22,'Cosenza',7),(23,'Crotone',7),(24,'Reggio Calabria',7),(25,'Vibo Valentia',7),(27,'Matera',3),(28,'Potenza',3),(29,'Bari',6),(30,'Brindisi',6),(31,'Foggia',6),(32,'Lecce',6),(33,'Taranto',6),(34,'Avellino',8),(35,'Benevento',8),(36,'Caserta',8),(37,'Napoli',8),(38,'Salerno',8),(39,'Frosinone',9),(40,'Latina',9),(41,'Rieti',9),(42,'Roma',9),(43,'Viterbo',9),(44,'Chieti',2),(45,'L\'Aquila',2),(46,'Pescara',2),(47,'Teramo',2),(48,'Arezzo',12),(49,'Firenze',12),(50,'Grosseto',12),(51,'Livorno',12),(52,'Lucca',12),(53,'Massa Carrara',12),(54,'Pisa',12),(55,'Pistoia',12),(56,'Siena',12),(57,'Bologna',14),(58,'Ferrara',14),(59,'Forlì Cesena',14),(60,'Modena',14),(61,'Parma',14),(62,'Piacenza',14),(63,'Ravenna',14),(64,'Reggio Emilia',14),(65,'Rimini',14),(66,'Belluno',17),(67,'Padova',17),(68,'Rovigo',17),(69,'Treviso',17),(70,'Venezia',17),(71,'Verona',17),(72,'Vicenza',17),(73,'Gorizia',15),(74,'Pordenone',15),(75,'Udine',15),(76,'Trieste',15),(77,'Aosta',16),(78,'Cagliari',10),(79,'Nuoro',10),(80,'Oristano',10),(81,'Sassari',10),(82,'Genova',18),(83,'Imperia',18),(84,'Savona',18),(85,'La Spezia',18),(86,'Isernia',4),(87,'Campobasso',4),(88,'Perugia',20),(89,'Terni',20),(90,'Bergamo',19),(91,'Brescia',19),(92,'Como',19),(93,'Cremona',19),(94,'Lecco',19),(95,'Lodi',19),(96,'Mantova',19),(97,'Milano',19),(98,'Pavia',19),(99,'Sondrio',19),(100,'Varese',19),(101,'Trento',5),(102,'Bolzano',5),(103,'Prato',12),(104,'Verbania',13),(105,'Carbonia Iglesias',10),(106,'Medio Campidano',10),(107,'Ogliastra',10),(108,'Olbia Tempio',10);


INSERT INTO `regione` VALUES (1,'Marche'),(2,'Abruzzo'),(3,'Basilicata'),(4,'Molise'),(5,'Trentino Alto Adige'),(6,'Puglia'),(7,'Calabria'),(8,'Campania'),(9,'Lazio'),(10,'Sardegna'),(11,'Sicilia'),(12,'Toscana'),(13,'Piemonte'),(14,'Emilia Romagna'),(15,'Friuli Venezia Giulia'),(16,'Valle d\'Aosta'),(17,'Veneto'),(18,'Liguria'),(19,'Lombardia'),(20,'Umbria');


UPDATE article a
SET
imPrice = (select imPrice from product b
where a.idProduct = b.idProduct);

UPDATE article a
SET
specialPrice = (select specialPrice from product b
where a.idProduct = b.idProduct);

UPDATE article a
SET
pcDiscount = (select pcDiscount from product b
where a.idProduct = b.idProduct);


SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE orders_articles ADD COLUMN `idOrderArticle` INT(11) NOT NULL AUTO_INCREMENT  FIRST 

, DROP PRIMARY KEY 

, ADD PRIMARY KEY (`idOrderArticle`) ;

ALTER TABLE refound_articles ADD COLUMN `idRefoundArticle` INT(11) NOT NULL AUTO_INCREMENT  FIRST 

, DROP PRIMARY KEY 

, ADD PRIMARY KEY (`idRefoundArticle`) ;

update `orders_articles` a
set imArticle = (select imPrice from article b
where a.idProdotto = b.idProduct
and a.pgArticle = b.pgArticle)
