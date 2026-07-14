use new_one;
show tables;
select * from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Write a query to display the job titles whose MAX_SALARY is less than or equal to 20000.Write a query to find employees with a salary greater than 5000.
select job_title
from jobs
where max_salary <= 20000;

select * 
from employees
where salary > 5000;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Write a query to display employees who do not belong to department 90.
select * 
from employees
where department_id != 90;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Write a query to find employees with a salary less than 4000.
select *
from employees
where salary < 4000;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Write a query to display employees whose COMMISSION_PCT is not null.Write a query to display employees whose MANAGER_ID is null.


-- Write a query to find employees in departments with IDs greater than 50.
-- Write a query to display the employees with DEPARTMENT_ID equal to 90.
-- Write a query to display employees in department ID 100, 200, or 300.
-- Write a query to display jobs where MAX_SALARY is greater than or equal to 10000.
-- Write a query to find departments where the location is 1700
-- Write a query to find countries where REGION_ID is greater than or equal to 2.
-- Write a query to find employees whose MANAGER_ID is less than 103.
-- Write a query to find employees whose SALARY is greater than or equal to 8000.
-- Write a query to find employees in departments with IDs less than or equal to 60
-- Write a query to find employees whose SALARY is between 4000 and 8000.
-- Write a query to display the job titles where the minimum salary is greater than 6000.
-- Write a query to find employees whose salary is not equal to 5000.
-- Write a query to display departments whose MANAGER_ID is not 0.
-- Write a query to display the countries where REGION_ID is not equal to 2.
-- Write a query to find employees whose salary is exactly 6000.
-- Write a query to display employees where SALARY is greater than 10000 or DEPARTMENT_ID is 60.
-- Write a query to find employees whose salary is less than or equal to 3000.
-- Write a query to display employees where the DEPARTMENT_ID is equal to 60 and the MANAGER_ID is greater than 102.
-- Write a query to display employees where DEPARTMENT_ID is 100 and SALARY is greater than 10000.
-- Write a query to display departments where the DEPARTMENT_ID is not in (60, 70, 80).
-- Write a query to display job titles where the minimum salary is not less than 5000.
-- Write a query to find employees whose department ID is not equal to 100 or 60.
-- Write a query to display employees where LAST_NAME ends with 'son'.
-- Write a query to display employees with FIRST_NAME starting with 'J' using the LIKE operator.
-- Write a query to display employees where SALARY is greater than 8000 and DEPARTMENT_ID is 90.
-- Write a query to display jobs where the MIN_SALARY is less than 5000 or MAX_SALARY is greater than 20000.
-- Write a query to display employees where SALARY is greater than 6000 and DEPARTMENT_ID is either 50 or 60.
-- Write a query to display countries where COUNTRY_NAME starts with 'C' and REGION_ID is greater than 1.
-- Write a query to display employees where FIRST_NAME contains 'an' and SALARY is greater than 4000.
-- Write a query to display departments where the location is either 1700 or 1800 using the IN operator.
-- Write a query to display employees where FIRST_NAME starts with 'A' and LAST_NAME contains 'son'.
-- Write a query to display employees where SALARY is greater than 5000 or DEPARTMENT_ID is 100.
-- Write a query to display countries where COUNTRY_NAME does not start with 'A' and REGION_ID is greater than 1.
-- Write a query to find employees who work in departments with DEPARTMENT_ID greater than 50 and earn more than 7000.
-- Write a query to display employees whose salary is either greater than 10,000 or less than 3,000.
-- Write a query to display employees whose salary is greater than 6000 and COMMISSION_PCT is null or less than 0.2.
-- Write a query to display employees whose hire date is within the last 10 years.
-- Write a query to display employees who either belong to department 50 or have a salary greater than the average salary of their department.
-- Write a query to find all countries where the REGION_ID is greater than 2 but not equal to 4.
-- Write a query to display all employees where SALARY is not in the range of 5000 to 10000.
-- Write a query to display employees whose HIRE_DATE is not between '1995-01-01' and '2005-12-31'.
-- Write a query to display employees who earn a salary greater than 5000 but are not in department 50
-- Write a query to display employees whose salary is either greater than 10,000 or less than 3,000 but not equal to 7,000
-- Write a query to display job titles where the minimum salary is greater than 5000 or the maximum salary is less than 15,000.
-- Write a query to find jobs where the minimum salary is at least half of the maximum salary.
-- Write a query to display employees who were hired after '1990-01-01' and have a MANAGER_ID greater than 100.
-- Write a query to display employees where SALARY is greater than 10000 and the JOB_ID is either 'IT_PROG' or 'ST_CLERK'.
