create database digibelldb;

show databases;

-- CREATE Operation
create table digibelldb.user (id int NOT NULL, name varchar(150), password varchar(25), PRIMARY KEY (id));

-- CREATE Operation
insert into digibelldb.user (id, name, password) values (2, "digiBell1", "password123");

-- READ Operation
select * from digibelldb.user;

SET SQL_SAFE_UPDATES = 0;

-- UPDATE Operation
UPDATE digibelldb.user SET name='digibell2', password="newpassword" WHERE id=1;

-- DELETE Operation
DELETE FROM digibelldb.user WHERE id=1;

ALTER TABLE digibelldb.user
ADD PRIMARY KEY (id);

