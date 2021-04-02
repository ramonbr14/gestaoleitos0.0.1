-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hospital` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hospital` (
  `hoscodigo` INT NOT NULL,
  `hoscnpj` VARCHAR(18) NULL,
  `hosrazaosocial` VARCHAR(45) NULL,
  `hosendereco` VARCHAR(200) NULL,
  PRIMARY KEY (`hoscodigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enfermaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`enfermaria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`enfermaria` (
  `enfcodigo` INT NOT NULL,
  `enfsigla` VARCHAR(45) NULL,
  `enfnome` VARCHAR(45) NULL,
  `enfhoscodigo` INT NOT NULL,
  PRIMARY KEY (`enfcodigo`),
  INDEX `fk_enfermaria_hospital_idx` (`enfhoscodigo` ASC) VISIBLE,
  CONSTRAINT `fk_enfermaria_hospital`
    FOREIGN KEY (`enfhoscodigo`)
    REFERENCES `mydb`.`hospital` (`hoscodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`leito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`leito` ;

CREATE TABLE IF NOT EXISTS `mydb`.`leito` (
  `letcodigo` INT NOT NULL,
  `letnome` VARCHAR(45) NULL,
  `letipo` VARCHAR(45) NULL,
  `letobservacao` VARCHAR(200) NULL,
  `letenfcodigo` INT NOT NULL,
  PRIMARY KEY (`letcodigo`),
  INDEX `fk_leito_enfermaria1_idx` (`letenfcodigo` ASC) VISIBLE,
  CONSTRAINT `fk_leito_enfermaria1`
    FOREIGN KEY (`letenfcodigo`)
    REFERENCES `mydb`.`enfermaria` (`enfcodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`paciente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`paciente` (
  `paccodigo` INT NOT NULL,
  `pacnome` VARCHAR(45) NOT NULL,
  `pacsexo` VARCHAR(45) NULL,
  `paccnscpf` VARCHAR(45) NULL,
  `pacaih` VARCHAR(45) NULL,
  `pacletcodigo` INT NULL,
  PRIMARY KEY (`paccodigo`, `pacnome`),
  INDEX `fk_paciente_leito1_idx` (`pacletcodigo` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_leito1`
    FOREIGN KEY (`pacletcodigo`)
    REFERENCES `mydb`.`leito` (`letcodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
