Easy level tasks 


with [recursive] as 
(
select 1 as n
union all
select n + 1 from recursive where n <= 100
)
select *  from recursive

SELECT e.EmployeeID, e.FirstName, e.LastName, t.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS t ON e.EmployeeID = t.EmployeeID;

WITH AvgSalary AS (
    SELECT AVG(Salary) AS AverageSalary
    FROM Employees
)
SELECT AverageSalary FROM AvgSalary;

SELECT p.ProductID, p.ProductName, t.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) AS t ON p.ProductID = t.ProductID;

WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n * 2
    FROM Numbers
    WHERE n * 2 < 1000000
)
SELECT n
FROM Numbers;

WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.FirstName, e.LastName, s.TotalSales
FROM Employees e
JOIN SalesCount s ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales > 5;

WITH AvgSal AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary
FROM Employees e, AvgSal
WHERE e.Salary > AvgSal.AvgSalary;

Medium level tasks 

SELECT TOP 5 e.EmployeeID, e.FirstName, e.LastName, t.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) AS t ON e.EmployeeID = t.EmployeeID
ORDER BY t.OrderCount DESC;



SELECT p.CategoryID, SUM(s.SalesAmount) AS TotalCategorySales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.CategoryID;

WITH FactorialCTE AS (
    SELECT Number, 1 AS Factor, 1 AS Counter
    FROM Numbers1
    UNION ALL
    SELECT n.Number, f.Factor * (f.Counter + 1), f.Counter + 1
    FROM FactorialCTE f
    JOIN Numbers1 n ON f.Number = n.Number
    WHERE f.Counter < n.Number
)
SELECT Number, MAX(Factor) AS Factorial
FROM FactorialCTE
GROUP BY Number
ORDER BY Number;

WITH Split AS (
    SELECT Id, String, LEFT(String,1) AS CharPart, 1 AS Pos
    FROM Example
    UNION ALL
    SELECT Id, String, SUBSTRING(String, Pos+1, 1), Pos+1
    FROM Split
    WHERE Pos < LEN(String)
)
SELECT Id, CharPart
FROM Split
ORDER BY Id, Pos;



WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS Yr,
        MONTH(SaleDate) AS Mn,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
)
SELECT 
    Yr, Mn, 
    TotalSales,
    TotalSales - LAG(TotalSales) OVER (ORDER BY Yr, Mn) AS Difference
FROM MonthlySales;

SELECT e.EmployeeID, e.FirstName, e.LastName, t.Quarter, t.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) AS t ON e.EmployeeID = t.EmployeeID
WHERE t.TotalSales > 45000;

Difficult tasks

WITH Fibonacci AS (
    SELECT 0 AS n1, 1 AS n2
    UNION ALL
    SELECT n2, n1 + n2
    FROM Fibonacci
    WHERE n1 + n2 < 1000000
)
SELECT n1 AS FibonacciNumber FROM Fibonacci;

SELECT Id, Vals
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals IS NOT NULL
  AND LEN(REPLACE(Vals, LEFT(Vals,1), '')) = 0;




  WITH Numbers AS (
    SELECT 1 AS n, CAST('1' AS VARCHAR(50)) AS Sequence
    UNION ALL
    SELECT n + 1, Sequence + CAST(n + 1 AS VARCHAR(10))
    FROM Numbers
    WHERE n < 5
)
SELECT * FROM Numbers;


SELECT e.EmployeeID, e.FirstName, e.LastName, t.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) AS t ON e.EmployeeID = t.EmployeeID
ORDER BY t.TotalSales DESC;

WITH cte AS (
    SELECT 
        PawanName,
        LEFT(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name)-1) AS NamePart,
        RIGHT(Pawan_slug_name, CHARINDEX('-', REVERSE(Pawan_slug_name))-1) AS NumPart
    FROM RemoveDuplicateIntsFromNames
)
SELECT 
    PawanName,
    CASE 
        WHEN LEN(NumPart)=1 THEN NamePart
        ELSE NamePart + '-' + LEFT(NumPart,1)
    END AS CleanedName
FROM cte;



































































