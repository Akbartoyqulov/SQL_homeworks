Easy-level tasks

BULK INSERT in SQL Server
BULK INSERT is a Transact-SQL statement used to efficiently load large amounts of data from a data file into a SQL Server table or non-partitioned view. Its purpose is to provide a high-performance method for data ingestion, particularly useful for scenarios like ETL processes, data migrations, and importing data from external sources.
Four File Formats for Import:
 • CSV (Comma Separated Values): A common plain-text format where values are separated by commas.
 • TXT (Plain Text): Generic text files, often with custom delimiters like tabs or pipes.
 • DAT (Data Files): A general term for files containing raw data, which might be in various structured or unstructured formats.
 • XML (Extensible Markup Language): Structured data files that can be imported using XML format files in conjunction with BULK INSERT.
Products Table and Data Insertion
Коd

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);
select * from products 
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 75.00);
NULL vs. NOT NULL
 • NULL: Indicates the absence of a value in a column. It is not equivalent to zero, an empty string, or a blank space. It signifies that the data is unknown or not applicable. 


 • NOT NULL: A column constraint that ensures a column cannot contain NULL values. Every row in a NOT NULL column must have an explicit value. 


Adding UNIQUE Constraint and Comment
Коd

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
select * from products

-- This query adds a UNIQUE constraint to the ProductName column to ensure all product names are distinct.
Adding CategoryID to Products Table
Коd

ALTER TABLE Products
ADD CategoryID INT;
Categories Table Creation
Коd

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

select * from categories
Purpose of IDENTITY Column
The IDENTITY property in SQL Server is used to automatically generate sequential numeric values for a column, typically used for primary keys. When a column is defined with IDENTITY, SQL Server automatically assigns a unique, incremental value to that column for each new row inserted into the table, eliminating the need for manual value management and ensuring data integrity. It is defined with a seed (the starting value) and an increment (the value added for each new row).

Medium-level tasks 

BULK INSERT Products
FROM 'C:\path\to\your\products.txt' -- Replace with the actual path to your text file
WITH (
    FIELDTERMINATOR = ',', -- Specify the character that separates fields
    ROWTERMINATOR = '\n'   -- Specify the character that marks the end of a row
);
2. Creating a FOREIGN KEY in Products Table:
Коd

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
REFERENCES Categories (CategoryID);

select * from products
3. Differences Between PRIMARY KEY and UNIQUE KEY:
 • PRIMARY KEY: Uniquely identifies each record in a table. A table can have only one primary key, and it cannot contain NULL values. It implicitly creates a clustered index on the table, which physically orders the data. 


 • UNIQUE KEY: Ensures that all values in the column(s) are unique. A table can have multiple unique keys, and they can contain NULL values (though only one NULL value is allowed per unique key column). It implicitly creates a non-clustered index. 


4. Adding a CHECK Constraint:
Коd

ALTER TABLE Products
ADD CONSTRAINT CK_Products_PricePositive CHECK (Price > 0);
5. Adding a Stock Column:
Коd

ALTER TABLE Products
ADD Stock INT NOT NULL;
6. Using ISNULL to Replace NULL Values:
Коd

UPDATE Products
SET Price = ISNULL(Price, 0);
7. Purpose and Usage of FOREIGN KEY Constraints:
 • Purpose: FOREIGN KEY constraints enforce referential integrity between tables. They ensure that values in a column (or set of columns) in one table (the referencing table) match values in a PRIMARY KEY or UNIQUE KEY in another table (the referenced table). This prevents the creation of "orphan" records where a child record references a non-existent parent record. 


 • Usage: They are used to establish and maintain relationships between tables in a relational database, ensuring data consistency and preventing data anomalies. For example, in an Orders table, a CustomerID foreign key referencing the Customers table ensures that every order is associated with an existing customer. When a referenced primary key value is deleted or updated, the foreign key constraint can define actions like CASCADE, SET NULL, SET DEFAULT, or NO ACTION to maintain integrity.

 Hard-level tasks

 CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Age INT CHECK (Age >= 18)
);
select * from customers

CREATE TABLE Invoice (
    InvoiceID INT IDENTITY(100,10) PRIMARY KEY,
    InvoiceDate DATE,
    Amount DECIMAL(10,2)

	CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);

select * from orderdetails

100 → starting value
10 → increment each time (100, 110, 120, …)


Function Description Example Output
COALESCE(expr1, expr2, …) Returns the first non-NULL value from the list. Works with multiple expressions. SELECT COALESCE(NULL, NULL, 'Hello'); 'Hello'
ISNULL(expr, replacement) Replaces NULL with a specific replacement value. Only accepts two arguments. SELECT ISNULL(NULL, 'N/A'); 'N/A'
 Difference:
COALESCE can handle multiple arguments, while ISNULL handles only two.
COALESCE is ANSI standard, preferred for cross-database use.

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);
select * from employees

-- Parent table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Child table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
ON DELETE CASCADE: deleting a department will delete all staff linked to it.
ON UPDATE CASCADE: if a department’s ID changes, related staff records update automatically.
