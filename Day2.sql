USE college_DB;

INSERT INTO student VALUES (110, 'XYZ', 'MBA', 7.77, 'Delhi', NULL);


SELECT student_id,name FROM student WHERE age IS NULL;

DESC student;

SELECT * from student WHERE age between 19 AND 22;

SELECT * from student WHERE age in (19,22);

SELECT * FROM student WHERE name like '%A'; -- find a in the last of name

SELECT * FROM student WHERE name like '%A%'; -- find a anywhere in the name 

SELECT * FROM student WHERE name like '____'; -- return nam with 4 characters i.e. length of 4

SELECT * FROM student WHERE branch like '%E';

SELECT * FROM student ORDER by name DESC;

SELECT * FROM student ORDER by age ASC;

SELECT * FROM student ORDER BY branch ASC, name ASC;

SELECT * FROM student WHERE branch='CSE';

SELECT * FROM student WHERE age between 19 and 21;

SELECT * FROM student WHERE branch='CSE' OR branch='IT';

SELECT * FROM student WHERE name like 'S%';

SELECT DISTINCT branch FROM student;

SELECT name , cgpa from student;

SELECT * FROM student Order by CGPA DESC;