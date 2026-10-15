/*
  SQL String Functions - Complete Copy-Ready Script
  Platform: SQL Server / SSMS
*/

/* ================================================================
   PART 1 - CREATE DATABASE, TABLE, AND SAMPLE DATA
   ================================================================ */
CREATE DATABASE SQL_String_Functions;
GO

USE SQL_String_Functions;
GO

CREATE TABLE Employees
(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50)
);
GO

INSERT INTO Employees (employee_id, employee_name, email, department, city)
VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'IT', 'Ahmedabad'),
(102, 'Priya Patel', 'priya.patel@gmail.com', 'HR', 'Mumbai'),
(103, 'Amit Shah', 'amit.shah@gmail.com', 'Finance', 'Ahmedabad'),
(104, 'Neha Mehta', 'neha.mehta@gmail.com', 'IT', 'Pune'),
(105, 'Rohan Desai', 'rohan.desai@gmail.com', 'Sales', 'Delhi'),
(106, '  Karan Joshi  ', 'karan.joshi@gmail.com', 'IT', 'Surat'),
(107, 'SIMRAN KAUR', 'simran.kaur@gmail.com', 'HR', 'Chandigarh'),
(108, 'vijay kumar', 'vijay.kumar@yahoo.com', 'Finance', 'Jaipur'),
(109, 'Anjali Verma', 'anjali.verma@company.com', 'Marketing', 'Ahmedabad'),
(110, 'Suresh Reddy', 'suresh.reddy@gmail.com', 'IT', 'Hyderabad'),
(111, 'Pooja Nair', 'pooja.nair@yahoo.com', 'Sales', 'Kochi'),
(112, '  Arjun Singh', 'arjun.singh@company.com', 'Finance', 'Delhi'),
(113, 'MEERA IYER', 'meera.iyer@gmail.com', 'HR', 'Chennai'),
(114, 'Nikhil Gupta', 'nikhil.gupta@company.com', 'IT', 'Noida'),
(115, 'Sneha Kapoor', 'sneha.kapoor@yahoo.com', 'Marketing', 'Mumbai'),
(116, 'Ravi Kumar', 'ravi.kumar@gmail.com', 'Sales', 'Bangalore'),
(117, '  Divya Shah  ', 'divya.shah@company.com', 'IT', 'Ahmedabad'),
(118, 'AARAV MALHOTRA', 'aarav.malhotra@gmail.com', 'Finance', 'Delhi'),
(119, 'Isha Patel', 'isha.patel@yahoo.com', 'HR', 'Surat'),
(120, 'Manish Tiwari', 'manish.tiwari@company.com', 'Marketing', 'Lucknow');
GO

-- Verify dataset
SELECT * FROM Employees;
SELECT COUNT(*) AS Total_Employees FROM Employees;
GO

/* ================================================================
   PART 2 - PRACTICAL TASKS
   ================================================================ */

-- Task 1: Standardize Employee Names
SELECT employee_id,
       employee_name,
       UPPER(employee_name) AS Uppercase_Name,
       LOWER(employee_name) AS Lowercase_Name
FROM Employees;

-- Task 2: Calculate Name Length
SELECT employee_name,
       LEN(employee_name) AS Character_Count,
       DATALENGTH(employee_name) AS Byte_Count
FROM Employees;

-- Task 3: Generate Employee Information
SELECT CONCAT(employee_id, ' | ', UPPER(TRIM(employee_name)), ' | ',
              UPPER(department), ' | ', UPPER(city)) AS Employee_Information
FROM Employees;

-- Task 4: Create Employee Profile
SELECT CONCAT_WS(' - ', TRIM(employee_name), department, city) AS Employee_Profile
FROM Employees;

-- Task 5: Generate Employee Initials (first three characters)
SELECT employee_name,
       LEFT(TRIM(employee_name), 3) AS Employee_Initials
FROM Employees;

-- Task 6: Extract Last Five Characters
SELECT employee_name,
       RIGHT(TRIM(employee_name), 5) AS Last_Five_Characters
FROM Employees;

-- Task 7: Extract First Name
SELECT employee_name,
       LEFT(TRIM(employee_name), CHARINDEX(' ', TRIM(employee_name)) - 1) AS First_Name
FROM Employees;

-- Task 8: Extract Last Name
SELECT employee_name,
       RIGHT(TRIM(employee_name),
             LEN(TRIM(employee_name)) - CHARINDEX(' ', TRIM(employee_name))) AS Last_Name
FROM Employees;

-- Task 9: Find the first space position in each cleaned name
SELECT employee_name,
       CHARINDEX(' ', TRIM(employee_name)) AS Space_Position
FROM Employees;

-- Task 10: Find employee names containing "ah" (case-insensitive)
SELECT employee_id,
       employee_name,
       CHARINDEX('ah', LOWER(TRIM(employee_name))) AS Position_of_ah
FROM Employees
WHERE PATINDEX('%ah%', LOWER(TRIM(employee_name))) > 0;

-- Task 11: Extract Email Username
SELECT email,
       LEFT(email, CHARINDEX('@', email) - 1) AS Email_Username
FROM Employees;

-- Task 12: Extract Email Domain
SELECT email,
       SUBSTRING(email, CHARINDEX('@', email) + 1,
                 LEN(email) - CHARINDEX('@', email)) AS Email_Domain
FROM Employees;

-- Task 13: Generate Employee Usernames
SELECT employee_id,
       REPLACE(LOWER(TRIM(employee_name)), ' ', '.') AS Username
FROM Employees;

-- Task 14: Capitalize only the first character of each cleaned name
SELECT employee_name,
       CONCAT(UPPER(LEFT(TRIM(employee_name), 1)),
              LOWER(SUBSTRING(TRIM(employee_name), 2, LEN(TRIM(employee_name)))))
              AS Standardized_Name
FROM Employees;

-- Task 15: Replace gmail.com with company.com without changing the table
SELECT email AS Original_Email,
       REPLACE(email, 'gmail.com', 'company.com') AS Updated_Email
FROM Employees;

-- Task 16: Generate Employee Codes
SELECT employee_id,
       CONCAT('EMP-', employee_id, '-', UPPER(department)) AS Employee_Code
FROM Employees;

-- Task 17: Reverse Employee Names
SELECT employee_name,
       REVERSE(TRIM(employee_name)) AS Reversed_Name
FROM Employees;

-- Task 18: Append exactly 10 asterisks to each cleaned name
SELECT employee_name,
       CONCAT(TRIM(employee_name), REPLICATE('*', 10)) AS Formatted_Employee_Name
FROM Employees;

-- Task 19: Combine Employees by Department
SELECT department AS Department,
       COUNT(*) AS Employee_Count,
       STRING_AGG(TRIM(employee_name), ', ') AS Employees
FROM Employees
GROUP BY department;

-- Task 20: Employee Data Transformation Challenge
SELECT employee_id,
       employee_name AS Original_Name,
       Clean_Name,
       LEFT(Clean_Name, CHARINDEX(' ', Clean_Name) - 1) AS First_Name,
       RIGHT(Clean_Name, LEN(Clean_Name) - CHARINDEX(' ', Clean_Name)) AS Last_Name,
       REPLACE(LOWER(TRIM(employee_name)), ' ', '.') AS Username,
       LEFT(email, CHARINDEX('@', email) - 1) AS Email_Username,
       SUBSTRING(email, CHARINDEX('@', email) + 1,
                 LEN(email) - CHARINDEX('@', email)) AS Email_Domain,
       LEN(Clean_Name) AS Name_Length,
       CASE
           WHEN LEN(Clean_Name) > 12 THEN 'Long Name'
           WHEN LEN(Clean_Name) BETWEEN 8 AND 12 THEN 'Medium Name'
           ELSE 'Short Name'
       END AS Name_Category
FROM Employees
CROSS APPLY (VALUES (UPPER(TRIM(employee_name)))) AS Cleaned(Clean_Name);

/* ================================================================
   PART 3 - ADDITIONAL CHALLENGE QUESTIONS
   ================================================================ */

-- 1. Employees whose email domain is gmail.com
SELECT employee_id, employee_name, email
FROM Employees
WHERE SUBSTRING(email, CHARINDEX('@', email) + 1,
                LEN(email) - CHARINDEX('@', email)) = 'gmail.com';

-- 2. Count employees from each city
SELECT city, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY city;

-- 3. All unique departments in uppercase
SELECT DISTINCT UPPER(department) AS Department
FROM Employees;

-- 4. Employees whose cleaned names contain more than 10 characters
SELECT employee_id, employee_name, TRIM(employee_name) AS Clean_Name
FROM Employees
WHERE LEN(TRIM(employee_name)) > 10;

-- 5. Employees whose names have leading or trailing spaces
SELECT employee_id, employee_name
FROM Employees
WHERE employee_name <> TRIM(employee_name);

-- 6. Department-wise employee list
SELECT department AS Department,
       STRING_AGG(TRIM(employee_name), ', ') AS Employee_List
FROM Employees
GROUP BY department;

-- 7. Employees whose cleaned names start with A
SELECT employee_id, employee_name
FROM Employees
WHERE LEFT(UPPER(TRIM(employee_name)), 1) = 'A';

-- 8. Unique employee code using CONCAT and REPLICATE
SELECT employee_id,
       CONCAT('EMP-', employee_id, '-', UPPER(department), '-',
              REPLICATE('*', 3)) AS Unique_Employee_Code
FROM Employees;
