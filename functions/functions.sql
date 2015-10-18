SELECT `personal_informations`.`id`,
    ROUND(DATEDIFF(`personal_informations`.`date_of_employment`,
    `personal_informations`.`date_of_birth`), -2),
    CONVERT(REPLACE(`personal_informations`.`social_security_number`, '-', ''), SIGNED),
    `personal_informations`.`employees_id`,
    LCASE(`personal_informations`.`first_name`),
    UCASE(`personal_informations`.`last_name`)
FROM `mydb`.`personal_informations`;
