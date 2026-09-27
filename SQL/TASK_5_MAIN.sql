CREATE DATABASE JoinPracticeDB;

-- Select Database
USE JoinPracticeDB;



-- CREATE CUSTOMERS TABLE

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);


-- INSERT CUSTOMERS

INSERT INTO Customer
(customer_id, customer_name, city, country)
VALUES
(1, 'Rahul Sharma', 'Ahmedabad', 'India'),
(2, 'Priya Patel', 'Mumbai', 'India'),
(3, 'Amit Shah', 'Delhi', 'India'),
(4, 'Neha Mehta', 'Pune', 'India'),
(5, 'Rohan Desai', 'Surat', 'India'),
(6, 'Karan Joshi', 'Jaipur', 'India'),
(7, 'Sneha Patel', 'Bangalore', 'India'),
(8, 'Vikas Shah', 'Vadodara', 'India'),
(9, 'Anjali Singh', 'Delhi', 'India'),
(10, 'Raj Malhotra', 'Chennai', 'India');


-- CREATE ORDERS TABLE

CREATE TABLE Orders
(
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);


-- INSERT ORDERS

INSERT INTO Orders
(order_id, customer_id, product_name, quantity, amount)
VALUES
(101, 1, 'Laptop', 1, 55000.00),
(102, 2, 'Mobile', 2, 30000.00),
(103, 3, 'Keyboard', 3, 4500.00),
(104, 4, 'Monitor', 1, 18000.00),
(105, 5, 'Mouse', 5, 2500.00),
(106, 6, 'Printer', 1, 12000.00),
(107, 7, 'Laptop Bag', 2, 3000.00),
(108, 11, 'Tablet', 1, 25000.00),
(109, 12, 'Headphones', 2, 6000.00),
(110, 13, 'Smart Watch', 1, 8000.00);


-- VIEW TABLES

SELECT * FROM Customer;

SELECT * FROM Orders;

SELECT C.customer_id, C.customer_name, C.city, O.order_id, O.product_name, O.amount FROM 
CUSTOMER AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;

SELECT C.customer_name, C.city, O.product_name, O.amount FROM 
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;

SELECT C.customer_id, C.customer_name, O.order_id, O.product_name, O.amount  FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id;

SELECT C.customer_id, C.customer_name, C.city FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id
WHERE O.order_id IS NULL;

SELECT O.order_id ,C.customer_id, C.customer_name, O.product_name, C.city FROM
Customer AS C
RIGHT JOIN Orders AS O
ON C.customer_id = O.customer_id;


SELECT O.order_id ,O.customer_id, O.product_name, O.amount FROM
Customer AS C
RIGHT JOIN Orders AS O
ON C.customer_id = O.customer_id
WHERE C.customer_id IS NULL;


SELECT C.customer_id, C.customer_name, O.order_id, O.product_name, O.amount FROM
Customer AS C
FULL OUTER JOIN Orders AS O
ON C.customer_id = O.customer_id;


SELECT C.customer_name ,O.order_id, O.product_name, O.amount FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
WHERE O.amount > 10000;


SELECT C.customer_name, C.city, O.order_id, O.product_name, O.amount FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
WHERE C.city IN ('Delhi');


SELECT C.customer_name, O.product_name, O.quantity ,O.order_id, O.amount FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
WHERE O.quantity > 2
ORDER BY O.quantity DESC;


SELECT C.customer_id ,C.customer_name,SUM(O.amount) AS 'TOTAL AMOUNT' FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id,C.customer_name;




SELECT C.customer_id ,C.customer_name,COUNT(O.quantity) AS 'TOTAL QUANITITY' FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id,C.customer_name;


SELECT C.customer_name,AVG(O.amount) AS 'Average Order Amount' FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_name;


SELECT TOP 1 C.customer_name,O.order_id, O.product_name, O.amount AS 'Highest Order Amount' FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
ORDER BY O.amount DESC;



SELECT TOP 1 C.customer_name,O.order_id, O.product_name, O.amount AS 'lowest amount' FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id
ORDER BY O.amount ASC;

SELECT C.customer_id ,C.customer_name, COUNT(O.order_id), SUM(O.quantity),SUM(O.amount) AS 'Average Order Amount' FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.customer_name;

SELECT C.customer_name,SUM(O.amount) AS 'total spending' FROM
Customer AS C
LEFT JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_name
HAVING SUM(O.amount) > 20000;

SELECT C.customer_id, C.customer_name,COUNT(O.order_id) AS 'Number of Orders' FROM
Customer AS C
FULL OUTER JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id ,C.customer_name
HAVING COUNT(O.order_id) > 1; 


SELECT C.customer_id, C.customer_name,COUNT(O.order_id) AS 'Number of Orders' FROM
Customer AS C
FULL OUTER JOIN Orders AS O
ON C.customer_id = O.customer_id
GROUP BY C.customer_id ,C.customer_name
HAVING COUNT(O.order_id) > 1;  

SELECT * 
FROM Customer AS C FULL OUTER JOIN 
Orders AS O
ON C.customer_id = O.customer_id;

SELECT C.customer_id, C.customer_name,C.city,O.order_id, O.product_name,O.quantity, O.amount, O.amount * O.quantity AS 'TOTAL VALUE AS' FROM
Customer AS C
INNER JOIN Orders AS O
ON C.customer_id = O.customer_id;