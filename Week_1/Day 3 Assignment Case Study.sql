-- Create Dept table 
CREATE TABLE Dept ( 
Deptno NUMBER PRIMARY KEY, 
Dname VARCHAR2(50) NOT NULL, 
Loc VARCHAR2(50) NOT NULL );

-- Create Emps table 
CREATE TABLE Emps ( 
Empno NUMBER PRIMARY KEY, 
Ename VARCHAR2(50) NOT NULL, 
Job VARCHAR2(50), 
Sal NUMBER(10,2), 
Deptno NUMBER, 
CONSTRAINT fk_emps_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno) );

-- Insert sample departments using Oracle's INSERT ALL 
INSERT ALL INTO Dept (Deptno, Dname, Loc) 
VALUES (10, 'HR', 'New York') INTO Dept (Deptno, Dname, Loc) 
VALUES (20, 'SALES', 'Chicago') INTO Dept (Deptno, Dname, Loc) 
VALUES (30, 'ACCOUNTING', 'Chicago') INTO Dept (Deptno, Dname, Loc) 
VALUES (40, 'IT', 'San Francisco') INTO Dept (Deptno, Dname, Loc) 
VALUES (50, 'MARKETING', 'Boston') INTO Dept (Deptno, Dname, Loc) 
VALUES (60, 'RESEARCH', 'Austin') 
SELECT * FROM dual;

-- Insert sample employees using INSERT ALL 
INSERT ALL INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1001, 'Alice', 'Manager', 90000, 10) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1002, 'Bob', 'Salesman', 55000, 20) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1003, 'Carol', 'Clerk', 32000, 30) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1004, 'David', 'Salesman', 60000, 20) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1005, 'Eve', 'Analyst', 75000, 40) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1006, 'Frank', 'Clerk', 30000, 30) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1007, 'Grace', 'Salesman', 58000, 20) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1008, 'Heidi', 'Developer', 78000, 40) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1009, 'Ivan', 'Intern', 15000, NULL) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1010, 'Judy', 'Executive', 85000, 10) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1011, 'Ken', 'Analyst', 72000, 40) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1012, 'Leo', 'Assistant', 28000, 30) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1013, 'Mona', 'Salesman', 62000, 20) INTO Emps (Empno, Ename, Job, Sal, Deptno) 
VALUES (1014, 'Nina', 'Clerk', 31000, 30) 
SELECT * FROM dual;

-- 1. Display employee names along with their department names. 
SELECT e.Ename AS Employee, d.Dname AS Department 
FROM Emps e 
JOIN Dept d ON e.Deptno = d.Deptno;

-- 2. List all employees with their job titles and the location of their department. 
SELECT e.Ename, e.Job, d.Loc AS Department_Location 
FROM Emps e 
LEFT JOIN Dept d ON e.Deptno = d.Deptno;

-- 3. Display employees who work in the SALES department. 
SELECT e.* 
FROM Emps e 
JOIN Dept d ON e.Deptno = d.Deptno 
WHERE d.Dname = 'SALES';

-- 4. List all employees along with their department name and location, including departments that have no employees. 
SELECT d.Deptno, d.Dname, d.Loc, e.Empno, e.Ename, e.Job, e.Sal 
FROM Dept d 
LEFT JOIN Emps e ON e.Deptno = d.Deptno 
ORDER BY d.Deptno, e.Empno;

-- 5. Display all departments and employees, even if some employees are not assigned to any department. -- Oracle supports FULL OUTER JOIN, so we can use it directly 
SELECT d.Deptno, d.Dname, d.Loc, e.Empno, e.Ename 
FROM Dept d 
FULL OUTER JOIN Emps e ON d.Deptno = e.Deptno 
ORDER BY d.Deptno NULLS FIRST, e.Empno NULLS FIRST;

-- 6. Show each department name and total salary paid to its employees. 
SELECT d.Dname, NVL(SUM(e.Sal), 0) AS Total_Salary 
FROM Dept d 
LEFT JOIN Emps e ON d.Deptno = e.Deptno 
GROUP BY d.Dname 
ORDER BY d.Dname;

-- 7. Find departments that have more than 3 employees. Display dname and no. of employees. 
SELECT d.Dname, COUNT(e.Empno) AS Num_Employees 
FROM Dept d 
JOIN Emps e ON d.Deptno = e.Deptno 
GROUP BY d.Dname
HAVING COUNT(e.Empno) > 3;

-- 8. Display employees who work in the same location as the ACCOUNTING department. 
SELECT e.* 
FROM Emps e 
JOIN Dept d ON e.Deptno = d.Deptno 
WHERE d.Loc = (SELECT Loc FROM Dept WHERE Dname ='ACCOUNTING');

-- 9. For each department, display the employee who has the highest salary. 




-- 10. List employees whose salary is greater than the average salary of their department. 
SELECT e.Empno, e.Ename, e.Sal, d.Dname 
FROM Emps e 
JOIN Dept d ON e.Deptno = d.Deptno 
WHERE e.Sal > (SELECT AVG(e2.Sal) FROM Emps e2 WHERE e2.Deptno = e.Deptno);
