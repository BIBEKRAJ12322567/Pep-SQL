DROP DATABASE IF EXISTS Day17Triggers;
CREATE DATABASE Day17Triggers;

USE Day17Triggers;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);



create table employee_logs(
log_id int primary key auto_increment,
emp_id int,
action_type varchar(30),
old_salary decimal(10,2),
new_salary decimal(10,2),
action_time timestamp default current_timestamp
);

-- test 
insert into employees(emp_name,department,salary)
values('Amit',"HR",54000)


create trigger trg_after_log
after insert
on employees
for each row
begin 
insert into 