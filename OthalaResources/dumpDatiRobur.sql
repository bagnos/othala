USE `robur807_othala`;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `addresses` (`idAddress`, `idUser`, `txNome`, `txCognome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`, `fgDeleted`, `txEtichetta`) VALUES
(1, 'jacopo.frediani@gmail.com', 'JACOPO', 'FREDIANI', 'STRADA CASSIA SUD 15/A', 'SIENA', 53100, 'SI', 'ITALIA', '3392113342', 0, 'casa'),
(2, 'simone.bagnolesi@gmail.com', 'simone', 'bagnolesi', 'via aretina 89', 'siena', 53100, 'si', 'ITALIA', '3332965518', 0, 'casa'),
(3, 'ile.tama@hotmail.it', 'roberto', 'boccini', 'via pirro maria gabrielli 3/b', 'siena', 53100, 'si', 'ITALIA', '3398424101', 0, 'casa'),
(4, 'ile.tama@hotmail.it', 'ileana', 'tamagnone', 'via pirro maria gabrielli 3/b', 'siena', 53100, 'si', 'ITALIA', '3313867390', 1, 'casa'),
(5, 'ile.tama@hotmail.it', 'roberto', 'boccini', 'via pirro maria gabrielli 3/b', 'siena', 53100, 'si', 'ITALIA', '3398424101', 1, 'casa'),
(6, 'ile.tama@hotmail.it', 'ileana', 'tamagnone', 'via pirro maria gabrielli 3/b', 'siena', 53100, 'si', 'ITALIA', '3398424101', 0, 'casa'),
(7, 'ffabianelli@alice.it', 'Fausto', 'Fabianelli', 'Strada degli Agostoli, 6', 'Siena', 53100, 'si', 'ITALIA', '3477756834', 0, 'Casa'),
(8, 'fiogigli@alice.it', 'fiorella', 'gigli', 'loc. suzzara 27', 'civitella paganico', 58045, 'gr', 'ITALIA', '3319649681', 0, 'casa'),
(9, 'niccoanfo@libero.it', 'Niccolo', 'Anfosso', 'Via di mezzo 22', 'Ortovero ', 17037, 'Sv ', 'ITALIA', '3888225722', 0, 'Casa '),
(10, 'iandreaf94@gmail.com', 'Andrea', 'Fretta', 'Via Smeraldi 1', 'Basilicanova', 43022, 'PR', 'ITALIA', '3343735084', 0, 'casa'),
(11, 'verdy_b@libero.it', 'Gianpaolo', 'Berti', 'via pastrengo 2', 'colle di val d''elsa', 53034, 'si', 'ITALIA', '3286769969', 0, 'casa'),
(12, 'verdy_b@libero.it', 'Gianpaolo', 'Berti', 'via pastrengo 2', 'colle di val d''elsa', 53034, 'si', 'ITALIA', '3286769969', 0, 'casa'),
(13, 'dtoppini@live.it', 'Donatella', 'Toppini', 'via soccorso saloni 72', 'Montalcino', 53024, 'SI', 'ITALIA', '3472934213', 0, 'Casa'),
(14, 'giannibonomo@hotmail.it', 'gianni', 'bonomo', 'corso matteotti 118', 'cecina', 57023, 'li', 'ITALIA', '3703069640', 0, 'c/o banca etruria'),
(15, 'redhotman@hotmail.it', 'Simone', 'Rossi', 'via Val d''Aosta 20', 'Monteriggioni', 53035, 'SI', 'ITALIA', '3383203180', 0, 'Casa'),
(16, 'f.samori@gmail.com', 'Federico', 'Samorì', 'vle m.f nobiliore 151 sc.h int 13', 'roma', 175, 'RM', 'ITALIA', '3336344701', 0, 'casa'),
(17, 'aliotfran@gmail.com', 'Fortunata', 'Provvedi', 'Barone Ricasoli SpA, Loc. Madonna a Brolio', 'Gaiole in Chianti', 53013, 'SI', 'ITALIA', '3389766856', 0, 'Lavoro'),
(18, 'aliotfran@gmail.com', 'Francesco', 'Alioto', 'Vicolo delle Ginestre 9', 'Sovicille', 53018, 'SI', 'ITALIA', '3356141595', 0, 'Casa'),
(19, 'sandro.adriana@libero.it', 'graziella', 'fabbri\\bianciardi', 'via della galluzza 35', 'siena', 53100, 'si', 'ITALIA', '0577270602', 0, 'casa'),
(20, 'giuseppe@studiofancelli.it', 'giuseppe', 'fancelli', 'piazza la lizza 7', 'siena', 53100, 'si', 'ITALIA', '0577285474', 0, 'lavoro'),
(21, 'ag71si@gmail.com', 'ANDREA', 'GRANAI', 'VIALE MAZZINI 76', 'SIENA', 53100, 'SI', 'ITALIA', '3386237027', 0, 'SIGNOR'),
(22, 'e.cortonesi@libero.it', 'emiliano', 'cortonesi', 'via annio 13', 'viterbo', 1100, 'vt', 'ITALIA', '3933380001', 0, 'casa'),
(23, 'vannini@iltributarista.it', 'Carlo', 'Vannini c/o Studio Sampieri', 'Via Toscana 48', 'Monteriggioni', 53035, 'si', 'ITALIA', '337234340', 0, 'Studio Sampieri '),
(24, 'pantalonesimona@libero.it', 'Bar Marconi di Pantalone Remo', 'Pantalone', 'V.le G. Marconi, 327', 'Pescara', 65126, 'PE', 'ITALIA', '3474704091', 1, 'Lavoro'),
(25, 'pantalonesimona@libero.it', 'Bar Marconi di Pantalone Remo', 'Pantalone', 'V.le G. Marconi, 327', 'Pescara', 65126, 'PE', 'ITALIA', '3474704091', 0, 'Lavoro'),
(26, 'marco.lorenzini87@gmail.com', 'Marco', 'Lorenzini', 'via Giacomo Puccini, 1', 'Siena', 53100, 'SI', 'ITALIA', '3282518847', 0, 'Casa');


INSERT INTO `article` (`idProduct`, `pgArticle`, `idSize`, `idColor`, `qtStock`, `txThumbnailsUrl`, `idShop`, `txBarCode`) VALUES
(141, 1, 9, 5, 599, 'thumb20141215092230103&Robur Vino Rosso.jpeg', 1, '1'),
(142, 1, 4, 3, 16, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(142, 2, 5, 3, 44, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(142, 3, 3, 3, 9, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(142, 4, 6, 3, 17, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(142, 5, 7, 3, 8, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(142, 6, 10, 3, 3, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2'),
(143, 1, 4, 3, 0, 'thumb20141215092939445&proposta-scelta.jpg', 1, '3'),
(143, 2, 11, 3, 17, 'thumb20141215092939445&proposta-scelta.jpg', 1, '3'),
(144, 1, 8, 3, 139, 'thumb20141215093226398&Immagine.png', 1, '4'),
(145, 1, 8, 1, 148, 'thumb20141215094537366&Immagine.png', 1, '6'),
(146, 1, 4, 1, 18, 'thumb20141215094742575&Immagine.png', 1, '7'),
(146, 2, 5, 1, 45, 'thumb20141215094742575&Immagine.png', 1, '7'),
(146, 3, 3, 1, 9, 'thumb20141215094742575&Immagine.png', 1, '7'),
(146, 4, 6, 1, 17, 'thumb20141215094742575&Immagine.png', 1, '7'),
(146, 5, 7, 1, 7, 'thumb20141215094742575&Immagine.png', 1, '7'),
(146, 6, 10, 1, 3, 'thumb20141215094742575&Immagine.png', 1, '7'),
(147, 1, 3, 1, 9, 'thumb20141215094941437&Immagine.png', 1, '8'),
(147, 2, 4, 1, 18, 'thumb20141215094941437&Immagine.png', 1, '8'),
(147, 3, 5, 1, 44, 'thumb20141215094941437&Immagine.png', 1, '8'),
(147, 4, 6, 1, 16, 'thumb20141215094941437&Immagine.png', 1, '8'),
(147, 5, 7, 1, 7, 'thumb20141215094941437&Immagine.png', 1, '8'),
(147, 6, 10, 1, 3, 'thumb20141215094941437&Immagine.png', 1, '8'),
(148, 1, 5, 2, 0, 'thumb20141215223649926&420103_mrp_fr_m2.jpg', 1, '12345678');


INSERT INTO `brand` (`idBrand`, `txBrand`) VALUES
(20, 'Robur Siena');


INSERT INTO `color` (`idColor`, `idLanguages`, `txColor`) VALUES
(1, 'en', 'BLACK'),
(1, 'it', 'NERO'),
(2, 'en', 'WHITE'),
(2, 'it', 'BIANCO'),
(3, 'en', 'WHITE / BLACK'),
(3, 'it', 'BIANCO / NERO'),
(4, 'en', 'RED'),
(4, 'it', 'ROSSO'),
(5, 'en', 'N/A'),
(5, 'it', 'N/A');


INSERT INTO `configuration` (`idConfiguration`, `txConfiguration`, `nrConfiguration`) VALUES
('1', 'Configurazione txBarcode - se 0 a livello di prodotto, se 1 a livello di articolo', 0);


INSERT INTO `customer` (`idUser`, `txPassword`, `txNome`, `txCognome`, `txFiscale`, `idTypeState`) VALUES
('ag71si@gmail.com', '04031971', 'ANDREA', 'GRANAI', NULL, 2),
('aliotfran@gmail.com', 'muvian76', 'Francesco', 'Alioto', NULL, 2),
('andrea.iacopini82@gmail.com', 'ich28zzz', 'Andrea', 'Iacopini', NULL, 2),
('cedipiu@yahoo.it', 'bocajunior', 'alexi', 'serpani', NULL, 2),
('corsfil75@live.it', 'riccardo41', 'filippo', 'corsini', NULL, 2),
('dtoppini@live.it', 'montalcino', 'Donatella ', 'Toppini', NULL, 2),
('e.cortonesi@libero.it', 'ferragosto', 'EMILIANO', 'CORTONESI', NULL, 2),
('f.samori@gmail.com', 'roburpepo1', 'Federico', 'Samorì', NULL, 2),
('ffabianelli@alice.it', 'vivajuve', 'Fausto', 'Fabianelli', NULL, 2),
('fiogigli@alice.it', 'rastrello', 'fiorella', 'gigli', NULL, 2),
('giannibonomo@hotmail.it', 'robur904', 'Gianni', 'Bonomo', NULL, 2),
('giuseppe@studiofancelli.it', 'dade2007', 'giuseppe', 'fancelli', NULL, 2),
('iandreaf94@gmail.com', 'wrockmetal', 'Andrea', 'Fretta', NULL, 2),
('ile.tama@hotmail.it', 'ileana85', 'ileana', 'tamagnone', NULL, 2),
('irenovanta@hotmail.it', 'yuriirene', 'Irene', 'Marzocchi', NULL, 2),
('ittanisenomis@libero.it', 'mone1982', 'simone', 'sinatti', NULL, 2),
('jacopo.frediani@gmail.com', 'benito', 'JACOPO', 'FREDIANI', NULL, 2),
('landino9@libero.it', 'paperone', 'emanuele', 'landi', NULL, 2),
('leonard.97@hotmail.it', 'briciola', 'Leonardo', 'Gallucci', NULL, 2),
('lorenzini_giulio@hotmail.com', 'banana', 'Giulio', 'Lorenzini', NULL, 2),
('m.brogiotti@gmail.com', 'marcogaia', 'Marco', 'Brogiotti', NULL, 2),
('marco.lorenzini87@gmail.com', '19robur04', 'marco', 'lorenzini', NULL, 2),
('maxmasi@hotmail.it', 'mosca51', 'massimo', 'masi', NULL, 2),
('niccoanfo@libero.it', 'Mauro55', 'Niccolo ', 'Anfosso', NULL, 2),
('pantalonesimona@libero.it', 'norvegia', 'simona', 'pantalone', NULL, 2),
('p_swierblewski@o2.pl', 'forzasiena', 'Patryk', '?wierblewski', NULL, 2),
('redhotman@hotmail.it', 'roburshop', 'Simone', 'Rossi', NULL, 2),
('sandro.adriana@libero.it', 'cipocipo', 'alessandro', 'bianciardi', NULL, 2),
('shop@robursienashop.it', 'shop@robur', 'A', 'A', 'A', 1),
('simone.bagnolesi@gmail.com', 'didone1976', 'simone', 'bagnolesi', NULL, 2),
('vannini.sv@gmail.com', '15dicembre', 'Simone', 'Vannini', NULL, 2),
('vannini@iltributarista.it', 'peoro58', 'CARLO', 'VANNINI', NULL, 2),
('verdy_b@libero.it', 'fonzie13', 'Gianpaolo', 'Berti', NULL, 2);


INSERT INTO `customer_roles` (`idUser`, `txRole`) VALUES
('ag71si@gmail.com', 'CUSTOMER'),
('aliotfran@gmail.com', 'CUSTOMER'),
('andrea.iacopini82@gmail.com', 'CUSTOMER'),
('cedipiu@yahoo.it', 'CUSTOMER'),
('corsfil75@live.it', 'CUSTOMER'),
('dtoppini@live.it', 'CUSTOMER'),
('e.cortonesi@libero.it', 'CUSTOMER'),
('f.samori@gmail.com', 'CUSTOMER'),
('ffabianelli@alice.it', 'CUSTOMER'),
('fiogigli@alice.it', 'CUSTOMER'),
('giannibonomo@hotmail.it', 'CUSTOMER'),
('giuseppe@studiofancelli.it', 'CUSTOMER'),
('iandreaf94@gmail.com', 'CUSTOMER'),
('ile.tama@hotmail.it', 'CUSTOMER'),
('irenovanta@hotmail.it', 'CUSTOMER'),
('ittanisenomis@libero.it', 'CUSTOMER'),
('jacopo.frediani@gmail.com', 'CUSTOMER'),
('landino9@libero.it', 'CUSTOMER'),
('leonard.97@hotmail.it', 'CUSTOMER'),
('lorenzini_giulio@hotmail.com', 'CUSTOMER'),
('m.brogiotti@gmail.com', 'CUSTOMER'),
('marco.lorenzini87@gmail.com', 'CUSTOMER'),
('maxmasi@hotmail.it', 'CUSTOMER'),
('niccoanfo@libero.it', 'CUSTOMER'),
('pantalonesimona@libero.it', 'CUSTOMER'),
('p_swierblewski@o2.pl', 'CUSTOMER'),
('redhotman@hotmail.it', 'CUSTOMER'),
('sandro.adriana@libero.it', 'CUSTOMER'),
('shop@robursienashop.it', 'AMMINISTRATORE'),
('simone.bagnolesi@gmail.com', 'CUSTOMER'),
('vannini.sv@gmail.com', 'CUSTOMER'),
('vannini@iltributarista.it', 'CUSTOMER'),
('verdy_b@libero.it', 'CUSTOMER');


INSERT INTO `delivery_cost` (`idDeliveryCost`, `txDescrizione`, `imSpese`, `fgDeleted`, `txDescrizioneExt`, `txLinkTracking`) VALUES
(2, 'PIU'' POSTE - Comune di Siena', '3.70', 0, 'PIU'' POSTE - Comune di Siena', NULL),
(3, 'PIU'' POSTE - Frazione Arbia', '3.70', 0, 'PIU'' POSTE - Frazione Arbia', NULL),
(4, 'PIU'' POSTE - Frazione Casetta', '3.70', 0, 'PIU'' POSTE - Frazione Casetta', NULL),
(5, 'PIU'' POSTE - Frazione Belverde', '3.70', 0, 'PIU'' POSTE - Frazione Belverde', NULL),
(6, 'PIU'' POSTE - Frazione San Rocco', '3.70', 0, 'PIU'' POSTE - Frazione San Rocco', NULL),
(7, 'PIU'' POSTE - Frazione Ponte a Tressa', '3.70', 0, 'PIU'' POSTE - Frazione Ponte a Tressa', NULL),
(8, 'PIU'' POSTE - Frazione Montarioso', '3.70', 0, 'PIU'' POSTE - Frazione Montarioso', NULL),
(9, 'PIU'' POSTE - Altro', '9.00', 0, 'PIU'' POSTE - Altro', NULL),
(9999, 'Ritiro in Sede', '0.00', 0, 'Ritiro in Sede', NULL);



INSERT INTO `delivery_nazioni` (`idDeliveryCost`, `idNazione`, `idAddress`) VALUES
(2, 'ITALIA', NULL),
(3, 'ITALIA', NULL),
(4, 'ITALIA', NULL),
(5, 'ITALIA', NULL),
(6, 'ITALIA', NULL),
(7, 'ITALIA', NULL),
(8, 'ITALIA', NULL),
(9, 'ITALIA', NULL);



INSERT INTO `gender` (`idGender`, `idLanguages`, `txGender`) VALUES
(1, 'en', 'Shop'),
(1, 'it', 'Shop');



INSERT INTO `group_images` VALUES ('carousel','images/home',20,757,1140,0),('new','images/home',1,130,260,0),('newArrivals','images/home',6,580,580,1),('promo','images/home',1,130,260,0),('tabNav','images/home',6,130,260,1);


INSERT INTO `ipnmessages` (`idOrder`, `idTransaction`, `tsInserimento`, `txMessage`, `txStato`, `txNote`, `fgElaborato`, `idRefund`) VALUES
(8, '20A73556X0728015W', '2014-12-16 20:43:09', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=a51c8374253c0;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=20A73556X0728015W;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-7U7839574N4163333;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T20:50:32Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=5623-8404-8316-7784;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T20:50:33Z;', 'Completed', NULL, 0, NULL),
(16, '21D672569W913524K', '2014-12-17 09:49:29', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=3.37;CORRELATIONID=45c1e238c936d;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=21D672569W913524K;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-2W969335LA589100N;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T09:56:52Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=88.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T09:56:54Z;', 'Completed', NULL, 0, NULL),
(13, '2B715742CL165492F', '2014-12-16 21:49:07', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.92;CORRELATIONID=6ed3c035e1019;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2B715742CL165492F;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-35X05613SK788670L;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:56:27Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=75.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:56:31Z;', 'Completed', NULL, 0, NULL),
(12, '2EW0671304010230A', '2014-12-16 21:07:55', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=2fabf1889fb6e;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2EW0671304010230A;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-01S86332D3408773X;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:15:17Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3707-9917-1219-8175;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:15:19Z;', 'Completed', NULL, 0, NULL),
(4, '2W563408SV880020G', '2014-12-16 17:43:16', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.88;CORRELATIONID=5b435f9e4bff9;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=2W563408SV880020G;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4TY04150WE272192J;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T17:50:38Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=15.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=0573-0941-0193-1384;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T17:50:40Z;', 'Completed', NULL, 0, NULL),
(14, '32W1290255584243D', '2014-12-16 21:41:42', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=85514a3f5168f;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=32W1290255584243D;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-5W408073NG999652J;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:49:05Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:49:06Z;', 'Completed', NULL, 0, NULL),
(23, '4FD53572JV142114J', '2014-12-17 12:27:07', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=7a12d7578cc44;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=4FD53572JV142114J;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-7F855783HE504180G;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T12:34:30Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=1875-9474-8992-5034;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T12:34:32Z;', 'Completed', NULL, 0, NULL),
(3, '78A5116396612400C', '2014-12-16 17:12:33', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.07;CORRELATIONID=ee1eaa799ad50;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=78A5116396612400C;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-9BN01448C3699194C;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T17:19:56Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=50.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T17:19:57Z;', 'Completed', NULL, 0, NULL),
(11, '7BF57473CK633591C', '2014-12-16 20:58:01', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=1.56;CORRELATIONID=3fab4bf920f20;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7BF57473CK633591C;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-02X63530T4775283F;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T21:05:24Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=35.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T21:05:25Z;', 'Completed', NULL, 0, NULL),
(7, '7WN47279029339416', '2014-12-16 20:37:45', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=0.99;CORRELATIONID=26bb3225ccb21;SUCCESSPAGEREDIRECTREQUESTED=true;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=7WN47279029339416;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-11187131DR8036446;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T20:45:08Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=18.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;PAYMENTINFO_0_RECEIPTID=3096-4718-5316-1521;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T20:45:09Z;', 'Completed', NULL, 0, NULL),
(15, '8WS47319UU855062U', '2014-12-16 22:36:52', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=d281c446c1ce1;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=8WS47319UU855062U;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-1J9740298A213884D;PAYMENTINFO_0_ERRORCODE=0;BUILD=14107150;PAYMENTINFO_0_ORDERTIME=2014-12-16T22:44:15Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-16T22:44:16Z;', 'Completed', NULL, 0, NULL),
(18, '9PU17797WM344110M', '2014-12-17 11:43:20', 'PAYMENTINFO_0_REASONCODE=None;PAYMENTINFO_0_TAXAMT=0.00;PAYMENTINFO_0_SECUREMERCHANTACCOUNTID=2HUW2R75MNVG2;PAYMENTINFO_0_TRANSACTIONTYPE=cart;PAYMENTINFO_0_FEEAMT=2.18;CORRELATIONID=4bd8b7164b8a;SUCCESSPAGEREDIRECTREQUESTED=false;PAYMENTINFO_0_CURRENCYCODE=EUR;PAYMENTINFO_0_TRANSACTIONID=9PU17797WM344110M;PAYMENTINFO_0_PAYMENTTYPE=instant;VERSION=112.0;PAYMENTINFO_0_PENDINGREASON=None;ACK=Success;TOKEN=EC-4ES8928519719303D;PAYMENTINFO_0_ERRORCODE=0;BUILD=14311110;PAYMENTINFO_0_ORDERTIME=2014-12-17T11:50:43Z;PAYMENTINFO_0_PROTECTIONELIGIBILITY=Ineligible;INSURANCEOPTIONSELECTED=false;PAYMENTINFO_0_AMT=53.70;PAYMENTINFO_0_PAYMENTSTATUS=Completed;PAYMENTINFO_0_ACK=Success;PAYMENTINFO_0_PROTECTIONELIGIBILITYTYPE=None;SHIPPINGOPTIONISDEFAULT=false;TIMESTAMP=2014-12-17T11:50:45Z;', 'Completed', NULL, 0, NULL);



INSERT INTO `material` (`idMaterial`, `idLanguages`, `txMaterial`) VALUES
(1, 'en', 'COTTON'),
(1, 'it', 'COTONE'),
(2, 'en', 'WOOL'),
(2, 'it', 'LANA'),
(3, 'en', 'N/A'),
(3, 'it', 'N/A');


INSERT INTO `nazioni` (`idNazione`, `idLanguages`) VALUES
('ITALIA', 'it');


INSERT INTO `orders` (`idOrder`, `idUser`, `imOrdine`, `idTransaction`, `idAddressFat`, `idAddressSpe`, `idDeliveryCost`, `idTrackingNumber`, `idFidelity`, `idCoupon`, `pcSconto`) VALUES
(3, 'ile.tama@hotmail.it', '50.70', '78A5116396612400C', 6, 6, 2, NULL, NULL, NULL, 0),
(4, 'ffabianelli@alice.it', '15.70', '2W563408SV880020G', 7, 7, 2, NULL, NULL, NULL, 0),
(5, 'niccoanfo@libero.it', '35.70', NULL, 9, 9, 2, NULL, NULL, NULL, 0),
(6, 'iandreaf94@gmail.com', '53.70', NULL, 10, 10, 2, NULL, NULL, NULL, 0),
(7, 'verdy_b@libero.it', '18.70', '7WN47279029339416', 12, 12, 2, NULL, NULL, NULL, 0),
(8, 'dtoppini@live.it', '53.70', '20A73556X0728015W', 13, 13, 2, NULL, NULL, NULL, 0),
(9, 'giannibonomo@hotmail.it', '53.70', NULL, 14, 14, 2, NULL, NULL, NULL, 0),
(10, 'giannibonomo@hotmail.it', '53.70', NULL, 14, 14, 2, NULL, NULL, NULL, 0),
(11, 'redhotman@hotmail.it', '35.70', '7BF57473CK633591C', 15, 15, 2, NULL, NULL, NULL, 0),
(12, 'giannibonomo@hotmail.it', '53.70', '2EW0671304010230A', 14, 14, 2, NULL, NULL, NULL, 0),
(13, 'f.samori@gmail.com', '75.70', '2B715742CL165492F', 16, 16, 2, NULL, NULL, NULL, 0),
(14, 'aliotfran@gmail.com', '53.70', '32W1290255584243D', 18, 18, 2, NULL, NULL, NULL, 0),
(15, 'sandro.adriana@libero.it', '53.70', '8WS47319UU855062U', 19, 19, 2, NULL, NULL, NULL, 0),
(16, 'ag71si@gmail.com', '88.70', '21D672569W913524K', 21, 21, 2, NULL, NULL, NULL, 0),
(17, 'e.cortonesi@libero.it', '22.70', NULL, 22, 22, 2, NULL, NULL, NULL, 0),
(18, 'vannini@iltributarista.it', '53.70', '9PU17797WM344110M', 23, 23, 2, NULL, NULL, NULL, 0),
(22, 'pantalonesimona@libero.it', '53.70', NULL, 25, 25, 2, NULL, NULL, NULL, 0),
(23, 'pantalonesimona@libero.it', '53.70', '4FD53572JV142114J', 25, 25, 2, NULL, NULL, NULL, 0),
(24, 'marco.lorenzini87@gmail.com', '18.70', NULL, 26, 26, 2, NULL, NULL, NULL, 0),
(25, 'marco.lorenzini87@gmail.com', '18.70', NULL, 26, 26, 2, NULL, NULL, NULL, 0),
(26, 'marco.lorenzini87@gmail.com', '18.70', NULL, 26, 26, 2, NULL, NULL, NULL, 0);



INSERT INTO `orders_articles` (`idOrder`, `idProdotto`, `pgArticle`, `qtArticle`) VALUES
(3, 145, 1, 1),
(3, 147, 3, 1),
(4, 145, 1, 1),
(5, 143, 2, 1),
(6, 142, 1, 1),
(7, 146, 6, 1),
(8, 142, 1, 1),
(9, 142, 2, 1),
(10, 142, 2, 1),
(11, 143, 2, 1),
(12, 142, 2, 1),
(13, 141, 1, 1),
(13, 142, 4, 1),
(13, 146, 4, 1),
(14, 144, 1, 1),
(14, 147, 4, 1),
(15, 146, 3, 1),
(15, 147, 4, 1),
(16, 142, 3, 1),
(16, 147, 1, 1),
(17, 141, 1, 1),
(17, 145, 1, 1),
(18, 146, 5, 1),
(18, 147, 5, 1),
(22, 142, 1, 1),
(23, 142, 1, 1),
(24, 144, 1, 1),
(25, 144, 1, 1),
(26, 144, 1, 1);



INSERT INTO `product` (`idProduct`, `idGender`, `idType`, `idBrand`, `imPrice`, `pcDiscount`, `txThumbnailsUrl`, `idProductState`, `dtProductState`, `idCampaign`, `idMaterial`, `specialPrice`) VALUES
(141, 1, 12, 20, '7', 0, 'thumb20141215092230103&Robur Vino Rosso.jpeg', 1, '2014-12-15 09:22:47', NULL, 3, NULL),
(142, 1, 9, 20, '50', 0, 'thumb20141215092615772&proposta-scelta.jpg', 1, '2014-12-15 09:26:34', NULL, 1, NULL),
(143, 1, 11, 20, '32', 0, 'thumb20141215092939445&proposta-scelta.jpg', 1, '2014-12-15 09:29:53', NULL, 1, NULL),
(144, 1, 1, 20, '15', 0, 'thumb20141215093226398&Immagine.png', 1, '2014-12-15 09:32:37', NULL, 2, NULL),
(145, 1, 8, 20, '12', 0, 'thumb20141215094537366&Immagine.png', 1, '2014-12-15 09:45:47', NULL, 2, NULL),
(146, 1, 3, 20, '15', 0, 'thumb20141215094742575&Immagine.png', 1, '2014-12-15 09:47:59', NULL, 1, NULL),
(147, 1, 7, 20, '35', 0, 'thumb20141215094941437&Immagine.png', 1, '2014-12-15 09:49:57', NULL, 1, NULL),
(148, 1, 8, 20, '1', 0, 'thumb20141215223649926&420103_mrp_fr_m2.jpg', 1, '2014-12-15 22:29:53', NULL, 1, NULL);




INSERT INTO `product_description` (`idProduct`, `idLanguages`, `txDescription`) VALUES
(141, 'en', 'Red wine Robur Siena'),
(141, 'it', 'Vino rosso Robur Siena'),
(142, 'en', 'Game shirt Robur Siena'),
(142, 'it', 'Maglia da gara Robur Siena'),
(143, 'en', 'Boy game shirt Robur Siena'),
(143, 'it', 'Maglia da gara bambino Robur Siena'),
(144, 'en', 'Robur siena scarf'),
(144, 'it', 'Sciarpa Robur Siena'),
(145, 'en', 'Caps Robur Siena'),
(145, 'it', 'Cappellino Robur Siena'),
(146, 'en', 'T-shirt Robur Siena'),
(146, 'it', 'T-shirt Robur Siena'),
(147, 'en', 'Sweatshirt Robur siena'),
(147, 'it', 'Felpa Robur Siena'),
(148, 'en', 'Robur Siena		Caps Shop COTTON'),
(148, 'it', 'prodotto prova');

INSERT INTO `product_image` (`idProduct`, `pgImage`, `txImageUrl`) VALUES
(141, 1, '20141215092230103&Robur Vino Rosso.jpeg'),
(142, 1, '20141215092615772&proposta-scelta.jpg'),
(143, 1, '20141215092939445&proposta-scelta.jpg'),
(144, 1, '20141215093226398&Immagine.png'),
(145, 1, '20141215094537366&Immagine.png'),
(146, 1, '20141215094742575&Immagine.png'),
(147, 1, '20141215094941437&Immagine.png'),
(148, 1, '20141215223649926&420103_mrp_fr_m2.jpg');


INSERT INTO `product_state` (`idProductState`, `txProductState`) VALUES
(0, 'INSERITO'),
(1, 'PUBBLICATO'),
(2, 'CANCELLATO');


INSERT INTO `shops` (`idShop`, `txShop`, `txMail`, `txNome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`) VALUES
(1, 'Siena', 'shop@robursienashop.it', 'Robur Siena', 'Via dei Mille, 3', 'Siena', 53100, 'SI', 'Italia', '+39 0577 46649');

INSERT INTO `site_images` (`txGroupImages`, `pgGroupImages`, `txName`, `idGender`, `urlRedirect`) VALUES
('carousel', 1, '14122014200413124&ponsacco 1.JPG', NULL, NULL),
('carousel', 2, '14122014200439367&ponsacco 3.JPG', NULL, NULL),
('carousel', 3, '14122014200454005&ponsacco 5.JPG', NULL, NULL),
('carousel', 4, '14122014200507438&ponsacco 6.JPG', NULL, NULL),
('new', 1, 'new.png', NULL, NULL),
('newArrivals', 1, '15122014101902988&foto.JPG', 1, '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
('newArrivals', 2, '15122014101909363&ponsacco 2.JPG', 1, '/cart/cart-catalog.xhtml?idMenu=1&fgNewArrivals=true&idSubMenu=0&idCampaign=0'),
('promo', 1, 'promo.png', NULL, NULL),
('tabNav', 1, 'logoTab2.png', 1, NULL);


INSERT INTO `size` (`idSize`, `txSize`) VALUES
(1, 'XXS'),
(2, 'XS'),
(3, 'S'),
(4, 'M'),
(5, 'L'),
(6, 'XL'),
(7, 'XXL'),
(8, 'U'),
(9, 'N/A'),
(10, 'XXXL'),
(11, 'XXXS');


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
(203, 'CHANGE CANCELED'),
(204, 'INSTANT');

INSERT INTO `states_orders` (`idOrder`, `idStato`, `dtStato`, `txNote`) VALUES
(3, 1, '2014-12-16 17:11:46', NULL),
(3, 3, '2014-12-16 17:12:33', NULL),
(4, 1, '2014-12-16 17:40:12', NULL),
(4, 3, '2014-12-16 17:43:16', NULL),
(5, 1, '2014-12-16 17:50:38', NULL),
(6, 1, '2014-12-16 20:09:17', NULL),
(7, 1, '2014-12-16 20:34:04', NULL),
(7, 3, '2014-12-16 20:37:45', NULL),
(8, 1, '2014-12-16 20:36:55', NULL),
(8, 3, '2014-12-16 20:43:09', NULL),
(9, 1, '2014-12-16 20:55:03', NULL),
(10, 1, '2014-12-16 20:56:30', NULL),
(11, 1, '2014-12-16 20:57:41', NULL),
(11, 3, '2014-12-16 20:58:01', NULL),
(12, 1, '2014-12-16 21:05:19', NULL),
(12, 3, '2014-12-16 21:07:55', NULL),
(13, 1, '2014-12-16 21:33:28', NULL),
(13, 3, '2014-12-16 21:49:07', NULL),
(14, 1, '2014-12-16 21:40:20', NULL),
(14, 3, '2014-12-16 21:41:42', NULL),
(15, 1, '2014-12-16 22:36:01', NULL),
(15, 3, '2014-12-16 22:36:52', NULL),
(16, 1, '2014-12-17 09:47:54', NULL),
(16, 3, '2014-12-17 09:49:29', NULL),
(17, 1, '2014-12-17 11:03:53', NULL),
(18, 1, '2014-12-17 11:38:12', NULL),
(18, 3, '2014-12-17 11:43:20', NULL),
(22, 1, '2014-12-17 12:23:07', NULL),
(23, 1, '2014-12-17 12:25:18', NULL),
(23, 3, '2014-12-17 12:27:07', NULL),
(24, 1, '2014-12-17 14:54:28', NULL),
(25, 1, '2014-12-17 15:02:26', NULL),
(26, 1, '2014-12-17 15:06:44', NULL);

INSERT INTO `type` (`idType`, `idLanguages`, `txType`) VALUES
(1, 'en', 'Scarfs'),
(1, 'it', 'Sciarpe'),
(3, 'en', 'T-shirts'),
(3, 'it', 'T-shirts'),
(7, 'en', 'Sweatshirts'),
(7, 'it', 'Felpe'),
(8, 'en', 'Caps'),
(8, 'it', 'Cappellini'),
(9, 'en', 'Game shirts'),
(9, 'it', 'Maglie da gara'),
(11, 'en', 'Boy game shirts'),
(11, 'it', 'Maglie da gara bambino'),
(12, 'en', 'Wine'),
(12, 'it', 'Vino');

INSERT INTO `type_state_account` (`idTypeState`, `txTypeState`) VALUES
(1, 'DISATTIVATO'),
(2, 'ATTIVATO'),
(3, 'CESSATO'),
(4, 'RESET_PSW');

SET FOREIGN_KEY_CHECKS = 0;