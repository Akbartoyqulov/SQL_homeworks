Esay-level tasks

select productname as name 
from products

select * from customers as client
  
select productname
from products
union 
select productname 
from products_discounted

select productname 
from products 
intersect
select productname
from products_discounted


select distinct firstname, lastname, country
from customers


select productname,
       price,
	   case
	    when price >1000 then 'high'
		else 'low'
		end as pricecategory
from products

select productname,
       stockquantity,
	   iif(stockquantity > 100, 'yes', 'no') as instock
from products_discounted


Medium-level tasks

select productname
from products
union 
select productname 
from products_discounted


select productname
from products
except
select productname 
from products_discounted

SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

SELECT *
FROM Employees
WHERE Age < 25
   OR Salary > 60000;

 UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR'
   OR EmployeeID = 5;

Hard-level tasks 

SELECT SaleID,
       CustomerID,
       SaleAmount,
       CASE
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS TierLevel
FROM Sales;
This categorizes each sale into Top, Mid, or Low tiers based on SaleAmount.


SELECT DISTINCT CustomerID
FROM Orders
EXCEPT
SELECT DISTINCT CustomerID
FROM Sales;
Returns all customers who appear in the Orders table but not in the Sales table.

SELECT CustomerID,
       Quantity,
       CASE
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
           ELSE '7%'
       END AS DiscountPercentage
FROM Orders;
Summary:
Query 1 → CASE with numeric ranges (Tiering)
Query 2 → EXCEPT for comparison across tables
Query 3 → CASE for conditional discounts based on Quantity



























