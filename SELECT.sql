SHOW DATABASES;
CREATE DATABASE SQL_PRACTISE;
USE SQL_PRACTISE;
# DROP DATABASE IF EXISTS SQL_PRACTISE;

# SHOW TABLES;
# DROP TABLE BONUS;

CREATE TABLE WORKER(
    worker_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    salary INT(15),
    join_date DATETIME,
    department VARCHAR(50)
);

INSERT INTO WORKER (worker_id, first_name, last_name, date_of_birth, salary, join_date, department) VALUES
(001, 'Monika' , 'Arora', '2005-08-22' ,100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', '2004-09-11', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', '2003-09-18', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', '2005-04-22', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', '2005-08-10', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', '2004-01-22', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', '2002-08-01', 75000, '14-01-20 09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', '2000-01-03', 90000, '14-04-11 09.00.00','Admin');

SELECT * FROM WORKER;

CREATE TABLE TITLE(
    worker_ref_id INT UNSIGNED,
    worker_title VARCHAR(50),
    affected_from DATETIME,
    FOREIGN KEY (worker_ref_id) 
        REFERENCES WORKER(worker_id)
        ON DELETE CASCADE
);

INSERT INTO TITLE
(worker_ref_id, worker_title, affected_from) VALUES
(001,'Manager','2016-02-20 00:00:00'),
(002,'Executive','2016-06-11 00:00:00'),
(008,'Executive','2016-06-11 00:00:00'),
(005,'Manager',' 2016-06-11 00:00:00'),
(004,'Asst. Manager', '2016-06-11 00:00:00'),
(007,'Executive','2016-06-11 00:00:00'),
(006,'Lead','2016-06-11 00:00:00'),
(003,'Lead','2016-06-11 00:00:00');

# SELECT FROM TABLE 
SELECT * FROM WORKER;
SELECT CONCAT(CONCAT(first_name, " "), last_NAME) AS name, salary FROM WORKER;
SELECT *, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), date_of_birth)), '%Y') + 0  AS age FROM WORKER; # GET AGE OF ALL WORKERS

# SELECT WITHOUT USING ANY TABLE  
SELECT NOW() AS DATE;
SELECT UCASE('Chirag Is a Coder !');
SELECT LCASE('CHIRAG IS A CODER !');

# WHERE
SELECT * FROM WORKER WHERE salary > 80000;
SELECT * FROM WORKER WHERE department != 'HR';

# BETWEEN
SELECT * FROM WORKER WHERE salary BETWEEN 80000 AND 200000;

# OR
SELECT * FROM WORKER WHERE department = 'HR' OR department = 'Admin';

# IN BETTER WAY
SELECT * FROM WORKER WHERE department IN ('HR', 'Admin', 'Account');

# NOT
SELECT * FROM WORKER WHERE department NOT IN ('HR', 'Admin');

# IS NULL
INSERT INTO WORKER VALUE (015, 'Ritika' , 'Maheshwari', '2004-04-12' , 1000000, '14-02-20 09.00.00', NULL);
DELETE FROM WORKER WHERE worker_id = 15;
SELECT * FROM WORKER WHERE department IS NULL;

# WILDCARD
SELECT * FROM WORKER;
SELECT * FROM WORKER WHERE first_name LIKE '%ik%';
SELECT * FROM WORKER WHERE first_name LIKE '_i%';

# SORTING 
SELECT * FROM WORKER ORDER BY salary; # Default Acending
SELECT * FROM WORKER ORDER BY salary DESC; 

# DISTINCT
SELECT DISTINCT department FROM WORKER;

# GROUP BY
SELECT department, COUNT(department) FROM WORKER GROUP BY department;
SELECT department, AVG(salary) FROM WORKER GROUP BY department;
SELECT department, MIN(salary) FROM WORKER GROUP BY department;
SELECT department, MAX(salary) FROM WORKER GROUP BY department;
SELECT department, SUM(salary) FROM WORKER GROUP BY department;

