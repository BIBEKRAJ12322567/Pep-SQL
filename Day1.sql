CREATE DATABASE College_DB;

USE College_DB;

CREATE TABLE student (
    student_id INT,
    name VARCHAR(30),
    branch VARCHAR(20),
    cgpa DECIMAL(4,2),
    city VARCHAR(20),
    age INT
);

DESC student;


INSERT INTO student
VALUES
(101, 'Bibek', 'CSE', 8.50, 'Bhubaneswar', 21),
(102, 'Rahul', 'ECE', 7.80, 'Delhi', 20),
(103, 'Priya', 'IT', 9.10, 'Mumbai', 22),
(104, 'Aman', 'CSE', 7.85, 'Lucknow', 19),
(105, 'Sneha', 'ME', 8.95, 'Ahmedabad', 20);

SELECT * FROM student;

ALTER TABLE student
RENAME COLUMN name TO student_name;

SELECT
    student_name AS Name,
    student_id AS Registration_ID,
    cgpa AS CGPA
FROM student;

SELECT
    student_name AS Name,
    cgpa AS CGPA,
    cgpa + 1 AS Bonus_CGPA
FROM student;

SELECT DISTINCT city
FROM student;

SELECT student_name, branch
FROM student
WHERE branch = 'IT';


SELECT student_name
FROM student
WHERE city = 'Delhi';

SELECT *
FROM student
WHERE city = 'Delhi';