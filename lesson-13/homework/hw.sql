Easy-level tasks

  SELECT CONCAT(employee_id, '-', first_name, ' ', last_name) AS "Employee Info"
FROM employees
WHERE employee_id = 100;

UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999');

SELECT 
    first_name AS "First Name",
    LEN(first_name) AS "Name Length"
FROM employees
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'J%' 
   OR first_name LIKE 'M%'
ORDER BY first_name;

SELECT 
    manager_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY manager_id;

SELECT 
    year1,
    GREATEST(Max1, Max2, Max3) AS highest_value
FROM TestMax;

SELECT *
FROM cinema
WHERE description <> 'boring';

SELECT *
FROM SingleOrder
where id = 0 
order by id

SELECT 
    COALESCE(id, ssn, passportid, itin) AS first_non_null_value
FROM person;

Medium -level tasks 

SELECT 
    SUBSTRING(FullName, ' ', 1) AS FirstName,
    SUBSTRING(SUBSTRING(FullName, ' ', 2), ' ', -1) AS MiddleName,
    SUBSTRING(FullName, ' ', -1) AS LastName
FROM Students;

SELECT *
FROM Orders
WHERE DeliveryState = 'Tx'
  AND customerid IN (
        SELECT DISTINCT customerid
        FROM Orders
        WHERE deliverystate = 'Ca'
    );
SELECT 
   SequenceNumber ,
CONCAT(string 'select'', ') AS CombinedValues
order by string
FROM DMLTable
GROUP BY SequenceNumber ;

SELECT *
FROM employees
WHERE LEN(CONCAT(first_name, last_name)) 
     - LEN(REPLACE(LOWER(CONCAT(first_name, last_name)), 'a', '')) >= 3;

SELECT 
    department_id,
    COUNT(*) AS total_employees,
    ROUND(
        100.0 * SUM(CASE 
                        WHEN DATEDIFF(CURDATE(), hire_date) > 365 * 3 
                        THEN 1 ELSE 0 
                    END) / COUNT(*), 
        2
    ) AS percent_over_3_years
FROM employees
GROUP BY department_id;


Hard-level tasks 

SELECT 
   studentid,
    grade,
    SUM(grade) OVER (ORDER BY studentid) AS running_total
FROM Students;

SELECT 
    s1.studentname,
    s1.birthday
FROM Student s1
JOIN (
    SELECT birthday
    FROM Student
    GROUP BY birthday
    HAVING COUNT(*) > 1
) s2 ON s1.birthday = s2.birthday
ORDER BY s1.birthday;


SELECT 
    LEAST(PlayerA, PlayerB) AS Player1,
    GREATEST(PlayerA, PlayerB) AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY 
    LEAST(PlayerA, PlayerB),
    GREATEST(PlayerA, PlayerB);











































