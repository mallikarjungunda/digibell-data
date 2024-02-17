
-- INNER JOIN
 -- Returns only the rows where there is a match in both tables based on the specified condition.

-- join 2 tables
SELECT *
FROM employee
INNER JOIN employee_address ON employee.employee_id = employee_address.employee_id;

-- join 4 tables
SELECT *
FROM employee
INNER JOIN employee_address ON employee.employee_id = employee_address.employee_id
INNER JOIN employee_skillset ON employee.employee_id = employee_skillset.employee_id
INNER JOIN skillset ON employee_skillset.skill_id = skillset.skill_id;


-- join 4 tables and get selected rows
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, emp_address.address_line,
emp_address.city, emp_address.state, emp_address.country, skill.skill_name
FROM employee emp
INNER JOIN employee_address emp_address ON emp.employee_id = emp_address.employee_id
INNER JOIN employee_skillset emp_skillset ON emp.employee_id = emp_skillset.employee_id
INNER JOIN skillset skill ON emp_skillset.skill_id = skill.skill_id;





-- LEFT JOIN (or LEFT OUTER JOIN):
-- Returns all rows from the left table and the matched rows from the right table. If there is no match, NULL values are returned for columns from the right table.

SELECT *
FROM employee
LEFT JOIN employee_address ON employee.employee_id = employee_address.employee_id;

-- join 4 tables
SELECT *
FROM employee
LEFT JOIN employee_address ON employee.employee_id = employee_address.employee_id
LEFT JOIN employee_skillset ON employee.employee_id = employee_skillset.employee_id
LEFT JOIN skillset ON employee_skillset.skill_id = skillset.skill_id;


-- join 4 tables and get selected rows
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, emp_address.address_line,
emp_address.city, emp_address.state, emp_address.country, skill.skill_name
FROM employee emp
LEFT JOIN employee_address emp_address ON emp.employee_id = emp_address.employee_id
LEFT JOIN employee_skillset emp_skillset ON emp.employee_id = emp_skillset.employee_id
LEFT JOIN skillset skill ON emp_skillset.skill_id = skill.skill_id;



-- RIGHT JOIN (or RIGHT OUTER JOIN):
-- Returns all rows from the right table and the matched rows from the left table. If there is no match, NULL values are returned for columns from the left table.
SELECT *
FROM employee
RIGHT JOIN employee_address ON employee.employee_id = employee_address.employee_id;

-- join 4 tables
SELECT *
FROM employee
RIGHT JOIN employee_address ON employee.employee_id = employee_address.employee_id
RIGHT JOIN employee_skillset ON employee.employee_id = employee_skillset.employee_id
RIGHT JOIN skillset ON employee_skillset.skill_id = skillset.skill_id;


-- join 4 tables and get selected rows
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, emp_address.address_line,
emp_address.city, emp_address.state, emp_address.country, skill.skill_name
FROM employee emp
RIGHT JOIN employee_address emp_address ON emp.employee_id = emp_address.employee_id
RIGHT JOIN employee_skillset emp_skillset ON emp.employee_id = emp_skillset.employee_id
RIGHT JOIN skillset skill ON emp_skillset.skill_id = skill.skill_id;



-- FULL JOIN:
-- Returns all rows when there is a match in either the left or the right table. If there is no match, NULL values are returned for columns from the table without a match.

SELECT *
FROM employee
FULL OUTER JOIN employee_address ON employee.employee_id = employee_address.employee_id;


-- Full Outer Join (using Left Join and Union with Right Join)
-- MySQL doesn't support FULL OUTER JOIN directly. You can achieve a similar result using a combination of LEFT JOIN and UNION with a RIGHT JOIN. Here's the corrected query:
SELECT *
FROM employee
LEFT JOIN employee_address ON employee.employee_id = employee_address.employee_id

UNION

SELECT *
FROM employee
RIGHT JOIN employee_address ON employee.employee_id = employee_address.employee_id
WHERE employee.employee_id IS NULL;

-- 2
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, emp_address.address_line,
emp_address.city, emp_address.state, emp_address.country, skill.skill_name
FROM employee emp
LEFT JOIN employee_address emp_address ON emp.employee_id = emp_address.employee_id
LEFT JOIN employee_skillset emp_skillset ON emp.employee_id = emp_skillset.employee_id
LEFT JOIN skillset skill ON emp_skillset.skill_id = skill.skill_id

UNION

-- join 4 tables and get selected rows
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, emp_address.address_line,
emp_address.city, emp_address.state, emp_address.country, skill.skill_name
FROM employee emp
RIGHT JOIN employee_address emp_address ON emp.employee_id = emp_address.employee_id
RIGHT JOIN employee_skillset emp_skillset ON emp.employee_id = emp_skillset.employee_id
RIGHT JOIN skillset skill ON emp_skillset.skill_id = skill.skill_id;

-- Both FULL JOIN and FULL OUTER JOIN serve the same purpose, and you can use either one in your queries. The choice of syntax is often based on personal preference or coding standards.


-- CROSS JOIN:
-- Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.
SELECT *
FROM employee
CROSS JOIN employee_address;


-- SELF JOIN:
-- Occurs when a table is joined with itself, typically to compare rows within the same table.
-- Retrieves the reporting hierarchy using the employee_reporting table.

select emp.employee_name, emp2.employee_name from employee emp
JOIN employee emp2 on emp.employee_id = emp2.employee_id;

-- Employees Table
CREATE TABLE employees_data (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    supervisor_id INT
);

insert into employees_data (employee_id, employee_name, supervisor_id)
values
(1, 'John Doe', 2),
(2, 'John Smith', 3),
(3, 'John Bob', 2),
(4, 'Robert Peter', 2),
(5, 'Bob Johnson', 3),
(6, 'Bobby Dre', 3),
(7, 'Rocky Peter', 4),
(8, 'Brian Tracy', 5),
(9, 'Johny Walter', 6),
(10, 'Johnson Peter', 6);

SELECT e.employee_name AS employee, s.employee_name AS supervisor
FROM employees_data e
JOIN employees_data s ON e.supervisor_id = s.employee_id;


-- our data
SELECT e.employee_name AS employee_name, s.employee_name AS supervisor_name
FROM employee_reporting r
INNER JOIN employee e ON r.employee_id = e.employee_id
INNER JOIN employee s ON r.supervisor_id = s.employee_id;



