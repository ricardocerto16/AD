-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flagsdw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flagsdw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flagsdw` DEFAULT CHARACTER SET utf8 ;
USE `flagsdw` ;

-- -----------------------------------------------------
-- Table `flagsdw`.`dim_Landmass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsdw`.`dim_Landmass` (
  `idDim_Zone` INT NOT NULL,
  `landmass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDim_Zone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsdw`.`dim_Religion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsdw`.`dim_Religion` (
  `idDim_Religion` INT NOT NULL,
  `religion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDim_Religion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsdw`.`dim_Flag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsdw`.`dim_Flag` (
  `idDim_Flag` INT NOT NULL,
  `bars` INT NOT NULL,
  `strips` INT NOT NULL,
  `ncolours` INT NOT NULL,
  `red` TINYINT(1) NOT NULL,
  `blue` TINYINT(1) NOT NULL,
  `white` TINYINT(1) NOT NULL,
  `black` TINYINT(1) NOT NULL,
  `orange` TINYINT(1) NOT NULL,
  `green` TINYINT(1) NOT NULL,
  `gold` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idDim_Flag`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsdw`.`dim_Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsdw`.`dim_Language` (
  `idDim_Language` INT NOT NULL,
  `Language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDim_Language`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsdw`.`Paises_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsdw`.`Paises_Info` (
  `idPaises_Info` INT NOT NULL,
  `idDim_Zone` INT NOT NULL,
  `idDim_Religion` INT NOT NULL,
  `idDim_Flag` INT NOT NULL,
  `idDim_Language` INT NOT NULL,
  `name` VARCHAR(90) NOT NULL,
  `area` INT NULL,
  `population` INT NULL,
  PRIMARY KEY (`idPaises_Info`),
  INDEX `fk_Paises_Info_dim_Zone_idx` (`idDim_Zone` ASC),
  INDEX `fk_Paises_Info_dim_Religion_Language1_idx` (`idDim_Religion` ASC),
  INDEX `fk_Paises_Info_dim_Flag1_idx` (`idDim_Flag` ASC),
  INDEX `fk_Paises_Info_dim_Language1_idx` (`idDim_Language` ASC),
  CONSTRAINT `fk_Paises_Info_dim_Zone`
    FOREIGN KEY (`idDim_Zone`)
    REFERENCES `flagsdw`.`dim_Landmass` (`idDim_Zone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paises_Info_dim_Religion_Language1`
    FOREIGN KEY (`idDim_Religion`)
    REFERENCES `flagsdw`.`dim_Religion` (`idDim_Religion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paises_Info_dim_Flag1`
    FOREIGN KEY (`idDim_Flag`)
    REFERENCES `flagsdw`.`dim_Flag` (`idDim_Flag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paises_Info_dim_Language1`
    FOREIGN KEY (`idDim_Language`)
    REFERENCES `flagsdw`.`dim_Language` (`idDim_Language`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
paises_info