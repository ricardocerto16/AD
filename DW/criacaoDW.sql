-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flagsDW
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flagsDW
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flagsDW` DEFAULT CHARACTER SET utf8 ;
USE `flagsDW` ;

-- -----------------------------------------------------
-- Table `flagsDW`.`dim_Zone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsDW`.`dim_Zone` (
  `idDim_Zone` INT NOT NULL,
  `zone` VARCHAR(45) NOT NULL,
  `landmass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDim_Zone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsDW`.`dim_Religion_Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsDW`.`dim_Religion_Language` (
  `idDim_Religion_Language` INT NOT NULL,
  `religion` VARCHAR(45) NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDim_Religion_Language`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flagsDW`.`dim_Flag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsDW`.`dim_Flag` (
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
-- Table `flagsDW`.`Paises_Info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flagsDW`.`Paises_Info` (
  `idPaises_Info` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `area` INT NOT NULL,
  `population` VARCHAR(45) NOT NULL,
  `idDim_Zone` INT NOT NULL,
  `idDim_Religion_Language` INT NOT NULL,
  `idDim_Flag` INT NOT NULL,
  PRIMARY KEY (`idPaises_Info`),
  INDEX `fk_Paises_Info_dim_Zone_idx` (`idDim_Zone` ASC),
  INDEX `fk_Paises_Info_dim_Religion_Language1_idx` (`idDim_Religion_Language` ASC),
  INDEX `fk_Paises_Info_dim_Flag1_idx` (`idDim_Flag` ASC),
  CONSTRAINT `fk_Paises_Info_dim_Zone`
    FOREIGN KEY (`idDim_Zone`)
    REFERENCES `flagsDW`.`dim_Zone` (`idDim_Zone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paises_Info_dim_Religion_Language1`
    FOREIGN KEY (`idDim_Religion_Language`)
    REFERENCES `flagsDW`.`dim_Religion_Language` (`idDim_Religion_Language`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paises_Info_dim_Flag1`
    FOREIGN KEY (`idDim_Flag`)
    REFERENCES `flagsDW`.`dim_Flag` (`idDim_Flag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
