-- MySQL Script generated by MySQL Workbench
-- Wed Apr 26 10:52:46 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica Cul d'Ampolla
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Optica Cul d'Ampolla` ;

-- -----------------------------------------------------
-- Schema Optica Cul d'Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica Cul d'Ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Optica Cul d'Ampolla` ;

-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Adreça`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Adreça` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Adreça` (
  `id_Adreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(20) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `pis` INT NOT NULL,
  `porta` VARCHAR(45) NOT NULL,
  `ciutat` VARCHAR(15) NOT NULL,
  `codi_postal` INT NOT NULL,
  `pais` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_Adreça`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Marca` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Marca` (
  `id_Marca` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_Marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Ulleres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Ulleres` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Ulleres` (
  `id_Ulleres` INT NOT NULL AUTO_INCREMENT,
  `graduacio_vidre_dret` INT NOT NULL,
  `graduacio_vidre_esquerre` INT NOT NULL,
  `tipus_muntura` CHAR(1) NOT NULL COMMENT 'Tenia a quests tipus de muntura:\nF = Flotant\nP = Pasta\nM = Metàl·lica',
  `color_muntura` VARCHAR(15) NOT NULL,
  `color_vidre_dret` VARCHAR(15) NOT NULL,
  `preu` DOUBLE NOT NULL,
  PRIMARY KEY (`id_Ulleres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Proveidor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Proveidor` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Proveidor` (
  `id_Proveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(15) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `id_Adreça` INT NOT NULL,
  `id_Marca` INT NOT NULL,
  `id_Ulleres` INT NOT NULL,
  PRIMARY KEY (`id_Proveidor`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `fk_Adreça1_idx` (`id_Adreça` ASC) VISIBLE,
  INDEX `fk_Marca1_idx` (`id_Marca` ASC) VISIBLE,
  INDEX `fk_Ulleres2_idx` (`id_Ulleres` ASC) VISIBLE,
  CONSTRAINT `fk_Adreça1`
    FOREIGN KEY (`id_Adreça`)
    REFERENCES `Optica Cul d'Ampolla`.`Adreça` (`id_Adreça`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Marca1`
    FOREIGN KEY (`id_Marca`)
    REFERENCES `Optica Cul d'Ampolla`.`Marca` (`id_Marca`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres2`
    FOREIGN KEY (`id_Ulleres`)
    REFERENCES `Optica Cul d'Ampolla`.`Ulleres` (`id_Ulleres`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Client` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Client` (
  `id_Client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(15) NOT NULL,
  `telefon` INT NOT NULL,
  `email` VARCHAR(20) NOT NULL,
  `data_alta` DATE NOT NULL,
  `client_col·laborador` INT NULL COMMENT 'client recomana l\'òptica ',
  `id_Adreça` INT NOT NULL,
  PRIMARY KEY (`id_Client`),
  INDEX `client_col_idx` (`client_col·laborador` ASC) VISIBLE,
  INDEX `fk_Adreça2_idx` (`id_Adreça` ASC) VISIBLE,
  CONSTRAINT `client_col`
    FOREIGN KEY (`client_col·laborador`)
    REFERENCES `Optica Cul d'Ampolla`.`Client` (`id_Client`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Adreça2`
    FOREIGN KEY (`id_Adreça`)
    REFERENCES `Optica Cul d'Ampolla`.`Adreça` (`id_Adreça`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Empleat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Empleat` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Empleat` (
  `id_Empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_Empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica Cul d'Ampolla`.`Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica Cul d'Ampolla`.`Venta` ;

CREATE TABLE IF NOT EXISTS `Optica Cul d'Ampolla`.`Venta` (
  `id_Venta` INT NOT NULL AUTO_INCREMENT,
  `id_Client` INT NOT NULL,
  `id_Empleat` INT NOT NULL,
  `data` DATE NOT NULL,
  `id_Ulleres` INT NOT NULL,
  PRIMARY KEY (`id_Venta`, `id_Client`, `id_Empleat`),
  INDEX `fk_Empleat1_idx` (`id_Empleat` ASC) VISIBLE,
  INDEX `fk_Client1_idx` (`id_Client` ASC) VISIBLE,
  INDEX `fk_Ulleres1_idx` (`id_Ulleres` ASC) VISIBLE,
  CONSTRAINT `fk_Client1`
    FOREIGN KEY (`id_Client`)
    REFERENCES `Optica Cul d'Ampolla`.`Client` (`id_Client`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleat1`
    FOREIGN KEY (`id_Empleat`)
    REFERENCES `Optica Cul d'Ampolla`.`Empleat` (`id_Empleat`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres1`
    FOREIGN KEY (`id_Ulleres`)
    REFERENCES `Optica Cul d'Ampolla`.`Ulleres` (`id_Ulleres`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
