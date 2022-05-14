-- Creating Database
IF NOT EXISTS(
    SELECT *
    FROM sys.databases
    WHERE name = 'SQL_Exercise'
)
BEGIN
    CREATE DATABASE SQL_Exercise
END
GO

-- Selecting Database
USE SQL_Exercise
GO

-- Creating Employee Table
CREATE TABLE Employee
(
    Employee_ID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Phone BIGINT,
    Email VARCHAR(50),
    CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED (Employee_ID),
    CONSTRAINT CK_@_Email CHECK((Email LIKE '%@%') AND (EMAIL LIKE '%.com'))
)
GO

-- Inserting Values into Employee Table
INSERT INTO Employee
VALUES
    (1, 'Adam', 'Owens', 1112223334, 'adamowens@gmail.com'),
    (2, 'Michelle', 'Wilis', 2223334445, 'michellewilis@gmail.com'),
    (3, 'Natasha', 'Lee', 3334445556, 'natashalee@gmail.com'),
    (4, 'Riley', 'Jones', 4445556667, 'rileyjones@gmail.com'),
    (5, 'Adam', 'Owens', 1112223334, 'adamowens@gmail.com'),
    (6, 'Natasha', 'Lee', 3334445556, 'natashalee@gmail.com')
GO