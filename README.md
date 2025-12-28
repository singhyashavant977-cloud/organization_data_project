# 📊 Organization Employee SQL Analysis Project

## 📌 Project Overview
This project demonstrates real-world SQL data analysis using an organization-level employee dataset.
The objective is to analyze employee information such as departments, salaries, cities, and joining dates
using MySQL.

This project focuses on practical, interview-oriented SQL queries rather than theoretical examples.

---

## 🎯 Project Objectives
- Create and manage a MySQL database
- Import CSV data into relational tables
- Perform business-driven SQL analysis
- Use aggregation, subqueries, and window functions
- Practice real interview-level SQL problems

---

## 🛠️ Tech Stack
- **Database:** MySQL  
- **Tool:** MySQL Workbench  
- **Data Source:** CSV file  
- **Language:** SQL  

### SQL Concepts Used
- GROUP BY
- Aggregate functions (COUNT, SUM, AVG, MIN)
- Subqueries
- Window functions (RANK, ROW_NUMBER)
- Filtering and sorting
- Date-based conditions

---

## 📁 Dataset Details

**File Name:** `organization_employee_data_110.csv`  
**Total Records:** 110+ employees  

### Columns Description
- `employee_id` – Unique identifier for each employee  
- `name` – Employee name  
- `department` – IT, HR, Finance, Sales  
- `designation` – Job role  
- `salary` – Monthly salary  
- `city` – Work location  
- `joining_date` – Date of joining  

This dataset simulates a real organization’s HR database.

---

## 🗄️ Database Setup

### Step 1: Create Database--
```sql```
CREATE DATABASE org_project;

Step 2: Use Database--
USE org_project;

📋 Table Creation--
```
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    designation VARCHAR(100),
    salary INT,
    city VARCHAR(50),
    joining_date DATE
); 
```

📥 Data Import Process--

The CSV file is imported using MySQL Workbench → Table Data Import Wizard

Data is loaded into the employees table

Verify Data Import---
SELECT COUNT(*) FROM employees;

📊 SQL Analysis Queries
1️⃣ Total employees in each department----

``` 
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

2️⃣ Average salary by department (highest first)--
```
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

```

3️⃣ Employees working in Delhi with salary greater than 60,000--
```
SELECT name, department, salary
FROM employees
WHERE city = 'Delhi'
  AND salary > 60000;

```

4️⃣ Total salary cost per department---
```
SELECT department, SUM(salary) AS total_salary_cost
FROM employees
GROUP BY department;

```

5.5️⃣ Top 5 highest-paid employees---
```
SELECT name, department, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

```

6.6️⃣ Employees who joined after 1st January 2022---
```
SELECT name, department, joining_date
FROM employees
WHERE joining_date > '2022-01-01';

```

7.7️⃣ City-wise employee count and average salary---
```
SELECT city,
       COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY city;

```

8.8️⃣ Employees earning below the average salary of their department---
```
SELECT e.name, e.department, e.salary
FROM employees e
WHERE e.salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

```

8️⃣ Employees earning below the average salary of their department--
```
SELECT e.name, e.department, e.salary
FROM employees e
WHERE e.salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

```

9️⃣ Earliest joining employee in each department--
```
SELECT department, name, joining_date
FROM (
    SELECT department, name, joining_date,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY joining_date) AS rn
    FROM employees
) t
WHERE rn = 1;

```

🔟 Salary ranking within each department---
```
SELECT name,
       department,
       salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

```


🎯 Key Learnings----

Learned how to import and analyze real organizational data

Applied SQL for business analytics and decision-making

Used subqueries and window functions effectively

Understood best practices like using COUNT(*) instead of COUNT(column)

Improved query readability and structure

📌 Author
Yashavant Singh

