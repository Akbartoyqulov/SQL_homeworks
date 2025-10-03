Basic-Level Tasks 
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
select * from Employees

INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali', 6500.00);

INSERT INTO Employees
VALUES (2, 'Vali', 5500.00);

select * from Employees

INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Gulnoza', 4800.00),
(4, 'Dilshod', 7200.00);

UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;
select * from Employees

DELETE FROM Employees
WHERE EmpID = 2;
DELETE → Deletes data from a table based on a condition, but keeps the structure. (Can be rolled back).
TRUNCATE → Quickly deletes all rows from a table, but keeps the structure. (Cannot be rolled back).
DROP → Completely removes the table (both data and structure).

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

ALTER TABLE Employees
ADD Department VARCHAR(50);

ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

select * from Employees

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)

	TRUNCATE TABLE Employees;

Intermediate-Level tasks

	INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR' UNION ALL
SELECT 2, 'Finance' UNION ALL
SELECT 3, 'IT' UNION ALL
SELECT 4, 'Marketing' UNION ALL
SELECT 5, 'Operations';

UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

TRUNCATE TABLE Employees;

ALTER TABLE Employees
DROP COLUMN Department;

select * from Employees

EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

Advanced-Level Tasks

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Description VARCHAR(200)

	select * from products
	ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES (1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES (2, 'Phone', 'Electronics', 800.00, 'Smartphone 5G');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES (3, 'Table', 'Furniture', 150.00, 'Wooden office table');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES (4, 'Chair', 'Furniture', 75.00, 'Ergonomic chair');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES (5, 'Headphones', 'Electronics', 200.00, 'Noise cancelling headphones');

SELECT *
INTO Products_Backup
FROM Products;

EXEC sp_rename 'Products', 'Inventory';
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5) Not Null;
