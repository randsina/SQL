USE mydb;

SELECT `companies`.`name`
FROM `companies`
INNER JOIN `departments` ON `companies`.`id` = `departments`.`companies_id`
WHERE `departments`.`id` IN (SELECT `departments`.`id`
	FROM `departments`
	INNER JOIN `employees` ON `employees`.`departments_id` = `departments`.`id`
 	GROUP BY `departments`.`name`
	HAVING COUNT(`employees`.`id`) > 1);
