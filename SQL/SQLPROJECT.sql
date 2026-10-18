SELECT * FROM retailStore;

-- Check the row count

SELECT COUNT(*) AS total_rows
FROM retailStore;

-- Preview the data
SELECT TOP 20 *
FROM dbo.retailStore;

-- Find missing values
SELECT
    SUM(CASE
        WHEN Transaction_ID IS NULL
          OR LTRIM(RTRIM(Transaction_ID)) = ''
        THEN 1 ELSE 0
    END) AS missing_transaction_id,

    SUM(CASE
        WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID)) = ''
        THEN 1 ELSE 0
    END) AS missing_customer_id,

    SUM(CASE
        WHEN Category IS NULL
          OR LTRIM(RTRIM(Category)) = ''
        THEN 1 ELSE 0
    END) AS missing_category,

    SUM(CASE
        WHEN Item IS NULL
          OR LTRIM(RTRIM(Item)) = ''
        THEN 1 ELSE 0
    END) AS missing_item,

    SUM(CASE
        WHEN Price_Per_Unit IS NULL
        THEN 1 ELSE 0
    END) AS missing_price,

    SUM(CASE
        WHEN Quantity IS NULL
        THEN 1 ELSE 0
    END) AS missing_quantity,

    SUM(CASE
        WHEN Total_Spent IS NULL
        THEN 1 ELSE 0
    END) AS missing_total,

    SUM(CASE
        WHEN Payment_Method IS NULL
          OR LTRIM(RTRIM(Payment_Method)) = ''
        THEN 1 ELSE 0
    END) AS missing_payment,

    SUM(CASE
        WHEN Transaction_Date IS NULL
        THEN 1 ELSE 0
    END) AS missing_date,

    SUM(CASE
        WHEN Discount_Applied IS NULL
        THEN 1 ELSE 0
    END) AS missing_discount

FROM retailStore;

-- Find duplicate transaction IDs

SELECT 
    Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM retailStore
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;

SELECT 
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT Transaction_ID) AS UniqueTransactions
FROM retailStore;

SELECT DISTINCT Payment_Method
FROM retailStore;

UPDATE retailStore
SET
    Transaction_ID = LTRIM(RTRIM(Transaction_ID)),
    Customer_ID = LTRIM(RTRIM(Customer_ID)),
    Category = LTRIM(RTRIM(Category)),
    Item = LTRIM(RTRIM(Item)),
    Payment_Method = LTRIM(RTRIM(Payment_Method)),
    Location = LTRIM(RTRIM(Location));

SELECT *
FROM retailStore
WHERE Price_Per_Unit IS NULL
   OR Quantity IS NULL
   OR Total_Spent IS NULL;

UPDATE retailStore
SET Total_Spent = Price_Per_Unit * Quantity
WHERE Total_Spent IS NULL
  AND Price_Per_Unit IS NOT NULL
  AND Quantity IS NOT NULL;

UPDATE retailStore
SET Price_Per_Unit = Total_Spent / Quantity
WHERE Price_Per_Unit IS NULL
  AND Total_Spent IS NOT NULL
  AND Quantity IS NOT NULL
  AND Quantity <> 0;

UPDATE retailStore
SET Quantity = Total_Spent / Price_Per_Unit
WHERE Quantity IS NULL
  AND Total_Spent IS NOT NULL
  AND Price_Per_Unit IS NOT NULL
  AND Price_Per_Unit <> 0;

-- Handle missing Item values

SELECT *
FROM retailStore
WHERE Item IS NULL
   OR LTRIM(RTRIM(Item)) = '';


UPDATE retailStore
SET Item = 'Unknown'
WHERE Item IS NULL
   OR LTRIM(RTRIM(Item)) = '';

SELECT Discount_Applied, COUNT(*) AS NUMBERoFrOWS FROM
retailStore
GROUP BY Discount_Applied;

UPDATE retailStore
SET Discount_Applied = 0
WHERE Discount_Applied IS NULL;

SELECT 
    Category,
    COUNT(*) AS NumberOfTransactions
FROM retailStore
GROUP BY Category
ORDER BY Category;

SELECT Payment_Method, COUNT(*) AS NUM_OF_ROWS FROM
retailStore
GROUP BY Payment_Method;

SELECT Location, COUNT(*) AS NUM_OF_ROWS FROM 
retailStore
GROUP BY Location;

SELECT * FROM 
retailStore WHERE
Price_Per_Unit <= 0
AND Quantity <= 0
AND Total_Spent <= 0;

SELECT 
    MIN(Transaction_Date) AS FirstTransaction,
    MAX(Transaction_Date) AS LastTransaction
FROM retailStore;

ALTER TABLE retailStore
ALTER COLUMN Transaction_Date DATE;


SELECT DISTINCT(Discount_Applied) FROM
retailStore;

SELECT 
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT Transaction_ID) AS UniqueTransactions,
    COUNT(DISTINCT Customer_ID) AS UniqueCustomers
FROM retailStore;


SELECT * INTO retailStore_Clean
FROM retailStore;

SELECT * FROM retailStore_Clean;

SELECT
    SUM(CASE
        WHEN [Transaction_ID] IS NULL
          OR LTRIM(RTRIM([Transaction_ID])) = ''
        THEN 1 ELSE 0
    END) AS missing_transaction_id,

    SUM(CASE
        WHEN [Customer_ID] IS NULL
          OR LTRIM(RTRIM([Customer_ID])) = ''
        THEN 1 ELSE 0
    END) AS missing_customer_id,

    SUM(CASE
        WHEN [Category] IS NULL
          OR LTRIM(RTRIM([Category])) = ''
        THEN 1 ELSE 0
    END) AS missing_category,

    SUM(CASE
        WHEN [Item] IS NULL
          OR LTRIM(RTRIM([Item])) = ''
        THEN 1 ELSE 0
    END) AS missing_item,

    SUM(CASE
        WHEN [Price_Per_Unit] IS NULL
        THEN 1 ELSE 0
    END) AS missing_price,

    SUM(CASE
        WHEN [Quantity] IS NULL
        THEN 1 ELSE 0
    END) AS missing_quantity,

    SUM(CASE
        WHEN [Total_Spent] IS NULL
        THEN 1 ELSE 0
    END) AS missing_total,

    SUM(CASE
        WHEN [Payment_Method] IS NULL
          OR LTRIM(RTRIM([Payment_Method])) = ''
        THEN 1 ELSE 0
    END) AS missing_payment,

    SUM(CASE
        WHEN [Transaction_Date] IS NULL
        THEN 1 ELSE 0
    END) AS missing_date,

    SUM(CASE
        WHEN [Discount_Applied] IS NULL
        THEN 1 ELSE 0
    END) AS missing_discount

FROM retailStore_Clean;


SELECT * FROM
retailStore_Clean 
WHERE Quantity IS NULL;

SELECT
    COUNT(*) AS missing_both
FROM retailStore_Clean
WHERE Quantity IS NULL
  AND Total_Spent IS NULL;


SELECT * FROM retailStore_Clean
WHERE Quantity IS NULL 
AND Total_Spent IS NULL;

SELECT Category,COUNT(*) AS MISSING_ROWS 
FROM retailStore_Clean
WHERE Quantity IS NULL AND Total_Spent IS NULL
GROUP BY Category
ORDER BY MISSING_ROWS DESC;

SELECT Item, COUNT(*) AS MISSING_ROWS
FROM retailStore_Clean
WHERE Quantity IS NULL AND Total_Spent IS NULL
GROUP BY Item
ORDER BY MISSING_ROWS DESC;

SELECT
    Customer_ID,
    COUNT(*) AS MissingRows
FROM retailStore_Clean
WHERE Quantity IS NULL
  AND Total_Spent IS NULL
GROUP BY Customer_ID
ORDER BY MissingRows DESC;


DELETE FROM retailStore_Clean
WHERE Quantity IS NULL
AND Total_Spent IS NULL;

SELECT
    SUM(CASE
        WHEN Transaction_ID IS NULL
          OR LTRIM(RTRIM(Transaction_ID)) = ''
        THEN 1 ELSE 0
    END) AS missing_transaction_id,

    SUM(CASE
        WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID)) = ''
        THEN 1 ELSE 0
    END) AS missing_customer_id,

    SUM(CASE
        WHEN Category IS NULL
          OR LTRIM(RTRIM(Category)) = ''
        THEN 1 ELSE 0
    END) AS missing_category,

    SUM(CASE
        WHEN Item IS NULL
          OR LTRIM(RTRIM(Item)) = ''
        THEN 1 ELSE 0
    END) AS missing_item,

    SUM(CASE
        WHEN Price_Per_Unit IS NULL
        THEN 1 ELSE 0
    END) AS missing_price,

    SUM(CASE
        WHEN Quantity IS NULL
        THEN 1 ELSE 0
    END) AS missing_quantity,

    SUM(CASE
        WHEN Total_Spent IS NULL
        THEN 1 ELSE 0
    END) AS missing_total,

    SUM(CASE
        WHEN Payment_Method IS NULL
          OR LTRIM(RTRIM(Payment_Method)) = ''
        THEN 1 ELSE 0
    END) AS missing_payment,

    SUM(CASE
        WHEN Transaction_Date IS NULL
        THEN 1 ELSE 0
    END) AS missing_date,

    SUM(CASE
        WHEN Discount_Applied IS NULL
        THEN 1 ELSE 0
    END) AS missing_discount

FROM retailStore_Clean;
