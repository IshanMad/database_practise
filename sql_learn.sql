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