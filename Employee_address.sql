drop table if exists employee_reporting;
drop table if exists employee_skillset;
drop table if exists skillset;
drop table if exists employee_address;
drop table if exists employee;


-- Create Employee table
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- Create Employee_Address table
CREATE TABLE employee_address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    address_line VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

-- Create Skillset table
CREATE TABLE skillset (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL
);

-- Create Employee_Skillset table
CREATE TABLE employee_skillset (
    employee_id INT,
    skill_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (skill_id) REFERENCES skillset(skill_id),
    PRIMARY KEY (employee_id, skill_id)
);

-- Create Employee_Reporting table
CREATE TABLE employee_reporting (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    supervisor_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (supervisor_id) REFERENCES employee(employee_id)
);

-- Insert records into Employee table
INSERT INTO employee (employee_name, designation, department) 
VALUES 
    ('John Doe', 'Manager', 'IT'),
    ('Jane Smith', 'Developer', 'IT'),
    ('Alex Johnson', 'HR Manager', 'Human Resources'),
    ('Emily Brown', 'Designer', 'Creative'),
    ('Michael Wilson', 'Analyst', 'Finance'),
    ('Sarah Lee', 'Tester', 'IT'),
    ('David Garcia', 'Sales Manager', 'Sales'),
    ('Olivia Martinez', 'Marketing Specialist', 'Marketing'),
    ('James Miller', 'Engineer', 'Engineering'),
    ('Sophia Moore', 'Support Specialist', 'Customer Service');

-- Insert records into Employee_Address table
INSERT INTO employee_address (employee_id, address_line, city, state, country) 
VALUES 
    (1, '123 Main St', 'New York', 'NY', 'USA'),
    (2, '456 Elm St', 'San Francisco', 'CA', 'USA'),
    (3, '789 Oak St', 'Los Angeles', 'CA', 'USA'),
    (4, '101 Pine St', 'Chicago', 'IL', 'USA'),
    (5, '555 Maple St', 'Houston', 'TX', 'USA'),
    (6, '888 Cedar St', 'Boston', 'MA', 'USA'),
    (7, '222 Walnut St', 'Seattle', 'WA', 'USA'),
    (8, '333 Cherry St', 'Austin', 'TX', 'USA'),
    (9, '444 Pineapple St', 'Miami', 'FL', 'USA'),
    (10, '777 Orange St', 'Denver', 'CO', 'USA');

-- Insert records into Skillset table
INSERT INTO skillset (skill_name) 
VALUES 
    ('Java'),
    ('Python'),
    ('SQL'),
    ('HTML/CSS'),
    ('JavaScript'),
    ('Project Management'),
    ('Data Analysis'),
    ('Sales'),
    ('Marketing'),
    ('Customer Support');

-- Insert records into Employee_Skillset table
INSERT INTO employee_skillset (employee_id, skill_id) 
VALUES 
    (1, 6), (1, 7), (2, 2), (2, 5), (3, 6),
    (4, 4), (5, 3), (6, 1), (7, 8), (8, 9);

-- Insert records into Employee_Reporting table
INSERT INTO employee_reporting (employee_id, supervisor_id) 
VALUES 
    (2, 1), (3, 1), (4, 1), (5, 1),
    (6, 2), (7, 2), (8, 3), (9, 4),
    (10, 5);
