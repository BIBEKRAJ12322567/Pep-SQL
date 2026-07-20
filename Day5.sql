use college_DB;

create table students(
	Student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT null,
    Age INT CHECK(Age>=10),
    Gender VARCHAR(10),
    Branch VARCHAR(10) NOT NULL,
    Semester INT CHECK(Semester Between 1 and 8),
    CGPA DECIMAL (3,2) CHECK (CGPA BETWEEN 0 AND 10),
    City VARCHAR(50) DEFAULT 'DELHI',
    Email VARCHAR(100) UNIQUE,
    Phone_no VARCHAR(20) UNIQUE,
    Admission_date DATE,
    Fees DECIMAL(10,2) CHECK(Fees>0),
    Attendance DECIMAL(5,2)
);

DESC students;

INSERT INTO students VALUES (104,'Aman',21,'M','ECE',6,8.45,'Delhi','aman104@gmail.com','9876543210','2022-07-15',78500.00,91.20);
INSERT INTO students VALUES (105,'Riya',20,'F','CSE',4,9.12,'Jaipur','riya105@gmail.com','9123456789','2023-08-12',82000.00,96.80);
INSERT INTO students VALUES (106,'Karan',22,'M','ME',8,7.35,'Lucknow','karan106@gmail.com','9988776655','2021-06-20',76500.00,88.40);
INSERT INTO students VALUES (107,'Sneha',19,'F','IT',3,8.90,'Bhopal','sneha107@gmail.com','9012345678','2024-01-18',81000.00,94.10);
INSERT INTO students VALUES (108,'Rohit',20,'M','CE',5,6.95,'Chandigarh','rohit108@gmail.com','8899776655','2023-05-10',79000.00,85.75);
INSERT INTO students VALUES (109,'Priya',21,'F','EEE',7,9.45,'Kolkata','priya109@gmail.com','9765432101','2022-09-05',84500.00,97.30);
INSERT INTO students VALUES (110,'Arjun',19,'M','CSE',2,8.10,'Hyderabad','arjun110@gmail.com','9345612780','2024-08-22',80000.00,90.60);
INSERT INTO students VALUES (111,'Neha',20,'F','ECE',5,7.85,'Pune','neha111@gmail.com','9871203456','2023-07-11',79500.00,92.50);
INSERT INTO students VALUES (112,'Vikram',22,'M','ME',8,6.78,'Patna','vikram112@gmail.com','9988123456','2021-08-30',76000.00,84.20);
INSERT INTO students VALUES (113,'Kavya',19,'F','IT',3,9.28,'Ahmedabad','kavya113@gmail.com','9098765432','2024-02-14',81500.00,98.10);


INSERT INTO students (Student_id, Name, Age, Gender, Branch, Semester, CGPA, Email, Phone_no, Admission_date, Fees, Attendance) 
VALUES (103, 'Nu', 20, 'M', 'CSE', 5, 7.90, 'nu123@gmail.com', '34523443323', '2020-05-06', 1234.00, 95.50);

select * from students;

select * from students where cgpa>8;

SELECT * FROM students ORDER BY Fees DESC LIMIT 10;

select count(*),city from students group by city;

select count(distinct city) from students;

INSERT INTO students VALUES (114,'Meera',20,'F','CSE',6,8.65,'Noida','meera114@gmail.com','9876541122','2023-06-12',83000.00,93.40);
INSERT INTO students VALUES (115,'Isha',19,'F','CSE',1,8.95,'Delhi','isha115@gmail.com','9011122233','2025-07-10',85000.00,96.20);
INSERT INTO students VALUES (116,'Rahul',20,'M','ECE',1,7.80,'Noida','rahul116@gmail.com','9022233344','2025-06-15',82000.00,89.60);
INSERT INTO students VALUES (117,'Simran',18,'F','IT',1,9.10,'Jaipur','simran117@gmail.com','9033344455','2025-08-01',87000.00,97.50);
INSERT INTO students VALUES (118,'Aayush',19,'M','ME',1,7.25,'Lucknow','aayush118@gmail.com','9044455566','2025-05-20',80000.00,88.10);
INSERT INTO students VALUES (119,'Pooja',20,'F','EEE',1,8.40,'Chandigarh','pooja119@gmail.com','9055566677','2025-07-25',83500.00,92.30);
select * from students where city in ('Noida','Delhi');

SELECT *
FROM students
WHERE YEAR(Admission_date) = 2025;

SELECT *
FROM students
WHERE Admission_date >= '2025-01-01'
  AND Admission_date <= '2025-12-31';
  
  