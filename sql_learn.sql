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