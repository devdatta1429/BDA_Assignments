########################################
# ====================================  Stored Functions  ===============================================

use new_one;
delimiter $$
create function to_get_emp_details(emp_id int)
returns varchar (100)
deterministic
begin
		declare f_name varchar(100);
        select concat(first_name,' ',last_name) into f_name
        from employees where employee_id = emp_id;
        return f_name;
end;;
$$ delimiter ;

select to_get_emp_details (100);


## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Annual_salary

delimiter $$
create function emp(emp_id int)
returns decimal(15,2)
deterministic
begin
		declare ann_inc decimal(15,2);
        select salary*12 into ann_inc
        from employees where employee_id=emp_id;
        return ann_inc;
end;;
$$ delimiter ;

select emp(100);

# =================================================================================================================
## find number of employees - by department_id

delimiter $$
create function count_no_emp(dept_id int)
returns int
deterministic
begin
		declare number_of_emp int;
        select count(*) into number_of_emp
        from employees where department_id = dept_id
        group by department_id;
		return number_of_emp;
end;;
$$ delimiter ;

select count_no_emp(10);

# =================================================================================================================

delimiter $$
create function to_get_emp_id_incr (emp_id int, incre decimal (8, 2))
returns decimal(10,2)
deterministic
begin
		declare incr_sal decimal(10,2);
        select salary+(salary*incre) into incr_sal
        from employees where employee_id = emp_id;
        return incr_sal;
end;;
$$ delimiter ;

select employee_id,first_name,salary ,to_get_emp_id_incr(101,0.20) as incremenT_salary
from employees
where employee_id=101;

# =================================================================================================================

-- pass the empl-id and increment in the salary , fetch salary 
delimiter $$
create function to_get_emp_id_expr(join_date date)
returns varchar(100)
deterministic
begin
    declare yr_ex int;

    set yr_ex = timestampdiff(year, join_date, curdate());

    if yr_ex >= 10 then
        return concat(yr_ex, ' senior emp');
    elseif yr_ex >= 5 then
        return concat(yr_ex, ' mid level exp');
    else
        return concat(yr_ex, ' new join');
    end if;

end $$ delimiter ;


select to_get_emp_id_expr('1987-09-9');

select 
    department_id,
    group_concat(to_get_emp_id_expr(hire_date) separator '-') as hire_band
from employees
group by department_id;

-- Error Code: 1418. 
-- This function has none of DETERMINISTIC, 
-- NO SQL, or READS SQL DATA in 
-- its declaration and binary logging is 
-- enabled (you *might* want to use the less 
-- safe log_bin_trust_function_creators variable)
drop function to_get_emp_id_expr;

select hire_date into hire_dt from employees;

# =================================================================================================================
## get department current budget

delimiter $$ --                                        to understand mysql it is a one code
create function curr_bud(value1 int)
returns decimal (10,2)
deterministic
begin --                                             {
		declare budget decimal (10,2);  --    variable int x =9;
        select sum(salary) into budget    --  value assigning value into variable (assign = operator)
        from employees
        where department_id = value1
        group by department_id;
        return budget;
end;; $$ delimiter ;                            -- }

select curr_bud(80);
select curr_bud(90);
select curr_bud(100);

select department_id,curr_bud(department_id) as asd
from employees
group by department_id
order by asd desc;

# =================================================================================================================
-- get department_name and employee_name
use new_one;

delimiter $$
create function ret_name(id int, dept_id int)
returns varchar(20)
deterministic
begin
		declare name1 varchar(20) default ' ';
        declare dept_name varchar(20) default ' ';
        
        select e.first_name, d.department_name into name1,dept_name
        from employees e join departments d on e.department_id = d.department_id
        where e.employee_id = id and d.department_id = dept_id
        limit 1;
        
        return concat(name1,"  ",dept_name);
end $$ delimiter ;

drop function ret_name;

select ret_name(100,90);



# =================================================================================================================
# =================================================================================================================
#                                                                                                                    Stored Procedure
# =================================================================================================================
# =================================================================================================================
delimiter $$

create procedure read_all_emp()
deterministic
begin
		select * from employees;
end$$
delimiter ;

call read_all_emp();

# =================================================================================================================
delimiter $$
create procedure get_all_emp_id_details(in emp_id int)
begin
		select * 
        from employees 
        where employee_id = emp_id;
end
$$ delimiter ;

call get_all_emp_id_details(100);

# =================================================================================================================
delimiter $$
create procedure all_emp(in dept_id int)
begin
		select *
        from employees
        where department_id = dept_id;
end
$$ delimiter ;

 drop procedure all_emp;
call all_emp(90);

# =================================================================================================================
CREATE TABLE students (
    st_id INT PRIMARY KEY,
    s_name VARCHAR(50),
    marks INT
);

delimiter $$
create procedure insert_in_student (in st_id int , in s_n varchar(50), in m int)
begin
	insert into students values (st_id,s_n,m);
end
$$ delimiter ;

call insert_in_student(11, "ABC", 70);

select * from students;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update
delimiter $$
create procedure update_students(in in_st_id int , in s_n varchar(50), in m int)
begin
		update students set s_n=s_n, m=m where st_id=in_st_id;
end
$$ delimiter ;

# =================================================================================================================
delimiter $$
create procedure emp_detail_using_dept_name(
			in emp_id int , out full_name varchar(50), out sal float(10,2) , out dept_name varchar(50))
begin
		 select concat(first_name, ' ', last_name), salary ,department_name into full_name,sal , dept_name
         from employees e join departments d on d.department_id = e.department_id
         where e.employee_id  = emp_id;
end
$$ delimiter ;

call emp_detail_using_dept_name(101,@full_name,@sal,@dept_name);

select @full_name as full_name, @sal as salary, @dept_name as department;

# =================================================================================================================

delimiter $$
create procedure dept_name_city (in dept_id int, out dept_name varchar(50) , out c_name varchar(50))
begin 
		select department_name ,city into dept_name,c_name
        from departments d join locations l on l.location_id= d.location_id 
        where d.department_id = dept_id;
end
$$ delimiter ;
   
drop procedure dept_name_city;
   
call dept_name_city(20,@dept_name , @c_name);
select @dept_name , @c_name;

# =================================================================================================================

delimiter $$
create procedure emp_dep_inout( inout emp_id int, out dept_id int, out full_name varchar(50))
begin
		select concat(first_name,'  ', last_name),department_id into full_name,dept_id
        from employees where employee_id = emp_id;
end $$ delimiter ;

set @emp_id = 101;
call emp_dep_inout(@emp_id, @dept_id, @full_name);
select @emp_id as employee_id, @dept_id as department_id, @full_name as full_name;

# =================================================================================================================

 -- view
 ## in Distinct view we can not changed values
 create view emp_name_dept1 as
 select distinct department_id,employee_id, concat(first_name,'  ',last_name) as full_name, salary
 from employees; -- tricky

 select * from emp_name_dept1;
 update employees set first_name='ABC' where employee_id = 100;

# =================================================================================================================
 create view emp_name_dept as
 select department_id,employee_id, concat(first_name,'  ',last_name) as full_name, salary
 from employees; -- tricky
 
 update emp_name_dept set salary=80000 where employee_id=100;
 

