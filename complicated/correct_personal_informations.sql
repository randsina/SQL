USE mydb;

-- check: is db correct?
SELECT CONCAT(`personal_informations`.`first_name`, ' ', `personal_informations`.`last_name`)
AS 'full_name', COUNT(`personal_informations`.`id`)
FROM `personal_informations`
INNER JOIN `employees` ON `employees`.`id` = `personal_informations`.`employees_id`
GROUP BY `employees`.`id`
HAVING COUNT(`personal_informations`.`id`) != 1;
