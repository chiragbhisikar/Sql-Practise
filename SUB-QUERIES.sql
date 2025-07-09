SHOW DATABASES;
CREATE DATABASE SQL_PRACTISE;
USE SQL_PRACTISE;
# DROP DATABASE IF EXISTS SQL_PRACTISE;

CREATE TABLE EMPLOYEE(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    email VARCHAR(50) NOT NULL UNIQUE,
    phoneno VARCHAR(15),
    city VARCHAR(15)
);

CREATE TABLE CLIENT(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    email VARCHAR(50) NOT NULL UNIQUE,
    phoneno VARCHAR(15),
    city VARCHAR(15),
    employee_id INT UNSIGNED,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(id)
    # FOREIGN KEY(customer_id) REFERENCES CUSTOMER(id) ON DELETE CASCADE
    # FOREIGN KEY(customer_id) REFERENCES CUSTOMER(id) ON DELETE SET NULL
);

CREATE TABLE PROJECT(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNSIGNED,
    name VARCHAR(15),
    start_date DATE,
    clientId INT UNSIGNED,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(id)
    # FOREIGN KEY(customer_id) REFERENCES CUSTOMER(id) ON DELETE CASCADE
    # FOREIGN KEY(customer_id) REFERENCES CUSTOMER(id) ON DELETE SET NULL
);


INSERT INTO EMPLOYEE(id, fname, lname, age, email, phoneno, city) VALUES
(1,'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'), 
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');
SELECT * FROM EMPLOYEE;

INSERT INTO CLIENT(id , fname, lname, age, email, phoneno, city, employee_id) VALUES
('1', 'Mac', 'Rogers', '47' , 'mac@hotmail.com', '333', 'Kolkata', '3'),
('2', 'Max', 'Poirier', '27' , 'max@gmail.com', '222', 'Kolkata', '3'),
('3', 'Peter', 'Jain', '24' , 'peter@abc.com', '111', 'Delhil', '1'),
('4', 'Sushant', 'Aggarwal', '23' , 'sushant@yahoo.com', '45454', 'Hyderabad', '5'),
('5', 'Pratap', 'Singh', '36' , 'p@xyz.com', '77767', 'Mumbai', '2');
SELECT * FROM CLIENT;

INSERT INTO PROJECT(id, employee_id, name, start_date, clientId) VALUES
('1', 1, 'A', '2021-04-21', 3),
('2', 2, 'B', '2021-03-12', 1),
('3', 3, 'C', '2021-01-16', 5),
('4', 3, 'D', '2021-04-27', 2),
('5', 5, 'E', '2021-05-01', 4);
SELECT * FROM PROJECT;

# SUB QUERIES -> WHERE CLAUSE SAME TABLE Employee age > 30
SELECT * FROM EMPLOYEE WHERE AGE IN (
    SELECT age FROM EMPLOYEE WHERE age > 30
);
SELECT age FROM EMPLOYEE WHERE age > 30;

# SUB QUERIES -> WHERE CLAUSE SAME DIFFERENT Employee DETAIL WHO WORKING MORE THAN ONE PROJECT
SELECT * FROM EMPLOYEE WHERE id IN (
    SELECT employee_id FROM PROJECT GROUP BY employee_id HAVING COUNT(employee_id) > 1
);
SELECT employee_id FROM PROJECT GROUP BY employee_id HAVING COUNT(employee_id) > 1;

# SINGLE VALUE SUB QUERY
# avg(age) < age
SELECT * FROM EMPLOYEE WHERE age > (
    SELECT AVG(age) FROM EMPLOYEE
);
SELECT AVG(age) FROM EMPLOYEE;

# FROM CLAUSE - DERIVED TABLE
# SELECT MAX(AGE) PERSON WHOSE FIRST NAME HAS 'a' 
SELECT MAX(age) FROM (
    SELECT age FROM EMPLOYEE WHERE fname LIKE '%a%'
) AS TEMP;
SELECT * FROM EMPLOYEE WHERE fname LIKE '%a%'; # - DERIVED TABLE

# CORELATED SUB QURIES 
# FIND 3rd Oldest Employee
SELECT * FROM EMPLOYEE AS e1 WHERE 3 = (
    SELECT COUNT(e2.age) FROM EMPLOYEE AS e2 WHERE e2.age >= e1.age
);

# (32, 44, 22, 21, 31) -> 32 = 2, 44 = 1, 22 = 4, 31 = 3, 21 = 5
# 32 ---> 32 >= 32, 44 >= 32
# 44 ---> 44 >= 44
# 22 ---> 32 >= 22, 44 >= 22,  22 >= 22, 31 >= 22
# 31 ---> 32 >= 31, 44 >= 31, 31 >= 31
# 21 ---> 32 >= 21, 44 >= 21,  22 >= 21, 21 >= 21, 31 >= 21

