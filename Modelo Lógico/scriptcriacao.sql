-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

#DROP SCHEMA mydb;
-- -----------------------------------------------------
-- Table `mydb`.`Landmass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Landmass` (
  `idLandmass` INT NOT NULL,
  `landmasscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLandmass`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zone` (
  `idZone` INT NOT NULL,
  `zone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idZone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Language` (
  `idLanguage` INT NOT NULL,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLanguage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Religion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Religion` (
  `idReligion` INT NOT NULL,
  `religion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReligion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Color` (
  `idColor` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idColor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flag` (
  `idFlag` INT NOT NULL,
  `bars` INT NOT NULL,
  `strips` INT NOT NULL,
  `ncolours` INT NOT NULL,
  `red` TINYINT(1) NOT NULL,
  `green` TINYINT(1) NOT NULL,
  `blue` TINYINT(1) NOT NULL,
  `gold` TINYINT(1) NOT NULL,
  `white` TINYINT(1) NOT NULL,
  `black` TINYINT(1) NOT NULL,
  `orange` TINYINT(1) NOT NULL,
  `circules` INT NOT NULL,
  `crosses` INT NOT NULL,
  `saltires` INT NOT NULL,
  `quarters` INT NOT NULL,
  `sunstars` INT NOT NULL,
  `crescent` VARCHAR(45) NOT NULL,
  `triangle` TINYINT(1) NOT NULL,
  `icon` TINYINT(1) NOT NULL,
  `animate` TINYINT(1) NOT NULL,
  `text` TINYINT(1) NOT NULL,
  `idMainhue` INT NOT NULL,
  `idTopLeft` INT NOT NULL,
  `idBotRight` INT NOT NULL,
  PRIMARY KEY (`idFlag`),
  INDEX `fk_Flag_Color1_idx` (`idMainhue` ASC),
  INDEX `fk_Flag_Color2_idx` (`idTopLeft` ASC),
  INDEX `fk_Flag_Color3_idx` (`idBotRight` ASC),
  CONSTRAINT `fk_Flag_Color1`
    FOREIGN KEY (`idMainhue`)
    REFERENCES `mydb`.`Color` (`idColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flag_Color2`
    FOREIGN KEY (`idTopLeft`)
    REFERENCES `mydb`.`Color` (`idColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flag_Color3`
    FOREIGN KEY (`idBotRight`)
    REFERENCES `mydb`.`Color` (`idColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `idCountry` INT NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `landmass` INT NOT NULL,
  `zone` INT NOT NULL,
  `area` INT NOT NULL,
  `population` INT NOT NULL,
  `language` INT NOT NULL,
  `religion` INT NOT NULL,
  `flag` INT NOT NULL,
  PRIMARY KEY (`idCountry`),
  INDEX `fk_Country_Landmass_idx` (`landmass` ASC),
  INDEX `fk_Country_Zone1_idx` (`zone` ASC),
  INDEX `fk_Country_Language1_idx` (`language` ASC),
  INDEX `fk_Country_Religion1_idx` (`religion` ASC),
  INDEX `fk_Country_Flag1_idx` (`flag` ASC),
  CONSTRAINT `fk_Country_Landmass`
    FOREIGN KEY (`landmass`)
    REFERENCES `mydb`.`Landmass` (`idLandmass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Zone1`
    FOREIGN KEY (`zone`)
    REFERENCES `mydb`.`Zone` (`idZone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Language1`
    FOREIGN KEY (`language`)
    REFERENCES `mydb`.`Language` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Religion1`
    FOREIGN KEY (`religion`)
    REFERENCES `mydb`.`Religion` (`idReligion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Country_Flag1`
    FOREIGN KEY (`flag`)
    REFERENCES `mydb`.`Flag` (`idFlag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
