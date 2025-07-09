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
(2, 'Yagya', 'Narayan', 144, 'yagya@gmail.com', 222, 'Palam'), 
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

# CREATING VIEW 
CREATE VIEW custom_employee AS SELECT fname, lname, age FROM EMPLOYEE;

SELECT * FROM custom_employee;

# ALTER VIEW 
ALTER VIEW custom_employee AS SELECT CONCAT(fname,CONCAT(' ',lname)) AS full_name, age FROM EMPLOYEE;


# DROP VIEW
DROP VIEW IF EXISTS custom_employee;


