set foreign_key_checks = 0;

INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txNome`, `txCognome`, `txVia`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txTel`, `fgDeleted`, `txEtichetta`) VALUES (9999, 'shop@robursienashop.it', 'Robur', 'Siena', 'Via dei Mille, 3', 'Siena', 53100, 'SI', 'ITALIA', '057746649', 0, 'sede');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9998, 'shop@robursienashop.it', 'Asciano (Arbia)', 53041, 'SI');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9997, 'shop@robursienashop.it', 'Castelnuovo Berardenga (Casetta)', 53019, 'SI');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9996, 'shop@robursienashop.it', 'Monteriggioni (Belverde)', 53035, 'SI');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9995, 'shop@robursienashop.it', 'Sovicille (San Rocco)', 53018, 'SI');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9994, 'shop@robursienashop.it', 'Monteroni d\'Arbia (Ponte a Tressa)', 53014, 'SI');
INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`) VALUES (9993, 'shop@robursienashop.it', 'Monteriggioni (Montarioso)', 53035, 'SI');

INSERT INTO `robur807_othala`.`delivery_nazioni`  VALUES (9999, 'ITALIA', 9999);
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9998 WHERE `idDeliveryCost`='3' and`idNazione`='ITALIA';
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9997 WHERE `idDeliveryCost`='4' and`idNazione`='ITALIA';
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9996 WHERE `idDeliveryCost`='5' and`idNazione`='ITALIA';
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9995 WHERE `idDeliveryCost`='6' and`idNazione`='ITALIA';
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9994 WHERE `idDeliveryCost`='7' and`idNazione`='ITALIA';
UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`=9993 WHERE `idDeliveryCost`='8' and`idNazione`='ITALIA';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9993';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9994';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9995';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9996';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9997';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0, `txEtichetta`='sede' WHERE `idAddress`='9998';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9993';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9994';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9995';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9996';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9997';

UPDATE `robur807_othala`.`addresses` SET `txNazione`='ITALIA' WHERE `idAddress`='9998';

INSERT INTO `robur807_othala`.`addresses` (`idAddress`, `idUser`, `txComune`, `cdCap`, `txProvincia`, `txNazione`, `txEtichetta`) VALUES (9992, 'shop@robursienashop.it', 'Siena', 53100, 'SI', 'ITALIA', '');

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9993';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9994';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9995';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9996';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9997';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9998';

UPDATE `robur807_othala`.`addresses` SET `txEtichetta`='' WHERE `idAddress`='9999';

UPDATE `robur807_othala`.`delivery_nazioni` SET `idAddress`='9992' WHERE `idDeliveryCost`='2' and`idNazione`='ITALIA';

UPDATE `robur807_othala`.`addresses` SET `fgDeleted`=0 WHERE `idAddress`='9992';

set foreign_key_checks = 1;