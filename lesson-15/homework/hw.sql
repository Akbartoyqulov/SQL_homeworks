Level 1

select id,name,salary 
from employees
where salary =
(select min(salary) from employees)

select id,product_name , price
from products 
where price >(select avg(price) from products)

Level 2 

select name
from employees 
where department_id = (
select id 
from departments
where department_name  = 'sales')

select name , customer_id 
from customers 
where customer_id not in (
select  customer_id 
from orders)

Level 3

select id, product_name, price, category_id
from products
where price > ( select top 1 price from products )

SELECT 
    e.name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id
WHERE e.department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);

SELECT 
    name,
    salary,
    department_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) = (
        SELECT MAX(avg_salary)
        FROM (
            SELECT AVG(salary) AS avg_salary
            FROM employees
            GROUP BY department_id
        ) AS sub
    )
);

Level 4 

select top 1 id, name, salary, department_id
from employees e
where salary > ( select avg(salary) from employees where department_id = e.department_id)

SELECT 
    student_id,
    course_id,
    grade
FROM grades
WHERE grade = (
    SELECT MAX(grade)
    FROM grades AS g2
    WHERE g2.course_id = grades.course_id
);

Level 5 

SELECT top 1
    p1.id,
    p1.product_name,
    p1.price,
    p1.category_id
FROM products p1
WHERE 2 = (
    SELECT COUNT(DISTINCT p2.price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
      AND p2.price > p1.price
);

SELECT top 1
    name,
    salary,
    department_id
FROM employees e
WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    )
  AND salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE department_id = e.department_id
    );
























































