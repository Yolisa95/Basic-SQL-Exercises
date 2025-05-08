--1. SELECT Statement - Retrieve all columns from the employees table. 
SELECT * 
FROM employees;

--2. SELECT DISTINCT Statement - Find all the unique departments in the employees table. 
SELECT DISTINCT department 
FROM employees;

--3. ORDER BY Statement - Retrieve all employees' first and last names, ordered by salary in descending order. 
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC;

--4. LIMIT Statement - Retrieve the top 5 highest-paid employees. 
SELECT first_name, last_name,  salary  
FROM employees  
ORDER BY salary DESC  
LIMIT 5; 

--5. WHERE Statement - Find employees who work in the IT department. 
SELECT first_name, last_name, department  
FROM employees  
WHERE department = 'IT'; 

--6. AND Statement - Find employees who work in the Finance department AND have a salary greater than 58,000. 
SELECT first_name,  last_name, department,  salary  
FROM employees  
WHERE department = 'Finance'  AND salary > 58000; 

--7. OR Statement - Find employees who work in the HR department OR the Marketing department. 
SELECT first_name, last_name,  department  
FROM employees  
WHERE department = 'HR' OR department = 'Marketing'; 

--8. NOT Statement - Find employees who do not work in the IT department. 
SELECT first_name, last_name, department  
FROM employees  
WHERE NOT department = 'IT'; 

--9. IN Statement - Find employees who are in the HR, IT, or Finance departments. 
SELECT first_name, last_name, department  
FROM employees  
WHERE department IN ('HR', 'IT', 'Finance'); 

--10. Combining Conditions - Find employees who are in the IT department, have a salary greater than 50,000, and are located in New York.
SELECT first_name, last_name, department, salary, city  
FROM employees  
WHERE department = 'IT'  AND salary > 50000  AND city = 'New York'; 

--11. Combining WHERE, AND, and ORDER BY - retrieve the first and last names of employees who work in the Finance or Marketing department, earn more than 52,000, and order the results by salary in descending order.
SELECT first_name, last_name, department, salary  
FROM employees  
WHERE (department = 'Finance' OR department = 'Marketing')  AND salary > 52000  
ORDER BY salary DESC;

--12. Combining SELECT DISTINCT, WHERE, and IN - Find all the unique cities where employees work, excluding those in the IT and HR departments.
SELECT DISTINCT city  
FROM employees  
WHERE department NOT IN ('IT', 'HR'); 

--13. Combining WHERE, NOT, AND, and ORDER BY - Retrieve employees who are NOT in the Finance department, have a salary greater than 50,000, and order the results by hire date in ascending order.
SELECT first_name,  last_name,  department,  salary, hire_date  
FROM employees  
WHERE department != 'Finance'  AND salary > 50000  
ORDER BY hire_date ASC; 

--14. Combining WHERE, OR, IN, and LIMIT - Find the first 3 employees who work in either Chicago or Los Angeles and belong to the IT or Marketing department.
SELECT first_name, last_name, department, city  
FROM employees  
WHERE city IN ('Chicago', 'Los Angeles')  AND department IN ('IT', 'Marketing')  
LIMIT 3; 

--15. Combining WHERE, AND, OR, NOT, ORDER BY, and LIMIT 
SELECT first_name,  last_name, department, salary, city  
FROM employees  
WHERE (department = 'IT' OR department = 'Finance')  AND city != 'San Francisco'  AND salary > 55000  
ORDER BY salary DESC  
LIMIT 5; 