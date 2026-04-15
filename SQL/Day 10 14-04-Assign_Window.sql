###########################################  Window Function  ##################################################
###########################################  Window Function  ##################################################
use new_one;

-- Ranking Functions:

-- 1) Find the top 3 highest paid employees in each department using RANK().
with high_sal as (
		select employee_id,first_name,department_id,salary,rank() over(partition by department_id order by salary desc) as_sal
        from employees)
select employee_id,first_name,department_id,salary,as_sal
from high_sal
where as_sal < 4;

## ====================================================================================================
-- Assign a unique row number to each employee within their department using ROW_NUMBER() based on salary descending.
with salary_desc as (
		select employee_id,first_name,salary,row_number() over(partition by department_id order by salary desc) as_rank
        from employees
)
select employee_id,first_name,salary,as_rank
from salary_desc;

## ====================================================================================================
-- List departments where at least two employees share the same salary rank using DENSE_RANK().
with share_sal as (
		select employee_id, department_id, salary, dense_rank() over (partition by department_id order by salary desc) as_sal
		from employees
)
select distinct department_id
from share_sal
group by department_id,as_sal
having count(*) >=2;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Divide employees into 4 equal salary groups using NTILE(4) and display the group number along with employee details.
with grp as(
		select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID
		from employees
)
select  *,ntile(4) OVER (order by salary desc) as grp
from grp;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Find the top 3 highest paid employees in each department using RANK().
with high_sal as (
		select employee_id,first_name,department_id,rank() over(partition by department_id order by salary desc) as_high
        from employees
)
select *
from high_sal
where as_high <=3;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Assign a unique row number to each employee within their department using ROW_NUMBER() based on salary descending.
with uni_num as(
		select employee_id,first_name ,row_number() over(partition by department_id order by salary desc)
        from employees
)
select * 
from uni_num;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7 List departments where at least two employees share the same salary rank using DENSE_RANK().
with dept1 as (
		select employee_id,first_name,last_name,department_id,dense_rank() over(partition by department_id order by salary desc) as as_rank
        from employees
)
select distinct department_id, count(*) as rd
from dept1
group by department_id,as_rank
having rd >= 2;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
--  8 Divide employees into 4 equal salary groups using NTILE(4) and display the group number along with employee details.
with grp as(
		select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID
		from employees)
select *,ntile(4) over(order by salary desc)
from grp;



# =================================================================================================================
# =================================================================================================================
-- Aggregate Window Functions
## -----------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1, For each employee, show their salary and the average salary of their department using AVG() as a window function.
select employee_id, first_name, salary, department_id , avg(salary) over (partition by department_id) as avg_salary
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Show the running total of salaries for each department ordered by hire date using SUM() window function.
select  department_id , sum(salary) over (partition by department_id ) as total_sal
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Find the maximum salary in each department and compare it with each employee’s salary.
select department_id, max(salary) over (partition by department_id) as max_sal
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4. For each employee, show their salary and the average salary of their department using AVG() as a window function.
select employee_id,first_name, last_name, department_id, salary, avg(salary) over  (partition by department_id ) as avg_sal
from employees;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Show the running total of salaries for each department ordered by hire date using SUM() window function.
select  first_name, last_name, salary , department_id, salary ,hire_date , sum(salary) over (partition by department_id order by hire_date) as total_sal
from employees;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6. Find the maximum salary in each department and compare it with each employee’s salary.
select employee_id, salary, department_id, max(salary) over(partition by department_id) as_max_sal
from employees;

# =================================================================================================================
# =======================================               Value Functions          ================================================
# =================================================================================================================


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. For each employee, show their salary and the salary of the employee hired just before them using LAG().
select employee_id, first_name,salary,lag(salary) over (order by hire_date) as date1
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. Display each employee’s salary and the salary of the next hired employee in the same department using LEAD().
select employee_id, first_name,salary,lead(salary) over (order by hire_date) as lead_date
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3 List each department and show the first and last hired employee using FIRST_VALUE() and LAST_VALUE() functions.
select employee_id,  first_name, department_id, first_value(salary) over (partition by department_id) as first_salary,last_value(salary) over (partition by department_id) as last_salary
from employees;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4 For each employee, show their salary and the salary of the employee hired just before them using LAG().
select employee_id, first_name, hire_date,salary,lag(salary) over (order by hire_date) as prev_sal
from employees;

with lag_ex as (
	select employee_id, first_name, last_name, department_id, salary,hire_date
	from employees
)
select *,lag(salary) over (order by hire_date desc) as before_salary
from lag_ex;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5 Display each employee’s salary and the salary of the next hired employee in the same department using LEAD().
with all_detail as (
		select employee_id,first_name,last_name,salary,hire_date
        from employees
)
select *,lead(salary) over(order by hire_date) as_next_sal
from all_detail;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6 List each department and show the first and last hired employee using FIRST_VALUE() and LAST_VALUE() functions.
select employee_id,first_name,last_name,salary,hire_date,department_id,
			first_value(hire_date) over (partition by department_id) as first_date, 
            last_value(hire_date) over (partition by department_id) as last_date
from employees
