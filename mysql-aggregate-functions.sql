-- Count the total number of employees

SELECT COUNT(*) AS total_employees FROM employee;

-- Calculate the average number of skills per employee:

SELECT AVG(skill_count) AS avg_skills_per_employee
FROM (
    SELECT COUNT(skill_id) AS skill_count
    FROM employee_skillset
    GROUP BY employee_id
) AS subquery;


-- Find the maximum number of skills possessed by an employee:

SELECT MAX(skill_count) AS max_skills
FROM (
    SELECT COUNT(skill_id) AS skill_count
    FROM employee_skillset
    GROUP BY employee_id
) AS subquery;


-- Calculate the total number of employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employee
GROUP BY department;


-- Find the employee with the most number of direct reports
SELECT employee_id, COUNT(report_id) AS num_reports
FROM employee_reporting
GROUP BY employee_id
ORDER BY num_reports DESC
LIMIT 1;


-- Count the number of employees per city
SELECT ea.city, COUNT(*) AS employee_count
FROM employee_address ea
JOIN employee e ON ea.employee_id = e.employee_id
GROUP BY ea.city;


-- Calculate the average number of reports per employee
SELECT AVG(report_count) AS avg_reports_per_employee
FROM (
    SELECT COUNT(report_id) AS report_count
    FROM employee_reporting
    GROUP BY employee_id
) AS subquery;


-- Calculate the total number of distinct skills across all employees
SELECT COUNT(DISTINCT skill_id) AS total_distinct_skills
FROM employee_skillset;




-- AVG(): Calculate the average salary of all employees.
SELECT AVG(salary) AS average_salary FROM employee;


-- BIT_AND(): Perform a bitwise AND operation on the employee IDs.

SELECT BIT_AND(employee_id) AS result FROM employee;

-- BIT_OR(): - Perform a bitwise OR operation on the employee IDs.
SELECT BIT_OR(employee_id) AS result FROM employee;


-- BIT_XOR(): Perform a bitwise XOR operation on the employee IDs.
SELECT BIT_XOR(employee_id) AS result FROM employee;

-- COUNT(): Count the total number of employees.
SELECT COUNT(*) AS total_employees FROM employee;

-- COUNT(DISTINCT): Count the number of unique designations.
SELECT COUNT(DISTINCT designation) AS unique_designations FROM employee;


-- COUNT(IF): Count the number of employees with a salary greater than 50000.
SELECT COUNT(IF(salary > 50000, 1, NULL)) AS high_salary_employees FROM employee;


-- GROUP_CONCAT(): Concatenate all employee names into a single string.
SELECT GROUP_CONCAT(employee_name) AS all_employee_names FROM employee;


-- JSON_ARRAYAGG(): Return a JSON array of all employee names.
SELECT JSON_ARRAYAGG(employee_name) AS employee_names_array FROM employee;


-- JSON_OBJECTAGG(): Return a JSON object with employee IDs as keys and their corresponding names as values.
SELECT JSON_OBJECTAGG(employee_id, employee_name) AS employee_id_name_mapping FROM employee;

-- MAX(): Find the highest salary among employees.
SELECT MAX(salary) AS highest_salary FROM employee;

-- MIN(): Find the lowest salary among employees.
SELECT MIN(salary) AS lowest_salary FROM employee;

-- STDEV(): Calculate the standard deviation of salaries.
SELECT STDEV(salary) AS salary_standard_deviation FROM employee;

-- STDDEV_POP(): Calculate the population standard deviation of salaries.
SELECT STDDEV_POP(salary) AS population_standard_deviation FROM employee;

-- STDDEV_SAMP(): Calculate the sample standard deviation of salaries.
SELECT STDDEV_SAMP(salary) AS sample_standard_deviation FROM employee;

-- SUM(): Calculate the total salary expenditure.
SELECT SUM(salary) AS total_salary_expenditure FROM employee;

-- SUM(IF): Calculate the total salary expenditure for employees in the Sales department.
SELECT SUM(IF(department = 'Sales', salary, 0)) AS sales_department_salary FROM employee;

-- VAR_POP(): Calculate the population variance of salaries.
SELECT VAR_POP(salary) AS population_variance FROM employee;


-- VAR_SAMP(): Calculate the sample variance of salaries.
SELECT VAR_SAMP(salary) AS sample_variance FROM employee;

-- VARIANCE(): Calculate the population standard variance of salaries.
SELECT VARIANCE(salary) AS population_standard_variance FROM employee;
