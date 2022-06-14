create database `student-management`;
CREATE TABLE `class`(
id INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45));
CREATE TABLE `teacher`(
id INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45),
age INT NULL,
`country` VARCHAR(45)NULL);