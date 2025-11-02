Easy tasks 

select id,
left(name,charindex(',',name)-1) as first_name,
substring(name,charindex(',',name)+1 ,len(name)) as lastname
from TestMultipleColumns

select strs , patindex( '%[%]%',strs) from TestPercent
where patindex( '%[%]%',strs)  > 1

SELECT 
    value AS Part
FROM Splitter
CROSS APPLY STRING_SPLIT(vals, '.');

SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

select 
texts,
len(texts) - len(replace(texts,' ','')) as countspace
from CountSpaces

SELECT 
    e.Employee_ID,
    e.EmployeeName,
    e.Salary,
    m.EmployeeName AS ManagerName,
    m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m ON e.Manager_ID = m.Employee_ID
WHERE e.Salary > m.Salary


SELECT 
    Employee_ID,
    First_Name,
    Last_Name,
    Hire_Date,
    DATEDIFF(YEAR, Hire_Date, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, Hire_Date, GETDATE()) BETWEEN 10 AND 15;

Medium tasks 

SELECT 
    w1.Id
FROM Weather w1
JOIN Weather w2 
    ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE w1.Temperature > w2.Temperature;

select 
player_id ,
min(event_date) as first_login 
from activity 
group by player_id

SELECT *
FROM fruits
order by fruit_list
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;


select 
employee_id ,
first_name,
last_name,
hire_date,
 datediff(year, hire_date, getdate()) as yearsofservice,
   case 
 when  datediff(year, hire_date, getdate()) < 1 then 'new hire'
 when  datediff(year, hire_date, getdate()) between 1 and 5 then 'junior'
 when datediff(year, hire_date, getdate()) between 5 and 10 then 'mid-level'
 when datediff(year, hire_date, getdate()) between 10 and 20 then 'senior'
 else 'veteran'
 end as employementstage
 from employees

SELECT 
    Vals,
    LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1) AS ExtractedInteger
FROM GetIntegers;


SELECT id,
    STUFF(vals, 1, 2, SUBSTRING(vals, 2, 1) + SUBSTRING(vals, 1, 1)) AS SwappedValue
FROM MultipleVals;

WITH Numbers AS (
    SELECT TOP (LEN('sdgfhsdgfhs@121313131')) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
)
SELECT 
    SUBSTRING('sdgfhsdgfhs@121313131', n, 1) AS CharacterValue
FROM Numbers;

SELECT 
    player_id,
    device_id,
	event_date
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT 
        player_id, 
        MIN(event_date)
    FROM Activity
    GROUP BY player_id
);

SELECT 
    'rtcfvty34redt' AS OriginalValue,
    LEFT('rtcfvty34redt', PATINDEX('%[0-9]%', 'rtcfvty34redt') - 1) AS Letters,
    SUBSTRING('rtcfvty34redt', PATINDEX('%[0-9]%', 'rtcfvty34redt'),
              LEN('rtcfvty34redt')) AS Numbers;









































































