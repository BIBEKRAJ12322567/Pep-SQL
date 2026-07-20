create database normalization_lab;
use normalization_lab;

create table OrderData(
OrderID int,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100),
ProductName varchar(50),
Catagory varchar(30),
SupplierName varchar(50),
SupplierPhone varchar(15),
Quantity Int,
Price decimal(10,2)
);

ALTER TABLE OrderData
RENAME COLUMN Catagory TO Category;

INSERT INTO OrderData
(OrderID, CustomerName, Phone, Address, ProductName, Category, SupplierName, SupplierPhone, Quantity, Price)
VALUES
(101,'Rahul','987650011','Delhi','Laptop','Electronic','ABC Suppliers','9991111111',1,65000),
(102,'Rahul','987650011','Delhi','Mouse','Electronic','XYZ Suppliers','9992222222',2,800),
(103,'Rahul','987650011','Delhi','Keyboard','Electronic','XYZ Suppliers','9992222222',1,1500),
(104,'Aman','987650022','Mumbai','Monitor','Electronic','Tech Suppliers','9993333333',1,12000),
(105,'Aman','987650022','Mumbai','Printer','Electronic','Print World','9994444444',1,8500),
(106,'Priya','987650033','Bangalore','Headphones','Electronic','Sound Hub','9995555555',2,2500),
(107,'Priya','987650033','Bangalore','USB Cable','Electronic','ABC Suppliers','9991111111',3,300),
(108,'Sneha','987650044','Hyderabad','Webcam','Electronic','Tech Suppliers','9993333333',1,3500),
(109,'Sneha','987650044','Hyderabad','SSD 1TB','Electronic','Storage Hub','9997777777',1,7200),
(110,'Rohit','987650055','Pune','Laptop Bag','Accessories','Bag House','9996666666',1,1800),
(111,'Rohit','987650055','Pune','Router','Networking','Net Solutions','9998888888',1,2800),
(112,'Rohit','987650055','Pune','Pendrive 64GB','Electronic','Storage Hub','9997777777',2,900);

select * from OrderData;

create table Customers
(
CustomerID int primary key,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100)
);

create table Suppliers
(
SupplierID int primary key,
SupplierName varchar(50),
SupplierPhone varchar(15)
);

create table Products(
ProductID int primary key,
ProductName varchar(50),
Category varchar (30),
Price decimal(10,2),
SupplierID int,
Foreign key (SupplierID) references Suppliers(SupplierID)
);

create table orders(
OrderID int primary key,
CustomerID int,
foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderDetails(
OrderID int,
ProductID int,
Quantity int,
primary key(OrderID,ProductID),
foreign key(OrderID) references Orders(orderID),
foreign key(ProductID) references Products(ProductID)
);

INSERT INTO Customers
(CustomerID, CustomerName, Phone, Address)
VALUES
(1,'Rahul','987650011','Delhi'),
(2,'Aman','987650022','Mumbai'),
(3,'Priya','987650033','Bangalore'),
(4,'Sneha','987650044','Hyderabad'),
(5,'Rohit','987650055','Pune');

INSERT INTO Suppliers
(SupplierID, SupplierName, SupplierPhone)
VALUES
(1,'ABC Suppliers','9991111111'),
(2,'XYZ Suppliers','9992222222'),
(3,'Tech Suppliers','9993333333'),
(4,'Print World','9994444444'),
(5,'Sound Hub','9995555555'),
(6,'Storage Hub','9997777777'),
(7,'Bag House','9996666666'),
(8,'Net Solutions','9998888888')
;

INSERT INTO Products
(ProductID, ProductName, Category, Price, SupplierID)
VALUES
(1,'Laptop','Electronic',65000,1),
(2,'Mouse','Electronic',800,2),
(3,'Keyboard','Electronic',1500,2),
(4,'Monitor','Electronic',12000,3),
(5,'Printer','Electronic',8500,4),
(6,'Headphones','Electronic',2500,5),
(7,'USB Cable','Electronic',300,1),
(8,'Webcam','Electronic',3500,3),
(9,'SSD 1TB','Electronic',7200,6),
(10,'Laptop Bag','Accessories',1800,7),
(11,'Router','Networking',2800,8),
(12,'Pendrive 64GB','Electronic',900,6);

INSERT INTO Orders
(OrderID, CustomerID)
VALUES
(101,1),
(102,1),
(103,1),
(104,2),
(105,2),
(106,3),
(107,3),
(108,4),
(109,4),
(110,5),
(111,5),
(112,5);

INSERT INTO OrderDetails
(OrderID, ProductID, Quantity)
VALUES
(101,1,1),
(102,2,2),
(103,3,1),
(104,4,1),
(105,5,1),
(106,6,2),
(107,7,3),
(108,8,1),
(109,9,1),
(110,10,1),
(111,11,1),
(112,12,2);

-- 1. Customers Table
SELECT * FROM Customers;

-- 2. Suppliers Table
SELECT * FROM Suppliers;

-- 3. Products Table
SELECT * FROM Products;

-- 4. Orders Table
SELECT * FROM Orders;

-- 5. OrderDetails Table
SELECT * FROM OrderDetails;

UPDATE Customers
SET Phone = '9876543210'
WHERE CustomerName = 'Rahul';

SELECT * FROM Customers
WHERE CustomerName = 'Rahul';

INSERT INTO Customers
(CustomerID, CustomerName, Phone, Address)
VALUES
(6, 'Anjali', '987650066', 'Chennai');

SELECT * FROM Customers;

DELETE FROM OrderDetails
WHERE OrderID = 112;

select o.orderID, c.*
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID;

-- show Product purchased in every order
SELECT
    od.OrderID,
    p.ProductName,
    od.Quantity
FROM OrderDetails AS od
INNER JOIN Products AS p
ON od.ProductID = p.ProductID;

-- q4 - Show Customer Name and Products Purchased
SELECT
    Customers.CustomerName,
    Products.ProductName,
    OrderDetails.Quantity
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products
ON OrderDetails.ProductID = Products.ProductID;


-- Q5 - Show Customer Name, Product Name and Price

SELECT
    c.CustomerName,
    p.ProductName,
    p.Price
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID;

 
-- Q6 - Total Bill for Each Purchase

SELECT
    c.CustomerName,
    p.ProductName,
    od.Quantity,
    p.Price,
    (od.Quantity * p.Price) AS TotalBill
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE OrderDetails;
TRUNCATE TABLE Orders;
TRUNCATE TABLE Products;
TRUNCATE TABLE Suppliers;
TRUNCATE TABLE Customers;

SET FOREIGN_KEY_CHECKS = 1;

-- Insert into Customers
INSERT INTO Customers VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');

-- Insert into Suppliers
INSERT INTO Suppliers VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');

-- Insert into Products
INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);

-- Insert into Orders
INSERT INTO Orders VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);

-- Insert into OrderDetails
INSERT INTO OrderDetails VALUES
(1001,201,1),
(1001,202,2),

(1002,203,1),
(1002,206,3),

(1003,204,1),
(1003,203,5),

(1004,205,1),
(1004,207,2),

(1005,208,4),
(1005,209,3),

(1006,201,1),
(1006,213,2),

(1007,202,4),
(1007,211,1),

(1008,203,2),

(1009,212,1),
(1009,206,2),

(1010,207,3),
(1010,208,2),

(1011,201,1),
(1011,205,1),

(1012,202,3),
(1012,209,4);

-- Customers Table
SELECT * FROM Customers;

-- Suppliers Table
SELECT * FROM Suppliers;

-- Products Table
SELECT * FROM Products;

-- Orders Table
SELECT * FROM Orders;

-- OrderDetails Table
SELECT * FROM OrderDetails;


-- Q7 - Supplier of Every Product

SELECT
    p.ProductName,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID;

-- q8 Complete order report

SELECT
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    s.SupplierName,
    od.Quantity,
    p.Price
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID;


SELECT
    c.CustomerName,
    o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- the sales manager wants a report showing every customer's name along with the Order they placed
SELECT
    c.CustomerName,
    o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

-- Display the product name,price and supplier name for every product available in the store

SELECT
    p.ProductName,
    p.Price,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID;

-- The warehouse manager wants to know which products belong to the Electronics category along with the supplier suppling them

SELECT
    p.ProductName,
    p.Category,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE p.Category = 'Electronics';

-- q4 - Show customer names who have placed an order. Arrange the result alphabetically.

SELECT DISTINCT
    c.CustomerName
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerName ASC;

-- q5 - Display every supplier along with the products supplied bt them. Sort supplier nmaes in ascending order


SELECT
    s.SupplierName,
    p.ProductName
FROM Suppliers AS s
INNER JOIN Products AS p
ON s.SupplierID = p.SupplierID
ORDER BY s.SupplierName ASC;

-- q6 - The finnce team wants the Order ID, Product Name, Quantity and price for every purchased product.
SELECT
    od.OrderID,
    p.ProductName,
    od.Quantity,
    p.Price
FROM OrderDetails AS od
INNER JOIN Products AS p
ON od.ProductID = p.ProductID;


-- Q7 - Display Customer Name, Product Name and Quantity Purchased

SELECT
    c.CustomerName,
    p.ProductName,
    od.Quantity
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID;

-- Q8- Find all the products costing more  than 1000 along with their supplier names.

SELECT
    p.ProductName,
    p.Price,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE p.Price > 1000;

select p.ProductName,
 p.Price,
 s.SupplierName
 From Products as p
 inner join Suppliers as s
 on p.SupplierID = s.SupplierID
 where p.Price > 1000;
 
 -- Q9 - Display customers whose names start with 'A' along with the orders they placed.
 
SELECT
    c.CustomerName,
    o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.CustomerName like 'A%';

 -- Q10 - Show all products supplied by suppliers whose names contain the word Tech.
 SELECT
    p.ProductName,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';
 
 -- Q11 - Find products between 500 and 3000 along supplier names.Sort by price descending.
 SELECT
    p.ProductName,
    p.Price,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE p.Price BETWEEN 500 AND 3000
ORDER BY p.Price DESC;
 
 
 -- Q12- Display customers living in Delhi along with their Order IDs.
 
 SELECT
    c.CustomerName,
    o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.Address = 'Delhi';

 -- Q13 - Show all purchased products whose quantity in greater than 5. Dispaly product name and quantity.
 
 SELECT
    p.ProductName,
    od.Quantity
FROM OrderDetails AS od
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
WHERE od.Quantity > 5;
 
 -- Q14 - Find suppliers suppling products in either Electronics or Furniture category.
 
 SELECT DISTINCT
    s.SupplierName,
    p.Category
FROM Suppliers AS s
INNER JOIN Products AS p
ON s.SupplierID = p.SupplierID
WHERE p.Category IN ('Electronics', 'Furniture');

 -- Q15 - Display all customers except those living in mumbai , along with the orders they placed.
 
 SELECT
    c.CustomerName,
    o.OrderID
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.Address <> 'Mumbai';

-- Q28- The management wants ot know the top 5 most expensive purchased products along with customer name , supplier name, quantity purchased and price 


SELECT
    c.CustomerName,
    p.ProductName,
    s.SupplierName,
    od.Quantity,
    p.Price
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
ORDER BY p.Price DESC
LIMIT 5;
-- Q29 - Find the customers who has purchased the highest total quantity of products. Dispaly customers name and total quantity.
SELECT
    c.CustomerName,
    SUM(od.Quantity) AS TotalQuantity
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalQuantity DESC
LIMIT 1;

--  Show all those products who's price is more than the average of all the products
SELECT
    ProductName,
    Price
FROM Products
WHERE Price >(
SELECT AVG(price)
from Products
);



-- Subquery 

-- Q1 - Products priced above average.
SELECT
    ProductName,
    Price
FROM Products
WHERE Price >
(
    SELECT AVG(Price)
    FROM Products
);

-- Q2 - most expensive product.alter 
SELECT
    ProductName,
    Price
FROM Products
WHERE Price =
(
    SELECT MAX(Price)
    FROM Products
);



-- Q3 - Customers who placed orders.

SELECT
    CustomerName
FROM Customers
WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Orders
);
-- Q4 - Products never ordered.
SELECT
    ProductName
FROM Products
WHERE ProductID NOT IN
(
    SELECT ProductID
    FROM OrderDetails
);

-- Q5 - Productss supplied by suppliers from Delhi

SELECT
    p.ProductName,
    s.SupplierName
FROM Products AS p
INNER JOIN Suppliers AS s
ON p.SupplierID = s.SupplierID
WHERE s.Address = 'Delhi';

-- Q6 - Suppliers Supplying products products above average price

-- Q7 - Letest order

-- Q8 - Customers who ordered expensive products

-- Q9 - Suppliers whose products were never ordered

-- Q10 - Find second highest priced product

-- Q11 - Find products costing more than every stationery product.