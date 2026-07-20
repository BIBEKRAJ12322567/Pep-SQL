use college_DB;

ALTER TABLE student
ADD gender VARCHAR(20),
ADD semester INT,
ADD email VARCHAR(100),
ADD phone_no VARCHAR(15),
ADD admission_date DATE,
ADD fees DECIMAL(10,2),
ADD attendance DECIMAL(5,2);

DESC student;


select * from student;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET  gender='M',
	semester=5,
    email='bibek1234@gmail.com',
    phone_no='456788766',
    admission_date='2023-07-15',
    fees=120000,
    attendance=75.0
WHERE student_id=101;
    
    

UPDATE student
SET gender = 'M',
    semester = 5,
    email = 'rahul@gmail.com',
    phone_no = '9876543211',
    admission_date = '2022-07-15',
    fees = 48000,
    attendance = 80.0
WHERE student_id = 102;

-- Student 103
UPDATE student
SET gender = 'F',
    semester = 6,
    email = 'priya@gmail.com',
    phone_no = '9876543212',
    admission_date = '2022-07-15',
    fees = 52000,
    attendance = 92.0
WHERE student_id = 103;

-- Student 104
UPDATE student
SET gender = 'M',
    semester = 4,
    email = 'aman@gmail.com',
    phone_no = '9876543213',
    admission_date = '2022-07-15',
    fees = 45000,
    attendance = 78.0
WHERE student_id = 104;

-- Student 105
UPDATE student
SET gender = 'F',
    semester = 6,
    email = 'sneha@gmail.com',
    phone_no = '9876543214',
    admission_date = '2022-07-15',
    fees = 51000,
    attendance = 88.0
WHERE student_id = 105;

UPDATE student
SET gender='T',
	age=25,
    semester=6,
    email='xyz123@gmail.com',
    phone_no='234567890987',
    admission_date='2019-01-20',
    fees=125465,
    attendance=65.25
where student_id=110;

DESC student;

INSERT INTO student
(student_id, student_name, branch, cgpa, city, age, gender, semester, email, phone_no, admission_date, fees, attendance)
VALUES
(111, 'Arjun',  'CSE', 8.20, 'Pune',     21, 'M', 5, 'arjun@gmail.com',  '9876500011', '2023-07-10', 110000.00, 82.50),
(112, 'Neha',   'ECE', 7.60, 'Jaipur',   20, 'F', 4, 'neha@gmail.com',   '9876500012', '2022-07-12',  90000.00, 78.00),
(113, 'Ravi',   'IT',  8.75, 'Kolkata',  22, 'M', 6, 'ravi@gmail.com',   '9876500013', '2021-07-15',  95000.00, 85.00),
(114, 'Kiran',  'ME',  7.95, 'Chennai',  21, 'F', 5, 'kiran@gmail.com',  '9876500014', '2022-07-18',  87000.00, 80.50),
(115, 'Sahil',  'CSE', 8.10, 'Patna',    20, 'M', 4, 'sahil@gmail.com',  '9876500015', '2023-07-20', 100000.00, 88.00),
(116, 'Isha',   'IT',  9.00, 'Bhopal',   22, 'F', 6, 'isha@gmail.com',   '9876500016', '2021-07-22', 120000.00, 91.00),
(117, 'Vikram', 'ECE', 7.40, 'Indore',   23, 'M', 5, 'vikram@gmail.com', '9876500017', '2022-07-25',  85000.00, 76.50);

select count(*) from student;

select distinct city from student;

select AVG(cgpa) AS avcg from student;

SELECT DISTINCT branch FROM student;

SELECT name,seme FROM student where branch='CSE';
