UPDATE `mydb`.`companies`
SET
`name` = "Wolf, Gottlieb and Glover",
`cost` = "7722373152.90 USD"
WHERE `id` = 5;

UPDATE `mydb`.`companies`
SET
`name` = "Volkman, Crist and Kling",
`cost` = "4631711171.67 USD"
WHERE `id` = 6;

UPDATE `mydb`.`departments`
SET
`name` = "Mosciski and Sons",
`companies_id` = 7
WHERE `id` = 1;

UPDATE `mydb`.`departments`
SET
`name` = "Rowe, Von and Dare",
`companies_id` = 7
WHERE `id` = 2;
