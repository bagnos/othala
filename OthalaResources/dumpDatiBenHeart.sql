USE `aduna937_othala`;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `addresses` VALUES (1,'jacopo.frediani@gmail.com','JACOPO','FREDIANI','STRADA CASSIA SUD 15/A','SIENA',53100,'SI','ITALIA','3392113342',0,'casa'),(2,'simone.bagnolesi@gmail.com','simone','bagnolesi','via aretina 89','siena',53100,'si','ITALIA','3332965518',0,'casa');
INSERT INTO `article` VALUES (2,1,9,2,1,'08012015113633855&20150108113632775BENHEART1.jpg',1,'1'),(4,1,9,1,1,'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg',1,'2'),(4,2,10,1,1,'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg',1,'2'),(5,1,7,1,1,'thumb20150108153201461&SILVIA--STROPICCIATO-BenHeart_9229_zoom.jpg',1,'3'),(5,2,6,2,1,'thumb20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg',1,'3');
INSERT INTO `brand` VALUES (20,'Benheart');
INSERT INTO `color` VALUES (1,'en','BLACK'),(1,'it','NERO'),(2,'en','DARK BROWN'),(2,'it','TESTA DI MORO'),(3,'en','LEATHER BROWN'),(3,'it','CUOIO');
INSERT INTO `configuration` VALUES ('1','Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo',1);
INSERT INTO `customer` VALUES ('jacopo.frediani@gmail.com','benito79','JACOPO','FREDIANI',NULL,2),('shop@benheart.it','shop@ben','A','A','A',1),('simone.bagnolesi@gmail.com','didone1976','simone','bagnolesi',NULL,2);
INSERT INTO `customer_roles` VALUES ('jacopo.frediani@gmail.com','CUSTOMER'),('shop@benheart.it','AMMINISTRATORE'),('simone.bagnolesi@gmail.com','CUSTOMER');
INSERT INTO `delivery_cost` VALUES (1,'SPEDIZIONE GRATUITA',0.00,0,'GLS Parcel camionistico',NULL),(2,'GLS Zefiro via aerea',9.74,0,'GLS Zefiro via aerea',NULL),(3,'GLS Zefiro via aerea',20.04,0,'GLS Zefiro via aerea',NULL),(4,'GLS Zefiro via aerea',17.19,0,'GLS Zefiro via aerea',NULL),(5,'GLS Zefiro via aerea',17.43,0,'GLS Zefiro via aerea',NULL),(6,'GLS Zefiro via aerea',19.56,0,'GLS Zefiro via aerea',NULL),(7,'GLS Zefiro via aerea',34.15,0,'GLS Zefiro via aerea',NULL),(8,'GLS Zefiro via aerea',48.94,0,'GLS Zefiro via aerea',NULL),(9,'GLS Zefiro via aerea',49.46,0,'GLS Zefiro via aerea',NULL),(10,'GLS Parcel camionistico',13.80,0,'GLS Parcel camionistico',NULL),(11,'GLS Parcel camionistico',14.05,0,'GLS Parcel camionistico',NULL),(12,'GLS Parcel camionistico',15.70,0,'GLS Parcel camionistico',NULL),(13,'GLS Parcel camionistico',16.76,0,'GLS Parcel camionistico',NULL),(14,'GLS Parcel camionistico',17.25,0,'GLS Parcel camionistico',NULL),(15,'GLS Parcel camionistico',18.97,0,'GLS Parcel camionistico',NULL),(16,'GLS Parcel camionistico',19.35,0,'GLS Parcel camionistico',NULL),(17,'GLS Parcel camionistico',20.45,0,'GLS Parcel camionistico',NULL),(18,'GLS Parcel camionistico',21.48,0,'GLS Parcel camionistico',NULL),(19,'GLS Parcel camionistico',23.66,0,'GLS Parcel camionistico',NULL),(20,'GLS Parcel camionistico',25.88,0,'GLS Parcel camionistico',NULL),(21,'GLS Parcel camionistico',27.46,0,'GLS Parcel camionistico',NULL),(22,'GLS Parcel camionistico',28.34,0,'GLS Parcel camionistico',NULL),(23,'GLS Parcel camionistico',28.59,0,'GLS Parcel camionistico',NULL),(24,'GLS Parcel camionistico',30.68,0,'GLS Parcel camionistico',NULL),(25,'GLS Parcel camionistico',31.45,0,'GLS Parcel camionistico',NULL),(26,'GLS Parcel camionistico',36.73,0,'GLS Parcel camionistico',NULL),(27,'GLS Parcel camionistico',40.91,0,'GLS Parcel camionistico',NULL),(28,'GLS Parcel camionistico',41.35,0,'GLS Parcel camionistico',NULL),(29,'GLS Parcel camionistico',45.30,0,'GLS Parcel camionistico',NULL);
INSERT INTO `delivery_nazioni` VALUES (1,'ITALIA',NULL),(2,'Austria',NULL),(2,'Belgium',NULL),(2,'Denmark',NULL),(2,'Finland',NULL),(2,'France',NULL),(2,'Germany',NULL),(2,'Greece',NULL),(2,'Ireland',NULL),(2,'Luxembourg',NULL),(2,'Monaco',NULL),(2,'Netherlands',NULL),(2,'Portugal',NULL),(2,'Spain',NULL),(2,'Sweden',NULL),(2,'United Kingdom',NULL),(3,'Bulgaria',NULL),(3,'Croatia',NULL),(3,'Cyprus',NULL),(3,'Czech Republic',NULL),(3,'Estonia',NULL),(3,'Hungary',NULL),(3,'Latvia',NULL),(3,'Lithuania',NULL),(3,'Malta',NULL),(3,'Poland',NULL),(3,'Romania',NULL),(3,'Slovakia',NULL),(3,'Slovenia',NULL),(4,'Andorra',NULL),(4,'Gibraltar',NULL),(4,'Switzerland',NULL),(5,'Canary Islands',NULL),(5,'Faroe Islands',NULL),(5,'Guernsey',NULL),(5,'Iceland',NULL),(5,'Jersey',NULL),(5,'Norway',NULL),(6,'Canada',NULL),(6,'United States',NULL),(7,'American Samoa',NULL),(7,'Anguilla',NULL),(7,'Antigua and Barbuda',NULL),(7,'Argentina',NULL),(7,'Aruba',NULL),(7,'Australia',NULL),(7,'Bahamas',NULL),(7,'Bahrain',NULL),(7,'Bangladesh',NULL),(7,'Barbados',NULL),(7,'Belize',NULL),(7,'Bermuda',NULL),(7,'Bolivia',NULL),(7,'Bonaire',NULL),(7,'Brazil',NULL),(7,'Brunei Darussalam',NULL),(7,'Cameroon',NULL),(7,'Cayman Islands',NULL),(7,'Chile',NULL),(7,'Colombia',NULL),(7,'Costa Rica',NULL),(7,'Curacao',NULL),(7,'Dominica',NULL),(7,'Dominican Republic',NULL),(7,'Ecuador',NULL),(7,'Egypt',NULL),(7,'El Salvador',NULL),(7,'Equatorial Guinea',NULL),(7,'Fiji',NULL),(7,'French Guiana',NULL),(7,'Greenland',NULL),(7,'Grenada',NULL),(7,'Guadeloupe',NULL),(7,'Guam',NULL),(7,'Guatemala',NULL),(7,'Guyana',NULL),(7,'Haiti',NULL),(7,'Honduras',NULL),(7,'Hong Kong',NULL),(7,'India',NULL),(7,'Indonesia',NULL),(7,'Ivory Coast',NULL),(7,'Jamaica',NULL),(7,'Japan',NULL),(7,'Kenya',NULL),(7,'Kuwait',NULL),(7,'Macao',NULL),(7,'Malaysia',NULL),(7,'Maldives',NULL),(7,'Martinique',NULL),(7,'Mexico',NULL),(7,'Micronesia',NULL),(7,'Montserrat',NULL),(7,'Nevis',NULL),(7,'New Caledonia',NULL),(7,'New Zealand',NULL),(7,'Nigeria',NULL),(7,'Oman',NULL),(7,'Pakistan',NULL),(7,'Palau',NULL),(7,'Panama',NULL),(7,'Paraguay',NULL),(7,'Peru',NULL),(7,'Philippines',NULL),(7,'Puerto Rico',NULL),(7,'Qatar',NULL),(7,'Saint Barthelemy',NULL),(7,'Saint Eustatius',NULL),(7,'Saint Kitts and Nevis',NULL),(7,'Saint Lucia',NULL),(7,'Saint Maarten',NULL),(7,'Saint Vincent e Grenadine',NULL),(7,'Samoa',NULL),(7,'Saudi Arabia',NULL),(7,'Senegal',NULL),(7,'Singapore',NULL),(7,'South Africa',NULL),(7,'South Korea',NULL),(7,'Sri Lanka',NULL),(7,'Suriname',NULL),(7,'Tahiti',NULL),(7,'Taiwan',NULL),(7,'Thailand',NULL),(7,'Trinidad and Tobago',NULL),(7,'Turkey',NULL),(7,'United Arab Emirates',NULL),(7,'Uruguay',NULL),(7,'Venezuela',NULL),(7,'Virgin Islands',NULL),(8,'Algeria',NULL),(8,'Benin',NULL),(8,'Bhutan',NULL),(8,'Botswana',NULL),(8,'Burkina Faso',NULL),(8,'Burundi',NULL),(8,'Cambodia',NULL),(8,'Cape Verde',NULL),(8,'Center Africa',NULL),(8,'Chad',NULL),(8,'China',NULL),(8,'Comoros',NULL),(8,'Congo',NULL),(8,'Cook Islands',NULL),(8,'Djibouti',NULL),(8,'East Timor',NULL),(8,'Eritrea',NULL),(8,'Ethiopia',NULL),(8,'Gabon',NULL),(8,'Gambia',NULL),(8,'Ghana',NULL),(8,'Guinea',NULL),(8,'Guinea-Bissau',NULL),(8,'Iraq',NULL),(8,'Israel',NULL),(8,'Jordan',NULL),(8,'Lao',NULL),(8,'Lebanon',NULL),(8,'Lesotho',NULL),(8,'Liberia',NULL),(8,'Libya',NULL),(8,'Madagascar',NULL),(8,'Malawi',NULL),(8,'Mali',NULL),(8,'Marshall Islands',NULL),(8,'Mauritania',NULL),(8,'Mauritius',NULL),(8,'Mayotte',NULL),(8,'Morocco',NULL),(8,'Namibia',NULL),(8,'Nauru',NULL),(8,'Nepal',NULL),(8,'Nicaragua',NULL),(8,'Niger',NULL),(8,'Papua New Guinea',NULL),(8,'Reunion Island',NULL),(8,'Rwanda',NULL),(8,'Saipan',NULL),(8,'Seychelles',NULL),(8,'Sierra Leone',NULL),(8,'Somalia',NULL),(8,'Swaziland',NULL),(8,'Syria',NULL),(8,'Tanzania',NULL),(8,'Togo',NULL),(8,'Tonga',NULL),(8,'Tunisia',NULL),(8,'Turks and Caicos Islands',NULL),(8,'Tuvalu',NULL),(8,'Uganda',NULL),(8,'Vanuatu',NULL),(8,'Vietnam',NULL),(8,'Yemen',NULL),(8,'Zambia',NULL),(8,'Zimbabwe',NULL),(9,'Afghanistan',NULL),(9,'Albania',NULL),(9,'Angola',NULL),(9,'Armenia',NULL),(9,'Azerbaijan',NULL),(9,'Belarus',NULL),(9,'Bosnia and Herzegovina',NULL),(9,'Cuba',NULL),(9,'Falkland Islands',NULL),(9,'Georgia',NULL),(9,'Iran',NULL),(9,'Kazakhstan',NULL),(9,'Kiribati',NULL),(9,'Kosovo',NULL),(9,'Kyrgyzstan',NULL),(9,'Macedonia',NULL),(9,'Moldova',NULL),(9,'Mongolia',NULL),(9,'Montenegro',NULL),(9,'Mozambique',NULL),(9,'Myanmar, Burma',NULL),(9,'Niue',NULL),(9,'North Korea',NULL),(9,'Russian Federation',NULL),(9,'Serbia',NULL),(9,'Solomon Islands',NULL),(9,'South Sudan',NULL),(9,'Sudan',NULL),(9,'Tajikistan',NULL),(9,'Ukraine',NULL),(9,'Uzbekistan',NULL),(10,'Austria',NULL),(11,'Belgium',NULL),(12,'France',NULL),(12,'Germany',NULL),(12,'Luxembourg',NULL),(12,'Netherlands',NULL),(13,'Liechtenstein',NULL),(14,'Switzerland',NULL),(15,'Denmark',NULL),(15,'Slovenia',NULL),(16,'England',NULL),(16,'Galles',NULL),(16,'Scotland',NULL),(17,'Hungary',NULL),(18,'Croatia',NULL),(18,'Serbia',NULL),(19,'Poland',NULL),(20,'Czech Republic',NULL),(20,'Spain',NULL),(21,'Sweden',NULL),(22,'Slovakia',NULL),(23,'Bulgaria',NULL),(23,'Estonia',NULL),(23,'Latvia',NULL),(23,'Lithuania',NULL),(23,'Norway',NULL),(23,'Portugal',NULL),(23,'Romania',NULL),(24,'Ireland',NULL),(25,'Finland',NULL),(26,'Turkey',NULL),(27,'Greece',NULL),(28,'Nord Ireland',NULL),(29,'Cyprus',NULL),(29,'Malta',NULL);
INSERT INTO `gender` VALUES (1,'en','Man'),(1,'it','Uomo'),(2,'en','Woman'),(2,'it','Donna'),(3,'en','Unisex'),(3,'it','Unisex');
INSERT INTO `group_images` VALUES ('carousel','images/home',20,761,1140,0),('new','images/home',1,130,260,0),('newArrivals','images/home',6,580,580,1),('promo','images/home',1,130,260,0),('tabNav','images/home',6,130,260,1);
INSERT INTO `material` VALUES (1,'en','SHEEPSKIN LEATHER'),(1,'it','PELLE DI MONTONE');
INSERT INTO `nazioni` VALUES ('Afghanistan','en'),('Albania','en'),('Algeria','en'),('American Samoa','en'),('Andorra','en'),('Angola','en'),('Anguilla','en'),('Antigua and Barbuda','en'),('Argentina','en'),('Armenia','en'),('Aruba','en'),('Australia','en'),('Austria','en'),('Azerbaijan','en'),('Bahamas','en'),('Bahrain','en'),('Bangladesh','en'),('Barbados','en'),('Belarus','en'),('Belgium','en'),('Belize','en'),('Benin','en'),('Bermuda','en'),('Bhutan','en'),('Bolivia','en'),('Bonaire','en'),('Bosnia and Herzegovina','en'),('Botswana','en'),('Brazil','en'),('Brunei Darussalam','en'),('Bulgaria','en'),('Burkina Faso','en'),('Burundi','en'),('Cambodia','en'),('Cameroon','en'),('Canada','en'),('Canary Islands','en'),('Cape Verde','en'),('Cayman Islands','en'),('Center Africa','en'),('Chad','en'),('Chile','en'),('China','en'),('Colombia','en'),('Comoros','en'),('Congo','en'),('Cook Islands','en'),('Costa Rica','en'),('Croatia','en'),('Cuba','en'),('Curacao','en'),('Cyprus','en'),('Czech Republic','en'),('Denmark','en'),('Djibouti','en'),('Dominica','en'),('Dominican Republic','en'),('East Timor','en'),('Ecuador','en'),('Egypt','en'),('El Salvador','en'),('England','en'),('Equatorial Guinea','en'),('Eritrea','en'),('Estonia','en'),('Ethiopia','en'),('Falkland Islands','en'),('Faroe Islands','en'),('Fiji','en'),('Finland','en'),('France','en'),('French Guiana','en'),('Gabon','en'),('Galles','en'),('Gambia','en'),('Georgia','en'),('Germany','en'),('Ghana','en'),('Gibraltar','en'),('Greece','en'),('Greenland','en'),('Grenada','en'),('Guadeloupe','en'),('Guam','en'),('Guatemala','en'),('Guernsey','en'),('Guinea','en'),('Guinea-Bissau','en'),('Guyana','en'),('Haiti','en'),('Honduras','en'),('Hong Kong','en'),('Hungary','en'),('Iceland','en'),('India','en'),('Indonesia','en'),('Iran','en'),('Iraq','en'),('Ireland','en'),('Israel','en'),('ITALIA','it'),('Ivory Coast','en'),('Jamaica','en'),('Japan','en'),('Jersey','en'),('Jordan','en'),('Kazakhstan','en'),('Kenya','en'),('Kiribati','en'),('Kosovo','en'),('Kuwait','en'),('Kyrgyzstan','en'),('Lao','en'),('Latvia','en'),('Lebanon','en'),('Lesotho','en'),('Liberia','en'),('Libya','en'),('Liechtenstein','en'),('Lithuania','en'),('Luxembourg','en'),('Macao','en'),('Macedonia','en'),('Madagascar','en'),('Malawi','en'),('Malaysia','en'),('Maldives','en'),('Mali','en'),('Malta','en'),('Marshall Islands','en'),('Martinique','en'),('Mauritania','en'),('Mauritius','en'),('Mayotte','en'),('Mexico','en'),('Micronesia','en'),('Moldova','en'),('Monaco','en'),('Mongolia','en'),('Montenegro','en'),('Montserrat','en'),('Morocco','en'),('Mozambique','en'),('Myanmar, Burma','en'),('Namibia','en'),('Nauru','en'),('Nepal','en'),('Netherlands','en'),('Nevis','en'),('New Caledonia','en'),('New Zealand','en'),('Nicaragua','en'),('Niger','en'),('Nigeria','en'),('Niue','en'),('Nord Ireland','en'),('North Korea','en'),('Norway','en'),('Oman','en'),('Pakistan','en'),('Palau','en'),('Panama','en'),('Papua New Guinea','en'),('Paraguay','en'),('Peru','en'),('Philippines','en'),('Poland','en'),('Portugal','en'),('Puerto Rico','en'),('Qatar','en'),('Reunion Island','en'),('Romania','en'),('Russian Federation','en'),('Rwanda','en'),('Saint Barthelemy','en'),('Saint Eustatius','en'),('Saint Kitts and Nevis','en'),('Saint Lucia','en'),('Saint Maarten','en'),('Saint Vincent e Grenadine','en'),('Saipan','en'),('Samoa','en'),('Saudi Arabia','en'),('Scotland','en'),('Senegal','en'),('Serbia','en'),('Seychelles','en'),('Sierra Leone','en'),('Singapore','en'),('Slovakia','en'),('Slovenia','en'),('Solomon Islands','en'),('Somalia','en'),('South Africa','en'),('South Korea','en'),('South Sudan','en'),('Spain','en'),('Sri Lanka','en'),('Sudan','en'),('Suriname','en'),('Swaziland','en'),('Sweden','en'),('Switzerland','en'),('Syria','en'),('Tahiti','en'),('Taiwan','en'),('Tajikistan','en'),('Tanzania','en'),('Thailand','en'),('Togo','en'),('Tonga','en'),('Trinidad and Tobago','en'),('Tunisia','en'),('Turkey','en'),('Turks and Caicos Islands','en'),('Tuvalu','en'),('Uganda','en'),('Ukraine','en'),('United Arab Emirates','en'),('United Kingdom','en'),('United States','en'),('Uruguay','en'),('Uzbekistan','en'),('Vanuatu','en'),('Venezuela','en'),('Vietnam','en'),('Virgin Islands','en'),('Yemen','en'),('Zambia','en'),('Zimbabwe','en');
INSERT INTO `product` VALUES (2,1,9,20,460,0,'08012015113633855&20150108113632775BENHEART1.jpg',1,'2015-01-08 11:36:48',NULL,1,NULL),(4,1,9,20,450,0,'thumb20150108152239116&NELSON-LAVATO-BenHeart_626.jpg',1,'2015-01-08 15:23:11',NULL,1,NULL),(5,2,9,20,380,0,'thumb20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg',1,'2015-01-08 15:34:37',NULL,1,NULL);
INSERT INTO `product_description` VALUES (2,'en','LEATHER JACKET'),(2,'it','GIUBBOTTO IN PELLE DI MONTONE TRAFORATO E TRATTATO IN CAPO,CON DUE TASHE E ZIP CENTRALE IN METALLO.COMPOSIZIONE 100% PELLE  100% FODERA VISCOSA.IL NOSTRO MODELLO INDOSSA UNA TG 50 è ALTO 1,80 m E PESA 70 Kg.'),(4,'en','NELSON'),(4,'it','NELSON'),(5,'en','LEATHER JACKET'),(5,'it','GIUBBOTTO IN PELLE DI MONTONE, CON CAPPUCCIO E ZIP ASIMETRICA IN METALLO TRATTATO IN CAPO.COMPOSIZIONE 100% PELLE  100% FODERA VISCOSA.');
INSERT INTO `product_image` VALUES (2,1,'08012015113633855&20150108113632775BENHEART1.jpg'),(2,2,'08012015113634285&20150108113632965BENHEART3.jpg'),(2,3,'08012015113634203&20150108113632957BENHEART2.jpg'),(2,4,'08012015113635019&20150108113632933BENHEART4.jpg'),(4,1,'20150108152239116&NELSON-LAVATO-BenHeart_626.jpg'),(4,2,'20150108152246038&NELSON-LAVATO-BenHeart_6752_zoom.jpg'),(4,3,'20150108152250281&NELSON-LAVATO-BenHeart_6753_zoom.jpg'),(5,1,'20150108153201423&SILVIA--STROPICCIATO-BenHeart_9226_zoom.jpg'),(5,2,'20150108153201461&SILVIA--STROPICCIATO-BenHeart_9229_zoom.jpg'),(5,3,'20150108153201247&SILVIA--STROPICCIATO-BenHeart_393.jpg'),(5,4,'20150108153201324&SILVIA--STROPICCIATO-BenHeart_9224_zoom.jpg');
INSERT INTO `product_state` VALUES (0,'INSERITO'),(1,'PUBBLICATO'),(2,'CANCELLATO');
INSERT INTO `shops` VALUES (1,'Firenze','shop@benheart.it','Benheart','Via il Prato, 25/R','Firenze',53100,'FI','Italia','+39 055 2808625');
INSERT INTO `site_images` VALUES ('carousel',1,'08012015113732041&2.jpg',NULL,NULL,'BENHEART'),('carousel',2,'08012015113732015&3.jpg',NULL,NULL,'BENHEART'),('carousel',3,'08012015113731971&1.jpg',NULL,NULL,'BENHEART'),('carousel',4,'08012015113732089&4.jpg',NULL,NULL,'BENHEART'),('new',1,'08012015120648232&10325518_814516745236786_7806860005336622871_n.jpg',NULL,NULL,'benheart'),('newArrivals',1,'07012015200754320&new2.jpg',2,'/cart/cart-catalog.xhtml?idMenu=2&fgNewArrivals=true&idSubMenu=0&idCampaign=0','woman leather jacker'),('newArrivals',2,'07012015200813081&new1.jpg',1,'/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0','man leather shoes'),('promo',1,'08012015120718485&2.jpg',NULL,NULL,'benheart'),('tabNav',1,'08012015113907607&1157713_822616991093428_3203441439479633186_n.jpg',1,NULL,'benheart'),('tabNav',2,'08012015114111643&10014606_731760920179036_288184332859304600_n.jpg',2,NULL,'BENHEART'),('tabNav',3,'08012015114200860&car1.jpg',3,NULL,'benheart');
INSERT INTO `size` VALUES (1,'34'),(2,'36'),(3,'38'),(4,'40'),(5,'42'),(6,'44'),(7,'46'),(8,'48'),(9,'50'),(10,'52'),(11,'54'),(12,'56'),(13,'58'),(14,'60'),(15,'XXS'),(16,'XS'),(17,'S'),(18,'M'),(19,'L'),(20,'XL'),(21,'XXL'),(22,'U'),(24,'35'),(26,'37'),(28,'39'),(30,'41'),(32,'43'),(34,'45'),(36,'47'),(37,'24'),(38,'25'),(39,'26'),(40,'27'),(41,'28'),(42,'29'),(43,'30'),(44,'31'),(45,'32'),(46,'33'),(47,'36 1/2'),(48,'37 1/2'),(49,'38 1/2'),(50,'39 1/2');
INSERT INTO `states` VALUES (1,'INSERITO'),(2,'CANCELEDREVERSAL'),(3,'COMPLETED'),(4,'DENIED'),(5,'EXPIRED'),(6,'FAILED'),(7,'INPROGRESS'),(8,'PARTIALLYREFUNDED'),(9,'PENDING'),(10,'REFUNDED'),(11,'REVERSED'),(12,'PROCESSED'),(13,'VOIDED'),(14,'COMPLETEDFUNDSHELD'),(15,'SPEDITO'),(100,'REQUEST REFOUND'),(101,'REFOUND COMPLETED'),(102,'REFOUND REFUSED'),(103,'REFOUND CANCELED'),(200,'REQUEST CHANGE'),(201,'CHANGE COMPLETED'),(202,'CHANGE REFUSED'),(203,'CHANGE CANCELED'),(204,'INSTANT');
INSERT INTO `type` VALUES (1,'en','Accessories'),(1,'it','Accessori'),(9,'en','Leather jackets'),(9,'it','Giacche di pelle'),(15,'en','Knitwear'),(15,'it','Maglieria'),(18,'en','Bags'),(18,'it','Borse'),(20,'en','Shoes'),(20,'it','Scarpe'),(21,'en','Belts'),(21,'it','Cinture'),(22,'en','T-shirt'),(22,'it','T-shirt');
INSERT INTO `type_state_account` VALUES (1,'DISATTIVATO'),(2,'ATTIVATO'),(3,'CESSATO'),(4,'RESET_PSW');
UPDATE `shops` SET `txMail`='jacopo.frediani@gmail.com' WHERE `idShop`='1';
