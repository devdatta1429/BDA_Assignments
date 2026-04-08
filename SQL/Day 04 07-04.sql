use db;

create table dept_using_cud_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_cud_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_cud_fk_ex(dept_id) 
    on update cascade
    on delete cascade
);

insert into dept_using_cud_fk_ex(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_using_cud_fk_ex(emp_name,p_id ,department_id)
values
('A','P_02',3),
('B','P_02',1),
('AA','P_03',1),
('BB','P_03',3);

select * from dept_using_cud_fk_ex;
select * from emp_using_cud_fk_ex;

update emp_using_cud_fk_ex set department_id = 5 where department_id =1;
# 10:15:40	update emp_using_cud_fk_ex set department_id = 5 where department_id =1	
# Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db`.`emp_using_cud_fk_ex`, CONSTRAINT `emp_using_cud_fk_ex_ibfk_1` 
# FOREIGN KEY (`department_id`) REFERENCES `dept_using_cud_fk_ex` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE)	0.000 sec

update dept_using_cud_fk_ex set dept_id = 13 where dept_id = 3;

## ====================  Set Null  ====================================================================================
## Set null
create table dept_using_sn_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_sn_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_sn_fk_ex(dept_id) on delete set null
);

insert into dept_using_sn_fk_ex(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_using_sn_fk_ex(emp_name,p_id ,department_id)
values
('A','P_02',3),
('B','P_02',1),
('AA','P_03',1),
('BB','P_03',3);

select * from dept_using_sn_fk_ex; #### parent table = department
select * from emp_using_sn_fk_ex;

delete from dept_using_sn_fk_ex where dept_id =3;


## ====================  Restrict  ====================================================================================
## Restrict
create table dept_using_r_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_r_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_r_fk_ex(dept_id) on delete restrict
);

insert into dept_using_r_fk_ex(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_using_r_fk_ex(emp_name,p_id ,department_id)
values
('A','P_02',3),
('B','P_02',1),
('AA','P_03',1),
('BB','P_03',3);

select * from dept_using_r_fk_ex; #### parent table = department
select * from emp_using_r_fk_ex;

delete from dept_using_r_fk_ex where dept_id =3;
# 10:32:25	delete from dept_using_r_fk_ex where dept_id =3	
# Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`db`.`emp_using_r_fk_ex`, CONSTRAINT `emp_using_r_fk_ex_ibfk_1` 
# FOREIGN KEY (`department_id`) REFERENCES `dept_using_r_fk_ex` (`dept_id`) ON DELETE RESTRICT)	0.000 sec

# ================================== DROP ============================================
create table dept_truncate(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_truncate(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_truncate(dept_id) on delete restrict
);

select * from emp_truncate;

drop table dept_truncate;
# Error Code: 3730. Cannot drop table 'dept_truncate' referenced by a foreign key constraint 'emp_truncate_ibfk_1' on table 'emp_truncate'.

truncate table dept_truncate;
# Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint (`db`.`emp_truncate`, CONSTRAINT `emp_truncate_ibfk_1`)














