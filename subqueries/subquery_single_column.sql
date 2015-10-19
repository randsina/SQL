SELECT `employees`.`salary`
FROM `mydb`.`employees`
WHERE `employees`.`id` IN (SELECT `personal_informations`.`employees_id`
	FROM `mydb`.`personal_informations`);
