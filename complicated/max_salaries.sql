USE mydb;

SELECT MAX(`employees`.`salary`) AS salary,
	   `departments`.`name`,
	   CONCAT(`personal_informations`.`first_name`, ' ', `personal_informations`.`last_name`) AS full_name
FROM `employees`
INNER JOIN `departments` ON `departments`.`id` = `employees`.`departments_id`
INNER JOIN `personal_informations` ON `personal_informations`.`employees_id` = `employees`.`id`
GROUP BY `departments`.`name`
HAVING AVG(`employees`.`salary`) > 2000;
