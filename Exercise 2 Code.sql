--1. COUNT() Function - Find the total number of employees in the company. 
SELECT COUNT(*) AS total_employees FROM employees;

--2. SUM() Function - Find the total salary paid to all employees in the IT department.
SELECT SUM(salary) AS total_it_salary 
FROM employees 
WHERE department = 'IT';

--3. AVG() Function - Calculate the average salary of employees in the HR department.
SELECT AVG(salary) AS avg_hr_salary 
FROM employees 
WHERE department = 'HR';

--4. MIN() and MAX() Functions - Find the highest and lowest salary in the company.
SELECT 
    MIN(salary) AS lowest_salary, 
    MAX(salary) AS highest_salary 
FROM employees;

--5. GROUP BY Statement - Group employees by department and display the total salary paid in each department.
SELECT department, SUM(salary) AS total_salary 
FROM employees 
GROUP BY department;

--6. GROUP BY and COUNT() - Count how many employees work in each city.
SELECT city, COUNT(*) AS total_employees 
FROM employees 
GROUP BY city;

--7. GROUP BY and ORDER BY - Group employees by department, calculate the average salary in each department, and order the results in descending order of average salary.
SELECT department, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department 
ORDER BY avg_salary DESC;

--8. HAVING Clause - Find departments where the total salary paid exceeds 100,000.
SELECT department, SUM(salary) AS total_salary 
FROM employees 
GROUP BY department 
HAVING SUM(salary) > 100000;

--9. Combining GROUP BY, HAVING, and ORDER BY -  List cities where more than one employee works, ordered by the number of employees in descending order.
SELECT city, COUNT(*) AS employee_count 
FROM employees 
GROUP BY city 
HAVING COUNT(*) > 1 
ORDER BY employee_count DESC;

--10. Combining Aggregate Functions - Find the department with the highest average salary.
SELECT department, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department 
ORDER BY avg_salary DESC 
LIMIT 1;