SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `companies_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `companies_db` ;

-- -----------------------------------------------------
-- Table `companies_db`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`companies` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`departments` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `companies_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_departments_companies1_idx` (`companies_id` ASC),
  CONSTRAINT `fk_departments_companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies_db`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`employees` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `manager_id` INT NULL,
  `salary` INT NULL,
  `departments_id` INT NOT NULL,
  `hours_work_per_week` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_employees_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `companies_db`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`personal_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`personal_informations` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`personal_informations` (
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
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`bonuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`bonuses` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`bonuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bonuses_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_bonuses_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`holidays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`holidays` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`holidays` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `payment` INT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employees_id`),
  INDEX `fk_holidays_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_holidays_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`offices` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`offices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `house` VARCHAR(45) NULL,
  `space` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`projects` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cost` INT NULL,
  `date_of_delivery` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`votes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`votes` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`votes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `votable_type` VARCHAR(45) NULL,
  `votable_id` INT NULL,
  `vote_weight` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_votes_employees1_idx` (`votable_id` ASC),
  CONSTRAINT `fk_votes_employees1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_projects1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `companies_db`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`roles` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`employees_has_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`employees_has_roles` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`employees_has_roles` (
  `employees_id` INT NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `roles_id`),
  INDEX `fk_employees_has_roles_roles1_idx` (`roles_id` ASC),
  INDEX `fk_employees_has_roles_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_roles_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `companies_db`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`departments_has_offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`departments_has_offices` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`departments_has_offices` (
  `departments_id` INT NOT NULL,
  `offices_id` INT NOT NULL,
  PRIMARY KEY (`departments_id`, `offices_id`),
  INDEX `fk_departments_has_offices_offices1_idx` (`offices_id` ASC),
  INDEX `fk_departments_has_offices_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_departments_has_offices_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `companies_db`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_has_offices_offices1`
    FOREIGN KEY (`offices_id`)
    REFERENCES `companies_db`.`offices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`departments_has_projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`departments_has_projects` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`departments_has_projects` (
  `departments_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`departments_id`, `projects_id`),
  INDEX `fk_departments_has_projects_projects1_idx` (`projects_id` ASC),
  INDEX `fk_departments_has_projects_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_departments_has_projects_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `companies_db`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `companies_db`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `companies_db`.`employees_has_projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `companies_db`.`employees_has_projects` ;

CREATE TABLE IF NOT EXISTS `companies_db`.`employees_has_projects` (
  `employees_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `projects_id`),
  INDEX `fk_employees_has_projects_projects1_idx` (`projects_id` ASC),
  INDEX `fk_employees_has_projects_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_projects_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `companies_db`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `companies_db`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- inserts
--
INSERT INTO `companies_db`.`companies` (id, name, cost) SELECT * FROM `mydb`.`companies`;

INSERT INTO `companies_db`.`departments` (id, name, companies_id) SELECT * FROM `mydb`.`departments`;

INSERT INTO `companies_db`.`employees` (id, manager_id, salary, departments_id, hours_work_per_week) SELECT * FROM `mydb`.`employees`

INSERT INTO `companies_db`.`personal_informations` (id, date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name) SELECT * FROM `mydb`.`personal_informations`;

INSERT INTO `companies_db`.`bonuses` (id, type, value, employees_id) SELECT * FROM `mydb`.`bonuses`;

INSERT INTO `companies_db`.`holidays` (id, start_date, end_date, payment, employees_id) SELECT * FROM `mydb`.`holidays`;

INSERT INTO `companies_db`.`offices` (id, city, street, house, space) SELECT * FROM `mydb`.`offices`;

INSERT INTO `companies_db`.`projects` (id, name, cost, date_of_delivery) SELECT * FROM `mydb`.`projects`;

INSERT INTO `companies_db`.`votes` (id, votable_type, votable_id, vote_weight) SELECT * FROM `mydb`.`votes`;

INSERT INTO `companies_db`.`roles` (id, type) SELECT * FROM `mydb`.`roles`;

INSERT INTO `companies_db`.`employees_has_roles` (employees_id, roles_id) SELECT * FROM `mydb`.`employees_has_roles`;

INSERT INTO `companies_db`.`departments_has_offices` (departments_id, offices_id) SELECT * FROM `mydb`.`departments_has_offices`;

INSERT INTO `companies_db`.`departments_has_projects` (departments_id, projects_id) SELECT * FROM `mydb`.`departments_has_projects`;

INSERT INTO `companies_db`.`employees_has_projects` (employees_id, projects_id) SELECT * FROM `mydb`.`employees_has_projects`;
