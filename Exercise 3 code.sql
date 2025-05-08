-- SQL Joins

--1.Retrieve all employees and their assigned projects using an INNER JOIN.
SELECT *
FROM Employees3 AS e
INNER JOIN Projects AS p 
ON e.EmployeeID = p.EmployeeID;

--2.Retrieve all employees and their assigned projects, including employees who have no projects using a LEFT JOIN.
SELECT *
FROM Employees3 AS e
LEFT JOIN Projects AS p 
ON e.EmployeeID = p.EmployeeID;

--3.Retrieve all projects and their assigned employees, including projects that have no employees using a RIGHT JOIN.
SELECT *
FROM Employees3 AS e
RIGHT JOIN Projects AS p 
ON e.EmployeeID = p.EmployeeID;

--4. Retrieve all employees and projects, including those without a match in either table using a FULL OUTER JOIN.
SELECT *
FROM Employees3 AS e
FULL OUTER JOIN Projects AS p 
ON e.EmployeeID = p.EmployeeID;

-- UNION & UNION ALL

--5. Retrieve a list of all unique cities where employees are located and project statuses.
SELECT City AS Location
FROM Employees3
UNION
SELECT Status AS Location
FROM Projects;

--6. Retrieve a list of all cities where employees are located and project statuses, allowing duplicates.
SELECT City AS Location
FROM Employees3
UNION ALL
SELECT Status AS Location
FROM Projects;

-- Filtering Statements

-- 7. Retrieve employees who earn more than 70,000.
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees3
WHERE Salary > 70000;

-- 8. Retrieve employees working in either IT or Finance departments.
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees3
WHERE Department IN ('IT', 'Finance');

-- 9. Retrieve projects that are not yet completed.
SELECT ProjectID, ProjectName, Budget, Status
FROM Projects
WHERE Status <> 'Completed';

-- 10. Retrieve projects that have a budget greater than 70,000 and are not completed.
SELECT ProjectID, ProjectName, Budget, Status
FROM Projects
WHERE Budget > 70000 AND Status <> 'Completed';

-- 11. Retrieve employees from New York OR Toronto, ordered by salary in descending order.
SELECT EmployeeID, FirstName, LastName, Department, Salary, City
FROM Employees3
WHERE City IN ('New York', 'Toronto')
ORDER BY Salary DESC;

-- 12. Retrieve the top 3 highest-paid employees.
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees3
ORDER BY Salary DESC
LIMIT 3;

-- Aggregate Functions with GROUP BY & HAVING

-- 13. Find the total salary per department, sorted in descending order.
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees3
GROUP BY Department
ORDER BY TotalSalary DESC;

-- 14. Find the average salary per city, but only include cities where the average salary is greater than 65,000.
SELECT City, AVG(Salary) AS AverageSalary
FROM Employees3
GROUP BY City
HAVING AVG(Salary) > 65000;

-- 15. Count the number of employees per department, including only departments with more than 1 employee.
SELECT Department, COUNT(EmployeeID) AS EmployeeCount
FROM Employees3
GROUP BY Department
HAVING COUNT(EmployeeID) > 1;

-- 16. Retrieve the number of projects per status, but only include statuses with at least 2 projects.
SELECT Status, COUNT(ProjectID) AS ProjectCount
FROM Projects
GROUP BY Status
HAVING COUNT(ProjectID) >= 2;

-- 17. Retrieve the total project budget per employee, but only for employees who are managing projects worth more than 150,000.
SELECT e.EmployeeID, e.FirstName, e.LastName,
       SUM(p.Budget) AS TotalProjectBudget
FROM Employees3 AS e
JOIN Projects AS p ON e.EmployeeID = p.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING SUM(p.Budget) > 150000;







