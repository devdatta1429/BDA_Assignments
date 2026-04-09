use hr;

select * from employees;

alter table employees add column up_salary int ;
update employees set up_salary = salary*12;
# 10:42:01	update employees set up_salary = salary*12	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec


alter table employees change column up_salary incremented_salary int;
alter table employees rename column up_salary to incremented_salary;

desc employees;
# ================================================================================
create table sample_emp1 select * from employees;

#alter table sample_emp1 add column 
insert into sample_emp1 select * from employees;

truncate sample_emp1;

select * from employees;
desc employees;

select * from sample_emp1;
desc sample_emp1;
# =============================================================================

alter table sample_emp1 change column phone_number phone_number int
check(length(phone_number)=10);
desc sample_emp1;

-- insert into-- 
desc employees;
alter table sample_emp1 add constraint pk_emp_id primary key(employee_id);

desc sample_emp1;
show indexes from sample_emp1;
alter table sample_emp1 drop primary key , add constraint pk_email primary key(email);

-- alter a table
select * from employees;
desc sample_emp1;

select * from sample_emp1;
desc sample_emp1;

alter table sample_emp1 rename to emp_1;
show tables; 
# ======================== GPT insertion =========================================
INSERT INTO sample_emp1 (
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EMAIL, 
    HIRE_DATE, 
    JOB_ID, 
    SALARY, 
    COMMISSION_PCT, 
    MANAGER_ID, 
    DEPARTMENT_ID
)
SELECT 
    EMPLOYEE_ID, 
    FIRST_NAME, 
    LAST_NAME, 
    EMAIL, 
    HIRE_DATE, 
    JOB_ID, 
    SALARY, 
    COMMISSION_PCT, 
    MANAGER_ID, 
    DEPARTMENT_ID 
FROM employees;
# ==================================================================================
### when one column have auto increment with primary key. 

create table emp_auto(
id int auto_increment primary key,
e_name varchar(20));














# =======================================================================================
#                        
-- DDDDD    M      M   L
-- D    D   M M  M M   L
-- D    D   M   M  M   L
-- D    D   M      M   L
-- DDDDD    M      M   LLLLL

select * from employees;

-- ex1
update employees set email="steven@gmail.com"
where employee_id = 100;

-- ex 2
update employees set email='neena@gmail.com', hire_date=curdate()
where employee_id=101;

-- ex 3
update employees set salary = salary + 25000; 
update employees set salary = salary - 25000;

-- ex 4======================== IMP 
update employees set salary= salary*1.15
where timestampdiff(year, curdate(),hire_date)<=20;

select timestampdiff (year,hire_date,curdate()) from employees;
select timestampdiff(year,curdate(),hire_date) from employees ;

select * from employees where timestampdiff(year,curdate(),hire_date)<=20;

-- EX 5

update employees set job_desc = "working in IT", hire_date = curdate()
where department_id in (90,100,40,70);


-- ex 6

select * from employees;

UPDATE employees SET avl = 'non-active' 
WHERE COMMISSION_PCT = 0.0 AND avl = 'active';

#=====================================================================
create table emp_update select * from  employees;
truncate emp_update;
desc emp_update;

alter table emp_update modify email varchar(50) null,modify phone_number int null;
alter table emp_update add primary key(employee_id);

insert into emp_update(employee_id,phone_number,last_name,email,hire_date,job_id)values(101,123,'a','a@',"1987-07-11",'ag');
insert into emp_update(employee_id,phone_number,last_name,email,hire_date,job_id)values(102,12,'a',null,"1987-09-11",'hh');

select *from emp_update;

update emp_update set email=concat(employee_id,last_name,'@gmail.com')
where email is null or email = ' ';
