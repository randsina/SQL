DELETE FROM `mydb`.`personal_informations`
WHERE id BETWEEN 1 AND 4;

SET foreign_key_checks = 0;
DELETE FROM `mydb`.`employees`
WHERE id BETWEEN 15 AND 19;
SET foreign_key_checks = 1;
