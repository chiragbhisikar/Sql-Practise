SHOW DATABASES;
CREATE DATABASE SQL_PRACTISE;
USE SQL_PRACTISE;
# SHOW TABLES;

# SET OPERATIONS

CREATE TABLE DEPARTMENT1(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);
CREATE TABLE DEPARTMENT2(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);

INSERT INTO DEPARTMENT1(id, name, role) VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');


INSERT INTO DEPARTMENT2(id, name, role) VALUES
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

# UNION

# List all the employee in the company --> UNION
SELECT * FROM DEPARTMENT1 
UNION
SELECT * FROM DEPARTMENT2;

# List all the employee who works for the both department --> INTERSECTION
SELECT DEPARTMENT1.* FROM DEPARTMENT1
INNER JOIN 
DEPARTMENT2 USING(id);

# List Out All The Employee Who Working On Department 1 But Not In Department 2 --> MINUS
SELECT DEPARTMENT1.* FROM DEPARTMENT1
LEFT JOIN 
DEPARTMENT2 USING(id) WHERE DEPARTMENT2.id IS NULL;
