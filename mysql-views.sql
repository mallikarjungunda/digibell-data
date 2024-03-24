-- Creating Basic Views

-- View of Employee Details
CREATE VIEW employee_details AS
SELECT emp.employee_id, emp.employee_name, emp.designation, emp.department, empadd.address_line, empadd.city, empadd.state, empadd.country
FROM employee emp
INNER JOIN employee_address empadd ON emp.employee_id = empadd.employee_id;


-- Red details from view
select * from employee_details;



-- Showing Existing Views
SHOW FULL TABLES IN digibelldb WHERE TABLE_TYPE LIKE 'VIEW';

-- Showing View Definitions
SHOW CREATE VIEW employee_details;

-- Renaming Views
CREATE VIEW employee_details_with_address AS
SELECT * FROM employee_details;



-- Dropping Views
DROP VIEW employee_details;



-- 2nd Session

-- Creating Updatable Views
-- In MySQL, views are not only queryable but also updatable. 
-- This implies that you can use the INSERT or UPDATE statement to add or modify rows of the base table through the updatable view.
-- To make a view updatable, ensure it meets certain criteria, such as having a single, non-nullable key.
CREATE VIEW updatable_employee_details AS
SELECT *
FROM employee
WHERE department = 'IT'
WITH CHECK OPTION;

select * from updatable_employee_details;

-- Update/alter views
ALTER VIEW updatable_employee_details AS
SELECT *
FROM employee
WHERE department = 'IT'
WITH CHECK OPTION;

select * from updatable_employee_details;
