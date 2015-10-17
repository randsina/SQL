use mydb;
--
-- companies
INSERT INTO companies (name, cost)
VALUES ('Willms-Rau',
        '1415203048.00 USD');

INSERT INTO companies (name, cost)
VALUES ('Schroeder and Sons',
        '3375072784.50 USD');

INSERT INTO companies (name, cost)
VALUES ('Dmore LLC',
        '1945013187.23 USD');

INSERT INTO companies (name, cost)
VALUES ('Schinner, Rempel and Roberts',
        '3823264684.65 USD');
--
-- departments
INSERT INTO departments (name, companies_id)
VALUES ('Fahey Group',
        5);

INSERT INTO departments (name, companies_id)
VALUES ("Kuhlman, Grimes and Bode",
        5);

INSERT INTO departments (name, companies_id)
VALUES ("Torphy, Rodriguez and Swift",
        6);

INSERT INTO departments (name, companies_id)
VALUES ("Kerluke and Sons",
        6);

INSERT INTO departments (name, companies_id)
VALUES ("Hartmann, Sanford and Hills",
        6);

INSERT INTO departments (name, companies_id)
VALUES ("Lueilwitz LLC",
        7);
--
-- employees
INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (6700,
        1,
        49);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (3200,
        1,
        39);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (4600,
        1,
        38);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (1600,
        1,
        34);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (6400,
        1,
        37);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (5600,
        2,
        37);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (5100,
        2,
        40);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (4800,
        2,
        49);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (7100,
        3,
        43);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (1200,
        4,
        37);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (1400,
        5,
        47);

INSERT INTO employees (salary, departments_id, hours_work_per_week)
VALUES (3400,
        6,
        49);
--
-- personal_informations
INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2007-07-27",
        "1973-12-17",
        "90-859-8307-7504446043",
        15,
        "Pearlie",
        "Corwin");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2007-08-06",
        "1979-10-06",
        "93-434-1096-7526516963",
        16,
        "Cicero",
        "Kris");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2007-12-07",
        "1995-07-08",
        "44-887-1644-7893141494",
        17,
        "Jazmyn",
        "Hane");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2013-03-21",
        "1986-12-21",
        "05-690-6309-4019822321",
        18,
        "Price",
        "Mraz");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2009-03-13",
        "1991-09-06",
        "40-157-6866-0006019715",
        19,
        "Clemens",
        "Rath");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2009-12-06",
        "1972-12-15",
        "41-162-5095-7883963972",
        20,
        "Alvah",
        "Wolf");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2011-09-26",
        "1960-04-12",
        "59-657-6448-7841588051",
        21,
        "Jaquelin",
        "Pacocha");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2013-11-21",
        "1966-05-27",
        "01-619-9365-9782780978",
        22,
        "Keon",
        "Schimmel");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2010-07-19",
        "1963-10-03",
        "97-169-8700-3712597321",
        23,
        "Alexis",
        "Kuphal");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2009-05-30",
        "1994-04-18",
        "00-903-0435-7882078889",
        24,
        "Halie",
        "Nader");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2007-03-11",
        "1958-07-20",
        "21-002-2733-8094880773",
        25,
        "Janis",
        "Feest");

INSERT INTO personal_informations (date_of_employment, date_of_birth, social_security_number, employees_id, first_name, last_name)
VALUES ("2013-07-23",
        "1974-08-17",
        "52-825-2261-3816549046",
        26,
        "Ignacio",
        "Welch");
