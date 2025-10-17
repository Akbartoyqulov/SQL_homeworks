Easy-level tasks

select category ,
count(productId) as totalproducts
from products
group by category

select avg(price) as avgelcetronicscategory
 from products
 where category = 'electronics'

select * from customers
where  city like 'L%'

select * from products 
 where productname like '%er'
select * from customers 
where country like '%a'

select max(price) as maxprice
from products

SELECT 
    ProductID,
    ProductName,
    stockQuantity,
    CASE 
        WHEN stockQuantity < 30 THEN 'Low Stock'
        ELSE 'Sufficient'
    END AS StockStatus
FROM Products;

select country,
count(customerid) as totalcustomers
from customers 
group by country

elect * from  orders
select max(quantity) as maxquantity
from orders

select min(quantity) as minquantity
from orders
Medium-level tasks

SELECT DISTINCT o.CustomerID
FROM Orders o
LEFT JOIN Invoices i ON o.OrderID = i.OrderID
WHERE i.InvoiceID IS NULL
  AND o.OrderDate >= '2023-01-01'
  AND o.OrderDate < '2023-02-01';

Explanation:

    Filters orders in January 2023.

    Uses a LEFT JOIN to find orders without a matching invoice.

  SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

Explanation:

    UNION ALL keeps duplicates.

  SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

Explanation:

    UNION removes duplicates automatically.

  SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(OrderAmount) AS AvgOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

ELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM Products;

SELECT *
INTO Population_Each_Year
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;

Explanation:

    Uses PIVOT to turn Year values into columns.

  SELECT 
    ProductID,
    SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

SELECT *
INTO Population_Each_City
FROM (
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT (
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

Hard-level tasks

SELECT TOP 3
    CustomerID,
    SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

ELECT City, '2012' AS Year, [2012] AS Population
FROM Population_Each_Year
UNION ALL
SELECT City, '2013', [2013]
FROM Population_Each_Year;

Explanation:

    Unpivots year columns back into rows.


SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;

SELECT 'Bektemir' AS City, Year, [Bektemir] AS Population
FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', Year, [Chilonzor]
FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', Year, [Yakkasaroy]
FROM Population_Each_City;












  











































