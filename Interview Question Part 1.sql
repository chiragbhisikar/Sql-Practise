CREATE DATABASE ORG;
USE ORG;
SHOW TABLES;

CREATE TABLE Worker (
    Worker_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR (25),
    SALARY INT (15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR (25)
);

INSERT INTO Worker (Worker_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00','Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

SELECT * FROM Worker;

CREATE TABLE Bonus(
    Worker_ID INT,
    BONUS_AMOUNT INT (10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (Worker_ID) REFERENCES Worker(Worker_ID) ON DELETE CASCADE
);

INSERT INTO Bonus(Worker_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

SELECT * FROM Bonus;

CREATE TABLE Title (
    Worker_ID INT,
    Worker_TITLE CHAR (25),
    AFFECTED_FROM DATETIME, 
    FOREIGN KEY (Worker_ID) REFERENCES Worker(Worker_ID) ON DELETE CASCADE
);

INSERT INTO Title (Worker_ID, Worker_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'ASst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

SELECT * FROM Title;

# Q-1. Write an SQL query to fetch “FIRST_NAME” FROM Worker table using the aliAS name AS <Worker_NAME>.
SELECT FIRST_NAME AS Worker_NAME FROM Worker;

# Q-2. Write an SQL query to fetch “FIRST_NAME” FROM Worker table in upper cASe.
SELECT UPPER(FIRST_NAME) FROM Worker;

# Q-3. Write an SQL query to fetch unique values of DEPARTMENT FROM Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;

# Q-4. Write an SQL query to print the first three characters of  FIRST_NAME FROM Worker table.
SELECT substring(FIRST_NAME, 1, 3) FROM Worker;

# Q-5. Write an SQL query to find the position of the alphabet ("b") in the first name column "mitabh"FROM Worker table.
SELECT INSTR(FIRST_NAME, 'B') FROM Worker where FIRST_NAME = 'Amitabh';

# Q-6. Write an SQL query to print the FIRST_NAME FROM Worker table after removing white spaces FROM the right side.
SELECT RTRIM(FIRST_NAME) FROM Worker;

# Q-7. Write an SQL query to print the DEPARTMENT FROM Worker table after removing white spaces FROM the left side.
SELECT LTRIM(FIRST_NAME) FROM Worker;

# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT FROM Worker table and prints its length.
SELECT DISTINCT department, LENGTH(department) FROM Worker;

# Q-9. Write an SQL query to print the FIRST_NAME FROM Worker table after replacing "a" with ""
SELECT REPLACE(FIRST_NAME, 'a', 'A')  FROM Worker;

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME FROM Worker table into a single column COMPLETE_NAME.
# A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', lASt_name) AS COMPLETE_NAME FROM Worker;

# Q-11. Write an SQL query to print all Worker details FROM the Worker table ORDER BY FIRST_NAME AScending.
SELECT * FROM Worker ORDER BY FIRST_NAME;

# Q-12. Write an SQL query to print all Worker details FROM the Worker table ORDER BY 
# FIRST_NAME AScending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, department DESC;

# Q-13. Write an SQL query to print details for Workers with the first name AS “Vipul” and “Satish” FROM Worker table.
SELECT * FROM Worker where FIRST_NAME IN ('Vipul', 'Satish');

# Q-14. Write an SQL query to print details of Workers excluding first names, “Vipul” and “Satish” FROM Worker table.
SELECT * FROM Worker where FIRST_NAME NOT IN ('Vipul', 'Satish');

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains "a"
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with "a".
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with "h" and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%h' AND LENGTH(FIRST_NAME) = 6;
# OR
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE Salary BETWEEN 100000 AND 500000;

# Q-20. Write an SQL query to print details of the Workers who have joined in Feb"2014.
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 2;

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(Worker_ID) FROM Worker WHERE Department = 'Admin';

# Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME FROM Worker WHERE Salary BETWEEN 50000 AND 100000;
# OR 
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME FROM Worker WHERE Salary >= 50000 AND Salary <= 100000;

# Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT COUNT(Worker_ID), Department FROM Worker GROUP BY Department ORDER BY COUNT(Worker_ID) DESC;

# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT W.* FROM Worker AS W INNER JOIN TITLE as T ON W.Worker_ID = T.Worker_ID WHERE T.Worker_TITLE = 'Manager';

# Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT WORKER_TITLE, COUNT(*) AS COUNT FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(*) > 1;

# Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD(WORKER_ID, 2) != 0;

# Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker WHERE MOD(WORKER_ID, 2) = 0;

# Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_Clone LIKE Worker;
DESC Worker_Clone;
            # Coping Data
INSERT INTO Worker_Clone SELECT * FROM Worker;
SELECT * FROM Worker_Clone;

# Q-29. Write an SQL query to fetch intersecting records of two tables. --> Intersection
SELECT Worker.* FROM Worker INNER JOIN Worker_Clone USING(Worker_id);

# Q-30. Write an SQL query to show records from one table that another table does not have. --> Minus
SELECT * FROM Worker LEFT JOIN Worker_Clone USING(Worker_id) WHERE Worker_Clone.Worker_id IS NULL;

# Q-31. Write an SQL query to show the current date and time.
SELECT CURRENT_DATE();
SELECT NOW();

# Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
USE ORG;
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 5;

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 4, 1; # 4 chhod kar 1 row dede n - 1, 1 --> n = 5

# Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT * FROM Worker AS W1 WHERE 5 = (
    SELECT COUNT(W2.Salary) FROM Worker AS W2 WHERE W1.Salary <= W2.Salary
);

# Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM Worker AS W1, Worker AS W2 WHERE W1.Salary = W2.Salary AND W1.WORKER_ID != W2.WORKER_ID;  

# Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(Salary) FROM Worker WHERE Salary NOT IN(
    SELECT MAX(Salary) FROM Worker
);
# OR
SELECT DISTINCT Salary FROM Worker ORDER BY Salary DESC LIMIT 1, 1;

# Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker UNION ALL SELECT * FROM Worker ORDER BY WORKER_ID;

# Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT * FROM Worker AS W WHERE W.WORKER_ID NOT IN (SELECT WORKER_ID FROM BONUS AS B);

# Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE WORKER_ID <= (SELECT COUNT(*) / 2 FROM Worker);

# Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT Department, COUNT(*) FROM WORKER GROUP BY Department HAVING COUNT(*) < 4;

# Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT Department, COUNT(*) FROM WORKER GROUP BY Department;

# Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 1;
# OR
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker);

# Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker ORDER BY WORKER_ID ASC LIMIT 1;
# OR
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker);

# Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT MAX(Salary) AS MAX_SALARY, Department FROM Worker GROUP BY Department;
# OR
select w.department, w.first_name, w.salary from
(select max(salary) as maxsal, department from worker group by department) temp
inner join worker w on temp.department = w.department and temp.maxsal = w.salary;

# Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT DISTINCT Salary from Worker w1
WHERE 3 >= (SELECT count(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) ORDER BY w1.salary DESC;
# DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.
SELECT distinct salary from worker order by salary desc limit 3;

# Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT w.department, w.first_name, w.salary FROM
(SELECT MIN(salary) as minsal, department FROM worker GROUP BY department) temp
INNER JOIN worker w on temp.department = w.department AND temp.minsal = w.salary;
# OR
SELECT DISTINCT salary FROM Worker ORDER BY salary DESC LIMIT 3;

# Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT Salary from Worker w1
WHERE n >= (SELECT count(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) ORDER BY w1.salary DESC;

# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT SUM(Salary) AS DepartmentTotalSalary,Department FROM Worker GROUP BY Department ORDER BY DepartmentTotalSalary;

# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, salary from worker where salary = (select max(Salary) from worker);