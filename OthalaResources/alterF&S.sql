ALTER TABLE `aduna937_othala`.`product` ADD COLUMN `tyProduct` INT(11) NULL DEFAULT NULL  AFTER `specialPrice` ;

CREATE  TABLE `aduna937_othala`.`regione` (

  `idregione` INT NOT NULL ,

  `txRegione` VARCHAR(45) NULL DEFAULT NULL ,

  PRIMARY KEY (`idregione`) );


  CREATE  TABLE `aduna937_othala`.`provincia` (

  `idProvincia` INT NOT NULL ,

  `txProvincia` VARCHAR(100) NULL DEFAULT NULL ,

  PRIMARY KEY (`idProvincia`) );

CREATE TABLE `regione_provincia` (
  `idRegione` int(11) NOT NULL,
  `idProvincia` int(11) NOT NULL,
  PRIMARY KEY (`idRegione`,`idProvincia`)
);


ALTER TABLE `aduna937_othala`.`brand` ADD COLUMN `idProvincia` INT(11) NULL DEFAULT NULL  AFTER `txBrand` , ADD COLUMN `txDescrizione` VARCHAR(1000) NULL DEFAULT NULL  AFTER `idProvincia` , ADD COLUMN `idUser` VARCHAR(100) NULL DEFAULT NULL  AFTER `txDescrizione` , ADD COLUMN `urlFoto` VARCHAR(100) NULL DEFAULT NULL  AFTER `idUser` ;


CREATE  TABLE `aduna937_othala`.`infAggiuntive` (

  `idInformazione` INT NOT NULL ,

  `txInformazione` VARCHAR(45) NULL DEFAULT NULL ,

  PRIMARY KEY (`idInformazione`) );


  
  CREATE  TABLE `aduna937_othala`.`product_info` (

  `idProduct` INT NOT NULL ,

  `idInformazione` INT NOT NULL ,

  `txDescrizione` VARCHAR(100) NULL DEFAULT NULL ,

  PRIMARY KEY (`idProduct`, `idInformazione`) );


  
  ALTER TABLE `aduna937_othala`.`article` ADD COLUMN `imPrice` DECIMAL(15,2) NULL DEFAULT NULL  AFTER `txBarCode` , ADD COLUMN `specialPrice` DECIMAL(15,2) NULL DEFAULT NULL  AFTER `imPrice` , ADD COLUMN `pcDiscount` INT(11) NULL DEFAULT NULL  AFTER `specialPrice` ;
  
  ALTER TABLE `aduna937_othala`.`infaggiuntive` ADD COLUMN `idLanguages` VARCHAR(2) NOT NULL  AFTER `idInformazione` 

, DROP PRIMARY KEY 

, ADD PRIMARY KEY (`idInformazione`, `idLanguages`) ;

ALTER TABLE `aduna937_othala`.`product_info` ADD COLUMN `idLanguages` VARCHAR(2) NOT NULL  AFTER `idInformazione` 

, DROP PRIMARY KEY 

, ADD PRIMARY KEY (`idProduct`, `idInformazione`, `idLanguages`) ;

CREATE  TABLE `aduna937_othala`.`brand_descr` (

  `idBrand` INT(11) NOT NULL ,

  `idLanguages` VARCHAR(2) NOT NULL ,

  `txDescrizione` VARCHAR(1000) NULL DEFAULT NULL ,

  PRIMARY KEY (`idBrand`, `idLanguages`) );


  
  ALTER TABLE `aduna937_othala`.`brand` DROP COLUMN `txDescrizione` ;
  
  
  
  