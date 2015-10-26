SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `employees_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `employees_db` ;

-- -----------------------------------------------------
-- Table `employees_db`.`children`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`children` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`children` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`employees` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `manager_id` INT NULL,
  `salary` INT NULL,
  `hours_work_per_week` INT NULL,
  PRIMARY KEY (`id`)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`cars` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `social_security_number` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `release_year` DATE NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `social_security_number_UNIQUE` (`social_security_number` ASC),
  INDEX `fk_cars_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_cars_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`houses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`houses` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`houses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `house` VARCHAR(45) NULL,
  `apartment` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`personal_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`personal_informations` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`personal_informations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_of_employment` DATE NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `social_security_number` VARCHAR(45) NOT NULL,
  `employees_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `date_of_employment_UNIQUE` (`date_of_employment` ASC),
  INDEX `fk_personal_informations_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_personal_informations_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`bonuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`bonuses` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`bonuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bonuses_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_bonuses_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`holidays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`holidays` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`holidays` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `payment` INT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employees_id`),
  INDEX `fk_holidays_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_holidays_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`votes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`votes` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`votes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `votable_type` VARCHAR(45) NULL,
  `votable_id` INT NULL,
  `vote_weight` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_votes_employees1_idx` (`votable_id` ASC),
  CONSTRAINT `fk_votes_employees1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_projects1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `employees_db`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`employees_has_children`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`employees_has_children` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`employees_has_children` (
  `employees_id` INT NOT NULL,
  `children_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `children_id`),
  INDEX `fk_employees_has_children_children1_idx` (`children_id` ASC),
  INDEX `fk_employees_has_children_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_children_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_children_children1`
    FOREIGN KEY (`children_id`)
    REFERENCES `employees_db`.`children` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employees_db`.`employees_has_houses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employees_db`.`employees_has_houses` ;

CREATE TABLE IF NOT EXISTS `employees_db`.`employees_has_houses` (
  `employees_id` INT NOT NULL,
  `houses_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `houses_id`),
  INDEX `fk_employees_has_houses_houses1_idx` (`houses_id` ASC),
  INDEX `fk_employees_has_houses_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_houses_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `employees_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_houses_houses1`
    FOREIGN KEY (`houses_id`)
    REFERENCES `employees_db`.`houses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- inserts
--
INSERT INTO `employees_db`.`children` (id, first_name, last_name, date_of_birth) SELECT * FROM `mydb`.`children`;

INSERT INTO `employees_db`.`employees` (id, manager_id, salary, hours_work_per_week) SELECT * FROM `mydb`.`employees`;

INSERT INTO `employees_db`.`cars` (id, social_security_number, brand, color, release_year, employees_id) SELECT * FROM `mydb`.`cars`;

INSERT INTO `employees_db`.`houses` (id, city, street, house, apartment) SELECT * FROM `mydb`.`houses`;

INSERT INTO `employees_db`.`personal_informations` (id, date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name) SELECT * FROM `mydb`.`personal_informations`;

INSERT INTO `employees_db`.`bonuses` (id, type, value, employees_id) SELECT * FROM `mydb`.`bonuses`;

INSERT INTO `employees_db`.`holidays` (id, start_date, end_date, payment, employees_id) SELECT * FROM `mydb`.`holidays`;

INSERT INTO `employees_db`.`votes` (id, votable_type, votable_id, vote_weight) SELECT * FROM `mydb`.`votes`;

INSERT INTO `employees_db`.`employees_has_children` (employees_id, children_id) SELECT * FROM `mydb`.`employees_has_children`;

INSERT INTO `employees_db`.`employees_has_houses` (employees_id, houses_id) SELECT * FROM `mydb`.`employees_has_houses`;
