## WAQTD country_id and no. of employees working in each departmewnt that have more tahn 5 employees.
use new_one;

select country_id,count(*) no_of
from employees e inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
group by l.country_id
having no_of>5
order by no_of;

-- order of execution

-- FROM/JOIN → get the data
-- WHERE → filter rows
-- GROUP BY → group rows
-- HAVING → filter groups
-- SELECT → choose columns
-- ORDER BY → sort result

-- from --> where --> join -->  --> group by -->  having  --> select  --> order

# waqt find department with more than 5 employees and avg salar > 5000.

select * from departments;

select d.department_id ,d.department_name, count(*) no_of
from  employees e join departments d  on d.department_id = e.department_id
group by d.department_id
having no_of > 5 and avg (e.salary) > 5000;


## ====================================================================================================

## give the count of employees and avg salary per department  where department IT,finance, sales
select * from employees;

select d.department_name,count(*) as no_of_emp,avg(e.salary)
from employees e join departments d on e.department_id = d.department_id
where d.department_name in ('IT' , 'finance' , 'sales')
group by d.department_id
order by no_of_emp
;
## ====================================================================================================
## 
-- find the non executive manager who lead teams of 3 or  more employees earning above 4000 where avg salary exceed 5000

select * from employees;
select * from jobs;
select * from departments;

select e.manager_id
from employees e
WHERE e.salary > 4000
group by e.manager_id
having count(e.employee_id)>3 
			and avg(e.salary)>5000 
			and e.manager_id NOT IN (select employee_id 
												  from employees 
                                                  where job_id in ('AD_PRES', 'AD_VP')
                                                  ) ;
												
                                                
## ====================================================================================================

SELECT
    e.job_id,
    m.employee_id AS manager_id,
    COUNT(e.employee_id) AS count_emp,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    ROUND(AVG(e.salary), 2) AS avg_salary_of_dept
FROM employees e JOIN employees m ON e.manager_id = m.employee_id
			JOIN jobs j ON m.job_id = j.job_id
WHERE m.job_id NOT IN ('AD_PRES', 'AD_VP')  AND e.salary > 4000
GROUP BY e.job_id, m.employee_id, m.first_name, m.last_name
HAVING COUNT(e.employee_id) >= 3
				AND AVG(e.salary) > 5000
ORDER BY m.employee_id DESC;

## ====================================================================================================
-- as a  hr -- city level breakdown -- job_role across america 
-- each city in maerica should have distict jobs 
-- total no of employee and avg sal 
-- for cities having more than 2 employee and avg sal > 50000
-- need to exclude employee salary less than 3000.

use new_one;
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;

select l.city,r.region_name,count(e.employee_id) no_of,count(distinct e.job_id),avg(salary) avg_sal
from locations l join departments d on l.location_Id = d.location_id 
						join employees e on e.department_id  = d.department_id 
                        join countries c on l.country_id = c.country_id
                        join regions r on c.region_id = r.region_id
where c.country_id = 'us' and e.salary > 3000
group by l.city,r.region_name
having no_of > 2 and avg_sal > 5000
order by no_of;

## ====================================================================================================

select count(*) from employees
where department_id = 90;

select first_name,(select department_name 
							from departments
                            where department_id = 90) as name_of_emp_dept
from employees;

## ====================================================================================================
select concat(first_name,' ',last_name) as name, job_id, department_id
from employees
where job_id = (select job_id
					  from employees
                      where employee_id=100)
;
## ====================================================================================================


## ====================================================================================================
# find the employees working in dept located in texas
select employee_id,first_name,department_id
from employees
where department_id=( select department_id
									from departments
									where location_id in (select location_id 
																	from locations 
                                                                    where STATE_PROVINCE ='Texas'));

# -----------------------------------------------------------------------------------------------------------------------------------
select e.employee_id,e.first_name,e.department_id
from employees e join departments d on e.department_id = d.department_id
							join locations l on l.location_id=d.location_id
where l.STATE_PROVINCE ='Texas';

select * from departments;

## ====================================================================================================

## find employees we need to find department located in seatlle

select employee_id,first_name,department_id
from employees
where department_id in ( select department_id
									from departments d join locations l on l.location_id = d.location_id
                                    where l.city='Seattle');

select * from locations;

## ====================================================================================================
# we need to find employees who have have past job records
select * from job_history;

select employee_id,first_name
from employees
where employee_id in (select employee_id
									from job_history);

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select e.employee_id,e.first_name,jh.job_id
from employees e join job_history jh on e.employee_id = jh.employee_id
order by employee_id;



## ====================================================================================================
## ===========   CTE   ===================   CTE   =======================   CTE   ============================
## ====================================================================================================

with emp_grt_total_avg_sal as 
(
	select avg(salary) avg_sal from employees
)
select first_name, salary ,department_id
from employees, emp_grt_total_avg_sal s 
where salary > s.avg_sal;


-- dept >5 emp 

with more_5_emp as (
			select count(employee_id) no_of , department_id , department_id 
			from employees
			group by department_id,department_name
			) 
select distinct m.department_id, m.no_of
from departments, more_5_emp m 
where m.no_of > 5;

# ======================================================================================================================
-- find the highest slary in each dept
 with high as (
		select department_id,max(salary) as mx
		from employees
		group by department_id
	)
select first_name, salary, e.department_id 
from employees e join high h on e.department_id = h.department_id and e.salary=h.mx;

## =========================================================================
create database movie_db;

with sal_band as (
select first_name,salary,
    case
			when salary < 10000 then 'Low salary'
            when salary >= 10000 and salary < 15000 then 'mid range salary'
            when salary >= 15000 and salary < 30000 then 'high range salary'
		else 'other'
	end as salary_band
from employees
)
select count(*),salary_band
from sal_band
group by salary_band;


## ====================================================================================================
-- find the employyes who are earning more than their manager
-- cte  - manager / salary
-- emp salary > manager salary

with manager_sal as (
		select salary,employee_id
		from employees
)
select e.employee_id, e.salary, ms.employee_id as mgr_id , ms.salary as mgr_sal
from employees e join manager_sal ms on e.manager_id = ms.employee_id
where e.salary > ms.salary;

## ====================================================================================================
-- find employee who more than avg sala
-- and have been in the company more than  the avg tenure

with avg_sal as(
		select first_name,avg(salary) as sal_avg
		from employees),
    yrs_exp as (
		select year (hire_date),salary
		from employees)

select first_name,sal_avg,h_date 
from avg_sal s join yrs_exp y on y.salary > s.sal_avg
