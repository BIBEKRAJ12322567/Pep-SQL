/*1. Formatting & Case Conversion
These functions help ensure your data is standardized (e.g., for search or reports).

UPPER(str): Converts text to all uppercase.
Example: SELECT UPPER(customername) FROM Customers;

LOWER(str): Converts text to all lowercase.
Example: SELECT LOWER(customername) FROM Customers;

INITCAP(str): (In some SQL dialects) Converts the first letter of each word to uppercase.
//////////////////////////////////////////////
2. Concatenation & Manipulation
These allow you to build new strings by combining or modifying existing ones.

CONCAT(str1, str2, ...): Joins two or more strings together.
Example: SELECT CONCAT(customername, ' - ', city) FROM Customers;

SUBSTRING(str, pos, len) (or SUBSTR): Extracts a portion of a string starting at pos.
Example: SELECT SUBSTRING(customername, 1, 3) FROM Customers; (Gets the first 3 letters).

REPLACE(str, find, replace): Replaces all occurrences of a specific substring with another.
Example: SELECT REPLACE(phone, '987', '000') FROM Customers;
/////////////////////////////////////////////
3. Length & Positioning
These help you understand the structure of the data inside your columns.

LENGTH(str) (or LEN in some dialects): Returns the count of characters in the string.
Example: SELECT customername, LENGTH(customername) FROM Customers;

INSTR(str, substr) or CHARINDEX: Returns the position where a substring first appears in a string.
Example: SELECT INSTR(customername, ' ') FROM Customers; (Finds the position of the space).
////////////////////////////////////////////	
4. Trimming & Padding
Useful for cleaning up "dirty" data that might have extra spaces.

TRIM(str): Removes leading and trailing spaces.

LTRIM(str) / RTRIM(str): Removes only leading (left) or trailing (right) spaces.

LPAD(str, len, pad_str): Pads the left side of a string to a certain length.

Example: SELECT LPAD(customer_id, 5, '0') FROM Customers; (Makes ID 101 look like 00101).*/


USE practice;

CREATE TABLE Practice_Strings (
    id INT PRIMARY KEY,
    raw_name VARCHAR(50),
    raw_code VARCHAR(20)
);

INSERT INTO Practice_Strings VALUES
(1, '  amit sharma  ', 'abc-123'),
(2, 'priya singh', 'xyz-789'),
(3, ' RAHUL VERMA ', 'def-456'),
(4, 'sneha gupta', 'ghi-012'),
(5, 'arjun MEHTA', 'jkl-345'),
(6, ' neha kapoor ', 'mno-678'),
(7, 'rohan das', 'pqr-901'),
(8, ' simran kaur', 'stu-234'),
(9, 'anjali ROY ', 'vwx-567'),
(10, 'vikas yadav', 'yza-890'),
(11, '  karan malhotra', 'bcd-111'),
(12, 'pooja jain', 'efg-222'),
(13, ' harsh kumar ', 'hij-333'),
(14, 'nikita SHARMA', 'klm-444'),
(15, ' sushant singh ', 'nop-555'),
(16, 'deepika padukone', 'qrs-666'),
(17, ' ranveer singh ', 'tuv-777'),
(18, 'alia bhatt', 'wxy-888'),
(19, '  varun dhawan', 'zab-999'),
(20, 'kiara advani', 'cde-000');


SELECT 
    raw_name, 
    UPPER(TRIM(raw_name)) AS Formatted_Name, 
    LENGTH(TRIM(raw_name)) AS Clean_Length 
FROM Practice_Strings;

/*1. The "Cleanup" Query:
Standardize all names by trimming spaces and converting them to Title Case (or just Upper/Lower).*/
SELECT id, TRIM(raw_name) AS Clean_Name, LENGTH(TRIM(raw_name)) AS Char_Count
FROM Practice_Strings;

/*2. The "Code Extractor" Query:
Extract the numeric part from the raw_code (assuming it always starts with xxx-).*/
SELECT raw_code, SUBSTRING(raw_code, 5, 3) AS Numeric_Part
FROM Practice_Strings;


/*3. The "Search & Replace" Query:
Swap the dash in the code for a pipe | and see how it looks for all 20 entries.*/
SELECT raw_code, REPLACE(raw_code, '-', '|') AS Formatted_Code
FROM Practice_Strings;


/*can we access the last three characters of a variable length string coloumn????????

Yes, you absolutely can! Since the length of the string varies, you need a function that can "look" at the end of the string regardless of how many characters came before it.
The most effective way to do this is by using the SUBSTRING function in combination with the LENGTH function.*/

/*SOLN You tell the database to start at a position calculated by LENGTH(column) - 2.*/

SELECT 
    raw_name, 
    SUBSTRING(raw_name, LENGTH(raw_name), 3) AS Last_Three_Chars
FROM Practice_Strings;

-- Display all customer names in uppercase.
-- Display all customer names in lowercase.
-- find the length of every customer name.
-- display customer name along with city in one column.
-- show first four characters of every customer name-- .
-- replace letter 'a'  with '*' in customer names
-- Remove spaces from the text:
-- 'Database Systems'
-- display customer name in uppercase and city in lowercase
-- display first three letter of every product
-- find products having names longer than 8 characters.
-- Display:
-- CustomerName(City)
-- replace spaces in Product names with '_'
-- display total number of characters in city names
-- display customer initials  using SUBSTRING().
-- Create Output:
-- Rahul purchased Laptop
-- Display only first five letters of product names. 
-- display product name in uppercase.

-- 1. Customer names in uppercase
SELECT UPPER(customername) FROM Customers;

-- 2. Customer names in lowercase
SELECT LOWER(customername) FROM Customers;

-- 3. Length of every customer name
SELECT customername, LENGTH(customername) AS name_length FROM Customers;

-- 4. Customer name along with city in one column
SELECT CONCAT(customername, ', ', city) AS customer_info FROM Customers;

-- 5. First four characters of every customer name
SELECT SUBSTRING(customername, 1, 4) AS first_four FROM Customers;

-- 6. Replace letter 'a' with '*' in customer names
SELECT REPLACE(customername, 'a', '*') FROM Customers;

-- 7. Display customer name (upper) and city (lower)
SELECT UPPER(customername), LOWER(city) FROM Customers;

-- 8. CustomerName(City) format
SELECT CONCAT(customername, '(', city, ')') AS formatted_details FROM Customers;

-- 9. Total number of characters in city names
SELECT city, LENGTH(city) AS city_length FROM Customers;

-- 10. Display customer initials using SUBSTRING()
-- (Assumes format: First Initial + Last Initial after space)
SELECT CONCAT(SUBSTRING(customername, 1, 1), 
              SUBSTRING(customername, INSTR(customername, ' ') + 1, 1)) AS initials 
FROM Customers;

-- 11. Remove spaces from 'Database Systems'
SELECT REPLACE('Database Systems', ' ', '') AS removed_spaces;

-- 12. Display first three letters of every product
SELECT SUBSTRING(productname, 1, 3) FROM Products;

-- 13. Products having names longer than 8 characters
SELECT productname FROM Products WHERE LENGTH(productname) > 8;

-- 14. Replace spaces in product names with '_'
SELECT REPLACE(productname, ' ', '_') FROM Products;

-- 15. Create Output: "Rahul purchased Laptop"
-- (Note: This is a sample join based on your project structure)
SELECT CONCAT(c.customername, ' purchased ', p.productname) AS purchase_info
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.orderid = od.orderid
JOIN Products p ON od.product_id = p.product_id;

-- 16. Display only first five letters of product names
SELECT SUBSTRING(productname, 1, 5) FROM Products;

-- 17. Display product name in uppercase
SELECT UPPER(productname) FROM Products;