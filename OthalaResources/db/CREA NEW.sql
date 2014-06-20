SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `aduna937_othala` ;
CREATE SCHEMA IF NOT EXISTS `aduna937_othala` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `aduna937_othala` ;

-- -----------------------------------------------------
-- Table `aduna937_othala`.`Type_State_Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Type_State_Account` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Type_State_Account` (
  `idTypeState` INT NOT NULL ,
  `txTypeState` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTypeState`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Customer` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Customer` (
  `idUser` VARCHAR(100) NOT NULL ,
  `txPassword` VARCHAR(20) NOT NULL ,
  `txNome` VARCHAR(30) NOT NULL ,
  `txCognome` VARCHAR(30) NOT NULL ,
  `txFiscale` VARCHAR(100) NULL ,
  `idTypeState` INT NULL ,
  PRIMARY KEY (`idUser`) ,
  INDEX `fk_Customer_Type_State_Account1` (`idTypeState` ASC) ,
  CONSTRAINT `fk_Customer_Type_State_Account1`
    FOREIGN KEY (`idTypeState` )
    REFERENCES `aduna937_othala`.`Type_State_Account` (`idTypeState` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Product_State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Product_State` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Product_State` (
  `idProductState` INT NOT NULL ,
  `txProductState` VARCHAR(45) NULL ,
  PRIMARY KEY (`idProductState`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Gender` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Gender` (
  `idGender` INT NOT NULL ,
  `idLanguages` VARCHAR(2) NOT NULL ,
  `txGender` VARCHAR(200) NULL ,
  PRIMARY KEY (`idGender`, `idLanguages`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Type_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Type_Size` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Type_Size` (
  `idTypeSize` INT NOT NULL ,
  `txTypeSize` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTypeSize`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Size_Type_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Size_Type_Size` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Size_Type_Size` (
  `idType` INT NOT NULL ,
  `idTypeSize` INT NOT NULL ,
  PRIMARY KEY (`idType`) ,
  INDEX `fk_idType_Type_Size1` (`idTypeSize` ASC) ,
  CONSTRAINT `fk_idType_Type_Size1`
    FOREIGN KEY (`idTypeSize` )
    REFERENCES `aduna937_othala`.`Type_Size` (`idTypeSize` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Type` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Type` (
  `idType` INT NOT NULL ,
  `idLanguages` VARCHAR(2) NOT NULL ,
  `txType` VARCHAR(200) NULL ,
  PRIMARY KEY (`idType`, `idLanguages`) ,
  INDEX `fk_Type_idType1` (`idType` ASC) ,
  CONSTRAINT `fk_Type_idType1`
    FOREIGN KEY (`idType` )
    REFERENCES `aduna937_othala`.`Size_Type_Size` (`idType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Brand` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Brand` (
  `idBrand` INT NOT NULL ,
  `idLanguages` VARCHAR(2) NOT NULL ,
  `txBrand` VARCHAR(200) NULL ,
  PRIMARY KEY (`idBrand`, `idLanguages`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Campaigns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Campaigns` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Campaigns` (
  `idCampaign` INT NOT NULL ,
  `txCampaign` VARCHAR(45) NULL ,
  `dtInizio` DATE NULL ,
  `dtFine` DATE NULL ,
  `pcSconto` INT NULL ,
  PRIMARY KEY (`idCampaign`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Product` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT ,
  `idGender` INT NULL ,
  `idType` INT NULL ,
  `idBrand` INT NULL ,
  `imPrice` DECIMAL(15) NULL ,
  `pcDiscount` INT NULL ,
  `txThumbnailsUrl` VARCHAR(100) NULL ,
  `idProductState` INT NULL ,
  `dtProductState` DATETIME NULL ,
  `idCampaign` INT NULL ,
  PRIMARY KEY (`idProduct`) ,
  INDEX `idProduct_INDEX1` (`idProduct` ASC) ,
  INDEX `fk_Product_Product_State1` (`idProductState` ASC) ,
  INDEX `fk_Product_Gender1` (`idGender` ASC) ,
  INDEX `fk_Product_Type1` (`idType` ASC) ,
  INDEX `fk_Product_Brand1` (`idBrand` ASC) ,
  INDEX `fk_Product_Campaigns1` (`idCampaign` ASC) ,
  CONSTRAINT `fk_Product_Product_State1`
    FOREIGN KEY (`idProductState` )
    REFERENCES `aduna937_othala`.`Product_State` (`idProductState` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Gender1`
    FOREIGN KEY (`idGender` )
    REFERENCES `aduna937_othala`.`Gender` (`idGender` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Type1`
    FOREIGN KEY (`idType` )
    REFERENCES `aduna937_othala`.`Type` (`idType` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Brand1`
    FOREIGN KEY (`idBrand` )
    REFERENCES `aduna937_othala`.`Brand` (`idBrand` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Campaigns1`
    FOREIGN KEY (`idCampaign` )
    REFERENCES `aduna937_othala`.`Campaigns` (`idCampaign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Product_Image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Product_Image` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Product_Image` (
  `idProduct` INT NOT NULL ,
  `pgImage` INT NOT NULL ,
  `txImageUrl` VARCHAR(100) NULL ,
  PRIMARY KEY (`idProduct`, `pgImage`) ,
  INDEX `fk_ProductImage_Product1_idx` (`idProduct` ASC) ,
  CONSTRAINT `fk_ProductImage_Product1`
    FOREIGN KEY (`idProduct` )
    REFERENCES `aduna937_othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Addresses` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Addresses` (
  `idAddress` INT NOT NULL AUTO_INCREMENT ,
  `idUser` VARCHAR(100) NOT NULL ,
  `txNome` VARCHAR(45) NOT NULL ,
  `txCognome` VARCHAR(45) NOT NULL ,
  `txVia` VARCHAR(100) NOT NULL ,
  `txComune` VARCHAR(100) NOT NULL ,
  `cdCap` INT NOT NULL ,
  `txProvincia` VARCHAR(100) NOT NULL ,
  `txNazione` VARCHAR(100) NOT NULL ,
  `txTel` VARCHAR(45) NOT NULL ,
  `fgDeleted` TINYINT NOT NULL ,
  `txEtichetta` VARCHAR(100) NOT NULL ,
  INDEX `fk_Addresses_Customer1` (`idUser` ASC) ,
  PRIMARY KEY (`idAddress`) ,
  CONSTRAINT `fk_Addresses_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `aduna937_othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Coupons` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Coupons` (
  `idCoupon` VARCHAR(100) NOT NULL ,
  `idUser` VARCHAR(100) NOT NULL ,
  `pcSconto` SMALLINT NULL ,
  `dtScadenza` DATE NULL ,
  `dtUtilizzo` DATE NULL ,
  PRIMARY KEY (`idCoupon`) ,
  INDEX `fk_Coupons_Customer1` (`idUser` ASC) ,
  CONSTRAINT `fk_Coupons_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `aduna937_othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Size` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Size` (
  `idSize` INT NOT NULL ,
  `idTypeSize` INT NULL ,
  `txSize` VARCHAR(10) NULL ,
  PRIMARY KEY (`idSize`) ,
  INDEX `fk_Size_Type_Size1` (`idTypeSize` ASC) ,
  CONSTRAINT `fk_Size_Type_Size1`
    FOREIGN KEY (`idTypeSize` )
    REFERENCES `aduna937_othala`.`Type_Size` (`idTypeSize` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Color` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Color` (
  `idColor` INT NOT NULL ,
  `idLanguages` VARCHAR(2) NOT NULL ,
  `txColor` VARCHAR(200) NULL ,
  PRIMARY KEY (`idColor`, `idLanguages`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Shops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Shops` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Shops` (
  `idShop` INT NOT NULL ,
  `txShop` VARCHAR(100) NULL ,
  `txMail` VARCHAR(100) NULL ,
  PRIMARY KEY (`idShop`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Article` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Article` (
  `idProduct` INT NOT NULL ,
  `pgArticle` INT NOT NULL ,
  `idSize` INT NULL ,
  `idColor` INT NULL ,
  `qtStock` INT NULL ,
  `txThumbnailsUrl` VARCHAR(100) NULL ,
  `idShop` INT NULL ,
  `txBarCode` VARCHAR(45) NULL ,
  PRIMARY KEY (`idProduct`, `pgArticle`) ,
  INDEX `fk_Article_Size1` (`idSize` ASC) ,
  INDEX `fk_Article_Color1` (`idColor` ASC) ,
  INDEX `fk_Article_Product1_idx` (`idProduct` ASC) ,
  INDEX `fk_Article_Shops1` (`idShop` ASC) ,
  CONSTRAINT `fk_Article_Product1`
    FOREIGN KEY (`idProduct` )
    REFERENCES `aduna937_othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Size1`
    FOREIGN KEY (`idSize` )
    REFERENCES `aduna937_othala`.`Size` (`idSize` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Color1`
    FOREIGN KEY (`idColor` )
    REFERENCES `aduna937_othala`.`Color` (`idColor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Shops1`
    FOREIGN KEY (`idShop` )
    REFERENCES `aduna937_othala`.`Shops` (`idShop` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Delivery_Cost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Delivery_Cost` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Delivery_Cost` (
  `idDeliveryCost` INT NOT NULL AUTO_INCREMENT ,
  `txDescrizione` VARCHAR(45) NULL ,
  `imSpese` DECIMAL(15) NULL ,
  `fgDeleted` TINYINT NULL ,
  `txDescrizioneExt` VARCHAR(250) NULL ,
  `txLinkTracking` VARCHAR(100) NULL ,
  PRIMARY KEY (`idDeliveryCost`) ,
  UNIQUE INDEX `idDeliveryCost_UNIQUE` (`idDeliveryCost` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Orders` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Orders` (
  `idOrder` INT NOT NULL AUTO_INCREMENT ,
  `idUser` VARCHAR(100) NOT NULL ,
  `imOrdine` INT NOT NULL ,
  `idTransaction` VARCHAR(45) NULL ,
  `idAddressFat` INT NOT NULL ,
  `idAddressSpe` INT NOT NULL ,
  `idDeliveryCost` INT NOT NULL ,
  `idTrackingNumber` VARCHAR(100) NULL ,
  PRIMARY KEY (`idOrder`) ,
  INDEX `fk_Orders_Customer1_idx` (`idUser` ASC) ,
  UNIQUE INDEX `idOrder_UNIQUE` (`idOrder` ASC) ,
  INDEX `fk_Orders_Addresses1` (`idAddressFat` ASC) ,
  INDEX `fk_Orders_Addresses2` (`idAddressSpe` ASC) ,
  INDEX `fk_Orders_Delivery_Cost1` (`idDeliveryCost` ASC) ,
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `aduna937_othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Addresses1`
    FOREIGN KEY (`idAddressFat` )
    REFERENCES `aduna937_othala`.`Addresses` (`idAddress` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Addresses2`
    FOREIGN KEY (`idAddressSpe` )
    REFERENCES `aduna937_othala`.`Addresses` (`idAddress` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery_Cost1`
    FOREIGN KEY (`idDeliveryCost` )
    REFERENCES `aduna937_othala`.`Delivery_Cost` (`idDeliveryCost` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Orders_Articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Orders_Articles` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Orders_Articles` (
  `idOrder` INT NOT NULL ,
  `idProdotto` INT NOT NULL ,
  `pgArticle` INT NOT NULL ,
  `qtArticle` INT NOT NULL ,
  PRIMARY KEY (`idOrder`, `idProdotto`, `pgArticle`) ,
  INDEX `fk_OrdersArticles_Article1_idx` (`idProdotto` ASC, `pgArticle` ASC) ,
  INDEX `fk_OrdersArticles_Orders1_idx` (`idOrder` ASC) ,
  CONSTRAINT `fk_OrdersArticles_Orders1`
    FOREIGN KEY (`idOrder` )
    REFERENCES `aduna937_othala`.`Orders` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdersArticles_Article1`
    FOREIGN KEY (`idProdotto` , `pgArticle` )
    REFERENCES `aduna937_othala`.`Article` (`idProduct` , `pgArticle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`States`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`States` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`States` (
  `idStato` INT NOT NULL ,
  `txStato` VARCHAR(45) NULL ,
  PRIMARY KEY (`idStato`) ,
  UNIQUE INDEX `idStato_UNIQUE` (`idStato` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`States_Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`States_Orders` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`States_Orders` (
  `idOrder` INT NOT NULL ,
  `idStato` INT NOT NULL ,
  `dtStato` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `txNote` VARCHAR(100) NULL ,
  PRIMARY KEY (`idOrder`, `idStato`) ,
  INDEX `fk_StatesOrders_States1_idx` (`idStato` ASC) ,
  INDEX `fk_StatesOrders_Orders1_idx` (`idOrder` ASC) ,
  CONSTRAINT `fk_StatesOrders_Orders1`
    FOREIGN KEY (`idOrder` )
    REFERENCES `aduna937_othala`.`Orders` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StatesOrders_States1`
    FOREIGN KEY (`idStato` )
    REFERENCES `aduna937_othala`.`States` (`idStato` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Customer_Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Customer_Roles` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Customer_Roles` (
  `idUser` VARCHAR(100) NOT NULL ,
  `txRole` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idUser`, `txRole`) ,
  INDEX `fk_CustomerRoles_Customer1_idx` (`idUser` ASC) ,
  CONSTRAINT `fk_CustomerRoles_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `aduna937_othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Product_Description`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Product_Description` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Product_Description` (
  `idProduct` INT NOT NULL ,
  `idLanguages` VARCHAR(2) NOT NULL ,
  `txDescription` VARCHAR(200) NULL ,
  PRIMARY KEY (`idProduct`, `idLanguages`) ,
  INDEX `fk_ProductDescription_Product1` (`idProduct` ASC) ,
  CONSTRAINT `fk_ProductDescription_Product1`
    FOREIGN KEY (`idProduct` )
    REFERENCES `aduna937_othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`Site_Images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`Site_Images` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`Site_Images` (
  `idsiteImages` INT NOT NULL ,
  `txGroupImages` VARCHAR(45) NULL ,
  `pgGroupImages` INT NULL ,
  `txLibrary` VARCHAR(45) NULL ,
  `txName` VARCHAR(45) NULL ,
  `urlRedirect` VARCHAR(100) NULL ,
  PRIMARY KEY (`idsiteImages`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aduna937_othala`.`IpnMessages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aduna937_othala`.`IpnMessages` ;

CREATE  TABLE IF NOT EXISTS `aduna937_othala`.`IpnMessages` (
  `idOrder` INT NOT NULL ,
  `idTransaction` VARCHAR(50) NOT NULL ,
  `txStato` VARCHAR(45) NOT NULL ,
  `tsInserimento` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `txMessage` VARCHAR(10000) NULL ,  
  `txNote` VARCHAR(1000) NULL ,
  `fgElaborato` TINYINT(1)  NULL ,
  PRIMARY KEY (`idOrder`, `idTransaction`,`txStato`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
