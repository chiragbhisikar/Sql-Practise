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

# INNER JOIN 
# ENLIST ALL EMPLOYEE WHICH PROJECT THEY ARE WORKING ON
SELECT e.*, p.* FROM EMPLOYEE AS e INNER JOIN PROJECT AS p ON e.id = p.employee_id;

select e.id, e.fname, e.lname, p.id, p.name from employee as e,
project as p WHERE e.id = p.employee_id;

# Fetch out all the employee Ip's and their contact detail who have been working
# from Jaipur with the clients name working in Hyderabad.
SELECT e.id, e.email, e.phoneno, c.fname, c.lname FROM Employee as e
INNER JOIN CLIENT AS c ON e.id = c.employee_id WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad' ;

# LEFT JOIN
# Fetch out each project allocated to each employee.
select * from Employee as e
LEFT JOIN PROJECT as p ON e.id = p.employee_id;

# RIGHT JOIN
# List out all the projects along with the employee's name and their respective allocated email ID. 
select p.id, p.name, e.fname, e.lname, e.email FROM Employee as e
RIGHT JOIN PROJECT as p ON e.id = p.employee_id;


# CROSS JOIN
# List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name from Employee as e
CROSS JOIN Project as p;
