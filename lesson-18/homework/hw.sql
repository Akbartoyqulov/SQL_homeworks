
SELECT 
    r.Region,
    d.Distributor,
    COALESCE(rs.Sales, 0) AS Sales
FROM 
    (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN 
    (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN 
    #RegionSales rs
    ON r.Region = rs.Region AND d.Distributor = rs.Distributor
ORDER BY 
    r.Region,
    d.Distributor;
SELECT 
    m.name AS ManagerName,
    COUNT(e.id) AS DirectReports
FROM 
    Employee e
JOIN 
    Employee m ON e.managerId = m.id
GROUP BY 
    m.name
HAVING 
    COUNT(e.id) >= 5;

SELECT 
    p.product_name,
    SUM(o.unit) AS total_units
FROM 
    Products p
JOIN 
    Orders o ON p.product_id = o.product_id
WHERE 
    o.order_date >= '2020-02-01' 
    AND o.order_date < '2020-03-01'
GROUP BY 
    p.product_name
HAVING 
    SUM(o.unit) >= 100;

WITH VendorOrderCounts AS (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rn
    FROM Orders
    GROUP BY CustomerID, Vendor
)
SELECT 
    CustomerID,
    Vendor,
    OrderCount
FROM 
    VendorOrderCounts
WHERE 
    rn = 1;

DECLARE @Check_Prime INT = 91;  -- Example input
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;       -- Assume prime unless proven otherwise

-- Handle numbers less than 2 (not prime)
IF @Check_Prime < 2
BEGIN
    SET @IsPrime = 0;
END
ELSE
BEGIN
    WHILE @i * @i <= @Check_Prime
    BEGIN
        IF @Check_Prime % @i = 0
        BEGIN
            SET @IsPrime = 0;
            BREAK;  -- Not prime, exit loop early
        END
        SET @i = @i + 1;
    END
END

-- Output the result
IF @IsPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';

WITH LocationCounts AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS SignalCount
    FROM Device
    GROUP BY Device_id, Locations
),
Ranked AS (
    SELECT 
        Device_id,
        Locations,
        SignalCount,
        ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY SignalCount DESC) AS rn
    FROM LocationCounts
)
SELECT 
    d.Device_id,
    COUNT(DISTINCT d.Locations) AS Num_Locations,
    r.Locations AS Most_Signals_Location,
    SUM(d.SignalCount) AS Total_Signals
FROM LocationCounts d
JOIN Ranked r 
    ON d.Device_id = r.Device_id AND r.rn = 1
GROUP BY d.Device_id, r.Locations;

SELECT 
    e.EmpID,
    e.EmpName,
    e.Salary
FROM 
    Employee e
WHERE 
    e.Salary > (
        SELECT AVG(e2.Salary)
        FROM Employee e2
        WHERE e2.DeptID = e.DeptID
    );



WITH MatchCount AS (
    SELECT 
        t.TicketID,
        COUNT(w.Number) AS MatchingNumbers
    FROM Tickets t
    LEFT JOIN WinningNumbers w
        ON t.Number = w.Number
    GROUP BY t.TicketID
)
SELECT 
    SUM(
        CASE 
            WHEN MatchingNumbers = 3 THEN 100
            WHEN MatchingNumbers BETWEEN 1 AND 2 THEN 10
            ELSE 0
        END
    ) AS TotalWinnings
FROM MatchCount;

WITH c AS (
  SELECT Spend_date, User_id,
    SUM(CASE WHEN Platform='Mobile' THEN Amount ELSE 0 END) m,
    SUM(CASE WHEN Platform='Desktop' THEN Amount ELSE 0 END) d
  FROM Spending
  GROUP BY Spend_date, User_id
)
SELECT Spend_date,
  SUM(CASE WHEN m>0 AND d=0 THEN 1 ELSE 0 END) AS Mobile_Only_Users,
  SUM(CASE WHEN m>0 AND d=0 THEN m ELSE 0 END) AS Mobile_Only_Amount,
  SUM(CASE WHEN d>0 AND m=0 THEN 1 ELSE 0 END) AS Desktop_Only_Users,
  SUM(CASE WHEN d>0 AND m=0 THEN d ELSE 0 END) AS Desktop_Only_Amount,
  SUM(CASE WHEN m>0 AND d>0 THEN 1 ELSE 0 END) AS Both_Users,
  SUM(CASE WHEN m>0 AND d>0 THEN m+d ELSE 0 END) AS Both_Amount
FROM c
GROUP BY Spend_date
ORDER BY Spend_date;

WITH Numbers AS (
  SELECT 1 AS n
  UNION ALL SELECT n + 1 FROM Numbers WHERE n < (SELECT MAX(Quantity) FROM Grouped)
)
SELECT 
  g.Product,
  1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
ORDER BY g.Product
OPTION (MAXRECURSION 0);












