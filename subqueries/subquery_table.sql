SELECT `employees`.`hours_work_per_week`,
	`employees`.`salary`
FROM `mydb`.`employees`
WHERE `employees`.`salary` < (
SELECT AVG(`employees`.`salary`)
FROM `mydb`.`employees`);