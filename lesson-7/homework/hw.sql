Easy-level tasks

select min(price) as minprice
from products

select max(salary) as maxsalary
from Employees

select count(*) as totalcustomers
from customers

select count(distinct category) 
from products

select sum(saleamount) as totalsales
from sales 
where productid = 7

select avg(age) as avgage
from employees

select DepartmentName, count(*) as employeecount
from employees 
group  by DepartmentName

select category,
min(price) as minprice,
max(price) as maxprice
from products
group by category

select customerid,
sum(saleamount) as totlsale
from sales 
group by customerid

select departmentname  
from employees 
group by departmentname
having count(*) > 5

Medium-level tasks

select 
productid,
sum(saleamount) as totalsales,
avg(saleamount) as averagesales
from sales
group by productid

SELECT
    COUNT(*) 
FROM
    Employees
WHERE
    Departmentname = 'HR';

select 
  departmentname,
  max(salary) as maxsalary,
  min(salary) as minsalary
  from employees
  group by departmentname
  select departmentname ,
	avg(salary) as avgsalary
	from employees 

group by departmentname

select departmentname ,
avg(salary) as avgsalary,
count(*) as numberofemployees
from employees 
group by departmentname

 SELECT
   Category
FROM
    Products
GROUP BY
    Category
HAVING
    AVG(Price) > 400;

SELECT
    YEAR(SaleDate) AS SalesYear,
    SUM(SaleAmount) AS TotalSales
FROM
    Sales
GROUP BY
    YEAR(SaleDate)
ORDER BY
    SalesYear;

SELECT
    departmentname
FROM
    Employees
GROUP BY
    departmentname
HAVING
    AVG(Salary) > 60000;

    SELECT
    c.CategoryName,
    AVG(p.Price) AS AveragePrice
FROM
    Categories AS c
JOIN
    Products AS p ON c.CategoryID = p.CategoryID
GROUP BY
    c.CategoryName
HAVING
    AVG(p.Price) > 150;
    SELECT 
    d.DepartmentID,
    SUM(e.Salary) AS TotalSalary,
    AVG(e.Salary) AS AvgSalary
FROM HR.Employees AS e
JOIN HR.Departments AS d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID
HAVING AVG(e.Salary) > 65000;


	SELECT 
    o.CustomerID,
    SUM(o.Freight) AS TotalFreightOver50,
    MIN(o.Freight) AS LeastPurchase
FROM Sales.Orders AS o
WHERE o.Freight > 50
GROUP BY o.CustomerID;

SELECT 
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonth,
    SUM(od.UnitPrice * od.Quantity) AS TotalSales,
    COUNT(DISTINCT od.ProductID) AS UniqueProducts
FROM Sales.Orders AS o
JOIN Sales.OrderDetails AS od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
HAVING COUNT(DISTINCT od.ProductID) >= 2
ORDER BY OrderYear, OrderMonth;

SELECT 
    YEAR(o.OrderDate) AS OrderYear,
    MIN(od.Quantity) AS MinOrderQty,
    MAX(od.Quantity) AS MaxOrderQty
FROM Sales.Orders AS o
JOIN Sales.OrderDetails AS od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate)
ORDER BY OrderYear;


