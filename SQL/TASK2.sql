CREATE DATABASE 
sales_transactions;

USE sales_transactions;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    unit_price INT,
    discount_percent INT,
    city VARCHAR(50),
    payment_mode VARCHAR(30),
    salesperson VARCHAR(50),
    customer_type VARCHAR(30)
);

SELECT * FROM transactions;

INSERT INTO transactions
(transaction_id, customer_name, product_name, category, quantity, unit_price,
 discount_percent, city, payment_mode, salesperson, customer_type)
VALUES
(1001, 'Aarav Mehta', 'Laptop Pro 15', 'Electronics', 2, 75000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1002, 'Priya Shah', 'Office Chair', 'Furniture', 5, 12000, 8, 'Mumbai', 'Card', 'Neha', 'Regular'),
(1003, 'Rohan Patel', 'Smartphone X', 'Electronics', 3, 45000, 12, 'Ahmedabad', 'UPI', 'Amit', 'Premium'),
(1004, 'Sneha Verma', 'Refrigerator', 'Appliances', 1, 68000, 15, 'Delhi', 'Card', 'Priya', 'VIP'),
(1005, 'Karan Joshi', 'Dining Table', 'Furniture', 4, 18000, 5, 'Pune', 'Cash', 'Rahul', 'Regular'),
(1006, 'Ananya Rao', 'Laptop Air 14', 'Electronics', 1, 62000, 7, 'Bangalore', 'Online', 'Neha', 'Premium'),
(1007, 'Vikram Singh', 'Washing Machine', 'Appliances', 2, 42000, 18, 'Jaipur', 'UPI', 'Amit', 'Regular'),
(1008, 'Meera Kapoor', 'Smartphone Pro', 'Electronics', 4, 55000, 20, 'Mumbai', 'Card', 'Priya', 'VIP'),
(1009, 'Aditya Shah', 'Sofa Set', 'Furniture', 3, 35000, 10, 'Ahmedabad', 'Online', 'Rahul', 'Premium'),
(1010, 'Ishita Patel', 'Air Conditioner', 'Appliances', 2, 58000, 12, 'Surat', 'UPI', 'Neha', 'Premium'),
(1011, 'Raj Malhotra', 'Gaming Laptop', 'Electronics', 2, 95000, 15, 'Delhi', 'Card', 'Amit', 'VIP'),
(1012, 'Kavya Desai', 'Bookshelf', 'Furniture', 6, 9000, 5, 'Pune', 'Cash', 'Priya', 'Regular'),
(1013, 'Arjun Mehta', 'Smart TV 55', 'Electronics', 2, 72000, 18, 'Bangalore', 'Online', 'Rahul', 'Premium'),
(1014, 'Nisha Sharma', 'Microwave Oven', 'Appliances', 3, 22000, 8, 'Ahmedabad', 'UPI', 'Neha', 'Regular'),
(1015, 'Yash Patel', 'Refrigerator Pro', 'Appliances', 1, 82000, 20, 'Mumbai', 'Card', 'Amit', 'VIP'),
(1016, 'Simran Kaur', 'Office Desk', 'Furniture', 5, 16000, 12, 'Delhi', 'Online', 'Priya', 'Regular'),
(1017, 'Dev Kumar', 'Smartphone Ultra', 'Electronics', 3, 68000, 10, 'Jaipur', 'UPI', 'Rahul', 'Premium'),
(1018, 'Riya Shah', 'Washing Machine Pro', 'Appliances', 4, 48000, 22, 'Surat', 'Card', 'Neha', 'Premium'),
(1019, 'Manav Joshi', 'Premium Sofa', 'Furniture', 2, 65000, 15, 'Ahmedabad', 'Online', 'Amit', 'VIP'),
(1020, 'Pooja Mehta', 'Tablet Pro', 'Electronics', 5, 32000, 8, 'Pune', 'UPI', 'Priya', 'Regular'),
(1021, 'Harsh Verma', 'Laptop Ultra', 'Electronics', 3, 88000, 25, 'Mumbai', 'Card', 'Rahul', 'VIP'),
(1022, 'Neel Shah', 'Air Conditioner Pro', 'Appliances', 2, 76000, 10, 'Delhi', 'Online', 'Neha', 'Premium'),
(1023, 'Tanvi Rao', 'Dining Set', 'Furniture', 4, 28000, 18, 'Bangalore', 'Cash', 'Amit', 'Regular'),
(1024, 'Siddharth Patel', 'Smart TV Pro', 'Electronics', 6, 60000, 12, 'Surat', 'UPI', 'Priya', 'Premium'),
(1025, 'Aisha Khan', 'Double Door Refrigerator', 'Appliances', 2, 92000, 20, 'Ahmedabad', 'Card', 'Rahul', 'VIP'),
(1026, 'Mohit Singh', 'Executive Chair', 'Furniture', 7, 14000, 10, 'Jaipur', 'Online', 'Neha', 'Regular'),
(1027, 'Diya Mehta', 'Gaming Monitor', 'Electronics', 3, 52000, 15, 'Delhi', 'UPI', 'Amit', 'Premium'),
(1028, 'Varun Shah', 'Washing Machine', 'Appliances', 5, 38000, 28, 'Mumbai', 'Cash', 'Priya', 'Regular'),
(1029, 'Isha Patel', 'Luxury Sofa', 'Furniture', 3, 78000, 12, 'Pune', 'Card', 'Rahul', 'VIP'),
(1030, 'Dhruv Sharma', 'Business Laptop', 'Electronics', 2, 110000, 18, 'Bangalore', 'Online', 'Neha', 'VIP');

SELECT * FROM 
transactions
ORDER BY unit_price, quantity DESC;

SELECT customer_name, product_name, category, quantity, unit_price, city FROM 
transactions
WHERE unit_price > 50000 AND quantity > 1;

SELECT * FROM 
transactions
WHERE customer_type = 'Premium' AND unit_price > 25000
ORDER BY unit_price DESC;

SELECT * FROM
transactions
WHERE discount_percent > 15 AND quantity >= 3
ORDER BY discount_percent DESC;

SELECT customer_name, product_name, category, quantity, unit_price, city FROM
transactions
WHERE city IN ('Ahmedabad','Mumbai','Delhi') AND unit_price > 20000
ORDER BY city, unit_price DESC;

SELECT customer_name, product_name, quantity, unit_price, payment_mode FROM 
transactions
WHERE payment_mode IN ('Online','Card') AND quantity > 2 AND unit_price > 15000
ORDER BY quantity DESC;

SELECT * FROM
transactions
WHERE category IN ('Electronics','Furniture','Appliances') AND discount_percent < 10
ORDER BY discount_percent ASC;

SELECT customer_name, customer_type, product_name, quantity, unit_price FROM 
transactions
WHERE customer_type IN ('Premium','Regular') AND unit_price > 30000 AND quantity > 1
ORDER BY unit_price DESC;

SELECT * FROM 
transactions
WHERE quantity > 4 AND discount_percent < 20
ORDER BY quantity DESC;

SELECT transaction_id, customer_name, product_name, quantity, unit_price, category FROM 
transactions
WHERE (quantity > 5 AND unit_price > 10000) OR (quantity BETWEEN 2 AND 5 AND unit_price > 50000)
ORDER BY unit_price DESC;

SELECT * FROM
transactions
WHERE quantity > 2 AND unit_price > 20000 AND payment_mode NOT IN ('Cash')
ORDER BY unit_price DESC;

SELECT customer_name, product_name, quantity, unit_price, discount_percent, customer_type FROM 
transactions
WHERE unit_price > 40000 AND quantity > 1 AND discount_percent < 15
ORDER BY unit_price DESC;

SELECT customer_name, product_name, quantity, unit_price, discount_percent, city FROM 
transactions
WHERE category IN ('Furniture') AND quantity > 3 AND unit_price > 25000
ORDER BY quantity DESC;

SELECT * FROM
transactions
WHERE customer_type IN ('Premium') AND payment_mode NOT IN ('Cash') AND quantity > 1 AND unit_price > 20000
ORDER BY unit_price DESC;

SELECT customer_name, product_name, category, unit_price, discount_percent, payment_mode FROM 
transactions
WHERE unit_price > 50000 AND discount_percent > 10 AND payment_mode NOT IN ('Cash')
ORDER BY discount_percent DESC;

SELECT * FROM 
transactions
WHERE (category IN ('Electronics') AND quantity > 2 AND discount_percent < 15) OR 
(category IN ('Furniture') AND quantity > 3 AND unit_price > 20000) OR 
(category IN ('Appliance') AND unit_price > 40000)
ORDER BY unit_price DESC;

SELECT customer_name, customer_type, product_name, quantity, unit_price, city, payment_mode FROM 
transactions
WHERE customer_type IN ('Premium','VIP') AND city NOT IN ('Ahmedabad') AND (quantity > 3 OR unit_price > 60000)
ORDER BY unit_price DESC;

SELECT * FROM 
transactions
WHERE discount_percent > 20 AND quantity > 2 AND unit_price < 50000
AND payment_mode NOT IN ('Cash') AND city NOT IN ('Mumbai')
ORDER BY discount_percent DESC;

SELECT transaction_id, customer_name, product_name, category, quantity, unit_price, discount_percent, customer_type, payment_mode, city, salesperson 
FROM 
transactions
WHERE ((customer_type IN ('Premium') AND category = 'Electronics' AND unit_price > 40000) OR 
(customer_type IN ('VIP') AND unit_price > 50000) OR 
(customer_type IN ('Regular') AND quantity > 5 AND unit_price > 10000)) AND 
payment_mode NOT IN ('Cash')
ORDER BY unit_price DESC;

SELECT transaction_id,
       customer_name,
       product_name,
       category,
       quantity,
       unit_price,
       discount_percent,
       city,
       payment_mode,
       salesperson,
       customer_type
FROM transactions
WHERE (
(customer_type = 'Premium' AND category = 'Electronics' AND unit_price > 35000) OR 
(customer_type = 'VIP' AND category = 'Furniture' AND quantity > 2) OR 
(customer_type = 'Regular' AND unit_price > 75000)
) 
AND discount_percent <= 25
AND payment_mode NOT IN ('Cash')
AND city NOT IN ('Ahmedabad')
ORDER BY unit_price, quantity, discount_percent DESC;     


