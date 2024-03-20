
-- insert record
INSERT INTO employee(employee_name, designation, department)
    VALUES('Trigger Test', 'Manager', 'IT');


-- Before Insert Trigger
DELIMITER $$
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.department IS NULL THEN
        SET NEW.department = 'Unassigned';
    END IF;
END$$
DELIMITER ;


-- After Insert Trigger
DELIMITER $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    IF SELECT count(address_id) FROM employee_address < 1
        INSERT INTO employee_address (employee_id, address_line, city, state, country)
        VALUES (NEW.employee_id, 'Default Address', 'Default City', 'Default State', 'Default Country');
END$$
DELIMITER ;


-- Before Update Trigger
DELIMITER $$
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.designation = 'Manager' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Managers cannot be updated.';
    END IF;
END$$
DELIMITER ;


-- After Update Trigger

DELIMITER $$
CREATE TRIGGER after_employee_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    UPDATE employee_reporting
    SET supervisor_id = NEW.employee_id
    WHERE supervisor_id = OLD.employee_id;
END$$
DELIMITER ;


-- Before Delete Trigger
DELIMITER $$
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM employee_reporting WHERE employee_id = OLD.employee_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employee with existing reporting relationships.';
    END IF;
END$$
DELIMITER ;


-- DELIMITER $$
CREATE TRIGGER after_employee_delete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
    DELETE FROM employee_address WHERE employee_id = OLD.employee_id;
END$$
DELIMITER ;



-- DROP Trigger
drop trigger IF EXISTS update_last_inserted;


-- Show Triggers
SHOW TRIGGERS;