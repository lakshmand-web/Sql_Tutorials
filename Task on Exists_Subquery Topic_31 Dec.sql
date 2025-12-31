-- Create an Employee table
CREATE TABLE Employe (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert data into the created table
INSERT INTO Employe VALUES
(1, 'Amit', 'HR', 40000),
(2, 'Riya', 'HR', 45000),
(3, 'Neha', 'HR', 50000),
(4, 'Rahul', 'HR', 55000),

(5, 'Suresh', 'IT', 60000),
(6, 'Anita', 'IT', 65000),
(7, 'Vikram', 'IT', 70000),
(8, 'Pooja', 'IT', 75000),
(9, 'Karan', 'IT', 80000),

(10, 'Meena', 'Sales', 30000),
(11, 'Rohit', 'Sales', 35000),
(12, 'Nisha', 'Sales', 40000);

-- Retrieve all the inserted data from the table
SELECT * FROM Employe;

-- Task on EXISTS and subquery commands

-- Question:

-- Find the maximum salary of an employee that is greater than the average salary,and use the EXISTS concept.

-- Step 1: Find the average salary of employees in the table

SELECT AVG(salary) 
FROM Employe;

-- Step 2: Write a subquery to find employees whose salary is greater than the average salary

SELECT emp_name
FROM Employe
WHERE salary > (SELECT AVG(salary) FROM Employe);

-- Step 3: Verify that such data exists in the Employee table using the EXISTS

SELECT emp_id, emp_name, salary AS Max_Salary
FROM Employe
WHERE EXISTS (
    SELECT emp_name
    FROM Employe
    WHERE salary > (SELECT AVG(salary) FROM Employe)
);
