-- Selecting Database
USE AdventureWorksDW2019;

/*
Question: Select all the employees whose "Base Rate" is Higher than the Avgerage Base Rate when calculated by Marital Status
*/

-- Calculating Avg. Base Rate by Marital Status
SELECT AVG(BaseRate) AS AvgBaseRate
FROM DimEmployee
GROUP BY MaritalStatus;

-- Employees with the desired filter
SELECT FirstName, LastName, MaritalStatus, BaseRate
FROM DimEmployee
WHERE BaseRate >
    CASE MaritalStatus
        WHEN 'M' THEN (
            SELECT AVG(BaseRate) AS AvgBaseRate
            FROM DimEmployee
            GROUP BY MaritalStatus
            HAVING MaritalStatus = 'M'
        )
        WHEN 'S' THEN (
            SELECT AVG(BaseRate) AS AvgBaseRate
            FROM DimEmployee
            GROUP BY MaritalStatus
            HAVING MaritalStatus = 'S'
        )
    END
