-- Create function two add simple numbers
DELIMITER //

CREATE FUNCTION add_numbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT;
    SET result = a + b;
    RETURN result;
END //

DELIMITER ;

-- Call function 
SELECT add_numbers(10, 20) AS sum;



-- Function to full address of an Employee:
DELIMITER //

CREATE FUNCTION get_employee_address(emp_id INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE address VARCHAR(255);
    
    SELECT CONCAT(address_line, ", ", city, ", ", state, ", ", country) INTO address 
    FROM employee_address 
    WHERE employee_id = emp_id;
   
    RETURN address;
END //

DELIMITER ;


-- Call get_employee_address user defined function
SELECT get_employee_address(1) AS address;


-- READ Function content
SHOW CREATE FUNCTION get_employee_address;


-- Drop Function
DROP FUNCTION IF EXISTS add_numbers;
