CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    department_id INT
);


CREATE TABLE employee (
  employee_id INT,
  name VARCHAR(50),
  salary FLOAT,
  department_id INT
);


INSERT INTO employee (employee_id, name, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);


# =================================================================================================================
delimiter $$
create trigger before_insert_into_employee
before insert on employee
for each row
begin
		if new.salary is null then
				set new.salary = 15000.0;
		end if;
end;;
$$
delimiter

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create trigger before_insert_into_employee
before insert on employee
for each row
begin
	-- new === this take new value 
    -- old == this take old vvalues in the table
    if new.salary is null then
		set new.salary=15000.0;
	end if;
    
end;;
$$
delimiter ;

INSERT INTO employee (employee_id, name,  department_id)
VALUES(6, 'Karen Smith', 101);

# =================================================================================================================
delimiter $$
create trigger before_dept_insert_into_employee
before insert on employee
for each row
begin
		if new.department_id is null then
				set new.department_id=100;
		end if;
end; $$ delimiter ;

INSERT INTO employee (employee_id, name)
VALUES(6, 'Karen Smith');

select * from  employee;
 
 # =================================================================================================================
 alter table employee add column email varchar(30);
 
 delimiter $$
 create trigger insert_berfore_email
 before  insert on employee
 for each row
 begin
		if new.email not like '%@%' then 
			signal SQLSTATE '45000'
					set message_text = 'Invalid email Type';
		end if;
end;; $$ delimiter ;

insert into employee (employee_id,name,email)
values (109,"Dev",'asc');
# 11:35:43	insert into employee (employee_id,name,email) values (109,"Dev",'asc')	Error Code: 1644. Invalid email Type	0.000 sec

insert into employee (employee_id,name,email)
values (110,"Devdatta",'asc@');

# =================================================================================================================
delimiter $$
create trigger Insert_trigger
before insert on employee
for each row
begin
		if new.name is null then
				set new.name = 'Panda' ;
		end if;
end ;
$$ delimiter ;

# =================================================================================================================
# =================================================================================================================
# =================================================================================================================

create table employee_log (
		log_id int auto_increment Primary key,
        log_message varchar(255),
        log_timestamp timestamp default current_timestamp);

insert into employee(employee_id,name,email,salary ) values (1002,"johwn",'@',8000);

select * from employee;
select * from employee_log;
        
delimiter $$
create trigger after_employee_insert
after insert on employee
for each row
begin 
		insert into employee_log (log_message) values (concat ('a new employee is inserted id : ' , new.employee_id ));
end; $$ delimiter ;

# =================================================================================================================
create table emp_emails(
			emp_id int,
            email varchar(30)
);
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create trigger trg_email
after insert on employee
for each row
begin 
		insert into emp_emails (emp_id,email) values ( new.employee_id , concat (lower (replace(new.name,' ',' .')), '@company.com' )
        );
end $$ delimiter ;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into employee(employee_id , name) values (1003,'Chaita');
select * from emp_emails; 


# =================================================================================================================
# =================================================================================================================
# =================================================================================================================

CREATE TABLE deleted_employee(
    employee_id INT,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    deleted_by VARCHAR(100)
);

## -----------------------------------------------------------------------------------------------------------------------------------------------------------

delimiter $$
create trigger store_delete
after delete on employee
for each row
begin
		insert into deleted_employee(
			employee_id,
            name,
            salary,
            department_id,
            deleted_by
		)
         values (
					old.employee_id,
                    old.name,
					old.salary,
					old.department_id,
                    user()
			);
end $$ delimiter ;
DROP TRIGGER IF EXISTS store_delete;

## -----------------------------------------------------------------------------------------------------------------------------------------------------------
select * from deleted_employee;
delete from employee where employee_id = 109;                    

# =================================================================================================================
# =================================================================================================================
# =================================================================================================================

























# =================================================================================================================
# =================================================================================================================
# =================================================================================================================
-- cereate admin notification table

create table  admin_notifications (
		notification_id int auto_increment primary key,
        message varchar(255),
        notification_type varchar(50),
        created_at timestamp default current_timestamp
	);

delete from employee where employee_id = 5;

-- check notifications

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
delimiter $$
create trigger trg_after_delete
after delete on employee
for each row
begin
		insert into admin_notifications (message, notification_type) values (concat 
				( 'employee ' , old.name , '( ID: ', old.emplyee_id, ')', 'has been removed from the system' ), 'employee_deleted' );
end $$ delimiter ;

# =================================================================================================================

delimiter $$
create trigger sal_increment
before update on employee
for each row
begin
		-- prevent salary decrease
        if new.salary < old.salary then
				signal sqlstate '45000'
				set message_text = 'Error: salary cannot be decresed ! ';
		end if;
        
        -- prevent salary increase more than 20%
        if new.salary > (salary*1.2) then
				signal SQLSTATE '45000'
                set message_text = 'Error : salary cannot be increase more than 20%';
		end if;
end $$ delimiter ;

# =================================================================================================================
# =================================================================================================================

delimiter $$

create trigger after_salary_update
after update on employee
for each row
begin
		if old.salary <> new.salary then
				insert into salary_history (emp_id, first_name, old_salary, new_salary, department_id) 
                values (old.employee_id, old.name , old.salary, new.salary, old.department_id );
		end if;
end $$ delimiter ;


del

