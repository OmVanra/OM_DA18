CREATE DATABASE SalesAnalyticsDB;

USE SalesAnalyticsDB;

CREATE TABLE customers (
	id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50),
    amount_spend INT
)

SELECT * 
FROM customers;

INSERT INTO customers (id, user_name, age, country, amount_spend)
VALUES
(1, 'Aarav Patel', 22, 'India', 500),
(2, 'Emma Smith', 28, 'USA', 2500),
(3, 'Liam Brown', 35, 'UK', 7500),
(4, 'Olivia Wilson', 42, 'Canada', 1200),
(5, 'Noah Martin', 31, 'Australia', 9500),
(6, 'Sophia Garcia', 19, 'Spain', 300),
(7, 'Ethan Johnson', 55, 'USA', 15000),
(8, 'Mia Taylor', 26, 'UK', 4200),
(9, 'Arjun Mehta', 38, 'India', 6800),
(10, 'Charlotte Lee', 47, 'Canada', 21000),
(11, 'Lucas Anderson', 63, 'Australia', 850),
(12, 'Isabella Rossi', 29, 'Italy', 5600),
(13, 'James Thomas', 24, 'USA', 1800),
(14, 'Amelia Clark', 51, 'UK', 12500),
(15, 'Kabir Shah', 33, 'India', 32000);


UPDATE customers SET amount_spend = 60000 WHERE id = 15;

SELECT * FROM customers;


SELECT user_name,age,country
FROM customers;

SELECT user_name,country,amount_spend 
FROM customers;

SELECT * FROM customers
WHERE amount_spend > 50000;

SELECT * FROM customers
WHERE age < 30;

SELECT * FROM customers
WHERE country = 'India';


SELECT * FROM customers
WHERE amount_spend < 20000;

SELECT * FROM customers
WHERE age < 30 AND amount_spend > 30000;

SELECT * FROM customers
WHERE country = 'India' AND amount_spend > 40000;

SELECT * FROM customers
WHERE country = 'India' OR country = 'USA';

SELECT * FROM customers 
WHERE (country = 'India' OR country = 'USA') AND amount_spend > 50000 ;

SELECT * FROM customers 
WHERE country NOT IN ('India');

SELECT * FROM customers
ORDER BY amount_spend ASC;

SELECT * FROM customers
ORDER BY amount_spend DESC;


SELECT user_name, age, country, amount_spend 
FROM customers 
ORDER BY age ASC;

SELECT * FROM customers
WHERE (age BETWEEN 25 AND 40) AND (amount_spend > 30000) AND (country IN ('India', 'USA'))
ORDER BY amount_spend DESC;

SELECT * FROM customers
WHERE (age >= 30) AND (amount_spend > 40000) AND (country NOT IN ('USA'))
ORDER BY amount_spend DESC;
