
-- insert operations
INSERT INTO employee (employee_name, designation, department) 
VALUES ('test test', 'Manager', 'IT');

select * from employee;


-- insert multiple rows
INSERT INTO employee (employee_name, designation, department) 
VALUES 
    ('Robert John', 'Manager', 'IT'),
    ('Peter Robert', 'Analyst', 'IT'),
    ('Peter Robert 2', 'Analyst', 'IT');
    
    
CREATE TABLE it_employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);
    
    SELECT employee_name, designation, department 
    FROM employee 
    WHERE department="IT";
    
INSERT INTO it_employees (employee_name, designation, department) 
 (SELECT employee_name, designation, department FROM employee WHERE department="IT");
    
    

-- INSERT IGNORE statement
-- The INSERT IGNORE statement allows you to disregard rows containing invalid data that would otherwise trigger 
-- an error and insert only rows that contain valid data.

CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO subscribers(email)
VALUES('test@email.com');

INSERT INTO subscribers(email)
VALUES('test@email.com'), 
      ('test2@email.com');

INSERT IGNORE INTO subscribers(email)
VALUES('test@email.com'), 
      ('test@email.com');


-- INSERT IGNORE and STRICT mode

INSERT INTO subscribers(email) VALUES('aasdfaksfjaskfaskjfaas@email.com');

INSERT IGNORE INTO subscribers(email) VALUES('aasdfaksfjaskfaskjfaas@email.com');

-- Use the MySQL INSERT IGNORE statement to insert rows into a table and ignore errors for rows that cause errors.



-- INSERT ON DUPLICATE KEY UPDATE Statement

INSERT INTO employee (employee_id, employee_name, designation, department) 
VALUES (10, 'Peter John', 'Manager', 'IT');
ON DUPLICATE KEY UPDATE
employee_name="Peter John Updated";

-- Use the ON DUPLICATE KEY UPDATE option of the INSERT statement to insert data into a table 
-- and update existing data if a duplicate error occurs.






    
-- Update query operations
-- The UPDATE statement updates data in a table. It allows you to change the values in one or more columns of a single row or multiple rows.
-- Update query operations

SELECT * FROM employee_address;

UPDATE employee_address SET state='NY' WHERE address_id=10;

UPDATE employee_address SET state='DE', address_line='776 Orange st' WHERE address_id=10;

UPDATE employee_address SET country='USA' WHERE country IS NULL;

select * from employee_address where country IS NULL;

UPDATE employee_address SET country='USA' WHERE country='NULL';

SET SQL_SAFE_UPDATES = 0;


UPDATE employee_address SET state='NY' WHERE employee_id=10;

UPDATE employee_address SET state='NJ';




-- DELETE Operations

select * from subscribers;

INSERT IGNORE INTO subscribers(email)
VALUES('test@email.com'), 
      ('test1@email.com'),
      ('test2@email.com'),
      ('test3@email.com'),
      ('test4@email.com'),
      ('test5@email.com'),
      ('test6@email.com'),
      ('test7@email.com');
      
      
DELETE FROM subscribers where id=1;

select * from subscribers where id in (2,3);

DELETE FROM subscribers where id in (2, 3);

DELETE FROM subscribers ORDER BY id DESC LIMIT 3;

select * from subscribers ORDER BY id DESC;

DELETE FROM subscribers;


-- Aliases
-- Aliases
select * from Employee;


select employee_id empId, employee_name empName, designation design, department dept from Employee;

select employee_id empId, employee_name empName, designation design, department dept from Employee AS emp;

select * from employee_address;

select concat(address_line, city, state, country) address from employee_address;