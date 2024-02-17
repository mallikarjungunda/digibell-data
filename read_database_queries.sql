-- select all employees
SELECT * FROM employee;

-- select specific columns of database table
SELECT employee_id, employee_name FROM employee;


-- Other Select Commands
SELECT NOW();

SELECT CONCAT('John',' ','Doe');

SELECT CONCAT('Jane',' ','Doe') AS 'Full name';

SELECT count(*) AS total_employee_count FROM employee ;


-- fetch data based on a condition - WHERE Clause and Operators
SELECT employee_id, employee_name, designation FROM employee WHERE department = 'IT';

SELECT employee_id, employee_name, designation, department FROM employee WHERE department = 'IT' OR department = 'Finance';

SELECT employee_id, employee_name, designation, department FROM employee WHERE department = 'IT' AND designation = 'Manager';

SELECT employee_id, employee_name, designation, department FROM employee WHERE department IN ('IT', 'Finance');

SELECT employee_id, employee_name, designation, department FROM employee WHERE department NOT IN ('IT', 'Finance');

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id > 4;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id < 8;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id >= 4;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id <= 8;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id != 5;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id <> 5;

SELECT employee_id, employee_name, designation, department FROM employee WHERE employee_id BETWEEN 4 AND 8;

SELECT employee_id, employee_name, designation, department FROM employee WHERE designation LIKE 'Ma%';

SELECT employee_id, employee_name, designation, department FROM employee WHERE designation IS NULL;



-- Sorting of records using ORDER BY Clause
SELECT * FROM employee ORDER BY department; -- default sorting ascending

SELECT * FROM employee ORDER BY department ASC;

SELECT * FROM employee ORDER BY department DESC;

SELECT * FROM employee ORDER BY department DESC, employee_name ASC;


-- Combining WHERE and ORDER BY Clauses
SELECT employee_id, employee_name, designation FROM employee WHERE department = 'IT' ORDER BY employee_id;

SELECT employee_id, employee_name, designation FROM employee WHERE department = 'IT' ORDER BY employee_id DESC;


-- MySQL DISTINCT clause
SELECT DISTINCT department FROM employee;

SELECT DISTINCT designation, department FROM employee ORDER BY department;

SELECT DISTINCT designation FROM employee ORDER BY department;


-- MySQL LIMIT clause
SELECT employee_id, employee_name, designation FROM employee ORDER BY designation ASC;
SELECT employee_id, employee_name, designation FROM employee ORDER BY designation ASC LIMIT 3;
SELECT employee_id, employee_name, designation FROM employee ORDER BY designation ASC LIMIT 3, 5;


