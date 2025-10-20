Easy-level tasks

select 
products.productsname,
suppliers.supplliername
from products
cross join suppliers

select 
departments.departmentname,
employees.employeename 
from departments
cross join employees


select 
suppliers.suppliername,
products.productname
from products
inner join suppliers
on products.supplierid = suppliers.supplierid

select
customers.customername,
orders.orderid
from orders
inner join customers 
on orders.customerid = customers.customerid

select 
students.studentname,
courses.coursename
from students
cross join courses

select 
produsts.productname,
orders.orderid
from orders
inner join products
on orders.orderid=products.productid

select 
departments.departmentname,
employees.employeename
from employees
inner join employees.departmentid = departments.departmentid

select 
students.studentname,
Enrollments.courseid
from students
inner join Enrollments
on students.srudentid = Enrollments.studentid

select 
orders.orderis ,
payments.paymentid,
payments.amount
from orders 
inner join payments
on orders.orderid = payments.orderid

select 
orders.orderid,
products.productname,
products.price
from orders
inner  join products 
on orders.orderid = products.productid
where products.price > 100

Medium-level tasks

SELECT 
    Employees.EmployeeName, 
    Departments.DeptName
FROM Employees
CROSS JOIN Departments
WHERE Employees.DepartmentID <> Departments.DepartmentID;

SELECT 
    Orders.OrderID, 
    Products.ProductName, 
    Orders.Quantity, 
    Products.StockQuantity
FROM Orders
INNER JOIN Products 
    ON Orders.ProductID = Products.ProductID
WHERE Orders.Quantity > Products.StockQuantity;

SELECT 
    Customers.CustomerName, 
    Sales.ProductID, 
    Sales.SaleAmount
FROM Sales
INNER JOIN Customers 
    ON Sales.CustomerID = Customers.CustomerID
WHERE Sales.SaleAmount >= 500;

SELECT 
    Students.StudentName, 
    Courses.CourseName
FROM Enrollments
INNER JOIN Students 
    ON Enrollments.StudentID = Students.StudentID
INNER JOIN Courses 
    ON Enrollments.CourseID = Courses.CourseID;

SELECT 
    Products.ProductName, 
    Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers 
    ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.SupplierName LIKE '%Tech%';

SELECT 
    Orders.OrderID, 
    Orders.TotalAmount, 
    Payments.PaymentAmount
FROM Orders
INNER JOIN Payments 
    ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentAmount < Orders.TotalAmount;

SELECT 
    Employees.EmployeeName, 
    Departments.DeptName
FROM Employees
INNER JOIN Departments 
    ON Employees.DepartmentID = Departments.DepartmentID;

SELECT 
    Products.ProductName, 
    Categories.CategoryName
FROM Products
INNER JOIN Categories 
    ON Products.CategoryID = Categories.CategoryID

SELECT 
    Sales.SaleID, 
    Customers.CustomerName, 
    Customers.Country, 
    Sales.SaleAmount
FROM Sales
INNER JOIN Customers 
    ON Sales.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'USA';
SELECT 
    Orders.OrderID, 
    Customers.CustomerName, 
    Customers.Country, 
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers 
    ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany'
  AND Orders.TotalAmount > 100;

Hard-level tasks

SELECT 
    e1.EmployeeName AS Employee1, 
    e2.EmployeeName AS Employee2
FROM Employees e1
INNER JOIN Employees e2 
    ON e1.EmployeeID <> e2.EmployeeID
   AND e1.DepartmentID <> e2.DepartmentID;

SELECT 
    Payments.PaymentID,
    Orders.OrderID,
    Payments.PaidAmount,
    (Orders.Quantity * Products.Price) AS ExpectedAmount
FROM Payments
INNER JOIN Orders 
    ON Payments.OrderID = Orders.OrderID
INNER JOIN Products 
    ON Orders.ProductID = Products.ProductID
WHERE Payments.PaidAmount <> (Orders.Quantity * Products.Price);

SELECT 
    Students.StudentName
FROM Students
LEFT JOIN Enrollments 
    ON Students.StudentID = Enrollments.StudentID
WHERE Enrollments.CourseID IS NULL;

select
m.EmployeeName AS ManagerName,
    e.EmployeeName AS EmployeeName,
    m.Salary AS ManagerSalary,
    e.Salary AS EmployeeSalary
FROM Employees m
INNER JOIN Employees e 
    ON m.EmployeeID = e.ManagerID
WHERE m.Salary <= e.Salary;

SELECT 
    Customers.CustomerName, 
    Orders.OrderID
FROM Orders
INNER JOIN Customers 
    ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN Payments 
    ON Orders.OrderID = Payments.OrderID
WHERE Payments.OrderID IS NULL;




















































































