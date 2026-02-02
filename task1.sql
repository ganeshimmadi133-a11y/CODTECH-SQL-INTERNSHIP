-- TASK 01: JOINS PRACTICE

SQL> -- Connecting as system administrator
SQL> CONNECT system;

-- 1. Create Tables
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR2(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR2(50),
    DeptID INT
);

-- 2. Insert Data
INSERT INTO Departments VALUES (10, 'Engineering');
INSERT INTO Departments VALUES (20, 'Sales');
INSERT INTO Departments VALUES (30, 'Marketing');

INSERT INTO Employees VALUES (1, 'Alice', 10);
INSERT INTO Employees VALUES (2, 'Bob', 20);
INSERT INTO Employees VALUES (3, 'Charlie', NULL);
COMMIT;

-- 3. Execute Joins
-- INNER JOIN: Only matches
SELECT 'INNER JOIN' as Type, E.Name, D.DeptName FROM Employees E INNER JOIN Departments D ON E.DeptID = D.DeptID;

-- LEFT JOIN: All employees
SELECT 'LEFT JOIN' as Type, E.Name, D.DeptName FROM Employees E LEFT JOIN Departments D ON E.DeptID = D.DeptID;

-- RIGHT JOIN: All departments
SELECT 'RIGHT JOIN' as Type, E.Name, D.DeptName FROM Employees E RIGHT JOIN Departments D ON E.DeptID = D.DeptID;

-- FULL JOIN: Everything
SELECT 'FULL JOIN' as Type, E.Name, D.DeptName FROM Employees E FULL OUTER JOIN Departments D ON E.DeptID = D.DeptID;