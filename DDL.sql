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
-- Table `mydb`.`LOAN_OFFICER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LOAN_OFFICER` (
  `Rec` INT NULL,
  `Ssn` CHAR(45) NOT NULL,
  PRIMARY KEY (`Ssn`),
  CONSTRAINT `fk_Ssn_lOfficer`
    FOREIGN KEY (`Ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EMPLOYEE` (
  `Ssn` CHAR(20) NOT NULL,
  `Salary` INT NULL,
  `Fname` CHAR(45) NULL,
  `Lname` CHAR(45) NULL,
  PRIMARY KEY (`Ssn`),
  CONSTRAINT `ssn`
    FOREIGN KEY (`Ssn`)
    REFERENCES `mydb`.`LOAN_OFFICER` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER_PHNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER_PHNO` (
  `CusSSN` INT NOT NULL,
  `C_phno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CusSSN`, `C_phno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `Cssn` CHAR(30) NOT NULL,
  `Street` CHAR(45) NULL,
  `City` CHAR(45) NULL,
  `Fname` CHAR(45) NULL,
  `Lname` CHAR(45) NULL,
  PRIMARY KEY (`Cssn`),
  CONSTRAINT `Cssn `
    FOREIGN KEY (`Cssn`)
    REFERENCES `mydb`.`CUSTOMER_PHNO` (`CusSSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MANAGER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MANAGER` (
  `Mgr_Ssn` CHAR(45) NOT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`Mgr_Ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ACCOUNT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ACCOUNT` (
  `CID` INT NOT NULL,
  `Cu_Ssn` CHAR(45) NOT NULL,
  `A_num` VARCHAR(45) NULL,
  PRIMARY KEY (`CID`, `Cu_Ssn`),
  INDEX `fk_Cu_Ssn_idx` (`Cu_Ssn` ASC) VISIBLE,
  CONSTRAINT `fk_Cu_Ssn`
    FOREIGN KEY (`Cu_Ssn`)
    REFERENCES `mydb`.`CUSTOMER` (`Cssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TRANS_RECORD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TRANS_RECORD` (
  `T_Cid` INT NOT NULL,
  `Date` DATETIME NULL,
  `Checking` INT NULL,
  `Saving` INT NULL,
  PRIMARY KEY (`T_Cid`),
  CONSTRAINT `fk_T_Cid`
    FOREIGN KEY (`T_Cid`)
    REFERENCES `mydb`.`ACCOUNT` (`CID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTMENT` (
  `D_Name` VARCHAR(45) NULL,
  `Dno` INT NOT NULL,
  PRIMARY KEY (`Dno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Works_For`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Works_For` (
  `SSN` CHAR(35) NOT NULL,
  `D_Num` INT NOT NULL,
  `Mgr_SSN` CHAR(45) NOT NULL,
  PRIMARY KEY (`SSN`, `D_Num`, `Mgr_SSN`),
  INDEX `fk_Mgr_SSN_idx` (`Mgr_SSN` ASC) VISIBLE,
  INDEX `Dno_idx` (`D_Num` ASC) VISIBLE,
  CONSTRAINT `fk_Ssn`
    FOREIGN KEY (`SSN`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mgr_SSN`
    FOREIGN KEY (`Mgr_SSN`)
    REFERENCES `mydb`.`MANAGER` (`Mgr_Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Dno`
    FOREIGN KEY (`D_Num`)
    REFERENCES `mydb`.`DEPARTMENT` (`Dno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TELLER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TELLER` (
  `Deposit` INT NOT NULL,
  `Withdraw` INT NULL,
  `Ssn` CHAR(45) NOT NULL,
  PRIMARY KEY (`Ssn`),
  CONSTRAINT `fk_Ssn_teller`
    FOREIGN KEY (`Ssn`)
    REFERENCES `mydb`.`EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
