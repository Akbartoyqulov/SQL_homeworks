Easy-level tasks 

SELECT 
    e.Employeeid,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary > 50000;

select 
   c.firstname,
   c.lastname,
   o.orderdate
from customers c
join orders o on c.customerid = o.customerid
where year(orderdate) = 2023

select 
  e.employeeid,
  d.departmentid
  from employees e

  left join departments d on e.departmentid   = d.departmentid

SELECT 
    s.SupplierName,
    p.ProductName
FROM 
    Suppliers s
LEFT JOIN 
    Products p ON s.SupplierID = p.SupplierID;

SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM 
    Orders o
FULL OUTER JOIN 
    Payments p ON o.OrderID = p.OrderID;

SELECT 
    e.EmployeeName,
    m.EmployeeName AS ManagerName
FROM 
    Employees e
LEFT JOIN 
    Employees m ON e.ManagerID = m.EmployeeID;

SELECT 
    s.StudentName,
    c.CourseName
FROM 
    Students s
JOIN 
    Enrollments e ON s.StudentID = e.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID
WHERE 
    c.CourseName = 'Math 101';

SELECT 
    c.FirstName,
    c.LastName,
    o.Quantity
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.Quantity > 3;

SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Human Resources';


Medium-level tasks

SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM 
    Departments d
JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentName
HAVING 
    COUNT(e.EmployeeID) > 5;

SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Sales s ON p.ProductID = s.ProductID
WHERE 
    s.ProductID IS NULL;

SELECT 
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.FirstName, c.LastName;

SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;

SELECT 
    e1.EmployeeName AS Employee1,
    e2.EmployeeName AS Employee2,
    e1.ManagerID
FROM 
    Employees e1
JOIN 
    Employees e2 ON e1.ManagerID = e2.ManagerID 
                AND e1.EmployeeID < e2.EmployeeID
WHERE 
    e1.ManagerID IS NOT NULL;

SELECT 
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    YEAR(o.OrderDate) = 2022;

SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Sales' AND e.Salary > 60000;

SELECT 
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.Amount
FROM 
    Orders o
JOIN 
    Payments p ON o.OrderID = p.OrderID;

SELECT 
    p.ProductID,
    p.ProductName
FROM 
    Products p
LEFT JOIN 
    Orders o ON p.ProductID = o.ProductID
WHERE 
    o.ProductID IS NULL;

Hard-level tasks

SELECT EmployeeName, Salary
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);

SELECT O.OrderID, O.OrderDate
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE O.OrderDate < '2020-01-01' AND P.PaymentID IS NULL;

SELECT P.ProductID, P.ProductName
FROM Products P
LEFT JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryID IS NULL;

SELECT E1.EmployeeName AS Employee1,
       E2.EmployeeName AS Employee2,
       E1.ManagerID,
       E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.ManagerID AND E1.EmployeeID <> E2.EmployeeID
WHERE E1.Salary > 60000;

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName LIKE 'M%';

SELECT S.SaleID, P.ProductName, S.SaleAmount
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
WHERE S.SaleAmount > 500;

SELECT S.StudentID, S.StudentName
FROM Students S
WHERE S.StudentID NOT IN (
    SELECT E.StudentID
    FROM Enrollments E
    JOIN Courses C ON E.CourseID = C.CourseID
    WHERE C.CourseName = 'Math 101'
);

SELECT O.OrderID, O.OrderDate, P.PaymentID
FROM Orders O
LEFT JOIN Payments P ON O.OrderID = P.OrderID
WHERE P.PaymentID IS NULL;

SELECT P.ProductID, P.ProductName, C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName IN ('Electronics', 'Furniture');











































































































