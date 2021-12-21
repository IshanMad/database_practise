/*create database*/
CREATE DATABASE selfleran;
/*create table*/
CREATE TABLE student (
	id INT AUTO_INCREMENT ,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'UNDECIDED',
	PRIMARY KEY(ID)
);

/*add another column*/
ALTER TABLE student ADD gpa DECIMAL(3,2);
/*describe table */
DESCRIBE student;
/*drop table column*/
ALTER TABLE student DROP COLUMN gpa;
/*inserting data to table*/
INSERT INTO student VALUES(1,'Ishan','Biology');
/*Get all data in the table*/
SELECT * FROM student
/*Insert Specific Values*/
INSERT INTO student(id,name) VALUES(2,'kasun');
/*update table*/
UPDATE student SET major = 'bio' WHERE major = 'Biology';
/*update using OR logic*/
UPDATE student SET major = 'bio' WHERE major = 'Biology' OR major ='UNDECIDED';
/*update multiple comments*/
UPDATE student SET name = 'Tom',major = 'undecied' WHERE id = 1;
/*update specific colum all rows given value*/
UPDATE student SET major = 'undecied';
/*delete all rows given table*/
DELETE FROM student;
/*delete given student data*/
DELETE FROM student WHERE id = 5;
/*delete table rows with and operator*/
DELETE FROM student WHERE name = 'Dasun' AND major = 'undecided';
/*basic queries*/
SELECT * FROM student;
/*select specific rows values*/
SELECT student.name,student.major FROM student;
/*get valiues by alpahabetical oder*/
SELECT student.name,student.major FROM student ORDER BY name;
/*get all the values desinding order*/
SELECT student.name,student.major FROM student ORDER BY name DESC;
/*get all rows desnding order using primary key*/
SELECT * FROM student ORDER BY student.id DESC
/*oder by major frist and after student id*/
SELECT * FROM `student` ORDER BY major, id;
/*retrive specific number of rows*/
SELECT * FROM `student` LIMIT 2;
/*oder by and limit both togethr */
SELECT * FROM `student` ORDER BY id DESC LIMIT 2;
/*retrive specific colums using where*/
SELECT name,major FROM student WHERE major = 'Chemistry';
/*select with OR condition*/
SELECT name,major FROM student WHERE major = 'Chemistry' OR major = 'Biology';
/* "<>"" = not equal sigin in SQL*/
SELECT name,major FROM student WHERE major <> 'Chemistry';
/*select all the student less than 3 "<" less than operater in sql*/
SELECT name,major FROM student WHERE id < 3;
/*select with less than or equal and not equal*/
SELECT name,major FROM student WHERE id <= 3 AND name <> 'ishan';
/*compare one colu diffrent values*/
SELECT * FROM student WHERE name IN ('ishan','supun');
/* select where in an and together*/
SELECT * FROM student WHERE name IN ('kasun','supun') AND id > 1 ;
/*create company database*/
/*employee table*/
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);
/*create branch table*/
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);
/*redefine relation ship ALTER TABLE used to modify exsisting table*/
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;/*when delete primary ke it set as null value*/

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;
/*Branch Table*/
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);
/*Work with table*/
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),/*composite attribute both are primary keys*/
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,/*when employee id delete this table row delete*/
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);
/*BranCH Supplier table*/
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);/*add employe before creating the branch*/

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');/*insert values to branch*/

UPDATE employee /*update empoyee table branch*/
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);/*inset values to againemployee table*/

-- Scranton Branch mploye and values adding
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford branch values addng
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER values inserting
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');
 
 -- CLIENT Table Values Inserting
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);


-- WORKS_WITH Table values inserting
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

/*got all employyes*/
SELECT * FROM employee;
/*got all values in work with table*/
SELECT * FROM works_with;
/*got all clinents*/
SELECT * FROM client;
/*More Basic Queries*/
--find all employees oder by salary
SELECT * FROM employee ORDER BY salary;
--find highst salary employees to lowst salary
SELECT * FROM employee ORDER BY salary DESC;
--find all employees orderd by sex then name
SELECT * FROM employee ORDER BY sex,first_name,last_name;
--find frist 5 employees in the table
SELECT * FROM employee LIMIT 5;
--find frist name and last name of all employee
SELECT frist_name,last_name FROM employee;
--change colum names when data reciving use AS key word
SELECT first_name AS forename,last_name AS surename FROM employee;
--find out all the diffrent genders
/*The SELECT DISTINCT statement is used to return only distinct (different) values.
 inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.*/
SELECT DISTINCT sex FROM employee;
--distinct more 
SELECT DISTINCT branch_id FROM employee;

--FUNCTIONS
--count functio calculate some  raw count
SELECT COUNT(emp_id) FROM employee;
--count all supervisers
SELECT COUNT(super_id) FROM employee;
--find the number of female employees born after 1970
SELECT COUNT(emp_id) FROM employee WHERE sex="F" AND birth_date > '1970-01-01';
--retrive all female employees bron after 1970
SELECT * FROM employee WHERE sex="F" AND birth_day > '1970-01-01';
--find the avarage  salary of all empoyee salaries 
SELECT AVG(salary) FROM employee;
--find the varage salary of male employees
SELECT AVG(salary) FROM employee WHERE sex = 'M';
--find sum of all emp salaries
SELECT SUM(salary) FROM employee;
--find out how many males and femals there are(Aggraion display data in more help full way)
SELECT COUNT(sex),sex FROM employee GROUP BY sex;
--find the total sales of each sales man
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id;
--how much each client spend
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id;
--how much each client spend order by with group by 
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id ORDER BY client_id DESC;
--WILD CARDS
--find client who is in LLC using like
SELECT * FROM client WHERE client_name LIKE '%LLC';
--find any branch suppliers who are in the lable business 
SELECT * FROM branch_supplier where supplier_name LIKE '%Lable%';
--find any employee bron on octomber _resperesent one character
SELECT * FROM employee WHERE birth_daY LIKE '____-10%';
--find any client who are schools
SELECT * FROM client WHERE client_name LIKE '%school%';
--Unions 
--find a list of employee and branch names
SELECT first_name FROM employee UNION SELECT branch_name FROM branch;
--find a list of all clients and branch suppiers names
SELECT client_name FROM client UNION SELECT supplier_name FROM branch_supplier;
--find a list of all money spent or earned by the company
SELECT salary FROM employee UNION SELECT total_sales FROM works_with;
--JOINS
INSERT INTO branch VALUES (4,'Buffalo',NULL,NULL);
SELECT * FROM branch;
--FIND ALL BRANCHES AND THE NAMES OF THIER MANAGERS
--INNERJOIN
SELECT employee.emp_id, employee.frist_name,branch.branch_name FROM employee 
JOIN branch ON employee.emp_id = branch.mgr_id;
--LEFT JOIN (left join include all raws in the left table)
SELECT employee.emp_id, employee.first_name,branch.branch_name FROM employee 
LEFT JOIN branch ON employee.emp_id = branch.mgr_id;
--RIGHT JOIN (iNCLUDE ALL ROWS IN THE RIGHT TABLE)
SELECT employee.emp_id, employee.first_name,branch.branch_name FROM employee 
RIGHT JOIN branch ON employee.emp_id = branch.mgr_id;
--NESTED QUERIES
--FIND NAMES OF ALL EMPLOYEES WHO AHVE SOLD OVER 30 000 TO A SINGLE CLIENT
SELECT employee.first_name,employee.last_name FROM employee
WHERE employee.emp_id IN( SELECT works_with.emp_id FROM works_with 
WHERE works_with.total_sales > 30000);
-- find all client who are handeld by the branch that michal scott manages assume you know Michel's ID;
SELECT client.client_name FROM client WHERE client.branch_id = (
SELECT branch.branch_id  FROM branch WHERE branch.mgr_id=102 LIMIT 1);
