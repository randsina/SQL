SELECT *
FROM `mydb`.`personal_informations`
WHERE `personal_informations`.`date_of_employment` < '2010-01-01'
AND `personal_informations`.`date_of_birth` > '1990-01-01';

SELECT `employees`.`id`,
    `employees`.`departments_id`
FROM `mydb`.`employees`
WHERE `employees`.`salary` BETWEEN 2000 AND 6000
AND `employees`.`hours_work_per_week` < 40;
