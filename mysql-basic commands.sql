-- show list of databases in MQSQL root user
SHOW DATABASES;

-- Show existing users:
SELECT user, host FROM mysql.user;

-- create a database for your application
CREATE DATABASE digibelldb;

-- Create a new user:
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'AppUser12$';


-- grant all privilages to dbuser
GRANT ALL PRIVILEGES ON digibelldb.* TO 'appuser'@'localhost';


-- Reload privileges (after making changes)
FLUSH PRIVILEGES;


-- show list of databases in MQSQL root user
SHOW DATABASES;

-- Show existing users:
SELECT user, host FROM mysql.user;

-- Change a user's password:
ALTER USER 'appuser'@'localhost' IDENTIFIED BY 'AppUser123$';


-- Delete a user:
DROP USER 'appuser'@'localhost';


-- Use a specific database
USE digibelldb;


-- Delete a database:
DROP DATABASE digibelldb;





