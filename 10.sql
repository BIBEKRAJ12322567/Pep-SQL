create database restaurant;
use restaurant;

create table customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

create table delivery_partners(
partner_id INT primary key,
partner_name VARCHAR(100),
vehicle varchar(100)
);

CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    restaurant_id INT REFERENCES restaurants(restaurant_id),
    partner_id INT REFERENCES delivery_partners(partner_id),
    order_amount FLOAT,
    order_date DATE
);

create table restaurants(
restaurant_id int primary key,
restaurant_name varchar(50),
city varchar(50)

);


























