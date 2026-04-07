## ============================ 06 - 06- 2026 =============================================

use db;

create  table dept_ex(
dept_id int auto_increment primary key,
dept_name varchar(50),
emp_id int,
project_id varchar(20)
);
create table emp_ex(
emp_id  int auto_increment primary key,
emp_name varchar(30),
p_id varchar (30),
department_id int,
foreign key(department_id) references dept_ex(dept_id)
);

desc  dept_ex;
desc emp_ex;

show indexes from dept_ex;
show indexes from emp_ex;

INSERT INTO dept_ex (dept_name, project_id) VALUES ('HR', 'PROJ_ALPHA'), ('IT', 'PROJ_BETA'), ('Finance', 'PROJ_GAMMA');

insert into emp_ex(emp_name,p_id,department_id)values("A","P_01",3),("B","P_02",2);

select * from emp_ex;
select * from dept_ex;

## -------------------------------------------------------------------------------------------------------

create table emp(
id int,
name1 varchar(20),
dept_id int);

create table dept(
year1 int,
dept1 varchar(30),
location int);

INSERT INTO dept (dept1, year1) VALUES ('HR', 2003), ("IT", 2004), ("Finane",2001);

insert into emp(id,name1,dept_id)values(11,"P_01",3),(12,"P_02",2);

select * from dept;
select * from emp;

##---------------------------------------------------------
create table dept_uc(
    dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_uc(
emp_id int,
emp_name varchar(20),
p_id varchar (30),
department_id int,
foreign key(department_id) references dept_uc(dept_id)
on update cascade
);

INSERT INTO dept_uc (dept_name, year1) VALUES ("HR", 2003), ("IT", 2004), ("Finane",2001);

insert into emp_uc(id,name1,dept_id)values(11,"P_01",3),(12,"P_02",2);

select * from dept_uc;
select * from emp_uc;
