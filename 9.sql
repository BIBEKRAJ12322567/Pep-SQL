use college_DB;

SHOW TABLES;

CREATE TABLE DEPARTMENTS(
department_id INT PRIMARY KEY,
department_name VARCHAR(50),
hod_name VARCHAR(100)
);
INSERT INTO DEPARTMENTS (department_id, department_name, hod_name)
VALUES
(101, 'Computer Science', 'Dr. Amit Sharma'),
(102, 'Information Technology', 'Dr. Priya Singh'),
(103, 'Electronics', 'Dr. Rajesh Kumar'),
(104, 'Mechanical', 'Dr. Neha Verma'),
(105, 'Civil', 'Dr. Sandeep Mishra');

SELECT * FROM DEPARTMENTS;

CREATE TABLE faculty(
faculty_id INT PRIMARY KEY,
faculty_name VARCHAR(100),
department_id INT,
FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

INSERT INTO faculty (faculty_id, faculty_name, department_id)
VALUES
(201, 'Dr. Anil Sharma', 101),
(202, 'Dr. Priya Verma', 102),
(203, 'Dr. Rajesh Kumar', 103),
(204, 'Dr. Neha Singh', 104),
(205, 'Dr. Sandeep Mishra', 105);

CREATE TABLE courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
faculty_id INT,
duration_months INT,
FOREIGN KEY(faculty_id)
    REFERENCES faculty(faculty_id)
);

INSERT INTO courses (course_id, course_name, faculty_id, duration_months)
VALUES
(301, 'Database Management System', 201, 6),
(302, 'Data Structures', 202, 4),
(303, 'Operating Systems', 203, 5),
(304, 'Computer Networks', 204, 4),
(305, 'Web Development', 205, 3);

DESC departments;
DESC faculty;
DESC courses;

SHOW CREATE TABLE courses;
SHOW CREATE TABLE faculty;
SHOW CREATE TABLE departments;
SHOW CREATE TABLE students;

ALTER TABLE students
ADD COLUMN department_id INT;

UPDATE students
SET department_id =10
WHERE student_id IN (103,104,105);

UPDATE students
SET department_id =20
WHERE student_id IN (106,107,108);

SELECT * FROM students;

ALTER TABLE students
ADD faculty_id INT;

UPDATE students SET faculty_id = 201 WHERE Student_id = 103;
UPDATE students SET faculty_id = 202 WHERE Student_id = 104;
UPDATE students SET faculty_id = 203 WHERE Student_id = 105;
UPDATE students SET faculty_id = 204 WHERE Student_id = 106;
UPDATE students SET faculty_id = 205 WHERE Student_id = 107;
UPDATE students SET faculty_id = 201 WHERE Student_id = 108;
UPDATE students SET faculty_id = 202 WHERE Student_id = 109;
UPDATE students SET faculty_id = 203 WHERE Student_id = 110;
UPDATE students SET faculty_id = 204 WHERE Student_id = 111;
UPDATE students SET faculty_id = 205 WHERE Student_id = 112;
UPDATE students SET faculty_id = 201 WHERE Student_id = 113;
UPDATE students SET faculty_id = 202 WHERE Student_id = 114;
UPDATE students SET faculty_id = 203 WHERE Student_id = 115;
UPDATE students SET faculty_id = 204 WHERE Student_id = 116;
UPDATE students SET faculty_id = 205 WHERE Student_id = 117;
UPDATE students SET faculty_id = 201 WHERE Student_id = 118;
UPDATE students SET faculty_id = 202 WHERE Student_id = 119;
