SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`children`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`children` ;

CREATE TABLE IF NOT EXISTS `mydb`.`children` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `date_of_birth` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`companies` ;

CREATE TABLE IF NOT EXISTS `mydb`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`departments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `companies_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_departments_companies1_idx` (`companies_id` ASC),
  CONSTRAINT `fk_departments_companies1`
    FOREIGN KEY (`companies_id`)
    REFERENCES `mydb`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `manager_id` INT NULL,
  `salary` INT NULL,
  `departments_id` INT NOT NULL,
  `hours_work_per_week` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_employees_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `mydb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cars` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
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
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`houses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`houses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`houses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `house` VARCHAR(45) NULL,
  `apartment` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`personal_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`personal_informations` ;

CREATE TABLE IF NOT EXISTS `mydb`.`personal_informations` (
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
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bonuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`bonuses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`bonuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bonuses_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_bonuses_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`holidays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`holidays` ;

CREATE TABLE IF NOT EXISTS `mydb`.`holidays` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `payment` INT NULL,
  `employees_id` INT NOT NULL,
  PRIMARY KEY (`id`, `employees_id`),
  INDEX `fk_holidays_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_holidays_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`offices` ;

CREATE TABLE IF NOT EXISTS `mydb`.`offices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `house` VARCHAR(45) NULL,
  `space` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`projects` ;

CREATE TABLE IF NOT EXISTS `mydb`.`projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `cost` INT NULL,
  `date_of_delivery` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`votes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`votes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`votes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `votable_type` VARCHAR(45) NULL,
  `votable_id` INT NULL,
  `vote_weight` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_votes_employees1_idx` (`votable_id` ASC),
  CONSTRAINT `fk_votes_employees1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_votes_projects1`
    FOREIGN KEY (`votable_id`)
    REFERENCES `mydb`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`roles` ;

CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees_has_roles` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees_has_roles` (
  `employees_id` INT NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `roles_id`),
  INDEX `fk_employees_has_roles_roles1_idx` (`roles_id` ASC),
  INDEX `fk_employees_has_roles_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_roles_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `mydb`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_children`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees_has_children` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees_has_children` (
  `employees_id` INT NOT NULL,
  `children_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `children_id`),
  INDEX `fk_employees_has_children_children1_idx` (`children_id` ASC),
  INDEX `fk_employees_has_children_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_children_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_children_children1`
    FOREIGN KEY (`children_id`)
    REFERENCES `mydb`.`children` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departments_has_offices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`departments_has_offices` ;

CREATE TABLE IF NOT EXISTS `mydb`.`departments_has_offices` (
  `departments_id` INT NOT NULL,
  `offices_id` INT NOT NULL,
  PRIMARY KEY (`departments_id`, `offices_id`),
  INDEX `fk_departments_has_offices_offices1_idx` (`offices_id` ASC),
  INDEX `fk_departments_has_offices_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_departments_has_offices_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `mydb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_has_offices_offices1`
    FOREIGN KEY (`offices_id`)
    REFERENCES `mydb`.`offices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departments_has_projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`departments_has_projects` ;

CREATE TABLE IF NOT EXISTS `mydb`.`departments_has_projects` (
  `departments_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`departments_id`, `projects_id`),
  INDEX `fk_departments_has_projects_projects1_idx` (`projects_id` ASC),
  INDEX `fk_departments_has_projects_departments1_idx` (`departments_id` ASC),
  CONSTRAINT `fk_departments_has_projects_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `mydb`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `mydb`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_houses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees_has_houses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees_has_houses` (
  `employees_id` INT NOT NULL,
  `houses_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `houses_id`),
  INDEX `fk_employees_has_houses_houses1_idx` (`houses_id` ASC),
  INDEX `fk_employees_has_houses_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_houses_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_houses_houses1`
    FOREIGN KEY (`houses_id`)
    REFERENCES `mydb`.`houses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employees_has_projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees_has_projects` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees_has_projects` (
  `employees_id` INT NOT NULL,
  `projects_id` INT NOT NULL,
  PRIMARY KEY (`employees_id`, `projects_id`),
  INDEX `fk_employees_has_projects_projects1_idx` (`projects_id` ASC),
  INDEX `fk_employees_has_projects_employees1_idx` (`employees_id` ASC),
  CONSTRAINT `fk_employees_has_projects_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `mydb`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_projects_projects1`
    FOREIGN KEY (`projects_id`)
    REFERENCES `mydb`.`projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
