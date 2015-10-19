SELECT *
FROM `mydb`.`employees`
WHERE `employees`.`id`=(SELECT `personal_informations`.`employees_id`
	FROM `mydb`.`personal_informations`
	WHERE `personal_informations`.`id` = 6);
