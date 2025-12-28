CREATE DATABASE org_project;
USE org_project;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(100),
    salary INT,
    city VARCHAR(50),
    joining_date DATE
);

SELECT COUNT(*) FROM employees;



SELECT * FROM employees;



-- Below are 10 REAL-WORLD SQL project questions based on your employees table, and each question is immediately followed by its SQL answer, exactly in the sequence you asked:
-- Question → Answer



-- Q1. Find the total number of employees in each department.
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Q2. Find the average salary of employees in each department, sorted by highest average salary first.
SELECT department, avg(SALARY) AS AVG_SALARY
FROM employees
GROUP BY department
ORDER BY AVG_SALARY DESC;


-- Q3. List all employees who work in Delhi and earn more than 60,000.

SELECT name, department,designation
FROM employees WHERE CITY="DELHI" 
AND SALARY>60000;


-- Q4. Find the total salary cost for each department (company cost analysis).

SELECT department ,sum(salary) as salary_cost 
FROM employees 
GROUP BY department;


-- Q5. Retrieve the top 5 highest-paid employees.
SELECT NAME,DEPARTMENT,DESIGNATION ,CITY ,SALARY FROM employees 
ORDER BY SALARY DESC LIMIT 5;


-- Q6. Find all employees who joined after 1st January 2022.
SELECT name, department, joining_date
FROM employees
WHERE joining_date > '2022-01-01';


-- Q7. Find the number of employees and average salary in each city.
SELECT CITY, COUNT(NAME) AS TOTAL_EMPLOYEES,
AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES
GROUP BY CITY;



-- Q8. Find employees whose salary is below the average salary of their department.
SELECT e.name, e.department, e.salary
FROM employees e
WHERE e.salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);


-- Q9. Find the earliest joining employee in each department.
SELECT department,
       MIN(joining_date) AS earliest_joining_date
FROM employees
GROUP BY department;


-- Q10. Rank employees in each department based on salary (highest salary first).
SELECT name,
       department,
       salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;





