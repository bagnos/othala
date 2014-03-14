SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `othala` ;
CREATE SCHEMA IF NOT EXISTS `othala` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `othala` ;

-- -----------------------------------------------------
-- Table `othala`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Customer` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Customer` (
  `idUser` VARCHAR(100) NOT NULL ,
  `txPassword` VARCHAR(20) NOT NULL ,
  `txNome` VARCHAR(30) NOT NULL ,
  `txCognome` VARCHAR(30) NOT NULL ,
  `txFiscale` VARCHAR(100) NULL ,
  PRIMARY KEY (`idUser`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Product` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Product` (
  `idProduct` INT NOT NULL ,
  `txDescrizione` VARCHAR(100) NULL ,
  `imPrice` DECIMAL(15) NULL ,
  `pcDiscount` INT NULL ,
  PRIMARY KEY (`idProduct`) ,
  INDEX `idProduct_INDEX1` (`idProduct` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Attribute` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Attribute` (
  `idProductAttribute` INT NOT NULL ,
  `txAttributeName` VARCHAR(100) NULL ,
  PRIMARY KEY (`idProductAttribute`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Valori_Attributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Valori_Attributo` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Valori_Attributo` (
  `idProductAttribute` INT NOT NULL ,
  `pgProductAttribute` INT NOT NULL ,
  `txValore` VARCHAR(200) NULL ,
  PRIMARY KEY (`pgProductAttribute`, `idProductAttribute`) ,
  CONSTRAINT `fk_ValoriAttributo_Attribute1`
    FOREIGN KEY (`idProductAttribute` )
    REFERENCES `othala`.`Attribute` (`idProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Product_Attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Product_Attribute` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Product_Attribute` (
  `idProduct` INT NOT NULL ,
  `idProductAttribute` INT NOT NULL ,
  `pgProductAttribute` INT NOT NULL ,
  INDEX `fk_ProductToAttribute_ProductAttribute1_idx` (`idProductAttribute` ASC) ,
  PRIMARY KEY (`idProduct`, `idProductAttribute`, `pgProductAttribute`) ,
  INDEX `fk_Product_Attribute_Valori_Attributo1` (`idProductAttribute` ASC, `pgProductAttribute` ASC) ,
  CONSTRAINT `fk_ProductToAttribute_ProductAttribute1`
    FOREIGN KEY (`idProductAttribute` )
    REFERENCES `othala`.`Attribute` (`idProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductAttribute_Product1`
    FOREIGN KEY (`idProduct` )
    REFERENCES `othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Attribute_Valori_Attributo1`
    FOREIGN KEY (`idProductAttribute` , `pgProductAttribute` )
    REFERENCES `othala`.`Valori_Attributo` (`idProductAttribute` , `pgProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Product_Image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Product_Image` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Product_Image` (
  `idProduct` INT NOT NULL ,
  `pgImage` INT NOT NULL ,
  `txImageUrl` VARCHAR(100) NULL ,
  PRIMARY KEY (`idProduct`, `pgImage`) ,
  CONSTRAINT `fk_ProductImage_Product1`
    FOREIGN KEY (`idProduct` )
    REFERENCES `othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Type_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Type_Address` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Type_Address` (
  `idTypeAddress` INT NOT NULL ,
  `Descrizione` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idTypeAddress`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Addresses` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Addresses` (
  `idUser` VARCHAR(100) NOT NULL ,
  `idTypeAddress` INT NOT NULL ,
  `txVia` VARCHAR(100) NOT NULL ,
  `txComune` VARCHAR(100) NOT NULL ,
  `cdCap` INT NOT NULL ,
  `txProvincia` VARCHAR(100) NOT NULL ,
  `txNazione` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idUser`, `idTypeAddress`) ,
  INDEX `fk_Addresses_TypeAddress1` (`idTypeAddress` ASC) ,
  INDEX `fk_Addresses_Customer1` (`idUser` ASC) ,
  CONSTRAINT `fk_Addresses_TypeAddress1`
    FOREIGN KEY (`idTypeAddress` )
    REFERENCES `othala`.`Type_Address` (`idTypeAddress` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Coupons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Coupons` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Coupons` (
  `idCoupon` INT NOT NULL ,
  `pcSconto` SMALLINT NULL ,
  `dtScadenza` DATE NULL ,
  `dtUtilizzo` DATE NULL ,
  PRIMARY KEY (`idCoupon`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Campaigns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Campaigns` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Campaigns` (
  `idCampaign` INT NOT NULL ,
  `dtInizio` DATE NULL ,
  `dtFine` DATE NULL ,
  `idCoupon` INT NOT NULL ,
  PRIMARY KEY (`idCampaign`) ,
  INDEX `fk_Campaigns_Coupons1` (`idCoupon` ASC) ,
  CONSTRAINT `fk_Campaigns_Coupons1`
    FOREIGN KEY (`idCoupon` )
    REFERENCES `othala`.`Coupons` (`idCoupon` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Article` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Article` (
  `idProdotto` INT NOT NULL ,
  `pgArticle` INT NOT NULL ,
  PRIMARY KEY (`idProdotto`, `pgArticle`) ,
  CONSTRAINT `fk_Article_Product1`
    FOREIGN KEY (`idProdotto` )
    REFERENCES `othala`.`Product` (`idProduct` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Article_Attribute`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Article_Attribute` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Article_Attribute` (
  `idProduct` INT NOT NULL ,
  `pgArticle` INT NOT NULL ,
  `idProductAttribute` INT NOT NULL ,
  `pgProductAttribute` INT NOT NULL ,
  PRIMARY KEY (`idProduct`, `pgArticle`, `idProductAttribute`, `pgProductAttribute`) ,
  INDEX `fk_ArticleAttribute_Attribute1_idx` (`idProductAttribute` ASC) ,
  INDEX `fk_Article_Attribute_Valori_Attributo1` (`idProductAttribute` ASC, `pgProductAttribute` ASC) ,
  INDEX `fk_Article_Attribute_Article1` (`idProduct` ASC, `pgArticle` ASC) ,
  CONSTRAINT `fk_ArticleAttribute_Attribute1`
    FOREIGN KEY (`idProductAttribute` )
    REFERENCES `othala`.`Attribute` (`idProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Attribute_Valori_Attributo1`
    FOREIGN KEY (`idProductAttribute` , `pgProductAttribute` )
    REFERENCES `othala`.`Valori_Attributo` (`idProductAttribute` , `pgProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Attribute_Article1`
    FOREIGN KEY (`idProduct` , `pgArticle` )
    REFERENCES `othala`.`Article` (`idProdotto` , `pgArticle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Customer_Campaigns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Customer_Campaigns` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Customer_Campaigns` (
  `idUser` VARCHAR(100) NOT NULL ,
  `idCampaign` INT NOT NULL ,
  PRIMARY KEY (`idUser`, `idCampaign`) ,
  INDEX `fk_Customer_has_Campaigns_Campaigns1_idx` (`idCampaign` ASC) ,
  INDEX `fk_Customer_has_Campaigns_Customer1_idx` (`idUser` ASC) ,
  CONSTRAINT `fk_Customer_has_Campaigns_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_has_Campaigns_Campaigns1`
    FOREIGN KEY (`idCampaign` )
    REFERENCES `othala`.`Campaigns` (`idCampaign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Valori_Attributo_Campaigns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Valori_Attributo_Campaigns` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Valori_Attributo_Campaigns` (
  `idProductAttribute` INT NOT NULL ,
  `pgProductAttribute` INT NOT NULL ,
  `idCampaign` INT NOT NULL ,
  PRIMARY KEY (`idProductAttribute`, `pgProductAttribute`, `idCampaign`) ,
  INDEX `fk_ValoriAttributo_has_Campaigns_Campaigns1_idx` (`idCampaign` ASC) ,
  INDEX `fk_ValoriAttributo_has_Campaigns_ValoriAttributo1_idx` (`pgProductAttribute` ASC, `idProductAttribute` ASC) ,
  CONSTRAINT `fk_ValoriAttributo_has_Campaigns_ValoriAttributo1`
    FOREIGN KEY (`pgProductAttribute` , `idProductAttribute` )
    REFERENCES `othala`.`Valori_Attributo` (`pgProductAttribute` , `idProductAttribute` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ValoriAttributo_has_Campaigns_Campaigns1`
    FOREIGN KEY (`idCampaign` )
    REFERENCES `othala`.`Campaigns` (`idCampaign` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`States`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`States` ;

CREATE  TABLE IF NOT EXISTS `othala`.`States` (
  `idStato` INT NOT NULL ,
  `txStato` VARCHAR(45) NULL ,
  PRIMARY KEY (`idStato`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Orders` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Orders` (
  `idOrder` INT NOT NULL ,
  `idUser` VARCHAR(100) NOT NULL ,
  `dtOrdine` DATE NULL ,
  `idStato` INT NULL ,
  `imOrdine` INT NULL ,
  `imSpeseSpedizione` INT NULL ,
  PRIMARY KEY (`idOrder`) ,
  INDEX `fk_Orders_Customer1_idx` (`idUser` ASC) ,
  INDEX `fk_Orders_States1_idx` (`idStato` ASC) ,
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_States1`
    FOREIGN KEY (`idStato` )
    REFERENCES `othala`.`States` (`idStato` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Orders_Articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Orders_Articles` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Orders_Articles` (
  `idOrder` INT NOT NULL ,
  `idProdotto` INT NOT NULL ,
  `pgArticle` INT NOT NULL ,
  PRIMARY KEY (`idOrder`, `idProdotto`, `pgArticle`) ,
  INDEX `fk_OrdersArticles_Article1_idx` (`idProdotto` ASC, `pgArticle` ASC) ,
  CONSTRAINT `fk_OrdersArticles_Orders1`
    FOREIGN KEY (`idOrder` )
    REFERENCES `othala`.`Orders` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdersArticles_Article1`
    FOREIGN KEY (`idProdotto` , `pgArticle` )
    REFERENCES `othala`.`Article` (`idProdotto` , `pgArticle` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`States_Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`States_Orders` ;

CREATE  TABLE IF NOT EXISTS `othala`.`States_Orders` (
  `idOrder` INT NOT NULL ,
  `idStato` INT NOT NULL ,
  `dtStato` DATE NULL ,
  `txNote` VARCHAR(100) NULL ,
  PRIMARY KEY (`idOrder`) ,
  INDEX `fk_StatesOrders_States1_idx` (`idStato` ASC) ,
  CONSTRAINT `fk_StatesOrders_Orders1`
    FOREIGN KEY (`idOrder` )
    REFERENCES `othala`.`Orders` (`idOrder` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StatesOrders_States1`
    FOREIGN KEY (`idStato` )
    REFERENCES `othala`.`States` (`idStato` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Delivery_Cost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Delivery_Cost` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Delivery_Cost` (
  `idDeliveryCost` INT NOT NULL ,
  `txDescrizione` VARCHAR(45) NULL ,
  `imSpese` INT NULL ,
  PRIMARY KEY (`idDeliveryCost`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `othala`.`Customer_Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `othala`.`Customer_Roles` ;

CREATE  TABLE IF NOT EXISTS `othala`.`Customer_Roles` (
  `idUser` VARCHAR(100) NOT NULL ,
  `txRole` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`idUser`, `txRole`) ,
  CONSTRAINT `fk_CustomerRoles_Customer1`
    FOREIGN KEY (`idUser` )
    REFERENCES `othala`.`Customer` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
