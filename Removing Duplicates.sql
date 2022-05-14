-- Selecting Database
USE SQL_Exercise;

-- Viewing the table
SELECT *
FROM Employee;

-- Writing a query to get the duplicate data
SELECT 
    *,
    ROW_NUMBER() OVER( PARTITION BY FirstName, LastName, Phone, Email ORDER BY Employee_ID DESC) AS row_num
FROM Employee;

-- Let's remove the duplicate data
WITH CTE AS (
    SELECT 
        *,
        ROW_NUMBER() OVER( PARTITION BY FirstName, LastName, Phone, Email ORDER BY Employee_ID DESC) AS row_num
    FROM Employee
)
DELETE FROM CTE
WHERE row_num > 1;

-- Let's view the data again
SELECT *
FROM Employee;
