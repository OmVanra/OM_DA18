/* ==============================================================================
   ASSIGNMENT: SQL Assignment - Numeric, Date & Time, and NULL Functions
   ENVIRONMENT: Microsoft SQL Server (SSMS)
   TOTAL TASKS: 20
   ============================================================================== */

-- Optional: Table creation and data insertion script (provided in assignment)
/*
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    SalesAmount DECIMAL(12,2),
    Discount DECIMAL(5,2),
    Quantity INT,
    JoinDate DATE,
    SaleDate DATETIME,
    BirthDate DATE,
    Bonus DECIMAL(10,2),
    Commission DECIMAL(10,2)
);

INSERT INTO EmployeeSales VALUES
(1, 'Aarav', 'Sales', 45000.75, 12500.567, 5.50, 10, '2021-03-15', '2026-01-05 10:30:00', '1995-06-12', 2500, 750),
(2, 'Priya', 'IT', 65000.40, 18750.255, NULL, 5, '2019-07-22', '2026-01-10 14:45:00', '1992-11-25', 5000, NULL),
(3, 'Rohan', 'Finance', 55000.99, 9200.899, 10.00, 8, '2022-01-10', '2026-02-15 09:15:00', '1998-03-18', NULL, 450),
(4, 'Neha', 'Sales', 48000.25, 15400.333, 7.25, 12, '2020-11-05', '2026-02-20 16:20:00', '1996-08-30', 3000, 900),
(5, 'Vikram', 'IT', 72000.80, 22500.789, NULL, 7, '2018-05-18', '2026-03-12 11:10:00', '1990-01-14', 6000, 1200),
(6, 'Ananya', 'HR', 42000.60, 6800.456, 3.00, 4, '2023-06-01', '2026-03-18 13:35:00', '2000-04-22', NULL, NULL),
(7, 'Karan', 'Finance', 58000.35, 11200.678, 8.50, 9, '2021-09-12', '2026-04-02 08:50:00', '1994-12-05', 3500, 650),
(8, 'Meera', 'Sales', 51000.90, 19800.444, 6.00, 15, '2017-02-28', '2026-04-15 17:40:00', '1989-07-19', 4000, NULL),
(9, 'Arjun', 'IT', 68000.55, 16750.123, 4.50, 6, '2020-08-17', '2026-05-05 12:25:00', '1993-09-09', NULL, 1100),
(10, 'Isha', 'HR', 44000.20, 7350.987, NULL, 3, '2024-01-15', '2026-05-20 15:05:00', '2001-02-28', 1500, 300),
(11, 'Dev', 'Finance', 60000.00, 14300.555, 9.00, 11, '2019-12-10', '2026-06-08 10:00:00', '1991-05-16', 4500, 800),
(12, 'Simran', 'Sales', 49500.45, 17800.222, NULL, 14, '2022-04-25', '2026-06-18 18:15:00', '1997-10-11', NULL, 950),
(13, 'Kabir', 'IT', 75000.95, 24900.888, 12.00, 13, '2016-10-03', '2026-07-04 09:40:00', '1988-03-07', 7000, 1500),
(14, 'Tanya', 'HR', 46000.70, 8900.333, 5.00, 6, '2023-02-14', '2026-07-22 14:10:00', '1999-06-29', NULL, NULL),
(15, 'Rahul', 'Finance', 62000.15, 16200.777, 7.00, 10, '2018-09-20', '2026-08-11 11:55:00', '1990-12-17', 5500, 1000),
(16, 'Pooja', 'Sales', 53000.85, 21500.666, NULL, 16, '2020-04-06', '2026-08-25 16:45:00', '1994-04-03', 4200, 1250),
(17, 'Aditya', 'IT', 71000.30, 20500.999, 6.50, 8, '2017-06-19', '2026-09-02 08:30:00', '1992-08-21', NULL, 1350),
(18, 'Nisha', 'HR', 43000.95, 5600.111, 2.50, 5, '2024-03-11', '2026-09-10 13:20:00', '2002-01-08', 1000, NULL),
(19, 'Manish', 'Finance', 59000.65, 13100.444, NULL, 12, '2021-12-01', '2026-09-18 10:50:00', '1995-11-13', 3800, 700),
(20, 'Diya', 'Sales', 47000.50, 14600.888, 4.00, 9, '2022-08-08', '2026-09-25 17:25:00', '1998-05-27', NULL, 600);
*/

-- ==============================================================================
-- SECTION A: NUMERIC FUNCTIONS (TASKS 1 - 7)
-- ==============================================================================

-- Task 1: Display each employee's name, salary, and sales amount rounded to two decimal places.
SELECT 
    EmployeeName,
    ROUND(Salary, 2) AS Salary,
    ROUND(SalesAmount, 2) AS RoundedSalesAmount
FROM EmployeeSales;
GO

-- Task 2: Display each employee's sales amount rounded to the nearest whole number.
SELECT 
    EmployeeName,
    SalesAmount,
    ROUND(SalesAmount, 0) AS SalesAmountNearestWhole
FROM EmployeeSales;
GO

-- Task 3: Display the ceiling and floor values of every employee's sales amount.
SELECT 
    EmployeeName,
    SalesAmount,
    CEILING(SalesAmount) AS SalesAmountCeiling,
    FLOOR(SalesAmount) AS SalesAmountFloor
FROM EmployeeSales;
GO

-- Task 4: Calculate the absolute difference between each employee's salary and ₹50,000.
SELECT 
    EmployeeName,
    Salary,
    ABS(Salary - 50000.00) AS SalaryDifferenceFrom50000
FROM EmployeeSales;
GO

-- Task 5: Calculate the square of each employee's quantity sold.
SELECT 
    EmployeeName,
    Quantity,
    POWER(Quantity, 2) AS QuantitySquared
FROM EmployeeSales;
GO

-- Task 6: Calculate the square root of each employee's sales amount and round the result to two decimal places.
SELECT 
    EmployeeName,
    SalesAmount,
    ROUND(SQRT(SalesAmount), 2) AS SqrtSalesAmount
FROM EmployeeSales;
GO

-- Task 7: Calculate the average selling amount per unit for each employee by dividing SalesAmount by Quantity. 
--         Round the result to two decimal places.
SELECT 
    EmployeeName,
    SalesAmount,
    Quantity,
    ROUND(SalesAmount / Quantity, 2) AS AvgSellingAmountPerUnit
FROM EmployeeSales;
GO


-- ==============================================================================
-- SECTION B: DATE AND TIME FUNCTIONS (TASKS 8 - 14)
-- ==============================================================================

-- Task 8: Display each employee's name, joining date, joining year, joining month, and joining day.
SELECT 
    EmployeeName,
    JoinDate,
    YEAR(JoinDate) AS JoiningYear,
    MONTH(JoinDate) AS JoiningMonth,
    DAY(JoinDate) AS JoiningDay
FROM EmployeeSales;
GO

-- Task 9: Extract the year, month, and day from each employee's SaleDate.
SELECT 
    EmployeeName,
    SaleDate,
    YEAR(SaleDate) AS SaleYear,
    MONTH(SaleDate) AS SaleMonth,
    DAY(SaleDate) AS SaleDay
FROM EmployeeSales;
GO

-- Task 10: Calculate the number of years each employee has worked in the organization, using the current date and JoinDate.
--          Bonus Challenge: Calculates completed full years of service accurately (accounting for whether the anniversary has occurred this year).
SELECT 
    EmployeeName,
    JoinDate,
    CAST(GETDATE() AS DATE) AS CurrentDate,
    DATEDIFF(YEAR, JoinDate, GETDATE()) - 
        CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, JoinDate, GETDATE()), JoinDate) > GETDATE() 
            THEN 1 
            ELSE 0 
        END AS CompletedYearsOfService
FROM EmployeeSales;
GO

-- Task 11: Calculate the number of days between JoinDate and SaleDate for each employee.
SELECT 
    EmployeeName,
    JoinDate,
    SaleDate,
    DATEDIFF(DAY, JoinDate, SaleDate) AS DaysBetweenJoinAndSale
FROM EmployeeSales;
GO

-- Task 12: Display the sale date and the date exactly 30 days after each sale.
SELECT 
    EmployeeName,
    SaleDate,
    DATEADD(DAY, 30, SaleDate) AS Date30DaysAfterSale
FROM EmployeeSales;
GO

-- Task 13: Display each employee's sale date along with the name of the weekday on which the sale occurred.
SELECT 
    EmployeeName,
    SaleDate,
    DATENAME(WEEKDAY, SaleDate) AS SaleDayOfWeek
FROM EmployeeSales;
GO

-- Task 14: Display each employee's sale date and the last date of that sale's month.
SELECT 
    EmployeeName,
    SaleDate,
    EOMONTH(SaleDate) AS EndOfSaleMonth
FROM EmployeeSales;
GO


-- ==============================================================================
-- SECTION C: NULL FUNCTIONS (TASKS 15 - 20)
-- ==============================================================================

-- Task 15: Display employee name, bonus, and a calculated bonus value where missing bonuses are replaced with 0.
SELECT 
    EmployeeName,
    Bonus,
    ISNULL(Bonus, 0) AS CalculatedBonus
FROM EmployeeSales;
GO

-- Task 16: Display employee name, commission, and a calculated commission value where missing commissions are replaced with 0.
SELECT 
    EmployeeName,
    Commission,
    ISNULL(Commission, 0) AS CalculatedCommission
FROM EmployeeSales;
GO

-- Task 17: Display employee name, bonus, commission, and a new column called TotalIncentive.
--          Treat missing bonus and commission values as zero when calculating the total.
SELECT 
    EmployeeName,
    Bonus,
    Commission,
    ISNULL(Bonus, 0) + ISNULL(Commission, 0) AS TotalIncentive
FROM EmployeeSales;
GO

-- Task 18: Display employee name, discount, and a new column called DiscountStatus.
--          If the discount is NULL, display 'Not Provided'; otherwise, display 'Available'.
SELECT 
    EmployeeName,
    Discount,
    CASE 
        WHEN Discount IS NULL THEN 'Not Provided' 
        ELSE 'Available' 
    END AS DiscountStatus
FROM EmployeeSales;
GO

-- Task 19: Display employee name, bonus, and commission. Create a new column called AvailableIncentive
--          that returns the bonus if available; otherwise, returns the commission. If both are NULL, return 0.
SELECT 
    EmployeeName,
    Bonus,
    Commission,
    COALESCE(Bonus, Commission, 0) AS AvailableIncentive
FROM EmployeeSales;
GO

-- Task 20: Calculate the sales amount per unit for each employee using SalesAmount divided by Quantity.
--          Use NULLIF() to prevent division-by-zero errors if the quantity is zero, and display 0 when the result is NULL.
SELECT 
    EmployeeName,
    SalesAmount,
    Quantity,
    ISNULL(ROUND(SalesAmount / NULLIF(Quantity, 0), 2), 0) AS SalesAmountPerUnit
FROM EmployeeSales;
GO
