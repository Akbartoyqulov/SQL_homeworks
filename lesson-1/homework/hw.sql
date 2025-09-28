Easy Tasks
 Data: unorganized facts and figures.
Database: a system for storing and managing data electronically in an organized way.
Table: a method of arranging data into rows and columns.
Relational database: a system that stores data in tables and manages them efficiently through relationships (using primary and foreign keys)

Data: Facts and figures obtained through observation or measurement. It can be numbers, text, images, or videos. When organized, it provides useful information.
Database: A system for storing data electronically in an organized way. Managed by DBMS software.
Table: Organizes data into rows (records) and columns (attributes).
Relational Database: Stores data in multiple tables and links them using keys. Managed with SQL. Advantage – ensures accurate, consistent, and fast data retrieval.

SQL Server in short:
RDBMS: Stores, manages, and retrieves data using tables. Works with T-SQL.
Availability & Recovery: Ensures continuity with Always On, mirroring, and clustering for quick recovery.
Security: TDE for encryption, RLS for row-level access control, data masking, and auditing features.
Performance: In-Memory OLTP and columnstore indexes boost speed and handle large data volumes.
BI & Analytics: SSIS for ETL, SSAS for OLAP and data mining, SSRS for reporting, plus machine learning with Python and R

SQL Server authentication methods (short):
Windows Authentication: Connects using Windows login. Most secure, convenient for domain users.
SQL Server Authentication: Requires a separate username and password. Useful for users without Windows accounts.
Mixed Mode: Supports both methods. Flexible, but Windows Authentication is preferred for better security

Medium Tasks
create database SchoolDB
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
GO

SQL Server: A database system developed by Microsoft. It stores, manages, and retrieves data. (Like a car engine).
SSMS: A graphical tool to manage SQL Server. Used to create tables, write queries, and monitor the system. (Like a car dashboard).
SQL: The language for working with databases. Used to send commands and communicate with SQL Server. (Like the language to control the engine).
Summary:
SQL Server — the system itself.
SSMS — the management tool.
SQL — the communication language.

Hard Tasks
DQL (Data Query Language) commands are used to retrieve data from a database.
Command: SELECT
Example:
Коd

    SELECT first_name, last_name FROM employees WHERE department = 'Sales';
DML (Data Manipulation Language)
DML commands are used to manipulate data within the database tables. 
Commands: INSERT, UPDATE, DELETE
Examples:
Коd

    INSERT INTO employees (first_name, last_name, department) VALUES ('John', 'Doe', 'Marketing');
    UPDATE employees SET department = 'IT' WHERE employee_id = 101;
    DELETE FROM employees WHERE employee_id = 105;
    DDL (Data Definition Language)
DDL commands are used to define, modify, and manage the structure of database objects like tables, indexes, and views.
Commands: CREATE, ALTER, DROP, TRUNCATE
Examples:
Коd

    CREATE TABLE products (product_id INT PRIMARY KEY, product_name VARCHAR(255));
    ALTER TABLE products ADD COLUMN price DECIMAL(10, 2);
    DROP TABLE products;
    TRUNCATE TABLE employees; -- Removes all rows but keeps the table structure
    DCL (Data Control Language)
DCL commands manage access and permissions to the database.
Commands: GRANT, REVOKE
Examples:
Коd

    GRANT SELECT, INSERT ON employees TO user_hr;
    REVOKE DELETE ON employees FROM user_hr;
    TCL (Transaction Control Language)
TCL commands manage transactions within a database, ensuring data integrity and consistency.
Commands: COMMIT, ROLLBACK, SAVEPOINT
Examples:
Коd

    START TRANSACTION;
    INSERT INTO orders (order_id, customer_id) VALUES (1, 10);
    SAVEPOINT order_placed;
    UPDATE customers SET balance = balance - 50 WHERE customer_id = 10;
    ROLLBACK TO SAVEPOINT order_placed; -- Reverts the customer balance update
    COMMIT; -- Saves the order insertion
INSERT INTO Students (StudentID, Name, Age)
VALUES
(1, 'Ali Karimov', 20),
(2, 'Dilnoza Ismatova', 22),
(3, 'Jasur Bekmurodov', 19);
GO
select * from Students

RESTORE DATABASE AdventureWorksDW2022
FROM DISK = 'C:\Backups\AdventureWorksDW2022.bak'
WITH 
    MOVE 'AdventureWorksDW2022_Data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2022.mdf',
    MOVE 'AdventureWorksDW2022_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2022.ldf',
    REPLACE;
