create database bd;

use bd;
use hr;
desc employees;
create table employee(
id int auto_increment not null unique primary key);

alter table employee add column emp_name varchar(30);

select * from employee;
desc employees;

create table employees(
emp_id int auto_increment not null unique primary key,
first_name varchar (30),
last_name varchar (30),
email varchar (50),
hire_date timestamp default current_timestamp);

drop table employees;

alter table employees rename column emp_id to employee_id;
insert into employees (employee_id,  first_name, last_name, email)values (1,'dev', 'thorat' , 'devdatta@' );

select * from employees;


-- 🟢 SECTION 1 — TABLE + CONSTRAINT QUESTIONS (Very Expected)
-- Q1 Create a table students with:

-- id (primary key)
-- name (varchar 30)
-- age (must be > 18)
-- city default = Pune

create table students (
	id int primary key,
    name varchar(30),
    age int check (age>18),
    city varchar (25) default 'Pune'
);
insert into students(id,name,age) values (1, 'dev', 19);

alter table students add column email varchar(20), add constraint chk_mail check (email like '%@%');
alter table students modify column email varchar(30);

desc students;
-- Q2 Create table employees

-- Columns:
-- emp_id (primary key auto_increment)
-- name
-- salary
-- department_id (foreign key)
create table employee1 (
		emp_id int auto_increment primary key,
        name varchar(20),
        salary decimal (7,2),
        department_id int,
        foreign key (department_id) references department(dept_id)
);

create table department (
		dept_id int,
        dept_name varchar(15)
);

insert into employee1 values (1, 'ARV' ,100.00,10);
insert into department values (10, 'sales');

select dept_name
from employee1 e join department d on e.department_id = d.dept_id
where emp_id = 1;

alter table department modify column dept_id int, add primary key (dept_id );
alter table department modify column dept_name varchar(20) not null;
desc department;

-- Q3
-- Add CHECK constraint
-- Salary must be greater than 5000

alter table employee1 add column salary1 decimal(10,2) check (salary1 > 5000);

-- Q4

-- Add column email to employees table
alter table employee1 add column email1 varchar(20);
-- Q5

-- Rename column name to emp_name
alter table employee1 rename column email0 to email;
desc employee1;
-- Q6

-- Drop primary key from table
alter table employee drop primary key;

-- 🟡 SECTION 2 — SELECT + FILTERING QUESTIONS
-- Q7

-- Display all employee names and salaries

-- Q8

-- Display employees with salary > 5000

-- Q9

-- Display employees working in department 90

-- Q10

-- Display employees whose salary is between 5000 and 15000

-- Q11

-- Display employees working in department 10, 20, 30

-- (use IN)

-- Q12

-- Display employees whose name starts with 'A'
select first_name
from employee1
where first_name like 'A%'
;

-- Q13
-- Display employees whose name ends with 'n'
select first_name
from employee1
where first_name like '%n'

;

-- Q14

-- Display employees whose name contains 'ar'
select first_name
from employee1
where first_name like '%ar%'
;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 🟠 SECTION 3 — ORDER BY + DISTINCT + LIMIT
-- Q15 Display employees sorted by salary descending
select *
from employee1
order by salary desc;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q16 Display employees sorted by department then salary
select * 
from employee1
order by department and salary;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q17 Display top 5 highest paid employees
select fisrt_name
from employee1
order by salary desc
limit 5;

## ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q18 Display distinct department IDs
select distinct dept_id
from employee1;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 🔵 SECTION 4 — AGGREGATE FUNCTIONS (Very Important)
-- Q19 Find total number of employees
select count(*)
from employee;

## ---------------------------------- -------------------------------------------------------------------------------------------------------------------------
-- Q20 Find maximum salary


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q21 Find minimum salary


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q22 Find average salary


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q23 Find total salary payout

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Q24 Count employees in department 90

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- 🟣 SECTION 5 — GROUP BY QUESTIONS (Exam Favorite ⭐)
-- Q25

-- Find number of employees per department

-- Q26

-- Find average salary per department

-- Q27

-- Find maximum salary per department

-- Q28

-- Find departments having more than 5 employees

-- (use HAVING)

-- Q29

-- Find departments whose average salary > 10000

-- 🔴 SECTION 6 — NULL HANDLING QUESTIONS
-- Q30

-- Find employees without commission

-- Q31

-- Find employees having commission

-- 🟤 SECTION 7 — SUBQUERY QUESTIONS (Very Important ⭐⭐⭐)
-- Q32

-- Find employees earning above average salary

-- Q33

-- Find employee with highest salary

-- Q34

-- Find employees earning lowest salary

-- Q35

-- Find employees working in department located in USA

-- (use subquery with IN)

-- Q36

-- Find employees earning more than department average salary

-- (correlated subquery)

-- VERY IMPORTANT QUESTION

-- ⚫ SECTION 8 — DERIVED TABLE QUESTIONS
-- Q37

-- Find departments whose average salary > 5000

-- (using derived table)

-- 🔶 SECTION 9 — WINDOW FUNCTION QUESTIONS (High Scoring ⭐⭐⭐⭐⭐)
-- Q38

-- Display employee salary with company average salary

-- (use window function)

-- Q39

-- Display department-wise average salary using window function

-- Q40

-- Display employee count per department using window function

-- 🟩 SECTION 10 — ROW_NUMBER() QUESTIONS
-- Q41

-- Assign row number to employees ordered by salary

-- Q42

-- Find highest salary employee per department

-- (using ROW_NUMBER)

-- VERY EXPECTED QUESTION

-- 🟨 SECTION 11 — RANK() / DENSE_RANK()
-- Q43

-- Rank employees based on salary

-- Q44

-- Find top 3 highest salary employees using DENSE_RANK

-- 🟦 SECTION 12 — RUNNING TOTAL QUESTIONS
-- Q45

-- Calculate running salary total ordered by employee_id

-- Q46

-- Calculate department-wise running salary total

-- 🟥 SECTION 13 — THEORY QUESTIONS (Must Prepare)

-- These almost always appear:

-- Q47

-- Difference between

-- CHAR vs VARCHAR

-- Q48

-- Difference between

-- DELETE vs TRUNCATE vs DROP

-- Q49

-- Difference between

-- WHERE vs HAVING

-- Q50

-- Difference between

-- PRIMARY KEY vs FOREIGN KEY

-- Q51

-- Difference between

-- GROUP BY vs WINDOW FUNCTION

-- 🏆 MOST IMPORTANT QUESTIONS TO SOLVE FIRST (If Short on Time)

-- Solve these today first:

-- ⭐ Q10
-- ⭐ Q12
-- ⭐ Q19
-- ⭐ Q25
-- ⭐ Q29
-- ⭐ Q32
-- ⭐ Q36
-- ⭐ Q39
-- ⭐ Q42
-- ⭐ Q44

-- These alone cover 60–70% exam probability.

-- If you want, I can generate a 1-hour mock test (exact CDAC-style paper) so you can simulate the real exam tonight.

-- Save as PDF

delimiter $$
create function total_amt(dept int)
returns decimal(10,2)
deterministic
begin
		declare budget decimal(10,2);
        select sum(salary) into budget
        from employees e
        where e.department_id=dept;
        return budget;
end;;
$$ delimiter ;

select total_amt(10);


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure total_amt(in sal int)
begin
	select sum(salary) 
    from employees e
    where e.department_id= sal;
end $$ delimiter ;

call total_amt(10);

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create procedure total_sal(in dept_id int, out First_name varchar(10))
begin
		select first_name into First_name
        from employees e
        where e.department_id = dept_id;
end $$ delimiter ;

call total_sal(10, @first_name);

select @first_Name;


## -----------------------------------------------------------------------------------------------------------------------------------------------------------


