create database new_one;
use new_one;
#====================== Numeric ==========================

create table employee_num(
emp_id int,
emp_name varchar(10),
salary float,
bonus decimal
);

insert into employee_num values(1,"dev",500.00,10.0);
select * from employee_num;

insert  into employee_num values(2,"sujal",600,20);

select salary,salary/0 from employee_num;
## it will set a value as null fro salary/0.

##========================= Date and Time ===================================
create table emp_date(
emp_id int,
emp_name varchar(30),
dob date,
doj datetime,
login_time timestamp,
logout_time timestamp,
exp_yrs year
);

insert into emp_date values(12,"soham","2000-09-26","2026-02-25 08:00:00",now(),now(),6);
select * from emp_date;

insert into emp_date values(12,"soham","2000-09-26","2026-02-25 08:00:00",now(),'2026-04-04 05:00:00',6);

select now(),curdate(),curtime(),utc_timestamp();
select now();
select curdate();
select curtime();
select utc_timestamp;

select year(dob),date(dob),month(dob),day(dob),dayname(dob)
from emp_date;

select hour(doj),minute(doj),second(doj)
from emp_date;

#----------------------- diff ------------------------------------------

select timestampdiff(year,dob,now()) from emp_date;

select datediff(curdate(),dob)/365 as age 
from emp_date;

-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE emp_date 
-- SET DOB = "2003-06-29" 
-- WHERE emp_id = 12;

-- SET SQL_SAFE_UPDATES = 1; -- Turn it back on when done

-- =========================== Virtual =============================

create table to_virtual(
f_name varchar(30),
l_name varchar(30),
full_name varchar(100) generated always as (concat(f_name," ",l_name)) virtual
);

insert into to_virtual(f_name,l_name) values("devdatta","Thorat");
select * from to_virtual;

-- =========================================================================================
create table to_virtual1(
f_name varchar(30),
l_name varchar(30),
dob date,
today date default (curdate()),
full_name varchar(100) generated always as (concat(f_name," ",l_name)) virtual,
age int generated always as (datediff(today,dob)) virtual
);

insert into to_virtual1(f_name,l_name,dob) values("Devdatta","Thorat","2003-06-29");
select * from to_virtual1;


-- ======================================lunch uploaad========================================

create table to_virtual2(
f_name varchar(30),
l_name varchar(30),
dob date,
doj date,
-- today date default (curdate()),
full_name varchar(100) generated always as (concat(f_name," ",l_name)) virtual,
age int generated always as (datediff(doj,dob)/365) virtual,
salary int,
bonus int,
increment decimal(4,2),
new_salary int generated always as (salary+((salary+bonus)*increment)) virtual
);

-- ============================ json ==================================

create table to_virtual_json(
f_name varchar(30),
l_name varchar(30),
dob date,
doj date,
-- today date default (curdate()),
full_name varchar(100) generated always as (concat(f_name," ",l_name)) virtual,
age int generated always as (datediff(doj,dob)/365) virtual,
salary int,
bonus int,
increment decimal(4,2),
new_salary int generated always as (salary+((salary+bonus)*increment)) virtual,
skills json
);

insert into to_virtual2 (f_name,l_name,dob,doj,salary,bonus,increment) 
values("devdatta", "thorat" , "2003-06-29" ,"2026-02-26" ,25000,2000,15);

select * from to_virtual2;
insert into to_virtual_json (f_name,l_name,skills) 
values("dev","thorat",'{"skills":["python","sql"],"certifcation":["hackerrank","leetcode"],"edu":"cdac"}');

select * from to_virtual_json;

select full_name, skills ->> '$.skills[0]' as skill, skills ->> '$.edu' as education from to_virtual_json;

-- ===========================================================================================

create table json_new(
f_name varchar(10),
l_name varchar(10),
skills_set json
);

insert into json_new (f_name,l_name,skills_set) values ("arv","sonakr",'{"tv":["LG","Sony"],"laptop":["lenovo","Asus"]}');

select f_name,skills_set ->> '$.tv[1]' as tv ,skills_set ->> '$.laptop[0]' as luptup from json_new;


