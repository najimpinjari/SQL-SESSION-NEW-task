use piramalemployee

--Aggregate functions in sql 
SELECT
    department,
    COUNT(employee_id) AS total_employees, --it will count the total number of employee
    AVG(salary) AS average_salary,--it will return average salary of salary column 
    SUM(salary) AS total_salary,  -- it will return total amount of salary
    MIN(salary) AS min_salary-- it will return minimym salary of salary column 
	max(salary) as max_salary --it will return maximym salary of salary column





