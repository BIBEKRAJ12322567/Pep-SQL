use college_DB;

select count(*) from student;

select avg(cgpa) as avg_cgpa from student;

select * from student where attendance=(select max(attendance) from student);

select min(age) from student;

select sum(fees) as total_fees from student;

select * from student where city='Delhi';

select * from student;

select * from student where branch='IT';

select * from student where branch='CSE';

select count(*) from student where name like 'A%'; -- starting with a

select sum(fees) from student where cgpa>8.0;

SELECT AVG(fees) FROM student WHERE city IN ('Delhi', 'Jaipur') AND cgpa > 8.0;

select max(attendance) from student where branch='Mech';

select count(*) from student where name like '%A' AND age between 18 and 22;

SELECT AVG(cgpa), branch 
FROM student 
GROUP BY branch
ORDER BY branch ASC;



select min(attendance) , branch from student GROUP BY branch;

select branch,avg(cgpa) from student group by branch having avg(cgpa)>5.0 ;

select branch,sum(fees) from student group by branch having sum(fees)>50000;

select city from student group by city having avg(attendance)>20;

select count(*),branch from student group by branch;

select avg(cgpa), branch from student group by branch;

select city, avg(cgpa) from student group by city having avg(cgpa)>5;

select branch,max(cgpa) as highest_cgpa from student group by branch;

