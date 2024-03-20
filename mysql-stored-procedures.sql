
-- GET All Employees

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * 
    FROM employee;
END //

DELIMITER ;


-- Call Procedure
CALL GetAllEmployees();

-- Drop the existing stored procedure if it exists
DROP PROCEDURE IF EXISTS GetAllEmployees;



-- Parameterized Stored Procedures
DELIMITER //

CREATE PROCEDURE GetEmployeeDetails(IN empId INT)
BEGIN
    SELECT e.employee_id, e.employee_name, e.designation, e.department,
           a.address_line, a.city, a.state, a.country
    FROM employee e
    JOIN employee_address a ON e.employee_id = a.employee_id
    WHERE e.employee_id = empId;
END //

DELIMITER ;



-- Call Procedure
CALL GetEmployeeDetails(1);



-- Stored Procedure to Update Employee Salary
DELIMITER //
CREATE PROCEDURE UpdateEmployee (
    IN emp_id INT,
    IN new_emp_name VARCHAR(50),
    IN new_emp_designation VARCHAR(50),
    IN new_emp_department VARCHAR(50)
)
BEGIN
    UPDATE employee
    SET employee_name = new_emp_name,
        designation = new_emp_designation,
        department = new_emp_department
    WHERE employee_id = emp_id;
END //
DELIMITER ;


CALL UpdateEmployee(2, "name SP", "Manager", "IT");

-- OUT Parameter
DELIMITER $$

CREATE PROCEDURE GetEmployeeCountByDepartment (
	IN  dept VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(*)
	INTO total
	FROM employee
	WHERE department = dept;
END$$

DELIMITER ;


CALL GetEmployeeCountByDepartment('IT', @total);

-- Print the value of total
SELECT @total AS total_employee_count;

-- Complex Use Cases

-- Inserting an Employee
DELIMITER //
CREATE PROCEDURE InsertEmployee(
    IN emp_name VARCHAR(50),
    IN emp_designation VARCHAR(50),
    IN emp_department VARCHAR(50),
    IN addr_line VARCHAR(100),
    IN city VARCHAR(50),
    IN state VARCHAR(50),
    IN country VARCHAR(50),
    IN skill_id INT
)
BEGIN
    DECLARE emp_id INT;
    
    INSERT INTO employee(employee_name, designation, department)
    VALUES(emp_name, emp_designation, emp_department);
    
    SET emp_id = LAST_INSERT_ID();
    
    INSERT INTO employee_address(employee_id, address_line, city, state, country)
    VALUES(emp_id, addr_line, city, state, country);
    
    INSERT INTO employee_skillset(employee_id, skill_id)
    VALUES(emp_id, skill_id);
END //
DELIMITER ;

-- Call procedure
CALL InsertEmployee('Proc Name', 'Manager', 'IT', '156 Vesey Rd', 'Manhatton', 'New York', 'USA', 1);

-- Updating Employee Details:
DELIMITER //
CREATE PROCEDURE UpdateEmployee(
    IN emp_id INT,
    IN emp_name VARCHAR(50),
    IN emp_designation VARCHAR(50),
    IN emp_department VARCHAR(50),
    IN addr_line VARCHAR(100),
    IN city VARCHAR(50),
    IN state VARCHAR(50),
    IN country VARCHAR(50)
)
BEGIN
    UPDATE employee
    SET employee_name = emp_name,
        designation = emp_designation,
        department = emp_department
    WHERE employee_id = emp_id;
    
    UPDATE employee_address
    SET address_line = addr_line,
        city = city,
        state = state,
        country = country
    WHERE employee_id = emp_id;
END //
DELIMITER ;

-- Call procedure
CALL UpdateEmployee(10, 'Update Proc Name', 'Manager', 'IT', '156 Vesey Rd', 'Manhatton', 'New York', 'USA');


-- Retrieving Employee Information:
DELIMITER //
CREATE PROCEDURE GetEmployeeInfo(
    IN emp_id INT
)
BEGIN
    SELECT e.*, GROUP_CONCAT(ea.address_line, ea.city, ea.state, ea.country) as emp_addresses, GROUP_CONCAT(s.skill_name) AS skills
    FROM employee e
    INNER JOIN employee_address ea ON e.employee_id = ea.employee_id
    LEFT JOIN employee_skillset es ON e.employee_id = es.employee_id
    LEFT JOIN skillset s ON es.skill_id = s.skill_id
    WHERE e.employee_id = 10
    GROUP BY e.employee_id;
END //
DELIMITER ;

-- Call Procedure
CALL GetEmployeeInfo(10);

-- Deleting an Employee:
DELIMITER //
CREATE PROCEDURE DeleteEmployee(
    IN emp_id INT
)
BEGIN
    DELETE FROM employee_reporting WHERE employee_id = emp_id;
    DELETE FROM employee_skillset WHERE employee_id = emp_id;
    DELETE FROM employee_address WHERE employee_id = emp_id;
    DELETE FROM employee WHERE employee_id = emp_id;
END //
DELIMITER ;

-- Call Procedure
CALL DeleteEmployee(10);


-- Example of Conditional Operations:
-- Retrieve Employees by Designation
DELIMITER //
CREATE PROCEDURE GetEmployeesByDesignation(
    IN desig VARCHAR(50)
)
BEGIN
    SELECT * FROM employee WHERE designation = desig;
END //
DELIMITER ;

CALL GetEmployeesByDesignation('Manager');

-- Example of If-Else Conditions:
-- Check if Employee Exists and Insert/Update Address
DELIMITER //
CREATE PROCEDURE ManageEmployeeAddress(
    IN emp_id INT,
    IN addr_line VARCHAR(100),
    IN city VARCHAR(50),
    IN state VARCHAR(50),
    IN country VARCHAR(50)
)
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM employee WHERE employee_id = emp_id;
    IF emp_count > 0 THEN
        -- Employee exists, update address
        UPDATE employee_address SET address_line = addr_line, city = city, state = state, country = country WHERE employee_id = emp_id;
    ELSE
        -- Employee doesn't exist, insert new address
        INSERT INTO employee_address (employee_id, address_line, city, state, country) VALUES (emp_id, addr_line, city, state, country);
    END IF;
END //
DELIMITER ;

CALL ManageEmployeeAddress(10, '150 Church Rod', 'Jersey', 'New Jersey', 'USA')

-- Example of Transactions:
-- Transfer Employee to Different Department
DELIMITER //
CREATE PROCEDURE TransferEmployee(
    IN emp_id INT,
    IN new_department VARCHAR(50),
    IN new_supervisor_id INT
)
BEGIN
    START TRANSACTION;
    -- Update employee's department
    UPDATE employee SET department = new_department WHERE employee_id = emp_id;
    -- Update employee's supervisor
    UPDATE employee_reporting SET supervisor_id = new_supervisor_id WHERE employee_id = emp_id;
    COMMIT;
END //
DELIMITER ;

CALL TransferEmployee(10, 'Engineering', '1');
