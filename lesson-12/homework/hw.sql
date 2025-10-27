Combine Two Tables

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personI

Employees Earning More Than Their Managers

SELECT 
    e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;

Duplicate Emails

SELECT 
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1

Delete Duplicate Emails


DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

Find Parents Who Have Only Girls

SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (
    SELECT DISTINCT b.ParentName
    FROM boys b
);

Total Over 50 and Least Weight

SELECT 
    custid,
    SUM(freight) AS TotalSalesOver50,
    MIN(freight) AS LeastWeight
FROM Sales.Orders
WHERE freight > 50
GROUP BY custid;

Carts

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
ON c1.Item = c2.Item;

Customers Who Never Order


SELECT 
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

Students and Examinations
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON s.student_id = e.student_id 
AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
