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


#===========================================================================================
create table const_ex(
s_id int primary key,
S_name varchar(30) not null
);


insert into const_ex values(1,"abc");
insert into const_ex(s_id) values (1);
# Error Code: 1364. Field 'S_name' doesn't have a default value	0.016 sec
-- ---------------------------------------------------------------------
create table const_ex1(
s_id int auto_increment primary key,
s_name varchar(30) not null,
c_name varchar(50) default "BDA"
);

insert into const_ex1(s_name) values("abc");
select * from const_ex1;

-- ---------------------------------------------------------------------------
create table const_ex2(
s_id int auto_increment primary key,
s_name varchar(30) not null,
c_name varchar(50) default "BDA",
c_start date default "2026-02-25",
log_in timestamp default current_timestamp,
login timestamp default now()
);

insert into const_ex2 (s_name)values("devdatta");
select * from const_ex2;

#==================================================================
create table const_ex3(
s_id int auto_increment primary key,
s_name varchar(30) not null,
c_name varchar(50) default "BDA",
c_start date default "2026-02-25",
log_in timestamp default current_timestamp,
login timestamp default now(),
m_num int unique
);

insert into const_ex3 (s_name,m_num)values("devdatta",9702);
select * from const_ex3;

insert into const_ex3 (s_name,m_num)values("devdatta",9702);
# Error Code: 1062. Duplicate entry '9702' for key 'const_ex3.m_num'	0.016 sec

#=====================================================================================================
create table const_ex4(
s_id int auto_increment primary key,
s_name varchar(30) not null,
c_name varchar(50) default "BDA",
c_start date default "2026-02-25",
log_in timestamp default current_timestamp,
login timestamp default now(),
m_num int,
email varchar(100),
unique(m_num,email) 

## it work like or operator
#1	devdatta	BDA	2026-02-25	2026-04-04 17:30:41	2026-04-04 17:30:41	9702	
#2	devdatta	BDA	2026-02-25	2026-04-04 17:30:52	2026-04-04 17:30:52	9702	
#3	devdatta	BDA	2026-02-25	2026-04-04 17:33:39	2026-04-04 17:33:39	9702	dev@gmail.com
#5	devdatta	BDA	2026-02-25	2026-04-04 17:34:17	2026-04-04 17:34:17		    dev@gmail.com
);


insert into const_ex4 (s_name,m_num)values("devdatta",9702);
select * from const_ex4;

insert into const_ex4 (s_name,m_num,email)values("devdatta",9702,"dev@gmail.com");
insert into const_ex4 (s_name,email)values("devdatta","dev@gmail.com");

desc const_ex4;

show indexes from const_ex4;

#/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/
create table const_ex5(
s_id int auto_increment primary key,
s_name varchar(30) not null,
age int not null check(age>21)
);

insert into const_ex5(s_name,age) values("dev",22);
insert into const_ex5(s_name,age) values("dev",12);
# Error Code: 3819. Check constraint 'const_ex5_chk_1' is violated.	0.000 sec

select * from const_ex5;

#/=/=/=/=/=/=/=/=/=/=/=/=/=/=/= IN VALUES =/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=

create table const_ex6(
s_id int auto_increment primary key,
s_name varchar(30) not null,
age int not null check(age>21),
gender char(10) check(gender in ("male","female","other"))
);

insert into const_ex6 (s_name,age) values("dev",22);
insert into const_ex6 (s_name,age,gender) values("dev",22,"male");
insert into const_ex6 (s_name,age,gender) values("dev",22,"o");
# Error Code: 3819. Check constraint 'const_ex6_chk_2' is violated.	0.000 sec

select * from const_ex6;

#/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/= AND CHECK=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=

create table const_ex7(
s_id int auto_increment primary key,
s_name varchar(30) not null,
age int not null,
gender char(10) check(gender in ("male","female","other")),
check(age>21 and length(s_name)>1)
);

insert into const_ex7(s_name,age) values("c",22);
insert into const_ex7(s_name,age) values("ch",22);
# 	Error Code: 3819. Check constraint 'const_ex7_chk_2' is violated.	0.000 sec
select * from const_ex7;

#/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/= REGEXP /=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=

create table const_ex8(
s_id int auto_increment primary key,
s_name varchar(30) not null,
age int not null,
m_num int,
gender char(10) check(gender in ("male","female","other")),
check(age>21 and length(s_name)>1),
check(m_num regexp '[0-9]')
);
  
-- ---------------------------------------------------------------------------


create table const_ex8(
zipcode int,
s_name varchar(30) not null,
address varchar(100),
primary key(zipcode, address) # composite key
);

desc const_ex8;
show index from const_ex8;
