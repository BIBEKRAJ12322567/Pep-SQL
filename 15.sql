DROP DATABASE IF EXISTS CompanyDB;
-- Create Database
CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employee (emp_id, emp_name, department, salary) VALUES
(101, 'Rahul', 'IT', 55000.00),
(102, 'Aman', 'HR', 42000.50),
(103, 'Priya', 'Finance', 70000.00),
(104, 'Sneha', 'IT', 60000.75),
(105, 'Rohit', 'Sales', 45000.00),
(106, 'Kiran', 'HR', 52000.00);

SELECT * FROM Employee;

DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

CALL ShowAllEmployees();


DELIMITER //
CREATE PROCEDURE ShowITEmployees()
BEGIN
    SELECT * 
    FROM Employee
    WHERE department = 'IT';
END //
DELIMITER ;

CALL ShowITEmployees();



DELIMITER //
CREATE PROCEDURE EmployeeDepartment(IN dept VARCHAR(30))
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept;
END //
DELIMITER ;

CALL EmployeeDepartment('IT');
CALL EmployeeDepartment('HR');
CALL EmployeeDepartment('Sales');


DELIMITER //
CREATE PROCEDURE SalaryGreaterThan(IN amount DECIMAL(10,2))
BEGIN
    SELECT *
    FROM Employee
    WHERE salary > amount;
END //
DELIMITER ;

DELIMITER //

CALL SalaryGreaterThan(50000);


DELIMITER //
CREATE PROCEDURE EmployeeFilter(
    IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept
      AND salary >= minSalary;
END //
DELIMITER ;

CALL EmployeeFilter('IT', 50000);
DROP DATABASE IF EXISTS CompanyDB;
-- Create Database
CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employee (emp_id, emp_name, department, salary) VALUES
(101, 'Rahul', 'IT', 55000.00),
(102, 'Aman', 'HR', 42000.50),
(103, 'Priya', 'Finance', 70000.00),
(104, 'Sneha', 'IT', 60000.75),
(105, 'Rohit', 'Sales', 45000.00),
(106, 'Kiran', 'HR', 52000.00);

SELECT * FROM Employee;

DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

CALL ShowAllEmployees();


DELIMITER //
CREATE PROCEDURE ShowITEmployees()
BEGIN
    SELECT * 
    FROM Employee
    WHERE department = 'IT';
END //
DELIMITER ;

CALL ShowITEmployees();



DELIMITER //
CREATE PROCEDURE EmployeeDepartment(IN dept VARCHAR(30))
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept;
END //
DELIMITER ;

CALL EmployeeDepartment('IT');
CALL EmployeeDepartment('HR');
CALL EmployeeDepartment('Sales');


DELIMITER //
CREATE PROCEDURE SalaryGreaterThan(IN amount DECIMAL(10,2))
BEGIN
    SELECT *
    FROM Employee
    WHERE salary > amount;
END //
DELIMITER ;

DELIMITER //

CALL SalaryGreaterThan(50000);


DELIMITER //
CREATE PROCEDURE EmployeeFilter(
    IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept
      AND salary >= minSalary;
END //
DELIMITER ;

CALL EmployeeFilter('IT', 50000);
DROP DATABASE IF EXISTS CompanyDB;
-- Create Database
CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employee (emp_id, emp_name, department, salary) VALUES
(101, 'Rahul', 'IT', 55000.00),
(102, 'Aman', 'HR', 42000.50),
(103, 'Priya', 'Finance', 70000.00),
(104, 'Sneha', 'IT', 60000.75),
(105, 'Rohit', 'Sales', 45000.00),
(106, 'Kiran', 'HR', 52000.00);

SELECT * FROM Employee;

DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

CALL ShowAllEmployees();


DELIMITER //
CREATE PROCEDURE ShowITEmployees()
BEGIN
    SELECT * 
    FROM Employee
    WHERE department = 'IT';
END //
DELIMITER ;

CALL ShowITEmployees();



DELIMITER //
CREATE PROCEDURE EmployeeDepartment(IN dept VARCHAR(30))
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept;
END //
DELIMITER ;

CALL EmployeeDepartment('IT');
CALL EmployeeDepartment('HR');
CALL EmployeeDepartment('Sales');


DELIMITER //
CREATE PROCEDURE SalaryGreaterThan(IN amount DECIMAL(10,2))
BEGIN
    SELECT *
    FROM Employee
    WHERE salary > amount;
END //
DELIMITER ;

DELIMITER //

CALL SalaryGreaterThan(50000);


DELIMITER //
CREATE PROCEDURE EmployeeFilter(
    IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept
      AND salary >= minSalary;
END //
DELIMITER ;

CALL EmployeeFilter('IT', 50000);

DROP DATABASE IF EXISTS CompanyDB;
-- Create Database
CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employee (emp_id, emp_name, department, salary) VALUES
(101, 'Rahul', 'IT', 55000.00),
(102, 'Aman', 'HR', 42000.50),
(103, 'Priya', 'Finance', 70000.00),
(104, 'Sneha', 'IT', 60000.75),
(105, 'Rohit', 'Sales', 45000.00),
(106, 'Kiran', 'HR', 52000.00);

SELECT * FROM Employee;

DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

CALL ShowAllEmployees();


DELIMITER //
CREATE PROCEDURE ShowITEmployees()
BEGIN
    SELECT * 
    FROM Employee
    WHERE department = 'IT';
END //
DELIMITER ;

CALL ShowITEmployees();



DELIMITER //
CREATE PROCEDURE EmployeeDepartment(IN dept VARCHAR(30))
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept;
END //
DELIMITER ;

CALL EmployeeDepartment('IT');
CALL EmployeeDepartment('HR');
CALL EmployeeDepartment('Sales');


DELIMITER //
CREATE PROCEDURE SalaryGreaterThan(IN amount DECIMAL(10,2))
BEGIN
    SELECT *
    FROM Employee
    WHERE salary > amount;
END //
DELIMITER ;

DELIMITER //

CALL SalaryGreaterThan(50000);


DELIMITER //
CREATE PROCEDURE EmployeeFilter(
    IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept
      AND salary >= minSalary;
END //
DELIMITER ;

CALL EmployeeFilter('IT', 55000);
CALL EmployeeFilter('HR' , 50000);

SHOW PROCEDURE STATUS;

SHOW CREATE PROCEDURE ShowAllEmployees;

DROP PROCEDURE ShowAllEmployees;


-- Q1 - Create a procedure to dispaly all employees.
DELIMITER //
CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employee;
END //
DELIMITER ;

CALL ShowAllEmployees();
-- Q2- Create a procedure to display all hr employees.

DELIMITER //
CREATE PROCEDURE ShowHREmployees()
BEGIN
    SELECT * 
    FROM Employee
    WHERE department = 'HR';
END //
DELIMITER ;

CALL ShowHREmployees();

-- Q3 - Create a procedure that accept department as input 
CALL EmployeeDepartment('IT');

-- Q4 - Create a procedure that accepts minimum salary.

DELIMITER //

CREATE PROCEDURE SalaryGreaterThan(IN minSalary DECIMAL(10,2))
BEGIN
    SELECT *
    FROM Employee
    WHERE salary >= minSalary;
END //

DELIMITER ;

CALL SalaryGreaterThan(50000);
-- Q5- Create a procedure with department and salary inputs

DELIMITER //

CREATE PROCEDURE EmployeeFilter(
    IN dept VARCHAR(30),
    IN minSalary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept
      AND salary >= minSalary;
END //

DELIMITER ;

CALL EmployeeFilter('IT', 50000);
-- Q6 -Execute each procedure with defferent values



-- Q7 - Dispaly employees earning more than 60000.
CALL SalaryGreaterThan(60000);

-- Q8 - Display Finance Emp-loyees.
CALL EmployeeDepartment('Finance');
-- Q9 - View procedure definition.

SHOW CREATE PROCEDURE EmployeeFilter;
SHOW PROCEDURE STATUS;

-- Q10 - Drop a procedure and recreare it.

DROP PROCEDURE IF EXISTS EmployeeDepartment;

DELIMITER //
CREATE PROCEDURE EmployeeDepartment(IN dept VARCHAR(30))
BEGIN
    SELECT *
    FROM Employee
    WHERE department = dept;
END //
DELIMITER ;

CALL EmployeeDepartment('IT');