SELECT `departments`.`name`, COUNT(`employees`.`id`)
FROM `mydb`.`employees`
LEFT JOIN `mydb`.`departments`
ON `employees`.`departments_id` = `departments`.`id`
GROUP BY `departments`.`name`;

SELECT `personal_informations`.`last_name`, `personal_informations`.`first_name`, SUM(`employees`.`hours_work_per_week` * `employees`.`salary`)
FROM `mydb`.`employees`
INNER JOIN `mydb`.`personal_informations`
ON `personal_informations`.`employees_id` = `employees`.`id`
GROUP BY `personal_informations`.`last_name`;
